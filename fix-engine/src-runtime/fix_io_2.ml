module type SIG = sig
  type 'a t

  val ( let* ) : 'a t -> ('a -> 'b t) -> 'b t

  val ( >>= ) : 'a t -> ('a -> 'b t) -> 'b t

  val catch : (unit -> 'a t) -> (exn -> 'a t) -> 'a t

  val return : 'a -> 'a t
end

module Make (S : SIG) = struct
  let x = ()
end

type config =
  { begin_string : string
  ; separator : char
  ; chunk_size : int
  }

type fix_channel =
  { begin_match_string : string
  ; buffer : Bytes.t
  ; b_start : int
  ; b_end : int
  ; fd : Unix.file_descr
  ; config : config
  }

let create_channel (config : config) fd =
  let sep = String.make 1 config.separator in
  let begin_match_string = [ "8="; config.begin_string; sep; "9=" ] in
  let begin_match_string = String.concat "" begin_match_string in
  let buffer = Bytes.create (config.chunk_size * 10) in
  let b_start, b_end = (0, 0) in
  { begin_match_string; buffer; fd; config; b_start; b_end }


let check_begin_string channel =
  let lmatchstr = String.length channel.begin_match_string in
  let str = Bytes.sub_string channel.buffer channel.b_start lmatchstr in
  if str <> channel.begin_match_string
  then failwith "bad msg header"
  else { channel with b_start = channel.b_start + lmatchstr }


type err =
  [ `End_of_file
  | `BadSizeField
  ]

let read_chunk channel : (fix_channel, err) result =
  let chunk_size = channel.config.chunk_size in
  let nbytes = Unix.read channel.fd channel.buffer channel.b_end chunk_size in
  if nbytes = 0
  then Error `End_of_file
  else
    let channel = { channel with b_end = channel.b_end + nbytes } in
    let bsize = Bytes.length channel.buffer in
    if channel.b_end < bsize - (2 * chunk_size)
    then Ok channel
    else
      let buffer = Bytes.create bsize in
      let len = channel.b_end - channel.b_start in
      let () = Bytes.blit channel.buffer channel.b_start buffer 0 len in
      Ok { channel with buffer; b_start = 0; b_end = len }


let read_until channel char =
  let ( let* ) = Result.bind in
  let rec get_idx channel =
    try Result.ok @@ Bytes.index_from channel.buffer channel.b_start char with
    | Not_found ->
        let* channel = read_chunk channel in
        get_idx channel
  in
  let* idx = get_idx channel in
  let len = idx - channel.b_start in
  let str = Bytes.sub_string channel.buffer channel.b_start len in
  let channel = { channel with b_start = idx + 1 } in
  Ok (channel, str)


let rec read_size size channel =
  if channel.b_end - channel.b_start < size
  then Ok channel
  else Result.bind (read_chunk channel) (read_size size)


let read_fix_message channel =
  let ( let* ) = Result.bind in
  let separator = channel.config.separator in
  let* channel, size = read_until channel separator in
  match int_of_string_opt size with
  | None ->
      Result.error `BadSizeField
  | Some size ->
      let* channel = read_size size channel in
      let fixmsg = Bytes.sub_string channel.buffer channel.b_start size in
      let channel = { channel with b_start = channel.b_start + size } in
      Ok (channel, fixmsg)


let fd = Unix.openfile "log" Unix.[ O_RDONLY ] 0

let config = { begin_string = "FIX.4.2"; separator = '|'; chunk_size = 20 }

let chan = create_channel config fd
