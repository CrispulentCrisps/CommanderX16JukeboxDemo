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
080e : 8e 01 16 STX $1601 ; (spentry + 0)
0811 : a9 3b __ LDA #$3b
0813 : 85 39 __ STA IP + 0 
0815 : a9 2d __ LDA #$2d
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 31 __ LDA #$31
081c : e9 2d __ SBC #$2d
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
0830 : a9 4b __ LDA #$4b
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
1601 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 cc 0a JSR $0acc ; (zsm_irq_init.s0 + 0)
0883 : 20 9a 0c JSR $0c9a ; (ClearVERAScreen.s0 + 0)
0886 : 20 dd 0c JSR $0cdd ; (SetUpSprites.s0 + 0)
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
08b7 : 85 50 __ STA T1 + 0 
.l2:
08b9 : ee e6 16 INC $16e6 ; (p + 0)
08bc : d0 03 __ BNE $08c1 ; (main.s1025 + 0)
.s1024:
08be : ee e7 16 INC $16e7 ; (p + 1)
.s1025:
08c1 : a5 50 __ LDA T1 + 0 
08c3 : f0 03 __ BEQ $08c8 ; (main.s5 + 0)
08c5 : 4c be 0a JMP $0abe ; (main.s4 + 0)
.s5:
08c8 : a9 20 __ LDA #$20
08ca : 85 37 __ STA P10 
08cc : a9 a0 __ LDA #$a0
08ce : 8d fc 9e STA $9efc ; (sstack + 0)
08d1 : a9 fa __ LDA #$fa
08d3 : 8d fd 9e STA $9efd ; (sstack + 1)
08d6 : a9 01 __ LDA #$01
08d8 : 8d fe 9e STA $9efe ; (sstack + 2)
08db : a9 00 __ LDA #$00
08dd : 8d ff 9e STA $9eff ; (sstack + 3)
08e0 : 8d e8 16 STA $16e8 ; (PalTimer + 0)
08e3 : 8d e9 16 STA $16e9 ; (PalTimer + 1)
08e6 : a9 00 __ LDA #$00
08e8 : 85 35 __ STA P8 
08ea : a9 2b __ LDA #$2b
08ec : 85 36 __ STA P9 
08ee : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
.s6:
08f1 : a9 3c __ LDA #$3c
08f3 : 8d 2c 9f STA $9f2c 
08f6 : ad e9 16 LDA $16e9 ; (PalTimer + 1)
08f9 : 30 5a __ BMI $0955 ; (main.s82 + 0)
.s1023:
08fb : d0 07 __ BNE $0904 ; (main.s7 + 0)
.s1022:
08fd : a9 03 __ LDA #$03
08ff : cd e8 16 CMP $16e8 ; (PalTimer + 0)
0902 : b0 51 __ BCS $0955 ; (main.s82 + 0)
.s7:
0904 : a9 20 __ LDA #$20
0906 : 85 37 __ STA P10 
0908 : a9 a0 __ LDA #$a0
090a : 8d fc 9e STA $9efc ; (sstack + 0)
090d : a9 fa __ LDA #$fa
090f : 8d fd 9e STA $9efd ; (sstack + 1)
0912 : a9 01 __ LDA #$01
0914 : 8d fe 9e STA $9efe ; (sstack + 2)
0917 : a9 00 __ LDA #$00
0919 : 8d ff 9e STA $9eff ; (sstack + 3)
091c : ad ea 16 LDA $16ea ; (PalIndex + 0)
091f : 18 __ __ CLC
0920 : 69 01 __ ADC #$01
0922 : 8d ea 16 STA $16ea ; (PalIndex + 0)
0925 : ad eb 16 LDA $16eb ; (PalIndex + 1)
0928 : 69 00 __ ADC #$00
092a : 8d eb 16 STA $16eb ; (PalIndex + 1)
092d : 0d ea 16 ORA $16ea ; (PalIndex + 0)
0930 : f0 10 __ BEQ $0942 ; (main.s109 + 0)
.s11:
0932 : ad eb 16 LDA $16eb ; (PalIndex + 1)
0935 : d0 03 __ BNE $093a ; (main.s53 + 0)
0937 : 4c 1e 0a JMP $0a1e ; (main.s1021 + 0)
.s53:
093a : a9 00 __ LDA #$00
093c : 8d ea 16 STA $16ea ; (PalIndex + 0)
093f : 8d eb 16 STA $16eb ; (PalIndex + 1)
.s109:
0942 : a9 2b __ LDA #$2b
0944 : a0 20 __ LDY #$20
.s107:
0946 : 84 35 __ STY P8 
0948 : 85 36 __ STA P9 
094a : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
094d : a9 00 __ LDA #$00
094f : 8d e8 16 STA $16e8 ; (PalTimer + 0)
0952 : 8d e9 16 STA $16e9 ; (PalTimer + 1)
.s82:
0955 : ad e7 16 LDA $16e7 ; (p + 1)
0958 : d0 42 __ BNE $099c ; (main.s84 + 0)
.s1007:
095a : ad e6 16 LDA $16e6 ; (p + 0)
095d : c9 03 __ CMP #$03
095f : d0 3b __ BNE $099c ; (main.s84 + 0)
.s55:
0961 : a9 20 __ LDA #$20
0963 : 85 37 __ STA P10 
0965 : a9 00 __ LDA #$00
0967 : 8d fc 9e STA $9efc ; (sstack + 0)
096a : 8d ff 9e STA $9eff ; (sstack + 3)
096d : a9 fa __ LDA #$fa
096f : 8d fd 9e STA $9efd ; (sstack + 1)
0972 : a9 01 __ LDA #$01
0974 : 8d fe 9e STA $9efe ; (sstack + 2)
0977 : a9 00 __ LDA #$00
0979 : cd ec 16 CMP $16ec ; (ShimmerState + 0)
097c : 2a __ __ ROL
097d : 8d ec 16 STA $16ec ; (ShimmerState + 0)
0980 : d0 07 __ BNE $0989 ; (main.s58 + 0)
.s59:
0982 : a9 2c __ LDA #$2c
0984 : a0 e0 __ LDY #$e0
0986 : 4c 8d 09 JMP $098d ; (main.s108 + 0)
.s58:
0989 : a9 16 __ LDA #$16
098b : a0 06 __ LDY #$06
.s108:
098d : 84 35 __ STY P8 
098f : 85 36 __ STA P9 
0991 : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
0994 : a9 00 __ LDA #$00
0996 : 8d e6 16 STA $16e6 ; (p + 0)
0999 : 8d e7 16 STA $16e7 ; (p + 1)
.s84:
099c : a9 03 __ LDA #$03
099e : 8d 2c 9f STA $9f2c 
09a1 : 20 48 13 JSR $1348 ; (zsm_check.s0 + 0)
09a4 : 09 00 __ ORA #$00
09a6 : f0 0b __ BEQ $09b3 ; (main.s63 + 0)
.s61:
09a8 : a9 b9 __ LDA #$b9
09aa : 85 30 __ STA P3 
09ac : a9 14 __ LDA #$14
09ae : 85 31 __ STA P4 
09b0 : 20 4c 13 JSR $134c ; (zsm_init.s0 + 0)
.s63:
09b3 : a5 50 __ LDA T1 + 0 
09b5 : 85 2e __ STA P1 
09b7 : 20 d7 14 JSR $14d7 ; (Control.s0 + 0)
09ba : a5 3b __ LDA ACCU + 0 
09bc : 85 50 __ STA T1 + 0 
09be : ad ef 16 LDA $16ef ; (FrameCount + 0)
09c1 : 85 47 __ STA T2 + 0 
09c3 : 85 3b __ STA ACCU + 0 
09c5 : ad f0 16 LDA $16f0 ; (FrameCount + 1)
09c8 : 85 3c __ STA ACCU + 1 
09ca : a9 04 __ LDA #$04
09cc : 85 23 __ STA WORK + 0 
09ce : a9 00 __ LDA #$00
09d0 : 85 24 __ STA WORK + 1 
09d2 : 20 d8 15 JSR $15d8 ; (mods16 + 0)
09d5 : a5 26 __ LDA WORK + 3 
09d7 : d0 16 __ BNE $09ef ; (main.s66 + 0)
.s1003:
09d9 : a5 25 __ LDA WORK + 2 
09db : c9 01 __ CMP #$01
09dd : d0 10 __ BNE $09ef ; (main.s66 + 0)
.s64:
09df : ac f8 16 LDY $16f8 ; (off1 + 0)
09e2 : c0 2b __ CPY #$2b
09e4 : b0 06 __ BCS $09ec ; (main.s106 + 0)
.s67:
09e6 : b9 00 2d LDA $2d00,y ; (TestText2 + 0)
09e9 : 8d 23 9f STA $9f23 
.s106:
09ec : ee f8 16 INC $16f8 ; (off1 + 0)
.s66:
09ef : 06 47 __ ASL T2 + 0 
09f1 : ad f0 16 LDA $16f0 ; (FrameCount + 1)
09f4 : 2a __ __ ROL
09f5 : 18 __ __ CLC
09f6 : 69 ff __ ADC #$ff
09f8 : 8d 38 9f STA $9f38 
09fb : a5 47 __ LDA T2 + 0 
09fd : 8d 37 9f STA $9f37 
0a00 : a9 01 __ LDA #$01
0a02 : 8d 2c 9f STA $9f2c 
0a05 : 20 eb 13 JSR $13eb ; (zsm_fill.s0 + 0)
0a08 : a9 00 __ LDA #$00
0a0a : 8d 2c 9f STA $9f2c 
0a0d : 20 28 15 JSR $1528 ; (frame_wait.l1 + 0)
0a10 : ee ef 16 INC $16ef ; (FrameCount + 0)
0a13 : f0 03 __ BEQ $0a18 ; (main.s1028 + 0)
0a15 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
.s1028:
0a18 : ee f0 16 INC $16f0 ; (FrameCount + 1)
0a1b : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
.s1021:
0a1e : ad ea 16 LDA $16ea ; (PalIndex + 0)
0a21 : c9 01 __ CMP #$01
0a23 : d0 07 __ BNE $0a2c ; (main.s1020 + 0)
.s13:
0a25 : a9 2b __ LDA #$2b
0a27 : a0 40 __ LDY #$40
0a29 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1020:
0a2c : c9 02 __ CMP #$02
0a2e : d0 07 __ BNE $0a37 ; (main.s1019 + 0)
.s16:
0a30 : a9 2b __ LDA #$2b
0a32 : a0 60 __ LDY #$60
0a34 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1019:
0a37 : c9 03 __ CMP #$03
0a39 : d0 07 __ BNE $0a42 ; (main.s1018 + 0)
.s19:
0a3b : a9 2b __ LDA #$2b
0a3d : a0 80 __ LDY #$80
0a3f : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1018:
0a42 : c9 04 __ CMP #$04
0a44 : d0 07 __ BNE $0a4d ; (main.s1017 + 0)
.s22:
0a46 : a9 2b __ LDA #$2b
0a48 : a0 a0 __ LDY #$a0
0a4a : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1017:
0a4d : c9 05 __ CMP #$05
0a4f : d0 07 __ BNE $0a58 ; (main.s1016 + 0)
.s25:
0a51 : a9 2b __ LDA #$2b
0a53 : a0 c0 __ LDY #$c0
0a55 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1016:
0a58 : c9 06 __ CMP #$06
0a5a : d0 07 __ BNE $0a63 ; (main.s1015 + 0)
.s28:
0a5c : a9 2b __ LDA #$2b
0a5e : a0 e0 __ LDY #$e0
0a60 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1015:
0a63 : c9 07 __ CMP #$07
0a65 : d0 07 __ BNE $0a6e ; (main.s1014 + 0)
.s31:
0a67 : a9 2c __ LDA #$2c
0a69 : a0 00 __ LDY #$00
0a6b : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1014:
0a6e : c9 08 __ CMP #$08
0a70 : d0 07 __ BNE $0a79 ; (main.s1013 + 0)
.s34:
0a72 : a9 2c __ LDA #$2c
0a74 : a0 20 __ LDY #$20
0a76 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1013:
0a79 : c9 09 __ CMP #$09
0a7b : d0 07 __ BNE $0a84 ; (main.s1012 + 0)
.s37:
0a7d : a9 2c __ LDA #$2c
0a7f : a0 40 __ LDY #$40
0a81 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1012:
0a84 : c9 0a __ CMP #$0a
0a86 : d0 07 __ BNE $0a8f ; (main.s1011 + 0)
.s40:
0a88 : a9 2c __ LDA #$2c
0a8a : a0 60 __ LDY #$60
0a8c : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1011:
0a8f : c9 0b __ CMP #$0b
0a91 : d0 07 __ BNE $0a9a ; (main.s1010 + 0)
.s43:
0a93 : a9 2c __ LDA #$2c
0a95 : a0 80 __ LDY #$80
0a97 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1010:
0a9a : c9 0c __ CMP #$0c
0a9c : d0 07 __ BNE $0aa5 ; (main.s1009 + 0)
.s46:
0a9e : a9 2c __ LDA #$2c
0aa0 : a0 a0 __ LDY #$a0
0aa2 : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1009:
0aa5 : c9 0d __ CMP #$0d
0aa7 : d0 07 __ BNE $0ab0 ; (main.s1008 + 0)
.s49:
0aa9 : a9 2c __ LDA #$2c
0aab : a0 c0 __ LDY #$c0
0aad : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s1008:
0ab0 : c9 0e __ CMP #$0e
0ab2 : f0 03 __ BEQ $0ab7 ; (main.s52 + 0)
0ab4 : 4c 3a 09 JMP $093a ; (main.s53 + 0)
.s52:
0ab7 : a9 16 __ LDA #$16
0ab9 : a0 c6 __ LDY #$c6
0abb : 4c 46 09 JMP $0946 ; (main.s107 + 0)
.s4:
0abe : ee e8 16 INC $16e8 ; (PalTimer + 0)
0ac1 : f0 03 __ BEQ $0ac6 ; (main.s1026 + 0)
0ac3 : 4c f1 08 JMP $08f1 ; (main.s6 + 0)
.s1026:
0ac6 : ee e9 16 INC $16e9 ; (PalTimer + 1)
0ac9 : 4c f1 08 JMP $08f1 ; (main.s6 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0acc : 78 __ __ SEI
0acd : ad 14 03 LDA $0314 
0ad0 : 8d f1 16 STA $16f1 ; (oirq + 0)
0ad3 : ad 15 03 LDA $0315 
0ad6 : 8d f2 16 STA $16f2 ; (oirq + 1)
0ad9 : a9 e5 __ LDA #$e5
0adb : 8d 14 03 STA $0314 
0ade : a9 0a __ LDA #$0a
0ae0 : 8d 15 03 STA $0315 
0ae3 : 58 __ __ CLI
.s1001:
0ae4 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
16f1 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0ae5 : 20 eb 0a JSR $0aeb ; (irq.s1000 + 0)
0ae8 : 6c f1 16 JMP ($16f1)
--------------------------------------------------------------------
irq:
.s1000:
0aeb : a5 2d __ LDA P0 
0aed : 48 __ __ PHA
0aee : a5 2e __ LDA P1 
0af0 : 48 __ __ PHA
0af1 : a5 3b __ LDA ACCU + 0 
0af3 : 48 __ __ PHA
0af4 : a5 3c __ LDA ACCU + 1 
0af6 : 48 __ __ PHA
0af7 : a5 47 __ LDA T0 + 0 
0af9 : 48 __ __ PHA
0afa : a5 48 __ LDA $48 
0afc : 48 __ __ PHA
0afd : a5 49 __ LDA $49 
0aff : 48 __ __ PHA
0b00 : a5 4a __ LDA $4a 
0b02 : 48 __ __ PHA
0b03 : a5 4b __ LDA $4b 
0b05 : 48 __ __ PHA
0b06 : a5 4c __ LDA $4c 
0b08 : 48 __ __ PHA
0b09 : a5 4d __ LDA $4d 
0b0b : 48 __ __ PHA
0b0c : a5 4e __ LDA $4e 
0b0e : 48 __ __ PHA
0b0f : a5 4f __ LDA $4f 
0b11 : 48 __ __ PHA
0b12 : a5 50 __ LDA $50 
0b14 : 48 __ __ PHA
.s0:
0b15 : ad 02 16 LDA $1602 ; (zsm_playing + 0)
0b18 : f0 08 __ BEQ $0b22 ; (irq.s1001 + 0)
.s4:
0b1a : ad 03 16 LDA $1603 ; (zsm_finished + 0)
0b1d : d0 03 __ BNE $0b22 ; (irq.s1001 + 0)
.s1:
0b1f : 20 4d 0b JSR $0b4d ; (zsm_play.s0 + 0)
.s1001:
0b22 : 68 __ __ PLA
0b23 : 85 50 __ STA $50 
0b25 : 68 __ __ PLA
0b26 : 85 4f __ STA $4f 
0b28 : 68 __ __ PLA
0b29 : 85 4e __ STA $4e 
0b2b : 68 __ __ PLA
0b2c : 85 4d __ STA $4d 
0b2e : 68 __ __ PLA
0b2f : 85 4c __ STA $4c 
0b31 : 68 __ __ PLA
0b32 : 85 4b __ STA $4b 
0b34 : 68 __ __ PLA
0b35 : 85 4a __ STA $4a 
0b37 : 68 __ __ PLA
0b38 : 85 49 __ STA $49 
0b3a : 68 __ __ PLA
0b3b : 85 48 __ STA $48 
0b3d : 68 __ __ PLA
0b3e : 85 47 __ STA T0 + 0 
0b40 : 68 __ __ PLA
0b41 : 85 3c __ STA ACCU + 1 
0b43 : 68 __ __ PLA
0b44 : 85 3b __ STA ACCU + 0 
0b46 : 68 __ __ PLA
0b47 : 85 2e __ STA P1 
0b49 : 68 __ __ PLA
0b4a : 85 2d __ STA P0 
0b4c : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1602 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1603 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0b4d : ad f3 16 LDA $16f3 ; (zsm_delay + 0)
0b50 : f0 03 __ BEQ $0b55 ; (zsm_play.s2 + 0)
0b52 : 4c 82 0c JMP $0c82 ; (zsm_play.s1 + 0)
.s2:
0b55 : ad 25 9f LDA $9f25 
0b58 : 85 47 __ STA T0 + 0 
0b5a : ad 25 9f LDA $9f25 
0b5d : 29 fe __ AND #$fe
0b5f : 8d 25 9f STA $9f25 
0b62 : ad 20 9f LDA $9f20 
0b65 : 85 49 __ STA T2 + 0 
0b67 : ad 21 9f LDA $9f21 
0b6a : 85 4a __ STA T2 + 1 
0b6c : ad 22 9f LDA $9f22 
0b6f : 85 48 __ STA T1 + 0 
.l5:
0b71 : ad f4 16 LDA $16f4 ; (zsm_pos + 0)
0b74 : 85 4b __ STA T3 + 0 
0b76 : 18 __ __ CLC
0b77 : 69 01 __ ADC #$01
0b79 : 85 4d __ STA T4 + 0 
0b7b : 8d f4 16 STA $16f4 ; (zsm_pos + 0)
0b7e : ad f5 16 LDA $16f5 ; (zsm_pos + 1)
0b81 : aa __ __ TAX
0b82 : 69 00 __ ADC #$00
0b84 : 85 4e __ STA T4 + 1 
0b86 : 8d f5 16 STA $16f5 ; (zsm_pos + 1)
0b89 : 18 __ __ CLC
0b8a : a9 3b __ LDA #$3b
0b8c : 65 4b __ ADC T3 + 0 
0b8e : 85 3b __ STA ACCU + 0 
0b90 : 8a __ __ TXA
0b91 : 29 03 __ AND #$03
0b93 : 69 2d __ ADC #$2d
0b95 : 85 3c __ STA ACCU + 1 
0b97 : a0 00 __ LDY #$00
0b99 : b1 3b __ LDA (ACCU + 0),y 
0b9b : c9 40 __ CMP #$40
0b9d : b0 03 __ BCS $0ba2 ; (zsm_play.s9 + 0)
0b9f : 4c 4d 0c JMP $0c4d ; (zsm_play.s8 + 0)
.s9:
0ba2 : d0 22 __ BNE $0bc6 ; (zsm_play.s12 + 0)
.s11:
0ba4 : 18 __ __ CLC
0ba5 : a9 3b __ LDA #$3b
0ba7 : 65 4d __ ADC T4 + 0 
0ba9 : 85 4b __ STA T3 + 0 
0bab : a5 4e __ LDA T4 + 1 
0bad : 29 03 __ AND #$03
0baf : 69 2d __ ADC #$2d
0bb1 : 85 4c __ STA T3 + 1 
0bb3 : b1 4b __ LDA (T3 + 0),y 
0bb5 : 29 3f __ AND #$3f
0bb7 : 18 __ __ CLC
0bb8 : 65 4d __ ADC T4 + 0 
0bba : 8d f4 16 STA $16f4 ; (zsm_pos + 0)
0bbd : 98 __ __ TYA
0bbe : 65 4e __ ADC T4 + 1 
0bc0 : 8d f5 16 STA $16f5 ; (zsm_pos + 1)
0bc3 : 4c 71 0b JMP $0b71 ; (zsm_play.l5 + 0)
.s12:
0bc6 : 09 00 __ ORA #$00
0bc8 : 30 5b __ BMI $0c25 ; (zsm_play.s15 + 0)
.s14:
0bca : 29 3f __ AND #$3f
0bcc : f0 a3 __ BEQ $0b71 ; (zsm_play.l5 + 0)
.s26:
0bce : 84 50 __ STY T7 + 0 
0bd0 : 85 4f __ STA T6 + 0 
0bd2 : 18 __ __ CLC
.l1012:
0bd3 : a9 3b __ LDA #$3b
0bd5 : 6d f4 16 ADC $16f4 ; (zsm_pos + 0)
0bd8 : 85 4d __ STA T4 + 0 
0bda : ad f5 16 LDA $16f5 ; (zsm_pos + 1)
0bdd : 29 03 __ AND #$03
0bdf : 69 2d __ ADC #$2d
0be1 : 85 4e __ STA T4 + 1 
0be3 : a0 00 __ LDY #$00
0be5 : b1 4d __ LDA (T4 + 0),y 
0be7 : 85 2d __ STA P0 
0be9 : ad f4 16 LDA $16f4 ; (zsm_pos + 0)
0bec : 18 __ __ CLC
0bed : 69 01 __ ADC #$01
0bef : aa __ __ TAX
0bf0 : ad f5 16 LDA $16f5 ; (zsm_pos + 1)
0bf3 : 69 00 __ ADC #$00
0bf5 : 29 03 __ AND #$03
0bf7 : 85 4c __ STA T3 + 1 
0bf9 : 8a __ __ TXA
0bfa : 18 __ __ CLC
0bfb : 69 3b __ ADC #$3b
0bfd : 85 4b __ STA T3 + 0 
0bff : a9 2d __ LDA #$2d
0c01 : 65 4c __ ADC T3 + 1 
0c03 : 85 4c __ STA T3 + 1 
0c05 : b1 4b __ LDA (T3 + 0),y 
0c07 : 85 2e __ STA P1 
0c09 : 20 86 0c JSR $0c86 ; (sfx_put.l1 + 0)
0c0c : ad f4 16 LDA $16f4 ; (zsm_pos + 0)
0c0f : 18 __ __ CLC
0c10 : 69 02 __ ADC #$02
0c12 : 8d f4 16 STA $16f4 ; (zsm_pos + 0)
0c15 : 90 03 __ BCC $0c1a ; (zsm_play.s1015 + 0)
.s1014:
0c17 : ee f5 16 INC $16f5 ; (zsm_pos + 1)
.s1015:
0c1a : e6 50 __ INC T7 + 0 
0c1c : a5 50 __ LDA T7 + 0 
0c1e : c5 4f __ CMP T6 + 0 
0c20 : 90 b1 __ BCC $0bd3 ; (zsm_play.l1012 + 0)
0c22 : 4c 71 0b JMP $0b71 ; (zsm_play.l5 + 0)
.s15:
0c25 : c9 80 __ CMP #$80
0c27 : d0 07 __ BNE $0c30 ; (zsm_play.s22 + 0)
.s21:
0c29 : a9 01 __ LDA #$01
0c2b : 8d 03 16 STA $1603 ; (zsm_finished + 0)
0c2e : d0 08 __ BNE $0c38 ; (zsm_play.s7 + 0)
.s22:
0c30 : 29 7f __ AND #$7f
0c32 : 38 __ __ SEC
0c33 : e9 01 __ SBC #$01
0c35 : 8d f3 16 STA $16f3 ; (zsm_delay + 0)
.s7:
0c38 : a5 49 __ LDA T2 + 0 
0c3a : 8d 20 9f STA $9f20 
0c3d : a5 4a __ LDA T2 + 1 
0c3f : 8d 21 9f STA $9f21 
0c42 : a5 48 __ LDA T1 + 0 
0c44 : 8d 22 9f STA $9f22 
0c47 : a5 47 __ LDA T0 + 0 
0c49 : 8d 25 9f STA $9f25 
.s1001:
0c4c : 60 __ __ RTS
.s8:
0c4d : 29 3f __ AND #$3f
0c4f : 09 c0 __ ORA #$c0
0c51 : 8d 20 9f STA $9f20 
0c54 : a9 f9 __ LDA #$f9
0c56 : 8d 21 9f STA $9f21 
0c59 : a9 01 __ LDA #$01
0c5b : 8d 22 9f STA $9f22 
0c5e : a5 4b __ LDA T3 + 0 
0c60 : 69 02 __ ADC #$02
0c62 : 8d f4 16 STA $16f4 ; (zsm_pos + 0)
0c65 : 90 01 __ BCC $0c68 ; (zsm_play.s1017 + 0)
.s1016:
0c67 : e8 __ __ INX
.s1017:
0c68 : 8e f5 16 STX $16f5 ; (zsm_pos + 1)
0c6b : 18 __ __ CLC
0c6c : a9 3b __ LDA #$3b
0c6e : 65 4d __ ADC T4 + 0 
0c70 : 85 4b __ STA T3 + 0 
0c72 : a5 4e __ LDA T4 + 1 
0c74 : 29 03 __ AND #$03
0c76 : 69 2d __ ADC #$2d
0c78 : 85 4c __ STA T3 + 1 
0c7a : b1 4b __ LDA (T3 + 0),y 
0c7c : 8d 23 9f STA $9f23 
0c7f : 4c 71 0b JMP $0b71 ; (zsm_play.l5 + 0)
.s1:
0c82 : ce f3 16 DEC $16f3 ; (zsm_delay + 0)
0c85 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
16f3 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
2d3b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
16f4 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0c86 : ad 41 9f LDA $9f41 
0c89 : 30 fb __ BMI $0c86 ; (sfx_put.l1 + 0)
.s3:
0c8b : a5 2d __ LDA P0 ; (index + 0)
0c8d : 8d 40 9f STA $9f40 
0c90 : ea __ __ NOP
0c91 : ea __ __ NOP
0c92 : ea __ __ NOP
0c93 : ea __ __ NOP
0c94 : a5 2e __ LDA P1 ; (data + 0)
0c96 : 8d 41 9f STA $9f41 
.s1001:
0c99 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0c9a : a9 93 __ LDA #$93
0c9c : 85 2d __ STA P0 
0c9e : a9 00 __ LDA #$00
0ca0 : 85 2e __ STA P1 
0ca2 : 20 d7 0c JSR $0cd7 ; (putch.s0 + 0)
0ca5 : a9 11 __ LDA #$11
0ca7 : 8d 22 9f STA $9f22 
0caa : a2 00 __ LDX #$00
.l2:
0cac : 8a __ __ TXA
0cad : 18 __ __ CLC
0cae : 69 b0 __ ADC #$b0
0cb0 : 8d 21 9f STA $9f21 
0cb3 : a9 00 __ LDA #$00
0cb5 : 8d 20 9f STA $9f20 
0cb8 : a0 80 __ LDY #$80
.l1003:
0cba : a9 20 __ LDA #$20
0cbc : 8d 23 9f STA $9f23 
0cbf : a9 01 __ LDA #$01
0cc1 : 8d 23 9f STA $9f23 
0cc4 : a9 20 __ LDA #$20
0cc6 : 8d 24 9f STA $9f24 
0cc9 : a9 01 __ LDA #$01
0ccb : 8d 24 9f STA $9f24 
0cce : 88 __ __ DEY
0ccf : d0 e9 __ BNE $0cba ; (ClearVERAScreen.l1003 + 0)
.s1004:
0cd1 : e8 __ __ INX
0cd2 : e0 40 __ CPX #$40
0cd4 : 90 d6 __ BCC $0cac ; (ClearVERAScreen.l2 + 0)
.s1001:
0cd6 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0cd7 : a5 2d __ LDA P0 
0cd9 : 20 d2 ff JSR $ffd2 
.s1001:
0cdc : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0cdd : a9 00 __ LDA #$00
0cdf : 85 2d __ STA P0 
0ce1 : 85 2e __ STA P1 
0ce3 : 85 2f __ STA P2 
0ce5 : 85 30 __ STA P3 
0ce7 : 85 31 __ STA P4 
0ce9 : 8d 25 9f STA $9f25 
0cec : ad 29 9f LDA $9f29 
0cef : 09 70 __ ORA #$70
0cf1 : 8d 29 9f STA $9f29 
0cf4 : a9 80 __ LDA #$80
0cf6 : 8d 2b 9f STA $9f2b 
0cf9 : 8d 2a 9f STA $9f2a 
0cfc : a9 62 __ LDA #$62
0cfe : 8d 2d 9f STA $9f2d 
0d01 : a9 68 __ LDA #$68
0d03 : 8d 34 9f STA $9f34 
0d06 : 20 02 12 JSR $1202 ; (tileBaseConfig.s0 + 0)
0d09 : 8d 2f 9f STA $9f2f 
0d0c : a9 20 __ LDA #$20
0d0e : 85 2f __ STA P2 
0d10 : 20 1b 12 JSR $121b ; (memoryToMapMemoryAddress.s0 + 0)
0d13 : 8d 2e 9f STA $9f2e 
0d16 : a9 21 __ LDA #$21
0d18 : 8d 22 9f STA $9f22 
0d1b : a2 80 __ LDX #$80
.l6:
0d1d : a0 50 __ LDY #$50
.l1024:
0d1f : a9 00 __ LDA #$00
0d21 : 8d 24 9f STA $9f24 
0d24 : a9 08 __ LDA #$08
0d26 : 8d 24 9f STA $9f24 
0d29 : 88 __ __ DEY
0d2a : d0 f3 __ BNE $0d1f ; (SetUpSprites.l1024 + 0)
.s1025:
0d2c : ca __ __ DEX
0d2d : d0 ee __ BNE $0d1d ; (SetUpSprites.l6 + 0)
.s4:
0d2f : a9 00 __ LDA #$00
0d31 : 85 2d __ STA P0 
0d33 : 85 2e __ STA P1 
0d35 : 85 2f __ STA P2 
0d37 : 85 30 __ STA P3 
0d39 : 85 33 __ STA P6 
0d3b : a9 01 __ LDA #$01
0d3d : 85 34 __ STA P7 
0d3f : a9 00 __ LDA #$00
0d41 : 85 31 __ STA P4 
0d43 : a9 17 __ LDA #$17
0d45 : 85 32 __ STA P5 
0d47 : 20 29 12 JSR $1229 ; (vram_putn.s0 + 0)
0d4a : a9 10 __ LDA #$10
0d4c : 8d 22 9f STA $9f22 
0d4f : a9 00 __ LDA #$00
0d51 : 8d 20 9f STA $9f20 
0d54 : a9 20 __ LDA #$20
0d56 : 8d 21 9f STA $9f21 
0d59 : a9 3c __ LDA #$3c
0d5b : 85 47 __ STA T1 + 0 
.l10:
0d5d : a9 00 __ LDA #$00
0d5f : 85 48 __ STA T2 + 0 
.l14:
0d61 : 20 64 12 JSR $1264 ; (rand.s0 + 0)
0d64 : a5 3b __ LDA ACCU + 0 
0d66 : 29 1f __ AND #$1f
0d68 : c9 1f __ CMP #$1f
0d6a : a5 48 __ LDA T2 + 0 
0d6c : 90 03 __ BCC $0d71 ; (SetUpSprites.s1022 + 0)
0d6e : 4c cc 11 JMP $11cc ; (SetUpSprites.s1016 + 0)
.s1022:
0d71 : c9 09 __ CMP #$09
0d73 : 90 06 __ BCC $0d7b ; (SetUpSprites.s20 + 0)
.s1021:
0d75 : a9 45 __ LDA #$45
0d77 : c5 48 __ CMP T2 + 0 
0d79 : b0 04 __ BCS $0d7f ; (SetUpSprites.s1020 + 0)
.s20:
0d7b : a9 00 __ LDA #$00
0d7d : f0 2f __ BEQ $0dae ; (SetUpSprites.s148 + 0)
.s1020:
0d7f : a5 48 __ LDA T2 + 0 
0d81 : c9 13 __ CMP #$13
0d83 : 90 06 __ BCC $0d8b ; (SetUpSprites.s24 + 0)
.s1019:
0d85 : a9 3b __ LDA #$3b
0d87 : c5 48 __ CMP T2 + 0 
0d89 : b0 04 __ BCS $0d8f ; (SetUpSprites.s1018 + 0)
.s24:
0d8b : a9 01 __ LDA #$01
0d8d : d0 12 __ BNE $0da1 ; (SetUpSprites.s156 + 0)
.s1018:
0d8f : a5 48 __ LDA T2 + 0 
0d91 : c9 1d __ CMP #$1d
0d93 : 90 06 __ BCC $0d9b ; (SetUpSprites.s28 + 0)
.s1017:
0d95 : a9 31 __ LDA #$31
0d97 : c5 48 __ CMP T2 + 0 
0d99 : b0 04 __ BCS $0d9f ; (SetUpSprites.s29 + 0)
.s28:
0d9b : a9 02 __ LDA #$02
0d9d : d0 02 __ BNE $0da1 ; (SetUpSprites.s156 + 0)
.s29:
0d9f : a9 03 __ LDA #$03
.s156:
0da1 : 8d 23 9f STA $9f23 
0da4 : a9 00 __ LDA #$00
0da6 : 8d 23 9f STA $9f23 
0da9 : e6 48 __ INC T2 + 0 
0dab : 4c 61 0d JMP $0d61 ; (SetUpSprites.l14 + 0)
.s148:
0dae : 8d 23 9f STA $9f23 
0db1 : a9 00 __ LDA #$00
0db3 : 8d 23 9f STA $9f23 
0db6 : e6 48 __ INC T2 + 0 
0db8 : 10 a7 __ BPL $0d61 ; (SetUpSprites.l14 + 0)
.s11:
0dba : c6 47 __ DEC T1 + 0 
0dbc : d0 9f __ BNE $0d5d ; (SetUpSprites.l10 + 0)
.s12:
0dbe : a9 20 __ LDA #$20
0dc0 : 85 37 __ STA P10 
0dc2 : a9 00 __ LDA #$00
0dc4 : 8d fc 9e STA $9efc ; (sstack + 0)
0dc7 : 8d ff 9e STA $9eff ; (sstack + 3)
0dca : a9 fa __ LDA #$fa
0dcc : 8d fd 9e STA $9efd ; (sstack + 1)
0dcf : a9 01 __ LDA #$01
0dd1 : 8d fe 9e STA $9efe ; (sstack + 2)
0dd4 : a9 06 __ LDA #$06
0dd6 : 85 35 __ STA P8 
0dd8 : a9 16 __ LDA #$16
0dda : 85 36 __ STA P9 
0ddc : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
0ddf : a9 00 __ LDA #$00
0de1 : 85 2d __ STA P0 
0de3 : 85 30 __ STA P3 
0de5 : 85 33 __ STA P6 
0de7 : a9 31 __ LDA #$31
0de9 : 85 2e __ STA P1 
0deb : a9 01 __ LDA #$01
0ded : 85 2f __ STA P2 
0def : a9 04 __ LDA #$04
0df1 : 85 34 __ STA P7 
0df3 : a9 00 __ LDA #$00
0df5 : 85 31 __ STA P4 
0df7 : a9 18 __ LDA #$18
0df9 : 85 32 __ STA P5 
0dfb : 20 29 12 JSR $1229 ; (vram_putn.s0 + 0)
0dfe : a9 30 __ LDA #$30
0e00 : 85 2e __ STA P1 
0e02 : a9 01 __ LDA #$01
0e04 : 85 34 __ STA P7 
0e06 : a9 00 __ LDA #$00
0e08 : 85 31 __ STA P4 
0e0a : a9 1c __ LDA #$1c
0e0c : 85 32 __ STA P5 
0e0e : 20 29 12 JSR $1229 ; (vram_putn.s0 + 0)
0e11 : a9 16 __ LDA #$16
0e13 : 85 2d __ STA P0 
0e15 : a9 80 __ LDA #$80
0e17 : 85 2e __ STA P1 
0e19 : a9 09 __ LDA #$09
0e1b : 85 2f __ STA P2 
0e1d : a9 01 __ LDA #$01
0e1f : 85 31 __ STA P4 
0e21 : 85 34 __ STA P7 
0e23 : a9 02 __ LDA #$02
0e25 : 85 32 __ STA P5 
0e27 : a9 03 __ LDA #$03
0e29 : 85 33 __ STA P6 
0e2b : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
0e2e : a9 30 __ LDA #$30
0e30 : 85 2e __ STA P1 
0e32 : a9 01 __ LDA #$01
0e34 : 85 2f __ STA P2 
0e36 : a9 b8 __ LDA #$b8
0e38 : 85 30 __ STA P3 
0e3a : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
0e3d : a9 00 __ LDA #$00
0e3f : 85 4e __ STA T5 + 0 
0e41 : 85 4f __ STA T5 + 1 
.l45:
0e43 : 85 2d __ STA P0 
0e45 : 18 __ __ CLC
0e46 : 69 02 __ ADC #$02
0e48 : 85 4c __ STA T4 + 0 
0e4a : a9 00 __ LDA #$00
0e4c : 2a __ __ ROL
0e4d : 85 4d __ STA T4 + 1 
0e4f : a9 88 __ LDA #$88
0e51 : 85 2e __ STA P1 
0e53 : a9 09 __ LDA #$09
0e55 : 85 2f __ STA P2 
0e57 : a9 00 __ LDA #$00
0e59 : 85 30 __ STA P3 
0e5b : a9 03 __ LDA #$03
0e5d : 85 31 __ STA P4 
0e5f : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
0e62 : a5 4e __ LDA T5 + 0 
0e64 : 85 2e __ STA P1 
0e66 : a5 4f __ LDA T5 + 1 
0e68 : 85 2f __ STA P2 
0e6a : a9 a0 __ LDA #$a0
0e6c : 85 30 __ STA P3 
0e6e : a9 01 __ LDA #$01
0e70 : 85 31 __ STA P4 
0e72 : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
0e75 : a9 88 __ LDA #$88
0e77 : 85 2e __ STA P1 
0e79 : a9 09 __ LDA #$09
0e7b : 85 2f __ STA P2 
0e7d : a9 00 __ LDA #$00
0e7f : 85 30 __ STA P3 
0e81 : a9 03 __ LDA #$03
0e83 : 85 31 __ STA P4 
0e85 : e6 2d __ INC P0 
0e87 : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
0e8a : a5 4e __ LDA T5 + 0 
0e8c : 85 2e __ STA P1 
0e8e : a5 4f __ LDA T5 + 1 
0e90 : 85 2f __ STA P2 
0e92 : a9 70 __ LDA #$70
0e94 : 85 30 __ STA P3 
0e96 : a9 01 __ LDA #$01
0e98 : 85 31 __ STA P4 
0e9a : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
0e9d : a5 4d __ LDA T4 + 1 
0e9f : d0 13 __ BNE $0eb4 ; (SetUpSprites.s47 + 0)
.s1012:
0ea1 : 18 __ __ CLC
0ea2 : a5 2e __ LDA P1 
0ea4 : 69 40 __ ADC #$40
0ea6 : 85 4e __ STA T5 + 0 
0ea8 : a5 2f __ LDA P2 
0eaa : 69 00 __ ADC #$00
0eac : 85 4f __ STA T5 + 1 
0eae : a5 4c __ LDA T4 + 0 
0eb0 : c9 16 __ CMP #$16
0eb2 : 90 8f __ BCC $0e43 ; (SetUpSprites.l45 + 0)
.s47:
0eb4 : a9 20 __ LDA #$20
0eb6 : 85 2d __ STA P0 
0eb8 : a9 35 __ LDA #$35
0eba : 85 2e __ STA P1 
0ebc : a9 01 __ LDA #$01
0ebe : 85 2f __ STA P2 
0ec0 : a9 00 __ LDA #$00
0ec2 : 85 30 __ STA P3 
0ec4 : 85 33 __ STA P6 
0ec6 : a9 02 __ LDA #$02
0ec8 : 85 34 __ STA P7 
0eca : a9 00 __ LDA #$00
0ecc : 85 31 __ STA P4 
0ece : a9 1d __ LDA #$1d
0ed0 : 85 32 __ STA P5 
0ed2 : 20 29 12 JSR $1229 ; (vram_putn.s0 + 0)
0ed5 : a9 17 __ LDA #$17
0ed7 : 85 2d __ STA P0 
0ed9 : a9 a9 __ LDA #$a9
0edb : 85 2e __ STA P1 
0edd : a9 09 __ LDA #$09
0edf : 85 2f __ STA P2 
0ee1 : a9 02 __ LDA #$02
0ee3 : 85 31 __ STA P4 
0ee5 : 85 32 __ STA P5 
0ee7 : a9 03 __ LDA #$03
0ee9 : 85 33 __ STA P6 
0eeb : a9 01 __ LDA #$01
0eed : 85 34 __ STA P7 
0eef : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
0ef2 : a9 fc __ LDA #$fc
0ef4 : 85 2e __ STA P1 
0ef6 : a9 00 __ LDA #$00
0ef8 : 85 2f __ STA P2 
0efa : a9 b8 __ LDA #$b8
0efc : 85 30 __ STA P3 
0efe : a9 01 __ LDA #$01
0f00 : 85 31 __ STA P4 
0f02 : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
0f05 : a9 18 __ LDA #$18
0f07 : 85 2d __ STA P0 
0f09 : a9 a9 __ LDA #$a9
0f0b : 85 2e __ STA P1 
0f0d : a9 09 __ LDA #$09
0f0f : 85 2f __ STA P2 
0f11 : a9 00 __ LDA #$00
0f13 : 85 30 __ STA P3 
0f15 : a9 02 __ LDA #$02
0f17 : 85 31 __ STA P4 
0f19 : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
0f1c : a9 4c __ LDA #$4c
0f1e : 85 2e __ STA P1 
0f20 : a9 01 __ LDA #$01
0f22 : 85 2f __ STA P2 
0f24 : 85 31 __ STA P4 
0f26 : a9 b8 __ LDA #$b8
0f28 : 85 30 __ STA P3 
0f2a : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
0f2d : a9 20 __ LDA #$20
0f2f : 85 37 __ STA P10 
0f31 : 8d fc 9e STA $9efc ; (sstack + 0)
0f34 : a9 fa __ LDA #$fa
0f36 : 8d fd 9e STA $9efd ; (sstack + 1)
0f39 : a9 01 __ LDA #$01
0f3b : 8d fe 9e STA $9efe ; (sstack + 2)
0f3e : a9 00 __ LDA #$00
0f40 : 8d ff 9e STA $9eff ; (sstack + 3)
0f43 : a9 26 __ LDA #$26
0f45 : 85 35 __ STA P8 
0f47 : a9 16 __ LDA #$16
0f49 : 85 36 __ STA P9 
0f4b : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
0f4e : a9 00 __ LDA #$00
0f50 : 85 2d __ STA P0 
0f52 : 85 30 __ STA P3 
0f54 : 85 34 __ STA P7 
0f56 : a9 35 __ LDA #$35
0f58 : 85 2e __ STA P1 
0f5a : a9 01 __ LDA #$01
0f5c : 85 2f __ STA P2 
0f5e : a9 20 __ LDA #$20
0f60 : 85 33 __ STA P6 
0f62 : a9 46 __ LDA #$46
0f64 : 85 31 __ STA P4 
0f66 : a9 16 __ LDA #$16
0f68 : 85 32 __ STA P5 
0f6a : 20 29 12 JSR $1229 ; (vram_putn.s0 + 0)
0f6d : a9 00 __ LDA #$00
0f6f : 85 47 __ STA T1 + 0 
0f71 : 85 49 __ STA T2 + 1 
0f73 : a9 04 __ LDA #$04
0f75 : 85 48 __ STA T2 + 0 
0f77 : a9 03 __ LDA #$03
0f79 : 85 33 __ STA P6 
0f7b : a9 02 __ LDA #$02
0f7d : 85 34 __ STA P7 
0f7f : 18 __ __ CLC
.l1036:
0f80 : a9 a8 __ LDA #$a8
0f82 : 85 2e __ STA P1 
0f84 : a9 09 __ LDA #$09
0f86 : 85 2f __ STA P2 
0f88 : a9 00 __ LDA #$00
0f8a : 85 30 __ STA P3 
0f8c : 85 31 __ STA P4 
0f8e : 85 32 __ STA P5 
0f90 : a5 47 __ LDA T1 + 0 
0f92 : 69 19 __ ADC #$19
0f94 : 85 2d __ STA P0 
0f96 : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
0f99 : a5 48 __ LDA T2 + 0 
0f9b : 85 2e __ STA P1 
0f9d : a5 49 __ LDA T2 + 1 
0f9f : 85 2f __ STA P2 
0fa1 : a9 b8 __ LDA #$b8
0fa3 : 85 30 __ STA P3 
0fa5 : a9 01 __ LDA #$01
0fa7 : 85 31 __ STA P4 
0fa9 : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
0fac : 18 __ __ CLC
0fad : a5 2e __ LDA P1 
0faf : 69 0c __ ADC #$0c
0fb1 : 85 48 __ STA T2 + 0 
0fb3 : a5 2f __ LDA P2 
0fb5 : 69 00 __ ADC #$00
0fb7 : 85 49 __ STA T2 + 1 
0fb9 : e6 47 __ INC T1 + 0 
0fbb : a5 47 __ LDA T1 + 0 
0fbd : c9 08 __ CMP #$08
0fbf : 90 bf __ BCC $0f80 ; (SetUpSprites.l1036 + 0)
.s51:
0fc1 : a9 00 __ LDA #$00
0fc3 : 85 47 __ STA T1 + 0 
0fc5 : 85 49 __ STA T2 + 1 
0fc7 : a9 04 __ LDA #$04
0fc9 : 85 48 __ STA T2 + 0 
0fcb : a9 03 __ LDA #$03
0fcd : 85 33 __ STA P6 
0fcf : 85 34 __ STA P7 
0fd1 : 18 __ __ CLC
.l1038:
0fd2 : a9 a8 __ LDA #$a8
0fd4 : 85 2e __ STA P1 
0fd6 : a9 09 __ LDA #$09
0fd8 : 85 2f __ STA P2 
0fda : a9 00 __ LDA #$00
0fdc : 85 30 __ STA P3 
0fde : 85 31 __ STA P4 
0fe0 : a5 47 __ LDA T1 + 0 
0fe2 : 69 21 __ ADC #$21
0fe4 : 85 2d __ STA P0 
0fe6 : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
0fe9 : a5 48 __ LDA T2 + 0 
0feb : 85 2e __ STA P1 
0fed : a5 49 __ LDA T2 + 1 
0fef : 85 2f __ STA P2 
0ff1 : a9 c4 __ LDA #$c4
0ff3 : 85 30 __ STA P3 
0ff5 : a9 01 __ LDA #$01
0ff7 : 85 31 __ STA P4 
0ff9 : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
0ffc : 18 __ __ CLC
0ffd : a5 2e __ LDA P1 
0fff : 69 0c __ ADC #$0c
1001 : 85 48 __ STA T2 + 0 
1003 : a5 2f __ LDA P2 
1005 : 69 00 __ ADC #$00
1007 : 85 49 __ STA T2 + 1 
1009 : e6 47 __ INC T1 + 0 
100b : a5 47 __ LDA T1 + 0 
100d : c9 08 __ CMP #$08
100f : 90 c1 __ BCC $0fd2 ; (SetUpSprites.l1038 + 0)
.s55:
1011 : a9 00 __ LDA #$00
1013 : 85 47 __ STA T1 + 0 
1015 : 85 48 __ STA T2 + 0 
1017 : a9 03 __ LDA #$03
1019 : 85 33 __ STA P6 
101b : a9 04 __ LDA #$04
101d : 85 34 __ STA P7 
101f : 18 __ __ CLC
.l1040:
1020 : a9 a8 __ LDA #$a8
1022 : 85 2e __ STA P1 
1024 : a9 09 __ LDA #$09
1026 : 85 2f __ STA P2 
1028 : a9 00 __ LDA #$00
102a : 85 30 __ STA P3 
102c : 85 31 __ STA P4 
102e : a5 47 __ LDA T1 + 0 
1030 : 69 29 __ ADC #$29
1032 : 85 2d __ STA P0 
1034 : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
1037 : a9 b8 __ LDA #$b8
1039 : 85 30 __ STA P3 
103b : a9 01 __ LDA #$01
103d : 85 31 __ STA P4 
103f : 38 __ __ SEC
1040 : a9 6c __ LDA #$6c
1042 : e5 48 __ SBC T2 + 0 
1044 : 85 2e __ STA P1 
1046 : a9 02 __ LDA #$02
1048 : e9 00 __ SBC #$00
104a : 85 2f __ STA P2 
104c : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
104f : 18 __ __ CLC
1050 : a5 48 __ LDA T2 + 0 
1052 : 69 0c __ ADC #$0c
1054 : 85 48 __ STA T2 + 0 
1056 : e6 47 __ INC T1 + 0 
1058 : a5 47 __ LDA T1 + 0 
105a : c9 08 __ CMP #$08
105c : 90 c2 __ BCC $1020 ; (SetUpSprites.l1040 + 0)
.s59:
105e : a9 20 __ LDA #$20
1060 : 85 2d __ STA P0 
1062 : a9 3b __ LDA #$3b
1064 : 85 2e __ STA P1 
1066 : a9 01 __ LDA #$01
1068 : 85 2f __ STA P2 
106a : a9 00 __ LDA #$00
106c : 85 30 __ STA P3 
106e : 85 33 __ STA P6 
1070 : a9 00 __ LDA #$00
1072 : 85 31 __ STA P4 
1074 : a9 1f __ LDA #$1f
1076 : 85 32 __ STA P5 
1078 : 20 29 12 JSR $1229 ; (vram_putn.s0 + 0)
107b : a9 31 __ LDA #$31
107d : 85 2d __ STA P0 
107f : a9 d9 __ LDA #$d9
1081 : 85 2e __ STA P1 
1083 : a9 09 __ LDA #$09
1085 : 85 2f __ STA P2 
1087 : a9 03 __ LDA #$03
1089 : 85 31 __ STA P4 
108b : 85 32 __ STA P5 
108d : 85 33 __ STA P6 
108f : a9 05 __ LDA #$05
1091 : 85 34 __ STA P7 
1093 : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
1096 : a9 1c __ LDA #$1c
1098 : 85 2e __ STA P1 
109a : a9 01 __ LDA #$01
109c : 85 2f __ STA P2 
109e : a9 78 __ LDA #$78
10a0 : 85 30 __ STA P3 
10a2 : a9 00 __ LDA #$00
10a4 : 85 31 __ STA P4 
10a6 : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
10a9 : a9 20 __ LDA #$20
10ab : 85 2d __ STA P0 
10ad : a9 37 __ LDA #$37
10af : 85 2e __ STA P1 
10b1 : a9 00 __ LDA #$00
10b3 : 85 30 __ STA P3 
10b5 : 85 33 __ STA P6 
10b7 : a9 08 __ LDA #$08
10b9 : 85 34 __ STA P7 
10bb : a9 00 __ LDA #$00
10bd : 85 31 __ STA P4 
10bf : a9 23 __ LDA #$23
10c1 : 85 32 __ STA P5 
10c3 : 20 29 12 JSR $1229 ; (vram_putn.s0 + 0)
10c6 : a9 00 __ LDA #$00
10c8 : 85 47 __ STA T1 + 0 
10ca : 85 48 __ STA T2 + 0 
10cc : 85 49 __ STA T2 + 1 
10ce : a9 05 __ LDA #$05
10d0 : 85 34 __ STA P7 
10d2 : 18 __ __ CLC
.l1042:
10d3 : a9 b9 __ LDA #$b9
10d5 : 85 2e __ STA P1 
10d7 : a9 09 __ LDA #$09
10d9 : 85 2f __ STA P2 
10db : a9 00 __ LDA #$00
10dd : 85 30 __ STA P3 
10df : a9 03 __ LDA #$03
10e1 : 85 31 __ STA P4 
10e3 : 85 32 __ STA P5 
10e5 : 85 33 __ STA P6 
10e7 : a5 47 __ LDA T1 + 0 
10e9 : 69 32 __ ADC #$32
10eb : 85 2d __ STA P0 
10ed : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
10f0 : a9 f4 __ LDA #$f4
10f2 : 85 2e __ STA P1 
10f4 : a9 00 __ LDA #$00
10f6 : 85 2f __ STA P2 
10f8 : 38 __ __ SEC
10f9 : a5 48 __ LDA T2 + 0 
10fb : e9 20 __ SBC #$20
10fd : 85 4a __ STA T3 + 0 
10ff : 85 30 __ STA P3 
1101 : a5 49 __ LDA T2 + 1 
1103 : e9 00 __ SBC #$00
1105 : 85 4b __ STA T3 + 1 
1107 : 85 31 __ STA P4 
1109 : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
110c : a9 b9 __ LDA #$b9
110e : 85 2e __ STA P1 
1110 : a9 09 __ LDA #$09
1112 : 85 2f __ STA P2 
1114 : a9 00 __ LDA #$00
1116 : 85 30 __ STA P3 
1118 : a9 03 __ LDA #$03
111a : 85 31 __ STA P4 
111c : 18 __ __ CLC
111d : a5 47 __ LDA T1 + 0 
111f : 69 39 __ ADC #$39
1121 : 85 2d __ STA P0 
1123 : 20 b2 12 JSR $12b2 ; (vera_spr_set.s0 + 0)
1126 : a9 40 __ LDA #$40
1128 : 85 2e __ STA P1 
112a : a9 01 __ LDA #$01
112c : 85 2f __ STA P2 
112e : a5 4a __ LDA T3 + 0 
1130 : 85 30 __ STA P3 
1132 : a5 4b __ LDA T3 + 1 
1134 : 85 31 __ STA P4 
1136 : 20 0f 13 JSR $130f ; (vera_spr_move.s0 + 0)
1139 : 18 __ __ CLC
113a : a5 48 __ LDA T2 + 0 
113c : 69 40 __ ADC #$40
113e : 85 48 __ STA T2 + 0 
1140 : 90 02 __ BCC $1144 ; (SetUpSprites.s1045 + 0)
.s1044:
1142 : e6 49 __ INC T2 + 1 
.s1045:
1144 : e6 47 __ INC T1 + 0 
1146 : a5 47 __ LDA T1 + 0 
1148 : c9 07 __ CMP #$07
114a : 90 87 __ BCC $10d3 ; (SetUpSprites.l1042 + 0)
.s63:
114c : a9 20 __ LDA #$20
114e : 85 37 __ STA P10 
1150 : a9 40 __ LDA #$40
1152 : 8d fc 9e STA $9efc ; (sstack + 0)
1155 : a9 fa __ LDA #$fa
1157 : 8d fd 9e STA $9efd ; (sstack + 1)
115a : a9 01 __ LDA #$01
115c : 8d fe 9e STA $9efe ; (sstack + 2)
115f : a9 00 __ LDA #$00
1161 : 8d ff 9e STA $9eff ; (sstack + 3)
1164 : a9 66 __ LDA #$66
1166 : 85 35 __ STA P8 
1168 : a9 16 __ LDA #$16
116a : 85 36 __ STA P9 
116c : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
116f : a9 60 __ LDA #$60
1171 : 8d fc 9e STA $9efc ; (sstack + 0)
1174 : a9 fa __ LDA #$fa
1176 : 8d fd 9e STA $9efd ; (sstack + 1)
1179 : a9 01 __ LDA #$01
117b : 8d fe 9e STA $9efe ; (sstack + 2)
117e : a9 00 __ LDA #$00
1180 : 8d ff 9e STA $9eff ; (sstack + 3)
1183 : a9 86 __ LDA #$86
1185 : 85 35 __ STA P8 
1187 : a9 16 __ LDA #$16
1189 : 85 36 __ STA P9 
118b : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
118e : a9 80 __ LDA #$80
1190 : 8d fc 9e STA $9efc ; (sstack + 0)
1193 : a9 fa __ LDA #$fa
1195 : 8d fd 9e STA $9efd ; (sstack + 1)
1198 : a9 01 __ LDA #$01
119a : 8d fe 9e STA $9efe ; (sstack + 2)
119d : a9 00 __ LDA #$00
119f : 8d ff 9e STA $9eff ; (sstack + 3)
11a2 : a9 a6 __ LDA #$a6
11a4 : 85 35 __ STA P8 
11a6 : a9 16 __ LDA #$16
11a8 : 85 36 __ STA P9 
11aa : 20 8b 12 JSR $128b ; (SetPaletteColours.s0 + 0)
11ad : a9 a0 __ LDA #$a0
11af : 8d fc 9e STA $9efc ; (sstack + 0)
11b2 : a9 fa __ LDA #$fa
11b4 : 8d fd 9e STA $9efd ; (sstack + 1)
11b7 : a9 01 __ LDA #$01
11b9 : 8d fe 9e STA $9efe ; (sstack + 2)
11bc : a9 00 __ LDA #$00
11be : 8d ff 9e STA $9eff ; (sstack + 3)
11c1 : a9 c6 __ LDA #$c6
11c3 : 85 35 __ STA P8 
11c5 : a9 16 __ LDA #$16
11c7 : 85 36 __ STA P9 
11c9 : 4c 8b 12 JMP $128b ; (SetPaletteColours.s0 + 0)
.s1016:
11cc : c9 09 __ CMP #$09
11ce : 90 06 __ BCC $11d6 ; (SetUpSprites.s32 + 0)
.s1015:
11d0 : a9 45 __ LDA #$45
11d2 : c5 48 __ CMP T2 + 0 
11d4 : b0 05 __ BCS $11db ; (SetUpSprites.s1005 + 0)
.s32:
11d6 : a9 04 __ LDA #$04
11d8 : 4c ae 0d JMP $0dae ; (SetUpSprites.s148 + 0)
.s1005:
11db : a5 48 __ LDA T2 + 0 
11dd : c9 13 __ CMP #$13
11df : 90 06 __ BCC $11e7 ; (SetUpSprites.s36 + 0)
.s1004:
11e1 : a9 3b __ LDA #$3b
11e3 : c5 48 __ CMP T2 + 0 
11e5 : b0 05 __ BCS $11ec ; (SetUpSprites.s1003 + 0)
.s36:
11e7 : a9 05 __ LDA #$05
11e9 : 4c a1 0d JMP $0da1 ; (SetUpSprites.s156 + 0)
.s1003:
11ec : a5 48 __ LDA T2 + 0 
11ee : c9 1d __ CMP #$1d
11f0 : 90 06 __ BCC $11f8 ; (SetUpSprites.s40 + 0)
.s1002:
11f2 : a9 31 __ LDA #$31
11f4 : c5 48 __ CMP T2 + 0 
11f6 : b0 05 __ BCS $11fd ; (SetUpSprites.s41 + 0)
.s40:
11f8 : a9 06 __ LDA #$06
11fa : 4c a1 0d JMP $0da1 ; (SetUpSprites.s156 + 0)
.s41:
11fd : a9 07 __ LDA #$07
11ff : 4c a1 0d JMP $0da1 ; (SetUpSprites.s156 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1202 : a5 2d __ LDA P0 ; (bank + 0)
1204 : 4a __ __ LSR
1205 : a9 00 __ LDA #$00
1207 : 6a __ __ ROR
1208 : 85 3b __ STA ACCU + 0 
120a : a5 2f __ LDA P2 ; (mem + 1)
120c : 29 f8 __ AND #$f8
120e : 4a __ __ LSR
120f : 05 3b __ ORA ACCU + 0 
1211 : 85 3b __ STA ACCU + 0 
1213 : a5 30 __ LDA P3 ; (height + 0)
1215 : 0a __ __ ASL
1216 : 05 3b __ ORA ACCU + 0 
1218 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
121a : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
121b : a5 2d __ LDA P0 ; (bank + 0)
121d : 4a __ __ LSR
121e : a9 00 __ LDA #$00
1220 : 6a __ __ ROR
1221 : 85 3b __ STA ACCU + 0 
1223 : a5 2f __ LDA P2 ; (mem + 1)
1225 : 4a __ __ LSR
1226 : 05 3b __ ORA ACCU + 0 
.s1001:
1228 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1229 : ad 25 9f LDA $9f25 
122c : 29 fe __ AND #$fe
122e : 8d 25 9f STA $9f25 
1231 : a5 2d __ LDA P0 ; (addr + 0)
1233 : 8d 20 9f STA $9f20 
1236 : a5 2e __ LDA P1 ; (addr + 1)
1238 : 8d 21 9f STA $9f21 
123b : a5 2f __ LDA P2 ; (addr + 2)
123d : 29 01 __ AND #$01
123f : 09 10 __ ORA #$10
1241 : 8d 22 9f STA $9f22 
1244 : a5 33 __ LDA P6 ; (size + 0)
1246 : 05 34 __ ORA P7 ; (size + 1)
1248 : f0 19 __ BEQ $1263 ; (vram_putn.s1001 + 0)
.s6:
124a : a0 00 __ LDY #$00
124c : a6 33 __ LDX P6 ; (size + 0)
124e : f0 02 __ BEQ $1252 ; (vram_putn.l1002 + 0)
.s1005:
1250 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1252 : b1 31 __ LDA (P4),y ; (data + 0)
1254 : 8d 23 9f STA $9f23 
1257 : c8 __ __ INY
1258 : d0 02 __ BNE $125c ; (vram_putn.s1009 + 0)
.s1008:
125a : e6 32 __ INC P5 ; (data + 1)
.s1009:
125c : ca __ __ DEX
125d : d0 f3 __ BNE $1252 ; (vram_putn.l1002 + 0)
.s1004:
125f : c6 34 __ DEC P7 ; (size + 1)
1261 : d0 ef __ BNE $1252 ; (vram_putn.l1002 + 0)
.s1001:
1263 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1720 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1730 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1740 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1750 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1760 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1770 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1780 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1790 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
17a0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
17b0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
17c0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
17d0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
17e0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
17f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
1264 : ad 05 16 LDA $1605 ; (seed + 1)
1267 : 4a __ __ LSR
1268 : ad 04 16 LDA $1604 ; (seed + 0)
126b : 6a __ __ ROR
126c : aa __ __ TAX
126d : a9 00 __ LDA #$00
126f : 6a __ __ ROR
1270 : 4d 04 16 EOR $1604 ; (seed + 0)
1273 : 85 3b __ STA ACCU + 0 
1275 : 8a __ __ TXA
1276 : 4d 05 16 EOR $1605 ; (seed + 1)
1279 : 85 3c __ STA ACCU + 1 
127b : 4a __ __ LSR
127c : 45 3b __ EOR ACCU + 0 
127e : 8d 04 16 STA $1604 ; (seed + 0)
1281 : 85 3b __ STA ACCU + 0 
1283 : 45 3c __ EOR ACCU + 1 
1285 : 8d 05 16 STA $1605 ; (seed + 1)
1288 : 85 3c __ STA ACCU + 1 
.s1001:
128a : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1604 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
SetPaletteColours:
.s0:
128b : ad fc 9e LDA $9efc ; (sstack + 0)
128e : 85 2d __ STA P0 
1290 : ad fd 9e LDA $9efd ; (sstack + 1)
1293 : 85 2e __ STA P1 
1295 : ad fe 9e LDA $9efe ; (sstack + 2)
1298 : 85 2f __ STA P2 
129a : ad ff 9e LDA $9eff ; (sstack + 3)
129d : 85 30 __ STA P3 
129f : a5 35 __ LDA P8 ; (input + 0)
12a1 : 85 31 __ STA P4 
12a3 : a5 36 __ LDA P9 ; (input + 1)
12a5 : 85 32 __ STA P5 
12a7 : a5 37 __ LDA P10 ; (inputsize + 0)
12a9 : 85 33 __ STA P6 
12ab : a9 00 __ LDA #$00
12ad : 85 34 __ STA P7 
12af : 4c 29 12 JMP $1229 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
1606 : __ __ __ BYT 23 02 12 01 01 11 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
1616 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ScrollerOutline:
1800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1810 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1820 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1830 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1840 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1850 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1860 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1870 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1880 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1890 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
18a0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
18b0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
18c0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
18d0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
18e0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
18f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1900 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1910 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1920 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1930 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1940 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1950 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1960 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1970 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1980 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1990 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
19a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
19b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
19c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
19d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
19e0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
19f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a00 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a10 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a20 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a30 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a40 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a50 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a60 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a70 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a80 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1a90 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1aa0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ab0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
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
--------------------------------------------------------------------
Pause:
1c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c10 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
1c20 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1c30 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1c40 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1c50 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1c60 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1c70 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1c80 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1c90 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1ca0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1cb0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1cc0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1cd0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
1ce0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
1cf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_set:
.s0:
12b2 : ad 25 9f LDA $9f25 
12b5 : 29 fe __ AND #$fe
12b7 : 8d 25 9f STA $9f25 
12ba : a5 2d __ LDA P0 ; (spr + 0)
12bc : 0a __ __ ASL
12bd : 0a __ __ ASL
12be : 85 3b __ STA ACCU + 0 
12c0 : a9 3f __ LDA #$3f
12c2 : 2a __ __ ROL
12c3 : 06 3b __ ASL ACCU + 0 
12c5 : 2a __ __ ROL
12c6 : 8d 21 9f STA $9f21 
12c9 : a5 3b __ LDA ACCU + 0 
12cb : 8d 20 9f STA $9f20 
12ce : a9 11 __ LDA #$11
12d0 : 8d 22 9f STA $9f22 
12d3 : a5 30 __ LDA P3 ; (mode8 + 0)
12d5 : f0 02 __ BEQ $12d9 ; (vera_spr_set.s11 + 0)
.s9:
12d7 : a9 80 __ LDA #$80
.s11:
12d9 : 05 2f __ ORA P2 ; (addr32 + 1)
12db : a6 2e __ LDX P1 ; (addr32 + 0)
12dd : 8e 23 9f STX $9f23 
12e0 : 8d 23 9f STA $9f23 
12e3 : a9 00 __ LDA #$00
12e5 : 8d 23 9f STA $9f23 
12e8 : 8d 23 9f STA $9f23 
12eb : 8d 23 9f STA $9f23 
12ee : 8d 23 9f STA $9f23 
12f1 : a5 33 __ LDA P6 ; (z + 0)
12f3 : 0a __ __ ASL
12f4 : 0a __ __ ASL
12f5 : 8d 23 9f STA $9f23 
12f8 : a5 32 __ LDA P5 ; (h + 0)
12fa : 4a __ __ LSR
12fb : 6a __ __ ROR
12fc : 29 80 __ AND #$80
12fe : 6a __ __ ROR
12ff : 85 3b __ STA ACCU + 0 
1301 : a5 31 __ LDA P4 ; (w + 0)
1303 : 0a __ __ ASL
1304 : 0a __ __ ASL
1305 : 0a __ __ ASL
1306 : 0a __ __ ASL
1307 : 05 3b __ ORA ACCU + 0 
1309 : 05 34 __ ORA P7 ; (pal + 0)
130b : 8d 23 9f STA $9f23 
.s1001:
130e : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
130f : ad 25 9f LDA $9f25 
1312 : 29 fe __ AND #$fe
1314 : 8d 25 9f STA $9f25 
1317 : a5 2d __ LDA P0 ; (spr + 0)
1319 : 0a __ __ ASL
131a : 0a __ __ ASL
131b : 85 3b __ STA ACCU + 0 
131d : a9 3f __ LDA #$3f
131f : 2a __ __ ROL
1320 : 06 3b __ ASL ACCU + 0 
1322 : 2a __ __ ROL
1323 : aa __ __ TAX
1324 : a5 3b __ LDA ACCU + 0 
1326 : 09 02 __ ORA #$02
1328 : 8d 20 9f STA $9f20 
132b : 8e 21 9f STX $9f21 
132e : a9 11 __ LDA #$11
1330 : 8d 22 9f STA $9f22 
1333 : a5 2e __ LDA P1 ; (x + 0)
1335 : 8d 23 9f STA $9f23 
1338 : a5 2f __ LDA P2 ; (x + 1)
133a : 8d 23 9f STA $9f23 
133d : a5 30 __ LDA P3 ; (y + 0)
133f : 8d 23 9f STA $9f23 
1342 : a5 31 __ LDA P4 ; (y + 1)
1344 : 8d 23 9f STA $9f23 
.s1001:
1347 : 60 __ __ RTS
--------------------------------------------------------------------
Arrow:
1d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
1d10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
1d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
1d30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
1d40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
1d50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
1d60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
1d70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
1d80 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
1d90 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
1da0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
1db0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
1dc0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
1dd0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
1de0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
1df0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
1e00 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
1e10 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
1e20 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
1e30 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
1e40 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
1e50 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
1e60 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
1e70 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
1e80 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
1e90 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
1ea0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
1eb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
1ec0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
1ed0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
1ee0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
1ef0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
palette:
1626 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 00 00 00 00 : ......f.D.".....
1636 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
VolumeInd:
1646 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
1656 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainEyeBack:
1f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
1f10 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
1f30 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
1f40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
1f50 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
1f60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
1f70 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
1f80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
1f90 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
1fa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
1fb0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
1fc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
1fd0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
1fe0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
1ff0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2000 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2010 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2020 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2030 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2040 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2050 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2060 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2070 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2080 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2090 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
20a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
20b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
20c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
20d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
20e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
20f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2100 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2110 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2120 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2130 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2140 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2150 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2160 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2170 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2180 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2190 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
21a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
21b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
21c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
21d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
21e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
21f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2200 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2210 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2220 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2230 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2240 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2250 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2260 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2270 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2280 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2290 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
22a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
22b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
22c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
22d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
22e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
22f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2300 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2310 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2320 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2330 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2340 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2350 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2360 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2370 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2380 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2390 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
23a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
23b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
23c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
23d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
23e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
23f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
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
--------------------------------------------------------------------
ButtonStageMax:
1666 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
1676 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
1686 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
1696 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
16a6 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
16b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerPalF1:
16c6 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
16d6 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
p:
16e6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalTimer:
16e8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
2b00 : __ __ __ BYT 00 00 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
2b10 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
PalIndex:
16ea : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFF:
2b20 : __ __ __ BYT ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 : ..............w.
2b30 : __ __ __ BYT 66 06 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f : f.U.D.3.".......
--------------------------------------------------------------------
TowerPalFE:
2b40 : __ __ __ BYT dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 : ............w.f.
2b50 : __ __ __ BYT 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e : U.D.3.".........
--------------------------------------------------------------------
TowerPalFD:
2b60 : __ __ __ BYT cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 : ..........w.f.U.
2b70 : __ __ __ BYT 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d : D.3."...........
--------------------------------------------------------------------
TowerPalFC:
2b80 : __ __ __ BYT bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 : ........w.f.U.D.
2b90 : __ __ __ BYT 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c : 3.".............
--------------------------------------------------------------------
TowerPalFB:
2ba0 : __ __ __ BYT aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 33 03 : ......w.f.U.D.3.
2bb0 : __ __ __ BYT 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b : "...............
--------------------------------------------------------------------
TowerPalFA:
2bc0 : __ __ __ BYT 99 09 88 08 77 07 66 06 55 05 44 04 33 03 22 02 : ....w.f.U.D.3.".
2bd0 : __ __ __ BYT 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a : ................
--------------------------------------------------------------------
TowerPalF9:
2be0 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
2bf0 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
--------------------------------------------------------------------
TowerPalF8:
2c00 : __ __ __ BYT 77 07 66 06 55 05 44 04 33 03 22 02 11 01 00 00 : w.f.U.D.3.".....
2c10 : __ __ __ BYT ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 88 08 : ................
--------------------------------------------------------------------
TowerPalF7:
2c20 : __ __ __ BYT 66 06 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f : f.U.D.3.".......
2c30 : __ __ __ BYT ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 : ..............w.
--------------------------------------------------------------------
TowerPalF6:
2c40 : __ __ __ BYT 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e : U.D.3.".........
2c50 : __ __ __ BYT dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 : ............w.f.
--------------------------------------------------------------------
TowerPalF5:
2c60 : __ __ __ BYT 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d : D.3."...........
2c70 : __ __ __ BYT cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 : ..........w.f.U.
--------------------------------------------------------------------
TowerPalF4:
2c80 : __ __ __ BYT 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c : 3.".............
2c90 : __ __ __ BYT bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 : ........w.f.U.D.
--------------------------------------------------------------------
TowerPalF3:
2ca0 : __ __ __ BYT 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b : "...............
2cb0 : __ __ __ BYT aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 33 03 : ......w.f.U.D.3.
--------------------------------------------------------------------
TowerPalF2:
2cc0 : __ __ __ BYT 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a : ................
2cd0 : __ __ __ BYT 99 09 88 08 77 07 66 06 55 05 44 04 33 03 22 02 : ....w.f.U.D.3.".
--------------------------------------------------------------------
ShimmerState:
16ec : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPalShimmer:
2ce0 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
2cf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
zsm_check:
.s0:
1348 : ad 03 16 LDA $1603 ; (zsm_finished + 0)
.s1001:
134b : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
134c : a9 01 __ LDA #$01
134e : 8d 03 16 STA $1603 ; (zsm_finished + 0)
1351 : ad ed 16 LDA $16ed ; (zsm_reading + 0)
1354 : f0 0a __ BEQ $1360 ; (zsm_init.s3 + 0)
.s1:
1356 : a9 02 __ LDA #$02
1358 : 20 a5 13 JSR $13a5 ; (krnio_close.s1000 + 0)
135b : a9 00 __ LDA #$00
135d : 8d ed 16 STA $16ed ; (zsm_reading + 0)
.s3:
1360 : 8d f4 16 STA $16f4 ; (zsm_pos + 0)
1363 : 8d f5 16 STA $16f5 ; (zsm_pos + 1)
1366 : 8d f6 16 STA $16f6 ; (zsm_wpos + 0)
1369 : 8d f7 16 STA $16f7 ; (zsm_wpos + 1)
136c : 8d f3 16 STA $16f3 ; (zsm_delay + 0)
136f : a5 30 __ LDA P3 ; (fname + 0)
1371 : 85 2d __ STA P0 
1373 : a5 31 __ LDA P4 ; (fname + 1)
1375 : 85 2e __ STA P1 
1377 : 20 ad 13 JSR $13ad ; (krnio_setnam.s0 + 0)
137a : a9 02 __ LDA #$02
137c : 85 2d __ STA P0 
137e : 85 2f __ STA P2 
1380 : a9 08 __ LDA #$08
1382 : 85 2e __ STA P1 
1384 : 20 c3 13 JSR $13c3 ; (krnio_open.s0 + 0)
1387 : a5 3b __ LDA ACCU + 0 
1389 : f0 19 __ BEQ $13a4 ; (zsm_init.s1001 + 0)
.s4:
138b : a9 01 __ LDA #$01
138d : 8d ed 16 STA $16ed ; (zsm_reading + 0)
1390 : 20 eb 13 JSR $13eb ; (zsm_fill.s0 + 0)
1393 : a9 10 __ LDA #$10
1395 : 8d f4 16 STA $16f4 ; (zsm_pos + 0)
1398 : a9 00 __ LDA #$00
139a : 8d f5 16 STA $16f5 ; (zsm_pos + 1)
139d : 8d 03 16 STA $1603 ; (zsm_finished + 0)
13a0 : a9 01 __ LDA #$01
13a2 : 85 3b __ STA ACCU + 0 
.s1001:
13a4 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
16ed : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
13a5 : 85 2d __ STA P0 
.s0:
13a7 : a5 2d __ LDA P0 
13a9 : 20 c3 ff JSR $ffc3 
.s1001:
13ac : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
16f6 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
13ad : a5 2d __ LDA P0 
13af : 05 2e __ ORA P1 
13b1 : f0 08 __ BEQ $13bb ; (krnio_setnam.s0 + 14)
13b3 : a0 ff __ LDY #$ff
13b5 : c8 __ __ INY
13b6 : b1 2d __ LDA (P0),y 
13b8 : d0 fb __ BNE $13b5 ; (krnio_setnam.s0 + 8)
13ba : 98 __ __ TYA
13bb : a6 2d __ LDX P0 
13bd : a4 2e __ LDY P1 
13bf : 20 bd ff JSR $ffbd 
.s1001:
13c2 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
13c3 : a9 00 __ LDA #$00
13c5 : a6 2d __ LDX P0 ; (fnum + 0)
13c7 : 9d 3b 31 STA $313b,x ; (krnio_pstatus + 0)
13ca : a9 00 __ LDA #$00
13cc : 85 3b __ STA ACCU + 0 
13ce : 85 3c __ STA ACCU + 1 
13d0 : a5 2d __ LDA P0 ; (fnum + 0)
13d2 : a6 2e __ LDX P1 
13d4 : a4 2f __ LDY P2 
13d6 : 20 ba ff JSR $ffba 
13d9 : 20 c0 ff JSR $ffc0 
13dc : 90 08 __ BCC $13e6 ; (krnio_open.s0 + 35)
13de : a5 2d __ LDA P0 ; (fnum + 0)
13e0 : 20 c3 ff JSR $ffc3 
13e3 : 4c ea 13 JMP $13ea ; (krnio_open.s1001 + 0)
13e6 : a9 01 __ LDA #$01
13e8 : 85 3b __ STA ACCU + 0 
.s1001:
13ea : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
313b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
13eb : ad ed 16 LDA $16ed ; (zsm_reading + 0)
13ee : f0 20 __ BEQ $1410 ; (zsm_fill.s1 + 0)
.s2:
13f0 : ad f5 16 LDA $16f5 ; (zsm_pos + 1)
13f3 : 18 __ __ CLC
13f4 : 69 04 __ ADC #$04
13f6 : cd f7 16 CMP $16f7 ; (zsm_wpos + 1)
13f9 : d0 0c __ BNE $1407 ; (zsm_fill.s6 + 0)
.s1006:
13fb : ad f6 16 LDA $16f6 ; (zsm_wpos + 0)
13fe : cd f4 16 CMP $16f4 ; (zsm_pos + 0)
1401 : d0 04 __ BNE $1407 ; (zsm_fill.s6 + 0)
.s5:
1403 : a9 00 __ LDA #$00
1405 : f0 0b __ BEQ $1412 ; (zsm_fill.s1008 + 0)
.s6:
1407 : a9 02 __ LDA #$02
1409 : 20 8f 14 JSR $148f ; (krnio_chkin.s1000 + 0)
140c : a5 3b __ LDA ACCU + 0 
140e : d0 07 __ BNE $1417 ; (zsm_fill.s9 + 0)
.s1:
1410 : a9 ff __ LDA #$ff
.s1008:
1412 : 85 3b __ STA ACCU + 0 
.s1001:
1414 : 85 3c __ STA ACCU + 1 
1416 : 60 __ __ RTS
.s9:
1417 : a9 00 __ LDA #$00
1419 : 85 47 __ STA T1 + 0 
141b : 85 48 __ STA T1 + 1 
141d : ad f5 16 LDA $16f5 ; (zsm_pos + 1)
1420 : 18 __ __ CLC
1421 : 69 04 __ ADC #$04
1423 : cd f7 16 CMP $16f7 ; (zsm_wpos + 1)
1426 : d0 08 __ BNE $1430 ; (zsm_fill.l13 + 0)
.s1002:
1428 : ad f6 16 LDA $16f6 ; (zsm_wpos + 0)
142b : cd f4 16 CMP $16f4 ; (zsm_pos + 0)
142e : f0 49 __ BEQ $1479 ; (zsm_fill.s37 + 0)
.l13:
1430 : 20 a1 14 JSR $14a1 ; (krnio_chrin.s0 + 0)
1433 : ad f6 16 LDA $16f6 ; (zsm_wpos + 0)
1436 : aa __ __ TAX
1437 : 18 __ __ CLC
1438 : 69 01 __ ADC #$01
143a : 8d f6 16 STA $16f6 ; (zsm_wpos + 0)
143d : ad f7 16 LDA $16f7 ; (zsm_wpos + 1)
1440 : a8 __ __ TAY
1441 : 69 00 __ ADC #$00
1443 : 8d f7 16 STA $16f7 ; (zsm_wpos + 1)
1446 : 8a __ __ TXA
1447 : 18 __ __ CLC
1448 : 69 3b __ ADC #$3b
144a : 85 49 __ STA T3 + 0 
144c : 98 __ __ TYA
144d : 29 03 __ AND #$03
144f : 69 2d __ ADC #$2d
1451 : 85 4a __ STA T3 + 1 
1453 : a5 3b __ LDA ACCU + 0 
1455 : a0 00 __ LDY #$00
1457 : 91 49 __ STA (T3 + 0),y 
1459 : e6 47 __ INC T1 + 0 
145b : d0 02 __ BNE $145f ; (zsm_fill.s1010 + 0)
.s1009:
145d : e6 48 __ INC T1 + 1 
.s1010:
145f : 20 ab 14 JSR $14ab ; (krnio_status.s0 + 0)
1462 : a5 3b __ LDA ACCU + 0 
1464 : d0 0e __ BNE $1474 ; (zsm_fill.s15 + 0)
.s12:
1466 : ad f5 16 LDA $16f5 ; (zsm_pos + 1)
1469 : 18 __ __ CLC
146a : 69 04 __ ADC #$04
146c : cd f7 16 CMP $16f7 ; (zsm_wpos + 1)
146f : d0 bf __ BNE $1430 ; (zsm_fill.l13 + 0)
1471 : 4c 28 14 JMP $1428 ; (zsm_fill.s1002 + 0)
.s15:
1474 : a9 00 __ LDA #$00
1476 : 8d ed 16 STA $16ed ; (zsm_reading + 0)
.s37:
1479 : 20 b5 14 JSR $14b5 ; (krnio_clrchn.s0 + 0)
147c : ad ed 16 LDA $16ed ; (zsm_reading + 0)
147f : d0 05 __ BNE $1486 ; (zsm_fill.s21 + 0)
.s19:
1481 : a9 02 __ LDA #$02
1483 : 20 a5 13 JSR $13a5 ; (krnio_close.s1000 + 0)
.s21:
1486 : a5 47 __ LDA T1 + 0 
1488 : 85 3b __ STA ACCU + 0 
148a : a5 48 __ LDA T1 + 1 
148c : 4c 14 14 JMP $1414 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
148f : 85 2d __ STA P0 
.s0:
1491 : a6 2d __ LDX P0 
1493 : 20 c6 ff JSR $ffc6 
1496 : a9 00 __ LDA #$00
1498 : 85 3c __ STA ACCU + 1 
149a : b0 02 __ BCS $149e ; (krnio_chkin.s0 + 13)
149c : a9 01 __ LDA #$01
149e : 85 3b __ STA ACCU + 0 
.s1001:
14a0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
14a1 : 20 cf ff JSR $ffcf 
14a4 : 85 3b __ STA ACCU + 0 
14a6 : a9 00 __ LDA #$00
14a8 : 85 3c __ STA ACCU + 1 
.s1001:
14aa : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
14ab : 20 b7 ff JSR $ffb7 
14ae : 85 3b __ STA ACCU + 0 
14b0 : a9 00 __ LDA #$00
14b2 : 85 3c __ STA ACCU + 1 
.s1001:
14b4 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
14b5 : 20 cc ff JSR $ffcc 
.s1001:
14b8 : 60 __ __ RTS
--------------------------------------------------------------------
14b9 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
14c9 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
14d7 : 20 f3 14 JSR $14f3 ; (getchx.s0 + 0)
14da : a5 3c __ LDA ACCU + 1 
14dc : d0 10 __ BNE $14ee ; (Control.s3 + 0)
.s1005:
14de : a5 3b __ LDA ACCU + 0 
14e0 : c9 20 __ CMP #$20
14e2 : d0 0a __ BNE $14ee ; (Control.s3 + 0)
.s1:
14e4 : a9 00 __ LDA #$00
14e6 : c5 2e __ CMP P1 ; (playing + 0)
14e8 : 2a __ __ ROL
14e9 : 85 2e __ STA P1 ; (playing + 0)
14eb : 20 24 15 JSR $1524 ; (zsm_irq_play.s0 + 0)
.s3:
14ee : a5 2e __ LDA P1 ; (playing + 0)
14f0 : 85 3b __ STA ACCU + 0 
.s1001:
14f2 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
14f3 : 20 fd 14 JSR $14fd ; (getpch + 0)
14f6 : 85 3b __ STA ACCU + 0 
14f8 : a9 00 __ LDA #$00
14fa : 85 3c __ STA ACCU + 1 
.s1001:
14fc : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
14fd : 20 e4 ff JSR $ffe4 
1500 : ae ee 16 LDX $16ee ; (giocharmap + 0)
1503 : e0 01 __ CPX #$01
1505 : 90 1c __ BCC $1523 ; (getpch + 38)
1507 : c9 0d __ CMP #$0d
1509 : d0 02 __ BNE $150d ; (getpch + 16)
150b : a9 0a __ LDA #$0a
150d : e0 02 __ CPX #$02
150f : 90 12 __ BCC $1523 ; (getpch + 38)
1511 : c9 41 __ CMP #$41
1513 : 90 0e __ BCC $1523 ; (getpch + 38)
1515 : c9 7b __ CMP #$7b
1517 : b0 0a __ BCS $1523 ; (getpch + 38)
1519 : c9 61 __ CMP #$61
151b : b0 04 __ BCS $1521 ; (getpch + 36)
151d : c9 5b __ CMP #$5b
151f : b0 02 __ BCS $1523 ; (getpch + 38)
1521 : 49 20 __ EOR #$20
1523 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
16ee : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1524 : 8d 02 16 STA $1602 ; (zsm_playing + 0)
.s1001:
1527 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
16ef : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
16f8 : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
2d00 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
2d10 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
2d20 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
2d30 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
1528 : ad 26 9f LDA $9f26 
152b : 29 40 __ AND #$40
152d : d0 f9 __ BNE $1528 ; (frame_wait.l1 + 0)
.l4:
152f : ad 26 9f LDA $9f26 
1532 : 29 40 __ AND #$40
1534 : f0 f9 __ BEQ $152f ; (frame_wait.l4 + 0)
.s1001:
1536 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1537 : 38 __ __ SEC
1538 : a9 00 __ LDA #$00
153a : e5 3b __ SBC ACCU + 0 
153c : 85 3b __ STA ACCU + 0 
153e : a9 00 __ LDA #$00
1540 : e5 3c __ SBC ACCU + 1 
1542 : 85 3c __ STA ACCU + 1 
1544 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1545 : 38 __ __ SEC
1546 : a9 00 __ LDA #$00
1548 : e5 23 __ SBC WORK + 0 
154a : 85 23 __ STA WORK + 0 
154c : a9 00 __ LDA #$00
154e : e5 24 __ SBC WORK + 1 
1550 : 85 24 __ STA WORK + 1 
1552 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1553 : a5 3c __ LDA ACCU + 1 
1555 : d0 31 __ BNE $1588 ; (divmod + 53)
1557 : a5 24 __ LDA WORK + 1 
1559 : d0 1e __ BNE $1579 ; (divmod + 38)
155b : 85 26 __ STA WORK + 3 
155d : a2 04 __ LDX #$04
155f : 06 3b __ ASL ACCU + 0 
1561 : 2a __ __ ROL
1562 : c5 23 __ CMP WORK + 0 
1564 : 90 02 __ BCC $1568 ; (divmod + 21)
1566 : e5 23 __ SBC WORK + 0 
1568 : 26 3b __ ROL ACCU + 0 
156a : 2a __ __ ROL
156b : c5 23 __ CMP WORK + 0 
156d : 90 02 __ BCC $1571 ; (divmod + 30)
156f : e5 23 __ SBC WORK + 0 
1571 : 26 3b __ ROL ACCU + 0 
1573 : ca __ __ DEX
1574 : d0 eb __ BNE $1561 ; (divmod + 14)
1576 : 85 25 __ STA WORK + 2 
1578 : 60 __ __ RTS
1579 : a5 3b __ LDA ACCU + 0 
157b : 85 25 __ STA WORK + 2 
157d : a5 3c __ LDA ACCU + 1 
157f : 85 26 __ STA WORK + 3 
1581 : a9 00 __ LDA #$00
1583 : 85 3b __ STA ACCU + 0 
1585 : 85 3c __ STA ACCU + 1 
1587 : 60 __ __ RTS
1588 : a5 24 __ LDA WORK + 1 
158a : d0 1f __ BNE $15ab ; (divmod + 88)
158c : a5 23 __ LDA WORK + 0 
158e : 30 1b __ BMI $15ab ; (divmod + 88)
1590 : a9 00 __ LDA #$00
1592 : 85 26 __ STA WORK + 3 
1594 : a2 10 __ LDX #$10
1596 : 06 3b __ ASL ACCU + 0 
1598 : 26 3c __ ROL ACCU + 1 
159a : 2a __ __ ROL
159b : c5 23 __ CMP WORK + 0 
159d : 90 02 __ BCC $15a1 ; (divmod + 78)
159f : e5 23 __ SBC WORK + 0 
15a1 : 26 3b __ ROL ACCU + 0 
15a3 : 26 3c __ ROL ACCU + 1 
15a5 : ca __ __ DEX
15a6 : d0 f2 __ BNE $159a ; (divmod + 71)
15a8 : 85 25 __ STA WORK + 2 
15aa : 60 __ __ RTS
15ab : a9 00 __ LDA #$00
15ad : 85 25 __ STA WORK + 2 
15af : 85 26 __ STA WORK + 3 
15b1 : 84 22 __ STY $22 
15b3 : a0 10 __ LDY #$10
15b5 : 18 __ __ CLC
15b6 : 26 3b __ ROL ACCU + 0 
15b8 : 26 3c __ ROL ACCU + 1 
15ba : 26 25 __ ROL WORK + 2 
15bc : 26 26 __ ROL WORK + 3 
15be : 38 __ __ SEC
15bf : a5 25 __ LDA WORK + 2 
15c1 : e5 23 __ SBC WORK + 0 
15c3 : aa __ __ TAX
15c4 : a5 26 __ LDA WORK + 3 
15c6 : e5 24 __ SBC WORK + 1 
15c8 : 90 04 __ BCC $15ce ; (divmod + 123)
15ca : 86 25 __ STX WORK + 2 
15cc : 85 26 __ STA WORK + 3 
15ce : 88 __ __ DEY
15cf : d0 e5 __ BNE $15b6 ; (divmod + 99)
15d1 : 26 3b __ ROL ACCU + 0 
15d3 : 26 3c __ ROL ACCU + 1 
15d5 : a4 22 __ LDY $22 
15d7 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
15d8 : 24 3c __ BIT ACCU + 1 
15da : 10 0d __ BPL $15e9 ; (mods16 + 17)
15dc : 20 37 15 JSR $1537 ; (negaccu + 0)
15df : 24 24 __ BIT WORK + 1 
15e1 : 10 0d __ BPL $15f0 ; (mods16 + 24)
15e3 : 20 45 15 JSR $1545 ; (negtmp + 0)
15e6 : 4c 53 15 JMP $1553 ; (divmod + 0)
15e9 : 24 24 __ BIT WORK + 1 
15eb : 10 f9 __ BPL $15e6 ; (mods16 + 14)
15ed : 20 45 15 JSR $1545 ; (negtmp + 0)
15f0 : 20 53 15 JSR $1553 ; (divmod + 0)
15f3 : 38 __ __ SEC
15f4 : a9 00 __ LDA #$00
15f6 : e5 25 __ SBC WORK + 2 
15f8 : 85 25 __ STA WORK + 2 
15fa : a9 00 __ LDA #$00
15fc : e5 26 __ SBC WORK + 3 
15fe : 85 26 __ STA WORK + 3 
1600 : 60 __ __ RTS
