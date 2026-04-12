module Bob (responseFor) where

import Data.Char (isLower, isSpace, isUpper)
import Data.List (dropWhileEnd, isSuffixOf)

responseFor :: String -> String
responseFor xs
  | isQuestion && isYelling = "Calm down, I know what I'm doing!"
  | isQuestion              = "Sure."
  | isYelling               = "Whoa, chill out!"
  | null trimmedRight       = "Fine. Be that way!"
  | otherwise               = "Whatever."
  where
      trimmedRight = dropWhileEnd isSpace xs
      isQuestion = isSuffixOf "?" trimmedRight
      isYelling = not (any isLower trimmedRight) && any isUpper trimmedRight
