import std/math

type Circle = tuple[radius: float, score: int]

type Target = object
  circles: seq[Circle]

proc score*(x, y: float): int =
  let target = Target(circles: @[
    (1.0, 10),
    (5.0, 5),
    (10.0, 1),
  ])
  let radius = hypot(x, y)

  for _, c in target.circles:
    if radius <= c.radius:
      result = c.score
      break
