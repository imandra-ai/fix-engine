---
title: "Base"
excerpt: ""
---
[block:api-header]
{
  "title": "Base VG.1"
}
[/block]
> *When in ActiveSession (normal mode) and receiving a non grabled and non session-level*
> *rejected message and the application is down. Such message would be sent back with a*
> *Business Reject.*


[block:code]
{
  "codes": [
    {
      "code": "let msg_is_biz_reject = function\n  | Some (ValidMsg msg_data) ->\n    begin match msg_data.full_msg_data with\n      | Full_FIX_Admin_Msg (Full_Msg_Business_Reject _) -> true\n      | _ -> false\n    end\n  | _ -> false\n;;\n\nlet msg_is_valid = function\n  | Some (ValidMsg _) -> true\n  | _ -> false\n;;\n\nverify app_down_get_biz_reject ( state : fix_engine_state ) =\n  let incoming_biz_rejected = msg_is_valid ( state.incoming_fix_msg ) in\n  let no_incoming_msgs = state.incoming_int_msg = None in\n  let state' = one_step (state) in\n  let result_biz_reject = msg_is_biz_reject ( state'.outgoing_fix_msg ) in\n  ( state.fe_cache = []\n    && incoming_biz_rejected && not (state.fe_application_up)\n    && state.fe_curr_mode = ActiveSession && no_incoming_msgs )\n  ==>\n  result_biz_reject\n;;",
      "language": "scala",
      "name": "Base VG.1"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Base VG.2"
}
[/block]
From Vol 2. Page 9:
> *In *ALL* cases except the Sequence Reset - message, the FIX session*
> *should be terminated if the incoming sequence number is less than expected and the*
> *PossDupFlag is not set. A Logout message with some descriptive text should be sent to the*
> *other side before closing the session.*
[block:code]
{
  "codes": [
    {
      "code": "let poss_dup_flag_not_set ( flag : bool option ) =\n  flag = None\n;;\n\nlet incoming_msg_not_valid ( msg, state_inc_seq_num : full_top_level_msg option * int ) =\n  match msg with\n  | Some (ValidMsg vmsg) ->\n    let seq_num_incorrect = vmsg.full_msg_header.h_msg_seq_num < state_inc_seq_num in\n    let msg_is_seq_reset =\n      begin match vmsg.full_msg_data with\n        | Full_FIX_Admin_Msg (Full_Msg_Sequence_Reset _) -> true\n        | _ -> false\n      end\n    in\n    (seq_num_incorrect && msg_is_seq_reset\n     && poss_dup_flag_not_set ( vmsg.full_msg_header.h_poss_dup_flag ))\n  | _   -> false\n;;\n\nlet msg_is_logout = function\n  | Some (ValidMsg vmsg) ->\n    begin match vmsg.full_msg_data with\n      | Full_FIX_Admin_Msg (Full_Msg_Logoff _) -> true\n      | _ -> false\n    end\n  | _ -> false\n;;\n\nverify less_seq_num_logout ( state : fix_engine_state ) =\n  let no_incoming_int_msgs = state.incoming_int_msg = None in\n  let state_good = not ( state.fe_application_up ) && ( state.fe_curr_mode = ActiveSession ) in\n  let state' = one_step (state) in\n  ( state.fe_application_up && no_incoming_int_msgs && state_good && state.fe_cache = [] &&\n    incoming_msg_not_valid ( state.incoming_fix_msg, 1 ) )\n  ==> msg_is_logout ( state'.outgoing_fix_msg )\n;;",
      "language": "scala",
      "name": "Base VG.2"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Base VG.3"
}
[/block]
Messages that are garbled will be ignored (sequence counter will not be incremented).
[block:code]
{
  "codes": [
    {
      "code": "let incoming_msg_garbled = function\n  | Some (Garbled) -> true\n  | _ -> false\n;;\n\nverify garbled_are_ignored ( state : fix_engine_state ) =\n  let state' = one_step (state) in\n  let msg_ignored = ( state' =  { state with incoming_fix_msg = None } ) in \n  let no_internal_msgs = state.incoming_int_msg = None in\n  let no_cache_replay_or_retransmit = not ( state.fe_curr_mode = CacheReplay || state.fe_curr_mode = Retransmit ) in\n  ( incoming_msg_garbled (state.incoming_fix_msg)\n    && no_cache_replay_or_retransmit\n    && no_internal_msgs )\n  ==> msg_ignored\n;;",
      "language": "scala",
      "name": "Base VG.3"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Base VG.4"
}
[/block]
Session rejected messages are rejected with the right reason and counter is incremented.
[block:code]
{
  "codes": [
    {
      "code": "let incoming_msg_session_reject = function\n  | Some (SessionRejectedMsg _) -> true\n  | _ -> false\n;;\n\nlet msg_is_reject = function\n  | Some (ValidMsg vmsg) ->\n    begin match vmsg.full_msg_data with\n      | Full_FIX_Admin_Msg (Full_Msg_Reject _) -> true\n      | _ -> false\n    end\n  | _ -> false\n;;\n\n(** Note that it's important to remember that a message may only be rejected if we're in ActiveSession state. \n    It would be otherwise ignore (if in NoActiveSession state) or not processed if the engine is in CacheReplay or \n    Retransmit modes. *)\nverify session_rejects_are_rejected ( state : fix_engine_state ) =\n  let no_incoming_int_msgs = state.incoming_int_msg = None in\n  let incoming_rejected = incoming_msg_session_reject ( state.incoming_fix_msg ) in\n  let state' = one_step (state) in\n  let msg_rejected = msg_is_reject ( state'.outgoing_fix_msg ) in\n  let seq_num_updated = ( ( state.outgoing_seq_num + 1 ) = state'.outgoing_seq_num ) in\n  ( no_incoming_int_msgs && incoming_rejected && state.fe_curr_mode = ActiveSession)\n  ==>\n  ( msg_rejected && seq_num_updated )\n;;",
      "language": "scala",
      "name": "Base VG.4"
    }
  ]
}
[/block]