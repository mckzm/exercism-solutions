#include "collatz_conjecture.h"

int steps(int start) {
    int count = 0;

    while (start > 1) {
        if ((start & 1) != 0) {
            start = 3 * start + 1;
            count++;
        }
        
        start >>= 1;
        count++;
    }

    return start == 1 ? count : -1;
}