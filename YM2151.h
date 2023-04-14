#ifndef YM2151_H 
#define YM2151_H

#include <c64/types.h>

struct YMInst
{

	byte	Feedback;
	byte	Algo;
	byte	LFO_Freq;
	byte	LFO_Amp;

	byte	op_1_A[2];
	byte	op_1_D[2];
	byte	op_1_S[2];
	byte	op_1_D2[2];
	byte	op_1_R[2];
	byte	op_1_TL[8];
	byte	op_1_RS;
	byte	op_1_ML[4];
	signed	op_1_DT;
	byte	op_1_DT2;
	bool	op_1_AM;
			
	byte	op_1_A[2];
	byte	op_2_D[2];
	byte	op_2_S[2];
	byte	op_2_D2[2];
	byte	op_2_R[2];
	byte	op_2_TL[8];
	byte	op_2_RS;
	byte	op_2_ML[4];
	signed	op_2_DT;
	byte	op_2_DT2;
	bool	op_2_AM;
			
	byte	op_3_A[2];
	byte	op_3_D[2];
	byte	op_3_S[2];
	byte	op_3_D2[2];
	byte	op_3_R[2];
	byte	op_3_TL[8];
	byte	op_3_RS;
	byte	op_3_ML[4];
	signed	op_3_DT;
	byte	op_3_DT2;
	bool	op_3_AM;
			
	byte	op_4_A[2];
	byte	op_4_D[2];
	byte	op_4_S[2];
	byte	op_4_D2[2];
	byte	op_4_R[2];
	byte	op_4_TL[8];
	byte	op_4_RS;
	byte	op_4_ML[4];
	signed	op_4_DT;
	byte	op_4_DT2;
	bool	op_4_AM;
};

#pragma compile("YM2151.c")

#endif