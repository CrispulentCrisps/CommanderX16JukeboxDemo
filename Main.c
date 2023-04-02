#include <stdio.h>
#include <stdlib.h>

#include <c64/sprites.h>
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

const char sprite[] = {
	#embed "sprites/bin/TESTSPRITE.bin"
};

const char palette[] = {
	#embed "sprites/palette/UIPalette.bin"
};

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

	zsm_init(sound);

	ClearVERAScreen();

	vera.ctrl |= VERA_CTRL_DCSEL;
	vera.dchscale = 150;
	vera.ctrl &= ~VERA_CTRL_DCSEL;

	while (Running)
	{
		vera.dcborder = 1;
		Playing = Control(Playing);

		if (Playing)
		{
			vera.dcborder = 6;
			if (!zsm_play())
				zsm_init(sound);
		}

		vera.dcborder = 0;

		frame_wait();
	}

    return 0;
}
