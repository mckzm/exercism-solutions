#include "raindrops.h"
#include <string.h>
#include <stdio.h>

#define BUFFER_LENGTH 16

void convert(char result[], int drops) {
    int offset = 0;
    int remaining = BUFFER_LENGTH;
    int written;
    
    if (drops % 3 == 0) {
        written = snprintf(result + offset, remaining, "Pling");
        offset += written;
        remaining -= written;
    }

    if (drops % 5 == 0) {
        written = snprintf(result + offset, remaining, "Plang");
        offset += written;
        remaining -= written;
    }

    if (drops % 7 == 0) {
        written = snprintf(result + offset, remaining, "Plong");
        offset += written;
        remaining -= written;
    }

    if (strlen(result) == 0) snprintf(result + offset, remaining, "%d", drops);
}