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
080e : 8e df 20 STX $20df ; (spentry + 0)
0811 : a9 c4 __ LDA #$c4
0813 : 85 39 __ STA IP + 0 
0815 : a9 59 __ LDA #$59
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 5e __ LDA #$5e
081c : e9 59 __ SBC #$59
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
0832 : e9 c4 __ SBC #$c4
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
20df : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 de 0b JSR $0bde ; (zsm_irq_init.s0 + 0)
0883 : 20 b7 0d JSR $0db7 ; (ClearVERAScreen.s0 + 0)
0886 : 20 fa 0d JSR $0dfa ; (SetUpSprites.s0 + 0)
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
08e2 : a9 2a __ LDA #$2a
08e4 : 85 35 __ STA P8 
08e6 : a9 48 __ LDA #$48
08e8 : 85 36 __ STA P9 
08ea : 20 04 19 JSR $1904 ; (SetPaletteColours.s0 + 0)
08ed : a9 00 __ LDA #$00
08ef : 85 52 __ STA T1 + 0 
08f1 : 85 53 __ STA T1 + 1 
08f3 : 85 54 __ STA T2 + 0 
08f5 : 85 55 __ STA T3 + 0 
08f7 : 85 56 __ STA T4 + 0 
.l3:
08f9 : 20 83 1a JSR $1a83 ; (getchx.s0 + 0)
08fc : a5 3b __ LDA ACCU + 0 
08fe : 85 57 __ STA T5 + 0 
0900 : a9 30 __ LDA #$30
0902 : 8d 2c 9f STA $9f2c 
0905 : ee fe 26 INC $26fe ; (p + 0)
0908 : d0 03 __ BNE $090d ; (main.s1021 + 0)
.s1020:
090a : ee ff 26 INC $26ff ; (p + 1)
.s1021:
090d : ad 4a 48 LDA $484a ; (Phase + 0)
0910 : 18 __ __ CLC
0911 : 69 01 __ ADC #$01
0913 : 85 32 __ STA P5 
0915 : 8d 4a 48 STA $484a ; (Phase + 0)
0918 : ad 4b 48 LDA $484b ; (Phase + 1)
091b : 69 00 __ ADC #$00
091d : 85 33 __ STA P6 
091f : 8d 4b 48 STA $484b ; (Phase + 1)
0922 : ad 4c 48 LDA $484c ; (Phase2 + 0)
0925 : 18 __ __ CLC
0926 : 69 01 __ ADC #$01
0928 : 85 34 __ STA P7 
092a : 8d 4c 48 STA $484c ; (Phase2 + 0)
092d : ad 4d 48 LDA $484d ; (Phase2 + 1)
0930 : 69 00 __ ADC #$00
0932 : 85 35 __ STA P8 
0934 : 8d 4d 48 STA $484d ; (Phase2 + 1)
0937 : ad 4e 48 LDA $484e ; (Phase3 + 0)
093a : 18 __ __ CLC
093b : 69 01 __ ADC #$01
093d : 85 36 __ STA P9 
093f : 8d 4e 48 STA $484e ; (Phase3 + 0)
0942 : ad 4f 48 LDA $484f ; (Phase3 + 1)
0945 : 69 00 __ ADC #$00
0947 : 85 37 __ STA P10 
0949 : 8d 4f 48 STA $484f ; (Phase3 + 1)
094c : 20 be 1a JSR $1abe ; (MoveSprites.s0 + 0)
094f : a5 55 __ LDA T3 + 0 
0951 : c9 01 __ CMP #$01
0953 : d0 03 __ BNE $0958 ; (main.s6 + 0)
0955 : 4c b7 0b JMP $0bb7 ; (main.s5 + 0)
.s6:
0958 : a9 00 __ LDA #$00
095a : 8d 54 48 STA $4854 ; (PalTimer + 0)
095d : 8d 55 48 STA $4855 ; (PalTimer + 1)
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
0978 : a9 56 __ LDA #$56
097a : 85 35 __ STA P8 
097c : a9 48 __ LDA #$48
097e : 85 36 __ STA P9 
0980 : 20 04 19 JSR $1904 ; (SetPaletteColours.s0 + 0)
.s61:
0983 : e6 56 __ INC T4 + 0 
0985 : a9 02 __ LDA #$02
0987 : c5 56 __ CMP T4 + 0 
0989 : b0 2d __ BCS $09b8 ; (main.s62 + 0)
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
09a9 : a9 c5 __ LDA #$c5
09ab : 85 32 __ STA P5 
09ad : a9 26 __ LDA #$26
09af : 85 33 __ STA P6 
09b1 : 20 b6 1e JSR $1eb6 ; (SetPaletteIndex.s0 + 0)
09b4 : a9 00 __ LDA #$00
09b6 : 85 56 __ STA T4 + 0 
.s62:
09b8 : ad 55 48 LDA $4855 ; (PalTimer + 1)
09bb : 30 5f __ BMI $0a1c ; (main.s13 + 0)
.s1014:
09bd : d0 07 __ BNE $09c6 ; (main.s11 + 0)
.s1013:
09bf : a9 03 __ LDA #$03
09c1 : cd 54 48 CMP $4854 ; (PalTimer + 0)
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
09e2 : ee 76 48 INC $4876 ; (PalIndex + 0)
09e5 : d0 03 __ BNE $09ea ; (main.s1025 + 0)
.s1024:
09e7 : ee 77 48 INC $4877 ; (PalIndex + 1)
.s1025:
09ea : a9 e5 __ LDA #$e5
09ec : 85 32 __ STA P5 
09ee : a9 26 __ LDA #$26
09f0 : 85 33 __ STA P6 
09f2 : 20 b6 1e JSR $1eb6 ; (SetPaletteIndex.s0 + 0)
09f5 : a9 50 __ LDA #$50
09f7 : 85 34 __ STA P7 
09f9 : a9 00 __ LDA #$00
09fb : 8d fc 9e STA $9efc ; (sstack + 0)
09fe : 8d fd 9e STA $9efd ; (sstack + 1)
0a01 : 8d ff 9e STA $9eff ; (sstack + 3)
0a04 : a9 10 __ LDA #$10
0a06 : 8d fe 9e STA $9efe ; (sstack + 2)
0a09 : a9 78 __ LDA #$78
0a0b : 85 32 __ STA P5 
0a0d : a9 48 __ LDA #$48
0a0f : 85 33 __ STA P6 
0a11 : 20 b6 1e JSR $1eb6 ; (SetPaletteIndex.s0 + 0)
0a14 : a9 00 __ LDA #$00
0a16 : 8d 54 48 STA $4854 ; (PalTimer + 0)
0a19 : 8d 55 48 STA $4855 ; (PalTimer + 1)
.s13:
0a1c : a9 03 __ LDA #$03
0a1e : 8d 2c 9f STA $9f2c 
0a21 : a5 57 __ LDA T5 + 0 
0a23 : c9 44 __ CMP #$44
0a25 : d0 0c __ BNE $0a33 ; (main.s15 + 0)
.s17:
0a27 : a5 54 __ LDA T2 + 0 
0a29 : cd 98 48 CMP $4898 ; (MaxSong + 0)
0a2c : b0 03 __ BCS $0a31 ; (main.s1019 + 0)
0a2e : 4c b2 0b JMP $0bb2 ; (main.s14 + 0)
.s1019:
0a31 : a5 57 __ LDA T5 + 0 
.s15:
0a33 : c9 41 __ CMP #$41
0a35 : d0 23 __ BNE $0a5a ; (main.s16 + 0)
.s1006:
0a37 : a9 01 __ LDA #$01
0a39 : c5 54 __ CMP T2 + 0 
0a3b : b0 1d __ BCS $0a5a ; (main.s16 + 0)
.s18:
0a3d : c6 54 __ DEC T2 + 0 
.s74:
0a3f : 20 69 1f JSR $1f69 ; (ResetChars.s0 + 0)
0a42 : a9 00 __ LDA #$00
0a44 : 8d 99 48 STA $4899 ; (off1 + 0)
0a47 : 8d 9a 48 STA $489a ; (off1 + 1)
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
0a62 : 20 8e 1f JSR $1f8e ; (Control.s0 + 0)
0a65 : a5 3b __ LDA ACCU + 0 
0a67 : 85 55 __ STA T3 + 0 
0a69 : 38 __ __ SEC
0a6a : a5 52 __ LDA T1 + 0 
0a6c : e9 80 __ SBC #$80
0a6e : 8d 37 9f STA $9f37 
0a71 : a5 53 __ LDA T1 + 1 
0a73 : e9 02 __ SBC #$02
0a75 : 8d 38 9f STA $9f38 
0a78 : ad 50 48 LDA $4850 ; (FrameCount + 0)
0a7b : 85 3b __ STA ACCU + 0 
0a7d : ad 51 48 LDA $4851 ; (FrameCount + 1)
0a80 : 85 3c __ STA ACCU + 1 
0a82 : a9 08 __ LDA #$08
0a84 : 85 23 __ STA WORK + 0 
0a86 : a9 00 __ LDA #$00
0a88 : 85 24 __ STA WORK + 1 
0a8a : 20 b6 20 JSR $20b6 ; (mods16 + 0)
0a8d : a5 26 __ LDA WORK + 3 
0a8f : f0 03 __ BEQ $0a94 ; (main.s1005 + 0)
0a91 : 4c 83 0b JMP $0b83 ; (main.s24 + 0)
.s1005:
0a94 : a5 25 __ LDA WORK + 2 
0a96 : c9 01 __ CMP #$01
0a98 : f0 03 __ BEQ $0a9d ; (main.s22 + 0)
0a9a : 4c 83 0b JMP $0b83 ; (main.s24 + 0)
.s22:
0a9d : ad 99 48 LDA $4899 ; (off1 + 0)
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
0abc : d0 20 __ BNE $0ade ; (main.s1004 + 0)
.s27:
0abe : a5 57 __ LDA T5 + 0 
0ac0 : 85 3b __ STA ACCU + 0 
0ac2 : ad 9a 48 LDA $489a ; (off1 + 1)
0ac5 : 85 3c __ STA ACCU + 1 
0ac7 : a9 83 __ LDA #$83
0ac9 : 85 23 __ STA WORK + 0 
0acb : a9 06 __ LDA #$06
0acd : 85 24 __ STA WORK + 1 
0acf : 20 31 20 JSR $2031 ; (divmod + 0)
0ad2 : 18 __ __ CLC
0ad3 : a9 00 __ LDA #$00
0ad5 : 65 25 __ ADC WORK + 2 
0ad7 : 85 47 __ STA T6 + 0 
0ad9 : a9 4a __ LDA #$4a
0adb : 4c a7 0b JMP $0ba7 ; (main.s1018 + 0)
.s1004:
0ade : c9 01 __ CMP #$01
0ae0 : d0 20 __ BNE $0b02 ; (main.s1003 + 0)
.s32:
0ae2 : a5 57 __ LDA T5 + 0 
0ae4 : 85 3b __ STA ACCU + 0 
0ae6 : ad 9a 48 LDA $489a ; (off1 + 1)
0ae9 : 85 3c __ STA ACCU + 1 
0aeb : a9 5c __ LDA #$5c
0aed : 85 23 __ STA WORK + 0 
0aef : a9 07 __ LDA #$07
0af1 : 85 24 __ STA WORK + 1 
0af3 : 20 31 20 JSR $2031 ; (divmod + 0)
0af6 : 18 __ __ CLC
0af7 : a9 84 __ LDA #$84
0af9 : 65 25 __ ADC WORK + 2 
0afb : 85 47 __ STA T6 + 0 
0afd : a9 50 __ LDA #$50
0aff : 4c a7 0b JMP $0ba7 ; (main.s1018 + 0)
.s1003:
0b02 : c9 02 __ CMP #$02
0b04 : d0 1c __ BNE $0b22 ; (main.s1002 + 0)
.s37:
0b06 : a5 57 __ LDA T5 + 0 
0b08 : 85 3b __ STA ACCU + 0 
0b0a : ad 9a 48 LDA $489a ; (off1 + 1)
0b0d : 85 3c __ STA ACCU + 1 
0b0f : a9 c5 __ LDA #$c5
0b11 : 85 23 __ STA WORK + 0 
0b13 : a9 00 __ LDA #$00
0b15 : 85 24 __ STA WORK + 1 
0b17 : 20 31 20 JSR $2031 ; (divmod + 0)
0b1a : a6 25 __ LDX WORK + 2 
0b1c : bd 00 58 LDA $5800,x ; (Song2 + 0)
0b1f : 4c 3f 0b JMP $0b3f ; (main.s67 + 0)
.s1002:
0b22 : c9 03 __ CMP #$03
0b24 : d0 29 __ BNE $0b4f ; (main.s26 + 0)
.s42:
0b26 : a5 57 __ LDA T5 + 0 
0b28 : 85 3b __ STA ACCU + 0 
0b2a : ad 9a 48 LDA $489a ; (off1 + 1)
0b2d : 85 3c __ STA ACCU + 1 
0b2f : a9 c3 __ LDA #$c3
0b31 : 85 23 __ STA WORK + 0 
0b33 : a9 00 __ LDA #$00
0b35 : 85 24 __ STA WORK + 1 
0b37 : 20 31 20 JSR $2031 ; (divmod + 0)
0b3a : a6 25 __ LDX WORK + 2 
0b3c : bd 00 59 LDA $5900,x ; (Song3 + 0)
.s67:
0b3f : 09 00 __ ORA #$00
0b41 : f0 0c __ BEQ $0b4f ; (main.s26 + 0)
.s28:
0b43 : 8d 23 9f STA $9f23 
0b46 : a5 57 __ LDA T5 + 0 
0b48 : 29 0f __ AND #$0f
0b4a : 09 80 __ ORA #$80
0b4c : 8d 23 9f STA $9f23 
.s26:
0b4f : a9 80 __ LDA #$80
0b51 : 85 34 __ STA P7 
0b53 : a9 00 __ LDA #$00
0b55 : 85 35 __ STA P8 
0b57 : 85 36 __ STA P9 
0b59 : 85 37 __ STA P10 
0b5b : 8d fc 9e STA $9efc ; (sstack + 0)
0b5e : 8d fd 9e STA $9efd ; (sstack + 1)
0b61 : a9 10 __ LDA #$10
0b63 : 8d fe 9e STA $9efe ; (sstack + 2)
0b66 : a9 00 __ LDA #$00
0b68 : 8d ff 9e STA $9eff ; (sstack + 3)
0b6b : 18 __ __ CLC
0b6c : a5 57 __ LDA T5 + 0 
0b6e : 69 01 __ ADC #$01
0b70 : 8d 99 48 STA $4899 ; (off1 + 0)
0b73 : 90 03 __ BCC $0b78 ; (main.s1027 + 0)
.s1026:
0b75 : ee 9a 48 INC $489a ; (off1 + 1)
.s1027:
0b78 : a9 e0 __ LDA #$e0
0b7a : 85 32 __ STA P5 
0b7c : a9 43 __ LDA #$43
0b7e : 85 33 __ STA P6 
0b80 : 20 b6 1e JSR $1eb6 ; (SetPaletteIndex.s0 + 0)
.s24:
0b83 : a9 01 __ LDA #$01
0b85 : 8d 2c 9f STA $9f2c 
0b88 : 20 a8 1d JSR $1da8 ; (zsm_fill.s0 + 0)
0b8b : a9 00 __ LDA #$00
0b8d : 8d 2c 9f STA $9f2c 
0b90 : 20 08 20 JSR $2008 ; (frame_wait.l1 + 0)
0b93 : ee 50 48 INC $4850 ; (FrameCount + 0)
0b96 : d0 03 __ BNE $0b9b ; (main.s1029 + 0)
.s1028:
0b98 : ee 51 48 INC $4851 ; (FrameCount + 1)
.s1029:
0b9b : e6 52 __ INC T1 + 0 
0b9d : f0 03 __ BEQ $0ba2 ; (main.s1030 + 0)
0b9f : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s1030:
0ba2 : e6 53 __ INC T1 + 1 
0ba4 : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s1018:
0ba7 : 65 26 __ ADC WORK + 3 
0ba9 : 85 48 __ STA T6 + 1 
0bab : a0 00 __ LDY #$00
0bad : b1 47 __ LDA (T6 + 0),y 
0baf : 4c 3f 0b JMP $0b3f ; (main.s67 + 0)
.s14:
0bb2 : e6 54 __ INC T2 + 0 
0bb4 : 4c 3f 0a JMP $0a3f ; (main.s74 + 0)
.s5:
0bb7 : a5 54 __ LDA T2 + 0 
0bb9 : 85 32 __ STA P5 
0bbb : a9 00 __ LDA #$00
0bbd : 85 33 __ STA P6 
0bbf : ad 53 48 LDA $4853 ; (LastSelectedSong + 0)
0bc2 : 85 34 __ STA P7 
0bc4 : a9 00 __ LDA #$00
0bc6 : 85 35 __ STA P8 
0bc8 : 20 b5 1c JSR $1cb5 ; (PlayZSM.s0 + 0)
0bcb : a5 32 __ LDA P5 
0bcd : 8d 53 48 STA $4853 ; (LastSelectedSong + 0)
0bd0 : ee 54 48 INC $4854 ; (PalTimer + 0)
0bd3 : f0 03 __ BEQ $0bd8 ; (main.s1022 + 0)
0bd5 : 4c 83 09 JMP $0983 ; (main.s61 + 0)
.s1022:
0bd8 : ee 55 48 INC $4855 ; (PalTimer + 1)
0bdb : 4c 83 09 JMP $0983 ; (main.s61 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0bde : 78 __ __ SEI
0bdf : ad 14 03 LDA $0314 
0be2 : 8d 9c 48 STA $489c ; (oirq + 0)
0be5 : ad 15 03 LDA $0315 
0be8 : 8d 9d 48 STA $489d ; (oirq + 1)
0beb : a9 f7 __ LDA #$f7
0bed : 8d 14 03 STA $0314 
0bf0 : a9 0b __ LDA #$0b
0bf2 : 8d 15 03 STA $0315 
0bf5 : 58 __ __ CLI
.s1001:
0bf6 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
489c : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0bf7 : 20 fd 0b JSR $0bfd ; (irq.s1000 + 0)
0bfa : 6c 9c 48 JMP ($489c)
--------------------------------------------------------------------
irq:
.s1000:
0bfd : a5 2d __ LDA P0 
0bff : 48 __ __ PHA
0c00 : a5 2e __ LDA P1 
0c02 : 48 __ __ PHA
0c03 : a5 3b __ LDA ACCU + 0 
0c05 : 48 __ __ PHA
0c06 : a5 3c __ LDA ACCU + 1 
0c08 : 48 __ __ PHA
0c09 : a5 47 __ LDA T0 + 0 
0c0b : 48 __ __ PHA
0c0c : a5 48 __ LDA $48 
0c0e : 48 __ __ PHA
0c0f : a5 49 __ LDA $49 
0c11 : 48 __ __ PHA
0c12 : a5 4a __ LDA $4a 
0c14 : 48 __ __ PHA
0c15 : a5 4b __ LDA $4b 
0c17 : 48 __ __ PHA
0c18 : a5 4c __ LDA $4c 
0c1a : 48 __ __ PHA
0c1b : a5 4d __ LDA $4d 
0c1d : 48 __ __ PHA
0c1e : a5 4e __ LDA $4e 
0c20 : 48 __ __ PHA
0c21 : a5 4f __ LDA $4f 
0c23 : 48 __ __ PHA
0c24 : a5 50 __ LDA $50 
0c26 : 48 __ __ PHA
.s0:
0c27 : ad e0 20 LDA $20e0 ; (zsm_playing + 0)
0c2a : f0 08 __ BEQ $0c34 ; (irq.s1001 + 0)
.s4:
0c2c : ad e1 20 LDA $20e1 ; (zsm_finished + 0)
0c2f : d0 03 __ BNE $0c34 ; (irq.s1001 + 0)
.s1:
0c31 : 20 5f 0c JSR $0c5f ; (zsm_play.s0 + 0)
.s1001:
0c34 : 68 __ __ PLA
0c35 : 85 50 __ STA $50 
0c37 : 68 __ __ PLA
0c38 : 85 4f __ STA $4f 
0c3a : 68 __ __ PLA
0c3b : 85 4e __ STA $4e 
0c3d : 68 __ __ PLA
0c3e : 85 4d __ STA $4d 
0c40 : 68 __ __ PLA
0c41 : 85 4c __ STA $4c 
0c43 : 68 __ __ PLA
0c44 : 85 4b __ STA $4b 
0c46 : 68 __ __ PLA
0c47 : 85 4a __ STA $4a 
0c49 : 68 __ __ PLA
0c4a : 85 49 __ STA $49 
0c4c : 68 __ __ PLA
0c4d : 85 48 __ STA $48 
0c4f : 68 __ __ PLA
0c50 : 85 47 __ STA T0 + 0 
0c52 : 68 __ __ PLA
0c53 : 85 3c __ STA ACCU + 1 
0c55 : 68 __ __ PLA
0c56 : 85 3b __ STA ACCU + 0 
0c58 : 68 __ __ PLA
0c59 : 85 2e __ STA P1 
0c5b : 68 __ __ PLA
0c5c : 85 2d __ STA P0 
0c5e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
20e0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
20e1 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c5f : ad e2 20 LDA $20e2 ; (zsm_paused + 0)
0c62 : f0 01 __ BEQ $0c65 ; (zsm_play.s2 + 0)
0c64 : 60 __ __ RTS
.s2:
0c65 : ad 9e 48 LDA $489e ; (zsm_delay + 0)
0c68 : f0 03 __ BEQ $0c6d ; (zsm_play.s5 + 0)
0c6a : 4c 9a 0d JMP $0d9a ; (zsm_play.s4 + 0)
.s5:
0c6d : ad 25 9f LDA $9f25 
0c70 : 85 47 __ STA T0 + 0 
0c72 : ad 25 9f LDA $9f25 
0c75 : 29 fe __ AND #$fe
0c77 : 8d 25 9f STA $9f25 
0c7a : ad 20 9f LDA $9f20 
0c7d : 85 49 __ STA T2 + 0 
0c7f : ad 21 9f LDA $9f21 
0c82 : 85 4a __ STA T2 + 1 
0c84 : ad 22 9f LDA $9f22 
0c87 : 85 48 __ STA T1 + 0 
.l8:
0c89 : ad 9f 48 LDA $489f ; (zsm_pos + 0)
0c8c : 85 4b __ STA T3 + 0 
0c8e : 18 __ __ CLC
0c8f : 69 01 __ ADC #$01
0c91 : 85 4d __ STA T4 + 0 
0c93 : 8d 9f 48 STA $489f ; (zsm_pos + 0)
0c96 : ad a0 48 LDA $48a0 ; (zsm_pos + 1)
0c99 : aa __ __ TAX
0c9a : 69 00 __ ADC #$00
0c9c : 85 4e __ STA T4 + 1 
0c9e : 8d a0 48 STA $48a0 ; (zsm_pos + 1)
0ca1 : 18 __ __ CLC
0ca2 : a9 c4 __ LDA #$c4
0ca4 : 65 4b __ ADC T3 + 0 
0ca6 : 85 3b __ STA ACCU + 0 
0ca8 : 8a __ __ TXA
0ca9 : 29 03 __ AND #$03
0cab : 69 59 __ ADC #$59
0cad : 85 3c __ STA ACCU + 1 
0caf : a0 00 __ LDY #$00
0cb1 : b1 3b __ LDA (ACCU + 0),y 
0cb3 : c9 40 __ CMP #$40
0cb5 : b0 03 __ BCS $0cba ; (zsm_play.s12 + 0)
0cb7 : 4c 65 0d JMP $0d65 ; (zsm_play.s11 + 0)
.s12:
0cba : d0 22 __ BNE $0cde ; (zsm_play.s15 + 0)
.s14:
0cbc : 18 __ __ CLC
0cbd : a9 c4 __ LDA #$c4
0cbf : 65 4d __ ADC T4 + 0 
0cc1 : 85 4b __ STA T3 + 0 
0cc3 : a5 4e __ LDA T4 + 1 
0cc5 : 29 03 __ AND #$03
0cc7 : 69 59 __ ADC #$59
0cc9 : 85 4c __ STA T3 + 1 
0ccb : b1 4b __ LDA (T3 + 0),y 
0ccd : 29 3f __ AND #$3f
0ccf : 18 __ __ CLC
0cd0 : 65 4d __ ADC T4 + 0 
0cd2 : 8d 9f 48 STA $489f ; (zsm_pos + 0)
0cd5 : 98 __ __ TYA
0cd6 : 65 4e __ ADC T4 + 1 
0cd8 : 8d a0 48 STA $48a0 ; (zsm_pos + 1)
0cdb : 4c 89 0c JMP $0c89 ; (zsm_play.l8 + 0)
.s15:
0cde : 09 00 __ ORA #$00
0ce0 : 30 5b __ BMI $0d3d ; (zsm_play.s18 + 0)
.s17:
0ce2 : 29 3f __ AND #$3f
0ce4 : f0 a3 __ BEQ $0c89 ; (zsm_play.l8 + 0)
.s29:
0ce6 : 84 50 __ STY T7 + 0 
0ce8 : 85 4f __ STA T6 + 0 
0cea : 18 __ __ CLC
.l1012:
0ceb : a9 c4 __ LDA #$c4
0ced : 6d 9f 48 ADC $489f ; (zsm_pos + 0)
0cf0 : 85 4d __ STA T4 + 0 
0cf2 : ad a0 48 LDA $48a0 ; (zsm_pos + 1)
0cf5 : 29 03 __ AND #$03
0cf7 : 69 59 __ ADC #$59
0cf9 : 85 4e __ STA T4 + 1 
0cfb : a0 00 __ LDY #$00
0cfd : b1 4d __ LDA (T4 + 0),y 
0cff : 85 2d __ STA P0 
0d01 : ad 9f 48 LDA $489f ; (zsm_pos + 0)
0d04 : 18 __ __ CLC
0d05 : 69 01 __ ADC #$01
0d07 : aa __ __ TAX
0d08 : ad a0 48 LDA $48a0 ; (zsm_pos + 1)
0d0b : 69 00 __ ADC #$00
0d0d : 29 03 __ AND #$03
0d0f : 85 4c __ STA T3 + 1 
0d11 : 8a __ __ TXA
0d12 : 18 __ __ CLC
0d13 : 69 c4 __ ADC #$c4
0d15 : 85 4b __ STA T3 + 0 
0d17 : a9 59 __ LDA #$59
0d19 : 65 4c __ ADC T3 + 1 
0d1b : 85 4c __ STA T3 + 1 
0d1d : b1 4b __ LDA (T3 + 0),y 
0d1f : 85 2e __ STA P1 
0d21 : 20 9e 0d JSR $0d9e ; (sfx_put.l1 + 0)
0d24 : ad 9f 48 LDA $489f ; (zsm_pos + 0)
0d27 : 18 __ __ CLC
0d28 : 69 02 __ ADC #$02
0d2a : 8d 9f 48 STA $489f ; (zsm_pos + 0)
0d2d : 90 03 __ BCC $0d32 ; (zsm_play.s1015 + 0)
.s1014:
0d2f : ee a0 48 INC $48a0 ; (zsm_pos + 1)
.s1015:
0d32 : e6 50 __ INC T7 + 0 
0d34 : a5 50 __ LDA T7 + 0 
0d36 : c5 4f __ CMP T6 + 0 
0d38 : 90 b1 __ BCC $0ceb ; (zsm_play.l1012 + 0)
0d3a : 4c 89 0c JMP $0c89 ; (zsm_play.l8 + 0)
.s18:
0d3d : c9 80 __ CMP #$80
0d3f : d0 07 __ BNE $0d48 ; (zsm_play.s25 + 0)
.s24:
0d41 : a9 01 __ LDA #$01
0d43 : 8d e1 20 STA $20e1 ; (zsm_finished + 0)
0d46 : d0 08 __ BNE $0d50 ; (zsm_play.s10 + 0)
.s25:
0d48 : 29 7f __ AND #$7f
0d4a : 38 __ __ SEC
0d4b : e9 01 __ SBC #$01
0d4d : 8d 9e 48 STA $489e ; (zsm_delay + 0)
.s10:
0d50 : a5 49 __ LDA T2 + 0 
0d52 : 8d 20 9f STA $9f20 
0d55 : a5 4a __ LDA T2 + 1 
0d57 : 8d 21 9f STA $9f21 
0d5a : a5 48 __ LDA T1 + 0 
0d5c : 8d 22 9f STA $9f22 
0d5f : a5 47 __ LDA T0 + 0 
0d61 : 8d 25 9f STA $9f25 
.s1001:
0d64 : 60 __ __ RTS
.s11:
0d65 : 29 3f __ AND #$3f
0d67 : 09 c0 __ ORA #$c0
0d69 : 8d 20 9f STA $9f20 
0d6c : a9 f9 __ LDA #$f9
0d6e : 8d 21 9f STA $9f21 
0d71 : a9 01 __ LDA #$01
0d73 : 8d 22 9f STA $9f22 
0d76 : a5 4b __ LDA T3 + 0 
0d78 : 69 02 __ ADC #$02
0d7a : 8d 9f 48 STA $489f ; (zsm_pos + 0)
0d7d : 90 01 __ BCC $0d80 ; (zsm_play.s1017 + 0)
.s1016:
0d7f : e8 __ __ INX
.s1017:
0d80 : 8e a0 48 STX $48a0 ; (zsm_pos + 1)
0d83 : 18 __ __ CLC
0d84 : a9 c4 __ LDA #$c4
0d86 : 65 4d __ ADC T4 + 0 
0d88 : 85 4b __ STA T3 + 0 
0d8a : a5 4e __ LDA T4 + 1 
0d8c : 29 03 __ AND #$03
0d8e : 69 59 __ ADC #$59
0d90 : 85 4c __ STA T3 + 1 
0d92 : b1 4b __ LDA (T3 + 0),y 
0d94 : 8d 23 9f STA $9f23 
0d97 : 4c 89 0c JMP $0c89 ; (zsm_play.l8 + 0)
.s4:
0d9a : ce 9e 48 DEC $489e ; (zsm_delay + 0)
0d9d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
20e2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
489e : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
59c4 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
489f : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0d9e : ad 41 9f LDA $9f41 
0da1 : 30 fb __ BMI $0d9e ; (sfx_put.l1 + 0)
.s3:
0da3 : a5 2d __ LDA P0 ; (index + 0)
0da5 : 8d 40 9f STA $9f40 
0da8 : ea __ __ NOP
0da9 : ea __ __ NOP
0daa : ea __ __ NOP
0dab : ea __ __ NOP
0dac : a5 2e __ LDA P1 ; (data + 0)
0dae : a6 2d __ LDX P0 ; (index + 0)
0db0 : 9d 00 5e STA $5e00,x ; (vera_fm_s_regs + 0)
0db3 : 8d 41 9f STA $9f41 
.s1001:
0db6 : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
5e00 : __ __ __ BSS	128
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0db7 : a9 93 __ LDA #$93
0db9 : 85 2d __ STA P0 
0dbb : a9 00 __ LDA #$00
0dbd : 85 2e __ STA P1 
0dbf : 20 f4 0d JSR $0df4 ; (putch.s0 + 0)
0dc2 : a9 11 __ LDA #$11
0dc4 : 8d 22 9f STA $9f22 
0dc7 : a2 00 __ LDX #$00
.l2:
0dc9 : 8a __ __ TXA
0dca : 18 __ __ CLC
0dcb : 69 b0 __ ADC #$b0
0dcd : 8d 21 9f STA $9f21 
0dd0 : a9 00 __ LDA #$00
0dd2 : 8d 20 9f STA $9f20 
0dd5 : a0 80 __ LDY #$80
.l1003:
0dd7 : a9 20 __ LDA #$20
0dd9 : 8d 23 9f STA $9f23 
0ddc : a9 01 __ LDA #$01
0dde : 8d 23 9f STA $9f23 
0de1 : a9 20 __ LDA #$20
0de3 : 8d 24 9f STA $9f24 
0de6 : a9 01 __ LDA #$01
0de8 : 8d 24 9f STA $9f24 
0deb : 88 __ __ DEY
0dec : d0 e9 __ BNE $0dd7 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0dee : e8 __ __ INX
0def : e0 40 __ CPX #$40
0df1 : 90 d6 __ BCC $0dc9 ; (ClearVERAScreen.l2 + 0)
.s1001:
0df3 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0df4 : a5 2d __ LDA P0 
0df6 : 20 d2 ff JSR $ffd2 
.s1001:
0df9 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0dfa : a9 00 __ LDA #$00
0dfc : 8d 25 9f STA $9f25 
0dff : a9 80 __ LDA #$80
0e01 : 8d 2b 9f STA $9f2b 
0e04 : 8d 2a 9f STA $9f2a 
0e07 : a9 62 __ LDA #$62
0e09 : 8d 2d 9f STA $9f2d 
0e0c : a9 68 __ LDA #$68
0e0e : 8d 34 9f STA $9f34 
0e11 : a9 00 __ LDA #$00
0e13 : 85 2d __ STA P0 
0e15 : 85 2e __ STA P1 
0e17 : 85 2f __ STA P2 
0e19 : 85 30 __ STA P3 
0e1b : 85 31 __ STA P4 
0e1d : 20 61 17 JSR $1761 ; (tileBaseConfig.s0 + 0)
0e20 : 8d 2f 9f STA $9f2f 
0e23 : a9 00 __ LDA #$00
0e25 : 85 2d __ STA P0 
0e27 : a9 20 __ LDA #$20
0e29 : 85 2f __ STA P2 
0e2b : 20 79 17 JSR $1779 ; (memoryToMapMemoryAddress.s0 + 0)
0e2e : 8d 2e 9f STA $9f2e 
0e31 : a9 01 __ LDA #$01
0e33 : 8d 22 9f STA $9f22 
0e36 : a2 80 __ LDX #$80
.l6:
0e38 : a0 50 __ LDY #$50
.l1039:
0e3a : a9 00 __ LDA #$00
0e3c : 8d 24 9f STA $9f24 
0e3f : a9 08 __ LDA #$08
0e41 : 8d 24 9f STA $9f24 
0e44 : 88 __ __ DEY
0e45 : d0 f3 __ BNE $0e3a ; (SetUpSprites.l1039 + 0)
.s1040:
0e47 : ca __ __ DEX
0e48 : d0 ee __ BNE $0e38 ; (SetUpSprites.l6 + 0)
.s4:
0e4a : 86 4e __ STX T1 + 0 
0e4c : a9 00 __ LDA #$00
0e4e : 85 2d __ STA P0 
0e50 : 85 2e __ STA P1 
0e52 : 85 2f __ STA P2 
0e54 : 85 30 __ STA P3 
0e56 : a9 e0 __ LDA #$e0
0e58 : 85 33 __ STA P6 
0e5a : a9 01 __ LDA #$01
0e5c : 85 34 __ STA P7 
0e5e : a9 e3 __ LDA #$e3
0e60 : 85 31 __ STA P4 
0e62 : a9 20 __ LDA #$20
0e64 : 85 32 __ STA P5 
0e66 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
0e69 : a9 10 __ LDA #$10
0e6b : 8d 22 9f STA $9f22 
0e6e : a9 00 __ LDA #$00
0e70 : 8d 20 9f STA $9f20 
0e73 : a9 20 __ LDA #$20
0e75 : 8d 21 9f STA $9f21 
.l10:
0e78 : a9 00 __ LDA #$00
0e7a : 85 4f __ STA T2 + 0 
.l14:
0e7c : 20 c1 17 JSR $17c1 ; (rand.s0 + 0)
0e7f : a9 31 __ LDA #$31
0e81 : 85 23 __ STA WORK + 0 
0e83 : a9 00 __ LDA #$00
0e85 : 85 24 __ STA WORK + 1 
0e87 : 20 31 20 JSR $2031 ; (divmod + 0)
0e8a : a5 4e __ LDA T1 + 0 
0e8c : c9 36 __ CMP #$36
0e8e : 90 03 __ BCC $0e93 ; (SetUpSprites.s1037 + 0)
0e90 : 4c b4 16 JMP $16b4 ; (SetUpSprites.s1032 + 0)
.s1037:
0e93 : c9 2c __ CMP #$2c
0e95 : b0 03 __ BCS $0e9a ; (SetUpSprites.s1036 + 0)
0e97 : 4c b4 16 JMP $16b4 ; (SetUpSprites.s1032 + 0)
.s1036:
0e9a : f0 04 __ BEQ $0ea0 ; (SetUpSprites.s21 + 0)
.s1035:
0e9c : c9 34 __ CMP #$34
0e9e : d0 04 __ BNE $0ea4 ; (SetUpSprites.s1034 + 0)
.s21:
0ea0 : a9 0a __ LDA #$0a
0ea2 : d0 0e __ BNE $0eb2 ; (SetUpSprites.s219 + 0)
.s1034:
0ea4 : c9 2d __ CMP #$2d
0ea6 : f0 04 __ BEQ $0eac ; (SetUpSprites.s25 + 0)
.s1033:
0ea8 : c9 35 __ CMP #$35
0eaa : d0 04 __ BNE $0eb0 ; (SetUpSprites.s26 + 0)
.s25:
0eac : a9 0b __ LDA #$0b
0eae : d0 02 __ BNE $0eb2 ; (SetUpSprites.s219 + 0)
.s26:
0eb0 : a9 04 __ LDA #$04
.s219:
0eb2 : 8d 23 9f STA $9f23 
0eb5 : a9 00 __ LDA #$00
0eb7 : 8d 23 9f STA $9f23 
0eba : e6 4f __ INC T2 + 0 
0ebc : 10 be __ BPL $0e7c ; (SetUpSprites.l14 + 0)
.s11:
0ebe : e6 4e __ INC T1 + 0 
0ec0 : a5 4e __ LDA T1 + 0 
0ec2 : c9 3c __ CMP #$3c
0ec4 : 90 b2 __ BCC $0e78 ; (SetUpSprites.l10 + 0)
.s12:
0ec6 : a9 c0 __ LDA #$c0
0ec8 : 85 2d __ STA P0 
0eca : a9 56 __ LDA #$56
0ecc : 85 2e __ STA P1 
0ece : a9 01 __ LDA #$01
0ed0 : 85 2f __ STA P2 
0ed2 : a9 00 __ LDA #$00
0ed4 : 85 30 __ STA P3 
0ed6 : 85 33 __ STA P6 
0ed8 : a9 02 __ LDA #$02
0eda : 85 34 __ STA P7 
0edc : a9 c5 __ LDA #$c5
0ede : 85 31 __ STA P4 
0ee0 : a9 22 __ LDA #$22
0ee2 : 85 32 __ STA P5 
0ee4 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
0ee7 : a9 00 __ LDA #$00
0ee9 : 85 2d __ STA P0 
0eeb : a9 59 __ LDA #$59
0eed : 85 2e __ STA P1 
0eef : a9 02 __ LDA #$02
0ef1 : 85 34 __ STA P7 
0ef3 : a9 c5 __ LDA #$c5
0ef5 : 85 31 __ STA P4 
0ef7 : a9 24 __ LDA #$24
0ef9 : 85 32 __ STA P5 
0efb : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
0efe : a9 b6 __ LDA #$b6
0f00 : 85 2e __ STA P1 
0f02 : a9 0a __ LDA #$0a
0f04 : 85 2f __ STA P2 
0f06 : 85 34 __ STA P7 
0f08 : a9 02 __ LDA #$02
0f0a : 85 31 __ STA P4 
0f0c : 85 32 __ STA P5 
0f0e : a9 03 __ LDA #$03
0f10 : 85 33 __ STA P6 
0f12 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
0f15 : a9 68 __ LDA #$68
0f17 : 85 2e __ STA P1 
0f19 : a9 00 __ LDA #$00
0f1b : 85 2f __ STA P2 
0f1d : a9 b6 __ LDA #$b6
0f1f : 85 30 __ STA P3 
0f21 : a9 01 __ LDA #$01
0f23 : 85 31 __ STA P4 
0f25 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
0f28 : a9 01 __ LDA #$01
0f2a : 85 2d __ STA P0 
0f2c : a9 c8 __ LDA #$c8
0f2e : 85 2e __ STA P1 
0f30 : a9 0a __ LDA #$0a
0f32 : 85 2f __ STA P2 
0f34 : a9 00 __ LDA #$00
0f36 : 85 30 __ STA P3 
0f38 : a9 02 __ LDA #$02
0f3a : 85 31 __ STA P4 
0f3c : a9 09 __ LDA #$09
0f3e : 85 34 __ STA P7 
0f40 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
0f43 : a9 f0 __ LDA #$f0
0f45 : 85 2e __ STA P1 
0f47 : a9 01 __ LDA #$01
0f49 : 85 2f __ STA P2 
0f4b : 85 31 __ STA P4 
0f4d : a9 b6 __ LDA #$b6
0f4f : 85 30 __ STA P3 
0f51 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
0f54 : a9 00 __ LDA #$00
0f56 : 85 2d __ STA P0 
0f58 : 85 30 __ STA P3 
0f5a : 85 33 __ STA P6 
0f5c : a9 30 __ LDA #$30
0f5e : 85 2e __ STA P1 
0f60 : a9 01 __ LDA #$01
0f62 : 85 34 __ STA P7 
0f64 : a9 00 __ LDA #$00
0f66 : 85 31 __ STA P4 
0f68 : a9 27 __ LDA #$27
0f6a : 85 32 __ STA P5 
0f6c : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
0f6f : a9 16 __ LDA #$16
0f71 : 85 2d __ STA P0 
0f73 : a9 80 __ LDA #$80
0f75 : 85 2e __ STA P1 
0f77 : a9 09 __ LDA #$09
0f79 : 85 2f __ STA P2 
0f7b : a9 01 __ LDA #$01
0f7d : 85 31 __ STA P4 
0f7f : 85 34 __ STA P7 
0f81 : a9 02 __ LDA #$02
0f83 : 85 32 __ STA P5 
0f85 : a9 03 __ LDA #$03
0f87 : 85 33 __ STA P6 
0f89 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
0f8c : a9 30 __ LDA #$30
0f8e : 85 2e __ STA P1 
0f90 : a9 01 __ LDA #$01
0f92 : 85 2f __ STA P2 
0f94 : a9 b8 __ LDA #$b8
0f96 : 85 30 __ STA P3 
0f98 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
0f9b : a9 00 __ LDA #$00
0f9d : 85 2d __ STA P0 
0f9f : 85 30 __ STA P3 
0fa1 : 85 33 __ STA P6 
0fa3 : a9 37 __ LDA #$37
0fa5 : 85 2e __ STA P1 
0fa7 : a9 02 __ LDA #$02
0fa9 : 85 34 __ STA P7 
0fab : a9 00 __ LDA #$00
0fad : 85 31 __ STA P4 
0faf : a9 28 __ LDA #$28
0fb1 : 85 32 __ STA P5 
0fb3 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
0fb6 : a9 17 __ LDA #$17
0fb8 : 85 2d __ STA P0 
0fba : a9 b8 __ LDA #$b8
0fbc : 85 2e __ STA P1 
0fbe : a9 09 __ LDA #$09
0fc0 : 85 2f __ STA P2 
0fc2 : a9 02 __ LDA #$02
0fc4 : 85 31 __ STA P4 
0fc6 : 85 32 __ STA P5 
0fc8 : a9 03 __ LDA #$03
0fca : 85 33 __ STA P6 
0fcc : a9 01 __ LDA #$01
0fce : 85 34 __ STA P7 
0fd0 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
0fd3 : a9 fc __ LDA #$fc
0fd5 : 85 2e __ STA P1 
0fd7 : a9 00 __ LDA #$00
0fd9 : 85 2f __ STA P2 
0fdb : a9 b8 __ LDA #$b8
0fdd : 85 30 __ STA P3 
0fdf : a9 01 __ LDA #$01
0fe1 : 85 31 __ STA P4 
0fe3 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
0fe6 : a9 18 __ LDA #$18
0fe8 : 85 2d __ STA P0 
0fea : a9 b8 __ LDA #$b8
0fec : 85 2e __ STA P1 
0fee : a9 09 __ LDA #$09
0ff0 : 85 2f __ STA P2 
0ff2 : a9 00 __ LDA #$00
0ff4 : 85 30 __ STA P3 
0ff6 : a9 02 __ LDA #$02
0ff8 : 85 31 __ STA P4 
0ffa : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
0ffd : a9 4c __ LDA #$4c
0fff : 85 2e __ STA P1 
1001 : a9 01 __ LDA #$01
1003 : 85 2f __ STA P2 
1005 : 85 31 __ STA P4 
1007 : a9 b8 __ LDA #$b8
1009 : 85 30 __ STA P3 
100b : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
100e : a9 01 __ LDA #$01
1010 : 85 2e __ STA P1 
1012 : a9 00 __ LDA #$00
1014 : 85 2f __ STA P2 
1016 : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
1019 : a9 10 __ LDA #$10
101b : 85 2d __ STA P0 
101d : a9 20 __ LDA #$20
101f : 85 30 __ STA P3 
1021 : a9 00 __ LDA #$00
1023 : 85 31 __ STA P4 
1025 : a9 c5 __ LDA #$c5
1027 : 85 2e __ STA P1 
1029 : a9 26 __ LDA #$26
102b : 85 2f __ STA P2 
102d : 20 bb 18 JSR $18bb ; (vera_pal_putn.s0 + 0)
1030 : a9 00 __ LDA #$00
1032 : 85 2d __ STA P0 
1034 : 85 30 __ STA P3 
1036 : 85 33 __ STA P6 
1038 : a9 35 __ LDA #$35
103a : 85 2e __ STA P1 
103c : a9 01 __ LDA #$01
103e : 85 2f __ STA P2 
1040 : a9 02 __ LDA #$02
1042 : 85 34 __ STA P7 
1044 : a9 00 __ LDA #$00
1046 : 85 31 __ STA P4 
1048 : a9 2a __ LDA #$2a
104a : 85 32 __ STA P5 
104c : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
104f : a9 00 __ LDA #$00
1051 : 85 4e __ STA T1 + 0 
1053 : 85 4f __ STA T2 + 0 
1055 : a9 03 __ LDA #$03
1057 : 85 33 __ STA P6 
1059 : a9 02 __ LDA #$02
105b : 85 34 __ STA P7 
105d : 18 __ __ CLC
.l1053:
105e : a9 a8 __ LDA #$a8
1060 : 85 2e __ STA P1 
1062 : a9 09 __ LDA #$09
1064 : 85 2f __ STA P2 
1066 : a9 00 __ LDA #$00
1068 : 85 30 __ STA P3 
106a : 85 31 __ STA P4 
106c : 85 32 __ STA P5 
106e : a5 4e __ LDA T1 + 0 
1070 : 69 19 __ ADC #$19
1072 : 85 2d __ STA P0 
1074 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1077 : a9 b8 __ LDA #$b8
1079 : 85 30 __ STA P3 
107b : a9 01 __ LDA #$01
107d : 85 31 __ STA P4 
107f : 38 __ __ SEC
1080 : a5 4f __ LDA T2 + 0 
1082 : e9 fc __ SBC #$fc
1084 : 85 2e __ STA P1 
1086 : a9 00 __ LDA #$00
1088 : e9 03 __ SBC #$03
108a : 85 2f __ STA P2 
108c : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
108f : 18 __ __ CLC
1090 : a5 4f __ LDA T2 + 0 
1092 : 69 0c __ ADC #$0c
1094 : 85 4f __ STA T2 + 0 
1096 : e6 4e __ INC T1 + 0 
1098 : a5 4e __ LDA T1 + 0 
109a : c9 08 __ CMP #$08
109c : 90 c0 __ BCC $105e ; (SetUpSprites.l1053 + 0)
.s78:
109e : a9 00 __ LDA #$00
10a0 : 85 4e __ STA T1 + 0 
10a2 : 85 4f __ STA T2 + 0 
10a4 : a9 03 __ LDA #$03
10a6 : 85 33 __ STA P6 
10a8 : 85 34 __ STA P7 
10aa : 18 __ __ CLC
.l1055:
10ab : a9 a8 __ LDA #$a8
10ad : 85 2e __ STA P1 
10af : a9 09 __ LDA #$09
10b1 : 85 2f __ STA P2 
10b3 : a9 00 __ LDA #$00
10b5 : 85 30 __ STA P3 
10b7 : 85 31 __ STA P4 
10b9 : a5 4e __ LDA T1 + 0 
10bb : 69 21 __ ADC #$21
10bd : 85 2d __ STA P0 
10bf : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
10c2 : a9 c4 __ LDA #$c4
10c4 : 85 30 __ STA P3 
10c6 : a9 01 __ LDA #$01
10c8 : 85 31 __ STA P4 
10ca : 38 __ __ SEC
10cb : a5 4f __ LDA T2 + 0 
10cd : e9 fc __ SBC #$fc
10cf : 85 2e __ STA P1 
10d1 : a9 00 __ LDA #$00
10d3 : e9 03 __ SBC #$03
10d5 : 85 2f __ STA P2 
10d7 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
10da : 18 __ __ CLC
10db : a5 4f __ LDA T2 + 0 
10dd : 69 0c __ ADC #$0c
10df : 85 4f __ STA T2 + 0 
10e1 : e6 4e __ INC T1 + 0 
10e3 : a5 4e __ LDA T1 + 0 
10e5 : c9 08 __ CMP #$08
10e7 : 90 c2 __ BCC $10ab ; (SetUpSprites.l1055 + 0)
.s82:
10e9 : a9 00 __ LDA #$00
10eb : 85 4e __ STA T1 + 0 
10ed : 85 4f __ STA T2 + 0 
10ef : a9 03 __ LDA #$03
10f1 : 85 33 __ STA P6 
10f3 : a9 04 __ LDA #$04
10f5 : 85 34 __ STA P7 
10f7 : 18 __ __ CLC
.l1057:
10f8 : a9 a8 __ LDA #$a8
10fa : 85 2e __ STA P1 
10fc : a9 09 __ LDA #$09
10fe : 85 2f __ STA P2 
1100 : a9 00 __ LDA #$00
1102 : 85 30 __ STA P3 
1104 : 85 31 __ STA P4 
1106 : a5 4e __ LDA T1 + 0 
1108 : 69 29 __ ADC #$29
110a : 85 2d __ STA P0 
110c : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
110f : a9 b8 __ LDA #$b8
1111 : 85 30 __ STA P3 
1113 : a9 01 __ LDA #$01
1115 : 85 31 __ STA P4 
1117 : 38 __ __ SEC
1118 : a9 6c __ LDA #$6c
111a : e5 4f __ SBC T2 + 0 
111c : 85 2e __ STA P1 
111e : a9 02 __ LDA #$02
1120 : e9 04 __ SBC #$04
1122 : 85 2f __ STA P2 
1124 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1127 : 18 __ __ CLC
1128 : a5 4f __ LDA T2 + 0 
112a : 69 0c __ ADC #$0c
112c : 85 4f __ STA T2 + 0 
112e : e6 4e __ INC T1 + 0 
1130 : a5 4e __ LDA T1 + 0 
1132 : c9 08 __ CMP #$08
1134 : 90 c2 __ BCC $10f8 ; (SetUpSprites.l1057 + 0)
.s86:
1136 : a9 00 __ LDA #$00
1138 : 85 4e __ STA T1 + 0 
113a : a9 03 __ LDA #$03
113c : 85 33 __ STA P6 
113e : a9 04 __ LDA #$04
1140 : 85 34 __ STA P7 
.l88:
1142 : 38 __ __ SEC
1143 : a9 00 __ LDA #$00
1145 : e5 4e __ SBC T1 + 0 
1147 : 29 0c __ AND #$0c
1149 : 49 ff __ EOR #$ff
114b : 38 __ __ SEC
114c : 69 6c __ ADC #$6c
114e : 85 4f __ STA T2 + 0 
1150 : a9 02 __ LDA #$02
1152 : e9 00 __ SBC #$00
1154 : 85 50 __ STA T2 + 1 
1156 : 18 __ __ CLC
1157 : a5 4e __ LDA T1 + 0 
1159 : 69 31 __ ADC #$31
115b : 85 2d __ STA P0 
115d : a9 02 __ LDA #$02
115f : 85 51 __ STA T4 + 0 
.l1041:
1161 : a9 a8 __ LDA #$a8
1163 : 85 2e __ STA P1 
1165 : a9 09 __ LDA #$09
1167 : 85 2f __ STA P2 
1169 : a9 00 __ LDA #$00
116b : 85 30 __ STA P3 
116d : 85 31 __ STA P4 
116f : 85 32 __ STA P5 
1171 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1174 : a5 4f __ LDA T2 + 0 
1176 : 85 2e __ STA P1 
1178 : a5 50 __ LDA T2 + 1 
117a : 85 2f __ STA P2 
117c : a9 b8 __ LDA #$b8
117e : 85 30 __ STA P3 
1180 : a9 01 __ LDA #$01
1182 : 85 31 __ STA P4 
1184 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1187 : c6 51 __ DEC T4 + 0 
1189 : d0 d6 __ BNE $1161 ; (SetUpSprites.l1041 + 0)
.s89:
118b : e6 4e __ INC T1 + 0 
118d : a5 4e __ LDA T1 + 0 
118f : c9 02 __ CMP #$02
1191 : 90 af __ BCC $1142 ; (SetUpSprites.l88 + 0)
.s90:
1193 : a9 40 __ LDA #$40
1195 : 85 2d __ STA P0 
1197 : a9 51 __ LDA #$51
1199 : 85 2e __ STA P1 
119b : a9 01 __ LDA #$01
119d : 85 2f __ STA P2 
119f : 85 34 __ STA P7 
11a1 : a9 00 __ LDA #$00
11a3 : 85 30 __ STA P3 
11a5 : 85 33 __ STA P6 
11a7 : a9 00 __ LDA #$00
11a9 : 85 31 __ STA P4 
11ab : a9 2c __ LDA #$2c
11ad : 85 32 __ STA P5 
11af : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
11b2 : a9 33 __ LDA #$33
11b4 : 85 2d __ STA P0 
11b6 : a9 8a __ LDA #$8a
11b8 : 85 2e __ STA P1 
11ba : a9 0a __ LDA #$0a
11bc : 85 2f __ STA P2 
11be : a9 01 __ LDA #$01
11c0 : 85 31 __ STA P4 
11c2 : a9 02 __ LDA #$02
11c4 : 85 32 __ STA P5 
11c6 : a9 03 __ LDA #$03
11c8 : 85 33 __ STA P6 
11ca : a9 06 __ LDA #$06
11cc : 85 34 __ STA P7 
11ce : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
11d1 : a9 00 __ LDA #$00
11d3 : 85 2e __ STA P1 
11d5 : 85 31 __ STA P4 
11d7 : a9 01 __ LDA #$01
11d9 : 85 2f __ STA P2 
11db : a9 78 __ LDA #$78
11dd : 85 30 __ STA P3 
11df : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
11e2 : a9 00 __ LDA #$00
11e4 : 85 2d __ STA P0 
11e6 : 85 30 __ STA P3 
11e8 : 85 33 __ STA P6 
11ea : a9 41 __ LDA #$41
11ec : 85 2e __ STA P1 
11ee : a9 04 __ LDA #$04
11f0 : 85 34 __ STA P7 
11f2 : a9 00 __ LDA #$00
11f4 : 85 31 __ STA P4 
11f6 : a9 2d __ LDA #$2d
11f8 : 85 32 __ STA P5 
11fa : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
11fd : a9 34 __ LDA #$34
11ff : 85 2d __ STA P0 
1201 : a9 08 __ LDA #$08
1203 : 85 2e __ STA P1 
1205 : a9 0a __ LDA #$0a
1207 : 85 2f __ STA P2 
1209 : a9 03 __ LDA #$03
120b : 85 31 __ STA P4 
120d : 85 33 __ STA P6 
120f : a9 02 __ LDA #$02
1211 : 85 32 __ STA P5 
1213 : a9 05 __ LDA #$05
1215 : 85 34 __ STA P7 
1217 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
121a : a9 00 __ LDA #$00
121c : 85 2e __ STA P1 
121e : 85 31 __ STA P4 
1220 : a9 01 __ LDA #$01
1222 : 85 2f __ STA P2 
1224 : a9 78 __ LDA #$78
1226 : 85 30 __ STA P3 
1228 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
122b : a9 35 __ LDA #$35
122d : 85 2d __ STA P0 
122f : a9 28 __ LDA #$28
1231 : 85 2e __ STA P1 
1233 : a9 0a __ LDA #$0a
1235 : 85 2f __ STA P2 
1237 : a9 00 __ LDA #$00
1239 : 85 30 __ STA P3 
123b : a9 03 __ LDA #$03
123d : 85 31 __ STA P4 
123f : a9 07 __ LDA #$07
1241 : 85 33 __ STA P6 
1243 : a9 06 __ LDA #$06
1245 : 85 34 __ STA P7 
1247 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
124a : a9 00 __ LDA #$00
124c : 85 2e __ STA P1 
124e : 85 31 __ STA P4 
1250 : a9 01 __ LDA #$01
1252 : 85 2f __ STA P2 
1254 : a9 e8 __ LDA #$e8
1256 : 85 30 __ STA P3 
1258 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
125b : a9 36 __ LDA #$36
125d : 85 2d __ STA P0 
125f : a9 28 __ LDA #$28
1261 : 85 2e __ STA P1 
1263 : a9 0a __ LDA #$0a
1265 : 85 2f __ STA P2 
1267 : a9 00 __ LDA #$00
1269 : 85 30 __ STA P3 
126b : a9 03 __ LDA #$03
126d : 85 31 __ STA P4 
126f : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1272 : a9 40 __ LDA #$40
1274 : 85 2e __ STA P1 
1276 : a9 01 __ LDA #$01
1278 : 85 2f __ STA P2 
127a : a9 e8 __ LDA #$e8
127c : 85 30 __ STA P3 
127e : a9 00 __ LDA #$00
1280 : 85 31 __ STA P4 
1282 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1285 : a9 01 __ LDA #$01
1287 : 85 2e __ STA P1 
1289 : a9 00 __ LDA #$00
128b : 85 2f __ STA P2 
128d : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
1290 : a9 37 __ LDA #$37
1292 : 85 2d __ STA P0 
1294 : a9 28 __ LDA #$28
1296 : 85 2e __ STA P1 
1298 : a9 0a __ LDA #$0a
129a : 85 2f __ STA P2 
129c : a9 00 __ LDA #$00
129e : 85 30 __ STA P3 
12a0 : a9 03 __ LDA #$03
12a2 : 85 31 __ STA P4 
12a4 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
12a7 : a9 00 __ LDA #$00
12a9 : 85 2e __ STA P1 
12ab : a9 01 __ LDA #$01
12ad : 85 2f __ STA P2 
12af : 85 31 __ STA P4 
12b1 : a9 08 __ LDA #$08
12b3 : 85 30 __ STA P3 
12b5 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
12b8 : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
12bb : a9 38 __ LDA #$38
12bd : 85 2d __ STA P0 
12bf : a9 28 __ LDA #$28
12c1 : 85 2e __ STA P1 
12c3 : a9 0a __ LDA #$0a
12c5 : 85 2f __ STA P2 
12c7 : a9 00 __ LDA #$00
12c9 : 85 30 __ STA P3 
12cb : a9 03 __ LDA #$03
12cd : 85 31 __ STA P4 
12cf : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
12d2 : a9 40 __ LDA #$40
12d4 : 85 2e __ STA P1 
12d6 : a9 01 __ LDA #$01
12d8 : 85 2f __ STA P2 
12da : 85 31 __ STA P4 
12dc : a9 08 __ LDA #$08
12de : 85 30 __ STA P3 
12e0 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
12e3 : a9 01 __ LDA #$01
12e5 : 85 2e __ STA P1 
12e7 : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
12ea : a9 00 __ LDA #$00
12ec : 85 2d __ STA P0 
12ee : 85 30 __ STA P3 
12f0 : 85 33 __ STA P6 
12f2 : a9 39 __ LDA #$39
12f4 : 85 2e __ STA P1 
12f6 : a9 08 __ LDA #$08
12f8 : 85 34 __ STA P7 
12fa : a9 00 __ LDA #$00
12fc : 85 31 __ STA P4 
12fe : a9 31 __ LDA #$31
1300 : 85 32 __ STA P5 
1302 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
1305 : a9 00 __ LDA #$00
1307 : 85 4e __ STA T1 + 0 
1309 : 85 4f __ STA T2 + 0 
130b : 85 50 __ STA T2 + 1 
130d : a9 02 __ LDA #$02
130f : 85 33 __ STA P6 
1311 : a9 05 __ LDA #$05
1313 : 85 34 __ STA P7 
1315 : a9 03 __ LDA #$03
1317 : 85 32 __ STA P5 
1319 : 18 __ __ CLC
.l1059:
131a : a9 c8 __ LDA #$c8
131c : 85 2e __ STA P1 
131e : a9 09 __ LDA #$09
1320 : 85 2f __ STA P2 
1322 : a9 00 __ LDA #$00
1324 : 85 30 __ STA P3 
1326 : a9 03 __ LDA #$03
1328 : 85 31 __ STA P4 
132a : a5 4e __ LDA T1 + 0 
132c : 69 39 __ ADC #$39
132e : 85 2d __ STA P0 
1330 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1333 : a9 20 __ LDA #$20
1335 : 85 2e __ STA P1 
1337 : a9 01 __ LDA #$01
1339 : 85 2f __ STA P2 
133b : 38 __ __ SEC
133c : a5 4f __ LDA T2 + 0 
133e : e9 60 __ SBC #$60
1340 : 85 30 __ STA P3 
1342 : a5 50 __ LDA T2 + 1 
1344 : e9 00 __ SBC #$00
1346 : 85 31 __ STA P4 
1348 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
134b : 18 __ __ CLC
134c : a5 4f __ LDA T2 + 0 
134e : 69 40 __ ADC #$40
1350 : 85 4f __ STA T2 + 0 
1352 : 90 02 __ BCC $1356 ; (SetUpSprites.s1062 + 0)
.s1061:
1354 : e6 50 __ INC T2 + 1 
.s1062:
1356 : e6 4e __ INC T1 + 0 
1358 : a5 4e __ LDA T1 + 0 
135a : c9 07 __ CMP #$07
135c : 90 bc __ BCC $131a ; (SetUpSprites.l1059 + 0)
.s98:
135e : a9 00 __ LDA #$00
1360 : 85 2d __ STA P0 
1362 : 85 30 __ STA P3 
1364 : 85 33 __ STA P6 
1366 : a9 49 __ LDA #$49
1368 : 85 2e __ STA P1 
136a : a9 08 __ LDA #$08
136c : 85 34 __ STA P7 
136e : a9 00 __ LDA #$00
1370 : 85 31 __ STA P4 
1372 : a9 39 __ LDA #$39
1374 : 85 32 __ STA P5 
1376 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
1379 : a9 47 __ LDA #$47
137b : 85 2d __ STA P0 
137d : a9 48 __ LDA #$48
137f : 85 2e __ STA P1 
1381 : a9 0a __ LDA #$0a
1383 : 85 2f __ STA P2 
1385 : a9 03 __ LDA #$03
1387 : 85 31 __ STA P4 
1389 : 85 32 __ STA P5 
138b : a9 07 __ LDA #$07
138d : 85 33 __ STA P6 
138f : a9 06 __ LDA #$06
1391 : 85 34 __ STA P7 
1393 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1396 : a9 08 __ LDA #$08
1398 : 85 2e __ STA P1 
139a : 85 30 __ STA P3 
139c : a9 00 __ LDA #$00
139e : 85 2f __ STA P2 
13a0 : 85 31 __ STA P4 
13a2 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
13a5 : a9 48 __ LDA #$48
13a7 : 85 2d __ STA P0 
13a9 : 85 2e __ STA P1 
13ab : a9 0a __ LDA #$0a
13ad : 85 2f __ STA P2 
13af : a9 00 __ LDA #$00
13b1 : 85 30 __ STA P3 
13b3 : a9 03 __ LDA #$03
13b5 : 85 31 __ STA P4 
13b7 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
13ba : a9 00 __ LDA #$00
13bc : 85 2f __ STA P2 
13be : 85 31 __ STA P4 
13c0 : a9 08 __ LDA #$08
13c2 : 85 30 __ STA P3 
13c4 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
13c7 : a9 01 __ LDA #$01
13c9 : 85 2e __ STA P1 
13cb : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
13ce : a9 49 __ LDA #$49
13d0 : 85 2d __ STA P0 
13d2 : a9 48 __ LDA #$48
13d4 : 85 2e __ STA P1 
13d6 : a9 0a __ LDA #$0a
13d8 : 85 2f __ STA P2 
13da : a9 00 __ LDA #$00
13dc : 85 30 __ STA P3 
13de : a9 03 __ LDA #$03
13e0 : 85 31 __ STA P4 
13e2 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
13e5 : a9 00 __ LDA #$00
13e7 : 85 2f __ STA P2 
13e9 : 85 31 __ STA P4 
13eb : a9 48 __ LDA #$48
13ed : 85 30 __ STA P3 
13ef : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
13f2 : a9 01 __ LDA #$01
13f4 : 85 2e __ STA P1 
13f6 : 85 2f __ STA P2 
13f8 : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
13fb : a9 4a __ LDA #$4a
13fd : 85 2d __ STA P0 
13ff : a9 48 __ LDA #$48
1401 : 85 2e __ STA P1 
1403 : a9 0a __ LDA #$0a
1405 : 85 2f __ STA P2 
1407 : a9 00 __ LDA #$00
1409 : 85 30 __ STA P3 
140b : a9 03 __ LDA #$03
140d : 85 31 __ STA P4 
140f : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1412 : a9 08 __ LDA #$08
1414 : 85 2e __ STA P1 
1416 : a9 00 __ LDA #$00
1418 : 85 2f __ STA P2 
141a : 85 31 __ STA P4 
141c : a9 48 __ LDA #$48
141e : 85 30 __ STA P3 
1420 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1423 : a9 00 __ LDA #$00
1425 : 85 2e __ STA P1 
1427 : a9 01 __ LDA #$01
1429 : 85 2f __ STA P2 
142b : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
142e : a9 00 __ LDA #$00
1430 : 85 2d __ STA P0 
1432 : 85 30 __ STA P3 
1434 : a9 49 __ LDA #$49
1436 : 85 2e __ STA P1 
1438 : a9 00 __ LDA #$00
143a : 85 31 __ STA P4 
143c : a9 39 __ LDA #$39
143e : 85 32 __ STA P5 
1440 : a9 00 __ LDA #$00
1442 : 85 33 __ STA P6 
1444 : a9 08 __ LDA #$08
1446 : 85 34 __ STA P7 
1448 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
144b : a9 4b __ LDA #$4b
144d : 85 2d __ STA P0 
144f : a9 48 __ LDA #$48
1451 : 85 2e __ STA P1 
1453 : a9 0a __ LDA #$0a
1455 : 85 2f __ STA P2 
1457 : a9 03 __ LDA #$03
1459 : 85 31 __ STA P4 
145b : 85 32 __ STA P5 
145d : a9 07 __ LDA #$07
145f : 85 33 __ STA P6 
1461 : a9 06 __ LDA #$06
1463 : 85 34 __ STA P7 
1465 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1468 : a9 f8 __ LDA #$f8
146a : 85 2e __ STA P1 
146c : a9 01 __ LDA #$01
146e : 85 2f __ STA P2 
1470 : a9 08 __ LDA #$08
1472 : 85 30 __ STA P3 
1474 : a9 00 __ LDA #$00
1476 : 85 31 __ STA P4 
1478 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
147b : a9 4c __ LDA #$4c
147d : 85 2d __ STA P0 
147f : a9 48 __ LDA #$48
1481 : 85 2e __ STA P1 
1483 : a9 0a __ LDA #$0a
1485 : 85 2f __ STA P2 
1487 : a9 00 __ LDA #$00
1489 : 85 30 __ STA P3 
148b : a9 03 __ LDA #$03
148d : 85 31 __ STA P4 
148f : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
1492 : a9 38 __ LDA #$38
1494 : 85 2e __ STA P1 
1496 : a9 02 __ LDA #$02
1498 : 85 2f __ STA P2 
149a : a9 08 __ LDA #$08
149c : 85 30 __ STA P3 
149e : a9 00 __ LDA #$00
14a0 : 85 31 __ STA P4 
14a2 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
14a5 : a9 01 __ LDA #$01
14a7 : 85 2e __ STA P1 
14a9 : a9 00 __ LDA #$00
14ab : 85 2f __ STA P2 
14ad : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
14b0 : a9 4d __ LDA #$4d
14b2 : 85 2d __ STA P0 
14b4 : a9 48 __ LDA #$48
14b6 : 85 2e __ STA P1 
14b8 : a9 0a __ LDA #$0a
14ba : 85 2f __ STA P2 
14bc : a9 00 __ LDA #$00
14be : 85 30 __ STA P3 
14c0 : a9 03 __ LDA #$03
14c2 : 85 31 __ STA P4 
14c4 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
14c7 : a9 38 __ LDA #$38
14c9 : 85 2e __ STA P1 
14cb : a9 02 __ LDA #$02
14cd : 85 2f __ STA P2 
14cf : a9 48 __ LDA #$48
14d1 : 85 30 __ STA P3 
14d3 : a9 00 __ LDA #$00
14d5 : 85 31 __ STA P4 
14d7 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
14da : a9 01 __ LDA #$01
14dc : 85 2e __ STA P1 
14de : 85 2f __ STA P2 
14e0 : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
14e3 : a9 4e __ LDA #$4e
14e5 : 85 2d __ STA P0 
14e7 : a9 48 __ LDA #$48
14e9 : 85 2e __ STA P1 
14eb : a9 0a __ LDA #$0a
14ed : 85 2f __ STA P2 
14ef : a9 00 __ LDA #$00
14f1 : 85 30 __ STA P3 
14f3 : a9 03 __ LDA #$03
14f5 : 85 31 __ STA P4 
14f7 : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
14fa : a9 f8 __ LDA #$f8
14fc : 85 2e __ STA P1 
14fe : a9 01 __ LDA #$01
1500 : 85 2f __ STA P2 
1502 : a9 48 __ LDA #$48
1504 : 85 30 __ STA P3 
1506 : a9 00 __ LDA #$00
1508 : 85 31 __ STA P4 
150a : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
150d : a9 00 __ LDA #$00
150f : 85 2e __ STA P1 
1511 : 20 7e 18 JSR $187e ; (vera_spr_flip.s0 + 0)
1514 : a9 40 __ LDA #$40
1516 : 85 2d __ STA P0 
1518 : a9 53 __ LDA #$53
151a : 85 2e __ STA P1 
151c : a9 00 __ LDA #$00
151e : 85 30 __ STA P3 
1520 : 85 33 __ STA P6 
1522 : a9 02 __ LDA #$02
1524 : 85 34 __ STA P7 
1526 : a9 00 __ LDA #$00
1528 : 85 31 __ STA P4 
152a : a9 41 __ LDA #$41
152c : 85 32 __ STA P5 
152e : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
1531 : a9 80 __ LDA #$80
1533 : 85 2d __ STA P0 
1535 : 85 33 __ STA P6 
1537 : a9 52 __ LDA #$52
1539 : 85 2e __ STA P1 
153b : a9 00 __ LDA #$00
153d : 85 34 __ STA P7 
153f : a9 00 __ LDA #$00
1541 : 85 31 __ STA P4 
1543 : a9 43 __ LDA #$43
1545 : 85 32 __ STA P5 
1547 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
154a : a9 00 __ LDA #$00
154c : 85 4d __ STA T0 + 0 
154e : a9 0a __ LDA #$0a
1550 : 85 2f __ STA P2 
1552 : a9 02 __ LDA #$02
1554 : 85 33 __ STA P6 
1556 : a9 08 __ LDA #$08
1558 : 85 34 __ STA P7 
.l100:
155a : a9 94 __ LDA #$94
155c : 85 2e __ STA P1 
155e : a9 01 __ LDA #$01
1560 : 85 31 __ STA P4 
1562 : 85 32 __ STA P5 
1564 : 18 __ __ CLC
1565 : a5 4d __ LDA T0 + 0 
1567 : 69 4f __ ADC #$4f
1569 : 85 2d __ STA P0 
156b : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
156e : a5 4d __ LDA T0 + 0 
1570 : c9 1f __ CMP #$1f
1572 : d0 0d __ BNE $1581 ; (SetUpSprites.s228 + 0)
.s103:
1574 : a9 9a __ LDA #$9a
1576 : 85 2e __ STA P1 
1578 : a9 02 __ LDA #$02
157a : 85 31 __ STA P4 
157c : 85 32 __ STA P5 
157e : 20 e8 17 JSR $17e8 ; (vera_spr_set.s0 + 0)
.s228:
1581 : e6 4d __ INC T0 + 0 
1583 : a5 4d __ LDA T0 + 0 
1585 : c9 20 __ CMP #$20
1587 : 90 d1 __ BCC $155a ; (SetUpSprites.l100 + 0)
.s102:
1589 : a9 20 __ LDA #$20
158b : 85 37 __ STA P10 
158d : a9 40 __ LDA #$40
158f : 8d fc 9e STA $9efc ; (sstack + 0)
1592 : a9 fa __ LDA #$fa
1594 : 8d fd 9e STA $9efd ; (sstack + 1)
1597 : a9 01 __ LDA #$01
1599 : 8d fe 9e STA $9efe ; (sstack + 2)
159c : a9 00 __ LDA #$00
159e : 8d ff 9e STA $9eff ; (sstack + 3)
15a1 : a9 80 __ LDA #$80
15a3 : 85 35 __ STA P8 
15a5 : a9 43 __ LDA #$43
15a7 : 85 36 __ STA P9 
15a9 : 20 04 19 JSR $1904 ; (SetPaletteColours.s0 + 0)
15ac : a9 60 __ LDA #$60
15ae : 8d fc 9e STA $9efc ; (sstack + 0)
15b1 : a9 fa __ LDA #$fa
15b3 : 8d fd 9e STA $9efd ; (sstack + 1)
15b6 : a9 01 __ LDA #$01
15b8 : 8d fe 9e STA $9efe ; (sstack + 2)
15bb : a9 00 __ LDA #$00
15bd : 8d ff 9e STA $9eff ; (sstack + 3)
15c0 : a9 a0 __ LDA #$a0
15c2 : 85 35 __ STA P8 
15c4 : a9 43 __ LDA #$43
15c6 : 85 36 __ STA P9 
15c8 : 20 04 19 JSR $1904 ; (SetPaletteColours.s0 + 0)
15cb : a9 80 __ LDA #$80
15cd : 8d fc 9e STA $9efc ; (sstack + 0)
15d0 : a9 fa __ LDA #$fa
15d2 : 8d fd 9e STA $9efd ; (sstack + 1)
15d5 : a9 01 __ LDA #$01
15d7 : 8d fe 9e STA $9efe ; (sstack + 2)
15da : a9 00 __ LDA #$00
15dc : 8d ff 9e STA $9eff ; (sstack + 3)
15df : a9 c0 __ LDA #$c0
15e1 : 85 35 __ STA P8 
15e3 : a9 43 __ LDA #$43
15e5 : 85 36 __ STA P9 
15e7 : 20 04 19 JSR $1904 ; (SetPaletteColours.s0 + 0)
15ea : a9 60 __ LDA #$60
15ec : 85 2d __ STA P0 
15ee : a9 20 __ LDA #$20
15f0 : 85 30 __ STA P3 
15f2 : a9 00 __ LDA #$00
15f4 : 85 31 __ STA P4 
15f6 : a9 e5 __ LDA #$e5
15f8 : 85 2e __ STA P1 
15fa : a9 26 __ LDA #$26
15fc : 85 2f __ STA P2 
15fe : 20 bb 18 JSR $18bb ; (vera_pal_putn.s0 + 0)
1601 : a9 70 __ LDA #$70
1603 : 85 2d __ STA P0 
1605 : a9 0c __ LDA #$0c
1607 : 85 30 __ STA P3 
1609 : a9 00 __ LDA #$00
160b : 85 31 __ STA P4 
160d : a9 f1 __ LDA #$f1
160f : 85 2e __ STA P1 
1611 : a9 26 __ LDA #$26
1613 : 85 2f __ STA P2 
1615 : 20 bb 18 JSR $18bb ; (vera_pal_putn.s0 + 0)
1618 : a9 80 __ LDA #$80
161a : 85 2d __ STA P0 
161c : a9 20 __ LDA #$20
161e : 85 30 __ STA P3 
1620 : a9 00 __ LDA #$00
1622 : 85 31 __ STA P4 
1624 : a9 e0 __ LDA #$e0
1626 : 85 2e __ STA P1 
1628 : a9 43 __ LDA #$43
162a : 85 2f __ STA P2 
162c : 20 bb 18 JSR $18bb ; (vera_pal_putn.s0 + 0)
162f : a9 90 __ LDA #$90
1631 : 85 2d __ STA P0 
1633 : a9 10 __ LDA #$10
1635 : 85 30 __ STA P3 
1637 : a9 00 __ LDA #$00
1639 : 85 31 __ STA P4 
163b : a9 00 __ LDA #$00
163d : 85 2e __ STA P1 
163f : a9 44 __ LDA #$44
1641 : 85 2f __ STA P2 
1643 : 20 bb 18 JSR $18bb ; (vera_pal_putn.s0 + 0)
1646 : a9 a0 __ LDA #$a0
1648 : 85 2d __ STA P0 
164a : a9 1a __ LDA #$1a
164c : 85 30 __ STA P3 
164e : a9 00 __ LDA #$00
1650 : 85 31 __ STA P4 
1652 : a9 10 __ LDA #$10
1654 : 85 2e __ STA P1 
1656 : a9 44 __ LDA #$44
1658 : 85 2f __ STA P2 
165a : 20 bb 18 JSR $18bb ; (vera_pal_putn.s0 + 0)
165d : a9 00 __ LDA #$00
165f : 85 2d __ STA P0 
1661 : 85 30 __ STA P3 
1663 : 85 33 __ STA P6 
1665 : a9 45 __ LDA #$45
1667 : 85 2e __ STA P1 
1669 : a9 01 __ LDA #$01
166b : 85 2f __ STA P2 
166d : a9 04 __ LDA #$04
166f : 85 34 __ STA P7 
1671 : a9 2a __ LDA #$2a
1673 : 85 31 __ STA P4 
1675 : a9 44 __ LDA #$44
1677 : 85 32 __ STA P5 
1679 : 20 86 17 JSR $1786 ; (vram_putn.s0 + 0)
167c : a9 03 __ LDA #$03
167e : 85 32 __ STA P5 
1680 : 85 34 __ STA P7 
1682 : a9 08 __ LDA #$08
1684 : 85 33 __ STA P6 
1686 : a9 40 __ LDA #$40
1688 : 85 35 __ STA P8 
168a : a9 5b __ LDA #$5b
168c : 85 36 __ STA P9 
168e : a9 01 __ LDA #$01
1690 : 85 37 __ STA P10 
1692 : a9 00 __ LDA #$00
1694 : 85 38 __ STA P11 
1696 : a9 fe __ LDA #$fe
1698 : 8d fc 9e STA $9efc ; (sstack + 0)
169b : a9 3f __ LDA #$3f
169d : 8d fd 9e STA $9efd ; (sstack + 1)
16a0 : a9 65 __ LDA #$65
16a2 : 85 30 __ STA P3 
16a4 : a9 1a __ LDA #$1a
16a6 : 85 31 __ STA P4 
16a8 : 20 2b 19 JSR $192b ; (LoadSprite.s0 + 0)
16ab : ad 29 9f LDA $9f29 
16ae : 09 70 __ ORA #$70
16b0 : 8d 29 9f STA $9f29 
.s1001:
16b3 : 60 __ __ RTS
.s1032:
16b4 : c9 34 __ CMP #$34
16b6 : 90 05 __ BCC $16bd ; (SetUpSprites.s1031 + 0)
.s29:
16b8 : a9 09 __ LDA #$09
16ba : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1031:
16bd : a9 2c __ LDA #$2c
16bf : c5 25 __ CMP WORK + 2 
16c1 : 90 40 __ BCC $1703 ; (SetUpSprites.s1024 + 0)
.s1030:
16c3 : a5 4f __ LDA T2 + 0 
16c5 : c9 09 __ CMP #$09
16c7 : 90 06 __ BCC $16cf ; (SetUpSprites.s35 + 0)
.s1029:
16c9 : a9 45 __ LDA #$45
16cb : c5 4f __ CMP T2 + 0 
16cd : b0 05 __ BCS $16d4 ; (SetUpSprites.s1028 + 0)
.s35:
16cf : a9 00 __ LDA #$00
16d1 : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1028:
16d4 : a5 4f __ LDA T2 + 0 
16d6 : c9 13 __ CMP #$13
16d8 : 90 06 __ BCC $16e0 ; (SetUpSprites.s39 + 0)
.s1027:
16da : a9 3b __ LDA #$3b
16dc : c5 4f __ CMP T2 + 0 
16de : b0 04 __ BCS $16e4 ; (SetUpSprites.s1026 + 0)
.s39:
16e0 : a9 01 __ LDA #$01
16e2 : d0 12 __ BNE $16f6 ; (SetUpSprites.s236 + 0)
.s1026:
16e4 : a5 4f __ LDA T2 + 0 
16e6 : c9 1d __ CMP #$1d
16e8 : 90 06 __ BCC $16f0 ; (SetUpSprites.s43 + 0)
.s1025:
16ea : a9 31 __ LDA #$31
16ec : c5 4f __ CMP T2 + 0 
16ee : b0 04 __ BCS $16f4 ; (SetUpSprites.s44 + 0)
.s43:
16f0 : a9 02 __ LDA #$02
16f2 : d0 02 __ BNE $16f6 ; (SetUpSprites.s236 + 0)
.s44:
16f4 : a9 03 __ LDA #$03
.s236:
16f6 : 8d 23 9f STA $9f23 
16f9 : a9 00 __ LDA #$00
16fb : 8d 23 9f STA $9f23 
16fe : e6 4f __ INC T2 + 0 
1700 : 4c 7c 0e JMP $0e7c ; (SetUpSprites.l14 + 0)
.s1024:
1703 : a9 2f __ LDA #$2f
1705 : c5 25 __ CMP WORK + 2 
1707 : a5 4f __ LDA T2 + 0 
1709 : 90 33 __ BCC $173e ; (SetUpSprites.s1017 + 0)
.s1023:
170b : c9 09 __ CMP #$09
170d : 90 06 __ BCC $1715 ; (SetUpSprites.s51 + 0)
.s1022:
170f : a9 45 __ LDA #$45
1711 : c5 4f __ CMP T2 + 0 
1713 : b0 05 __ BCS $171a ; (SetUpSprites.s1021 + 0)
.s51:
1715 : a9 05 __ LDA #$05
1717 : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1021:
171a : a5 4f __ LDA T2 + 0 
171c : c9 13 __ CMP #$13
171e : 90 06 __ BCC $1726 ; (SetUpSprites.s55 + 0)
.s1020:
1720 : a9 3b __ LDA #$3b
1722 : c5 4f __ CMP T2 + 0 
1724 : b0 04 __ BCS $172a ; (SetUpSprites.s1019 + 0)
.s55:
1726 : a9 06 __ LDA #$06
1728 : d0 cc __ BNE $16f6 ; (SetUpSprites.s236 + 0)
.s1019:
172a : a5 4f __ LDA T2 + 0 
172c : c9 1d __ CMP #$1d
172e : 90 06 __ BCC $1736 ; (SetUpSprites.s59 + 0)
.s1018:
1730 : a9 31 __ LDA #$31
1732 : c5 4f __ CMP T2 + 0 
1734 : b0 04 __ BCS $173a ; (SetUpSprites.s60 + 0)
.s59:
1736 : a9 07 __ LDA #$07
1738 : d0 bc __ BNE $16f6 ; (SetUpSprites.s236 + 0)
.s60:
173a : a9 08 __ LDA #$08
173c : d0 b8 __ BNE $16f6 ; (SetUpSprites.s236 + 0)
.s1017:
173e : c9 09 __ CMP #$09
1740 : 90 06 __ BCC $1748 ; (SetUpSprites.s63 + 0)
.s1016:
1742 : a9 45 __ LDA #$45
1744 : c5 4f __ CMP T2 + 0 
1746 : b0 05 __ BCS $174d ; (SetUpSprites.s1005 + 0)
.s63:
1748 : a9 0c __ LDA #$0c
174a : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1005:
174d : a5 4f __ LDA T2 + 0 
174f : c9 13 __ CMP #$13
1751 : 90 06 __ BCC $1759 ; (SetUpSprites.s67 + 0)
.s1004:
1753 : a9 3b __ LDA #$3b
1755 : c5 4f __ CMP T2 + 0 
1757 : b0 04 __ BCS $175d ; (SetUpSprites.s71 + 0)
.s67:
1759 : a9 0d __ LDA #$0d
175b : d0 99 __ BNE $16f6 ; (SetUpSprites.s236 + 0)
.s71:
175d : a9 0e __ LDA #$0e
175f : d0 95 __ BNE $16f6 ; (SetUpSprites.s236 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1761 : 46 2d __ LSR P0 ; (bank + 0)
1763 : a9 00 __ LDA #$00
1765 : 6a __ __ ROR
1766 : 85 3b __ STA ACCU + 0 
1768 : a5 2f __ LDA P2 ; (mem + 1)
176a : 29 f8 __ AND #$f8
176c : 4a __ __ LSR
176d : 05 3b __ ORA ACCU + 0 
176f : 85 3b __ STA ACCU + 0 
1771 : a5 30 __ LDA P3 ; (height + 0)
1773 : 0a __ __ ASL
1774 : 05 3b __ ORA ACCU + 0 
1776 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1778 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1779 : 46 2d __ LSR P0 ; (bank + 0)
177b : a9 00 __ LDA #$00
177d : 6a __ __ ROR
177e : 85 3b __ STA ACCU + 0 
1780 : a5 2f __ LDA P2 ; (mem + 1)
1782 : 4a __ __ LSR
1783 : 05 3b __ ORA ACCU + 0 
.s1001:
1785 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1786 : ad 25 9f LDA $9f25 
1789 : 29 fe __ AND #$fe
178b : 8d 25 9f STA $9f25 
178e : a5 2d __ LDA P0 ; (addr + 0)
1790 : 8d 20 9f STA $9f20 
1793 : a5 2e __ LDA P1 ; (addr + 1)
1795 : 8d 21 9f STA $9f21 
1798 : a5 2f __ LDA P2 ; (addr + 2)
179a : 29 01 __ AND #$01
179c : 09 10 __ ORA #$10
179e : 8d 22 9f STA $9f22 
17a1 : a5 33 __ LDA P6 ; (size + 0)
17a3 : 05 34 __ ORA P7 ; (size + 1)
17a5 : f0 19 __ BEQ $17c0 ; (vram_putn.s1001 + 0)
.s6:
17a7 : a0 00 __ LDY #$00
17a9 : a6 33 __ LDX P6 ; (size + 0)
17ab : f0 02 __ BEQ $17af ; (vram_putn.l1002 + 0)
.s1005:
17ad : e6 34 __ INC P7 ; (size + 1)
.l1002:
17af : b1 31 __ LDA (P4),y ; (data + 0)
17b1 : 8d 23 9f STA $9f23 
17b4 : c8 __ __ INY
17b5 : d0 02 __ BNE $17b9 ; (vram_putn.s1009 + 0)
.s1008:
17b7 : e6 32 __ INC P5 ; (data + 1)
.s1009:
17b9 : ca __ __ DEX
17ba : d0 f3 __ BNE $17af ; (vram_putn.l1002 + 0)
.s1004:
17bc : c6 34 __ DEC P7 ; (size + 1)
17be : d0 ef __ BNE $17af ; (vram_putn.l1002 + 0)
.s1001:
17c0 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
20e3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20f3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2103 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2113 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2123 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2133 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2143 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2153 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2163 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2173 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2183 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
2193 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
21a3 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
21b3 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
21c3 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
21d3 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
21e3 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
21f3 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
2203 : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
2213 : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
2223 : __ __ __ BYT 55 55 55 55 55 55 55 55 aa aa aa aa aa aa aa aa : UUUUUUUU........
2233 : __ __ __ BYT aa aa aa aa aa aa aa aa 88 88 88 88 88 88 88 88 : ................
2243 : __ __ __ BYT 88 88 88 88 88 88 88 88 77 77 77 77 77 77 77 77 : ........wwwwwwww
2253 : __ __ __ BYT cc cc cc cc cc cc cc cc 00 00 00 00 00 00 00 00 : ................
2263 : __ __ __ BYT 05 00 00 50 00 09 90 00 00 9b b9 00 09 b5 5b 90 : ...P..........[.
2273 : __ __ __ BYT 09 b5 5b 90 00 9b b9 05 00 09 90 00 05 00 00 00 : ..[.............
2283 : __ __ __ BYT 13 11 11 11 11 11 11 31 11 19 91 11 11 9b b9 11 : .......1........
2293 : __ __ __ BYT 11 9b b9 11 11 19 91 13 11 11 11 11 13 11 11 11 : ................
22a3 : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 19 91 11 : ................
22b3 : __ __ __ BYT 11 19 91 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
--------------------------------------------------------------------
rand:
.s0:
17c1 : ad c4 22 LDA $22c4 ; (seed + 1)
17c4 : 4a __ __ LSR
17c5 : ad c3 22 LDA $22c3 ; (seed + 0)
17c8 : 6a __ __ ROR
17c9 : aa __ __ TAX
17ca : a9 00 __ LDA #$00
17cc : 6a __ __ ROR
17cd : 4d c3 22 EOR $22c3 ; (seed + 0)
17d0 : 85 3b __ STA ACCU + 0 
17d2 : 8a __ __ TXA
17d3 : 4d c4 22 EOR $22c4 ; (seed + 1)
17d6 : 85 3c __ STA ACCU + 1 
17d8 : 4a __ __ LSR
17d9 : 45 3b __ EOR ACCU + 0 
17db : 8d c3 22 STA $22c3 ; (seed + 0)
17de : 85 3b __ STA ACCU + 0 
17e0 : 45 3c __ EOR ACCU + 1 
17e2 : 8d c4 22 STA $22c4 ; (seed + 1)
17e5 : 85 3c __ STA ACCU + 1 
.s1001:
17e7 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
22c3 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
22c5 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
22d5 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
22e5 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
22f5 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
2305 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
2315 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
2325 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
2335 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
2345 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
2355 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
2365 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
2375 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
2385 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
2395 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
23a5 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
23b5 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
23c5 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
23d5 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
23e5 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
23f5 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
2405 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
2415 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
2425 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
2435 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
2445 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
2455 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
2465 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
2475 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
2485 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
2495 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
24a5 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
24b5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
24c5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24d5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24e5 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
24f5 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
2505 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2515 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2525 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
2535 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
2545 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
2555 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
2565 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2575 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2585 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
2595 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
25a5 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
25b5 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
25c5 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
25d5 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
25e5 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
25f5 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2605 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2615 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2625 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2635 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2645 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
2655 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
2665 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
2675 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
2685 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
2695 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
26a5 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
26b5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
17e8 : ad 25 9f LDA $9f25 
17eb : 29 fe __ AND #$fe
17ed : 8d 25 9f STA $9f25 
17f0 : a5 2d __ LDA P0 ; (spr + 0)
17f2 : 0a __ __ ASL
17f3 : 0a __ __ ASL
17f4 : 85 3b __ STA ACCU + 0 
17f6 : a9 3f __ LDA #$3f
17f8 : 2a __ __ ROL
17f9 : 06 3b __ ASL ACCU + 0 
17fb : 2a __ __ ROL
17fc : 8d 21 9f STA $9f21 
17ff : a5 3b __ LDA ACCU + 0 
1801 : 8d 20 9f STA $9f20 
1804 : a9 11 __ LDA #$11
1806 : 8d 22 9f STA $9f22 
1809 : a5 30 __ LDA P3 ; (mode8 + 0)
180b : f0 02 __ BEQ $180f ; (vera_spr_set.s11 + 0)
.s9:
180d : a9 80 __ LDA #$80
.s11:
180f : 05 2f __ ORA P2 ; (addr32 + 1)
1811 : a6 2e __ LDX P1 ; (addr32 + 0)
1813 : 8e 23 9f STX $9f23 
1816 : 8d 23 9f STA $9f23 
1819 : a9 00 __ LDA #$00
181b : 8d 23 9f STA $9f23 
181e : 8d 23 9f STA $9f23 
1821 : 8d 23 9f STA $9f23 
1824 : 8d 23 9f STA $9f23 
1827 : a5 33 __ LDA P6 ; (z + 0)
1829 : 0a __ __ ASL
182a : 0a __ __ ASL
182b : 8d 23 9f STA $9f23 
182e : a5 32 __ LDA P5 ; (h + 0)
1830 : 4a __ __ LSR
1831 : 6a __ __ ROR
1832 : 29 80 __ AND #$80
1834 : 6a __ __ ROR
1835 : 85 3b __ STA ACCU + 0 
1837 : a5 31 __ LDA P4 ; (w + 0)
1839 : 0a __ __ ASL
183a : 0a __ __ ASL
183b : 0a __ __ ASL
183c : 0a __ __ ASL
183d : 05 3b __ ORA ACCU + 0 
183f : 05 34 __ ORA P7 ; (pal + 0)
1841 : 8d 23 9f STA $9f23 
.s1001:
1844 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1845 : ad 25 9f LDA $9f25 
1848 : 29 fe __ AND #$fe
184a : 8d 25 9f STA $9f25 
184d : a5 2d __ LDA P0 ; (spr + 0)
184f : 0a __ __ ASL
1850 : 0a __ __ ASL
1851 : 85 3b __ STA ACCU + 0 
1853 : a9 3f __ LDA #$3f
1855 : 2a __ __ ROL
1856 : 06 3b __ ASL ACCU + 0 
1858 : 2a __ __ ROL
1859 : aa __ __ TAX
185a : a5 3b __ LDA ACCU + 0 
185c : 09 02 __ ORA #$02
185e : 8d 20 9f STA $9f20 
1861 : 8e 21 9f STX $9f21 
1864 : a9 11 __ LDA #$11
1866 : 8d 22 9f STA $9f22 
1869 : a5 2e __ LDA P1 ; (x + 0)
186b : 8d 23 9f STA $9f23 
186e : a5 2f __ LDA P2 ; (x + 1)
1870 : 8d 23 9f STA $9f23 
1873 : a5 30 __ LDA P3 ; (y + 0)
1875 : 8d 23 9f STA $9f23 
1878 : a5 31 __ LDA P4 ; (y + 1)
187a : 8d 23 9f STA $9f23 
.s1001:
187d : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2710 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2720 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2730 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2740 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2750 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2760 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2770 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2780 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2790 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
27a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
27b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
27c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
27d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
27e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
27f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2810 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2820 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2830 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2840 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2850 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2860 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2870 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2880 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2890 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
28a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
28b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
28c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
28d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
28e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
28f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2900 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2910 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2920 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2930 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2940 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2950 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2960 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2970 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2980 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2990 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
29a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
29b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
29c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
29d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
29e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
29f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_spr_flip:
.s0:
187e : ad 25 9f LDA $9f25 
1881 : 29 fe __ AND #$fe
1883 : 8d 25 9f STA $9f25 
1886 : a5 2d __ LDA P0 ; (spr + 0)
1888 : 0a __ __ ASL
1889 : 0a __ __ ASL
188a : 85 3b __ STA ACCU + 0 
188c : a9 3f __ LDA #$3f
188e : 2a __ __ ROL
188f : 06 3b __ ASL ACCU + 0 
1891 : 2a __ __ ROL
1892 : aa __ __ TAX
1893 : a5 3b __ LDA ACCU + 0 
1895 : 09 06 __ ORA #$06
1897 : 8d 20 9f STA $9f20 
189a : 8e 21 9f STX $9f21 
189d : a9 01 __ LDA #$01
189f : 8d 22 9f STA $9f22 
18a2 : ad 23 9f LDA $9f23 
18a5 : 29 fc __ AND #$fc
18a7 : a8 __ __ TAY
18a8 : a5 2e __ LDA P1 ; (fliph + 0)
18aa : f0 01 __ BEQ $18ad ; (vera_spr_flip.s14 + 0)
.s6:
18ac : c8 __ __ INY
.s14:
18ad : a5 2f __ LDA P2 ; (flipv + 0)
18af : f0 05 __ BEQ $18b6 ; (vera_spr_flip.s11 + 0)
.s9:
18b1 : 98 __ __ TYA
18b2 : 09 02 __ ORA #$02
18b4 : d0 01 __ BNE $18b7 ; (vera_spr_flip.s1002 + 0)
.s11:
18b6 : 98 __ __ TYA
.s1002:
18b7 : 8d 23 9f STA $9f23 
.s1001:
18ba : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
18bb : ad 25 9f LDA $9f25 
18be : 29 fe __ AND #$fe
18c0 : 8d 25 9f STA $9f25 
18c3 : a5 2d __ LDA P0 ; (index + 0)
18c5 : 0a __ __ ASL
18c6 : 8d 20 9f STA $9f20 
18c9 : a9 7d __ LDA #$7d
18cb : 2a __ __ ROL
18cc : 8d 21 9f STA $9f21 
18cf : a9 11 __ LDA #$11
18d1 : 8d 22 9f STA $9f22 
18d4 : a5 30 __ LDA P3 ; (size + 0)
18d6 : 05 31 __ ORA P4 ; (size + 1)
18d8 : f0 29 __ BEQ $1903 ; (vera_pal_putn.s1001 + 0)
.s6:
18da : a6 30 __ LDX P3 ; (size + 0)
18dc : f0 02 __ BEQ $18e0 ; (vera_pal_putn.l3 + 0)
.s1003:
18de : e6 31 __ INC P4 ; (size + 1)
.l3:
18e0 : a0 01 __ LDY #$01
18e2 : b1 2e __ LDA (P1),y ; (color + 0)
18e4 : 85 3c __ STA ACCU + 1 
18e6 : 88 __ __ DEY
18e7 : b1 2e __ LDA (P1),y ; (color + 0)
18e9 : 8d 23 9f STA $9f23 
18ec : a5 3c __ LDA ACCU + 1 
18ee : 8d 23 9f STA $9f23 
18f1 : 18 __ __ CLC
18f2 : a5 2e __ LDA P1 ; (color + 0)
18f4 : 69 02 __ ADC #$02
18f6 : 85 2e __ STA P1 ; (color + 0)
18f8 : 90 02 __ BCC $18fc ; (vera_pal_putn.s1007 + 0)
.s1006:
18fa : e6 2f __ INC P2 ; (color + 1)
.s1007:
18fc : ca __ __ DEX
18fd : d0 e1 __ BNE $18e0 ; (vera_pal_putn.l3 + 0)
.s1002:
18ff : c6 31 __ DEC P4 ; (size + 1)
1901 : d0 dd __ BNE $18e0 ; (vera_pal_putn.l3 + 0)
.s1001:
1903 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
26c5 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
26d5 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2a50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2a60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2a70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2a80 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2a90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2aa0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2ab0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2ac0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2ad0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2ae0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2af0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2b00 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2b10 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2b20 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2b30 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2b40 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2b50 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2b60 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2b70 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2b80 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2b90 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2ba0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2bb0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2bc0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2bd0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2be0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2bf0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
2c00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2c10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2c20 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2c30 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2c40 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2c50 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2c60 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2c70 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2c80 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2c90 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
2ca0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
2cb0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
2cc0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
2cd0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
2ce0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
2cf0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2d10 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2d30 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2d40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2d50 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2d60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2d70 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2d80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2d90 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2da0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2db0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2dc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2dd0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2de0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2df0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2e00 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2e10 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2e20 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2e30 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2e40 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2e50 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2e60 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2e70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2e80 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2e90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2ea0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2eb0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2ec0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2ed0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2ee0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2ef0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2f00 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2f10 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2f20 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2f30 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2f40 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2f50 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2f60 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2f70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2f80 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2f90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2fa0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2fb0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2fc0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2fd0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2fe0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2ff0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3000 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
3010 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3020 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
3030 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
3040 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
3050 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
3060 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3070 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
3080 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3090 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
30a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
30b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
30c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
30d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
30e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
30f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
3100 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3110 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3120 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3130 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3140 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3150 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3160 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3170 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3180 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3190 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
31a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
31b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
31c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
31d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
31e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
31f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3200 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3210 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3220 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3230 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3240 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3250 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3260 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3270 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3280 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3290 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
32a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
32b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
32c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
32d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
32e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
32f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
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
3500 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3510 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3520 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3530 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3540 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3550 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3560 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3570 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3580 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3590 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
35a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
35b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
35c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
35d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
35e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
35f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3600 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3610 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3620 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3630 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3640 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3650 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3660 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3670 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3680 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3690 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
36a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
36b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
36c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
36d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
36e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
36f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
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
--------------------------------------------------------------------
CharBox:
3900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3910 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3920 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3930 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3940 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3950 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3960 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3970 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3980 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3990 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
39a0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
39b0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
39c0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
39d0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
39e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3a00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3a20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3a40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3a60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3a80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3aa0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ab0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3ac0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ad0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
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
3d10 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3d20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d30 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3d40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d50 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3d60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d70 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3d80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d90 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3da0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3db0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3dc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3dd0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3de0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3df0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3e00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e10 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3e20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e30 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3e40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e50 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3e60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e70 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3e80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3e90 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ea0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3eb0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ec0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ed0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
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
--------------------------------------------------------------------
WavyHead:
4100 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
4110 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4120 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4130 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4140 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4150 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4160 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
4170 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4180 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4190 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
41a0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
41b0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
41c0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
41d0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
41e0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
41f0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4200 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4210 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4220 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4230 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4240 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4250 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4260 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4270 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4280 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4290 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
42a0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
42b0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
42c0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
42d0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
42e0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
42f0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
4300 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
4310 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
4320 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
4330 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
4340 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
4350 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
4360 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
4370 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1904 : ad fc 9e LDA $9efc ; (sstack + 0)
1907 : 85 2d __ STA P0 
1909 : ad fd 9e LDA $9efd ; (sstack + 1)
190c : 85 2e __ STA P1 
190e : ad fe 9e LDA $9efe ; (sstack + 2)
1911 : 85 2f __ STA P2 
1913 : ad ff 9e LDA $9eff ; (sstack + 3)
1916 : 85 30 __ STA P3 
1918 : a5 35 __ LDA P8 ; (input + 0)
191a : 85 31 __ STA P4 
191c : a5 36 __ LDA P9 ; (input + 1)
191e : 85 32 __ STA P5 
1920 : a5 37 __ LDA P10 ; (inputsize + 0)
1922 : 85 33 __ STA P6 
1924 : a9 00 __ LDA #$00
1926 : 85 34 __ STA P7 
1928 : 4c 86 17 JMP $1786 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
4380 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
4390 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
43a0 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
43b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
43c0 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
43d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
26e5 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
26f1 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
43e0 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
43f0 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
4400 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
4410 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
4420 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
EyeTri:
442a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
443a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
444a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
445a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
446a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
447a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
448a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
449a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
44aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
44ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
44ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
450a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
451a : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
452a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
453a : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
454a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
455a : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
456a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
457a : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
458a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
459a : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
45aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45ba : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
45ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45da : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
45ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
45fa : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
460a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
461a : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
462a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
463a : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
464a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
465a : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
466a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
467a : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
468a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
469a : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
46aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
46ba : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
46ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
46da : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
46ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
46fa : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
470a : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
471a : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
472a : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
473a : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
474a : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
475a : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
476a : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
477a : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
478a : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
479a : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
47aa : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
47ba : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
47ca : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
47da : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
47ea : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
47fa : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
480a : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
481a : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
192b : a5 30 __ LDA P3 ; (name + 0)
192d : 85 2d __ STA P0 
192f : a5 31 __ LDA P4 ; (name + 1)
1931 : 85 2e __ STA P1 
1933 : 20 9e 19 JSR $199e ; (krnio_setnam.s0 + 0)
1936 : a5 32 __ LDA P5 ; (fnum + 0)
1938 : 85 2d __ STA P0 
193a : a5 33 __ LDA P6 ; (device + 0)
193c : 85 2e __ STA P1 
193e : a5 34 __ LDA P7 ; (channel + 0)
1940 : 85 2f __ STA P2 
1942 : 20 b4 19 JSR $19b4 ; (krnio_open.s0 + 0)
1945 : ad fd 9e LDA $9efd ; (sstack + 1)
1948 : 85 4a __ STA T0 + 1 
194a : ad fc 9e LDA $9efc ; (sstack + 0)
194d : 85 49 __ STA T0 + 0 
194f : 05 4a __ ORA T0 + 1 
1951 : f0 46 __ BEQ $1999 ; (LoadSprite.s4 + 0)
.s8:
1953 : a9 00 __ LDA #$00
1955 : 85 4b __ STA T2 + 0 
1957 : 85 4c __ STA T2 + 1 
.l2:
1959 : a5 32 __ LDA P5 ; (fnum + 0)
195b : 85 2e __ STA P1 
195d : 20 dc 19 JSR $19dc ; (krnio_getch.s0 + 0)
1960 : ad 25 9f LDA $9f25 
1963 : 29 fe __ AND #$fe
1965 : 8d 25 9f STA $9f25 
1968 : 18 __ __ CLC
1969 : a5 4b __ LDA T2 + 0 
196b : 65 35 __ ADC P8 ; (Addr + 0)
196d : 8d 20 9f STA $9f20 
1970 : a5 4c __ LDA T2 + 1 
1972 : 65 36 __ ADC P9 ; (Addr + 1)
1974 : 8d 21 9f STA $9f21 
1977 : a9 00 __ LDA #$00
1979 : 65 37 __ ADC P10 ; (Addr + 2)
197b : 29 01 __ AND #$01
197d : 09 10 __ ORA #$10
197f : 8d 22 9f STA $9f22 
1982 : a5 3b __ LDA ACCU + 0 
1984 : 8d 23 9f STA $9f23 
1987 : e6 4b __ INC T2 + 0 
1989 : d0 02 __ BNE $198d ; (LoadSprite.s1005 + 0)
.s1004:
198b : e6 4c __ INC T2 + 1 
.s1005:
198d : a5 4c __ LDA T2 + 1 
198f : c5 4a __ CMP T0 + 1 
1991 : d0 04 __ BNE $1997 ; (LoadSprite.s1003 + 0)
.s1002:
1993 : a5 4b __ LDA T2 + 0 
1995 : c5 49 __ CMP T0 + 0 
.s1003:
1997 : 90 c0 __ BCC $1959 ; (LoadSprite.l2 + 0)
.s4:
1999 : a5 32 __ LDA P5 ; (fnum + 0)
199b : 4c 5d 1a JMP $1a5d ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
199e : a5 2d __ LDA P0 
19a0 : 05 2e __ ORA P1 
19a2 : f0 08 __ BEQ $19ac ; (krnio_setnam.s0 + 14)
19a4 : a0 ff __ LDY #$ff
19a6 : c8 __ __ INY
19a7 : b1 2d __ LDA (P0),y 
19a9 : d0 fb __ BNE $19a6 ; (krnio_setnam.s0 + 8)
19ab : 98 __ __ TYA
19ac : a6 2d __ LDX P0 
19ae : a4 2e __ LDY P1 
19b0 : 20 bd ff JSR $ffbd 
.s1001:
19b3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
19b4 : a9 00 __ LDA #$00
19b6 : a6 2d __ LDX P0 ; (fnum + 0)
19b8 : 9d a1 48 STA $48a1,x ; (krnio_pstatus + 0)
19bb : a9 00 __ LDA #$00
19bd : 85 3b __ STA ACCU + 0 
19bf : 85 3c __ STA ACCU + 1 
19c1 : a5 2d __ LDA P0 ; (fnum + 0)
19c3 : a6 2e __ LDX P1 
19c5 : a4 2f __ LDY P2 
19c7 : 20 ba ff JSR $ffba 
19ca : 20 c0 ff JSR $ffc0 
19cd : 90 08 __ BCC $19d7 ; (krnio_open.s0 + 35)
19cf : a5 2d __ LDA P0 ; (fnum + 0)
19d1 : 20 c3 ff JSR $ffc3 
19d4 : 4c db 19 JMP $19db ; (krnio_open.s1001 + 0)
19d7 : a9 01 __ LDA #$01
19d9 : 85 3b __ STA ACCU + 0 
.s1001:
19db : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
48a1 : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_getch:
.s0:
19dc : a4 2e __ LDY P1 ; (fnum + 0)
19de : b9 a1 48 LDA $48a1,y ; (krnio_pstatus + 0)
19e1 : c9 40 __ CMP #$40
19e3 : f0 48 __ BEQ $1a2d ; (krnio_getch.s1007 + 0)
.s3:
19e5 : a9 ff __ LDA #$ff
19e7 : 85 47 __ STA T3 + 0 
19e9 : 85 48 __ STA T3 + 1 
19eb : 98 __ __ TYA
19ec : 20 33 1a JSR $1a33 ; (krnio_chkin.s1000 + 0)
19ef : a5 3b __ LDA ACCU + 0 
19f1 : f0 19 __ BEQ $1a0c ; (krnio_getch.s7 + 0)
.s5:
19f3 : 20 45 1a JSR $1a45 ; (krnio_chrin.s0 + 0)
19f6 : a5 3b __ LDA ACCU + 0 
19f8 : 85 47 __ STA T3 + 0 
19fa : a5 3c __ LDA ACCU + 1 
19fc : 85 48 __ STA T3 + 1 
19fe : 20 4f 1a JSR $1a4f ; (krnio_status.s0 + 0)
1a01 : a5 3b __ LDA ACCU + 0 
1a03 : a6 2e __ LDX P1 ; (fnum + 0)
1a05 : 9d a1 48 STA $48a1,x ; (krnio_pstatus + 0)
1a08 : 09 00 __ ORA #$00
1a0a : d0 0c __ BNE $1a18 ; (krnio_getch.s8 + 0)
.s7:
1a0c : 20 59 1a JSR $1a59 ; (krnio_clrchn.s0 + 0)
1a0f : a5 47 __ LDA T3 + 0 
1a11 : 85 3b __ STA ACCU + 0 
1a13 : a5 48 __ LDA T3 + 1 
.s1006:
1a15 : 85 3c __ STA ACCU + 1 
.s1001:
1a17 : 60 __ __ RTS
.s8:
1a18 : c9 40 __ CMP #$40
1a1a : d0 0e __ BNE $1a2a ; (krnio_getch.s12 + 0)
.s11:
1a1c : 20 59 1a JSR $1a59 ; (krnio_clrchn.s0 + 0)
1a1f : a5 48 __ LDA T3 + 1 
1a21 : 09 01 __ ORA #$01
1a23 : 85 3c __ STA ACCU + 1 
1a25 : a5 47 __ LDA T3 + 0 
1a27 : 85 3b __ STA ACCU + 0 
1a29 : 60 __ __ RTS
.s12:
1a2a : 20 59 1a JSR $1a59 ; (krnio_clrchn.s0 + 0)
.s1007:
1a2d : a9 ff __ LDA #$ff
1a2f : 85 3b __ STA ACCU + 0 
1a31 : d0 e2 __ BNE $1a15 ; (krnio_getch.s1006 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a33 : 85 2d __ STA P0 
.s0:
1a35 : a6 2d __ LDX P0 
1a37 : 20 c6 ff JSR $ffc6 
1a3a : a9 00 __ LDA #$00
1a3c : 85 3c __ STA ACCU + 1 
1a3e : b0 02 __ BCS $1a42 ; (krnio_chkin.s0 + 13)
1a40 : a9 01 __ LDA #$01
1a42 : 85 3b __ STA ACCU + 0 
.s1001:
1a44 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a45 : 20 cf ff JSR $ffcf 
1a48 : 85 3b __ STA ACCU + 0 
1a4a : a9 00 __ LDA #$00
1a4c : 85 3c __ STA ACCU + 1 
.s1001:
1a4e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1a4f : 20 b7 ff JSR $ffb7 
1a52 : 85 3b __ STA ACCU + 0 
1a54 : a9 00 __ LDA #$00
1a56 : 85 3c __ STA ACCU + 1 
.s1001:
1a58 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1a59 : 20 cc ff JSR $ffcc 
.s1001:
1a5c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1a5d : 85 2d __ STA P0 
.s0:
1a5f : a5 2d __ LDA P0 
1a61 : 20 c3 ff JSR $ffc3 
.s1001:
1a64 : 60 __ __ RTS
--------------------------------------------------------------------
1a65 : __ __ __ BYT 40 30 3a 73 70 72 69 74 65 73 2f 62 69 6e 2f 43 : @0:sprites/bin/C
1a75 : __ __ __ BYT 52 49 53 50 59 2e 42 49 4e 2c 50 2c 52 00       : RISPY.BIN,P,R.
--------------------------------------------------------------------
BGPal:
482a : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
483a : __ __ __ BYT 99 09 9b 0f bb 0b ee 0f 44 04 ff 0f ff 0f ff 0f : ........D.......
--------------------------------------------------------------------
getchx:
.s0:
1a83 : 20 8d 1a JSR $1a8d ; (getpch + 0)
1a86 : 85 3b __ STA ACCU + 0 
1a88 : a9 00 __ LDA #$00
1a8a : 85 3c __ STA ACCU + 1 
.s1001:
1a8c : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1a8d : 20 e4 ff JSR $ffe4 
1a90 : ae fd 26 LDX $26fd ; (giocharmap + 0)
1a93 : e0 01 __ CPX #$01
1a95 : 90 26 __ BCC $1abd ; (getpch + 48)
1a97 : c9 0d __ CMP #$0d
1a99 : d0 02 __ BNE $1a9d ; (getpch + 16)
1a9b : a9 0a __ LDA #$0a
1a9d : e0 02 __ CPX #$02
1a9f : 90 1c __ BCC $1abd ; (getpch + 48)
1aa1 : c9 db __ CMP #$db
1aa3 : b0 18 __ BCS $1abd ; (getpch + 48)
1aa5 : c9 41 __ CMP #$41
1aa7 : 90 14 __ BCC $1abd ; (getpch + 48)
1aa9 : c9 c1 __ CMP #$c1
1aab : 90 02 __ BCC $1aaf ; (getpch + 34)
1aad : 49 a0 __ EOR #$a0
1aaf : c9 7b __ CMP #$7b
1ab1 : b0 0a __ BCS $1abd ; (getpch + 48)
1ab3 : c9 61 __ CMP #$61
1ab5 : b0 04 __ BCS $1abb ; (getpch + 46)
1ab7 : c9 5b __ CMP #$5b
1ab9 : b0 02 __ BCS $1abd ; (getpch + 48)
1abb : 49 20 __ EOR #$20
1abd : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
26fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
26fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
484a : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
484c : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
484e : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1abe : a9 33 __ LDA #$33
1ac0 : 85 2d __ STA P0 
1ac2 : a9 38 __ LDA #$38
1ac4 : 85 2e __ STA P1 
1ac6 : a9 01 __ LDA #$01
1ac8 : 85 2f __ STA P2 
1aca : a6 32 __ LDX P5 ; (p + 0)
1acc : bd 00 49 LDA $4900,x ; (sintab + 0)
1acf : 4a __ __ LSR
1ad0 : 4a __ __ LSR
1ad1 : 4a __ __ LSR
1ad2 : 49 10 __ EOR #$10
1ad4 : 38 __ __ SEC
1ad5 : e9 10 __ SBC #$10
1ad7 : 18 __ __ CLC
1ad8 : 69 b4 __ ADC #$b4
1ada : 85 30 __ STA P3 
1adc : a9 00 __ LDA #$00
1ade : 85 31 __ STA P4 
1ae0 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1ae3 : a9 34 __ LDA #$34
1ae5 : 85 2d __ STA P0 
1ae7 : a9 20 __ LDA #$20
1ae9 : 85 2e __ STA P1 
1aeb : a6 34 __ LDX P7 ; (p2 + 0)
1aed : bd 00 49 LDA $4900,x ; (sintab + 0)
1af0 : 4a __ __ LSR
1af1 : 4a __ __ LSR
1af2 : 4a __ __ LSR
1af3 : 49 10 __ EOR #$10
1af5 : 38 __ __ SEC
1af6 : e9 10 __ SBC #$10
1af8 : 18 __ __ CLC
1af9 : 69 b4 __ ADC #$b4
1afb : 85 30 __ STA P3 
1afd : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1b00 : a9 35 __ LDA #$35
1b02 : 85 2d __ STA P0 
1b04 : a9 00 __ LDA #$00
1b06 : 85 2e __ STA P1 
1b08 : a6 36 __ LDX P9 ; (p3 + 0)
1b0a : bd 00 49 LDA $4900,x ; (sintab + 0)
1b0d : 4a __ __ LSR
1b0e : 4a __ __ LSR
1b0f : 4a __ __ LSR
1b10 : 49 10 __ EOR #$10
1b12 : 38 __ __ SEC
1b13 : e9 10 __ SBC #$10
1b15 : 18 __ __ CLC
1b16 : 69 a4 __ ADC #$a4
1b18 : 85 30 __ STA P3 
1b1a : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1b1d : a9 36 __ LDA #$36
1b1f : 85 2d __ STA P0 
1b21 : a9 40 __ LDA #$40
1b23 : 85 2e __ STA P1 
1b25 : a6 36 __ LDX P9 ; (p3 + 0)
1b27 : bd 00 49 LDA $4900,x ; (sintab + 0)
1b2a : 4a __ __ LSR
1b2b : 4a __ __ LSR
1b2c : 4a __ __ LSR
1b2d : 49 10 __ EOR #$10
1b2f : 38 __ __ SEC
1b30 : e9 10 __ SBC #$10
1b32 : 18 __ __ CLC
1b33 : 69 a4 __ ADC #$a4
1b35 : 85 30 __ STA P3 
1b37 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1b3a : a9 37 __ LDA #$37
1b3c : 85 2d __ STA P0 
1b3e : a9 00 __ LDA #$00
1b40 : 85 2e __ STA P1 
1b42 : a6 36 __ LDX P9 ; (p3 + 0)
1b44 : bd 00 49 LDA $4900,x ; (sintab + 0)
1b47 : 4a __ __ LSR
1b48 : 4a __ __ LSR
1b49 : 4a __ __ LSR
1b4a : 49 10 __ EOR #$10
1b4c : 38 __ __ SEC
1b4d : e9 10 __ SBC #$10
1b4f : 18 __ __ CLC
1b50 : 69 c4 __ ADC #$c4
1b52 : 85 30 __ STA P3 
1b54 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1b57 : a9 38 __ LDA #$38
1b59 : 85 2d __ STA P0 
1b5b : a9 40 __ LDA #$40
1b5d : 85 2e __ STA P1 
1b5f : a6 36 __ LDX P9 ; (p3 + 0)
1b61 : bd 00 49 LDA $4900,x ; (sintab + 0)
1b64 : 4a __ __ LSR
1b65 : 4a __ __ LSR
1b66 : 4a __ __ LSR
1b67 : 49 10 __ EOR #$10
1b69 : 38 __ __ SEC
1b6a : e9 10 __ SBC #$10
1b6c : 18 __ __ CLC
1b6d : 69 c4 __ ADC #$c4
1b6f : 85 30 __ STA P3 
1b71 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1b74 : a9 00 __ LDA #$00
1b76 : 85 2d __ STA P0 
1b78 : 85 2f __ STA P2 
1b7a : a9 68 __ LDA #$68
1b7c : 85 2e __ STA P1 
1b7e : a6 36 __ LDX P9 ; (p3 + 0)
1b80 : bd 00 49 LDA $4900,x ; (sintab + 0)
1b83 : 4a __ __ LSR
1b84 : 4a __ __ LSR
1b85 : 4a __ __ LSR
1b86 : 4a __ __ LSR
1b87 : 49 08 __ EOR #$08
1b89 : 38 __ __ SEC
1b8a : e9 08 __ SBC #$08
1b8c : 85 48 __ STA T2 + 0 
1b8e : a9 00 __ LDA #$00
1b90 : e9 00 __ SBC #$00
1b92 : 85 49 __ STA T2 + 1 
1b94 : 38 __ __ SEC
1b95 : a9 b6 __ LDA #$b6
1b97 : e5 48 __ SBC T2 + 0 
1b99 : 85 30 __ STA P3 
1b9b : a9 01 __ LDA #$01
1b9d : e5 49 __ SBC T2 + 1 
1b9f : 85 31 __ STA P4 
1ba1 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1ba4 : a9 01 __ LDA #$01
1ba6 : 85 2d __ STA P0 
1ba8 : 85 2f __ STA P2 
1baa : a9 f0 __ LDA #$f0
1bac : 85 2e __ STA P1 
1bae : a6 36 __ LDX P9 ; (p3 + 0)
1bb0 : bd 00 49 LDA $4900,x ; (sintab + 0)
1bb3 : 4a __ __ LSR
1bb4 : 4a __ __ LSR
1bb5 : 4a __ __ LSR
1bb6 : 4a __ __ LSR
1bb7 : 49 08 __ EOR #$08
1bb9 : 38 __ __ SEC
1bba : e9 08 __ SBC #$08
1bbc : a8 __ __ TAY
1bbd : a9 00 __ LDA #$00
1bbf : e9 00 __ SBC #$00
1bc1 : aa __ __ TAX
1bc2 : 98 __ __ TYA
1bc3 : 18 __ __ CLC
1bc4 : 69 b6 __ ADC #$b6
1bc6 : 85 30 __ STA P3 
1bc8 : 8a __ __ TXA
1bc9 : 69 01 __ ADC #$01
1bcb : 85 31 __ STA P4 
1bcd : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1bd0 : a9 00 __ LDA #$00
1bd2 : 85 47 __ STA T1 + 0 
1bd4 : 18 __ __ CLC
.l2:
1bd5 : a5 47 __ LDA T1 + 0 
1bd7 : 69 4f __ ADC #$4f
1bd9 : 85 2d __ STA P0 
1bdb : a5 47 __ LDA T1 + 0 
1bdd : 0a __ __ ASL
1bde : 65 47 __ ADC T1 + 0 
1be0 : 0a __ __ ASL
1be1 : 0a __ __ ASL
1be2 : 18 __ __ CLC
1be3 : 6d 50 48 ADC $4850 ; (FrameCount + 0)
1be6 : aa __ __ TAX
1be7 : ac 51 48 LDY $4851 ; (FrameCount + 1)
1bea : bd 00 49 LDA $4900,x ; (sintab + 0)
1bed : 10 01 __ BPL $1bf0 ; (MoveSprites.s1008 + 0)
.s1007:
1bef : 88 __ __ DEY
.s1008:
1bf0 : 18 __ __ CLC
1bf1 : 6d 50 48 ADC $4850 ; (FrameCount + 0)
1bf4 : 85 48 __ STA T2 + 0 
1bf6 : 90 01 __ BCC $1bf9 ; (MoveSprites.s1009 + 0)
.s1006:
1bf8 : c8 __ __ INY
.s1009:
1bf9 : 84 49 __ STY T2 + 1 
1bfb : a5 47 __ LDA T1 + 0 
1bfd : 0a __ __ ASL
1bfe : 0a __ __ ASL
1bff : 85 3b __ STA ACCU + 0 
1c01 : a9 00 __ LDA #$00
1c03 : 85 3c __ STA ACCU + 1 
1c05 : a9 80 __ LDA #$80
1c07 : 85 23 __ STA WORK + 0 
1c09 : a9 02 __ LDA #$02
1c0b : 85 24 __ STA WORK + 1 
1c0d : 20 31 20 JSR $2031 ; (divmod + 0)
1c10 : 18 __ __ CLC
1c11 : a5 25 __ LDA WORK + 2 
1c13 : 65 48 __ ADC T2 + 0 
1c15 : 85 2e __ STA P1 
1c17 : a5 26 __ LDA WORK + 3 
1c19 : 65 49 __ ADC T2 + 1 
1c1b : 85 2f __ STA P2 
1c1d : a5 47 __ LDA T1 + 0 
1c1f : 0a __ __ ASL
1c20 : 0a __ __ ASL
1c21 : 65 47 __ ADC T1 + 0 
1c23 : 85 48 __ STA T2 + 0 
1c25 : ad 50 48 LDA $4850 ; (FrameCount + 0)
1c28 : 38 __ __ SEC
1c29 : e9 40 __ SBC #$40
1c2b : 18 __ __ CLC
1c2c : 65 48 __ ADC T2 + 0 
1c2e : aa __ __ TAX
1c2f : bd 00 49 LDA $4900,x ; (sintab + 0)
1c32 : a8 __ __ TAY
1c33 : 29 80 __ AND #$80
1c35 : 10 02 __ BPL $1c39 ; (MoveSprites.s1009 + 64)
1c37 : a9 ff __ LDA #$ff
1c39 : 85 49 __ STA T2 + 1 
1c3b : a5 47 __ LDA T1 + 0 
1c3d : 0a __ __ ASL
1c3e : 0a __ __ ASL
1c3f : 0a __ __ ASL
1c40 : 85 3b __ STA ACCU + 0 
1c42 : ad 50 48 LDA $4850 ; (FrameCount + 0)
1c45 : 38 __ __ SEC
1c46 : e9 20 __ SBC #$20
1c48 : 18 __ __ CLC
1c49 : 65 3b __ ADC ACCU + 0 
1c4b : aa __ __ TAX
1c4c : bd 00 49 LDA $4900,x ; (sintab + 0)
1c4f : 4a __ __ LSR
1c50 : 4a __ __ LSR
1c51 : 4a __ __ LSR
1c52 : 4a __ __ LSR
1c53 : 49 08 __ EOR #$08
1c55 : 38 __ __ SEC
1c56 : e9 08 __ SBC #$08
1c58 : 85 4a __ STA T3 + 0 
1c5a : a9 00 __ LDA #$00
1c5c : e9 00 __ SBC #$00
1c5e : 85 4b __ STA T3 + 1 
1c60 : a5 47 __ LDA T1 + 0 
1c62 : 0a __ __ ASL
1c63 : 65 47 __ ADC T1 + 0 
1c65 : 85 3b __ STA ACCU + 0 
1c67 : a5 47 __ LDA T1 + 0 
1c69 : c9 1f __ CMP #$1f
1c6b : f0 27 __ BEQ $1c94 ; (MoveSprites.s5 + 0)
.s6:
1c6d : 98 __ __ TYA
1c6e : 18 __ __ CLC
1c6f : 69 80 __ ADC #$80
1c71 : 18 __ __ CLC
1c72 : 65 4a __ ADC T3 + 0 
1c74 : a8 __ __ TAY
1c75 : a9 00 __ LDA #$00
1c77 : 65 4b __ ADC T3 + 1 
1c79 : aa __ __ TAX
1c7a : 98 __ __ TYA
1c7b : 18 __ __ CLC
1c7c : 65 3b __ ADC ACCU + 0 
1c7e : 85 30 __ STA P3 
1c80 : 90 01 __ BCC $1c83 ; (MoveSprites.s1013 + 0)
.s1012:
1c82 : e8 __ __ INX
.s1013:
1c83 : 86 31 __ STX P4 
1c85 : 20 45 18 JSR $1845 ; (vera_spr_move.s0 + 0)
1c88 : e6 47 __ INC T1 + 0 
1c8a : a5 47 __ LDA T1 + 0 
1c8c : c9 20 __ CMP #$20
1c8e : b0 03 __ BCS $1c93 ; (MoveSprites.s1001 + 0)
1c90 : 4c d5 1b JMP $1bd5 ; (MoveSprites.l2 + 0)
.s1001:
1c93 : 60 __ __ RTS
.s5:
1c94 : 98 __ __ TYA
1c95 : 18 __ __ CLC
1c96 : 69 78 __ ADC #$78
1c98 : a8 __ __ TAY
1c99 : a5 49 __ LDA T2 + 1 
1c9b : 69 00 __ ADC #$00
1c9d : aa __ __ TAX
1c9e : 98 __ __ TYA
1c9f : 18 __ __ CLC
1ca0 : 65 4a __ ADC T3 + 0 
1ca2 : a8 __ __ TAY
1ca3 : 8a __ __ TXA
1ca4 : 65 4b __ ADC T3 + 1 
1ca6 : aa __ __ TAX
1ca7 : 98 __ __ TYA
1ca8 : 18 __ __ CLC
1ca9 : 65 3b __ ADC ACCU + 0 
1cab : 85 30 __ STA P3 
1cad : 90 01 __ BCC $1cb0 ; (MoveSprites.s1011 + 0)
.s1010:
1caf : e8 __ __ INX
.s1011:
1cb0 : 86 31 __ STX P4 
1cb2 : 4c 45 18 JMP $1845 ; (vera_spr_move.s0 + 0)
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
4850 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1cb5 : a9 08 __ LDA #$08
1cb7 : 8d 2c 9f STA $9f2c 
1cba : a5 33 __ LDA P6 ; (TuneSelection + 1)
1cbc : c5 35 __ CMP P8 ; (LastSong + 1)
1cbe : d0 0d __ BNE $1ccd ; (PlayZSM.s1 + 0)
.s1005:
1cc0 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1cc2 : c5 34 __ CMP P7 ; (LastSong + 0)
1cc4 : d0 07 __ BNE $1ccd ; (PlayZSM.s1 + 0)
.s4:
1cc6 : 20 f9 1c JSR $1cf9 ; (zsm_check.s0 + 0)
1cc9 : 09 00 __ ORA #$00
1ccb : f0 20 __ BEQ $1ced ; (PlayZSM.s1001 + 0)
.s1:
1ccd : a5 33 __ LDA P6 ; (TuneSelection + 1)
1ccf : d0 1c __ BNE $1ced ; (PlayZSM.s1001 + 0)
.s1004:
1cd1 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1cd3 : c9 01 __ CMP #$01
1cd5 : d0 07 __ BNE $1cde ; (PlayZSM.s1003 + 0)
.s6:
1cd7 : a9 1e __ LDA #$1e
1cd9 : a0 4c __ LDY #$4c
1cdb : 4c f2 1c JMP $1cf2 ; (PlayZSM.s18 + 0)
.s1003:
1cde : c9 02 __ CMP #$02
1ce0 : d0 07 __ BNE $1ce9 ; (PlayZSM.s1002 + 0)
.s8:
1ce2 : a9 1e __ LDA #$1e
1ce4 : a0 6a __ LDY #$6a
1ce6 : 4c f2 1c JMP $1cf2 ; (PlayZSM.s18 + 0)
.s1002:
1ce9 : c9 03 __ CMP #$03
1ceb : f0 01 __ BEQ $1cee ; (PlayZSM.s10 + 0)
.s1001:
1ced : 60 __ __ RTS
.s10:
1cee : a9 1e __ LDA #$1e
1cf0 : a0 8f __ LDY #$8f
.s18:
1cf2 : 84 30 __ STY P3 
1cf4 : 85 31 __ STA P4 
1cf6 : 4c fd 1c JMP $1cfd ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1cf9 : ad e1 20 LDA $20e1 ; (zsm_finished + 0)
.s1001:
1cfc : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1cfd : a9 01 __ LDA #$01
1cff : 8d e1 20 STA $20e1 ; (zsm_finished + 0)
1d02 : ad 52 48 LDA $4852 ; (zsm_reading + 0)
1d05 : f0 0a __ BEQ $1d11 ; (zsm_init.s3 + 0)
.s1:
1d07 : a9 02 __ LDA #$02
1d09 : 20 5d 1a JSR $1a5d ; (krnio_close.s1000 + 0)
1d0c : a9 00 __ LDA #$00
1d0e : 8d 52 48 STA $4852 ; (zsm_reading + 0)
.s3:
1d11 : 20 5e 1d JSR $1d5e ; (zsm_silence.s0 + 0)
1d14 : 20 76 1d JSR $1d76 ; (zsm_save_volume.s0 + 0)
1d17 : a9 00 __ LDA #$00
1d19 : 8d 9f 48 STA $489f ; (zsm_pos + 0)
1d1c : 8d a0 48 STA $48a0 ; (zsm_pos + 1)
1d1f : 8d c1 48 STA $48c1 ; (zsm_wpos + 0)
1d22 : 8d c2 48 STA $48c2 ; (zsm_wpos + 1)
1d25 : 8d 9e 48 STA $489e ; (zsm_delay + 0)
1d28 : a5 30 __ LDA P3 ; (fname + 0)
1d2a : 85 2d __ STA P0 
1d2c : a5 31 __ LDA P4 ; (fname + 1)
1d2e : 85 2e __ STA P1 
1d30 : 20 9e 19 JSR $199e ; (krnio_setnam.s0 + 0)
1d33 : a9 02 __ LDA #$02
1d35 : 85 2d __ STA P0 
1d37 : 85 2f __ STA P2 
1d39 : a9 08 __ LDA #$08
1d3b : 85 2e __ STA P1 
1d3d : 20 b4 19 JSR $19b4 ; (krnio_open.s0 + 0)
1d40 : a5 3b __ LDA ACCU + 0 
1d42 : f0 19 __ BEQ $1d5d ; (zsm_init.s1001 + 0)
.s4:
1d44 : a9 01 __ LDA #$01
1d46 : 8d 52 48 STA $4852 ; (zsm_reading + 0)
1d49 : 20 a8 1d JSR $1da8 ; (zsm_fill.s0 + 0)
1d4c : a9 10 __ LDA #$10
1d4e : 8d 9f 48 STA $489f ; (zsm_pos + 0)
1d51 : a9 00 __ LDA #$00
1d53 : 8d a0 48 STA $48a0 ; (zsm_pos + 1)
1d56 : 8d e1 20 STA $20e1 ; (zsm_finished + 0)
1d59 : a9 01 __ LDA #$01
1d5b : 85 3b __ STA ACCU + 0 
.s1001:
1d5d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
4852 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
1d5e : a9 00 __ LDA #$00
1d60 : 85 47 __ STA T0 + 0 
1d62 : a9 08 __ LDA #$08
1d64 : 85 2d __ STA P0 
1d66 : a9 00 __ LDA #$00
.l1006:
1d68 : 85 2e __ STA P1 
1d6a : 20 9e 0d JSR $0d9e ; (sfx_put.l1 + 0)
1d6d : e6 47 __ INC T0 + 0 
1d6f : a5 47 __ LDA T0 + 0 
1d71 : c9 08 __ CMP #$08
1d73 : 90 f3 __ BCC $1d68 ; (zsm_silence.l1006 + 0)
.s1001:
1d75 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1d76 : a0 00 __ LDY #$00
1d78 : 84 3c __ STY ACCU + 1 
1d7a : a2 02 __ LDX #$02
1d7c : 18 __ __ CLC
.l1006:
1d7d : 8a __ __ TXA
1d7e : 09 c0 __ ORA #$c0
1d80 : 8d 20 9f STA $9f20 
1d83 : a5 3c __ LDA ACCU + 1 
1d85 : 09 f9 __ ORA #$f9
1d87 : 8d 21 9f STA $9f21 
1d8a : a9 01 __ LDA #$01
1d8c : 8d 22 9f STA $9f22 
1d8f : ad 23 9f LDA $9f23 
1d92 : 99 b1 48 STA $48b1,y ; (vera_volumes + 0)
1d95 : a9 00 __ LDA #$00
1d97 : 8d 23 9f STA $9f23 
1d9a : 8a __ __ TXA
1d9b : 69 04 __ ADC #$04
1d9d : aa __ __ TAX
1d9e : 90 02 __ BCC $1da2 ; (zsm_save_volume.s1009 + 0)
.s1008:
1da0 : e6 3c __ INC ACCU + 1 
.s1009:
1da2 : c8 __ __ INY
1da3 : c0 10 __ CPY #$10
1da5 : 90 d6 __ BCC $1d7d ; (zsm_save_volume.l1006 + 0)
.s1001:
1da7 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
48b1 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
48c1 : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
1da8 : ad 52 48 LDA $4852 ; (zsm_reading + 0)
1dab : f0 20 __ BEQ $1dcd ; (zsm_fill.s1 + 0)
.s2:
1dad : ad a0 48 LDA $48a0 ; (zsm_pos + 1)
1db0 : 18 __ __ CLC
1db1 : 69 04 __ ADC #$04
1db3 : cd c2 48 CMP $48c2 ; (zsm_wpos + 1)
1db6 : d0 0c __ BNE $1dc4 ; (zsm_fill.s6 + 0)
.s1006:
1db8 : ad c1 48 LDA $48c1 ; (zsm_wpos + 0)
1dbb : cd 9f 48 CMP $489f ; (zsm_pos + 0)
1dbe : d0 04 __ BNE $1dc4 ; (zsm_fill.s6 + 0)
.s5:
1dc0 : a9 00 __ LDA #$00
1dc2 : f0 0b __ BEQ $1dcf ; (zsm_fill.s1008 + 0)
.s6:
1dc4 : a9 02 __ LDA #$02
1dc6 : 20 33 1a JSR $1a33 ; (krnio_chkin.s1000 + 0)
1dc9 : a5 3b __ LDA ACCU + 0 
1dcb : d0 07 __ BNE $1dd4 ; (zsm_fill.s9 + 0)
.s1:
1dcd : a9 ff __ LDA #$ff
.s1008:
1dcf : 85 3b __ STA ACCU + 0 
.s1001:
1dd1 : 85 3c __ STA ACCU + 1 
1dd3 : 60 __ __ RTS
.s9:
1dd4 : a9 00 __ LDA #$00
1dd6 : 85 47 __ STA T1 + 0 
1dd8 : 85 48 __ STA T1 + 1 
1dda : ad a0 48 LDA $48a0 ; (zsm_pos + 1)
1ddd : 18 __ __ CLC
1dde : 69 04 __ ADC #$04
1de0 : cd c2 48 CMP $48c2 ; (zsm_wpos + 1)
1de3 : d0 08 __ BNE $1ded ; (zsm_fill.l13 + 0)
.s1002:
1de5 : ad c1 48 LDA $48c1 ; (zsm_wpos + 0)
1de8 : cd 9f 48 CMP $489f ; (zsm_pos + 0)
1deb : f0 49 __ BEQ $1e36 ; (zsm_fill.s38 + 0)
.l13:
1ded : 20 45 1a JSR $1a45 ; (krnio_chrin.s0 + 0)
1df0 : ad c1 48 LDA $48c1 ; (zsm_wpos + 0)
1df3 : aa __ __ TAX
1df4 : 18 __ __ CLC
1df5 : 69 01 __ ADC #$01
1df7 : 8d c1 48 STA $48c1 ; (zsm_wpos + 0)
1dfa : ad c2 48 LDA $48c2 ; (zsm_wpos + 1)
1dfd : a8 __ __ TAY
1dfe : 69 00 __ ADC #$00
1e00 : 8d c2 48 STA $48c2 ; (zsm_wpos + 1)
1e03 : 8a __ __ TXA
1e04 : 18 __ __ CLC
1e05 : 69 c4 __ ADC #$c4
1e07 : 85 49 __ STA T3 + 0 
1e09 : 98 __ __ TYA
1e0a : 29 03 __ AND #$03
1e0c : 69 59 __ ADC #$59
1e0e : 85 4a __ STA T3 + 1 
1e10 : a5 3b __ LDA ACCU + 0 
1e12 : a0 00 __ LDY #$00
1e14 : 91 49 __ STA (T3 + 0),y 
1e16 : e6 47 __ INC T1 + 0 
1e18 : d0 02 __ BNE $1e1c ; (zsm_fill.s1010 + 0)
.s1009:
1e1a : e6 48 __ INC T1 + 1 
.s1010:
1e1c : 20 4f 1a JSR $1a4f ; (krnio_status.s0 + 0)
1e1f : a5 3b __ LDA ACCU + 0 
1e21 : d0 0e __ BNE $1e31 ; (zsm_fill.s15 + 0)
.s12:
1e23 : ad a0 48 LDA $48a0 ; (zsm_pos + 1)
1e26 : 18 __ __ CLC
1e27 : 69 04 __ ADC #$04
1e29 : cd c2 48 CMP $48c2 ; (zsm_wpos + 1)
1e2c : d0 bf __ BNE $1ded ; (zsm_fill.l13 + 0)
1e2e : 4c e5 1d JMP $1de5 ; (zsm_fill.s1002 + 0)
.s15:
1e31 : a9 00 __ LDA #$00
1e33 : 8d 52 48 STA $4852 ; (zsm_reading + 0)
.s38:
1e36 : 20 59 1a JSR $1a59 ; (krnio_clrchn.s0 + 0)
1e39 : ad 52 48 LDA $4852 ; (zsm_reading + 0)
1e3c : d0 05 __ BNE $1e43 ; (zsm_fill.s21 + 0)
.s19:
1e3e : a9 02 __ LDA #$02
1e40 : 20 5d 1a JSR $1a5d ; (krnio_close.s1000 + 0)
.s21:
1e43 : a5 47 __ LDA T1 + 0 
1e45 : 85 3b __ STA ACCU + 0 
1e47 : a5 48 __ LDA T1 + 1 
1e49 : 4c d1 1d JMP $1dd1 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
1e4c : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1e5c : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1e6a : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1e7a : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1e8a : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
1e8f : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1e9f : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
1eaf : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
LastSelectedSong:
4853 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
4854 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
4856 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
4866 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1eb6 : a9 10 __ LDA #$10
1eb8 : 85 30 __ STA P3 
1eba : a9 00 __ LDA #$00
1ebc : 85 31 __ STA P4 
1ebe : a5 32 __ LDA P5 ; (Palette + 0)
1ec0 : 85 2e __ STA P1 
1ec2 : 85 47 __ STA T0 + 0 
1ec4 : a5 33 __ LDA P6 ; (Palette + 1)
1ec6 : 85 2f __ STA P2 
1ec8 : 85 48 __ STA T0 + 1 
1eca : a5 34 __ LDA P7 ; (index + 0)
1ecc : 85 2d __ STA P0 
1ece : ad fc 9e LDA $9efc ; (sstack + 0)
1ed1 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1ed3 : 0a __ __ ASL
1ed4 : 85 49 __ STA T3 + 0 
1ed6 : ad fd 9e LDA $9efd ; (sstack + 1)
1ed9 : 2a __ __ ROL
1eda : 18 __ __ CLC
1edb : 65 33 __ ADC P6 ; (Palette + 1)
1edd : 85 4a __ STA T3 + 1 
1edf : a4 32 __ LDY P5 ; (Palette + 0)
1ee1 : b1 49 __ LDA (T3 + 0),y 
1ee3 : aa __ __ TAX
1ee4 : c8 __ __ INY
1ee5 : b1 49 __ LDA (T3 + 0),y 
1ee7 : 86 49 __ STX T3 + 0 
1ee9 : 85 4a __ STA T3 + 1 
1eeb : a9 00 __ LDA #$00
1eed : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1eef : ad fe 9e LDA $9efe ; (sstack + 2)
1ef2 : 85 4b __ STA T5 + 0 
1ef4 : 38 __ __ SEC
1ef5 : e9 01 __ SBC #$01
1ef7 : 85 4d __ STA T6 + 0 
1ef9 : ad ff 9e LDA $9eff ; (sstack + 3)
1efc : 85 4c __ STA T5 + 1 
1efe : e9 00 __ SBC #$00
1f00 : 85 4e __ STA T6 + 1 
1f02 : d0 06 __ BNE $1f0a ; (SetPaletteIndex.s5 + 0)
.s1004:
1f04 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1f06 : c5 4d __ CMP T6 + 0 
1f08 : b0 38 __ BCS $1f42 ; (SetPaletteIndex.s4 + 0)
.s5:
1f0a : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1f0c : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1f0e : 18 __ __ CLC
1f0f : a5 32 __ LDA P5 ; (Palette + 0)
1f11 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1f13 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1f15 : a5 33 __ LDA P6 ; (Palette + 1)
1f17 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1f19 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1f1b : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1f1e : a0 02 __ LDY #$02
1f20 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1f22 : a0 00 __ LDY #$00
1f24 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1f26 : a0 03 __ LDY #$03
1f28 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1f2a : a0 01 __ LDY #$01
1f2c : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1f2e : 18 __ __ CLC
1f2f : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1f31 : 69 02 __ ADC #$02
1f33 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1f35 : 90 02 __ BCC $1f39 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1f37 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1f39 : e8 __ __ INX
1f3a : a5 4e __ LDA T6 + 1 
1f3c : d0 e0 __ BNE $1f1e ; (SetPaletteIndex.l2 + 0)
.s1002:
1f3e : e4 4d __ CPX T6 + 0 
1f40 : 90 dc __ BCC $1f1e ; (SetPaletteIndex.l2 + 0)
.s4:
1f42 : a5 4b __ LDA T5 + 0 
1f44 : 0a __ __ ASL
1f45 : aa __ __ TAX
1f46 : a5 4c __ LDA T5 + 1 
1f48 : 2a __ __ ROL
1f49 : a8 __ __ TAY
1f4a : 8a __ __ TXA
1f4b : 38 __ __ SEC
1f4c : e9 02 __ SBC #$02
1f4e : b0 01 __ BCS $1f51 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1f50 : 88 __ __ DEY
.s1010:
1f51 : 18 __ __ CLC
1f52 : 65 47 __ ADC T0 + 0 
1f54 : 85 47 __ STA T0 + 0 
1f56 : 98 __ __ TYA
1f57 : 65 48 __ ADC T0 + 1 
1f59 : 85 48 __ STA T0 + 1 
1f5b : a5 49 __ LDA T3 + 0 
1f5d : a0 00 __ LDY #$00
1f5f : 91 47 __ STA (T0 + 0),y 
1f61 : a5 4a __ LDA T3 + 1 
1f63 : c8 __ __ INY
1f64 : 91 47 __ STA (T0 + 0),y 
1f66 : 4c bb 18 JMP $18bb ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
4876 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4878 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4888 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
4898 : __ __ __ BYT 03                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
1f69 : ad 25 9f LDA $9f25 
1f6c : 29 fe __ AND #$fe
1f6e : 8d 25 9f STA $9f25 
1f71 : a9 00 __ LDA #$00
1f73 : 8d 20 9f STA $9f20 
1f76 : a9 b0 __ LDA #$b0
1f78 : 8d 21 9f STA $9f21 
1f7b : a9 11 __ LDA #$11
1f7d : 8d 22 9f STA $9f22 
1f80 : a2 80 __ LDX #$80
1f82 : a9 00 __ LDA #$00
.l1002:
1f84 : 8d 23 9f STA $9f23 
1f87 : 8d 23 9f STA $9f23 
1f8a : ca __ __ DEX
1f8b : d0 f7 __ BNE $1f84 ; (ResetChars.l1002 + 0)
.s1001:
1f8d : 60 __ __ RTS
--------------------------------------------------------------------
off1:
4899 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
1f8e : a5 31 __ LDA P4 ; (Input + 0)
1f90 : c9 20 __ CMP #$20
1f92 : d0 1c __ BNE $1fb0 ; (Control.s1007 + 0)
.s1:
1f94 : a5 30 __ LDA P3 ; (playing + 0)
1f96 : d0 0a __ BNE $1fa2 ; (Control.s4 + 0)
.s5:
1f98 : a9 01 __ LDA #$01
1f9a : 20 04 20 JSR $2004 ; (zsm_irq_play.s0 + 0)
1f9d : a9 01 __ LDA #$01
.s1001:
1f9f : 85 3b __ STA ACCU + 0 
1fa1 : 60 __ __ RTS
.s4:
1fa2 : a9 00 __ LDA #$00
1fa4 : cd 9b 48 CMP $489b ; (paused + 0)
1fa7 : 2a __ __ ROL
1fa8 : 8d 9b 48 STA $489b ; (paused + 0)
1fab : 85 2f __ STA P2 
1fad : 20 b5 1f JSR $1fb5 ; (zsm_pause.s0 + 0)
.s1007:
1fb0 : a5 30 __ LDA P3 ; (playing + 0)
1fb2 : 4c 9f 1f JMP $1f9f ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
489b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1fb5 : a5 2f __ LDA P2 ; (pause + 0)
1fb7 : d0 0e __ BNE $1fc7 ; (zsm_pause.s4 + 0)
.s8:
1fb9 : ad e2 20 LDA $20e2 ; (zsm_paused + 0)
1fbc : f0 08 __ BEQ $1fc6 ; (zsm_pause.s1001 + 0)
.s5:
1fbe : 20 d7 1f JSR $1fd7 ; (zsm_restore_volume.s0 + 0)
1fc1 : a9 00 __ LDA #$00
1fc3 : 8d e2 20 STA $20e2 ; (zsm_paused + 0)
.s1001:
1fc6 : 60 __ __ RTS
.s4:
1fc7 : ad e2 20 LDA $20e2 ; (zsm_paused + 0)
1fca : d0 fa __ BNE $1fc6 ; (zsm_pause.s1001 + 0)
.s1:
1fcc : a9 01 __ LDA #$01
1fce : 8d e2 20 STA $20e2 ; (zsm_paused + 0)
1fd1 : 20 5e 1d JSR $1d5e ; (zsm_silence.s0 + 0)
1fd4 : 4c 76 1d JMP $1d76 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1fd7 : a0 00 __ LDY #$00
1fd9 : 84 3c __ STY ACCU + 1 
1fdb : a2 02 __ LDX #$02
1fdd : 18 __ __ CLC
.l1006:
1fde : 8a __ __ TXA
1fdf : 09 c0 __ ORA #$c0
1fe1 : 8d 20 9f STA $9f20 
1fe4 : a5 3c __ LDA ACCU + 1 
1fe6 : 09 f9 __ ORA #$f9
1fe8 : 8d 21 9f STA $9f21 
1feb : a9 01 __ LDA #$01
1fed : 8d 22 9f STA $9f22 
1ff0 : b9 b1 48 LDA $48b1,y ; (vera_volumes + 0)
1ff3 : 8d 23 9f STA $9f23 
1ff6 : 8a __ __ TXA
1ff7 : 69 04 __ ADC #$04
1ff9 : aa __ __ TAX
1ffa : 90 02 __ BCC $1ffe ; (zsm_restore_volume.s1009 + 0)
.s1008:
1ffc : e6 3c __ INC ACCU + 1 
.s1009:
1ffe : c8 __ __ INY
1fff : c0 10 __ CPY #$10
2001 : 90 db __ BCC $1fde ; (zsm_restore_volume.l1006 + 0)
.s1001:
2003 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
2004 : 8d e0 20 STA $20e0 ; (zsm_playing + 0)
.s1001:
2007 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4a00 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4a10 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4a20 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4a30 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4a40 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4a50 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4a60 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4a70 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
4a80 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
4a90 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
4aa0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
4ab0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
4ac0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
4ad0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
4ae0 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
4af0 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4b00 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4b10 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4b20 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4b30 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4b40 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4b50 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4b60 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4b70 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
4b80 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
4b90 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
4ba0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
4bb0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4bc0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4bd0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4be0 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4bf0 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4c00 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4c10 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4c20 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4c30 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4c40 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4c50 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4c60 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4c70 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
4c80 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
4c90 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4ca0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4cb0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4cc0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4cd0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4ce0 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4cf0 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4d00 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4d10 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4d20 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4d30 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4d40 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4d50 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4d60 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4d70 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
4d80 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
4d90 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4da0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4db0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4dc0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4dd0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4de0 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4df0 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4e00 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4e10 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4e20 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4e30 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4e40 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4e50 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4e60 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4e70 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4e80 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4e90 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4ea0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4eb0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4ec0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4ed0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4ee0 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4ef0 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4f00 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4f10 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4f20 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4f30 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4f40 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4f50 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4f60 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4f70 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4f80 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f90 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fa0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fb0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fc0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fd0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4fe0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ff0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5000 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5010 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5020 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5030 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5040 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5050 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5060 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5070 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 20 3d 20 3d 20 : MNMNMNMNMNM = = 
5080 : __ __ __ BYT 2d 20 2d 00                                     : - -.
--------------------------------------------------------------------
Song1:
5084 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
5094 : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
50a4 : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
50b4 : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
50c4 : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
50d4 : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
50e4 : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
50f4 : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
5104 : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
5114 : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
5124 : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
5134 : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
5144 : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
5154 : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
5164 : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
5174 : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
5184 : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
5194 : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
51a4 : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
51b4 : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
51c4 : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
51d4 : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
51e4 : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
51f4 : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
5204 : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
5214 : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
5224 : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
5234 : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
5244 : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
5254 : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
5264 : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
5274 : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
5284 : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
5294 : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
52a4 : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
52b4 : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
52c4 : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
52d4 : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
52e4 : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
52f4 : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
5304 : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
5314 : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
5324 : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
5334 : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
5344 : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
5354 : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
5364 : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
5374 : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
5384 : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
5394 : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
53a4 : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
53b4 : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
53c4 : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
53d4 : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
53e4 : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
53f4 : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
5404 : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
5414 : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
5424 : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
5434 : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
5444 : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
5454 : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
5464 : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
5474 : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
5484 : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
5494 : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
54a4 : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
54b4 : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
54c4 : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
54d4 : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
54e4 : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
54f4 : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
5504 : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
5514 : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
5524 : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
5534 : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
5544 : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
5554 : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
5564 : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
5574 : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
5584 : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
5594 : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
55a4 : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
55b4 : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
55c4 : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
55d4 : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
55e4 : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
55f4 : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
5604 : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
5614 : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
5624 : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
5634 : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
5644 : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
5654 : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
5664 : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
5674 : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
5684 : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
5694 : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
56a4 : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
56b4 : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
56c4 : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
56d4 : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
56e4 : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
56f4 : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
5704 : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
5714 : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
5724 : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
5734 : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
5744 : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
5754 : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
5764 : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
5774 : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
5784 : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
5794 : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
57a4 : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
57b4 : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
57c4 : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
57d4 : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
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
frame_wait:
.l1:
2008 : ad 26 9f LDA $9f26 
200b : 0a __ __ ASL
200c : 30 fa __ BMI $2008 ; (frame_wait.l1 + 0)
.l4:
200e : ad 26 9f LDA $9f26 
2011 : 0a __ __ ASL
2012 : 10 fa __ BPL $200e ; (frame_wait.l4 + 0)
.s1001:
2014 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
2015 : 38 __ __ SEC
2016 : a9 00 __ LDA #$00
2018 : e5 3b __ SBC ACCU + 0 
201a : 85 3b __ STA ACCU + 0 
201c : a9 00 __ LDA #$00
201e : e5 3c __ SBC ACCU + 1 
2020 : 85 3c __ STA ACCU + 1 
2022 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
2023 : 38 __ __ SEC
2024 : a9 00 __ LDA #$00
2026 : e5 23 __ SBC WORK + 0 
2028 : 85 23 __ STA WORK + 0 
202a : a9 00 __ LDA #$00
202c : e5 24 __ SBC WORK + 1 
202e : 85 24 __ STA WORK + 1 
2030 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
2031 : a5 3c __ LDA ACCU + 1 
2033 : d0 31 __ BNE $2066 ; (divmod + 53)
2035 : a5 24 __ LDA WORK + 1 
2037 : d0 1e __ BNE $2057 ; (divmod + 38)
2039 : 85 26 __ STA WORK + 3 
203b : a2 04 __ LDX #$04
203d : 06 3b __ ASL ACCU + 0 
203f : 2a __ __ ROL
2040 : c5 23 __ CMP WORK + 0 
2042 : 90 02 __ BCC $2046 ; (divmod + 21)
2044 : e5 23 __ SBC WORK + 0 
2046 : 26 3b __ ROL ACCU + 0 
2048 : 2a __ __ ROL
2049 : c5 23 __ CMP WORK + 0 
204b : 90 02 __ BCC $204f ; (divmod + 30)
204d : e5 23 __ SBC WORK + 0 
204f : 26 3b __ ROL ACCU + 0 
2051 : ca __ __ DEX
2052 : d0 eb __ BNE $203f ; (divmod + 14)
2054 : 85 25 __ STA WORK + 2 
2056 : 60 __ __ RTS
2057 : a5 3b __ LDA ACCU + 0 
2059 : 85 25 __ STA WORK + 2 
205b : a5 3c __ LDA ACCU + 1 
205d : 85 26 __ STA WORK + 3 
205f : a9 00 __ LDA #$00
2061 : 85 3b __ STA ACCU + 0 
2063 : 85 3c __ STA ACCU + 1 
2065 : 60 __ __ RTS
2066 : a5 24 __ LDA WORK + 1 
2068 : d0 1f __ BNE $2089 ; (divmod + 88)
206a : a5 23 __ LDA WORK + 0 
206c : 30 1b __ BMI $2089 ; (divmod + 88)
206e : a9 00 __ LDA #$00
2070 : 85 26 __ STA WORK + 3 
2072 : a2 10 __ LDX #$10
2074 : 06 3b __ ASL ACCU + 0 
2076 : 26 3c __ ROL ACCU + 1 
2078 : 2a __ __ ROL
2079 : c5 23 __ CMP WORK + 0 
207b : 90 02 __ BCC $207f ; (divmod + 78)
207d : e5 23 __ SBC WORK + 0 
207f : 26 3b __ ROL ACCU + 0 
2081 : 26 3c __ ROL ACCU + 1 
2083 : ca __ __ DEX
2084 : d0 f2 __ BNE $2078 ; (divmod + 71)
2086 : 85 25 __ STA WORK + 2 
2088 : 60 __ __ RTS
2089 : a9 00 __ LDA #$00
208b : 85 25 __ STA WORK + 2 
208d : 85 26 __ STA WORK + 3 
208f : 84 22 __ STY $22 
2091 : a0 10 __ LDY #$10
2093 : 18 __ __ CLC
2094 : 26 3b __ ROL ACCU + 0 
2096 : 26 3c __ ROL ACCU + 1 
2098 : 26 25 __ ROL WORK + 2 
209a : 26 26 __ ROL WORK + 3 
209c : 38 __ __ SEC
209d : a5 25 __ LDA WORK + 2 
209f : e5 23 __ SBC WORK + 0 
20a1 : aa __ __ TAX
20a2 : a5 26 __ LDA WORK + 3 
20a4 : e5 24 __ SBC WORK + 1 
20a6 : 90 04 __ BCC $20ac ; (divmod + 123)
20a8 : 86 25 __ STX WORK + 2 
20aa : 85 26 __ STA WORK + 3 
20ac : 88 __ __ DEY
20ad : d0 e5 __ BNE $2094 ; (divmod + 99)
20af : 26 3b __ ROL ACCU + 0 
20b1 : 26 3c __ ROL ACCU + 1 
20b3 : a4 22 __ LDY $22 
20b5 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
20b6 : 24 3c __ BIT ACCU + 1 
20b8 : 10 0d __ BPL $20c7 ; (mods16 + 17)
20ba : 20 15 20 JSR $2015 ; (negaccu + 0)
20bd : 24 24 __ BIT WORK + 1 
20bf : 10 0d __ BPL $20ce ; (mods16 + 24)
20c1 : 20 23 20 JSR $2023 ; (negtmp + 0)
20c4 : 4c 31 20 JMP $2031 ; (divmod + 0)
20c7 : 24 24 __ BIT WORK + 1 
20c9 : 10 f9 __ BPL $20c4 ; (mods16 + 14)
20cb : 20 23 20 JSR $2023 ; (negtmp + 0)
20ce : 20 31 20 JSR $2031 ; (divmod + 0)
20d1 : 38 __ __ SEC
20d2 : a9 00 __ LDA #$00
20d4 : e5 25 __ SBC WORK + 2 
20d6 : 85 25 __ STA WORK + 2 
20d8 : a9 00 __ LDA #$00
20da : e5 26 __ SBC WORK + 3 
20dc : 85 26 __ STA WORK + 3 
20de : 60 __ __ RTS
