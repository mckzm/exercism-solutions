import std/strformat

template isOdd(i: int): bool =
  (i and 1) == 1

template halve(i: int) : int =
  i shr 1
 
proc steps*(i: int): int =
  if i < 1:
    raise newException(ValueError, &"{i} is not a positive integer!")
  
  var n = i
  while n != 1:
    if n.isOdd:
      n = 3 * n + 1
      result.inc
    n = n.halve
    result.inc
    
  
