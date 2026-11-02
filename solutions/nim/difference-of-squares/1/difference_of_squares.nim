proc sqr(n: int): int =
    result = n * n

proc squareOfSum*(n: int): int =
  result = sqr(n * (n + 1) div 2)

proc sumOfSquares*(n: int): int =
   result = n * (n + 1) * (2 * n + 1) div 6

proc difference*(n: int): int =
  result = n.squareOfSum - n.sumOfSquares
