module Bob (responseFor) where

import Data.Char (isLetter, isLower, isSpace)

responseFor :: String -> String
responseFor xs
  | isQuestion && isYelling = "Calm down, I know what I'm doing!"
  | isQuestion              = "Sure."
  | isYelling               = "Whoa, chill out!"
  | isSilent                = "Fine. Be that way!"
  | otherwise               = "Whatever."
  where
      isQuestion = lastMaybe (filter (not . isSpace) xs) == Just '?'
      isYelling = any isLetter xs && not (any isLower xs)
      isSilent = all isSpace xs

lastMaybe :: [a] -> Maybe a
lastMaybe (_:xs) = Just $ last xs
lastMaybe [] = Nothing
