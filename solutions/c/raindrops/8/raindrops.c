#include "raindrops.h"

#include <stdio.h>
#include <string.h>

typedef struct {
    int factor;
    const char *sound;
} sound_t;

static const sound_t SOUNDS[] = {
    { 3, "Pling" },
    { 5, "Plang" },
    { 7, "Plong" },
};

#define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))

void convert(char result[], int drops) {
    for (size_t i = 0; i < ARRAY_SIZE(SOUNDS); ++i) {
        if (drops % SOUNDS[i].factor == 0) strcat(result, SOUNDS[i].sound);
    }

    if (strlen(result) == 0) sprintf(result, "%d", drops);
}