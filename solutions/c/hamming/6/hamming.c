#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs) {
    if (!lhs || !rhs) return -1;

    int hamming = 0;
    for (; *lhs && *rhs; hamming += (*lhs++ != *rhs++));
    
    return *lhs || *rhs ? -1 : hamming;
}