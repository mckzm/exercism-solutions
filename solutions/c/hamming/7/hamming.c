#include "hamming.h"
#include <string.h>

// Cursory benchmarking shows that version being outperformed by
// the one that relies on strlen(3), somewhat to my surprise.
int compute(const char *lhs, const char *rhs) {
    if (!lhs || !rhs) return -1;

    int hamming = 0;
    for (; *lhs && *rhs; hamming += (*lhs++ != *rhs++));
    
    return *lhs || *rhs ? -1 : hamming;
}