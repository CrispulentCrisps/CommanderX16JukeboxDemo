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
080e : 8e ea 21 STX $21ea ; (spentry + 0)
0811 : a9 be __ LDA #$be
0813 : 85 39 __ STA IP + 0 
0815 : a9 54 __ LDA #$54
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 59 __ LDA #$59
081c : e9 54 __ SBC #$54
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
21ea : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 02 0c JSR $0c02 ; (zsm_irq_init.s0 + 0)
0883 : 20 db 0d JSR $0ddb ; (ClearVERAScreen.s0 + 0)
0886 : 20 1e 0e JSR $0e1e ; (SetUpSprites.s0 + 0)
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
08cc : a9 00 __ LDA #$00
08ce : 85 52 __ STA T1 + 0 
08d0 : 85 53 __ STA T1 + 1 
08d2 : 85 54 __ STA T2 + 0 
08d4 : 85 55 __ STA T3 + 0 
08d6 : 85 56 __ STA T4 + 0 
.l3:
08d8 : 20 63 1b JSR $1b63 ; (getchx.s0 + 0)
08db : a5 3b __ LDA ACCU + 0 
08dd : 85 57 __ STA T5 + 0 
08df : a9 30 __ LDA #$30
08e1 : 8d 2c 9f STA $9f2c 
08e4 : ee fd 29 INC $29fd ; (p + 0)
08e7 : d0 03 __ BNE $08ec ; (main.s1023 + 0)
.s1022:
08e9 : ee fe 29 INC $29fe ; (p + 1)
.s1023:
08ec : ad ca 42 LDA $42ca ; (Phase + 0)
08ef : 18 __ __ CLC
08f0 : 69 01 __ ADC #$01
08f2 : 85 32 __ STA P5 
08f4 : 8d ca 42 STA $42ca ; (Phase + 0)
08f7 : ad cb 42 LDA $42cb ; (Phase + 1)
08fa : 69 00 __ ADC #$00
08fc : 85 33 __ STA P6 
08fe : 8d cb 42 STA $42cb ; (Phase + 1)
0901 : ad cc 42 LDA $42cc ; (Phase2 + 0)
0904 : 18 __ __ CLC
0905 : 69 01 __ ADC #$01
0907 : 85 34 __ STA P7 
0909 : 8d cc 42 STA $42cc ; (Phase2 + 0)
090c : ad cd 42 LDA $42cd ; (Phase2 + 1)
090f : 69 00 __ ADC #$00
0911 : 85 35 __ STA P8 
0913 : 8d cd 42 STA $42cd ; (Phase2 + 1)
0916 : ad ce 42 LDA $42ce ; (Phase3 + 0)
0919 : 18 __ __ CLC
091a : 69 01 __ ADC #$01
091c : 85 36 __ STA P9 
091e : 8d ce 42 STA $42ce ; (Phase3 + 0)
0921 : ad cf 42 LDA $42cf ; (Phase3 + 1)
0924 : 69 00 __ ADC #$00
0926 : 85 37 __ STA P10 
0928 : 8d cf 42 STA $42cf ; (Phase3 + 1)
092b : 20 9e 1b JSR $1b9e ; (MoveSprites.s0 + 0)
092e : a5 55 __ LDA T3 + 0 
0930 : c9 01 __ CMP #$01
0932 : d0 03 __ BNE $0937 ; (main.s6 + 0)
0934 : 4c db 0b JMP $0bdb ; (main.s5 + 0)
.s6:
0937 : a9 00 __ LDA #$00
0939 : 8d d3 42 STA $42d3 ; (PalTimer + 0)
093c : 8d d4 42 STA $42d4 ; (PalTimer + 1)
093f : a9 20 __ LDA #$20
0941 : 85 37 __ STA P10 
0943 : a9 a0 __ LDA #$a0
0945 : 8d fc 9e STA $9efc ; (sstack + 0)
0948 : a9 fa __ LDA #$fa
094a : 8d fd 9e STA $9efd ; (sstack + 1)
094d : a9 01 __ LDA #$01
094f : 8d fe 9e STA $9efe ; (sstack + 2)
0952 : a9 00 __ LDA #$00
0954 : 8d ff 9e STA $9eff ; (sstack + 3)
0957 : a9 d5 __ LDA #$d5
0959 : 85 35 __ STA P8 
095b : a9 42 __ LDA #$42
095d : 85 36 __ STA P9 
095f : 20 d5 19 JSR $19d5 ; (SetPaletteColours.s0 + 0)
.s69:
0962 : e6 56 __ INC T4 + 0 
0964 : a9 02 __ LDA #$02
0966 : c5 56 __ CMP T4 + 0 
0968 : b0 2d __ BCS $0997 ; (main.s70 + 0)
.s8:
096a : a9 10 __ LDA #$10
096c : 85 34 __ STA P7 
096e : a9 00 __ LDA #$00
0970 : 85 35 __ STA P8 
0972 : 85 36 __ STA P9 
0974 : 85 37 __ STA P10 
0976 : a9 06 __ LDA #$06
0978 : 8d fc 9e STA $9efc ; (sstack + 0)
097b : a9 00 __ LDA #$00
097d : 8d fd 9e STA $9efd ; (sstack + 1)
0980 : 8d ff 9e STA $9eff ; (sstack + 3)
0983 : a9 0a __ LDA #$0a
0985 : 8d fe 9e STA $9efe ; (sstack + 2)
0988 : a9 10 __ LDA #$10
098a : 85 32 __ STA P5 
098c : a9 29 __ LDA #$29
098e : 85 33 __ STA P6 
0990 : 20 c1 1f JSR $1fc1 ; (SetPaletteIndex.s0 + 0)
0993 : a9 00 __ LDA #$00
0995 : 85 56 __ STA T4 + 0 
.s70:
0997 : ad d4 42 LDA $42d4 ; (PalTimer + 1)
099a : 30 5f __ BMI $09fb ; (main.s13 + 0)
.s1016:
099c : d0 07 __ BNE $09a5 ; (main.s11 + 0)
.s1015:
099e : a9 03 __ LDA #$03
09a0 : cd d3 42 CMP $42d3 ; (PalTimer + 0)
09a3 : b0 56 __ BCS $09fb ; (main.s13 + 0)
.s11:
09a5 : a9 60 __ LDA #$60
09a7 : 85 34 __ STA P7 
09a9 : a9 00 __ LDA #$00
09ab : 85 35 __ STA P8 
09ad : 85 36 __ STA P9 
09af : 85 37 __ STA P10 
09b1 : 8d fc 9e STA $9efc ; (sstack + 0)
09b4 : 8d fd 9e STA $9efd ; (sstack + 1)
09b7 : a9 05 __ LDA #$05
09b9 : 8d fe 9e STA $9efe ; (sstack + 2)
09bc : a9 00 __ LDA #$00
09be : 8d ff 9e STA $9eff ; (sstack + 3)
09c1 : ee f5 42 INC $42f5 ; (PalIndex + 0)
09c4 : d0 03 __ BNE $09c9 ; (main.s1027 + 0)
.s1026:
09c6 : ee f6 42 INC $42f6 ; (PalIndex + 1)
.s1027:
09c9 : a9 40 __ LDA #$40
09cb : 85 32 __ STA P5 
09cd : a9 3e __ LDA #$3e
09cf : 85 33 __ STA P6 
09d1 : 20 c1 1f JSR $1fc1 ; (SetPaletteIndex.s0 + 0)
09d4 : a9 50 __ LDA #$50
09d6 : 85 34 __ STA P7 
09d8 : a9 00 __ LDA #$00
09da : 8d fc 9e STA $9efc ; (sstack + 0)
09dd : 8d fd 9e STA $9efd ; (sstack + 1)
09e0 : 8d ff 9e STA $9eff ; (sstack + 3)
09e3 : a9 10 __ LDA #$10
09e5 : 8d fe 9e STA $9efe ; (sstack + 2)
09e8 : a9 00 __ LDA #$00
09ea : 85 32 __ STA P5 
09ec : a9 44 __ LDA #$44
09ee : 85 33 __ STA P6 
09f0 : 20 c1 1f JSR $1fc1 ; (SetPaletteIndex.s0 + 0)
09f3 : a9 00 __ LDA #$00
09f5 : 8d d3 42 STA $42d3 ; (PalTimer + 0)
09f8 : 8d d4 42 STA $42d4 ; (PalTimer + 1)
.s13:
09fb : a9 03 __ LDA #$03
09fd : 8d 2c 9f STA $9f2c 
0a00 : a5 57 __ LDA T5 + 0 
0a02 : c9 44 __ CMP #$44
0a04 : d0 0c __ BNE $0a12 ; (main.s15 + 0)
.s17:
0a06 : a5 54 __ LDA T2 + 0 
0a08 : cd f7 42 CMP $42f7 ; (MaxSong + 0)
0a0b : b0 03 __ BCS $0a10 ; (main.s1021 + 0)
0a0d : 4c d6 0b JMP $0bd6 ; (main.s14 + 0)
.s1021:
0a10 : a5 57 __ LDA T5 + 0 
.s15:
0a12 : c9 41 __ CMP #$41
0a14 : d0 23 __ BNE $0a39 ; (main.s16 + 0)
.s1008:
0a16 : a9 01 __ LDA #$01
0a18 : c5 54 __ CMP T2 + 0 
0a1a : b0 1d __ BCS $0a39 ; (main.s16 + 0)
.s18:
0a1c : c6 54 __ DEC T2 + 0 
.s83:
0a1e : 20 74 20 JSR $2074 ; (ResetChars.s0 + 0)
0a21 : a9 00 __ LDA #$00
0a23 : 8d f8 42 STA $42f8 ; (off1 + 0)
0a26 : 8d f9 42 STA $42f9 ; (off1 + 1)
0a29 : a9 80 __ LDA #$80
0a2b : 8d 37 9f STA $9f37 
0a2e : a9 fd __ LDA #$fd
0a30 : 8d 38 9f STA $9f38 
0a33 : a9 00 __ LDA #$00
0a35 : 85 52 __ STA T1 + 0 
0a37 : 85 53 __ STA T1 + 1 
.s16:
0a39 : a5 55 __ LDA T3 + 0 
0a3b : 85 30 __ STA P3 
0a3d : a5 57 __ LDA T5 + 0 
0a3f : 85 31 __ STA P4 
0a41 : 20 99 20 JSR $2099 ; (Control.s0 + 0)
0a44 : a5 3b __ LDA ACCU + 0 
0a46 : 85 55 __ STA T3 + 0 
0a48 : 38 __ __ SEC
0a49 : a5 52 __ LDA T1 + 0 
0a4b : e9 80 __ SBC #$80
0a4d : 8d 37 9f STA $9f37 
0a50 : a5 53 __ LDA T1 + 1 
0a52 : e9 02 __ SBC #$02
0a54 : 8d 38 9f STA $9f38 
0a57 : ad d0 42 LDA $42d0 ; (FrameCount + 0)
0a5a : 85 3b __ STA ACCU + 0 
0a5c : ad d1 42 LDA $42d1 ; (FrameCount + 1)
0a5f : 85 3c __ STA ACCU + 1 
0a61 : a9 08 __ LDA #$08
0a63 : 85 23 __ STA WORK + 0 
0a65 : a9 00 __ LDA #$00
0a67 : 85 24 __ STA WORK + 1 
0a69 : 20 c1 21 JSR $21c1 ; (mods16 + 0)
0a6c : a5 26 __ LDA WORK + 3 
0a6e : f0 03 __ BEQ $0a73 ; (main.s1007 + 0)
0a70 : 4c 38 0b JMP $0b38 ; (main.s24 + 0)
.s1007:
0a73 : a5 25 __ LDA WORK + 2 
0a75 : c9 01 __ CMP #$01
0a77 : f0 03 __ BEQ $0a7c ; (main.s22 + 0)
0a79 : 4c 38 0b JMP $0b38 ; (main.s24 + 0)
.s22:
0a7c : ad f8 42 LDA $42f8 ; (off1 + 0)
0a7f : 85 57 __ STA T5 + 0 
0a81 : 29 7f __ AND #$7f
0a83 : 0a __ __ ASL
0a84 : 8d 20 9f STA $9f20 
0a87 : ad 25 9f LDA $9f25 
0a8a : 29 fe __ AND #$fe
0a8c : 8d 25 9f STA $9f25 
0a8f : a9 b0 __ LDA #$b0
0a91 : 8d 21 9f STA $9f21 
0a94 : a9 11 __ LDA #$11
0a96 : 8d 22 9f STA $9f22 
0a99 : a5 54 __ LDA T2 + 0 
0a9b : c9 03 __ CMP #$03
0a9d : d0 1c __ BNE $0abb ; (main.s1005 + 0)
.s42:
0a9f : a5 57 __ LDA T5 + 0 
0aa1 : 85 3b __ STA ACCU + 0 
0aa3 : ad f9 42 LDA $42f9 ; (off1 + 1)
0aa6 : 85 3c __ STA ACCU + 1 
0aa8 : a9 c3 __ LDA #$c3
0aaa : 85 23 __ STA WORK + 0 
0aac : a9 00 __ LDA #$00
0aae : 85 24 __ STA WORK + 1 
0ab0 : 20 3c 21 JSR $213c ; (divmod + 0)
0ab3 : a6 25 __ LDX WORK + 2 
0ab5 : bd 00 53 LDA $5300,x ; (Song3 + 0)
0ab8 : 4c a4 0b JMP $0ba4 ; (main.s75 + 0)
.s1005:
0abb : b0 03 __ BCS $0ac0 ; (main.s1002 + 0)
0abd : 4c 5c 0b JMP $0b5c ; (main.s54 + 0)
.s1002:
0ac0 : c9 04 __ CMP #$04
0ac2 : d0 40 __ BNE $0b04 ; (main.s26 + 0)
.s47:
0ac4 : a5 57 __ LDA T5 + 0 
0ac6 : 85 3b __ STA ACCU + 0 
0ac8 : ad f9 42 LDA $42f9 ; (off1 + 1)
0acb : 85 3c __ STA ACCU + 1 
0acd : a9 c3 __ LDA #$c3
0acf : 85 23 __ STA WORK + 0 
0ad1 : a9 00 __ LDA #$00
0ad3 : 85 24 __ STA WORK + 1 
0ad5 : 20 3c 21 JSR $213c ; (divmod + 0)
0ad8 : a6 25 __ LDX WORK + 2 
0ada : bd 00 54 LDA $5400,x ; (Song4 + 0)
0add : f0 25 __ BEQ $0b04 ; (main.s26 + 0)
.s48:
0adf : a5 57 __ LDA T5 + 0 
0ae1 : 85 3b __ STA ACCU + 0 
0ae3 : ad f9 42 LDA $42f9 ; (off1 + 1)
0ae6 : 85 3c __ STA ACCU + 1 
0ae8 : a9 bd __ LDA #$bd
0aea : 85 23 __ STA WORK + 0 
0aec : a9 00 __ LDA #$00
0aee : 85 24 __ STA WORK + 1 
0af0 : 20 3c 21 JSR $213c ; (divmod + 0)
0af3 : a6 25 __ LDX WORK + 2 
0af5 : bd 00 54 LDA $5400,x ; (Song4 + 0)
.s84:
0af8 : 8d 23 9f STA $9f23 
0afb : a5 57 __ LDA T5 + 0 
0afd : 29 0f __ AND #$0f
0aff : 09 80 __ ORA #$80
0b01 : 8d 23 9f STA $9f23 
.s26:
0b04 : a9 80 __ LDA #$80
0b06 : 85 34 __ STA P7 
0b08 : a9 00 __ LDA #$00
0b0a : 85 35 __ STA P8 
0b0c : 85 36 __ STA P9 
0b0e : 85 37 __ STA P10 
0b10 : 8d fc 9e STA $9efc ; (sstack + 0)
0b13 : 8d fd 9e STA $9efd ; (sstack + 1)
0b16 : a9 10 __ LDA #$10
0b18 : 8d fe 9e STA $9efe ; (sstack + 2)
0b1b : a9 00 __ LDA #$00
0b1d : 8d ff 9e STA $9eff ; (sstack + 3)
0b20 : 18 __ __ CLC
0b21 : a5 57 __ LDA T5 + 0 
0b23 : 69 01 __ ADC #$01
0b25 : 8d f8 42 STA $42f8 ; (off1 + 0)
0b28 : 90 03 __ BCC $0b2d ; (main.s1029 + 0)
.s1028:
0b2a : ee f9 42 INC $42f9 ; (off1 + 1)
.s1029:
0b2d : a9 60 __ LDA #$60
0b2f : 85 32 __ STA P5 
0b31 : a9 3e __ LDA #$3e
0b33 : 85 33 __ STA P6 
0b35 : 20 c1 1f JSR $1fc1 ; (SetPaletteIndex.s0 + 0)
.s24:
0b38 : a9 01 __ LDA #$01
0b3a : 8d 2c 9f STA $9f2c 
0b3d : 20 97 1e JSR $1e97 ; (zsm_fill.s0 + 0)
0b40 : a9 00 __ LDA #$00
0b42 : 8d 2c 9f STA $9f2c 
0b45 : 20 13 21 JSR $2113 ; (frame_wait.l1 + 0)
0b48 : ee d0 42 INC $42d0 ; (FrameCount + 0)
0b4b : d0 03 __ BNE $0b50 ; (main.s1031 + 0)
.s1030:
0b4d : ee d1 42 INC $42d1 ; (FrameCount + 1)
.s1031:
0b50 : e6 52 __ INC T1 + 0 
0b52 : f0 03 __ BEQ $0b57 ; (main.s1032 + 0)
0b54 : 4c d8 08 JMP $08d8 ; (main.l3 + 0)
.s1032:
0b57 : e6 53 __ INC T1 + 1 
0b59 : 4c d8 08 JMP $08d8 ; (main.l3 + 0)
.s54:
0b5c : 09 00 __ ORA #$00
0b5e : d0 20 __ BNE $0b80 ; (main.s1004 + 0)
.s27:
0b60 : a5 57 __ LDA T5 + 0 
0b62 : 85 3b __ STA ACCU + 0 
0b64 : ad f9 42 LDA $42f9 ; (off1 + 1)
0b67 : 85 3c __ STA ACCU + 1 
0b69 : a9 1d __ LDA #$1d
0b6b : 85 23 __ STA WORK + 0 
0b6d : a9 06 __ LDA #$06
0b6f : 85 24 __ STA WORK + 1 
0b71 : 20 3c 21 JSR $213c ; (divmod + 0)
0b74 : 18 __ __ CLC
0b75 : a9 20 __ LDA #$20
0b77 : 65 25 __ ADC WORK + 2 
0b79 : 85 47 __ STA T6 + 0 
0b7b : a9 44 __ LDA #$44
0b7d : 4c cb 0b JMP $0bcb ; (main.s1020 + 0)
.s1004:
0b80 : c9 01 __ CMP #$01
0b82 : f0 2a __ BEQ $0bae ; (main.s32 + 0)
.s1003:
0b84 : c9 02 __ CMP #$02
0b86 : f0 03 __ BEQ $0b8b ; (main.s37 + 0)
0b88 : 4c 04 0b JMP $0b04 ; (main.s26 + 0)
.s37:
0b8b : a5 57 __ LDA T5 + 0 
0b8d : 85 3b __ STA ACCU + 0 
0b8f : ad f9 42 LDA $42f9 ; (off1 + 1)
0b92 : 85 3c __ STA ACCU + 1 
0b94 : a9 c5 __ LDA #$c5
0b96 : 85 23 __ STA WORK + 0 
0b98 : a9 00 __ LDA #$00
0b9a : 85 24 __ STA WORK + 1 
0b9c : 20 3c 21 JSR $213c ; (divmod + 0)
0b9f : a6 25 __ LDX WORK + 2 
0ba1 : bd 00 52 LDA $5200,x ; (Song2 + 0)
.s75:
0ba4 : 09 00 __ ORA #$00
0ba6 : d0 03 __ BNE $0bab ; (main.s75 + 7)
0ba8 : 4c 04 0b JMP $0b04 ; (main.s26 + 0)
0bab : 4c f8 0a JMP $0af8 ; (main.s84 + 0)
.s32:
0bae : a5 57 __ LDA T5 + 0 
0bb0 : 85 3b __ STA ACCU + 0 
0bb2 : ad f9 42 LDA $42f9 ; (off1 + 1)
0bb5 : 85 3c __ STA ACCU + 1 
0bb7 : a9 5c __ LDA #$5c
0bb9 : 85 23 __ STA WORK + 0 
0bbb : a9 07 __ LDA #$07
0bbd : 85 24 __ STA WORK + 1 
0bbf : 20 3c 21 JSR $213c ; (divmod + 0)
0bc2 : 18 __ __ CLC
0bc3 : a9 3e __ LDA #$3e
0bc5 : 65 25 __ ADC WORK + 2 
0bc7 : 85 47 __ STA T6 + 0 
0bc9 : a9 4a __ LDA #$4a
.s1020:
0bcb : 65 26 __ ADC WORK + 3 
0bcd : 85 48 __ STA T6 + 1 
0bcf : a0 00 __ LDY #$00
0bd1 : b1 47 __ LDA (T6 + 0),y 
0bd3 : 4c a4 0b JMP $0ba4 ; (main.s75 + 0)
.s14:
0bd6 : e6 54 __ INC T2 + 0 
0bd8 : 4c 1e 0a JMP $0a1e ; (main.s83 + 0)
.s5:
0bdb : a5 54 __ LDA T2 + 0 
0bdd : 85 32 __ STA P5 
0bdf : a9 00 __ LDA #$00
0be1 : 85 33 __ STA P6 
0be3 : ad d2 42 LDA $42d2 ; (LastSelectedSong + 0)
0be6 : 85 34 __ STA P7 
0be8 : a9 00 __ LDA #$00
0bea : 85 35 __ STA P8 
0bec : 20 99 1d JSR $1d99 ; (PlayZSM.s0 + 0)
0bef : a5 32 __ LDA P5 
0bf1 : 8d d2 42 STA $42d2 ; (LastSelectedSong + 0)
0bf4 : ee d3 42 INC $42d3 ; (PalTimer + 0)
0bf7 : f0 03 __ BEQ $0bfc ; (main.s1024 + 0)
0bf9 : 4c 62 09 JMP $0962 ; (main.s69 + 0)
.s1024:
0bfc : ee d4 42 INC $42d4 ; (PalTimer + 1)
0bff : 4c 62 09 JMP $0962 ; (main.s69 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0c02 : 78 __ __ SEI
0c03 : ad 14 03 LDA $0314 
0c06 : 8d fb 42 STA $42fb ; (oirq + 0)
0c09 : ad 15 03 LDA $0315 
0c0c : 8d fc 42 STA $42fc ; (oirq + 1)
0c0f : a9 1b __ LDA #$1b
0c11 : 8d 14 03 STA $0314 
0c14 : a9 0c __ LDA #$0c
0c16 : 8d 15 03 STA $0315 
0c19 : 58 __ __ CLI
.s1001:
0c1a : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
42fb : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c1b : 20 21 0c JSR $0c21 ; (irq.s1000 + 0)
0c1e : 6c fb 42 JMP ($42fb)
--------------------------------------------------------------------
irq:
.s1000:
0c21 : a5 2d __ LDA P0 
0c23 : 48 __ __ PHA
0c24 : a5 2e __ LDA P1 
0c26 : 48 __ __ PHA
0c27 : a5 3b __ LDA ACCU + 0 
0c29 : 48 __ __ PHA
0c2a : a5 3c __ LDA ACCU + 1 
0c2c : 48 __ __ PHA
0c2d : a5 47 __ LDA T0 + 0 
0c2f : 48 __ __ PHA
0c30 : a5 48 __ LDA $48 
0c32 : 48 __ __ PHA
0c33 : a5 49 __ LDA $49 
0c35 : 48 __ __ PHA
0c36 : a5 4a __ LDA $4a 
0c38 : 48 __ __ PHA
0c39 : a5 4b __ LDA $4b 
0c3b : 48 __ __ PHA
0c3c : a5 4c __ LDA $4c 
0c3e : 48 __ __ PHA
0c3f : a5 4d __ LDA $4d 
0c41 : 48 __ __ PHA
0c42 : a5 4e __ LDA $4e 
0c44 : 48 __ __ PHA
0c45 : a5 4f __ LDA $4f 
0c47 : 48 __ __ PHA
0c48 : a5 50 __ LDA $50 
0c4a : 48 __ __ PHA
.s0:
0c4b : ad eb 21 LDA $21eb ; (zsm_playing + 0)
0c4e : f0 08 __ BEQ $0c58 ; (irq.s1001 + 0)
.s4:
0c50 : ad ec 21 LDA $21ec ; (zsm_finished + 0)
0c53 : d0 03 __ BNE $0c58 ; (irq.s1001 + 0)
.s1:
0c55 : 20 83 0c JSR $0c83 ; (zsm_play.s0 + 0)
.s1001:
0c58 : 68 __ __ PLA
0c59 : 85 50 __ STA $50 
0c5b : 68 __ __ PLA
0c5c : 85 4f __ STA $4f 
0c5e : 68 __ __ PLA
0c5f : 85 4e __ STA $4e 
0c61 : 68 __ __ PLA
0c62 : 85 4d __ STA $4d 
0c64 : 68 __ __ PLA
0c65 : 85 4c __ STA $4c 
0c67 : 68 __ __ PLA
0c68 : 85 4b __ STA $4b 
0c6a : 68 __ __ PLA
0c6b : 85 4a __ STA $4a 
0c6d : 68 __ __ PLA
0c6e : 85 49 __ STA $49 
0c70 : 68 __ __ PLA
0c71 : 85 48 __ STA $48 
0c73 : 68 __ __ PLA
0c74 : 85 47 __ STA T0 + 0 
0c76 : 68 __ __ PLA
0c77 : 85 3c __ STA ACCU + 1 
0c79 : 68 __ __ PLA
0c7a : 85 3b __ STA ACCU + 0 
0c7c : 68 __ __ PLA
0c7d : 85 2e __ STA P1 
0c7f : 68 __ __ PLA
0c80 : 85 2d __ STA P0 
0c82 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
21eb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
21ec : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c83 : ad ed 21 LDA $21ed ; (zsm_paused + 0)
0c86 : f0 01 __ BEQ $0c89 ; (zsm_play.s2 + 0)
0c88 : 60 __ __ RTS
.s2:
0c89 : ad fd 42 LDA $42fd ; (zsm_delay + 0)
0c8c : f0 03 __ BEQ $0c91 ; (zsm_play.s5 + 0)
0c8e : 4c be 0d JMP $0dbe ; (zsm_play.s4 + 0)
.s5:
0c91 : ad 25 9f LDA $9f25 
0c94 : 85 47 __ STA T0 + 0 
0c96 : ad 25 9f LDA $9f25 
0c99 : 29 fe __ AND #$fe
0c9b : 8d 25 9f STA $9f25 
0c9e : ad 20 9f LDA $9f20 
0ca1 : 85 49 __ STA T2 + 0 
0ca3 : ad 21 9f LDA $9f21 
0ca6 : 85 4a __ STA T2 + 1 
0ca8 : ad 22 9f LDA $9f22 
0cab : 85 48 __ STA T1 + 0 
.l8:
0cad : ad fe 42 LDA $42fe ; (zsm_pos + 0)
0cb0 : 85 4b __ STA T3 + 0 
0cb2 : 18 __ __ CLC
0cb3 : 69 01 __ ADC #$01
0cb5 : 85 4d __ STA T4 + 0 
0cb7 : 8d fe 42 STA $42fe ; (zsm_pos + 0)
0cba : ad ff 42 LDA $42ff ; (zsm_pos + 1)
0cbd : aa __ __ TAX
0cbe : 69 00 __ ADC #$00
0cc0 : 85 4e __ STA T4 + 1 
0cc2 : 8d ff 42 STA $42ff ; (zsm_pos + 1)
0cc5 : 18 __ __ CLC
0cc6 : a9 be __ LDA #$be
0cc8 : 65 4b __ ADC T3 + 0 
0cca : 85 3b __ STA ACCU + 0 
0ccc : 8a __ __ TXA
0ccd : 29 03 __ AND #$03
0ccf : 69 54 __ ADC #$54
0cd1 : 85 3c __ STA ACCU + 1 
0cd3 : a0 00 __ LDY #$00
0cd5 : b1 3b __ LDA (ACCU + 0),y 
0cd7 : c9 40 __ CMP #$40
0cd9 : b0 03 __ BCS $0cde ; (zsm_play.s12 + 0)
0cdb : 4c 89 0d JMP $0d89 ; (zsm_play.s11 + 0)
.s12:
0cde : d0 22 __ BNE $0d02 ; (zsm_play.s15 + 0)
.s14:
0ce0 : 18 __ __ CLC
0ce1 : a9 be __ LDA #$be
0ce3 : 65 4d __ ADC T4 + 0 
0ce5 : 85 4b __ STA T3 + 0 
0ce7 : a5 4e __ LDA T4 + 1 
0ce9 : 29 03 __ AND #$03
0ceb : 69 54 __ ADC #$54
0ced : 85 4c __ STA T3 + 1 
0cef : b1 4b __ LDA (T3 + 0),y 
0cf1 : 29 3f __ AND #$3f
0cf3 : 18 __ __ CLC
0cf4 : 65 4d __ ADC T4 + 0 
0cf6 : 8d fe 42 STA $42fe ; (zsm_pos + 0)
0cf9 : 98 __ __ TYA
0cfa : 65 4e __ ADC T4 + 1 
0cfc : 8d ff 42 STA $42ff ; (zsm_pos + 1)
0cff : 4c ad 0c JMP $0cad ; (zsm_play.l8 + 0)
.s15:
0d02 : 09 00 __ ORA #$00
0d04 : 30 5b __ BMI $0d61 ; (zsm_play.s18 + 0)
.s17:
0d06 : 29 3f __ AND #$3f
0d08 : f0 a3 __ BEQ $0cad ; (zsm_play.l8 + 0)
.s29:
0d0a : 84 50 __ STY T7 + 0 
0d0c : 85 4f __ STA T6 + 0 
0d0e : 18 __ __ CLC
.l1012:
0d0f : a9 be __ LDA #$be
0d11 : 6d fe 42 ADC $42fe ; (zsm_pos + 0)
0d14 : 85 4d __ STA T4 + 0 
0d16 : ad ff 42 LDA $42ff ; (zsm_pos + 1)
0d19 : 29 03 __ AND #$03
0d1b : 69 54 __ ADC #$54
0d1d : 85 4e __ STA T4 + 1 
0d1f : a0 00 __ LDY #$00
0d21 : b1 4d __ LDA (T4 + 0),y 
0d23 : 85 2d __ STA P0 
0d25 : ad fe 42 LDA $42fe ; (zsm_pos + 0)
0d28 : 18 __ __ CLC
0d29 : 69 01 __ ADC #$01
0d2b : aa __ __ TAX
0d2c : ad ff 42 LDA $42ff ; (zsm_pos + 1)
0d2f : 69 00 __ ADC #$00
0d31 : 29 03 __ AND #$03
0d33 : 85 4c __ STA T3 + 1 
0d35 : 8a __ __ TXA
0d36 : 18 __ __ CLC
0d37 : 69 be __ ADC #$be
0d39 : 85 4b __ STA T3 + 0 
0d3b : a9 54 __ LDA #$54
0d3d : 65 4c __ ADC T3 + 1 
0d3f : 85 4c __ STA T3 + 1 
0d41 : b1 4b __ LDA (T3 + 0),y 
0d43 : 85 2e __ STA P1 
0d45 : 20 c2 0d JSR $0dc2 ; (sfx_put.l1 + 0)
0d48 : ad fe 42 LDA $42fe ; (zsm_pos + 0)
0d4b : 18 __ __ CLC
0d4c : 69 02 __ ADC #$02
0d4e : 8d fe 42 STA $42fe ; (zsm_pos + 0)
0d51 : 90 03 __ BCC $0d56 ; (zsm_play.s1015 + 0)
.s1014:
0d53 : ee ff 42 INC $42ff ; (zsm_pos + 1)
.s1015:
0d56 : e6 50 __ INC T7 + 0 
0d58 : a5 50 __ LDA T7 + 0 
0d5a : c5 4f __ CMP T6 + 0 
0d5c : 90 b1 __ BCC $0d0f ; (zsm_play.l1012 + 0)
0d5e : 4c ad 0c JMP $0cad ; (zsm_play.l8 + 0)
.s18:
0d61 : c9 80 __ CMP #$80
0d63 : d0 07 __ BNE $0d6c ; (zsm_play.s25 + 0)
.s24:
0d65 : a9 01 __ LDA #$01
0d67 : 8d ec 21 STA $21ec ; (zsm_finished + 0)
0d6a : d0 08 __ BNE $0d74 ; (zsm_play.s10 + 0)
.s25:
0d6c : 29 7f __ AND #$7f
0d6e : 38 __ __ SEC
0d6f : e9 01 __ SBC #$01
0d71 : 8d fd 42 STA $42fd ; (zsm_delay + 0)
.s10:
0d74 : a5 49 __ LDA T2 + 0 
0d76 : 8d 20 9f STA $9f20 
0d79 : a5 4a __ LDA T2 + 1 
0d7b : 8d 21 9f STA $9f21 
0d7e : a5 48 __ LDA T1 + 0 
0d80 : 8d 22 9f STA $9f22 
0d83 : a5 47 __ LDA T0 + 0 
0d85 : 8d 25 9f STA $9f25 
.s1001:
0d88 : 60 __ __ RTS
.s11:
0d89 : 29 3f __ AND #$3f
0d8b : 09 c0 __ ORA #$c0
0d8d : 8d 20 9f STA $9f20 
0d90 : a9 f9 __ LDA #$f9
0d92 : 8d 21 9f STA $9f21 
0d95 : a9 01 __ LDA #$01
0d97 : 8d 22 9f STA $9f22 
0d9a : a5 4b __ LDA T3 + 0 
0d9c : 69 02 __ ADC #$02
0d9e : 8d fe 42 STA $42fe ; (zsm_pos + 0)
0da1 : 90 01 __ BCC $0da4 ; (zsm_play.s1017 + 0)
.s1016:
0da3 : e8 __ __ INX
.s1017:
0da4 : 8e ff 42 STX $42ff ; (zsm_pos + 1)
0da7 : 18 __ __ CLC
0da8 : a9 be __ LDA #$be
0daa : 65 4d __ ADC T4 + 0 
0dac : 85 4b __ STA T3 + 0 
0dae : a5 4e __ LDA T4 + 1 
0db0 : 29 03 __ AND #$03
0db2 : 69 54 __ ADC #$54
0db4 : 85 4c __ STA T3 + 1 
0db6 : b1 4b __ LDA (T3 + 0),y 
0db8 : 8d 23 9f STA $9f23 
0dbb : 4c ad 0c JMP $0cad ; (zsm_play.l8 + 0)
.s4:
0dbe : ce fd 42 DEC $42fd ; (zsm_delay + 0)
0dc1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
21ed : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
42fd : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
54be : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
42fe : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0dc2 : ad 41 9f LDA $9f41 
0dc5 : 30 fb __ BMI $0dc2 ; (sfx_put.l1 + 0)
.s3:
0dc7 : a5 2d __ LDA P0 ; (index + 0)
0dc9 : 8d 40 9f STA $9f40 
0dcc : ea __ __ NOP
0dcd : ea __ __ NOP
0dce : ea __ __ NOP
0dcf : ea __ __ NOP
0dd0 : a5 2e __ LDA P1 ; (data + 0)
0dd2 : a6 2d __ LDX P0 ; (index + 0)
0dd4 : 9d 00 59 STA $5900,x ; (vera_fm_s_regs + 0)
0dd7 : 8d 41 9f STA $9f41 
.s1001:
0dda : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
5900 : __ __ __ BSS	128
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0ddb : a9 93 __ LDA #$93
0ddd : 85 2d __ STA P0 
0ddf : a9 00 __ LDA #$00
0de1 : 85 2e __ STA P1 
0de3 : 20 18 0e JSR $0e18 ; (putch.s0 + 0)
0de6 : a9 11 __ LDA #$11
0de8 : 8d 22 9f STA $9f22 
0deb : a2 00 __ LDX #$00
.l2:
0ded : 8a __ __ TXA
0dee : 18 __ __ CLC
0def : 69 b0 __ ADC #$b0
0df1 : 8d 21 9f STA $9f21 
0df4 : a9 00 __ LDA #$00
0df6 : 8d 20 9f STA $9f20 
0df9 : a0 80 __ LDY #$80
.l1003:
0dfb : a9 20 __ LDA #$20
0dfd : 8d 23 9f STA $9f23 
0e00 : a9 01 __ LDA #$01
0e02 : 8d 23 9f STA $9f23 
0e05 : a9 20 __ LDA #$20
0e07 : 8d 24 9f STA $9f24 
0e0a : a9 01 __ LDA #$01
0e0c : 8d 24 9f STA $9f24 
0e0f : 88 __ __ DEY
0e10 : d0 e9 __ BNE $0dfb ; (ClearVERAScreen.l1003 + 0)
.s1004:
0e12 : e8 __ __ INX
0e13 : e0 40 __ CPX #$40
0e15 : 90 d6 __ BCC $0ded ; (ClearVERAScreen.l2 + 0)
.s1001:
0e17 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0e18 : a5 2d __ LDA P0 
0e1a : 20 d2 ff JSR $ffd2 
.s1001:
0e1d : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e1e : a9 00 __ LDA #$00
0e20 : 8d 25 9f STA $9f25 
0e23 : a9 80 __ LDA #$80
0e25 : 8d 2b 9f STA $9f2b 
0e28 : 8d 2a 9f STA $9f2a 
0e2b : a9 62 __ LDA #$62
0e2d : 8d 2d 9f STA $9f2d 
0e30 : a9 68 __ LDA #$68
0e32 : 8d 34 9f STA $9f34 
0e35 : a9 00 __ LDA #$00
0e37 : 85 2d __ STA P0 
0e39 : 85 2e __ STA P1 
0e3b : 85 2f __ STA P2 
0e3d : 85 30 __ STA P3 
0e3f : 85 31 __ STA P4 
0e41 : 20 32 18 JSR $1832 ; (tileBaseConfig.s0 + 0)
0e44 : 8d 2f 9f STA $9f2f 
0e47 : a9 00 __ LDA #$00
0e49 : 85 2d __ STA P0 
0e4b : a9 20 __ LDA #$20
0e4d : 85 2f __ STA P2 
0e4f : 20 4a 18 JSR $184a ; (memoryToMapMemoryAddress.s0 + 0)
0e52 : 8d 2e 9f STA $9f2e 
0e55 : a9 01 __ LDA #$01
0e57 : 8d 22 9f STA $9f22 
0e5a : a2 80 __ LDX #$80
.l6:
0e5c : a0 50 __ LDY #$50
.l1071:
0e5e : a9 00 __ LDA #$00
0e60 : 8d 24 9f STA $9f24 
0e63 : a9 08 __ LDA #$08
0e65 : 8d 24 9f STA $9f24 
0e68 : 88 __ __ DEY
0e69 : d0 f3 __ BNE $0e5e ; (SetUpSprites.l1071 + 0)
.s1072:
0e6b : ca __ __ DEX
0e6c : d0 ee __ BNE $0e5c ; (SetUpSprites.l6 + 0)
.s4:
0e6e : 86 4e __ STX T1 + 0 
0e70 : a9 00 __ LDA #$00
0e72 : 85 2d __ STA P0 
0e74 : 85 2e __ STA P1 
0e76 : 85 2f __ STA P2 
0e78 : 85 30 __ STA P3 
0e7a : a9 20 __ LDA #$20
0e7c : 85 33 __ STA P6 
0e7e : a9 03 __ LDA #$03
0e80 : 85 34 __ STA P7 
0e82 : a9 ee __ LDA #$ee
0e84 : 85 31 __ STA P4 
0e86 : a9 21 __ LDA #$21
0e88 : 85 32 __ STA P5 
0e8a : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
0e8d : a9 10 __ LDA #$10
0e8f : 8d 22 9f STA $9f22 
0e92 : a9 00 __ LDA #$00
0e94 : 8d 20 9f STA $9f20 
0e97 : a9 20 __ LDA #$20
0e99 : 8d 21 9f STA $9f21 
.l10:
0e9c : a9 00 __ LDA #$00
0e9e : 85 4f __ STA T2 + 0 
.l14:
0ea0 : 20 92 18 JSR $1892 ; (rand.s0 + 0)
0ea3 : a9 31 __ LDA #$31
0ea5 : 85 23 __ STA WORK + 0 
0ea7 : a9 00 __ LDA #$00
0ea9 : 85 24 __ STA WORK + 1 
0eab : 20 3c 21 JSR $213c ; (divmod + 0)
0eae : a5 4e __ LDA T1 + 0 
0eb0 : d0 03 __ BNE $0eb5 ; (SetUpSprites.s1041 + 0)
0eb2 : 4c 98 0f JMP $0f98 ; (SetUpSprites.s1037 + 0)
.s1041:
0eb5 : a9 10 __ LDA #$10
0eb7 : c5 4e __ CMP T1 + 0 
0eb9 : a9 00 __ LDA #$00
0ebb : 2a __ __ ROL
0ebc : d0 03 __ BNE $0ec1 ; (SetUpSprites.s1069 + 0)
0ebe : 4c 98 0f JMP $0f98 ; (SetUpSprites.s1037 + 0)
.s1069:
0ec1 : a8 __ __ TAY
0ec2 : a5 4f __ LDA T2 + 0 
0ec4 : f0 06 __ BEQ $0ecc ; (SetUpSprites.s26 + 0)
.s1068:
0ec6 : a9 10 __ LDA #$10
0ec8 : c5 4f __ CMP T2 + 0 
0eca : b0 18 __ BCS $0ee4 ; (SetUpSprites.s1065 + 0)
.s26:
0ecc : 98 __ __ TYA
0ecd : d0 03 __ BNE $0ed2 ; (SetUpSprites.s1067 + 0)
0ecf : 4c 98 0f JMP $0f98 ; (SetUpSprites.s1037 + 0)
.s1067:
0ed2 : a5 4f __ LDA T2 + 0 
0ed4 : c9 3e __ CMP #$3e
0ed6 : b0 03 __ BCS $0edb ; (SetUpSprites.s1066 + 0)
0ed8 : 4c 98 0f JMP $0f98 ; (SetUpSprites.s1037 + 0)
.s1066:
0edb : a9 4e __ LDA #$4e
0edd : c5 4f __ CMP T2 + 0 
0edf : b0 03 __ BCS $0ee4 ; (SetUpSprites.s1065 + 0)
0ee1 : 4c 98 0f JMP $0f98 ; (SetUpSprites.s1037 + 0)
.s1065:
0ee4 : a5 4e __ LDA T1 + 0 
0ee6 : c9 01 __ CMP #$01
0ee8 : f0 79 __ BEQ $0f63 ; (SetUpSprites.s1064 + 0)
.s1057:
0eea : c9 10 __ CMP #$10
0eec : d0 30 __ BNE $0f1e ; (SetUpSprites.s1049 + 0)
.s1056:
0eee : a5 4f __ LDA T2 + 0 
0ef0 : c9 01 __ CMP #$01
0ef2 : f0 04 __ BEQ $0ef8 ; (SetUpSprites.s46 + 0)
.s1055:
0ef4 : c9 3e __ CMP #$3e
0ef6 : d0 04 __ BNE $0efc ; (SetUpSprites.s1054 + 0)
.s46:
0ef8 : a9 14 __ LDA #$14
0efa : d0 5a __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s1054:
0efc : c9 10 __ CMP #$10
0efe : 90 0c __ BCC $0f0c ; (SetUpSprites.s52 + 0)
.s1053:
0f00 : a9 3e __ LDA #$3e
0f02 : c5 4f __ CMP T2 + 0 
0f04 : b0 0a __ BCS $0f10 ; (SetUpSprites.s1051 + 0)
.s1052:
0f06 : a5 4f __ LDA T2 + 0 
0f08 : c9 4e __ CMP #$4e
0f0a : b0 04 __ BCS $0f10 ; (SetUpSprites.s1051 + 0)
.s52:
0f0c : a9 15 __ LDA #$15
0f0e : d0 46 __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s1051:
0f10 : a5 4f __ LDA T2 + 0 
0f12 : c9 10 __ CMP #$10
0f14 : f0 04 __ BEQ $0f1a ; (SetUpSprites.s59 + 0)
.s1050:
0f16 : c9 4e __ CMP #$4e
0f18 : d0 04 __ BNE $0f1e ; (SetUpSprites.s1049 + 0)
.s59:
0f1a : a9 16 __ LDA #$16
0f1c : d0 38 __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s1049:
0f1e : a5 4f __ LDA T2 + 0 
0f20 : c9 01 __ CMP #$01
0f22 : d0 08 __ BNE $0f2c ; (SetUpSprites.s1047 + 0)
.s1048:
0f24 : a5 4e __ LDA T1 + 0 
0f26 : c9 10 __ CMP #$10
0f28 : 90 06 __ BCC $0f30 ; (SetUpSprites.s65 + 0)
.s1086:
0f2a : a5 4f __ LDA T2 + 0 
.s1047:
0f2c : c9 3e __ CMP #$3e
0f2e : d0 04 __ BNE $0f34 ; (SetUpSprites.s1046 + 0)
.s65:
0f30 : a9 12 __ LDA #$12
0f32 : d0 22 __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s1046:
0f34 : c9 10 __ CMP #$10
0f36 : d0 06 __ BNE $0f3e ; (SetUpSprites.s1044 + 0)
.s1045:
0f38 : a5 4e __ LDA T1 + 0 
0f3a : c9 10 __ CMP #$10
0f3c : 90 12 __ BCC $0f50 ; (SetUpSprites.s70 + 0)
.s1044:
0f3e : a5 4f __ LDA T2 + 0 
0f40 : c9 4e __ CMP #$4e
0f42 : d0 10 __ BNE $0f54 ; (SetUpSprites.s71 + 0)
.s1043:
0f44 : a5 4e __ LDA T1 + 0 
0f46 : c9 10 __ CMP #$10
0f48 : b0 0a __ BCS $0f54 ; (SetUpSprites.s71 + 0)
.s1042:
0f4a : a9 01 __ LDA #$01
0f4c : c5 4e __ CMP T1 + 0 
0f4e : b0 04 __ BCS $0f54 ; (SetUpSprites.s71 + 0)
.s70:
0f50 : a9 17 __ LDA #$17
0f52 : d0 02 __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s71:
0f54 : a9 13 __ LDA #$13
.s296:
0f56 : 8d 23 9f STA $9f23 
0f59 : a9 00 __ LDA #$00
0f5b : 8d 23 9f STA $9f23 
0f5e : e6 4f __ INC T2 + 0 
0f60 : 4c a0 0e JMP $0ea0 ; (SetUpSprites.l14 + 0)
.s1064:
0f63 : a5 4f __ LDA T2 + 0 
0f65 : c9 01 __ CMP #$01
0f67 : f0 04 __ BEQ $0f6d ; (SetUpSprites.s27 + 0)
.s1063:
0f69 : c9 3e __ CMP #$3e
0f6b : d0 04 __ BNE $0f71 ; (SetUpSprites.s1062 + 0)
.s27:
0f6d : a9 0f __ LDA #$0f
0f6f : d0 e5 __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s1062:
0f71 : c9 10 __ CMP #$10
0f73 : 90 0c __ BCC $0f81 ; (SetUpSprites.s33 + 0)
.s1061:
0f75 : a9 3e __ LDA #$3e
0f77 : c5 4f __ CMP T2 + 0 
0f79 : b0 0a __ BCS $0f85 ; (SetUpSprites.s1059 + 0)
.s1060:
0f7b : a5 4f __ LDA T2 + 0 
0f7d : c9 4e __ CMP #$4e
0f7f : b0 04 __ BCS $0f85 ; (SetUpSprites.s1059 + 0)
.s33:
0f81 : a9 10 __ LDA #$10
0f83 : d0 d1 __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s1059:
0f85 : a5 4f __ LDA T2 + 0 
0f87 : c9 10 __ CMP #$10
0f89 : f0 04 __ BEQ $0f8f ; (SetUpSprites.s40 + 0)
.s1058:
0f8b : c9 4e __ CMP #$4e
0f8d : d0 04 __ BNE $0f93 ; (SetUpSprites.s1085 + 0)
.s40:
0f8f : a9 11 __ LDA #$11
0f91 : d0 c3 __ BNE $0f56 ; (SetUpSprites.s296 + 0)
.s1085:
0f93 : a5 4e __ LDA T1 + 0 
0f95 : 4c ea 0e JMP $0eea ; (SetUpSprites.s1057 + 0)
.s1037:
0f98 : a5 4e __ LDA T1 + 0 
0f9a : c9 36 __ CMP #$36
0f9c : 90 03 __ BCC $0fa1 ; (SetUpSprites.s1036 + 0)
0f9e : 4c 88 17 JMP $1788 ; (SetUpSprites.s1031 + 0)
.s1036:
0fa1 : c9 2c __ CMP #$2c
0fa3 : b0 03 __ BCS $0fa8 ; (SetUpSprites.s1035 + 0)
0fa5 : 4c 88 17 JMP $1788 ; (SetUpSprites.s1031 + 0)
.s1035:
0fa8 : f0 04 __ BEQ $0fae ; (SetUpSprites.s81 + 0)
.s1034:
0faa : c9 34 __ CMP #$34
0fac : d0 04 __ BNE $0fb2 ; (SetUpSprites.s1033 + 0)
.s81:
0fae : a9 0a __ LDA #$0a
0fb0 : d0 0e __ BNE $0fc0 ; (SetUpSprites.s279 + 0)
.s1033:
0fb2 : c9 2d __ CMP #$2d
0fb4 : f0 04 __ BEQ $0fba ; (SetUpSprites.s85 + 0)
.s1032:
0fb6 : c9 35 __ CMP #$35
0fb8 : d0 04 __ BNE $0fbe ; (SetUpSprites.s86 + 0)
.s85:
0fba : a9 0b __ LDA #$0b
0fbc : d0 02 __ BNE $0fc0 ; (SetUpSprites.s279 + 0)
.s86:
0fbe : a9 04 __ LDA #$04
.s279:
0fc0 : 8d 23 9f STA $9f23 
0fc3 : a9 00 __ LDA #$00
0fc5 : 8d 23 9f STA $9f23 
0fc8 : e6 4f __ INC T2 + 0 
0fca : 30 03 __ BMI $0fcf ; (SetUpSprites.s11 + 0)
0fcc : 4c a0 0e JMP $0ea0 ; (SetUpSprites.l14 + 0)
.s11:
0fcf : e6 4e __ INC T1 + 0 
0fd1 : a5 4e __ LDA T1 + 0 
0fd3 : c9 40 __ CMP #$40
0fd5 : b0 03 __ BCS $0fda ; (SetUpSprites.s12 + 0)
0fd7 : 4c 9c 0e JMP $0e9c ; (SetUpSprites.l10 + 0)
.s12:
0fda : a9 c0 __ LDA #$c0
0fdc : 85 2d __ STA P0 
0fde : a9 56 __ LDA #$56
0fe0 : 85 2e __ STA P1 
0fe2 : a9 01 __ LDA #$01
0fe4 : 85 2f __ STA P2 
0fe6 : a9 00 __ LDA #$00
0fe8 : 85 30 __ STA P3 
0fea : 85 33 __ STA P6 
0fec : a9 02 __ LDA #$02
0fee : 85 34 __ STA P7 
0ff0 : a9 10 __ LDA #$10
0ff2 : 85 31 __ STA P4 
0ff4 : a9 25 __ LDA #$25
0ff6 : 85 32 __ STA P5 
0ff8 : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
0ffb : a9 00 __ LDA #$00
0ffd : 85 2d __ STA P0 
0fff : a9 59 __ LDA #$59
1001 : 85 2e __ STA P1 
1003 : a9 02 __ LDA #$02
1005 : 85 34 __ STA P7 
1007 : a9 10 __ LDA #$10
1009 : 85 31 __ STA P4 
100b : a9 27 __ LDA #$27
100d : 85 32 __ STA P5 
100f : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
1012 : a9 b6 __ LDA #$b6
1014 : 85 2e __ STA P1 
1016 : a9 0a __ LDA #$0a
1018 : 85 2f __ STA P2 
101a : 85 34 __ STA P7 
101c : a9 02 __ LDA #$02
101e : 85 31 __ STA P4 
1020 : 85 32 __ STA P5 
1022 : a9 03 __ LDA #$03
1024 : 85 33 __ STA P6 
1026 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1029 : a9 68 __ LDA #$68
102b : 85 2e __ STA P1 
102d : a9 00 __ LDA #$00
102f : 85 2f __ STA P2 
1031 : a9 b6 __ LDA #$b6
1033 : 85 30 __ STA P3 
1035 : a9 01 __ LDA #$01
1037 : 85 31 __ STA P4 
1039 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
103c : a9 01 __ LDA #$01
103e : 85 2d __ STA P0 
1040 : a9 c8 __ LDA #$c8
1042 : 85 2e __ STA P1 
1044 : a9 0a __ LDA #$0a
1046 : 85 2f __ STA P2 
1048 : a9 00 __ LDA #$00
104a : 85 30 __ STA P3 
104c : a9 02 __ LDA #$02
104e : 85 31 __ STA P4 
1050 : a9 09 __ LDA #$09
1052 : 85 34 __ STA P7 
1054 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1057 : a9 f0 __ LDA #$f0
1059 : 85 2e __ STA P1 
105b : a9 01 __ LDA #$01
105d : 85 2f __ STA P2 
105f : 85 31 __ STA P4 
1061 : a9 b6 __ LDA #$b6
1063 : 85 30 __ STA P3 
1065 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1068 : a9 00 __ LDA #$00
106a : 85 2d __ STA P0 
106c : 85 30 __ STA P3 
106e : 85 33 __ STA P6 
1070 : a9 30 __ LDA #$30
1072 : 85 2e __ STA P1 
1074 : a9 01 __ LDA #$01
1076 : 85 34 __ STA P7 
1078 : a9 00 __ LDA #$00
107a : 85 31 __ STA P4 
107c : a9 2a __ LDA #$2a
107e : 85 32 __ STA P5 
1080 : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
1083 : a9 16 __ LDA #$16
1085 : 85 2d __ STA P0 
1087 : a9 80 __ LDA #$80
1089 : 85 2e __ STA P1 
108b : a9 09 __ LDA #$09
108d : 85 2f __ STA P2 
108f : a9 01 __ LDA #$01
1091 : 85 31 __ STA P4 
1093 : 85 34 __ STA P7 
1095 : a9 02 __ LDA #$02
1097 : 85 32 __ STA P5 
1099 : a9 03 __ LDA #$03
109b : 85 33 __ STA P6 
109d : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
10a0 : a9 30 __ LDA #$30
10a2 : 85 2e __ STA P1 
10a4 : a9 01 __ LDA #$01
10a6 : 85 2f __ STA P2 
10a8 : a9 b8 __ LDA #$b8
10aa : 85 30 __ STA P3 
10ac : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
10af : a9 00 __ LDA #$00
10b1 : 85 2d __ STA P0 
10b3 : 85 30 __ STA P3 
10b5 : 85 33 __ STA P6 
10b7 : a9 37 __ LDA #$37
10b9 : 85 2e __ STA P1 
10bb : a9 02 __ LDA #$02
10bd : 85 34 __ STA P7 
10bf : a9 00 __ LDA #$00
10c1 : 85 31 __ STA P4 
10c3 : a9 2b __ LDA #$2b
10c5 : 85 32 __ STA P5 
10c7 : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
10ca : a9 17 __ LDA #$17
10cc : 85 2d __ STA P0 
10ce : a9 b8 __ LDA #$b8
10d0 : 85 2e __ STA P1 
10d2 : a9 09 __ LDA #$09
10d4 : 85 2f __ STA P2 
10d6 : a9 02 __ LDA #$02
10d8 : 85 31 __ STA P4 
10da : 85 32 __ STA P5 
10dc : a9 03 __ LDA #$03
10de : 85 33 __ STA P6 
10e0 : a9 01 __ LDA #$01
10e2 : 85 34 __ STA P7 
10e4 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
10e7 : a9 fc __ LDA #$fc
10e9 : 85 2e __ STA P1 
10eb : a9 00 __ LDA #$00
10ed : 85 2f __ STA P2 
10ef : a9 b8 __ LDA #$b8
10f1 : 85 30 __ STA P3 
10f3 : a9 01 __ LDA #$01
10f5 : 85 31 __ STA P4 
10f7 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
10fa : a9 18 __ LDA #$18
10fc : 85 2d __ STA P0 
10fe : a9 b8 __ LDA #$b8
1100 : 85 2e __ STA P1 
1102 : a9 09 __ LDA #$09
1104 : 85 2f __ STA P2 
1106 : a9 00 __ LDA #$00
1108 : 85 30 __ STA P3 
110a : a9 02 __ LDA #$02
110c : 85 31 __ STA P4 
110e : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1111 : a9 4c __ LDA #$4c
1113 : 85 2e __ STA P1 
1115 : a9 01 __ LDA #$01
1117 : 85 2f __ STA P2 
1119 : 85 31 __ STA P4 
111b : a9 b8 __ LDA #$b8
111d : 85 30 __ STA P3 
111f : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1122 : a9 01 __ LDA #$01
1124 : 85 2e __ STA P1 
1126 : a9 00 __ LDA #$00
1128 : 85 2f __ STA P2 
112a : 20 4f 19 JSR $194f ; (vera_spr_flip.s0 + 0)
112d : a9 10 __ LDA #$10
112f : 85 2d __ STA P0 
1131 : a9 20 __ LDA #$20
1133 : 85 30 __ STA P3 
1135 : a9 00 __ LDA #$00
1137 : 85 31 __ STA P4 
1139 : a9 10 __ LDA #$10
113b : 85 2e __ STA P1 
113d : a9 29 __ LDA #$29
113f : 85 2f __ STA P2 
1141 : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
1144 : a9 00 __ LDA #$00
1146 : 85 2d __ STA P0 
1148 : 85 30 __ STA P3 
114a : 85 33 __ STA P6 
114c : a9 35 __ LDA #$35
114e : 85 2e __ STA P1 
1150 : a9 01 __ LDA #$01
1152 : 85 2f __ STA P2 
1154 : a9 02 __ LDA #$02
1156 : 85 34 __ STA P7 
1158 : a9 00 __ LDA #$00
115a : 85 31 __ STA P4 
115c : a9 2d __ LDA #$2d
115e : 85 32 __ STA P5 
1160 : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
1163 : a9 00 __ LDA #$00
1165 : 85 4e __ STA T1 + 0 
1167 : 85 4f __ STA T2 + 0 
1169 : a9 03 __ LDA #$03
116b : 85 33 __ STA P6 
116d : a9 02 __ LDA #$02
116f : 85 34 __ STA P7 
1171 : 18 __ __ CLC
.l1087:
1172 : a9 a8 __ LDA #$a8
1174 : 85 2e __ STA P1 
1176 : a9 09 __ LDA #$09
1178 : 85 2f __ STA P2 
117a : a9 00 __ LDA #$00
117c : 85 30 __ STA P3 
117e : 85 31 __ STA P4 
1180 : 85 32 __ STA P5 
1182 : a5 4e __ LDA T1 + 0 
1184 : 69 19 __ ADC #$19
1186 : 85 2d __ STA P0 
1188 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
118b : a9 b8 __ LDA #$b8
118d : 85 30 __ STA P3 
118f : a9 01 __ LDA #$01
1191 : 85 31 __ STA P4 
1193 : 38 __ __ SEC
1194 : a5 4f __ LDA T2 + 0 
1196 : e9 fc __ SBC #$fc
1198 : 85 2e __ STA P1 
119a : a9 00 __ LDA #$00
119c : e9 03 __ SBC #$03
119e : 85 2f __ STA P2 
11a0 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
11a3 : 18 __ __ CLC
11a4 : a5 4f __ LDA T2 + 0 
11a6 : 69 0c __ ADC #$0c
11a8 : 85 4f __ STA T2 + 0 
11aa : e6 4e __ INC T1 + 0 
11ac : a5 4e __ LDA T1 + 0 
11ae : c9 08 __ CMP #$08
11b0 : 90 c0 __ BCC $1172 ; (SetUpSprites.l1087 + 0)
.s138:
11b2 : a9 00 __ LDA #$00
11b4 : 85 4e __ STA T1 + 0 
11b6 : 85 4f __ STA T2 + 0 
11b8 : a9 03 __ LDA #$03
11ba : 85 33 __ STA P6 
11bc : 85 34 __ STA P7 
11be : 18 __ __ CLC
.l1089:
11bf : a9 a8 __ LDA #$a8
11c1 : 85 2e __ STA P1 
11c3 : a9 09 __ LDA #$09
11c5 : 85 2f __ STA P2 
11c7 : a9 00 __ LDA #$00
11c9 : 85 30 __ STA P3 
11cb : 85 31 __ STA P4 
11cd : a5 4e __ LDA T1 + 0 
11cf : 69 21 __ ADC #$21
11d1 : 85 2d __ STA P0 
11d3 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
11d6 : a9 c4 __ LDA #$c4
11d8 : 85 30 __ STA P3 
11da : a9 01 __ LDA #$01
11dc : 85 31 __ STA P4 
11de : 38 __ __ SEC
11df : a5 4f __ LDA T2 + 0 
11e1 : e9 fc __ SBC #$fc
11e3 : 85 2e __ STA P1 
11e5 : a9 00 __ LDA #$00
11e7 : e9 03 __ SBC #$03
11e9 : 85 2f __ STA P2 
11eb : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
11ee : 18 __ __ CLC
11ef : a5 4f __ LDA T2 + 0 
11f1 : 69 0c __ ADC #$0c
11f3 : 85 4f __ STA T2 + 0 
11f5 : e6 4e __ INC T1 + 0 
11f7 : a5 4e __ LDA T1 + 0 
11f9 : c9 08 __ CMP #$08
11fb : 90 c2 __ BCC $11bf ; (SetUpSprites.l1089 + 0)
.s142:
11fd : a9 00 __ LDA #$00
11ff : 85 4e __ STA T1 + 0 
1201 : 85 4f __ STA T2 + 0 
1203 : a9 03 __ LDA #$03
1205 : 85 33 __ STA P6 
1207 : a9 04 __ LDA #$04
1209 : 85 34 __ STA P7 
120b : 18 __ __ CLC
.l1091:
120c : a9 a8 __ LDA #$a8
120e : 85 2e __ STA P1 
1210 : a9 09 __ LDA #$09
1212 : 85 2f __ STA P2 
1214 : a9 00 __ LDA #$00
1216 : 85 30 __ STA P3 
1218 : 85 31 __ STA P4 
121a : a5 4e __ LDA T1 + 0 
121c : 69 29 __ ADC #$29
121e : 85 2d __ STA P0 
1220 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1223 : a9 b8 __ LDA #$b8
1225 : 85 30 __ STA P3 
1227 : a9 01 __ LDA #$01
1229 : 85 31 __ STA P4 
122b : 38 __ __ SEC
122c : a9 6c __ LDA #$6c
122e : e5 4f __ SBC T2 + 0 
1230 : 85 2e __ STA P1 
1232 : a9 02 __ LDA #$02
1234 : e9 04 __ SBC #$04
1236 : 85 2f __ STA P2 
1238 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
123b : 18 __ __ CLC
123c : a5 4f __ LDA T2 + 0 
123e : 69 0c __ ADC #$0c
1240 : 85 4f __ STA T2 + 0 
1242 : e6 4e __ INC T1 + 0 
1244 : a5 4e __ LDA T1 + 0 
1246 : c9 08 __ CMP #$08
1248 : 90 c2 __ BCC $120c ; (SetUpSprites.l1091 + 0)
.s146:
124a : a9 00 __ LDA #$00
124c : 85 4e __ STA T1 + 0 
124e : a9 03 __ LDA #$03
1250 : 85 33 __ STA P6 
1252 : a9 04 __ LDA #$04
1254 : 85 34 __ STA P7 
.l148:
1256 : 38 __ __ SEC
1257 : a9 00 __ LDA #$00
1259 : e5 4e __ SBC T1 + 0 
125b : 29 0c __ AND #$0c
125d : 49 ff __ EOR #$ff
125f : 38 __ __ SEC
1260 : 69 6c __ ADC #$6c
1262 : 85 4f __ STA T2 + 0 
1264 : a9 02 __ LDA #$02
1266 : e9 00 __ SBC #$00
1268 : 85 50 __ STA T2 + 1 
126a : 18 __ __ CLC
126b : a5 4e __ LDA T1 + 0 
126d : 69 31 __ ADC #$31
126f : 85 2d __ STA P0 
1271 : a9 02 __ LDA #$02
1273 : 85 51 __ STA T5 + 0 
.l1073:
1275 : a9 a8 __ LDA #$a8
1277 : 85 2e __ STA P1 
1279 : a9 09 __ LDA #$09
127b : 85 2f __ STA P2 
127d : a9 00 __ LDA #$00
127f : 85 30 __ STA P3 
1281 : 85 31 __ STA P4 
1283 : 85 32 __ STA P5 
1285 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1288 : a5 4f __ LDA T2 + 0 
128a : 85 2e __ STA P1 
128c : a5 50 __ LDA T2 + 1 
128e : 85 2f __ STA P2 
1290 : a9 b8 __ LDA #$b8
1292 : 85 30 __ STA P3 
1294 : a9 01 __ LDA #$01
1296 : 85 31 __ STA P4 
1298 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
129b : c6 51 __ DEC T5 + 0 
129d : d0 d6 __ BNE $1275 ; (SetUpSprites.l1073 + 0)
.s149:
129f : e6 4e __ INC T1 + 0 
12a1 : a5 4e __ LDA T1 + 0 
12a3 : c9 02 __ CMP #$02
12a5 : 90 af __ BCC $1256 ; (SetUpSprites.l148 + 0)
.s150:
12a7 : a9 40 __ LDA #$40
12a9 : 85 2d __ STA P0 
12ab : a9 51 __ LDA #$51
12ad : 85 2e __ STA P1 
12af : a9 01 __ LDA #$01
12b1 : 85 2f __ STA P2 
12b3 : 85 34 __ STA P7 
12b5 : a9 00 __ LDA #$00
12b7 : 85 30 __ STA P3 
12b9 : 85 33 __ STA P6 
12bb : a9 00 __ LDA #$00
12bd : 85 31 __ STA P4 
12bf : a9 2f __ LDA #$2f
12c1 : 85 32 __ STA P5 
12c3 : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
12c6 : a9 33 __ LDA #$33
12c8 : 85 2d __ STA P0 
12ca : a9 8a __ LDA #$8a
12cc : 85 2e __ STA P1 
12ce : a9 0a __ LDA #$0a
12d0 : 85 2f __ STA P2 
12d2 : a9 01 __ LDA #$01
12d4 : 85 31 __ STA P4 
12d6 : a9 02 __ LDA #$02
12d8 : 85 32 __ STA P5 
12da : a9 03 __ LDA #$03
12dc : 85 33 __ STA P6 
12de : a9 06 __ LDA #$06
12e0 : 85 34 __ STA P7 
12e2 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
12e5 : a9 00 __ LDA #$00
12e7 : 85 2e __ STA P1 
12e9 : 85 31 __ STA P4 
12eb : a9 01 __ LDA #$01
12ed : 85 2f __ STA P2 
12ef : a9 78 __ LDA #$78
12f1 : 85 30 __ STA P3 
12f3 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
12f6 : a9 00 __ LDA #$00
12f8 : 85 2d __ STA P0 
12fa : 85 30 __ STA P3 
12fc : 85 33 __ STA P6 
12fe : a9 41 __ LDA #$41
1300 : 85 2e __ STA P1 
1302 : a9 04 __ LDA #$04
1304 : 85 34 __ STA P7 
1306 : a9 00 __ LDA #$00
1308 : 85 31 __ STA P4 
130a : a9 30 __ LDA #$30
130c : 85 32 __ STA P5 
130e : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
1311 : a9 34 __ LDA #$34
1313 : 85 2d __ STA P0 
1315 : a9 08 __ LDA #$08
1317 : 85 2e __ STA P1 
1319 : a9 0a __ LDA #$0a
131b : 85 2f __ STA P2 
131d : a9 03 __ LDA #$03
131f : 85 31 __ STA P4 
1321 : 85 33 __ STA P6 
1323 : a9 02 __ LDA #$02
1325 : 85 32 __ STA P5 
1327 : a9 05 __ LDA #$05
1329 : 85 34 __ STA P7 
132b : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
132e : a9 00 __ LDA #$00
1330 : 85 2e __ STA P1 
1332 : 85 31 __ STA P4 
1334 : a9 01 __ LDA #$01
1336 : 85 2f __ STA P2 
1338 : a9 78 __ LDA #$78
133a : 85 30 __ STA P3 
133c : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
133f : a9 35 __ LDA #$35
1341 : 85 2d __ STA P0 
1343 : a9 28 __ LDA #$28
1345 : 85 2e __ STA P1 
1347 : a9 0a __ LDA #$0a
1349 : 85 2f __ STA P2 
134b : a9 00 __ LDA #$00
134d : 85 30 __ STA P3 
134f : a9 03 __ LDA #$03
1351 : 85 31 __ STA P4 
1353 : a9 07 __ LDA #$07
1355 : 85 33 __ STA P6 
1357 : a9 06 __ LDA #$06
1359 : 85 34 __ STA P7 
135b : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
135e : a9 00 __ LDA #$00
1360 : 85 2e __ STA P1 
1362 : 85 31 __ STA P4 
1364 : a9 01 __ LDA #$01
1366 : 85 2f __ STA P2 
1368 : a9 e8 __ LDA #$e8
136a : 85 30 __ STA P3 
136c : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
136f : a9 36 __ LDA #$36
1371 : 85 2d __ STA P0 
1373 : a9 28 __ LDA #$28
1375 : 85 2e __ STA P1 
1377 : a9 0a __ LDA #$0a
1379 : 85 2f __ STA P2 
137b : a9 00 __ LDA #$00
137d : 85 30 __ STA P3 
137f : a9 03 __ LDA #$03
1381 : 85 31 __ STA P4 
1383 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1386 : a9 40 __ LDA #$40
1388 : 85 2e __ STA P1 
138a : a9 01 __ LDA #$01
138c : 85 2f __ STA P2 
138e : a9 e8 __ LDA #$e8
1390 : 85 30 __ STA P3 
1392 : a9 00 __ LDA #$00
1394 : 85 31 __ STA P4 
1396 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1399 : a9 01 __ LDA #$01
139b : 85 2e __ STA P1 
139d : a9 00 __ LDA #$00
139f : 85 2f __ STA P2 
13a1 : 20 4f 19 JSR $194f ; (vera_spr_flip.s0 + 0)
13a4 : a9 37 __ LDA #$37
13a6 : 85 2d __ STA P0 
13a8 : a9 28 __ LDA #$28
13aa : 85 2e __ STA P1 
13ac : a9 0a __ LDA #$0a
13ae : 85 2f __ STA P2 
13b0 : a9 00 __ LDA #$00
13b2 : 85 30 __ STA P3 
13b4 : a9 03 __ LDA #$03
13b6 : 85 31 __ STA P4 
13b8 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
13bb : a9 00 __ LDA #$00
13bd : 85 2e __ STA P1 
13bf : a9 01 __ LDA #$01
13c1 : 85 2f __ STA P2 
13c3 : 85 31 __ STA P4 
13c5 : a9 08 __ LDA #$08
13c7 : 85 30 __ STA P3 
13c9 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
13cc : 20 4f 19 JSR $194f ; (vera_spr_flip.s0 + 0)
13cf : a9 38 __ LDA #$38
13d1 : 85 2d __ STA P0 
13d3 : a9 28 __ LDA #$28
13d5 : 85 2e __ STA P1 
13d7 : a9 0a __ LDA #$0a
13d9 : 85 2f __ STA P2 
13db : a9 00 __ LDA #$00
13dd : 85 30 __ STA P3 
13df : a9 03 __ LDA #$03
13e1 : 85 31 __ STA P4 
13e3 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
13e6 : a9 40 __ LDA #$40
13e8 : 85 2e __ STA P1 
13ea : a9 01 __ LDA #$01
13ec : 85 2f __ STA P2 
13ee : 85 31 __ STA P4 
13f0 : a9 08 __ LDA #$08
13f2 : 85 30 __ STA P3 
13f4 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
13f7 : a9 01 __ LDA #$01
13f9 : 85 2e __ STA P1 
13fb : 20 4f 19 JSR $194f ; (vera_spr_flip.s0 + 0)
13fe : a9 00 __ LDA #$00
1400 : 85 2d __ STA P0 
1402 : 85 30 __ STA P3 
1404 : 85 33 __ STA P6 
1406 : a9 39 __ LDA #$39
1408 : 85 2e __ STA P1 
140a : a9 08 __ LDA #$08
140c : 85 34 __ STA P7 
140e : a9 00 __ LDA #$00
1410 : 85 31 __ STA P4 
1412 : a9 34 __ LDA #$34
1414 : 85 32 __ STA P5 
1416 : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
1419 : a9 00 __ LDA #$00
141b : 85 4e __ STA T1 + 0 
141d : 85 4f __ STA T2 + 0 
141f : 85 50 __ STA T2 + 1 
1421 : a9 02 __ LDA #$02
1423 : 85 33 __ STA P6 
1425 : a9 05 __ LDA #$05
1427 : 85 34 __ STA P7 
1429 : a9 03 __ LDA #$03
142b : 85 32 __ STA P5 
142d : 18 __ __ CLC
.l1093:
142e : a9 c8 __ LDA #$c8
1430 : 85 2e __ STA P1 
1432 : a9 09 __ LDA #$09
1434 : 85 2f __ STA P2 
1436 : a9 00 __ LDA #$00
1438 : 85 30 __ STA P3 
143a : a9 03 __ LDA #$03
143c : 85 31 __ STA P4 
143e : a5 4e __ LDA T1 + 0 
1440 : 69 39 __ ADC #$39
1442 : 85 2d __ STA P0 
1444 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1447 : a9 20 __ LDA #$20
1449 : 85 2e __ STA P1 
144b : a9 01 __ LDA #$01
144d : 85 2f __ STA P2 
144f : 38 __ __ SEC
1450 : a5 4f __ LDA T2 + 0 
1452 : e9 60 __ SBC #$60
1454 : 85 30 __ STA P3 
1456 : a5 50 __ LDA T2 + 1 
1458 : e9 00 __ SBC #$00
145a : 85 31 __ STA P4 
145c : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
145f : 18 __ __ CLC
1460 : a5 4f __ LDA T2 + 0 
1462 : 69 40 __ ADC #$40
1464 : 85 4f __ STA T2 + 0 
1466 : 90 02 __ BCC $146a ; (SetUpSprites.s1096 + 0)
.s1095:
1468 : e6 50 __ INC T2 + 1 
.s1096:
146a : e6 4e __ INC T1 + 0 
146c : a5 4e __ LDA T1 + 0 
146e : c9 07 __ CMP #$07
1470 : 90 bc __ BCC $142e ; (SetUpSprites.l1093 + 0)
.s158:
1472 : a9 40 __ LDA #$40
1474 : 85 2d __ STA P0 
1476 : a9 53 __ LDA #$53
1478 : 85 2e __ STA P1 
147a : a9 00 __ LDA #$00
147c : 85 30 __ STA P3 
147e : 85 33 __ STA P6 
1480 : a9 02 __ LDA #$02
1482 : 85 34 __ STA P7 
1484 : a9 00 __ LDA #$00
1486 : 85 31 __ STA P4 
1488 : a9 3c __ LDA #$3c
148a : 85 32 __ STA P5 
148c : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
148f : a9 80 __ LDA #$80
1491 : 85 2d __ STA P0 
1493 : 85 33 __ STA P6 
1495 : a9 52 __ LDA #$52
1497 : 85 2e __ STA P1 
1499 : a9 00 __ LDA #$00
149b : 85 34 __ STA P7 
149d : a9 30 __ LDA #$30
149f : 85 31 __ STA P4 
14a1 : a9 29 __ LDA #$29
14a3 : 85 32 __ STA P5 
14a5 : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
14a8 : a9 00 __ LDA #$00
14aa : 85 4d __ STA T0 + 0 
14ac : a9 0a __ LDA #$0a
14ae : 85 2f __ STA P2 
14b0 : a9 02 __ LDA #$02
14b2 : 85 33 __ STA P6 
14b4 : a9 08 __ LDA #$08
14b6 : 85 34 __ STA P7 
.l160:
14b8 : a9 94 __ LDA #$94
14ba : 85 2e __ STA P1 
14bc : a9 01 __ LDA #$01
14be : 85 31 __ STA P4 
14c0 : 85 32 __ STA P5 
14c2 : 18 __ __ CLC
14c3 : a5 4d __ LDA T0 + 0 
14c5 : 69 4f __ ADC #$4f
14c7 : 85 2d __ STA P0 
14c9 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
14cc : a5 4d __ LDA T0 + 0 
14ce : c9 17 __ CMP #$17
14d0 : d0 0d __ BNE $14df ; (SetUpSprites.s288 + 0)
.s163:
14d2 : a9 9a __ LDA #$9a
14d4 : 85 2e __ STA P1 
14d6 : a9 02 __ LDA #$02
14d8 : 85 31 __ STA P4 
14da : 85 32 __ STA P5 
14dc : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
.s288:
14df : e6 4d __ INC T0 + 0 
14e1 : a5 4d __ LDA T0 + 0 
14e3 : c9 18 __ CMP #$18
14e5 : 90 d1 __ BCC $14b8 ; (SetUpSprites.l160 + 0)
.s162:
14e7 : a9 20 __ LDA #$20
14e9 : 85 37 __ STA P10 
14eb : a9 40 __ LDA #$40
14ed : 8d fc 9e STA $9efc ; (sstack + 0)
14f0 : a9 fa __ LDA #$fa
14f2 : 8d fd 9e STA $9efd ; (sstack + 1)
14f5 : a9 01 __ LDA #$01
14f7 : 8d fe 9e STA $9efe ; (sstack + 2)
14fa : a9 00 __ LDA #$00
14fc : 8d ff 9e STA $9eff ; (sstack + 3)
14ff : a9 b0 __ LDA #$b0
1501 : 85 35 __ STA P8 
1503 : a9 29 __ LDA #$29
1505 : 85 36 __ STA P9 
1507 : 20 d5 19 JSR $19d5 ; (SetPaletteColours.s0 + 0)
150a : a9 60 __ LDA #$60
150c : 8d fc 9e STA $9efc ; (sstack + 0)
150f : a9 fa __ LDA #$fa
1511 : 8d fd 9e STA $9efd ; (sstack + 1)
1514 : a9 01 __ LDA #$01
1516 : 8d fe 9e STA $9efe ; (sstack + 2)
1519 : a9 00 __ LDA #$00
151b : 8d ff 9e STA $9eff ; (sstack + 3)
151e : a9 d0 __ LDA #$d0
1520 : 85 35 __ STA P8 
1522 : a9 29 __ LDA #$29
1524 : 85 36 __ STA P9 
1526 : 20 d5 19 JSR $19d5 ; (SetPaletteColours.s0 + 0)
1529 : a9 80 __ LDA #$80
152b : 8d fc 9e STA $9efc ; (sstack + 0)
152e : a9 fa __ LDA #$fa
1530 : 8d fd 9e STA $9efd ; (sstack + 1)
1533 : a9 01 __ LDA #$01
1535 : 8d fe 9e STA $9efe ; (sstack + 2)
1538 : a9 00 __ LDA #$00
153a : 8d ff 9e STA $9eff ; (sstack + 3)
153d : a9 00 __ LDA #$00
153f : 85 35 __ STA P8 
1541 : a9 3e __ LDA #$3e
1543 : 85 36 __ STA P9 
1545 : 20 d5 19 JSR $19d5 ; (SetPaletteColours.s0 + 0)
1548 : a9 00 __ LDA #$00
154a : 85 2d __ STA P0 
154c : 85 31 __ STA P4 
154e : a9 20 __ LDA #$20
1550 : 85 30 __ STA P3 
1552 : a9 20 __ LDA #$20
1554 : 85 2e __ STA P1 
1556 : a9 3e __ LDA #$3e
1558 : 85 2f __ STA P2 
155a : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
155d : a9 60 __ LDA #$60
155f : 85 2d __ STA P0 
1561 : a9 00 __ LDA #$00
1563 : 85 31 __ STA P4 
1565 : a9 40 __ LDA #$40
1567 : 85 2e __ STA P1 
1569 : a9 3e __ LDA #$3e
156b : 85 2f __ STA P2 
156d : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
1570 : a9 70 __ LDA #$70
1572 : 85 2d __ STA P0 
1574 : a9 0c __ LDA #$0c
1576 : 85 30 __ STA P3 
1578 : a9 00 __ LDA #$00
157a : 85 31 __ STA P4 
157c : a9 f0 __ LDA #$f0
157e : 85 2e __ STA P1 
1580 : a9 29 __ LDA #$29
1582 : 85 2f __ STA P2 
1584 : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
1587 : a9 80 __ LDA #$80
1589 : 85 2d __ STA P0 
158b : a9 20 __ LDA #$20
158d : 85 30 __ STA P3 
158f : a9 00 __ LDA #$00
1591 : 85 31 __ STA P4 
1593 : a9 60 __ LDA #$60
1595 : 85 2e __ STA P1 
1597 : a9 3e __ LDA #$3e
1599 : 85 2f __ STA P2 
159b : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
159e : a9 90 __ LDA #$90
15a0 : 85 2d __ STA P0 
15a2 : a9 10 __ LDA #$10
15a4 : 85 30 __ STA P3 
15a6 : a9 00 __ LDA #$00
15a8 : 85 31 __ STA P4 
15aa : a9 80 __ LDA #$80
15ac : 85 2e __ STA P1 
15ae : a9 3e __ LDA #$3e
15b0 : 85 2f __ STA P2 
15b2 : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
15b5 : a9 a0 __ LDA #$a0
15b7 : 85 2d __ STA P0 
15b9 : a9 1a __ LDA #$1a
15bb : 85 30 __ STA P3 
15bd : a9 00 __ LDA #$00
15bf : 85 31 __ STA P4 
15c1 : a9 90 __ LDA #$90
15c3 : 85 2e __ STA P1 
15c5 : a9 3e __ LDA #$3e
15c7 : 85 2f __ STA P2 
15c9 : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
15cc : a9 b0 __ LDA #$b0
15ce : 85 2d __ STA P0 
15d0 : a9 20 __ LDA #$20
15d2 : 85 30 __ STA P3 
15d4 : a9 00 __ LDA #$00
15d6 : 85 31 __ STA P4 
15d8 : a9 aa __ LDA #$aa
15da : 85 2e __ STA P1 
15dc : a9 3e __ LDA #$3e
15de : 85 2f __ STA P2 
15e0 : 20 8c 19 JSR $198c ; (vera_pal_putn.s0 + 0)
15e3 : a9 00 __ LDA #$00
15e5 : 85 2d __ STA P0 
15e7 : 85 30 __ STA P3 
15e9 : 85 33 __ STA P6 
15eb : a9 45 __ LDA #$45
15ed : 85 2e __ STA P1 
15ef : a9 01 __ LDA #$01
15f1 : 85 2f __ STA P2 
15f3 : a9 04 __ LDA #$04
15f5 : 85 34 __ STA P7 
15f7 : a9 ca __ LDA #$ca
15f9 : 85 31 __ STA P4 
15fb : a9 3e __ LDA #$3e
15fd : 85 32 __ STA P5 
15ff : 20 57 18 JSR $1857 ; (vram_putn.s0 + 0)
1602 : a9 03 __ LDA #$03
1604 : 85 32 __ STA P5 
1606 : 85 34 __ STA P7 
1608 : a9 08 __ LDA #$08
160a : 85 33 __ STA P6 
160c : a9 40 __ LDA #$40
160e : 85 35 __ STA P8 
1610 : a9 5b __ LDA #$5b
1612 : 85 36 __ STA P9 
1614 : a9 01 __ LDA #$01
1616 : 85 37 __ STA P10 
1618 : a9 00 __ LDA #$00
161a : 85 38 __ STA P11 
161c : 8d fc 9e STA $9efc ; (sstack + 0)
161f : a9 20 __ LDA #$20
1621 : 8d fd 9e STA $9efd ; (sstack + 1)
1624 : a9 44 __ LDA #$44
1626 : 85 30 __ STA P3 
1628 : a9 1b __ LDA #$1b
162a : 85 31 __ STA P4 
162c : 20 fc 19 JSR $19fc ; (LoadSprite.s0 + 0)
162f : a9 03 __ LDA #$03
1631 : 85 2d __ STA P0 
1633 : 85 31 __ STA P4 
1635 : a9 da __ LDA #$da
1637 : 85 2e __ STA P1 
1639 : a9 0a __ LDA #$0a
163b : 85 2f __ STA P2 
163d : a9 00 __ LDA #$00
163f : 85 30 __ STA P3 
1641 : a9 07 __ LDA #$07
1643 : 85 33 __ STA P6 
1645 : a9 0b __ LDA #$0b
1647 : 85 34 __ STA P7 
1649 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
164c : a9 08 __ LDA #$08
164e : 85 2e __ STA P1 
1650 : 85 30 __ STA P3 
1652 : a9 00 __ LDA #$00
1654 : 85 2f __ STA P2 
1656 : 85 31 __ STA P4 
1658 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
165b : a9 04 __ LDA #$04
165d : 85 2d __ STA P0 
165f : a9 1a __ LDA #$1a
1661 : 85 2e __ STA P1 
1663 : a9 0b __ LDA #$0b
1665 : 85 2f __ STA P2 
1667 : a9 00 __ LDA #$00
1669 : 85 30 __ STA P3 
166b : a9 03 __ LDA #$03
166d : 85 31 __ STA P4 
166f : 85 33 __ STA P6 
1671 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1674 : a9 48 __ LDA #$48
1676 : 85 2e __ STA P1 
1678 : a9 00 __ LDA #$00
167a : 85 2f __ STA P2 
167c : 85 31 __ STA P4 
167e : a9 08 __ LDA #$08
1680 : 85 30 __ STA P3 
1682 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1685 : a9 05 __ LDA #$05
1687 : 85 2d __ STA P0 
1689 : a9 5a __ LDA #$5a
168b : 85 2e __ STA P1 
168d : a9 0b __ LDA #$0b
168f : 85 2f __ STA P2 
1691 : a9 00 __ LDA #$00
1693 : 85 30 __ STA P3 
1695 : a9 03 __ LDA #$03
1697 : 85 31 __ STA P4 
1699 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
169c : a9 08 __ LDA #$08
169e : 85 2e __ STA P1 
16a0 : a9 00 __ LDA #$00
16a2 : 85 2f __ STA P2 
16a4 : 85 31 __ STA P4 
16a6 : a9 48 __ LDA #$48
16a8 : 85 30 __ STA P3 
16aa : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
16ad : a9 06 __ LDA #$06
16af : 85 2d __ STA P0 
16b1 : a9 9a __ LDA #$9a
16b3 : 85 2e __ STA P1 
16b5 : a9 0b __ LDA #$0b
16b7 : 85 2f __ STA P2 
16b9 : a9 00 __ LDA #$00
16bb : 85 30 __ STA P3 
16bd : a9 03 __ LDA #$03
16bf : 85 31 __ STA P4 
16c1 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
16c4 : a9 48 __ LDA #$48
16c6 : 85 2e __ STA P1 
16c8 : 85 30 __ STA P3 
16ca : a9 00 __ LDA #$00
16cc : 85 2f __ STA P2 
16ce : 85 31 __ STA P4 
16d0 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
16d3 : a9 07 __ LDA #$07
16d5 : 85 2d __ STA P0 
16d7 : 85 33 __ STA P6 
16d9 : a9 da __ LDA #$da
16db : 85 2e __ STA P1 
16dd : a9 0a __ LDA #$0a
16df : 85 2f __ STA P2 
16e1 : a9 00 __ LDA #$00
16e3 : 85 30 __ STA P3 
16e5 : a9 03 __ LDA #$03
16e7 : 85 31 __ STA P4 
16e9 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
16ec : a9 f8 __ LDA #$f8
16ee : 85 2e __ STA P1 
16f0 : a9 01 __ LDA #$01
16f2 : 85 2f __ STA P2 
16f4 : a9 08 __ LDA #$08
16f6 : 85 30 __ STA P3 
16f8 : a9 00 __ LDA #$00
16fa : 85 31 __ STA P4 
16fc : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
16ff : a9 08 __ LDA #$08
1701 : 85 2d __ STA P0 
1703 : a9 1a __ LDA #$1a
1705 : 85 2e __ STA P1 
1707 : a9 0b __ LDA #$0b
1709 : 85 2f __ STA P2 
170b : a9 00 __ LDA #$00
170d : 85 30 __ STA P3 
170f : a9 03 __ LDA #$03
1711 : 85 31 __ STA P4 
1713 : 85 33 __ STA P6 
1715 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1718 : a9 38 __ LDA #$38
171a : 85 2e __ STA P1 
171c : a9 02 __ LDA #$02
171e : 85 2f __ STA P2 
1720 : a9 08 __ LDA #$08
1722 : 85 30 __ STA P3 
1724 : a9 00 __ LDA #$00
1726 : 85 31 __ STA P4 
1728 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
172b : a9 09 __ LDA #$09
172d : 85 2d __ STA P0 
172f : a9 5a __ LDA #$5a
1731 : 85 2e __ STA P1 
1733 : a9 0b __ LDA #$0b
1735 : 85 2f __ STA P2 
1737 : a9 00 __ LDA #$00
1739 : 85 30 __ STA P3 
173b : a9 03 __ LDA #$03
173d : 85 31 __ STA P4 
173f : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
1742 : a9 f8 __ LDA #$f8
1744 : 85 2e __ STA P1 
1746 : a9 01 __ LDA #$01
1748 : 85 2f __ STA P2 
174a : a9 48 __ LDA #$48
174c : 85 30 __ STA P3 
174e : a9 00 __ LDA #$00
1750 : 85 31 __ STA P4 
1752 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1755 : a9 0a __ LDA #$0a
1757 : 85 2d __ STA P0 
1759 : a9 9a __ LDA #$9a
175b : 85 2e __ STA P1 
175d : a9 0b __ LDA #$0b
175f : 85 2f __ STA P2 
1761 : a9 00 __ LDA #$00
1763 : 85 30 __ STA P3 
1765 : a9 03 __ LDA #$03
1767 : 85 31 __ STA P4 
1769 : 20 b9 18 JSR $18b9 ; (vera_spr_set.s0 + 0)
176c : a9 38 __ LDA #$38
176e : 85 2e __ STA P1 
1770 : a9 02 __ LDA #$02
1772 : 85 2f __ STA P2 
1774 : a9 48 __ LDA #$48
1776 : 85 30 __ STA P3 
1778 : a9 00 __ LDA #$00
177a : 85 31 __ STA P4 
177c : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
177f : ad 29 9f LDA $9f29 
1782 : 09 70 __ ORA #$70
1784 : 8d 29 9f STA $9f29 
.s1001:
1787 : 60 __ __ RTS
.s1031:
1788 : c9 34 __ CMP #$34
178a : 90 05 __ BCC $1791 ; (SetUpSprites.s1030 + 0)
.s89:
178c : a9 09 __ LDA #$09
178e : 4c c0 0f JMP $0fc0 ; (SetUpSprites.s279 + 0)
.s1030:
1791 : a9 2c __ LDA #$2c
1793 : c5 25 __ CMP WORK + 2 
1795 : 90 38 __ BCC $17cf ; (SetUpSprites.s1023 + 0)
.s1029:
1797 : a5 4f __ LDA T2 + 0 
1799 : c9 08 __ CMP #$08
179b : 90 06 __ BCC $17a3 ; (SetUpSprites.s95 + 0)
.s1028:
179d : a9 48 __ LDA #$48
179f : c5 4f __ CMP T2 + 0 
17a1 : b0 05 __ BCS $17a8 ; (SetUpSprites.s1027 + 0)
.s95:
17a3 : a9 00 __ LDA #$00
17a5 : 4c c0 0f JMP $0fc0 ; (SetUpSprites.s279 + 0)
.s1027:
17a8 : a5 4f __ LDA T2 + 0 
17aa : c9 0c __ CMP #$0c
17ac : 90 06 __ BCC $17b4 ; (SetUpSprites.s99 + 0)
.s1026:
17ae : a9 44 __ LDA #$44
17b0 : c5 4f __ CMP T2 + 0 
17b2 : b0 05 __ BCS $17b9 ; (SetUpSprites.s1025 + 0)
.s99:
17b4 : a9 01 __ LDA #$01
17b6 : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
.s1025:
17b9 : a5 4f __ LDA T2 + 0 
17bb : c9 18 __ CMP #$18
17bd : 90 06 __ BCC $17c5 ; (SetUpSprites.s103 + 0)
.s1024:
17bf : a9 38 __ LDA #$38
17c1 : c5 4f __ CMP T2 + 0 
17c3 : b0 05 __ BCS $17ca ; (SetUpSprites.s104 + 0)
.s103:
17c5 : a9 02 __ LDA #$02
17c7 : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
.s104:
17ca : a9 03 __ LDA #$03
17cc : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
.s1023:
17cf : a9 2f __ LDA #$2f
17d1 : c5 25 __ CMP WORK + 2 
17d3 : a5 4f __ LDA T2 + 0 
17d5 : 90 36 __ BCC $180d ; (SetUpSprites.s1016 + 0)
.s1022:
17d7 : c9 08 __ CMP #$08
17d9 : 90 06 __ BCC $17e1 ; (SetUpSprites.s111 + 0)
.s1021:
17db : a9 48 __ LDA #$48
17dd : c5 4f __ CMP T2 + 0 
17df : b0 05 __ BCS $17e6 ; (SetUpSprites.s1020 + 0)
.s111:
17e1 : a9 05 __ LDA #$05
17e3 : 4c c0 0f JMP $0fc0 ; (SetUpSprites.s279 + 0)
.s1020:
17e6 : a5 4f __ LDA T2 + 0 
17e8 : c9 0c __ CMP #$0c
17ea : 90 06 __ BCC $17f2 ; (SetUpSprites.s115 + 0)
.s1019:
17ec : a9 44 __ LDA #$44
17ee : c5 4f __ CMP T2 + 0 
17f0 : b0 05 __ BCS $17f7 ; (SetUpSprites.s1018 + 0)
.s115:
17f2 : a9 06 __ LDA #$06
17f4 : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
.s1018:
17f7 : a5 4f __ LDA T2 + 0 
17f9 : c9 18 __ CMP #$18
17fb : 90 06 __ BCC $1803 ; (SetUpSprites.s119 + 0)
.s1017:
17fd : a9 38 __ LDA #$38
17ff : c5 4f __ CMP T2 + 0 
1801 : b0 05 __ BCS $1808 ; (SetUpSprites.s120 + 0)
.s119:
1803 : a9 07 __ LDA #$07
1805 : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
.s120:
1808 : a9 08 __ LDA #$08
180a : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
.s1016:
180d : c9 08 __ CMP #$08
180f : 90 06 __ BCC $1817 ; (SetUpSprites.s123 + 0)
.s1015:
1811 : a9 48 __ LDA #$48
1813 : c5 4f __ CMP T2 + 0 
1815 : b0 05 __ BCS $181c ; (SetUpSprites.s1004 + 0)
.s123:
1817 : a9 0c __ LDA #$0c
1819 : 4c c0 0f JMP $0fc0 ; (SetUpSprites.s279 + 0)
.s1004:
181c : a5 4f __ LDA T2 + 0 
181e : c9 0c __ CMP #$0c
1820 : 90 06 __ BCC $1828 ; (SetUpSprites.s127 + 0)
.s1003:
1822 : a9 44 __ LDA #$44
1824 : c5 4f __ CMP T2 + 0 
1826 : b0 05 __ BCS $182d ; (SetUpSprites.s131 + 0)
.s127:
1828 : a9 0d __ LDA #$0d
182a : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
.s131:
182d : a9 0e __ LDA #$0e
182f : 4c 56 0f JMP $0f56 ; (SetUpSprites.s296 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1832 : 46 2d __ LSR P0 ; (bank + 0)
1834 : a9 00 __ LDA #$00
1836 : 6a __ __ ROR
1837 : 85 3b __ STA ACCU + 0 
1839 : a5 2f __ LDA P2 ; (mem + 1)
183b : 29 f8 __ AND #$f8
183d : 4a __ __ LSR
183e : 05 3b __ ORA ACCU + 0 
1840 : 85 3b __ STA ACCU + 0 
1842 : a5 30 __ LDA P3 ; (height + 0)
1844 : 0a __ __ ASL
1845 : 05 3b __ ORA ACCU + 0 
1847 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1849 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
184a : 46 2d __ LSR P0 ; (bank + 0)
184c : a9 00 __ LDA #$00
184e : 6a __ __ ROR
184f : 85 3b __ STA ACCU + 0 
1851 : a5 2f __ LDA P2 ; (mem + 1)
1853 : 4a __ __ LSR
1854 : 05 3b __ ORA ACCU + 0 
.s1001:
1856 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1857 : ad 25 9f LDA $9f25 
185a : 29 fe __ AND #$fe
185c : 8d 25 9f STA $9f25 
185f : a5 2d __ LDA P0 ; (addr + 0)
1861 : 8d 20 9f STA $9f20 
1864 : a5 2e __ LDA P1 ; (addr + 1)
1866 : 8d 21 9f STA $9f21 
1869 : a5 2f __ LDA P2 ; (addr + 2)
186b : 29 01 __ AND #$01
186d : 09 10 __ ORA #$10
186f : 8d 22 9f STA $9f22 
1872 : a5 33 __ LDA P6 ; (size + 0)
1874 : 05 34 __ ORA P7 ; (size + 1)
1876 : f0 19 __ BEQ $1891 ; (vram_putn.s1001 + 0)
.s6:
1878 : a0 00 __ LDY #$00
187a : a6 33 __ LDX P6 ; (size + 0)
187c : f0 02 __ BEQ $1880 ; (vram_putn.l1002 + 0)
.s1005:
187e : e6 34 __ INC P7 ; (size + 1)
.l1002:
1880 : b1 31 __ LDA (P4),y ; (data + 0)
1882 : 8d 23 9f STA $9f23 
1885 : c8 __ __ INY
1886 : d0 02 __ BNE $188a ; (vram_putn.s1009 + 0)
.s1008:
1888 : e6 32 __ INC P5 ; (data + 1)
.s1009:
188a : ca __ __ DEX
188b : d0 f3 __ BNE $1880 ; (vram_putn.l1002 + 0)
.s1004:
188d : c6 34 __ DEC P7 ; (size + 1)
188f : d0 ef __ BNE $1880 ; (vram_putn.l1002 + 0)
.s1001:
1891 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
21ee : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21fe : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
220e : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
221e : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
222e : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
223e : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
224e : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
225e : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
226e : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
227e : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
228e : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
229e : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
22ae : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
22be : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
22ce : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
22de : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
22ee : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
22fe : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
230e : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
231e : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
232e : __ __ __ BYT 55 55 55 55 55 55 55 55 66 66 66 66 33 33 33 33 : UUUUUUUUffff3333
233e : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
234e : __ __ __ BYT 33 33 33 33 33 33 33 33 77 77 77 77 77 77 77 77 : 33333333wwwwwwww
235e : __ __ __ BYT 77 77 77 77 77 77 77 77 00 00 00 00 00 00 00 00 : wwwwwwww........
236e : __ __ __ BYT 05 00 00 50 00 08 80 00 00 89 98 00 08 95 59 80 : ...P..........Y.
237e : __ __ __ BYT 08 95 59 80 00 89 98 05 00 08 80 00 05 00 00 00 : ..Y.............
238e : __ __ __ BYT 13 11 11 11 11 11 11 31 11 18 81 11 11 89 98 11 : .......1........
239e : __ __ __ BYT 11 89 98 11 11 18 81 13 11 11 11 11 13 11 11 11 : ................
23ae : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 18 81 11 : ................
23be : __ __ __ BYT 11 18 81 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
23ce : __ __ __ BYT aa aa aa aa ab bb bb bb ab cc cc cc ab cc cc cc : ................
23de : __ __ __ BYT ab cc dd dd ab cc dd dd ab cc dd ee ab cc dd ef : ................
23ee : __ __ __ BYT aa aa aa aa bb bb bb bb cc cc cc cc cc cc cc cc : ................
23fe : __ __ __ BYT dd dd dd dd dd dd dd dd ee ee ee ee ff ff ff ff : ................
240e : __ __ __ BYT aa aa aa aa bb bb bb ba cc cc cc ba cc cc cc ba : ................
241e : __ __ __ BYT dd dd cc ba dd dd cc ba ee dd cc ba fe dd cc ba : ................
242e : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
243e : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
244e : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
245e : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
246e : __ __ __ BYT ab cc dd ef ab cc dd ee ab cc dd dd ab cc dd dd : ................
247e : __ __ __ BYT ab cc cc cc ab cc cc cc ab bb bb bb aa aa aa aa : ................
248e : __ __ __ BYT ff ff ff ff ee ee ee ee dd dd dd dd dd dd dd dd : ................
249e : __ __ __ BYT cc cc cc cc cc cc cc cc bb bb bb bb aa aa aa aa : ................
24ae : __ __ __ BYT fe dd cc ba ee dd cc ba dd dd cc ba dd dd cc ba : ................
24be : __ __ __ BYT cc cc cc ba cc cc cc ba bb bb bb ba aa aa aa aa : ................
24ce : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
24de : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
24ee : __ __ __ BYT 22 22 22 22 22 22 33 22 22 23 22 22 22 44 44 22 : """"""3""#"""DD"
24fe : __ __ __ BYT 24 84 84 82 22 44 44 22 23 23 32 32 22 22 22 22 : $..."DD"##22""""
--------------------------------------------------------------------
rand:
.s0:
1892 : ad 0f 25 LDA $250f ; (seed + 1)
1895 : 4a __ __ LSR
1896 : ad 0e 25 LDA $250e ; (seed + 0)
1899 : 6a __ __ ROR
189a : aa __ __ TAX
189b : a9 00 __ LDA #$00
189d : 6a __ __ ROR
189e : 4d 0e 25 EOR $250e ; (seed + 0)
18a1 : 85 3b __ STA ACCU + 0 
18a3 : 8a __ __ TXA
18a4 : 4d 0f 25 EOR $250f ; (seed + 1)
18a7 : 85 3c __ STA ACCU + 1 
18a9 : 4a __ __ LSR
18aa : 45 3b __ EOR ACCU + 0 
18ac : 8d 0e 25 STA $250e ; (seed + 0)
18af : 85 3b __ STA ACCU + 0 
18b1 : 45 3c __ EOR ACCU + 1 
18b3 : 8d 0f 25 STA $250f ; (seed + 1)
18b6 : 85 3c __ STA ACCU + 1 
.s1001:
18b8 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
250e : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
2510 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
2520 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
2530 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
2540 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
2550 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
2560 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
2570 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
2580 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
2590 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
25a0 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
25b0 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
25c0 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
25d0 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
25e0 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
25f0 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
2600 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
2610 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
2620 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
2630 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
2640 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
2650 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
2660 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
2670 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
2680 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
2690 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
26a0 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
26b0 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
26c0 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
26d0 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
26e0 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
26f0 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
2700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
2710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2730 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
2740 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
2750 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2760 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2770 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
2780 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
2790 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
27a0 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
27b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27d0 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
27e0 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
27f0 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
2800 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
2810 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
2820 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
2830 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
2840 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2850 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2860 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2870 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2880 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2890 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
28a0 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
28b0 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
28c0 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
28d0 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
28e0 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
28f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
2900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
18b9 : ad 25 9f LDA $9f25 
18bc : 29 fe __ AND #$fe
18be : 8d 25 9f STA $9f25 
18c1 : a5 2d __ LDA P0 ; (spr + 0)
18c3 : 0a __ __ ASL
18c4 : 0a __ __ ASL
18c5 : 85 3b __ STA ACCU + 0 
18c7 : a9 3f __ LDA #$3f
18c9 : 2a __ __ ROL
18ca : 06 3b __ ASL ACCU + 0 
18cc : 2a __ __ ROL
18cd : 8d 21 9f STA $9f21 
18d0 : a5 3b __ LDA ACCU + 0 
18d2 : 8d 20 9f STA $9f20 
18d5 : a9 11 __ LDA #$11
18d7 : 8d 22 9f STA $9f22 
18da : a5 30 __ LDA P3 ; (mode8 + 0)
18dc : f0 02 __ BEQ $18e0 ; (vera_spr_set.s11 + 0)
.s9:
18de : a9 80 __ LDA #$80
.s11:
18e0 : 05 2f __ ORA P2 ; (addr32 + 1)
18e2 : a6 2e __ LDX P1 ; (addr32 + 0)
18e4 : 8e 23 9f STX $9f23 
18e7 : 8d 23 9f STA $9f23 
18ea : a9 00 __ LDA #$00
18ec : 8d 23 9f STA $9f23 
18ef : 8d 23 9f STA $9f23 
18f2 : 8d 23 9f STA $9f23 
18f5 : 8d 23 9f STA $9f23 
18f8 : a5 33 __ LDA P6 ; (z + 0)
18fa : 0a __ __ ASL
18fb : 0a __ __ ASL
18fc : 8d 23 9f STA $9f23 
18ff : a5 32 __ LDA P5 ; (h + 0)
1901 : 4a __ __ LSR
1902 : 6a __ __ ROR
1903 : 29 80 __ AND #$80
1905 : 6a __ __ ROR
1906 : 85 3b __ STA ACCU + 0 
1908 : a5 31 __ LDA P4 ; (w + 0)
190a : 0a __ __ ASL
190b : 0a __ __ ASL
190c : 0a __ __ ASL
190d : 0a __ __ ASL
190e : 05 3b __ ORA ACCU + 0 
1910 : 05 34 __ ORA P7 ; (pal + 0)
1912 : 8d 23 9f STA $9f23 
.s1001:
1915 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1916 : ad 25 9f LDA $9f25 
1919 : 29 fe __ AND #$fe
191b : 8d 25 9f STA $9f25 
191e : a5 2d __ LDA P0 ; (spr + 0)
1920 : 0a __ __ ASL
1921 : 0a __ __ ASL
1922 : 85 3b __ STA ACCU + 0 
1924 : a9 3f __ LDA #$3f
1926 : 2a __ __ ROL
1927 : 06 3b __ ASL ACCU + 0 
1929 : 2a __ __ ROL
192a : aa __ __ TAX
192b : a5 3b __ LDA ACCU + 0 
192d : 09 02 __ ORA #$02
192f : 8d 20 9f STA $9f20 
1932 : 8e 21 9f STX $9f21 
1935 : a9 11 __ LDA #$11
1937 : 8d 22 9f STA $9f22 
193a : a5 2e __ LDA P1 ; (x + 0)
193c : 8d 23 9f STA $9f23 
193f : a5 2f __ LDA P2 ; (x + 1)
1941 : 8d 23 9f STA $9f23 
1944 : a5 30 __ LDA P3 ; (y + 0)
1946 : 8d 23 9f STA $9f23 
1949 : a5 31 __ LDA P4 ; (y + 1)
194b : 8d 23 9f STA $9f23 
.s1001:
194e : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a10 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2a20 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2a30 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2a40 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2a50 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2a60 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2a70 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2a80 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2a90 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2aa0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2ab0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2ac0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2ad0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
2ae0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
2af0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2b50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2b60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2b70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2b80 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2b90 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
2ba0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
2bb0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
2bc0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
2bd0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
2be0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
2bf0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2c00 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2c10 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2c20 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2c30 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2c40 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2c50 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2c60 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2c70 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2c80 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2c90 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
2ca0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
2cb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
2cc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
2cd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
2ce0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
2cf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_spr_flip:
.s0:
194f : ad 25 9f LDA $9f25 
1952 : 29 fe __ AND #$fe
1954 : 8d 25 9f STA $9f25 
1957 : a5 2d __ LDA P0 ; (spr + 0)
1959 : 0a __ __ ASL
195a : 0a __ __ ASL
195b : 85 3b __ STA ACCU + 0 
195d : a9 3f __ LDA #$3f
195f : 2a __ __ ROL
1960 : 06 3b __ ASL ACCU + 0 
1962 : 2a __ __ ROL
1963 : aa __ __ TAX
1964 : a5 3b __ LDA ACCU + 0 
1966 : 09 06 __ ORA #$06
1968 : 8d 20 9f STA $9f20 
196b : 8e 21 9f STX $9f21 
196e : a9 01 __ LDA #$01
1970 : 8d 22 9f STA $9f22 
1973 : ad 23 9f LDA $9f23 
1976 : 29 fc __ AND #$fc
1978 : a8 __ __ TAY
1979 : a5 2e __ LDA P1 ; (fliph + 0)
197b : f0 01 __ BEQ $197e ; (vera_spr_flip.s14 + 0)
.s6:
197d : c8 __ __ INY
.s14:
197e : a5 2f __ LDA P2 ; (flipv + 0)
1980 : f0 05 __ BEQ $1987 ; (vera_spr_flip.s11 + 0)
.s9:
1982 : 98 __ __ TYA
1983 : 09 02 __ ORA #$02
1985 : d0 01 __ BNE $1988 ; (vera_spr_flip.s1002 + 0)
.s11:
1987 : 98 __ __ TYA
.s1002:
1988 : 8d 23 9f STA $9f23 
.s1001:
198b : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
198c : ad 25 9f LDA $9f25 
198f : 29 fe __ AND #$fe
1991 : 8d 25 9f STA $9f25 
1994 : a5 2d __ LDA P0 ; (index + 0)
1996 : 0a __ __ ASL
1997 : 8d 20 9f STA $9f20 
199a : a9 7d __ LDA #$7d
199c : 2a __ __ ROL
199d : 8d 21 9f STA $9f21 
19a0 : a9 11 __ LDA #$11
19a2 : 8d 22 9f STA $9f22 
19a5 : a5 30 __ LDA P3 ; (size + 0)
19a7 : 05 31 __ ORA P4 ; (size + 1)
19a9 : f0 29 __ BEQ $19d4 ; (vera_pal_putn.s1001 + 0)
.s6:
19ab : a6 30 __ LDX P3 ; (size + 0)
19ad : f0 02 __ BEQ $19b1 ; (vera_pal_putn.l3 + 0)
.s1003:
19af : e6 31 __ INC P4 ; (size + 1)
.l3:
19b1 : a0 01 __ LDY #$01
19b3 : b1 2e __ LDA (P1),y ; (color + 0)
19b5 : 85 3c __ STA ACCU + 1 
19b7 : 88 __ __ DEY
19b8 : b1 2e __ LDA (P1),y ; (color + 0)
19ba : 8d 23 9f STA $9f23 
19bd : a5 3c __ LDA ACCU + 1 
19bf : 8d 23 9f STA $9f23 
19c2 : 18 __ __ CLC
19c3 : a5 2e __ LDA P1 ; (color + 0)
19c5 : 69 02 __ ADC #$02
19c7 : 85 2e __ STA P1 ; (color + 0)
19c9 : 90 02 __ BCC $19cd ; (vera_pal_putn.s1007 + 0)
.s1006:
19cb : e6 2f __ INC P2 ; (color + 1)
.s1007:
19cd : ca __ __ DEX
19ce : d0 e1 __ BNE $19b1 ; (vera_pal_putn.l3 + 0)
.s1002:
19d0 : c6 31 __ DEC P4 ; (size + 1)
19d2 : d0 dd __ BNE $19b1 ; (vera_pal_putn.l3 + 0)
.s1001:
19d4 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2910 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2920 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2d50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2d60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2d70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2d80 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2d90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2da0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2db0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2dc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2dd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2de0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2df0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2e00 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2e10 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2e20 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2e30 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
2e40 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2e50 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
2e60 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2e70 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
2e80 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2e90 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
2ea0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2eb0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
2ec0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2ed0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2ee0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
2ef0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
2f00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2f10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2f20 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2f30 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2f40 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2f50 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2f60 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2f70 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2f80 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2f90 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
2fa0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
2fb0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
2fc0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
2fd0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
2fe0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
2ff0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
3000 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
3010 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3020 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
3030 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
3040 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
3050 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
3060 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3070 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
3080 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3090 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
30a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
30b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
30c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
30d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
30e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
30f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3100 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
3110 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3120 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
3130 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
3140 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
3150 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
3160 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3170 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
3180 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3190 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
31a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
31b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
31c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
31d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
31e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
31f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3200 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
3210 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3220 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3230 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
3240 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3250 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
3260 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3270 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
3280 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3290 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
32a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
32b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
32c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
32d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
32e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
32f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3300 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
3310 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3320 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
3330 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
3340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
3350 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
3360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3370 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
3380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3390 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
33a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
33b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
33c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
33d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
33e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
33f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
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
3600 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3610 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3620 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3630 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3640 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3650 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3660 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3670 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3680 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3690 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3700 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3710 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3720 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3730 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3740 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3750 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3760 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3770 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3780 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3790 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
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
3a00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3a10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3a20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3a30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3a40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3a50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3a60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3a70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3a80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3a90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3aa0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3ab0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3ac0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3ad0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3ae0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3af0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3b00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3b10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3b20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3b30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3b40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3b50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3b60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3b70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3b80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3b90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3ba0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3bb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3bc0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3bd0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3be0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3bf0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
WavyHead:
3c00 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
3c10 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3c20 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3c30 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3c40 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3c50 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3c60 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3c70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3c80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3c90 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3ca0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3cb0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3cc0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3cd0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3ce0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3cf0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3d00 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3d10 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3d20 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3d30 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3d40 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3d50 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3d60 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3d70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3d80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3d90 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3da0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3db0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3dc0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3dd0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3de0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3df0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
2930 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2940 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
2950 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
2960 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
2970 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
2980 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
2990 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
29a0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
19d5 : ad fc 9e LDA $9efc ; (sstack + 0)
19d8 : 85 2d __ STA P0 
19da : ad fd 9e LDA $9efd ; (sstack + 1)
19dd : 85 2e __ STA P1 
19df : ad fe 9e LDA $9efe ; (sstack + 2)
19e2 : 85 2f __ STA P2 
19e4 : ad ff 9e LDA $9eff ; (sstack + 3)
19e7 : 85 30 __ STA P3 
19e9 : a5 35 __ LDA P8 ; (input + 0)
19eb : 85 31 __ STA P4 
19ed : a5 36 __ LDA P9 ; (input + 1)
19ef : 85 32 __ STA P5 
19f1 : a5 37 __ LDA P10 ; (inputsize + 0)
19f3 : 85 33 __ STA P6 
19f5 : a9 00 __ LDA #$00
19f7 : 85 34 __ STA P7 
19f9 : 4c 57 18 JMP $1857 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
29b0 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
29c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
29d0 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
29e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
3e00 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
3e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
BGPal:
3e20 : __ __ __ BYT 24 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : $.......&.....f.
3e30 : __ __ __ BYT 9f 0b ef 0e 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 : ......m.M.).+.-.
--------------------------------------------------------------------
CharBoxPalette:
3e40 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 00 00 00 00 : ..m.M.).+.-.....
3e50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavyPal:
29f0 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
3e60 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
3e70 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
3e80 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
3e90 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
3ea0 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
CrispyPal:
3eaa : __ __ __ BYT 00 00 00 00 12 01 22 02 ff 0f 0f 09 24 02 10 06 : ......".....$...
3eba : __ __ __ BYT 39 03 00 04 d9 0d dd 0d 8c 00 af 00 cc 0c aa 0a : 9...............
--------------------------------------------------------------------
EyeTri:
3eca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3eda : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3eea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3efa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3f0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3f2a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f3a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3f4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3f6a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f7a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3f8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3faa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fba : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3fca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fda : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3fea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ffa : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
400a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
401a : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
402a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
403a : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
404a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
405a : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
406a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
407a : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
408a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
409a : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
40aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40ba : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
40ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
40da : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
40ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
40fa : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
410a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
411a : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
412a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
413a : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
414a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
415a : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
416a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
417a : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
418a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
419a : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
41aa : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
41ba : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
41ca : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
41da : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
41ea : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
41fa : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
420a : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
421a : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
422a : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
423a : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
424a : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
425a : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
426a : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
427a : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
428a : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
429a : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
42aa : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
42ba : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
19fc : a5 30 __ LDA P3 ; (name + 0)
19fe : 85 2d __ STA P0 
1a00 : a5 31 __ LDA P4 ; (name + 1)
1a02 : 85 2e __ STA P1 
1a04 : 20 7d 1a JSR $1a7d ; (krnio_setnam.s0 + 0)
1a07 : a5 32 __ LDA P5 ; (fnum + 0)
1a09 : 85 2d __ STA P0 
1a0b : a5 33 __ LDA P6 ; (device + 0)
1a0d : 85 2e __ STA P1 
1a0f : a5 34 __ LDA P7 ; (channel + 0)
1a11 : 85 2f __ STA P2 
1a13 : 20 93 1a JSR $1a93 ; (krnio_open.s0 + 0)
1a16 : a5 32 __ LDA P5 ; (fnum + 0)
1a18 : 85 2e __ STA P1 
1a1a : 20 bb 1a JSR $1abb ; (krnio_getch.s0 + 0)
1a1d : a5 32 __ LDA P5 ; (fnum + 0)
1a1f : 85 2e __ STA P1 
1a21 : 20 bb 1a JSR $1abb ; (krnio_getch.s0 + 0)
1a24 : ad fd 9e LDA $9efd ; (sstack + 1)
1a27 : 85 4a __ STA T0 + 1 
1a29 : ad fc 9e LDA $9efc ; (sstack + 0)
1a2c : 85 49 __ STA T0 + 0 
1a2e : 05 4a __ ORA T0 + 1 
1a30 : f0 46 __ BEQ $1a78 ; (LoadSprite.s4 + 0)
.s8:
1a32 : a9 00 __ LDA #$00
1a34 : 85 4b __ STA T2 + 0 
1a36 : 85 4c __ STA T2 + 1 
.l2:
1a38 : a5 32 __ LDA P5 ; (fnum + 0)
1a3a : 85 2e __ STA P1 
1a3c : 20 bb 1a JSR $1abb ; (krnio_getch.s0 + 0)
1a3f : ad 25 9f LDA $9f25 
1a42 : 29 fe __ AND #$fe
1a44 : 8d 25 9f STA $9f25 
1a47 : 18 __ __ CLC
1a48 : a5 4b __ LDA T2 + 0 
1a4a : 65 35 __ ADC P8 ; (Addr + 0)
1a4c : 8d 20 9f STA $9f20 
1a4f : a5 4c __ LDA T2 + 1 
1a51 : 65 36 __ ADC P9 ; (Addr + 1)
1a53 : 8d 21 9f STA $9f21 
1a56 : a9 00 __ LDA #$00
1a58 : 65 37 __ ADC P10 ; (Addr + 2)
1a5a : 29 01 __ AND #$01
1a5c : 09 10 __ ORA #$10
1a5e : 8d 22 9f STA $9f22 
1a61 : a5 3b __ LDA ACCU + 0 
1a63 : 8d 23 9f STA $9f23 
1a66 : e6 4b __ INC T2 + 0 
1a68 : d0 02 __ BNE $1a6c ; (LoadSprite.s1005 + 0)
.s1004:
1a6a : e6 4c __ INC T2 + 1 
.s1005:
1a6c : a5 4c __ LDA T2 + 1 
1a6e : c5 4a __ CMP T0 + 1 
1a70 : d0 04 __ BNE $1a76 ; (LoadSprite.s1003 + 0)
.s1002:
1a72 : a5 4b __ LDA T2 + 0 
1a74 : c5 49 __ CMP T0 + 0 
.s1003:
1a76 : 90 c0 __ BCC $1a38 ; (LoadSprite.l2 + 0)
.s4:
1a78 : a5 32 __ LDA P5 ; (fnum + 0)
1a7a : 4c 3c 1b JMP $1b3c ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
1a7d : a5 2d __ LDA P0 
1a7f : 05 2e __ ORA P1 
1a81 : f0 08 __ BEQ $1a8b ; (krnio_setnam.s0 + 14)
1a83 : a0 ff __ LDY #$ff
1a85 : c8 __ __ INY
1a86 : b1 2d __ LDA (P0),y 
1a88 : d0 fb __ BNE $1a85 ; (krnio_setnam.s0 + 8)
1a8a : 98 __ __ TYA
1a8b : a6 2d __ LDX P0 
1a8d : a4 2e __ LDY P1 
1a8f : 20 bd ff JSR $ffbd 
.s1001:
1a92 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1a93 : a9 00 __ LDA #$00
1a95 : a6 2d __ LDX P0 ; (fnum + 0)
1a97 : 9d 9b 51 STA $519b,x ; (krnio_pstatus + 0)
1a9a : a9 00 __ LDA #$00
1a9c : 85 3b __ STA ACCU + 0 
1a9e : 85 3c __ STA ACCU + 1 
1aa0 : a5 2d __ LDA P0 ; (fnum + 0)
1aa2 : a6 2e __ LDX P1 
1aa4 : a4 2f __ LDY P2 
1aa6 : 20 ba ff JSR $ffba 
1aa9 : 20 c0 ff JSR $ffc0 
1aac : 90 08 __ BCC $1ab6 ; (krnio_open.s0 + 35)
1aae : a5 2d __ LDA P0 ; (fnum + 0)
1ab0 : 20 c3 ff JSR $ffc3 
1ab3 : 4c ba 1a JMP $1aba ; (krnio_open.s1001 + 0)
1ab6 : a9 01 __ LDA #$01
1ab8 : 85 3b __ STA ACCU + 0 
.s1001:
1aba : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
519b : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_getch:
.s0:
1abb : a4 2e __ LDY P1 ; (fnum + 0)
1abd : b9 9b 51 LDA $519b,y ; (krnio_pstatus + 0)
1ac0 : c9 40 __ CMP #$40
1ac2 : f0 48 __ BEQ $1b0c ; (krnio_getch.s1007 + 0)
.s3:
1ac4 : a9 ff __ LDA #$ff
1ac6 : 85 47 __ STA T3 + 0 
1ac8 : 85 48 __ STA T3 + 1 
1aca : 98 __ __ TYA
1acb : 20 12 1b JSR $1b12 ; (krnio_chkin.s1000 + 0)
1ace : a5 3b __ LDA ACCU + 0 
1ad0 : f0 19 __ BEQ $1aeb ; (krnio_getch.s7 + 0)
.s5:
1ad2 : 20 24 1b JSR $1b24 ; (krnio_chrin.s0 + 0)
1ad5 : a5 3b __ LDA ACCU + 0 
1ad7 : 85 47 __ STA T3 + 0 
1ad9 : a5 3c __ LDA ACCU + 1 
1adb : 85 48 __ STA T3 + 1 
1add : 20 2e 1b JSR $1b2e ; (krnio_status.s0 + 0)
1ae0 : a5 3b __ LDA ACCU + 0 
1ae2 : a6 2e __ LDX P1 ; (fnum + 0)
1ae4 : 9d 9b 51 STA $519b,x ; (krnio_pstatus + 0)
1ae7 : 09 00 __ ORA #$00
1ae9 : d0 0c __ BNE $1af7 ; (krnio_getch.s8 + 0)
.s7:
1aeb : 20 38 1b JSR $1b38 ; (krnio_clrchn.s0 + 0)
1aee : a5 47 __ LDA T3 + 0 
1af0 : 85 3b __ STA ACCU + 0 
1af2 : a5 48 __ LDA T3 + 1 
.s1006:
1af4 : 85 3c __ STA ACCU + 1 
.s1001:
1af6 : 60 __ __ RTS
.s8:
1af7 : c9 40 __ CMP #$40
1af9 : d0 0e __ BNE $1b09 ; (krnio_getch.s12 + 0)
.s11:
1afb : 20 38 1b JSR $1b38 ; (krnio_clrchn.s0 + 0)
1afe : a5 48 __ LDA T3 + 1 
1b00 : 09 01 __ ORA #$01
1b02 : 85 3c __ STA ACCU + 1 
1b04 : a5 47 __ LDA T3 + 0 
1b06 : 85 3b __ STA ACCU + 0 
1b08 : 60 __ __ RTS
.s12:
1b09 : 20 38 1b JSR $1b38 ; (krnio_clrchn.s0 + 0)
.s1007:
1b0c : a9 ff __ LDA #$ff
1b0e : 85 3b __ STA ACCU + 0 
1b10 : d0 e2 __ BNE $1af4 ; (krnio_getch.s1006 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1b12 : 85 2d __ STA P0 
.s0:
1b14 : a6 2d __ LDX P0 
1b16 : 20 c6 ff JSR $ffc6 
1b19 : a9 00 __ LDA #$00
1b1b : 85 3c __ STA ACCU + 1 
1b1d : b0 02 __ BCS $1b21 ; (krnio_chkin.s0 + 13)
1b1f : a9 01 __ LDA #$01
1b21 : 85 3b __ STA ACCU + 0 
.s1001:
1b23 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1b24 : 20 cf ff JSR $ffcf 
1b27 : 85 3b __ STA ACCU + 0 
1b29 : a9 00 __ LDA #$00
1b2b : 85 3c __ STA ACCU + 1 
.s1001:
1b2d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1b2e : 20 b7 ff JSR $ffb7 
1b31 : 85 3b __ STA ACCU + 0 
1b33 : a9 00 __ LDA #$00
1b35 : 85 3c __ STA ACCU + 1 
.s1001:
1b37 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1b38 : 20 cc ff JSR $ffcc 
.s1001:
1b3b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1b3c : 85 2d __ STA P0 
.s0:
1b3e : a5 2d __ LDA P0 
1b40 : 20 c3 ff JSR $ffc3 
.s1001:
1b43 : 60 __ __ RTS
--------------------------------------------------------------------
1b44 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1b54 : __ __ __ BYT 43 52 49 53 50 59 2e 42 49 4e 2c 50 2c 52 00    : CRISPY.BIN,P,R.
--------------------------------------------------------------------
getchx:
.s0:
1b63 : 20 6d 1b JSR $1b6d ; (getpch + 0)
1b66 : 85 3b __ STA ACCU + 0 
1b68 : a9 00 __ LDA #$00
1b6a : 85 3c __ STA ACCU + 1 
.s1001:
1b6c : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1b6d : 20 e4 ff JSR $ffe4 
1b70 : ae fc 29 LDX $29fc ; (giocharmap + 0)
1b73 : e0 01 __ CPX #$01
1b75 : 90 26 __ BCC $1b9d ; (getpch + 48)
1b77 : c9 0d __ CMP #$0d
1b79 : d0 02 __ BNE $1b7d ; (getpch + 16)
1b7b : a9 0a __ LDA #$0a
1b7d : e0 02 __ CPX #$02
1b7f : 90 1c __ BCC $1b9d ; (getpch + 48)
1b81 : c9 db __ CMP #$db
1b83 : b0 18 __ BCS $1b9d ; (getpch + 48)
1b85 : c9 41 __ CMP #$41
1b87 : 90 14 __ BCC $1b9d ; (getpch + 48)
1b89 : c9 c1 __ CMP #$c1
1b8b : 90 02 __ BCC $1b8f ; (getpch + 34)
1b8d : 49 a0 __ EOR #$a0
1b8f : c9 7b __ CMP #$7b
1b91 : b0 0a __ BCS $1b9d ; (getpch + 48)
1b93 : c9 61 __ CMP #$61
1b95 : b0 04 __ BCS $1b9b ; (getpch + 46)
1b97 : c9 5b __ CMP #$5b
1b99 : b0 02 __ BCS $1b9d ; (getpch + 48)
1b9b : 49 20 __ EOR #$20
1b9d : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
29fc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
29fd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
42ca : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
42cc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
42ce : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1b9e : a9 33 __ LDA #$33
1ba0 : 85 2d __ STA P0 
1ba2 : a9 38 __ LDA #$38
1ba4 : 85 2e __ STA P1 
1ba6 : a9 01 __ LDA #$01
1ba8 : 85 2f __ STA P2 
1baa : a6 32 __ LDX P5 ; (p + 0)
1bac : bd 00 43 LDA $4300,x ; (sintab + 0)
1baf : 4a __ __ LSR
1bb0 : 4a __ __ LSR
1bb1 : 4a __ __ LSR
1bb2 : 49 10 __ EOR #$10
1bb4 : 38 __ __ SEC
1bb5 : e9 10 __ SBC #$10
1bb7 : 18 __ __ CLC
1bb8 : 69 b4 __ ADC #$b4
1bba : 85 30 __ STA P3 
1bbc : a9 00 __ LDA #$00
1bbe : 85 31 __ STA P4 
1bc0 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1bc3 : a9 34 __ LDA #$34
1bc5 : 85 2d __ STA P0 
1bc7 : a9 20 __ LDA #$20
1bc9 : 85 2e __ STA P1 
1bcb : a6 34 __ LDX P7 ; (p2 + 0)
1bcd : bd 00 43 LDA $4300,x ; (sintab + 0)
1bd0 : 4a __ __ LSR
1bd1 : 4a __ __ LSR
1bd2 : 4a __ __ LSR
1bd3 : 49 10 __ EOR #$10
1bd5 : 38 __ __ SEC
1bd6 : e9 10 __ SBC #$10
1bd8 : 18 __ __ CLC
1bd9 : 69 b4 __ ADC #$b4
1bdb : 85 30 __ STA P3 
1bdd : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1be0 : a9 35 __ LDA #$35
1be2 : 85 2d __ STA P0 
1be4 : a9 00 __ LDA #$00
1be6 : 85 2e __ STA P1 
1be8 : a6 36 __ LDX P9 ; (p3 + 0)
1bea : bd 00 43 LDA $4300,x ; (sintab + 0)
1bed : 4a __ __ LSR
1bee : 4a __ __ LSR
1bef : 4a __ __ LSR
1bf0 : 49 10 __ EOR #$10
1bf2 : 38 __ __ SEC
1bf3 : e9 10 __ SBC #$10
1bf5 : 18 __ __ CLC
1bf6 : 69 a4 __ ADC #$a4
1bf8 : 85 30 __ STA P3 
1bfa : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1bfd : a9 36 __ LDA #$36
1bff : 85 2d __ STA P0 
1c01 : a9 40 __ LDA #$40
1c03 : 85 2e __ STA P1 
1c05 : a6 36 __ LDX P9 ; (p3 + 0)
1c07 : bd 00 43 LDA $4300,x ; (sintab + 0)
1c0a : 4a __ __ LSR
1c0b : 4a __ __ LSR
1c0c : 4a __ __ LSR
1c0d : 49 10 __ EOR #$10
1c0f : 38 __ __ SEC
1c10 : e9 10 __ SBC #$10
1c12 : 18 __ __ CLC
1c13 : 69 a4 __ ADC #$a4
1c15 : 85 30 __ STA P3 
1c17 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1c1a : a9 37 __ LDA #$37
1c1c : 85 2d __ STA P0 
1c1e : a9 00 __ LDA #$00
1c20 : 85 2e __ STA P1 
1c22 : a6 36 __ LDX P9 ; (p3 + 0)
1c24 : bd 00 43 LDA $4300,x ; (sintab + 0)
1c27 : 4a __ __ LSR
1c28 : 4a __ __ LSR
1c29 : 4a __ __ LSR
1c2a : 49 10 __ EOR #$10
1c2c : 38 __ __ SEC
1c2d : e9 10 __ SBC #$10
1c2f : 18 __ __ CLC
1c30 : 69 c4 __ ADC #$c4
1c32 : 85 30 __ STA P3 
1c34 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1c37 : a9 38 __ LDA #$38
1c39 : 85 2d __ STA P0 
1c3b : a9 40 __ LDA #$40
1c3d : 85 2e __ STA P1 
1c3f : a6 36 __ LDX P9 ; (p3 + 0)
1c41 : bd 00 43 LDA $4300,x ; (sintab + 0)
1c44 : 4a __ __ LSR
1c45 : 4a __ __ LSR
1c46 : 4a __ __ LSR
1c47 : 49 10 __ EOR #$10
1c49 : 38 __ __ SEC
1c4a : e9 10 __ SBC #$10
1c4c : 18 __ __ CLC
1c4d : 69 c4 __ ADC #$c4
1c4f : 85 30 __ STA P3 
1c51 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1c54 : a9 00 __ LDA #$00
1c56 : 85 2d __ STA P0 
1c58 : 85 2f __ STA P2 
1c5a : a9 68 __ LDA #$68
1c5c : 85 2e __ STA P1 
1c5e : a6 36 __ LDX P9 ; (p3 + 0)
1c60 : bd 00 43 LDA $4300,x ; (sintab + 0)
1c63 : 4a __ __ LSR
1c64 : 4a __ __ LSR
1c65 : 4a __ __ LSR
1c66 : 4a __ __ LSR
1c67 : 49 08 __ EOR #$08
1c69 : 38 __ __ SEC
1c6a : e9 08 __ SBC #$08
1c6c : 85 48 __ STA T2 + 0 
1c6e : a9 00 __ LDA #$00
1c70 : e9 00 __ SBC #$00
1c72 : 85 49 __ STA T2 + 1 
1c74 : 38 __ __ SEC
1c75 : a9 b6 __ LDA #$b6
1c77 : e5 48 __ SBC T2 + 0 
1c79 : 85 30 __ STA P3 
1c7b : a9 01 __ LDA #$01
1c7d : e5 49 __ SBC T2 + 1 
1c7f : 85 31 __ STA P4 
1c81 : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1c84 : a9 01 __ LDA #$01
1c86 : 85 2d __ STA P0 
1c88 : 85 2f __ STA P2 
1c8a : a9 f0 __ LDA #$f0
1c8c : 85 2e __ STA P1 
1c8e : a6 36 __ LDX P9 ; (p3 + 0)
1c90 : bd 00 43 LDA $4300,x ; (sintab + 0)
1c93 : 4a __ __ LSR
1c94 : 4a __ __ LSR
1c95 : 4a __ __ LSR
1c96 : 4a __ __ LSR
1c97 : 49 08 __ EOR #$08
1c99 : 38 __ __ SEC
1c9a : e9 08 __ SBC #$08
1c9c : a8 __ __ TAY
1c9d : a9 00 __ LDA #$00
1c9f : e9 00 __ SBC #$00
1ca1 : aa __ __ TAX
1ca2 : 98 __ __ TYA
1ca3 : 18 __ __ CLC
1ca4 : 69 b6 __ ADC #$b6
1ca6 : 85 30 __ STA P3 
1ca8 : 8a __ __ TXA
1ca9 : 69 01 __ ADC #$01
1cab : 85 31 __ STA P4 
1cad : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1cb0 : a9 00 __ LDA #$00
1cb2 : 85 47 __ STA T1 + 0 
1cb4 : 18 __ __ CLC
.l2:
1cb5 : a5 47 __ LDA T1 + 0 
1cb7 : 69 4f __ ADC #$4f
1cb9 : 85 2d __ STA P0 
1cbb : a5 47 __ LDA T1 + 0 
1cbd : 0a __ __ ASL
1cbe : 65 47 __ ADC T1 + 0 
1cc0 : 0a __ __ ASL
1cc1 : 0a __ __ ASL
1cc2 : 18 __ __ CLC
1cc3 : 6d d0 42 ADC $42d0 ; (FrameCount + 0)
1cc6 : aa __ __ TAX
1cc7 : ac d1 42 LDY $42d1 ; (FrameCount + 1)
1cca : bd 00 43 LDA $4300,x ; (sintab + 0)
1ccd : 10 01 __ BPL $1cd0 ; (MoveSprites.s1008 + 0)
.s1007:
1ccf : 88 __ __ DEY
.s1008:
1cd0 : 18 __ __ CLC
1cd1 : 6d d0 42 ADC $42d0 ; (FrameCount + 0)
1cd4 : 85 48 __ STA T2 + 0 
1cd6 : 90 01 __ BCC $1cd9 ; (MoveSprites.s1009 + 0)
.s1006:
1cd8 : c8 __ __ INY
.s1009:
1cd9 : 84 49 __ STY T2 + 1 
1cdb : a5 47 __ LDA T1 + 0 
1cdd : 0a __ __ ASL
1cde : 0a __ __ ASL
1cdf : 85 3b __ STA ACCU + 0 
1ce1 : a9 00 __ LDA #$00
1ce3 : 85 3c __ STA ACCU + 1 
1ce5 : a9 80 __ LDA #$80
1ce7 : 85 23 __ STA WORK + 0 
1ce9 : a9 02 __ LDA #$02
1ceb : 85 24 __ STA WORK + 1 
1ced : 20 3c 21 JSR $213c ; (divmod + 0)
1cf0 : 18 __ __ CLC
1cf1 : a5 25 __ LDA WORK + 2 
1cf3 : 65 48 __ ADC T2 + 0 
1cf5 : 85 2e __ STA P1 
1cf7 : a5 26 __ LDA WORK + 3 
1cf9 : 65 49 __ ADC T2 + 1 
1cfb : 85 2f __ STA P2 
1cfd : a5 47 __ LDA T1 + 0 
1cff : 0a __ __ ASL
1d00 : 0a __ __ ASL
1d01 : 65 47 __ ADC T1 + 0 
1d03 : 85 48 __ STA T2 + 0 
1d05 : ad d0 42 LDA $42d0 ; (FrameCount + 0)
1d08 : 38 __ __ SEC
1d09 : e9 40 __ SBC #$40
1d0b : 18 __ __ CLC
1d0c : 65 48 __ ADC T2 + 0 
1d0e : aa __ __ TAX
1d0f : bd 00 43 LDA $4300,x ; (sintab + 0)
1d12 : 4a __ __ LSR
1d13 : 49 40 __ EOR #$40
1d15 : 38 __ __ SEC
1d16 : e9 40 __ SBC #$40
1d18 : a8 __ __ TAY
1d19 : a9 00 __ LDA #$00
1d1b : e9 00 __ SBC #$00
1d1d : 85 49 __ STA T2 + 1 
1d1f : a5 47 __ LDA T1 + 0 
1d21 : 0a __ __ ASL
1d22 : 0a __ __ ASL
1d23 : 0a __ __ ASL
1d24 : 85 3b __ STA ACCU + 0 
1d26 : ad d0 42 LDA $42d0 ; (FrameCount + 0)
1d29 : 38 __ __ SEC
1d2a : e9 20 __ SBC #$20
1d2c : 18 __ __ CLC
1d2d : 65 3b __ ADC ACCU + 0 
1d2f : aa __ __ TAX
1d30 : bd 00 43 LDA $4300,x ; (sintab + 0)
1d33 : 4a __ __ LSR
1d34 : 4a __ __ LSR
1d35 : 4a __ __ LSR
1d36 : 4a __ __ LSR
1d37 : 49 08 __ EOR #$08
1d39 : 38 __ __ SEC
1d3a : e9 08 __ SBC #$08
1d3c : 85 4a __ STA T3 + 0 
1d3e : a9 00 __ LDA #$00
1d40 : e9 00 __ SBC #$00
1d42 : 85 4b __ STA T3 + 1 
1d44 : a5 47 __ LDA T1 + 0 
1d46 : 0a __ __ ASL
1d47 : 65 47 __ ADC T1 + 0 
1d49 : 85 3b __ STA ACCU + 0 
1d4b : a5 47 __ LDA T1 + 0 
1d4d : c9 17 __ CMP #$17
1d4f : f0 2d __ BEQ $1d7e ; (MoveSprites.s5 + 0)
.s6:
1d51 : 98 __ __ TYA
1d52 : 18 __ __ CLC
1d53 : 69 c4 __ ADC #$c4
1d55 : a8 __ __ TAY
1d56 : a5 49 __ LDA T2 + 1 
1d58 : 69 00 __ ADC #$00
1d5a : aa __ __ TAX
1d5b : 98 __ __ TYA
1d5c : 18 __ __ CLC
1d5d : 65 4a __ ADC T3 + 0 
1d5f : a8 __ __ TAY
1d60 : 8a __ __ TXA
1d61 : 65 4b __ ADC T3 + 1 
1d63 : aa __ __ TAX
1d64 : 98 __ __ TYA
1d65 : 18 __ __ CLC
1d66 : 65 3b __ ADC ACCU + 0 
1d68 : 85 30 __ STA P3 
1d6a : 90 01 __ BCC $1d6d ; (MoveSprites.s1013 + 0)
.s1012:
1d6c : e8 __ __ INX
.s1013:
1d6d : 86 31 __ STX P4 
1d6f : 20 16 19 JSR $1916 ; (vera_spr_move.s0 + 0)
1d72 : e6 47 __ INC T1 + 0 
1d74 : a5 47 __ LDA T1 + 0 
1d76 : c9 18 __ CMP #$18
1d78 : b0 03 __ BCS $1d7d ; (MoveSprites.s1001 + 0)
1d7a : 4c b5 1c JMP $1cb5 ; (MoveSprites.l2 + 0)
.s1001:
1d7d : 60 __ __ RTS
.s5:
1d7e : 98 __ __ TYA
1d7f : 18 __ __ CLC
1d80 : 69 bc __ ADC #$bc
1d82 : 18 __ __ CLC
1d83 : 65 4a __ ADC T3 + 0 
1d85 : a8 __ __ TAY
1d86 : a9 00 __ LDA #$00
1d88 : 65 4b __ ADC T3 + 1 
1d8a : aa __ __ TAX
1d8b : 98 __ __ TYA
1d8c : 18 __ __ CLC
1d8d : 65 3b __ ADC ACCU + 0 
1d8f : 85 30 __ STA P3 
1d91 : 90 01 __ BCC $1d94 ; (MoveSprites.s1011 + 0)
.s1010:
1d93 : e8 __ __ INX
.s1011:
1d94 : 86 31 __ STX P4 
1d96 : 4c 16 19 JMP $1916 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4300 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4310 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4320 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4330 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4340 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4350 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4360 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4370 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4380 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4390 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
43a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
43b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
43c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
43d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
43e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
43f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
42d0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1d99 : a9 08 __ LDA #$08
1d9b : 8d 2c 9f STA $9f2c 
1d9e : a5 33 __ LDA P6 ; (TuneSelection + 1)
1da0 : c5 35 __ CMP P8 ; (LastSong + 1)
1da2 : d0 0d __ BNE $1db1 ; (PlayZSM.s1 + 0)
.s1006:
1da4 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1da6 : c5 34 __ CMP P7 ; (LastSong + 0)
1da8 : d0 07 __ BNE $1db1 ; (PlayZSM.s1 + 0)
.s4:
1daa : 20 e8 1d JSR $1de8 ; (zsm_check.s0 + 0)
1dad : 09 00 __ ORA #$00
1daf : f0 2b __ BEQ $1ddc ; (PlayZSM.s1001 + 0)
.s1:
1db1 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1db3 : d0 27 __ BNE $1ddc ; (PlayZSM.s1001 + 0)
.s1005:
1db5 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1db7 : c9 01 __ CMP #$01
1db9 : d0 07 __ BNE $1dc2 ; (PlayZSM.s1004 + 0)
.s6:
1dbb : a9 1f __ LDA #$1f
1dbd : a0 3b __ LDY #$3b
1dbf : 4c e1 1d JMP $1de1 ; (PlayZSM.s21 + 0)
.s1004:
1dc2 : c9 02 __ CMP #$02
1dc4 : d0 07 __ BNE $1dcd ; (PlayZSM.s1003 + 0)
.s8:
1dc6 : a9 1f __ LDA #$1f
1dc8 : a0 59 __ LDY #$59
1dca : 4c e1 1d JMP $1de1 ; (PlayZSM.s21 + 0)
.s1003:
1dcd : c9 03 __ CMP #$03
1dcf : d0 07 __ BNE $1dd8 ; (PlayZSM.s1002 + 0)
.s10:
1dd1 : a9 1f __ LDA #$1f
1dd3 : a0 7e __ LDY #$7e
1dd5 : 4c e1 1d JMP $1de1 ; (PlayZSM.s21 + 0)
.s1002:
1dd8 : c9 04 __ CMP #$04
1dda : f0 01 __ BEQ $1ddd ; (PlayZSM.s12 + 0)
.s1001:
1ddc : 60 __ __ RTS
.s12:
1ddd : a9 1f __ LDA #$1f
1ddf : a0 a5 __ LDY #$a5
.s21:
1de1 : 84 30 __ STY P3 
1de3 : 85 31 __ STA P4 
1de5 : 4c ec 1d JMP $1dec ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1de8 : ad ec 21 LDA $21ec ; (zsm_finished + 0)
.s1001:
1deb : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1dec : a9 01 __ LDA #$01
1dee : 8d ec 21 STA $21ec ; (zsm_finished + 0)
1df1 : ad ff 29 LDA $29ff ; (zsm_reading + 0)
1df4 : f0 0a __ BEQ $1e00 ; (zsm_init.s3 + 0)
.s1:
1df6 : a9 02 __ LDA #$02
1df8 : 20 3c 1b JSR $1b3c ; (krnio_close.s1000 + 0)
1dfb : a9 00 __ LDA #$00
1dfd : 8d ff 29 STA $29ff ; (zsm_reading + 0)
.s3:
1e00 : 20 4d 1e JSR $1e4d ; (zsm_silence.s0 + 0)
1e03 : 20 65 1e JSR $1e65 ; (zsm_save_volume.s0 + 0)
1e06 : a9 00 __ LDA #$00
1e08 : 8d fe 42 STA $42fe ; (zsm_pos + 0)
1e0b : 8d ff 42 STA $42ff ; (zsm_pos + 1)
1e0e : 8d bb 51 STA $51bb ; (zsm_wpos + 0)
1e11 : 8d bc 51 STA $51bc ; (zsm_wpos + 1)
1e14 : 8d fd 42 STA $42fd ; (zsm_delay + 0)
1e17 : a5 30 __ LDA P3 ; (fname + 0)
1e19 : 85 2d __ STA P0 
1e1b : a5 31 __ LDA P4 ; (fname + 1)
1e1d : 85 2e __ STA P1 
1e1f : 20 7d 1a JSR $1a7d ; (krnio_setnam.s0 + 0)
1e22 : a9 02 __ LDA #$02
1e24 : 85 2d __ STA P0 
1e26 : 85 2f __ STA P2 
1e28 : a9 08 __ LDA #$08
1e2a : 85 2e __ STA P1 
1e2c : 20 93 1a JSR $1a93 ; (krnio_open.s0 + 0)
1e2f : a5 3b __ LDA ACCU + 0 
1e31 : f0 19 __ BEQ $1e4c ; (zsm_init.s1001 + 0)
.s4:
1e33 : a9 01 __ LDA #$01
1e35 : 8d ff 29 STA $29ff ; (zsm_reading + 0)
1e38 : 20 97 1e JSR $1e97 ; (zsm_fill.s0 + 0)
1e3b : a9 10 __ LDA #$10
1e3d : 8d fe 42 STA $42fe ; (zsm_pos + 0)
1e40 : a9 00 __ LDA #$00
1e42 : 8d ff 42 STA $42ff ; (zsm_pos + 1)
1e45 : 8d ec 21 STA $21ec ; (zsm_finished + 0)
1e48 : a9 01 __ LDA #$01
1e4a : 85 3b __ STA ACCU + 0 
.s1001:
1e4c : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
29ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
1e4d : a9 00 __ LDA #$00
1e4f : 85 47 __ STA T0 + 0 
1e51 : a9 08 __ LDA #$08
1e53 : 85 2d __ STA P0 
1e55 : a9 00 __ LDA #$00
.l1006:
1e57 : 85 2e __ STA P1 
1e59 : 20 c2 0d JSR $0dc2 ; (sfx_put.l1 + 0)
1e5c : e6 47 __ INC T0 + 0 
1e5e : a5 47 __ LDA T0 + 0 
1e60 : c9 08 __ CMP #$08
1e62 : 90 f3 __ BCC $1e57 ; (zsm_silence.l1006 + 0)
.s1001:
1e64 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1e65 : a0 00 __ LDY #$00
1e67 : 84 3c __ STY ACCU + 1 
1e69 : a2 02 __ LDX #$02
1e6b : 18 __ __ CLC
.l1006:
1e6c : 8a __ __ TXA
1e6d : 09 c0 __ ORA #$c0
1e6f : 8d 20 9f STA $9f20 
1e72 : a5 3c __ LDA ACCU + 1 
1e74 : 09 f9 __ ORA #$f9
1e76 : 8d 21 9f STA $9f21 
1e79 : a9 01 __ LDA #$01
1e7b : 8d 22 9f STA $9f22 
1e7e : ad 23 9f LDA $9f23 
1e81 : 99 ab 51 STA $51ab,y ; (vera_volumes + 0)
1e84 : a9 00 __ LDA #$00
1e86 : 8d 23 9f STA $9f23 
1e89 : 8a __ __ TXA
1e8a : 69 04 __ ADC #$04
1e8c : aa __ __ TAX
1e8d : 90 02 __ BCC $1e91 ; (zsm_save_volume.s1009 + 0)
.s1008:
1e8f : e6 3c __ INC ACCU + 1 
.s1009:
1e91 : c8 __ __ INY
1e92 : c0 10 __ CPY #$10
1e94 : 90 d6 __ BCC $1e6c ; (zsm_save_volume.l1006 + 0)
.s1001:
1e96 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
51ab : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
51bb : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
1e97 : ad ff 29 LDA $29ff ; (zsm_reading + 0)
1e9a : f0 20 __ BEQ $1ebc ; (zsm_fill.s1 + 0)
.s2:
1e9c : ad ff 42 LDA $42ff ; (zsm_pos + 1)
1e9f : 18 __ __ CLC
1ea0 : 69 04 __ ADC #$04
1ea2 : cd bc 51 CMP $51bc ; (zsm_wpos + 1)
1ea5 : d0 0c __ BNE $1eb3 ; (zsm_fill.s6 + 0)
.s1006:
1ea7 : ad bb 51 LDA $51bb ; (zsm_wpos + 0)
1eaa : cd fe 42 CMP $42fe ; (zsm_pos + 0)
1ead : d0 04 __ BNE $1eb3 ; (zsm_fill.s6 + 0)
.s5:
1eaf : a9 00 __ LDA #$00
1eb1 : f0 0b __ BEQ $1ebe ; (zsm_fill.s1008 + 0)
.s6:
1eb3 : a9 02 __ LDA #$02
1eb5 : 20 12 1b JSR $1b12 ; (krnio_chkin.s1000 + 0)
1eb8 : a5 3b __ LDA ACCU + 0 
1eba : d0 07 __ BNE $1ec3 ; (zsm_fill.s9 + 0)
.s1:
1ebc : a9 ff __ LDA #$ff
.s1008:
1ebe : 85 3b __ STA ACCU + 0 
.s1001:
1ec0 : 85 3c __ STA ACCU + 1 
1ec2 : 60 __ __ RTS
.s9:
1ec3 : a9 00 __ LDA #$00
1ec5 : 85 47 __ STA T1 + 0 
1ec7 : 85 48 __ STA T1 + 1 
1ec9 : ad ff 42 LDA $42ff ; (zsm_pos + 1)
1ecc : 18 __ __ CLC
1ecd : 69 04 __ ADC #$04
1ecf : cd bc 51 CMP $51bc ; (zsm_wpos + 1)
1ed2 : d0 08 __ BNE $1edc ; (zsm_fill.l13 + 0)
.s1002:
1ed4 : ad bb 51 LDA $51bb ; (zsm_wpos + 0)
1ed7 : cd fe 42 CMP $42fe ; (zsm_pos + 0)
1eda : f0 49 __ BEQ $1f25 ; (zsm_fill.s38 + 0)
.l13:
1edc : 20 24 1b JSR $1b24 ; (krnio_chrin.s0 + 0)
1edf : ad bb 51 LDA $51bb ; (zsm_wpos + 0)
1ee2 : aa __ __ TAX
1ee3 : 18 __ __ CLC
1ee4 : 69 01 __ ADC #$01
1ee6 : 8d bb 51 STA $51bb ; (zsm_wpos + 0)
1ee9 : ad bc 51 LDA $51bc ; (zsm_wpos + 1)
1eec : a8 __ __ TAY
1eed : 69 00 __ ADC #$00
1eef : 8d bc 51 STA $51bc ; (zsm_wpos + 1)
1ef2 : 8a __ __ TXA
1ef3 : 18 __ __ CLC
1ef4 : 69 be __ ADC #$be
1ef6 : 85 49 __ STA T3 + 0 
1ef8 : 98 __ __ TYA
1ef9 : 29 03 __ AND #$03
1efb : 69 54 __ ADC #$54
1efd : 85 4a __ STA T3 + 1 
1eff : a5 3b __ LDA ACCU + 0 
1f01 : a0 00 __ LDY #$00
1f03 : 91 49 __ STA (T3 + 0),y 
1f05 : e6 47 __ INC T1 + 0 
1f07 : d0 02 __ BNE $1f0b ; (zsm_fill.s1010 + 0)
.s1009:
1f09 : e6 48 __ INC T1 + 1 
.s1010:
1f0b : 20 2e 1b JSR $1b2e ; (krnio_status.s0 + 0)
1f0e : a5 3b __ LDA ACCU + 0 
1f10 : d0 0e __ BNE $1f20 ; (zsm_fill.s15 + 0)
.s12:
1f12 : ad ff 42 LDA $42ff ; (zsm_pos + 1)
1f15 : 18 __ __ CLC
1f16 : 69 04 __ ADC #$04
1f18 : cd bc 51 CMP $51bc ; (zsm_wpos + 1)
1f1b : d0 bf __ BNE $1edc ; (zsm_fill.l13 + 0)
1f1d : 4c d4 1e JMP $1ed4 ; (zsm_fill.s1002 + 0)
.s15:
1f20 : a9 00 __ LDA #$00
1f22 : 8d ff 29 STA $29ff ; (zsm_reading + 0)
.s38:
1f25 : 20 38 1b JSR $1b38 ; (krnio_clrchn.s0 + 0)
1f28 : ad ff 29 LDA $29ff ; (zsm_reading + 0)
1f2b : d0 05 __ BNE $1f32 ; (zsm_fill.s21 + 0)
.s19:
1f2d : a9 02 __ LDA #$02
1f2f : 20 3c 1b JSR $1b3c ; (krnio_close.s1000 + 0)
.s21:
1f32 : a5 47 __ LDA T1 + 0 
1f34 : 85 3b __ STA ACCU + 0 
1f36 : a5 48 __ LDA T1 + 1 
1f38 : 4c c0 1e JMP $1ec0 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
1f3b : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1f4b : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1f59 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1f69 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1f79 : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
1f7e : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1f8e : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
1f9e : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
1fa5 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
1fb5 : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
LastSelectedSong:
42d2 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
42d3 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
42d5 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
42e5 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1fc1 : a9 10 __ LDA #$10
1fc3 : 85 30 __ STA P3 
1fc5 : a9 00 __ LDA #$00
1fc7 : 85 31 __ STA P4 
1fc9 : a5 32 __ LDA P5 ; (Palette + 0)
1fcb : 85 2e __ STA P1 
1fcd : 85 47 __ STA T0 + 0 
1fcf : a5 33 __ LDA P6 ; (Palette + 1)
1fd1 : 85 2f __ STA P2 
1fd3 : 85 48 __ STA T0 + 1 
1fd5 : a5 34 __ LDA P7 ; (index + 0)
1fd7 : 85 2d __ STA P0 
1fd9 : ad fc 9e LDA $9efc ; (sstack + 0)
1fdc : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1fde : 0a __ __ ASL
1fdf : 85 49 __ STA T3 + 0 
1fe1 : ad fd 9e LDA $9efd ; (sstack + 1)
1fe4 : 2a __ __ ROL
1fe5 : 18 __ __ CLC
1fe6 : 65 33 __ ADC P6 ; (Palette + 1)
1fe8 : 85 4a __ STA T3 + 1 
1fea : a4 32 __ LDY P5 ; (Palette + 0)
1fec : b1 49 __ LDA (T3 + 0),y 
1fee : aa __ __ TAX
1fef : c8 __ __ INY
1ff0 : b1 49 __ LDA (T3 + 0),y 
1ff2 : 86 49 __ STX T3 + 0 
1ff4 : 85 4a __ STA T3 + 1 
1ff6 : a9 00 __ LDA #$00
1ff8 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1ffa : ad fe 9e LDA $9efe ; (sstack + 2)
1ffd : 85 4b __ STA T5 + 0 
1fff : 38 __ __ SEC
2000 : e9 01 __ SBC #$01
2002 : 85 4d __ STA T6 + 0 
2004 : ad ff 9e LDA $9eff ; (sstack + 3)
2007 : 85 4c __ STA T5 + 1 
2009 : e9 00 __ SBC #$00
200b : 85 4e __ STA T6 + 1 
200d : d0 06 __ BNE $2015 ; (SetPaletteIndex.s5 + 0)
.s1004:
200f : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
2011 : c5 4d __ CMP T6 + 0 
2013 : b0 38 __ BCS $204d ; (SetPaletteIndex.s4 + 0)
.s5:
2015 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
2017 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
2019 : 18 __ __ CLC
201a : a5 32 __ LDA P5 ; (Palette + 0)
201c : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
201e : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2020 : a5 33 __ LDA P6 ; (Palette + 1)
2022 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
2024 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
2026 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
2029 : a0 02 __ LDY #$02
202b : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
202d : a0 00 __ LDY #$00
202f : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
2031 : a0 03 __ LDY #$03
2033 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
2035 : a0 01 __ LDY #$01
2037 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
2039 : 18 __ __ CLC
203a : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
203c : 69 02 __ ADC #$02
203e : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2040 : 90 02 __ BCC $2044 ; (SetPaletteIndex.s1008 + 0)
.s1007:
2042 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
2044 : e8 __ __ INX
2045 : a5 4e __ LDA T6 + 1 
2047 : d0 e0 __ BNE $2029 ; (SetPaletteIndex.l2 + 0)
.s1002:
2049 : e4 4d __ CPX T6 + 0 
204b : 90 dc __ BCC $2029 ; (SetPaletteIndex.l2 + 0)
.s4:
204d : a5 4b __ LDA T5 + 0 
204f : 0a __ __ ASL
2050 : aa __ __ TAX
2051 : a5 4c __ LDA T5 + 1 
2053 : 2a __ __ ROL
2054 : a8 __ __ TAY
2055 : 8a __ __ TXA
2056 : 38 __ __ SEC
2057 : e9 02 __ SBC #$02
2059 : b0 01 __ BCS $205c ; (SetPaletteIndex.s1010 + 0)
.s1009:
205b : 88 __ __ DEY
.s1010:
205c : 18 __ __ CLC
205d : 65 47 __ ADC T0 + 0 
205f : 85 47 __ STA T0 + 0 
2061 : 98 __ __ TYA
2062 : 65 48 __ ADC T0 + 1 
2064 : 85 48 __ STA T0 + 1 
2066 : a5 49 __ LDA T3 + 0 
2068 : a0 00 __ LDY #$00
206a : 91 47 __ STA (T0 + 0),y 
206c : a5 4a __ LDA T3 + 1 
206e : c8 __ __ INY
206f : 91 47 __ STA (T0 + 0),y 
2071 : 4c 8c 19 JMP $198c ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
42f5 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4400 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4410 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
42f7 : __ __ __ BYT 04                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
2074 : ad 25 9f LDA $9f25 
2077 : 29 fe __ AND #$fe
2079 : 8d 25 9f STA $9f25 
207c : a9 00 __ LDA #$00
207e : 8d 20 9f STA $9f20 
2081 : a9 b0 __ LDA #$b0
2083 : 8d 21 9f STA $9f21 
2086 : a9 11 __ LDA #$11
2088 : 8d 22 9f STA $9f22 
208b : a2 80 __ LDX #$80
208d : a9 00 __ LDA #$00
.l1002:
208f : 8d 23 9f STA $9f23 
2092 : 8d 23 9f STA $9f23 
2095 : ca __ __ DEX
2096 : d0 f7 __ BNE $208f ; (ResetChars.l1002 + 0)
.s1001:
2098 : 60 __ __ RTS
--------------------------------------------------------------------
off1:
42f8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
2099 : a5 31 __ LDA P4 ; (Input + 0)
209b : c9 20 __ CMP #$20
209d : d0 1c __ BNE $20bb ; (Control.s1007 + 0)
.s1:
209f : a5 30 __ LDA P3 ; (playing + 0)
20a1 : d0 0a __ BNE $20ad ; (Control.s4 + 0)
.s5:
20a3 : a9 01 __ LDA #$01
20a5 : 20 0f 21 JSR $210f ; (zsm_irq_play.s0 + 0)
20a8 : a9 01 __ LDA #$01
.s1001:
20aa : 85 3b __ STA ACCU + 0 
20ac : 60 __ __ RTS
.s4:
20ad : a9 00 __ LDA #$00
20af : cd fa 42 CMP $42fa ; (paused + 0)
20b2 : 2a __ __ ROL
20b3 : 8d fa 42 STA $42fa ; (paused + 0)
20b6 : 85 2f __ STA P2 
20b8 : 20 c0 20 JSR $20c0 ; (zsm_pause.s0 + 0)
.s1007:
20bb : a5 30 __ LDA P3 ; (playing + 0)
20bd : 4c aa 20 JMP $20aa ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
42fa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
20c0 : a5 2f __ LDA P2 ; (pause + 0)
20c2 : d0 0e __ BNE $20d2 ; (zsm_pause.s4 + 0)
.s8:
20c4 : ad ed 21 LDA $21ed ; (zsm_paused + 0)
20c7 : f0 08 __ BEQ $20d1 ; (zsm_pause.s1001 + 0)
.s5:
20c9 : 20 e2 20 JSR $20e2 ; (zsm_restore_volume.s0 + 0)
20cc : a9 00 __ LDA #$00
20ce : 8d ed 21 STA $21ed ; (zsm_paused + 0)
.s1001:
20d1 : 60 __ __ RTS
.s4:
20d2 : ad ed 21 LDA $21ed ; (zsm_paused + 0)
20d5 : d0 fa __ BNE $20d1 ; (zsm_pause.s1001 + 0)
.s1:
20d7 : a9 01 __ LDA #$01
20d9 : 8d ed 21 STA $21ed ; (zsm_paused + 0)
20dc : 20 4d 1e JSR $1e4d ; (zsm_silence.s0 + 0)
20df : 4c 65 1e JMP $1e65 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
20e2 : a0 00 __ LDY #$00
20e4 : 84 3c __ STY ACCU + 1 
20e6 : a2 02 __ LDX #$02
20e8 : 18 __ __ CLC
.l1006:
20e9 : 8a __ __ TXA
20ea : 09 c0 __ ORA #$c0
20ec : 8d 20 9f STA $9f20 
20ef : a5 3c __ LDA ACCU + 1 
20f1 : 09 f9 __ ORA #$f9
20f3 : 8d 21 9f STA $9f21 
20f6 : a9 01 __ LDA #$01
20f8 : 8d 22 9f STA $9f22 
20fb : b9 ab 51 LDA $51ab,y ; (vera_volumes + 0)
20fe : 8d 23 9f STA $9f23 
2101 : 8a __ __ TXA
2102 : 69 04 __ ADC #$04
2104 : aa __ __ TAX
2105 : 90 02 __ BCC $2109 ; (zsm_restore_volume.s1009 + 0)
.s1008:
2107 : e6 3c __ INC ACCU + 1 
.s1009:
2109 : c8 __ __ INY
210a : c0 10 __ CPY #$10
210c : 90 db __ BCC $20e9 ; (zsm_restore_volume.l1006 + 0)
.s1001:
210e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
210f : 8d eb 21 STA $21eb ; (zsm_playing + 0)
.s1001:
2112 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4420 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4430 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4440 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4450 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4460 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4470 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4480 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4490 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
44a0 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
44b0 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
44c0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
44d0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
44e0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
44f0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
4500 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
4510 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4520 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4530 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4540 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4550 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4560 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4570 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4580 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4590 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
45a0 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
45b0 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
45c0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
45d0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
45e0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
45f0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4600 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4610 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4620 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4630 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4640 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4650 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4660 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4670 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4680 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4690 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
46a0 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
46b0 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
46c0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
46d0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
46e0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
46f0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4700 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4710 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4720 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4730 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4740 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4750 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4760 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4770 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4780 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4790 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
47a0 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
47b0 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
47c0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
47d0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
47e0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
47f0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4800 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4810 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4820 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4830 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4840 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4850 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4860 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4870 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4880 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4890 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
48a0 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
48b0 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
48c0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
48d0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
48e0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
48f0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4900 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4910 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4920 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4930 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4940 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4950 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4960 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4970 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4980 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4990 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
49a0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
49b0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
49c0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
49d0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
49e0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
49f0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4a00 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4a10 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4a20 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4a30 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
4a3e : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4a4e : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4a5e : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4a6e : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4a7e : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4a8e : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4a9e : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4aae : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
4abe : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
4ace : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
4ade : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
4aee : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
4afe : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
4b0e : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
4b1e : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
4b2e : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
4b3e : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
4b4e : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
4b5e : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
4b6e : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
4b7e : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
4b8e : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
4b9e : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
4bae : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
4bbe : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
4bce : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
4bde : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
4bee : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
4bfe : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
4c0e : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
4c1e : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
4c2e : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
4c3e : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
4c4e : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
4c5e : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
4c6e : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
4c7e : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
4c8e : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
4c9e : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
4cae : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
4cbe : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
4cce : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
4cde : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
4cee : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
4cfe : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
4d0e : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
4d1e : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
4d2e : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
4d3e : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
4d4e : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
4d5e : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
4d6e : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
4d7e : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
4d8e : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
4d9e : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
4dae : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
4dbe : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
4dce : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
4dde : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
4dee : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
4dfe : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
4e0e : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
4e1e : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
4e2e : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
4e3e : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
4e4e : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
4e5e : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
4e6e : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
4e7e : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
4e8e : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
4e9e : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
4eae : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
4ebe : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
4ece : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
4ede : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
4eee : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
4efe : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
4f0e : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
4f1e : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
4f2e : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
4f3e : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
4f4e : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
4f5e : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
4f6e : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
4f7e : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
4f8e : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
4f9e : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
4fae : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
4fbe : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
4fce : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
4fde : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
4fee : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
4ffe : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
500e : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
501e : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
502e : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
503e : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
504e : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
505e : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
506e : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
507e : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
508e : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
509e : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
50ae : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
50be : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
50ce : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
50de : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
50ee : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
50fe : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
510e : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
511e : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
512e : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
513e : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
514e : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
515e : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
516e : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
517e : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
518e : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5200 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5210 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5220 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5230 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5240 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5250 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5260 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5270 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5280 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5290 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
52a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
52b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
52c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5300 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5310 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5320 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5330 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5340 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5350 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5360 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5370 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5380 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5390 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
53a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
53b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
53c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
Song4:
5400 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5410 : __ __ __ BYT 0d 05 3a 20 2d 20 22 07 0f 02 13 0d 01 03 0b 05 : ..: - ".........
5420 : __ __ __ BYT 04 22 20 2d 20 01 12 14 09 13 14 3a 20 22 06 01 : ." - ......: "..
5430 : __ __ __ BYT 04 05 22 20 2d 20 0c 05 0e 07 14 08 3a 20 33 3a : .." - ......: 3:
5440 : __ __ __ BYT 32 33 20 2d 20 03 0f 0d 0d 05 0e 14 3a 20 09 20 : 23 - .......: . 
5450 : __ __ __ BYT 02 05 14 20 19 0f 15 20 04 09 04 0e 27 14 20 14 : ... ... ....'. .
5460 : __ __ __ BYT 08 09 0e 0b 20 14 08 05 20 17 01 12 0d 14 08 20 : .... ... ...... 
5470 : __ __ __ BYT 0f 06 20 16 09 0e 19 0c 20 03 0f 15 0c 04 20 02 : .. ..... ..... .
5480 : __ __ __ BYT 05 20 12 05 10 0c 09 03 01 14 05 04 20 09 0e 20 : . .......... .. 
5490 : __ __ __ BYT 01 0e 19 14 08 09 0e 07 20 04 09 07 09 14 01 0c : ........ .......
54a0 : __ __ __ BYT 2c 20 02 15 14 20 08 05 12 05 20 17 05 20 01 12 : , ... .... .. ..
54b0 : __ __ __ BYT 05 20 3a 33 20 3d 20 3d 20 2d 20 2d 20 00       : . :3 = = - - .
--------------------------------------------------------------------
frame_wait:
.l1:
2113 : ad 26 9f LDA $9f26 
2116 : 0a __ __ ASL
2117 : 30 fa __ BMI $2113 ; (frame_wait.l1 + 0)
.l4:
2119 : ad 26 9f LDA $9f26 
211c : 0a __ __ ASL
211d : 10 fa __ BPL $2119 ; (frame_wait.l4 + 0)
.s1001:
211f : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
2120 : 38 __ __ SEC
2121 : a9 00 __ LDA #$00
2123 : e5 3b __ SBC ACCU + 0 
2125 : 85 3b __ STA ACCU + 0 
2127 : a9 00 __ LDA #$00
2129 : e5 3c __ SBC ACCU + 1 
212b : 85 3c __ STA ACCU + 1 
212d : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
212e : 38 __ __ SEC
212f : a9 00 __ LDA #$00
2131 : e5 23 __ SBC WORK + 0 
2133 : 85 23 __ STA WORK + 0 
2135 : a9 00 __ LDA #$00
2137 : e5 24 __ SBC WORK + 1 
2139 : 85 24 __ STA WORK + 1 
213b : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
213c : a5 3c __ LDA ACCU + 1 
213e : d0 31 __ BNE $2171 ; (divmod + 53)
2140 : a5 24 __ LDA WORK + 1 
2142 : d0 1e __ BNE $2162 ; (divmod + 38)
2144 : 85 26 __ STA WORK + 3 
2146 : a2 04 __ LDX #$04
2148 : 06 3b __ ASL ACCU + 0 
214a : 2a __ __ ROL
214b : c5 23 __ CMP WORK + 0 
214d : 90 02 __ BCC $2151 ; (divmod + 21)
214f : e5 23 __ SBC WORK + 0 
2151 : 26 3b __ ROL ACCU + 0 
2153 : 2a __ __ ROL
2154 : c5 23 __ CMP WORK + 0 
2156 : 90 02 __ BCC $215a ; (divmod + 30)
2158 : e5 23 __ SBC WORK + 0 
215a : 26 3b __ ROL ACCU + 0 
215c : ca __ __ DEX
215d : d0 eb __ BNE $214a ; (divmod + 14)
215f : 85 25 __ STA WORK + 2 
2161 : 60 __ __ RTS
2162 : a5 3b __ LDA ACCU + 0 
2164 : 85 25 __ STA WORK + 2 
2166 : a5 3c __ LDA ACCU + 1 
2168 : 85 26 __ STA WORK + 3 
216a : a9 00 __ LDA #$00
216c : 85 3b __ STA ACCU + 0 
216e : 85 3c __ STA ACCU + 1 
2170 : 60 __ __ RTS
2171 : a5 24 __ LDA WORK + 1 
2173 : d0 1f __ BNE $2194 ; (divmod + 88)
2175 : a5 23 __ LDA WORK + 0 
2177 : 30 1b __ BMI $2194 ; (divmod + 88)
2179 : a9 00 __ LDA #$00
217b : 85 26 __ STA WORK + 3 
217d : a2 10 __ LDX #$10
217f : 06 3b __ ASL ACCU + 0 
2181 : 26 3c __ ROL ACCU + 1 
2183 : 2a __ __ ROL
2184 : c5 23 __ CMP WORK + 0 
2186 : 90 02 __ BCC $218a ; (divmod + 78)
2188 : e5 23 __ SBC WORK + 0 
218a : 26 3b __ ROL ACCU + 0 
218c : 26 3c __ ROL ACCU + 1 
218e : ca __ __ DEX
218f : d0 f2 __ BNE $2183 ; (divmod + 71)
2191 : 85 25 __ STA WORK + 2 
2193 : 60 __ __ RTS
2194 : a9 00 __ LDA #$00
2196 : 85 25 __ STA WORK + 2 
2198 : 85 26 __ STA WORK + 3 
219a : 84 22 __ STY $22 
219c : a0 10 __ LDY #$10
219e : 18 __ __ CLC
219f : 26 3b __ ROL ACCU + 0 
21a1 : 26 3c __ ROL ACCU + 1 
21a3 : 26 25 __ ROL WORK + 2 
21a5 : 26 26 __ ROL WORK + 3 
21a7 : 38 __ __ SEC
21a8 : a5 25 __ LDA WORK + 2 
21aa : e5 23 __ SBC WORK + 0 
21ac : aa __ __ TAX
21ad : a5 26 __ LDA WORK + 3 
21af : e5 24 __ SBC WORK + 1 
21b1 : 90 04 __ BCC $21b7 ; (divmod + 123)
21b3 : 86 25 __ STX WORK + 2 
21b5 : 85 26 __ STA WORK + 3 
21b7 : 88 __ __ DEY
21b8 : d0 e5 __ BNE $219f ; (divmod + 99)
21ba : 26 3b __ ROL ACCU + 0 
21bc : 26 3c __ ROL ACCU + 1 
21be : a4 22 __ LDY $22 
21c0 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
21c1 : 24 3c __ BIT ACCU + 1 
21c3 : 10 0d __ BPL $21d2 ; (mods16 + 17)
21c5 : 20 20 21 JSR $2120 ; (negaccu + 0)
21c8 : 24 24 __ BIT WORK + 1 
21ca : 10 0d __ BPL $21d9 ; (mods16 + 24)
21cc : 20 2e 21 JSR $212e ; (negtmp + 0)
21cf : 4c 3c 21 JMP $213c ; (divmod + 0)
21d2 : 24 24 __ BIT WORK + 1 
21d4 : 10 f9 __ BPL $21cf ; (mods16 + 14)
21d6 : 20 2e 21 JSR $212e ; (negtmp + 0)
21d9 : 20 3c 21 JSR $213c ; (divmod + 0)
21dc : 38 __ __ SEC
21dd : a9 00 __ LDA #$00
21df : e5 25 __ SBC WORK + 2 
21e1 : 85 25 __ STA WORK + 2 
21e3 : a9 00 __ LDA #$00
21e5 : e5 26 __ SBC WORK + 3 
21e7 : 85 26 __ STA WORK + 3 
21e9 : 60 __ __ RTS
