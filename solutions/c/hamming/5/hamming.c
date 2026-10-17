#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs) {
    size_t len;
    if (!lhs || !rhs || (len = strlen(lhs)) != strlen(rhs)) return -1;

    int hamming = 0;
    for (size_t i = 0; i < len; ++i) {
        if (lhs[i] != rhs[i]) hamming++;
    }

    return hamming;
}