---
title: "Logon Messages"
excerpt: ""
---
This section describes verification goals for Logon messages. 
[block:api-header]
{
  "title": "Logon VG.1"
}
[/block]
"The logon message must be the first message sent by the application requesting to initiate a FIX session."

Note: we augment this with requirement that the engine correctly sets the acceptor/initiator flag.
[block:code]
{
  "codes": [
    {
      "code": "let incoming_int_create_session ( m, targetID : fix_engine_int_msg option * int ) =\n    match m with\n    | None      -> false\n    | Some msg  ->\n    match msg with\n    | CreateSession data    -> data.dest_comp_id = targetID\n    | _                     -> false\n;;\n\nlet state_is_init ( engine : fix_engine_state ) =\n    engine.incoming_seq_num = 1 &&\n    engine.outgoing_seq_num = 1 &&\n    engine.fe_initiator = None &&\n    engine.fe_curr_mode = NoActiveSession &&\n    engine.fe_curr_status = Normal &&\n    engine.fe_history = [] &&\n    engine.fe_cache = []\n;;\n\nlet outbound_msg_logon ( m, targetID : full_top_level_msg option * int ) =\n    match m with\n    | None      -> false\n    | Some msg  ->\n    match msg with\n    | ValidMsg vmsg -> (\n    let correct_target_id = vmsg.full_msg_header.h_target_comp_id = targetID in\n    match vmsg.full_msg_data with\n    | Full_FIX_App_Msg _        -> false\n    | Full_FIX_Admin_Msg amsg   ->\n    match amsg with\n    | Full_Msg_Logon _          -> correct_target_id\n    | _                         -> false\n    )\n    | _             -> false\n;;\n\nverify logon_msg_is_first ( engine, targetID : fix_engine_state * int ) =\n    let engine' = one_step ( engine ) in\n    ( state_is_init ( engine ) &&\n    incoming_int_create_session ( engine.incoming_int_msg, targetID ) ) ==>\n     ( outbound_msg_logon ( engine'.outgoing_fix_msg, targetID ) &&\n     engine'.fe_curr_mode = LogonInitiated &&\n     engine'.fe_initiator = Some true)\n;;",
      "language": "scala",
      "name": "IML"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Logon VG.2"
}
[/block]
"The session acceptor must be prepared to immediately begin processing messages after receipt of the Logon. The session initiator can choose to begin transmission of FIX messages before receipt of the confirmation Logon, however it is recommended that normal message delivery wait until after the return Logon is received to accommodate encryption key negotiation."
[block:code]
{
  "codes": [
    {
      "code": "let waiting_for_logon_ack ( engine : fix_engine_state ) =\n    engine.fe_curr_mode = LogonInitiated\n;;\n\nlet int_app_msg_exists ( m : fix_engine_int_msg option ) =\n    match m with\n    | None      -> false\n    | Some _    -> true\n;;\n\nlet no_msg_sent_until_logon_acked ( engine : fix_engine_state ) =\n    let engine' = one_step ( engine ) in\n    ( engine.fe_curr_mode = LogonInitiated && int_app_msg_exists ( engine' ))\n    ==>\n    ( engine'.outgoing_fix_msg = None )\n;;\n\n(** Logon VG2.2 *)\n\nlet incoming_logon_ack ( m, self_comp_id : full_top_level_msg option * int ) =\n    match m with\n    | None -> false\n    | Some msg ->\n    match msg with\n    | ValidMsg vmsg -> (\n        let valid_header = vmsg.full_msg_header.h_target_comp_id = self_comp_id in\n        match vmsg.full_msg_data with\n        | Full_FIX_App_Msg _ -> false\n        | Full_FIX_Admin_Msg amsg -> (\n            match amsg with\n            | Full_Msg_Logon data -> valid_header\n            | _ -> false\n         )\n     )\n    | _ -> false\n;;\n\nverify receive_logon_ack ( engine : fix_engine_state ) =\n    let engine' = one_step ( engine ) in\n    ( incoming_logon_ack ( engine.incoming_fix_msg, engine.fe_comp_id ) &&\n        engine.fe_curr_mode = LogonInitiated &&\n        engine.fe_cache = [] &&\n        is_state_valid ( engine ) )\n    ==>\n    ( engine'.fe_curr_mode = ActiveSession )\n;;\n",
      "language": "scala",
      "name": "IML"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Logon VG.3"
}
[/block]
"After authentication, the initiator and acceptor must synchronize their messages through interrogation of the `MsgSeqNum` field before sending any queued or new messages. A comparison of the `MsgSeqNum` in the Logon message to the internally monitored next expected sequence number will indicate any message gaps. Likewise, the initiator can detect gaps by comparing the acknowledgment Logon message’s MsgSeqNum to the next expected value. The section on message recovery later in this document deals with message gap handling."
[block:code]
{
  "codes": [
    {
      "code": "let logon_msg_out_of_sequence ( m : full_top_level_msg option ) =\n    true\n;;\n\nverify when_gap_detected_request_is_sent ( engine : fix_engine_state ) =\n\n    let engine' = one_step ( engine ) in\n\n    logon_msg_out_of_sequence ( engine )\n        ==>\n    ( test_request_sent ( engine' ) && engine'.fe_curr_mode = Recovery )\n;;\n",
      "language": "scala",
      "name": "Logon VG.3"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Logon VG.4"
}
[/block]
"If the session acceptor has chosen to change the session encryption key, the session initiator must send a third Logon back to the other side in order to acknowledge the key change request. This also allows the session acceptor to know when the session initiator has started to encrypt using the new session key. Both parties are responsible for infinite loop detection and prevention during this phase of the session."

Notes: we break up the statement into the following VGs:
- 4.1 - If a confirmation Logon is received with a different encryption key, then another Logon is sent back with the same key. Also, we increment the 'fe_num_logons_sent' counter.
- 4.2 - When the engine attempts to send out a Logon message when the count is violated, it would transition into error mode with status change.
[block:code]
{
  "codes": [
    {
      "code": "let received_logon_diff_key ( m, self_comp_id, encrypt_method : full_top_level_msg option * int * fix_encryption_method ) =\n    match m with\n    | None -> true\n    | Some msg ->\n    match msg with\n    | ValidMsg vmsg -> (\n        let valid_header = vmsg.full_msg_header.h_target_comp_id = self_comp_id in\n        match vmsg.full_msg_data with\n        | Full_FIX_App_Msg _ -> false\n        | Full_FIX_Admin_Msg amsg -> (\n            match amsg with\n            | Full_Msg_Logon data -> valid_header && ( data.ln_encrypt_method = encrypt_method )\n            | _ -> false\n         )\n    )\n    | _ -> false\n;;\n\nlet logon_sent_out ( m, encrypt_method : full_top_level_msg option * fix_encryption_method ) =\n    match m with\n    | None -> true\n    | Some msg ->\n    match msg with\n    | ValidMsg vmsg -> (\n        match vmsg.full_msg_data with\n        | Full_FIX_App_Msg _ -> false\n        | Full_FIX_Admin_Msg amsg -> (\n            match amsg with\n            | Full_Msg_Logon data -> data.ln_encrypt_method = encrypt_method\n            | _ -> false\n         )\n    )\n    | _ -> false\n;;\n\n(** Logon VG.4.1 *)\nverify encrypt_key_different_logon_sent ( engine, new_encrypt_method : fix_engine_state * fix_encryption_method ) =\n    let engine' = one_step ( engine ) in\n    (   engine.fe_cache = [] &&\n        engine.fe_curr_mode = LogonInitiated &&\n        engine.fe_encrypt_method <> new_encrypt_method &&\n        received_logon_diff_key ( engine.incoming_fix_msg, engine.fe_comp_id, new_encrypt_method ) &&\n        engine.fe_num_logons_sent < engine.fe_max_num_logons_sent\n    ) ==> (\n        logon_sent_out ( engine'.outgoing_fix_msg, new_encrypt_method ) &&\n        engine'.fe_encrypt_method = new_encrypt_method &&\n        engine'.fe_num_logons_sent = (1 + engine.fe_num_logons_sent)\n    )\n;;\n\n(** Logon VG.4.2 *)\nverify max_num_logons_breached_error ( engine : fix_engine_state ) =\n    let engine' = one_step ( engine ) in\n    ( received_logon_diff_key ( engine ) &&\n        ( engine.fe_num_logons_sent = engine.fe_max_num_logons_sent ) )\n    ==>\n    ( engine'.fe_curr_mode = Error &&\n        engine'.fe_curr_status = MaxNumLogonMsgsViolated )\n;;",
      "language": "scala",
      "name": "Logon VG.4"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Logon VG.5"
}
[/block]
> *"`NextExpectedMsgSeqNum (789)` is used as follows:*
> *In its Logon request the session initiator supplies in `NextExpectedMsgSeqNum (789)` the value next expected from the session acceptor in MsgSeqNum (34). The outgoing header MsgSeqNum (34) of the Logon request is assigned the next-to-be-assigned sequence number as usual.*

The session acceptor validates the Logon request including that NextExpectedMsgSeqNum (789) does not represent a gap. It then constructs its Logon response with NextExpectedMsgSeqNum (789) containing the value next expected from the session initiator in MsgSeqNum (34) having incremented the number above the Logon request if that was the sequence expected. The outgoing header MsgSeqNum (34) is constructed as usual. The session initiator waits to begin sending application messages until it receives the Logon response. When it is received the initiator validates the response including that NextExpectedMsgSeqNum (789) does not represent a gap.

Both sides react to NextExpectedMsgSeqNum (789) from its counterparty thus:
- If equal to the next-to-be-assigned sequence, proceed sending new messages beginning with that number.
- If lower than the next-to-be-assigned sequence, 'recover' (see 'Message Recovery') all messages from the the last message delivered prior to this Logon through the specified `NextExpectedMsgSeqNum (789)` sending them in order; then Gap Fill over the sequence number used in Logon and proceed sending newly queued messages with a sequence number one higher than the original Logon.
- If higher than the next-to-be-assigned sequence, send Logout to abort the session.

Neither side should generate a ResendRequest based on MsgSeqNum (34) of the incoming Logon message but should expect any gaps to be filled automatically. If a gap is produced by the Logon message MsgSeqNum (34), the receive logic should expect the gap to be filled automatically prior to receiving any messages with sequences above the gap."

[block:code]
{
  "codes": [
    {
      "code": "let is_next_expected_msg_seq_num_present ( m, next_seq_num : full_top_level_msg option * int ) =\n    match m with\n    | None -> true\n    | Some msg ->\n    match msg with\n    | ValidMsg vmsg -> (\n        match vmsg.full_msg_data with\n        | Full_FIX_App_Msg _ -> false\n        | Full_FIX_Admin_Msg amsg -> (\n            match amsg with\n            | Full_Msg_Logon data ->  (\n                match data.ln_next_expected_msg_seq_num with\n                | None -> false\n                | Some seq_num -> seq_num = next_seq_num\n            )\n            | _ -> false\n         )\n    )\n    | _ -> false\n;;",
      "language": "scala",
      "name": "Logon VG.5"
    }
  ]
}
[/block]