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
  
  if isQuestion and isYelling: return "Calm down, I know what I'm doing!"
  if isYelling: return "Whoa, chill out!"
  if isQuestion: return "Sure."
  if isSilence: return "Fine. Be that way!"
  return "Whatever."

