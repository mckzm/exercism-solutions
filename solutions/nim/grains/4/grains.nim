import std/strformat

func onSquare*(n: int): uint64 =
  if n < 1 or n > 64:
    raise newException(ValueError, &"{n} is not between 1 and 64!")
  result = 1'u64 shl (n - 1)

proc total*: uint64 =
  result = not 0'u64
