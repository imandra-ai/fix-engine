
(*** 

    Aesthetic Integration Limited
    Copyright (c) 2014 - 2018
    
    parse_admin_enums.ml

*)

open Full_admin_enums;;


let parse_session_reject_reason = function
    | "0"  -> Some InvalidTagNumber                          
    | "1"  -> Some RequiredTagMissing                        
    | "2"  -> Some TagNotDefinedForThisMessageType
    | "3"  -> Some UndefinedTag                              
    | "4"  -> Some TagSecifiedWithoutAValue                  
    | "5"  -> Some ValueIsIncorrect                          
    | "6"  -> Some IncorrectDataFormatForValue               
    | "7"  -> Some DecryptionProblem                         
    | "8"  -> Some SignatureProblem                          
    | "9"  -> Some CompIDProblem                             
    | "10" -> Some SendingTimeAccuracyProblem                
    | "11" -> Some InvalidMsgType                            
    | "12" -> Some XMLValidationError                        
    | "13" -> Some TagAppearsMoreThanOnce                    
    | "14" -> Some TagSpecifiedOutOfRequiredOrder            
    | "15" -> Some RepeatingGroupFieldsOutOfOrder            
    | "16" -> Some IncorrectNumInGroupCountForRepeatingGroup 
    | "17" -> Some NonDataValueIncludesFieldDelimiter        
    |   _  -> None
;;


let parse_business_reject_reason = function
    | "4" -> Some ApplicationDown         
    | "3" -> Some MessageTypeNotSupported 
    | "5" -> Some FieldMissing            
    |  _  -> None
;;


let parse_app_reject_reason = function
    | "5" -> Some FIX_App_Reject_MissingReqField 
    | "1" -> Some FIX_App_Reject_InvalidField    
    | "0" -> Some FIX_App_Reject_Custom          
    |  _  -> None
;;


let parse_GapFillFlag = function
    | "Y" -> Some FIX_GapFillFlag_Y
    | "N" -> Some FIX_GapFillFlag_N
    |  _  -> None
;;


let parse_encryption_method = function
    | "0" -> Some PKCS          
    | "1" -> Some DES_ECB       
    | "2" -> Some PKCS_DES      
    | "3" -> Some PGP_DES       
    | "4" -> Some PGP_DES_MD5   
    | "5" -> Some PEM_DES_MD5   
    | "6" -> Some NoEncryption 
    |  _  -> None
;;

(** *)
let parse_MsgDirection ( str ) =
    (match str with
        | "S" -> (Some (FIX_MsgDirection_Send))
        | "R" -> (Some (FIX_MsgDirection_Receive))
        | _ -> (None)
    )
;;

