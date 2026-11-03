import std/sequtils

proc isTriangle(sides: array[3, int]): bool =
  if not sides.all(proc (x: int) : bool = x > 0):
    return false

  if not (sides[0] + sides[1] >= sides[2] and
          sides[0] + sides[2] >= sides[1] and
          sides[1] + sides[2] >= sides[0]):
    return false

  result = true

proc isEquilateral*(sides: array[3, int]): bool =
  result = isTriangle(sides) and sides[0] == sides[1] and sides[1] == sides[2]

proc isIsosceles*(sides: array[3, int]): bool =
  result = isTriangle(sides) and (
    sides[0] == sides[1] or
    sides[0] == sides[2] or
    sides[1] == sides[2]
    )

proc isScalene*(sides: array[3, int]): bool =
  result = isTriangle(sides) and not isIsosceles(sides)
