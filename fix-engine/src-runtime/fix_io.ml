type message = (string * string) list

module Internal : sig
  type fix_io

  val start :
       ?split:char
    -> ?log_file:string
    -> recv:(message -> unit Lwt.t)
    -> Lwt_io.input_channel * Lwt_io.output_channel
    -> unit Lwt.t * fix_io

  val encode : split:char -> message -> string

  val send : fix_io -> message -> unit Lwt.t
end = struct
  let ( >>= ) = Lwt.( >>= )

  let ( let* ) = Lwt.( >>= )

  type fix_io =
    { send_box : message Lwt_mvar.t
    ; recv : message -> unit Lwt.t
    ; inch : Lwt_io.input_channel
    ; outch : Lwt_io.output_channel
    ; split : char
    ; log_file_channel : Lwt_io.output_channel option
    }

  let encode ~split msg =
    let split = String.make 1 split in
    msg
    |> List.map (fun (k, v) -> k ^ "=" ^ v)
    |> List.fold_left (fun a s -> a ^ s ^ split) ""


  let open_append s =
    let flags = Unix.[ O_WRONLY; O_APPEND; O_CREAT ] in
    Lwt_io.(open_file ~flags ~mode:output s)


  let get_time_string () =
    Current_time.get_current_utctimestamp_micro ()
    |> Encode_datetime.encode_UTCTimestamp_micro


  let logfix oc logmsg =
    let str = "[" ^ get_time_string () ^ "]: " ^ logmsg ^ "\n" in
    Lwt_io.write oc str


  (** Reading thread *)

  (* Converts [ '5'; '2'; '='; 'A' ] to ("52" , "A" ) *)
  let extract_key_value (chlist : char list) : string * string =
    let buf = Buffer.create @@ List.length chlist in
    let () = chlist |> List.iter @@ Buffer.add_char buf in
    Buffer.contents buf
    |> String.split_on_char '='
    |> function [] -> ("", "") | h :: tl -> (h, String.concat "=" tl)


  let rec get_key_value t chars =
    Lwt_io.read_char t.inch
    >>= fun c ->
    if c <> t.split
    then get_key_value t (c :: chars)
    else Lwt.return @@ extract_key_value @@ List.rev chars


  let rec get_message t msg =
    get_key_value t []
    >>= fun (k, v) ->
    let msg = (k, v) :: msg in
    if k <> "10" then get_message t msg else Lwt.return @@ List.rev msg


  let rec read_thread t : unit Lwt.t =
    let* msg = get_message t [] in
    let* () =
      match t.log_file_channel with
      | None ->
          Lwt.return_unit
      | Some oc ->
          let logmsg = encode ~split:'|' msg in
          logfix oc logmsg
    in
    let* () = t.recv msg in
    read_thread t


  (** Writing thread *)

  let rec write_thread t : unit Lwt.t =
    Lwt_mvar.take t.send_box
    >>= fun msg ->
    let wire = encode ~split:t.split msg in
    let* () =
      match t.log_file_channel with
      | None ->
          Lwt.return_unit
      | Some oc ->
          let logmsg = encode ~split:'|' msg in
          logfix oc logmsg
    in
    Lwt_io.write t.outch wire >>= fun () -> write_thread t


  let start ?(split = '\001') ?log_file ~recv (inch, outch) =
    let state =
      { inch
      ; outch
      ; split
      ; send_box = Lwt_mvar.create_empty ()
      ; recv
      ; log_file_channel = None
      }
    in
    let thread =
      let* log_file_channel =
        match log_file with
        | None ->
            Lwt.return_none
        | Some fname ->
            let* oc = open_append fname in
            let _ =
              Lwt_main.Exit_hooks.add_first (fun () ->
                  let* () = Lwt_io.flush oc in
                  Lwt_io.close oc )
            in
            Lwt.return_some oc
      in
      let state = { state with log_file_channel } in
      Lwt.pick [ read_thread state; write_thread state ]
    in
    (thread, state)


  let send state msg = Lwt_mvar.put state.send_box msg
end

include Internal
