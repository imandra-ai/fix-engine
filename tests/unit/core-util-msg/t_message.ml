module Q = QCheck
open Message

let assert_eq_int i j =
  if i <> j
  then (
    Printf.eprintf "not equal: %d and %d\n%!" i j ;
    assert false )


let q_msg : Message.t Q.arbitrary =
  Q.(small_list (pair small_string small_string))


module Checksum = struct
  let get_checksum_ref msg =
    let checksum s =
      let rec chsum i v =
        if i < 0 then v else chsum (i - 1) (Char.code s.[i] + v)
      in
      chsum (String.length s - 1) 0
    in
    let rec scan n msg =
      match msg with
      | ("10", _v) :: _tl ->
          n mod 256
      | (k, v) :: tl ->
          scan (checksum k + checksum v + 62 + n) tl
      | [] ->
          n mod 256
    in
    scan 0 msg


  let () =
    let msg = [ ("a", "42"); ("b", "12"); ("10", "123") ] in
    assert_eq_int (get_checksum_ref msg) (Message.checksum msg)


  let p1 = Q.Test.make q_msg (fun m -> Message.checksum m = get_checksum_ref m)
end

let q_suite = [ Checksum.p1 ]

let () =
  let errcode =
    QCheck_base_runner.run_tests ~verbose:false ~colors:false q_suite
  in
  flush stdout ;
  if errcode <> 0
  then (
    Printf.eprintf "qcheck failed with %d\n%!" errcode ;
    exit errcode )
