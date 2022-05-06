type direction = Incoming | Outgoing
type msg_type = Application | Admin 

type event = 
  { message : (string * string) list
  ; direction : direction
  ; msg_type : msg_type
  }

val start_server:
    ?session_dir:string ->
    ?reset:bool ->
    config:Engine.config ->
    port:int -> 
    recv:(event -> unit Lwt.t) -> 
    unit -> 
    unit Lwt.t

val start_client:
    ?session_dir:string ->
    ?reset:bool ->
    config:Engine.config ->
    host:string -> 
    port:int -> 
    recv:(event -> unit Lwt.t) -> 
    unit -> 
    unit Lwt.t

val send_message:
    Engine.message -> (unit, Engine.err) result Lwt.t
