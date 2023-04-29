#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <c64/rasterirq.h>
#include <conio.h>
#include <math.h>

#include "ZSMPlayer.h"
#include "Sprites.h"

#define A 0x41
#define D 0x44
#define L_ARROW 0x9D
#define R_ARROW 0x1D
#define SPACE 0x20

int FrameCount = 0;
char off1, off2;
int p = 0;
int PalTimer = 0;
int PalIndex = 0;
bool ShimmerState = false;

const char MainBG[] = {
	// In 8x8 pixel tiles with 2bits per pixel, each tile is 16 bytes
	// The MAINBG.BIN file isn't the correct size because it has 2 leading bytes
	// This is a C64 convention where 2 leading bytes are used by the kernal as an optional loading address
	// You need to trim them off or load with the kernal routine unless #embed removes them (which I don't think it is)
	#embed 256 2 "sprites/bin/MAINBG.BIN"
};
const char ScrollerOutline[] = {
	#embed 1024 2 "sprites/bin/SCROLLEROUTLINE.BIN"
};
const char Pause[] = {
	#embed 256 2 "sprites/bin/PAUSE.BIN"
};
const char Arrow[] = {	
	#embed 512 2 "sprites/bin/ARROW.BIN"
};
const char VolumeInd[] = {
	#embed 32 2 "sprites/bin/VOLUMEBUTTON.BIN"
};

const char TowerBase[] = {
	#embed 2048 2 "sprites/bin/EYETOWER.BIN"
};
const char EyeTri[] = {
	#embed 1024 2 "sprites/bin/EYETRI.BIN"
};

const char MainEyeBack[] = {
	#embed 1024 2 "sprites/bin/MAINEYEBACK.BIN"
};

const char MainPupil[] = {
	#embed 256 2 "sprites/bin/MAINPUPIL.BIN"
};

const char palette[] = {

	0xFF, 0x0F,
	0xBB, 0x0B,
	0x99, 0x09,	
	0x66, 0x06, 
	
	0x44, 0x04, 
	0x22, 0x02, 
	0x00, 0x00, 
	0x00, 0x00,

	0x00, 0x00, 
	0x00, 0x00,
	0x00, 0x00, 
	0x00, 0x00,
	
	0x00, 0x00, 
	0x00, 0x00,
	0x00, 0x00, 
	0x00, 0x00
};

const char BGPal[] = {
	0x23, 0x02, 0x12, 0x01,
	0x01, 0x11, 0x77, 0x07,//Stars at this
	0xFF, 0x0F, 0xAA, 0x0A,
	0x66, 0x06, 0x22, 0x02,


	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};

const char BGPalShimmer[] = {
	0x23, 0x02, 0x12, 0x01,
	0x01, 0x11, 0x55, 0x05,
	0xDD, 0x0D, 0x88, 0x08,//Stars at this
	0x44, 0x04, 0x11, 0x01,


	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};

const char ButtonStageMax[] = {
	0xC2, 0x02, 0x82, 0x02,
	0x62, 0x02, 0x50, 0x00,
	0x00, 0x00, 0x00, 0x00,//Stars at this
	0x00, 0x00, 0x00, 0x00,


	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};

const char ButtonStageMed[] = {
	0x82, 0x02, 0x62, 0x02,
	0x43, 0x03, 0x33, 0x03,
	0x00, 0x00, 0x00, 0x00,//Stars at this
	0x00, 0x00, 0x00, 0x00,


	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};

const char ButtonStageMin[] = {
	0x53, 0x03, 0x53, 0x03,
	0x44, 0x04, 0x33, 0x03,
	0x00, 0x00, 0x00, 0x00,//Stars at this
	0x00, 0x00, 0x00, 0x00,


	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};

const char TowerPalF1[] = {
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,

	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,

	0x11, 0x01
};

const char TowerPalF2[] = {
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,

	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,

	0x22, 0x02

};

const char TowerPalF3[] = {
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,

	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,

	0x33, 0x03

};

const char TowerPalF4[] = {
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,

	0x66, 0x06,
	0x55, 0x05,

	0x44, 0x04

};

const char TowerPalF5[] = {
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,

	0x66, 0x06,

	0x55, 0x05

};

const char TowerPalF6[] = {
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,

	0x66, 0x06

};

