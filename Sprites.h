#ifndef SPRITES_H 
#define SPRITES_H

#include "VERA.h"

/*	Programmers must define each sprite themselves, from a range of 0x13000 to 0x1AFFF
	#define sprite    (*(Sprites *)0x13000)
*/

void Setup(char spr, unsigned long addr, bool mode8, char w, char h, char z, char pal, const char* img, unsigned imgsize);
void Animation(const char sprite[], int TimeBetweenFrames);
void SetPaletteColours(const char* input, char inputsize, char addr);
void Update();

#pragma compile("Sprites.c")

#endif