#include "darts.h"
#include <stdint.h>

uint8_t score(coordinate_t landing_position) {
    float x = landing_position.x;
    float y = landing_position.y;
    float r_squared = (x * x) + (y * y);

    if (r_squared <= 1.0) return 10;
    if (r_squared <= 25.0) return 5;
    if (r_squared <= 100.0) return 1;
    return 0;
}