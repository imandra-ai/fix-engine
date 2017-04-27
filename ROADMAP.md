# Generated modules

The following modules are to be generated

### `src-protocol-exts`

* `src-protocol-exts/full_app_tags.ml`  
    Tags for application messages and fields
    * type full_app_msg_tag
    * type full_app_field_tag 

* `src-protocol-exts/full_app_enums.ml`  
    Applicaton-level enums
    * type fix_{fieldname} 

* `src-protocol-exts/full_app_record.ml`  
    Applicaton-level records
    * type fix_{blockname} 
    * val init_{blockname} --  Default values (all None) for the records

* `src-protocol-exts/full_app_messages.ml`  
    Applicaton message data
    * type full_msg_{messagename}_data   
    * val init_msg_{messagename}_data : full_msg_{messagename}_data  
    * type full_app_msg_data  -- Common type for all application messages
    * val get_full_app_msg_tag : full_app_msg_data -> full_app_msg_tag

### `src-protocol-exts-pp`
JSON pretty-printers and FIX wire parsers for all `src-protocol-exts` types


# Fixed modules

The following modules are fixed -- no code is supposed to be generated there

### `src`

* `src/fix_engine.ml`  
   FIX protocol model. Includes the `one_step` function
   * type manual_int_data
   * type session_data
   * type fix_engine_int_msg
   * type fix_engine_status
   * type fix_engine_mode
   * type fix_engine_state


### `src-core`

* `src-core/base_types.ml`  
    Base types and enums
    * type fix_symbol
    * type fix_string
    * type fix_bool
    * type fix_currency
    * type fix_country
    * type fix_exchange

* `./src-core/datetime.ml`  
    Datetime types and utilities
    * type fix_utctimestamp
    * type fix_localmktdate
    * type fix_week
    * type fix_monthyear
    * type fix_utctimeonly
    * type fix_utcdateonly
    * type fix_duration

* `src-core/numeric.ml`  
    Floating point types and utilities
    * type fix_float
    * type fix_float_data

### `src-protocol`

* `src-protocol/full_admin_enums.ml`  
    Admin message enums
    * type fix_session_reject_reason 
    * type fix_business_reject_reason 
    * type fix_app_reject_reason 
    * type fix_gapfillflag 
    * type fix_encryption_method 

* `src-protocol/full_admin_messages.ml`  
    Admin message data
    * type full_msg_heartbeat_data
    * type full_msg_logon_data
    * type full_msg_logoff_data
    * type full_msg_resend_request_data
    * type full_msg_reject_data
    * type full_msg_sequence_reset_data
    * type full_msg_test_request_data
    * type full_msg_business_reject_data
    * type full_admin_msg_data -- Common type for all admin messages

* `src-protocol/full_messages.ml`  
    Top-level message types
    * type full_msg_data
    * type session_rejected_msg_data
    * type biz_rejected_msg_data
    * type fix_header
    * type fix_trailer
    * type full_valid_fix_msg
    * type full_top_level_msg

* `src-protocol/full_admin_tags.ml`  
    Tags for admin messages and fields
    * type full_admin_msg_tag
    * type full_admin_field_tag

* `src-protocol/full_message_tags.ml`  
    Top-level tags types
    * type full_msg_tag
    * type full_field_tag

### `src-core-pp`  
JSON pretty-printers and FIX wire parsers for all `src-core` and `src` types

### `src-protocol-pp`  
JSON pretty-printers and FIX wire parsers for all `src-protocol` types
~                                                                                
