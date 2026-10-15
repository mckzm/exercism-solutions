#include "raindrops.h"
#include <string.h>
#include <stdio.h>

#define BUFFER_LENGTH 16

void convert(char result[], int drops) {
    int len = 0;
    
    if (drops % 3 == 0) len+= snprintf(result + len, BUFFER_LENGTH - len, "Pling");
    if (drops % 5 == 0) len+= snprintf(result + len, BUFFER_LENGTH - len, "Plang");
    if (drops % 7 == 0) len+= snprintf(result + len, BUFFER_LENGTH - len, "Plong");

    if (len == 0) snprintf(result, BUFFER_LENGTH, "%d", drops);
}