val from_channel : 
    ?verbose:bool -> 
    ?spliton:char -> 
    Lwt_io.input_channel ->
    (string * string) list Lwt_stream.t