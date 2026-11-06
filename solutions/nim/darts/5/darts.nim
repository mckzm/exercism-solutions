import std/math

proc score*(x, y: float): int =
  let radius = hypot(x, y)

  result = if radius <= 1.0: 10
    elif radius <= 5.0: 5
    elif radius <= 10.0: 1
    else: 0
