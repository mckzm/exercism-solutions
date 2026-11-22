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
    return (score / 2) - 5
}

ability :: proc() -> int {
    lowest_roll: int = 7
    score: int = 0
    
    for _ in 1..=4 {
        roll := rand.int_max(6) + 1
        score += roll
        lowest_roll = min(roll, lowest_roll)
    }
    
	return score - lowest_roll
}

character :: proc() -> (c: Character) {
    c.strength = ability()
    c.dexterity = ability()
    c.constitution = ability()
    c.intelligence = ability()
    c.wisdom = ability()
    c.charisma = ability()
    c.hitpoints = 10 + modifier(c.constitution)

    return
}
