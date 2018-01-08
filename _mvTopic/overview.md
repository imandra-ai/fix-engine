---
title: "Overview and Status"
tag: overviewAndStatus
sequence: 2
---
In addition to the model source code, you will find a collection of Verification Goals (VGs). VGs are statements in IML expressing properties of the FIX engine model that we wish to verify. It's important to note that IML is used for both building the model and describing the properties we wish to verify about it.

Consider the following quote from Volume 2 of the FIX 4.4 specification:
> When either end of a FIX connection has not sent any data for [HeartBtInt] seconds, it will transmit a Heartbeat message.

One way to formalise that statement is to create two VGs:
- VG.1.1 - any outbound message will result in an updated `fe_last_time_data_sent` field
- VG.1.2 - any time update will result in check whether Heartbeat should be sent out
{% highlight ocaml %}

(* VG.1.1 *)
verify last_time_data_sent_gets_updated ( engine : fix_engine_state ) =
  let engine' = one_step ( engine ) in
  engine.outgoing_fix_msg = None && engine'.outgoing_fix_msg <> None
   ==>
  engine'.fe_last_time_data_sent = engine'.fe_curr_time
;;

(** VG.1.2 *)
let outbound_msg_heartbeat ( m : full_top_level_msg option ) =
  match m with
  | None      -> false
  | Some msg  ->
    match msg with
    | ValidMsg vmsg -> (
      match vmsg.full_msg_data with
      | Full_FIX_Admin_Msg admin_msg -> (
        match admin_msg with
        | Full_Msg_Hearbeat _        -> true
        | Full_Msg_Test_Request _    -> true
        | _                          -> false
      )
      | _ -> false
    )
    | _ -> false
;;

let time_update_received ( m, last_time_data_sent, hbeat_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration ) =
  match m with
  | None -> false
  | Some mint ->
    match mint with
    | TimeChange tc_data ->
       let valid_time = utctimestamp_add ( last_time_data_sent, hbeat_interval ) in
       utctimestamp_greaterThan ( tc_data, valid_time )
    | _ -> false
;;

verify hbeat_sent_if_no_data_received ( engine : fix_engine_state ) =
  let engine' = one_step ( engine ) in (
    engine.fe_curr_mode = ActiveSession
    && is_int_message_valid ( engine )
    && is_state_valid ( engine )
    && time_update_received ( engine.incoming_int_msg, engine.fe_last_time_data_sent, engine.fe_heartbeat_interval ) )
     ==>
    outbound_msg_heartbeat ( engine'.outgoing_fix_msg )
;;
{% endhighlight %}

It's important to note that the 'translation' of the English-prose statements into IML (or other mathematically precise formal languages) may not be unique. The inherent ambiguity of natural languages is a major reason why the efforts of formalising protocol specifications must be collaborative and industry-wide.

Notice how this approach differs from traditional 'testing'. In the statement above, we're making a high-level claim about the model behaviour, and we can subject this claim to analysis over the entire system state-space. When Imandra analyses the model with respect to such a statement, it works to symbolically verify that the claim holds in *all* possible scenarios. When such a claim does not hold, Imandra works to construct a precise sequence of events (a "counterexample") which exhibits a violation of the property.

### VG Status

For updates, see the Announcements page.

Status as of May 21st, 2017:

*Base*
- [x] VG.1 :: *When in ActiveSession (normal mode) and receiving a non garbled and non session-level rejected message and the application is down. Such message would be sent back with a Business Reject.*
- [x] VG.2 :: *FIX session should be terminated if the incoming sequence number is less than expected and the PossDupFlag is not set.*
- [x] VG.3 :: *Messages that are garbled will be ignored (sequence counter will not be incremented).*
- [x] VG.4 :: *Session rejected messages are rejected with the right reason and counter is incremented*

*Heartbeat Messages*
- [x] VG.1 :: *"When either end of a FIX connection has not sent any data for [HeartBtInt] seconds, it will transmit a Heartbeat message."*
- [x] VG.2 :: *Non-garbled message updates the clock.*
- [x] VG.3 :: *"When either end of the connection has not received any data for (HeartBtInt + “some reasonable transmission time”) seconds, it will transmit a Test Request message."*
- [x] VG.4 :: *"If there is still no Heartbeat message received after (HeartBtInt + 'some reasonable transmission time') seconds then the connection should be considered lost and corrective action be initiated."*

*Logon Messages*
- [x] VG.1 :: *"The logon message must be the first message sent by the application requesting to initiate a FIX session."*
- [x] VG.2 :: *"The session acceptor must be prepared to immediately begin processing messages after receipt of the Logon."
- [x] VG.3 :: *"After authentication, the initiator and acceptor must synchronize their messages through interrogation of the MsgSeqNum field before sending any queued or new messages."*
- [x] VG.4 ::  *"If the session acceptor has chosen to change the session encryption key, the session initiator must send a third Logon back to the other side in order to acknowledge the key change request."*
- [x] VG.5 ::  *NextExpectedMsgSeqNum is used correctly.*

*Logoff Messages*
- [ ] VG.1 :: * "Disconnection without the exchange of logout messages should be interpreted as an abnormal condition."*
- [ ] VG.2 :: *"Before actually closing the session, the logout initiator should wait for the opposite side to respond with a confirming logout message."*
- [ ] VG.3 :: *"After sending the Logout message, the logout initiator should not send any messages unless requested to do so by the logout acceptor via a ResendRequest."*

*Sequence Reset Messages*
- [x] VG.1 :: *"When the incoming sequence number does not match the expected corrective processing is required. Note that the SeqReset-Reset message (used only to recover from a disaster vs. normal resend request processing) is an exception to this rule as it should be processed without regards to its MsgSeqNum."*
- [ ] VG.2 ::  *"The Sequence Reset can only increase the sequence number. If a sequence reset is received attempting to decrease the next expected sequence number the message should be rejected and treated as a serious error."*

*Sequence Number Logic*
- [x] VG.1 :: *"Must always be the first message transmitted. Authenticate and accept the connection. After sending a Logon confirmation back, send a ResendRequest if a message gap was detected in the Logon sequence number."*
- [x] VG.2 :: *Out of sequence message would result in state transitioning into Recovery mode.*
- [ ] VG.3 :: *"Ignore the incoming sequence number. The NewSeqNo field of the SeqReset message will contain the sequence number of the next message to be transmitted."*
- [ ] VG.4 :: *Application messages that result in a gap, we'll transition into gap fill state.*

*Rejection Logic*
- [x] VG.1 :: * "During the gap fill process, certain administrative messages should not be retransmitted. Instead, a special SeqReset-GapFill message is generated."*