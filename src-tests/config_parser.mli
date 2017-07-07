type action = 
    | Connect 
    | Disconnect

type config_entry =
    | ExpectMessage of (string * string) list
    | InitiateMessage of (string * string) list
    | ExpectAction of action
    | InitiateAction of action


val parse_file : string -> config_entry list
