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
080e : 8e fb 1a STX $1afb ; (spentry + 0)
0811 : a9 3b __ LDA #$3b
0813 : 85 39 __ STA IP + 0 
0815 : a9 43 __ LDA #$43
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 47 __ LDA #$47
081c : e9 43 __ SBC #$43
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
0830 : a9 4b __ LDA #$4b
0832 : e9 3b __ SBC #$3b
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
1afb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 e1 0a JSR $0ae1 ; (zsm_irq_init.s0 + 0)
0883 : 20 b5 0c JSR $0cb5 ; (ClearVERAScreen.s0 + 0)
0886 : 20 f8 0c JSR $0cf8 ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9f __ LDA #$9f
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
08b7 : 8d 20 9f STA $9f20 
08ba : 8d 21 9f STA $9f21 
08bd : 85 50 __ STA T1 + 0 
08bf : 85 51 __ STA T1 + 1 
08c1 : 85 52 __ STA T2 + 0 
08c3 : 85 53 __ STA T3 + 0 
.l2:
08c5 : 20 65 17 JSR $1765 ; (getchx.s0 + 0)
08c8 : a5 3b __ LDA ACCU + 0 
08ca : 85 54 __ STA T4 + 0 
08cc : a9 30 __ LDA #$30
08ce : 8d 2c 9f STA $9f2c 
08d1 : ee fb 22 INC $22fb ; (p + 0)
08d4 : d0 03 __ BNE $08d9 ; (main.s1017 + 0)
.s1016:
08d6 : ee fc 22 INC $22fc ; (p + 1)
.s1017:
08d9 : ad fd 22 LDA $22fd ; (Phase + 0)
08dc : 18 __ __ CLC
08dd : 69 01 __ ADC #$01
08df : 85 32 __ STA P5 
08e1 : 8d fd 22 STA $22fd ; (Phase + 0)
08e4 : ad fe 22 LDA $22fe ; (Phase + 1)
08e7 : 69 00 __ ADC #$00
08e9 : 85 33 __ STA P6 
08eb : 8d fe 22 STA $22fe ; (Phase + 1)
08ee : ad 58 41 LDA $4158 ; (Phase2 + 0)
08f1 : 18 __ __ CLC
08f2 : 69 01 __ ADC #$01
08f4 : 85 34 __ STA P7 
08f6 : 8d 58 41 STA $4158 ; (Phase2 + 0)
08f9 : ad 59 41 LDA $4159 ; (Phase2 + 1)
08fc : 69 00 __ ADC #$00
08fe : 85 35 __ STA P8 
0900 : 8d 59 41 STA $4159 ; (Phase2 + 1)
0903 : ad 5a 41 LDA $415a ; (Phase3 + 0)
0906 : 18 __ __ CLC
0907 : 69 01 __ ADC #$01
0909 : 85 36 __ STA P9 
090b : 8d 5a 41 STA $415a ; (Phase3 + 0)
090e : ad 5b 41 LDA $415b ; (Phase3 + 1)
0911 : 69 00 __ ADC #$00
0913 : 85 37 __ STA P10 
0915 : 8d 5b 41 STA $415b ; (Phase3 + 1)
0918 : 20 a0 17 JSR $17a0 ; (MoveSprites.s0 + 0)
091b : a5 52 __ LDA T2 + 0 
091d : f0 03 __ BEQ $0922 ; (main.s5 + 0)
091f : 4c c8 0a JMP $0ac8 ; (main.s4 + 0)
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
093a : 8d 5e 41 STA $415e ; (PalTimer + 0)
093d : 8d 5f 41 STA $415f ; (PalTimer + 1)
0940 : a9 60 __ LDA #$60
0942 : 85 35 __ STA P8 
0944 : a9 41 __ LDA #$41
0946 : 85 36 __ STA P9 
0948 : 20 3e 17 JSR $173e ; (SetPaletteColours.s0 + 0)
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
0971 : a9 9b __ LDA #$9b
0973 : 85 32 __ STA P5 
0975 : a9 22 __ LDA #$22
0977 : 85 33 __ STA P6 
0979 : 20 25 1b JSR $1b25 ; (SetPaletteIndex.s0 + 0)
097c : a9 00 __ LDA #$00
097e : 85 53 __ STA T3 + 0 
.s43:
0980 : ad 5f 41 LDA $415f ; (PalTimer + 1)
0983 : 30 5f __ BMI $09e4 ; (main.s44 + 0)
.s1013:
0985 : d0 07 __ BNE $098e ; (main.s13 + 0)
.s1012:
0987 : a9 03 __ LDA #$03
0989 : cd 5e 41 CMP $415e ; (PalTimer + 0)
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
09aa : ee 80 41 INC $4180 ; (PalIndex + 0)
09ad : d0 03 __ BNE $09b2 ; (main.s1021 + 0)
.s1020:
09af : ee 81 41 INC $4181 ; (PalIndex + 1)
.s1021:
09b2 : a9 40 __ LDA #$40
09b4 : 85 32 __ STA P5 
09b6 : a9 3d __ LDA #$3d
09b8 : 85 33 __ STA P6 
09ba : 20 25 1b JSR $1b25 ; (SetPaletteIndex.s0 + 0)
09bd : a9 50 __ LDA #$50
09bf : 85 34 __ STA P7 
09c1 : a9 00 __ LDA #$00
09c3 : 8d fc 9e STA $9efc ; (sstack + 0)
09c6 : 8d fd 9e STA $9efd ; (sstack + 1)
09c9 : 8d ff 9e STA $9eff ; (sstack + 3)
09cc : a9 10 __ LDA #$10
09ce : 8d fe 9e STA $9efe ; (sstack + 2)
09d1 : a9 82 __ LDA #$82
09d3 : 85 32 __ STA P5 
09d5 : a9 41 __ LDA #$41
09d7 : 85 33 __ STA P6 
09d9 : 20 25 1b JSR $1b25 ; (SetPaletteIndex.s0 + 0)
09dc : a9 00 __ LDA #$00
09de : 8d 5e 41 STA $415e ; (PalTimer + 0)
09e1 : 8d 5f 41 STA $415f ; (PalTimer + 1)
.s44:
09e4 : ad fc 22 LDA $22fc ; (p + 1)
09e7 : d0 42 __ BNE $0a2b ; (main.s18 + 0)
.s1011:
09e9 : ad fb 22 LDA $22fb ; (p + 0)
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
0a08 : cd a2 41 CMP $41a2 ; (ShimmerState + 0)
0a0b : 2a __ __ ROL
0a0c : 8d a2 41 STA $41a2 ; (ShimmerState + 0)
0a0f : d0 07 __ BNE $0a18 ; (main.s19 + 0)
.s20:
0a11 : a9 41 __ LDA #$41
0a13 : a0 c3 __ LDY #$c3
0a15 : 4c 1c 0a JMP $0a1c ; (main.s52 + 0)
.s19:
0a18 : a9 41 __ LDA #$41
0a1a : a0 a3 __ LDY #$a3
.s52:
0a1c : 84 35 __ STY P8 
0a1e : 85 36 __ STA P9 
0a20 : 20 3e 17 JSR $173e ; (SetPaletteColours.s0 + 0)
0a23 : a9 00 __ LDA #$00
0a25 : 8d fb 22 STA $22fb ; (p + 0)
0a28 : 8d fc 22 STA $22fc ; (p + 1)
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
0a63 : 20 d8 1b JSR $1bd8 ; (Control.s0 + 0)
0a66 : a5 3b __ LDA ACCU + 0 
0a68 : 85 52 __ STA T2 + 0 
0a6a : ad 5c 41 LDA $415c ; (FrameCount + 0)
0a6d : 85 3b __ STA ACCU + 0 
0a6f : ad 5d 41 LDA $415d ; (FrameCount + 1)
0a72 : 85 55 __ STA T4 + 1 
0a74 : 85 3c __ STA ACCU + 1 
0a76 : a9 04 __ LDA #$04
0a78 : 85 23 __ STA WORK + 0 
0a7a : a9 00 __ LDA #$00
0a7c : 85 24 __ STA WORK + 1 
0a7e : 20 30 1d JSR $1d30 ; (mods16 + 0)
0a81 : a5 26 __ LDA WORK + 3 
0a83 : d0 17 __ BNE $0a9c ; (main.s31 + 0)
.s1002:
0a85 : a5 25 __ LDA WORK + 2 
0a87 : c9 01 __ CMP #$01
0a89 : d0 11 __ BNE $0a9c ; (main.s31 + 0)
.s29:
0a8b : ae e4 41 LDX $41e4 ; (off1 + 0)
0a8e : e8 __ __ INX
0a8f : 8e e4 41 STX $41e4 ; (off1 + 0)
0a92 : bd ff 42 LDA $42ff,x ; (sintab + 255)
0a95 : 18 __ __ CLC
0a96 : 6d 23 9f ADC $9f23 
0a99 : 8d 23 9f STA $9f23 
.s31:
0a9c : ad 5c 41 LDA $415c ; (FrameCount + 0)
0a9f : 0a __ __ ASL
0aa0 : 26 55 __ ROL T4 + 1 
0aa2 : 8d 37 9f STA $9f37 
0aa5 : a5 55 __ LDA T4 + 1 
0aa7 : 8d 38 9f STA $9f38 
0aaa : a9 01 __ LDA #$01
0aac : 8d 2c 9f STA $9f2c 
0aaf : 20 d5 19 JSR $19d5 ; (zsm_fill.s0 + 0)
0ab2 : a9 00 __ LDA #$00
0ab4 : 8d 2c 9f STA $9f2c 
0ab7 : 20 80 1c JSR $1c80 ; (frame_wait.l1 + 0)
0aba : ee 5c 41 INC $415c ; (FrameCount + 0)
0abd : f0 03 __ BEQ $0ac2 ; (main.s1022 + 0)
0abf : 4c c5 08 JMP $08c5 ; (main.l2 + 0)
.s1022:
0ac2 : ee 5d 41 INC $415d ; (FrameCount + 1)
0ac5 : 4c c5 08 JMP $08c5 ; (main.l2 + 0)
.s4:
0ac8 : a5 50 __ LDA T1 + 0 
0aca : 85 32 __ STA P5 
0acc : a5 51 __ LDA T1 + 1 
0ace : 85 33 __ STA P6 
0ad0 : 20 fc 18 JSR $18fc ; (PlayZSM.s0 + 0)
0ad3 : ee 5e 41 INC $415e ; (PalTimer + 0)
0ad6 : f0 03 __ BEQ $0adb ; (main.s1018 + 0)
0ad8 : 4c 4b 09 JMP $094b ; (main.s42 + 0)
.s1018:
0adb : ee 5f 41 INC $415f ; (PalTimer + 1)
0ade : 4c 4b 09 JMP $094b ; (main.s42 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0ae1 : 78 __ __ SEI
0ae2 : ad 14 03 LDA $0314 
0ae5 : 8d e5 41 STA $41e5 ; (oirq + 0)
0ae8 : ad 15 03 LDA $0315 
0aeb : 8d e6 41 STA $41e6 ; (oirq + 1)
0aee : a9 fa __ LDA #$fa
0af0 : 8d 14 03 STA $0314 
0af3 : a9 0a __ LDA #$0a
0af5 : 8d 15 03 STA $0315 
0af8 : 58 __ __ CLI
.s1001:
0af9 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
41e5 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0afa : 20 00 0b JSR $0b00 ; (irq.s1000 + 0)
0afd : 6c e5 41 JMP ($41e5)
--------------------------------------------------------------------
irq:
.s1000:
0b00 : a5 2d __ LDA P0 
0b02 : 48 __ __ PHA
0b03 : a5 2e __ LDA P1 
0b05 : 48 __ __ PHA
0b06 : a5 3b __ LDA ACCU + 0 
0b08 : 48 __ __ PHA
0b09 : a5 3c __ LDA ACCU + 1 
0b0b : 48 __ __ PHA
0b0c : a5 47 __ LDA T0 + 0 
0b0e : 48 __ __ PHA
0b0f : a5 48 __ LDA $48 
0b11 : 48 __ __ PHA
0b12 : a5 49 __ LDA $49 
0b14 : 48 __ __ PHA
0b15 : a5 4a __ LDA $4a 
0b17 : 48 __ __ PHA
0b18 : a5 4b __ LDA $4b 
0b1a : 48 __ __ PHA
0b1b : a5 4c __ LDA $4c 
0b1d : 48 __ __ PHA
0b1e : a5 4d __ LDA $4d 
0b20 : 48 __ __ PHA
0b21 : a5 4e __ LDA $4e 
0b23 : 48 __ __ PHA
0b24 : a5 4f __ LDA $4f 
0b26 : 48 __ __ PHA
0b27 : a5 50 __ LDA $50 
0b29 : 48 __ __ PHA
.s0:
0b2a : ad fc 1a LDA $1afc ; (zsm_playing + 0)
0b2d : f0 08 __ BEQ $0b37 ; (irq.s1001 + 0)
.s4:
0b2f : ad fd 1a LDA $1afd ; (zsm_finished + 0)
0b32 : d0 03 __ BNE $0b37 ; (irq.s1001 + 0)
.s1:
0b34 : 20 62 0b JSR $0b62 ; (zsm_play.s0 + 0)
.s1001:
0b37 : 68 __ __ PLA
0b38 : 85 50 __ STA $50 
0b3a : 68 __ __ PLA
0b3b : 85 4f __ STA $4f 
0b3d : 68 __ __ PLA
0b3e : 85 4e __ STA $4e 
0b40 : 68 __ __ PLA
0b41 : 85 4d __ STA $4d 
0b43 : 68 __ __ PLA
0b44 : 85 4c __ STA $4c 
0b46 : 68 __ __ PLA
0b47 : 85 4b __ STA $4b 
0b49 : 68 __ __ PLA
0b4a : 85 4a __ STA $4a 
0b4c : 68 __ __ PLA
0b4d : 85 49 __ STA $49 
0b4f : 68 __ __ PLA
0b50 : 85 48 __ STA $48 
0b52 : 68 __ __ PLA
0b53 : 85 47 __ STA T0 + 0 
0b55 : 68 __ __ PLA
0b56 : 85 3c __ STA ACCU + 1 
0b58 : 68 __ __ PLA
0b59 : 85 3b __ STA ACCU + 0 
0b5b : 68 __ __ PLA
0b5c : 85 2e __ STA P1 
0b5e : 68 __ __ PLA
0b5f : 85 2d __ STA P0 
0b61 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1afc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1afd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0b62 : ad fe 1a LDA $1afe ; (zsm_paused + 0)
0b65 : f0 01 __ BEQ $0b68 ; (zsm_play.s2 + 0)
0b67 : 60 __ __ RTS
.s2:
0b68 : ad e7 41 LDA $41e7 ; (zsm_delay + 0)
0b6b : f0 03 __ BEQ $0b70 ; (zsm_play.s5 + 0)
0b6d : 4c 9d 0c JMP $0c9d ; (zsm_play.s4 + 0)
.s5:
0b70 : ad 25 9f LDA $9f25 
0b73 : 85 47 __ STA T0 + 0 
0b75 : ad 25 9f LDA $9f25 
0b78 : 29 fe __ AND #$fe
0b7a : 8d 25 9f STA $9f25 
0b7d : ad 20 9f LDA $9f20 
0b80 : 85 49 __ STA T2 + 0 
0b82 : ad 21 9f LDA $9f21 
0b85 : 85 4a __ STA T2 + 1 
0b87 : ad 22 9f LDA $9f22 
0b8a : 85 48 __ STA T1 + 0 
.l8:
0b8c : ad e8 41 LDA $41e8 ; (zsm_pos + 0)
0b8f : 85 4b __ STA T3 + 0 
0b91 : 18 __ __ CLC
0b92 : 69 01 __ ADC #$01
0b94 : 85 4d __ STA T4 + 0 
0b96 : 8d e8 41 STA $41e8 ; (zsm_pos + 0)
0b99 : ad e9 41 LDA $41e9 ; (zsm_pos + 1)
0b9c : aa __ __ TAX
0b9d : 69 00 __ ADC #$00
0b9f : 85 4e __ STA T4 + 1 
0ba1 : 8d e9 41 STA $41e9 ; (zsm_pos + 1)
0ba4 : 18 __ __ CLC
0ba5 : a9 3b __ LDA #$3b
0ba7 : 65 4b __ ADC T3 + 0 
0ba9 : 85 3b __ STA ACCU + 0 
0bab : 8a __ __ TXA
0bac : 29 03 __ AND #$03
0bae : 69 43 __ ADC #$43
0bb0 : 85 3c __ STA ACCU + 1 
0bb2 : a0 00 __ LDY #$00
0bb4 : b1 3b __ LDA (ACCU + 0),y 
0bb6 : c9 40 __ CMP #$40
0bb8 : b0 03 __ BCS $0bbd ; (zsm_play.s12 + 0)
0bba : 4c 68 0c JMP $0c68 ; (zsm_play.s11 + 0)
.s12:
0bbd : d0 22 __ BNE $0be1 ; (zsm_play.s15 + 0)
.s14:
0bbf : 18 __ __ CLC
0bc0 : a9 3b __ LDA #$3b
0bc2 : 65 4d __ ADC T4 + 0 
0bc4 : 85 4b __ STA T3 + 0 
0bc6 : a5 4e __ LDA T4 + 1 
0bc8 : 29 03 __ AND #$03
0bca : 69 43 __ ADC #$43
0bcc : 85 4c __ STA T3 + 1 
0bce : b1 4b __ LDA (T3 + 0),y 
0bd0 : 29 3f __ AND #$3f
0bd2 : 18 __ __ CLC
0bd3 : 65 4d __ ADC T4 + 0 
0bd5 : 8d e8 41 STA $41e8 ; (zsm_pos + 0)
0bd8 : 98 __ __ TYA
0bd9 : 65 4e __ ADC T4 + 1 
0bdb : 8d e9 41 STA $41e9 ; (zsm_pos + 1)
0bde : 4c 8c 0b JMP $0b8c ; (zsm_play.l8 + 0)
.s15:
0be1 : 09 00 __ ORA #$00
0be3 : 30 5b __ BMI $0c40 ; (zsm_play.s18 + 0)
.s17:
0be5 : 29 3f __ AND #$3f
0be7 : f0 a3 __ BEQ $0b8c ; (zsm_play.l8 + 0)
.s29:
0be9 : 84 50 __ STY T7 + 0 
0beb : 85 4f __ STA T6 + 0 
0bed : 18 __ __ CLC
.l1012:
0bee : a9 3b __ LDA #$3b
0bf0 : 6d e8 41 ADC $41e8 ; (zsm_pos + 0)
0bf3 : 85 4d __ STA T4 + 0 
0bf5 : ad e9 41 LDA $41e9 ; (zsm_pos + 1)
0bf8 : 29 03 __ AND #$03
0bfa : 69 43 __ ADC #$43
0bfc : 85 4e __ STA T4 + 1 
0bfe : a0 00 __ LDY #$00
0c00 : b1 4d __ LDA (T4 + 0),y 
0c02 : 85 2d __ STA P0 
0c04 : ad e8 41 LDA $41e8 ; (zsm_pos + 0)
0c07 : 18 __ __ CLC
0c08 : 69 01 __ ADC #$01
0c0a : aa __ __ TAX
0c0b : ad e9 41 LDA $41e9 ; (zsm_pos + 1)
0c0e : 69 00 __ ADC #$00
0c10 : 29 03 __ AND #$03
0c12 : 85 4c __ STA T3 + 1 
0c14 : 8a __ __ TXA
0c15 : 18 __ __ CLC
0c16 : 69 3b __ ADC #$3b
0c18 : 85 4b __ STA T3 + 0 
0c1a : a9 43 __ LDA #$43
0c1c : 65 4c __ ADC T3 + 1 
0c1e : 85 4c __ STA T3 + 1 
0c20 : b1 4b __ LDA (T3 + 0),y 
0c22 : 85 2e __ STA P1 
0c24 : 20 a1 0c JSR $0ca1 ; (sfx_put.l1 + 0)
0c27 : ad e8 41 LDA $41e8 ; (zsm_pos + 0)
0c2a : 18 __ __ CLC
0c2b : 69 02 __ ADC #$02
0c2d : 8d e8 41 STA $41e8 ; (zsm_pos + 0)
0c30 : 90 03 __ BCC $0c35 ; (zsm_play.s1015 + 0)
.s1014:
0c32 : ee e9 41 INC $41e9 ; (zsm_pos + 1)
.s1015:
0c35 : e6 50 __ INC T7 + 0 
0c37 : a5 50 __ LDA T7 + 0 
0c39 : c5 4f __ CMP T6 + 0 
0c3b : 90 b1 __ BCC $0bee ; (zsm_play.l1012 + 0)
0c3d : 4c 8c 0b JMP $0b8c ; (zsm_play.l8 + 0)
.s18:
0c40 : c9 80 __ CMP #$80
0c42 : d0 07 __ BNE $0c4b ; (zsm_play.s25 + 0)
.s24:
0c44 : a9 01 __ LDA #$01
0c46 : 8d fd 1a STA $1afd ; (zsm_finished + 0)
0c49 : d0 08 __ BNE $0c53 ; (zsm_play.s10 + 0)
.s25:
0c4b : 29 7f __ AND #$7f
0c4d : 38 __ __ SEC
0c4e : e9 01 __ SBC #$01
0c50 : 8d e7 41 STA $41e7 ; (zsm_delay + 0)
.s10:
0c53 : a5 49 __ LDA T2 + 0 
0c55 : 8d 20 9f STA $9f20 
0c58 : a5 4a __ LDA T2 + 1 
0c5a : 8d 21 9f STA $9f21 
0c5d : a5 48 __ LDA T1 + 0 
0c5f : 8d 22 9f STA $9f22 
0c62 : a5 47 __ LDA T0 + 0 
0c64 : 8d 25 9f STA $9f25 
.s1001:
0c67 : 60 __ __ RTS
.s11:
0c68 : 29 3f __ AND #$3f
0c6a : 09 c0 __ ORA #$c0
0c6c : 8d 20 9f STA $9f20 
0c6f : a9 f9 __ LDA #$f9
0c71 : 8d 21 9f STA $9f21 
0c74 : a9 01 __ LDA #$01
0c76 : 8d 22 9f STA $9f22 
0c79 : a5 4b __ LDA T3 + 0 
0c7b : 69 02 __ ADC #$02
0c7d : 8d e8 41 STA $41e8 ; (zsm_pos + 0)
0c80 : 90 01 __ BCC $0c83 ; (zsm_play.s1017 + 0)
.s1016:
0c82 : e8 __ __ INX
.s1017:
0c83 : 8e e9 41 STX $41e9 ; (zsm_pos + 1)
0c86 : 18 __ __ CLC
0c87 : a9 3b __ LDA #$3b
0c89 : 65 4d __ ADC T4 + 0 
0c8b : 85 4b __ STA T3 + 0 
0c8d : a5 4e __ LDA T4 + 1 
0c8f : 29 03 __ AND #$03
0c91 : 69 43 __ ADC #$43
0c93 : 85 4c __ STA T3 + 1 
0c95 : b1 4b __ LDA (T3 + 0),y 
0c97 : 8d 23 9f STA $9f23 
0c9a : 4c 8c 0b JMP $0b8c ; (zsm_play.l8 + 0)
.s4:
0c9d : ce e7 41 DEC $41e7 ; (zsm_delay + 0)
0ca0 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1afe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
41e7 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
433b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
41e8 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0ca1 : ad 41 9f LDA $9f41 
0ca4 : 30 fb __ BMI $0ca1 ; (sfx_put.l1 + 0)
.s3:
0ca6 : a5 2d __ LDA P0 ; (index + 0)
0ca8 : 8d 40 9f STA $9f40 
0cab : ea __ __ NOP
0cac : ea __ __ NOP
0cad : ea __ __ NOP
0cae : ea __ __ NOP
0caf : a5 2e __ LDA P1 ; (data + 0)
0cb1 : 8d 41 9f STA $9f41 
.s1001:
0cb4 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0cb5 : a9 93 __ LDA #$93
0cb7 : 85 2d __ STA P0 
0cb9 : a9 00 __ LDA #$00
0cbb : 85 2e __ STA P1 
0cbd : 20 f2 0c JSR $0cf2 ; (putch.s0 + 0)
0cc0 : a9 11 __ LDA #$11
0cc2 : 8d 22 9f STA $9f22 
0cc5 : a2 00 __ LDX #$00
.l2:
0cc7 : 8a __ __ TXA
0cc8 : 18 __ __ CLC
0cc9 : 69 b0 __ ADC #$b0
0ccb : 8d 21 9f STA $9f21 
0cce : a9 00 __ LDA #$00
0cd0 : 8d 20 9f STA $9f20 
0cd3 : a0 80 __ LDY #$80
.l1003:
0cd5 : a9 20 __ LDA #$20
0cd7 : 8d 23 9f STA $9f23 
0cda : a9 01 __ LDA #$01
0cdc : 8d 23 9f STA $9f23 
0cdf : a9 20 __ LDA #$20
0ce1 : 8d 24 9f STA $9f24 
0ce4 : a9 01 __ LDA #$01
0ce6 : 8d 24 9f STA $9f24 
0ce9 : 88 __ __ DEY
0cea : d0 e9 __ BNE $0cd5 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0cec : e8 __ __ INX
0ced : e0 40 __ CPX #$40
0cef : 90 d6 __ BCC $0cc7 ; (ClearVERAScreen.l2 + 0)
.s1001:
0cf1 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0cf2 : a5 2d __ LDA P0 
0cf4 : 20 d2 ff JSR $ffd2 
.s1001:
0cf7 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0cf8 : a9 00 __ LDA #$00
0cfa : 85 2d __ STA P0 
0cfc : 85 2e __ STA P1 
0cfe : 85 2f __ STA P2 
0d00 : 85 30 __ STA P3 
0d02 : 85 31 __ STA P4 
0d04 : 8d 25 9f STA $9f25 
0d07 : ad 29 9f LDA $9f29 
0d0a : 09 70 __ ORA #$70
0d0c : 8d 29 9f STA $9f29 
0d0f : a9 80 __ LDA #$80
0d11 : 8d 2b 9f STA $9f2b 
0d14 : 8d 2a 9f STA $9f2a 
0d17 : a9 62 __ LDA #$62
0d19 : 8d 2d 9f STA $9f2d 
0d1c : a9 68 __ LDA #$68
0d1e : 8d 34 9f STA $9f34 
0d21 : 20 99 15 JSR $1599 ; (tileBaseConfig.s0 + 0)
0d24 : 8d 2f 9f STA $9f2f 
0d27 : a9 20 __ LDA #$20
0d29 : 85 2f __ STA P2 
0d2b : 20 b2 15 JSR $15b2 ; (memoryToMapMemoryAddress.s0 + 0)
0d2e : 8d 2e 9f STA $9f2e 
0d31 : a9 21 __ LDA #$21
0d33 : 8d 22 9f STA $9f22 
0d36 : a2 80 __ LDX #$80
.l6:
0d38 : a0 50 __ LDY #$50
.l1030:
0d3a : a9 00 __ LDA #$00
0d3c : 8d 24 9f STA $9f24 
0d3f : a9 08 __ LDA #$08
0d41 : 8d 24 9f STA $9f24 
0d44 : 88 __ __ DEY
0d45 : d0 f3 __ BNE $0d3a ; (SetUpSprites.l1030 + 0)
.s1031:
0d47 : ca __ __ DEX
0d48 : d0 ee __ BNE $0d38 ; (SetUpSprites.l6 + 0)
.s4:
0d4a : 86 48 __ STX T1 + 0 
0d4c : a9 00 __ LDA #$00
0d4e : 85 2d __ STA P0 
0d50 : 85 2e __ STA P1 
0d52 : 85 2f __ STA P2 
0d54 : 85 30 __ STA P3 
0d56 : a9 40 __ LDA #$40
0d58 : 85 33 __ STA P6 
0d5a : a9 01 __ LDA #$01
0d5c : 85 34 __ STA P7 
0d5e : a9 59 __ LDA #$59
0d60 : 85 31 __ STA P4 
0d62 : a9 1d __ LDA #$1d
0d64 : 85 32 __ STA P5 
0d66 : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
0d69 : a9 10 __ LDA #$10
0d6b : 8d 22 9f STA $9f22 
0d6e : a9 00 __ LDA #$00
0d70 : 8d 20 9f STA $9f20 
0d73 : a9 20 __ LDA #$20
0d75 : 8d 21 9f STA $9f21 
.l10:
0d78 : a9 00 __ LDA #$00
0d7a : 85 49 __ STA T2 + 0 
.l14:
0d7c : 20 fb 15 JSR $15fb ; (rand.s0 + 0)
0d7f : a5 3b __ LDA ACCU + 0 
0d81 : 29 1f __ AND #$1f
0d83 : 85 3b __ STA ACCU + 0 
0d85 : a5 48 __ LDA T1 + 0 
0d87 : c9 34 __ CMP #$34
0d89 : 90 03 __ BCC $0d8e ; (SetUpSprites.s1028 + 0)
0d8b : 4c 20 15 JMP $1520 ; (SetUpSprites.s1027 + 0)
.s1028:
0d8e : c9 30 __ CMP #$30
0d90 : b0 03 __ BCS $0d95 ; (SetUpSprites.s17 + 0)
0d92 : 4c 20 15 JMP $1520 ; (SetUpSprites.s1027 + 0)
.s17:
0d95 : a9 09 __ LDA #$09
.s191:
0d97 : 8d 23 9f STA $9f23 
0d9a : a9 00 __ LDA #$00
0d9c : 8d 23 9f STA $9f23 
0d9f : e6 49 __ INC T2 + 0 
0da1 : 10 d9 __ BPL $0d7c ; (SetUpSprites.l14 + 0)
.s11:
0da3 : e6 48 __ INC T1 + 0 
0da5 : a5 48 __ LDA T1 + 0 
0da7 : c9 3c __ CMP #$3c
0da9 : 90 cd __ BCC $0d78 ; (SetUpSprites.l10 + 0)
.s12:
0dab : a9 00 __ LDA #$00
0dad : 85 2d __ STA P0 
0daf : 85 30 __ STA P3 
0db1 : 85 33 __ STA P6 
0db3 : a9 31 __ LDA #$31
0db5 : 85 2e __ STA P1 
0db7 : a9 01 __ LDA #$01
0db9 : 85 2f __ STA P2 
0dbb : a9 04 __ LDA #$04
0dbd : 85 34 __ STA P7 
0dbf : a9 9b __ LDA #$9b
0dc1 : 85 31 __ STA P4 
0dc3 : a9 1e __ LDA #$1e
0dc5 : 85 32 __ STA P5 
0dc7 : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
0dca : a9 00 __ LDA #$00
0dcc : 85 4d __ STA T5 + 0 
0dce : 85 4e __ STA T5 + 1 
.l49:
0dd0 : 85 2d __ STA P0 
0dd2 : 18 __ __ CLC
0dd3 : 69 02 __ ADC #$02
0dd5 : 85 4b __ STA T4 + 0 
0dd7 : a9 00 __ LDA #$00
0dd9 : 2a __ __ ROL
0dda : 85 4c __ STA T4 + 1 
0ddc : a9 88 __ LDA #$88
0dde : 85 2e __ STA P1 
0de0 : a9 09 __ LDA #$09
0de2 : 85 2f __ STA P2 
0de4 : a9 00 __ LDA #$00
0de6 : 85 30 __ STA P3 
0de8 : a9 03 __ LDA #$03
0dea : 85 31 __ STA P4 
0dec : 85 33 __ STA P6 
0dee : a9 01 __ LDA #$01
0df0 : 85 32 __ STA P5 
0df2 : 85 34 __ STA P7 
0df4 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
0df7 : a5 4d __ LDA T5 + 0 
0df9 : 85 2e __ STA P1 
0dfb : a5 4e __ LDA T5 + 1 
0dfd : 85 2f __ STA P2 
0dff : a9 90 __ LDA #$90
0e01 : 85 30 __ STA P3 
0e03 : a9 01 __ LDA #$01
0e05 : 85 31 __ STA P4 
0e07 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
0e0a : a9 00 __ LDA #$00
0e0c : 85 2e __ STA P1 
0e0e : a9 01 __ LDA #$01
0e10 : 85 2f __ STA P2 
0e12 : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
0e15 : a9 88 __ LDA #$88
0e17 : 85 2e __ STA P1 
0e19 : a9 09 __ LDA #$09
0e1b : 85 2f __ STA P2 
0e1d : a9 00 __ LDA #$00
0e1f : 85 30 __ STA P3 
0e21 : a9 03 __ LDA #$03
0e23 : 85 31 __ STA P4 
0e25 : e6 2d __ INC P0 
0e27 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
0e2a : a5 4d __ LDA T5 + 0 
0e2c : 85 2e __ STA P1 
0e2e : a5 4e __ LDA T5 + 1 
0e30 : 85 2f __ STA P2 
0e32 : a9 70 __ LDA #$70
0e34 : 85 30 __ STA P3 
0e36 : a9 01 __ LDA #$01
0e38 : 85 31 __ STA P4 
0e3a : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
0e3d : a5 4c __ LDA T4 + 1 
0e3f : d0 16 __ BNE $0e57 ; (SetUpSprites.s51 + 0)
.s1015:
0e41 : 18 __ __ CLC
0e42 : a5 2e __ LDA P1 
0e44 : 69 40 __ ADC #$40
0e46 : 85 4d __ STA T5 + 0 
0e48 : a5 2f __ LDA P2 
0e4a : 69 00 __ ADC #$00
0e4c : 85 4e __ STA T5 + 1 
0e4e : a5 4b __ LDA T4 + 0 
0e50 : c9 14 __ CMP #$14
0e52 : b0 03 __ BCS $0e57 ; (SetUpSprites.s51 + 0)
0e54 : 4c d0 0d JMP $0dd0 ; (SetUpSprites.l49 + 0)
.s51:
0e57 : a9 00 __ LDA #$00
0e59 : 85 2d __ STA P0 
0e5b : 85 30 __ STA P3 
0e5d : 85 33 __ STA P6 
0e5f : a9 30 __ LDA #$30
0e61 : 85 2e __ STA P1 
0e63 : a9 01 __ LDA #$01
0e65 : 85 2f __ STA P2 
0e67 : a9 00 __ LDA #$00
0e69 : 85 31 __ STA P4 
0e6b : a9 23 __ LDA #$23
0e6d : 85 32 __ STA P5 
0e6f : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
0e72 : a9 16 __ LDA #$16
0e74 : 85 2d __ STA P0 
0e76 : a9 80 __ LDA #$80
0e78 : 85 2e __ STA P1 
0e7a : a9 09 __ LDA #$09
0e7c : 85 2f __ STA P2 
0e7e : a9 01 __ LDA #$01
0e80 : 85 31 __ STA P4 
0e82 : 85 34 __ STA P7 
0e84 : a9 02 __ LDA #$02
0e86 : 85 32 __ STA P5 
0e88 : a9 03 __ LDA #$03
0e8a : 85 33 __ STA P6 
0e8c : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
0e8f : a9 30 __ LDA #$30
0e91 : 85 2e __ STA P1 
0e93 : a9 01 __ LDA #$01
0e95 : 85 2f __ STA P2 
0e97 : a9 b8 __ LDA #$b8
0e99 : 85 30 __ STA P3 
0e9b : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
0e9e : a9 20 __ LDA #$20
0ea0 : 85 2d __ STA P0 
0ea2 : a9 35 __ LDA #$35
0ea4 : 85 2e __ STA P1 
0ea6 : a9 00 __ LDA #$00
0ea8 : 85 30 __ STA P3 
0eaa : 85 33 __ STA P6 
0eac : a9 02 __ LDA #$02
0eae : 85 34 __ STA P7 
0eb0 : a9 00 __ LDA #$00
0eb2 : 85 31 __ STA P4 
0eb4 : a9 24 __ LDA #$24
0eb6 : 85 32 __ STA P5 
0eb8 : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
0ebb : a9 17 __ LDA #$17
0ebd : 85 2d __ STA P0 
0ebf : a9 a9 __ LDA #$a9
0ec1 : 85 2e __ STA P1 
0ec3 : a9 09 __ LDA #$09
0ec5 : 85 2f __ STA P2 
0ec7 : a9 02 __ LDA #$02
0ec9 : 85 31 __ STA P4 
0ecb : 85 32 __ STA P5 
0ecd : a9 03 __ LDA #$03
0ecf : 85 33 __ STA P6 
0ed1 : a9 01 __ LDA #$01
0ed3 : 85 34 __ STA P7 
0ed5 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
0ed8 : a9 fc __ LDA #$fc
0eda : 85 2e __ STA P1 
0edc : a9 00 __ LDA #$00
0ede : 85 2f __ STA P2 
0ee0 : a9 b8 __ LDA #$b8
0ee2 : 85 30 __ STA P3 
0ee4 : a9 01 __ LDA #$01
0ee6 : 85 31 __ STA P4 
0ee8 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
0eeb : a9 18 __ LDA #$18
0eed : 85 2d __ STA P0 
0eef : a9 a9 __ LDA #$a9
0ef1 : 85 2e __ STA P1 
0ef3 : a9 09 __ LDA #$09
0ef5 : 85 2f __ STA P2 
0ef7 : a9 00 __ LDA #$00
0ef9 : 85 30 __ STA P3 
0efb : a9 02 __ LDA #$02
0efd : 85 31 __ STA P4 
0eff : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
0f02 : a9 4c __ LDA #$4c
0f04 : 85 2e __ STA P1 
0f06 : a9 01 __ LDA #$01
0f08 : 85 2f __ STA P2 
0f0a : 85 31 __ STA P4 
0f0c : a9 b8 __ LDA #$b8
0f0e : 85 30 __ STA P3 
0f10 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
0f13 : a9 01 __ LDA #$01
0f15 : 85 2e __ STA P1 
0f17 : a9 00 __ LDA #$00
0f19 : 85 2f __ STA P2 
0f1b : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
0f1e : a9 10 __ LDA #$10
0f20 : 85 2d __ STA P0 
0f22 : a9 20 __ LDA #$20
0f24 : 85 30 __ STA P3 
0f26 : a9 00 __ LDA #$00
0f28 : 85 31 __ STA P4 
0f2a : a9 9b __ LDA #$9b
0f2c : 85 2e __ STA P1 
0f2e : a9 22 __ LDA #$22
0f30 : 85 2f __ STA P2 
0f32 : 20 f5 16 JSR $16f5 ; (vera_pal_putn.s0 + 0)
0f35 : a9 00 __ LDA #$00
0f37 : 85 2d __ STA P0 
0f39 : 85 30 __ STA P3 
0f3b : 85 34 __ STA P7 
0f3d : a9 35 __ LDA #$35
0f3f : 85 2e __ STA P1 
0f41 : a9 01 __ LDA #$01
0f43 : 85 2f __ STA P2 
0f45 : a9 20 __ LDA #$20
0f47 : 85 33 __ STA P6 
0f49 : a9 bb __ LDA #$bb
0f4b : 85 31 __ STA P4 
0f4d : a9 22 __ LDA #$22
0f4f : 85 32 __ STA P5 
0f51 : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
0f54 : a9 00 __ LDA #$00
0f56 : 85 48 __ STA T1 + 0 
0f58 : 85 49 __ STA T2 + 0 
0f5a : a9 03 __ LDA #$03
0f5c : 85 33 __ STA P6 
0f5e : a9 02 __ LDA #$02
0f60 : 85 34 __ STA P7 
0f62 : 18 __ __ CLC
.l1048:
0f63 : a9 a8 __ LDA #$a8
0f65 : 85 2e __ STA P1 
0f67 : a9 09 __ LDA #$09
0f69 : 85 2f __ STA P2 
0f6b : a9 00 __ LDA #$00
0f6d : 85 30 __ STA P3 
0f6f : 85 31 __ STA P4 
0f71 : 85 32 __ STA P5 
0f73 : a5 48 __ LDA T1 + 0 
0f75 : 69 19 __ ADC #$19
0f77 : 85 2d __ STA P0 
0f79 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
0f7c : a9 b8 __ LDA #$b8
0f7e : 85 30 __ STA P3 
0f80 : a9 01 __ LDA #$01
0f82 : 85 31 __ STA P4 
0f84 : 38 __ __ SEC
0f85 : a5 49 __ LDA T2 + 0 
0f87 : e9 fc __ SBC #$fc
0f89 : 85 2e __ STA P1 
0f8b : a9 00 __ LDA #$00
0f8d : e9 03 __ SBC #$03
0f8f : 85 2f __ STA P2 
0f91 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
0f94 : 18 __ __ CLC
0f95 : a5 49 __ LDA T2 + 0 
0f97 : 69 0c __ ADC #$0c
0f99 : 85 49 __ STA T2 + 0 
0f9b : e6 48 __ INC T1 + 0 
0f9d : a5 48 __ LDA T1 + 0 
0f9f : c9 08 __ CMP #$08
0fa1 : 90 c0 __ BCC $0f63 ; (SetUpSprites.l1048 + 0)
.s55:
0fa3 : a9 00 __ LDA #$00
0fa5 : 85 48 __ STA T1 + 0 
0fa7 : 85 49 __ STA T2 + 0 
0fa9 : a9 03 __ LDA #$03
0fab : 85 33 __ STA P6 
0fad : 85 34 __ STA P7 
0faf : 18 __ __ CLC
.l1050:
0fb0 : a9 a8 __ LDA #$a8
0fb2 : 85 2e __ STA P1 
0fb4 : a9 09 __ LDA #$09
0fb6 : 85 2f __ STA P2 
0fb8 : a9 00 __ LDA #$00
0fba : 85 30 __ STA P3 
0fbc : 85 31 __ STA P4 
0fbe : a5 48 __ LDA T1 + 0 
0fc0 : 69 21 __ ADC #$21
0fc2 : 85 2d __ STA P0 
0fc4 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
0fc7 : a9 c4 __ LDA #$c4
0fc9 : 85 30 __ STA P3 
0fcb : a9 01 __ LDA #$01
0fcd : 85 31 __ STA P4 
0fcf : 38 __ __ SEC
0fd0 : a5 49 __ LDA T2 + 0 
0fd2 : e9 fc __ SBC #$fc
0fd4 : 85 2e __ STA P1 
0fd6 : a9 00 __ LDA #$00
0fd8 : e9 03 __ SBC #$03
0fda : 85 2f __ STA P2 
0fdc : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
0fdf : 18 __ __ CLC
0fe0 : a5 49 __ LDA T2 + 0 
0fe2 : 69 0c __ ADC #$0c
0fe4 : 85 49 __ STA T2 + 0 
0fe6 : e6 48 __ INC T1 + 0 
0fe8 : a5 48 __ LDA T1 + 0 
0fea : c9 08 __ CMP #$08
0fec : 90 c2 __ BCC $0fb0 ; (SetUpSprites.l1050 + 0)
.s59:
0fee : a9 00 __ LDA #$00
0ff0 : 85 48 __ STA T1 + 0 
0ff2 : 85 49 __ STA T2 + 0 
0ff4 : a9 03 __ LDA #$03
0ff6 : 85 33 __ STA P6 
0ff8 : a9 04 __ LDA #$04
0ffa : 85 34 __ STA P7 
0ffc : 18 __ __ CLC
.l1052:
0ffd : a9 a8 __ LDA #$a8
0fff : 85 2e __ STA P1 
1001 : a9 09 __ LDA #$09
1003 : 85 2f __ STA P2 
1005 : a9 00 __ LDA #$00
1007 : 85 30 __ STA P3 
1009 : 85 31 __ STA P4 
100b : a5 48 __ LDA T1 + 0 
100d : 69 29 __ ADC #$29
100f : 85 2d __ STA P0 
1011 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
1014 : a9 b8 __ LDA #$b8
1016 : 85 30 __ STA P3 
1018 : a9 01 __ LDA #$01
101a : 85 31 __ STA P4 
101c : 38 __ __ SEC
101d : a9 6c __ LDA #$6c
101f : e5 49 __ SBC T2 + 0 
1021 : 85 2e __ STA P1 
1023 : a9 02 __ LDA #$02
1025 : e9 04 __ SBC #$04
1027 : 85 2f __ STA P2 
1029 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
102c : 18 __ __ CLC
102d : a5 49 __ LDA T2 + 0 
102f : 69 0c __ ADC #$0c
1031 : 85 49 __ STA T2 + 0 
1033 : e6 48 __ INC T1 + 0 
1035 : a5 48 __ LDA T1 + 0 
1037 : c9 08 __ CMP #$08
1039 : 90 c2 __ BCC $0ffd ; (SetUpSprites.l1052 + 0)
.s63:
103b : a9 00 __ LDA #$00
103d : 85 48 __ STA T1 + 0 
.l65:
103f : 38 __ __ SEC
1040 : a9 00 __ LDA #$00
1042 : e5 48 __ SBC T1 + 0 
1044 : 29 0c __ AND #$0c
1046 : 49 ff __ EOR #$ff
1048 : 38 __ __ SEC
1049 : 69 6c __ ADC #$6c
104b : 85 49 __ STA T2 + 0 
104d : a9 02 __ LDA #$02
104f : e9 00 __ SBC #$00
1051 : 85 4a __ STA T2 + 1 
1053 : 18 __ __ CLC
1054 : a5 48 __ LDA T1 + 0 
1056 : 69 31 __ ADC #$31
1058 : 85 2d __ STA P0 
105a : a9 02 __ LDA #$02
105c : 85 4f __ STA T7 + 0 
105e : a9 03 __ LDA #$03
1060 : 85 33 __ STA P6 
1062 : a9 04 __ LDA #$04
1064 : 85 34 __ STA P7 
.l1038:
1066 : a9 a8 __ LDA #$a8
1068 : 85 2e __ STA P1 
106a : a9 09 __ LDA #$09
106c : 85 2f __ STA P2 
106e : a9 00 __ LDA #$00
1070 : 85 30 __ STA P3 
1072 : 85 31 __ STA P4 
1074 : 85 32 __ STA P5 
1076 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
1079 : a5 49 __ LDA T2 + 0 
107b : 85 2e __ STA P1 
107d : a5 4a __ LDA T2 + 1 
107f : 85 2f __ STA P2 
1081 : a9 b8 __ LDA #$b8
1083 : 85 30 __ STA P3 
1085 : a9 01 __ LDA #$01
1087 : 85 31 __ STA P4 
1089 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
108c : c6 4f __ DEC T7 + 0 
108e : d0 d6 __ BNE $1066 ; (SetUpSprites.l1038 + 0)
.s66:
1090 : e6 48 __ INC T1 + 0 
1092 : a5 48 __ LDA T1 + 0 
1094 : c9 02 __ CMP #$02
1096 : 90 a7 __ BCC $103f ; (SetUpSprites.l65 + 0)
.s67:
1098 : a9 60 __ LDA #$60
109a : 85 2d __ STA P0 
109c : a9 4f __ LDA #$4f
109e : 85 2e __ STA P1 
10a0 : a9 01 __ LDA #$01
10a2 : 85 2f __ STA P2 
10a4 : 85 34 __ STA P7 
10a6 : a9 00 __ LDA #$00
10a8 : 85 30 __ STA P3 
10aa : 85 33 __ STA P6 
10ac : a9 00 __ LDA #$00
10ae : 85 31 __ STA P4 
10b0 : a9 26 __ LDA #$26
10b2 : 85 32 __ STA P5 
10b4 : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
10b7 : a9 33 __ LDA #$33
10b9 : 85 2d __ STA P0 
10bb : a9 7b __ LDA #$7b
10bd : 85 2e __ STA P1 
10bf : a9 0a __ LDA #$0a
10c1 : 85 2f __ STA P2 
10c3 : a9 01 __ LDA #$01
10c5 : 85 31 __ STA P4 
10c7 : a9 02 __ LDA #$02
10c9 : 85 32 __ STA P5 
10cb : a9 03 __ LDA #$03
10cd : 85 33 __ STA P6 
10cf : a9 06 __ LDA #$06
10d1 : 85 34 __ STA P7 
10d3 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
10d6 : a9 00 __ LDA #$00
10d8 : 85 2e __ STA P1 
10da : 85 31 __ STA P4 
10dc : a9 01 __ LDA #$01
10de : 85 2f __ STA P2 
10e0 : a9 78 __ LDA #$78
10e2 : 85 30 __ STA P3 
10e4 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
10e7 : a9 20 __ LDA #$20
10e9 : 85 2d __ STA P0 
10eb : a9 3f __ LDA #$3f
10ed : 85 2e __ STA P1 
10ef : a9 00 __ LDA #$00
10f1 : 85 30 __ STA P3 
10f3 : 85 33 __ STA P6 
10f5 : a9 04 __ LDA #$04
10f7 : 85 34 __ STA P7 
10f9 : a9 00 __ LDA #$00
10fb : 85 31 __ STA P4 
10fd : a9 27 __ LDA #$27
10ff : 85 32 __ STA P5 
1101 : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
1104 : a9 34 __ LDA #$34
1106 : 85 2d __ STA P0 
1108 : a9 f9 __ LDA #$f9
110a : 85 2e __ STA P1 
110c : a9 09 __ LDA #$09
110e : 85 2f __ STA P2 
1110 : a9 03 __ LDA #$03
1112 : 85 31 __ STA P4 
1114 : 85 33 __ STA P6 
1116 : a9 02 __ LDA #$02
1118 : 85 32 __ STA P5 
111a : a9 05 __ LDA #$05
111c : 85 34 __ STA P7 
111e : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
1121 : a9 00 __ LDA #$00
1123 : 85 2e __ STA P1 
1125 : 85 31 __ STA P4 
1127 : a9 01 __ LDA #$01
1129 : 85 2f __ STA P2 
112b : a9 78 __ LDA #$78
112d : 85 30 __ STA P3 
112f : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1132 : a9 35 __ LDA #$35
1134 : 85 2d __ STA P0 
1136 : a9 19 __ LDA #$19
1138 : 85 2e __ STA P1 
113a : a9 0a __ LDA #$0a
113c : 85 2f __ STA P2 
113e : a9 00 __ LDA #$00
1140 : 85 30 __ STA P3 
1142 : a9 03 __ LDA #$03
1144 : 85 31 __ STA P4 
1146 : a9 07 __ LDA #$07
1148 : 85 33 __ STA P6 
114a : a9 06 __ LDA #$06
114c : 85 34 __ STA P7 
114e : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
1151 : a9 00 __ LDA #$00
1153 : 85 2e __ STA P1 
1155 : 85 31 __ STA P4 
1157 : a9 01 __ LDA #$01
1159 : 85 2f __ STA P2 
115b : a9 e8 __ LDA #$e8
115d : 85 30 __ STA P3 
115f : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1162 : a9 36 __ LDA #$36
1164 : 85 2d __ STA P0 
1166 : a9 19 __ LDA #$19
1168 : 85 2e __ STA P1 
116a : a9 0a __ LDA #$0a
116c : 85 2f __ STA P2 
116e : a9 00 __ LDA #$00
1170 : 85 30 __ STA P3 
1172 : a9 03 __ LDA #$03
1174 : 85 31 __ STA P4 
1176 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
1179 : a9 40 __ LDA #$40
117b : 85 2e __ STA P1 
117d : a9 01 __ LDA #$01
117f : 85 2f __ STA P2 
1181 : a9 e8 __ LDA #$e8
1183 : 85 30 __ STA P3 
1185 : a9 00 __ LDA #$00
1187 : 85 31 __ STA P4 
1189 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
118c : a9 01 __ LDA #$01
118e : 85 2e __ STA P1 
1190 : a9 00 __ LDA #$00
1192 : 85 2f __ STA P2 
1194 : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
1197 : a9 37 __ LDA #$37
1199 : 85 2d __ STA P0 
119b : a9 19 __ LDA #$19
119d : 85 2e __ STA P1 
119f : a9 0a __ LDA #$0a
11a1 : 85 2f __ STA P2 
11a3 : a9 00 __ LDA #$00
11a5 : 85 30 __ STA P3 
11a7 : a9 03 __ LDA #$03
11a9 : 85 31 __ STA P4 
11ab : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
11ae : a9 00 __ LDA #$00
11b0 : 85 2e __ STA P1 
11b2 : a9 01 __ LDA #$01
11b4 : 85 2f __ STA P2 
11b6 : 85 31 __ STA P4 
11b8 : a9 08 __ LDA #$08
11ba : 85 30 __ STA P3 
11bc : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
11bf : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
11c2 : a9 38 __ LDA #$38
11c4 : 85 2d __ STA P0 
11c6 : a9 19 __ LDA #$19
11c8 : 85 2e __ STA P1 
11ca : a9 0a __ LDA #$0a
11cc : 85 2f __ STA P2 
11ce : a9 00 __ LDA #$00
11d0 : 85 30 __ STA P3 
11d2 : a9 03 __ LDA #$03
11d4 : 85 31 __ STA P4 
11d6 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
11d9 : a9 40 __ LDA #$40
11db : 85 2e __ STA P1 
11dd : a9 01 __ LDA #$01
11df : 85 2f __ STA P2 
11e1 : 85 31 __ STA P4 
11e3 : a9 08 __ LDA #$08
11e5 : 85 30 __ STA P3 
11e7 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
11ea : a9 01 __ LDA #$01
11ec : 85 2e __ STA P1 
11ee : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
11f1 : a9 20 __ LDA #$20
11f3 : 85 2d __ STA P0 
11f5 : a9 37 __ LDA #$37
11f7 : 85 2e __ STA P1 
11f9 : a9 00 __ LDA #$00
11fb : 85 30 __ STA P3 
11fd : 85 33 __ STA P6 
11ff : a9 08 __ LDA #$08
1201 : 85 34 __ STA P7 
1203 : a9 00 __ LDA #$00
1205 : 85 31 __ STA P4 
1207 : a9 2b __ LDA #$2b
1209 : 85 32 __ STA P5 
120b : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
120e : a9 00 __ LDA #$00
1210 : 85 48 __ STA T1 + 0 
1212 : 85 49 __ STA T2 + 0 
1214 : 85 4a __ STA T2 + 1 
1216 : a9 02 __ LDA #$02
1218 : 85 33 __ STA P6 
121a : a9 05 __ LDA #$05
121c : 85 34 __ STA P7 
121e : 18 __ __ CLC
.l1054:
121f : a9 b9 __ LDA #$b9
1221 : 85 2e __ STA P1 
1223 : a9 09 __ LDA #$09
1225 : 85 2f __ STA P2 
1227 : a9 00 __ LDA #$00
1229 : 85 30 __ STA P3 
122b : a9 03 __ LDA #$03
122d : 85 31 __ STA P4 
122f : 85 32 __ STA P5 
1231 : a5 48 __ LDA T1 + 0 
1233 : 69 39 __ ADC #$39
1235 : 85 2d __ STA P0 
1237 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
123a : a9 20 __ LDA #$20
123c : 85 2e __ STA P1 
123e : a9 01 __ LDA #$01
1240 : 85 2f __ STA P2 
1242 : 38 __ __ SEC
1243 : a5 49 __ LDA T2 + 0 
1245 : e9 20 __ SBC #$20
1247 : 85 30 __ STA P3 
1249 : a5 4a __ LDA T2 + 1 
124b : e9 00 __ SBC #$00
124d : 85 31 __ STA P4 
124f : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1252 : 18 __ __ CLC
1253 : a5 49 __ LDA T2 + 0 
1255 : 69 40 __ ADC #$40
1257 : 85 49 __ STA T2 + 0 
1259 : 90 02 __ BCC $125d ; (SetUpSprites.s1061 + 0)
.s1060:
125b : e6 4a __ INC T2 + 1 
.s1061:
125d : e6 48 __ INC T1 + 0 
125f : a5 48 __ LDA T1 + 0 
1261 : c9 07 __ CMP #$07
1263 : 90 ba __ BCC $121f ; (SetUpSprites.l1054 + 0)
.s75:
1265 : a9 20 __ LDA #$20
1267 : 85 2d __ STA P0 
1269 : a9 47 __ LDA #$47
126b : 85 2e __ STA P1 
126d : a9 00 __ LDA #$00
126f : 85 30 __ STA P3 
1271 : 85 33 __ STA P6 
1273 : a9 08 __ LDA #$08
1275 : 85 34 __ STA P7 
1277 : a9 00 __ LDA #$00
1279 : 85 31 __ STA P4 
127b : a9 33 __ LDA #$33
127d : 85 32 __ STA P5 
127f : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
1282 : a9 47 __ LDA #$47
1284 : 85 2d __ STA P0 
1286 : a9 39 __ LDA #$39
1288 : 85 2e __ STA P1 
128a : a9 0a __ LDA #$0a
128c : 85 2f __ STA P2 
128e : a9 03 __ LDA #$03
1290 : 85 31 __ STA P4 
1292 : 85 32 __ STA P5 
1294 : a9 07 __ LDA #$07
1296 : 85 33 __ STA P6 
1298 : a9 06 __ LDA #$06
129a : 85 34 __ STA P7 
129c : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
129f : a9 08 __ LDA #$08
12a1 : 85 2e __ STA P1 
12a3 : 85 30 __ STA P3 
12a5 : a9 00 __ LDA #$00
12a7 : 85 2f __ STA P2 
12a9 : 85 31 __ STA P4 
12ab : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
12ae : a9 48 __ LDA #$48
12b0 : 85 2d __ STA P0 
12b2 : a9 39 __ LDA #$39
12b4 : 85 2e __ STA P1 
12b6 : a9 0a __ LDA #$0a
12b8 : 85 2f __ STA P2 
12ba : a9 00 __ LDA #$00
12bc : 85 30 __ STA P3 
12be : a9 03 __ LDA #$03
12c0 : 85 31 __ STA P4 
12c2 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
12c5 : a9 48 __ LDA #$48
12c7 : 85 2e __ STA P1 
12c9 : a9 00 __ LDA #$00
12cb : 85 2f __ STA P2 
12cd : 85 31 __ STA P4 
12cf : a9 08 __ LDA #$08
12d1 : 85 30 __ STA P3 
12d3 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
12d6 : a9 01 __ LDA #$01
12d8 : 85 2e __ STA P1 
12da : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
12dd : a9 49 __ LDA #$49
12df : 85 2d __ STA P0 
12e1 : a9 39 __ LDA #$39
12e3 : 85 2e __ STA P1 
12e5 : a9 0a __ LDA #$0a
12e7 : 85 2f __ STA P2 
12e9 : a9 00 __ LDA #$00
12eb : 85 30 __ STA P3 
12ed : a9 03 __ LDA #$03
12ef : 85 31 __ STA P4 
12f1 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
12f4 : a9 48 __ LDA #$48
12f6 : 85 2e __ STA P1 
12f8 : 85 30 __ STA P3 
12fa : a9 00 __ LDA #$00
12fc : 85 2f __ STA P2 
12fe : 85 31 __ STA P4 
1300 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1303 : a9 01 __ LDA #$01
1305 : 85 2e __ STA P1 
1307 : 85 2f __ STA P2 
1309 : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
130c : a9 4a __ LDA #$4a
130e : 85 2d __ STA P0 
1310 : a9 39 __ LDA #$39
1312 : 85 2e __ STA P1 
1314 : a9 0a __ LDA #$0a
1316 : 85 2f __ STA P2 
1318 : a9 00 __ LDA #$00
131a : 85 30 __ STA P3 
131c : a9 03 __ LDA #$03
131e : 85 31 __ STA P4 
1320 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
1323 : a9 08 __ LDA #$08
1325 : 85 2e __ STA P1 
1327 : a9 00 __ LDA #$00
1329 : 85 2f __ STA P2 
132b : 85 31 __ STA P4 
132d : a9 48 __ LDA #$48
132f : 85 30 __ STA P3 
1331 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1334 : a9 00 __ LDA #$00
1336 : 85 2e __ STA P1 
1338 : a9 01 __ LDA #$01
133a : 85 2f __ STA P2 
133c : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
133f : a9 20 __ LDA #$20
1341 : 85 2d __ STA P0 
1343 : a9 47 __ LDA #$47
1345 : 85 2e __ STA P1 
1347 : a9 00 __ LDA #$00
1349 : 85 30 __ STA P3 
134b : a9 00 __ LDA #$00
134d : 85 31 __ STA P4 
134f : a9 33 __ LDA #$33
1351 : 85 32 __ STA P5 
1353 : a9 00 __ LDA #$00
1355 : 85 33 __ STA P6 
1357 : a9 08 __ LDA #$08
1359 : 85 34 __ STA P7 
135b : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
135e : a9 4b __ LDA #$4b
1360 : 85 2d __ STA P0 
1362 : a9 39 __ LDA #$39
1364 : 85 2e __ STA P1 
1366 : a9 0a __ LDA #$0a
1368 : 85 2f __ STA P2 
136a : a9 03 __ LDA #$03
136c : 85 31 __ STA P4 
136e : 85 32 __ STA P5 
1370 : a9 07 __ LDA #$07
1372 : 85 33 __ STA P6 
1374 : a9 06 __ LDA #$06
1376 : 85 34 __ STA P7 
1378 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
137b : a9 f8 __ LDA #$f8
137d : 85 2e __ STA P1 
137f : a9 01 __ LDA #$01
1381 : 85 2f __ STA P2 
1383 : a9 08 __ LDA #$08
1385 : 85 30 __ STA P3 
1387 : a9 00 __ LDA #$00
1389 : 85 31 __ STA P4 
138b : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
138e : a9 4c __ LDA #$4c
1390 : 85 2d __ STA P0 
1392 : a9 39 __ LDA #$39
1394 : 85 2e __ STA P1 
1396 : a9 0a __ LDA #$0a
1398 : 85 2f __ STA P2 
139a : a9 00 __ LDA #$00
139c : 85 30 __ STA P3 
139e : a9 03 __ LDA #$03
13a0 : 85 31 __ STA P4 
13a2 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
13a5 : a9 38 __ LDA #$38
13a7 : 85 2e __ STA P1 
13a9 : a9 02 __ LDA #$02
13ab : 85 2f __ STA P2 
13ad : a9 08 __ LDA #$08
13af : 85 30 __ STA P3 
13b1 : a9 00 __ LDA #$00
13b3 : 85 31 __ STA P4 
13b5 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
13b8 : a9 01 __ LDA #$01
13ba : 85 2e __ STA P1 
13bc : a9 00 __ LDA #$00
13be : 85 2f __ STA P2 
13c0 : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
13c3 : a9 4d __ LDA #$4d
13c5 : 85 2d __ STA P0 
13c7 : a9 39 __ LDA #$39
13c9 : 85 2e __ STA P1 
13cb : a9 0a __ LDA #$0a
13cd : 85 2f __ STA P2 
13cf : a9 00 __ LDA #$00
13d1 : 85 30 __ STA P3 
13d3 : a9 03 __ LDA #$03
13d5 : 85 31 __ STA P4 
13d7 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
13da : a9 38 __ LDA #$38
13dc : 85 2e __ STA P1 
13de : a9 02 __ LDA #$02
13e0 : 85 2f __ STA P2 
13e2 : a9 48 __ LDA #$48
13e4 : 85 30 __ STA P3 
13e6 : a9 00 __ LDA #$00
13e8 : 85 31 __ STA P4 
13ea : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
13ed : a9 01 __ LDA #$01
13ef : 85 2e __ STA P1 
13f1 : 85 2f __ STA P2 
13f3 : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
13f6 : a9 4e __ LDA #$4e
13f8 : 85 2d __ STA P0 
13fa : a9 39 __ LDA #$39
13fc : 85 2e __ STA P1 
13fe : a9 0a __ LDA #$0a
1400 : 85 2f __ STA P2 
1402 : a9 00 __ LDA #$00
1404 : 85 30 __ STA P3 
1406 : a9 03 __ LDA #$03
1408 : 85 31 __ STA P4 
140a : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
140d : a9 f8 __ LDA #$f8
140f : 85 2e __ STA P1 
1411 : a9 01 __ LDA #$01
1413 : 85 2f __ STA P2 
1415 : a9 48 __ LDA #$48
1417 : 85 30 __ STA P3 
1419 : a9 00 __ LDA #$00
141b : 85 31 __ STA P4 
141d : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1420 : a9 00 __ LDA #$00
1422 : 85 2e __ STA P1 
1424 : 20 b8 16 JSR $16b8 ; (vera_spr_flip.s0 + 0)
1427 : a9 a0 __ LDA #$a0
1429 : 85 2d __ STA P0 
142b : a9 50 __ LDA #$50
142d : 85 2e __ STA P1 
142f : a9 00 __ LDA #$00
1431 : 85 30 __ STA P3 
1433 : 85 33 __ STA P6 
1435 : a9 02 __ LDA #$02
1437 : 85 34 __ STA P7 
1439 : a9 00 __ LDA #$00
143b : 85 31 __ STA P4 
143d : a9 3b __ LDA #$3b
143f : 85 32 __ STA P5 
1441 : 20 c0 15 JSR $15c0 ; (vram_putn.s0 + 0)
1444 : a9 00 __ LDA #$00
1446 : 85 47 __ STA T0 + 0 
1448 : a9 85 __ LDA #$85
144a : 85 2e __ STA P1 
144c : a9 0a __ LDA #$0a
144e : 85 2f __ STA P2 
1450 : a9 02 __ LDA #$02
1452 : 85 31 __ STA P4 
1454 : 85 32 __ STA P5 
1456 : a9 03 __ LDA #$03
1458 : 85 33 __ STA P6 
145a : a9 07 __ LDA #$07
145c : 85 34 __ STA P7 
145e : a9 00 __ LDA #$00
1460 : 18 __ __ CLC
.l1058:
1461 : 69 4f __ ADC #$4f
1463 : 85 2d __ STA P0 
1465 : 20 22 16 JSR $1622 ; (vera_spr_set.s0 + 0)
1468 : e6 47 __ INC T0 + 0 
146a : a5 47 __ LDA T0 + 0 
146c : c9 10 __ CMP #$10
146e : 90 f1 __ BCC $1461 ; (SetUpSprites.l1058 + 0)
.s79:
1470 : a9 20 __ LDA #$20
1472 : 85 37 __ STA P10 
1474 : a9 40 __ LDA #$40
1476 : 8d fc 9e STA $9efc ; (sstack + 0)
1479 : a9 fa __ LDA #$fa
147b : 8d fd 9e STA $9efd ; (sstack + 1)
147e : a9 01 __ LDA #$01
1480 : 8d fe 9e STA $9efe ; (sstack + 2)
1483 : a9 00 __ LDA #$00
1485 : 8d ff 9e STA $9eff ; (sstack + 3)
1488 : a9 db __ LDA #$db
148a : 85 35 __ STA P8 
148c : a9 22 __ LDA #$22
148e : 85 36 __ STA P9 
1490 : 20 3e 17 JSR $173e ; (SetPaletteColours.s0 + 0)
1493 : a9 60 __ LDA #$60
1495 : 8d fc 9e STA $9efc ; (sstack + 0)
1498 : a9 fa __ LDA #$fa
149a : 8d fd 9e STA $9efd ; (sstack + 1)
149d : a9 01 __ LDA #$01
149f : 8d fe 9e STA $9efe ; (sstack + 2)
14a2 : a9 00 __ LDA #$00
14a4 : 8d ff 9e STA $9eff ; (sstack + 3)
14a7 : a9 00 __ LDA #$00
14a9 : 85 35 __ STA P8 
14ab : a9 3d __ LDA #$3d
14ad : 85 36 __ STA P9 
14af : 20 3e 17 JSR $173e ; (SetPaletteColours.s0 + 0)
14b2 : a9 80 __ LDA #$80
14b4 : 8d fc 9e STA $9efc ; (sstack + 0)
14b7 : a9 fa __ LDA #$fa
14b9 : 8d fd 9e STA $9efd ; (sstack + 1)
14bc : a9 01 __ LDA #$01
14be : 8d fe 9e STA $9efe ; (sstack + 2)
14c1 : a9 00 __ LDA #$00
14c3 : 8d ff 9e STA $9eff ; (sstack + 3)
14c6 : a9 20 __ LDA #$20
14c8 : 85 35 __ STA P8 
14ca : a9 3d __ LDA #$3d
14cc : 85 36 __ STA P9 
14ce : 20 3e 17 JSR $173e ; (SetPaletteColours.s0 + 0)
14d1 : a9 60 __ LDA #$60
14d3 : 85 2d __ STA P0 
14d5 : a9 20 __ LDA #$20
14d7 : 85 30 __ STA P3 
14d9 : a9 00 __ LDA #$00
14db : 85 31 __ STA P4 
14dd : a9 40 __ LDA #$40
14df : 85 2e __ STA P1 
14e1 : a9 3d __ LDA #$3d
14e3 : 85 2f __ STA P2 
14e5 : 20 f5 16 JSR $16f5 ; (vera_pal_putn.s0 + 0)
14e8 : a9 70 __ LDA #$70
14ea : 85 2d __ STA P0 
14ec : a9 0c __ LDA #$0c
14ee : 85 30 __ STA P3 
14f0 : a9 00 __ LDA #$00
14f2 : 85 31 __ STA P4 
14f4 : a9 4c __ LDA #$4c
14f6 : 85 2e __ STA P1 
14f8 : a9 3d __ LDA #$3d
14fa : 85 2f __ STA P2 
14fc : 20 f5 16 JSR $16f5 ; (vera_pal_putn.s0 + 0)
14ff : a9 20 __ LDA #$20
1501 : 85 2d __ STA P0 
1503 : a9 43 __ LDA #$43
1505 : 85 2e __ STA P1 
1507 : a9 01 __ LDA #$01
1509 : 85 2f __ STA P2 
150b : a9 00 __ LDA #$00
150d : 85 30 __ STA P3 
150f : 85 33 __ STA P6 
1511 : a9 04 __ LDA #$04
1513 : 85 34 __ STA P7 
1515 : a9 58 __ LDA #$58
1517 : 85 31 __ STA P4 
1519 : a9 3d __ LDA #$3d
151b : 85 32 __ STA P5 
151d : 4c c0 15 JMP $15c0 ; (vram_putn.s0 + 0)
.s1027:
1520 : a9 1e __ LDA #$1e
1522 : c5 3b __ CMP ACCU + 0 
1524 : a5 49 __ LDA T2 + 0 
1526 : 90 3e __ BCC $1566 ; (SetUpSprites.s1020 + 0)
.s1026:
1528 : c9 09 __ CMP #$09
152a : 90 06 __ BCC $1532 ; (SetUpSprites.s24 + 0)
.s1025:
152c : a9 45 __ LDA #$45
152e : c5 49 __ CMP T2 + 0 
1530 : b0 05 __ BCS $1537 ; (SetUpSprites.s1024 + 0)
.s24:
1532 : a9 00 __ LDA #$00
1534 : 4c 97 0d JMP $0d97 ; (SetUpSprites.s191 + 0)
.s1024:
1537 : a5 49 __ LDA T2 + 0 
1539 : c9 13 __ CMP #$13
153b : 90 06 __ BCC $1543 ; (SetUpSprites.s28 + 0)
.s1023:
153d : a9 3b __ LDA #$3b
153f : c5 49 __ CMP T2 + 0 
1541 : b0 04 __ BCS $1547 ; (SetUpSprites.s1022 + 0)
.s28:
1543 : a9 01 __ LDA #$01
1545 : d0 12 __ BNE $1559 ; (SetUpSprites.s203 + 0)
.s1022:
1547 : a5 49 __ LDA T2 + 0 
1549 : c9 1d __ CMP #$1d
154b : 90 06 __ BCC $1553 ; (SetUpSprites.s32 + 0)
.s1021:
154d : a9 31 __ LDA #$31
154f : c5 49 __ CMP T2 + 0 
1551 : b0 04 __ BCS $1557 ; (SetUpSprites.s33 + 0)
.s32:
1553 : a9 02 __ LDA #$02
1555 : d0 02 __ BNE $1559 ; (SetUpSprites.s203 + 0)
.s33:
1557 : a9 03 __ LDA #$03
.s203:
1559 : 8d 23 9f STA $9f23 
155c : a9 00 __ LDA #$00
155e : 8d 23 9f STA $9f23 
1561 : e6 49 __ INC T2 + 0 
1563 : 4c 7c 0d JMP $0d7c ; (SetUpSprites.l14 + 0)
.s1020:
1566 : c9 09 __ CMP #$09
1568 : 90 06 __ BCC $1570 ; (SetUpSprites.s36 + 0)
.s1019:
156a : a9 45 __ LDA #$45
156c : c5 49 __ CMP T2 + 0 
156e : b0 05 __ BCS $1575 ; (SetUpSprites.s1005 + 0)
.s36:
1570 : a9 05 __ LDA #$05
1572 : 4c 97 0d JMP $0d97 ; (SetUpSprites.s191 + 0)
.s1005:
1575 : a5 49 __ LDA T2 + 0 
1577 : c9 13 __ CMP #$13
1579 : 90 06 __ BCC $1581 ; (SetUpSprites.s40 + 0)
.s1004:
157b : a9 3b __ LDA #$3b
157d : c5 49 __ CMP T2 + 0 
157f : b0 04 __ BCS $1585 ; (SetUpSprites.s1003 + 0)
.s40:
1581 : a9 06 __ LDA #$06
1583 : d0 d4 __ BNE $1559 ; (SetUpSprites.s203 + 0)
.s1003:
1585 : a5 49 __ LDA T2 + 0 
1587 : c9 1d __ CMP #$1d
1589 : 90 06 __ BCC $1591 ; (SetUpSprites.s44 + 0)
.s1002:
158b : a9 31 __ LDA #$31
158d : c5 49 __ CMP T2 + 0 
158f : b0 04 __ BCS $1595 ; (SetUpSprites.s45 + 0)
.s44:
1591 : a9 07 __ LDA #$07
1593 : d0 c4 __ BNE $1559 ; (SetUpSprites.s203 + 0)
.s45:
1595 : a9 08 __ LDA #$08
1597 : d0 c0 __ BNE $1559 ; (SetUpSprites.s203 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1599 : a5 2d __ LDA P0 ; (bank + 0)
159b : 4a __ __ LSR
159c : a9 00 __ LDA #$00
159e : 6a __ __ ROR
159f : 85 3b __ STA ACCU + 0 
15a1 : a5 2f __ LDA P2 ; (mem + 1)
15a3 : 29 f8 __ AND #$f8
15a5 : 4a __ __ LSR
15a6 : 05 3b __ ORA ACCU + 0 
15a8 : 85 3b __ STA ACCU + 0 
15aa : a5 30 __ LDA P3 ; (height + 0)
15ac : 0a __ __ ASL
15ad : 05 3b __ ORA ACCU + 0 
15af : 05 31 __ ORA P4 ; (width + 0)
.s1001:
15b1 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
15b2 : a5 2d __ LDA P0 ; (bank + 0)
15b4 : 4a __ __ LSR
15b5 : a9 00 __ LDA #$00
15b7 : 6a __ __ ROR
15b8 : 85 3b __ STA ACCU + 0 
15ba : a5 2f __ LDA P2 ; (mem + 1)
15bc : 4a __ __ LSR
15bd : 05 3b __ ORA ACCU + 0 
.s1001:
15bf : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
15c0 : ad 25 9f LDA $9f25 
15c3 : 29 fe __ AND #$fe
15c5 : 8d 25 9f STA $9f25 
15c8 : a5 2d __ LDA P0 ; (addr + 0)
15ca : 8d 20 9f STA $9f20 
15cd : a5 2e __ LDA P1 ; (addr + 1)
15cf : 8d 21 9f STA $9f21 
15d2 : a5 2f __ LDA P2 ; (addr + 2)
15d4 : 29 01 __ AND #$01
15d6 : 09 10 __ ORA #$10
15d8 : 8d 22 9f STA $9f22 
15db : a5 33 __ LDA P6 ; (size + 0)
15dd : 05 34 __ ORA P7 ; (size + 1)
15df : f0 19 __ BEQ $15fa ; (vram_putn.s1001 + 0)
.s6:
15e1 : a0 00 __ LDY #$00
15e3 : a6 33 __ LDX P6 ; (size + 0)
15e5 : f0 02 __ BEQ $15e9 ; (vram_putn.l1002 + 0)
.s1005:
15e7 : e6 34 __ INC P7 ; (size + 1)
.l1002:
15e9 : b1 31 __ LDA (P4),y ; (data + 0)
15eb : 8d 23 9f STA $9f23 
15ee : c8 __ __ INY
15ef : d0 02 __ BNE $15f3 ; (vram_putn.s1009 + 0)
.s1008:
15f1 : e6 32 __ INC P5 ; (data + 1)
.s1009:
15f3 : ca __ __ DEX
15f4 : d0 f3 __ BNE $15e9 ; (vram_putn.l1002 + 0)
.s1004:
15f6 : c6 34 __ DEC P7 ; (size + 1)
15f8 : d0 ef __ BNE $15e9 ; (vram_putn.l1002 + 0)
.s1001:
15fa : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1d59 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d69 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d79 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d89 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d99 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1da9 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1db9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1dc9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1dd9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1de9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1df9 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1e09 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
1e19 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
1e29 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
1e39 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1e49 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1e59 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
1e69 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
1e79 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e89 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
--------------------------------------------------------------------
rand:
.s0:
15fb : ad 9a 1e LDA $1e9a ; (seed + 1)
15fe : 4a __ __ LSR
15ff : ad 99 1e LDA $1e99 ; (seed + 0)
1602 : 6a __ __ ROR
1603 : aa __ __ TAX
1604 : a9 00 __ LDA #$00
1606 : 6a __ __ ROR
1607 : 4d 99 1e EOR $1e99 ; (seed + 0)
160a : 85 3b __ STA ACCU + 0 
160c : 8a __ __ TXA
160d : 4d 9a 1e EOR $1e9a ; (seed + 1)
1610 : 85 3c __ STA ACCU + 1 
1612 : 4a __ __ LSR
1613 : 45 3b __ EOR ACCU + 0 
1615 : 8d 99 1e STA $1e99 ; (seed + 0)
1618 : 85 3b __ STA ACCU + 0 
161a : 45 3c __ EOR ACCU + 1 
161c : 8d 9a 1e STA $1e9a ; (seed + 1)
161f : 85 3c __ STA ACCU + 1 
.s1001:
1621 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1e99 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1e9b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1eab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ebb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ecb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1edb : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1eeb : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1efb : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f0b : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f1b : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f2b : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f3b : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f4b : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f5b : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1f6b : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1f7b : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1f8b : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1f9b : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1fab : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1fbb : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1fcb : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1fdb : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1feb : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1ffb : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
200b : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
201b : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
202b : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
203b : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
204b : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
205b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
206b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
207b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
208b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
209b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20ab : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20bb : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20cb : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20db : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20eb : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20fb : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
210b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
211b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
212b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
213b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
214b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
215b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
216b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
217b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
218b : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
219b : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
21ab : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
21bb : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
21cb : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
21db : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
21eb : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
21fb : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
220b : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
221b : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
222b : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
223b : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
224b : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
225b : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
226b : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
227b : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
228b : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
1622 : ad 25 9f LDA $9f25 
1625 : 29 fe __ AND #$fe
1627 : 8d 25 9f STA $9f25 
162a : a5 2d __ LDA P0 ; (spr + 0)
162c : 0a __ __ ASL
162d : 0a __ __ ASL
162e : 85 3b __ STA ACCU + 0 
1630 : a9 3f __ LDA #$3f
1632 : 2a __ __ ROL
1633 : 06 3b __ ASL ACCU + 0 
1635 : 2a __ __ ROL
1636 : 8d 21 9f STA $9f21 
1639 : a5 3b __ LDA ACCU + 0 
163b : 8d 20 9f STA $9f20 
163e : a9 11 __ LDA #$11
1640 : 8d 22 9f STA $9f22 
1643 : a5 30 __ LDA P3 ; (mode8 + 0)
1645 : f0 02 __ BEQ $1649 ; (vera_spr_set.s11 + 0)
.s9:
1647 : a9 80 __ LDA #$80
.s11:
1649 : 05 2f __ ORA P2 ; (addr32 + 1)
164b : a6 2e __ LDX P1 ; (addr32 + 0)
164d : 8e 23 9f STX $9f23 
1650 : 8d 23 9f STA $9f23 
1653 : a9 00 __ LDA #$00
1655 : 8d 23 9f STA $9f23 
1658 : 8d 23 9f STA $9f23 
165b : 8d 23 9f STA $9f23 
165e : 8d 23 9f STA $9f23 
1661 : a5 33 __ LDA P6 ; (z + 0)
1663 : 0a __ __ ASL
1664 : 0a __ __ ASL
1665 : 8d 23 9f STA $9f23 
1668 : a5 32 __ LDA P5 ; (h + 0)
166a : 4a __ __ LSR
166b : 6a __ __ ROR
166c : 29 80 __ AND #$80
166e : 6a __ __ ROR
166f : 85 3b __ STA ACCU + 0 
1671 : a5 31 __ LDA P4 ; (w + 0)
1673 : 0a __ __ ASL
1674 : 0a __ __ ASL
1675 : 0a __ __ ASL
1676 : 0a __ __ ASL
1677 : 05 3b __ ORA ACCU + 0 
1679 : 05 34 __ ORA P7 ; (pal + 0)
167b : 8d 23 9f STA $9f23 
.s1001:
167e : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
167f : ad 25 9f LDA $9f25 
1682 : 29 fe __ AND #$fe
1684 : 8d 25 9f STA $9f25 
1687 : a5 2d __ LDA P0 ; (spr + 0)
1689 : 0a __ __ ASL
168a : 0a __ __ ASL
168b : 85 3b __ STA ACCU + 0 
168d : a9 3f __ LDA #$3f
168f : 2a __ __ ROL
1690 : 06 3b __ ASL ACCU + 0 
1692 : 2a __ __ ROL
1693 : aa __ __ TAX
1694 : a5 3b __ LDA ACCU + 0 
1696 : 09 02 __ ORA #$02
1698 : 8d 20 9f STA $9f20 
169b : 8e 21 9f STX $9f21 
169e : a9 11 __ LDA #$11
16a0 : 8d 22 9f STA $9f22 
16a3 : a5 2e __ LDA P1 ; (x + 0)
16a5 : 8d 23 9f STA $9f23 
16a8 : a5 2f __ LDA P2 ; (x + 1)
16aa : 8d 23 9f STA $9f23 
16ad : a5 30 __ LDA P3 ; (y + 0)
16af : 8d 23 9f STA $9f23 
16b2 : a5 31 __ LDA P4 ; (y + 1)
16b4 : 8d 23 9f STA $9f23 
.s1001:
16b7 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
16b8 : ad 25 9f LDA $9f25 
16bb : 29 fe __ AND #$fe
16bd : 8d 25 9f STA $9f25 
16c0 : a5 2d __ LDA P0 ; (spr + 0)
16c2 : 0a __ __ ASL
16c3 : 0a __ __ ASL
16c4 : 85 3b __ STA ACCU + 0 
16c6 : a9 3f __ LDA #$3f
16c8 : 2a __ __ ROL
16c9 : 06 3b __ ASL ACCU + 0 
16cb : 2a __ __ ROL
16cc : aa __ __ TAX
16cd : a5 3b __ LDA ACCU + 0 
16cf : 09 06 __ ORA #$06
16d1 : 8d 20 9f STA $9f20 
16d4 : 8e 21 9f STX $9f21 
16d7 : a9 01 __ LDA #$01
16d9 : 8d 22 9f STA $9f22 
16dc : ad 23 9f LDA $9f23 
16df : 29 fc __ AND #$fc
16e1 : a8 __ __ TAY
16e2 : a5 2e __ LDA P1 ; (fliph + 0)
16e4 : f0 01 __ BEQ $16e7 ; (vera_spr_flip.s14 + 0)
.s6:
16e6 : c8 __ __ INY
.s14:
16e7 : a5 2f __ LDA P2 ; (flipv + 0)
16e9 : f0 05 __ BEQ $16f0 ; (vera_spr_flip.s11 + 0)
.s9:
16eb : 98 __ __ TYA
16ec : 09 02 __ ORA #$02
16ee : d0 01 __ BNE $16f1 ; (vera_spr_flip.s1002 + 0)
.s11:
16f0 : 98 __ __ TYA
.s1002:
16f1 : 8d 23 9f STA $9f23 
.s1001:
16f4 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2310 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2320 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2330 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2340 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2350 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2360 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2370 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2380 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2390 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
23e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
23f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2420 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2430 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2440 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2450 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2460 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2470 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2480 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2490 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
24a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
24b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
24c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
24d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
24e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
24f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2500 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2510 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2520 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2530 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2540 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2550 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2560 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2570 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2580 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2590 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
25a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
25b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
25c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
25d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
25e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
25f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
16f5 : ad 25 9f LDA $9f25 
16f8 : 29 fe __ AND #$fe
16fa : 8d 25 9f STA $9f25 
16fd : a5 2d __ LDA P0 ; (index + 0)
16ff : 0a __ __ ASL
1700 : 8d 20 9f STA $9f20 
1703 : a9 7d __ LDA #$7d
1705 : 2a __ __ ROL
1706 : 8d 21 9f STA $9f21 
1709 : a9 11 __ LDA #$11
170b : 8d 22 9f STA $9f22 
170e : a5 30 __ LDA P3 ; (size + 0)
1710 : 05 31 __ ORA P4 ; (size + 1)
1712 : f0 29 __ BEQ $173d ; (vera_pal_putn.s1001 + 0)
.s6:
1714 : a6 30 __ LDX P3 ; (size + 0)
1716 : f0 02 __ BEQ $171a ; (vera_pal_putn.l3 + 0)
.s1003:
1718 : e6 31 __ INC P4 ; (size + 1)
.l3:
171a : a0 01 __ LDY #$01
171c : b1 2e __ LDA (P1),y ; (color + 0)
171e : 85 3c __ STA ACCU + 1 
1720 : 88 __ __ DEY
1721 : b1 2e __ LDA (P1),y ; (color + 0)
1723 : 8d 23 9f STA $9f23 
1726 : a5 3c __ LDA ACCU + 1 
1728 : 8d 23 9f STA $9f23 
172b : 18 __ __ CLC
172c : a5 2e __ LDA P1 ; (color + 0)
172e : 69 02 __ ADC #$02
1730 : 85 2e __ STA P1 ; (color + 0)
1732 : 90 02 __ BCC $1736 ; (vera_pal_putn.s1007 + 0)
.s1006:
1734 : e6 2f __ INC P2 ; (color + 1)
.s1007:
1736 : ca __ __ DEX
1737 : d0 e1 __ BNE $171a ; (vera_pal_putn.l3 + 0)
.s1002:
1739 : c6 31 __ DEC P4 ; (size + 1)
173b : d0 dd __ BNE $171a ; (vera_pal_putn.l3 + 0)
.s1001:
173d : 60 __ __ RTS
--------------------------------------------------------------------
palette:
229b : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
22ab : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
22bb : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
22cb : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainPupil:
2600 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2610 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2620 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2630 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2640 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2650 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2660 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2670 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2680 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2690 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
26a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
26b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
26c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
26d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
26e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
26f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2710 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2730 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2750 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2760 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2770 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2780 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2790 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
27a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
27b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
27c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
27d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
27e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
27f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2800 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2810 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2820 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2830 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2840 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2850 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2860 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2870 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2880 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2890 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
28a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
28b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
28c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
28d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
28e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
28f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2900 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2910 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2920 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2930 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2940 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2950 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2960 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2970 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2980 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2990 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
29a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
29b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
29c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
29d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
29e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
29f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2a00 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2a10 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2a30 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2a40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2a50 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2a60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2a70 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2a80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2a90 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2aa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2ab0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2ac0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
2ad0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
2ae0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2af0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2b00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ba0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bb0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bc0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bd0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2be0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bf0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ca0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cb0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cc0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cd0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ce0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cf0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2da0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2db0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2dc0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2dd0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2de0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2df0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ea0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2eb0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ec0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ed0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ee0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ef0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2f10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2f20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2f30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2f40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2f50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2f60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2f70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2f80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2f90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2fa0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2fb0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2fc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2fd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2fe0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
2ff0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3000 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3010 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3020 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3030 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3040 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3050 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3060 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3070 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3080 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3090 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
30a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
30b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
30c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
30d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
30e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
30f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3100 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3110 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3120 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3130 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3140 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3150 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3160 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3170 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3180 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3190 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
31a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
31b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
31c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
31d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
31e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
31f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3200 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3210 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3220 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3230 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3240 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3250 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3260 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3270 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3280 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3290 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
32a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
32b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
32c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
32d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
32e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
32f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
CharBox:
3300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3320 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3330 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3340 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3350 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3360 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3370 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3380 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3390 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
33a0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
33b0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
33c0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
33d0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
33e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
33f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3400 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3410 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3420 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3430 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3440 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3450 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3460 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3470 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3480 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3490 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
34a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
34c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
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
3710 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3720 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3730 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3740 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3750 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3760 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3770 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3780 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3790 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
37a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37b0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
37c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37d0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
37e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3800 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3810 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3820 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3830 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3840 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3850 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3860 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3870 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3880 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3890 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
38a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
38c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
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
--------------------------------------------------------------------
WavySprite:
3b00 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b10 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b20 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b60 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b70 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b80 : __ __ __ BYT 11 11 12 11 11 12 11 11 11 11 12 11 11 12 11 11 : ................
3b90 : __ __ __ BYT 21 11 22 21 11 22 21 11 11 11 22 21 11 22 21 11 : !."!."!..."!."!.
3ba0 : __ __ __ BYT 22 12 22 22 12 22 22 11 21 12 22 22 12 22 22 12 : ".""."".!.""."".
3bb0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3bc0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3bd0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3be0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3bf0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3c00 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c10 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c20 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c30 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c40 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c50 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c60 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c70 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3c80 : __ __ __ BYT 33 33 34 33 33 34 33 33 33 33 34 33 33 34 33 33 : 3343343333433433
3c90 : __ __ __ BYT 43 33 44 43 33 44 43 33 33 33 44 43 33 44 43 33 : C3DC3DC333DC3DC3
3ca0 : __ __ __ BYT 44 34 44 44 34 44 44 33 43 34 44 44 34 44 44 34 : D4DD4DD3C4DD4DD4
3cb0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3cc0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3cd0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3ce0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3cf0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
--------------------------------------------------------------------
SetPaletteColours:
.s0:
173e : ad fc 9e LDA $9efc ; (sstack + 0)
1741 : 85 2d __ STA P0 
1743 : ad fd 9e LDA $9efd ; (sstack + 1)
1746 : 85 2e __ STA P1 
1748 : ad fe 9e LDA $9efe ; (sstack + 2)
174b : 85 2f __ STA P2 
174d : ad ff 9e LDA $9eff ; (sstack + 3)
1750 : 85 30 __ STA P3 
1752 : a5 35 __ LDA P8 ; (input + 0)
1754 : 85 31 __ STA P4 
1756 : a5 36 __ LDA P9 ; (input + 1)
1758 : 85 32 __ STA P5 
175a : a5 37 __ LDA P10 ; (inputsize + 0)
175c : 85 33 __ STA P6 
175e : a9 00 __ LDA #$00
1760 : 85 34 __ STA P7 
1762 : 4c c0 15 JMP $15c0 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
22db : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
22eb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
3d00 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
3d10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
3d20 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
3d30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
3d40 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
3d4c : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
EyeTri:
3d58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3d78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3d98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3da8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3db8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3dc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3dd8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3de8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3df8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e08 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3e18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3e38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e48 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3e58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e68 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3e78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e88 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
3e98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ea8 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
3eb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ec8 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
3ed8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ee8 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
3ef8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f08 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
3f18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f28 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
3f38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f48 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
3f58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3f68 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
3f78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3f88 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
3f98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3fa8 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
3fb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3fc8 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
3fd8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3fe8 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
3ff8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4008 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4018 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4028 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
4038 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
4048 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
4058 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
4068 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
4078 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4088 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
4098 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
40a8 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
40b8 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
40c8 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
40d8 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
40e8 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
40f8 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4108 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4118 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4128 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
4138 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4148 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
getchx:
.s0:
1765 : 20 6f 17 JSR $176f ; (getpch + 0)
1768 : 85 3b __ STA ACCU + 0 
176a : a9 00 __ LDA #$00
176c : 85 3c __ STA ACCU + 1 
.s1001:
176e : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
176f : 20 e4 ff JSR $ffe4 
1772 : ae ff 1a LDX $1aff ; (giocharmap + 0)
1775 : e0 01 __ CPX #$01
1777 : 90 26 __ BCC $179f ; (getpch + 48)
1779 : c9 0d __ CMP #$0d
177b : d0 02 __ BNE $177f ; (getpch + 16)
177d : a9 0a __ LDA #$0a
177f : e0 02 __ CPX #$02
1781 : 90 1c __ BCC $179f ; (getpch + 48)
1783 : c9 db __ CMP #$db
1785 : b0 18 __ BCS $179f ; (getpch + 48)
1787 : c9 41 __ CMP #$41
1789 : 90 14 __ BCC $179f ; (getpch + 48)
178b : c9 c1 __ CMP #$c1
178d : 90 02 __ BCC $1791 ; (getpch + 34)
178f : 49 a0 __ EOR #$a0
1791 : c9 7b __ CMP #$7b
1793 : b0 0a __ BCS $179f ; (getpch + 48)
1795 : c9 61 __ CMP #$61
1797 : b0 04 __ BCS $179d ; (getpch + 46)
1799 : c9 5b __ CMP #$5b
179b : b0 02 __ BCS $179f ; (getpch + 48)
179d : 49 20 __ EOR #$20
179f : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
1aff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
22fb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
22fd : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
4158 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
415a : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
17a0 : a9 33 __ LDA #$33
17a2 : 85 2d __ STA P0 
17a4 : a9 38 __ LDA #$38
17a6 : 85 2e __ STA P1 
17a8 : a9 01 __ LDA #$01
17aa : 85 2f __ STA P2 
17ac : a6 32 __ LDX P5 ; (p + 0)
17ae : bd 00 42 LDA $4200,x ; (sintab + 0)
17b1 : 4a __ __ LSR
17b2 : 4a __ __ LSR
17b3 : 4a __ __ LSR
17b4 : 49 10 __ EOR #$10
17b6 : 38 __ __ SEC
17b7 : e9 10 __ SBC #$10
17b9 : 18 __ __ CLC
17ba : 69 b4 __ ADC #$b4
17bc : 85 30 __ STA P3 
17be : a9 00 __ LDA #$00
17c0 : 85 31 __ STA P4 
17c2 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
17c5 : a9 34 __ LDA #$34
17c7 : 85 2d __ STA P0 
17c9 : a9 20 __ LDA #$20
17cb : 85 2e __ STA P1 
17cd : a6 34 __ LDX P7 ; (p2 + 0)
17cf : bd 00 42 LDA $4200,x ; (sintab + 0)
17d2 : 4a __ __ LSR
17d3 : 4a __ __ LSR
17d4 : 4a __ __ LSR
17d5 : 49 10 __ EOR #$10
17d7 : 38 __ __ SEC
17d8 : e9 10 __ SBC #$10
17da : 18 __ __ CLC
17db : 69 b4 __ ADC #$b4
17dd : 85 30 __ STA P3 
17df : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
17e2 : a9 35 __ LDA #$35
17e4 : 85 2d __ STA P0 
17e6 : a9 00 __ LDA #$00
17e8 : 85 2e __ STA P1 
17ea : a6 36 __ LDX P9 ; (p3 + 0)
17ec : bd 00 42 LDA $4200,x ; (sintab + 0)
17ef : 4a __ __ LSR
17f0 : 4a __ __ LSR
17f1 : 4a __ __ LSR
17f2 : 49 10 __ EOR #$10
17f4 : 38 __ __ SEC
17f5 : e9 10 __ SBC #$10
17f7 : 18 __ __ CLC
17f8 : 69 a4 __ ADC #$a4
17fa : 85 30 __ STA P3 
17fc : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
17ff : a9 36 __ LDA #$36
1801 : 85 2d __ STA P0 
1803 : a9 40 __ LDA #$40
1805 : 85 2e __ STA P1 
1807 : a6 36 __ LDX P9 ; (p3 + 0)
1809 : bd 00 42 LDA $4200,x ; (sintab + 0)
180c : 4a __ __ LSR
180d : 4a __ __ LSR
180e : 4a __ __ LSR
180f : 49 10 __ EOR #$10
1811 : 38 __ __ SEC
1812 : e9 10 __ SBC #$10
1814 : 18 __ __ CLC
1815 : 69 a4 __ ADC #$a4
1817 : 85 30 __ STA P3 
1819 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
181c : a9 37 __ LDA #$37
181e : 85 2d __ STA P0 
1820 : a9 00 __ LDA #$00
1822 : 85 2e __ STA P1 
1824 : a6 36 __ LDX P9 ; (p3 + 0)
1826 : bd 00 42 LDA $4200,x ; (sintab + 0)
1829 : 4a __ __ LSR
182a : 4a __ __ LSR
182b : 4a __ __ LSR
182c : 49 10 __ EOR #$10
182e : 38 __ __ SEC
182f : e9 10 __ SBC #$10
1831 : 18 __ __ CLC
1832 : 69 c4 __ ADC #$c4
1834 : 85 30 __ STA P3 
1836 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1839 : a9 38 __ LDA #$38
183b : 85 2d __ STA P0 
183d : a9 40 __ LDA #$40
183f : 85 2e __ STA P1 
1841 : a6 36 __ LDX P9 ; (p3 + 0)
1843 : bd 00 42 LDA $4200,x ; (sintab + 0)
1846 : 4a __ __ LSR
1847 : 4a __ __ LSR
1848 : 4a __ __ LSR
1849 : 49 10 __ EOR #$10
184b : 38 __ __ SEC
184c : e9 10 __ SBC #$10
184e : 18 __ __ CLC
184f : 69 c4 __ ADC #$c4
1851 : 85 30 __ STA P3 
1853 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
1856 : a9 00 __ LDA #$00
1858 : 85 49 __ STA T1 + 0 
.l2:
185a : 18 __ __ CLC
185b : a5 49 __ LDA T1 + 0 
185d : 69 4f __ ADC #$4f
185f : 85 2d __ STA P0 
1861 : a5 49 __ LDA T1 + 0 
1863 : 4a __ __ LSR
1864 : 6a __ __ ROR
1865 : 6a __ __ ROR
1866 : aa __ __ TAX
1867 : 29 c0 __ AND #$c0
1869 : 6a __ __ ROR
186a : 85 47 __ STA T0 + 0 
186c : 8a __ __ TXA
186d : 29 1f __ AND #$1f
186f : 85 48 __ STA T0 + 1 
1871 : a5 49 __ LDA T1 + 0 
1873 : c9 09 __ CMP #$09
1875 : b0 31 __ BCS $18a8 ; (MoveSprites.s6 + 0)
.s5:
1877 : a5 48 __ LDA T0 + 1 
1879 : 85 2f __ STA P2 
187b : a5 47 __ LDA T0 + 0 
187d : 85 2e __ STA P1 
187f : 6d 5c 41 ADC $415c ; (FrameCount + 0)
1882 : aa __ __ TAX
1883 : bd 00 42 LDA $4200,x ; (sintab + 0)
1886 : 4a __ __ LSR
1887 : 4a __ __ LSR
1888 : 4a __ __ LSR
1889 : 4a __ __ LSR
188a : 49 08 __ EOR #$08
188c : 38 __ __ SEC
188d : e9 08 __ SBC #$08
188f : a8 __ __ TAY
1890 : a9 00 __ LDA #$00
1892 : e9 00 __ SBC #$00
1894 : aa __ __ TAX
1895 : 98 __ __ TYA
1896 : 18 __ __ CLC
1897 : 69 58 __ ADC #$58
1899 : 85 30 __ STA P3 
189b : 8a __ __ TXA
189c : 69 01 __ ADC #$01
189e : 85 31 __ STA P4 
18a0 : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
18a3 : e6 49 __ INC T1 + 0 
18a5 : 4c 5a 18 JMP $185a ; (MoveSprites.l2 + 0)
.s6:
18a8 : a6 48 __ LDX T0 + 1 
18aa : ca __ __ DEX
18ab : 86 3c __ STX ACCU + 1 
18ad : a5 47 __ LDA T0 + 0 
18af : 85 3b __ STA ACCU + 0 
18b1 : a9 00 __ LDA #$00
18b3 : 85 23 __ STA WORK + 0 
18b5 : a9 01 __ LDA #$01
18b7 : 85 24 __ STA WORK + 1 
18b9 : 20 30 1d JSR $1d30 ; (mods16 + 0)
18bc : ad 5c 41 LDA $415c ; (FrameCount + 0)
18bf : 38 __ __ SEC
18c0 : e5 25 __ SBC WORK + 2 
18c2 : aa __ __ TAX
18c3 : 18 __ __ CLC
18c4 : a5 47 __ LDA T0 + 0 
18c6 : 69 40 __ ADC #$40
18c8 : 85 2e __ STA P1 
18ca : a5 48 __ LDA T0 + 1 
18cc : 69 00 __ ADC #$00
18ce : 85 2f __ STA P2 
18d0 : bd 00 42 LDA $4200,x ; (sintab + 0)
18d3 : 4a __ __ LSR
18d4 : 4a __ __ LSR
18d5 : 4a __ __ LSR
18d6 : 4a __ __ LSR
18d7 : 49 08 __ EOR #$08
18d9 : 38 __ __ SEC
18da : e9 08 __ SBC #$08
18dc : a8 __ __ TAY
18dd : a9 00 __ LDA #$00
18df : e9 00 __ SBC #$00
18e1 : aa __ __ TAX
18e2 : 98 __ __ TYA
18e3 : 18 __ __ CLC
18e4 : 69 58 __ ADC #$58
18e6 : 85 30 __ STA P3 
18e8 : 8a __ __ TXA
18e9 : 69 01 __ ADC #$01
18eb : 85 31 __ STA P4 
18ed : 20 7f 16 JSR $167f ; (vera_spr_move.s0 + 0)
18f0 : e6 49 __ INC T1 + 0 
18f2 : a5 49 __ LDA T1 + 0 
18f4 : c9 12 __ CMP #$12
18f6 : b0 03 __ BCS $18fb ; (MoveSprites.s1001 + 0)
18f8 : 4c 5a 18 JMP $185a ; (MoveSprites.l2 + 0)
.s1001:
18fb : 60 __ __ RTS
--------------------------------------------------------------------
sintab:
4200 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4210 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4220 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4230 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4240 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4250 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4260 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4270 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4280 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4290 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
42a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
42b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
42c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
42d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
42e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
42f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
415c : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
18fc : a9 08 __ LDA #$08
18fe : 8d 2c 9f STA $9f2c 
1901 : 20 32 19 JSR $1932 ; (zsm_check.s0 + 0)
1904 : 09 00 __ ORA #$00
1906 : d0 01 __ BNE $1909 ; (PlayZSM.s1 + 0)
.s1001:
1908 : 60 __ __ RTS
.s1:
1909 : a5 33 __ LDA P6 ; (TuneSelection + 1)
190b : 05 32 __ ORA P5 ; (TuneSelection + 0)
190d : d0 07 __ BNE $1916 ; (PlayZSM.s11 + 0)
.s7:
190f : a9 1a __ LDA #$1a
1911 : a0 c1 __ LDY #$c1
1913 : 4c 2b 19 JMP $192b ; (PlayZSM.s15 + 0)
.s11:
1916 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1918 : d0 06 __ BNE $1920 ; (PlayZSM.s5 + 0)
.s1002:
191a : a5 32 __ LDA P5 ; (TuneSelection + 0)
191c : c9 01 __ CMP #$01
191e : f0 07 __ BEQ $1927 ; (PlayZSM.s9 + 0)
.s5:
1920 : a9 1a __ LDA #$1a
1922 : a0 a3 __ LDY #$a3
1924 : 4c 2b 19 JMP $192b ; (PlayZSM.s15 + 0)
.s9:
1927 : a9 1b __ LDA #$1b
1929 : a0 00 __ LDY #$00
.s15:
192b : 84 30 __ STY P3 
192d : 85 31 __ STA P4 
192f : 4c 36 19 JMP $1936 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1932 : ad fd 1a LDA $1afd ; (zsm_finished + 0)
.s1001:
1935 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1936 : a9 01 __ LDA #$01
1938 : 8d fd 1a STA $1afd ; (zsm_finished + 0)
193b : ad ff 22 LDA $22ff ; (zsm_reading + 0)
193e : f0 0a __ BEQ $194a ; (zsm_init.s3 + 0)
.s1:
1940 : a9 02 __ LDA #$02
1942 : 20 8f 19 JSR $198f ; (krnio_close.s1000 + 0)
1945 : a9 00 __ LDA #$00
1947 : 8d ff 22 STA $22ff ; (zsm_reading + 0)
.s3:
194a : 8d e8 41 STA $41e8 ; (zsm_pos + 0)
194d : 8d e9 41 STA $41e9 ; (zsm_pos + 1)
1950 : 8d ea 41 STA $41ea ; (zsm_wpos + 0)
1953 : 8d eb 41 STA $41eb ; (zsm_wpos + 1)
1956 : 8d e7 41 STA $41e7 ; (zsm_delay + 0)
1959 : a5 30 __ LDA P3 ; (fname + 0)
195b : 85 2d __ STA P0 
195d : a5 31 __ LDA P4 ; (fname + 1)
195f : 85 2e __ STA P1 
1961 : 20 97 19 JSR $1997 ; (krnio_setnam.s0 + 0)
1964 : a9 02 __ LDA #$02
1966 : 85 2d __ STA P0 
1968 : 85 2f __ STA P2 
196a : a9 08 __ LDA #$08
196c : 85 2e __ STA P1 
196e : 20 ad 19 JSR $19ad ; (krnio_open.s0 + 0)
1971 : a5 3b __ LDA ACCU + 0 
1973 : f0 19 __ BEQ $198e ; (zsm_init.s1001 + 0)
.s4:
1975 : a9 01 __ LDA #$01
1977 : 8d ff 22 STA $22ff ; (zsm_reading + 0)
197a : 20 d5 19 JSR $19d5 ; (zsm_fill.s0 + 0)
197d : a9 10 __ LDA #$10
197f : 8d e8 41 STA $41e8 ; (zsm_pos + 0)
1982 : a9 00 __ LDA #$00
1984 : 8d e9 41 STA $41e9 ; (zsm_pos + 1)
1987 : 8d fd 1a STA $1afd ; (zsm_finished + 0)
198a : a9 01 __ LDA #$01
198c : 85 3b __ STA ACCU + 0 
.s1001:
198e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
22ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
198f : 85 2d __ STA P0 
.s0:
1991 : a5 2d __ LDA P0 
1993 : 20 c3 ff JSR $ffc3 
.s1001:
1996 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
41ea : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1997 : a5 2d __ LDA P0 
1999 : 05 2e __ ORA P1 
199b : f0 08 __ BEQ $19a5 ; (krnio_setnam.s0 + 14)
199d : a0 ff __ LDY #$ff
199f : c8 __ __ INY
19a0 : b1 2d __ LDA (P0),y 
19a2 : d0 fb __ BNE $199f ; (krnio_setnam.s0 + 8)
19a4 : 98 __ __ TYA
19a5 : a6 2d __ LDX P0 
19a7 : a4 2e __ LDY P1 
19a9 : 20 bd ff JSR $ffbd 
.s1001:
19ac : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
19ad : a9 00 __ LDA #$00
19af : a6 2d __ LDX P0 ; (fnum + 0)
19b1 : 9d ec 41 STA $41ec,x ; (krnio_pstatus + 0)
19b4 : a9 00 __ LDA #$00
19b6 : 85 3b __ STA ACCU + 0 
19b8 : 85 3c __ STA ACCU + 1 
19ba : a5 2d __ LDA P0 ; (fnum + 0)
19bc : a6 2e __ LDX P1 
19be : a4 2f __ LDY P2 
19c0 : 20 ba ff JSR $ffba 
19c3 : 20 c0 ff JSR $ffc0 
19c6 : 90 08 __ BCC $19d0 ; (krnio_open.s0 + 35)
19c8 : a5 2d __ LDA P0 ; (fnum + 0)
19ca : 20 c3 ff JSR $ffc3 
19cd : 4c d4 19 JMP $19d4 ; (krnio_open.s1001 + 0)
19d0 : a9 01 __ LDA #$01
19d2 : 85 3b __ STA ACCU + 0 
.s1001:
19d4 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
41ec : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
19d5 : ad ff 22 LDA $22ff ; (zsm_reading + 0)
19d8 : f0 20 __ BEQ $19fa ; (zsm_fill.s1 + 0)
.s2:
19da : ad e9 41 LDA $41e9 ; (zsm_pos + 1)
19dd : 18 __ __ CLC
19de : 69 04 __ ADC #$04
19e0 : cd eb 41 CMP $41eb ; (zsm_wpos + 1)
19e3 : d0 0c __ BNE $19f1 ; (zsm_fill.s6 + 0)
.s1006:
19e5 : ad ea 41 LDA $41ea ; (zsm_wpos + 0)
19e8 : cd e8 41 CMP $41e8 ; (zsm_pos + 0)
19eb : d0 04 __ BNE $19f1 ; (zsm_fill.s6 + 0)
.s5:
19ed : a9 00 __ LDA #$00
19ef : f0 0b __ BEQ $19fc ; (zsm_fill.s1008 + 0)
.s6:
19f1 : a9 02 __ LDA #$02
19f3 : 20 79 1a JSR $1a79 ; (krnio_chkin.s1000 + 0)
19f6 : a5 3b __ LDA ACCU + 0 
19f8 : d0 07 __ BNE $1a01 ; (zsm_fill.s9 + 0)
.s1:
19fa : a9 ff __ LDA #$ff
.s1008:
19fc : 85 3b __ STA ACCU + 0 
.s1001:
19fe : 85 3c __ STA ACCU + 1 
1a00 : 60 __ __ RTS
.s9:
1a01 : a9 00 __ LDA #$00
1a03 : 85 47 __ STA T1 + 0 
1a05 : 85 48 __ STA T1 + 1 
1a07 : ad e9 41 LDA $41e9 ; (zsm_pos + 1)
1a0a : 18 __ __ CLC
1a0b : 69 04 __ ADC #$04
1a0d : cd eb 41 CMP $41eb ; (zsm_wpos + 1)
1a10 : d0 08 __ BNE $1a1a ; (zsm_fill.l13 + 0)
.s1002:
1a12 : ad ea 41 LDA $41ea ; (zsm_wpos + 0)
1a15 : cd e8 41 CMP $41e8 ; (zsm_pos + 0)
1a18 : f0 49 __ BEQ $1a63 ; (zsm_fill.s37 + 0)
.l13:
1a1a : 20 8b 1a JSR $1a8b ; (krnio_chrin.s0 + 0)
1a1d : ad ea 41 LDA $41ea ; (zsm_wpos + 0)
1a20 : aa __ __ TAX
1a21 : 18 __ __ CLC
1a22 : 69 01 __ ADC #$01
1a24 : 8d ea 41 STA $41ea ; (zsm_wpos + 0)
1a27 : ad eb 41 LDA $41eb ; (zsm_wpos + 1)
1a2a : a8 __ __ TAY
1a2b : 69 00 __ ADC #$00
1a2d : 8d eb 41 STA $41eb ; (zsm_wpos + 1)
1a30 : 8a __ __ TXA
1a31 : 18 __ __ CLC
1a32 : 69 3b __ ADC #$3b
1a34 : 85 49 __ STA T3 + 0 
1a36 : 98 __ __ TYA
1a37 : 29 03 __ AND #$03
1a39 : 69 43 __ ADC #$43
1a3b : 85 4a __ STA T3 + 1 
1a3d : a5 3b __ LDA ACCU + 0 
1a3f : a0 00 __ LDY #$00
1a41 : 91 49 __ STA (T3 + 0),y 
1a43 : e6 47 __ INC T1 + 0 
1a45 : d0 02 __ BNE $1a49 ; (zsm_fill.s1010 + 0)
.s1009:
1a47 : e6 48 __ INC T1 + 1 
.s1010:
1a49 : 20 95 1a JSR $1a95 ; (krnio_status.s0 + 0)
1a4c : a5 3b __ LDA ACCU + 0 
1a4e : d0 0e __ BNE $1a5e ; (zsm_fill.s15 + 0)
.s12:
1a50 : ad e9 41 LDA $41e9 ; (zsm_pos + 1)
1a53 : 18 __ __ CLC
1a54 : 69 04 __ ADC #$04
1a56 : cd eb 41 CMP $41eb ; (zsm_wpos + 1)
1a59 : d0 bf __ BNE $1a1a ; (zsm_fill.l13 + 0)
1a5b : 4c 12 1a JMP $1a12 ; (zsm_fill.s1002 + 0)
.s15:
1a5e : a9 00 __ LDA #$00
1a60 : 8d ff 22 STA $22ff ; (zsm_reading + 0)
.s37:
1a63 : 20 9f 1a JSR $1a9f ; (krnio_clrchn.s0 + 0)
1a66 : ad ff 22 LDA $22ff ; (zsm_reading + 0)
1a69 : d0 05 __ BNE $1a70 ; (zsm_fill.s21 + 0)
.s19:
1a6b : a9 02 __ LDA #$02
1a6d : 20 8f 19 JSR $198f ; (krnio_close.s1000 + 0)
.s21:
1a70 : a5 47 __ LDA T1 + 0 
1a72 : 85 3b __ STA ACCU + 0 
1a74 : a5 48 __ LDA T1 + 1 
1a76 : 4c fe 19 JMP $19fe ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a79 : 85 2d __ STA P0 
.s0:
1a7b : a6 2d __ LDX P0 
1a7d : 20 c6 ff JSR $ffc6 
1a80 : a9 00 __ LDA #$00
1a82 : 85 3c __ STA ACCU + 1 
1a84 : b0 02 __ BCS $1a88 ; (krnio_chkin.s0 + 13)
1a86 : a9 01 __ LDA #$01
1a88 : 85 3b __ STA ACCU + 0 
.s1001:
1a8a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a8b : 20 cf ff JSR $ffcf 
1a8e : 85 3b __ STA ACCU + 0 
1a90 : a9 00 __ LDA #$00
1a92 : 85 3c __ STA ACCU + 1 
.s1001:
1a94 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1a95 : 20 b7 ff JSR $ffb7 
1a98 : 85 3b __ STA ACCU + 0 
1a9a : a9 00 __ LDA #$00
1a9c : 85 3c __ STA ACCU + 1 
.s1001:
1a9e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1a9f : 20 cc ff JSR $ffcc 
.s1001:
1aa2 : 60 __ __ RTS
--------------------------------------------------------------------
1aa3 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1ab3 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1ac1 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1ad1 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1b00 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1b10 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1b20 : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
PalTimer:
415e : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
4160 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
4170 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1b25 : a9 10 __ LDA #$10
1b27 : 85 30 __ STA P3 
1b29 : a9 00 __ LDA #$00
1b2b : 85 31 __ STA P4 
1b2d : a5 32 __ LDA P5 ; (Palette + 0)
1b2f : 85 2e __ STA P1 
1b31 : 85 47 __ STA T0 + 0 
1b33 : a5 33 __ LDA P6 ; (Palette + 1)
1b35 : 85 2f __ STA P2 
1b37 : 85 48 __ STA T0 + 1 
1b39 : ad fc 9e LDA $9efc ; (sstack + 0)
1b3c : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b3e : 0a __ __ ASL
1b3f : 85 49 __ STA T2 + 0 
1b41 : ad fd 9e LDA $9efd ; (sstack + 1)
1b44 : 2a __ __ ROL
1b45 : 18 __ __ CLC
1b46 : 65 33 __ ADC P6 ; (Palette + 1)
1b48 : 85 4a __ STA T2 + 1 
1b4a : a4 32 __ LDY P5 ; (Palette + 0)
1b4c : b1 49 __ LDA (T2 + 0),y 
1b4e : aa __ __ TAX
1b4f : c8 __ __ INY
1b50 : b1 49 __ LDA (T2 + 0),y 
1b52 : 86 49 __ STX T2 + 0 
1b54 : 85 4a __ STA T2 + 1 
1b56 : a9 00 __ LDA #$00
1b58 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b5a : ad fe 9e LDA $9efe ; (sstack + 2)
1b5d : 85 4b __ STA T4 + 0 
1b5f : 38 __ __ SEC
1b60 : e9 01 __ SBC #$01
1b62 : 85 4d __ STA T5 + 0 
1b64 : ad ff 9e LDA $9eff ; (sstack + 3)
1b67 : 85 4c __ STA T4 + 1 
1b69 : e9 00 __ SBC #$00
1b6b : 85 4e __ STA T5 + 1 
1b6d : d0 06 __ BNE $1b75 ; (SetPaletteIndex.s5 + 0)
.s1004:
1b6f : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b71 : c5 4d __ CMP T5 + 0 
1b73 : b0 38 __ BCS $1bad ; (SetPaletteIndex.s4 + 0)
.s5:
1b75 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1b77 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1b79 : 18 __ __ CLC
1b7a : a5 32 __ LDA P5 ; (Palette + 0)
1b7c : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1b7e : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b80 : a5 33 __ LDA P6 ; (Palette + 1)
1b82 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1b84 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b86 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1b89 : a0 02 __ LDY #$02
1b8b : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b8d : a0 00 __ LDY #$00
1b8f : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b91 : a0 03 __ LDY #$03
1b93 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b95 : a0 01 __ LDY #$01
1b97 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b99 : 18 __ __ CLC
1b9a : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b9c : 69 02 __ ADC #$02
1b9e : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1ba0 : 90 02 __ BCC $1ba4 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1ba2 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1ba4 : e8 __ __ INX
1ba5 : a5 4e __ LDA T5 + 1 
1ba7 : d0 e0 __ BNE $1b89 ; (SetPaletteIndex.l2 + 0)
.s1002:
1ba9 : e4 4d __ CPX T5 + 0 
1bab : 90 dc __ BCC $1b89 ; (SetPaletteIndex.l2 + 0)
.s4:
1bad : a5 4b __ LDA T4 + 0 
1baf : 0a __ __ ASL
1bb0 : aa __ __ TAX
1bb1 : a5 4c __ LDA T4 + 1 
1bb3 : 2a __ __ ROL
1bb4 : a8 __ __ TAY
1bb5 : 8a __ __ TXA
1bb6 : 38 __ __ SEC
1bb7 : e9 02 __ SBC #$02
1bb9 : b0 01 __ BCS $1bbc ; (SetPaletteIndex.s1010 + 0)
.s1009:
1bbb : 88 __ __ DEY
.s1010:
1bbc : 18 __ __ CLC
1bbd : 65 47 __ ADC T0 + 0 
1bbf : 85 47 __ STA T0 + 0 
1bc1 : 98 __ __ TYA
1bc2 : 65 48 __ ADC T0 + 1 
1bc4 : 85 48 __ STA T0 + 1 
1bc6 : a5 49 __ LDA T2 + 0 
1bc8 : a0 00 __ LDY #$00
1bca : 91 47 __ STA (T0 + 0),y 
1bcc : a5 4a __ LDA T2 + 1 
1bce : c8 __ __ INY
1bcf : 91 47 __ STA (T0 + 0),y 
1bd1 : a5 34 __ LDA P7 ; (index + 0)
1bd3 : 85 2d __ STA P0 
1bd5 : 4c f5 16 JMP $16f5 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
4180 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4182 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4192 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
41a2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
41a3 : __ __ __ BYT 23 02 12 01 01 01 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
41b3 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
BGPalShimmer:
41c3 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
41d3 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
Control:
.s0:
1bd8 : a5 31 __ LDA P4 ; (Input + 0)
1bda : c9 20 __ CMP #$20
1bdc : d0 1c __ BNE $1bfa ; (Control.s1007 + 0)
.s1:
1bde : a5 30 __ LDA P3 ; (playing + 0)
1be0 : d0 0a __ BNE $1bec ; (Control.s4 + 0)
.s5:
1be2 : a9 01 __ LDA #$01
1be4 : 20 f7 1a JSR $1af7 ; (zsm_irq_play.s0 + 0)
1be7 : a9 01 __ LDA #$01
.s1001:
1be9 : 85 3b __ STA ACCU + 0 
1beb : 60 __ __ RTS
.s4:
1bec : a9 00 __ LDA #$00
1bee : cd e3 41 CMP $41e3 ; (paused + 0)
1bf1 : 2a __ __ ROL
1bf2 : 85 2f __ STA P2 
1bf4 : 8d e3 41 STA $41e3 ; (paused + 0)
1bf7 : 20 ff 1b JSR $1bff ; (zsm_pause.s0 + 0)
.s1007:
1bfa : a5 30 __ LDA P3 ; (playing + 0)
1bfc : 4c e9 1b JMP $1be9 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
41e3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1bff : a5 2f __ LDA P2 ; (pause + 0)
1c01 : d0 0e __ BNE $1c11 ; (zsm_pause.s4 + 0)
.s8:
1c03 : ad fe 1a LDA $1afe ; (zsm_paused + 0)
1c06 : f0 08 __ BEQ $1c10 ; (zsm_pause.s1001 + 0)
.s5:
1c08 : 20 53 1c JSR $1c53 ; (zsm_restore_volume.s0 + 0)
1c0b : a9 00 __ LDA #$00
1c0d : 8d fe 1a STA $1afe ; (zsm_paused + 0)
.s1001:
1c10 : 60 __ __ RTS
.s4:
1c11 : ad fe 1a LDA $1afe ; (zsm_paused + 0)
1c14 : d0 fa __ BNE $1c10 ; (zsm_pause.s1001 + 0)
.s1:
1c16 : a9 01 __ LDA #$01
1c18 : 8d fe 1a STA $1afe ; (zsm_paused + 0)
1c1b : 20 df 1a JSR $1adf ; (zsm_silence.s0 + 0)
1c1e : 4c 21 1c JMP $1c21 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_silence:
.s0:
1adf : a9 00 __ LDA #$00
1ae1 : 85 47 __ STA T0 + 0 
1ae3 : a9 08 __ LDA #$08
1ae5 : 85 2d __ STA P0 
1ae7 : a9 00 __ LDA #$00
.l1006:
1ae9 : 85 2e __ STA P1 
1aeb : 20 a1 0c JSR $0ca1 ; (sfx_put.l1 + 0)
1aee : e6 47 __ INC T0 + 0 
1af0 : a5 47 __ LDA T0 + 0 
1af2 : c9 08 __ CMP #$08
1af4 : 90 f3 __ BCC $1ae9 ; (zsm_silence.l1006 + 0)
.s1001:
1af6 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1c21 : a0 00 __ LDY #$00
1c23 : 84 3c __ STY ACCU + 1 
1c25 : a2 02 __ LDX #$02
1c27 : 18 __ __ CLC
.l1006:
1c28 : 8a __ __ TXA
1c29 : 09 c0 __ ORA #$c0
1c2b : 8d 20 9f STA $9f20 
1c2e : a5 3c __ LDA ACCU + 1 
1c30 : 09 f9 __ ORA #$f9
1c32 : 8d 21 9f STA $9f21 
1c35 : a9 01 __ LDA #$01
1c37 : 8d 22 9f STA $9f22 
1c3a : ad 23 9f LDA $9f23 
1c3d : 99 3b 47 STA $473b,y ; (vera_volumes + 0)
1c40 : a9 00 __ LDA #$00
1c42 : 8d 23 9f STA $9f23 
1c45 : 8a __ __ TXA
1c46 : 69 04 __ ADC #$04
1c48 : aa __ __ TAX
1c49 : 90 02 __ BCC $1c4d ; (zsm_save_volume.s1009 + 0)
.s1008:
1c4b : e6 3c __ INC ACCU + 1 
.s1009:
1c4d : c8 __ __ INY
1c4e : c0 10 __ CPY #$10
1c50 : 90 d6 __ BCC $1c28 ; (zsm_save_volume.l1006 + 0)
.s1001:
1c52 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
473b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1c53 : a0 00 __ LDY #$00
1c55 : 84 3c __ STY ACCU + 1 
1c57 : a2 02 __ LDX #$02
1c59 : 18 __ __ CLC
.l1006:
1c5a : 8a __ __ TXA
1c5b : 09 c0 __ ORA #$c0
1c5d : 8d 20 9f STA $9f20 
1c60 : a5 3c __ LDA ACCU + 1 
1c62 : 09 f9 __ ORA #$f9
1c64 : 8d 21 9f STA $9f21 
1c67 : a9 01 __ LDA #$01
1c69 : 8d 22 9f STA $9f22 
1c6c : b9 3b 47 LDA $473b,y ; (vera_volumes + 0)
1c6f : 8d 23 9f STA $9f23 
1c72 : 8a __ __ TXA
1c73 : 69 04 __ ADC #$04
1c75 : aa __ __ TAX
1c76 : 90 02 __ BCC $1c7a ; (zsm_restore_volume.s1009 + 0)
.s1008:
1c78 : e6 3c __ INC ACCU + 1 
.s1009:
1c7a : c8 __ __ INY
1c7b : c0 10 __ CPY #$10
1c7d : 90 db __ BCC $1c5a ; (zsm_restore_volume.l1006 + 0)
.s1001:
1c7f : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1af7 : 8d fc 1a STA $1afc ; (zsm_playing + 0)
.s1001:
1afa : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4300 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
4310 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
4320 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
4330 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
off1:
41e4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
frame_wait:
.l1:
1c80 : ad 26 9f LDA $9f26 
1c83 : 29 40 __ AND #$40
1c85 : d0 f9 __ BNE $1c80 ; (frame_wait.l1 + 0)
.l4:
1c87 : ad 26 9f LDA $9f26 
1c8a : 29 40 __ AND #$40
1c8c : f0 f9 __ BEQ $1c87 ; (frame_wait.l4 + 0)
.s1001:
1c8e : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1c8f : 38 __ __ SEC
1c90 : a9 00 __ LDA #$00
1c92 : e5 3b __ SBC ACCU + 0 
1c94 : 85 3b __ STA ACCU + 0 
1c96 : a9 00 __ LDA #$00
1c98 : e5 3c __ SBC ACCU + 1 
1c9a : 85 3c __ STA ACCU + 1 
1c9c : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1c9d : 38 __ __ SEC
1c9e : a9 00 __ LDA #$00
1ca0 : e5 23 __ SBC WORK + 0 
1ca2 : 85 23 __ STA WORK + 0 
1ca4 : a9 00 __ LDA #$00
1ca6 : e5 24 __ SBC WORK + 1 
1ca8 : 85 24 __ STA WORK + 1 
1caa : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1cab : a5 3c __ LDA ACCU + 1 
1cad : d0 31 __ BNE $1ce0 ; (divmod + 53)
1caf : a5 24 __ LDA WORK + 1 
1cb1 : d0 1e __ BNE $1cd1 ; (divmod + 38)
1cb3 : 85 26 __ STA WORK + 3 
1cb5 : a2 04 __ LDX #$04
1cb7 : 06 3b __ ASL ACCU + 0 
1cb9 : 2a __ __ ROL
1cba : c5 23 __ CMP WORK + 0 
1cbc : 90 02 __ BCC $1cc0 ; (divmod + 21)
1cbe : e5 23 __ SBC WORK + 0 
1cc0 : 26 3b __ ROL ACCU + 0 
1cc2 : 2a __ __ ROL
1cc3 : c5 23 __ CMP WORK + 0 
1cc5 : 90 02 __ BCC $1cc9 ; (divmod + 30)
1cc7 : e5 23 __ SBC WORK + 0 
1cc9 : 26 3b __ ROL ACCU + 0 
1ccb : ca __ __ DEX
1ccc : d0 eb __ BNE $1cb9 ; (divmod + 14)
1cce : 85 25 __ STA WORK + 2 
1cd0 : 60 __ __ RTS
1cd1 : a5 3b __ LDA ACCU + 0 
1cd3 : 85 25 __ STA WORK + 2 
1cd5 : a5 3c __ LDA ACCU + 1 
1cd7 : 85 26 __ STA WORK + 3 
1cd9 : a9 00 __ LDA #$00
1cdb : 85 3b __ STA ACCU + 0 
1cdd : 85 3c __ STA ACCU + 1 
1cdf : 60 __ __ RTS
1ce0 : a5 24 __ LDA WORK + 1 
1ce2 : d0 1f __ BNE $1d03 ; (divmod + 88)
1ce4 : a5 23 __ LDA WORK + 0 
1ce6 : 30 1b __ BMI $1d03 ; (divmod + 88)
1ce8 : a9 00 __ LDA #$00
1cea : 85 26 __ STA WORK + 3 
1cec : a2 10 __ LDX #$10
1cee : 06 3b __ ASL ACCU + 0 
1cf0 : 26 3c __ ROL ACCU + 1 
1cf2 : 2a __ __ ROL
1cf3 : c5 23 __ CMP WORK + 0 
1cf5 : 90 02 __ BCC $1cf9 ; (divmod + 78)
1cf7 : e5 23 __ SBC WORK + 0 
1cf9 : 26 3b __ ROL ACCU + 0 
1cfb : 26 3c __ ROL ACCU + 1 
1cfd : ca __ __ DEX
1cfe : d0 f2 __ BNE $1cf2 ; (divmod + 71)
1d00 : 85 25 __ STA WORK + 2 
1d02 : 60 __ __ RTS
1d03 : a9 00 __ LDA #$00
1d05 : 85 25 __ STA WORK + 2 
1d07 : 85 26 __ STA WORK + 3 
1d09 : 84 22 __ STY $22 
1d0b : a0 10 __ LDY #$10
1d0d : 18 __ __ CLC
1d0e : 26 3b __ ROL ACCU + 0 
1d10 : 26 3c __ ROL ACCU + 1 
1d12 : 26 25 __ ROL WORK + 2 
1d14 : 26 26 __ ROL WORK + 3 
1d16 : 38 __ __ SEC
1d17 : a5 25 __ LDA WORK + 2 
1d19 : e5 23 __ SBC WORK + 0 
1d1b : aa __ __ TAX
1d1c : a5 26 __ LDA WORK + 3 
1d1e : e5 24 __ SBC WORK + 1 
1d20 : 90 04 __ BCC $1d26 ; (divmod + 123)
1d22 : 86 25 __ STX WORK + 2 
1d24 : 85 26 __ STA WORK + 3 
1d26 : 88 __ __ DEY
1d27 : d0 e5 __ BNE $1d0e ; (divmod + 99)
1d29 : 26 3b __ ROL ACCU + 0 
1d2b : 26 3c __ ROL ACCU + 1 
1d2d : a4 22 __ LDY $22 
1d2f : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1d30 : 24 3c __ BIT ACCU + 1 
1d32 : 10 0d __ BPL $1d41 ; (mods16 + 17)
1d34 : 20 8f 1c JSR $1c8f ; (negaccu + 0)
1d37 : 24 24 __ BIT WORK + 1 
1d39 : 10 0d __ BPL $1d48 ; (mods16 + 24)
1d3b : 20 9d 1c JSR $1c9d ; (negtmp + 0)
1d3e : 4c ab 1c JMP $1cab ; (divmod + 0)
1d41 : 24 24 __ BIT WORK + 1 
1d43 : 10 f9 __ BPL $1d3e ; (mods16 + 14)
1d45 : 20 9d 1c JSR $1c9d ; (negtmp + 0)
1d48 : 20 ab 1c JSR $1cab ; (divmod + 0)
1d4b : 38 __ __ SEC
1d4c : a9 00 __ LDA #$00
1d4e : e5 25 __ SBC WORK + 2 
1d50 : 85 25 __ STA WORK + 2 
1d52 : a9 00 __ LDA #$00
1d54 : e5 26 __ SBC WORK + 3 
1d56 : 85 26 __ STA WORK + 3 
1d58 : 60 __ __ RTS
