module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : Int -> Int -> Int
remainingTimeInMinutes layers minutesInOven =
    let
        expectedMinutesInOven : Int
        expectedMinutesInOven =
            40

        minutesPerLayer : Int
        minutesPerLayer =
            2

        preparationTimeInMinutes : Int
        preparationTimeInMinutes =
            layers * minutesPerLayer
    in
    preparationTimeInMinutes + expectedMinutesInOven - minutesInOven
