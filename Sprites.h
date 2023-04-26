#ifndef SPRITES_H 
#define SPRITES_H

#include "VERA.h"

void Setup(char spr, unsigned long addr, bool mode8, char w, char h, char z, char pal);
void Animation(const char sprite[], int TimeBetweenFrames);
void SetPaletteColours(const char* input, char inputsize, unsigned long addr);
void Update();

#pragma compile("Sprites.c")

#endif