#include "hamming.h"
#include <string.h>

int compute(const char *lhs, const char *rhs) {
    if (!lhs || !rhs || (strlen(lhs) != strlen(rhs))) return -1;

    int hamming = 0;
    for (size_t i = 0; i < strlen(lhs); ++i) {
        if (lhs[i] != rhs[i]) hamming++;
    }

    return hamming;
}