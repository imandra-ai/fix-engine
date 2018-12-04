open Model_messages

let get_resend_message (msg:model_top_level_msg):model_top_level_msg = 
  match msg with
  | Model_messages.FIX_TL_Normal m -> Model_messages.FIX_TL_PossibleResend m 
  | m -> m
;;