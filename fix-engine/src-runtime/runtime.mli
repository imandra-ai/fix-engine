type direction =
  | Incoming
  | Outgoing

type msg_type =
  | Application
  | Admin

type message =
  { message : (string * string) list
  ; direction : direction
  ; msg_type : msg_type
  }

type event =
  | Log of string
  | FIXMessage of message
  | Connected of string
  | Disconnected of string
  | ConnectionRejected of string

type handle

val start_server :
     ?session_dir:string
  -> ?log_file:string
  -> ?reset:bool
  -> config:Engine.config
  -> port:int
  -> recv:(event -> unit Lwt.t)
  -> unit
  -> handle * unit Lwt.t

val start_client :
     ?session_dir:string
  -> ?log_file:string
  -> ?reset:bool
  -> config:Engine.config
  -> host:string
  -> port:int
  -> recv:(event -> unit Lwt.t)
  -> unit
  -> handle * unit Lwt.t

val send_message : handle -> Engine.message -> (unit, Engine.err) result Lwt.t

val overwrite_sequence_numbers : handle -> Z.t option * Z.t option -> unit Lwt.t

val terminate : handle -> unit Lwt.t
