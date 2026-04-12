module Bob (responseFor) where

import Data.Char (isLetter, isLower, isSpace)
import Data.List (dropWhileEnd, isSuffixOf)

responseFor :: String -> String
responseFor xs
  | isQuestion && isYelling = "Calm down, I know what I'm doing!"
  | isQuestion              = "Sure."
  | isYelling               = "Whoa, chill out!"
  | isSilent                = "Fine. Be that way!"
  | otherwise               = "Whatever."
  where
      isQuestion = isSuffixOf "?" trimRight
      isYelling = any isLetter xs && not (any isLower xs)
      isSilent = all isSpace xs
      trimRight = dropWhileEnd isSpace xs
