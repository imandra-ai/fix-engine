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

let error_to_string = function
  | UnknownMessageTag s -> Format.asprintf "UnknownMessageTag: %s" s
  | RequiredTagMissing s -> Format.asprintf "RequiredTagMissing: %s" s
  | DuplicateTag s -> Format.asprintf "DuplicateTag: %s" s
  | WrongValueFormat s -> Format.asprintf "WrongValueFormat: %s" s
  | UndefinedTag s -> Format.asprintf "UndefinedTag: %s" s
  | EmptyValue s -> Format.asprintf "EmptyValue: %s" s
  | IncorrectNumInGroupCount s ->
    Format.asprintf "IncorrectNumInGroupCount: %s" s
  | RepeatingGroupOutOfOrder s ->
    Format.asprintf "RepeatingGroupOutOfOrder: %s" s
  | GarbledMessage -> "GarbledMessage"

let pp_error fmt e =
  let s = error_to_string e in
  Format.fprintf fmt "%s" s

type nonrec 'a result = ('a, error) result
(** Result of parsing *)

open struct
  (* Extract a value given a tag, returns a pair with the value and the rest of the list.*)
  let take (key : string) (lst : (string * string) list) =
    let rec take accu = function
      | (k, v) :: tl ->
        if k = key then
          Some v, List.rev accu @ tl
        else
          take ((k, v) :: accu) tl
      | [] -> None, List.rev accu
    in
    take [] lst

  (* Splits a list of [(tag * value)] pairs into two lists on a given tag. The tag
     itself goes into the second list.  If the tag is absent -- returnes an empty
     second list.

     {[
       split_on_tag 4 [(1,0); (2,0); (3,0); (4,0); (5,0); (6,0)] =>
       ( [ (1,0); (2,0); (3,0) ] ,
         [ (4,0); (5,0); (6,0) ]
       )
     ]}
  *)
  let split_on_tag (key : string) (msg : (string * string) list) =
    let rec split accu = function
      | (k, v) :: tl ->
        if k = key then
          List.rev accu, (k, v) :: tl
        else
          split ((k, v) :: accu) tl
      | [] -> List.rev accu, []
    in
    split [] msg
end

(* internal state during parsing *)
type state_ = { mutable msg: Message.t }

exception Fail of error

type +'a t = { run: state_ -> 'a } [@@unboxed]

type +'a value_parser = string -> 'a option

let or_raw_fix value_parser s =
  match value_parser s with
  | Some x -> Some (Ok x)
  | None -> Some (Error s)

let return x = { run = (fun _ -> x) }

let fail_ e = raise (Fail e)

let fail e = { run = (fun _ -> fail_ e) }

let get_msg = { run = (fun st -> st.msg) }

let set_msg msg =
  {
    run =
      (fun st ->
        st.msg <- msg;
        ());
  }

let reflect_err p =
  {
    run =
      (fun st ->
        match p.run st with
        | x -> Ok x
        | exception Fail e -> Error e);
  }

module Infix = struct
  let ( >|= ) p f : _ t = { run = (fun st -> f (p.run st)) }

  let ( >>= ) p f : _ t = { run = (fun st -> (f (p.run st)).run st) }

  let ( let+ ) = ( >|= )

  let ( let* ) = ( >>= )

  let ( and+ ) p1 p2 : _ t =
    {
      run =
        (fun st ->
          let x = p1.run st in
          let y = p2.run st in
          x, y);
    }

  let ( and* ) = ( and+ )
end

include Infix

let req tag p : _ t =
  {
    run =
      (fun st ->
        let value, msg = take tag st.msg in
        st.msg <- msg;
        match value with
        | None -> fail_ @@ RequiredTagMissing tag
        | Some "" -> fail_ @@ EmptyValue tag
        | Some v ->
          (match p v with
          | Some x -> x
          | None -> fail_ @@ WrongValueFormat tag
          | exception _ -> fail_ @@ WrongValueFormat tag));
  }

