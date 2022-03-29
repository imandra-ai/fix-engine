module Internal : sig

  type t

  type message = (string * string) list

  type err = 
    [ `MissingMessageTypeTag
    ]

  type event =
    | FIXFromEngine of message
    | State of Fix_engine_state.fix_engine_state

  type config =
    { comp_id       : string
    ; target_id     : string
    ; host_id       : string option
    ; on_behalf_id  : string option
    ; timer         : float
    ; begin_string  : string
    ; millisecond_precision : bool 
    }  
  

  val start : 
    reset:bool -> 
    session_dir:string -> 
    config:config -> 
    recv:(event -> unit Lwt.t) -> 
    unit Lwt.t * t
  
  val process_fix_wire : t -> message -> unit Lwt.t
  
  val send_fix_message : t -> message -> (unit, err) Lwt_result.t
    
  val send_internal_message : 
    t -> Fix_engine_state.fix_engine_int_inc_msg -> unit Lwt.t

  val send_get_state : t -> unit Lwt.t

end = struct

  module SessionManager : sig
    type t
    val save : t -> (int * int) -> unit Lwt.t
    val create : reset:bool -> dir:string -> t
    val get : t -> (int * int)

  end = struct

    let (>>=) = Lwt.(>>=)

    type t =
      { dir : string
      ; seqin  : int
      ; seqout : int
      }

    let read_int file = try
        let chn = open_in file in
        let num = input_line chn in
        let () = close_in chn in
        num |> int_of_string 
      with _exn -> 0

    let read_seqns dir =
      { dir
      ; seqin  = read_int Filename.(concat dir "seqin" )
      ; seqout = read_int Filename.(concat dir "seqout")
      }

    let prepare_folder dir =
      if not(Sys.file_exists dir) then
        Unix.(mkdir dir 0o775)
      else ()

    let write_int dir fname num =
      let filename = Filename.(concat dir fname) in
      Lwt_io.(open_file ~mode:output filename) >>= fun fch ->
      Lwt_io.write fch (string_of_int num) >>= fun () ->
      Lwt_io.close fch

    let save state (seqin, seqout) =
      write_int state.dir "seqin"  seqin  >>= fun () ->
      write_int state.dir "seqout" seqout

    let create ~reset ~dir =
      let () = prepare_folder dir in
      let state = read_seqns dir in
      let state = if reset then { state with seqin = 0; seqout = 0 } else state in
      state

    let get state = (state.seqin, state.seqout)

  end

  let (>>=) = Lwt.(>>=)
  let (let*) = Lwt.bind

  type message = (string * string) list

  type err = 
    [ `MissingMessageTypeTag
    ]

  type action =
    | InternalToEngine of Fix_engine_state.fix_engine_int_inc_msg
    | FIXToEngine of Full_messages.full_top_level_msg
    | GetState    

  type event =
    | FIXFromEngine of message
    | State of Fix_engine_state.fix_engine_state

  type t =
    { recv          : event -> unit Lwt.t
    ; to_engine_box : action Lwt_mvar.t
    ; timer         : float
    ; sess          : SessionManager.t
    ; begin_string  : string
    ; timestamp_parse : string -> Datetime.fix_utctimestamp_micro option
    ; timestamp_encode: Datetime.fix_utctimestamp_micro -> string
    }

  let save_state_seqns sessn state =
    let seqin = state.Fix_engine_state.incoming_seq_num in
    let seqout = state.Fix_engine_state.outgoing_seq_num in
    SessionManager.save sessn (Z.to_int seqin, Z.to_int seqout)


  (** Calls Fix_engine.one_step and pubs outgoing messages while busy *)
  let rec while_busy_loop (t:t) engine_state  =
    let cfg =  Encode_full_messages.{ 
      begin_string = t.begin_string ;
      encode_UTCTimestamp = t.timestamp_encode
    } in
    let engine_state = Fix_engine.one_step engine_state in
    (* This assumes that after one_step we can get either ontgoing internal or outgoing FIX message *)
    begin match ( engine_state.outgoing_fix_msg , engine_state.outgoing_int_msg) with
      | Some msg, None -> begin
        match msg with 
        | Full_messages.ValidMsg msg ->
          let msg = Encode_full_messages.packet_full_valid_msg cfg msg in
          t.recv ( FIXFromEngine msg )
        | _ -> Lwt.return_unit
      end
      | None, Some _ | None, None   ->
        Lwt.return_unit
      |  _ -> Lwt.fail_with "Critical internal error in fix_engine model"
    end >>= fun () ->
    save_state_seqns t.sess engine_state >>= fun () ->
    let engine_state = { engine_state with outgoing_fix_msg = None ; outgoing_int_msg = None } in
    if Fix_engine_state.engine_state_busy engine_state then
      while_busy_loop t engine_state
    else Lwt.return engine_state

  let rec main_loop t engine_state =
    let open Fix_engine_state in
    let* msg = Lwt_mvar.take t.to_engine_box in
    let* engine_state = match msg with      
      | InternalToEngine msg -> 
        let engine_state = {engine_state with incoming_int_msg = Some msg } in 
        while_busy_loop t engine_state
      | FIXToEngine msg ->
        let engine_state = {engine_state with incoming_fix_msg = Some msg } in 
        while_busy_loop t engine_state
      | GetState ->  
        let* () = t.recv ( State engine_state ) in
        Lwt.return engine_state
      in
    main_loop t engine_state

  let do_timechange t =
    let time = Current_time.get_current_utctimestamp_micro () in
    let timechange = Fix_engine_state.IncIntMsg_TimeChange time in
    let timechange = InternalToEngine timechange in
    Lwt_mvar.put t.to_engine_box timechange

  let rec heartbeat_thread t =
    Lwt_unix.sleep t.timer >>= fun () ->
    do_timechange t >>= fun () ->
    heartbeat_thread t

  type config =
    { comp_id       : string
    ; target_id     : string
    ; host_id       : string option
    ; on_behalf_id  : string option
    ; timer         : float
    ; begin_string  : string
    ; millisecond_precision : bool 
    }  

  let get_timestamp_codec ms =
    let parse_milli x =
      match Parse_datetime.parse_UTCTimestamp_milli x with None -> None
      | Some x -> Some ( Datetime.convert_utctimestamp_milli_micro x)
      in
    let encode_milli x = x
      |> Datetime.convert_utctimestamp_micro_milli 
      |> Encode_datetime.encode_UTCTimestamp_milli
      in
    if ms then ( parse_milli , encode_milli ) 
    else ( 
      Parse_datetime.parse_UTCTimestamp_micro, 
      Encode_datetime.encode_UTCTimestamp_micro
    )
    
    
  let make_engine_state (inseq, outseq) config =
    let open Fix_engine_state in
    { init_fix_engine_state with
      fe_comp_id = config.comp_id
    ; fe_sender_location_id = config.host_id
    ; fe_on_behalf_of_comp_id = config.on_behalf_id
    ; fe_target_comp_id = config.target_id
    ; fe_curr_time = Current_time.get_current_utctimestamp_micro ()
    ; fe_max_num_logons_sent = Z.of_int 10
    ; fe_application_up = true
    ; incoming_seq_num = Z.of_int inseq
    ; outgoing_seq_num = Z.of_int outseq
    }    
    

  let start ~reset ~session_dir ~(config:config) ~recv =
    let timestamp_parse, timestamp_encode = 
      get_timestamp_codec config.millisecond_precision 
      in
    let begin_string = config.begin_string in
    let sess = SessionManager.create ~reset ~dir:session_dir in
    let (inseq, outsec) = SessionManager.get sess in
    let engine_state = make_engine_state (inseq, outsec) config in
    let state =
      { to_engine_box = Lwt_mvar.create_empty ()
      ; timer = config.timer
      ; sess
      ; recv
      ; begin_string
      ; timestamp_parse
      ; timestamp_encode
      } in
    let thread = Lwt.pick
      [ heartbeat_thread state
      ; main_loop state engine_state
      ] in
    ( thread , state )


  let create_internal_message (msg : message) 
      : (Fix_engine_state.fix_engine_int_inc_msg, err) result 
    =
    let is_application_field (k,_) =
      match Parse_full_tags.parse_full_field_tag k with
      | None -> false | Some _ -> true
      in
    let is_msgtype_tag (k,_) = 
      let open Full_message_tags in
      match Parse_full_tags.parse_full_field_tag k with
      | Some ( Full_Admin_Field_Tag Full_Field_MsgType_Tag ) -> true
      | _ -> false
      in
    match List.find_opt is_msgtype_tag msg with 
    | None -> Error `MissingMessageTypeTag
    | Some msgtag_kv ->
      let app_data = List.filter is_application_field msg in
      let app_data = msgtag_kv::app_data in
      let int_msg = Fix_engine_state.IncIntMsg_ApplicationData app_data in
      Ok int_msg  


  let process_fix_wire state msg =
    let* () = Lwt_io.printl "process_fix_wire" in
    let msg = Parse_full_messages.parse_top_level_msg state.timestamp_parse msg in
    let tenc = Datetime_json.utctimestamp_micro_to_json in
    let json = Full_messages_json.full_top_level_msg_to_json tenc msg in
    let str = Yojson.Basic.pretty_to_string json in
    let* () = Lwt_io.printl str in
    let* () = do_timechange state in
    let action = FIXToEngine msg in
    Lwt_mvar.put state.to_engine_box action

  let send_fix_message state msg =
    let (let*?) = Lwt_result.bind in
    let*? int_msg = create_internal_message msg |> Lwt.return in
    let action = InternalToEngine int_msg in
    let*? () = do_timechange state |> Lwt_result.ok  in 
    Lwt_mvar.put state.to_engine_box action |> Lwt_result.ok
  
  let send_internal_message state int_msg =
    let action = InternalToEngine int_msg in
    Lwt_mvar.put state.to_engine_box action 

  let send_get_state state =
    Lwt_mvar.put state.to_engine_box GetState 


end

include Internal
