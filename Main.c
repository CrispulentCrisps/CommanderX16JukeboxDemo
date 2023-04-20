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

const char MainBG[] = {
	// In 8x8 pixel tiles with 2bits per pixel, each tile is 16 bytes
	// The MAINBG.BIN file isn't the correct size because it has 2 leading bytes
	// This is a C64 convention where 2 leading bytes are used by the kernal as an optional loading address
	// You need to trim them off or load with the kernal routine unless #embed removes them (which I don't think it is)
	// #embed 512 "sprites/bin/MAINBG.BIN"
	// These are just 4 sample tiles (solid colors) you can play with
 	  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
	255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255,
	 85,  85,  85,  85,  85,  85,  85,  85,  85,  85,  85,  85,  85,  85,  85,  85,
	170, 170, 170, 170, 170, 170, 170, 170, 170, 170, 170, 170, 170, 170, 170, 170,
};

const char ScrollerOutline[] = {
	#embed 1024 2 "sprites/bin/SCROLLEROUTLINE.BIN"
};

const char Pause[] = {
	#embed 1024 2 "sprites/bin/PAUSE.BIN"
};

const char Arrow[] = {	
	#embed 1024 30 "sprites/bin/ARROW.BIN"
};
const char VolumeInd[] = {
	#embed 64 "sprites/bin/VOLUMEBUTTON.BIN"

};

const char palette[] = {
	0x00, 0x00, 0xFF, 0x0F,
	0xEE, 0x0F, 0xFF, 0xEE,
	0xAA, 0x0A, 0x88, 0x08,
	0x66, 0x06, 0x44, 0x04,

	0x00, 0x00, 0xFF, 0x0F,
	0xEE, 0x0F, 0xFF, 0xEE,
	0xAA, 0x0A, 0x88, 0x08,
	0x66, 0x06, 0x44, 0x04
};

const char BGPal[] = {
	0x00, 0x00, 0x11, 0x01,
	0x22, 0x02, 0x33, 0x03,
	0x44, 0x04, 0x55, 0x05,
	0x66, 0x06, 0x77, 0x07,

	0x88, 0x08, 0x99, 0x09,
	0xAA, 0x0A, 0xBB, 0x0B,
	0xCC, 0x0C, 0xDD, 0x0D,
	0xEE, 0x0E, 0xFF, 0x0F
};

const char TestText[] = s"Concept Crisps Coding Crisps Blumba, Tobach";

const char TestText2[] = s"CONCEPT CRISPS CODING CRISPS BLUMBA TOBACH";

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
	const unsigned long BGAddr = 0x0;
	const unsigned short BGMapAddr = 0x2000;

	//Set up Background
	vera.ctrl = 0; // &= ~VERA_CTRL_DCSEL;
	vera.dcvideo |= VERA_DCVIDEO_LAYER0 | VERA_DCVIDEO_LAYER1 | VERA_DCVIDEO_SPRITES;
	
	vera.dcvscale = 128;
	vera.dchscale = 128;
	
	// In this mode, a tile width and height is 8 pixels, so
	// Width: 640pixels / 8 = 80 tiles across = Need to set our width to 128
	// Height: 480pixels / 8 = 60 tiles down = Need to set our height to 64
	vera.l0config = VERA_LAYER_WIDTH_128 | VERA_LAYER_HEIGHT_64 | VERA_LAYER_DEPTH_2;
	
	//  VERA_TILE_WIDTH_8 | VERA_TILE_HEIGHT_8 aren't used on loconfig, they are for l0tilebase
	// The tileBaseConfig helper doesn't need them but if you are manually setting bits you can use them

	// height and width = 0 means 8x8 pixel tiles. Setting either to 1 makes that direction 16 pixels.
	// tilebase only uses 6 bits for address (which includes bank)
	// This helper takes care of that and also takes in the tile width/height since they are on same register
	// For W/H, 0=8 pixels, 1=16 pixels
	vera.l0tilebase = tileBaseConfig(0, BGAddr, 0, 0);

	vera.l0mapbase = memoryToMapMemoryAddress(0, BGMapAddr);

	vram_putn(BGAddr, MainBG, sizeof(MainBG));

	// Set address increment mode to 1 byte increments
	vera.addrh = 0b00010000;

	unsigned int R = 0;
	unsigned int LW1 = 4;
	unsigned int LW2 = 8;
	unsigned int LW3 = 16;

	vera.addr = BGMapAddr;

	// We only need to go from 0-59 because the last 4 are off the screen
	for (unsigned i = 0; i < 60; i++)
	{
		if (i <= LW1)
		{
			// A row contains 80 tiles in this mode but we write all the way to 127
			// so the data0 continues to increment.
			// You can also stop after 79 and reset the address but that's complicated
			// Usually easier to just write the tiles off screen too and don't worry about it.
			for (unsigned j = 0; j < 128; j++)
			{
				vera.data0 = 0x00;
				vera.data0 = 0;
			}
		}
		else if (i > LW1 && i <= LW2)
		{
			for (unsigned j = 0; j < 128; j++)
			{
				vera.data0 = 0x01;
				vera.data0 = 0;
			}
		}
		else if (i > LW2 && i <= LW3)
		{
			for (unsigned j = 0; j < 128; j++)
			{
				vera.data0 = 0x02;
				vera.data0 = 0;
			}
		}
		else
		{
			for (unsigned j = 0; j < 128; j++)
			{
				vera.data0 = 0x03;
				vera.data0 = 0;
			}
		}
		
	}

	SetPaletteColours(BGPal, sizeof(BGPal), 0x1FB20UL);

	vram_putn(ScrollerOutlineAddr ,ScrollerOutline, sizeof(ScrollerOutline));

	//Pause
	vram_putn(PauseAddr, Pause, sizeof(Pause));
	vera_spr_set(23, PauseAddr >> 5, false, 2, 2, 3, 1);
	vera_spr_move(23, 282, 440);

	//Bottom bars around the text
	for (unsigned long i = 0; i < 22; i+=2)
	{
		vera_spr_set(i, ScrollerOutlineAddr >> 5, false, 3, 1, 3, 1);
		vera_spr_move(i, 32 * i, 432-16);
		vera_spr_set(i + 1, ScrollerOutlineAddr >> 5, false, 3, 1, 3, 1);
		vera_spr_move(i + 1, 32 * i, 384 - 16);
	}
	
	SetPaletteColours(palette, sizeof(palette), 0x1FA20UL);
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
	
	//TypeTextVERA(TestText2,0,0);

	vera.addrh = 0b00100001;

	//vera.addr = vera.addr + (256*32);//+(20*8)-8;

	vera.addr = 0xb000;

	//sets scroller position
	vera.l1vscroll = 115;

	int nmax = 0;
	while (Running)
	{
		vera.dcborder = 3;
		if (zsm_check())
			zsm_init("@0:zsmfiles/paperclip.zsm,P,R");	

		Playing = Control(Playing);

		//ScrollerText(TestText2, 0, 0, FrameCount);

		if (FrameCount % 4 == 1) {
			vera.data0 = TestText2[off1] - 64;
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
