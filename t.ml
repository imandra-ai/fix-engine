type msg =
  | Msg of int
  | Gap of int * int

let rec update_cache cache msg =
  match (msg , cache) with
  | msg   , [] -> msg :: [] 
  | Msg x , (Msg m :: tl) -> 
    if x < m then msg::(Msg m)::cache    
    else Msg(m)::(update_cache tl msg) 
  | Gap (x,y) , (Msg m :: tl) -> 
    if y < m then msg :: (Msg m) :: tl else 
    if x <= m && m <= y then (update_cache tl msg) else
    (Msg m) :: (update_cache tl msg)
  | Msg x , (Gap(m,n)  :: tl) -> 
    if x < m then msg :: Gap(m,n) :: tl else 
    if m <= x && x <= n then (update_cache tl (Gap(m,n))) else
    Gap(m,n) :: (update_cache tl msg)
  | Gap (x,y) , (Gap(m,n) :: tl) -> 
    if y < m then Gap(x,y) :: Gap(m,n) :: tl else 
    if n < x then Gap(m,n) :: (update_cache tl msg) else
    update_cache tl (Gap(min m x, max n y))

let rec cache_increasing cache x =
  match cache with
  | Msg y :: tl -> if x > y  then false else cache_increasing tl y
  | Gap(y,z)  :: tl -> if x > y || y > z  then false else cache_increasing tl z
  | [] -> true


type info = 
  { txt : string
  ; urgent : bool 
  }

type p = {x : int ; i : info }

let f = function
  { i = {urgent ; _ } ; _ } -> urgent