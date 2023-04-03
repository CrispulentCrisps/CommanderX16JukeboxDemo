#ifndef SPRITES_H 
#define SPRITES_H

#include <vector>

/*	Programmers must define each sprite themselves, from a range of 0x13000 to 0x1AFFF
	#define sprite    (*(Sprites *)0x13000)
*/
struct Object {
	int x;
	int y;
	int width;//size scaled in 8x8 pixel tiles
	char palpoint[16];
	char paloff;
};

void SetSpritePos(int x, int y);
void Animation(const char sprite[], int TimeBetweenFrames);
void SetPaletteColours(const char input[16]);
void Update();

#pragma compile("Sprites.c")

#endif