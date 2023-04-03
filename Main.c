#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <c64/rasterirq.h>
#include <conio.h>

#include "ZSMPlayer.h"

/*
	Objects on L0
	Text on L1
*/

#define A 0x41
#define D 0x44
#define L_ARROW 0x9D
#define R_ARROW 0x1D
#define SPACE 0x20

int FrameCount = 0;
char off1, off2;
unsigned int vadr;

const char sound[] = {
	#embed "zsmfiles/ArkanoidFM.zsm"
};

const char sample[] = {
	#embed "pcm/test.wav"
};

const char sprite[] = {
	#embed "sprites/bin/TESTSPRITE.BIN"
};

const char palette[] = {
	#embed "sprites/palette/UIPalette.BIN"
};

const char TestText[] = s"Concept: Crisps, Coding: Crisps, Blumba, Tobach";

const char TestText2[] = s"CONCEPT: CRISPS, CODING: CRISPS, BLUMBA, TOBACH";


bool Control(bool playing) {

	//Tune Playing

	if (getchx() == SPACE)
	{
		playing = !playing;
	}

	return playing;
}


int main(){

	const unsigned SCREEN_WIDTH = 640;
	const unsigned SCREEN_HEIGHT = 480;

    bool Running = true;
	bool Playing = false;

	zsm_irq_init();
	zsm_init(sound);

	ClearVERAScreen();

	vera.ctrl |= VERA_CTRL_DCSEL;
	vera.dchscale = 154;
	vera.ctrl &= ~VERA_CTRL_DCSEL;

	//TypeTextVERA(TestText2,0,0);

	vera.addrh = 0b00100001;

	//vera.addr = vera.addr + (256*32);//+(20*8)-8;

	vera.addr = 0xb000;

	while (Running)
	{
		Playing = Control(Playing);

		//ScrollerText(TestText2, 0, 0, FrameCount);

		if(FrameCount%4==1){
			vera.data0 = TestText2[off1]-64;
			off1++;
		}

		vera.l1hscroll = -256 + FrameCount*2;

		if (Playing)
		{
			vera.dcborder = 6;
			if (!zsm_play())
				zsm_init(sound);
		}

		vera.dcborder = 0;
		zsm_irq_play(Playing);

		frame_wait();
		FrameCount++;
	}

    return 0;
}
