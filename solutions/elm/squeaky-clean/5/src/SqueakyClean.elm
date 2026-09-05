module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)


clean1 : String -> String
clean1 str =
    String.replace " " "_" str


clean2 : String -> String
clean2 str =
    let
        ctrlChars =
            [ "\n", "\t", "\u{000D}" ]

        cleanedStr =
            str |> clean1
    in
    List.foldl (\c acc -> String.replace c "[CTRL]" acc) cleanedStr ctrlChars


clean3 : String -> String
clean3 str =
    let
        cleanedStr =
            str |> clean1 |> clean2

        dashlessChunks =
            String.split "-" cleanedStr
    in
    if List.length dashlessChunks > 1 then
        String.concat
            (List.map
                (\s ->
                    if String.length s > 1 then
                        case String.uncons s of
                            Just ( c, rest ) ->
                                String.cons (Char.toUpper c) rest

                            Nothing ->
                                ""

                    else
                        s
                )
                dashlessChunks
            )

    else
        cleanedStr


clean4 : String -> String
clean4 str =
    let
        cleanedStr =
            str |> clean1 |> clean2 |> clean3
    in
    String.foldl
        (\c acc ->
            if Char.isDigit c then
                acc

            else
                acc ++ String.fromChar c
        )
        ""
        cleanedStr


clean : String -> String
clean str =
    let
        cleanedStr =
            str |> clean1 |> clean2 |> clean3 |> clean4

        greekLowerCaseLetters =
            List.range (Char.toCode 'α') (Char.toCode 'ω') |> List.map Char.fromCode

        isGreekLowerCase c =
            List.member c greekLowerCaseLetters
    in
    String.filter (\c -> not (isGreekLowerCase c)) cleanedStr
