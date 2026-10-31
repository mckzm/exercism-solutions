module LuciansLusciousLasagna

let expectedMinutesInOven = 40
let preparationMinutesPerLayer = 2

let remainingMinutesInOven minutesInOven =
    expectedMinutesInOven - minutesInOven

let preparationTimeInMinutes numberOfLayers =
    preparationMinutesPerLayer * numberOfLayers

let elapsedTimeInMinutes numberOfLayers minutesInOven =
    preparationTimeInMinutes numberOfLayers + minutesInOven
