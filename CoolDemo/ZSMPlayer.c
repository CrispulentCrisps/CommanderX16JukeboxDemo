#include "ZSMPlayer.h"


void frame_wait(void)
{
	char c = vera.dcvideo;
	while ((c ^ vera.dcvideo) < 0x80)
		;
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
//I don't understand SHIT about this but I'll keep it around because it works
void interpret(const char sound[])
{
	unsigned p = 16;
	for (;;)
	{
		char c = sound[p++];
		if (c < 0x40)
		{
			vera.ctrl &= 0xfe;
			vera.addr = (c & 0x3f) | 0xf9c0;
			vera.addrh = 0x01;
			vera.data0 = sound[p++];
		}
		else if (c == 0x40)
		{
			p += sound[p] & 0x3f;
		}
		else if (c < 0x80)
		{
			c &= 0x3f;
			for (char i = 0; i < c; i++)
			{
				sfx_put(sound[p + 0], sound[p + 1]);
				p += 2;
			}
		}
		else if (c == 0x80)
		{
			return;
		}
		else
		{
			delay(c & 0x7f);
		}
	}
}