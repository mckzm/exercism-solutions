func square(n: int): int {.inline.} =
  result = n * n

func squareOfSum*(n: int): int =
  result = square(n * (n + 1) div 2)

func sumOfSquares*(n: int): int =
  result = n * (n + 1) * (2 * n + 1) div 6

func difference*(n: int): int =
  result = n.squareOfSum - n.sumOfSquares
