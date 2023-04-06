#ifndef SPRITES_H 
#define SPRITES_H

#include "VERA.h"

/*	Programmers must define each sprite themselves, from a range of 0x13000 to 0x1AFFF
	#define sprite    (*(Sprites *)0x13000)
*/

void Animation(const char sprite[], int TimeBetweenFrames);
void SetPaletteColours(const char input[16]);
void Update();

#pragma compile("Sprites.c")

#endif