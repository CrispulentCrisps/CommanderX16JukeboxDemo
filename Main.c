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

const char TestText[] =
	s"Concept: Crisps, Coding: Crisps, Blumba, Tobach";

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

	TypeTextVERA(TestText,0,0);

	while (Running)
	{
		Playing = Control(Playing);

		ScrollerText(TestText, 0, 0, FrameCount);

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