const char TowerPalF7[] = {
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,

	0x77, 0x07

};

const char TowerPalF8[] = {
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,

	0x88, 0x08

};

const char TowerPalF9[] = {
	0x88, 0x08,
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,
	0xAA, 0x0A,

	0x99, 0x09

};

const char TowerPalFA[] = {
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B,

	0xAA, 0x0A

};

const char TowerPalFB[] = {
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,

	0xBB, 0x0B

};

const char TowerPalFC[] = {
	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C

};

const char TowerPalFD[] = {
	0xCC, 0x0C,
	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E,
	0xDD, 0x0D

};

const char TowerPalFE[] = {
	0xDD, 0x0D,
	0xCC, 0x0C,
	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F,
	0xEE, 0x0E

};

const char TowerPalFF[] = {
	0xEE, 0x0E,
	0xDD, 0x0D,
	0xCC, 0x0C,
	0xBB, 0x0B,
	0xAA, 0x0A,
	0x99, 0x09,
	0x88, 0x08,
	0x77, 0x07,
	0x66, 0x06,
	0x55, 0x05,
	0x44, 0x04,
	0x33, 0x03,
	0x22, 0x02,
	0x11, 0x01,
	0x00, 0x00,
	0xFF, 0x0F

};

const char TowerPalFBlank[] = {
	0x00, 0x00,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08,
	0x88, 0x08

};

const char TestText2[] = s"CONCEPT CRISPS CODING CRISPS BLUMBA TOBACH MARK-BUG-SLAYER";

bool Control(bool playing) {

	//Tune Playing

	if (getchx() == SPACE)
	{
		playing = !playing;
		zsm_irq_play(playing);
	}

	return playing;
}

