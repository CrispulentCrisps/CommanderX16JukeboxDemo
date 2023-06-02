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
080e : 8e d0 1f STX $1fd0 ; (spentry + 0)
0811 : a9 c4 __ LDA #$c4
0813 : 85 39 __ STA IP + 0 
0815 : a9 58 __ LDA #$58
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 5d __ LDA #$5d
081c : e9 58 __ SBC #$58
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
1fd0 : __ __ __ BYT 00                                              : .
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
08e6 : a9 47 __ LDA #$47
08e8 : 85 36 __ STA P9 
08ea : 20 dd 18 JSR $18dd ; (SetPaletteColours.s0 + 0)
08ed : a9 00 __ LDA #$00
08ef : 85 4f __ STA T1 + 0 
08f1 : 85 50 __ STA T1 + 1 
08f3 : 85 51 __ STA T2 + 0 
08f5 : 85 52 __ STA T3 + 0 
08f7 : 85 53 __ STA T4 + 0 
.l3:
08f9 : 20 04 19 JSR $1904 ; (getchx.s0 + 0)
08fc : a5 3b __ LDA ACCU + 0 
08fe : 85 54 __ STA T5 + 0 
0900 : a9 30 __ LDA #$30
0902 : 8d 2c 9f STA $9f2c 
0905 : ee f7 25 INC $25f7 ; (p + 0)
0908 : d0 03 __ BNE $090d ; (main.s1021 + 0)
.s1020:
090a : ee f8 25 INC $25f8 ; (p + 1)
.s1021:
090d : ad f9 25 LDA $25f9 ; (Phase + 0)
0910 : 18 __ __ CLC
0911 : 69 01 __ ADC #$01
0913 : 85 32 __ STA P5 
0915 : 8d f9 25 STA $25f9 ; (Phase + 0)
0918 : ad fa 25 LDA $25fa ; (Phase + 1)
091b : 69 00 __ ADC #$00
091d : 85 33 __ STA P6 
091f : 8d fa 25 STA $25fa ; (Phase + 1)
0922 : ad fb 25 LDA $25fb ; (Phase2 + 0)
0925 : 18 __ __ CLC
0926 : 69 01 __ ADC #$01
0928 : 85 34 __ STA P7 
092a : 8d fb 25 STA $25fb ; (Phase2 + 0)
092d : ad fc 25 LDA $25fc ; (Phase2 + 1)
0930 : 69 00 __ ADC #$00
0932 : 85 35 __ STA P8 
0934 : 8d fc 25 STA $25fc ; (Phase2 + 1)
0937 : ad fd 25 LDA $25fd ; (Phase3 + 0)
093a : 18 __ __ CLC
093b : 69 01 __ ADC #$01
093d : 85 36 __ STA P9 
093f : 8d fd 25 STA $25fd ; (Phase3 + 0)
0942 : ad fe 25 LDA $25fe ; (Phase3 + 1)
0945 : 69 00 __ ADC #$00
0947 : 85 37 __ STA P10 
0949 : 8d fe 25 STA $25fe ; (Phase3 + 1)
094c : 20 3f 19 JSR $193f ; (MoveSprites.s0 + 0)
094f : a5 52 __ LDA T3 + 0 
0951 : c9 01 __ CMP #$01
0953 : d0 03 __ BNE $0958 ; (main.s6 + 0)
0955 : 4c b7 0b JMP $0bb7 ; (main.s5 + 0)
.s6:
0958 : a9 00 __ LDA #$00
095a : 8d fb 42 STA $42fb ; (PalTimer + 0)
095d : 8d fc 42 STA $42fc ; (PalTimer + 1)
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
0978 : a9 4a __ LDA #$4a
097a : 85 35 __ STA P8 
097c : a9 47 __ LDA #$47
097e : 85 36 __ STA P9 
0980 : 20 dd 18 JSR $18dd ; (SetPaletteColours.s0 + 0)
.s61:
0983 : e6 53 __ INC T4 + 0 
0985 : a9 02 __ LDA #$02
0987 : c5 53 __ CMP T4 + 0 
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
09a9 : a9 b6 __ LDA #$b6
09ab : 85 32 __ STA P5 
09ad : a9 25 __ LDA #$25
09af : 85 33 __ STA P6 
09b1 : 20 a7 1d JSR $1da7 ; (SetPaletteIndex.s0 + 0)
09b4 : a9 00 __ LDA #$00
09b6 : 85 53 __ STA T4 + 0 
.s62:
09b8 : ad fc 42 LDA $42fc ; (PalTimer + 1)
09bb : 30 5f __ BMI $0a1c ; (main.s13 + 0)
.s1014:
09bd : d0 07 __ BNE $09c6 ; (main.s11 + 0)
.s1013:
09bf : a9 03 __ LDA #$03
09c1 : cd fb 42 CMP $42fb ; (PalTimer + 0)
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
09e2 : ee fd 42 INC $42fd ; (PalIndex + 0)
09e5 : d0 03 __ BNE $09ea ; (main.s1025 + 0)
.s1024:
09e7 : ee fe 42 INC $42fe ; (PalIndex + 1)
.s1025:
09ea : a9 c0 __ LDA #$c0
09ec : 85 32 __ STA P5 
09ee : a9 42 __ LDA #$42
09f0 : 85 33 __ STA P6 
09f2 : 20 a7 1d JSR $1da7 ; (SetPaletteIndex.s0 + 0)
09f5 : a9 50 __ LDA #$50
09f7 : 85 34 __ STA P7 
09f9 : a9 00 __ LDA #$00
09fb : 8d fc 9e STA $9efc ; (sstack + 0)
09fe : 8d fd 9e STA $9efd ; (sstack + 1)
0a01 : 8d ff 9e STA $9eff ; (sstack + 3)
0a04 : a9 10 __ LDA #$10
0a06 : 8d fe 9e STA $9efe ; (sstack + 2)
0a09 : a9 6a __ LDA #$6a
0a0b : 85 32 __ STA P5 
0a0d : a9 47 __ LDA #$47
0a0f : 85 33 __ STA P6 
0a11 : 20 a7 1d JSR $1da7 ; (SetPaletteIndex.s0 + 0)
0a14 : a9 00 __ LDA #$00
0a16 : 8d fb 42 STA $42fb ; (PalTimer + 0)
0a19 : 8d fc 42 STA $42fc ; (PalTimer + 1)
.s13:
0a1c : a9 03 __ LDA #$03
0a1e : 8d 2c 9f STA $9f2c 
0a21 : a5 54 __ LDA T5 + 0 
0a23 : c9 44 __ CMP #$44
0a25 : d0 0c __ BNE $0a33 ; (main.s15 + 0)
.s17:
0a27 : a5 51 __ LDA T2 + 0 
0a29 : cd ff 42 CMP $42ff ; (MaxSong + 0)
0a2c : b0 03 __ BCS $0a31 ; (main.s1019 + 0)
0a2e : 4c b2 0b JMP $0bb2 ; (main.s14 + 0)
.s1019:
0a31 : a5 54 __ LDA T5 + 0 
.s15:
0a33 : c9 41 __ CMP #$41
0a35 : d0 23 __ BNE $0a5a ; (main.s16 + 0)
.s1006:
0a37 : a9 01 __ LDA #$01
0a39 : c5 51 __ CMP T2 + 0 
0a3b : b0 1d __ BCS $0a5a ; (main.s16 + 0)
.s18:
0a3d : c6 51 __ DEC T2 + 0 
.s74:
0a3f : 20 5a 1e JSR $1e5a ; (ResetChars.s0 + 0)
0a42 : a9 00 __ LDA #$00
0a44 : 8d 8a 47 STA $478a ; (off1 + 0)
0a47 : 8d 8b 47 STA $478b ; (off1 + 1)
0a4a : a9 80 __ LDA #$80
0a4c : 8d 37 9f STA $9f37 
0a4f : a9 fd __ LDA #$fd
0a51 : 8d 38 9f STA $9f38 
0a54 : a9 00 __ LDA #$00
0a56 : 85 4f __ STA T1 + 0 
0a58 : 85 50 __ STA T1 + 1 
.s16:
0a5a : a5 52 __ LDA T3 + 0 
0a5c : 85 30 __ STA P3 
0a5e : a5 54 __ LDA T5 + 0 
0a60 : 85 31 __ STA P4 
0a62 : 20 7f 1e JSR $1e7f ; (Control.s0 + 0)
0a65 : a5 3b __ LDA ACCU + 0 
0a67 : 85 52 __ STA T3 + 0 
0a69 : 38 __ __ SEC
0a6a : a5 4f __ LDA T1 + 0 
0a6c : e9 80 __ SBC #$80
0a6e : 8d 37 9f STA $9f37 
0a71 : a5 50 __ LDA T1 + 1 
0a73 : e9 02 __ SBC #$02
0a75 : 8d 38 9f STA $9f38 
0a78 : ad f8 42 LDA $42f8 ; (FrameCount + 0)
0a7b : 85 3b __ STA ACCU + 0 
0a7d : ad f9 42 LDA $42f9 ; (FrameCount + 1)
0a80 : 85 3c __ STA ACCU + 1 
0a82 : a9 08 __ LDA #$08
0a84 : 85 23 __ STA WORK + 0 
0a86 : a9 00 __ LDA #$00
0a88 : 85 24 __ STA WORK + 1 
0a8a : 20 a7 1f JSR $1fa7 ; (mods16 + 0)
0a8d : a5 26 __ LDA WORK + 3 
0a8f : f0 03 __ BEQ $0a94 ; (main.s1005 + 0)
0a91 : 4c 83 0b JMP $0b83 ; (main.s24 + 0)
.s1005:
0a94 : a5 25 __ LDA WORK + 2 
0a96 : c9 01 __ CMP #$01
0a98 : f0 03 __ BEQ $0a9d ; (main.s22 + 0)
0a9a : 4c 83 0b JMP $0b83 ; (main.s24 + 0)
.s22:
0a9d : ad 8a 47 LDA $478a ; (off1 + 0)
0aa0 : 85 54 __ STA T5 + 0 
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
0aba : a5 51 __ LDA T2 + 0 
0abc : d0 20 __ BNE $0ade ; (main.s1004 + 0)
.s27:
0abe : a5 54 __ LDA T5 + 0 
0ac0 : 85 3b __ STA ACCU + 0 
0ac2 : ad 8b 47 LDA $478b ; (off1 + 1)
0ac5 : 85 3c __ STA ACCU + 1 
0ac7 : a9 83 __ LDA #$83
0ac9 : 85 23 __ STA WORK + 0 
0acb : a9 06 __ LDA #$06
0acd : 85 24 __ STA WORK + 1 
0acf : 20 22 1f JSR $1f22 ; (divmod + 0)
0ad2 : 18 __ __ CLC
0ad3 : a9 00 __ LDA #$00
0ad5 : 65 25 __ ADC WORK + 2 
0ad7 : 85 47 __ STA T6 + 0 
0ad9 : a9 49 __ LDA #$49
0adb : 4c a7 0b JMP $0ba7 ; (main.s1018 + 0)
.s1004:
0ade : c9 01 __ CMP #$01
0ae0 : d0 20 __ BNE $0b02 ; (main.s1003 + 0)
.s32:
0ae2 : a5 54 __ LDA T5 + 0 
0ae4 : 85 3b __ STA ACCU + 0 
0ae6 : ad 8b 47 LDA $478b ; (off1 + 1)
0ae9 : 85 3c __ STA ACCU + 1 
0aeb : a9 5c __ LDA #$5c
0aed : 85 23 __ STA WORK + 0 
0aef : a9 07 __ LDA #$07
0af1 : 85 24 __ STA WORK + 1 
0af3 : 20 22 1f JSR $1f22 ; (divmod + 0)
0af6 : 18 __ __ CLC
0af7 : a9 84 __ LDA #$84
0af9 : 65 25 __ ADC WORK + 2 
0afb : 85 47 __ STA T6 + 0 
0afd : a9 4f __ LDA #$4f
0aff : 4c a7 0b JMP $0ba7 ; (main.s1018 + 0)
.s1003:
0b02 : c9 02 __ CMP #$02
0b04 : d0 1c __ BNE $0b22 ; (main.s1002 + 0)
.s37:
0b06 : a5 54 __ LDA T5 + 0 
0b08 : 85 3b __ STA ACCU + 0 
0b0a : ad 8b 47 LDA $478b ; (off1 + 1)
0b0d : 85 3c __ STA ACCU + 1 
0b0f : a9 c5 __ LDA #$c5
0b11 : 85 23 __ STA WORK + 0 
0b13 : a9 00 __ LDA #$00
0b15 : 85 24 __ STA WORK + 1 
0b17 : 20 22 1f JSR $1f22 ; (divmod + 0)
0b1a : a6 25 __ LDX WORK + 2 
0b1c : bd 00 57 LDA $5700,x ; (Song2 + 0)
0b1f : 4c 3f 0b JMP $0b3f ; (main.s67 + 0)
.s1002:
0b22 : c9 03 __ CMP #$03
0b24 : d0 29 __ BNE $0b4f ; (main.s26 + 0)
.s42:
0b26 : a5 54 __ LDA T5 + 0 
0b28 : 85 3b __ STA ACCU + 0 
0b2a : ad 8b 47 LDA $478b ; (off1 + 1)
0b2d : 85 3c __ STA ACCU + 1 
0b2f : a9 c3 __ LDA #$c3
0b31 : 85 23 __ STA WORK + 0 
0b33 : a9 00 __ LDA #$00
0b35 : 85 24 __ STA WORK + 1 
0b37 : 20 22 1f JSR $1f22 ; (divmod + 0)
0b3a : a6 25 __ LDX WORK + 2 
0b3c : bd 00 58 LDA $5800,x ; (Song3 + 0)
.s67:
0b3f : 09 00 __ ORA #$00
0b41 : f0 0c __ BEQ $0b4f ; (main.s26 + 0)
.s28:
0b43 : 8d 23 9f STA $9f23 
0b46 : a5 54 __ LDA T5 + 0 
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
0b6c : a5 54 __ LDA T5 + 0 
0b6e : 69 01 __ ADC #$01
0b70 : 8d 8a 47 STA $478a ; (off1 + 0)
0b73 : 90 03 __ BCC $0b78 ; (main.s1027 + 0)
.s1026:
0b75 : ee 8b 47 INC $478b ; (off1 + 1)
.s1027:
0b78 : a9 d8 __ LDA #$d8
0b7a : 85 32 __ STA P5 
0b7c : a9 42 __ LDA #$42
0b7e : 85 33 __ STA P6 
0b80 : 20 a7 1d JSR $1da7 ; (SetPaletteIndex.s0 + 0)
.s24:
0b83 : a9 01 __ LDA #$01
0b85 : 8d 2c 9f STA $9f2c 
0b88 : 20 6f 1c JSR $1c6f ; (zsm_fill.s0 + 0)
0b8b : a9 00 __ LDA #$00
0b8d : 8d 2c 9f STA $9f2c 
0b90 : 20 f9 1e JSR $1ef9 ; (frame_wait.l1 + 0)
0b93 : ee f8 42 INC $42f8 ; (FrameCount + 0)
0b96 : d0 03 __ BNE $0b9b ; (main.s1029 + 0)
.s1028:
0b98 : ee f9 42 INC $42f9 ; (FrameCount + 1)
.s1029:
0b9b : e6 4f __ INC T1 + 0 
0b9d : f0 03 __ BEQ $0ba2 ; (main.s1030 + 0)
0b9f : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s1030:
0ba2 : e6 50 __ INC T1 + 1 
0ba4 : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s1018:
0ba7 : 65 26 __ ADC WORK + 3 
0ba9 : 85 48 __ STA T6 + 1 
0bab : a0 00 __ LDY #$00
0bad : b1 47 __ LDA (T6 + 0),y 
0baf : 4c 3f 0b JMP $0b3f ; (main.s67 + 0)
.s14:
0bb2 : e6 51 __ INC T2 + 0 
0bb4 : 4c 3f 0a JMP $0a3f ; (main.s74 + 0)
.s5:
0bb7 : a5 51 __ LDA T2 + 0 
0bb9 : 85 32 __ STA P5 
0bbb : a9 00 __ LDA #$00
0bbd : 85 33 __ STA P6 
0bbf : ad fa 42 LDA $42fa ; (LastSelectedSong + 0)
0bc2 : 85 34 __ STA P7 
0bc4 : a9 00 __ LDA #$00
0bc6 : 85 35 __ STA P8 
0bc8 : 20 36 1b JSR $1b36 ; (PlayZSM.s0 + 0)
0bcb : a5 32 __ LDA P5 
0bcd : 8d fa 42 STA $42fa ; (LastSelectedSong + 0)
0bd0 : ee fb 42 INC $42fb ; (PalTimer + 0)
0bd3 : f0 03 __ BEQ $0bd8 ; (main.s1022 + 0)
0bd5 : 4c 83 09 JMP $0983 ; (main.s61 + 0)
.s1022:
0bd8 : ee fc 42 INC $42fc ; (PalTimer + 1)
0bdb : 4c 83 09 JMP $0983 ; (main.s61 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0bde : 78 __ __ SEI
0bdf : ad 14 03 LDA $0314 
0be2 : 8d 8d 47 STA $478d ; (oirq + 0)
0be5 : ad 15 03 LDA $0315 
0be8 : 8d 8e 47 STA $478e ; (oirq + 1)
0beb : a9 f7 __ LDA #$f7
0bed : 8d 14 03 STA $0314 
0bf0 : a9 0b __ LDA #$0b
0bf2 : 8d 15 03 STA $0315 
0bf5 : 58 __ __ CLI
.s1001:
0bf6 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
478d : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0bf7 : 20 fd 0b JSR $0bfd ; (irq.s1000 + 0)
0bfa : 6c 8d 47 JMP ($478d)
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
0c27 : ad d1 1f LDA $1fd1 ; (zsm_playing + 0)
0c2a : f0 08 __ BEQ $0c34 ; (irq.s1001 + 0)
.s4:
0c2c : ad d2 1f LDA $1fd2 ; (zsm_finished + 0)
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
1fd1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1fd2 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c5f : ad d3 1f LDA $1fd3 ; (zsm_paused + 0)
0c62 : f0 01 __ BEQ $0c65 ; (zsm_play.s2 + 0)
0c64 : 60 __ __ RTS
.s2:
0c65 : ad 8f 47 LDA $478f ; (zsm_delay + 0)
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
0c89 : ad 90 47 LDA $4790 ; (zsm_pos + 0)
0c8c : 85 4b __ STA T3 + 0 
0c8e : 18 __ __ CLC
0c8f : 69 01 __ ADC #$01
0c91 : 85 4d __ STA T4 + 0 
0c93 : 8d 90 47 STA $4790 ; (zsm_pos + 0)
0c96 : ad 91 47 LDA $4791 ; (zsm_pos + 1)
0c99 : aa __ __ TAX
0c9a : 69 00 __ ADC #$00
0c9c : 85 4e __ STA T4 + 1 
0c9e : 8d 91 47 STA $4791 ; (zsm_pos + 1)
0ca1 : 18 __ __ CLC
0ca2 : a9 c4 __ LDA #$c4
0ca4 : 65 4b __ ADC T3 + 0 
0ca6 : 85 3b __ STA ACCU + 0 
0ca8 : 8a __ __ TXA
0ca9 : 29 03 __ AND #$03
0cab : 69 58 __ ADC #$58
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
0cc7 : 69 58 __ ADC #$58
0cc9 : 85 4c __ STA T3 + 1 
0ccb : b1 4b __ LDA (T3 + 0),y 
0ccd : 29 3f __ AND #$3f
0ccf : 18 __ __ CLC
0cd0 : 65 4d __ ADC T4 + 0 
0cd2 : 8d 90 47 STA $4790 ; (zsm_pos + 0)
0cd5 : 98 __ __ TYA
0cd6 : 65 4e __ ADC T4 + 1 
0cd8 : 8d 91 47 STA $4791 ; (zsm_pos + 1)
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
0ced : 6d 90 47 ADC $4790 ; (zsm_pos + 0)
0cf0 : 85 4d __ STA T4 + 0 
0cf2 : ad 91 47 LDA $4791 ; (zsm_pos + 1)
0cf5 : 29 03 __ AND #$03
0cf7 : 69 58 __ ADC #$58
0cf9 : 85 4e __ STA T4 + 1 
0cfb : a0 00 __ LDY #$00
0cfd : b1 4d __ LDA (T4 + 0),y 
0cff : 85 2d __ STA P0 
0d01 : ad 90 47 LDA $4790 ; (zsm_pos + 0)
0d04 : 18 __ __ CLC
0d05 : 69 01 __ ADC #$01
0d07 : aa __ __ TAX
0d08 : ad 91 47 LDA $4791 ; (zsm_pos + 1)
0d0b : 69 00 __ ADC #$00
0d0d : 29 03 __ AND #$03
0d0f : 85 4c __ STA T3 + 1 
0d11 : 8a __ __ TXA
0d12 : 18 __ __ CLC
0d13 : 69 c4 __ ADC #$c4
0d15 : 85 4b __ STA T3 + 0 
0d17 : a9 58 __ LDA #$58
0d19 : 65 4c __ ADC T3 + 1 
0d1b : 85 4c __ STA T3 + 1 
0d1d : b1 4b __ LDA (T3 + 0),y 
0d1f : 85 2e __ STA P1 
0d21 : 20 9e 0d JSR $0d9e ; (sfx_put.l1 + 0)
0d24 : ad 90 47 LDA $4790 ; (zsm_pos + 0)
0d27 : 18 __ __ CLC
0d28 : 69 02 __ ADC #$02
0d2a : 8d 90 47 STA $4790 ; (zsm_pos + 0)
0d2d : 90 03 __ BCC $0d32 ; (zsm_play.s1015 + 0)
.s1014:
0d2f : ee 91 47 INC $4791 ; (zsm_pos + 1)
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
0d43 : 8d d2 1f STA $1fd2 ; (zsm_finished + 0)
0d46 : d0 08 __ BNE $0d50 ; (zsm_play.s10 + 0)
.s25:
0d48 : 29 7f __ AND #$7f
0d4a : 38 __ __ SEC
0d4b : e9 01 __ SBC #$01
0d4d : 8d 8f 47 STA $478f ; (zsm_delay + 0)
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
0d7a : 8d 90 47 STA $4790 ; (zsm_pos + 0)
0d7d : 90 01 __ BCC $0d80 ; (zsm_play.s1017 + 0)
.s1016:
0d7f : e8 __ __ INX
.s1017:
0d80 : 8e 91 47 STX $4791 ; (zsm_pos + 1)
0d83 : 18 __ __ CLC
0d84 : a9 c4 __ LDA #$c4
0d86 : 65 4d __ ADC T4 + 0 
0d88 : 85 4b __ STA T3 + 0 
0d8a : a5 4e __ LDA T4 + 1 
0d8c : 29 03 __ AND #$03
0d8e : 69 58 __ ADC #$58
0d90 : 85 4c __ STA T3 + 1 
0d92 : b1 4b __ LDA (T3 + 0),y 
0d94 : 8d 23 9f STA $9f23 
0d97 : 4c 89 0c JMP $0c89 ; (zsm_play.l8 + 0)
.s4:
0d9a : ce 8f 47 DEC $478f ; (zsm_delay + 0)
0d9d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1fd3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
478f : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
58c4 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
4790 : __ __ __ BSS	2
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
0db0 : 9d 00 5d STA $5d00,x ; (vera_fm_s_regs + 0)
0db3 : 8d 41 9f STA $9f41 
.s1001:
0db6 : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
5d00 : __ __ __ BSS	128
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
0e1d : 20 3a 17 JSR $173a ; (tileBaseConfig.s0 + 0)
0e20 : 8d 2f 9f STA $9f2f 
0e23 : a9 00 __ LDA #$00
0e25 : 85 2d __ STA P0 
0e27 : a9 20 __ LDA #$20
0e29 : 85 2f __ STA P2 
0e2b : 20 52 17 JSR $1752 ; (memoryToMapMemoryAddress.s0 + 0)
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
0e4a : 86 48 __ STX T1 + 0 
0e4c : a9 00 __ LDA #$00
0e4e : 85 2d __ STA P0 
0e50 : 85 2e __ STA P1 
0e52 : 85 2f __ STA P2 
0e54 : 85 30 __ STA P3 
0e56 : a9 e0 __ LDA #$e0
0e58 : 85 33 __ STA P6 
0e5a : a9 01 __ LDA #$01
0e5c : 85 34 __ STA P7 
0e5e : a9 d4 __ LDA #$d4
0e60 : 85 31 __ STA P4 
0e62 : a9 1f __ LDA #$1f
0e64 : 85 32 __ STA P5 
0e66 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
0e69 : a9 10 __ LDA #$10
0e6b : 8d 22 9f STA $9f22 
0e6e : a9 00 __ LDA #$00
0e70 : 8d 20 9f STA $9f20 
0e73 : a9 20 __ LDA #$20
0e75 : 8d 21 9f STA $9f21 
.l10:
0e78 : a9 00 __ LDA #$00
0e7a : 85 49 __ STA T2 + 0 
.l14:
0e7c : 20 9a 17 JSR $179a ; (rand.s0 + 0)
0e7f : a9 31 __ LDA #$31
0e81 : 85 23 __ STA WORK + 0 
0e83 : a9 00 __ LDA #$00
0e85 : 85 24 __ STA WORK + 1 
0e87 : 20 22 1f JSR $1f22 ; (divmod + 0)
0e8a : a5 48 __ LDA T1 + 0 
0e8c : c9 36 __ CMP #$36
0e8e : 90 03 __ BCC $0e93 ; (SetUpSprites.s1037 + 0)
0e90 : 4c 8d 16 JMP $168d ; (SetUpSprites.s1032 + 0)
.s1037:
0e93 : c9 2c __ CMP #$2c
0e95 : b0 03 __ BCS $0e9a ; (SetUpSprites.s1036 + 0)
0e97 : 4c 8d 16 JMP $168d ; (SetUpSprites.s1032 + 0)
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
0eba : e6 49 __ INC T2 + 0 
0ebc : 10 be __ BPL $0e7c ; (SetUpSprites.l14 + 0)
.s11:
0ebe : e6 48 __ INC T1 + 0 
0ec0 : a5 48 __ LDA T1 + 0 
0ec2 : c9 3c __ CMP #$3c
0ec4 : 90 b2 __ BCC $0e78 ; (SetUpSprites.l10 + 0)
.s12:
0ec6 : ad 29 9f LDA $9f29 
0ec9 : 09 10 __ ORA #$10
0ecb : 8d 29 9f STA $9f29 
0ece : a9 c0 __ LDA #$c0
0ed0 : 85 2d __ STA P0 
0ed2 : a9 56 __ LDA #$56
0ed4 : 85 2e __ STA P1 
0ed6 : a9 01 __ LDA #$01
0ed8 : 85 2f __ STA P2 
0eda : a9 00 __ LDA #$00
0edc : 85 30 __ STA P3 
0ede : 85 33 __ STA P6 
0ee0 : a9 02 __ LDA #$02
0ee2 : 85 34 __ STA P7 
0ee4 : a9 b6 __ LDA #$b6
0ee6 : 85 31 __ STA P4 
0ee8 : a9 21 __ LDA #$21
0eea : 85 32 __ STA P5 
0eec : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
0eef : a9 00 __ LDA #$00
0ef1 : 85 2d __ STA P0 
0ef3 : a9 59 __ LDA #$59
0ef5 : 85 2e __ STA P1 
0ef7 : a9 02 __ LDA #$02
0ef9 : 85 34 __ STA P7 
0efb : a9 b6 __ LDA #$b6
0efd : 85 31 __ STA P4 
0eff : a9 23 __ LDA #$23
0f01 : 85 32 __ STA P5 
0f03 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
0f06 : a9 b6 __ LDA #$b6
0f08 : 85 2e __ STA P1 
0f0a : a9 0a __ LDA #$0a
0f0c : 85 2f __ STA P2 
0f0e : 85 34 __ STA P7 
0f10 : a9 02 __ LDA #$02
0f12 : 85 31 __ STA P4 
0f14 : 85 32 __ STA P5 
0f16 : a9 03 __ LDA #$03
0f18 : 85 33 __ STA P6 
0f1a : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
0f1d : a9 68 __ LDA #$68
0f1f : 85 2e __ STA P1 
0f21 : a9 00 __ LDA #$00
0f23 : 85 2f __ STA P2 
0f25 : a9 b6 __ LDA #$b6
0f27 : 85 30 __ STA P3 
0f29 : a9 01 __ LDA #$01
0f2b : 85 31 __ STA P4 
0f2d : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
0f30 : a9 01 __ LDA #$01
0f32 : 85 2d __ STA P0 
0f34 : a9 c8 __ LDA #$c8
0f36 : 85 2e __ STA P1 
0f38 : a9 0a __ LDA #$0a
0f3a : 85 2f __ STA P2 
0f3c : a9 00 __ LDA #$00
0f3e : 85 30 __ STA P3 
0f40 : a9 02 __ LDA #$02
0f42 : 85 31 __ STA P4 
0f44 : a9 09 __ LDA #$09
0f46 : 85 34 __ STA P7 
0f48 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
0f4b : a9 f0 __ LDA #$f0
0f4d : 85 2e __ STA P1 
0f4f : a9 01 __ LDA #$01
0f51 : 85 2f __ STA P2 
0f53 : 85 31 __ STA P4 
0f55 : a9 b6 __ LDA #$b6
0f57 : 85 30 __ STA P3 
0f59 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
0f5c : a9 00 __ LDA #$00
0f5e : 85 2d __ STA P0 
0f60 : 85 30 __ STA P3 
0f62 : 85 33 __ STA P6 
0f64 : a9 30 __ LDA #$30
0f66 : 85 2e __ STA P1 
0f68 : a9 01 __ LDA #$01
0f6a : 85 34 __ STA P7 
0f6c : a9 00 __ LDA #$00
0f6e : 85 31 __ STA P4 
0f70 : a9 26 __ LDA #$26
0f72 : 85 32 __ STA P5 
0f74 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
0f77 : a9 16 __ LDA #$16
0f79 : 85 2d __ STA P0 
0f7b : a9 80 __ LDA #$80
0f7d : 85 2e __ STA P1 
0f7f : a9 09 __ LDA #$09
0f81 : 85 2f __ STA P2 
0f83 : a9 01 __ LDA #$01
0f85 : 85 31 __ STA P4 
0f87 : 85 34 __ STA P7 
0f89 : a9 02 __ LDA #$02
0f8b : 85 32 __ STA P5 
0f8d : a9 03 __ LDA #$03
0f8f : 85 33 __ STA P6 
0f91 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
0f94 : a9 30 __ LDA #$30
0f96 : 85 2e __ STA P1 
0f98 : a9 01 __ LDA #$01
0f9a : 85 2f __ STA P2 
0f9c : a9 b8 __ LDA #$b8
0f9e : 85 30 __ STA P3 
0fa0 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
0fa3 : a9 00 __ LDA #$00
0fa5 : 85 2d __ STA P0 
0fa7 : 85 30 __ STA P3 
0fa9 : 85 33 __ STA P6 
0fab : a9 37 __ LDA #$37
0fad : 85 2e __ STA P1 
0faf : a9 02 __ LDA #$02
0fb1 : 85 34 __ STA P7 
0fb3 : a9 00 __ LDA #$00
0fb5 : 85 31 __ STA P4 
0fb7 : a9 27 __ LDA #$27
0fb9 : 85 32 __ STA P5 
0fbb : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
0fbe : a9 17 __ LDA #$17
0fc0 : 85 2d __ STA P0 
0fc2 : a9 b8 __ LDA #$b8
0fc4 : 85 2e __ STA P1 
0fc6 : a9 09 __ LDA #$09
0fc8 : 85 2f __ STA P2 
0fca : a9 02 __ LDA #$02
0fcc : 85 31 __ STA P4 
0fce : 85 32 __ STA P5 
0fd0 : a9 03 __ LDA #$03
0fd2 : 85 33 __ STA P6 
0fd4 : a9 01 __ LDA #$01
0fd6 : 85 34 __ STA P7 
0fd8 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
0fdb : a9 fc __ LDA #$fc
0fdd : 85 2e __ STA P1 
0fdf : a9 00 __ LDA #$00
0fe1 : 85 2f __ STA P2 
0fe3 : a9 b8 __ LDA #$b8
0fe5 : 85 30 __ STA P3 
0fe7 : a9 01 __ LDA #$01
0fe9 : 85 31 __ STA P4 
0feb : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
0fee : a9 18 __ LDA #$18
0ff0 : 85 2d __ STA P0 
0ff2 : a9 b8 __ LDA #$b8
0ff4 : 85 2e __ STA P1 
0ff6 : a9 09 __ LDA #$09
0ff8 : 85 2f __ STA P2 
0ffa : a9 00 __ LDA #$00
0ffc : 85 30 __ STA P3 
0ffe : a9 02 __ LDA #$02
1000 : 85 31 __ STA P4 
1002 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
1005 : a9 4c __ LDA #$4c
1007 : 85 2e __ STA P1 
1009 : a9 01 __ LDA #$01
100b : 85 2f __ STA P2 
100d : 85 31 __ STA P4 
100f : a9 b8 __ LDA #$b8
1011 : 85 30 __ STA P3 
1013 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1016 : a9 01 __ LDA #$01
1018 : 85 2e __ STA P1 
101a : a9 00 __ LDA #$00
101c : 85 2f __ STA P2 
101e : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
1021 : a9 10 __ LDA #$10
1023 : 85 2d __ STA P0 
1025 : a9 20 __ LDA #$20
1027 : 85 30 __ STA P3 
1029 : a9 00 __ LDA #$00
102b : 85 31 __ STA P4 
102d : a9 b6 __ LDA #$b6
102f : 85 2e __ STA P1 
1031 : a9 25 __ LDA #$25
1033 : 85 2f __ STA P2 
1035 : 20 94 18 JSR $1894 ; (vera_pal_putn.s0 + 0)
1038 : a9 00 __ LDA #$00
103a : 85 2d __ STA P0 
103c : 85 30 __ STA P3 
103e : 85 33 __ STA P6 
1040 : a9 35 __ LDA #$35
1042 : 85 2e __ STA P1 
1044 : a9 01 __ LDA #$01
1046 : 85 2f __ STA P2 
1048 : a9 02 __ LDA #$02
104a : 85 34 __ STA P7 
104c : a9 00 __ LDA #$00
104e : 85 31 __ STA P4 
1050 : a9 29 __ LDA #$29
1052 : 85 32 __ STA P5 
1054 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
1057 : a9 00 __ LDA #$00
1059 : 85 48 __ STA T1 + 0 
105b : 85 49 __ STA T2 + 0 
105d : a9 03 __ LDA #$03
105f : 85 33 __ STA P6 
1061 : a9 02 __ LDA #$02
1063 : 85 34 __ STA P7 
1065 : 18 __ __ CLC
.l1053:
1066 : a9 a8 __ LDA #$a8
1068 : 85 2e __ STA P1 
106a : a9 09 __ LDA #$09
106c : 85 2f __ STA P2 
106e : a9 00 __ LDA #$00
1070 : 85 30 __ STA P3 
1072 : 85 31 __ STA P4 
1074 : 85 32 __ STA P5 
1076 : a5 48 __ LDA T1 + 0 
1078 : 69 19 __ ADC #$19
107a : 85 2d __ STA P0 
107c : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
107f : a9 b8 __ LDA #$b8
1081 : 85 30 __ STA P3 
1083 : a9 01 __ LDA #$01
1085 : 85 31 __ STA P4 
1087 : 38 __ __ SEC
1088 : a5 49 __ LDA T2 + 0 
108a : e9 fc __ SBC #$fc
108c : 85 2e __ STA P1 
108e : a9 00 __ LDA #$00
1090 : e9 03 __ SBC #$03
1092 : 85 2f __ STA P2 
1094 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1097 : 18 __ __ CLC
1098 : a5 49 __ LDA T2 + 0 
109a : 69 0c __ ADC #$0c
109c : 85 49 __ STA T2 + 0 
109e : e6 48 __ INC T1 + 0 
10a0 : a5 48 __ LDA T1 + 0 
10a2 : c9 08 __ CMP #$08
10a4 : 90 c0 __ BCC $1066 ; (SetUpSprites.l1053 + 0)
.s78:
10a6 : a9 00 __ LDA #$00
10a8 : 85 48 __ STA T1 + 0 
10aa : 85 49 __ STA T2 + 0 
10ac : a9 03 __ LDA #$03
10ae : 85 33 __ STA P6 
10b0 : 85 34 __ STA P7 
10b2 : 18 __ __ CLC
.l1055:
10b3 : a9 a8 __ LDA #$a8
10b5 : 85 2e __ STA P1 
10b7 : a9 09 __ LDA #$09
10b9 : 85 2f __ STA P2 
10bb : a9 00 __ LDA #$00
10bd : 85 30 __ STA P3 
10bf : 85 31 __ STA P4 
10c1 : a5 48 __ LDA T1 + 0 
10c3 : 69 21 __ ADC #$21
10c5 : 85 2d __ STA P0 
10c7 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
10ca : a9 c4 __ LDA #$c4
10cc : 85 30 __ STA P3 
10ce : a9 01 __ LDA #$01
10d0 : 85 31 __ STA P4 
10d2 : 38 __ __ SEC
10d3 : a5 49 __ LDA T2 + 0 
10d5 : e9 fc __ SBC #$fc
10d7 : 85 2e __ STA P1 
10d9 : a9 00 __ LDA #$00
10db : e9 03 __ SBC #$03
10dd : 85 2f __ STA P2 
10df : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
10e2 : 18 __ __ CLC
10e3 : a5 49 __ LDA T2 + 0 
10e5 : 69 0c __ ADC #$0c
10e7 : 85 49 __ STA T2 + 0 
10e9 : e6 48 __ INC T1 + 0 
10eb : a5 48 __ LDA T1 + 0 
10ed : c9 08 __ CMP #$08
10ef : 90 c2 __ BCC $10b3 ; (SetUpSprites.l1055 + 0)
.s82:
10f1 : a9 00 __ LDA #$00
10f3 : 85 48 __ STA T1 + 0 
10f5 : 85 49 __ STA T2 + 0 
10f7 : a9 03 __ LDA #$03
10f9 : 85 33 __ STA P6 
10fb : a9 04 __ LDA #$04
10fd : 85 34 __ STA P7 
10ff : 18 __ __ CLC
.l1057:
1100 : a9 a8 __ LDA #$a8
1102 : 85 2e __ STA P1 
1104 : a9 09 __ LDA #$09
1106 : 85 2f __ STA P2 
1108 : a9 00 __ LDA #$00
110a : 85 30 __ STA P3 
110c : 85 31 __ STA P4 
110e : a5 48 __ LDA T1 + 0 
1110 : 69 29 __ ADC #$29
1112 : 85 2d __ STA P0 
1114 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
1117 : a9 b8 __ LDA #$b8
1119 : 85 30 __ STA P3 
111b : a9 01 __ LDA #$01
111d : 85 31 __ STA P4 
111f : 38 __ __ SEC
1120 : a9 6c __ LDA #$6c
1122 : e5 49 __ SBC T2 + 0 
1124 : 85 2e __ STA P1 
1126 : a9 02 __ LDA #$02
1128 : e9 04 __ SBC #$04
112a : 85 2f __ STA P2 
112c : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
112f : 18 __ __ CLC
1130 : a5 49 __ LDA T2 + 0 
1132 : 69 0c __ ADC #$0c
1134 : 85 49 __ STA T2 + 0 
1136 : e6 48 __ INC T1 + 0 
1138 : a5 48 __ LDA T1 + 0 
113a : c9 08 __ CMP #$08
113c : 90 c2 __ BCC $1100 ; (SetUpSprites.l1057 + 0)
.s86:
113e : a9 00 __ LDA #$00
1140 : 85 48 __ STA T1 + 0 
1142 : a9 03 __ LDA #$03
1144 : 85 33 __ STA P6 
1146 : a9 04 __ LDA #$04
1148 : 85 34 __ STA P7 
.l88:
114a : 38 __ __ SEC
114b : a9 00 __ LDA #$00
114d : e5 48 __ SBC T1 + 0 
114f : 29 0c __ AND #$0c
1151 : 49 ff __ EOR #$ff
1153 : 38 __ __ SEC
1154 : 69 6c __ ADC #$6c
1156 : 85 49 __ STA T2 + 0 
1158 : a9 02 __ LDA #$02
115a : e9 00 __ SBC #$00
115c : 85 4a __ STA T2 + 1 
115e : 18 __ __ CLC
115f : a5 48 __ LDA T1 + 0 
1161 : 69 31 __ ADC #$31
1163 : 85 2d __ STA P0 
1165 : a9 02 __ LDA #$02
1167 : 85 4b __ STA T4 + 0 
.l1041:
1169 : a9 a8 __ LDA #$a8
116b : 85 2e __ STA P1 
116d : a9 09 __ LDA #$09
116f : 85 2f __ STA P2 
1171 : a9 00 __ LDA #$00
1173 : 85 30 __ STA P3 
1175 : 85 31 __ STA P4 
1177 : 85 32 __ STA P5 
1179 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
117c : a5 49 __ LDA T2 + 0 
117e : 85 2e __ STA P1 
1180 : a5 4a __ LDA T2 + 1 
1182 : 85 2f __ STA P2 
1184 : a9 b8 __ LDA #$b8
1186 : 85 30 __ STA P3 
1188 : a9 01 __ LDA #$01
118a : 85 31 __ STA P4 
118c : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
118f : c6 4b __ DEC T4 + 0 
1191 : d0 d6 __ BNE $1169 ; (SetUpSprites.l1041 + 0)
.s89:
1193 : e6 48 __ INC T1 + 0 
1195 : a5 48 __ LDA T1 + 0 
1197 : c9 02 __ CMP #$02
1199 : 90 af __ BCC $114a ; (SetUpSprites.l88 + 0)
.s90:
119b : a9 40 __ LDA #$40
119d : 85 2d __ STA P0 
119f : a9 51 __ LDA #$51
11a1 : 85 2e __ STA P1 
11a3 : a9 01 __ LDA #$01
11a5 : 85 2f __ STA P2 
11a7 : 85 34 __ STA P7 
11a9 : a9 00 __ LDA #$00
11ab : 85 30 __ STA P3 
11ad : 85 33 __ STA P6 
11af : a9 00 __ LDA #$00
11b1 : 85 31 __ STA P4 
11b3 : a9 2b __ LDA #$2b
11b5 : 85 32 __ STA P5 
11b7 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
11ba : a9 33 __ LDA #$33
11bc : 85 2d __ STA P0 
11be : a9 8a __ LDA #$8a
11c0 : 85 2e __ STA P1 
11c2 : a9 0a __ LDA #$0a
11c4 : 85 2f __ STA P2 
11c6 : a9 01 __ LDA #$01
11c8 : 85 31 __ STA P4 
11ca : a9 02 __ LDA #$02
11cc : 85 32 __ STA P5 
11ce : a9 03 __ LDA #$03
11d0 : 85 33 __ STA P6 
11d2 : a9 06 __ LDA #$06
11d4 : 85 34 __ STA P7 
11d6 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
11d9 : a9 00 __ LDA #$00
11db : 85 2e __ STA P1 
11dd : 85 31 __ STA P4 
11df : a9 01 __ LDA #$01
11e1 : 85 2f __ STA P2 
11e3 : a9 78 __ LDA #$78
11e5 : 85 30 __ STA P3 
11e7 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
11ea : a9 00 __ LDA #$00
11ec : 85 2d __ STA P0 
11ee : 85 30 __ STA P3 
11f0 : 85 33 __ STA P6 
11f2 : a9 41 __ LDA #$41
11f4 : 85 2e __ STA P1 
11f6 : a9 04 __ LDA #$04
11f8 : 85 34 __ STA P7 
11fa : a9 00 __ LDA #$00
11fc : 85 31 __ STA P4 
11fe : a9 2c __ LDA #$2c
1200 : 85 32 __ STA P5 
1202 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
1205 : a9 34 __ LDA #$34
1207 : 85 2d __ STA P0 
1209 : a9 08 __ LDA #$08
120b : 85 2e __ STA P1 
120d : a9 0a __ LDA #$0a
120f : 85 2f __ STA P2 
1211 : a9 03 __ LDA #$03
1213 : 85 31 __ STA P4 
1215 : 85 33 __ STA P6 
1217 : a9 02 __ LDA #$02
1219 : 85 32 __ STA P5 
121b : a9 05 __ LDA #$05
121d : 85 34 __ STA P7 
121f : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
1222 : a9 00 __ LDA #$00
1224 : 85 2e __ STA P1 
1226 : 85 31 __ STA P4 
1228 : a9 01 __ LDA #$01
122a : 85 2f __ STA P2 
122c : a9 78 __ LDA #$78
122e : 85 30 __ STA P3 
1230 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1233 : a9 35 __ LDA #$35
1235 : 85 2d __ STA P0 
1237 : a9 28 __ LDA #$28
1239 : 85 2e __ STA P1 
123b : a9 0a __ LDA #$0a
123d : 85 2f __ STA P2 
123f : a9 00 __ LDA #$00
1241 : 85 30 __ STA P3 
1243 : a9 03 __ LDA #$03
1245 : 85 31 __ STA P4 
1247 : a9 07 __ LDA #$07
1249 : 85 33 __ STA P6 
124b : a9 06 __ LDA #$06
124d : 85 34 __ STA P7 
124f : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
1252 : a9 00 __ LDA #$00
1254 : 85 2e __ STA P1 
1256 : 85 31 __ STA P4 
1258 : a9 01 __ LDA #$01
125a : 85 2f __ STA P2 
125c : a9 e8 __ LDA #$e8
125e : 85 30 __ STA P3 
1260 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1263 : a9 36 __ LDA #$36
1265 : 85 2d __ STA P0 
1267 : a9 28 __ LDA #$28
1269 : 85 2e __ STA P1 
126b : a9 0a __ LDA #$0a
126d : 85 2f __ STA P2 
126f : a9 00 __ LDA #$00
1271 : 85 30 __ STA P3 
1273 : a9 03 __ LDA #$03
1275 : 85 31 __ STA P4 
1277 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
127a : a9 40 __ LDA #$40
127c : 85 2e __ STA P1 
127e : a9 01 __ LDA #$01
1280 : 85 2f __ STA P2 
1282 : a9 e8 __ LDA #$e8
1284 : 85 30 __ STA P3 
1286 : a9 00 __ LDA #$00
1288 : 85 31 __ STA P4 
128a : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
128d : a9 01 __ LDA #$01
128f : 85 2e __ STA P1 
1291 : a9 00 __ LDA #$00
1293 : 85 2f __ STA P2 
1295 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
1298 : a9 37 __ LDA #$37
129a : 85 2d __ STA P0 
129c : a9 28 __ LDA #$28
129e : 85 2e __ STA P1 
12a0 : a9 0a __ LDA #$0a
12a2 : 85 2f __ STA P2 
12a4 : a9 00 __ LDA #$00
12a6 : 85 30 __ STA P3 
12a8 : a9 03 __ LDA #$03
12aa : 85 31 __ STA P4 
12ac : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
12af : a9 00 __ LDA #$00
12b1 : 85 2e __ STA P1 
12b3 : a9 01 __ LDA #$01
12b5 : 85 2f __ STA P2 
12b7 : 85 31 __ STA P4 
12b9 : a9 08 __ LDA #$08
12bb : 85 30 __ STA P3 
12bd : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
12c0 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
12c3 : a9 38 __ LDA #$38
12c5 : 85 2d __ STA P0 
12c7 : a9 28 __ LDA #$28
12c9 : 85 2e __ STA P1 
12cb : a9 0a __ LDA #$0a
12cd : 85 2f __ STA P2 
12cf : a9 00 __ LDA #$00
12d1 : 85 30 __ STA P3 
12d3 : a9 03 __ LDA #$03
12d5 : 85 31 __ STA P4 
12d7 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
12da : a9 40 __ LDA #$40
12dc : 85 2e __ STA P1 
12de : a9 01 __ LDA #$01
12e0 : 85 2f __ STA P2 
12e2 : 85 31 __ STA P4 
12e4 : a9 08 __ LDA #$08
12e6 : 85 30 __ STA P3 
12e8 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
12eb : a9 01 __ LDA #$01
12ed : 85 2e __ STA P1 
12ef : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
12f2 : a9 00 __ LDA #$00
12f4 : 85 2d __ STA P0 
12f6 : 85 30 __ STA P3 
12f8 : 85 33 __ STA P6 
12fa : a9 39 __ LDA #$39
12fc : 85 2e __ STA P1 
12fe : a9 08 __ LDA #$08
1300 : 85 34 __ STA P7 
1302 : a9 00 __ LDA #$00
1304 : 85 31 __ STA P4 
1306 : a9 30 __ LDA #$30
1308 : 85 32 __ STA P5 
130a : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
130d : a9 00 __ LDA #$00
130f : 85 48 __ STA T1 + 0 
1311 : 85 49 __ STA T2 + 0 
1313 : 85 4a __ STA T2 + 1 
1315 : a9 02 __ LDA #$02
1317 : 85 33 __ STA P6 
1319 : a9 05 __ LDA #$05
131b : 85 34 __ STA P7 
131d : a9 03 __ LDA #$03
131f : 85 32 __ STA P5 
1321 : 18 __ __ CLC
.l1059:
1322 : a9 c8 __ LDA #$c8
1324 : 85 2e __ STA P1 
1326 : a9 09 __ LDA #$09
1328 : 85 2f __ STA P2 
132a : a9 00 __ LDA #$00
132c : 85 30 __ STA P3 
132e : a9 03 __ LDA #$03
1330 : 85 31 __ STA P4 
1332 : a5 48 __ LDA T1 + 0 
1334 : 69 39 __ ADC #$39
1336 : 85 2d __ STA P0 
1338 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
133b : a9 20 __ LDA #$20
133d : 85 2e __ STA P1 
133f : a9 01 __ LDA #$01
1341 : 85 2f __ STA P2 
1343 : 38 __ __ SEC
1344 : a5 49 __ LDA T2 + 0 
1346 : e9 60 __ SBC #$60
1348 : 85 30 __ STA P3 
134a : a5 4a __ LDA T2 + 1 
134c : e9 00 __ SBC #$00
134e : 85 31 __ STA P4 
1350 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1353 : 18 __ __ CLC
1354 : a5 49 __ LDA T2 + 0 
1356 : 69 40 __ ADC #$40
1358 : 85 49 __ STA T2 + 0 
135a : 90 02 __ BCC $135e ; (SetUpSprites.s1062 + 0)
.s1061:
135c : e6 4a __ INC T2 + 1 
.s1062:
135e : e6 48 __ INC T1 + 0 
1360 : a5 48 __ LDA T1 + 0 
1362 : c9 07 __ CMP #$07
1364 : 90 bc __ BCC $1322 ; (SetUpSprites.l1059 + 0)
.s98:
1366 : a9 00 __ LDA #$00
1368 : 85 2d __ STA P0 
136a : 85 30 __ STA P3 
136c : 85 33 __ STA P6 
136e : a9 49 __ LDA #$49
1370 : 85 2e __ STA P1 
1372 : a9 08 __ LDA #$08
1374 : 85 34 __ STA P7 
1376 : a9 00 __ LDA #$00
1378 : 85 31 __ STA P4 
137a : a9 38 __ LDA #$38
137c : 85 32 __ STA P5 
137e : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
1381 : a9 47 __ LDA #$47
1383 : 85 2d __ STA P0 
1385 : a9 48 __ LDA #$48
1387 : 85 2e __ STA P1 
1389 : a9 0a __ LDA #$0a
138b : 85 2f __ STA P2 
138d : a9 03 __ LDA #$03
138f : 85 31 __ STA P4 
1391 : 85 32 __ STA P5 
1393 : a9 07 __ LDA #$07
1395 : 85 33 __ STA P6 
1397 : a9 06 __ LDA #$06
1399 : 85 34 __ STA P7 
139b : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
139e : a9 08 __ LDA #$08
13a0 : 85 2e __ STA P1 
13a2 : 85 30 __ STA P3 
13a4 : a9 00 __ LDA #$00
13a6 : 85 2f __ STA P2 
13a8 : 85 31 __ STA P4 
13aa : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
13ad : a9 48 __ LDA #$48
13af : 85 2d __ STA P0 
13b1 : 85 2e __ STA P1 
13b3 : a9 0a __ LDA #$0a
13b5 : 85 2f __ STA P2 
13b7 : a9 00 __ LDA #$00
13b9 : 85 30 __ STA P3 
13bb : a9 03 __ LDA #$03
13bd : 85 31 __ STA P4 
13bf : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
13c2 : a9 00 __ LDA #$00
13c4 : 85 2f __ STA P2 
13c6 : 85 31 __ STA P4 
13c8 : a9 08 __ LDA #$08
13ca : 85 30 __ STA P3 
13cc : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
13cf : a9 01 __ LDA #$01
13d1 : 85 2e __ STA P1 
13d3 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
13d6 : a9 49 __ LDA #$49
13d8 : 85 2d __ STA P0 
13da : a9 48 __ LDA #$48
13dc : 85 2e __ STA P1 
13de : a9 0a __ LDA #$0a
13e0 : 85 2f __ STA P2 
13e2 : a9 00 __ LDA #$00
13e4 : 85 30 __ STA P3 
13e6 : a9 03 __ LDA #$03
13e8 : 85 31 __ STA P4 
13ea : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
13ed : a9 00 __ LDA #$00
13ef : 85 2f __ STA P2 
13f1 : 85 31 __ STA P4 
13f3 : a9 48 __ LDA #$48
13f5 : 85 30 __ STA P3 
13f7 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
13fa : a9 01 __ LDA #$01
13fc : 85 2e __ STA P1 
13fe : 85 2f __ STA P2 
1400 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
1403 : a9 4a __ LDA #$4a
1405 : 85 2d __ STA P0 
1407 : a9 48 __ LDA #$48
1409 : 85 2e __ STA P1 
140b : a9 0a __ LDA #$0a
140d : 85 2f __ STA P2 
140f : a9 00 __ LDA #$00
1411 : 85 30 __ STA P3 
1413 : a9 03 __ LDA #$03
1415 : 85 31 __ STA P4 
1417 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
141a : a9 08 __ LDA #$08
141c : 85 2e __ STA P1 
141e : a9 00 __ LDA #$00
1420 : 85 2f __ STA P2 
1422 : 85 31 __ STA P4 
1424 : a9 48 __ LDA #$48
1426 : 85 30 __ STA P3 
1428 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
142b : a9 00 __ LDA #$00
142d : 85 2e __ STA P1 
142f : a9 01 __ LDA #$01
1431 : 85 2f __ STA P2 
1433 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
1436 : a9 00 __ LDA #$00
1438 : 85 2d __ STA P0 
143a : 85 30 __ STA P3 
143c : a9 49 __ LDA #$49
143e : 85 2e __ STA P1 
1440 : a9 00 __ LDA #$00
1442 : 85 31 __ STA P4 
1444 : a9 38 __ LDA #$38
1446 : 85 32 __ STA P5 
1448 : a9 00 __ LDA #$00
144a : 85 33 __ STA P6 
144c : a9 08 __ LDA #$08
144e : 85 34 __ STA P7 
1450 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
1453 : a9 4b __ LDA #$4b
1455 : 85 2d __ STA P0 
1457 : a9 48 __ LDA #$48
1459 : 85 2e __ STA P1 
145b : a9 0a __ LDA #$0a
145d : 85 2f __ STA P2 
145f : a9 03 __ LDA #$03
1461 : 85 31 __ STA P4 
1463 : 85 32 __ STA P5 
1465 : a9 07 __ LDA #$07
1467 : 85 33 __ STA P6 
1469 : a9 06 __ LDA #$06
146b : 85 34 __ STA P7 
146d : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
1470 : a9 f8 __ LDA #$f8
1472 : 85 2e __ STA P1 
1474 : a9 01 __ LDA #$01
1476 : 85 2f __ STA P2 
1478 : a9 08 __ LDA #$08
147a : 85 30 __ STA P3 
147c : a9 00 __ LDA #$00
147e : 85 31 __ STA P4 
1480 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1483 : a9 4c __ LDA #$4c
1485 : 85 2d __ STA P0 
1487 : a9 48 __ LDA #$48
1489 : 85 2e __ STA P1 
148b : a9 0a __ LDA #$0a
148d : 85 2f __ STA P2 
148f : a9 00 __ LDA #$00
1491 : 85 30 __ STA P3 
1493 : a9 03 __ LDA #$03
1495 : 85 31 __ STA P4 
1497 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
149a : a9 38 __ LDA #$38
149c : 85 2e __ STA P1 
149e : a9 02 __ LDA #$02
14a0 : 85 2f __ STA P2 
14a2 : a9 08 __ LDA #$08
14a4 : 85 30 __ STA P3 
14a6 : a9 00 __ LDA #$00
14a8 : 85 31 __ STA P4 
14aa : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
14ad : a9 01 __ LDA #$01
14af : 85 2e __ STA P1 
14b1 : a9 00 __ LDA #$00
14b3 : 85 2f __ STA P2 
14b5 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
14b8 : a9 4d __ LDA #$4d
14ba : 85 2d __ STA P0 
14bc : a9 48 __ LDA #$48
14be : 85 2e __ STA P1 
14c0 : a9 0a __ LDA #$0a
14c2 : 85 2f __ STA P2 
14c4 : a9 00 __ LDA #$00
14c6 : 85 30 __ STA P3 
14c8 : a9 03 __ LDA #$03
14ca : 85 31 __ STA P4 
14cc : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
14cf : a9 38 __ LDA #$38
14d1 : 85 2e __ STA P1 
14d3 : a9 02 __ LDA #$02
14d5 : 85 2f __ STA P2 
14d7 : a9 48 __ LDA #$48
14d9 : 85 30 __ STA P3 
14db : a9 00 __ LDA #$00
14dd : 85 31 __ STA P4 
14df : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
14e2 : a9 01 __ LDA #$01
14e4 : 85 2e __ STA P1 
14e6 : 85 2f __ STA P2 
14e8 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
14eb : a9 4e __ LDA #$4e
14ed : 85 2d __ STA P0 
14ef : a9 48 __ LDA #$48
14f1 : 85 2e __ STA P1 
14f3 : a9 0a __ LDA #$0a
14f5 : 85 2f __ STA P2 
14f7 : a9 00 __ LDA #$00
14f9 : 85 30 __ STA P3 
14fb : a9 03 __ LDA #$03
14fd : 85 31 __ STA P4 
14ff : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
1502 : a9 f8 __ LDA #$f8
1504 : 85 2e __ STA P1 
1506 : a9 01 __ LDA #$01
1508 : 85 2f __ STA P2 
150a : a9 48 __ LDA #$48
150c : 85 30 __ STA P3 
150e : a9 00 __ LDA #$00
1510 : 85 31 __ STA P4 
1512 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1515 : a9 00 __ LDA #$00
1517 : 85 2e __ STA P1 
1519 : 20 57 18 JSR $1857 ; (vera_spr_flip.s0 + 0)
151c : a9 40 __ LDA #$40
151e : 85 2d __ STA P0 
1520 : a9 53 __ LDA #$53
1522 : 85 2e __ STA P1 
1524 : a9 00 __ LDA #$00
1526 : 85 30 __ STA P3 
1528 : 85 33 __ STA P6 
152a : a9 02 __ LDA #$02
152c : 85 34 __ STA P7 
152e : a9 00 __ LDA #$00
1530 : 85 31 __ STA P4 
1532 : a9 40 __ LDA #$40
1534 : 85 32 __ STA P5 
1536 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
1539 : a9 80 __ LDA #$80
153b : 85 2d __ STA P0 
153d : 85 33 __ STA P6 
153f : a9 52 __ LDA #$52
1541 : 85 2e __ STA P1 
1543 : a9 00 __ LDA #$00
1545 : 85 34 __ STA P7 
1547 : a9 00 __ LDA #$00
1549 : 85 31 __ STA P4 
154b : a9 42 __ LDA #$42
154d : 85 32 __ STA P5 
154f : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
1552 : a9 00 __ LDA #$00
1554 : 85 47 __ STA T0 + 0 
1556 : a9 0a __ LDA #$0a
1558 : 85 2f __ STA P2 
155a : a9 02 __ LDA #$02
155c : 85 33 __ STA P6 
155e : a9 08 __ LDA #$08
1560 : 85 34 __ STA P7 
.l100:
1562 : a9 94 __ LDA #$94
1564 : 85 2e __ STA P1 
1566 : a9 01 __ LDA #$01
1568 : 85 31 __ STA P4 
156a : 85 32 __ STA P5 
156c : 18 __ __ CLC
156d : a5 47 __ LDA T0 + 0 
156f : 69 4f __ ADC #$4f
1571 : 85 2d __ STA P0 
1573 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
1576 : a5 47 __ LDA T0 + 0 
1578 : c9 1f __ CMP #$1f
157a : d0 0d __ BNE $1589 ; (SetUpSprites.s228 + 0)
.s103:
157c : a9 9a __ LDA #$9a
157e : 85 2e __ STA P1 
1580 : a9 02 __ LDA #$02
1582 : 85 31 __ STA P4 
1584 : 85 32 __ STA P5 
1586 : 20 c1 17 JSR $17c1 ; (vera_spr_set.s0 + 0)
.s228:
1589 : e6 47 __ INC T0 + 0 
158b : a5 47 __ LDA T0 + 0 
158d : c9 20 __ CMP #$20
158f : 90 d1 __ BCC $1562 ; (SetUpSprites.l100 + 0)
.s102:
1591 : a9 20 __ LDA #$20
1593 : 85 37 __ STA P10 
1595 : a9 40 __ LDA #$40
1597 : 8d fc 9e STA $9efc ; (sstack + 0)
159a : a9 fa __ LDA #$fa
159c : 8d fd 9e STA $9efd ; (sstack + 1)
159f : a9 01 __ LDA #$01
15a1 : 8d fe 9e STA $9efe ; (sstack + 2)
15a4 : a9 00 __ LDA #$00
15a6 : 8d ff 9e STA $9eff ; (sstack + 3)
15a9 : a9 d6 __ LDA #$d6
15ab : 85 35 __ STA P8 
15ad : a9 25 __ LDA #$25
15af : 85 36 __ STA P9 
15b1 : 20 dd 18 JSR $18dd ; (SetPaletteColours.s0 + 0)
15b4 : a9 60 __ LDA #$60
15b6 : 8d fc 9e STA $9efc ; (sstack + 0)
15b9 : a9 fa __ LDA #$fa
15bb : 8d fd 9e STA $9efd ; (sstack + 1)
15be : a9 01 __ LDA #$01
15c0 : 8d fe 9e STA $9efe ; (sstack + 2)
15c3 : a9 00 __ LDA #$00
15c5 : 8d ff 9e STA $9eff ; (sstack + 3)
15c8 : a9 80 __ LDA #$80
15ca : 85 35 __ STA P8 
15cc : a9 42 __ LDA #$42
15ce : 85 36 __ STA P9 
15d0 : 20 dd 18 JSR $18dd ; (SetPaletteColours.s0 + 0)
15d3 : a9 80 __ LDA #$80
15d5 : 8d fc 9e STA $9efc ; (sstack + 0)
15d8 : a9 fa __ LDA #$fa
15da : 8d fd 9e STA $9efd ; (sstack + 1)
15dd : a9 01 __ LDA #$01
15df : 8d fe 9e STA $9efe ; (sstack + 2)
15e2 : a9 00 __ LDA #$00
15e4 : 8d ff 9e STA $9eff ; (sstack + 3)
15e7 : a9 a0 __ LDA #$a0
15e9 : 85 35 __ STA P8 
15eb : a9 42 __ LDA #$42
15ed : 85 36 __ STA P9 
15ef : 20 dd 18 JSR $18dd ; (SetPaletteColours.s0 + 0)
15f2 : a9 60 __ LDA #$60
15f4 : 85 2d __ STA P0 
15f6 : a9 20 __ LDA #$20
15f8 : 85 30 __ STA P3 
15fa : a9 00 __ LDA #$00
15fc : 85 31 __ STA P4 
15fe : a9 c0 __ LDA #$c0
1600 : 85 2e __ STA P1 
1602 : a9 42 __ LDA #$42
1604 : 85 2f __ STA P2 
1606 : 20 94 18 JSR $1894 ; (vera_pal_putn.s0 + 0)
1609 : a9 70 __ LDA #$70
160b : 85 2d __ STA P0 
160d : a9 0c __ LDA #$0c
160f : 85 30 __ STA P3 
1611 : a9 00 __ LDA #$00
1613 : 85 31 __ STA P4 
1615 : a9 cc __ LDA #$cc
1617 : 85 2e __ STA P1 
1619 : a9 42 __ LDA #$42
161b : 85 2f __ STA P2 
161d : 20 94 18 JSR $1894 ; (vera_pal_putn.s0 + 0)
1620 : a9 80 __ LDA #$80
1622 : 85 2d __ STA P0 
1624 : a9 20 __ LDA #$20
1626 : 85 30 __ STA P3 
1628 : a9 00 __ LDA #$00
162a : 85 31 __ STA P4 
162c : a9 d8 __ LDA #$d8
162e : 85 2e __ STA P1 
1630 : a9 42 __ LDA #$42
1632 : 85 2f __ STA P2 
1634 : 20 94 18 JSR $1894 ; (vera_pal_putn.s0 + 0)
1637 : a9 90 __ LDA #$90
1639 : 85 2d __ STA P0 
163b : a9 10 __ LDA #$10
163d : 85 30 __ STA P3 
163f : a9 00 __ LDA #$00
1641 : 85 31 __ STA P4 
1643 : a9 00 __ LDA #$00
1645 : 85 2e __ STA P1 
1647 : a9 43 __ LDA #$43
1649 : 85 2f __ STA P2 
164b : 20 94 18 JSR $1894 ; (vera_pal_putn.s0 + 0)
164e : a9 a0 __ LDA #$a0
1650 : 85 2d __ STA P0 
1652 : a9 1a __ LDA #$1a
1654 : 85 30 __ STA P3 
1656 : a9 00 __ LDA #$00
1658 : 85 31 __ STA P4 
165a : a9 10 __ LDA #$10
165c : 85 2e __ STA P1 
165e : a9 43 __ LDA #$43
1660 : 85 2f __ STA P2 
1662 : 20 94 18 JSR $1894 ; (vera_pal_putn.s0 + 0)
1665 : a9 00 __ LDA #$00
1667 : 85 2d __ STA P0 
1669 : 85 30 __ STA P3 
166b : 85 33 __ STA P6 
166d : a9 45 __ LDA #$45
166f : 85 2e __ STA P1 
1671 : a9 01 __ LDA #$01
1673 : 85 2f __ STA P2 
1675 : a9 04 __ LDA #$04
1677 : 85 34 __ STA P7 
1679 : a9 2a __ LDA #$2a
167b : 85 31 __ STA P4 
167d : a9 43 __ LDA #$43
167f : 85 32 __ STA P5 
1681 : 20 5f 17 JSR $175f ; (vram_putn.s0 + 0)
1684 : ad 29 9f LDA $9f29 
1687 : 09 70 __ ORA #$70
1689 : 8d 29 9f STA $9f29 
.s1001:
168c : 60 __ __ RTS
.s1032:
168d : c9 34 __ CMP #$34
168f : 90 05 __ BCC $1696 ; (SetUpSprites.s1031 + 0)
.s29:
1691 : a9 09 __ LDA #$09
1693 : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1031:
1696 : a9 2c __ LDA #$2c
1698 : c5 25 __ CMP WORK + 2 
169a : 90 40 __ BCC $16dc ; (SetUpSprites.s1024 + 0)
.s1030:
169c : a5 49 __ LDA T2 + 0 
169e : c9 09 __ CMP #$09
16a0 : 90 06 __ BCC $16a8 ; (SetUpSprites.s35 + 0)
.s1029:
16a2 : a9 45 __ LDA #$45
16a4 : c5 49 __ CMP T2 + 0 
16a6 : b0 05 __ BCS $16ad ; (SetUpSprites.s1028 + 0)
.s35:
16a8 : a9 00 __ LDA #$00
16aa : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1028:
16ad : a5 49 __ LDA T2 + 0 
16af : c9 13 __ CMP #$13
16b1 : 90 06 __ BCC $16b9 ; (SetUpSprites.s39 + 0)
.s1027:
16b3 : a9 3b __ LDA #$3b
16b5 : c5 49 __ CMP T2 + 0 
16b7 : b0 04 __ BCS $16bd ; (SetUpSprites.s1026 + 0)
.s39:
16b9 : a9 01 __ LDA #$01
16bb : d0 12 __ BNE $16cf ; (SetUpSprites.s236 + 0)
.s1026:
16bd : a5 49 __ LDA T2 + 0 
16bf : c9 1d __ CMP #$1d
16c1 : 90 06 __ BCC $16c9 ; (SetUpSprites.s43 + 0)
.s1025:
16c3 : a9 31 __ LDA #$31
16c5 : c5 49 __ CMP T2 + 0 
16c7 : b0 04 __ BCS $16cd ; (SetUpSprites.s44 + 0)
.s43:
16c9 : a9 02 __ LDA #$02
16cb : d0 02 __ BNE $16cf ; (SetUpSprites.s236 + 0)
.s44:
16cd : a9 03 __ LDA #$03
.s236:
16cf : 8d 23 9f STA $9f23 
16d2 : a9 00 __ LDA #$00
16d4 : 8d 23 9f STA $9f23 
16d7 : e6 49 __ INC T2 + 0 
16d9 : 4c 7c 0e JMP $0e7c ; (SetUpSprites.l14 + 0)
.s1024:
16dc : a9 2f __ LDA #$2f
16de : c5 25 __ CMP WORK + 2 
16e0 : a5 49 __ LDA T2 + 0 
16e2 : 90 33 __ BCC $1717 ; (SetUpSprites.s1017 + 0)
.s1023:
16e4 : c9 09 __ CMP #$09
16e6 : 90 06 __ BCC $16ee ; (SetUpSprites.s51 + 0)
.s1022:
16e8 : a9 45 __ LDA #$45
16ea : c5 49 __ CMP T2 + 0 
16ec : b0 05 __ BCS $16f3 ; (SetUpSprites.s1021 + 0)
.s51:
16ee : a9 05 __ LDA #$05
16f0 : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1021:
16f3 : a5 49 __ LDA T2 + 0 
16f5 : c9 13 __ CMP #$13
16f7 : 90 06 __ BCC $16ff ; (SetUpSprites.s55 + 0)
.s1020:
16f9 : a9 3b __ LDA #$3b
16fb : c5 49 __ CMP T2 + 0 
16fd : b0 04 __ BCS $1703 ; (SetUpSprites.s1019 + 0)
.s55:
16ff : a9 06 __ LDA #$06
1701 : d0 cc __ BNE $16cf ; (SetUpSprites.s236 + 0)
.s1019:
1703 : a5 49 __ LDA T2 + 0 
1705 : c9 1d __ CMP #$1d
1707 : 90 06 __ BCC $170f ; (SetUpSprites.s59 + 0)
.s1018:
1709 : a9 31 __ LDA #$31
170b : c5 49 __ CMP T2 + 0 
170d : b0 04 __ BCS $1713 ; (SetUpSprites.s60 + 0)
.s59:
170f : a9 07 __ LDA #$07
1711 : d0 bc __ BNE $16cf ; (SetUpSprites.s236 + 0)
.s60:
1713 : a9 08 __ LDA #$08
1715 : d0 b8 __ BNE $16cf ; (SetUpSprites.s236 + 0)
.s1017:
1717 : c9 09 __ CMP #$09
1719 : 90 06 __ BCC $1721 ; (SetUpSprites.s63 + 0)
.s1016:
171b : a9 45 __ LDA #$45
171d : c5 49 __ CMP T2 + 0 
171f : b0 05 __ BCS $1726 ; (SetUpSprites.s1005 + 0)
.s63:
1721 : a9 0c __ LDA #$0c
1723 : 4c b2 0e JMP $0eb2 ; (SetUpSprites.s219 + 0)
.s1005:
1726 : a5 49 __ LDA T2 + 0 
1728 : c9 13 __ CMP #$13
172a : 90 06 __ BCC $1732 ; (SetUpSprites.s67 + 0)
.s1004:
172c : a9 3b __ LDA #$3b
172e : c5 49 __ CMP T2 + 0 
1730 : b0 04 __ BCS $1736 ; (SetUpSprites.s71 + 0)
.s67:
1732 : a9 0d __ LDA #$0d
1734 : d0 99 __ BNE $16cf ; (SetUpSprites.s236 + 0)
.s71:
1736 : a9 0e __ LDA #$0e
1738 : d0 95 __ BNE $16cf ; (SetUpSprites.s236 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
173a : 46 2d __ LSR P0 ; (bank + 0)
173c : a9 00 __ LDA #$00
173e : 6a __ __ ROR
173f : 85 3b __ STA ACCU + 0 
1741 : a5 2f __ LDA P2 ; (mem + 1)
1743 : 29 f8 __ AND #$f8
1745 : 4a __ __ LSR
1746 : 05 3b __ ORA ACCU + 0 
1748 : 85 3b __ STA ACCU + 0 
174a : a5 30 __ LDA P3 ; (height + 0)
174c : 0a __ __ ASL
174d : 05 3b __ ORA ACCU + 0 
174f : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1751 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1752 : 46 2d __ LSR P0 ; (bank + 0)
1754 : a9 00 __ LDA #$00
1756 : 6a __ __ ROR
1757 : 85 3b __ STA ACCU + 0 
1759 : a5 2f __ LDA P2 ; (mem + 1)
175b : 4a __ __ LSR
175c : 05 3b __ ORA ACCU + 0 
.s1001:
175e : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
175f : ad 25 9f LDA $9f25 
1762 : 29 fe __ AND #$fe
1764 : 8d 25 9f STA $9f25 
1767 : a5 2d __ LDA P0 ; (addr + 0)
1769 : 8d 20 9f STA $9f20 
176c : a5 2e __ LDA P1 ; (addr + 1)
176e : 8d 21 9f STA $9f21 
1771 : a5 2f __ LDA P2 ; (addr + 2)
1773 : 29 01 __ AND #$01
1775 : 09 10 __ ORA #$10
1777 : 8d 22 9f STA $9f22 
177a : a5 33 __ LDA P6 ; (size + 0)
177c : 05 34 __ ORA P7 ; (size + 1)
177e : f0 19 __ BEQ $1799 ; (vram_putn.s1001 + 0)
.s6:
1780 : a0 00 __ LDY #$00
1782 : a6 33 __ LDX P6 ; (size + 0)
1784 : f0 02 __ BEQ $1788 ; (vram_putn.l1002 + 0)
.s1005:
1786 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1788 : b1 31 __ LDA (P4),y ; (data + 0)
178a : 8d 23 9f STA $9f23 
178d : c8 __ __ INY
178e : d0 02 __ BNE $1792 ; (vram_putn.s1009 + 0)
.s1008:
1790 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1792 : ca __ __ DEX
1793 : d0 f3 __ BNE $1788 ; (vram_putn.l1002 + 0)
.s1004:
1795 : c6 34 __ DEC P7 ; (size + 1)
1797 : d0 ef __ BNE $1788 ; (vram_putn.l1002 + 0)
.s1001:
1799 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1fd4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fe4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ff4 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2004 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2014 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2024 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2034 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2044 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2054 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2064 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2074 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
2084 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
2094 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
20a4 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
20b4 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
20c4 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
20d4 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
20e4 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
20f4 : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
2104 : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
2114 : __ __ __ BYT 55 55 55 55 55 55 55 55 aa aa aa aa aa aa aa aa : UUUUUUUU........
2124 : __ __ __ BYT aa aa aa aa aa aa aa aa 88 88 88 88 88 88 88 88 : ................
2134 : __ __ __ BYT 88 88 88 88 88 88 88 88 77 77 77 77 77 77 77 77 : ........wwwwwwww
2144 : __ __ __ BYT cc cc cc cc cc cc cc cc 00 00 00 00 00 00 00 00 : ................
2154 : __ __ __ BYT 05 00 00 50 00 09 90 00 00 9b b9 00 09 b5 5b 90 : ...P..........[.
2164 : __ __ __ BYT 09 b5 5b 90 00 9b b9 05 00 09 90 00 05 00 00 00 : ..[.............
2174 : __ __ __ BYT 13 11 11 11 11 11 11 31 11 19 91 11 11 9b b9 11 : .......1........
2184 : __ __ __ BYT 11 9b b9 11 11 19 91 13 11 11 11 11 13 11 11 11 : ................
2194 : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 19 91 11 : ................
21a4 : __ __ __ BYT 11 19 91 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
--------------------------------------------------------------------
rand:
.s0:
179a : ad b5 21 LDA $21b5 ; (seed + 1)
179d : 4a __ __ LSR
179e : ad b4 21 LDA $21b4 ; (seed + 0)
17a1 : 6a __ __ ROR
17a2 : aa __ __ TAX
17a3 : a9 00 __ LDA #$00
17a5 : 6a __ __ ROR
17a6 : 4d b4 21 EOR $21b4 ; (seed + 0)
17a9 : 85 3b __ STA ACCU + 0 
17ab : 8a __ __ TXA
17ac : 4d b5 21 EOR $21b5 ; (seed + 1)
17af : 85 3c __ STA ACCU + 1 
17b1 : 4a __ __ LSR
17b2 : 45 3b __ EOR ACCU + 0 
17b4 : 8d b4 21 STA $21b4 ; (seed + 0)
17b7 : 85 3b __ STA ACCU + 0 
17b9 : 45 3c __ EOR ACCU + 1 
17bb : 8d b5 21 STA $21b5 ; (seed + 1)
17be : 85 3c __ STA ACCU + 1 
.s1001:
17c0 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
21b4 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
21b6 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
21c6 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
21d6 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
21e6 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
21f6 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
2206 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
2216 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
2226 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
2236 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
2246 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
2256 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
2266 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
2276 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
2286 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
2296 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
22a6 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
22b6 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
22c6 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
22d6 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
22e6 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
22f6 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
2306 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
2316 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
2326 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
2336 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
2346 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
2356 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
2366 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
2376 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
2386 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
2396 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
23a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
23b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23d6 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
23e6 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
23f6 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2406 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2416 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
2426 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
2436 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
2446 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
2456 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2466 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2476 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
2486 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
2496 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
24a6 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
24b6 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
24c6 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
24d6 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
24e6 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
24f6 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2506 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2516 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2526 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2536 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
2546 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
2556 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
2566 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
2576 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
2586 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
2596 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
25a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
17c1 : ad 25 9f LDA $9f25 
17c4 : 29 fe __ AND #$fe
17c6 : 8d 25 9f STA $9f25 
17c9 : a5 2d __ LDA P0 ; (spr + 0)
17cb : 0a __ __ ASL
17cc : 0a __ __ ASL
17cd : 85 3b __ STA ACCU + 0 
17cf : a9 3f __ LDA #$3f
17d1 : 2a __ __ ROL
17d2 : 06 3b __ ASL ACCU + 0 
17d4 : 2a __ __ ROL
17d5 : 8d 21 9f STA $9f21 
17d8 : a5 3b __ LDA ACCU + 0 
17da : 8d 20 9f STA $9f20 
17dd : a9 11 __ LDA #$11
17df : 8d 22 9f STA $9f22 
17e2 : a5 30 __ LDA P3 ; (mode8 + 0)
17e4 : f0 02 __ BEQ $17e8 ; (vera_spr_set.s11 + 0)
.s9:
17e6 : a9 80 __ LDA #$80
.s11:
17e8 : 05 2f __ ORA P2 ; (addr32 + 1)
17ea : a6 2e __ LDX P1 ; (addr32 + 0)
17ec : 8e 23 9f STX $9f23 
17ef : 8d 23 9f STA $9f23 
17f2 : a9 00 __ LDA #$00
17f4 : 8d 23 9f STA $9f23 
17f7 : 8d 23 9f STA $9f23 
17fa : 8d 23 9f STA $9f23 
17fd : 8d 23 9f STA $9f23 
1800 : a5 33 __ LDA P6 ; (z + 0)
1802 : 0a __ __ ASL
1803 : 0a __ __ ASL
1804 : 8d 23 9f STA $9f23 
1807 : a5 32 __ LDA P5 ; (h + 0)
1809 : 4a __ __ LSR
180a : 6a __ __ ROR
180b : 29 80 __ AND #$80
180d : 6a __ __ ROR
180e : 85 3b __ STA ACCU + 0 
1810 : a5 31 __ LDA P4 ; (w + 0)
1812 : 0a __ __ ASL
1813 : 0a __ __ ASL
1814 : 0a __ __ ASL
1815 : 0a __ __ ASL
1816 : 05 3b __ ORA ACCU + 0 
1818 : 05 34 __ ORA P7 ; (pal + 0)
181a : 8d 23 9f STA $9f23 
.s1001:
181d : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
181e : ad 25 9f LDA $9f25 
1821 : 29 fe __ AND #$fe
1823 : 8d 25 9f STA $9f25 
1826 : a5 2d __ LDA P0 ; (spr + 0)
1828 : 0a __ __ ASL
1829 : 0a __ __ ASL
182a : 85 3b __ STA ACCU + 0 
182c : a9 3f __ LDA #$3f
182e : 2a __ __ ROL
182f : 06 3b __ ASL ACCU + 0 
1831 : 2a __ __ ROL
1832 : aa __ __ TAX
1833 : a5 3b __ LDA ACCU + 0 
1835 : 09 02 __ ORA #$02
1837 : 8d 20 9f STA $9f20 
183a : 8e 21 9f STX $9f21 
183d : a9 11 __ LDA #$11
183f : 8d 22 9f STA $9f22 
1842 : a5 2e __ LDA P1 ; (x + 0)
1844 : 8d 23 9f STA $9f23 
1847 : a5 2f __ LDA P2 ; (x + 1)
1849 : 8d 23 9f STA $9f23 
184c : a5 30 __ LDA P3 ; (y + 0)
184e : 8d 23 9f STA $9f23 
1851 : a5 31 __ LDA P4 ; (y + 1)
1853 : 8d 23 9f STA $9f23 
.s1001:
1856 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2600 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2610 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2620 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2630 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2640 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2650 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2660 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2670 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2680 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2690 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
26a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
26b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
26c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
26d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
26e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
26f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2730 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2750 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2760 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2770 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2780 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2790 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
27a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
27b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
27c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
27d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
27e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
27f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2800 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2810 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2820 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2830 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2840 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2850 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2860 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2870 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2880 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2890 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
28a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
28b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
28c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
28d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
28e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
28f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_spr_flip:
.s0:
1857 : ad 25 9f LDA $9f25 
185a : 29 fe __ AND #$fe
185c : 8d 25 9f STA $9f25 
185f : a5 2d __ LDA P0 ; (spr + 0)
1861 : 0a __ __ ASL
1862 : 0a __ __ ASL
1863 : 85 3b __ STA ACCU + 0 
1865 : a9 3f __ LDA #$3f
1867 : 2a __ __ ROL
1868 : 06 3b __ ASL ACCU + 0 
186a : 2a __ __ ROL
186b : aa __ __ TAX
186c : a5 3b __ LDA ACCU + 0 
186e : 09 06 __ ORA #$06
1870 : 8d 20 9f STA $9f20 
1873 : 8e 21 9f STX $9f21 
1876 : a9 01 __ LDA #$01
1878 : 8d 22 9f STA $9f22 
187b : ad 23 9f LDA $9f23 
187e : 29 fc __ AND #$fc
1880 : a8 __ __ TAY
1881 : a5 2e __ LDA P1 ; (fliph + 0)
1883 : f0 01 __ BEQ $1886 ; (vera_spr_flip.s14 + 0)
.s6:
1885 : c8 __ __ INY
.s14:
1886 : a5 2f __ LDA P2 ; (flipv + 0)
1888 : f0 05 __ BEQ $188f ; (vera_spr_flip.s11 + 0)
.s9:
188a : 98 __ __ TYA
188b : 09 02 __ ORA #$02
188d : d0 01 __ BNE $1890 ; (vera_spr_flip.s1002 + 0)
.s11:
188f : 98 __ __ TYA
.s1002:
1890 : 8d 23 9f STA $9f23 
.s1001:
1893 : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1894 : ad 25 9f LDA $9f25 
1897 : 29 fe __ AND #$fe
1899 : 8d 25 9f STA $9f25 
189c : a5 2d __ LDA P0 ; (index + 0)
189e : 0a __ __ ASL
189f : 8d 20 9f STA $9f20 
18a2 : a9 7d __ LDA #$7d
18a4 : 2a __ __ ROL
18a5 : 8d 21 9f STA $9f21 
18a8 : a9 11 __ LDA #$11
18aa : 8d 22 9f STA $9f22 
18ad : a5 30 __ LDA P3 ; (size + 0)
18af : 05 31 __ ORA P4 ; (size + 1)
18b1 : f0 29 __ BEQ $18dc ; (vera_pal_putn.s1001 + 0)
.s6:
18b3 : a6 30 __ LDX P3 ; (size + 0)
18b5 : f0 02 __ BEQ $18b9 ; (vera_pal_putn.l3 + 0)
.s1003:
18b7 : e6 31 __ INC P4 ; (size + 1)
.l3:
18b9 : a0 01 __ LDY #$01
18bb : b1 2e __ LDA (P1),y ; (color + 0)
18bd : 85 3c __ STA ACCU + 1 
18bf : 88 __ __ DEY
18c0 : b1 2e __ LDA (P1),y ; (color + 0)
18c2 : 8d 23 9f STA $9f23 
18c5 : a5 3c __ LDA ACCU + 1 
18c7 : 8d 23 9f STA $9f23 
18ca : 18 __ __ CLC
18cb : a5 2e __ LDA P1 ; (color + 0)
18cd : 69 02 __ ADC #$02
18cf : 85 2e __ STA P1 ; (color + 0)
18d1 : 90 02 __ BCC $18d5 ; (vera_pal_putn.s1007 + 0)
.s1006:
18d3 : e6 2f __ INC P2 ; (color + 1)
.s1007:
18d5 : ca __ __ DEX
18d6 : d0 e1 __ BNE $18b9 ; (vera_pal_putn.l3 + 0)
.s1002:
18d8 : c6 31 __ DEC P4 ; (size + 1)
18da : d0 dd __ BNE $18b9 ; (vera_pal_putn.l3 + 0)
.s1001:
18dc : 60 __ __ RTS
--------------------------------------------------------------------
palette:
25b6 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
25c6 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2910 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2920 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2930 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2940 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2950 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2960 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2970 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2980 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2990 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
29a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
29b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
29c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
29d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
29e0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
29f0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2a00 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2a10 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2a20 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2a30 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2a40 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2a50 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2a60 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2a70 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2a80 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2a90 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2aa0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2ab0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2ac0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2ad0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2ae0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2af0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
2b00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2b10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2b20 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2b30 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2b40 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2b50 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2b60 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2b70 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2b80 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2b90 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
2ba0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
2bb0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
2bc0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
2bd0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
2be0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
2bf0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2c10 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2c30 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2c40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2c50 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2c60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2c70 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2c80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2c90 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2ca0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2cb0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2cc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2cd0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2ce0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2cf0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2d00 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2d10 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2d20 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2d30 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2d40 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2d50 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2d60 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2d70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2d80 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2d90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2da0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2db0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2dc0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2dd0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2de0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2df0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2e00 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2e10 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2e20 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2e30 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2e40 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2e50 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2e60 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2e70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2e80 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2e90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2ea0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2eb0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2ec0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2ed0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2ee0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2ef0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2f00 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2f10 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2f20 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2f30 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2f40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2f50 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2f60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2f70 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2f80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2f90 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2fa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2fb0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2fc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
2fd0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
2fe0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2ff0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
3000 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3010 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3020 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3030 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3040 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3050 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3060 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3070 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3080 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3090 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
30a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
30b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
30c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
30d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
30e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
30f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3100 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3110 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3120 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3130 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3140 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3150 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3160 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3170 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3180 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3190 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
31a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
31b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
31c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
31d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
31e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
31f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
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
3400 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3410 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3420 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3430 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3440 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3450 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3460 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3470 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3480 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3490 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
34a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
34b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
34c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
34d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
34e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
34f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3500 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3510 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3520 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3530 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3540 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3550 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3560 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3570 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3580 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3590 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
35a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
35b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
35c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
35d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
35e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
35f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
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
--------------------------------------------------------------------
CharBox:
3800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3810 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3820 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3830 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3840 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3850 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3860 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3870 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3880 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3890 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
38a0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
38b0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
38c0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
38d0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
38e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3900 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3910 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3920 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3930 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3940 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3950 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3960 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3970 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3980 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3990 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
39a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
39c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
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
3c10 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3c20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c30 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3c40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c50 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3c60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c70 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3c80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c90 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3ca0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cb0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3cc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cd0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3ce0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cf0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3d00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d10 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3d20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d30 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3d40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d50 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3d60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d70 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3d80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3d90 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3da0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3db0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3dc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3dd0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
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
--------------------------------------------------------------------
WavyHead:
4000 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
4010 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4020 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4030 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4040 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4050 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4060 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
4070 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4080 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4090 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
40a0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
40b0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
40c0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
40d0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
40e0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
40f0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4100 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4110 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4120 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4130 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4140 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4150 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4160 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4170 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4180 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4190 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
41a0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
41b0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
41c0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
41d0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
41e0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
41f0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
4200 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
4210 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
4220 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
4230 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
4240 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
4250 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
4260 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
4270 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
18dd : ad fc 9e LDA $9efc ; (sstack + 0)
18e0 : 85 2d __ STA P0 
18e2 : ad fd 9e LDA $9efd ; (sstack + 1)
18e5 : 85 2e __ STA P1 
18e7 : ad fe 9e LDA $9efe ; (sstack + 2)
18ea : 85 2f __ STA P2 
18ec : ad ff 9e LDA $9eff ; (sstack + 3)
18ef : 85 30 __ STA P3 
18f1 : a5 35 __ LDA P8 ; (input + 0)
18f3 : 85 31 __ STA P4 
18f5 : a5 36 __ LDA P9 ; (input + 1)
18f7 : 85 32 __ STA P5 
18f9 : a5 37 __ LDA P10 ; (inputsize + 0)
18fb : 85 33 __ STA P6 
18fd : a9 00 __ LDA #$00
18ff : 85 34 __ STA P7 
1901 : 4c 5f 17 JMP $175f ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
25d6 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
25e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
4280 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
4290 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
42a0 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
42b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
42c0 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
42cc : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
42d8 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
42e8 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
4300 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
4310 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
4320 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
EyeTri:
432a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
433a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
434a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
435a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
436a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
437a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
438a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
439a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
43aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
43ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
43ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
440a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
441a : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
442a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
443a : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
444a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
445a : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
446a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
447a : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
448a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
449a : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
44aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44ba : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
44ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44da : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
44ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44fa : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
450a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
451a : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
452a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
453a : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
454a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
455a : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
456a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
457a : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
458a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
459a : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
45aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
45ba : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
45ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
45da : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
45ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
45fa : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
460a : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
461a : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
462a : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
463a : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
464a : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
465a : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
466a : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
467a : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
468a : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
469a : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
46aa : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
46ba : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
46ca : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
46da : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
46ea : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
46fa : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
470a : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
471a : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
BGPal:
472a : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
473a : __ __ __ BYT 99 09 9b 0f bb 0b ee 0f 44 04 ff 0f ff 0f ff 0f : ........D.......
--------------------------------------------------------------------
getchx:
.s0:
1904 : 20 0e 19 JSR $190e ; (getpch + 0)
1907 : 85 3b __ STA ACCU + 0 
1909 : a9 00 __ LDA #$00
190b : 85 3c __ STA ACCU + 1 
.s1001:
190d : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
190e : 20 e4 ff JSR $ffe4 
1911 : ae f6 25 LDX $25f6 ; (giocharmap + 0)
1914 : e0 01 __ CPX #$01
1916 : 90 26 __ BCC $193e ; (getpch + 48)
1918 : c9 0d __ CMP #$0d
191a : d0 02 __ BNE $191e ; (getpch + 16)
191c : a9 0a __ LDA #$0a
191e : e0 02 __ CPX #$02
1920 : 90 1c __ BCC $193e ; (getpch + 48)
1922 : c9 db __ CMP #$db
1924 : b0 18 __ BCS $193e ; (getpch + 48)
1926 : c9 41 __ CMP #$41
1928 : 90 14 __ BCC $193e ; (getpch + 48)
192a : c9 c1 __ CMP #$c1
192c : 90 02 __ BCC $1930 ; (getpch + 34)
192e : 49 a0 __ EOR #$a0
1930 : c9 7b __ CMP #$7b
1932 : b0 0a __ BCS $193e ; (getpch + 48)
1934 : c9 61 __ CMP #$61
1936 : b0 04 __ BCS $193c ; (getpch + 46)
1938 : c9 5b __ CMP #$5b
193a : b0 02 __ BCS $193e ; (getpch + 48)
193c : 49 20 __ EOR #$20
193e : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
25f6 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
25f7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
25f9 : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
25fb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
25fd : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
193f : a9 33 __ LDA #$33
1941 : 85 2d __ STA P0 
1943 : a9 38 __ LDA #$38
1945 : 85 2e __ STA P1 
1947 : a9 01 __ LDA #$01
1949 : 85 2f __ STA P2 
194b : a6 32 __ LDX P5 ; (p + 0)
194d : bd 00 48 LDA $4800,x ; (sintab + 0)
1950 : 4a __ __ LSR
1951 : 4a __ __ LSR
1952 : 4a __ __ LSR
1953 : 49 10 __ EOR #$10
1955 : 38 __ __ SEC
1956 : e9 10 __ SBC #$10
1958 : 18 __ __ CLC
1959 : 69 b4 __ ADC #$b4
195b : 85 30 __ STA P3 
195d : a9 00 __ LDA #$00
195f : 85 31 __ STA P4 
1961 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1964 : a9 34 __ LDA #$34
1966 : 85 2d __ STA P0 
1968 : a9 20 __ LDA #$20
196a : 85 2e __ STA P1 
196c : a6 34 __ LDX P7 ; (p2 + 0)
196e : bd 00 48 LDA $4800,x ; (sintab + 0)
1971 : 4a __ __ LSR
1972 : 4a __ __ LSR
1973 : 4a __ __ LSR
1974 : 49 10 __ EOR #$10
1976 : 38 __ __ SEC
1977 : e9 10 __ SBC #$10
1979 : 18 __ __ CLC
197a : 69 b4 __ ADC #$b4
197c : 85 30 __ STA P3 
197e : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1981 : a9 35 __ LDA #$35
1983 : 85 2d __ STA P0 
1985 : a9 00 __ LDA #$00
1987 : 85 2e __ STA P1 
1989 : a6 36 __ LDX P9 ; (p3 + 0)
198b : bd 00 48 LDA $4800,x ; (sintab + 0)
198e : 4a __ __ LSR
198f : 4a __ __ LSR
1990 : 4a __ __ LSR
1991 : 49 10 __ EOR #$10
1993 : 38 __ __ SEC
1994 : e9 10 __ SBC #$10
1996 : 18 __ __ CLC
1997 : 69 a4 __ ADC #$a4
1999 : 85 30 __ STA P3 
199b : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
199e : a9 36 __ LDA #$36
19a0 : 85 2d __ STA P0 
19a2 : a9 40 __ LDA #$40
19a4 : 85 2e __ STA P1 
19a6 : a6 36 __ LDX P9 ; (p3 + 0)
19a8 : bd 00 48 LDA $4800,x ; (sintab + 0)
19ab : 4a __ __ LSR
19ac : 4a __ __ LSR
19ad : 4a __ __ LSR
19ae : 49 10 __ EOR #$10
19b0 : 38 __ __ SEC
19b1 : e9 10 __ SBC #$10
19b3 : 18 __ __ CLC
19b4 : 69 a4 __ ADC #$a4
19b6 : 85 30 __ STA P3 
19b8 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
19bb : a9 37 __ LDA #$37
19bd : 85 2d __ STA P0 
19bf : a9 00 __ LDA #$00
19c1 : 85 2e __ STA P1 
19c3 : a6 36 __ LDX P9 ; (p3 + 0)
19c5 : bd 00 48 LDA $4800,x ; (sintab + 0)
19c8 : 4a __ __ LSR
19c9 : 4a __ __ LSR
19ca : 4a __ __ LSR
19cb : 49 10 __ EOR #$10
19cd : 38 __ __ SEC
19ce : e9 10 __ SBC #$10
19d0 : 18 __ __ CLC
19d1 : 69 c4 __ ADC #$c4
19d3 : 85 30 __ STA P3 
19d5 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
19d8 : a9 38 __ LDA #$38
19da : 85 2d __ STA P0 
19dc : a9 40 __ LDA #$40
19de : 85 2e __ STA P1 
19e0 : a6 36 __ LDX P9 ; (p3 + 0)
19e2 : bd 00 48 LDA $4800,x ; (sintab + 0)
19e5 : 4a __ __ LSR
19e6 : 4a __ __ LSR
19e7 : 4a __ __ LSR
19e8 : 49 10 __ EOR #$10
19ea : 38 __ __ SEC
19eb : e9 10 __ SBC #$10
19ed : 18 __ __ CLC
19ee : 69 c4 __ ADC #$c4
19f0 : 85 30 __ STA P3 
19f2 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
19f5 : a9 00 __ LDA #$00
19f7 : 85 2d __ STA P0 
19f9 : 85 2f __ STA P2 
19fb : a9 68 __ LDA #$68
19fd : 85 2e __ STA P1 
19ff : a6 36 __ LDX P9 ; (p3 + 0)
1a01 : bd 00 48 LDA $4800,x ; (sintab + 0)
1a04 : 4a __ __ LSR
1a05 : 4a __ __ LSR
1a06 : 4a __ __ LSR
1a07 : 4a __ __ LSR
1a08 : 49 08 __ EOR #$08
1a0a : 38 __ __ SEC
1a0b : e9 08 __ SBC #$08
1a0d : 85 48 __ STA T2 + 0 
1a0f : a9 00 __ LDA #$00
1a11 : e9 00 __ SBC #$00
1a13 : 85 49 __ STA T2 + 1 
1a15 : 38 __ __ SEC
1a16 : a9 b6 __ LDA #$b6
1a18 : e5 48 __ SBC T2 + 0 
1a1a : 85 30 __ STA P3 
1a1c : a9 01 __ LDA #$01
1a1e : e5 49 __ SBC T2 + 1 
1a20 : 85 31 __ STA P4 
1a22 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1a25 : a9 01 __ LDA #$01
1a27 : 85 2d __ STA P0 
1a29 : 85 2f __ STA P2 
1a2b : a9 f0 __ LDA #$f0
1a2d : 85 2e __ STA P1 
1a2f : a6 36 __ LDX P9 ; (p3 + 0)
1a31 : bd 00 48 LDA $4800,x ; (sintab + 0)
1a34 : 4a __ __ LSR
1a35 : 4a __ __ LSR
1a36 : 4a __ __ LSR
1a37 : 4a __ __ LSR
1a38 : 49 08 __ EOR #$08
1a3a : 38 __ __ SEC
1a3b : e9 08 __ SBC #$08
1a3d : a8 __ __ TAY
1a3e : a9 00 __ LDA #$00
1a40 : e9 00 __ SBC #$00
1a42 : aa __ __ TAX
1a43 : 98 __ __ TYA
1a44 : 18 __ __ CLC
1a45 : 69 b6 __ ADC #$b6
1a47 : 85 30 __ STA P3 
1a49 : 8a __ __ TXA
1a4a : 69 01 __ ADC #$01
1a4c : 85 31 __ STA P4 
1a4e : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1a51 : a9 00 __ LDA #$00
1a53 : 85 47 __ STA T1 + 0 
1a55 : 18 __ __ CLC
.l2:
1a56 : a5 47 __ LDA T1 + 0 
1a58 : 69 4f __ ADC #$4f
1a5a : 85 2d __ STA P0 
1a5c : a5 47 __ LDA T1 + 0 
1a5e : 0a __ __ ASL
1a5f : 65 47 __ ADC T1 + 0 
1a61 : 0a __ __ ASL
1a62 : 0a __ __ ASL
1a63 : 18 __ __ CLC
1a64 : 6d f8 42 ADC $42f8 ; (FrameCount + 0)
1a67 : aa __ __ TAX
1a68 : ac f9 42 LDY $42f9 ; (FrameCount + 1)
1a6b : bd 00 48 LDA $4800,x ; (sintab + 0)
1a6e : 10 01 __ BPL $1a71 ; (MoveSprites.s1008 + 0)
.s1007:
1a70 : 88 __ __ DEY
.s1008:
1a71 : 18 __ __ CLC
1a72 : 6d f8 42 ADC $42f8 ; (FrameCount + 0)
1a75 : 85 48 __ STA T2 + 0 
1a77 : 90 01 __ BCC $1a7a ; (MoveSprites.s1009 + 0)
.s1006:
1a79 : c8 __ __ INY
.s1009:
1a7a : 84 49 __ STY T2 + 1 
1a7c : a5 47 __ LDA T1 + 0 
1a7e : 0a __ __ ASL
1a7f : 0a __ __ ASL
1a80 : 85 3b __ STA ACCU + 0 
1a82 : a9 00 __ LDA #$00
1a84 : 85 3c __ STA ACCU + 1 
1a86 : a9 80 __ LDA #$80
1a88 : 85 23 __ STA WORK + 0 
1a8a : a9 02 __ LDA #$02
1a8c : 85 24 __ STA WORK + 1 
1a8e : 20 22 1f JSR $1f22 ; (divmod + 0)
1a91 : 18 __ __ CLC
1a92 : a5 25 __ LDA WORK + 2 
1a94 : 65 48 __ ADC T2 + 0 
1a96 : 85 2e __ STA P1 
1a98 : a5 26 __ LDA WORK + 3 
1a9a : 65 49 __ ADC T2 + 1 
1a9c : 85 2f __ STA P2 
1a9e : a5 47 __ LDA T1 + 0 
1aa0 : 0a __ __ ASL
1aa1 : 0a __ __ ASL
1aa2 : 65 47 __ ADC T1 + 0 
1aa4 : 85 48 __ STA T2 + 0 
1aa6 : ad f8 42 LDA $42f8 ; (FrameCount + 0)
1aa9 : 38 __ __ SEC
1aaa : e9 40 __ SBC #$40
1aac : 18 __ __ CLC
1aad : 65 48 __ ADC T2 + 0 
1aaf : aa __ __ TAX
1ab0 : bd 00 48 LDA $4800,x ; (sintab + 0)
1ab3 : a8 __ __ TAY
1ab4 : 29 80 __ AND #$80
1ab6 : 10 02 __ BPL $1aba ; (MoveSprites.s1009 + 64)
1ab8 : a9 ff __ LDA #$ff
1aba : 85 49 __ STA T2 + 1 
1abc : a5 47 __ LDA T1 + 0 
1abe : 0a __ __ ASL
1abf : 0a __ __ ASL
1ac0 : 0a __ __ ASL
1ac1 : 85 3b __ STA ACCU + 0 
1ac3 : ad f8 42 LDA $42f8 ; (FrameCount + 0)
1ac6 : 38 __ __ SEC
1ac7 : e9 20 __ SBC #$20
1ac9 : 18 __ __ CLC
1aca : 65 3b __ ADC ACCU + 0 
1acc : aa __ __ TAX
1acd : bd 00 48 LDA $4800,x ; (sintab + 0)
1ad0 : 4a __ __ LSR
1ad1 : 4a __ __ LSR
1ad2 : 4a __ __ LSR
1ad3 : 4a __ __ LSR
1ad4 : 49 08 __ EOR #$08
1ad6 : 38 __ __ SEC
1ad7 : e9 08 __ SBC #$08
1ad9 : 85 4a __ STA T3 + 0 
1adb : a9 00 __ LDA #$00
1add : e9 00 __ SBC #$00
1adf : 85 4b __ STA T3 + 1 
1ae1 : a5 47 __ LDA T1 + 0 
1ae3 : 0a __ __ ASL
1ae4 : 65 47 __ ADC T1 + 0 
1ae6 : 85 3b __ STA ACCU + 0 
1ae8 : a5 47 __ LDA T1 + 0 
1aea : c9 1f __ CMP #$1f
1aec : f0 27 __ BEQ $1b15 ; (MoveSprites.s5 + 0)
.s6:
1aee : 98 __ __ TYA
1aef : 18 __ __ CLC
1af0 : 69 80 __ ADC #$80
1af2 : 18 __ __ CLC
1af3 : 65 4a __ ADC T3 + 0 
1af5 : a8 __ __ TAY
1af6 : a9 00 __ LDA #$00
1af8 : 65 4b __ ADC T3 + 1 
1afa : aa __ __ TAX
1afb : 98 __ __ TYA
1afc : 18 __ __ CLC
1afd : 65 3b __ ADC ACCU + 0 
1aff : 85 30 __ STA P3 
1b01 : 90 01 __ BCC $1b04 ; (MoveSprites.s1013 + 0)
.s1012:
1b03 : e8 __ __ INX
.s1013:
1b04 : 86 31 __ STX P4 
1b06 : 20 1e 18 JSR $181e ; (vera_spr_move.s0 + 0)
1b09 : e6 47 __ INC T1 + 0 
1b0b : a5 47 __ LDA T1 + 0 
1b0d : c9 20 __ CMP #$20
1b0f : b0 03 __ BCS $1b14 ; (MoveSprites.s1001 + 0)
1b11 : 4c 56 1a JMP $1a56 ; (MoveSprites.l2 + 0)
.s1001:
1b14 : 60 __ __ RTS
.s5:
1b15 : 98 __ __ TYA
1b16 : 18 __ __ CLC
1b17 : 69 78 __ ADC #$78
1b19 : a8 __ __ TAY
1b1a : a5 49 __ LDA T2 + 1 
1b1c : 69 00 __ ADC #$00
1b1e : aa __ __ TAX
1b1f : 98 __ __ TYA
1b20 : 18 __ __ CLC
1b21 : 65 4a __ ADC T3 + 0 
1b23 : a8 __ __ TAY
1b24 : 8a __ __ TXA
1b25 : 65 4b __ ADC T3 + 1 
1b27 : aa __ __ TAX
1b28 : 98 __ __ TYA
1b29 : 18 __ __ CLC
1b2a : 65 3b __ ADC ACCU + 0 
1b2c : 85 30 __ STA P3 
1b2e : 90 01 __ BCC $1b31 ; (MoveSprites.s1011 + 0)
.s1010:
1b30 : e8 __ __ INX
.s1011:
1b31 : 86 31 __ STX P4 
1b33 : 4c 1e 18 JMP $181e ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4800 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4810 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4820 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4830 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4840 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4850 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4860 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4870 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4880 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4890 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
48a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
48b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
48c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
48d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
48e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
48f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
42f8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1b36 : a9 08 __ LDA #$08
1b38 : 8d 2c 9f STA $9f2c 
1b3b : a5 33 __ LDA P6 ; (TuneSelection + 1)
1b3d : c5 35 __ CMP P8 ; (LastSong + 1)
1b3f : d0 0d __ BNE $1b4e ; (PlayZSM.s1 + 0)
.s1005:
1b41 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1b43 : c5 34 __ CMP P7 ; (LastSong + 0)
1b45 : d0 07 __ BNE $1b4e ; (PlayZSM.s1 + 0)
.s4:
1b47 : 20 7a 1b JSR $1b7a ; (zsm_check.s0 + 0)
1b4a : 09 00 __ ORA #$00
1b4c : f0 20 __ BEQ $1b6e ; (PlayZSM.s1001 + 0)
.s1:
1b4e : a5 33 __ LDA P6 ; (TuneSelection + 1)
1b50 : d0 1c __ BNE $1b6e ; (PlayZSM.s1001 + 0)
.s1004:
1b52 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1b54 : c9 01 __ CMP #$01
1b56 : d0 07 __ BNE $1b5f ; (PlayZSM.s1003 + 0)
.s6:
1b58 : a9 1d __ LDA #$1d
1b5a : a0 3d __ LDY #$3d
1b5c : 4c 73 1b JMP $1b73 ; (PlayZSM.s18 + 0)
.s1003:
1b5f : c9 02 __ CMP #$02
1b61 : d0 07 __ BNE $1b6a ; (PlayZSM.s1002 + 0)
.s8:
1b63 : a9 1d __ LDA #$1d
1b65 : a0 5b __ LDY #$5b
1b67 : 4c 73 1b JMP $1b73 ; (PlayZSM.s18 + 0)
.s1002:
1b6a : c9 03 __ CMP #$03
1b6c : f0 01 __ BEQ $1b6f ; (PlayZSM.s10 + 0)
.s1001:
1b6e : 60 __ __ RTS
.s10:
1b6f : a9 1d __ LDA #$1d
1b71 : a0 80 __ LDY #$80
.s18:
1b73 : 84 30 __ STY P3 
1b75 : 85 31 __ STA P4 
1b77 : 4c 7e 1b JMP $1b7e ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1b7a : ad d2 1f LDA $1fd2 ; (zsm_finished + 0)
.s1001:
1b7d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1b7e : a9 01 __ LDA #$01
1b80 : 8d d2 1f STA $1fd2 ; (zsm_finished + 0)
1b83 : ad ff 25 LDA $25ff ; (zsm_reading + 0)
1b86 : f0 0a __ BEQ $1b92 ; (zsm_init.s3 + 0)
.s1:
1b88 : a9 02 __ LDA #$02
1b8a : 20 df 1b JSR $1bdf ; (krnio_close.s1000 + 0)
1b8d : a9 00 __ LDA #$00
1b8f : 8d ff 25 STA $25ff ; (zsm_reading + 0)
.s3:
1b92 : 20 e7 1b JSR $1be7 ; (zsm_silence.s0 + 0)
1b95 : 20 ff 1b JSR $1bff ; (zsm_save_volume.s0 + 0)
1b98 : a9 00 __ LDA #$00
1b9a : 8d 90 47 STA $4790 ; (zsm_pos + 0)
1b9d : 8d 91 47 STA $4791 ; (zsm_pos + 1)
1ba0 : 8d a2 47 STA $47a2 ; (zsm_wpos + 0)
1ba3 : 8d a3 47 STA $47a3 ; (zsm_wpos + 1)
1ba6 : 8d 8f 47 STA $478f ; (zsm_delay + 0)
1ba9 : a5 30 __ LDA P3 ; (fname + 0)
1bab : 85 2d __ STA P0 
1bad : a5 31 __ LDA P4 ; (fname + 1)
1baf : 85 2e __ STA P1 
1bb1 : 20 31 1c JSR $1c31 ; (krnio_setnam.s0 + 0)
1bb4 : a9 02 __ LDA #$02
1bb6 : 85 2d __ STA P0 
1bb8 : 85 2f __ STA P2 
1bba : a9 08 __ LDA #$08
1bbc : 85 2e __ STA P1 
1bbe : 20 47 1c JSR $1c47 ; (krnio_open.s0 + 0)
1bc1 : a5 3b __ LDA ACCU + 0 
1bc3 : f0 19 __ BEQ $1bde ; (zsm_init.s1001 + 0)
.s4:
1bc5 : a9 01 __ LDA #$01
1bc7 : 8d ff 25 STA $25ff ; (zsm_reading + 0)
1bca : 20 6f 1c JSR $1c6f ; (zsm_fill.s0 + 0)
1bcd : a9 10 __ LDA #$10
1bcf : 8d 90 47 STA $4790 ; (zsm_pos + 0)
1bd2 : a9 00 __ LDA #$00
1bd4 : 8d 91 47 STA $4791 ; (zsm_pos + 1)
1bd7 : 8d d2 1f STA $1fd2 ; (zsm_finished + 0)
1bda : a9 01 __ LDA #$01
1bdc : 85 3b __ STA ACCU + 0 
.s1001:
1bde : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
25ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
1bdf : 85 2d __ STA P0 
.s0:
1be1 : a5 2d __ LDA P0 
1be3 : 20 c3 ff JSR $ffc3 
.s1001:
1be6 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_silence:
.s0:
1be7 : a9 00 __ LDA #$00
1be9 : 85 47 __ STA T0 + 0 
1beb : a9 08 __ LDA #$08
1bed : 85 2d __ STA P0 
1bef : a9 00 __ LDA #$00
.l1006:
1bf1 : 85 2e __ STA P1 
1bf3 : 20 9e 0d JSR $0d9e ; (sfx_put.l1 + 0)
1bf6 : e6 47 __ INC T0 + 0 
1bf8 : a5 47 __ LDA T0 + 0 
1bfa : c9 08 __ CMP #$08
1bfc : 90 f3 __ BCC $1bf1 ; (zsm_silence.l1006 + 0)
.s1001:
1bfe : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1bff : a0 00 __ LDY #$00
1c01 : 84 3c __ STY ACCU + 1 
1c03 : a2 02 __ LDX #$02
1c05 : 18 __ __ CLC
.l1006:
1c06 : 8a __ __ TXA
1c07 : 09 c0 __ ORA #$c0
1c09 : 8d 20 9f STA $9f20 
1c0c : a5 3c __ LDA ACCU + 1 
1c0e : 09 f9 __ ORA #$f9
1c10 : 8d 21 9f STA $9f21 
1c13 : a9 01 __ LDA #$01
1c15 : 8d 22 9f STA $9f22 
1c18 : ad 23 9f LDA $9f23 
1c1b : 99 92 47 STA $4792,y ; (vera_volumes + 0)
1c1e : a9 00 __ LDA #$00
1c20 : 8d 23 9f STA $9f23 
1c23 : 8a __ __ TXA
1c24 : 69 04 __ ADC #$04
1c26 : aa __ __ TAX
1c27 : 90 02 __ BCC $1c2b ; (zsm_save_volume.s1009 + 0)
.s1008:
1c29 : e6 3c __ INC ACCU + 1 
.s1009:
1c2b : c8 __ __ INY
1c2c : c0 10 __ CPY #$10
1c2e : 90 d6 __ BCC $1c06 ; (zsm_save_volume.l1006 + 0)
.s1001:
1c30 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
4792 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
47a2 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1c31 : a5 2d __ LDA P0 
1c33 : 05 2e __ ORA P1 
1c35 : f0 08 __ BEQ $1c3f ; (krnio_setnam.s0 + 14)
1c37 : a0 ff __ LDY #$ff
1c39 : c8 __ __ INY
1c3a : b1 2d __ LDA (P0),y 
1c3c : d0 fb __ BNE $1c39 ; (krnio_setnam.s0 + 8)
1c3e : 98 __ __ TYA
1c3f : a6 2d __ LDX P0 
1c41 : a4 2e __ LDY P1 
1c43 : 20 bd ff JSR $ffbd 
.s1001:
1c46 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1c47 : a9 00 __ LDA #$00
1c49 : a6 2d __ LDX P0 ; (fnum + 0)
1c4b : 9d a4 47 STA $47a4,x ; (krnio_pstatus + 0)
1c4e : a9 00 __ LDA #$00
1c50 : 85 3b __ STA ACCU + 0 
1c52 : 85 3c __ STA ACCU + 1 
1c54 : a5 2d __ LDA P0 ; (fnum + 0)
1c56 : a6 2e __ LDX P1 
1c58 : a4 2f __ LDY P2 
1c5a : 20 ba ff JSR $ffba 
1c5d : 20 c0 ff JSR $ffc0 
1c60 : 90 08 __ BCC $1c6a ; (krnio_open.s0 + 35)
1c62 : a5 2d __ LDA P0 ; (fnum + 0)
1c64 : 20 c3 ff JSR $ffc3 
1c67 : 4c 6e 1c JMP $1c6e ; (krnio_open.s1001 + 0)
1c6a : a9 01 __ LDA #$01
1c6c : 85 3b __ STA ACCU + 0 
.s1001:
1c6e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
47a4 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1c6f : ad ff 25 LDA $25ff ; (zsm_reading + 0)
1c72 : f0 20 __ BEQ $1c94 ; (zsm_fill.s1 + 0)
.s2:
1c74 : ad 91 47 LDA $4791 ; (zsm_pos + 1)
1c77 : 18 __ __ CLC
1c78 : 69 04 __ ADC #$04
1c7a : cd a3 47 CMP $47a3 ; (zsm_wpos + 1)
1c7d : d0 0c __ BNE $1c8b ; (zsm_fill.s6 + 0)
.s1006:
1c7f : ad a2 47 LDA $47a2 ; (zsm_wpos + 0)
1c82 : cd 90 47 CMP $4790 ; (zsm_pos + 0)
1c85 : d0 04 __ BNE $1c8b ; (zsm_fill.s6 + 0)
.s5:
1c87 : a9 00 __ LDA #$00
1c89 : f0 0b __ BEQ $1c96 ; (zsm_fill.s1008 + 0)
.s6:
1c8b : a9 02 __ LDA #$02
1c8d : 20 13 1d JSR $1d13 ; (krnio_chkin.s1000 + 0)
1c90 : a5 3b __ LDA ACCU + 0 
1c92 : d0 07 __ BNE $1c9b ; (zsm_fill.s9 + 0)
.s1:
1c94 : a9 ff __ LDA #$ff
.s1008:
1c96 : 85 3b __ STA ACCU + 0 
.s1001:
1c98 : 85 3c __ STA ACCU + 1 
1c9a : 60 __ __ RTS
.s9:
1c9b : a9 00 __ LDA #$00
1c9d : 85 47 __ STA T1 + 0 
1c9f : 85 48 __ STA T1 + 1 
1ca1 : ad 91 47 LDA $4791 ; (zsm_pos + 1)
1ca4 : 18 __ __ CLC
1ca5 : 69 04 __ ADC #$04
1ca7 : cd a3 47 CMP $47a3 ; (zsm_wpos + 1)
1caa : d0 08 __ BNE $1cb4 ; (zsm_fill.l13 + 0)
.s1002:
1cac : ad a2 47 LDA $47a2 ; (zsm_wpos + 0)
1caf : cd 90 47 CMP $4790 ; (zsm_pos + 0)
1cb2 : f0 49 __ BEQ $1cfd ; (zsm_fill.s38 + 0)
.l13:
1cb4 : 20 25 1d JSR $1d25 ; (krnio_chrin.s0 + 0)
1cb7 : ad a2 47 LDA $47a2 ; (zsm_wpos + 0)
1cba : aa __ __ TAX
1cbb : 18 __ __ CLC
1cbc : 69 01 __ ADC #$01
1cbe : 8d a2 47 STA $47a2 ; (zsm_wpos + 0)
1cc1 : ad a3 47 LDA $47a3 ; (zsm_wpos + 1)
1cc4 : a8 __ __ TAY
1cc5 : 69 00 __ ADC #$00
1cc7 : 8d a3 47 STA $47a3 ; (zsm_wpos + 1)
1cca : 8a __ __ TXA
1ccb : 18 __ __ CLC
1ccc : 69 c4 __ ADC #$c4
1cce : 85 49 __ STA T3 + 0 
1cd0 : 98 __ __ TYA
1cd1 : 29 03 __ AND #$03
1cd3 : 69 58 __ ADC #$58
1cd5 : 85 4a __ STA T3 + 1 
1cd7 : a5 3b __ LDA ACCU + 0 
1cd9 : a0 00 __ LDY #$00
1cdb : 91 49 __ STA (T3 + 0),y 
1cdd : e6 47 __ INC T1 + 0 
1cdf : d0 02 __ BNE $1ce3 ; (zsm_fill.s1010 + 0)
.s1009:
1ce1 : e6 48 __ INC T1 + 1 
.s1010:
1ce3 : 20 2f 1d JSR $1d2f ; (krnio_status.s0 + 0)
1ce6 : a5 3b __ LDA ACCU + 0 
1ce8 : d0 0e __ BNE $1cf8 ; (zsm_fill.s15 + 0)
.s12:
1cea : ad 91 47 LDA $4791 ; (zsm_pos + 1)
1ced : 18 __ __ CLC
1cee : 69 04 __ ADC #$04
1cf0 : cd a3 47 CMP $47a3 ; (zsm_wpos + 1)
1cf3 : d0 bf __ BNE $1cb4 ; (zsm_fill.l13 + 0)
1cf5 : 4c ac 1c JMP $1cac ; (zsm_fill.s1002 + 0)
.s15:
1cf8 : a9 00 __ LDA #$00
1cfa : 8d ff 25 STA $25ff ; (zsm_reading + 0)
.s38:
1cfd : 20 39 1d JSR $1d39 ; (krnio_clrchn.s0 + 0)
1d00 : ad ff 25 LDA $25ff ; (zsm_reading + 0)
1d03 : d0 05 __ BNE $1d0a ; (zsm_fill.s21 + 0)
.s19:
1d05 : a9 02 __ LDA #$02
1d07 : 20 df 1b JSR $1bdf ; (krnio_close.s1000 + 0)
.s21:
1d0a : a5 47 __ LDA T1 + 0 
1d0c : 85 3b __ STA ACCU + 0 
1d0e : a5 48 __ LDA T1 + 1 
1d10 : 4c 98 1c JMP $1c98 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1d13 : 85 2d __ STA P0 
.s0:
1d15 : a6 2d __ LDX P0 
1d17 : 20 c6 ff JSR $ffc6 
1d1a : a9 00 __ LDA #$00
1d1c : 85 3c __ STA ACCU + 1 
1d1e : b0 02 __ BCS $1d22 ; (krnio_chkin.s0 + 13)
1d20 : a9 01 __ LDA #$01
1d22 : 85 3b __ STA ACCU + 0 
.s1001:
1d24 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1d25 : 20 cf ff JSR $ffcf 
1d28 : 85 3b __ STA ACCU + 0 
1d2a : a9 00 __ LDA #$00
1d2c : 85 3c __ STA ACCU + 1 
.s1001:
1d2e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1d2f : 20 b7 ff JSR $ffb7 
1d32 : 85 3b __ STA ACCU + 0 
1d34 : a9 00 __ LDA #$00
1d36 : 85 3c __ STA ACCU + 1 
.s1001:
1d38 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1d39 : 20 cc ff JSR $ffcc 
.s1001:
1d3c : 60 __ __ RTS
--------------------------------------------------------------------
1d3d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1d4d : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1d5b : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1d6b : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1d7b : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
1d80 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1d90 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
1da0 : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
LastSelectedSong:
42fa : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
42fb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
474a : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
475a : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1da7 : a9 10 __ LDA #$10
1da9 : 85 30 __ STA P3 
1dab : a9 00 __ LDA #$00
1dad : 85 31 __ STA P4 
1daf : a5 32 __ LDA P5 ; (Palette + 0)
1db1 : 85 2e __ STA P1 
1db3 : 85 47 __ STA T0 + 0 
1db5 : a5 33 __ LDA P6 ; (Palette + 1)
1db7 : 85 2f __ STA P2 
1db9 : 85 48 __ STA T0 + 1 
1dbb : a5 34 __ LDA P7 ; (index + 0)
1dbd : 85 2d __ STA P0 
1dbf : ad fc 9e LDA $9efc ; (sstack + 0)
1dc2 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1dc4 : 0a __ __ ASL
1dc5 : 85 49 __ STA T3 + 0 
1dc7 : ad fd 9e LDA $9efd ; (sstack + 1)
1dca : 2a __ __ ROL
1dcb : 18 __ __ CLC
1dcc : 65 33 __ ADC P6 ; (Palette + 1)
1dce : 85 4a __ STA T3 + 1 
1dd0 : a4 32 __ LDY P5 ; (Palette + 0)
1dd2 : b1 49 __ LDA (T3 + 0),y 
1dd4 : aa __ __ TAX
1dd5 : c8 __ __ INY
1dd6 : b1 49 __ LDA (T3 + 0),y 
1dd8 : 86 49 __ STX T3 + 0 
1dda : 85 4a __ STA T3 + 1 
1ddc : a9 00 __ LDA #$00
1dde : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1de0 : ad fe 9e LDA $9efe ; (sstack + 2)
1de3 : 85 4b __ STA T5 + 0 
1de5 : 38 __ __ SEC
1de6 : e9 01 __ SBC #$01
1de8 : 85 4d __ STA T6 + 0 
1dea : ad ff 9e LDA $9eff ; (sstack + 3)
1ded : 85 4c __ STA T5 + 1 
1def : e9 00 __ SBC #$00
1df1 : 85 4e __ STA T6 + 1 
1df3 : d0 06 __ BNE $1dfb ; (SetPaletteIndex.s5 + 0)
.s1004:
1df5 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1df7 : c5 4d __ CMP T6 + 0 
1df9 : b0 38 __ BCS $1e33 ; (SetPaletteIndex.s4 + 0)
.s5:
1dfb : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1dfd : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1dff : 18 __ __ CLC
1e00 : a5 32 __ LDA P5 ; (Palette + 0)
1e02 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1e04 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1e06 : a5 33 __ LDA P6 ; (Palette + 1)
1e08 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1e0a : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1e0c : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1e0f : a0 02 __ LDY #$02
1e11 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1e13 : a0 00 __ LDY #$00
1e15 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1e17 : a0 03 __ LDY #$03
1e19 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1e1b : a0 01 __ LDY #$01
1e1d : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1e1f : 18 __ __ CLC
1e20 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1e22 : 69 02 __ ADC #$02
1e24 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1e26 : 90 02 __ BCC $1e2a ; (SetPaletteIndex.s1008 + 0)
.s1007:
1e28 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1e2a : e8 __ __ INX
1e2b : a5 4e __ LDA T6 + 1 
1e2d : d0 e0 __ BNE $1e0f ; (SetPaletteIndex.l2 + 0)
.s1002:
1e2f : e4 4d __ CPX T6 + 0 
1e31 : 90 dc __ BCC $1e0f ; (SetPaletteIndex.l2 + 0)
.s4:
1e33 : a5 4b __ LDA T5 + 0 
1e35 : 0a __ __ ASL
1e36 : aa __ __ TAX
1e37 : a5 4c __ LDA T5 + 1 
1e39 : 2a __ __ ROL
1e3a : a8 __ __ TAY
1e3b : 8a __ __ TXA
1e3c : 38 __ __ SEC
1e3d : e9 02 __ SBC #$02
1e3f : b0 01 __ BCS $1e42 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1e41 : 88 __ __ DEY
.s1010:
1e42 : 18 __ __ CLC
1e43 : 65 47 __ ADC T0 + 0 
1e45 : 85 47 __ STA T0 + 0 
1e47 : 98 __ __ TYA
1e48 : 65 48 __ ADC T0 + 1 
1e4a : 85 48 __ STA T0 + 1 
1e4c : a5 49 __ LDA T3 + 0 
1e4e : a0 00 __ LDY #$00
1e50 : 91 47 __ STA (T0 + 0),y 
1e52 : a5 4a __ LDA T3 + 1 
1e54 : c8 __ __ INY
1e55 : 91 47 __ STA (T0 + 0),y 
1e57 : 4c 94 18 JMP $1894 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
42fd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
476a : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
477a : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
42ff : __ __ __ BYT 03                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
1e5a : ad 25 9f LDA $9f25 
1e5d : 29 fe __ AND #$fe
1e5f : 8d 25 9f STA $9f25 
1e62 : a9 00 __ LDA #$00
1e64 : 8d 20 9f STA $9f20 
1e67 : a9 b0 __ LDA #$b0
1e69 : 8d 21 9f STA $9f21 
1e6c : a9 11 __ LDA #$11
1e6e : 8d 22 9f STA $9f22 
1e71 : a2 80 __ LDX #$80
1e73 : a9 00 __ LDA #$00
.l1002:
1e75 : 8d 23 9f STA $9f23 
1e78 : 8d 23 9f STA $9f23 
1e7b : ca __ __ DEX
1e7c : d0 f7 __ BNE $1e75 ; (ResetChars.l1002 + 0)
.s1001:
1e7e : 60 __ __ RTS
--------------------------------------------------------------------
off1:
478a : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
1e7f : a5 31 __ LDA P4 ; (Input + 0)
1e81 : c9 20 __ CMP #$20
1e83 : d0 1c __ BNE $1ea1 ; (Control.s1007 + 0)
.s1:
1e85 : a5 30 __ LDA P3 ; (playing + 0)
1e87 : d0 0a __ BNE $1e93 ; (Control.s4 + 0)
.s5:
1e89 : a9 01 __ LDA #$01
1e8b : 20 f5 1e JSR $1ef5 ; (zsm_irq_play.s0 + 0)
1e8e : a9 01 __ LDA #$01
.s1001:
1e90 : 85 3b __ STA ACCU + 0 
1e92 : 60 __ __ RTS
.s4:
1e93 : a9 00 __ LDA #$00
1e95 : cd 8c 47 CMP $478c ; (paused + 0)
1e98 : 2a __ __ ROL
1e99 : 8d 8c 47 STA $478c ; (paused + 0)
1e9c : 85 2f __ STA P2 
1e9e : 20 a6 1e JSR $1ea6 ; (zsm_pause.s0 + 0)
.s1007:
1ea1 : a5 30 __ LDA P3 ; (playing + 0)
1ea3 : 4c 90 1e JMP $1e90 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
478c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1ea6 : a5 2f __ LDA P2 ; (pause + 0)
1ea8 : d0 0e __ BNE $1eb8 ; (zsm_pause.s4 + 0)
.s8:
1eaa : ad d3 1f LDA $1fd3 ; (zsm_paused + 0)
1ead : f0 08 __ BEQ $1eb7 ; (zsm_pause.s1001 + 0)
.s5:
1eaf : 20 c8 1e JSR $1ec8 ; (zsm_restore_volume.s0 + 0)
1eb2 : a9 00 __ LDA #$00
1eb4 : 8d d3 1f STA $1fd3 ; (zsm_paused + 0)
.s1001:
1eb7 : 60 __ __ RTS
.s4:
1eb8 : ad d3 1f LDA $1fd3 ; (zsm_paused + 0)
1ebb : d0 fa __ BNE $1eb7 ; (zsm_pause.s1001 + 0)
.s1:
1ebd : a9 01 __ LDA #$01
1ebf : 8d d3 1f STA $1fd3 ; (zsm_paused + 0)
1ec2 : 20 e7 1b JSR $1be7 ; (zsm_silence.s0 + 0)
1ec5 : 4c ff 1b JMP $1bff ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1ec8 : a0 00 __ LDY #$00
1eca : 84 3c __ STY ACCU + 1 
1ecc : a2 02 __ LDX #$02
1ece : 18 __ __ CLC
.l1006:
1ecf : 8a __ __ TXA
1ed0 : 09 c0 __ ORA #$c0
1ed2 : 8d 20 9f STA $9f20 
1ed5 : a5 3c __ LDA ACCU + 1 
1ed7 : 09 f9 __ ORA #$f9
1ed9 : 8d 21 9f STA $9f21 
1edc : a9 01 __ LDA #$01
1ede : 8d 22 9f STA $9f22 
1ee1 : b9 92 47 LDA $4792,y ; (vera_volumes + 0)
1ee4 : 8d 23 9f STA $9f23 
1ee7 : 8a __ __ TXA
1ee8 : 69 04 __ ADC #$04
1eea : aa __ __ TAX
1eeb : 90 02 __ BCC $1eef ; (zsm_restore_volume.s1009 + 0)
.s1008:
1eed : e6 3c __ INC ACCU + 1 
.s1009:
1eef : c8 __ __ INY
1ef0 : c0 10 __ CPY #$10
1ef2 : 90 db __ BCC $1ecf ; (zsm_restore_volume.l1006 + 0)
.s1001:
1ef4 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1ef5 : 8d d1 1f STA $1fd1 ; (zsm_playing + 0)
.s1001:
1ef8 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4900 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4910 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4920 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4930 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4940 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4950 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4960 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4970 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
4980 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
4990 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
49a0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
49b0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
49c0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
49d0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
49e0 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
49f0 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4a00 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4a10 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4a20 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4a30 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4a40 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4a50 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4a60 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4a70 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
4a80 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
4a90 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
4aa0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
4ab0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4ac0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4ad0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4ae0 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4af0 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4b00 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4b10 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4b20 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4b30 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4b40 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4b50 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4b60 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4b70 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
4b80 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
4b90 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4ba0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4bb0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4bc0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4bd0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4be0 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4bf0 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4c00 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4c10 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4c20 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4c30 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4c40 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4c50 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4c60 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4c70 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
4c80 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
4c90 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4ca0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4cb0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4cc0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4cd0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4ce0 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4cf0 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4d00 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4d10 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4d20 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4d30 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4d40 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4d50 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4d60 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4d70 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4d80 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4d90 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4da0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4db0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4dc0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4dd0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4de0 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4df0 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4e00 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4e10 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4e20 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4e30 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4e40 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4e50 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4e60 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4e70 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4e80 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4e90 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ea0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4eb0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ec0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ed0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ee0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ef0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f00 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f10 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f20 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f30 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f40 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f50 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f60 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f70 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 20 3d 20 3d 20 : MNMNMNMNMNM = = 
4f80 : __ __ __ BYT 2d 20 2d 00                                     : - -.
--------------------------------------------------------------------
Song1:
4f84 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4f94 : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4fa4 : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4fb4 : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4fc4 : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4fd4 : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4fe4 : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4ff4 : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
5004 : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
5014 : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
5024 : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
5034 : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
5044 : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
5054 : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
5064 : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
5074 : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
5084 : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
5094 : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
50a4 : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
50b4 : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
50c4 : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
50d4 : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
50e4 : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
50f4 : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
5104 : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
5114 : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
5124 : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
5134 : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
5144 : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
5154 : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
5164 : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
5174 : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
5184 : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
5194 : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
51a4 : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
51b4 : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
51c4 : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
51d4 : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
51e4 : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
51f4 : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
5204 : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
5214 : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
5224 : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
5234 : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
5244 : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
5254 : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
5264 : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
5274 : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
5284 : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
5294 : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
52a4 : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
52b4 : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
52c4 : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
52d4 : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
52e4 : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
52f4 : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
5304 : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
5314 : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
5324 : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
5334 : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
5344 : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
5354 : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
5364 : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
5374 : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
5384 : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
5394 : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
53a4 : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
53b4 : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
53c4 : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
53d4 : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
53e4 : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
53f4 : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
5404 : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
5414 : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
5424 : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
5434 : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
5444 : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
5454 : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
5464 : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
5474 : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
5484 : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
5494 : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
54a4 : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
54b4 : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
54c4 : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
54d4 : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
54e4 : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
54f4 : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
5504 : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
5514 : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
5524 : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
5534 : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
5544 : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
5554 : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
5564 : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
5574 : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
5584 : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
5594 : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
55a4 : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
55b4 : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
55c4 : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
55d4 : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
55e4 : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
55f4 : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
5604 : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
5614 : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
5624 : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
5634 : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
5644 : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
5654 : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
5664 : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
5674 : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
5684 : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
5694 : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
56a4 : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
56b4 : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
56c4 : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
56d4 : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5700 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5710 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5720 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5730 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5740 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5750 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5760 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5770 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5780 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5790 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
57a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
57b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
57c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5800 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5810 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5820 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5830 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5840 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5850 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5860 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5870 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5880 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5890 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
58a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
58b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
58c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
frame_wait:
.l1:
1ef9 : ad 26 9f LDA $9f26 
1efc : 0a __ __ ASL
1efd : 30 fa __ BMI $1ef9 ; (frame_wait.l1 + 0)
.l4:
1eff : ad 26 9f LDA $9f26 
1f02 : 0a __ __ ASL
1f03 : 10 fa __ BPL $1eff ; (frame_wait.l4 + 0)
.s1001:
1f05 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1f06 : 38 __ __ SEC
1f07 : a9 00 __ LDA #$00
1f09 : e5 3b __ SBC ACCU + 0 
1f0b : 85 3b __ STA ACCU + 0 
1f0d : a9 00 __ LDA #$00
1f0f : e5 3c __ SBC ACCU + 1 
1f11 : 85 3c __ STA ACCU + 1 
1f13 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1f14 : 38 __ __ SEC
1f15 : a9 00 __ LDA #$00
1f17 : e5 23 __ SBC WORK + 0 
1f19 : 85 23 __ STA WORK + 0 
1f1b : a9 00 __ LDA #$00
1f1d : e5 24 __ SBC WORK + 1 
1f1f : 85 24 __ STA WORK + 1 
1f21 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1f22 : a5 3c __ LDA ACCU + 1 
1f24 : d0 31 __ BNE $1f57 ; (divmod + 53)
1f26 : a5 24 __ LDA WORK + 1 
1f28 : d0 1e __ BNE $1f48 ; (divmod + 38)
1f2a : 85 26 __ STA WORK + 3 
1f2c : a2 04 __ LDX #$04
1f2e : 06 3b __ ASL ACCU + 0 
1f30 : 2a __ __ ROL
1f31 : c5 23 __ CMP WORK + 0 
1f33 : 90 02 __ BCC $1f37 ; (divmod + 21)
1f35 : e5 23 __ SBC WORK + 0 
1f37 : 26 3b __ ROL ACCU + 0 
1f39 : 2a __ __ ROL
1f3a : c5 23 __ CMP WORK + 0 
1f3c : 90 02 __ BCC $1f40 ; (divmod + 30)
1f3e : e5 23 __ SBC WORK + 0 
1f40 : 26 3b __ ROL ACCU + 0 
1f42 : ca __ __ DEX
1f43 : d0 eb __ BNE $1f30 ; (divmod + 14)
1f45 : 85 25 __ STA WORK + 2 
1f47 : 60 __ __ RTS
1f48 : a5 3b __ LDA ACCU + 0 
1f4a : 85 25 __ STA WORK + 2 
1f4c : a5 3c __ LDA ACCU + 1 
1f4e : 85 26 __ STA WORK + 3 
1f50 : a9 00 __ LDA #$00
1f52 : 85 3b __ STA ACCU + 0 
1f54 : 85 3c __ STA ACCU + 1 
1f56 : 60 __ __ RTS
1f57 : a5 24 __ LDA WORK + 1 
1f59 : d0 1f __ BNE $1f7a ; (divmod + 88)
1f5b : a5 23 __ LDA WORK + 0 
1f5d : 30 1b __ BMI $1f7a ; (divmod + 88)
1f5f : a9 00 __ LDA #$00
1f61 : 85 26 __ STA WORK + 3 
1f63 : a2 10 __ LDX #$10
1f65 : 06 3b __ ASL ACCU + 0 
1f67 : 26 3c __ ROL ACCU + 1 
1f69 : 2a __ __ ROL
1f6a : c5 23 __ CMP WORK + 0 
1f6c : 90 02 __ BCC $1f70 ; (divmod + 78)
1f6e : e5 23 __ SBC WORK + 0 
1f70 : 26 3b __ ROL ACCU + 0 
1f72 : 26 3c __ ROL ACCU + 1 
1f74 : ca __ __ DEX
1f75 : d0 f2 __ BNE $1f69 ; (divmod + 71)
1f77 : 85 25 __ STA WORK + 2 
1f79 : 60 __ __ RTS
1f7a : a9 00 __ LDA #$00
1f7c : 85 25 __ STA WORK + 2 
1f7e : 85 26 __ STA WORK + 3 
1f80 : 84 22 __ STY $22 
1f82 : a0 10 __ LDY #$10
1f84 : 18 __ __ CLC
1f85 : 26 3b __ ROL ACCU + 0 
1f87 : 26 3c __ ROL ACCU + 1 
1f89 : 26 25 __ ROL WORK + 2 
1f8b : 26 26 __ ROL WORK + 3 
1f8d : 38 __ __ SEC
1f8e : a5 25 __ LDA WORK + 2 
1f90 : e5 23 __ SBC WORK + 0 
1f92 : aa __ __ TAX
1f93 : a5 26 __ LDA WORK + 3 
1f95 : e5 24 __ SBC WORK + 1 
1f97 : 90 04 __ BCC $1f9d ; (divmod + 123)
1f99 : 86 25 __ STX WORK + 2 
1f9b : 85 26 __ STA WORK + 3 
1f9d : 88 __ __ DEY
1f9e : d0 e5 __ BNE $1f85 ; (divmod + 99)
1fa0 : 26 3b __ ROL ACCU + 0 
1fa2 : 26 3c __ ROL ACCU + 1 
1fa4 : a4 22 __ LDY $22 
1fa6 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1fa7 : 24 3c __ BIT ACCU + 1 
1fa9 : 10 0d __ BPL $1fb8 ; (mods16 + 17)
1fab : 20 06 1f JSR $1f06 ; (negaccu + 0)
1fae : 24 24 __ BIT WORK + 1 
1fb0 : 10 0d __ BPL $1fbf ; (mods16 + 24)
1fb2 : 20 14 1f JSR $1f14 ; (negtmp + 0)
1fb5 : 4c 22 1f JMP $1f22 ; (divmod + 0)
1fb8 : 24 24 __ BIT WORK + 1 
1fba : 10 f9 __ BPL $1fb5 ; (mods16 + 14)
1fbc : 20 14 1f JSR $1f14 ; (negtmp + 0)
1fbf : 20 22 1f JSR $1f22 ; (divmod + 0)
1fc2 : 38 __ __ SEC
1fc3 : a9 00 __ LDA #$00
1fc5 : e5 25 __ SBC WORK + 2 
1fc7 : 85 25 __ STA WORK + 2 
1fc9 : a9 00 __ LDA #$00
1fcb : e5 26 __ SBC WORK + 3 
1fcd : 85 26 __ STA WORK + 3 
1fcf : 60 __ __ RTS
