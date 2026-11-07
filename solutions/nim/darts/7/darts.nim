import std/math

type Circle = tuple[radius: float, score: int]

type Target = object
  circles: seq[Circle]

const DartsBoard = Target(circles: @[
    (1.0, 10),
    (5.0, 5),
    (10.0, 1),
  ])

proc score*(x, y: float): int =
  let radius = hypot(x, y)

  for _, c in DartsBoard.circles:
    if radius <= c.radius:
      result = c.score
      break
