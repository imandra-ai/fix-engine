type message = (string * string) list

module Internal : sig
  type fix_io

  val start :
       ?split:char
    -> recv:(message -> unit Lwt.t)
    -> Lwt_io.input_channel * Lwt_io.output_channel
    -> unit Lwt.t * fix_io

  val encode : split:char -> message -> string

  val send : fix_io -> message -> unit Lwt.t
end = struct
  let ( >>= ) = Lwt.( >>= )

  type fix_io =
    { send_box : message Lwt_mvar.t
    ; recv : message -> unit Lwt.t
    ; inch : Lwt_io.input_channel
    ; outch : Lwt_io.output_channel
    ; split : char
    }

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
    get_message t [] >>= fun msg -> 
    t.recv msg >>= fun () -> 
    read_thread t


  (** Writing thread *)
  let encode ~split msg =
    let split = String.make 1 split in
    msg
    |> List.map (fun (k, v) -> k ^ "=" ^ v)
    |> List.fold_left (fun a s -> a ^ s ^ split) ""


  let rec write_thread t : unit Lwt.t =
    Lwt_mvar.take t.send_box
    >>= fun msg ->
    let wire = encode ~split:t.split msg in
    Lwt_io.write t.outch wire >>= fun () -> write_thread t


  let start ?(split = '\001') ~recv (inch, outch) =
    let state =
      { inch; outch; split; send_box = Lwt_mvar.create_empty (); recv }
    in
    let thread = Lwt.pick [ read_thread state; write_thread state ] in
    (thread, state)


  let send state msg = Lwt_mvar.put state.send_box msg
end

include Internal
