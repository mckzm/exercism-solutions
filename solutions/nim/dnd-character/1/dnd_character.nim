import std/math, std/random

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

randomize()

proc ability*: int =
  var rolls: array[4, int]
  for roll in rolls.mitems:
    roll = rand(1..6)

  rolls.sum - rolls.min

proc modifier*(n: int): int =
  floorDiv(n - 10, 2)

proc initCharacter*: Character =
  for name, score in fieldPairs(result):
    score = if name != "hitpoints":
      ability()
    else:
      10 + modifier(result.constitution)