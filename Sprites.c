#include "Sprites.h"

void Setup(char spr, unsigned long addr, bool mode8, char w, char h, char z, char pal)
{
	vera_spr_set(spr, addr >> 5, mode8, w, h, z, pal);
}

void Animation(const char sprite[], int TimeBetweenFrames)
{

}

void SetPaletteColours(const char* input, char inputsize, unsigned long addr)
{
	vram_putn(addr, input, inputsize);
}

void SetPaletteIndex(unsigned Palette[], unsigned long index, unsigned short MinVal, unsigned short MaxVal)
{

	unsigned c0 = Palette[MinVal];
	for (char i = MinVal; i < MaxVal-1; i++)
	{
		Palette[i] = Palette[i + 1];
	}
	Palette[MaxVal-1] = c0;

	vera_pal_putn(index, Palette, 16);
}

void LoadSprite(const char* name, char fnum, char device, char channel, unsigned long Addr, const int DataSize)
{
	krnio_setnam(name);
	krnio_open(fnum, device, channel);
	for (unsigned i = 0; i < DataSize; i++)
	{
		vram_put_at(Addr + i, krnio_getch(fnum));
	}

	krnio_close(fnum);
}
