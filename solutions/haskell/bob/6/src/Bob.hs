module Bob (responseFor) where

import qualified Data.List as L
import Data.Char

responseFor :: String -> String
responseFor xs
    | L.isSuffixOf  "?" $ L.dropWhileEnd isSpace xs =
        case allUpper $ extractLetters xs of
          True -> "Calm down, I know what I'm doing!"
          False -> "Sure."
    | allUpper $ extractLetters xs = "Whoa, chill out!"
    | isMtOrWhitespace xs = "Fine. Be that way!"
    | otherwise = "Whatever."

allUpper :: String -> Bool
allUpper xs = not (null xs) && all isUpper xs

extractLetters :: String -> String
extractLetters = filter isLetter

isMtOrWhitespace :: String -> Bool
isMtOrWhitespace xs = (null xs) || all isSpace xs