void SetUpSprites() {

	const unsigned long PauseAddr = VERA_SPRITES;
	const unsigned long ScrollerOutlineAddr = VERA_SPRITES + ((sizeof(Pause) + 31) & ~31);
	const unsigned long VolumeIndAddr = ScrollerOutlineAddr + ((sizeof(ScrollerOutline) + 31) & ~31);
	const unsigned long ArrowAddr = VolumeIndAddr + ((sizeof(VolumeIndAddr) + 31) & ~31);
	const unsigned long TowerBaseAddr = ArrowAddr + ((sizeof(Arrow) + 31) & ~31);
	const unsigned long MainEyeBackAddr = TowerBaseAddr + ((sizeof(MainEyeBack) + 31) & ~31);
	const unsigned long TowerTriAddr = MainEyeBackAddr + ((sizeof(EyeTri) + 31) & ~31);

	const unsigned long BGAddr = 0x0;
	const unsigned short BGMapAddr = 0x2000;
	const unsigned short TextAddr = 0x8000;

	//Set up Background
	vera.ctrl = 0; // &= ~VERA_CTRL_DCSEL;
	vera.dcvideo |= VERA_DCVIDEO_LAYER0 | VERA_DCVIDEO_LAYER1 | VERA_DCVIDEO_SPRITES;

	vera.dcvscale = 128;
	vera.dchscale = 128;

	// In this mode, a tile width and height is 8 pixels, so
	// Width: 640pixels / 8 = 80 tiles across = Need to set our width to 128
	// Height: 480pixels / 8 = 60 tiles down = Need to set our height to 64
	vera.l0config = VERA_LAYER_WIDTH_128 | VERA_LAYER_HEIGHT_64 | VERA_LAYER_DEPTH_4;

	vera.l1config = VERA_LAYER_WIDTH_128 | VERA_LAYER_HEIGHT_64 | VERA_LAYER_T256C | VERA_LAYER_DEPTH_1;

	//vera.l1mapbase = 0x04;

	//  VERA_TILE_WIDTH_8 | VERA_TILE_HEIGHT_8 aren't used on loconfig, they are for l0tilebase
	// The tileBaseConfig helper doesn't need them but if you are manually setting bits you can use them

	// height and width = 0 means 8x8 pixel tiles. Setting either to 1 makes that direction 16 pixels.
	// tilebase only uses 6 bits for address (which includes bank)
	// This helper takes care of that and also takes in the tile width/height since they are on same register
	// For W/H, 0=8 pixels, 1=16 pixels
	vera.l0tilebase = tileBaseConfig(0, BGAddr, 0, 0);

	vera.l0mapbase = memoryToMapMemoryAddress(0, BGMapAddr);

	vera.addrh = 1 | (2 << 4);

	for (unsigned i = 0; i < 128; i++)
	{
		for (unsigned j = 0; j < 80; j++)
		{
			vera.data1 = 0b00000000;
			vera.data1 = 8 + (1 << 8);
		}
	}

	vram_putn(BGAddr, MainBG, sizeof(MainBG));

	// Set address increment mode to 1 byte increments
	vera.addrh = 0b00010000;

	unsigned int R = 0;
	unsigned int S = 0;

	vera.addr = BGMapAddr;

	S = 0;
	for (unsigned i = 0; i < 60; i++)
	{
		for (unsigned j = 0; j < 128; j++) {

			R = rand() % 32;

			if (R <= 30)
			{
				if (j < 9 || j > 69) {
					vera.data0 = 0;
				}
				else if (j < 19 || j > 59) {
					vera.data0 = 1;
				}
				else if (j < 29 || j > 49) {
					vera.data0 = 2;
				}
				else {
					vera.data0 = 3;
				}
			}
			else
			{
				if (j < 9 || j > 69) {
					vera.data0 = 4;
				}
				else if (j < 19 || j > 59) {
					vera.data0 = 5;
				}
				else if (j < 29 || j > 49) {
					vera.data0 = 6;
				}
				else {
					vera.data0 = 7;
				}
			}
			R = 0;
			vera.data0 = 0;
		}
	}

	SetPaletteColours(BGPal, sizeof(BGPal), 0x1FA00UL);

	vram_putn(ScrollerOutlineAddr, ScrollerOutline, sizeof(ScrollerOutline));

	//Pause
	vram_putn(PauseAddr, Pause, sizeof(Pause));
	vera_spr_set(22, PauseAddr >> 5, false, 1, 2, 3, 1);
	vera_spr_move(22, 304, 440);

	//Bottom bars around the text
	for (unsigned long i = 0; i < 22; i += 2)
	{
		vera_spr_set(i, ScrollerOutlineAddr >> 5, false, 3, 2, 3, 1);
		vera_spr_move(i, 32 * i, 416);
		vera_spr_set(i + 1, ScrollerOutlineAddr >> 5, false, 3, 2, 3, 1);
		vera_spr_move(i + 1, 32 * i, 368);
	}

	vram_putn(ArrowAddr, Arrow, sizeof(Arrow));
	vera_spr_set(23, ArrowAddr >> 5, false, 2, 2, 3, 1);
	vera_spr_move(23, 252, 440);
	vera_spr_set(24, ArrowAddr >> 5, false, 2, 2, 3, 1);
	vera_spr_move(24, 332, 440);

	SetPaletteColours(palette, sizeof(palette), 0x1FA20UL);


	vram_putn(VolumeIndAddr, VolumeInd, sizeof(VolumeInd));
	for (unsigned i = 0; i < 8; i++)
	{
		vera_spr_set(25 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 2);
		vera_spr_move(25 + i, 4 + i * 12, 440);
	}
	for (unsigned i = 0; i < 8; i++)
	{
		vera_spr_set(33 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 3);
		vera_spr_move(33 + i, 4 + i * 12, 452);
	}
	for (unsigned i = 0; i < 8; i++)
	{
		vera_spr_set(41 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 4);
		vera_spr_move(41 + i, 620 - i * 12, 440);
	}

	vram_putn(MainEyeBackAddr, MainEyeBack, sizeof(MainEyeBack));
	vera_spr_set(49, MainEyeBackAddr >> 5, false, 3, 3, 3, 5);
	vera_spr_move(49, 284, 120);

	vram_putn(TowerBaseAddr, TowerBase, sizeof(TowerBase));
	for (unsigned i = 0; i < 7; i++)
	{
		vera_spr_set(50 + i, TowerBaseAddr >> 5, false, 3, 3, 3, 5);
		vera_spr_move(50 + i, 308 - 64, i * 64 - 32);
		vera_spr_set(57 + i, TowerBaseAddr >> 5, false, 3, 3, 3, 5);
		vera_spr_move(57 + i, 320, i * 64 - 32);
	}


	SetPaletteColours(ButtonStageMax, sizeof(ButtonStageMax), 0x1FA40UL);
	SetPaletteColours(ButtonStageMed, sizeof(ButtonStageMed), 0x1FA60UL);
	SetPaletteColours(ButtonStageMin, sizeof(ButtonStageMin), 0x1FA80UL);
	SetPaletteColours(TowerPalF1, sizeof(TowerPalF1), 0x1FAA0UL);
}

