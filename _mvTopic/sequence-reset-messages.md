---
title: "Sequence Reset Messages"
excerpt: ""
layout: pageSbar
permalink: /sequenceResetMessages/
colName: Model Verification
---
## Seq_Reset VG.1

"When the incoming sequence number does not match the expected corrective processing is required. Note that the `SeqReset-Reset` message (used only to recover from a disaster vs. normal resend request processing) is an exception to this rule as it should be processed without regards to its `MsgSeqNum`."
{% highlight ocaml %}
let inc_msg_seqreset_reset ( m : full_top_level_msg option ) =
    match m with 
    | None -> false
    | Some msg ->
    match msg with
    | ValidMsg vmsg -> (
        match vmsg.full_msg_data with 
        | Full_FIX_App_Msg _ -> false
        | Full_FIX_Admin_Msg amsg -> (
            match amsg with 
            | Full_Msg_Sequence_Reset data -> (
                (* A missing flag or flag = No tells us that message of the Reset mode. *)
                match data.seqr_gap_fill_flag with | None -> true | Some f -> f = FIX_No
             )
            | _ -> false
         )
    )
    | _ -> false
;;

let state_updated ( engine, new_seq_num : fix_engine_state * int ) =
    engine.incoming_seq_num = new_seq_num &&
    engine.fe_curr_mode = ActiveSession && 
    engine.fe_cache = []
;;

let out_of_seq_seqreset_processed ( engine, new_seq_num : fix_engine_state * int ) = 
    let engine' = one_step ( engine ) in
    (   inc_msg_seqreset_reset ( engine.incoming_fix_msg ) && 
        engine.fe_curr_mode <> NoActiveSession && 
        engine.fe_cache = [] 
    ) ==> (
        state_updated ( engine', new_seq_num )
    )
;;
{% endhighlight %}