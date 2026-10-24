#include "collatz_conjecture.h"

int steps(int start) {
    if (start < 1) return ERROR_VALUE;
    return do_steps(start, 0);
}

int do_steps(int n, int steps) {
    if (n == 1) return steps;
    if ((n & 1) == 1) return do_steps((n * 3 + 1) >> 1, steps + 2);
    return do_steps(n >> 1, steps + 1);
}
