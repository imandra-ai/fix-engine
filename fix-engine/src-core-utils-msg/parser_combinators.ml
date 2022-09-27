(* rewriting of Parser_utils *)

module Str_set = Set.Make (String)

type msg = Message.t

type tag = string

type error =
  | UnknownMessageTag of string
  | RequiredTagMissing of string
  | DuplicateTag of string
  | WrongValueFormat of string
  | UndefinedTag of string
  | EmptyValue of string
  | IncorrectNumInGroupCount of string
  | RepeatingGroupOutOfOrder of string
  | GarbledMessage

(** Result of parsing *)
type nonrec 'a result = ('a, error) result

(* internal state during parsing *)
type state_ =
  { mutable msg : Message.t
  ; mutable not_queried : Str_set.t
  }

exception Fail of error

type +'a t = { run : state_ -> 'a } [@@unboxed]

type +'a value_parser = string -> 'a option

let return x = { run = (fun _ -> x) }

let fail_ e = raise (Fail e)

let fail e = { run = (fun _ -> fail_ e) }

module Infix = struct
  let ( >|= ) p f : _ t = { run = (fun st -> f (p.run st)) }

  let ( >>= ) p f : _ t = { run = (fun st -> (f (p.run st)).run st) }

  let ( let+ ) = ( >|= )

  let ( let* ) = ( >>= )

  let ( and+ ) p1 p2 : _ t =
    { run =
        (fun st ->
          let x = p1.run st in
          let y = p2.run st in
          (x, y) )
    }


  let ( and* ) = ( and+ )
end

include Infix

let mark_tag_as_used_ (st : state_) ~tag : unit =
  st.not_queried <- Str_set.remove tag st.not_queried


let req tag p : _ t =
  { run =
      (fun st ->
        mark_tag_as_used_ st ~tag ;
        match List.assoc_opt tag st.msg with
        | None ->
            fail_ @@ RequiredTagMissing tag
        | Some "" ->
            fail_ @@ EmptyValue tag
        | Some v ->
          ( match p v with
          | Some x ->
              x
          | None ->
              fail_ @@ WrongValueFormat tag
          | exception _ ->
              fail_ @@ WrongValueFormat tag ) )
  }


let opt tag p : _ t =
  { run =
      (fun st ->
        mark_tag_as_used_ st ~tag ;
        match List.assoc_opt tag st.msg with
        | None ->
            None
        | Some "" ->
            fail_ @@ EmptyValue tag
        | Some v ->
          ( match p v with
          | Some x ->
              Some x
          | None ->
              fail_ @@ WrongValueFormat tag
          | exception _ ->
              fail_ @@ WrongValueFormat tag ) )
  }


let find_beginning_of_repeating_ ~tag (st : state_) : _ option =
  let rec loop = function
    | [] ->
        None
    | (k, v) :: tl when tag = k ->
        Some (v, tl)
    | _ :: tl ->
        loop tl
  in
  loop st.msg


(* Uses the first entry tag in the input list to split the list into a list of
   lists, each starting with the tag.
   Splits [ [(10,0); (11,0); (12,0); (10, 1); (11,1); (10,2); (40,2)] ] into
   [ [[(10,0); (11,0); (12,0)]; [(10, 1); (11,1)]; [(10,2); (40,2)]] ]
*)
let cut_on_separator (msg : (string * string) list) =
  match msg with
  | [] ->
      []
  | (separator, _) :: _ ->
      (* we got the separator, now we can split into groups starting with it *)
      let groups = ref [] in
      let cur_group = ref [] in

      let rec split_on_sep = function
        | (k, v) :: tl when k = separator ->
            if !cur_group <> [] then groups := List.rev !cur_group :: !groups ;
            cur_group := [ (k, v) ] ;
            split_on_sep tl
        | (k, v) :: tl ->
            cur_group := (k, v) :: !cur_group ;
            split_on_sep tl
        | [] ->
            assert (!cur_group <> []) ;
            groups := List.rev !cur_group :: !groups
      in
      split_on_sep msg ;
      List.rev !groups


(* parse [msg] using [p], reusing [st]. Only [msg] will be visible
   to the sub-parser [p], however the checking of unused fields is
   shared. *)
let parse_sub (st : state_) (p : 'a t) ~(msg : msg) : 'a =
  let st' = { st with msg } in
  p.run st'


let check_duplicate_tags : _ t =
  { run =
      (fun st ->
        let seen_and_not_queried = ref Str_set.empty in
        List.iter
          (fun (tag, _) ->
            if Str_set.mem tag st.not_queried
            then (
              if Str_set.mem tag !seen_and_not_queried
              then fail_ @@ DuplicateTag tag ;
              seen_and_not_queried := Str_set.add tag !seen_and_not_queried ) )
          st.msg ;
        () )
  }


let check_unknown_tags : _ t =
  { run =
      (fun st ->
        match Str_set.choose_opt st.not_queried with
        | None ->
            ()
        | Some tag ->
            fail_ @@ UndefinedTag tag )
  }


let repeating tag ~(block_parser : 'a t) : (_ * 'a list) t =
  { run =
      (fun st ->
        match find_beginning_of_repeating_ ~tag st with
        | None ->
            (None, [])
        | Some (v, rest) ->
            (* parse length expressed in [v] *)
            let num_groups =
              try int_of_string v with _ -> fail_ @@ WrongValueFormat tag
            in
            if num_groups = 0
            then (None, [])
            else
              (* split [rest] into a list of groups. The last group also
                 contains the remainder of the message. *)
              let group_msg_l = cut_on_separator rest in
              if List.length group_msg_l <> num_groups
              then fail_ @@ IncorrectNumInGroupCount tag ;

              (* Parse group, check that it used all tags *)
              let block_parser_checking_all_used : _ t =
                let* x = block_parser in
                let+ () = check_unknown_tags in
                x
              in

              let groups =
                List.mapi
                  (fun i group_msg ->
                    (* locally, focus on [group_msg] only. For every group but
                       the last, we also check that all pairs are used. *)
                    let p =
                      if i + 1 = num_groups
                      then block_parser
                      else block_parser_checking_all_used
                    in
                    parse_sub st p ~msg:group_msg )
                  group_msg_l
              in
              (Some num_groups, groups) )
  }


let run (self : _ t) (msg : msg) : _ result =
  (* gather all fields *)
  let not_queried =
    List.fold_left (fun set (k, _) -> Str_set.add k set) Str_set.empty msg
  in
  let st = { msg; not_queried } in
  try Ok (self.run st) with Fail e -> Error e
