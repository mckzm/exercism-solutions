import std/sequtils, std/sugar

func isTriangle(sides: array[3, int]): bool =
  result =
    sides.all(side => side > 0) and
    sides[0] + sides[1] >= sides[2] and
    sides[0] + sides[2] >= sides[1] and
    sides[1] + sides[2] >= sides[0]

func isEquilateral*(sides: array[3, int]): bool =
  result = isTriangle(sides) and sides[0] == sides[1] and sides[1] == sides[2]

func isIsosceles*(sides: array[3, int]): bool =
  result =
    isTriangle(sides) and (
      sides[0] == sides[1] or
      sides[0] == sides[2] or
      sides[1] == sides[2]
      )

func isScalene*(sides: array[3, int]): bool =
  result = isTriangle(sides) and not isIsosceles(sides)
