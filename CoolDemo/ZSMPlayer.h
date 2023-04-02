#ifndef ZSMPLAYER_H
#define ZSMPLAYER_H

#include "VERA.h"

struct SFX
{
	volatile byte		index;
	volatile byte		data;
};

#define sfx	(*(SFX*)0x9f40)

void frame_wait(void);
void sfx_put(char index, char data);
void interpret(const char sound[]);

#pragma compile("ZSMPlayer.c");

#endif