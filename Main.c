#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <c64/rasterirq.h>
#include <conio.h>
#include <math.h>
#include <stdarg.h>

#include "ZSMPlayer.h"
#include "Sprites.h"

#define KEY_A 0x41
#define KEY_D 0x44
#define KEY_L_ARROW 0x9D
#define KEY_R_ARROW 0x1D
#define KEY_SPACE 0x20

const char MainBG[] = {
	#embed 800 2 "sprites/bin/MAINBG.BIN"
};
const char Pause[] = {
	#embed 256 2 "sprites/bin/PAUSE.BIN"
};
const char Playing[] = {
	#embed 256 2 "sprites/bin/PLAYING.BIN"
};
const char Arrow[] = {	
	#embed 512 2 "sprites/bin/ARROW.BIN"
};
const char VolumeInd[] = {
	#embed 512 2 "sprites/bin/VOLUMEBUTTON.BIN"
};

const char TowerBase[] = {
	#embed 2048 2 "sprites/bin/EYETOWERVASR.BIN"
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

const char WavySprite[] = {
	#embed 256 2 "sprites/bin/DRAGONBODY.BIN"
};

const char WavyHead[] = {
	#embed 512 2 "sprites/bin/DRAGONHEAD.BIN"
};

const char VERASprite[] = {
	#embed 512 2 "sprites/bin/VERA.BIN"
};
const char YMSprite[] = {
	#embed 512 2 "sprites/bin/YM-2151.BIN"
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

unsigned WavyPal[] = {

	0xD00,
	0x900,
	0xDD0,
	0x099,

	0x0D0,
	0x090
};

unsigned BGPal[] = {
	0x224,
	0x112,
	0x111,
	0xAAA,

	0x226,
	0xFFF,
	0xDDD,
	0x666,

	0xB9F,
	0xEEF,
	0x99F,
	0x66D,
	
	0x44D,
	0x229,
	0x22B,
	0x22D,
};

unsigned ButtonStageMax[] = {
	0x4F4,
	0x4E4,
	0x4D4,
	0x4C4,
	0x3B3,
	0x3A3,
	0x393,
	0x383,
	0x272,
	0x262,
	0x252,
	0x141,
	0x131,
	0x121,
	0x010,
	0x000,
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
	 0x22D,
	 0x000,
	 0x000,

	 0x000,
	 0x000,
	 0x000,
	 0x000,

	 0x000,
	 0x000,
	 0x000,
	 0x000,
};

unsigned TextPal[] = {
	 0xEEF,
	 0xDDF,
	 0xCCF,
	 0xBBF,

	 0xAAF,
	 0x99F,
	 0x88F,
	 0x77F,

	 0x66F,
	 0x77F,
	 0x88F,
	 0x99F, 
	 
	 0xAAF,
	 0xBBF,
	 0xCCF,
	 0xDDF,
};

unsigned YMPal[] = {
	 0x000,
	 0xFFF,
	 0xDDD,
	 0x000,

	 0x222,
	 0x444,
	 0x666,
	 0x111,
};

unsigned VERAPal[] = {
	 0x000,
	 0xFFF,
	 0xDDD,
	 0x000,

	 0x666,
	 0x111,
	 0x444,
	 0x222,
	 0x114,
	 0x66F,

	 0x44F,
	 0x13F,
	 0x0FD,
};

unsigned CrispyPal[] = {
	0x000,
	0x000,
	0x112,
	0x222,
	0xFFF,
	0x90F,
	0x224,
	0x610,
	0x339,
	0x400,
	0xDD9,//Skin shading
	0xDDD,
	0x08C,
	0x0AF,//Main shirt colour
	0xCCC,
	0xAAA,
};

unsigned FldePal[] = {
	0x000,
	0x000,
	0xDDD,
	0xFFF,
	0x23E,
	0x0CF,
	0x0AD,
	0x45F,
	0x227,
	0x000,
	0x000,
	0x000,
	0x000,
	0x000,
	0x000,
	0x000,
};

unsigned KolePal[] = {
	0x000,
	0x279,
	0x000,
	0xA40,
	0x730,
	0xFFF,
	0xF00,
	0x06C,
	0x0BF,
	0x999,
	0xCCC,
	0x60F,
	0x7BE,
	0x208,
	0x333,
	0x000,
};

unsigned CoderPal[] = {
	0x000,
	0x000,
	0xFFF,
	0xDDD,
	0x2B2,
	0x4D4,
	0x5E5,
	0x0FB,
	0x0BF,
	0xC10,
	0xF22,
	0x11B,
	0x000,
	0x000,
};

unsigned RealPal[] = {
	0x000,
	0x000,
	0x420,
	0x446,
	0x669,
	0x940,
	0x0FF,
	0x444,
	0xBBB,
	0xDDD,
	0xC75,
	0xEA7,
	0xFFF,
	0xDDF,
	0x333,
	0x999,
};

const char TestText2[] =	s" - - = = credits: code: blumba, mark-bugslayer, crisps. musicians: abstract64, aleksi winston, fade, kole-o-black, mega-sparky, the-real-hedgehog-sonic"
							s". crisps here, this was the first time working on any 8 bit machine. thanks to the coders listed i managed to finish this with the oscar64 compiler. most folk  told me to use cc65 however i was interested in having the program actually compile than give me cryptic errors and permission issues (despite the fact i own the computer) >:[. "
							s"either way, this is existing and i do wanna thank everyone who's helped out with this.without a group of musicians (and especially coders) this wouldn't exist in any capacity. in terms of why, well, i wanted be in a music disc / demo and since i couldn't find a coder who'd do it for me i just said \" f u c k  i t  i'll do it myself.\" and since you're reading this it was a success."
							s"i did find that going to the x16 music wise was very easy. since the vera chip's music capabilites are so sid-like i could bring sound design from that to the vera. fm wise, i'd already been working on music on the megadrive for a long-ass time beforehand so that was a smooth jump as well, since starting i've also tried improving the sound design, to vary degrees of success..."
							s"i also didn't expect this to take so long, as my original plan was two weeks. as of writing this it's been over two months. oops. ah well, could be worse."
							s"NMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNMNM = = - -";

const char Song1[] =  s" - - = = song name: - \"paperclip\" - artist: \"kole-o-black\" - length: 2:59 - comment: originally called \"destroy\", i made this track a few months back primarily as means to study 2151 sound design, and also as a starting point for my cx16 music work in general. "
					  s"if you're from the sharp x68k scene, you might be able to spot the semblance between this track and hizmi's \"mutsuradaiko\" / \"mutzrad\" track from their drum daemon album. that's not a coincidence; one of my goals in the cx16 scene *is* to be (to an extent) its hizmi. (or really any of the x68k hardcore techno afficionados) the name? i suppose it's a song to reopen old david murray wounds to. the clipping and the loudness ? it's intentional. "
					  s"i recall sheepishly showing a preview this track to my extracurricular sound arts activity professor while doing an introduction to generating sound objects after he asked us if any of us did anything in terms of composition. suffice to say, he did like it despite the fact that it was mostly adjacent to techno(particularly houseand hardcore), while most of the stylings being taught were mostly in the field of avantgarde. "
					  s"another particularly funny story about this track was how it even got onto this musicdisk: i first posted it in the music sharing channel of the commander x16 discords, which then caught the ears and eyes of crisps, who then asked me if he could use it for this musicdisk. "
					  s"this actually motivated me to finish it, though i hit one major roadblock when i couldn't optimize it enough to ensure no banking would be needed because the zsm format is an utter fucking joke. (no shit it's quite literally just vgm all over again) "
					  s"either way, i'm looking forward to doing more 2151 sound in the future, as this was definitely a fun experience. (except for crisps' ridiculous debugging time sink, but i can forgive that since it's his first time i think) = = - -";

const char Song2[] = s"- - = =  song name: - \"the gem infested terra-tory\" - artist: \"the-real-hedgehog-sonic\" - length: 1:35 - comment: crisps never fulfilled my wish for that fake game ost, so i did it myself. = = - - ";

const char Song3[] = s"- - = =  song name: - \"the radiant radioactive rockslide\" - artist: \"the-real-hedgehog-sonic\" - length: 1:36 - comment: the crystal dimension was so nice, you get to experience it twice! = = - - ";

const char Song4[] = s"- - = =  song name: - \"gobsmacked\" - artist: \"fade\" - length: 3:23 - comment: i bet you didn't think the warmth of vinyl could be replicated in anything digital, but here we are :3 = = - - ";

static bool paused = false;

static const sbyte sintab[256] = {
	0, 2, 4, 7, 9, 11, 13, 15, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 55, 57, 59, 60,
	62, 64, 65, 67, 68, 70, 71, 72, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 85, 86, 87, 87, 88, 88, 89, 89, 89, 90, 90, 90, 90,
	90, 90, 90, 90, 90, 89, 89, 89, 88, 88, 87, 87, 86, 85, 85, 84, 83, 82, 81, 80, 79, 78, 77, 76, 75, 74, 72, 71, 70, 68, 67, 65, 64,
	62, 60, 59, 57, 55, 54, 52, 50, 48, 46, 44, 42, 40, 38, 36, 34, 32, 30, 28, 26, 24, 22, 20, 18, 15, 13, 11, 9, 7, 4, 2,
	0, -2, -4, -7, -9, -11, -13, -15, -18, -20, -22, -24, -26, -28, -30, -32, -34, -36, -38, -40, -42, -44, -46, -48, -50, -52, -54, -55, -57, -59, -60,
	-62, -64, -65, -67, -68, -70, -71, -72, -74, -75, -76, -77, -78, -79, -80, -81, -82, -83, -84, -85, -85, -86, -87, -87, -88, -88, -89, -89, -89, -90, -90, -90, -90,
	-90, -90, -90, -90, -90, -89, -89, -89, -88, -88, -87, -87, -86, -85, -85, -84, -83, -82, -81, -80, -79, -78, -77, -76, -75, -74, -72, -71, -70, -68, -67, -65, -64,
	-62, -60, -59, -57, -55, -54, -52, -50, -48, -46, -44, -42, -40, -38, -36, -34, -32, -30, -28, -26, -24, -22, -20, -18, -15, -13, -11, -9, -7, -4, -2
};

bool Control(bool playing, char Input)	 {
	//Tune Playing
	if (Input == KEY_SPACE /*&& SelectedSong == LastSong*/)
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

int FrameCount = 0;
unsigned off1 = 0;
int p = 0;
int PalTimer = 0;
int PalIndex = 0;
bool ShimmerState = false;
unsigned Phase = 8;
unsigned Phase2 = 0;
unsigned Phase3 = 16;
char MaxSong = 4;
char LastSelectedSong = 255;
char SelectedSong = 0;
unsigned long VolAddr = 0;
unsigned long IndAddr = 0;
void SetUpSprites() {

	const unsigned long PauseAddr = VERA_SPRITES;
	const unsigned long VolumeIndAddr = VERA_SPRITES + ((sizeof(Pause) + 31) & ~31);
	const unsigned long ArrowAddr = VolumeIndAddr + ((sizeof(VolumeInd) + 31) & ~31);
	const unsigned long TowerBaseAddr = ArrowAddr + ((sizeof(Arrow) + 31) & ~31);
	const unsigned long MainEyeBackAddr = TowerBaseAddr + ((sizeof(TowerBase) + 31) & ~31);
	const unsigned long TowerTriAddr = MainEyeBackAddr + ((sizeof(MainEyeBack) + 31) & ~31);
	const unsigned long CharBoxAddr = TowerTriAddr + ((sizeof(EyeTri) + 31) & ~31);
	const unsigned long PupilAddr = CharBoxAddr + ((sizeof(CharBox) + 31) & ~31) + 64;
	const unsigned long WavyAddr = PupilAddr + ((sizeof(MainPupil) + 31) & ~31) + 64;
	const unsigned long HeadAddr = WavyAddr + ((sizeof(WavySprite) + 31) & ~31) + 64;
	const unsigned long PlayingAddr = HeadAddr + ((sizeof(WavyHead) + 31) & ~31) + 64;
	const unsigned long VERAAddr = PlayingAddr + ((sizeof(Playing) + 31) & ~31) + 64;
	const unsigned long YMAddr = VERAAddr + ((sizeof(VERASprite) + 31) & ~31) + 64;
	const unsigned long CrispyAddr = YMAddr + ((sizeof(YMSprite) + 31) & ~31) + 64;

	const unsigned long BGAddr = 0x0;
	const unsigned short BGMapAddr = 0x2000;
	const unsigned short TextAddr = 0x1B000;

	VolAddr = CrispyAddr;
	IndAddr = 0x13100;
	//Set up Background
	vera.ctrl = 0; // &= ~VERA_CTRL_DCSEL;
	//vera.dcvideo |= VERA_DCVIDEO_LAYER0 | VERA_DCVIDEO_LAYER1 | VERA_DCVIDEO_SPRITES;

	vera.dcvscale = 128;
	vera.dchscale = 128;

	// In this mode, a tile width and height is 8 pixels, so
	// Width: 640pixels / 8 = 80 tiles across = Need to set our width to 128
	// Height: 480pixels / 8 = 60 tiles down = Need to set our height to 64
	vera.l0config = VERA_LAYER_WIDTH_128 | VERA_LAYER_HEIGHT_64 | VERA_LAYER_DEPTH_4;

	vera.l1config = VERA_LAYER_WIDTH_128 | VERA_LAYER_HEIGHT_64 | VERA_LAYER_DEPTH_1 | VERA_LAYER_T256C;

	//vera.l1mapbase = 0x04;

	vera.l0tilebase = tileBaseConfig(0, BGAddr, 0, 0);

	vera.l0mapbase = memoryToMapMemoryAddress(0, BGMapAddr);

	vera.addrh = 1; //| (2 << 4);

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

	char bar1Range = 8;
	char bar2Range = 12;
	char bar3Range = 24;
	char BoxSize = 16;

	vera.addr = BGMapAddr;
	//Make BG
	S = 0;
	for (unsigned i = 0; i < 64; i++)
	{
		for (unsigned j = 0; j < 128; j++) {
			
			R = rand() % 49;
			if (i >= 1 && i <= BoxSize && j >= 1 && j <= BoxSize || i >= 1 && i <= BoxSize && j >= 78 - BoxSize && j <= 78)
			{
				if (i == 1 && j == 1 || i == 1 && j == 78 - BoxSize)
				{
					//TLCorner
					vera.data0 = 15;
				}
				else if (i == 1 && j < BoxSize || i == 1 && j > 78 - BoxSize && j < 78)
				{
					//T Bar
					vera.data0 = 16;
				}
				else if (i == 1 && j == BoxSize || i == 1 && j == 78)
				{
					//TRCorner
					vera.data0 = 17;
				}
				else if (i == BoxSize && j == 1 || i == BoxSize && j == 78 - BoxSize)
				{
					//BLCorner
					vera.data0 = 20;
				}
				else if (i == BoxSize && j < BoxSize || i == BoxSize && j > 78 - BoxSize && j < 78)
				{
					//B Bar
					vera.data0 = 21;
				}
				else if (i == BoxSize && j == BoxSize || i == BoxSize && j == 78)
				{
					//BRCorner
					vera.data0 = 22;
				}
				else if (j == 1 && i < BoxSize || j == 78 - BoxSize)
				{
					//LS BAR
					vera.data0 = 18;
				}
				else if (j == BoxSize && i < BoxSize || j == 78 && i < BoxSize && i > 1)
				{
					//LS BAR
					vera.data0 = 23;
				}
				else 
				{
					//Blank
					vera.data0 = 19;
				}
			}
			//Bottom UI 
			else if (i < 54 && i >= 44)
			{
				if (i == 44 || i == 52)
				{
					vera.data0 = 10;
				}
				else if (i == 45 || i == 53)
				{
					vera.data0 = 11;
				}
				else
				{
					vera.data0 = 4;
				}
			}
			else if (i >= 52)
			{
				vera.data0 = 9;
			}
			//Main Star BG
			else
			{
				if (R <= 44)
				{
					//Blank tiles
					if (j < bar1Range || j > 80 - bar1Range) {
						vera.data0 = 0;
					}
					else if (j < bar2Range || j > 80 - bar2Range) {
						vera.data0 = 1;
					}
					else if (j < bar3Range || j > 80 - bar3Range) {
						vera.data0 = 2;
					}
					else { 
						vera.data0 = 3;
					}
				}
				else if (R >= 45 && R <= 47)
				{
					//Starry tiles
					if (j < bar1Range || j > 80 - bar1Range) {
						vera.data0 = 5;
					}
					else if (j < bar2Range || j > 80 - bar2Range) {
						vera.data0 = 6;
					}
					else if (j < bar3Range || j > 80 - bar3Range) {
						vera.data0 = 7;
					}
					else {
						vera.data0 = 8;
					}
				}
				else
				{
					//Big stars
					if (j < bar1Range || j > 80 - bar1Range) {
						vera.data0 = 12;
					}
					else if (j < bar2Range || j > 80 - bar2Range) {
						vera.data0 = 13;
					}
					else if (j < bar3Range || j > 7802 - bar3Range) {
						vera.data0 = 14;
					}
					else {
						vera.data0 = 14;
					}
				}
			}
			R = 0;
			vera.data0 = 0;
		}
	}
	
	//Vera + YM graphics
	vram_putn(VERAAddr, VERASprite, sizeof(VERASprite));
	vram_putn(YMAddr, YMSprite, sizeof(YMSprite));

	vera_spr_set(0, VERAAddr >> 5, false, 2, 2, 3, 10);
	vera_spr_move(0, 104, 438);
	vera_spr_set(1, YMAddr >> 5, false, 2, 2, 3, 9);
	vera_spr_move(1, 640 - 144, 438);

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
		vera_spr_set(33 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 2);
		vera_spr_move(33 + i, 4 + i * 12 - 1024, 452);
	}
	for (unsigned i = 0; i < 8; i++)
	{
		vera_spr_set(41 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 2);
		vera_spr_move(41 + i, 620 - i * 12 - 1024, 440);
	}

	for (unsigned i = 0; i < 2; i++)
	{	
		for (unsigned j = 0; j < 2; j++)
		{
			vera_spr_set(49 + i, VolumeIndAddr >> 5, false, 0, 0, 3, 2);
			vera_spr_move(49 + i, 620 - i * 12, 440);
		}
	}

	//Eye
	vram_putn(PupilAddr, MainPupil, sizeof(MainPupil));
	vera_spr_set(51, PupilAddr >> 5, false, 1, 2, 3, 6);
	vera_spr_move(51, 320 - 64, 120);

	vram_putn(MainEyeBackAddr, MainEyeBack, sizeof(MainEyeBack));
	vera_spr_set(52, MainEyeBackAddr >> 5, false, 3, 2, 3, 5);
	vera_spr_move(52, 320 - 64, 120);

	vera_spr_set(53, TowerTriAddr >> 5, false, 3, 2, 7, 6);
	vera_spr_move(53, 320 - 64, 240-8);

	vera_spr_set(54, TowerTriAddr >> 5, false, 3, 2, 7, 6);
	vera_spr_move(54, 320, 240 - 8);
	vera_spr_flip(54, true, false);

	vera_spr_set(55, TowerTriAddr >> 5, false, 3, 2, 7, 6);
	vera_spr_move(55, 320- 64, 240 + 24);
	vera_spr_flip(55, false, true);
	
	vera_spr_set(56, TowerTriAddr >> 5, false, 3, 2, 7, 6);
	vera_spr_move(56, 320, 240 + 24);
	vera_spr_flip(56, true, true);


	vram_putn(TowerBaseAddr, TowerBase, sizeof(TowerBase));
	for (unsigned i = 0; i < 7; i++)
	{
		vera_spr_set(57 + i, TowerBaseAddr >> 5, false, 3, 3, 2, 5);
		vera_spr_move(57 + i, 320-32, i * 64 - 96);
	}

	vram_putn(HeadAddr, WavyHead, sizeof(WavyHead));
	vram_putn(WavyAddr, WavySprite, sizeof(WavySprite));
	char DragonSize = 24;
	for (char i = 0; i < DragonSize; i++)
	{
		vera_spr_set(79+i, WavyAddr >> 5, false, 1, 1, 2, 8);
		if (i == DragonSize-1)
		{
			vera_spr_set(79 + i, HeadAddr >> 5, false, 2, 2, 2, 8);
		}
	}
	
	vera_pal_putn(0, BGPal, sizeof(BGPal));
	vera_pal_putn(32, ButtonStageMax, sizeof(ButtonStageMax));
	vera_pal_putn(96, CharBoxPalette, sizeof(CharBoxPalette));
	vera_pal_putn(112, WavyPal, sizeof(WavyPal));
	vera_pal_putn(128, TextPal, sizeof(TextPal));
	vera_pal_putn(144, YMPal, sizeof(YMPal));
	vera_pal_putn(160, VERAPal, sizeof(VERAPal));
	vera_pal_putn(176, CoderPal, sizeof(CoderPal));

	vram_putn(TowerTriAddr, EyeTri, sizeof(EyeTri));

	LoadSprite("@0:/sprites/bin/CODERS.BIN,P,R",3,8,3, CrispyAddr, 8192);

	vera_spr_set(3, CrispyAddr >> 5, false, 3, 3, 7, 11);
	vera_spr_move(3, 8,8);
	vera_spr_set(4, (CrispyAddr+2048) >> 5, false, 3, 3, VSPRPRI_FRONT, 11);
	vera_spr_move(4, 72, 8);
	vera_spr_set(5, (CrispyAddr + 4096) >> 5, false, 3, 3, VSPRPRI_FRONT, 11);
	vera_spr_move(5, 8, 72);
	vera_spr_set(6, (CrispyAddr + 6144) >> 5, false, 3, 3, VSPRPRI_FRONT, 11);
	vera_spr_move(6, 72, 72);

	vera_spr_set(7, CrispyAddr >> 5, false, 3, 3, 7, 11);
	vera_spr_move(7, 640 - 136, 8);
	vera_spr_set(8, (CrispyAddr + 2048) >> 5, false, 3, 3, VSPRPRI_FRONT, 11);
	vera_spr_move(8, 640 -  72, 8);
	vera_spr_set(9, (CrispyAddr + 4096) >> 5, false, 3, 3, VSPRPRI_FRONT, 11);
	vera_spr_move(9, 640 - 136, 72);
	vera_spr_set(10, (CrispyAddr + 6144) >> 5, false, 3, 3, VSPRPRI_FRONT, 11);
	vera_spr_move(10, 640 - 72, 72);

	vera.dcvideo |= VERA_DCVIDEO_LAYER0 | VERA_DCVIDEO_LAYER1 | VERA_DCVIDEO_SPRITES;
}

void MoveSprites(int p, int p2, int p3) {
	const unsigned PupilInd = 51;
	const unsigned MainEyeBackInd = 52;

	vera_spr_move(PupilInd, 312, 180 + (sintab[p] >> 3));
	vera_spr_move(MainEyeBackInd, 288, 180 + (sintab[p2] >> 3));

	vera_spr_move(53, 320 - 64, 180 - 16 + (sintab[p3] >> 3));
	vera_spr_move(54, 320, 180 - 16 + (sintab[p3] >> 3));	 

	vera_spr_move(55, 320 - 64, 180 + 16 + (sintab[p3] >> 3));
	vera_spr_move(56, 320, 180 + 16 + (sintab[p3] >> 3));

	vera_spr_move(0, 104,	438 - (sintab[p3] >> 4));
	vera_spr_move(1, 640-144, 438 + (sintab[p3] >> 4));

	//Moves boxes
	for (char i = 0; i < 24; i++)
	{
		if (i == 23)
		{
			vera_spr_move(
				79 + i, (sintab[FrameCount + i * 12 % 256]) + FrameCount + i * 4 % 640,
				188 + (sintab[FrameCount - 64 + i * 5 % 256] >> 1) + (sintab[FrameCount - 32 + (i * 8) % 256] >> 4) + i * 3);
		}
		else
		{
			vera_spr_move(
				79 + i, (sintab[FrameCount + i * 12 % 256]) +
				FrameCount + (i * 4) % 640,
				196 + (sintab[FrameCount - 64 + i * 5 % 256] >> 1) + (sintab[FrameCount-32 + (i * 8) % 256] >> 4) + i * 3);
		}
	}
}

void PlayZSM(int TuneSelection, int LastSong) {
	vera.dcborder = 8;
	if (TuneSelection != LastSong || zsm_check())
	{
		switch (TuneSelection)
		{
		case 0:
			LoadSprite("@0:/sprites/bin/CODERS.BIN,P,R", 3, 8, 3, VolAddr, 8192);
			vera_pal_putn(176, CoderPal, sizeof(CoderPal));
			break;
		case 1:
			zsm_init("@0:zsmfiles/paperclip.zsm,P,R");
			LoadSprite("@0:/sprites/bin/KOLE.BIN,P,R", 3, 8, 3, VolAddr, 8192);
			vera_pal_putn(176, KolePal, sizeof(KolePal));
			break;
		case 2:
			zsm_init("@0:zsmfiles/CrystalDimension.zsm,P,R");
			LoadSprite("@0:/sprites/bin/REALHEDGEHOGSONIC.BIN,P,R", 3, 8, 3, VolAddr, 8192);
			vera_pal_putn(176, RealPal, sizeof(RealPal));
			break;
		case 3:
			zsm_init("@0:zsmfiles/CrystalDimensionP2.zsm,P,R");
			LoadSprite("@0:/sprites/bin/REALHEDGEHOGSONIC.BIN,P,R", 3, 8, 3, VolAddr, 8192);
			vera_pal_putn(176, RealPal, sizeof(RealPal));
			break;
		case 4:
			zsm_init("@0:zsmfiles/gsfinal.zsm,P,R");
			LoadSprite("@0:/sprites/bin/FLDE.BIN,P,R", 3, 8, 3, VolAddr, 8192);
			vera_pal_putn(176, FldePal, sizeof(FldePal));
			break;
		}
	}
}

void ResetChars() {
	vram_addr(VERA_TEXT_MODE);
	for (char i = 0; i < 128; i++) {
		//character
		vera.data0 = 0;
		//colour
		vera.data0 = 0;
	}
}

void UpdateVolume() {
	vera.dcborder = 33;
	//Vera Volume
	char VeraVolume = 0;
	char FMVolume = 0;
	for (char i = 0; i < 16; i++)
	{
		zsm_get_volumes(&VeraVolume, &FMVolume, i);
		vera_spr_image(25 + i, (IndAddr)+VeraVolume>>5+40);
	}
	//FM Volume
	for (char i = 0; i < 8; i++)
	{
		zsm_get_volumes(&VeraVolume, &FMVolume, i);
		vera_spr_image(41 + i, (IndAddr)+FMVolume>>5 + 40);
	}
}

int main() {
	unsigned ScrollerCount = 0;
	int SelectedSong = 0;

	bool Running = true;
	bool Playing = false;

	zsm_irq_init();

	ClearVERAScreen();

	SetUpSprites();

	vera.ctrl |= VERA_CTRL_DCSEL;
	vera.dchscale = 159;
	vera.ctrl &= ~VERA_CTRL_DCSEL;

	//sets scroller position
	vera.l1vscroll = 126;
	unsigned PalTime2 = 0;

	vram_addr(VERA_TEXT_MODE);
	vera.addrh = VERA_TEXT_MODE >> 16;

	vera.addrh |= 0b100000;

	char Input = 0;
	while (Running)
	{
		Input = getchx();
		vera.dcborder = 48;
		p++;
		PalTime2++;

		Phase++ % 256;
		Phase2++ % 256;
		Phase3++ % 256;
		MoveSprites(Phase, Phase2, Phase3);
		
		if (Playing == true)	
		{
			//vera_spr_set(22, FrameAddr1 >> 5, false, 1, 2, 3, 1);
			PlayZSM(SelectedSong, LastSelectedSong);
			LastSelectedSong = SelectedSong;

			PalTimer++;
		}
		else
		{
			//vera_spr_set(22, FrameAddr2 >> 5, false, 1, 2, 3, 1);
			PalTimer = 0;
		}

		if (PalTime2 > 2)
		{
			SetPaletteIndex(palette, 16, 6, 10);
			PalTime2 = 0;
		}

		if (PalTimer > 3)
		{
			PalIndex++;
			SetPaletteIndex(CharBoxPalette, 96, 0, 5);
			SetPaletteIndex(TowerPalF1, 80, 0, 16);
			PalTimer = 0;
		}

		vera.dcborder = 3;

		//Tune Selection
		if (Input == KEY_D && SelectedSong < MaxSong)
		{
			ResetChars();
			SelectedSong++;
			off1 = 0;
			ScrollerCount = 0;
			vera.l1hscroll = -640;
		}
		else if (Input == KEY_A && SelectedSong > 0)
		{
			ResetChars();
			SelectedSong--;
			off1 = 0;
			ScrollerCount = 0;
			vera.l1hscroll = -640;
		}

		Playing = Control(Playing, Input);

		vera.l1hscroll = ScrollerCount - 640;

		UpdateVolume();

		if (FrameCount % 8 == 1)	
		{
			vram_addr(VERA_TEXT_MODE + 2 * (off1 % 128));
			switch (SelectedSong)
			{
			case 0:
				if (TestText2[off1 % (sizeof(TestText2) - 1)] != 0x00)
				{
					//character
					vera.data0 = TestText2[off1 % (sizeof(TestText2) - 1)];
					//colour
					vera.data0 = (off1 % 16) + 128;
				}
				break;
			case 1:
				if (Song1[off1 % (sizeof(Song1) - 1)] != 0x00)
				{
					//character
					vera.data0 = Song1[off1 % (sizeof(Song1) - 1)];
					//colour
					vera.data0 = (off1 % 16) + 128;
				}
				break;
			case 2:
				if (Song2[off1 % (sizeof(Song2) - 1)] != 0x00)
				{
					//character
					vera.data0 = Song2[off1 % (sizeof(Song2) - 1)];
					//colour
					vera.data0 = (off1 % 16) + 128;
				}
				break;

			case 3:
				if (Song3[off1 % (sizeof(Song3) - 1)] != 0x00)
				{
					//character
					vera.data0 = Song3[off1 % (sizeof(Song3) - 1)];
					//colour
					vera.data0 = (off1 % 16) + 128;
				}
				break;
			case 4:
				if (Song4[off1 % (sizeof(Song3) - 1)] != 0x00)
				{
					//character
					vera.data0 = Song4[off1 % (sizeof(Song4) - 1)];
					//colour
					vera.data0 = (off1 % 16) + 128;
				}
				break;
			}
			off1++;
			SetPaletteIndex(TextPal, 128, 0, 16);
		}

		vera.dcborder = 1;
		int n = zsm_fill();
		vera.dcborder = 0;

		frame_wait();
		FrameCount++;
		ScrollerCount++;
	}

	return 0;
}
