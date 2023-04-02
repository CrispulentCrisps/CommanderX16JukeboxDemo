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
	#embed "zsmfiles/ArkanoidFM.zsm"
};

const char sample[] = {
	#embed "pcm/test.wav"
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

	int n = 0;

	zsm_init(sound);

	vera.ctrl |= VERA_CTRL_DCSEL;
	vera.dchscale = 100;
	vera.ctrl &= ~VERA_CTRL_DCSEL;

	while (Running)
	{
		Playing = Control(Playing);
		if (Playing)
		{
			printf("%x",n);
			if (!zsm_play())
				zsm_init(sound);
			frame_wait();
		}

		vera.dcborder++;

		n++;
	}

    return 0;
}
