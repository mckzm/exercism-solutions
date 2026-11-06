proc square(x: float): float =
  result = x * x

proc score*(x, y: float): int =
  let radiusSquared = x.square + y.square

  if radiusSquared <= 1.0: return 10
  if radiusSquared <= 25.0: return 5
  if radiusSquared <= 100.0: return 1

