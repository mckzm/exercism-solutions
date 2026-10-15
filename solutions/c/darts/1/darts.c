#include "darts.h"
#include <stdint.h>

uint8_t score(coordinate_t landing_position) {
    float r_squared = (landing_position.x * landing_position.x) + (landing_position.y * landing_position.y);

    if (r_squared <= 1.0) return 10;
    if (r_squared <= 25.0) return 5;
    if (r_squared <= 100.0) return 1;
    return 0;
}