let opt tag p : _ t =
  {
    run =
      (fun st ->
        let value, msg = take tag st.msg in
        st.msg <- msg;
        match value with
        | None -> None
        | Some "" -> fail_ @@ EmptyValue tag
        | Some v ->
          (match p v with
          | Some x -> Some x
          | None -> fail_ @@ WrongValueFormat tag
          | exception _ -> fail_ @@ WrongValueFormat tag));
  }

(* Uses the first entry tag in the input list to split the list into a list of
   lists, each starting with the tag.
   Splits [ [(10,0); (11,0); (12,0); (10, 1); (11,1); (10,2); (40,2)] ] into
   [ [[(10,0); (11,0); (12,0)]; [(10, 1); (11,1)]; [(10,2); (40,2)]] ]
*)
let cut_on_separator (msg : (string * string) list) =
  match msg with
  | [] -> []
  | (separator, _) :: _ ->
    (* we got the separator, now we can split into groups starting with it *)
    let groups = ref [] in
    let cur_group = ref [] in

    let rec split_on_sep = function
      | (k, v) :: tl when k = separator ->
        if !cur_group <> [] then groups := List.rev !cur_group :: !groups;
        cur_group := [ k, v ];
        split_on_sep tl
      | (k, v) :: tl ->
        cur_group := (k, v) :: !cur_group;
        split_on_sep tl
      | [] ->
        assert (!cur_group <> []);
        groups := List.rev !cur_group :: !groups
    in
    split_on_sep msg;
    List.rev !groups

(* parse [msg] using [p], reusing [st]. Only [msg] will be visible
   to the sub-parser [p], however the checking of unused fields is
   shared. *)
let parse_sub (_st : state_) (p : 'a t) ~(msg : msg) : 'a * msg =
  let st' = { msg } in
  let x = p.run st' in
  x, st'.msg

let check_duplicate_tags : _ t =
  {
    run =
      (fun st ->
        let seen = ref Str_set.empty in
        List.iter
          (fun (tag, _) ->
            if Str_set.mem tag !seen then fail_ @@ DuplicateTag tag;
            seen := Str_set.add tag !seen)
          st.msg);
  }

let do_check_unknown_tags = ref true

let check_unknown_tags : _ t =
  {
    run =
      (fun st ->
        if not !do_check_unknown_tags then
          ()
        else (
          match st.msg with
          | [] -> ()
          | (tag, _) :: _ -> fail_ @@ UndefinedTag tag
        ));
  }

let parse_int = int_of_string_opt

let repeating tag ~(block_parser : 'a t) : (_ * 'a list) t =
  {
    run =
      (fun st ->
        (* Finding where the repeating group starts *)
        let leading_msg, groups_msg = split_on_tag tag st.msg in
        (* groups_msg starts with the NumInGroup tag, we parse it *)
        let numInGroup, groups_msg =
          parse_sub st (opt tag parse_int) ~msg:groups_msg
        in
        match numInGroup with
        | None -> None, []
        | Some 0 ->
          st.msg <- leading_msg @ groups_msg;
          Some 0, []
        | Some numInGroup ->
          (* Break the list into a list of lists using the separator *)
          let groups : msg list = cut_on_separator groups_msg in
          (* Check that the length is correct *)
          if List.length groups <> numInGroup then
            fail_ (IncorrectNumInGroupCount tag)
          else (
            (* Pass each list into the block parser ( reverses the list ) *)
            let groups : (_ * msg) list =
              List.rev_map
                (fun grp -> parse_sub st block_parser ~msg:grp)
                groups
            in
            (* Get the rest of the message from the last group entry *)
            let groups, msg_remainder =
              match groups with
              | [] -> [], []
              | (v, following_msg) :: tl ->
                (v, []) :: tl, leading_msg @ following_msg
            in
            (* Check that every group have parsed cleanly *)
            let groups =
              List.rev_map
                (function
                  | v, [] -> v
                  | _, (k, _) :: _tl -> fail_ @@ RepeatingGroupOutOfOrder k)
                groups
            in
            (* "Monadic flatten" the list and pass into the continuation with the rest of the message *)
            st.msg <- msg_remainder;

            Some numInGroup, groups
          ));
  }

let run (self : _ t) (msg : msg) : _ result =
  let st = { msg } in
  try Ok (self.run st) with Fail e -> Error e
