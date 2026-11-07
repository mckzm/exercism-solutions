import std/strformat
 
proc steps*(i: int): int =
  if i < 1:
    raise newException(ValueError, &"{i} is not a positive integer!")
  
  var n = i
  
  while n != 1:
    if (n and 1) == 1:
      n = 3 * n + 1
      result.inc
    n = n shr 1
    result.inc
    
  
