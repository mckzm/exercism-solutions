import std/strformat

proc twoFer*(name = ""): string =
  return fmt("One for {(if name == \"\": \"you\" else: name)}, one for me.")
