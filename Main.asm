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
080e : 8e 09 17 STX $1709 ; (spentry + 0)
0811 : a9 7b __ LDA #$7b
0813 : 85 39 __ STA IP + 0 
0815 : a9 2c __ LDA #$2c
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 30 __ LDA #$30
081c : e9 2c __ SBC #$2c
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
0830 : a9 8c __ LDA #$8c
0832 : e9 7b __ SBC #$7b
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
1709 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 49 0a JSR $0a49 ; (zsm_irq_init.s0 + 0)
0883 : 20 17 0c JSR $0c17 ; (ClearVERAScreen.s0 + 0)
0886 : 20 5a 0c JSR $0c5a ; (SetUpSprites.s0 + 0)
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
08bb : ee ce 17 INC $17ce ; (p + 0)
08be : d0 03 __ BNE $08c3 ; (main.s1012 + 0)
.s1011:
08c0 : ee cf 17 INC $17cf ; (p + 1)
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
08e2 : 8d d0 17 STA $17d0 ; (PalTimer + 0)
08e5 : 8d d1 17 STA $17d1 ; (PalTimer + 1)
08e8 : a9 d2 __ LDA #$d2
08ea : 85 35 __ STA P8 
08ec : a9 17 __ LDA #$17
08ee : 85 36 __ STA P9 
08f0 : 20 50 12 JSR $1250 ; (SetPaletteColours.s0 + 0)
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
091e : a9 2e __ LDA #$2e
0920 : 85 32 __ STA P5 
0922 : a9 17 __ LDA #$17
0924 : 85 33 __ STA P6 
0926 : 20 93 13 JSR $1393 ; (SetPaletteIndex.s0 + 0)
0929 : a9 00 __ LDA #$00
092b : 85 52 __ STA T2 + 0 
.s39:
092d : ad d1 17 LDA $17d1 ; (PalTimer + 1)
0930 : 30 40 __ BMI $0972 ; (main.s40 + 0)
.s1009:
0932 : d0 07 __ BNE $093b ; (main.s10 + 0)
.s1008:
0934 : a9 03 __ LDA #$03
0936 : cd d0 17 CMP $17d0 ; (PalTimer + 0)
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
0957 : ee f2 17 INC $17f2 ; (PalIndex + 0)
095a : d0 03 __ BNE $095f ; (main.s1016 + 0)
.s1015:
095c : ee f3 17 INC $17f3 ; (PalIndex + 1)
.s1016:
095f : a9 00 __ LDA #$00
0961 : 85 32 __ STA P5 
0963 : a9 2c __ LDA #$2c
0965 : 85 33 __ STA P6 
0967 : 20 93 13 JSR $1393 ; (SetPaletteIndex.s0 + 0)
096a : a9 00 __ LDA #$00
096c : 8d d0 17 STA $17d0 ; (PalTimer + 0)
096f : 8d d1 17 STA $17d1 ; (PalTimer + 1)
.s40:
0972 : ad cf 17 LDA $17cf ; (p + 1)
0975 : d0 42 __ BNE $09b9 ; (main.s42 + 0)
.s1007:
0977 : ad ce 17 LDA $17ce ; (p + 0)
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
0996 : cd f4 17 CMP $17f4 ; (ShimmerState + 0)
0999 : 2a __ __ ROL
099a : 8d f4 17 STA $17f4 ; (ShimmerState + 0)
099d : d0 07 __ BNE $09a6 ; (main.s16 + 0)
.s17:
099f : a9 2c __ LDA #$2c
09a1 : a0 20 __ LDY #$20
09a3 : 4c aa 09 JMP $09aa ; (main.s51 + 0)
.s16:
09a6 : a9 17 __ LDA #$17
09a8 : a0 0e __ LDY #$0e
.s51:
09aa : 84 35 __ STY P8 
09ac : 85 36 __ STA P9 
09ae : 20 50 12 JSR $1250 ; (SetPaletteColours.s0 + 0)
09b1 : a9 00 __ LDA #$00
09b3 : 8d ce 17 STA $17ce ; (p + 0)
09b6 : 8d cf 17 STA $17cf ; (p + 1)
.s42:
09b9 : a9 03 __ LDA #$03
09bb : 8d 2c 9f STA $9f2c 
09be : 20 46 14 JSR $1446 ; (zsm_check.s0 + 0)
09c1 : 09 00 __ ORA #$00
09c3 : f0 0b __ BEQ $09d0 ; (main.s21 + 0)
.s19:
09c5 : a9 b7 __ LDA #$b7
09c7 : 85 30 __ STA P3 
09c9 : a9 15 __ LDA #$15
09cb : 85 31 __ STA P4 
09cd : 20 4a 14 JSR $144a ; (zsm_init.s0 + 0)
.s21:
09d0 : a5 51 __ LDA T1 + 0 
09d2 : 85 2e __ STA P1 
09d4 : 20 d5 15 JSR $15d5 ; (Control.s0 + 0)
09d7 : a5 3b __ LDA ACCU + 0 
09d9 : 85 51 __ STA T1 + 0 
09db : ad f7 17 LDA $17f7 ; (FrameCount + 0)
09de : 85 47 __ STA T3 + 0 
09e0 : 85 3b __ STA ACCU + 0 
09e2 : ad f8 17 LDA $17f8 ; (FrameCount + 1)
09e5 : 85 3c __ STA ACCU + 1 
09e7 : a9 04 __ LDA #$04
09e9 : 85 23 __ STA WORK + 0 
09eb : a9 00 __ LDA #$00
09ed : 85 24 __ STA WORK + 1 
09ef : 20 e0 16 JSR $16e0 ; (mods16 + 0)
09f2 : a5 26 __ LDA WORK + 3 
09f4 : d0 16 __ BNE $0a0c ; (main.s24 + 0)
.s1003:
09f6 : a5 25 __ LDA WORK + 2 
09f8 : c9 01 __ CMP #$01
09fa : d0 10 __ BNE $0a0c ; (main.s24 + 0)
.s22:
09fc : ac 8b 30 LDY $308b ; (off1 + 0)
09ff : c0 2b __ CPY #$2b
0a01 : b0 06 __ BCS $0a09 ; (main.s50 + 0)
.s25:
0a03 : b9 40 2c LDA $2c40,y ; (TestText2 + 0)
0a06 : 8d 23 9f STA $9f23 
.s50:
0a09 : ee 8b 30 INC $308b ; (off1 + 0)
.s24:
0a0c : 06 47 __ ASL T3 + 0 
0a0e : ad f8 17 LDA $17f8 ; (FrameCount + 1)
0a11 : 2a __ __ ROL
0a12 : 18 __ __ CLC
0a13 : 69 ff __ ADC #$ff
0a15 : 8d 38 9f STA $9f38 
0a18 : a5 47 __ LDA T3 + 0 
0a1a : 8d 37 9f STA $9f37 
0a1d : a9 01 __ LDA #$01
0a1f : 8d 2c 9f STA $9f2c 
0a22 : 20 e9 14 JSR $14e9 ; (zsm_fill.s0 + 0)
0a25 : a9 00 __ LDA #$00
0a27 : 8d 2c 9f STA $9f2c 
0a2a : 20 30 16 JSR $1630 ; (frame_wait.l1 + 0)
0a2d : ee f7 17 INC $17f7 ; (FrameCount + 0)
0a30 : f0 03 __ BEQ $0a35 ; (main.s1017 + 0)
0a32 : 4c bb 08 JMP $08bb ; (main.l2 + 0)
.s1017:
0a35 : ee f8 17 INC $17f8 ; (FrameCount + 1)
0a38 : 4c bb 08 JMP $08bb ; (main.l2 + 0)
.s4:
0a3b : ee d0 17 INC $17d0 ; (PalTimer + 0)
0a3e : f0 03 __ BEQ $0a43 ; (main.s1013 + 0)
0a40 : 4c f3 08 JMP $08f3 ; (main.s6 + 0)
.s1013:
0a43 : ee d1 17 INC $17d1 ; (PalTimer + 1)
0a46 : 4c f3 08 JMP $08f3 ; (main.s6 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0a49 : 78 __ __ SEI
0a4a : ad 14 03 LDA $0314 
0a4d : 8d f9 17 STA $17f9 ; (oirq + 0)
0a50 : ad 15 03 LDA $0315 
0a53 : 8d fa 17 STA $17fa ; (oirq + 1)
0a56 : a9 62 __ LDA #$62
0a58 : 8d 14 03 STA $0314 
0a5b : a9 0a __ LDA #$0a
0a5d : 8d 15 03 STA $0315 
0a60 : 58 __ __ CLI
.s1001:
0a61 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
17f9 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0a62 : 20 68 0a JSR $0a68 ; (irq.s1000 + 0)
0a65 : 6c f9 17 JMP ($17f9)
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
0a92 : ad 0a 17 LDA $170a ; (zsm_playing + 0)
0a95 : f0 08 __ BEQ $0a9f ; (irq.s1001 + 0)
.s4:
0a97 : ad 0b 17 LDA $170b ; (zsm_finished + 0)
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
170a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
170b : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0aca : ad fb 17 LDA $17fb ; (zsm_delay + 0)
0acd : f0 03 __ BEQ $0ad2 ; (zsm_play.s2 + 0)
0acf : 4c ff 0b JMP $0bff ; (zsm_play.s1 + 0)
.s2:
0ad2 : ad 25 9f LDA $9f25 
0ad5 : 85 47 __ STA T0 + 0 
0ad7 : ad 25 9f LDA $9f25 
0ada : 29 fe __ AND #$fe
0adc : 8d 25 9f STA $9f25 
0adf : ad 20 9f LDA $9f20 
0ae2 : 85 49 __ STA T2 + 0 
0ae4 : ad 21 9f LDA $9f21 
0ae7 : 85 4a __ STA T2 + 1 
0ae9 : ad 22 9f LDA $9f22 
0aec : 85 48 __ STA T1 + 0 
.l5:
0aee : ad fc 17 LDA $17fc ; (zsm_pos + 0)
0af1 : 85 4b __ STA T3 + 0 
0af3 : 18 __ __ CLC
0af4 : 69 01 __ ADC #$01
0af6 : 85 4d __ STA T4 + 0 
0af8 : 8d fc 17 STA $17fc ; (zsm_pos + 0)
0afb : ad fd 17 LDA $17fd ; (zsm_pos + 1)
0afe : aa __ __ TAX
0aff : 69 00 __ ADC #$00
0b01 : 85 4e __ STA T4 + 1 
0b03 : 8d fd 17 STA $17fd ; (zsm_pos + 1)
0b06 : 18 __ __ CLC
0b07 : a9 7b __ LDA #$7b
0b09 : 65 4b __ ADC T3 + 0 
0b0b : 85 3b __ STA ACCU + 0 
0b0d : 8a __ __ TXA
0b0e : 29 03 __ AND #$03
0b10 : 69 2c __ ADC #$2c
0b12 : 85 3c __ STA ACCU + 1 
0b14 : a0 00 __ LDY #$00
0b16 : b1 3b __ LDA (ACCU + 0),y 
0b18 : c9 40 __ CMP #$40
0b1a : b0 03 __ BCS $0b1f ; (zsm_play.s9 + 0)
0b1c : 4c ca 0b JMP $0bca ; (zsm_play.s8 + 0)
.s9:
0b1f : d0 22 __ BNE $0b43 ; (zsm_play.s12 + 0)
.s11:
0b21 : 18 __ __ CLC
0b22 : a9 7b __ LDA #$7b
0b24 : 65 4d __ ADC T4 + 0 
0b26 : 85 4b __ STA T3 + 0 
0b28 : a5 4e __ LDA T4 + 1 
0b2a : 29 03 __ AND #$03
0b2c : 69 2c __ ADC #$2c
0b2e : 85 4c __ STA T3 + 1 
0b30 : b1 4b __ LDA (T3 + 0),y 
0b32 : 29 3f __ AND #$3f
0b34 : 18 __ __ CLC
0b35 : 65 4d __ ADC T4 + 0 
0b37 : 8d fc 17 STA $17fc ; (zsm_pos + 0)
0b3a : 98 __ __ TYA
0b3b : 65 4e __ ADC T4 + 1 
0b3d : 8d fd 17 STA $17fd ; (zsm_pos + 1)
0b40 : 4c ee 0a JMP $0aee ; (zsm_play.l5 + 0)
.s12:
0b43 : 09 00 __ ORA #$00
0b45 : 30 5b __ BMI $0ba2 ; (zsm_play.s15 + 0)
.s14:
0b47 : 29 3f __ AND #$3f
0b49 : f0 a3 __ BEQ $0aee ; (zsm_play.l5 + 0)
.s26:
0b4b : 84 50 __ STY T7 + 0 
0b4d : 85 4f __ STA T6 + 0 
0b4f : 18 __ __ CLC
.l1012:
0b50 : a9 7b __ LDA #$7b
0b52 : 6d fc 17 ADC $17fc ; (zsm_pos + 0)
0b55 : 85 4d __ STA T4 + 0 
0b57 : ad fd 17 LDA $17fd ; (zsm_pos + 1)
0b5a : 29 03 __ AND #$03
0b5c : 69 2c __ ADC #$2c
0b5e : 85 4e __ STA T4 + 1 
0b60 : a0 00 __ LDY #$00
0b62 : b1 4d __ LDA (T4 + 0),y 
0b64 : 85 2d __ STA P0 
0b66 : ad fc 17 LDA $17fc ; (zsm_pos + 0)
0b69 : 18 __ __ CLC
0b6a : 69 01 __ ADC #$01
0b6c : aa __ __ TAX
0b6d : ad fd 17 LDA $17fd ; (zsm_pos + 1)
0b70 : 69 00 __ ADC #$00
0b72 : 29 03 __ AND #$03
0b74 : 85 4c __ STA T3 + 1 
0b76 : 8a __ __ TXA
0b77 : 18 __ __ CLC
0b78 : 69 7b __ ADC #$7b
0b7a : 85 4b __ STA T3 + 0 
0b7c : a9 2c __ LDA #$2c
0b7e : 65 4c __ ADC T3 + 1 
0b80 : 85 4c __ STA T3 + 1 
0b82 : b1 4b __ LDA (T3 + 0),y 
0b84 : 85 2e __ STA P1 
0b86 : 20 03 0c JSR $0c03 ; (sfx_put.l1 + 0)
0b89 : ad fc 17 LDA $17fc ; (zsm_pos + 0)
0b8c : 18 __ __ CLC
0b8d : 69 02 __ ADC #$02
0b8f : 8d fc 17 STA $17fc ; (zsm_pos + 0)
0b92 : 90 03 __ BCC $0b97 ; (zsm_play.s1015 + 0)
.s1014:
0b94 : ee fd 17 INC $17fd ; (zsm_pos + 1)
.s1015:
0b97 : e6 50 __ INC T7 + 0 
0b99 : a5 50 __ LDA T7 + 0 
0b9b : c5 4f __ CMP T6 + 0 
0b9d : 90 b1 __ BCC $0b50 ; (zsm_play.l1012 + 0)
0b9f : 4c ee 0a JMP $0aee ; (zsm_play.l5 + 0)
.s15:
0ba2 : c9 80 __ CMP #$80
0ba4 : d0 07 __ BNE $0bad ; (zsm_play.s22 + 0)
.s21:
0ba6 : a9 01 __ LDA #$01
0ba8 : 8d 0b 17 STA $170b ; (zsm_finished + 0)
0bab : d0 08 __ BNE $0bb5 ; (zsm_play.s7 + 0)
.s22:
0bad : 29 7f __ AND #$7f
0baf : 38 __ __ SEC
0bb0 : e9 01 __ SBC #$01
0bb2 : 8d fb 17 STA $17fb ; (zsm_delay + 0)
.s7:
0bb5 : a5 49 __ LDA T2 + 0 
0bb7 : 8d 20 9f STA $9f20 
0bba : a5 4a __ LDA T2 + 1 
0bbc : 8d 21 9f STA $9f21 
0bbf : a5 48 __ LDA T1 + 0 
0bc1 : 8d 22 9f STA $9f22 
0bc4 : a5 47 __ LDA T0 + 0 
0bc6 : 8d 25 9f STA $9f25 
.s1001:
0bc9 : 60 __ __ RTS
.s8:
0bca : 29 3f __ AND #$3f
0bcc : 09 c0 __ ORA #$c0
0bce : 8d 20 9f STA $9f20 
0bd1 : a9 f9 __ LDA #$f9
0bd3 : 8d 21 9f STA $9f21 
0bd6 : a9 01 __ LDA #$01
0bd8 : 8d 22 9f STA $9f22 
0bdb : a5 4b __ LDA T3 + 0 
0bdd : 69 02 __ ADC #$02
0bdf : 8d fc 17 STA $17fc ; (zsm_pos + 0)
0be2 : 90 01 __ BCC $0be5 ; (zsm_play.s1017 + 0)
.s1016:
0be4 : e8 __ __ INX
.s1017:
0be5 : 8e fd 17 STX $17fd ; (zsm_pos + 1)
0be8 : 18 __ __ CLC
0be9 : a9 7b __ LDA #$7b
0beb : 65 4d __ ADC T4 + 0 
0bed : 85 4b __ STA T3 + 0 
0bef : a5 4e __ LDA T4 + 1 
0bf1 : 29 03 __ AND #$03
0bf3 : 69 2c __ ADC #$2c
0bf5 : 85 4c __ STA T3 + 1 
0bf7 : b1 4b __ LDA (T3 + 0),y 
0bf9 : 8d 23 9f STA $9f23 
0bfc : 4c ee 0a JMP $0aee ; (zsm_play.l5 + 0)
.s1:
0bff : ce fb 17 DEC $17fb ; (zsm_delay + 0)
0c02 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
17fb : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
2c7b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
17fc : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0c03 : ad 41 9f LDA $9f41 
0c06 : 30 fb __ BMI $0c03 ; (sfx_put.l1 + 0)
.s3:
0c08 : a5 2d __ LDA P0 ; (index + 0)
0c0a : 8d 40 9f STA $9f40 
0c0d : ea __ __ NOP
0c0e : ea __ __ NOP
0c0f : ea __ __ NOP
0c10 : ea __ __ NOP
0c11 : a5 2e __ LDA P1 ; (data + 0)
0c13 : 8d 41 9f STA $9f41 
.s1001:
0c16 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0c17 : a9 93 __ LDA #$93
0c19 : 85 2d __ STA P0 
0c1b : a9 00 __ LDA #$00
0c1d : 85 2e __ STA P1 
0c1f : 20 54 0c JSR $0c54 ; (putch.s0 + 0)
0c22 : a9 11 __ LDA #$11
0c24 : 8d 22 9f STA $9f22 
0c27 : a2 00 __ LDX #$00
.l2:
0c29 : 8a __ __ TXA
0c2a : 18 __ __ CLC
0c2b : 69 b0 __ ADC #$b0
0c2d : 8d 21 9f STA $9f21 
0c30 : a9 00 __ LDA #$00
0c32 : 8d 20 9f STA $9f20 
0c35 : a0 80 __ LDY #$80
.l1003:
0c37 : a9 20 __ LDA #$20
0c39 : 8d 23 9f STA $9f23 
0c3c : a9 01 __ LDA #$01
0c3e : 8d 23 9f STA $9f23 
0c41 : a9 20 __ LDA #$20
0c43 : 8d 24 9f STA $9f24 
0c46 : a9 01 __ LDA #$01
0c48 : 8d 24 9f STA $9f24 
0c4b : 88 __ __ DEY
0c4c : d0 e9 __ BNE $0c37 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0c4e : e8 __ __ INX
0c4f : e0 40 __ CPX #$40
0c51 : 90 d6 __ BCC $0c29 ; (ClearVERAScreen.l2 + 0)
.s1001:
0c53 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0c54 : a5 2d __ LDA P0 
0c56 : 20 d2 ff JSR $ffd2 
.s1001:
0c59 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0c5a : a9 00 __ LDA #$00
0c5c : 85 2d __ STA P0 
0c5e : 85 2e __ STA P1 
0c60 : 85 2f __ STA P2 
0c62 : 85 30 __ STA P3 
0c64 : 85 31 __ STA P4 
0c66 : 8d 25 9f STA $9f25 
0c69 : ad 29 9f LDA $9f29 
0c6c : 09 70 __ ORA #$70
0c6e : 8d 29 9f STA $9f29 
0c71 : a9 80 __ LDA #$80
0c73 : 8d 2b 9f STA $9f2b 
0c76 : 8d 2a 9f STA $9f2a 
0c79 : a9 62 __ LDA #$62
0c7b : 8d 2d 9f STA $9f2d 
0c7e : a9 68 __ LDA #$68
0c80 : 8d 34 9f STA $9f34 
0c83 : 20 c7 11 JSR $11c7 ; (tileBaseConfig.s0 + 0)
0c86 : 8d 2f 9f STA $9f2f 
0c89 : a9 20 __ LDA #$20
0c8b : 85 2f __ STA P2 
0c8d : 20 e0 11 JSR $11e0 ; (memoryToMapMemoryAddress.s0 + 0)
0c90 : 8d 2e 9f STA $9f2e 
0c93 : a9 21 __ LDA #$21
0c95 : 8d 22 9f STA $9f22 
0c98 : a2 80 __ LDX #$80
.l6:
0c9a : a0 50 __ LDY #$50
.l1025:
0c9c : a9 00 __ LDA #$00
0c9e : 8d 24 9f STA $9f24 
0ca1 : a9 08 __ LDA #$08
0ca3 : 8d 24 9f STA $9f24 
0ca6 : 88 __ __ DEY
0ca7 : d0 f3 __ BNE $0c9c ; (SetUpSprites.l1025 + 0)
.s1026:
0ca9 : ca __ __ DEX
0caa : d0 ee __ BNE $0c9a ; (SetUpSprites.l6 + 0)
.s4:
0cac : a9 00 __ LDA #$00
0cae : 85 2d __ STA P0 
0cb0 : 85 2e __ STA P1 
0cb2 : 85 2f __ STA P2 
0cb4 : 85 30 __ STA P3 
0cb6 : 85 33 __ STA P6 
0cb8 : a9 01 __ LDA #$01
0cba : 85 34 __ STA P7 
0cbc : a9 00 __ LDA #$00
0cbe : 85 31 __ STA P4 
0cc0 : a9 18 __ LDA #$18
0cc2 : 85 32 __ STA P5 
0cc4 : 20 ee 11 JSR $11ee ; (vram_putn.s0 + 0)
0cc7 : a9 10 __ LDA #$10
0cc9 : 8d 22 9f STA $9f22 
0ccc : a9 00 __ LDA #$00
0cce : 8d 20 9f STA $9f20 
0cd1 : a9 20 __ LDA #$20
0cd3 : 8d 21 9f STA $9f21 
0cd6 : a9 3c __ LDA #$3c
0cd8 : 85 47 __ STA T1 + 0 
.l10:
0cda : a9 00 __ LDA #$00
0cdc : 85 48 __ STA T2 + 0 
.l14:
0cde : 20 29 12 JSR $1229 ; (rand.s0 + 0)
0ce1 : a5 3b __ LDA ACCU + 0 
0ce3 : 29 1f __ AND #$1f
0ce5 : c9 1f __ CMP #$1f
0ce7 : a5 48 __ LDA T2 + 0 
0ce9 : 90 03 __ BCC $0cee ; (SetUpSprites.s1023 + 0)
0ceb : 4c 91 11 JMP $1191 ; (SetUpSprites.s1017 + 0)
.s1023:
0cee : c9 09 __ CMP #$09
0cf0 : 90 06 __ BCC $0cf8 ; (SetUpSprites.s20 + 0)
.s1022:
0cf2 : a9 45 __ LDA #$45
0cf4 : c5 48 __ CMP T2 + 0 
0cf6 : b0 04 __ BCS $0cfc ; (SetUpSprites.s1021 + 0)
.s20:
0cf8 : a9 00 __ LDA #$00
0cfa : f0 2f __ BEQ $0d2b ; (SetUpSprites.s174 + 0)
.s1021:
0cfc : a5 48 __ LDA T2 + 0 
0cfe : c9 13 __ CMP #$13
0d00 : 90 06 __ BCC $0d08 ; (SetUpSprites.s24 + 0)
.s1020:
0d02 : a9 3b __ LDA #$3b
0d04 : c5 48 __ CMP T2 + 0 
0d06 : b0 04 __ BCS $0d0c ; (SetUpSprites.s1019 + 0)
.s24:
0d08 : a9 01 __ LDA #$01
0d0a : d0 12 __ BNE $0d1e ; (SetUpSprites.s184 + 0)
.s1019:
0d0c : a5 48 __ LDA T2 + 0 
0d0e : c9 1d __ CMP #$1d
0d10 : 90 06 __ BCC $0d18 ; (SetUpSprites.s28 + 0)
.s1018:
0d12 : a9 31 __ LDA #$31
0d14 : c5 48 __ CMP T2 + 0 
0d16 : b0 04 __ BCS $0d1c ; (SetUpSprites.s29 + 0)
.s28:
0d18 : a9 02 __ LDA #$02
0d1a : d0 02 __ BNE $0d1e ; (SetUpSprites.s184 + 0)
.s29:
0d1c : a9 03 __ LDA #$03
.s184:
0d1e : 8d 23 9f STA $9f23 
0d21 : a9 00 __ LDA #$00
0d23 : 8d 23 9f STA $9f23 
0d26 : e6 48 __ INC T2 + 0 
0d28 : 4c de 0c JMP $0cde ; (SetUpSprites.l14 + 0)
.s174:
0d2b : 8d 23 9f STA $9f23 
0d2e : a9 00 __ LDA #$00
0d30 : 8d 23 9f STA $9f23 
0d33 : e6 48 __ INC T2 + 0 
0d35 : 10 a7 __ BPL $0cde ; (SetUpSprites.l14 + 0)
.s11:
0d37 : c6 47 __ DEC T1 + 0 
0d39 : d0 9f __ BNE $0cda ; (SetUpSprites.l10 + 0)
.s12:
0d3b : a9 20 __ LDA #$20
0d3d : 85 37 __ STA P10 
0d3f : a9 00 __ LDA #$00
0d41 : 8d fc 9e STA $9efc ; (sstack + 0)
0d44 : 8d ff 9e STA $9eff ; (sstack + 3)
0d47 : a9 fa __ LDA #$fa
0d49 : 8d fd 9e STA $9efd ; (sstack + 1)
0d4c : a9 01 __ LDA #$01
0d4e : 8d fe 9e STA $9efe ; (sstack + 2)
0d51 : a9 0e __ LDA #$0e
0d53 : 85 35 __ STA P8 
0d55 : a9 17 __ LDA #$17
0d57 : 85 36 __ STA P9 
0d59 : 20 50 12 JSR $1250 ; (SetPaletteColours.s0 + 0)
0d5c : a9 00 __ LDA #$00
0d5e : 85 2d __ STA P0 
0d60 : 85 30 __ STA P3 
0d62 : 85 33 __ STA P6 
0d64 : a9 31 __ LDA #$31
0d66 : 85 2e __ STA P1 
0d68 : a9 01 __ LDA #$01
0d6a : 85 2f __ STA P2 
0d6c : a9 04 __ LDA #$04
0d6e : 85 34 __ STA P7 
0d70 : a9 00 __ LDA #$00
0d72 : 85 31 __ STA P4 
0d74 : a9 19 __ LDA #$19
0d76 : 85 32 __ STA P5 
0d78 : 20 ee 11 JSR $11ee ; (vram_putn.s0 + 0)
0d7b : a9 00 __ LDA #$00
0d7d : 85 4e __ STA T5 + 0 
0d7f : 85 4f __ STA T5 + 1 
.l45:
0d81 : 85 2d __ STA P0 
0d83 : 18 __ __ CLC
0d84 : 69 02 __ ADC #$02
0d86 : 85 4c __ STA T4 + 0 
0d88 : a9 00 __ LDA #$00
0d8a : 2a __ __ ROL
0d8b : 85 4d __ STA T4 + 1 
0d8d : a9 88 __ LDA #$88
0d8f : 85 2e __ STA P1 
0d91 : a9 09 __ LDA #$09
0d93 : 85 2f __ STA P2 
0d95 : a9 00 __ LDA #$00
0d97 : 85 30 __ STA P3 
0d99 : a9 03 __ LDA #$03
0d9b : 85 31 __ STA P4 
0d9d : 85 33 __ STA P6 
0d9f : a9 02 __ LDA #$02
0da1 : 85 32 __ STA P5 
0da3 : a9 01 __ LDA #$01
0da5 : 85 34 __ STA P7 
0da7 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0daa : a5 4e __ LDA T5 + 0 
0dac : 85 2e __ STA P1 
0dae : a5 4f __ LDA T5 + 1 
0db0 : 85 2f __ STA P2 
0db2 : a9 90 __ LDA #$90
0db4 : 85 30 __ STA P3 
0db6 : a9 01 __ LDA #$01
0db8 : 85 31 __ STA P4 
0dba : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0dbd : a9 00 __ LDA #$00
0dbf : 85 2e __ STA P1 
0dc1 : a9 01 __ LDA #$01
0dc3 : 85 2f __ STA P2 
0dc5 : 20 0d 13 JSR $130d ; (vera_spr_flip.s0 + 0)
0dc8 : a9 88 __ LDA #$88
0dca : 85 2e __ STA P1 
0dcc : a9 09 __ LDA #$09
0dce : 85 2f __ STA P2 
0dd0 : a9 00 __ LDA #$00
0dd2 : 85 30 __ STA P3 
0dd4 : a9 03 __ LDA #$03
0dd6 : 85 31 __ STA P4 
0dd8 : e6 2d __ INC P0 
0dda : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0ddd : a5 4e __ LDA T5 + 0 
0ddf : 85 2e __ STA P1 
0de1 : a5 4f __ LDA T5 + 1 
0de3 : 85 2f __ STA P2 
0de5 : a9 70 __ LDA #$70
0de7 : 85 30 __ STA P3 
0de9 : a9 01 __ LDA #$01
0deb : 85 31 __ STA P4 
0ded : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0df0 : a5 4d __ LDA T4 + 1 
0df2 : d0 16 __ BNE $0e0a ; (SetUpSprites.s47 + 0)
.s1013:
0df4 : 18 __ __ CLC
0df5 : a5 2e __ LDA P1 
0df7 : 69 40 __ ADC #$40
0df9 : 85 4e __ STA T5 + 0 
0dfb : a5 2f __ LDA P2 
0dfd : 69 00 __ ADC #$00
0dff : 85 4f __ STA T5 + 1 
0e01 : a5 4c __ LDA T4 + 0 
0e03 : c9 16 __ CMP #$16
0e05 : b0 03 __ BCS $0e0a ; (SetUpSprites.s47 + 0)
0e07 : 4c 81 0d JMP $0d81 ; (SetUpSprites.l45 + 0)
.s47:
0e0a : a9 00 __ LDA #$00
0e0c : 85 2d __ STA P0 
0e0e : 85 30 __ STA P3 
0e10 : 85 33 __ STA P6 
0e12 : a9 30 __ LDA #$30
0e14 : 85 2e __ STA P1 
0e16 : a9 01 __ LDA #$01
0e18 : 85 2f __ STA P2 
0e1a : a9 00 __ LDA #$00
0e1c : 85 31 __ STA P4 
0e1e : a9 1d __ LDA #$1d
0e20 : 85 32 __ STA P5 
0e22 : 20 ee 11 JSR $11ee ; (vram_putn.s0 + 0)
0e25 : a9 16 __ LDA #$16
0e27 : 85 2d __ STA P0 
0e29 : a9 80 __ LDA #$80
0e2b : 85 2e __ STA P1 
0e2d : a9 09 __ LDA #$09
0e2f : 85 2f __ STA P2 
0e31 : a9 01 __ LDA #$01
0e33 : 85 31 __ STA P4 
0e35 : 85 34 __ STA P7 
0e37 : a9 02 __ LDA #$02
0e39 : 85 32 __ STA P5 
0e3b : a9 03 __ LDA #$03
0e3d : 85 33 __ STA P6 
0e3f : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0e42 : a9 30 __ LDA #$30
0e44 : 85 2e __ STA P1 
0e46 : a9 01 __ LDA #$01
0e48 : 85 2f __ STA P2 
0e4a : a9 b8 __ LDA #$b8
0e4c : 85 30 __ STA P3 
0e4e : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0e51 : a9 20 __ LDA #$20
0e53 : 85 2d __ STA P0 
0e55 : a9 35 __ LDA #$35
0e57 : 85 2e __ STA P1 
0e59 : a9 00 __ LDA #$00
0e5b : 85 30 __ STA P3 
0e5d : 85 33 __ STA P6 
0e5f : a9 02 __ LDA #$02
0e61 : 85 34 __ STA P7 
0e63 : a9 00 __ LDA #$00
0e65 : 85 31 __ STA P4 
0e67 : a9 1e __ LDA #$1e
0e69 : 85 32 __ STA P5 
0e6b : 20 ee 11 JSR $11ee ; (vram_putn.s0 + 0)
0e6e : a9 17 __ LDA #$17
0e70 : 85 2d __ STA P0 
0e72 : a9 a9 __ LDA #$a9
0e74 : 85 2e __ STA P1 
0e76 : a9 09 __ LDA #$09
0e78 : 85 2f __ STA P2 
0e7a : a9 02 __ LDA #$02
0e7c : 85 31 __ STA P4 
0e7e : 85 32 __ STA P5 
0e80 : a9 03 __ LDA #$03
0e82 : 85 33 __ STA P6 
0e84 : a9 01 __ LDA #$01
0e86 : 85 34 __ STA P7 
0e88 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0e8b : a9 fc __ LDA #$fc
0e8d : 85 2e __ STA P1 
0e8f : a9 00 __ LDA #$00
0e91 : 85 2f __ STA P2 
0e93 : a9 b8 __ LDA #$b8
0e95 : 85 30 __ STA P3 
0e97 : a9 01 __ LDA #$01
0e99 : 85 31 __ STA P4 
0e9b : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0e9e : a9 18 __ LDA #$18
0ea0 : 85 2d __ STA P0 
0ea2 : a9 a9 __ LDA #$a9
0ea4 : 85 2e __ STA P1 
0ea6 : a9 09 __ LDA #$09
0ea8 : 85 2f __ STA P2 
0eaa : a9 00 __ LDA #$00
0eac : 85 30 __ STA P3 
0eae : a9 02 __ LDA #$02
0eb0 : 85 31 __ STA P4 
0eb2 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0eb5 : a9 4c __ LDA #$4c
0eb7 : 85 2e __ STA P1 
0eb9 : a9 01 __ LDA #$01
0ebb : 85 2f __ STA P2 
0ebd : 85 31 __ STA P4 
0ebf : a9 b8 __ LDA #$b8
0ec1 : 85 30 __ STA P3 
0ec3 : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0ec6 : a9 10 __ LDA #$10
0ec8 : 85 2d __ STA P0 
0eca : a9 20 __ LDA #$20
0ecc : 85 30 __ STA P3 
0ece : a9 00 __ LDA #$00
0ed0 : 85 31 __ STA P4 
0ed2 : a9 2e __ LDA #$2e
0ed4 : 85 2e __ STA P1 
0ed6 : a9 17 __ LDA #$17
0ed8 : 85 2f __ STA P2 
0eda : 20 4a 13 JSR $134a ; (vera_pal_putn.s0 + 0)
0edd : a9 00 __ LDA #$00
0edf : 85 2d __ STA P0 
0ee1 : 85 30 __ STA P3 
0ee3 : 85 34 __ STA P7 
0ee5 : a9 35 __ LDA #$35
0ee7 : 85 2e __ STA P1 
0ee9 : a9 01 __ LDA #$01
0eeb : 85 2f __ STA P2 
0eed : a9 20 __ LDA #$20
0eef : 85 33 __ STA P6 
0ef1 : a9 4e __ LDA #$4e
0ef3 : 85 31 __ STA P4 
0ef5 : a9 17 __ LDA #$17
0ef7 : 85 32 __ STA P5 
0ef9 : 20 ee 11 JSR $11ee ; (vram_putn.s0 + 0)
0efc : a9 00 __ LDA #$00
0efe : 85 47 __ STA T1 + 0 
0f00 : 85 48 __ STA T2 + 0 
0f02 : a9 03 __ LDA #$03
0f04 : 85 33 __ STA P6 
0f06 : a9 02 __ LDA #$02
0f08 : 85 34 __ STA P7 
0f0a : 18 __ __ CLC
.l1039:
0f0b : a9 a8 __ LDA #$a8
0f0d : 85 2e __ STA P1 
0f0f : a9 09 __ LDA #$09
0f11 : 85 2f __ STA P2 
0f13 : a9 00 __ LDA #$00
0f15 : 85 30 __ STA P3 
0f17 : 85 31 __ STA P4 
0f19 : 85 32 __ STA P5 
0f1b : a5 47 __ LDA T1 + 0 
0f1d : 69 19 __ ADC #$19
0f1f : 85 2d __ STA P0 
0f21 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0f24 : a9 b8 __ LDA #$b8
0f26 : 85 30 __ STA P3 
0f28 : a9 01 __ LDA #$01
0f2a : 85 31 __ STA P4 
0f2c : 38 __ __ SEC
0f2d : a5 48 __ LDA T2 + 0 
0f2f : e9 fc __ SBC #$fc
0f31 : 85 2e __ STA P1 
0f33 : a9 00 __ LDA #$00
0f35 : e9 03 __ SBC #$03
0f37 : 85 2f __ STA P2 
0f39 : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0f3c : 18 __ __ CLC
0f3d : a5 48 __ LDA T2 + 0 
0f3f : 69 0c __ ADC #$0c
0f41 : 85 48 __ STA T2 + 0 
0f43 : e6 47 __ INC T1 + 0 
0f45 : a5 47 __ LDA T1 + 0 
0f47 : c9 08 __ CMP #$08
0f49 : 90 c0 __ BCC $0f0b ; (SetUpSprites.l1039 + 0)
.s51:
0f4b : a9 00 __ LDA #$00
0f4d : 85 47 __ STA T1 + 0 
0f4f : 85 48 __ STA T2 + 0 
0f51 : a9 03 __ LDA #$03
0f53 : 85 33 __ STA P6 
0f55 : 85 34 __ STA P7 
0f57 : 18 __ __ CLC
.l1041:
0f58 : a9 a8 __ LDA #$a8
0f5a : 85 2e __ STA P1 
0f5c : a9 09 __ LDA #$09
0f5e : 85 2f __ STA P2 
0f60 : a9 00 __ LDA #$00
0f62 : 85 30 __ STA P3 
0f64 : 85 31 __ STA P4 
0f66 : a5 47 __ LDA T1 + 0 
0f68 : 69 21 __ ADC #$21
0f6a : 85 2d __ STA P0 
0f6c : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0f6f : a9 c4 __ LDA #$c4
0f71 : 85 30 __ STA P3 
0f73 : a9 01 __ LDA #$01
0f75 : 85 31 __ STA P4 
0f77 : 38 __ __ SEC
0f78 : a5 48 __ LDA T2 + 0 
0f7a : e9 fc __ SBC #$fc
0f7c : 85 2e __ STA P1 
0f7e : a9 00 __ LDA #$00
0f80 : e9 03 __ SBC #$03
0f82 : 85 2f __ STA P2 
0f84 : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0f87 : 18 __ __ CLC
0f88 : a5 48 __ LDA T2 + 0 
0f8a : 69 0c __ ADC #$0c
0f8c : 85 48 __ STA T2 + 0 
0f8e : e6 47 __ INC T1 + 0 
0f90 : a5 47 __ LDA T1 + 0 
0f92 : c9 08 __ CMP #$08
0f94 : 90 c2 __ BCC $0f58 ; (SetUpSprites.l1041 + 0)
.s55:
0f96 : a9 00 __ LDA #$00
0f98 : 85 47 __ STA T1 + 0 
0f9a : 85 48 __ STA T2 + 0 
0f9c : a9 03 __ LDA #$03
0f9e : 85 33 __ STA P6 
0fa0 : a9 04 __ LDA #$04
0fa2 : 85 34 __ STA P7 
0fa4 : 18 __ __ CLC
.l1043:
0fa5 : a9 a8 __ LDA #$a8
0fa7 : 85 2e __ STA P1 
0fa9 : a9 09 __ LDA #$09
0fab : 85 2f __ STA P2 
0fad : a9 00 __ LDA #$00
0faf : 85 30 __ STA P3 
0fb1 : 85 31 __ STA P4 
0fb3 : a5 47 __ LDA T1 + 0 
0fb5 : 69 29 __ ADC #$29
0fb7 : 85 2d __ STA P0 
0fb9 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
0fbc : a9 b8 __ LDA #$b8
0fbe : 85 30 __ STA P3 
0fc0 : a9 01 __ LDA #$01
0fc2 : 85 31 __ STA P4 
0fc4 : 38 __ __ SEC
0fc5 : a9 6c __ LDA #$6c
0fc7 : e5 48 __ SBC T2 + 0 
0fc9 : 85 2e __ STA P1 
0fcb : a9 02 __ LDA #$02
0fcd : e9 04 __ SBC #$04
0fcf : 85 2f __ STA P2 
0fd1 : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
0fd4 : 18 __ __ CLC
0fd5 : a5 48 __ LDA T2 + 0 
0fd7 : 69 0c __ ADC #$0c
0fd9 : 85 48 __ STA T2 + 0 
0fdb : e6 47 __ INC T1 + 0 
0fdd : a5 47 __ LDA T1 + 0 
0fdf : c9 08 __ CMP #$08
0fe1 : 90 c2 __ BCC $0fa5 ; (SetUpSprites.l1043 + 0)
.s59:
0fe3 : a9 00 __ LDA #$00
0fe5 : 85 47 __ STA T1 + 0 
.l61:
0fe7 : 38 __ __ SEC
0fe8 : a9 00 __ LDA #$00
0fea : e5 47 __ SBC T1 + 0 
0fec : 29 0c __ AND #$0c
0fee : 49 ff __ EOR #$ff
0ff0 : 38 __ __ SEC
0ff1 : 69 6c __ ADC #$6c
0ff3 : 85 48 __ STA T2 + 0 
0ff5 : a9 02 __ LDA #$02
0ff7 : e9 00 __ SBC #$00
0ff9 : 85 49 __ STA T2 + 1 
0ffb : 18 __ __ CLC
0ffc : a5 47 __ LDA T1 + 0 
0ffe : 69 31 __ ADC #$31
1000 : 85 2d __ STA P0 
1002 : a9 02 __ LDA #$02
1004 : 85 50 __ STA T7 + 0 
1006 : a9 03 __ LDA #$03
1008 : 85 33 __ STA P6 
100a : a9 04 __ LDA #$04
100c : 85 34 __ STA P7 
.l1033:
100e : a9 a8 __ LDA #$a8
1010 : 85 2e __ STA P1 
1012 : a9 09 __ LDA #$09
1014 : 85 2f __ STA P2 
1016 : a9 00 __ LDA #$00
1018 : 85 30 __ STA P3 
101a : 85 31 __ STA P4 
101c : 85 32 __ STA P5 
101e : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
1021 : a5 48 __ LDA T2 + 0 
1023 : 85 2e __ STA P1 
1025 : a5 49 __ LDA T2 + 1 
1027 : 85 2f __ STA P2 
1029 : a9 b8 __ LDA #$b8
102b : 85 30 __ STA P3 
102d : a9 01 __ LDA #$01
102f : 85 31 __ STA P4 
1031 : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
1034 : c6 50 __ DEC T7 + 0 
1036 : d0 d6 __ BNE $100e ; (SetUpSprites.l1033 + 0)
.s62:
1038 : e6 47 __ INC T1 + 0 
103a : a5 47 __ LDA T1 + 0 
103c : c9 02 __ CMP #$02
103e : 90 a7 __ BCC $0fe7 ; (SetUpSprites.l61 + 0)
.s63:
1040 : a9 20 __ LDA #$20
1042 : 85 2d __ STA P0 
1044 : a9 3f __ LDA #$3f
1046 : 85 2e __ STA P1 
1048 : a9 01 __ LDA #$01
104a : 85 2f __ STA P2 
104c : a9 00 __ LDA #$00
104e : 85 30 __ STA P3 
1050 : 85 33 __ STA P6 
1052 : a9 00 __ LDA #$00
1054 : 85 31 __ STA P4 
1056 : a9 20 __ LDA #$20
1058 : 85 32 __ STA P5 
105a : 20 ee 11 JSR $11ee ; (vram_putn.s0 + 0)
105d : a9 33 __ LDA #$33
105f : 85 2d __ STA P0 
1061 : a9 f9 __ LDA #$f9
1063 : 85 2e __ STA P1 
1065 : a9 09 __ LDA #$09
1067 : 85 2f __ STA P2 
1069 : a9 03 __ LDA #$03
106b : 85 31 __ STA P4 
106d : 85 33 __ STA P6 
106f : a9 02 __ LDA #$02
1071 : 85 32 __ STA P5 
1073 : a9 05 __ LDA #$05
1075 : 85 34 __ STA P7 
1077 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
107a : a9 1c __ LDA #$1c
107c : 85 2e __ STA P1 
107e : a9 01 __ LDA #$01
1080 : 85 2f __ STA P2 
1082 : a9 78 __ LDA #$78
1084 : 85 30 __ STA P3 
1086 : a9 00 __ LDA #$00
1088 : 85 31 __ STA P4 
108a : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
108d : a9 20 __ LDA #$20
108f : 85 2d __ STA P0 
1091 : a9 37 __ LDA #$37
1093 : 85 2e __ STA P1 
1095 : a9 00 __ LDA #$00
1097 : 85 30 __ STA P3 
1099 : 85 33 __ STA P6 
109b : a9 08 __ LDA #$08
109d : 85 34 __ STA P7 
109f : a9 00 __ LDA #$00
10a1 : 85 31 __ STA P4 
10a3 : a9 24 __ LDA #$24
10a5 : 85 32 __ STA P5 
10a7 : 20 ee 11 JSR $11ee ; (vram_putn.s0 + 0)
10aa : a9 00 __ LDA #$00
10ac : 85 47 __ STA T1 + 0 
10ae : 85 48 __ STA T2 + 0 
10b0 : 85 49 __ STA T2 + 1 
10b2 : a9 05 __ LDA #$05
10b4 : 85 34 __ STA P7 
10b6 : 18 __ __ CLC
.l1045:
10b7 : a9 b9 __ LDA #$b9
10b9 : 85 2e __ STA P1 
10bb : a9 09 __ LDA #$09
10bd : 85 2f __ STA P2 
10bf : a9 00 __ LDA #$00
10c1 : 85 30 __ STA P3 
10c3 : a9 03 __ LDA #$03
10c5 : 85 31 __ STA P4 
10c7 : 85 32 __ STA P5 
10c9 : 85 33 __ STA P6 
10cb : a5 47 __ LDA T1 + 0 
10cd : 69 34 __ ADC #$34
10cf : 85 2d __ STA P0 
10d1 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
10d4 : a9 f4 __ LDA #$f4
10d6 : 85 2e __ STA P1 
10d8 : a9 00 __ LDA #$00
10da : 85 2f __ STA P2 
10dc : 38 __ __ SEC
10dd : a5 48 __ LDA T2 + 0 
10df : e9 20 __ SBC #$20
10e1 : 85 4a __ STA T3 + 0 
10e3 : 85 30 __ STA P3 
10e5 : a5 49 __ LDA T2 + 1 
10e7 : e9 00 __ SBC #$00
10e9 : 85 4b __ STA T3 + 1 
10eb : 85 31 __ STA P4 
10ed : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
10f0 : a9 b9 __ LDA #$b9
10f2 : 85 2e __ STA P1 
10f4 : a9 09 __ LDA #$09
10f6 : 85 2f __ STA P2 
10f8 : a9 00 __ LDA #$00
10fa : 85 30 __ STA P3 
10fc : a9 03 __ LDA #$03
10fe : 85 31 __ STA P4 
1100 : 18 __ __ CLC
1101 : a5 47 __ LDA T1 + 0 
1103 : 69 3b __ ADC #$3b
1105 : 85 2d __ STA P0 
1107 : 20 77 12 JSR $1277 ; (vera_spr_set.s0 + 0)
110a : a9 40 __ LDA #$40
110c : 85 2e __ STA P1 
110e : a9 01 __ LDA #$01
1110 : 85 2f __ STA P2 
1112 : a5 4a __ LDA T3 + 0 
1114 : 85 30 __ STA P3 
1116 : a5 4b __ LDA T3 + 1 
1118 : 85 31 __ STA P4 
111a : 20 d4 12 JSR $12d4 ; (vera_spr_move.s0 + 0)
111d : 18 __ __ CLC
111e : a5 48 __ LDA T2 + 0 
1120 : 69 40 __ ADC #$40
1122 : 85 48 __ STA T2 + 0 
1124 : 90 02 __ BCC $1128 ; (SetUpSprites.s1048 + 0)
.s1047:
1126 : e6 49 __ INC T2 + 1 
.s1048:
1128 : e6 47 __ INC T1 + 0 
112a : a5 47 __ LDA T1 + 0 
112c : c9 07 __ CMP #$07
112e : 90 87 __ BCC $10b7 ; (SetUpSprites.l1045 + 0)
.s71:
1130 : a9 20 __ LDA #$20
1132 : 85 37 __ STA P10 
1134 : a9 40 __ LDA #$40
1136 : 8d fc 9e STA $9efc ; (sstack + 0)
1139 : a9 fa __ LDA #$fa
113b : 8d fd 9e STA $9efd ; (sstack + 1)
113e : a9 01 __ LDA #$01
1140 : 8d fe 9e STA $9efe ; (sstack + 2)
1143 : a9 00 __ LDA #$00
1145 : 8d ff 9e STA $9eff ; (sstack + 3)
1148 : a9 6e __ LDA #$6e
114a : 85 35 __ STA P8 
114c : a9 17 __ LDA #$17
114e : 85 36 __ STA P9 
1150 : 20 50 12 JSR $1250 ; (SetPaletteColours.s0 + 0)
1153 : a9 60 __ LDA #$60
1155 : 8d fc 9e STA $9efc ; (sstack + 0)
1158 : a9 fa __ LDA #$fa
115a : 8d fd 9e STA $9efd ; (sstack + 1)
115d : a9 01 __ LDA #$01
115f : 8d fe 9e STA $9efe ; (sstack + 2)
1162 : a9 00 __ LDA #$00
1164 : 8d ff 9e STA $9eff ; (sstack + 3)
1167 : a9 8e __ LDA #$8e
1169 : 85 35 __ STA P8 
116b : a9 17 __ LDA #$17
116d : 85 36 __ STA P9 
116f : 20 50 12 JSR $1250 ; (SetPaletteColours.s0 + 0)
1172 : a9 80 __ LDA #$80
1174 : 8d fc 9e STA $9efc ; (sstack + 0)
1177 : a9 fa __ LDA #$fa
1179 : 8d fd 9e STA $9efd ; (sstack + 1)
117c : a9 01 __ LDA #$01
117e : 8d fe 9e STA $9efe ; (sstack + 2)
1181 : a9 00 __ LDA #$00
1183 : 8d ff 9e STA $9eff ; (sstack + 3)
1186 : a9 ae __ LDA #$ae
1188 : 85 35 __ STA P8 
118a : a9 17 __ LDA #$17
118c : 85 36 __ STA P9 
118e : 4c 50 12 JMP $1250 ; (SetPaletteColours.s0 + 0)
.s1017:
1191 : c9 09 __ CMP #$09
1193 : 90 06 __ BCC $119b ; (SetUpSprites.s32 + 0)
.s1016:
1195 : a9 45 __ LDA #$45
1197 : c5 48 __ CMP T2 + 0 
1199 : b0 05 __ BCS $11a0 ; (SetUpSprites.s1005 + 0)
.s32:
119b : a9 04 __ LDA #$04
119d : 4c 2b 0d JMP $0d2b ; (SetUpSprites.s174 + 0)
.s1005:
11a0 : a5 48 __ LDA T2 + 0 
11a2 : c9 13 __ CMP #$13
11a4 : 90 06 __ BCC $11ac ; (SetUpSprites.s36 + 0)
.s1004:
11a6 : a9 3b __ LDA #$3b
11a8 : c5 48 __ CMP T2 + 0 
11aa : b0 05 __ BCS $11b1 ; (SetUpSprites.s1003 + 0)
.s36:
11ac : a9 05 __ LDA #$05
11ae : 4c 1e 0d JMP $0d1e ; (SetUpSprites.s184 + 0)
.s1003:
11b1 : a5 48 __ LDA T2 + 0 
11b3 : c9 1d __ CMP #$1d
11b5 : 90 06 __ BCC $11bd ; (SetUpSprites.s40 + 0)
.s1002:
11b7 : a9 31 __ LDA #$31
11b9 : c5 48 __ CMP T2 + 0 
11bb : b0 05 __ BCS $11c2 ; (SetUpSprites.s41 + 0)
.s40:
11bd : a9 06 __ LDA #$06
11bf : 4c 1e 0d JMP $0d1e ; (SetUpSprites.s184 + 0)
.s41:
11c2 : a9 07 __ LDA #$07
11c4 : 4c 1e 0d JMP $0d1e ; (SetUpSprites.s184 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
11c7 : a5 2d __ LDA P0 ; (bank + 0)
11c9 : 4a __ __ LSR
11ca : a9 00 __ LDA #$00
11cc : 6a __ __ ROR
11cd : 85 3b __ STA ACCU + 0 
11cf : a5 2f __ LDA P2 ; (mem + 1)
11d1 : 29 f8 __ AND #$f8
11d3 : 4a __ __ LSR
11d4 : 05 3b __ ORA ACCU + 0 
11d6 : 85 3b __ STA ACCU + 0 
11d8 : a5 30 __ LDA P3 ; (height + 0)
11da : 0a __ __ ASL
11db : 05 3b __ ORA ACCU + 0 
11dd : 05 31 __ ORA P4 ; (width + 0)
.s1001:
11df : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
11e0 : a5 2d __ LDA P0 ; (bank + 0)
11e2 : 4a __ __ LSR
11e3 : a9 00 __ LDA #$00
11e5 : 6a __ __ ROR
11e6 : 85 3b __ STA ACCU + 0 
11e8 : a5 2f __ LDA P2 ; (mem + 1)
11ea : 4a __ __ LSR
11eb : 05 3b __ ORA ACCU + 0 
.s1001:
11ed : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
11ee : ad 25 9f LDA $9f25 
11f1 : 29 fe __ AND #$fe
11f3 : 8d 25 9f STA $9f25 
11f6 : a5 2d __ LDA P0 ; (addr + 0)
11f8 : 8d 20 9f STA $9f20 
11fb : a5 2e __ LDA P1 ; (addr + 1)
11fd : 8d 21 9f STA $9f21 
1200 : a5 2f __ LDA P2 ; (addr + 2)
1202 : 29 01 __ AND #$01
1204 : 09 10 __ ORA #$10
1206 : 8d 22 9f STA $9f22 
1209 : a5 33 __ LDA P6 ; (size + 0)
120b : 05 34 __ ORA P7 ; (size + 1)
120d : f0 19 __ BEQ $1228 ; (vram_putn.s1001 + 0)
.s6:
120f : a0 00 __ LDY #$00
1211 : a6 33 __ LDX P6 ; (size + 0)
1213 : f0 02 __ BEQ $1217 ; (vram_putn.l1002 + 0)
.s1005:
1215 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1217 : b1 31 __ LDA (P4),y ; (data + 0)
1219 : 8d 23 9f STA $9f23 
121c : c8 __ __ INY
121d : d0 02 __ BNE $1221 ; (vram_putn.s1009 + 0)
.s1008:
121f : e6 32 __ INC P5 ; (data + 1)
.s1009:
1221 : ca __ __ DEX
1222 : d0 f3 __ BNE $1217 ; (vram_putn.l1002 + 0)
.s1004:
1224 : c6 34 __ DEC P7 ; (size + 1)
1226 : d0 ef __ BNE $1217 ; (vram_putn.l1002 + 0)
.s1001:
1228 : 60 __ __ RTS
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
1229 : ad 0d 17 LDA $170d ; (seed + 1)
122c : 4a __ __ LSR
122d : ad 0c 17 LDA $170c ; (seed + 0)
1230 : 6a __ __ ROR
1231 : aa __ __ TAX
1232 : a9 00 __ LDA #$00
1234 : 6a __ __ ROR
1235 : 4d 0c 17 EOR $170c ; (seed + 0)
1238 : 85 3b __ STA ACCU + 0 
123a : 8a __ __ TXA
123b : 4d 0d 17 EOR $170d ; (seed + 1)
123e : 85 3c __ STA ACCU + 1 
1240 : 4a __ __ LSR
1241 : 45 3b __ EOR ACCU + 0 
1243 : 8d 0c 17 STA $170c ; (seed + 0)
1246 : 85 3b __ STA ACCU + 0 
1248 : 45 3c __ EOR ACCU + 1 
124a : 8d 0d 17 STA $170d ; (seed + 1)
124d : 85 3c __ STA ACCU + 1 
.s1001:
124f : 60 __ __ RTS
--------------------------------------------------------------------
seed:
170c : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1250 : ad fc 9e LDA $9efc ; (sstack + 0)
1253 : 85 2d __ STA P0 
1255 : ad fd 9e LDA $9efd ; (sstack + 1)
1258 : 85 2e __ STA P1 
125a : ad fe 9e LDA $9efe ; (sstack + 2)
125d : 85 2f __ STA P2 
125f : ad ff 9e LDA $9eff ; (sstack + 3)
1262 : 85 30 __ STA P3 
1264 : a5 35 __ LDA P8 ; (input + 0)
1266 : 85 31 __ STA P4 
1268 : a5 36 __ LDA P9 ; (input + 1)
126a : 85 32 __ STA P5 
126c : a5 37 __ LDA P10 ; (inputsize + 0)
126e : 85 33 __ STA P6 
1270 : a9 00 __ LDA #$00
1272 : 85 34 __ STA P7 
1274 : 4c ee 11 JMP $11ee ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
170e : __ __ __ BYT 23 02 12 01 01 11 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
171e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
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
1277 : ad 25 9f LDA $9f25 
127a : 29 fe __ AND #$fe
127c : 8d 25 9f STA $9f25 
127f : a5 2d __ LDA P0 ; (spr + 0)
1281 : 0a __ __ ASL
1282 : 0a __ __ ASL
1283 : 85 3b __ STA ACCU + 0 
1285 : a9 3f __ LDA #$3f
1287 : 2a __ __ ROL
1288 : 06 3b __ ASL ACCU + 0 
128a : 2a __ __ ROL
128b : 8d 21 9f STA $9f21 
128e : a5 3b __ LDA ACCU + 0 
1290 : 8d 20 9f STA $9f20 
1293 : a9 11 __ LDA #$11
1295 : 8d 22 9f STA $9f22 
1298 : a5 30 __ LDA P3 ; (mode8 + 0)
129a : f0 02 __ BEQ $129e ; (vera_spr_set.s11 + 0)
.s9:
129c : a9 80 __ LDA #$80
.s11:
129e : 05 2f __ ORA P2 ; (addr32 + 1)
12a0 : a6 2e __ LDX P1 ; (addr32 + 0)
12a2 : 8e 23 9f STX $9f23 
12a5 : 8d 23 9f STA $9f23 
12a8 : a9 00 __ LDA #$00
12aa : 8d 23 9f STA $9f23 
12ad : 8d 23 9f STA $9f23 
12b0 : 8d 23 9f STA $9f23 
12b3 : 8d 23 9f STA $9f23 
12b6 : a5 33 __ LDA P6 ; (z + 0)
12b8 : 0a __ __ ASL
12b9 : 0a __ __ ASL
12ba : 8d 23 9f STA $9f23 
12bd : a5 32 __ LDA P5 ; (h + 0)
12bf : 4a __ __ LSR
12c0 : 6a __ __ ROR
12c1 : 29 80 __ AND #$80
12c3 : 6a __ __ ROR
12c4 : 85 3b __ STA ACCU + 0 
12c6 : a5 31 __ LDA P4 ; (w + 0)
12c8 : 0a __ __ ASL
12c9 : 0a __ __ ASL
12ca : 0a __ __ ASL
12cb : 0a __ __ ASL
12cc : 05 3b __ ORA ACCU + 0 
12ce : 05 34 __ ORA P7 ; (pal + 0)
12d0 : 8d 23 9f STA $9f23 
.s1001:
12d3 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
12d4 : ad 25 9f LDA $9f25 
12d7 : 29 fe __ AND #$fe
12d9 : 8d 25 9f STA $9f25 
12dc : a5 2d __ LDA P0 ; (spr + 0)
12de : 0a __ __ ASL
12df : 0a __ __ ASL
12e0 : 85 3b __ STA ACCU + 0 
12e2 : a9 3f __ LDA #$3f
12e4 : 2a __ __ ROL
12e5 : 06 3b __ ASL ACCU + 0 
12e7 : 2a __ __ ROL
12e8 : aa __ __ TAX
12e9 : a5 3b __ LDA ACCU + 0 
12eb : 09 02 __ ORA #$02
12ed : 8d 20 9f STA $9f20 
12f0 : 8e 21 9f STX $9f21 
12f3 : a9 11 __ LDA #$11
12f5 : 8d 22 9f STA $9f22 
12f8 : a5 2e __ LDA P1 ; (x + 0)
12fa : 8d 23 9f STA $9f23 
12fd : a5 2f __ LDA P2 ; (x + 1)
12ff : 8d 23 9f STA $9f23 
1302 : a5 30 __ LDA P3 ; (y + 0)
1304 : 8d 23 9f STA $9f23 
1307 : a5 31 __ LDA P4 ; (y + 1)
1309 : 8d 23 9f STA $9f23 
.s1001:
130c : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
130d : ad 25 9f LDA $9f25 
1310 : 29 fe __ AND #$fe
1312 : 8d 25 9f STA $9f25 
1315 : a5 2d __ LDA P0 ; (spr + 0)
1317 : 0a __ __ ASL
1318 : 0a __ __ ASL
1319 : 85 3b __ STA ACCU + 0 
131b : a9 3f __ LDA #$3f
131d : 2a __ __ ROL
131e : 06 3b __ ASL ACCU + 0 
1320 : 2a __ __ ROL
1321 : aa __ __ TAX
1322 : a5 3b __ LDA ACCU + 0 
1324 : 09 06 __ ORA #$06
1326 : 8d 20 9f STA $9f20 
1329 : 8e 21 9f STX $9f21 
132c : a9 01 __ LDA #$01
132e : 8d 22 9f STA $9f22 
1331 : ad 23 9f LDA $9f23 
1334 : 29 fc __ AND #$fc
1336 : a8 __ __ TAY
1337 : a5 2e __ LDA P1 ; (fliph + 0)
1339 : f0 01 __ BEQ $133c ; (vera_spr_flip.s14 + 0)
.s6:
133b : c8 __ __ INY
.s14:
133c : a5 2f __ LDA P2 ; (flipv + 0)
133e : f0 05 __ BEQ $1345 ; (vera_spr_flip.s11 + 0)
.s9:
1340 : 98 __ __ TYA
1341 : 09 02 __ ORA #$02
1343 : d0 01 __ BNE $1346 ; (vera_spr_flip.s1002 + 0)
.s11:
1345 : 98 __ __ TYA
.s1002:
1346 : 8d 23 9f STA $9f23 
.s1001:
1349 : 60 __ __ RTS
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
134a : ad 25 9f LDA $9f25 
134d : 29 fe __ AND #$fe
134f : 8d 25 9f STA $9f25 
1352 : a5 2d __ LDA P0 ; (index + 0)
1354 : 0a __ __ ASL
1355 : 8d 20 9f STA $9f20 
1358 : a9 7d __ LDA #$7d
135a : 2a __ __ ROL
135b : 8d 21 9f STA $9f21 
135e : a9 11 __ LDA #$11
1360 : 8d 22 9f STA $9f22 
1363 : a5 30 __ LDA P3 ; (size + 0)
1365 : 05 31 __ ORA P4 ; (size + 1)
1367 : f0 29 __ BEQ $1392 ; (vera_pal_putn.s1001 + 0)
.s6:
1369 : a6 30 __ LDX P3 ; (size + 0)
136b : f0 02 __ BEQ $136f ; (vera_pal_putn.l3 + 0)
.s1003:
136d : e6 31 __ INC P4 ; (size + 1)
.l3:
136f : a0 01 __ LDY #$01
1371 : b1 2e __ LDA (P1),y ; (color + 0)
1373 : 85 3c __ STA ACCU + 1 
1375 : 88 __ __ DEY
1376 : b1 2e __ LDA (P1),y ; (color + 0)
1378 : 8d 23 9f STA $9f23 
137b : a5 3c __ LDA ACCU + 1 
137d : 8d 23 9f STA $9f23 
1380 : 18 __ __ CLC
1381 : a5 2e __ LDA P1 ; (color + 0)
1383 : 69 02 __ ADC #$02
1385 : 85 2e __ STA P1 ; (color + 0)
1387 : 90 02 __ BCC $138b ; (vera_pal_putn.s1007 + 0)
.s1006:
1389 : e6 2f __ INC P2 ; (color + 1)
.s1007:
138b : ca __ __ DEX
138c : d0 e1 __ BNE $136f ; (vera_pal_putn.l3 + 0)
.s1002:
138e : c6 31 __ DEC P4 ; (size + 1)
1390 : d0 dd __ BNE $136f ; (vera_pal_putn.l3 + 0)
.s1001:
1392 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
172e : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 61 01 : ......f.D."...a.
173e : __ __ __ BYT 30 00 c2 02 00 00 00 00 00 00 00 00 00 00 00 00 : 0...............
--------------------------------------------------------------------
VolumeInd:
174e : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
175e : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainEyeBack:
2000 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2010 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2020 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2030 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2040 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2050 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2060 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2070 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2080 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2090 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
20a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
20b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
20c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
20d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
20e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
20f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2100 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2110 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2120 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2130 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2140 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2150 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2160 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2170 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2180 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2190 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
21a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
21b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
21c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
21d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
21e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
21f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2200 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2210 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2220 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2230 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2240 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2250 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2260 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2270 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2280 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2290 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
22a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
22b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
22c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
22d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
22e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
22f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2300 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2310 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2320 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2330 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2350 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2370 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2390 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
23a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
23b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
23c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
23d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
23e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
23f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2400 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2410 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
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
--------------------------------------------------------------------
ButtonStageMax:
176e : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
177e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
178e : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
179e : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
17ae : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
17be : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
p:
17ce : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalTimer:
17d0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
17d2 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
17e2 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1393 : a9 10 __ LDA #$10
1395 : 85 30 __ STA P3 
1397 : a9 00 __ LDA #$00
1399 : 85 31 __ STA P4 
139b : a5 32 __ LDA P5 ; (Palette + 0)
139d : 85 2e __ STA P1 
139f : 85 47 __ STA T0 + 0 
13a1 : a5 33 __ LDA P6 ; (Palette + 1)
13a3 : 85 2f __ STA P2 
13a5 : 85 48 __ STA T0 + 1 
13a7 : ad fc 9e LDA $9efc ; (sstack + 0)
13aa : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
13ac : 0a __ __ ASL
13ad : 85 49 __ STA T2 + 0 
13af : ad fd 9e LDA $9efd ; (sstack + 1)
13b2 : 2a __ __ ROL
13b3 : 18 __ __ CLC
13b4 : 65 33 __ ADC P6 ; (Palette + 1)
13b6 : 85 4a __ STA T2 + 1 
13b8 : a4 32 __ LDY P5 ; (Palette + 0)
13ba : b1 49 __ LDA (T2 + 0),y 
13bc : aa __ __ TAX
13bd : c8 __ __ INY
13be : b1 49 __ LDA (T2 + 0),y 
13c0 : 86 49 __ STX T2 + 0 
13c2 : 85 4a __ STA T2 + 1 
13c4 : a9 00 __ LDA #$00
13c6 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
13c8 : ad fe 9e LDA $9efe ; (sstack + 2)
13cb : 85 4b __ STA T4 + 0 
13cd : 38 __ __ SEC
13ce : e9 01 __ SBC #$01
13d0 : 85 4d __ STA T5 + 0 
13d2 : ad ff 9e LDA $9eff ; (sstack + 3)
13d5 : 85 4c __ STA T4 + 1 
13d7 : e9 00 __ SBC #$00
13d9 : 85 4e __ STA T5 + 1 
13db : d0 06 __ BNE $13e3 ; (SetPaletteIndex.s5 + 0)
.s1004:
13dd : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
13df : c5 4d __ CMP T5 + 0 
13e1 : b0 38 __ BCS $141b ; (SetPaletteIndex.s4 + 0)
.s5:
13e3 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
13e5 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
13e7 : 18 __ __ CLC
13e8 : a5 32 __ LDA P5 ; (Palette + 0)
13ea : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
13ec : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
13ee : a5 33 __ LDA P6 ; (Palette + 1)
13f0 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
13f2 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
13f4 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
13f7 : a0 02 __ LDY #$02
13f9 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
13fb : a0 00 __ LDY #$00
13fd : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
13ff : a0 03 __ LDY #$03
1401 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1403 : a0 01 __ LDY #$01
1405 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1407 : 18 __ __ CLC
1408 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
140a : 69 02 __ ADC #$02
140c : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
140e : 90 02 __ BCC $1412 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1410 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1412 : e8 __ __ INX
1413 : a5 4e __ LDA T5 + 1 
1415 : d0 e0 __ BNE $13f7 ; (SetPaletteIndex.l2 + 0)
.s1002:
1417 : e4 4d __ CPX T5 + 0 
1419 : 90 dc __ BCC $13f7 ; (SetPaletteIndex.l2 + 0)
.s4:
141b : a5 4b __ LDA T4 + 0 
141d : 0a __ __ ASL
141e : aa __ __ TAX
141f : a5 4c __ LDA T4 + 1 
1421 : 2a __ __ ROL
1422 : a8 __ __ TAY
1423 : 8a __ __ TXA
1424 : 38 __ __ SEC
1425 : e9 02 __ SBC #$02
1427 : b0 01 __ BCS $142a ; (SetPaletteIndex.s1010 + 0)
.s1009:
1429 : 88 __ __ DEY
.s1010:
142a : 18 __ __ CLC
142b : 65 47 __ ADC T0 + 0 
142d : 85 47 __ STA T0 + 0 
142f : 98 __ __ TYA
1430 : 65 48 __ ADC T0 + 1 
1432 : 85 48 __ STA T0 + 1 
1434 : a5 49 __ LDA T2 + 0 
1436 : a0 00 __ LDY #$00
1438 : 91 47 __ STA (T0 + 0),y 
143a : a5 4a __ LDA T2 + 1 
143c : c8 __ __ INY
143d : 91 47 __ STA (T0 + 0),y 
143f : a5 34 __ LDA P7 ; (index + 0)
1441 : 85 2d __ STA P0 
1443 : 4c 4a 13 JMP $134a ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
17f2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
2c00 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
2c10 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
17f4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPalShimmer:
2c20 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
2c30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
zsm_check:
.s0:
1446 : ad 0b 17 LDA $170b ; (zsm_finished + 0)
.s1001:
1449 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
144a : a9 01 __ LDA #$01
144c : 8d 0b 17 STA $170b ; (zsm_finished + 0)
144f : ad f5 17 LDA $17f5 ; (zsm_reading + 0)
1452 : f0 0a __ BEQ $145e ; (zsm_init.s3 + 0)
.s1:
1454 : a9 02 __ LDA #$02
1456 : 20 a3 14 JSR $14a3 ; (krnio_close.s1000 + 0)
1459 : a9 00 __ LDA #$00
145b : 8d f5 17 STA $17f5 ; (zsm_reading + 0)
.s3:
145e : 8d fc 17 STA $17fc ; (zsm_pos + 0)
1461 : 8d fd 17 STA $17fd ; (zsm_pos + 1)
1464 : 8d fe 17 STA $17fe ; (zsm_wpos + 0)
1467 : 8d ff 17 STA $17ff ; (zsm_wpos + 1)
146a : 8d fb 17 STA $17fb ; (zsm_delay + 0)
146d : a5 30 __ LDA P3 ; (fname + 0)
146f : 85 2d __ STA P0 
1471 : a5 31 __ LDA P4 ; (fname + 1)
1473 : 85 2e __ STA P1 
1475 : 20 ab 14 JSR $14ab ; (krnio_setnam.s0 + 0)
1478 : a9 02 __ LDA #$02
147a : 85 2d __ STA P0 
147c : 85 2f __ STA P2 
147e : a9 08 __ LDA #$08
1480 : 85 2e __ STA P1 
1482 : 20 c1 14 JSR $14c1 ; (krnio_open.s0 + 0)
1485 : a5 3b __ LDA ACCU + 0 
1487 : f0 19 __ BEQ $14a2 ; (zsm_init.s1001 + 0)
.s4:
1489 : a9 01 __ LDA #$01
148b : 8d f5 17 STA $17f5 ; (zsm_reading + 0)
148e : 20 e9 14 JSR $14e9 ; (zsm_fill.s0 + 0)
1491 : a9 10 __ LDA #$10
1493 : 8d fc 17 STA $17fc ; (zsm_pos + 0)
1496 : a9 00 __ LDA #$00
1498 : 8d fd 17 STA $17fd ; (zsm_pos + 1)
149b : 8d 0b 17 STA $170b ; (zsm_finished + 0)
149e : a9 01 __ LDA #$01
14a0 : 85 3b __ STA ACCU + 0 
.s1001:
14a2 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
17f5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
14a3 : 85 2d __ STA P0 
.s0:
14a5 : a5 2d __ LDA P0 
14a7 : 20 c3 ff JSR $ffc3 
.s1001:
14aa : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
17fe : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
14ab : a5 2d __ LDA P0 
14ad : 05 2e __ ORA P1 
14af : f0 08 __ BEQ $14b9 ; (krnio_setnam.s0 + 14)
14b1 : a0 ff __ LDY #$ff
14b3 : c8 __ __ INY
14b4 : b1 2d __ LDA (P0),y 
14b6 : d0 fb __ BNE $14b3 ; (krnio_setnam.s0 + 8)
14b8 : 98 __ __ TYA
14b9 : a6 2d __ LDX P0 
14bb : a4 2e __ LDY P1 
14bd : 20 bd ff JSR $ffbd 
.s1001:
14c0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
14c1 : a9 00 __ LDA #$00
14c3 : a6 2d __ LDX P0 ; (fnum + 0)
14c5 : 9d 7b 30 STA $307b,x ; (krnio_pstatus + 0)
14c8 : a9 00 __ LDA #$00
14ca : 85 3b __ STA ACCU + 0 
14cc : 85 3c __ STA ACCU + 1 
14ce : a5 2d __ LDA P0 ; (fnum + 0)
14d0 : a6 2e __ LDX P1 
14d2 : a4 2f __ LDY P2 
14d4 : 20 ba ff JSR $ffba 
14d7 : 20 c0 ff JSR $ffc0 
14da : 90 08 __ BCC $14e4 ; (krnio_open.s0 + 35)
14dc : a5 2d __ LDA P0 ; (fnum + 0)
14de : 20 c3 ff JSR $ffc3 
14e1 : 4c e8 14 JMP $14e8 ; (krnio_open.s1001 + 0)
14e4 : a9 01 __ LDA #$01
14e6 : 85 3b __ STA ACCU + 0 
.s1001:
14e8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
307b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
14e9 : ad f5 17 LDA $17f5 ; (zsm_reading + 0)
14ec : f0 20 __ BEQ $150e ; (zsm_fill.s1 + 0)
.s2:
14ee : ad fd 17 LDA $17fd ; (zsm_pos + 1)
14f1 : 18 __ __ CLC
14f2 : 69 04 __ ADC #$04
14f4 : cd ff 17 CMP $17ff ; (zsm_wpos + 1)
14f7 : d0 0c __ BNE $1505 ; (zsm_fill.s6 + 0)
.s1006:
14f9 : ad fe 17 LDA $17fe ; (zsm_wpos + 0)
14fc : cd fc 17 CMP $17fc ; (zsm_pos + 0)
14ff : d0 04 __ BNE $1505 ; (zsm_fill.s6 + 0)
.s5:
1501 : a9 00 __ LDA #$00
1503 : f0 0b __ BEQ $1510 ; (zsm_fill.s1008 + 0)
.s6:
1505 : a9 02 __ LDA #$02
1507 : 20 8d 15 JSR $158d ; (krnio_chkin.s1000 + 0)
150a : a5 3b __ LDA ACCU + 0 
150c : d0 07 __ BNE $1515 ; (zsm_fill.s9 + 0)
.s1:
150e : a9 ff __ LDA #$ff
.s1008:
1510 : 85 3b __ STA ACCU + 0 
.s1001:
1512 : 85 3c __ STA ACCU + 1 
1514 : 60 __ __ RTS
.s9:
1515 : a9 00 __ LDA #$00
1517 : 85 47 __ STA T1 + 0 
1519 : 85 48 __ STA T1 + 1 
151b : ad fd 17 LDA $17fd ; (zsm_pos + 1)
151e : 18 __ __ CLC
151f : 69 04 __ ADC #$04
1521 : cd ff 17 CMP $17ff ; (zsm_wpos + 1)
1524 : d0 08 __ BNE $152e ; (zsm_fill.l13 + 0)
.s1002:
1526 : ad fe 17 LDA $17fe ; (zsm_wpos + 0)
1529 : cd fc 17 CMP $17fc ; (zsm_pos + 0)
152c : f0 49 __ BEQ $1577 ; (zsm_fill.s37 + 0)
.l13:
152e : 20 9f 15 JSR $159f ; (krnio_chrin.s0 + 0)
1531 : ad fe 17 LDA $17fe ; (zsm_wpos + 0)
1534 : aa __ __ TAX
1535 : 18 __ __ CLC
1536 : 69 01 __ ADC #$01
1538 : 8d fe 17 STA $17fe ; (zsm_wpos + 0)
153b : ad ff 17 LDA $17ff ; (zsm_wpos + 1)
153e : a8 __ __ TAY
153f : 69 00 __ ADC #$00
1541 : 8d ff 17 STA $17ff ; (zsm_wpos + 1)
1544 : 8a __ __ TXA
1545 : 18 __ __ CLC
1546 : 69 7b __ ADC #$7b
1548 : 85 49 __ STA T3 + 0 
154a : 98 __ __ TYA
154b : 29 03 __ AND #$03
154d : 69 2c __ ADC #$2c
154f : 85 4a __ STA T3 + 1 
1551 : a5 3b __ LDA ACCU + 0 
1553 : a0 00 __ LDY #$00
1555 : 91 49 __ STA (T3 + 0),y 
1557 : e6 47 __ INC T1 + 0 
1559 : d0 02 __ BNE $155d ; (zsm_fill.s1010 + 0)
.s1009:
155b : e6 48 __ INC T1 + 1 
.s1010:
155d : 20 a9 15 JSR $15a9 ; (krnio_status.s0 + 0)
1560 : a5 3b __ LDA ACCU + 0 
1562 : d0 0e __ BNE $1572 ; (zsm_fill.s15 + 0)
.s12:
1564 : ad fd 17 LDA $17fd ; (zsm_pos + 1)
1567 : 18 __ __ CLC
1568 : 69 04 __ ADC #$04
156a : cd ff 17 CMP $17ff ; (zsm_wpos + 1)
156d : d0 bf __ BNE $152e ; (zsm_fill.l13 + 0)
156f : 4c 26 15 JMP $1526 ; (zsm_fill.s1002 + 0)
.s15:
1572 : a9 00 __ LDA #$00
1574 : 8d f5 17 STA $17f5 ; (zsm_reading + 0)
.s37:
1577 : 20 b3 15 JSR $15b3 ; (krnio_clrchn.s0 + 0)
157a : ad f5 17 LDA $17f5 ; (zsm_reading + 0)
157d : d0 05 __ BNE $1584 ; (zsm_fill.s21 + 0)
.s19:
157f : a9 02 __ LDA #$02
1581 : 20 a3 14 JSR $14a3 ; (krnio_close.s1000 + 0)
.s21:
1584 : a5 47 __ LDA T1 + 0 
1586 : 85 3b __ STA ACCU + 0 
1588 : a5 48 __ LDA T1 + 1 
158a : 4c 12 15 JMP $1512 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
158d : 85 2d __ STA P0 
.s0:
158f : a6 2d __ LDX P0 
1591 : 20 c6 ff JSR $ffc6 
1594 : a9 00 __ LDA #$00
1596 : 85 3c __ STA ACCU + 1 
1598 : b0 02 __ BCS $159c ; (krnio_chkin.s0 + 13)
159a : a9 01 __ LDA #$01
159c : 85 3b __ STA ACCU + 0 
.s1001:
159e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
159f : 20 cf ff JSR $ffcf 
15a2 : 85 3b __ STA ACCU + 0 
15a4 : a9 00 __ LDA #$00
15a6 : 85 3c __ STA ACCU + 1 
.s1001:
15a8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
15a9 : 20 b7 ff JSR $ffb7 
15ac : 85 3b __ STA ACCU + 0 
15ae : a9 00 __ LDA #$00
15b0 : 85 3c __ STA ACCU + 1 
.s1001:
15b2 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
15b3 : 20 cc ff JSR $ffcc 
.s1001:
15b6 : 60 __ __ RTS
--------------------------------------------------------------------
15b7 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
15c7 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
15d5 : 20 f1 15 JSR $15f1 ; (getchx.s0 + 0)
15d8 : a5 3c __ LDA ACCU + 1 
15da : d0 10 __ BNE $15ec ; (Control.s3 + 0)
.s1005:
15dc : a5 3b __ LDA ACCU + 0 
15de : c9 20 __ CMP #$20
15e0 : d0 0a __ BNE $15ec ; (Control.s3 + 0)
.s1:
15e2 : a9 00 __ LDA #$00
15e4 : c5 2e __ CMP P1 ; (playing + 0)
15e6 : 2a __ __ ROL
15e7 : 85 2e __ STA P1 ; (playing + 0)
15e9 : 20 2c 16 JSR $162c ; (zsm_irq_play.s0 + 0)
.s3:
15ec : a5 2e __ LDA P1 ; (playing + 0)
15ee : 85 3b __ STA ACCU + 0 
.s1001:
15f0 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
15f1 : 20 fb 15 JSR $15fb ; (getpch + 0)
15f4 : 85 3b __ STA ACCU + 0 
15f6 : a9 00 __ LDA #$00
15f8 : 85 3c __ STA ACCU + 1 
.s1001:
15fa : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
15fb : 20 e4 ff JSR $ffe4 
15fe : ae f6 17 LDX $17f6 ; (giocharmap + 0)
1601 : e0 01 __ CPX #$01
1603 : 90 26 __ BCC $162b ; (getpch + 48)
1605 : c9 0d __ CMP #$0d
1607 : d0 02 __ BNE $160b ; (getpch + 16)
1609 : a9 0a __ LDA #$0a
160b : e0 02 __ CPX #$02
160d : 90 1c __ BCC $162b ; (getpch + 48)
160f : c9 db __ CMP #$db
1611 : b0 18 __ BCS $162b ; (getpch + 48)
1613 : c9 41 __ CMP #$41
1615 : 90 14 __ BCC $162b ; (getpch + 48)
1617 : c9 c1 __ CMP #$c1
1619 : 90 02 __ BCC $161d ; (getpch + 34)
161b : 49 a0 __ EOR #$a0
161d : c9 7b __ CMP #$7b
161f : b0 0a __ BCS $162b ; (getpch + 48)
1621 : c9 61 __ CMP #$61
1623 : b0 04 __ BCS $1629 ; (getpch + 46)
1625 : c9 5b __ CMP #$5b
1627 : b0 02 __ BCS $162b ; (getpch + 48)
1629 : 49 20 __ EOR #$20
162b : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
17f6 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
162c : 8d 0a 17 STA $170a ; (zsm_playing + 0)
.s1001:
162f : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
17f7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
308b : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
2c40 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
2c50 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
2c60 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
2c70 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
1630 : ad 26 9f LDA $9f26 
1633 : 29 40 __ AND #$40
1635 : d0 f9 __ BNE $1630 ; (frame_wait.l1 + 0)
.l4:
1637 : ad 26 9f LDA $9f26 
163a : 29 40 __ AND #$40
163c : f0 f9 __ BEQ $1637 ; (frame_wait.l4 + 0)
.s1001:
163e : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
163f : 38 __ __ SEC
1640 : a9 00 __ LDA #$00
1642 : e5 3b __ SBC ACCU + 0 
1644 : 85 3b __ STA ACCU + 0 
1646 : a9 00 __ LDA #$00
1648 : e5 3c __ SBC ACCU + 1 
164a : 85 3c __ STA ACCU + 1 
164c : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
164d : 38 __ __ SEC
164e : a9 00 __ LDA #$00
1650 : e5 23 __ SBC WORK + 0 
1652 : 85 23 __ STA WORK + 0 
1654 : a9 00 __ LDA #$00
1656 : e5 24 __ SBC WORK + 1 
1658 : 85 24 __ STA WORK + 1 
165a : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
165b : a5 3c __ LDA ACCU + 1 
165d : d0 31 __ BNE $1690 ; (divmod + 53)
165f : a5 24 __ LDA WORK + 1 
1661 : d0 1e __ BNE $1681 ; (divmod + 38)
1663 : 85 26 __ STA WORK + 3 
1665 : a2 04 __ LDX #$04
1667 : 06 3b __ ASL ACCU + 0 
1669 : 2a __ __ ROL
166a : c5 23 __ CMP WORK + 0 
166c : 90 02 __ BCC $1670 ; (divmod + 21)
166e : e5 23 __ SBC WORK + 0 
1670 : 26 3b __ ROL ACCU + 0 
1672 : 2a __ __ ROL
1673 : c5 23 __ CMP WORK + 0 
1675 : 90 02 __ BCC $1679 ; (divmod + 30)
1677 : e5 23 __ SBC WORK + 0 
1679 : 26 3b __ ROL ACCU + 0 
167b : ca __ __ DEX
167c : d0 eb __ BNE $1669 ; (divmod + 14)
167e : 85 25 __ STA WORK + 2 
1680 : 60 __ __ RTS
1681 : a5 3b __ LDA ACCU + 0 
1683 : 85 25 __ STA WORK + 2 
1685 : a5 3c __ LDA ACCU + 1 
1687 : 85 26 __ STA WORK + 3 
1689 : a9 00 __ LDA #$00
168b : 85 3b __ STA ACCU + 0 
168d : 85 3c __ STA ACCU + 1 
168f : 60 __ __ RTS
1690 : a5 24 __ LDA WORK + 1 
1692 : d0 1f __ BNE $16b3 ; (divmod + 88)
1694 : a5 23 __ LDA WORK + 0 
1696 : 30 1b __ BMI $16b3 ; (divmod + 88)
1698 : a9 00 __ LDA #$00
169a : 85 26 __ STA WORK + 3 
169c : a2 10 __ LDX #$10
169e : 06 3b __ ASL ACCU + 0 
16a0 : 26 3c __ ROL ACCU + 1 
16a2 : 2a __ __ ROL
16a3 : c5 23 __ CMP WORK + 0 
16a5 : 90 02 __ BCC $16a9 ; (divmod + 78)
16a7 : e5 23 __ SBC WORK + 0 
16a9 : 26 3b __ ROL ACCU + 0 
16ab : 26 3c __ ROL ACCU + 1 
16ad : ca __ __ DEX
16ae : d0 f2 __ BNE $16a2 ; (divmod + 71)
16b0 : 85 25 __ STA WORK + 2 
16b2 : 60 __ __ RTS
16b3 : a9 00 __ LDA #$00
16b5 : 85 25 __ STA WORK + 2 
16b7 : 85 26 __ STA WORK + 3 
16b9 : 84 22 __ STY $22 
16bb : a0 10 __ LDY #$10
16bd : 18 __ __ CLC
16be : 26 3b __ ROL ACCU + 0 
16c0 : 26 3c __ ROL ACCU + 1 
16c2 : 26 25 __ ROL WORK + 2 
16c4 : 26 26 __ ROL WORK + 3 
16c6 : 38 __ __ SEC
16c7 : a5 25 __ LDA WORK + 2 
16c9 : e5 23 __ SBC WORK + 0 
16cb : aa __ __ TAX
16cc : a5 26 __ LDA WORK + 3 
16ce : e5 24 __ SBC WORK + 1 
16d0 : 90 04 __ BCC $16d6 ; (divmod + 123)
16d2 : 86 25 __ STX WORK + 2 
16d4 : 85 26 __ STA WORK + 3 
16d6 : 88 __ __ DEY
16d7 : d0 e5 __ BNE $16be ; (divmod + 99)
16d9 : 26 3b __ ROL ACCU + 0 
16db : 26 3c __ ROL ACCU + 1 
16dd : a4 22 __ LDY $22 
16df : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
16e0 : 24 3c __ BIT ACCU + 1 
16e2 : 10 0d __ BPL $16f1 ; (mods16 + 17)
16e4 : 20 3f 16 JSR $163f ; (negaccu + 0)
16e7 : 24 24 __ BIT WORK + 1 
16e9 : 10 0d __ BPL $16f8 ; (mods16 + 24)
16eb : 20 4d 16 JSR $164d ; (negtmp + 0)
16ee : 4c 5b 16 JMP $165b ; (divmod + 0)
16f1 : 24 24 __ BIT WORK + 1 
16f3 : 10 f9 __ BPL $16ee ; (mods16 + 14)
16f5 : 20 4d 16 JSR $164d ; (negtmp + 0)
16f8 : 20 5b 16 JSR $165b ; (divmod + 0)
16fb : 38 __ __ SEC
16fc : a9 00 __ LDA #$00
16fe : e5 25 __ SBC WORK + 2 
1700 : 85 25 __ STA WORK + 2 
1702 : a9 00 __ LDA #$00
1704 : e5 26 __ SBC WORK + 3 
1706 : 85 26 __ STA WORK + 3 
1708 : 60 __ __ RTS
