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
    
    int min, roll, sum;
    min = roll = sum = 0;
    for (int i = 0; i < 4; ++i) {
        roll = rand() % 6 + 1; // skewed
        sum += roll;
        if (roll < min) min = roll;
    }

    return sum - min;
}

int modifier(int score) {
    int result = (score - 10) / 2;
    if (score < 10 && score % 2 != 0) result -= 1;
    return result;
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
