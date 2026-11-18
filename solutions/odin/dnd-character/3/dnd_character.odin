package dnd_character

import "core:math/rand"

Character :: struct {
    strength: int,
    dexterity: int,
    constitution: int,
    intelligence: int,
    wisdom: int,
    charisma: int,
    hitpoints: int,
}

modifier :: proc(score: int) -> int {
	res: int = (score - 10) / 2
    if score < 10 && score % 2 != 0 {
        res -= 1
    }

    return res
}

ability :: proc() -> int {
    min: int = 7
    roll: int = 0
    sum: int = 0
    
    for i := 0; i < 4; i += 1 {
        roll = int(rand.int_max(6)) + 1
        sum += roll
        if roll < min {
            min = roll
        }
    }
    
	return sum - min
}

character :: proc() -> Character {
	character := Character{
        strength = ability(),
        dexterity = ability(),
        constitution = ability(),
        intelligence = ability(),
        wisdom = ability(),
        charisma = ability(),
    }
    character.hitpoints = 10 + modifier(character.constitution)

    return character
}
