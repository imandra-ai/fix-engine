
#use "topfind";;
#require "yojson";;

(** Standard FIX header *)
type fix_header = {
    begin_string : int;                         (* Tag 8 *)
    body_length : int;                          (* Tag 9 *)
    msg_type : int;                             (* Tag 35 *)
    sender_comp_id : int;                       (* Tag 49 *)
    target_comp_id : int;                       (* Tag 56 *)
    msg_seq_num : int;                          (* Tag 34 *)

    on_behalf_of_comp_id : int option;          (* Tag 115 *)
    deliver_to_comp_id : int option;            (* Tag 128 *)
    secure_data_len : int option;               (* Tag 90 *)
    secure_data : int option;                   (* Tag 91*)
    sender_sub_id : int option;                 (* Tag 50 *)
    sender_location_id : int option;            (* Tag 142 *)
    target_sub_id : int option;                 (* Tag 57 *)
    target_location_id : int option;            (* Tag 143 *)
    on_behalf_of_sub_id : int option;           (* Tag 116 *)
    on_behalf_of_location_id : int option;      (* Tag 114 *)
    deliver_to_sub_id : int option;             (* Tag 129 *)
    deliver_to_location_id : int option;        (* Tag 145 *)
    poss_dup_flag : bool option;                (* Tag 43 *)
    poss_resend : bool option;                  (* Tag 97 *)
    sending_time : int option;                  (* Tag 52 *)
    orig_sending_time : int option;             (* Tag 122 *)
    xml_data_len : int option;                  (* Tag 212 *)
    xml_data : int option;                      (* Tag 213 *)
    message_enconding : int option;             (* Tag 347 *)
    last_msg_seq_num_processed : int option;    (* Tag 369 *)
    no_hops : int option;                       (* Tag 627 *)
};;


let fix_header_to_ocaml (fh : fix_header) : Yojson.Basic.json =
    let  intopt_to_json : ( int option -> Yojson.Basic.json ) = 
        function None -> `Null | Some n -> `Int  n 
    in
    let boolopt_to_json : ( bool option -> Yojson.Basic.json ) = 
        function None -> `Null | Some b -> `Bool b
    in
    let list_assoc = [
        ( "begin_string"   , `Int fh.begin_string   );                        
        ( "body_length"    , `Int fh.body_length    );
        ( "msg_type"       , `Int fh.msg_type       );
        ( "sender_comp_id" , `Int fh.sender_comp_id );
        ( "target_comp_id" , `Int fh.target_comp_id );
        ( "msg_seq_num"    , `Int fh.msg_seq_num    );
                                       
        ( "on_behalf_of_comp_id"       , intopt_to_json fh.on_behalf_of_comp_id         );
        ( "deliver_to_comp_id"         , intopt_to_json fh.deliver_to_comp_id           );
        ( "secure_data_len"            , intopt_to_json fh.secure_data_len              );
        ( "secure_data"                , intopt_to_json fh.secure_data                  );
        ( "sender_sub_id"              , intopt_to_json fh.sender_sub_id                );
        ( "sender_location_id"         , intopt_to_json fh.sender_location_id           );
        ( "target_sub_id"              , intopt_to_json fh.target_sub_id                );
        ( "target_location_id"         , intopt_to_json fh.target_location_id           );
        ( "on_behalf_of_sub_id"        , intopt_to_json fh.on_behalf_of_sub_id          );
        ( "on_behalf_of_location_id"   , intopt_to_json fh.on_behalf_of_location_id     );
        ( "deliver_to_sub_id"          , intopt_to_json fh.deliver_to_sub_id            );
        ( "deliver_to_location_id"     , intopt_to_json fh.deliver_to_location_id       );   
        ( "poss_dup_flag"              , boolopt_to_json fh.poss_dup_flag               );
        ( "poss_resend"                , boolopt_to_json fh.poss_resend                 );             
        ( "sending_time"               , intopt_to_json fh.sending_time                 );
        ( "orig_sending_time"          , intopt_to_json fh.orig_sending_time            );
        ( "xml_data_len"               , intopt_to_json fh.xml_data_len                 );
        ( "xml_data"                   , intopt_to_json fh.xml_data                     );
        ( "message_enconding"          , intopt_to_json fh.message_enconding            );
        ( "last_msg_seq_num_processed" , intopt_to_json fh.last_msg_seq_num_processed   );
        ( "no_hops"                    , intopt_to_json fh.no_hops                      )
        ] |> List.filter (function ( _, `Null ) -> false | _ -> true )(*: (string * Yojson.Basic.json) -> bool) *)
        in
    `Assoc list_assoc
;;


let test1 = {
    begin_string = 1;
    body_length = 1;
    msg_type = 1;
    sender_comp_id = 1;
    target_comp_id = 1;
    msg_seq_num = 1;
    on_behalf_of_comp_id = Some 1;
    deliver_to_comp_id = None;
    secure_data_len = None;
    secure_data = None;
    sender_sub_id = None;
    sender_location_id = None;
    target_sub_id = None;
    target_location_id = None;
    on_behalf_of_sub_id = None;
    on_behalf_of_location_id = None;
    deliver_to_sub_id = None;
    deliver_to_location_id = Some 1;
    poss_dup_flag = Some true;
    poss_resend = Some false;
    sending_time = Some 1;
    orig_sending_time = Some 1;
    xml_data_len = None;
    xml_data = None;
    message_enconding = None;
    last_msg_seq_num_processed = Some 1;
    no_hops = Some 1;
};;


test1 |> fix_header_to_ocaml |> Yojson.Basic.pretty_to_string |> print_string;;

let test2 = {
    begin_string = 1;
    body_length = 1;
    msg_type = 1;
    sender_comp_id = 1;
    target_comp_id = 1;
    msg_seq_num = 1;
    on_behalf_of_comp_id = None;
    deliver_to_comp_id = None;
    secure_data_len = None;
    secure_data = None;
    sender_sub_id = None;
    sender_location_id = None;
    target_sub_id = None;
    target_location_id = None;
    on_behalf_of_sub_id = None;
    on_behalf_of_location_id = None;
    deliver_to_sub_id = None;
    deliver_to_location_id = None;
    poss_dup_flag = Some false;
    poss_resend = None;
    sending_time = None;
    orig_sending_time = None;
    xml_data_len = None;
    xml_data = None;
    message_enconding = None;
    last_msg_seq_num_processed = None;
    no_hops = None;
};;


test2 |> fix_header_to_ocaml |> Yojson.Basic.pretty_to_string |> print_string;;