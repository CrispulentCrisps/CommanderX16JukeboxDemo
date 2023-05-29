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
080e : 8e ff 0b STX $0bff ; (spentry + 0)
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
0830 : a9 c4 __ LDA #$c4
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
0bff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 e6 0b JSR $0be6 ; (zsm_irq_init.s0 + 0)
0883 : 20 bb 0d JSR $0dbb ; (ClearVERAScreen.s0 + 0)
0886 : 20 fe 0d JSR $0dfe ; (SetUpSprites.s0 + 0)
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
08e2 : a9 b6 __ LDA #$b6
08e4 : 85 35 __ STA P8 
08e6 : a9 44 __ LDA #$44
08e8 : 85 36 __ STA P9 
08ea : 20 c7 18 JSR $18c7 ; (SetPaletteColours.s0 + 0)
08ed : a9 00 __ LDA #$00
08ef : 85 4f __ STA T1 + 0 
08f1 : 85 50 __ STA T1 + 1 
08f3 : 85 51 __ STA T2 + 0 
08f5 : 85 52 __ STA T3 + 0 
08f7 : 85 53 __ STA T4 + 0 
.l3:
08f9 : 20 ee 18 JSR $18ee ; (getchx.s0 + 0)
08fc : a5 3b __ LDA ACCU + 0 
08fe : 85 54 __ STA T5 + 0 
0900 : a9 30 __ LDA #$30
0902 : 8d 2c 9f STA $9f2c 
0905 : ee fc 25 INC $25fc ; (p + 0)
0908 : d0 03 __ BNE $090d ; (main.s1020 + 0)
.s1019:
090a : ee fd 25 INC $25fd ; (p + 1)
.s1020:
090d : ad fe 25 LDA $25fe ; (Phase + 0)
0910 : 18 __ __ CLC
0911 : 69 01 __ ADC #$01
0913 : 85 32 __ STA P5 
0915 : 8d fe 25 STA $25fe ; (Phase + 0)
0918 : ad ff 25 LDA $25ff ; (Phase + 1)
091b : 69 00 __ ADC #$00
091d : 85 33 __ STA P6 
091f : 8d ff 25 STA $25ff ; (Phase + 1)
0922 : ad d6 44 LDA $44d6 ; (Phase2 + 0)
0925 : 18 __ __ CLC
0926 : 69 01 __ ADC #$01
0928 : 85 34 __ STA P7 
092a : 8d d6 44 STA $44d6 ; (Phase2 + 0)
092d : ad d7 44 LDA $44d7 ; (Phase2 + 1)
0930 : 69 00 __ ADC #$00
0932 : 85 35 __ STA P8 
0934 : 8d d7 44 STA $44d7 ; (Phase2 + 1)
0937 : ad d8 44 LDA $44d8 ; (Phase3 + 0)
093a : 18 __ __ CLC
093b : 69 01 __ ADC #$01
093d : 85 36 __ STA P9 
093f : 8d d8 44 STA $44d8 ; (Phase3 + 0)
0942 : ad d9 44 LDA $44d9 ; (Phase3 + 1)
0945 : 69 00 __ ADC #$00
0947 : 85 37 __ STA P10 
0949 : 8d d9 44 STA $44d9 ; (Phase3 + 1)
094c : 20 29 19 JSR $1929 ; (MoveSprites.s0 + 0)
094f : a5 52 __ LDA T3 + 0 
0951 : c9 01 __ CMP #$01
0953 : d0 03 __ BNE $0958 ; (main.s6 + 0)
0955 : 4c c4 0b JMP $0bc4 ; (main.s5 + 0)
.s6:
0958 : a9 00 __ LDA #$00
095a : 8d de 44 STA $44de ; (PalTimer + 0)
095d : 8d df 44 STA $44df ; (PalTimer + 1)
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
0978 : a9 e0 __ LDA #$e0
097a : 85 35 __ STA P8 
097c : a9 44 __ LDA #$44
097e : 85 36 __ STA P9 
0980 : 20 c7 18 JSR $18c7 ; (SetPaletteColours.s0 + 0)
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
09a9 : a9 2f __ LDA #$2f
09ab : 85 32 __ STA P5 
09ad : a9 25 __ LDA #$25
09af : 85 33 __ STA P6 
09b1 : 20 d7 1c JSR $1cd7 ; (SetPaletteIndex.s0 + 0)
09b4 : a9 00 __ LDA #$00
09b6 : 85 53 __ STA T4 + 0 
.s62:
09b8 : ad df 44 LDA $44df ; (PalTimer + 1)
09bb : 30 5f __ BMI $0a1c ; (main.s13 + 0)
.s1013:
09bd : d0 07 __ BNE $09c6 ; (main.s11 + 0)
.s1012:
09bf : a9 03 __ LDA #$03
09c1 : cd de 44 CMP $44de ; (PalTimer + 0)
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
09e2 : ee 00 46 INC $4600 ; (PalIndex + 0)
09e5 : d0 03 __ BNE $09ea ; (main.s1024 + 0)
.s1023:
09e7 : ee 01 46 INC $4601 ; (PalIndex + 1)
.s1024:
09ea : a9 ef __ LDA #$ef
09ec : 85 32 __ STA P5 
09ee : a9 25 __ LDA #$25
09f0 : 85 33 __ STA P6 
09f2 : 20 d7 1c JSR $1cd7 ; (SetPaletteIndex.s0 + 0)
09f5 : a9 50 __ LDA #$50
09f7 : 85 34 __ STA P7 
09f9 : a9 00 __ LDA #$00
09fb : 8d fc 9e STA $9efc ; (sstack + 0)
09fe : 8d fd 9e STA $9efd ; (sstack + 1)
0a01 : 8d ff 9e STA $9eff ; (sstack + 3)
0a04 : a9 10 __ LDA #$10
0a06 : 8d fe 9e STA $9efe ; (sstack + 2)
0a09 : a9 02 __ LDA #$02
0a0b : 85 32 __ STA P5 
0a0d : a9 46 __ LDA #$46
0a0f : 85 33 __ STA P6 
0a11 : 20 d7 1c JSR $1cd7 ; (SetPaletteIndex.s0 + 0)
0a14 : a9 00 __ LDA #$00
0a16 : 8d de 44 STA $44de ; (PalTimer + 0)
0a19 : 8d df 44 STA $44df ; (PalTimer + 1)
.s13:
0a1c : a9 03 __ LDA #$03
0a1e : 8d 2c 9f STA $9f2c 
0a21 : a5 54 __ LDA T5 + 0 
0a23 : c9 44 __ CMP #$44
0a25 : d0 0c __ BNE $0a33 ; (main.s15 + 0)
.s17:
0a27 : a5 51 __ LDA T2 + 0 
0a29 : cd 22 46 CMP $4622 ; (MaxSong + 0)
0a2c : b0 03 __ BCS $0a31 ; (main.s1018 + 0)
0a2e : 4c bf 0b JMP $0bbf ; (main.s14 + 0)
.s1018:
0a31 : a5 54 __ LDA T5 + 0 
.s15:
0a33 : c9 41 __ CMP #$41
0a35 : d0 21 __ BNE $0a58 ; (main.s16 + 0)
.s21:
0a37 : a5 51 __ LDA T2 + 0 
0a39 : f0 1d __ BEQ $0a58 ; (main.s16 + 0)
.s18:
0a3b : c6 51 __ DEC T2 + 0 
.s74:
0a3d : 20 8a 1d JSR $1d8a ; (ResetChars.s0 + 0)
0a40 : a9 00 __ LDA #$00
0a42 : 8d 23 46 STA $4623 ; (off1 + 0)
0a45 : 8d 24 46 STA $4624 ; (off1 + 1)
0a48 : a9 80 __ LDA #$80
0a4a : 8d 37 9f STA $9f37 
0a4d : a9 fd __ LDA #$fd
0a4f : 8d 38 9f STA $9f38 
0a52 : a9 00 __ LDA #$00
0a54 : 85 4f __ STA T1 + 0 
0a56 : 85 50 __ STA T1 + 1 
.s16:
0a58 : a5 52 __ LDA T3 + 0 
0a5a : 85 30 __ STA P3 
0a5c : a5 54 __ LDA T5 + 0 
0a5e : 85 31 __ STA P4 
0a60 : a5 51 __ LDA T2 + 0 
0a62 : 85 32 __ STA P5 
0a64 : a9 00 __ LDA #$00
0a66 : 85 33 __ STA P6 
0a68 : ad dd 44 LDA $44dd ; (LastSelectedSong + 0)
0a6b : 85 34 __ STA P7 
0a6d : a9 00 __ LDA #$00
0a6f : 85 35 __ STA P8 
0a71 : 20 af 1d JSR $1daf ; (Control.s0 + 0)
0a74 : a5 3b __ LDA ACCU + 0 
0a76 : 85 52 __ STA T3 + 0 
0a78 : 38 __ __ SEC
0a79 : a5 4f __ LDA T1 + 0 
0a7b : e9 80 __ SBC #$80
0a7d : 8d 37 9f STA $9f37 
0a80 : a5 50 __ LDA T1 + 1 
0a82 : e9 02 __ SBC #$02
0a84 : 8d 38 9f STA $9f38 
0a87 : ad da 44 LDA $44da ; (FrameCount + 0)
0a8a : 85 3b __ STA ACCU + 0 
0a8c : ad db 44 LDA $44db ; (FrameCount + 1)
0a8f : 85 3c __ STA ACCU + 1 
0a91 : a9 08 __ LDA #$08
0a93 : 85 23 __ STA WORK + 0 
0a95 : a9 00 __ LDA #$00
0a97 : 85 24 __ STA WORK + 1 
0a99 : 20 21 1f JSR $1f21 ; (mods16 + 0)
0a9c : a5 26 __ LDA WORK + 3 
0a9e : f0 03 __ BEQ $0aa3 ; (main.s1005 + 0)
0aa0 : 4c 90 0b JMP $0b90 ; (main.s24 + 0)
.s1005:
0aa3 : a5 25 __ LDA WORK + 2 
0aa5 : c9 01 __ CMP #$01
0aa7 : f0 03 __ BEQ $0aac ; (main.s22 + 0)
0aa9 : 4c 90 0b JMP $0b90 ; (main.s24 + 0)
.s22:
0aac : ad 23 46 LDA $4623 ; (off1 + 0)
0aaf : 85 54 __ STA T5 + 0 
0ab1 : 29 7f __ AND #$7f
0ab3 : 0a __ __ ASL
0ab4 : 8d 20 9f STA $9f20 
0ab7 : ad 25 9f LDA $9f25 
0aba : 29 fe __ AND #$fe
0abc : 8d 25 9f STA $9f25 
0abf : a9 b0 __ LDA #$b0
0ac1 : 8d 21 9f STA $9f21 
0ac4 : a9 11 __ LDA #$11
0ac6 : 8d 22 9f STA $9f22 
0ac9 : a5 32 __ LDA P5 
0acb : d0 20 __ BNE $0aed ; (main.s1004 + 0)
.s27:
0acd : a5 54 __ LDA T5 + 0 
0acf : 85 3b __ STA ACCU + 0 
0ad1 : ad 24 46 LDA $4624 ; (off1 + 1)
0ad4 : 85 3c __ STA ACCU + 1 
0ad6 : a9 83 __ LDA #$83
0ad8 : 85 23 __ STA WORK + 0 
0ada : a9 06 __ LDA #$06
0adc : 85 24 __ STA WORK + 1 
0ade : 20 9c 1e JSR $1e9c ; (divmod + 0)
0ae1 : 18 __ __ CLC
0ae2 : a9 26 __ LDA #$26
0ae4 : 65 25 __ ADC WORK + 2 
0ae6 : 85 47 __ STA T6 + 0 
0ae8 : a9 46 __ LDA #$46
0aea : 4c b4 0b JMP $0bb4 ; (main.s1017 + 0)
.s1004:
0aed : c9 01 __ CMP #$01
0aef : d0 20 __ BNE $0b11 ; (main.s1003 + 0)
.s32:
0af1 : a5 54 __ LDA T5 + 0 
0af3 : 85 3b __ STA ACCU + 0 
0af5 : ad 24 46 LDA $4624 ; (off1 + 1)
0af8 : 85 3c __ STA ACCU + 1 
0afa : a9 5c __ LDA #$5c
0afc : 85 23 __ STA WORK + 0 
0afe : a9 07 __ LDA #$07
0b00 : 85 24 __ STA WORK + 1 
0b02 : 20 9c 1e JSR $1e9c ; (divmod + 0)
0b05 : 18 __ __ CLC
0b06 : a9 aa __ LDA #$aa
0b08 : 65 25 __ ADC WORK + 2 
0b0a : 85 47 __ STA T6 + 0 
0b0c : a9 4c __ LDA #$4c
0b0e : 4c b4 0b JMP $0bb4 ; (main.s1017 + 0)
.s1003:
0b11 : c9 02 __ CMP #$02
0b13 : d0 1c __ BNE $0b31 ; (main.s1002 + 0)
.s37:
0b15 : a5 54 __ LDA T5 + 0 
0b17 : 85 3b __ STA ACCU + 0 
0b19 : ad 24 46 LDA $4624 ; (off1 + 1)
0b1c : 85 3c __ STA ACCU + 1 
0b1e : a9 c5 __ LDA #$c5
0b20 : 85 23 __ STA WORK + 0 
0b22 : a9 00 __ LDA #$00
0b24 : 85 24 __ STA WORK + 1 
0b26 : 20 9c 1e JSR $1e9c ; (divmod + 0)
0b29 : a6 25 __ LDX WORK + 2 
0b2b : bd 07 54 LDA $5407,x ; (Song2 + 0)
0b2e : 4c 4e 0b JMP $0b4e ; (main.s67 + 0)
.s1002:
0b31 : c9 03 __ CMP #$03
0b33 : d0 29 __ BNE $0b5e ; (main.s26 + 0)
.s42:
0b35 : a5 54 __ LDA T5 + 0 
0b37 : 85 3b __ STA ACCU + 0 
0b39 : ad 24 46 LDA $4624 ; (off1 + 1)
0b3c : 85 3c __ STA ACCU + 1 
0b3e : a9 c3 __ LDA #$c3
0b40 : 85 23 __ STA WORK + 0 
0b42 : a9 00 __ LDA #$00
0b44 : 85 24 __ STA WORK + 1 
0b46 : 20 9c 1e JSR $1e9c ; (divmod + 0)
0b49 : a6 25 __ LDX WORK + 2 
0b4b : bd 00 55 LDA $5500,x ; (Song3 + 0)
.s67:
0b4e : 09 00 __ ORA #$00
0b50 : f0 0c __ BEQ $0b5e ; (main.s26 + 0)
.s28:
0b52 : 8d 23 9f STA $9f23 
0b55 : a5 54 __ LDA T5 + 0 
0b57 : 29 0f __ AND #$0f
0b59 : 09 80 __ ORA #$80
0b5b : 8d 23 9f STA $9f23 
.s26:
0b5e : a9 80 __ LDA #$80
0b60 : 85 34 __ STA P7 
0b62 : a9 00 __ LDA #$00
0b64 : 85 36 __ STA P9 
0b66 : 85 37 __ STA P10 
0b68 : 8d fc 9e STA $9efc ; (sstack + 0)
0b6b : 8d fd 9e STA $9efd ; (sstack + 1)
0b6e : a9 10 __ LDA #$10
0b70 : 8d fe 9e STA $9efe ; (sstack + 2)
0b73 : a9 00 __ LDA #$00
0b75 : 8d ff 9e STA $9eff ; (sstack + 3)
0b78 : 18 __ __ CLC
0b79 : a5 54 __ LDA T5 + 0 
0b7b : 69 01 __ ADC #$01
0b7d : 8d 23 46 STA $4623 ; (off1 + 0)
0b80 : 90 03 __ BCC $0b85 ; (main.s1026 + 0)
.s1025:
0b82 : ee 24 46 INC $4624 ; (off1 + 1)
.s1026:
0b85 : a9 6c __ LDA #$6c
0b87 : 85 32 __ STA P5 
0b89 : a9 40 __ LDA #$40
0b8b : 85 33 __ STA P6 
0b8d : 20 d7 1c JSR $1cd7 ; (SetPaletteIndex.s0 + 0)
.s24:
0b90 : a9 01 __ LDA #$01
0b92 : 8d 2c 9f STA $9f2c 
0b95 : 20 9f 1b JSR $1b9f ; (zsm_fill.s0 + 0)
0b98 : a9 00 __ LDA #$00
0b9a : 8d 2c 9f STA $9f2c 
0b9d : 20 73 1e JSR $1e73 ; (frame_wait.l1 + 0)
0ba0 : ee da 44 INC $44da ; (FrameCount + 0)
0ba3 : d0 03 __ BNE $0ba8 ; (main.s1028 + 0)
.s1027:
0ba5 : ee db 44 INC $44db ; (FrameCount + 1)
.s1028:
0ba8 : e6 4f __ INC T1 + 0 
0baa : f0 03 __ BEQ $0baf ; (main.s1029 + 0)
0bac : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s1029:
0baf : e6 50 __ INC T1 + 1 
0bb1 : 4c f9 08 JMP $08f9 ; (main.l3 + 0)
.s1017:
0bb4 : 65 26 __ ADC WORK + 3 
0bb6 : 85 48 __ STA T6 + 1 
0bb8 : a0 00 __ LDY #$00
0bba : b1 47 __ LDA (T6 + 0),y 
0bbc : 4c 4e 0b JMP $0b4e ; (main.s67 + 0)
.s14:
0bbf : e6 51 __ INC T2 + 0 
0bc1 : 4c 3d 0a JMP $0a3d ; (main.s74 + 0)
.s5:
0bc4 : a5 51 __ LDA T2 + 0 
0bc6 : 85 32 __ STA P5 
0bc8 : a9 00 __ LDA #$00
0bca : 85 33 __ STA P6 
0bcc : ad dd 44 LDA $44dd ; (LastSelectedSong + 0)
0bcf : 85 34 __ STA P7 
0bd1 : a9 00 __ LDA #$00
0bd3 : 85 35 __ STA P8 
0bd5 : 20 c4 1a JSR $1ac4 ; (PlayZSM.s0 + 0)
0bd8 : ee de 44 INC $44de ; (PalTimer + 0)
0bdb : f0 03 __ BEQ $0be0 ; (main.s1021 + 0)
0bdd : 4c 83 09 JMP $0983 ; (main.s61 + 0)
.s1021:
0be0 : ee df 44 INC $44df ; (PalTimer + 1)
0be3 : 4c 83 09 JMP $0983 ; (main.s61 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0be6 : 78 __ __ SEI
0be7 : ad 14 03 LDA $0314 
0bea : 8d cd 54 STA $54cd ; (oirq + 0)
0bed : ad 15 03 LDA $0315 
0bf0 : 8d ce 54 STA $54ce ; (oirq + 1)
0bf3 : a9 00 __ LDA #$00
0bf5 : 8d 14 03 STA $0314 
0bf8 : a9 0c __ LDA #$0c
0bfa : 8d 15 03 STA $0315 
0bfd : 58 __ __ CLI
.s1001:
0bfe : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
54cd : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c00 : 20 06 0c JSR $0c06 ; (irq.s1000 + 0)
0c03 : 6c cd 54 JMP ($54cd)
--------------------------------------------------------------------
irq:
.s1000:
0c06 : a5 2d __ LDA P0 
0c08 : 48 __ __ PHA
0c09 : a5 2e __ LDA P1 
0c0b : 48 __ __ PHA
0c0c : a5 3b __ LDA ACCU + 0 
0c0e : 48 __ __ PHA
0c0f : a5 3c __ LDA ACCU + 1 
0c11 : 48 __ __ PHA
0c12 : a5 47 __ LDA T0 + 0 
0c14 : 48 __ __ PHA
0c15 : a5 48 __ LDA $48 
0c17 : 48 __ __ PHA
0c18 : a5 49 __ LDA $49 
0c1a : 48 __ __ PHA
0c1b : a5 4a __ LDA $4a 
0c1d : 48 __ __ PHA
0c1e : a5 4b __ LDA $4b 
0c20 : 48 __ __ PHA
0c21 : a5 4c __ LDA $4c 
0c23 : 48 __ __ PHA
0c24 : a5 4d __ LDA $4d 
0c26 : 48 __ __ PHA
0c27 : a5 4e __ LDA $4e 
0c29 : 48 __ __ PHA
0c2a : a5 4f __ LDA $4f 
0c2c : 48 __ __ PHA
0c2d : a5 50 __ LDA $50 
0c2f : 48 __ __ PHA
.s0:
0c30 : ad 4a 1f LDA $1f4a ; (zsm_playing + 0)
0c33 : f0 08 __ BEQ $0c3d ; (irq.s1001 + 0)
.s4:
0c35 : ad 4b 1f LDA $1f4b ; (zsm_finished + 0)
0c38 : d0 03 __ BNE $0c3d ; (irq.s1001 + 0)
.s1:
0c3a : 20 68 0c JSR $0c68 ; (zsm_play.s0 + 0)
.s1001:
0c3d : 68 __ __ PLA
0c3e : 85 50 __ STA $50 
0c40 : 68 __ __ PLA
0c41 : 85 4f __ STA $4f 
0c43 : 68 __ __ PLA
0c44 : 85 4e __ STA $4e 
0c46 : 68 __ __ PLA
0c47 : 85 4d __ STA $4d 
0c49 : 68 __ __ PLA
0c4a : 85 4c __ STA $4c 
0c4c : 68 __ __ PLA
0c4d : 85 4b __ STA $4b 
0c4f : 68 __ __ PLA
0c50 : 85 4a __ STA $4a 
0c52 : 68 __ __ PLA
0c53 : 85 49 __ STA $49 
0c55 : 68 __ __ PLA
0c56 : 85 48 __ STA $48 
0c58 : 68 __ __ PLA
0c59 : 85 47 __ STA T0 + 0 
0c5b : 68 __ __ PLA
0c5c : 85 3c __ STA ACCU + 1 
0c5e : 68 __ __ PLA
0c5f : 85 3b __ STA ACCU + 0 
0c61 : 68 __ __ PLA
0c62 : 85 2e __ STA P1 
0c64 : 68 __ __ PLA
0c65 : 85 2d __ STA P0 
0c67 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1f4a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1f4b : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c68 : ad 4c 1f LDA $1f4c ; (zsm_paused + 0)
0c6b : f0 01 __ BEQ $0c6e ; (zsm_play.s2 + 0)
0c6d : 60 __ __ RTS
.s2:
0c6e : ad cf 54 LDA $54cf ; (zsm_delay + 0)
0c71 : f0 03 __ BEQ $0c76 ; (zsm_play.s5 + 0)
0c73 : 4c a3 0d JMP $0da3 ; (zsm_play.s4 + 0)
.s5:
0c76 : ad 25 9f LDA $9f25 
0c79 : 85 47 __ STA T0 + 0 
0c7b : ad 25 9f LDA $9f25 
0c7e : 29 fe __ AND #$fe
0c80 : 8d 25 9f STA $9f25 
0c83 : ad 20 9f LDA $9f20 
0c86 : 85 49 __ STA T2 + 0 
0c88 : ad 21 9f LDA $9f21 
0c8b : 85 4a __ STA T2 + 1 
0c8d : ad 22 9f LDA $9f22 
0c90 : 85 48 __ STA T1 + 0 
.l8:
0c92 : ad d0 54 LDA $54d0 ; (zsm_pos + 0)
0c95 : 85 4b __ STA T3 + 0 
0c97 : 18 __ __ CLC
0c98 : 69 01 __ ADC #$01
0c9a : 85 4d __ STA T4 + 0 
0c9c : 8d d0 54 STA $54d0 ; (zsm_pos + 0)
0c9f : ad d1 54 LDA $54d1 ; (zsm_pos + 1)
0ca2 : aa __ __ TAX
0ca3 : 69 00 __ ADC #$00
0ca5 : 85 4e __ STA T4 + 1 
0ca7 : 8d d1 54 STA $54d1 ; (zsm_pos + 1)
0caa : 18 __ __ CLC
0cab : a9 c4 __ LDA #$c4
0cad : 65 4b __ ADC T3 + 0 
0caf : 85 3b __ STA ACCU + 0 
0cb1 : 8a __ __ TXA
0cb2 : 29 03 __ AND #$03
0cb4 : 69 55 __ ADC #$55
0cb6 : 85 3c __ STA ACCU + 1 
0cb8 : a0 00 __ LDY #$00
0cba : b1 3b __ LDA (ACCU + 0),y 
0cbc : c9 40 __ CMP #$40
0cbe : b0 03 __ BCS $0cc3 ; (zsm_play.s12 + 0)
0cc0 : 4c 6e 0d JMP $0d6e ; (zsm_play.s11 + 0)
.s12:
0cc3 : d0 22 __ BNE $0ce7 ; (zsm_play.s15 + 0)
.s14:
0cc5 : 18 __ __ CLC
0cc6 : a9 c4 __ LDA #$c4
0cc8 : 65 4d __ ADC T4 + 0 
0cca : 85 4b __ STA T3 + 0 
0ccc : a5 4e __ LDA T4 + 1 
0cce : 29 03 __ AND #$03
0cd0 : 69 55 __ ADC #$55
0cd2 : 85 4c __ STA T3 + 1 
0cd4 : b1 4b __ LDA (T3 + 0),y 
0cd6 : 29 3f __ AND #$3f
0cd8 : 18 __ __ CLC
0cd9 : 65 4d __ ADC T4 + 0 
0cdb : 8d d0 54 STA $54d0 ; (zsm_pos + 0)
0cde : 98 __ __ TYA
0cdf : 65 4e __ ADC T4 + 1 
0ce1 : 8d d1 54 STA $54d1 ; (zsm_pos + 1)
0ce4 : 4c 92 0c JMP $0c92 ; (zsm_play.l8 + 0)
.s15:
0ce7 : 09 00 __ ORA #$00
0ce9 : 30 5b __ BMI $0d46 ; (zsm_play.s18 + 0)
.s17:
0ceb : 29 3f __ AND #$3f
0ced : f0 a3 __ BEQ $0c92 ; (zsm_play.l8 + 0)
.s29:
0cef : 84 50 __ STY T7 + 0 
0cf1 : 85 4f __ STA T6 + 0 
0cf3 : 18 __ __ CLC
.l1012:
0cf4 : a9 c4 __ LDA #$c4
0cf6 : 6d d0 54 ADC $54d0 ; (zsm_pos + 0)
0cf9 : 85 4d __ STA T4 + 0 
0cfb : ad d1 54 LDA $54d1 ; (zsm_pos + 1)
0cfe : 29 03 __ AND #$03
0d00 : 69 55 __ ADC #$55
0d02 : 85 4e __ STA T4 + 1 
0d04 : a0 00 __ LDY #$00
0d06 : b1 4d __ LDA (T4 + 0),y 
0d08 : 85 2d __ STA P0 
0d0a : ad d0 54 LDA $54d0 ; (zsm_pos + 0)
0d0d : 18 __ __ CLC
0d0e : 69 01 __ ADC #$01
0d10 : aa __ __ TAX
0d11 : ad d1 54 LDA $54d1 ; (zsm_pos + 1)
0d14 : 69 00 __ ADC #$00
0d16 : 29 03 __ AND #$03
0d18 : 85 4c __ STA T3 + 1 
0d1a : 8a __ __ TXA
0d1b : 18 __ __ CLC
0d1c : 69 c4 __ ADC #$c4
0d1e : 85 4b __ STA T3 + 0 
0d20 : a9 55 __ LDA #$55
0d22 : 65 4c __ ADC T3 + 1 
0d24 : 85 4c __ STA T3 + 1 
0d26 : b1 4b __ LDA (T3 + 0),y 
0d28 : 85 2e __ STA P1 
0d2a : 20 a7 0d JSR $0da7 ; (sfx_put.l1 + 0)
0d2d : ad d0 54 LDA $54d0 ; (zsm_pos + 0)
0d30 : 18 __ __ CLC
0d31 : 69 02 __ ADC #$02
0d33 : 8d d0 54 STA $54d0 ; (zsm_pos + 0)
0d36 : 90 03 __ BCC $0d3b ; (zsm_play.s1015 + 0)
.s1014:
0d38 : ee d1 54 INC $54d1 ; (zsm_pos + 1)
.s1015:
0d3b : e6 50 __ INC T7 + 0 
0d3d : a5 50 __ LDA T7 + 0 
0d3f : c5 4f __ CMP T6 + 0 
0d41 : 90 b1 __ BCC $0cf4 ; (zsm_play.l1012 + 0)
0d43 : 4c 92 0c JMP $0c92 ; (zsm_play.l8 + 0)
.s18:
0d46 : c9 80 __ CMP #$80
0d48 : d0 07 __ BNE $0d51 ; (zsm_play.s25 + 0)
.s24:
0d4a : a9 01 __ LDA #$01
0d4c : 8d 4b 1f STA $1f4b ; (zsm_finished + 0)
0d4f : d0 08 __ BNE $0d59 ; (zsm_play.s10 + 0)
.s25:
0d51 : 29 7f __ AND #$7f
0d53 : 38 __ __ SEC
0d54 : e9 01 __ SBC #$01
0d56 : 8d cf 54 STA $54cf ; (zsm_delay + 0)
.s10:
0d59 : a5 49 __ LDA T2 + 0 
0d5b : 8d 20 9f STA $9f20 
0d5e : a5 4a __ LDA T2 + 1 
0d60 : 8d 21 9f STA $9f21 
0d63 : a5 48 __ LDA T1 + 0 
0d65 : 8d 22 9f STA $9f22 
0d68 : a5 47 __ LDA T0 + 0 
0d6a : 8d 25 9f STA $9f25 
.s1001:
0d6d : 60 __ __ RTS
.s11:
0d6e : 29 3f __ AND #$3f
0d70 : 09 c0 __ ORA #$c0
0d72 : 8d 20 9f STA $9f20 
0d75 : a9 f9 __ LDA #$f9
0d77 : 8d 21 9f STA $9f21 
0d7a : a9 01 __ LDA #$01
0d7c : 8d 22 9f STA $9f22 
0d7f : a5 4b __ LDA T3 + 0 
0d81 : 69 02 __ ADC #$02
0d83 : 8d d0 54 STA $54d0 ; (zsm_pos + 0)
0d86 : 90 01 __ BCC $0d89 ; (zsm_play.s1017 + 0)
.s1016:
0d88 : e8 __ __ INX
.s1017:
0d89 : 8e d1 54 STX $54d1 ; (zsm_pos + 1)
0d8c : 18 __ __ CLC
0d8d : a9 c4 __ LDA #$c4
0d8f : 65 4d __ ADC T4 + 0 
0d91 : 85 4b __ STA T3 + 0 
0d93 : a5 4e __ LDA T4 + 1 
0d95 : 29 03 __ AND #$03
0d97 : 69 55 __ ADC #$55
0d99 : 85 4c __ STA T3 + 1 
0d9b : b1 4b __ LDA (T3 + 0),y 
0d9d : 8d 23 9f STA $9f23 
0da0 : 4c 92 0c JMP $0c92 ; (zsm_play.l8 + 0)
.s4:
0da3 : ce cf 54 DEC $54cf ; (zsm_delay + 0)
0da6 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1f4c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
54cf : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
55c4 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
54d0 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0da7 : ad 41 9f LDA $9f41 
0daa : 30 fb __ BMI $0da7 ; (sfx_put.l1 + 0)
.s3:
0dac : a5 2d __ LDA P0 ; (index + 0)
0dae : 8d 40 9f STA $9f40 
0db1 : ea __ __ NOP
0db2 : ea __ __ NOP
0db3 : ea __ __ NOP
0db4 : ea __ __ NOP
0db5 : a5 2e __ LDA P1 ; (data + 0)
0db7 : 8d 41 9f STA $9f41 
.s1001:
0dba : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0dbb : a9 93 __ LDA #$93
0dbd : 85 2d __ STA P0 
0dbf : a9 00 __ LDA #$00
0dc1 : 85 2e __ STA P1 
0dc3 : 20 f8 0d JSR $0df8 ; (putch.s0 + 0)
0dc6 : a9 11 __ LDA #$11
0dc8 : 8d 22 9f STA $9f22 
0dcb : a2 00 __ LDX #$00
.l2:
0dcd : 8a __ __ TXA
0dce : 18 __ __ CLC
0dcf : 69 b0 __ ADC #$b0
0dd1 : 8d 21 9f STA $9f21 
0dd4 : a9 00 __ LDA #$00
0dd6 : 8d 20 9f STA $9f20 
0dd9 : a0 80 __ LDY #$80
.l1003:
0ddb : a9 20 __ LDA #$20
0ddd : 8d 23 9f STA $9f23 
0de0 : a9 01 __ LDA #$01
0de2 : 8d 23 9f STA $9f23 
0de5 : a9 20 __ LDA #$20
0de7 : 8d 24 9f STA $9f24 
0dea : a9 01 __ LDA #$01
0dec : 8d 24 9f STA $9f24 
0def : 88 __ __ DEY
0df0 : d0 e9 __ BNE $0ddb ; (ClearVERAScreen.l1003 + 0)
.s1004:
0df2 : e8 __ __ INX
0df3 : e0 40 __ CPX #$40
0df5 : 90 d6 __ BCC $0dcd ; (ClearVERAScreen.l2 + 0)
.s1001:
0df7 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0df8 : a5 2d __ LDA P0 
0dfa : 20 d2 ff JSR $ffd2 
.s1001:
0dfd : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0dfe : a9 00 __ LDA #$00
0e00 : 8d 25 9f STA $9f25 
0e03 : ad 29 9f LDA $9f29 
0e06 : 09 70 __ ORA #$70
0e08 : 8d 29 9f STA $9f29 
0e0b : a9 80 __ LDA #$80
0e0d : 8d 2b 9f STA $9f2b 
0e10 : 8d 2a 9f STA $9f2a 
0e13 : a9 62 __ LDA #$62
0e15 : 8d 2d 9f STA $9f2d 
0e18 : a9 68 __ LDA #$68
0e1a : 8d 34 9f STA $9f34 
0e1d : a9 00 __ LDA #$00
0e1f : 85 2d __ STA P0 
0e21 : 85 2e __ STA P1 
0e23 : 85 2f __ STA P2 
0e25 : 85 30 __ STA P3 
0e27 : 85 31 __ STA P4 
0e29 : 20 24 17 JSR $1724 ; (tileBaseConfig.s0 + 0)
0e2c : 8d 2f 9f STA $9f2f 
0e2f : a9 00 __ LDA #$00
0e31 : 85 2d __ STA P0 
0e33 : a9 20 __ LDA #$20
0e35 : 85 2f __ STA P2 
0e37 : 20 3c 17 JSR $173c ; (memoryToMapMemoryAddress.s0 + 0)
0e3a : 8d 2e 9f STA $9f2e 
0e3d : a9 01 __ LDA #$01
0e3f : 8d 22 9f STA $9f22 
0e42 : a2 80 __ LDX #$80
.l6:
0e44 : a0 50 __ LDY #$50
.l1032:
0e46 : a9 00 __ LDA #$00
0e48 : 8d 24 9f STA $9f24 
0e4b : a9 08 __ LDA #$08
0e4d : 8d 24 9f STA $9f24 
0e50 : 88 __ __ DEY
0e51 : d0 f3 __ BNE $0e46 ; (SetUpSprites.l1032 + 0)
.s1033:
0e53 : ca __ __ DEX
0e54 : d0 ee __ BNE $0e44 ; (SetUpSprites.l6 + 0)
.s4:
0e56 : 86 48 __ STX T1 + 0 
0e58 : a9 00 __ LDA #$00
0e5a : 85 2d __ STA P0 
0e5c : 85 2e __ STA P1 
0e5e : 85 2f __ STA P2 
0e60 : 85 30 __ STA P3 
0e62 : a9 e0 __ LDA #$e0
0e64 : 85 33 __ STA P6 
0e66 : a9 01 __ LDA #$01
0e68 : 85 34 __ STA P7 
0e6a : a9 4d __ LDA #$4d
0e6c : 85 31 __ STA P4 
0e6e : a9 1f __ LDA #$1f
0e70 : 85 32 __ STA P5 
0e72 : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
0e75 : a9 10 __ LDA #$10
0e77 : 8d 22 9f STA $9f22 
0e7a : a9 00 __ LDA #$00
0e7c : 8d 20 9f STA $9f20 
0e7f : a9 20 __ LDA #$20
0e81 : 8d 21 9f STA $9f21 
.l10:
0e84 : a9 00 __ LDA #$00
0e86 : 85 49 __ STA T2 + 0 
.l14:
0e88 : 20 84 17 JSR $1784 ; (rand.s0 + 0)
0e8b : a9 30 __ LDA #$30
0e8d : 85 23 __ STA WORK + 0 
0e8f : a9 00 __ LDA #$00
0e91 : 85 24 __ STA WORK + 1 
0e93 : 20 9c 1e JSR $1e9c ; (divmod + 0)
0e96 : a5 48 __ LDA T1 + 0 
0e98 : c9 36 __ CMP #$36
0e9a : 90 03 __ BCC $0e9f ; (SetUpSprites.s1030 + 0)
0e9c : 4c a2 16 JMP $16a2 ; (SetUpSprites.s1025 + 0)
.s1030:
0e9f : c9 2c __ CMP #$2c
0ea1 : b0 03 __ BCS $0ea6 ; (SetUpSprites.s1029 + 0)
0ea3 : 4c a2 16 JMP $16a2 ; (SetUpSprites.s1025 + 0)
.s1029:
0ea6 : f0 04 __ BEQ $0eac ; (SetUpSprites.s21 + 0)
.s1028:
0ea8 : c9 34 __ CMP #$34
0eaa : d0 04 __ BNE $0eb0 ; (SetUpSprites.s1027 + 0)
.s21:
0eac : a9 0a __ LDA #$0a
0eae : d0 0e __ BNE $0ebe ; (SetUpSprites.s218 + 0)
.s1027:
0eb0 : c9 2d __ CMP #$2d
0eb2 : f0 04 __ BEQ $0eb8 ; (SetUpSprites.s25 + 0)
.s1026:
0eb4 : c9 35 __ CMP #$35
0eb6 : d0 04 __ BNE $0ebc ; (SetUpSprites.s26 + 0)
.s25:
0eb8 : a9 0b __ LDA #$0b
0eba : d0 02 __ BNE $0ebe ; (SetUpSprites.s218 + 0)
.s26:
0ebc : a9 04 __ LDA #$04
.s218:
0ebe : 8d 23 9f STA $9f23 
0ec1 : a9 00 __ LDA #$00
0ec3 : 8d 23 9f STA $9f23 
0ec6 : e6 49 __ INC T2 + 0 
0ec8 : 10 be __ BPL $0e88 ; (SetUpSprites.l14 + 0)
.s11:
0eca : e6 48 __ INC T1 + 0 
0ecc : a5 48 __ LDA T1 + 0 
0ece : c9 3c __ CMP #$3c
0ed0 : 90 b2 __ BCC $0e84 ; (SetUpSprites.l10 + 0)
.s12:
0ed2 : a9 e0 __ LDA #$e0
0ed4 : 85 2d __ STA P0 
0ed6 : a9 54 __ LDA #$54
0ed8 : 85 2e __ STA P1 
0eda : a9 01 __ LDA #$01
0edc : 85 2f __ STA P2 
0ede : a9 00 __ LDA #$00
0ee0 : 85 30 __ STA P3 
0ee2 : 85 33 __ STA P6 
0ee4 : a9 02 __ LDA #$02
0ee6 : 85 34 __ STA P7 
0ee8 : a9 2f __ LDA #$2f
0eea : 85 31 __ STA P4 
0eec : a9 21 __ LDA #$21
0eee : 85 32 __ STA P5 
0ef0 : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
0ef3 : a9 20 __ LDA #$20
0ef5 : 85 2d __ STA P0 
0ef7 : a9 57 __ LDA #$57
0ef9 : 85 2e __ STA P1 
0efb : a9 02 __ LDA #$02
0efd : 85 34 __ STA P7 
0eff : a9 2f __ LDA #$2f
0f01 : 85 31 __ STA P4 
0f03 : a9 23 __ LDA #$23
0f05 : 85 32 __ STA P5 
0f07 : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
0f0a : a9 00 __ LDA #$00
0f0c : 85 2d __ STA P0 
0f0e : a9 a7 __ LDA #$a7
0f10 : 85 2e __ STA P1 
0f12 : a9 0a __ LDA #$0a
0f14 : 85 2f __ STA P2 
0f16 : 85 34 __ STA P7 
0f18 : a9 02 __ LDA #$02
0f1a : 85 31 __ STA P4 
0f1c : 85 32 __ STA P5 
0f1e : a9 03 __ LDA #$03
0f20 : 85 33 __ STA P6 
0f22 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
0f25 : a9 68 __ LDA #$68
0f27 : 85 2e __ STA P1 
0f29 : a9 00 __ LDA #$00
0f2b : 85 2f __ STA P2 
0f2d : a9 b6 __ LDA #$b6
0f2f : 85 30 __ STA P3 
0f31 : a9 01 __ LDA #$01
0f33 : 85 31 __ STA P4 
0f35 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
0f38 : a9 01 __ LDA #$01
0f3a : 85 2d __ STA P0 
0f3c : a9 b9 __ LDA #$b9
0f3e : 85 2e __ STA P1 
0f40 : a9 0a __ LDA #$0a
0f42 : 85 2f __ STA P2 
0f44 : a9 00 __ LDA #$00
0f46 : 85 30 __ STA P3 
0f48 : a9 02 __ LDA #$02
0f4a : 85 31 __ STA P4 
0f4c : a9 09 __ LDA #$09
0f4e : 85 34 __ STA P7 
0f50 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
0f53 : a9 f0 __ LDA #$f0
0f55 : 85 2e __ STA P1 
0f57 : a9 01 __ LDA #$01
0f59 : 85 2f __ STA P2 
0f5b : 85 31 __ STA P4 
0f5d : a9 b6 __ LDA #$b6
0f5f : 85 30 __ STA P3 
0f61 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
0f64 : a9 00 __ LDA #$00
0f66 : 85 2d __ STA P0 
0f68 : 85 30 __ STA P3 
0f6a : 85 33 __ STA P6 
0f6c : a9 30 __ LDA #$30
0f6e : 85 2e __ STA P1 
0f70 : a9 01 __ LDA #$01
0f72 : 85 34 __ STA P7 
0f74 : a9 00 __ LDA #$00
0f76 : 85 31 __ STA P4 
0f78 : a9 26 __ LDA #$26
0f7a : 85 32 __ STA P5 
0f7c : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
0f7f : a9 16 __ LDA #$16
0f81 : 85 2d __ STA P0 
0f83 : a9 80 __ LDA #$80
0f85 : 85 2e __ STA P1 
0f87 : a9 09 __ LDA #$09
0f89 : 85 2f __ STA P2 
0f8b : a9 01 __ LDA #$01
0f8d : 85 31 __ STA P4 
0f8f : 85 34 __ STA P7 
0f91 : a9 02 __ LDA #$02
0f93 : 85 32 __ STA P5 
0f95 : a9 03 __ LDA #$03
0f97 : 85 33 __ STA P6 
0f99 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
0f9c : a9 30 __ LDA #$30
0f9e : 85 2e __ STA P1 
0fa0 : a9 01 __ LDA #$01
0fa2 : 85 2f __ STA P2 
0fa4 : a9 b8 __ LDA #$b8
0fa6 : 85 30 __ STA P3 
0fa8 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
0fab : a9 20 __ LDA #$20
0fad : 85 2d __ STA P0 
0faf : a9 35 __ LDA #$35
0fb1 : 85 2e __ STA P1 
0fb3 : a9 00 __ LDA #$00
0fb5 : 85 30 __ STA P3 
0fb7 : 85 33 __ STA P6 
0fb9 : a9 02 __ LDA #$02
0fbb : 85 34 __ STA P7 
0fbd : a9 00 __ LDA #$00
0fbf : 85 31 __ STA P4 
0fc1 : a9 27 __ LDA #$27
0fc3 : 85 32 __ STA P5 
0fc5 : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
0fc8 : a9 17 __ LDA #$17
0fca : 85 2d __ STA P0 
0fcc : a9 a9 __ LDA #$a9
0fce : 85 2e __ STA P1 
0fd0 : a9 09 __ LDA #$09
0fd2 : 85 2f __ STA P2 
0fd4 : a9 02 __ LDA #$02
0fd6 : 85 31 __ STA P4 
0fd8 : 85 32 __ STA P5 
0fda : a9 03 __ LDA #$03
0fdc : 85 33 __ STA P6 
0fde : a9 01 __ LDA #$01
0fe0 : 85 34 __ STA P7 
0fe2 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
0fe5 : a9 fc __ LDA #$fc
0fe7 : 85 2e __ STA P1 
0fe9 : a9 00 __ LDA #$00
0feb : 85 2f __ STA P2 
0fed : a9 b8 __ LDA #$b8
0fef : 85 30 __ STA P3 
0ff1 : a9 01 __ LDA #$01
0ff3 : 85 31 __ STA P4 
0ff5 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
0ff8 : a9 18 __ LDA #$18
0ffa : 85 2d __ STA P0 
0ffc : a9 a9 __ LDA #$a9
0ffe : 85 2e __ STA P1 
1000 : a9 09 __ LDA #$09
1002 : 85 2f __ STA P2 
1004 : a9 00 __ LDA #$00
1006 : 85 30 __ STA P3 
1008 : a9 02 __ LDA #$02
100a : 85 31 __ STA P4 
100c : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
100f : a9 4c __ LDA #$4c
1011 : 85 2e __ STA P1 
1013 : a9 01 __ LDA #$01
1015 : 85 2f __ STA P2 
1017 : 85 31 __ STA P4 
1019 : a9 b8 __ LDA #$b8
101b : 85 30 __ STA P3 
101d : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1020 : a9 01 __ LDA #$01
1022 : 85 2e __ STA P1 
1024 : a9 00 __ LDA #$00
1026 : 85 2f __ STA P2 
1028 : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
102b : a9 10 __ LDA #$10
102d : 85 2d __ STA P0 
102f : a9 20 __ LDA #$20
1031 : 85 30 __ STA P3 
1033 : a9 00 __ LDA #$00
1035 : 85 31 __ STA P4 
1037 : a9 2f __ LDA #$2f
1039 : 85 2e __ STA P1 
103b : a9 25 __ LDA #$25
103d : 85 2f __ STA P2 
103f : 20 7e 18 JSR $187e ; (vera_pal_putn.s0 + 0)
1042 : a9 00 __ LDA #$00
1044 : 85 2d __ STA P0 
1046 : 85 30 __ STA P3 
1048 : 85 34 __ STA P7 
104a : a9 35 __ LDA #$35
104c : 85 2e __ STA P1 
104e : a9 01 __ LDA #$01
1050 : 85 2f __ STA P2 
1052 : a9 20 __ LDA #$20
1054 : 85 33 __ STA P6 
1056 : a9 4f __ LDA #$4f
1058 : 85 31 __ STA P4 
105a : a9 25 __ LDA #$25
105c : 85 32 __ STA P5 
105e : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
1061 : a9 00 __ LDA #$00
1063 : 85 48 __ STA T1 + 0 
1065 : 85 49 __ STA T2 + 0 
1067 : a9 03 __ LDA #$03
1069 : 85 33 __ STA P6 
106b : a9 02 __ LDA #$02
106d : 85 34 __ STA P7 
106f : 18 __ __ CLC
.l1046:
1070 : a9 a8 __ LDA #$a8
1072 : 85 2e __ STA P1 
1074 : a9 09 __ LDA #$09
1076 : 85 2f __ STA P2 
1078 : a9 00 __ LDA #$00
107a : 85 30 __ STA P3 
107c : 85 31 __ STA P4 
107e : 85 32 __ STA P5 
1080 : a5 48 __ LDA T1 + 0 
1082 : 69 19 __ ADC #$19
1084 : 85 2d __ STA P0 
1086 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1089 : a9 b8 __ LDA #$b8
108b : 85 30 __ STA P3 
108d : a9 01 __ LDA #$01
108f : 85 31 __ STA P4 
1091 : 38 __ __ SEC
1092 : a5 49 __ LDA T2 + 0 
1094 : e9 fc __ SBC #$fc
1096 : 85 2e __ STA P1 
1098 : a9 00 __ LDA #$00
109a : e9 03 __ SBC #$03
109c : 85 2f __ STA P2 
109e : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
10a1 : 18 __ __ CLC
10a2 : a5 49 __ LDA T2 + 0 
10a4 : 69 0c __ ADC #$0c
10a6 : 85 49 __ STA T2 + 0 
10a8 : e6 48 __ INC T1 + 0 
10aa : a5 48 __ LDA T1 + 0 
10ac : c9 08 __ CMP #$08
10ae : 90 c0 __ BCC $1070 ; (SetUpSprites.l1046 + 0)
.s77:
10b0 : a9 00 __ LDA #$00
10b2 : 85 48 __ STA T1 + 0 
10b4 : 85 49 __ STA T2 + 0 
10b6 : a9 03 __ LDA #$03
10b8 : 85 33 __ STA P6 
10ba : 85 34 __ STA P7 
10bc : 18 __ __ CLC
.l1048:
10bd : a9 a8 __ LDA #$a8
10bf : 85 2e __ STA P1 
10c1 : a9 09 __ LDA #$09
10c3 : 85 2f __ STA P2 
10c5 : a9 00 __ LDA #$00
10c7 : 85 30 __ STA P3 
10c9 : 85 31 __ STA P4 
10cb : a5 48 __ LDA T1 + 0 
10cd : 69 21 __ ADC #$21
10cf : 85 2d __ STA P0 
10d1 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
10d4 : a9 c4 __ LDA #$c4
10d6 : 85 30 __ STA P3 
10d8 : a9 01 __ LDA #$01
10da : 85 31 __ STA P4 
10dc : 38 __ __ SEC
10dd : a5 49 __ LDA T2 + 0 
10df : e9 fc __ SBC #$fc
10e1 : 85 2e __ STA P1 
10e3 : a9 00 __ LDA #$00
10e5 : e9 03 __ SBC #$03
10e7 : 85 2f __ STA P2 
10e9 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
10ec : 18 __ __ CLC
10ed : a5 49 __ LDA T2 + 0 
10ef : 69 0c __ ADC #$0c
10f1 : 85 49 __ STA T2 + 0 
10f3 : e6 48 __ INC T1 + 0 
10f5 : a5 48 __ LDA T1 + 0 
10f7 : c9 08 __ CMP #$08
10f9 : 90 c2 __ BCC $10bd ; (SetUpSprites.l1048 + 0)
.s81:
10fb : a9 00 __ LDA #$00
10fd : 85 48 __ STA T1 + 0 
10ff : 85 49 __ STA T2 + 0 
1101 : a9 03 __ LDA #$03
1103 : 85 33 __ STA P6 
1105 : a9 04 __ LDA #$04
1107 : 85 34 __ STA P7 
1109 : 18 __ __ CLC
.l1050:
110a : a9 a8 __ LDA #$a8
110c : 85 2e __ STA P1 
110e : a9 09 __ LDA #$09
1110 : 85 2f __ STA P2 
1112 : a9 00 __ LDA #$00
1114 : 85 30 __ STA P3 
1116 : 85 31 __ STA P4 
1118 : a5 48 __ LDA T1 + 0 
111a : 69 29 __ ADC #$29
111c : 85 2d __ STA P0 
111e : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1121 : a9 b8 __ LDA #$b8
1123 : 85 30 __ STA P3 
1125 : a9 01 __ LDA #$01
1127 : 85 31 __ STA P4 
1129 : 38 __ __ SEC
112a : a9 6c __ LDA #$6c
112c : e5 49 __ SBC T2 + 0 
112e : 85 2e __ STA P1 
1130 : a9 02 __ LDA #$02
1132 : e9 04 __ SBC #$04
1134 : 85 2f __ STA P2 
1136 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1139 : 18 __ __ CLC
113a : a5 49 __ LDA T2 + 0 
113c : 69 0c __ ADC #$0c
113e : 85 49 __ STA T2 + 0 
1140 : e6 48 __ INC T1 + 0 
1142 : a5 48 __ LDA T1 + 0 
1144 : c9 08 __ CMP #$08
1146 : 90 c2 __ BCC $110a ; (SetUpSprites.l1050 + 0)
.s85:
1148 : a9 00 __ LDA #$00
114a : 85 48 __ STA T1 + 0 
114c : a9 03 __ LDA #$03
114e : 85 33 __ STA P6 
1150 : a9 04 __ LDA #$04
1152 : 85 34 __ STA P7 
.l87:
1154 : 38 __ __ SEC
1155 : a9 00 __ LDA #$00
1157 : e5 48 __ SBC T1 + 0 
1159 : 29 0c __ AND #$0c
115b : 49 ff __ EOR #$ff
115d : 38 __ __ SEC
115e : 69 6c __ ADC #$6c
1160 : 85 49 __ STA T2 + 0 
1162 : a9 02 __ LDA #$02
1164 : e9 00 __ SBC #$00
1166 : 85 4a __ STA T2 + 1 
1168 : 18 __ __ CLC
1169 : a5 48 __ LDA T1 + 0 
116b : 69 31 __ ADC #$31
116d : 85 2d __ STA P0 
116f : a9 02 __ LDA #$02
1171 : 85 4b __ STA T4 + 0 
.l1034:
1173 : a9 a8 __ LDA #$a8
1175 : 85 2e __ STA P1 
1177 : a9 09 __ LDA #$09
1179 : 85 2f __ STA P2 
117b : a9 00 __ LDA #$00
117d : 85 30 __ STA P3 
117f : 85 31 __ STA P4 
1181 : 85 32 __ STA P5 
1183 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1186 : a5 49 __ LDA T2 + 0 
1188 : 85 2e __ STA P1 
118a : a5 4a __ LDA T2 + 1 
118c : 85 2f __ STA P2 
118e : a9 b8 __ LDA #$b8
1190 : 85 30 __ STA P3 
1192 : a9 01 __ LDA #$01
1194 : 85 31 __ STA P4 
1196 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1199 : c6 4b __ DEC T4 + 0 
119b : d0 d6 __ BNE $1173 ; (SetUpSprites.l1034 + 0)
.s88:
119d : e6 48 __ INC T1 + 0 
119f : a5 48 __ LDA T1 + 0 
11a1 : c9 02 __ CMP #$02
11a3 : 90 af __ BCC $1154 ; (SetUpSprites.l87 + 0)
.s89:
11a5 : a9 60 __ LDA #$60
11a7 : 85 2d __ STA P0 
11a9 : a9 4f __ LDA #$4f
11ab : 85 2e __ STA P1 
11ad : a9 01 __ LDA #$01
11af : 85 2f __ STA P2 
11b1 : 85 34 __ STA P7 
11b3 : a9 00 __ LDA #$00
11b5 : 85 30 __ STA P3 
11b7 : 85 33 __ STA P6 
11b9 : a9 00 __ LDA #$00
11bb : 85 31 __ STA P4 
11bd : a9 29 __ LDA #$29
11bf : 85 32 __ STA P5 
11c1 : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
11c4 : a9 33 __ LDA #$33
11c6 : 85 2d __ STA P0 
11c8 : a9 7b __ LDA #$7b
11ca : 85 2e __ STA P1 
11cc : a9 0a __ LDA #$0a
11ce : 85 2f __ STA P2 
11d0 : a9 01 __ LDA #$01
11d2 : 85 31 __ STA P4 
11d4 : a9 02 __ LDA #$02
11d6 : 85 32 __ STA P5 
11d8 : a9 03 __ LDA #$03
11da : 85 33 __ STA P6 
11dc : a9 06 __ LDA #$06
11de : 85 34 __ STA P7 
11e0 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
11e3 : a9 00 __ LDA #$00
11e5 : 85 2e __ STA P1 
11e7 : 85 31 __ STA P4 
11e9 : a9 01 __ LDA #$01
11eb : 85 2f __ STA P2 
11ed : a9 78 __ LDA #$78
11ef : 85 30 __ STA P3 
11f1 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
11f4 : a9 20 __ LDA #$20
11f6 : 85 2d __ STA P0 
11f8 : a9 3f __ LDA #$3f
11fa : 85 2e __ STA P1 
11fc : a9 00 __ LDA #$00
11fe : 85 30 __ STA P3 
1200 : 85 33 __ STA P6 
1202 : a9 04 __ LDA #$04
1204 : 85 34 __ STA P7 
1206 : a9 00 __ LDA #$00
1208 : 85 31 __ STA P4 
120a : a9 2a __ LDA #$2a
120c : 85 32 __ STA P5 
120e : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
1211 : a9 34 __ LDA #$34
1213 : 85 2d __ STA P0 
1215 : a9 f9 __ LDA #$f9
1217 : 85 2e __ STA P1 
1219 : a9 09 __ LDA #$09
121b : 85 2f __ STA P2 
121d : a9 03 __ LDA #$03
121f : 85 31 __ STA P4 
1221 : 85 33 __ STA P6 
1223 : a9 02 __ LDA #$02
1225 : 85 32 __ STA P5 
1227 : a9 05 __ LDA #$05
1229 : 85 34 __ STA P7 
122b : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
122e : a9 00 __ LDA #$00
1230 : 85 2e __ STA P1 
1232 : 85 31 __ STA P4 
1234 : a9 01 __ LDA #$01
1236 : 85 2f __ STA P2 
1238 : a9 78 __ LDA #$78
123a : 85 30 __ STA P3 
123c : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
123f : a9 35 __ LDA #$35
1241 : 85 2d __ STA P0 
1243 : a9 19 __ LDA #$19
1245 : 85 2e __ STA P1 
1247 : a9 0a __ LDA #$0a
1249 : 85 2f __ STA P2 
124b : a9 00 __ LDA #$00
124d : 85 30 __ STA P3 
124f : a9 03 __ LDA #$03
1251 : 85 31 __ STA P4 
1253 : a9 07 __ LDA #$07
1255 : 85 33 __ STA P6 
1257 : a9 06 __ LDA #$06
1259 : 85 34 __ STA P7 
125b : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
125e : a9 00 __ LDA #$00
1260 : 85 2e __ STA P1 
1262 : 85 31 __ STA P4 
1264 : a9 01 __ LDA #$01
1266 : 85 2f __ STA P2 
1268 : a9 e8 __ LDA #$e8
126a : 85 30 __ STA P3 
126c : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
126f : a9 36 __ LDA #$36
1271 : 85 2d __ STA P0 
1273 : a9 19 __ LDA #$19
1275 : 85 2e __ STA P1 
1277 : a9 0a __ LDA #$0a
1279 : 85 2f __ STA P2 
127b : a9 00 __ LDA #$00
127d : 85 30 __ STA P3 
127f : a9 03 __ LDA #$03
1281 : 85 31 __ STA P4 
1283 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1286 : a9 40 __ LDA #$40
1288 : 85 2e __ STA P1 
128a : a9 01 __ LDA #$01
128c : 85 2f __ STA P2 
128e : a9 e8 __ LDA #$e8
1290 : 85 30 __ STA P3 
1292 : a9 00 __ LDA #$00
1294 : 85 31 __ STA P4 
1296 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1299 : a9 01 __ LDA #$01
129b : 85 2e __ STA P1 
129d : a9 00 __ LDA #$00
129f : 85 2f __ STA P2 
12a1 : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
12a4 : a9 37 __ LDA #$37
12a6 : 85 2d __ STA P0 
12a8 : a9 19 __ LDA #$19
12aa : 85 2e __ STA P1 
12ac : a9 0a __ LDA #$0a
12ae : 85 2f __ STA P2 
12b0 : a9 00 __ LDA #$00
12b2 : 85 30 __ STA P3 
12b4 : a9 03 __ LDA #$03
12b6 : 85 31 __ STA P4 
12b8 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
12bb : a9 00 __ LDA #$00
12bd : 85 2e __ STA P1 
12bf : a9 01 __ LDA #$01
12c1 : 85 2f __ STA P2 
12c3 : 85 31 __ STA P4 
12c5 : a9 08 __ LDA #$08
12c7 : 85 30 __ STA P3 
12c9 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
12cc : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
12cf : a9 38 __ LDA #$38
12d1 : 85 2d __ STA P0 
12d3 : a9 19 __ LDA #$19
12d5 : 85 2e __ STA P1 
12d7 : a9 0a __ LDA #$0a
12d9 : 85 2f __ STA P2 
12db : a9 00 __ LDA #$00
12dd : 85 30 __ STA P3 
12df : a9 03 __ LDA #$03
12e1 : 85 31 __ STA P4 
12e3 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
12e6 : a9 40 __ LDA #$40
12e8 : 85 2e __ STA P1 
12ea : a9 01 __ LDA #$01
12ec : 85 2f __ STA P2 
12ee : 85 31 __ STA P4 
12f0 : a9 08 __ LDA #$08
12f2 : 85 30 __ STA P3 
12f4 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
12f7 : a9 01 __ LDA #$01
12f9 : 85 2e __ STA P1 
12fb : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
12fe : a9 20 __ LDA #$20
1300 : 85 2d __ STA P0 
1302 : a9 37 __ LDA #$37
1304 : 85 2e __ STA P1 
1306 : a9 00 __ LDA #$00
1308 : 85 30 __ STA P3 
130a : 85 33 __ STA P6 
130c : a9 08 __ LDA #$08
130e : 85 34 __ STA P7 
1310 : a9 00 __ LDA #$00
1312 : 85 31 __ STA P4 
1314 : a9 2e __ LDA #$2e
1316 : 85 32 __ STA P5 
1318 : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
131b : a9 00 __ LDA #$00
131d : 85 48 __ STA T1 + 0 
131f : 85 49 __ STA T2 + 0 
1321 : 85 4a __ STA T2 + 1 
1323 : a9 02 __ LDA #$02
1325 : 85 33 __ STA P6 
1327 : a9 05 __ LDA #$05
1329 : 85 34 __ STA P7 
132b : a9 03 __ LDA #$03
132d : 85 32 __ STA P5 
132f : 18 __ __ CLC
.l1052:
1330 : a9 b9 __ LDA #$b9
1332 : 85 2e __ STA P1 
1334 : a9 09 __ LDA #$09
1336 : 85 2f __ STA P2 
1338 : a9 00 __ LDA #$00
133a : 85 30 __ STA P3 
133c : a9 03 __ LDA #$03
133e : 85 31 __ STA P4 
1340 : a5 48 __ LDA T1 + 0 
1342 : 69 39 __ ADC #$39
1344 : 85 2d __ STA P0 
1346 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1349 : a9 20 __ LDA #$20
134b : 85 2e __ STA P1 
134d : a9 01 __ LDA #$01
134f : 85 2f __ STA P2 
1351 : 38 __ __ SEC
1352 : a5 49 __ LDA T2 + 0 
1354 : e9 60 __ SBC #$60
1356 : 85 30 __ STA P3 
1358 : a5 4a __ LDA T2 + 1 
135a : e9 00 __ SBC #$00
135c : 85 31 __ STA P4 
135e : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1361 : 18 __ __ CLC
1362 : a5 49 __ LDA T2 + 0 
1364 : 69 40 __ ADC #$40
1366 : 85 49 __ STA T2 + 0 
1368 : 90 02 __ BCC $136c ; (SetUpSprites.s1055 + 0)
.s1054:
136a : e6 4a __ INC T2 + 1 
.s1055:
136c : e6 48 __ INC T1 + 0 
136e : a5 48 __ LDA T1 + 0 
1370 : c9 07 __ CMP #$07
1372 : 90 bc __ BCC $1330 ; (SetUpSprites.l1052 + 0)
.s97:
1374 : a9 20 __ LDA #$20
1376 : 85 2d __ STA P0 
1378 : a9 47 __ LDA #$47
137a : 85 2e __ STA P1 
137c : a9 00 __ LDA #$00
137e : 85 30 __ STA P3 
1380 : 85 33 __ STA P6 
1382 : a9 08 __ LDA #$08
1384 : 85 34 __ STA P7 
1386 : a9 00 __ LDA #$00
1388 : 85 31 __ STA P4 
138a : a9 36 __ LDA #$36
138c : 85 32 __ STA P5 
138e : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
1391 : a9 47 __ LDA #$47
1393 : 85 2d __ STA P0 
1395 : a9 39 __ LDA #$39
1397 : 85 2e __ STA P1 
1399 : a9 0a __ LDA #$0a
139b : 85 2f __ STA P2 
139d : a9 03 __ LDA #$03
139f : 85 31 __ STA P4 
13a1 : 85 32 __ STA P5 
13a3 : a9 07 __ LDA #$07
13a5 : 85 33 __ STA P6 
13a7 : a9 06 __ LDA #$06
13a9 : 85 34 __ STA P7 
13ab : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
13ae : a9 08 __ LDA #$08
13b0 : 85 2e __ STA P1 
13b2 : 85 30 __ STA P3 
13b4 : a9 00 __ LDA #$00
13b6 : 85 2f __ STA P2 
13b8 : 85 31 __ STA P4 
13ba : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
13bd : a9 48 __ LDA #$48
13bf : 85 2d __ STA P0 
13c1 : a9 39 __ LDA #$39
13c3 : 85 2e __ STA P1 
13c5 : a9 0a __ LDA #$0a
13c7 : 85 2f __ STA P2 
13c9 : a9 00 __ LDA #$00
13cb : 85 30 __ STA P3 
13cd : a9 03 __ LDA #$03
13cf : 85 31 __ STA P4 
13d1 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
13d4 : a9 48 __ LDA #$48
13d6 : 85 2e __ STA P1 
13d8 : a9 00 __ LDA #$00
13da : 85 2f __ STA P2 
13dc : 85 31 __ STA P4 
13de : a9 08 __ LDA #$08
13e0 : 85 30 __ STA P3 
13e2 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
13e5 : a9 01 __ LDA #$01
13e7 : 85 2e __ STA P1 
13e9 : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
13ec : a9 49 __ LDA #$49
13ee : 85 2d __ STA P0 
13f0 : a9 39 __ LDA #$39
13f2 : 85 2e __ STA P1 
13f4 : a9 0a __ LDA #$0a
13f6 : 85 2f __ STA P2 
13f8 : a9 00 __ LDA #$00
13fa : 85 30 __ STA P3 
13fc : a9 03 __ LDA #$03
13fe : 85 31 __ STA P4 
1400 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1403 : a9 48 __ LDA #$48
1405 : 85 2e __ STA P1 
1407 : 85 30 __ STA P3 
1409 : a9 00 __ LDA #$00
140b : 85 2f __ STA P2 
140d : 85 31 __ STA P4 
140f : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1412 : a9 01 __ LDA #$01
1414 : 85 2e __ STA P1 
1416 : 85 2f __ STA P2 
1418 : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
141b : a9 4a __ LDA #$4a
141d : 85 2d __ STA P0 
141f : a9 39 __ LDA #$39
1421 : 85 2e __ STA P1 
1423 : a9 0a __ LDA #$0a
1425 : 85 2f __ STA P2 
1427 : a9 00 __ LDA #$00
1429 : 85 30 __ STA P3 
142b : a9 03 __ LDA #$03
142d : 85 31 __ STA P4 
142f : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1432 : a9 08 __ LDA #$08
1434 : 85 2e __ STA P1 
1436 : a9 00 __ LDA #$00
1438 : 85 2f __ STA P2 
143a : 85 31 __ STA P4 
143c : a9 48 __ LDA #$48
143e : 85 30 __ STA P3 
1440 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1443 : a9 00 __ LDA #$00
1445 : 85 2e __ STA P1 
1447 : a9 01 __ LDA #$01
1449 : 85 2f __ STA P2 
144b : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
144e : a9 20 __ LDA #$20
1450 : 85 2d __ STA P0 
1452 : a9 47 __ LDA #$47
1454 : 85 2e __ STA P1 
1456 : a9 00 __ LDA #$00
1458 : 85 30 __ STA P3 
145a : a9 00 __ LDA #$00
145c : 85 31 __ STA P4 
145e : a9 36 __ LDA #$36
1460 : 85 32 __ STA P5 
1462 : a9 00 __ LDA #$00
1464 : 85 33 __ STA P6 
1466 : a9 08 __ LDA #$08
1468 : 85 34 __ STA P7 
146a : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
146d : a9 4b __ LDA #$4b
146f : 85 2d __ STA P0 
1471 : a9 39 __ LDA #$39
1473 : 85 2e __ STA P1 
1475 : a9 0a __ LDA #$0a
1477 : 85 2f __ STA P2 
1479 : a9 03 __ LDA #$03
147b : 85 31 __ STA P4 
147d : 85 32 __ STA P5 
147f : a9 07 __ LDA #$07
1481 : 85 33 __ STA P6 
1483 : a9 06 __ LDA #$06
1485 : 85 34 __ STA P7 
1487 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
148a : a9 f8 __ LDA #$f8
148c : 85 2e __ STA P1 
148e : a9 01 __ LDA #$01
1490 : 85 2f __ STA P2 
1492 : a9 08 __ LDA #$08
1494 : 85 30 __ STA P3 
1496 : a9 00 __ LDA #$00
1498 : 85 31 __ STA P4 
149a : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
149d : a9 4c __ LDA #$4c
149f : 85 2d __ STA P0 
14a1 : a9 39 __ LDA #$39
14a3 : 85 2e __ STA P1 
14a5 : a9 0a __ LDA #$0a
14a7 : 85 2f __ STA P2 
14a9 : a9 00 __ LDA #$00
14ab : 85 30 __ STA P3 
14ad : a9 03 __ LDA #$03
14af : 85 31 __ STA P4 
14b1 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
14b4 : a9 38 __ LDA #$38
14b6 : 85 2e __ STA P1 
14b8 : a9 02 __ LDA #$02
14ba : 85 2f __ STA P2 
14bc : a9 08 __ LDA #$08
14be : 85 30 __ STA P3 
14c0 : a9 00 __ LDA #$00
14c2 : 85 31 __ STA P4 
14c4 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
14c7 : a9 01 __ LDA #$01
14c9 : 85 2e __ STA P1 
14cb : a9 00 __ LDA #$00
14cd : 85 2f __ STA P2 
14cf : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
14d2 : a9 4d __ LDA #$4d
14d4 : 85 2d __ STA P0 
14d6 : a9 39 __ LDA #$39
14d8 : 85 2e __ STA P1 
14da : a9 0a __ LDA #$0a
14dc : 85 2f __ STA P2 
14de : a9 00 __ LDA #$00
14e0 : 85 30 __ STA P3 
14e2 : a9 03 __ LDA #$03
14e4 : 85 31 __ STA P4 
14e6 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
14e9 : a9 38 __ LDA #$38
14eb : 85 2e __ STA P1 
14ed : a9 02 __ LDA #$02
14ef : 85 2f __ STA P2 
14f1 : a9 48 __ LDA #$48
14f3 : 85 30 __ STA P3 
14f5 : a9 00 __ LDA #$00
14f7 : 85 31 __ STA P4 
14f9 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
14fc : a9 01 __ LDA #$01
14fe : 85 2e __ STA P1 
1500 : 85 2f __ STA P2 
1502 : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
1505 : a9 4e __ LDA #$4e
1507 : 85 2d __ STA P0 
1509 : a9 39 __ LDA #$39
150b : 85 2e __ STA P1 
150d : a9 0a __ LDA #$0a
150f : 85 2f __ STA P2 
1511 : a9 00 __ LDA #$00
1513 : 85 30 __ STA P3 
1515 : a9 03 __ LDA #$03
1517 : 85 31 __ STA P4 
1519 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
151c : a9 f8 __ LDA #$f8
151e : 85 2e __ STA P1 
1520 : a9 01 __ LDA #$01
1522 : 85 2f __ STA P2 
1524 : a9 48 __ LDA #$48
1526 : 85 30 __ STA P3 
1528 : a9 00 __ LDA #$00
152a : 85 31 __ STA P4 
152c : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
152f : a9 00 __ LDA #$00
1531 : 85 2e __ STA P1 
1533 : 20 41 18 JSR $1841 ; (vera_spr_flip.s0 + 0)
1536 : a9 60 __ LDA #$60
1538 : 85 2d __ STA P0 
153a : a9 51 __ LDA #$51
153c : 85 2e __ STA P1 
153e : a9 00 __ LDA #$00
1540 : 85 30 __ STA P3 
1542 : 85 33 __ STA P6 
1544 : a9 02 __ LDA #$02
1546 : 85 34 __ STA P7 
1548 : a9 00 __ LDA #$00
154a : 85 31 __ STA P4 
154c : a9 3e __ LDA #$3e
154e : 85 32 __ STA P5 
1550 : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
1553 : a9 a0 __ LDA #$a0
1555 : 85 2d __ STA P0 
1557 : a9 50 __ LDA #$50
1559 : 85 2e __ STA P1 
155b : a9 80 __ LDA #$80
155d : 85 33 __ STA P6 
155f : a9 00 __ LDA #$00
1561 : 85 34 __ STA P7 
1563 : a9 6f __ LDA #$6f
1565 : 85 31 __ STA P4 
1567 : a9 25 __ LDA #$25
1569 : 85 32 __ STA P5 
156b : 20 49 17 JSR $1749 ; (vram_putn.s0 + 0)
156e : a9 00 __ LDA #$00
1570 : 85 47 __ STA T0 + 0 
1572 : a9 0a __ LDA #$0a
1574 : 85 2f __ STA P2 
1576 : a9 02 __ LDA #$02
1578 : 85 33 __ STA P6 
157a : a9 08 __ LDA #$08
157c : 85 34 __ STA P7 
.l99:
157e : a9 85 __ LDA #$85
1580 : 85 2e __ STA P1 
1582 : a9 01 __ LDA #$01
1584 : 85 31 __ STA P4 
1586 : 85 32 __ STA P5 
1588 : 18 __ __ CLC
1589 : a5 47 __ LDA T0 + 0 
158b : 69 4f __ ADC #$4f
158d : 85 2d __ STA P0 
158f : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
1592 : a5 47 __ LDA T0 + 0 
1594 : c9 1f __ CMP #$1f
1596 : d0 0d __ BNE $15a5 ; (SetUpSprites.s227 + 0)
.s102:
1598 : a9 8b __ LDA #$8b
159a : 85 2e __ STA P1 
159c : a9 02 __ LDA #$02
159e : 85 31 __ STA P4 
15a0 : 85 32 __ STA P5 
15a2 : 20 ab 17 JSR $17ab ; (vera_spr_set.s0 + 0)
.s227:
15a5 : e6 47 __ INC T0 + 0 
15a7 : a5 47 __ LDA T0 + 0 
15a9 : c9 20 __ CMP #$20
15ab : 90 d1 __ BCC $157e ; (SetUpSprites.l99 + 0)
.s101:
15ad : a9 20 __ LDA #$20
15af : 85 37 __ STA P10 
15b1 : a9 40 __ LDA #$40
15b3 : 8d fc 9e STA $9efc ; (sstack + 0)
15b6 : a9 fa __ LDA #$fa
15b8 : 8d fd 9e STA $9efd ; (sstack + 1)
15bb : a9 01 __ LDA #$01
15bd : 8d fe 9e STA $9efe ; (sstack + 2)
15c0 : a9 00 __ LDA #$00
15c2 : 8d ff 9e STA $9eff ; (sstack + 3)
15c5 : a9 00 __ LDA #$00
15c7 : 85 35 __ STA P8 
15c9 : a9 40 __ LDA #$40
15cb : 85 36 __ STA P9 
15cd : 20 c7 18 JSR $18c7 ; (SetPaletteColours.s0 + 0)
15d0 : a9 60 __ LDA #$60
15d2 : 8d fc 9e STA $9efc ; (sstack + 0)
15d5 : a9 fa __ LDA #$fa
15d7 : 8d fd 9e STA $9efd ; (sstack + 1)
15da : a9 01 __ LDA #$01
15dc : 8d fe 9e STA $9efe ; (sstack + 2)
15df : a9 00 __ LDA #$00
15e1 : 8d ff 9e STA $9eff ; (sstack + 3)
15e4 : a9 20 __ LDA #$20
15e6 : 85 35 __ STA P8 
15e8 : a9 40 __ LDA #$40
15ea : 85 36 __ STA P9 
15ec : 20 c7 18 JSR $18c7 ; (SetPaletteColours.s0 + 0)
15ef : a9 80 __ LDA #$80
15f1 : 8d fc 9e STA $9efc ; (sstack + 0)
15f4 : a9 fa __ LDA #$fa
15f6 : 8d fd 9e STA $9efd ; (sstack + 1)
15f9 : a9 01 __ LDA #$01
15fb : 8d fe 9e STA $9efe ; (sstack + 2)
15fe : a9 00 __ LDA #$00
1600 : 8d ff 9e STA $9eff ; (sstack + 3)
1603 : a9 40 __ LDA #$40
1605 : 85 35 __ STA P8 
1607 : a9 40 __ LDA #$40
1609 : 85 36 __ STA P9 
160b : 20 c7 18 JSR $18c7 ; (SetPaletteColours.s0 + 0)
160e : a9 60 __ LDA #$60
1610 : 85 2d __ STA P0 
1612 : a9 20 __ LDA #$20
1614 : 85 30 __ STA P3 
1616 : a9 00 __ LDA #$00
1618 : 85 31 __ STA P4 
161a : a9 ef __ LDA #$ef
161c : 85 2e __ STA P1 
161e : a9 25 __ LDA #$25
1620 : 85 2f __ STA P2 
1622 : 20 7e 18 JSR $187e ; (vera_pal_putn.s0 + 0)
1625 : a9 70 __ LDA #$70
1627 : 85 2d __ STA P0 
1629 : a9 0c __ LDA #$0c
162b : 85 30 __ STA P3 
162d : a9 00 __ LDA #$00
162f : 85 31 __ STA P4 
1631 : a9 60 __ LDA #$60
1633 : 85 2e __ STA P1 
1635 : a9 40 __ LDA #$40
1637 : 85 2f __ STA P2 
1639 : 20 7e 18 JSR $187e ; (vera_pal_putn.s0 + 0)
163c : a9 80 __ LDA #$80
163e : 85 2d __ STA P0 
1640 : a9 20 __ LDA #$20
1642 : 85 30 __ STA P3 
1644 : a9 00 __ LDA #$00
1646 : 85 31 __ STA P4 
1648 : a9 6c __ LDA #$6c
164a : 85 2e __ STA P1 
164c : a9 40 __ LDA #$40
164e : 85 2f __ STA P2 
1650 : 20 7e 18 JSR $187e ; (vera_pal_putn.s0 + 0)
1653 : a9 90 __ LDA #$90
1655 : 85 2d __ STA P0 
1657 : a9 10 __ LDA #$10
1659 : 85 30 __ STA P3 
165b : a9 00 __ LDA #$00
165d : 85 31 __ STA P4 
165f : a9 8c __ LDA #$8c
1661 : 85 2e __ STA P1 
1663 : a9 40 __ LDA #$40
1665 : 85 2f __ STA P2 
1667 : 20 7e 18 JSR $187e ; (vera_pal_putn.s0 + 0)
166a : a9 a0 __ LDA #$a0
166c : 85 2d __ STA P0 
166e : a9 1a __ LDA #$1a
1670 : 85 30 __ STA P3 
1672 : a9 00 __ LDA #$00
1674 : 85 31 __ STA P4 
1676 : a9 9c __ LDA #$9c
1678 : 85 2e __ STA P1 
167a : a9 40 __ LDA #$40
167c : 85 2f __ STA P2 
167e : 20 7e 18 JSR $187e ; (vera_pal_putn.s0 + 0)
1681 : a9 20 __ LDA #$20
1683 : 85 2d __ STA P0 
1685 : a9 43 __ LDA #$43
1687 : 85 2e __ STA P1 
1689 : a9 01 __ LDA #$01
168b : 85 2f __ STA P2 
168d : a9 00 __ LDA #$00
168f : 85 30 __ STA P3 
1691 : 85 33 __ STA P6 
1693 : a9 04 __ LDA #$04
1695 : 85 34 __ STA P7 
1697 : a9 b6 __ LDA #$b6
1699 : 85 31 __ STA P4 
169b : a9 40 __ LDA #$40
169d : 85 32 __ STA P5 
169f : 4c 49 17 JMP $1749 ; (vram_putn.s0 + 0)
.s1025:
16a2 : c9 34 __ CMP #$34
16a4 : 90 05 __ BCC $16ab ; (SetUpSprites.s1024 + 0)
.s29:
16a6 : a9 09 __ LDA #$09
16a8 : 4c be 0e JMP $0ebe ; (SetUpSprites.s218 + 0)
.s1024:
16ab : a9 2c __ LDA #$2c
16ad : c5 25 __ CMP WORK + 2 
16af : a5 49 __ LDA T2 + 0 
16b1 : 90 3e __ BCC $16f1 ; (SetUpSprites.s1017 + 0)
.s1023:
16b3 : c9 09 __ CMP #$09
16b5 : 90 06 __ BCC $16bd ; (SetUpSprites.s35 + 0)
.s1022:
16b7 : a9 45 __ LDA #$45
16b9 : c5 49 __ CMP T2 + 0 
16bb : b0 05 __ BCS $16c2 ; (SetUpSprites.s1021 + 0)
.s35:
16bd : a9 00 __ LDA #$00
16bf : 4c be 0e JMP $0ebe ; (SetUpSprites.s218 + 0)
.s1021:
16c2 : a5 49 __ LDA T2 + 0 
16c4 : c9 13 __ CMP #$13
16c6 : 90 06 __ BCC $16ce ; (SetUpSprites.s39 + 0)
.s1020:
16c8 : a9 3b __ LDA #$3b
16ca : c5 49 __ CMP T2 + 0 
16cc : b0 04 __ BCS $16d2 ; (SetUpSprites.s1019 + 0)
.s39:
16ce : a9 01 __ LDA #$01
16d0 : d0 12 __ BNE $16e4 ; (SetUpSprites.s234 + 0)
.s1019:
16d2 : a5 49 __ LDA T2 + 0 
16d4 : c9 1d __ CMP #$1d
16d6 : 90 06 __ BCC $16de ; (SetUpSprites.s43 + 0)
.s1018:
16d8 : a9 31 __ LDA #$31
16da : c5 49 __ CMP T2 + 0 
16dc : b0 04 __ BCS $16e2 ; (SetUpSprites.s44 + 0)
.s43:
16de : a9 02 __ LDA #$02
16e0 : d0 02 __ BNE $16e4 ; (SetUpSprites.s234 + 0)
.s44:
16e2 : a9 03 __ LDA #$03
.s234:
16e4 : 8d 23 9f STA $9f23 
16e7 : a9 00 __ LDA #$00
16e9 : 8d 23 9f STA $9f23 
16ec : e6 49 __ INC T2 + 0 
16ee : 4c 88 0e JMP $0e88 ; (SetUpSprites.l14 + 0)
.s1017:
16f1 : c9 09 __ CMP #$09
16f3 : 90 06 __ BCC $16fb ; (SetUpSprites.s50 + 0)
.s1016:
16f5 : a9 45 __ LDA #$45
16f7 : c5 49 __ CMP T2 + 0 
16f9 : b0 05 __ BCS $1700 ; (SetUpSprites.s1005 + 0)
.s50:
16fb : a9 05 __ LDA #$05
16fd : 4c be 0e JMP $0ebe ; (SetUpSprites.s218 + 0)
.s1005:
1700 : a5 49 __ LDA T2 + 0 
1702 : c9 13 __ CMP #$13
1704 : 90 06 __ BCC $170c ; (SetUpSprites.s54 + 0)
.s1004:
1706 : a9 3b __ LDA #$3b
1708 : c5 49 __ CMP T2 + 0 
170a : b0 04 __ BCS $1710 ; (SetUpSprites.s1003 + 0)
.s54:
170c : a9 06 __ LDA #$06
170e : d0 d4 __ BNE $16e4 ; (SetUpSprites.s234 + 0)
.s1003:
1710 : a5 49 __ LDA T2 + 0 
1712 : c9 1d __ CMP #$1d
1714 : 90 06 __ BCC $171c ; (SetUpSprites.s58 + 0)
.s1002:
1716 : a9 31 __ LDA #$31
1718 : c5 49 __ CMP T2 + 0 
171a : b0 04 __ BCS $1720 ; (SetUpSprites.s59 + 0)
.s58:
171c : a9 07 __ LDA #$07
171e : d0 c4 __ BNE $16e4 ; (SetUpSprites.s234 + 0)
.s59:
1720 : a9 08 __ LDA #$08
1722 : d0 c0 __ BNE $16e4 ; (SetUpSprites.s234 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1724 : 46 2d __ LSR P0 ; (bank + 0)
1726 : a9 00 __ LDA #$00
1728 : 6a __ __ ROR
1729 : 85 3b __ STA ACCU + 0 
172b : a5 2f __ LDA P2 ; (mem + 1)
172d : 29 f8 __ AND #$f8
172f : 4a __ __ LSR
1730 : 05 3b __ ORA ACCU + 0 
1732 : 85 3b __ STA ACCU + 0 
1734 : a5 30 __ LDA P3 ; (height + 0)
1736 : 0a __ __ ASL
1737 : 05 3b __ ORA ACCU + 0 
1739 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
173b : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
173c : 46 2d __ LSR P0 ; (bank + 0)
173e : a9 00 __ LDA #$00
1740 : 6a __ __ ROR
1741 : 85 3b __ STA ACCU + 0 
1743 : a5 2f __ LDA P2 ; (mem + 1)
1745 : 4a __ __ LSR
1746 : 05 3b __ ORA ACCU + 0 
.s1001:
1748 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1749 : ad 25 9f LDA $9f25 
174c : 29 fe __ AND #$fe
174e : 8d 25 9f STA $9f25 
1751 : a5 2d __ LDA P0 ; (addr + 0)
1753 : 8d 20 9f STA $9f20 
1756 : a5 2e __ LDA P1 ; (addr + 1)
1758 : 8d 21 9f STA $9f21 
175b : a5 2f __ LDA P2 ; (addr + 2)
175d : 29 01 __ AND #$01
175f : 09 10 __ ORA #$10
1761 : 8d 22 9f STA $9f22 
1764 : a5 33 __ LDA P6 ; (size + 0)
1766 : 05 34 __ ORA P7 ; (size + 1)
1768 : f0 19 __ BEQ $1783 ; (vram_putn.s1001 + 0)
.s6:
176a : a0 00 __ LDY #$00
176c : a6 33 __ LDX P6 ; (size + 0)
176e : f0 02 __ BEQ $1772 ; (vram_putn.l1002 + 0)
.s1005:
1770 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1772 : b1 31 __ LDA (P4),y ; (data + 0)
1774 : 8d 23 9f STA $9f23 
1777 : c8 __ __ INY
1778 : d0 02 __ BNE $177c ; (vram_putn.s1009 + 0)
.s1008:
177a : e6 32 __ INC P5 ; (data + 1)
.s1009:
177c : ca __ __ DEX
177d : d0 f3 __ BNE $1772 ; (vram_putn.l1002 + 0)
.s1004:
177f : c6 34 __ DEC P7 ; (size + 1)
1781 : d0 ef __ BNE $1772 ; (vram_putn.l1002 + 0)
.s1001:
1783 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1f4d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f5d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f6d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f7d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f8d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f9d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fad : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fbd : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fcd : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fdd : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fed : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
1ffd : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
200d : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
201d : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
202d : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
203d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
204d : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
205d : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
206d : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
207d : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
208d : __ __ __ BYT 55 55 55 55 55 55 55 55 aa aa aa aa aa aa aa aa : UUUUUUUU........
209d : __ __ __ BYT aa aa aa aa aa aa aa aa 88 88 88 88 88 88 88 88 : ................
20ad : __ __ __ BYT 88 88 88 88 88 88 88 88 77 77 77 77 77 77 77 77 : ........wwwwwwww
20bd : __ __ __ BYT cc cc cc cc cc cc cc cc 00 00 00 00 00 00 00 00 : ................
20cd : __ __ __ BYT 05 00 00 50 00 09 90 00 00 9b b9 00 09 b5 5b 90 : ...P..........[.
20dd : __ __ __ BYT 09 b5 5b 90 00 9b b9 05 00 09 90 00 05 00 00 00 : ..[.............
20ed : __ __ __ BYT 13 11 11 11 11 11 11 31 11 19 91 11 11 9b b9 11 : .......1........
20fd : __ __ __ BYT 11 9b b9 11 11 19 91 13 11 11 11 11 13 11 11 11 : ................
210d : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 19 91 11 : ................
211d : __ __ __ BYT 11 19 91 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
--------------------------------------------------------------------
rand:
.s0:
1784 : ad 2e 21 LDA $212e ; (seed + 1)
1787 : 4a __ __ LSR
1788 : ad 2d 21 LDA $212d ; (seed + 0)
178b : 6a __ __ ROR
178c : aa __ __ TAX
178d : a9 00 __ LDA #$00
178f : 6a __ __ ROR
1790 : 4d 2d 21 EOR $212d ; (seed + 0)
1793 : 85 3b __ STA ACCU + 0 
1795 : 8a __ __ TXA
1796 : 4d 2e 21 EOR $212e ; (seed + 1)
1799 : 85 3c __ STA ACCU + 1 
179b : 4a __ __ LSR
179c : 45 3b __ EOR ACCU + 0 
179e : 8d 2d 21 STA $212d ; (seed + 0)
17a1 : 85 3b __ STA ACCU + 0 
17a3 : 45 3c __ EOR ACCU + 1 
17a5 : 8d 2e 21 STA $212e ; (seed + 1)
17a8 : 85 3c __ STA ACCU + 1 
.s1001:
17aa : 60 __ __ RTS
--------------------------------------------------------------------
seed:
212d : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
212f : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
213f : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
214f : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
215f : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
216f : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
217f : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
218f : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
219f : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
21af : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
21bf : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
21cf : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
21df : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
21ef : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
21ff : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
220f : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
221f : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
222f : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
223f : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
224f : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
225f : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
226f : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
227f : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
228f : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
229f : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
22af : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
22bf : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
22cf : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
22df : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
22ef : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
22ff : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
230f : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
231f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
232f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
233f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
234f : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
235f : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
236f : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
237f : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
238f : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
239f : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
23af : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
23bf : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
23cf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23df : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23ef : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
23ff : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
240f : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
241f : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
242f : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
243f : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
244f : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
245f : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
246f : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
247f : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
248f : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
249f : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
24af : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
24bf : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
24cf : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
24df : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
24ef : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
24ff : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
250f : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
251f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
17ab : ad 25 9f LDA $9f25 
17ae : 29 fe __ AND #$fe
17b0 : 8d 25 9f STA $9f25 
17b3 : a5 2d __ LDA P0 ; (spr + 0)
17b5 : 0a __ __ ASL
17b6 : 0a __ __ ASL
17b7 : 85 3b __ STA ACCU + 0 
17b9 : a9 3f __ LDA #$3f
17bb : 2a __ __ ROL
17bc : 06 3b __ ASL ACCU + 0 
17be : 2a __ __ ROL
17bf : 8d 21 9f STA $9f21 
17c2 : a5 3b __ LDA ACCU + 0 
17c4 : 8d 20 9f STA $9f20 
17c7 : a9 11 __ LDA #$11
17c9 : 8d 22 9f STA $9f22 
17cc : a5 30 __ LDA P3 ; (mode8 + 0)
17ce : f0 02 __ BEQ $17d2 ; (vera_spr_set.s11 + 0)
.s9:
17d0 : a9 80 __ LDA #$80
.s11:
17d2 : 05 2f __ ORA P2 ; (addr32 + 1)
17d4 : a6 2e __ LDX P1 ; (addr32 + 0)
17d6 : 8e 23 9f STX $9f23 
17d9 : 8d 23 9f STA $9f23 
17dc : a9 00 __ LDA #$00
17de : 8d 23 9f STA $9f23 
17e1 : 8d 23 9f STA $9f23 
17e4 : 8d 23 9f STA $9f23 
17e7 : 8d 23 9f STA $9f23 
17ea : a5 33 __ LDA P6 ; (z + 0)
17ec : 0a __ __ ASL
17ed : 0a __ __ ASL
17ee : 8d 23 9f STA $9f23 
17f1 : a5 32 __ LDA P5 ; (h + 0)
17f3 : 4a __ __ LSR
17f4 : 6a __ __ ROR
17f5 : 29 80 __ AND #$80
17f7 : 6a __ __ ROR
17f8 : 85 3b __ STA ACCU + 0 
17fa : a5 31 __ LDA P4 ; (w + 0)
17fc : 0a __ __ ASL
17fd : 0a __ __ ASL
17fe : 0a __ __ ASL
17ff : 0a __ __ ASL
1800 : 05 3b __ ORA ACCU + 0 
1802 : 05 34 __ ORA P7 ; (pal + 0)
1804 : 8d 23 9f STA $9f23 
.s1001:
1807 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1808 : ad 25 9f LDA $9f25 
180b : 29 fe __ AND #$fe
180d : 8d 25 9f STA $9f25 
1810 : a5 2d __ LDA P0 ; (spr + 0)
1812 : 0a __ __ ASL
1813 : 0a __ __ ASL
1814 : 85 3b __ STA ACCU + 0 
1816 : a9 3f __ LDA #$3f
1818 : 2a __ __ ROL
1819 : 06 3b __ ASL ACCU + 0 
181b : 2a __ __ ROL
181c : aa __ __ TAX
181d : a5 3b __ LDA ACCU + 0 
181f : 09 02 __ ORA #$02
1821 : 8d 20 9f STA $9f20 
1824 : 8e 21 9f STX $9f21 
1827 : a9 11 __ LDA #$11
1829 : 8d 22 9f STA $9f22 
182c : a5 2e __ LDA P1 ; (x + 0)
182e : 8d 23 9f STA $9f23 
1831 : a5 2f __ LDA P2 ; (x + 1)
1833 : 8d 23 9f STA $9f23 
1836 : a5 30 __ LDA P3 ; (y + 0)
1838 : 8d 23 9f STA $9f23 
183b : a5 31 __ LDA P4 ; (y + 1)
183d : 8d 23 9f STA $9f23 
.s1001:
1840 : 60 __ __ RTS
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
1841 : ad 25 9f LDA $9f25 
1844 : 29 fe __ AND #$fe
1846 : 8d 25 9f STA $9f25 
1849 : a5 2d __ LDA P0 ; (spr + 0)
184b : 0a __ __ ASL
184c : 0a __ __ ASL
184d : 85 3b __ STA ACCU + 0 
184f : a9 3f __ LDA #$3f
1851 : 2a __ __ ROL
1852 : 06 3b __ ASL ACCU + 0 
1854 : 2a __ __ ROL
1855 : aa __ __ TAX
1856 : a5 3b __ LDA ACCU + 0 
1858 : 09 06 __ ORA #$06
185a : 8d 20 9f STA $9f20 
185d : 8e 21 9f STX $9f21 
1860 : a9 01 __ LDA #$01
1862 : 8d 22 9f STA $9f22 
1865 : ad 23 9f LDA $9f23 
1868 : 29 fc __ AND #$fc
186a : a8 __ __ TAY
186b : a5 2e __ LDA P1 ; (fliph + 0)
186d : f0 01 __ BEQ $1870 ; (vera_spr_flip.s14 + 0)
.s6:
186f : c8 __ __ INY
.s14:
1870 : a5 2f __ LDA P2 ; (flipv + 0)
1872 : f0 05 __ BEQ $1879 ; (vera_spr_flip.s11 + 0)
.s9:
1874 : 98 __ __ TYA
1875 : 09 02 __ ORA #$02
1877 : d0 01 __ BNE $187a ; (vera_spr_flip.s1002 + 0)
.s11:
1879 : 98 __ __ TYA
.s1002:
187a : 8d 23 9f STA $9f23 
.s1001:
187d : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
187e : ad 25 9f LDA $9f25 
1881 : 29 fe __ AND #$fe
1883 : 8d 25 9f STA $9f25 
1886 : a5 2d __ LDA P0 ; (index + 0)
1888 : 0a __ __ ASL
1889 : 8d 20 9f STA $9f20 
188c : a9 7d __ LDA #$7d
188e : 2a __ __ ROL
188f : 8d 21 9f STA $9f21 
1892 : a9 11 __ LDA #$11
1894 : 8d 22 9f STA $9f22 
1897 : a5 30 __ LDA P3 ; (size + 0)
1899 : 05 31 __ ORA P4 ; (size + 1)
189b : f0 29 __ BEQ $18c6 ; (vera_pal_putn.s1001 + 0)
.s6:
189d : a6 30 __ LDX P3 ; (size + 0)
189f : f0 02 __ BEQ $18a3 ; (vera_pal_putn.l3 + 0)
.s1003:
18a1 : e6 31 __ INC P4 ; (size + 1)
.l3:
18a3 : a0 01 __ LDY #$01
18a5 : b1 2e __ LDA (P1),y ; (color + 0)
18a7 : 85 3c __ STA ACCU + 1 
18a9 : 88 __ __ DEY
18aa : b1 2e __ LDA (P1),y ; (color + 0)
18ac : 8d 23 9f STA $9f23 
18af : a5 3c __ LDA ACCU + 1 
18b1 : 8d 23 9f STA $9f23 
18b4 : 18 __ __ CLC
18b5 : a5 2e __ LDA P1 ; (color + 0)
18b7 : 69 02 __ ADC #$02
18b9 : 85 2e __ STA P1 ; (color + 0)
18bb : 90 02 __ BCC $18bf ; (vera_pal_putn.s1007 + 0)
.s1006:
18bd : e6 2f __ INC P2 ; (color + 1)
.s1007:
18bf : ca __ __ DEX
18c0 : d0 e1 __ BNE $18a3 ; (vera_pal_putn.l3 + 0)
.s1002:
18c2 : c6 31 __ DEC P4 ; (size + 1)
18c4 : d0 dd __ BNE $18a3 ; (vera_pal_putn.l3 + 0)
.s1001:
18c6 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
252f : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
253f : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
254f : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
255f : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
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
256f : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
257f : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
258f : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
259f : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
25af : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
25bf : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
25cf : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
25df : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
18c7 : ad fc 9e LDA $9efc ; (sstack + 0)
18ca : 85 2d __ STA P0 
18cc : ad fd 9e LDA $9efd ; (sstack + 1)
18cf : 85 2e __ STA P1 
18d1 : ad fe 9e LDA $9efe ; (sstack + 2)
18d4 : 85 2f __ STA P2 
18d6 : ad ff 9e LDA $9eff ; (sstack + 3)
18d9 : 85 30 __ STA P3 
18db : a5 35 __ LDA P8 ; (input + 0)
18dd : 85 31 __ STA P4 
18df : a5 36 __ LDA P9 ; (input + 1)
18e1 : 85 32 __ STA P5 
18e3 : a5 37 __ LDA P10 ; (inputsize + 0)
18e5 : 85 33 __ STA P6 
18e7 : a9 00 __ LDA #$00
18e9 : 85 34 __ STA P7 
18eb : 4c 49 17 JMP $1749 ; (vram_putn.s0 + 0)
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
25ef : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
4060 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
406c : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
407c : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
408c : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
409c : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
40ac : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
EyeTri:
40b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
40d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
40f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4106 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4116 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4126 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4136 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4146 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4156 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4166 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4176 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4186 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4196 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
41b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41c6 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
41d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41e6 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
41f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4206 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4216 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4226 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4236 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4246 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4256 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4266 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4276 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4286 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4296 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42a6 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
42b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
42c6 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
42d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
42e6 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
42f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4306 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
4316 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4326 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4336 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4346 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4356 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4366 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4376 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4386 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
4396 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
43a6 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
43b6 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
43c6 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
43d6 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
43e6 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
43f6 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4406 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
4416 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4426 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4436 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4446 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4456 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4466 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4476 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4486 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
4496 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
44a6 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
BGPal:
44b6 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
44c6 : __ __ __ BYT 99 09 9b 0f bb 0b ee 0f 44 04 ff 0f ff 0f ff 0f : ........D.......
--------------------------------------------------------------------
getchx:
.s0:
18ee : 20 f8 18 JSR $18f8 ; (getpch + 0)
18f1 : 85 3b __ STA ACCU + 0 
18f3 : a9 00 __ LDA #$00
18f5 : 85 3c __ STA ACCU + 1 
.s1001:
18f7 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
18f8 : 20 e4 ff JSR $ffe4 
18fb : ae fb 25 LDX $25fb ; (giocharmap + 0)
18fe : e0 01 __ CPX #$01
1900 : 90 26 __ BCC $1928 ; (getpch + 48)
1902 : c9 0d __ CMP #$0d
1904 : d0 02 __ BNE $1908 ; (getpch + 16)
1906 : a9 0a __ LDA #$0a
1908 : e0 02 __ CPX #$02
190a : 90 1c __ BCC $1928 ; (getpch + 48)
190c : c9 db __ CMP #$db
190e : b0 18 __ BCS $1928 ; (getpch + 48)
1910 : c9 41 __ CMP #$41
1912 : 90 14 __ BCC $1928 ; (getpch + 48)
1914 : c9 c1 __ CMP #$c1
1916 : 90 02 __ BCC $191a ; (getpch + 34)
1918 : 49 a0 __ EOR #$a0
191a : c9 7b __ CMP #$7b
191c : b0 0a __ BCS $1928 ; (getpch + 48)
191e : c9 61 __ CMP #$61
1920 : b0 04 __ BCS $1926 ; (getpch + 46)
1922 : c9 5b __ CMP #$5b
1924 : b0 02 __ BCS $1928 ; (getpch + 48)
1926 : 49 20 __ EOR #$20
1928 : 60 __ __ RTS
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
44d6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
44d8 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1929 : a9 33 __ LDA #$33
192b : 85 2d __ STA P0 
192d : a9 38 __ LDA #$38
192f : 85 2e __ STA P1 
1931 : a9 01 __ LDA #$01
1933 : 85 2f __ STA P2 
1935 : a6 32 __ LDX P5 ; (p + 0)
1937 : bd 00 45 LDA $4500,x ; (sintab + 0)
193a : 4a __ __ LSR
193b : 4a __ __ LSR
193c : 4a __ __ LSR
193d : 49 10 __ EOR #$10
193f : 38 __ __ SEC
1940 : e9 10 __ SBC #$10
1942 : 18 __ __ CLC
1943 : 69 b4 __ ADC #$b4
1945 : 85 30 __ STA P3 
1947 : a9 00 __ LDA #$00
1949 : 85 31 __ STA P4 
194b : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
194e : a9 34 __ LDA #$34
1950 : 85 2d __ STA P0 
1952 : a9 20 __ LDA #$20
1954 : 85 2e __ STA P1 
1956 : a6 34 __ LDX P7 ; (p2 + 0)
1958 : bd 00 45 LDA $4500,x ; (sintab + 0)
195b : 4a __ __ LSR
195c : 4a __ __ LSR
195d : 4a __ __ LSR
195e : 49 10 __ EOR #$10
1960 : 38 __ __ SEC
1961 : e9 10 __ SBC #$10
1963 : 18 __ __ CLC
1964 : 69 b4 __ ADC #$b4
1966 : 85 30 __ STA P3 
1968 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
196b : a9 35 __ LDA #$35
196d : 85 2d __ STA P0 
196f : a9 00 __ LDA #$00
1971 : 85 2e __ STA P1 
1973 : a6 36 __ LDX P9 ; (p3 + 0)
1975 : bd 00 45 LDA $4500,x ; (sintab + 0)
1978 : 4a __ __ LSR
1979 : 4a __ __ LSR
197a : 4a __ __ LSR
197b : 49 10 __ EOR #$10
197d : 38 __ __ SEC
197e : e9 10 __ SBC #$10
1980 : 18 __ __ CLC
1981 : 69 a4 __ ADC #$a4
1983 : 85 30 __ STA P3 
1985 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1988 : a9 36 __ LDA #$36
198a : 85 2d __ STA P0 
198c : a9 40 __ LDA #$40
198e : 85 2e __ STA P1 
1990 : a6 36 __ LDX P9 ; (p3 + 0)
1992 : bd 00 45 LDA $4500,x ; (sintab + 0)
1995 : 4a __ __ LSR
1996 : 4a __ __ LSR
1997 : 4a __ __ LSR
1998 : 49 10 __ EOR #$10
199a : 38 __ __ SEC
199b : e9 10 __ SBC #$10
199d : 18 __ __ CLC
199e : 69 a4 __ ADC #$a4
19a0 : 85 30 __ STA P3 
19a2 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
19a5 : a9 37 __ LDA #$37
19a7 : 85 2d __ STA P0 
19a9 : a9 00 __ LDA #$00
19ab : 85 2e __ STA P1 
19ad : a6 36 __ LDX P9 ; (p3 + 0)
19af : bd 00 45 LDA $4500,x ; (sintab + 0)
19b2 : 4a __ __ LSR
19b3 : 4a __ __ LSR
19b4 : 4a __ __ LSR
19b5 : 49 10 __ EOR #$10
19b7 : 38 __ __ SEC
19b8 : e9 10 __ SBC #$10
19ba : 18 __ __ CLC
19bb : 69 c4 __ ADC #$c4
19bd : 85 30 __ STA P3 
19bf : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
19c2 : a9 38 __ LDA #$38
19c4 : 85 2d __ STA P0 
19c6 : a9 40 __ LDA #$40
19c8 : 85 2e __ STA P1 
19ca : a6 36 __ LDX P9 ; (p3 + 0)
19cc : bd 00 45 LDA $4500,x ; (sintab + 0)
19cf : 4a __ __ LSR
19d0 : 4a __ __ LSR
19d1 : 4a __ __ LSR
19d2 : 49 10 __ EOR #$10
19d4 : 38 __ __ SEC
19d5 : e9 10 __ SBC #$10
19d7 : 18 __ __ CLC
19d8 : 69 c4 __ ADC #$c4
19da : 85 30 __ STA P3 
19dc : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
19df : a9 00 __ LDA #$00
19e1 : 85 47 __ STA T1 + 0 
19e3 : 18 __ __ CLC
.l2:
19e4 : a5 47 __ LDA T1 + 0 
19e6 : 69 4f __ ADC #$4f
19e8 : 85 2d __ STA P0 
19ea : a5 47 __ LDA T1 + 0 
19ec : 0a __ __ ASL
19ed : 65 47 __ ADC T1 + 0 
19ef : 0a __ __ ASL
19f0 : 0a __ __ ASL
19f1 : 18 __ __ CLC
19f2 : 6d da 44 ADC $44da ; (FrameCount + 0)
19f5 : aa __ __ TAX
19f6 : ac db 44 LDY $44db ; (FrameCount + 1)
19f9 : bd 00 45 LDA $4500,x ; (sintab + 0)
19fc : 10 01 __ BPL $19ff ; (MoveSprites.s1008 + 0)
.s1007:
19fe : 88 __ __ DEY
.s1008:
19ff : 18 __ __ CLC
1a00 : 6d da 44 ADC $44da ; (FrameCount + 0)
1a03 : 85 48 __ STA T2 + 0 
1a05 : 90 01 __ BCC $1a08 ; (MoveSprites.s1009 + 0)
.s1006:
1a07 : c8 __ __ INY
.s1009:
1a08 : 84 49 __ STY T2 + 1 
1a0a : a5 47 __ LDA T1 + 0 
1a0c : 0a __ __ ASL
1a0d : 0a __ __ ASL
1a0e : 85 3b __ STA ACCU + 0 
1a10 : a9 00 __ LDA #$00
1a12 : 85 3c __ STA ACCU + 1 
1a14 : a9 80 __ LDA #$80
1a16 : 85 23 __ STA WORK + 0 
1a18 : a9 02 __ LDA #$02
1a1a : 85 24 __ STA WORK + 1 
1a1c : 20 9c 1e JSR $1e9c ; (divmod + 0)
1a1f : 18 __ __ CLC
1a20 : a5 25 __ LDA WORK + 2 
1a22 : 65 48 __ ADC T2 + 0 
1a24 : 85 2e __ STA P1 
1a26 : a5 26 __ LDA WORK + 3 
1a28 : 65 49 __ ADC T2 + 1 
1a2a : 85 2f __ STA P2 
1a2c : a5 47 __ LDA T1 + 0 
1a2e : 0a __ __ ASL
1a2f : 0a __ __ ASL
1a30 : 65 47 __ ADC T1 + 0 
1a32 : 85 48 __ STA T2 + 0 
1a34 : ad da 44 LDA $44da ; (FrameCount + 0)
1a37 : 38 __ __ SEC
1a38 : e9 40 __ SBC #$40
1a3a : 18 __ __ CLC
1a3b : 65 48 __ ADC T2 + 0 
1a3d : aa __ __ TAX
1a3e : bd 00 45 LDA $4500,x ; (sintab + 0)
1a41 : a8 __ __ TAY
1a42 : 29 80 __ AND #$80
1a44 : 10 02 __ BPL $1a48 ; (MoveSprites.s1009 + 64)
1a46 : a9 ff __ LDA #$ff
1a48 : 85 49 __ STA T2 + 1 
1a4a : a5 47 __ LDA T1 + 0 
1a4c : 0a __ __ ASL
1a4d : 0a __ __ ASL
1a4e : 0a __ __ ASL
1a4f : 85 3b __ STA ACCU + 0 
1a51 : ad da 44 LDA $44da ; (FrameCount + 0)
1a54 : 38 __ __ SEC
1a55 : e9 20 __ SBC #$20
1a57 : 18 __ __ CLC
1a58 : 65 3b __ ADC ACCU + 0 
1a5a : aa __ __ TAX
1a5b : bd 00 45 LDA $4500,x ; (sintab + 0)
1a5e : 4a __ __ LSR
1a5f : 4a __ __ LSR
1a60 : 4a __ __ LSR
1a61 : 4a __ __ LSR
1a62 : 49 08 __ EOR #$08
1a64 : 38 __ __ SEC
1a65 : e9 08 __ SBC #$08
1a67 : 85 4a __ STA T3 + 0 
1a69 : a9 00 __ LDA #$00
1a6b : e9 00 __ SBC #$00
1a6d : 85 4b __ STA T3 + 1 
1a6f : a5 47 __ LDA T1 + 0 
1a71 : 0a __ __ ASL
1a72 : 65 47 __ ADC T1 + 0 
1a74 : 85 3b __ STA ACCU + 0 
1a76 : a5 47 __ LDA T1 + 0 
1a78 : c9 1f __ CMP #$1f
1a7a : f0 27 __ BEQ $1aa3 ; (MoveSprites.s5 + 0)
.s6:
1a7c : 98 __ __ TYA
1a7d : 18 __ __ CLC
1a7e : 69 80 __ ADC #$80
1a80 : 18 __ __ CLC
1a81 : 65 4a __ ADC T3 + 0 
1a83 : a8 __ __ TAY
1a84 : a9 00 __ LDA #$00
1a86 : 65 4b __ ADC T3 + 1 
1a88 : aa __ __ TAX
1a89 : 98 __ __ TYA
1a8a : 18 __ __ CLC
1a8b : 65 3b __ ADC ACCU + 0 
1a8d : 85 30 __ STA P3 
1a8f : 90 01 __ BCC $1a92 ; (MoveSprites.s1013 + 0)
.s1012:
1a91 : e8 __ __ INX
.s1013:
1a92 : 86 31 __ STX P4 
1a94 : 20 08 18 JSR $1808 ; (vera_spr_move.s0 + 0)
1a97 : e6 47 __ INC T1 + 0 
1a99 : a5 47 __ LDA T1 + 0 
1a9b : c9 20 __ CMP #$20
1a9d : b0 03 __ BCS $1aa2 ; (MoveSprites.s1001 + 0)
1a9f : 4c e4 19 JMP $19e4 ; (MoveSprites.l2 + 0)
.s1001:
1aa2 : 60 __ __ RTS
.s5:
1aa3 : 98 __ __ TYA
1aa4 : 18 __ __ CLC
1aa5 : 69 78 __ ADC #$78
1aa7 : a8 __ __ TAY
1aa8 : a5 49 __ LDA T2 + 1 
1aaa : 69 00 __ ADC #$00
1aac : aa __ __ TAX
1aad : 98 __ __ TYA
1aae : 18 __ __ CLC
1aaf : 65 4a __ ADC T3 + 0 
1ab1 : a8 __ __ TAY
1ab2 : 8a __ __ TXA
1ab3 : 65 4b __ ADC T3 + 1 
1ab5 : aa __ __ TAX
1ab6 : 98 __ __ TYA
1ab7 : 18 __ __ CLC
1ab8 : 65 3b __ ADC ACCU + 0 
1aba : 85 30 __ STA P3 
1abc : 90 01 __ BCC $1abf ; (MoveSprites.s1011 + 0)
.s1010:
1abe : e8 __ __ INX
.s1011:
1abf : 86 31 __ STX P4 
1ac1 : 4c 08 18 JMP $1808 ; (vera_spr_move.s0 + 0)
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
44da : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1ac4 : a9 08 __ LDA #$08
1ac6 : 8d 2c 9f STA $9f2c 
1ac9 : 20 fc 1a JSR $1afc ; (zsm_check.s0 + 0)
1acc : 09 00 __ ORA #$00
1ace : f0 20 __ BEQ $1af0 ; (PlayZSM.s1001 + 0)
.s1:
1ad0 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1ad2 : d0 1c __ BNE $1af0 ; (PlayZSM.s1001 + 0)
.s1004:
1ad4 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1ad6 : c9 01 __ CMP #$01
1ad8 : d0 07 __ BNE $1ae1 ; (PlayZSM.s1003 + 0)
.s5:
1ada : a9 1c __ LDA #$1c
1adc : a0 6d __ LDY #$6d
1ade : 4c f5 1a JMP $1af5 ; (PlayZSM.s16 + 0)
.s1003:
1ae1 : c9 02 __ CMP #$02
1ae3 : d0 07 __ BNE $1aec ; (PlayZSM.s1002 + 0)
.s7:
1ae5 : a9 1c __ LDA #$1c
1ae7 : a0 8b __ LDY #$8b
1ae9 : 4c f5 1a JMP $1af5 ; (PlayZSM.s16 + 0)
.s1002:
1aec : c9 03 __ CMP #$03
1aee : f0 01 __ BEQ $1af1 ; (PlayZSM.s9 + 0)
.s1001:
1af0 : 60 __ __ RTS
.s9:
1af1 : a9 1c __ LDA #$1c
1af3 : a0 b0 __ LDY #$b0
.s16:
1af5 : 84 30 __ STY P3 
1af7 : 85 31 __ STA P4 
1af9 : 4c 00 1b JMP $1b00 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1afc : ad 4b 1f LDA $1f4b ; (zsm_finished + 0)
.s1001:
1aff : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1b00 : a9 01 __ LDA #$01
1b02 : 8d 4b 1f STA $1f4b ; (zsm_finished + 0)
1b05 : ad dc 44 LDA $44dc ; (zsm_reading + 0)
1b08 : f0 0a __ BEQ $1b14 ; (zsm_init.s3 + 0)
.s1:
1b0a : a9 02 __ LDA #$02
1b0c : 20 59 1b JSR $1b59 ; (krnio_close.s1000 + 0)
1b0f : a9 00 __ LDA #$00
1b11 : 8d dc 44 STA $44dc ; (zsm_reading + 0)
.s3:
1b14 : 8d d0 54 STA $54d0 ; (zsm_pos + 0)
1b17 : 8d d1 54 STA $54d1 ; (zsm_pos + 1)
1b1a : 8d d2 54 STA $54d2 ; (zsm_wpos + 0)
1b1d : 8d d3 54 STA $54d3 ; (zsm_wpos + 1)
1b20 : 8d cf 54 STA $54cf ; (zsm_delay + 0)
1b23 : a5 30 __ LDA P3 ; (fname + 0)
1b25 : 85 2d __ STA P0 
1b27 : a5 31 __ LDA P4 ; (fname + 1)
1b29 : 85 2e __ STA P1 
1b2b : 20 61 1b JSR $1b61 ; (krnio_setnam.s0 + 0)
1b2e : a9 02 __ LDA #$02
1b30 : 85 2d __ STA P0 
1b32 : 85 2f __ STA P2 
1b34 : a9 08 __ LDA #$08
1b36 : 85 2e __ STA P1 
1b38 : 20 77 1b JSR $1b77 ; (krnio_open.s0 + 0)
1b3b : a5 3b __ LDA ACCU + 0 
1b3d : f0 19 __ BEQ $1b58 ; (zsm_init.s1001 + 0)
.s4:
1b3f : a9 01 __ LDA #$01
1b41 : 8d dc 44 STA $44dc ; (zsm_reading + 0)
1b44 : 20 9f 1b JSR $1b9f ; (zsm_fill.s0 + 0)
1b47 : a9 10 __ LDA #$10
1b49 : 8d d0 54 STA $54d0 ; (zsm_pos + 0)
1b4c : a9 00 __ LDA #$00
1b4e : 8d d1 54 STA $54d1 ; (zsm_pos + 1)
1b51 : 8d 4b 1f STA $1f4b ; (zsm_finished + 0)
1b54 : a9 01 __ LDA #$01
1b56 : 85 3b __ STA ACCU + 0 
.s1001:
1b58 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
44dc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
1b59 : 85 2d __ STA P0 
.s0:
1b5b : a5 2d __ LDA P0 
1b5d : 20 c3 ff JSR $ffc3 
.s1001:
1b60 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
54d2 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1b61 : a5 2d __ LDA P0 
1b63 : 05 2e __ ORA P1 
1b65 : f0 08 __ BEQ $1b6f ; (krnio_setnam.s0 + 14)
1b67 : a0 ff __ LDY #$ff
1b69 : c8 __ __ INY
1b6a : b1 2d __ LDA (P0),y 
1b6c : d0 fb __ BNE $1b69 ; (krnio_setnam.s0 + 8)
1b6e : 98 __ __ TYA
1b6f : a6 2d __ LDX P0 
1b71 : a4 2e __ LDY P1 
1b73 : 20 bd ff JSR $ffbd 
.s1001:
1b76 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1b77 : a9 00 __ LDA #$00
1b79 : a6 2d __ LDX P0 ; (fnum + 0)
1b7b : 9d d4 54 STA $54d4,x ; (krnio_pstatus + 0)
1b7e : a9 00 __ LDA #$00
1b80 : 85 3b __ STA ACCU + 0 
1b82 : 85 3c __ STA ACCU + 1 
1b84 : a5 2d __ LDA P0 ; (fnum + 0)
1b86 : a6 2e __ LDX P1 
1b88 : a4 2f __ LDY P2 
1b8a : 20 ba ff JSR $ffba 
1b8d : 20 c0 ff JSR $ffc0 
1b90 : 90 08 __ BCC $1b9a ; (krnio_open.s0 + 35)
1b92 : a5 2d __ LDA P0 ; (fnum + 0)
1b94 : 20 c3 ff JSR $ffc3 
1b97 : 4c 9e 1b JMP $1b9e ; (krnio_open.s1001 + 0)
1b9a : a9 01 __ LDA #$01
1b9c : 85 3b __ STA ACCU + 0 
.s1001:
1b9e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
54d4 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1b9f : ad dc 44 LDA $44dc ; (zsm_reading + 0)
1ba2 : f0 20 __ BEQ $1bc4 ; (zsm_fill.s1 + 0)
.s2:
1ba4 : ad d1 54 LDA $54d1 ; (zsm_pos + 1)
1ba7 : 18 __ __ CLC
1ba8 : 69 04 __ ADC #$04
1baa : cd d3 54 CMP $54d3 ; (zsm_wpos + 1)
1bad : d0 0c __ BNE $1bbb ; (zsm_fill.s6 + 0)
.s1006:
1baf : ad d2 54 LDA $54d2 ; (zsm_wpos + 0)
1bb2 : cd d0 54 CMP $54d0 ; (zsm_pos + 0)
1bb5 : d0 04 __ BNE $1bbb ; (zsm_fill.s6 + 0)
.s5:
1bb7 : a9 00 __ LDA #$00
1bb9 : f0 0b __ BEQ $1bc6 ; (zsm_fill.s1008 + 0)
.s6:
1bbb : a9 02 __ LDA #$02
1bbd : 20 43 1c JSR $1c43 ; (krnio_chkin.s1000 + 0)
1bc0 : a5 3b __ LDA ACCU + 0 
1bc2 : d0 07 __ BNE $1bcb ; (zsm_fill.s9 + 0)
.s1:
1bc4 : a9 ff __ LDA #$ff
.s1008:
1bc6 : 85 3b __ STA ACCU + 0 
.s1001:
1bc8 : 85 3c __ STA ACCU + 1 
1bca : 60 __ __ RTS
.s9:
1bcb : a9 00 __ LDA #$00
1bcd : 85 47 __ STA T1 + 0 
1bcf : 85 48 __ STA T1 + 1 
1bd1 : ad d1 54 LDA $54d1 ; (zsm_pos + 1)
1bd4 : 18 __ __ CLC
1bd5 : 69 04 __ ADC #$04
1bd7 : cd d3 54 CMP $54d3 ; (zsm_wpos + 1)
1bda : d0 08 __ BNE $1be4 ; (zsm_fill.l13 + 0)
.s1002:
1bdc : ad d2 54 LDA $54d2 ; (zsm_wpos + 0)
1bdf : cd d0 54 CMP $54d0 ; (zsm_pos + 0)
1be2 : f0 49 __ BEQ $1c2d ; (zsm_fill.s38 + 0)
.l13:
1be4 : 20 55 1c JSR $1c55 ; (krnio_chrin.s0 + 0)
1be7 : ad d2 54 LDA $54d2 ; (zsm_wpos + 0)
1bea : aa __ __ TAX
1beb : 18 __ __ CLC
1bec : 69 01 __ ADC #$01
1bee : 8d d2 54 STA $54d2 ; (zsm_wpos + 0)
1bf1 : ad d3 54 LDA $54d3 ; (zsm_wpos + 1)
1bf4 : a8 __ __ TAY
1bf5 : 69 00 __ ADC #$00
1bf7 : 8d d3 54 STA $54d3 ; (zsm_wpos + 1)
1bfa : 8a __ __ TXA
1bfb : 18 __ __ CLC
1bfc : 69 c4 __ ADC #$c4
1bfe : 85 49 __ STA T3 + 0 
1c00 : 98 __ __ TYA
1c01 : 29 03 __ AND #$03
1c03 : 69 55 __ ADC #$55
1c05 : 85 4a __ STA T3 + 1 
1c07 : a5 3b __ LDA ACCU + 0 
1c09 : a0 00 __ LDY #$00
1c0b : 91 49 __ STA (T3 + 0),y 
1c0d : e6 47 __ INC T1 + 0 
1c0f : d0 02 __ BNE $1c13 ; (zsm_fill.s1010 + 0)
.s1009:
1c11 : e6 48 __ INC T1 + 1 
.s1010:
1c13 : 20 5f 1c JSR $1c5f ; (krnio_status.s0 + 0)
1c16 : a5 3b __ LDA ACCU + 0 
1c18 : d0 0e __ BNE $1c28 ; (zsm_fill.s15 + 0)
.s12:
1c1a : ad d1 54 LDA $54d1 ; (zsm_pos + 1)
1c1d : 18 __ __ CLC
1c1e : 69 04 __ ADC #$04
1c20 : cd d3 54 CMP $54d3 ; (zsm_wpos + 1)
1c23 : d0 bf __ BNE $1be4 ; (zsm_fill.l13 + 0)
1c25 : 4c dc 1b JMP $1bdc ; (zsm_fill.s1002 + 0)
.s15:
1c28 : a9 00 __ LDA #$00
1c2a : 8d dc 44 STA $44dc ; (zsm_reading + 0)
.s38:
1c2d : 20 69 1c JSR $1c69 ; (krnio_clrchn.s0 + 0)
1c30 : ad dc 44 LDA $44dc ; (zsm_reading + 0)
1c33 : d0 05 __ BNE $1c3a ; (zsm_fill.s21 + 0)
.s19:
1c35 : a9 02 __ LDA #$02
1c37 : 20 59 1b JSR $1b59 ; (krnio_close.s1000 + 0)
.s21:
1c3a : a5 47 __ LDA T1 + 0 
1c3c : 85 3b __ STA ACCU + 0 
1c3e : a5 48 __ LDA T1 + 1 
1c40 : 4c c8 1b JMP $1bc8 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1c43 : 85 2d __ STA P0 
.s0:
1c45 : a6 2d __ LDX P0 
1c47 : 20 c6 ff JSR $ffc6 
1c4a : a9 00 __ LDA #$00
1c4c : 85 3c __ STA ACCU + 1 
1c4e : b0 02 __ BCS $1c52 ; (krnio_chkin.s0 + 13)
1c50 : a9 01 __ LDA #$01
1c52 : 85 3b __ STA ACCU + 0 
.s1001:
1c54 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1c55 : 20 cf ff JSR $ffcf 
1c58 : 85 3b __ STA ACCU + 0 
1c5a : a9 00 __ LDA #$00
1c5c : 85 3c __ STA ACCU + 1 
.s1001:
1c5e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1c5f : 20 b7 ff JSR $ffb7 
1c62 : 85 3b __ STA ACCU + 0 
1c64 : a9 00 __ LDA #$00
1c66 : 85 3c __ STA ACCU + 1 
.s1001:
1c68 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1c69 : 20 cc ff JSR $ffcc 
.s1001:
1c6c : 60 __ __ RTS
--------------------------------------------------------------------
1c6d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1c7d : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1c8b : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1c9b : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1cab : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
1cb0 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1cc0 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
1cd0 : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
LastSelectedSong:
44dd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
PalTimer:
44de : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
44e0 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
44f0 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1cd7 : a9 10 __ LDA #$10
1cd9 : 85 30 __ STA P3 
1cdb : a9 00 __ LDA #$00
1cdd : 85 31 __ STA P4 
1cdf : a5 32 __ LDA P5 ; (Palette + 0)
1ce1 : 85 2e __ STA P1 
1ce3 : 85 47 __ STA T0 + 0 
1ce5 : a5 33 __ LDA P6 ; (Palette + 1)
1ce7 : 85 2f __ STA P2 
1ce9 : 85 48 __ STA T0 + 1 
1ceb : a5 34 __ LDA P7 ; (index + 0)
1ced : 85 2d __ STA P0 
1cef : ad fc 9e LDA $9efc ; (sstack + 0)
1cf2 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1cf4 : 0a __ __ ASL
1cf5 : 85 49 __ STA T3 + 0 
1cf7 : ad fd 9e LDA $9efd ; (sstack + 1)
1cfa : 2a __ __ ROL
1cfb : 18 __ __ CLC
1cfc : 65 33 __ ADC P6 ; (Palette + 1)
1cfe : 85 4a __ STA T3 + 1 
1d00 : a4 32 __ LDY P5 ; (Palette + 0)
1d02 : b1 49 __ LDA (T3 + 0),y 
1d04 : aa __ __ TAX
1d05 : c8 __ __ INY
1d06 : b1 49 __ LDA (T3 + 0),y 
1d08 : 86 49 __ STX T3 + 0 
1d0a : 85 4a __ STA T3 + 1 
1d0c : a9 00 __ LDA #$00
1d0e : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1d10 : ad fe 9e LDA $9efe ; (sstack + 2)
1d13 : 85 4b __ STA T5 + 0 
1d15 : 38 __ __ SEC
1d16 : e9 01 __ SBC #$01
1d18 : 85 4d __ STA T6 + 0 
1d1a : ad ff 9e LDA $9eff ; (sstack + 3)
1d1d : 85 4c __ STA T5 + 1 
1d1f : e9 00 __ SBC #$00
1d21 : 85 4e __ STA T6 + 1 
1d23 : d0 06 __ BNE $1d2b ; (SetPaletteIndex.s5 + 0)
.s1004:
1d25 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1d27 : c5 4d __ CMP T6 + 0 
1d29 : b0 38 __ BCS $1d63 ; (SetPaletteIndex.s4 + 0)
.s5:
1d2b : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1d2d : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1d2f : 18 __ __ CLC
1d30 : a5 32 __ LDA P5 ; (Palette + 0)
1d32 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1d34 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1d36 : a5 33 __ LDA P6 ; (Palette + 1)
1d38 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1d3a : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1d3c : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1d3f : a0 02 __ LDY #$02
1d41 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1d43 : a0 00 __ LDY #$00
1d45 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1d47 : a0 03 __ LDY #$03
1d49 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1d4b : a0 01 __ LDY #$01
1d4d : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1d4f : 18 __ __ CLC
1d50 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1d52 : 69 02 __ ADC #$02
1d54 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1d56 : 90 02 __ BCC $1d5a ; (SetPaletteIndex.s1008 + 0)
.s1007:
1d58 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1d5a : e8 __ __ INX
1d5b : a5 4e __ LDA T6 + 1 
1d5d : d0 e0 __ BNE $1d3f ; (SetPaletteIndex.l2 + 0)
.s1002:
1d5f : e4 4d __ CPX T6 + 0 
1d61 : 90 dc __ BCC $1d3f ; (SetPaletteIndex.l2 + 0)
.s4:
1d63 : a5 4b __ LDA T5 + 0 
1d65 : 0a __ __ ASL
1d66 : aa __ __ TAX
1d67 : a5 4c __ LDA T5 + 1 
1d69 : 2a __ __ ROL
1d6a : a8 __ __ TAY
1d6b : 8a __ __ TXA
1d6c : 38 __ __ SEC
1d6d : e9 02 __ SBC #$02
1d6f : b0 01 __ BCS $1d72 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1d71 : 88 __ __ DEY
.s1010:
1d72 : 18 __ __ CLC
1d73 : 65 47 __ ADC T0 + 0 
1d75 : 85 47 __ STA T0 + 0 
1d77 : 98 __ __ TYA
1d78 : 65 48 __ ADC T0 + 1 
1d7a : 85 48 __ STA T0 + 1 
1d7c : a5 49 __ LDA T3 + 0 
1d7e : a0 00 __ LDY #$00
1d80 : 91 47 __ STA (T0 + 0),y 
1d82 : a5 4a __ LDA T3 + 1 
1d84 : c8 __ __ INY
1d85 : 91 47 __ STA (T0 + 0),y 
1d87 : 4c 7e 18 JMP $187e ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
4600 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4602 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4612 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
4622 : __ __ __ BYT 03                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
1d8a : ad 25 9f LDA $9f25 
1d8d : 29 fe __ AND #$fe
1d8f : 8d 25 9f STA $9f25 
1d92 : a9 00 __ LDA #$00
1d94 : 8d 20 9f STA $9f20 
1d97 : a9 b0 __ LDA #$b0
1d99 : 8d 21 9f STA $9f21 
1d9c : a9 11 __ LDA #$11
1d9e : 8d 22 9f STA $9f22 
1da1 : a2 80 __ LDX #$80
1da3 : a9 00 __ LDA #$00
.l1002:
1da5 : 8d 23 9f STA $9f23 
1da8 : 8d 23 9f STA $9f23 
1dab : ca __ __ DEX
1dac : d0 f7 __ BNE $1da5 ; (ResetChars.l1002 + 0)
.s1001:
1dae : 60 __ __ RTS
--------------------------------------------------------------------
off1:
4623 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
1daf : a5 31 __ LDA P4 ; (Input + 0)
1db1 : c9 20 __ CMP #$20
1db3 : d0 1c __ BNE $1dd1 ; (Control.s1007 + 0)
.s1:
1db5 : a5 30 __ LDA P3 ; (playing + 0)
1db7 : d0 0a __ BNE $1dc3 ; (Control.s4 + 0)
.s5:
1db9 : a9 01 __ LDA #$01
1dbb : 20 6f 1e JSR $1e6f ; (zsm_irq_play.s0 + 0)
1dbe : a9 01 __ LDA #$01
.s1001:
1dc0 : 85 3b __ STA ACCU + 0 
1dc2 : 60 __ __ RTS
.s4:
1dc3 : a9 00 __ LDA #$00
1dc5 : cd 25 46 CMP $4625 ; (paused + 0)
1dc8 : 2a __ __ ROL
1dc9 : 8d 25 46 STA $4625 ; (paused + 0)
1dcc : 85 2f __ STA P2 
1dce : 20 d6 1d JSR $1dd6 ; (zsm_pause.s0 + 0)
.s1007:
1dd1 : a5 30 __ LDA P3 ; (playing + 0)
1dd3 : 4c c0 1d JMP $1dc0 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
4625 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1dd6 : a5 2f __ LDA P2 ; (pause + 0)
1dd8 : d0 0e __ BNE $1de8 ; (zsm_pause.s4 + 0)
.s8:
1dda : ad 4c 1f LDA $1f4c ; (zsm_paused + 0)
1ddd : f0 08 __ BEQ $1de7 ; (zsm_pause.s1001 + 0)
.s5:
1ddf : 20 42 1e JSR $1e42 ; (zsm_restore_volume.s0 + 0)
1de2 : a9 00 __ LDA #$00
1de4 : 8d 4c 1f STA $1f4c ; (zsm_paused + 0)
.s1001:
1de7 : 60 __ __ RTS
.s4:
1de8 : ad 4c 1f LDA $1f4c ; (zsm_paused + 0)
1deb : d0 fa __ BNE $1de7 ; (zsm_pause.s1001 + 0)
.s1:
1ded : a9 01 __ LDA #$01
1def : 8d 4c 1f STA $1f4c ; (zsm_paused + 0)
1df2 : 20 f8 1d JSR $1df8 ; (zsm_silence.s0 + 0)
1df5 : 4c 10 1e JMP $1e10 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_silence:
.s0:
1df8 : a9 00 __ LDA #$00
1dfa : 85 47 __ STA T0 + 0 
1dfc : a9 08 __ LDA #$08
1dfe : 85 2d __ STA P0 
1e00 : a9 00 __ LDA #$00
.l1006:
1e02 : 85 2e __ STA P1 
1e04 : 20 a7 0d JSR $0da7 ; (sfx_put.l1 + 0)
1e07 : e6 47 __ INC T0 + 0 
1e09 : a5 47 __ LDA T0 + 0 
1e0b : c9 08 __ CMP #$08
1e0d : 90 f3 __ BCC $1e02 ; (zsm_silence.l1006 + 0)
.s1001:
1e0f : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1e10 : a0 00 __ LDY #$00
1e12 : 84 3c __ STY ACCU + 1 
1e14 : a2 02 __ LDX #$02
1e16 : 18 __ __ CLC
.l1006:
1e17 : 8a __ __ TXA
1e18 : 09 c0 __ ORA #$c0
1e1a : 8d 20 9f STA $9f20 
1e1d : a5 3c __ LDA ACCU + 1 
1e1f : 09 f9 __ ORA #$f9
1e21 : 8d 21 9f STA $9f21 
1e24 : a9 01 __ LDA #$01
1e26 : 8d 22 9f STA $9f22 
1e29 : ad 23 9f LDA $9f23 
1e2c : 99 e4 54 STA $54e4,y ; (vera_volumes + 0)
1e2f : a9 00 __ LDA #$00
1e31 : 8d 23 9f STA $9f23 
1e34 : 8a __ __ TXA
1e35 : 69 04 __ ADC #$04
1e37 : aa __ __ TAX
1e38 : 90 02 __ BCC $1e3c ; (zsm_save_volume.s1009 + 0)
.s1008:
1e3a : e6 3c __ INC ACCU + 1 
.s1009:
1e3c : c8 __ __ INY
1e3d : c0 10 __ CPY #$10
1e3f : 90 d6 __ BCC $1e17 ; (zsm_save_volume.l1006 + 0)
.s1001:
1e41 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
54e4 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1e42 : a0 00 __ LDY #$00
1e44 : 84 3c __ STY ACCU + 1 
1e46 : a2 02 __ LDX #$02
1e48 : 18 __ __ CLC
.l1006:
1e49 : 8a __ __ TXA
1e4a : 09 c0 __ ORA #$c0
1e4c : 8d 20 9f STA $9f20 
1e4f : a5 3c __ LDA ACCU + 1 
1e51 : 09 f9 __ ORA #$f9
1e53 : 8d 21 9f STA $9f21 
1e56 : a9 01 __ LDA #$01
1e58 : 8d 22 9f STA $9f22 
1e5b : b9 e4 54 LDA $54e4,y ; (vera_volumes + 0)
1e5e : 8d 23 9f STA $9f23 
1e61 : 8a __ __ TXA
1e62 : 69 04 __ ADC #$04
1e64 : aa __ __ TAX
1e65 : 90 02 __ BCC $1e69 ; (zsm_restore_volume.s1009 + 0)
.s1008:
1e67 : e6 3c __ INC ACCU + 1 
.s1009:
1e69 : c8 __ __ INY
1e6a : c0 10 __ CPY #$10
1e6c : 90 db __ BCC $1e49 ; (zsm_restore_volume.l1006 + 0)
.s1001:
1e6e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1e6f : 8d 4a 1f STA $1f4a ; (zsm_playing + 0)
.s1001:
1e72 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4626 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4636 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4646 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4656 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4666 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4676 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4686 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4696 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
46a6 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
46b6 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
46c6 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
46d6 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
46e6 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
46f6 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
4706 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
4716 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4726 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4736 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4746 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4756 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4766 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4776 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4786 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4796 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
47a6 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
47b6 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
47c6 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
47d6 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
47e6 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
47f6 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4806 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4816 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4826 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4836 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4846 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4856 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4866 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4876 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4886 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4896 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
48a6 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
48b6 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
48c6 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
48d6 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
48e6 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
48f6 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4906 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4916 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4926 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4936 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4946 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4956 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4966 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4976 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4986 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4996 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
49a6 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
49b6 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
49c6 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
49d6 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
49e6 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
49f6 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4a06 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4a16 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4a26 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4a36 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4a46 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4a56 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4a66 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4a76 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4a86 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4a96 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4aa6 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4ab6 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4ac6 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4ad6 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4ae6 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4af6 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4b06 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4b16 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4b26 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4b36 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4b46 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4b56 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4b66 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4b76 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4b86 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4b96 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4ba6 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4bb6 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4bc6 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4bd6 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4be6 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4bf6 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c06 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c16 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c26 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c36 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c46 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c56 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c66 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c76 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c86 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c96 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 20 3d 20 3d 20 : MNMNMNMNMNM = = 
4ca6 : __ __ __ BYT 2d 20 2d 00                                     : - -.
--------------------------------------------------------------------
Song1:
4caa : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4cba : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4cca : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4cda : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4cea : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4cfa : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4d0a : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4d1a : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
4d2a : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
4d3a : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
4d4a : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
4d5a : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
4d6a : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
4d7a : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
4d8a : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
4d9a : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
4daa : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
4dba : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
4dca : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
4dda : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
4dea : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
4dfa : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
4e0a : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
4e1a : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
4e2a : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
4e3a : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
4e4a : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
4e5a : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
4e6a : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
4e7a : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
4e8a : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
4e9a : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
4eaa : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
4eba : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
4eca : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
4eda : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
4eea : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
4efa : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
4f0a : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
4f1a : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
4f2a : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
4f3a : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
4f4a : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
4f5a : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
4f6a : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
4f7a : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
4f8a : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
4f9a : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
4faa : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
4fba : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
4fca : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
4fda : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
4fea : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
4ffa : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
500a : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
501a : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
502a : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
503a : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
504a : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
505a : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
506a : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
507a : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
508a : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
509a : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
50aa : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
50ba : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
50ca : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
50da : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
50ea : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
50fa : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
510a : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
511a : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
512a : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
513a : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
514a : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
515a : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
516a : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
517a : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
518a : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
519a : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
51aa : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
51ba : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
51ca : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
51da : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
51ea : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
51fa : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
520a : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
521a : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
522a : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
523a : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
524a : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
525a : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
526a : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
527a : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
528a : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
529a : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
52aa : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
52ba : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
52ca : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
52da : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
52ea : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
52fa : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
530a : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
531a : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
532a : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
533a : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
534a : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
535a : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
536a : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
537a : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
538a : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
539a : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
53aa : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
53ba : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
53ca : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
53da : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
53ea : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
53fa : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5407 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5417 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5427 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5437 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5447 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5457 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5467 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5477 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5487 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5497 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
54a7 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
54b7 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
54c7 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
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
1e73 : ad 26 9f LDA $9f26 
1e76 : 0a __ __ ASL
1e77 : 30 fa __ BMI $1e73 ; (frame_wait.l1 + 0)
.l4:
1e79 : ad 26 9f LDA $9f26 
1e7c : 0a __ __ ASL
1e7d : 10 fa __ BPL $1e79 ; (frame_wait.l4 + 0)
.s1001:
1e7f : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1e80 : 38 __ __ SEC
1e81 : a9 00 __ LDA #$00
1e83 : e5 3b __ SBC ACCU + 0 
1e85 : 85 3b __ STA ACCU + 0 
1e87 : a9 00 __ LDA #$00
1e89 : e5 3c __ SBC ACCU + 1 
1e8b : 85 3c __ STA ACCU + 1 
1e8d : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1e8e : 38 __ __ SEC
1e8f : a9 00 __ LDA #$00
1e91 : e5 23 __ SBC WORK + 0 
1e93 : 85 23 __ STA WORK + 0 
1e95 : a9 00 __ LDA #$00
1e97 : e5 24 __ SBC WORK + 1 
1e99 : 85 24 __ STA WORK + 1 
1e9b : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1e9c : a5 3c __ LDA ACCU + 1 
1e9e : d0 31 __ BNE $1ed1 ; (divmod + 53)
1ea0 : a5 24 __ LDA WORK + 1 
1ea2 : d0 1e __ BNE $1ec2 ; (divmod + 38)
1ea4 : 85 26 __ STA WORK + 3 
1ea6 : a2 04 __ LDX #$04
1ea8 : 06 3b __ ASL ACCU + 0 
1eaa : 2a __ __ ROL
1eab : c5 23 __ CMP WORK + 0 
1ead : 90 02 __ BCC $1eb1 ; (divmod + 21)
1eaf : e5 23 __ SBC WORK + 0 
1eb1 : 26 3b __ ROL ACCU + 0 
1eb3 : 2a __ __ ROL
1eb4 : c5 23 __ CMP WORK + 0 
1eb6 : 90 02 __ BCC $1eba ; (divmod + 30)
1eb8 : e5 23 __ SBC WORK + 0 
1eba : 26 3b __ ROL ACCU + 0 
1ebc : ca __ __ DEX
1ebd : d0 eb __ BNE $1eaa ; (divmod + 14)
1ebf : 85 25 __ STA WORK + 2 
1ec1 : 60 __ __ RTS
1ec2 : a5 3b __ LDA ACCU + 0 
1ec4 : 85 25 __ STA WORK + 2 
1ec6 : a5 3c __ LDA ACCU + 1 
1ec8 : 85 26 __ STA WORK + 3 
1eca : a9 00 __ LDA #$00
1ecc : 85 3b __ STA ACCU + 0 
1ece : 85 3c __ STA ACCU + 1 
1ed0 : 60 __ __ RTS
1ed1 : a5 24 __ LDA WORK + 1 
1ed3 : d0 1f __ BNE $1ef4 ; (divmod + 88)
1ed5 : a5 23 __ LDA WORK + 0 
1ed7 : 30 1b __ BMI $1ef4 ; (divmod + 88)
1ed9 : a9 00 __ LDA #$00
1edb : 85 26 __ STA WORK + 3 
1edd : a2 10 __ LDX #$10
1edf : 06 3b __ ASL ACCU + 0 
1ee1 : 26 3c __ ROL ACCU + 1 
1ee3 : 2a __ __ ROL
1ee4 : c5 23 __ CMP WORK + 0 
1ee6 : 90 02 __ BCC $1eea ; (divmod + 78)
1ee8 : e5 23 __ SBC WORK + 0 
1eea : 26 3b __ ROL ACCU + 0 
1eec : 26 3c __ ROL ACCU + 1 
1eee : ca __ __ DEX
1eef : d0 f2 __ BNE $1ee3 ; (divmod + 71)
1ef1 : 85 25 __ STA WORK + 2 
1ef3 : 60 __ __ RTS
1ef4 : a9 00 __ LDA #$00
1ef6 : 85 25 __ STA WORK + 2 
1ef8 : 85 26 __ STA WORK + 3 
1efa : 84 22 __ STY $22 
1efc : a0 10 __ LDY #$10
1efe : 18 __ __ CLC
1eff : 26 3b __ ROL ACCU + 0 
1f01 : 26 3c __ ROL ACCU + 1 
1f03 : 26 25 __ ROL WORK + 2 
1f05 : 26 26 __ ROL WORK + 3 
1f07 : 38 __ __ SEC
1f08 : a5 25 __ LDA WORK + 2 
1f0a : e5 23 __ SBC WORK + 0 
1f0c : aa __ __ TAX
1f0d : a5 26 __ LDA WORK + 3 
1f0f : e5 24 __ SBC WORK + 1 
1f11 : 90 04 __ BCC $1f17 ; (divmod + 123)
1f13 : 86 25 __ STX WORK + 2 
1f15 : 85 26 __ STA WORK + 3 
1f17 : 88 __ __ DEY
1f18 : d0 e5 __ BNE $1eff ; (divmod + 99)
1f1a : 26 3b __ ROL ACCU + 0 
1f1c : 26 3c __ ROL ACCU + 1 
1f1e : a4 22 __ LDY $22 
1f20 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1f21 : 24 3c __ BIT ACCU + 1 
1f23 : 10 0d __ BPL $1f32 ; (mods16 + 17)
1f25 : 20 80 1e JSR $1e80 ; (negaccu + 0)
1f28 : 24 24 __ BIT WORK + 1 
1f2a : 10 0d __ BPL $1f39 ; (mods16 + 24)
1f2c : 20 8e 1e JSR $1e8e ; (negtmp + 0)
1f2f : 4c 9c 1e JMP $1e9c ; (divmod + 0)
1f32 : 24 24 __ BIT WORK + 1 
1f34 : 10 f9 __ BPL $1f2f ; (mods16 + 14)
1f36 : 20 8e 1e JSR $1e8e ; (negtmp + 0)
1f39 : 20 9c 1e JSR $1e9c ; (divmod + 0)
1f3c : 38 __ __ SEC
1f3d : a9 00 __ LDA #$00
1f3f : e5 25 __ SBC WORK + 2 
1f41 : 85 25 __ STA WORK + 2 
1f43 : a9 00 __ LDA #$00
1f45 : e5 26 __ SBC WORK + 3 
1f47 : 85 26 __ STA WORK + 3 
1f49 : 60 __ __ RTS
