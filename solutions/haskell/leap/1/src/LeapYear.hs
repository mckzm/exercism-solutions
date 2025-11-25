module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
  | year `rem` 4 == 0 = if year `rem` 100 == 0 then year `rem` 400 == 0 else True
  | otherwise = False
