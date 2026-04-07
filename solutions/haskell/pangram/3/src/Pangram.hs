module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram = flip (all . flip elem ) ['a'..'z'] . map toLower
