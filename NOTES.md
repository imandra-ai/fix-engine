###`Base_types` 
* `fix_string` 
  * &#10003; type declaration (currently just `int`)
  * &#10007; operators
  * &#10007; all the `fix_string` complex parametrization/hashing/dictionary behavior   
* `fix_bool`
  * &#10003; type declaration (just `bool` alias)
  * &#10007; operators
* `fix_symbol` 
   * &#10067; Not sure if this is needed at all
* `fix_pricetype`, `fix_commtype`, `fix_timeinforce`, `fix_side`, ... e.t.c
   * &#9986;  Enums that are supposed to be generated from the FIX data dictionary.  
  I dont think that they belong to the Base_types module.  
* `fix_currency`, `fix_country`, `fix_exchange`
  * &#10067; These three are the special "big" enums -- they may have hundreds or even thousands of cases in them. Those need a special treatment. For example, I can treat them as `fix_string`s instead.   
*  `fix_session_reject_reason`, `fix_business_reject_reason`, `fix_app_reject_reason`
    * &#9986;  It feels like the reject reason variants should be in protocol-related module, not in `Base_types` 
*  `fix_encryption_method`, `fix_GapFillFlag`
  *  &#9986;  Enums needed for admin messages,  shouldn't they also be in protocol-related module, not in `Base_types`?

###`Datetime`
* &#10003;  `fix_utctimestamp`
* &#10003;  `fix_localmktdate`
* &#10003;  `fix_utctimeonly`
* `fix_duration`
   * &#10067; FIX specs do not really have a duration type 

#### `Numeric`
 * &#10003;  `fix_float` 
 * &#10067; This module is called `Numeric`, but devoted to fix_float

### `Full_session_core`
 * &#10003;`fix_header` 
 * &#10003;`fix_trailer`
 * &#10067; This module is pretty empty -- should we combine it with some other one?
