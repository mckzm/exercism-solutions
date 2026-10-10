import std/strformat

proc twoFer*(name = "you"): string =
  result = &"One for {name}, one for me."
