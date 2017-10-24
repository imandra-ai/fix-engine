---
title: "Heartbeat Messages"
excerpt: ""
---
This section contains verification goals for Hearbeat messages.
[block:api-header]
{
  "title": "Heartbeat VG.1"
}
[/block]
 "When either end of a FIX connection has not sent any data for [HeartBtInt] seconds, it will transmit a Heartbeat message."

Notes: we transform this statement into 2 VGs:
- VG.1.1 - any outbound message will result in an updated `fe_last_time_data_sent` field
- VG.1.2 - any time update will result in check whether `Heartbeat` should be sent out
[block:code]
{
  "codes": [
    {
      "code": "verify last_time_data_sent_gets_updated ( engine : fix_engine_state ) =\n    let engine' = one_step ( engine ) in\n    ( engine.outgoing_fix_msg = None && engine'.outgoing_fix_msg <> None ) \n    ==> (engine'.fe_last_time_data_sent = engine'.fe_curr_time )\n;;",
      "language": "scala",
      "name": "Heartbeat VG.1.1"
    }
  ]
}
[/block]

[block:code]
{
  "codes": [
    {
      "code": "let outbound_msg_heartbeat ( m : full_top_level_msg option )=\n    match m with \n    | None  -> false\n    | Some msg  ->\n    match msg with\n    | ValidMsg vmsg -> (\n        match vmsg.full_msg_data with \n        | Full_FIX_Admin_Msg admin_msg  -> (\n            match admin_msg with \n            | Full_Msg_Hearbeat _       -> true\n            | Full_Msg_Test_Request _   -> true\n            | _                         -> false\n        )\n        | _ -> false\n    )\n    | _ -> false\n;;\n\nlet time_update_received ( m, last_time_data_sent, hbeat_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration ) =\n    match m with\n    | None -> false\n    | Some mint -> \n    match mint with \n    | TimeChange tc_data -> \n        let valid_time = utctimestamp_add ( last_time_data_sent, hbeat_interval ) in\n        utctimestamp_greaterThan ( tc_data, valid_time )\n    | _ -> false\n;;\n\nverify hbeat_sent_if_no_data_received ( engine : fix_engine_state ) =\n    let engine' = one_step ( engine ) in ( \n    engine.fe_curr_mode = ActiveSession && \n    is_int_message_valid ( engine) && \n    is_state_valid ( engine ) && \n    time_update_received ( engine.incoming_int_msg, engine.fe_last_time_data_sent, engine.fe_heartbeat_interval ) )\n    \n    ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )\n;;\n",
      "language": "scala",
      "name": "Heartbeat VG.1.2"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Heartbeat VG.2"
}
[/block]
Notes: there's no mention of what constitutes a successful data - i.e. is it a non-garbled (but still rejected message)? We interpret this here as that a Non-garbled message results in update of data received.

Also, it's important to note that we would not process an incoming message if the engine is in a Retransmit or CacheReplay mode, hence we use `let incoming_processed = engine.incoming_fix_msg <> engine'.incoming_fix_msg`
[block:code]
{
  "codes": [
    {
      "code": "let incoming_is_not_garbled ( m : full_top_level_msg option ) = \n    match m with \n    | None -> false\n    | Some msg ->\n    match msg with\n    | Garbled -> false\n    | _ -> true\n;;\n\nverify non_garbled_updates_clock ( engine : fix_engine_state ) =\n    let engine' = one_step (engine) in \n    let received_ts_correct =  ( engine.fe_curr_time = engine'.fe_last_data_received ) in \n    let incoming_processed = engine.incoming_fix_msg <> engine'.incoming_fix_msg in \n    ( incoming_is_not_garbled ( engine.incoming_fix_msg ) && incoming_processed) ==> received_ts_correct\n;;",
      "language": "scala",
      "name": "Heartbeat VG.2"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Heartbeat VG.3"
}
[/block]
'When either end of the connection has not received any data for (`HeartBtInt` + “some reasonable transmission time”) seconds, it will transmit a Test Request message.'

Notes: 'reasonable time' is represented by a 'duration' type field `fe_testreq_interval`.
[block:code]
{
  "codes": [
    {
      "code": "let no_heartbeats_received ( m, data_received, hbeat_interval, pad_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration * fix_duration ) =\n    match m with\n    | None -> false\n    | Some mint -> \n    match mint with \n    | TimeChange tc_data -> \n        let valid_time = utctimestamp_add ( data_received, hbeat_interval ) in\n        let valid_time_padded = utctimestamp_add ( valid_time, pad_interval ) in\n        utctimestamp_greaterThan ( tc_data, valid_time_padded )\n    | _ -> false\n;;\n\nlet msg_is_test_request ( m : full_top_level_msg option ) =\n    match m with \n    | None  -> false\n    | Some msg ->\n    match msg with\n    | ValidMsg vmsg -> (\n        match vmsg.full_msg_data with \n        | Full_FIX_Admin_Msg admin_msg  -> (\n            match admin_msg with \n            | Full_Msg_Test_Request _  -> true\n            | _ -> false\n        )\n        | _ -> false\n    )\n    | _ -> false\n;;\n\nverify test_request_sent_out ( engine : fix_engine_state ) =\n    let engine' = one_step ( engine ) in\n    ( is_int_message_valid ( engine ) &&\n      is_state_valid ( engine ) &&\n      engine.fe_curr_status = Normal && \n      engine.fe_curr_mode = ActiveSession && \n      no_heartbeats_received ( engine.incoming_int_msg, engine.fe_last_data_received, engine.fe_heartbeat_interval, engine.fe_testreq_interval ) )\n    ==> \n    msg_is_test_request ( engine'.outgoing_fix_msg )\n;;",
      "language": "scala",
      "name": "Heartbeat VG.3"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Heartbeat VG.4"
}
[/block]
"If there is still no Heartbeat message received after (HeartBtInt + “some reasonable transmission time”) seconds then the connection should be considered lost and corrective action be initiated."

Notes: note sure what 'corrective action be initiated' means, here we interpret it as meaning that a logoff message to be sent out, session closed and 'status' of the engine state set to `ConnTerminatedWithoutLogoff`. 
[block:code]
{
  "codes": [
    {
      "code": "let no_heartbeats_received_logoff ( m, data_sent_out, hbeat_interval, pad_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration * fix_duration ) =\n    match m with\n    | None -> false\n    | Some mint -> \n    match mint with \n    | TimeChange tc_data -> \n        let valid_time = utctimestamp_add ( data_sent_out, hbeat_interval ) in\n        let valid_time_padded = utctimestamp_add ( valid_time, pad_interval ) in\n        utctimestamp_greaterThan ( tc_data, valid_time_padded )\n    | _ -> false\n;;\n\nverify no_response_logoff ( engine : fix_engine_state ) =\n\tlet engine' = one_step ( engine ) in \n    \n  ( is_int_message_valid ( engine ) &&\n  \tis_state_valid ( engine ) &&\n    engine.fe_curr_mode = WaitingForHeartbeat && \n    no_heartbeats_received ( engine.incoming_int_msg, \t\t   engine.fe_last_time_data_sent, engine.fe_heartbeat_interval,  engine.fe_testreq_interval ) )\n    ==> \n    ( engine'.fe_curr_mode = NoActiveSession && \n      engine'.fe_curr_status = ConnTerminatedWithoutLogoff )\n;;\n",
      "language": "scala",
      "name": "Heartbeat VG.4"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Heartbeat VG.5"
}
[/block]
"If HeartBtInt is set to zero then no regular heartbeat messages will be generated. Note that a test request message can still be sent independent of the value of the `HeartBtInt`, which will force a Heartbeat message."

Notes: We implement 'test request message can still be sent independent of the value of the HeartBtInt' as internal message.
[block:code]
{
  "codes": [
    {
      "code": "let field_null ( f : int option ) =\n    match f with \n    | None      -> true\n    | Some x    -> x = 0\n;;\n\nlet hbeat_interval_null ( interval : fix_duration ) =\n    field_null ( interval.dur_years )   &&\n    field_null ( interval.dur_months )  && \n    field_null ( interval.dur_days )    && \n    field_null ( interval.dur_hours )   &&\n    field_null ( interval.dur_minutes ) &&\n    field_null ( interval.dur_seconds )\n;;\n\nlet hbeat_sent_if_no_data_received_new ( engine : fix_engine_state ) =\n    let engine' = one_step ( engine ) in \n    ( engine.fe_curr_mode = ActiveSession && \n    is_valid_utctimestamp ( engine.fe_last_data_received ) && \n    is_int_message_valid ( engine) && is_state_valid ( engine ) && \n    time_update_received ( engine.incoming_int_msg, engine.fe_last_data_received, engine.fe_heartbeat_interval ) )\n    ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )\n;;",
      "language": "scala",
      "name": "Heartbeat VG.5"
    }
  ]
}
[/block]

[block:api-header]
{
  "title": "Heartbeat VG.6"
}
[/block]
"Heartbeats issued as the result of `Test Request` must contain the `TestReqID` transmitted in the `Test Request` message. This is useful to verify that the Heartbeat is the result of the `Test Request` and not as the result of a regular timeout."

Note: that the sequence number of the `TestRequest` message must be correct so that the state does not transition into `Recovery`.
[block:code]
{
  "codes": [
    {
      "code": "let msg_is_test_request_id ( m, tr_id, seq_num : full_top_level_msg option * int * int ) =\n    match m with \n    | None  -> false\n    | Some msg ->\n    match msg with\n    | ValidMsg vmsg -> seq_num = vmsg.full_msg_header.h_msg_seq_num && (\n        match vmsg.full_msg_data with \n        | Full_FIX_Admin_Msg admin_msg  -> (\n            match admin_msg with \n            | Full_Msg_Test_Request data -> data.test_req_id = tr_id\n            | _ -> false\n        )\n        | _ -> false\n    )\n    | _ -> false\n;;\n\nlet correct_hbeat_sent ( m, tr_id : full_top_level_msg option * int ) =\n    match m with\n    | None -> false\n    | Some msg ->\n    match msg with \n    | ValidMsg vmsg -> (\n        match vmsg.full_msg_data with \n        | Full_FIX_Admin_Msg admin_msg  -> (\n            match admin_msg with \n            | Full_Msg_Hearbeat data ->  (\n                match data.hb_test_req_id with \n                | None -> false\n                | Some x -> x = tr_id\n            )\n            | _ -> false\n        )\n        | _ -> false\n    )\n    | _ -> false\n;;\n\nverify heartbeat_has_correct_id ( test_req_id, engine : int * fix_engine_state ) =\n    let engine' = one_step ( engine ) in \n    (   test_req_id > 0 && \n        engine.incoming_int_msg = None && \n        engine.fe_curr_mode = ActiveSession && \n        engine.fe_application_up && \n        msg_is_test_request_id ( engine.incoming_fix_msg, test_req_id, engine.incoming_seq_num + 1) )\n    ==> correct_hbeat_sent ( engine'.outgoing_fix_msg, test_req_id )\n;;",
      "language": "scala",
      "name": "Heartbeat VG.6"
    }
  ]
}
[/block]