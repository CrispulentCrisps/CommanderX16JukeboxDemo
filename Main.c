#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <c64/rasterirq.h>
#include <conio.h>
#include<math.h>

#include "ZSMPlayer.h"
#include "Sprites.h"

#define A 0x41
#define D 0x44
#define L_ARROW 0x9D
#define R_ARROW 0x1D
#define SPACE 0x20

#define Pal1 ()

int FrameCount = 0;
char off1, off2;
int p = 0;

/*
const char TestSpriteImage[] = {
	#embed 32 2 "sprites/bin/TESTSPRITE.BIN"
};
*/
const char ScrollerOutline[] = {
	#embed 1024 0 "sprites/bin/SCROLLEROUTLINE.BIN"
};

const char Pause[] = {
	#embed 1024 10 "sprites/bin/PAUSE.BIN"
};

const char Arrow[] = {
	#embed 1024 30 "sprites/bin/ARROW.BIN"
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
	// Enable sprite display
	vera.ctrl &= ~VERA_CTRL_DCSEL;
	vera.dcvideo |= 0x40;
	//Bottom bars around the text
	for (unsigned i = 0; i < 22; i+=2)
	{
		Setup(i, 0x13000UL, false, 3, 1, 3, 1, ScrollerOutline, sizeof(ScrollerOutline));
		vera_spr_move(i, 32 * i, 432-16);
		Setup(i + 1, 0x13000UL, false, 3, 1, 3, 1, ScrollerOutline, sizeof(ScrollerOutline));
		vera_spr_move(i + 1, 32 * i, 384 - 16);
	}

	//Pause
	Setup(23, 0x13100UL, false, 2, 2, 3, 1, Pause, sizeof(Pause));
	vera_spr_move(23,282,440);

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
	vera.dchscale = 154;
	vera.ctrl &= ~VERA_CTRL_DCSEL;
	
	//TypeTextVERA(TestText2,0,0);

	vera.addrh = 0b00100001;

	//vera.addr = vera.addr + (256*32);//+(20*8)-8;

	vera.addr = 0xb000;

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
