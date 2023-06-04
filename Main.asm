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
080e : 8e 0f 22 STX $220f ; (spentry + 0)
0811 : a9 be __ LDA #$be
0813 : 85 39 __ STA IP + 0 
0815 : a9 5b __ LDA #$5b
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 5f __ LDA #$5f
081c : e9 5b __ SBC #$5b
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
0830 : a9 be __ LDA #$be
0832 : e9 be __ SBC #$be
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
220f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 23 0c JSR $0c23 ; (zsm_irq_init.s0 + 0)
0883 : 20 fc 0d JSR $0dfc ; (ClearVERAScreen.s0 + 0)
0886 : 20 3f 0e JSR $0e3f ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9f __ LDA #$9f
0893 : 8d 2a 9f STA $9f2a 
0896 : ad 25 9f LDA $9f25 
0899 : 29 fd __ AND #$fd
089b : 8d 25 9f STA $9f25 
089e : a9 7e __ LDA #$7e
08a0 : 8d 39 9f STA $9f39 
08a3 : a9 00 __ LDA #$00
08a5 : 8d 3a 9f STA $9f3a 
08a8 : ad 25 9f LDA $9f25 
08ab : 29 fe __ AND #$fe
08ad : 8d 25 9f STA $9f25 
08b0 : a9 00 __ LDA #$00
08b2 : 8d 20 9f STA $9f20 
08b5 : a9 b0 __ LDA #$b0
08b7 : 8d 21 9f STA $9f21 
08ba : a9 11 __ LDA #$11
08bc : 8d 22 9f STA $9f22 
08bf : a9 01 __ LDA #$01
08c1 : 8d 22 9f STA $9f22 
08c4 : ad 22 9f LDA $9f22 
08c7 : 09 20 __ ORA #$20
08c9 : 8d 22 9f STA $9f22 
08cc : a9 20 __ LDA #$20
08ce : 85 37 __ STA P10 
08d0 : a9 00 __ LDA #$00
08d2 : 8d fc 9e STA $9efc ; (sstack + 0)
08d5 : 8d ff 9e STA $9eff ; (sstack + 3)
08d8 : a9 fa __ LDA #$fa
08da : 8d fd 9e STA $9efd ; (sstack + 1)
08dd : a9 01 __ LDA #$01
08df : 8d fe 9e STA $9efe ; (sstack + 2)
08e2 : a9 80 __ LDA #$80
08e4 : 85 35 __ STA P8 
08e6 : a9 49 __ LDA #$49
08e8 : 85 36 __ STA P9 
08ea : 20 02 1a JSR $1a02 ; (SetPaletteColours.s0 + 0)
08ed : a9 00 __ LDA #$00
08ef : 85 52 __ STA T1 + 0 
08f1 : 85 53 __ STA T1 + 1 
08f3 : 85 54 __ STA T2 + 0 
08f5 : 85 55 __ STA T3 + 0 
08f7 : 85 56 __ STA T4 + 0 
.l3:
08f9 : 20 8c 1b JSR $1b8c ; (getchx.s0 + 0)
08fc : a5 3b __ LDA ACCU + 0 
08fe : 85 57 __ STA T5 + 0 
0900 : a9 30 __ LDA #$30
0902 : 8d 2c 9f STA $9f2c 
0905 : ee f6 27 INC $27f6 ; (p + 0)
0908 : d0 03 __ BNE $090d ; (main.s1023 + 0)
.s1022:
090a : ee f7 27 INC $27f7 ; (p + 1)
.s1023:
090d : ad f8 27 LDA $27f8 ; (Phase + 0)
0910 : 18 __ __ CLC
0911 : 69 01 __ ADC #$01
0913 : 85 32 __ STA P5 
0915 : 8d f8 27 STA $27f8 ; (Phase + 0)
0918 : ad f9 27 LDA $27f9 ; (Phase + 1)
091b : 69 00 __ ADC #$00
091d : 85 33 __ STA P6 
091f : 8d f9 27 STA $27f9 ; (Phase + 1)
0922 : ad fa 27 LDA $27fa ; (Phase2 + 0)
0925 : 18 __ __ CLC
0926 : 69 01 __ ADC #$01
0928 : 85 34 __ STA P7 
092a : 8d fa 27 STA $27fa ; (Phase2 + 0)
092d : ad fb 27 LDA $27fb ; (Phase2 + 1)
0930 : 69 00 __ ADC #$00
0932 : 85 35 __ STA P8 
0934 : 8d fb 27 STA $27fb ; (Phase2 + 1)
0937 : ad fc 27 LDA $27fc ; (Phase3 + 0)
093a : 18 __ __ CLC
093b : 69 01 __ ADC #$01
093d : 85 36 __ STA P9 
093f : 8d fc 27 STA $27fc ; (Phase3 + 0)
0942 : ad fd 27 LDA $27fd ; (Phase3 + 1)
0945 : 69 00 __ ADC #$00
0947 : 85 37 __ STA P10 
0949 : 8d fd 27 STA $27fd ; (Phase3 + 1)
094c : 20 c7 1b JSR $1bc7 ; (MoveSprites.s0 + 0)
094f : a5 55 __ LDA T3 + 0 
0951 : c9 01 __ CMP #$01
0953 : d0 03 __ BNE $0958 ; (main.s6 + 0)
0955 : 4c fc 0b JMP $0bfc ; (main.s5 + 0)
.s6:
0958 : a9 00 __ LDA #$00
095a : 8d a2 49 STA $49a2 ; (PalTimer + 0)
095d : 8d a3 49 STA $49a3 ; (PalTimer + 1)
0960 : a9 20 __ LDA #$20
0962 : 85 37 __ STA P10 
0964 : a9 a0 __ LDA #$a0
0966 : 8d fc 9e STA $9efc ; (sstack + 0)
0969 : a9 fa __ LDA #$fa
096b : 8d fd 9e STA $9efd ; (sstack + 1)
096e : a9 01 __ LDA #$01
0970 : 8d fe 9e STA $9efe ; (sstack + 2)
0973 : a9 00 __ LDA #$00
0975 : 8d ff 9e STA $9eff ; (sstack + 3)
0978 : a9 a4 __ LDA #$a4
097a : 85 35 __ STA P8 
097c : a9 49 __ LDA #$49
097e : 85 36 __ STA P9 
0980 : 20 02 1a JSR $1a02 ; (SetPaletteColours.s0 + 0)
.s69:
0983 : e6 56 __ INC T4 + 0 
0985 : a9 02 __ LDA #$02
0987 : c5 56 __ CMP T4 + 0 
0989 : b0 2d __ BCS $09b8 ; (main.s70 + 0)
.s8:
098b : a9 10 __ LDA #$10
098d : 85 34 __ STA P7 
098f : a9 00 __ LDA #$00
0991 : 85 35 __ STA P8 
0993 : 85 36 __ STA P9 
0995 : 85 37 __ STA P10 
0997 : a9 06 __ LDA #$06
0999 : 8d fc 9e STA $9efc ; (sstack + 0)
099c : a9 00 __ LDA #$00
099e : 8d fd 9e STA $9efd ; (sstack + 1)
09a1 : 8d ff 9e STA $9eff ; (sstack + 3)
09a4 : a9 0a __ LDA #$0a
09a6 : 8d fe 9e STA $9efe ; (sstack + 2)
09a9 : a9 00 __ LDA #$00
09ab : 85 32 __ STA P5 
09ad : a9 2b __ LDA #$2b
09af : 85 33 __ STA P6 
09b1 : 20 e6 1f JSR $1fe6 ; (SetPaletteIndex.s0 + 0)
09b4 : a9 00 __ LDA #$00
09b6 : 85 56 __ STA T4 + 0 
.s70:
09b8 : ad a3 49 LDA $49a3 ; (PalTimer + 1)
09bb : 30 5f __ BMI $0a1c ; (main.s13 + 0)
.s1016:
09bd : d0 07 __ BNE $09c6 ; (main.s11 + 0)
.s1015:
09bf : a9 03 __ LDA #$03
09c1 : cd a2 49 CMP $49a2 ; (PalTimer + 0)
09c4 : b0 56 __ BCS $0a1c ; (main.s13 + 0)
.s11:
09c6 : a9 60 __ LDA #$60
09c8 : 85 34 __ STA P7 
09ca : a9 00 __ LDA #$00
09cc : 85 35 __ STA P8 
09ce : 85 36 __ STA P9 
09d0 : 85 37 __ STA P10 
09d2 : 8d fc 9e STA $9efc ; (sstack + 0)
09d5 : 8d fd 9e STA $9efd ; (sstack + 1)
09d8 : a9 05 __ LDA #$05
09da : 8d fe 9e STA $9efe ; (sstack + 2)
09dd : a9 00 __ LDA #$00
09df : 8d ff 9e STA $9eff ; (sstack + 3)
09e2 : ee c4 49 INC $49c4 ; (PalIndex + 0)
09e5 : d0 03 __ BNE $09ea ; (main.s1027 + 0)
.s1026:
09e7 : ee c5 49 INC $49c5 ; (PalIndex + 1)
.s1027:
09ea : a9 00 __ LDA #$00
09ec : 85 32 __ STA P5 
09ee : a9 45 __ LDA #$45
09f0 : 85 33 __ STA P6 
09f2 : 20 e6 1f JSR $1fe6 ; (SetPaletteIndex.s0 + 0)
09f5 : a9 50 __ LDA #$50
09f7 : 85 34 __ STA P7 
09f9 : a9 00 __ LDA #$00
09fb : 8d fc 9e STA $9efc ; (sstack + 0)
09fe : 8d fd 9e STA $9efd ; (sstack + 1)
0a01 : 8d ff 9e STA $9eff ; (sstack + 3)
0a04 : a9 10 __ LDA #$10
0a06 : 8d fe 9e STA $9efe ; (sstack + 2)
0a09 : a9 c6 __ LDA #$c6
0a0b : 85 32 __ STA P5 
0a0d : a9 49 __ LDA #$49
0a0f : 85 33 __ STA P6 
0a11 : 20 e6 1f JSR $1fe6 ; (SetPaletteIndex.s0 + 0)
0a14 : a9 00 __ LDA #$00
0a16 : 8d a2 49 STA $49a2 ; (PalTimer + 0)
0a19 : 8d a3 49 STA $49a3 ; (PalTimer + 1)
.s13:
0a1c : a9 03 __ LDA #$03
0a1e : 8d 2c 9f STA $9f2c 
0a21 : a5 57 __ LDA T5 + 0 
0a23 : c9 44 __ CMP #$44
0a25 : d0 0c __ BNE $0a33 ; (main.s15 + 0)
.s17:
0a27 : a5 54 __ LDA T2 + 0 
0a29 : cd e6 49 CMP $49e6 ; (MaxSong + 0)
0a2c : b0 03 __ BCS $0a31 ; (main.s1021 + 0)
0a2e : 4c f7 0b JMP $0bf7 ; (main.s14 + 0)
.s1021:
0a31 : a5 57 __ LDA T5 + 0 
.s15:
0a33 : c9 41 __ CMP #$41
0a35 : d0 23 __ BNE $0a5a ; (main.s16 + 0)
.s1008:
0a37 : a9 01 __ LDA #$01
0a39 : c5 54 __ CMP T2 + 0 
0a3b : b0 1d __ BCS $0a5a ; (main.s16 + 0)
.s18:
0a3d : c6 54 __ DEC T2 + 0 
.s83:
0a3f : 20 99 20 JSR $2099 ; (ResetChars.s0 + 0)
0a42 : a9 00 __ LDA #$00
0a44 : 8d e7 49 STA $49e7 ; (off1 + 0)
0a47 : 8d e8 49 STA $49e8 ; (off1 + 1)
0a4a : a9 80 __ LDA #$80
0a4c : 8d 37 9f STA $9f37 
0a4f : a9 fd __ LDA #$fd
0a51 : 8d 38 9f STA $9f38 
0a54 : a9 00 __ LDA #$00
0a56 : 85 52 __ STA T1 + 0 
0a58 : 85 53 __ STA T1 + 1 
.s16:
0a5a : a5 55 __ LDA T3 + 0 
0a5c : 85 30 __ STA P3 
0a5e : a5 57 __ LDA T5 + 0 
0a60 : 85 31 __ STA P4 
0a62 : 20 be 20 JSR $20be ; (Control.s0 + 0)
0a65 : a5 3b __ LDA ACCU + 0 
0a67 : 85 55 __ STA T3 + 0 
0a69 : 38 __ __ SEC
0a6a : a5 52 __ LDA T1 + 0 
0a6c : e9 80 __ SBC #$80
0a6e : 8d 37 9f STA $9f37 
0a71 : a5 53 __ LDA T1 + 1 
0a73 : e9 02 __ SBC #$02
0a75 : 8d 38 9f STA $9f38 
0a78 : ad fe 27 LDA $27fe ; (FrameCount + 0)
0a7b : 85 3b __ STA ACCU + 0 
0a7d : ad ff 27 LDA $27ff ; (FrameCount + 1)
0a80 : 85 3c __ STA ACCU + 1 
0a82 : a9 08 __ LDA #$08
0a84 : 85 23 __ STA WORK + 0 
0a86 : a9 00 __ LDA #$00
0a88 : 85 24 __ STA WORK + 1 
0a8a : 20 e6 21 JSR $21e6 ; (mods16 + 0)
0a8d : a5 26 __ LDA WORK + 3 
0a8f : f0 03 __ BEQ $0a94 ; (main.s1007 + 0)
0a91 : 4c 59 0b JMP $0b59 ; (main.s24 + 0)
.s1007:
0a94 : a5 25 __ LDA WORK + 2 
0a96 : c9 01 __ CMP #$01
0a98 : f0 03 __ BEQ $0a9d ; (main.s22 + 0)
0a9a : 4c 59 0b JMP $0b59 ; (main.s24 + 0)
.s22:
0a9d : ad e7 49 LDA $49e7 ; (off1 + 0)
0aa0 : 85 57 __ STA T5 + 0 
0aa2 : 29 7f __ AND #$7f
0aa4 : 0a __ __ ASL
0aa5 : 8d 20 9f STA $9f20 
0aa8 : ad 25 9f LDA $9f25 
0aab : 29 fe __ AND #$fe
0aad : 8d 25 9f STA $9f25 
0ab0 : a9 b0 __ LDA #$b0
0ab2 : 8d 21 9f STA $9f21 
0ab5 : a9 11 __ LDA #$11
0ab7 : 8d 22 9f STA $9f22 
0aba : a5 54 __ LDA T2 + 0 
0abc : c9 03 __ CMP #$03
0abe : d0 1c __ BNE $0adc ; (main.s1005 + 0)
.s42:
0ac0 : a5 57 __ LDA T5 + 0 
0ac2 : 85 3b __ STA ACCU + 0 
0ac4 : ad e8 49 LDA $49e8 ; (off1 + 1)
0ac7 : 85 3c __ STA ACCU + 1 
0ac9 : a9 c3 __ LDA #$c3
0acb : 85 23 __ STA WORK + 0 
0acd : a9 00 __ LDA #$00
0acf : 85 24 __ STA WORK + 1 
0ad1 : 20 61 21 JSR $2161 ; (divmod + 0)
0ad4 : a6 25 __ LDX WORK + 2 
0ad6 : bd 00 5a LDA $5a00,x ; (Song3 + 0)
0ad9 : 4c c5 0b JMP $0bc5 ; (main.s75 + 0)
.s1005:
0adc : b0 03 __ BCS $0ae1 ; (main.s1002 + 0)
0ade : 4c 7d 0b JMP $0b7d ; (main.s54 + 0)
.s1002:
0ae1 : c9 04 __ CMP #$04
0ae3 : d0 40 __ BNE $0b25 ; (main.s26 + 0)
.s47:
0ae5 : a5 57 __ LDA T5 + 0 
0ae7 : 85 3b __ STA ACCU + 0 
0ae9 : ad e8 49 LDA $49e8 ; (off1 + 1)
0aec : 85 3c __ STA ACCU + 1 
0aee : a9 c3 __ LDA #$c3
0af0 : 85 23 __ STA WORK + 0 
0af2 : a9 00 __ LDA #$00
0af4 : 85 24 __ STA WORK + 1 
0af6 : 20 61 21 JSR $2161 ; (divmod + 0)
0af9 : a6 25 __ LDX WORK + 2 
0afb : bd 00 5b LDA $5b00,x ; (Song4 + 0)
0afe : f0 25 __ BEQ $0b25 ; (main.s26 + 0)
.s48:
0b00 : a5 57 __ LDA T5 + 0 
0b02 : 85 3b __ STA ACCU + 0 
0b04 : ad e8 49 LDA $49e8 ; (off1 + 1)
0b07 : 85 3c __ STA ACCU + 1 
0b09 : a9 bd __ LDA #$bd
0b0b : 85 23 __ STA WORK + 0 
0b0d : a9 00 __ LDA #$00
0b0f : 85 24 __ STA WORK + 1 
0b11 : 20 61 21 JSR $2161 ; (divmod + 0)
0b14 : a6 25 __ LDX WORK + 2 
0b16 : bd 00 5b LDA $5b00,x ; (Song4 + 0)
.s84:
0b19 : 8d 23 9f STA $9f23 
0b1c : a5 57 __ LDA T5 + 0 
0b1e : 29 0f __ AND #$0f
0b20 : 09 80 __ ORA #$80
0b22 : 8d 23 9f STA $9f23 
.s26:
0b25 : a9 80 __ LDA #$80
0b27 : 85 34 __ STA P7 
0b29 : a9 00 __ LDA #$00
0b2b : 85 35 __ STA P8 
0b2d : 85 36 __ STA P9 
0b2f : 85 37 __ STA P10 
0b31 : 8d fc 9e STA $9efc ; (sstack + 0)
0b34 : 8d fd 9e STA $9efd ; (sstack + 1)
0b37 : a9 10 __ LDA #$10
0b39 : 8d fe 9e STA $9efe ; (sstack + 2)
0b3c : a9 00 __ LDA #$00
0b3e : 8d ff 9e STA $9eff ; (sstack + 3)
0b41 : 18 __ __ CLC
0b42 : a5 57 __ LDA T5 + 0 
0b44 : 69 01 __ ADC #$01
0b46 : 8d e7 49 STA $49e7 ; (off1 + 0)
0b49 : 90 03 __ BCC $0b4e ; (main.s1029 + 0)
.s1028:
0b4b : ee e8 49 INC $49e8 ; (off1 + 1)
.s1029:
0b4e : a9 18 __ LDA #$18
0b50 : 85 32 __ STA P5 
0b52 : a9 45 __ LDA #$45
0b54 : 85 33 __ STA P6 
0b56 : 20 e6 1f JSR $1fe6 ; (SetPaletteIndex.s0 + 0)
.s24:
0b59 : a9 01 __ LDA #$01
0b5b : 8d 2c 9f STA $9f2c 
0b5e : 20 bc 1e JSR $1ebc ; (zsm_fill.s0 + 0)
0b61 : a9 00 __ LDA #$00
0b63 : 8d 2c 9f STA $9f2c 
0b66 : 20 38 21 JSR $2138 ; (frame_wait.l1 + 0)
0b69 : ee fe 27 INC $27fe ; (FrameCount + 0)
0b6c : d0 03 __ BNE $0b71 ; (main.s1031 + 0)
.s1030:
0b6e : ee ff 27 INC $27ff ; (FrameCount + 1)
.s1031:
0b71 : e6 52 __ INC T1 + 0 
0b73 : f0 03 __ BEQ $0b78 ; (main.s1032 + 0)
0b75 : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s1032:
0b78 : e6 53 __ INC T1 + 1 
0b7a : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s54:
0b7d : 09 00 __ ORA #$00
0b7f : d0 20 __ BNE $0ba1 ; (main.s1004 + 0)
.s27:
0b81 : a5 57 __ LDA T5 + 0 
0b83 : 85 3b __ STA ACCU + 0 
0b85 : ad e8 49 LDA $49e8 ; (off1 + 1)
0b88 : 85 3c __ STA ACCU + 1 
0b8a : a9 1d __ LDA #$1d
0b8c : 85 23 __ STA WORK + 0 
0b8e : a9 06 __ LDA #$06
0b90 : 85 24 __ STA WORK + 1 
0b92 : 20 61 21 JSR $2161 ; (divmod + 0)
0b95 : 18 __ __ CLC
0b96 : a9 00 __ LDA #$00
0b98 : 65 25 __ ADC WORK + 2 
0b9a : 85 47 __ STA T6 + 0 
0b9c : a9 4b __ LDA #$4b
0b9e : 4c ec 0b JMP $0bec ; (main.s1020 + 0)
.s1004:
0ba1 : c9 01 __ CMP #$01
0ba3 : f0 2a __ BEQ $0bcf ; (main.s32 + 0)
.s1003:
0ba5 : c9 02 __ CMP #$02
0ba7 : f0 03 __ BEQ $0bac ; (main.s37 + 0)
0ba9 : 4c 25 0b JMP $0b25 ; (main.s26 + 0)
.s37:
0bac : a5 57 __ LDA T5 + 0 
0bae : 85 3b __ STA ACCU + 0 
0bb0 : ad e8 49 LDA $49e8 ; (off1 + 1)
0bb3 : 85 3c __ STA ACCU + 1 
0bb5 : a9 c5 __ LDA #$c5
0bb7 : 85 23 __ STA WORK + 0 
0bb9 : a9 00 __ LDA #$00
0bbb : 85 24 __ STA WORK + 1 
0bbd : 20 61 21 JSR $2161 ; (divmod + 0)
0bc0 : a6 25 __ LDX WORK + 2 
0bc2 : bd 00 59 LDA $5900,x ; (Song2 + 0)
.s75:
0bc5 : 09 00 __ ORA #$00
0bc7 : d0 03 __ BNE $0bcc ; (main.s75 + 7)
0bc9 : 4c 25 0b JMP $0b25 ; (main.s26 + 0)
0bcc : 4c 19 0b JMP $0b19 ; (main.s84 + 0)
.s32:
0bcf : a5 57 __ LDA T5 + 0 
0bd1 : 85 3b __ STA ACCU + 0 
0bd3 : ad e8 49 LDA $49e8 ; (off1 + 1)
0bd6 : 85 3c __ STA ACCU + 1 
0bd8 : a9 5c __ LDA #$5c
0bda : 85 23 __ STA WORK + 0 
0bdc : a9 07 __ LDA #$07
0bde : 85 24 __ STA WORK + 1 
0be0 : 20 61 21 JSR $2161 ; (divmod + 0)
0be3 : 18 __ __ CLC
0be4 : a9 1e __ LDA #$1e
0be6 : 65 25 __ ADC WORK + 2 
0be8 : 85 47 __ STA T6 + 0 
0bea : a9 51 __ LDA #$51
.s1020:
0bec : 65 26 __ ADC WORK + 3 
0bee : 85 48 __ STA T6 + 1 
0bf0 : a0 00 __ LDY #$00
0bf2 : b1 47 __ LDA (T6 + 0),y 
0bf4 : 4c c5 0b JMP $0bc5 ; (main.s75 + 0)
.s14:
0bf7 : e6 54 __ INC T2 + 0 
0bf9 : 4c 3f 0a JMP $0a3f ; (main.s83 + 0)
.s5:
0bfc : a5 54 __ LDA T2 + 0 
0bfe : 85 32 __ STA P5 
0c00 : a9 00 __ LDA #$00
0c02 : 85 33 __ STA P6 
0c04 : ad a1 49 LDA $49a1 ; (LastSelectedSong + 0)
0c07 : 85 34 __ STA P7 
0c09 : a9 00 __ LDA #$00
0c0b : 85 35 __ STA P8 
0c0d : 20 be 1d JSR $1dbe ; (PlayZSM.s0 + 0)
0c10 : a5 32 __ LDA P5 
0c12 : 8d a1 49 STA $49a1 ; (LastSelectedSong + 0)
0c15 : ee a2 49 INC $49a2 ; (PalTimer + 0)
0c18 : f0 03 __ BEQ $0c1d ; (main.s1024 + 0)
0c1a : 4c 83 09 JMP $0983 ; (main.s69 + 0)
.s1024:
0c1d : ee a3 49 INC $49a3 ; (PalTimer + 1)
0c20 : 4c 83 09 JMP $0983 ; (main.s69 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0c23 : 78 __ __ SEI
0c24 : ad 14 03 LDA $0314 
0c27 : 8d ea 49 STA $49ea ; (oirq + 0)
0c2a : ad 15 03 LDA $0315 
0c2d : 8d eb 49 STA $49eb ; (oirq + 1)
0c30 : a9 3c __ LDA #$3c
0c32 : 8d 14 03 STA $0314 
0c35 : a9 0c __ LDA #$0c
0c37 : 8d 15 03 STA $0315 
0c3a : 58 __ __ CLI
.s1001:
0c3b : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
49ea : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c3c : 20 42 0c JSR $0c42 ; (irq.s1000 + 0)
0c3f : 6c ea 49 JMP ($49ea)
--------------------------------------------------------------------
irq:
.s1000:
0c42 : a5 2d __ LDA P0 
0c44 : 48 __ __ PHA
0c45 : a5 2e __ LDA P1 
0c47 : 48 __ __ PHA
0c48 : a5 3b __ LDA ACCU + 0 
0c4a : 48 __ __ PHA
0c4b : a5 3c __ LDA ACCU + 1 
0c4d : 48 __ __ PHA
0c4e : a5 47 __ LDA T0 + 0 
0c50 : 48 __ __ PHA
0c51 : a5 48 __ LDA $48 
0c53 : 48 __ __ PHA
0c54 : a5 49 __ LDA $49 
0c56 : 48 __ __ PHA
0c57 : a5 4a __ LDA $4a 
0c59 : 48 __ __ PHA
0c5a : a5 4b __ LDA $4b 
0c5c : 48 __ __ PHA
0c5d : a5 4c __ LDA $4c 
0c5f : 48 __ __ PHA
0c60 : a5 4d __ LDA $4d 
0c62 : 48 __ __ PHA
0c63 : a5 4e __ LDA $4e 
0c65 : 48 __ __ PHA
0c66 : a5 4f __ LDA $4f 
0c68 : 48 __ __ PHA
0c69 : a5 50 __ LDA $50 
0c6b : 48 __ __ PHA
.s0:
0c6c : ad 10 22 LDA $2210 ; (zsm_playing + 0)
0c6f : f0 08 __ BEQ $0c79 ; (irq.s1001 + 0)
.s4:
0c71 : ad 11 22 LDA $2211 ; (zsm_finished + 0)
0c74 : d0 03 __ BNE $0c79 ; (irq.s1001 + 0)
.s1:
0c76 : 20 a4 0c JSR $0ca4 ; (zsm_play.s0 + 0)
.s1001:
0c79 : 68 __ __ PLA
0c7a : 85 50 __ STA $50 
0c7c : 68 __ __ PLA
0c7d : 85 4f __ STA $4f 
0c7f : 68 __ __ PLA
0c80 : 85 4e __ STA $4e 
0c82 : 68 __ __ PLA
0c83 : 85 4d __ STA $4d 
0c85 : 68 __ __ PLA
0c86 : 85 4c __ STA $4c 
0c88 : 68 __ __ PLA
0c89 : 85 4b __ STA $4b 
0c8b : 68 __ __ PLA
0c8c : 85 4a __ STA $4a 
0c8e : 68 __ __ PLA
0c8f : 85 49 __ STA $49 
0c91 : 68 __ __ PLA
0c92 : 85 48 __ STA $48 
0c94 : 68 __ __ PLA
0c95 : 85 47 __ STA T0 + 0 
0c97 : 68 __ __ PLA
0c98 : 85 3c __ STA ACCU + 1 
0c9a : 68 __ __ PLA
0c9b : 85 3b __ STA ACCU + 0 
0c9d : 68 __ __ PLA
0c9e : 85 2e __ STA P1 
0ca0 : 68 __ __ PLA
0ca1 : 85 2d __ STA P0 
0ca3 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
2210 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
2211 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0ca4 : ad 12 22 LDA $2212 ; (zsm_paused + 0)
0ca7 : f0 01 __ BEQ $0caa ; (zsm_play.s2 + 0)
0ca9 : 60 __ __ RTS
.s2:
0caa : ad ec 49 LDA $49ec ; (zsm_delay + 0)
0cad : f0 03 __ BEQ $0cb2 ; (zsm_play.s5 + 0)
0caf : 4c df 0d JMP $0ddf ; (zsm_play.s4 + 0)
.s5:
0cb2 : ad 25 9f LDA $9f25 
0cb5 : 85 47 __ STA T0 + 0 
0cb7 : ad 25 9f LDA $9f25 
0cba : 29 fe __ AND #$fe
0cbc : 8d 25 9f STA $9f25 
0cbf : ad 20 9f LDA $9f20 
0cc2 : 85 49 __ STA T2 + 0 
0cc4 : ad 21 9f LDA $9f21 
0cc7 : 85 4a __ STA T2 + 1 
0cc9 : ad 22 9f LDA $9f22 
0ccc : 85 48 __ STA T1 + 0 
.l8:
0cce : ad ed 49 LDA $49ed ; (zsm_pos + 0)
0cd1 : 85 4b __ STA T3 + 0 
0cd3 : 18 __ __ CLC
0cd4 : 69 01 __ ADC #$01
0cd6 : 85 4d __ STA T4 + 0 
0cd8 : 8d ed 49 STA $49ed ; (zsm_pos + 0)
0cdb : ad ee 49 LDA $49ee ; (zsm_pos + 1)
0cde : aa __ __ TAX
0cdf : 69 00 __ ADC #$00
0ce1 : 85 4e __ STA T4 + 1 
0ce3 : 8d ee 49 STA $49ee ; (zsm_pos + 1)
0ce6 : 18 __ __ CLC
0ce7 : a9 be __ LDA #$be
0ce9 : 65 4b __ ADC T3 + 0 
0ceb : 85 3b __ STA ACCU + 0 
0ced : 8a __ __ TXA
0cee : 29 03 __ AND #$03
0cf0 : 69 5b __ ADC #$5b
0cf2 : 85 3c __ STA ACCU + 1 
0cf4 : a0 00 __ LDY #$00
0cf6 : b1 3b __ LDA (ACCU + 0),y 
0cf8 : c9 40 __ CMP #$40
0cfa : b0 03 __ BCS $0cff ; (zsm_play.s12 + 0)
0cfc : 4c aa 0d JMP $0daa ; (zsm_play.s11 + 0)
.s12:
0cff : d0 22 __ BNE $0d23 ; (zsm_play.s15 + 0)
.s14:
0d01 : 18 __ __ CLC
0d02 : a9 be __ LDA #$be
0d04 : 65 4d __ ADC T4 + 0 
0d06 : 85 4b __ STA T3 + 0 
0d08 : a5 4e __ LDA T4 + 1 
0d0a : 29 03 __ AND #$03
0d0c : 69 5b __ ADC #$5b
0d0e : 85 4c __ STA T3 + 1 
0d10 : b1 4b __ LDA (T3 + 0),y 
0d12 : 29 3f __ AND #$3f
0d14 : 18 __ __ CLC
0d15 : 65 4d __ ADC T4 + 0 
0d17 : 8d ed 49 STA $49ed ; (zsm_pos + 0)
0d1a : 98 __ __ TYA
0d1b : 65 4e __ ADC T4 + 1 
0d1d : 8d ee 49 STA $49ee ; (zsm_pos + 1)
0d20 : 4c ce 0c JMP $0cce ; (zsm_play.l8 + 0)
.s15:
0d23 : 09 00 __ ORA #$00
0d25 : 30 5b __ BMI $0d82 ; (zsm_play.s18 + 0)
.s17:
0d27 : 29 3f __ AND #$3f
0d29 : f0 a3 __ BEQ $0cce ; (zsm_play.l8 + 0)
.s29:
0d2b : 84 50 __ STY T7 + 0 
0d2d : 85 4f __ STA T6 + 0 
0d2f : 18 __ __ CLC
.l1012:
0d30 : a9 be __ LDA #$be
0d32 : 6d ed 49 ADC $49ed ; (zsm_pos + 0)
0d35 : 85 4d __ STA T4 + 0 
0d37 : ad ee 49 LDA $49ee ; (zsm_pos + 1)
0d3a : 29 03 __ AND #$03
0d3c : 69 5b __ ADC #$5b
0d3e : 85 4e __ STA T4 + 1 
0d40 : a0 00 __ LDY #$00
0d42 : b1 4d __ LDA (T4 + 0),y 
0d44 : 85 2d __ STA P0 
0d46 : ad ed 49 LDA $49ed ; (zsm_pos + 0)
0d49 : 18 __ __ CLC
0d4a : 69 01 __ ADC #$01
0d4c : aa __ __ TAX
0d4d : ad ee 49 LDA $49ee ; (zsm_pos + 1)
0d50 : 69 00 __ ADC #$00
0d52 : 29 03 __ AND #$03
0d54 : 85 4c __ STA T3 + 1 
0d56 : 8a __ __ TXA
0d57 : 18 __ __ CLC
0d58 : 69 be __ ADC #$be
0d5a : 85 4b __ STA T3 + 0 
0d5c : a9 5b __ LDA #$5b
0d5e : 65 4c __ ADC T3 + 1 
0d60 : 85 4c __ STA T3 + 1 
0d62 : b1 4b __ LDA (T3 + 0),y 
0d64 : 85 2e __ STA P1 
0d66 : 20 e3 0d JSR $0de3 ; (sfx_put.l1 + 0)
0d69 : ad ed 49 LDA $49ed ; (zsm_pos + 0)
0d6c : 18 __ __ CLC
0d6d : 69 02 __ ADC #$02
0d6f : 8d ed 49 STA $49ed ; (zsm_pos + 0)
0d72 : 90 03 __ BCC $0d77 ; (zsm_play.s1015 + 0)
.s1014:
0d74 : ee ee 49 INC $49ee ; (zsm_pos + 1)
.s1015:
0d77 : e6 50 __ INC T7 + 0 
0d79 : a5 50 __ LDA T7 + 0 
0d7b : c5 4f __ CMP T6 + 0 
0d7d : 90 b1 __ BCC $0d30 ; (zsm_play.l1012 + 0)
0d7f : 4c ce 0c JMP $0cce ; (zsm_play.l8 + 0)
.s18:
0d82 : c9 80 __ CMP #$80
0d84 : d0 07 __ BNE $0d8d ; (zsm_play.s25 + 0)
.s24:
0d86 : a9 01 __ LDA #$01
0d88 : 8d 11 22 STA $2211 ; (zsm_finished + 0)
0d8b : d0 08 __ BNE $0d95 ; (zsm_play.s10 + 0)
.s25:
0d8d : 29 7f __ AND #$7f
0d8f : 38 __ __ SEC
0d90 : e9 01 __ SBC #$01
0d92 : 8d ec 49 STA $49ec ; (zsm_delay + 0)
.s10:
0d95 : a5 49 __ LDA T2 + 0 
0d97 : 8d 20 9f STA $9f20 
0d9a : a5 4a __ LDA T2 + 1 
0d9c : 8d 21 9f STA $9f21 
0d9f : a5 48 __ LDA T1 + 0 
0da1 : 8d 22 9f STA $9f22 
0da4 : a5 47 __ LDA T0 + 0 
0da6 : 8d 25 9f STA $9f25 
.s1001:
0da9 : 60 __ __ RTS
.s11:
0daa : 29 3f __ AND #$3f
0dac : 09 c0 __ ORA #$c0
0dae : 8d 20 9f STA $9f20 
0db1 : a9 f9 __ LDA #$f9
0db3 : 8d 21 9f STA $9f21 
0db6 : a9 01 __ LDA #$01
0db8 : 8d 22 9f STA $9f22 
0dbb : a5 4b __ LDA T3 + 0 
0dbd : 69 02 __ ADC #$02
0dbf : 8d ed 49 STA $49ed ; (zsm_pos + 0)
0dc2 : 90 01 __ BCC $0dc5 ; (zsm_play.s1017 + 0)
.s1016:
0dc4 : e8 __ __ INX
.s1017:
0dc5 : 8e ee 49 STX $49ee ; (zsm_pos + 1)
0dc8 : 18 __ __ CLC
0dc9 : a9 be __ LDA #$be
0dcb : 65 4d __ ADC T4 + 0 
0dcd : 85 4b __ STA T3 + 0 
0dcf : a5 4e __ LDA T4 + 1 
0dd1 : 29 03 __ AND #$03
0dd3 : 69 5b __ ADC #$5b
0dd5 : 85 4c __ STA T3 + 1 
0dd7 : b1 4b __ LDA (T3 + 0),y 
0dd9 : 8d 23 9f STA $9f23 
0ddc : 4c ce 0c JMP $0cce ; (zsm_play.l8 + 0)
.s4:
0ddf : ce ec 49 DEC $49ec ; (zsm_delay + 0)
0de2 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
2212 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
49ec : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
5bbe : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
49ed : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0de3 : ad 41 9f LDA $9f41 
0de6 : 30 fb __ BMI $0de3 ; (sfx_put.l1 + 0)
.s3:
0de8 : a5 2d __ LDA P0 ; (index + 0)
0dea : 8d 40 9f STA $9f40 
0ded : ea __ __ NOP
0dee : ea __ __ NOP
0def : ea __ __ NOP
0df0 : ea __ __ NOP
0df1 : a5 2e __ LDA P1 ; (data + 0)
0df3 : a6 2d __ LDX P0 ; (index + 0)
0df5 : 9d 7b 58 STA $587b,x ; (vera_fm_s_regs + 0)
0df8 : 8d 41 9f STA $9f41 
.s1001:
0dfb : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
587b : __ __ __ BSS	128
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0dfc : a9 93 __ LDA #$93
0dfe : 85 2d __ STA P0 
0e00 : a9 00 __ LDA #$00
0e02 : 85 2e __ STA P1 
0e04 : 20 39 0e JSR $0e39 ; (putch.s0 + 0)
0e07 : a9 11 __ LDA #$11
0e09 : 8d 22 9f STA $9f22 
0e0c : a2 00 __ LDX #$00
.l2:
0e0e : 8a __ __ TXA
0e0f : 18 __ __ CLC
0e10 : 69 b0 __ ADC #$b0
0e12 : 8d 21 9f STA $9f21 
0e15 : a9 00 __ LDA #$00
0e17 : 8d 20 9f STA $9f20 
0e1a : a0 80 __ LDY #$80
.l1003:
0e1c : a9 20 __ LDA #$20
0e1e : 8d 23 9f STA $9f23 
0e21 : a9 01 __ LDA #$01
0e23 : 8d 23 9f STA $9f23 
0e26 : a9 20 __ LDA #$20
0e28 : 8d 24 9f STA $9f24 
0e2b : a9 01 __ LDA #$01
0e2d : 8d 24 9f STA $9f24 
0e30 : 88 __ __ DEY
0e31 : d0 e9 __ BNE $0e1c ; (ClearVERAScreen.l1003 + 0)
.s1004:
0e33 : e8 __ __ INX
0e34 : e0 40 __ CPX #$40
0e36 : 90 d6 __ BCC $0e0e ; (ClearVERAScreen.l2 + 0)
.s1001:
0e38 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0e39 : a5 2d __ LDA P0 
0e3b : 20 d2 ff JSR $ffd2 
.s1001:
0e3e : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e3f : a9 00 __ LDA #$00
0e41 : 8d 25 9f STA $9f25 
0e44 : a9 80 __ LDA #$80
0e46 : 8d 2b 9f STA $9f2b 
0e49 : 8d 2a 9f STA $9f2a 
0e4c : a9 62 __ LDA #$62
0e4e : 8d 2d 9f STA $9f2d 
0e51 : a9 68 __ LDA #$68
0e53 : 8d 34 9f STA $9f34 
0e56 : a9 00 __ LDA #$00
0e58 : 85 2d __ STA P0 
0e5a : 85 2e __ STA P1 
0e5c : 85 2f __ STA P2 
0e5e : 85 30 __ STA P3 
0e60 : 85 31 __ STA P4 
0e62 : 20 5f 18 JSR $185f ; (tileBaseConfig.s0 + 0)
0e65 : 8d 2f 9f STA $9f2f 
0e68 : a9 00 __ LDA #$00
0e6a : 85 2d __ STA P0 
0e6c : a9 20 __ LDA #$20
0e6e : 85 2f __ STA P2 
0e70 : 20 77 18 JSR $1877 ; (memoryToMapMemoryAddress.s0 + 0)
0e73 : 8d 2e 9f STA $9f2e 
0e76 : a9 01 __ LDA #$01
0e78 : 8d 22 9f STA $9f22 
0e7b : a2 80 __ LDX #$80
.l6:
0e7d : a0 50 __ LDY #$50
.l1039:
0e7f : a9 00 __ LDA #$00
0e81 : 8d 24 9f STA $9f24 
0e84 : a9 08 __ LDA #$08
0e86 : 8d 24 9f STA $9f24 
0e89 : 88 __ __ DEY
0e8a : d0 f3 __ BNE $0e7f ; (SetUpSprites.l1039 + 0)
.s1040:
0e8c : ca __ __ DEX
0e8d : d0 ee __ BNE $0e7d ; (SetUpSprites.l6 + 0)
.s4:
0e8f : 86 4e __ STX T1 + 0 
0e91 : a9 00 __ LDA #$00
0e93 : 85 2d __ STA P0 
0e95 : 85 2e __ STA P1 
0e97 : 85 2f __ STA P2 
0e99 : 85 30 __ STA P3 
0e9b : a9 e0 __ LDA #$e0
0e9d : 85 33 __ STA P6 
0e9f : a9 01 __ LDA #$01
0ea1 : 85 34 __ STA P7 
0ea3 : a9 13 __ LDA #$13
0ea5 : 85 31 __ STA P4 
0ea7 : a9 22 __ LDA #$22
0ea9 : 85 32 __ STA P5 
0eab : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
0eae : a9 10 __ LDA #$10
0eb0 : 8d 22 9f STA $9f22 
0eb3 : a9 00 __ LDA #$00
0eb5 : 8d 20 9f STA $9f20 
0eb8 : a9 20 __ LDA #$20
0eba : 8d 21 9f STA $9f21 
.l10:
0ebd : a9 00 __ LDA #$00
0ebf : 85 4f __ STA T2 + 0 
.l14:
0ec1 : 20 bf 18 JSR $18bf ; (rand.s0 + 0)
0ec4 : a9 31 __ LDA #$31
0ec6 : 85 23 __ STA WORK + 0 
0ec8 : a9 00 __ LDA #$00
0eca : 85 24 __ STA WORK + 1 
0ecc : 20 61 21 JSR $2161 ; (divmod + 0)
0ecf : a5 4e __ LDA T1 + 0 
0ed1 : c9 36 __ CMP #$36
0ed3 : 90 03 __ BCC $0ed8 ; (SetUpSprites.s1037 + 0)
0ed5 : 4c b2 17 JMP $17b2 ; (SetUpSprites.s1032 + 0)
.s1037:
0ed8 : c9 2c __ CMP #$2c
0eda : b0 03 __ BCS $0edf ; (SetUpSprites.s1036 + 0)
0edc : 4c b2 17 JMP $17b2 ; (SetUpSprites.s1032 + 0)
.s1036:
0edf : f0 04 __ BEQ $0ee5 ; (SetUpSprites.s21 + 0)
.s1035:
0ee1 : c9 34 __ CMP #$34
0ee3 : d0 04 __ BNE $0ee9 ; (SetUpSprites.s1034 + 0)
.s21:
0ee5 : a9 0a __ LDA #$0a
0ee7 : d0 0e __ BNE $0ef7 ; (SetUpSprites.s219 + 0)
.s1034:
0ee9 : c9 2d __ CMP #$2d
0eeb : f0 04 __ BEQ $0ef1 ; (SetUpSprites.s25 + 0)
.s1033:
0eed : c9 35 __ CMP #$35
0eef : d0 04 __ BNE $0ef5 ; (SetUpSprites.s26 + 0)
.s25:
0ef1 : a9 0b __ LDA #$0b
0ef3 : d0 02 __ BNE $0ef7 ; (SetUpSprites.s219 + 0)
.s26:
0ef5 : a9 04 __ LDA #$04
.s219:
0ef7 : 8d 23 9f STA $9f23 
0efa : a9 00 __ LDA #$00
0efc : 8d 23 9f STA $9f23 
0eff : e6 4f __ INC T2 + 0 
0f01 : 10 be __ BPL $0ec1 ; (SetUpSprites.l14 + 0)
.s11:
0f03 : e6 4e __ INC T1 + 0 
0f05 : a5 4e __ LDA T1 + 0 
0f07 : c9 3c __ CMP #$3c
0f09 : 90 b2 __ BCC $0ebd ; (SetUpSprites.l10 + 0)
.s12:
0f0b : a9 c0 __ LDA #$c0
0f0d : 85 2d __ STA P0 
0f0f : a9 56 __ LDA #$56
0f11 : 85 2e __ STA P1 
0f13 : a9 01 __ LDA #$01
0f15 : 85 2f __ STA P2 
0f17 : a9 00 __ LDA #$00
0f19 : 85 30 __ STA P3 
0f1b : 85 33 __ STA P6 
0f1d : a9 02 __ LDA #$02
0f1f : 85 34 __ STA P7 
0f21 : a9 f5 __ LDA #$f5
0f23 : 85 31 __ STA P4 
0f25 : a9 23 __ LDA #$23
0f27 : 85 32 __ STA P5 
0f29 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
0f2c : a9 00 __ LDA #$00
0f2e : 85 2d __ STA P0 
0f30 : a9 59 __ LDA #$59
0f32 : 85 2e __ STA P1 
0f34 : a9 02 __ LDA #$02
0f36 : 85 34 __ STA P7 
0f38 : a9 f5 __ LDA #$f5
0f3a : 85 31 __ STA P4 
0f3c : a9 25 __ LDA #$25
0f3e : 85 32 __ STA P5 
0f40 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
0f43 : a9 b6 __ LDA #$b6
0f45 : 85 2e __ STA P1 
0f47 : a9 0a __ LDA #$0a
0f49 : 85 2f __ STA P2 
0f4b : 85 34 __ STA P7 
0f4d : a9 02 __ LDA #$02
0f4f : 85 31 __ STA P4 
0f51 : 85 32 __ STA P5 
0f53 : a9 03 __ LDA #$03
0f55 : 85 33 __ STA P6 
0f57 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
0f5a : a9 68 __ LDA #$68
0f5c : 85 2e __ STA P1 
0f5e : a9 00 __ LDA #$00
0f60 : 85 2f __ STA P2 
0f62 : a9 b6 __ LDA #$b6
0f64 : 85 30 __ STA P3 
0f66 : a9 01 __ LDA #$01
0f68 : 85 31 __ STA P4 
0f6a : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
0f6d : a9 01 __ LDA #$01
0f6f : 85 2d __ STA P0 
0f71 : a9 c8 __ LDA #$c8
0f73 : 85 2e __ STA P1 
0f75 : a9 0a __ LDA #$0a
0f77 : 85 2f __ STA P2 
0f79 : a9 00 __ LDA #$00
0f7b : 85 30 __ STA P3 
0f7d : a9 02 __ LDA #$02
0f7f : 85 31 __ STA P4 
0f81 : a9 09 __ LDA #$09
0f83 : 85 34 __ STA P7 
0f85 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
0f88 : a9 f0 __ LDA #$f0
0f8a : 85 2e __ STA P1 
0f8c : a9 01 __ LDA #$01
0f8e : 85 2f __ STA P2 
0f90 : 85 31 __ STA P4 
0f92 : a9 b6 __ LDA #$b6
0f94 : 85 30 __ STA P3 
0f96 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
0f99 : a9 00 __ LDA #$00
0f9b : 85 2d __ STA P0 
0f9d : 85 30 __ STA P3 
0f9f : 85 33 __ STA P6 
0fa1 : a9 30 __ LDA #$30
0fa3 : 85 2e __ STA P1 
0fa5 : a9 01 __ LDA #$01
0fa7 : 85 34 __ STA P7 
0fa9 : a9 00 __ LDA #$00
0fab : 85 31 __ STA P4 
0fad : a9 28 __ LDA #$28
0faf : 85 32 __ STA P5 
0fb1 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
0fb4 : a9 16 __ LDA #$16
0fb6 : 85 2d __ STA P0 
0fb8 : a9 80 __ LDA #$80
0fba : 85 2e __ STA P1 
0fbc : a9 09 __ LDA #$09
0fbe : 85 2f __ STA P2 
0fc0 : a9 01 __ LDA #$01
0fc2 : 85 31 __ STA P4 
0fc4 : 85 34 __ STA P7 
0fc6 : a9 02 __ LDA #$02
0fc8 : 85 32 __ STA P5 
0fca : a9 03 __ LDA #$03
0fcc : 85 33 __ STA P6 
0fce : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
0fd1 : a9 30 __ LDA #$30
0fd3 : 85 2e __ STA P1 
0fd5 : a9 01 __ LDA #$01
0fd7 : 85 2f __ STA P2 
0fd9 : a9 b8 __ LDA #$b8
0fdb : 85 30 __ STA P3 
0fdd : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
0fe0 : a9 00 __ LDA #$00
0fe2 : 85 2d __ STA P0 
0fe4 : 85 30 __ STA P3 
0fe6 : 85 33 __ STA P6 
0fe8 : a9 37 __ LDA #$37
0fea : 85 2e __ STA P1 
0fec : a9 02 __ LDA #$02
0fee : 85 34 __ STA P7 
0ff0 : a9 00 __ LDA #$00
0ff2 : 85 31 __ STA P4 
0ff4 : a9 29 __ LDA #$29
0ff6 : 85 32 __ STA P5 
0ff8 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
0ffb : a9 17 __ LDA #$17
0ffd : 85 2d __ STA P0 
0fff : a9 b8 __ LDA #$b8
1001 : 85 2e __ STA P1 
1003 : a9 09 __ LDA #$09
1005 : 85 2f __ STA P2 
1007 : a9 02 __ LDA #$02
1009 : 85 31 __ STA P4 
100b : 85 32 __ STA P5 
100d : a9 03 __ LDA #$03
100f : 85 33 __ STA P6 
1011 : a9 01 __ LDA #$01
1013 : 85 34 __ STA P7 
1015 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1018 : a9 fc __ LDA #$fc
101a : 85 2e __ STA P1 
101c : a9 00 __ LDA #$00
101e : 85 2f __ STA P2 
1020 : a9 b8 __ LDA #$b8
1022 : 85 30 __ STA P3 
1024 : a9 01 __ LDA #$01
1026 : 85 31 __ STA P4 
1028 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
102b : a9 18 __ LDA #$18
102d : 85 2d __ STA P0 
102f : a9 b8 __ LDA #$b8
1031 : 85 2e __ STA P1 
1033 : a9 09 __ LDA #$09
1035 : 85 2f __ STA P2 
1037 : a9 00 __ LDA #$00
1039 : 85 30 __ STA P3 
103b : a9 02 __ LDA #$02
103d : 85 31 __ STA P4 
103f : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1042 : a9 4c __ LDA #$4c
1044 : 85 2e __ STA P1 
1046 : a9 01 __ LDA #$01
1048 : 85 2f __ STA P2 
104a : 85 31 __ STA P4 
104c : a9 b8 __ LDA #$b8
104e : 85 30 __ STA P3 
1050 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1053 : a9 01 __ LDA #$01
1055 : 85 2e __ STA P1 
1057 : a9 00 __ LDA #$00
1059 : 85 2f __ STA P2 
105b : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
105e : a9 10 __ LDA #$10
1060 : 85 2d __ STA P0 
1062 : a9 20 __ LDA #$20
1064 : 85 30 __ STA P3 
1066 : a9 00 __ LDA #$00
1068 : 85 31 __ STA P4 
106a : a9 00 __ LDA #$00
106c : 85 2e __ STA P1 
106e : a9 2b __ LDA #$2b
1070 : 85 2f __ STA P2 
1072 : 20 b9 19 JSR $19b9 ; (vera_pal_putn.s0 + 0)
1075 : a9 00 __ LDA #$00
1077 : 85 2d __ STA P0 
1079 : 85 30 __ STA P3 
107b : 85 33 __ STA P6 
107d : a9 35 __ LDA #$35
107f : 85 2e __ STA P1 
1081 : a9 01 __ LDA #$01
1083 : 85 2f __ STA P2 
1085 : a9 02 __ LDA #$02
1087 : 85 34 __ STA P7 
1089 : a9 20 __ LDA #$20
108b : 85 31 __ STA P4 
108d : a9 2b __ LDA #$2b
108f : 85 32 __ STA P5 
1091 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
1094 : a9 00 __ LDA #$00
1096 : 85 4e __ STA T1 + 0 
1098 : 85 4f __ STA T2 + 0 
109a : a9 03 __ LDA #$03
109c : 85 33 __ STA P6 
109e : a9 02 __ LDA #$02
10a0 : 85 34 __ STA P7 
10a2 : 18 __ __ CLC
.l1053:
10a3 : a9 a8 __ LDA #$a8
10a5 : 85 2e __ STA P1 
10a7 : a9 09 __ LDA #$09
10a9 : 85 2f __ STA P2 
10ab : a9 00 __ LDA #$00
10ad : 85 30 __ STA P3 
10af : 85 31 __ STA P4 
10b1 : 85 32 __ STA P5 
10b3 : a5 4e __ LDA T1 + 0 
10b5 : 69 19 __ ADC #$19
10b7 : 85 2d __ STA P0 
10b9 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
10bc : a9 b8 __ LDA #$b8
10be : 85 30 __ STA P3 
10c0 : a9 01 __ LDA #$01
10c2 : 85 31 __ STA P4 
10c4 : 38 __ __ SEC
10c5 : a5 4f __ LDA T2 + 0 
10c7 : e9 fc __ SBC #$fc
10c9 : 85 2e __ STA P1 
10cb : a9 00 __ LDA #$00
10cd : e9 03 __ SBC #$03
10cf : 85 2f __ STA P2 
10d1 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
10d4 : 18 __ __ CLC
10d5 : a5 4f __ LDA T2 + 0 
10d7 : 69 0c __ ADC #$0c
10d9 : 85 4f __ STA T2 + 0 
10db : e6 4e __ INC T1 + 0 
10dd : a5 4e __ LDA T1 + 0 
10df : c9 08 __ CMP #$08
10e1 : 90 c0 __ BCC $10a3 ; (SetUpSprites.l1053 + 0)
.s78:
10e3 : a9 00 __ LDA #$00
10e5 : 85 4e __ STA T1 + 0 
10e7 : 85 4f __ STA T2 + 0 
10e9 : a9 03 __ LDA #$03
10eb : 85 33 __ STA P6 
10ed : 85 34 __ STA P7 
10ef : 18 __ __ CLC
.l1055:
10f0 : a9 a8 __ LDA #$a8
10f2 : 85 2e __ STA P1 
10f4 : a9 09 __ LDA #$09
10f6 : 85 2f __ STA P2 
10f8 : a9 00 __ LDA #$00
10fa : 85 30 __ STA P3 
10fc : 85 31 __ STA P4 
10fe : a5 4e __ LDA T1 + 0 
1100 : 69 21 __ ADC #$21
1102 : 85 2d __ STA P0 
1104 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1107 : a9 c4 __ LDA #$c4
1109 : 85 30 __ STA P3 
110b : a9 01 __ LDA #$01
110d : 85 31 __ STA P4 
110f : 38 __ __ SEC
1110 : a5 4f __ LDA T2 + 0 
1112 : e9 fc __ SBC #$fc
1114 : 85 2e __ STA P1 
1116 : a9 00 __ LDA #$00
1118 : e9 03 __ SBC #$03
111a : 85 2f __ STA P2 
111c : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
111f : 18 __ __ CLC
1120 : a5 4f __ LDA T2 + 0 
1122 : 69 0c __ ADC #$0c
1124 : 85 4f __ STA T2 + 0 
1126 : e6 4e __ INC T1 + 0 
1128 : a5 4e __ LDA T1 + 0 
112a : c9 08 __ CMP #$08
112c : 90 c2 __ BCC $10f0 ; (SetUpSprites.l1055 + 0)
.s82:
112e : a9 00 __ LDA #$00
1130 : 85 4e __ STA T1 + 0 
1132 : 85 4f __ STA T2 + 0 
1134 : a9 03 __ LDA #$03
1136 : 85 33 __ STA P6 
1138 : a9 04 __ LDA #$04
113a : 85 34 __ STA P7 
113c : 18 __ __ CLC
.l1057:
113d : a9 a8 __ LDA #$a8
113f : 85 2e __ STA P1 
1141 : a9 09 __ LDA #$09
1143 : 85 2f __ STA P2 
1145 : a9 00 __ LDA #$00
1147 : 85 30 __ STA P3 
1149 : 85 31 __ STA P4 
114b : a5 4e __ LDA T1 + 0 
114d : 69 29 __ ADC #$29
114f : 85 2d __ STA P0 
1151 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1154 : a9 b8 __ LDA #$b8
1156 : 85 30 __ STA P3 
1158 : a9 01 __ LDA #$01
115a : 85 31 __ STA P4 
115c : 38 __ __ SEC
115d : a9 6c __ LDA #$6c
115f : e5 4f __ SBC T2 + 0 
1161 : 85 2e __ STA P1 
1163 : a9 02 __ LDA #$02
1165 : e9 04 __ SBC #$04
1167 : 85 2f __ STA P2 
1169 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
116c : 18 __ __ CLC
116d : a5 4f __ LDA T2 + 0 
116f : 69 0c __ ADC #$0c
1171 : 85 4f __ STA T2 + 0 
1173 : e6 4e __ INC T1 + 0 
1175 : a5 4e __ LDA T1 + 0 
1177 : c9 08 __ CMP #$08
1179 : 90 c2 __ BCC $113d ; (SetUpSprites.l1057 + 0)
.s86:
117b : a9 00 __ LDA #$00
117d : 85 4e __ STA T1 + 0 
117f : a9 03 __ LDA #$03
1181 : 85 33 __ STA P6 
1183 : a9 04 __ LDA #$04
1185 : 85 34 __ STA P7 
.l88:
1187 : 38 __ __ SEC
1188 : a9 00 __ LDA #$00
118a : e5 4e __ SBC T1 + 0 
118c : 29 0c __ AND #$0c
118e : 49 ff __ EOR #$ff
1190 : 38 __ __ SEC
1191 : 69 6c __ ADC #$6c
1193 : 85 4f __ STA T2 + 0 
1195 : a9 02 __ LDA #$02
1197 : e9 00 __ SBC #$00
1199 : 85 50 __ STA T2 + 1 
119b : 18 __ __ CLC
119c : a5 4e __ LDA T1 + 0 
119e : 69 31 __ ADC #$31
11a0 : 85 2d __ STA P0 
11a2 : a9 02 __ LDA #$02
11a4 : 85 51 __ STA T4 + 0 
.l1041:
11a6 : a9 a8 __ LDA #$a8
11a8 : 85 2e __ STA P1 
11aa : a9 09 __ LDA #$09
11ac : 85 2f __ STA P2 
11ae : a9 00 __ LDA #$00
11b0 : 85 30 __ STA P3 
11b2 : 85 31 __ STA P4 
11b4 : 85 32 __ STA P5 
11b6 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
11b9 : a5 4f __ LDA T2 + 0 
11bb : 85 2e __ STA P1 
11bd : a5 50 __ LDA T2 + 1 
11bf : 85 2f __ STA P2 
11c1 : a9 b8 __ LDA #$b8
11c3 : 85 30 __ STA P3 
11c5 : a9 01 __ LDA #$01
11c7 : 85 31 __ STA P4 
11c9 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
11cc : c6 51 __ DEC T4 + 0 
11ce : d0 d6 __ BNE $11a6 ; (SetUpSprites.l1041 + 0)
.s89:
11d0 : e6 4e __ INC T1 + 0 
11d2 : a5 4e __ LDA T1 + 0 
11d4 : c9 02 __ CMP #$02
11d6 : 90 af __ BCC $1187 ; (SetUpSprites.l88 + 0)
.s90:
11d8 : a9 40 __ LDA #$40
11da : 85 2d __ STA P0 
11dc : a9 51 __ LDA #$51
11de : 85 2e __ STA P1 
11e0 : a9 01 __ LDA #$01
11e2 : 85 2f __ STA P2 
11e4 : 85 34 __ STA P7 
11e6 : a9 00 __ LDA #$00
11e8 : 85 30 __ STA P3 
11ea : 85 33 __ STA P6 
11ec : a9 00 __ LDA #$00
11ee : 85 31 __ STA P4 
11f0 : a9 2e __ LDA #$2e
11f2 : 85 32 __ STA P5 
11f4 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
11f7 : a9 33 __ LDA #$33
11f9 : 85 2d __ STA P0 
11fb : a9 8a __ LDA #$8a
11fd : 85 2e __ STA P1 
11ff : a9 0a __ LDA #$0a
1201 : 85 2f __ STA P2 
1203 : a9 01 __ LDA #$01
1205 : 85 31 __ STA P4 
1207 : a9 02 __ LDA #$02
1209 : 85 32 __ STA P5 
120b : a9 03 __ LDA #$03
120d : 85 33 __ STA P6 
120f : a9 06 __ LDA #$06
1211 : 85 34 __ STA P7 
1213 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1216 : a9 00 __ LDA #$00
1218 : 85 2e __ STA P1 
121a : 85 31 __ STA P4 
121c : a9 01 __ LDA #$01
121e : 85 2f __ STA P2 
1220 : a9 78 __ LDA #$78
1222 : 85 30 __ STA P3 
1224 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1227 : a9 00 __ LDA #$00
1229 : 85 2d __ STA P0 
122b : 85 30 __ STA P3 
122d : 85 33 __ STA P6 
122f : a9 41 __ LDA #$41
1231 : 85 2e __ STA P1 
1233 : a9 04 __ LDA #$04
1235 : 85 34 __ STA P7 
1237 : a9 00 __ LDA #$00
1239 : 85 31 __ STA P4 
123b : a9 2f __ LDA #$2f
123d : 85 32 __ STA P5 
123f : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
1242 : a9 34 __ LDA #$34
1244 : 85 2d __ STA P0 
1246 : a9 08 __ LDA #$08
1248 : 85 2e __ STA P1 
124a : a9 0a __ LDA #$0a
124c : 85 2f __ STA P2 
124e : a9 03 __ LDA #$03
1250 : 85 31 __ STA P4 
1252 : 85 33 __ STA P6 
1254 : a9 02 __ LDA #$02
1256 : 85 32 __ STA P5 
1258 : a9 05 __ LDA #$05
125a : 85 34 __ STA P7 
125c : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
125f : a9 00 __ LDA #$00
1261 : 85 2e __ STA P1 
1263 : 85 31 __ STA P4 
1265 : a9 01 __ LDA #$01
1267 : 85 2f __ STA P2 
1269 : a9 78 __ LDA #$78
126b : 85 30 __ STA P3 
126d : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1270 : a9 35 __ LDA #$35
1272 : 85 2d __ STA P0 
1274 : a9 28 __ LDA #$28
1276 : 85 2e __ STA P1 
1278 : a9 0a __ LDA #$0a
127a : 85 2f __ STA P2 
127c : a9 00 __ LDA #$00
127e : 85 30 __ STA P3 
1280 : a9 03 __ LDA #$03
1282 : 85 31 __ STA P4 
1284 : a9 07 __ LDA #$07
1286 : 85 33 __ STA P6 
1288 : a9 06 __ LDA #$06
128a : 85 34 __ STA P7 
128c : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
128f : a9 00 __ LDA #$00
1291 : 85 2e __ STA P1 
1293 : 85 31 __ STA P4 
1295 : a9 01 __ LDA #$01
1297 : 85 2f __ STA P2 
1299 : a9 e8 __ LDA #$e8
129b : 85 30 __ STA P3 
129d : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
12a0 : a9 36 __ LDA #$36
12a2 : 85 2d __ STA P0 
12a4 : a9 28 __ LDA #$28
12a6 : 85 2e __ STA P1 
12a8 : a9 0a __ LDA #$0a
12aa : 85 2f __ STA P2 
12ac : a9 00 __ LDA #$00
12ae : 85 30 __ STA P3 
12b0 : a9 03 __ LDA #$03
12b2 : 85 31 __ STA P4 
12b4 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
12b7 : a9 40 __ LDA #$40
12b9 : 85 2e __ STA P1 
12bb : a9 01 __ LDA #$01
12bd : 85 2f __ STA P2 
12bf : a9 e8 __ LDA #$e8
12c1 : 85 30 __ STA P3 
12c3 : a9 00 __ LDA #$00
12c5 : 85 31 __ STA P4 
12c7 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
12ca : a9 01 __ LDA #$01
12cc : 85 2e __ STA P1 
12ce : a9 00 __ LDA #$00
12d0 : 85 2f __ STA P2 
12d2 : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
12d5 : a9 37 __ LDA #$37
12d7 : 85 2d __ STA P0 
12d9 : a9 28 __ LDA #$28
12db : 85 2e __ STA P1 
12dd : a9 0a __ LDA #$0a
12df : 85 2f __ STA P2 
12e1 : a9 00 __ LDA #$00
12e3 : 85 30 __ STA P3 
12e5 : a9 03 __ LDA #$03
12e7 : 85 31 __ STA P4 
12e9 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
12ec : a9 00 __ LDA #$00
12ee : 85 2e __ STA P1 
12f0 : a9 01 __ LDA #$01
12f2 : 85 2f __ STA P2 
12f4 : 85 31 __ STA P4 
12f6 : a9 08 __ LDA #$08
12f8 : 85 30 __ STA P3 
12fa : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
12fd : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
1300 : a9 38 __ LDA #$38
1302 : 85 2d __ STA P0 
1304 : a9 28 __ LDA #$28
1306 : 85 2e __ STA P1 
1308 : a9 0a __ LDA #$0a
130a : 85 2f __ STA P2 
130c : a9 00 __ LDA #$00
130e : 85 30 __ STA P3 
1310 : a9 03 __ LDA #$03
1312 : 85 31 __ STA P4 
1314 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1317 : a9 40 __ LDA #$40
1319 : 85 2e __ STA P1 
131b : a9 01 __ LDA #$01
131d : 85 2f __ STA P2 
131f : 85 31 __ STA P4 
1321 : a9 08 __ LDA #$08
1323 : 85 30 __ STA P3 
1325 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1328 : a9 01 __ LDA #$01
132a : 85 2e __ STA P1 
132c : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
132f : a9 00 __ LDA #$00
1331 : 85 2d __ STA P0 
1333 : 85 30 __ STA P3 
1335 : 85 33 __ STA P6 
1337 : a9 39 __ LDA #$39
1339 : 85 2e __ STA P1 
133b : a9 08 __ LDA #$08
133d : 85 34 __ STA P7 
133f : a9 00 __ LDA #$00
1341 : 85 31 __ STA P4 
1343 : a9 33 __ LDA #$33
1345 : 85 32 __ STA P5 
1347 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
134a : a9 00 __ LDA #$00
134c : 85 4e __ STA T1 + 0 
134e : 85 4f __ STA T2 + 0 
1350 : 85 50 __ STA T2 + 1 
1352 : a9 02 __ LDA #$02
1354 : 85 33 __ STA P6 
1356 : a9 05 __ LDA #$05
1358 : 85 34 __ STA P7 
135a : a9 03 __ LDA #$03
135c : 85 32 __ STA P5 
135e : 18 __ __ CLC
.l1059:
135f : a9 c8 __ LDA #$c8
1361 : 85 2e __ STA P1 
1363 : a9 09 __ LDA #$09
1365 : 85 2f __ STA P2 
1367 : a9 00 __ LDA #$00
1369 : 85 30 __ STA P3 
136b : a9 03 __ LDA #$03
136d : 85 31 __ STA P4 
136f : a5 4e __ LDA T1 + 0 
1371 : 69 39 __ ADC #$39
1373 : 85 2d __ STA P0 
1375 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1378 : a9 20 __ LDA #$20
137a : 85 2e __ STA P1 
137c : a9 01 __ LDA #$01
137e : 85 2f __ STA P2 
1380 : 38 __ __ SEC
1381 : a5 4f __ LDA T2 + 0 
1383 : e9 60 __ SBC #$60
1385 : 85 30 __ STA P3 
1387 : a5 50 __ LDA T2 + 1 
1389 : e9 00 __ SBC #$00
138b : 85 31 __ STA P4 
138d : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1390 : 18 __ __ CLC
1391 : a5 4f __ LDA T2 + 0 
1393 : 69 40 __ ADC #$40
1395 : 85 4f __ STA T2 + 0 
1397 : 90 02 __ BCC $139b ; (SetUpSprites.s1062 + 0)
.s1061:
1399 : e6 50 __ INC T2 + 1 
.s1062:
139b : e6 4e __ INC T1 + 0 
139d : a5 4e __ LDA T1 + 0 
139f : c9 07 __ CMP #$07
13a1 : 90 bc __ BCC $135f ; (SetUpSprites.l1059 + 0)
.s98:
13a3 : a9 00 __ LDA #$00
13a5 : 85 2d __ STA P0 
13a7 : 85 30 __ STA P3 
13a9 : 85 33 __ STA P6 
13ab : a9 49 __ LDA #$49
13ad : 85 2e __ STA P1 
13af : a9 08 __ LDA #$08
13b1 : 85 34 __ STA P7 
13b3 : a9 00 __ LDA #$00
13b5 : 85 31 __ STA P4 
13b7 : a9 3b __ LDA #$3b
13b9 : 85 32 __ STA P5 
13bb : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
13be : a9 47 __ LDA #$47
13c0 : 85 2d __ STA P0 
13c2 : a9 48 __ LDA #$48
13c4 : 85 2e __ STA P1 
13c6 : a9 0a __ LDA #$0a
13c8 : 85 2f __ STA P2 
13ca : a9 03 __ LDA #$03
13cc : 85 31 __ STA P4 
13ce : 85 32 __ STA P5 
13d0 : a9 07 __ LDA #$07
13d2 : 85 33 __ STA P6 
13d4 : a9 06 __ LDA #$06
13d6 : 85 34 __ STA P7 
13d8 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
13db : a9 08 __ LDA #$08
13dd : 85 2e __ STA P1 
13df : 85 30 __ STA P3 
13e1 : a9 00 __ LDA #$00
13e3 : 85 2f __ STA P2 
13e5 : 85 31 __ STA P4 
13e7 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
13ea : a9 48 __ LDA #$48
13ec : 85 2d __ STA P0 
13ee : 85 2e __ STA P1 
13f0 : a9 0a __ LDA #$0a
13f2 : 85 2f __ STA P2 
13f4 : a9 00 __ LDA #$00
13f6 : 85 30 __ STA P3 
13f8 : a9 03 __ LDA #$03
13fa : 85 31 __ STA P4 
13fc : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
13ff : a9 00 __ LDA #$00
1401 : 85 2f __ STA P2 
1403 : 85 31 __ STA P4 
1405 : a9 08 __ LDA #$08
1407 : 85 30 __ STA P3 
1409 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
140c : a9 01 __ LDA #$01
140e : 85 2e __ STA P1 
1410 : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
1413 : a9 49 __ LDA #$49
1415 : 85 2d __ STA P0 
1417 : a9 48 __ LDA #$48
1419 : 85 2e __ STA P1 
141b : a9 0a __ LDA #$0a
141d : 85 2f __ STA P2 
141f : a9 00 __ LDA #$00
1421 : 85 30 __ STA P3 
1423 : a9 03 __ LDA #$03
1425 : 85 31 __ STA P4 
1427 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
142a : a9 00 __ LDA #$00
142c : 85 2f __ STA P2 
142e : 85 31 __ STA P4 
1430 : a9 48 __ LDA #$48
1432 : 85 30 __ STA P3 
1434 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1437 : a9 01 __ LDA #$01
1439 : 85 2e __ STA P1 
143b : 85 2f __ STA P2 
143d : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
1440 : a9 4a __ LDA #$4a
1442 : 85 2d __ STA P0 
1444 : a9 48 __ LDA #$48
1446 : 85 2e __ STA P1 
1448 : a9 0a __ LDA #$0a
144a : 85 2f __ STA P2 
144c : a9 00 __ LDA #$00
144e : 85 30 __ STA P3 
1450 : a9 03 __ LDA #$03
1452 : 85 31 __ STA P4 
1454 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1457 : a9 08 __ LDA #$08
1459 : 85 2e __ STA P1 
145b : a9 00 __ LDA #$00
145d : 85 2f __ STA P2 
145f : 85 31 __ STA P4 
1461 : a9 48 __ LDA #$48
1463 : 85 30 __ STA P3 
1465 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1468 : a9 00 __ LDA #$00
146a : 85 2e __ STA P1 
146c : a9 01 __ LDA #$01
146e : 85 2f __ STA P2 
1470 : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
1473 : a9 00 __ LDA #$00
1475 : 85 2d __ STA P0 
1477 : 85 30 __ STA P3 
1479 : a9 49 __ LDA #$49
147b : 85 2e __ STA P1 
147d : a9 00 __ LDA #$00
147f : 85 31 __ STA P4 
1481 : a9 3b __ LDA #$3b
1483 : 85 32 __ STA P5 
1485 : a9 00 __ LDA #$00
1487 : 85 33 __ STA P6 
1489 : a9 08 __ LDA #$08
148b : 85 34 __ STA P7 
148d : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
1490 : a9 4b __ LDA #$4b
1492 : 85 2d __ STA P0 
1494 : a9 48 __ LDA #$48
1496 : 85 2e __ STA P1 
1498 : a9 0a __ LDA #$0a
149a : 85 2f __ STA P2 
149c : a9 03 __ LDA #$03
149e : 85 31 __ STA P4 
14a0 : 85 32 __ STA P5 
14a2 : a9 07 __ LDA #$07
14a4 : 85 33 __ STA P6 
14a6 : a9 06 __ LDA #$06
14a8 : 85 34 __ STA P7 
14aa : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
14ad : a9 f8 __ LDA #$f8
14af : 85 2e __ STA P1 
14b1 : a9 01 __ LDA #$01
14b3 : 85 2f __ STA P2 
14b5 : a9 08 __ LDA #$08
14b7 : 85 30 __ STA P3 
14b9 : a9 00 __ LDA #$00
14bb : 85 31 __ STA P4 
14bd : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
14c0 : a9 4c __ LDA #$4c
14c2 : 85 2d __ STA P0 
14c4 : a9 48 __ LDA #$48
14c6 : 85 2e __ STA P1 
14c8 : a9 0a __ LDA #$0a
14ca : 85 2f __ STA P2 
14cc : a9 00 __ LDA #$00
14ce : 85 30 __ STA P3 
14d0 : a9 03 __ LDA #$03
14d2 : 85 31 __ STA P4 
14d4 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
14d7 : a9 38 __ LDA #$38
14d9 : 85 2e __ STA P1 
14db : a9 02 __ LDA #$02
14dd : 85 2f __ STA P2 
14df : a9 08 __ LDA #$08
14e1 : 85 30 __ STA P3 
14e3 : a9 00 __ LDA #$00
14e5 : 85 31 __ STA P4 
14e7 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
14ea : a9 01 __ LDA #$01
14ec : 85 2e __ STA P1 
14ee : a9 00 __ LDA #$00
14f0 : 85 2f __ STA P2 
14f2 : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
14f5 : a9 4d __ LDA #$4d
14f7 : 85 2d __ STA P0 
14f9 : a9 48 __ LDA #$48
14fb : 85 2e __ STA P1 
14fd : a9 0a __ LDA #$0a
14ff : 85 2f __ STA P2 
1501 : a9 00 __ LDA #$00
1503 : 85 30 __ STA P3 
1505 : a9 03 __ LDA #$03
1507 : 85 31 __ STA P4 
1509 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
150c : a9 38 __ LDA #$38
150e : 85 2e __ STA P1 
1510 : a9 02 __ LDA #$02
1512 : 85 2f __ STA P2 
1514 : a9 48 __ LDA #$48
1516 : 85 30 __ STA P3 
1518 : a9 00 __ LDA #$00
151a : 85 31 __ STA P4 
151c : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
151f : a9 01 __ LDA #$01
1521 : 85 2e __ STA P1 
1523 : 85 2f __ STA P2 
1525 : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
1528 : a9 4e __ LDA #$4e
152a : 85 2d __ STA P0 
152c : a9 48 __ LDA #$48
152e : 85 2e __ STA P1 
1530 : a9 0a __ LDA #$0a
1532 : 85 2f __ STA P2 
1534 : a9 00 __ LDA #$00
1536 : 85 30 __ STA P3 
1538 : a9 03 __ LDA #$03
153a : 85 31 __ STA P4 
153c : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
153f : a9 f8 __ LDA #$f8
1541 : 85 2e __ STA P1 
1543 : a9 01 __ LDA #$01
1545 : 85 2f __ STA P2 
1547 : a9 48 __ LDA #$48
1549 : 85 30 __ STA P3 
154b : a9 00 __ LDA #$00
154d : 85 31 __ STA P4 
154f : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1552 : a9 00 __ LDA #$00
1554 : 85 2e __ STA P1 
1556 : 20 7c 19 JSR $197c ; (vera_spr_flip.s0 + 0)
1559 : a9 40 __ LDA #$40
155b : 85 2d __ STA P0 
155d : a9 53 __ LDA #$53
155f : 85 2e __ STA P1 
1561 : a9 00 __ LDA #$00
1563 : 85 30 __ STA P3 
1565 : 85 33 __ STA P6 
1567 : a9 02 __ LDA #$02
1569 : 85 34 __ STA P7 
156b : a9 00 __ LDA #$00
156d : 85 31 __ STA P4 
156f : a9 43 __ LDA #$43
1571 : 85 32 __ STA P5 
1573 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
1576 : a9 80 __ LDA #$80
1578 : 85 2d __ STA P0 
157a : 85 33 __ STA P6 
157c : a9 52 __ LDA #$52
157e : 85 2e __ STA P1 
1580 : a9 00 __ LDA #$00
1582 : 85 34 __ STA P7 
1584 : a9 20 __ LDA #$20
1586 : 85 31 __ STA P4 
1588 : a9 2d __ LDA #$2d
158a : 85 32 __ STA P5 
158c : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
158f : a9 00 __ LDA #$00
1591 : 85 4d __ STA T0 + 0 
1593 : a9 0a __ LDA #$0a
1595 : 85 2f __ STA P2 
1597 : a9 02 __ LDA #$02
1599 : 85 33 __ STA P6 
159b : a9 08 __ LDA #$08
159d : 85 34 __ STA P7 
.l100:
159f : a9 94 __ LDA #$94
15a1 : 85 2e __ STA P1 
15a3 : a9 01 __ LDA #$01
15a5 : 85 31 __ STA P4 
15a7 : 85 32 __ STA P5 
15a9 : 18 __ __ CLC
15aa : a5 4d __ LDA T0 + 0 
15ac : 69 4f __ ADC #$4f
15ae : 85 2d __ STA P0 
15b0 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
15b3 : a5 4d __ LDA T0 + 0 
15b5 : c9 1f __ CMP #$1f
15b7 : d0 0d __ BNE $15c6 ; (SetUpSprites.s228 + 0)
.s103:
15b9 : a9 9a __ LDA #$9a
15bb : 85 2e __ STA P1 
15bd : a9 02 __ LDA #$02
15bf : 85 31 __ STA P4 
15c1 : 85 32 __ STA P5 
15c3 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
.s228:
15c6 : e6 4d __ INC T0 + 0 
15c8 : a5 4d __ LDA T0 + 0 
15ca : c9 20 __ CMP #$20
15cc : 90 d1 __ BCC $159f ; (SetUpSprites.l100 + 0)
.s102:
15ce : a9 20 __ LDA #$20
15d0 : 85 37 __ STA P10 
15d2 : a9 40 __ LDA #$40
15d4 : 8d fc 9e STA $9efc ; (sstack + 0)
15d7 : a9 fa __ LDA #$fa
15d9 : 8d fd 9e STA $9efd ; (sstack + 1)
15dc : a9 01 __ LDA #$01
15de : 8d fe 9e STA $9efe ; (sstack + 2)
15e1 : a9 00 __ LDA #$00
15e3 : 8d ff 9e STA $9eff ; (sstack + 3)
15e6 : a9 a0 __ LDA #$a0
15e8 : 85 35 __ STA P8 
15ea : a9 2d __ LDA #$2d
15ec : 85 36 __ STA P9 
15ee : 20 02 1a JSR $1a02 ; (SetPaletteColours.s0 + 0)
15f1 : a9 60 __ LDA #$60
15f3 : 8d fc 9e STA $9efc ; (sstack + 0)
15f6 : a9 fa __ LDA #$fa
15f8 : 8d fd 9e STA $9efd ; (sstack + 1)
15fb : a9 01 __ LDA #$01
15fd : 8d fe 9e STA $9efe ; (sstack + 2)
1600 : a9 00 __ LDA #$00
1602 : 8d ff 9e STA $9eff ; (sstack + 3)
1605 : a9 c0 __ LDA #$c0
1607 : 85 35 __ STA P8 
1609 : a9 2d __ LDA #$2d
160b : 85 36 __ STA P9 
160d : 20 02 1a JSR $1a02 ; (SetPaletteColours.s0 + 0)
1610 : a9 80 __ LDA #$80
1612 : 8d fc 9e STA $9efc ; (sstack + 0)
1615 : a9 fa __ LDA #$fa
1617 : 8d fd 9e STA $9efd ; (sstack + 1)
161a : a9 01 __ LDA #$01
161c : 8d fe 9e STA $9efe ; (sstack + 2)
161f : a9 00 __ LDA #$00
1621 : 8d ff 9e STA $9eff ; (sstack + 3)
1624 : a9 e0 __ LDA #$e0
1626 : 85 35 __ STA P8 
1628 : a9 2d __ LDA #$2d
162a : 85 36 __ STA P9 
162c : 20 02 1a JSR $1a02 ; (SetPaletteColours.s0 + 0)
162f : a9 60 __ LDA #$60
1631 : 85 2d __ STA P0 
1633 : a9 20 __ LDA #$20
1635 : 85 30 __ STA P3 
1637 : a9 00 __ LDA #$00
1639 : 85 31 __ STA P4 
163b : a9 00 __ LDA #$00
163d : 85 2e __ STA P1 
163f : a9 45 __ LDA #$45
1641 : 85 2f __ STA P2 
1643 : 20 b9 19 JSR $19b9 ; (vera_pal_putn.s0 + 0)
1646 : a9 70 __ LDA #$70
1648 : 85 2d __ STA P0 
164a : a9 0c __ LDA #$0c
164c : 85 30 __ STA P3 
164e : a9 00 __ LDA #$00
1650 : 85 31 __ STA P4 
1652 : a9 0c __ LDA #$0c
1654 : 85 2e __ STA P1 
1656 : a9 45 __ LDA #$45
1658 : 85 2f __ STA P2 
165a : 20 b9 19 JSR $19b9 ; (vera_pal_putn.s0 + 0)
165d : a9 80 __ LDA #$80
165f : 85 2d __ STA P0 
1661 : a9 20 __ LDA #$20
1663 : 85 30 __ STA P3 
1665 : a9 00 __ LDA #$00
1667 : 85 31 __ STA P4 
1669 : a9 18 __ LDA #$18
166b : 85 2e __ STA P1 
166d : a9 45 __ LDA #$45
166f : 85 2f __ STA P2 
1671 : 20 b9 19 JSR $19b9 ; (vera_pal_putn.s0 + 0)
1674 : a9 90 __ LDA #$90
1676 : 85 2d __ STA P0 
1678 : a9 10 __ LDA #$10
167a : 85 30 __ STA P3 
167c : a9 00 __ LDA #$00
167e : 85 31 __ STA P4 
1680 : a9 38 __ LDA #$38
1682 : 85 2e __ STA P1 
1684 : a9 45 __ LDA #$45
1686 : 85 2f __ STA P2 
1688 : 20 b9 19 JSR $19b9 ; (vera_pal_putn.s0 + 0)
168b : a9 a0 __ LDA #$a0
168d : 85 2d __ STA P0 
168f : a9 1a __ LDA #$1a
1691 : 85 30 __ STA P3 
1693 : a9 00 __ LDA #$00
1695 : 85 31 __ STA P4 
1697 : a9 48 __ LDA #$48
1699 : 85 2e __ STA P1 
169b : a9 45 __ LDA #$45
169d : 85 2f __ STA P2 
169f : 20 b9 19 JSR $19b9 ; (vera_pal_putn.s0 + 0)
16a2 : a9 ac __ LDA #$ac
16a4 : 85 2d __ STA P0 
16a6 : a9 1e __ LDA #$1e
16a8 : 85 30 __ STA P3 
16aa : a9 00 __ LDA #$00
16ac : 85 31 __ STA P4 
16ae : a9 62 __ LDA #$62
16b0 : 85 2e __ STA P1 
16b2 : a9 45 __ LDA #$45
16b4 : 85 2f __ STA P2 
16b6 : 20 b9 19 JSR $19b9 ; (vera_pal_putn.s0 + 0)
16b9 : a9 00 __ LDA #$00
16bb : 85 2d __ STA P0 
16bd : 85 30 __ STA P3 
16bf : 85 33 __ STA P6 
16c1 : a9 45 __ LDA #$45
16c3 : 85 2e __ STA P1 
16c5 : a9 01 __ LDA #$01
16c7 : 85 2f __ STA P2 
16c9 : a9 04 __ LDA #$04
16cb : 85 34 __ STA P7 
16cd : a9 80 __ LDA #$80
16cf : 85 31 __ STA P4 
16d1 : a9 45 __ LDA #$45
16d3 : 85 32 __ STA P5 
16d5 : 20 84 18 JSR $1884 ; (vram_putn.s0 + 0)
16d8 : a9 03 __ LDA #$03
16da : 85 32 __ STA P5 
16dc : 85 34 __ STA P7 
16de : a9 08 __ LDA #$08
16e0 : 85 33 __ STA P6 
16e2 : a9 40 __ LDA #$40
16e4 : 85 35 __ STA P8 
16e6 : a9 5b __ LDA #$5b
16e8 : 85 36 __ STA P9 
16ea : a9 01 __ LDA #$01
16ec : 85 37 __ STA P10 
16ee : a9 00 __ LDA #$00
16f0 : 85 38 __ STA P11 
16f2 : 8d fc 9e STA $9efc ; (sstack + 0)
16f5 : a9 20 __ LDA #$20
16f7 : 8d fd 9e STA $9efd ; (sstack + 1)
16fa : a9 71 __ LDA #$71
16fc : 85 30 __ STA P3 
16fe : a9 1b __ LDA #$1b
1700 : 85 31 __ STA P4 
1702 : 20 29 1a JSR $1a29 ; (LoadSprite.s0 + 0)
1705 : a9 03 __ LDA #$03
1707 : 85 2d __ STA P0 
1709 : 85 31 __ STA P4 
170b : a9 da __ LDA #$da
170d : 85 2e __ STA P1 
170f : a9 0a __ LDA #$0a
1711 : 85 2f __ STA P2 
1713 : a9 00 __ LDA #$00
1715 : 85 30 __ STA P3 
1717 : a9 07 __ LDA #$07
1719 : 85 33 __ STA P6 
171b : a9 0b __ LDA #$0b
171d : 85 34 __ STA P7 
171f : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1722 : a9 08 __ LDA #$08
1724 : 85 2e __ STA P1 
1726 : 85 30 __ STA P3 
1728 : a9 00 __ LDA #$00
172a : 85 2f __ STA P2 
172c : 85 31 __ STA P4 
172e : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1731 : a9 04 __ LDA #$04
1733 : 85 2d __ STA P0 
1735 : a9 1a __ LDA #$1a
1737 : 85 2e __ STA P1 
1739 : a9 0b __ LDA #$0b
173b : 85 2f __ STA P2 
173d : a9 00 __ LDA #$00
173f : 85 30 __ STA P3 
1741 : a9 03 __ LDA #$03
1743 : 85 31 __ STA P4 
1745 : 85 33 __ STA P6 
1747 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
174a : a9 48 __ LDA #$48
174c : 85 2e __ STA P1 
174e : a9 00 __ LDA #$00
1750 : 85 2f __ STA P2 
1752 : 85 31 __ STA P4 
1754 : a9 08 __ LDA #$08
1756 : 85 30 __ STA P3 
1758 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
175b : a9 05 __ LDA #$05
175d : 85 2d __ STA P0 
175f : a9 5a __ LDA #$5a
1761 : 85 2e __ STA P1 
1763 : a9 0b __ LDA #$0b
1765 : 85 2f __ STA P2 
1767 : a9 00 __ LDA #$00
1769 : 85 30 __ STA P3 
176b : a9 03 __ LDA #$03
176d : 85 31 __ STA P4 
176f : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1772 : a9 48 __ LDA #$48
1774 : 85 2e __ STA P1 
1776 : 85 30 __ STA P3 
1778 : a9 00 __ LDA #$00
177a : 85 2f __ STA P2 
177c : 85 31 __ STA P4 
177e : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1781 : a9 06 __ LDA #$06
1783 : 85 2d __ STA P0 
1785 : a9 9a __ LDA #$9a
1787 : 85 2e __ STA P1 
1789 : a9 0b __ LDA #$0b
178b : 85 2f __ STA P2 
178d : a9 00 __ LDA #$00
178f : 85 30 __ STA P3 
1791 : a9 03 __ LDA #$03
1793 : 85 31 __ STA P4 
1795 : 20 e6 18 JSR $18e6 ; (vera_spr_set.s0 + 0)
1798 : a9 08 __ LDA #$08
179a : 85 2e __ STA P1 
179c : a9 00 __ LDA #$00
179e : 85 2f __ STA P2 
17a0 : 85 31 __ STA P4 
17a2 : a9 48 __ LDA #$48
17a4 : 85 30 __ STA P3 
17a6 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
17a9 : ad 29 9f LDA $9f29 
17ac : 09 70 __ ORA #$70
17ae : 8d 29 9f STA $9f29 
.s1001:
17b1 : 60 __ __ RTS
.s1032:
17b2 : c9 34 __ CMP #$34
17b4 : 90 05 __ BCC $17bb ; (SetUpSprites.s1031 + 0)
.s29:
17b6 : a9 09 __ LDA #$09
17b8 : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1031:
17bb : a9 2c __ LDA #$2c
17bd : c5 25 __ CMP WORK + 2 
17bf : 90 40 __ BCC $1801 ; (SetUpSprites.s1024 + 0)
.s1030:
17c1 : a5 4f __ LDA T2 + 0 
17c3 : c9 09 __ CMP #$09
17c5 : 90 06 __ BCC $17cd ; (SetUpSprites.s35 + 0)
.s1029:
17c7 : a9 45 __ LDA #$45
17c9 : c5 4f __ CMP T2 + 0 
17cb : b0 05 __ BCS $17d2 ; (SetUpSprites.s1028 + 0)
.s35:
17cd : a9 00 __ LDA #$00
17cf : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1028:
17d2 : a5 4f __ LDA T2 + 0 
17d4 : c9 13 __ CMP #$13
17d6 : 90 06 __ BCC $17de ; (SetUpSprites.s39 + 0)
.s1027:
17d8 : a9 3b __ LDA #$3b
17da : c5 4f __ CMP T2 + 0 
17dc : b0 04 __ BCS $17e2 ; (SetUpSprites.s1026 + 0)
.s39:
17de : a9 01 __ LDA #$01
17e0 : d0 12 __ BNE $17f4 ; (SetUpSprites.s236 + 0)
.s1026:
17e2 : a5 4f __ LDA T2 + 0 
17e4 : c9 1d __ CMP #$1d
17e6 : 90 06 __ BCC $17ee ; (SetUpSprites.s43 + 0)
.s1025:
17e8 : a9 31 __ LDA #$31
17ea : c5 4f __ CMP T2 + 0 
17ec : b0 04 __ BCS $17f2 ; (SetUpSprites.s44 + 0)
.s43:
17ee : a9 02 __ LDA #$02
17f0 : d0 02 __ BNE $17f4 ; (SetUpSprites.s236 + 0)
.s44:
17f2 : a9 03 __ LDA #$03
.s236:
17f4 : 8d 23 9f STA $9f23 
17f7 : a9 00 __ LDA #$00
17f9 : 8d 23 9f STA $9f23 
17fc : e6 4f __ INC T2 + 0 
17fe : 4c c1 0e JMP $0ec1 ; (SetUpSprites.l14 + 0)
.s1024:
1801 : a9 2f __ LDA #$2f
1803 : c5 25 __ CMP WORK + 2 
1805 : a5 4f __ LDA T2 + 0 
1807 : 90 33 __ BCC $183c ; (SetUpSprites.s1017 + 0)
.s1023:
1809 : c9 09 __ CMP #$09
180b : 90 06 __ BCC $1813 ; (SetUpSprites.s51 + 0)
.s1022:
180d : a9 45 __ LDA #$45
180f : c5 4f __ CMP T2 + 0 
1811 : b0 05 __ BCS $1818 ; (SetUpSprites.s1021 + 0)
.s51:
1813 : a9 05 __ LDA #$05
1815 : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1021:
1818 : a5 4f __ LDA T2 + 0 
181a : c9 13 __ CMP #$13
181c : 90 06 __ BCC $1824 ; (SetUpSprites.s55 + 0)
.s1020:
181e : a9 3b __ LDA #$3b
1820 : c5 4f __ CMP T2 + 0 
1822 : b0 04 __ BCS $1828 ; (SetUpSprites.s1019 + 0)
.s55:
1824 : a9 06 __ LDA #$06
1826 : d0 cc __ BNE $17f4 ; (SetUpSprites.s236 + 0)
.s1019:
1828 : a5 4f __ LDA T2 + 0 
182a : c9 1d __ CMP #$1d
182c : 90 06 __ BCC $1834 ; (SetUpSprites.s59 + 0)
.s1018:
182e : a9 31 __ LDA #$31
1830 : c5 4f __ CMP T2 + 0 
1832 : b0 04 __ BCS $1838 ; (SetUpSprites.s60 + 0)
.s59:
1834 : a9 07 __ LDA #$07
1836 : d0 bc __ BNE $17f4 ; (SetUpSprites.s236 + 0)
.s60:
1838 : a9 08 __ LDA #$08
183a : d0 b8 __ BNE $17f4 ; (SetUpSprites.s236 + 0)
.s1017:
183c : c9 09 __ CMP #$09
183e : 90 06 __ BCC $1846 ; (SetUpSprites.s63 + 0)
.s1016:
1840 : a9 45 __ LDA #$45
1842 : c5 4f __ CMP T2 + 0 
1844 : b0 05 __ BCS $184b ; (SetUpSprites.s1005 + 0)
.s63:
1846 : a9 0c __ LDA #$0c
1848 : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1005:
184b : a5 4f __ LDA T2 + 0 
184d : c9 13 __ CMP #$13
184f : 90 06 __ BCC $1857 ; (SetUpSprites.s67 + 0)
.s1004:
1851 : a9 3b __ LDA #$3b
1853 : c5 4f __ CMP T2 + 0 
1855 : b0 04 __ BCS $185b ; (SetUpSprites.s71 + 0)
.s67:
1857 : a9 0d __ LDA #$0d
1859 : d0 99 __ BNE $17f4 ; (SetUpSprites.s236 + 0)
.s71:
185b : a9 0e __ LDA #$0e
185d : d0 95 __ BNE $17f4 ; (SetUpSprites.s236 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
185f : 46 2d __ LSR P0 ; (bank + 0)
1861 : a9 00 __ LDA #$00
1863 : 6a __ __ ROR
1864 : 85 3b __ STA ACCU + 0 
1866 : a5 2f __ LDA P2 ; (mem + 1)
1868 : 29 f8 __ AND #$f8
186a : 4a __ __ LSR
186b : 05 3b __ ORA ACCU + 0 
186d : 85 3b __ STA ACCU + 0 
186f : a5 30 __ LDA P3 ; (height + 0)
1871 : 0a __ __ ASL
1872 : 05 3b __ ORA ACCU + 0 
1874 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1876 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1877 : 46 2d __ LSR P0 ; (bank + 0)
1879 : a9 00 __ LDA #$00
187b : 6a __ __ ROR
187c : 85 3b __ STA ACCU + 0 
187e : a5 2f __ LDA P2 ; (mem + 1)
1880 : 4a __ __ LSR
1881 : 05 3b __ ORA ACCU + 0 
.s1001:
1883 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1884 : ad 25 9f LDA $9f25 
1887 : 29 fe __ AND #$fe
1889 : 8d 25 9f STA $9f25 
188c : a5 2d __ LDA P0 ; (addr + 0)
188e : 8d 20 9f STA $9f20 
1891 : a5 2e __ LDA P1 ; (addr + 1)
1893 : 8d 21 9f STA $9f21 
1896 : a5 2f __ LDA P2 ; (addr + 2)
1898 : 29 01 __ AND #$01
189a : 09 10 __ ORA #$10
189c : 8d 22 9f STA $9f22 
189f : a5 33 __ LDA P6 ; (size + 0)
18a1 : 05 34 __ ORA P7 ; (size + 1)
18a3 : f0 19 __ BEQ $18be ; (vram_putn.s1001 + 0)
.s6:
18a5 : a0 00 __ LDY #$00
18a7 : a6 33 __ LDX P6 ; (size + 0)
18a9 : f0 02 __ BEQ $18ad ; (vram_putn.l1002 + 0)
.s1005:
18ab : e6 34 __ INC P7 ; (size + 1)
.l1002:
18ad : b1 31 __ LDA (P4),y ; (data + 0)
18af : 8d 23 9f STA $9f23 
18b2 : c8 __ __ INY
18b3 : d0 02 __ BNE $18b7 ; (vram_putn.s1009 + 0)
.s1008:
18b5 : e6 32 __ INC P5 ; (data + 1)
.s1009:
18b7 : ca __ __ DEX
18b8 : d0 f3 __ BNE $18ad ; (vram_putn.l1002 + 0)
.s1004:
18ba : c6 34 __ DEC P7 ; (size + 1)
18bc : d0 ef __ BNE $18ad ; (vram_putn.l1002 + 0)
.s1001:
18be : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
2213 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2223 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2233 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2243 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2253 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2263 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2273 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2283 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2293 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
22a3 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
22b3 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
22c3 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
22d3 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
22e3 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
22f3 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
2303 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
2313 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
2323 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
2333 : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
2343 : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
2353 : __ __ __ BYT 55 55 55 55 55 55 55 55 aa aa aa aa aa aa aa aa : UUUUUUUU........
2363 : __ __ __ BYT aa aa aa aa aa aa aa aa 88 88 88 88 88 88 88 88 : ................
2373 : __ __ __ BYT 88 88 88 88 88 88 88 88 77 77 77 77 77 77 77 77 : ........wwwwwwww
2383 : __ __ __ BYT cc cc cc cc cc cc cc cc 00 00 00 00 00 00 00 00 : ................
2393 : __ __ __ BYT 05 00 00 50 00 09 90 00 00 9b b9 00 09 b5 5b 90 : ...P..........[.
23a3 : __ __ __ BYT 09 b5 5b 90 00 9b b9 05 00 09 90 00 05 00 00 00 : ..[.............
23b3 : __ __ __ BYT 13 11 11 11 11 11 11 31 11 19 91 11 11 9b b9 11 : .......1........
23c3 : __ __ __ BYT 11 9b b9 11 11 19 91 13 11 11 11 11 13 11 11 11 : ................
23d3 : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 19 91 11 : ................
23e3 : __ __ __ BYT 11 19 91 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
--------------------------------------------------------------------
rand:
.s0:
18bf : ad f4 23 LDA $23f4 ; (seed + 1)
18c2 : 4a __ __ LSR
18c3 : ad f3 23 LDA $23f3 ; (seed + 0)
18c6 : 6a __ __ ROR
18c7 : aa __ __ TAX
18c8 : a9 00 __ LDA #$00
18ca : 6a __ __ ROR
18cb : 4d f3 23 EOR $23f3 ; (seed + 0)
18ce : 85 3b __ STA ACCU + 0 
18d0 : 8a __ __ TXA
18d1 : 4d f4 23 EOR $23f4 ; (seed + 1)
18d4 : 85 3c __ STA ACCU + 1 
18d6 : 4a __ __ LSR
18d7 : 45 3b __ EOR ACCU + 0 
18d9 : 8d f3 23 STA $23f3 ; (seed + 0)
18dc : 85 3b __ STA ACCU + 0 
18de : 45 3c __ EOR ACCU + 1 
18e0 : 8d f4 23 STA $23f4 ; (seed + 1)
18e3 : 85 3c __ STA ACCU + 1 
.s1001:
18e5 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
23f3 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
23f5 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
2405 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
2415 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
2425 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
2435 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
2445 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
2455 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
2465 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
2475 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
2485 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
2495 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
24a5 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
24b5 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
24c5 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
24d5 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
24e5 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
24f5 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
2505 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
2515 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
2525 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
2535 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
2545 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
2555 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
2565 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
2575 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
2585 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
2595 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
25a5 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
25b5 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
25c5 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
25d5 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
25e5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
25f5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2605 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2615 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
2625 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
2635 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2645 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2655 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
2665 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
2675 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
2685 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
2695 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26a5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26b5 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
26c5 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
26d5 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
26e5 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
26f5 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
2705 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
2715 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
2725 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2735 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2745 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2755 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2765 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2775 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
2785 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
2795 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
27a5 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
27b5 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
27c5 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
27d5 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
27e5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
18e6 : ad 25 9f LDA $9f25 
18e9 : 29 fe __ AND #$fe
18eb : 8d 25 9f STA $9f25 
18ee : a5 2d __ LDA P0 ; (spr + 0)
18f0 : 0a __ __ ASL
18f1 : 0a __ __ ASL
18f2 : 85 3b __ STA ACCU + 0 
18f4 : a9 3f __ LDA #$3f
18f6 : 2a __ __ ROL
18f7 : 06 3b __ ASL ACCU + 0 
18f9 : 2a __ __ ROL
18fa : 8d 21 9f STA $9f21 
18fd : a5 3b __ LDA ACCU + 0 
18ff : 8d 20 9f STA $9f20 
1902 : a9 11 __ LDA #$11
1904 : 8d 22 9f STA $9f22 
1907 : a5 30 __ LDA P3 ; (mode8 + 0)
1909 : f0 02 __ BEQ $190d ; (vera_spr_set.s11 + 0)
.s9:
190b : a9 80 __ LDA #$80
.s11:
190d : 05 2f __ ORA P2 ; (addr32 + 1)
190f : a6 2e __ LDX P1 ; (addr32 + 0)
1911 : 8e 23 9f STX $9f23 
1914 : 8d 23 9f STA $9f23 
1917 : a9 00 __ LDA #$00
1919 : 8d 23 9f STA $9f23 
191c : 8d 23 9f STA $9f23 
191f : 8d 23 9f STA $9f23 
1922 : 8d 23 9f STA $9f23 
1925 : a5 33 __ LDA P6 ; (z + 0)
1927 : 0a __ __ ASL
1928 : 0a __ __ ASL
1929 : 8d 23 9f STA $9f23 
192c : a5 32 __ LDA P5 ; (h + 0)
192e : 4a __ __ LSR
192f : 6a __ __ ROR
1930 : 29 80 __ AND #$80
1932 : 6a __ __ ROR
1933 : 85 3b __ STA ACCU + 0 
1935 : a5 31 __ LDA P4 ; (w + 0)
1937 : 0a __ __ ASL
1938 : 0a __ __ ASL
1939 : 0a __ __ ASL
193a : 0a __ __ ASL
193b : 05 3b __ ORA ACCU + 0 
193d : 05 34 __ ORA P7 ; (pal + 0)
193f : 8d 23 9f STA $9f23 
.s1001:
1942 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1943 : ad 25 9f LDA $9f25 
1946 : 29 fe __ AND #$fe
1948 : 8d 25 9f STA $9f25 
194b : a5 2d __ LDA P0 ; (spr + 0)
194d : 0a __ __ ASL
194e : 0a __ __ ASL
194f : 85 3b __ STA ACCU + 0 
1951 : a9 3f __ LDA #$3f
1953 : 2a __ __ ROL
1954 : 06 3b __ ASL ACCU + 0 
1956 : 2a __ __ ROL
1957 : aa __ __ TAX
1958 : a5 3b __ LDA ACCU + 0 
195a : 09 02 __ ORA #$02
195c : 8d 20 9f STA $9f20 
195f : 8e 21 9f STX $9f21 
1962 : a9 11 __ LDA #$11
1964 : 8d 22 9f STA $9f22 
1967 : a5 2e __ LDA P1 ; (x + 0)
1969 : 8d 23 9f STA $9f23 
196c : a5 2f __ LDA P2 ; (x + 1)
196e : 8d 23 9f STA $9f23 
1971 : a5 30 __ LDA P3 ; (y + 0)
1973 : 8d 23 9f STA $9f23 
1976 : a5 31 __ LDA P4 ; (y + 1)
1978 : 8d 23 9f STA $9f23 
.s1001:
197b : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2810 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2820 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2830 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2840 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2850 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2860 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2870 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2880 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2890 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
28a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
28b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
28c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
28d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
28e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
28f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2910 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2920 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2930 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2940 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2950 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2960 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2970 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2980 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2990 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
29a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
29b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
29c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
29d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
29e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
29f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2a00 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2a10 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2a20 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2a30 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2a40 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2a50 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2a60 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2a70 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2a80 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2a90 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
2aa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
2ab0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
2ac0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
2ad0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
2ae0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
2af0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_spr_flip:
.s0:
197c : ad 25 9f LDA $9f25 
197f : 29 fe __ AND #$fe
1981 : 8d 25 9f STA $9f25 
1984 : a5 2d __ LDA P0 ; (spr + 0)
1986 : 0a __ __ ASL
1987 : 0a __ __ ASL
1988 : 85 3b __ STA ACCU + 0 
198a : a9 3f __ LDA #$3f
198c : 2a __ __ ROL
198d : 06 3b __ ASL ACCU + 0 
198f : 2a __ __ ROL
1990 : aa __ __ TAX
1991 : a5 3b __ LDA ACCU + 0 
1993 : 09 06 __ ORA #$06
1995 : 8d 20 9f STA $9f20 
1998 : 8e 21 9f STX $9f21 
199b : a9 01 __ LDA #$01
199d : 8d 22 9f STA $9f22 
19a0 : ad 23 9f LDA $9f23 
19a3 : 29 fc __ AND #$fc
19a5 : a8 __ __ TAY
19a6 : a5 2e __ LDA P1 ; (fliph + 0)
19a8 : f0 01 __ BEQ $19ab ; (vera_spr_flip.s14 + 0)
.s6:
19aa : c8 __ __ INY
.s14:
19ab : a5 2f __ LDA P2 ; (flipv + 0)
19ad : f0 05 __ BEQ $19b4 ; (vera_spr_flip.s11 + 0)
.s9:
19af : 98 __ __ TYA
19b0 : 09 02 __ ORA #$02
19b2 : d0 01 __ BNE $19b5 ; (vera_spr_flip.s1002 + 0)
.s11:
19b4 : 98 __ __ TYA
.s1002:
19b5 : 8d 23 9f STA $9f23 
.s1001:
19b8 : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
19b9 : ad 25 9f LDA $9f25 
19bc : 29 fe __ AND #$fe
19be : 8d 25 9f STA $9f25 
19c1 : a5 2d __ LDA P0 ; (index + 0)
19c3 : 0a __ __ ASL
19c4 : 8d 20 9f STA $9f20 
19c7 : a9 7d __ LDA #$7d
19c9 : 2a __ __ ROL
19ca : 8d 21 9f STA $9f21 
19cd : a9 11 __ LDA #$11
19cf : 8d 22 9f STA $9f22 
19d2 : a5 30 __ LDA P3 ; (size + 0)
19d4 : 05 31 __ ORA P4 ; (size + 1)
19d6 : f0 29 __ BEQ $1a01 ; (vera_pal_putn.s1001 + 0)
.s6:
19d8 : a6 30 __ LDX P3 ; (size + 0)
19da : f0 02 __ BEQ $19de ; (vera_pal_putn.l3 + 0)
.s1003:
19dc : e6 31 __ INC P4 ; (size + 1)
.l3:
19de : a0 01 __ LDY #$01
19e0 : b1 2e __ LDA (P1),y ; (color + 0)
19e2 : 85 3c __ STA ACCU + 1 
19e4 : 88 __ __ DEY
19e5 : b1 2e __ LDA (P1),y ; (color + 0)
19e7 : 8d 23 9f STA $9f23 
19ea : a5 3c __ LDA ACCU + 1 
19ec : 8d 23 9f STA $9f23 
19ef : 18 __ __ CLC
19f0 : a5 2e __ LDA P1 ; (color + 0)
19f2 : 69 02 __ ADC #$02
19f4 : 85 2e __ STA P1 ; (color + 0)
19f6 : 90 02 __ BCC $19fa ; (vera_pal_putn.s1007 + 0)
.s1006:
19f8 : e6 2f __ INC P2 ; (color + 1)
.s1007:
19fa : ca __ __ DEX
19fb : d0 e1 __ BNE $19de ; (vera_pal_putn.l3 + 0)
.s1002:
19fd : c6 31 __ DEC P4 ; (size + 1)
19ff : d0 dd __ BNE $19de ; (vera_pal_putn.l3 + 0)
.s1001:
1a01 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2b00 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2b10 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b60 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2b70 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2b80 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2b90 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2ba0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2bb0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2bc0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2bd0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2be0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2bf0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2c00 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2c10 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2c20 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2c30 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2c40 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2c50 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2c60 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2c70 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2c80 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2c90 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2ca0 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2cb0 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2cc0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2cd0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2ce0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2cf0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2d00 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2d10 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
2e00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2e10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2e20 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2e30 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2e40 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2e50 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2e60 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2e70 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2e80 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2e90 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
2ea0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
2eb0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
2ec0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
2ed0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
2ee0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
2ef0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2f10 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2f30 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2f40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2f50 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2f60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2f70 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2f80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2f90 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2fa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2fb0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2fc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2fd0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2fe0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2ff0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3000 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
3010 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3020 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
3030 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
3040 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
3050 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
3060 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3070 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
3080 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3090 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
30a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
30b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
30c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
30d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
30e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
30f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3100 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
3110 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3120 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3130 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
3140 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3150 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
3160 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3170 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
3180 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3190 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
31a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
31b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
31c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
31d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
31e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
31f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3200 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
3210 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3220 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
3230 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
3240 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
3250 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
3260 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3270 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
3280 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3290 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
32a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
32b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
32c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
32d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
32e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
32f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
3300 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3310 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3320 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3330 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3340 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3350 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3360 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3370 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3380 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3390 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
33a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
33b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
33c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
33d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
33e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
33f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3400 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3410 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3420 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3430 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3440 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3450 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3460 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3470 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3480 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3490 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
34a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
34b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
34c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
34d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
34e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
34f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3500 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3510 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3520 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3530 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3540 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3550 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3560 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3570 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3580 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3590 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
35a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
35b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
35c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
35d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
35e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
35f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3600 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3610 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3620 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3630 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3640 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3650 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3660 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3670 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3680 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3690 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
36a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
36b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
36c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
36d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
36e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
36f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3700 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3710 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3720 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3730 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3740 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3750 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3760 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3770 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3780 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3790 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
37a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
37b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
37c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
37d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
37e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
37f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3800 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3810 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3820 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3830 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3840 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3850 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3860 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3870 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3880 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3890 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
38a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
38b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
38c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
38d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
38e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
38f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3900 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3910 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3920 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3930 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3940 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3950 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3960 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3970 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3980 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3990 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
39a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
39b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
39c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
39d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
39e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
39f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3a00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3a10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3a20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3a30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3a40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3a50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3a60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3a70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3a80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3a90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3aa0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3ab0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3ac0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3ad0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3ae0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3af0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
CharBox:
3b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b20 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3b40 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3b50 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3b60 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3b70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3b80 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3b90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3ba0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3bb0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3bc0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
3bd0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3be0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3bf0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3c00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3c20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3c40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3c60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3c80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3ca0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cb0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3cc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3ce0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cf0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3d00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3d20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3d40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3d60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3d80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3da0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3db0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3dc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3dd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3de0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3df0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3e00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3e20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3e40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3e60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3e80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3ea0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3eb0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3ec0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ed0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3ee0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ef0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3f00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f10 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3f20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f30 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3f40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f50 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3f60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f70 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3f80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f90 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3fa0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3fb0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3fc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3fd0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3fe0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ff0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4000 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4010 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4020 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4030 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4040 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4050 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4060 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4070 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4080 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4090 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
40a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
40b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
40c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
40d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
40e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
40f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4100 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4110 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4120 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4130 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4140 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4150 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4160 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4170 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4180 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4190 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
41a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
41b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
41c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
41d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
41e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
41f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4200 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4210 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4220 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4230 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4240 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4250 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4260 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4270 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
4280 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
4290 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
42a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
42b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
42c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
42d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
42e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
42f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
--------------------------------------------------------------------
WavyHead:
4300 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
4310 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4320 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4330 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4340 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4350 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4360 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
4370 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4380 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4390 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
43a0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
43b0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
43c0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
43d0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
43e0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
43f0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4400 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4410 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4420 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4430 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4440 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4450 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4460 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4470 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4480 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4490 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
44a0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
44b0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
44c0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
44d0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
44e0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
44f0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
2d20 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2d30 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
2d40 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
2d50 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
2d60 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
2d70 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
2d80 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
2d90 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1a02 : ad fc 9e LDA $9efc ; (sstack + 0)
1a05 : 85 2d __ STA P0 
1a07 : ad fd 9e LDA $9efd ; (sstack + 1)
1a0a : 85 2e __ STA P1 
1a0c : ad fe 9e LDA $9efe ; (sstack + 2)
1a0f : 85 2f __ STA P2 
1a11 : ad ff 9e LDA $9eff ; (sstack + 3)
1a14 : 85 30 __ STA P3 
1a16 : a5 35 __ LDA P8 ; (input + 0)
1a18 : 85 31 __ STA P4 
1a1a : a5 36 __ LDA P9 ; (input + 1)
1a1c : 85 32 __ STA P5 
1a1e : a5 37 __ LDA P10 ; (inputsize + 0)
1a20 : 85 33 __ STA P6 
1a22 : a9 00 __ LDA #$00
1a24 : 85 34 __ STA P7 
1a26 : 4c 84 18 JMP $1884 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
2da0 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
2db0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
2dc0 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
2dd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
2de0 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
2df0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
4500 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
450c : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
4518 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
4528 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
4538 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
4548 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
4558 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
CrispyPal:
4562 : __ __ __ BYT 00 00 00 00 12 01 22 02 ff 0f 0b 07 0f 0a 24 02 : ......".......$.
4572 : __ __ __ BYT 10 06 39 03 00 04 d9 0d bf 00 dd 0d aa 0a       : ..9...........
--------------------------------------------------------------------
EyeTri:
4580 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4590 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
45a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
45c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
45e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4600 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4620 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4630 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4640 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4650 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4660 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4670 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
4680 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4690 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
46a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
46b0 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
46c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
46d0 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
46e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
46f0 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4710 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4730 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4750 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4760 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4770 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4780 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
4790 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
47a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
47b0 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
47c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
47d0 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
47e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
47f0 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4810 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4820 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4830 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4840 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4850 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
4860 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
4870 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
4880 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
4890 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
48a0 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
48b0 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
48c0 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
48d0 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
48e0 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
48f0 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4900 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4910 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4920 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4930 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4940 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4950 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
4960 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4970 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
1a29 : a5 30 __ LDA P3 ; (name + 0)
1a2b : 85 2d __ STA P0 
1a2d : a5 31 __ LDA P4 ; (name + 1)
1a2f : 85 2e __ STA P1 
1a31 : 20 aa 1a JSR $1aaa ; (krnio_setnam.s0 + 0)
1a34 : a5 32 __ LDA P5 ; (fnum + 0)
1a36 : 85 2d __ STA P0 
1a38 : a5 33 __ LDA P6 ; (device + 0)
1a3a : 85 2e __ STA P1 
1a3c : a5 34 __ LDA P7 ; (channel + 0)
1a3e : 85 2f __ STA P2 
1a40 : 20 c0 1a JSR $1ac0 ; (krnio_open.s0 + 0)
1a43 : a5 32 __ LDA P5 ; (fnum + 0)
1a45 : 85 2e __ STA P1 
1a47 : 20 e8 1a JSR $1ae8 ; (krnio_getch.s0 + 0)
1a4a : a5 32 __ LDA P5 ; (fnum + 0)
1a4c : 85 2e __ STA P1 
1a4e : 20 e8 1a JSR $1ae8 ; (krnio_getch.s0 + 0)
1a51 : ad fd 9e LDA $9efd ; (sstack + 1)
1a54 : 85 4a __ STA T0 + 1 
1a56 : ad fc 9e LDA $9efc ; (sstack + 0)
1a59 : 85 49 __ STA T0 + 0 
1a5b : 05 4a __ ORA T0 + 1 
1a5d : f0 46 __ BEQ $1aa5 ; (LoadSprite.s4 + 0)
.s8:
1a5f : a9 00 __ LDA #$00
1a61 : 85 4b __ STA T2 + 0 
1a63 : 85 4c __ STA T2 + 1 
.l2:
1a65 : a5 32 __ LDA P5 ; (fnum + 0)
1a67 : 85 2e __ STA P1 
1a69 : 20 e8 1a JSR $1ae8 ; (krnio_getch.s0 + 0)
1a6c : ad 25 9f LDA $9f25 
1a6f : 29 fe __ AND #$fe
1a71 : 8d 25 9f STA $9f25 
1a74 : 18 __ __ CLC
1a75 : a5 4b __ LDA T2 + 0 
1a77 : 65 35 __ ADC P8 ; (Addr + 0)
1a79 : 8d 20 9f STA $9f20 
1a7c : a5 4c __ LDA T2 + 1 
1a7e : 65 36 __ ADC P9 ; (Addr + 1)
1a80 : 8d 21 9f STA $9f21 
1a83 : a9 00 __ LDA #$00
1a85 : 65 37 __ ADC P10 ; (Addr + 2)
1a87 : 29 01 __ AND #$01
1a89 : 09 10 __ ORA #$10
1a8b : 8d 22 9f STA $9f22 
1a8e : a5 3b __ LDA ACCU + 0 
1a90 : 8d 23 9f STA $9f23 
1a93 : e6 4b __ INC T2 + 0 
1a95 : d0 02 __ BNE $1a99 ; (LoadSprite.s1005 + 0)
.s1004:
1a97 : e6 4c __ INC T2 + 1 
.s1005:
1a99 : a5 4c __ LDA T2 + 1 
1a9b : c5 4a __ CMP T0 + 1 
1a9d : d0 04 __ BNE $1aa3 ; (LoadSprite.s1003 + 0)
.s1002:
1a9f : a5 4b __ LDA T2 + 0 
1aa1 : c5 49 __ CMP T0 + 0 
.s1003:
1aa3 : 90 c0 __ BCC $1a65 ; (LoadSprite.l2 + 0)
.s4:
1aa5 : a5 32 __ LDA P5 ; (fnum + 0)
1aa7 : 4c 69 1b JMP $1b69 ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
1aaa : a5 2d __ LDA P0 
1aac : 05 2e __ ORA P1 
1aae : f0 08 __ BEQ $1ab8 ; (krnio_setnam.s0 + 14)
1ab0 : a0 ff __ LDY #$ff
1ab2 : c8 __ __ INY
1ab3 : b1 2d __ LDA (P0),y 
1ab5 : d0 fb __ BNE $1ab2 ; (krnio_setnam.s0 + 8)
1ab7 : 98 __ __ TYA
1ab8 : a6 2d __ LDX P0 
1aba : a4 2e __ LDY P1 
1abc : 20 bd ff JSR $ffbd 
.s1001:
1abf : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1ac0 : a9 00 __ LDA #$00
1ac2 : a6 2d __ LDX P0 ; (fnum + 0)
1ac4 : 9d ef 49 STA $49ef,x ; (krnio_pstatus + 0)
1ac7 : a9 00 __ LDA #$00
1ac9 : 85 3b __ STA ACCU + 0 
1acb : 85 3c __ STA ACCU + 1 
1acd : a5 2d __ LDA P0 ; (fnum + 0)
1acf : a6 2e __ LDX P1 
1ad1 : a4 2f __ LDY P2 
1ad3 : 20 ba ff JSR $ffba 
1ad6 : 20 c0 ff JSR $ffc0 
1ad9 : 90 08 __ BCC $1ae3 ; (krnio_open.s0 + 35)
1adb : a5 2d __ LDA P0 ; (fnum + 0)
1add : 20 c3 ff JSR $ffc3 
1ae0 : 4c e7 1a JMP $1ae7 ; (krnio_open.s1001 + 0)
1ae3 : a9 01 __ LDA #$01
1ae5 : 85 3b __ STA ACCU + 0 
.s1001:
1ae7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
49ef : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_getch:
.s0:
1ae8 : a4 2e __ LDY P1 ; (fnum + 0)
1aea : b9 ef 49 LDA $49ef,y ; (krnio_pstatus + 0)
1aed : c9 40 __ CMP #$40
1aef : f0 48 __ BEQ $1b39 ; (krnio_getch.s1007 + 0)
.s3:
1af1 : a9 ff __ LDA #$ff
1af3 : 85 47 __ STA T3 + 0 
1af5 : 85 48 __ STA T3 + 1 
1af7 : 98 __ __ TYA
1af8 : 20 3f 1b JSR $1b3f ; (krnio_chkin.s1000 + 0)
1afb : a5 3b __ LDA ACCU + 0 
1afd : f0 19 __ BEQ $1b18 ; (krnio_getch.s7 + 0)
.s5:
1aff : 20 51 1b JSR $1b51 ; (krnio_chrin.s0 + 0)
1b02 : a5 3b __ LDA ACCU + 0 
1b04 : 85 47 __ STA T3 + 0 
1b06 : a5 3c __ LDA ACCU + 1 
1b08 : 85 48 __ STA T3 + 1 
1b0a : 20 5b 1b JSR $1b5b ; (krnio_status.s0 + 0)
1b0d : a5 3b __ LDA ACCU + 0 
1b0f : a6 2e __ LDX P1 ; (fnum + 0)
1b11 : 9d ef 49 STA $49ef,x ; (krnio_pstatus + 0)
1b14 : 09 00 __ ORA #$00
1b16 : d0 0c __ BNE $1b24 ; (krnio_getch.s8 + 0)
.s7:
1b18 : 20 65 1b JSR $1b65 ; (krnio_clrchn.s0 + 0)
1b1b : a5 47 __ LDA T3 + 0 
1b1d : 85 3b __ STA ACCU + 0 
1b1f : a5 48 __ LDA T3 + 1 
.s1006:
1b21 : 85 3c __ STA ACCU + 1 
.s1001:
1b23 : 60 __ __ RTS
.s8:
1b24 : c9 40 __ CMP #$40
1b26 : d0 0e __ BNE $1b36 ; (krnio_getch.s12 + 0)
.s11:
1b28 : 20 65 1b JSR $1b65 ; (krnio_clrchn.s0 + 0)
1b2b : a5 48 __ LDA T3 + 1 
1b2d : 09 01 __ ORA #$01
1b2f : 85 3c __ STA ACCU + 1 
1b31 : a5 47 __ LDA T3 + 0 
1b33 : 85 3b __ STA ACCU + 0 
1b35 : 60 __ __ RTS
.s12:
1b36 : 20 65 1b JSR $1b65 ; (krnio_clrchn.s0 + 0)
.s1007:
1b39 : a9 ff __ LDA #$ff
1b3b : 85 3b __ STA ACCU + 0 
1b3d : d0 e2 __ BNE $1b21 ; (krnio_getch.s1006 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1b3f : 85 2d __ STA P0 
.s0:
1b41 : a6 2d __ LDX P0 
1b43 : 20 c6 ff JSR $ffc6 
1b46 : a9 00 __ LDA #$00
1b48 : 85 3c __ STA ACCU + 1 
1b4a : b0 02 __ BCS $1b4e ; (krnio_chkin.s0 + 13)
1b4c : a9 01 __ LDA #$01
1b4e : 85 3b __ STA ACCU + 0 
.s1001:
1b50 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1b51 : 20 cf ff JSR $ffcf 
1b54 : 85 3b __ STA ACCU + 0 
1b56 : a9 00 __ LDA #$00
1b58 : 85 3c __ STA ACCU + 1 
.s1001:
1b5a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1b5b : 20 b7 ff JSR $ffb7 
1b5e : 85 3b __ STA ACCU + 0 
1b60 : a9 00 __ LDA #$00
1b62 : 85 3c __ STA ACCU + 1 
.s1001:
1b64 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1b65 : 20 cc ff JSR $ffcc 
.s1001:
1b68 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1b69 : 85 2d __ STA P0 
.s0:
1b6b : a5 2d __ LDA P0 
1b6d : 20 c3 ff JSR $ffc3 
.s1001:
1b70 : 60 __ __ RTS
--------------------------------------------------------------------
1b71 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 43 52 49 53 : @0:/sprites/CRIS
1b81 : __ __ __ BYT 50 59 2e 42 49 4e 2c 50 2c 52 00                : PY.BIN,P,R.
--------------------------------------------------------------------
BGPal:
4980 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
4990 : __ __ __ BYT 99 09 9b 0f bb 0b ee 0f 44 04 ff 0f ff 0f ff 0f : ........D.......
--------------------------------------------------------------------
getchx:
.s0:
1b8c : 20 96 1b JSR $1b96 ; (getpch + 0)
1b8f : 85 3b __ STA ACCU + 0 
1b91 : a9 00 __ LDA #$00
1b93 : 85 3c __ STA ACCU + 1 
.s1001:
1b95 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1b96 : 20 e4 ff JSR $ffe4 
1b99 : ae f5 27 LDX $27f5 ; (giocharmap + 0)
1b9c : e0 01 __ CPX #$01
1b9e : 90 26 __ BCC $1bc6 ; (getpch + 48)
1ba0 : c9 0d __ CMP #$0d
1ba2 : d0 02 __ BNE $1ba6 ; (getpch + 16)
1ba4 : a9 0a __ LDA #$0a
1ba6 : e0 02 __ CPX #$02
1ba8 : 90 1c __ BCC $1bc6 ; (getpch + 48)
1baa : c9 db __ CMP #$db
1bac : b0 18 __ BCS $1bc6 ; (getpch + 48)
1bae : c9 41 __ CMP #$41
1bb0 : 90 14 __ BCC $1bc6 ; (getpch + 48)
1bb2 : c9 c1 __ CMP #$c1
1bb4 : 90 02 __ BCC $1bb8 ; (getpch + 34)
1bb6 : 49 a0 __ EOR #$a0
1bb8 : c9 7b __ CMP #$7b
1bba : b0 0a __ BCS $1bc6 ; (getpch + 48)
1bbc : c9 61 __ CMP #$61
1bbe : b0 04 __ BCS $1bc4 ; (getpch + 46)
1bc0 : c9 5b __ CMP #$5b
1bc2 : b0 02 __ BCS $1bc6 ; (getpch + 48)
1bc4 : 49 20 __ EOR #$20
1bc6 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
27f5 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
27f6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
27f8 : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
27fa : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
27fc : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1bc7 : a9 33 __ LDA #$33
1bc9 : 85 2d __ STA P0 
1bcb : a9 38 __ LDA #$38
1bcd : 85 2e __ STA P1 
1bcf : a9 01 __ LDA #$01
1bd1 : 85 2f __ STA P2 
1bd3 : a6 32 __ LDX P5 ; (p + 0)
1bd5 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1bd8 : 4a __ __ LSR
1bd9 : 4a __ __ LSR
1bda : 4a __ __ LSR
1bdb : 49 10 __ EOR #$10
1bdd : 38 __ __ SEC
1bde : e9 10 __ SBC #$10
1be0 : 18 __ __ CLC
1be1 : 69 b4 __ ADC #$b4
1be3 : 85 30 __ STA P3 
1be5 : a9 00 __ LDA #$00
1be7 : 85 31 __ STA P4 
1be9 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1bec : a9 34 __ LDA #$34
1bee : 85 2d __ STA P0 
1bf0 : a9 20 __ LDA #$20
1bf2 : 85 2e __ STA P1 
1bf4 : a6 34 __ LDX P7 ; (p2 + 0)
1bf6 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1bf9 : 4a __ __ LSR
1bfa : 4a __ __ LSR
1bfb : 4a __ __ LSR
1bfc : 49 10 __ EOR #$10
1bfe : 38 __ __ SEC
1bff : e9 10 __ SBC #$10
1c01 : 18 __ __ CLC
1c02 : 69 b4 __ ADC #$b4
1c04 : 85 30 __ STA P3 
1c06 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1c09 : a9 35 __ LDA #$35
1c0b : 85 2d __ STA P0 
1c0d : a9 00 __ LDA #$00
1c0f : 85 2e __ STA P1 
1c11 : a6 36 __ LDX P9 ; (p3 + 0)
1c13 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1c16 : 4a __ __ LSR
1c17 : 4a __ __ LSR
1c18 : 4a __ __ LSR
1c19 : 49 10 __ EOR #$10
1c1b : 38 __ __ SEC
1c1c : e9 10 __ SBC #$10
1c1e : 18 __ __ CLC
1c1f : 69 a4 __ ADC #$a4
1c21 : 85 30 __ STA P3 
1c23 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1c26 : a9 36 __ LDA #$36
1c28 : 85 2d __ STA P0 
1c2a : a9 40 __ LDA #$40
1c2c : 85 2e __ STA P1 
1c2e : a6 36 __ LDX P9 ; (p3 + 0)
1c30 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1c33 : 4a __ __ LSR
1c34 : 4a __ __ LSR
1c35 : 4a __ __ LSR
1c36 : 49 10 __ EOR #$10
1c38 : 38 __ __ SEC
1c39 : e9 10 __ SBC #$10
1c3b : 18 __ __ CLC
1c3c : 69 a4 __ ADC #$a4
1c3e : 85 30 __ STA P3 
1c40 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1c43 : a9 37 __ LDA #$37
1c45 : 85 2d __ STA P0 
1c47 : a9 00 __ LDA #$00
1c49 : 85 2e __ STA P1 
1c4b : a6 36 __ LDX P9 ; (p3 + 0)
1c4d : bd 00 4a LDA $4a00,x ; (sintab + 0)
1c50 : 4a __ __ LSR
1c51 : 4a __ __ LSR
1c52 : 4a __ __ LSR
1c53 : 49 10 __ EOR #$10
1c55 : 38 __ __ SEC
1c56 : e9 10 __ SBC #$10
1c58 : 18 __ __ CLC
1c59 : 69 c4 __ ADC #$c4
1c5b : 85 30 __ STA P3 
1c5d : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1c60 : a9 38 __ LDA #$38
1c62 : 85 2d __ STA P0 
1c64 : a9 40 __ LDA #$40
1c66 : 85 2e __ STA P1 
1c68 : a6 36 __ LDX P9 ; (p3 + 0)
1c6a : bd 00 4a LDA $4a00,x ; (sintab + 0)
1c6d : 4a __ __ LSR
1c6e : 4a __ __ LSR
1c6f : 4a __ __ LSR
1c70 : 49 10 __ EOR #$10
1c72 : 38 __ __ SEC
1c73 : e9 10 __ SBC #$10
1c75 : 18 __ __ CLC
1c76 : 69 c4 __ ADC #$c4
1c78 : 85 30 __ STA P3 
1c7a : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1c7d : a9 00 __ LDA #$00
1c7f : 85 2d __ STA P0 
1c81 : 85 2f __ STA P2 
1c83 : a9 68 __ LDA #$68
1c85 : 85 2e __ STA P1 
1c87 : a6 36 __ LDX P9 ; (p3 + 0)
1c89 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1c8c : 4a __ __ LSR
1c8d : 4a __ __ LSR
1c8e : 4a __ __ LSR
1c8f : 4a __ __ LSR
1c90 : 49 08 __ EOR #$08
1c92 : 38 __ __ SEC
1c93 : e9 08 __ SBC #$08
1c95 : 85 48 __ STA T2 + 0 
1c97 : a9 00 __ LDA #$00
1c99 : e9 00 __ SBC #$00
1c9b : 85 49 __ STA T2 + 1 
1c9d : 38 __ __ SEC
1c9e : a9 b6 __ LDA #$b6
1ca0 : e5 48 __ SBC T2 + 0 
1ca2 : 85 30 __ STA P3 
1ca4 : a9 01 __ LDA #$01
1ca6 : e5 49 __ SBC T2 + 1 
1ca8 : 85 31 __ STA P4 
1caa : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1cad : a9 01 __ LDA #$01
1caf : 85 2d __ STA P0 
1cb1 : 85 2f __ STA P2 
1cb3 : a9 f0 __ LDA #$f0
1cb5 : 85 2e __ STA P1 
1cb7 : a6 36 __ LDX P9 ; (p3 + 0)
1cb9 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1cbc : 4a __ __ LSR
1cbd : 4a __ __ LSR
1cbe : 4a __ __ LSR
1cbf : 4a __ __ LSR
1cc0 : 49 08 __ EOR #$08
1cc2 : 38 __ __ SEC
1cc3 : e9 08 __ SBC #$08
1cc5 : a8 __ __ TAY
1cc6 : a9 00 __ LDA #$00
1cc8 : e9 00 __ SBC #$00
1cca : aa __ __ TAX
1ccb : 98 __ __ TYA
1ccc : 18 __ __ CLC
1ccd : 69 b6 __ ADC #$b6
1ccf : 85 30 __ STA P3 
1cd1 : 8a __ __ TXA
1cd2 : 69 01 __ ADC #$01
1cd4 : 85 31 __ STA P4 
1cd6 : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1cd9 : a9 00 __ LDA #$00
1cdb : 85 47 __ STA T1 + 0 
1cdd : 18 __ __ CLC
.l2:
1cde : a5 47 __ LDA T1 + 0 
1ce0 : 69 4f __ ADC #$4f
1ce2 : 85 2d __ STA P0 
1ce4 : a5 47 __ LDA T1 + 0 
1ce6 : 0a __ __ ASL
1ce7 : 65 47 __ ADC T1 + 0 
1ce9 : 0a __ __ ASL
1cea : 0a __ __ ASL
1ceb : 18 __ __ CLC
1cec : 6d fe 27 ADC $27fe ; (FrameCount + 0)
1cef : aa __ __ TAX
1cf0 : ac ff 27 LDY $27ff ; (FrameCount + 1)
1cf3 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1cf6 : 10 01 __ BPL $1cf9 ; (MoveSprites.s1008 + 0)
.s1007:
1cf8 : 88 __ __ DEY
.s1008:
1cf9 : 18 __ __ CLC
1cfa : 6d fe 27 ADC $27fe ; (FrameCount + 0)
1cfd : 85 48 __ STA T2 + 0 
1cff : 90 01 __ BCC $1d02 ; (MoveSprites.s1009 + 0)
.s1006:
1d01 : c8 __ __ INY
.s1009:
1d02 : 84 49 __ STY T2 + 1 
1d04 : a5 47 __ LDA T1 + 0 
1d06 : 0a __ __ ASL
1d07 : 0a __ __ ASL
1d08 : 85 3b __ STA ACCU + 0 
1d0a : a9 00 __ LDA #$00
1d0c : 85 3c __ STA ACCU + 1 
1d0e : a9 80 __ LDA #$80
1d10 : 85 23 __ STA WORK + 0 
1d12 : a9 02 __ LDA #$02
1d14 : 85 24 __ STA WORK + 1 
1d16 : 20 61 21 JSR $2161 ; (divmod + 0)
1d19 : 18 __ __ CLC
1d1a : a5 25 __ LDA WORK + 2 
1d1c : 65 48 __ ADC T2 + 0 
1d1e : 85 2e __ STA P1 
1d20 : a5 26 __ LDA WORK + 3 
1d22 : 65 49 __ ADC T2 + 1 
1d24 : 85 2f __ STA P2 
1d26 : a5 47 __ LDA T1 + 0 
1d28 : 0a __ __ ASL
1d29 : 0a __ __ ASL
1d2a : 65 47 __ ADC T1 + 0 
1d2c : 85 48 __ STA T2 + 0 
1d2e : ad fe 27 LDA $27fe ; (FrameCount + 0)
1d31 : 38 __ __ SEC
1d32 : e9 40 __ SBC #$40
1d34 : 18 __ __ CLC
1d35 : 65 48 __ ADC T2 + 0 
1d37 : aa __ __ TAX
1d38 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1d3b : a8 __ __ TAY
1d3c : 29 80 __ AND #$80
1d3e : 10 02 __ BPL $1d42 ; (MoveSprites.s1009 + 64)
1d40 : a9 ff __ LDA #$ff
1d42 : 85 49 __ STA T2 + 1 
1d44 : a5 47 __ LDA T1 + 0 
1d46 : 0a __ __ ASL
1d47 : 0a __ __ ASL
1d48 : 0a __ __ ASL
1d49 : 85 3b __ STA ACCU + 0 
1d4b : ad fe 27 LDA $27fe ; (FrameCount + 0)
1d4e : 38 __ __ SEC
1d4f : e9 20 __ SBC #$20
1d51 : 18 __ __ CLC
1d52 : 65 3b __ ADC ACCU + 0 
1d54 : aa __ __ TAX
1d55 : bd 00 4a LDA $4a00,x ; (sintab + 0)
1d58 : 4a __ __ LSR
1d59 : 4a __ __ LSR
1d5a : 4a __ __ LSR
1d5b : 4a __ __ LSR
1d5c : 49 08 __ EOR #$08
1d5e : 38 __ __ SEC
1d5f : e9 08 __ SBC #$08
1d61 : 85 4a __ STA T3 + 0 
1d63 : a9 00 __ LDA #$00
1d65 : e9 00 __ SBC #$00
1d67 : 85 4b __ STA T3 + 1 
1d69 : a5 47 __ LDA T1 + 0 
1d6b : 0a __ __ ASL
1d6c : 65 47 __ ADC T1 + 0 
1d6e : 85 3b __ STA ACCU + 0 
1d70 : a5 47 __ LDA T1 + 0 
1d72 : c9 1f __ CMP #$1f
1d74 : f0 27 __ BEQ $1d9d ; (MoveSprites.s5 + 0)
.s6:
1d76 : 98 __ __ TYA
1d77 : 18 __ __ CLC
1d78 : 69 80 __ ADC #$80
1d7a : 18 __ __ CLC
1d7b : 65 4a __ ADC T3 + 0 
1d7d : a8 __ __ TAY
1d7e : a9 00 __ LDA #$00
1d80 : 65 4b __ ADC T3 + 1 
1d82 : aa __ __ TAX
1d83 : 98 __ __ TYA
1d84 : 18 __ __ CLC
1d85 : 65 3b __ ADC ACCU + 0 
1d87 : 85 30 __ STA P3 
1d89 : 90 01 __ BCC $1d8c ; (MoveSprites.s1013 + 0)
.s1012:
1d8b : e8 __ __ INX
.s1013:
1d8c : 86 31 __ STX P4 
1d8e : 20 43 19 JSR $1943 ; (vera_spr_move.s0 + 0)
1d91 : e6 47 __ INC T1 + 0 
1d93 : a5 47 __ LDA T1 + 0 
1d95 : c9 20 __ CMP #$20
1d97 : b0 03 __ BCS $1d9c ; (MoveSprites.s1001 + 0)
1d99 : 4c de 1c JMP $1cde ; (MoveSprites.l2 + 0)
.s1001:
1d9c : 60 __ __ RTS
.s5:
1d9d : 98 __ __ TYA
1d9e : 18 __ __ CLC
1d9f : 69 78 __ ADC #$78
1da1 : a8 __ __ TAY
1da2 : a5 49 __ LDA T2 + 1 
1da4 : 69 00 __ ADC #$00
1da6 : aa __ __ TAX
1da7 : 98 __ __ TYA
1da8 : 18 __ __ CLC
1da9 : 65 4a __ ADC T3 + 0 
1dab : a8 __ __ TAY
1dac : 8a __ __ TXA
1dad : 65 4b __ ADC T3 + 1 
1daf : aa __ __ TAX
1db0 : 98 __ __ TYA
1db1 : 18 __ __ CLC
1db2 : 65 3b __ ADC ACCU + 0 
1db4 : 85 30 __ STA P3 
1db6 : 90 01 __ BCC $1db9 ; (MoveSprites.s1011 + 0)
.s1010:
1db8 : e8 __ __ INX
.s1011:
1db9 : 86 31 __ STX P4 
1dbb : 4c 43 19 JMP $1943 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4a00 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4a10 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4a20 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4a30 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4a40 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4a50 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4a60 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4a70 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4a80 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4a90 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
4aa0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
4ab0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
4ac0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
4ad0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
4ae0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
4af0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
27fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1dbe : a9 08 __ LDA #$08
1dc0 : 8d 2c 9f STA $9f2c 
1dc3 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1dc5 : c5 35 __ CMP P8 ; (LastSong + 1)
1dc7 : d0 0d __ BNE $1dd6 ; (PlayZSM.s1 + 0)
.s1006:
1dc9 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1dcb : c5 34 __ CMP P7 ; (LastSong + 0)
1dcd : d0 07 __ BNE $1dd6 ; (PlayZSM.s1 + 0)
.s4:
1dcf : 20 0d 1e JSR $1e0d ; (zsm_check.s0 + 0)
1dd2 : 09 00 __ ORA #$00
1dd4 : f0 2b __ BEQ $1e01 ; (PlayZSM.s1001 + 0)
.s1:
1dd6 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1dd8 : d0 27 __ BNE $1e01 ; (PlayZSM.s1001 + 0)
.s1005:
1dda : a5 32 __ LDA P5 ; (TuneSelection + 0)
1ddc : c9 01 __ CMP #$01
1dde : d0 07 __ BNE $1de7 ; (PlayZSM.s1004 + 0)
.s6:
1de0 : a9 1f __ LDA #$1f
1de2 : a0 60 __ LDY #$60
1de4 : 4c 06 1e JMP $1e06 ; (PlayZSM.s21 + 0)
.s1004:
1de7 : c9 02 __ CMP #$02
1de9 : d0 07 __ BNE $1df2 ; (PlayZSM.s1003 + 0)
.s8:
1deb : a9 1f __ LDA #$1f
1ded : a0 7e __ LDY #$7e
1def : 4c 06 1e JMP $1e06 ; (PlayZSM.s21 + 0)
.s1003:
1df2 : c9 03 __ CMP #$03
1df4 : d0 07 __ BNE $1dfd ; (PlayZSM.s1002 + 0)
.s10:
1df6 : a9 1f __ LDA #$1f
1df8 : a0 a3 __ LDY #$a3
1dfa : 4c 06 1e JMP $1e06 ; (PlayZSM.s21 + 0)
.s1002:
1dfd : c9 04 __ CMP #$04
1dff : f0 01 __ BEQ $1e02 ; (PlayZSM.s12 + 0)
.s1001:
1e01 : 60 __ __ RTS
.s12:
1e02 : a9 1f __ LDA #$1f
1e04 : a0 ca __ LDY #$ca
.s21:
1e06 : 84 30 __ STY P3 
1e08 : 85 31 __ STA P4 
1e0a : 4c 11 1e JMP $1e11 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1e0d : ad 11 22 LDA $2211 ; (zsm_finished + 0)
.s1001:
1e10 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1e11 : a9 01 __ LDA #$01
1e13 : 8d 11 22 STA $2211 ; (zsm_finished + 0)
1e16 : ad a0 49 LDA $49a0 ; (zsm_reading + 0)
1e19 : f0 0a __ BEQ $1e25 ; (zsm_init.s3 + 0)
.s1:
1e1b : a9 02 __ LDA #$02
1e1d : 20 69 1b JSR $1b69 ; (krnio_close.s1000 + 0)
1e20 : a9 00 __ LDA #$00
1e22 : 8d a0 49 STA $49a0 ; (zsm_reading + 0)
.s3:
1e25 : 20 72 1e JSR $1e72 ; (zsm_silence.s0 + 0)
1e28 : 20 8a 1e JSR $1e8a ; (zsm_save_volume.s0 + 0)
1e2b : a9 00 __ LDA #$00
1e2d : 8d ed 49 STA $49ed ; (zsm_pos + 0)
1e30 : 8d ee 49 STA $49ee ; (zsm_pos + 1)
1e33 : 8d fb 58 STA $58fb ; (zsm_wpos + 0)
1e36 : 8d fc 58 STA $58fc ; (zsm_wpos + 1)
1e39 : 8d ec 49 STA $49ec ; (zsm_delay + 0)
1e3c : a5 30 __ LDA P3 ; (fname + 0)
1e3e : 85 2d __ STA P0 
1e40 : a5 31 __ LDA P4 ; (fname + 1)
1e42 : 85 2e __ STA P1 
1e44 : 20 aa 1a JSR $1aaa ; (krnio_setnam.s0 + 0)
1e47 : a9 02 __ LDA #$02
1e49 : 85 2d __ STA P0 
1e4b : 85 2f __ STA P2 
1e4d : a9 08 __ LDA #$08
1e4f : 85 2e __ STA P1 
1e51 : 20 c0 1a JSR $1ac0 ; (krnio_open.s0 + 0)
1e54 : a5 3b __ LDA ACCU + 0 
1e56 : f0 19 __ BEQ $1e71 ; (zsm_init.s1001 + 0)
.s4:
1e58 : a9 01 __ LDA #$01
1e5a : 8d a0 49 STA $49a0 ; (zsm_reading + 0)
1e5d : 20 bc 1e JSR $1ebc ; (zsm_fill.s0 + 0)
1e60 : a9 10 __ LDA #$10
1e62 : 8d ed 49 STA $49ed ; (zsm_pos + 0)
1e65 : a9 00 __ LDA #$00
1e67 : 8d ee 49 STA $49ee ; (zsm_pos + 1)
1e6a : 8d 11 22 STA $2211 ; (zsm_finished + 0)
1e6d : a9 01 __ LDA #$01
1e6f : 85 3b __ STA ACCU + 0 
.s1001:
1e71 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
49a0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
1e72 : a9 00 __ LDA #$00
1e74 : 85 47 __ STA T0 + 0 
1e76 : a9 08 __ LDA #$08
1e78 : 85 2d __ STA P0 
1e7a : a9 00 __ LDA #$00
.l1006:
1e7c : 85 2e __ STA P1 
1e7e : 20 e3 0d JSR $0de3 ; (sfx_put.l1 + 0)
1e81 : e6 47 __ INC T0 + 0 
1e83 : a5 47 __ LDA T0 + 0 
1e85 : c9 08 __ CMP #$08
1e87 : 90 f3 __ BCC $1e7c ; (zsm_silence.l1006 + 0)
.s1001:
1e89 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1e8a : a0 00 __ LDY #$00
1e8c : 84 3c __ STY ACCU + 1 
1e8e : a2 02 __ LDX #$02
1e90 : 18 __ __ CLC
.l1006:
1e91 : 8a __ __ TXA
1e92 : 09 c0 __ ORA #$c0
1e94 : 8d 20 9f STA $9f20 
1e97 : a5 3c __ LDA ACCU + 1 
1e99 : 09 f9 __ ORA #$f9
1e9b : 8d 21 9f STA $9f21 
1e9e : a9 01 __ LDA #$01
1ea0 : 8d 22 9f STA $9f22 
1ea3 : ad 23 9f LDA $9f23 
1ea6 : 99 c6 59 STA $59c6,y ; (vera_volumes + 0)
1ea9 : a9 00 __ LDA #$00
1eab : 8d 23 9f STA $9f23 
1eae : 8a __ __ TXA
1eaf : 69 04 __ ADC #$04
1eb1 : aa __ __ TAX
1eb2 : 90 02 __ BCC $1eb6 ; (zsm_save_volume.s1009 + 0)
.s1008:
1eb4 : e6 3c __ INC ACCU + 1 
.s1009:
1eb6 : c8 __ __ INY
1eb7 : c0 10 __ CPY #$10
1eb9 : 90 d6 __ BCC $1e91 ; (zsm_save_volume.l1006 + 0)
.s1001:
1ebb : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
59c6 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
58fb : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
1ebc : ad a0 49 LDA $49a0 ; (zsm_reading + 0)
1ebf : f0 20 __ BEQ $1ee1 ; (zsm_fill.s1 + 0)
.s2:
1ec1 : ad ee 49 LDA $49ee ; (zsm_pos + 1)
1ec4 : 18 __ __ CLC
1ec5 : 69 04 __ ADC #$04
1ec7 : cd fc 58 CMP $58fc ; (zsm_wpos + 1)
1eca : d0 0c __ BNE $1ed8 ; (zsm_fill.s6 + 0)
.s1006:
1ecc : ad fb 58 LDA $58fb ; (zsm_wpos + 0)
1ecf : cd ed 49 CMP $49ed ; (zsm_pos + 0)
1ed2 : d0 04 __ BNE $1ed8 ; (zsm_fill.s6 + 0)
.s5:
1ed4 : a9 00 __ LDA #$00
1ed6 : f0 0b __ BEQ $1ee3 ; (zsm_fill.s1008 + 0)
.s6:
1ed8 : a9 02 __ LDA #$02
1eda : 20 3f 1b JSR $1b3f ; (krnio_chkin.s1000 + 0)
1edd : a5 3b __ LDA ACCU + 0 
1edf : d0 07 __ BNE $1ee8 ; (zsm_fill.s9 + 0)
.s1:
1ee1 : a9 ff __ LDA #$ff
.s1008:
1ee3 : 85 3b __ STA ACCU + 0 
.s1001:
1ee5 : 85 3c __ STA ACCU + 1 
1ee7 : 60 __ __ RTS
.s9:
1ee8 : a9 00 __ LDA #$00
1eea : 85 47 __ STA T1 + 0 
1eec : 85 48 __ STA T1 + 1 
1eee : ad ee 49 LDA $49ee ; (zsm_pos + 1)
1ef1 : 18 __ __ CLC
1ef2 : 69 04 __ ADC #$04
1ef4 : cd fc 58 CMP $58fc ; (zsm_wpos + 1)
1ef7 : d0 08 __ BNE $1f01 ; (zsm_fill.l13 + 0)
.s1002:
1ef9 : ad fb 58 LDA $58fb ; (zsm_wpos + 0)
1efc : cd ed 49 CMP $49ed ; (zsm_pos + 0)
1eff : f0 49 __ BEQ $1f4a ; (zsm_fill.s38 + 0)
.l13:
1f01 : 20 51 1b JSR $1b51 ; (krnio_chrin.s0 + 0)
1f04 : ad fb 58 LDA $58fb ; (zsm_wpos + 0)
1f07 : aa __ __ TAX
1f08 : 18 __ __ CLC
1f09 : 69 01 __ ADC #$01
1f0b : 8d fb 58 STA $58fb ; (zsm_wpos + 0)
1f0e : ad fc 58 LDA $58fc ; (zsm_wpos + 1)
1f11 : a8 __ __ TAY
1f12 : 69 00 __ ADC #$00
1f14 : 8d fc 58 STA $58fc ; (zsm_wpos + 1)
1f17 : 8a __ __ TXA
1f18 : 18 __ __ CLC
1f19 : 69 be __ ADC #$be
1f1b : 85 49 __ STA T3 + 0 
1f1d : 98 __ __ TYA
1f1e : 29 03 __ AND #$03
1f20 : 69 5b __ ADC #$5b
1f22 : 85 4a __ STA T3 + 1 
1f24 : a5 3b __ LDA ACCU + 0 
1f26 : a0 00 __ LDY #$00
1f28 : 91 49 __ STA (T3 + 0),y 
1f2a : e6 47 __ INC T1 + 0 
1f2c : d0 02 __ BNE $1f30 ; (zsm_fill.s1010 + 0)
.s1009:
1f2e : e6 48 __ INC T1 + 1 
.s1010:
1f30 : 20 5b 1b JSR $1b5b ; (krnio_status.s0 + 0)
1f33 : a5 3b __ LDA ACCU + 0 
1f35 : d0 0e __ BNE $1f45 ; (zsm_fill.s15 + 0)
.s12:
1f37 : ad ee 49 LDA $49ee ; (zsm_pos + 1)
1f3a : 18 __ __ CLC
1f3b : 69 04 __ ADC #$04
1f3d : cd fc 58 CMP $58fc ; (zsm_wpos + 1)
1f40 : d0 bf __ BNE $1f01 ; (zsm_fill.l13 + 0)
1f42 : 4c f9 1e JMP $1ef9 ; (zsm_fill.s1002 + 0)
.s15:
1f45 : a9 00 __ LDA #$00
1f47 : 8d a0 49 STA $49a0 ; (zsm_reading + 0)
.s38:
1f4a : 20 65 1b JSR $1b65 ; (krnio_clrchn.s0 + 0)
1f4d : ad a0 49 LDA $49a0 ; (zsm_reading + 0)
1f50 : d0 05 __ BNE $1f57 ; (zsm_fill.s21 + 0)
.s19:
1f52 : a9 02 __ LDA #$02
1f54 : 20 69 1b JSR $1b69 ; (krnio_close.s1000 + 0)
.s21:
1f57 : a5 47 __ LDA T1 + 0 
1f59 : 85 3b __ STA ACCU + 0 
1f5b : a5 48 __ LDA T1 + 1 
1f5d : 4c e5 1e JMP $1ee5 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
1f60 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1f70 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1f7e : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1f8e : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1f9e : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
1fa3 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1fb3 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
1fc3 : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
1fca : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
1fda : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
LastSelectedSong:
49a1 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
49a2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
49a4 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
49b4 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1fe6 : a9 10 __ LDA #$10
1fe8 : 85 30 __ STA P3 
1fea : a9 00 __ LDA #$00
1fec : 85 31 __ STA P4 
1fee : a5 32 __ LDA P5 ; (Palette + 0)
1ff0 : 85 2e __ STA P1 
1ff2 : 85 47 __ STA T0 + 0 
1ff4 : a5 33 __ LDA P6 ; (Palette + 1)
1ff6 : 85 2f __ STA P2 
1ff8 : 85 48 __ STA T0 + 1 
1ffa : a5 34 __ LDA P7 ; (index + 0)
1ffc : 85 2d __ STA P0 
1ffe : ad fc 9e LDA $9efc ; (sstack + 0)
2001 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2003 : 0a __ __ ASL
2004 : 85 49 __ STA T3 + 0 
2006 : ad fd 9e LDA $9efd ; (sstack + 1)
2009 : 2a __ __ ROL
200a : 18 __ __ CLC
200b : 65 33 __ ADC P6 ; (Palette + 1)
200d : 85 4a __ STA T3 + 1 
200f : a4 32 __ LDY P5 ; (Palette + 0)
2011 : b1 49 __ LDA (T3 + 0),y 
2013 : aa __ __ TAX
2014 : c8 __ __ INY
2015 : b1 49 __ LDA (T3 + 0),y 
2017 : 86 49 __ STX T3 + 0 
2019 : 85 4a __ STA T3 + 1 
201b : a9 00 __ LDA #$00
201d : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
201f : ad fe 9e LDA $9efe ; (sstack + 2)
2022 : 85 4b __ STA T5 + 0 
2024 : 38 __ __ SEC
2025 : e9 01 __ SBC #$01
2027 : 85 4d __ STA T6 + 0 
2029 : ad ff 9e LDA $9eff ; (sstack + 3)
202c : 85 4c __ STA T5 + 1 
202e : e9 00 __ SBC #$00
2030 : 85 4e __ STA T6 + 1 
2032 : d0 06 __ BNE $203a ; (SetPaletteIndex.s5 + 0)
.s1004:
2034 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
2036 : c5 4d __ CMP T6 + 0 
2038 : b0 38 __ BCS $2072 ; (SetPaletteIndex.s4 + 0)
.s5:
203a : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
203c : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
203e : 18 __ __ CLC
203f : a5 32 __ LDA P5 ; (Palette + 0)
2041 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
2043 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2045 : a5 33 __ LDA P6 ; (Palette + 1)
2047 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
2049 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
204b : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
204e : a0 02 __ LDY #$02
2050 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
2052 : a0 00 __ LDY #$00
2054 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
2056 : a0 03 __ LDY #$03
2058 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
205a : a0 01 __ LDY #$01
205c : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
205e : 18 __ __ CLC
205f : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
2061 : 69 02 __ ADC #$02
2063 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2065 : 90 02 __ BCC $2069 ; (SetPaletteIndex.s1008 + 0)
.s1007:
2067 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
2069 : e8 __ __ INX
206a : a5 4e __ LDA T6 + 1 
206c : d0 e0 __ BNE $204e ; (SetPaletteIndex.l2 + 0)
.s1002:
206e : e4 4d __ CPX T6 + 0 
2070 : 90 dc __ BCC $204e ; (SetPaletteIndex.l2 + 0)
.s4:
2072 : a5 4b __ LDA T5 + 0 
2074 : 0a __ __ ASL
2075 : aa __ __ TAX
2076 : a5 4c __ LDA T5 + 1 
2078 : 2a __ __ ROL
2079 : a8 __ __ TAY
207a : 8a __ __ TXA
207b : 38 __ __ SEC
207c : e9 02 __ SBC #$02
207e : b0 01 __ BCS $2081 ; (SetPaletteIndex.s1010 + 0)
.s1009:
2080 : 88 __ __ DEY
.s1010:
2081 : 18 __ __ CLC
2082 : 65 47 __ ADC T0 + 0 
2084 : 85 47 __ STA T0 + 0 
2086 : 98 __ __ TYA
2087 : 65 48 __ ADC T0 + 1 
2089 : 85 48 __ STA T0 + 1 
208b : a5 49 __ LDA T3 + 0 
208d : a0 00 __ LDY #$00
208f : 91 47 __ STA (T0 + 0),y 
2091 : a5 4a __ LDA T3 + 1 
2093 : c8 __ __ INY
2094 : 91 47 __ STA (T0 + 0),y 
2096 : 4c b9 19 JMP $19b9 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
49c4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
49c6 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
49d6 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
49e6 : __ __ __ BYT 04                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
2099 : ad 25 9f LDA $9f25 
209c : 29 fe __ AND #$fe
209e : 8d 25 9f STA $9f25 
20a1 : a9 00 __ LDA #$00
20a3 : 8d 20 9f STA $9f20 
20a6 : a9 b0 __ LDA #$b0
20a8 : 8d 21 9f STA $9f21 
20ab : a9 11 __ LDA #$11
20ad : 8d 22 9f STA $9f22 
20b0 : a2 80 __ LDX #$80
20b2 : a9 00 __ LDA #$00
.l1002:
20b4 : 8d 23 9f STA $9f23 
20b7 : 8d 23 9f STA $9f23 
20ba : ca __ __ DEX
20bb : d0 f7 __ BNE $20b4 ; (ResetChars.l1002 + 0)
.s1001:
20bd : 60 __ __ RTS
--------------------------------------------------------------------
off1:
49e7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
20be : a5 31 __ LDA P4 ; (Input + 0)
20c0 : c9 20 __ CMP #$20
20c2 : d0 1c __ BNE $20e0 ; (Control.s1007 + 0)
.s1:
20c4 : a5 30 __ LDA P3 ; (playing + 0)
20c6 : d0 0a __ BNE $20d2 ; (Control.s4 + 0)
.s5:
20c8 : a9 01 __ LDA #$01
20ca : 20 34 21 JSR $2134 ; (zsm_irq_play.s0 + 0)
20cd : a9 01 __ LDA #$01
.s1001:
20cf : 85 3b __ STA ACCU + 0 
20d1 : 60 __ __ RTS
.s4:
20d2 : a9 00 __ LDA #$00
20d4 : cd e9 49 CMP $49e9 ; (paused + 0)
20d7 : 2a __ __ ROL
20d8 : 8d e9 49 STA $49e9 ; (paused + 0)
20db : 85 2f __ STA P2 
20dd : 20 e5 20 JSR $20e5 ; (zsm_pause.s0 + 0)
.s1007:
20e0 : a5 30 __ LDA P3 ; (playing + 0)
20e2 : 4c cf 20 JMP $20cf ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
49e9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
20e5 : a5 2f __ LDA P2 ; (pause + 0)
20e7 : d0 0e __ BNE $20f7 ; (zsm_pause.s4 + 0)
.s8:
20e9 : ad 12 22 LDA $2212 ; (zsm_paused + 0)
20ec : f0 08 __ BEQ $20f6 ; (zsm_pause.s1001 + 0)
.s5:
20ee : 20 07 21 JSR $2107 ; (zsm_restore_volume.s0 + 0)
20f1 : a9 00 __ LDA #$00
20f3 : 8d 12 22 STA $2212 ; (zsm_paused + 0)
.s1001:
20f6 : 60 __ __ RTS
.s4:
20f7 : ad 12 22 LDA $2212 ; (zsm_paused + 0)
20fa : d0 fa __ BNE $20f6 ; (zsm_pause.s1001 + 0)
.s1:
20fc : a9 01 __ LDA #$01
20fe : 8d 12 22 STA $2212 ; (zsm_paused + 0)
2101 : 20 72 1e JSR $1e72 ; (zsm_silence.s0 + 0)
2104 : 4c 8a 1e JMP $1e8a ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
2107 : a0 00 __ LDY #$00
2109 : 84 3c __ STY ACCU + 1 
210b : a2 02 __ LDX #$02
210d : 18 __ __ CLC
.l1006:
210e : 8a __ __ TXA
210f : 09 c0 __ ORA #$c0
2111 : 8d 20 9f STA $9f20 
2114 : a5 3c __ LDA ACCU + 1 
2116 : 09 f9 __ ORA #$f9
2118 : 8d 21 9f STA $9f21 
211b : a9 01 __ LDA #$01
211d : 8d 22 9f STA $9f22 
2120 : b9 c6 59 LDA $59c6,y ; (vera_volumes + 0)
2123 : 8d 23 9f STA $9f23 
2126 : 8a __ __ TXA
2127 : 69 04 __ ADC #$04
2129 : aa __ __ TAX
212a : 90 02 __ BCC $212e ; (zsm_restore_volume.s1009 + 0)
.s1008:
212c : e6 3c __ INC ACCU + 1 
.s1009:
212e : c8 __ __ INY
212f : c0 10 __ CPY #$10
2131 : 90 db __ BCC $210e ; (zsm_restore_volume.l1006 + 0)
.s1001:
2133 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
2134 : 8d 10 22 STA $2210 ; (zsm_playing + 0)
.s1001:
2137 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4b00 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4b10 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4b20 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4b30 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4b40 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4b50 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4b60 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4b70 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
4b80 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
4b90 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
4ba0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
4bb0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
4bc0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
4bd0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
4be0 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
4bf0 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4c00 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4c10 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4c20 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4c30 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4c40 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4c50 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4c60 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4c70 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
4c80 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
4c90 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
4ca0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
4cb0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4cc0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4cd0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4ce0 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4cf0 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4d00 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4d10 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4d20 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4d30 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4d40 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4d50 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4d60 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4d70 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
4d80 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
4d90 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4da0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4db0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4dc0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4dd0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4de0 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4df0 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4e00 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4e10 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4e20 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4e30 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4e40 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4e50 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4e60 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4e70 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
4e80 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
4e90 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4ea0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4eb0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4ec0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4ed0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4ee0 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4ef0 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4f00 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4f10 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4f20 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4f30 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4f40 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4f50 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4f60 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4f70 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4f80 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4f90 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4fa0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4fb0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4fc0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4fd0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4fe0 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4ff0 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
5000 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
5010 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
5020 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
5030 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
5040 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
5050 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
5060 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
5070 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
5080 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5090 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
50a0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
50b0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
50c0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
50d0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
50e0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
50f0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5100 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5110 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
511e : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
512e : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
513e : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
514e : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
515e : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
516e : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
517e : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
518e : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
519e : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
51ae : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
51be : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
51ce : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
51de : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
51ee : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
51fe : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
520e : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
521e : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
522e : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
523e : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
524e : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
525e : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
526e : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
527e : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
528e : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
529e : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
52ae : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
52be : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
52ce : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
52de : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
52ee : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
52fe : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
530e : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
531e : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
532e : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
533e : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
534e : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
535e : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
536e : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
537e : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
538e : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
539e : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
53ae : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
53be : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
53ce : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
53de : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
53ee : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
53fe : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
540e : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
541e : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
542e : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
543e : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
544e : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
545e : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
546e : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
547e : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
548e : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
549e : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
54ae : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
54be : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
54ce : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
54de : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
54ee : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
54fe : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
550e : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
551e : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
552e : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
553e : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
554e : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
555e : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
556e : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
557e : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
558e : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
559e : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
55ae : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
55be : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
55ce : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
55de : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
55ee : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
55fe : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
560e : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
561e : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
562e : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
563e : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
564e : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
565e : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
566e : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
567e : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
568e : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
569e : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
56ae : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
56be : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
56ce : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
56de : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
56ee : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
56fe : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
570e : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
571e : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
572e : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
573e : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
574e : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
575e : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
576e : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
577e : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
578e : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
579e : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
57ae : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
57be : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
57ce : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
57de : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
57ee : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
57fe : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
580e : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
581e : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
582e : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
583e : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
584e : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
585e : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
586e : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5900 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5910 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5920 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5930 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5940 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5950 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5960 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5970 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5980 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5990 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
59a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
59b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
59c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5a00 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5a10 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5a20 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5a30 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5a40 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5a50 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5a60 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5a70 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5a80 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5a90 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
5aa0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
5ab0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
5ac0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
Song4:
5b00 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5b10 : __ __ __ BYT 0d 05 3a 20 2d 20 22 07 0f 02 13 0d 01 03 0b 05 : ..: - ".........
5b20 : __ __ __ BYT 04 22 20 2d 20 01 12 14 09 13 14 3a 20 22 06 01 : ." - ......: "..
5b30 : __ __ __ BYT 04 05 22 20 2d 20 0c 05 0e 07 14 08 3a 20 33 3a : .." - ......: 3:
5b40 : __ __ __ BYT 32 33 20 2d 20 03 0f 0d 0d 05 0e 14 3a 20 09 20 : 23 - .......: . 
5b50 : __ __ __ BYT 02 05 14 20 19 0f 15 20 04 09 04 0e 27 14 20 14 : ... ... ....'. .
5b60 : __ __ __ BYT 08 09 0e 0b 20 14 08 05 20 17 01 12 0d 14 08 20 : .... ... ...... 
5b70 : __ __ __ BYT 0f 06 20 16 09 0e 19 0c 20 03 0f 15 0c 04 20 02 : .. ..... ..... .
5b80 : __ __ __ BYT 05 20 12 05 10 0c 09 03 01 14 05 04 20 09 0e 20 : . .......... .. 
5b90 : __ __ __ BYT 01 0e 19 14 08 09 0e 07 20 04 09 07 09 14 01 0c : ........ .......
5ba0 : __ __ __ BYT 2c 20 02 15 14 20 08 05 12 05 20 17 05 20 01 12 : , ... .... .. ..
5bb0 : __ __ __ BYT 05 20 3a 33 20 3d 20 3d 20 2d 20 2d 20 00       : . :3 = = - - .
--------------------------------------------------------------------
frame_wait:
.l1:
2138 : ad 26 9f LDA $9f26 
213b : 0a __ __ ASL
213c : 30 fa __ BMI $2138 ; (frame_wait.l1 + 0)
.l4:
213e : ad 26 9f LDA $9f26 
2141 : 0a __ __ ASL
2142 : 10 fa __ BPL $213e ; (frame_wait.l4 + 0)
.s1001:
2144 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
2145 : 38 __ __ SEC
2146 : a9 00 __ LDA #$00
2148 : e5 3b __ SBC ACCU + 0 
214a : 85 3b __ STA ACCU + 0 
214c : a9 00 __ LDA #$00
214e : e5 3c __ SBC ACCU + 1 
2150 : 85 3c __ STA ACCU + 1 
2152 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
2153 : 38 __ __ SEC
2154 : a9 00 __ LDA #$00
2156 : e5 23 __ SBC WORK + 0 
2158 : 85 23 __ STA WORK + 0 
215a : a9 00 __ LDA #$00
215c : e5 24 __ SBC WORK + 1 
215e : 85 24 __ STA WORK + 1 
2160 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
2161 : a5 3c __ LDA ACCU + 1 
2163 : d0 31 __ BNE $2196 ; (divmod + 53)
2165 : a5 24 __ LDA WORK + 1 
2167 : d0 1e __ BNE $2187 ; (divmod + 38)
2169 : 85 26 __ STA WORK + 3 
216b : a2 04 __ LDX #$04
216d : 06 3b __ ASL ACCU + 0 
216f : 2a __ __ ROL
2170 : c5 23 __ CMP WORK + 0 
2172 : 90 02 __ BCC $2176 ; (divmod + 21)
2174 : e5 23 __ SBC WORK + 0 
2176 : 26 3b __ ROL ACCU + 0 
2178 : 2a __ __ ROL
2179 : c5 23 __ CMP WORK + 0 
217b : 90 02 __ BCC $217f ; (divmod + 30)
217d : e5 23 __ SBC WORK + 0 
217f : 26 3b __ ROL ACCU + 0 
2181 : ca __ __ DEX
2182 : d0 eb __ BNE $216f ; (divmod + 14)
2184 : 85 25 __ STA WORK + 2 
2186 : 60 __ __ RTS
2187 : a5 3b __ LDA ACCU + 0 
2189 : 85 25 __ STA WORK + 2 
218b : a5 3c __ LDA ACCU + 1 
218d : 85 26 __ STA WORK + 3 
218f : a9 00 __ LDA #$00
2191 : 85 3b __ STA ACCU + 0 
2193 : 85 3c __ STA ACCU + 1 
2195 : 60 __ __ RTS
2196 : a5 24 __ LDA WORK + 1 
2198 : d0 1f __ BNE $21b9 ; (divmod + 88)
219a : a5 23 __ LDA WORK + 0 
219c : 30 1b __ BMI $21b9 ; (divmod + 88)
219e : a9 00 __ LDA #$00
21a0 : 85 26 __ STA WORK + 3 
21a2 : a2 10 __ LDX #$10
21a4 : 06 3b __ ASL ACCU + 0 
21a6 : 26 3c __ ROL ACCU + 1 
21a8 : 2a __ __ ROL
21a9 : c5 23 __ CMP WORK + 0 
21ab : 90 02 __ BCC $21af ; (divmod + 78)
21ad : e5 23 __ SBC WORK + 0 
21af : 26 3b __ ROL ACCU + 0 
21b1 : 26 3c __ ROL ACCU + 1 
21b3 : ca __ __ DEX
21b4 : d0 f2 __ BNE $21a8 ; (divmod + 71)
21b6 : 85 25 __ STA WORK + 2 
21b8 : 60 __ __ RTS
21b9 : a9 00 __ LDA #$00
21bb : 85 25 __ STA WORK + 2 
21bd : 85 26 __ STA WORK + 3 
21bf : 84 22 __ STY $22 
21c1 : a0 10 __ LDY #$10
21c3 : 18 __ __ CLC
21c4 : 26 3b __ ROL ACCU + 0 
21c6 : 26 3c __ ROL ACCU + 1 
21c8 : 26 25 __ ROL WORK + 2 
21ca : 26 26 __ ROL WORK + 3 
21cc : 38 __ __ SEC
21cd : a5 25 __ LDA WORK + 2 
21cf : e5 23 __ SBC WORK + 0 
21d1 : aa __ __ TAX
21d2 : a5 26 __ LDA WORK + 3 
21d4 : e5 24 __ SBC WORK + 1 
21d6 : 90 04 __ BCC $21dc ; (divmod + 123)
21d8 : 86 25 __ STX WORK + 2 
21da : 85 26 __ STA WORK + 3 
21dc : 88 __ __ DEY
21dd : d0 e5 __ BNE $21c4 ; (divmod + 99)
21df : 26 3b __ ROL ACCU + 0 
21e1 : 26 3c __ ROL ACCU + 1 
21e3 : a4 22 __ LDY $22 
21e5 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
21e6 : 24 3c __ BIT ACCU + 1 
21e8 : 10 0d __ BPL $21f7 ; (mods16 + 17)
21ea : 20 45 21 JSR $2145 ; (negaccu + 0)
21ed : 24 24 __ BIT WORK + 1 
21ef : 10 0d __ BPL $21fe ; (mods16 + 24)
21f1 : 20 53 21 JSR $2153 ; (negtmp + 0)
21f4 : 4c 61 21 JMP $2161 ; (divmod + 0)
21f7 : 24 24 __ BIT WORK + 1 
21f9 : 10 f9 __ BPL $21f4 ; (mods16 + 14)
21fb : 20 53 21 JSR $2153 ; (negtmp + 0)
21fe : 20 61 21 JSR $2161 ; (divmod + 0)
2201 : 38 __ __ SEC
2202 : a9 00 __ LDA #$00
2204 : e5 25 __ SBC WORK + 2 
2206 : 85 25 __ STA WORK + 2 
2208 : a9 00 __ LDA #$00
220a : e5 26 __ SBC WORK + 3 
220c : 85 26 __ STA WORK + 3 
220e : 60 __ __ RTS
