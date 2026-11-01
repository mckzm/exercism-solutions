import std/strutils
  
proc hey*(s: string): string =
  let s = s.strip

  let isSilence = s == ""
  let isQuestion = s.endsWith('?')
  var isYelling = false
  
  for c in s:
    if c.isAlphaAscii:
      if c.isLowerAscii:
        isYelling = false
        break
      if c.isUpperAscii:
        isYelling = true
  
  if isQuestion and isYelling: return "Calm down, I know what I'm doing!"
  if isYelling: return "Whoa, chill out!"
  if isQuestion: return "Sure."
  if isSilence: return "Fine. Be that way!"
  return "Whatever."
