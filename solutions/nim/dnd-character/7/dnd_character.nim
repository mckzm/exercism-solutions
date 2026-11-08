import std/math, std/random

var randomized = false

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

proc ability*: int =
  if not randomized:
    randomize()
    randomized = true

  var rolls: array[4, int]
  for roll in rolls.mitems:
    roll = rand(1..6)

  rolls.sum - rolls.min

func modifier*(n: int): int =
  floorDiv(n - 10, 2)

proc initCharacter*: Character =
  for name, score in fieldPairs(result):
    if name != "hitpoints":
      score = ability()

  result.hitpoints = 10 + modifier(result.constitution)