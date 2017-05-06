(** *)
(***

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    full_admin_enums.ml

*)

(** Session rejection reasons. *)
type fix_session_reject_reason =
    | InvalidTagNumber
    | RequiredTagMissing
    | TagNotDefined
    | UndefinedTag
    | TagSecifiedWithoutAValue
    | ValueIsIncorrect
    | IncorrectDataFormatForValue
    | DecryptionProblem
    | SignatureProblem
    | CompIDProblem
    | SendingTimeAccuracyProblem
    | InvalidMsgType
    | XMLValidationError
    | TagAppearsMoreThanOnce
    | TagSpecifiedOutOfRequiredOrder
    | RepeatingGroupFieldsOutOfOrder
    | IncorrectNumInGroupCountForRepeatingGroup
    | NonDataValueIncludesFieldDelimiter
;;


(* Business rejection reasons *)
type fix_business_reject_reason = 
    | ApplicationDown
    | MessageTypeNotSupported
    | FieldMissing
;;

(* Application rejection reasons. *)
type fix_app_reject_reason = 
    | FIX_App_Reject_MissingReqField
    | FIX_App_Reject_InvalidField
    | FIX_App_Reject_Custom
;;


(** GapFillFlag <123> field *)
type fix_gapfillflag =
    | FIX_GapFillFlag_Y
    | FIX_GapFillFlag_N
;;

(** Encryption methods available. *)
type fix_encryption_method =
    | PKCS          
    | DES_ECB       
    | PKCS_DES      
    | PGP_DES       
    | PGP_DES_MD5   
    | PEM_DES_MD5   
    | NoEncryption
;;
