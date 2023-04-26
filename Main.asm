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
080e : 8e ff 13 STX $13ff ; (spentry + 0)
0811 : a9 5b __ LDA #$5b
0813 : 85 39 __ STA IP + 0 
0815 : a9 26 __ LDA #$26
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 2a __ LDA #$2a
081c : e9 26 __ SBC #$26
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
0830 : a9 6b __ LDA #$6b
0832 : e9 5b __ SBC #$5b
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
13ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 a9 0a JSR $0aa9 ; (zsm_irq_init.s0 + 0)
0883 : 20 77 0c JSR $0c77 ; (ClearVERAScreen.s0 + 0)
0886 : 20 ba 0c JSR $0cba ; (SetUpSprites.s0 + 0)
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
08b7 : 85 4e __ STA T1 + 0 
.l2:
08b9 : ad e4 15 LDA $15e4 ; (p + 0)
08bc : 18 __ __ CLC
08bd : 69 01 __ ADC #$01
08bf : 8d e4 15 STA $15e4 ; (p + 0)
08c2 : aa __ __ TAX
08c3 : 90 03 __ BCC $08c8 ; (main.s1027 + 0)
.s1026:
08c5 : ee e5 15 INC $15e5 ; (p + 1)
.s1027:
08c8 : ad e6 15 LDA $15e6 ; (PalTimer + 0)
08cb : 85 49 __ STA T3 + 0 
08cd : 18 __ __ CLC
08ce : 69 01 __ ADC #$01
08d0 : 8d e6 15 STA $15e6 ; (PalTimer + 0)
08d3 : ad e7 15 LDA $15e7 ; (PalTimer + 1)
08d6 : a8 __ __ TAY
08d7 : 69 00 __ ADC #$00
08d9 : 8d e7 15 STA $15e7 ; (PalTimer + 1)
08dc : a9 3c __ LDA #$3c
08de : 8d 2c 9f STA $9f2c 
08e1 : 98 __ __ TYA
08e2 : 30 5c __ BMI $0940 ; (main.s1025 + 0)
.s1024:
08e4 : d0 06 __ BNE $08ec ; (main.s4 + 0)
.s1023:
08e6 : a9 03 __ LDA #$03
08e8 : c5 49 __ CMP T3 + 0 
08ea : b0 54 __ BCS $0940 ; (main.s1025 + 0)
.s4:
08ec : a9 20 __ LDA #$20
08ee : 85 37 __ STA P10 
08f0 : a9 a0 __ LDA #$a0
08f2 : 8d fc 9e STA $9efc ; (sstack + 0)
08f5 : a9 fa __ LDA #$fa
08f7 : 8d fd 9e STA $9efd ; (sstack + 1)
08fa : a9 01 __ LDA #$01
08fc : 8d fe 9e STA $9efe ; (sstack + 2)
08ff : a9 00 __ LDA #$00
0901 : 8d ff 9e STA $9eff ; (sstack + 3)
0904 : ad e8 15 LDA $15e8 ; (PalIndex + 0)
0907 : 18 __ __ CLC
0908 : 69 01 __ ADC #$01
090a : 8d e8 15 STA $15e8 ; (PalIndex + 0)
090d : ad e9 15 LDA $15e9 ; (PalIndex + 1)
0910 : 69 00 __ ADC #$00
0912 : 8d e9 15 STA $15e9 ; (PalIndex + 1)
0915 : 0d e8 15 ORA $15e8 ; (PalIndex + 0)
0918 : f0 10 __ BEQ $092a ; (main.s104 + 0)
.s8:
091a : ad e9 15 LDA $15e9 ; (PalIndex + 1)
091d : d0 03 __ BNE $0922 ; (main.s50 + 0)
091f : 4c 09 0a JMP $0a09 ; (main.s1022 + 0)
.s50:
0922 : a9 00 __ LDA #$00
0924 : 8d e8 15 STA $15e8 ; (PalIndex + 0)
0927 : 8d e9 15 STA $15e9 ; (PalIndex + 1)
.s104:
092a : a9 24 __ LDA #$24
092c : a0 40 __ LDY #$40
.s101:
092e : 84 35 __ STY P8 
0930 : 85 36 __ STA P9 
0932 : 20 cd 11 JSR $11cd ; (SetPaletteColours.s0 + 0)
0935 : a9 00 __ LDA #$00
0937 : 8d e6 15 STA $15e6 ; (PalTimer + 0)
093a : 8d e7 15 STA $15e7 ; (PalTimer + 1)
093d : ae e4 15 LDX $15e4 ; (p + 0)
.s1025:
0940 : ad e5 15 LDA $15e5 ; (p + 1)
0943 : d0 3f __ BNE $0984 ; (main.s80 + 0)
.s1008:
0945 : e0 03 __ CPX #$03
0947 : d0 3b __ BNE $0984 ; (main.s80 + 0)
.s52:
0949 : a9 20 __ LDA #$20
094b : 85 37 __ STA P10 
094d : a9 00 __ LDA #$00
094f : 8d fc 9e STA $9efc ; (sstack + 0)
0952 : 8d ff 9e STA $9eff ; (sstack + 3)
0955 : a9 fa __ LDA #$fa
0957 : 8d fd 9e STA $9efd ; (sstack + 1)
095a : a9 01 __ LDA #$01
095c : 8d fe 9e STA $9efe ; (sstack + 2)
095f : a9 00 __ LDA #$00
0961 : cd ea 15 CMP $15ea ; (ShimmerState + 0)
0964 : 2a __ __ ROL
0965 : 8d ea 15 STA $15ea ; (ShimmerState + 0)
0968 : d0 07 __ BNE $0971 ; (main.s55 + 0)
.s56:
096a : a9 26 __ LDA #$26
096c : a0 00 __ LDY #$00
096e : 4c 75 09 JMP $0975 ; (main.s103 + 0)
.s55:
0971 : a9 15 __ LDA #$15
0973 : a0 44 __ LDY #$44
.s103:
0975 : 84 35 __ STY P8 
0977 : 85 36 __ STA P9 
0979 : 20 cd 11 JSR $11cd ; (SetPaletteColours.s0 + 0)
097c : a9 00 __ LDA #$00
097e : 8d e4 15 STA $15e4 ; (p + 0)
0981 : 8d e5 15 STA $15e5 ; (p + 1)
.s80:
0984 : a9 03 __ LDA #$03
0986 : 8d 2c 9f STA $9f2c 
0989 : 20 8a 12 JSR $128a ; (zsm_check.s0 + 0)
098c : 09 00 __ ORA #$00
098e : f0 0b __ BEQ $099b ; (main.s60 + 0)
.s58:
0990 : a9 00 __ LDA #$00
0992 : 85 30 __ STA P3 
0994 : a9 14 __ LDA #$14
0996 : 85 31 __ STA P4 
0998 : 20 8e 12 JSR $128e ; (zsm_init.s0 + 0)
.s60:
099b : a5 4e __ LDA T1 + 0 
099d : 85 2e __ STA P1 
099f : 20 1a 14 JSR $141a ; (Control.s0 + 0)
09a2 : a5 3b __ LDA ACCU + 0 
09a4 : 85 4e __ STA T1 + 0 
09a6 : ad ed 15 LDA $15ed ; (FrameCount + 0)
09a9 : 85 47 __ STA T2 + 0 
09ab : 85 3b __ STA ACCU + 0 
09ad : ad ee 15 LDA $15ee ; (FrameCount + 1)
09b0 : 85 3c __ STA ACCU + 1 
09b2 : a9 04 __ LDA #$04
09b4 : 85 23 __ STA WORK + 0 
09b6 : a9 00 __ LDA #$00
09b8 : 85 24 __ STA WORK + 1 
09ba : 20 17 15 JSR $1517 ; (mods16 + 0)
09bd : a5 26 __ LDA WORK + 3 
09bf : d0 19 __ BNE $09da ; (main.s63 + 0)
.s1004:
09c1 : a5 25 __ LDA WORK + 2 
09c3 : c9 01 __ CMP #$01
09c5 : d0 13 __ BNE $09da ; (main.s63 + 0)
.s61:
09c7 : a9 3b __ LDA #$3b
09c9 : cd f6 15 CMP $15f6 ; (off1 + 0)
09cc : b0 09 __ BCS $09d7 ; (main.s102 + 0)
.s64:
09ce : ae f6 15 LDX $15f6 ; (off1 + 0)
09d1 : bd 20 26 LDA $2620,x ; (TestText2 + 0)
09d4 : 8d 23 9f STA $9f23 
.s102:
09d7 : ee f6 15 INC $15f6 ; (off1 + 0)
.s63:
09da : 06 47 __ ASL T2 + 0 
09dc : ad ee 15 LDA $15ee ; (FrameCount + 1)
09df : 2a __ __ ROL
09e0 : 18 __ __ CLC
09e1 : 69 ff __ ADC #$ff
09e3 : 8d 38 9f STA $9f38 
09e6 : a5 47 __ LDA T2 + 0 
09e8 : 8d 37 9f STA $9f37 
09eb : a9 01 __ LDA #$01
09ed : 8d 2c 9f STA $9f2c 
09f0 : 20 2d 13 JSR $132d ; (zsm_fill.s0 + 0)
09f3 : a9 00 __ LDA #$00
09f5 : 8d 2c 9f STA $9f2c 
09f8 : 20 67 14 JSR $1467 ; (frame_wait.l1 + 0)
09fb : ee ed 15 INC $15ed ; (FrameCount + 0)
09fe : f0 03 __ BEQ $0a03 ; (main.s1028 + 0)
0a00 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
.s1028:
0a03 : ee ee 15 INC $15ee ; (FrameCount + 1)
0a06 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
.s1022:
0a09 : ad e8 15 LDA $15e8 ; (PalIndex + 0)
0a0c : c9 01 __ CMP #$01
0a0e : d0 07 __ BNE $0a17 ; (main.s1021 + 0)
.s10:
0a10 : a9 24 __ LDA #$24
0a12 : a0 60 __ LDY #$60
0a14 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1021:
0a17 : c9 02 __ CMP #$02
0a19 : d0 07 __ BNE $0a22 ; (main.s1020 + 0)
.s13:
0a1b : a9 24 __ LDA #$24
0a1d : a0 80 __ LDY #$80
0a1f : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1020:
0a22 : c9 03 __ CMP #$03
0a24 : d0 07 __ BNE $0a2d ; (main.s1019 + 0)
.s16:
0a26 : a9 24 __ LDA #$24
0a28 : a0 a0 __ LDY #$a0
0a2a : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1019:
0a2d : c9 04 __ CMP #$04
0a2f : d0 07 __ BNE $0a38 ; (main.s1018 + 0)
.s19:
0a31 : a9 24 __ LDA #$24
0a33 : a0 c0 __ LDY #$c0
0a35 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1018:
0a38 : c9 05 __ CMP #$05
0a3a : d0 07 __ BNE $0a43 ; (main.s1017 + 0)
.s22:
0a3c : a9 24 __ LDA #$24
0a3e : a0 e0 __ LDY #$e0
0a40 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1017:
0a43 : c9 06 __ CMP #$06
0a45 : d0 07 __ BNE $0a4e ; (main.s1016 + 0)
.s25:
0a47 : a9 25 __ LDA #$25
0a49 : a0 00 __ LDY #$00
0a4b : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1016:
0a4e : c9 07 __ CMP #$07
0a50 : d0 07 __ BNE $0a59 ; (main.s1015 + 0)
.s28:
0a52 : a9 25 __ LDA #$25
0a54 : a0 20 __ LDY #$20
0a56 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1015:
0a59 : c9 08 __ CMP #$08
0a5b : d0 07 __ BNE $0a64 ; (main.s1014 + 0)
.s31:
0a5d : a9 25 __ LDA #$25
0a5f : a0 40 __ LDY #$40
0a61 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1014:
0a64 : c9 09 __ CMP #$09
0a66 : d0 07 __ BNE $0a6f ; (main.s1013 + 0)
.s34:
0a68 : a9 25 __ LDA #$25
0a6a : a0 60 __ LDY #$60
0a6c : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1013:
0a6f : c9 0a __ CMP #$0a
0a71 : d0 07 __ BNE $0a7a ; (main.s1012 + 0)
.s37:
0a73 : a9 25 __ LDA #$25
0a75 : a0 80 __ LDY #$80
0a77 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1012:
0a7a : c9 0b __ CMP #$0b
0a7c : d0 07 __ BNE $0a85 ; (main.s1011 + 0)
.s40:
0a7e : a9 25 __ LDA #$25
0a80 : a0 a0 __ LDY #$a0
0a82 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1011:
0a85 : c9 0c __ CMP #$0c
0a87 : d0 07 __ BNE $0a90 ; (main.s1010 + 0)
.s43:
0a89 : a9 25 __ LDA #$25
0a8b : a0 c0 __ LDY #$c0
0a8d : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1010:
0a90 : c9 0d __ CMP #$0d
0a92 : d0 07 __ BNE $0a9b ; (main.s1009 + 0)
.s46:
0a94 : a9 25 __ LDA #$25
0a96 : a0 e0 __ LDY #$e0
0a98 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
.s1009:
0a9b : c9 0e __ CMP #$0e
0a9d : f0 03 __ BEQ $0aa2 ; (main.s49 + 0)
0a9f : 4c 22 09 JMP $0922 ; (main.s50 + 0)
.s49:
0aa2 : a9 24 __ LDA #$24
0aa4 : a0 20 __ LDY #$20
0aa6 : 4c 2e 09 JMP $092e ; (main.s101 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0aa9 : 78 __ __ SEI
0aaa : ad 14 03 LDA $0314 
0aad : 8d ef 15 STA $15ef ; (oirq + 0)
0ab0 : ad 15 03 LDA $0315 
0ab3 : 8d f0 15 STA $15f0 ; (oirq + 1)
0ab6 : a9 c2 __ LDA #$c2
0ab8 : 8d 14 03 STA $0314 
0abb : a9 0a __ LDA #$0a
0abd : 8d 15 03 STA $0315 
0ac0 : 58 __ __ CLI
.s1001:
0ac1 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
15ef : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0ac2 : 20 c8 0a JSR $0ac8 ; (irq.s1000 + 0)
0ac5 : 6c ef 15 JMP ($15ef)
--------------------------------------------------------------------
irq:
.s1000:
0ac8 : a5 2d __ LDA P0 
0aca : 48 __ __ PHA
0acb : a5 2e __ LDA P1 
0acd : 48 __ __ PHA
0ace : a5 3b __ LDA ACCU + 0 
0ad0 : 48 __ __ PHA
0ad1 : a5 3c __ LDA ACCU + 1 
0ad3 : 48 __ __ PHA
0ad4 : a5 47 __ LDA T0 + 0 
0ad6 : 48 __ __ PHA
0ad7 : a5 48 __ LDA $48 
0ad9 : 48 __ __ PHA
0ada : a5 49 __ LDA $49 
0adc : 48 __ __ PHA
0add : a5 4a __ LDA $4a 
0adf : 48 __ __ PHA
0ae0 : a5 4b __ LDA $4b 
0ae2 : 48 __ __ PHA
0ae3 : a5 4c __ LDA $4c 
0ae5 : 48 __ __ PHA
0ae6 : a5 4d __ LDA $4d 
0ae8 : 48 __ __ PHA
0ae9 : a5 4e __ LDA $4e 
0aeb : 48 __ __ PHA
0aec : a5 4f __ LDA $4f 
0aee : 48 __ __ PHA
0aef : a5 50 __ LDA $50 
0af1 : 48 __ __ PHA
.s0:
0af2 : ad 40 15 LDA $1540 ; (zsm_playing + 0)
0af5 : f0 08 __ BEQ $0aff ; (irq.s1001 + 0)
.s4:
0af7 : ad 41 15 LDA $1541 ; (zsm_finished + 0)
0afa : d0 03 __ BNE $0aff ; (irq.s1001 + 0)
.s1:
0afc : 20 2a 0b JSR $0b2a ; (zsm_play.s0 + 0)
.s1001:
0aff : 68 __ __ PLA
0b00 : 85 50 __ STA $50 
0b02 : 68 __ __ PLA
0b03 : 85 4f __ STA $4f 
0b05 : 68 __ __ PLA
0b06 : 85 4e __ STA $4e 
0b08 : 68 __ __ PLA
0b09 : 85 4d __ STA $4d 
0b0b : 68 __ __ PLA
0b0c : 85 4c __ STA $4c 
0b0e : 68 __ __ PLA
0b0f : 85 4b __ STA $4b 
0b11 : 68 __ __ PLA
0b12 : 85 4a __ STA $4a 
0b14 : 68 __ __ PLA
0b15 : 85 49 __ STA $49 
0b17 : 68 __ __ PLA
0b18 : 85 48 __ STA $48 
0b1a : 68 __ __ PLA
0b1b : 85 47 __ STA T0 + 0 
0b1d : 68 __ __ PLA
0b1e : 85 3c __ STA ACCU + 1 
0b20 : 68 __ __ PLA
0b21 : 85 3b __ STA ACCU + 0 
0b23 : 68 __ __ PLA
0b24 : 85 2e __ STA P1 
0b26 : 68 __ __ PLA
0b27 : 85 2d __ STA P0 
0b29 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1540 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1541 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0b2a : ad f1 15 LDA $15f1 ; (zsm_delay + 0)
0b2d : f0 03 __ BEQ $0b32 ; (zsm_play.s2 + 0)
0b2f : 4c 5f 0c JMP $0c5f ; (zsm_play.s1 + 0)
.s2:
0b32 : ad 25 9f LDA $9f25 
0b35 : 85 47 __ STA T0 + 0 
0b37 : ad 25 9f LDA $9f25 
0b3a : 29 fe __ AND #$fe
0b3c : 8d 25 9f STA $9f25 
0b3f : ad 20 9f LDA $9f20 
0b42 : 85 49 __ STA T2 + 0 
0b44 : ad 21 9f LDA $9f21 
0b47 : 85 4a __ STA T2 + 1 
0b49 : ad 22 9f LDA $9f22 
0b4c : 85 48 __ STA T1 + 0 
.l5:
0b4e : ad f2 15 LDA $15f2 ; (zsm_pos + 0)
0b51 : 85 4b __ STA T3 + 0 
0b53 : 18 __ __ CLC
0b54 : 69 01 __ ADC #$01
0b56 : 85 4d __ STA T4 + 0 
0b58 : 8d f2 15 STA $15f2 ; (zsm_pos + 0)
0b5b : ad f3 15 LDA $15f3 ; (zsm_pos + 1)
0b5e : aa __ __ TAX
0b5f : 69 00 __ ADC #$00
0b61 : 85 4e __ STA T4 + 1 
0b63 : 8d f3 15 STA $15f3 ; (zsm_pos + 1)
0b66 : 18 __ __ CLC
0b67 : a9 5b __ LDA #$5b
0b69 : 65 4b __ ADC T3 + 0 
0b6b : 85 3b __ STA ACCU + 0 
0b6d : 8a __ __ TXA
0b6e : 29 03 __ AND #$03
0b70 : 69 26 __ ADC #$26
0b72 : 85 3c __ STA ACCU + 1 
0b74 : a0 00 __ LDY #$00
0b76 : b1 3b __ LDA (ACCU + 0),y 
0b78 : c9 40 __ CMP #$40
0b7a : b0 03 __ BCS $0b7f ; (zsm_play.s9 + 0)
0b7c : 4c 2a 0c JMP $0c2a ; (zsm_play.s8 + 0)
.s9:
0b7f : d0 22 __ BNE $0ba3 ; (zsm_play.s12 + 0)
.s11:
0b81 : 18 __ __ CLC
0b82 : a9 5b __ LDA #$5b
0b84 : 65 4d __ ADC T4 + 0 
0b86 : 85 4b __ STA T3 + 0 
0b88 : a5 4e __ LDA T4 + 1 
0b8a : 29 03 __ AND #$03
0b8c : 69 26 __ ADC #$26
0b8e : 85 4c __ STA T3 + 1 
0b90 : b1 4b __ LDA (T3 + 0),y 
0b92 : 29 3f __ AND #$3f
0b94 : 18 __ __ CLC
0b95 : 65 4d __ ADC T4 + 0 
0b97 : 8d f2 15 STA $15f2 ; (zsm_pos + 0)
0b9a : 98 __ __ TYA
0b9b : 65 4e __ ADC T4 + 1 
0b9d : 8d f3 15 STA $15f3 ; (zsm_pos + 1)
0ba0 : 4c 4e 0b JMP $0b4e ; (zsm_play.l5 + 0)
.s12:
0ba3 : 09 00 __ ORA #$00
0ba5 : 30 5b __ BMI $0c02 ; (zsm_play.s15 + 0)
.s14:
0ba7 : 29 3f __ AND #$3f
0ba9 : f0 a3 __ BEQ $0b4e ; (zsm_play.l5 + 0)
.s26:
0bab : 84 50 __ STY T7 + 0 
0bad : 85 4f __ STA T6 + 0 
0baf : 18 __ __ CLC
.l1012:
0bb0 : a9 5b __ LDA #$5b
0bb2 : 6d f2 15 ADC $15f2 ; (zsm_pos + 0)
0bb5 : 85 4d __ STA T4 + 0 
0bb7 : ad f3 15 LDA $15f3 ; (zsm_pos + 1)
0bba : 29 03 __ AND #$03
0bbc : 69 26 __ ADC #$26
0bbe : 85 4e __ STA T4 + 1 
0bc0 : a0 00 __ LDY #$00
0bc2 : b1 4d __ LDA (T4 + 0),y 
0bc4 : 85 2d __ STA P0 
0bc6 : ad f2 15 LDA $15f2 ; (zsm_pos + 0)
0bc9 : 18 __ __ CLC
0bca : 69 01 __ ADC #$01
0bcc : aa __ __ TAX
0bcd : ad f3 15 LDA $15f3 ; (zsm_pos + 1)
0bd0 : 69 00 __ ADC #$00
0bd2 : 29 03 __ AND #$03
0bd4 : 85 4c __ STA T3 + 1 
0bd6 : 8a __ __ TXA
0bd7 : 18 __ __ CLC
0bd8 : 69 5b __ ADC #$5b
0bda : 85 4b __ STA T3 + 0 
0bdc : a9 26 __ LDA #$26
0bde : 65 4c __ ADC T3 + 1 
0be0 : 85 4c __ STA T3 + 1 
0be2 : b1 4b __ LDA (T3 + 0),y 
0be4 : 85 2e __ STA P1 
0be6 : 20 63 0c JSR $0c63 ; (sfx_put.l1 + 0)
0be9 : ad f2 15 LDA $15f2 ; (zsm_pos + 0)
0bec : 18 __ __ CLC
0bed : 69 02 __ ADC #$02
0bef : 8d f2 15 STA $15f2 ; (zsm_pos + 0)
0bf2 : 90 03 __ BCC $0bf7 ; (zsm_play.s1015 + 0)
.s1014:
0bf4 : ee f3 15 INC $15f3 ; (zsm_pos + 1)
.s1015:
0bf7 : e6 50 __ INC T7 + 0 
0bf9 : a5 50 __ LDA T7 + 0 
0bfb : c5 4f __ CMP T6 + 0 
0bfd : 90 b1 __ BCC $0bb0 ; (zsm_play.l1012 + 0)
0bff : 4c 4e 0b JMP $0b4e ; (zsm_play.l5 + 0)
.s15:
0c02 : c9 80 __ CMP #$80
0c04 : d0 07 __ BNE $0c0d ; (zsm_play.s22 + 0)
.s21:
0c06 : a9 01 __ LDA #$01
0c08 : 8d 41 15 STA $1541 ; (zsm_finished + 0)
0c0b : d0 08 __ BNE $0c15 ; (zsm_play.s7 + 0)
.s22:
0c0d : 29 7f __ AND #$7f
0c0f : 38 __ __ SEC
0c10 : e9 01 __ SBC #$01
0c12 : 8d f1 15 STA $15f1 ; (zsm_delay + 0)
.s7:
0c15 : a5 49 __ LDA T2 + 0 
0c17 : 8d 20 9f STA $9f20 
0c1a : a5 4a __ LDA T2 + 1 
0c1c : 8d 21 9f STA $9f21 
0c1f : a5 48 __ LDA T1 + 0 
0c21 : 8d 22 9f STA $9f22 
0c24 : a5 47 __ LDA T0 + 0 
0c26 : 8d 25 9f STA $9f25 
.s1001:
0c29 : 60 __ __ RTS
.s8:
0c2a : 29 3f __ AND #$3f
0c2c : 09 c0 __ ORA #$c0
0c2e : 8d 20 9f STA $9f20 
0c31 : a9 f9 __ LDA #$f9
0c33 : 8d 21 9f STA $9f21 
0c36 : a9 01 __ LDA #$01
0c38 : 8d 22 9f STA $9f22 
0c3b : a5 4b __ LDA T3 + 0 
0c3d : 69 02 __ ADC #$02
0c3f : 8d f2 15 STA $15f2 ; (zsm_pos + 0)
0c42 : 90 01 __ BCC $0c45 ; (zsm_play.s1017 + 0)
.s1016:
0c44 : e8 __ __ INX
.s1017:
0c45 : 8e f3 15 STX $15f3 ; (zsm_pos + 1)
0c48 : 18 __ __ CLC
0c49 : a9 5b __ LDA #$5b
0c4b : 65 4d __ ADC T4 + 0 
0c4d : 85 4b __ STA T3 + 0 
0c4f : a5 4e __ LDA T4 + 1 
0c51 : 29 03 __ AND #$03
0c53 : 69 26 __ ADC #$26
0c55 : 85 4c __ STA T3 + 1 
0c57 : b1 4b __ LDA (T3 + 0),y 
0c59 : 8d 23 9f STA $9f23 
0c5c : 4c 4e 0b JMP $0b4e ; (zsm_play.l5 + 0)
.s1:
0c5f : ce f1 15 DEC $15f1 ; (zsm_delay + 0)
0c62 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
15f1 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
265b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
15f2 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0c63 : ad 41 9f LDA $9f41 
0c66 : 30 fb __ BMI $0c63 ; (sfx_put.l1 + 0)
.s3:
0c68 : a5 2d __ LDA P0 ; (index + 0)
0c6a : 8d 40 9f STA $9f40 
0c6d : ea __ __ NOP
0c6e : ea __ __ NOP
0c6f : ea __ __ NOP
0c70 : ea __ __ NOP
0c71 : a5 2e __ LDA P1 ; (data + 0)
0c73 : 8d 41 9f STA $9f41 
.s1001:
0c76 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0c77 : a9 93 __ LDA #$93
0c79 : 85 2d __ STA P0 
0c7b : a9 00 __ LDA #$00
0c7d : 85 2e __ STA P1 
0c7f : 20 b4 0c JSR $0cb4 ; (putch.s0 + 0)
0c82 : a9 11 __ LDA #$11
0c84 : 8d 22 9f STA $9f22 
0c87 : a2 00 __ LDX #$00
.l2:
0c89 : 8a __ __ TXA
0c8a : 18 __ __ CLC
0c8b : 69 b0 __ ADC #$b0
0c8d : 8d 21 9f STA $9f21 
0c90 : a9 00 __ LDA #$00
0c92 : 8d 20 9f STA $9f20 
0c95 : a0 80 __ LDY #$80
.l1003:
0c97 : a9 20 __ LDA #$20
0c99 : 8d 23 9f STA $9f23 
0c9c : a9 01 __ LDA #$01
0c9e : 8d 23 9f STA $9f23 
0ca1 : a9 20 __ LDA #$20
0ca3 : 8d 24 9f STA $9f24 
0ca6 : a9 01 __ LDA #$01
0ca8 : 8d 24 9f STA $9f24 
0cab : 88 __ __ DEY
0cac : d0 e9 __ BNE $0c97 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0cae : e8 __ __ INX
0caf : e0 40 __ CPX #$40
0cb1 : 90 d6 __ BCC $0c89 ; (ClearVERAScreen.l2 + 0)
.s1001:
0cb3 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0cb4 : a5 2d __ LDA P0 
0cb6 : 20 d2 ff JSR $ffd2 
.s1001:
0cb9 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0cba : a9 00 __ LDA #$00
0cbc : 85 2d __ STA P0 
0cbe : 85 2e __ STA P1 
0cc0 : 85 2f __ STA P2 
0cc2 : 85 30 __ STA P3 
0cc4 : 85 31 __ STA P4 
0cc6 : 8d 25 9f STA $9f25 
0cc9 : ad 29 9f LDA $9f29 
0ccc : 09 70 __ ORA #$70
0cce : 8d 29 9f STA $9f29 
0cd1 : a9 80 __ LDA #$80
0cd3 : 8d 2b 9f STA $9f2b 
0cd6 : 8d 2a 9f STA $9f2a 
0cd9 : a9 62 __ LDA #$62
0cdb : 8d 2d 9f STA $9f2d 
0cde : a9 68 __ LDA #$68
0ce0 : 8d 34 9f STA $9f34 
0ce3 : 20 44 11 JSR $1144 ; (tileBaseConfig.s0 + 0)
0ce6 : 8d 2f 9f STA $9f2f 
0ce9 : a9 20 __ LDA #$20
0ceb : 85 2f __ STA P2 
0ced : 20 5d 11 JSR $115d ; (memoryToMapMemoryAddress.s0 + 0)
0cf0 : 8d 2e 9f STA $9f2e 
0cf3 : a9 21 __ LDA #$21
0cf5 : 8d 22 9f STA $9f22 
0cf8 : a2 80 __ LDX #$80
.l6:
0cfa : a0 50 __ LDY #$50
.l1023:
0cfc : a9 00 __ LDA #$00
0cfe : 8d 24 9f STA $9f24 
0d01 : a9 08 __ LDA #$08
0d03 : 8d 24 9f STA $9f24 
0d06 : 88 __ __ DEY
0d07 : d0 f3 __ BNE $0cfc ; (SetUpSprites.l1023 + 0)
.s1024:
0d09 : ca __ __ DEX
0d0a : d0 ee __ BNE $0cfa ; (SetUpSprites.l6 + 0)
.s4:
0d0c : a9 00 __ LDA #$00
0d0e : 85 2d __ STA P0 
0d10 : 85 2e __ STA P1 
0d12 : 85 2f __ STA P2 
0d14 : 85 30 __ STA P3 
0d16 : 85 33 __ STA P6 
0d18 : a9 01 __ LDA #$01
0d1a : 85 34 __ STA P7 
0d1c : a9 00 __ LDA #$00
0d1e : 85 31 __ STA P4 
0d20 : a9 16 __ LDA #$16
0d22 : 85 32 __ STA P5 
0d24 : 20 6b 11 JSR $116b ; (vram_putn.s0 + 0)
0d27 : a9 10 __ LDA #$10
0d29 : 8d 22 9f STA $9f22 
0d2c : a9 00 __ LDA #$00
0d2e : 8d 20 9f STA $9f20 
0d31 : a9 20 __ LDA #$20
0d33 : 8d 21 9f STA $9f21 
0d36 : a9 3c __ LDA #$3c
0d38 : 85 47 __ STA T1 + 0 
.l10:
0d3a : a9 00 __ LDA #$00
0d3c : 85 48 __ STA T2 + 0 
.l14:
0d3e : 20 a6 11 JSR $11a6 ; (rand.s0 + 0)
0d41 : a5 3b __ LDA ACCU + 0 
0d43 : 29 1f __ AND #$1f
0d45 : c9 1f __ CMP #$1f
0d47 : a5 48 __ LDA T2 + 0 
0d49 : 90 03 __ BCC $0d4e ; (SetUpSprites.s1021 + 0)
0d4b : 4c 0e 11 JMP $110e ; (SetUpSprites.s1015 + 0)
.s1021:
0d4e : c9 09 __ CMP #$09
0d50 : 90 06 __ BCC $0d58 ; (SetUpSprites.s20 + 0)
.s1020:
0d52 : a9 45 __ LDA #$45
0d54 : c5 48 __ CMP T2 + 0 
0d56 : b0 04 __ BCS $0d5c ; (SetUpSprites.s1019 + 0)
.s20:
0d58 : a9 00 __ LDA #$00
0d5a : f0 2f __ BEQ $0d8b ; (SetUpSprites.s135 + 0)
.s1019:
0d5c : a5 48 __ LDA T2 + 0 
0d5e : c9 13 __ CMP #$13
0d60 : 90 06 __ BCC $0d68 ; (SetUpSprites.s24 + 0)
.s1018:
0d62 : a9 3b __ LDA #$3b
0d64 : c5 48 __ CMP T2 + 0 
0d66 : b0 04 __ BCS $0d6c ; (SetUpSprites.s1017 + 0)
.s24:
0d68 : a9 01 __ LDA #$01
0d6a : d0 12 __ BNE $0d7e ; (SetUpSprites.s142 + 0)
.s1017:
0d6c : a5 48 __ LDA T2 + 0 
0d6e : c9 1d __ CMP #$1d
0d70 : 90 06 __ BCC $0d78 ; (SetUpSprites.s28 + 0)
.s1016:
0d72 : a9 31 __ LDA #$31
0d74 : c5 48 __ CMP T2 + 0 
0d76 : b0 04 __ BCS $0d7c ; (SetUpSprites.s29 + 0)
.s28:
0d78 : a9 02 __ LDA #$02
0d7a : d0 02 __ BNE $0d7e ; (SetUpSprites.s142 + 0)
.s29:
0d7c : a9 03 __ LDA #$03
.s142:
0d7e : 8d 23 9f STA $9f23 
0d81 : a9 00 __ LDA #$00
0d83 : 8d 23 9f STA $9f23 
0d86 : e6 48 __ INC T2 + 0 
0d88 : 4c 3e 0d JMP $0d3e ; (SetUpSprites.l14 + 0)
.s135:
0d8b : 8d 23 9f STA $9f23 
0d8e : a9 00 __ LDA #$00
0d90 : 8d 23 9f STA $9f23 
0d93 : e6 48 __ INC T2 + 0 
0d95 : 10 a7 __ BPL $0d3e ; (SetUpSprites.l14 + 0)
.s11:
0d97 : c6 47 __ DEC T1 + 0 
0d99 : d0 9f __ BNE $0d3a ; (SetUpSprites.l10 + 0)
.s12:
0d9b : a9 20 __ LDA #$20
0d9d : 85 37 __ STA P10 
0d9f : a9 00 __ LDA #$00
0da1 : 8d fc 9e STA $9efc ; (sstack + 0)
0da4 : 8d ff 9e STA $9eff ; (sstack + 3)
0da7 : a9 fa __ LDA #$fa
0da9 : 8d fd 9e STA $9efd ; (sstack + 1)
0dac : a9 01 __ LDA #$01
0dae : 8d fe 9e STA $9efe ; (sstack + 2)
0db1 : a9 44 __ LDA #$44
0db3 : 85 35 __ STA P8 
0db5 : a9 15 __ LDA #$15
0db7 : 85 36 __ STA P9 
0db9 : 20 cd 11 JSR $11cd ; (SetPaletteColours.s0 + 0)
0dbc : a9 00 __ LDA #$00
0dbe : 85 2d __ STA P0 
0dc0 : 85 30 __ STA P3 
0dc2 : 85 33 __ STA P6 
0dc4 : a9 31 __ LDA #$31
0dc6 : 85 2e __ STA P1 
0dc8 : a9 01 __ LDA #$01
0dca : 85 2f __ STA P2 
0dcc : a9 02 __ LDA #$02
0dce : 85 34 __ STA P7 
0dd0 : a9 00 __ LDA #$00
0dd2 : 85 31 __ STA P4 
0dd4 : a9 17 __ LDA #$17
0dd6 : 85 32 __ STA P5 
0dd8 : 20 6b 11 JSR $116b ; (vram_putn.s0 + 0)
0ddb : a9 30 __ LDA #$30
0ddd : 85 2e __ STA P1 
0ddf : a9 01 __ LDA #$01
0de1 : 85 34 __ STA P7 
0de3 : a9 00 __ LDA #$00
0de5 : 85 31 __ STA P4 
0de7 : a9 19 __ LDA #$19
0de9 : 85 32 __ STA P5 
0deb : 20 6b 11 JSR $116b ; (vram_putn.s0 + 0)
0dee : a9 16 __ LDA #$16
0df0 : 85 2d __ STA P0 
0df2 : a9 80 __ LDA #$80
0df4 : 85 2e __ STA P1 
0df6 : a9 09 __ LDA #$09
0df8 : 85 2f __ STA P2 
0dfa : a9 01 __ LDA #$01
0dfc : 85 31 __ STA P4 
0dfe : 85 34 __ STA P7 
0e00 : a9 02 __ LDA #$02
0e02 : 85 32 __ STA P5 
0e04 : a9 03 __ LDA #$03
0e06 : 85 33 __ STA P6 
0e08 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
0e0b : a9 30 __ LDA #$30
0e0d : 85 2e __ STA P1 
0e0f : a9 01 __ LDA #$01
0e11 : 85 2f __ STA P2 
0e13 : a9 b8 __ LDA #$b8
0e15 : 85 30 __ STA P3 
0e17 : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
0e1a : a9 00 __ LDA #$00
0e1c : 85 4c __ STA T5 + 0 
0e1e : 85 4d __ STA T5 + 1 
.l45:
0e20 : 85 2d __ STA P0 
0e22 : 18 __ __ CLC
0e23 : 69 02 __ ADC #$02
0e25 : 85 4a __ STA T4 + 0 
0e27 : a9 00 __ LDA #$00
0e29 : 2a __ __ ROL
0e2a : 85 4b __ STA T4 + 1 
0e2c : a9 88 __ LDA #$88
0e2e : 85 2e __ STA P1 
0e30 : a9 09 __ LDA #$09
0e32 : 85 2f __ STA P2 
0e34 : a9 00 __ LDA #$00
0e36 : 85 30 __ STA P3 
0e38 : a9 03 __ LDA #$03
0e3a : 85 31 __ STA P4 
0e3c : a9 01 __ LDA #$01
0e3e : 85 32 __ STA P5 
0e40 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
0e43 : a5 4c __ LDA T5 + 0 
0e45 : 85 2e __ STA P1 
0e47 : a5 4d __ LDA T5 + 1 
0e49 : 85 2f __ STA P2 
0e4b : a9 a0 __ LDA #$a0
0e4d : 85 30 __ STA P3 
0e4f : a9 01 __ LDA #$01
0e51 : 85 31 __ STA P4 
0e53 : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
0e56 : a9 88 __ LDA #$88
0e58 : 85 2e __ STA P1 
0e5a : a9 09 __ LDA #$09
0e5c : 85 2f __ STA P2 
0e5e : a9 00 __ LDA #$00
0e60 : 85 30 __ STA P3 
0e62 : a9 03 __ LDA #$03
0e64 : 85 31 __ STA P4 
0e66 : e6 2d __ INC P0 
0e68 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
0e6b : a5 4c __ LDA T5 + 0 
0e6d : 85 2e __ STA P1 
0e6f : a5 4d __ LDA T5 + 1 
0e71 : 85 2f __ STA P2 
0e73 : a9 70 __ LDA #$70
0e75 : 85 30 __ STA P3 
0e77 : a9 01 __ LDA #$01
0e79 : 85 31 __ STA P4 
0e7b : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
0e7e : a5 4b __ LDA T4 + 1 
0e80 : d0 13 __ BNE $0e95 ; (SetUpSprites.s47 + 0)
.s1011:
0e82 : 18 __ __ CLC
0e83 : a5 2e __ LDA P1 
0e85 : 69 40 __ ADC #$40
0e87 : 85 4c __ STA T5 + 0 
0e89 : a5 2f __ LDA P2 
0e8b : 69 00 __ ADC #$00
0e8d : 85 4d __ STA T5 + 1 
0e8f : a5 4a __ LDA T4 + 0 
0e91 : c9 16 __ CMP #$16
0e93 : 90 8b __ BCC $0e20 ; (SetUpSprites.l45 + 0)
.s47:
0e95 : a9 20 __ LDA #$20
0e97 : 85 2d __ STA P0 
0e99 : a9 33 __ LDA #$33
0e9b : 85 2e __ STA P1 
0e9d : a9 01 __ LDA #$01
0e9f : 85 2f __ STA P2 
0ea1 : a9 00 __ LDA #$00
0ea3 : 85 30 __ STA P3 
0ea5 : 85 33 __ STA P6 
0ea7 : a9 02 __ LDA #$02
0ea9 : 85 34 __ STA P7 
0eab : a9 00 __ LDA #$00
0ead : 85 31 __ STA P4 
0eaf : a9 1a __ LDA #$1a
0eb1 : 85 32 __ STA P5 
0eb3 : 20 6b 11 JSR $116b ; (vram_putn.s0 + 0)
0eb6 : a9 17 __ LDA #$17
0eb8 : 85 2d __ STA P0 
0eba : a9 99 __ LDA #$99
0ebc : 85 2e __ STA P1 
0ebe : a9 09 __ LDA #$09
0ec0 : 85 2f __ STA P2 
0ec2 : a9 02 __ LDA #$02
0ec4 : 85 31 __ STA P4 
0ec6 : 85 32 __ STA P5 
0ec8 : a9 03 __ LDA #$03
0eca : 85 33 __ STA P6 
0ecc : a9 01 __ LDA #$01
0ece : 85 34 __ STA P7 
0ed0 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
0ed3 : a9 fc __ LDA #$fc
0ed5 : 85 2e __ STA P1 
0ed7 : a9 00 __ LDA #$00
0ed9 : 85 2f __ STA P2 
0edb : a9 b8 __ LDA #$b8
0edd : 85 30 __ STA P3 
0edf : a9 01 __ LDA #$01
0ee1 : 85 31 __ STA P4 
0ee3 : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
0ee6 : a9 18 __ LDA #$18
0ee8 : 85 2d __ STA P0 
0eea : a9 99 __ LDA #$99
0eec : 85 2e __ STA P1 
0eee : a9 09 __ LDA #$09
0ef0 : 85 2f __ STA P2 
0ef2 : a9 00 __ LDA #$00
0ef4 : 85 30 __ STA P3 
0ef6 : a9 02 __ LDA #$02
0ef8 : 85 31 __ STA P4 
0efa : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
0efd : a9 4c __ LDA #$4c
0eff : 85 2e __ STA P1 
0f01 : a9 01 __ LDA #$01
0f03 : 85 2f __ STA P2 
0f05 : 85 31 __ STA P4 
0f07 : a9 b8 __ LDA #$b8
0f09 : 85 30 __ STA P3 
0f0b : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
0f0e : a9 20 __ LDA #$20
0f10 : 85 37 __ STA P10 
0f12 : 8d fc 9e STA $9efc ; (sstack + 0)
0f15 : a9 fa __ LDA #$fa
0f17 : 8d fd 9e STA $9efd ; (sstack + 1)
0f1a : a9 01 __ LDA #$01
0f1c : 8d fe 9e STA $9efe ; (sstack + 2)
0f1f : a9 00 __ LDA #$00
0f21 : 8d ff 9e STA $9eff ; (sstack + 3)
0f24 : a9 64 __ LDA #$64
0f26 : 85 35 __ STA P8 
0f28 : a9 15 __ LDA #$15
0f2a : 85 36 __ STA P9 
0f2c : 20 cd 11 JSR $11cd ; (SetPaletteColours.s0 + 0)
0f2f : a9 00 __ LDA #$00
0f31 : 85 2d __ STA P0 
0f33 : 85 30 __ STA P3 
0f35 : 85 34 __ STA P7 
0f37 : a9 33 __ LDA #$33
0f39 : 85 2e __ STA P1 
0f3b : a9 01 __ LDA #$01
0f3d : 85 2f __ STA P2 
0f3f : a9 20 __ LDA #$20
0f41 : 85 33 __ STA P6 
0f43 : a9 84 __ LDA #$84
0f45 : 85 31 __ STA P4 
0f47 : a9 15 __ LDA #$15
0f49 : 85 32 __ STA P5 
0f4b : 20 6b 11 JSR $116b ; (vram_putn.s0 + 0)
0f4e : a9 00 __ LDA #$00
0f50 : 85 47 __ STA T1 + 0 
0f52 : 85 49 __ STA T2 + 1 
0f54 : a9 04 __ LDA #$04
0f56 : 85 48 __ STA T2 + 0 
0f58 : a9 03 __ LDA #$03
0f5a : 85 33 __ STA P6 
0f5c : a9 02 __ LDA #$02
0f5e : 85 34 __ STA P7 
0f60 : 18 __ __ CLC
.l1033:
0f61 : a9 98 __ LDA #$98
0f63 : 85 2e __ STA P1 
0f65 : a9 09 __ LDA #$09
0f67 : 85 2f __ STA P2 
0f69 : a9 00 __ LDA #$00
0f6b : 85 30 __ STA P3 
0f6d : 85 31 __ STA P4 
0f6f : 85 32 __ STA P5 
0f71 : a5 47 __ LDA T1 + 0 
0f73 : 69 19 __ ADC #$19
0f75 : 85 2d __ STA P0 
0f77 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
0f7a : a5 48 __ LDA T2 + 0 
0f7c : 85 2e __ STA P1 
0f7e : a5 49 __ LDA T2 + 1 
0f80 : 85 2f __ STA P2 
0f82 : a9 b8 __ LDA #$b8
0f84 : 85 30 __ STA P3 
0f86 : a9 01 __ LDA #$01
0f88 : 85 31 __ STA P4 
0f8a : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
0f8d : 18 __ __ CLC
0f8e : a5 2e __ LDA P1 
0f90 : 69 0c __ ADC #$0c
0f92 : 85 48 __ STA T2 + 0 
0f94 : a5 2f __ LDA P2 
0f96 : 69 00 __ ADC #$00
0f98 : 85 49 __ STA T2 + 1 
0f9a : e6 47 __ INC T1 + 0 
0f9c : a5 47 __ LDA T1 + 0 
0f9e : c9 08 __ CMP #$08
0fa0 : 90 bf __ BCC $0f61 ; (SetUpSprites.l1033 + 0)
.s51:
0fa2 : a9 00 __ LDA #$00
0fa4 : 85 47 __ STA T1 + 0 
0fa6 : 85 49 __ STA T2 + 1 
0fa8 : a9 04 __ LDA #$04
0faa : 85 48 __ STA T2 + 0 
0fac : a9 03 __ LDA #$03
0fae : 85 33 __ STA P6 
0fb0 : 85 34 __ STA P7 
0fb2 : 18 __ __ CLC
.l1035:
0fb3 : a9 98 __ LDA #$98
0fb5 : 85 2e __ STA P1 
0fb7 : a9 09 __ LDA #$09
0fb9 : 85 2f __ STA P2 
0fbb : a9 00 __ LDA #$00
0fbd : 85 30 __ STA P3 
0fbf : 85 31 __ STA P4 
0fc1 : a5 47 __ LDA T1 + 0 
0fc3 : 69 21 __ ADC #$21
0fc5 : 85 2d __ STA P0 
0fc7 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
0fca : a5 48 __ LDA T2 + 0 
0fcc : 85 2e __ STA P1 
0fce : a5 49 __ LDA T2 + 1 
0fd0 : 85 2f __ STA P2 
0fd2 : a9 c4 __ LDA #$c4
0fd4 : 85 30 __ STA P3 
0fd6 : a9 01 __ LDA #$01
0fd8 : 85 31 __ STA P4 
0fda : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
0fdd : 18 __ __ CLC
0fde : a5 2e __ LDA P1 
0fe0 : 69 0c __ ADC #$0c
0fe2 : 85 48 __ STA T2 + 0 
0fe4 : a5 2f __ LDA P2 
0fe6 : 69 00 __ ADC #$00
0fe8 : 85 49 __ STA T2 + 1 
0fea : e6 47 __ INC T1 + 0 
0fec : a5 47 __ LDA T1 + 0 
0fee : c9 08 __ CMP #$08
0ff0 : 90 c1 __ BCC $0fb3 ; (SetUpSprites.l1035 + 0)
.s55:
0ff2 : a9 00 __ LDA #$00
0ff4 : 85 47 __ STA T1 + 0 
0ff6 : 85 48 __ STA T2 + 0 
0ff8 : a9 03 __ LDA #$03
0ffa : 85 33 __ STA P6 
0ffc : a9 04 __ LDA #$04
0ffe : 85 34 __ STA P7 
1000 : 18 __ __ CLC
.l1037:
1001 : a9 98 __ LDA #$98
1003 : 85 2e __ STA P1 
1005 : a9 09 __ LDA #$09
1007 : 85 2f __ STA P2 
1009 : a9 00 __ LDA #$00
100b : 85 30 __ STA P3 
100d : 85 31 __ STA P4 
100f : a5 47 __ LDA T1 + 0 
1011 : 69 29 __ ADC #$29
1013 : 85 2d __ STA P0 
1015 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
1018 : a9 b8 __ LDA #$b8
101a : 85 30 __ STA P3 
101c : a9 01 __ LDA #$01
101e : 85 31 __ STA P4 
1020 : 38 __ __ SEC
1021 : a9 6c __ LDA #$6c
1023 : e5 48 __ SBC T2 + 0 
1025 : 85 2e __ STA P1 
1027 : a9 02 __ LDA #$02
1029 : e9 00 __ SBC #$00
102b : 85 2f __ STA P2 
102d : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
1030 : 18 __ __ CLC
1031 : a5 48 __ LDA T2 + 0 
1033 : 69 0c __ ADC #$0c
1035 : 85 48 __ STA T2 + 0 
1037 : e6 47 __ INC T1 + 0 
1039 : a5 47 __ LDA T1 + 0 
103b : c9 08 __ CMP #$08
103d : 90 c2 __ BCC $1001 ; (SetUpSprites.l1037 + 0)
.s59:
103f : a9 10 __ LDA #$10
1041 : 85 2d __ STA P0 
1043 : a9 35 __ LDA #$35
1045 : 85 2e __ STA P1 
1047 : a9 01 __ LDA #$01
1049 : 85 2f __ STA P2 
104b : a9 00 __ LDA #$00
104d : 85 30 __ STA P3 
104f : 85 33 __ STA P6 
1051 : a9 08 __ LDA #$08
1053 : 85 34 __ STA P7 
1055 : a9 00 __ LDA #$00
1057 : 85 31 __ STA P4 
1059 : a9 1c __ LDA #$1c
105b : 85 32 __ STA P5 
105d : 20 6b 11 JSR $116b ; (vram_putn.s0 + 0)
1060 : a9 31 __ LDA #$31
1062 : 85 2d __ STA P0 
1064 : a9 a8 __ LDA #$a8
1066 : 85 2e __ STA P1 
1068 : a9 09 __ LDA #$09
106a : 85 2f __ STA P2 
106c : a9 03 __ LDA #$03
106e : 85 31 __ STA P4 
1070 : 85 32 __ STA P5 
1072 : 85 33 __ STA P6 
1074 : a9 05 __ LDA #$05
1076 : 85 34 __ STA P7 
1078 : 20 f4 11 JSR $11f4 ; (vera_spr_set.s0 + 0)
107b : a9 20 __ LDA #$20
107d : 85 2e __ STA P1 
107f : a9 01 __ LDA #$01
1081 : 85 2f __ STA P2 
1083 : a9 d0 __ LDA #$d0
1085 : 85 30 __ STA P3 
1087 : a9 00 __ LDA #$00
1089 : 85 31 __ STA P4 
108b : 20 51 12 JSR $1251 ; (vera_spr_move.s0 + 0)
108e : a9 20 __ LDA #$20
1090 : 85 37 __ STA P10 
1092 : a9 40 __ LDA #$40
1094 : 8d fc 9e STA $9efc ; (sstack + 0)
1097 : a9 fa __ LDA #$fa
1099 : 8d fd 9e STA $9efd ; (sstack + 1)
109c : a9 01 __ LDA #$01
109e : 8d fe 9e STA $9efe ; (sstack + 2)
10a1 : a9 00 __ LDA #$00
10a3 : 8d ff 9e STA $9eff ; (sstack + 3)
10a6 : a9 a4 __ LDA #$a4
10a8 : 85 35 __ STA P8 
10aa : a9 15 __ LDA #$15
10ac : 85 36 __ STA P9 
10ae : 20 cd 11 JSR $11cd ; (SetPaletteColours.s0 + 0)
10b1 : a9 60 __ LDA #$60
10b3 : 8d fc 9e STA $9efc ; (sstack + 0)
10b6 : a9 fa __ LDA #$fa
10b8 : 8d fd 9e STA $9efd ; (sstack + 1)
10bb : a9 01 __ LDA #$01
10bd : 8d fe 9e STA $9efe ; (sstack + 2)
10c0 : a9 00 __ LDA #$00
10c2 : 8d ff 9e STA $9eff ; (sstack + 3)
10c5 : a9 c4 __ LDA #$c4
10c7 : 85 35 __ STA P8 
10c9 : a9 15 __ LDA #$15
10cb : 85 36 __ STA P9 
10cd : 20 cd 11 JSR $11cd ; (SetPaletteColours.s0 + 0)
10d0 : a9 80 __ LDA #$80
10d2 : 8d fc 9e STA $9efc ; (sstack + 0)
10d5 : a9 fa __ LDA #$fa
10d7 : 8d fd 9e STA $9efd ; (sstack + 1)
10da : a9 01 __ LDA #$01
10dc : 8d fe 9e STA $9efe ; (sstack + 2)
10df : a9 00 __ LDA #$00
10e1 : 8d ff 9e STA $9eff ; (sstack + 3)
10e4 : a9 00 __ LDA #$00
10e6 : 85 35 __ STA P8 
10e8 : a9 24 __ LDA #$24
10ea : 85 36 __ STA P9 
10ec : 20 cd 11 JSR $11cd ; (SetPaletteColours.s0 + 0)
10ef : a9 a0 __ LDA #$a0
10f1 : 8d fc 9e STA $9efc ; (sstack + 0)
10f4 : a9 fa __ LDA #$fa
10f6 : 8d fd 9e STA $9efd ; (sstack + 1)
10f9 : a9 01 __ LDA #$01
10fb : 8d fe 9e STA $9efe ; (sstack + 2)
10fe : a9 00 __ LDA #$00
1100 : 8d ff 9e STA $9eff ; (sstack + 3)
1103 : a9 20 __ LDA #$20
1105 : 85 35 __ STA P8 
1107 : a9 24 __ LDA #$24
1109 : 85 36 __ STA P9 
110b : 4c cd 11 JMP $11cd ; (SetPaletteColours.s0 + 0)
.s1015:
110e : c9 09 __ CMP #$09
1110 : 90 06 __ BCC $1118 ; (SetUpSprites.s32 + 0)
.s1014:
1112 : a9 45 __ LDA #$45
1114 : c5 48 __ CMP T2 + 0 
1116 : b0 05 __ BCS $111d ; (SetUpSprites.s1005 + 0)
.s32:
1118 : a9 04 __ LDA #$04
111a : 4c 8b 0d JMP $0d8b ; (SetUpSprites.s135 + 0)
.s1005:
111d : a5 48 __ LDA T2 + 0 
111f : c9 13 __ CMP #$13
1121 : 90 06 __ BCC $1129 ; (SetUpSprites.s36 + 0)
.s1004:
1123 : a9 3b __ LDA #$3b
1125 : c5 48 __ CMP T2 + 0 
1127 : b0 05 __ BCS $112e ; (SetUpSprites.s1003 + 0)
.s36:
1129 : a9 05 __ LDA #$05
112b : 4c 7e 0d JMP $0d7e ; (SetUpSprites.s142 + 0)
.s1003:
112e : a5 48 __ LDA T2 + 0 
1130 : c9 1d __ CMP #$1d
1132 : 90 06 __ BCC $113a ; (SetUpSprites.s40 + 0)
.s1002:
1134 : a9 31 __ LDA #$31
1136 : c5 48 __ CMP T2 + 0 
1138 : b0 05 __ BCS $113f ; (SetUpSprites.s41 + 0)
.s40:
113a : a9 06 __ LDA #$06
113c : 4c 7e 0d JMP $0d7e ; (SetUpSprites.s142 + 0)
.s41:
113f : a9 07 __ LDA #$07
1141 : 4c 7e 0d JMP $0d7e ; (SetUpSprites.s142 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1144 : a5 2d __ LDA P0 ; (bank + 0)
1146 : 4a __ __ LSR
1147 : a9 00 __ LDA #$00
1149 : 6a __ __ ROR
114a : 85 3b __ STA ACCU + 0 
114c : a5 2f __ LDA P2 ; (mem + 1)
114e : 29 f8 __ AND #$f8
1150 : 4a __ __ LSR
1151 : 05 3b __ ORA ACCU + 0 
1153 : 85 3b __ STA ACCU + 0 
1155 : a5 30 __ LDA P3 ; (height + 0)
1157 : 0a __ __ ASL
1158 : 05 3b __ ORA ACCU + 0 
115a : 05 31 __ ORA P4 ; (width + 0)
.s1001:
115c : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
115d : a5 2d __ LDA P0 ; (bank + 0)
115f : 4a __ __ LSR
1160 : a9 00 __ LDA #$00
1162 : 6a __ __ ROR
1163 : 85 3b __ STA ACCU + 0 
1165 : a5 2f __ LDA P2 ; (mem + 1)
1167 : 4a __ __ LSR
1168 : 05 3b __ ORA ACCU + 0 
.s1001:
116a : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
116b : ad 25 9f LDA $9f25 
116e : 29 fe __ AND #$fe
1170 : 8d 25 9f STA $9f25 
1173 : a5 2d __ LDA P0 ; (addr + 0)
1175 : 8d 20 9f STA $9f20 
1178 : a5 2e __ LDA P1 ; (addr + 1)
117a : 8d 21 9f STA $9f21 
117d : a5 2f __ LDA P2 ; (addr + 2)
117f : 29 01 __ AND #$01
1181 : 09 10 __ ORA #$10
1183 : 8d 22 9f STA $9f22 
1186 : a5 33 __ LDA P6 ; (size + 0)
1188 : 05 34 __ ORA P7 ; (size + 1)
118a : f0 19 __ BEQ $11a5 ; (vram_putn.s1001 + 0)
.s6:
118c : a0 00 __ LDY #$00
118e : a6 33 __ LDX P6 ; (size + 0)
1190 : f0 02 __ BEQ $1194 ; (vram_putn.l1002 + 0)
.s1005:
1192 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1194 : b1 31 __ LDA (P4),y ; (data + 0)
1196 : 8d 23 9f STA $9f23 
1199 : c8 __ __ INY
119a : d0 02 __ BNE $119e ; (vram_putn.s1009 + 0)
.s1008:
119c : e6 32 __ INC P5 ; (data + 1)
.s1009:
119e : ca __ __ DEX
119f : d0 f3 __ BNE $1194 ; (vram_putn.l1002 + 0)
.s1004:
11a1 : c6 34 __ DEC P7 ; (size + 1)
11a3 : d0 ef __ BNE $1194 ; (vram_putn.l1002 + 0)
.s1001:
11a5 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1600 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1620 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1630 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1640 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1650 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1660 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1670 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1680 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1690 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
16a0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
16b0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
16c0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
16d0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
16e0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
16f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
11a6 : ad 43 15 LDA $1543 ; (seed + 1)
11a9 : 4a __ __ LSR
11aa : ad 42 15 LDA $1542 ; (seed + 0)
11ad : 6a __ __ ROR
11ae : aa __ __ TAX
11af : a9 00 __ LDA #$00
11b1 : 6a __ __ ROR
11b2 : 4d 42 15 EOR $1542 ; (seed + 0)
11b5 : 85 3b __ STA ACCU + 0 
11b7 : 8a __ __ TXA
11b8 : 4d 43 15 EOR $1543 ; (seed + 1)
11bb : 85 3c __ STA ACCU + 1 
11bd : 4a __ __ LSR
11be : 45 3b __ EOR ACCU + 0 
11c0 : 8d 42 15 STA $1542 ; (seed + 0)
11c3 : 85 3b __ STA ACCU + 0 
11c5 : 45 3c __ EOR ACCU + 1 
11c7 : 8d 43 15 STA $1543 ; (seed + 1)
11ca : 85 3c __ STA ACCU + 1 
.s1001:
11cc : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1542 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
SetPaletteColours:
.s0:
11cd : ad fc 9e LDA $9efc ; (sstack + 0)
11d0 : 85 2d __ STA P0 
11d2 : ad fd 9e LDA $9efd ; (sstack + 1)
11d5 : 85 2e __ STA P1 
11d7 : ad fe 9e LDA $9efe ; (sstack + 2)
11da : 85 2f __ STA P2 
11dc : ad ff 9e LDA $9eff ; (sstack + 3)
11df : 85 30 __ STA P3 
11e1 : a5 35 __ LDA P8 ; (input + 0)
11e3 : 85 31 __ STA P4 
11e5 : a5 36 __ LDA P9 ; (input + 1)
11e7 : 85 32 __ STA P5 
11e9 : a5 37 __ LDA P10 ; (inputsize + 0)
11eb : 85 33 __ STA P6 
11ed : a9 00 __ LDA #$00
11ef : 85 34 __ STA P7 
11f1 : 4c 6b 11 JMP $116b ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
1544 : __ __ __ BYT 23 02 12 01 01 11 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
1554 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ScrollerOutline:
1700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1730 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1740 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1750 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1760 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1770 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1780 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1790 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
17a0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
17b0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
17c0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
17d0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
17e0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
17f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1800 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1810 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1820 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1830 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1840 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1850 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1860 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1870 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1880 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1890 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
18a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
18b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
18c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
18d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
18e0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
18f0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
1900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1910 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
1920 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1930 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1940 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1950 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1960 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1970 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1980 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1990 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
19a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
19b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
19c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
19d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
19e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
19f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_set:
.s0:
11f4 : ad 25 9f LDA $9f25 
11f7 : 29 fe __ AND #$fe
11f9 : 8d 25 9f STA $9f25 
11fc : a5 2d __ LDA P0 ; (spr + 0)
11fe : 0a __ __ ASL
11ff : 0a __ __ ASL
1200 : 85 3b __ STA ACCU + 0 
1202 : a9 3f __ LDA #$3f
1204 : 2a __ __ ROL
1205 : 06 3b __ ASL ACCU + 0 
1207 : 2a __ __ ROL
1208 : 8d 21 9f STA $9f21 
120b : a5 3b __ LDA ACCU + 0 
120d : 8d 20 9f STA $9f20 
1210 : a9 11 __ LDA #$11
1212 : 8d 22 9f STA $9f22 
1215 : a5 30 __ LDA P3 ; (mode8 + 0)
1217 : f0 02 __ BEQ $121b ; (vera_spr_set.s11 + 0)
.s9:
1219 : a9 80 __ LDA #$80
.s11:
121b : 05 2f __ ORA P2 ; (addr32 + 1)
121d : a6 2e __ LDX P1 ; (addr32 + 0)
121f : 8e 23 9f STX $9f23 
1222 : 8d 23 9f STA $9f23 
1225 : a9 00 __ LDA #$00
1227 : 8d 23 9f STA $9f23 
122a : 8d 23 9f STA $9f23 
122d : 8d 23 9f STA $9f23 
1230 : 8d 23 9f STA $9f23 
1233 : a5 33 __ LDA P6 ; (z + 0)
1235 : 0a __ __ ASL
1236 : 0a __ __ ASL
1237 : 8d 23 9f STA $9f23 
123a : a5 32 __ LDA P5 ; (h + 0)
123c : 4a __ __ LSR
123d : 6a __ __ ROR
123e : 29 80 __ AND #$80
1240 : 6a __ __ ROR
1241 : 85 3b __ STA ACCU + 0 
1243 : a5 31 __ LDA P4 ; (w + 0)
1245 : 0a __ __ ASL
1246 : 0a __ __ ASL
1247 : 0a __ __ ASL
1248 : 0a __ __ ASL
1249 : 05 3b __ ORA ACCU + 0 
124b : 05 34 __ ORA P7 ; (pal + 0)
124d : 8d 23 9f STA $9f23 
.s1001:
1250 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1251 : ad 25 9f LDA $9f25 
1254 : 29 fe __ AND #$fe
1256 : 8d 25 9f STA $9f25 
1259 : a5 2d __ LDA P0 ; (spr + 0)
125b : 0a __ __ ASL
125c : 0a __ __ ASL
125d : 85 3b __ STA ACCU + 0 
125f : a9 3f __ LDA #$3f
1261 : 2a __ __ ROL
1262 : 06 3b __ ASL ACCU + 0 
1264 : 2a __ __ ROL
1265 : aa __ __ TAX
1266 : a5 3b __ LDA ACCU + 0 
1268 : 09 02 __ ORA #$02
126a : 8d 20 9f STA $9f20 
126d : 8e 21 9f STX $9f21 
1270 : a9 11 __ LDA #$11
1272 : 8d 22 9f STA $9f22 
1275 : a5 2e __ LDA P1 ; (x + 0)
1277 : 8d 23 9f STA $9f23 
127a : a5 2f __ LDA P2 ; (x + 1)
127c : 8d 23 9f STA $9f23 
127f : a5 30 __ LDA P3 ; (y + 0)
1281 : 8d 23 9f STA $9f23 
1284 : a5 31 __ LDA P4 ; (y + 1)
1286 : 8d 23 9f STA $9f23 
.s1001:
1289 : 60 __ __ RTS
--------------------------------------------------------------------
Arrow:
1a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
1a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
1a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
1a30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
1a40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
1a50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
1a60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
1a70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
1a80 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
1a90 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
1aa0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
1ab0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
1ac0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
1ad0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
1ae0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
1af0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
1b00 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
1b10 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
1b20 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
1b30 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
1b40 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
1b50 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
1b60 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
1b70 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
1b80 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
1b90 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
1ba0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
1bb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
1bc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
1bd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
1be0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
1bf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
palette:
1564 : __ __ __ BYT ff 0f ef 0e ee 0e aa 0a 88 08 66 06 22 02 11 01 : ..........f."...
1574 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
VolumeInd:
1584 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
1594 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
TowerBase:
1c00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1c10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1c20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1c30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1c40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1c50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1c60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1c70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1c80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1c90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1ca0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1cb0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1cc0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1cd0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1ce0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1cf0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1d00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1d10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1d20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1d30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1d40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1d50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1d60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1d70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1d80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1d90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1da0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1db0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1dc0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1dd0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1de0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1df0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1e00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1e10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1e20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1e30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1e40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1e50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1e60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1e70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1e80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1e90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1ea0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1eb0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1ec0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1ed0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1ee0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1ef0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1f00 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1f10 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1f20 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1f30 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1f40 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1f50 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1f60 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1f70 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1f80 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1f90 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1fa0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1fb0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1fc0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1fd0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
1fe0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
1ff0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2000 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2010 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2020 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2030 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2040 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2050 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2060 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2070 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2080 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2090 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
20a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
20b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
20c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
20d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
20e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
20f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2100 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2110 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2120 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2130 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2140 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2150 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2160 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2170 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2180 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2190 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
21a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
21b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
21c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
21d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
21e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
21f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2200 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2210 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2220 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2230 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2240 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2250 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2260 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2270 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
2280 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
2290 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
22a0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
22b0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
22c0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
22d0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
22e0 : __ __ __ BYT 01 12 34 56 78 9a bc de 00 ed cb a9 87 65 43 21 : ..4Vx........eC!
22f0 : __ __ __ BYT 11 12 34 56 78 9a bc de 0e dc ba 98 76 54 32 11 : ..4Vx.......vT2.
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
--------------------------------------------------------------------
ButtonStageMax:
15a4 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
15b4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
15c4 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
15d4 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
2400 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
2410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerPalF1:
2420 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
2430 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
p:
15e4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalTimer:
15e6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalIndex:
15e8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFF:
2440 : __ __ __ BYT ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 : ..............w.
2450 : __ __ __ BYT 66 06 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f : f.U.D.3.".......
--------------------------------------------------------------------
TowerPalFE:
2460 : __ __ __ BYT dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 : ............w.f.
2470 : __ __ __ BYT 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e : U.D.3.".........
--------------------------------------------------------------------
TowerPalFD:
2480 : __ __ __ BYT cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 : ..........w.f.U.
2490 : __ __ __ BYT 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d : D.3."...........
--------------------------------------------------------------------
TowerPalFC:
24a0 : __ __ __ BYT bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 : ........w.f.U.D.
24b0 : __ __ __ BYT 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c : 3.".............
--------------------------------------------------------------------
TowerPalFB:
24c0 : __ __ __ BYT aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 33 03 : ......w.f.U.D.3.
24d0 : __ __ __ BYT 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b : "...............
--------------------------------------------------------------------
TowerPalFA:
24e0 : __ __ __ BYT 99 09 88 08 77 07 66 06 55 05 44 04 33 03 22 02 : ....w.f.U.D.3.".
24f0 : __ __ __ BYT 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a : ................
--------------------------------------------------------------------
TowerPalF9:
2500 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
2510 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
--------------------------------------------------------------------
TowerPalF8:
2520 : __ __ __ BYT 77 07 66 06 55 05 44 04 33 03 22 02 11 01 00 00 : w.f.U.D.3.".....
2530 : __ __ __ BYT ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 88 08 : ................
--------------------------------------------------------------------
TowerPalF7:
2540 : __ __ __ BYT 66 06 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f : f.U.D.3.".......
2550 : __ __ __ BYT ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 : ..............w.
--------------------------------------------------------------------
TowerPalF6:
2560 : __ __ __ BYT 55 05 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e : U.D.3.".........
2570 : __ __ __ BYT dd 0d cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 : ............w.f.
--------------------------------------------------------------------
TowerPalF5:
2580 : __ __ __ BYT 44 04 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d : D.3."...........
2590 : __ __ __ BYT cc 0c bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 : ..........w.f.U.
--------------------------------------------------------------------
TowerPalF4:
25a0 : __ __ __ BYT 33 03 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c : 3.".............
25b0 : __ __ __ BYT bb 0b aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 : ........w.f.U.D.
--------------------------------------------------------------------
TowerPalF3:
25c0 : __ __ __ BYT 22 02 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b : "...............
25d0 : __ __ __ BYT aa 0a 99 09 88 08 77 07 66 06 55 05 44 04 33 03 : ......w.f.U.D.3.
--------------------------------------------------------------------
TowerPalF2:
25e0 : __ __ __ BYT 11 01 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a : ................
25f0 : __ __ __ BYT 99 09 88 08 77 07 66 06 55 05 44 04 33 03 22 02 : ....w.f.U.D.3.".
--------------------------------------------------------------------
ShimmerState:
15ea : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPalShimmer:
2600 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
2610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
zsm_check:
.s0:
128a : ad 41 15 LDA $1541 ; (zsm_finished + 0)
.s1001:
128d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
128e : a9 01 __ LDA #$01
1290 : 8d 41 15 STA $1541 ; (zsm_finished + 0)
1293 : ad eb 15 LDA $15eb ; (zsm_reading + 0)
1296 : f0 0a __ BEQ $12a2 ; (zsm_init.s3 + 0)
.s1:
1298 : a9 02 __ LDA #$02
129a : 20 e7 12 JSR $12e7 ; (krnio_close.s1000 + 0)
129d : a9 00 __ LDA #$00
129f : 8d eb 15 STA $15eb ; (zsm_reading + 0)
.s3:
12a2 : 8d f2 15 STA $15f2 ; (zsm_pos + 0)
12a5 : 8d f3 15 STA $15f3 ; (zsm_pos + 1)
12a8 : 8d f4 15 STA $15f4 ; (zsm_wpos + 0)
12ab : 8d f5 15 STA $15f5 ; (zsm_wpos + 1)
12ae : 8d f1 15 STA $15f1 ; (zsm_delay + 0)
12b1 : a5 30 __ LDA P3 ; (fname + 0)
12b3 : 85 2d __ STA P0 
12b5 : a5 31 __ LDA P4 ; (fname + 1)
12b7 : 85 2e __ STA P1 
12b9 : 20 ef 12 JSR $12ef ; (krnio_setnam.s0 + 0)
12bc : a9 02 __ LDA #$02
12be : 85 2d __ STA P0 
12c0 : 85 2f __ STA P2 
12c2 : a9 08 __ LDA #$08
12c4 : 85 2e __ STA P1 
12c6 : 20 05 13 JSR $1305 ; (krnio_open.s0 + 0)
12c9 : a5 3b __ LDA ACCU + 0 
12cb : f0 19 __ BEQ $12e6 ; (zsm_init.s1001 + 0)
.s4:
12cd : a9 01 __ LDA #$01
12cf : 8d eb 15 STA $15eb ; (zsm_reading + 0)
12d2 : 20 2d 13 JSR $132d ; (zsm_fill.s0 + 0)
12d5 : a9 10 __ LDA #$10
12d7 : 8d f2 15 STA $15f2 ; (zsm_pos + 0)
12da : a9 00 __ LDA #$00
12dc : 8d f3 15 STA $15f3 ; (zsm_pos + 1)
12df : 8d 41 15 STA $1541 ; (zsm_finished + 0)
12e2 : a9 01 __ LDA #$01
12e4 : 85 3b __ STA ACCU + 0 
.s1001:
12e6 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
15eb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
12e7 : 85 2d __ STA P0 
.s0:
12e9 : a5 2d __ LDA P0 
12eb : 20 c3 ff JSR $ffc3 
.s1001:
12ee : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
15f4 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
12ef : a5 2d __ LDA P0 
12f1 : 05 2e __ ORA P1 
12f3 : f0 08 __ BEQ $12fd ; (krnio_setnam.s0 + 14)
12f5 : a0 ff __ LDY #$ff
12f7 : c8 __ __ INY
12f8 : b1 2d __ LDA (P0),y 
12fa : d0 fb __ BNE $12f7 ; (krnio_setnam.s0 + 8)
12fc : 98 __ __ TYA
12fd : a6 2d __ LDX P0 
12ff : a4 2e __ LDY P1 
1301 : 20 bd ff JSR $ffbd 
.s1001:
1304 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1305 : a9 00 __ LDA #$00
1307 : a6 2d __ LDX P0 ; (fnum + 0)
1309 : 9d 5b 2a STA $2a5b,x ; (krnio_pstatus + 0)
130c : a9 00 __ LDA #$00
130e : 85 3b __ STA ACCU + 0 
1310 : 85 3c __ STA ACCU + 1 
1312 : a5 2d __ LDA P0 ; (fnum + 0)
1314 : a6 2e __ LDX P1 
1316 : a4 2f __ LDY P2 
1318 : 20 ba ff JSR $ffba 
131b : 20 c0 ff JSR $ffc0 
131e : 90 08 __ BCC $1328 ; (krnio_open.s0 + 35)
1320 : a5 2d __ LDA P0 ; (fnum + 0)
1322 : 20 c3 ff JSR $ffc3 
1325 : 4c 2c 13 JMP $132c ; (krnio_open.s1001 + 0)
1328 : a9 01 __ LDA #$01
132a : 85 3b __ STA ACCU + 0 
.s1001:
132c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
2a5b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
132d : ad eb 15 LDA $15eb ; (zsm_reading + 0)
1330 : f0 20 __ BEQ $1352 ; (zsm_fill.s1 + 0)
.s2:
1332 : ad f3 15 LDA $15f3 ; (zsm_pos + 1)
1335 : 18 __ __ CLC
1336 : 69 04 __ ADC #$04
1338 : cd f5 15 CMP $15f5 ; (zsm_wpos + 1)
133b : d0 0c __ BNE $1349 ; (zsm_fill.s6 + 0)
.s1006:
133d : ad f4 15 LDA $15f4 ; (zsm_wpos + 0)
1340 : cd f2 15 CMP $15f2 ; (zsm_pos + 0)
1343 : d0 04 __ BNE $1349 ; (zsm_fill.s6 + 0)
.s5:
1345 : a9 00 __ LDA #$00
1347 : f0 0b __ BEQ $1354 ; (zsm_fill.s1008 + 0)
.s6:
1349 : a9 02 __ LDA #$02
134b : 20 d1 13 JSR $13d1 ; (krnio_chkin.s1000 + 0)
134e : a5 3b __ LDA ACCU + 0 
1350 : d0 07 __ BNE $1359 ; (zsm_fill.s9 + 0)
.s1:
1352 : a9 ff __ LDA #$ff
.s1008:
1354 : 85 3b __ STA ACCU + 0 
.s1001:
1356 : 85 3c __ STA ACCU + 1 
1358 : 60 __ __ RTS
.s9:
1359 : a9 00 __ LDA #$00
135b : 85 47 __ STA T1 + 0 
135d : 85 48 __ STA T1 + 1 
135f : ad f3 15 LDA $15f3 ; (zsm_pos + 1)
1362 : 18 __ __ CLC
1363 : 69 04 __ ADC #$04
1365 : cd f5 15 CMP $15f5 ; (zsm_wpos + 1)
1368 : d0 08 __ BNE $1372 ; (zsm_fill.l13 + 0)
.s1002:
136a : ad f4 15 LDA $15f4 ; (zsm_wpos + 0)
136d : cd f2 15 CMP $15f2 ; (zsm_pos + 0)
1370 : f0 49 __ BEQ $13bb ; (zsm_fill.s37 + 0)
.l13:
1372 : 20 e3 13 JSR $13e3 ; (krnio_chrin.s0 + 0)
1375 : ad f4 15 LDA $15f4 ; (zsm_wpos + 0)
1378 : aa __ __ TAX
1379 : 18 __ __ CLC
137a : 69 01 __ ADC #$01
137c : 8d f4 15 STA $15f4 ; (zsm_wpos + 0)
137f : ad f5 15 LDA $15f5 ; (zsm_wpos + 1)
1382 : a8 __ __ TAY
1383 : 69 00 __ ADC #$00
1385 : 8d f5 15 STA $15f5 ; (zsm_wpos + 1)
1388 : 8a __ __ TXA
1389 : 18 __ __ CLC
138a : 69 5b __ ADC #$5b
138c : 85 49 __ STA T3 + 0 
138e : 98 __ __ TYA
138f : 29 03 __ AND #$03
1391 : 69 26 __ ADC #$26
1393 : 85 4a __ STA T3 + 1 
1395 : a5 3b __ LDA ACCU + 0 
1397 : a0 00 __ LDY #$00
1399 : 91 49 __ STA (T3 + 0),y 
139b : e6 47 __ INC T1 + 0 
139d : d0 02 __ BNE $13a1 ; (zsm_fill.s1010 + 0)
.s1009:
139f : e6 48 __ INC T1 + 1 
.s1010:
13a1 : 20 ed 13 JSR $13ed ; (krnio_status.s0 + 0)
13a4 : a5 3b __ LDA ACCU + 0 
13a6 : d0 0e __ BNE $13b6 ; (zsm_fill.s15 + 0)
.s12:
13a8 : ad f3 15 LDA $15f3 ; (zsm_pos + 1)
13ab : 18 __ __ CLC
13ac : 69 04 __ ADC #$04
13ae : cd f5 15 CMP $15f5 ; (zsm_wpos + 1)
13b1 : d0 bf __ BNE $1372 ; (zsm_fill.l13 + 0)
13b3 : 4c 6a 13 JMP $136a ; (zsm_fill.s1002 + 0)
.s15:
13b6 : a9 00 __ LDA #$00
13b8 : 8d eb 15 STA $15eb ; (zsm_reading + 0)
.s37:
13bb : 20 f7 13 JSR $13f7 ; (krnio_clrchn.s0 + 0)
13be : ad eb 15 LDA $15eb ; (zsm_reading + 0)
13c1 : d0 05 __ BNE $13c8 ; (zsm_fill.s21 + 0)
.s19:
13c3 : a9 02 __ LDA #$02
13c5 : 20 e7 12 JSR $12e7 ; (krnio_close.s1000 + 0)
.s21:
13c8 : a5 47 __ LDA T1 + 0 
13ca : 85 3b __ STA ACCU + 0 
13cc : a5 48 __ LDA T1 + 1 
13ce : 4c 56 13 JMP $1356 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
13d1 : 85 2d __ STA P0 
.s0:
13d3 : a6 2d __ LDX P0 
13d5 : 20 c6 ff JSR $ffc6 
13d8 : a9 00 __ LDA #$00
13da : 85 3c __ STA ACCU + 1 
13dc : b0 02 __ BCS $13e0 ; (krnio_chkin.s0 + 13)
13de : a9 01 __ LDA #$01
13e0 : 85 3b __ STA ACCU + 0 
.s1001:
13e2 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
13e3 : 20 cf ff JSR $ffcf 
13e6 : 85 3b __ STA ACCU + 0 
13e8 : a9 00 __ LDA #$00
13ea : 85 3c __ STA ACCU + 1 
.s1001:
13ec : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
13ed : 20 b7 ff JSR $ffb7 
13f0 : 85 3b __ STA ACCU + 0 
13f2 : a9 00 __ LDA #$00
13f4 : 85 3c __ STA ACCU + 1 
.s1001:
13f6 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
13f7 : 20 cc ff JSR $ffcc 
.s1001:
13fa : 60 __ __ RTS
--------------------------------------------------------------------
1400 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 4b 72 61 69 : @0:zsmfiles/Krai
1410 : __ __ __ BYT 64 2e 7a 73 6d 2c 50 2c 52 00                   : d.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
141a : 20 36 14 JSR $1436 ; (getchx.s0 + 0)
141d : a5 3c __ LDA ACCU + 1 
141f : d0 10 __ BNE $1431 ; (Control.s3 + 0)
.s1005:
1421 : a5 3b __ LDA ACCU + 0 
1423 : c9 20 __ CMP #$20
1425 : d0 0a __ BNE $1431 ; (Control.s3 + 0)
.s1:
1427 : a9 00 __ LDA #$00
1429 : c5 2e __ CMP P1 ; (playing + 0)
142b : 2a __ __ ROL
142c : 85 2e __ STA P1 ; (playing + 0)
142e : 20 fb 13 JSR $13fb ; (zsm_irq_play.s0 + 0)
.s3:
1431 : a5 2e __ LDA P1 ; (playing + 0)
1433 : 85 3b __ STA ACCU + 0 
.s1001:
1435 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
1436 : 20 40 14 JSR $1440 ; (getpch + 0)
1439 : 85 3b __ STA ACCU + 0 
143b : a9 00 __ LDA #$00
143d : 85 3c __ STA ACCU + 1 
.s1001:
143f : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1440 : 20 e4 ff JSR $ffe4 
1443 : ae ec 15 LDX $15ec ; (giocharmap + 0)
1446 : e0 01 __ CPX #$01
1448 : 90 1c __ BCC $1466 ; (getpch + 38)
144a : c9 0d __ CMP #$0d
144c : d0 02 __ BNE $1450 ; (getpch + 16)
144e : a9 0a __ LDA #$0a
1450 : e0 02 __ CPX #$02
1452 : 90 12 __ BCC $1466 ; (getpch + 38)
1454 : c9 41 __ CMP #$41
1456 : 90 0e __ BCC $1466 ; (getpch + 38)
1458 : c9 7b __ CMP #$7b
145a : b0 0a __ BCS $1466 ; (getpch + 38)
145c : c9 61 __ CMP #$61
145e : b0 04 __ BCS $1464 ; (getpch + 36)
1460 : c9 5b __ CMP #$5b
1462 : b0 02 __ BCS $1466 ; (getpch + 38)
1464 : 49 20 __ EOR #$20
1466 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
15ec : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
13fb : 8d 40 15 STA $1540 ; (zsm_playing + 0)
.s1001:
13fe : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
15ed : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
15f6 : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
2620 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
2630 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
2640 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
2650 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
1467 : ad 26 9f LDA $9f26 
146a : 29 40 __ AND #$40
146c : d0 f9 __ BNE $1467 ; (frame_wait.l1 + 0)
.l4:
146e : ad 26 9f LDA $9f26 
1471 : 29 40 __ AND #$40
1473 : f0 f9 __ BEQ $146e ; (frame_wait.l4 + 0)
.s1001:
1475 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1476 : 38 __ __ SEC
1477 : a9 00 __ LDA #$00
1479 : e5 3b __ SBC ACCU + 0 
147b : 85 3b __ STA ACCU + 0 
147d : a9 00 __ LDA #$00
147f : e5 3c __ SBC ACCU + 1 
1481 : 85 3c __ STA ACCU + 1 
1483 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1484 : 38 __ __ SEC
1485 : a9 00 __ LDA #$00
1487 : e5 23 __ SBC WORK + 0 
1489 : 85 23 __ STA WORK + 0 
148b : a9 00 __ LDA #$00
148d : e5 24 __ SBC WORK + 1 
148f : 85 24 __ STA WORK + 1 
1491 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1492 : a5 3c __ LDA ACCU + 1 
1494 : d0 31 __ BNE $14c7 ; (divmod + 53)
1496 : a5 24 __ LDA WORK + 1 
1498 : d0 1e __ BNE $14b8 ; (divmod + 38)
149a : 85 26 __ STA WORK + 3 
149c : a2 04 __ LDX #$04
149e : 06 3b __ ASL ACCU + 0 
14a0 : 2a __ __ ROL
14a1 : c5 23 __ CMP WORK + 0 
14a3 : 90 02 __ BCC $14a7 ; (divmod + 21)
14a5 : e5 23 __ SBC WORK + 0 
14a7 : 26 3b __ ROL ACCU + 0 
14a9 : 2a __ __ ROL
14aa : c5 23 __ CMP WORK + 0 
14ac : 90 02 __ BCC $14b0 ; (divmod + 30)
14ae : e5 23 __ SBC WORK + 0 
14b0 : 26 3b __ ROL ACCU + 0 
14b2 : ca __ __ DEX
14b3 : d0 eb __ BNE $14a0 ; (divmod + 14)
14b5 : 85 25 __ STA WORK + 2 
14b7 : 60 __ __ RTS
14b8 : a5 3b __ LDA ACCU + 0 
14ba : 85 25 __ STA WORK + 2 
14bc : a5 3c __ LDA ACCU + 1 
14be : 85 26 __ STA WORK + 3 
14c0 : a9 00 __ LDA #$00
14c2 : 85 3b __ STA ACCU + 0 
14c4 : 85 3c __ STA ACCU + 1 
14c6 : 60 __ __ RTS
14c7 : a5 24 __ LDA WORK + 1 
14c9 : d0 1f __ BNE $14ea ; (divmod + 88)
14cb : a5 23 __ LDA WORK + 0 
14cd : 30 1b __ BMI $14ea ; (divmod + 88)
14cf : a9 00 __ LDA #$00
14d1 : 85 26 __ STA WORK + 3 
14d3 : a2 10 __ LDX #$10
14d5 : 06 3b __ ASL ACCU + 0 
14d7 : 26 3c __ ROL ACCU + 1 
14d9 : 2a __ __ ROL
14da : c5 23 __ CMP WORK + 0 
14dc : 90 02 __ BCC $14e0 ; (divmod + 78)
14de : e5 23 __ SBC WORK + 0 
14e0 : 26 3b __ ROL ACCU + 0 
14e2 : 26 3c __ ROL ACCU + 1 
14e4 : ca __ __ DEX
14e5 : d0 f2 __ BNE $14d9 ; (divmod + 71)
14e7 : 85 25 __ STA WORK + 2 
14e9 : 60 __ __ RTS
14ea : a9 00 __ LDA #$00
14ec : 85 25 __ STA WORK + 2 
14ee : 85 26 __ STA WORK + 3 
14f0 : 84 22 __ STY $22 
14f2 : a0 10 __ LDY #$10
14f4 : 18 __ __ CLC
14f5 : 26 3b __ ROL ACCU + 0 
14f7 : 26 3c __ ROL ACCU + 1 
14f9 : 26 25 __ ROL WORK + 2 
14fb : 26 26 __ ROL WORK + 3 
14fd : 38 __ __ SEC
14fe : a5 25 __ LDA WORK + 2 
1500 : e5 23 __ SBC WORK + 0 
1502 : aa __ __ TAX
1503 : a5 26 __ LDA WORK + 3 
1505 : e5 24 __ SBC WORK + 1 
1507 : 90 04 __ BCC $150d ; (divmod + 123)
1509 : 86 25 __ STX WORK + 2 
150b : 85 26 __ STA WORK + 3 
150d : 88 __ __ DEY
150e : d0 e5 __ BNE $14f5 ; (divmod + 99)
1510 : 26 3b __ ROL ACCU + 0 
1512 : 26 3c __ ROL ACCU + 1 
1514 : a4 22 __ LDY $22 
1516 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1517 : 24 3c __ BIT ACCU + 1 
1519 : 10 0d __ BPL $1528 ; (mods16 + 17)
151b : 20 76 14 JSR $1476 ; (negaccu + 0)
151e : 24 24 __ BIT WORK + 1 
1520 : 10 0d __ BPL $152f ; (mods16 + 24)
1522 : 20 84 14 JSR $1484 ; (negtmp + 0)
1525 : 4c 92 14 JMP $1492 ; (divmod + 0)
1528 : 24 24 __ BIT WORK + 1 
152a : 10 f9 __ BPL $1525 ; (mods16 + 14)
152c : 20 84 14 JSR $1484 ; (negtmp + 0)
152f : 20 92 14 JSR $1492 ; (divmod + 0)
1532 : 38 __ __ SEC
1533 : a9 00 __ LDA #$00
1535 : e5 25 __ SBC WORK + 2 
1537 : 85 25 __ STA WORK + 2 
1539 : a9 00 __ LDA #$00
153b : e5 26 __ SBC WORK + 3 
153d : 85 26 __ STA WORK + 3 
153f : 60 __ __ RTS
