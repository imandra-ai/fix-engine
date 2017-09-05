!#/bin/bash

make server
cp _build/default/src-simulation/server.bc .

make build_tests
cp _build/default/src-tests/test_runner.bc .

run_test () {
    echo "Runnning test $1"
    ./server.bc > /dev/null & pid_server=$! 
    sleep 1
    ./test_runner.bc $1 | tr '\001' '|'
    kill $pid_server
}

run_test ./defs/1a_ValidLogonMsgSeqNumTooHigh.def
run_test ./defs/1a_ValidLogonWithCorrectMsgSeqNum.def
run_test ./defs/1e_NotLogonMessage.def
run_test ./defs/13b_UnsolicitedLogoutMessage.def
run_test ./defs/2a_MsgSeqNumCorrect.def
run_test ./defs/2b_MsgSeqNumTooHigh.def
run_test ./defs/2c_MsgSeqNumTooLow.def
run_test ./defs/2d_GarbledMessage.def
run_test ./defs/2e_PossDupAlreadyReceived.def
run_test ./defs/2e_PossDupNotReceived.def
run_test ./defs/2f_PossDupOrigSendingTimeTooHigh.def
run_test ./defs/2g_PossDupNoOrigSendingTime.def
run_test ./defs/7_ReceiveRejectMessage.def
run_test ./defs/3c_GarbledMessage.def
run_test ./defs/4a_NoDataSentDuringHeartBtInt.def
run_test ./defs/4b_ReceivedTestRequest.def
run_test ./defs/8_AdminAndApplicationMessages.def
run_test ./defs/8_OnlyApplicationMessages.def
run_test ./defs/8_OnlyAdminMessages.def
run_test ./defs/20_SimultaneousResendRequest.def

run_test ./defs/10_MsgSeqNumEqual.def
run_test ./defs/10_MsgSeqNumGreater.def
run_test ./defs/10_MsgSeqNumLess.def

run_test ./defs/11a_NewSeqNoGreater.def
run_test ./defs/11b_NewSeqNoEqual.def
run_test ./defs/11c_NewSeqNoLess.def

run_test ./defs/14b_RequiredFieldMissing.def
run_test ./defs/14h_RepeatedTag.def
run_test ./defs/14f_IncorrectDataFormat.def
run_test ./defs/14i_RepeatingGroupCountNotEqual.def
run_test ./defs/14j_modified_OutOfOrderRepeatingGroupMembers.def

