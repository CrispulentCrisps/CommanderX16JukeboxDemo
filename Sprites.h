#ifndef SPRITES_H 
#define SPRITES_H

#include "VERA.h"

void Setup(char spr, unsigned addr32, bool mode8, char w, char h, char z, char pal, const char* palsrc, const char* img, unsigned long addr);
void Animation(const char sprite[], int TimeBetweenFrames);
void SetPaletteColours(const char input[16]);
void Update();

#pragma compile("Sprites.c")

#endif