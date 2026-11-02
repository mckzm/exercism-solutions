proc distance*(a, b: string): int =
  let length = a.len
  if length != b.len:
    raise newException(ValueError, "Strands of unequal length!")

  for i, c in a:
    if c != b[i]: result += 1

