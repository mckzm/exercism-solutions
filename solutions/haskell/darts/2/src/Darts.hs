module Darts (score) where

score :: Float -> Float -> Int
score x y =
    let d = sqrt (x ** 2 + y ** 2)
    in case d of
      _ | d > 10.0  -> 0
        | d > 5.0   -> 1
        | d > 1.0   -> 5
        | otherwise -> 10

