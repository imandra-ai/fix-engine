type direction =
  | Incoming
  | Outgoing
[@@deriving show]

type msg_type =
  | Application
  | Admin
[@@deriving show]

type message =
  { message : (string * string) list
  ; direction : direction
  ; msg_type : msg_type
  }
[@@deriving show]

type event =
  | Log of string
  | FIXMessage of message
  | Connected of string
  | Disconnected of string
  | ConnectionRejected of string
[@@deriving show]

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

val terminate : ?final_seqnums:Z.t option * Z.t option -> handle -> unit Lwt.t
