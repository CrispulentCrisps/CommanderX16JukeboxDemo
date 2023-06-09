#include "ZSMPlayer.h"
#include <c64/kernalio.h>

char vera_fm_s_regs[256];
void frame_wait(void)
{
	while (vera.ien & 0x40);
	while (!(vera.ien & 0x40));
}
//Do later [like yo mama]
void YMWriteSYSRom(char index, char data)
{
	__asm {
		pha
		txa
		pha
		tya
		pha
		lda #$0a
		sta bank
		lda #$8a
		sta target
		lda #$c0
		sta target + 1
		lda data
		ldx index
		jsr 0xff6c
		target:
		nop
			nop
			bank :
		nop
			pla
			tay
			pla
			tax
			pla
	}
}


char vera_fm_gate[8];

void sfx_put(char index, char data)
{
	//YM Write
	while (sfx.data & 0x80);
	sfx.index = index;
	vera_fm_s_regs[index] = data;
	if (index == 0x08)
		vera_fm_gate[data & 0x07] = data;

	while (sfx.data & 0x80);
	sfx.data = data;
}
void delay(unsigned t)
{
	while (t--)
		frame_wait();
}

static unsigned zsm_pos, zsm_wpos;
static char zsm_delay;
static volatile bool zsm_playing = false, zsm_reading = false, zsm_finished = true;
static char zsm_buffer[1024];
static volatile bool zsm_paused = false;
static char vera_volumes[16];

#pragma align(zsm_buffer, 256)

void zsm_save_volume(void)
{
	for(char i=0; i<16; i++)
	{
		vera.addr = (i * 4 + 2) | 0xf9c0;
		vera.addrh = 0x01;
		vera_volumes[i] = vera.data0;
		vera.data0 = 0;
	}
}

void zsm_restore_volume(void)
{
	for(char i=0; i<16; i++)
	{
		vera.addr = (i * 4 + 2) | 0xf9c0;
		vera.addrh = 0x01;
		vera.data0 = vera_volumes[i];
	}	
}

void zsm_silence(void)
{
	for(char i=0; i<8; i++)
		sfx_put(0x08, i);
}

void zsm_play(void)
{
	if (zsm_paused)
		;
	else if (zsm_delay)
		zsm_delay--;
	else
	{
		char		vc = vera.ctrl;
		vera.ctrl &= 0xfe;
		unsigned	va = vera.addr;
		char 		vh = vera.addrh;

		for (;;)
		{
			char c = zsm_buffer[zsm_pos++ & 0x3ff];
			if (c < 0x40)
			{
				//Vera write
				vera.addr = (c & 0x3f) | 0xf9c0;
				vera.addrh = 0x01;
				vera.data0 = zsm_buffer[zsm_pos++ & 0x3ff];
			}
			else if (c == 0x40)
			{
				zsm_pos += zsm_buffer[zsm_pos & 0x3ff] & 0x3f;
			}
			else if (c < 0x80)
			{
				c &= 0x3f;
				for (char i = 0; i < c; i++)
				{
					sfx_put(zsm_buffer[(zsm_pos + 0) & 0x3ff], zsm_buffer[(zsm_pos + 1) & 0x3ff]);
					zsm_pos += 2;
				}
			}
			else if (c == 0x80)
			{
				zsm_finished = true;
				break;
			}
			else
			{
				zsm_delay = (c & 0x7f) - 1;
				break;
			}
		}

		vera.addr = va;
		vera.addrh = vh;
		vera.ctrl = vc;
	}
}

__interrupt void irq(void)
{
	if (zsm_playing && !zsm_finished)
		zsm_play();
}

static void* oirq;

__asm irqt
{
	jsr	irq
	jmp(oirq)
}

int zsm_fill(void)
{
	if (!zsm_reading)
		return -1;
	else if (zsm_wpos == zsm_pos + 1024)
		return 0;
	else if (krnio_chkin(2))
	{
		//Reading in from disc
		int n = 0;
		while (zsm_wpos != zsm_pos + 1024)
		{
			char ch = krnio_chrin();
			zsm_buffer[zsm_wpos++ & 0x3ff] = ch;
			n++;
			if (krnio_status())
			{
				zsm_reading = false;
				break;
			}
		}
		//Read from keyboard
		krnio_clrchn();

		if (!zsm_reading)
			krnio_close(2);

		return n;
	}
	else
		return -1;
}

bool zsm_check(void)
{
	return zsm_finished;
}

bool zsm_init(const char* fname)
{
	zsm_finished = true;

	if (zsm_reading)
	{
		krnio_close(2);
		zsm_reading = false;
	}

	zsm_silence();
	zsm_save_volume();

	zsm_pos = 0;
	zsm_wpos = 0;
	zsm_delay = 0;

	krnio_setnam(fname);	
	if (krnio_open(2, 8, 2))
	{	
		zsm_reading = true;
		zsm_fill();
		zsm_pos = 16;
		zsm_finished = false;

		return true;
	}
	else
		return false;
}

void zsm_irq_init(void)
{
	__asm
	{
		sei
	}

	oirq = *(void**)0x0314;
	*(void**)0x0314 = irqt;

	__asm
	{
		cli
	}
}

void zsm_irq_play(bool play)
{
	zsm_playing = play;
}


void zsm_pause(bool pause)
{
	if (pause && !zsm_paused)
	{
		zsm_paused = true;
		zsm_silence();
		zsm_save_volume();
	}
	else if (!pause && zsm_paused)
	{
		zsm_restore_volume();
		zsm_paused = false;
	}
}

static const char fm_cmask[8] = {
	0x40, 0x40, 0x40, 0x40,
	0x50, 0x70, 0x70, 0x78
};

void zsm_get_volumes(char* vera_v, char* fm_v, int id)
{
	vera.addr = (id * 4 + 2) | 0xf9c0;
	vera.addrh = 0x01;
	*vera_v = vera.data0;
	char g = vera_fm_gate[id & 7] & 0x78;
	if (g)
	{
		char con = vera_fm_s_regs[id + 0x20];
		if (g & con)
		{
			char v = vera_fm_s_regs[id + 0x78] & 0x7f;
			if (con & 0x10)
				v &= vera_fm_s_regs[id + 0x70] & 0x7f;

			if (v == 0x00)
				*fm_v = 2;
			else if (v <= 1)
				*fm_v = 3;
			else if (v <= 2)
				*fm_v = 4;
			else if (v <= 3)
				*fm_v = 5;
			else if (v <= 4)
				*fm_v = 6;
			else if (v <= 5)
				*fm_v = 7;
			else if (v <= 8)
				*fm_v = 8;
			else if (v <= 16)
				*fm_v = 9;
			else if (v <= 32)
				*fm_v = 10;
			else if (v <= 64)
				*fm_v = 11;
			else if (v < 0x7f)
				*fm_v = 12;
			else
				*fm_v = 13;
		}
	}
	else
		*fm_v = 0;

//	*fm_v = id; //(char)(0x7f - (vera_fm_s_regs[id + 0x78] & 0x7f)) << 1;
}