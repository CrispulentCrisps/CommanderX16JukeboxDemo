#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <c64/rasterirq.h>
#include <conio.h>

#include "ZSMPlayer.h"

#define A 0x41
#define D 0x44
#define L_ARROW 0x9D
#define R_ARROW 0x1D
#define SPACE 0x20

const char sound[] = {
	#embed "zsmfiles/test.zsm"
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
	s"Concept: Crisps, Coding: Crisps+Blumba";

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

		zsm_irq_play(Playing);

		frame_wait();
	}

    return 0;
}
