module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)

expectedMinutesInOven : Int
expectedMinutesInOven = 40

minutesPerLayer : Int
minutesPerLayer = 2

preparationTimeInMinutes : Int -> Int
preparationTimeInMinutes layers =
    layers * minutesPerLayer

elapsedTimeInMinutes : Int -> Int -> Int
elapsedTimeInMinutes layers minutesInOven = 
    preparationTimeInMinutes layers + minutesInOven
