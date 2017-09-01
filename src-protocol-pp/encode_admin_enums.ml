
(*** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2017
    
    parse_admin_enums.ml

*)

open Full_admin_enums;;


let encode_session_reject_reason = function
    | InvalidTagNumber                          -> "0"                            
    | RequiredTagMissing                        -> "1"                          
    | TagNotDefined                             -> "2"                               
    | UndefinedTag                              -> "3"                                
    | TagSecifiedWithoutAValue                  -> "4"                    
    | ValueIsIncorrect                          -> "5"                            
    | IncorrectDataFormatForValue               -> "6"                 
    | DecryptionProblem                         -> "7"                           
    | SignatureProblem                          -> "8"                            
    | CompIDProblem                             -> "9"                               
    | SendingTimeAccuracyProblem                -> "10"                 
    | InvalidMsgType                            -> "11"                             
    | XMLValidationError                        -> "12"                         
    | TagAppearsMoreThanOnce                    -> "13"                     
    | TagSpecifiedOutOfRequiredOrder            -> "14"             
    | RepeatingGroupFieldsOutOfOrder            -> "15"             
    | IncorrectNumInGroupCountForRepeatingGroup -> "16"  
    | NonDataValueIncludesFieldDelimiter        -> "17"         
;;


let encode_business_reject_reason = function
    | ApplicationDown         -> "4"  
    | MessageTypeNotSupported -> "3"  
    | FieldMissing            -> "5"  
;;


let encode_app_reject_reason = function
    | FIX_App_Reject_MissingReqField -> "5" 
    | FIX_App_Reject_InvalidField    -> "1" 
    | FIX_App_Reject_Custom          -> "0" 
;;


let encode_GapFillFlag = function
    | FIX_GapFillFlag_Y -> "Y" 
    | FIX_GapFillFlag_N -> "N" 
;;


let encode_encryption_method = function
    | PKCS         -> "0"   
    | DES_ECB      -> "1"   
    | PKCS_DES     -> "2"   
    | PGP_DES      -> "3"   
    | PGP_DES_MD5  -> "4"   
    | PEM_DES_MD5  -> "5"   
    | NoEncryption -> "6"  
;;

(** *)
let encode_MsgDirection ( d ) =
    (match d with
        | FIX_MsgDirection_Send -> "S"
        | FIX_MsgDirection_Receive -> "R"
    )
;;
