#include "VERA.h"

void ResetVERA()
{
	vera.ctrl |= VERA_CTRL_RESET;
}

void PlayVERANote(VERAInstrument * inst, unsigned Length, char Waveform, char Panning, char Duty[4], char Arpeggio[]) {
	//Length is calculated in frames
}


void SetVERABorder(byte BGColour)
{
	vera.dcborder = BGColour;
}

void ClearVERAScreen()
{
	putch(0x93);
	vera.addrh = 0b00010001;

	for (int i = 0; i < 64; i++)
	{
		vera.addr = 0xb000 + 256 * i;
		for (int j = 0; j < 128; j++)
		{
			vera.data0 = 0x20;
			vera.data0 = 1;
			vera.data1 = 0x20;
			vera.data1 = 1;
		}
	}
}

void SetVERAOutputMode(byte mode)
{
	vera.dcvideo = mode;
}

byte GetVERAOutputMode()
{
	return vera.dcvideo;
}

void SetPCMSettings(char SRate, char Vol)
{
	vera.audiorate = SRate;
	vera.audioctrl = Vol;
}

void TypeTextVERA(const char Text[], unsigned x, unsigned y)
{
	vera.addr = 0xb000;
	for (unsigned i = 0; i < sizeof(Text)/8; i++)
	{
		vera.data0 = Text[i];
	}
}

void PlayPCM(const char PCMData[], bool Loop)
{
	unsigned PCMLength = sizeof(PCMData);
	unsigned PCMByteIndex = 0;
}

void ScrollerText(const char Text[], unsigned x, unsigned y, int offset)
{

	//off1=offset;
	
	//vera.data0 = Text[off1]-64;

	//vera.l1hscroll = offset - x;

	//vera.l1hscroll = 0;

/*
	for (unsigned i = 0; i < sizeof(Text)/8; i++)
	{
		vera.data0 = 0x01;
	}
*/
}

unsigned char memoryToMapMemoryAddress(unsigned char bank, unsigned short mem) {
	unsigned char mapMem = (bank << 7) | (mem >> 9);
	return mapMem;
}

unsigned char tileBaseConfig(unsigned char bank, unsigned short mem, unsigned char height, unsigned char width) {
    unsigned char tileConfig = bank << 7 | ((mem >> 11) << 2) | height << 1 | width;
    return tileConfig;
}
