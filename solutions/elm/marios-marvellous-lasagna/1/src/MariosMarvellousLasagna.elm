module MariosMarvellousLasagna exposing (remainingTimeInMinutes)

remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes numberOfLayers minutesInOven =
    let
        expectedMinutesInOven = 40
        preparationTimeInMinutes layers = layers * 2
    in
        preparationTimeInMinutes numberOfLayers + expectedMinutesInOven - minutesInOven
