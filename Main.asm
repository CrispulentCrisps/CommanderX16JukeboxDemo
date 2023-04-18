--------------------------------------------------------------------
startup:
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e 5b 10 STX $105b ; (spentry + 0)
0811 : a9 cd __ LDA #$cd
0813 : 85 39 __ STA IP + 0 
0815 : a9 14 __ LDA #$14
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 18 __ LDA #$18
081c : e9 14 __ SBC #$14
081e : f0 0f __ BEQ $082f ; (startup + 46)
0820 : aa __ __ TAX
0821 : a9 00 __ LDA #$00
0823 : a0 00 __ LDY #$00
0825 : 91 39 __ STA (IP + 0),y 
0827 : c8 __ __ INY
0828 : d0 fb __ BNE $0825 ; (startup + 36)
082a : e6 3a __ INC IP + 1 
082c : ca __ __ DEX
082d : d0 f6 __ BNE $0825 ; (startup + 36)
082f : 38 __ __ SEC
0830 : a9 e5 __ LDA #$e5
0832 : e9 cd __ SBC #$cd
0834 : f0 08 __ BEQ $083e ; (startup + 61)
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 39 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839 ; (startup + 56)
083e : a2 f7 __ LDX #$f7
0840 : e0 f7 __ CPX #$f7
0842 : f0 07 __ BEQ $084b ; (startup + 74)
0844 : 95 00 __ STA $00,x 
0846 : e8 __ __ INX
0847 : e0 f7 __ CPX #$f7
0849 : d0 f9 __ BNE $0844 ; (startup + 67)
084b : a9 fa __ LDA #$fa
084d : 85 43 __ STA SP + 0 
084f : a9 9e __ LDA #$9e
0851 : 85 44 __ STA SP + 1 
0853 : 20 80 08 JSR $0880 ; (main.s0 + 0)
0856 : a9 4c __ LDA #$4c
0858 : 85 54 __ STA $54 
085a : a9 00 __ LDA #$00
085c : 85 13 __ STA $13 
085e : a9 19 __ LDA #$19
0860 : 85 16 __ STA $16 
0862 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
105b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 38 09 JSR $0938 ; (zsm_irq_init.s0 + 0)
0883 : 20 06 0b JSR $0b06 ; (ClearVERAScreen.s0 + 0)
0886 : 20 49 0b JSR $0b49 ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9e __ LDA #$9e
0893 : 8d 2a 9f STA $9f2a 
0896 : ad 25 9f LDA $9f25 
0899 : 29 fd __ AND #$fd
089b : 8d 25 9f STA $9f25 
089e : a9 21 __ LDA #$21
08a0 : 8d 22 9f STA $9f22 
08a3 : a9 00 __ LDA #$00
08a5 : 8d 20 9f STA $9f20 
08a8 : a9 b0 __ LDA #$b0
08aa : 8d 21 9f STA $9f21 
08ad : a9 73 __ LDA #$73
08af : 8d 39 9f STA $9f39 
08b2 : a9 00 __ LDA #$00
08b4 : 8d 3a 9f STA $9f3a 
08b7 : 85 4b __ STA T1 + 0 
.l2:
08b9 : a9 03 __ LDA #$03
08bb : 8d 2c 9f STA $9f2c 
08be : 20 a2 0d JSR $0da2 ; (zsm_check.s0 + 0)
08c1 : 09 00 __ ORA #$00
08c3 : f0 0b __ BEQ $08d0 ; (main.s6 + 0)
.s4:
08c5 : a9 13 __ LDA #$13
08c7 : 85 30 __ STA P3 
08c9 : a9 0f __ LDA #$0f
08cb : 85 31 __ STA P4 
08cd : 20 a6 0d JSR $0da6 ; (zsm_init.s0 + 0)
.s6:
08d0 : a5 4b __ LDA T1 + 0 
08d2 : 85 2e __ STA P1 
08d4 : 20 31 0f JSR $0f31 ; (Control.s0 + 0)
08d7 : a5 3b __ LDA ACCU + 0 
08d9 : 85 4b __ STA T1 + 0 
08db : ad a0 14 LDA $14a0 ; (FrameCount + 0)
08de : 85 48 __ STA T3 + 0 
08e0 : 85 3b __ STA ACCU + 0 
08e2 : ad a1 14 LDA $14a1 ; (FrameCount + 1)
08e5 : 85 3c __ STA ACCU + 1 
08e7 : a9 04 __ LDA #$04
08e9 : 85 23 __ STA WORK + 0 
08eb : a9 00 __ LDA #$00
08ed : 85 24 __ STA WORK + 1 
08ef : 20 32 10 JSR $1032 ; (mods16 + 0)
08f2 : a5 26 __ LDA WORK + 3 
08f4 : d0 16 __ BNE $090c ; (main.s9 + 0)
.s1002:
08f6 : a5 25 __ LDA WORK + 2 
08f8 : c9 01 __ CMP #$01
08fa : d0 10 __ BNE $090c ; (main.s9 + 0)
.s7:
08fc : ae e4 18 LDX $18e4 ; (off1 + 0)
08ff : e8 __ __ INX
0900 : 8e e4 18 STX $18e4 ; (off1 + 0)
0903 : bd a1 14 LDA $14a1,x ; (FrameCount + 1)
0906 : 38 __ __ SEC
0907 : e9 40 __ SBC #$40
0909 : 8d 23 9f STA $9f23 
.s9:
090c : 06 48 __ ASL T3 + 0 
090e : ad a1 14 LDA $14a1 ; (FrameCount + 1)
0911 : 2a __ __ ROL
0912 : 18 __ __ CLC
0913 : 69 ff __ ADC #$ff
0915 : 8d 38 9f STA $9f38 
0918 : a5 48 __ LDA T3 + 0 
091a : 8d 37 9f STA $9f37 
091d : a9 01 __ LDA #$01
091f : 8d 2c 9f STA $9f2c 
0922 : 20 45 0e JSR $0e45 ; (zsm_fill.s0 + 0)
0925 : a9 00 __ LDA #$00
0927 : 8d 2c 9f STA $9f2c 
092a : 20 82 0f JSR $0f82 ; (frame_wait.l1 + 0)
092d : ee a0 14 INC $14a0 ; (FrameCount + 0)
0930 : d0 87 __ BNE $08b9 ; (main.l2 + 0)
.s1003:
0932 : ee a1 14 INC $14a1 ; (FrameCount + 1)
0935 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0938 : 78 __ __ SEI
0939 : ad 14 03 LDA $0314 
093c : 8d cd 14 STA $14cd ; (oirq + 0)
093f : ad 15 03 LDA $0315 
0942 : 8d ce 14 STA $14ce ; (oirq + 1)
0945 : a9 51 __ LDA #$51
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : 58 __ __ CLI
.s1001:
0950 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
14cd : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0951 : 20 57 09 JSR $0957 ; (irq.s1000 + 0)
0954 : 6c cd 14 JMP ($14cd)
--------------------------------------------------------------------
irq:
.s1000:
0957 : a5 2d __ LDA P0 
0959 : 48 __ __ PHA
095a : a5 2e __ LDA P1 
095c : 48 __ __ PHA
095d : a5 3b __ LDA ACCU + 0 
095f : 48 __ __ PHA
0960 : a5 3c __ LDA ACCU + 1 
0962 : 48 __ __ PHA
0963 : a5 47 __ LDA T0 + 0 
0965 : 48 __ __ PHA
0966 : a5 48 __ LDA $48 
0968 : 48 __ __ PHA
0969 : a5 49 __ LDA $49 
096b : 48 __ __ PHA
096c : a5 4a __ LDA $4a 
096e : 48 __ __ PHA
096f : a5 4b __ LDA $4b 
0971 : 48 __ __ PHA
0972 : a5 4c __ LDA $4c 
0974 : 48 __ __ PHA
0975 : a5 4d __ LDA $4d 
0977 : 48 __ __ PHA
0978 : a5 4e __ LDA $4e 
097a : 48 __ __ PHA
097b : a5 4f __ LDA $4f 
097d : 48 __ __ PHA
097e : a5 50 __ LDA $50 
0980 : 48 __ __ PHA
.s0:
0981 : ad 5c 10 LDA $105c ; (zsm_playing + 0)
0984 : f0 08 __ BEQ $098e ; (irq.s1001 + 0)
.s4:
0986 : ad 5d 10 LDA $105d ; (zsm_finished + 0)
0989 : d0 03 __ BNE $098e ; (irq.s1001 + 0)
.s1:
098b : 20 b9 09 JSR $09b9 ; (zsm_play.s0 + 0)
.s1001:
098e : 68 __ __ PLA
098f : 85 50 __ STA $50 
0991 : 68 __ __ PLA
0992 : 85 4f __ STA $4f 
0994 : 68 __ __ PLA
0995 : 85 4e __ STA $4e 
0997 : 68 __ __ PLA
0998 : 85 4d __ STA $4d 
099a : 68 __ __ PLA
099b : 85 4c __ STA $4c 
099d : 68 __ __ PLA
099e : 85 4b __ STA $4b 
09a0 : 68 __ __ PLA
09a1 : 85 4a __ STA $4a 
09a3 : 68 __ __ PLA
09a4 : 85 49 __ STA $49 
09a6 : 68 __ __ PLA
09a7 : 85 48 __ STA $48 
09a9 : 68 __ __ PLA
09aa : 85 47 __ STA T0 + 0 
09ac : 68 __ __ PLA
09ad : 85 3c __ STA ACCU + 1 
09af : 68 __ __ PLA
09b0 : 85 3b __ STA ACCU + 0 
09b2 : 68 __ __ PLA
09b3 : 85 2e __ STA P1 
09b5 : 68 __ __ PLA
09b6 : 85 2d __ STA P0 
09b8 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
105c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
105d : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b9 : ad cf 14 LDA $14cf ; (zsm_delay + 0)
09bc : f0 03 __ BEQ $09c1 ; (zsm_play.s2 + 0)
09be : 4c ee 0a JMP $0aee ; (zsm_play.s1 + 0)
.s2:
09c1 : ad 25 9f LDA $9f25 
09c4 : 85 47 __ STA T0 + 0 
09c6 : ad 25 9f LDA $9f25 
09c9 : 29 fe __ AND #$fe
09cb : 8d 25 9f STA $9f25 
09ce : ad 20 9f LDA $9f20 
09d1 : 85 49 __ STA T2 + 0 
09d3 : ad 21 9f LDA $9f21 
09d6 : 85 4a __ STA T2 + 1 
09d8 : ad 22 9f LDA $9f22 
09db : 85 48 __ STA T1 + 0 
.l5:
09dd : ad d0 18 LDA $18d0 ; (zsm_pos + 0)
09e0 : 85 4b __ STA T3 + 0 
09e2 : 18 __ __ CLC
09e3 : 69 01 __ ADC #$01
09e5 : 85 4d __ STA T4 + 0 
09e7 : 8d d0 18 STA $18d0 ; (zsm_pos + 0)
09ea : ad d1 18 LDA $18d1 ; (zsm_pos + 1)
09ed : aa __ __ TAX
09ee : 69 00 __ ADC #$00
09f0 : 85 4e __ STA T4 + 1 
09f2 : 8d d1 18 STA $18d1 ; (zsm_pos + 1)
09f5 : 18 __ __ CLC
09f6 : a9 d0 __ LDA #$d0
09f8 : 65 4b __ ADC T3 + 0 
09fa : 85 3b __ STA ACCU + 0 
09fc : 8a __ __ TXA
09fd : 29 03 __ AND #$03
09ff : 69 14 __ ADC #$14
0a01 : 85 3c __ STA ACCU + 1 
0a03 : a0 00 __ LDY #$00
0a05 : b1 3b __ LDA (ACCU + 0),y 
0a07 : c9 40 __ CMP #$40
0a09 : b0 03 __ BCS $0a0e ; (zsm_play.s9 + 0)
0a0b : 4c b9 0a JMP $0ab9 ; (zsm_play.s8 + 0)
.s9:
0a0e : d0 22 __ BNE $0a32 ; (zsm_play.s12 + 0)
.s11:
0a10 : 18 __ __ CLC
0a11 : a9 d0 __ LDA #$d0
0a13 : 65 4d __ ADC T4 + 0 
0a15 : 85 4b __ STA T3 + 0 
0a17 : a5 4e __ LDA T4 + 1 
0a19 : 29 03 __ AND #$03
0a1b : 69 14 __ ADC #$14
0a1d : 85 4c __ STA T3 + 1 
0a1f : b1 4b __ LDA (T3 + 0),y 
0a21 : 29 3f __ AND #$3f
0a23 : 18 __ __ CLC
0a24 : 65 4d __ ADC T4 + 0 
0a26 : 8d d0 18 STA $18d0 ; (zsm_pos + 0)
0a29 : 98 __ __ TYA
0a2a : 65 4e __ ADC T4 + 1 
0a2c : 8d d1 18 STA $18d1 ; (zsm_pos + 1)
0a2f : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s12:
0a32 : 09 00 __ ORA #$00
0a34 : 30 5b __ BMI $0a91 ; (zsm_play.s15 + 0)
.s14:
0a36 : 29 3f __ AND #$3f
0a38 : f0 a3 __ BEQ $09dd ; (zsm_play.l5 + 0)
.s26:
0a3a : 84 50 __ STY T7 + 0 
0a3c : 85 4f __ STA T6 + 0 
0a3e : 18 __ __ CLC
.l1012:
0a3f : a9 d0 __ LDA #$d0
0a41 : 6d d0 18 ADC $18d0 ; (zsm_pos + 0)
0a44 : 85 4d __ STA T4 + 0 
0a46 : ad d1 18 LDA $18d1 ; (zsm_pos + 1)
0a49 : 29 03 __ AND #$03
0a4b : 69 14 __ ADC #$14
0a4d : 85 4e __ STA T4 + 1 
0a4f : a0 00 __ LDY #$00
0a51 : b1 4d __ LDA (T4 + 0),y 
0a53 : 85 2d __ STA P0 
0a55 : ad d0 18 LDA $18d0 ; (zsm_pos + 0)
0a58 : 18 __ __ CLC
0a59 : 69 01 __ ADC #$01
0a5b : aa __ __ TAX
0a5c : ad d1 18 LDA $18d1 ; (zsm_pos + 1)
0a5f : 69 00 __ ADC #$00
0a61 : 29 03 __ AND #$03
0a63 : 85 4c __ STA T3 + 1 
0a65 : 8a __ __ TXA
0a66 : 18 __ __ CLC
0a67 : 69 d0 __ ADC #$d0
0a69 : 85 4b __ STA T3 + 0 
0a6b : a9 14 __ LDA #$14
0a6d : 65 4c __ ADC T3 + 1 
0a6f : 85 4c __ STA T3 + 1 
0a71 : b1 4b __ LDA (T3 + 0),y 
0a73 : 85 2e __ STA P1 
0a75 : 20 f2 0a JSR $0af2 ; (sfx_put.l1 + 0)
0a78 : ad d0 18 LDA $18d0 ; (zsm_pos + 0)
0a7b : 18 __ __ CLC
0a7c : 69 02 __ ADC #$02
0a7e : 8d d0 18 STA $18d0 ; (zsm_pos + 0)
0a81 : 90 03 __ BCC $0a86 ; (zsm_play.s1015 + 0)
.s1014:
0a83 : ee d1 18 INC $18d1 ; (zsm_pos + 1)
.s1015:
0a86 : e6 50 __ INC T7 + 0 
0a88 : a5 50 __ LDA T7 + 0 
0a8a : c5 4f __ CMP T6 + 0 
0a8c : 90 b1 __ BCC $0a3f ; (zsm_play.l1012 + 0)
0a8e : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s15:
0a91 : c9 80 __ CMP #$80
0a93 : d0 07 __ BNE $0a9c ; (zsm_play.s22 + 0)
.s21:
0a95 : a9 01 __ LDA #$01
0a97 : 8d 5d 10 STA $105d ; (zsm_finished + 0)
0a9a : d0 08 __ BNE $0aa4 ; (zsm_play.s7 + 0)
.s22:
0a9c : 29 7f __ AND #$7f
0a9e : 38 __ __ SEC
0a9f : e9 01 __ SBC #$01
0aa1 : 8d cf 14 STA $14cf ; (zsm_delay + 0)
.s7:
0aa4 : a5 49 __ LDA T2 + 0 
0aa6 : 8d 20 9f STA $9f20 
0aa9 : a5 4a __ LDA T2 + 1 
0aab : 8d 21 9f STA $9f21 
0aae : a5 48 __ LDA T1 + 0 
0ab0 : 8d 22 9f STA $9f22 
0ab3 : a5 47 __ LDA T0 + 0 
0ab5 : 8d 25 9f STA $9f25 
.s1001:
0ab8 : 60 __ __ RTS
.s8:
0ab9 : 29 3f __ AND #$3f
0abb : 09 c0 __ ORA #$c0
0abd : 8d 20 9f STA $9f20 
0ac0 : a9 f9 __ LDA #$f9
0ac2 : 8d 21 9f STA $9f21 
0ac5 : a9 01 __ LDA #$01
0ac7 : 8d 22 9f STA $9f22 
0aca : a5 4b __ LDA T3 + 0 
0acc : 69 02 __ ADC #$02
0ace : 8d d0 18 STA $18d0 ; (zsm_pos + 0)
0ad1 : 90 01 __ BCC $0ad4 ; (zsm_play.s1017 + 0)
.s1016:
0ad3 : e8 __ __ INX
.s1017:
0ad4 : 8e d1 18 STX $18d1 ; (zsm_pos + 1)
0ad7 : 18 __ __ CLC
0ad8 : a9 d0 __ LDA #$d0
0ada : 65 4d __ ADC T4 + 0 
0adc : 85 4b __ STA T3 + 0 
0ade : a5 4e __ LDA T4 + 1 
0ae0 : 29 03 __ AND #$03
0ae2 : 69 14 __ ADC #$14
0ae4 : 85 4c __ STA T3 + 1 
0ae6 : b1 4b __ LDA (T3 + 0),y 
0ae8 : 8d 23 9f STA $9f23 
0aeb : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s1:
0aee : ce cf 14 DEC $14cf ; (zsm_delay + 0)
0af1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
14cf : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
14d0 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
18d0 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0af2 : ad 41 9f LDA $9f41 
0af5 : 30 fb __ BMI $0af2 ; (sfx_put.l1 + 0)
.s3:
0af7 : a5 2d __ LDA P0 ; (index + 0)
0af9 : 8d 40 9f STA $9f40 
0afc : ea __ __ NOP
0afd : ea __ __ NOP
0afe : ea __ __ NOP
0aff : ea __ __ NOP
0b00 : a5 2e __ LDA P1 ; (data + 0)
0b02 : 8d 41 9f STA $9f41 
.s1001:
0b05 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0b06 : a9 93 __ LDA #$93
0b08 : 85 2d __ STA P0 
0b0a : a9 00 __ LDA #$00
0b0c : 85 2e __ STA P1 
0b0e : 20 43 0b JSR $0b43 ; (putch.s0 + 0)
0b11 : a9 11 __ LDA #$11
0b13 : 8d 22 9f STA $9f22 
0b16 : a2 00 __ LDX #$00
.l2:
0b18 : 8a __ __ TXA
0b19 : 18 __ __ CLC
0b1a : 69 b0 __ ADC #$b0
0b1c : 8d 21 9f STA $9f21 
0b1f : a9 00 __ LDA #$00
0b21 : 8d 20 9f STA $9f20 
0b24 : a0 50 __ LDY #$50
.l1003:
0b26 : a9 20 __ LDA #$20
0b28 : 8d 23 9f STA $9f23 
0b2b : a9 01 __ LDA #$01
0b2d : 8d 23 9f STA $9f23 
0b30 : a9 20 __ LDA #$20
0b32 : 8d 24 9f STA $9f24 
0b35 : a9 01 __ LDA #$01
0b37 : 8d 24 9f STA $9f24 
0b3a : 88 __ __ DEY
0b3b : d0 e9 __ BNE $0b26 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0b3d : e8 __ __ INX
0b3e : e0 3c __ CPX #$3c
0b40 : 90 d6 __ BCC $0b18 ; (ClearVERAScreen.l2 + 0)
.s1001:
0b42 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0b43 : a5 2d __ LDA P0 
0b45 : 20 d2 ff JSR $ffd2 
.s1001:
0b48 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0b49 : ad 25 9f LDA $9f25 
0b4c : 29 fd __ AND #$fd
0b4e : 8d 25 9f STA $9f25 
0b51 : ad 29 9f LDA $9f29 
0b54 : 09 70 __ ORA #$70
0b56 : 8d 29 9f STA $9f29 
0b59 : a9 80 __ LDA #$80
0b5b : 8d 2b 9f STA $9f2b 
0b5e : 8d 2a 9f STA $9f2a 
0b61 : a9 11 __ LDA #$11
0b63 : 8d 2d 9f STA $9f2d 
0b66 : a2 00 __ LDX #$00
0b68 : 8e 2f 9f STX $9f2f 
0b6b : 8e 2e 9f STX $9f2e 
.l2:
0b6e : e0 1f __ CPX #$1f
0b70 : a0 3c __ LDY #$3c
0b72 : 90 03 __ BCC $0b77 ; (SetUpSprites.l9 + 0)
0b74 : 4c 9f 0c JMP $0c9f ; (SetUpSprites.s29 + 0)
.l9:
0b77 : ee 2f 9f INC $9f2f 
0b7a : 88 __ __ DEY
0b7b : d0 fa __ BNE $0b77 ; (SetUpSprites.l9 + 0)
.s135:
0b7d : e8 __ __ INX
0b7e : e0 50 __ CPX #$50
0b80 : 90 ec __ BCC $0b6e ; (SetUpSprites.l2 + 0)
.s4:
0b82 : a9 20 __ LDA #$20
0b84 : 85 37 __ STA P10 
0b86 : 8d fc 9e STA $9efc ; (sstack + 0)
0b89 : a9 fb __ LDA #$fb
0b8b : 8d fd 9e STA $9efd ; (sstack + 1)
0b8e : a9 01 __ LDA #$01
0b90 : 8d fe 9e STA $9efe ; (sstack + 2)
0b93 : a9 00 __ LDA #$00
0b95 : 8d ff 9e STA $9eff ; (sstack + 3)
0b98 : a9 5e __ LDA #$5e
0b9a : 85 35 __ STA P8 
0b9c : a9 10 __ LDA #$10
0b9e : 85 36 __ STA P9 
0ba0 : 20 aa 0c JSR $0caa ; (SetPaletteColours.s0 + 0)
0ba3 : a9 00 __ LDA #$00
0ba5 : 85 2d __ STA P0 
0ba7 : 85 30 __ STA P3 
0ba9 : 85 33 __ STA P6 
0bab : a9 32 __ LDA #$32
0bad : 85 2e __ STA P1 
0baf : a9 01 __ LDA #$01
0bb1 : 85 2f __ STA P2 
0bb3 : a9 02 __ LDA #$02
0bb5 : 85 34 __ STA P7 
0bb7 : a9 7e __ LDA #$7e
0bb9 : 85 31 __ STA P4 
0bbb : a9 10 __ LDA #$10
0bbd : 85 32 __ STA P5 
0bbf : 20 d1 0c JSR $0cd1 ; (vram_putn.s0 + 0)
0bc2 : a9 30 __ LDA #$30
0bc4 : 85 2e __ STA P1 
0bc6 : a9 02 __ LDA #$02
0bc8 : 85 34 __ STA P7 
0bca : a9 7e __ LDA #$7e
0bcc : 85 31 __ STA P4 
0bce : a9 12 __ LDA #$12
0bd0 : 85 32 __ STA P5 
0bd2 : 20 d1 0c JSR $0cd1 ; (vram_putn.s0 + 0)
0bd5 : a9 17 __ LDA #$17
0bd7 : 85 2d __ STA P0 
0bd9 : a9 80 __ LDA #$80
0bdb : 85 2e __ STA P1 
0bdd : a9 09 __ LDA #$09
0bdf : 85 2f __ STA P2 
0be1 : a9 02 __ LDA #$02
0be3 : 85 31 __ STA P4 
0be5 : 85 32 __ STA P5 
0be7 : a9 03 __ LDA #$03
0be9 : 85 33 __ STA P6 
0beb : a9 01 __ LDA #$01
0bed : 85 34 __ STA P7 
0bef : 20 0c 0d JSR $0d0c ; (vera_spr_set.s0 + 0)
0bf2 : a9 1a __ LDA #$1a
0bf4 : 85 2e __ STA P1 
0bf6 : a9 01 __ LDA #$01
0bf8 : 85 2f __ STA P2 
0bfa : 85 31 __ STA P4 
0bfc : a9 b8 __ LDA #$b8
0bfe : 85 30 __ STA P3 
0c00 : 20 69 0d JSR $0d69 ; (vera_spr_move.s0 + 0)
0c03 : a9 00 __ LDA #$00
0c05 : 85 49 __ STA T4 + 0 
0c07 : 85 4a __ STA T4 + 1 
.l33:
0c09 : 85 2d __ STA P0 
0c0b : 18 __ __ CLC
0c0c : 69 02 __ ADC #$02
0c0e : 85 47 __ STA T3 + 0 
0c10 : a9 00 __ LDA #$00
0c12 : 2a __ __ ROL
0c13 : 85 48 __ STA T3 + 1 
0c15 : a9 90 __ LDA #$90
0c17 : 85 2e __ STA P1 
0c19 : a9 09 __ LDA #$09
0c1b : 85 2f __ STA P2 
0c1d : a9 00 __ LDA #$00
0c1f : 85 30 __ STA P3 
0c21 : a9 03 __ LDA #$03
0c23 : 85 31 __ STA P4 
0c25 : a9 01 __ LDA #$01
0c27 : 85 32 __ STA P5 
0c29 : 20 0c 0d JSR $0d0c ; (vera_spr_set.s0 + 0)
0c2c : a5 49 __ LDA T4 + 0 
0c2e : 85 2e __ STA P1 
0c30 : a5 4a __ LDA T4 + 1 
0c32 : 85 2f __ STA P2 
0c34 : a9 a0 __ LDA #$a0
0c36 : 85 30 __ STA P3 
0c38 : a9 01 __ LDA #$01
0c3a : 85 31 __ STA P4 
0c3c : 20 69 0d JSR $0d69 ; (vera_spr_move.s0 + 0)
0c3f : a9 90 __ LDA #$90
0c41 : 85 2e __ STA P1 
0c43 : a9 09 __ LDA #$09
0c45 : 85 2f __ STA P2 
0c47 : a9 00 __ LDA #$00
0c49 : 85 30 __ STA P3 
0c4b : a9 03 __ LDA #$03
0c4d : 85 31 __ STA P4 
0c4f : e6 2d __ INC P0 
0c51 : 20 0c 0d JSR $0d0c ; (vera_spr_set.s0 + 0)
0c54 : a5 49 __ LDA T4 + 0 
0c56 : 85 2e __ STA P1 
0c58 : a5 4a __ LDA T4 + 1 
0c5a : 85 2f __ STA P2 
0c5c : a9 70 __ LDA #$70
0c5e : 85 30 __ STA P3 
0c60 : a9 01 __ LDA #$01
0c62 : 85 31 __ STA P4 
0c64 : 20 69 0d JSR $0d69 ; (vera_spr_move.s0 + 0)
0c67 : a5 48 __ LDA T3 + 1 
0c69 : d0 13 __ BNE $0c7e ; (SetUpSprites.s35 + 0)
.s1004:
0c6b : 18 __ __ CLC
0c6c : a5 2e __ LDA P1 
0c6e : 69 40 __ ADC #$40
0c70 : 85 49 __ STA T4 + 0 
0c72 : a5 2f __ LDA P2 
0c74 : 69 00 __ ADC #$00
0c76 : 85 4a __ STA T4 + 1 
0c78 : a5 47 __ LDA T3 + 0 
0c7a : c9 16 __ CMP #$16
0c7c : 90 8b __ BCC $0c09 ; (SetUpSprites.l33 + 0)
.s35:
0c7e : a9 20 __ LDA #$20
0c80 : 85 37 __ STA P10 
0c82 : 8d fc 9e STA $9efc ; (sstack + 0)
0c85 : a9 fa __ LDA #$fa
0c87 : 8d fd 9e STA $9efd ; (sstack + 1)
0c8a : a9 01 __ LDA #$01
0c8c : 8d fe 9e STA $9efe ; (sstack + 2)
0c8f : a9 00 __ LDA #$00
0c91 : 8d ff 9e STA $9eff ; (sstack + 3)
0c94 : a9 7e __ LDA #$7e
0c96 : 85 35 __ STA P8 
0c98 : a9 14 __ LDA #$14
0c9a : 85 36 __ STA P9 
0c9c : 4c aa 0c JMP $0caa ; (SetPaletteColours.s0 + 0)
.s29:
0c9f : a9 04 __ LDA #$04
.l1008:
0ca1 : 8d 2f 9f STA $9f2f 
0ca4 : 88 __ __ DEY
0ca5 : d0 fa __ BNE $0ca1 ; (SetUpSprites.l1008 + 0)
0ca7 : 4c 7d 0b JMP $0b7d ; (SetUpSprites.s135 + 0)
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0caa : ad fc 9e LDA $9efc ; (sstack + 0)
0cad : 85 2d __ STA P0 
0caf : ad fd 9e LDA $9efd ; (sstack + 1)
0cb2 : 85 2e __ STA P1 
0cb4 : ad fe 9e LDA $9efe ; (sstack + 2)
0cb7 : 85 2f __ STA P2 
0cb9 : ad ff 9e LDA $9eff ; (sstack + 3)
0cbc : 85 30 __ STA P3 
0cbe : a5 35 __ LDA P8 ; (input + 0)
0cc0 : 85 31 __ STA P4 
0cc2 : a5 36 __ LDA P9 ; (input + 1)
0cc4 : 85 32 __ STA P5 
0cc6 : a5 37 __ LDA P10 ; (inputsize + 0)
0cc8 : 85 33 __ STA P6 
0cca : a9 00 __ LDA #$00
0ccc : 85 34 __ STA P7 
0cce : 4c d1 0c JMP $0cd1 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0cd1 : ad 25 9f LDA $9f25 
0cd4 : 29 fe __ AND #$fe
0cd6 : 8d 25 9f STA $9f25 
0cd9 : a5 2d __ LDA P0 ; (addr + 0)
0cdb : 8d 20 9f STA $9f20 
0cde : a5 2e __ LDA P1 ; (addr + 1)
0ce0 : 8d 21 9f STA $9f21 
0ce3 : a5 2f __ LDA P2 ; (addr + 2)
0ce5 : 29 01 __ AND #$01
0ce7 : 09 10 __ ORA #$10
0ce9 : 8d 22 9f STA $9f22 
0cec : a5 33 __ LDA P6 ; (size + 0)
0cee : 05 34 __ ORA P7 ; (size + 1)
0cf0 : f0 19 __ BEQ $0d0b ; (vram_putn.s1001 + 0)
.s6:
0cf2 : a0 00 __ LDY #$00
0cf4 : a6 33 __ LDX P6 ; (size + 0)
0cf6 : f0 02 __ BEQ $0cfa ; (vram_putn.l1002 + 0)
.s1005:
0cf8 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0cfa : b1 31 __ LDA (P4),y ; (data + 0)
0cfc : 8d 23 9f STA $9f23 
0cff : c8 __ __ INY
0d00 : d0 02 __ BNE $0d04 ; (vram_putn.s1009 + 0)
.s1008:
0d02 : e6 32 __ INC P5 ; (data + 1)
.s1009:
0d04 : ca __ __ DEX
0d05 : d0 f3 __ BNE $0cfa ; (vram_putn.l1002 + 0)
.s1004:
0d07 : c6 34 __ DEC P7 ; (size + 1)
0d09 : d0 ef __ BNE $0cfa ; (vram_putn.l1002 + 0)
.s1001:
0d0b : 60 __ __ RTS
--------------------------------------------------------------------
BGPal:
105e : __ __ __ BYT 00 00 88 02 44 0c 11 ee aa 0a 88 08 66 06 44 04 : ....D.......f.D.
106e : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
ScrollerOutline:
107e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
108e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
109e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10ae : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10be : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
10ce : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
10de : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
10ee : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
10fe : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
110e : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
111e : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
112e : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
113e : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
114e : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
115e : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
116e : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
117e : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
118e : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
119e : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
11ae : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
11be : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
11ce : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
11de : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
11ee : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
11fe : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
120e : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
121e : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
122e : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
123e : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
124e : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
125e : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
126e : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
127e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
128e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
129e : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
12ae : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
12be : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
12ce : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
12de : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
12ee : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
12fe : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
130e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
131e : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
132e : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
133e : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
134e : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
135e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
136e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
137e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
138e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
139e : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13ae : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13be : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13ce : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13de : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13ee : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13fe : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
140e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
141e : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
142e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
143e : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
144e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
145e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
146e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_set:
.s0:
0d0c : ad 25 9f LDA $9f25 
0d0f : 29 fe __ AND #$fe
0d11 : 8d 25 9f STA $9f25 
0d14 : a5 2d __ LDA P0 ; (spr + 0)
0d16 : 0a __ __ ASL
0d17 : 0a __ __ ASL
0d18 : 85 3b __ STA ACCU + 0 
0d1a : a9 3f __ LDA #$3f
0d1c : 2a __ __ ROL
0d1d : 06 3b __ ASL ACCU + 0 
0d1f : 2a __ __ ROL
0d20 : 8d 21 9f STA $9f21 
0d23 : a5 3b __ LDA ACCU + 0 
0d25 : 8d 20 9f STA $9f20 
0d28 : a9 11 __ LDA #$11
0d2a : 8d 22 9f STA $9f22 
0d2d : a5 30 __ LDA P3 ; (mode8 + 0)
0d2f : f0 02 __ BEQ $0d33 ; (vera_spr_set.s11 + 0)
.s9:
0d31 : a9 80 __ LDA #$80
.s11:
0d33 : 05 2f __ ORA P2 ; (addr32 + 1)
0d35 : a6 2e __ LDX P1 ; (addr32 + 0)
0d37 : 8e 23 9f STX $9f23 
0d3a : 8d 23 9f STA $9f23 
0d3d : a9 00 __ LDA #$00
0d3f : 8d 23 9f STA $9f23 
0d42 : 8d 23 9f STA $9f23 
0d45 : 8d 23 9f STA $9f23 
0d48 : 8d 23 9f STA $9f23 
0d4b : a5 33 __ LDA P6 ; (z + 0)
0d4d : 0a __ __ ASL
0d4e : 0a __ __ ASL
0d4f : 8d 23 9f STA $9f23 
0d52 : a5 32 __ LDA P5 ; (h + 0)
0d54 : 4a __ __ LSR
0d55 : 6a __ __ ROR
0d56 : 29 80 __ AND #$80
0d58 : 6a __ __ ROR
0d59 : 85 3b __ STA ACCU + 0 
0d5b : a5 31 __ LDA P4 ; (w + 0)
0d5d : 0a __ __ ASL
0d5e : 0a __ __ ASL
0d5f : 0a __ __ ASL
0d60 : 0a __ __ ASL
0d61 : 05 3b __ ORA ACCU + 0 
0d63 : 05 34 __ ORA P7 ; (pal + 0)
0d65 : 8d 23 9f STA $9f23 
.s1001:
0d68 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0d69 : ad 25 9f LDA $9f25 
0d6c : 29 fe __ AND #$fe
0d6e : 8d 25 9f STA $9f25 
0d71 : a5 2d __ LDA P0 ; (spr + 0)
0d73 : 0a __ __ ASL
0d74 : 0a __ __ ASL
0d75 : 85 3b __ STA ACCU + 0 
0d77 : a9 3f __ LDA #$3f
0d79 : 2a __ __ ROL
0d7a : 06 3b __ ASL ACCU + 0 
0d7c : 2a __ __ ROL
0d7d : aa __ __ TAX
0d7e : a5 3b __ LDA ACCU + 0 
0d80 : 09 02 __ ORA #$02
0d82 : 8d 20 9f STA $9f20 
0d85 : 8e 21 9f STX $9f21 
0d88 : a9 11 __ LDA #$11
0d8a : 8d 22 9f STA $9f22 
0d8d : a5 2e __ LDA P1 ; (x + 0)
0d8f : 8d 23 9f STA $9f23 
0d92 : a5 2f __ LDA P2 ; (x + 1)
0d94 : 8d 23 9f STA $9f23 
0d97 : a5 30 __ LDA P3 ; (y + 0)
0d99 : 8d 23 9f STA $9f23 
0d9c : a5 31 __ LDA P4 ; (y + 1)
0d9e : 8d 23 9f STA $9f23 
.s1001:
0da1 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
147e : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
148e : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0da2 : ad 5d 10 LDA $105d ; (zsm_finished + 0)
.s1001:
0da5 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0da6 : a9 01 __ LDA #$01
0da8 : 8d 5d 10 STA $105d ; (zsm_finished + 0)
0dab : ad 9e 14 LDA $149e ; (zsm_reading + 0)
0dae : f0 0a __ BEQ $0dba ; (zsm_init.s3 + 0)
.s1:
0db0 : a9 02 __ LDA #$02
0db2 : 20 ff 0d JSR $0dff ; (krnio_close.s1000 + 0)
0db5 : a9 00 __ LDA #$00
0db7 : 8d 9e 14 STA $149e ; (zsm_reading + 0)
.s3:
0dba : 8d d0 18 STA $18d0 ; (zsm_pos + 0)
0dbd : 8d d1 18 STA $18d1 ; (zsm_pos + 1)
0dc0 : 8d d2 18 STA $18d2 ; (zsm_wpos + 0)
0dc3 : 8d d3 18 STA $18d3 ; (zsm_wpos + 1)
0dc6 : 8d cf 14 STA $14cf ; (zsm_delay + 0)
0dc9 : a5 30 __ LDA P3 ; (fname + 0)
0dcb : 85 2d __ STA P0 
0dcd : a5 31 __ LDA P4 ; (fname + 1)
0dcf : 85 2e __ STA P1 
0dd1 : 20 07 0e JSR $0e07 ; (krnio_setnam.s0 + 0)
0dd4 : a9 02 __ LDA #$02
0dd6 : 85 2d __ STA P0 
0dd8 : 85 2f __ STA P2 
0dda : a9 08 __ LDA #$08
0ddc : 85 2e __ STA P1 
0dde : 20 1d 0e JSR $0e1d ; (krnio_open.s0 + 0)
0de1 : a5 3b __ LDA ACCU + 0 
0de3 : f0 19 __ BEQ $0dfe ; (zsm_init.s1001 + 0)
.s4:
0de5 : a9 01 __ LDA #$01
0de7 : 8d 9e 14 STA $149e ; (zsm_reading + 0)
0dea : 20 45 0e JSR $0e45 ; (zsm_fill.s0 + 0)
0ded : a9 10 __ LDA #$10
0def : 8d d0 18 STA $18d0 ; (zsm_pos + 0)
0df2 : a9 00 __ LDA #$00
0df4 : 8d d1 18 STA $18d1 ; (zsm_pos + 1)
0df7 : 8d 5d 10 STA $105d ; (zsm_finished + 0)
0dfa : a9 01 __ LDA #$01
0dfc : 85 3b __ STA ACCU + 0 
.s1001:
0dfe : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
149e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0dff : 85 2d __ STA P0 
.s0:
0e01 : a5 2d __ LDA P0 
0e03 : 20 c3 ff JSR $ffc3 
.s1001:
0e06 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
18d2 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0e07 : a5 2d __ LDA P0 
0e09 : 05 2e __ ORA P1 
0e0b : f0 08 __ BEQ $0e15 ; (krnio_setnam.s0 + 14)
0e0d : a0 ff __ LDY #$ff
0e0f : c8 __ __ INY
0e10 : b1 2d __ LDA (P0),y 
0e12 : d0 fb __ BNE $0e0f ; (krnio_setnam.s0 + 8)
0e14 : 98 __ __ TYA
0e15 : a6 2d __ LDX P0 
0e17 : a4 2e __ LDY P1 
0e19 : 20 bd ff JSR $ffbd 
.s1001:
0e1c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0e1d : a9 00 __ LDA #$00
0e1f : a6 2d __ LDX P0 ; (fnum + 0)
0e21 : 9d d4 18 STA $18d4,x ; (krnio_pstatus + 0)
0e24 : a9 00 __ LDA #$00
0e26 : 85 3b __ STA ACCU + 0 
0e28 : 85 3c __ STA ACCU + 1 
0e2a : a5 2d __ LDA P0 ; (fnum + 0)
0e2c : a6 2e __ LDX P1 
0e2e : a4 2f __ LDY P2 
0e30 : 20 ba ff JSR $ffba 
0e33 : 20 c0 ff JSR $ffc0 
0e36 : 90 08 __ BCC $0e40 ; (krnio_open.s0 + 35)
0e38 : a5 2d __ LDA P0 ; (fnum + 0)
0e3a : 20 c3 ff JSR $ffc3 
0e3d : 4c 44 0e JMP $0e44 ; (krnio_open.s1001 + 0)
0e40 : a9 01 __ LDA #$01
0e42 : 85 3b __ STA ACCU + 0 
.s1001:
0e44 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
18d4 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0e45 : ad 9e 14 LDA $149e ; (zsm_reading + 0)
0e48 : f0 20 __ BEQ $0e6a ; (zsm_fill.s1 + 0)
.s2:
0e4a : ad d1 18 LDA $18d1 ; (zsm_pos + 1)
0e4d : 18 __ __ CLC
0e4e : 69 04 __ ADC #$04
0e50 : cd d3 18 CMP $18d3 ; (zsm_wpos + 1)
0e53 : d0 0c __ BNE $0e61 ; (zsm_fill.s6 + 0)
.s1006:
0e55 : ad d2 18 LDA $18d2 ; (zsm_wpos + 0)
0e58 : cd d0 18 CMP $18d0 ; (zsm_pos + 0)
0e5b : d0 04 __ BNE $0e61 ; (zsm_fill.s6 + 0)
.s5:
0e5d : a9 00 __ LDA #$00
0e5f : f0 0b __ BEQ $0e6c ; (zsm_fill.s1008 + 0)
.s6:
0e61 : a9 02 __ LDA #$02
0e63 : 20 e9 0e JSR $0ee9 ; (krnio_chkin.s1000 + 0)
0e66 : a5 3b __ LDA ACCU + 0 
0e68 : d0 07 __ BNE $0e71 ; (zsm_fill.s9 + 0)
.s1:
0e6a : a9 ff __ LDA #$ff
.s1008:
0e6c : 85 3b __ STA ACCU + 0 
.s1001:
0e6e : 85 3c __ STA ACCU + 1 
0e70 : 60 __ __ RTS
.s9:
0e71 : a9 00 __ LDA #$00
0e73 : 85 47 __ STA T1 + 0 
0e75 : 85 48 __ STA T1 + 1 
0e77 : ad d1 18 LDA $18d1 ; (zsm_pos + 1)
0e7a : 18 __ __ CLC
0e7b : 69 04 __ ADC #$04
0e7d : cd d3 18 CMP $18d3 ; (zsm_wpos + 1)
0e80 : d0 08 __ BNE $0e8a ; (zsm_fill.l13 + 0)
.s1002:
0e82 : ad d2 18 LDA $18d2 ; (zsm_wpos + 0)
0e85 : cd d0 18 CMP $18d0 ; (zsm_pos + 0)
0e88 : f0 49 __ BEQ $0ed3 ; (zsm_fill.s37 + 0)
.l13:
0e8a : 20 fb 0e JSR $0efb ; (krnio_chrin.s0 + 0)
0e8d : ad d2 18 LDA $18d2 ; (zsm_wpos + 0)
0e90 : aa __ __ TAX
0e91 : 18 __ __ CLC
0e92 : 69 01 __ ADC #$01
0e94 : 8d d2 18 STA $18d2 ; (zsm_wpos + 0)
0e97 : ad d3 18 LDA $18d3 ; (zsm_wpos + 1)
0e9a : a8 __ __ TAY
0e9b : 69 00 __ ADC #$00
0e9d : 8d d3 18 STA $18d3 ; (zsm_wpos + 1)
0ea0 : 8a __ __ TXA
0ea1 : 18 __ __ CLC
0ea2 : 69 d0 __ ADC #$d0
0ea4 : 85 49 __ STA T3 + 0 
0ea6 : 98 __ __ TYA
0ea7 : 29 03 __ AND #$03
0ea9 : 69 14 __ ADC #$14
0eab : 85 4a __ STA T3 + 1 
0ead : a5 3b __ LDA ACCU + 0 
0eaf : a0 00 __ LDY #$00
0eb1 : 91 49 __ STA (T3 + 0),y 
0eb3 : e6 47 __ INC T1 + 0 
0eb5 : d0 02 __ BNE $0eb9 ; (zsm_fill.s1010 + 0)
.s1009:
0eb7 : e6 48 __ INC T1 + 1 
.s1010:
0eb9 : 20 05 0f JSR $0f05 ; (krnio_status.s0 + 0)
0ebc : a5 3b __ LDA ACCU + 0 
0ebe : d0 0e __ BNE $0ece ; (zsm_fill.s15 + 0)
.s12:
0ec0 : ad d1 18 LDA $18d1 ; (zsm_pos + 1)
0ec3 : 18 __ __ CLC
0ec4 : 69 04 __ ADC #$04
0ec6 : cd d3 18 CMP $18d3 ; (zsm_wpos + 1)
0ec9 : d0 bf __ BNE $0e8a ; (zsm_fill.l13 + 0)
0ecb : 4c 82 0e JMP $0e82 ; (zsm_fill.s1002 + 0)
.s15:
0ece : a9 00 __ LDA #$00
0ed0 : 8d 9e 14 STA $149e ; (zsm_reading + 0)
.s37:
0ed3 : 20 0f 0f JSR $0f0f ; (krnio_clrchn.s0 + 0)
0ed6 : ad 9e 14 LDA $149e ; (zsm_reading + 0)
0ed9 : d0 05 __ BNE $0ee0 ; (zsm_fill.s21 + 0)
.s19:
0edb : a9 02 __ LDA #$02
0edd : 20 ff 0d JSR $0dff ; (krnio_close.s1000 + 0)
.s21:
0ee0 : a5 47 __ LDA T1 + 0 
0ee2 : 85 3b __ STA ACCU + 0 
0ee4 : a5 48 __ LDA T1 + 1 
0ee6 : 4c 6e 0e JMP $0e6e ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0ee9 : 85 2d __ STA P0 
.s0:
0eeb : a6 2d __ LDX P0 
0eed : 20 c6 ff JSR $ffc6 
0ef0 : a9 00 __ LDA #$00
0ef2 : 85 3c __ STA ACCU + 1 
0ef4 : b0 02 __ BCS $0ef8 ; (krnio_chkin.s0 + 13)
0ef6 : a9 01 __ LDA #$01
0ef8 : 85 3b __ STA ACCU + 0 
.s1001:
0efa : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0efb : 20 cf ff JSR $ffcf 
0efe : 85 3b __ STA ACCU + 0 
0f00 : a9 00 __ LDA #$00
0f02 : 85 3c __ STA ACCU + 1 
.s1001:
0f04 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0f05 : 20 b7 ff JSR $ffb7 
0f08 : 85 3b __ STA ACCU + 0 
0f0a : a9 00 __ LDA #$00
0f0c : 85 3c __ STA ACCU + 1 
.s1001:
0f0e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0f0f : 20 cc ff JSR $ffcc 
.s1001:
0f12 : 60 __ __ RTS
--------------------------------------------------------------------
0f13 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0f23 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0f31 : 20 4d 0f JSR $0f4d ; (getchx.s0 + 0)
0f34 : a5 3c __ LDA ACCU + 1 
0f36 : d0 10 __ BNE $0f48 ; (Control.s3 + 0)
.s1005:
0f38 : a5 3b __ LDA ACCU + 0 
0f3a : c9 20 __ CMP #$20
0f3c : d0 0a __ BNE $0f48 ; (Control.s3 + 0)
.s1:
0f3e : a9 00 __ LDA #$00
0f40 : c5 2e __ CMP P1 ; (playing + 0)
0f42 : 2a __ __ ROL
0f43 : 85 2e __ STA P1 ; (playing + 0)
0f45 : 20 7e 0f JSR $0f7e ; (zsm_irq_play.s0 + 0)
.s3:
0f48 : a5 2e __ LDA P1 ; (playing + 0)
0f4a : 85 3b __ STA ACCU + 0 
.s1001:
0f4c : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0f4d : 20 57 0f JSR $0f57 ; (getpch + 0)
0f50 : 85 3b __ STA ACCU + 0 
0f52 : a9 00 __ LDA #$00
0f54 : 85 3c __ STA ACCU + 1 
.s1001:
0f56 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0f57 : 20 e4 ff JSR $ffe4 
0f5a : ae 9f 14 LDX $149f ; (giocharmap + 0)
0f5d : e0 01 __ CPX #$01
0f5f : 90 1c __ BCC $0f7d ; (getpch + 38)
0f61 : c9 0d __ CMP #$0d
0f63 : d0 02 __ BNE $0f67 ; (getpch + 16)
0f65 : a9 0a __ LDA #$0a
0f67 : e0 02 __ CPX #$02
0f69 : 90 12 __ BCC $0f7d ; (getpch + 38)
0f6b : c9 41 __ CMP #$41
0f6d : 90 0e __ BCC $0f7d ; (getpch + 38)
0f6f : c9 7b __ CMP #$7b
0f71 : b0 0a __ BCS $0f7d ; (getpch + 38)
0f73 : c9 61 __ CMP #$61
0f75 : b0 04 __ BCS $0f7b ; (getpch + 36)
0f77 : c9 5b __ CMP #$5b
0f79 : b0 02 __ BCS $0f7d ; (getpch + 38)
0f7b : 49 20 __ EOR #$20
0f7d : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
149f : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0f7e : 8d 5c 10 STA $105c ; (zsm_playing + 0)
.s1001:
0f81 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
14a0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
14a2 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
14b2 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
14c2 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
18e4 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0f82 : ad 26 9f LDA $9f26 
0f85 : 29 40 __ AND #$40
0f87 : d0 f9 __ BNE $0f82 ; (frame_wait.l1 + 0)
.l4:
0f89 : ad 26 9f LDA $9f26 
0f8c : 29 40 __ AND #$40
0f8e : f0 f9 __ BEQ $0f89 ; (frame_wait.l4 + 0)
.s1001:
0f90 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0f91 : 38 __ __ SEC
0f92 : a9 00 __ LDA #$00
0f94 : e5 3b __ SBC ACCU + 0 
0f96 : 85 3b __ STA ACCU + 0 
0f98 : a9 00 __ LDA #$00
0f9a : e5 3c __ SBC ACCU + 1 
0f9c : 85 3c __ STA ACCU + 1 
0f9e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0f9f : 38 __ __ SEC
0fa0 : a9 00 __ LDA #$00
0fa2 : e5 23 __ SBC WORK + 0 
0fa4 : 85 23 __ STA WORK + 0 
0fa6 : a9 00 __ LDA #$00
0fa8 : e5 24 __ SBC WORK + 1 
0faa : 85 24 __ STA WORK + 1 
0fac : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
0fad : a5 3c __ LDA ACCU + 1 
0faf : d0 31 __ BNE $0fe2 ; (divmod + 53)
0fb1 : a5 24 __ LDA WORK + 1 
0fb3 : d0 1e __ BNE $0fd3 ; (divmod + 38)
0fb5 : 85 26 __ STA WORK + 3 
0fb7 : a2 04 __ LDX #$04
0fb9 : 06 3b __ ASL ACCU + 0 
0fbb : 2a __ __ ROL
0fbc : c5 23 __ CMP WORK + 0 
0fbe : 90 02 __ BCC $0fc2 ; (divmod + 21)
0fc0 : e5 23 __ SBC WORK + 0 
0fc2 : 26 3b __ ROL ACCU + 0 
0fc4 : 2a __ __ ROL
0fc5 : c5 23 __ CMP WORK + 0 
0fc7 : 90 02 __ BCC $0fcb ; (divmod + 30)
0fc9 : e5 23 __ SBC WORK + 0 
0fcb : 26 3b __ ROL ACCU + 0 
0fcd : ca __ __ DEX
0fce : d0 eb __ BNE $0fbb ; (divmod + 14)
0fd0 : 85 25 __ STA WORK + 2 
0fd2 : 60 __ __ RTS
0fd3 : a5 3b __ LDA ACCU + 0 
0fd5 : 85 25 __ STA WORK + 2 
0fd7 : a5 3c __ LDA ACCU + 1 
0fd9 : 85 26 __ STA WORK + 3 
0fdb : a9 00 __ LDA #$00
0fdd : 85 3b __ STA ACCU + 0 
0fdf : 85 3c __ STA ACCU + 1 
0fe1 : 60 __ __ RTS
0fe2 : a5 24 __ LDA WORK + 1 
0fe4 : d0 1f __ BNE $1005 ; (divmod + 88)
0fe6 : a5 23 __ LDA WORK + 0 
0fe8 : 30 1b __ BMI $1005 ; (divmod + 88)
0fea : a9 00 __ LDA #$00
0fec : 85 26 __ STA WORK + 3 
0fee : a2 10 __ LDX #$10
0ff0 : 06 3b __ ASL ACCU + 0 
0ff2 : 26 3c __ ROL ACCU + 1 
0ff4 : 2a __ __ ROL
0ff5 : c5 23 __ CMP WORK + 0 
0ff7 : 90 02 __ BCC $0ffb ; (divmod + 78)
0ff9 : e5 23 __ SBC WORK + 0 
0ffb : 26 3b __ ROL ACCU + 0 
0ffd : 26 3c __ ROL ACCU + 1 
0fff : ca __ __ DEX
1000 : d0 f2 __ BNE $0ff4 ; (divmod + 71)
1002 : 85 25 __ STA WORK + 2 
1004 : 60 __ __ RTS
1005 : a9 00 __ LDA #$00
1007 : 85 25 __ STA WORK + 2 
1009 : 85 26 __ STA WORK + 3 
100b : 84 22 __ STY $22 
100d : a0 10 __ LDY #$10
100f : 18 __ __ CLC
1010 : 26 3b __ ROL ACCU + 0 
1012 : 26 3c __ ROL ACCU + 1 
1014 : 26 25 __ ROL WORK + 2 
1016 : 26 26 __ ROL WORK + 3 
1018 : 38 __ __ SEC
1019 : a5 25 __ LDA WORK + 2 
101b : e5 23 __ SBC WORK + 0 
101d : aa __ __ TAX
101e : a5 26 __ LDA WORK + 3 
1020 : e5 24 __ SBC WORK + 1 
1022 : 90 04 __ BCC $1028 ; (divmod + 123)
1024 : 86 25 __ STX WORK + 2 
1026 : 85 26 __ STA WORK + 3 
1028 : 88 __ __ DEY
1029 : d0 e5 __ BNE $1010 ; (divmod + 99)
102b : 26 3b __ ROL ACCU + 0 
102d : 26 3c __ ROL ACCU + 1 
102f : a4 22 __ LDY $22 
1031 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1032 : 24 3c __ BIT ACCU + 1 
1034 : 10 0d __ BPL $1043 ; (mods16 + 17)
1036 : 20 91 0f JSR $0f91 ; (negaccu + 0)
1039 : 24 24 __ BIT WORK + 1 
103b : 10 0d __ BPL $104a ; (mods16 + 24)
103d : 20 9f 0f JSR $0f9f ; (negtmp + 0)
1040 : 4c ad 0f JMP $0fad ; (divmod + 0)
1043 : 24 24 __ BIT WORK + 1 
1045 : 10 f9 __ BPL $1040 ; (mods16 + 14)
1047 : 20 9f 0f JSR $0f9f ; (negtmp + 0)
104a : 20 ad 0f JSR $0fad ; (divmod + 0)
104d : 38 __ __ SEC
104e : a9 00 __ LDA #$00
1050 : e5 25 __ SBC WORK + 2 
1052 : 85 25 __ STA WORK + 2 
1054 : a9 00 __ LDA #$00
1056 : e5 26 __ SBC WORK + 3 
1058 : 85 26 __ STA WORK + 3 
105a : 60 __ __ RTS
