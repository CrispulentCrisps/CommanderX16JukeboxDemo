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
080e : 8e 76 11 STX $1176 ; (spentry + 0)
0811 : a9 00 __ LDA #$00
0813 : 85 39 __ STA IP + 0 
0815 : a9 16 __ LDA #$16
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 1a __ LDA #$1a
081c : e9 16 __ SBC #$16
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
0830 : a9 13 __ LDA #$13
0832 : e9 00 __ SBC #$00
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
1176 : __ __ __ BYT 00                                              : .
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
08b7 : 85 4d __ STA T1 + 0 
.l2:
08b9 : a9 03 __ LDA #$03
08bb : 8d 2c 9f STA $9f2c 
08be : 20 c1 0e JSR $0ec1 ; (zsm_check.s0 + 0)
08c1 : 09 00 __ ORA #$00
08c3 : f0 0b __ BEQ $08d0 ; (main.s6 + 0)
.s4:
08c5 : a9 32 __ LDA #$32
08c7 : 85 30 __ STA P3 
08c9 : a9 10 __ LDA #$10
08cb : 85 31 __ STA P4 
08cd : 20 c5 0e JSR $0ec5 ; (zsm_init.s0 + 0)
.s6:
08d0 : a5 4d __ LDA T1 + 0 
08d2 : 85 2e __ STA P1 
08d4 : 20 4c 10 JSR $104c ; (Control.s0 + 0)
08d7 : a5 3b __ LDA ACCU + 0 
08d9 : 85 4d __ STA T1 + 0 
08db : ad bd 11 LDA $11bd ; (FrameCount + 0)
08de : 85 48 __ STA T3 + 0 
08e0 : 85 3b __ STA ACCU + 0 
08e2 : ad be 11 LDA $11be ; (FrameCount + 1)
08e5 : 85 3c __ STA ACCU + 1 
08e7 : a9 04 __ LDA #$04
08e9 : 85 23 __ STA WORK + 0 
08eb : a9 00 __ LDA #$00
08ed : 85 24 __ STA WORK + 1 
08ef : 20 4d 11 JSR $114d ; (mods16 + 0)
08f2 : a5 26 __ LDA WORK + 3 
08f4 : d0 16 __ BNE $090c ; (main.s9 + 0)
.s1002:
08f6 : a5 25 __ LDA WORK + 2 
08f8 : c9 01 __ CMP #$01
08fa : d0 10 __ BNE $090c ; (main.s9 + 0)
.s7:
08fc : ae 12 1a LDX $1a12 ; (off1 + 0)
08ff : e8 __ __ INX
0900 : 8e 12 1a STX $1a12 ; (off1 + 0)
0903 : bd be 11 LDA $11be,x ; (FrameCount + 1)
0906 : 38 __ __ SEC
0907 : e9 40 __ SBC #$40
0909 : 8d 23 9f STA $9f23 
.s9:
090c : 06 48 __ ASL T3 + 0 
090e : ad be 11 LDA $11be ; (FrameCount + 1)
0911 : 2a __ __ ROL
0912 : 18 __ __ CLC
0913 : 69 ff __ ADC #$ff
0915 : 8d 38 9f STA $9f38 
0918 : a5 48 __ LDA T3 + 0 
091a : 8d 37 9f STA $9f37 
091d : a9 01 __ LDA #$01
091f : 8d 2c 9f STA $9f2c 
0922 : 20 64 0f JSR $0f64 ; (zsm_fill.s0 + 0)
0925 : a9 00 __ LDA #$00
0927 : 8d 2c 9f STA $9f2c 
092a : 20 9d 10 JSR $109d ; (frame_wait.l1 + 0)
092d : ee bd 11 INC $11bd ; (FrameCount + 0)
0930 : d0 87 __ BNE $08b9 ; (main.l2 + 0)
.s1003:
0932 : ee be 11 INC $11be ; (FrameCount + 1)
0935 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0938 : 78 __ __ SEI
0939 : ad 14 03 LDA $0314 
093c : 8d fb 11 STA $11fb ; (oirq + 0)
093f : ad 15 03 LDA $0315 
0942 : 8d fc 11 STA $11fc ; (oirq + 1)
0945 : a9 51 __ LDA #$51
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : 58 __ __ CLI
.s1001:
0950 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
11fb : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0951 : 20 57 09 JSR $0957 ; (irq.s1000 + 0)
0954 : 6c fb 11 JMP ($11fb)
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
0981 : ad 77 11 LDA $1177 ; (zsm_playing + 0)
0984 : f0 08 __ BEQ $098e ; (irq.s1001 + 0)
.s4:
0986 : ad 78 11 LDA $1178 ; (zsm_finished + 0)
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
1177 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1178 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b9 : ad fd 11 LDA $11fd ; (zsm_delay + 0)
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
09dd : ad fe 11 LDA $11fe ; (zsm_pos + 0)
09e0 : 85 4b __ STA T3 + 0 
09e2 : 18 __ __ CLC
09e3 : 69 01 __ ADC #$01
09e5 : 85 4d __ STA T4 + 0 
09e7 : 8d fe 11 STA $11fe ; (zsm_pos + 0)
09ea : ad ff 11 LDA $11ff ; (zsm_pos + 1)
09ed : aa __ __ TAX
09ee : 69 00 __ ADC #$00
09f0 : 85 4e __ STA T4 + 1 
09f2 : 8d ff 11 STA $11ff ; (zsm_pos + 1)
09f5 : 18 __ __ CLC
09f6 : a9 00 __ LDA #$00
09f8 : 65 4b __ ADC T3 + 0 
09fa : 85 3b __ STA ACCU + 0 
09fc : 8a __ __ TXA
09fd : 29 03 __ AND #$03
09ff : 69 16 __ ADC #$16
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
0a11 : a9 00 __ LDA #$00
0a13 : 65 4d __ ADC T4 + 0 
0a15 : 85 4b __ STA T3 + 0 
0a17 : a5 4e __ LDA T4 + 1 
0a19 : 29 03 __ AND #$03
0a1b : 69 16 __ ADC #$16
0a1d : 85 4c __ STA T3 + 1 
0a1f : b1 4b __ LDA (T3 + 0),y 
0a21 : 29 3f __ AND #$3f
0a23 : 18 __ __ CLC
0a24 : 65 4d __ ADC T4 + 0 
0a26 : 8d fe 11 STA $11fe ; (zsm_pos + 0)
0a29 : 98 __ __ TYA
0a2a : 65 4e __ ADC T4 + 1 
0a2c : 8d ff 11 STA $11ff ; (zsm_pos + 1)
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
0a3f : a9 00 __ LDA #$00
0a41 : 6d fe 11 ADC $11fe ; (zsm_pos + 0)
0a44 : 85 4d __ STA T4 + 0 
0a46 : ad ff 11 LDA $11ff ; (zsm_pos + 1)
0a49 : 29 03 __ AND #$03
0a4b : 69 16 __ ADC #$16
0a4d : 85 4e __ STA T4 + 1 
0a4f : a0 00 __ LDY #$00
0a51 : b1 4d __ LDA (T4 + 0),y 
0a53 : 85 2d __ STA P0 
0a55 : ad fe 11 LDA $11fe ; (zsm_pos + 0)
0a58 : 18 __ __ CLC
0a59 : 69 01 __ ADC #$01
0a5b : aa __ __ TAX
0a5c : ad ff 11 LDA $11ff ; (zsm_pos + 1)
0a5f : 69 00 __ ADC #$00
0a61 : 29 03 __ AND #$03
0a63 : 85 4c __ STA T3 + 1 
0a65 : 8a __ __ TXA
0a66 : 18 __ __ CLC
0a67 : 69 00 __ ADC #$00
0a69 : 85 4b __ STA T3 + 0 
0a6b : a9 16 __ LDA #$16
0a6d : 65 4c __ ADC T3 + 1 
0a6f : 85 4c __ STA T3 + 1 
0a71 : b1 4b __ LDA (T3 + 0),y 
0a73 : 85 2e __ STA P1 
0a75 : 20 f2 0a JSR $0af2 ; (sfx_put.l1 + 0)
0a78 : ad fe 11 LDA $11fe ; (zsm_pos + 0)
0a7b : 18 __ __ CLC
0a7c : 69 02 __ ADC #$02
0a7e : 8d fe 11 STA $11fe ; (zsm_pos + 0)
0a81 : 90 03 __ BCC $0a86 ; (zsm_play.s1015 + 0)
.s1014:
0a83 : ee ff 11 INC $11ff ; (zsm_pos + 1)
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
0a97 : 8d 78 11 STA $1178 ; (zsm_finished + 0)
0a9a : d0 08 __ BNE $0aa4 ; (zsm_play.s7 + 0)
.s22:
0a9c : 29 7f __ AND #$7f
0a9e : 38 __ __ SEC
0a9f : e9 01 __ SBC #$01
0aa1 : 8d fd 11 STA $11fd ; (zsm_delay + 0)
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
0ace : 8d fe 11 STA $11fe ; (zsm_pos + 0)
0ad1 : 90 01 __ BCC $0ad4 ; (zsm_play.s1017 + 0)
.s1016:
0ad3 : e8 __ __ INX
.s1017:
0ad4 : 8e ff 11 STX $11ff ; (zsm_pos + 1)
0ad7 : 18 __ __ CLC
0ad8 : a9 00 __ LDA #$00
0ada : 65 4d __ ADC T4 + 0 
0adc : 85 4b __ STA T3 + 0 
0ade : a5 4e __ LDA T4 + 1 
0ae0 : 29 03 __ AND #$03
0ae2 : 69 16 __ ADC #$16
0ae4 : 85 4c __ STA T3 + 1 
0ae6 : b1 4b __ LDA (T3 + 0),y 
0ae8 : 8d 23 9f STA $9f23 
0aeb : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s1:
0aee : ce fd 11 DEC $11fd ; (zsm_delay + 0)
0af1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
11fd : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
1600 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
11fe : __ __ __ BSS	2
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
0b24 : a0 80 __ LDY #$80
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
0b3e : e0 40 __ CPX #$40
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
0b49 : a9 00 __ LDA #$00
0b4b : 85 2d __ STA P0 
0b4d : 85 2e __ STA P1 
0b4f : 85 2f __ STA P2 
0b51 : 85 30 __ STA P3 
0b53 : 85 31 __ STA P4 
0b55 : 8d 25 9f STA $9f25 
0b58 : ad 29 9f LDA $9f29 
0b5b : 09 70 __ ORA #$70
0b5d : 8d 29 9f STA $9f29 
0b60 : a9 80 __ LDA #$80
0b62 : 8d 2b 9f STA $9f2b 
0b65 : 8d 2a 9f STA $9f2a 
0b68 : a9 62 __ LDA #$62
0b6a : 8d 2d 9f STA $9f2d 
0b6d : a9 68 __ LDA #$68
0b6f : 8d 34 9f STA $9f34 
0b72 : 20 7b 0d JSR $0d7b ; (tileBaseConfig.s0 + 0)
0b75 : 8d 2f 9f STA $9f2f 
0b78 : a9 20 __ LDA #$20
0b7a : 85 2f __ STA P2 
0b7c : 20 94 0d JSR $0d94 ; (memoryToMapMemoryAddress.s0 + 0)
0b7f : 8d 2e 9f STA $9f2e 
0b82 : a9 21 __ LDA #$21
0b84 : 8d 22 9f STA $9f22 
0b87 : a2 80 __ LDX #$80
.l6:
0b89 : a0 50 __ LDY #$50
.l1020:
0b8b : a9 00 __ LDA #$00
0b8d : 8d 24 9f STA $9f24 
0b90 : a9 08 __ LDA #$08
0b92 : 8d 24 9f STA $9f24 
0b95 : 88 __ __ DEY
0b96 : d0 f3 __ BNE $0b8b ; (SetUpSprites.l1020 + 0)
.s1021:
0b98 : ca __ __ DEX
0b99 : d0 ee __ BNE $0b89 ; (SetUpSprites.l6 + 0)
.s4:
0b9b : a9 00 __ LDA #$00
0b9d : 85 2d __ STA P0 
0b9f : 85 2e __ STA P1 
0ba1 : 85 2f __ STA P2 
0ba3 : 85 30 __ STA P3 
0ba5 : 85 33 __ STA P6 
0ba7 : a9 01 __ LDA #$01
0ba9 : 85 34 __ STA P7 
0bab : a9 00 __ LDA #$00
0bad : 85 31 __ STA P4 
0baf : a9 12 __ LDA #$12
0bb1 : 85 32 __ STA P5 
0bb3 : 20 a2 0d JSR $0da2 ; (vram_putn.s0 + 0)
0bb6 : a9 10 __ LDA #$10
0bb8 : 8d 22 9f STA $9f22 
0bbb : a9 00 __ LDA #$00
0bbd : 8d 20 9f STA $9f20 
0bc0 : a9 20 __ LDA #$20
0bc2 : 8d 21 9f STA $9f21 
0bc5 : a9 3c __ LDA #$3c
0bc7 : 85 47 __ STA T1 + 0 
.l10:
0bc9 : a9 00 __ LDA #$00
0bcb : 85 48 __ STA T2 + 0 
.l14:
0bcd : 20 dd 0d JSR $0ddd ; (rand.s0 + 0)
0bd0 : a5 3b __ LDA ACCU + 0 
0bd2 : 29 1f __ AND #$1f
0bd4 : c9 1f __ CMP #$1f
0bd6 : a5 48 __ LDA T2 + 0 
0bd8 : 90 03 __ BCC $0bdd ; (SetUpSprites.s1018 + 0)
0bda : 4c 45 0d JMP $0d45 ; (SetUpSprites.s1012 + 0)
.s1018:
0bdd : c9 0a __ CMP #$0a
0bdf : 90 06 __ BCC $0be7 ; (SetUpSprites.s20 + 0)
.s1017:
0be1 : a9 46 __ LDA #$46
0be3 : c5 48 __ CMP T2 + 0 
0be5 : b0 04 __ BCS $0beb ; (SetUpSprites.s1016 + 0)
.s20:
0be7 : a9 00 __ LDA #$00
0be9 : f0 2f __ BEQ $0c1a ; (SetUpSprites.s96 + 0)
.s1016:
0beb : a5 48 __ LDA T2 + 0 
0bed : c9 14 __ CMP #$14
0bef : 90 06 __ BCC $0bf7 ; (SetUpSprites.s24 + 0)
.s1015:
0bf1 : a9 3c __ LDA #$3c
0bf3 : c5 48 __ CMP T2 + 0 
0bf5 : b0 04 __ BCS $0bfb ; (SetUpSprites.s1014 + 0)
.s24:
0bf7 : a9 01 __ LDA #$01
0bf9 : d0 12 __ BNE $0c0d ; (SetUpSprites.s100 + 0)
.s1014:
0bfb : a5 48 __ LDA T2 + 0 
0bfd : c9 1e __ CMP #$1e
0bff : 90 06 __ BCC $0c07 ; (SetUpSprites.s28 + 0)
.s1013:
0c01 : a9 32 __ LDA #$32
0c03 : c5 48 __ CMP T2 + 0 
0c05 : b0 04 __ BCS $0c0b ; (SetUpSprites.s29 + 0)
.s28:
0c07 : a9 02 __ LDA #$02
0c09 : d0 02 __ BNE $0c0d ; (SetUpSprites.s100 + 0)
.s29:
0c0b : a9 03 __ LDA #$03
.s100:
0c0d : 8d 23 9f STA $9f23 
0c10 : a9 00 __ LDA #$00
0c12 : 8d 23 9f STA $9f23 
0c15 : e6 48 __ INC T2 + 0 
0c17 : 4c cd 0b JMP $0bcd ; (SetUpSprites.l14 + 0)
.s96:
0c1a : 8d 23 9f STA $9f23 
0c1d : a9 00 __ LDA #$00
0c1f : 8d 23 9f STA $9f23 
0c22 : e6 48 __ INC T2 + 0 
0c24 : 10 a7 __ BPL $0bcd ; (SetUpSprites.l14 + 0)
.s11:
0c26 : c6 47 __ DEC T1 + 0 
0c28 : d0 9f __ BNE $0bc9 ; (SetUpSprites.l10 + 0)
.s12:
0c2a : a9 20 __ LDA #$20
0c2c : 85 37 __ STA P10 
0c2e : a9 00 __ LDA #$00
0c30 : 8d fc 9e STA $9efc ; (sstack + 0)
0c33 : 8d ff 9e STA $9eff ; (sstack + 3)
0c36 : a9 fa __ LDA #$fa
0c38 : 8d fd 9e STA $9efd ; (sstack + 1)
0c3b : a9 01 __ LDA #$01
0c3d : 8d fe 9e STA $9efe ; (sstack + 2)
0c40 : a9 7b __ LDA #$7b
0c42 : 85 35 __ STA P8 
0c44 : a9 11 __ LDA #$11
0c46 : 85 36 __ STA P9 
0c48 : 20 04 0e JSR $0e04 ; (SetPaletteColours.s0 + 0)
0c4b : a9 00 __ LDA #$00
0c4d : 85 2d __ STA P0 
0c4f : 85 30 __ STA P3 
0c51 : 85 33 __ STA P6 
0c53 : a9 31 __ LDA #$31
0c55 : 85 2e __ STA P1 
0c57 : a9 01 __ LDA #$01
0c59 : 85 2f __ STA P2 
0c5b : a9 02 __ LDA #$02
0c5d : 85 34 __ STA P7 
0c5f : a9 00 __ LDA #$00
0c61 : 85 31 __ STA P4 
0c63 : a9 13 __ LDA #$13
0c65 : 85 32 __ STA P5 
0c67 : 20 a2 0d JSR $0da2 ; (vram_putn.s0 + 0)
0c6a : a9 30 __ LDA #$30
0c6c : 85 2e __ STA P1 
0c6e : a9 01 __ LDA #$01
0c70 : 85 34 __ STA P7 
0c72 : a9 00 __ LDA #$00
0c74 : 85 31 __ STA P4 
0c76 : a9 15 __ LDA #$15
0c78 : 85 32 __ STA P5 
0c7a : 20 a2 0d JSR $0da2 ; (vram_putn.s0 + 0)
0c7d : a9 16 __ LDA #$16
0c7f : 85 2d __ STA P0 
0c81 : a9 80 __ LDA #$80
0c83 : 85 2e __ STA P1 
0c85 : a9 09 __ LDA #$09
0c87 : 85 2f __ STA P2 
0c89 : a9 01 __ LDA #$01
0c8b : 85 31 __ STA P4 
0c8d : 85 34 __ STA P7 
0c8f : a9 02 __ LDA #$02
0c91 : 85 32 __ STA P5 
0c93 : a9 03 __ LDA #$03
0c95 : 85 33 __ STA P6 
0c97 : 20 2b 0e JSR $0e2b ; (vera_spr_set.s0 + 0)
0c9a : a9 1a __ LDA #$1a
0c9c : 85 2e __ STA P1 
0c9e : a9 01 __ LDA #$01
0ca0 : 85 2f __ STA P2 
0ca2 : a9 b8 __ LDA #$b8
0ca4 : 85 30 __ STA P3 
0ca6 : 20 88 0e JSR $0e88 ; (vera_spr_move.s0 + 0)
0ca9 : a9 00 __ LDA #$00
0cab : 85 4b __ STA T5 + 0 
0cad : 85 4c __ STA T5 + 1 
.l45:
0caf : 85 2d __ STA P0 
0cb1 : 18 __ __ CLC
0cb2 : 69 02 __ ADC #$02
0cb4 : 85 49 __ STA T4 + 0 
0cb6 : a9 00 __ LDA #$00
0cb8 : 2a __ __ ROL
0cb9 : 85 4a __ STA T4 + 1 
0cbb : a9 88 __ LDA #$88
0cbd : 85 2e __ STA P1 
0cbf : a9 09 __ LDA #$09
0cc1 : 85 2f __ STA P2 
0cc3 : a9 00 __ LDA #$00
0cc5 : 85 30 __ STA P3 
0cc7 : a9 03 __ LDA #$03
0cc9 : 85 31 __ STA P4 
0ccb : a9 01 __ LDA #$01
0ccd : 85 32 __ STA P5 
0ccf : 20 2b 0e JSR $0e2b ; (vera_spr_set.s0 + 0)
0cd2 : a5 4b __ LDA T5 + 0 
0cd4 : 85 2e __ STA P1 
0cd6 : a5 4c __ LDA T5 + 1 
0cd8 : 85 2f __ STA P2 
0cda : a9 a0 __ LDA #$a0
0cdc : 85 30 __ STA P3 
0cde : a9 01 __ LDA #$01
0ce0 : 85 31 __ STA P4 
0ce2 : 20 88 0e JSR $0e88 ; (vera_spr_move.s0 + 0)
0ce5 : a9 88 __ LDA #$88
0ce7 : 85 2e __ STA P1 
0ce9 : a9 09 __ LDA #$09
0ceb : 85 2f __ STA P2 
0ced : a9 00 __ LDA #$00
0cef : 85 30 __ STA P3 
0cf1 : a9 03 __ LDA #$03
0cf3 : 85 31 __ STA P4 
0cf5 : e6 2d __ INC P0 
0cf7 : 20 2b 0e JSR $0e2b ; (vera_spr_set.s0 + 0)
0cfa : a5 4b __ LDA T5 + 0 
0cfc : 85 2e __ STA P1 
0cfe : a5 4c __ LDA T5 + 1 
0d00 : 85 2f __ STA P2 
0d02 : a9 70 __ LDA #$70
0d04 : 85 30 __ STA P3 
0d06 : a9 01 __ LDA #$01
0d08 : 85 31 __ STA P4 
0d0a : 20 88 0e JSR $0e88 ; (vera_spr_move.s0 + 0)
0d0d : a5 4a __ LDA T4 + 1 
0d0f : d0 13 __ BNE $0d24 ; (SetUpSprites.s47 + 0)
.s1008:
0d11 : 18 __ __ CLC
0d12 : a5 2e __ LDA P1 
0d14 : 69 40 __ ADC #$40
0d16 : 85 4b __ STA T5 + 0 
0d18 : a5 2f __ LDA P2 
0d1a : 69 00 __ ADC #$00
0d1c : 85 4c __ STA T5 + 1 
0d1e : a5 49 __ LDA T4 + 0 
0d20 : c9 16 __ CMP #$16
0d22 : 90 8b __ BCC $0caf ; (SetUpSprites.l45 + 0)
.s47:
0d24 : a9 20 __ LDA #$20
0d26 : 85 37 __ STA P10 
0d28 : 8d fc 9e STA $9efc ; (sstack + 0)
0d2b : a9 fa __ LDA #$fa
0d2d : 8d fd 9e STA $9efd ; (sstack + 1)
0d30 : a9 01 __ LDA #$01
0d32 : 8d fe 9e STA $9efe ; (sstack + 2)
0d35 : a9 00 __ LDA #$00
0d37 : 8d ff 9e STA $9eff ; (sstack + 3)
0d3a : a9 9b __ LDA #$9b
0d3c : 85 35 __ STA P8 
0d3e : a9 11 __ LDA #$11
0d40 : 85 36 __ STA P9 
0d42 : 4c 04 0e JMP $0e04 ; (SetPaletteColours.s0 + 0)
.s1012:
0d45 : c9 0a __ CMP #$0a
0d47 : 90 06 __ BCC $0d4f ; (SetUpSprites.s32 + 0)
.s1011:
0d49 : a9 46 __ LDA #$46
0d4b : c5 48 __ CMP T2 + 0 
0d4d : b0 05 __ BCS $0d54 ; (SetUpSprites.s1005 + 0)
.s32:
0d4f : a9 04 __ LDA #$04
0d51 : 4c 1a 0c JMP $0c1a ; (SetUpSprites.s96 + 0)
.s1005:
0d54 : a5 48 __ LDA T2 + 0 
0d56 : c9 14 __ CMP #$14
0d58 : 90 06 __ BCC $0d60 ; (SetUpSprites.s36 + 0)
.s1004:
0d5a : a9 3c __ LDA #$3c
0d5c : c5 48 __ CMP T2 + 0 
0d5e : b0 05 __ BCS $0d65 ; (SetUpSprites.s1003 + 0)
.s36:
0d60 : a9 05 __ LDA #$05
0d62 : 4c 0d 0c JMP $0c0d ; (SetUpSprites.s100 + 0)
.s1003:
0d65 : a5 48 __ LDA T2 + 0 
0d67 : c9 1e __ CMP #$1e
0d69 : 90 06 __ BCC $0d71 ; (SetUpSprites.s40 + 0)
.s1002:
0d6b : a9 32 __ LDA #$32
0d6d : c5 48 __ CMP T2 + 0 
0d6f : b0 05 __ BCS $0d76 ; (SetUpSprites.s41 + 0)
.s40:
0d71 : a9 06 __ LDA #$06
0d73 : 4c 0d 0c JMP $0c0d ; (SetUpSprites.s100 + 0)
.s41:
0d76 : a9 07 __ LDA #$07
0d78 : 4c 0d 0c JMP $0c0d ; (SetUpSprites.s100 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
0d7b : a5 2d __ LDA P0 ; (bank + 0)
0d7d : 4a __ __ LSR
0d7e : a9 00 __ LDA #$00
0d80 : 6a __ __ ROR
0d81 : 85 3b __ STA ACCU + 0 
0d83 : a5 2f __ LDA P2 ; (mem + 1)
0d85 : 29 f8 __ AND #$f8
0d87 : 4a __ __ LSR
0d88 : 05 3b __ ORA ACCU + 0 
0d8a : 85 3b __ STA ACCU + 0 
0d8c : a5 30 __ LDA P3 ; (height + 0)
0d8e : 0a __ __ ASL
0d8f : 05 3b __ ORA ACCU + 0 
0d91 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
0d93 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
0d94 : a5 2d __ LDA P0 ; (bank + 0)
0d96 : 4a __ __ LSR
0d97 : a9 00 __ LDA #$00
0d99 : 6a __ __ ROR
0d9a : 85 3b __ STA ACCU + 0 
0d9c : a5 2f __ LDA P2 ; (mem + 1)
0d9e : 4a __ __ LSR
0d9f : 05 3b __ ORA ACCU + 0 
.s1001:
0da1 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
0da2 : ad 25 9f LDA $9f25 
0da5 : 29 fe __ AND #$fe
0da7 : 8d 25 9f STA $9f25 
0daa : a5 2d __ LDA P0 ; (addr + 0)
0dac : 8d 20 9f STA $9f20 
0daf : a5 2e __ LDA P1 ; (addr + 1)
0db1 : 8d 21 9f STA $9f21 
0db4 : a5 2f __ LDA P2 ; (addr + 2)
0db6 : 29 01 __ AND #$01
0db8 : 09 10 __ ORA #$10
0dba : 8d 22 9f STA $9f22 
0dbd : a5 33 __ LDA P6 ; (size + 0)
0dbf : 05 34 __ ORA P7 ; (size + 1)
0dc1 : f0 19 __ BEQ $0ddc ; (vram_putn.s1001 + 0)
.s6:
0dc3 : a0 00 __ LDY #$00
0dc5 : a6 33 __ LDX P6 ; (size + 0)
0dc7 : f0 02 __ BEQ $0dcb ; (vram_putn.l1002 + 0)
.s1005:
0dc9 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0dcb : b1 31 __ LDA (P4),y ; (data + 0)
0dcd : 8d 23 9f STA $9f23 
0dd0 : c8 __ __ INY
0dd1 : d0 02 __ BNE $0dd5 ; (vram_putn.s1009 + 0)
.s1008:
0dd3 : e6 32 __ INC P5 ; (data + 1)
.s1009:
0dd5 : ca __ __ DEX
0dd6 : d0 f3 __ BNE $0dcb ; (vram_putn.l1002 + 0)
.s1004:
0dd8 : c6 34 __ DEC P7 ; (size + 1)
0dda : d0 ef __ BNE $0dcb ; (vram_putn.l1002 + 0)
.s1001:
0ddc : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1200 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1210 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1220 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1230 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1240 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1250 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1260 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1270 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1280 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1290 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
12a0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
12b0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
12c0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
12d0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
12e0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
12f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
0ddd : ad 7a 11 LDA $117a ; (seed + 1)
0de0 : 4a __ __ LSR
0de1 : ad 79 11 LDA $1179 ; (seed + 0)
0de4 : 6a __ __ ROR
0de5 : aa __ __ TAX
0de6 : a9 00 __ LDA #$00
0de8 : 6a __ __ ROR
0de9 : 4d 79 11 EOR $1179 ; (seed + 0)
0dec : 85 3b __ STA ACCU + 0 
0dee : 8a __ __ TXA
0def : 4d 7a 11 EOR $117a ; (seed + 1)
0df2 : 85 3c __ STA ACCU + 1 
0df4 : 4a __ __ LSR
0df5 : 45 3b __ EOR ACCU + 0 
0df7 : 8d 79 11 STA $1179 ; (seed + 0)
0dfa : 85 3b __ STA ACCU + 0 
0dfc : 45 3c __ EOR ACCU + 1 
0dfe : 8d 7a 11 STA $117a ; (seed + 1)
0e01 : 85 3c __ STA ACCU + 1 
.s1001:
0e03 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1179 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0e04 : ad fc 9e LDA $9efc ; (sstack + 0)
0e07 : 85 2d __ STA P0 
0e09 : ad fd 9e LDA $9efd ; (sstack + 1)
0e0c : 85 2e __ STA P1 
0e0e : ad fe 9e LDA $9efe ; (sstack + 2)
0e11 : 85 2f __ STA P2 
0e13 : ad ff 9e LDA $9eff ; (sstack + 3)
0e16 : 85 30 __ STA P3 
0e18 : a5 35 __ LDA P8 ; (input + 0)
0e1a : 85 31 __ STA P4 
0e1c : a5 36 __ LDA P9 ; (input + 1)
0e1e : 85 32 __ STA P5 
0e20 : a5 37 __ LDA P10 ; (inputsize + 0)
0e22 : 85 33 __ STA P6 
0e24 : a9 00 __ LDA #$00
0e26 : 85 34 __ STA P7 
0e28 : 4c a2 0d JMP $0da2 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
117b : __ __ __ BYT 23 02 12 01 01 11 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
118b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ScrollerOutline:
1300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1330 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1340 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1350 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1360 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1370 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1380 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1390 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
13a0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
13b0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
13c0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
13d0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
13e0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
13f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1400 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1410 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1420 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1430 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1440 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1450 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1460 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1470 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1480 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1490 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
14a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
14b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
14c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
14d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
14e0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
14f0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
1500 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 12 21 00 : ..............!.
1510 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1520 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 12 21 00 : ..............!.
1530 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1540 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1550 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1560 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1570 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1580 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1590 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
15a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
15b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
15c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 11 11 00 00 22 22 00 : ............."".
15d0 : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
15e0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 11 11 00 00 22 22 00 : ............."".
15f0 : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
--------------------------------------------------------------------
vera_spr_set:
.s0:
0e2b : ad 25 9f LDA $9f25 
0e2e : 29 fe __ AND #$fe
0e30 : 8d 25 9f STA $9f25 
0e33 : a5 2d __ LDA P0 ; (spr + 0)
0e35 : 0a __ __ ASL
0e36 : 0a __ __ ASL
0e37 : 85 3b __ STA ACCU + 0 
0e39 : a9 3f __ LDA #$3f
0e3b : 2a __ __ ROL
0e3c : 06 3b __ ASL ACCU + 0 
0e3e : 2a __ __ ROL
0e3f : 8d 21 9f STA $9f21 
0e42 : a5 3b __ LDA ACCU + 0 
0e44 : 8d 20 9f STA $9f20 
0e47 : a9 11 __ LDA #$11
0e49 : 8d 22 9f STA $9f22 
0e4c : a5 30 __ LDA P3 ; (mode8 + 0)
0e4e : f0 02 __ BEQ $0e52 ; (vera_spr_set.s11 + 0)
.s9:
0e50 : a9 80 __ LDA #$80
.s11:
0e52 : 05 2f __ ORA P2 ; (addr32 + 1)
0e54 : a6 2e __ LDX P1 ; (addr32 + 0)
0e56 : 8e 23 9f STX $9f23 
0e59 : 8d 23 9f STA $9f23 
0e5c : a9 00 __ LDA #$00
0e5e : 8d 23 9f STA $9f23 
0e61 : 8d 23 9f STA $9f23 
0e64 : 8d 23 9f STA $9f23 
0e67 : 8d 23 9f STA $9f23 
0e6a : a5 33 __ LDA P6 ; (z + 0)
0e6c : 0a __ __ ASL
0e6d : 0a __ __ ASL
0e6e : 8d 23 9f STA $9f23 
0e71 : a5 32 __ LDA P5 ; (h + 0)
0e73 : 4a __ __ LSR
0e74 : 6a __ __ ROR
0e75 : 29 80 __ AND #$80
0e77 : 6a __ __ ROR
0e78 : 85 3b __ STA ACCU + 0 
0e7a : a5 31 __ LDA P4 ; (w + 0)
0e7c : 0a __ __ ASL
0e7d : 0a __ __ ASL
0e7e : 0a __ __ ASL
0e7f : 0a __ __ ASL
0e80 : 05 3b __ ORA ACCU + 0 
0e82 : 05 34 __ ORA P7 ; (pal + 0)
0e84 : 8d 23 9f STA $9f23 
.s1001:
0e87 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0e88 : ad 25 9f LDA $9f25 
0e8b : 29 fe __ AND #$fe
0e8d : 8d 25 9f STA $9f25 
0e90 : a5 2d __ LDA P0 ; (spr + 0)
0e92 : 0a __ __ ASL
0e93 : 0a __ __ ASL
0e94 : 85 3b __ STA ACCU + 0 
0e96 : a9 3f __ LDA #$3f
0e98 : 2a __ __ ROL
0e99 : 06 3b __ ASL ACCU + 0 
0e9b : 2a __ __ ROL
0e9c : aa __ __ TAX
0e9d : a5 3b __ LDA ACCU + 0 
0e9f : 09 02 __ ORA #$02
0ea1 : 8d 20 9f STA $9f20 
0ea4 : 8e 21 9f STX $9f21 
0ea7 : a9 11 __ LDA #$11
0ea9 : 8d 22 9f STA $9f22 
0eac : a5 2e __ LDA P1 ; (x + 0)
0eae : 8d 23 9f STA $9f23 
0eb1 : a5 2f __ LDA P2 ; (x + 1)
0eb3 : 8d 23 9f STA $9f23 
0eb6 : a5 30 __ LDA P3 ; (y + 0)
0eb8 : 8d 23 9f STA $9f23 
0ebb : a5 31 __ LDA P4 ; (y + 1)
0ebd : 8d 23 9f STA $9f23 
.s1001:
0ec0 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
119b : __ __ __ BYT ff 0f ef 0e ee 0e aa 0a 88 08 66 06 22 02 11 01 : ..........f."...
11ab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
zsm_check:
.s0:
0ec1 : ad 78 11 LDA $1178 ; (zsm_finished + 0)
.s1001:
0ec4 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0ec5 : a9 01 __ LDA #$01
0ec7 : 8d 78 11 STA $1178 ; (zsm_finished + 0)
0eca : ad bb 11 LDA $11bb ; (zsm_reading + 0)
0ecd : f0 0a __ BEQ $0ed9 ; (zsm_init.s3 + 0)
.s1:
0ecf : a9 02 __ LDA #$02
0ed1 : 20 1e 0f JSR $0f1e ; (krnio_close.s1000 + 0)
0ed4 : a9 00 __ LDA #$00
0ed6 : 8d bb 11 STA $11bb ; (zsm_reading + 0)
.s3:
0ed9 : 8d fe 11 STA $11fe ; (zsm_pos + 0)
0edc : 8d ff 11 STA $11ff ; (zsm_pos + 1)
0edf : 8d 00 1a STA $1a00 ; (zsm_wpos + 0)
0ee2 : 8d 01 1a STA $1a01 ; (zsm_wpos + 1)
0ee5 : 8d fd 11 STA $11fd ; (zsm_delay + 0)
0ee8 : a5 30 __ LDA P3 ; (fname + 0)
0eea : 85 2d __ STA P0 
0eec : a5 31 __ LDA P4 ; (fname + 1)
0eee : 85 2e __ STA P1 
0ef0 : 20 26 0f JSR $0f26 ; (krnio_setnam.s0 + 0)
0ef3 : a9 02 __ LDA #$02
0ef5 : 85 2d __ STA P0 
0ef7 : 85 2f __ STA P2 
0ef9 : a9 08 __ LDA #$08
0efb : 85 2e __ STA P1 
0efd : 20 3c 0f JSR $0f3c ; (krnio_open.s0 + 0)
0f00 : a5 3b __ LDA ACCU + 0 
0f02 : f0 19 __ BEQ $0f1d ; (zsm_init.s1001 + 0)
.s4:
0f04 : a9 01 __ LDA #$01
0f06 : 8d bb 11 STA $11bb ; (zsm_reading + 0)
0f09 : 20 64 0f JSR $0f64 ; (zsm_fill.s0 + 0)
0f0c : a9 10 __ LDA #$10
0f0e : 8d fe 11 STA $11fe ; (zsm_pos + 0)
0f11 : a9 00 __ LDA #$00
0f13 : 8d ff 11 STA $11ff ; (zsm_pos + 1)
0f16 : 8d 78 11 STA $1178 ; (zsm_finished + 0)
0f19 : a9 01 __ LDA #$01
0f1b : 85 3b __ STA ACCU + 0 
.s1001:
0f1d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
11bb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0f1e : 85 2d __ STA P0 
.s0:
0f20 : a5 2d __ LDA P0 
0f22 : 20 c3 ff JSR $ffc3 
.s1001:
0f25 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
1a00 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0f26 : a5 2d __ LDA P0 
0f28 : 05 2e __ ORA P1 
0f2a : f0 08 __ BEQ $0f34 ; (krnio_setnam.s0 + 14)
0f2c : a0 ff __ LDY #$ff
0f2e : c8 __ __ INY
0f2f : b1 2d __ LDA (P0),y 
0f31 : d0 fb __ BNE $0f2e ; (krnio_setnam.s0 + 8)
0f33 : 98 __ __ TYA
0f34 : a6 2d __ LDX P0 
0f36 : a4 2e __ LDY P1 
0f38 : 20 bd ff JSR $ffbd 
.s1001:
0f3b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0f3c : a9 00 __ LDA #$00
0f3e : a6 2d __ LDX P0 ; (fnum + 0)
0f40 : 9d 02 1a STA $1a02,x ; (krnio_pstatus + 0)
0f43 : a9 00 __ LDA #$00
0f45 : 85 3b __ STA ACCU + 0 
0f47 : 85 3c __ STA ACCU + 1 
0f49 : a5 2d __ LDA P0 ; (fnum + 0)
0f4b : a6 2e __ LDX P1 
0f4d : a4 2f __ LDY P2 
0f4f : 20 ba ff JSR $ffba 
0f52 : 20 c0 ff JSR $ffc0 
0f55 : 90 08 __ BCC $0f5f ; (krnio_open.s0 + 35)
0f57 : a5 2d __ LDA P0 ; (fnum + 0)
0f59 : 20 c3 ff JSR $ffc3 
0f5c : 4c 63 0f JMP $0f63 ; (krnio_open.s1001 + 0)
0f5f : a9 01 __ LDA #$01
0f61 : 85 3b __ STA ACCU + 0 
.s1001:
0f63 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
1a02 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0f64 : ad bb 11 LDA $11bb ; (zsm_reading + 0)
0f67 : f0 20 __ BEQ $0f89 ; (zsm_fill.s1 + 0)
.s2:
0f69 : ad ff 11 LDA $11ff ; (zsm_pos + 1)
0f6c : 18 __ __ CLC
0f6d : 69 04 __ ADC #$04
0f6f : cd 01 1a CMP $1a01 ; (zsm_wpos + 1)
0f72 : d0 0c __ BNE $0f80 ; (zsm_fill.s6 + 0)
.s1006:
0f74 : ad 00 1a LDA $1a00 ; (zsm_wpos + 0)
0f77 : cd fe 11 CMP $11fe ; (zsm_pos + 0)
0f7a : d0 04 __ BNE $0f80 ; (zsm_fill.s6 + 0)
.s5:
0f7c : a9 00 __ LDA #$00
0f7e : f0 0b __ BEQ $0f8b ; (zsm_fill.s1008 + 0)
.s6:
0f80 : a9 02 __ LDA #$02
0f82 : 20 08 10 JSR $1008 ; (krnio_chkin.s1000 + 0)
0f85 : a5 3b __ LDA ACCU + 0 
0f87 : d0 07 __ BNE $0f90 ; (zsm_fill.s9 + 0)
.s1:
0f89 : a9 ff __ LDA #$ff
.s1008:
0f8b : 85 3b __ STA ACCU + 0 
.s1001:
0f8d : 85 3c __ STA ACCU + 1 
0f8f : 60 __ __ RTS
.s9:
0f90 : a9 00 __ LDA #$00
0f92 : 85 47 __ STA T1 + 0 
0f94 : 85 48 __ STA T1 + 1 
0f96 : ad ff 11 LDA $11ff ; (zsm_pos + 1)
0f99 : 18 __ __ CLC
0f9a : 69 04 __ ADC #$04
0f9c : cd 01 1a CMP $1a01 ; (zsm_wpos + 1)
0f9f : d0 08 __ BNE $0fa9 ; (zsm_fill.l13 + 0)
.s1002:
0fa1 : ad 00 1a LDA $1a00 ; (zsm_wpos + 0)
0fa4 : cd fe 11 CMP $11fe ; (zsm_pos + 0)
0fa7 : f0 49 __ BEQ $0ff2 ; (zsm_fill.s37 + 0)
.l13:
0fa9 : 20 1a 10 JSR $101a ; (krnio_chrin.s0 + 0)
0fac : ad 00 1a LDA $1a00 ; (zsm_wpos + 0)
0faf : aa __ __ TAX
0fb0 : 18 __ __ CLC
0fb1 : 69 01 __ ADC #$01
0fb3 : 8d 00 1a STA $1a00 ; (zsm_wpos + 0)
0fb6 : ad 01 1a LDA $1a01 ; (zsm_wpos + 1)
0fb9 : a8 __ __ TAY
0fba : 69 00 __ ADC #$00
0fbc : 8d 01 1a STA $1a01 ; (zsm_wpos + 1)
0fbf : 8a __ __ TXA
0fc0 : 18 __ __ CLC
0fc1 : 69 00 __ ADC #$00
0fc3 : 85 49 __ STA T3 + 0 
0fc5 : 98 __ __ TYA
0fc6 : 29 03 __ AND #$03
0fc8 : 69 16 __ ADC #$16
0fca : 85 4a __ STA T3 + 1 
0fcc : a5 3b __ LDA ACCU + 0 
0fce : a0 00 __ LDY #$00
0fd0 : 91 49 __ STA (T3 + 0),y 
0fd2 : e6 47 __ INC T1 + 0 
0fd4 : d0 02 __ BNE $0fd8 ; (zsm_fill.s1010 + 0)
.s1009:
0fd6 : e6 48 __ INC T1 + 1 
.s1010:
0fd8 : 20 24 10 JSR $1024 ; (krnio_status.s0 + 0)
0fdb : a5 3b __ LDA ACCU + 0 
0fdd : d0 0e __ BNE $0fed ; (zsm_fill.s15 + 0)
.s12:
0fdf : ad ff 11 LDA $11ff ; (zsm_pos + 1)
0fe2 : 18 __ __ CLC
0fe3 : 69 04 __ ADC #$04
0fe5 : cd 01 1a CMP $1a01 ; (zsm_wpos + 1)
0fe8 : d0 bf __ BNE $0fa9 ; (zsm_fill.l13 + 0)
0fea : 4c a1 0f JMP $0fa1 ; (zsm_fill.s1002 + 0)
.s15:
0fed : a9 00 __ LDA #$00
0fef : 8d bb 11 STA $11bb ; (zsm_reading + 0)
.s37:
0ff2 : 20 2e 10 JSR $102e ; (krnio_clrchn.s0 + 0)
0ff5 : ad bb 11 LDA $11bb ; (zsm_reading + 0)
0ff8 : d0 05 __ BNE $0fff ; (zsm_fill.s21 + 0)
.s19:
0ffa : a9 02 __ LDA #$02
0ffc : 20 1e 0f JSR $0f1e ; (krnio_close.s1000 + 0)
.s21:
0fff : a5 47 __ LDA T1 + 0 
1001 : 85 3b __ STA ACCU + 0 
1003 : a5 48 __ LDA T1 + 1 
1005 : 4c 8d 0f JMP $0f8d ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1008 : 85 2d __ STA P0 
.s0:
100a : a6 2d __ LDX P0 
100c : 20 c6 ff JSR $ffc6 
100f : a9 00 __ LDA #$00
1011 : 85 3c __ STA ACCU + 1 
1013 : b0 02 __ BCS $1017 ; (krnio_chkin.s0 + 13)
1015 : a9 01 __ LDA #$01
1017 : 85 3b __ STA ACCU + 0 
.s1001:
1019 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
101a : 20 cf ff JSR $ffcf 
101d : 85 3b __ STA ACCU + 0 
101f : a9 00 __ LDA #$00
1021 : 85 3c __ STA ACCU + 1 
.s1001:
1023 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1024 : 20 b7 ff JSR $ffb7 
1027 : 85 3b __ STA ACCU + 0 
1029 : a9 00 __ LDA #$00
102b : 85 3c __ STA ACCU + 1 
.s1001:
102d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
102e : 20 cc ff JSR $ffcc 
.s1001:
1031 : 60 __ __ RTS
--------------------------------------------------------------------
1032 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 4b 72 61 69 : @0:zsmfiles/Krai
1042 : __ __ __ BYT 64 2e 7a 73 6d 2c 50 2c 52 00                   : d.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
104c : 20 68 10 JSR $1068 ; (getchx.s0 + 0)
104f : a5 3c __ LDA ACCU + 1 
1051 : d0 10 __ BNE $1063 ; (Control.s3 + 0)
.s1005:
1053 : a5 3b __ LDA ACCU + 0 
1055 : c9 20 __ CMP #$20
1057 : d0 0a __ BNE $1063 ; (Control.s3 + 0)
.s1:
1059 : a9 00 __ LDA #$00
105b : c5 2e __ CMP P1 ; (playing + 0)
105d : 2a __ __ ROL
105e : 85 2e __ STA P1 ; (playing + 0)
1060 : 20 99 10 JSR $1099 ; (zsm_irq_play.s0 + 0)
.s3:
1063 : a5 2e __ LDA P1 ; (playing + 0)
1065 : 85 3b __ STA ACCU + 0 
.s1001:
1067 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
1068 : 20 72 10 JSR $1072 ; (getpch + 0)
106b : 85 3b __ STA ACCU + 0 
106d : a9 00 __ LDA #$00
106f : 85 3c __ STA ACCU + 1 
.s1001:
1071 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1072 : 20 e4 ff JSR $ffe4 
1075 : ae bc 11 LDX $11bc ; (giocharmap + 0)
1078 : e0 01 __ CPX #$01
107a : 90 1c __ BCC $1098 ; (getpch + 38)
107c : c9 0d __ CMP #$0d
107e : d0 02 __ BNE $1082 ; (getpch + 16)
1080 : a9 0a __ LDA #$0a
1082 : e0 02 __ CPX #$02
1084 : 90 12 __ BCC $1098 ; (getpch + 38)
1086 : c9 41 __ CMP #$41
1088 : 90 0e __ BCC $1098 ; (getpch + 38)
108a : c9 7b __ CMP #$7b
108c : b0 0a __ BCS $1098 ; (getpch + 38)
108e : c9 61 __ CMP #$61
1090 : b0 04 __ BCS $1096 ; (getpch + 36)
1092 : c9 5b __ CMP #$5b
1094 : b0 02 __ BCS $1098 ; (getpch + 38)
1096 : 49 20 __ EOR #$20
1098 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
11bc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1099 : 8d 77 11 STA $1177 ; (zsm_playing + 0)
.s1001:
109c : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
11bd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
11bf : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
11cf : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
11df : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 2c 20 4d 41 52 4b : MBA TOBACH, MARK
11ef : __ __ __ BYT 2d 42 55 47 2d 53 4c 41 59 45 52 00             : -BUG-SLAYER.
--------------------------------------------------------------------
off1:
1a12 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
109d : ad 26 9f LDA $9f26 
10a0 : 29 40 __ AND #$40
10a2 : d0 f9 __ BNE $109d ; (frame_wait.l1 + 0)
.l4:
10a4 : ad 26 9f LDA $9f26 
10a7 : 29 40 __ AND #$40
10a9 : f0 f9 __ BEQ $10a4 ; (frame_wait.l4 + 0)
.s1001:
10ab : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
10ac : 38 __ __ SEC
10ad : a9 00 __ LDA #$00
10af : e5 3b __ SBC ACCU + 0 
10b1 : 85 3b __ STA ACCU + 0 
10b3 : a9 00 __ LDA #$00
10b5 : e5 3c __ SBC ACCU + 1 
10b7 : 85 3c __ STA ACCU + 1 
10b9 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
10ba : 38 __ __ SEC
10bb : a9 00 __ LDA #$00
10bd : e5 23 __ SBC WORK + 0 
10bf : 85 23 __ STA WORK + 0 
10c1 : a9 00 __ LDA #$00
10c3 : e5 24 __ SBC WORK + 1 
10c5 : 85 24 __ STA WORK + 1 
10c7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
10c8 : a5 3c __ LDA ACCU + 1 
10ca : d0 31 __ BNE $10fd ; (divmod + 53)
10cc : a5 24 __ LDA WORK + 1 
10ce : d0 1e __ BNE $10ee ; (divmod + 38)
10d0 : 85 26 __ STA WORK + 3 
10d2 : a2 04 __ LDX #$04
10d4 : 06 3b __ ASL ACCU + 0 
10d6 : 2a __ __ ROL
10d7 : c5 23 __ CMP WORK + 0 
10d9 : 90 02 __ BCC $10dd ; (divmod + 21)
10db : e5 23 __ SBC WORK + 0 
10dd : 26 3b __ ROL ACCU + 0 
10df : 2a __ __ ROL
10e0 : c5 23 __ CMP WORK + 0 
10e2 : 90 02 __ BCC $10e6 ; (divmod + 30)
10e4 : e5 23 __ SBC WORK + 0 
10e6 : 26 3b __ ROL ACCU + 0 
10e8 : ca __ __ DEX
10e9 : d0 eb __ BNE $10d6 ; (divmod + 14)
10eb : 85 25 __ STA WORK + 2 
10ed : 60 __ __ RTS
10ee : a5 3b __ LDA ACCU + 0 
10f0 : 85 25 __ STA WORK + 2 
10f2 : a5 3c __ LDA ACCU + 1 
10f4 : 85 26 __ STA WORK + 3 
10f6 : a9 00 __ LDA #$00
10f8 : 85 3b __ STA ACCU + 0 
10fa : 85 3c __ STA ACCU + 1 
10fc : 60 __ __ RTS
10fd : a5 24 __ LDA WORK + 1 
10ff : d0 1f __ BNE $1120 ; (divmod + 88)
1101 : a5 23 __ LDA WORK + 0 
1103 : 30 1b __ BMI $1120 ; (divmod + 88)
1105 : a9 00 __ LDA #$00
1107 : 85 26 __ STA WORK + 3 
1109 : a2 10 __ LDX #$10
110b : 06 3b __ ASL ACCU + 0 
110d : 26 3c __ ROL ACCU + 1 
110f : 2a __ __ ROL
1110 : c5 23 __ CMP WORK + 0 
1112 : 90 02 __ BCC $1116 ; (divmod + 78)
1114 : e5 23 __ SBC WORK + 0 
1116 : 26 3b __ ROL ACCU + 0 
1118 : 26 3c __ ROL ACCU + 1 
111a : ca __ __ DEX
111b : d0 f2 __ BNE $110f ; (divmod + 71)
111d : 85 25 __ STA WORK + 2 
111f : 60 __ __ RTS
1120 : a9 00 __ LDA #$00
1122 : 85 25 __ STA WORK + 2 
1124 : 85 26 __ STA WORK + 3 
1126 : 84 22 __ STY $22 
1128 : a0 10 __ LDY #$10
112a : 18 __ __ CLC
112b : 26 3b __ ROL ACCU + 0 
112d : 26 3c __ ROL ACCU + 1 
112f : 26 25 __ ROL WORK + 2 
1131 : 26 26 __ ROL WORK + 3 
1133 : 38 __ __ SEC
1134 : a5 25 __ LDA WORK + 2 
1136 : e5 23 __ SBC WORK + 0 
1138 : aa __ __ TAX
1139 : a5 26 __ LDA WORK + 3 
113b : e5 24 __ SBC WORK + 1 
113d : 90 04 __ BCC $1143 ; (divmod + 123)
113f : 86 25 __ STX WORK + 2 
1141 : 85 26 __ STA WORK + 3 
1143 : 88 __ __ DEY
1144 : d0 e5 __ BNE $112b ; (divmod + 99)
1146 : 26 3b __ ROL ACCU + 0 
1148 : 26 3c __ ROL ACCU + 1 
114a : a4 22 __ LDY $22 
114c : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
114d : 24 3c __ BIT ACCU + 1 
114f : 10 0d __ BPL $115e ; (mods16 + 17)
1151 : 20 ac 10 JSR $10ac ; (negaccu + 0)
1154 : 24 24 __ BIT WORK + 1 
1156 : 10 0d __ BPL $1165 ; (mods16 + 24)
1158 : 20 ba 10 JSR $10ba ; (negtmp + 0)
115b : 4c c8 10 JMP $10c8 ; (divmod + 0)
115e : 24 24 __ BIT WORK + 1 
1160 : 10 f9 __ BPL $115b ; (mods16 + 14)
1162 : 20 ba 10 JSR $10ba ; (negtmp + 0)
1165 : 20 c8 10 JSR $10c8 ; (divmod + 0)
1168 : 38 __ __ SEC
1169 : a9 00 __ LDA #$00
116b : e5 25 __ SBC WORK + 2 
116d : 85 25 __ STA WORK + 2 
116f : a9 00 __ LDA #$00
1171 : e5 26 __ SBC WORK + 3 
1173 : 85 26 __ STA WORK + 3 
1175 : 60 __ __ RTS
