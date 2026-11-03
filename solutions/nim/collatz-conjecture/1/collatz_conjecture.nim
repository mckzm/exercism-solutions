import std/strformat
 
proc steps*(n: int): int =
  if n < 1:
    raise newException(ValueError, &"{n} is not a positive integer!")
  
  var n = n
  result = 0
  
  while n > 1:
    if (n and 1) == 1:
      n = 3 * n + 1
      result += 1
    n = n shr 1
    result += 1
    
  
