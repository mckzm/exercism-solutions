import std/math
  
proc square(x: float): float =
  result = x * x

proc hypot(x: float, y: float): float =
  result = sqrt(x.square + y.square)

proc score*(x, y: float): int =
  let radius = hypot(x, y)

  if radius <= 1.0: return 10
  if radius <= 5.0: return 5
  if radius <= 10.0: return 1

