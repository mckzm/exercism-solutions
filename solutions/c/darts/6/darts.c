#include "darts.h"

#include <stdint.h>
#include <math.h>

const float INNER_RADIUS = 1.0f;
const float MIDDLE_RADIUS = 5.0f;
const float OUTER_RADIUS = 10.0f;

uint8_t score(coordinate_t landing_position) {
    float r = hypot(landing_position.x, landing_position.y);

    if (r <= INNER_RADIUS) return 10;
    if (r <= MIDDLE_RADIUS) return 5;
    if (r <= OUTER_RADIUS) return 1;
    return 0;
}