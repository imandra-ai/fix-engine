type mode =
  | Server of { port: int }
  | Client of {
      host: string;
      port: int;
    }
[@@deriving show { with_path = false }]

type t = {
  engine_config: Engine.config;
  mode: mode;
  zmqpub: string;
  zmqrep: string;
  reset: bool;
}
[@@deriving show { with_path = false }]

module Decode (D : Decoders.Decode.S) = struct
  let ( let* ) = D.( >>= )

  let ( >>= ) = D.( >>= )

  let field_def field default f =
    let* opt = D.field_opt field f in
    D.succeed
      (match opt with
      | None -> default
      | Some x -> x)

  let mode =
    D.single_field (function
      | "Server" ->
        let* port = field_def "port" 9880 D.int in
        D.succeed @@ Server { port }
      | "Client" ->
        let* port = field_def "port" 9880 D.int in
        let* host = field_def "host" "127.0.0.1" D.string in
        D.succeed @@ Client { port; host }
      | s -> D.fail @@ Printf.sprintf "Unknown mode string '%s'" s)

  let precision =
    let open Engine in
    let* precision = D.string in
    match precision with
    | "Milli" -> D.succeed Milli
    | "Micro" -> D.succeed Micro
    | "Nano" -> D.succeed Nano
    | "Pico" -> D.succeed Pico
    | s -> D.fail @@ Printf.sprintf "Unknown preicison string '%s'" s

  let string_pair : (string * string) D.decoder =
    let* xs = D.list D.string in
    match xs with
    | [ a; b ] -> D.succeed (a, b)
    | _ -> D.fail {|"expected a pair of strings ["a", "b"]|}

  let t : t D.decoder =
    let* zmqpub = field_def "zmqpub" "tcp://*:5000" D.string in
    let* zmqrep = field_def "zmqrep" "tcp://*:5001" D.string in
    let def_mode = Server { port = 9880 } in
    let* mode = field_def "mode" def_mode mode in
    let def_target =
      match mode with
      | Server _ -> "CLIENT"
      | Client _ -> "SERVER"
    in
    let* comp_id = field_def "comp_id" "IMANDRA" D.string in
    let* target_id = field_def "target_id" def_target D.string in
    let* host_id = D.field_opt "host_id" D.string in
    let* on_behalf_id = D.field_opt "on_behalf_id" D.string in
    let* begin_string = field_def "begin_string" "FIX.4.2" D.string in
    let* timer = field_def "timer" 1.0 D.float in
    let* strict_time_precision =
      field_def "strict_time_precision" false D.bool
    in
    let* precision = field_def "precision" Engine.Pico precision in
    let* reset = field_def "reset" false D.bool in
    let* no_history = field_def "no_history" false D.bool in
    let* heartbeat_interval = field_def "heartbeat_interval" 30 D.int in
    let* logon_fields = field_def "logon_fields" [] D.(list string_pair) in
    let engine_config =
      Engine.
        {
          comp_id;
          target_id;
          host_id;
          on_behalf_id;
          timer;
          strict_time_precision;
          precision;
          logon_fields;
          next_expected_msg_seq_num = false;
          begin_string;
          ignore_business_reject = false;
          ignore_session_reject = false;
          no_history;
          heartbeat_interval;
        }
    in
    D.succeed { zmqpub; zmqrep; mode; engine_config; reset }
end
