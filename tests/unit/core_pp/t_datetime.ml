open Datetime
module Ptime = Imandra_ptime

let ( ~$ ) = Z.( ~$ )

open struct
  let assert_str_eq a b =
    if a <> b
    then (
      Printf.eprintf "not equal: %S vs %S\n%!" a b ;
      assert false )
end

module Encode_utc_dateonly = struct
  let () =
    let d : fix_utcdateonly =
      Ptime.of_date (~$2022, ~$09, ~$14) |> Option.get
    in
    let expect = "20220914" in
    assert_str_eq (Encode_datetime.encode_UTCDateOnly d) expect


  let () =
    let d : fix_utcdateonly =
      Ptime.of_date (~$2001, ~$01, ~$02) |> Option.get
    in
    let expect = "20010102" in
    assert_str_eq (Encode_datetime.encode_UTCDateOnly d) expect


  let () =
    let d : fix_utcdateonly = Ptime.of_date (~$702, ~$01, ~$22) |> Option.get in
    let expect = "07020122" in
    assert_str_eq (Encode_datetime.encode_UTCDateOnly d) expect
end

module Encode_utc_timeonly_milli = struct
  let () =
    let t : fix_utctimeonly_milli =
      make_utctimeonly_milli_unsafe ~$22 ~$35 ~$7 (Some ~$240)
    in
    let expect = "22:35:07.240" in
    assert_str_eq (Encode_datetime.encode_UTCTimeOnly_milli t) expect


  let () =
    let t : fix_utctimeonly_milli =
      make_utctimeonly_milli_unsafe ~$22 ~$35 ~$7 None
    in
    let expect = "22:35:07.000" in
    assert_str_eq (Encode_datetime.encode_UTCTimeOnly_milli t) expect
end

module Encode_utc_timeonly_micro = struct
  let () =
    let t : fix_utctimeonly_micro =
      make_utctimeonly_micro_unsafe ~$22 ~$35 ~$7 (Some ~$240102)
    in
    let expect = "22:35:07.240102" in
    assert_str_eq (Encode_datetime.encode_UTCTimeOnly_micro t) expect


  let () =
    let t : fix_utctimeonly_micro =
      make_utctimeonly_micro_unsafe ~$22 ~$35 ~$7 None
    in
    let expect = "22:35:07.000000" in
    assert_str_eq (Encode_datetime.encode_UTCTimeOnly_micro t) expect
end

module Encode_utc_timestamp_milli = struct
  let () =
    let t : fix_utctimestamp_milli =
      make_utctimestamp_milli_unsafe ~$2022 ~$9 ~$14 ~$22 ~$35 ~$7 (Some ~$124)
    in
    let expect = "20220914-22:35:07.124" in
    assert_str_eq (Encode_datetime.encode_UTCTimestamp_milli t) expect


  let () =
    let t : fix_utctimestamp_milli =
      make_utctimestamp_milli_unsafe ~$2022 ~$12 ~$1 ~$3 ~$35 ~$22 None
    in
    let expect = "20221201-03:35:22.000" in
    assert_str_eq (Encode_datetime.encode_UTCTimestamp_milli t) expect
end

module Encode_utc_timestamp_micro = struct
  let () =
    let t : fix_utctimestamp_micro =
      make_utctimestamp_micro_unsafe ~$2022 ~$9 ~$14 ~$22 ~$35 ~$7 (Some ~$2124)
    in
    let expect = "20220914-22:35:07.002124" in
    assert_str_eq (Encode_datetime.encode_UTCTimestamp_micro t) expect


  let () =
    let t : fix_utctimestamp_micro =
      make_utctimestamp_micro_unsafe ~$2022 ~$12 ~$1 ~$3 ~$35 ~$22 None
    in
    let expect = "20221201-03:35:22.000000" in
    assert_str_eq (Encode_datetime.encode_UTCTimestamp_micro t) expect
end

module Encode_monthYear = struct
  let () =
    let t : fix_monthyear = make_monthyear_unsafe ~$2032 ~$07 None in
    let expect = "20320701" in
    assert_str_eq (Encode_datetime.encode_MonthYear t) expect


  let () =
    let t : fix_monthyear = make_monthyear_unsafe ~$2032 ~$07 (Some Week_4) in
    let expect = "203207w4" in
    assert_str_eq (Encode_datetime.encode_MonthYear t) expect
end
