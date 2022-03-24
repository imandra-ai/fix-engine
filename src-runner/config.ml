type t =
  { comp_id        : string
  ; target_comp_id : string
  ; host_id        : string option
  ; on_behalf_id   : string option
  ; timer_tick     : float
  ; fix_port       : int
  }

let default_config =
  { comp_id = "IMANDRA"
  ; target_comp_id = "CLIENT"
  ; host_id = None
  ; on_behalf_id = None
  ; timer_tick = 1.0
  ; fix_port = 9880
  }

module Decode(D : Decoders.Decode.S) = struct
  open D.Infix

  let field_def field default d =
    let* v = D.field_opt field d in
    match v with None -> D.succeed default
    | Some v -> D.succeed v 

  let config : t D.decoder =
    let* comp_id = field_def "comp_id" default_config.comp_id  D.string in
    let* target_comp_id = field_def "target_comp_id" default_config.target_comp_id D.string in
    let* host_id = D.field_opt "host_id"  D.string in
    let* on_behalf_id = D.field_opt "on_behalf_id" D.string in
    let* timer_tick = field_def "timer_tick"  default_config.timer_tick D.float in
    let* fix_port = field_def "timer_tick"  default_config.fix_port D.int in
    D.succeed
    { comp_id
    ; target_comp_id
    ; host_id
    ; on_behalf_id
    ; timer_tick 
    ; fix_port
    }
  
end