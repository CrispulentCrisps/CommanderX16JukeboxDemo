#ifndef SPRITES_H 
#define SPRITES_H

#include "VERA.h"

/*	Programmers must define each sprite themselves, from a range of 0x13000 to 0x1AFFF
	#define sprite    (*(Sprites *)0x13000)
*/
struct Sprites {
	const char * image;
	int x;
	int y;
	int width;//size scaled in 8x8 pixel tiles
	const char * palpoint;
	char paloff;
	char layer;
};

void Animation(const char sprite[], int TimeBetweenFrames);
void SetPaletteColours(const char input[16]);
void Update();

#pragma compile("Sprites.c")

#endif