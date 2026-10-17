#ifndef RAINDROPS_H
#define RAINDROPS_H

typedef struct {
    int factor;
    const char *sound;
} RainDrop;

void convert(char result[], int drops);

#endif
