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
080e : 8e f1 1d STX $1df1 ; (spentry + 0)
0811 : a9 36 __ LDA #$36
0813 : 85 39 __ STA IP + 0 
0815 : a9 44 __ LDA #$44
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 48 __ LDA #$48
081c : e9 44 __ SBC #$44
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
0830 : a9 5d __ LDA #$5d
0832 : e9 36 __ SBC #$36
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
1df1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 de 0a JSR $0ade ; (zsm_irq_init.s0 + 0)
0883 : 20 b2 0c JSR $0cb2 ; (ClearVERAScreen.s0 + 0)
0886 : 20 f5 0c JSR $0cf5 ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9f __ LDA #$9f
0893 : 8d 2a 9f STA $9f2a 
0896 : ad 25 9f LDA $9f25 
0899 : 29 fd __ AND #$fd
089b : 8d 25 9f STA $9f25 
089e : a9 73 __ LDA #$73
08a0 : 8d 39 9f STA $9f39 
08a3 : a9 00 __ LDA #$00
08a5 : 8d 3a 9f STA $9f3a 
08a8 : 8d 20 9f STA $9f20 
08ab : a9 b0 __ LDA #$b0
08ad : 8d 21 9f STA $9f21 
08b0 : a9 01 __ LDA #$01
08b2 : 8d 22 9f STA $9f22 
08b5 : ad 22 9f LDA $9f22 
08b8 : 8d 22 9f STA $9f22 
08bb : a9 00 __ LDA #$00
08bd : 85 50 __ STA T1 + 0 
08bf : 85 51 __ STA T1 + 1 
08c1 : 85 52 __ STA T2 + 0 
08c3 : 85 53 __ STA T3 + 0 
.l2:
08c5 : 20 99 17 JSR $1799 ; (getchx.s0 + 0)
08c8 : a5 3b __ LDA ACCU + 0 
08ca : 85 54 __ STA T4 + 0 
08cc : a9 30 __ LDA #$30
08ce : 8d 2c 9f STA $9f2c 
08d1 : ee f8 23 INC $23f8 ; (p + 0)
08d4 : d0 03 __ BNE $08d9 ; (main.s1017 + 0)
.s1016:
08d6 : ee f9 23 INC $23f9 ; (p + 1)
.s1017:
08d9 : ad fa 23 LDA $23fa ; (Phase + 0)
08dc : 18 __ __ CLC
08dd : 69 01 __ ADC #$01
08df : 85 32 __ STA P5 
08e1 : 8d fa 23 STA $23fa ; (Phase + 0)
08e4 : ad fb 23 LDA $23fb ; (Phase + 1)
08e7 : 69 00 __ ADC #$00
08e9 : 85 33 __ STA P6 
08eb : 8d fb 23 STA $23fb ; (Phase + 1)
08ee : ad fc 23 LDA $23fc ; (Phase2 + 0)
08f1 : 18 __ __ CLC
08f2 : 69 01 __ ADC #$01
08f4 : 85 34 __ STA P7 
08f6 : 8d fc 23 STA $23fc ; (Phase2 + 0)
08f9 : ad fd 23 LDA $23fd ; (Phase2 + 1)
08fc : 69 00 __ ADC #$00
08fe : 85 35 __ STA P8 
0900 : 8d fd 23 STA $23fd ; (Phase2 + 1)
0903 : ad fe 23 LDA $23fe ; (Phase3 + 0)
0906 : 18 __ __ CLC
0907 : 69 01 __ ADC #$01
0909 : 85 36 __ STA P9 
090b : 8d fe 23 STA $23fe ; (Phase3 + 0)
090e : ad ff 23 LDA $23ff ; (Phase3 + 1)
0911 : 69 00 __ ADC #$00
0913 : 85 37 __ STA P10 
0915 : 8d ff 23 STA $23ff ; (Phase3 + 1)
0918 : 20 d4 17 JSR $17d4 ; (MoveSprites.s0 + 0)
091b : a5 52 __ LDA T2 + 0 
091d : f0 03 __ BEQ $0922 ; (main.s5 + 0)
091f : 4c c5 0a JMP $0ac5 ; (main.s4 + 0)
.s5:
0922 : a9 20 __ LDA #$20
0924 : 85 37 __ STA P10 
0926 : a9 a0 __ LDA #$a0
0928 : 8d fc 9e STA $9efc ; (sstack + 0)
092b : a9 fa __ LDA #$fa
092d : 8d fd 9e STA $9efd ; (sstack + 1)
0930 : a9 01 __ LDA #$01
0932 : 8d fe 9e STA $9efe ; (sstack + 2)
0935 : a9 00 __ LDA #$00
0937 : 8d ff 9e STA $9eff ; (sstack + 3)
093a : 8d 7b 42 STA $427b ; (PalTimer + 0)
093d : 8d 7c 42 STA $427c ; (PalTimer + 1)
0940 : a9 7d __ LDA #$7d
0942 : 85 35 __ STA P8 
0944 : a9 42 __ LDA #$42
0946 : 85 36 __ STA P9 
0948 : 20 72 17 JSR $1772 ; (SetPaletteColours.s0 + 0)
.s42:
094b : e6 53 __ INC T3 + 0 
094d : a9 02 __ LDA #$02
094f : c5 53 __ CMP T3 + 0 
0951 : b0 2d __ BCS $0980 ; (main.s43 + 0)
.s10:
0953 : a9 10 __ LDA #$10
0955 : 85 34 __ STA P7 
0957 : a9 00 __ LDA #$00
0959 : 85 35 __ STA P8 
095b : 85 36 __ STA P9 
095d : 85 37 __ STA P10 
095f : a9 06 __ LDA #$06
0961 : 8d fc 9e STA $9efc ; (sstack + 0)
0964 : a9 00 __ LDA #$00
0966 : 8d fd 9e STA $9efd ; (sstack + 1)
0969 : 8d ff 9e STA $9eff ; (sstack + 3)
096c : a9 0a __ LDA #$0a
096e : 8d fe 9e STA $9efe ; (sstack + 2)
0971 : a9 37 __ LDA #$37
0973 : 85 32 __ STA P5 
0975 : a9 23 __ LDA #$23
0977 : 85 33 __ STA P6 
0979 : 20 71 1b JSR $1b71 ; (SetPaletteIndex.s0 + 0)
097c : a9 00 __ LDA #$00
097e : 85 53 __ STA T3 + 0 
.s43:
0980 : ad 7c 42 LDA $427c ; (PalTimer + 1)
0983 : 30 5f __ BMI $09e4 ; (main.s44 + 0)
.s1013:
0985 : d0 07 __ BNE $098e ; (main.s13 + 0)
.s1012:
0987 : a9 03 __ LDA #$03
0989 : cd 7b 42 CMP $427b ; (PalTimer + 0)
098c : b0 56 __ BCS $09e4 ; (main.s44 + 0)
.s13:
098e : a9 60 __ LDA #$60
0990 : 85 34 __ STA P7 
0992 : a9 00 __ LDA #$00
0994 : 85 35 __ STA P8 
0996 : 85 36 __ STA P9 
0998 : 85 37 __ STA P10 
099a : 8d fc 9e STA $9efc ; (sstack + 0)
099d : 8d fd 9e STA $9efd ; (sstack + 1)
09a0 : a9 05 __ LDA #$05
09a2 : 8d fe 9e STA $9efe ; (sstack + 2)
09a5 : a9 00 __ LDA #$00
09a7 : 8d ff 9e STA $9eff ; (sstack + 3)
09aa : ee 9d 42 INC $429d ; (PalIndex + 0)
09ad : d0 03 __ BNE $09b2 ; (main.s1021 + 0)
.s1020:
09af : ee 9e 42 INC $429e ; (PalIndex + 1)
.s1021:
09b2 : a9 60 __ LDA #$60
09b4 : 85 32 __ STA P5 
09b6 : a9 3e __ LDA #$3e
09b8 : 85 33 __ STA P6 
09ba : 20 71 1b JSR $1b71 ; (SetPaletteIndex.s0 + 0)
09bd : a9 50 __ LDA #$50
09bf : 85 34 __ STA P7 
09c1 : a9 00 __ LDA #$00
09c3 : 8d fc 9e STA $9efc ; (sstack + 0)
09c6 : 8d fd 9e STA $9efd ; (sstack + 1)
09c9 : 8d ff 9e STA $9eff ; (sstack + 3)
09cc : a9 10 __ LDA #$10
09ce : 8d fe 9e STA $9efe ; (sstack + 2)
09d1 : a9 9f __ LDA #$9f
09d3 : 85 32 __ STA P5 
09d5 : a9 42 __ LDA #$42
09d7 : 85 33 __ STA P6 
09d9 : 20 71 1b JSR $1b71 ; (SetPaletteIndex.s0 + 0)
09dc : a9 00 __ LDA #$00
09de : 8d 7b 42 STA $427b ; (PalTimer + 0)
09e1 : 8d 7c 42 STA $427c ; (PalTimer + 1)
.s44:
09e4 : ad f9 23 LDA $23f9 ; (p + 1)
09e7 : d0 42 __ BNE $0a2b ; (main.s18 + 0)
.s1011:
09e9 : ad f8 23 LDA $23f8 ; (p + 0)
09ec : c9 03 __ CMP #$03
09ee : d0 3b __ BNE $0a2b ; (main.s18 + 0)
.s16:
09f0 : a9 20 __ LDA #$20
09f2 : 85 37 __ STA P10 
09f4 : a9 00 __ LDA #$00
09f6 : 8d fc 9e STA $9efc ; (sstack + 0)
09f9 : 8d ff 9e STA $9eff ; (sstack + 3)
09fc : a9 fa __ LDA #$fa
09fe : 8d fd 9e STA $9efd ; (sstack + 1)
0a01 : a9 01 __ LDA #$01
0a03 : 8d fe 9e STA $9efe ; (sstack + 2)
0a06 : a9 00 __ LDA #$00
0a08 : cd bf 42 CMP $42bf ; (ShimmerState + 0)
0a0b : 2a __ __ ROL
0a0c : 8d bf 42 STA $42bf ; (ShimmerState + 0)
0a0f : d0 07 __ BNE $0a18 ; (main.s19 + 0)
.s20:
0a11 : a9 42 __ LDA #$42
0a13 : a0 e0 __ LDY #$e0
0a15 : 4c 1c 0a JMP $0a1c ; (main.s52 + 0)
.s19:
0a18 : a9 42 __ LDA #$42
0a1a : a0 c0 __ LDY #$c0
.s52:
0a1c : 84 35 __ STY P8 
0a1e : 85 36 __ STA P9 
0a20 : 20 72 17 JSR $1772 ; (SetPaletteColours.s0 + 0)
0a23 : a9 00 __ LDA #$00
0a25 : 8d f8 23 STA $23f8 ; (p + 0)
0a28 : 8d f9 23 STA $23f9 ; (p + 1)
.s18:
0a2b : a5 52 __ LDA T2 + 0 
0a2d : 85 30 __ STA P3 
0a2f : a9 03 __ LDA #$03
0a31 : 8d 2c 9f STA $9f2c 
0a34 : a5 54 __ LDA T4 + 0 
0a36 : 85 31 __ STA P4 
0a38 : c9 44 __ CMP #$44
0a3a : d0 0e __ BNE $0a4a ; (main.s23 + 0)
.s22:
0a3c : 18 __ __ CLC
0a3d : a5 50 __ LDA T1 + 0 
0a3f : 69 01 __ ADC #$01
0a41 : 85 50 __ STA T1 + 0 
0a43 : a5 51 __ LDA T1 + 1 
0a45 : 69 00 __ ADC #$00
0a47 : 4c 61 0a JMP $0a61 ; (main.s1015 + 0)
.s23:
0a4a : c9 41 __ CMP #$41
0a4c : d0 15 __ BNE $0a63 ; (main.s24 + 0)
.s28:
0a4e : a5 51 __ LDA T1 + 1 
0a50 : 30 11 __ BMI $0a63 ; (main.s24 + 0)
.s1003:
0a52 : 05 50 __ ORA T1 + 0 
0a54 : f0 0d __ BEQ $0a63 ; (main.s24 + 0)
.s25:
0a56 : 18 __ __ CLC
0a57 : a5 50 __ LDA T1 + 0 
0a59 : 69 ff __ ADC #$ff
0a5b : 85 50 __ STA T1 + 0 
0a5d : a5 51 __ LDA T1 + 1 
0a5f : 69 ff __ ADC #$ff
.s1015:
0a61 : 85 51 __ STA T1 + 1 
.s24:
0a63 : 20 24 1c JSR $1c24 ; (Control.s0 + 0)
0a66 : a5 3b __ LDA ACCU + 0 
0a68 : 85 52 __ STA T2 + 0 
0a6a : ad 78 42 LDA $4278 ; (FrameCount + 0)
0a6d : 85 3b __ STA ACCU + 0 
0a6f : ad 79 42 LDA $4279 ; (FrameCount + 1)
0a72 : 85 3c __ STA ACCU + 1 
0a74 : a9 04 __ LDA #$04
0a76 : 85 23 __ STA WORK + 0 
0a78 : a9 00 __ LDA #$00
0a7a : 85 24 __ STA WORK + 1 
0a7c : 20 98 1d JSR $1d98 ; (mods16 + 0)
0a7f : a5 26 __ LDA WORK + 3 
0a81 : d0 18 __ BNE $0a9b ; (main.s31 + 0)
.s1002:
0a83 : a5 25 __ LDA WORK + 2 
0a85 : c9 01 __ CMP #$01
0a87 : d0 12 __ BNE $0a9b ; (main.s31 + 0)
.s29:
0a89 : ae 35 44 LDX $4435 ; (off1 + 0)
0a8c : e8 __ __ INX
0a8d : 8e 35 44 STX $4435 ; (off1 + 0)
0a90 : bd 00 44 LDA $4400,x ; (paused + 0)
0a93 : 8d 24 9f STA $9f24 
0a96 : a9 4f __ LDA #$4f
0a98 : 8d 24 9f STA $9f24 
.s31:
0a9b : ad 78 42 LDA $4278 ; (FrameCount + 0)
0a9e : 8d 37 9f STA $9f37 
0aa1 : ad 79 42 LDA $4279 ; (FrameCount + 1)
0aa4 : 8d 38 9f STA $9f38 
0aa7 : a9 01 __ LDA #$01
0aa9 : 8d 2c 9f STA $9f2c 
0aac : 20 42 1a JSR $1a42 ; (zsm_fill.s0 + 0)
0aaf : a9 00 __ LDA #$00
0ab1 : 8d 2c 9f STA $9f2c 
0ab4 : 20 e8 1c JSR $1ce8 ; (frame_wait.l1 + 0)
0ab7 : ee 78 42 INC $4278 ; (FrameCount + 0)
0aba : f0 03 __ BEQ $0abf ; (main.s1022 + 0)
0abc : 4c c5 08 JMP $08c5 ; (main.l2 + 0)
.s1022:
0abf : ee 79 42 INC $4279 ; (FrameCount + 1)
0ac2 : 4c c5 08 JMP $08c5 ; (main.l2 + 0)
.s4:
0ac5 : a5 50 __ LDA T1 + 0 
0ac7 : 85 32 __ STA P5 
0ac9 : a5 51 __ LDA T1 + 1 
0acb : 85 33 __ STA P6 
0acd : 20 69 19 JSR $1969 ; (PlayZSM.s0 + 0)
0ad0 : ee 7b 42 INC $427b ; (PalTimer + 0)
0ad3 : f0 03 __ BEQ $0ad8 ; (main.s1018 + 0)
0ad5 : 4c 4b 09 JMP $094b ; (main.s42 + 0)
.s1018:
0ad8 : ee 7c 42 INC $427c ; (PalTimer + 1)
0adb : 4c 4b 09 JMP $094b ; (main.s42 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0ade : 78 __ __ SEI
0adf : ad 14 03 LDA $0314 
0ae2 : 8d 36 44 STA $4436 ; (oirq + 0)
0ae5 : ad 15 03 LDA $0315 
0ae8 : 8d 37 44 STA $4437 ; (oirq + 1)
0aeb : a9 f7 __ LDA #$f7
0aed : 8d 14 03 STA $0314 
0af0 : a9 0a __ LDA #$0a
0af2 : 8d 15 03 STA $0315 
0af5 : 58 __ __ CLI
.s1001:
0af6 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
4436 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0af7 : 20 fd 0a JSR $0afd ; (irq.s1000 + 0)
0afa : 6c 36 44 JMP ($4436)
--------------------------------------------------------------------
irq:
.s1000:
0afd : a5 2d __ LDA P0 
0aff : 48 __ __ PHA
0b00 : a5 2e __ LDA P1 
0b02 : 48 __ __ PHA
0b03 : a5 3b __ LDA ACCU + 0 
0b05 : 48 __ __ PHA
0b06 : a5 3c __ LDA ACCU + 1 
0b08 : 48 __ __ PHA
0b09 : a5 47 __ LDA T0 + 0 
0b0b : 48 __ __ PHA
0b0c : a5 48 __ LDA $48 
0b0e : 48 __ __ PHA
0b0f : a5 49 __ LDA $49 
0b11 : 48 __ __ PHA
0b12 : a5 4a __ LDA $4a 
0b14 : 48 __ __ PHA
0b15 : a5 4b __ LDA $4b 
0b17 : 48 __ __ PHA
0b18 : a5 4c __ LDA $4c 
0b1a : 48 __ __ PHA
0b1b : a5 4d __ LDA $4d 
0b1d : 48 __ __ PHA
0b1e : a5 4e __ LDA $4e 
0b20 : 48 __ __ PHA
0b21 : a5 4f __ LDA $4f 
0b23 : 48 __ __ PHA
0b24 : a5 50 __ LDA $50 
0b26 : 48 __ __ PHA
.s0:
0b27 : ad f2 1d LDA $1df2 ; (zsm_playing + 0)
0b2a : f0 08 __ BEQ $0b34 ; (irq.s1001 + 0)
.s4:
0b2c : ad f3 1d LDA $1df3 ; (zsm_finished + 0)
0b2f : d0 03 __ BNE $0b34 ; (irq.s1001 + 0)
.s1:
0b31 : 20 5f 0b JSR $0b5f ; (zsm_play.s0 + 0)
.s1001:
0b34 : 68 __ __ PLA
0b35 : 85 50 __ STA $50 
0b37 : 68 __ __ PLA
0b38 : 85 4f __ STA $4f 
0b3a : 68 __ __ PLA
0b3b : 85 4e __ STA $4e 
0b3d : 68 __ __ PLA
0b3e : 85 4d __ STA $4d 
0b40 : 68 __ __ PLA
0b41 : 85 4c __ STA $4c 
0b43 : 68 __ __ PLA
0b44 : 85 4b __ STA $4b 
0b46 : 68 __ __ PLA
0b47 : 85 4a __ STA $4a 
0b49 : 68 __ __ PLA
0b4a : 85 49 __ STA $49 
0b4c : 68 __ __ PLA
0b4d : 85 48 __ STA $48 
0b4f : 68 __ __ PLA
0b50 : 85 47 __ STA T0 + 0 
0b52 : 68 __ __ PLA
0b53 : 85 3c __ STA ACCU + 1 
0b55 : 68 __ __ PLA
0b56 : 85 3b __ STA ACCU + 0 
0b58 : 68 __ __ PLA
0b59 : 85 2e __ STA P1 
0b5b : 68 __ __ PLA
0b5c : 85 2d __ STA P0 
0b5e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1df2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1df3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0b5f : ad f4 1d LDA $1df4 ; (zsm_paused + 0)
0b62 : f0 01 __ BEQ $0b65 ; (zsm_play.s2 + 0)
0b64 : 60 __ __ RTS
.s2:
0b65 : ad 38 44 LDA $4438 ; (zsm_delay + 0)
0b68 : f0 03 __ BEQ $0b6d ; (zsm_play.s5 + 0)
0b6a : 4c 9a 0c JMP $0c9a ; (zsm_play.s4 + 0)
.s5:
0b6d : ad 25 9f LDA $9f25 
0b70 : 85 47 __ STA T0 + 0 
0b72 : ad 25 9f LDA $9f25 
0b75 : 29 fe __ AND #$fe
0b77 : 8d 25 9f STA $9f25 
0b7a : ad 20 9f LDA $9f20 
0b7d : 85 49 __ STA T2 + 0 
0b7f : ad 21 9f LDA $9f21 
0b82 : 85 4a __ STA T2 + 1 
0b84 : ad 22 9f LDA $9f22 
0b87 : 85 48 __ STA T1 + 0 
.l8:
0b89 : ad 39 48 LDA $4839 ; (zsm_pos + 0)
0b8c : 85 4b __ STA T3 + 0 
0b8e : 18 __ __ CLC
0b8f : 69 01 __ ADC #$01
0b91 : 85 4d __ STA T4 + 0 
0b93 : 8d 39 48 STA $4839 ; (zsm_pos + 0)
0b96 : ad 3a 48 LDA $483a ; (zsm_pos + 1)
0b99 : aa __ __ TAX
0b9a : 69 00 __ ADC #$00
0b9c : 85 4e __ STA T4 + 1 
0b9e : 8d 3a 48 STA $483a ; (zsm_pos + 1)
0ba1 : 18 __ __ CLC
0ba2 : a9 39 __ LDA #$39
0ba4 : 65 4b __ ADC T3 + 0 
0ba6 : 85 3b __ STA ACCU + 0 
0ba8 : 8a __ __ TXA
0ba9 : 29 03 __ AND #$03
0bab : 69 44 __ ADC #$44
0bad : 85 3c __ STA ACCU + 1 
0baf : a0 00 __ LDY #$00
0bb1 : b1 3b __ LDA (ACCU + 0),y 
0bb3 : c9 40 __ CMP #$40
0bb5 : b0 03 __ BCS $0bba ; (zsm_play.s12 + 0)
0bb7 : 4c 65 0c JMP $0c65 ; (zsm_play.s11 + 0)
.s12:
0bba : d0 22 __ BNE $0bde ; (zsm_play.s15 + 0)
.s14:
0bbc : 18 __ __ CLC
0bbd : a9 39 __ LDA #$39
0bbf : 65 4d __ ADC T4 + 0 
0bc1 : 85 4b __ STA T3 + 0 
0bc3 : a5 4e __ LDA T4 + 1 
0bc5 : 29 03 __ AND #$03
0bc7 : 69 44 __ ADC #$44
0bc9 : 85 4c __ STA T3 + 1 
0bcb : b1 4b __ LDA (T3 + 0),y 
0bcd : 29 3f __ AND #$3f
0bcf : 18 __ __ CLC
0bd0 : 65 4d __ ADC T4 + 0 
0bd2 : 8d 39 48 STA $4839 ; (zsm_pos + 0)
0bd5 : 98 __ __ TYA
0bd6 : 65 4e __ ADC T4 + 1 
0bd8 : 8d 3a 48 STA $483a ; (zsm_pos + 1)
0bdb : 4c 89 0b JMP $0b89 ; (zsm_play.l8 + 0)
.s15:
0bde : 09 00 __ ORA #$00
0be0 : 30 5b __ BMI $0c3d ; (zsm_play.s18 + 0)
.s17:
0be2 : 29 3f __ AND #$3f
0be4 : f0 a3 __ BEQ $0b89 ; (zsm_play.l8 + 0)
.s29:
0be6 : 84 50 __ STY T7 + 0 
0be8 : 85 4f __ STA T6 + 0 
0bea : 18 __ __ CLC
.l1012:
0beb : a9 39 __ LDA #$39
0bed : 6d 39 48 ADC $4839 ; (zsm_pos + 0)
0bf0 : 85 4d __ STA T4 + 0 
0bf2 : ad 3a 48 LDA $483a ; (zsm_pos + 1)
0bf5 : 29 03 __ AND #$03
0bf7 : 69 44 __ ADC #$44
0bf9 : 85 4e __ STA T4 + 1 
0bfb : a0 00 __ LDY #$00
0bfd : b1 4d __ LDA (T4 + 0),y 
0bff : 85 2d __ STA P0 
0c01 : ad 39 48 LDA $4839 ; (zsm_pos + 0)
0c04 : 18 __ __ CLC
0c05 : 69 01 __ ADC #$01
0c07 : aa __ __ TAX
0c08 : ad 3a 48 LDA $483a ; (zsm_pos + 1)
0c0b : 69 00 __ ADC #$00
0c0d : 29 03 __ AND #$03
0c0f : 85 4c __ STA T3 + 1 
0c11 : 8a __ __ TXA
0c12 : 18 __ __ CLC
0c13 : 69 39 __ ADC #$39
0c15 : 85 4b __ STA T3 + 0 
0c17 : a9 44 __ LDA #$44
0c19 : 65 4c __ ADC T3 + 1 
0c1b : 85 4c __ STA T3 + 1 
0c1d : b1 4b __ LDA (T3 + 0),y 
0c1f : 85 2e __ STA P1 
0c21 : 20 9e 0c JSR $0c9e ; (sfx_put.l1 + 0)
0c24 : ad 39 48 LDA $4839 ; (zsm_pos + 0)
0c27 : 18 __ __ CLC
0c28 : 69 02 __ ADC #$02
0c2a : 8d 39 48 STA $4839 ; (zsm_pos + 0)
0c2d : 90 03 __ BCC $0c32 ; (zsm_play.s1015 + 0)
.s1014:
0c2f : ee 3a 48 INC $483a ; (zsm_pos + 1)
.s1015:
0c32 : e6 50 __ INC T7 + 0 
0c34 : a5 50 __ LDA T7 + 0 
0c36 : c5 4f __ CMP T6 + 0 
0c38 : 90 b1 __ BCC $0beb ; (zsm_play.l1012 + 0)
0c3a : 4c 89 0b JMP $0b89 ; (zsm_play.l8 + 0)
.s18:
0c3d : c9 80 __ CMP #$80
0c3f : d0 07 __ BNE $0c48 ; (zsm_play.s25 + 0)
.s24:
0c41 : a9 01 __ LDA #$01
0c43 : 8d f3 1d STA $1df3 ; (zsm_finished + 0)
0c46 : d0 08 __ BNE $0c50 ; (zsm_play.s10 + 0)
.s25:
0c48 : 29 7f __ AND #$7f
0c4a : 38 __ __ SEC
0c4b : e9 01 __ SBC #$01
0c4d : 8d 38 44 STA $4438 ; (zsm_delay + 0)
.s10:
0c50 : a5 49 __ LDA T2 + 0 
0c52 : 8d 20 9f STA $9f20 
0c55 : a5 4a __ LDA T2 + 1 
0c57 : 8d 21 9f STA $9f21 
0c5a : a5 48 __ LDA T1 + 0 
0c5c : 8d 22 9f STA $9f22 
0c5f : a5 47 __ LDA T0 + 0 
0c61 : 8d 25 9f STA $9f25 
.s1001:
0c64 : 60 __ __ RTS
.s11:
0c65 : 29 3f __ AND #$3f
0c67 : 09 c0 __ ORA #$c0
0c69 : 8d 20 9f STA $9f20 
0c6c : a9 f9 __ LDA #$f9
0c6e : 8d 21 9f STA $9f21 
0c71 : a9 01 __ LDA #$01
0c73 : 8d 22 9f STA $9f22 
0c76 : a5 4b __ LDA T3 + 0 
0c78 : 69 02 __ ADC #$02
0c7a : 8d 39 48 STA $4839 ; (zsm_pos + 0)
0c7d : 90 01 __ BCC $0c80 ; (zsm_play.s1017 + 0)
.s1016:
0c7f : e8 __ __ INX
.s1017:
0c80 : 8e 3a 48 STX $483a ; (zsm_pos + 1)
0c83 : 18 __ __ CLC
0c84 : a9 39 __ LDA #$39
0c86 : 65 4d __ ADC T4 + 0 
0c88 : 85 4b __ STA T3 + 0 
0c8a : a5 4e __ LDA T4 + 1 
0c8c : 29 03 __ AND #$03
0c8e : 69 44 __ ADC #$44
0c90 : 85 4c __ STA T3 + 1 
0c92 : b1 4b __ LDA (T3 + 0),y 
0c94 : 8d 23 9f STA $9f23 
0c97 : 4c 89 0b JMP $0b89 ; (zsm_play.l8 + 0)
.s4:
0c9a : ce 38 44 DEC $4438 ; (zsm_delay + 0)
0c9d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1df4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
4438 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
4439 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
4839 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0c9e : ad 41 9f LDA $9f41 
0ca1 : 30 fb __ BMI $0c9e ; (sfx_put.l1 + 0)
.s3:
0ca3 : a5 2d __ LDA P0 ; (index + 0)
0ca5 : 8d 40 9f STA $9f40 
0ca8 : ea __ __ NOP
0ca9 : ea __ __ NOP
0caa : ea __ __ NOP
0cab : ea __ __ NOP
0cac : a5 2e __ LDA P1 ; (data + 0)
0cae : 8d 41 9f STA $9f41 
.s1001:
0cb1 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0cb2 : a9 93 __ LDA #$93
0cb4 : 85 2d __ STA P0 
0cb6 : a9 00 __ LDA #$00
0cb8 : 85 2e __ STA P1 
0cba : 20 ef 0c JSR $0cef ; (putch.s0 + 0)
0cbd : a9 11 __ LDA #$11
0cbf : 8d 22 9f STA $9f22 
0cc2 : a2 00 __ LDX #$00
.l2:
0cc4 : 8a __ __ TXA
0cc5 : 18 __ __ CLC
0cc6 : 69 b0 __ ADC #$b0
0cc8 : 8d 21 9f STA $9f21 
0ccb : a9 00 __ LDA #$00
0ccd : 8d 20 9f STA $9f20 
0cd0 : a0 80 __ LDY #$80
.l1003:
0cd2 : a9 20 __ LDA #$20
0cd4 : 8d 23 9f STA $9f23 
0cd7 : a9 01 __ LDA #$01
0cd9 : 8d 23 9f STA $9f23 
0cdc : a9 20 __ LDA #$20
0cde : 8d 24 9f STA $9f24 
0ce1 : a9 01 __ LDA #$01
0ce3 : 8d 24 9f STA $9f24 
0ce6 : 88 __ __ DEY
0ce7 : d0 e9 __ BNE $0cd2 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0ce9 : e8 __ __ INX
0cea : e0 40 __ CPX #$40
0cec : 90 d6 __ BCC $0cc4 ; (ClearVERAScreen.l2 + 0)
.s1001:
0cee : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0cef : a5 2d __ LDA P0 
0cf1 : 20 d2 ff JSR $ffd2 
.s1001:
0cf4 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0cf5 : a9 00 __ LDA #$00
0cf7 : 85 2d __ STA P0 
0cf9 : 85 2e __ STA P1 
0cfb : 85 2f __ STA P2 
0cfd : 85 30 __ STA P3 
0cff : 85 31 __ STA P4 
0d01 : 8d 25 9f STA $9f25 
0d04 : ad 29 9f LDA $9f29 
0d07 : 09 70 __ ORA #$70
0d09 : 8d 29 9f STA $9f29 
0d0c : a9 80 __ LDA #$80
0d0e : 8d 2b 9f STA $9f2b 
0d11 : 8d 2a 9f STA $9f2a 
0d14 : a9 62 __ LDA #$62
0d16 : 8d 2d 9f STA $9f2d 
0d19 : a9 60 __ LDA #$60
0d1b : 8d 34 9f STA $9f34 
0d1e : 20 cd 15 JSR $15cd ; (tileBaseConfig.s0 + 0)
0d21 : 8d 2f 9f STA $9f2f 
0d24 : a9 20 __ LDA #$20
0d26 : 85 2f __ STA P2 
0d28 : 20 e6 15 JSR $15e6 ; (memoryToMapMemoryAddress.s0 + 0)
0d2b : 8d 2e 9f STA $9f2e 
0d2e : a9 01 __ LDA #$01
0d30 : 8d 22 9f STA $9f22 
0d33 : a2 80 __ LDX #$80
.l6:
0d35 : a0 50 __ LDY #$50
.l1032:
0d37 : a9 00 __ LDA #$00
0d39 : 8d 24 9f STA $9f24 
0d3c : a9 08 __ LDA #$08
0d3e : 8d 24 9f STA $9f24 
0d41 : 88 __ __ DEY
0d42 : d0 f3 __ BNE $0d37 ; (SetUpSprites.l1032 + 0)
.s1033:
0d44 : ca __ __ DEX
0d45 : d0 ee __ BNE $0d35 ; (SetUpSprites.l6 + 0)
.s4:
0d47 : 86 48 __ STX T1 + 0 
0d49 : a9 00 __ LDA #$00
0d4b : 85 2d __ STA P0 
0d4d : 85 2e __ STA P1 
0d4f : 85 2f __ STA P2 
0d51 : 85 30 __ STA P3 
0d53 : a9 40 __ LDA #$40
0d55 : 85 33 __ STA P6 
0d57 : a9 01 __ LDA #$01
0d59 : 85 34 __ STA P7 
0d5b : a9 f5 __ LDA #$f5
0d5d : 85 31 __ STA P4 
0d5f : a9 1d __ LDA #$1d
0d61 : 85 32 __ STA P5 
0d63 : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
0d66 : a9 10 __ LDA #$10
0d68 : 8d 22 9f STA $9f22 
0d6b : a9 00 __ LDA #$00
0d6d : 8d 20 9f STA $9f20 
0d70 : a9 20 __ LDA #$20
0d72 : 8d 21 9f STA $9f21 
.l10:
0d75 : a9 00 __ LDA #$00
0d77 : 85 49 __ STA T2 + 0 
.l14:
0d79 : 20 2f 16 JSR $162f ; (rand.s0 + 0)
0d7c : a5 3b __ LDA ACCU + 0 
0d7e : 29 1f __ AND #$1f
0d80 : 85 3b __ STA ACCU + 0 
0d82 : a5 48 __ LDA T1 + 0 
0d84 : c9 34 __ CMP #$34
0d86 : 90 03 __ BCC $0d8b ; (SetUpSprites.s1030 + 0)
0d88 : 4c 4b 15 JMP $154b ; (SetUpSprites.s1029 + 0)
.s1030:
0d8b : c9 30 __ CMP #$30
0d8d : b0 03 __ BCS $0d92 ; (SetUpSprites.s17 + 0)
0d8f : 4c 4b 15 JMP $154b ; (SetUpSprites.s1029 + 0)
.s17:
0d92 : a9 04 __ LDA #$04
.s197:
0d94 : 8d 23 9f STA $9f23 
0d97 : a9 00 __ LDA #$00
0d99 : 8d 23 9f STA $9f23 
0d9c : e6 49 __ INC T2 + 0 
0d9e : 10 d9 __ BPL $0d79 ; (SetUpSprites.l14 + 0)
.s11:
0da0 : e6 48 __ INC T1 + 0 
0da2 : a5 48 __ LDA T1 + 0 
0da4 : c9 3c __ CMP #$3c
0da6 : 90 cd __ BCC $0d75 ; (SetUpSprites.l10 + 0)
.s12:
0da8 : a9 00 __ LDA #$00
0daa : 85 2d __ STA P0 
0dac : 85 30 __ STA P3 
0dae : 85 33 __ STA P6 
0db0 : a9 31 __ LDA #$31
0db2 : 85 2e __ STA P1 
0db4 : a9 01 __ LDA #$01
0db6 : 85 2f __ STA P2 
0db8 : a9 04 __ LDA #$04
0dba : 85 34 __ STA P7 
0dbc : a9 37 __ LDA #$37
0dbe : 85 31 __ STA P4 
0dc0 : a9 1f __ LDA #$1f
0dc2 : 85 32 __ STA P5 
0dc4 : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
0dc7 : a9 00 __ LDA #$00
0dc9 : 85 4d __ STA T5 + 0 
0dcb : 85 4e __ STA T5 + 1 
.l52:
0dcd : 85 2d __ STA P0 
0dcf : 18 __ __ CLC
0dd0 : 69 02 __ ADC #$02
0dd2 : 85 4b __ STA T4 + 0 
0dd4 : a9 00 __ LDA #$00
0dd6 : 2a __ __ ROL
0dd7 : 85 4c __ STA T4 + 1 
0dd9 : a9 88 __ LDA #$88
0ddb : 85 2e __ STA P1 
0ddd : a9 09 __ LDA #$09
0ddf : 85 2f __ STA P2 
0de1 : a9 00 __ LDA #$00
0de3 : 85 30 __ STA P3 
0de5 : a9 03 __ LDA #$03
0de7 : 85 31 __ STA P4 
0de9 : 85 33 __ STA P6 
0deb : a9 01 __ LDA #$01
0ded : 85 32 __ STA P5 
0def : 85 34 __ STA P7 
0df1 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
0df4 : a5 4d __ LDA T5 + 0 
0df6 : 85 2e __ STA P1 
0df8 : a5 4e __ LDA T5 + 1 
0dfa : 85 2f __ STA P2 
0dfc : a9 a0 __ LDA #$a0
0dfe : 85 30 __ STA P3 
0e00 : a9 01 __ LDA #$01
0e02 : 85 31 __ STA P4 
0e04 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
0e07 : a9 00 __ LDA #$00
0e09 : 85 2e __ STA P1 
0e0b : a9 01 __ LDA #$01
0e0d : 85 2f __ STA P2 
0e0f : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
0e12 : a9 88 __ LDA #$88
0e14 : 85 2e __ STA P1 
0e16 : a9 09 __ LDA #$09
0e18 : 85 2f __ STA P2 
0e1a : a9 00 __ LDA #$00
0e1c : 85 30 __ STA P3 
0e1e : a9 03 __ LDA #$03
0e20 : 85 31 __ STA P4 
0e22 : e6 2d __ INC P0 
0e24 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
0e27 : a5 4d __ LDA T5 + 0 
0e29 : 85 2e __ STA P1 
0e2b : a5 4e __ LDA T5 + 1 
0e2d : 85 2f __ STA P2 
0e2f : a9 70 __ LDA #$70
0e31 : 85 30 __ STA P3 
0e33 : a9 01 __ LDA #$01
0e35 : 85 31 __ STA P4 
0e37 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
0e3a : a5 4c __ LDA T4 + 1 
0e3c : d0 16 __ BNE $0e54 ; (SetUpSprites.s54 + 0)
.s1016:
0e3e : 18 __ __ CLC
0e3f : a5 2e __ LDA P1 
0e41 : 69 40 __ ADC #$40
0e43 : 85 4d __ STA T5 + 0 
0e45 : a5 2f __ LDA P2 
0e47 : 69 00 __ ADC #$00
0e49 : 85 4e __ STA T5 + 1 
0e4b : a5 4b __ LDA T4 + 0 
0e4d : c9 14 __ CMP #$14
0e4f : b0 03 __ BCS $0e54 ; (SetUpSprites.s54 + 0)
0e51 : 4c cd 0d JMP $0dcd ; (SetUpSprites.l52 + 0)
.s54:
0e54 : a9 00 __ LDA #$00
0e56 : 85 2d __ STA P0 
0e58 : 85 30 __ STA P3 
0e5a : 85 33 __ STA P6 
0e5c : a9 30 __ LDA #$30
0e5e : 85 2e __ STA P1 
0e60 : a9 01 __ LDA #$01
0e62 : 85 2f __ STA P2 
0e64 : a9 00 __ LDA #$00
0e66 : 85 31 __ STA P4 
0e68 : a9 24 __ LDA #$24
0e6a : 85 32 __ STA P5 
0e6c : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
0e6f : a9 16 __ LDA #$16
0e71 : 85 2d __ STA P0 
0e73 : a9 80 __ LDA #$80
0e75 : 85 2e __ STA P1 
0e77 : a9 09 __ LDA #$09
0e79 : 85 2f __ STA P2 
0e7b : a9 01 __ LDA #$01
0e7d : 85 31 __ STA P4 
0e7f : 85 34 __ STA P7 
0e81 : a9 02 __ LDA #$02
0e83 : 85 32 __ STA P5 
0e85 : a9 03 __ LDA #$03
0e87 : 85 33 __ STA P6 
0e89 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
0e8c : a9 30 __ LDA #$30
0e8e : 85 2e __ STA P1 
0e90 : a9 01 __ LDA #$01
0e92 : 85 2f __ STA P2 
0e94 : a9 b8 __ LDA #$b8
0e96 : 85 30 __ STA P3 
0e98 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
0e9b : a9 20 __ LDA #$20
0e9d : 85 2d __ STA P0 
0e9f : a9 35 __ LDA #$35
0ea1 : 85 2e __ STA P1 
0ea3 : a9 00 __ LDA #$00
0ea5 : 85 30 __ STA P3 
0ea7 : 85 33 __ STA P6 
0ea9 : a9 02 __ LDA #$02
0eab : 85 34 __ STA P7 
0ead : a9 00 __ LDA #$00
0eaf : 85 31 __ STA P4 
0eb1 : a9 25 __ LDA #$25
0eb3 : 85 32 __ STA P5 
0eb5 : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
0eb8 : a9 17 __ LDA #$17
0eba : 85 2d __ STA P0 
0ebc : a9 a9 __ LDA #$a9
0ebe : 85 2e __ STA P1 
0ec0 : a9 09 __ LDA #$09
0ec2 : 85 2f __ STA P2 
0ec4 : a9 02 __ LDA #$02
0ec6 : 85 31 __ STA P4 
0ec8 : 85 32 __ STA P5 
0eca : a9 03 __ LDA #$03
0ecc : 85 33 __ STA P6 
0ece : a9 01 __ LDA #$01
0ed0 : 85 34 __ STA P7 
0ed2 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
0ed5 : a9 fc __ LDA #$fc
0ed7 : 85 2e __ STA P1 
0ed9 : a9 00 __ LDA #$00
0edb : 85 2f __ STA P2 
0edd : a9 b8 __ LDA #$b8
0edf : 85 30 __ STA P3 
0ee1 : a9 01 __ LDA #$01
0ee3 : 85 31 __ STA P4 
0ee5 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
0ee8 : a9 18 __ LDA #$18
0eea : 85 2d __ STA P0 
0eec : a9 a9 __ LDA #$a9
0eee : 85 2e __ STA P1 
0ef0 : a9 09 __ LDA #$09
0ef2 : 85 2f __ STA P2 
0ef4 : a9 00 __ LDA #$00
0ef6 : 85 30 __ STA P3 
0ef8 : a9 02 __ LDA #$02
0efa : 85 31 __ STA P4 
0efc : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
0eff : a9 4c __ LDA #$4c
0f01 : 85 2e __ STA P1 
0f03 : a9 01 __ LDA #$01
0f05 : 85 2f __ STA P2 
0f07 : 85 31 __ STA P4 
0f09 : a9 b8 __ LDA #$b8
0f0b : 85 30 __ STA P3 
0f0d : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
0f10 : a9 01 __ LDA #$01
0f12 : 85 2e __ STA P1 
0f14 : a9 00 __ LDA #$00
0f16 : 85 2f __ STA P2 
0f18 : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
0f1b : a9 10 __ LDA #$10
0f1d : 85 2d __ STA P0 
0f1f : a9 20 __ LDA #$20
0f21 : 85 30 __ STA P3 
0f23 : a9 00 __ LDA #$00
0f25 : 85 31 __ STA P4 
0f27 : a9 37 __ LDA #$37
0f29 : 85 2e __ STA P1 
0f2b : a9 23 __ LDA #$23
0f2d : 85 2f __ STA P2 
0f2f : 20 29 17 JSR $1729 ; (vera_pal_putn.s0 + 0)
0f32 : a9 00 __ LDA #$00
0f34 : 85 2d __ STA P0 
0f36 : 85 30 __ STA P3 
0f38 : 85 34 __ STA P7 
0f3a : a9 35 __ LDA #$35
0f3c : 85 2e __ STA P1 
0f3e : a9 01 __ LDA #$01
0f40 : 85 2f __ STA P2 
0f42 : a9 20 __ LDA #$20
0f44 : 85 33 __ STA P6 
0f46 : a9 57 __ LDA #$57
0f48 : 85 31 __ STA P4 
0f4a : a9 23 __ LDA #$23
0f4c : 85 32 __ STA P5 
0f4e : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
0f51 : a9 00 __ LDA #$00
0f53 : 85 48 __ STA T1 + 0 
0f55 : 85 49 __ STA T2 + 0 
0f57 : a9 03 __ LDA #$03
0f59 : 85 33 __ STA P6 
0f5b : a9 02 __ LDA #$02
0f5d : 85 34 __ STA P7 
0f5f : 18 __ __ CLC
.l1046:
0f60 : a9 a8 __ LDA #$a8
0f62 : 85 2e __ STA P1 
0f64 : a9 09 __ LDA #$09
0f66 : 85 2f __ STA P2 
0f68 : a9 00 __ LDA #$00
0f6a : 85 30 __ STA P3 
0f6c : 85 31 __ STA P4 
0f6e : 85 32 __ STA P5 
0f70 : a5 48 __ LDA T1 + 0 
0f72 : 69 19 __ ADC #$19
0f74 : 85 2d __ STA P0 
0f76 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
0f79 : a9 b8 __ LDA #$b8
0f7b : 85 30 __ STA P3 
0f7d : a9 01 __ LDA #$01
0f7f : 85 31 __ STA P4 
0f81 : 38 __ __ SEC
0f82 : a5 49 __ LDA T2 + 0 
0f84 : e9 fc __ SBC #$fc
0f86 : 85 2e __ STA P1 
0f88 : a9 00 __ LDA #$00
0f8a : e9 03 __ SBC #$03
0f8c : 85 2f __ STA P2 
0f8e : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
0f91 : 18 __ __ CLC
0f92 : a5 49 __ LDA T2 + 0 
0f94 : 69 0c __ ADC #$0c
0f96 : 85 49 __ STA T2 + 0 
0f98 : e6 48 __ INC T1 + 0 
0f9a : a5 48 __ LDA T1 + 0 
0f9c : c9 08 __ CMP #$08
0f9e : 90 c0 __ BCC $0f60 ; (SetUpSprites.l1046 + 0)
.s58:
0fa0 : a9 00 __ LDA #$00
0fa2 : 85 48 __ STA T1 + 0 
0fa4 : 85 49 __ STA T2 + 0 
0fa6 : a9 03 __ LDA #$03
0fa8 : 85 33 __ STA P6 
0faa : 85 34 __ STA P7 
0fac : 18 __ __ CLC
.l1048:
0fad : a9 a8 __ LDA #$a8
0faf : 85 2e __ STA P1 
0fb1 : a9 09 __ LDA #$09
0fb3 : 85 2f __ STA P2 
0fb5 : a9 00 __ LDA #$00
0fb7 : 85 30 __ STA P3 
0fb9 : 85 31 __ STA P4 
0fbb : a5 48 __ LDA T1 + 0 
0fbd : 69 21 __ ADC #$21
0fbf : 85 2d __ STA P0 
0fc1 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
0fc4 : a9 c4 __ LDA #$c4
0fc6 : 85 30 __ STA P3 
0fc8 : a9 01 __ LDA #$01
0fca : 85 31 __ STA P4 
0fcc : 38 __ __ SEC
0fcd : a5 49 __ LDA T2 + 0 
0fcf : e9 fc __ SBC #$fc
0fd1 : 85 2e __ STA P1 
0fd3 : a9 00 __ LDA #$00
0fd5 : e9 03 __ SBC #$03
0fd7 : 85 2f __ STA P2 
0fd9 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
0fdc : 18 __ __ CLC
0fdd : a5 49 __ LDA T2 + 0 
0fdf : 69 0c __ ADC #$0c
0fe1 : 85 49 __ STA T2 + 0 
0fe3 : e6 48 __ INC T1 + 0 
0fe5 : a5 48 __ LDA T1 + 0 
0fe7 : c9 08 __ CMP #$08
0fe9 : 90 c2 __ BCC $0fad ; (SetUpSprites.l1048 + 0)
.s62:
0feb : a9 00 __ LDA #$00
0fed : 85 48 __ STA T1 + 0 
0fef : 85 49 __ STA T2 + 0 
0ff1 : a9 03 __ LDA #$03
0ff3 : 85 33 __ STA P6 
0ff5 : a9 04 __ LDA #$04
0ff7 : 85 34 __ STA P7 
0ff9 : 18 __ __ CLC
.l1050:
0ffa : a9 a8 __ LDA #$a8
0ffc : 85 2e __ STA P1 
0ffe : a9 09 __ LDA #$09
1000 : 85 2f __ STA P2 
1002 : a9 00 __ LDA #$00
1004 : 85 30 __ STA P3 
1006 : 85 31 __ STA P4 
1008 : a5 48 __ LDA T1 + 0 
100a : 69 29 __ ADC #$29
100c : 85 2d __ STA P0 
100e : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
1011 : a9 b8 __ LDA #$b8
1013 : 85 30 __ STA P3 
1015 : a9 01 __ LDA #$01
1017 : 85 31 __ STA P4 
1019 : 38 __ __ SEC
101a : a9 6c __ LDA #$6c
101c : e5 49 __ SBC T2 + 0 
101e : 85 2e __ STA P1 
1020 : a9 02 __ LDA #$02
1022 : e9 04 __ SBC #$04
1024 : 85 2f __ STA P2 
1026 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1029 : 18 __ __ CLC
102a : a5 49 __ LDA T2 + 0 
102c : 69 0c __ ADC #$0c
102e : 85 49 __ STA T2 + 0 
1030 : e6 48 __ INC T1 + 0 
1032 : a5 48 __ LDA T1 + 0 
1034 : c9 08 __ CMP #$08
1036 : 90 c2 __ BCC $0ffa ; (SetUpSprites.l1050 + 0)
.s66:
1038 : a9 00 __ LDA #$00
103a : 85 48 __ STA T1 + 0 
.l68:
103c : 38 __ __ SEC
103d : a9 00 __ LDA #$00
103f : e5 48 __ SBC T1 + 0 
1041 : 29 0c __ AND #$0c
1043 : 49 ff __ EOR #$ff
1045 : 38 __ __ SEC
1046 : 69 6c __ ADC #$6c
1048 : 85 49 __ STA T2 + 0 
104a : a9 02 __ LDA #$02
104c : e9 00 __ SBC #$00
104e : 85 4a __ STA T2 + 1 
1050 : 18 __ __ CLC
1051 : a5 48 __ LDA T1 + 0 
1053 : 69 31 __ ADC #$31
1055 : 85 2d __ STA P0 
1057 : a9 02 __ LDA #$02
1059 : 85 4f __ STA T7 + 0 
105b : a9 03 __ LDA #$03
105d : 85 33 __ STA P6 
105f : a9 04 __ LDA #$04
1061 : 85 34 __ STA P7 
.l1040:
1063 : a9 a8 __ LDA #$a8
1065 : 85 2e __ STA P1 
1067 : a9 09 __ LDA #$09
1069 : 85 2f __ STA P2 
106b : a9 00 __ LDA #$00
106d : 85 30 __ STA P3 
106f : 85 31 __ STA P4 
1071 : 85 32 __ STA P5 
1073 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
1076 : a5 49 __ LDA T2 + 0 
1078 : 85 2e __ STA P1 
107a : a5 4a __ LDA T2 + 1 
107c : 85 2f __ STA P2 
107e : a9 b8 __ LDA #$b8
1080 : 85 30 __ STA P3 
1082 : a9 01 __ LDA #$01
1084 : 85 31 __ STA P4 
1086 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1089 : c6 4f __ DEC T7 + 0 
108b : d0 d6 __ BNE $1063 ; (SetUpSprites.l1040 + 0)
.s69:
108d : e6 48 __ INC T1 + 0 
108f : a5 48 __ LDA T1 + 0 
1091 : c9 02 __ CMP #$02
1093 : 90 a7 __ BCC $103c ; (SetUpSprites.l68 + 0)
.s70:
1095 : a9 60 __ LDA #$60
1097 : 85 2d __ STA P0 
1099 : a9 4f __ LDA #$4f
109b : 85 2e __ STA P1 
109d : a9 01 __ LDA #$01
109f : 85 2f __ STA P2 
10a1 : 85 34 __ STA P7 
10a3 : a9 00 __ LDA #$00
10a5 : 85 30 __ STA P3 
10a7 : 85 33 __ STA P6 
10a9 : a9 00 __ LDA #$00
10ab : 85 31 __ STA P4 
10ad : a9 27 __ LDA #$27
10af : 85 32 __ STA P5 
10b1 : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
10b4 : a9 33 __ LDA #$33
10b6 : 85 2d __ STA P0 
10b8 : a9 7b __ LDA #$7b
10ba : 85 2e __ STA P1 
10bc : a9 0a __ LDA #$0a
10be : 85 2f __ STA P2 
10c0 : a9 01 __ LDA #$01
10c2 : 85 31 __ STA P4 
10c4 : a9 02 __ LDA #$02
10c6 : 85 32 __ STA P5 
10c8 : a9 03 __ LDA #$03
10ca : 85 33 __ STA P6 
10cc : a9 06 __ LDA #$06
10ce : 85 34 __ STA P7 
10d0 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
10d3 : a9 00 __ LDA #$00
10d5 : 85 2e __ STA P1 
10d7 : 85 31 __ STA P4 
10d9 : a9 01 __ LDA #$01
10db : 85 2f __ STA P2 
10dd : a9 78 __ LDA #$78
10df : 85 30 __ STA P3 
10e1 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
10e4 : a9 20 __ LDA #$20
10e6 : 85 2d __ STA P0 
10e8 : a9 3f __ LDA #$3f
10ea : 85 2e __ STA P1 
10ec : a9 00 __ LDA #$00
10ee : 85 30 __ STA P3 
10f0 : 85 33 __ STA P6 
10f2 : a9 04 __ LDA #$04
10f4 : 85 34 __ STA P7 
10f6 : a9 00 __ LDA #$00
10f8 : 85 31 __ STA P4 
10fa : a9 28 __ LDA #$28
10fc : 85 32 __ STA P5 
10fe : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
1101 : a9 34 __ LDA #$34
1103 : 85 2d __ STA P0 
1105 : a9 f9 __ LDA #$f9
1107 : 85 2e __ STA P1 
1109 : a9 09 __ LDA #$09
110b : 85 2f __ STA P2 
110d : a9 03 __ LDA #$03
110f : 85 31 __ STA P4 
1111 : 85 33 __ STA P6 
1113 : a9 02 __ LDA #$02
1115 : 85 32 __ STA P5 
1117 : a9 05 __ LDA #$05
1119 : 85 34 __ STA P7 
111b : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
111e : a9 00 __ LDA #$00
1120 : 85 2e __ STA P1 
1122 : 85 31 __ STA P4 
1124 : a9 01 __ LDA #$01
1126 : 85 2f __ STA P2 
1128 : a9 78 __ LDA #$78
112a : 85 30 __ STA P3 
112c : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
112f : a9 35 __ LDA #$35
1131 : 85 2d __ STA P0 
1133 : a9 19 __ LDA #$19
1135 : 85 2e __ STA P1 
1137 : a9 0a __ LDA #$0a
1139 : 85 2f __ STA P2 
113b : a9 00 __ LDA #$00
113d : 85 30 __ STA P3 
113f : a9 03 __ LDA #$03
1141 : 85 31 __ STA P4 
1143 : a9 07 __ LDA #$07
1145 : 85 33 __ STA P6 
1147 : a9 06 __ LDA #$06
1149 : 85 34 __ STA P7 
114b : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
114e : a9 00 __ LDA #$00
1150 : 85 2e __ STA P1 
1152 : 85 31 __ STA P4 
1154 : a9 01 __ LDA #$01
1156 : 85 2f __ STA P2 
1158 : a9 e8 __ LDA #$e8
115a : 85 30 __ STA P3 
115c : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
115f : a9 36 __ LDA #$36
1161 : 85 2d __ STA P0 
1163 : a9 19 __ LDA #$19
1165 : 85 2e __ STA P1 
1167 : a9 0a __ LDA #$0a
1169 : 85 2f __ STA P2 
116b : a9 00 __ LDA #$00
116d : 85 30 __ STA P3 
116f : a9 03 __ LDA #$03
1171 : 85 31 __ STA P4 
1173 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
1176 : a9 40 __ LDA #$40
1178 : 85 2e __ STA P1 
117a : a9 01 __ LDA #$01
117c : 85 2f __ STA P2 
117e : a9 e8 __ LDA #$e8
1180 : 85 30 __ STA P3 
1182 : a9 00 __ LDA #$00
1184 : 85 31 __ STA P4 
1186 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1189 : a9 01 __ LDA #$01
118b : 85 2e __ STA P1 
118d : a9 00 __ LDA #$00
118f : 85 2f __ STA P2 
1191 : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
1194 : a9 37 __ LDA #$37
1196 : 85 2d __ STA P0 
1198 : a9 19 __ LDA #$19
119a : 85 2e __ STA P1 
119c : a9 0a __ LDA #$0a
119e : 85 2f __ STA P2 
11a0 : a9 00 __ LDA #$00
11a2 : 85 30 __ STA P3 
11a4 : a9 03 __ LDA #$03
11a6 : 85 31 __ STA P4 
11a8 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
11ab : a9 00 __ LDA #$00
11ad : 85 2e __ STA P1 
11af : a9 01 __ LDA #$01
11b1 : 85 2f __ STA P2 
11b3 : 85 31 __ STA P4 
11b5 : a9 08 __ LDA #$08
11b7 : 85 30 __ STA P3 
11b9 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
11bc : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
11bf : a9 38 __ LDA #$38
11c1 : 85 2d __ STA P0 
11c3 : a9 19 __ LDA #$19
11c5 : 85 2e __ STA P1 
11c7 : a9 0a __ LDA #$0a
11c9 : 85 2f __ STA P2 
11cb : a9 00 __ LDA #$00
11cd : 85 30 __ STA P3 
11cf : a9 03 __ LDA #$03
11d1 : 85 31 __ STA P4 
11d3 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
11d6 : a9 40 __ LDA #$40
11d8 : 85 2e __ STA P1 
11da : a9 01 __ LDA #$01
11dc : 85 2f __ STA P2 
11de : 85 31 __ STA P4 
11e0 : a9 08 __ LDA #$08
11e2 : 85 30 __ STA P3 
11e4 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
11e7 : a9 01 __ LDA #$01
11e9 : 85 2e __ STA P1 
11eb : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
11ee : a9 20 __ LDA #$20
11f0 : 85 2d __ STA P0 
11f2 : a9 37 __ LDA #$37
11f4 : 85 2e __ STA P1 
11f6 : a9 00 __ LDA #$00
11f8 : 85 30 __ STA P3 
11fa : 85 33 __ STA P6 
11fc : a9 08 __ LDA #$08
11fe : 85 34 __ STA P7 
1200 : a9 00 __ LDA #$00
1202 : 85 31 __ STA P4 
1204 : a9 2c __ LDA #$2c
1206 : 85 32 __ STA P5 
1208 : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
120b : a9 00 __ LDA #$00
120d : 85 48 __ STA T1 + 0 
120f : 85 49 __ STA T2 + 0 
1211 : 85 4a __ STA T2 + 1 
1213 : a9 02 __ LDA #$02
1215 : 85 33 __ STA P6 
1217 : a9 05 __ LDA #$05
1219 : 85 34 __ STA P7 
121b : 18 __ __ CLC
.l1052:
121c : a9 b9 __ LDA #$b9
121e : 85 2e __ STA P1 
1220 : a9 09 __ LDA #$09
1222 : 85 2f __ STA P2 
1224 : a9 00 __ LDA #$00
1226 : 85 30 __ STA P3 
1228 : a9 03 __ LDA #$03
122a : 85 31 __ STA P4 
122c : 85 32 __ STA P5 
122e : a5 48 __ LDA T1 + 0 
1230 : 69 39 __ ADC #$39
1232 : 85 2d __ STA P0 
1234 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
1237 : a9 20 __ LDA #$20
1239 : 85 2e __ STA P1 
123b : a9 01 __ LDA #$01
123d : 85 2f __ STA P2 
123f : 38 __ __ SEC
1240 : a5 49 __ LDA T2 + 0 
1242 : e9 40 __ SBC #$40
1244 : 85 30 __ STA P3 
1246 : a5 4a __ LDA T2 + 1 
1248 : e9 00 __ SBC #$00
124a : 85 31 __ STA P4 
124c : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
124f : 18 __ __ CLC
1250 : a5 49 __ LDA T2 + 0 
1252 : 69 40 __ ADC #$40
1254 : 85 49 __ STA T2 + 0 
1256 : 90 02 __ BCC $125a ; (SetUpSprites.s1055 + 0)
.s1054:
1258 : e6 4a __ INC T2 + 1 
.s1055:
125a : e6 48 __ INC T1 + 0 
125c : a5 48 __ LDA T1 + 0 
125e : c9 07 __ CMP #$07
1260 : 90 ba __ BCC $121c ; (SetUpSprites.l1052 + 0)
.s78:
1262 : a9 20 __ LDA #$20
1264 : 85 2d __ STA P0 
1266 : a9 47 __ LDA #$47
1268 : 85 2e __ STA P1 
126a : a9 00 __ LDA #$00
126c : 85 30 __ STA P3 
126e : 85 33 __ STA P6 
1270 : a9 08 __ LDA #$08
1272 : 85 34 __ STA P7 
1274 : a9 00 __ LDA #$00
1276 : 85 31 __ STA P4 
1278 : a9 34 __ LDA #$34
127a : 85 32 __ STA P5 
127c : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
127f : a9 47 __ LDA #$47
1281 : 85 2d __ STA P0 
1283 : a9 39 __ LDA #$39
1285 : 85 2e __ STA P1 
1287 : a9 0a __ LDA #$0a
1289 : 85 2f __ STA P2 
128b : a9 03 __ LDA #$03
128d : 85 31 __ STA P4 
128f : 85 32 __ STA P5 
1291 : a9 07 __ LDA #$07
1293 : 85 33 __ STA P6 
1295 : a9 06 __ LDA #$06
1297 : 85 34 __ STA P7 
1299 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
129c : a9 08 __ LDA #$08
129e : 85 2e __ STA P1 
12a0 : 85 30 __ STA P3 
12a2 : a9 00 __ LDA #$00
12a4 : 85 2f __ STA P2 
12a6 : 85 31 __ STA P4 
12a8 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
12ab : a9 48 __ LDA #$48
12ad : 85 2d __ STA P0 
12af : a9 39 __ LDA #$39
12b1 : 85 2e __ STA P1 
12b3 : a9 0a __ LDA #$0a
12b5 : 85 2f __ STA P2 
12b7 : a9 00 __ LDA #$00
12b9 : 85 30 __ STA P3 
12bb : a9 03 __ LDA #$03
12bd : 85 31 __ STA P4 
12bf : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
12c2 : a9 48 __ LDA #$48
12c4 : 85 2e __ STA P1 
12c6 : a9 00 __ LDA #$00
12c8 : 85 2f __ STA P2 
12ca : 85 31 __ STA P4 
12cc : a9 08 __ LDA #$08
12ce : 85 30 __ STA P3 
12d0 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
12d3 : a9 01 __ LDA #$01
12d5 : 85 2e __ STA P1 
12d7 : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
12da : a9 49 __ LDA #$49
12dc : 85 2d __ STA P0 
12de : a9 39 __ LDA #$39
12e0 : 85 2e __ STA P1 
12e2 : a9 0a __ LDA #$0a
12e4 : 85 2f __ STA P2 
12e6 : a9 00 __ LDA #$00
12e8 : 85 30 __ STA P3 
12ea : a9 03 __ LDA #$03
12ec : 85 31 __ STA P4 
12ee : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
12f1 : a9 48 __ LDA #$48
12f3 : 85 2e __ STA P1 
12f5 : 85 30 __ STA P3 
12f7 : a9 00 __ LDA #$00
12f9 : 85 2f __ STA P2 
12fb : 85 31 __ STA P4 
12fd : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1300 : a9 01 __ LDA #$01
1302 : 85 2e __ STA P1 
1304 : 85 2f __ STA P2 
1306 : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
1309 : a9 4a __ LDA #$4a
130b : 85 2d __ STA P0 
130d : a9 39 __ LDA #$39
130f : 85 2e __ STA P1 
1311 : a9 0a __ LDA #$0a
1313 : 85 2f __ STA P2 
1315 : a9 00 __ LDA #$00
1317 : 85 30 __ STA P3 
1319 : a9 03 __ LDA #$03
131b : 85 31 __ STA P4 
131d : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
1320 : a9 08 __ LDA #$08
1322 : 85 2e __ STA P1 
1324 : a9 00 __ LDA #$00
1326 : 85 2f __ STA P2 
1328 : 85 31 __ STA P4 
132a : a9 48 __ LDA #$48
132c : 85 30 __ STA P3 
132e : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1331 : a9 00 __ LDA #$00
1333 : 85 2e __ STA P1 
1335 : a9 01 __ LDA #$01
1337 : 85 2f __ STA P2 
1339 : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
133c : a9 20 __ LDA #$20
133e : 85 2d __ STA P0 
1340 : a9 47 __ LDA #$47
1342 : 85 2e __ STA P1 
1344 : a9 00 __ LDA #$00
1346 : 85 30 __ STA P3 
1348 : a9 00 __ LDA #$00
134a : 85 31 __ STA P4 
134c : a9 34 __ LDA #$34
134e : 85 32 __ STA P5 
1350 : a9 00 __ LDA #$00
1352 : 85 33 __ STA P6 
1354 : a9 08 __ LDA #$08
1356 : 85 34 __ STA P7 
1358 : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
135b : a9 4b __ LDA #$4b
135d : 85 2d __ STA P0 
135f : a9 39 __ LDA #$39
1361 : 85 2e __ STA P1 
1363 : a9 0a __ LDA #$0a
1365 : 85 2f __ STA P2 
1367 : a9 03 __ LDA #$03
1369 : 85 31 __ STA P4 
136b : 85 32 __ STA P5 
136d : a9 07 __ LDA #$07
136f : 85 33 __ STA P6 
1371 : a9 06 __ LDA #$06
1373 : 85 34 __ STA P7 
1375 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
1378 : a9 f8 __ LDA #$f8
137a : 85 2e __ STA P1 
137c : a9 01 __ LDA #$01
137e : 85 2f __ STA P2 
1380 : a9 08 __ LDA #$08
1382 : 85 30 __ STA P3 
1384 : a9 00 __ LDA #$00
1386 : 85 31 __ STA P4 
1388 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
138b : a9 4c __ LDA #$4c
138d : 85 2d __ STA P0 
138f : a9 39 __ LDA #$39
1391 : 85 2e __ STA P1 
1393 : a9 0a __ LDA #$0a
1395 : 85 2f __ STA P2 
1397 : a9 00 __ LDA #$00
1399 : 85 30 __ STA P3 
139b : a9 03 __ LDA #$03
139d : 85 31 __ STA P4 
139f : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
13a2 : a9 38 __ LDA #$38
13a4 : 85 2e __ STA P1 
13a6 : a9 02 __ LDA #$02
13a8 : 85 2f __ STA P2 
13aa : a9 08 __ LDA #$08
13ac : 85 30 __ STA P3 
13ae : a9 00 __ LDA #$00
13b0 : 85 31 __ STA P4 
13b2 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
13b5 : a9 01 __ LDA #$01
13b7 : 85 2e __ STA P1 
13b9 : a9 00 __ LDA #$00
13bb : 85 2f __ STA P2 
13bd : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
13c0 : a9 4d __ LDA #$4d
13c2 : 85 2d __ STA P0 
13c4 : a9 39 __ LDA #$39
13c6 : 85 2e __ STA P1 
13c8 : a9 0a __ LDA #$0a
13ca : 85 2f __ STA P2 
13cc : a9 00 __ LDA #$00
13ce : 85 30 __ STA P3 
13d0 : a9 03 __ LDA #$03
13d2 : 85 31 __ STA P4 
13d4 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
13d7 : a9 38 __ LDA #$38
13d9 : 85 2e __ STA P1 
13db : a9 02 __ LDA #$02
13dd : 85 2f __ STA P2 
13df : a9 48 __ LDA #$48
13e1 : 85 30 __ STA P3 
13e3 : a9 00 __ LDA #$00
13e5 : 85 31 __ STA P4 
13e7 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
13ea : a9 01 __ LDA #$01
13ec : 85 2e __ STA P1 
13ee : 85 2f __ STA P2 
13f0 : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
13f3 : a9 4e __ LDA #$4e
13f5 : 85 2d __ STA P0 
13f7 : a9 39 __ LDA #$39
13f9 : 85 2e __ STA P1 
13fb : a9 0a __ LDA #$0a
13fd : 85 2f __ STA P2 
13ff : a9 00 __ LDA #$00
1401 : 85 30 __ STA P3 
1403 : a9 03 __ LDA #$03
1405 : 85 31 __ STA P4 
1407 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
140a : a9 f8 __ LDA #$f8
140c : 85 2e __ STA P1 
140e : a9 01 __ LDA #$01
1410 : 85 2f __ STA P2 
1412 : a9 48 __ LDA #$48
1414 : 85 30 __ STA P3 
1416 : a9 00 __ LDA #$00
1418 : 85 31 __ STA P4 
141a : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
141d : a9 00 __ LDA #$00
141f : 85 2e __ STA P1 
1421 : 20 ec 16 JSR $16ec ; (vera_spr_flip.s0 + 0)
1424 : a9 60 __ LDA #$60
1426 : 85 2d __ STA P0 
1428 : a9 51 __ LDA #$51
142a : 85 2e __ STA P1 
142c : a9 00 __ LDA #$00
142e : 85 30 __ STA P3 
1430 : 85 33 __ STA P6 
1432 : a9 02 __ LDA #$02
1434 : 85 34 __ STA P7 
1436 : a9 00 __ LDA #$00
1438 : 85 31 __ STA P4 
143a : a9 3c __ LDA #$3c
143c : 85 32 __ STA P5 
143e : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
1441 : a9 a0 __ LDA #$a0
1443 : 85 2d __ STA P0 
1445 : a9 50 __ LDA #$50
1447 : 85 2e __ STA P1 
1449 : a9 80 __ LDA #$80
144b : 85 33 __ STA P6 
144d : a9 00 __ LDA #$00
144f : 85 34 __ STA P7 
1451 : a9 77 __ LDA #$77
1453 : 85 31 __ STA P4 
1455 : a9 23 __ LDA #$23
1457 : 85 32 __ STA P5 
1459 : 20 f4 15 JSR $15f4 ; (vram_putn.s0 + 0)
145c : a9 00 __ LDA #$00
145e : 85 47 __ STA T0 + 0 
.l80:
1460 : a9 85 __ LDA #$85
1462 : 85 2e __ STA P1 
1464 : a9 0a __ LDA #$0a
1466 : 85 2f __ STA P2 
1468 : a9 01 __ LDA #$01
146a : 85 31 __ STA P4 
146c : 85 32 __ STA P5 
146e : a9 02 __ LDA #$02
1470 : 85 33 __ STA P6 
1472 : a9 08 __ LDA #$08
1474 : 85 34 __ STA P7 
1476 : 18 __ __ CLC
1477 : a5 47 __ LDA T0 + 0 
1479 : 69 4f __ ADC #$4f
147b : 85 2d __ STA P0 
147d : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
1480 : a5 47 __ LDA T0 + 0 
1482 : c9 0f __ CMP #$0f
1484 : d0 0d __ BNE $1493 ; (SetUpSprites.s207 + 0)
.s83:
1486 : a9 8b __ LDA #$8b
1488 : 85 2e __ STA P1 
148a : a9 02 __ LDA #$02
148c : 85 31 __ STA P4 
148e : 85 32 __ STA P5 
1490 : 20 56 16 JSR $1656 ; (vera_spr_set.s0 + 0)
.s207:
1493 : e6 47 __ INC T0 + 0 
1495 : a5 47 __ LDA T0 + 0 
1497 : c9 10 __ CMP #$10
1499 : 90 c5 __ BCC $1460 ; (SetUpSprites.l80 + 0)
.s82:
149b : a9 20 __ LDA #$20
149d : 85 37 __ STA P10 
149f : a9 40 __ LDA #$40
14a1 : 8d fc 9e STA $9efc ; (sstack + 0)
14a4 : a9 fa __ LDA #$fa
14a6 : 8d fd 9e STA $9efd ; (sstack + 1)
14a9 : a9 01 __ LDA #$01
14ab : 8d fe 9e STA $9efe ; (sstack + 2)
14ae : a9 00 __ LDA #$00
14b0 : 8d ff 9e STA $9eff ; (sstack + 3)
14b3 : a9 00 __ LDA #$00
14b5 : 85 35 __ STA P8 
14b7 : a9 3e __ LDA #$3e
14b9 : 85 36 __ STA P9 
14bb : 20 72 17 JSR $1772 ; (SetPaletteColours.s0 + 0)
14be : a9 60 __ LDA #$60
14c0 : 8d fc 9e STA $9efc ; (sstack + 0)
14c3 : a9 fa __ LDA #$fa
14c5 : 8d fd 9e STA $9efd ; (sstack + 1)
14c8 : a9 01 __ LDA #$01
14ca : 8d fe 9e STA $9efe ; (sstack + 2)
14cd : a9 00 __ LDA #$00
14cf : 8d ff 9e STA $9eff ; (sstack + 3)
14d2 : a9 20 __ LDA #$20
14d4 : 85 35 __ STA P8 
14d6 : a9 3e __ LDA #$3e
14d8 : 85 36 __ STA P9 
14da : 20 72 17 JSR $1772 ; (SetPaletteColours.s0 + 0)
14dd : a9 80 __ LDA #$80
14df : 8d fc 9e STA $9efc ; (sstack + 0)
14e2 : a9 fa __ LDA #$fa
14e4 : 8d fd 9e STA $9efd ; (sstack + 1)
14e7 : a9 01 __ LDA #$01
14e9 : 8d fe 9e STA $9efe ; (sstack + 2)
14ec : a9 00 __ LDA #$00
14ee : 8d ff 9e STA $9eff ; (sstack + 3)
14f1 : a9 40 __ LDA #$40
14f3 : 85 35 __ STA P8 
14f5 : a9 3e __ LDA #$3e
14f7 : 85 36 __ STA P9 
14f9 : 20 72 17 JSR $1772 ; (SetPaletteColours.s0 + 0)
14fc : a9 60 __ LDA #$60
14fe : 85 2d __ STA P0 
1500 : a9 20 __ LDA #$20
1502 : 85 30 __ STA P3 
1504 : a9 00 __ LDA #$00
1506 : 85 31 __ STA P4 
1508 : a9 60 __ LDA #$60
150a : 85 2e __ STA P1 
150c : a9 3e __ LDA #$3e
150e : 85 2f __ STA P2 
1510 : 20 29 17 JSR $1729 ; (vera_pal_putn.s0 + 0)
1513 : a9 70 __ LDA #$70
1515 : 85 2d __ STA P0 
1517 : a9 0c __ LDA #$0c
1519 : 85 30 __ STA P3 
151b : a9 00 __ LDA #$00
151d : 85 31 __ STA P4 
151f : a9 6c __ LDA #$6c
1521 : 85 2e __ STA P1 
1523 : a9 3e __ LDA #$3e
1525 : 85 2f __ STA P2 
1527 : 20 29 17 JSR $1729 ; (vera_pal_putn.s0 + 0)
152a : a9 20 __ LDA #$20
152c : 85 2d __ STA P0 
152e : a9 43 __ LDA #$43
1530 : 85 2e __ STA P1 
1532 : a9 01 __ LDA #$01
1534 : 85 2f __ STA P2 
1536 : a9 00 __ LDA #$00
1538 : 85 30 __ STA P3 
153a : 85 33 __ STA P6 
153c : a9 04 __ LDA #$04
153e : 85 34 __ STA P7 
1540 : a9 78 __ LDA #$78
1542 : 85 31 __ STA P4 
1544 : a9 3e __ LDA #$3e
1546 : 85 32 __ STA P5 
1548 : 4c f4 15 JMP $15f4 ; (vram_putn.s0 + 0)
.s1029:
154b : c9 34 __ CMP #$34
154d : 90 05 __ BCC $1554 ; (SetUpSprites.s1028 + 0)
.s21:
154f : a9 09 __ LDA #$09
1551 : 4c 94 0d JMP $0d94 ; (SetUpSprites.s197 + 0)
.s1028:
1554 : a9 1e __ LDA #$1e
1556 : c5 3b __ CMP ACCU + 0 
1558 : a5 49 __ LDA T2 + 0 
155a : 90 3e __ BCC $159a ; (SetUpSprites.s1021 + 0)
.s1027:
155c : c9 09 __ CMP #$09
155e : 90 06 __ BCC $1566 ; (SetUpSprites.s27 + 0)
.s1026:
1560 : a9 45 __ LDA #$45
1562 : c5 49 __ CMP T2 + 0 
1564 : b0 05 __ BCS $156b ; (SetUpSprites.s1025 + 0)
.s27:
1566 : a9 00 __ LDA #$00
1568 : 4c 94 0d JMP $0d94 ; (SetUpSprites.s197 + 0)
.s1025:
156b : a5 49 __ LDA T2 + 0 
156d : c9 13 __ CMP #$13
156f : 90 06 __ BCC $1577 ; (SetUpSprites.s31 + 0)
.s1024:
1571 : a9 3b __ LDA #$3b
1573 : c5 49 __ CMP T2 + 0 
1575 : b0 04 __ BCS $157b ; (SetUpSprites.s1023 + 0)
.s31:
1577 : a9 01 __ LDA #$01
1579 : d0 12 __ BNE $158d ; (SetUpSprites.s212 + 0)
.s1023:
157b : a5 49 __ LDA T2 + 0 
157d : c9 1d __ CMP #$1d
157f : 90 06 __ BCC $1587 ; (SetUpSprites.s35 + 0)
.s1022:
1581 : a9 31 __ LDA #$31
1583 : c5 49 __ CMP T2 + 0 
1585 : b0 04 __ BCS $158b ; (SetUpSprites.s36 + 0)
.s35:
1587 : a9 02 __ LDA #$02
1589 : d0 02 __ BNE $158d ; (SetUpSprites.s212 + 0)
.s36:
158b : a9 03 __ LDA #$03
.s212:
158d : 8d 23 9f STA $9f23 
1590 : a9 00 __ LDA #$00
1592 : 8d 23 9f STA $9f23 
1595 : e6 49 __ INC T2 + 0 
1597 : 4c 79 0d JMP $0d79 ; (SetUpSprites.l14 + 0)
.s1021:
159a : c9 09 __ CMP #$09
159c : 90 06 __ BCC $15a4 ; (SetUpSprites.s39 + 0)
.s1020:
159e : a9 45 __ LDA #$45
15a0 : c5 49 __ CMP T2 + 0 
15a2 : b0 05 __ BCS $15a9 ; (SetUpSprites.s1005 + 0)
.s39:
15a4 : a9 05 __ LDA #$05
15a6 : 4c 94 0d JMP $0d94 ; (SetUpSprites.s197 + 0)
.s1005:
15a9 : a5 49 __ LDA T2 + 0 
15ab : c9 13 __ CMP #$13
15ad : 90 06 __ BCC $15b5 ; (SetUpSprites.s43 + 0)
.s1004:
15af : a9 3b __ LDA #$3b
15b1 : c5 49 __ CMP T2 + 0 
15b3 : b0 04 __ BCS $15b9 ; (SetUpSprites.s1003 + 0)
.s43:
15b5 : a9 06 __ LDA #$06
15b7 : d0 d4 __ BNE $158d ; (SetUpSprites.s212 + 0)
.s1003:
15b9 : a5 49 __ LDA T2 + 0 
15bb : c9 1d __ CMP #$1d
15bd : 90 06 __ BCC $15c5 ; (SetUpSprites.s47 + 0)
.s1002:
15bf : a9 31 __ LDA #$31
15c1 : c5 49 __ CMP T2 + 0 
15c3 : b0 04 __ BCS $15c9 ; (SetUpSprites.s48 + 0)
.s47:
15c5 : a9 07 __ LDA #$07
15c7 : d0 c4 __ BNE $158d ; (SetUpSprites.s212 + 0)
.s48:
15c9 : a9 08 __ LDA #$08
15cb : d0 c0 __ BNE $158d ; (SetUpSprites.s212 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
15cd : a5 2d __ LDA P0 ; (bank + 0)
15cf : 4a __ __ LSR
15d0 : a9 00 __ LDA #$00
15d2 : 6a __ __ ROR
15d3 : 85 3b __ STA ACCU + 0 
15d5 : a5 2f __ LDA P2 ; (mem + 1)
15d7 : 29 f8 __ AND #$f8
15d9 : 4a __ __ LSR
15da : 05 3b __ ORA ACCU + 0 
15dc : 85 3b __ STA ACCU + 0 
15de : a5 30 __ LDA P3 ; (height + 0)
15e0 : 0a __ __ ASL
15e1 : 05 3b __ ORA ACCU + 0 
15e3 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
15e5 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
15e6 : a5 2d __ LDA P0 ; (bank + 0)
15e8 : 4a __ __ LSR
15e9 : a9 00 __ LDA #$00
15eb : 6a __ __ ROR
15ec : 85 3b __ STA ACCU + 0 
15ee : a5 2f __ LDA P2 ; (mem + 1)
15f0 : 4a __ __ LSR
15f1 : 05 3b __ ORA ACCU + 0 
.s1001:
15f3 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
15f4 : ad 25 9f LDA $9f25 
15f7 : 29 fe __ AND #$fe
15f9 : 8d 25 9f STA $9f25 
15fc : a5 2d __ LDA P0 ; (addr + 0)
15fe : 8d 20 9f STA $9f20 
1601 : a5 2e __ LDA P1 ; (addr + 1)
1603 : 8d 21 9f STA $9f21 
1606 : a5 2f __ LDA P2 ; (addr + 2)
1608 : 29 01 __ AND #$01
160a : 09 10 __ ORA #$10
160c : 8d 22 9f STA $9f22 
160f : a5 33 __ LDA P6 ; (size + 0)
1611 : 05 34 __ ORA P7 ; (size + 1)
1613 : f0 19 __ BEQ $162e ; (vram_putn.s1001 + 0)
.s6:
1615 : a0 00 __ LDY #$00
1617 : a6 33 __ LDX P6 ; (size + 0)
1619 : f0 02 __ BEQ $161d ; (vram_putn.l1002 + 0)
.s1005:
161b : e6 34 __ INC P7 ; (size + 1)
.l1002:
161d : b1 31 __ LDA (P4),y ; (data + 0)
161f : 8d 23 9f STA $9f23 
1622 : c8 __ __ INY
1623 : d0 02 __ BNE $1627 ; (vram_putn.s1009 + 0)
.s1008:
1625 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1627 : ca __ __ DEX
1628 : d0 f3 __ BNE $161d ; (vram_putn.l1002 + 0)
.s1004:
162a : c6 34 __ DEC P7 ; (size + 1)
162c : d0 ef __ BNE $161d ; (vram_putn.l1002 + 0)
.s1001:
162e : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1df5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e05 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e15 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e25 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e35 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e45 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e55 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e65 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e75 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e85 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e95 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
1ea5 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
1eb5 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
1ec5 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
1ed5 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1ee5 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1ef5 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
1f05 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
1f15 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1f25 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
--------------------------------------------------------------------
rand:
.s0:
162f : ad 36 1f LDA $1f36 ; (seed + 1)
1632 : 4a __ __ LSR
1633 : ad 35 1f LDA $1f35 ; (seed + 0)
1636 : 6a __ __ ROR
1637 : aa __ __ TAX
1638 : a9 00 __ LDA #$00
163a : 6a __ __ ROR
163b : 4d 35 1f EOR $1f35 ; (seed + 0)
163e : 85 3b __ STA ACCU + 0 
1640 : 8a __ __ TXA
1641 : 4d 36 1f EOR $1f36 ; (seed + 1)
1644 : 85 3c __ STA ACCU + 1 
1646 : 4a __ __ LSR
1647 : 45 3b __ EOR ACCU + 0 
1649 : 8d 35 1f STA $1f35 ; (seed + 0)
164c : 85 3b __ STA ACCU + 0 
164e : 45 3c __ EOR ACCU + 1 
1650 : 8d 36 1f STA $1f36 ; (seed + 1)
1653 : 85 3c __ STA ACCU + 1 
.s1001:
1655 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1f35 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1f37 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f47 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f57 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f67 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f77 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f87 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f97 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fa7 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fb7 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fc7 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fd7 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fe7 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ff7 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
2007 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2017 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
2027 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
2037 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
2047 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
2057 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
2067 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
2077 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
2087 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
2097 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
20a7 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
20b7 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
20c7 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
20d7 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
20e7 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
20f7 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2107 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2117 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2127 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2137 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2147 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2157 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2167 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2177 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2187 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2197 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21a7 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21b7 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21c7 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21d7 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21e7 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21f7 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2207 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2217 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2227 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2237 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
2247 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
2257 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
2267 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
2277 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
2287 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
2297 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
22a7 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
22b7 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
22c7 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
22d7 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
22e7 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
22f7 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
2307 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
2317 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
2327 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
1656 : ad 25 9f LDA $9f25 
1659 : 29 fe __ AND #$fe
165b : 8d 25 9f STA $9f25 
165e : a5 2d __ LDA P0 ; (spr + 0)
1660 : 0a __ __ ASL
1661 : 0a __ __ ASL
1662 : 85 3b __ STA ACCU + 0 
1664 : a9 3f __ LDA #$3f
1666 : 2a __ __ ROL
1667 : 06 3b __ ASL ACCU + 0 
1669 : 2a __ __ ROL
166a : 8d 21 9f STA $9f21 
166d : a5 3b __ LDA ACCU + 0 
166f : 8d 20 9f STA $9f20 
1672 : a9 11 __ LDA #$11
1674 : 8d 22 9f STA $9f22 
1677 : a5 30 __ LDA P3 ; (mode8 + 0)
1679 : f0 02 __ BEQ $167d ; (vera_spr_set.s11 + 0)
.s9:
167b : a9 80 __ LDA #$80
.s11:
167d : 05 2f __ ORA P2 ; (addr32 + 1)
167f : a6 2e __ LDX P1 ; (addr32 + 0)
1681 : 8e 23 9f STX $9f23 
1684 : 8d 23 9f STA $9f23 
1687 : a9 00 __ LDA #$00
1689 : 8d 23 9f STA $9f23 
168c : 8d 23 9f STA $9f23 
168f : 8d 23 9f STA $9f23 
1692 : 8d 23 9f STA $9f23 
1695 : a5 33 __ LDA P6 ; (z + 0)
1697 : 0a __ __ ASL
1698 : 0a __ __ ASL
1699 : 8d 23 9f STA $9f23 
169c : a5 32 __ LDA P5 ; (h + 0)
169e : 4a __ __ LSR
169f : 6a __ __ ROR
16a0 : 29 80 __ AND #$80
16a2 : 6a __ __ ROR
16a3 : 85 3b __ STA ACCU + 0 
16a5 : a5 31 __ LDA P4 ; (w + 0)
16a7 : 0a __ __ ASL
16a8 : 0a __ __ ASL
16a9 : 0a __ __ ASL
16aa : 0a __ __ ASL
16ab : 05 3b __ ORA ACCU + 0 
16ad : 05 34 __ ORA P7 ; (pal + 0)
16af : 8d 23 9f STA $9f23 
.s1001:
16b2 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
16b3 : ad 25 9f LDA $9f25 
16b6 : 29 fe __ AND #$fe
16b8 : 8d 25 9f STA $9f25 
16bb : a5 2d __ LDA P0 ; (spr + 0)
16bd : 0a __ __ ASL
16be : 0a __ __ ASL
16bf : 85 3b __ STA ACCU + 0 
16c1 : a9 3f __ LDA #$3f
16c3 : 2a __ __ ROL
16c4 : 06 3b __ ASL ACCU + 0 
16c6 : 2a __ __ ROL
16c7 : aa __ __ TAX
16c8 : a5 3b __ LDA ACCU + 0 
16ca : 09 02 __ ORA #$02
16cc : 8d 20 9f STA $9f20 
16cf : 8e 21 9f STX $9f21 
16d2 : a9 11 __ LDA #$11
16d4 : 8d 22 9f STA $9f22 
16d7 : a5 2e __ LDA P1 ; (x + 0)
16d9 : 8d 23 9f STA $9f23 
16dc : a5 2f __ LDA P2 ; (x + 1)
16de : 8d 23 9f STA $9f23 
16e1 : a5 30 __ LDA P3 ; (y + 0)
16e3 : 8d 23 9f STA $9f23 
16e6 : a5 31 __ LDA P4 ; (y + 1)
16e8 : 8d 23 9f STA $9f23 
.s1001:
16eb : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
16ec : ad 25 9f LDA $9f25 
16ef : 29 fe __ AND #$fe
16f1 : 8d 25 9f STA $9f25 
16f4 : a5 2d __ LDA P0 ; (spr + 0)
16f6 : 0a __ __ ASL
16f7 : 0a __ __ ASL
16f8 : 85 3b __ STA ACCU + 0 
16fa : a9 3f __ LDA #$3f
16fc : 2a __ __ ROL
16fd : 06 3b __ ASL ACCU + 0 
16ff : 2a __ __ ROL
1700 : aa __ __ TAX
1701 : a5 3b __ LDA ACCU + 0 
1703 : 09 06 __ ORA #$06
1705 : 8d 20 9f STA $9f20 
1708 : 8e 21 9f STX $9f21 
170b : a9 01 __ LDA #$01
170d : 8d 22 9f STA $9f22 
1710 : ad 23 9f LDA $9f23 
1713 : 29 fc __ AND #$fc
1715 : a8 __ __ TAY
1716 : a5 2e __ LDA P1 ; (fliph + 0)
1718 : f0 01 __ BEQ $171b ; (vera_spr_flip.s14 + 0)
.s6:
171a : c8 __ __ INY
.s14:
171b : a5 2f __ LDA P2 ; (flipv + 0)
171d : f0 05 __ BEQ $1724 ; (vera_spr_flip.s11 + 0)
.s9:
171f : 98 __ __ TYA
1720 : 09 02 __ ORA #$02
1722 : d0 01 __ BNE $1725 ; (vera_spr_flip.s1002 + 0)
.s11:
1724 : 98 __ __ TYA
.s1002:
1725 : 8d 23 9f STA $9f23 
.s1001:
1728 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2410 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2420 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2430 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2440 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2450 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2460 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2470 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2480 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2490 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
24e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
24f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2500 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2510 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2520 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2530 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2540 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2550 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2560 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2570 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2580 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2590 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
25a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
25b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
25c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
25d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
25e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
25f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2600 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2610 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2620 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2630 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2640 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2650 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2660 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2670 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2680 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2690 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
26a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
26b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
26c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
26d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
26e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
26f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1729 : ad 25 9f LDA $9f25 
172c : 29 fe __ AND #$fe
172e : 8d 25 9f STA $9f25 
1731 : a5 2d __ LDA P0 ; (index + 0)
1733 : 0a __ __ ASL
1734 : 8d 20 9f STA $9f20 
1737 : a9 7d __ LDA #$7d
1739 : 2a __ __ ROL
173a : 8d 21 9f STA $9f21 
173d : a9 11 __ LDA #$11
173f : 8d 22 9f STA $9f22 
1742 : a5 30 __ LDA P3 ; (size + 0)
1744 : 05 31 __ ORA P4 ; (size + 1)
1746 : f0 29 __ BEQ $1771 ; (vera_pal_putn.s1001 + 0)
.s6:
1748 : a6 30 __ LDX P3 ; (size + 0)
174a : f0 02 __ BEQ $174e ; (vera_pal_putn.l3 + 0)
.s1003:
174c : e6 31 __ INC P4 ; (size + 1)
.l3:
174e : a0 01 __ LDY #$01
1750 : b1 2e __ LDA (P1),y ; (color + 0)
1752 : 85 3c __ STA ACCU + 1 
1754 : 88 __ __ DEY
1755 : b1 2e __ LDA (P1),y ; (color + 0)
1757 : 8d 23 9f STA $9f23 
175a : a5 3c __ LDA ACCU + 1 
175c : 8d 23 9f STA $9f23 
175f : 18 __ __ CLC
1760 : a5 2e __ LDA P1 ; (color + 0)
1762 : 69 02 __ ADC #$02
1764 : 85 2e __ STA P1 ; (color + 0)
1766 : 90 02 __ BCC $176a ; (vera_pal_putn.s1007 + 0)
.s1006:
1768 : e6 2f __ INC P2 ; (color + 1)
.s1007:
176a : ca __ __ DEX
176b : d0 e1 __ BNE $174e ; (vera_pal_putn.l3 + 0)
.s1002:
176d : c6 31 __ DEC P4 ; (size + 1)
176f : d0 dd __ BNE $174e ; (vera_pal_putn.l3 + 0)
.s1001:
1771 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2337 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2347 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2357 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
2367 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainPupil:
2700 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2710 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2720 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2730 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2740 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2750 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2760 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2770 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2780 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2790 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
27a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
27b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
27c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
27d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
27e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
27f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2810 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2820 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2830 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2840 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2850 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2860 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2870 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2880 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2890 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
28a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
28b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
28c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
28d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
28e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
28f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2900 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2910 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2920 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2930 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2940 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2950 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2960 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2970 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2980 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2990 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
29a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
29b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
29c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
29d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
29e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
29f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2a00 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2a10 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2a20 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2a30 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2a40 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2a50 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2a60 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2a70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2a80 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2a90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2aa0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2ab0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2ac0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2ad0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2ae0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2af0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2b00 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2b10 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2b30 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2b50 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2b60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2b70 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2b80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2b90 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2ba0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2bb0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2bc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
2bd0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
2be0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2bf0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2c00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ca0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cb0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cc0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cd0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ce0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cf0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2da0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2db0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2dc0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2dd0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2de0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2df0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ea0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2eb0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ec0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ed0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ee0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ef0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2f00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2fa0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2fb0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2fc0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2fd0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2fe0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ff0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3000 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3010 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3020 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3030 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3040 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3050 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3060 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3070 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3080 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3090 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
30a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
30b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
30c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
30d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
30e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
30f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3100 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3110 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3120 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3130 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3140 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3150 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3160 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3170 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3180 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3190 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
31a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
31b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
31c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
31d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
31e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
31f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3200 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3210 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3220 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3230 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3240 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3250 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3260 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3270 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3280 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3290 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
32a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
32b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
32c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
32d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
32e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
32f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3300 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3310 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3320 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3330 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3340 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3350 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3360 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3370 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3380 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3390 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
33a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
33b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
33c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
33d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
33e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
33f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
CharBox:
3400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3420 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3430 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3440 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3450 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3460 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3470 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3480 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3490 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
34a0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
34b0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
34c0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
34d0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
34e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3500 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3510 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3520 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3530 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3540 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3550 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3560 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3570 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3580 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3590 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
35a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
35c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
35e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3600 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3610 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3620 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3630 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3640 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3650 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3660 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3670 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3680 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3690 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
36a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
36c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
36e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3700 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3710 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3720 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3730 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3740 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3750 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3760 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3770 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3780 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3790 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
37a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
37c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
37e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3800 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3810 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3820 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3830 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3840 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3850 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3860 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3870 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3880 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3890 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
38a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38b0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
38c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38d0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
38e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3900 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3910 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3920 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3930 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3940 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3950 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3960 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3970 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3980 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3990 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
39a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
39c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
39e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a10 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a30 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a50 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a70 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a90 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3aa0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ab0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ac0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ad0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ae0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3af0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3b00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b10 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3b20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b30 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3b40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b50 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3b60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b70 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3b80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b90 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ba0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3bb0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3bc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3bd0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3be0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3bf0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
--------------------------------------------------------------------
WavyHead:
3c00 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
3c10 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3c20 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3c30 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3c40 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3c50 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3c60 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3c70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3c80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3c90 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3ca0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3cb0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3cc0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3cd0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3ce0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3cf0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3d00 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3d10 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3d20 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3d30 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3d40 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3d50 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3d60 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3d70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3d80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3d90 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3da0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3db0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3dc0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3dd0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3de0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3df0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
2377 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2387 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
2397 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
23a7 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
23b7 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
23c7 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
23d7 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
23e7 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1772 : ad fc 9e LDA $9efc ; (sstack + 0)
1775 : 85 2d __ STA P0 
1777 : ad fd 9e LDA $9efd ; (sstack + 1)
177a : 85 2e __ STA P1 
177c : ad fe 9e LDA $9efe ; (sstack + 2)
177f : 85 2f __ STA P2 
1781 : ad ff 9e LDA $9eff ; (sstack + 3)
1784 : 85 30 __ STA P3 
1786 : a5 35 __ LDA P8 ; (input + 0)
1788 : 85 31 __ STA P4 
178a : a5 36 __ LDA P9 ; (input + 1)
178c : 85 32 __ STA P5 
178e : a5 37 __ LDA P10 ; (inputsize + 0)
1790 : 85 33 __ STA P6 
1792 : a9 00 __ LDA #$00
1794 : 85 34 __ STA P7 
1796 : 4c f4 15 JMP $15f4 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
3e00 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
3e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
3e20 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
3e30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
3e40 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
3e50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
3e60 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
3e6c : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
EyeTri:
3e78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3e98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ea8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3eb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ec8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3ed8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ee8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3ef8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f08 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3f18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3f38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f48 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3f58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f68 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3f78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f88 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3f98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fa8 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
3fb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fc8 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
3fd8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fe8 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
3ff8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4008 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4018 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4028 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4038 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4048 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4058 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4068 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4078 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
4088 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
4098 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
40a8 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
40b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
40c8 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
40d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
40e8 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
40f8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4108 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4118 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4128 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4138 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4148 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
4158 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
4168 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
4178 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
4188 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
4198 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
41a8 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
41b8 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
41c8 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
41d8 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
41e8 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
41f8 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4208 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4218 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4228 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4238 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4248 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
4258 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4268 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
getchx:
.s0:
1799 : 20 a3 17 JSR $17a3 ; (getpch + 0)
179c : 85 3b __ STA ACCU + 0 
179e : a9 00 __ LDA #$00
17a0 : 85 3c __ STA ACCU + 1 
.s1001:
17a2 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
17a3 : 20 e4 ff JSR $ffe4 
17a6 : ae f7 23 LDX $23f7 ; (giocharmap + 0)
17a9 : e0 01 __ CPX #$01
17ab : 90 26 __ BCC $17d3 ; (getpch + 48)
17ad : c9 0d __ CMP #$0d
17af : d0 02 __ BNE $17b3 ; (getpch + 16)
17b1 : a9 0a __ LDA #$0a
17b3 : e0 02 __ CPX #$02
17b5 : 90 1c __ BCC $17d3 ; (getpch + 48)
17b7 : c9 db __ CMP #$db
17b9 : b0 18 __ BCS $17d3 ; (getpch + 48)
17bb : c9 41 __ CMP #$41
17bd : 90 14 __ BCC $17d3 ; (getpch + 48)
17bf : c9 c1 __ CMP #$c1
17c1 : 90 02 __ BCC $17c5 ; (getpch + 34)
17c3 : 49 a0 __ EOR #$a0
17c5 : c9 7b __ CMP #$7b
17c7 : b0 0a __ BCS $17d3 ; (getpch + 48)
17c9 : c9 61 __ CMP #$61
17cb : b0 04 __ BCS $17d1 ; (getpch + 46)
17cd : c9 5b __ CMP #$5b
17cf : b0 02 __ BCS $17d3 ; (getpch + 48)
17d1 : 49 20 __ EOR #$20
17d3 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
23f7 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
23f8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
23fa : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
23fc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
23fe : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
17d4 : a9 33 __ LDA #$33
17d6 : 85 2d __ STA P0 
17d8 : a9 38 __ LDA #$38
17da : 85 2e __ STA P1 
17dc : a9 01 __ LDA #$01
17de : 85 2f __ STA P2 
17e0 : a6 32 __ LDX P5 ; (p + 0)
17e2 : bd 00 43 LDA $4300,x ; (sintab + 0)
17e5 : 4a __ __ LSR
17e6 : 4a __ __ LSR
17e7 : 4a __ __ LSR
17e8 : 49 10 __ EOR #$10
17ea : 38 __ __ SEC
17eb : e9 10 __ SBC #$10
17ed : 18 __ __ CLC
17ee : 69 b4 __ ADC #$b4
17f0 : 85 30 __ STA P3 
17f2 : a9 00 __ LDA #$00
17f4 : 85 31 __ STA P4 
17f6 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
17f9 : a9 34 __ LDA #$34
17fb : 85 2d __ STA P0 
17fd : a9 20 __ LDA #$20
17ff : 85 2e __ STA P1 
1801 : a6 34 __ LDX P7 ; (p2 + 0)
1803 : bd 00 43 LDA $4300,x ; (sintab + 0)
1806 : 4a __ __ LSR
1807 : 4a __ __ LSR
1808 : 4a __ __ LSR
1809 : 49 10 __ EOR #$10
180b : 38 __ __ SEC
180c : e9 10 __ SBC #$10
180e : 18 __ __ CLC
180f : 69 b4 __ ADC #$b4
1811 : 85 30 __ STA P3 
1813 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1816 : a9 35 __ LDA #$35
1818 : 85 2d __ STA P0 
181a : a9 00 __ LDA #$00
181c : 85 2e __ STA P1 
181e : a6 36 __ LDX P9 ; (p3 + 0)
1820 : bd 00 43 LDA $4300,x ; (sintab + 0)
1823 : 4a __ __ LSR
1824 : 4a __ __ LSR
1825 : 4a __ __ LSR
1826 : 49 10 __ EOR #$10
1828 : 38 __ __ SEC
1829 : e9 10 __ SBC #$10
182b : 18 __ __ CLC
182c : 69 a4 __ ADC #$a4
182e : 85 30 __ STA P3 
1830 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1833 : a9 36 __ LDA #$36
1835 : 85 2d __ STA P0 
1837 : a9 40 __ LDA #$40
1839 : 85 2e __ STA P1 
183b : a6 36 __ LDX P9 ; (p3 + 0)
183d : bd 00 43 LDA $4300,x ; (sintab + 0)
1840 : 4a __ __ LSR
1841 : 4a __ __ LSR
1842 : 4a __ __ LSR
1843 : 49 10 __ EOR #$10
1845 : 38 __ __ SEC
1846 : e9 10 __ SBC #$10
1848 : 18 __ __ CLC
1849 : 69 a4 __ ADC #$a4
184b : 85 30 __ STA P3 
184d : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
1850 : a9 37 __ LDA #$37
1852 : 85 2d __ STA P0 
1854 : a9 00 __ LDA #$00
1856 : 85 2e __ STA P1 
1858 : a6 36 __ LDX P9 ; (p3 + 0)
185a : bd 00 43 LDA $4300,x ; (sintab + 0)
185d : 4a __ __ LSR
185e : 4a __ __ LSR
185f : 4a __ __ LSR
1860 : 49 10 __ EOR #$10
1862 : 38 __ __ SEC
1863 : e9 10 __ SBC #$10
1865 : 18 __ __ CLC
1866 : 69 c4 __ ADC #$c4
1868 : 85 30 __ STA P3 
186a : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
186d : a9 38 __ LDA #$38
186f : 85 2d __ STA P0 
1871 : a9 40 __ LDA #$40
1873 : 85 2e __ STA P1 
1875 : a6 36 __ LDX P9 ; (p3 + 0)
1877 : bd 00 43 LDA $4300,x ; (sintab + 0)
187a : 4a __ __ LSR
187b : 4a __ __ LSR
187c : 4a __ __ LSR
187d : 49 10 __ EOR #$10
187f : 38 __ __ SEC
1880 : e9 10 __ SBC #$10
1882 : 18 __ __ CLC
1883 : 69 c4 __ ADC #$c4
1885 : 85 30 __ STA P3 
1887 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
188a : a9 00 __ LDA #$00
188c : 85 47 __ STA T1 + 0 
.l2:
188e : ad 78 42 LDA $4278 ; (FrameCount + 0)
1891 : a4 47 __ LDY T1 + 0 
1893 : 18 __ __ CLC
1894 : 79 c1 1d ADC $1dc1,y ; (__multab12L + 0)
1897 : aa __ __ TAX
1898 : bd 00 43 LDA $4300,x ; (sintab + 0)
189b : 85 3b __ STA ACCU + 0 
189d : 29 80 __ AND #$80
189f : 10 02 __ BPL $18a3 ; (MoveSprites.l2 + 21)
18a1 : a9 ff __ LDA #$ff
18a3 : 85 49 __ STA T2 + 1 
18a5 : ad 78 42 LDA $4278 ; (FrameCount + 0)
18a8 : 38 __ __ SEC
18a9 : e9 40 __ SBC #$40
18ab : 18 __ __ CLC
18ac : 79 d1 1d ADC $1dd1,y ; (__multab5L + 0)
18af : aa __ __ TAX
18b0 : bd 00 43 LDA $4300,x ; (sintab + 0)
18b3 : 85 4c __ STA T6 + 0 
18b5 : 98 __ __ TYA
18b6 : 0a __ __ ASL
18b7 : 0a __ __ ASL
18b8 : 0a __ __ ASL
18b9 : 85 48 __ STA T2 + 0 
18bb : ad 78 42 LDA $4278 ; (FrameCount + 0)
18be : 38 __ __ SEC
18bf : e9 20 __ SBC #$20
18c1 : 18 __ __ CLC
18c2 : 65 48 __ ADC T2 + 0 
18c4 : aa __ __ TAX
18c5 : bd 00 43 LDA $4300,x ; (sintab + 0)
18c8 : 4a __ __ LSR
18c9 : 4a __ __ LSR
18ca : 4a __ __ LSR
18cb : 4a __ __ LSR
18cc : 49 08 __ EOR #$08
18ce : 38 __ __ SEC
18cf : e9 08 __ SBC #$08
18d1 : 85 4a __ STA T3 + 0 
18d3 : a9 00 __ LDA #$00
18d5 : e9 00 __ SBC #$00
18d7 : 85 4b __ STA T3 + 1 
18d9 : 98 __ __ TYA
18da : 18 __ __ CLC
18db : 69 4f __ ADC #$4f
18dd : 85 2d __ STA P0 
18df : 18 __ __ CLC
18e0 : a5 3b __ LDA ACCU + 0 
18e2 : 6d 78 42 ADC $4278 ; (FrameCount + 0)
18e5 : 85 48 __ STA T2 + 0 
18e7 : a5 49 __ LDA T2 + 1 
18e9 : 6d 79 42 ADC $4279 ; (FrameCount + 1)
18ec : 85 49 __ STA T2 + 1 
18ee : 98 __ __ TYA
18ef : 0a __ __ ASL
18f0 : 0a __ __ ASL
18f1 : 85 3b __ STA ACCU + 0 
18f3 : a9 00 __ LDA #$00
18f5 : 85 3c __ STA ACCU + 1 
18f7 : a9 80 __ LDA #$80
18f9 : 85 23 __ STA WORK + 0 
18fb : a9 02 __ LDA #$02
18fd : 85 24 __ STA WORK + 1 
18ff : 20 13 1d JSR $1d13 ; (divmod + 0)
1902 : 18 __ __ CLC
1903 : a5 25 __ LDA WORK + 2 
1905 : 65 48 __ ADC T2 + 0 
1907 : 85 2e __ STA P1 
1909 : a5 26 __ LDA WORK + 3 
190b : 65 49 __ ADC T2 + 1 
190d : 85 2f __ STA P2 
190f : a5 4c __ LDA T6 + 0 
1911 : 0a __ __ ASL
1912 : a9 00 __ LDA #$00
1914 : 69 ff __ ADC #$ff
1916 : a4 47 __ LDY T1 + 0 
1918 : c0 0f __ CPY #$0f
191a : f0 2b __ BEQ $1947 ; (MoveSprites.s5 + 0)
.s6:
191c : 18 __ __ CLC
191d : a5 4c __ LDA T6 + 0 
191f : 69 80 __ ADC #$80
1921 : 18 __ __ CLC
1922 : 65 4a __ ADC T3 + 0 
1924 : aa __ __ TAX
1925 : a9 00 __ LDA #$00
1927 : 65 4b __ ADC T3 + 1 
1929 : 85 49 __ STA T2 + 1 
192b : 8a __ __ TXA
192c : 18 __ __ CLC
192d : 79 e1 1d ADC $1de1,y ; (__multab3L + 0)
1930 : 85 30 __ STA P3 
1932 : a5 49 __ LDA T2 + 1 
1934 : 69 00 __ ADC #$00
1936 : 85 31 __ STA P4 
1938 : 20 b3 16 JSR $16b3 ; (vera_spr_move.s0 + 0)
193b : e6 47 __ INC T1 + 0 
193d : a5 47 __ LDA T1 + 0 
193f : c9 10 __ CMP #$10
1941 : b0 03 __ BCS $1946 ; (MoveSprites.s1001 + 0)
1943 : 4c 8e 18 JMP $188e ; (MoveSprites.l2 + 0)
.s1001:
1946 : 60 __ __ RTS
.s5:
1947 : 49 ff __ EOR #$ff
1949 : aa __ __ TAX
194a : 18 __ __ CLC
194b : a5 4c __ LDA T6 + 0 
194d : 69 78 __ ADC #$78
194f : 90 01 __ BCC $1952 ; (MoveSprites.s1009 + 0)
.s1008:
1951 : e8 __ __ INX
.s1009:
1952 : 18 __ __ CLC
1953 : 65 4a __ ADC T3 + 0 
1955 : a8 __ __ TAY
1956 : 8a __ __ TXA
1957 : 65 4b __ ADC T3 + 1 
1959 : aa __ __ TAX
195a : 98 __ __ TYA
195b : 18 __ __ CLC
195c : 6d f0 1d ADC $1df0 ; (__multab3L + 15)
195f : 85 30 __ STA P3 
1961 : 90 01 __ BCC $1964 ; (MoveSprites.s1007 + 0)
.s1006:
1963 : e8 __ __ INX
.s1007:
1964 : 86 31 __ STX P4 
1966 : 4c b3 16 JMP $16b3 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4300 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4310 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4320 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4330 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4340 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4350 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4360 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4370 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4380 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4390 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
43a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
43b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
43c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
43d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
43e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
43f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
4278 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1969 : a9 08 __ LDA #$08
196b : 8d 2c 9f STA $9f2c 
196e : 20 9f 19 JSR $199f ; (zsm_check.s0 + 0)
1971 : 09 00 __ ORA #$00
1973 : d0 01 __ BNE $1976 ; (PlayZSM.s1 + 0)
.s1001:
1975 : 60 __ __ RTS
.s1:
1976 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1978 : 05 32 __ ORA P5 ; (TuneSelection + 0)
197a : d0 07 __ BNE $1983 ; (PlayZSM.s11 + 0)
.s7:
197c : a9 1b __ LDA #$1b
197e : a0 2e __ LDY #$2e
1980 : 4c 98 19 JMP $1998 ; (PlayZSM.s15 + 0)
.s11:
1983 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1985 : d0 06 __ BNE $198d ; (PlayZSM.s5 + 0)
.s1002:
1987 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1989 : c9 01 __ CMP #$01
198b : f0 07 __ BEQ $1994 ; (PlayZSM.s9 + 0)
.s5:
198d : a9 1b __ LDA #$1b
198f : a0 10 __ LDY #$10
1991 : 4c 98 19 JMP $1998 ; (PlayZSM.s15 + 0)
.s9:
1994 : a9 1b __ LDA #$1b
1996 : a0 4c __ LDY #$4c
.s15:
1998 : 84 30 __ STY P3 
199a : 85 31 __ STA P4 
199c : 4c a3 19 JMP $19a3 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
199f : ad f3 1d LDA $1df3 ; (zsm_finished + 0)
.s1001:
19a2 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
19a3 : a9 01 __ LDA #$01
19a5 : 8d f3 1d STA $1df3 ; (zsm_finished + 0)
19a8 : ad 7a 42 LDA $427a ; (zsm_reading + 0)
19ab : f0 0a __ BEQ $19b7 ; (zsm_init.s3 + 0)
.s1:
19ad : a9 02 __ LDA #$02
19af : 20 fc 19 JSR $19fc ; (krnio_close.s1000 + 0)
19b2 : a9 00 __ LDA #$00
19b4 : 8d 7a 42 STA $427a ; (zsm_reading + 0)
.s3:
19b7 : 8d 39 48 STA $4839 ; (zsm_pos + 0)
19ba : 8d 3a 48 STA $483a ; (zsm_pos + 1)
19bd : 8d 3b 48 STA $483b ; (zsm_wpos + 0)
19c0 : 8d 3c 48 STA $483c ; (zsm_wpos + 1)
19c3 : 8d 38 44 STA $4438 ; (zsm_delay + 0)
19c6 : a5 30 __ LDA P3 ; (fname + 0)
19c8 : 85 2d __ STA P0 
19ca : a5 31 __ LDA P4 ; (fname + 1)
19cc : 85 2e __ STA P1 
19ce : 20 04 1a JSR $1a04 ; (krnio_setnam.s0 + 0)
19d1 : a9 02 __ LDA #$02
19d3 : 85 2d __ STA P0 
19d5 : 85 2f __ STA P2 
19d7 : a9 08 __ LDA #$08
19d9 : 85 2e __ STA P1 
19db : 20 1a 1a JSR $1a1a ; (krnio_open.s0 + 0)
19de : a5 3b __ LDA ACCU + 0 
19e0 : f0 19 __ BEQ $19fb ; (zsm_init.s1001 + 0)
.s4:
19e2 : a9 01 __ LDA #$01
19e4 : 8d 7a 42 STA $427a ; (zsm_reading + 0)
19e7 : 20 42 1a JSR $1a42 ; (zsm_fill.s0 + 0)
19ea : a9 10 __ LDA #$10
19ec : 8d 39 48 STA $4839 ; (zsm_pos + 0)
19ef : a9 00 __ LDA #$00
19f1 : 8d 3a 48 STA $483a ; (zsm_pos + 1)
19f4 : 8d f3 1d STA $1df3 ; (zsm_finished + 0)
19f7 : a9 01 __ LDA #$01
19f9 : 85 3b __ STA ACCU + 0 
.s1001:
19fb : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
427a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
19fc : 85 2d __ STA P0 
.s0:
19fe : a5 2d __ LDA P0 
1a00 : 20 c3 ff JSR $ffc3 
.s1001:
1a03 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
483b : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1a04 : a5 2d __ LDA P0 
1a06 : 05 2e __ ORA P1 
1a08 : f0 08 __ BEQ $1a12 ; (krnio_setnam.s0 + 14)
1a0a : a0 ff __ LDY #$ff
1a0c : c8 __ __ INY
1a0d : b1 2d __ LDA (P0),y 
1a0f : d0 fb __ BNE $1a0c ; (krnio_setnam.s0 + 8)
1a11 : 98 __ __ TYA
1a12 : a6 2d __ LDX P0 
1a14 : a4 2e __ LDY P1 
1a16 : 20 bd ff JSR $ffbd 
.s1001:
1a19 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1a1a : a9 00 __ LDA #$00
1a1c : a6 2d __ LDX P0 ; (fnum + 0)
1a1e : 9d 3d 48 STA $483d,x ; (krnio_pstatus + 0)
1a21 : a9 00 __ LDA #$00
1a23 : 85 3b __ STA ACCU + 0 
1a25 : 85 3c __ STA ACCU + 1 
1a27 : a5 2d __ LDA P0 ; (fnum + 0)
1a29 : a6 2e __ LDX P1 
1a2b : a4 2f __ LDY P2 
1a2d : 20 ba ff JSR $ffba 
1a30 : 20 c0 ff JSR $ffc0 
1a33 : 90 08 __ BCC $1a3d ; (krnio_open.s0 + 35)
1a35 : a5 2d __ LDA P0 ; (fnum + 0)
1a37 : 20 c3 ff JSR $ffc3 
1a3a : 4c 41 1a JMP $1a41 ; (krnio_open.s1001 + 0)
1a3d : a9 01 __ LDA #$01
1a3f : 85 3b __ STA ACCU + 0 
.s1001:
1a41 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
483d : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1a42 : ad 7a 42 LDA $427a ; (zsm_reading + 0)
1a45 : f0 20 __ BEQ $1a67 ; (zsm_fill.s1 + 0)
.s2:
1a47 : ad 3a 48 LDA $483a ; (zsm_pos + 1)
1a4a : 18 __ __ CLC
1a4b : 69 04 __ ADC #$04
1a4d : cd 3c 48 CMP $483c ; (zsm_wpos + 1)
1a50 : d0 0c __ BNE $1a5e ; (zsm_fill.s6 + 0)
.s1006:
1a52 : ad 3b 48 LDA $483b ; (zsm_wpos + 0)
1a55 : cd 39 48 CMP $4839 ; (zsm_pos + 0)
1a58 : d0 04 __ BNE $1a5e ; (zsm_fill.s6 + 0)
.s5:
1a5a : a9 00 __ LDA #$00
1a5c : f0 0b __ BEQ $1a69 ; (zsm_fill.s1008 + 0)
.s6:
1a5e : a9 02 __ LDA #$02
1a60 : 20 e6 1a JSR $1ae6 ; (krnio_chkin.s1000 + 0)
1a63 : a5 3b __ LDA ACCU + 0 
1a65 : d0 07 __ BNE $1a6e ; (zsm_fill.s9 + 0)
.s1:
1a67 : a9 ff __ LDA #$ff
.s1008:
1a69 : 85 3b __ STA ACCU + 0 
.s1001:
1a6b : 85 3c __ STA ACCU + 1 
1a6d : 60 __ __ RTS
.s9:
1a6e : a9 00 __ LDA #$00
1a70 : 85 47 __ STA T1 + 0 
1a72 : 85 48 __ STA T1 + 1 
1a74 : ad 3a 48 LDA $483a ; (zsm_pos + 1)
1a77 : 18 __ __ CLC
1a78 : 69 04 __ ADC #$04
1a7a : cd 3c 48 CMP $483c ; (zsm_wpos + 1)
1a7d : d0 08 __ BNE $1a87 ; (zsm_fill.l13 + 0)
.s1002:
1a7f : ad 3b 48 LDA $483b ; (zsm_wpos + 0)
1a82 : cd 39 48 CMP $4839 ; (zsm_pos + 0)
1a85 : f0 49 __ BEQ $1ad0 ; (zsm_fill.s37 + 0)
.l13:
1a87 : 20 f8 1a JSR $1af8 ; (krnio_chrin.s0 + 0)
1a8a : ad 3b 48 LDA $483b ; (zsm_wpos + 0)
1a8d : aa __ __ TAX
1a8e : 18 __ __ CLC
1a8f : 69 01 __ ADC #$01
1a91 : 8d 3b 48 STA $483b ; (zsm_wpos + 0)
1a94 : ad 3c 48 LDA $483c ; (zsm_wpos + 1)
1a97 : a8 __ __ TAY
1a98 : 69 00 __ ADC #$00
1a9a : 8d 3c 48 STA $483c ; (zsm_wpos + 1)
1a9d : 8a __ __ TXA
1a9e : 18 __ __ CLC
1a9f : 69 39 __ ADC #$39
1aa1 : 85 49 __ STA T3 + 0 
1aa3 : 98 __ __ TYA
1aa4 : 29 03 __ AND #$03
1aa6 : 69 44 __ ADC #$44
1aa8 : 85 4a __ STA T3 + 1 
1aaa : a5 3b __ LDA ACCU + 0 
1aac : a0 00 __ LDY #$00
1aae : 91 49 __ STA (T3 + 0),y 
1ab0 : e6 47 __ INC T1 + 0 
1ab2 : d0 02 __ BNE $1ab6 ; (zsm_fill.s1010 + 0)
.s1009:
1ab4 : e6 48 __ INC T1 + 1 
.s1010:
1ab6 : 20 02 1b JSR $1b02 ; (krnio_status.s0 + 0)
1ab9 : a5 3b __ LDA ACCU + 0 
1abb : d0 0e __ BNE $1acb ; (zsm_fill.s15 + 0)
.s12:
1abd : ad 3a 48 LDA $483a ; (zsm_pos + 1)
1ac0 : 18 __ __ CLC
1ac1 : 69 04 __ ADC #$04
1ac3 : cd 3c 48 CMP $483c ; (zsm_wpos + 1)
1ac6 : d0 bf __ BNE $1a87 ; (zsm_fill.l13 + 0)
1ac8 : 4c 7f 1a JMP $1a7f ; (zsm_fill.s1002 + 0)
.s15:
1acb : a9 00 __ LDA #$00
1acd : 8d 7a 42 STA $427a ; (zsm_reading + 0)
.s37:
1ad0 : 20 0c 1b JSR $1b0c ; (krnio_clrchn.s0 + 0)
1ad3 : ad 7a 42 LDA $427a ; (zsm_reading + 0)
1ad6 : d0 05 __ BNE $1add ; (zsm_fill.s21 + 0)
.s19:
1ad8 : a9 02 __ LDA #$02
1ada : 20 fc 19 JSR $19fc ; (krnio_close.s1000 + 0)
.s21:
1add : a5 47 __ LDA T1 + 0 
1adf : 85 3b __ STA ACCU + 0 
1ae1 : a5 48 __ LDA T1 + 1 
1ae3 : 4c 6b 1a JMP $1a6b ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1ae6 : 85 2d __ STA P0 
.s0:
1ae8 : a6 2d __ LDX P0 
1aea : 20 c6 ff JSR $ffc6 
1aed : a9 00 __ LDA #$00
1aef : 85 3c __ STA ACCU + 1 
1af1 : b0 02 __ BCS $1af5 ; (krnio_chkin.s0 + 13)
1af3 : a9 01 __ LDA #$01
1af5 : 85 3b __ STA ACCU + 0 
.s1001:
1af7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1af8 : 20 cf ff JSR $ffcf 
1afb : 85 3b __ STA ACCU + 0 
1afd : a9 00 __ LDA #$00
1aff : 85 3c __ STA ACCU + 1 
.s1001:
1b01 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1b02 : 20 b7 ff JSR $ffb7 
1b05 : 85 3b __ STA ACCU + 0 
1b07 : a9 00 __ LDA #$00
1b09 : 85 3c __ STA ACCU + 1 
.s1001:
1b0b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1b0c : 20 cc ff JSR $ffcc 
.s1001:
1b0f : 60 __ __ RTS
--------------------------------------------------------------------
1b10 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1b20 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1b2e : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1b3e : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1b4c : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1b5c : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1b6c : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
PalTimer:
427b : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
427d : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
428d : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1b71 : a9 10 __ LDA #$10
1b73 : 85 30 __ STA P3 
1b75 : a9 00 __ LDA #$00
1b77 : 85 31 __ STA P4 
1b79 : a5 32 __ LDA P5 ; (Palette + 0)
1b7b : 85 2e __ STA P1 
1b7d : 85 47 __ STA T0 + 0 
1b7f : a5 33 __ LDA P6 ; (Palette + 1)
1b81 : 85 2f __ STA P2 
1b83 : 85 48 __ STA T0 + 1 
1b85 : ad fc 9e LDA $9efc ; (sstack + 0)
1b88 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b8a : 0a __ __ ASL
1b8b : 85 49 __ STA T2 + 0 
1b8d : ad fd 9e LDA $9efd ; (sstack + 1)
1b90 : 2a __ __ ROL
1b91 : 18 __ __ CLC
1b92 : 65 33 __ ADC P6 ; (Palette + 1)
1b94 : 85 4a __ STA T2 + 1 
1b96 : a4 32 __ LDY P5 ; (Palette + 0)
1b98 : b1 49 __ LDA (T2 + 0),y 
1b9a : aa __ __ TAX
1b9b : c8 __ __ INY
1b9c : b1 49 __ LDA (T2 + 0),y 
1b9e : 86 49 __ STX T2 + 0 
1ba0 : 85 4a __ STA T2 + 1 
1ba2 : a9 00 __ LDA #$00
1ba4 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1ba6 : ad fe 9e LDA $9efe ; (sstack + 2)
1ba9 : 85 4b __ STA T4 + 0 
1bab : 38 __ __ SEC
1bac : e9 01 __ SBC #$01
1bae : 85 4d __ STA T5 + 0 
1bb0 : ad ff 9e LDA $9eff ; (sstack + 3)
1bb3 : 85 4c __ STA T4 + 1 
1bb5 : e9 00 __ SBC #$00
1bb7 : 85 4e __ STA T5 + 1 
1bb9 : d0 06 __ BNE $1bc1 ; (SetPaletteIndex.s5 + 0)
.s1004:
1bbb : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1bbd : c5 4d __ CMP T5 + 0 
1bbf : b0 38 __ BCS $1bf9 ; (SetPaletteIndex.s4 + 0)
.s5:
1bc1 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1bc3 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1bc5 : 18 __ __ CLC
1bc6 : a5 32 __ LDA P5 ; (Palette + 0)
1bc8 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1bca : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1bcc : a5 33 __ LDA P6 ; (Palette + 1)
1bce : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1bd0 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1bd2 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1bd5 : a0 02 __ LDY #$02
1bd7 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1bd9 : a0 00 __ LDY #$00
1bdb : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1bdd : a0 03 __ LDY #$03
1bdf : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1be1 : a0 01 __ LDY #$01
1be3 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1be5 : 18 __ __ CLC
1be6 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1be8 : 69 02 __ ADC #$02
1bea : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1bec : 90 02 __ BCC $1bf0 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1bee : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1bf0 : e8 __ __ INX
1bf1 : a5 4e __ LDA T5 + 1 
1bf3 : d0 e0 __ BNE $1bd5 ; (SetPaletteIndex.l2 + 0)
.s1002:
1bf5 : e4 4d __ CPX T5 + 0 
1bf7 : 90 dc __ BCC $1bd5 ; (SetPaletteIndex.l2 + 0)
.s4:
1bf9 : a5 4b __ LDA T4 + 0 
1bfb : 0a __ __ ASL
1bfc : aa __ __ TAX
1bfd : a5 4c __ LDA T4 + 1 
1bff : 2a __ __ ROL
1c00 : a8 __ __ TAY
1c01 : 8a __ __ TXA
1c02 : 38 __ __ SEC
1c03 : e9 02 __ SBC #$02
1c05 : b0 01 __ BCS $1c08 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1c07 : 88 __ __ DEY
.s1010:
1c08 : 18 __ __ CLC
1c09 : 65 47 __ ADC T0 + 0 
1c0b : 85 47 __ STA T0 + 0 
1c0d : 98 __ __ TYA
1c0e : 65 48 __ ADC T0 + 1 
1c10 : 85 48 __ STA T0 + 1 
1c12 : a5 49 __ LDA T2 + 0 
1c14 : a0 00 __ LDY #$00
1c16 : 91 47 __ STA (T0 + 0),y 
1c18 : a5 4a __ LDA T2 + 1 
1c1a : c8 __ __ INY
1c1b : 91 47 __ STA (T0 + 0),y 
1c1d : a5 34 __ LDA P7 ; (index + 0)
1c1f : 85 2d __ STA P0 
1c21 : 4c 29 17 JMP $1729 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
429d : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
429f : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
42af : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
42bf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
42c0 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
42d0 : __ __ __ BYT ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f : ................
--------------------------------------------------------------------
BGPalShimmer:
42e0 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 dd 0d bb 0b 66 06 : %.......&.....f.
42f0 : __ __ __ BYT ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f : ................
--------------------------------------------------------------------
Control:
.s0:
1c24 : a5 31 __ LDA P4 ; (Input + 0)
1c26 : c9 20 __ CMP #$20
1c28 : d0 1c __ BNE $1c46 ; (Control.s1007 + 0)
.s1:
1c2a : a5 30 __ LDA P3 ; (playing + 0)
1c2c : d0 0a __ BNE $1c38 ; (Control.s4 + 0)
.s5:
1c2e : a9 01 __ LDA #$01
1c30 : 20 e4 1c JSR $1ce4 ; (zsm_irq_play.s0 + 0)
1c33 : a9 01 __ LDA #$01
.s1001:
1c35 : 85 3b __ STA ACCU + 0 
1c37 : 60 __ __ RTS
.s4:
1c38 : a9 00 __ LDA #$00
1c3a : cd 00 44 CMP $4400 ; (paused + 0)
1c3d : 2a __ __ ROL
1c3e : 85 2f __ STA P2 
1c40 : 8d 00 44 STA $4400 ; (paused + 0)
1c43 : 20 4b 1c JSR $1c4b ; (zsm_pause.s0 + 0)
.s1007:
1c46 : a5 30 __ LDA P3 ; (playing + 0)
1c48 : 4c 35 1c JMP $1c35 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
4400 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1c4b : a5 2f __ LDA P2 ; (pause + 0)
1c4d : d0 0e __ BNE $1c5d ; (zsm_pause.s4 + 0)
.s8:
1c4f : ad f4 1d LDA $1df4 ; (zsm_paused + 0)
1c52 : f0 08 __ BEQ $1c5c ; (zsm_pause.s1001 + 0)
.s5:
1c54 : 20 b7 1c JSR $1cb7 ; (zsm_restore_volume.s0 + 0)
1c57 : a9 00 __ LDA #$00
1c59 : 8d f4 1d STA $1df4 ; (zsm_paused + 0)
.s1001:
1c5c : 60 __ __ RTS
.s4:
1c5d : ad f4 1d LDA $1df4 ; (zsm_paused + 0)
1c60 : d0 fa __ BNE $1c5c ; (zsm_pause.s1001 + 0)
.s1:
1c62 : a9 01 __ LDA #$01
1c64 : 8d f4 1d STA $1df4 ; (zsm_paused + 0)
1c67 : 20 6d 1c JSR $1c6d ; (zsm_silence.s0 + 0)
1c6a : 4c 85 1c JMP $1c85 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_silence:
.s0:
1c6d : a9 00 __ LDA #$00
1c6f : 85 47 __ STA T0 + 0 
1c71 : a9 08 __ LDA #$08
1c73 : 85 2d __ STA P0 
1c75 : a9 00 __ LDA #$00
.l1006:
1c77 : 85 2e __ STA P1 
1c79 : 20 9e 0c JSR $0c9e ; (sfx_put.l1 + 0)
1c7c : e6 47 __ INC T0 + 0 
1c7e : a5 47 __ LDA T0 + 0 
1c80 : c9 08 __ CMP #$08
1c82 : 90 f3 __ BCC $1c77 ; (zsm_silence.l1006 + 0)
.s1001:
1c84 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1c85 : a0 00 __ LDY #$00
1c87 : 84 3c __ STY ACCU + 1 
1c89 : a2 02 __ LDX #$02
1c8b : 18 __ __ CLC
.l1006:
1c8c : 8a __ __ TXA
1c8d : 09 c0 __ ORA #$c0
1c8f : 8d 20 9f STA $9f20 
1c92 : a5 3c __ LDA ACCU + 1 
1c94 : 09 f9 __ ORA #$f9
1c96 : 8d 21 9f STA $9f21 
1c99 : a9 01 __ LDA #$01
1c9b : 8d 22 9f STA $9f22 
1c9e : ad 23 9f LDA $9f23 
1ca1 : 99 4d 48 STA $484d,y ; (vera_volumes + 0)
1ca4 : a9 00 __ LDA #$00
1ca6 : 8d 23 9f STA $9f23 
1ca9 : 8a __ __ TXA
1caa : 69 04 __ ADC #$04
1cac : aa __ __ TAX
1cad : 90 02 __ BCC $1cb1 ; (zsm_save_volume.s1009 + 0)
.s1008:
1caf : e6 3c __ INC ACCU + 1 
.s1009:
1cb1 : c8 __ __ INY
1cb2 : c0 10 __ CPY #$10
1cb4 : 90 d6 __ BCC $1c8c ; (zsm_save_volume.l1006 + 0)
.s1001:
1cb6 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
484d : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1cb7 : a0 00 __ LDY #$00
1cb9 : 84 3c __ STY ACCU + 1 
1cbb : a2 02 __ LDX #$02
1cbd : 18 __ __ CLC
.l1006:
1cbe : 8a __ __ TXA
1cbf : 09 c0 __ ORA #$c0
1cc1 : 8d 20 9f STA $9f20 
1cc4 : a5 3c __ LDA ACCU + 1 
1cc6 : 09 f9 __ ORA #$f9
1cc8 : 8d 21 9f STA $9f21 
1ccb : a9 01 __ LDA #$01
1ccd : 8d 22 9f STA $9f22 
1cd0 : b9 4d 48 LDA $484d,y ; (vera_volumes + 0)
1cd3 : 8d 23 9f STA $9f23 
1cd6 : 8a __ __ TXA
1cd7 : 69 04 __ ADC #$04
1cd9 : aa __ __ TAX
1cda : 90 02 __ BCC $1cde ; (zsm_restore_volume.s1009 + 0)
.s1008:
1cdc : e6 3c __ INC ACCU + 1 
.s1009:
1cde : c8 __ __ INY
1cdf : c0 10 __ CPY #$10
1ce1 : 90 db __ BCC $1cbe ; (zsm_restore_volume.l1006 + 0)
.s1001:
1ce3 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1ce4 : 8d f2 1d STA $1df2 ; (zsm_playing + 0)
.s1001:
1ce7 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4401 : __ __ __ BYT 01 02 03 04 05 06 07 08 09 0a 0b 0c 0e 0f 10 11 : ................
4411 : __ __ __ BYT 12 13 14 15 16 17 18 19 1a 41 42 43 44 45 46 47 : .........ABCDEFG
4421 : __ __ __ BYT 48 49 4a 4b 4c 4d 4e 4f 50 51 52 53 54 55 56 57 : HIJKLMNOPQRSTUVW
4431 : __ __ __ BYT 58 59 5a 00                                     : XYZ.
--------------------------------------------------------------------
off1:
4435 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
frame_wait:
.l1:
1ce8 : ad 26 9f LDA $9f26 
1ceb : 29 40 __ AND #$40
1ced : d0 f9 __ BNE $1ce8 ; (frame_wait.l1 + 0)
.l4:
1cef : ad 26 9f LDA $9f26 
1cf2 : 29 40 __ AND #$40
1cf4 : f0 f9 __ BEQ $1cef ; (frame_wait.l4 + 0)
.s1001:
1cf6 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1cf7 : 38 __ __ SEC
1cf8 : a9 00 __ LDA #$00
1cfa : e5 3b __ SBC ACCU + 0 
1cfc : 85 3b __ STA ACCU + 0 
1cfe : a9 00 __ LDA #$00
1d00 : e5 3c __ SBC ACCU + 1 
1d02 : 85 3c __ STA ACCU + 1 
1d04 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1d05 : 38 __ __ SEC
1d06 : a9 00 __ LDA #$00
1d08 : e5 23 __ SBC WORK + 0 
1d0a : 85 23 __ STA WORK + 0 
1d0c : a9 00 __ LDA #$00
1d0e : e5 24 __ SBC WORK + 1 
1d10 : 85 24 __ STA WORK + 1 
1d12 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1d13 : a5 3c __ LDA ACCU + 1 
1d15 : d0 31 __ BNE $1d48 ; (divmod + 53)
1d17 : a5 24 __ LDA WORK + 1 
1d19 : d0 1e __ BNE $1d39 ; (divmod + 38)
1d1b : 85 26 __ STA WORK + 3 
1d1d : a2 04 __ LDX #$04
1d1f : 06 3b __ ASL ACCU + 0 
1d21 : 2a __ __ ROL
1d22 : c5 23 __ CMP WORK + 0 
1d24 : 90 02 __ BCC $1d28 ; (divmod + 21)
1d26 : e5 23 __ SBC WORK + 0 
1d28 : 26 3b __ ROL ACCU + 0 
1d2a : 2a __ __ ROL
1d2b : c5 23 __ CMP WORK + 0 
1d2d : 90 02 __ BCC $1d31 ; (divmod + 30)
1d2f : e5 23 __ SBC WORK + 0 
1d31 : 26 3b __ ROL ACCU + 0 
1d33 : ca __ __ DEX
1d34 : d0 eb __ BNE $1d21 ; (divmod + 14)
1d36 : 85 25 __ STA WORK + 2 
1d38 : 60 __ __ RTS
1d39 : a5 3b __ LDA ACCU + 0 
1d3b : 85 25 __ STA WORK + 2 
1d3d : a5 3c __ LDA ACCU + 1 
1d3f : 85 26 __ STA WORK + 3 
1d41 : a9 00 __ LDA #$00
1d43 : 85 3b __ STA ACCU + 0 
1d45 : 85 3c __ STA ACCU + 1 
1d47 : 60 __ __ RTS
1d48 : a5 24 __ LDA WORK + 1 
1d4a : d0 1f __ BNE $1d6b ; (divmod + 88)
1d4c : a5 23 __ LDA WORK + 0 
1d4e : 30 1b __ BMI $1d6b ; (divmod + 88)
1d50 : a9 00 __ LDA #$00
1d52 : 85 26 __ STA WORK + 3 
1d54 : a2 10 __ LDX #$10
1d56 : 06 3b __ ASL ACCU + 0 
1d58 : 26 3c __ ROL ACCU + 1 
1d5a : 2a __ __ ROL
1d5b : c5 23 __ CMP WORK + 0 
1d5d : 90 02 __ BCC $1d61 ; (divmod + 78)
1d5f : e5 23 __ SBC WORK + 0 
1d61 : 26 3b __ ROL ACCU + 0 
1d63 : 26 3c __ ROL ACCU + 1 
1d65 : ca __ __ DEX
1d66 : d0 f2 __ BNE $1d5a ; (divmod + 71)
1d68 : 85 25 __ STA WORK + 2 
1d6a : 60 __ __ RTS
1d6b : a9 00 __ LDA #$00
1d6d : 85 25 __ STA WORK + 2 
1d6f : 85 26 __ STA WORK + 3 
1d71 : 84 22 __ STY $22 
1d73 : a0 10 __ LDY #$10
1d75 : 18 __ __ CLC
1d76 : 26 3b __ ROL ACCU + 0 
1d78 : 26 3c __ ROL ACCU + 1 
1d7a : 26 25 __ ROL WORK + 2 
1d7c : 26 26 __ ROL WORK + 3 
1d7e : 38 __ __ SEC
1d7f : a5 25 __ LDA WORK + 2 
1d81 : e5 23 __ SBC WORK + 0 
1d83 : aa __ __ TAX
1d84 : a5 26 __ LDA WORK + 3 
1d86 : e5 24 __ SBC WORK + 1 
1d88 : 90 04 __ BCC $1d8e ; (divmod + 123)
1d8a : 86 25 __ STX WORK + 2 
1d8c : 85 26 __ STA WORK + 3 
1d8e : 88 __ __ DEY
1d8f : d0 e5 __ BNE $1d76 ; (divmod + 99)
1d91 : 26 3b __ ROL ACCU + 0 
1d93 : 26 3c __ ROL ACCU + 1 
1d95 : a4 22 __ LDY $22 
1d97 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1d98 : 24 3c __ BIT ACCU + 1 
1d9a : 10 0d __ BPL $1da9 ; (mods16 + 17)
1d9c : 20 f7 1c JSR $1cf7 ; (negaccu + 0)
1d9f : 24 24 __ BIT WORK + 1 
1da1 : 10 0d __ BPL $1db0 ; (mods16 + 24)
1da3 : 20 05 1d JSR $1d05 ; (negtmp + 0)
1da6 : 4c 13 1d JMP $1d13 ; (divmod + 0)
1da9 : 24 24 __ BIT WORK + 1 
1dab : 10 f9 __ BPL $1da6 ; (mods16 + 14)
1dad : 20 05 1d JSR $1d05 ; (negtmp + 0)
1db0 : 20 13 1d JSR $1d13 ; (divmod + 0)
1db3 : 38 __ __ SEC
1db4 : a9 00 __ LDA #$00
1db6 : e5 25 __ SBC WORK + 2 
1db8 : 85 25 __ STA WORK + 2 
1dba : a9 00 __ LDA #$00
1dbc : e5 26 __ SBC WORK + 3 
1dbe : 85 26 __ STA WORK + 3 
1dc0 : 60 __ __ RTS
--------------------------------------------------------------------
__multab12L:
1dc1 : __ __ __ BYT 00 0c 18 24 30 3c 48 54 60 6c 78 84 90 9c a8 b4 : ...$0<HT`lx.....
--------------------------------------------------------------------
__multab5L:
1dd1 : __ __ __ BYT 00 05 0a 0f 14 19 1e 23 28 2d 32 37 3c 41 46 4b : .......#(-27<AFK
--------------------------------------------------------------------
__multab3L:
1de1 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 18 1b 1e 21 24 27 2a 2d : ...........!$'*-
