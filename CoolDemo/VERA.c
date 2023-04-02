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

void SetVERABg(byte BGColour)
{

}

void ClearVERAScreen()
{

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