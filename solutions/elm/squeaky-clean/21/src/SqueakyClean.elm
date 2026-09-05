module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)


capitalize : String -> String
capitalize s =
    case String.uncons s of
        Just ( c, rest ) ->
            String.cons (Char.toUpper c) rest

        Nothing ->
            ""


clean1 : String -> String
clean1 str =
    String.replace " " "_" str


clean2 : String -> String
clean2 str =
    let
        ctrlChars : List String
        ctrlChars =
            [ "\n", "\t", "\u{000D}" ]

        cleanedStr : String
        cleanedStr =
            str |> clean1
    in
    List.foldl (\c -> String.replace c "[CTRL]") cleanedStr ctrlChars


clean3 : String -> String
clean3 str =
    let
        cleanedStr : String
        cleanedStr =
            str |> clean2
    in
    case String.split "-" cleanedStr of
        s :: ss ->
            String.concat (s :: List.map capitalize ss)

        [] ->
            ""


clean4 : String -> String
clean4 =
    clean3 >> String.filter (Char.isDigit >> not)


clean : String -> String
clean =
    let
        isNotGreekLowerCase : Char -> Bool
        isNotGreekLowerCase c =
            Char.toCode c
                < Char.toCode 'α'
                || Char.toCode c
                > Char.toCode 'ω'
    in
    clean4 >> String.filter isNotGreekLowerCase
