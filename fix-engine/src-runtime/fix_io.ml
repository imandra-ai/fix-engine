type message = Message.t [@@deriving show]

module Internal : sig
  type fix_io

  val start :
       ?split:char
    -> ?log_file:string
    -> recv:(message -> unit Lwt.t)
    -> Lwt_io.input_channel * Lwt_io.output_channel
    -> unit Lwt.t * fix_io

  module Read : sig
    type t

    val create : ?buf_size:int -> split:char -> Lwt_io.input_channel -> t

    val read_next_message : t -> message option Lwt.t
  end

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
    (* compute how many bytes are required *)
    let size =
      List.fold_left
        (fun n (k, v) ->
          (* add size for "k=v|" *)
          n + 2 + String.length k + String.length v )
        0
        msg
    in
    (* concatenate into a fixed size buffer *)
    let out = Bytes.create size in
    let offset = ref 0 in

    let[@inline] add_char (c : char) =
      Bytes.set out !offset c ;
      incr offset
    in
    let[@inline] add_str (s : string) =
      Bytes.blit_string s 0 out !offset (String.length s) ;
      offset := !offset + String.length s
    in

    List.iter
      (fun (k, v) ->
        add_str k ;
        add_char '=' ;
        add_str v ;
        add_char split )
      msg ;

    (* return new string *)
    assert (!offset = size) ;
    Bytes.unsafe_to_string out


  let open_append s =
    let flags = Unix.[ O_WRONLY; O_APPEND; O_CREAT ] in
    Lwt_io.(open_file ~flags ~mode:output s)


  let get_time_string () =
    Current_time.get_current_utctimestamp_micro ()
    |> Encode_datetime.encode_UTCTimestamp_micro


  let logfix oc logmsg =
    let str = Printf.sprintf "[%s]: %s\n" (get_time_string ()) logmsg in
    Lwt_io.write oc str


  (** Reading thread *)

  module Read : sig
    type t

    val create : ?buf_size:int -> split:char -> Lwt_io.input_channel -> t

    val read_next_message : t -> message option Lwt.t
  end = struct
    module B = Bytes
    module IO = Lwt_io
    open Lwt.Syntax

    type t =
      { ic : IO.input_channel
      ; split : char
      ; mutable buf : bytes
      ; mutable off : int  (** current offset in [buf] *)
      ; mutable max_off : int  (** maximum valid offset in [buf] *)
      ; mutable partial_msg : message
      }

    let create ?(buf_size = 16 * 1024) ~split ic : t =
      { split
      ; ic
      ; buf = Bytes.create buf_size
      ; off = 0
      ; max_off = 0
      ; partial_msg = []
      }


    let[@inline] is_empty (self : t) : bool = self.off = self.max_off

    let[@inline] len self = self.max_off - self.off

    (* find the next split char in the internal buffer *)
    let next_split (self : t) : int option =
      match Bytes.index_from_opt self.buf self.off self.split with
      | Some n when n >= self.max_off ->
          None
      | r ->
          r


    (* move data inside to the left, so that [self.off = 0].  This must work
       even if [not (is_empty self)] *)
    let shift_to_left (self : t) =
      let n = len self in
      assert (n >= 0) ;
      if n > 0 then B.blit self.buf self.off self.buf 0 n ;
      self.off <- 0 ;
      self.max_off <- n


    (* refill internal buffer. Returns true if at least one byte was added. *)
    let refill (self : t) : bool Lwt.t =
      shift_to_left self ;
      assert (self.off = 0) ;

      (* corner case: a single key/value pair is bigger than
         the internal buffer. Allocate bigger buffer. *)
      if self.max_off = B.length self.buf
      then (
        let new_buf = B.create (B.length self.buf * 2) in
        B.blit self.buf 0 new_buf 0 (len self) ;
        self.buf <- new_buf ) ;

      (* add more bytes starting from [self.max_off] *)
      let+ n =
        IO.read_into self.ic self.buf self.max_off (B.length self.buf - len self)
      in
      assert (n >= 0) ;
      self.max_off <- self.max_off + n ;

      n > 0


    type available_res =
      | Reached_checksum
      | Needs_more

    (* read key/value pairs that are fully in the buffer. The key/value
       pairs that are read are pushed into [self.partial_msg] *)
    let rec read_available_pairs (self : t) : available_res =
      match next_split self with
      | None ->
          (* no split found, need more data. *)
          Needs_more
      | Some idx_split ->
          (* found split, now find '=' before it so we can extract key
             and value *)
          assert (B.get self.buf idx_split = self.split) ;
          ( match B.index_from_opt self.buf self.off '=' with
          | Some idx_eq when idx_eq < idx_split ->
              let k = B.sub_string self.buf self.off (idx_eq - self.off) in
              let v =
                B.sub_string self.buf (idx_eq + 1) (idx_split - idx_eq - 1)
              in
              self.partial_msg <- (k, v) :: self.partial_msg ;

              (* move past the split *)
              self.off <- idx_split + 1 ;

              (* we may have read the last field we needed *)
              if k = "10"
              then Reached_checksum
              else (read_available_pairs [@tailcall]) self
          | _ ->
              invalid_arg
                "Fix_io.read_next_message: no '=' present before split" )


    (* read a full message *)
    let read_next_message (self : t) : message option Lwt.t =
      assert (self.partial_msg = []) ;
      let rec loop () =
        match read_available_pairs self with
        | Reached_checksum ->
            (* data in buffer was enough *)
            let msg = List.rev self.partial_msg in
            self.partial_msg <- [] ;
            Lwt.return (Some msg)
        | Needs_more ->
            let* read_some = refill self in
            if read_some
            then (
              assert (not (is_empty self)) ;
              loop () )
            else (
              if not (is_empty self)
              then
                invalid_arg
                  (Printf.sprintf
                     "Fix_io.read_next_message: leftover data %S"
                     (B.sub_string self.buf 0 self.max_off) ) ;
              Lwt.return None )
      in
      loop ()
  end

  let read_next_message = Read.read_next_message

  let read_thread t : unit Lwt.t =
    let reader = Read.create ~split:t.split t.inch in
    let rec loop () =
      let* msg = Read.read_next_message reader in
      match msg with
      | None ->
          Lwt.return ()
      | Some msg ->
          let* () =
            match t.log_file_channel with
            | None ->
                Lwt.return_unit
            | Some oc ->
                let logmsg = encode ~split:'|' msg in
                logfix oc logmsg
          in
          let* () = t.recv msg in
          loop ()
    in
    loop ()


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
