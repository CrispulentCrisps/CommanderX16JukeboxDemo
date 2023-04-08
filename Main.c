#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <c64/rasterirq.h>
#include <conio.h>

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
unsigned int vadr;

const char sample[] = {
	#embed "pcm/test.wav"
};

const char TestSpriteImage[] = {
	#embed 32 2 "sprites/bin/TESTSPRITE.BIN"
};
/*
const char palette[] = {
	0x00, 0x00, 0xFF, 0x0F, 
	0xEE, 0x0F, 0xEE, 0x0E, 
	0xAA, 0x0A, 0x88, 0x08, 
	0x66, 0x06, 0x44, 0x04,

	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00
};
*/
const char palette[] = {
	0xFF, 0x0F, 0xFF, 0x0F,
	0xFF, 0x0F, 0xFF, 0x0F,
	0xFF, 0x0F, 0xFF, 0x0F,
	0xFF, 0x0F, 0xFF, 0x0F,

	0xFF, 0x0F, 0xFF, 0x0F,
	0xFF, 0x0F, 0xFF, 0x0F,
	0xFF, 0x0F, 0xFF, 0x0F,
	0xFF, 0x0F, 0xFF, 0x0F
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
	Setup(2, 0x13000UL, false, 0, 0, 3, 0, TestSpriteImage, sizeof(TestSpriteImage));
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
		if (zsm_check())
			zsm_init("@0:zsmfiles/ArkanoidFM.zsm,P,R");	

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
