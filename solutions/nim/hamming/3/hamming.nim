proc distance*(a, b: string): int =
  if a.len != b.len:
    raise newException(ValueError, "Strands of unequal length!")

  for i, c in a:
    if c != b[i]: result.inc

