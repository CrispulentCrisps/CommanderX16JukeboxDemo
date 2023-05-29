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
080e : 8e ff 1c STX $1cff ; (spentry + 0)
0811 : a9 c4 __ LDA #$c4
0813 : 85 39 __ STA IP + 0 
0815 : a9 55 __ LDA #$55
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 59 __ LDA #$59
081c : e9 55 __ SBC #$55
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
0830 : a9 d4 __ LDA #$d4
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
1cff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 de 0b JSR $0bde ; (zsm_irq_init.s0 + 0)
0883 : 20 b2 0d JSR $0db2 ; (ClearVERAScreen.s0 + 0)
0886 : 20 f5 0d JSR $0df5 ; (SetUpSprites.s0 + 0)
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
08e2 : a9 c2 __ LDA #$c2
08e4 : 85 35 __ STA P8 
08e6 : a9 44 __ LDA #$44
08e8 : 85 36 __ STA P9 
08ea : 20 be 18 JSR $18be ; (SetPaletteColours.s0 + 0)
08ed : a9 00 __ LDA #$00
08ef : 85 4f __ STA T1 + 0 
08f1 : 85 50 __ STA T1 + 1 
08f3 : 85 51 __ STA T2 + 0 
08f5 : 85 52 __ STA T3 + 0 
08f7 : 85 53 __ STA T4 + 0 
.l3:
08f9 : 20 e5 18 JSR $18e5 ; (getchx.s0 + 0)
08fc : a5 3b __ LDA ACCU + 0 
08fe : 85 54 __ STA T5 + 0 
0900 : a9 30 __ LDA #$30
0902 : 8d 2c 9f STA $9f2c 
0905 : ee fc 25 INC $25fc ; (p + 0)
0908 : d0 03 __ BNE $090d ; (main.s1021 + 0)
.s1020:
090a : ee fd 25 INC $25fd ; (p + 1)
.s1021:
090d : ad fe 25 LDA $25fe ; (Phase + 0)
0910 : 18 __ __ CLC
0911 : 69 01 __ ADC #$01
0913 : 85 32 __ STA P5 
0915 : 8d fe 25 STA $25fe ; (Phase + 0)
0918 : ad ff 25 LDA $25ff ; (Phase + 1)
091b : 69 00 __ ADC #$00
091d : 85 33 __ STA P6 
091f : 8d ff 25 STA $25ff ; (Phase + 1)
0922 : ad e2 44 LDA $44e2 ; (Phase2 + 0)
0925 : 18 __ __ CLC
0926 : 69 01 __ ADC #$01
0928 : 85 34 __ STA P7 
092a : 8d e2 44 STA $44e2 ; (Phase2 + 0)
092d : ad e3 44 LDA $44e3 ; (Phase2 + 1)
0930 : 69 00 __ ADC #$00
0932 : 85 35 __ STA P8 
0934 : 8d e3 44 STA $44e3 ; (Phase2 + 1)
0937 : ad e4 44 LDA $44e4 ; (Phase3 + 0)
093a : 18 __ __ CLC
093b : 69 01 __ ADC #$01
093d : 85 36 __ STA P9 
093f : 8d e4 44 STA $44e4 ; (Phase3 + 0)
0942 : ad e5 44 LDA $44e5 ; (Phase3 + 1)
0945 : 69 00 __ ADC #$00
0947 : 85 37 __ STA P10 
0949 : 8d e5 44 STA $44e5 ; (Phase3 + 1)
094c : 20 20 19 JSR $1920 ; (MoveSprites.s0 + 0)
094f : a5 52 __ LDA T3 + 0 
0951 : c9 01 __ CMP #$01
0953 : d0 03 __ BNE $0958 ; (main.s6 + 0)
0955 : 4c b7 0b JMP $0bb7 ; (main.s5 + 0)
.s6:
0958 : a9 00 __ LDA #$00
095a : 8d ea 44 STA $44ea ; (PalTimer + 0)
095d : 8d eb 44 STA $44eb ; (PalTimer + 1)
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
0978 : a9 00 __ LDA #$00
097a : 85 35 __ STA P8 
097c : a9 46 __ LDA #$46
097e : 85 36 __ STA P9 
0980 : 20 be 18 JSR $18be ; (SetPaletteColours.s0 + 0)
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
09a9 : a9 3b __ LDA #$3b
09ab : 85 32 __ STA P5 
09ad : a9 25 __ LDA #$25
09af : 85 33 __ STA P6 
09b1 : 20 4c 1d JSR $1d4c ; (SetPaletteIndex.s0 + 0)
09b4 : a9 00 __ LDA #$00
09b6 : 85 53 __ STA T4 + 0 
.s62:
09b8 : ad eb 44 LDA $44eb ; (PalTimer + 1)
09bb : 30 5f __ BMI $0a1c ; (main.s13 + 0)
.s1014:
09bd : d0 07 __ BNE $09c6 ; (main.s11 + 0)
.s1013:
09bf : a9 03 __ LDA #$03
09c1 : cd ea 44 CMP $44ea ; (PalTimer + 0)
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
09e2 : ee ec 44 INC $44ec ; (PalIndex + 0)
09e5 : d0 03 __ BNE $09ea ; (main.s1025 + 0)
.s1024:
09e7 : ee ed 44 INC $44ed ; (PalIndex + 1)
.s1025:
09ea : a9 60 __ LDA #$60
09ec : 85 32 __ STA P5 
09ee : a9 40 __ LDA #$40
09f0 : 85 33 __ STA P6 
09f2 : 20 4c 1d JSR $1d4c ; (SetPaletteIndex.s0 + 0)
09f5 : a9 50 __ LDA #$50
09f7 : 85 34 __ STA P7 
09f9 : a9 00 __ LDA #$00
09fb : 8d fc 9e STA $9efc ; (sstack + 0)
09fe : 8d fd 9e STA $9efd ; (sstack + 1)
0a01 : 8d ff 9e STA $9eff ; (sstack + 3)
0a04 : a9 10 __ LDA #$10
0a06 : 8d fe 9e STA $9efe ; (sstack + 2)
0a09 : a9 20 __ LDA #$20
0a0b : 85 32 __ STA P5 
0a0d : a9 46 __ LDA #$46
0a0f : 85 33 __ STA P6 
0a11 : 20 4c 1d JSR $1d4c ; (SetPaletteIndex.s0 + 0)
0a14 : a9 00 __ LDA #$00
0a16 : 8d ea 44 STA $44ea ; (PalTimer + 0)
0a19 : 8d eb 44 STA $44eb ; (PalTimer + 1)
.s13:
0a1c : a9 03 __ LDA #$03
0a1e : 8d 2c 9f STA $9f2c 
0a21 : a5 54 __ LDA T5 + 0 
0a23 : c9 44 __ CMP #$44
0a25 : d0 0c __ BNE $0a33 ; (main.s15 + 0)
.s17:
0a27 : a5 51 __ LDA T2 + 0 
0a29 : cd ee 44 CMP $44ee ; (MaxSong + 0)
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
0a3f : 20 ff 1d JSR $1dff ; (ResetChars.s0 + 0)
0a42 : a9 00 __ LDA #$00
0a44 : 8d ef 44 STA $44ef ; (off1 + 0)
0a47 : 8d f0 44 STA $44f0 ; (off1 + 1)
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
0a62 : 20 24 1e JSR $1e24 ; (Control.s0 + 0)
0a65 : a5 3b __ LDA ACCU + 0 
0a67 : 85 52 __ STA T3 + 0 
0a69 : 38 __ __ SEC
0a6a : a5 4f __ LDA T1 + 0 
0a6c : e9 80 __ SBC #$80
0a6e : 8d 37 9f STA $9f37 
0a71 : a5 50 __ LDA T1 + 1 
0a73 : e9 02 __ SBC #$02
0a75 : 8d 38 9f STA $9f38 
0a78 : ad e6 44 LDA $44e6 ; (FrameCount + 0)
0a7b : 85 3b __ STA ACCU + 0 
0a7d : ad e7 44 LDA $44e7 ; (FrameCount + 1)
0a80 : 85 3c __ STA ACCU + 1 
0a82 : a9 08 __ LDA #$08
0a84 : 85 23 __ STA WORK + 0 
0a86 : a9 00 __ LDA #$00
0a88 : 85 24 __ STA WORK + 1 
0a8a : 20 2d 1f JSR $1f2d ; (mods16 + 0)
0a8d : a5 26 __ LDA WORK + 3 
0a8f : f0 03 __ BEQ $0a94 ; (main.s1005 + 0)
0a91 : 4c 83 0b JMP $0b83 ; (main.s24 + 0)
.s1005:
0a94 : a5 25 __ LDA WORK + 2 
0a96 : c9 01 __ CMP #$01
0a98 : f0 03 __ BEQ $0a9d ; (main.s22 + 0)
0a9a : 4c 83 0b JMP $0b83 ; (main.s24 + 0)
.s22:
0a9d : ad ef 44 LDA $44ef ; (off1 + 0)
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
0ac2 : ad f0 44 LDA $44f0 ; (off1 + 1)
0ac5 : 85 3c __ STA ACCU + 1 
0ac7 : a9 83 __ LDA #$83
0ac9 : 85 23 __ STA WORK + 0 
0acb : a9 06 __ LDA #$06
0acd : 85 24 __ STA WORK + 1 
0acf : 20 a8 1e JSR $1ea8 ; (divmod + 0)
0ad2 : 18 __ __ CLC
0ad3 : a9 40 __ LDA #$40
0ad5 : 65 25 __ ADC WORK + 2 
0ad7 : 85 47 __ STA T6 + 0 
0ad9 : a9 46 __ LDA #$46
0adb : 4c a7 0b JMP $0ba7 ; (main.s1018 + 0)
.s1004:
0ade : c9 01 __ CMP #$01
0ae0 : d0 20 __ BNE $0b02 ; (main.s1003 + 0)
.s32:
0ae2 : a5 54 __ LDA T5 + 0 
0ae4 : 85 3b __ STA ACCU + 0 
0ae6 : ad f0 44 LDA $44f0 ; (off1 + 1)
0ae9 : 85 3c __ STA ACCU + 1 
0aeb : a9 5c __ LDA #$5c
0aed : 85 23 __ STA WORK + 0 
0aef : a9 07 __ LDA #$07
0af1 : 85 24 __ STA WORK + 1 
0af3 : 20 a8 1e JSR $1ea8 ; (divmod + 0)
0af6 : 18 __ __ CLC
0af7 : a9 c4 __ LDA #$c4
0af9 : 65 25 __ ADC WORK + 2 
0afb : 85 47 __ STA T6 + 0 
0afd : a9 4c __ LDA #$4c
0aff : 4c a7 0b JMP $0ba7 ; (main.s1018 + 0)
.s1003:
0b02 : c9 02 __ CMP #$02
0b04 : d0 1c __ BNE $0b22 ; (main.s1002 + 0)
.s37:
0b06 : a5 54 __ LDA T5 + 0 
0b08 : 85 3b __ STA ACCU + 0 
0b0a : ad f0 44 LDA $44f0 ; (off1 + 1)
0b0d : 85 3c __ STA ACCU + 1 
0b0f : a9 c5 __ LDA #$c5
0b11 : 85 23 __ STA WORK + 0 
0b13 : a9 00 __ LDA #$00
0b15 : 85 24 __ STA WORK + 1 
0b17 : 20 a8 1e JSR $1ea8 ; (divmod + 0)
0b1a : a6 25 __ LDX WORK + 2 
0b1c : bd 21 54 LDA $5421,x ; (Song2 + 0)
0b1f : 4c 3f 0b JMP $0b3f ; (main.s67 + 0)
.s1002:
0b22 : c9 03 __ CMP #$03
0b24 : d0 29 __ BNE $0b4f ; (main.s26 + 0)
.s42:
0b26 : a5 54 __ LDA T5 + 0 
0b28 : 85 3b __ STA ACCU + 0 
0b2a : ad f0 44 LDA $44f0 ; (off1 + 1)
0b2d : 85 3c __ STA ACCU + 1 
0b2f : a9 c3 __ LDA #$c3
0b31 : 85 23 __ STA WORK + 0 
0b33 : a9 00 __ LDA #$00
0b35 : 85 24 __ STA WORK + 1 
0b37 : 20 a8 1e JSR $1ea8 ; (divmod + 0)
0b3a : a6 25 __ LDX WORK + 2 
0b3c : bd 00 55 LDA $5500,x ; (Song3 + 0)
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
0b70 : 8d ef 44 STA $44ef ; (off1 + 0)
0b73 : 90 03 __ BCC $0b78 ; (main.s1027 + 0)
.s1026:
0b75 : ee f0 44 INC $44f0 ; (off1 + 1)
.s1027:
0b78 : a9 78 __ LDA #$78
0b7a : 85 32 __ STA P5 
0b7c : a9 40 __ LDA #$40
0b7e : 85 33 __ STA P6 
0b80 : 20 4c 1d JSR $1d4c ; (SetPaletteIndex.s0 + 0)
.s24:
0b83 : a9 01 __ LDA #$01
0b85 : 8d 2c 9f STA $9f2c 
0b88 : 20 f4 1b JSR $1bf4 ; (zsm_fill.s0 + 0)
0b8b : a9 00 __ LDA #$00
0b8d : 8d 2c 9f STA $9f2c 
0b90 : 20 e4 1c JSR $1ce4 ; (frame_wait.l1 + 0)
0b93 : ee e6 44 INC $44e6 ; (FrameCount + 0)
0b96 : d0 03 __ BNE $0b9b ; (main.s1029 + 0)
.s1028:
0b98 : ee e7 44 INC $44e7 ; (FrameCount + 1)
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
0bbf : ad e9 44 LDA $44e9 ; (LastSelectedSong + 0)
0bc2 : 85 34 __ STA P7 
0bc4 : a9 00 __ LDA #$00
0bc6 : 85 35 __ STA P8 
0bc8 : 20 bb 1a JSR $1abb ; (PlayZSM.s0 + 0)
0bcb : a5 32 __ LDA P5 
0bcd : 8d e9 44 STA $44e9 ; (LastSelectedSong + 0)
0bd0 : ee ea 44 INC $44ea ; (PalTimer + 0)
0bd3 : f0 03 __ BEQ $0bd8 ; (main.s1022 + 0)
0bd5 : 4c 83 09 JMP $0983 ; (main.s61 + 0)
.s1022:
0bd8 : ee eb 44 INC $44eb ; (PalTimer + 1)
0bdb : 4c 83 09 JMP $0983 ; (main.s61 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0bde : 78 __ __ SEI
0bdf : ad 14 03 LDA $0314 
0be2 : 8d f2 44 STA $44f2 ; (oirq + 0)
0be5 : ad 15 03 LDA $0315 
0be8 : 8d f3 44 STA $44f3 ; (oirq + 1)
0beb : a9 f7 __ LDA #$f7
0bed : 8d 14 03 STA $0314 
0bf0 : a9 0b __ LDA #$0b
0bf2 : 8d 15 03 STA $0315 
0bf5 : 58 __ __ CLI
.s1001:
0bf6 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
44f2 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0bf7 : 20 fd 0b JSR $0bfd ; (irq.s1000 + 0)
0bfa : 6c f2 44 JMP ($44f2)
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
0c27 : ad 56 1f LDA $1f56 ; (zsm_playing + 0)
0c2a : f0 08 __ BEQ $0c34 ; (irq.s1001 + 0)
.s4:
0c2c : ad 57 1f LDA $1f57 ; (zsm_finished + 0)
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
1f56 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1f57 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c5f : ad 58 1f LDA $1f58 ; (zsm_paused + 0)
0c62 : f0 01 __ BEQ $0c65 ; (zsm_play.s2 + 0)
0c64 : 60 __ __ RTS
.s2:
0c65 : ad f4 44 LDA $44f4 ; (zsm_delay + 0)
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
0c89 : ad f5 44 LDA $44f5 ; (zsm_pos + 0)
0c8c : 85 4b __ STA T3 + 0 
0c8e : 18 __ __ CLC
0c8f : 69 01 __ ADC #$01
0c91 : 85 4d __ STA T4 + 0 
0c93 : 8d f5 44 STA $44f5 ; (zsm_pos + 0)
0c96 : ad f6 44 LDA $44f6 ; (zsm_pos + 1)
0c99 : aa __ __ TAX
0c9a : 69 00 __ ADC #$00
0c9c : 85 4e __ STA T4 + 1 
0c9e : 8d f6 44 STA $44f6 ; (zsm_pos + 1)
0ca1 : 18 __ __ CLC
0ca2 : a9 c4 __ LDA #$c4
0ca4 : 65 4b __ ADC T3 + 0 
0ca6 : 85 3b __ STA ACCU + 0 
0ca8 : 8a __ __ TXA
0ca9 : 29 03 __ AND #$03
0cab : 69 55 __ ADC #$55
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
0cc7 : 69 55 __ ADC #$55
0cc9 : 85 4c __ STA T3 + 1 
0ccb : b1 4b __ LDA (T3 + 0),y 
0ccd : 29 3f __ AND #$3f
0ccf : 18 __ __ CLC
0cd0 : 65 4d __ ADC T4 + 0 
0cd2 : 8d f5 44 STA $44f5 ; (zsm_pos + 0)
0cd5 : 98 __ __ TYA
0cd6 : 65 4e __ ADC T4 + 1 
0cd8 : 8d f6 44 STA $44f6 ; (zsm_pos + 1)
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
0ced : 6d f5 44 ADC $44f5 ; (zsm_pos + 0)
0cf0 : 85 4d __ STA T4 + 0 
0cf2 : ad f6 44 LDA $44f6 ; (zsm_pos + 1)
0cf5 : 29 03 __ AND #$03
0cf7 : 69 55 __ ADC #$55
0cf9 : 85 4e __ STA T4 + 1 
0cfb : a0 00 __ LDY #$00
0cfd : b1 4d __ LDA (T4 + 0),y 
0cff : 85 2d __ STA P0 
0d01 : ad f5 44 LDA $44f5 ; (zsm_pos + 0)
0d04 : 18 __ __ CLC
0d05 : 69 01 __ ADC #$01
0d07 : aa __ __ TAX
0d08 : ad f6 44 LDA $44f6 ; (zsm_pos + 1)
0d0b : 69 00 __ ADC #$00
0d0d : 29 03 __ AND #$03
0d0f : 85 4c __ STA T3 + 1 
0d11 : 8a __ __ TXA
0d12 : 18 __ __ CLC
0d13 : 69 c4 __ ADC #$c4
0d15 : 85 4b __ STA T3 + 0 
0d17 : a9 55 __ LDA #$55
0d19 : 65 4c __ ADC T3 + 1 
0d1b : 85 4c __ STA T3 + 1 
0d1d : b1 4b __ LDA (T3 + 0),y 
0d1f : 85 2e __ STA P1 
0d21 : 20 9e 0d JSR $0d9e ; (sfx_put.l1 + 0)
0d24 : ad f5 44 LDA $44f5 ; (zsm_pos + 0)
0d27 : 18 __ __ CLC
0d28 : 69 02 __ ADC #$02
0d2a : 8d f5 44 STA $44f5 ; (zsm_pos + 0)
0d2d : 90 03 __ BCC $0d32 ; (zsm_play.s1015 + 0)
.s1014:
0d2f : ee f6 44 INC $44f6 ; (zsm_pos + 1)
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
0d43 : 8d 57 1f STA $1f57 ; (zsm_finished + 0)
0d46 : d0 08 __ BNE $0d50 ; (zsm_play.s10 + 0)
.s25:
0d48 : 29 7f __ AND #$7f
0d4a : 38 __ __ SEC
0d4b : e9 01 __ SBC #$01
0d4d : 8d f4 44 STA $44f4 ; (zsm_delay + 0)
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
0d7a : 8d f5 44 STA $44f5 ; (zsm_pos + 0)
0d7d : 90 01 __ BCC $0d80 ; (zsm_play.s1017 + 0)
.s1016:
0d7f : e8 __ __ INX
.s1017:
0d80 : 8e f6 44 STX $44f6 ; (zsm_pos + 1)
0d83 : 18 __ __ CLC
0d84 : a9 c4 __ LDA #$c4
0d86 : 65 4d __ ADC T4 + 0 
0d88 : 85 4b __ STA T3 + 0 
0d8a : a5 4e __ LDA T4 + 1 
0d8c : 29 03 __ AND #$03
0d8e : 69 55 __ ADC #$55
0d90 : 85 4c __ STA T3 + 1 
0d92 : b1 4b __ LDA (T3 + 0),y 
0d94 : 8d 23 9f STA $9f23 
0d97 : 4c 89 0c JMP $0c89 ; (zsm_play.l8 + 0)
.s4:
0d9a : ce f4 44 DEC $44f4 ; (zsm_delay + 0)
0d9d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1f58 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
44f4 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
55c4 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
44f5 : __ __ __ BSS	2
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
0dae : 8d 41 9f STA $9f41 
.s1001:
0db1 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0db2 : a9 93 __ LDA #$93
0db4 : 85 2d __ STA P0 
0db6 : a9 00 __ LDA #$00
0db8 : 85 2e __ STA P1 
0dba : 20 ef 0d JSR $0def ; (putch.s0 + 0)
0dbd : a9 11 __ LDA #$11
0dbf : 8d 22 9f STA $9f22 
0dc2 : a2 00 __ LDX #$00
.l2:
0dc4 : 8a __ __ TXA
0dc5 : 18 __ __ CLC
0dc6 : 69 b0 __ ADC #$b0
0dc8 : 8d 21 9f STA $9f21 
0dcb : a9 00 __ LDA #$00
0dcd : 8d 20 9f STA $9f20 
0dd0 : a0 80 __ LDY #$80
.l1003:
0dd2 : a9 20 __ LDA #$20
0dd4 : 8d 23 9f STA $9f23 
0dd7 : a9 01 __ LDA #$01
0dd9 : 8d 23 9f STA $9f23 
0ddc : a9 20 __ LDA #$20
0dde : 8d 24 9f STA $9f24 
0de1 : a9 01 __ LDA #$01
0de3 : 8d 24 9f STA $9f24 
0de6 : 88 __ __ DEY
0de7 : d0 e9 __ BNE $0dd2 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0de9 : e8 __ __ INX
0dea : e0 40 __ CPX #$40
0dec : 90 d6 __ BCC $0dc4 ; (ClearVERAScreen.l2 + 0)
.s1001:
0dee : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0def : a5 2d __ LDA P0 
0df1 : 20 d2 ff JSR $ffd2 
.s1001:
0df4 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0df5 : a9 00 __ LDA #$00
0df7 : 8d 25 9f STA $9f25 
0dfa : ad 29 9f LDA $9f29 
0dfd : 09 70 __ ORA #$70
0dff : 8d 29 9f STA $9f29 
0e02 : a9 80 __ LDA #$80
0e04 : 8d 2b 9f STA $9f2b 
0e07 : 8d 2a 9f STA $9f2a 
0e0a : a9 62 __ LDA #$62
0e0c : 8d 2d 9f STA $9f2d 
0e0f : a9 68 __ LDA #$68
0e11 : 8d 34 9f STA $9f34 
0e14 : a9 00 __ LDA #$00
0e16 : 85 2d __ STA P0 
0e18 : 85 2e __ STA P1 
0e1a : 85 2f __ STA P2 
0e1c : 85 30 __ STA P3 
0e1e : 85 31 __ STA P4 
0e20 : 20 1b 17 JSR $171b ; (tileBaseConfig.s0 + 0)
0e23 : 8d 2f 9f STA $9f2f 
0e26 : a9 00 __ LDA #$00
0e28 : 85 2d __ STA P0 
0e2a : a9 20 __ LDA #$20
0e2c : 85 2f __ STA P2 
0e2e : 20 33 17 JSR $1733 ; (memoryToMapMemoryAddress.s0 + 0)
0e31 : 8d 2e 9f STA $9f2e 
0e34 : a9 01 __ LDA #$01
0e36 : 8d 22 9f STA $9f22 
0e39 : a2 80 __ LDX #$80
.l6:
0e3b : a0 50 __ LDY #$50
.l1032:
0e3d : a9 00 __ LDA #$00
0e3f : 8d 24 9f STA $9f24 
0e42 : a9 08 __ LDA #$08
0e44 : 8d 24 9f STA $9f24 
0e47 : 88 __ __ DEY
0e48 : d0 f3 __ BNE $0e3d ; (SetUpSprites.l1032 + 0)
.s1033:
0e4a : ca __ __ DEX
0e4b : d0 ee __ BNE $0e3b ; (SetUpSprites.l6 + 0)
.s4:
0e4d : 86 48 __ STX T1 + 0 
0e4f : a9 00 __ LDA #$00
0e51 : 85 2d __ STA P0 
0e53 : 85 2e __ STA P1 
0e55 : 85 2f __ STA P2 
0e57 : 85 30 __ STA P3 
0e59 : a9 e0 __ LDA #$e0
0e5b : 85 33 __ STA P6 
0e5d : a9 01 __ LDA #$01
0e5f : 85 34 __ STA P7 
0e61 : a9 59 __ LDA #$59
0e63 : 85 31 __ STA P4 
0e65 : a9 1f __ LDA #$1f
0e67 : 85 32 __ STA P5 
0e69 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
0e6c : a9 10 __ LDA #$10
0e6e : 8d 22 9f STA $9f22 
0e71 : a9 00 __ LDA #$00
0e73 : 8d 20 9f STA $9f20 
0e76 : a9 20 __ LDA #$20
0e78 : 8d 21 9f STA $9f21 
.l10:
0e7b : a9 00 __ LDA #$00
0e7d : 85 49 __ STA T2 + 0 
.l14:
0e7f : 20 7b 17 JSR $177b ; (rand.s0 + 0)
0e82 : a9 30 __ LDA #$30
0e84 : 85 23 __ STA WORK + 0 
0e86 : a9 00 __ LDA #$00
0e88 : 85 24 __ STA WORK + 1 
0e8a : 20 a8 1e JSR $1ea8 ; (divmod + 0)
0e8d : a5 48 __ LDA T1 + 0 
0e8f : c9 36 __ CMP #$36
0e91 : 90 03 __ BCC $0e96 ; (SetUpSprites.s1030 + 0)
0e93 : 4c 99 16 JMP $1699 ; (SetUpSprites.s1025 + 0)
.s1030:
0e96 : c9 2c __ CMP #$2c
0e98 : b0 03 __ BCS $0e9d ; (SetUpSprites.s1029 + 0)
0e9a : 4c 99 16 JMP $1699 ; (SetUpSprites.s1025 + 0)
.s1029:
0e9d : f0 04 __ BEQ $0ea3 ; (SetUpSprites.s21 + 0)
.s1028:
0e9f : c9 34 __ CMP #$34
0ea1 : d0 04 __ BNE $0ea7 ; (SetUpSprites.s1027 + 0)
.s21:
0ea3 : a9 0a __ LDA #$0a
0ea5 : d0 0e __ BNE $0eb5 ; (SetUpSprites.s218 + 0)
.s1027:
0ea7 : c9 2d __ CMP #$2d
0ea9 : f0 04 __ BEQ $0eaf ; (SetUpSprites.s25 + 0)
.s1026:
0eab : c9 35 __ CMP #$35
0ead : d0 04 __ BNE $0eb3 ; (SetUpSprites.s26 + 0)
.s25:
0eaf : a9 0b __ LDA #$0b
0eb1 : d0 02 __ BNE $0eb5 ; (SetUpSprites.s218 + 0)
.s26:
0eb3 : a9 04 __ LDA #$04
.s218:
0eb5 : 8d 23 9f STA $9f23 
0eb8 : a9 00 __ LDA #$00
0eba : 8d 23 9f STA $9f23 
0ebd : e6 49 __ INC T2 + 0 
0ebf : 10 be __ BPL $0e7f ; (SetUpSprites.l14 + 0)
.s11:
0ec1 : e6 48 __ INC T1 + 0 
0ec3 : a5 48 __ LDA T1 + 0 
0ec5 : c9 3c __ CMP #$3c
0ec7 : 90 b2 __ BCC $0e7b ; (SetUpSprites.l10 + 0)
.s12:
0ec9 : a9 e0 __ LDA #$e0
0ecb : 85 2d __ STA P0 
0ecd : a9 54 __ LDA #$54
0ecf : 85 2e __ STA P1 
0ed1 : a9 01 __ LDA #$01
0ed3 : 85 2f __ STA P2 
0ed5 : a9 00 __ LDA #$00
0ed7 : 85 30 __ STA P3 
0ed9 : 85 33 __ STA P6 
0edb : a9 02 __ LDA #$02
0edd : 85 34 __ STA P7 
0edf : a9 3b __ LDA #$3b
0ee1 : 85 31 __ STA P4 
0ee3 : a9 21 __ LDA #$21
0ee5 : 85 32 __ STA P5 
0ee7 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
0eea : a9 20 __ LDA #$20
0eec : 85 2d __ STA P0 
0eee : a9 57 __ LDA #$57
0ef0 : 85 2e __ STA P1 
0ef2 : a9 02 __ LDA #$02
0ef4 : 85 34 __ STA P7 
0ef6 : a9 3b __ LDA #$3b
0ef8 : 85 31 __ STA P4 
0efa : a9 23 __ LDA #$23
0efc : 85 32 __ STA P5 
0efe : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
0f01 : a9 00 __ LDA #$00
0f03 : 85 2d __ STA P0 
0f05 : a9 a7 __ LDA #$a7
0f07 : 85 2e __ STA P1 
0f09 : a9 0a __ LDA #$0a
0f0b : 85 2f __ STA P2 
0f0d : 85 34 __ STA P7 
0f0f : a9 02 __ LDA #$02
0f11 : 85 31 __ STA P4 
0f13 : 85 32 __ STA P5 
0f15 : a9 03 __ LDA #$03
0f17 : 85 33 __ STA P6 
0f19 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
0f1c : a9 68 __ LDA #$68
0f1e : 85 2e __ STA P1 
0f20 : a9 00 __ LDA #$00
0f22 : 85 2f __ STA P2 
0f24 : a9 b6 __ LDA #$b6
0f26 : 85 30 __ STA P3 
0f28 : a9 01 __ LDA #$01
0f2a : 85 31 __ STA P4 
0f2c : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
0f2f : a9 01 __ LDA #$01
0f31 : 85 2d __ STA P0 
0f33 : a9 b9 __ LDA #$b9
0f35 : 85 2e __ STA P1 
0f37 : a9 0a __ LDA #$0a
0f39 : 85 2f __ STA P2 
0f3b : a9 00 __ LDA #$00
0f3d : 85 30 __ STA P3 
0f3f : a9 02 __ LDA #$02
0f41 : 85 31 __ STA P4 
0f43 : a9 09 __ LDA #$09
0f45 : 85 34 __ STA P7 
0f47 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
0f4a : a9 f0 __ LDA #$f0
0f4c : 85 2e __ STA P1 
0f4e : a9 01 __ LDA #$01
0f50 : 85 2f __ STA P2 
0f52 : 85 31 __ STA P4 
0f54 : a9 b6 __ LDA #$b6
0f56 : 85 30 __ STA P3 
0f58 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
0f5b : a9 00 __ LDA #$00
0f5d : 85 2d __ STA P0 
0f5f : 85 30 __ STA P3 
0f61 : 85 33 __ STA P6 
0f63 : a9 30 __ LDA #$30
0f65 : 85 2e __ STA P1 
0f67 : a9 01 __ LDA #$01
0f69 : 85 34 __ STA P7 
0f6b : a9 00 __ LDA #$00
0f6d : 85 31 __ STA P4 
0f6f : a9 26 __ LDA #$26
0f71 : 85 32 __ STA P5 
0f73 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
0f76 : a9 16 __ LDA #$16
0f78 : 85 2d __ STA P0 
0f7a : a9 80 __ LDA #$80
0f7c : 85 2e __ STA P1 
0f7e : a9 09 __ LDA #$09
0f80 : 85 2f __ STA P2 
0f82 : a9 01 __ LDA #$01
0f84 : 85 31 __ STA P4 
0f86 : 85 34 __ STA P7 
0f88 : a9 02 __ LDA #$02
0f8a : 85 32 __ STA P5 
0f8c : a9 03 __ LDA #$03
0f8e : 85 33 __ STA P6 
0f90 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
0f93 : a9 30 __ LDA #$30
0f95 : 85 2e __ STA P1 
0f97 : a9 01 __ LDA #$01
0f99 : 85 2f __ STA P2 
0f9b : a9 b8 __ LDA #$b8
0f9d : 85 30 __ STA P3 
0f9f : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
0fa2 : a9 20 __ LDA #$20
0fa4 : 85 2d __ STA P0 
0fa6 : a9 35 __ LDA #$35
0fa8 : 85 2e __ STA P1 
0faa : a9 00 __ LDA #$00
0fac : 85 30 __ STA P3 
0fae : 85 33 __ STA P6 
0fb0 : a9 02 __ LDA #$02
0fb2 : 85 34 __ STA P7 
0fb4 : a9 00 __ LDA #$00
0fb6 : 85 31 __ STA P4 
0fb8 : a9 27 __ LDA #$27
0fba : 85 32 __ STA P5 
0fbc : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
0fbf : a9 17 __ LDA #$17
0fc1 : 85 2d __ STA P0 
0fc3 : a9 a9 __ LDA #$a9
0fc5 : 85 2e __ STA P1 
0fc7 : a9 09 __ LDA #$09
0fc9 : 85 2f __ STA P2 
0fcb : a9 02 __ LDA #$02
0fcd : 85 31 __ STA P4 
0fcf : 85 32 __ STA P5 
0fd1 : a9 03 __ LDA #$03
0fd3 : 85 33 __ STA P6 
0fd5 : a9 01 __ LDA #$01
0fd7 : 85 34 __ STA P7 
0fd9 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
0fdc : a9 fc __ LDA #$fc
0fde : 85 2e __ STA P1 
0fe0 : a9 00 __ LDA #$00
0fe2 : 85 2f __ STA P2 
0fe4 : a9 b8 __ LDA #$b8
0fe6 : 85 30 __ STA P3 
0fe8 : a9 01 __ LDA #$01
0fea : 85 31 __ STA P4 
0fec : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
0fef : a9 18 __ LDA #$18
0ff1 : 85 2d __ STA P0 
0ff3 : a9 a9 __ LDA #$a9
0ff5 : 85 2e __ STA P1 
0ff7 : a9 09 __ LDA #$09
0ff9 : 85 2f __ STA P2 
0ffb : a9 00 __ LDA #$00
0ffd : 85 30 __ STA P3 
0fff : a9 02 __ LDA #$02
1001 : 85 31 __ STA P4 
1003 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1006 : a9 4c __ LDA #$4c
1008 : 85 2e __ STA P1 
100a : a9 01 __ LDA #$01
100c : 85 2f __ STA P2 
100e : 85 31 __ STA P4 
1010 : a9 b8 __ LDA #$b8
1012 : 85 30 __ STA P3 
1014 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1017 : a9 01 __ LDA #$01
1019 : 85 2e __ STA P1 
101b : a9 00 __ LDA #$00
101d : 85 2f __ STA P2 
101f : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
1022 : a9 10 __ LDA #$10
1024 : 85 2d __ STA P0 
1026 : a9 20 __ LDA #$20
1028 : 85 30 __ STA P3 
102a : a9 00 __ LDA #$00
102c : 85 31 __ STA P4 
102e : a9 3b __ LDA #$3b
1030 : 85 2e __ STA P1 
1032 : a9 25 __ LDA #$25
1034 : 85 2f __ STA P2 
1036 : 20 75 18 JSR $1875 ; (vera_pal_putn.s0 + 0)
1039 : a9 00 __ LDA #$00
103b : 85 2d __ STA P0 
103d : 85 30 __ STA P3 
103f : 85 34 __ STA P7 
1041 : a9 35 __ LDA #$35
1043 : 85 2e __ STA P1 
1045 : a9 01 __ LDA #$01
1047 : 85 2f __ STA P2 
1049 : a9 20 __ LDA #$20
104b : 85 33 __ STA P6 
104d : a9 5b __ LDA #$5b
104f : 85 31 __ STA P4 
1051 : a9 25 __ LDA #$25
1053 : 85 32 __ STA P5 
1055 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
1058 : a9 00 __ LDA #$00
105a : 85 48 __ STA T1 + 0 
105c : 85 49 __ STA T2 + 0 
105e : a9 03 __ LDA #$03
1060 : 85 33 __ STA P6 
1062 : a9 02 __ LDA #$02
1064 : 85 34 __ STA P7 
1066 : 18 __ __ CLC
.l1046:
1067 : a9 a8 __ LDA #$a8
1069 : 85 2e __ STA P1 
106b : a9 09 __ LDA #$09
106d : 85 2f __ STA P2 
106f : a9 00 __ LDA #$00
1071 : 85 30 __ STA P3 
1073 : 85 31 __ STA P4 
1075 : 85 32 __ STA P5 
1077 : a5 48 __ LDA T1 + 0 
1079 : 69 19 __ ADC #$19
107b : 85 2d __ STA P0 
107d : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1080 : a9 b8 __ LDA #$b8
1082 : 85 30 __ STA P3 
1084 : a9 01 __ LDA #$01
1086 : 85 31 __ STA P4 
1088 : 38 __ __ SEC
1089 : a5 49 __ LDA T2 + 0 
108b : e9 fc __ SBC #$fc
108d : 85 2e __ STA P1 
108f : a9 00 __ LDA #$00
1091 : e9 03 __ SBC #$03
1093 : 85 2f __ STA P2 
1095 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1098 : 18 __ __ CLC
1099 : a5 49 __ LDA T2 + 0 
109b : 69 0c __ ADC #$0c
109d : 85 49 __ STA T2 + 0 
109f : e6 48 __ INC T1 + 0 
10a1 : a5 48 __ LDA T1 + 0 
10a3 : c9 08 __ CMP #$08
10a5 : 90 c0 __ BCC $1067 ; (SetUpSprites.l1046 + 0)
.s77:
10a7 : a9 00 __ LDA #$00
10a9 : 85 48 __ STA T1 + 0 
10ab : 85 49 __ STA T2 + 0 
10ad : a9 03 __ LDA #$03
10af : 85 33 __ STA P6 
10b1 : 85 34 __ STA P7 
10b3 : 18 __ __ CLC
.l1048:
10b4 : a9 a8 __ LDA #$a8
10b6 : 85 2e __ STA P1 
10b8 : a9 09 __ LDA #$09
10ba : 85 2f __ STA P2 
10bc : a9 00 __ LDA #$00
10be : 85 30 __ STA P3 
10c0 : 85 31 __ STA P4 
10c2 : a5 48 __ LDA T1 + 0 
10c4 : 69 21 __ ADC #$21
10c6 : 85 2d __ STA P0 
10c8 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
10cb : a9 c4 __ LDA #$c4
10cd : 85 30 __ STA P3 
10cf : a9 01 __ LDA #$01
10d1 : 85 31 __ STA P4 
10d3 : 38 __ __ SEC
10d4 : a5 49 __ LDA T2 + 0 
10d6 : e9 fc __ SBC #$fc
10d8 : 85 2e __ STA P1 
10da : a9 00 __ LDA #$00
10dc : e9 03 __ SBC #$03
10de : 85 2f __ STA P2 
10e0 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
10e3 : 18 __ __ CLC
10e4 : a5 49 __ LDA T2 + 0 
10e6 : 69 0c __ ADC #$0c
10e8 : 85 49 __ STA T2 + 0 
10ea : e6 48 __ INC T1 + 0 
10ec : a5 48 __ LDA T1 + 0 
10ee : c9 08 __ CMP #$08
10f0 : 90 c2 __ BCC $10b4 ; (SetUpSprites.l1048 + 0)
.s81:
10f2 : a9 00 __ LDA #$00
10f4 : 85 48 __ STA T1 + 0 
10f6 : 85 49 __ STA T2 + 0 
10f8 : a9 03 __ LDA #$03
10fa : 85 33 __ STA P6 
10fc : a9 04 __ LDA #$04
10fe : 85 34 __ STA P7 
1100 : 18 __ __ CLC
.l1050:
1101 : a9 a8 __ LDA #$a8
1103 : 85 2e __ STA P1 
1105 : a9 09 __ LDA #$09
1107 : 85 2f __ STA P2 
1109 : a9 00 __ LDA #$00
110b : 85 30 __ STA P3 
110d : 85 31 __ STA P4 
110f : a5 48 __ LDA T1 + 0 
1111 : 69 29 __ ADC #$29
1113 : 85 2d __ STA P0 
1115 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1118 : a9 b8 __ LDA #$b8
111a : 85 30 __ STA P3 
111c : a9 01 __ LDA #$01
111e : 85 31 __ STA P4 
1120 : 38 __ __ SEC
1121 : a9 6c __ LDA #$6c
1123 : e5 49 __ SBC T2 + 0 
1125 : 85 2e __ STA P1 
1127 : a9 02 __ LDA #$02
1129 : e9 04 __ SBC #$04
112b : 85 2f __ STA P2 
112d : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1130 : 18 __ __ CLC
1131 : a5 49 __ LDA T2 + 0 
1133 : 69 0c __ ADC #$0c
1135 : 85 49 __ STA T2 + 0 
1137 : e6 48 __ INC T1 + 0 
1139 : a5 48 __ LDA T1 + 0 
113b : c9 08 __ CMP #$08
113d : 90 c2 __ BCC $1101 ; (SetUpSprites.l1050 + 0)
.s85:
113f : a9 00 __ LDA #$00
1141 : 85 48 __ STA T1 + 0 
1143 : a9 03 __ LDA #$03
1145 : 85 33 __ STA P6 
1147 : a9 04 __ LDA #$04
1149 : 85 34 __ STA P7 
.l87:
114b : 38 __ __ SEC
114c : a9 00 __ LDA #$00
114e : e5 48 __ SBC T1 + 0 
1150 : 29 0c __ AND #$0c
1152 : 49 ff __ EOR #$ff
1154 : 38 __ __ SEC
1155 : 69 6c __ ADC #$6c
1157 : 85 49 __ STA T2 + 0 
1159 : a9 02 __ LDA #$02
115b : e9 00 __ SBC #$00
115d : 85 4a __ STA T2 + 1 
115f : 18 __ __ CLC
1160 : a5 48 __ LDA T1 + 0 
1162 : 69 31 __ ADC #$31
1164 : 85 2d __ STA P0 
1166 : a9 02 __ LDA #$02
1168 : 85 4b __ STA T4 + 0 
.l1034:
116a : a9 a8 __ LDA #$a8
116c : 85 2e __ STA P1 
116e : a9 09 __ LDA #$09
1170 : 85 2f __ STA P2 
1172 : a9 00 __ LDA #$00
1174 : 85 30 __ STA P3 
1176 : 85 31 __ STA P4 
1178 : 85 32 __ STA P5 
117a : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
117d : a5 49 __ LDA T2 + 0 
117f : 85 2e __ STA P1 
1181 : a5 4a __ LDA T2 + 1 
1183 : 85 2f __ STA P2 
1185 : a9 b8 __ LDA #$b8
1187 : 85 30 __ STA P3 
1189 : a9 01 __ LDA #$01
118b : 85 31 __ STA P4 
118d : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1190 : c6 4b __ DEC T4 + 0 
1192 : d0 d6 __ BNE $116a ; (SetUpSprites.l1034 + 0)
.s88:
1194 : e6 48 __ INC T1 + 0 
1196 : a5 48 __ LDA T1 + 0 
1198 : c9 02 __ CMP #$02
119a : 90 af __ BCC $114b ; (SetUpSprites.l87 + 0)
.s89:
119c : a9 60 __ LDA #$60
119e : 85 2d __ STA P0 
11a0 : a9 4f __ LDA #$4f
11a2 : 85 2e __ STA P1 
11a4 : a9 01 __ LDA #$01
11a6 : 85 2f __ STA P2 
11a8 : 85 34 __ STA P7 
11aa : a9 00 __ LDA #$00
11ac : 85 30 __ STA P3 
11ae : 85 33 __ STA P6 
11b0 : a9 00 __ LDA #$00
11b2 : 85 31 __ STA P4 
11b4 : a9 29 __ LDA #$29
11b6 : 85 32 __ STA P5 
11b8 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
11bb : a9 33 __ LDA #$33
11bd : 85 2d __ STA P0 
11bf : a9 7b __ LDA #$7b
11c1 : 85 2e __ STA P1 
11c3 : a9 0a __ LDA #$0a
11c5 : 85 2f __ STA P2 
11c7 : a9 01 __ LDA #$01
11c9 : 85 31 __ STA P4 
11cb : a9 02 __ LDA #$02
11cd : 85 32 __ STA P5 
11cf : a9 03 __ LDA #$03
11d1 : 85 33 __ STA P6 
11d3 : a9 06 __ LDA #$06
11d5 : 85 34 __ STA P7 
11d7 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
11da : a9 00 __ LDA #$00
11dc : 85 2e __ STA P1 
11de : 85 31 __ STA P4 
11e0 : a9 01 __ LDA #$01
11e2 : 85 2f __ STA P2 
11e4 : a9 78 __ LDA #$78
11e6 : 85 30 __ STA P3 
11e8 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
11eb : a9 20 __ LDA #$20
11ed : 85 2d __ STA P0 
11ef : a9 3f __ LDA #$3f
11f1 : 85 2e __ STA P1 
11f3 : a9 00 __ LDA #$00
11f5 : 85 30 __ STA P3 
11f7 : 85 33 __ STA P6 
11f9 : a9 04 __ LDA #$04
11fb : 85 34 __ STA P7 
11fd : a9 00 __ LDA #$00
11ff : 85 31 __ STA P4 
1201 : a9 2a __ LDA #$2a
1203 : 85 32 __ STA P5 
1205 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
1208 : a9 34 __ LDA #$34
120a : 85 2d __ STA P0 
120c : a9 f9 __ LDA #$f9
120e : 85 2e __ STA P1 
1210 : a9 09 __ LDA #$09
1212 : 85 2f __ STA P2 
1214 : a9 03 __ LDA #$03
1216 : 85 31 __ STA P4 
1218 : 85 33 __ STA P6 
121a : a9 02 __ LDA #$02
121c : 85 32 __ STA P5 
121e : a9 05 __ LDA #$05
1220 : 85 34 __ STA P7 
1222 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1225 : a9 00 __ LDA #$00
1227 : 85 2e __ STA P1 
1229 : 85 31 __ STA P4 
122b : a9 01 __ LDA #$01
122d : 85 2f __ STA P2 
122f : a9 78 __ LDA #$78
1231 : 85 30 __ STA P3 
1233 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1236 : a9 35 __ LDA #$35
1238 : 85 2d __ STA P0 
123a : a9 19 __ LDA #$19
123c : 85 2e __ STA P1 
123e : a9 0a __ LDA #$0a
1240 : 85 2f __ STA P2 
1242 : a9 00 __ LDA #$00
1244 : 85 30 __ STA P3 
1246 : a9 03 __ LDA #$03
1248 : 85 31 __ STA P4 
124a : a9 07 __ LDA #$07
124c : 85 33 __ STA P6 
124e : a9 06 __ LDA #$06
1250 : 85 34 __ STA P7 
1252 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1255 : a9 00 __ LDA #$00
1257 : 85 2e __ STA P1 
1259 : 85 31 __ STA P4 
125b : a9 01 __ LDA #$01
125d : 85 2f __ STA P2 
125f : a9 e8 __ LDA #$e8
1261 : 85 30 __ STA P3 
1263 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1266 : a9 36 __ LDA #$36
1268 : 85 2d __ STA P0 
126a : a9 19 __ LDA #$19
126c : 85 2e __ STA P1 
126e : a9 0a __ LDA #$0a
1270 : 85 2f __ STA P2 
1272 : a9 00 __ LDA #$00
1274 : 85 30 __ STA P3 
1276 : a9 03 __ LDA #$03
1278 : 85 31 __ STA P4 
127a : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
127d : a9 40 __ LDA #$40
127f : 85 2e __ STA P1 
1281 : a9 01 __ LDA #$01
1283 : 85 2f __ STA P2 
1285 : a9 e8 __ LDA #$e8
1287 : 85 30 __ STA P3 
1289 : a9 00 __ LDA #$00
128b : 85 31 __ STA P4 
128d : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1290 : a9 01 __ LDA #$01
1292 : 85 2e __ STA P1 
1294 : a9 00 __ LDA #$00
1296 : 85 2f __ STA P2 
1298 : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
129b : a9 37 __ LDA #$37
129d : 85 2d __ STA P0 
129f : a9 19 __ LDA #$19
12a1 : 85 2e __ STA P1 
12a3 : a9 0a __ LDA #$0a
12a5 : 85 2f __ STA P2 
12a7 : a9 00 __ LDA #$00
12a9 : 85 30 __ STA P3 
12ab : a9 03 __ LDA #$03
12ad : 85 31 __ STA P4 
12af : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
12b2 : a9 00 __ LDA #$00
12b4 : 85 2e __ STA P1 
12b6 : a9 01 __ LDA #$01
12b8 : 85 2f __ STA P2 
12ba : 85 31 __ STA P4 
12bc : a9 08 __ LDA #$08
12be : 85 30 __ STA P3 
12c0 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
12c3 : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
12c6 : a9 38 __ LDA #$38
12c8 : 85 2d __ STA P0 
12ca : a9 19 __ LDA #$19
12cc : 85 2e __ STA P1 
12ce : a9 0a __ LDA #$0a
12d0 : 85 2f __ STA P2 
12d2 : a9 00 __ LDA #$00
12d4 : 85 30 __ STA P3 
12d6 : a9 03 __ LDA #$03
12d8 : 85 31 __ STA P4 
12da : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
12dd : a9 40 __ LDA #$40
12df : 85 2e __ STA P1 
12e1 : a9 01 __ LDA #$01
12e3 : 85 2f __ STA P2 
12e5 : 85 31 __ STA P4 
12e7 : a9 08 __ LDA #$08
12e9 : 85 30 __ STA P3 
12eb : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
12ee : a9 01 __ LDA #$01
12f0 : 85 2e __ STA P1 
12f2 : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
12f5 : a9 20 __ LDA #$20
12f7 : 85 2d __ STA P0 
12f9 : a9 37 __ LDA #$37
12fb : 85 2e __ STA P1 
12fd : a9 00 __ LDA #$00
12ff : 85 30 __ STA P3 
1301 : 85 33 __ STA P6 
1303 : a9 08 __ LDA #$08
1305 : 85 34 __ STA P7 
1307 : a9 00 __ LDA #$00
1309 : 85 31 __ STA P4 
130b : a9 2e __ LDA #$2e
130d : 85 32 __ STA P5 
130f : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
1312 : a9 00 __ LDA #$00
1314 : 85 48 __ STA T1 + 0 
1316 : 85 49 __ STA T2 + 0 
1318 : 85 4a __ STA T2 + 1 
131a : a9 02 __ LDA #$02
131c : 85 33 __ STA P6 
131e : a9 05 __ LDA #$05
1320 : 85 34 __ STA P7 
1322 : a9 03 __ LDA #$03
1324 : 85 32 __ STA P5 
1326 : 18 __ __ CLC
.l1052:
1327 : a9 b9 __ LDA #$b9
1329 : 85 2e __ STA P1 
132b : a9 09 __ LDA #$09
132d : 85 2f __ STA P2 
132f : a9 00 __ LDA #$00
1331 : 85 30 __ STA P3 
1333 : a9 03 __ LDA #$03
1335 : 85 31 __ STA P4 
1337 : a5 48 __ LDA T1 + 0 
1339 : 69 39 __ ADC #$39
133b : 85 2d __ STA P0 
133d : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1340 : a9 20 __ LDA #$20
1342 : 85 2e __ STA P1 
1344 : a9 01 __ LDA #$01
1346 : 85 2f __ STA P2 
1348 : 38 __ __ SEC
1349 : a5 49 __ LDA T2 + 0 
134b : e9 60 __ SBC #$60
134d : 85 30 __ STA P3 
134f : a5 4a __ LDA T2 + 1 
1351 : e9 00 __ SBC #$00
1353 : 85 31 __ STA P4 
1355 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1358 : 18 __ __ CLC
1359 : a5 49 __ LDA T2 + 0 
135b : 69 40 __ ADC #$40
135d : 85 49 __ STA T2 + 0 
135f : 90 02 __ BCC $1363 ; (SetUpSprites.s1055 + 0)
.s1054:
1361 : e6 4a __ INC T2 + 1 
.s1055:
1363 : e6 48 __ INC T1 + 0 
1365 : a5 48 __ LDA T1 + 0 
1367 : c9 07 __ CMP #$07
1369 : 90 bc __ BCC $1327 ; (SetUpSprites.l1052 + 0)
.s97:
136b : a9 20 __ LDA #$20
136d : 85 2d __ STA P0 
136f : a9 47 __ LDA #$47
1371 : 85 2e __ STA P1 
1373 : a9 00 __ LDA #$00
1375 : 85 30 __ STA P3 
1377 : 85 33 __ STA P6 
1379 : a9 08 __ LDA #$08
137b : 85 34 __ STA P7 
137d : a9 00 __ LDA #$00
137f : 85 31 __ STA P4 
1381 : a9 36 __ LDA #$36
1383 : 85 32 __ STA P5 
1385 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
1388 : a9 47 __ LDA #$47
138a : 85 2d __ STA P0 
138c : a9 39 __ LDA #$39
138e : 85 2e __ STA P1 
1390 : a9 0a __ LDA #$0a
1392 : 85 2f __ STA P2 
1394 : a9 03 __ LDA #$03
1396 : 85 31 __ STA P4 
1398 : 85 32 __ STA P5 
139a : a9 07 __ LDA #$07
139c : 85 33 __ STA P6 
139e : a9 06 __ LDA #$06
13a0 : 85 34 __ STA P7 
13a2 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
13a5 : a9 08 __ LDA #$08
13a7 : 85 2e __ STA P1 
13a9 : 85 30 __ STA P3 
13ab : a9 00 __ LDA #$00
13ad : 85 2f __ STA P2 
13af : 85 31 __ STA P4 
13b1 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
13b4 : a9 48 __ LDA #$48
13b6 : 85 2d __ STA P0 
13b8 : a9 39 __ LDA #$39
13ba : 85 2e __ STA P1 
13bc : a9 0a __ LDA #$0a
13be : 85 2f __ STA P2 
13c0 : a9 00 __ LDA #$00
13c2 : 85 30 __ STA P3 
13c4 : a9 03 __ LDA #$03
13c6 : 85 31 __ STA P4 
13c8 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
13cb : a9 48 __ LDA #$48
13cd : 85 2e __ STA P1 
13cf : a9 00 __ LDA #$00
13d1 : 85 2f __ STA P2 
13d3 : 85 31 __ STA P4 
13d5 : a9 08 __ LDA #$08
13d7 : 85 30 __ STA P3 
13d9 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
13dc : a9 01 __ LDA #$01
13de : 85 2e __ STA P1 
13e0 : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
13e3 : a9 49 __ LDA #$49
13e5 : 85 2d __ STA P0 
13e7 : a9 39 __ LDA #$39
13e9 : 85 2e __ STA P1 
13eb : a9 0a __ LDA #$0a
13ed : 85 2f __ STA P2 
13ef : a9 00 __ LDA #$00
13f1 : 85 30 __ STA P3 
13f3 : a9 03 __ LDA #$03
13f5 : 85 31 __ STA P4 
13f7 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
13fa : a9 48 __ LDA #$48
13fc : 85 2e __ STA P1 
13fe : 85 30 __ STA P3 
1400 : a9 00 __ LDA #$00
1402 : 85 2f __ STA P2 
1404 : 85 31 __ STA P4 
1406 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1409 : a9 01 __ LDA #$01
140b : 85 2e __ STA P1 
140d : 85 2f __ STA P2 
140f : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
1412 : a9 4a __ LDA #$4a
1414 : 85 2d __ STA P0 
1416 : a9 39 __ LDA #$39
1418 : 85 2e __ STA P1 
141a : a9 0a __ LDA #$0a
141c : 85 2f __ STA P2 
141e : a9 00 __ LDA #$00
1420 : 85 30 __ STA P3 
1422 : a9 03 __ LDA #$03
1424 : 85 31 __ STA P4 
1426 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1429 : a9 08 __ LDA #$08
142b : 85 2e __ STA P1 
142d : a9 00 __ LDA #$00
142f : 85 2f __ STA P2 
1431 : 85 31 __ STA P4 
1433 : a9 48 __ LDA #$48
1435 : 85 30 __ STA P3 
1437 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
143a : a9 00 __ LDA #$00
143c : 85 2e __ STA P1 
143e : a9 01 __ LDA #$01
1440 : 85 2f __ STA P2 
1442 : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
1445 : a9 20 __ LDA #$20
1447 : 85 2d __ STA P0 
1449 : a9 47 __ LDA #$47
144b : 85 2e __ STA P1 
144d : a9 00 __ LDA #$00
144f : 85 30 __ STA P3 
1451 : a9 00 __ LDA #$00
1453 : 85 31 __ STA P4 
1455 : a9 36 __ LDA #$36
1457 : 85 32 __ STA P5 
1459 : a9 00 __ LDA #$00
145b : 85 33 __ STA P6 
145d : a9 08 __ LDA #$08
145f : 85 34 __ STA P7 
1461 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
1464 : a9 4b __ LDA #$4b
1466 : 85 2d __ STA P0 
1468 : a9 39 __ LDA #$39
146a : 85 2e __ STA P1 
146c : a9 0a __ LDA #$0a
146e : 85 2f __ STA P2 
1470 : a9 03 __ LDA #$03
1472 : 85 31 __ STA P4 
1474 : 85 32 __ STA P5 
1476 : a9 07 __ LDA #$07
1478 : 85 33 __ STA P6 
147a : a9 06 __ LDA #$06
147c : 85 34 __ STA P7 
147e : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1481 : a9 f8 __ LDA #$f8
1483 : 85 2e __ STA P1 
1485 : a9 01 __ LDA #$01
1487 : 85 2f __ STA P2 
1489 : a9 08 __ LDA #$08
148b : 85 30 __ STA P3 
148d : a9 00 __ LDA #$00
148f : 85 31 __ STA P4 
1491 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1494 : a9 4c __ LDA #$4c
1496 : 85 2d __ STA P0 
1498 : a9 39 __ LDA #$39
149a : 85 2e __ STA P1 
149c : a9 0a __ LDA #$0a
149e : 85 2f __ STA P2 
14a0 : a9 00 __ LDA #$00
14a2 : 85 30 __ STA P3 
14a4 : a9 03 __ LDA #$03
14a6 : 85 31 __ STA P4 
14a8 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
14ab : a9 38 __ LDA #$38
14ad : 85 2e __ STA P1 
14af : a9 02 __ LDA #$02
14b1 : 85 2f __ STA P2 
14b3 : a9 08 __ LDA #$08
14b5 : 85 30 __ STA P3 
14b7 : a9 00 __ LDA #$00
14b9 : 85 31 __ STA P4 
14bb : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
14be : a9 01 __ LDA #$01
14c0 : 85 2e __ STA P1 
14c2 : a9 00 __ LDA #$00
14c4 : 85 2f __ STA P2 
14c6 : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
14c9 : a9 4d __ LDA #$4d
14cb : 85 2d __ STA P0 
14cd : a9 39 __ LDA #$39
14cf : 85 2e __ STA P1 
14d1 : a9 0a __ LDA #$0a
14d3 : 85 2f __ STA P2 
14d5 : a9 00 __ LDA #$00
14d7 : 85 30 __ STA P3 
14d9 : a9 03 __ LDA #$03
14db : 85 31 __ STA P4 
14dd : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
14e0 : a9 38 __ LDA #$38
14e2 : 85 2e __ STA P1 
14e4 : a9 02 __ LDA #$02
14e6 : 85 2f __ STA P2 
14e8 : a9 48 __ LDA #$48
14ea : 85 30 __ STA P3 
14ec : a9 00 __ LDA #$00
14ee : 85 31 __ STA P4 
14f0 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
14f3 : a9 01 __ LDA #$01
14f5 : 85 2e __ STA P1 
14f7 : 85 2f __ STA P2 
14f9 : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
14fc : a9 4e __ LDA #$4e
14fe : 85 2d __ STA P0 
1500 : a9 39 __ LDA #$39
1502 : 85 2e __ STA P1 
1504 : a9 0a __ LDA #$0a
1506 : 85 2f __ STA P2 
1508 : a9 00 __ LDA #$00
150a : 85 30 __ STA P3 
150c : a9 03 __ LDA #$03
150e : 85 31 __ STA P4 
1510 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1513 : a9 f8 __ LDA #$f8
1515 : 85 2e __ STA P1 
1517 : a9 01 __ LDA #$01
1519 : 85 2f __ STA P2 
151b : a9 48 __ LDA #$48
151d : 85 30 __ STA P3 
151f : a9 00 __ LDA #$00
1521 : 85 31 __ STA P4 
1523 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1526 : a9 00 __ LDA #$00
1528 : 85 2e __ STA P1 
152a : 20 38 18 JSR $1838 ; (vera_spr_flip.s0 + 0)
152d : a9 60 __ LDA #$60
152f : 85 2d __ STA P0 
1531 : a9 51 __ LDA #$51
1533 : 85 2e __ STA P1 
1535 : a9 00 __ LDA #$00
1537 : 85 30 __ STA P3 
1539 : 85 33 __ STA P6 
153b : a9 02 __ LDA #$02
153d : 85 34 __ STA P7 
153f : a9 00 __ LDA #$00
1541 : 85 31 __ STA P4 
1543 : a9 3e __ LDA #$3e
1545 : 85 32 __ STA P5 
1547 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
154a : a9 a0 __ LDA #$a0
154c : 85 2d __ STA P0 
154e : a9 50 __ LDA #$50
1550 : 85 2e __ STA P1 
1552 : a9 80 __ LDA #$80
1554 : 85 33 __ STA P6 
1556 : a9 00 __ LDA #$00
1558 : 85 34 __ STA P7 
155a : a9 7b __ LDA #$7b
155c : 85 31 __ STA P4 
155e : a9 25 __ LDA #$25
1560 : 85 32 __ STA P5 
1562 : 20 40 17 JSR $1740 ; (vram_putn.s0 + 0)
1565 : a9 00 __ LDA #$00
1567 : 85 47 __ STA T0 + 0 
1569 : a9 0a __ LDA #$0a
156b : 85 2f __ STA P2 
156d : a9 02 __ LDA #$02
156f : 85 33 __ STA P6 
1571 : a9 08 __ LDA #$08
1573 : 85 34 __ STA P7 
.l99:
1575 : a9 85 __ LDA #$85
1577 : 85 2e __ STA P1 
1579 : a9 01 __ LDA #$01
157b : 85 31 __ STA P4 
157d : 85 32 __ STA P5 
157f : 18 __ __ CLC
1580 : a5 47 __ LDA T0 + 0 
1582 : 69 4f __ ADC #$4f
1584 : 85 2d __ STA P0 
1586 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
1589 : a5 47 __ LDA T0 + 0 
158b : c9 1f __ CMP #$1f
158d : d0 0d __ BNE $159c ; (SetUpSprites.s227 + 0)
.s102:
158f : a9 8b __ LDA #$8b
1591 : 85 2e __ STA P1 
1593 : a9 02 __ LDA #$02
1595 : 85 31 __ STA P4 
1597 : 85 32 __ STA P5 
1599 : 20 a2 17 JSR $17a2 ; (vera_spr_set.s0 + 0)
.s227:
159c : e6 47 __ INC T0 + 0 
159e : a5 47 __ LDA T0 + 0 
15a0 : c9 20 __ CMP #$20
15a2 : 90 d1 __ BCC $1575 ; (SetUpSprites.l99 + 0)
.s101:
15a4 : a9 20 __ LDA #$20
15a6 : 85 37 __ STA P10 
15a8 : a9 40 __ LDA #$40
15aa : 8d fc 9e STA $9efc ; (sstack + 0)
15ad : a9 fa __ LDA #$fa
15af : 8d fd 9e STA $9efd ; (sstack + 1)
15b2 : a9 01 __ LDA #$01
15b4 : 8d fe 9e STA $9efe ; (sstack + 2)
15b7 : a9 00 __ LDA #$00
15b9 : 8d ff 9e STA $9eff ; (sstack + 3)
15bc : a9 00 __ LDA #$00
15be : 85 35 __ STA P8 
15c0 : a9 40 __ LDA #$40
15c2 : 85 36 __ STA P9 
15c4 : 20 be 18 JSR $18be ; (SetPaletteColours.s0 + 0)
15c7 : a9 60 __ LDA #$60
15c9 : 8d fc 9e STA $9efc ; (sstack + 0)
15cc : a9 fa __ LDA #$fa
15ce : 8d fd 9e STA $9efd ; (sstack + 1)
15d1 : a9 01 __ LDA #$01
15d3 : 8d fe 9e STA $9efe ; (sstack + 2)
15d6 : a9 00 __ LDA #$00
15d8 : 8d ff 9e STA $9eff ; (sstack + 3)
15db : a9 20 __ LDA #$20
15dd : 85 35 __ STA P8 
15df : a9 40 __ LDA #$40
15e1 : 85 36 __ STA P9 
15e3 : 20 be 18 JSR $18be ; (SetPaletteColours.s0 + 0)
15e6 : a9 80 __ LDA #$80
15e8 : 8d fc 9e STA $9efc ; (sstack + 0)
15eb : a9 fa __ LDA #$fa
15ed : 8d fd 9e STA $9efd ; (sstack + 1)
15f0 : a9 01 __ LDA #$01
15f2 : 8d fe 9e STA $9efe ; (sstack + 2)
15f5 : a9 00 __ LDA #$00
15f7 : 8d ff 9e STA $9eff ; (sstack + 3)
15fa : a9 40 __ LDA #$40
15fc : 85 35 __ STA P8 
15fe : a9 40 __ LDA #$40
1600 : 85 36 __ STA P9 
1602 : 20 be 18 JSR $18be ; (SetPaletteColours.s0 + 0)
1605 : a9 60 __ LDA #$60
1607 : 85 2d __ STA P0 
1609 : a9 20 __ LDA #$20
160b : 85 30 __ STA P3 
160d : a9 00 __ LDA #$00
160f : 85 31 __ STA P4 
1611 : a9 60 __ LDA #$60
1613 : 85 2e __ STA P1 
1615 : a9 40 __ LDA #$40
1617 : 85 2f __ STA P2 
1619 : 20 75 18 JSR $1875 ; (vera_pal_putn.s0 + 0)
161c : a9 70 __ LDA #$70
161e : 85 2d __ STA P0 
1620 : a9 0c __ LDA #$0c
1622 : 85 30 __ STA P3 
1624 : a9 00 __ LDA #$00
1626 : 85 31 __ STA P4 
1628 : a9 6c __ LDA #$6c
162a : 85 2e __ STA P1 
162c : a9 40 __ LDA #$40
162e : 85 2f __ STA P2 
1630 : 20 75 18 JSR $1875 ; (vera_pal_putn.s0 + 0)
1633 : a9 80 __ LDA #$80
1635 : 85 2d __ STA P0 
1637 : a9 20 __ LDA #$20
1639 : 85 30 __ STA P3 
163b : a9 00 __ LDA #$00
163d : 85 31 __ STA P4 
163f : a9 78 __ LDA #$78
1641 : 85 2e __ STA P1 
1643 : a9 40 __ LDA #$40
1645 : 85 2f __ STA P2 
1647 : 20 75 18 JSR $1875 ; (vera_pal_putn.s0 + 0)
164a : a9 90 __ LDA #$90
164c : 85 2d __ STA P0 
164e : a9 10 __ LDA #$10
1650 : 85 30 __ STA P3 
1652 : a9 00 __ LDA #$00
1654 : 85 31 __ STA P4 
1656 : a9 98 __ LDA #$98
1658 : 85 2e __ STA P1 
165a : a9 40 __ LDA #$40
165c : 85 2f __ STA P2 
165e : 20 75 18 JSR $1875 ; (vera_pal_putn.s0 + 0)
1661 : a9 a0 __ LDA #$a0
1663 : 85 2d __ STA P0 
1665 : a9 1a __ LDA #$1a
1667 : 85 30 __ STA P3 
1669 : a9 00 __ LDA #$00
166b : 85 31 __ STA P4 
166d : a9 a8 __ LDA #$a8
166f : 85 2e __ STA P1 
1671 : a9 40 __ LDA #$40
1673 : 85 2f __ STA P2 
1675 : 20 75 18 JSR $1875 ; (vera_pal_putn.s0 + 0)
1678 : a9 20 __ LDA #$20
167a : 85 2d __ STA P0 
167c : a9 43 __ LDA #$43
167e : 85 2e __ STA P1 
1680 : a9 01 __ LDA #$01
1682 : 85 2f __ STA P2 
1684 : a9 00 __ LDA #$00
1686 : 85 30 __ STA P3 
1688 : 85 33 __ STA P6 
168a : a9 04 __ LDA #$04
168c : 85 34 __ STA P7 
168e : a9 c2 __ LDA #$c2
1690 : 85 31 __ STA P4 
1692 : a9 40 __ LDA #$40
1694 : 85 32 __ STA P5 
1696 : 4c 40 17 JMP $1740 ; (vram_putn.s0 + 0)
.s1025:
1699 : c9 34 __ CMP #$34
169b : 90 05 __ BCC $16a2 ; (SetUpSprites.s1024 + 0)
.s29:
169d : a9 09 __ LDA #$09
169f : 4c b5 0e JMP $0eb5 ; (SetUpSprites.s218 + 0)
.s1024:
16a2 : a9 2c __ LDA #$2c
16a4 : c5 25 __ CMP WORK + 2 
16a6 : a5 49 __ LDA T2 + 0 
16a8 : 90 3e __ BCC $16e8 ; (SetUpSprites.s1017 + 0)
.s1023:
16aa : c9 09 __ CMP #$09
16ac : 90 06 __ BCC $16b4 ; (SetUpSprites.s35 + 0)
.s1022:
16ae : a9 45 __ LDA #$45
16b0 : c5 49 __ CMP T2 + 0 
16b2 : b0 05 __ BCS $16b9 ; (SetUpSprites.s1021 + 0)
.s35:
16b4 : a9 00 __ LDA #$00
16b6 : 4c b5 0e JMP $0eb5 ; (SetUpSprites.s218 + 0)
.s1021:
16b9 : a5 49 __ LDA T2 + 0 
16bb : c9 13 __ CMP #$13
16bd : 90 06 __ BCC $16c5 ; (SetUpSprites.s39 + 0)
.s1020:
16bf : a9 3b __ LDA #$3b
16c1 : c5 49 __ CMP T2 + 0 
16c3 : b0 04 __ BCS $16c9 ; (SetUpSprites.s1019 + 0)
.s39:
16c5 : a9 01 __ LDA #$01
16c7 : d0 12 __ BNE $16db ; (SetUpSprites.s234 + 0)
.s1019:
16c9 : a5 49 __ LDA T2 + 0 
16cb : c9 1d __ CMP #$1d
16cd : 90 06 __ BCC $16d5 ; (SetUpSprites.s43 + 0)
.s1018:
16cf : a9 31 __ LDA #$31
16d1 : c5 49 __ CMP T2 + 0 
16d3 : b0 04 __ BCS $16d9 ; (SetUpSprites.s44 + 0)
.s43:
16d5 : a9 02 __ LDA #$02
16d7 : d0 02 __ BNE $16db ; (SetUpSprites.s234 + 0)
.s44:
16d9 : a9 03 __ LDA #$03
.s234:
16db : 8d 23 9f STA $9f23 
16de : a9 00 __ LDA #$00
16e0 : 8d 23 9f STA $9f23 
16e3 : e6 49 __ INC T2 + 0 
16e5 : 4c 7f 0e JMP $0e7f ; (SetUpSprites.l14 + 0)
.s1017:
16e8 : c9 09 __ CMP #$09
16ea : 90 06 __ BCC $16f2 ; (SetUpSprites.s50 + 0)
.s1016:
16ec : a9 45 __ LDA #$45
16ee : c5 49 __ CMP T2 + 0 
16f0 : b0 05 __ BCS $16f7 ; (SetUpSprites.s1005 + 0)
.s50:
16f2 : a9 05 __ LDA #$05
16f4 : 4c b5 0e JMP $0eb5 ; (SetUpSprites.s218 + 0)
.s1005:
16f7 : a5 49 __ LDA T2 + 0 
16f9 : c9 13 __ CMP #$13
16fb : 90 06 __ BCC $1703 ; (SetUpSprites.s54 + 0)
.s1004:
16fd : a9 3b __ LDA #$3b
16ff : c5 49 __ CMP T2 + 0 
1701 : b0 04 __ BCS $1707 ; (SetUpSprites.s1003 + 0)
.s54:
1703 : a9 06 __ LDA #$06
1705 : d0 d4 __ BNE $16db ; (SetUpSprites.s234 + 0)
.s1003:
1707 : a5 49 __ LDA T2 + 0 
1709 : c9 1d __ CMP #$1d
170b : 90 06 __ BCC $1713 ; (SetUpSprites.s58 + 0)
.s1002:
170d : a9 31 __ LDA #$31
170f : c5 49 __ CMP T2 + 0 
1711 : b0 04 __ BCS $1717 ; (SetUpSprites.s59 + 0)
.s58:
1713 : a9 07 __ LDA #$07
1715 : d0 c4 __ BNE $16db ; (SetUpSprites.s234 + 0)
.s59:
1717 : a9 08 __ LDA #$08
1719 : d0 c0 __ BNE $16db ; (SetUpSprites.s234 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
171b : 46 2d __ LSR P0 ; (bank + 0)
171d : a9 00 __ LDA #$00
171f : 6a __ __ ROR
1720 : 85 3b __ STA ACCU + 0 
1722 : a5 2f __ LDA P2 ; (mem + 1)
1724 : 29 f8 __ AND #$f8
1726 : 4a __ __ LSR
1727 : 05 3b __ ORA ACCU + 0 
1729 : 85 3b __ STA ACCU + 0 
172b : a5 30 __ LDA P3 ; (height + 0)
172d : 0a __ __ ASL
172e : 05 3b __ ORA ACCU + 0 
1730 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1732 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1733 : 46 2d __ LSR P0 ; (bank + 0)
1735 : a9 00 __ LDA #$00
1737 : 6a __ __ ROR
1738 : 85 3b __ STA ACCU + 0 
173a : a5 2f __ LDA P2 ; (mem + 1)
173c : 4a __ __ LSR
173d : 05 3b __ ORA ACCU + 0 
.s1001:
173f : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1740 : ad 25 9f LDA $9f25 
1743 : 29 fe __ AND #$fe
1745 : 8d 25 9f STA $9f25 
1748 : a5 2d __ LDA P0 ; (addr + 0)
174a : 8d 20 9f STA $9f20 
174d : a5 2e __ LDA P1 ; (addr + 1)
174f : 8d 21 9f STA $9f21 
1752 : a5 2f __ LDA P2 ; (addr + 2)
1754 : 29 01 __ AND #$01
1756 : 09 10 __ ORA #$10
1758 : 8d 22 9f STA $9f22 
175b : a5 33 __ LDA P6 ; (size + 0)
175d : 05 34 __ ORA P7 ; (size + 1)
175f : f0 19 __ BEQ $177a ; (vram_putn.s1001 + 0)
.s6:
1761 : a0 00 __ LDY #$00
1763 : a6 33 __ LDX P6 ; (size + 0)
1765 : f0 02 __ BEQ $1769 ; (vram_putn.l1002 + 0)
.s1005:
1767 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1769 : b1 31 __ LDA (P4),y ; (data + 0)
176b : 8d 23 9f STA $9f23 
176e : c8 __ __ INY
176f : d0 02 __ BNE $1773 ; (vram_putn.s1009 + 0)
.s1008:
1771 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1773 : ca __ __ DEX
1774 : d0 f3 __ BNE $1769 ; (vram_putn.l1002 + 0)
.s1004:
1776 : c6 34 __ DEC P7 ; (size + 1)
1778 : d0 ef __ BNE $1769 ; (vram_putn.l1002 + 0)
.s1001:
177a : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1f59 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f69 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f79 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f89 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f99 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fa9 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fb9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fc9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fd9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fe9 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1ff9 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
2009 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
2019 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
2029 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
2039 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
2049 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
2059 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
2069 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
2079 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2089 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2099 : __ __ __ BYT 55 55 55 55 55 55 55 55 aa aa aa aa aa aa aa aa : UUUUUUUU........
20a9 : __ __ __ BYT aa aa aa aa aa aa aa aa 88 88 88 88 88 88 88 88 : ................
20b9 : __ __ __ BYT 88 88 88 88 88 88 88 88 77 77 77 77 77 77 77 77 : ........wwwwwwww
20c9 : __ __ __ BYT cc cc cc cc cc cc cc cc 00 00 00 00 00 00 00 00 : ................
20d9 : __ __ __ BYT 05 00 00 50 00 09 90 00 00 9b b9 00 09 b5 5b 90 : ...P..........[.
20e9 : __ __ __ BYT 09 b5 5b 90 00 9b b9 05 00 09 90 00 05 00 00 00 : ..[.............
20f9 : __ __ __ BYT 13 11 11 11 11 11 11 31 11 19 91 11 11 9b b9 11 : .......1........
2109 : __ __ __ BYT 11 9b b9 11 11 19 91 13 11 11 11 11 13 11 11 11 : ................
2119 : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 19 91 11 : ................
2129 : __ __ __ BYT 11 19 91 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
--------------------------------------------------------------------
rand:
.s0:
177b : ad 3a 21 LDA $213a ; (seed + 1)
177e : 4a __ __ LSR
177f : ad 39 21 LDA $2139 ; (seed + 0)
1782 : 6a __ __ ROR
1783 : aa __ __ TAX
1784 : a9 00 __ LDA #$00
1786 : 6a __ __ ROR
1787 : 4d 39 21 EOR $2139 ; (seed + 0)
178a : 85 3b __ STA ACCU + 0 
178c : 8a __ __ TXA
178d : 4d 3a 21 EOR $213a ; (seed + 1)
1790 : 85 3c __ STA ACCU + 1 
1792 : 4a __ __ LSR
1793 : 45 3b __ EOR ACCU + 0 
1795 : 8d 39 21 STA $2139 ; (seed + 0)
1798 : 85 3b __ STA ACCU + 0 
179a : 45 3c __ EOR ACCU + 1 
179c : 8d 3a 21 STA $213a ; (seed + 1)
179f : 85 3c __ STA ACCU + 1 
.s1001:
17a1 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
2139 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
213b : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
214b : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
215b : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
216b : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
217b : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
218b : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
219b : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
21ab : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
21bb : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
21cb : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
21db : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
21eb : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
21fb : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
220b : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
221b : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
222b : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
223b : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
224b : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
225b : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
226b : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
227b : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
228b : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
229b : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
22ab : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
22bb : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
22cb : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
22db : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
22eb : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
22fb : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
230b : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
231b : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
232b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
233b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
234b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
235b : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
236b : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
237b : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
238b : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
239b : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
23ab : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
23bb : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
23cb : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
23db : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23eb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23fb : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
240b : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
241b : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
242b : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
243b : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
244b : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
245b : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
246b : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
247b : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
248b : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
249b : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
24ab : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
24bb : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
24cb : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
24db : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
24eb : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
24fb : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
250b : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
251b : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
252b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
17a2 : ad 25 9f LDA $9f25 
17a5 : 29 fe __ AND #$fe
17a7 : 8d 25 9f STA $9f25 
17aa : a5 2d __ LDA P0 ; (spr + 0)
17ac : 0a __ __ ASL
17ad : 0a __ __ ASL
17ae : 85 3b __ STA ACCU + 0 
17b0 : a9 3f __ LDA #$3f
17b2 : 2a __ __ ROL
17b3 : 06 3b __ ASL ACCU + 0 
17b5 : 2a __ __ ROL
17b6 : 8d 21 9f STA $9f21 
17b9 : a5 3b __ LDA ACCU + 0 
17bb : 8d 20 9f STA $9f20 
17be : a9 11 __ LDA #$11
17c0 : 8d 22 9f STA $9f22 
17c3 : a5 30 __ LDA P3 ; (mode8 + 0)
17c5 : f0 02 __ BEQ $17c9 ; (vera_spr_set.s11 + 0)
.s9:
17c7 : a9 80 __ LDA #$80
.s11:
17c9 : 05 2f __ ORA P2 ; (addr32 + 1)
17cb : a6 2e __ LDX P1 ; (addr32 + 0)
17cd : 8e 23 9f STX $9f23 
17d0 : 8d 23 9f STA $9f23 
17d3 : a9 00 __ LDA #$00
17d5 : 8d 23 9f STA $9f23 
17d8 : 8d 23 9f STA $9f23 
17db : 8d 23 9f STA $9f23 
17de : 8d 23 9f STA $9f23 
17e1 : a5 33 __ LDA P6 ; (z + 0)
17e3 : 0a __ __ ASL
17e4 : 0a __ __ ASL
17e5 : 8d 23 9f STA $9f23 
17e8 : a5 32 __ LDA P5 ; (h + 0)
17ea : 4a __ __ LSR
17eb : 6a __ __ ROR
17ec : 29 80 __ AND #$80
17ee : 6a __ __ ROR
17ef : 85 3b __ STA ACCU + 0 
17f1 : a5 31 __ LDA P4 ; (w + 0)
17f3 : 0a __ __ ASL
17f4 : 0a __ __ ASL
17f5 : 0a __ __ ASL
17f6 : 0a __ __ ASL
17f7 : 05 3b __ ORA ACCU + 0 
17f9 : 05 34 __ ORA P7 ; (pal + 0)
17fb : 8d 23 9f STA $9f23 
.s1001:
17fe : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
17ff : ad 25 9f LDA $9f25 
1802 : 29 fe __ AND #$fe
1804 : 8d 25 9f STA $9f25 
1807 : a5 2d __ LDA P0 ; (spr + 0)
1809 : 0a __ __ ASL
180a : 0a __ __ ASL
180b : 85 3b __ STA ACCU + 0 
180d : a9 3f __ LDA #$3f
180f : 2a __ __ ROL
1810 : 06 3b __ ASL ACCU + 0 
1812 : 2a __ __ ROL
1813 : aa __ __ TAX
1814 : a5 3b __ LDA ACCU + 0 
1816 : 09 02 __ ORA #$02
1818 : 8d 20 9f STA $9f20 
181b : 8e 21 9f STX $9f21 
181e : a9 11 __ LDA #$11
1820 : 8d 22 9f STA $9f22 
1823 : a5 2e __ LDA P1 ; (x + 0)
1825 : 8d 23 9f STA $9f23 
1828 : a5 2f __ LDA P2 ; (x + 1)
182a : 8d 23 9f STA $9f23 
182d : a5 30 __ LDA P3 ; (y + 0)
182f : 8d 23 9f STA $9f23 
1832 : a5 31 __ LDA P4 ; (y + 1)
1834 : 8d 23 9f STA $9f23 
.s1001:
1837 : 60 __ __ RTS
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
1838 : ad 25 9f LDA $9f25 
183b : 29 fe __ AND #$fe
183d : 8d 25 9f STA $9f25 
1840 : a5 2d __ LDA P0 ; (spr + 0)
1842 : 0a __ __ ASL
1843 : 0a __ __ ASL
1844 : 85 3b __ STA ACCU + 0 
1846 : a9 3f __ LDA #$3f
1848 : 2a __ __ ROL
1849 : 06 3b __ ASL ACCU + 0 
184b : 2a __ __ ROL
184c : aa __ __ TAX
184d : a5 3b __ LDA ACCU + 0 
184f : 09 06 __ ORA #$06
1851 : 8d 20 9f STA $9f20 
1854 : 8e 21 9f STX $9f21 
1857 : a9 01 __ LDA #$01
1859 : 8d 22 9f STA $9f22 
185c : ad 23 9f LDA $9f23 
185f : 29 fc __ AND #$fc
1861 : a8 __ __ TAY
1862 : a5 2e __ LDA P1 ; (fliph + 0)
1864 : f0 01 __ BEQ $1867 ; (vera_spr_flip.s14 + 0)
.s6:
1866 : c8 __ __ INY
.s14:
1867 : a5 2f __ LDA P2 ; (flipv + 0)
1869 : f0 05 __ BEQ $1870 ; (vera_spr_flip.s11 + 0)
.s9:
186b : 98 __ __ TYA
186c : 09 02 __ ORA #$02
186e : d0 01 __ BNE $1871 ; (vera_spr_flip.s1002 + 0)
.s11:
1870 : 98 __ __ TYA
.s1002:
1871 : 8d 23 9f STA $9f23 
.s1001:
1874 : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1875 : ad 25 9f LDA $9f25 
1878 : 29 fe __ AND #$fe
187a : 8d 25 9f STA $9f25 
187d : a5 2d __ LDA P0 ; (index + 0)
187f : 0a __ __ ASL
1880 : 8d 20 9f STA $9f20 
1883 : a9 7d __ LDA #$7d
1885 : 2a __ __ ROL
1886 : 8d 21 9f STA $9f21 
1889 : a9 11 __ LDA #$11
188b : 8d 22 9f STA $9f22 
188e : a5 30 __ LDA P3 ; (size + 0)
1890 : 05 31 __ ORA P4 ; (size + 1)
1892 : f0 29 __ BEQ $18bd ; (vera_pal_putn.s1001 + 0)
.s6:
1894 : a6 30 __ LDX P3 ; (size + 0)
1896 : f0 02 __ BEQ $189a ; (vera_pal_putn.l3 + 0)
.s1003:
1898 : e6 31 __ INC P4 ; (size + 1)
.l3:
189a : a0 01 __ LDY #$01
189c : b1 2e __ LDA (P1),y ; (color + 0)
189e : 85 3c __ STA ACCU + 1 
18a0 : 88 __ __ DEY
18a1 : b1 2e __ LDA (P1),y ; (color + 0)
18a3 : 8d 23 9f STA $9f23 
18a6 : a5 3c __ LDA ACCU + 1 
18a8 : 8d 23 9f STA $9f23 
18ab : 18 __ __ CLC
18ac : a5 2e __ LDA P1 ; (color + 0)
18ae : 69 02 __ ADC #$02
18b0 : 85 2e __ STA P1 ; (color + 0)
18b2 : 90 02 __ BCC $18b6 ; (vera_pal_putn.s1007 + 0)
.s1006:
18b4 : e6 2f __ INC P2 ; (color + 1)
.s1007:
18b6 : ca __ __ DEX
18b7 : d0 e1 __ BNE $189a ; (vera_pal_putn.l3 + 0)
.s1002:
18b9 : c6 31 __ DEC P4 ; (size + 1)
18bb : d0 dd __ BNE $189a ; (vera_pal_putn.l3 + 0)
.s1001:
18bd : 60 __ __ RTS
--------------------------------------------------------------------
palette:
253b : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
254b : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
255b : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
256b : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainPupil:
2900 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2910 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2920 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2930 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2940 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2950 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2960 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2970 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2980 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2990 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
29a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
29b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
29c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
29d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
29e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
29f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2a10 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2a30 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2a40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2a50 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2a60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2a70 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2a80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2a90 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2aa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2ab0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2ac0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2ad0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2ae0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2af0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2b00 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2b10 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2b20 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2b30 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2b40 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2b50 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2b60 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2b70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2b80 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2b90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2ba0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2bb0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2bc0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2bd0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2be0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2bf0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2c00 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2c10 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2c20 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2c30 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2c40 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2c50 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2c60 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2c70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2c80 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2c90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2ca0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2cb0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2cc0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2cd0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2ce0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2cf0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2d00 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2d10 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2d30 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2d40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2d50 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2d60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2d70 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2d80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2d90 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2da0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2db0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2dc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
2dd0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
2de0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2df0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
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
--------------------------------------------------------------------
CharBox:
3600 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3620 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3630 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3640 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3650 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3660 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3670 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3680 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3690 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
36a0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
36b0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
36c0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
36d0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
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
3810 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3820 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3830 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3840 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3850 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3860 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3870 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3880 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3890 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
38a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
38c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
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
3a10 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3a20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a30 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3a40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a50 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3a60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a70 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3a80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a90 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3aa0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ab0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
3ac0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ad0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
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
3c00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c10 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3c20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c30 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3c40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c50 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3c60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c70 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3c80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3c90 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ca0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cb0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3cc0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3cd0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
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
--------------------------------------------------------------------
WavyHead:
3e00 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
3e10 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3e20 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3e30 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3e40 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3e50 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3e60 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3e70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3e80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3e90 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3ea0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3eb0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3ec0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3ed0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3ee0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3ef0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3f00 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3f10 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3f20 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3f30 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3f40 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3f50 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3f60 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3f70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3f80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3f90 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3fa0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3fb0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3fc0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3fd0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3fe0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3ff0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
257b : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
258b : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
259b : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
25ab : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
25bb : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
25cb : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
25db : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
25eb : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
18be : ad fc 9e LDA $9efc ; (sstack + 0)
18c1 : 85 2d __ STA P0 
18c3 : ad fd 9e LDA $9efd ; (sstack + 1)
18c6 : 85 2e __ STA P1 
18c8 : ad fe 9e LDA $9efe ; (sstack + 2)
18cb : 85 2f __ STA P2 
18cd : ad ff 9e LDA $9eff ; (sstack + 3)
18d0 : 85 30 __ STA P3 
18d2 : a5 35 __ LDA P8 ; (input + 0)
18d4 : 85 31 __ STA P4 
18d6 : a5 36 __ LDA P9 ; (input + 1)
18d8 : 85 32 __ STA P5 
18da : a5 37 __ LDA P10 ; (inputsize + 0)
18dc : 85 33 __ STA P6 
18de : a9 00 __ LDA #$00
18e0 : 85 34 __ STA P7 
18e2 : 4c 40 17 JMP $1740 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
4000 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
4010 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
4020 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
4030 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
4040 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
4050 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
4060 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
406c : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
4078 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
4088 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
4098 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
40a8 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
40b8 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
EyeTri:
40c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
40e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
4102 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4112 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4122 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4132 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4142 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4152 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4162 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4172 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4182 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4192 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
41a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
41c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41d2 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
41e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41f2 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4202 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4212 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4222 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4232 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4242 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4252 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4262 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4272 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4282 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4292 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
42a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42b2 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
42c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
42d2 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
42e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
42f2 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
4302 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4312 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
4322 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4332 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4342 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4352 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4362 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4372 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4382 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4392 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
43a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
43b2 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
43c2 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
43d2 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
43e2 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
43f2 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
4402 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4412 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
4422 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4432 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4442 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4452 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4462 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4472 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4482 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4492 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
44a2 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
44b2 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
BGPal:
44c2 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
44d2 : __ __ __ BYT 99 09 9b 0f bb 0b ee 0f 44 04 ff 0f ff 0f ff 0f : ........D.......
--------------------------------------------------------------------
getchx:
.s0:
18e5 : 20 ef 18 JSR $18ef ; (getpch + 0)
18e8 : 85 3b __ STA ACCU + 0 
18ea : a9 00 __ LDA #$00
18ec : 85 3c __ STA ACCU + 1 
.s1001:
18ee : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
18ef : 20 e4 ff JSR $ffe4 
18f2 : ae fb 25 LDX $25fb ; (giocharmap + 0)
18f5 : e0 01 __ CPX #$01
18f7 : 90 26 __ BCC $191f ; (getpch + 48)
18f9 : c9 0d __ CMP #$0d
18fb : d0 02 __ BNE $18ff ; (getpch + 16)
18fd : a9 0a __ LDA #$0a
18ff : e0 02 __ CPX #$02
1901 : 90 1c __ BCC $191f ; (getpch + 48)
1903 : c9 db __ CMP #$db
1905 : b0 18 __ BCS $191f ; (getpch + 48)
1907 : c9 41 __ CMP #$41
1909 : 90 14 __ BCC $191f ; (getpch + 48)
190b : c9 c1 __ CMP #$c1
190d : 90 02 __ BCC $1911 ; (getpch + 34)
190f : 49 a0 __ EOR #$a0
1911 : c9 7b __ CMP #$7b
1913 : b0 0a __ BCS $191f ; (getpch + 48)
1915 : c9 61 __ CMP #$61
1917 : b0 04 __ BCS $191d ; (getpch + 46)
1919 : c9 5b __ CMP #$5b
191b : b0 02 __ BCS $191f ; (getpch + 48)
191d : 49 20 __ EOR #$20
191f : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
25fb : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
25fc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
25fe : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
44e2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
44e4 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1920 : a9 33 __ LDA #$33
1922 : 85 2d __ STA P0 
1924 : a9 38 __ LDA #$38
1926 : 85 2e __ STA P1 
1928 : a9 01 __ LDA #$01
192a : 85 2f __ STA P2 
192c : a6 32 __ LDX P5 ; (p + 0)
192e : bd 00 45 LDA $4500,x ; (sintab + 0)
1931 : 4a __ __ LSR
1932 : 4a __ __ LSR
1933 : 4a __ __ LSR
1934 : 49 10 __ EOR #$10
1936 : 38 __ __ SEC
1937 : e9 10 __ SBC #$10
1939 : 18 __ __ CLC
193a : 69 b4 __ ADC #$b4
193c : 85 30 __ STA P3 
193e : a9 00 __ LDA #$00
1940 : 85 31 __ STA P4 
1942 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1945 : a9 34 __ LDA #$34
1947 : 85 2d __ STA P0 
1949 : a9 20 __ LDA #$20
194b : 85 2e __ STA P1 
194d : a6 34 __ LDX P7 ; (p2 + 0)
194f : bd 00 45 LDA $4500,x ; (sintab + 0)
1952 : 4a __ __ LSR
1953 : 4a __ __ LSR
1954 : 4a __ __ LSR
1955 : 49 10 __ EOR #$10
1957 : 38 __ __ SEC
1958 : e9 10 __ SBC #$10
195a : 18 __ __ CLC
195b : 69 b4 __ ADC #$b4
195d : 85 30 __ STA P3 
195f : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1962 : a9 35 __ LDA #$35
1964 : 85 2d __ STA P0 
1966 : a9 00 __ LDA #$00
1968 : 85 2e __ STA P1 
196a : a6 36 __ LDX P9 ; (p3 + 0)
196c : bd 00 45 LDA $4500,x ; (sintab + 0)
196f : 4a __ __ LSR
1970 : 4a __ __ LSR
1971 : 4a __ __ LSR
1972 : 49 10 __ EOR #$10
1974 : 38 __ __ SEC
1975 : e9 10 __ SBC #$10
1977 : 18 __ __ CLC
1978 : 69 a4 __ ADC #$a4
197a : 85 30 __ STA P3 
197c : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
197f : a9 36 __ LDA #$36
1981 : 85 2d __ STA P0 
1983 : a9 40 __ LDA #$40
1985 : 85 2e __ STA P1 
1987 : a6 36 __ LDX P9 ; (p3 + 0)
1989 : bd 00 45 LDA $4500,x ; (sintab + 0)
198c : 4a __ __ LSR
198d : 4a __ __ LSR
198e : 4a __ __ LSR
198f : 49 10 __ EOR #$10
1991 : 38 __ __ SEC
1992 : e9 10 __ SBC #$10
1994 : 18 __ __ CLC
1995 : 69 a4 __ ADC #$a4
1997 : 85 30 __ STA P3 
1999 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
199c : a9 37 __ LDA #$37
199e : 85 2d __ STA P0 
19a0 : a9 00 __ LDA #$00
19a2 : 85 2e __ STA P1 
19a4 : a6 36 __ LDX P9 ; (p3 + 0)
19a6 : bd 00 45 LDA $4500,x ; (sintab + 0)
19a9 : 4a __ __ LSR
19aa : 4a __ __ LSR
19ab : 4a __ __ LSR
19ac : 49 10 __ EOR #$10
19ae : 38 __ __ SEC
19af : e9 10 __ SBC #$10
19b1 : 18 __ __ CLC
19b2 : 69 c4 __ ADC #$c4
19b4 : 85 30 __ STA P3 
19b6 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
19b9 : a9 38 __ LDA #$38
19bb : 85 2d __ STA P0 
19bd : a9 40 __ LDA #$40
19bf : 85 2e __ STA P1 
19c1 : a6 36 __ LDX P9 ; (p3 + 0)
19c3 : bd 00 45 LDA $4500,x ; (sintab + 0)
19c6 : 4a __ __ LSR
19c7 : 4a __ __ LSR
19c8 : 4a __ __ LSR
19c9 : 49 10 __ EOR #$10
19cb : 38 __ __ SEC
19cc : e9 10 __ SBC #$10
19ce : 18 __ __ CLC
19cf : 69 c4 __ ADC #$c4
19d1 : 85 30 __ STA P3 
19d3 : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
19d6 : a9 00 __ LDA #$00
19d8 : 85 47 __ STA T1 + 0 
19da : 18 __ __ CLC
.l2:
19db : a5 47 __ LDA T1 + 0 
19dd : 69 4f __ ADC #$4f
19df : 85 2d __ STA P0 
19e1 : a5 47 __ LDA T1 + 0 
19e3 : 0a __ __ ASL
19e4 : 65 47 __ ADC T1 + 0 
19e6 : 0a __ __ ASL
19e7 : 0a __ __ ASL
19e8 : 18 __ __ CLC
19e9 : 6d e6 44 ADC $44e6 ; (FrameCount + 0)
19ec : aa __ __ TAX
19ed : ac e7 44 LDY $44e7 ; (FrameCount + 1)
19f0 : bd 00 45 LDA $4500,x ; (sintab + 0)
19f3 : 10 01 __ BPL $19f6 ; (MoveSprites.s1008 + 0)
.s1007:
19f5 : 88 __ __ DEY
.s1008:
19f6 : 18 __ __ CLC
19f7 : 6d e6 44 ADC $44e6 ; (FrameCount + 0)
19fa : 85 48 __ STA T2 + 0 
19fc : 90 01 __ BCC $19ff ; (MoveSprites.s1009 + 0)
.s1006:
19fe : c8 __ __ INY
.s1009:
19ff : 84 49 __ STY T2 + 1 
1a01 : a5 47 __ LDA T1 + 0 
1a03 : 0a __ __ ASL
1a04 : 0a __ __ ASL
1a05 : 85 3b __ STA ACCU + 0 
1a07 : a9 00 __ LDA #$00
1a09 : 85 3c __ STA ACCU + 1 
1a0b : a9 80 __ LDA #$80
1a0d : 85 23 __ STA WORK + 0 
1a0f : a9 02 __ LDA #$02
1a11 : 85 24 __ STA WORK + 1 
1a13 : 20 a8 1e JSR $1ea8 ; (divmod + 0)
1a16 : 18 __ __ CLC
1a17 : a5 25 __ LDA WORK + 2 
1a19 : 65 48 __ ADC T2 + 0 
1a1b : 85 2e __ STA P1 
1a1d : a5 26 __ LDA WORK + 3 
1a1f : 65 49 __ ADC T2 + 1 
1a21 : 85 2f __ STA P2 
1a23 : a5 47 __ LDA T1 + 0 
1a25 : 0a __ __ ASL
1a26 : 0a __ __ ASL
1a27 : 65 47 __ ADC T1 + 0 
1a29 : 85 48 __ STA T2 + 0 
1a2b : ad e6 44 LDA $44e6 ; (FrameCount + 0)
1a2e : 38 __ __ SEC
1a2f : e9 40 __ SBC #$40
1a31 : 18 __ __ CLC
1a32 : 65 48 __ ADC T2 + 0 
1a34 : aa __ __ TAX
1a35 : bd 00 45 LDA $4500,x ; (sintab + 0)
1a38 : a8 __ __ TAY
1a39 : 29 80 __ AND #$80
1a3b : 10 02 __ BPL $1a3f ; (MoveSprites.s1009 + 64)
1a3d : a9 ff __ LDA #$ff
1a3f : 85 49 __ STA T2 + 1 
1a41 : a5 47 __ LDA T1 + 0 
1a43 : 0a __ __ ASL
1a44 : 0a __ __ ASL
1a45 : 0a __ __ ASL
1a46 : 85 3b __ STA ACCU + 0 
1a48 : ad e6 44 LDA $44e6 ; (FrameCount + 0)
1a4b : 38 __ __ SEC
1a4c : e9 20 __ SBC #$20
1a4e : 18 __ __ CLC
1a4f : 65 3b __ ADC ACCU + 0 
1a51 : aa __ __ TAX
1a52 : bd 00 45 LDA $4500,x ; (sintab + 0)
1a55 : 4a __ __ LSR
1a56 : 4a __ __ LSR
1a57 : 4a __ __ LSR
1a58 : 4a __ __ LSR
1a59 : 49 08 __ EOR #$08
1a5b : 38 __ __ SEC
1a5c : e9 08 __ SBC #$08
1a5e : 85 4a __ STA T3 + 0 
1a60 : a9 00 __ LDA #$00
1a62 : e9 00 __ SBC #$00
1a64 : 85 4b __ STA T3 + 1 
1a66 : a5 47 __ LDA T1 + 0 
1a68 : 0a __ __ ASL
1a69 : 65 47 __ ADC T1 + 0 
1a6b : 85 3b __ STA ACCU + 0 
1a6d : a5 47 __ LDA T1 + 0 
1a6f : c9 1f __ CMP #$1f
1a71 : f0 27 __ BEQ $1a9a ; (MoveSprites.s5 + 0)
.s6:
1a73 : 98 __ __ TYA
1a74 : 18 __ __ CLC
1a75 : 69 80 __ ADC #$80
1a77 : 18 __ __ CLC
1a78 : 65 4a __ ADC T3 + 0 
1a7a : a8 __ __ TAY
1a7b : a9 00 __ LDA #$00
1a7d : 65 4b __ ADC T3 + 1 
1a7f : aa __ __ TAX
1a80 : 98 __ __ TYA
1a81 : 18 __ __ CLC
1a82 : 65 3b __ ADC ACCU + 0 
1a84 : 85 30 __ STA P3 
1a86 : 90 01 __ BCC $1a89 ; (MoveSprites.s1013 + 0)
.s1012:
1a88 : e8 __ __ INX
.s1013:
1a89 : 86 31 __ STX P4 
1a8b : 20 ff 17 JSR $17ff ; (vera_spr_move.s0 + 0)
1a8e : e6 47 __ INC T1 + 0 
1a90 : a5 47 __ LDA T1 + 0 
1a92 : c9 20 __ CMP #$20
1a94 : b0 03 __ BCS $1a99 ; (MoveSprites.s1001 + 0)
1a96 : 4c db 19 JMP $19db ; (MoveSprites.l2 + 0)
.s1001:
1a99 : 60 __ __ RTS
.s5:
1a9a : 98 __ __ TYA
1a9b : 18 __ __ CLC
1a9c : 69 78 __ ADC #$78
1a9e : a8 __ __ TAY
1a9f : a5 49 __ LDA T2 + 1 
1aa1 : 69 00 __ ADC #$00
1aa3 : aa __ __ TAX
1aa4 : 98 __ __ TYA
1aa5 : 18 __ __ CLC
1aa6 : 65 4a __ ADC T3 + 0 
1aa8 : a8 __ __ TAY
1aa9 : 8a __ __ TXA
1aaa : 65 4b __ ADC T3 + 1 
1aac : aa __ __ TAX
1aad : 98 __ __ TYA
1aae : 18 __ __ CLC
1aaf : 65 3b __ ADC ACCU + 0 
1ab1 : 85 30 __ STA P3 
1ab3 : 90 01 __ BCC $1ab6 ; (MoveSprites.s1011 + 0)
.s1010:
1ab5 : e8 __ __ INX
.s1011:
1ab6 : 86 31 __ STX P4 
1ab8 : 4c ff 17 JMP $17ff ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4500 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4510 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4520 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4530 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4540 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4550 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4560 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4570 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4580 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4590 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
45a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
45b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
45c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
45d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
45e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
45f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
44e6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1abb : a9 08 __ LDA #$08
1abd : 8d 2c 9f STA $9f2c 
1ac0 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1ac2 : c5 35 __ CMP P8 ; (LastSong + 1)
1ac4 : d0 0d __ BNE $1ad3 ; (PlayZSM.s1 + 0)
.s1005:
1ac6 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1ac8 : c5 34 __ CMP P7 ; (LastSong + 0)
1aca : d0 07 __ BNE $1ad3 ; (PlayZSM.s1 + 0)
.s4:
1acc : 20 ff 1a JSR $1aff ; (zsm_check.s0 + 0)
1acf : 09 00 __ ORA #$00
1ad1 : f0 20 __ BEQ $1af3 ; (PlayZSM.s1001 + 0)
.s1:
1ad3 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1ad5 : d0 1c __ BNE $1af3 ; (PlayZSM.s1001 + 0)
.s1004:
1ad7 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1ad9 : c9 01 __ CMP #$01
1adb : d0 07 __ BNE $1ae4 ; (PlayZSM.s1003 + 0)
.s6:
1add : a9 1c __ LDA #$1c
1adf : a0 c2 __ LDY #$c2
1ae1 : 4c f8 1a JMP $1af8 ; (PlayZSM.s18 + 0)
.s1003:
1ae4 : c9 02 __ CMP #$02
1ae6 : d0 07 __ BNE $1aef ; (PlayZSM.s1002 + 0)
.s8:
1ae8 : a9 1d __ LDA #$1d
1aea : a0 00 __ LDY #$00
1aec : 4c f8 1a JMP $1af8 ; (PlayZSM.s18 + 0)
.s1002:
1aef : c9 03 __ CMP #$03
1af1 : f0 01 __ BEQ $1af4 ; (PlayZSM.s10 + 0)
.s1001:
1af3 : 60 __ __ RTS
.s10:
1af4 : a9 1d __ LDA #$1d
1af6 : a0 25 __ LDY #$25
.s18:
1af8 : 84 30 __ STY P3 
1afa : 85 31 __ STA P4 
1afc : 4c 03 1b JMP $1b03 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1aff : ad 57 1f LDA $1f57 ; (zsm_finished + 0)
.s1001:
1b02 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1b03 : a9 01 __ LDA #$01
1b05 : 8d 57 1f STA $1f57 ; (zsm_finished + 0)
1b08 : ad e8 44 LDA $44e8 ; (zsm_reading + 0)
1b0b : f0 0a __ BEQ $1b17 ; (zsm_init.s3 + 0)
.s1:
1b0d : a9 02 __ LDA #$02
1b0f : 20 64 1b JSR $1b64 ; (krnio_close.s1000 + 0)
1b12 : a9 00 __ LDA #$00
1b14 : 8d e8 44 STA $44e8 ; (zsm_reading + 0)
.s3:
1b17 : 20 6c 1b JSR $1b6c ; (zsm_silence.s0 + 0)
1b1a : 20 84 1b JSR $1b84 ; (zsm_save_volume.s0 + 0)
1b1d : a9 00 __ LDA #$00
1b1f : 8d f5 44 STA $44f5 ; (zsm_pos + 0)
1b22 : 8d f6 44 STA $44f6 ; (zsm_pos + 1)
1b25 : 8d f7 44 STA $44f7 ; (zsm_wpos + 0)
1b28 : 8d f8 44 STA $44f8 ; (zsm_wpos + 1)
1b2b : 8d f4 44 STA $44f4 ; (zsm_delay + 0)
1b2e : a5 30 __ LDA P3 ; (fname + 0)
1b30 : 85 2d __ STA P0 
1b32 : a5 31 __ LDA P4 ; (fname + 1)
1b34 : 85 2e __ STA P1 
1b36 : 20 b6 1b JSR $1bb6 ; (krnio_setnam.s0 + 0)
1b39 : a9 02 __ LDA #$02
1b3b : 85 2d __ STA P0 
1b3d : 85 2f __ STA P2 
1b3f : a9 08 __ LDA #$08
1b41 : 85 2e __ STA P1 
1b43 : 20 cc 1b JSR $1bcc ; (krnio_open.s0 + 0)
1b46 : a5 3b __ LDA ACCU + 0 
1b48 : f0 19 __ BEQ $1b63 ; (zsm_init.s1001 + 0)
.s4:
1b4a : a9 01 __ LDA #$01
1b4c : 8d e8 44 STA $44e8 ; (zsm_reading + 0)
1b4f : 20 f4 1b JSR $1bf4 ; (zsm_fill.s0 + 0)
1b52 : a9 10 __ LDA #$10
1b54 : 8d f5 44 STA $44f5 ; (zsm_pos + 0)
1b57 : a9 00 __ LDA #$00
1b59 : 8d f6 44 STA $44f6 ; (zsm_pos + 1)
1b5c : 8d 57 1f STA $1f57 ; (zsm_finished + 0)
1b5f : a9 01 __ LDA #$01
1b61 : 85 3b __ STA ACCU + 0 
.s1001:
1b63 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
44e8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
1b64 : 85 2d __ STA P0 
.s0:
1b66 : a5 2d __ LDA P0 
1b68 : 20 c3 ff JSR $ffc3 
.s1001:
1b6b : 60 __ __ RTS
--------------------------------------------------------------------
zsm_silence:
.s0:
1b6c : a9 00 __ LDA #$00
1b6e : 85 47 __ STA T0 + 0 
1b70 : a9 08 __ LDA #$08
1b72 : 85 2d __ STA P0 
1b74 : a9 00 __ LDA #$00
.l1006:
1b76 : 85 2e __ STA P1 
1b78 : 20 9e 0d JSR $0d9e ; (sfx_put.l1 + 0)
1b7b : e6 47 __ INC T0 + 0 
1b7d : a5 47 __ LDA T0 + 0 
1b7f : c9 08 __ CMP #$08
1b81 : 90 f3 __ BCC $1b76 ; (zsm_silence.l1006 + 0)
.s1001:
1b83 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1b84 : a0 00 __ LDY #$00
1b86 : 84 3c __ STY ACCU + 1 
1b88 : a2 02 __ LDX #$02
1b8a : 18 __ __ CLC
.l1006:
1b8b : 8a __ __ TXA
1b8c : 09 c0 __ ORA #$c0
1b8e : 8d 20 9f STA $9f20 
1b91 : a5 3c __ LDA ACCU + 1 
1b93 : 09 f9 __ ORA #$f9
1b95 : 8d 21 9f STA $9f21 
1b98 : a9 01 __ LDA #$01
1b9a : 8d 22 9f STA $9f22 
1b9d : ad 23 9f LDA $9f23 
1ba0 : 99 e7 54 STA $54e7,y ; (vera_volumes + 0)
1ba3 : a9 00 __ LDA #$00
1ba5 : 8d 23 9f STA $9f23 
1ba8 : 8a __ __ TXA
1ba9 : 69 04 __ ADC #$04
1bab : aa __ __ TAX
1bac : 90 02 __ BCC $1bb0 ; (zsm_save_volume.s1009 + 0)
.s1008:
1bae : e6 3c __ INC ACCU + 1 
.s1009:
1bb0 : c8 __ __ INY
1bb1 : c0 10 __ CPY #$10
1bb3 : 90 d6 __ BCC $1b8b ; (zsm_save_volume.l1006 + 0)
.s1001:
1bb5 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
54e7 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
44f7 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1bb6 : a5 2d __ LDA P0 
1bb8 : 05 2e __ ORA P1 
1bba : f0 08 __ BEQ $1bc4 ; (krnio_setnam.s0 + 14)
1bbc : a0 ff __ LDY #$ff
1bbe : c8 __ __ INY
1bbf : b1 2d __ LDA (P0),y 
1bc1 : d0 fb __ BNE $1bbe ; (krnio_setnam.s0 + 8)
1bc3 : 98 __ __ TYA
1bc4 : a6 2d __ LDX P0 
1bc6 : a4 2e __ LDY P1 
1bc8 : 20 bd ff JSR $ffbd 
.s1001:
1bcb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1bcc : a9 00 __ LDA #$00
1bce : a6 2d __ LDX P0 ; (fnum + 0)
1bd0 : 9d c4 59 STA $59c4,x ; (krnio_pstatus + 0)
1bd3 : a9 00 __ LDA #$00
1bd5 : 85 3b __ STA ACCU + 0 
1bd7 : 85 3c __ STA ACCU + 1 
1bd9 : a5 2d __ LDA P0 ; (fnum + 0)
1bdb : a6 2e __ LDX P1 
1bdd : a4 2f __ LDY P2 
1bdf : 20 ba ff JSR $ffba 
1be2 : 20 c0 ff JSR $ffc0 
1be5 : 90 08 __ BCC $1bef ; (krnio_open.s0 + 35)
1be7 : a5 2d __ LDA P0 ; (fnum + 0)
1be9 : 20 c3 ff JSR $ffc3 
1bec : 4c f3 1b JMP $1bf3 ; (krnio_open.s1001 + 0)
1bef : a9 01 __ LDA #$01
1bf1 : 85 3b __ STA ACCU + 0 
.s1001:
1bf3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
59c4 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1bf4 : ad e8 44 LDA $44e8 ; (zsm_reading + 0)
1bf7 : f0 20 __ BEQ $1c19 ; (zsm_fill.s1 + 0)
.s2:
1bf9 : ad f6 44 LDA $44f6 ; (zsm_pos + 1)
1bfc : 18 __ __ CLC
1bfd : 69 04 __ ADC #$04
1bff : cd f8 44 CMP $44f8 ; (zsm_wpos + 1)
1c02 : d0 0c __ BNE $1c10 ; (zsm_fill.s6 + 0)
.s1006:
1c04 : ad f7 44 LDA $44f7 ; (zsm_wpos + 0)
1c07 : cd f5 44 CMP $44f5 ; (zsm_pos + 0)
1c0a : d0 04 __ BNE $1c10 ; (zsm_fill.s6 + 0)
.s5:
1c0c : a9 00 __ LDA #$00
1c0e : f0 0b __ BEQ $1c1b ; (zsm_fill.s1008 + 0)
.s6:
1c10 : a9 02 __ LDA #$02
1c12 : 20 98 1c JSR $1c98 ; (krnio_chkin.s1000 + 0)
1c15 : a5 3b __ LDA ACCU + 0 
1c17 : d0 07 __ BNE $1c20 ; (zsm_fill.s9 + 0)
.s1:
1c19 : a9 ff __ LDA #$ff
.s1008:
1c1b : 85 3b __ STA ACCU + 0 
.s1001:
1c1d : 85 3c __ STA ACCU + 1 
1c1f : 60 __ __ RTS
.s9:
1c20 : a9 00 __ LDA #$00
1c22 : 85 47 __ STA T1 + 0 
1c24 : 85 48 __ STA T1 + 1 
1c26 : ad f6 44 LDA $44f6 ; (zsm_pos + 1)
1c29 : 18 __ __ CLC
1c2a : 69 04 __ ADC #$04
1c2c : cd f8 44 CMP $44f8 ; (zsm_wpos + 1)
1c2f : d0 08 __ BNE $1c39 ; (zsm_fill.l13 + 0)
.s1002:
1c31 : ad f7 44 LDA $44f7 ; (zsm_wpos + 0)
1c34 : cd f5 44 CMP $44f5 ; (zsm_pos + 0)
1c37 : f0 49 __ BEQ $1c82 ; (zsm_fill.s38 + 0)
.l13:
1c39 : 20 aa 1c JSR $1caa ; (krnio_chrin.s0 + 0)
1c3c : ad f7 44 LDA $44f7 ; (zsm_wpos + 0)
1c3f : aa __ __ TAX
1c40 : 18 __ __ CLC
1c41 : 69 01 __ ADC #$01
1c43 : 8d f7 44 STA $44f7 ; (zsm_wpos + 0)
1c46 : ad f8 44 LDA $44f8 ; (zsm_wpos + 1)
1c49 : a8 __ __ TAY
1c4a : 69 00 __ ADC #$00
1c4c : 8d f8 44 STA $44f8 ; (zsm_wpos + 1)
1c4f : 8a __ __ TXA
1c50 : 18 __ __ CLC
1c51 : 69 c4 __ ADC #$c4
1c53 : 85 49 __ STA T3 + 0 
1c55 : 98 __ __ TYA
1c56 : 29 03 __ AND #$03
1c58 : 69 55 __ ADC #$55
1c5a : 85 4a __ STA T3 + 1 
1c5c : a5 3b __ LDA ACCU + 0 
1c5e : a0 00 __ LDY #$00
1c60 : 91 49 __ STA (T3 + 0),y 
1c62 : e6 47 __ INC T1 + 0 
1c64 : d0 02 __ BNE $1c68 ; (zsm_fill.s1010 + 0)
.s1009:
1c66 : e6 48 __ INC T1 + 1 
.s1010:
1c68 : 20 b4 1c JSR $1cb4 ; (krnio_status.s0 + 0)
1c6b : a5 3b __ LDA ACCU + 0 
1c6d : d0 0e __ BNE $1c7d ; (zsm_fill.s15 + 0)
.s12:
1c6f : ad f6 44 LDA $44f6 ; (zsm_pos + 1)
1c72 : 18 __ __ CLC
1c73 : 69 04 __ ADC #$04
1c75 : cd f8 44 CMP $44f8 ; (zsm_wpos + 1)
1c78 : d0 bf __ BNE $1c39 ; (zsm_fill.l13 + 0)
1c7a : 4c 31 1c JMP $1c31 ; (zsm_fill.s1002 + 0)
.s15:
1c7d : a9 00 __ LDA #$00
1c7f : 8d e8 44 STA $44e8 ; (zsm_reading + 0)
.s38:
1c82 : 20 be 1c JSR $1cbe ; (krnio_clrchn.s0 + 0)
1c85 : ad e8 44 LDA $44e8 ; (zsm_reading + 0)
1c88 : d0 05 __ BNE $1c8f ; (zsm_fill.s21 + 0)
.s19:
1c8a : a9 02 __ LDA #$02
1c8c : 20 64 1b JSR $1b64 ; (krnio_close.s1000 + 0)
.s21:
1c8f : a5 47 __ LDA T1 + 0 
1c91 : 85 3b __ STA ACCU + 0 
1c93 : a5 48 __ LDA T1 + 1 
1c95 : 4c 1d 1c JMP $1c1d ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1c98 : 85 2d __ STA P0 
.s0:
1c9a : a6 2d __ LDX P0 
1c9c : 20 c6 ff JSR $ffc6 
1c9f : a9 00 __ LDA #$00
1ca1 : 85 3c __ STA ACCU + 1 
1ca3 : b0 02 __ BCS $1ca7 ; (krnio_chkin.s0 + 13)
1ca5 : a9 01 __ LDA #$01
1ca7 : 85 3b __ STA ACCU + 0 
.s1001:
1ca9 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1caa : 20 cf ff JSR $ffcf 
1cad : 85 3b __ STA ACCU + 0 
1caf : a9 00 __ LDA #$00
1cb1 : 85 3c __ STA ACCU + 1 
.s1001:
1cb3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1cb4 : 20 b7 ff JSR $ffb7 
1cb7 : 85 3b __ STA ACCU + 0 
1cb9 : a9 00 __ LDA #$00
1cbb : 85 3c __ STA ACCU + 1 
.s1001:
1cbd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1cbe : 20 cc ff JSR $ffcc 
.s1001:
1cc1 : 60 __ __ RTS
--------------------------------------------------------------------
1cc2 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1cd2 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1d00 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1d10 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1d20 : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
1d25 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1d35 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
1d45 : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
LastSelectedSong:
44e9 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
44ea : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
4600 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
4610 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1d4c : a9 10 __ LDA #$10
1d4e : 85 30 __ STA P3 
1d50 : a9 00 __ LDA #$00
1d52 : 85 31 __ STA P4 
1d54 : a5 32 __ LDA P5 ; (Palette + 0)
1d56 : 85 2e __ STA P1 
1d58 : 85 47 __ STA T0 + 0 
1d5a : a5 33 __ LDA P6 ; (Palette + 1)
1d5c : 85 2f __ STA P2 
1d5e : 85 48 __ STA T0 + 1 
1d60 : a5 34 __ LDA P7 ; (index + 0)
1d62 : 85 2d __ STA P0 
1d64 : ad fc 9e LDA $9efc ; (sstack + 0)
1d67 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1d69 : 0a __ __ ASL
1d6a : 85 49 __ STA T3 + 0 
1d6c : ad fd 9e LDA $9efd ; (sstack + 1)
1d6f : 2a __ __ ROL
1d70 : 18 __ __ CLC
1d71 : 65 33 __ ADC P6 ; (Palette + 1)
1d73 : 85 4a __ STA T3 + 1 
1d75 : a4 32 __ LDY P5 ; (Palette + 0)
1d77 : b1 49 __ LDA (T3 + 0),y 
1d79 : aa __ __ TAX
1d7a : c8 __ __ INY
1d7b : b1 49 __ LDA (T3 + 0),y 
1d7d : 86 49 __ STX T3 + 0 
1d7f : 85 4a __ STA T3 + 1 
1d81 : a9 00 __ LDA #$00
1d83 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1d85 : ad fe 9e LDA $9efe ; (sstack + 2)
1d88 : 85 4b __ STA T5 + 0 
1d8a : 38 __ __ SEC
1d8b : e9 01 __ SBC #$01
1d8d : 85 4d __ STA T6 + 0 
1d8f : ad ff 9e LDA $9eff ; (sstack + 3)
1d92 : 85 4c __ STA T5 + 1 
1d94 : e9 00 __ SBC #$00
1d96 : 85 4e __ STA T6 + 1 
1d98 : d0 06 __ BNE $1da0 ; (SetPaletteIndex.s5 + 0)
.s1004:
1d9a : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1d9c : c5 4d __ CMP T6 + 0 
1d9e : b0 38 __ BCS $1dd8 ; (SetPaletteIndex.s4 + 0)
.s5:
1da0 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1da2 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1da4 : 18 __ __ CLC
1da5 : a5 32 __ LDA P5 ; (Palette + 0)
1da7 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1da9 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1dab : a5 33 __ LDA P6 ; (Palette + 1)
1dad : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1daf : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1db1 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1db4 : a0 02 __ LDY #$02
1db6 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1db8 : a0 00 __ LDY #$00
1dba : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1dbc : a0 03 __ LDY #$03
1dbe : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1dc0 : a0 01 __ LDY #$01
1dc2 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1dc4 : 18 __ __ CLC
1dc5 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1dc7 : 69 02 __ ADC #$02
1dc9 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1dcb : 90 02 __ BCC $1dcf ; (SetPaletteIndex.s1008 + 0)
.s1007:
1dcd : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1dcf : e8 __ __ INX
1dd0 : a5 4e __ LDA T6 + 1 
1dd2 : d0 e0 __ BNE $1db4 ; (SetPaletteIndex.l2 + 0)
.s1002:
1dd4 : e4 4d __ CPX T6 + 0 
1dd6 : 90 dc __ BCC $1db4 ; (SetPaletteIndex.l2 + 0)
.s4:
1dd8 : a5 4b __ LDA T5 + 0 
1dda : 0a __ __ ASL
1ddb : aa __ __ TAX
1ddc : a5 4c __ LDA T5 + 1 
1dde : 2a __ __ ROL
1ddf : a8 __ __ TAY
1de0 : 8a __ __ TXA
1de1 : 38 __ __ SEC
1de2 : e9 02 __ SBC #$02
1de4 : b0 01 __ BCS $1de7 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1de6 : 88 __ __ DEY
.s1010:
1de7 : 18 __ __ CLC
1de8 : 65 47 __ ADC T0 + 0 
1dea : 85 47 __ STA T0 + 0 
1dec : 98 __ __ TYA
1ded : 65 48 __ ADC T0 + 1 
1def : 85 48 __ STA T0 + 1 
1df1 : a5 49 __ LDA T3 + 0 
1df3 : a0 00 __ LDY #$00
1df5 : 91 47 __ STA (T0 + 0),y 
1df7 : a5 4a __ LDA T3 + 1 
1df9 : c8 __ __ INY
1dfa : 91 47 __ STA (T0 + 0),y 
1dfc : 4c 75 18 JMP $1875 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
44ec : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4620 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4630 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
44ee : __ __ __ BYT 03                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
1dff : ad 25 9f LDA $9f25 
1e02 : 29 fe __ AND #$fe
1e04 : 8d 25 9f STA $9f25 
1e07 : a9 00 __ LDA #$00
1e09 : 8d 20 9f STA $9f20 
1e0c : a9 b0 __ LDA #$b0
1e0e : 8d 21 9f STA $9f21 
1e11 : a9 11 __ LDA #$11
1e13 : 8d 22 9f STA $9f22 
1e16 : a2 80 __ LDX #$80
1e18 : a9 00 __ LDA #$00
.l1002:
1e1a : 8d 23 9f STA $9f23 
1e1d : 8d 23 9f STA $9f23 
1e20 : ca __ __ DEX
1e21 : d0 f7 __ BNE $1e1a ; (ResetChars.l1002 + 0)
.s1001:
1e23 : 60 __ __ RTS
--------------------------------------------------------------------
off1:
44ef : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
1e24 : a5 31 __ LDA P4 ; (Input + 0)
1e26 : c9 20 __ CMP #$20
1e28 : d0 1c __ BNE $1e46 ; (Control.s1007 + 0)
.s1:
1e2a : a5 30 __ LDA P3 ; (playing + 0)
1e2c : d0 0a __ BNE $1e38 ; (Control.s4 + 0)
.s5:
1e2e : a9 01 __ LDA #$01
1e30 : 20 e0 1c JSR $1ce0 ; (zsm_irq_play.s0 + 0)
1e33 : a9 01 __ LDA #$01
.s1001:
1e35 : 85 3b __ STA ACCU + 0 
1e37 : 60 __ __ RTS
.s4:
1e38 : a9 00 __ LDA #$00
1e3a : cd f1 44 CMP $44f1 ; (paused + 0)
1e3d : 2a __ __ ROL
1e3e : 8d f1 44 STA $44f1 ; (paused + 0)
1e41 : 85 2f __ STA P2 
1e43 : 20 4b 1e JSR $1e4b ; (zsm_pause.s0 + 0)
.s1007:
1e46 : a5 30 __ LDA P3 ; (playing + 0)
1e48 : 4c 35 1e JMP $1e35 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
44f1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1e4b : a5 2f __ LDA P2 ; (pause + 0)
1e4d : d0 0e __ BNE $1e5d ; (zsm_pause.s4 + 0)
.s8:
1e4f : ad 58 1f LDA $1f58 ; (zsm_paused + 0)
1e52 : f0 08 __ BEQ $1e5c ; (zsm_pause.s1001 + 0)
.s5:
1e54 : 20 6d 1e JSR $1e6d ; (zsm_restore_volume.s0 + 0)
1e57 : a9 00 __ LDA #$00
1e59 : 8d 58 1f STA $1f58 ; (zsm_paused + 0)
.s1001:
1e5c : 60 __ __ RTS
.s4:
1e5d : ad 58 1f LDA $1f58 ; (zsm_paused + 0)
1e60 : d0 fa __ BNE $1e5c ; (zsm_pause.s1001 + 0)
.s1:
1e62 : a9 01 __ LDA #$01
1e64 : 8d 58 1f STA $1f58 ; (zsm_paused + 0)
1e67 : 20 6c 1b JSR $1b6c ; (zsm_silence.s0 + 0)
1e6a : 4c 84 1b JMP $1b84 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1e6d : a0 00 __ LDY #$00
1e6f : 84 3c __ STY ACCU + 1 
1e71 : a2 02 __ LDX #$02
1e73 : 18 __ __ CLC
.l1006:
1e74 : 8a __ __ TXA
1e75 : 09 c0 __ ORA #$c0
1e77 : 8d 20 9f STA $9f20 
1e7a : a5 3c __ LDA ACCU + 1 
1e7c : 09 f9 __ ORA #$f9
1e7e : 8d 21 9f STA $9f21 
1e81 : a9 01 __ LDA #$01
1e83 : 8d 22 9f STA $9f22 
1e86 : b9 e7 54 LDA $54e7,y ; (vera_volumes + 0)
1e89 : 8d 23 9f STA $9f23 
1e8c : 8a __ __ TXA
1e8d : 69 04 __ ADC #$04
1e8f : aa __ __ TAX
1e90 : 90 02 __ BCC $1e94 ; (zsm_restore_volume.s1009 + 0)
.s1008:
1e92 : e6 3c __ INC ACCU + 1 
.s1009:
1e94 : c8 __ __ INY
1e95 : c0 10 __ CPY #$10
1e97 : 90 db __ BCC $1e74 ; (zsm_restore_volume.l1006 + 0)
.s1001:
1e99 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1ce0 : 8d 56 1f STA $1f56 ; (zsm_playing + 0)
.s1001:
1ce3 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4640 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4650 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4660 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4670 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4680 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4690 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
46a0 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
46b0 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
46c0 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
46d0 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
46e0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
46f0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
4700 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
4710 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
4720 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
4730 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4740 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4750 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4760 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4770 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4780 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4790 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
47a0 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
47b0 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
47c0 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
47d0 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
47e0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
47f0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4800 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4810 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4820 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4830 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4840 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4850 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4860 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4870 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4880 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4890 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
48a0 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
48b0 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
48c0 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
48d0 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
48e0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
48f0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4900 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4910 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4920 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4930 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4940 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4950 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4960 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4970 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4980 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4990 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
49a0 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
49b0 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
49c0 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
49d0 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
49e0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
49f0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4a00 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4a10 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4a20 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4a30 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4a40 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4a50 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4a60 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4a70 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4a80 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4a90 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4aa0 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4ab0 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4ac0 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4ad0 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4ae0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4af0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4b00 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4b10 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4b20 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4b30 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4b40 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4b50 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4b60 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4b70 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4b80 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4b90 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4ba0 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4bb0 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4bc0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4bd0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4be0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4bf0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c00 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c10 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c20 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c30 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c40 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c50 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c60 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c70 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c80 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c90 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ca0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4cb0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 20 3d 20 3d 20 : MNMNMNMNMNM = = 
4cc0 : __ __ __ BYT 2d 20 2d 00                                     : - -.
--------------------------------------------------------------------
Song1:
4cc4 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4cd4 : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4ce4 : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4cf4 : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4d04 : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4d14 : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4d24 : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4d34 : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
4d44 : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
4d54 : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
4d64 : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
4d74 : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
4d84 : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
4d94 : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
4da4 : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
4db4 : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
4dc4 : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
4dd4 : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
4de4 : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
4df4 : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
4e04 : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
4e14 : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
4e24 : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
4e34 : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
4e44 : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
4e54 : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
4e64 : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
4e74 : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
4e84 : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
4e94 : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
4ea4 : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
4eb4 : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
4ec4 : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
4ed4 : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
4ee4 : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
4ef4 : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
4f04 : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
4f14 : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
4f24 : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
4f34 : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
4f44 : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
4f54 : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
4f64 : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
4f74 : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
4f84 : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
4f94 : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
4fa4 : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
4fb4 : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
4fc4 : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
4fd4 : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
4fe4 : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
4ff4 : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
5004 : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
5014 : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
5024 : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
5034 : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
5044 : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
5054 : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
5064 : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
5074 : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
5084 : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
5094 : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
50a4 : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
50b4 : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
50c4 : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
50d4 : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
50e4 : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
50f4 : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
5104 : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
5114 : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
5124 : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
5134 : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
5144 : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
5154 : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
5164 : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
5174 : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
5184 : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
5194 : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
51a4 : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
51b4 : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
51c4 : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
51d4 : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
51e4 : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
51f4 : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
5204 : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
5214 : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
5224 : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
5234 : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
5244 : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
5254 : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
5264 : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
5274 : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
5284 : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
5294 : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
52a4 : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
52b4 : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
52c4 : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
52d4 : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
52e4 : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
52f4 : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
5304 : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
5314 : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
5324 : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
5334 : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
5344 : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
5354 : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
5364 : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
5374 : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
5384 : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
5394 : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
53a4 : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
53b4 : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
53c4 : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
53d4 : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
53e4 : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
53f4 : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
5404 : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
5414 : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5421 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5431 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5441 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5451 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5461 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5471 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5481 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5491 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
54a1 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
54b1 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
54c1 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
54d1 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
54e1 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5500 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5510 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5520 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5530 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5540 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5550 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5560 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5570 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5580 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5590 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
55a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
55b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
55c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
frame_wait:
.l1:
1ce4 : ad 26 9f LDA $9f26 
1ce7 : 0a __ __ ASL
1ce8 : 30 fa __ BMI $1ce4 ; (frame_wait.l1 + 0)
.l4:
1cea : ad 26 9f LDA $9f26 
1ced : 0a __ __ ASL
1cee : 10 fa __ BPL $1cea ; (frame_wait.l4 + 0)
.s1001:
1cf0 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1cf1 : 38 __ __ SEC
1cf2 : a9 00 __ LDA #$00
1cf4 : e5 3b __ SBC ACCU + 0 
1cf6 : 85 3b __ STA ACCU + 0 
1cf8 : a9 00 __ LDA #$00
1cfa : e5 3c __ SBC ACCU + 1 
1cfc : 85 3c __ STA ACCU + 1 
1cfe : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1e9a : 38 __ __ SEC
1e9b : a9 00 __ LDA #$00
1e9d : e5 23 __ SBC WORK + 0 
1e9f : 85 23 __ STA WORK + 0 
1ea1 : a9 00 __ LDA #$00
1ea3 : e5 24 __ SBC WORK + 1 
1ea5 : 85 24 __ STA WORK + 1 
1ea7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1ea8 : a5 3c __ LDA ACCU + 1 
1eaa : d0 31 __ BNE $1edd ; (divmod + 53)
1eac : a5 24 __ LDA WORK + 1 
1eae : d0 1e __ BNE $1ece ; (divmod + 38)
1eb0 : 85 26 __ STA WORK + 3 
1eb2 : a2 04 __ LDX #$04
1eb4 : 06 3b __ ASL ACCU + 0 
1eb6 : 2a __ __ ROL
1eb7 : c5 23 __ CMP WORK + 0 
1eb9 : 90 02 __ BCC $1ebd ; (divmod + 21)
1ebb : e5 23 __ SBC WORK + 0 
1ebd : 26 3b __ ROL ACCU + 0 
1ebf : 2a __ __ ROL
1ec0 : c5 23 __ CMP WORK + 0 
1ec2 : 90 02 __ BCC $1ec6 ; (divmod + 30)
1ec4 : e5 23 __ SBC WORK + 0 
1ec6 : 26 3b __ ROL ACCU + 0 
1ec8 : ca __ __ DEX
1ec9 : d0 eb __ BNE $1eb6 ; (divmod + 14)
1ecb : 85 25 __ STA WORK + 2 
1ecd : 60 __ __ RTS
1ece : a5 3b __ LDA ACCU + 0 
1ed0 : 85 25 __ STA WORK + 2 
1ed2 : a5 3c __ LDA ACCU + 1 
1ed4 : 85 26 __ STA WORK + 3 
1ed6 : a9 00 __ LDA #$00
1ed8 : 85 3b __ STA ACCU + 0 
1eda : 85 3c __ STA ACCU + 1 
1edc : 60 __ __ RTS
1edd : a5 24 __ LDA WORK + 1 
1edf : d0 1f __ BNE $1f00 ; (divmod + 88)
1ee1 : a5 23 __ LDA WORK + 0 
1ee3 : 30 1b __ BMI $1f00 ; (divmod + 88)
1ee5 : a9 00 __ LDA #$00
1ee7 : 85 26 __ STA WORK + 3 
1ee9 : a2 10 __ LDX #$10
1eeb : 06 3b __ ASL ACCU + 0 
1eed : 26 3c __ ROL ACCU + 1 
1eef : 2a __ __ ROL
1ef0 : c5 23 __ CMP WORK + 0 
1ef2 : 90 02 __ BCC $1ef6 ; (divmod + 78)
1ef4 : e5 23 __ SBC WORK + 0 
1ef6 : 26 3b __ ROL ACCU + 0 
1ef8 : 26 3c __ ROL ACCU + 1 
1efa : ca __ __ DEX
1efb : d0 f2 __ BNE $1eef ; (divmod + 71)
1efd : 85 25 __ STA WORK + 2 
1eff : 60 __ __ RTS
1f00 : a9 00 __ LDA #$00
1f02 : 85 25 __ STA WORK + 2 
1f04 : 85 26 __ STA WORK + 3 
1f06 : 84 22 __ STY $22 
1f08 : a0 10 __ LDY #$10
1f0a : 18 __ __ CLC
1f0b : 26 3b __ ROL ACCU + 0 
1f0d : 26 3c __ ROL ACCU + 1 
1f0f : 26 25 __ ROL WORK + 2 
1f11 : 26 26 __ ROL WORK + 3 
1f13 : 38 __ __ SEC
1f14 : a5 25 __ LDA WORK + 2 
1f16 : e5 23 __ SBC WORK + 0 
1f18 : aa __ __ TAX
1f19 : a5 26 __ LDA WORK + 3 
1f1b : e5 24 __ SBC WORK + 1 
1f1d : 90 04 __ BCC $1f23 ; (divmod + 123)
1f1f : 86 25 __ STX WORK + 2 
1f21 : 85 26 __ STA WORK + 3 
1f23 : 88 __ __ DEY
1f24 : d0 e5 __ BNE $1f0b ; (divmod + 99)
1f26 : 26 3b __ ROL ACCU + 0 
1f28 : 26 3c __ ROL ACCU + 1 
1f2a : a4 22 __ LDY $22 
1f2c : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1f2d : 24 3c __ BIT ACCU + 1 
1f2f : 10 0d __ BPL $1f3e ; (mods16 + 17)
1f31 : 20 f1 1c JSR $1cf1 ; (negaccu + 0)
1f34 : 24 24 __ BIT WORK + 1 
1f36 : 10 0d __ BPL $1f45 ; (mods16 + 24)
1f38 : 20 9a 1e JSR $1e9a ; (negtmp + 0)
1f3b : 4c a8 1e JMP $1ea8 ; (divmod + 0)
1f3e : 24 24 __ BIT WORK + 1 
1f40 : 10 f9 __ BPL $1f3b ; (mods16 + 14)
1f42 : 20 9a 1e JSR $1e9a ; (negtmp + 0)
1f45 : 20 a8 1e JSR $1ea8 ; (divmod + 0)
1f48 : 38 __ __ SEC
1f49 : a9 00 __ LDA #$00
1f4b : e5 25 __ SBC WORK + 2 
1f4d : 85 25 __ STA WORK + 2 
1f4f : a9 00 __ LDA #$00
1f51 : e5 26 __ SBC WORK + 3 
1f53 : 85 26 __ STA WORK + 3 
1f55 : 60 __ __ RTS
