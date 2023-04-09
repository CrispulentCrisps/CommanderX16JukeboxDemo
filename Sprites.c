#include "Sprites.h"

void Setup(char spr, unsigned long addr, bool mode8, char w, char h, char z, char pal, const char* img, unsigned imgsize)
{
	vram_putn(addr,img, imgsize);
	vera_spr_set(spr, addr >> 5, mode8, w, h, z, pal);
}

void Animation(const char sprite[], int TimeBetweenFrames)
{

}

void SetPaletteColours(const char* input, char inputsize, unsigned long addr)
{
	vram_putn(addr, input, inputsize);
}

void Update()
{

}
