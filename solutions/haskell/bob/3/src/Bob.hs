module Bob (responseFor) where

import qualified Data.List as L
import Data.Char (isSpace, ord)

responseFor :: String -> String
responseFor xs
    | L.isSuffixOf  "?" $ L.dropWhileEnd isSpace xs =
        case isUpperCase $ extractLetters xs of
          True -> "Calm down, I know what I'm doing!"
          False -> "Sure."
    | isUpperCase $ extractLetters xs = "Whoa, chill out!"
    | isMtOrWhitespace xs = "Fine. Be that way!"
    | otherwise = "Whatever."

extractLetters :: String -> String
extractLetters xs =
    filter (\x -> elem x ['A'..'Z'] || elem x ['a'..'z']) xs

isUpperCase :: String -> Bool
isUpperCase xs
    | xs == "" = False
    | all (\x -> elem x ['A'..'Z']) xs = True
    | otherwise = False

isMtOrWhitespace :: String -> Bool
isMtOrWhitespace xs =
    xs == "" || all (\x -> ord x < 33) xs
