import std/math, std/sequtils

func isTriangle(sides: array[3, int]): bool =
  result = sides.allIt(it > 0) and sides.max * 2 < sides.sum

func isEquilateral*(sides: array[3, int]): bool =
  result = isTriangle(sides) and sides.deduplicate.len == 1

func isIsosceles*(sides: array[3, int]): bool =
  result = isTriangle(sides) and sides.deduplicate.len <= 2

func isScalene*(sides: array[3, int]): bool =
  result = isTriangle(sides) and sides.deduplicate.len == 3
