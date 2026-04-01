module ReverseString (reverseString) where

reverseString :: String -> String
reverseString str = reverseStringHelper str []
    where
    reverseStringHelper [] acc = acc
    reverseStringHelper (x:xs) acc = reverseStringHelper xs (x:acc)
