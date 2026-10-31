module AnnalynsInfiltration

let canFastAttack knightIsAwake = not knightIsAwake

let canSpy knightIsAwake archerIsAwake prisonerIsAwake =
    archerIsAwake || knightIsAwake || prisonerIsAwake

let canSignalPrisoner archerIsAwake prisonerIsAwake =
    prisonerIsAwake && not archerIsAwake

let canFreePrisoner knightIsAwake archerIsAwake prisonerIsAwake petDogIsPresent =
    not archerIsAwake && (petDogIsPresent || prisonerIsAwake && not knightIsAwake)
