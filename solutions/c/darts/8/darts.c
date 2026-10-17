#include "darts.h"

#include <math.h>
#include <stddef.h>
#include <stdint.h>

static const target_circle_t TARGET[] = {
    { 1.0f, 10 },
    { 5.0f, 5 },
    { 10.0f, 1},
};

#define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))

uint8_t score(coordinate_t landing_position) {
    float r = hypotf(landing_position.x, landing_position.y);
    
    for (size_t i = 0; i < ARRAY_SIZE(TARGET); ++i)
        if (r <= TARGET[i].radius) return TARGET[i].score;

    return 0;
}