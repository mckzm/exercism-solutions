#include "dnd_character.h"
#include <stdbool.h>
#include <stdlib.h>
#include <time.h>

static bool is_seeded = false;

int ability(void) {
    if (!is_seeded) {
        srand(time(NULL));
        is_seeded = true;
    }

    int min = 6, roll = 0, sum = 0;
    for (int i = 1; i <= 4; ++i) {
        roll = rand() % 6 + 1; // skewed
        sum += roll;
        if (roll < min) min = roll;
    }

    return sum - min;
}

int modifier(int score) {
    return (score >= 10) ? (score - 10) / 2 : (score - 11) / 2;
}

dnd_character_t make_dnd_character(void) {
    dnd_character_t character = {
        .strength = ability(),
        .dexterity = ability(),
        .constitution = ability(),
        .intelligence = ability(),
        .wisdom = ability(),
        .charisma = ability(),
        .hitpoints = 0,
    };
    character.hitpoints = 10 + modifier(character.constitution);

    return character;
}
