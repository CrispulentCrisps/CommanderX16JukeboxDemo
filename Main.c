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

const char CharBox[] = {
	#embed 2048 2 "sprites/bin/CHARBOX.BIN"
};

unsigned palette[] = {

	0xFFF,
	0xBBB,
	0x999,
	0x666,
	
	0x444, 
	0x222, 
	0x292,
	0x2C2,
	0x161,

	0x030,
	0x000, 
	0x000,
	
	0x000, 
	0x000,
	0x000, 
	0x000
};

const char BGPal[] = {
	0x23, 0x02, 
	0x12, 0x01,
	0x01, 0x01, 
	0x77, 0x07,//Stars at this
	0xFF, 0x0F, 
	0xAA, 0x0A,
	0x66, 0x06,
	0x22, 0x02,

	0xFF, 0x0F,//Building Colours
	0xDD, 0x0D,
	0xBB, 0x0B,
	0x99, 0x09,
	0x77, 0x07,
	0x55, 0x05,
	0x33, 0x03,
	0x11, 0x01
};

const char BGPalShimmer[] = {
	0x23, 0x02, 0x12, 0x01,
	0x01, 0x11, 0x55, 0x05,
	0xDD, 0x0D, 0x88, 0x08,//Stars at this
	0x44, 0x04, 0x11, 0x01,


	0xFF, 0x0F,//Building Colours
	0xDD, 0x0D,
	0xBB, 0x0B,
	0x99, 0x09,
	0x77, 0x07,
	0x55, 0x05,
	0x33, 0x03,
	0x11, 0x01
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

unsigned TowerPalF1[] = {
	0x000,
	0xFFF,
	0xEEE,
	0xDDD,
	0xCCC,
	0xBBB,
	0xAAA,
	0x999,
	0x888,
	0x777,
	0x666,
	0x555,
	0x444,
	0x333,
	0x222,
	0x111
};

char TowerPalFBlank[] = {
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
	0x88, 0x08,
	0x88, 0x08

};

unsigned CharBoxPalette[] = {
	 0x99F,
	 0x66D,
	 0x44D,
	 0x229,
	 0x22B,
	 0x22D
};

const char TestText2[] = s"CONCEPT CRISPS CODING CRISPS BLUMBA TOBACH MARK-BUG-SLAYER";

static bool paused = false;

bool Control(bool playing)	 {

	//Tune Playing

	if (getchx() == SPACE)
	{
		if (playing)
		{
		paused = !paused;
		zsm_pause(paused);			
		}
		else
		{
			playing = !playing;
			zsm_irq_play(playing);
		}
	}

	return playing;
}

struct BuildStruct {
	unsigned short Depth;
	unsigned short CenterX;
	unsigned short CenterY;
	unsigned short width;
	unsigned short height;
};


void SetUpSprites() {

	const unsigned long PauseAddr = VERA_SPRITES;
	const unsigned long ScrollerOutlineAddr = VERA_SPRITES + ((sizeof(Pause) + 31) & ~31);
	const unsigned long VolumeIndAddr = ScrollerOutlineAddr + ((sizeof(ScrollerOutline) + 31) & ~31);
	const unsigned long ArrowAddr = VolumeIndAddr + ((sizeof(VolumeInd) + 31) & ~31);
	const unsigned long TowerBaseAddr = ArrowAddr + ((sizeof(Arrow) + 31) & ~31);
	const unsigned long MainEyeBackAddr = TowerBaseAddr + ((sizeof(TowerBase) + 31) & ~31);
	const unsigned long TowerTriAddr = MainEyeBackAddr + ((sizeof(MainEyeBack) + 31) & ~31);
	const unsigned long CharBoxAddr = TowerTriAddr + ((sizeof(EyeTri) + 31) & ~31);

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

	//Clear L1
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
	//Make BG
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

	vram_putn(ScrollerOutlineAddr, ScrollerOutline, sizeof(ScrollerOutline));

	//Bottom bars around the text
	for (unsigned long i = 0; i < 22; i += 2)
	{
		vera_spr_set(i, ScrollerOutlineAddr >> 5, false, 3, 2, 3, 1);
		vera_spr_move(i, 32 * i, 400);
		vera_spr_flip(i, false, true);

		vera_spr_set(i + 1, ScrollerOutlineAddr >> 5, false, 3, 2, 3, 1);
		vera_spr_move(i + 1, 32 * i, 368);
	}

	//Pause
	vram_putn(PauseAddr, Pause, sizeof(Pause));
	vera_spr_set(22, PauseAddr >> 5, false, 1, 2, 3, 1);
	vera_spr_move(22, 304, 440);

	vram_putn(ArrowAddr, Arrow, sizeof(Arrow));
	vera_spr_set(23, ArrowAddr >> 5, false, 2, 2, 3, 1);
	vera_spr_move(23, 252, 440);
	vera_spr_set(24, ArrowAddr >> 5, false, 2, 2, 3, 1);
	vera_spr_move(24, 332, 440);
	vera_spr_flip(24, true, false);

	vera_pal_putn(16, palette, sizeof(palette));


	vram_putn(VolumeIndAddr, VolumeInd, sizeof(VolumeInd));
	for (unsigned i = 0; i < 8; i++)
	{
		vera_spr_set(25 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 2);
		vera_spr_move(25 + i, 4 + i * 12 - 1024, 440);
	}
	for (unsigned i = 0; i < 8; i++)
	{
		vera_spr_set(33 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 3);
		vera_spr_move(33 + i, 4 + i * 12 - 1024, 452);
	}
	for (unsigned i = 0; i < 8; i++)
	{
		vera_spr_set(41 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 4);
		vera_spr_move(41 + i, 620 - i * 12 - 1024, 440);
	}

	for (unsigned i = 0; i < 2; i++)
	{
		for (unsigned j = 0; j < 2; j++)
		{
			vera_spr_set(49 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 4);
			vera_spr_move(49 + i, 620 - i * 12, 440);
		}
	}

	vram_putn(MainEyeBackAddr, MainEyeBack, sizeof(MainEyeBack));
	vera_spr_set(51, MainEyeBackAddr >> 5, false, 3, 2, 3, 5);
	vera_spr_move(51, 284, 120);

	vram_putn(TowerBaseAddr, TowerBase, sizeof(TowerBase));
	for (unsigned i = 0; i < 7; i++)
	{
		vera_spr_set(52 + i, TowerBaseAddr >> 5, false, 3, 3, 3, 5);
		vera_spr_move(52 + i, 308 - 64, i * 64 - 32);
		vera_spr_set(59 + i, TowerBaseAddr >> 5, false, 3, 3, 3, 5);
		vera_spr_move(59 + i, 320, i * 64 - 32);
	}

	//Tl Box
	vram_putn(CharBoxAddr, CharBox, sizeof(CharBox));
	vera_spr_set(66, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(66,8,8);

	vera_spr_set(67, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(67, 64+8, 8);
	vera_spr_flip(67, true, false);

	vera_spr_set(68, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(68, 64+8, 64+8);
	vera_spr_flip(68, true, true);

	vera_spr_set(69, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(69, 8, 64+8);
	vera_spr_flip(69, false, true);

	//Tr Box
	vram_putn(CharBoxAddr, CharBox, sizeof(CharBox));
	vera_spr_set(70, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(70, 640- 128 - 8, 8);

	vera_spr_set(71, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(71, 640 - 64-8, 8);
	vera_spr_flip(71, true, false);

	vera_spr_set(72, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(72, 640 - 64 - 8, 64+8);
	vera_spr_flip(72, true, true);

	vera_spr_set(73, CharBoxAddr >> 5, false, 3, 3, 7, 6);
	vera_spr_move(73, 640 - 128 - 8, 64+8);
	vera_spr_flip(73, false, true);

	SetPaletteColours(ButtonStageMax, sizeof(ButtonStageMax), 0x1FA40UL);
	SetPaletteColours(ButtonStageMed, sizeof(ButtonStageMed), 0x1FA60UL);
	SetPaletteColours(ButtonStageMin, sizeof(ButtonStageMin), 0x1FA80UL);
	vera_pal_putn(96, CharBoxPalette, sizeof(CharBoxPalette));
}

int main(){
	const unsigned SCREEN_WIDTH = 640;
	const unsigned SCREEN_HEIGHT = 480;

    bool Running = true;
	bool Playing = false;

	zsm_irq_init();

	ClearVERAScreen();

	SetUpSprites();

	vera.ctrl |= VERA_CTRL_DCSEL;
	vera.dchscale = 158;
	vera.ctrl &= ~VERA_CTRL_DCSEL;

	vera.addrh = 0b00100001;

	vera.addr = 0xb000;

	//sets scroller position
	vera.l1vscroll = 115;
	unsigned PalTime2 = 0;

	struct BuildStruct Buildings[8];

	while (Running)
	{
		p++;
		PalTime2++;
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
		if (PalTime2 > 2)
		{
			SetPaletteIndex(palette, 16, 6, 10);
			PalTime2 = 0;
		}

		if (PalTimer > 3)
		{
			PalIndex++;
			SetPaletteIndex(TowerPalF1, 80, 0, 16);
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
