module Darts (score) where

score :: Float -> Float -> Int
score x y
  | d > 10.0   = 0
  | d >  5.0   = 1
  | d >  1.0   = 5
  | otherwise  = 10
  where d = sqrt $ (x * x) + (y * y)

