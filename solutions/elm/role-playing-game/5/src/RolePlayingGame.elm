module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    Maybe.withDefault "Mighty Magician" name


revive : Player -> Maybe Player
revive ({ health, level } as player) =
    case ( health, level >= 10 ) of
        ( 0, True ) ->
            Just { player | health = 100, mana = Just 100 }
        (0, False) ->
            Just { player | health = 100, mana = Nothing }
        _ ->
            Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost ({ health, mana } as player) =
    case Maybe.map ((<) manaCost) mana of
        Nothing ->
            ( {player | health = max 0 (health - manaCost) }, 0 )
        Just True ->
            ( { player | mana = Maybe.map (\m -> m - manaCost) mana }, 2 * manaCost )
        Just False ->
            ( player, 0 )