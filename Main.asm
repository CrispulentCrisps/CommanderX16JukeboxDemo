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
080e : 8e ff 1e STX $1eff ; (spentry + 0)
0811 : a9 be __ LDA #$be
0813 : 85 39 __ STA IP + 0 
0815 : a9 5a __ LDA #$5a
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 5f __ LDA #$5f
081c : e9 5a __ SBC #$5a
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
0830 : a9 80 __ LDA #$80
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
1eff : __ __ __ BYT 00                                              : .
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
08e2 : a9 96 __ LDA #$96
08e4 : 85 35 __ STA P8 
08e6 : a9 48 __ LDA #$48
08e8 : 85 36 __ STA P9 
08ea : 20 49 19 JSR $1949 ; (SetPaletteColours.s0 + 0)
08ed : a9 00 __ LDA #$00
08ef : 85 52 __ STA T1 + 0 
08f1 : 85 53 __ STA T1 + 1 
08f3 : 85 54 __ STA T2 + 0 
08f5 : 85 55 __ STA T3 + 0 
08f7 : 85 56 __ STA T4 + 0 
.l3:
08f9 : 20 c8 1a JSR $1ac8 ; (getchx.s0 + 0)
08fc : a5 3b __ LDA ACCU + 0 
08fe : 85 57 __ STA T5 + 0 
0900 : a9 30 __ LDA #$30
0902 : 8d 2c 9f STA $9f2c 
0905 : ee fe 27 INC $27fe ; (p + 0)
0908 : d0 03 __ BNE $090d ; (main.s1023 + 0)
.s1022:
090a : ee ff 27 INC $27ff ; (p + 1)
.s1023:
090d : ad b6 48 LDA $48b6 ; (Phase + 0)
0910 : 18 __ __ CLC
0911 : 69 01 __ ADC #$01
0913 : 85 32 __ STA P5 
0915 : 8d b6 48 STA $48b6 ; (Phase + 0)
0918 : ad b7 48 LDA $48b7 ; (Phase + 1)
091b : 69 00 __ ADC #$00
091d : 85 33 __ STA P6 
091f : 8d b7 48 STA $48b7 ; (Phase + 1)
0922 : ad b8 48 LDA $48b8 ; (Phase2 + 0)
0925 : 18 __ __ CLC
0926 : 69 01 __ ADC #$01
0928 : 85 34 __ STA P7 
092a : 8d b8 48 STA $48b8 ; (Phase2 + 0)
092d : ad b9 48 LDA $48b9 ; (Phase2 + 1)
0930 : 69 00 __ ADC #$00
0932 : 85 35 __ STA P8 
0934 : 8d b9 48 STA $48b9 ; (Phase2 + 1)
0937 : ad ba 48 LDA $48ba ; (Phase3 + 0)
093a : 18 __ __ CLC
093b : 69 01 __ ADC #$01
093d : 85 36 __ STA P9 
093f : 8d ba 48 STA $48ba ; (Phase3 + 0)
0942 : ad bb 48 LDA $48bb ; (Phase3 + 1)
0945 : 69 00 __ ADC #$00
0947 : 85 37 __ STA P10 
0949 : 8d bb 48 STA $48bb ; (Phase3 + 1)
094c : 20 03 1b JSR $1b03 ; (MoveSprites.s0 + 0)
094f : a5 55 __ LDA T3 + 0 
0951 : c9 01 __ CMP #$01
0953 : d0 03 __ BNE $0958 ; (main.s6 + 0)
0955 : 4c fc 0b JMP $0bfc ; (main.s5 + 0)
.s6:
0958 : a9 00 __ LDA #$00
095a : 8d c0 48 STA $48c0 ; (PalTimer + 0)
095d : 8d c1 48 STA $48c1 ; (PalTimer + 1)
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
0978 : a9 c2 __ LDA #$c2
097a : 85 35 __ STA P8 
097c : a9 48 __ LDA #$48
097e : 85 36 __ STA P9 
0980 : 20 49 19 JSR $1949 ; (SetPaletteColours.s0 + 0)
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
09a9 : a9 31 __ LDA #$31
09ab : 85 32 __ STA P5 
09ad : a9 27 __ LDA #$27
09af : 85 33 __ STA P6 
09b1 : 20 27 1f JSR $1f27 ; (SetPaletteIndex.s0 + 0)
09b4 : a9 00 __ LDA #$00
09b6 : 85 56 __ STA T4 + 0 
.s70:
09b8 : ad c1 48 LDA $48c1 ; (PalTimer + 1)
09bb : 30 5f __ BMI $0a1c ; (main.s13 + 0)
.s1016:
09bd : d0 07 __ BNE $09c6 ; (main.s11 + 0)
.s1015:
09bf : a9 03 __ LDA #$03
09c1 : cd c0 48 CMP $48c0 ; (PalTimer + 0)
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
09e2 : ee e2 48 INC $48e2 ; (PalIndex + 0)
09e5 : d0 03 __ BNE $09ea ; (main.s1027 + 0)
.s1026:
09e7 : ee e3 48 INC $48e3 ; (PalIndex + 1)
.s1027:
09ea : a9 f1 __ LDA #$f1
09ec : 85 32 __ STA P5 
09ee : a9 27 __ LDA #$27
09f0 : 85 33 __ STA P6 
09f2 : 20 27 1f JSR $1f27 ; (SetPaletteIndex.s0 + 0)
09f5 : a9 50 __ LDA #$50
09f7 : 85 34 __ STA P7 
09f9 : a9 00 __ LDA #$00
09fb : 8d fc 9e STA $9efc ; (sstack + 0)
09fe : 8d fd 9e STA $9efd ; (sstack + 1)
0a01 : 8d ff 9e STA $9eff ; (sstack + 3)
0a04 : a9 10 __ LDA #$10
0a06 : 8d fe 9e STA $9efe ; (sstack + 2)
0a09 : a9 00 __ LDA #$00
0a0b : 85 32 __ STA P5 
0a0d : a9 4a __ LDA #$4a
0a0f : 85 33 __ STA P6 
0a11 : 20 27 1f JSR $1f27 ; (SetPaletteIndex.s0 + 0)
0a14 : a9 00 __ LDA #$00
0a16 : 8d c0 48 STA $48c0 ; (PalTimer + 0)
0a19 : 8d c1 48 STA $48c1 ; (PalTimer + 1)
.s13:
0a1c : a9 03 __ LDA #$03
0a1e : 8d 2c 9f STA $9f2c 
0a21 : a5 57 __ LDA T5 + 0 
0a23 : c9 44 __ CMP #$44
0a25 : d0 0c __ BNE $0a33 ; (main.s15 + 0)
.s17:
0a27 : a5 54 __ LDA T2 + 0 
0a29 : cd e4 48 CMP $48e4 ; (MaxSong + 0)
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
0a3f : 20 da 1f JSR $1fda ; (ResetChars.s0 + 0)
0a42 : a9 00 __ LDA #$00
0a44 : 8d e5 48 STA $48e5 ; (off1 + 0)
0a47 : 8d e6 48 STA $48e6 ; (off1 + 1)
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
0a62 : 20 ff 1f JSR $1fff ; (Control.s0 + 0)
0a65 : a5 3b __ LDA ACCU + 0 
0a67 : 85 55 __ STA T3 + 0 
0a69 : 38 __ __ SEC
0a6a : a5 52 __ LDA T1 + 0 
0a6c : e9 80 __ SBC #$80
0a6e : 8d 37 9f STA $9f37 
0a71 : a5 53 __ LDA T1 + 1 
0a73 : e9 02 __ SBC #$02
0a75 : 8d 38 9f STA $9f38 
0a78 : ad bc 48 LDA $48bc ; (FrameCount + 0)
0a7b : 85 3b __ STA ACCU + 0 
0a7d : ad bd 48 LDA $48bd ; (FrameCount + 1)
0a80 : 85 3c __ STA ACCU + 1 
0a82 : a9 08 __ LDA #$08
0a84 : 85 23 __ STA WORK + 0 
0a86 : a9 00 __ LDA #$00
0a88 : 85 24 __ STA WORK + 1 
0a8a : 20 23 21 JSR $2123 ; (mods16 + 0)
0a8d : a5 26 __ LDA WORK + 3 
0a8f : f0 03 __ BEQ $0a94 ; (main.s1007 + 0)
0a91 : 4c 59 0b JMP $0b59 ; (main.s24 + 0)
.s1007:
0a94 : a5 25 __ LDA WORK + 2 
0a96 : c9 01 __ CMP #$01
0a98 : f0 03 __ BEQ $0a9d ; (main.s22 + 0)
0a9a : 4c 59 0b JMP $0b59 ; (main.s24 + 0)
.s22:
0a9d : ad e5 48 LDA $48e5 ; (off1 + 0)
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
0ac4 : ad e6 48 LDA $48e6 ; (off1 + 1)
0ac7 : 85 3c __ STA ACCU + 1 
0ac9 : a9 c3 __ LDA #$c3
0acb : 85 23 __ STA WORK + 0 
0acd : a9 00 __ LDA #$00
0acf : 85 24 __ STA WORK + 1 
0ad1 : 20 9e 20 JSR $209e ; (divmod + 0)
0ad4 : a6 25 __ LDX WORK + 2 
0ad6 : bd 00 59 LDA $5900,x ; (Song3 + 0)
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
0ae9 : ad e6 48 LDA $48e6 ; (off1 + 1)
0aec : 85 3c __ STA ACCU + 1 
0aee : a9 c3 __ LDA #$c3
0af0 : 85 23 __ STA WORK + 0 
0af2 : a9 00 __ LDA #$00
0af4 : 85 24 __ STA WORK + 1 
0af6 : 20 9e 20 JSR $209e ; (divmod + 0)
0af9 : a6 25 __ LDX WORK + 2 
0afb : bd 00 5a LDA $5a00,x ; (Song4 + 0)
0afe : f0 25 __ BEQ $0b25 ; (main.s26 + 0)
.s48:
0b00 : a5 57 __ LDA T5 + 0 
0b02 : 85 3b __ STA ACCU + 0 
0b04 : ad e6 48 LDA $48e6 ; (off1 + 1)
0b07 : 85 3c __ STA ACCU + 1 
0b09 : a9 bd __ LDA #$bd
0b0b : 85 23 __ STA WORK + 0 
0b0d : a9 00 __ LDA #$00
0b0f : 85 24 __ STA WORK + 1 
0b11 : 20 9e 20 JSR $209e ; (divmod + 0)
0b14 : a6 25 __ LDX WORK + 2 
0b16 : bd 00 5a LDA $5a00,x ; (Song4 + 0)
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
0b46 : 8d e5 48 STA $48e5 ; (off1 + 0)
0b49 : 90 03 __ BCC $0b4e ; (main.s1029 + 0)
.s1028:
0b4b : ee e6 48 INC $48e6 ; (off1 + 1)
.s1029:
0b4e : a9 4c __ LDA #$4c
0b50 : 85 32 __ STA P5 
0b52 : a9 44 __ LDA #$44
0b54 : 85 33 __ STA P6 
0b56 : 20 27 1f JSR $1f27 ; (SetPaletteIndex.s0 + 0)
.s24:
0b59 : a9 01 __ LDA #$01
0b5b : 8d 2c 9f STA $9f2c 
0b5e : 20 f8 1d JSR $1df8 ; (zsm_fill.s0 + 0)
0b61 : a9 00 __ LDA #$00
0b63 : 8d 2c 9f STA $9f2c 
0b66 : 20 75 20 JSR $2075 ; (frame_wait.l1 + 0)
0b69 : ee bc 48 INC $48bc ; (FrameCount + 0)
0b6c : d0 03 __ BNE $0b71 ; (main.s1031 + 0)
.s1030:
0b6e : ee bd 48 INC $48bd ; (FrameCount + 1)
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
0b85 : ad e6 48 LDA $48e6 ; (off1 + 1)
0b88 : 85 3c __ STA ACCU + 1 
0b8a : a9 1d __ LDA #$1d
0b8c : 85 23 __ STA WORK + 0 
0b8e : a9 06 __ LDA #$06
0b90 : 85 24 __ STA WORK + 1 
0b92 : 20 9e 20 JSR $209e ; (divmod + 0)
0b95 : 18 __ __ CLC
0b96 : a9 20 __ LDA #$20
0b98 : 65 25 __ ADC WORK + 2 
0b9a : 85 47 __ STA T6 + 0 
0b9c : a9 4a __ LDA #$4a
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
0bb0 : ad e6 48 LDA $48e6 ; (off1 + 1)
0bb3 : 85 3c __ STA ACCU + 1 
0bb5 : a9 c5 __ LDA #$c5
0bb7 : 85 23 __ STA WORK + 0 
0bb9 : a9 00 __ LDA #$00
0bbb : 85 24 __ STA WORK + 1 
0bbd : 20 9e 20 JSR $209e ; (divmod + 0)
0bc0 : a6 25 __ LDX WORK + 2 
0bc2 : bd 00 58 LDA $5800,x ; (Song2 + 0)
.s75:
0bc5 : 09 00 __ ORA #$00
0bc7 : d0 03 __ BNE $0bcc ; (main.s75 + 7)
0bc9 : 4c 25 0b JMP $0b25 ; (main.s26 + 0)
0bcc : 4c 19 0b JMP $0b19 ; (main.s84 + 0)
.s32:
0bcf : a5 57 __ LDA T5 + 0 
0bd1 : 85 3b __ STA ACCU + 0 
0bd3 : ad e6 48 LDA $48e6 ; (off1 + 1)
0bd6 : 85 3c __ STA ACCU + 1 
0bd8 : a9 5c __ LDA #$5c
0bda : 85 23 __ STA WORK + 0 
0bdc : a9 07 __ LDA #$07
0bde : 85 24 __ STA WORK + 1 
0be0 : 20 9e 20 JSR $209e ; (divmod + 0)
0be3 : 18 __ __ CLC
0be4 : a9 3e __ LDA #$3e
0be6 : 65 25 __ ADC WORK + 2 
0be8 : 85 47 __ STA T6 + 0 
0bea : a9 50 __ LDA #$50
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
0c04 : ad bf 48 LDA $48bf ; (LastSelectedSong + 0)
0c07 : 85 34 __ STA P7 
0c09 : a9 00 __ LDA #$00
0c0b : 85 35 __ STA P8 
0c0d : 20 fa 1c JSR $1cfa ; (PlayZSM.s0 + 0)
0c10 : a5 32 __ LDA P5 
0c12 : 8d bf 48 STA $48bf ; (LastSelectedSong + 0)
0c15 : ee c0 48 INC $48c0 ; (PalTimer + 0)
0c18 : f0 03 __ BEQ $0c1d ; (main.s1024 + 0)
0c1a : 4c 83 09 JMP $0983 ; (main.s69 + 0)
.s1024:
0c1d : ee c1 48 INC $48c1 ; (PalTimer + 1)
0c20 : 4c 83 09 JMP $0983 ; (main.s69 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0c23 : 78 __ __ SEI
0c24 : ad 14 03 LDA $0314 
0c27 : 8d e8 48 STA $48e8 ; (oirq + 0)
0c2a : ad 15 03 LDA $0315 
0c2d : 8d e9 48 STA $48e9 ; (oirq + 1)
0c30 : a9 3c __ LDA #$3c
0c32 : 8d 14 03 STA $0314 
0c35 : a9 0c __ LDA #$0c
0c37 : 8d 15 03 STA $0315 
0c3a : 58 __ __ CLI
.s1001:
0c3b : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
48e8 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c3c : 20 42 0c JSR $0c42 ; (irq.s1000 + 0)
0c3f : 6c e8 48 JMP ($48e8)
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
0c6c : ad 4c 21 LDA $214c ; (zsm_playing + 0)
0c6f : f0 08 __ BEQ $0c79 ; (irq.s1001 + 0)
.s4:
0c71 : ad 4d 21 LDA $214d ; (zsm_finished + 0)
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
214c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
214d : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0ca4 : ad 4e 21 LDA $214e ; (zsm_paused + 0)
0ca7 : f0 01 __ BEQ $0caa ; (zsm_play.s2 + 0)
0ca9 : 60 __ __ RTS
.s2:
0caa : ad ea 48 LDA $48ea ; (zsm_delay + 0)
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
0cce : ad eb 48 LDA $48eb ; (zsm_pos + 0)
0cd1 : 85 4b __ STA T3 + 0 
0cd3 : 18 __ __ CLC
0cd4 : 69 01 __ ADC #$01
0cd6 : 85 4d __ STA T4 + 0 
0cd8 : 8d eb 48 STA $48eb ; (zsm_pos + 0)
0cdb : ad ec 48 LDA $48ec ; (zsm_pos + 1)
0cde : aa __ __ TAX
0cdf : 69 00 __ ADC #$00
0ce1 : 85 4e __ STA T4 + 1 
0ce3 : 8d ec 48 STA $48ec ; (zsm_pos + 1)
0ce6 : 18 __ __ CLC
0ce7 : a9 be __ LDA #$be
0ce9 : 65 4b __ ADC T3 + 0 
0ceb : 85 3b __ STA ACCU + 0 
0ced : 8a __ __ TXA
0cee : 29 03 __ AND #$03
0cf0 : 69 5a __ ADC #$5a
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
0d0c : 69 5a __ ADC #$5a
0d0e : 85 4c __ STA T3 + 1 
0d10 : b1 4b __ LDA (T3 + 0),y 
0d12 : 29 3f __ AND #$3f
0d14 : 18 __ __ CLC
0d15 : 65 4d __ ADC T4 + 0 
0d17 : 8d eb 48 STA $48eb ; (zsm_pos + 0)
0d1a : 98 __ __ TYA
0d1b : 65 4e __ ADC T4 + 1 
0d1d : 8d ec 48 STA $48ec ; (zsm_pos + 1)
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
0d32 : 6d eb 48 ADC $48eb ; (zsm_pos + 0)
0d35 : 85 4d __ STA T4 + 0 
0d37 : ad ec 48 LDA $48ec ; (zsm_pos + 1)
0d3a : 29 03 __ AND #$03
0d3c : 69 5a __ ADC #$5a
0d3e : 85 4e __ STA T4 + 1 
0d40 : a0 00 __ LDY #$00
0d42 : b1 4d __ LDA (T4 + 0),y 
0d44 : 85 2d __ STA P0 
0d46 : ad eb 48 LDA $48eb ; (zsm_pos + 0)
0d49 : 18 __ __ CLC
0d4a : 69 01 __ ADC #$01
0d4c : aa __ __ TAX
0d4d : ad ec 48 LDA $48ec ; (zsm_pos + 1)
0d50 : 69 00 __ ADC #$00
0d52 : 29 03 __ AND #$03
0d54 : 85 4c __ STA T3 + 1 
0d56 : 8a __ __ TXA
0d57 : 18 __ __ CLC
0d58 : 69 be __ ADC #$be
0d5a : 85 4b __ STA T3 + 0 
0d5c : a9 5a __ LDA #$5a
0d5e : 65 4c __ ADC T3 + 1 
0d60 : 85 4c __ STA T3 + 1 
0d62 : b1 4b __ LDA (T3 + 0),y 
0d64 : 85 2e __ STA P1 
0d66 : 20 e3 0d JSR $0de3 ; (sfx_put.l1 + 0)
0d69 : ad eb 48 LDA $48eb ; (zsm_pos + 0)
0d6c : 18 __ __ CLC
0d6d : 69 02 __ ADC #$02
0d6f : 8d eb 48 STA $48eb ; (zsm_pos + 0)
0d72 : 90 03 __ BCC $0d77 ; (zsm_play.s1015 + 0)
.s1014:
0d74 : ee ec 48 INC $48ec ; (zsm_pos + 1)
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
0d88 : 8d 4d 21 STA $214d ; (zsm_finished + 0)
0d8b : d0 08 __ BNE $0d95 ; (zsm_play.s10 + 0)
.s25:
0d8d : 29 7f __ AND #$7f
0d8f : 38 __ __ SEC
0d90 : e9 01 __ SBC #$01
0d92 : 8d ea 48 STA $48ea ; (zsm_delay + 0)
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
0dbf : 8d eb 48 STA $48eb ; (zsm_pos + 0)
0dc2 : 90 01 __ BCC $0dc5 ; (zsm_play.s1017 + 0)
.s1016:
0dc4 : e8 __ __ INX
.s1017:
0dc5 : 8e ec 48 STX $48ec ; (zsm_pos + 1)
0dc8 : 18 __ __ CLC
0dc9 : a9 be __ LDA #$be
0dcb : 65 4d __ ADC T4 + 0 
0dcd : 85 4b __ STA T3 + 0 
0dcf : a5 4e __ LDA T4 + 1 
0dd1 : 29 03 __ AND #$03
0dd3 : 69 5a __ ADC #$5a
0dd5 : 85 4c __ STA T3 + 1 
0dd7 : b1 4b __ LDA (T3 + 0),y 
0dd9 : 8d 23 9f STA $9f23 
0ddc : 4c ce 0c JMP $0cce ; (zsm_play.l8 + 0)
.s4:
0ddf : ce ea 48 DEC $48ea ; (zsm_delay + 0)
0de2 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
214e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
48ea : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
5abe : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
48eb : __ __ __ BSS	2
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
0df5 : 9d 00 5f STA $5f00,x ; (vera_fm_s_regs + 0)
0df8 : 8d 41 9f STA $9f41 
.s1001:
0dfb : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
5f00 : __ __ __ BSS	128
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
0e62 : 20 a6 17 JSR $17a6 ; (tileBaseConfig.s0 + 0)
0e65 : 8d 2f 9f STA $9f2f 
0e68 : a9 00 __ LDA #$00
0e6a : 85 2d __ STA P0 
0e6c : a9 20 __ LDA #$20
0e6e : 85 2f __ STA P2 
0e70 : 20 be 17 JSR $17be ; (memoryToMapMemoryAddress.s0 + 0)
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
0ea3 : a9 4f __ LDA #$4f
0ea5 : 85 31 __ STA P4 
0ea7 : a9 21 __ LDA #$21
0ea9 : 85 32 __ STA P5 
0eab : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
0ec1 : 20 06 18 JSR $1806 ; (rand.s0 + 0)
0ec4 : a9 31 __ LDA #$31
0ec6 : 85 23 __ STA WORK + 0 
0ec8 : a9 00 __ LDA #$00
0eca : 85 24 __ STA WORK + 1 
0ecc : 20 9e 20 JSR $209e ; (divmod + 0)
0ecf : a5 4e __ LDA T1 + 0 
0ed1 : c9 36 __ CMP #$36
0ed3 : 90 03 __ BCC $0ed8 ; (SetUpSprites.s1037 + 0)
0ed5 : 4c f9 16 JMP $16f9 ; (SetUpSprites.s1032 + 0)
.s1037:
0ed8 : c9 2c __ CMP #$2c
0eda : b0 03 __ BCS $0edf ; (SetUpSprites.s1036 + 0)
0edc : 4c f9 16 JMP $16f9 ; (SetUpSprites.s1032 + 0)
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
0f21 : a9 31 __ LDA #$31
0f23 : 85 31 __ STA P4 
0f25 : a9 23 __ LDA #$23
0f27 : 85 32 __ STA P5 
0f29 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
0f2c : a9 00 __ LDA #$00
0f2e : 85 2d __ STA P0 
0f30 : a9 59 __ LDA #$59
0f32 : 85 2e __ STA P1 
0f34 : a9 02 __ LDA #$02
0f36 : 85 34 __ STA P7 
0f38 : a9 31 __ LDA #$31
0f3a : 85 31 __ STA P4 
0f3c : a9 25 __ LDA #$25
0f3e : 85 32 __ STA P5 
0f40 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
0f57 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
0f5a : a9 68 __ LDA #$68
0f5c : 85 2e __ STA P1 
0f5e : a9 00 __ LDA #$00
0f60 : 85 2f __ STA P2 
0f62 : a9 b6 __ LDA #$b6
0f64 : 85 30 __ STA P3 
0f66 : a9 01 __ LDA #$01
0f68 : 85 31 __ STA P4 
0f6a : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
0f85 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
0f88 : a9 f0 __ LDA #$f0
0f8a : 85 2e __ STA P1 
0f8c : a9 01 __ LDA #$01
0f8e : 85 2f __ STA P2 
0f90 : 85 31 __ STA P4 
0f92 : a9 b6 __ LDA #$b6
0f94 : 85 30 __ STA P3 
0f96 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
0fb1 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
0fce : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
0fd1 : a9 30 __ LDA #$30
0fd3 : 85 2e __ STA P1 
0fd5 : a9 01 __ LDA #$01
0fd7 : 85 2f __ STA P2 
0fd9 : a9 b8 __ LDA #$b8
0fdb : 85 30 __ STA P3 
0fdd : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
0ff8 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
1015 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
1018 : a9 fc __ LDA #$fc
101a : 85 2e __ STA P1 
101c : a9 00 __ LDA #$00
101e : 85 2f __ STA P2 
1020 : a9 b8 __ LDA #$b8
1022 : 85 30 __ STA P3 
1024 : a9 01 __ LDA #$01
1026 : 85 31 __ STA P4 
1028 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
103f : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
1042 : a9 4c __ LDA #$4c
1044 : 85 2e __ STA P1 
1046 : a9 01 __ LDA #$01
1048 : 85 2f __ STA P2 
104a : 85 31 __ STA P4 
104c : a9 b8 __ LDA #$b8
104e : 85 30 __ STA P3 
1050 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1053 : a9 01 __ LDA #$01
1055 : 85 2e __ STA P1 
1057 : a9 00 __ LDA #$00
1059 : 85 2f __ STA P2 
105b : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
105e : a9 10 __ LDA #$10
1060 : 85 2d __ STA P0 
1062 : a9 20 __ LDA #$20
1064 : 85 30 __ STA P3 
1066 : a9 00 __ LDA #$00
1068 : 85 31 __ STA P4 
106a : a9 31 __ LDA #$31
106c : 85 2e __ STA P1 
106e : a9 27 __ LDA #$27
1070 : 85 2f __ STA P2 
1072 : 20 00 19 JSR $1900 ; (vera_pal_putn.s0 + 0)
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
1089 : a9 00 __ LDA #$00
108b : 85 31 __ STA P4 
108d : a9 2b __ LDA #$2b
108f : 85 32 __ STA P5 
1091 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
10b9 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
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
10d1 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
1104 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
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
111c : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
1151 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
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
1169 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
11b6 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
11b9 : a5 4f __ LDA T2 + 0 
11bb : 85 2e __ STA P1 
11bd : a5 50 __ LDA T2 + 1 
11bf : 85 2f __ STA P2 
11c1 : a9 b8 __ LDA #$b8
11c3 : 85 30 __ STA P3 
11c5 : a9 01 __ LDA #$01
11c7 : 85 31 __ STA P4 
11c9 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
11f0 : a9 2d __ LDA #$2d
11f2 : 85 32 __ STA P5 
11f4 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
1213 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
1216 : a9 00 __ LDA #$00
1218 : 85 2e __ STA P1 
121a : 85 31 __ STA P4 
121c : a9 01 __ LDA #$01
121e : 85 2f __ STA P2 
1220 : a9 78 __ LDA #$78
1222 : 85 30 __ STA P3 
1224 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
123b : a9 2e __ LDA #$2e
123d : 85 32 __ STA P5 
123f : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
125c : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
125f : a9 00 __ LDA #$00
1261 : 85 2e __ STA P1 
1263 : 85 31 __ STA P4 
1265 : a9 01 __ LDA #$01
1267 : 85 2f __ STA P2 
1269 : a9 78 __ LDA #$78
126b : 85 30 __ STA P3 
126d : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
128c : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
128f : a9 00 __ LDA #$00
1291 : 85 2e __ STA P1 
1293 : 85 31 __ STA P4 
1295 : a9 01 __ LDA #$01
1297 : 85 2f __ STA P2 
1299 : a9 e8 __ LDA #$e8
129b : 85 30 __ STA P3 
129d : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
12b4 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
12b7 : a9 40 __ LDA #$40
12b9 : 85 2e __ STA P1 
12bb : a9 01 __ LDA #$01
12bd : 85 2f __ STA P2 
12bf : a9 e8 __ LDA #$e8
12c1 : 85 30 __ STA P3 
12c3 : a9 00 __ LDA #$00
12c5 : 85 31 __ STA P4 
12c7 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
12ca : a9 01 __ LDA #$01
12cc : 85 2e __ STA P1 
12ce : a9 00 __ LDA #$00
12d0 : 85 2f __ STA P2 
12d2 : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
12e9 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
12ec : a9 00 __ LDA #$00
12ee : 85 2e __ STA P1 
12f0 : a9 01 __ LDA #$01
12f2 : 85 2f __ STA P2 
12f4 : 85 31 __ STA P4 
12f6 : a9 08 __ LDA #$08
12f8 : 85 30 __ STA P3 
12fa : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
12fd : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
1314 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
1317 : a9 40 __ LDA #$40
1319 : 85 2e __ STA P1 
131b : a9 01 __ LDA #$01
131d : 85 2f __ STA P2 
131f : 85 31 __ STA P4 
1321 : a9 08 __ LDA #$08
1323 : 85 30 __ STA P3 
1325 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1328 : a9 01 __ LDA #$01
132a : 85 2e __ STA P1 
132c : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
1343 : a9 32 __ LDA #$32
1345 : 85 32 __ STA P5 
1347 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
1375 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
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
138d : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
13b7 : a9 3a __ LDA #$3a
13b9 : 85 32 __ STA P5 
13bb : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
13d8 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
13db : a9 08 __ LDA #$08
13dd : 85 2e __ STA P1 
13df : 85 30 __ STA P3 
13e1 : a9 00 __ LDA #$00
13e3 : 85 2f __ STA P2 
13e5 : 85 31 __ STA P4 
13e7 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
13ea : a9 48 __ LDA #$48
13ec : 85 2d __ STA P0 
13ee : 85 2e __ STA P1 
13f0 : a9 0a __ LDA #$0a
13f2 : 85 2f __ STA P2 
13f4 : a9 00 __ LDA #$00
13f6 : 85 30 __ STA P3 
13f8 : a9 03 __ LDA #$03
13fa : 85 31 __ STA P4 
13fc : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
13ff : a9 00 __ LDA #$00
1401 : 85 2f __ STA P2 
1403 : 85 31 __ STA P4 
1405 : a9 08 __ LDA #$08
1407 : 85 30 __ STA P3 
1409 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
140c : a9 01 __ LDA #$01
140e : 85 2e __ STA P1 
1410 : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
1427 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
142a : a9 00 __ LDA #$00
142c : 85 2f __ STA P2 
142e : 85 31 __ STA P4 
1430 : a9 48 __ LDA #$48
1432 : 85 30 __ STA P3 
1434 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1437 : a9 01 __ LDA #$01
1439 : 85 2e __ STA P1 
143b : 85 2f __ STA P2 
143d : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
1454 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
1457 : a9 08 __ LDA #$08
1459 : 85 2e __ STA P1 
145b : a9 00 __ LDA #$00
145d : 85 2f __ STA P2 
145f : 85 31 __ STA P4 
1461 : a9 48 __ LDA #$48
1463 : 85 30 __ STA P3 
1465 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1468 : a9 00 __ LDA #$00
146a : 85 2e __ STA P1 
146c : a9 01 __ LDA #$01
146e : 85 2f __ STA P2 
1470 : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
1473 : a9 00 __ LDA #$00
1475 : 85 2d __ STA P0 
1477 : 85 30 __ STA P3 
1479 : a9 49 __ LDA #$49
147b : 85 2e __ STA P1 
147d : a9 00 __ LDA #$00
147f : 85 31 __ STA P4 
1481 : a9 3a __ LDA #$3a
1483 : 85 32 __ STA P5 
1485 : a9 00 __ LDA #$00
1487 : 85 33 __ STA P6 
1489 : a9 08 __ LDA #$08
148b : 85 34 __ STA P7 
148d : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
14aa : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
14ad : a9 f8 __ LDA #$f8
14af : 85 2e __ STA P1 
14b1 : a9 01 __ LDA #$01
14b3 : 85 2f __ STA P2 
14b5 : a9 08 __ LDA #$08
14b7 : 85 30 __ STA P3 
14b9 : a9 00 __ LDA #$00
14bb : 85 31 __ STA P4 
14bd : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
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
14d4 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
14d7 : a9 38 __ LDA #$38
14d9 : 85 2e __ STA P1 
14db : a9 02 __ LDA #$02
14dd : 85 2f __ STA P2 
14df : a9 08 __ LDA #$08
14e1 : 85 30 __ STA P3 
14e3 : a9 00 __ LDA #$00
14e5 : 85 31 __ STA P4 
14e7 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
14ea : a9 01 __ LDA #$01
14ec : 85 2e __ STA P1 
14ee : a9 00 __ LDA #$00
14f0 : 85 2f __ STA P2 
14f2 : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
1509 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
150c : a9 38 __ LDA #$38
150e : 85 2e __ STA P1 
1510 : a9 02 __ LDA #$02
1512 : 85 2f __ STA P2 
1514 : a9 48 __ LDA #$48
1516 : 85 30 __ STA P3 
1518 : a9 00 __ LDA #$00
151a : 85 31 __ STA P4 
151c : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
151f : a9 01 __ LDA #$01
1521 : 85 2e __ STA P1 
1523 : 85 2f __ STA P2 
1525 : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
153c : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
153f : a9 f8 __ LDA #$f8
1541 : 85 2e __ STA P1 
1543 : a9 01 __ LDA #$01
1545 : 85 2f __ STA P2 
1547 : a9 48 __ LDA #$48
1549 : 85 30 __ STA P3 
154b : a9 00 __ LDA #$00
154d : 85 31 __ STA P4 
154f : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1552 : a9 00 __ LDA #$00
1554 : 85 2e __ STA P1 
1556 : 20 c3 18 JSR $18c3 ; (vera_spr_flip.s0 + 0)
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
156f : a9 42 __ LDA #$42
1571 : 85 32 __ STA P5 
1573 : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
1576 : a9 80 __ LDA #$80
1578 : 85 2d __ STA P0 
157a : 85 33 __ STA P6 
157c : a9 52 __ LDA #$52
157e : 85 2e __ STA P1 
1580 : a9 00 __ LDA #$00
1582 : 85 34 __ STA P7 
1584 : a9 51 __ LDA #$51
1586 : 85 31 __ STA P4 
1588 : a9 27 __ LDA #$27
158a : 85 32 __ STA P5 
158c : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
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
15b0 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
15b3 : a5 4d __ LDA T0 + 0 
15b5 : c9 1f __ CMP #$1f
15b7 : d0 0d __ BNE $15c6 ; (SetUpSprites.s228 + 0)
.s103:
15b9 : a9 9a __ LDA #$9a
15bb : 85 2e __ STA P1 
15bd : a9 02 __ LDA #$02
15bf : 85 31 __ STA P4 
15c1 : 85 32 __ STA P5 
15c3 : 20 2d 18 JSR $182d ; (vera_spr_set.s0 + 0)
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
15e6 : a9 d1 __ LDA #$d1
15e8 : 85 35 __ STA P8 
15ea : a9 27 __ LDA #$27
15ec : 85 36 __ STA P9 
15ee : 20 49 19 JSR $1949 ; (SetPaletteColours.s0 + 0)
15f1 : a9 60 __ LDA #$60
15f3 : 8d fc 9e STA $9efc ; (sstack + 0)
15f6 : a9 fa __ LDA #$fa
15f8 : 8d fd 9e STA $9efd ; (sstack + 1)
15fb : a9 01 __ LDA #$01
15fd : 8d fe 9e STA $9efe ; (sstack + 2)
1600 : a9 00 __ LDA #$00
1602 : 8d ff 9e STA $9eff ; (sstack + 3)
1605 : a9 00 __ LDA #$00
1607 : 85 35 __ STA P8 
1609 : a9 44 __ LDA #$44
160b : 85 36 __ STA P9 
160d : 20 49 19 JSR $1949 ; (SetPaletteColours.s0 + 0)
1610 : a9 80 __ LDA #$80
1612 : 8d fc 9e STA $9efc ; (sstack + 0)
1615 : a9 fa __ LDA #$fa
1617 : 8d fd 9e STA $9efd ; (sstack + 1)
161a : a9 01 __ LDA #$01
161c : 8d fe 9e STA $9efe ; (sstack + 2)
161f : a9 00 __ LDA #$00
1621 : 8d ff 9e STA $9eff ; (sstack + 3)
1624 : a9 20 __ LDA #$20
1626 : 85 35 __ STA P8 
1628 : a9 44 __ LDA #$44
162a : 85 36 __ STA P9 
162c : 20 49 19 JSR $1949 ; (SetPaletteColours.s0 + 0)
162f : a9 60 __ LDA #$60
1631 : 85 2d __ STA P0 
1633 : a9 20 __ LDA #$20
1635 : 85 30 __ STA P3 
1637 : a9 00 __ LDA #$00
1639 : 85 31 __ STA P4 
163b : a9 f1 __ LDA #$f1
163d : 85 2e __ STA P1 
163f : a9 27 __ LDA #$27
1641 : 85 2f __ STA P2 
1643 : 20 00 19 JSR $1900 ; (vera_pal_putn.s0 + 0)
1646 : a9 70 __ LDA #$70
1648 : 85 2d __ STA P0 
164a : a9 0c __ LDA #$0c
164c : 85 30 __ STA P3 
164e : a9 00 __ LDA #$00
1650 : 85 31 __ STA P4 
1652 : a9 40 __ LDA #$40
1654 : 85 2e __ STA P1 
1656 : a9 44 __ LDA #$44
1658 : 85 2f __ STA P2 
165a : 20 00 19 JSR $1900 ; (vera_pal_putn.s0 + 0)
165d : a9 80 __ LDA #$80
165f : 85 2d __ STA P0 
1661 : a9 20 __ LDA #$20
1663 : 85 30 __ STA P3 
1665 : a9 00 __ LDA #$00
1667 : 85 31 __ STA P4 
1669 : a9 4c __ LDA #$4c
166b : 85 2e __ STA P1 
166d : a9 44 __ LDA #$44
166f : 85 2f __ STA P2 
1671 : 20 00 19 JSR $1900 ; (vera_pal_putn.s0 + 0)
1674 : a9 90 __ LDA #$90
1676 : 85 2d __ STA P0 
1678 : a9 10 __ LDA #$10
167a : 85 30 __ STA P3 
167c : a9 00 __ LDA #$00
167e : 85 31 __ STA P4 
1680 : a9 6c __ LDA #$6c
1682 : 85 2e __ STA P1 
1684 : a9 44 __ LDA #$44
1686 : 85 2f __ STA P2 
1688 : 20 00 19 JSR $1900 ; (vera_pal_putn.s0 + 0)
168b : a9 a0 __ LDA #$a0
168d : 85 2d __ STA P0 
168f : a9 1a __ LDA #$1a
1691 : 85 30 __ STA P3 
1693 : a9 00 __ LDA #$00
1695 : 85 31 __ STA P4 
1697 : a9 7c __ LDA #$7c
1699 : 85 2e __ STA P1 
169b : a9 44 __ LDA #$44
169d : 85 2f __ STA P2 
169f : 20 00 19 JSR $1900 ; (vera_pal_putn.s0 + 0)
16a2 : a9 00 __ LDA #$00
16a4 : 85 2d __ STA P0 
16a6 : 85 30 __ STA P3 
16a8 : 85 33 __ STA P6 
16aa : a9 45 __ LDA #$45
16ac : 85 2e __ STA P1 
16ae : a9 01 __ LDA #$01
16b0 : 85 2f __ STA P2 
16b2 : a9 04 __ LDA #$04
16b4 : 85 34 __ STA P7 
16b6 : a9 96 __ LDA #$96
16b8 : 85 31 __ STA P4 
16ba : a9 44 __ LDA #$44
16bc : 85 32 __ STA P5 
16be : 20 cb 17 JSR $17cb ; (vram_putn.s0 + 0)
16c1 : a9 03 __ LDA #$03
16c3 : 85 32 __ STA P5 
16c5 : 85 34 __ STA P7 
16c7 : a9 08 __ LDA #$08
16c9 : 85 33 __ STA P6 
16cb : a9 40 __ LDA #$40
16cd : 85 35 __ STA P8 
16cf : a9 5b __ LDA #$5b
16d1 : 85 36 __ STA P9 
16d3 : a9 01 __ LDA #$01
16d5 : 85 37 __ STA P10 
16d7 : a9 00 __ LDA #$00
16d9 : 85 38 __ STA P11 
16db : a9 fe __ LDA #$fe
16dd : 8d fc 9e STA $9efc ; (sstack + 0)
16e0 : a9 3f __ LDA #$3f
16e2 : 8d fd 9e STA $9efd ; (sstack + 1)
16e5 : a9 aa __ LDA #$aa
16e7 : 85 30 __ STA P3 
16e9 : a9 1a __ LDA #$1a
16eb : 85 31 __ STA P4 
16ed : 20 70 19 JSR $1970 ; (LoadSprite.s0 + 0)
16f0 : ad 29 9f LDA $9f29 
16f3 : 09 70 __ ORA #$70
16f5 : 8d 29 9f STA $9f29 
.s1001:
16f8 : 60 __ __ RTS
.s1032:
16f9 : c9 34 __ CMP #$34
16fb : 90 05 __ BCC $1702 ; (SetUpSprites.s1031 + 0)
.s29:
16fd : a9 09 __ LDA #$09
16ff : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1031:
1702 : a9 2c __ LDA #$2c
1704 : c5 25 __ CMP WORK + 2 
1706 : 90 40 __ BCC $1748 ; (SetUpSprites.s1024 + 0)
.s1030:
1708 : a5 4f __ LDA T2 + 0 
170a : c9 09 __ CMP #$09
170c : 90 06 __ BCC $1714 ; (SetUpSprites.s35 + 0)
.s1029:
170e : a9 45 __ LDA #$45
1710 : c5 4f __ CMP T2 + 0 
1712 : b0 05 __ BCS $1719 ; (SetUpSprites.s1028 + 0)
.s35:
1714 : a9 00 __ LDA #$00
1716 : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1028:
1719 : a5 4f __ LDA T2 + 0 
171b : c9 13 __ CMP #$13
171d : 90 06 __ BCC $1725 ; (SetUpSprites.s39 + 0)
.s1027:
171f : a9 3b __ LDA #$3b
1721 : c5 4f __ CMP T2 + 0 
1723 : b0 04 __ BCS $1729 ; (SetUpSprites.s1026 + 0)
.s39:
1725 : a9 01 __ LDA #$01
1727 : d0 12 __ BNE $173b ; (SetUpSprites.s236 + 0)
.s1026:
1729 : a5 4f __ LDA T2 + 0 
172b : c9 1d __ CMP #$1d
172d : 90 06 __ BCC $1735 ; (SetUpSprites.s43 + 0)
.s1025:
172f : a9 31 __ LDA #$31
1731 : c5 4f __ CMP T2 + 0 
1733 : b0 04 __ BCS $1739 ; (SetUpSprites.s44 + 0)
.s43:
1735 : a9 02 __ LDA #$02
1737 : d0 02 __ BNE $173b ; (SetUpSprites.s236 + 0)
.s44:
1739 : a9 03 __ LDA #$03
.s236:
173b : 8d 23 9f STA $9f23 
173e : a9 00 __ LDA #$00
1740 : 8d 23 9f STA $9f23 
1743 : e6 4f __ INC T2 + 0 
1745 : 4c c1 0e JMP $0ec1 ; (SetUpSprites.l14 + 0)
.s1024:
1748 : a9 2f __ LDA #$2f
174a : c5 25 __ CMP WORK + 2 
174c : a5 4f __ LDA T2 + 0 
174e : 90 33 __ BCC $1783 ; (SetUpSprites.s1017 + 0)
.s1023:
1750 : c9 09 __ CMP #$09
1752 : 90 06 __ BCC $175a ; (SetUpSprites.s51 + 0)
.s1022:
1754 : a9 45 __ LDA #$45
1756 : c5 4f __ CMP T2 + 0 
1758 : b0 05 __ BCS $175f ; (SetUpSprites.s1021 + 0)
.s51:
175a : a9 05 __ LDA #$05
175c : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1021:
175f : a5 4f __ LDA T2 + 0 
1761 : c9 13 __ CMP #$13
1763 : 90 06 __ BCC $176b ; (SetUpSprites.s55 + 0)
.s1020:
1765 : a9 3b __ LDA #$3b
1767 : c5 4f __ CMP T2 + 0 
1769 : b0 04 __ BCS $176f ; (SetUpSprites.s1019 + 0)
.s55:
176b : a9 06 __ LDA #$06
176d : d0 cc __ BNE $173b ; (SetUpSprites.s236 + 0)
.s1019:
176f : a5 4f __ LDA T2 + 0 
1771 : c9 1d __ CMP #$1d
1773 : 90 06 __ BCC $177b ; (SetUpSprites.s59 + 0)
.s1018:
1775 : a9 31 __ LDA #$31
1777 : c5 4f __ CMP T2 + 0 
1779 : b0 04 __ BCS $177f ; (SetUpSprites.s60 + 0)
.s59:
177b : a9 07 __ LDA #$07
177d : d0 bc __ BNE $173b ; (SetUpSprites.s236 + 0)
.s60:
177f : a9 08 __ LDA #$08
1781 : d0 b8 __ BNE $173b ; (SetUpSprites.s236 + 0)
.s1017:
1783 : c9 09 __ CMP #$09
1785 : 90 06 __ BCC $178d ; (SetUpSprites.s63 + 0)
.s1016:
1787 : a9 45 __ LDA #$45
1789 : c5 4f __ CMP T2 + 0 
178b : b0 05 __ BCS $1792 ; (SetUpSprites.s1005 + 0)
.s63:
178d : a9 0c __ LDA #$0c
178f : 4c f7 0e JMP $0ef7 ; (SetUpSprites.s219 + 0)
.s1005:
1792 : a5 4f __ LDA T2 + 0 
1794 : c9 13 __ CMP #$13
1796 : 90 06 __ BCC $179e ; (SetUpSprites.s67 + 0)
.s1004:
1798 : a9 3b __ LDA #$3b
179a : c5 4f __ CMP T2 + 0 
179c : b0 04 __ BCS $17a2 ; (SetUpSprites.s71 + 0)
.s67:
179e : a9 0d __ LDA #$0d
17a0 : d0 99 __ BNE $173b ; (SetUpSprites.s236 + 0)
.s71:
17a2 : a9 0e __ LDA #$0e
17a4 : d0 95 __ BNE $173b ; (SetUpSprites.s236 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
17a6 : 46 2d __ LSR P0 ; (bank + 0)
17a8 : a9 00 __ LDA #$00
17aa : 6a __ __ ROR
17ab : 85 3b __ STA ACCU + 0 
17ad : a5 2f __ LDA P2 ; (mem + 1)
17af : 29 f8 __ AND #$f8
17b1 : 4a __ __ LSR
17b2 : 05 3b __ ORA ACCU + 0 
17b4 : 85 3b __ STA ACCU + 0 
17b6 : a5 30 __ LDA P3 ; (height + 0)
17b8 : 0a __ __ ASL
17b9 : 05 3b __ ORA ACCU + 0 
17bb : 05 31 __ ORA P4 ; (width + 0)
.s1001:
17bd : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
17be : 46 2d __ LSR P0 ; (bank + 0)
17c0 : a9 00 __ LDA #$00
17c2 : 6a __ __ ROR
17c3 : 85 3b __ STA ACCU + 0 
17c5 : a5 2f __ LDA P2 ; (mem + 1)
17c7 : 4a __ __ LSR
17c8 : 05 3b __ ORA ACCU + 0 
.s1001:
17ca : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
17cb : ad 25 9f LDA $9f25 
17ce : 29 fe __ AND #$fe
17d0 : 8d 25 9f STA $9f25 
17d3 : a5 2d __ LDA P0 ; (addr + 0)
17d5 : 8d 20 9f STA $9f20 
17d8 : a5 2e __ LDA P1 ; (addr + 1)
17da : 8d 21 9f STA $9f21 
17dd : a5 2f __ LDA P2 ; (addr + 2)
17df : 29 01 __ AND #$01
17e1 : 09 10 __ ORA #$10
17e3 : 8d 22 9f STA $9f22 
17e6 : a5 33 __ LDA P6 ; (size + 0)
17e8 : 05 34 __ ORA P7 ; (size + 1)
17ea : f0 19 __ BEQ $1805 ; (vram_putn.s1001 + 0)
.s6:
17ec : a0 00 __ LDY #$00
17ee : a6 33 __ LDX P6 ; (size + 0)
17f0 : f0 02 __ BEQ $17f4 ; (vram_putn.l1002 + 0)
.s1005:
17f2 : e6 34 __ INC P7 ; (size + 1)
.l1002:
17f4 : b1 31 __ LDA (P4),y ; (data + 0)
17f6 : 8d 23 9f STA $9f23 
17f9 : c8 __ __ INY
17fa : d0 02 __ BNE $17fe ; (vram_putn.s1009 + 0)
.s1008:
17fc : e6 32 __ INC P5 ; (data + 1)
.s1009:
17fe : ca __ __ DEX
17ff : d0 f3 __ BNE $17f4 ; (vram_putn.l1002 + 0)
.s1004:
1801 : c6 34 __ DEC P7 ; (size + 1)
1803 : d0 ef __ BNE $17f4 ; (vram_putn.l1002 + 0)
.s1001:
1805 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
214f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
215f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
216f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
217f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
218f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
219f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
21af : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
21bf : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
21cf : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
21df : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
21ef : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
21ff : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
220f : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
221f : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
222f : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
223f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
224f : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
225f : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
226f : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
227f : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
228f : __ __ __ BYT 55 55 55 55 55 55 55 55 aa aa aa aa aa aa aa aa : UUUUUUUU........
229f : __ __ __ BYT aa aa aa aa aa aa aa aa 88 88 88 88 88 88 88 88 : ................
22af : __ __ __ BYT 88 88 88 88 88 88 88 88 77 77 77 77 77 77 77 77 : ........wwwwwwww
22bf : __ __ __ BYT cc cc cc cc cc cc cc cc 00 00 00 00 00 00 00 00 : ................
22cf : __ __ __ BYT 05 00 00 50 00 09 90 00 00 9b b9 00 09 b5 5b 90 : ...P..........[.
22df : __ __ __ BYT 09 b5 5b 90 00 9b b9 05 00 09 90 00 05 00 00 00 : ..[.............
22ef : __ __ __ BYT 13 11 11 11 11 11 11 31 11 19 91 11 11 9b b9 11 : .......1........
22ff : __ __ __ BYT 11 9b b9 11 11 19 91 13 11 11 11 11 13 11 11 11 : ................
230f : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 19 91 11 : ................
231f : __ __ __ BYT 11 19 91 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
--------------------------------------------------------------------
rand:
.s0:
1806 : ad 30 23 LDA $2330 ; (seed + 1)
1809 : 4a __ __ LSR
180a : ad 2f 23 LDA $232f ; (seed + 0)
180d : 6a __ __ ROR
180e : aa __ __ TAX
180f : a9 00 __ LDA #$00
1811 : 6a __ __ ROR
1812 : 4d 2f 23 EOR $232f ; (seed + 0)
1815 : 85 3b __ STA ACCU + 0 
1817 : 8a __ __ TXA
1818 : 4d 30 23 EOR $2330 ; (seed + 1)
181b : 85 3c __ STA ACCU + 1 
181d : 4a __ __ LSR
181e : 45 3b __ EOR ACCU + 0 
1820 : 8d 2f 23 STA $232f ; (seed + 0)
1823 : 85 3b __ STA ACCU + 0 
1825 : 45 3c __ EOR ACCU + 1 
1827 : 8d 30 23 STA $2330 ; (seed + 1)
182a : 85 3c __ STA ACCU + 1 
.s1001:
182c : 60 __ __ RTS
--------------------------------------------------------------------
seed:
232f : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
2331 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
2341 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
2351 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
2361 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
2371 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
2381 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
2391 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
23a1 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
23b1 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
23c1 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
23d1 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
23e1 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
23f1 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
2401 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
2411 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
2421 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
2431 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
2441 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
2451 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
2461 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
2471 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
2481 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
2491 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
24a1 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
24b1 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
24c1 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
24d1 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
24e1 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
24f1 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
2501 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
2511 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
2521 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
2531 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2541 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2551 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
2561 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
2571 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2581 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2591 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
25a1 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
25b1 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
25c1 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
25d1 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25e1 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25f1 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
2601 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
2611 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
2621 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
2631 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
2641 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
2651 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
2661 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2671 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2681 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2691 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
26a1 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
26b1 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
26c1 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
26d1 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
26e1 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
26f1 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
2701 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
2711 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
2721 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
182d : ad 25 9f LDA $9f25 
1830 : 29 fe __ AND #$fe
1832 : 8d 25 9f STA $9f25 
1835 : a5 2d __ LDA P0 ; (spr + 0)
1837 : 0a __ __ ASL
1838 : 0a __ __ ASL
1839 : 85 3b __ STA ACCU + 0 
183b : a9 3f __ LDA #$3f
183d : 2a __ __ ROL
183e : 06 3b __ ASL ACCU + 0 
1840 : 2a __ __ ROL
1841 : 8d 21 9f STA $9f21 
1844 : a5 3b __ LDA ACCU + 0 
1846 : 8d 20 9f STA $9f20 
1849 : a9 11 __ LDA #$11
184b : 8d 22 9f STA $9f22 
184e : a5 30 __ LDA P3 ; (mode8 + 0)
1850 : f0 02 __ BEQ $1854 ; (vera_spr_set.s11 + 0)
.s9:
1852 : a9 80 __ LDA #$80
.s11:
1854 : 05 2f __ ORA P2 ; (addr32 + 1)
1856 : a6 2e __ LDX P1 ; (addr32 + 0)
1858 : 8e 23 9f STX $9f23 
185b : 8d 23 9f STA $9f23 
185e : a9 00 __ LDA #$00
1860 : 8d 23 9f STA $9f23 
1863 : 8d 23 9f STA $9f23 
1866 : 8d 23 9f STA $9f23 
1869 : 8d 23 9f STA $9f23 
186c : a5 33 __ LDA P6 ; (z + 0)
186e : 0a __ __ ASL
186f : 0a __ __ ASL
1870 : 8d 23 9f STA $9f23 
1873 : a5 32 __ LDA P5 ; (h + 0)
1875 : 4a __ __ LSR
1876 : 6a __ __ ROR
1877 : 29 80 __ AND #$80
1879 : 6a __ __ ROR
187a : 85 3b __ STA ACCU + 0 
187c : a5 31 __ LDA P4 ; (w + 0)
187e : 0a __ __ ASL
187f : 0a __ __ ASL
1880 : 0a __ __ ASL
1881 : 0a __ __ ASL
1882 : 05 3b __ ORA ACCU + 0 
1884 : 05 34 __ ORA P7 ; (pal + 0)
1886 : 8d 23 9f STA $9f23 
.s1001:
1889 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
188a : ad 25 9f LDA $9f25 
188d : 29 fe __ AND #$fe
188f : 8d 25 9f STA $9f25 
1892 : a5 2d __ LDA P0 ; (spr + 0)
1894 : 0a __ __ ASL
1895 : 0a __ __ ASL
1896 : 85 3b __ STA ACCU + 0 
1898 : a9 3f __ LDA #$3f
189a : 2a __ __ ROL
189b : 06 3b __ ASL ACCU + 0 
189d : 2a __ __ ROL
189e : aa __ __ TAX
189f : a5 3b __ LDA ACCU + 0 
18a1 : 09 02 __ ORA #$02
18a3 : 8d 20 9f STA $9f20 
18a6 : 8e 21 9f STX $9f21 
18a9 : a9 11 __ LDA #$11
18ab : 8d 22 9f STA $9f22 
18ae : a5 2e __ LDA P1 ; (x + 0)
18b0 : 8d 23 9f STA $9f23 
18b3 : a5 2f __ LDA P2 ; (x + 1)
18b5 : 8d 23 9f STA $9f23 
18b8 : a5 30 __ LDA P3 ; (y + 0)
18ba : 8d 23 9f STA $9f23 
18bd : a5 31 __ LDA P4 ; (y + 1)
18bf : 8d 23 9f STA $9f23 
.s1001:
18c2 : 60 __ __ RTS
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
18c3 : ad 25 9f LDA $9f25 
18c6 : 29 fe __ AND #$fe
18c8 : 8d 25 9f STA $9f25 
18cb : a5 2d __ LDA P0 ; (spr + 0)
18cd : 0a __ __ ASL
18ce : 0a __ __ ASL
18cf : 85 3b __ STA ACCU + 0 
18d1 : a9 3f __ LDA #$3f
18d3 : 2a __ __ ROL
18d4 : 06 3b __ ASL ACCU + 0 
18d6 : 2a __ __ ROL
18d7 : aa __ __ TAX
18d8 : a5 3b __ LDA ACCU + 0 
18da : 09 06 __ ORA #$06
18dc : 8d 20 9f STA $9f20 
18df : 8e 21 9f STX $9f21 
18e2 : a9 01 __ LDA #$01
18e4 : 8d 22 9f STA $9f22 
18e7 : ad 23 9f LDA $9f23 
18ea : 29 fc __ AND #$fc
18ec : a8 __ __ TAY
18ed : a5 2e __ LDA P1 ; (fliph + 0)
18ef : f0 01 __ BEQ $18f2 ; (vera_spr_flip.s14 + 0)
.s6:
18f1 : c8 __ __ INY
.s14:
18f2 : a5 2f __ LDA P2 ; (flipv + 0)
18f4 : f0 05 __ BEQ $18fb ; (vera_spr_flip.s11 + 0)
.s9:
18f6 : 98 __ __ TYA
18f7 : 09 02 __ ORA #$02
18f9 : d0 01 __ BNE $18fc ; (vera_spr_flip.s1002 + 0)
.s11:
18fb : 98 __ __ TYA
.s1002:
18fc : 8d 23 9f STA $9f23 
.s1001:
18ff : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1900 : ad 25 9f LDA $9f25 
1903 : 29 fe __ AND #$fe
1905 : 8d 25 9f STA $9f25 
1908 : a5 2d __ LDA P0 ; (index + 0)
190a : 0a __ __ ASL
190b : 8d 20 9f STA $9f20 
190e : a9 7d __ LDA #$7d
1910 : 2a __ __ ROL
1911 : 8d 21 9f STA $9f21 
1914 : a9 11 __ LDA #$11
1916 : 8d 22 9f STA $9f22 
1919 : a5 30 __ LDA P3 ; (size + 0)
191b : 05 31 __ ORA P4 ; (size + 1)
191d : f0 29 __ BEQ $1948 ; (vera_pal_putn.s1001 + 0)
.s6:
191f : a6 30 __ LDX P3 ; (size + 0)
1921 : f0 02 __ BEQ $1925 ; (vera_pal_putn.l3 + 0)
.s1003:
1923 : e6 31 __ INC P4 ; (size + 1)
.l3:
1925 : a0 01 __ LDY #$01
1927 : b1 2e __ LDA (P1),y ; (color + 0)
1929 : 85 3c __ STA ACCU + 1 
192b : 88 __ __ DEY
192c : b1 2e __ LDA (P1),y ; (color + 0)
192e : 8d 23 9f STA $9f23 
1931 : a5 3c __ LDA ACCU + 1 
1933 : 8d 23 9f STA $9f23 
1936 : 18 __ __ CLC
1937 : a5 2e __ LDA P1 ; (color + 0)
1939 : 69 02 __ ADC #$02
193b : 85 2e __ STA P1 ; (color + 0)
193d : 90 02 __ BCC $1941 ; (vera_pal_putn.s1007 + 0)
.s1006:
193f : e6 2f __ INC P2 ; (color + 1)
.s1007:
1941 : ca __ __ DEX
1942 : d0 e1 __ BNE $1925 ; (vera_pal_putn.l3 + 0)
.s1002:
1944 : c6 31 __ DEC P4 ; (size + 1)
1946 : d0 dd __ BNE $1925 ; (vera_pal_putn.l3 + 0)
.s1001:
1948 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2731 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2741 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2b50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2b60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2b70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2b80 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2b90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2ba0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2bb0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2bc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2bd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2be0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2bf0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2c00 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2c10 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2c20 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2c30 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2c40 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2c50 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2c60 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2c70 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2c80 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2c90 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2ca0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2cb0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2cc0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2cd0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2ce0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2cf0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
2d00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2d10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2d20 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2d30 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2d40 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2d50 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2d60 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2d70 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2d80 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2d90 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
2da0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
2db0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
2dc0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
2dd0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
2de0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
2df0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2e10 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2e30 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2e40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2e50 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2e60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2e70 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2e80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2e90 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2ea0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2eb0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2ec0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2ed0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2ee0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2ef0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2f00 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2f10 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2f20 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2f30 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2f40 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2f50 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2f60 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2f70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2f80 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2f90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2fa0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2fb0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2fc0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2fd0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2fe0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2ff0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3000 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
3010 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3020 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3030 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
3040 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3050 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
3060 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3070 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
3080 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3090 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
30a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
30b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
30c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
30d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
30e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
30f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3100 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
3110 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3120 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
3130 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
3140 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
3150 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
3160 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3170 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
3180 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3190 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
31a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
31b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
31c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
31d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
31e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
31f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
3200 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3210 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3220 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3230 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3240 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3250 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3260 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3270 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3280 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3290 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
32a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
32b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
32c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
32d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
32e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
32f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3300 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3310 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3320 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3330 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3340 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3350 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3360 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3370 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3380 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3390 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
33a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
33b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
33c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
33d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
33e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
33f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3400 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3410 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3420 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3430 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3440 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3450 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3460 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3470 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3480 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3490 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
34a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
34b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
34c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
34d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
34e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
34f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3500 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3510 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3520 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3530 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3540 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3550 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3560 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3570 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3580 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3590 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
35a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
35b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
35c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
35d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
35e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
35f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3600 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3610 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3620 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3630 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3640 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3650 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3660 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3670 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3680 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3690 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
36a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
36b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
36c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
36d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
36e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
36f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3700 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3710 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3720 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3730 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3740 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3750 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3760 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3770 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3780 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3790 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
37a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
37b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
37c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
37d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
37e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
37f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3800 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3810 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3820 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3830 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3840 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3850 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3860 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3870 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3880 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3890 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
38a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
38b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
38c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
38d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
38e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
38f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3900 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3910 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3920 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3930 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3940 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3950 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3960 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3970 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3980 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3990 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
39a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
39b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
39c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
39d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
39e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
39f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
CharBox:
3a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a20 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3a30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3a40 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3a50 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3a60 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3a70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3a80 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3a90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3aa0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3ab0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3ac0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
3ad0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3ae0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3af0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3b00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3b20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3b40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3b60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3b80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3b90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3ba0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3bb0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3bc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3bd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
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
3e10 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3e20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e30 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3e40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e50 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3e60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e70 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3e80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e90 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3ea0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3eb0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3ec0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ed0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3ee0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ef0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3f00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f10 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3f20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f30 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3f40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f50 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3f60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f70 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3f80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3f90 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3fa0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3fb0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3fc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3fd0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
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
--------------------------------------------------------------------
WavyHead:
4200 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
4210 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4220 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4230 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4240 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4250 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4260 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
4270 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4280 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4290 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
42a0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
42b0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
42c0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
42d0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
42e0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
42f0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4300 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4310 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4320 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4330 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4340 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4350 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4360 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4370 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4380 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4390 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
43a0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
43b0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
43c0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
43d0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
43e0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
43f0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
2751 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2761 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
2771 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
2781 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
2791 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
27a1 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
27b1 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
27c1 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1949 : ad fc 9e LDA $9efc ; (sstack + 0)
194c : 85 2d __ STA P0 
194e : ad fd 9e LDA $9efd ; (sstack + 1)
1951 : 85 2e __ STA P1 
1953 : ad fe 9e LDA $9efe ; (sstack + 2)
1956 : 85 2f __ STA P2 
1958 : ad ff 9e LDA $9eff ; (sstack + 3)
195b : 85 30 __ STA P3 
195d : a5 35 __ LDA P8 ; (input + 0)
195f : 85 31 __ STA P4 
1961 : a5 36 __ LDA P9 ; (input + 1)
1963 : 85 32 __ STA P5 
1965 : a5 37 __ LDA P10 ; (inputsize + 0)
1967 : 85 33 __ STA P6 
1969 : a9 00 __ LDA #$00
196b : 85 34 __ STA P7 
196d : 4c cb 17 JMP $17cb ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
27d1 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
27e1 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
4400 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
4410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
4420 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
4430 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
27f1 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
4440 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
444c : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
445c : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
446c : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
447c : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
448c : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
EyeTri:
4496 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
44b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
44d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
44f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4506 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4516 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4526 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4536 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4546 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4556 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4566 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4576 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4586 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
4596 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45a6 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
45b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45c6 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
45d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45e6 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
45f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4606 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4616 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4626 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4636 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4646 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4656 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4666 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4676 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4686 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4696 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
46a6 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
46b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
46c6 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
46d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
46e6 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
46f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4706 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4716 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4726 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4736 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4746 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4756 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4766 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
4776 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
4786 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
4796 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
47a6 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
47b6 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
47c6 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
47d6 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
47e6 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
47f6 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4806 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4816 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4826 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4836 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4846 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4856 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4866 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
4876 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4886 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
1970 : a5 30 __ LDA P3 ; (name + 0)
1972 : 85 2d __ STA P0 
1974 : a5 31 __ LDA P4 ; (name + 1)
1976 : 85 2e __ STA P1 
1978 : 20 e3 19 JSR $19e3 ; (krnio_setnam.s0 + 0)
197b : a5 32 __ LDA P5 ; (fnum + 0)
197d : 85 2d __ STA P0 
197f : a5 33 __ LDA P6 ; (device + 0)
1981 : 85 2e __ STA P1 
1983 : a5 34 __ LDA P7 ; (channel + 0)
1985 : 85 2f __ STA P2 
1987 : 20 f9 19 JSR $19f9 ; (krnio_open.s0 + 0)
198a : ad fd 9e LDA $9efd ; (sstack + 1)
198d : 85 4a __ STA T0 + 1 
198f : ad fc 9e LDA $9efc ; (sstack + 0)
1992 : 85 49 __ STA T0 + 0 
1994 : 05 4a __ ORA T0 + 1 
1996 : f0 46 __ BEQ $19de ; (LoadSprite.s4 + 0)
.s8:
1998 : a9 00 __ LDA #$00
199a : 85 4b __ STA T2 + 0 
199c : 85 4c __ STA T2 + 1 
.l2:
199e : a5 32 __ LDA P5 ; (fnum + 0)
19a0 : 85 2e __ STA P1 
19a2 : 20 21 1a JSR $1a21 ; (krnio_getch.s0 + 0)
19a5 : ad 25 9f LDA $9f25 
19a8 : 29 fe __ AND #$fe
19aa : 8d 25 9f STA $9f25 
19ad : 18 __ __ CLC
19ae : a5 4b __ LDA T2 + 0 
19b0 : 65 35 __ ADC P8 ; (Addr + 0)
19b2 : 8d 20 9f STA $9f20 
19b5 : a5 4c __ LDA T2 + 1 
19b7 : 65 36 __ ADC P9 ; (Addr + 1)
19b9 : 8d 21 9f STA $9f21 
19bc : a9 00 __ LDA #$00
19be : 65 37 __ ADC P10 ; (Addr + 2)
19c0 : 29 01 __ AND #$01
19c2 : 09 10 __ ORA #$10
19c4 : 8d 22 9f STA $9f22 
19c7 : a5 3b __ LDA ACCU + 0 
19c9 : 8d 23 9f STA $9f23 
19cc : e6 4b __ INC T2 + 0 
19ce : d0 02 __ BNE $19d2 ; (LoadSprite.s1005 + 0)
.s1004:
19d0 : e6 4c __ INC T2 + 1 
.s1005:
19d2 : a5 4c __ LDA T2 + 1 
19d4 : c5 4a __ CMP T0 + 1 
19d6 : d0 04 __ BNE $19dc ; (LoadSprite.s1003 + 0)
.s1002:
19d8 : a5 4b __ LDA T2 + 0 
19da : c5 49 __ CMP T0 + 0 
.s1003:
19dc : 90 c0 __ BCC $199e ; (LoadSprite.l2 + 0)
.s4:
19de : a5 32 __ LDA P5 ; (fnum + 0)
19e0 : 4c a2 1a JMP $1aa2 ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
19e3 : a5 2d __ LDA P0 
19e5 : 05 2e __ ORA P1 
19e7 : f0 08 __ BEQ $19f1 ; (krnio_setnam.s0 + 14)
19e9 : a0 ff __ LDY #$ff
19eb : c8 __ __ INY
19ec : b1 2d __ LDA (P0),y 
19ee : d0 fb __ BNE $19eb ; (krnio_setnam.s0 + 8)
19f0 : 98 __ __ TYA
19f1 : a6 2d __ LDX P0 
19f3 : a4 2e __ LDY P1 
19f5 : 20 bd ff JSR $ffbd 
.s1001:
19f8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
19f9 : a9 00 __ LDA #$00
19fb : a6 2d __ LDX P0 ; (fnum + 0)
19fd : 9d ed 48 STA $48ed,x ; (krnio_pstatus + 0)
1a00 : a9 00 __ LDA #$00
1a02 : 85 3b __ STA ACCU + 0 
1a04 : 85 3c __ STA ACCU + 1 
1a06 : a5 2d __ LDA P0 ; (fnum + 0)
1a08 : a6 2e __ LDX P1 
1a0a : a4 2f __ LDY P2 
1a0c : 20 ba ff JSR $ffba 
1a0f : 20 c0 ff JSR $ffc0 
1a12 : 90 08 __ BCC $1a1c ; (krnio_open.s0 + 35)
1a14 : a5 2d __ LDA P0 ; (fnum + 0)
1a16 : 20 c3 ff JSR $ffc3 
1a19 : 4c 20 1a JMP $1a20 ; (krnio_open.s1001 + 0)
1a1c : a9 01 __ LDA #$01
1a1e : 85 3b __ STA ACCU + 0 
.s1001:
1a20 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
48ed : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_getch:
.s0:
1a21 : a4 2e __ LDY P1 ; (fnum + 0)
1a23 : b9 ed 48 LDA $48ed,y ; (krnio_pstatus + 0)
1a26 : c9 40 __ CMP #$40
1a28 : f0 48 __ BEQ $1a72 ; (krnio_getch.s1007 + 0)
.s3:
1a2a : a9 ff __ LDA #$ff
1a2c : 85 47 __ STA T3 + 0 
1a2e : 85 48 __ STA T3 + 1 
1a30 : 98 __ __ TYA
1a31 : 20 78 1a JSR $1a78 ; (krnio_chkin.s1000 + 0)
1a34 : a5 3b __ LDA ACCU + 0 
1a36 : f0 19 __ BEQ $1a51 ; (krnio_getch.s7 + 0)
.s5:
1a38 : 20 8a 1a JSR $1a8a ; (krnio_chrin.s0 + 0)
1a3b : a5 3b __ LDA ACCU + 0 
1a3d : 85 47 __ STA T3 + 0 
1a3f : a5 3c __ LDA ACCU + 1 
1a41 : 85 48 __ STA T3 + 1 
1a43 : 20 94 1a JSR $1a94 ; (krnio_status.s0 + 0)
1a46 : a5 3b __ LDA ACCU + 0 
1a48 : a6 2e __ LDX P1 ; (fnum + 0)
1a4a : 9d ed 48 STA $48ed,x ; (krnio_pstatus + 0)
1a4d : 09 00 __ ORA #$00
1a4f : d0 0c __ BNE $1a5d ; (krnio_getch.s8 + 0)
.s7:
1a51 : 20 9e 1a JSR $1a9e ; (krnio_clrchn.s0 + 0)
1a54 : a5 47 __ LDA T3 + 0 
1a56 : 85 3b __ STA ACCU + 0 
1a58 : a5 48 __ LDA T3 + 1 
.s1006:
1a5a : 85 3c __ STA ACCU + 1 
.s1001:
1a5c : 60 __ __ RTS
.s8:
1a5d : c9 40 __ CMP #$40
1a5f : d0 0e __ BNE $1a6f ; (krnio_getch.s12 + 0)
.s11:
1a61 : 20 9e 1a JSR $1a9e ; (krnio_clrchn.s0 + 0)
1a64 : a5 48 __ LDA T3 + 1 
1a66 : 09 01 __ ORA #$01
1a68 : 85 3c __ STA ACCU + 1 
1a6a : a5 47 __ LDA T3 + 0 
1a6c : 85 3b __ STA ACCU + 0 
1a6e : 60 __ __ RTS
.s12:
1a6f : 20 9e 1a JSR $1a9e ; (krnio_clrchn.s0 + 0)
.s1007:
1a72 : a9 ff __ LDA #$ff
1a74 : 85 3b __ STA ACCU + 0 
1a76 : d0 e2 __ BNE $1a5a ; (krnio_getch.s1006 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a78 : 85 2d __ STA P0 
.s0:
1a7a : a6 2d __ LDX P0 
1a7c : 20 c6 ff JSR $ffc6 
1a7f : a9 00 __ LDA #$00
1a81 : 85 3c __ STA ACCU + 1 
1a83 : b0 02 __ BCS $1a87 ; (krnio_chkin.s0 + 13)
1a85 : a9 01 __ LDA #$01
1a87 : 85 3b __ STA ACCU + 0 
.s1001:
1a89 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a8a : 20 cf ff JSR $ffcf 
1a8d : 85 3b __ STA ACCU + 0 
1a8f : a9 00 __ LDA #$00
1a91 : 85 3c __ STA ACCU + 1 
.s1001:
1a93 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1a94 : 20 b7 ff JSR $ffb7 
1a97 : 85 3b __ STA ACCU + 0 
1a99 : a9 00 __ LDA #$00
1a9b : 85 3c __ STA ACCU + 1 
.s1001:
1a9d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1a9e : 20 cc ff JSR $ffcc 
.s1001:
1aa1 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1aa2 : 85 2d __ STA P0 
.s0:
1aa4 : a5 2d __ LDA P0 
1aa6 : 20 c3 ff JSR $ffc3 
.s1001:
1aa9 : 60 __ __ RTS
--------------------------------------------------------------------
1aaa : __ __ __ BYT 40 30 3a 73 70 72 69 74 65 73 2f 62 69 6e 2f 43 : @0:sprites/bin/C
1aba : __ __ __ BYT 52 49 53 50 59 2e 42 49 4e 2c 50 2c 52 00       : RISPY.BIN,P,R.
--------------------------------------------------------------------
BGPal:
4896 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
48a6 : __ __ __ BYT 99 09 9b 0f bb 0b ee 0f 44 04 ff 0f ff 0f ff 0f : ........D.......
--------------------------------------------------------------------
getchx:
.s0:
1ac8 : 20 d2 1a JSR $1ad2 ; (getpch + 0)
1acb : 85 3b __ STA ACCU + 0 
1acd : a9 00 __ LDA #$00
1acf : 85 3c __ STA ACCU + 1 
.s1001:
1ad1 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1ad2 : 20 e4 ff JSR $ffe4 
1ad5 : ae fd 27 LDX $27fd ; (giocharmap + 0)
1ad8 : e0 01 __ CPX #$01
1ada : 90 26 __ BCC $1b02 ; (getpch + 48)
1adc : c9 0d __ CMP #$0d
1ade : d0 02 __ BNE $1ae2 ; (getpch + 16)
1ae0 : a9 0a __ LDA #$0a
1ae2 : e0 02 __ CPX #$02
1ae4 : 90 1c __ BCC $1b02 ; (getpch + 48)
1ae6 : c9 db __ CMP #$db
1ae8 : b0 18 __ BCS $1b02 ; (getpch + 48)
1aea : c9 41 __ CMP #$41
1aec : 90 14 __ BCC $1b02 ; (getpch + 48)
1aee : c9 c1 __ CMP #$c1
1af0 : 90 02 __ BCC $1af4 ; (getpch + 34)
1af2 : 49 a0 __ EOR #$a0
1af4 : c9 7b __ CMP #$7b
1af6 : b0 0a __ BCS $1b02 ; (getpch + 48)
1af8 : c9 61 __ CMP #$61
1afa : b0 04 __ BCS $1b00 ; (getpch + 46)
1afc : c9 5b __ CMP #$5b
1afe : b0 02 __ BCS $1b02 ; (getpch + 48)
1b00 : 49 20 __ EOR #$20
1b02 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
27fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
27fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
48b6 : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
48b8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
48ba : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1b03 : a9 33 __ LDA #$33
1b05 : 85 2d __ STA P0 
1b07 : a9 38 __ LDA #$38
1b09 : 85 2e __ STA P1 
1b0b : a9 01 __ LDA #$01
1b0d : 85 2f __ STA P2 
1b0f : a6 32 __ LDX P5 ; (p + 0)
1b11 : bd 00 49 LDA $4900,x ; (sintab + 0)
1b14 : 4a __ __ LSR
1b15 : 4a __ __ LSR
1b16 : 4a __ __ LSR
1b17 : 49 10 __ EOR #$10
1b19 : 38 __ __ SEC
1b1a : e9 10 __ SBC #$10
1b1c : 18 __ __ CLC
1b1d : 69 b4 __ ADC #$b4
1b1f : 85 30 __ STA P3 
1b21 : a9 00 __ LDA #$00
1b23 : 85 31 __ STA P4 
1b25 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1b28 : a9 34 __ LDA #$34
1b2a : 85 2d __ STA P0 
1b2c : a9 20 __ LDA #$20
1b2e : 85 2e __ STA P1 
1b30 : a6 34 __ LDX P7 ; (p2 + 0)
1b32 : bd 00 49 LDA $4900,x ; (sintab + 0)
1b35 : 4a __ __ LSR
1b36 : 4a __ __ LSR
1b37 : 4a __ __ LSR
1b38 : 49 10 __ EOR #$10
1b3a : 38 __ __ SEC
1b3b : e9 10 __ SBC #$10
1b3d : 18 __ __ CLC
1b3e : 69 b4 __ ADC #$b4
1b40 : 85 30 __ STA P3 
1b42 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1b45 : a9 35 __ LDA #$35
1b47 : 85 2d __ STA P0 
1b49 : a9 00 __ LDA #$00
1b4b : 85 2e __ STA P1 
1b4d : a6 36 __ LDX P9 ; (p3 + 0)
1b4f : bd 00 49 LDA $4900,x ; (sintab + 0)
1b52 : 4a __ __ LSR
1b53 : 4a __ __ LSR
1b54 : 4a __ __ LSR
1b55 : 49 10 __ EOR #$10
1b57 : 38 __ __ SEC
1b58 : e9 10 __ SBC #$10
1b5a : 18 __ __ CLC
1b5b : 69 a4 __ ADC #$a4
1b5d : 85 30 __ STA P3 
1b5f : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1b62 : a9 36 __ LDA #$36
1b64 : 85 2d __ STA P0 
1b66 : a9 40 __ LDA #$40
1b68 : 85 2e __ STA P1 
1b6a : a6 36 __ LDX P9 ; (p3 + 0)
1b6c : bd 00 49 LDA $4900,x ; (sintab + 0)
1b6f : 4a __ __ LSR
1b70 : 4a __ __ LSR
1b71 : 4a __ __ LSR
1b72 : 49 10 __ EOR #$10
1b74 : 38 __ __ SEC
1b75 : e9 10 __ SBC #$10
1b77 : 18 __ __ CLC
1b78 : 69 a4 __ ADC #$a4
1b7a : 85 30 __ STA P3 
1b7c : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1b7f : a9 37 __ LDA #$37
1b81 : 85 2d __ STA P0 
1b83 : a9 00 __ LDA #$00
1b85 : 85 2e __ STA P1 
1b87 : a6 36 __ LDX P9 ; (p3 + 0)
1b89 : bd 00 49 LDA $4900,x ; (sintab + 0)
1b8c : 4a __ __ LSR
1b8d : 4a __ __ LSR
1b8e : 4a __ __ LSR
1b8f : 49 10 __ EOR #$10
1b91 : 38 __ __ SEC
1b92 : e9 10 __ SBC #$10
1b94 : 18 __ __ CLC
1b95 : 69 c4 __ ADC #$c4
1b97 : 85 30 __ STA P3 
1b99 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1b9c : a9 38 __ LDA #$38
1b9e : 85 2d __ STA P0 
1ba0 : a9 40 __ LDA #$40
1ba2 : 85 2e __ STA P1 
1ba4 : a6 36 __ LDX P9 ; (p3 + 0)
1ba6 : bd 00 49 LDA $4900,x ; (sintab + 0)
1ba9 : 4a __ __ LSR
1baa : 4a __ __ LSR
1bab : 4a __ __ LSR
1bac : 49 10 __ EOR #$10
1bae : 38 __ __ SEC
1baf : e9 10 __ SBC #$10
1bb1 : 18 __ __ CLC
1bb2 : 69 c4 __ ADC #$c4
1bb4 : 85 30 __ STA P3 
1bb6 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1bb9 : a9 00 __ LDA #$00
1bbb : 85 2d __ STA P0 
1bbd : 85 2f __ STA P2 
1bbf : a9 68 __ LDA #$68
1bc1 : 85 2e __ STA P1 
1bc3 : a6 36 __ LDX P9 ; (p3 + 0)
1bc5 : bd 00 49 LDA $4900,x ; (sintab + 0)
1bc8 : 4a __ __ LSR
1bc9 : 4a __ __ LSR
1bca : 4a __ __ LSR
1bcb : 4a __ __ LSR
1bcc : 49 08 __ EOR #$08
1bce : 38 __ __ SEC
1bcf : e9 08 __ SBC #$08
1bd1 : 85 48 __ STA T2 + 0 
1bd3 : a9 00 __ LDA #$00
1bd5 : e9 00 __ SBC #$00
1bd7 : 85 49 __ STA T2 + 1 
1bd9 : 38 __ __ SEC
1bda : a9 b6 __ LDA #$b6
1bdc : e5 48 __ SBC T2 + 0 
1bde : 85 30 __ STA P3 
1be0 : a9 01 __ LDA #$01
1be2 : e5 49 __ SBC T2 + 1 
1be4 : 85 31 __ STA P4 
1be6 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1be9 : a9 01 __ LDA #$01
1beb : 85 2d __ STA P0 
1bed : 85 2f __ STA P2 
1bef : a9 f0 __ LDA #$f0
1bf1 : 85 2e __ STA P1 
1bf3 : a6 36 __ LDX P9 ; (p3 + 0)
1bf5 : bd 00 49 LDA $4900,x ; (sintab + 0)
1bf8 : 4a __ __ LSR
1bf9 : 4a __ __ LSR
1bfa : 4a __ __ LSR
1bfb : 4a __ __ LSR
1bfc : 49 08 __ EOR #$08
1bfe : 38 __ __ SEC
1bff : e9 08 __ SBC #$08
1c01 : a8 __ __ TAY
1c02 : a9 00 __ LDA #$00
1c04 : e9 00 __ SBC #$00
1c06 : aa __ __ TAX
1c07 : 98 __ __ TYA
1c08 : 18 __ __ CLC
1c09 : 69 b6 __ ADC #$b6
1c0b : 85 30 __ STA P3 
1c0d : 8a __ __ TXA
1c0e : 69 01 __ ADC #$01
1c10 : 85 31 __ STA P4 
1c12 : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1c15 : a9 00 __ LDA #$00
1c17 : 85 47 __ STA T1 + 0 
1c19 : 18 __ __ CLC
.l2:
1c1a : a5 47 __ LDA T1 + 0 
1c1c : 69 4f __ ADC #$4f
1c1e : 85 2d __ STA P0 
1c20 : a5 47 __ LDA T1 + 0 
1c22 : 0a __ __ ASL
1c23 : 65 47 __ ADC T1 + 0 
1c25 : 0a __ __ ASL
1c26 : 0a __ __ ASL
1c27 : 18 __ __ CLC
1c28 : 6d bc 48 ADC $48bc ; (FrameCount + 0)
1c2b : aa __ __ TAX
1c2c : ac bd 48 LDY $48bd ; (FrameCount + 1)
1c2f : bd 00 49 LDA $4900,x ; (sintab + 0)
1c32 : 10 01 __ BPL $1c35 ; (MoveSprites.s1008 + 0)
.s1007:
1c34 : 88 __ __ DEY
.s1008:
1c35 : 18 __ __ CLC
1c36 : 6d bc 48 ADC $48bc ; (FrameCount + 0)
1c39 : 85 48 __ STA T2 + 0 
1c3b : 90 01 __ BCC $1c3e ; (MoveSprites.s1009 + 0)
.s1006:
1c3d : c8 __ __ INY
.s1009:
1c3e : 84 49 __ STY T2 + 1 
1c40 : a5 47 __ LDA T1 + 0 
1c42 : 0a __ __ ASL
1c43 : 0a __ __ ASL
1c44 : 85 3b __ STA ACCU + 0 
1c46 : a9 00 __ LDA #$00
1c48 : 85 3c __ STA ACCU + 1 
1c4a : a9 80 __ LDA #$80
1c4c : 85 23 __ STA WORK + 0 
1c4e : a9 02 __ LDA #$02
1c50 : 85 24 __ STA WORK + 1 
1c52 : 20 9e 20 JSR $209e ; (divmod + 0)
1c55 : 18 __ __ CLC
1c56 : a5 25 __ LDA WORK + 2 
1c58 : 65 48 __ ADC T2 + 0 
1c5a : 85 2e __ STA P1 
1c5c : a5 26 __ LDA WORK + 3 
1c5e : 65 49 __ ADC T2 + 1 
1c60 : 85 2f __ STA P2 
1c62 : a5 47 __ LDA T1 + 0 
1c64 : 0a __ __ ASL
1c65 : 0a __ __ ASL
1c66 : 65 47 __ ADC T1 + 0 
1c68 : 85 48 __ STA T2 + 0 
1c6a : ad bc 48 LDA $48bc ; (FrameCount + 0)
1c6d : 38 __ __ SEC
1c6e : e9 40 __ SBC #$40
1c70 : 18 __ __ CLC
1c71 : 65 48 __ ADC T2 + 0 
1c73 : aa __ __ TAX
1c74 : bd 00 49 LDA $4900,x ; (sintab + 0)
1c77 : a8 __ __ TAY
1c78 : 29 80 __ AND #$80
1c7a : 10 02 __ BPL $1c7e ; (MoveSprites.s1009 + 64)
1c7c : a9 ff __ LDA #$ff
1c7e : 85 49 __ STA T2 + 1 
1c80 : a5 47 __ LDA T1 + 0 
1c82 : 0a __ __ ASL
1c83 : 0a __ __ ASL
1c84 : 0a __ __ ASL
1c85 : 85 3b __ STA ACCU + 0 
1c87 : ad bc 48 LDA $48bc ; (FrameCount + 0)
1c8a : 38 __ __ SEC
1c8b : e9 20 __ SBC #$20
1c8d : 18 __ __ CLC
1c8e : 65 3b __ ADC ACCU + 0 
1c90 : aa __ __ TAX
1c91 : bd 00 49 LDA $4900,x ; (sintab + 0)
1c94 : 4a __ __ LSR
1c95 : 4a __ __ LSR
1c96 : 4a __ __ LSR
1c97 : 4a __ __ LSR
1c98 : 49 08 __ EOR #$08
1c9a : 38 __ __ SEC
1c9b : e9 08 __ SBC #$08
1c9d : 85 4a __ STA T3 + 0 
1c9f : a9 00 __ LDA #$00
1ca1 : e9 00 __ SBC #$00
1ca3 : 85 4b __ STA T3 + 1 
1ca5 : a5 47 __ LDA T1 + 0 
1ca7 : 0a __ __ ASL
1ca8 : 65 47 __ ADC T1 + 0 
1caa : 85 3b __ STA ACCU + 0 
1cac : a5 47 __ LDA T1 + 0 
1cae : c9 1f __ CMP #$1f
1cb0 : f0 27 __ BEQ $1cd9 ; (MoveSprites.s5 + 0)
.s6:
1cb2 : 98 __ __ TYA
1cb3 : 18 __ __ CLC
1cb4 : 69 80 __ ADC #$80
1cb6 : 18 __ __ CLC
1cb7 : 65 4a __ ADC T3 + 0 
1cb9 : a8 __ __ TAY
1cba : a9 00 __ LDA #$00
1cbc : 65 4b __ ADC T3 + 1 
1cbe : aa __ __ TAX
1cbf : 98 __ __ TYA
1cc0 : 18 __ __ CLC
1cc1 : 65 3b __ ADC ACCU + 0 
1cc3 : 85 30 __ STA P3 
1cc5 : 90 01 __ BCC $1cc8 ; (MoveSprites.s1013 + 0)
.s1012:
1cc7 : e8 __ __ INX
.s1013:
1cc8 : 86 31 __ STX P4 
1cca : 20 8a 18 JSR $188a ; (vera_spr_move.s0 + 0)
1ccd : e6 47 __ INC T1 + 0 
1ccf : a5 47 __ LDA T1 + 0 
1cd1 : c9 20 __ CMP #$20
1cd3 : b0 03 __ BCS $1cd8 ; (MoveSprites.s1001 + 0)
1cd5 : 4c 1a 1c JMP $1c1a ; (MoveSprites.l2 + 0)
.s1001:
1cd8 : 60 __ __ RTS
.s5:
1cd9 : 98 __ __ TYA
1cda : 18 __ __ CLC
1cdb : 69 78 __ ADC #$78
1cdd : a8 __ __ TAY
1cde : a5 49 __ LDA T2 + 1 
1ce0 : 69 00 __ ADC #$00
1ce2 : aa __ __ TAX
1ce3 : 98 __ __ TYA
1ce4 : 18 __ __ CLC
1ce5 : 65 4a __ ADC T3 + 0 
1ce7 : a8 __ __ TAY
1ce8 : 8a __ __ TXA
1ce9 : 65 4b __ ADC T3 + 1 
1ceb : aa __ __ TAX
1cec : 98 __ __ TYA
1ced : 18 __ __ CLC
1cee : 65 3b __ ADC ACCU + 0 
1cf0 : 85 30 __ STA P3 
1cf2 : 90 01 __ BCC $1cf5 ; (MoveSprites.s1011 + 0)
.s1010:
1cf4 : e8 __ __ INX
.s1011:
1cf5 : 86 31 __ STX P4 
1cf7 : 4c 8a 18 JMP $188a ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4900 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4910 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4920 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4930 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4940 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4950 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4960 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4970 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4980 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4990 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
49a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
49b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
49c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
49d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
49e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
49f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
48bc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1cfa : a9 08 __ LDA #$08
1cfc : 8d 2c 9f STA $9f2c 
1cff : a5 33 __ LDA P6 ; (TuneSelection + 1)
1d01 : c5 35 __ CMP P8 ; (LastSong + 1)
1d03 : d0 0d __ BNE $1d12 ; (PlayZSM.s1 + 0)
.s1006:
1d05 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1d07 : c5 34 __ CMP P7 ; (LastSong + 0)
1d09 : d0 07 __ BNE $1d12 ; (PlayZSM.s1 + 0)
.s4:
1d0b : 20 49 1d JSR $1d49 ; (zsm_check.s0 + 0)
1d0e : 09 00 __ ORA #$00
1d10 : f0 2b __ BEQ $1d3d ; (PlayZSM.s1001 + 0)
.s1:
1d12 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1d14 : d0 27 __ BNE $1d3d ; (PlayZSM.s1001 + 0)
.s1005:
1d16 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1d18 : c9 01 __ CMP #$01
1d1a : d0 07 __ BNE $1d23 ; (PlayZSM.s1004 + 0)
.s6:
1d1c : a9 1e __ LDA #$1e
1d1e : a0 9c __ LDY #$9c
1d20 : 4c 42 1d JMP $1d42 ; (PlayZSM.s21 + 0)
.s1004:
1d23 : c9 02 __ CMP #$02
1d25 : d0 07 __ BNE $1d2e ; (PlayZSM.s1003 + 0)
.s8:
1d27 : a9 1e __ LDA #$1e
1d29 : a0 ba __ LDY #$ba
1d2b : 4c 42 1d JMP $1d42 ; (PlayZSM.s21 + 0)
.s1003:
1d2e : c9 03 __ CMP #$03
1d30 : d0 07 __ BNE $1d39 ; (PlayZSM.s1002 + 0)
.s10:
1d32 : a9 1f __ LDA #$1f
1d34 : a0 00 __ LDY #$00
1d36 : 4c 42 1d JMP $1d42 ; (PlayZSM.s21 + 0)
.s1002:
1d39 : c9 04 __ CMP #$04
1d3b : f0 01 __ BEQ $1d3e ; (PlayZSM.s12 + 0)
.s1001:
1d3d : 60 __ __ RTS
.s12:
1d3e : a9 1e __ LDA #$1e
1d40 : a0 df __ LDY #$df
.s21:
1d42 : 84 30 __ STY P3 
1d44 : 85 31 __ STA P4 
1d46 : 4c 4d 1d JMP $1d4d ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1d49 : ad 4d 21 LDA $214d ; (zsm_finished + 0)
.s1001:
1d4c : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1d4d : a9 01 __ LDA #$01
1d4f : 8d 4d 21 STA $214d ; (zsm_finished + 0)
1d52 : ad be 48 LDA $48be ; (zsm_reading + 0)
1d55 : f0 0a __ BEQ $1d61 ; (zsm_init.s3 + 0)
.s1:
1d57 : a9 02 __ LDA #$02
1d59 : 20 a2 1a JSR $1aa2 ; (krnio_close.s1000 + 0)
1d5c : a9 00 __ LDA #$00
1d5e : 8d be 48 STA $48be ; (zsm_reading + 0)
.s3:
1d61 : 20 ae 1d JSR $1dae ; (zsm_silence.s0 + 0)
1d64 : 20 c6 1d JSR $1dc6 ; (zsm_save_volume.s0 + 0)
1d67 : a9 00 __ LDA #$00
1d69 : 8d eb 48 STA $48eb ; (zsm_pos + 0)
1d6c : 8d ec 48 STA $48ec ; (zsm_pos + 1)
1d6f : 8d fd 48 STA $48fd ; (zsm_wpos + 0)
1d72 : 8d fe 48 STA $48fe ; (zsm_wpos + 1)
1d75 : 8d ea 48 STA $48ea ; (zsm_delay + 0)
1d78 : a5 30 __ LDA P3 ; (fname + 0)
1d7a : 85 2d __ STA P0 
1d7c : a5 31 __ LDA P4 ; (fname + 1)
1d7e : 85 2e __ STA P1 
1d80 : 20 e3 19 JSR $19e3 ; (krnio_setnam.s0 + 0)
1d83 : a9 02 __ LDA #$02
1d85 : 85 2d __ STA P0 
1d87 : 85 2f __ STA P2 
1d89 : a9 08 __ LDA #$08
1d8b : 85 2e __ STA P1 
1d8d : 20 f9 19 JSR $19f9 ; (krnio_open.s0 + 0)
1d90 : a5 3b __ LDA ACCU + 0 
1d92 : f0 19 __ BEQ $1dad ; (zsm_init.s1001 + 0)
.s4:
1d94 : a9 01 __ LDA #$01
1d96 : 8d be 48 STA $48be ; (zsm_reading + 0)
1d99 : 20 f8 1d JSR $1df8 ; (zsm_fill.s0 + 0)
1d9c : a9 10 __ LDA #$10
1d9e : 8d eb 48 STA $48eb ; (zsm_pos + 0)
1da1 : a9 00 __ LDA #$00
1da3 : 8d ec 48 STA $48ec ; (zsm_pos + 1)
1da6 : 8d 4d 21 STA $214d ; (zsm_finished + 0)
1da9 : a9 01 __ LDA #$01
1dab : 85 3b __ STA ACCU + 0 
.s1001:
1dad : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
48be : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
1dae : a9 00 __ LDA #$00
1db0 : 85 47 __ STA T0 + 0 
1db2 : a9 08 __ LDA #$08
1db4 : 85 2d __ STA P0 
1db6 : a9 00 __ LDA #$00
.l1006:
1db8 : 85 2e __ STA P1 
1dba : 20 e3 0d JSR $0de3 ; (sfx_put.l1 + 0)
1dbd : e6 47 __ INC T0 + 0 
1dbf : a5 47 __ LDA T0 + 0 
1dc1 : c9 08 __ CMP #$08
1dc3 : 90 f3 __ BCC $1db8 ; (zsm_silence.l1006 + 0)
.s1001:
1dc5 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1dc6 : a0 00 __ LDY #$00
1dc8 : 84 3c __ STY ACCU + 1 
1dca : a2 02 __ LDX #$02
1dcc : 18 __ __ CLC
.l1006:
1dcd : 8a __ __ TXA
1dce : 09 c0 __ ORA #$c0
1dd0 : 8d 20 9f STA $9f20 
1dd3 : a5 3c __ LDA ACCU + 1 
1dd5 : 09 f9 __ ORA #$f9
1dd7 : 8d 21 9f STA $9f21 
1dda : a9 01 __ LDA #$01
1ddc : 8d 22 9f STA $9f22 
1ddf : ad 23 9f LDA $9f23 
1de2 : 99 9b 57 STA $579b,y ; (vera_volumes + 0)
1de5 : a9 00 __ LDA #$00
1de7 : 8d 23 9f STA $9f23 
1dea : 8a __ __ TXA
1deb : 69 04 __ ADC #$04
1ded : aa __ __ TAX
1dee : 90 02 __ BCC $1df2 ; (zsm_save_volume.s1009 + 0)
.s1008:
1df0 : e6 3c __ INC ACCU + 1 
.s1009:
1df2 : c8 __ __ INY
1df3 : c0 10 __ CPY #$10
1df5 : 90 d6 __ BCC $1dcd ; (zsm_save_volume.l1006 + 0)
.s1001:
1df7 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
579b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
48fd : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
1df8 : ad be 48 LDA $48be ; (zsm_reading + 0)
1dfb : f0 20 __ BEQ $1e1d ; (zsm_fill.s1 + 0)
.s2:
1dfd : ad ec 48 LDA $48ec ; (zsm_pos + 1)
1e00 : 18 __ __ CLC
1e01 : 69 04 __ ADC #$04
1e03 : cd fe 48 CMP $48fe ; (zsm_wpos + 1)
1e06 : d0 0c __ BNE $1e14 ; (zsm_fill.s6 + 0)
.s1006:
1e08 : ad fd 48 LDA $48fd ; (zsm_wpos + 0)
1e0b : cd eb 48 CMP $48eb ; (zsm_pos + 0)
1e0e : d0 04 __ BNE $1e14 ; (zsm_fill.s6 + 0)
.s5:
1e10 : a9 00 __ LDA #$00
1e12 : f0 0b __ BEQ $1e1f ; (zsm_fill.s1008 + 0)
.s6:
1e14 : a9 02 __ LDA #$02
1e16 : 20 78 1a JSR $1a78 ; (krnio_chkin.s1000 + 0)
1e19 : a5 3b __ LDA ACCU + 0 
1e1b : d0 07 __ BNE $1e24 ; (zsm_fill.s9 + 0)
.s1:
1e1d : a9 ff __ LDA #$ff
.s1008:
1e1f : 85 3b __ STA ACCU + 0 
.s1001:
1e21 : 85 3c __ STA ACCU + 1 
1e23 : 60 __ __ RTS
.s9:
1e24 : a9 00 __ LDA #$00
1e26 : 85 47 __ STA T1 + 0 
1e28 : 85 48 __ STA T1 + 1 
1e2a : ad ec 48 LDA $48ec ; (zsm_pos + 1)
1e2d : 18 __ __ CLC
1e2e : 69 04 __ ADC #$04
1e30 : cd fe 48 CMP $48fe ; (zsm_wpos + 1)
1e33 : d0 08 __ BNE $1e3d ; (zsm_fill.l13 + 0)
.s1002:
1e35 : ad fd 48 LDA $48fd ; (zsm_wpos + 0)
1e38 : cd eb 48 CMP $48eb ; (zsm_pos + 0)
1e3b : f0 49 __ BEQ $1e86 ; (zsm_fill.s38 + 0)
.l13:
1e3d : 20 8a 1a JSR $1a8a ; (krnio_chrin.s0 + 0)
1e40 : ad fd 48 LDA $48fd ; (zsm_wpos + 0)
1e43 : aa __ __ TAX
1e44 : 18 __ __ CLC
1e45 : 69 01 __ ADC #$01
1e47 : 8d fd 48 STA $48fd ; (zsm_wpos + 0)
1e4a : ad fe 48 LDA $48fe ; (zsm_wpos + 1)
1e4d : a8 __ __ TAY
1e4e : 69 00 __ ADC #$00
1e50 : 8d fe 48 STA $48fe ; (zsm_wpos + 1)
1e53 : 8a __ __ TXA
1e54 : 18 __ __ CLC
1e55 : 69 be __ ADC #$be
1e57 : 85 49 __ STA T3 + 0 
1e59 : 98 __ __ TYA
1e5a : 29 03 __ AND #$03
1e5c : 69 5a __ ADC #$5a
1e5e : 85 4a __ STA T3 + 1 
1e60 : a5 3b __ LDA ACCU + 0 
1e62 : a0 00 __ LDY #$00
1e64 : 91 49 __ STA (T3 + 0),y 
1e66 : e6 47 __ INC T1 + 0 
1e68 : d0 02 __ BNE $1e6c ; (zsm_fill.s1010 + 0)
.s1009:
1e6a : e6 48 __ INC T1 + 1 
.s1010:
1e6c : 20 94 1a JSR $1a94 ; (krnio_status.s0 + 0)
1e6f : a5 3b __ LDA ACCU + 0 
1e71 : d0 0e __ BNE $1e81 ; (zsm_fill.s15 + 0)
.s12:
1e73 : ad ec 48 LDA $48ec ; (zsm_pos + 1)
1e76 : 18 __ __ CLC
1e77 : 69 04 __ ADC #$04
1e79 : cd fe 48 CMP $48fe ; (zsm_wpos + 1)
1e7c : d0 bf __ BNE $1e3d ; (zsm_fill.l13 + 0)
1e7e : 4c 35 1e JMP $1e35 ; (zsm_fill.s1002 + 0)
.s15:
1e81 : a9 00 __ LDA #$00
1e83 : 8d be 48 STA $48be ; (zsm_reading + 0)
.s38:
1e86 : 20 9e 1a JSR $1a9e ; (krnio_clrchn.s0 + 0)
1e89 : ad be 48 LDA $48be ; (zsm_reading + 0)
1e8c : d0 05 __ BNE $1e93 ; (zsm_fill.s21 + 0)
.s19:
1e8e : a9 02 __ LDA #$02
1e90 : 20 a2 1a JSR $1aa2 ; (krnio_close.s1000 + 0)
.s21:
1e93 : a5 47 __ LDA T1 + 0 
1e95 : 85 3b __ STA ACCU + 0 
1e97 : a5 48 __ LDA T1 + 1 
1e99 : 4c 21 1e JMP $1e21 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
1e9c : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1eac : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1eba : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1eca : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1eda : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
1f00 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1f10 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
1f20 : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
1edf : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
1eef : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
LastSelectedSong:
48bf : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
48c0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
48c2 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
48d2 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1f27 : a9 10 __ LDA #$10
1f29 : 85 30 __ STA P3 
1f2b : a9 00 __ LDA #$00
1f2d : 85 31 __ STA P4 
1f2f : a5 32 __ LDA P5 ; (Palette + 0)
1f31 : 85 2e __ STA P1 
1f33 : 85 47 __ STA T0 + 0 
1f35 : a5 33 __ LDA P6 ; (Palette + 1)
1f37 : 85 2f __ STA P2 
1f39 : 85 48 __ STA T0 + 1 
1f3b : a5 34 __ LDA P7 ; (index + 0)
1f3d : 85 2d __ STA P0 
1f3f : ad fc 9e LDA $9efc ; (sstack + 0)
1f42 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1f44 : 0a __ __ ASL
1f45 : 85 49 __ STA T3 + 0 
1f47 : ad fd 9e LDA $9efd ; (sstack + 1)
1f4a : 2a __ __ ROL
1f4b : 18 __ __ CLC
1f4c : 65 33 __ ADC P6 ; (Palette + 1)
1f4e : 85 4a __ STA T3 + 1 
1f50 : a4 32 __ LDY P5 ; (Palette + 0)
1f52 : b1 49 __ LDA (T3 + 0),y 
1f54 : aa __ __ TAX
1f55 : c8 __ __ INY
1f56 : b1 49 __ LDA (T3 + 0),y 
1f58 : 86 49 __ STX T3 + 0 
1f5a : 85 4a __ STA T3 + 1 
1f5c : a9 00 __ LDA #$00
1f5e : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1f60 : ad fe 9e LDA $9efe ; (sstack + 2)
1f63 : 85 4b __ STA T5 + 0 
1f65 : 38 __ __ SEC
1f66 : e9 01 __ SBC #$01
1f68 : 85 4d __ STA T6 + 0 
1f6a : ad ff 9e LDA $9eff ; (sstack + 3)
1f6d : 85 4c __ STA T5 + 1 
1f6f : e9 00 __ SBC #$00
1f71 : 85 4e __ STA T6 + 1 
1f73 : d0 06 __ BNE $1f7b ; (SetPaletteIndex.s5 + 0)
.s1004:
1f75 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1f77 : c5 4d __ CMP T6 + 0 
1f79 : b0 38 __ BCS $1fb3 ; (SetPaletteIndex.s4 + 0)
.s5:
1f7b : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1f7d : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1f7f : 18 __ __ CLC
1f80 : a5 32 __ LDA P5 ; (Palette + 0)
1f82 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1f84 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1f86 : a5 33 __ LDA P6 ; (Palette + 1)
1f88 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1f8a : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1f8c : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1f8f : a0 02 __ LDY #$02
1f91 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1f93 : a0 00 __ LDY #$00
1f95 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1f97 : a0 03 __ LDY #$03
1f99 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1f9b : a0 01 __ LDY #$01
1f9d : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1f9f : 18 __ __ CLC
1fa0 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1fa2 : 69 02 __ ADC #$02
1fa4 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1fa6 : 90 02 __ BCC $1faa ; (SetPaletteIndex.s1008 + 0)
.s1007:
1fa8 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1faa : e8 __ __ INX
1fab : a5 4e __ LDA T6 + 1 
1fad : d0 e0 __ BNE $1f8f ; (SetPaletteIndex.l2 + 0)
.s1002:
1faf : e4 4d __ CPX T6 + 0 
1fb1 : 90 dc __ BCC $1f8f ; (SetPaletteIndex.l2 + 0)
.s4:
1fb3 : a5 4b __ LDA T5 + 0 
1fb5 : 0a __ __ ASL
1fb6 : aa __ __ TAX
1fb7 : a5 4c __ LDA T5 + 1 
1fb9 : 2a __ __ ROL
1fba : a8 __ __ TAY
1fbb : 8a __ __ TXA
1fbc : 38 __ __ SEC
1fbd : e9 02 __ SBC #$02
1fbf : b0 01 __ BCS $1fc2 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1fc1 : 88 __ __ DEY
.s1010:
1fc2 : 18 __ __ CLC
1fc3 : 65 47 __ ADC T0 + 0 
1fc5 : 85 47 __ STA T0 + 0 
1fc7 : 98 __ __ TYA
1fc8 : 65 48 __ ADC T0 + 1 
1fca : 85 48 __ STA T0 + 1 
1fcc : a5 49 __ LDA T3 + 0 
1fce : a0 00 __ LDY #$00
1fd0 : 91 47 __ STA (T0 + 0),y 
1fd2 : a5 4a __ LDA T3 + 1 
1fd4 : c8 __ __ INY
1fd5 : 91 47 __ STA (T0 + 0),y 
1fd7 : 4c 00 19 JMP $1900 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
48e2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4a00 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4a10 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
48e4 : __ __ __ BYT 04                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
1fda : ad 25 9f LDA $9f25 
1fdd : 29 fe __ AND #$fe
1fdf : 8d 25 9f STA $9f25 
1fe2 : a9 00 __ LDA #$00
1fe4 : 8d 20 9f STA $9f20 
1fe7 : a9 b0 __ LDA #$b0
1fe9 : 8d 21 9f STA $9f21 
1fec : a9 11 __ LDA #$11
1fee : 8d 22 9f STA $9f22 
1ff1 : a2 80 __ LDX #$80
1ff3 : a9 00 __ LDA #$00
.l1002:
1ff5 : 8d 23 9f STA $9f23 
1ff8 : 8d 23 9f STA $9f23 
1ffb : ca __ __ DEX
1ffc : d0 f7 __ BNE $1ff5 ; (ResetChars.l1002 + 0)
.s1001:
1ffe : 60 __ __ RTS
--------------------------------------------------------------------
off1:
48e5 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
1fff : a5 31 __ LDA P4 ; (Input + 0)
2001 : c9 20 __ CMP #$20
2003 : d0 1c __ BNE $2021 ; (Control.s1007 + 0)
.s1:
2005 : a5 30 __ LDA P3 ; (playing + 0)
2007 : d0 0a __ BNE $2013 ; (Control.s4 + 0)
.s5:
2009 : a9 01 __ LDA #$01
200b : 20 fb 1e JSR $1efb ; (zsm_irq_play.s0 + 0)
200e : a9 01 __ LDA #$01
.s1001:
2010 : 85 3b __ STA ACCU + 0 
2012 : 60 __ __ RTS
.s4:
2013 : a9 00 __ LDA #$00
2015 : cd e7 48 CMP $48e7 ; (paused + 0)
2018 : 2a __ __ ROL
2019 : 8d e7 48 STA $48e7 ; (paused + 0)
201c : 85 2f __ STA P2 
201e : 20 26 20 JSR $2026 ; (zsm_pause.s0 + 0)
.s1007:
2021 : a5 30 __ LDA P3 ; (playing + 0)
2023 : 4c 10 20 JMP $2010 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
48e7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
2026 : a5 2f __ LDA P2 ; (pause + 0)
2028 : d0 0e __ BNE $2038 ; (zsm_pause.s4 + 0)
.s8:
202a : ad 4e 21 LDA $214e ; (zsm_paused + 0)
202d : f0 08 __ BEQ $2037 ; (zsm_pause.s1001 + 0)
.s5:
202f : 20 48 20 JSR $2048 ; (zsm_restore_volume.s0 + 0)
2032 : a9 00 __ LDA #$00
2034 : 8d 4e 21 STA $214e ; (zsm_paused + 0)
.s1001:
2037 : 60 __ __ RTS
.s4:
2038 : ad 4e 21 LDA $214e ; (zsm_paused + 0)
203b : d0 fa __ BNE $2037 ; (zsm_pause.s1001 + 0)
.s1:
203d : a9 01 __ LDA #$01
203f : 8d 4e 21 STA $214e ; (zsm_paused + 0)
2042 : 20 ae 1d JSR $1dae ; (zsm_silence.s0 + 0)
2045 : 4c c6 1d JMP $1dc6 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
2048 : a0 00 __ LDY #$00
204a : 84 3c __ STY ACCU + 1 
204c : a2 02 __ LDX #$02
204e : 18 __ __ CLC
.l1006:
204f : 8a __ __ TXA
2050 : 09 c0 __ ORA #$c0
2052 : 8d 20 9f STA $9f20 
2055 : a5 3c __ LDA ACCU + 1 
2057 : 09 f9 __ ORA #$f9
2059 : 8d 21 9f STA $9f21 
205c : a9 01 __ LDA #$01
205e : 8d 22 9f STA $9f22 
2061 : b9 9b 57 LDA $579b,y ; (vera_volumes + 0)
2064 : 8d 23 9f STA $9f23 
2067 : 8a __ __ TXA
2068 : 69 04 __ ADC #$04
206a : aa __ __ TAX
206b : 90 02 __ BCC $206f ; (zsm_restore_volume.s1009 + 0)
.s1008:
206d : e6 3c __ INC ACCU + 1 
.s1009:
206f : c8 __ __ INY
2070 : c0 10 __ CPY #$10
2072 : 90 db __ BCC $204f ; (zsm_restore_volume.l1006 + 0)
.s1001:
2074 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1efb : 8d 4c 21 STA $214c ; (zsm_playing + 0)
.s1001:
1efe : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4a20 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4a30 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4a40 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4a50 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4a60 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4a70 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4a80 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4a90 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
4aa0 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
4ab0 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
4ac0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
4ad0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
4ae0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
4af0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
4b00 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
4b10 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4b20 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4b30 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4b40 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4b50 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4b60 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4b70 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4b80 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4b90 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
4ba0 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
4bb0 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
4bc0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
4bd0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4be0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4bf0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4c00 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4c10 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4c20 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4c30 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4c40 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4c50 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4c60 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4c70 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4c80 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4c90 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
4ca0 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
4cb0 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4cc0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4cd0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4ce0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4cf0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4d00 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4d10 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4d20 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4d30 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4d40 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4d50 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4d60 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4d70 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4d80 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4d90 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
4da0 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
4db0 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4dc0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4dd0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4de0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4df0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4e00 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4e10 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4e20 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4e30 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4e40 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4e50 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4e60 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4e70 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4e80 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4e90 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4ea0 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4eb0 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4ec0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4ed0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4ee0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4ef0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4f00 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4f10 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4f20 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4f30 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4f40 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4f50 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4f60 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4f70 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4f80 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4f90 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4fa0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fb0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fc0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fd0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fe0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ff0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5000 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5010 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5020 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5030 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
503e : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
504e : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
505e : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
506e : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
507e : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
508e : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
509e : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
50ae : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
50be : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
50ce : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
50de : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
50ee : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
50fe : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
510e : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
511e : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
512e : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
513e : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
514e : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
515e : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
516e : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
517e : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
518e : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
519e : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
51ae : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
51be : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
51ce : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
51de : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
51ee : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
51fe : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
520e : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
521e : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
522e : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
523e : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
524e : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
525e : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
526e : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
527e : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
528e : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
529e : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
52ae : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
52be : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
52ce : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
52de : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
52ee : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
52fe : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
530e : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
531e : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
532e : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
533e : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
534e : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
535e : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
536e : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
537e : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
538e : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
539e : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
53ae : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
53be : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
53ce : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
53de : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
53ee : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
53fe : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
540e : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
541e : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
542e : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
543e : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
544e : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
545e : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
546e : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
547e : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
548e : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
549e : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
54ae : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
54be : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
54ce : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
54de : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
54ee : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
54fe : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
550e : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
551e : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
552e : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
553e : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
554e : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
555e : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
556e : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
557e : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
558e : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
559e : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
55ae : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
55be : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
55ce : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
55de : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
55ee : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
55fe : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
560e : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
561e : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
562e : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
563e : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
564e : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
565e : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
566e : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
567e : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
568e : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
569e : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
56ae : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
56be : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
56ce : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
56de : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
56ee : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
56fe : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
570e : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
571e : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
572e : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
573e : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
574e : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
575e : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
576e : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
577e : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
578e : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5800 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5810 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5820 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5830 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5840 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5850 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5860 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5870 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5880 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5890 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
58a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
58b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
58c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5900 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5910 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5920 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5930 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5940 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5950 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5960 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5970 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5980 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5990 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
59a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
59b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
59c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
Song4:
5a00 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5a10 : __ __ __ BYT 0d 05 3a 20 2d 20 22 07 0f 02 13 0d 01 03 0b 05 : ..: - ".........
5a20 : __ __ __ BYT 04 22 20 2d 20 01 12 14 09 13 14 3a 20 22 06 01 : ." - ......: "..
5a30 : __ __ __ BYT 04 05 22 20 2d 20 0c 05 0e 07 14 08 3a 20 33 3a : .." - ......: 3:
5a40 : __ __ __ BYT 32 33 20 2d 20 03 0f 0d 0d 05 0e 14 3a 20 09 20 : 23 - .......: . 
5a50 : __ __ __ BYT 02 05 14 20 19 0f 15 20 04 09 04 0e 27 14 20 14 : ... ... ....'. .
5a60 : __ __ __ BYT 08 09 0e 0b 20 14 08 05 20 17 01 12 0d 14 08 20 : .... ... ...... 
5a70 : __ __ __ BYT 0f 06 20 16 09 0e 19 0c 20 03 0f 15 0c 04 20 02 : .. ..... ..... .
5a80 : __ __ __ BYT 05 20 12 05 10 0c 09 03 01 14 05 04 20 09 0e 20 : . .......... .. 
5a90 : __ __ __ BYT 01 0e 19 14 08 09 0e 07 20 04 09 07 09 14 01 0c : ........ .......
5aa0 : __ __ __ BYT 2c 20 02 15 14 20 08 05 12 05 20 17 05 20 01 12 : , ... .... .. ..
5ab0 : __ __ __ BYT 05 20 3a 33 20 3d 20 3d 20 2d 20 2d 20 00       : . :3 = = - - .
--------------------------------------------------------------------
frame_wait:
.l1:
2075 : ad 26 9f LDA $9f26 
2078 : 0a __ __ ASL
2079 : 30 fa __ BMI $2075 ; (frame_wait.l1 + 0)
.l4:
207b : ad 26 9f LDA $9f26 
207e : 0a __ __ ASL
207f : 10 fa __ BPL $207b ; (frame_wait.l4 + 0)
.s1001:
2081 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
2082 : 38 __ __ SEC
2083 : a9 00 __ LDA #$00
2085 : e5 3b __ SBC ACCU + 0 
2087 : 85 3b __ STA ACCU + 0 
2089 : a9 00 __ LDA #$00
208b : e5 3c __ SBC ACCU + 1 
208d : 85 3c __ STA ACCU + 1 
208f : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
2090 : 38 __ __ SEC
2091 : a9 00 __ LDA #$00
2093 : e5 23 __ SBC WORK + 0 
2095 : 85 23 __ STA WORK + 0 
2097 : a9 00 __ LDA #$00
2099 : e5 24 __ SBC WORK + 1 
209b : 85 24 __ STA WORK + 1 
209d : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
209e : a5 3c __ LDA ACCU + 1 
20a0 : d0 31 __ BNE $20d3 ; (divmod + 53)
20a2 : a5 24 __ LDA WORK + 1 
20a4 : d0 1e __ BNE $20c4 ; (divmod + 38)
20a6 : 85 26 __ STA WORK + 3 
20a8 : a2 04 __ LDX #$04
20aa : 06 3b __ ASL ACCU + 0 
20ac : 2a __ __ ROL
20ad : c5 23 __ CMP WORK + 0 
20af : 90 02 __ BCC $20b3 ; (divmod + 21)
20b1 : e5 23 __ SBC WORK + 0 
20b3 : 26 3b __ ROL ACCU + 0 
20b5 : 2a __ __ ROL
20b6 : c5 23 __ CMP WORK + 0 
20b8 : 90 02 __ BCC $20bc ; (divmod + 30)
20ba : e5 23 __ SBC WORK + 0 
20bc : 26 3b __ ROL ACCU + 0 
20be : ca __ __ DEX
20bf : d0 eb __ BNE $20ac ; (divmod + 14)
20c1 : 85 25 __ STA WORK + 2 
20c3 : 60 __ __ RTS
20c4 : a5 3b __ LDA ACCU + 0 
20c6 : 85 25 __ STA WORK + 2 
20c8 : a5 3c __ LDA ACCU + 1 
20ca : 85 26 __ STA WORK + 3 
20cc : a9 00 __ LDA #$00
20ce : 85 3b __ STA ACCU + 0 
20d0 : 85 3c __ STA ACCU + 1 
20d2 : 60 __ __ RTS
20d3 : a5 24 __ LDA WORK + 1 
20d5 : d0 1f __ BNE $20f6 ; (divmod + 88)
20d7 : a5 23 __ LDA WORK + 0 
20d9 : 30 1b __ BMI $20f6 ; (divmod + 88)
20db : a9 00 __ LDA #$00
20dd : 85 26 __ STA WORK + 3 
20df : a2 10 __ LDX #$10
20e1 : 06 3b __ ASL ACCU + 0 
20e3 : 26 3c __ ROL ACCU + 1 
20e5 : 2a __ __ ROL
20e6 : c5 23 __ CMP WORK + 0 
20e8 : 90 02 __ BCC $20ec ; (divmod + 78)
20ea : e5 23 __ SBC WORK + 0 
20ec : 26 3b __ ROL ACCU + 0 
20ee : 26 3c __ ROL ACCU + 1 
20f0 : ca __ __ DEX
20f1 : d0 f2 __ BNE $20e5 ; (divmod + 71)
20f3 : 85 25 __ STA WORK + 2 
20f5 : 60 __ __ RTS
20f6 : a9 00 __ LDA #$00
20f8 : 85 25 __ STA WORK + 2 
20fa : 85 26 __ STA WORK + 3 
20fc : 84 22 __ STY $22 
20fe : a0 10 __ LDY #$10
2100 : 18 __ __ CLC
2101 : 26 3b __ ROL ACCU + 0 
2103 : 26 3c __ ROL ACCU + 1 
2105 : 26 25 __ ROL WORK + 2 
2107 : 26 26 __ ROL WORK + 3 
2109 : 38 __ __ SEC
210a : a5 25 __ LDA WORK + 2 
210c : e5 23 __ SBC WORK + 0 
210e : aa __ __ TAX
210f : a5 26 __ LDA WORK + 3 
2111 : e5 24 __ SBC WORK + 1 
2113 : 90 04 __ BCC $2119 ; (divmod + 123)
2115 : 86 25 __ STX WORK + 2 
2117 : 85 26 __ STA WORK + 3 
2119 : 88 __ __ DEY
211a : d0 e5 __ BNE $2101 ; (divmod + 99)
211c : 26 3b __ ROL ACCU + 0 
211e : 26 3c __ ROL ACCU + 1 
2120 : a4 22 __ LDY $22 
2122 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
2123 : 24 3c __ BIT ACCU + 1 
2125 : 10 0d __ BPL $2134 ; (mods16 + 17)
2127 : 20 82 20 JSR $2082 ; (negaccu + 0)
212a : 24 24 __ BIT WORK + 1 
212c : 10 0d __ BPL $213b ; (mods16 + 24)
212e : 20 90 20 JSR $2090 ; (negtmp + 0)
2131 : 4c 9e 20 JMP $209e ; (divmod + 0)
2134 : 24 24 __ BIT WORK + 1 
2136 : 10 f9 __ BPL $2131 ; (mods16 + 14)
2138 : 20 90 20 JSR $2090 ; (negtmp + 0)
213b : 20 9e 20 JSR $209e ; (divmod + 0)
213e : 38 __ __ SEC
213f : a9 00 __ LDA #$00
2141 : e5 25 __ SBC WORK + 2 
2143 : 85 25 __ STA WORK + 2 
2145 : a9 00 __ LDA #$00
2147 : e5 26 __ SBC WORK + 3 
2149 : 85 26 __ STA WORK + 3 
214b : 60 __ __ RTS