int main(){

	const unsigned SCREEN_WIDTH = 640;
	const unsigned SCREEN_HEIGHT = 480;

    bool Running = true;
	bool Playing = false;

	zsm_irq_init();
//	zsm_init("@0:zsmfiles/ArkanoidFM.zsm,P,R");	

	ClearVERAScreen();

	SetUpSprites();

	vera.ctrl |= VERA_CTRL_DCSEL;
	vera.dchscale = 158;
	vera.ctrl &= ~VERA_CTRL_DCSEL;

	vera.addrh = 0b00100001;

	vera.addr = 0xb000;

	//sets scroller position
	vera.l1vscroll = 115;

	while (Running)
	{
		p++;
		if (Playing)
		{
			PalTimer++;
		}
		else
		{
			PalTimer = 0;
			SetPaletteColours(TowerPalFBlank, sizeof(TowerPalFBlank), 0x1FAA0UL);
		}

		vera.dcborder = 60;
		
		if (PalTimer > 3)
		{
			PalIndex++;
			if (PalIndex == 0)
			{
				SetPaletteColours(TowerPalFF, sizeof(TowerPalF1), 0x1FAA0UL);
			}
			else if (PalIndex == 1)
			{
				SetPaletteColours(TowerPalFE, sizeof(TowerPalF1), 0x1FAA0UL);
			}
			else if (PalIndex == 2)
			{
				SetPaletteColours(TowerPalFD, sizeof(TowerPalF3), 0x1FAA0UL);
			}
			else if (PalIndex == 3)
			{
				SetPaletteColours(TowerPalFC, sizeof(TowerPalF4), 0x1FAA0UL);
			}
			else if (PalIndex == 4)
			{
				SetPaletteColours(TowerPalFB, sizeof(TowerPalF5), 0x1FAA0UL);
			}
			else if (PalIndex == 5)
			{
				SetPaletteColours(TowerPalFA, sizeof(TowerPalF6), 0x1FAA0UL);
			}
			else if (PalIndex == 6)
			{
				SetPaletteColours(TowerPalF9, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 7)
			{
				SetPaletteColours(TowerPalF8, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 8)
			{
				SetPaletteColours(TowerPalF7, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 9)
			{
				SetPaletteColours(TowerPalF6, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 10)
			{
				SetPaletteColours(TowerPalF5, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 11)
			{
				SetPaletteColours(TowerPalF4, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 12)
			{
				SetPaletteColours(TowerPalF3, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 13)
			{
				SetPaletteColours(TowerPalF2, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else if (PalIndex == 14)
			{
				SetPaletteColours(TowerPalF1, sizeof(TowerPalF7), 0x1FAA0UL);
			}
			else 
			{
				PalIndex = 0;
				SetPaletteColours(TowerPalFF, sizeof(TowerPalF1), 0x1FAA0UL);
			}
			PalTimer = 0;
		}
		
		if (p == 3)
		{
			ShimmerState = !ShimmerState;
			if (ShimmerState)
			{
				SetPaletteColours(BGPal, sizeof(BGPal), 0x1FA00UL);
			}
			else
			{
				SetPaletteColours(BGPalShimmer, sizeof(BGPalShimmer), 0x1FA00UL);
			}
			p = 0;
		}
		vera.dcborder = 3;
		if (zsm_check())
			zsm_init("@0:zsmfiles/ThiccFile.zsm,P,R");	

		Playing = Control(Playing);

		if (FrameCount % 4 == 1) {
			if (off1+16 < sizeof(TestText2))
			{
				vera.data0 = TestText2[off1];
			}
			off1++;
		}

		vera.l1hscroll = -256 + FrameCount * 2;

		vera.dcborder = 1;
		int n = zsm_fill();
		vera.dcborder = 0;

		frame_wait();
		FrameCount++;
	}

    return 0;
}
