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
080e : 8e 89 1a STX $1a89 ; (spentry + 0)
0811 : a9 3b __ LDA #$3b
0813 : 85 39 __ STA IP + 0 
0815 : a9 38 __ LDA #$38
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 3c __ LDA #$3c
081c : e9 38 __ SBC #$38
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
0830 : a9 3b __ LDA #$3b
0832 : e9 3b __ SBC #$3b
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
084b : a9 aa __ LDA #$aa
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
1a89 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 68 0b JSR $0b68 ; (zsm_irq_init.s0 + 0)
0883 : 20 3c 0d JSR $0d3c ; (ClearVERAScreen.s0 + 0)
0886 : 20 7f 0d JSR $0d7f ; (SetUpSprites.s0 + 0)
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
08b7 : 8d 20 9f STA $9f20 
08ba : 8d 21 9f STA $9f21 
08bd : 8d ac 9e STA $9eac ; (Buildings + 0)
08c0 : 8d ad 9e STA $9ead ; (Buildings + 1)
08c3 : 8d af 9e STA $9eaf ; (Buildings + 3)
08c6 : 8d b1 9e STA $9eb1 ; (Buildings + 5)
08c9 : 8d b3 9e STA $9eb3 ; (Buildings + 7)
08cc : 8d b5 9e STA $9eb5 ; (Buildings + 9)
08cf : 8d b6 9e STA $9eb6 ; (Buildings + 10)
08d2 : 8d b7 9e STA $9eb7 ; (Buildings + 11)
08d5 : 8d b9 9e STA $9eb9 ; (Buildings + 13)
08d8 : 8d bb 9e STA $9ebb ; (Buildings + 15)
08db : 8d bd 9e STA $9ebd ; (Buildings + 17)
08de : 8d bf 9e STA $9ebf ; (Buildings + 19)
08e1 : a9 30 __ LDA #$30
08e3 : 8d ae 9e STA $9eae ; (Buildings + 2)
08e6 : a9 20 __ LDA #$20
08e8 : 8d b0 9e STA $9eb0 ; (Buildings + 4)
08eb : 8d b4 9e STA $9eb4 ; (Buildings + 8)
08ee : 8d ba 9e STA $9eba ; (Buildings + 14)
08f1 : 8d be 9e STA $9ebe ; (Buildings + 18)
08f4 : a9 10 __ LDA #$10
08f6 : 8d b2 9e STA $9eb2 ; (Buildings + 6)
08f9 : 8d bc 9e STA $9ebc ; (Buildings + 16)
08fc : a9 60 __ LDA #$60
08fe : 8d b8 9e STA $9eb8 ; (Buildings + 12)
0901 : a9 00 __ LDA #$00
0903 : 85 51 __ STA T1 + 0 
0905 : 85 52 __ STA T2 + 0 
.l2:
0907 : a9 30 __ LDA #$30
0909 : 8d 2c 9f STA $9f2c 
090c : ee fb 1a INC $1afb ; (p + 0)
090f : d0 03 __ BNE $0914 ; (main.s1019 + 0)
.s1018:
0911 : ee fc 1a INC $1afc ; (p + 1)
.s1019:
0914 : a5 51 __ LDA T1 + 0 
0916 : f0 03 __ BEQ $091b ; (main.s5 + 0)
0918 : 4c 5a 0b JMP $0b5a ; (main.s4 + 0)
.s5:
091b : a9 20 __ LDA #$20
091d : 85 37 __ STA P10 
091f : a9 a0 __ LDA #$a0
0921 : 8d fc 9e STA $9efc ; (sstack + 0)
0924 : a9 fa __ LDA #$fa
0926 : 8d fd 9e STA $9efd ; (sstack + 1)
0929 : a9 01 __ LDA #$01
092b : 8d fe 9e STA $9efe ; (sstack + 2)
092e : a9 00 __ LDA #$00
0930 : 8d ff 9e STA $9eff ; (sstack + 3)
0933 : 8d fd 1a STA $1afd ; (PalTimer + 0)
0936 : 8d fe 1a STA $1afe ; (PalTimer + 1)
0939 : a9 40 __ LDA #$40
093b : 85 35 __ STA P8 
093d : a9 37 __ LDA #$37
093f : 85 36 __ STA P9 
0941 : 20 54 16 JSR $1654 ; (SetPaletteColours.s0 + 0)
.s83:
0944 : e6 52 __ INC T2 + 0 
0946 : a9 02 __ LDA #$02
0948 : c5 52 __ CMP T2 + 0 
094a : 90 03 __ BCC $094f ; (main.s10 + 0)
094c : 4c d7 09 JMP $09d7 ; (main.s12 + 0)
.s10:
094f : a9 10 __ LDA #$10
0951 : 85 34 __ STA P7 
0953 : a9 00 __ LDA #$00
0955 : 85 35 __ STA P8 
0957 : 85 36 __ STA P9 
0959 : 85 37 __ STA P10 
095b : a9 06 __ LDA #$06
095d : 8d fc 9e STA $9efc ; (sstack + 0)
0960 : a9 00 __ LDA #$00
0962 : 8d fd 9e STA $9efd ; (sstack + 1)
0965 : 8d ff 9e STA $9eff ; (sstack + 3)
0968 : a9 0a __ LDA #$0a
096a : 8d fe 9e STA $9efe ; (sstack + 2)
096d : a9 8f __ LDA #$8f
096f : 85 32 __ STA P5 
0971 : a9 1a __ LDA #$1a
0973 : 85 33 __ STA P6 
0975 : 20 7b 16 JSR $167b ; (SetPaletteIndex.s0 + 0)
0978 : a0 00 __ LDY #$00
097a : 84 52 __ STY T2 + 0 
.l14:
097c : be 81 1a LDX $1a81,y ; (__multab10L + 0)
097f : bd ac 9e LDA $9eac,x ; (Buildings + 0)
0982 : 1d ad 9e ORA $9ead,x ; (Buildings + 1)
0985 : d0 4b __ BNE $09d2 ; (main.s15 + 0)
.s18:
0987 : ad 2e 9f LDA $9f2e 
098a : 0a __ __ ASL
098b : 85 4e __ STA T7 + 1 
098d : a9 00 __ LDA #$00
098f : 2a __ __ ROL
0990 : 85 4f __ STA T7 + 2 
0992 : bd b0 9e LDA $9eb0,x ; (Buildings + 4)
0995 : 85 3c __ STA ACCU + 1 
0997 : bd b1 9e LDA $9eb1,x ; (Buildings + 5)
099a : 4a __ __ LSR
099b : 66 3c __ ROR ACCU + 1 
099d : a9 00 __ LDA #$00
099f : 6a __ __ ROR
09a0 : 7d ae 9e ADC $9eae,x ; (Buildings + 2)
09a3 : 85 4d __ STA T7 + 0 
09a5 : bd af 9e LDA $9eaf,x ; (Buildings + 3)
09a8 : 65 3c __ ADC ACCU + 1 
09aa : 18 __ __ CLC
09ab : 65 4e __ ADC T7 + 1 
09ad : 85 4e __ STA T7 + 1 
09af : 90 02 __ BCC $09b3 ; (main.s1023 + 0)
.s1022:
09b1 : e6 4f __ INC T7 + 2 
.s1023:
09b3 : a9 00 __ LDA #$00
09b5 : 85 4c __ STA T6 + 0 
.l19:
09b7 : be 81 1a LDX $1a81,y ; (__multab10L + 0)
09ba : bd b4 9e LDA $9eb4,x ; (Buildings + 8)
09bd : 85 3b __ STA ACCU + 0 
09bf : bd b5 9e LDA $9eb5,x ; (Buildings + 9)
09c2 : f0 03 __ BEQ $09c7 ; (main.s1014 + 0)
09c4 : 4c 04 0b JMP $0b04 ; (main.s20 + 0)
.s1014:
09c7 : 85 3c __ STA ACCU + 1 
09c9 : a5 4c __ LDA T6 + 0 
09cb : c5 3b __ CMP ACCU + 0 
09cd : b0 03 __ BCS $09d2 ; (main.s15 + 0)
09cf : 4c 04 0b JMP $0b04 ; (main.s20 + 0)
.s15:
09d2 : c8 __ __ INY
09d3 : c0 08 __ CPY #$08
09d5 : 90 a5 __ BCC $097c ; (main.l14 + 0)
.s12:
09d7 : ad fe 1a LDA $1afe ; (PalTimer + 1)
09da : 30 5f __ BMI $0a3b ; (main.s89 + 0)
.s1009:
09dc : d0 07 __ BNE $09e5 ; (main.s31 + 0)
.s1008:
09de : a9 03 __ LDA #$03
09e0 : cd fd 1a CMP $1afd ; (PalTimer + 0)
09e3 : b0 56 __ BCS $0a3b ; (main.s89 + 0)
.s31:
09e5 : a9 60 __ LDA #$60
09e7 : 85 34 __ STA P7 
09e9 : a9 00 __ LDA #$00
09eb : 85 35 __ STA P8 
09ed : 85 36 __ STA P9 
09ef : 85 37 __ STA P10 
09f1 : 8d fc 9e STA $9efc ; (sstack + 0)
09f4 : 8d fd 9e STA $9efd ; (sstack + 1)
09f7 : a9 05 __ LDA #$05
09f9 : 8d fe 9e STA $9efe ; (sstack + 2)
09fc : a9 00 __ LDA #$00
09fe : 8d ff 9e STA $9eff ; (sstack + 3)
0a01 : ee 60 37 INC $3760 ; (PalIndex + 0)
0a04 : d0 03 __ BNE $0a09 ; (main.s1027 + 0)
.s1026:
0a06 : ee 61 37 INC $3761 ; (PalIndex + 1)
.s1027:
0a09 : a9 ef __ LDA #$ef
0a0b : 85 32 __ STA P5 
0a0d : a9 1a __ LDA #$1a
0a0f : 85 33 __ STA P6 
0a11 : 20 7b 16 JSR $167b ; (SetPaletteIndex.s0 + 0)
0a14 : a9 50 __ LDA #$50
0a16 : 85 34 __ STA P7 
0a18 : a9 00 __ LDA #$00
0a1a : 8d fc 9e STA $9efc ; (sstack + 0)
0a1d : 8d fd 9e STA $9efd ; (sstack + 1)
0a20 : 8d ff 9e STA $9eff ; (sstack + 3)
0a23 : a9 10 __ LDA #$10
0a25 : 8d fe 9e STA $9efe ; (sstack + 2)
0a28 : a9 62 __ LDA #$62
0a2a : 85 32 __ STA P5 
0a2c : a9 37 __ LDA #$37
0a2e : 85 33 __ STA P6 
0a30 : 20 7b 16 JSR $167b ; (SetPaletteIndex.s0 + 0)
0a33 : a9 00 __ LDA #$00
0a35 : 8d fd 1a STA $1afd ; (PalTimer + 0)
0a38 : 8d fe 1a STA $1afe ; (PalTimer + 1)
.s89:
0a3b : ad fc 1a LDA $1afc ; (p + 1)
0a3e : d0 42 __ BNE $0a82 ; (main.s91 + 0)
.s1007:
0a40 : ad fb 1a LDA $1afb ; (p + 0)
0a43 : c9 03 __ CMP #$03
0a45 : d0 3b __ BNE $0a82 ; (main.s91 + 0)
.s34:
0a47 : a9 20 __ LDA #$20
0a49 : 85 37 __ STA P10 
0a4b : a9 00 __ LDA #$00
0a4d : 8d fc 9e STA $9efc ; (sstack + 0)
0a50 : 8d ff 9e STA $9eff ; (sstack + 3)
0a53 : a9 fa __ LDA #$fa
0a55 : 8d fd 9e STA $9efd ; (sstack + 1)
0a58 : a9 01 __ LDA #$01
0a5a : 8d fe 9e STA $9efe ; (sstack + 2)
0a5d : a9 00 __ LDA #$00
0a5f : cd ff 1a CMP $1aff ; (ShimmerState + 0)
0a62 : 2a __ __ ROL
0a63 : 8d ff 1a STA $1aff ; (ShimmerState + 0)
0a66 : d0 07 __ BNE $0a6f ; (main.s37 + 0)
.s38:
0a68 : a9 37 __ LDA #$37
0a6a : a0 a2 __ LDY #$a2
0a6c : 4c 73 0a JMP $0a73 ; (main.s100 + 0)
.s37:
0a6f : a9 37 __ LDA #$37
0a71 : a0 82 __ LDY #$82
.s100:
0a73 : 84 35 __ STY P8 
0a75 : 85 36 __ STA P9 
0a77 : 20 54 16 JSR $1654 ; (SetPaletteColours.s0 + 0)
0a7a : a9 00 __ LDA #$00
0a7c : 8d fb 1a STA $1afb ; (p + 0)
0a7f : 8d fc 1a STA $1afc ; (p + 1)
.s91:
0a82 : a9 03 __ LDA #$03
0a84 : 8d 2c 9f STA $9f2c 
0a87 : 20 2e 17 JSR $172e ; (zsm_check.s0 + 0)
0a8a : 09 00 __ ORA #$00
0a8c : f0 0b __ BEQ $0a99 ; (main.s42 + 0)
.s40:
0a8e : a9 9f __ LDA #$9f
0a90 : 85 30 __ STA P3 
0a92 : a9 18 __ LDA #$18
0a94 : 85 31 __ STA P4 
0a96 : 20 32 17 JSR $1732 ; (zsm_init.s0 + 0)
.s42:
0a99 : a5 51 __ LDA T1 + 0 
0a9b : 85 2e __ STA P1 
0a9d : 20 bd 18 JSR $18bd ; (Control.s0 + 0)
0aa0 : a5 3b __ LDA ACCU + 0 
0aa2 : 85 51 __ STA T1 + 0 
0aa4 : ad c5 37 LDA $37c5 ; (FrameCount + 0)
0aa7 : 85 47 __ STA T3 + 0 
0aa9 : 85 3b __ STA ACCU + 0 
0aab : ad c6 37 LDA $37c6 ; (FrameCount + 1)
0aae : 85 3c __ STA ACCU + 1 
0ab0 : a9 04 __ LDA #$04
0ab2 : 85 23 __ STA WORK + 0 
0ab4 : a9 00 __ LDA #$00
0ab6 : 85 24 __ STA WORK + 1 
0ab8 : 20 58 1a JSR $1a58 ; (mods16 + 0)
0abb : a5 26 __ LDA WORK + 3 
0abd : d0 16 __ BNE $0ad5 ; (main.s45 + 0)
.s1003:
0abf : a5 25 __ LDA WORK + 2 
0ac1 : c9 01 __ CMP #$01
0ac3 : d0 10 __ BNE $0ad5 ; (main.s45 + 0)
.s43:
0ac5 : ac ee 37 LDY $37ee ; (off1 + 0)
0ac8 : c0 2b __ CPY #$2b
0aca : b0 06 __ BCS $0ad2 ; (main.s99 + 0)
.s46:
0acc : b9 00 38 LDA $3800,y ; (TestText2 + 0)
0acf : 8d 23 9f STA $9f23 
.s99:
0ad2 : ee ee 37 INC $37ee ; (off1 + 0)
.s45:
0ad5 : 06 47 __ ASL T3 + 0 
0ad7 : ad c6 37 LDA $37c6 ; (FrameCount + 1)
0ada : 2a __ __ ROL
0adb : 18 __ __ CLC
0adc : 69 ff __ ADC #$ff
0ade : 8d 38 9f STA $9f38 
0ae1 : a5 47 __ LDA T3 + 0 
0ae3 : 8d 37 9f STA $9f37 
0ae6 : a9 01 __ LDA #$01
0ae8 : 8d 2c 9f STA $9f2c 
0aeb : 20 d1 17 JSR $17d1 ; (zsm_fill.s0 + 0)
0aee : a9 00 __ LDA #$00
0af0 : 8d 2c 9f STA $9f2c 
0af3 : 20 a8 19 JSR $19a8 ; (frame_wait.l1 + 0)
0af6 : ee c5 37 INC $37c5 ; (FrameCount + 0)
0af9 : f0 03 __ BEQ $0afe ; (main.s1028 + 0)
0afb : 4c 07 09 JMP $0907 ; (main.l2 + 0)
.s1028:
0afe : ee c6 37 INC $37c6 ; (FrameCount + 1)
0b01 : 4c 07 09 JMP $0907 ; (main.l2 + 0)
.s20:
0b04 : ad 25 9f LDA $9f25 
0b07 : 29 fe __ AND #$fe
0b09 : 8d 25 9f STA $9f25 
0b0c : 18 __ __ CLC
0b0d : a5 4d __ LDA T7 + 0 
0b0f : 69 01 __ ADC #$01
0b11 : 8d 20 9f STA $9f20 
0b14 : a5 4e __ LDA T7 + 1 
0b16 : 69 00 __ ADC #$00
0b18 : 8d 21 9f STA $9f21 
0b1b : a5 4f __ LDA T7 + 2 
0b1d : 69 00 __ ADC #$00
0b1f : 29 01 __ AND #$01
0b21 : 09 10 __ ORA #$10
0b23 : 8d 22 9f STA $9f22 
0b26 : a9 00 __ LDA #$00
0b28 : 85 3b __ STA ACCU + 0 
0b2a : bd b3 9e LDA $9eb3,x ; (Buildings + 7)
0b2d : d0 07 __ BNE $0b36 ; (main.l25 + 0)
.s1012:
0b2f : a5 3b __ LDA ACCU + 0 
0b31 : dd b2 9e CMP $9eb2,x ; (Buildings + 6)
0b34 : b0 0f __ BCS $0b45 ; (main.s27 + 0)
.l25:
0b36 : a9 18 __ LDA #$18
0b38 : 8d 23 9f STA $9f23 
0b3b : e6 3b __ INC ACCU + 0 
0b3d : bd b3 9e LDA $9eb3,x ; (Buildings + 7)
0b40 : d0 f4 __ BNE $0b36 ; (main.l25 + 0)
0b42 : 4c 2f 0b JMP $0b2f ; (main.s1012 + 0)
.s27:
0b45 : a5 4d __ LDA T7 + 0 
0b47 : 69 7f __ ADC #$7f
0b49 : 85 4d __ STA T7 + 0 
0b4b : a5 4e __ LDA T7 + 1 
0b4d : 69 00 __ ADC #$00
0b4f : 85 4e __ STA T7 + 1 
0b51 : 90 02 __ BCC $0b55 ; (main.s1025 + 0)
.s1024:
0b53 : e6 4f __ INC T7 + 2 
.s1025:
0b55 : e6 4c __ INC T6 + 0 
0b57 : 4c b7 09 JMP $09b7 ; (main.l19 + 0)
.s4:
0b5a : ee fd 1a INC $1afd ; (PalTimer + 0)
0b5d : f0 03 __ BEQ $0b62 ; (main.s1020 + 0)
0b5f : 4c 44 09 JMP $0944 ; (main.s83 + 0)
.s1020:
0b62 : ee fe 1a INC $1afe ; (PalTimer + 1)
0b65 : 4c 44 09 JMP $0944 ; (main.s83 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0b68 : 78 __ __ SEI
0b69 : ad 14 03 LDA $0314 
0b6c : 8d c7 37 STA $37c7 ; (oirq + 0)
0b6f : ad 15 03 LDA $0315 
0b72 : 8d c8 37 STA $37c8 ; (oirq + 1)
0b75 : a9 81 __ LDA #$81
0b77 : 8d 14 03 STA $0314 
0b7a : a9 0b __ LDA #$0b
0b7c : 8d 15 03 STA $0315 
0b7f : 58 __ __ CLI
.s1001:
0b80 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
37c7 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0b81 : 20 87 0b JSR $0b87 ; (irq.s1000 + 0)
0b84 : 6c c7 37 JMP ($37c7)
--------------------------------------------------------------------
irq:
.s1000:
0b87 : a5 2d __ LDA P0 
0b89 : 48 __ __ PHA
0b8a : a5 2e __ LDA P1 
0b8c : 48 __ __ PHA
0b8d : a5 3b __ LDA ACCU + 0 
0b8f : 48 __ __ PHA
0b90 : a5 3c __ LDA ACCU + 1 
0b92 : 48 __ __ PHA
0b93 : a5 47 __ LDA T0 + 0 
0b95 : 48 __ __ PHA
0b96 : a5 48 __ LDA $48 
0b98 : 48 __ __ PHA
0b99 : a5 49 __ LDA $49 
0b9b : 48 __ __ PHA
0b9c : a5 4a __ LDA $4a 
0b9e : 48 __ __ PHA
0b9f : a5 4b __ LDA $4b 
0ba1 : 48 __ __ PHA
0ba2 : a5 4c __ LDA $4c 
0ba4 : 48 __ __ PHA
0ba5 : a5 4d __ LDA $4d 
0ba7 : 48 __ __ PHA
0ba8 : a5 4e __ LDA $4e 
0baa : 48 __ __ PHA
0bab : a5 4f __ LDA $4f 
0bad : 48 __ __ PHA
0bae : a5 50 __ LDA $50 
0bb0 : 48 __ __ PHA
.s0:
0bb1 : ad 8a 1a LDA $1a8a ; (zsm_playing + 0)
0bb4 : f0 08 __ BEQ $0bbe ; (irq.s1001 + 0)
.s4:
0bb6 : ad 8b 1a LDA $1a8b ; (zsm_finished + 0)
0bb9 : d0 03 __ BNE $0bbe ; (irq.s1001 + 0)
.s1:
0bbb : 20 e9 0b JSR $0be9 ; (zsm_play.s0 + 0)
.s1001:
0bbe : 68 __ __ PLA
0bbf : 85 50 __ STA $50 
0bc1 : 68 __ __ PLA
0bc2 : 85 4f __ STA $4f 
0bc4 : 68 __ __ PLA
0bc5 : 85 4e __ STA $4e 
0bc7 : 68 __ __ PLA
0bc8 : 85 4d __ STA $4d 
0bca : 68 __ __ PLA
0bcb : 85 4c __ STA $4c 
0bcd : 68 __ __ PLA
0bce : 85 4b __ STA $4b 
0bd0 : 68 __ __ PLA
0bd1 : 85 4a __ STA $4a 
0bd3 : 68 __ __ PLA
0bd4 : 85 49 __ STA $49 
0bd6 : 68 __ __ PLA
0bd7 : 85 48 __ STA $48 
0bd9 : 68 __ __ PLA
0bda : 85 47 __ STA T0 + 0 
0bdc : 68 __ __ PLA
0bdd : 85 3c __ STA ACCU + 1 
0bdf : 68 __ __ PLA
0be0 : 85 3b __ STA ACCU + 0 
0be2 : 68 __ __ PLA
0be3 : 85 2e __ STA P1 
0be5 : 68 __ __ PLA
0be6 : 85 2d __ STA P0 
0be8 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1a8a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1a8b : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0be9 : ad 8c 1a LDA $1a8c ; (zsm_paused + 0)
0bec : f0 01 __ BEQ $0bef ; (zsm_play.s2 + 0)
0bee : 60 __ __ RTS
.s2:
0bef : ad c9 37 LDA $37c9 ; (zsm_delay + 0)
0bf2 : f0 03 __ BEQ $0bf7 ; (zsm_play.s5 + 0)
0bf4 : 4c 24 0d JMP $0d24 ; (zsm_play.s4 + 0)
.s5:
0bf7 : ad 25 9f LDA $9f25 
0bfa : 85 47 __ STA T0 + 0 
0bfc : ad 25 9f LDA $9f25 
0bff : 29 fe __ AND #$fe
0c01 : 8d 25 9f STA $9f25 
0c04 : ad 20 9f LDA $9f20 
0c07 : 85 49 __ STA T2 + 0 
0c09 : ad 21 9f LDA $9f21 
0c0c : 85 4a __ STA T2 + 1 
0c0e : ad 22 9f LDA $9f22 
0c11 : 85 48 __ STA T1 + 0 
.l8:
0c13 : ad ca 37 LDA $37ca ; (zsm_pos + 0)
0c16 : 85 4b __ STA T3 + 0 
0c18 : 18 __ __ CLC
0c19 : 69 01 __ ADC #$01
0c1b : 85 4d __ STA T4 + 0 
0c1d : 8d ca 37 STA $37ca ; (zsm_pos + 0)
0c20 : ad cb 37 LDA $37cb ; (zsm_pos + 1)
0c23 : aa __ __ TAX
0c24 : 69 00 __ ADC #$00
0c26 : 85 4e __ STA T4 + 1 
0c28 : 8d cb 37 STA $37cb ; (zsm_pos + 1)
0c2b : 18 __ __ CLC
0c2c : a9 3b __ LDA #$3b
0c2e : 65 4b __ ADC T3 + 0 
0c30 : 85 3b __ STA ACCU + 0 
0c32 : 8a __ __ TXA
0c33 : 29 03 __ AND #$03
0c35 : 69 38 __ ADC #$38
0c37 : 85 3c __ STA ACCU + 1 
0c39 : a0 00 __ LDY #$00
0c3b : b1 3b __ LDA (ACCU + 0),y 
0c3d : c9 40 __ CMP #$40
0c3f : b0 03 __ BCS $0c44 ; (zsm_play.s12 + 0)
0c41 : 4c ef 0c JMP $0cef ; (zsm_play.s11 + 0)
.s12:
0c44 : d0 22 __ BNE $0c68 ; (zsm_play.s15 + 0)
.s14:
0c46 : 18 __ __ CLC
0c47 : a9 3b __ LDA #$3b
0c49 : 65 4d __ ADC T4 + 0 
0c4b : 85 4b __ STA T3 + 0 
0c4d : a5 4e __ LDA T4 + 1 
0c4f : 29 03 __ AND #$03
0c51 : 69 38 __ ADC #$38
0c53 : 85 4c __ STA T3 + 1 
0c55 : b1 4b __ LDA (T3 + 0),y 
0c57 : 29 3f __ AND #$3f
0c59 : 18 __ __ CLC
0c5a : 65 4d __ ADC T4 + 0 
0c5c : 8d ca 37 STA $37ca ; (zsm_pos + 0)
0c5f : 98 __ __ TYA
0c60 : 65 4e __ ADC T4 + 1 
0c62 : 8d cb 37 STA $37cb ; (zsm_pos + 1)
0c65 : 4c 13 0c JMP $0c13 ; (zsm_play.l8 + 0)
.s15:
0c68 : 09 00 __ ORA #$00
0c6a : 30 5b __ BMI $0cc7 ; (zsm_play.s18 + 0)
.s17:
0c6c : 29 3f __ AND #$3f
0c6e : f0 a3 __ BEQ $0c13 ; (zsm_play.l8 + 0)
.s29:
0c70 : 84 50 __ STY T7 + 0 
0c72 : 85 4f __ STA T6 + 0 
0c74 : 18 __ __ CLC
.l1012:
0c75 : a9 3b __ LDA #$3b
0c77 : 6d ca 37 ADC $37ca ; (zsm_pos + 0)
0c7a : 85 4d __ STA T4 + 0 
0c7c : ad cb 37 LDA $37cb ; (zsm_pos + 1)
0c7f : 29 03 __ AND #$03
0c81 : 69 38 __ ADC #$38
0c83 : 85 4e __ STA T4 + 1 
0c85 : a0 00 __ LDY #$00
0c87 : b1 4d __ LDA (T4 + 0),y 
0c89 : 85 2d __ STA P0 
0c8b : ad ca 37 LDA $37ca ; (zsm_pos + 0)
0c8e : 18 __ __ CLC
0c8f : 69 01 __ ADC #$01
0c91 : aa __ __ TAX
0c92 : ad cb 37 LDA $37cb ; (zsm_pos + 1)
0c95 : 69 00 __ ADC #$00
0c97 : 29 03 __ AND #$03
0c99 : 85 4c __ STA T3 + 1 
0c9b : 8a __ __ TXA
0c9c : 18 __ __ CLC
0c9d : 69 3b __ ADC #$3b
0c9f : 85 4b __ STA T3 + 0 
0ca1 : a9 38 __ LDA #$38
0ca3 : 65 4c __ ADC T3 + 1 
0ca5 : 85 4c __ STA T3 + 1 
0ca7 : b1 4b __ LDA (T3 + 0),y 
0ca9 : 85 2e __ STA P1 
0cab : 20 28 0d JSR $0d28 ; (sfx_put.l1 + 0)
0cae : ad ca 37 LDA $37ca ; (zsm_pos + 0)
0cb1 : 18 __ __ CLC
0cb2 : 69 02 __ ADC #$02
0cb4 : 8d ca 37 STA $37ca ; (zsm_pos + 0)
0cb7 : 90 03 __ BCC $0cbc ; (zsm_play.s1015 + 0)
.s1014:
0cb9 : ee cb 37 INC $37cb ; (zsm_pos + 1)
.s1015:
0cbc : e6 50 __ INC T7 + 0 
0cbe : a5 50 __ LDA T7 + 0 
0cc0 : c5 4f __ CMP T6 + 0 
0cc2 : 90 b1 __ BCC $0c75 ; (zsm_play.l1012 + 0)
0cc4 : 4c 13 0c JMP $0c13 ; (zsm_play.l8 + 0)
.s18:
0cc7 : c9 80 __ CMP #$80
0cc9 : d0 07 __ BNE $0cd2 ; (zsm_play.s25 + 0)
.s24:
0ccb : a9 01 __ LDA #$01
0ccd : 8d 8b 1a STA $1a8b ; (zsm_finished + 0)
0cd0 : d0 08 __ BNE $0cda ; (zsm_play.s10 + 0)
.s25:
0cd2 : 29 7f __ AND #$7f
0cd4 : 38 __ __ SEC
0cd5 : e9 01 __ SBC #$01
0cd7 : 8d c9 37 STA $37c9 ; (zsm_delay + 0)
.s10:
0cda : a5 49 __ LDA T2 + 0 
0cdc : 8d 20 9f STA $9f20 
0cdf : a5 4a __ LDA T2 + 1 
0ce1 : 8d 21 9f STA $9f21 
0ce4 : a5 48 __ LDA T1 + 0 
0ce6 : 8d 22 9f STA $9f22 
0ce9 : a5 47 __ LDA T0 + 0 
0ceb : 8d 25 9f STA $9f25 
.s1001:
0cee : 60 __ __ RTS
.s11:
0cef : 29 3f __ AND #$3f
0cf1 : 09 c0 __ ORA #$c0
0cf3 : 8d 20 9f STA $9f20 
0cf6 : a9 f9 __ LDA #$f9
0cf8 : 8d 21 9f STA $9f21 
0cfb : a9 01 __ LDA #$01
0cfd : 8d 22 9f STA $9f22 
0d00 : a5 4b __ LDA T3 + 0 
0d02 : 69 02 __ ADC #$02
0d04 : 8d ca 37 STA $37ca ; (zsm_pos + 0)
0d07 : 90 01 __ BCC $0d0a ; (zsm_play.s1017 + 0)
.s1016:
0d09 : e8 __ __ INX
.s1017:
0d0a : 8e cb 37 STX $37cb ; (zsm_pos + 1)
0d0d : 18 __ __ CLC
0d0e : a9 3b __ LDA #$3b
0d10 : 65 4d __ ADC T4 + 0 
0d12 : 85 4b __ STA T3 + 0 
0d14 : a5 4e __ LDA T4 + 1 
0d16 : 29 03 __ AND #$03
0d18 : 69 38 __ ADC #$38
0d1a : 85 4c __ STA T3 + 1 
0d1c : b1 4b __ LDA (T3 + 0),y 
0d1e : 8d 23 9f STA $9f23 
0d21 : 4c 13 0c JMP $0c13 ; (zsm_play.l8 + 0)
.s4:
0d24 : ce c9 37 DEC $37c9 ; (zsm_delay + 0)
0d27 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1a8c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
37c9 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
383b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
37ca : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0d28 : ad 41 9f LDA $9f41 
0d2b : 30 fb __ BMI $0d28 ; (sfx_put.l1 + 0)
.s3:
0d2d : a5 2d __ LDA P0 ; (index + 0)
0d2f : 8d 40 9f STA $9f40 
0d32 : ea __ __ NOP
0d33 : ea __ __ NOP
0d34 : ea __ __ NOP
0d35 : ea __ __ NOP
0d36 : a5 2e __ LDA P1 ; (data + 0)
0d38 : 8d 41 9f STA $9f41 
.s1001:
0d3b : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0d3c : a9 93 __ LDA #$93
0d3e : 85 2d __ STA P0 
0d40 : a9 00 __ LDA #$00
0d42 : 85 2e __ STA P1 
0d44 : 20 79 0d JSR $0d79 ; (putch.s0 + 0)
0d47 : a9 11 __ LDA #$11
0d49 : 8d 22 9f STA $9f22 
0d4c : a2 00 __ LDX #$00
.l2:
0d4e : 8a __ __ TXA
0d4f : 18 __ __ CLC
0d50 : 69 b0 __ ADC #$b0
0d52 : 8d 21 9f STA $9f21 
0d55 : a9 00 __ LDA #$00
0d57 : 8d 20 9f STA $9f20 
0d5a : a0 80 __ LDY #$80
.l1003:
0d5c : a9 20 __ LDA #$20
0d5e : 8d 23 9f STA $9f23 
0d61 : a9 01 __ LDA #$01
0d63 : 8d 23 9f STA $9f23 
0d66 : a9 20 __ LDA #$20
0d68 : 8d 24 9f STA $9f24 
0d6b : a9 01 __ LDA #$01
0d6d : 8d 24 9f STA $9f24 
0d70 : 88 __ __ DEY
0d71 : d0 e9 __ BNE $0d5c ; (ClearVERAScreen.l1003 + 0)
.s1004:
0d73 : e8 __ __ INX
0d74 : e0 40 __ CPX #$40
0d76 : 90 d6 __ BCC $0d4e ; (ClearVERAScreen.l2 + 0)
.s1001:
0d78 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0d79 : a5 2d __ LDA P0 
0d7b : 20 d2 ff JSR $ffd2 
.s1001:
0d7e : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0d7f : a9 00 __ LDA #$00
0d81 : 85 2d __ STA P0 
0d83 : 85 2e __ STA P1 
0d85 : 85 2f __ STA P2 
0d87 : 85 30 __ STA P3 
0d89 : 85 31 __ STA P4 
0d8b : 8d 25 9f STA $9f25 
0d8e : ad 29 9f LDA $9f29 
0d91 : 09 70 __ ORA #$70
0d93 : 8d 29 9f STA $9f29 
0d96 : a9 80 __ LDA #$80
0d98 : 8d 2b 9f STA $9f2b 
0d9b : 8d 2a 9f STA $9f2a 
0d9e : a9 62 __ LDA #$62
0da0 : 8d 2d 9f STA $9f2d 
0da3 : a9 68 __ LDA #$68
0da5 : 8d 34 9f STA $9f34 
0da8 : 20 af 14 JSR $14af ; (tileBaseConfig.s0 + 0)
0dab : 8d 2f 9f STA $9f2f 
0dae : a9 20 __ LDA #$20
0db0 : 85 2f __ STA P2 
0db2 : 20 c8 14 JSR $14c8 ; (memoryToMapMemoryAddress.s0 + 0)
0db5 : 8d 2e 9f STA $9f2e 
0db8 : a9 21 __ LDA #$21
0dba : 8d 22 9f STA $9f22 
0dbd : a2 80 __ LDX #$80
.l6:
0dbf : a0 50 __ LDY #$50
.l1025:
0dc1 : a9 00 __ LDA #$00
0dc3 : 8d 24 9f STA $9f24 
0dc6 : a9 08 __ LDA #$08
0dc8 : 8d 24 9f STA $9f24 
0dcb : 88 __ __ DEY
0dcc : d0 f3 __ BNE $0dc1 ; (SetUpSprites.l1025 + 0)
.s1026:
0dce : ca __ __ DEX
0dcf : d0 ee __ BNE $0dbf ; (SetUpSprites.l6 + 0)
.s4:
0dd1 : a9 00 __ LDA #$00
0dd3 : 85 2d __ STA P0 
0dd5 : 85 2e __ STA P1 
0dd7 : 85 2f __ STA P2 
0dd9 : 85 30 __ STA P3 
0ddb : 85 33 __ STA P6 
0ddd : a9 01 __ LDA #$01
0ddf : 85 34 __ STA P7 
0de1 : a9 00 __ LDA #$00
0de3 : 85 31 __ STA P4 
0de5 : a9 1b __ LDA #$1b
0de7 : 85 32 __ STA P5 
0de9 : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
0dec : a9 10 __ LDA #$10
0dee : 8d 22 9f STA $9f22 
0df1 : a9 00 __ LDA #$00
0df3 : 8d 20 9f STA $9f20 
0df6 : a9 20 __ LDA #$20
0df8 : 8d 21 9f STA $9f21 
0dfb : a9 3c __ LDA #$3c
0dfd : 85 47 __ STA T1 + 0 
.l10:
0dff : a9 00 __ LDA #$00
0e01 : 85 48 __ STA T2 + 0 
.l14:
0e03 : 20 11 15 JSR $1511 ; (rand.s0 + 0)
0e06 : a5 3b __ LDA ACCU + 0 
0e08 : 29 1f __ AND #$1f
0e0a : c9 1f __ CMP #$1f
0e0c : a5 48 __ LDA T2 + 0 
0e0e : 90 03 __ BCC $0e13 ; (SetUpSprites.s1023 + 0)
0e10 : 4c 79 14 JMP $1479 ; (SetUpSprites.s1017 + 0)
.s1023:
0e13 : c9 09 __ CMP #$09
0e15 : 90 06 __ BCC $0e1d ; (SetUpSprites.s20 + 0)
.s1022:
0e17 : a9 45 __ LDA #$45
0e19 : c5 48 __ CMP T2 + 0 
0e1b : b0 04 __ BCS $0e21 ; (SetUpSprites.s1021 + 0)
.s20:
0e1d : a9 00 __ LDA #$00
0e1f : f0 2f __ BEQ $0e50 ; (SetUpSprites.s174 + 0)
.s1021:
0e21 : a5 48 __ LDA T2 + 0 
0e23 : c9 13 __ CMP #$13
0e25 : 90 06 __ BCC $0e2d ; (SetUpSprites.s24 + 0)
.s1020:
0e27 : a9 3b __ LDA #$3b
0e29 : c5 48 __ CMP T2 + 0 
0e2b : b0 04 __ BCS $0e31 ; (SetUpSprites.s1019 + 0)
.s24:
0e2d : a9 01 __ LDA #$01
0e2f : d0 12 __ BNE $0e43 ; (SetUpSprites.s184 + 0)
.s1019:
0e31 : a5 48 __ LDA T2 + 0 
0e33 : c9 1d __ CMP #$1d
0e35 : 90 06 __ BCC $0e3d ; (SetUpSprites.s28 + 0)
.s1018:
0e37 : a9 31 __ LDA #$31
0e39 : c5 48 __ CMP T2 + 0 
0e3b : b0 04 __ BCS $0e41 ; (SetUpSprites.s29 + 0)
.s28:
0e3d : a9 02 __ LDA #$02
0e3f : d0 02 __ BNE $0e43 ; (SetUpSprites.s184 + 0)
.s29:
0e41 : a9 03 __ LDA #$03
.s184:
0e43 : 8d 23 9f STA $9f23 
0e46 : a9 00 __ LDA #$00
0e48 : 8d 23 9f STA $9f23 
0e4b : e6 48 __ INC T2 + 0 
0e4d : 4c 03 0e JMP $0e03 ; (SetUpSprites.l14 + 0)
.s174:
0e50 : 8d 23 9f STA $9f23 
0e53 : a9 00 __ LDA #$00
0e55 : 8d 23 9f STA $9f23 
0e58 : e6 48 __ INC T2 + 0 
0e5a : 10 a7 __ BPL $0e03 ; (SetUpSprites.l14 + 0)
.s11:
0e5c : c6 47 __ DEC T1 + 0 
0e5e : a5 47 __ LDA T1 + 0 
0e60 : d0 9d __ BNE $0dff ; (SetUpSprites.l10 + 0)
.s12:
0e62 : 85 2d __ STA P0 
0e64 : 85 30 __ STA P3 
0e66 : 85 33 __ STA P6 
0e68 : a9 31 __ LDA #$31
0e6a : 85 2e __ STA P1 
0e6c : a9 01 __ LDA #$01
0e6e : 85 2f __ STA P2 
0e70 : a9 04 __ LDA #$04
0e72 : 85 34 __ STA P7 
0e74 : a9 00 __ LDA #$00
0e76 : 85 31 __ STA P4 
0e78 : a9 1c __ LDA #$1c
0e7a : 85 32 __ STA P5 
0e7c : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
0e7f : a9 00 __ LDA #$00
0e81 : 85 4e __ STA T5 + 0 
0e83 : 85 4f __ STA T5 + 1 
.l45:
0e85 : 85 2d __ STA P0 
0e87 : 18 __ __ CLC
0e88 : 69 02 __ ADC #$02
0e8a : 85 4c __ STA T4 + 0 
0e8c : a9 00 __ LDA #$00
0e8e : 2a __ __ ROL
0e8f : 85 4d __ STA T4 + 1 
0e91 : a9 88 __ LDA #$88
0e93 : 85 2e __ STA P1 
0e95 : a9 09 __ LDA #$09
0e97 : 85 2f __ STA P2 
0e99 : a9 00 __ LDA #$00
0e9b : 85 30 __ STA P3 
0e9d : a9 03 __ LDA #$03
0e9f : 85 31 __ STA P4 
0ea1 : 85 33 __ STA P6 
0ea3 : a9 02 __ LDA #$02
0ea5 : 85 32 __ STA P5 
0ea7 : a9 01 __ LDA #$01
0ea9 : 85 34 __ STA P7 
0eab : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
0eae : a5 4e __ LDA T5 + 0 
0eb0 : 85 2e __ STA P1 
0eb2 : a5 4f __ LDA T5 + 1 
0eb4 : 85 2f __ STA P2 
0eb6 : a9 90 __ LDA #$90
0eb8 : 85 30 __ STA P3 
0eba : a9 01 __ LDA #$01
0ebc : 85 31 __ STA P4 
0ebe : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
0ec1 : a9 00 __ LDA #$00
0ec3 : 85 2e __ STA P1 
0ec5 : a9 01 __ LDA #$01
0ec7 : 85 2f __ STA P2 
0ec9 : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
0ecc : a9 88 __ LDA #$88
0ece : 85 2e __ STA P1 
0ed0 : a9 09 __ LDA #$09
0ed2 : 85 2f __ STA P2 
0ed4 : a9 00 __ LDA #$00
0ed6 : 85 30 __ STA P3 
0ed8 : a9 03 __ LDA #$03
0eda : 85 31 __ STA P4 
0edc : e6 2d __ INC P0 
0ede : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
0ee1 : a5 4e __ LDA T5 + 0 
0ee3 : 85 2e __ STA P1 
0ee5 : a5 4f __ LDA T5 + 1 
0ee7 : 85 2f __ STA P2 
0ee9 : a9 70 __ LDA #$70
0eeb : 85 30 __ STA P3 
0eed : a9 01 __ LDA #$01
0eef : 85 31 __ STA P4 
0ef1 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
0ef4 : a5 4d __ LDA T4 + 1 
0ef6 : d0 16 __ BNE $0f0e ; (SetUpSprites.s47 + 0)
.s1013:
0ef8 : 18 __ __ CLC
0ef9 : a5 2e __ LDA P1 
0efb : 69 40 __ ADC #$40
0efd : 85 4e __ STA T5 + 0 
0eff : a5 2f __ LDA P2 
0f01 : 69 00 __ ADC #$00
0f03 : 85 4f __ STA T5 + 1 
0f05 : a5 4c __ LDA T4 + 0 
0f07 : c9 16 __ CMP #$16
0f09 : b0 03 __ BCS $0f0e ; (SetUpSprites.s47 + 0)
0f0b : 4c 85 0e JMP $0e85 ; (SetUpSprites.l45 + 0)
.s47:
0f0e : a9 00 __ LDA #$00
0f10 : 85 2d __ STA P0 
0f12 : 85 30 __ STA P3 
0f14 : 85 33 __ STA P6 
0f16 : a9 30 __ LDA #$30
0f18 : 85 2e __ STA P1 
0f1a : a9 01 __ LDA #$01
0f1c : 85 2f __ STA P2 
0f1e : a9 00 __ LDA #$00
0f20 : 85 31 __ STA P4 
0f22 : a9 20 __ LDA #$20
0f24 : 85 32 __ STA P5 
0f26 : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
0f29 : a9 16 __ LDA #$16
0f2b : 85 2d __ STA P0 
0f2d : a9 80 __ LDA #$80
0f2f : 85 2e __ STA P1 
0f31 : a9 09 __ LDA #$09
0f33 : 85 2f __ STA P2 
0f35 : a9 01 __ LDA #$01
0f37 : 85 31 __ STA P4 
0f39 : 85 34 __ STA P7 
0f3b : a9 02 __ LDA #$02
0f3d : 85 32 __ STA P5 
0f3f : a9 03 __ LDA #$03
0f41 : 85 33 __ STA P6 
0f43 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
0f46 : a9 30 __ LDA #$30
0f48 : 85 2e __ STA P1 
0f4a : a9 01 __ LDA #$01
0f4c : 85 2f __ STA P2 
0f4e : a9 b8 __ LDA #$b8
0f50 : 85 30 __ STA P3 
0f52 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
0f55 : a9 20 __ LDA #$20
0f57 : 85 2d __ STA P0 
0f59 : a9 35 __ LDA #$35
0f5b : 85 2e __ STA P1 
0f5d : a9 00 __ LDA #$00
0f5f : 85 30 __ STA P3 
0f61 : 85 33 __ STA P6 
0f63 : a9 02 __ LDA #$02
0f65 : 85 34 __ STA P7 
0f67 : a9 00 __ LDA #$00
0f69 : 85 31 __ STA P4 
0f6b : a9 21 __ LDA #$21
0f6d : 85 32 __ STA P5 
0f6f : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
0f72 : a9 17 __ LDA #$17
0f74 : 85 2d __ STA P0 
0f76 : a9 a9 __ LDA #$a9
0f78 : 85 2e __ STA P1 
0f7a : a9 09 __ LDA #$09
0f7c : 85 2f __ STA P2 
0f7e : a9 02 __ LDA #$02
0f80 : 85 31 __ STA P4 
0f82 : 85 32 __ STA P5 
0f84 : a9 03 __ LDA #$03
0f86 : 85 33 __ STA P6 
0f88 : a9 01 __ LDA #$01
0f8a : 85 34 __ STA P7 
0f8c : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
0f8f : a9 fc __ LDA #$fc
0f91 : 85 2e __ STA P1 
0f93 : a9 00 __ LDA #$00
0f95 : 85 2f __ STA P2 
0f97 : a9 b8 __ LDA #$b8
0f99 : 85 30 __ STA P3 
0f9b : a9 01 __ LDA #$01
0f9d : 85 31 __ STA P4 
0f9f : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
0fa2 : a9 18 __ LDA #$18
0fa4 : 85 2d __ STA P0 
0fa6 : a9 a9 __ LDA #$a9
0fa8 : 85 2e __ STA P1 
0faa : a9 09 __ LDA #$09
0fac : 85 2f __ STA P2 
0fae : a9 00 __ LDA #$00
0fb0 : 85 30 __ STA P3 
0fb2 : a9 02 __ LDA #$02
0fb4 : 85 31 __ STA P4 
0fb6 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
0fb9 : a9 4c __ LDA #$4c
0fbb : 85 2e __ STA P1 
0fbd : a9 01 __ LDA #$01
0fbf : 85 2f __ STA P2 
0fc1 : 85 31 __ STA P4 
0fc3 : a9 b8 __ LDA #$b8
0fc5 : 85 30 __ STA P3 
0fc7 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
0fca : a9 01 __ LDA #$01
0fcc : 85 2e __ STA P1 
0fce : a9 00 __ LDA #$00
0fd0 : 85 2f __ STA P2 
0fd2 : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
0fd5 : a9 10 __ LDA #$10
0fd7 : 85 2d __ STA P0 
0fd9 : a9 20 __ LDA #$20
0fdb : 85 30 __ STA P3 
0fdd : a9 00 __ LDA #$00
0fdf : 85 31 __ STA P4 
0fe1 : a9 8f __ LDA #$8f
0fe3 : 85 2e __ STA P1 
0fe5 : a9 1a __ LDA #$1a
0fe7 : 85 2f __ STA P2 
0fe9 : 20 0b 16 JSR $160b ; (vera_pal_putn.s0 + 0)
0fec : a9 00 __ LDA #$00
0fee : 85 2d __ STA P0 
0ff0 : 85 30 __ STA P3 
0ff2 : 85 34 __ STA P7 
0ff4 : a9 35 __ LDA #$35
0ff6 : 85 2e __ STA P1 
0ff8 : a9 01 __ LDA #$01
0ffa : 85 2f __ STA P2 
0ffc : a9 20 __ LDA #$20
0ffe : 85 33 __ STA P6 
1000 : a9 af __ LDA #$af
1002 : 85 31 __ STA P4 
1004 : a9 1a __ LDA #$1a
1006 : 85 32 __ STA P5 
1008 : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
100b : a9 00 __ LDA #$00
100d : 85 47 __ STA T1 + 0 
100f : 85 48 __ STA T2 + 0 
1011 : a9 03 __ LDA #$03
1013 : 85 33 __ STA P6 
1015 : a9 02 __ LDA #$02
1017 : 85 34 __ STA P7 
1019 : 18 __ __ CLC
.l1039:
101a : a9 a8 __ LDA #$a8
101c : 85 2e __ STA P1 
101e : a9 09 __ LDA #$09
1020 : 85 2f __ STA P2 
1022 : a9 00 __ LDA #$00
1024 : 85 30 __ STA P3 
1026 : 85 31 __ STA P4 
1028 : 85 32 __ STA P5 
102a : a5 47 __ LDA T1 + 0 
102c : 69 19 __ ADC #$19
102e : 85 2d __ STA P0 
1030 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
1033 : a9 b8 __ LDA #$b8
1035 : 85 30 __ STA P3 
1037 : a9 01 __ LDA #$01
1039 : 85 31 __ STA P4 
103b : 38 __ __ SEC
103c : a5 48 __ LDA T2 + 0 
103e : e9 fc __ SBC #$fc
1040 : 85 2e __ STA P1 
1042 : a9 00 __ LDA #$00
1044 : e9 03 __ SBC #$03
1046 : 85 2f __ STA P2 
1048 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
104b : 18 __ __ CLC
104c : a5 48 __ LDA T2 + 0 
104e : 69 0c __ ADC #$0c
1050 : 85 48 __ STA T2 + 0 
1052 : e6 47 __ INC T1 + 0 
1054 : a5 47 __ LDA T1 + 0 
1056 : c9 08 __ CMP #$08
1058 : 90 c0 __ BCC $101a ; (SetUpSprites.l1039 + 0)
.s51:
105a : a9 00 __ LDA #$00
105c : 85 47 __ STA T1 + 0 
105e : 85 48 __ STA T2 + 0 
1060 : a9 03 __ LDA #$03
1062 : 85 33 __ STA P6 
1064 : 85 34 __ STA P7 
1066 : 18 __ __ CLC
.l1041:
1067 : a9 a8 __ LDA #$a8
1069 : 85 2e __ STA P1 
106b : a9 09 __ LDA #$09
106d : 85 2f __ STA P2 
106f : a9 00 __ LDA #$00
1071 : 85 30 __ STA P3 
1073 : 85 31 __ STA P4 
1075 : a5 47 __ LDA T1 + 0 
1077 : 69 21 __ ADC #$21
1079 : 85 2d __ STA P0 
107b : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
107e : a9 c4 __ LDA #$c4
1080 : 85 30 __ STA P3 
1082 : a9 01 __ LDA #$01
1084 : 85 31 __ STA P4 
1086 : 38 __ __ SEC
1087 : a5 48 __ LDA T2 + 0 
1089 : e9 fc __ SBC #$fc
108b : 85 2e __ STA P1 
108d : a9 00 __ LDA #$00
108f : e9 03 __ SBC #$03
1091 : 85 2f __ STA P2 
1093 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
1096 : 18 __ __ CLC
1097 : a5 48 __ LDA T2 + 0 
1099 : 69 0c __ ADC #$0c
109b : 85 48 __ STA T2 + 0 
109d : e6 47 __ INC T1 + 0 
109f : a5 47 __ LDA T1 + 0 
10a1 : c9 08 __ CMP #$08
10a3 : 90 c2 __ BCC $1067 ; (SetUpSprites.l1041 + 0)
.s55:
10a5 : a9 00 __ LDA #$00
10a7 : 85 47 __ STA T1 + 0 
10a9 : 85 48 __ STA T2 + 0 
10ab : a9 03 __ LDA #$03
10ad : 85 33 __ STA P6 
10af : a9 04 __ LDA #$04
10b1 : 85 34 __ STA P7 
10b3 : 18 __ __ CLC
.l1043:
10b4 : a9 a8 __ LDA #$a8
10b6 : 85 2e __ STA P1 
10b8 : a9 09 __ LDA #$09
10ba : 85 2f __ STA P2 
10bc : a9 00 __ LDA #$00
10be : 85 30 __ STA P3 
10c0 : 85 31 __ STA P4 
10c2 : a5 47 __ LDA T1 + 0 
10c4 : 69 29 __ ADC #$29
10c6 : 85 2d __ STA P0 
10c8 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
10cb : a9 b8 __ LDA #$b8
10cd : 85 30 __ STA P3 
10cf : a9 01 __ LDA #$01
10d1 : 85 31 __ STA P4 
10d3 : 38 __ __ SEC
10d4 : a9 6c __ LDA #$6c
10d6 : e5 48 __ SBC T2 + 0 
10d8 : 85 2e __ STA P1 
10da : a9 02 __ LDA #$02
10dc : e9 04 __ SBC #$04
10de : 85 2f __ STA P2 
10e0 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
10e3 : 18 __ __ CLC
10e4 : a5 48 __ LDA T2 + 0 
10e6 : 69 0c __ ADC #$0c
10e8 : 85 48 __ STA T2 + 0 
10ea : e6 47 __ INC T1 + 0 
10ec : a5 47 __ LDA T1 + 0 
10ee : c9 08 __ CMP #$08
10f0 : 90 c2 __ BCC $10b4 ; (SetUpSprites.l1043 + 0)
.s59:
10f2 : a9 00 __ LDA #$00
10f4 : 85 47 __ STA T1 + 0 
.l61:
10f6 : 38 __ __ SEC
10f7 : a9 00 __ LDA #$00
10f9 : e5 47 __ SBC T1 + 0 
10fb : 29 0c __ AND #$0c
10fd : 49 ff __ EOR #$ff
10ff : 38 __ __ SEC
1100 : 69 6c __ ADC #$6c
1102 : 85 48 __ STA T2 + 0 
1104 : a9 02 __ LDA #$02
1106 : e9 00 __ SBC #$00
1108 : 85 49 __ STA T2 + 1 
110a : 18 __ __ CLC
110b : a5 47 __ LDA T1 + 0 
110d : 69 31 __ ADC #$31
110f : 85 2d __ STA P0 
1111 : a9 02 __ LDA #$02
1113 : 85 50 __ STA T7 + 0 
1115 : a9 03 __ LDA #$03
1117 : 85 33 __ STA P6 
1119 : a9 04 __ LDA #$04
111b : 85 34 __ STA P7 
.l1033:
111d : a9 a8 __ LDA #$a8
111f : 85 2e __ STA P1 
1121 : a9 09 __ LDA #$09
1123 : 85 2f __ STA P2 
1125 : a9 00 __ LDA #$00
1127 : 85 30 __ STA P3 
1129 : 85 31 __ STA P4 
112b : 85 32 __ STA P5 
112d : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
1130 : a5 48 __ LDA T2 + 0 
1132 : 85 2e __ STA P1 
1134 : a5 49 __ LDA T2 + 1 
1136 : 85 2f __ STA P2 
1138 : a9 b8 __ LDA #$b8
113a : 85 30 __ STA P3 
113c : a9 01 __ LDA #$01
113e : 85 31 __ STA P4 
1140 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
1143 : c6 50 __ DEC T7 + 0 
1145 : d0 d6 __ BNE $111d ; (SetUpSprites.l1033 + 0)
.s62:
1147 : e6 47 __ INC T1 + 0 
1149 : a5 47 __ LDA T1 + 0 
114b : c9 02 __ CMP #$02
114d : 90 a7 __ BCC $10f6 ; (SetUpSprites.l61 + 0)
.s63:
114f : a9 20 __ LDA #$20
1151 : 85 2d __ STA P0 
1153 : a9 3f __ LDA #$3f
1155 : 85 2e __ STA P1 
1157 : a9 01 __ LDA #$01
1159 : 85 2f __ STA P2 
115b : a9 00 __ LDA #$00
115d : 85 30 __ STA P3 
115f : 85 33 __ STA P6 
1161 : a9 00 __ LDA #$00
1163 : 85 31 __ STA P4 
1165 : a9 23 __ LDA #$23
1167 : 85 32 __ STA P5 
1169 : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
116c : a9 33 __ LDA #$33
116e : 85 2d __ STA P0 
1170 : a9 f9 __ LDA #$f9
1172 : 85 2e __ STA P1 
1174 : a9 09 __ LDA #$09
1176 : 85 2f __ STA P2 
1178 : a9 03 __ LDA #$03
117a : 85 31 __ STA P4 
117c : 85 33 __ STA P6 
117e : a9 02 __ LDA #$02
1180 : 85 32 __ STA P5 
1182 : a9 05 __ LDA #$05
1184 : 85 34 __ STA P7 
1186 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
1189 : a9 1c __ LDA #$1c
118b : 85 2e __ STA P1 
118d : a9 01 __ LDA #$01
118f : 85 2f __ STA P2 
1191 : a9 78 __ LDA #$78
1193 : 85 30 __ STA P3 
1195 : a9 00 __ LDA #$00
1197 : 85 31 __ STA P4 
1199 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
119c : a9 20 __ LDA #$20
119e : 85 2d __ STA P0 
11a0 : a9 37 __ LDA #$37
11a2 : 85 2e __ STA P1 
11a4 : a9 00 __ LDA #$00
11a6 : 85 30 __ STA P3 
11a8 : 85 33 __ STA P6 
11aa : a9 08 __ LDA #$08
11ac : 85 34 __ STA P7 
11ae : a9 00 __ LDA #$00
11b0 : 85 31 __ STA P4 
11b2 : a9 27 __ LDA #$27
11b4 : 85 32 __ STA P5 
11b6 : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
11b9 : a9 00 __ LDA #$00
11bb : 85 47 __ STA T1 + 0 
11bd : 85 48 __ STA T2 + 0 
11bf : 85 49 __ STA T2 + 1 
11c1 : a9 05 __ LDA #$05
11c3 : 85 34 __ STA P7 
11c5 : 18 __ __ CLC
.l1045:
11c6 : a9 b9 __ LDA #$b9
11c8 : 85 2e __ STA P1 
11ca : a9 09 __ LDA #$09
11cc : 85 2f __ STA P2 
11ce : a9 00 __ LDA #$00
11d0 : 85 30 __ STA P3 
11d2 : a9 03 __ LDA #$03
11d4 : 85 31 __ STA P4 
11d6 : 85 32 __ STA P5 
11d8 : 85 33 __ STA P6 
11da : a5 47 __ LDA T1 + 0 
11dc : 69 34 __ ADC #$34
11de : 85 2d __ STA P0 
11e0 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
11e3 : a9 f4 __ LDA #$f4
11e5 : 85 2e __ STA P1 
11e7 : a9 00 __ LDA #$00
11e9 : 85 2f __ STA P2 
11eb : 38 __ __ SEC
11ec : a5 48 __ LDA T2 + 0 
11ee : e9 20 __ SBC #$20
11f0 : 85 4a __ STA T3 + 0 
11f2 : 85 30 __ STA P3 
11f4 : a5 49 __ LDA T2 + 1 
11f6 : e9 00 __ SBC #$00
11f8 : 85 4b __ STA T3 + 1 
11fa : 85 31 __ STA P4 
11fc : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
11ff : a9 b9 __ LDA #$b9
1201 : 85 2e __ STA P1 
1203 : a9 09 __ LDA #$09
1205 : 85 2f __ STA P2 
1207 : a9 00 __ LDA #$00
1209 : 85 30 __ STA P3 
120b : a9 03 __ LDA #$03
120d : 85 31 __ STA P4 
120f : 18 __ __ CLC
1210 : a5 47 __ LDA T1 + 0 
1212 : 69 3b __ ADC #$3b
1214 : 85 2d __ STA P0 
1216 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
1219 : a9 40 __ LDA #$40
121b : 85 2e __ STA P1 
121d : a9 01 __ LDA #$01
121f : 85 2f __ STA P2 
1221 : a5 4a __ LDA T3 + 0 
1223 : 85 30 __ STA P3 
1225 : a5 4b __ LDA T3 + 1 
1227 : 85 31 __ STA P4 
1229 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
122c : 18 __ __ CLC
122d : a5 48 __ LDA T2 + 0 
122f : 69 40 __ ADC #$40
1231 : 85 48 __ STA T2 + 0 
1233 : 90 02 __ BCC $1237 ; (SetUpSprites.s1048 + 0)
.s1047:
1235 : e6 49 __ INC T2 + 1 
.s1048:
1237 : e6 47 __ INC T1 + 0 
1239 : a5 47 __ LDA T1 + 0 
123b : c9 07 __ CMP #$07
123d : 90 87 __ BCC $11c6 ; (SetUpSprites.l1045 + 0)
.s71:
123f : a9 20 __ LDA #$20
1241 : 85 2d __ STA P0 
1243 : a9 47 __ LDA #$47
1245 : 85 2e __ STA P1 
1247 : a9 00 __ LDA #$00
1249 : 85 30 __ STA P3 
124b : 85 33 __ STA P6 
124d : a9 08 __ LDA #$08
124f : 85 34 __ STA P7 
1251 : a9 00 __ LDA #$00
1253 : 85 31 __ STA P4 
1255 : a9 2f __ LDA #$2f
1257 : 85 32 __ STA P5 
1259 : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
125c : a9 42 __ LDA #$42
125e : 85 2d __ STA P0 
1260 : a9 39 __ LDA #$39
1262 : 85 2e __ STA P1 
1264 : a9 0a __ LDA #$0a
1266 : 85 2f __ STA P2 
1268 : a9 03 __ LDA #$03
126a : 85 31 __ STA P4 
126c : 85 32 __ STA P5 
126e : a9 07 __ LDA #$07
1270 : 85 33 __ STA P6 
1272 : a9 06 __ LDA #$06
1274 : 85 34 __ STA P7 
1276 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
1279 : a9 08 __ LDA #$08
127b : 85 2e __ STA P1 
127d : 85 30 __ STA P3 
127f : a9 00 __ LDA #$00
1281 : 85 2f __ STA P2 
1283 : 85 31 __ STA P4 
1285 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
1288 : a9 43 __ LDA #$43
128a : 85 2d __ STA P0 
128c : a9 39 __ LDA #$39
128e : 85 2e __ STA P1 
1290 : a9 0a __ LDA #$0a
1292 : 85 2f __ STA P2 
1294 : a9 00 __ LDA #$00
1296 : 85 30 __ STA P3 
1298 : a9 03 __ LDA #$03
129a : 85 31 __ STA P4 
129c : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
129f : a9 48 __ LDA #$48
12a1 : 85 2e __ STA P1 
12a3 : a9 00 __ LDA #$00
12a5 : 85 2f __ STA P2 
12a7 : 85 31 __ STA P4 
12a9 : a9 08 __ LDA #$08
12ab : 85 30 __ STA P3 
12ad : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
12b0 : a9 01 __ LDA #$01
12b2 : 85 2e __ STA P1 
12b4 : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
12b7 : a9 44 __ LDA #$44
12b9 : 85 2d __ STA P0 
12bb : a9 39 __ LDA #$39
12bd : 85 2e __ STA P1 
12bf : a9 0a __ LDA #$0a
12c1 : 85 2f __ STA P2 
12c3 : a9 00 __ LDA #$00
12c5 : 85 30 __ STA P3 
12c7 : a9 03 __ LDA #$03
12c9 : 85 31 __ STA P4 
12cb : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
12ce : a9 48 __ LDA #$48
12d0 : 85 2e __ STA P1 
12d2 : 85 30 __ STA P3 
12d4 : a9 00 __ LDA #$00
12d6 : 85 2f __ STA P2 
12d8 : 85 31 __ STA P4 
12da : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
12dd : a9 01 __ LDA #$01
12df : 85 2e __ STA P1 
12e1 : 85 2f __ STA P2 
12e3 : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
12e6 : a9 45 __ LDA #$45
12e8 : 85 2d __ STA P0 
12ea : a9 39 __ LDA #$39
12ec : 85 2e __ STA P1 
12ee : a9 0a __ LDA #$0a
12f0 : 85 2f __ STA P2 
12f2 : a9 00 __ LDA #$00
12f4 : 85 30 __ STA P3 
12f6 : a9 03 __ LDA #$03
12f8 : 85 31 __ STA P4 
12fa : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
12fd : a9 08 __ LDA #$08
12ff : 85 2e __ STA P1 
1301 : a9 00 __ LDA #$00
1303 : 85 2f __ STA P2 
1305 : 85 31 __ STA P4 
1307 : a9 48 __ LDA #$48
1309 : 85 30 __ STA P3 
130b : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
130e : a9 00 __ LDA #$00
1310 : 85 2e __ STA P1 
1312 : a9 01 __ LDA #$01
1314 : 85 2f __ STA P2 
1316 : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
1319 : a9 20 __ LDA #$20
131b : 85 2d __ STA P0 
131d : a9 47 __ LDA #$47
131f : 85 2e __ STA P1 
1321 : a9 00 __ LDA #$00
1323 : 85 30 __ STA P3 
1325 : a9 00 __ LDA #$00
1327 : 85 31 __ STA P4 
1329 : a9 2f __ LDA #$2f
132b : 85 32 __ STA P5 
132d : a9 00 __ LDA #$00
132f : 85 33 __ STA P6 
1331 : a9 08 __ LDA #$08
1333 : 85 34 __ STA P7 
1335 : 20 d6 14 JSR $14d6 ; (vram_putn.s0 + 0)
1338 : a9 46 __ LDA #$46
133a : 85 2d __ STA P0 
133c : a9 39 __ LDA #$39
133e : 85 2e __ STA P1 
1340 : a9 0a __ LDA #$0a
1342 : 85 2f __ STA P2 
1344 : a9 03 __ LDA #$03
1346 : 85 31 __ STA P4 
1348 : 85 32 __ STA P5 
134a : a9 07 __ LDA #$07
134c : 85 33 __ STA P6 
134e : a9 06 __ LDA #$06
1350 : 85 34 __ STA P7 
1352 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
1355 : a9 f8 __ LDA #$f8
1357 : 85 2e __ STA P1 
1359 : a9 01 __ LDA #$01
135b : 85 2f __ STA P2 
135d : a9 08 __ LDA #$08
135f : 85 30 __ STA P3 
1361 : a9 00 __ LDA #$00
1363 : 85 31 __ STA P4 
1365 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
1368 : a9 47 __ LDA #$47
136a : 85 2d __ STA P0 
136c : a9 39 __ LDA #$39
136e : 85 2e __ STA P1 
1370 : a9 0a __ LDA #$0a
1372 : 85 2f __ STA P2 
1374 : a9 00 __ LDA #$00
1376 : 85 30 __ STA P3 
1378 : a9 03 __ LDA #$03
137a : 85 31 __ STA P4 
137c : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
137f : a9 38 __ LDA #$38
1381 : 85 2e __ STA P1 
1383 : a9 02 __ LDA #$02
1385 : 85 2f __ STA P2 
1387 : a9 08 __ LDA #$08
1389 : 85 30 __ STA P3 
138b : a9 00 __ LDA #$00
138d : 85 31 __ STA P4 
138f : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
1392 : a9 01 __ LDA #$01
1394 : 85 2e __ STA P1 
1396 : a9 00 __ LDA #$00
1398 : 85 2f __ STA P2 
139a : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
139d : a9 48 __ LDA #$48
139f : 85 2d __ STA P0 
13a1 : a9 39 __ LDA #$39
13a3 : 85 2e __ STA P1 
13a5 : a9 0a __ LDA #$0a
13a7 : 85 2f __ STA P2 
13a9 : a9 00 __ LDA #$00
13ab : 85 30 __ STA P3 
13ad : a9 03 __ LDA #$03
13af : 85 31 __ STA P4 
13b1 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
13b4 : a9 38 __ LDA #$38
13b6 : 85 2e __ STA P1 
13b8 : a9 02 __ LDA #$02
13ba : 85 2f __ STA P2 
13bc : a9 48 __ LDA #$48
13be : 85 30 __ STA P3 
13c0 : a9 00 __ LDA #$00
13c2 : 85 31 __ STA P4 
13c4 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
13c7 : a9 01 __ LDA #$01
13c9 : 85 2e __ STA P1 
13cb : 85 2f __ STA P2 
13cd : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
13d0 : a9 49 __ LDA #$49
13d2 : 85 2d __ STA P0 
13d4 : a9 39 __ LDA #$39
13d6 : 85 2e __ STA P1 
13d8 : a9 0a __ LDA #$0a
13da : 85 2f __ STA P2 
13dc : a9 00 __ LDA #$00
13de : 85 30 __ STA P3 
13e0 : a9 03 __ LDA #$03
13e2 : 85 31 __ STA P4 
13e4 : 20 38 15 JSR $1538 ; (vera_spr_set.s0 + 0)
13e7 : a9 f8 __ LDA #$f8
13e9 : 85 2e __ STA P1 
13eb : a9 01 __ LDA #$01
13ed : 85 2f __ STA P2 
13ef : a9 48 __ LDA #$48
13f1 : 85 30 __ STA P3 
13f3 : a9 00 __ LDA #$00
13f5 : 85 31 __ STA P4 
13f7 : 20 95 15 JSR $1595 ; (vera_spr_move.s0 + 0)
13fa : a9 00 __ LDA #$00
13fc : 85 2e __ STA P1 
13fe : 20 ce 15 JSR $15ce ; (vera_spr_flip.s0 + 0)
1401 : a9 20 __ LDA #$20
1403 : 85 37 __ STA P10 
1405 : a9 40 __ LDA #$40
1407 : 8d fc 9e STA $9efc ; (sstack + 0)
140a : a9 fa __ LDA #$fa
140c : 8d fd 9e STA $9efd ; (sstack + 1)
140f : a9 01 __ LDA #$01
1411 : 8d fe 9e STA $9efe ; (sstack + 2)
1414 : a9 00 __ LDA #$00
1416 : 8d ff 9e STA $9eff ; (sstack + 3)
1419 : a9 cf __ LDA #$cf
141b : 85 35 __ STA P8 
141d : a9 1a __ LDA #$1a
141f : 85 36 __ STA P9 
1421 : 20 54 16 JSR $1654 ; (SetPaletteColours.s0 + 0)
1424 : a9 60 __ LDA #$60
1426 : 8d fc 9e STA $9efc ; (sstack + 0)
1429 : a9 fa __ LDA #$fa
142b : 8d fd 9e STA $9efd ; (sstack + 1)
142e : a9 01 __ LDA #$01
1430 : 8d fe 9e STA $9efe ; (sstack + 2)
1433 : a9 00 __ LDA #$00
1435 : 8d ff 9e STA $9eff ; (sstack + 3)
1438 : a9 00 __ LDA #$00
143a : 85 35 __ STA P8 
143c : a9 37 __ LDA #$37
143e : 85 36 __ STA P9 
1440 : 20 54 16 JSR $1654 ; (SetPaletteColours.s0 + 0)
1443 : a9 80 __ LDA #$80
1445 : 8d fc 9e STA $9efc ; (sstack + 0)
1448 : a9 fa __ LDA #$fa
144a : 8d fd 9e STA $9efd ; (sstack + 1)
144d : a9 01 __ LDA #$01
144f : 8d fe 9e STA $9efe ; (sstack + 2)
1452 : a9 00 __ LDA #$00
1454 : 8d ff 9e STA $9eff ; (sstack + 3)
1457 : a9 20 __ LDA #$20
1459 : 85 35 __ STA P8 
145b : a9 37 __ LDA #$37
145d : 85 36 __ STA P9 
145f : 20 54 16 JSR $1654 ; (SetPaletteColours.s0 + 0)
1462 : a9 60 __ LDA #$60
1464 : 85 2d __ STA P0 
1466 : a9 0c __ LDA #$0c
1468 : 85 30 __ STA P3 
146a : a9 00 __ LDA #$00
146c : 85 31 __ STA P4 
146e : a9 ef __ LDA #$ef
1470 : 85 2e __ STA P1 
1472 : a9 1a __ LDA #$1a
1474 : 85 2f __ STA P2 
1476 : 4c 0b 16 JMP $160b ; (vera_pal_putn.s0 + 0)
.s1017:
1479 : c9 09 __ CMP #$09
147b : 90 06 __ BCC $1483 ; (SetUpSprites.s32 + 0)
.s1016:
147d : a9 45 __ LDA #$45
147f : c5 48 __ CMP T2 + 0 
1481 : b0 05 __ BCS $1488 ; (SetUpSprites.s1005 + 0)
.s32:
1483 : a9 04 __ LDA #$04
1485 : 4c 50 0e JMP $0e50 ; (SetUpSprites.s174 + 0)
.s1005:
1488 : a5 48 __ LDA T2 + 0 
148a : c9 13 __ CMP #$13
148c : 90 06 __ BCC $1494 ; (SetUpSprites.s36 + 0)
.s1004:
148e : a9 3b __ LDA #$3b
1490 : c5 48 __ CMP T2 + 0 
1492 : b0 05 __ BCS $1499 ; (SetUpSprites.s1003 + 0)
.s36:
1494 : a9 05 __ LDA #$05
1496 : 4c 43 0e JMP $0e43 ; (SetUpSprites.s184 + 0)
.s1003:
1499 : a5 48 __ LDA T2 + 0 
149b : c9 1d __ CMP #$1d
149d : 90 06 __ BCC $14a5 ; (SetUpSprites.s40 + 0)
.s1002:
149f : a9 31 __ LDA #$31
14a1 : c5 48 __ CMP T2 + 0 
14a3 : b0 05 __ BCS $14aa ; (SetUpSprites.s41 + 0)
.s40:
14a5 : a9 06 __ LDA #$06
14a7 : 4c 43 0e JMP $0e43 ; (SetUpSprites.s184 + 0)
.s41:
14aa : a9 07 __ LDA #$07
14ac : 4c 43 0e JMP $0e43 ; (SetUpSprites.s184 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
14af : a5 2d __ LDA P0 ; (bank + 0)
14b1 : 4a __ __ LSR
14b2 : a9 00 __ LDA #$00
14b4 : 6a __ __ ROR
14b5 : 85 3b __ STA ACCU + 0 
14b7 : a5 2f __ LDA P2 ; (mem + 1)
14b9 : 29 f8 __ AND #$f8
14bb : 4a __ __ LSR
14bc : 05 3b __ ORA ACCU + 0 
14be : 85 3b __ STA ACCU + 0 
14c0 : a5 30 __ LDA P3 ; (height + 0)
14c2 : 0a __ __ ASL
14c3 : 05 3b __ ORA ACCU + 0 
14c5 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
14c7 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
14c8 : a5 2d __ LDA P0 ; (bank + 0)
14ca : 4a __ __ LSR
14cb : a9 00 __ LDA #$00
14cd : 6a __ __ ROR
14ce : 85 3b __ STA ACCU + 0 
14d0 : a5 2f __ LDA P2 ; (mem + 1)
14d2 : 4a __ __ LSR
14d3 : 05 3b __ ORA ACCU + 0 
.s1001:
14d5 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
14d6 : ad 25 9f LDA $9f25 
14d9 : 29 fe __ AND #$fe
14db : 8d 25 9f STA $9f25 
14de : a5 2d __ LDA P0 ; (addr + 0)
14e0 : 8d 20 9f STA $9f20 
14e3 : a5 2e __ LDA P1 ; (addr + 1)
14e5 : 8d 21 9f STA $9f21 
14e8 : a5 2f __ LDA P2 ; (addr + 2)
14ea : 29 01 __ AND #$01
14ec : 09 10 __ ORA #$10
14ee : 8d 22 9f STA $9f22 
14f1 : a5 33 __ LDA P6 ; (size + 0)
14f3 : 05 34 __ ORA P7 ; (size + 1)
14f5 : f0 19 __ BEQ $1510 ; (vram_putn.s1001 + 0)
.s6:
14f7 : a0 00 __ LDY #$00
14f9 : a6 33 __ LDX P6 ; (size + 0)
14fb : f0 02 __ BEQ $14ff ; (vram_putn.l1002 + 0)
.s1005:
14fd : e6 34 __ INC P7 ; (size + 1)
.l1002:
14ff : b1 31 __ LDA (P4),y ; (data + 0)
1501 : 8d 23 9f STA $9f23 
1504 : c8 __ __ INY
1505 : d0 02 __ BNE $1509 ; (vram_putn.s1009 + 0)
.s1008:
1507 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1509 : ca __ __ DEX
150a : d0 f3 __ BNE $14ff ; (vram_putn.l1002 + 0)
.s1004:
150c : c6 34 __ DEC P7 ; (size + 1)
150e : d0 ef __ BNE $14ff ; (vram_putn.l1002 + 0)
.s1001:
1510 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b20 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1b60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1b70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1b80 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1b90 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
1ba0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
1bb0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
1bc0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1bd0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1be0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
1bf0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
1511 : ad 8e 1a LDA $1a8e ; (seed + 1)
1514 : 4a __ __ LSR
1515 : ad 8d 1a LDA $1a8d ; (seed + 0)
1518 : 6a __ __ ROR
1519 : aa __ __ TAX
151a : a9 00 __ LDA #$00
151c : 6a __ __ ROR
151d : 4d 8d 1a EOR $1a8d ; (seed + 0)
1520 : 85 3b __ STA ACCU + 0 
1522 : 8a __ __ TXA
1523 : 4d 8e 1a EOR $1a8e ; (seed + 1)
1526 : 85 3c __ STA ACCU + 1 
1528 : 4a __ __ LSR
1529 : 45 3b __ EOR ACCU + 0 
152b : 8d 8d 1a STA $1a8d ; (seed + 0)
152e : 85 3b __ STA ACCU + 0 
1530 : 45 3c __ EOR ACCU + 1 
1532 : 8d 8e 1a STA $1a8e ; (seed + 1)
1535 : 85 3c __ STA ACCU + 1 
.s1001:
1537 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1a8d : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1c50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1c60 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1c70 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1c80 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1c90 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ca0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1cb0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1cc0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1cd0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1ce0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1cf0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1d00 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1d10 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1d20 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1d30 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1d40 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1d50 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1d60 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1d70 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1d80 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1d90 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1da0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1db0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1dc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1dd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1de0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1df0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e00 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e20 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e40 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e60 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e80 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1e90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ea0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1eb0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ec0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ed0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ee0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ef0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1f00 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
1f10 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
1f20 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
1f30 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
1f40 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
1f50 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
1f60 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
1f70 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
1f80 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
1f90 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
1fa0 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
1fb0 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
1fc0 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
1fd0 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
1fe0 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
1ff0 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
1538 : ad 25 9f LDA $9f25 
153b : 29 fe __ AND #$fe
153d : 8d 25 9f STA $9f25 
1540 : a5 2d __ LDA P0 ; (spr + 0)
1542 : 0a __ __ ASL
1543 : 0a __ __ ASL
1544 : 85 3b __ STA ACCU + 0 
1546 : a9 3f __ LDA #$3f
1548 : 2a __ __ ROL
1549 : 06 3b __ ASL ACCU + 0 
154b : 2a __ __ ROL
154c : 8d 21 9f STA $9f21 
154f : a5 3b __ LDA ACCU + 0 
1551 : 8d 20 9f STA $9f20 
1554 : a9 11 __ LDA #$11
1556 : 8d 22 9f STA $9f22 
1559 : a5 30 __ LDA P3 ; (mode8 + 0)
155b : f0 02 __ BEQ $155f ; (vera_spr_set.s11 + 0)
.s9:
155d : a9 80 __ LDA #$80
.s11:
155f : 05 2f __ ORA P2 ; (addr32 + 1)
1561 : a6 2e __ LDX P1 ; (addr32 + 0)
1563 : 8e 23 9f STX $9f23 
1566 : 8d 23 9f STA $9f23 
1569 : a9 00 __ LDA #$00
156b : 8d 23 9f STA $9f23 
156e : 8d 23 9f STA $9f23 
1571 : 8d 23 9f STA $9f23 
1574 : 8d 23 9f STA $9f23 
1577 : a5 33 __ LDA P6 ; (z + 0)
1579 : 0a __ __ ASL
157a : 0a __ __ ASL
157b : 8d 23 9f STA $9f23 
157e : a5 32 __ LDA P5 ; (h + 0)
1580 : 4a __ __ LSR
1581 : 6a __ __ ROR
1582 : 29 80 __ AND #$80
1584 : 6a __ __ ROR
1585 : 85 3b __ STA ACCU + 0 
1587 : a5 31 __ LDA P4 ; (w + 0)
1589 : 0a __ __ ASL
158a : 0a __ __ ASL
158b : 0a __ __ ASL
158c : 0a __ __ ASL
158d : 05 3b __ ORA ACCU + 0 
158f : 05 34 __ ORA P7 ; (pal + 0)
1591 : 8d 23 9f STA $9f23 
.s1001:
1594 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1595 : ad 25 9f LDA $9f25 
1598 : 29 fe __ AND #$fe
159a : 8d 25 9f STA $9f25 
159d : a5 2d __ LDA P0 ; (spr + 0)
159f : 0a __ __ ASL
15a0 : 0a __ __ ASL
15a1 : 85 3b __ STA ACCU + 0 
15a3 : a9 3f __ LDA #$3f
15a5 : 2a __ __ ROL
15a6 : 06 3b __ ASL ACCU + 0 
15a8 : 2a __ __ ROL
15a9 : aa __ __ TAX
15aa : a5 3b __ LDA ACCU + 0 
15ac : 09 02 __ ORA #$02
15ae : 8d 20 9f STA $9f20 
15b1 : 8e 21 9f STX $9f21 
15b4 : a9 11 __ LDA #$11
15b6 : 8d 22 9f STA $9f22 
15b9 : a5 2e __ LDA P1 ; (x + 0)
15bb : 8d 23 9f STA $9f23 
15be : a5 2f __ LDA P2 ; (x + 1)
15c0 : 8d 23 9f STA $9f23 
15c3 : a5 30 __ LDA P3 ; (y + 0)
15c5 : 8d 23 9f STA $9f23 
15c8 : a5 31 __ LDA P4 ; (y + 1)
15ca : 8d 23 9f STA $9f23 
.s1001:
15cd : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
15ce : ad 25 9f LDA $9f25 
15d1 : 29 fe __ AND #$fe
15d3 : 8d 25 9f STA $9f25 
15d6 : a5 2d __ LDA P0 ; (spr + 0)
15d8 : 0a __ __ ASL
15d9 : 0a __ __ ASL
15da : 85 3b __ STA ACCU + 0 
15dc : a9 3f __ LDA #$3f
15de : 2a __ __ ROL
15df : 06 3b __ ASL ACCU + 0 
15e1 : 2a __ __ ROL
15e2 : aa __ __ TAX
15e3 : a5 3b __ LDA ACCU + 0 
15e5 : 09 06 __ ORA #$06
15e7 : 8d 20 9f STA $9f20 
15ea : 8e 21 9f STX $9f21 
15ed : a9 01 __ LDA #$01
15ef : 8d 22 9f STA $9f22 
15f2 : ad 23 9f LDA $9f23 
15f5 : 29 fc __ AND #$fc
15f7 : a8 __ __ TAY
15f8 : a5 2e __ LDA P1 ; (fliph + 0)
15fa : f0 01 __ BEQ $15fd ; (vera_spr_flip.s14 + 0)
.s6:
15fc : c8 __ __ INY
.s14:
15fd : a5 2f __ LDA P2 ; (flipv + 0)
15ff : f0 05 __ BEQ $1606 ; (vera_spr_flip.s11 + 0)
.s9:
1601 : 98 __ __ TYA
1602 : 09 02 __ ORA #$02
1604 : d0 01 __ BNE $1607 ; (vera_spr_flip.s1002 + 0)
.s11:
1606 : 98 __ __ TYA
.s1002:
1607 : 8d 23 9f STA $9f23 
.s1001:
160a : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2000 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2010 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2020 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2030 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2040 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2050 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2060 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2070 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2080 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2090 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
20a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
20b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
20c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
20d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
20e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
20f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2100 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2110 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2120 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2130 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2140 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2150 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2160 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2170 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2180 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2190 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
21a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
21b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
21c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
21d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
21e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
21f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2200 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2210 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2220 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2230 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2240 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2250 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2260 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2270 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2280 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2290 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
22a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
22b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
22c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
22d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
22e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
22f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
160b : ad 25 9f LDA $9f25 
160e : 29 fe __ AND #$fe
1610 : 8d 25 9f STA $9f25 
1613 : a5 2d __ LDA P0 ; (index + 0)
1615 : 0a __ __ ASL
1616 : 8d 20 9f STA $9f20 
1619 : a9 7d __ LDA #$7d
161b : 2a __ __ ROL
161c : 8d 21 9f STA $9f21 
161f : a9 11 __ LDA #$11
1621 : 8d 22 9f STA $9f22 
1624 : a5 30 __ LDA P3 ; (size + 0)
1626 : 05 31 __ ORA P4 ; (size + 1)
1628 : f0 29 __ BEQ $1653 ; (vera_pal_putn.s1001 + 0)
.s6:
162a : a6 30 __ LDX P3 ; (size + 0)
162c : f0 02 __ BEQ $1630 ; (vera_pal_putn.l3 + 0)
.s1003:
162e : e6 31 __ INC P4 ; (size + 1)
.l3:
1630 : a0 01 __ LDY #$01
1632 : b1 2e __ LDA (P1),y ; (color + 0)
1634 : 85 3c __ STA ACCU + 1 
1636 : 88 __ __ DEY
1637 : b1 2e __ LDA (P1),y ; (color + 0)
1639 : 8d 23 9f STA $9f23 
163c : a5 3c __ LDA ACCU + 1 
163e : 8d 23 9f STA $9f23 
1641 : 18 __ __ CLC
1642 : a5 2e __ LDA P1 ; (color + 0)
1644 : 69 02 __ ADC #$02
1646 : 85 2e __ STA P1 ; (color + 0)
1648 : 90 02 __ BCC $164c ; (vera_pal_putn.s1007 + 0)
.s1006:
164a : e6 2f __ INC P2 ; (color + 1)
.s1007:
164c : ca __ __ DEX
164d : d0 e1 __ BNE $1630 ; (vera_pal_putn.l3 + 0)
.s1002:
164f : c6 31 __ DEC P4 ; (size + 1)
1651 : d0 dd __ BNE $1630 ; (vera_pal_putn.l3 + 0)
.s1001:
1653 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
1a8f : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
1a9f : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
1aaf : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
1abf : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainEyeBack:
2300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2310 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2330 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2350 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2370 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2390 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
23a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
23b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
23c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
23d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
23e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
23f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2400 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2410 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2420 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2430 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2440 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2450 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2460 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2470 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2480 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2490 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
24a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
24b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
24c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
24d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
24e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
24f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2500 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2510 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2520 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2530 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2540 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2550 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2560 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2570 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2580 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2590 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
25a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
25b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
25c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
25d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
25e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
25f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2600 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2610 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2620 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2630 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2640 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2650 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2660 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2670 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2680 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2690 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
26a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
26b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
26c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
26d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
26e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
26f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2700 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2710 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2720 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2730 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2740 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2750 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2760 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2770 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2780 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2790 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
27a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
27b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
27c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
27d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
27e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
27f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2800 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2810 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2820 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2830 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2840 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2850 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2860 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2870 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2880 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2890 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
28a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
28b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
28c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
28d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
28e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
28f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2900 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2910 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2920 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2930 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2940 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2950 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2960 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2970 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2980 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2990 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
29a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
29b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
29c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
29d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
29e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
29f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2a00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2a90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2aa0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ab0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ac0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ad0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2ae0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2af0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2b00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2b10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2b20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2b30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2b40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2b50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2b60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2b70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2b80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2b90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2ba0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2bb0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2bc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2bd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2be0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
2bf0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
2c00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
2c10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
2c20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
2c30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
2c40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
2c50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
2c60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
2c70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
2c80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
2c90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
2ca0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
2cb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
2cc0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
2cd0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
2ce0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
2cf0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
2d00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2d10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
2d20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2d30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
2d40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2d50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
2d60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2d70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
2d80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2d90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
2da0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2db0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
2dc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2dd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
2de0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
2df0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
2e00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
2e10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
2e20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
2e30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
2e40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
2e50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
2e60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
2e70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
2e80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
2e90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
2ea0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
2eb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
2ec0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
2ed0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
2ee0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
2ef0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
CharBox:
2f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f20 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2f30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2f40 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
2f50 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2f60 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
2f70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2f80 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
2f90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2fa0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
2fb0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2fc0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
2fd0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
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
3210 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3220 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3230 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3240 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3250 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3260 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3270 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3280 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3290 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
32a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
32b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
32c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
32d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
32e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
32f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3300 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3310 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3320 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3330 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3340 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3350 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3360 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3370 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3380 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3390 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
33a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
33b0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
33c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
33d0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
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
3600 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3610 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3620 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3630 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3640 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3650 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3660 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3670 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
3680 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3690 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
36a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36b0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
36c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36d0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
36e0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
36f0 : __ __ __ BYT 12 24 43 35 55 55 55 55 55 55 55 55 55 55 55 55 : .$C5UUUUUUUUUUUU
--------------------------------------------------------------------
SetPaletteColours:
.s0:
1654 : ad fc 9e LDA $9efc ; (sstack + 0)
1657 : 85 2d __ STA P0 
1659 : ad fd 9e LDA $9efd ; (sstack + 1)
165c : 85 2e __ STA P1 
165e : ad fe 9e LDA $9efe ; (sstack + 2)
1661 : 85 2f __ STA P2 
1663 : ad ff 9e LDA $9eff ; (sstack + 3)
1666 : 85 30 __ STA P3 
1668 : a5 35 __ LDA P8 ; (input + 0)
166a : 85 31 __ STA P4 
166c : a5 36 __ LDA P9 ; (input + 1)
166e : 85 32 __ STA P5 
1670 : a5 37 __ LDA P10 ; (inputsize + 0)
1672 : 85 33 __ STA P6 
1674 : a9 00 __ LDA #$00
1676 : 85 34 __ STA P7 
1678 : 4c d6 14 JMP $14d6 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
1acf : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
1adf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
3700 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
3710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
3720 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
3730 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
1aef : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
p:
1afb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalTimer:
1afd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
3740 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
3750 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
167b : a9 10 __ LDA #$10
167d : 85 30 __ STA P3 
167f : a9 00 __ LDA #$00
1681 : 85 31 __ STA P4 
1683 : a5 32 __ LDA P5 ; (Palette + 0)
1685 : 85 2e __ STA P1 
1687 : 85 47 __ STA T0 + 0 
1689 : a5 33 __ LDA P6 ; (Palette + 1)
168b : 85 2f __ STA P2 
168d : 85 48 __ STA T0 + 1 
168f : ad fc 9e LDA $9efc ; (sstack + 0)
1692 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1694 : 0a __ __ ASL
1695 : 85 49 __ STA T2 + 0 
1697 : ad fd 9e LDA $9efd ; (sstack + 1)
169a : 2a __ __ ROL
169b : 18 __ __ CLC
169c : 65 33 __ ADC P6 ; (Palette + 1)
169e : 85 4a __ STA T2 + 1 
16a0 : a4 32 __ LDY P5 ; (Palette + 0)
16a2 : b1 49 __ LDA (T2 + 0),y 
16a4 : aa __ __ TAX
16a5 : c8 __ __ INY
16a6 : b1 49 __ LDA (T2 + 0),y 
16a8 : 86 49 __ STX T2 + 0 
16aa : 85 4a __ STA T2 + 1 
16ac : a9 00 __ LDA #$00
16ae : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
16b0 : ad fe 9e LDA $9efe ; (sstack + 2)
16b3 : 85 4b __ STA T4 + 0 
16b5 : 38 __ __ SEC
16b6 : e9 01 __ SBC #$01
16b8 : 85 4d __ STA T5 + 0 
16ba : ad ff 9e LDA $9eff ; (sstack + 3)
16bd : 85 4c __ STA T4 + 1 
16bf : e9 00 __ SBC #$00
16c1 : 85 4e __ STA T5 + 1 
16c3 : d0 06 __ BNE $16cb ; (SetPaletteIndex.s5 + 0)
.s1004:
16c5 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
16c7 : c5 4d __ CMP T5 + 0 
16c9 : b0 38 __ BCS $1703 ; (SetPaletteIndex.s4 + 0)
.s5:
16cb : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
16cd : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
16cf : 18 __ __ CLC
16d0 : a5 32 __ LDA P5 ; (Palette + 0)
16d2 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
16d4 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
16d6 : a5 33 __ LDA P6 ; (Palette + 1)
16d8 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
16da : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
16dc : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
16df : a0 02 __ LDY #$02
16e1 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
16e3 : a0 00 __ LDY #$00
16e5 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
16e7 : a0 03 __ LDY #$03
16e9 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
16eb : a0 01 __ LDY #$01
16ed : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
16ef : 18 __ __ CLC
16f0 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
16f2 : 69 02 __ ADC #$02
16f4 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
16f6 : 90 02 __ BCC $16fa ; (SetPaletteIndex.s1008 + 0)
.s1007:
16f8 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
16fa : e8 __ __ INX
16fb : a5 4e __ LDA T5 + 1 
16fd : d0 e0 __ BNE $16df ; (SetPaletteIndex.l2 + 0)
.s1002:
16ff : e4 4d __ CPX T5 + 0 
1701 : 90 dc __ BCC $16df ; (SetPaletteIndex.l2 + 0)
.s4:
1703 : a5 4b __ LDA T4 + 0 
1705 : 0a __ __ ASL
1706 : aa __ __ TAX
1707 : a5 4c __ LDA T4 + 1 
1709 : 2a __ __ ROL
170a : a8 __ __ TAY
170b : 8a __ __ TXA
170c : 38 __ __ SEC
170d : e9 02 __ SBC #$02
170f : b0 01 __ BCS $1712 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1711 : 88 __ __ DEY
.s1010:
1712 : 18 __ __ CLC
1713 : 65 47 __ ADC T0 + 0 
1715 : 85 47 __ STA T0 + 0 
1717 : 98 __ __ TYA
1718 : 65 48 __ ADC T0 + 1 
171a : 85 48 __ STA T0 + 1 
171c : a5 49 __ LDA T2 + 0 
171e : a0 00 __ LDY #$00
1720 : 91 47 __ STA (T0 + 0),y 
1722 : a5 4a __ LDA T2 + 1 
1724 : c8 __ __ INY
1725 : 91 47 __ STA (T0 + 0),y 
1727 : a5 34 __ LDA P7 ; (index + 0)
1729 : 85 2d __ STA P0 
172b : 4c 0b 16 JMP $160b ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
3760 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
3762 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
3772 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
1aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
3782 : __ __ __ BYT 23 02 12 01 01 01 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
3792 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
BGPalShimmer:
37a2 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
37b2 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
zsm_check:
.s0:
172e : ad 8b 1a LDA $1a8b ; (zsm_finished + 0)
.s1001:
1731 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1732 : a9 01 __ LDA #$01
1734 : 8d 8b 1a STA $1a8b ; (zsm_finished + 0)
1737 : ad c2 37 LDA $37c2 ; (zsm_reading + 0)
173a : f0 0a __ BEQ $1746 ; (zsm_init.s3 + 0)
.s1:
173c : a9 02 __ LDA #$02
173e : 20 8b 17 JSR $178b ; (krnio_close.s1000 + 0)
1741 : a9 00 __ LDA #$00
1743 : 8d c2 37 STA $37c2 ; (zsm_reading + 0)
.s3:
1746 : 8d ca 37 STA $37ca ; (zsm_pos + 0)
1749 : 8d cb 37 STA $37cb ; (zsm_pos + 1)
174c : 8d cc 37 STA $37cc ; (zsm_wpos + 0)
174f : 8d cd 37 STA $37cd ; (zsm_wpos + 1)
1752 : 8d c9 37 STA $37c9 ; (zsm_delay + 0)
1755 : a5 30 __ LDA P3 ; (fname + 0)
1757 : 85 2d __ STA P0 
1759 : a5 31 __ LDA P4 ; (fname + 1)
175b : 85 2e __ STA P1 
175d : 20 93 17 JSR $1793 ; (krnio_setnam.s0 + 0)
1760 : a9 02 __ LDA #$02
1762 : 85 2d __ STA P0 
1764 : 85 2f __ STA P2 
1766 : a9 08 __ LDA #$08
1768 : 85 2e __ STA P1 
176a : 20 a9 17 JSR $17a9 ; (krnio_open.s0 + 0)
176d : a5 3b __ LDA ACCU + 0 
176f : f0 19 __ BEQ $178a ; (zsm_init.s1001 + 0)
.s4:
1771 : a9 01 __ LDA #$01
1773 : 8d c2 37 STA $37c2 ; (zsm_reading + 0)
1776 : 20 d1 17 JSR $17d1 ; (zsm_fill.s0 + 0)
1779 : a9 10 __ LDA #$10
177b : 8d ca 37 STA $37ca ; (zsm_pos + 0)
177e : a9 00 __ LDA #$00
1780 : 8d cb 37 STA $37cb ; (zsm_pos + 1)
1783 : 8d 8b 1a STA $1a8b ; (zsm_finished + 0)
1786 : a9 01 __ LDA #$01
1788 : 85 3b __ STA ACCU + 0 
.s1001:
178a : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
37c2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
178b : 85 2d __ STA P0 
.s0:
178d : a5 2d __ LDA P0 
178f : 20 c3 ff JSR $ffc3 
.s1001:
1792 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
37cc : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1793 : a5 2d __ LDA P0 
1795 : 05 2e __ ORA P1 
1797 : f0 08 __ BEQ $17a1 ; (krnio_setnam.s0 + 14)
1799 : a0 ff __ LDY #$ff
179b : c8 __ __ INY
179c : b1 2d __ LDA (P0),y 
179e : d0 fb __ BNE $179b ; (krnio_setnam.s0 + 8)
17a0 : 98 __ __ TYA
17a1 : a6 2d __ LDX P0 
17a3 : a4 2e __ LDY P1 
17a5 : 20 bd ff JSR $ffbd 
.s1001:
17a8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
17a9 : a9 00 __ LDA #$00
17ab : a6 2d __ LDX P0 ; (fnum + 0)
17ad : 9d ce 37 STA $37ce,x ; (krnio_pstatus + 0)
17b0 : a9 00 __ LDA #$00
17b2 : 85 3b __ STA ACCU + 0 
17b4 : 85 3c __ STA ACCU + 1 
17b6 : a5 2d __ LDA P0 ; (fnum + 0)
17b8 : a6 2e __ LDX P1 
17ba : a4 2f __ LDY P2 
17bc : 20 ba ff JSR $ffba 
17bf : 20 c0 ff JSR $ffc0 
17c2 : 90 08 __ BCC $17cc ; (krnio_open.s0 + 35)
17c4 : a5 2d __ LDA P0 ; (fnum + 0)
17c6 : 20 c3 ff JSR $ffc3 
17c9 : 4c d0 17 JMP $17d0 ; (krnio_open.s1001 + 0)
17cc : a9 01 __ LDA #$01
17ce : 85 3b __ STA ACCU + 0 
.s1001:
17d0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
37ce : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
17d1 : ad c2 37 LDA $37c2 ; (zsm_reading + 0)
17d4 : f0 20 __ BEQ $17f6 ; (zsm_fill.s1 + 0)
.s2:
17d6 : ad cb 37 LDA $37cb ; (zsm_pos + 1)
17d9 : 18 __ __ CLC
17da : 69 04 __ ADC #$04
17dc : cd cd 37 CMP $37cd ; (zsm_wpos + 1)
17df : d0 0c __ BNE $17ed ; (zsm_fill.s6 + 0)
.s1006:
17e1 : ad cc 37 LDA $37cc ; (zsm_wpos + 0)
17e4 : cd ca 37 CMP $37ca ; (zsm_pos + 0)
17e7 : d0 04 __ BNE $17ed ; (zsm_fill.s6 + 0)
.s5:
17e9 : a9 00 __ LDA #$00
17eb : f0 0b __ BEQ $17f8 ; (zsm_fill.s1008 + 0)
.s6:
17ed : a9 02 __ LDA #$02
17ef : 20 75 18 JSR $1875 ; (krnio_chkin.s1000 + 0)
17f2 : a5 3b __ LDA ACCU + 0 
17f4 : d0 07 __ BNE $17fd ; (zsm_fill.s9 + 0)
.s1:
17f6 : a9 ff __ LDA #$ff
.s1008:
17f8 : 85 3b __ STA ACCU + 0 
.s1001:
17fa : 85 3c __ STA ACCU + 1 
17fc : 60 __ __ RTS
.s9:
17fd : a9 00 __ LDA #$00
17ff : 85 47 __ STA T1 + 0 
1801 : 85 48 __ STA T1 + 1 
1803 : ad cb 37 LDA $37cb ; (zsm_pos + 1)
1806 : 18 __ __ CLC
1807 : 69 04 __ ADC #$04
1809 : cd cd 37 CMP $37cd ; (zsm_wpos + 1)
180c : d0 08 __ BNE $1816 ; (zsm_fill.l13 + 0)
.s1002:
180e : ad cc 37 LDA $37cc ; (zsm_wpos + 0)
1811 : cd ca 37 CMP $37ca ; (zsm_pos + 0)
1814 : f0 49 __ BEQ $185f ; (zsm_fill.s37 + 0)
.l13:
1816 : 20 87 18 JSR $1887 ; (krnio_chrin.s0 + 0)
1819 : ad cc 37 LDA $37cc ; (zsm_wpos + 0)
181c : aa __ __ TAX
181d : 18 __ __ CLC
181e : 69 01 __ ADC #$01
1820 : 8d cc 37 STA $37cc ; (zsm_wpos + 0)
1823 : ad cd 37 LDA $37cd ; (zsm_wpos + 1)
1826 : a8 __ __ TAY
1827 : 69 00 __ ADC #$00
1829 : 8d cd 37 STA $37cd ; (zsm_wpos + 1)
182c : 8a __ __ TXA
182d : 18 __ __ CLC
182e : 69 3b __ ADC #$3b
1830 : 85 49 __ STA T3 + 0 
1832 : 98 __ __ TYA
1833 : 29 03 __ AND #$03
1835 : 69 38 __ ADC #$38
1837 : 85 4a __ STA T3 + 1 
1839 : a5 3b __ LDA ACCU + 0 
183b : a0 00 __ LDY #$00
183d : 91 49 __ STA (T3 + 0),y 
183f : e6 47 __ INC T1 + 0 
1841 : d0 02 __ BNE $1845 ; (zsm_fill.s1010 + 0)
.s1009:
1843 : e6 48 __ INC T1 + 1 
.s1010:
1845 : 20 91 18 JSR $1891 ; (krnio_status.s0 + 0)
1848 : a5 3b __ LDA ACCU + 0 
184a : d0 0e __ BNE $185a ; (zsm_fill.s15 + 0)
.s12:
184c : ad cb 37 LDA $37cb ; (zsm_pos + 1)
184f : 18 __ __ CLC
1850 : 69 04 __ ADC #$04
1852 : cd cd 37 CMP $37cd ; (zsm_wpos + 1)
1855 : d0 bf __ BNE $1816 ; (zsm_fill.l13 + 0)
1857 : 4c 0e 18 JMP $180e ; (zsm_fill.s1002 + 0)
.s15:
185a : a9 00 __ LDA #$00
185c : 8d c2 37 STA $37c2 ; (zsm_reading + 0)
.s37:
185f : 20 9b 18 JSR $189b ; (krnio_clrchn.s0 + 0)
1862 : ad c2 37 LDA $37c2 ; (zsm_reading + 0)
1865 : d0 05 __ BNE $186c ; (zsm_fill.s21 + 0)
.s19:
1867 : a9 02 __ LDA #$02
1869 : 20 8b 17 JSR $178b ; (krnio_close.s1000 + 0)
.s21:
186c : a5 47 __ LDA T1 + 0 
186e : 85 3b __ STA ACCU + 0 
1870 : a5 48 __ LDA T1 + 1 
1872 : 4c fa 17 JMP $17fa ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1875 : 85 2d __ STA P0 
.s0:
1877 : a6 2d __ LDX P0 
1879 : 20 c6 ff JSR $ffc6 
187c : a9 00 __ LDA #$00
187e : 85 3c __ STA ACCU + 1 
1880 : b0 02 __ BCS $1884 ; (krnio_chkin.s0 + 13)
1882 : a9 01 __ LDA #$01
1884 : 85 3b __ STA ACCU + 0 
.s1001:
1886 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1887 : 20 cf ff JSR $ffcf 
188a : 85 3b __ STA ACCU + 0 
188c : a9 00 __ LDA #$00
188e : 85 3c __ STA ACCU + 1 
.s1001:
1890 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1891 : 20 b7 ff JSR $ffb7 
1894 : 85 3b __ STA ACCU + 0 
1896 : a9 00 __ LDA #$00
1898 : 85 3c __ STA ACCU + 1 
.s1001:
189a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
189b : 20 cc ff JSR $ffcc 
.s1001:
189e : 60 __ __ RTS
--------------------------------------------------------------------
189f : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
18af : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
18bd : 20 eb 18 JSR $18eb ; (getchx.s0 + 0)
18c0 : a5 3c __ LDA ACCU + 1 
18c2 : d0 22 __ BNE $18e6 ; (Control.s1006 + 0)
.s1005:
18c4 : a5 3b __ LDA ACCU + 0 
18c6 : c9 20 __ CMP #$20
18c8 : d0 1c __ BNE $18e6 ; (Control.s1006 + 0)
.s1:
18ca : a5 2e __ LDA P1 ; (playing + 0)
18cc : d0 0a __ BNE $18d8 ; (Control.s4 + 0)
.s5:
18ce : a9 01 __ LDA #$01
18d0 : 20 a4 19 JSR $19a4 ; (zsm_irq_play.s0 + 0)
18d3 : a9 01 __ LDA #$01
.s1001:
18d5 : 85 3b __ STA ACCU + 0 
18d7 : 60 __ __ RTS
.s4:
18d8 : a9 00 __ LDA #$00
18da : cd c4 37 CMP $37c4 ; (paused + 0)
18dd : 2a __ __ ROL
18de : 85 2d __ STA P0 
18e0 : 8d c4 37 STA $37c4 ; (paused + 0)
18e3 : 20 26 19 JSR $1926 ; (zsm_pause.s0 + 0)
.s1006:
18e6 : a5 2e __ LDA P1 ; (playing + 0)
18e8 : 4c d5 18 JMP $18d5 ; (Control.s1001 + 0)
--------------------------------------------------------------------
getchx:
.s0:
18eb : 20 f5 18 JSR $18f5 ; (getpch + 0)
18ee : 85 3b __ STA ACCU + 0 
18f0 : a9 00 __ LDA #$00
18f2 : 85 3c __ STA ACCU + 1 
.s1001:
18f4 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
18f5 : 20 e4 ff JSR $ffe4 
18f8 : ae c3 37 LDX $37c3 ; (giocharmap + 0)
18fb : e0 01 __ CPX #$01
18fd : 90 26 __ BCC $1925 ; (getpch + 48)
18ff : c9 0d __ CMP #$0d
1901 : d0 02 __ BNE $1905 ; (getpch + 16)
1903 : a9 0a __ LDA #$0a
1905 : e0 02 __ CPX #$02
1907 : 90 1c __ BCC $1925 ; (getpch + 48)
1909 : c9 db __ CMP #$db
190b : b0 18 __ BCS $1925 ; (getpch + 48)
190d : c9 41 __ CMP #$41
190f : 90 14 __ BCC $1925 ; (getpch + 48)
1911 : c9 c1 __ CMP #$c1
1913 : 90 02 __ BCC $1917 ; (getpch + 34)
1915 : 49 a0 __ EOR #$a0
1917 : c9 7b __ CMP #$7b
1919 : b0 0a __ BCS $1925 ; (getpch + 48)
191b : c9 61 __ CMP #$61
191d : b0 04 __ BCS $1923 ; (getpch + 46)
191f : c9 5b __ CMP #$5b
1921 : b0 02 __ BCS $1925 ; (getpch + 48)
1923 : 49 20 __ EOR #$20
1925 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
37c3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
paused:
37c4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1926 : a5 2d __ LDA P0 ; (pause + 0)
1928 : d0 0e __ BNE $1938 ; (zsm_pause.s4 + 0)
.s8:
192a : ad 8c 1a LDA $1a8c ; (zsm_paused + 0)
192d : f0 08 __ BEQ $1937 ; (zsm_pause.s1001 + 0)
.s5:
192f : 20 77 19 JSR $1977 ; (zsm_restore_volume.s0 + 0)
1932 : a9 00 __ LDA #$00
1934 : 8d 8c 1a STA $1a8c ; (zsm_paused + 0)
.s1001:
1937 : 60 __ __ RTS
.s4:
1938 : ad 8c 1a LDA $1a8c ; (zsm_paused + 0)
193b : d0 fa __ BNE $1937 ; (zsm_pause.s1001 + 0)
.s1:
193d : a9 01 __ LDA #$01
193f : 8d 8c 1a STA $1a8c ; (zsm_paused + 0)
1942 : 4c 45 19 JMP $1945 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1945 : a0 00 __ LDY #$00
1947 : 84 3c __ STY ACCU + 1 
1949 : a2 02 __ LDX #$02
194b : 18 __ __ CLC
.l1006:
194c : 8a __ __ TXA
194d : 09 c0 __ ORA #$c0
194f : 8d 20 9f STA $9f20 
1952 : a5 3c __ LDA ACCU + 1 
1954 : 09 f9 __ ORA #$f9
1956 : 8d 21 9f STA $9f21 
1959 : a9 01 __ LDA #$01
195b : 8d 22 9f STA $9f22 
195e : ad 23 9f LDA $9f23 
1961 : 99 de 37 STA $37de,y ; (vera_volumes + 0)
1964 : a9 00 __ LDA #$00
1966 : 8d 23 9f STA $9f23 
1969 : 8a __ __ TXA
196a : 69 04 __ ADC #$04
196c : aa __ __ TAX
196d : 90 02 __ BCC $1971 ; (zsm_save_volume.s1009 + 0)
.s1008:
196f : e6 3c __ INC ACCU + 1 
.s1009:
1971 : c8 __ __ INY
1972 : c0 10 __ CPY #$10
1974 : 90 d6 __ BCC $194c ; (zsm_save_volume.l1006 + 0)
.s1001:
1976 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
37de : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1977 : a0 00 __ LDY #$00
1979 : 84 3c __ STY ACCU + 1 
197b : a2 02 __ LDX #$02
197d : 18 __ __ CLC
.l1006:
197e : 8a __ __ TXA
197f : 09 c0 __ ORA #$c0
1981 : 8d 20 9f STA $9f20 
1984 : a5 3c __ LDA ACCU + 1 
1986 : 09 f9 __ ORA #$f9
1988 : 8d 21 9f STA $9f21 
198b : a9 01 __ LDA #$01
198d : 8d 22 9f STA $9f22 
1990 : b9 de 37 LDA $37de,y ; (vera_volumes + 0)
1993 : 8d 23 9f STA $9f23 
1996 : 8a __ __ TXA
1997 : 69 04 __ ADC #$04
1999 : aa __ __ TAX
199a : 90 02 __ BCC $199e ; (zsm_restore_volume.s1009 + 0)
.s1008:
199c : e6 3c __ INC ACCU + 1 
.s1009:
199e : c8 __ __ INY
199f : c0 10 __ CPY #$10
19a1 : 90 db __ BCC $197e ; (zsm_restore_volume.l1006 + 0)
.s1001:
19a3 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
19a4 : 8d 8a 1a STA $1a8a ; (zsm_playing + 0)
.s1001:
19a7 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
37c5 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
37ee : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
3800 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
3810 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
3820 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
3830 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
19a8 : ad 26 9f LDA $9f26 
19ab : 29 40 __ AND #$40
19ad : d0 f9 __ BNE $19a8 ; (frame_wait.l1 + 0)
.l4:
19af : ad 26 9f LDA $9f26 
19b2 : 29 40 __ AND #$40
19b4 : f0 f9 __ BEQ $19af ; (frame_wait.l4 + 0)
.s1001:
19b6 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
19b7 : 38 __ __ SEC
19b8 : a9 00 __ LDA #$00
19ba : e5 3b __ SBC ACCU + 0 
19bc : 85 3b __ STA ACCU + 0 
19be : a9 00 __ LDA #$00
19c0 : e5 3c __ SBC ACCU + 1 
19c2 : 85 3c __ STA ACCU + 1 
19c4 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
19c5 : 38 __ __ SEC
19c6 : a9 00 __ LDA #$00
19c8 : e5 23 __ SBC WORK + 0 
19ca : 85 23 __ STA WORK + 0 
19cc : a9 00 __ LDA #$00
19ce : e5 24 __ SBC WORK + 1 
19d0 : 85 24 __ STA WORK + 1 
19d2 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
19d3 : a5 3c __ LDA ACCU + 1 
19d5 : d0 31 __ BNE $1a08 ; (divmod + 53)
19d7 : a5 24 __ LDA WORK + 1 
19d9 : d0 1e __ BNE $19f9 ; (divmod + 38)
19db : 85 26 __ STA WORK + 3 
19dd : a2 04 __ LDX #$04
19df : 06 3b __ ASL ACCU + 0 
19e1 : 2a __ __ ROL
19e2 : c5 23 __ CMP WORK + 0 
19e4 : 90 02 __ BCC $19e8 ; (divmod + 21)
19e6 : e5 23 __ SBC WORK + 0 
19e8 : 26 3b __ ROL ACCU + 0 
19ea : 2a __ __ ROL
19eb : c5 23 __ CMP WORK + 0 
19ed : 90 02 __ BCC $19f1 ; (divmod + 30)
19ef : e5 23 __ SBC WORK + 0 
19f1 : 26 3b __ ROL ACCU + 0 
19f3 : ca __ __ DEX
19f4 : d0 eb __ BNE $19e1 ; (divmod + 14)
19f6 : 85 25 __ STA WORK + 2 
19f8 : 60 __ __ RTS
19f9 : a5 3b __ LDA ACCU + 0 
19fb : 85 25 __ STA WORK + 2 
19fd : a5 3c __ LDA ACCU + 1 
19ff : 85 26 __ STA WORK + 3 
1a01 : a9 00 __ LDA #$00
1a03 : 85 3b __ STA ACCU + 0 
1a05 : 85 3c __ STA ACCU + 1 
1a07 : 60 __ __ RTS
1a08 : a5 24 __ LDA WORK + 1 
1a0a : d0 1f __ BNE $1a2b ; (divmod + 88)
1a0c : a5 23 __ LDA WORK + 0 
1a0e : 30 1b __ BMI $1a2b ; (divmod + 88)
1a10 : a9 00 __ LDA #$00
1a12 : 85 26 __ STA WORK + 3 
1a14 : a2 10 __ LDX #$10
1a16 : 06 3b __ ASL ACCU + 0 
1a18 : 26 3c __ ROL ACCU + 1 
1a1a : 2a __ __ ROL
1a1b : c5 23 __ CMP WORK + 0 
1a1d : 90 02 __ BCC $1a21 ; (divmod + 78)
1a1f : e5 23 __ SBC WORK + 0 
1a21 : 26 3b __ ROL ACCU + 0 
1a23 : 26 3c __ ROL ACCU + 1 
1a25 : ca __ __ DEX
1a26 : d0 f2 __ BNE $1a1a ; (divmod + 71)
1a28 : 85 25 __ STA WORK + 2 
1a2a : 60 __ __ RTS
1a2b : a9 00 __ LDA #$00
1a2d : 85 25 __ STA WORK + 2 
1a2f : 85 26 __ STA WORK + 3 
1a31 : 84 22 __ STY $22 
1a33 : a0 10 __ LDY #$10
1a35 : 18 __ __ CLC
1a36 : 26 3b __ ROL ACCU + 0 
1a38 : 26 3c __ ROL ACCU + 1 
1a3a : 26 25 __ ROL WORK + 2 
1a3c : 26 26 __ ROL WORK + 3 
1a3e : 38 __ __ SEC
1a3f : a5 25 __ LDA WORK + 2 
1a41 : e5 23 __ SBC WORK + 0 
1a43 : aa __ __ TAX
1a44 : a5 26 __ LDA WORK + 3 
1a46 : e5 24 __ SBC WORK + 1 
1a48 : 90 04 __ BCC $1a4e ; (divmod + 123)
1a4a : 86 25 __ STX WORK + 2 
1a4c : 85 26 __ STA WORK + 3 
1a4e : 88 __ __ DEY
1a4f : d0 e5 __ BNE $1a36 ; (divmod + 99)
1a51 : 26 3b __ ROL ACCU + 0 
1a53 : 26 3c __ ROL ACCU + 1 
1a55 : a4 22 __ LDY $22 
1a57 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1a58 : 24 3c __ BIT ACCU + 1 
1a5a : 10 0d __ BPL $1a69 ; (mods16 + 17)
1a5c : 20 b7 19 JSR $19b7 ; (negaccu + 0)
1a5f : 24 24 __ BIT WORK + 1 
1a61 : 10 0d __ BPL $1a70 ; (mods16 + 24)
1a63 : 20 c5 19 JSR $19c5 ; (negtmp + 0)
1a66 : 4c d3 19 JMP $19d3 ; (divmod + 0)
1a69 : 24 24 __ BIT WORK + 1 
1a6b : 10 f9 __ BPL $1a66 ; (mods16 + 14)
1a6d : 20 c5 19 JSR $19c5 ; (negtmp + 0)
1a70 : 20 d3 19 JSR $19d3 ; (divmod + 0)
1a73 : 38 __ __ SEC
1a74 : a9 00 __ LDA #$00
1a76 : e5 25 __ SBC WORK + 2 
1a78 : 85 25 __ STA WORK + 2 
1a7a : a9 00 __ LDA #$00
1a7c : e5 26 __ SBC WORK + 3 
1a7e : 85 26 __ STA WORK + 3 
1a80 : 60 __ __ RTS
--------------------------------------------------------------------
__multab10L:
1a81 : __ __ __ BYT 00 0a 14 1e 28 32 3c 46                         : ....(2<F
