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
	vera.addrh = 0x11;

	for (int i = 0; i < 60; i++)
	{
		vera.addr = 0xb000 + 256 * i;
		for (int j = 0; j < 80; j++)
		{
			vera.data0 = 0x20;
			vera.data0 = 1;
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

void PlayPCM(const char PCMData[], bool Loop)
{
	unsigned PCMLength = sizeof(PCMData);
	unsigned PCMByteIndex = 0;
}