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
080e : 8e 62 19 STX $1962 ; (spentry + 0)
0811 : a9 db __ LDA #$db
0813 : 85 39 __ STA IP + 0 
0815 : a9 36 __ LDA #$36
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 3b __ LDA #$3b
081c : e9 36 __ SBC #$36
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
0830 : a9 10 __ LDA #$10
0832 : e9 db __ SBC #$db
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
1962 : __ __ __ BYT 00                                              : .
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
08bb : ee f4 19 INC $19f4 ; (p + 0)
08be : d0 03 __ BNE $08c3 ; (main.s1012 + 0)
.s1011:
08c0 : ee f5 19 INC $19f5 ; (p + 1)
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
08e2 : 8d f6 19 STA $19f6 ; (PalTimer + 0)
08e5 : 8d f7 19 STA $19f7 ; (PalTimer + 1)
08e8 : a9 20 __ LDA #$20
08ea : 85 35 __ STA P8 
08ec : a9 36 __ LDA #$36
08ee : 85 36 __ STA P9 
08f0 : 20 35 15 JSR $1535 ; (SetPaletteColours.s0 + 0)
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
091e : a9 68 __ LDA #$68
0920 : 85 32 __ STA P5 
0922 : a9 19 __ LDA #$19
0924 : 85 33 __ STA P6 
0926 : 20 5c 15 JSR $155c ; (SetPaletteIndex.s0 + 0)
0929 : a9 00 __ LDA #$00
092b : 85 52 __ STA T2 + 0 
.s39:
092d : ad f7 19 LDA $19f7 ; (PalTimer + 1)
0930 : 30 40 __ BMI $0972 ; (main.s40 + 0)
.s1009:
0932 : d0 07 __ BNE $093b ; (main.s10 + 0)
.s1008:
0934 : a9 03 __ LDA #$03
0936 : cd f6 19 CMP $19f6 ; (PalTimer + 0)
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
0957 : ee f8 19 INC $19f8 ; (PalIndex + 0)
095a : d0 03 __ BNE $095f ; (main.s1016 + 0)
.s1015:
095c : ee f9 19 INC $19f9 ; (PalIndex + 1)
.s1016:
095f : a9 40 __ LDA #$40
0961 : 85 32 __ STA P5 
0963 : a9 36 __ LDA #$36
0965 : 85 33 __ STA P6 
0967 : 20 5c 15 JSR $155c ; (SetPaletteIndex.s0 + 0)
096a : a9 00 __ LDA #$00
096c : 8d f6 19 STA $19f6 ; (PalTimer + 0)
096f : 8d f7 19 STA $19f7 ; (PalTimer + 1)
.s40:
0972 : ad f5 19 LDA $19f5 ; (p + 1)
0975 : d0 42 __ BNE $09b9 ; (main.s42 + 0)
.s1007:
0977 : ad f4 19 LDA $19f4 ; (p + 0)
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
0996 : cd fa 19 CMP $19fa ; (ShimmerState + 0)
0999 : 2a __ __ ROL
099a : 8d fa 19 STA $19fa ; (ShimmerState + 0)
099d : d0 07 __ BNE $09a6 ; (main.s16 + 0)
.s17:
099f : a9 36 __ LDA #$36
09a1 : a0 80 __ LDY #$80
09a3 : 4c aa 09 JMP $09aa ; (main.s51 + 0)
.s16:
09a6 : a9 36 __ LDA #$36
09a8 : a0 60 __ LDY #$60
.s51:
09aa : 84 35 __ STY P8 
09ac : 85 36 __ STA P9 
09ae : 20 35 15 JSR $1535 ; (SetPaletteColours.s0 + 0)
09b1 : a9 00 __ LDA #$00
09b3 : 8d f4 19 STA $19f4 ; (p + 0)
09b6 : 8d f5 19 STA $19f5 ; (p + 1)
.s42:
09b9 : a9 03 __ LDA #$03
09bb : 8d 2c 9f STA $9f2c 
09be : 20 0f 16 JSR $160f ; (zsm_check.s0 + 0)
09c1 : 09 00 __ ORA #$00
09c3 : f0 0b __ BEQ $09d0 ; (main.s21 + 0)
.s19:
09c5 : a9 80 __ LDA #$80
09c7 : 85 30 __ STA P3 
09c9 : a9 17 __ LDA #$17
09cb : 85 31 __ STA P4 
09cd : 20 13 16 JSR $1613 ; (zsm_init.s0 + 0)
.s21:
09d0 : a5 51 __ LDA T1 + 0 
09d2 : 85 2e __ STA P1 
09d4 : 20 9e 17 JSR $179e ; (Control.s0 + 0)
09d7 : a5 3b __ LDA ACCU + 0 
09d9 : 85 51 __ STA T1 + 0 
09db : ad fe 19 LDA $19fe ; (FrameCount + 0)
09de : 85 47 __ STA T3 + 0 
09e0 : 85 3b __ STA ACCU + 0 
09e2 : ad ff 19 LDA $19ff ; (FrameCount + 1)
09e5 : 85 3c __ STA ACCU + 1 
09e7 : a9 04 __ LDA #$04
09e9 : 85 23 __ STA WORK + 0 
09eb : a9 00 __ LDA #$00
09ed : 85 24 __ STA WORK + 1 
09ef : 20 39 19 JSR $1939 ; (mods16 + 0)
09f2 : a5 26 __ LDA WORK + 3 
09f4 : d0 16 __ BNE $0a0c ; (main.s24 + 0)
.s1003:
09f6 : a5 25 __ LDA WORK + 2 
09f8 : c9 01 __ CMP #$01
09fa : d0 10 __ BNE $0a0c ; (main.s24 + 0)
.s22:
09fc : ac f2 3a LDY $3af2 ; (off1 + 0)
09ff : c0 2b __ CPY #$2b
0a01 : b0 06 __ BCS $0a09 ; (main.s50 + 0)
.s25:
0a03 : b9 a0 36 LDA $36a0,y ; (TestText2 + 0)
0a06 : 8d 23 9f STA $9f23 
.s50:
0a09 : ee f2 3a INC $3af2 ; (off1 + 0)
.s24:
0a0c : 06 47 __ ASL T3 + 0 
0a0e : ad ff 19 LDA $19ff ; (FrameCount + 1)
0a11 : 2a __ __ ROL
0a12 : 18 __ __ CLC
0a13 : 69 ff __ ADC #$ff
0a15 : 8d 38 9f STA $9f38 
0a18 : a5 47 __ LDA T3 + 0 
0a1a : 8d 37 9f STA $9f37 
0a1d : a9 01 __ LDA #$01
0a1f : 8d 2c 9f STA $9f2c 
0a22 : 20 b2 16 JSR $16b2 ; (zsm_fill.s0 + 0)
0a25 : a9 00 __ LDA #$00
0a27 : 8d 2c 9f STA $9f2c 
0a2a : 20 89 18 JSR $1889 ; (frame_wait.l1 + 0)
0a2d : ee fe 19 INC $19fe ; (FrameCount + 0)
0a30 : f0 03 __ BEQ $0a35 ; (main.s1017 + 0)
0a32 : 4c bb 08 JMP $08bb ; (main.l2 + 0)
.s1017:
0a35 : ee ff 19 INC $19ff ; (FrameCount + 1)
0a38 : 4c bb 08 JMP $08bb ; (main.l2 + 0)
.s4:
0a3b : ee f6 19 INC $19f6 ; (PalTimer + 0)
0a3e : f0 03 __ BEQ $0a43 ; (main.s1013 + 0)
0a40 : 4c f3 08 JMP $08f3 ; (main.s6 + 0)
.s1013:
0a43 : ee f7 19 INC $19f7 ; (PalTimer + 1)
0a46 : 4c f3 08 JMP $08f3 ; (main.s6 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0a49 : 78 __ __ SEI
0a4a : ad 14 03 LDA $0314 
0a4d : 8d db 36 STA $36db ; (oirq + 0)
0a50 : ad 15 03 LDA $0315 
0a53 : 8d dc 36 STA $36dc ; (oirq + 1)
0a56 : a9 62 __ LDA #$62
0a58 : 8d 14 03 STA $0314 
0a5b : a9 0a __ LDA #$0a
0a5d : 8d 15 03 STA $0315 
0a60 : 58 __ __ CLI
.s1001:
0a61 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
36db : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0a62 : 20 68 0a JSR $0a68 ; (irq.s1000 + 0)
0a65 : 6c db 36 JMP ($36db)
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
0a92 : ad 63 19 LDA $1963 ; (zsm_playing + 0)
0a95 : f0 08 __ BEQ $0a9f ; (irq.s1001 + 0)
.s4:
0a97 : ad 64 19 LDA $1964 ; (zsm_finished + 0)
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
1963 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1964 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0aca : ad 65 19 LDA $1965 ; (zsm_paused + 0)
0acd : f0 01 __ BEQ $0ad0 ; (zsm_play.s2 + 0)
0acf : 60 __ __ RTS
.s2:
0ad0 : ad dd 36 LDA $36dd ; (zsm_delay + 0)
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
0af4 : ad de 3a LDA $3ade ; (zsm_pos + 0)
0af7 : 85 4b __ STA T3 + 0 
0af9 : 18 __ __ CLC
0afa : 69 01 __ ADC #$01
0afc : 85 4d __ STA T4 + 0 
0afe : 8d de 3a STA $3ade ; (zsm_pos + 0)
0b01 : ad df 3a LDA $3adf ; (zsm_pos + 1)
0b04 : aa __ __ TAX
0b05 : 69 00 __ ADC #$00
0b07 : 85 4e __ STA T4 + 1 
0b09 : 8d df 3a STA $3adf ; (zsm_pos + 1)
0b0c : 18 __ __ CLC
0b0d : a9 de __ LDA #$de
0b0f : 65 4b __ ADC T3 + 0 
0b11 : 85 3b __ STA ACCU + 0 
0b13 : 8a __ __ TXA
0b14 : 29 03 __ AND #$03
0b16 : 69 36 __ ADC #$36
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
0b28 : a9 de __ LDA #$de
0b2a : 65 4d __ ADC T4 + 0 
0b2c : 85 4b __ STA T3 + 0 
0b2e : a5 4e __ LDA T4 + 1 
0b30 : 29 03 __ AND #$03
0b32 : 69 36 __ ADC #$36
0b34 : 85 4c __ STA T3 + 1 
0b36 : b1 4b __ LDA (T3 + 0),y 
0b38 : 29 3f __ AND #$3f
0b3a : 18 __ __ CLC
0b3b : 65 4d __ ADC T4 + 0 
0b3d : 8d de 3a STA $3ade ; (zsm_pos + 0)
0b40 : 98 __ __ TYA
0b41 : 65 4e __ ADC T4 + 1 
0b43 : 8d df 3a STA $3adf ; (zsm_pos + 1)
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
0b56 : a9 de __ LDA #$de
0b58 : 6d de 3a ADC $3ade ; (zsm_pos + 0)
0b5b : 85 4d __ STA T4 + 0 
0b5d : ad df 3a LDA $3adf ; (zsm_pos + 1)
0b60 : 29 03 __ AND #$03
0b62 : 69 36 __ ADC #$36
0b64 : 85 4e __ STA T4 + 1 
0b66 : a0 00 __ LDY #$00
0b68 : b1 4d __ LDA (T4 + 0),y 
0b6a : 85 2d __ STA P0 
0b6c : ad de 3a LDA $3ade ; (zsm_pos + 0)
0b6f : 18 __ __ CLC
0b70 : 69 01 __ ADC #$01
0b72 : aa __ __ TAX
0b73 : ad df 3a LDA $3adf ; (zsm_pos + 1)
0b76 : 69 00 __ ADC #$00
0b78 : 29 03 __ AND #$03
0b7a : 85 4c __ STA T3 + 1 
0b7c : 8a __ __ TXA
0b7d : 18 __ __ CLC
0b7e : 69 de __ ADC #$de
0b80 : 85 4b __ STA T3 + 0 
0b82 : a9 36 __ LDA #$36
0b84 : 65 4c __ ADC T3 + 1 
0b86 : 85 4c __ STA T3 + 1 
0b88 : b1 4b __ LDA (T3 + 0),y 
0b8a : 85 2e __ STA P1 
0b8c : 20 09 0c JSR $0c09 ; (sfx_put.l1 + 0)
0b8f : ad de 3a LDA $3ade ; (zsm_pos + 0)
0b92 : 18 __ __ CLC
0b93 : 69 02 __ ADC #$02
0b95 : 8d de 3a STA $3ade ; (zsm_pos + 0)
0b98 : 90 03 __ BCC $0b9d ; (zsm_play.s1015 + 0)
.s1014:
0b9a : ee df 3a INC $3adf ; (zsm_pos + 1)
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
0bae : 8d 64 19 STA $1964 ; (zsm_finished + 0)
0bb1 : d0 08 __ BNE $0bbb ; (zsm_play.s10 + 0)
.s25:
0bb3 : 29 7f __ AND #$7f
0bb5 : 38 __ __ SEC
0bb6 : e9 01 __ SBC #$01
0bb8 : 8d dd 36 STA $36dd ; (zsm_delay + 0)
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
0be5 : 8d de 3a STA $3ade ; (zsm_pos + 0)
0be8 : 90 01 __ BCC $0beb ; (zsm_play.s1017 + 0)
.s1016:
0bea : e8 __ __ INX
.s1017:
0beb : 8e df 3a STX $3adf ; (zsm_pos + 1)
0bee : 18 __ __ CLC
0bef : a9 de __ LDA #$de
0bf1 : 65 4d __ ADC T4 + 0 
0bf3 : 85 4b __ STA T3 + 0 
0bf5 : a5 4e __ LDA T4 + 1 
0bf7 : 29 03 __ AND #$03
0bf9 : 69 36 __ ADC #$36
0bfb : 85 4c __ STA T3 + 1 
0bfd : b1 4b __ LDA (T3 + 0),y 
0bff : 8d 23 9f STA $9f23 
0c02 : 4c f4 0a JMP $0af4 ; (zsm_play.l8 + 0)
.s4:
0c05 : ce dd 36 DEC $36dd ; (zsm_delay + 0)
0c08 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1965 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
36dd : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
36de : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
3ade : __ __ __ BSS	2
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
0c89 : 20 90 13 JSR $1390 ; (tileBaseConfig.s0 + 0)
0c8c : 8d 2f 9f STA $9f2f 
0c8f : a9 20 __ LDA #$20
0c91 : 85 2f __ STA P2 
0c93 : 20 a9 13 JSR $13a9 ; (memoryToMapMemoryAddress.s0 + 0)
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
0cc6 : a9 1a __ LDA #$1a
0cc8 : 85 32 __ STA P5 
0cca : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
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
0ce4 : 20 f2 13 JSR $13f2 ; (rand.s0 + 0)
0ce7 : a5 3b __ LDA ACCU + 0 
0ce9 : 29 1f __ AND #$1f
0ceb : c9 1f __ CMP #$1f
0ced : a5 48 __ LDA T2 + 0 
0cef : 90 03 __ BCC $0cf4 ; (SetUpSprites.s1023 + 0)
0cf1 : 4c 5a 13 JMP $135a ; (SetUpSprites.s1017 + 0)
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
0d3f : a5 47 __ LDA T1 + 0 
0d41 : d0 9d __ BNE $0ce0 ; (SetUpSprites.l10 + 0)
.s12:
0d43 : 85 2d __ STA P0 
0d45 : 85 30 __ STA P3 
0d47 : 85 33 __ STA P6 
0d49 : a9 31 __ LDA #$31
0d4b : 85 2e __ STA P1 
0d4d : a9 01 __ LDA #$01
0d4f : 85 2f __ STA P2 
0d51 : a9 04 __ LDA #$04
0d53 : 85 34 __ STA P7 
0d55 : a9 00 __ LDA #$00
0d57 : 85 31 __ STA P4 
0d59 : a9 1b __ LDA #$1b
0d5b : 85 32 __ STA P5 
0d5d : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
0d60 : a9 00 __ LDA #$00
0d62 : 85 4e __ STA T5 + 0 
0d64 : 85 4f __ STA T5 + 1 
.l45:
0d66 : 85 2d __ STA P0 
0d68 : 18 __ __ CLC
0d69 : 69 02 __ ADC #$02
0d6b : 85 4c __ STA T4 + 0 
0d6d : a9 00 __ LDA #$00
0d6f : 2a __ __ ROL
0d70 : 85 4d __ STA T4 + 1 
0d72 : a9 88 __ LDA #$88
0d74 : 85 2e __ STA P1 
0d76 : a9 09 __ LDA #$09
0d78 : 85 2f __ STA P2 
0d7a : a9 00 __ LDA #$00
0d7c : 85 30 __ STA P3 
0d7e : a9 03 __ LDA #$03
0d80 : 85 31 __ STA P4 
0d82 : 85 33 __ STA P6 
0d84 : a9 02 __ LDA #$02
0d86 : 85 32 __ STA P5 
0d88 : a9 01 __ LDA #$01
0d8a : 85 34 __ STA P7 
0d8c : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0d8f : a5 4e __ LDA T5 + 0 
0d91 : 85 2e __ STA P1 
0d93 : a5 4f __ LDA T5 + 1 
0d95 : 85 2f __ STA P2 
0d97 : a9 90 __ LDA #$90
0d99 : 85 30 __ STA P3 
0d9b : a9 01 __ LDA #$01
0d9d : 85 31 __ STA P4 
0d9f : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0da2 : a9 00 __ LDA #$00
0da4 : 85 2e __ STA P1 
0da6 : a9 01 __ LDA #$01
0da8 : 85 2f __ STA P2 
0daa : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
0dad : a9 88 __ LDA #$88
0daf : 85 2e __ STA P1 
0db1 : a9 09 __ LDA #$09
0db3 : 85 2f __ STA P2 
0db5 : a9 00 __ LDA #$00
0db7 : 85 30 __ STA P3 
0db9 : a9 03 __ LDA #$03
0dbb : 85 31 __ STA P4 
0dbd : e6 2d __ INC P0 
0dbf : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0dc2 : a5 4e __ LDA T5 + 0 
0dc4 : 85 2e __ STA P1 
0dc6 : a5 4f __ LDA T5 + 1 
0dc8 : 85 2f __ STA P2 
0dca : a9 70 __ LDA #$70
0dcc : 85 30 __ STA P3 
0dce : a9 01 __ LDA #$01
0dd0 : 85 31 __ STA P4 
0dd2 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0dd5 : a5 4d __ LDA T4 + 1 
0dd7 : d0 16 __ BNE $0def ; (SetUpSprites.s47 + 0)
.s1013:
0dd9 : 18 __ __ CLC
0dda : a5 2e __ LDA P1 
0ddc : 69 40 __ ADC #$40
0dde : 85 4e __ STA T5 + 0 
0de0 : a5 2f __ LDA P2 
0de2 : 69 00 __ ADC #$00
0de4 : 85 4f __ STA T5 + 1 
0de6 : a5 4c __ LDA T4 + 0 
0de8 : c9 16 __ CMP #$16
0dea : b0 03 __ BCS $0def ; (SetUpSprites.s47 + 0)
0dec : 4c 66 0d JMP $0d66 ; (SetUpSprites.l45 + 0)
.s47:
0def : a9 00 __ LDA #$00
0df1 : 85 2d __ STA P0 
0df3 : 85 30 __ STA P3 
0df5 : 85 33 __ STA P6 
0df7 : a9 30 __ LDA #$30
0df9 : 85 2e __ STA P1 
0dfb : a9 01 __ LDA #$01
0dfd : 85 2f __ STA P2 
0dff : a9 00 __ LDA #$00
0e01 : 85 31 __ STA P4 
0e03 : a9 1f __ LDA #$1f
0e05 : 85 32 __ STA P5 
0e07 : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
0e0a : a9 16 __ LDA #$16
0e0c : 85 2d __ STA P0 
0e0e : a9 80 __ LDA #$80
0e10 : 85 2e __ STA P1 
0e12 : a9 09 __ LDA #$09
0e14 : 85 2f __ STA P2 
0e16 : a9 01 __ LDA #$01
0e18 : 85 31 __ STA P4 
0e1a : 85 34 __ STA P7 
0e1c : a9 02 __ LDA #$02
0e1e : 85 32 __ STA P5 
0e20 : a9 03 __ LDA #$03
0e22 : 85 33 __ STA P6 
0e24 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0e27 : a9 30 __ LDA #$30
0e29 : 85 2e __ STA P1 
0e2b : a9 01 __ LDA #$01
0e2d : 85 2f __ STA P2 
0e2f : a9 b8 __ LDA #$b8
0e31 : 85 30 __ STA P3 
0e33 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0e36 : a9 20 __ LDA #$20
0e38 : 85 2d __ STA P0 
0e3a : a9 35 __ LDA #$35
0e3c : 85 2e __ STA P1 
0e3e : a9 00 __ LDA #$00
0e40 : 85 30 __ STA P3 
0e42 : 85 33 __ STA P6 
0e44 : a9 02 __ LDA #$02
0e46 : 85 34 __ STA P7 
0e48 : a9 00 __ LDA #$00
0e4a : 85 31 __ STA P4 
0e4c : a9 20 __ LDA #$20
0e4e : 85 32 __ STA P5 
0e50 : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
0e53 : a9 17 __ LDA #$17
0e55 : 85 2d __ STA P0 
0e57 : a9 a9 __ LDA #$a9
0e59 : 85 2e __ STA P1 
0e5b : a9 09 __ LDA #$09
0e5d : 85 2f __ STA P2 
0e5f : a9 02 __ LDA #$02
0e61 : 85 31 __ STA P4 
0e63 : 85 32 __ STA P5 
0e65 : a9 03 __ LDA #$03
0e67 : 85 33 __ STA P6 
0e69 : a9 01 __ LDA #$01
0e6b : 85 34 __ STA P7 
0e6d : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0e70 : a9 fc __ LDA #$fc
0e72 : 85 2e __ STA P1 
0e74 : a9 00 __ LDA #$00
0e76 : 85 2f __ STA P2 
0e78 : a9 b8 __ LDA #$b8
0e7a : 85 30 __ STA P3 
0e7c : a9 01 __ LDA #$01
0e7e : 85 31 __ STA P4 
0e80 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0e83 : a9 18 __ LDA #$18
0e85 : 85 2d __ STA P0 
0e87 : a9 a9 __ LDA #$a9
0e89 : 85 2e __ STA P1 
0e8b : a9 09 __ LDA #$09
0e8d : 85 2f __ STA P2 
0e8f : a9 00 __ LDA #$00
0e91 : 85 30 __ STA P3 
0e93 : a9 02 __ LDA #$02
0e95 : 85 31 __ STA P4 
0e97 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0e9a : a9 4c __ LDA #$4c
0e9c : 85 2e __ STA P1 
0e9e : a9 01 __ LDA #$01
0ea0 : 85 2f __ STA P2 
0ea2 : 85 31 __ STA P4 
0ea4 : a9 b8 __ LDA #$b8
0ea6 : 85 30 __ STA P3 
0ea8 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0eab : a9 01 __ LDA #$01
0ead : 85 2e __ STA P1 
0eaf : a9 00 __ LDA #$00
0eb1 : 85 2f __ STA P2 
0eb3 : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
0eb6 : a9 10 __ LDA #$10
0eb8 : 85 2d __ STA P0 
0eba : a9 20 __ LDA #$20
0ebc : 85 30 __ STA P3 
0ebe : a9 00 __ LDA #$00
0ec0 : 85 31 __ STA P4 
0ec2 : a9 68 __ LDA #$68
0ec4 : 85 2e __ STA P1 
0ec6 : a9 19 __ LDA #$19
0ec8 : 85 2f __ STA P2 
0eca : 20 ec 14 JSR $14ec ; (vera_pal_putn.s0 + 0)
0ecd : a9 00 __ LDA #$00
0ecf : 85 2d __ STA P0 
0ed1 : 85 30 __ STA P3 
0ed3 : 85 34 __ STA P7 
0ed5 : a9 35 __ LDA #$35
0ed7 : 85 2e __ STA P1 
0ed9 : a9 01 __ LDA #$01
0edb : 85 2f __ STA P2 
0edd : a9 20 __ LDA #$20
0edf : 85 33 __ STA P6 
0ee1 : a9 88 __ LDA #$88
0ee3 : 85 31 __ STA P4 
0ee5 : a9 19 __ LDA #$19
0ee7 : 85 32 __ STA P5 
0ee9 : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
0eec : a9 00 __ LDA #$00
0eee : 85 47 __ STA T1 + 0 
0ef0 : 85 48 __ STA T2 + 0 
0ef2 : a9 03 __ LDA #$03
0ef4 : 85 33 __ STA P6 
0ef6 : a9 02 __ LDA #$02
0ef8 : 85 34 __ STA P7 
0efa : 18 __ __ CLC
.l1039:
0efb : a9 a8 __ LDA #$a8
0efd : 85 2e __ STA P1 
0eff : a9 09 __ LDA #$09
0f01 : 85 2f __ STA P2 
0f03 : a9 00 __ LDA #$00
0f05 : 85 30 __ STA P3 
0f07 : 85 31 __ STA P4 
0f09 : 85 32 __ STA P5 
0f0b : a5 47 __ LDA T1 + 0 
0f0d : 69 19 __ ADC #$19
0f0f : 85 2d __ STA P0 
0f11 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0f14 : a9 b8 __ LDA #$b8
0f16 : 85 30 __ STA P3 
0f18 : a9 01 __ LDA #$01
0f1a : 85 31 __ STA P4 
0f1c : 38 __ __ SEC
0f1d : a5 48 __ LDA T2 + 0 
0f1f : e9 fc __ SBC #$fc
0f21 : 85 2e __ STA P1 
0f23 : a9 00 __ LDA #$00
0f25 : e9 03 __ SBC #$03
0f27 : 85 2f __ STA P2 
0f29 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0f2c : 18 __ __ CLC
0f2d : a5 48 __ LDA T2 + 0 
0f2f : 69 0c __ ADC #$0c
0f31 : 85 48 __ STA T2 + 0 
0f33 : e6 47 __ INC T1 + 0 
0f35 : a5 47 __ LDA T1 + 0 
0f37 : c9 08 __ CMP #$08
0f39 : 90 c0 __ BCC $0efb ; (SetUpSprites.l1039 + 0)
.s51:
0f3b : a9 00 __ LDA #$00
0f3d : 85 47 __ STA T1 + 0 
0f3f : 85 48 __ STA T2 + 0 
0f41 : a9 03 __ LDA #$03
0f43 : 85 33 __ STA P6 
0f45 : 85 34 __ STA P7 
0f47 : 18 __ __ CLC
.l1041:
0f48 : a9 a8 __ LDA #$a8
0f4a : 85 2e __ STA P1 
0f4c : a9 09 __ LDA #$09
0f4e : 85 2f __ STA P2 
0f50 : a9 00 __ LDA #$00
0f52 : 85 30 __ STA P3 
0f54 : 85 31 __ STA P4 
0f56 : a5 47 __ LDA T1 + 0 
0f58 : 69 21 __ ADC #$21
0f5a : 85 2d __ STA P0 
0f5c : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0f5f : a9 c4 __ LDA #$c4
0f61 : 85 30 __ STA P3 
0f63 : a9 01 __ LDA #$01
0f65 : 85 31 __ STA P4 
0f67 : 38 __ __ SEC
0f68 : a5 48 __ LDA T2 + 0 
0f6a : e9 fc __ SBC #$fc
0f6c : 85 2e __ STA P1 
0f6e : a9 00 __ LDA #$00
0f70 : e9 03 __ SBC #$03
0f72 : 85 2f __ STA P2 
0f74 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0f77 : 18 __ __ CLC
0f78 : a5 48 __ LDA T2 + 0 
0f7a : 69 0c __ ADC #$0c
0f7c : 85 48 __ STA T2 + 0 
0f7e : e6 47 __ INC T1 + 0 
0f80 : a5 47 __ LDA T1 + 0 
0f82 : c9 08 __ CMP #$08
0f84 : 90 c2 __ BCC $0f48 ; (SetUpSprites.l1041 + 0)
.s55:
0f86 : a9 00 __ LDA #$00
0f88 : 85 47 __ STA T1 + 0 
0f8a : 85 48 __ STA T2 + 0 
0f8c : a9 03 __ LDA #$03
0f8e : 85 33 __ STA P6 
0f90 : a9 04 __ LDA #$04
0f92 : 85 34 __ STA P7 
0f94 : 18 __ __ CLC
.l1043:
0f95 : a9 a8 __ LDA #$a8
0f97 : 85 2e __ STA P1 
0f99 : a9 09 __ LDA #$09
0f9b : 85 2f __ STA P2 
0f9d : a9 00 __ LDA #$00
0f9f : 85 30 __ STA P3 
0fa1 : 85 31 __ STA P4 
0fa3 : a5 47 __ LDA T1 + 0 
0fa5 : 69 29 __ ADC #$29
0fa7 : 85 2d __ STA P0 
0fa9 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
0fac : a9 b8 __ LDA #$b8
0fae : 85 30 __ STA P3 
0fb0 : a9 01 __ LDA #$01
0fb2 : 85 31 __ STA P4 
0fb4 : 38 __ __ SEC
0fb5 : a9 6c __ LDA #$6c
0fb7 : e5 48 __ SBC T2 + 0 
0fb9 : 85 2e __ STA P1 
0fbb : a9 02 __ LDA #$02
0fbd : e9 04 __ SBC #$04
0fbf : 85 2f __ STA P2 
0fc1 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
0fc4 : 18 __ __ CLC
0fc5 : a5 48 __ LDA T2 + 0 
0fc7 : 69 0c __ ADC #$0c
0fc9 : 85 48 __ STA T2 + 0 
0fcb : e6 47 __ INC T1 + 0 
0fcd : a5 47 __ LDA T1 + 0 
0fcf : c9 08 __ CMP #$08
0fd1 : 90 c2 __ BCC $0f95 ; (SetUpSprites.l1043 + 0)
.s59:
0fd3 : a9 00 __ LDA #$00
0fd5 : 85 47 __ STA T1 + 0 
.l61:
0fd7 : 38 __ __ SEC
0fd8 : a9 00 __ LDA #$00
0fda : e5 47 __ SBC T1 + 0 
0fdc : 29 0c __ AND #$0c
0fde : 49 ff __ EOR #$ff
0fe0 : 38 __ __ SEC
0fe1 : 69 6c __ ADC #$6c
0fe3 : 85 48 __ STA T2 + 0 
0fe5 : a9 02 __ LDA #$02
0fe7 : e9 00 __ SBC #$00
0fe9 : 85 49 __ STA T2 + 1 
0feb : 18 __ __ CLC
0fec : a5 47 __ LDA T1 + 0 
0fee : 69 31 __ ADC #$31
0ff0 : 85 2d __ STA P0 
0ff2 : a9 02 __ LDA #$02
0ff4 : 85 50 __ STA T7 + 0 
0ff6 : a9 03 __ LDA #$03
0ff8 : 85 33 __ STA P6 
0ffa : a9 04 __ LDA #$04
0ffc : 85 34 __ STA P7 
.l1033:
0ffe : a9 a8 __ LDA #$a8
1000 : 85 2e __ STA P1 
1002 : a9 09 __ LDA #$09
1004 : 85 2f __ STA P2 
1006 : a9 00 __ LDA #$00
1008 : 85 30 __ STA P3 
100a : 85 31 __ STA P4 
100c : 85 32 __ STA P5 
100e : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
1011 : a5 48 __ LDA T2 + 0 
1013 : 85 2e __ STA P1 
1015 : a5 49 __ LDA T2 + 1 
1017 : 85 2f __ STA P2 
1019 : a9 b8 __ LDA #$b8
101b : 85 30 __ STA P3 
101d : a9 01 __ LDA #$01
101f : 85 31 __ STA P4 
1021 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
1024 : c6 50 __ DEC T7 + 0 
1026 : d0 d6 __ BNE $0ffe ; (SetUpSprites.l1033 + 0)
.s62:
1028 : e6 47 __ INC T1 + 0 
102a : a5 47 __ LDA T1 + 0 
102c : c9 02 __ CMP #$02
102e : 90 a7 __ BCC $0fd7 ; (SetUpSprites.l61 + 0)
.s63:
1030 : a9 20 __ LDA #$20
1032 : 85 2d __ STA P0 
1034 : a9 3f __ LDA #$3f
1036 : 85 2e __ STA P1 
1038 : a9 01 __ LDA #$01
103a : 85 2f __ STA P2 
103c : a9 00 __ LDA #$00
103e : 85 30 __ STA P3 
1040 : 85 33 __ STA P6 
1042 : a9 00 __ LDA #$00
1044 : 85 31 __ STA P4 
1046 : a9 22 __ LDA #$22
1048 : 85 32 __ STA P5 
104a : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
104d : a9 33 __ LDA #$33
104f : 85 2d __ STA P0 
1051 : a9 f9 __ LDA #$f9
1053 : 85 2e __ STA P1 
1055 : a9 09 __ LDA #$09
1057 : 85 2f __ STA P2 
1059 : a9 03 __ LDA #$03
105b : 85 31 __ STA P4 
105d : 85 33 __ STA P6 
105f : a9 02 __ LDA #$02
1061 : 85 32 __ STA P5 
1063 : a9 05 __ LDA #$05
1065 : 85 34 __ STA P7 
1067 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
106a : a9 1c __ LDA #$1c
106c : 85 2e __ STA P1 
106e : a9 01 __ LDA #$01
1070 : 85 2f __ STA P2 
1072 : a9 78 __ LDA #$78
1074 : 85 30 __ STA P3 
1076 : a9 00 __ LDA #$00
1078 : 85 31 __ STA P4 
107a : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
107d : a9 20 __ LDA #$20
107f : 85 2d __ STA P0 
1081 : a9 37 __ LDA #$37
1083 : 85 2e __ STA P1 
1085 : a9 00 __ LDA #$00
1087 : 85 30 __ STA P3 
1089 : 85 33 __ STA P6 
108b : a9 08 __ LDA #$08
108d : 85 34 __ STA P7 
108f : a9 00 __ LDA #$00
1091 : 85 31 __ STA P4 
1093 : a9 26 __ LDA #$26
1095 : 85 32 __ STA P5 
1097 : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
109a : a9 00 __ LDA #$00
109c : 85 47 __ STA T1 + 0 
109e : 85 48 __ STA T2 + 0 
10a0 : 85 49 __ STA T2 + 1 
10a2 : a9 05 __ LDA #$05
10a4 : 85 34 __ STA P7 
10a6 : 18 __ __ CLC
.l1045:
10a7 : a9 b9 __ LDA #$b9
10a9 : 85 2e __ STA P1 
10ab : a9 09 __ LDA #$09
10ad : 85 2f __ STA P2 
10af : a9 00 __ LDA #$00
10b1 : 85 30 __ STA P3 
10b3 : a9 03 __ LDA #$03
10b5 : 85 31 __ STA P4 
10b7 : 85 32 __ STA P5 
10b9 : 85 33 __ STA P6 
10bb : a5 47 __ LDA T1 + 0 
10bd : 69 34 __ ADC #$34
10bf : 85 2d __ STA P0 
10c1 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
10c4 : a9 f4 __ LDA #$f4
10c6 : 85 2e __ STA P1 
10c8 : a9 00 __ LDA #$00
10ca : 85 2f __ STA P2 
10cc : 38 __ __ SEC
10cd : a5 48 __ LDA T2 + 0 
10cf : e9 20 __ SBC #$20
10d1 : 85 4a __ STA T3 + 0 
10d3 : 85 30 __ STA P3 
10d5 : a5 49 __ LDA T2 + 1 
10d7 : e9 00 __ SBC #$00
10d9 : 85 4b __ STA T3 + 1 
10db : 85 31 __ STA P4 
10dd : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
10e0 : a9 b9 __ LDA #$b9
10e2 : 85 2e __ STA P1 
10e4 : a9 09 __ LDA #$09
10e6 : 85 2f __ STA P2 
10e8 : a9 00 __ LDA #$00
10ea : 85 30 __ STA P3 
10ec : a9 03 __ LDA #$03
10ee : 85 31 __ STA P4 
10f0 : 18 __ __ CLC
10f1 : a5 47 __ LDA T1 + 0 
10f3 : 69 3b __ ADC #$3b
10f5 : 85 2d __ STA P0 
10f7 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
10fa : a9 40 __ LDA #$40
10fc : 85 2e __ STA P1 
10fe : a9 01 __ LDA #$01
1100 : 85 2f __ STA P2 
1102 : a5 4a __ LDA T3 + 0 
1104 : 85 30 __ STA P3 
1106 : a5 4b __ LDA T3 + 1 
1108 : 85 31 __ STA P4 
110a : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
110d : 18 __ __ CLC
110e : a5 48 __ LDA T2 + 0 
1110 : 69 40 __ ADC #$40
1112 : 85 48 __ STA T2 + 0 
1114 : 90 02 __ BCC $1118 ; (SetUpSprites.s1048 + 0)
.s1047:
1116 : e6 49 __ INC T2 + 1 
.s1048:
1118 : e6 47 __ INC T1 + 0 
111a : a5 47 __ LDA T1 + 0 
111c : c9 07 __ CMP #$07
111e : 90 87 __ BCC $10a7 ; (SetUpSprites.l1045 + 0)
.s71:
1120 : a9 20 __ LDA #$20
1122 : 85 2d __ STA P0 
1124 : a9 47 __ LDA #$47
1126 : 85 2e __ STA P1 
1128 : a9 00 __ LDA #$00
112a : 85 30 __ STA P3 
112c : 85 33 __ STA P6 
112e : a9 08 __ LDA #$08
1130 : 85 34 __ STA P7 
1132 : a9 00 __ LDA #$00
1134 : 85 31 __ STA P4 
1136 : a9 2e __ LDA #$2e
1138 : 85 32 __ STA P5 
113a : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
113d : a9 42 __ LDA #$42
113f : 85 2d __ STA P0 
1141 : a9 39 __ LDA #$39
1143 : 85 2e __ STA P1 
1145 : a9 0a __ LDA #$0a
1147 : 85 2f __ STA P2 
1149 : a9 03 __ LDA #$03
114b : 85 31 __ STA P4 
114d : 85 32 __ STA P5 
114f : a9 07 __ LDA #$07
1151 : 85 33 __ STA P6 
1153 : a9 06 __ LDA #$06
1155 : 85 34 __ STA P7 
1157 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
115a : a9 08 __ LDA #$08
115c : 85 2e __ STA P1 
115e : 85 30 __ STA P3 
1160 : a9 00 __ LDA #$00
1162 : 85 2f __ STA P2 
1164 : 85 31 __ STA P4 
1166 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
1169 : a9 43 __ LDA #$43
116b : 85 2d __ STA P0 
116d : a9 39 __ LDA #$39
116f : 85 2e __ STA P1 
1171 : a9 0a __ LDA #$0a
1173 : 85 2f __ STA P2 
1175 : a9 00 __ LDA #$00
1177 : 85 30 __ STA P3 
1179 : a9 03 __ LDA #$03
117b : 85 31 __ STA P4 
117d : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
1180 : a9 48 __ LDA #$48
1182 : 85 2e __ STA P1 
1184 : a9 00 __ LDA #$00
1186 : 85 2f __ STA P2 
1188 : 85 31 __ STA P4 
118a : a9 08 __ LDA #$08
118c : 85 30 __ STA P3 
118e : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
1191 : a9 01 __ LDA #$01
1193 : 85 2e __ STA P1 
1195 : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
1198 : a9 44 __ LDA #$44
119a : 85 2d __ STA P0 
119c : a9 39 __ LDA #$39
119e : 85 2e __ STA P1 
11a0 : a9 0a __ LDA #$0a
11a2 : 85 2f __ STA P2 
11a4 : a9 00 __ LDA #$00
11a6 : 85 30 __ STA P3 
11a8 : a9 03 __ LDA #$03
11aa : 85 31 __ STA P4 
11ac : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
11af : a9 48 __ LDA #$48
11b1 : 85 2e __ STA P1 
11b3 : 85 30 __ STA P3 
11b5 : a9 00 __ LDA #$00
11b7 : 85 2f __ STA P2 
11b9 : 85 31 __ STA P4 
11bb : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
11be : a9 01 __ LDA #$01
11c0 : 85 2e __ STA P1 
11c2 : 85 2f __ STA P2 
11c4 : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
11c7 : a9 45 __ LDA #$45
11c9 : 85 2d __ STA P0 
11cb : a9 39 __ LDA #$39
11cd : 85 2e __ STA P1 
11cf : a9 0a __ LDA #$0a
11d1 : 85 2f __ STA P2 
11d3 : a9 00 __ LDA #$00
11d5 : 85 30 __ STA P3 
11d7 : a9 03 __ LDA #$03
11d9 : 85 31 __ STA P4 
11db : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
11de : a9 08 __ LDA #$08
11e0 : 85 2e __ STA P1 
11e2 : a9 00 __ LDA #$00
11e4 : 85 2f __ STA P2 
11e6 : 85 31 __ STA P4 
11e8 : a9 48 __ LDA #$48
11ea : 85 30 __ STA P3 
11ec : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
11ef : a9 00 __ LDA #$00
11f1 : 85 2e __ STA P1 
11f3 : a9 01 __ LDA #$01
11f5 : 85 2f __ STA P2 
11f7 : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
11fa : a9 20 __ LDA #$20
11fc : 85 2d __ STA P0 
11fe : a9 47 __ LDA #$47
1200 : 85 2e __ STA P1 
1202 : a9 00 __ LDA #$00
1204 : 85 30 __ STA P3 
1206 : a9 00 __ LDA #$00
1208 : 85 31 __ STA P4 
120a : a9 2e __ LDA #$2e
120c : 85 32 __ STA P5 
120e : a9 00 __ LDA #$00
1210 : 85 33 __ STA P6 
1212 : a9 08 __ LDA #$08
1214 : 85 34 __ STA P7 
1216 : 20 b7 13 JSR $13b7 ; (vram_putn.s0 + 0)
1219 : a9 46 __ LDA #$46
121b : 85 2d __ STA P0 
121d : a9 39 __ LDA #$39
121f : 85 2e __ STA P1 
1221 : a9 0a __ LDA #$0a
1223 : 85 2f __ STA P2 
1225 : a9 03 __ LDA #$03
1227 : 85 31 __ STA P4 
1229 : 85 32 __ STA P5 
122b : a9 07 __ LDA #$07
122d : 85 33 __ STA P6 
122f : a9 06 __ LDA #$06
1231 : 85 34 __ STA P7 
1233 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
1236 : a9 f8 __ LDA #$f8
1238 : 85 2e __ STA P1 
123a : a9 01 __ LDA #$01
123c : 85 2f __ STA P2 
123e : a9 08 __ LDA #$08
1240 : 85 30 __ STA P3 
1242 : a9 00 __ LDA #$00
1244 : 85 31 __ STA P4 
1246 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
1249 : a9 47 __ LDA #$47
124b : 85 2d __ STA P0 
124d : a9 39 __ LDA #$39
124f : 85 2e __ STA P1 
1251 : a9 0a __ LDA #$0a
1253 : 85 2f __ STA P2 
1255 : a9 00 __ LDA #$00
1257 : 85 30 __ STA P3 
1259 : a9 03 __ LDA #$03
125b : 85 31 __ STA P4 
125d : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
1260 : a9 38 __ LDA #$38
1262 : 85 2e __ STA P1 
1264 : a9 02 __ LDA #$02
1266 : 85 2f __ STA P2 
1268 : a9 08 __ LDA #$08
126a : 85 30 __ STA P3 
126c : a9 00 __ LDA #$00
126e : 85 31 __ STA P4 
1270 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
1273 : a9 01 __ LDA #$01
1275 : 85 2e __ STA P1 
1277 : a9 00 __ LDA #$00
1279 : 85 2f __ STA P2 
127b : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
127e : a9 48 __ LDA #$48
1280 : 85 2d __ STA P0 
1282 : a9 39 __ LDA #$39
1284 : 85 2e __ STA P1 
1286 : a9 0a __ LDA #$0a
1288 : 85 2f __ STA P2 
128a : a9 00 __ LDA #$00
128c : 85 30 __ STA P3 
128e : a9 03 __ LDA #$03
1290 : 85 31 __ STA P4 
1292 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
1295 : a9 38 __ LDA #$38
1297 : 85 2e __ STA P1 
1299 : a9 02 __ LDA #$02
129b : 85 2f __ STA P2 
129d : a9 48 __ LDA #$48
129f : 85 30 __ STA P3 
12a1 : a9 00 __ LDA #$00
12a3 : 85 31 __ STA P4 
12a5 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
12a8 : a9 01 __ LDA #$01
12aa : 85 2e __ STA P1 
12ac : 85 2f __ STA P2 
12ae : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
12b1 : a9 49 __ LDA #$49
12b3 : 85 2d __ STA P0 
12b5 : a9 39 __ LDA #$39
12b7 : 85 2e __ STA P1 
12b9 : a9 0a __ LDA #$0a
12bb : 85 2f __ STA P2 
12bd : a9 00 __ LDA #$00
12bf : 85 30 __ STA P3 
12c1 : a9 03 __ LDA #$03
12c3 : 85 31 __ STA P4 
12c5 : 20 19 14 JSR $1419 ; (vera_spr_set.s0 + 0)
12c8 : a9 f8 __ LDA #$f8
12ca : 85 2e __ STA P1 
12cc : a9 01 __ LDA #$01
12ce : 85 2f __ STA P2 
12d0 : a9 48 __ LDA #$48
12d2 : 85 30 __ STA P3 
12d4 : a9 00 __ LDA #$00
12d6 : 85 31 __ STA P4 
12d8 : 20 76 14 JSR $1476 ; (vera_spr_move.s0 + 0)
12db : a9 00 __ LDA #$00
12dd : 85 2e __ STA P1 
12df : 20 af 14 JSR $14af ; (vera_spr_flip.s0 + 0)
12e2 : a9 20 __ LDA #$20
12e4 : 85 37 __ STA P10 
12e6 : a9 40 __ LDA #$40
12e8 : 8d fc 9e STA $9efc ; (sstack + 0)
12eb : a9 fa __ LDA #$fa
12ed : 8d fd 9e STA $9efd ; (sstack + 1)
12f0 : a9 01 __ LDA #$01
12f2 : 8d fe 9e STA $9efe ; (sstack + 2)
12f5 : a9 00 __ LDA #$00
12f7 : 8d ff 9e STA $9eff ; (sstack + 3)
12fa : a9 a8 __ LDA #$a8
12fc : 85 35 __ STA P8 
12fe : a9 19 __ LDA #$19
1300 : 85 36 __ STA P9 
1302 : 20 35 15 JSR $1535 ; (SetPaletteColours.s0 + 0)
1305 : a9 60 __ LDA #$60
1307 : 8d fc 9e STA $9efc ; (sstack + 0)
130a : a9 fa __ LDA #$fa
130c : 8d fd 9e STA $9efd ; (sstack + 1)
130f : a9 01 __ LDA #$01
1311 : 8d fe 9e STA $9efe ; (sstack + 2)
1314 : a9 00 __ LDA #$00
1316 : 8d ff 9e STA $9eff ; (sstack + 3)
1319 : a9 c8 __ LDA #$c8
131b : 85 35 __ STA P8 
131d : a9 19 __ LDA #$19
131f : 85 36 __ STA P9 
1321 : 20 35 15 JSR $1535 ; (SetPaletteColours.s0 + 0)
1324 : a9 80 __ LDA #$80
1326 : 8d fc 9e STA $9efc ; (sstack + 0)
1329 : a9 fa __ LDA #$fa
132b : 8d fd 9e STA $9efd ; (sstack + 1)
132e : a9 01 __ LDA #$01
1330 : 8d fe 9e STA $9efe ; (sstack + 2)
1333 : a9 00 __ LDA #$00
1335 : 8d ff 9e STA $9eff ; (sstack + 3)
1338 : a9 00 __ LDA #$00
133a : 85 35 __ STA P8 
133c : a9 36 __ LDA #$36
133e : 85 36 __ STA P9 
1340 : 20 35 15 JSR $1535 ; (SetPaletteColours.s0 + 0)
1343 : a9 60 __ LDA #$60
1345 : 85 2d __ STA P0 
1347 : a9 0c __ LDA #$0c
1349 : 85 30 __ STA P3 
134b : a9 00 __ LDA #$00
134d : 85 31 __ STA P4 
134f : a9 e8 __ LDA #$e8
1351 : 85 2e __ STA P1 
1353 : a9 19 __ LDA #$19
1355 : 85 2f __ STA P2 
1357 : 4c ec 14 JMP $14ec ; (vera_pal_putn.s0 + 0)
.s1017:
135a : c9 09 __ CMP #$09
135c : 90 06 __ BCC $1364 ; (SetUpSprites.s32 + 0)
.s1016:
135e : a9 45 __ LDA #$45
1360 : c5 48 __ CMP T2 + 0 
1362 : b0 05 __ BCS $1369 ; (SetUpSprites.s1005 + 0)
.s32:
1364 : a9 04 __ LDA #$04
1366 : 4c 31 0d JMP $0d31 ; (SetUpSprites.s174 + 0)
.s1005:
1369 : a5 48 __ LDA T2 + 0 
136b : c9 13 __ CMP #$13
136d : 90 06 __ BCC $1375 ; (SetUpSprites.s36 + 0)
.s1004:
136f : a9 3b __ LDA #$3b
1371 : c5 48 __ CMP T2 + 0 
1373 : b0 05 __ BCS $137a ; (SetUpSprites.s1003 + 0)
.s36:
1375 : a9 05 __ LDA #$05
1377 : 4c 24 0d JMP $0d24 ; (SetUpSprites.s184 + 0)
.s1003:
137a : a5 48 __ LDA T2 + 0 
137c : c9 1d __ CMP #$1d
137e : 90 06 __ BCC $1386 ; (SetUpSprites.s40 + 0)
.s1002:
1380 : a9 31 __ LDA #$31
1382 : c5 48 __ CMP T2 + 0 
1384 : b0 05 __ BCS $138b ; (SetUpSprites.s41 + 0)
.s40:
1386 : a9 06 __ LDA #$06
1388 : 4c 24 0d JMP $0d24 ; (SetUpSprites.s184 + 0)
.s41:
138b : a9 07 __ LDA #$07
138d : 4c 24 0d JMP $0d24 ; (SetUpSprites.s184 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1390 : a5 2d __ LDA P0 ; (bank + 0)
1392 : 4a __ __ LSR
1393 : a9 00 __ LDA #$00
1395 : 6a __ __ ROR
1396 : 85 3b __ STA ACCU + 0 
1398 : a5 2f __ LDA P2 ; (mem + 1)
139a : 29 f8 __ AND #$f8
139c : 4a __ __ LSR
139d : 05 3b __ ORA ACCU + 0 
139f : 85 3b __ STA ACCU + 0 
13a1 : a5 30 __ LDA P3 ; (height + 0)
13a3 : 0a __ __ ASL
13a4 : 05 3b __ ORA ACCU + 0 
13a6 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
13a8 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
13a9 : a5 2d __ LDA P0 ; (bank + 0)
13ab : 4a __ __ LSR
13ac : a9 00 __ LDA #$00
13ae : 6a __ __ ROR
13af : 85 3b __ STA ACCU + 0 
13b1 : a5 2f __ LDA P2 ; (mem + 1)
13b3 : 4a __ __ LSR
13b4 : 05 3b __ ORA ACCU + 0 
.s1001:
13b6 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
13b7 : ad 25 9f LDA $9f25 
13ba : 29 fe __ AND #$fe
13bc : 8d 25 9f STA $9f25 
13bf : a5 2d __ LDA P0 ; (addr + 0)
13c1 : 8d 20 9f STA $9f20 
13c4 : a5 2e __ LDA P1 ; (addr + 1)
13c6 : 8d 21 9f STA $9f21 
13c9 : a5 2f __ LDA P2 ; (addr + 2)
13cb : 29 01 __ AND #$01
13cd : 09 10 __ ORA #$10
13cf : 8d 22 9f STA $9f22 
13d2 : a5 33 __ LDA P6 ; (size + 0)
13d4 : 05 34 __ ORA P7 ; (size + 1)
13d6 : f0 19 __ BEQ $13f1 ; (vram_putn.s1001 + 0)
.s6:
13d8 : a0 00 __ LDY #$00
13da : a6 33 __ LDX P6 ; (size + 0)
13dc : f0 02 __ BEQ $13e0 ; (vram_putn.l1002 + 0)
.s1005:
13de : e6 34 __ INC P7 ; (size + 1)
.l1002:
13e0 : b1 31 __ LDA (P4),y ; (data + 0)
13e2 : 8d 23 9f STA $9f23 
13e5 : c8 __ __ INY
13e6 : d0 02 __ BNE $13ea ; (vram_putn.s1009 + 0)
.s1008:
13e8 : e6 32 __ INC P5 ; (data + 1)
.s1009:
13ea : ca __ __ DEX
13eb : d0 f3 __ BNE $13e0 ; (vram_putn.l1002 + 0)
.s1004:
13ed : c6 34 __ DEC P7 ; (size + 1)
13ef : d0 ef __ BNE $13e0 ; (vram_putn.l1002 + 0)
.s1001:
13f1 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1a20 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1a30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1a40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1a50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1a60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1a70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1a80 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1a90 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
1aa0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
1ab0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
1ac0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1ad0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1ae0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
1af0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
13f2 : ad 67 19 LDA $1967 ; (seed + 1)
13f5 : 4a __ __ LSR
13f6 : ad 66 19 LDA $1966 ; (seed + 0)
13f9 : 6a __ __ ROR
13fa : aa __ __ TAX
13fb : a9 00 __ LDA #$00
13fd : 6a __ __ ROR
13fe : 4d 66 19 EOR $1966 ; (seed + 0)
1401 : 85 3b __ STA ACCU + 0 
1403 : 8a __ __ TXA
1404 : 4d 67 19 EOR $1967 ; (seed + 1)
1407 : 85 3c __ STA ACCU + 1 
1409 : 4a __ __ LSR
140a : 45 3b __ EOR ACCU + 0 
140c : 8d 66 19 STA $1966 ; (seed + 0)
140f : 85 3b __ STA ACCU + 0 
1411 : 45 3c __ EOR ACCU + 1 
1413 : 8d 67 19 STA $1967 ; (seed + 1)
1416 : 85 3c __ STA ACCU + 1 
.s1001:
1418 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1966 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b60 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b70 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b80 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b90 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ba0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1bb0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1bc0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1bd0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1be0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1bf0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1c00 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1c10 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1c20 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1c30 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1c40 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1c50 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1c60 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1c70 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1c80 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1c90 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1ca0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1cb0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1cc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1cd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ce0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1cf0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d00 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d20 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d40 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d60 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d80 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1d90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1da0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1db0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1dc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1dd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1de0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1df0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e00 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
1e10 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
1e20 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
1e30 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
1e40 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
1e50 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
1e60 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
1e70 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
1e80 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
1e90 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
1ea0 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
1eb0 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
1ec0 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
1ed0 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
1ee0 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
1ef0 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
1419 : ad 25 9f LDA $9f25 
141c : 29 fe __ AND #$fe
141e : 8d 25 9f STA $9f25 
1421 : a5 2d __ LDA P0 ; (spr + 0)
1423 : 0a __ __ ASL
1424 : 0a __ __ ASL
1425 : 85 3b __ STA ACCU + 0 
1427 : a9 3f __ LDA #$3f
1429 : 2a __ __ ROL
142a : 06 3b __ ASL ACCU + 0 
142c : 2a __ __ ROL
142d : 8d 21 9f STA $9f21 
1430 : a5 3b __ LDA ACCU + 0 
1432 : 8d 20 9f STA $9f20 
1435 : a9 11 __ LDA #$11
1437 : 8d 22 9f STA $9f22 
143a : a5 30 __ LDA P3 ; (mode8 + 0)
143c : f0 02 __ BEQ $1440 ; (vera_spr_set.s11 + 0)
.s9:
143e : a9 80 __ LDA #$80
.s11:
1440 : 05 2f __ ORA P2 ; (addr32 + 1)
1442 : a6 2e __ LDX P1 ; (addr32 + 0)
1444 : 8e 23 9f STX $9f23 
1447 : 8d 23 9f STA $9f23 
144a : a9 00 __ LDA #$00
144c : 8d 23 9f STA $9f23 
144f : 8d 23 9f STA $9f23 
1452 : 8d 23 9f STA $9f23 
1455 : 8d 23 9f STA $9f23 
1458 : a5 33 __ LDA P6 ; (z + 0)
145a : 0a __ __ ASL
145b : 0a __ __ ASL
145c : 8d 23 9f STA $9f23 
145f : a5 32 __ LDA P5 ; (h + 0)
1461 : 4a __ __ LSR
1462 : 6a __ __ ROR
1463 : 29 80 __ AND #$80
1465 : 6a __ __ ROR
1466 : 85 3b __ STA ACCU + 0 
1468 : a5 31 __ LDA P4 ; (w + 0)
146a : 0a __ __ ASL
146b : 0a __ __ ASL
146c : 0a __ __ ASL
146d : 0a __ __ ASL
146e : 05 3b __ ORA ACCU + 0 
1470 : 05 34 __ ORA P7 ; (pal + 0)
1472 : 8d 23 9f STA $9f23 
.s1001:
1475 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1476 : ad 25 9f LDA $9f25 
1479 : 29 fe __ AND #$fe
147b : 8d 25 9f STA $9f25 
147e : a5 2d __ LDA P0 ; (spr + 0)
1480 : 0a __ __ ASL
1481 : 0a __ __ ASL
1482 : 85 3b __ STA ACCU + 0 
1484 : a9 3f __ LDA #$3f
1486 : 2a __ __ ROL
1487 : 06 3b __ ASL ACCU + 0 
1489 : 2a __ __ ROL
148a : aa __ __ TAX
148b : a5 3b __ LDA ACCU + 0 
148d : 09 02 __ ORA #$02
148f : 8d 20 9f STA $9f20 
1492 : 8e 21 9f STX $9f21 
1495 : a9 11 __ LDA #$11
1497 : 8d 22 9f STA $9f22 
149a : a5 2e __ LDA P1 ; (x + 0)
149c : 8d 23 9f STA $9f23 
149f : a5 2f __ LDA P2 ; (x + 1)
14a1 : 8d 23 9f STA $9f23 
14a4 : a5 30 __ LDA P3 ; (y + 0)
14a6 : 8d 23 9f STA $9f23 
14a9 : a5 31 __ LDA P4 ; (y + 1)
14ab : 8d 23 9f STA $9f23 
.s1001:
14ae : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
14af : ad 25 9f LDA $9f25 
14b2 : 29 fe __ AND #$fe
14b4 : 8d 25 9f STA $9f25 
14b7 : a5 2d __ LDA P0 ; (spr + 0)
14b9 : 0a __ __ ASL
14ba : 0a __ __ ASL
14bb : 85 3b __ STA ACCU + 0 
14bd : a9 3f __ LDA #$3f
14bf : 2a __ __ ROL
14c0 : 06 3b __ ASL ACCU + 0 
14c2 : 2a __ __ ROL
14c3 : aa __ __ TAX
14c4 : a5 3b __ LDA ACCU + 0 
14c6 : 09 06 __ ORA #$06
14c8 : 8d 20 9f STA $9f20 
14cb : 8e 21 9f STX $9f21 
14ce : a9 01 __ LDA #$01
14d0 : 8d 22 9f STA $9f22 
14d3 : ad 23 9f LDA $9f23 
14d6 : 29 fc __ AND #$fc
14d8 : a8 __ __ TAY
14d9 : a5 2e __ LDA P1 ; (fliph + 0)
14db : f0 01 __ BEQ $14de ; (vera_spr_flip.s14 + 0)
.s6:
14dd : c8 __ __ INY
.s14:
14de : a5 2f __ LDA P2 ; (flipv + 0)
14e0 : f0 05 __ BEQ $14e7 ; (vera_spr_flip.s11 + 0)
.s9:
14e2 : 98 __ __ TYA
14e3 : 09 02 __ ORA #$02
14e5 : d0 01 __ BNE $14e8 ; (vera_spr_flip.s1002 + 0)
.s11:
14e7 : 98 __ __ TYA
.s1002:
14e8 : 8d 23 9f STA $9f23 
.s1001:
14eb : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
1f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f10 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
1f20 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1f30 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1f40 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1f50 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1f60 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1f70 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1f80 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1f90 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1fa0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1fb0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1fc0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1fd0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
1fe0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
1ff0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2000 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2010 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2020 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2030 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2040 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2050 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2060 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2070 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2080 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2090 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
20a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
20b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
20c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
20d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
20e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
20f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2100 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2110 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2120 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2130 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2140 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2150 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2160 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2170 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2180 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2190 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
21a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
21b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
21c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
21d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
21e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
21f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
14ec : ad 25 9f LDA $9f25 
14ef : 29 fe __ AND #$fe
14f1 : 8d 25 9f STA $9f25 
14f4 : a5 2d __ LDA P0 ; (index + 0)
14f6 : 0a __ __ ASL
14f7 : 8d 20 9f STA $9f20 
14fa : a9 7d __ LDA #$7d
14fc : 2a __ __ ROL
14fd : 8d 21 9f STA $9f21 
1500 : a9 11 __ LDA #$11
1502 : 8d 22 9f STA $9f22 
1505 : a5 30 __ LDA P3 ; (size + 0)
1507 : 05 31 __ ORA P4 ; (size + 1)
1509 : f0 29 __ BEQ $1534 ; (vera_pal_putn.s1001 + 0)
.s6:
150b : a6 30 __ LDX P3 ; (size + 0)
150d : f0 02 __ BEQ $1511 ; (vera_pal_putn.l3 + 0)
.s1003:
150f : e6 31 __ INC P4 ; (size + 1)
.l3:
1511 : a0 01 __ LDY #$01
1513 : b1 2e __ LDA (P1),y ; (color + 0)
1515 : 85 3c __ STA ACCU + 1 
1517 : 88 __ __ DEY
1518 : b1 2e __ LDA (P1),y ; (color + 0)
151a : 8d 23 9f STA $9f23 
151d : a5 3c __ LDA ACCU + 1 
151f : 8d 23 9f STA $9f23 
1522 : 18 __ __ CLC
1523 : a5 2e __ LDA P1 ; (color + 0)
1525 : 69 02 __ ADC #$02
1527 : 85 2e __ STA P1 ; (color + 0)
1529 : 90 02 __ BCC $152d ; (vera_pal_putn.s1007 + 0)
.s1006:
152b : e6 2f __ INC P2 ; (color + 1)
.s1007:
152d : ca __ __ DEX
152e : d0 e1 __ BNE $1511 ; (vera_pal_putn.l3 + 0)
.s1002:
1530 : c6 31 __ DEC P4 ; (size + 1)
1532 : d0 dd __ BNE $1511 ; (vera_pal_putn.l3 + 0)
.s1001:
1534 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
1968 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
1978 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
1988 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
1998 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainEyeBack:
2200 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2210 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2220 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2230 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2240 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2250 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2260 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2270 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2280 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2290 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
22a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
22b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
22c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
22d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
22e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
22f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2300 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2310 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2320 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2330 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2340 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2350 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2360 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2370 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2380 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2390 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
23a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
23b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
23c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
23d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
23e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
23f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2400 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2410 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2420 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2430 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2440 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2450 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2460 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2470 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2480 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2490 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
24a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
24b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
24c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
24d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
24e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
24f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2500 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2510 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2520 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2530 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2540 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2550 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2560 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2570 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2580 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2590 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
25a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
25b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
25c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
25d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
25e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
25f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
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
2c20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2c30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2c40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2c50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2c60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2c70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2c80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2c90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2ca0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2cb0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2cc0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2cd0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2ce0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2cf0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2d00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2d10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2d20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2d30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2d40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2d50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2d60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2d70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2d80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2d90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2da0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2db0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2dc0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2dd0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2de0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2df0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
--------------------------------------------------------------------
CharBox:
2e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e20 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2e30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2e40 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
2e50 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2e60 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
2e70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2e80 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
2e90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2ea0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
2eb0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2ec0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
2ed0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2ee0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2ef0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2f00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2f10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2f20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2f30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2f40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2f50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2f60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2f70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2f80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2f90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2fa0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2fb0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2fc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2fd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2fe0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
2ff0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3000 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3010 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3020 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3030 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3040 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3050 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3060 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3070 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3080 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3090 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
30a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
30b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
30c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
30d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
30e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
30f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3100 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3110 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3120 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3130 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3140 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3150 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3160 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3170 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3180 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3190 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
31a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
31b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
31c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
31d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
31e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
31f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3200 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3210 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3220 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3230 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3240 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3250 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3260 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3270 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3280 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3290 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
32a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
32b0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
32c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
32d0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
32e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
32f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3300 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3310 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3320 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3330 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3340 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3350 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3360 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3370 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3380 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3390 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
33a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
33b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
33c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
33d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
33e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
33f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3400 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3410 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3420 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3430 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3440 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3450 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3460 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3470 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3480 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3490 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
34a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
34c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
34e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3500 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3510 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3520 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3530 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3540 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3550 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3560 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3570 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3580 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3590 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
35a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
35c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
35e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1535 : ad fc 9e LDA $9efc ; (sstack + 0)
1538 : 85 2d __ STA P0 
153a : ad fd 9e LDA $9efd ; (sstack + 1)
153d : 85 2e __ STA P1 
153f : ad fe 9e LDA $9efe ; (sstack + 2)
1542 : 85 2f __ STA P2 
1544 : ad ff 9e LDA $9eff ; (sstack + 3)
1547 : 85 30 __ STA P3 
1549 : a5 35 __ LDA P8 ; (input + 0)
154b : 85 31 __ STA P4 
154d : a5 36 __ LDA P9 ; (input + 1)
154f : 85 32 __ STA P5 
1551 : a5 37 __ LDA P10 ; (inputsize + 0)
1553 : 85 33 __ STA P6 
1555 : a9 00 __ LDA #$00
1557 : 85 34 __ STA P7 
1559 : 4c b7 13 JMP $13b7 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
19a8 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
19b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
19c8 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
19d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
3600 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
3610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
19e8 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
p:
19f4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalTimer:
19f6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
3620 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
3630 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
155c : a9 10 __ LDA #$10
155e : 85 30 __ STA P3 
1560 : a9 00 __ LDA #$00
1562 : 85 31 __ STA P4 
1564 : a5 32 __ LDA P5 ; (Palette + 0)
1566 : 85 2e __ STA P1 
1568 : 85 47 __ STA T0 + 0 
156a : a5 33 __ LDA P6 ; (Palette + 1)
156c : 85 2f __ STA P2 
156e : 85 48 __ STA T0 + 1 
1570 : ad fc 9e LDA $9efc ; (sstack + 0)
1573 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1575 : 0a __ __ ASL
1576 : 85 49 __ STA T2 + 0 
1578 : ad fd 9e LDA $9efd ; (sstack + 1)
157b : 2a __ __ ROL
157c : 18 __ __ CLC
157d : 65 33 __ ADC P6 ; (Palette + 1)
157f : 85 4a __ STA T2 + 1 
1581 : a4 32 __ LDY P5 ; (Palette + 0)
1583 : b1 49 __ LDA (T2 + 0),y 
1585 : aa __ __ TAX
1586 : c8 __ __ INY
1587 : b1 49 __ LDA (T2 + 0),y 
1589 : 86 49 __ STX T2 + 0 
158b : 85 4a __ STA T2 + 1 
158d : a9 00 __ LDA #$00
158f : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1591 : ad fe 9e LDA $9efe ; (sstack + 2)
1594 : 85 4b __ STA T4 + 0 
1596 : 38 __ __ SEC
1597 : e9 01 __ SBC #$01
1599 : 85 4d __ STA T5 + 0 
159b : ad ff 9e LDA $9eff ; (sstack + 3)
159e : 85 4c __ STA T4 + 1 
15a0 : e9 00 __ SBC #$00
15a2 : 85 4e __ STA T5 + 1 
15a4 : d0 06 __ BNE $15ac ; (SetPaletteIndex.s5 + 0)
.s1004:
15a6 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
15a8 : c5 4d __ CMP T5 + 0 
15aa : b0 38 __ BCS $15e4 ; (SetPaletteIndex.s4 + 0)
.s5:
15ac : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
15ae : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
15b0 : 18 __ __ CLC
15b1 : a5 32 __ LDA P5 ; (Palette + 0)
15b3 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
15b5 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
15b7 : a5 33 __ LDA P6 ; (Palette + 1)
15b9 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
15bb : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
15bd : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
15c0 : a0 02 __ LDY #$02
15c2 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
15c4 : a0 00 __ LDY #$00
15c6 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
15c8 : a0 03 __ LDY #$03
15ca : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
15cc : a0 01 __ LDY #$01
15ce : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
15d0 : 18 __ __ CLC
15d1 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
15d3 : 69 02 __ ADC #$02
15d5 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
15d7 : 90 02 __ BCC $15db ; (SetPaletteIndex.s1008 + 0)
.s1007:
15d9 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
15db : e8 __ __ INX
15dc : a5 4e __ LDA T5 + 1 
15de : d0 e0 __ BNE $15c0 ; (SetPaletteIndex.l2 + 0)
.s1002:
15e0 : e4 4d __ CPX T5 + 0 
15e2 : 90 dc __ BCC $15c0 ; (SetPaletteIndex.l2 + 0)
.s4:
15e4 : a5 4b __ LDA T4 + 0 
15e6 : 0a __ __ ASL
15e7 : aa __ __ TAX
15e8 : a5 4c __ LDA T4 + 1 
15ea : 2a __ __ ROL
15eb : a8 __ __ TAY
15ec : 8a __ __ TXA
15ed : 38 __ __ SEC
15ee : e9 02 __ SBC #$02
15f0 : b0 01 __ BCS $15f3 ; (SetPaletteIndex.s1010 + 0)
.s1009:
15f2 : 88 __ __ DEY
.s1010:
15f3 : 18 __ __ CLC
15f4 : 65 47 __ ADC T0 + 0 
15f6 : 85 47 __ STA T0 + 0 
15f8 : 98 __ __ TYA
15f9 : 65 48 __ ADC T0 + 1 
15fb : 85 48 __ STA T0 + 1 
15fd : a5 49 __ LDA T2 + 0 
15ff : a0 00 __ LDY #$00
1601 : 91 47 __ STA (T0 + 0),y 
1603 : a5 4a __ LDA T2 + 1 
1605 : c8 __ __ INY
1606 : 91 47 __ STA (T0 + 0),y 
1608 : a5 34 __ LDA P7 ; (index + 0)
160a : 85 2d __ STA P0 
160c : 4c ec 14 JMP $14ec ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
19f8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
3640 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
3650 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
19fa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
3660 : __ __ __ BYT 23 02 12 01 01 01 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
3670 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
BGPalShimmer:
3680 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
3690 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
zsm_check:
.s0:
160f : ad 64 19 LDA $1964 ; (zsm_finished + 0)
.s1001:
1612 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1613 : a9 01 __ LDA #$01
1615 : 8d 64 19 STA $1964 ; (zsm_finished + 0)
1618 : ad fb 19 LDA $19fb ; (zsm_reading + 0)
161b : f0 0a __ BEQ $1627 ; (zsm_init.s3 + 0)
.s1:
161d : a9 02 __ LDA #$02
161f : 20 6c 16 JSR $166c ; (krnio_close.s1000 + 0)
1622 : a9 00 __ LDA #$00
1624 : 8d fb 19 STA $19fb ; (zsm_reading + 0)
.s3:
1627 : 8d de 3a STA $3ade ; (zsm_pos + 0)
162a : 8d df 3a STA $3adf ; (zsm_pos + 1)
162d : 8d e0 3a STA $3ae0 ; (zsm_wpos + 0)
1630 : 8d e1 3a STA $3ae1 ; (zsm_wpos + 1)
1633 : 8d dd 36 STA $36dd ; (zsm_delay + 0)
1636 : a5 30 __ LDA P3 ; (fname + 0)
1638 : 85 2d __ STA P0 
163a : a5 31 __ LDA P4 ; (fname + 1)
163c : 85 2e __ STA P1 
163e : 20 74 16 JSR $1674 ; (krnio_setnam.s0 + 0)
1641 : a9 02 __ LDA #$02
1643 : 85 2d __ STA P0 
1645 : 85 2f __ STA P2 
1647 : a9 08 __ LDA #$08
1649 : 85 2e __ STA P1 
164b : 20 8a 16 JSR $168a ; (krnio_open.s0 + 0)
164e : a5 3b __ LDA ACCU + 0 
1650 : f0 19 __ BEQ $166b ; (zsm_init.s1001 + 0)
.s4:
1652 : a9 01 __ LDA #$01
1654 : 8d fb 19 STA $19fb ; (zsm_reading + 0)
1657 : 20 b2 16 JSR $16b2 ; (zsm_fill.s0 + 0)
165a : a9 10 __ LDA #$10
165c : 8d de 3a STA $3ade ; (zsm_pos + 0)
165f : a9 00 __ LDA #$00
1661 : 8d df 3a STA $3adf ; (zsm_pos + 1)
1664 : 8d 64 19 STA $1964 ; (zsm_finished + 0)
1667 : a9 01 __ LDA #$01
1669 : 85 3b __ STA ACCU + 0 
.s1001:
166b : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
19fb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
166c : 85 2d __ STA P0 
.s0:
166e : a5 2d __ LDA P0 
1670 : 20 c3 ff JSR $ffc3 
.s1001:
1673 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
3ae0 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1674 : a5 2d __ LDA P0 
1676 : 05 2e __ ORA P1 
1678 : f0 08 __ BEQ $1682 ; (krnio_setnam.s0 + 14)
167a : a0 ff __ LDY #$ff
167c : c8 __ __ INY
167d : b1 2d __ LDA (P0),y 
167f : d0 fb __ BNE $167c ; (krnio_setnam.s0 + 8)
1681 : 98 __ __ TYA
1682 : a6 2d __ LDX P0 
1684 : a4 2e __ LDY P1 
1686 : 20 bd ff JSR $ffbd 
.s1001:
1689 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
168a : a9 00 __ LDA #$00
168c : a6 2d __ LDX P0 ; (fnum + 0)
168e : 9d e2 3a STA $3ae2,x ; (krnio_pstatus + 0)
1691 : a9 00 __ LDA #$00
1693 : 85 3b __ STA ACCU + 0 
1695 : 85 3c __ STA ACCU + 1 
1697 : a5 2d __ LDA P0 ; (fnum + 0)
1699 : a6 2e __ LDX P1 
169b : a4 2f __ LDY P2 
169d : 20 ba ff JSR $ffba 
16a0 : 20 c0 ff JSR $ffc0 
16a3 : 90 08 __ BCC $16ad ; (krnio_open.s0 + 35)
16a5 : a5 2d __ LDA P0 ; (fnum + 0)
16a7 : 20 c3 ff JSR $ffc3 
16aa : 4c b1 16 JMP $16b1 ; (krnio_open.s1001 + 0)
16ad : a9 01 __ LDA #$01
16af : 85 3b __ STA ACCU + 0 
.s1001:
16b1 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
3ae2 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
16b2 : ad fb 19 LDA $19fb ; (zsm_reading + 0)
16b5 : f0 20 __ BEQ $16d7 ; (zsm_fill.s1 + 0)
.s2:
16b7 : ad df 3a LDA $3adf ; (zsm_pos + 1)
16ba : 18 __ __ CLC
16bb : 69 04 __ ADC #$04
16bd : cd e1 3a CMP $3ae1 ; (zsm_wpos + 1)
16c0 : d0 0c __ BNE $16ce ; (zsm_fill.s6 + 0)
.s1006:
16c2 : ad e0 3a LDA $3ae0 ; (zsm_wpos + 0)
16c5 : cd de 3a CMP $3ade ; (zsm_pos + 0)
16c8 : d0 04 __ BNE $16ce ; (zsm_fill.s6 + 0)
.s5:
16ca : a9 00 __ LDA #$00
16cc : f0 0b __ BEQ $16d9 ; (zsm_fill.s1008 + 0)
.s6:
16ce : a9 02 __ LDA #$02
16d0 : 20 56 17 JSR $1756 ; (krnio_chkin.s1000 + 0)
16d3 : a5 3b __ LDA ACCU + 0 
16d5 : d0 07 __ BNE $16de ; (zsm_fill.s9 + 0)
.s1:
16d7 : a9 ff __ LDA #$ff
.s1008:
16d9 : 85 3b __ STA ACCU + 0 
.s1001:
16db : 85 3c __ STA ACCU + 1 
16dd : 60 __ __ RTS
.s9:
16de : a9 00 __ LDA #$00
16e0 : 85 47 __ STA T1 + 0 
16e2 : 85 48 __ STA T1 + 1 
16e4 : ad df 3a LDA $3adf ; (zsm_pos + 1)
16e7 : 18 __ __ CLC
16e8 : 69 04 __ ADC #$04
16ea : cd e1 3a CMP $3ae1 ; (zsm_wpos + 1)
16ed : d0 08 __ BNE $16f7 ; (zsm_fill.l13 + 0)
.s1002:
16ef : ad e0 3a LDA $3ae0 ; (zsm_wpos + 0)
16f2 : cd de 3a CMP $3ade ; (zsm_pos + 0)
16f5 : f0 49 __ BEQ $1740 ; (zsm_fill.s37 + 0)
.l13:
16f7 : 20 68 17 JSR $1768 ; (krnio_chrin.s0 + 0)
16fa : ad e0 3a LDA $3ae0 ; (zsm_wpos + 0)
16fd : aa __ __ TAX
16fe : 18 __ __ CLC
16ff : 69 01 __ ADC #$01
1701 : 8d e0 3a STA $3ae0 ; (zsm_wpos + 0)
1704 : ad e1 3a LDA $3ae1 ; (zsm_wpos + 1)
1707 : a8 __ __ TAY
1708 : 69 00 __ ADC #$00
170a : 8d e1 3a STA $3ae1 ; (zsm_wpos + 1)
170d : 8a __ __ TXA
170e : 18 __ __ CLC
170f : 69 de __ ADC #$de
1711 : 85 49 __ STA T3 + 0 
1713 : 98 __ __ TYA
1714 : 29 03 __ AND #$03
1716 : 69 36 __ ADC #$36
1718 : 85 4a __ STA T3 + 1 
171a : a5 3b __ LDA ACCU + 0 
171c : a0 00 __ LDY #$00
171e : 91 49 __ STA (T3 + 0),y 
1720 : e6 47 __ INC T1 + 0 
1722 : d0 02 __ BNE $1726 ; (zsm_fill.s1010 + 0)
.s1009:
1724 : e6 48 __ INC T1 + 1 
.s1010:
1726 : 20 72 17 JSR $1772 ; (krnio_status.s0 + 0)
1729 : a5 3b __ LDA ACCU + 0 
172b : d0 0e __ BNE $173b ; (zsm_fill.s15 + 0)
.s12:
172d : ad df 3a LDA $3adf ; (zsm_pos + 1)
1730 : 18 __ __ CLC
1731 : 69 04 __ ADC #$04
1733 : cd e1 3a CMP $3ae1 ; (zsm_wpos + 1)
1736 : d0 bf __ BNE $16f7 ; (zsm_fill.l13 + 0)
1738 : 4c ef 16 JMP $16ef ; (zsm_fill.s1002 + 0)
.s15:
173b : a9 00 __ LDA #$00
173d : 8d fb 19 STA $19fb ; (zsm_reading + 0)
.s37:
1740 : 20 7c 17 JSR $177c ; (krnio_clrchn.s0 + 0)
1743 : ad fb 19 LDA $19fb ; (zsm_reading + 0)
1746 : d0 05 __ BNE $174d ; (zsm_fill.s21 + 0)
.s19:
1748 : a9 02 __ LDA #$02
174a : 20 6c 16 JSR $166c ; (krnio_close.s1000 + 0)
.s21:
174d : a5 47 __ LDA T1 + 0 
174f : 85 3b __ STA ACCU + 0 
1751 : a5 48 __ LDA T1 + 1 
1753 : 4c db 16 JMP $16db ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1756 : 85 2d __ STA P0 
.s0:
1758 : a6 2d __ LDX P0 
175a : 20 c6 ff JSR $ffc6 
175d : a9 00 __ LDA #$00
175f : 85 3c __ STA ACCU + 1 
1761 : b0 02 __ BCS $1765 ; (krnio_chkin.s0 + 13)
1763 : a9 01 __ LDA #$01
1765 : 85 3b __ STA ACCU + 0 
.s1001:
1767 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1768 : 20 cf ff JSR $ffcf 
176b : 85 3b __ STA ACCU + 0 
176d : a9 00 __ LDA #$00
176f : 85 3c __ STA ACCU + 1 
.s1001:
1771 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1772 : 20 b7 ff JSR $ffb7 
1775 : 85 3b __ STA ACCU + 0 
1777 : a9 00 __ LDA #$00
1779 : 85 3c __ STA ACCU + 1 
.s1001:
177b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
177c : 20 cc ff JSR $ffcc 
.s1001:
177f : 60 __ __ RTS
--------------------------------------------------------------------
1780 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1790 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
179e : 20 cc 17 JSR $17cc ; (getchx.s0 + 0)
17a1 : a5 3c __ LDA ACCU + 1 
17a3 : d0 22 __ BNE $17c7 ; (Control.s1006 + 0)
.s1005:
17a5 : a5 3b __ LDA ACCU + 0 
17a7 : c9 20 __ CMP #$20
17a9 : d0 1c __ BNE $17c7 ; (Control.s1006 + 0)
.s1:
17ab : a5 2e __ LDA P1 ; (playing + 0)
17ad : d0 0a __ BNE $17b9 ; (Control.s4 + 0)
.s5:
17af : a9 01 __ LDA #$01
17b1 : 20 85 18 JSR $1885 ; (zsm_irq_play.s0 + 0)
17b4 : a9 01 __ LDA #$01
.s1001:
17b6 : 85 3b __ STA ACCU + 0 
17b8 : 60 __ __ RTS
.s4:
17b9 : a9 00 __ LDA #$00
17bb : cd fd 19 CMP $19fd ; (paused + 0)
17be : 2a __ __ ROL
17bf : 85 2d __ STA P0 
17c1 : 8d fd 19 STA $19fd ; (paused + 0)
17c4 : 20 07 18 JSR $1807 ; (zsm_pause.s0 + 0)
.s1006:
17c7 : a5 2e __ LDA P1 ; (playing + 0)
17c9 : 4c b6 17 JMP $17b6 ; (Control.s1001 + 0)
--------------------------------------------------------------------
getchx:
.s0:
17cc : 20 d6 17 JSR $17d6 ; (getpch + 0)
17cf : 85 3b __ STA ACCU + 0 
17d1 : a9 00 __ LDA #$00
17d3 : 85 3c __ STA ACCU + 1 
.s1001:
17d5 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
17d6 : 20 e4 ff JSR $ffe4 
17d9 : ae fc 19 LDX $19fc ; (giocharmap + 0)
17dc : e0 01 __ CPX #$01
17de : 90 26 __ BCC $1806 ; (getpch + 48)
17e0 : c9 0d __ CMP #$0d
17e2 : d0 02 __ BNE $17e6 ; (getpch + 16)
17e4 : a9 0a __ LDA #$0a
17e6 : e0 02 __ CPX #$02
17e8 : 90 1c __ BCC $1806 ; (getpch + 48)
17ea : c9 db __ CMP #$db
17ec : b0 18 __ BCS $1806 ; (getpch + 48)
17ee : c9 41 __ CMP #$41
17f0 : 90 14 __ BCC $1806 ; (getpch + 48)
17f2 : c9 c1 __ CMP #$c1
17f4 : 90 02 __ BCC $17f8 ; (getpch + 34)
17f6 : 49 a0 __ EOR #$a0
17f8 : c9 7b __ CMP #$7b
17fa : b0 0a __ BCS $1806 ; (getpch + 48)
17fc : c9 61 __ CMP #$61
17fe : b0 04 __ BCS $1804 ; (getpch + 46)
1800 : c9 5b __ CMP #$5b
1802 : b0 02 __ BCS $1806 ; (getpch + 48)
1804 : 49 20 __ EOR #$20
1806 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
19fc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
paused:
19fd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1807 : a5 2d __ LDA P0 ; (pause + 0)
1809 : d0 0e __ BNE $1819 ; (zsm_pause.s4 + 0)
.s8:
180b : ad 65 19 LDA $1965 ; (zsm_paused + 0)
180e : f0 08 __ BEQ $1818 ; (zsm_pause.s1001 + 0)
.s5:
1810 : 20 58 18 JSR $1858 ; (zsm_restore_volume.s0 + 0)
1813 : a9 00 __ LDA #$00
1815 : 8d 65 19 STA $1965 ; (zsm_paused + 0)
.s1001:
1818 : 60 __ __ RTS
.s4:
1819 : ad 65 19 LDA $1965 ; (zsm_paused + 0)
181c : d0 fa __ BNE $1818 ; (zsm_pause.s1001 + 0)
.s1:
181e : a9 01 __ LDA #$01
1820 : 8d 65 19 STA $1965 ; (zsm_paused + 0)
1823 : 4c 26 18 JMP $1826 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1826 : a0 00 __ LDY #$00
1828 : 84 3c __ STY ACCU + 1 
182a : a2 02 __ LDX #$02
182c : 18 __ __ CLC
.l1006:
182d : 8a __ __ TXA
182e : 09 c0 __ ORA #$c0
1830 : 8d 20 9f STA $9f20 
1833 : a5 3c __ LDA ACCU + 1 
1835 : 09 f9 __ ORA #$f9
1837 : 8d 21 9f STA $9f21 
183a : a9 01 __ LDA #$01
183c : 8d 22 9f STA $9f22 
183f : ad 23 9f LDA $9f23 
1842 : 99 00 3b STA $3b00,y ; (vera_volumes + 0)
1845 : a9 00 __ LDA #$00
1847 : 8d 23 9f STA $9f23 
184a : 8a __ __ TXA
184b : 69 04 __ ADC #$04
184d : aa __ __ TAX
184e : 90 02 __ BCC $1852 ; (zsm_save_volume.s1009 + 0)
.s1008:
1850 : e6 3c __ INC ACCU + 1 
.s1009:
1852 : c8 __ __ INY
1853 : c0 10 __ CPY #$10
1855 : 90 d6 __ BCC $182d ; (zsm_save_volume.l1006 + 0)
.s1001:
1857 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
3b00 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1858 : a0 00 __ LDY #$00
185a : 84 3c __ STY ACCU + 1 
185c : a2 02 __ LDX #$02
185e : 18 __ __ CLC
.l1006:
185f : 8a __ __ TXA
1860 : 09 c0 __ ORA #$c0
1862 : 8d 20 9f STA $9f20 
1865 : a5 3c __ LDA ACCU + 1 
1867 : 09 f9 __ ORA #$f9
1869 : 8d 21 9f STA $9f21 
186c : a9 01 __ LDA #$01
186e : 8d 22 9f STA $9f22 
1871 : b9 00 3b LDA $3b00,y ; (vera_volumes + 0)
1874 : 8d 23 9f STA $9f23 
1877 : 8a __ __ TXA
1878 : 69 04 __ ADC #$04
187a : aa __ __ TAX
187b : 90 02 __ BCC $187f ; (zsm_restore_volume.s1009 + 0)
.s1008:
187d : e6 3c __ INC ACCU + 1 
.s1009:
187f : c8 __ __ INY
1880 : c0 10 __ CPY #$10
1882 : 90 db __ BCC $185f ; (zsm_restore_volume.l1006 + 0)
.s1001:
1884 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1885 : 8d 63 19 STA $1963 ; (zsm_playing + 0)
.s1001:
1888 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
19fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
3af2 : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
36a0 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
36b0 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
36c0 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
36d0 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
1889 : ad 26 9f LDA $9f26 
188c : 29 40 __ AND #$40
188e : d0 f9 __ BNE $1889 ; (frame_wait.l1 + 0)
.l4:
1890 : ad 26 9f LDA $9f26 
1893 : 29 40 __ AND #$40
1895 : f0 f9 __ BEQ $1890 ; (frame_wait.l4 + 0)
.s1001:
1897 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1898 : 38 __ __ SEC
1899 : a9 00 __ LDA #$00
189b : e5 3b __ SBC ACCU + 0 
189d : 85 3b __ STA ACCU + 0 
189f : a9 00 __ LDA #$00
18a1 : e5 3c __ SBC ACCU + 1 
18a3 : 85 3c __ STA ACCU + 1 
18a5 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
18a6 : 38 __ __ SEC
18a7 : a9 00 __ LDA #$00
18a9 : e5 23 __ SBC WORK + 0 
18ab : 85 23 __ STA WORK + 0 
18ad : a9 00 __ LDA #$00
18af : e5 24 __ SBC WORK + 1 
18b1 : 85 24 __ STA WORK + 1 
18b3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
18b4 : a5 3c __ LDA ACCU + 1 
18b6 : d0 31 __ BNE $18e9 ; (divmod + 53)
18b8 : a5 24 __ LDA WORK + 1 
18ba : d0 1e __ BNE $18da ; (divmod + 38)
18bc : 85 26 __ STA WORK + 3 
18be : a2 04 __ LDX #$04
18c0 : 06 3b __ ASL ACCU + 0 
18c2 : 2a __ __ ROL
18c3 : c5 23 __ CMP WORK + 0 
18c5 : 90 02 __ BCC $18c9 ; (divmod + 21)
18c7 : e5 23 __ SBC WORK + 0 
18c9 : 26 3b __ ROL ACCU + 0 
18cb : 2a __ __ ROL
18cc : c5 23 __ CMP WORK + 0 
18ce : 90 02 __ BCC $18d2 ; (divmod + 30)
18d0 : e5 23 __ SBC WORK + 0 
18d2 : 26 3b __ ROL ACCU + 0 
18d4 : ca __ __ DEX
18d5 : d0 eb __ BNE $18c2 ; (divmod + 14)
18d7 : 85 25 __ STA WORK + 2 
18d9 : 60 __ __ RTS
18da : a5 3b __ LDA ACCU + 0 
18dc : 85 25 __ STA WORK + 2 
18de : a5 3c __ LDA ACCU + 1 
18e0 : 85 26 __ STA WORK + 3 
18e2 : a9 00 __ LDA #$00
18e4 : 85 3b __ STA ACCU + 0 
18e6 : 85 3c __ STA ACCU + 1 
18e8 : 60 __ __ RTS
18e9 : a5 24 __ LDA WORK + 1 
18eb : d0 1f __ BNE $190c ; (divmod + 88)
18ed : a5 23 __ LDA WORK + 0 
18ef : 30 1b __ BMI $190c ; (divmod + 88)
18f1 : a9 00 __ LDA #$00
18f3 : 85 26 __ STA WORK + 3 
18f5 : a2 10 __ LDX #$10
18f7 : 06 3b __ ASL ACCU + 0 
18f9 : 26 3c __ ROL ACCU + 1 
18fb : 2a __ __ ROL
18fc : c5 23 __ CMP WORK + 0 
18fe : 90 02 __ BCC $1902 ; (divmod + 78)
1900 : e5 23 __ SBC WORK + 0 
1902 : 26 3b __ ROL ACCU + 0 
1904 : 26 3c __ ROL ACCU + 1 
1906 : ca __ __ DEX
1907 : d0 f2 __ BNE $18fb ; (divmod + 71)
1909 : 85 25 __ STA WORK + 2 
190b : 60 __ __ RTS
190c : a9 00 __ LDA #$00
190e : 85 25 __ STA WORK + 2 
1910 : 85 26 __ STA WORK + 3 
1912 : 84 22 __ STY $22 
1914 : a0 10 __ LDY #$10
1916 : 18 __ __ CLC
1917 : 26 3b __ ROL ACCU + 0 
1919 : 26 3c __ ROL ACCU + 1 
191b : 26 25 __ ROL WORK + 2 
191d : 26 26 __ ROL WORK + 3 
191f : 38 __ __ SEC
1920 : a5 25 __ LDA WORK + 2 
1922 : e5 23 __ SBC WORK + 0 
1924 : aa __ __ TAX
1925 : a5 26 __ LDA WORK + 3 
1927 : e5 24 __ SBC WORK + 1 
1929 : 90 04 __ BCC $192f ; (divmod + 123)
192b : 86 25 __ STX WORK + 2 
192d : 85 26 __ STA WORK + 3 
192f : 88 __ __ DEY
1930 : d0 e5 __ BNE $1917 ; (divmod + 99)
1932 : 26 3b __ ROL ACCU + 0 
1934 : 26 3c __ ROL ACCU + 1 
1936 : a4 22 __ LDY $22 
1938 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1939 : 24 3c __ BIT ACCU + 1 
193b : 10 0d __ BPL $194a ; (mods16 + 17)
193d : 20 98 18 JSR $1898 ; (negaccu + 0)
1940 : 24 24 __ BIT WORK + 1 
1942 : 10 0d __ BPL $1951 ; (mods16 + 24)
1944 : 20 a6 18 JSR $18a6 ; (negtmp + 0)
1947 : 4c b4 18 JMP $18b4 ; (divmod + 0)
194a : 24 24 __ BIT WORK + 1 
194c : 10 f9 __ BPL $1947 ; (mods16 + 14)
194e : 20 a6 18 JSR $18a6 ; (negtmp + 0)
1951 : 20 b4 18 JSR $18b4 ; (divmod + 0)
1954 : 38 __ __ SEC
1955 : a9 00 __ LDA #$00
1957 : e5 25 __ SBC WORK + 2 
1959 : 85 25 __ STA WORK + 2 
195b : a9 00 __ LDA #$00
195d : e5 26 __ SBC WORK + 3 
195f : 85 26 __ STA WORK + 3 
1961 : 60 __ __ RTS
