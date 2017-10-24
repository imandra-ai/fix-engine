---
title: "Sequence Reset Messages"
excerpt: ""
---
[block:api-header]
{
  "title": "Seq_Reset VG.1"
}
[/block]
"When the incoming sequence number does not match the expected corrective processing is required. Note that the `SeqReset-Reset` message (used only to recover from a disaster vs. normal resend request processing) is an exception to this rule as it should be processed without regards to its `MsgSeqNum`."
[block:code]
{
  "codes": [
    {
      "code": "let inc_msg_seqreset_reset ( m : full_top_level_msg option ) =\n    match m with \n    | None -> false\n    | Some msg ->\n    match msg with\n    | ValidMsg vmsg -> (\n        match vmsg.full_msg_data with \n        | Full_FIX_App_Msg _ -> false\n        | Full_FIX_Admin_Msg amsg -> (\n            match amsg with \n            | Full_Msg_Sequence_Reset data -> (\n                (* A missing flag or flag = No tells us that message of the Reset mode. *)\n                match data.seqr_gap_fill_flag with | None -> true | Some f -> f = FIX_No\n             )\n            | _ -> false\n         )\n    )\n    | _ -> false\n;;\n\nlet state_updated ( engine, new_seq_num : fix_engine_state * int ) =\n    engine.incoming_seq_num = new_seq_num &&\n    engine.fe_curr_mode = ActiveSession && \n    engine.fe_cache = []\n;;\n\nlet out_of_seq_seqreset_processed ( engine, new_seq_num : fix_engine_state * int ) = \n    let engine' = one_step ( engine ) in\n    (   inc_msg_seqreset_reset ( engine.incoming_fix_msg ) && \n        engine.fe_curr_mode <> NoActiveSession && \n        engine.fe_cache = [] \n    ) ==> (\n        state_updated ( engine', new_seq_num )\n    )\n;;",
      "language": "scala",
      "name": "Seq_Reset VG.1"
    }
  ]
}
[/block]