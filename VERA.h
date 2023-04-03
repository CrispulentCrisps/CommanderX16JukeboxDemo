//Made in conjunction with Crisps#9055

#ifndef VERA_H 
#define VERA_H

#include <c64/types.h>

#define vera    (*(VERA *)0x9f20)

#define VERA_ADDRH_DECR		0x08
#define VERA_ADDRH_INC		0xf0

#define VERA_CTRL_RESET		0x80
#define VERA_CTRL_DCSEL		0x02
#define VERA_CTRL_ADDRSEL	0x01

#define VERA_IRQ_LINE_8		0x80
#define VERA_IRQ_AFLOW		0x08
#define VERA_IRQ_SPRCOL		0x04
#define VERA_IRQ_LINE		0x02
#define VERA_IRQ_VSYNC		0x01

#define VERA_ADDRx_L		0x9F20
#define VERA_ADDRx_M		0x9F21
#define VERA_ADDRx_H		0x9F22

#define VERA_DATA_0			0x9F23
#define VERA_DATA_1			0x9F24

#define VERA_IEN			0x9F26
#define VERA_ISR			0x9F27

#define VERA_IRQ_LINE_L		0x9F28

#define VERA_DC_VIDEO		0x9F29
#define VERA_DC_HSCALE		0x9F2A
#define VERA_DC_VSCALE		0x9F2B
#define VERA_DC_BORDER		0x9F2C

#define VERA_L0_CONFIG		0x9F2D
#define VERA_L0_MAPBASE		0x9F2E
#define VERA_L0_TILEBASE	0x9F2F
#define VERA_L0_HSCROLL_L	0x9F30
#define VERA_L0_HSCROLL_H	0x9F31
#define VERA_L0_VSCROLL_L	0x9F32
#define VERA_L0_VSCROLL_H	0x9F33

#define VERA_L1_CONFIG		0x9F34
#define VERA_L1_MAPBASE		0x9F35
#define VERA_L1_TILEBASE	0x9F36
#define VERA_L1_HSCROLL_L	0x9F37
#define VERA_L1_HSCROLL_H	0x9F38
#define VERA_L1_VSCROLL_L	0x9F39
#define VERA_L1_VSCROLL_H	0x9F3A

#define VERA_AUDIO_CTRL		0x9F3B
#define VERA_AUDIO_RATE		0x9F3C
#define VERA_AUDIO_DATA		0x9F3D

#define VERA_SPI_DATA		0x9F3E
#define VERA_SPI_CTRL		0x9F3F

struct VERA
{
	volatile word	addr;
	volatile byte	addrh;
	volatile byte	data0, data1;

	volatile byte	ctrl;
	volatile byte	ien;
	volatile byte	isr;
	volatile byte	irqline;

	volatile byte	dcvideo;
	volatile byte	dchscale;
	volatile byte	dcvscale;
	volatile byte	dcborder;

	volatile byte	l0config;
	volatile byte	l0mapbase;
	volatile byte	l0tilebase;
	volatile word	l0hscroll;
	volatile word	l0vscroll;

	volatile byte	l1config;
	volatile byte	l1mapbase;
	volatile byte	l1tilebase;
	volatile word	l1hscroll;
	volatile word	l1vscroll;

	volatile byte	audioctrl;
	volatile byte	audiorate;
	volatile byte	audiodata;

	volatile byte	spidata;
	volatile byte	spictrl;
};

//Video [x means todo, y means finished]
void ResetVERA(); //y

void ClearVERAScreen();//y
void SetLayerConfig();//x
void TypeTextVERA(const char Text[], unsigned x, unsigned y);//x
void SetVERABorder(byte BGColour);//x
void SetVERAOutputMode(byte mode);//y
byte GetVERAOutputMode(); //y
void ScrollerText(const char Text[], unsigned x, unsigned y, int offset);

//Audio
struct VERAInstrument {
	byte MaxVolume[4];
	byte Volume[4];
	byte Waveform;
	byte Arpeggio[8];
	byte Panning;
	unsigned StepTime;
};

void PlayVERANote(VERAInstrument* inst, unsigned Length, char Waveform, char Panning, char Duty[4], char Arpeggio[]); //x

void SetPCMSettings(char SRate, char Vol);//y
void PlayPCM(const char PCMData[], bool Loop);//x

#pragma compile("VERA.c")

#endif