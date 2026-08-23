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
    case mana of
        Nothing ->
            let
                newHealth = health - manaCost
            in
                ( { player | health = if newHealth >= 0 then newHealth else 0 }, 0 )
        Just m ->
            let
                newMana = m - manaCost
            in
                if newMana > 0
                    then ( { player | mana = Just newMana}, 2 * manaCost )
                else
                    ( player, 0 )
        