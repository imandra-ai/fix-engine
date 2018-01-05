---
title: "Message Lifecycle"
tag: "MessageLifecycle"
sequence: 4
---
There are 5 outcomes to an engine/venue model to receiving a message:
- Ignored - cases when message is malformed (missing or out-of-order important tags, etc).
- Session reject - pertains to violation of protocol requirements.
- Business reject - there are 3 categories for such reject: 
1. Venue is down (cannot accept any messages)
2. Message type is not supported by venue
3. Message lacks a field conditionally required by the FIX specification (note that this only applies to fields required by the FIX specification, NOT the custom venue requirements).

Message-specific reject - when an incoming message's parameters are inconsistent with the state of the model (there ), it will respond with a rejection through a corresponding message. For example, New Order Single message would be rejected through Execution Report. Section below contains the 'mapping' of expected outgoing types of messages.
Processed - message is accepted by the venue and results in a modified state.
### Message Ignored

What constitutes a garbled message (message is ignored):
- BeginString (tag #8) 
   - is not the first tag in a message
   - not of the format 8=FIX.n.m.
- BodyLength (tag #9) 
   - is not the second tag in a message 
   - is not a properly formatted integer 
   - does not contain the correct byte count.
- MsgType (tag #35) 
   - is not the third tag in a message.
   - does not have a value
- Checksum (tag #10) 
   - is not the last tag of the message 
   - does not contain a properly formatted integer
   - is not equal to byte count of the message body
MsgSeqNum(tag #34)
   - is missing 
   - does not contain a properly formatted integer
 
If the MsgSeqNum(tag #34) is missing, a logout message should be sent terminating the FIX Connection, as this indicates a serious application error that is likely only circumvented by software modification.

### Session Reject

The session reject message should be issued when a message is received but cannot be properly processed due to a session-level rule violation. An example of when a reject may be appropriate would be the receipt of a message with invalid basic data (e.g. MsgType=&) which successfully passes de-encryption, CheckSum and BodyLength checks. As a rule, messages should be forwarded to the trading application for business level rejections whenever possible.

Rejected messages should be logged and the incoming sequence number incremented.

Note: The receiving application should disregard any message that is garbled, cannot be parsed or fails a data integrity check. Processing of the next valid FIX message will cause detection of a sequence gap and a Resend Request will be generated. Logic should be included in the FIX engine to recognize the possible infinite resend loop, which may be encountered in this situation.

Generation and receipt of a Reject message indicates a serious error that may be the result of faulty logic in either the sending or receiving application.

If the sending application chooses to retransmit the rejected message, it should be assigned a new sequence number and sent with PossResend=Y.

Whenever possible, it is strongly recommended that the cause of the failure be described in the Text field (e.g. INVALID DATA - FIELD 35).

If an application-level message received fulfils session-level rules, it should then be processed at a business message-level. If this processing detects a rule violation, a business-level reject should be issued. Many business-level messages have specific “reject” messages, which should be used. All others can be rejected at a business-level via the Business Message Reject message. See Volume 1: "Business Message Reject" message.

Note that in the event a business message is received, fulfils session-level rules, however, the message cannot be communicated to the business-level processing system, a Business Message Reject with BusinessRejectReason = “Application not available at this time” should be issued.

Session Reject Reasons:

| 0 || Invalid tag number |
| 1 || Required tag missing |
| 2 || Tag not defined for this message type |
| 3 || Undefined Tag |
| 4 || Tag specified without a value |
| 5 || Value is incorrect (out of range) for this tag |
| 6 || Incorrect data format for value |
| 7 || Decryption problem |
| 8 || Signature problem |
| 9 || CompID problem | 
| 10 || SendingTime accuracy problem |
| 11 || Invalid MsgType |
| 12 || XML Validation error |
| 13 || Tag appears more than once |
| 14 || Tag specified out of required order |
| 15 || Repeating group fields out of order |
| 16 || Incorrect NumInGroup count for repeating group |
| 17 || Non “data” value includes field delimiter (SOH character) |
| 99 ||  Other (Note other session-level rule violations may exist in which case SessionRejectReason of Other may be used and further information may be in Text field.) |

### When to send a session Reject vs. when to ignore the message

The following excerpt is taken from the Reject message definition within the FIX Protocol specification:
Note: The receiving application should disregard any message that is garbled, cannot be parsed or fails a data integrity check. Processing of the next valid FIX message will cause detection of a sequence gap and a Resend Request will be generated. Logic should be included in the FIX engine to recognize the possible infinite resend loop, which may be encountered in this situation.

The FIX Protocol takes the optimistic view; it presumes that a garbled message is received due to a transmission error rather than a FIX system problem. Therefore, if a Resend Request is sent the garbled message will be retransmitted correctly. If a message is not considered garbled then it is recommended that a session level Reject message be sent.

### Business Reject

The Business Message Reject message can reject an application-level message which fulfils session-level rules and cannot be rejected via any other means. Note if the message fails a session-level rule (e.g. body length is incorrect), a session-level Reject message should be issued.
Instances when a Business Reject message is sent out for a message that fulfils session-level rules:
- Cannot be communicated to the venue model. 
- It is not supported by the recipient. 
- Lacks a field conditionally required by the FIX specification. In this situation a Business Message Reject with BusinessRejectReason = "Conditionally Required Field Missing" can be issued if the system is unable to send the specific "reject" message listed above. One example would be a stop order missing StopPx. However, a Business Reject message MUST NOT be used to enforce proprietary rules more restrictive that those explicit in the FIX specification, such as a broker requiring an order to contain an Account, which the FIX specification considers an optional field. 

### Message-Specific Reject

There are two method of responding with a reject message:
- Missing required field - a field may be identified as 'required' (using 'req' or 'required' keyword in front of the field name) or 'optional' (using 'opt' or 'optional' keywords in front of the name). By default, if the keyword is omitted, a field is considered optional. If a required field is missing (the arriving message does not contain it), a message would be rejected.
- Field-reject - results from an inline 'valid' statement for an associated field.
- Custom-reject - results from 'validate' statement that is not associated with any specific field and has an associated enum value.

Recall the diagram at the beginning of this page. Here's a fragment that's relevant to the current discussion:
