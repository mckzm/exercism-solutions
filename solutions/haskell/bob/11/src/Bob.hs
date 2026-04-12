module Bob (responseFor) where

import Data.Char (isLetter, isSpace, isUpper)
import Data.List (dropWhileEnd, isSuffixOf)

responseFor :: String -> String
responseFor xs
  | isQuestion && isYelling = "Calm down, I know what I'm doing!"
  | isQuestion              = "Sure."
  | isYelling               = "Whoa, chill out!"
  | isSilent                = "Fine. Be that way!"
  | otherwise               = "Whatever."
  where
      isQuestion = isSuffixOf "?" trimmedRight
      isYelling = (any isLetter xs) && (all isUpper $ filter isLetter xs)
      isSilent = all isSpace xs
      trimmedRight = dropWhileEnd isSpace xs
