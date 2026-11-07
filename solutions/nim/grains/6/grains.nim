import std/strformat

func onSquare*(n: int): uint64 =
  if n < 1 or n > 64:
    raise newException(ValueError, &"{n} is not between 1 and 64!")
  result = 1'u64 shl (n - 1)

func total*: uint64 =
  result = high(uint64)
