#include "darts.h"

#include <stdint.h>
#include <math.h>

const float INNER_CIRCLE = 1.0f;
const float MIDDLE_CIRCLE = 5.0f;
const float OUTER_CIRCLE = 10.0f;

uint8_t score(coordinate_t landing_position) {
    float r = hypot(landing_position.x, landing_position.y);

    if (r <= INNER_CIRCLE) return 10;
    if (r <= MIDDLE_CIRCLE) return 5;
    if (r <= OUTER_CIRCLE) return 1;
    return 0;
}