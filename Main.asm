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
080e : 8e 9f 17 STX $179f ; (spentry + 0)
0811 : a9 3b __ LDA #$3b
0813 : 85 39 __ STA IP + 0 
0815 : a9 2d __ LDA #$2d
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 31 __ LDA #$31
081c : e9 2d __ SBC #$2d
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
0830 : a9 3b __ LDA #$3b
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
179f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 49 0a JSR $0a49 ; (zsm_irq_init.s0 + 0)
0883 : 20 1d 0c JSR $0c1d ; (ClearVERAScreen.s0 + 0)
0886 : 20 60 0c JSR $0c60 ; (SetUpSprites.s0 + 0)
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
08b7 : 85 51 __ STA T1 + 0 
08b9 : 85 52 __ STA T2 + 0 
.l2:
08bb : ee e5 17 INC $17e5 ; (p + 0)
08be : d0 03 __ BNE $08c3 ; (main.s1012 + 0)
.s1011:
08c0 : ee e6 17 INC $17e6 ; (p + 1)
.s1012:
08c3 : a5 51 __ LDA T1 + 0 
08c5 : f0 03 __ BEQ $08ca ; (main.s5 + 0)
08c7 : 4c 3b 0a JMP $0a3b ; (main.s4 + 0)
.s5:
08ca : a9 20 __ LDA #$20
08cc : 85 37 __ STA P10 
08ce : a9 a0 __ LDA #$a0
08d0 : 8d fc 9e STA $9efc ; (sstack + 0)
08d3 : a9 fa __ LDA #$fa
08d5 : 8d fd 9e STA $9efd ; (sstack + 1)
08d8 : a9 01 __ LDA #$01
08da : 8d fe 9e STA $9efe ; (sstack + 2)
08dd : a9 00 __ LDA #$00
08df : 8d ff 9e STA $9eff ; (sstack + 3)
08e2 : 8d e7 17 STA $17e7 ; (PalTimer + 0)
08e5 : 8d e8 17 STA $17e8 ; (PalTimer + 1)
08e8 : a9 80 __ LDA #$80
08ea : 85 35 __ STA P8 
08ec : a9 2c __ LDA #$2c
08ee : 85 36 __ STA P9 
08f0 : 20 56 12 JSR $1256 ; (SetPaletteColours.s0 + 0)
.s6:
08f3 : a9 3c __ LDA #$3c
08f5 : 8d 2c 9f STA $9f2c 
08f8 : e6 52 __ INC T2 + 0 
08fa : a5 52 __ LDA T2 + 0 
08fc : c9 03 __ CMP #$03
08fe : 90 2d __ BCC $092d ; (main.s39 + 0)
.s7:
0900 : a9 10 __ LDA #$10
0902 : 85 34 __ STA P7 
0904 : a9 00 __ LDA #$00
0906 : 85 35 __ STA P8 
0908 : 85 36 __ STA P9 
090a : 85 37 __ STA P10 
090c : a9 06 __ LDA #$06
090e : 8d fc 9e STA $9efc ; (sstack + 0)
0911 : a9 00 __ LDA #$00
0913 : 8d fd 9e STA $9efd ; (sstack + 1)
0916 : 8d ff 9e STA $9eff ; (sstack + 3)
0919 : a9 0a __ LDA #$0a
091b : 8d fe 9e STA $9efe ; (sstack + 2)
091e : a9 c5 __ LDA #$c5
0920 : 85 32 __ STA P5 
0922 : a9 17 __ LDA #$17
0924 : 85 33 __ STA P6 
0926 : 20 99 13 JSR $1399 ; (SetPaletteIndex.s0 + 0)
0929 : a9 00 __ LDA #$00
092b : 85 52 __ STA T2 + 0 
.s39:
092d : ad e8 17 LDA $17e8 ; (PalTimer + 1)
0930 : 30 40 __ BMI $0972 ; (main.s40 + 0)
.s1009:
0932 : d0 07 __ BNE $093b ; (main.s10 + 0)
.s1008:
0934 : a9 03 __ LDA #$03
0936 : cd e7 17 CMP $17e7 ; (PalTimer + 0)
0939 : b0 37 __ BCS $0972 ; (main.s40 + 0)
.s10:
093b : a9 50 __ LDA #$50
093d : 85 34 __ STA P7 
093f : a9 00 __ LDA #$00
0941 : 85 35 __ STA P8 
0943 : 85 36 __ STA P9 
0945 : 85 37 __ STA P10 
0947 : 8d fc 9e STA $9efc ; (sstack + 0)
094a : 8d fd 9e STA $9efd ; (sstack + 1)
094d : a9 10 __ LDA #$10
094f : 8d fe 9e STA $9efe ; (sstack + 2)
0952 : a9 00 __ LDA #$00
0954 : 8d ff 9e STA $9eff ; (sstack + 3)
0957 : ee e9 17 INC $17e9 ; (PalIndex + 0)
095a : d0 03 __ BNE $095f ; (main.s1016 + 0)
.s1015:
095c : ee ea 17 INC $17ea ; (PalIndex + 1)
.s1016:
095f : a9 a0 __ LDA #$a0
0961 : 85 32 __ STA P5 
0963 : a9 2c __ LDA #$2c
0965 : 85 33 __ STA P6 
0967 : 20 99 13 JSR $1399 ; (SetPaletteIndex.s0 + 0)
096a : a9 00 __ LDA #$00
096c : 8d e7 17 STA $17e7 ; (PalTimer + 0)
096f : 8d e8 17 STA $17e8 ; (PalTimer + 1)
.s40:
0972 : ad e6 17 LDA $17e6 ; (p + 1)
0975 : d0 42 __ BNE $09b9 ; (main.s42 + 0)
.s1007:
0977 : ad e5 17 LDA $17e5 ; (p + 0)
097a : c9 03 __ CMP #$03
097c : d0 3b __ BNE $09b9 ; (main.s42 + 0)
.s13:
097e : a9 20 __ LDA #$20
0980 : 85 37 __ STA P10 
0982 : a9 00 __ LDA #$00
0984 : 8d fc 9e STA $9efc ; (sstack + 0)
0987 : 8d ff 9e STA $9eff ; (sstack + 3)
098a : a9 fa __ LDA #$fa
098c : 8d fd 9e STA $9efd ; (sstack + 1)
098f : a9 01 __ LDA #$01
0991 : 8d fe 9e STA $9efe ; (sstack + 2)
0994 : a9 00 __ LDA #$00
0996 : cd eb 17 CMP $17eb ; (ShimmerState + 0)
0999 : 2a __ __ ROL
099a : 8d eb 17 STA $17eb ; (ShimmerState + 0)
099d : d0 07 __ BNE $09a6 ; (main.s16 + 0)
.s17:
099f : a9 2c __ LDA #$2c
09a1 : a0 c0 __ LDY #$c0
09a3 : 4c aa 09 JMP $09aa ; (main.s51 + 0)
.s16:
09a6 : a9 17 __ LDA #$17
09a8 : a0 a5 __ LDY #$a5
.s51:
09aa : 84 35 __ STY P8 
09ac : 85 36 __ STA P9 
09ae : 20 56 12 JSR $1256 ; (SetPaletteColours.s0 + 0)
09b1 : a9 00 __ LDA #$00
09b3 : 8d e5 17 STA $17e5 ; (p + 0)
09b6 : 8d e6 17 STA $17e6 ; (p + 1)
.s42:
09b9 : a9 03 __ LDA #$03
09bb : 8d 2c 9f STA $9f2c 
09be : 20 4c 14 JSR $144c ; (zsm_check.s0 + 0)
09c1 : 09 00 __ ORA #$00
09c3 : f0 0b __ BEQ $09d0 ; (main.s21 + 0)
.s19:
09c5 : a9 bd __ LDA #$bd
09c7 : 85 30 __ STA P3 
09c9 : a9 15 __ LDA #$15
09cb : 85 31 __ STA P4 
09cd : 20 50 14 JSR $1450 ; (zsm_init.s0 + 0)
.s21:
09d0 : a5 51 __ LDA T1 + 0 
09d2 : 85 2e __ STA P1 
09d4 : 20 db 15 JSR $15db ; (Control.s0 + 0)
09d7 : a5 3b __ LDA ACCU + 0 
09d9 : 85 51 __ STA T1 + 0 
09db : ad ef 17 LDA $17ef ; (FrameCount + 0)
09de : 85 47 __ STA T3 + 0 
09e0 : 85 3b __ STA ACCU + 0 
09e2 : ad f0 17 LDA $17f0 ; (FrameCount + 1)
09e5 : 85 3c __ STA ACCU + 1 
09e7 : a9 04 __ LDA #$04
09e9 : 85 23 __ STA WORK + 0 
09eb : a9 00 __ LDA #$00
09ed : 85 24 __ STA WORK + 1 
09ef : 20 76 17 JSR $1776 ; (mods16 + 0)
09f2 : a5 26 __ LDA WORK + 3 
09f4 : d0 16 __ BNE $0a0c ; (main.s24 + 0)
.s1003:
09f6 : a5 25 __ LDA WORK + 2 
09f8 : c9 01 __ CMP #$01
09fa : d0 10 __ BNE $0a0c ; (main.s24 + 0)
.s22:
09fc : ac f8 17 LDY $17f8 ; (off1 + 0)
09ff : c0 2b __ CPY #$2b
0a01 : b0 06 __ BCS $0a09 ; (main.s50 + 0)
.s25:
0a03 : b9 00 2d LDA $2d00,y ; (TestText2 + 0)
0a06 : 8d 23 9f STA $9f23 
.s50:
0a09 : ee f8 17 INC $17f8 ; (off1 + 0)
.s24:
0a0c : 06 47 __ ASL T3 + 0 
0a0e : ad f0 17 LDA $17f0 ; (FrameCount + 1)
0a11 : 2a __ __ ROL
0a12 : 18 __ __ CLC
0a13 : 69 ff __ ADC #$ff
0a15 : 8d 38 9f STA $9f38 
0a18 : a5 47 __ LDA T3 + 0 
0a1a : 8d 37 9f STA $9f37 
0a1d : a9 01 __ LDA #$01
0a1f : 8d 2c 9f STA $9f2c 
0a22 : 20 ef 14 JSR $14ef ; (zsm_fill.s0 + 0)
0a25 : a9 00 __ LDA #$00
0a27 : 8d 2c 9f STA $9f2c 
0a2a : 20 c6 16 JSR $16c6 ; (frame_wait.l1 + 0)
0a2d : ee ef 17 INC $17ef ; (FrameCount + 0)
0a30 : f0 03 __ BEQ $0a35 ; (main.s1017 + 0)
0a32 : 4c bb 08 JMP $08bb ; (main.l2 + 0)
.s1017:
0a35 : ee f0 17 INC $17f0 ; (FrameCount + 1)
0a38 : 4c bb 08 JMP $08bb ; (main.l2 + 0)
.s4:
0a3b : ee e7 17 INC $17e7 ; (PalTimer + 0)
0a3e : f0 03 __ BEQ $0a43 ; (main.s1013 + 0)
0a40 : 4c f3 08 JMP $08f3 ; (main.s6 + 0)
.s1013:
0a43 : ee e8 17 INC $17e8 ; (PalTimer + 1)
0a46 : 4c f3 08 JMP $08f3 ; (main.s6 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0a49 : 78 __ __ SEI
0a4a : ad 14 03 LDA $0314 
0a4d : 8d f1 17 STA $17f1 ; (oirq + 0)
0a50 : ad 15 03 LDA $0315 
0a53 : 8d f2 17 STA $17f2 ; (oirq + 1)
0a56 : a9 62 __ LDA #$62
0a58 : 8d 14 03 STA $0314 
0a5b : a9 0a __ LDA #$0a
0a5d : 8d 15 03 STA $0315 
0a60 : 58 __ __ CLI
.s1001:
0a61 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
17f1 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0a62 : 20 68 0a JSR $0a68 ; (irq.s1000 + 0)
0a65 : 6c f1 17 JMP ($17f1)
--------------------------------------------------------------------
irq:
.s1000:
0a68 : a5 2d __ LDA P0 
0a6a : 48 __ __ PHA
0a6b : a5 2e __ LDA P1 
0a6d : 48 __ __ PHA
0a6e : a5 3b __ LDA ACCU + 0 
0a70 : 48 __ __ PHA
0a71 : a5 3c __ LDA ACCU + 1 
0a73 : 48 __ __ PHA
0a74 : a5 47 __ LDA T0 + 0 
0a76 : 48 __ __ PHA
0a77 : a5 48 __ LDA $48 
0a79 : 48 __ __ PHA
0a7a : a5 49 __ LDA $49 
0a7c : 48 __ __ PHA
0a7d : a5 4a __ LDA $4a 
0a7f : 48 __ __ PHA
0a80 : a5 4b __ LDA $4b 
0a82 : 48 __ __ PHA
0a83 : a5 4c __ LDA $4c 
0a85 : 48 __ __ PHA
0a86 : a5 4d __ LDA $4d 
0a88 : 48 __ __ PHA
0a89 : a5 4e __ LDA $4e 
0a8b : 48 __ __ PHA
0a8c : a5 4f __ LDA $4f 
0a8e : 48 __ __ PHA
0a8f : a5 50 __ LDA $50 
0a91 : 48 __ __ PHA
.s0:
0a92 : ad a0 17 LDA $17a0 ; (zsm_playing + 0)
0a95 : f0 08 __ BEQ $0a9f ; (irq.s1001 + 0)
.s4:
0a97 : ad a1 17 LDA $17a1 ; (zsm_finished + 0)
0a9a : d0 03 __ BNE $0a9f ; (irq.s1001 + 0)
.s1:
0a9c : 20 ca 0a JSR $0aca ; (zsm_play.s0 + 0)
.s1001:
0a9f : 68 __ __ PLA
0aa0 : 85 50 __ STA $50 
0aa2 : 68 __ __ PLA
0aa3 : 85 4f __ STA $4f 
0aa5 : 68 __ __ PLA
0aa6 : 85 4e __ STA $4e 
0aa8 : 68 __ __ PLA
0aa9 : 85 4d __ STA $4d 
0aab : 68 __ __ PLA
0aac : 85 4c __ STA $4c 
0aae : 68 __ __ PLA
0aaf : 85 4b __ STA $4b 
0ab1 : 68 __ __ PLA
0ab2 : 85 4a __ STA $4a 
0ab4 : 68 __ __ PLA
0ab5 : 85 49 __ STA $49 
0ab7 : 68 __ __ PLA
0ab8 : 85 48 __ STA $48 
0aba : 68 __ __ PLA
0abb : 85 47 __ STA T0 + 0 
0abd : 68 __ __ PLA
0abe : 85 3c __ STA ACCU + 1 
0ac0 : 68 __ __ PLA
0ac1 : 85 3b __ STA ACCU + 0 
0ac3 : 68 __ __ PLA
0ac4 : 85 2e __ STA P1 
0ac6 : 68 __ __ PLA
0ac7 : 85 2d __ STA P0 
0ac9 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
17a0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
17a1 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0aca : ad a2 17 LDA $17a2 ; (zsm_paused + 0)
0acd : f0 01 __ BEQ $0ad0 ; (zsm_play.s2 + 0)
0acf : 60 __ __ RTS
.s2:
0ad0 : ad f3 17 LDA $17f3 ; (zsm_delay + 0)
0ad3 : f0 03 __ BEQ $0ad8 ; (zsm_play.s5 + 0)
0ad5 : 4c 05 0c JMP $0c05 ; (zsm_play.s4 + 0)
.s5:
0ad8 : ad 25 9f LDA $9f25 
0adb : 85 47 __ STA T0 + 0 
0add : ad 25 9f LDA $9f25 
0ae0 : 29 fe __ AND #$fe
0ae2 : 8d 25 9f STA $9f25 
0ae5 : ad 20 9f LDA $9f20 
0ae8 : 85 49 __ STA T2 + 0 
0aea : ad 21 9f LDA $9f21 
0aed : 85 4a __ STA T2 + 1 
0aef : ad 22 9f LDA $9f22 
0af2 : 85 48 __ STA T1 + 0 
.l8:
0af4 : ad f4 17 LDA $17f4 ; (zsm_pos + 0)
0af7 : 85 4b __ STA T3 + 0 
0af9 : 18 __ __ CLC
0afa : 69 01 __ ADC #$01
0afc : 85 4d __ STA T4 + 0 
0afe : 8d f4 17 STA $17f4 ; (zsm_pos + 0)
0b01 : ad f5 17 LDA $17f5 ; (zsm_pos + 1)
0b04 : aa __ __ TAX
0b05 : 69 00 __ ADC #$00
0b07 : 85 4e __ STA T4 + 1 
0b09 : 8d f5 17 STA $17f5 ; (zsm_pos + 1)
0b0c : 18 __ __ CLC
0b0d : a9 3b __ LDA #$3b
0b0f : 65 4b __ ADC T3 + 0 
0b11 : 85 3b __ STA ACCU + 0 
0b13 : 8a __ __ TXA
0b14 : 29 03 __ AND #$03
0b16 : 69 2d __ ADC #$2d
0b18 : 85 3c __ STA ACCU + 1 
0b1a : a0 00 __ LDY #$00
0b1c : b1 3b __ LDA (ACCU + 0),y 
0b1e : c9 40 __ CMP #$40
0b20 : b0 03 __ BCS $0b25 ; (zsm_play.s12 + 0)
0b22 : 4c d0 0b JMP $0bd0 ; (zsm_play.s11 + 0)
.s12:
0b25 : d0 22 __ BNE $0b49 ; (zsm_play.s15 + 0)
.s14:
0b27 : 18 __ __ CLC
0b28 : a9 3b __ LDA #$3b
0b2a : 65 4d __ ADC T4 + 0 
0b2c : 85 4b __ STA T3 + 0 
0b2e : a5 4e __ LDA T4 + 1 
0b30 : 29 03 __ AND #$03
0b32 : 69 2d __ ADC #$2d
0b34 : 85 4c __ STA T3 + 1 
0b36 : b1 4b __ LDA (T3 + 0),y 
0b38 : 29 3f __ AND #$3f
0b3a : 18 __ __ CLC
0b3b : 65 4d __ ADC T4 + 0 
0b3d : 8d f4 17 STA $17f4 ; (zsm_pos + 0)
0b40 : 98 __ __ TYA
0b41 : 65 4e __ ADC T4 + 1 
0b43 : 8d f5 17 STA $17f5 ; (zsm_pos + 1)
0b46 : 4c f4 0a JMP $0af4 ; (zsm_play.l8 + 0)
.s15:
0b49 : 09 00 __ ORA #$00
0b4b : 30 5b __ BMI $0ba8 ; (zsm_play.s18 + 0)
.s17:
0b4d : 29 3f __ AND #$3f
0b4f : f0 a3 __ BEQ $0af4 ; (zsm_play.l8 + 0)
.s29:
0b51 : 84 50 __ STY T7 + 0 
0b53 : 85 4f __ STA T6 + 0 
0b55 : 18 __ __ CLC
.l1012:
0b56 : a9 3b __ LDA #$3b
0b58 : 6d f4 17 ADC $17f4 ; (zsm_pos + 0)
0b5b : 85 4d __ STA T4 + 0 
0b5d : ad f5 17 LDA $17f5 ; (zsm_pos + 1)
0b60 : 29 03 __ AND #$03
0b62 : 69 2d __ ADC #$2d
0b64 : 85 4e __ STA T4 + 1 
0b66 : a0 00 __ LDY #$00
0b68 : b1 4d __ LDA (T4 + 0),y 
0b6a : 85 2d __ STA P0 
0b6c : ad f4 17 LDA $17f4 ; (zsm_pos + 0)
0b6f : 18 __ __ CLC
0b70 : 69 01 __ ADC #$01
0b72 : aa __ __ TAX
0b73 : ad f5 17 LDA $17f5 ; (zsm_pos + 1)
0b76 : 69 00 __ ADC #$00
0b78 : 29 03 __ AND #$03
0b7a : 85 4c __ STA T3 + 1 
0b7c : 8a __ __ TXA
0b7d : 18 __ __ CLC
0b7e : 69 3b __ ADC #$3b
0b80 : 85 4b __ STA T3 + 0 
0b82 : a9 2d __ LDA #$2d
0b84 : 65 4c __ ADC T3 + 1 
0b86 : 85 4c __ STA T3 + 1 
0b88 : b1 4b __ LDA (T3 + 0),y 
0b8a : 85 2e __ STA P1 
0b8c : 20 09 0c JSR $0c09 ; (sfx_put.l1 + 0)
0b8f : ad f4 17 LDA $17f4 ; (zsm_pos + 0)
0b92 : 18 __ __ CLC
0b93 : 69 02 __ ADC #$02
0b95 : 8d f4 17 STA $17f4 ; (zsm_pos + 0)
0b98 : 90 03 __ BCC $0b9d ; (zsm_play.s1015 + 0)
.s1014:
0b9a : ee f5 17 INC $17f5 ; (zsm_pos + 1)
.s1015:
0b9d : e6 50 __ INC T7 + 0 
0b9f : a5 50 __ LDA T7 + 0 
0ba1 : c5 4f __ CMP T6 + 0 
0ba3 : 90 b1 __ BCC $0b56 ; (zsm_play.l1012 + 0)
0ba5 : 4c f4 0a JMP $0af4 ; (zsm_play.l8 + 0)
.s18:
0ba8 : c9 80 __ CMP #$80
0baa : d0 07 __ BNE $0bb3 ; (zsm_play.s25 + 0)
.s24:
0bac : a9 01 __ LDA #$01
0bae : 8d a1 17 STA $17a1 ; (zsm_finished + 0)
0bb1 : d0 08 __ BNE $0bbb ; (zsm_play.s10 + 0)
.s25:
0bb3 : 29 7f __ AND #$7f
0bb5 : 38 __ __ SEC
0bb6 : e9 01 __ SBC #$01
0bb8 : 8d f3 17 STA $17f3 ; (zsm_delay + 0)
.s10:
0bbb : a5 49 __ LDA T2 + 0 
0bbd : 8d 20 9f STA $9f20 
0bc0 : a5 4a __ LDA T2 + 1 
0bc2 : 8d 21 9f STA $9f21 
0bc5 : a5 48 __ LDA T1 + 0 
0bc7 : 8d 22 9f STA $9f22 
0bca : a5 47 __ LDA T0 + 0 
0bcc : 8d 25 9f STA $9f25 
.s1001:
0bcf : 60 __ __ RTS
.s11:
0bd0 : 29 3f __ AND #$3f
0bd2 : 09 c0 __ ORA #$c0
0bd4 : 8d 20 9f STA $9f20 
0bd7 : a9 f9 __ LDA #$f9
0bd9 : 8d 21 9f STA $9f21 
0bdc : a9 01 __ LDA #$01
0bde : 8d 22 9f STA $9f22 
0be1 : a5 4b __ LDA T3 + 0 
0be3 : 69 02 __ ADC #$02
0be5 : 8d f4 17 STA $17f4 ; (zsm_pos + 0)
0be8 : 90 01 __ BCC $0beb ; (zsm_play.s1017 + 0)
.s1016:
0bea : e8 __ __ INX
.s1017:
0beb : 8e f5 17 STX $17f5 ; (zsm_pos + 1)
0bee : 18 __ __ CLC
0bef : a9 3b __ LDA #$3b
0bf1 : 65 4d __ ADC T4 + 0 
0bf3 : 85 4b __ STA T3 + 0 
0bf5 : a5 4e __ LDA T4 + 1 
0bf7 : 29 03 __ AND #$03
0bf9 : 69 2d __ ADC #$2d
0bfb : 85 4c __ STA T3 + 1 
0bfd : b1 4b __ LDA (T3 + 0),y 
0bff : 8d 23 9f STA $9f23 
0c02 : 4c f4 0a JMP $0af4 ; (zsm_play.l8 + 0)
.s4:
0c05 : ce f3 17 DEC $17f3 ; (zsm_delay + 0)
0c08 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
17a2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
17f3 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
2d3b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
17f4 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0c09 : ad 41 9f LDA $9f41 
0c0c : 30 fb __ BMI $0c09 ; (sfx_put.l1 + 0)
.s3:
0c0e : a5 2d __ LDA P0 ; (index + 0)
0c10 : 8d 40 9f STA $9f40 
0c13 : ea __ __ NOP
0c14 : ea __ __ NOP
0c15 : ea __ __ NOP
0c16 : ea __ __ NOP
0c17 : a5 2e __ LDA P1 ; (data + 0)
0c19 : 8d 41 9f STA $9f41 
.s1001:
0c1c : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0c1d : a9 93 __ LDA #$93
0c1f : 85 2d __ STA P0 
0c21 : a9 00 __ LDA #$00
0c23 : 85 2e __ STA P1 
0c25 : 20 5a 0c JSR $0c5a ; (putch.s0 + 0)
0c28 : a9 11 __ LDA #$11
0c2a : 8d 22 9f STA $9f22 
0c2d : a2 00 __ LDX #$00
.l2:
0c2f : 8a __ __ TXA
0c30 : 18 __ __ CLC
0c31 : 69 b0 __ ADC #$b0
0c33 : 8d 21 9f STA $9f21 
0c36 : a9 00 __ LDA #$00
0c38 : 8d 20 9f STA $9f20 
0c3b : a0 80 __ LDY #$80
.l1003:
0c3d : a9 20 __ LDA #$20
0c3f : 8d 23 9f STA $9f23 
0c42 : a9 01 __ LDA #$01
0c44 : 8d 23 9f STA $9f23 
0c47 : a9 20 __ LDA #$20
0c49 : 8d 24 9f STA $9f24 
0c4c : a9 01 __ LDA #$01
0c4e : 8d 24 9f STA $9f24 
0c51 : 88 __ __ DEY
0c52 : d0 e9 __ BNE $0c3d ; (ClearVERAScreen.l1003 + 0)
.s1004:
0c54 : e8 __ __ INX
0c55 : e0 40 __ CPX #$40
0c57 : 90 d6 __ BCC $0c2f ; (ClearVERAScreen.l2 + 0)
.s1001:
0c59 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0c5a : a5 2d __ LDA P0 
0c5c : 20 d2 ff JSR $ffd2 
.s1001:
0c5f : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0c60 : a9 00 __ LDA #$00
0c62 : 85 2d __ STA P0 
0c64 : 85 2e __ STA P1 
0c66 : 85 2f __ STA P2 
0c68 : 85 30 __ STA P3 
0c6a : 85 31 __ STA P4 
0c6c : 8d 25 9f STA $9f25 
0c6f : ad 29 9f LDA $9f29 
0c72 : 09 70 __ ORA #$70
0c74 : 8d 29 9f STA $9f29 
0c77 : a9 80 __ LDA #$80
0c79 : 8d 2b 9f STA $9f2b 
0c7c : 8d 2a 9f STA $9f2a 
0c7f : a9 62 __ LDA #$62
0c81 : 8d 2d 9f STA $9f2d 
0c84 : a9 68 __ LDA #$68
0c86 : 8d 34 9f STA $9f34 
0c89 : 20 cd 11 JSR $11cd ; (tileBaseConfig.s0 + 0)
0c8c : 8d 2f 9f STA $9f2f 
0c8f : a9 20 __ LDA #$20
0c91 : 85 2f __ STA P2 
0c93 : 20 e6 11 JSR $11e6 ; (memoryToMapMemoryAddress.s0 + 0)
0c96 : 8d 2e 9f STA $9f2e 
0c99 : a9 21 __ LDA #$21
0c9b : 8d 22 9f STA $9f22 
0c9e : a2 80 __ LDX #$80
.l6:
0ca0 : a0 50 __ LDY #$50
.l1025:
0ca2 : a9 00 __ LDA #$00
0ca4 : 8d 24 9f STA $9f24 
0ca7 : a9 08 __ LDA #$08
0ca9 : 8d 24 9f STA $9f24 
0cac : 88 __ __ DEY
0cad : d0 f3 __ BNE $0ca2 ; (SetUpSprites.l1025 + 0)
.s1026:
0caf : ca __ __ DEX
0cb0 : d0 ee __ BNE $0ca0 ; (SetUpSprites.l6 + 0)
.s4:
0cb2 : a9 00 __ LDA #$00
0cb4 : 85 2d __ STA P0 
0cb6 : 85 2e __ STA P1 
0cb8 : 85 2f __ STA P2 
0cba : 85 30 __ STA P3 
0cbc : 85 33 __ STA P6 
0cbe : a9 01 __ LDA #$01
0cc0 : 85 34 __ STA P7 
0cc2 : a9 00 __ LDA #$00
0cc4 : 85 31 __ STA P4 
0cc6 : a9 18 __ LDA #$18
0cc8 : 85 32 __ STA P5 
0cca : 20 f4 11 JSR $11f4 ; (vram_putn.s0 + 0)
0ccd : a9 10 __ LDA #$10
0ccf : 8d 22 9f STA $9f22 
0cd2 : a9 00 __ LDA #$00
0cd4 : 8d 20 9f STA $9f20 
0cd7 : a9 20 __ LDA #$20
0cd9 : 8d 21 9f STA $9f21 
0cdc : a9 3c __ LDA #$3c
0cde : 85 47 __ STA T1 + 0 
.l10:
0ce0 : a9 00 __ LDA #$00
0ce2 : 85 48 __ STA T2 + 0 
.l14:
0ce4 : 20 2f 12 JSR $122f ; (rand.s0 + 0)
0ce7 : a5 3b __ LDA ACCU + 0 
0ce9 : 29 1f __ AND #$1f
0ceb : c9 1f __ CMP #$1f
0ced : a5 48 __ LDA T2 + 0 
0cef : 90 03 __ BCC $0cf4 ; (SetUpSprites.s1023 + 0)
0cf1 : 4c 97 11 JMP $1197 ; (SetUpSprites.s1017 + 0)
.s1023:
0cf4 : c9 09 __ CMP #$09
0cf6 : 90 06 __ BCC $0cfe ; (SetUpSprites.s20 + 0)
.s1022:
0cf8 : a9 45 __ LDA #$45
0cfa : c5 48 __ CMP T2 + 0 
0cfc : b0 04 __ BCS $0d02 ; (SetUpSprites.s1021 + 0)
.s20:
0cfe : a9 00 __ LDA #$00
0d00 : f0 2f __ BEQ $0d31 ; (SetUpSprites.s174 + 0)
.s1021:
0d02 : a5 48 __ LDA T2 + 0 
0d04 : c9 13 __ CMP #$13
0d06 : 90 06 __ BCC $0d0e ; (SetUpSprites.s24 + 0)
.s1020:
0d08 : a9 3b __ LDA #$3b
0d0a : c5 48 __ CMP T2 + 0 
0d0c : b0 04 __ BCS $0d12 ; (SetUpSprites.s1019 + 0)
.s24:
0d0e : a9 01 __ LDA #$01
0d10 : d0 12 __ BNE $0d24 ; (SetUpSprites.s184 + 0)
.s1019:
0d12 : a5 48 __ LDA T2 + 0 
0d14 : c9 1d __ CMP #$1d
0d16 : 90 06 __ BCC $0d1e ; (SetUpSprites.s28 + 0)
.s1018:
0d18 : a9 31 __ LDA #$31
0d1a : c5 48 __ CMP T2 + 0 
0d1c : b0 04 __ BCS $0d22 ; (SetUpSprites.s29 + 0)
.s28:
0d1e : a9 02 __ LDA #$02
0d20 : d0 02 __ BNE $0d24 ; (SetUpSprites.s184 + 0)
.s29:
0d22 : a9 03 __ LDA #$03
.s184:
0d24 : 8d 23 9f STA $9f23 
0d27 : a9 00 __ LDA #$00
0d29 : 8d 23 9f STA $9f23 
0d2c : e6 48 __ INC T2 + 0 
0d2e : 4c e4 0c JMP $0ce4 ; (SetUpSprites.l14 + 0)
.s174:
0d31 : 8d 23 9f STA $9f23 
0d34 : a9 00 __ LDA #$00
0d36 : 8d 23 9f STA $9f23 
0d39 : e6 48 __ INC T2 + 0 
0d3b : 10 a7 __ BPL $0ce4 ; (SetUpSprites.l14 + 0)
.s11:
0d3d : c6 47 __ DEC T1 + 0 
0d3f : d0 9f __ BNE $0ce0 ; (SetUpSprites.l10 + 0)
.s12:
0d41 : a9 20 __ LDA #$20
0d43 : 85 37 __ STA P10 
0d45 : a9 00 __ LDA #$00
0d47 : 8d fc 9e STA $9efc ; (sstack + 0)
0d4a : 8d ff 9e STA $9eff ; (sstack + 3)
0d4d : a9 fa __ LDA #$fa
0d4f : 8d fd 9e STA $9efd ; (sstack + 1)
0d52 : a9 01 __ LDA #$01
0d54 : 8d fe 9e STA $9efe ; (sstack + 2)
0d57 : a9 a5 __ LDA #$a5
0d59 : 85 35 __ STA P8 
0d5b : a9 17 __ LDA #$17
0d5d : 85 36 __ STA P9 
0d5f : 20 56 12 JSR $1256 ; (SetPaletteColours.s0 + 0)
0d62 : a9 00 __ LDA #$00
0d64 : 85 2d __ STA P0 
0d66 : 85 30 __ STA P3 
0d68 : 85 33 __ STA P6 
0d6a : a9 31 __ LDA #$31
0d6c : 85 2e __ STA P1 
0d6e : a9 01 __ LDA #$01
0d70 : 85 2f __ STA P2 
0d72 : a9 04 __ LDA #$04
0d74 : 85 34 __ STA P7 
0d76 : a9 00 __ LDA #$00
0d78 : 85 31 __ STA P4 
0d7a : a9 19 __ LDA #$19
0d7c : 85 32 __ STA P5 
0d7e : 20 f4 11 JSR $11f4 ; (vram_putn.s0 + 0)
0d81 : a9 00 __ LDA #$00
0d83 : 85 4e __ STA T5 + 0 
0d85 : 85 4f __ STA T5 + 1 
.l45:
0d87 : 85 2d __ STA P0 
0d89 : 18 __ __ CLC
0d8a : 69 02 __ ADC #$02
0d8c : 85 4c __ STA T4 + 0 
0d8e : a9 00 __ LDA #$00
0d90 : 2a __ __ ROL
0d91 : 85 4d __ STA T4 + 1 
0d93 : a9 88 __ LDA #$88
0d95 : 85 2e __ STA P1 
0d97 : a9 09 __ LDA #$09
0d99 : 85 2f __ STA P2 
0d9b : a9 00 __ LDA #$00
0d9d : 85 30 __ STA P3 
0d9f : a9 03 __ LDA #$03
0da1 : 85 31 __ STA P4 
0da3 : 85 33 __ STA P6 
0da5 : a9 02 __ LDA #$02
0da7 : 85 32 __ STA P5 
0da9 : a9 01 __ LDA #$01
0dab : 85 34 __ STA P7 
0dad : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0db0 : a5 4e __ LDA T5 + 0 
0db2 : 85 2e __ STA P1 
0db4 : a5 4f __ LDA T5 + 1 
0db6 : 85 2f __ STA P2 
0db8 : a9 90 __ LDA #$90
0dba : 85 30 __ STA P3 
0dbc : a9 01 __ LDA #$01
0dbe : 85 31 __ STA P4 
0dc0 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0dc3 : a9 00 __ LDA #$00
0dc5 : 85 2e __ STA P1 
0dc7 : a9 01 __ LDA #$01
0dc9 : 85 2f __ STA P2 
0dcb : 20 13 13 JSR $1313 ; (vera_spr_flip.s0 + 0)
0dce : a9 88 __ LDA #$88
0dd0 : 85 2e __ STA P1 
0dd2 : a9 09 __ LDA #$09
0dd4 : 85 2f __ STA P2 
0dd6 : a9 00 __ LDA #$00
0dd8 : 85 30 __ STA P3 
0dda : a9 03 __ LDA #$03
0ddc : 85 31 __ STA P4 
0dde : e6 2d __ INC P0 
0de0 : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0de3 : a5 4e __ LDA T5 + 0 
0de5 : 85 2e __ STA P1 
0de7 : a5 4f __ LDA T5 + 1 
0de9 : 85 2f __ STA P2 
0deb : a9 70 __ LDA #$70
0ded : 85 30 __ STA P3 
0def : a9 01 __ LDA #$01
0df1 : 85 31 __ STA P4 
0df3 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0df6 : a5 4d __ LDA T4 + 1 
0df8 : d0 16 __ BNE $0e10 ; (SetUpSprites.s47 + 0)
.s1013:
0dfa : 18 __ __ CLC
0dfb : a5 2e __ LDA P1 
0dfd : 69 40 __ ADC #$40
0dff : 85 4e __ STA T5 + 0 
0e01 : a5 2f __ LDA P2 
0e03 : 69 00 __ ADC #$00
0e05 : 85 4f __ STA T5 + 1 
0e07 : a5 4c __ LDA T4 + 0 
0e09 : c9 16 __ CMP #$16
0e0b : b0 03 __ BCS $0e10 ; (SetUpSprites.s47 + 0)
0e0d : 4c 87 0d JMP $0d87 ; (SetUpSprites.l45 + 0)
.s47:
0e10 : a9 00 __ LDA #$00
0e12 : 85 2d __ STA P0 
0e14 : 85 30 __ STA P3 
0e16 : 85 33 __ STA P6 
0e18 : a9 30 __ LDA #$30
0e1a : 85 2e __ STA P1 
0e1c : a9 01 __ LDA #$01
0e1e : 85 2f __ STA P2 
0e20 : a9 00 __ LDA #$00
0e22 : 85 31 __ STA P4 
0e24 : a9 1d __ LDA #$1d
0e26 : 85 32 __ STA P5 
0e28 : 20 f4 11 JSR $11f4 ; (vram_putn.s0 + 0)
0e2b : a9 16 __ LDA #$16
0e2d : 85 2d __ STA P0 
0e2f : a9 80 __ LDA #$80
0e31 : 85 2e __ STA P1 
0e33 : a9 09 __ LDA #$09
0e35 : 85 2f __ STA P2 
0e37 : a9 01 __ LDA #$01
0e39 : 85 31 __ STA P4 
0e3b : 85 34 __ STA P7 
0e3d : a9 02 __ LDA #$02
0e3f : 85 32 __ STA P5 
0e41 : a9 03 __ LDA #$03
0e43 : 85 33 __ STA P6 
0e45 : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0e48 : a9 30 __ LDA #$30
0e4a : 85 2e __ STA P1 
0e4c : a9 01 __ LDA #$01
0e4e : 85 2f __ STA P2 
0e50 : a9 b8 __ LDA #$b8
0e52 : 85 30 __ STA P3 
0e54 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0e57 : a9 20 __ LDA #$20
0e59 : 85 2d __ STA P0 
0e5b : a9 35 __ LDA #$35
0e5d : 85 2e __ STA P1 
0e5f : a9 00 __ LDA #$00
0e61 : 85 30 __ STA P3 
0e63 : 85 33 __ STA P6 
0e65 : a9 02 __ LDA #$02
0e67 : 85 34 __ STA P7 
0e69 : a9 00 __ LDA #$00
0e6b : 85 31 __ STA P4 
0e6d : a9 1e __ LDA #$1e
0e6f : 85 32 __ STA P5 
0e71 : 20 f4 11 JSR $11f4 ; (vram_putn.s0 + 0)
0e74 : a9 17 __ LDA #$17
0e76 : 85 2d __ STA P0 
0e78 : a9 a9 __ LDA #$a9
0e7a : 85 2e __ STA P1 
0e7c : a9 09 __ LDA #$09
0e7e : 85 2f __ STA P2 
0e80 : a9 02 __ LDA #$02
0e82 : 85 31 __ STA P4 
0e84 : 85 32 __ STA P5 
0e86 : a9 03 __ LDA #$03
0e88 : 85 33 __ STA P6 
0e8a : a9 01 __ LDA #$01
0e8c : 85 34 __ STA P7 
0e8e : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0e91 : a9 fc __ LDA #$fc
0e93 : 85 2e __ STA P1 
0e95 : a9 00 __ LDA #$00
0e97 : 85 2f __ STA P2 
0e99 : a9 b8 __ LDA #$b8
0e9b : 85 30 __ STA P3 
0e9d : a9 01 __ LDA #$01
0e9f : 85 31 __ STA P4 
0ea1 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0ea4 : a9 18 __ LDA #$18
0ea6 : 85 2d __ STA P0 
0ea8 : a9 a9 __ LDA #$a9
0eaa : 85 2e __ STA P1 
0eac : a9 09 __ LDA #$09
0eae : 85 2f __ STA P2 
0eb0 : a9 00 __ LDA #$00
0eb2 : 85 30 __ STA P3 
0eb4 : a9 02 __ LDA #$02
0eb6 : 85 31 __ STA P4 
0eb8 : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0ebb : a9 4c __ LDA #$4c
0ebd : 85 2e __ STA P1 
0ebf : a9 01 __ LDA #$01
0ec1 : 85 2f __ STA P2 
0ec3 : 85 31 __ STA P4 
0ec5 : a9 b8 __ LDA #$b8
0ec7 : 85 30 __ STA P3 
0ec9 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0ecc : a9 10 __ LDA #$10
0ece : 85 2d __ STA P0 
0ed0 : a9 20 __ LDA #$20
0ed2 : 85 30 __ STA P3 
0ed4 : a9 00 __ LDA #$00
0ed6 : 85 31 __ STA P4 
0ed8 : a9 c5 __ LDA #$c5
0eda : 85 2e __ STA P1 
0edc : a9 17 __ LDA #$17
0ede : 85 2f __ STA P2 
0ee0 : 20 50 13 JSR $1350 ; (vera_pal_putn.s0 + 0)
0ee3 : a9 00 __ LDA #$00
0ee5 : 85 2d __ STA P0 
0ee7 : 85 30 __ STA P3 
0ee9 : 85 34 __ STA P7 
0eeb : a9 35 __ LDA #$35
0eed : 85 2e __ STA P1 
0eef : a9 01 __ LDA #$01
0ef1 : 85 2f __ STA P2 
0ef3 : a9 20 __ LDA #$20
0ef5 : 85 33 __ STA P6 
0ef7 : a9 00 __ LDA #$00
0ef9 : 85 31 __ STA P4 
0efb : a9 20 __ LDA #$20
0efd : 85 32 __ STA P5 
0eff : 20 f4 11 JSR $11f4 ; (vram_putn.s0 + 0)
0f02 : a9 00 __ LDA #$00
0f04 : 85 47 __ STA T1 + 0 
0f06 : 85 48 __ STA T2 + 0 
0f08 : a9 03 __ LDA #$03
0f0a : 85 33 __ STA P6 
0f0c : a9 02 __ LDA #$02
0f0e : 85 34 __ STA P7 
0f10 : 18 __ __ CLC
.l1039:
0f11 : a9 a8 __ LDA #$a8
0f13 : 85 2e __ STA P1 
0f15 : a9 09 __ LDA #$09
0f17 : 85 2f __ STA P2 
0f19 : a9 00 __ LDA #$00
0f1b : 85 30 __ STA P3 
0f1d : 85 31 __ STA P4 
0f1f : 85 32 __ STA P5 
0f21 : a5 47 __ LDA T1 + 0 
0f23 : 69 19 __ ADC #$19
0f25 : 85 2d __ STA P0 
0f27 : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0f2a : a9 b8 __ LDA #$b8
0f2c : 85 30 __ STA P3 
0f2e : a9 01 __ LDA #$01
0f30 : 85 31 __ STA P4 
0f32 : 38 __ __ SEC
0f33 : a5 48 __ LDA T2 + 0 
0f35 : e9 fc __ SBC #$fc
0f37 : 85 2e __ STA P1 
0f39 : a9 00 __ LDA #$00
0f3b : e9 03 __ SBC #$03
0f3d : 85 2f __ STA P2 
0f3f : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0f42 : 18 __ __ CLC
0f43 : a5 48 __ LDA T2 + 0 
0f45 : 69 0c __ ADC #$0c
0f47 : 85 48 __ STA T2 + 0 
0f49 : e6 47 __ INC T1 + 0 
0f4b : a5 47 __ LDA T1 + 0 
0f4d : c9 08 __ CMP #$08
0f4f : 90 c0 __ BCC $0f11 ; (SetUpSprites.l1039 + 0)
.s51:
0f51 : a9 00 __ LDA #$00
0f53 : 85 47 __ STA T1 + 0 
0f55 : 85 48 __ STA T2 + 0 
0f57 : a9 03 __ LDA #$03
0f59 : 85 33 __ STA P6 
0f5b : 85 34 __ STA P7 
0f5d : 18 __ __ CLC
.l1041:
0f5e : a9 a8 __ LDA #$a8
0f60 : 85 2e __ STA P1 
0f62 : a9 09 __ LDA #$09
0f64 : 85 2f __ STA P2 
0f66 : a9 00 __ LDA #$00
0f68 : 85 30 __ STA P3 
0f6a : 85 31 __ STA P4 
0f6c : a5 47 __ LDA T1 + 0 
0f6e : 69 21 __ ADC #$21
0f70 : 85 2d __ STA P0 
0f72 : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0f75 : a9 c4 __ LDA #$c4
0f77 : 85 30 __ STA P3 
0f79 : a9 01 __ LDA #$01
0f7b : 85 31 __ STA P4 
0f7d : 38 __ __ SEC
0f7e : a5 48 __ LDA T2 + 0 
0f80 : e9 fc __ SBC #$fc
0f82 : 85 2e __ STA P1 
0f84 : a9 00 __ LDA #$00
0f86 : e9 03 __ SBC #$03
0f88 : 85 2f __ STA P2 
0f8a : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0f8d : 18 __ __ CLC
0f8e : a5 48 __ LDA T2 + 0 
0f90 : 69 0c __ ADC #$0c
0f92 : 85 48 __ STA T2 + 0 
0f94 : e6 47 __ INC T1 + 0 
0f96 : a5 47 __ LDA T1 + 0 
0f98 : c9 08 __ CMP #$08
0f9a : 90 c2 __ BCC $0f5e ; (SetUpSprites.l1041 + 0)
.s55:
0f9c : a9 00 __ LDA #$00
0f9e : 85 47 __ STA T1 + 0 
0fa0 : 85 48 __ STA T2 + 0 
0fa2 : a9 03 __ LDA #$03
0fa4 : 85 33 __ STA P6 
0fa6 : a9 04 __ LDA #$04
0fa8 : 85 34 __ STA P7 
0faa : 18 __ __ CLC
.l1043:
0fab : a9 a8 __ LDA #$a8
0fad : 85 2e __ STA P1 
0faf : a9 09 __ LDA #$09
0fb1 : 85 2f __ STA P2 
0fb3 : a9 00 __ LDA #$00
0fb5 : 85 30 __ STA P3 
0fb7 : 85 31 __ STA P4 
0fb9 : a5 47 __ LDA T1 + 0 
0fbb : 69 29 __ ADC #$29
0fbd : 85 2d __ STA P0 
0fbf : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
0fc2 : a9 b8 __ LDA #$b8
0fc4 : 85 30 __ STA P3 
0fc6 : a9 01 __ LDA #$01
0fc8 : 85 31 __ STA P4 
0fca : 38 __ __ SEC
0fcb : a9 6c __ LDA #$6c
0fcd : e5 48 __ SBC T2 + 0 
0fcf : 85 2e __ STA P1 
0fd1 : a9 02 __ LDA #$02
0fd3 : e9 04 __ SBC #$04
0fd5 : 85 2f __ STA P2 
0fd7 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
0fda : 18 __ __ CLC
0fdb : a5 48 __ LDA T2 + 0 
0fdd : 69 0c __ ADC #$0c
0fdf : 85 48 __ STA T2 + 0 
0fe1 : e6 47 __ INC T1 + 0 
0fe3 : a5 47 __ LDA T1 + 0 
0fe5 : c9 08 __ CMP #$08
0fe7 : 90 c2 __ BCC $0fab ; (SetUpSprites.l1043 + 0)
.s59:
0fe9 : a9 00 __ LDA #$00
0feb : 85 47 __ STA T1 + 0 
.l61:
0fed : 38 __ __ SEC
0fee : a9 00 __ LDA #$00
0ff0 : e5 47 __ SBC T1 + 0 
0ff2 : 29 0c __ AND #$0c
0ff4 : 49 ff __ EOR #$ff
0ff6 : 38 __ __ SEC
0ff7 : 69 6c __ ADC #$6c
0ff9 : 85 48 __ STA T2 + 0 
0ffb : a9 02 __ LDA #$02
0ffd : e9 00 __ SBC #$00
0fff : 85 49 __ STA T2 + 1 
1001 : 18 __ __ CLC
1002 : a5 47 __ LDA T1 + 0 
1004 : 69 31 __ ADC #$31
1006 : 85 2d __ STA P0 
1008 : a9 02 __ LDA #$02
100a : 85 50 __ STA T7 + 0 
100c : a9 03 __ LDA #$03
100e : 85 33 __ STA P6 
1010 : a9 04 __ LDA #$04
1012 : 85 34 __ STA P7 
.l1033:
1014 : a9 a8 __ LDA #$a8
1016 : 85 2e __ STA P1 
1018 : a9 09 __ LDA #$09
101a : 85 2f __ STA P2 
101c : a9 00 __ LDA #$00
101e : 85 30 __ STA P3 
1020 : 85 31 __ STA P4 
1022 : 85 32 __ STA P5 
1024 : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
1027 : a5 48 __ LDA T2 + 0 
1029 : 85 2e __ STA P1 
102b : a5 49 __ LDA T2 + 1 
102d : 85 2f __ STA P2 
102f : a9 b8 __ LDA #$b8
1031 : 85 30 __ STA P3 
1033 : a9 01 __ LDA #$01
1035 : 85 31 __ STA P4 
1037 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
103a : c6 50 __ DEC T7 + 0 
103c : d0 d6 __ BNE $1014 ; (SetUpSprites.l1033 + 0)
.s62:
103e : e6 47 __ INC T1 + 0 
1040 : a5 47 __ LDA T1 + 0 
1042 : c9 02 __ CMP #$02
1044 : 90 a7 __ BCC $0fed ; (SetUpSprites.l61 + 0)
.s63:
1046 : a9 20 __ LDA #$20
1048 : 85 2d __ STA P0 
104a : a9 3f __ LDA #$3f
104c : 85 2e __ STA P1 
104e : a9 01 __ LDA #$01
1050 : 85 2f __ STA P2 
1052 : a9 00 __ LDA #$00
1054 : 85 30 __ STA P3 
1056 : 85 33 __ STA P6 
1058 : a9 20 __ LDA #$20
105a : 85 31 __ STA P4 
105c : a9 20 __ LDA #$20
105e : 85 32 __ STA P5 
1060 : 20 f4 11 JSR $11f4 ; (vram_putn.s0 + 0)
1063 : a9 33 __ LDA #$33
1065 : 85 2d __ STA P0 
1067 : a9 f9 __ LDA #$f9
1069 : 85 2e __ STA P1 
106b : a9 09 __ LDA #$09
106d : 85 2f __ STA P2 
106f : a9 03 __ LDA #$03
1071 : 85 31 __ STA P4 
1073 : 85 33 __ STA P6 
1075 : a9 02 __ LDA #$02
1077 : 85 32 __ STA P5 
1079 : a9 05 __ LDA #$05
107b : 85 34 __ STA P7 
107d : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
1080 : a9 1c __ LDA #$1c
1082 : 85 2e __ STA P1 
1084 : a9 01 __ LDA #$01
1086 : 85 2f __ STA P2 
1088 : a9 78 __ LDA #$78
108a : 85 30 __ STA P3 
108c : a9 00 __ LDA #$00
108e : 85 31 __ STA P4 
1090 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
1093 : a9 20 __ LDA #$20
1095 : 85 2d __ STA P0 
1097 : a9 37 __ LDA #$37
1099 : 85 2e __ STA P1 
109b : a9 00 __ LDA #$00
109d : 85 30 __ STA P3 
109f : 85 33 __ STA P6 
10a1 : a9 08 __ LDA #$08
10a3 : 85 34 __ STA P7 
10a5 : a9 20 __ LDA #$20
10a7 : 85 31 __ STA P4 
10a9 : a9 24 __ LDA #$24
10ab : 85 32 __ STA P5 
10ad : 20 f4 11 JSR $11f4 ; (vram_putn.s0 + 0)
10b0 : a9 00 __ LDA #$00
10b2 : 85 47 __ STA T1 + 0 
10b4 : 85 48 __ STA T2 + 0 
10b6 : 85 49 __ STA T2 + 1 
10b8 : a9 05 __ LDA #$05
10ba : 85 34 __ STA P7 
10bc : 18 __ __ CLC
.l1045:
10bd : a9 b9 __ LDA #$b9
10bf : 85 2e __ STA P1 
10c1 : a9 09 __ LDA #$09
10c3 : 85 2f __ STA P2 
10c5 : a9 00 __ LDA #$00
10c7 : 85 30 __ STA P3 
10c9 : a9 03 __ LDA #$03
10cb : 85 31 __ STA P4 
10cd : 85 32 __ STA P5 
10cf : 85 33 __ STA P6 
10d1 : a5 47 __ LDA T1 + 0 
10d3 : 69 34 __ ADC #$34
10d5 : 85 2d __ STA P0 
10d7 : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
10da : a9 f4 __ LDA #$f4
10dc : 85 2e __ STA P1 
10de : a9 00 __ LDA #$00
10e0 : 85 2f __ STA P2 
10e2 : 38 __ __ SEC
10e3 : a5 48 __ LDA T2 + 0 
10e5 : e9 20 __ SBC #$20
10e7 : 85 4a __ STA T3 + 0 
10e9 : 85 30 __ STA P3 
10eb : a5 49 __ LDA T2 + 1 
10ed : e9 00 __ SBC #$00
10ef : 85 4b __ STA T3 + 1 
10f1 : 85 31 __ STA P4 
10f3 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
10f6 : a9 b9 __ LDA #$b9
10f8 : 85 2e __ STA P1 
10fa : a9 09 __ LDA #$09
10fc : 85 2f __ STA P2 
10fe : a9 00 __ LDA #$00
1100 : 85 30 __ STA P3 
1102 : a9 03 __ LDA #$03
1104 : 85 31 __ STA P4 
1106 : 18 __ __ CLC
1107 : a5 47 __ LDA T1 + 0 
1109 : 69 3b __ ADC #$3b
110b : 85 2d __ STA P0 
110d : 20 7d 12 JSR $127d ; (vera_spr_set.s0 + 0)
1110 : a9 40 __ LDA #$40
1112 : 85 2e __ STA P1 
1114 : a9 01 __ LDA #$01
1116 : 85 2f __ STA P2 
1118 : a5 4a __ LDA T3 + 0 
111a : 85 30 __ STA P3 
111c : a5 4b __ LDA T3 + 1 
111e : 85 31 __ STA P4 
1120 : 20 da 12 JSR $12da ; (vera_spr_move.s0 + 0)
1123 : 18 __ __ CLC
1124 : a5 48 __ LDA T2 + 0 
1126 : 69 40 __ ADC #$40
1128 : 85 48 __ STA T2 + 0 
112a : 90 02 __ BCC $112e ; (SetUpSprites.s1048 + 0)
.s1047:
112c : e6 49 __ INC T2 + 1 
.s1048:
112e : e6 47 __ INC T1 + 0 
1130 : a5 47 __ LDA T1 + 0 
1132 : c9 07 __ CMP #$07
1134 : 90 87 __ BCC $10bd ; (SetUpSprites.l1045 + 0)
.s71:
1136 : a9 20 __ LDA #$20
1138 : 85 37 __ STA P10 
113a : a9 40 __ LDA #$40
113c : 8d fc 9e STA $9efc ; (sstack + 0)
113f : a9 fa __ LDA #$fa
1141 : 8d fd 9e STA $9efd ; (sstack + 1)
1144 : a9 01 __ LDA #$01
1146 : 8d fe 9e STA $9efe ; (sstack + 2)
1149 : a9 00 __ LDA #$00
114b : 8d ff 9e STA $9eff ; (sstack + 3)
114e : a9 20 __ LDA #$20
1150 : 85 35 __ STA P8 
1152 : a9 2c __ LDA #$2c
1154 : 85 36 __ STA P9 
1156 : 20 56 12 JSR $1256 ; (SetPaletteColours.s0 + 0)
1159 : a9 60 __ LDA #$60
115b : 8d fc 9e STA $9efc ; (sstack + 0)
115e : a9 fa __ LDA #$fa
1160 : 8d fd 9e STA $9efd ; (sstack + 1)
1163 : a9 01 __ LDA #$01
1165 : 8d fe 9e STA $9efe ; (sstack + 2)
1168 : a9 00 __ LDA #$00
116a : 8d ff 9e STA $9eff ; (sstack + 3)
116d : a9 40 __ LDA #$40
116f : 85 35 __ STA P8 
1171 : a9 2c __ LDA #$2c
1173 : 85 36 __ STA P9 
1175 : 20 56 12 JSR $1256 ; (SetPaletteColours.s0 + 0)
1178 : a9 80 __ LDA #$80
117a : 8d fc 9e STA $9efc ; (sstack + 0)
117d : a9 fa __ LDA #$fa
117f : 8d fd 9e STA $9efd ; (sstack + 1)
1182 : a9 01 __ LDA #$01
1184 : 8d fe 9e STA $9efe ; (sstack + 2)
1187 : a9 00 __ LDA #$00
1189 : 8d ff 9e STA $9eff ; (sstack + 3)
118c : a9 60 __ LDA #$60
118e : 85 35 __ STA P8 
1190 : a9 2c __ LDA #$2c
1192 : 85 36 __ STA P9 
1194 : 4c 56 12 JMP $1256 ; (SetPaletteColours.s0 + 0)
.s1017:
1197 : c9 09 __ CMP #$09
1199 : 90 06 __ BCC $11a1 ; (SetUpSprites.s32 + 0)
.s1016:
119b : a9 45 __ LDA #$45
119d : c5 48 __ CMP T2 + 0 
119f : b0 05 __ BCS $11a6 ; (SetUpSprites.s1005 + 0)
.s32:
11a1 : a9 04 __ LDA #$04
11a3 : 4c 31 0d JMP $0d31 ; (SetUpSprites.s174 + 0)
.s1005:
11a6 : a5 48 __ LDA T2 + 0 
11a8 : c9 13 __ CMP #$13
11aa : 90 06 __ BCC $11b2 ; (SetUpSprites.s36 + 0)
.s1004:
11ac : a9 3b __ LDA #$3b
11ae : c5 48 __ CMP T2 + 0 
11b0 : b0 05 __ BCS $11b7 ; (SetUpSprites.s1003 + 0)
.s36:
11b2 : a9 05 __ LDA #$05
11b4 : 4c 24 0d JMP $0d24 ; (SetUpSprites.s184 + 0)
.s1003:
11b7 : a5 48 __ LDA T2 + 0 
11b9 : c9 1d __ CMP #$1d
11bb : 90 06 __ BCC $11c3 ; (SetUpSprites.s40 + 0)
.s1002:
11bd : a9 31 __ LDA #$31
11bf : c5 48 __ CMP T2 + 0 
11c1 : b0 05 __ BCS $11c8 ; (SetUpSprites.s41 + 0)
.s40:
11c3 : a9 06 __ LDA #$06
11c5 : 4c 24 0d JMP $0d24 ; (SetUpSprites.s184 + 0)
.s41:
11c8 : a9 07 __ LDA #$07
11ca : 4c 24 0d JMP $0d24 ; (SetUpSprites.s184 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
11cd : a5 2d __ LDA P0 ; (bank + 0)
11cf : 4a __ __ LSR
11d0 : a9 00 __ LDA #$00
11d2 : 6a __ __ ROR
11d3 : 85 3b __ STA ACCU + 0 
11d5 : a5 2f __ LDA P2 ; (mem + 1)
11d7 : 29 f8 __ AND #$f8
11d9 : 4a __ __ LSR
11da : 05 3b __ ORA ACCU + 0 
11dc : 85 3b __ STA ACCU + 0 
11de : a5 30 __ LDA P3 ; (height + 0)
11e0 : 0a __ __ ASL
11e1 : 05 3b __ ORA ACCU + 0 
11e3 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
11e5 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
11e6 : a5 2d __ LDA P0 ; (bank + 0)
11e8 : 4a __ __ LSR
11e9 : a9 00 __ LDA #$00
11eb : 6a __ __ ROR
11ec : 85 3b __ STA ACCU + 0 
11ee : a5 2f __ LDA P2 ; (mem + 1)
11f0 : 4a __ __ LSR
11f1 : 05 3b __ ORA ACCU + 0 
.s1001:
11f3 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
11f4 : ad 25 9f LDA $9f25 
11f7 : 29 fe __ AND #$fe
11f9 : 8d 25 9f STA $9f25 
11fc : a5 2d __ LDA P0 ; (addr + 0)
11fe : 8d 20 9f STA $9f20 
1201 : a5 2e __ LDA P1 ; (addr + 1)
1203 : 8d 21 9f STA $9f21 
1206 : a5 2f __ LDA P2 ; (addr + 2)
1208 : 29 01 __ AND #$01
120a : 09 10 __ ORA #$10
120c : 8d 22 9f STA $9f22 
120f : a5 33 __ LDA P6 ; (size + 0)
1211 : 05 34 __ ORA P7 ; (size + 1)
1213 : f0 19 __ BEQ $122e ; (vram_putn.s1001 + 0)
.s6:
1215 : a0 00 __ LDY #$00
1217 : a6 33 __ LDX P6 ; (size + 0)
1219 : f0 02 __ BEQ $121d ; (vram_putn.l1002 + 0)
.s1005:
121b : e6 34 __ INC P7 ; (size + 1)
.l1002:
121d : b1 31 __ LDA (P4),y ; (data + 0)
121f : 8d 23 9f STA $9f23 
1222 : c8 __ __ INY
1223 : d0 02 __ BNE $1227 ; (vram_putn.s1009 + 0)
.s1008:
1225 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1227 : ca __ __ DEX
1228 : d0 f3 __ BNE $121d ; (vram_putn.l1002 + 0)
.s1004:
122a : c6 34 __ DEC P7 ; (size + 1)
122c : d0 ef __ BNE $121d ; (vram_putn.l1002 + 0)
.s1001:
122e : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1810 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1820 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1830 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1840 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1850 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1860 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1870 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1880 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1890 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
18a0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
18b0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
18c0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
18d0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
18e0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
18f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
122f : ad a4 17 LDA $17a4 ; (seed + 1)
1232 : 4a __ __ LSR
1233 : ad a3 17 LDA $17a3 ; (seed + 0)
1236 : 6a __ __ ROR
1237 : aa __ __ TAX
1238 : a9 00 __ LDA #$00
123a : 6a __ __ ROR
123b : 4d a3 17 EOR $17a3 ; (seed + 0)
123e : 85 3b __ STA ACCU + 0 
1240 : 8a __ __ TXA
1241 : 4d a4 17 EOR $17a4 ; (seed + 1)
1244 : 85 3c __ STA ACCU + 1 
1246 : 4a __ __ LSR
1247 : 45 3b __ EOR ACCU + 0 
1249 : 8d a3 17 STA $17a3 ; (seed + 0)
124c : 85 3b __ STA ACCU + 0 
124e : 45 3c __ EOR ACCU + 1 
1250 : 8d a4 17 STA $17a4 ; (seed + 1)
1253 : 85 3c __ STA ACCU + 1 
.s1001:
1255 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
17a3 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1256 : ad fc 9e LDA $9efc ; (sstack + 0)
1259 : 85 2d __ STA P0 
125b : ad fd 9e LDA $9efd ; (sstack + 1)
125e : 85 2e __ STA P1 
1260 : ad fe 9e LDA $9efe ; (sstack + 2)
1263 : 85 2f __ STA P2 
1265 : ad ff 9e LDA $9eff ; (sstack + 3)
1268 : 85 30 __ STA P3 
126a : a5 35 __ LDA P8 ; (input + 0)
126c : 85 31 __ STA P4 
126e : a5 36 __ LDA P9 ; (input + 1)
1270 : 85 32 __ STA P5 
1272 : a5 37 __ LDA P10 ; (inputsize + 0)
1274 : 85 33 __ STA P6 
1276 : a9 00 __ LDA #$00
1278 : 85 34 __ STA P7 
127a : 4c f4 11 JMP $11f4 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
17a5 : __ __ __ BYT 23 02 12 01 01 11 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
17b5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ScrollerOutline:
1900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1910 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1920 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1930 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1940 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1950 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1960 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1970 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1980 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1990 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
19a0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
19b0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
19c0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
19d0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
19e0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
19f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1a00 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1a10 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1a20 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1a30 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1a40 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1a50 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1a60 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1a70 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1a80 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1a90 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1aa0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1ab0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1ac0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ad0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ae0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1af0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b00 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b20 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b40 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b60 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b80 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1b90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ba0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1bb0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1bc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1bd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1be0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1bf0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1c00 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
1c10 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
1c20 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
1c30 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
1c40 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
1c50 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
1c60 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
1c70 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
1c80 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
1c90 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
1ca0 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
1cb0 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
1cc0 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
1cd0 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
1ce0 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
1cf0 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
127d : ad 25 9f LDA $9f25 
1280 : 29 fe __ AND #$fe
1282 : 8d 25 9f STA $9f25 
1285 : a5 2d __ LDA P0 ; (spr + 0)
1287 : 0a __ __ ASL
1288 : 0a __ __ ASL
1289 : 85 3b __ STA ACCU + 0 
128b : a9 3f __ LDA #$3f
128d : 2a __ __ ROL
128e : 06 3b __ ASL ACCU + 0 
1290 : 2a __ __ ROL
1291 : 8d 21 9f STA $9f21 
1294 : a5 3b __ LDA ACCU + 0 
1296 : 8d 20 9f STA $9f20 
1299 : a9 11 __ LDA #$11
129b : 8d 22 9f STA $9f22 
129e : a5 30 __ LDA P3 ; (mode8 + 0)
12a0 : f0 02 __ BEQ $12a4 ; (vera_spr_set.s11 + 0)
.s9:
12a2 : a9 80 __ LDA #$80
.s11:
12a4 : 05 2f __ ORA P2 ; (addr32 + 1)
12a6 : a6 2e __ LDX P1 ; (addr32 + 0)
12a8 : 8e 23 9f STX $9f23 
12ab : 8d 23 9f STA $9f23 
12ae : a9 00 __ LDA #$00
12b0 : 8d 23 9f STA $9f23 
12b3 : 8d 23 9f STA $9f23 
12b6 : 8d 23 9f STA $9f23 
12b9 : 8d 23 9f STA $9f23 
12bc : a5 33 __ LDA P6 ; (z + 0)
12be : 0a __ __ ASL
12bf : 0a __ __ ASL
12c0 : 8d 23 9f STA $9f23 
12c3 : a5 32 __ LDA P5 ; (h + 0)
12c5 : 4a __ __ LSR
12c6 : 6a __ __ ROR
12c7 : 29 80 __ AND #$80
12c9 : 6a __ __ ROR
12ca : 85 3b __ STA ACCU + 0 
12cc : a5 31 __ LDA P4 ; (w + 0)
12ce : 0a __ __ ASL
12cf : 0a __ __ ASL
12d0 : 0a __ __ ASL
12d1 : 0a __ __ ASL
12d2 : 05 3b __ ORA ACCU + 0 
12d4 : 05 34 __ ORA P7 ; (pal + 0)
12d6 : 8d 23 9f STA $9f23 
.s1001:
12d9 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
12da : ad 25 9f LDA $9f25 
12dd : 29 fe __ AND #$fe
12df : 8d 25 9f STA $9f25 
12e2 : a5 2d __ LDA P0 ; (spr + 0)
12e4 : 0a __ __ ASL
12e5 : 0a __ __ ASL
12e6 : 85 3b __ STA ACCU + 0 
12e8 : a9 3f __ LDA #$3f
12ea : 2a __ __ ROL
12eb : 06 3b __ ASL ACCU + 0 
12ed : 2a __ __ ROL
12ee : aa __ __ TAX
12ef : a5 3b __ LDA ACCU + 0 
12f1 : 09 02 __ ORA #$02
12f3 : 8d 20 9f STA $9f20 
12f6 : 8e 21 9f STX $9f21 
12f9 : a9 11 __ LDA #$11
12fb : 8d 22 9f STA $9f22 
12fe : a5 2e __ LDA P1 ; (x + 0)
1300 : 8d 23 9f STA $9f23 
1303 : a5 2f __ LDA P2 ; (x + 1)
1305 : 8d 23 9f STA $9f23 
1308 : a5 30 __ LDA P3 ; (y + 0)
130a : 8d 23 9f STA $9f23 
130d : a5 31 __ LDA P4 ; (y + 1)
130f : 8d 23 9f STA $9f23 
.s1001:
1312 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
1313 : ad 25 9f LDA $9f25 
1316 : 29 fe __ AND #$fe
1318 : 8d 25 9f STA $9f25 
131b : a5 2d __ LDA P0 ; (spr + 0)
131d : 0a __ __ ASL
131e : 0a __ __ ASL
131f : 85 3b __ STA ACCU + 0 
1321 : a9 3f __ LDA #$3f
1323 : 2a __ __ ROL
1324 : 06 3b __ ASL ACCU + 0 
1326 : 2a __ __ ROL
1327 : aa __ __ TAX
1328 : a5 3b __ LDA ACCU + 0 
132a : 09 06 __ ORA #$06
132c : 8d 20 9f STA $9f20 
132f : 8e 21 9f STX $9f21 
1332 : a9 01 __ LDA #$01
1334 : 8d 22 9f STA $9f22 
1337 : ad 23 9f LDA $9f23 
133a : 29 fc __ AND #$fc
133c : a8 __ __ TAY
133d : a5 2e __ LDA P1 ; (fliph + 0)
133f : f0 01 __ BEQ $1342 ; (vera_spr_flip.s14 + 0)
.s6:
1341 : c8 __ __ INY
.s14:
1342 : a5 2f __ LDA P2 ; (flipv + 0)
1344 : f0 05 __ BEQ $134b ; (vera_spr_flip.s11 + 0)
.s9:
1346 : 98 __ __ TYA
1347 : 09 02 __ ORA #$02
1349 : d0 01 __ BNE $134c ; (vera_spr_flip.s1002 + 0)
.s11:
134b : 98 __ __ TYA
.s1002:
134c : 8d 23 9f STA $9f23 
.s1001:
134f : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
1d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d10 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
1d20 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1d30 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1d40 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1d50 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1d60 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1d70 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1d80 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1d90 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1da0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1db0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1dc0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1dd0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
1de0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
1df0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
1e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
1e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
1e20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
1e30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
1e40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
1e50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
1e60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
1e70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
1e80 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
1e90 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
1ea0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
1eb0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
1ec0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
1ed0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
1ee0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
1ef0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
1f00 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
1f10 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
1f20 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
1f30 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
1f40 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
1f50 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
1f60 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
1f70 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
1f80 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
1f90 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
1fa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
1fb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
1fc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
1fd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
1fe0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
1ff0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1350 : ad 25 9f LDA $9f25 
1353 : 29 fe __ AND #$fe
1355 : 8d 25 9f STA $9f25 
1358 : a5 2d __ LDA P0 ; (index + 0)
135a : 0a __ __ ASL
135b : 8d 20 9f STA $9f20 
135e : a9 7d __ LDA #$7d
1360 : 2a __ __ ROL
1361 : 8d 21 9f STA $9f21 
1364 : a9 11 __ LDA #$11
1366 : 8d 22 9f STA $9f22 
1369 : a5 30 __ LDA P3 ; (size + 0)
136b : 05 31 __ ORA P4 ; (size + 1)
136d : f0 29 __ BEQ $1398 ; (vera_pal_putn.s1001 + 0)
.s6:
136f : a6 30 __ LDX P3 ; (size + 0)
1371 : f0 02 __ BEQ $1375 ; (vera_pal_putn.l3 + 0)
.s1003:
1373 : e6 31 __ INC P4 ; (size + 1)
.l3:
1375 : a0 01 __ LDY #$01
1377 : b1 2e __ LDA (P1),y ; (color + 0)
1379 : 85 3c __ STA ACCU + 1 
137b : 88 __ __ DEY
137c : b1 2e __ LDA (P1),y ; (color + 0)
137e : 8d 23 9f STA $9f23 
1381 : a5 3c __ LDA ACCU + 1 
1383 : 8d 23 9f STA $9f23 
1386 : 18 __ __ CLC
1387 : a5 2e __ LDA P1 ; (color + 0)
1389 : 69 02 __ ADC #$02
138b : 85 2e __ STA P1 ; (color + 0)
138d : 90 02 __ BCC $1391 ; (vera_pal_putn.s1007 + 0)
.s1006:
138f : e6 2f __ INC P2 ; (color + 1)
.s1007:
1391 : ca __ __ DEX
1392 : d0 e1 __ BNE $1375 ; (vera_pal_putn.l3 + 0)
.s1002:
1394 : c6 31 __ DEC P4 ; (size + 1)
1396 : d0 dd __ BNE $1375 ; (vera_pal_putn.l3 + 0)
.s1001:
1398 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
17c5 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 61 01 : ......f.D."...a.
17d5 : __ __ __ BYT 30 00 c2 02 00 00 00 00 00 00 00 00 00 00 00 00 : 0...............
--------------------------------------------------------------------
VolumeInd:
2000 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
2010 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainEyeBack:
2020 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2030 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2040 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2050 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2060 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2070 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2080 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2090 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
20a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
20b0 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
20c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
20d0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
20e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
20f0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2100 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2110 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2120 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2130 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2140 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2150 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2160 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2170 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2180 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2190 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
21a0 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
21b0 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
21c0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
21d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
21e0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
21f0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2200 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2210 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2220 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2230 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2240 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2250 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2260 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2270 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2280 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2290 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
22a0 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
22b0 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
22c0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
22d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
22e0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
22f0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2300 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2310 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2320 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2330 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2340 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2350 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2370 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2390 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
23a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
23b0 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
23c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
23d0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
23e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
23f0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2410 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2420 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2430 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2440 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2450 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2460 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2470 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2480 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2490 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
24a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
24b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
24c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
24d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
24e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
24f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2500 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2510 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2520 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2530 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2540 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2550 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2560 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2570 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2580 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2590 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
25a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
25b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
25c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
25d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
25e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
25f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2600 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2610 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2620 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2630 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2640 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2650 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2660 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2670 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2680 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2690 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
26a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
26b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
26c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
26d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
26e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
26f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2700 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2710 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2720 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2730 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2740 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2750 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2760 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2770 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2780 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2790 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
27a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
27b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
27c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
27d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
27e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
27f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2800 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2810 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2820 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2830 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2840 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2850 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2860 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2870 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2880 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2890 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
28a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
28b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
28c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
28d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
28e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
28f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2900 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2910 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2920 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2930 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2940 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2950 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2960 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2970 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2980 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2990 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
29a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
29b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
29c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
29d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
29e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
29f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2a00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2a10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2a20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2a30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2a40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2a50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2a60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2a70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2a80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2a90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2aa0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2ab0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2ac0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2ad0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2ae0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2af0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2b00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2b10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2b20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2b30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2b40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2b50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2b60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2b70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2b80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2b90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2ba0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2bb0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2bc0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2bd0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2be0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2bf0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2c00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2c10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
--------------------------------------------------------------------
ButtonStageMax:
2c20 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
2c30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
2c40 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
2c50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
2c60 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
2c70 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
p:
17e5 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalTimer:
17e7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
2c80 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
2c90 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1399 : a9 10 __ LDA #$10
139b : 85 30 __ STA P3 
139d : a9 00 __ LDA #$00
139f : 85 31 __ STA P4 
13a1 : a5 32 __ LDA P5 ; (Palette + 0)
13a3 : 85 2e __ STA P1 
13a5 : 85 47 __ STA T0 + 0 
13a7 : a5 33 __ LDA P6 ; (Palette + 1)
13a9 : 85 2f __ STA P2 
13ab : 85 48 __ STA T0 + 1 
13ad : ad fc 9e LDA $9efc ; (sstack + 0)
13b0 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
13b2 : 0a __ __ ASL
13b3 : 85 49 __ STA T2 + 0 
13b5 : ad fd 9e LDA $9efd ; (sstack + 1)
13b8 : 2a __ __ ROL
13b9 : 18 __ __ CLC
13ba : 65 33 __ ADC P6 ; (Palette + 1)
13bc : 85 4a __ STA T2 + 1 
13be : a4 32 __ LDY P5 ; (Palette + 0)
13c0 : b1 49 __ LDA (T2 + 0),y 
13c2 : aa __ __ TAX
13c3 : c8 __ __ INY
13c4 : b1 49 __ LDA (T2 + 0),y 
13c6 : 86 49 __ STX T2 + 0 
13c8 : 85 4a __ STA T2 + 1 
13ca : a9 00 __ LDA #$00
13cc : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
13ce : ad fe 9e LDA $9efe ; (sstack + 2)
13d1 : 85 4b __ STA T4 + 0 
13d3 : 38 __ __ SEC
13d4 : e9 01 __ SBC #$01
13d6 : 85 4d __ STA T5 + 0 
13d8 : ad ff 9e LDA $9eff ; (sstack + 3)
13db : 85 4c __ STA T4 + 1 
13dd : e9 00 __ SBC #$00
13df : 85 4e __ STA T5 + 1 
13e1 : d0 06 __ BNE $13e9 ; (SetPaletteIndex.s5 + 0)
.s1004:
13e3 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
13e5 : c5 4d __ CMP T5 + 0 
13e7 : b0 38 __ BCS $1421 ; (SetPaletteIndex.s4 + 0)
.s5:
13e9 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
13eb : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
13ed : 18 __ __ CLC
13ee : a5 32 __ LDA P5 ; (Palette + 0)
13f0 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
13f2 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
13f4 : a5 33 __ LDA P6 ; (Palette + 1)
13f6 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
13f8 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
13fa : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
13fd : a0 02 __ LDY #$02
13ff : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1401 : a0 00 __ LDY #$00
1403 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1405 : a0 03 __ LDY #$03
1407 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1409 : a0 01 __ LDY #$01
140b : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
140d : 18 __ __ CLC
140e : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1410 : 69 02 __ ADC #$02
1412 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1414 : 90 02 __ BCC $1418 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1416 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1418 : e8 __ __ INX
1419 : a5 4e __ LDA T5 + 1 
141b : d0 e0 __ BNE $13fd ; (SetPaletteIndex.l2 + 0)
.s1002:
141d : e4 4d __ CPX T5 + 0 
141f : 90 dc __ BCC $13fd ; (SetPaletteIndex.l2 + 0)
.s4:
1421 : a5 4b __ LDA T4 + 0 
1423 : 0a __ __ ASL
1424 : aa __ __ TAX
1425 : a5 4c __ LDA T4 + 1 
1427 : 2a __ __ ROL
1428 : a8 __ __ TAY
1429 : 8a __ __ TXA
142a : 38 __ __ SEC
142b : e9 02 __ SBC #$02
142d : b0 01 __ BCS $1430 ; (SetPaletteIndex.s1010 + 0)
.s1009:
142f : 88 __ __ DEY
.s1010:
1430 : 18 __ __ CLC
1431 : 65 47 __ ADC T0 + 0 
1433 : 85 47 __ STA T0 + 0 
1435 : 98 __ __ TYA
1436 : 65 48 __ ADC T0 + 1 
1438 : 85 48 __ STA T0 + 1 
143a : a5 49 __ LDA T2 + 0 
143c : a0 00 __ LDY #$00
143e : 91 47 __ STA (T0 + 0),y 
1440 : a5 4a __ LDA T2 + 1 
1442 : c8 __ __ INY
1443 : 91 47 __ STA (T0 + 0),y 
1445 : a5 34 __ LDA P7 ; (index + 0)
1447 : 85 2d __ STA P0 
1449 : 4c 50 13 JMP $1350 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
17e9 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
2ca0 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
2cb0 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
17eb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPalShimmer:
2cc0 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
2cd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
zsm_check:
.s0:
144c : ad a1 17 LDA $17a1 ; (zsm_finished + 0)
.s1001:
144f : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1450 : a9 01 __ LDA #$01
1452 : 8d a1 17 STA $17a1 ; (zsm_finished + 0)
1455 : ad ec 17 LDA $17ec ; (zsm_reading + 0)
1458 : f0 0a __ BEQ $1464 ; (zsm_init.s3 + 0)
.s1:
145a : a9 02 __ LDA #$02
145c : 20 a9 14 JSR $14a9 ; (krnio_close.s1000 + 0)
145f : a9 00 __ LDA #$00
1461 : 8d ec 17 STA $17ec ; (zsm_reading + 0)
.s3:
1464 : 8d f4 17 STA $17f4 ; (zsm_pos + 0)
1467 : 8d f5 17 STA $17f5 ; (zsm_pos + 1)
146a : 8d f6 17 STA $17f6 ; (zsm_wpos + 0)
146d : 8d f7 17 STA $17f7 ; (zsm_wpos + 1)
1470 : 8d f3 17 STA $17f3 ; (zsm_delay + 0)
1473 : a5 30 __ LDA P3 ; (fname + 0)
1475 : 85 2d __ STA P0 
1477 : a5 31 __ LDA P4 ; (fname + 1)
1479 : 85 2e __ STA P1 
147b : 20 b1 14 JSR $14b1 ; (krnio_setnam.s0 + 0)
147e : a9 02 __ LDA #$02
1480 : 85 2d __ STA P0 
1482 : 85 2f __ STA P2 
1484 : a9 08 __ LDA #$08
1486 : 85 2e __ STA P1 
1488 : 20 c7 14 JSR $14c7 ; (krnio_open.s0 + 0)
148b : a5 3b __ LDA ACCU + 0 
148d : f0 19 __ BEQ $14a8 ; (zsm_init.s1001 + 0)
.s4:
148f : a9 01 __ LDA #$01
1491 : 8d ec 17 STA $17ec ; (zsm_reading + 0)
1494 : 20 ef 14 JSR $14ef ; (zsm_fill.s0 + 0)
1497 : a9 10 __ LDA #$10
1499 : 8d f4 17 STA $17f4 ; (zsm_pos + 0)
149c : a9 00 __ LDA #$00
149e : 8d f5 17 STA $17f5 ; (zsm_pos + 1)
14a1 : 8d a1 17 STA $17a1 ; (zsm_finished + 0)
14a4 : a9 01 __ LDA #$01
14a6 : 85 3b __ STA ACCU + 0 
.s1001:
14a8 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
17ec : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
14a9 : 85 2d __ STA P0 
.s0:
14ab : a5 2d __ LDA P0 
14ad : 20 c3 ff JSR $ffc3 
.s1001:
14b0 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
17f6 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
14b1 : a5 2d __ LDA P0 
14b3 : 05 2e __ ORA P1 
14b5 : f0 08 __ BEQ $14bf ; (krnio_setnam.s0 + 14)
14b7 : a0 ff __ LDY #$ff
14b9 : c8 __ __ INY
14ba : b1 2d __ LDA (P0),y 
14bc : d0 fb __ BNE $14b9 ; (krnio_setnam.s0 + 8)
14be : 98 __ __ TYA
14bf : a6 2d __ LDX P0 
14c1 : a4 2e __ LDY P1 
14c3 : 20 bd ff JSR $ffbd 
.s1001:
14c6 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
14c7 : a9 00 __ LDA #$00
14c9 : a6 2d __ LDX P0 ; (fnum + 0)
14cb : 9d e0 2c STA $2ce0,x ; (krnio_pstatus + 0)
14ce : a9 00 __ LDA #$00
14d0 : 85 3b __ STA ACCU + 0 
14d2 : 85 3c __ STA ACCU + 1 
14d4 : a5 2d __ LDA P0 ; (fnum + 0)
14d6 : a6 2e __ LDX P1 
14d8 : a4 2f __ LDY P2 
14da : 20 ba ff JSR $ffba 
14dd : 20 c0 ff JSR $ffc0 
14e0 : 90 08 __ BCC $14ea ; (krnio_open.s0 + 35)
14e2 : a5 2d __ LDA P0 ; (fnum + 0)
14e4 : 20 c3 ff JSR $ffc3 
14e7 : 4c ee 14 JMP $14ee ; (krnio_open.s1001 + 0)
14ea : a9 01 __ LDA #$01
14ec : 85 3b __ STA ACCU + 0 
.s1001:
14ee : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
2ce0 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
14ef : ad ec 17 LDA $17ec ; (zsm_reading + 0)
14f2 : f0 20 __ BEQ $1514 ; (zsm_fill.s1 + 0)
.s2:
14f4 : ad f5 17 LDA $17f5 ; (zsm_pos + 1)
14f7 : 18 __ __ CLC
14f8 : 69 04 __ ADC #$04
14fa : cd f7 17 CMP $17f7 ; (zsm_wpos + 1)
14fd : d0 0c __ BNE $150b ; (zsm_fill.s6 + 0)
.s1006:
14ff : ad f6 17 LDA $17f6 ; (zsm_wpos + 0)
1502 : cd f4 17 CMP $17f4 ; (zsm_pos + 0)
1505 : d0 04 __ BNE $150b ; (zsm_fill.s6 + 0)
.s5:
1507 : a9 00 __ LDA #$00
1509 : f0 0b __ BEQ $1516 ; (zsm_fill.s1008 + 0)
.s6:
150b : a9 02 __ LDA #$02
150d : 20 93 15 JSR $1593 ; (krnio_chkin.s1000 + 0)
1510 : a5 3b __ LDA ACCU + 0 
1512 : d0 07 __ BNE $151b ; (zsm_fill.s9 + 0)
.s1:
1514 : a9 ff __ LDA #$ff
.s1008:
1516 : 85 3b __ STA ACCU + 0 
.s1001:
1518 : 85 3c __ STA ACCU + 1 
151a : 60 __ __ RTS
.s9:
151b : a9 00 __ LDA #$00
151d : 85 47 __ STA T1 + 0 
151f : 85 48 __ STA T1 + 1 
1521 : ad f5 17 LDA $17f5 ; (zsm_pos + 1)
1524 : 18 __ __ CLC
1525 : 69 04 __ ADC #$04
1527 : cd f7 17 CMP $17f7 ; (zsm_wpos + 1)
152a : d0 08 __ BNE $1534 ; (zsm_fill.l13 + 0)
.s1002:
152c : ad f6 17 LDA $17f6 ; (zsm_wpos + 0)
152f : cd f4 17 CMP $17f4 ; (zsm_pos + 0)
1532 : f0 49 __ BEQ $157d ; (zsm_fill.s37 + 0)
.l13:
1534 : 20 a5 15 JSR $15a5 ; (krnio_chrin.s0 + 0)
1537 : ad f6 17 LDA $17f6 ; (zsm_wpos + 0)
153a : aa __ __ TAX
153b : 18 __ __ CLC
153c : 69 01 __ ADC #$01
153e : 8d f6 17 STA $17f6 ; (zsm_wpos + 0)
1541 : ad f7 17 LDA $17f7 ; (zsm_wpos + 1)
1544 : a8 __ __ TAY
1545 : 69 00 __ ADC #$00
1547 : 8d f7 17 STA $17f7 ; (zsm_wpos + 1)
154a : 8a __ __ TXA
154b : 18 __ __ CLC
154c : 69 3b __ ADC #$3b
154e : 85 49 __ STA T3 + 0 
1550 : 98 __ __ TYA
1551 : 29 03 __ AND #$03
1553 : 69 2d __ ADC #$2d
1555 : 85 4a __ STA T3 + 1 
1557 : a5 3b __ LDA ACCU + 0 
1559 : a0 00 __ LDY #$00
155b : 91 49 __ STA (T3 + 0),y 
155d : e6 47 __ INC T1 + 0 
155f : d0 02 __ BNE $1563 ; (zsm_fill.s1010 + 0)
.s1009:
1561 : e6 48 __ INC T1 + 1 
.s1010:
1563 : 20 af 15 JSR $15af ; (krnio_status.s0 + 0)
1566 : a5 3b __ LDA ACCU + 0 
1568 : d0 0e __ BNE $1578 ; (zsm_fill.s15 + 0)
.s12:
156a : ad f5 17 LDA $17f5 ; (zsm_pos + 1)
156d : 18 __ __ CLC
156e : 69 04 __ ADC #$04
1570 : cd f7 17 CMP $17f7 ; (zsm_wpos + 1)
1573 : d0 bf __ BNE $1534 ; (zsm_fill.l13 + 0)
1575 : 4c 2c 15 JMP $152c ; (zsm_fill.s1002 + 0)
.s15:
1578 : a9 00 __ LDA #$00
157a : 8d ec 17 STA $17ec ; (zsm_reading + 0)
.s37:
157d : 20 b9 15 JSR $15b9 ; (krnio_clrchn.s0 + 0)
1580 : ad ec 17 LDA $17ec ; (zsm_reading + 0)
1583 : d0 05 __ BNE $158a ; (zsm_fill.s21 + 0)
.s19:
1585 : a9 02 __ LDA #$02
1587 : 20 a9 14 JSR $14a9 ; (krnio_close.s1000 + 0)
.s21:
158a : a5 47 __ LDA T1 + 0 
158c : 85 3b __ STA ACCU + 0 
158e : a5 48 __ LDA T1 + 1 
1590 : 4c 18 15 JMP $1518 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1593 : 85 2d __ STA P0 
.s0:
1595 : a6 2d __ LDX P0 
1597 : 20 c6 ff JSR $ffc6 
159a : a9 00 __ LDA #$00
159c : 85 3c __ STA ACCU + 1 
159e : b0 02 __ BCS $15a2 ; (krnio_chkin.s0 + 13)
15a0 : a9 01 __ LDA #$01
15a2 : 85 3b __ STA ACCU + 0 
.s1001:
15a4 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
15a5 : 20 cf ff JSR $ffcf 
15a8 : 85 3b __ STA ACCU + 0 
15aa : a9 00 __ LDA #$00
15ac : 85 3c __ STA ACCU + 1 
.s1001:
15ae : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
15af : 20 b7 ff JSR $ffb7 
15b2 : 85 3b __ STA ACCU + 0 
15b4 : a9 00 __ LDA #$00
15b6 : 85 3c __ STA ACCU + 1 
.s1001:
15b8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
15b9 : 20 cc ff JSR $ffcc 
.s1001:
15bc : 60 __ __ RTS
--------------------------------------------------------------------
15bd : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
15cd : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
15db : 20 09 16 JSR $1609 ; (getchx.s0 + 0)
15de : a5 3c __ LDA ACCU + 1 
15e0 : d0 22 __ BNE $1604 ; (Control.s1006 + 0)
.s1005:
15e2 : a5 3b __ LDA ACCU + 0 
15e4 : c9 20 __ CMP #$20
15e6 : d0 1c __ BNE $1604 ; (Control.s1006 + 0)
.s1:
15e8 : a5 2e __ LDA P1 ; (playing + 0)
15ea : d0 0a __ BNE $15f6 ; (Control.s4 + 0)
.s5:
15ec : a9 01 __ LDA #$01
15ee : 20 c2 16 JSR $16c2 ; (zsm_irq_play.s0 + 0)
15f1 : a9 01 __ LDA #$01
.s1001:
15f3 : 85 3b __ STA ACCU + 0 
15f5 : 60 __ __ RTS
.s4:
15f6 : a9 00 __ LDA #$00
15f8 : cd ee 17 CMP $17ee ; (paused + 0)
15fb : 2a __ __ ROL
15fc : 85 2d __ STA P0 
15fe : 8d ee 17 STA $17ee ; (paused + 0)
1601 : 20 44 16 JSR $1644 ; (zsm_pause.s0 + 0)
.s1006:
1604 : a5 2e __ LDA P1 ; (playing + 0)
1606 : 4c f3 15 JMP $15f3 ; (Control.s1001 + 0)
--------------------------------------------------------------------
getchx:
.s0:
1609 : 20 13 16 JSR $1613 ; (getpch + 0)
160c : 85 3b __ STA ACCU + 0 
160e : a9 00 __ LDA #$00
1610 : 85 3c __ STA ACCU + 1 
.s1001:
1612 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1613 : 20 e4 ff JSR $ffe4 
1616 : ae ed 17 LDX $17ed ; (giocharmap + 0)
1619 : e0 01 __ CPX #$01
161b : 90 26 __ BCC $1643 ; (getpch + 48)
161d : c9 0d __ CMP #$0d
161f : d0 02 __ BNE $1623 ; (getpch + 16)
1621 : a9 0a __ LDA #$0a
1623 : e0 02 __ CPX #$02
1625 : 90 1c __ BCC $1643 ; (getpch + 48)
1627 : c9 db __ CMP #$db
1629 : b0 18 __ BCS $1643 ; (getpch + 48)
162b : c9 41 __ CMP #$41
162d : 90 14 __ BCC $1643 ; (getpch + 48)
162f : c9 c1 __ CMP #$c1
1631 : 90 02 __ BCC $1635 ; (getpch + 34)
1633 : 49 a0 __ EOR #$a0
1635 : c9 7b __ CMP #$7b
1637 : b0 0a __ BCS $1643 ; (getpch + 48)
1639 : c9 61 __ CMP #$61
163b : b0 04 __ BCS $1641 ; (getpch + 46)
163d : c9 5b __ CMP #$5b
163f : b0 02 __ BCS $1643 ; (getpch + 48)
1641 : 49 20 __ EOR #$20
1643 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
17ed : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
paused:
17ee : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1644 : a5 2d __ LDA P0 ; (pause + 0)
1646 : d0 0e __ BNE $1656 ; (zsm_pause.s4 + 0)
.s8:
1648 : ad a2 17 LDA $17a2 ; (zsm_paused + 0)
164b : f0 08 __ BEQ $1655 ; (zsm_pause.s1001 + 0)
.s5:
164d : 20 95 16 JSR $1695 ; (zsm_restore_volume.s0 + 0)
1650 : a9 00 __ LDA #$00
1652 : 8d a2 17 STA $17a2 ; (zsm_paused + 0)
.s1001:
1655 : 60 __ __ RTS
.s4:
1656 : ad a2 17 LDA $17a2 ; (zsm_paused + 0)
1659 : d0 fa __ BNE $1655 ; (zsm_pause.s1001 + 0)
.s1:
165b : a9 01 __ LDA #$01
165d : 8d a2 17 STA $17a2 ; (zsm_paused + 0)
1660 : 4c 63 16 JMP $1663 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1663 : a0 00 __ LDY #$00
1665 : 84 3c __ STY ACCU + 1 
1667 : a2 02 __ LDX #$02
1669 : 18 __ __ CLC
.l1006:
166a : 8a __ __ TXA
166b : 09 c0 __ ORA #$c0
166d : 8d 20 9f STA $9f20 
1670 : a5 3c __ LDA ACCU + 1 
1672 : 09 f9 __ ORA #$f9
1674 : 8d 21 9f STA $9f21 
1677 : a9 01 __ LDA #$01
1679 : 8d 22 9f STA $9f22 
167c : ad 23 9f LDA $9f23 
167f : 99 f0 2c STA $2cf0,y ; (vera_volumes + 0)
1682 : a9 00 __ LDA #$00
1684 : 8d 23 9f STA $9f23 
1687 : 8a __ __ TXA
1688 : 69 04 __ ADC #$04
168a : aa __ __ TAX
168b : 90 02 __ BCC $168f ; (zsm_save_volume.s1009 + 0)
.s1008:
168d : e6 3c __ INC ACCU + 1 
.s1009:
168f : c8 __ __ INY
1690 : c0 10 __ CPY #$10
1692 : 90 d6 __ BCC $166a ; (zsm_save_volume.l1006 + 0)
.s1001:
1694 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
2cf0 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1695 : a0 00 __ LDY #$00
1697 : 84 3c __ STY ACCU + 1 
1699 : a2 02 __ LDX #$02
169b : 18 __ __ CLC
.l1006:
169c : 8a __ __ TXA
169d : 09 c0 __ ORA #$c0
169f : 8d 20 9f STA $9f20 
16a2 : a5 3c __ LDA ACCU + 1 
16a4 : 09 f9 __ ORA #$f9
16a6 : 8d 21 9f STA $9f21 
16a9 : a9 01 __ LDA #$01
16ab : 8d 22 9f STA $9f22 
16ae : b9 f0 2c LDA $2cf0,y ; (vera_volumes + 0)
16b1 : 8d 23 9f STA $9f23 
16b4 : 8a __ __ TXA
16b5 : 69 04 __ ADC #$04
16b7 : aa __ __ TAX
16b8 : 90 02 __ BCC $16bc ; (zsm_restore_volume.s1009 + 0)
.s1008:
16ba : e6 3c __ INC ACCU + 1 
.s1009:
16bc : c8 __ __ INY
16bd : c0 10 __ CPY #$10
16bf : 90 db __ BCC $169c ; (zsm_restore_volume.l1006 + 0)
.s1001:
16c1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
16c2 : 8d a0 17 STA $17a0 ; (zsm_playing + 0)
.s1001:
16c5 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
17ef : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
17f8 : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
2d00 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
2d10 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
2d20 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
2d30 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
16c6 : ad 26 9f LDA $9f26 
16c9 : 29 40 __ AND #$40
16cb : d0 f9 __ BNE $16c6 ; (frame_wait.l1 + 0)
.l4:
16cd : ad 26 9f LDA $9f26 
16d0 : 29 40 __ AND #$40
16d2 : f0 f9 __ BEQ $16cd ; (frame_wait.l4 + 0)
.s1001:
16d4 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
16d5 : 38 __ __ SEC
16d6 : a9 00 __ LDA #$00
16d8 : e5 3b __ SBC ACCU + 0 
16da : 85 3b __ STA ACCU + 0 
16dc : a9 00 __ LDA #$00
16de : e5 3c __ SBC ACCU + 1 
16e0 : 85 3c __ STA ACCU + 1 
16e2 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
16e3 : 38 __ __ SEC
16e4 : a9 00 __ LDA #$00
16e6 : e5 23 __ SBC WORK + 0 
16e8 : 85 23 __ STA WORK + 0 
16ea : a9 00 __ LDA #$00
16ec : e5 24 __ SBC WORK + 1 
16ee : 85 24 __ STA WORK + 1 
16f0 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
16f1 : a5 3c __ LDA ACCU + 1 
16f3 : d0 31 __ BNE $1726 ; (divmod + 53)
16f5 : a5 24 __ LDA WORK + 1 
16f7 : d0 1e __ BNE $1717 ; (divmod + 38)
16f9 : 85 26 __ STA WORK + 3 
16fb : a2 04 __ LDX #$04
16fd : 06 3b __ ASL ACCU + 0 
16ff : 2a __ __ ROL
1700 : c5 23 __ CMP WORK + 0 
1702 : 90 02 __ BCC $1706 ; (divmod + 21)
1704 : e5 23 __ SBC WORK + 0 
1706 : 26 3b __ ROL ACCU + 0 
1708 : 2a __ __ ROL
1709 : c5 23 __ CMP WORK + 0 
170b : 90 02 __ BCC $170f ; (divmod + 30)
170d : e5 23 __ SBC WORK + 0 
170f : 26 3b __ ROL ACCU + 0 
1711 : ca __ __ DEX
1712 : d0 eb __ BNE $16ff ; (divmod + 14)
1714 : 85 25 __ STA WORK + 2 
1716 : 60 __ __ RTS
1717 : a5 3b __ LDA ACCU + 0 
1719 : 85 25 __ STA WORK + 2 
171b : a5 3c __ LDA ACCU + 1 
171d : 85 26 __ STA WORK + 3 
171f : a9 00 __ LDA #$00
1721 : 85 3b __ STA ACCU + 0 
1723 : 85 3c __ STA ACCU + 1 
1725 : 60 __ __ RTS
1726 : a5 24 __ LDA WORK + 1 
1728 : d0 1f __ BNE $1749 ; (divmod + 88)
172a : a5 23 __ LDA WORK + 0 
172c : 30 1b __ BMI $1749 ; (divmod + 88)
172e : a9 00 __ LDA #$00
1730 : 85 26 __ STA WORK + 3 
1732 : a2 10 __ LDX #$10
1734 : 06 3b __ ASL ACCU + 0 
1736 : 26 3c __ ROL ACCU + 1 
1738 : 2a __ __ ROL
1739 : c5 23 __ CMP WORK + 0 
173b : 90 02 __ BCC $173f ; (divmod + 78)
173d : e5 23 __ SBC WORK + 0 
173f : 26 3b __ ROL ACCU + 0 
1741 : 26 3c __ ROL ACCU + 1 
1743 : ca __ __ DEX
1744 : d0 f2 __ BNE $1738 ; (divmod + 71)
1746 : 85 25 __ STA WORK + 2 
1748 : 60 __ __ RTS
1749 : a9 00 __ LDA #$00
174b : 85 25 __ STA WORK + 2 
174d : 85 26 __ STA WORK + 3 
174f : 84 22 __ STY $22 
1751 : a0 10 __ LDY #$10
1753 : 18 __ __ CLC
1754 : 26 3b __ ROL ACCU + 0 
1756 : 26 3c __ ROL ACCU + 1 
1758 : 26 25 __ ROL WORK + 2 
175a : 26 26 __ ROL WORK + 3 
175c : 38 __ __ SEC
175d : a5 25 __ LDA WORK + 2 
175f : e5 23 __ SBC WORK + 0 
1761 : aa __ __ TAX
1762 : a5 26 __ LDA WORK + 3 
1764 : e5 24 __ SBC WORK + 1 
1766 : 90 04 __ BCC $176c ; (divmod + 123)
1768 : 86 25 __ STX WORK + 2 
176a : 85 26 __ STA WORK + 3 
176c : 88 __ __ DEY
176d : d0 e5 __ BNE $1754 ; (divmod + 99)
176f : 26 3b __ ROL ACCU + 0 
1771 : 26 3c __ ROL ACCU + 1 
1773 : a4 22 __ LDY $22 
1775 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1776 : 24 3c __ BIT ACCU + 1 
1778 : 10 0d __ BPL $1787 ; (mods16 + 17)
177a : 20 d5 16 JSR $16d5 ; (negaccu + 0)
177d : 24 24 __ BIT WORK + 1 
177f : 10 0d __ BPL $178e ; (mods16 + 24)
1781 : 20 e3 16 JSR $16e3 ; (negtmp + 0)
1784 : 4c f1 16 JMP $16f1 ; (divmod + 0)
1787 : 24 24 __ BIT WORK + 1 
1789 : 10 f9 __ BPL $1784 ; (mods16 + 14)
178b : 20 e3 16 JSR $16e3 ; (negtmp + 0)
178e : 20 f1 16 JSR $16f1 ; (divmod + 0)
1791 : 38 __ __ SEC
1792 : a9 00 __ LDA #$00
1794 : e5 25 __ SBC WORK + 2 
1796 : 85 25 __ STA WORK + 2 
1798 : a9 00 __ LDA #$00
179a : e5 26 __ SBC WORK + 3 
179c : 85 26 __ STA WORK + 3 
179e : 60 __ __ RTS
