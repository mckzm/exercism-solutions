#include "darts.h"
#include <stdint.h>

const float INNER_CIRCLE = 1.0f;
const float MIDDLE_CIRCLE = 25.0f;
const float OUTER_CIRCLE = 100.0f;

uint8_t score(coordinate_t landing_position) {
    float x = landing_position.x;
    float y = landing_position.y;
    float r_squared = (x * x) + (y * y);

    if (r_squared <= INNER_CIRCLE) return 10;
    if (r_squared <= MIDDLE_CIRCLE) return 5;
    if (r_squared <= OUTER_CIRCLE) return 1;
    return 0;
}