#include "raindrops.h"

#include <stdio.h>
#include <string.h>

typedef struct RainDrop {
    int factor;
    const char *sound;
} RainDrop;

static const RainDrop SOUNDS[] = {
    { 3, "Pling" },
    { 5, "Plang" },
    { 7, "Plong" },
};

#define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))

void convert(char result[], int drops) {
    for (size_t i = 0; i < ARRAY_SIZE(SOUNDS); ++i) {
        const RainDrop *sound = &SOUNDS[i];
        if (drops % sound->factor == 0) strcat(result, sound->sound);
    }

    if (strlen(result) == 0) sprintf(result, "%d", drops);
}