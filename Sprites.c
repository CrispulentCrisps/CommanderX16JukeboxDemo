#include "Sprites.h"

void Setup(char spr, unsigned addr32, bool mode8, char w, char h, char z, char pal, const char* palsrc, const char* img, unsigned long addr)
{
	vram_putn(addr,img,sizeof(img)/8);
	vera_spr_set(spr, addr32, mode8, w, h, z, pal);
}

void Animation(const char sprite[], int TimeBetweenFrames)
{

}

void SetPaletteColours(const char input[16])
{

}

void Update()
{

}
