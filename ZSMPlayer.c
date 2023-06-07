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

void sfx_put(char index, char data)
{
	//YM Write
	while (sfx.data & 0x80);
	sfx.index = index;
	__asm {
		nop
		nop
		nop
		nop
	}
	vera_fm_s_regs[index] = data;
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

void zsm_get_volumes(char* vera_v, char* fm_v, int id)
{
	vera.addr = (id * 4 + 2) | 0xf9c0;
	vera.addrh = 0x01;
	*vera_v = vera.data0;
	*fm_v = vera_fm_s_regs[id + 0x78];
}