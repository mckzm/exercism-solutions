import std/strutils

proc checkYelling(s: string): bool =
  for c in s:
    if c.isAlphaAscii:
      if c.isLowerAscii:
        result = false
        break
      if c.isUpperAscii:
        result = true
  
proc hey*(s: string): string =
  let
    s = s.strip
    isSilence = s == ""
    isQuestion = s.endsWith('?')
    isYelling = s.checkYelling
  
  result = if isQuestion and isYelling:
    "Calm down, I know what I'm doing!"
  elif isYelling:
    "Whoa, chill out!"
  elif isQuestion:
    "Sure."
  elif isSilence:
    "Fine. Be that way!"
  else:
    "Whatever."

