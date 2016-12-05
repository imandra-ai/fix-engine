(** 
    Aesthetic Integration Limited


    cache_various.ml

*)

open Fix_data_dictionary;;
open Fix_engine;;


let msgs = [
    {
        header = { default_fix_header with msg_seq_num = 1 };   
        msg_data = FIX_logon {
            encrypt_method = 0;
            heartbeat_interval = 0;
            raw_data_length = 0;
        };
        trailer = default_fix_trailer;

    };
    {
        header = { default_fix_header with msg_seq_num = 2 };
        trailer = default_fix_trailer;
        msg_data = FIX_logon {
            encrypt_method = 0;
            heartbeat_interval = 0;
            raw_data_length = 0;
        }
    };
    
    {
        header  = { default_fix_header with msg_seq_num = 3 };
        trailer = default_fix_trailer;
        msg_data = FIX_logon {
            encrypt_method = 0;
            heartbeat_interval = 0;
            raw_data_length = 0;
        }
    };
    
    {
        header = { default_fix_header with msg_seq_num = 4 };
        trailer = default_fix_trailer;
        msg_data = FIX_logon {
            encrypt_method = 0;
            heartbeat_interval = 0;
            raw_data_length = 0;
        }
    };
];;


let comp = is_msg_list_complete (msgs);;

let () = 
begin
    if comp then 
        let () = print_endline "True";
    else
        print_endline "False";
end;;

