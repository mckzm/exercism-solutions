import std/math
  
proc square(x: float): float =
  result = x * x

#proc hypot(x: float, y: float): float =
  #result = sqrt(x.square + y.square)

proc score*(x, y: float): int =
  let radius = hypot(x, y)

  result = if radius <= 1.0: 10
    elif radius <= 5.0: 5
    elif radius <= 10.0: 1
    else: 0

