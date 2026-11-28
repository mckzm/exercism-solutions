fun isLeapYear (year : int) : bool =
  let fun divides n = year mod n = 0
  in divides 4 andalso (not (divides 100) orelse divides 400)
  end