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
void YMWriteSYSRom(char index, char data);
void sfx_put(char index, char data);
void interpret(const char sound[]);

bool zsm_init(const char* fname);

int zsm_fill(void);

bool zsm_check(void);

void zsm_irq_init(void);

void zsm_irq_play(bool play);

void zsm_pause(bool pause);

#pragma compile("ZSMPlayer.c");

#endif