#include "ZSMPlayer.h"


void frame_wait(void)
{
	while (vera.ien & 0x40) ;
	while (!(vera.ien & 0x40)) ;
}

void sfx_put(char index, char data)
{
	while (sfx.data & 0x80);

	sfx.index = index;
	__asm {
		nop
		nop
		nop
		nop
	}
	sfx.data = data;
}

void delay(unsigned t)
{
	while (t--)
		frame_wait();
}

static const char * zsm_sound;
static unsigned zsm_pos;
static char zsm_delay;
static bool zsm_playing;

__interrupt void irq(void)
{
	vera.dcborder++;
	if (zsm_playing)
	{
		if (!zsm_play())
			zsm_init(sound);
	}
	vera.dcborder--;
}

static void *		oirq;

__asm irqt
{
	jsr	irq
	jmp (oirq)
}


void zsm_init(const char * sound)
{
	zsm_sound = sound;
	zsm_pos = 16;
	zsm_delay = 0;
}

void zsm_irq_init(void)
{
	__asm
	{
		sei
	}

	oirq = *(void **)0x0314;
   	*(void **)0x0314 = irqt;

	__asm
	{
		cli
	}
}

void zsm_irq_play(bool play)
{
	zsm_playing = play;
}


bool zsm_play(void)
{
	if (zsm_delay)
	{
		zsm_delay--;
		return true;
	}
	else
	{
		for (;;)
		{
			char c = zsm_sound[zsm_pos++];
			if (c < 0x40)
			{
				vera.ctrl &= 0xfe;
				vera.addr = (c & 0x3f) | 0xf9c0;
				vera.addrh = 0x01;
				vera.data0 = zsm_sound[zsm_pos++];
			}
			else if (c == 0x40)
			{
				zsm_pos += zsm_sound[zsm_pos] & 0x3f;
			}
			else if (c < 0x80)
			{
				c &= 0x3f;
				for (char i = 0; i < c; i++)
				{
					sfx_put(zsm_sound[zsm_pos + 0], zsm_sound[zsm_pos + 1]);
					zsm_pos += 2;
				}
			}
			else if (c == 0x80)
			{
				return false;
			}
			else
			{
				zsm_delay = (c & 0x7f) - 1;
				return true;
			}
		}
	}
}