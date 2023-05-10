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
080e : 8e fe 1a STX $1afe ; (spentry + 0)
0811 : a9 00 __ LDA #$00
0813 : 85 39 __ STA IP + 0 
0815 : a9 41 __ LDA #$41
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 45 __ LDA #$45
081c : e9 41 __ SBC #$41
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
0830 : a9 26 __ LDA #$26
0832 : e9 00 __ SBC #$00
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
0853 : 20 80 08 JSR $0880 ; (main.s1000 + 0)
0856 : a9 4c __ LDA #$4c
0858 : 85 54 __ STA $54 
085a : a9 00 __ LDA #$00
085c : 85 13 __ STA $13 
085e : a9 19 __ LDA #$19
0860 : 85 16 __ STA $16 
0862 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1afe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s1000:
0880 : 38 __ __ SEC
0881 : a5 43 __ LDA SP + 0 
0883 : e9 52 __ SBC #$52
0885 : 85 43 __ STA SP + 0 
0887 : a5 44 __ LDA SP + 1 
0889 : e9 00 __ SBC #$00
088b : 85 44 __ STA SP + 1 
088d : a0 00 __ LDY #$00
088f : a5 45 __ LDA FP + 0 
0891 : 91 43 __ STA (SP + 0),y 
0893 : c8 __ __ INY
0894 : a5 46 __ LDA FP + 1 
0896 : 91 43 __ STA (SP + 0),y 
0898 : 18 __ __ CLC
0899 : a5 43 __ LDA SP + 0 
089b : 69 02 __ ADC #$02
089d : 85 45 __ STA FP + 0 
089f : a5 44 __ LDA SP + 1 
08a1 : 69 00 __ ADC #$00
08a3 : 85 46 __ STA FP + 1 
.s0:
08a5 : 20 2f 0c JSR $0c2f ; (zsm_irq_init.s0 + 0)
08a8 : 20 03 0e JSR $0e03 ; (ClearVERAScreen.s0 + 0)
08ab : 20 46 0e JSR $0e46 ; (SetUpSprites.s0 + 0)
08ae : ad 25 9f LDA $9f25 
08b1 : 09 02 __ ORA #$02
08b3 : 8d 25 9f STA $9f25 
08b6 : a9 9f __ LDA #$9f
08b8 : 8d 2a 9f STA $9f2a 
08bb : ad 25 9f LDA $9f25 
08be : 29 fd __ AND #$fd
08c0 : 8d 25 9f STA $9f25 
08c3 : a9 21 __ LDA #$21
08c5 : 8d 22 9f STA $9f22 
08c8 : a9 00 __ LDA #$00
08ca : 8d 20 9f STA $9f20 
08cd : a9 b0 __ LDA #$b0
08cf : 8d 21 9f STA $9f21 
08d2 : a9 73 __ LDA #$73
08d4 : 8d 39 9f STA $9f39 
08d7 : a9 00 __ LDA #$00
08d9 : 8d 3a 9f STA $9f3a 
08dc : 8d 20 9f STA $9f20 
08df : 8d 21 9f STA $9f21 
08e2 : a8 __ __ TAY
08e3 : 91 45 __ STA (FP + 0),y 
08e5 : c8 __ __ INY
08e6 : 91 45 __ STA (FP + 0),y 
08e8 : a9 28 __ LDA #$28
08ea : c8 __ __ INY
08eb : 91 45 __ STA (FP + 0),y 
08ed : a9 00 __ LDA #$00
08ef : c8 __ __ INY
08f0 : 91 45 __ STA (FP + 0),y 
08f2 : a9 20 __ LDA #$20
08f4 : c8 __ __ INY
08f5 : 91 45 __ STA (FP + 0),y 
08f7 : a9 00 __ LDA #$00
08f9 : c8 __ __ INY
08fa : 91 45 __ STA (FP + 0),y 
08fc : a9 10 __ LDA #$10
08fe : c8 __ __ INY
08ff : 91 45 __ STA (FP + 0),y 
0901 : a9 00 __ LDA #$00
0903 : c8 __ __ INY
0904 : 91 45 __ STA (FP + 0),y 
0906 : a9 20 __ LDA #$20
0908 : c8 __ __ INY
0909 : 91 45 __ STA (FP + 0),y 
090b : a9 00 __ LDA #$00
090d : c8 __ __ INY
090e : 91 45 __ STA (FP + 0),y 
0910 : c8 __ __ INY
0911 : 91 45 __ STA (FP + 0),y 
0913 : c8 __ __ INY
0914 : 91 45 __ STA (FP + 0),y 
0916 : a9 60 __ LDA #$60
0918 : c8 __ __ INY
0919 : 91 45 __ STA (FP + 0),y 
091b : a9 00 __ LDA #$00
091d : c8 __ __ INY
091e : 91 45 __ STA (FP + 0),y 
0920 : a9 20 __ LDA #$20
0922 : c8 __ __ INY
0923 : 91 45 __ STA (FP + 0),y 
0925 : a9 00 __ LDA #$00
0927 : c8 __ __ INY
0928 : 91 45 __ STA (FP + 0),y 
092a : a9 10 __ LDA #$10
092c : a8 __ __ TAY
092d : 91 45 __ STA (FP + 0),y 
092f : a9 00 __ LDA #$00
0931 : c8 __ __ INY
0932 : 91 45 __ STA (FP + 0),y 
0934 : a9 20 __ LDA #$20
0936 : c8 __ __ INY
0937 : 91 45 __ STA (FP + 0),y 
0939 : a9 00 __ LDA #$00
093b : c8 __ __ INY
093c : 91 45 __ STA (FP + 0),y 
093e : 85 51 __ STA T1 + 0 
0940 : 85 52 __ STA T1 + 1 
0942 : 85 53 __ STA T2 + 0 
0944 : 85 54 __ STA T3 + 0 
.l2:
0946 : 20 a9 18 JSR $18a9 ; (getchx.s0 + 0)
0949 : a5 3b __ LDA ACCU + 0 
094b : 85 55 __ STA T4 + 0 
094d : a9 30 __ LDA #$30
094f : 8d 2c 9f STA $9f2c 
0952 : ee f4 1d INC $1df4 ; (p + 0)
0955 : d0 03 __ BNE $095a ; (main.s1026 + 0)
.s1025:
0957 : ee f5 1d INC $1df5 ; (p + 1)
.s1026:
095a : ad f6 1d LDA $1df6 ; (Phase + 0)
095d : 18 __ __ CLC
095e : 69 01 __ ADC #$01
0960 : 85 32 __ STA P5 
0962 : 8d f6 1d STA $1df6 ; (Phase + 0)
0965 : ad f7 1d LDA $1df7 ; (Phase + 1)
0968 : 69 00 __ ADC #$00
096a : 85 33 __ STA P6 
096c : 8d f7 1d STA $1df7 ; (Phase + 1)
096f : ad f8 1d LDA $1df8 ; (Phase2 + 0)
0972 : 18 __ __ CLC
0973 : 69 01 __ ADC #$01
0975 : 85 34 __ STA P7 
0977 : 8d f8 1d STA $1df8 ; (Phase2 + 0)
097a : ad f9 1d LDA $1df9 ; (Phase2 + 1)
097d : 69 00 __ ADC #$00
097f : 85 35 __ STA P8 
0981 : 8d f9 1d STA $1df9 ; (Phase2 + 1)
0984 : 20 e4 18 JSR $18e4 ; (MoveSprites.s0 + 0)
0987 : e6 54 __ INC T3 + 0 
0989 : a5 53 __ LDA T2 + 0 
098b : f0 03 __ BEQ $0990 ; (main.s5 + 0)
098d : 4c 16 0c JMP $0c16 ; (main.s4 + 0)
.s5:
0990 : 8d fb 1d STA $1dfb ; (PalTimer + 0)
0993 : 8d fc 1d STA $1dfc ; (PalTimer + 1)
0996 : a9 20 __ LDA #$20
0998 : 85 37 __ STA P10 
099a : a9 a0 __ LDA #$a0
099c : 8d fc 9e STA $9efc ; (sstack + 0)
099f : a9 fa __ LDA #$fa
09a1 : 8d fd 9e STA $9efd ; (sstack + 1)
09a4 : a9 01 __ LDA #$01
09a6 : 8d fe 9e STA $9efe ; (sstack + 2)
09a9 : a9 00 __ LDA #$00
09ab : 8d ff 9e STA $9eff ; (sstack + 3)
09ae : a9 40 __ LDA #$40
09b0 : 85 35 __ STA P8 
09b2 : a9 3f __ LDA #$3f
09b4 : 85 36 __ STA P9 
09b6 : 20 82 18 JSR $1882 ; (SetPaletteColours.s0 + 0)
.s1022:
09b9 : a9 02 __ LDA #$02
09bb : c5 54 __ CMP T3 + 0 
09bd : 90 03 __ BCC $09c2 ; (main.s10 + 0)
09bf : 4c 68 0a JMP $0a68 ; (main.s12 + 0)
.s10:
09c2 : a9 10 __ LDA #$10
09c4 : 85 34 __ STA P7 
09c6 : a9 00 __ LDA #$00
09c8 : 85 35 __ STA P8 
09ca : 85 36 __ STA P9 
09cc : 85 37 __ STA P10 
09ce : a9 06 __ LDA #$06
09d0 : 8d fc 9e STA $9efc ; (sstack + 0)
09d3 : a9 00 __ LDA #$00
09d5 : 8d fd 9e STA $9efd ; (sstack + 1)
09d8 : 8d ff 9e STA $9eff ; (sstack + 3)
09db : a9 0a __ LDA #$0a
09dd : 8d fe 9e STA $9efe ; (sstack + 2)
09e0 : a9 87 __ LDA #$87
09e2 : 85 32 __ STA P5 
09e4 : a9 1d __ LDA #$1d
09e6 : 85 33 __ STA P6 
09e8 : 20 43 1b JSR $1b43 ; (SetPaletteIndex.s0 + 0)
09eb : a2 00 __ LDX #$00
09ed : 86 54 __ STX T3 + 0 
.l14:
09ef : bd 7b 1d LDA $1d7b,x ; (__multab10L + 0)
09f2 : 18 __ __ CLC
09f3 : 69 02 __ ADC #$02
09f5 : a8 __ __ TAY
09f6 : b1 45 __ LDA (FP + 0),y 
09f8 : 85 3b __ STA ACCU + 0 
09fa : c8 __ __ INY
09fb : b1 45 __ LDA (FP + 0),y 
09fd : 85 4b __ STA T7 + 1 
09ff : bd 7b 1d LDA $1d7b,x ; (__multab10L + 0)
0a02 : 18 __ __ CLC
0a03 : 69 04 __ ADC #$04
0a05 : a8 __ __ TAY
0a06 : ad 2e 9f LDA $9f2e 
0a09 : 0a __ __ ASL
0a0a : 85 57 __ STA T10 + 1 
0a0c : b1 45 __ LDA (FP + 0),y 
0a0e : 85 4d __ STA T8 + 1 
0a10 : a9 00 __ LDA #$00
0a12 : 2a __ __ ROL
0a13 : 85 58 __ STA T10 + 2 
0a15 : c8 __ __ INY
0a16 : b1 45 __ LDA (FP + 0),y 
0a18 : 4a __ __ LSR
0a19 : 66 4d __ ROR T8 + 1 
0a1b : a9 00 __ LDA #$00
0a1d : 6a __ __ ROR
0a1e : 65 3b __ ADC ACCU + 0 
0a20 : 85 56 __ STA T10 + 0 
0a22 : a5 4d __ LDA T8 + 1 
0a24 : 65 4b __ ADC T7 + 1 
0a26 : 18 __ __ CLC
0a27 : 65 57 __ ADC T10 + 1 
0a29 : 85 57 __ STA T10 + 1 
0a2b : 90 02 __ BCC $0a2f ; (main.s1030 + 0)
.s1029:
0a2d : e6 58 __ INC T10 + 2 
.s1030:
0a2f : bc 7b 1d LDY $1d7b,x ; (__multab10L + 0)
0a32 : b1 45 __ LDA (FP + 0),y 
0a34 : 85 3b __ STA ACCU + 0 
0a36 : c8 __ __ INY
0a37 : b1 45 __ LDA (FP + 0),y 
0a39 : 85 3c __ STA ACCU + 1 
0a3b : 05 3b __ ORA ACCU + 0 
0a3d : d0 24 __ BNE $0a63 ; (main.s15 + 0)
.s18:
0a3f : a9 00 __ LDA #$00
0a41 : 85 4e __ STA T9 + 0 
.l19:
0a43 : bd 7b 1d LDA $1d7b,x ; (__multab10L + 0)
0a46 : 85 4a __ STA T7 + 0 
0a48 : 18 __ __ CLC
0a49 : 69 08 __ ADC #$08
0a4b : a8 __ __ TAY
0a4c : b1 45 __ LDA (FP + 0),y 
0a4e : 85 3b __ STA ACCU + 0 
0a50 : c8 __ __ INY
0a51 : b1 45 __ LDA (FP + 0),y 
0a53 : f0 03 __ BEQ $0a58 ; (main.s1020 + 0)
0a55 : 4c ba 0b JMP $0bba ; (main.s20 + 0)
.s1020:
0a58 : 85 3c __ STA ACCU + 1 
0a5a : a5 4e __ LDA T9 + 0 
0a5c : c5 3b __ CMP ACCU + 0 
0a5e : b0 03 __ BCS $0a63 ; (main.s15 + 0)
0a60 : 4c ba 0b JMP $0bba ; (main.s20 + 0)
.s15:
0a63 : e8 __ __ INX
0a64 : e0 08 __ CPX #$08
0a66 : 90 87 __ BCC $09ef ; (main.l14 + 0)
.s12:
0a68 : ad fc 1d LDA $1dfc ; (PalTimer + 1)
0a6b : 30 5f __ BMI $0acc ; (main.s93 + 0)
.s1015:
0a6d : d0 07 __ BNE $0a76 ; (main.s31 + 0)
.s1014:
0a6f : a9 03 __ LDA #$03
0a71 : cd fb 1d CMP $1dfb ; (PalTimer + 0)
0a74 : b0 56 __ BCS $0acc ; (main.s93 + 0)
.s31:
0a76 : a9 60 __ LDA #$60
0a78 : 85 34 __ STA P7 
0a7a : a9 00 __ LDA #$00
0a7c : 85 35 __ STA P8 
0a7e : 85 36 __ STA P9 
0a80 : 85 37 __ STA P10 
0a82 : 8d fc 9e STA $9efc ; (sstack + 0)
0a85 : 8d fd 9e STA $9efd ; (sstack + 1)
0a88 : a9 05 __ LDA #$05
0a8a : 8d fe 9e STA $9efe ; (sstack + 2)
0a8d : a9 00 __ LDA #$00
0a8f : 8d ff 9e STA $9eff ; (sstack + 3)
0a92 : ee fd 1d INC $1dfd ; (PalIndex + 0)
0a95 : d0 03 __ BNE $0a9a ; (main.s1034 + 0)
.s1033:
0a97 : ee fe 1d INC $1dfe ; (PalIndex + 1)
.s1034:
0a9a : a9 e7 __ LDA #$e7
0a9c : 85 32 __ STA P5 
0a9e : a9 1d __ LDA #$1d
0aa0 : 85 33 __ STA P6 
0aa2 : 20 43 1b JSR $1b43 ; (SetPaletteIndex.s0 + 0)
0aa5 : a9 50 __ LDA #$50
0aa7 : 85 34 __ STA P7 
0aa9 : a9 00 __ LDA #$00
0aab : 8d fc 9e STA $9efc ; (sstack + 0)
0aae : 8d fd 9e STA $9efd ; (sstack + 1)
0ab1 : 8d ff 9e STA $9eff ; (sstack + 3)
0ab4 : a9 10 __ LDA #$10
0ab6 : 8d fe 9e STA $9efe ; (sstack + 2)
0ab9 : a9 60 __ LDA #$60
0abb : 85 32 __ STA P5 
0abd : a9 3f __ LDA #$3f
0abf : 85 33 __ STA P6 
0ac1 : 20 43 1b JSR $1b43 ; (SetPaletteIndex.s0 + 0)
0ac4 : a9 00 __ LDA #$00
0ac6 : 8d fb 1d STA $1dfb ; (PalTimer + 0)
0ac9 : 8d fc 1d STA $1dfc ; (PalTimer + 1)
.s93:
0acc : ad f5 1d LDA $1df5 ; (p + 1)
0acf : d0 42 __ BNE $0b13 ; (main.s36 + 0)
.s1013:
0ad1 : ad f4 1d LDA $1df4 ; (p + 0)
0ad4 : c9 03 __ CMP #$03
0ad6 : d0 3b __ BNE $0b13 ; (main.s36 + 0)
.s34:
0ad8 : a9 20 __ LDA #$20
0ada : 85 37 __ STA P10 
0adc : a9 00 __ LDA #$00
0ade : 8d fc 9e STA $9efc ; (sstack + 0)
0ae1 : 8d ff 9e STA $9eff ; (sstack + 3)
0ae4 : a9 fa __ LDA #$fa
0ae6 : 8d fd 9e STA $9efd ; (sstack + 1)
0ae9 : a9 01 __ LDA #$01
0aeb : 8d fe 9e STA $9efe ; (sstack + 2)
0aee : a9 00 __ LDA #$00
0af0 : cd ff 1d CMP $1dff ; (ShimmerState + 0)
0af3 : 2a __ __ ROL
0af4 : 8d ff 1d STA $1dff ; (ShimmerState + 0)
0af7 : d0 07 __ BNE $0b00 ; (main.s37 + 0)
.s38:
0af9 : a9 3f __ LDA #$3f
0afb : a2 a0 __ LDX #$a0
0afd : 4c 04 0b JMP $0b04 ; (main.s101 + 0)
.s37:
0b00 : a9 3f __ LDA #$3f
0b02 : a2 80 __ LDX #$80
.s101:
0b04 : 86 35 __ STX P8 
0b06 : 85 36 __ STA P9 
0b08 : 20 82 18 JSR $1882 ; (SetPaletteColours.s0 + 0)
0b0b : a9 00 __ LDA #$00
0b0d : 8d f4 1d STA $1df4 ; (p + 0)
0b10 : 8d f5 1d STA $1df5 ; (p + 1)
.s36:
0b13 : a9 03 __ LDA #$03
0b15 : 8d 2c 9f STA $9f2c 
0b18 : a5 53 __ LDA T2 + 0 
0b1a : 85 30 __ STA P3 
0b1c : a5 55 __ LDA T4 + 0 
0b1e : 85 31 __ STA P4 
0b20 : c9 44 __ CMP #$44
0b22 : d0 0e __ BNE $0b32 ; (main.s41 + 0)
.s40:
0b24 : 18 __ __ CLC
0b25 : a5 51 __ LDA T1 + 0 
0b27 : 69 01 __ ADC #$01
0b29 : 85 51 __ STA T1 + 0 
0b2b : a5 52 __ LDA T1 + 1 
0b2d : 69 00 __ ADC #$00
0b2f : 4c 49 0b JMP $0b49 ; (main.s1023 + 0)
.s41:
0b32 : c9 41 __ CMP #$41
0b34 : d0 15 __ BNE $0b4b ; (main.s42 + 0)
.s46:
0b36 : a5 52 __ LDA T1 + 1 
0b38 : 30 11 __ BMI $0b4b ; (main.s42 + 0)
.s1005:
0b3a : 05 51 __ ORA T1 + 0 
0b3c : f0 0d __ BEQ $0b4b ; (main.s42 + 0)
.s43:
0b3e : 18 __ __ CLC
0b3f : a5 51 __ LDA T1 + 0 
0b41 : 69 ff __ ADC #$ff
0b43 : 85 51 __ STA T1 + 0 
0b45 : a5 52 __ LDA T1 + 1 
0b47 : 69 ff __ ADC #$ff
.s1023:
0b49 : 85 52 __ STA T1 + 1 
.s42:
0b4b : 20 f6 1b JSR $1bf6 ; (Control.s0 + 0)
0b4e : a5 3b __ LDA ACCU + 0 
0b50 : 85 53 __ STA T2 + 0 
0b52 : ad c1 3f LDA $3fc1 ; (FrameCount + 0)
0b55 : 85 55 __ STA T4 + 0 
0b57 : 85 3b __ STA ACCU + 0 
0b59 : ad c2 3f LDA $3fc2 ; (FrameCount + 1)
0b5c : 85 3c __ STA ACCU + 1 
0b5e : a9 04 __ LDA #$04
0b60 : 85 23 __ STA WORK + 0 
0b62 : a9 00 __ LDA #$00
0b64 : 85 24 __ STA WORK + 1 
0b66 : 20 52 1d JSR $1d52 ; (mods16 + 0)
0b69 : a5 26 __ LDA WORK + 3 
0b6b : d0 1e __ BNE $0b8b ; (main.s49 + 0)
.s1004:
0b6d : a5 25 __ LDA WORK + 2 
0b6f : c9 01 __ CMP #$01
0b71 : d0 18 __ BNE $0b8b ; (main.s49 + 0)
.s47:
0b73 : ad 25 45 LDA $4525 ; (off1 + 0)
0b76 : 18 __ __ CLC
0b77 : 69 01 __ ADC #$01
0b79 : aa __ __ TAX
0b7a : ac 25 45 LDY $4525 ; (off1 + 0)
0b7d : c0 3b __ CPY #$3b
0b7f : b0 07 __ BCS $0b88 ; (main.s102 + 0)
.s50:
0b81 : b9 c3 3f LDA $3fc3,y ; (TestText2 + 0)
0b84 : 8d 23 9f STA $9f23 
0b87 : 8a __ __ TXA
.s102:
0b88 : 8d 25 45 STA $4525 ; (off1 + 0)
.s49:
0b8b : 06 55 __ ASL T4 + 0 
0b8d : ad c2 3f LDA $3fc2 ; (FrameCount + 1)
0b90 : 2a __ __ ROL
0b91 : 18 __ __ CLC
0b92 : 69 ff __ ADC #$ff
0b94 : 8d 38 9f STA $9f38 
0b97 : a5 55 __ LDA T4 + 0 
0b99 : 8d 37 9f STA $9f37 
0b9c : a9 01 __ LDA #$01
0b9e : 8d 2c 9f STA $9f2c 
0ba1 : 20 fa 19 JSR $19fa ; (zsm_fill.s0 + 0)
0ba4 : a9 00 __ LDA #$00
0ba6 : 8d 2c 9f STA $9f2c 
0ba9 : 20 a2 1c JSR $1ca2 ; (frame_wait.l1 + 0)
0bac : ee c1 3f INC $3fc1 ; (FrameCount + 0)
0baf : f0 03 __ BEQ $0bb4 ; (main.s1035 + 0)
0bb1 : 4c 46 09 JMP $0946 ; (main.l2 + 0)
.s1035:
0bb4 : ee c2 3f INC $3fc2 ; (FrameCount + 1)
0bb7 : 4c 46 09 JMP $0946 ; (main.l2 + 0)
.s20:
0bba : ad 25 9f LDA $9f25 
0bbd : 29 fe __ AND #$fe
0bbf : 8d 25 9f STA $9f25 
0bc2 : 18 __ __ CLC
0bc3 : a5 56 __ LDA T10 + 0 
0bc5 : 69 01 __ ADC #$01
0bc7 : 8d 20 9f STA $9f20 
0bca : a5 57 __ LDA T10 + 1 
0bcc : 69 00 __ ADC #$00
0bce : 8d 21 9f STA $9f21 
0bd1 : a5 58 __ LDA T10 + 2 
0bd3 : 69 00 __ ADC #$00
0bd5 : 29 01 __ AND #$01
0bd7 : 09 20 __ ORA #$20
0bd9 : 8d 22 9f STA $9f22 
0bdc : a9 00 __ LDA #$00
0bde : 85 4f __ STA T12 + 0 
.l24:
0be0 : 18 __ __ CLC
0be1 : a5 4a __ LDA T7 + 0 
0be3 : 69 06 __ ADC #$06
0be5 : a8 __ __ TAY
0be6 : b1 45 __ LDA (FP + 0),y 
0be8 : 85 4c __ STA T8 + 0 
0bea : a9 00 __ LDA #$00
0bec : c8 __ __ INY
0bed : d1 45 __ CMP (FP + 0),y 
0bef : d0 06 __ BNE $0bf7 ; (main.s25 + 0)
.s1018:
0bf1 : a5 4f __ LDA T12 + 0 
0bf3 : c5 4c __ CMP T8 + 0 
0bf5 : b0 0a __ BCS $0c01 ; (main.s27 + 0)
.s25:
0bf7 : a9 10 __ LDA #$10
0bf9 : 8d 23 9f STA $9f23 
0bfc : e6 4f __ INC T12 + 0 
0bfe : 4c e0 0b JMP $0be0 ; (main.l24 + 0)
.s27:
0c01 : a5 56 __ LDA T10 + 0 
0c03 : 69 7f __ ADC #$7f
0c05 : 85 56 __ STA T10 + 0 
0c07 : a5 57 __ LDA T10 + 1 
0c09 : 69 00 __ ADC #$00
0c0b : 85 57 __ STA T10 + 1 
0c0d : 90 02 __ BCC $0c11 ; (main.s1032 + 0)
.s1031:
0c0f : e6 58 __ INC T10 + 2 
.s1032:
0c11 : e6 4e __ INC T9 + 0 
0c13 : 4c 43 0a JMP $0a43 ; (main.l19 + 0)
.s4:
0c16 : a5 51 __ LDA T1 + 0 
0c18 : 85 32 __ STA P5 
0c1a : a5 52 __ LDA T1 + 1 
0c1c : 85 33 __ STA P6 
0c1e : 20 26 19 JSR $1926 ; (PlayZSM.s0 + 0)
0c21 : ee fb 1d INC $1dfb ; (PalTimer + 0)
0c24 : f0 03 __ BEQ $0c29 ; (main.s1027 + 0)
0c26 : 4c b9 09 JMP $09b9 ; (main.s1022 + 0)
.s1027:
0c29 : ee fc 1d INC $1dfc ; (PalTimer + 1)
0c2c : 4c b9 09 JMP $09b9 ; (main.s1022 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0c2f : 78 __ __ SEI
0c30 : ad 14 03 LDA $0314 
0c33 : 8d fe 3f STA $3ffe ; (oirq + 0)
0c36 : ad 15 03 LDA $0315 
0c39 : 8d ff 3f STA $3fff ; (oirq + 1)
0c3c : a9 48 __ LDA #$48
0c3e : 8d 14 03 STA $0314 
0c41 : a9 0c __ LDA #$0c
0c43 : 8d 15 03 STA $0315 
0c46 : 58 __ __ CLI
.s1001:
0c47 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
3ffe : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c48 : 20 4e 0c JSR $0c4e ; (irq.s1000 + 0)
0c4b : 6c fe 3f JMP ($3ffe)
--------------------------------------------------------------------
irq:
.s1000:
0c4e : a5 2d __ LDA P0 
0c50 : 48 __ __ PHA
0c51 : a5 2e __ LDA P1 
0c53 : 48 __ __ PHA
0c54 : a5 3b __ LDA ACCU + 0 
0c56 : 48 __ __ PHA
0c57 : a5 3c __ LDA ACCU + 1 
0c59 : 48 __ __ PHA
0c5a : a5 47 __ LDA T0 + 0 
0c5c : 48 __ __ PHA
0c5d : a5 48 __ LDA $48 
0c5f : 48 __ __ PHA
0c60 : a5 49 __ LDA $49 
0c62 : 48 __ __ PHA
0c63 : a5 4a __ LDA $4a 
0c65 : 48 __ __ PHA
0c66 : a5 4b __ LDA $4b 
0c68 : 48 __ __ PHA
0c69 : a5 4c __ LDA $4c 
0c6b : 48 __ __ PHA
0c6c : a5 4d __ LDA $4d 
0c6e : 48 __ __ PHA
0c6f : a5 4e __ LDA $4e 
0c71 : 48 __ __ PHA
0c72 : a5 4f __ LDA $4f 
0c74 : 48 __ __ PHA
0c75 : a5 50 __ LDA $50 
0c77 : 48 __ __ PHA
.s0:
0c78 : ad ff 1a LDA $1aff ; (zsm_playing + 0)
0c7b : f0 08 __ BEQ $0c85 ; (irq.s1001 + 0)
.s4:
0c7d : ad 83 1d LDA $1d83 ; (zsm_finished + 0)
0c80 : d0 03 __ BNE $0c85 ; (irq.s1001 + 0)
.s1:
0c82 : 20 b0 0c JSR $0cb0 ; (zsm_play.s0 + 0)
.s1001:
0c85 : 68 __ __ PLA
0c86 : 85 50 __ STA $50 
0c88 : 68 __ __ PLA
0c89 : 85 4f __ STA $4f 
0c8b : 68 __ __ PLA
0c8c : 85 4e __ STA $4e 
0c8e : 68 __ __ PLA
0c8f : 85 4d __ STA $4d 
0c91 : 68 __ __ PLA
0c92 : 85 4c __ STA $4c 
0c94 : 68 __ __ PLA
0c95 : 85 4b __ STA $4b 
0c97 : 68 __ __ PLA
0c98 : 85 4a __ STA $4a 
0c9a : 68 __ __ PLA
0c9b : 85 49 __ STA $49 
0c9d : 68 __ __ PLA
0c9e : 85 48 __ STA $48 
0ca0 : 68 __ __ PLA
0ca1 : 85 47 __ STA T0 + 0 
0ca3 : 68 __ __ PLA
0ca4 : 85 3c __ STA ACCU + 1 
0ca6 : 68 __ __ PLA
0ca7 : 85 3b __ STA ACCU + 0 
0ca9 : 68 __ __ PLA
0caa : 85 2e __ STA P1 
0cac : 68 __ __ PLA
0cad : 85 2d __ STA P0 
0caf : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1d83 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0cb0 : ad 84 1d LDA $1d84 ; (zsm_paused + 0)
0cb3 : f0 01 __ BEQ $0cb6 ; (zsm_play.s2 + 0)
0cb5 : 60 __ __ RTS
.s2:
0cb6 : ad 00 41 LDA $4100 ; (zsm_delay + 0)
0cb9 : f0 03 __ BEQ $0cbe ; (zsm_play.s5 + 0)
0cbb : 4c eb 0d JMP $0deb ; (zsm_play.s4 + 0)
.s5:
0cbe : ad 25 9f LDA $9f25 
0cc1 : 85 47 __ STA T0 + 0 
0cc3 : ad 25 9f LDA $9f25 
0cc6 : 29 fe __ AND #$fe
0cc8 : 8d 25 9f STA $9f25 
0ccb : ad 20 9f LDA $9f20 
0cce : 85 49 __ STA T2 + 0 
0cd0 : ad 21 9f LDA $9f21 
0cd3 : 85 4a __ STA T2 + 1 
0cd5 : ad 22 9f LDA $9f22 
0cd8 : 85 48 __ STA T1 + 0 
.l8:
0cda : ad 01 45 LDA $4501 ; (zsm_pos + 0)
0cdd : 85 4b __ STA T3 + 0 
0cdf : 18 __ __ CLC
0ce0 : 69 01 __ ADC #$01
0ce2 : 85 4d __ STA T4 + 0 
0ce4 : 8d 01 45 STA $4501 ; (zsm_pos + 0)
0ce7 : ad 02 45 LDA $4502 ; (zsm_pos + 1)
0cea : aa __ __ TAX
0ceb : 69 00 __ ADC #$00
0ced : 85 4e __ STA T4 + 1 
0cef : 8d 02 45 STA $4502 ; (zsm_pos + 1)
0cf2 : 18 __ __ CLC
0cf3 : a9 01 __ LDA #$01
0cf5 : 65 4b __ ADC T3 + 0 
0cf7 : 85 3b __ STA ACCU + 0 
0cf9 : 8a __ __ TXA
0cfa : 29 03 __ AND #$03
0cfc : 69 41 __ ADC #$41
0cfe : 85 3c __ STA ACCU + 1 
0d00 : a0 00 __ LDY #$00
0d02 : b1 3b __ LDA (ACCU + 0),y 
0d04 : c9 40 __ CMP #$40
0d06 : b0 03 __ BCS $0d0b ; (zsm_play.s12 + 0)
0d08 : 4c b6 0d JMP $0db6 ; (zsm_play.s11 + 0)
.s12:
0d0b : d0 22 __ BNE $0d2f ; (zsm_play.s15 + 0)
.s14:
0d0d : 18 __ __ CLC
0d0e : a9 01 __ LDA #$01
0d10 : 65 4d __ ADC T4 + 0 
0d12 : 85 4b __ STA T3 + 0 
0d14 : a5 4e __ LDA T4 + 1 
0d16 : 29 03 __ AND #$03
0d18 : 69 41 __ ADC #$41
0d1a : 85 4c __ STA T3 + 1 
0d1c : b1 4b __ LDA (T3 + 0),y 
0d1e : 29 3f __ AND #$3f
0d20 : 18 __ __ CLC
0d21 : 65 4d __ ADC T4 + 0 
0d23 : 8d 01 45 STA $4501 ; (zsm_pos + 0)
0d26 : 98 __ __ TYA
0d27 : 65 4e __ ADC T4 + 1 
0d29 : 8d 02 45 STA $4502 ; (zsm_pos + 1)
0d2c : 4c da 0c JMP $0cda ; (zsm_play.l8 + 0)
.s15:
0d2f : 09 00 __ ORA #$00
0d31 : 30 5b __ BMI $0d8e ; (zsm_play.s18 + 0)
.s17:
0d33 : 84 50 __ STY T7 + 0 
0d35 : 29 3f __ AND #$3f
0d37 : f0 a1 __ BEQ $0cda ; (zsm_play.l8 + 0)
.s21:
0d39 : 85 4f __ STA T6 + 0 
0d3b : 18 __ __ CLC
.l1012:
0d3c : a9 01 __ LDA #$01
0d3e : 6d 01 45 ADC $4501 ; (zsm_pos + 0)
0d41 : 85 4d __ STA T4 + 0 
0d43 : ad 02 45 LDA $4502 ; (zsm_pos + 1)
0d46 : 29 03 __ AND #$03
0d48 : 69 41 __ ADC #$41
0d4a : 85 4e __ STA T4 + 1 
0d4c : a0 00 __ LDY #$00
0d4e : b1 4d __ LDA (T4 + 0),y 
0d50 : 85 2d __ STA P0 
0d52 : ad 01 45 LDA $4501 ; (zsm_pos + 0)
0d55 : 18 __ __ CLC
0d56 : 69 01 __ ADC #$01
0d58 : aa __ __ TAX
0d59 : ad 02 45 LDA $4502 ; (zsm_pos + 1)
0d5c : 69 00 __ ADC #$00
0d5e : 29 03 __ AND #$03
0d60 : 85 4c __ STA T3 + 1 
0d62 : 8a __ __ TXA
0d63 : 18 __ __ CLC
0d64 : 69 01 __ ADC #$01
0d66 : 85 4b __ STA T3 + 0 
0d68 : a9 41 __ LDA #$41
0d6a : 65 4c __ ADC T3 + 1 
0d6c : 85 4c __ STA T3 + 1 
0d6e : b1 4b __ LDA (T3 + 0),y 
0d70 : 85 2e __ STA P1 
0d72 : 20 ef 0d JSR $0def ; (sfx_put.l1 + 0)
0d75 : ad 01 45 LDA $4501 ; (zsm_pos + 0)
0d78 : 18 __ __ CLC
0d79 : 69 02 __ ADC #$02
0d7b : 8d 01 45 STA $4501 ; (zsm_pos + 0)
0d7e : 90 03 __ BCC $0d83 ; (zsm_play.s1015 + 0)
.s1014:
0d80 : ee 02 45 INC $4502 ; (zsm_pos + 1)
.s1015:
0d83 : e6 50 __ INC T7 + 0 
0d85 : a5 50 __ LDA T7 + 0 
0d87 : c5 4f __ CMP T6 + 0 
0d89 : 90 b1 __ BCC $0d3c ; (zsm_play.l1012 + 0)
0d8b : 4c da 0c JMP $0cda ; (zsm_play.l8 + 0)
.s18:
0d8e : c9 80 __ CMP #$80
0d90 : d0 07 __ BNE $0d99 ; (zsm_play.s25 + 0)
.s24:
0d92 : a9 01 __ LDA #$01
0d94 : 8d 83 1d STA $1d83 ; (zsm_finished + 0)
0d97 : d0 08 __ BNE $0da1 ; (zsm_play.s10 + 0)
.s25:
0d99 : 29 7f __ AND #$7f
0d9b : 38 __ __ SEC
0d9c : e9 01 __ SBC #$01
0d9e : 8d 00 41 STA $4100 ; (zsm_delay + 0)
.s10:
0da1 : a5 49 __ LDA T2 + 0 
0da3 : 8d 20 9f STA $9f20 
0da6 : a5 4a __ LDA T2 + 1 
0da8 : 8d 21 9f STA $9f21 
0dab : a5 48 __ LDA T1 + 0 
0dad : 8d 22 9f STA $9f22 
0db0 : a5 47 __ LDA T0 + 0 
0db2 : 8d 25 9f STA $9f25 
.s1001:
0db5 : 60 __ __ RTS
.s11:
0db6 : 29 3f __ AND #$3f
0db8 : 09 c0 __ ORA #$c0
0dba : 8d 20 9f STA $9f20 
0dbd : a9 f9 __ LDA #$f9
0dbf : 8d 21 9f STA $9f21 
0dc2 : a9 01 __ LDA #$01
0dc4 : 8d 22 9f STA $9f22 
0dc7 : a5 4b __ LDA T3 + 0 
0dc9 : 69 02 __ ADC #$02
0dcb : 8d 01 45 STA $4501 ; (zsm_pos + 0)
0dce : 90 01 __ BCC $0dd1 ; (zsm_play.s1017 + 0)
.s1016:
0dd0 : e8 __ __ INX
.s1017:
0dd1 : 8e 02 45 STX $4502 ; (zsm_pos + 1)
0dd4 : 18 __ __ CLC
0dd5 : a9 01 __ LDA #$01
0dd7 : 65 4d __ ADC T4 + 0 
0dd9 : 85 4b __ STA T3 + 0 
0ddb : a5 4e __ LDA T4 + 1 
0ddd : 29 03 __ AND #$03
0ddf : 69 41 __ ADC #$41
0de1 : 85 4c __ STA T3 + 1 
0de3 : b1 4b __ LDA (T3 + 0),y 
0de5 : 8d 23 9f STA $9f23 
0de8 : 4c da 0c JMP $0cda ; (zsm_play.l8 + 0)
.s4:
0deb : ce 00 41 DEC $4100 ; (zsm_delay + 0)
0dee : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1d84 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
4100 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
4101 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
4501 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0def : ad 41 9f LDA $9f41 
0df2 : 30 fb __ BMI $0def ; (sfx_put.l1 + 0)
.s3:
0df4 : a5 2d __ LDA P0 ; (index + 0)
0df6 : 8d 40 9f STA $9f40 
0df9 : ea __ __ NOP
0dfa : ea __ __ NOP
0dfb : ea __ __ NOP
0dfc : ea __ __ NOP
0dfd : a5 2e __ LDA P1 ; (data + 0)
0dff : 8d 41 9f STA $9f41 
.s1001:
0e02 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0e03 : a9 93 __ LDA #$93
0e05 : 85 2d __ STA P0 
0e07 : a9 00 __ LDA #$00
0e09 : 85 2e __ STA P1 
0e0b : 20 40 0e JSR $0e40 ; (putch.s0 + 0)
0e0e : a9 11 __ LDA #$11
0e10 : 8d 22 9f STA $9f22 
0e13 : a2 00 __ LDX #$00
.l2:
0e15 : 8a __ __ TXA
0e16 : 18 __ __ CLC
0e17 : 69 b0 __ ADC #$b0
0e19 : 8d 21 9f STA $9f21 
0e1c : a9 00 __ LDA #$00
0e1e : 8d 20 9f STA $9f20 
0e21 : a0 80 __ LDY #$80
.l1003:
0e23 : a9 20 __ LDA #$20
0e25 : 8d 23 9f STA $9f23 
0e28 : a9 01 __ LDA #$01
0e2a : 8d 23 9f STA $9f23 
0e2d : a9 20 __ LDA #$20
0e2f : 8d 24 9f STA $9f24 
0e32 : a9 01 __ LDA #$01
0e34 : 8d 24 9f STA $9f24 
0e37 : 88 __ __ DEY
0e38 : d0 e9 __ BNE $0e23 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0e3a : e8 __ __ INX
0e3b : e0 40 __ CPX #$40
0e3d : 90 d6 __ BCC $0e15 ; (ClearVERAScreen.l2 + 0)
.s1001:
0e3f : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0e40 : a5 2d __ LDA P0 
0e42 : 20 d2 ff JSR $ffd2 
.s1001:
0e45 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e46 : a9 00 __ LDA #$00
0e48 : 8d 25 9f STA $9f25 
0e4b : ad 29 9f LDA $9f29 
0e4e : 09 70 __ ORA #$70
0e50 : 8d 29 9f STA $9f29 
0e53 : a9 80 __ LDA #$80
0e55 : 8d 2b 9f STA $9f2b 
0e58 : 8d 2a 9f STA $9f2a 
0e5b : a9 62 __ LDA #$62
0e5d : 8d 2d 9f STA $9f2d 
0e60 : a9 68 __ LDA #$68
0e62 : 8d 34 9f STA $9f34 
0e65 : a9 00 __ LDA #$00
0e67 : 85 2d __ STA P0 
0e69 : 85 2e __ STA P1 
0e6b : 85 2f __ STA P2 
0e6d : 85 30 __ STA P3 
0e6f : 85 31 __ STA P4 
0e71 : 20 c5 16 JSR $16c5 ; (tileBaseConfig.s0 + 0)
0e74 : 8d 2f 9f STA $9f2f 
0e77 : a9 00 __ LDA #$00
0e79 : 85 2d __ STA P0 
0e7b : a9 20 __ LDA #$20
0e7d : 85 2f __ STA P2 
0e7f : 20 dd 16 JSR $16dd ; (memoryToMapMemoryAddress.s0 + 0)
0e82 : 8d 2e 9f STA $9f2e 
0e85 : a9 21 __ LDA #$21
0e87 : 8d 22 9f STA $9f22 
0e8a : a2 80 __ LDX #$80
.l6:
0e8c : a0 50 __ LDY #$50
.l1025:
0e8e : a9 00 __ LDA #$00
0e90 : 8d 24 9f STA $9f24 
0e93 : a9 08 __ LDA #$08
0e95 : 8d 24 9f STA $9f24 
0e98 : 88 __ __ DEY
0e99 : d0 f3 __ BNE $0e8e ; (SetUpSprites.l1025 + 0)
.s1026:
0e9b : ca __ __ DEX
0e9c : d0 ee __ BNE $0e8c ; (SetUpSprites.l6 + 0)
.s4:
0e9e : a9 00 __ LDA #$00
0ea0 : 85 2d __ STA P0 
0ea2 : 85 2e __ STA P1 
0ea4 : 85 2f __ STA P2 
0ea6 : 85 30 __ STA P3 
0ea8 : 85 33 __ STA P6 
0eaa : a9 01 __ LDA #$01
0eac : 85 34 __ STA P7 
0eae : a9 00 __ LDA #$00
0eb0 : 85 31 __ STA P4 
0eb2 : a9 1e __ LDA #$1e
0eb4 : 85 32 __ STA P5 
0eb6 : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
0eb9 : a9 10 __ LDA #$10
0ebb : 8d 22 9f STA $9f22 
0ebe : a9 00 __ LDA #$00
0ec0 : 8d 20 9f STA $9f20 
0ec3 : a9 20 __ LDA #$20
0ec5 : 8d 21 9f STA $9f21 
0ec8 : a9 3c __ LDA #$3c
0eca : 85 47 __ STA T1 + 0 
.l10:
0ecc : a9 00 __ LDA #$00
0ece : 85 48 __ STA T2 + 0 
.l14:
0ed0 : 20 25 17 JSR $1725 ; (rand.s0 + 0)
0ed3 : a5 3b __ LDA ACCU + 0 
0ed5 : 29 1f __ AND #$1f
0ed7 : c9 1f __ CMP #$1f
0ed9 : a5 48 __ LDA T2 + 0 
0edb : 90 03 __ BCC $0ee0 ; (SetUpSprites.s1023 + 0)
0edd : 4c 8f 16 JMP $168f ; (SetUpSprites.s1017 + 0)
.s1023:
0ee0 : c9 09 __ CMP #$09
0ee2 : 90 06 __ BCC $0eea ; (SetUpSprites.s20 + 0)
.s1022:
0ee4 : a9 45 __ LDA #$45
0ee6 : c5 48 __ CMP T2 + 0 
0ee8 : b0 04 __ BCS $0eee ; (SetUpSprites.s1021 + 0)
.s20:
0eea : a9 00 __ LDA #$00
0eec : f0 2f __ BEQ $0f1d ; (SetUpSprites.s174 + 0)
.s1021:
0eee : a5 48 __ LDA T2 + 0 
0ef0 : c9 13 __ CMP #$13
0ef2 : 90 06 __ BCC $0efa ; (SetUpSprites.s24 + 0)
.s1020:
0ef4 : a9 3b __ LDA #$3b
0ef6 : c5 48 __ CMP T2 + 0 
0ef8 : b0 04 __ BCS $0efe ; (SetUpSprites.s1019 + 0)
.s24:
0efa : a9 01 __ LDA #$01
0efc : d0 12 __ BNE $0f10 ; (SetUpSprites.s184 + 0)
.s1019:
0efe : a5 48 __ LDA T2 + 0 
0f00 : c9 1d __ CMP #$1d
0f02 : 90 06 __ BCC $0f0a ; (SetUpSprites.s28 + 0)
.s1018:
0f04 : a9 31 __ LDA #$31
0f06 : c5 48 __ CMP T2 + 0 
0f08 : b0 04 __ BCS $0f0e ; (SetUpSprites.s29 + 0)
.s28:
0f0a : a9 02 __ LDA #$02
0f0c : d0 02 __ BNE $0f10 ; (SetUpSprites.s184 + 0)
.s29:
0f0e : a9 03 __ LDA #$03
.s184:
0f10 : 8d 23 9f STA $9f23 
0f13 : a9 00 __ LDA #$00
0f15 : 8d 23 9f STA $9f23 
0f18 : e6 48 __ INC T2 + 0 
0f1a : 4c d0 0e JMP $0ed0 ; (SetUpSprites.l14 + 0)
.s174:
0f1d : 8d 23 9f STA $9f23 
0f20 : a9 00 __ LDA #$00
0f22 : 8d 23 9f STA $9f23 
0f25 : e6 48 __ INC T2 + 0 
0f27 : 10 a7 __ BPL $0ed0 ; (SetUpSprites.l14 + 0)
.s11:
0f29 : c6 47 __ DEC T1 + 0 
0f2b : a5 47 __ LDA T1 + 0 
0f2d : d0 9d __ BNE $0ecc ; (SetUpSprites.l10 + 0)
.s12:
0f2f : 85 2d __ STA P0 
0f31 : 85 30 __ STA P3 
0f33 : 85 33 __ STA P6 
0f35 : a9 31 __ LDA #$31
0f37 : 85 2e __ STA P1 
0f39 : a9 01 __ LDA #$01
0f3b : 85 2f __ STA P2 
0f3d : a9 04 __ LDA #$04
0f3f : 85 34 __ STA P7 
0f41 : a9 00 __ LDA #$00
0f43 : 85 31 __ STA P4 
0f45 : a9 1f __ LDA #$1f
0f47 : 85 32 __ STA P5 
0f49 : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
0f4c : a9 00 __ LDA #$00
0f4e : 85 4e __ STA T5 + 0 
0f50 : 85 4f __ STA T5 + 1 
.l45:
0f52 : 85 2d __ STA P0 
0f54 : 18 __ __ CLC
0f55 : 69 02 __ ADC #$02
0f57 : 85 4c __ STA T4 + 0 
0f59 : a9 00 __ LDA #$00
0f5b : 2a __ __ ROL
0f5c : 85 4d __ STA T4 + 1 
0f5e : a9 88 __ LDA #$88
0f60 : 85 2e __ STA P1 
0f62 : a9 09 __ LDA #$09
0f64 : 85 2f __ STA P2 
0f66 : a9 00 __ LDA #$00
0f68 : 85 30 __ STA P3 
0f6a : a9 03 __ LDA #$03
0f6c : 85 31 __ STA P4 
0f6e : a9 02 __ LDA #$02
0f70 : 85 32 __ STA P5 
0f72 : 85 33 __ STA P6 
0f74 : a9 01 __ LDA #$01
0f76 : 85 34 __ STA P7 
0f78 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
0f7b : a5 4e __ LDA T5 + 0 
0f7d : 85 2e __ STA P1 
0f7f : a5 4f __ LDA T5 + 1 
0f81 : 85 2f __ STA P2 
0f83 : a9 90 __ LDA #$90
0f85 : 85 30 __ STA P3 
0f87 : a9 01 __ LDA #$01
0f89 : 85 31 __ STA P4 
0f8b : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
0f8e : a9 00 __ LDA #$00
0f90 : 85 2e __ STA P1 
0f92 : a9 01 __ LDA #$01
0f94 : 85 2f __ STA P2 
0f96 : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
0f99 : a9 88 __ LDA #$88
0f9b : 85 2e __ STA P1 
0f9d : a9 09 __ LDA #$09
0f9f : 85 2f __ STA P2 
0fa1 : a9 00 __ LDA #$00
0fa3 : 85 30 __ STA P3 
0fa5 : a9 03 __ LDA #$03
0fa7 : 85 31 __ STA P4 
0fa9 : e6 2d __ INC P0 
0fab : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
0fae : a5 4e __ LDA T5 + 0 
0fb0 : 85 2e __ STA P1 
0fb2 : a5 4f __ LDA T5 + 1 
0fb4 : 85 2f __ STA P2 
0fb6 : a9 70 __ LDA #$70
0fb8 : 85 30 __ STA P3 
0fba : a9 01 __ LDA #$01
0fbc : 85 31 __ STA P4 
0fbe : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
0fc1 : a5 4d __ LDA T4 + 1 
0fc3 : d0 16 __ BNE $0fdb ; (SetUpSprites.s47 + 0)
.s1013:
0fc5 : 18 __ __ CLC
0fc6 : a5 2e __ LDA P1 
0fc8 : 69 40 __ ADC #$40
0fca : 85 4e __ STA T5 + 0 
0fcc : a5 2f __ LDA P2 
0fce : 69 00 __ ADC #$00
0fd0 : 85 4f __ STA T5 + 1 
0fd2 : a5 4c __ LDA T4 + 0 
0fd4 : c9 14 __ CMP #$14
0fd6 : b0 03 __ BCS $0fdb ; (SetUpSprites.s47 + 0)
0fd8 : 4c 52 0f JMP $0f52 ; (SetUpSprites.l45 + 0)
.s47:
0fdb : a9 00 __ LDA #$00
0fdd : 85 2d __ STA P0 
0fdf : 85 30 __ STA P3 
0fe1 : 85 33 __ STA P6 
0fe3 : a9 30 __ LDA #$30
0fe5 : 85 2e __ STA P1 
0fe7 : a9 01 __ LDA #$01
0fe9 : 85 2f __ STA P2 
0feb : a9 00 __ LDA #$00
0fed : 85 31 __ STA P4 
0fef : a9 23 __ LDA #$23
0ff1 : 85 32 __ STA P5 
0ff3 : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
0ff6 : a9 16 __ LDA #$16
0ff8 : 85 2d __ STA P0 
0ffa : a9 80 __ LDA #$80
0ffc : 85 2e __ STA P1 
0ffe : a9 09 __ LDA #$09
1000 : 85 2f __ STA P2 
1002 : a9 01 __ LDA #$01
1004 : 85 31 __ STA P4 
1006 : 85 34 __ STA P7 
1008 : a9 02 __ LDA #$02
100a : 85 32 __ STA P5 
100c : a9 03 __ LDA #$03
100e : 85 33 __ STA P6 
1010 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1013 : a9 30 __ LDA #$30
1015 : 85 2e __ STA P1 
1017 : a9 01 __ LDA #$01
1019 : 85 2f __ STA P2 
101b : a9 b8 __ LDA #$b8
101d : 85 30 __ STA P3 
101f : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1022 : a9 20 __ LDA #$20
1024 : 85 2d __ STA P0 
1026 : a9 35 __ LDA #$35
1028 : 85 2e __ STA P1 
102a : a9 00 __ LDA #$00
102c : 85 30 __ STA P3 
102e : 85 33 __ STA P6 
1030 : a9 02 __ LDA #$02
1032 : 85 34 __ STA P7 
1034 : a9 00 __ LDA #$00
1036 : 85 31 __ STA P4 
1038 : a9 24 __ LDA #$24
103a : 85 32 __ STA P5 
103c : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
103f : a9 17 __ LDA #$17
1041 : 85 2d __ STA P0 
1043 : a9 a9 __ LDA #$a9
1045 : 85 2e __ STA P1 
1047 : a9 09 __ LDA #$09
1049 : 85 2f __ STA P2 
104b : a9 02 __ LDA #$02
104d : 85 31 __ STA P4 
104f : 85 32 __ STA P5 
1051 : a9 03 __ LDA #$03
1053 : 85 33 __ STA P6 
1055 : a9 01 __ LDA #$01
1057 : 85 34 __ STA P7 
1059 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
105c : a9 fc __ LDA #$fc
105e : 85 2e __ STA P1 
1060 : a9 00 __ LDA #$00
1062 : 85 2f __ STA P2 
1064 : a9 b8 __ LDA #$b8
1066 : 85 30 __ STA P3 
1068 : a9 01 __ LDA #$01
106a : 85 31 __ STA P4 
106c : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
106f : a9 18 __ LDA #$18
1071 : 85 2d __ STA P0 
1073 : a9 a9 __ LDA #$a9
1075 : 85 2e __ STA P1 
1077 : a9 09 __ LDA #$09
1079 : 85 2f __ STA P2 
107b : a9 00 __ LDA #$00
107d : 85 30 __ STA P3 
107f : a9 02 __ LDA #$02
1081 : 85 31 __ STA P4 
1083 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1086 : a9 4c __ LDA #$4c
1088 : 85 2e __ STA P1 
108a : a9 01 __ LDA #$01
108c : 85 2f __ STA P2 
108e : 85 31 __ STA P4 
1090 : a9 b8 __ LDA #$b8
1092 : 85 30 __ STA P3 
1094 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1097 : a9 01 __ LDA #$01
1099 : 85 2e __ STA P1 
109b : a9 00 __ LDA #$00
109d : 85 2f __ STA P2 
109f : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
10a2 : a9 10 __ LDA #$10
10a4 : 85 2d __ STA P0 
10a6 : a9 20 __ LDA #$20
10a8 : 85 30 __ STA P3 
10aa : a9 00 __ LDA #$00
10ac : 85 31 __ STA P4 
10ae : a9 87 __ LDA #$87
10b0 : 85 2e __ STA P1 
10b2 : a9 1d __ LDA #$1d
10b4 : 85 2f __ STA P2 
10b6 : 20 39 18 JSR $1839 ; (vera_pal_putn.s0 + 0)
10b9 : a9 00 __ LDA #$00
10bb : 85 2d __ STA P0 
10bd : 85 30 __ STA P3 
10bf : 85 34 __ STA P7 
10c1 : a9 35 __ LDA #$35
10c3 : 85 2e __ STA P1 
10c5 : a9 01 __ LDA #$01
10c7 : 85 2f __ STA P2 
10c9 : a9 20 __ LDA #$20
10cb : 85 33 __ STA P6 
10cd : a9 a7 __ LDA #$a7
10cf : 85 31 __ STA P4 
10d1 : a9 1d __ LDA #$1d
10d3 : 85 32 __ STA P5 
10d5 : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
10d8 : a9 00 __ LDA #$00
10da : 85 47 __ STA T1 + 0 
10dc : 85 48 __ STA T2 + 0 
10de : a9 03 __ LDA #$03
10e0 : 85 33 __ STA P6 
10e2 : a9 02 __ LDA #$02
10e4 : 85 34 __ STA P7 
10e6 : 18 __ __ CLC
.l1039:
10e7 : a9 a8 __ LDA #$a8
10e9 : 85 2e __ STA P1 
10eb : a9 09 __ LDA #$09
10ed : 85 2f __ STA P2 
10ef : a9 00 __ LDA #$00
10f1 : 85 30 __ STA P3 
10f3 : 85 31 __ STA P4 
10f5 : 85 32 __ STA P5 
10f7 : a5 47 __ LDA T1 + 0 
10f9 : 69 19 __ ADC #$19
10fb : 85 2d __ STA P0 
10fd : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1100 : a9 b8 __ LDA #$b8
1102 : 85 30 __ STA P3 
1104 : a9 01 __ LDA #$01
1106 : 85 31 __ STA P4 
1108 : 38 __ __ SEC
1109 : a5 48 __ LDA T2 + 0 
110b : e9 fc __ SBC #$fc
110d : 85 2e __ STA P1 
110f : a9 00 __ LDA #$00
1111 : e9 03 __ SBC #$03
1113 : 85 2f __ STA P2 
1115 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1118 : 18 __ __ CLC
1119 : a5 48 __ LDA T2 + 0 
111b : 69 0c __ ADC #$0c
111d : 85 48 __ STA T2 + 0 
111f : e6 47 __ INC T1 + 0 
1121 : a5 47 __ LDA T1 + 0 
1123 : c9 08 __ CMP #$08
1125 : 90 c0 __ BCC $10e7 ; (SetUpSprites.l1039 + 0)
.s51:
1127 : a9 00 __ LDA #$00
1129 : 85 47 __ STA T1 + 0 
112b : 85 48 __ STA T2 + 0 
112d : a9 03 __ LDA #$03
112f : 85 33 __ STA P6 
1131 : 85 34 __ STA P7 
1133 : 18 __ __ CLC
.l1041:
1134 : a9 a8 __ LDA #$a8
1136 : 85 2e __ STA P1 
1138 : a9 09 __ LDA #$09
113a : 85 2f __ STA P2 
113c : a9 00 __ LDA #$00
113e : 85 30 __ STA P3 
1140 : 85 31 __ STA P4 
1142 : a5 47 __ LDA T1 + 0 
1144 : 69 21 __ ADC #$21
1146 : 85 2d __ STA P0 
1148 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
114b : a9 c4 __ LDA #$c4
114d : 85 30 __ STA P3 
114f : a9 01 __ LDA #$01
1151 : 85 31 __ STA P4 
1153 : 38 __ __ SEC
1154 : a5 48 __ LDA T2 + 0 
1156 : e9 fc __ SBC #$fc
1158 : 85 2e __ STA P1 
115a : a9 00 __ LDA #$00
115c : e9 03 __ SBC #$03
115e : 85 2f __ STA P2 
1160 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1163 : 18 __ __ CLC
1164 : a5 48 __ LDA T2 + 0 
1166 : 69 0c __ ADC #$0c
1168 : 85 48 __ STA T2 + 0 
116a : e6 47 __ INC T1 + 0 
116c : a5 47 __ LDA T1 + 0 
116e : c9 08 __ CMP #$08
1170 : 90 c2 __ BCC $1134 ; (SetUpSprites.l1041 + 0)
.s55:
1172 : a9 00 __ LDA #$00
1174 : 85 47 __ STA T1 + 0 
1176 : 85 48 __ STA T2 + 0 
1178 : a9 03 __ LDA #$03
117a : 85 33 __ STA P6 
117c : a9 04 __ LDA #$04
117e : 85 34 __ STA P7 
1180 : 18 __ __ CLC
.l1043:
1181 : a9 a8 __ LDA #$a8
1183 : 85 2e __ STA P1 
1185 : a9 09 __ LDA #$09
1187 : 85 2f __ STA P2 
1189 : a9 00 __ LDA #$00
118b : 85 30 __ STA P3 
118d : 85 31 __ STA P4 
118f : a5 47 __ LDA T1 + 0 
1191 : 69 29 __ ADC #$29
1193 : 85 2d __ STA P0 
1195 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1198 : a9 b8 __ LDA #$b8
119a : 85 30 __ STA P3 
119c : a9 01 __ LDA #$01
119e : 85 31 __ STA P4 
11a0 : 38 __ __ SEC
11a1 : a9 6c __ LDA #$6c
11a3 : e5 48 __ SBC T2 + 0 
11a5 : 85 2e __ STA P1 
11a7 : a9 02 __ LDA #$02
11a9 : e9 04 __ SBC #$04
11ab : 85 2f __ STA P2 
11ad : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
11b0 : 18 __ __ CLC
11b1 : a5 48 __ LDA T2 + 0 
11b3 : 69 0c __ ADC #$0c
11b5 : 85 48 __ STA T2 + 0 
11b7 : e6 47 __ INC T1 + 0 
11b9 : a5 47 __ LDA T1 + 0 
11bb : c9 08 __ CMP #$08
11bd : 90 c2 __ BCC $1181 ; (SetUpSprites.l1043 + 0)
.s59:
11bf : a9 00 __ LDA #$00
11c1 : 85 47 __ STA T1 + 0 
.l61:
11c3 : 38 __ __ SEC
11c4 : a9 00 __ LDA #$00
11c6 : e5 47 __ SBC T1 + 0 
11c8 : 29 0c __ AND #$0c
11ca : 49 ff __ EOR #$ff
11cc : 38 __ __ SEC
11cd : 69 6c __ ADC #$6c
11cf : 85 48 __ STA T2 + 0 
11d1 : a9 02 __ LDA #$02
11d3 : e9 00 __ SBC #$00
11d5 : 85 49 __ STA T2 + 1 
11d7 : 18 __ __ CLC
11d8 : a5 47 __ LDA T1 + 0 
11da : 69 31 __ ADC #$31
11dc : 85 2d __ STA P0 
11de : a9 02 __ LDA #$02
11e0 : 85 50 __ STA T7 + 0 
11e2 : a9 03 __ LDA #$03
11e4 : 85 33 __ STA P6 
11e6 : a9 04 __ LDA #$04
11e8 : 85 34 __ STA P7 
.l1033:
11ea : a9 a8 __ LDA #$a8
11ec : 85 2e __ STA P1 
11ee : a9 09 __ LDA #$09
11f0 : 85 2f __ STA P2 
11f2 : a9 00 __ LDA #$00
11f4 : 85 30 __ STA P3 
11f6 : 85 31 __ STA P4 
11f8 : 85 32 __ STA P5 
11fa : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
11fd : a5 48 __ LDA T2 + 0 
11ff : 85 2e __ STA P1 
1201 : a5 49 __ LDA T2 + 1 
1203 : 85 2f __ STA P2 
1205 : a9 b8 __ LDA #$b8
1207 : 85 30 __ STA P3 
1209 : a9 01 __ LDA #$01
120b : 85 31 __ STA P4 
120d : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1210 : c6 50 __ DEC T7 + 0 
1212 : d0 d6 __ BNE $11ea ; (SetUpSprites.l1033 + 0)
.s62:
1214 : e6 47 __ INC T1 + 0 
1216 : a5 47 __ LDA T1 + 0 
1218 : c9 02 __ CMP #$02
121a : 90 a7 __ BCC $11c3 ; (SetUpSprites.l61 + 0)
.s63:
121c : a9 60 __ LDA #$60
121e : 85 2d __ STA P0 
1220 : a9 4f __ LDA #$4f
1222 : 85 2e __ STA P1 
1224 : a9 01 __ LDA #$01
1226 : 85 2f __ STA P2 
1228 : 85 34 __ STA P7 
122a : a9 00 __ LDA #$00
122c : 85 30 __ STA P3 
122e : 85 33 __ STA P6 
1230 : a9 00 __ LDA #$00
1232 : 85 31 __ STA P4 
1234 : a9 26 __ LDA #$26
1236 : 85 32 __ STA P5 
1238 : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
123b : a9 33 __ LDA #$33
123d : 85 2d __ STA P0 
123f : a9 7b __ LDA #$7b
1241 : 85 2e __ STA P1 
1243 : a9 0a __ LDA #$0a
1245 : 85 2f __ STA P2 
1247 : a9 01 __ LDA #$01
1249 : 85 31 __ STA P4 
124b : a9 02 __ LDA #$02
124d : 85 32 __ STA P5 
124f : a9 03 __ LDA #$03
1251 : 85 33 __ STA P6 
1253 : 85 34 __ STA P7 
1255 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1258 : a9 34 __ LDA #$34
125a : 85 2e __ STA P1 
125c : a9 01 __ LDA #$01
125e : 85 2f __ STA P2 
1260 : a9 78 __ LDA #$78
1262 : 85 30 __ STA P3 
1264 : a9 00 __ LDA #$00
1266 : 85 31 __ STA P4 
1268 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
126b : a9 20 __ LDA #$20
126d : 85 2d __ STA P0 
126f : a9 3f __ LDA #$3f
1271 : 85 2e __ STA P1 
1273 : a9 00 __ LDA #$00
1275 : 85 30 __ STA P3 
1277 : 85 33 __ STA P6 
1279 : a9 04 __ LDA #$04
127b : 85 34 __ STA P7 
127d : a9 00 __ LDA #$00
127f : 85 31 __ STA P4 
1281 : a9 27 __ LDA #$27
1283 : 85 32 __ STA P5 
1285 : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
1288 : a9 34 __ LDA #$34
128a : 85 2d __ STA P0 
128c : a9 f9 __ LDA #$f9
128e : 85 2e __ STA P1 
1290 : a9 09 __ LDA #$09
1292 : 85 2f __ STA P2 
1294 : a9 03 __ LDA #$03
1296 : 85 31 __ STA P4 
1298 : 85 33 __ STA P6 
129a : a9 02 __ LDA #$02
129c : 85 32 __ STA P5 
129e : a9 06 __ LDA #$06
12a0 : 85 34 __ STA P7 
12a2 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
12a5 : a9 1c __ LDA #$1c
12a7 : 85 2e __ STA P1 
12a9 : a9 01 __ LDA #$01
12ab : 85 2f __ STA P2 
12ad : a9 78 __ LDA #$78
12af : 85 30 __ STA P3 
12b1 : a9 00 __ LDA #$00
12b3 : 85 31 __ STA P4 
12b5 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
12b8 : a9 35 __ LDA #$35
12ba : 85 2d __ STA P0 
12bc : a9 19 __ LDA #$19
12be : 85 2e __ STA P1 
12c0 : a9 0a __ LDA #$0a
12c2 : 85 2f __ STA P2 
12c4 : a9 00 __ LDA #$00
12c6 : 85 30 __ STA P3 
12c8 : a9 02 __ LDA #$02
12ca : 85 31 __ STA P4 
12cc : a9 03 __ LDA #$03
12ce : 85 32 __ STA P5 
12d0 : a9 07 __ LDA #$07
12d2 : 85 33 __ STA P6 
12d4 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
12d7 : a9 10 __ LDA #$10
12d9 : 85 2e __ STA P1 
12db : a9 01 __ LDA #$01
12dd : 85 2f __ STA P2 
12df : a9 d8 __ LDA #$d8
12e1 : 85 30 __ STA P3 
12e3 : a9 00 __ LDA #$00
12e5 : 85 31 __ STA P4 
12e7 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
12ea : a9 36 __ LDA #$36
12ec : 85 2d __ STA P0 
12ee : a9 19 __ LDA #$19
12f0 : 85 2e __ STA P1 
12f2 : a9 0a __ LDA #$0a
12f4 : 85 2f __ STA P2 
12f6 : a9 00 __ LDA #$00
12f8 : 85 30 __ STA P3 
12fa : a9 02 __ LDA #$02
12fc : 85 31 __ STA P4 
12fe : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1301 : a9 70 __ LDA #$70
1303 : 85 2e __ STA P1 
1305 : a9 01 __ LDA #$01
1307 : 85 2f __ STA P2 
1309 : a9 d8 __ LDA #$d8
130b : 85 30 __ STA P3 
130d : a9 00 __ LDA #$00
130f : 85 31 __ STA P4 
1311 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1314 : a9 01 __ LDA #$01
1316 : 85 2e __ STA P1 
1318 : a9 00 __ LDA #$00
131a : 85 2f __ STA P2 
131c : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
131f : a9 37 __ LDA #$37
1321 : 85 2d __ STA P0 
1323 : a9 19 __ LDA #$19
1325 : 85 2e __ STA P1 
1327 : a9 0a __ LDA #$0a
1329 : 85 2f __ STA P2 
132b : a9 00 __ LDA #$00
132d : 85 30 __ STA P3 
132f : a9 02 __ LDA #$02
1331 : 85 31 __ STA P4 
1333 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1336 : a9 10 __ LDA #$10
1338 : 85 2e __ STA P1 
133a : a9 01 __ LDA #$01
133c : 85 2f __ STA P2 
133e : 85 31 __ STA P4 
1340 : a9 08 __ LDA #$08
1342 : 85 30 __ STA P3 
1344 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1347 : a9 00 __ LDA #$00
1349 : 85 2e __ STA P1 
134b : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
134e : a9 38 __ LDA #$38
1350 : 85 2d __ STA P0 
1352 : a9 19 __ LDA #$19
1354 : 85 2e __ STA P1 
1356 : a9 0a __ LDA #$0a
1358 : 85 2f __ STA P2 
135a : a9 00 __ LDA #$00
135c : 85 30 __ STA P3 
135e : a9 02 __ LDA #$02
1360 : 85 31 __ STA P4 
1362 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1365 : a9 70 __ LDA #$70
1367 : 85 2e __ STA P1 
1369 : a9 01 __ LDA #$01
136b : 85 2f __ STA P2 
136d : 85 31 __ STA P4 
136f : a9 08 __ LDA #$08
1371 : 85 30 __ STA P3 
1373 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1376 : a9 01 __ LDA #$01
1378 : 85 2e __ STA P1 
137a : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
137d : a9 20 __ LDA #$20
137f : 85 2d __ STA P0 
1381 : a9 37 __ LDA #$37
1383 : 85 2e __ STA P1 
1385 : a9 00 __ LDA #$00
1387 : 85 30 __ STA P3 
1389 : 85 33 __ STA P6 
138b : a9 08 __ LDA #$08
138d : 85 34 __ STA P7 
138f : a9 00 __ LDA #$00
1391 : 85 31 __ STA P4 
1393 : a9 2b __ LDA #$2b
1395 : 85 32 __ STA P5 
1397 : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
139a : a9 00 __ LDA #$00
139c : 85 47 __ STA T1 + 0 
139e : 85 48 __ STA T2 + 0 
13a0 : 85 49 __ STA T2 + 1 
13a2 : a9 02 __ LDA #$02
13a4 : 85 33 __ STA P6 
13a6 : a9 05 __ LDA #$05
13a8 : 85 34 __ STA P7 
13aa : 18 __ __ CLC
.l1045:
13ab : a9 b9 __ LDA #$b9
13ad : 85 2e __ STA P1 
13af : a9 09 __ LDA #$09
13b1 : 85 2f __ STA P2 
13b3 : a9 00 __ LDA #$00
13b5 : 85 30 __ STA P3 
13b7 : a9 03 __ LDA #$03
13b9 : 85 31 __ STA P4 
13bb : 85 32 __ STA P5 
13bd : a5 47 __ LDA T1 + 0 
13bf : 69 39 __ ADC #$39
13c1 : 85 2d __ STA P0 
13c3 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
13c6 : a9 fa __ LDA #$fa
13c8 : 85 2e __ STA P1 
13ca : a9 00 __ LDA #$00
13cc : 85 2f __ STA P2 
13ce : 38 __ __ SEC
13cf : a5 48 __ LDA T2 + 0 
13d1 : e9 20 __ SBC #$20
13d3 : 85 4a __ STA T3 + 0 
13d5 : 85 30 __ STA P3 
13d7 : a5 49 __ LDA T2 + 1 
13d9 : e9 00 __ SBC #$00
13db : 85 4b __ STA T3 + 1 
13dd : 85 31 __ STA P4 
13df : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
13e2 : a9 b9 __ LDA #$b9
13e4 : 85 2e __ STA P1 
13e6 : a9 09 __ LDA #$09
13e8 : 85 2f __ STA P2 
13ea : a9 00 __ LDA #$00
13ec : 85 30 __ STA P3 
13ee : a9 03 __ LDA #$03
13f0 : 85 31 __ STA P4 
13f2 : 18 __ __ CLC
13f3 : a5 47 __ LDA T1 + 0 
13f5 : 69 40 __ ADC #$40
13f7 : 85 2d __ STA P0 
13f9 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
13fc : a9 3a __ LDA #$3a
13fe : 85 2e __ STA P1 
1400 : a9 01 __ LDA #$01
1402 : 85 2f __ STA P2 
1404 : a5 4a __ LDA T3 + 0 
1406 : 85 30 __ STA P3 
1408 : a5 4b __ LDA T3 + 1 
140a : 85 31 __ STA P4 
140c : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
140f : a9 01 __ LDA #$01
1411 : 85 2e __ STA P1 
1413 : a9 00 __ LDA #$00
1415 : 85 2f __ STA P2 
1417 : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
141a : 18 __ __ CLC
141b : a5 48 __ LDA T2 + 0 
141d : 69 40 __ ADC #$40
141f : 85 48 __ STA T2 + 0 
1421 : 90 02 __ BCC $1425 ; (SetUpSprites.s1048 + 0)
.s1047:
1423 : e6 49 __ INC T2 + 1 
.s1048:
1425 : e6 47 __ INC T1 + 0 
1427 : a5 47 __ LDA T1 + 0 
1429 : c9 07 __ CMP #$07
142b : b0 03 __ BCS $1430 ; (SetUpSprites.s71 + 0)
142d : 4c ab 13 JMP $13ab ; (SetUpSprites.l1045 + 0)
.s71:
1430 : a9 20 __ LDA #$20
1432 : 85 2d __ STA P0 
1434 : a9 47 __ LDA #$47
1436 : 85 2e __ STA P1 
1438 : a9 01 __ LDA #$01
143a : 85 2f __ STA P2 
143c : a9 00 __ LDA #$00
143e : 85 30 __ STA P3 
1440 : 85 33 __ STA P6 
1442 : a9 08 __ LDA #$08
1444 : 85 34 __ STA P7 
1446 : a9 00 __ LDA #$00
1448 : 85 31 __ STA P4 
144a : a9 33 __ LDA #$33
144c : 85 32 __ STA P5 
144e : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
1451 : a9 47 __ LDA #$47
1453 : 85 2d __ STA P0 
1455 : a9 39 __ LDA #$39
1457 : 85 2e __ STA P1 
1459 : a9 0a __ LDA #$0a
145b : 85 2f __ STA P2 
145d : a9 03 __ LDA #$03
145f : 85 31 __ STA P4 
1461 : 85 32 __ STA P5 
1463 : a9 07 __ LDA #$07
1465 : 85 33 __ STA P6 
1467 : a9 06 __ LDA #$06
1469 : 85 34 __ STA P7 
146b : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
146e : a9 08 __ LDA #$08
1470 : 85 2e __ STA P1 
1472 : 85 30 __ STA P3 
1474 : a9 00 __ LDA #$00
1476 : 85 2f __ STA P2 
1478 : 85 31 __ STA P4 
147a : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
147d : a9 48 __ LDA #$48
147f : 85 2d __ STA P0 
1481 : a9 39 __ LDA #$39
1483 : 85 2e __ STA P1 
1485 : a9 0a __ LDA #$0a
1487 : 85 2f __ STA P2 
1489 : a9 00 __ LDA #$00
148b : 85 30 __ STA P3 
148d : a9 03 __ LDA #$03
148f : 85 31 __ STA P4 
1491 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1494 : a9 48 __ LDA #$48
1496 : 85 2e __ STA P1 
1498 : a9 00 __ LDA #$00
149a : 85 2f __ STA P2 
149c : 85 31 __ STA P4 
149e : a9 08 __ LDA #$08
14a0 : 85 30 __ STA P3 
14a2 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
14a5 : a9 01 __ LDA #$01
14a7 : 85 2e __ STA P1 
14a9 : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
14ac : a9 49 __ LDA #$49
14ae : 85 2d __ STA P0 
14b0 : a9 39 __ LDA #$39
14b2 : 85 2e __ STA P1 
14b4 : a9 0a __ LDA #$0a
14b6 : 85 2f __ STA P2 
14b8 : a9 00 __ LDA #$00
14ba : 85 30 __ STA P3 
14bc : a9 03 __ LDA #$03
14be : 85 31 __ STA P4 
14c0 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
14c3 : a9 48 __ LDA #$48
14c5 : 85 2e __ STA P1 
14c7 : 85 30 __ STA P3 
14c9 : a9 00 __ LDA #$00
14cb : 85 2f __ STA P2 
14cd : 85 31 __ STA P4 
14cf : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
14d2 : a9 01 __ LDA #$01
14d4 : 85 2e __ STA P1 
14d6 : 85 2f __ STA P2 
14d8 : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
14db : a9 4a __ LDA #$4a
14dd : 85 2d __ STA P0 
14df : a9 39 __ LDA #$39
14e1 : 85 2e __ STA P1 
14e3 : a9 0a __ LDA #$0a
14e5 : 85 2f __ STA P2 
14e7 : a9 00 __ LDA #$00
14e9 : 85 30 __ STA P3 
14eb : a9 03 __ LDA #$03
14ed : 85 31 __ STA P4 
14ef : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
14f2 : a9 08 __ LDA #$08
14f4 : 85 2e __ STA P1 
14f6 : a9 00 __ LDA #$00
14f8 : 85 2f __ STA P2 
14fa : 85 31 __ STA P4 
14fc : a9 48 __ LDA #$48
14fe : 85 30 __ STA P3 
1500 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1503 : a9 00 __ LDA #$00
1505 : 85 2e __ STA P1 
1507 : a9 01 __ LDA #$01
1509 : 85 2f __ STA P2 
150b : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
150e : a9 20 __ LDA #$20
1510 : 85 2d __ STA P0 
1512 : a9 47 __ LDA #$47
1514 : 85 2e __ STA P1 
1516 : a9 00 __ LDA #$00
1518 : 85 30 __ STA P3 
151a : a9 00 __ LDA #$00
151c : 85 31 __ STA P4 
151e : a9 33 __ LDA #$33
1520 : 85 32 __ STA P5 
1522 : a9 00 __ LDA #$00
1524 : 85 33 __ STA P6 
1526 : a9 08 __ LDA #$08
1528 : 85 34 __ STA P7 
152a : 20 ea 16 JSR $16ea ; (vram_putn.s0 + 0)
152d : a9 4b __ LDA #$4b
152f : 85 2d __ STA P0 
1531 : a9 39 __ LDA #$39
1533 : 85 2e __ STA P1 
1535 : a9 0a __ LDA #$0a
1537 : 85 2f __ STA P2 
1539 : a9 03 __ LDA #$03
153b : 85 31 __ STA P4 
153d : 85 32 __ STA P5 
153f : a9 07 __ LDA #$07
1541 : 85 33 __ STA P6 
1543 : a9 06 __ LDA #$06
1545 : 85 34 __ STA P7 
1547 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
154a : a9 f8 __ LDA #$f8
154c : 85 2e __ STA P1 
154e : a9 01 __ LDA #$01
1550 : 85 2f __ STA P2 
1552 : a9 08 __ LDA #$08
1554 : 85 30 __ STA P3 
1556 : a9 00 __ LDA #$00
1558 : 85 31 __ STA P4 
155a : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
155d : a9 4c __ LDA #$4c
155f : 85 2d __ STA P0 
1561 : a9 39 __ LDA #$39
1563 : 85 2e __ STA P1 
1565 : a9 0a __ LDA #$0a
1567 : 85 2f __ STA P2 
1569 : a9 00 __ LDA #$00
156b : 85 30 __ STA P3 
156d : a9 03 __ LDA #$03
156f : 85 31 __ STA P4 
1571 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
1574 : a9 38 __ LDA #$38
1576 : 85 2e __ STA P1 
1578 : a9 02 __ LDA #$02
157a : 85 2f __ STA P2 
157c : a9 08 __ LDA #$08
157e : 85 30 __ STA P3 
1580 : a9 00 __ LDA #$00
1582 : 85 31 __ STA P4 
1584 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1587 : a9 01 __ LDA #$01
1589 : 85 2e __ STA P1 
158b : a9 00 __ LDA #$00
158d : 85 2f __ STA P2 
158f : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
1592 : a9 4d __ LDA #$4d
1594 : 85 2d __ STA P0 
1596 : a9 39 __ LDA #$39
1598 : 85 2e __ STA P1 
159a : a9 0a __ LDA #$0a
159c : 85 2f __ STA P2 
159e : a9 00 __ LDA #$00
15a0 : 85 30 __ STA P3 
15a2 : a9 03 __ LDA #$03
15a4 : 85 31 __ STA P4 
15a6 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
15a9 : a9 38 __ LDA #$38
15ab : 85 2e __ STA P1 
15ad : a9 02 __ LDA #$02
15af : 85 2f __ STA P2 
15b1 : a9 48 __ LDA #$48
15b3 : 85 30 __ STA P3 
15b5 : a9 00 __ LDA #$00
15b7 : 85 31 __ STA P4 
15b9 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
15bc : a9 01 __ LDA #$01
15be : 85 2e __ STA P1 
15c0 : 85 2f __ STA P2 
15c2 : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
15c5 : a9 4e __ LDA #$4e
15c7 : 85 2d __ STA P0 
15c9 : a9 39 __ LDA #$39
15cb : 85 2e __ STA P1 
15cd : a9 0a __ LDA #$0a
15cf : 85 2f __ STA P2 
15d1 : a9 00 __ LDA #$00
15d3 : 85 30 __ STA P3 
15d5 : a9 03 __ LDA #$03
15d7 : 85 31 __ STA P4 
15d9 : 20 4c 17 JSR $174c ; (vera_spr_set.s0 + 0)
15dc : a9 f8 __ LDA #$f8
15de : 85 2e __ STA P1 
15e0 : a9 01 __ LDA #$01
15e2 : 85 2f __ STA P2 
15e4 : a9 48 __ LDA #$48
15e6 : 85 30 __ STA P3 
15e8 : a9 00 __ LDA #$00
15ea : 85 31 __ STA P4 
15ec : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
15ef : a9 00 __ LDA #$00
15f1 : 85 2e __ STA P1 
15f3 : 20 f5 17 JSR $17f5 ; (vera_spr_flip.s0 + 0)
15f6 : a9 20 __ LDA #$20
15f8 : 85 37 __ STA P10 
15fa : a9 40 __ LDA #$40
15fc : 8d fc 9e STA $9efc ; (sstack + 0)
15ff : a9 fa __ LDA #$fa
1601 : 8d fd 9e STA $9efd ; (sstack + 1)
1604 : a9 01 __ LDA #$01
1606 : 8d fe 9e STA $9efe ; (sstack + 2)
1609 : a9 00 __ LDA #$00
160b : 8d ff 9e STA $9eff ; (sstack + 3)
160e : a9 c7 __ LDA #$c7
1610 : 85 35 __ STA P8 
1612 : a9 1d __ LDA #$1d
1614 : 85 36 __ STA P9 
1616 : 20 82 18 JSR $1882 ; (SetPaletteColours.s0 + 0)
1619 : a9 60 __ LDA #$60
161b : 8d fc 9e STA $9efc ; (sstack + 0)
161e : a9 fa __ LDA #$fa
1620 : 8d fd 9e STA $9efd ; (sstack + 1)
1623 : a9 01 __ LDA #$01
1625 : 8d fe 9e STA $9efe ; (sstack + 2)
1628 : a9 00 __ LDA #$00
162a : 8d ff 9e STA $9eff ; (sstack + 3)
162d : a9 00 __ LDA #$00
162f : 85 35 __ STA P8 
1631 : a9 3b __ LDA #$3b
1633 : 85 36 __ STA P9 
1635 : 20 82 18 JSR $1882 ; (SetPaletteColours.s0 + 0)
1638 : a9 80 __ LDA #$80
163a : 8d fc 9e STA $9efc ; (sstack + 0)
163d : a9 fa __ LDA #$fa
163f : 8d fd 9e STA $9efd ; (sstack + 1)
1642 : a9 01 __ LDA #$01
1644 : 8d fe 9e STA $9efe ; (sstack + 2)
1647 : a9 00 __ LDA #$00
1649 : 8d ff 9e STA $9eff ; (sstack + 3)
164c : a9 20 __ LDA #$20
164e : 85 35 __ STA P8 
1650 : a9 3b __ LDA #$3b
1652 : 85 36 __ STA P9 
1654 : 20 82 18 JSR $1882 ; (SetPaletteColours.s0 + 0)
1657 : a9 60 __ LDA #$60
1659 : 85 2d __ STA P0 
165b : a9 0c __ LDA #$0c
165d : 85 30 __ STA P3 
165f : a9 00 __ LDA #$00
1661 : 85 31 __ STA P4 
1663 : a9 e7 __ LDA #$e7
1665 : 85 2e __ STA P1 
1667 : a9 1d __ LDA #$1d
1669 : 85 2f __ STA P2 
166b : 20 39 18 JSR $1839 ; (vera_pal_putn.s0 + 0)
166e : a9 20 __ LDA #$20
1670 : 85 2d __ STA P0 
1672 : a9 43 __ LDA #$43
1674 : 85 2e __ STA P1 
1676 : a9 01 __ LDA #$01
1678 : 85 2f __ STA P2 
167a : a9 00 __ LDA #$00
167c : 85 30 __ STA P3 
167e : 85 33 __ STA P6 
1680 : a9 04 __ LDA #$04
1682 : 85 34 __ STA P7 
1684 : a9 40 __ LDA #$40
1686 : 85 31 __ STA P4 
1688 : a9 3b __ LDA #$3b
168a : 85 32 __ STA P5 
168c : 4c ea 16 JMP $16ea ; (vram_putn.s0 + 0)
.s1017:
168f : c9 09 __ CMP #$09
1691 : 90 06 __ BCC $1699 ; (SetUpSprites.s32 + 0)
.s1016:
1693 : a9 45 __ LDA #$45
1695 : c5 48 __ CMP T2 + 0 
1697 : b0 05 __ BCS $169e ; (SetUpSprites.s1005 + 0)
.s32:
1699 : a9 04 __ LDA #$04
169b : 4c 1d 0f JMP $0f1d ; (SetUpSprites.s174 + 0)
.s1005:
169e : a5 48 __ LDA T2 + 0 
16a0 : c9 13 __ CMP #$13
16a2 : 90 06 __ BCC $16aa ; (SetUpSprites.s36 + 0)
.s1004:
16a4 : a9 3b __ LDA #$3b
16a6 : c5 48 __ CMP T2 + 0 
16a8 : b0 05 __ BCS $16af ; (SetUpSprites.s1003 + 0)
.s36:
16aa : a9 05 __ LDA #$05
16ac : 4c 10 0f JMP $0f10 ; (SetUpSprites.s184 + 0)
.s1003:
16af : a5 48 __ LDA T2 + 0 
16b1 : c9 1d __ CMP #$1d
16b3 : 90 06 __ BCC $16bb ; (SetUpSprites.s40 + 0)
.s1002:
16b5 : a9 31 __ LDA #$31
16b7 : c5 48 __ CMP T2 + 0 
16b9 : b0 05 __ BCS $16c0 ; (SetUpSprites.s41 + 0)
.s40:
16bb : a9 06 __ LDA #$06
16bd : 4c 10 0f JMP $0f10 ; (SetUpSprites.s184 + 0)
.s41:
16c0 : a9 07 __ LDA #$07
16c2 : 4c 10 0f JMP $0f10 ; (SetUpSprites.s184 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
16c5 : 46 2d __ LSR P0 ; (bank + 0)
16c7 : a9 00 __ LDA #$00
16c9 : 6a __ __ ROR
16ca : 85 3b __ STA ACCU + 0 
16cc : a5 2f __ LDA P2 ; (mem + 1)
16ce : 29 f8 __ AND #$f8
16d0 : 4a __ __ LSR
16d1 : 05 3b __ ORA ACCU + 0 
16d3 : 85 3b __ STA ACCU + 0 
16d5 : a5 30 __ LDA P3 ; (height + 0)
16d7 : 0a __ __ ASL
16d8 : 05 3b __ ORA ACCU + 0 
16da : 05 31 __ ORA P4 ; (width + 0)
.s1001:
16dc : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
16dd : 46 2d __ LSR P0 ; (bank + 0)
16df : a9 00 __ LDA #$00
16e1 : 6a __ __ ROR
16e2 : 85 3b __ STA ACCU + 0 
16e4 : a5 2f __ LDA P2 ; (mem + 1)
16e6 : 4a __ __ LSR
16e7 : 05 3b __ ORA ACCU + 0 
.s1001:
16e9 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
16ea : ad 25 9f LDA $9f25 
16ed : 29 fe __ AND #$fe
16ef : 8d 25 9f STA $9f25 
16f2 : a5 2d __ LDA P0 ; (addr + 0)
16f4 : 8d 20 9f STA $9f20 
16f7 : a5 2e __ LDA P1 ; (addr + 1)
16f9 : 8d 21 9f STA $9f21 
16fc : a5 2f __ LDA P2 ; (addr + 2)
16fe : 29 01 __ AND #$01
1700 : 09 10 __ ORA #$10
1702 : 8d 22 9f STA $9f22 
1705 : a5 33 __ LDA P6 ; (size + 0)
1707 : 05 34 __ ORA P7 ; (size + 1)
1709 : f0 19 __ BEQ $1724 ; (vram_putn.s1001 + 0)
.s6:
170b : a0 00 __ LDY #$00
170d : a6 33 __ LDX P6 ; (size + 0)
170f : f0 02 __ BEQ $1713 ; (vram_putn.l1002 + 0)
.s1005:
1711 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1713 : b1 31 __ LDA (P4),y ; (data + 0)
1715 : 8d 23 9f STA $9f23 
1718 : c8 __ __ INY
1719 : d0 02 __ BNE $171d ; (vram_putn.s1009 + 0)
.s1008:
171b : e6 32 __ INC P5 ; (data + 1)
.s1009:
171d : ca __ __ DEX
171e : d0 f3 __ BNE $1713 ; (vram_putn.l1002 + 0)
.s1004:
1720 : c6 34 __ DEC P7 ; (size + 1)
1722 : d0 ef __ BNE $1713 ; (vram_putn.l1002 + 0)
.s1001:
1724 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e20 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e80 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1e90 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
1ea0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
1eb0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
1ec0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1ed0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1ee0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
1ef0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
1725 : ad 86 1d LDA $1d86 ; (seed + 1)
1728 : 4a __ __ LSR
1729 : ad 85 1d LDA $1d85 ; (seed + 0)
172c : 6a __ __ ROR
172d : aa __ __ TAX
172e : a9 00 __ LDA #$00
1730 : 6a __ __ ROR
1731 : 4d 85 1d EOR $1d85 ; (seed + 0)
1734 : 85 3b __ STA ACCU + 0 
1736 : 8a __ __ TXA
1737 : 4d 86 1d EOR $1d86 ; (seed + 1)
173a : 85 3c __ STA ACCU + 1 
173c : 4a __ __ LSR
173d : 45 3b __ EOR ACCU + 0 
173f : 8d 85 1d STA $1d85 ; (seed + 0)
1742 : 85 3b __ STA ACCU + 0 
1744 : 45 3c __ EOR ACCU + 1 
1746 : 8d 86 1d STA $1d86 ; (seed + 1)
1749 : 85 3c __ STA ACCU + 1 
.s1001:
174b : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1d85 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f60 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f70 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f80 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f90 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fa0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fb0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fc0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1fd0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1fe0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1ff0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
2000 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
2010 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
2020 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
2030 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
2040 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
2050 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
2060 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2070 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
2080 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2090 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
20a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
20b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
20c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20e0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2100 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2110 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2120 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2130 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2140 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2150 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2160 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2170 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2180 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2190 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21a0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21e0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2200 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
2210 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
2220 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
2230 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
2240 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
2250 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
2260 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
2270 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
2280 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
2290 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
22a0 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
22b0 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
22c0 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
22d0 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
22e0 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
22f0 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
174c : ad 25 9f LDA $9f25 
174f : 29 fe __ AND #$fe
1751 : 8d 25 9f STA $9f25 
1754 : a5 2d __ LDA P0 ; (spr + 0)
1756 : 0a __ __ ASL
1757 : 85 3b __ STA ACCU + 0 
1759 : a9 00 __ LDA #$00
175b : 2a __ __ ROL
175c : 06 3b __ ASL ACCU + 0 
175e : 2a __ __ ROL
175f : 06 3b __ ASL ACCU + 0 
1761 : 2a __ __ ROL
1762 : 69 fc __ ADC #$fc
1764 : 8d 21 9f STA $9f21 
1767 : a9 00 __ LDA #$00
1769 : 69 01 __ ADC #$01
176b : 29 01 __ AND #$01
176d : 09 10 __ ORA #$10
176f : 8d 22 9f STA $9f22 
1772 : a5 3b __ LDA ACCU + 0 
1774 : 8d 20 9f STA $9f20 
1777 : a5 30 __ LDA P3 ; (mode8 + 0)
1779 : f0 02 __ BEQ $177d ; (vera_spr_set.s11 + 0)
.s9:
177b : a9 80 __ LDA #$80
.s11:
177d : 05 2f __ ORA P2 ; (addr32 + 1)
177f : a6 2e __ LDX P1 ; (addr32 + 0)
1781 : 8e 23 9f STX $9f23 
1784 : 8d 23 9f STA $9f23 
1787 : a9 00 __ LDA #$00
1789 : 8d 23 9f STA $9f23 
178c : 8d 23 9f STA $9f23 
178f : 8d 23 9f STA $9f23 
1792 : 8d 23 9f STA $9f23 
1795 : a5 33 __ LDA P6 ; (z + 0)
1797 : 0a __ __ ASL
1798 : 0a __ __ ASL
1799 : 8d 23 9f STA $9f23 
179c : a5 32 __ LDA P5 ; (h + 0)
179e : 4a __ __ LSR
179f : 6a __ __ ROR
17a0 : 29 80 __ AND #$80
17a2 : 6a __ __ ROR
17a3 : 85 3b __ STA ACCU + 0 
17a5 : a5 31 __ LDA P4 ; (w + 0)
17a7 : 0a __ __ ASL
17a8 : 0a __ __ ASL
17a9 : 0a __ __ ASL
17aa : 0a __ __ ASL
17ab : 05 3b __ ORA ACCU + 0 
17ad : 05 34 __ ORA P7 ; (pal + 0)
17af : 8d 23 9f STA $9f23 
.s1001:
17b2 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
17b3 : ad 25 9f LDA $9f25 
17b6 : 29 fe __ AND #$fe
17b8 : 8d 25 9f STA $9f25 
17bb : a5 2d __ LDA P0 ; (spr + 0)
17bd : 0a __ __ ASL
17be : 85 3b __ STA ACCU + 0 
17c0 : a9 00 __ LDA #$00
17c2 : 2a __ __ ROL
17c3 : 06 3b __ ASL ACCU + 0 
17c5 : 2a __ __ ROL
17c6 : 06 3b __ ASL ACCU + 0 
17c8 : 2a __ __ ROL
17c9 : 69 fc __ ADC #$fc
17cb : 8d 21 9f STA $9f21 
17ce : a5 3b __ LDA ACCU + 0 
17d0 : 09 02 __ ORA #$02
17d2 : 8d 20 9f STA $9f20 
17d5 : a9 00 __ LDA #$00
17d7 : 69 01 __ ADC #$01
17d9 : 29 01 __ AND #$01
17db : 09 10 __ ORA #$10
17dd : 8d 22 9f STA $9f22 
17e0 : a5 2e __ LDA P1 ; (x + 0)
17e2 : 8d 23 9f STA $9f23 
17e5 : a5 2f __ LDA P2 ; (x + 1)
17e7 : 8d 23 9f STA $9f23 
17ea : a5 30 __ LDA P3 ; (y + 0)
17ec : 8d 23 9f STA $9f23 
17ef : a5 31 __ LDA P4 ; (y + 1)
17f1 : 8d 23 9f STA $9f23 
.s1001:
17f4 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
17f5 : ad 25 9f LDA $9f25 
17f8 : 29 fe __ AND #$fe
17fa : 8d 25 9f STA $9f25 
17fd : a5 2d __ LDA P0 ; (spr + 0)
17ff : 0a __ __ ASL
1800 : 85 3b __ STA ACCU + 0 
1802 : a9 00 __ LDA #$00
1804 : 2a __ __ ROL
1805 : 06 3b __ ASL ACCU + 0 
1807 : 2a __ __ ROL
1808 : 06 3b __ ASL ACCU + 0 
180a : 2a __ __ ROL
180b : 69 fc __ ADC #$fc
180d : 8d 21 9f STA $9f21 
1810 : a5 3b __ LDA ACCU + 0 
1812 : 09 06 __ ORA #$06
1814 : 8d 20 9f STA $9f20 
1817 : a9 00 __ LDA #$00
1819 : 69 01 __ ADC #$01
181b : 29 01 __ AND #$01
181d : 8d 22 9f STA $9f22 
1820 : ad 23 9f LDA $9f23 
1823 : 29 fc __ AND #$fc
1825 : a8 __ __ TAY
1826 : a5 2e __ LDA P1 ; (fliph + 0)
1828 : f0 01 __ BEQ $182b ; (vera_spr_flip.s14 + 0)
.s6:
182a : c8 __ __ INY
.s14:
182b : a5 2f __ LDA P2 ; (flipv + 0)
182d : f0 05 __ BEQ $1834 ; (vera_spr_flip.s11 + 0)
.s9:
182f : 98 __ __ TYA
1830 : 09 02 __ ORA #$02
1832 : d0 01 __ BNE $1835 ; (vera_spr_flip.s1002 + 0)
.s11:
1834 : 98 __ __ TYA
.s1002:
1835 : 8d 23 9f STA $9f23 
.s1001:
1838 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2310 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2320 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2330 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2340 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2350 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2360 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2370 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2380 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2390 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
23d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
23e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
23f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2420 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2430 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2440 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2450 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2460 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2470 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2480 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2490 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
24a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
24b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
24c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
24d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
24e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
24f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2500 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2510 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2520 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2530 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2540 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2550 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2560 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2570 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2580 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2590 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
25a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
25b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
25c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
25d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
25e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
25f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1839 : ad 25 9f LDA $9f25 
183c : 29 fe __ AND #$fe
183e : 8d 25 9f STA $9f25 
1841 : a5 2d __ LDA P0 ; (index + 0)
1843 : 0a __ __ ASL
1844 : 8d 20 9f STA $9f20 
1847 : a9 7d __ LDA #$7d
1849 : 2a __ __ ROL
184a : 8d 21 9f STA $9f21 
184d : a9 11 __ LDA #$11
184f : 8d 22 9f STA $9f22 
1852 : a5 30 __ LDA P3 ; (size + 0)
1854 : 05 31 __ ORA P4 ; (size + 1)
1856 : f0 29 __ BEQ $1881 ; (vera_pal_putn.s1001 + 0)
.s6:
1858 : a6 30 __ LDX P3 ; (size + 0)
185a : f0 02 __ BEQ $185e ; (vera_pal_putn.l3 + 0)
.s1003:
185c : e6 31 __ INC P4 ; (size + 1)
.l3:
185e : a0 01 __ LDY #$01
1860 : b1 2e __ LDA (P1),y ; (color + 0)
1862 : 85 3c __ STA ACCU + 1 
1864 : 88 __ __ DEY
1865 : b1 2e __ LDA (P1),y ; (color + 0)
1867 : 8d 23 9f STA $9f23 
186a : a5 3c __ LDA ACCU + 1 
186c : 8d 23 9f STA $9f23 
186f : 18 __ __ CLC
1870 : a5 2e __ LDA P1 ; (color + 0)
1872 : 69 02 __ ADC #$02
1874 : 85 2e __ STA P1 ; (color + 0)
1876 : 90 02 __ BCC $187a ; (vera_pal_putn.s1007 + 0)
.s1006:
1878 : e6 2f __ INC P2 ; (color + 1)
.s1007:
187a : ca __ __ DEX
187b : d0 e1 __ BNE $185e ; (vera_pal_putn.l3 + 0)
.s1002:
187d : c6 31 __ DEC P4 ; (size + 1)
187f : d0 dd __ BNE $185e ; (vera_pal_putn.l3 + 0)
.s1001:
1881 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
1d87 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
1d97 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
1da7 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
1db7 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainPupil:
2600 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2610 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2620 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2630 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2640 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2650 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2660 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2670 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2680 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2690 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
26a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
26b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
26c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
26d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
26e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
26f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2710 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2730 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2750 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2760 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2770 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2780 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2790 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
27a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
27b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
27c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
27d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
27e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
27f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2800 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2810 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2820 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2830 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2840 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2850 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2860 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2870 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2880 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2890 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
28a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
28b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
28c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
28d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
28e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
28f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2900 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2910 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2920 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2930 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2940 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2950 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2960 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2970 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2980 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2990 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
29a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
29b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
29c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
29d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
29e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
29f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2a00 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2a10 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2a30 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2a40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2a50 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2a60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2a70 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2a80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2a90 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2aa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2ab0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2ac0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
2ad0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
2ae0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2af0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2b00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2b90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ba0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bb0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bc0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bd0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2be0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2bf0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2c90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ca0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cb0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cc0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cd0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ce0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2cf0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2da0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2db0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2dc0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2dd0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2de0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2df0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2e00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2e90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ea0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2eb0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ec0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ed0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ee0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ef0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2f00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2f10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2f20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2f30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2f40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2f50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2f60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2f70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2f80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2f90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2fa0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2fb0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2fc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2fd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2fe0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
2ff0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3000 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3010 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3020 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3030 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3040 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3050 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3060 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3070 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3080 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3090 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
30a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
30b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
30c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
30d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
30e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
30f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3100 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3110 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3120 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3130 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3140 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3150 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3160 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3170 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3180 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3190 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
31a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
31b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
31c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
31d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
31e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
31f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3200 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3210 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3220 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3230 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3240 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3250 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3260 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3270 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3280 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3290 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
32a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
32b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
32c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
32d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
32e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
32f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
CharBox:
3300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3320 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3330 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3340 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3350 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3360 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3370 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3380 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3390 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
33a0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
33b0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
33c0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
33d0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
33e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
33f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3400 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3410 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3420 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3430 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3440 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3450 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3460 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3470 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3480 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3490 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
34a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
34c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
34e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
34f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3500 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3510 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3520 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3530 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3540 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3550 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3560 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3570 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3580 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3590 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
35a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
35c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
35e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
35f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3600 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3610 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3620 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3630 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3640 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3650 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3660 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3670 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3680 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3690 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
36a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
36c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
36e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3700 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3710 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3720 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3730 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3740 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3750 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3760 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3770 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3780 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3790 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
37a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37b0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
37c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37d0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
37e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
37f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3800 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3810 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3820 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3830 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3840 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3850 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3860 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3870 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3880 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3890 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
38a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
38c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
38e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3900 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3910 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3920 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3930 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3940 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3950 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3960 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3970 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3980 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3990 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
39a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
39c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
39e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
39f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a00 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a10 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a20 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a30 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a40 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a50 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a60 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a70 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3a80 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3a90 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3aa0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ab0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ac0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3ad0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3ae0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3af0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1882 : ad fc 9e LDA $9efc ; (sstack + 0)
1885 : 85 2d __ STA P0 
1887 : ad fd 9e LDA $9efd ; (sstack + 1)
188a : 85 2e __ STA P1 
188c : ad fe 9e LDA $9efe ; (sstack + 2)
188f : 85 2f __ STA P2 
1891 : ad ff 9e LDA $9eff ; (sstack + 3)
1894 : 85 30 __ STA P3 
1896 : a5 35 __ LDA P8 ; (input + 0)
1898 : 85 31 __ STA P4 
189a : a5 36 __ LDA P9 ; (input + 1)
189c : 85 32 __ STA P5 
189e : a5 37 __ LDA P10 ; (inputsize + 0)
18a0 : 85 33 __ STA P6 
18a2 : a9 00 __ LDA #$00
18a4 : 85 34 __ STA P7 
18a6 : 4c ea 16 JMP $16ea ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
1dc7 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
1dd7 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
3b00 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
3b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
3b20 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
3b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
1de7 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
EyeTri:
3b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3b60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b70 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3b80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3ba0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3bc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3be0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3c20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c30 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3c40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c50 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3c60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c70 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
3c80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c90 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
3ca0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cb0 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
3cc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cd0 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
3ce0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cf0 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
3d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d10 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
3d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d30 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
3d40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3d50 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
3d60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3d70 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
3d80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3d90 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
3da0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3db0 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
3dc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3dd0 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
3de0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3df0 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
3e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3e10 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
3e20 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3e30 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
3e40 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3e50 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
3e60 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
3e70 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
3e80 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
3e90 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
3ea0 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
3eb0 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
3ec0 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
3ed0 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
3ee0 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
3ef0 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
3f00 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
3f10 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
3f20 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
3f30 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
getchx:
.s0:
18a9 : 20 b3 18 JSR $18b3 ; (getpch + 0)
18ac : 85 3b __ STA ACCU + 0 
18ae : a9 00 __ LDA #$00
18b0 : 85 3c __ STA ACCU + 1 
.s1001:
18b2 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
18b3 : 20 e4 ff JSR $ffe4 
18b6 : ae f3 1d LDX $1df3 ; (giocharmap + 0)
18b9 : e0 01 __ CPX #$01
18bb : 90 26 __ BCC $18e3 ; (getpch + 48)
18bd : c9 0d __ CMP #$0d
18bf : d0 02 __ BNE $18c3 ; (getpch + 16)
18c1 : a9 0a __ LDA #$0a
18c3 : e0 02 __ CPX #$02
18c5 : 90 1c __ BCC $18e3 ; (getpch + 48)
18c7 : c9 db __ CMP #$db
18c9 : b0 18 __ BCS $18e3 ; (getpch + 48)
18cb : c9 41 __ CMP #$41
18cd : 90 14 __ BCC $18e3 ; (getpch + 48)
18cf : c9 c1 __ CMP #$c1
18d1 : 90 02 __ BCC $18d5 ; (getpch + 34)
18d3 : 49 a0 __ EOR #$a0
18d5 : c9 7b __ CMP #$7b
18d7 : b0 0a __ BCS $18e3 ; (getpch + 48)
18d9 : c9 61 __ CMP #$61
18db : b0 04 __ BCS $18e1 ; (getpch + 46)
18dd : c9 5b __ CMP #$5b
18df : b0 02 __ BCS $18e3 ; (getpch + 48)
18e1 : 49 20 __ EOR #$20
18e3 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
1df3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
1df4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
1df6 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
Phase2:
1df8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
18e4 : a9 33 __ LDA #$33
18e6 : 85 2d __ STA P0 
18e8 : a9 34 __ LDA #$34
18ea : 85 2e __ STA P1 
18ec : a9 01 __ LDA #$01
18ee : 85 2f __ STA P2 
18f0 : a6 32 __ LDX P5 ; (p + 0)
18f2 : bd 00 40 LDA $4000,x ; (sintab + 0)
18f5 : 4a __ __ LSR
18f6 : 4a __ __ LSR
18f7 : 4a __ __ LSR
18f8 : 49 10 __ EOR #$10
18fa : 38 __ __ SEC
18fb : e9 10 __ SBC #$10
18fd : 18 __ __ CLC
18fe : 69 b4 __ ADC #$b4
1900 : 85 30 __ STA P3 
1902 : a9 00 __ LDA #$00
1904 : 85 31 __ STA P4 
1906 : 20 b3 17 JSR $17b3 ; (vera_spr_move.s0 + 0)
1909 : a9 34 __ LDA #$34
190b : 85 2d __ STA P0 
190d : a9 1c __ LDA #$1c
190f : 85 2e __ STA P1 
1911 : a6 34 __ LDX P7 ; (p2 + 0)
1913 : bd 00 40 LDA $4000,x ; (sintab + 0)
1916 : 4a __ __ LSR
1917 : 4a __ __ LSR
1918 : 4a __ __ LSR
1919 : 49 10 __ EOR #$10
191b : 38 __ __ SEC
191c : e9 10 __ SBC #$10
191e : 18 __ __ CLC
191f : 69 b4 __ ADC #$b4
1921 : 85 30 __ STA P3 
1923 : 4c b3 17 JMP $17b3 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4000 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4010 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4020 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4030 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4040 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4050 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4060 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4070 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4080 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4090 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
40a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
40b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
40c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
40d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
40e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
40f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
PlayZSM:
.s0:
1926 : 20 57 19 JSR $1957 ; (zsm_check.s0 + 0)
1929 : 09 00 __ ORA #$00
192b : d0 01 __ BNE $192e ; (PlayZSM.s1 + 0)
.s1001:
192d : 60 __ __ RTS
.s1:
192e : a5 33 __ LDA P6 ; (TuneSelection + 1)
1930 : 05 32 __ ORA P5 ; (TuneSelection + 0)
1932 : d0 07 __ BNE $193b ; (PlayZSM.s11 + 0)
.s7:
1934 : a9 1b __ LDA #$1b
1936 : a0 00 __ LDY #$00
1938 : 4c 50 19 JMP $1950 ; (PlayZSM.s15 + 0)
.s11:
193b : a5 33 __ LDA P6 ; (TuneSelection + 1)
193d : d0 06 __ BNE $1945 ; (PlayZSM.s5 + 0)
.s1002:
193f : a5 32 __ LDA P5 ; (TuneSelection + 0)
1941 : c9 01 __ CMP #$01
1943 : f0 07 __ BEQ $194c ; (PlayZSM.s9 + 0)
.s5:
1945 : a9 1a __ LDA #$1a
1947 : a0 c8 __ LDY #$c8
1949 : 4c 50 19 JMP $1950 ; (PlayZSM.s15 + 0)
.s9:
194c : a9 1b __ LDA #$1b
194e : a0 1e __ LDY #$1e
.s15:
1950 : 84 30 __ STY P3 
1952 : 85 31 __ STA P4 
1954 : 4c 5b 19 JMP $195b ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1957 : ad 83 1d LDA $1d83 ; (zsm_finished + 0)
.s1001:
195a : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
195b : a9 01 __ LDA #$01
195d : 8d 83 1d STA $1d83 ; (zsm_finished + 0)
1960 : ad fa 1d LDA $1dfa ; (zsm_reading + 0)
1963 : f0 0a __ BEQ $196f ; (zsm_init.s3 + 0)
.s1:
1965 : a9 02 __ LDA #$02
1967 : 20 b4 19 JSR $19b4 ; (krnio_close.s1000 + 0)
196a : a9 00 __ LDA #$00
196c : 8d fa 1d STA $1dfa ; (zsm_reading + 0)
.s3:
196f : 8d 01 45 STA $4501 ; (zsm_pos + 0)
1972 : 8d 02 45 STA $4502 ; (zsm_pos + 1)
1975 : 8d 03 45 STA $4503 ; (zsm_wpos + 0)
1978 : 8d 04 45 STA $4504 ; (zsm_wpos + 1)
197b : 8d 00 41 STA $4100 ; (zsm_delay + 0)
197e : a5 30 __ LDA P3 ; (fname + 0)
1980 : 85 2d __ STA P0 
1982 : a5 31 __ LDA P4 ; (fname + 1)
1984 : 85 2e __ STA P1 
1986 : 20 bc 19 JSR $19bc ; (krnio_setnam.s0 + 0)
1989 : a9 02 __ LDA #$02
198b : 85 2d __ STA P0 
198d : 85 2f __ STA P2 
198f : a9 08 __ LDA #$08
1991 : 85 2e __ STA P1 
1993 : 20 d2 19 JSR $19d2 ; (krnio_open.s0 + 0)
1996 : a5 3b __ LDA ACCU + 0 
1998 : f0 19 __ BEQ $19b3 ; (zsm_init.s1001 + 0)
.s4:
199a : a9 01 __ LDA #$01
199c : 8d fa 1d STA $1dfa ; (zsm_reading + 0)
199f : 20 fa 19 JSR $19fa ; (zsm_fill.s0 + 0)
19a2 : a9 10 __ LDA #$10
19a4 : 8d 01 45 STA $4501 ; (zsm_pos + 0)
19a7 : a9 00 __ LDA #$00
19a9 : 8d 02 45 STA $4502 ; (zsm_pos + 1)
19ac : 8d 83 1d STA $1d83 ; (zsm_finished + 0)
19af : a9 01 __ LDA #$01
19b1 : 85 3b __ STA ACCU + 0 
.s1001:
19b3 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
1dfa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
19b4 : 85 2d __ STA P0 
.s0:
19b6 : a5 2d __ LDA P0 
19b8 : 20 c3 ff JSR $ffc3 
.s1001:
19bb : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
4503 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
19bc : a5 2d __ LDA P0 
19be : 05 2e __ ORA P1 
19c0 : f0 08 __ BEQ $19ca ; (krnio_setnam.s0 + 14)
19c2 : a0 ff __ LDY #$ff
19c4 : c8 __ __ INY
19c5 : b1 2d __ LDA (P0),y 
19c7 : d0 fb __ BNE $19c4 ; (krnio_setnam.s0 + 8)
19c9 : 98 __ __ TYA
19ca : a6 2d __ LDX P0 
19cc : a4 2e __ LDY P1 
19ce : 20 bd ff JSR $ffbd 
.s1001:
19d1 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
19d2 : a9 00 __ LDA #$00
19d4 : a6 2d __ LDX P0 ; (fnum + 0)
19d6 : 9d 05 45 STA $4505,x ; (krnio_pstatus + 0)
19d9 : a9 00 __ LDA #$00
19db : 85 3b __ STA ACCU + 0 
19dd : 85 3c __ STA ACCU + 1 
19df : a5 2d __ LDA P0 ; (fnum + 0)
19e1 : a6 2e __ LDX P1 
19e3 : a4 2f __ LDY P2 
19e5 : 20 ba ff JSR $ffba 
19e8 : 20 c0 ff JSR $ffc0 
19eb : 90 08 __ BCC $19f5 ; (krnio_open.s0 + 35)
19ed : a5 2d __ LDA P0 ; (fnum + 0)
19ef : 20 c3 ff JSR $ffc3 
19f2 : 4c f9 19 JMP $19f9 ; (krnio_open.s1001 + 0)
19f5 : a9 01 __ LDA #$01
19f7 : 85 3b __ STA ACCU + 0 
.s1001:
19f9 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
4505 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
19fa : ad fa 1d LDA $1dfa ; (zsm_reading + 0)
19fd : f0 20 __ BEQ $1a1f ; (zsm_fill.s1 + 0)
.s2:
19ff : ad 02 45 LDA $4502 ; (zsm_pos + 1)
1a02 : 18 __ __ CLC
1a03 : 69 04 __ ADC #$04
1a05 : cd 04 45 CMP $4504 ; (zsm_wpos + 1)
1a08 : d0 0c __ BNE $1a16 ; (zsm_fill.s6 + 0)
.s1006:
1a0a : ad 03 45 LDA $4503 ; (zsm_wpos + 0)
1a0d : cd 01 45 CMP $4501 ; (zsm_pos + 0)
1a10 : d0 04 __ BNE $1a16 ; (zsm_fill.s6 + 0)
.s5:
1a12 : a9 00 __ LDA #$00
1a14 : f0 0b __ BEQ $1a21 ; (zsm_fill.s1008 + 0)
.s6:
1a16 : a9 02 __ LDA #$02
1a18 : 20 9e 1a JSR $1a9e ; (krnio_chkin.s1000 + 0)
1a1b : a5 3b __ LDA ACCU + 0 
1a1d : d0 07 __ BNE $1a26 ; (zsm_fill.s9 + 0)
.s1:
1a1f : a9 ff __ LDA #$ff
.s1008:
1a21 : 85 3b __ STA ACCU + 0 
.s1001:
1a23 : 85 3c __ STA ACCU + 1 
1a25 : 60 __ __ RTS
.s9:
1a26 : a9 00 __ LDA #$00
1a28 : 85 47 __ STA T1 + 0 
1a2a : 85 48 __ STA T1 + 1 
1a2c : ad 02 45 LDA $4502 ; (zsm_pos + 1)
1a2f : 18 __ __ CLC
1a30 : 69 04 __ ADC #$04
1a32 : cd 04 45 CMP $4504 ; (zsm_wpos + 1)
1a35 : d0 08 __ BNE $1a3f ; (zsm_fill.l13 + 0)
.s1002:
1a37 : ad 03 45 LDA $4503 ; (zsm_wpos + 0)
1a3a : cd 01 45 CMP $4501 ; (zsm_pos + 0)
1a3d : f0 49 __ BEQ $1a88 ; (zsm_fill.s37 + 0)
.l13:
1a3f : 20 b0 1a JSR $1ab0 ; (krnio_chrin.s0 + 0)
1a42 : ad 03 45 LDA $4503 ; (zsm_wpos + 0)
1a45 : aa __ __ TAX
1a46 : 18 __ __ CLC
1a47 : 69 01 __ ADC #$01
1a49 : 8d 03 45 STA $4503 ; (zsm_wpos + 0)
1a4c : ad 04 45 LDA $4504 ; (zsm_wpos + 1)
1a4f : a8 __ __ TAY
1a50 : 69 00 __ ADC #$00
1a52 : 8d 04 45 STA $4504 ; (zsm_wpos + 1)
1a55 : 8a __ __ TXA
1a56 : 18 __ __ CLC
1a57 : 69 01 __ ADC #$01
1a59 : 85 49 __ STA T3 + 0 
1a5b : 98 __ __ TYA
1a5c : 29 03 __ AND #$03
1a5e : 69 41 __ ADC #$41
1a60 : 85 4a __ STA T3 + 1 
1a62 : a5 3b __ LDA ACCU + 0 
1a64 : a0 00 __ LDY #$00
1a66 : 91 49 __ STA (T3 + 0),y 
1a68 : e6 47 __ INC T1 + 0 
1a6a : d0 02 __ BNE $1a6e ; (zsm_fill.s1010 + 0)
.s1009:
1a6c : e6 48 __ INC T1 + 1 
.s1010:
1a6e : 20 ba 1a JSR $1aba ; (krnio_status.s0 + 0)
1a71 : a5 3b __ LDA ACCU + 0 
1a73 : d0 0e __ BNE $1a83 ; (zsm_fill.s15 + 0)
.s12:
1a75 : ad 02 45 LDA $4502 ; (zsm_pos + 1)
1a78 : 18 __ __ CLC
1a79 : 69 04 __ ADC #$04
1a7b : cd 04 45 CMP $4504 ; (zsm_wpos + 1)
1a7e : d0 bf __ BNE $1a3f ; (zsm_fill.l13 + 0)
1a80 : 4c 37 1a JMP $1a37 ; (zsm_fill.s1002 + 0)
.s15:
1a83 : a9 00 __ LDA #$00
1a85 : 8d fa 1d STA $1dfa ; (zsm_reading + 0)
.s37:
1a88 : 20 c4 1a JSR $1ac4 ; (krnio_clrchn.s0 + 0)
1a8b : ad fa 1d LDA $1dfa ; (zsm_reading + 0)
1a8e : d0 05 __ BNE $1a95 ; (zsm_fill.s21 + 0)
.s19:
1a90 : a9 02 __ LDA #$02
1a92 : 20 b4 19 JSR $19b4 ; (krnio_close.s1000 + 0)
.s21:
1a95 : a5 47 __ LDA T1 + 0 
1a97 : 85 3b __ STA ACCU + 0 
1a99 : a5 48 __ LDA T1 + 1 
1a9b : 4c 23 1a JMP $1a23 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a9e : 85 2d __ STA P0 
.s0:
1aa0 : a6 2d __ LDX P0 
1aa2 : 20 c6 ff JSR $ffc6 
1aa5 : a9 00 __ LDA #$00
1aa7 : 85 3c __ STA ACCU + 1 
1aa9 : b0 02 __ BCS $1aad ; (krnio_chkin.s0 + 13)
1aab : a9 01 __ LDA #$01
1aad : 85 3b __ STA ACCU + 0 
.s1001:
1aaf : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1ab0 : 20 cf ff JSR $ffcf 
1ab3 : 85 3b __ STA ACCU + 0 
1ab5 : a9 00 __ LDA #$00
1ab7 : 85 3c __ STA ACCU + 1 
.s1001:
1ab9 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1aba : 20 b7 ff JSR $ffb7 
1abd : 85 3b __ STA ACCU + 0 
1abf : a9 00 __ LDA #$00
1ac1 : 85 3c __ STA ACCU + 1 
.s1001:
1ac3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1ac4 : 20 cc ff JSR $ffcc 
.s1001:
1ac7 : 60 __ __ RTS
--------------------------------------------------------------------
1ac8 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1ad8 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1b00 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1b10 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1b1e : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1b2e : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1b3e : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
PalTimer:
1dfb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
3f40 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
3f50 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1b43 : a9 10 __ LDA #$10
1b45 : 85 30 __ STA P3 
1b47 : a9 00 __ LDA #$00
1b49 : 85 31 __ STA P4 
1b4b : a5 32 __ LDA P5 ; (Palette + 0)
1b4d : 85 2e __ STA P1 
1b4f : 85 47 __ STA T0 + 0 
1b51 : a5 33 __ LDA P6 ; (Palette + 1)
1b53 : 85 2f __ STA P2 
1b55 : 85 48 __ STA T0 + 1 
1b57 : a5 34 __ LDA P7 ; (index + 0)
1b59 : 85 2d __ STA P0 
1b5b : ad fc 9e LDA $9efc ; (sstack + 0)
1b5e : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b60 : 0a __ __ ASL
1b61 : 85 49 __ STA T3 + 0 
1b63 : ad fd 9e LDA $9efd ; (sstack + 1)
1b66 : 2a __ __ ROL
1b67 : 18 __ __ CLC
1b68 : 65 33 __ ADC P6 ; (Palette + 1)
1b6a : 85 4a __ STA T3 + 1 
1b6c : a4 32 __ LDY P5 ; (Palette + 0)
1b6e : b1 49 __ LDA (T3 + 0),y 
1b70 : aa __ __ TAX
1b71 : c8 __ __ INY
1b72 : b1 49 __ LDA (T3 + 0),y 
1b74 : 86 49 __ STX T3 + 0 
1b76 : 85 4a __ STA T3 + 1 
1b78 : a9 00 __ LDA #$00
1b7a : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b7c : ad fe 9e LDA $9efe ; (sstack + 2)
1b7f : 85 4b __ STA T5 + 0 
1b81 : 38 __ __ SEC
1b82 : e9 01 __ SBC #$01
1b84 : 85 4d __ STA T6 + 0 
1b86 : ad ff 9e LDA $9eff ; (sstack + 3)
1b89 : 85 4c __ STA T5 + 1 
1b8b : e9 00 __ SBC #$00
1b8d : 85 4e __ STA T6 + 1 
1b8f : d0 06 __ BNE $1b97 ; (SetPaletteIndex.s5 + 0)
.s1004:
1b91 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b93 : c5 4d __ CMP T6 + 0 
1b95 : b0 38 __ BCS $1bcf ; (SetPaletteIndex.s4 + 0)
.s5:
1b97 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1b99 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1b9b : 18 __ __ CLC
1b9c : a5 32 __ LDA P5 ; (Palette + 0)
1b9e : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1ba0 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1ba2 : a5 33 __ LDA P6 ; (Palette + 1)
1ba4 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1ba6 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1ba8 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1bab : a0 02 __ LDY #$02
1bad : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1baf : a0 00 __ LDY #$00
1bb1 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1bb3 : a0 03 __ LDY #$03
1bb5 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1bb7 : a0 01 __ LDY #$01
1bb9 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1bbb : 18 __ __ CLC
1bbc : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1bbe : 69 02 __ ADC #$02
1bc0 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1bc2 : 90 02 __ BCC $1bc6 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1bc4 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1bc6 : e8 __ __ INX
1bc7 : a5 4e __ LDA T6 + 1 
1bc9 : d0 e0 __ BNE $1bab ; (SetPaletteIndex.l2 + 0)
.s1002:
1bcb : e4 4d __ CPX T6 + 0 
1bcd : 90 dc __ BCC $1bab ; (SetPaletteIndex.l2 + 0)
.s4:
1bcf : a5 4b __ LDA T5 + 0 
1bd1 : 0a __ __ ASL
1bd2 : aa __ __ TAX
1bd3 : a5 4c __ LDA T5 + 1 
1bd5 : 2a __ __ ROL
1bd6 : a8 __ __ TAY
1bd7 : 8a __ __ TXA
1bd8 : 38 __ __ SEC
1bd9 : e9 02 __ SBC #$02
1bdb : b0 01 __ BCS $1bde ; (SetPaletteIndex.s1010 + 0)
.s1009:
1bdd : 88 __ __ DEY
.s1010:
1bde : 18 __ __ CLC
1bdf : 65 47 __ ADC T0 + 0 
1be1 : 85 47 __ STA T0 + 0 
1be3 : 98 __ __ TYA
1be4 : 65 48 __ ADC T0 + 1 
1be6 : 85 48 __ STA T0 + 1 
1be8 : a5 49 __ LDA T3 + 0 
1bea : a0 00 __ LDY #$00
1bec : 91 47 __ STA (T0 + 0),y 
1bee : a5 4a __ LDA T3 + 1 
1bf0 : c8 __ __ INY
1bf1 : 91 47 __ STA (T0 + 0),y 
1bf3 : 4c 39 18 JMP $1839 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
1dfd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
3f60 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
3f70 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
1dff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
3f80 : __ __ __ BYT 23 02 12 01 01 01 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
3f90 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
BGPalShimmer:
3fa0 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
3fb0 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
Control:
.s0:
1bf6 : a5 31 __ LDA P4 ; (Input + 0)
1bf8 : c9 20 __ CMP #$20
1bfa : d0 1c __ BNE $1c18 ; (Control.s1007 + 0)
.s1:
1bfc : a5 30 __ LDA P3 ; (playing + 0)
1bfe : d0 0a __ BNE $1c0a ; (Control.s4 + 0)
.s5:
1c00 : a9 01 __ LDA #$01
1c02 : 20 9e 1c JSR $1c9e ; (zsm_irq_play.s0 + 0)
1c05 : a9 01 __ LDA #$01
.s1001:
1c07 : 85 3b __ STA ACCU + 0 
1c09 : 60 __ __ RTS
.s4:
1c0a : a9 00 __ LDA #$00
1c0c : cd c0 3f CMP $3fc0 ; (paused + 0)
1c0f : 2a __ __ ROL
1c10 : 8d c0 3f STA $3fc0 ; (paused + 0)
1c13 : 85 2f __ STA P2 
1c15 : 20 1d 1c JSR $1c1d ; (zsm_pause.s0 + 0)
.s1007:
1c18 : a5 30 __ LDA P3 ; (playing + 0)
1c1a : 4c 07 1c JMP $1c07 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
3fc0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1c1d : a5 2f __ LDA P2 ; (pause + 0)
1c1f : d0 0e __ BNE $1c2f ; (zsm_pause.s4 + 0)
.s8:
1c21 : ad 84 1d LDA $1d84 ; (zsm_paused + 0)
1c24 : f0 08 __ BEQ $1c2e ; (zsm_pause.s1001 + 0)
.s5:
1c26 : 20 71 1c JSR $1c71 ; (zsm_restore_volume.s0 + 0)
1c29 : a9 00 __ LDA #$00
1c2b : 8d 84 1d STA $1d84 ; (zsm_paused + 0)
.s1001:
1c2e : 60 __ __ RTS
.s4:
1c2f : ad 84 1d LDA $1d84 ; (zsm_paused + 0)
1c32 : d0 fa __ BNE $1c2e ; (zsm_pause.s1001 + 0)
.s1:
1c34 : a9 01 __ LDA #$01
1c36 : 8d 84 1d STA $1d84 ; (zsm_paused + 0)
1c39 : 20 e6 1a JSR $1ae6 ; (zsm_silence.s0 + 0)
1c3c : 4c 3f 1c JMP $1c3f ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_silence:
.s0:
1ae6 : a9 00 __ LDA #$00
1ae8 : 85 47 __ STA T0 + 0 
1aea : a9 08 __ LDA #$08
1aec : 85 2d __ STA P0 
1aee : a9 00 __ LDA #$00
.l1006:
1af0 : 85 2e __ STA P1 
1af2 : 20 ef 0d JSR $0def ; (sfx_put.l1 + 0)
1af5 : e6 47 __ INC T0 + 0 
1af7 : a5 47 __ LDA T0 + 0 
1af9 : c9 08 __ CMP #$08
1afb : 90 f3 __ BCC $1af0 ; (zsm_silence.l1006 + 0)
.s1001:
1afd : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1c3f : a0 00 __ LDY #$00
1c41 : 84 3c __ STY ACCU + 1 
1c43 : a2 02 __ LDX #$02
1c45 : 18 __ __ CLC
.l1006:
1c46 : 8a __ __ TXA
1c47 : 09 c0 __ ORA #$c0
1c49 : 8d 20 9f STA $9f20 
1c4c : a5 3c __ LDA ACCU + 1 
1c4e : 09 f9 __ ORA #$f9
1c50 : 8d 21 9f STA $9f21 
1c53 : a9 01 __ LDA #$01
1c55 : 8d 22 9f STA $9f22 
1c58 : ad 23 9f LDA $9f23 
1c5b : 99 15 45 STA $4515,y ; (vera_volumes + 0)
1c5e : a9 00 __ LDA #$00
1c60 : 8d 23 9f STA $9f23 
1c63 : 8a __ __ TXA
1c64 : 69 04 __ ADC #$04
1c66 : aa __ __ TAX
1c67 : 90 02 __ BCC $1c6b ; (zsm_save_volume.s1009 + 0)
.s1008:
1c69 : e6 3c __ INC ACCU + 1 
.s1009:
1c6b : c8 __ __ INY
1c6c : c0 10 __ CPY #$10
1c6e : 90 d6 __ BCC $1c46 ; (zsm_save_volume.l1006 + 0)
.s1001:
1c70 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
4515 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1c71 : a0 00 __ LDY #$00
1c73 : 84 3c __ STY ACCU + 1 
1c75 : a2 02 __ LDX #$02
1c77 : 18 __ __ CLC
.l1006:
1c78 : 8a __ __ TXA
1c79 : 09 c0 __ ORA #$c0
1c7b : 8d 20 9f STA $9f20 
1c7e : a5 3c __ LDA ACCU + 1 
1c80 : 09 f9 __ ORA #$f9
1c82 : 8d 21 9f STA $9f21 
1c85 : a9 01 __ LDA #$01
1c87 : 8d 22 9f STA $9f22 
1c8a : b9 15 45 LDA $4515,y ; (vera_volumes + 0)
1c8d : 8d 23 9f STA $9f23 
1c90 : 8a __ __ TXA
1c91 : 69 04 __ ADC #$04
1c93 : aa __ __ TAX
1c94 : 90 02 __ BCC $1c98 ; (zsm_restore_volume.s1009 + 0)
.s1008:
1c96 : e6 3c __ INC ACCU + 1 
.s1009:
1c98 : c8 __ __ INY
1c99 : c0 10 __ CPY #$10
1c9b : 90 db __ BCC $1c78 ; (zsm_restore_volume.l1006 + 0)
.s1001:
1c9d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1c9e : 8d ff 1a STA $1aff ; (zsm_playing + 0)
.s1001:
1ca1 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
3fc1 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
4525 : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
3fc3 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
3fd3 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
3fe3 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
3ff3 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
1ca2 : ad 26 9f LDA $9f26 
1ca5 : 29 40 __ AND #$40
1ca7 : d0 f9 __ BNE $1ca2 ; (frame_wait.l1 + 0)
.l4:
1ca9 : ad 26 9f LDA $9f26 
1cac : 29 40 __ AND #$40
1cae : f0 f9 __ BEQ $1ca9 ; (frame_wait.l4 + 0)
.s1001:
1cb0 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1cb1 : 38 __ __ SEC
1cb2 : a9 00 __ LDA #$00
1cb4 : e5 3b __ SBC ACCU + 0 
1cb6 : 85 3b __ STA ACCU + 0 
1cb8 : a9 00 __ LDA #$00
1cba : e5 3c __ SBC ACCU + 1 
1cbc : 85 3c __ STA ACCU + 1 
1cbe : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1cbf : 38 __ __ SEC
1cc0 : a9 00 __ LDA #$00
1cc2 : e5 23 __ SBC WORK + 0 
1cc4 : 85 23 __ STA WORK + 0 
1cc6 : a9 00 __ LDA #$00
1cc8 : e5 24 __ SBC WORK + 1 
1cca : 85 24 __ STA WORK + 1 
1ccc : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1ccd : a5 3c __ LDA ACCU + 1 
1ccf : d0 31 __ BNE $1d02 ; (divmod + 53)
1cd1 : a5 24 __ LDA WORK + 1 
1cd3 : d0 1e __ BNE $1cf3 ; (divmod + 38)
1cd5 : 85 26 __ STA WORK + 3 
1cd7 : a2 04 __ LDX #$04
1cd9 : 06 3b __ ASL ACCU + 0 
1cdb : 2a __ __ ROL
1cdc : c5 23 __ CMP WORK + 0 
1cde : 90 02 __ BCC $1ce2 ; (divmod + 21)
1ce0 : e5 23 __ SBC WORK + 0 
1ce2 : 26 3b __ ROL ACCU + 0 
1ce4 : 2a __ __ ROL
1ce5 : c5 23 __ CMP WORK + 0 
1ce7 : 90 02 __ BCC $1ceb ; (divmod + 30)
1ce9 : e5 23 __ SBC WORK + 0 
1ceb : 26 3b __ ROL ACCU + 0 
1ced : ca __ __ DEX
1cee : d0 eb __ BNE $1cdb ; (divmod + 14)
1cf0 : 85 25 __ STA WORK + 2 
1cf2 : 60 __ __ RTS
1cf3 : a5 3b __ LDA ACCU + 0 
1cf5 : 85 25 __ STA WORK + 2 
1cf7 : a5 3c __ LDA ACCU + 1 
1cf9 : 85 26 __ STA WORK + 3 
1cfb : a9 00 __ LDA #$00
1cfd : 85 3b __ STA ACCU + 0 
1cff : 85 3c __ STA ACCU + 1 
1d01 : 60 __ __ RTS
1d02 : a5 24 __ LDA WORK + 1 
1d04 : d0 1f __ BNE $1d25 ; (divmod + 88)
1d06 : a5 23 __ LDA WORK + 0 
1d08 : 30 1b __ BMI $1d25 ; (divmod + 88)
1d0a : a9 00 __ LDA #$00
1d0c : 85 26 __ STA WORK + 3 
1d0e : a2 10 __ LDX #$10
1d10 : 06 3b __ ASL ACCU + 0 
1d12 : 26 3c __ ROL ACCU + 1 
1d14 : 2a __ __ ROL
1d15 : c5 23 __ CMP WORK + 0 
1d17 : 90 02 __ BCC $1d1b ; (divmod + 78)
1d19 : e5 23 __ SBC WORK + 0 
1d1b : 26 3b __ ROL ACCU + 0 
1d1d : 26 3c __ ROL ACCU + 1 
1d1f : ca __ __ DEX
1d20 : d0 f2 __ BNE $1d14 ; (divmod + 71)
1d22 : 85 25 __ STA WORK + 2 
1d24 : 60 __ __ RTS
1d25 : a9 00 __ LDA #$00
1d27 : 85 25 __ STA WORK + 2 
1d29 : 85 26 __ STA WORK + 3 
1d2b : 84 22 __ STY $22 
1d2d : a0 10 __ LDY #$10
1d2f : 18 __ __ CLC
1d30 : 26 3b __ ROL ACCU + 0 
1d32 : 26 3c __ ROL ACCU + 1 
1d34 : 26 25 __ ROL WORK + 2 
1d36 : 26 26 __ ROL WORK + 3 
1d38 : 38 __ __ SEC
1d39 : a5 25 __ LDA WORK + 2 
1d3b : e5 23 __ SBC WORK + 0 
1d3d : aa __ __ TAX
1d3e : a5 26 __ LDA WORK + 3 
1d40 : e5 24 __ SBC WORK + 1 
1d42 : 90 04 __ BCC $1d48 ; (divmod + 123)
1d44 : 86 25 __ STX WORK + 2 
1d46 : 85 26 __ STA WORK + 3 
1d48 : 88 __ __ DEY
1d49 : d0 e5 __ BNE $1d30 ; (divmod + 99)
1d4b : 26 3b __ ROL ACCU + 0 
1d4d : 26 3c __ ROL ACCU + 1 
1d4f : a4 22 __ LDY $22 
1d51 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1d52 : 24 3c __ BIT ACCU + 1 
1d54 : 10 0d __ BPL $1d63 ; (mods16 + 17)
1d56 : 20 b1 1c JSR $1cb1 ; (negaccu + 0)
1d59 : 24 24 __ BIT WORK + 1 
1d5b : 10 0d __ BPL $1d6a ; (mods16 + 24)
1d5d : 20 bf 1c JSR $1cbf ; (negtmp + 0)
1d60 : 4c cd 1c JMP $1ccd ; (divmod + 0)
1d63 : 24 24 __ BIT WORK + 1 
1d65 : 10 f9 __ BPL $1d60 ; (mods16 + 14)
1d67 : 20 bf 1c JSR $1cbf ; (negtmp + 0)
1d6a : 20 cd 1c JSR $1ccd ; (divmod + 0)
1d6d : 38 __ __ SEC
1d6e : a9 00 __ LDA #$00
1d70 : e5 25 __ SBC WORK + 2 
1d72 : 85 25 __ STA WORK + 2 
1d74 : a9 00 __ LDA #$00
1d76 : e5 26 __ SBC WORK + 3 
1d78 : 85 26 __ STA WORK + 3 
1d7a : 60 __ __ RTS
--------------------------------------------------------------------
__multab10L:
1d7b : __ __ __ BYT 00 0a 14 1e 28 32 3c 46                         : ....(2<F
