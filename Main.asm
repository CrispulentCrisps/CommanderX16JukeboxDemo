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
080e : 8e e1 1c STX $1ce1 ; (spentry + 0)
0811 : a9 5e __ LDA #$5e
0813 : 85 39 __ STA IP + 0 
0815 : a9 40 __ LDA #$40
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 44 __ LDA #$44
081c : e9 40 __ SBC #$40
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
0830 : a9 86 __ LDA #$86
0832 : e9 5e __ SBC #$5e
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
1ce1 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 c8 0b JSR $0bc8 ; (zsm_irq_init.s0 + 0)
0883 : 20 9c 0d JSR $0d9c ; (ClearVERAScreen.s0 + 0)
0886 : 20 df 0d JSR $0ddf ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9f __ LDA #$9f
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
08e1 : a9 28 __ LDA #$28
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
0905 : 85 52 __ STA T1 + 1 
0907 : 85 53 __ STA T2 + 0 
0909 : 85 54 __ STA T3 + 0 
.l2:
090b : 20 24 18 JSR $1824 ; (getchx.s0 + 0)
090e : a5 3b __ LDA ACCU + 0 
0910 : 85 55 __ STA T4 + 0 
0912 : a9 30 __ LDA #$30
0914 : 8d 2c 9f STA $9f2c 
0917 : ee f4 1c INC $1cf4 ; (p + 0)
091a : d0 03 __ BNE $091f ; (main.s1026 + 0)
.s1025:
091c : ee f5 1c INC $1cf5 ; (p + 1)
.s1026:
091f : ad f6 1c LDA $1cf6 ; (Phase + 0)
0922 : 18 __ __ CLC
0923 : 69 01 __ ADC #$01
0925 : 85 32 __ STA P5 
0927 : 8d f6 1c STA $1cf6 ; (Phase + 0)
092a : ad f7 1c LDA $1cf7 ; (Phase + 1)
092d : 69 00 __ ADC #$00
092f : 85 33 __ STA P6 
0931 : 8d f7 1c STA $1cf7 ; (Phase + 1)
0934 : ad f8 1c LDA $1cf8 ; (Phase2 + 0)
0937 : 18 __ __ CLC
0938 : 69 01 __ ADC #$01
093a : 85 34 __ STA P7 
093c : 8d f8 1c STA $1cf8 ; (Phase2 + 0)
093f : ad f9 1c LDA $1cf9 ; (Phase2 + 1)
0942 : 69 00 __ ADC #$00
0944 : 85 35 __ STA P8 
0946 : 8d f9 1c STA $1cf9 ; (Phase2 + 1)
0949 : 20 5f 18 JSR $185f ; (MoveSprites.s0 + 0)
094c : a5 53 __ LDA T2 + 0 
094e : f0 03 __ BEQ $0953 ; (main.s5 + 0)
0950 : 4c af 0b JMP $0baf ; (main.s4 + 0)
.s5:
0953 : a9 20 __ LDA #$20
0955 : 85 37 __ STA P10 
0957 : a9 a0 __ LDA #$a0
0959 : 8d fc 9e STA $9efc ; (sstack + 0)
095c : a9 fa __ LDA #$fa
095e : 8d fd 9e STA $9efd ; (sstack + 1)
0961 : a9 01 __ LDA #$01
0963 : 8d fe 9e STA $9efe ; (sstack + 2)
0966 : a9 00 __ LDA #$00
0968 : 8d ff 9e STA $9eff ; (sstack + 3)
096b : 8d fb 1c STA $1cfb ; (PalTimer + 0)
096e : 8d fc 1c STA $1cfc ; (PalTimer + 1)
0971 : a9 a0 __ LDA #$a0
0973 : 85 35 __ STA P8 
0975 : a9 25 __ LDA #$25
0977 : 85 36 __ STA P9 
0979 : 20 fd 17 JSR $17fd ; (SetPaletteColours.s0 + 0)
.s87:
097c : e6 54 __ INC T3 + 0 
097e : a9 02 __ LDA #$02
0980 : c5 54 __ CMP T3 + 0 
0982 : 90 03 __ BCC $0987 ; (main.s10 + 0)
0984 : 4c 0f 0a JMP $0a0f ; (main.s12 + 0)
.s10:
0987 : a9 10 __ LDA #$10
0989 : 85 34 __ STA P7 
098b : a9 00 __ LDA #$00
098d : 85 35 __ STA P8 
098f : 85 36 __ STA P9 
0991 : 85 37 __ STA P10 
0993 : a9 06 __ LDA #$06
0995 : 8d fc 9e STA $9efc ; (sstack + 0)
0998 : a9 00 __ LDA #$00
099a : 8d fd 9e STA $9efd ; (sstack + 1)
099d : 8d ff 9e STA $9eff ; (sstack + 3)
09a0 : a9 0a __ LDA #$0a
09a2 : 8d fe 9e STA $9efe ; (sstack + 2)
09a5 : a9 00 __ LDA #$00
09a7 : 85 32 __ STA P5 
09a9 : a9 25 __ LDA #$25
09ab : 85 33 __ STA P6 
09ad : 20 a4 1a JSR $1aa4 ; (SetPaletteIndex.s0 + 0)
09b0 : a0 00 __ LDY #$00
09b2 : 84 54 __ STY T3 + 0 
.l14:
09b4 : be d9 1c LDX $1cd9,y ; (__multab10L + 0)
09b7 : bd ac 9e LDA $9eac,x ; (Buildings + 0)
09ba : 1d ad 9e ORA $9ead,x ; (Buildings + 1)
09bd : d0 4b __ BNE $0a0a ; (main.s15 + 0)
.s18:
09bf : ad 2e 9f LDA $9f2e 
09c2 : 0a __ __ ASL
09c3 : 85 4e __ STA T9 + 1 
09c5 : a9 00 __ LDA #$00
09c7 : 2a __ __ ROL
09c8 : 85 4f __ STA T9 + 2 
09ca : bd b0 9e LDA $9eb0,x ; (Buildings + 4)
09cd : 85 3c __ STA ACCU + 1 
09cf : bd b1 9e LDA $9eb1,x ; (Buildings + 5)
09d2 : 4a __ __ LSR
09d3 : 66 3c __ ROR ACCU + 1 
09d5 : a9 00 __ LDA #$00
09d7 : 6a __ __ ROR
09d8 : 7d ae 9e ADC $9eae,x ; (Buildings + 2)
09db : 85 4d __ STA T9 + 0 
09dd : bd af 9e LDA $9eaf,x ; (Buildings + 3)
09e0 : 65 3c __ ADC ACCU + 1 
09e2 : 18 __ __ CLC
09e3 : 65 4e __ ADC T9 + 1 
09e5 : 85 4e __ STA T9 + 1 
09e7 : 90 02 __ BCC $09eb ; (main.s1030 + 0)
.s1029:
09e9 : e6 4f __ INC T9 + 2 
.s1030:
09eb : a9 00 __ LDA #$00
09ed : 85 4c __ STA T8 + 0 
.l19:
09ef : be d9 1c LDX $1cd9,y ; (__multab10L + 0)
09f2 : bd b4 9e LDA $9eb4,x ; (Buildings + 8)
09f5 : 85 3b __ STA ACCU + 0 
09f7 : bd b5 9e LDA $9eb5,x ; (Buildings + 9)
09fa : f0 03 __ BEQ $09ff ; (main.s1020 + 0)
09fc : 4c 59 0b JMP $0b59 ; (main.s20 + 0)
.s1020:
09ff : 85 3c __ STA ACCU + 1 
0a01 : a5 4c __ LDA T8 + 0 
0a03 : c5 3b __ CMP ACCU + 0 
0a05 : b0 03 __ BCS $0a0a ; (main.s15 + 0)
0a07 : 4c 59 0b JMP $0b59 ; (main.s20 + 0)
.s15:
0a0a : c8 __ __ INY
0a0b : c0 08 __ CPY #$08
0a0d : 90 a5 __ BCC $09b4 ; (main.l14 + 0)
.s12:
0a0f : ad fc 1c LDA $1cfc ; (PalTimer + 1)
0a12 : 30 5f __ BMI $0a73 ; (main.s93 + 0)
.s1015:
0a14 : d0 07 __ BNE $0a1d ; (main.s31 + 0)
.s1014:
0a16 : a9 03 __ LDA #$03
0a18 : cd fb 1c CMP $1cfb ; (PalTimer + 0)
0a1b : b0 56 __ BCS $0a73 ; (main.s93 + 0)
.s31:
0a1d : a9 60 __ LDA #$60
0a1f : 85 34 __ STA P7 
0a21 : a9 00 __ LDA #$00
0a23 : 85 35 __ STA P8 
0a25 : 85 36 __ STA P9 
0a27 : 85 37 __ STA P10 
0a29 : 8d fc 9e STA $9efc ; (sstack + 0)
0a2c : 8d fd 9e STA $9efd ; (sstack + 1)
0a2f : a9 05 __ LDA #$05
0a31 : 8d fe 9e STA $9efe ; (sstack + 2)
0a34 : a9 00 __ LDA #$00
0a36 : 8d ff 9e STA $9eff ; (sstack + 3)
0a39 : ee fd 1c INC $1cfd ; (PalIndex + 0)
0a3c : d0 03 __ BNE $0a41 ; (main.s1034 + 0)
.s1033:
0a3e : ee fe 1c INC $1cfe ; (PalIndex + 1)
.s1034:
0a41 : a9 e7 __ LDA #$e7
0a43 : 85 32 __ STA P5 
0a45 : a9 1c __ LDA #$1c
0a47 : 85 33 __ STA P6 
0a49 : 20 a4 1a JSR $1aa4 ; (SetPaletteIndex.s0 + 0)
0a4c : a9 50 __ LDA #$50
0a4e : 85 34 __ STA P7 
0a50 : a9 00 __ LDA #$00
0a52 : 8d fc 9e STA $9efc ; (sstack + 0)
0a55 : 8d fd 9e STA $9efd ; (sstack + 1)
0a58 : 8d ff 9e STA $9eff ; (sstack + 3)
0a5b : a9 10 __ LDA #$10
0a5d : 8d fe 9e STA $9efe ; (sstack + 2)
0a60 : a9 c0 __ LDA #$c0
0a62 : 85 32 __ STA P5 
0a64 : a9 25 __ LDA #$25
0a66 : 85 33 __ STA P6 
0a68 : 20 a4 1a JSR $1aa4 ; (SetPaletteIndex.s0 + 0)
0a6b : a9 00 __ LDA #$00
0a6d : 8d fb 1c STA $1cfb ; (PalTimer + 0)
0a70 : 8d fc 1c STA $1cfc ; (PalTimer + 1)
.s93:
0a73 : ad f5 1c LDA $1cf5 ; (p + 1)
0a76 : d0 42 __ BNE $0aba ; (main.s36 + 0)
.s1013:
0a78 : ad f4 1c LDA $1cf4 ; (p + 0)
0a7b : c9 03 __ CMP #$03
0a7d : d0 3b __ BNE $0aba ; (main.s36 + 0)
.s34:
0a7f : a9 20 __ LDA #$20
0a81 : 85 37 __ STA P10 
0a83 : a9 00 __ LDA #$00
0a85 : 8d fc 9e STA $9efc ; (sstack + 0)
0a88 : 8d ff 9e STA $9eff ; (sstack + 3)
0a8b : a9 fa __ LDA #$fa
0a8d : 8d fd 9e STA $9efd ; (sstack + 1)
0a90 : a9 01 __ LDA #$01
0a92 : 8d fe 9e STA $9efe ; (sstack + 2)
0a95 : a9 00 __ LDA #$00
0a97 : cd ff 1c CMP $1cff ; (ShimmerState + 0)
0a9a : 2a __ __ ROL
0a9b : 8d ff 1c STA $1cff ; (ShimmerState + 0)
0a9e : d0 07 __ BNE $0aa7 ; (main.s37 + 0)
.s38:
0aa0 : a9 40 __ LDA #$40
0aa2 : a0 00 __ LDY #$00
0aa4 : 4c ab 0a JMP $0aab ; (main.s101 + 0)
.s37:
0aa7 : a9 25 __ LDA #$25
0aa9 : a0 e0 __ LDY #$e0
.s101:
0aab : 84 35 __ STY P8 
0aad : 85 36 __ STA P9 
0aaf : 20 fd 17 JSR $17fd ; (SetPaletteColours.s0 + 0)
0ab2 : a9 00 __ LDA #$00
0ab4 : 8d f4 1c STA $1cf4 ; (p + 0)
0ab7 : 8d f5 1c STA $1cf5 ; (p + 1)
.s36:
0aba : a5 53 __ LDA T2 + 0 
0abc : 85 2e __ STA P1 
0abe : a9 03 __ LDA #$03
0ac0 : 8d 2c 9f STA $9f2c 
0ac3 : a5 55 __ LDA T4 + 0 
0ac5 : 85 2f __ STA P2 
0ac7 : c9 44 __ CMP #$44
0ac9 : d0 0e __ BNE $0ad9 ; (main.s41 + 0)
.s40:
0acb : 18 __ __ CLC
0acc : a5 51 __ LDA T1 + 0 
0ace : 69 01 __ ADC #$01
0ad0 : 85 51 __ STA T1 + 0 
0ad2 : a5 52 __ LDA T1 + 1 
0ad4 : 69 00 __ ADC #$00
0ad6 : 4c f0 0a JMP $0af0 ; (main.s1023 + 0)
.s41:
0ad9 : c9 41 __ CMP #$41
0adb : d0 15 __ BNE $0af2 ; (main.s42 + 0)
.s46:
0add : a5 52 __ LDA T1 + 1 
0adf : 30 11 __ BMI $0af2 ; (main.s42 + 0)
.s1005:
0ae1 : 05 51 __ ORA T1 + 0 
0ae3 : f0 0d __ BEQ $0af2 ; (main.s42 + 0)
.s43:
0ae5 : 18 __ __ CLC
0ae6 : a5 51 __ LDA T1 + 0 
0ae8 : 69 ff __ ADC #$ff
0aea : 85 51 __ STA T1 + 0 
0aec : a5 52 __ LDA T1 + 1 
0aee : 69 ff __ ADC #$ff
.s1023:
0af0 : 85 52 __ STA T1 + 1 
.s42:
0af2 : 20 57 1b JSR $1b57 ; (Control.s0 + 0)
0af5 : a5 3b __ LDA ACCU + 0 
0af7 : 85 53 __ STA T2 + 0 
0af9 : ad 21 40 LDA $4021 ; (FrameCount + 0)
0afc : 85 55 __ STA T4 + 0 
0afe : 85 3b __ STA ACCU + 0 
0b00 : ad 22 40 LDA $4022 ; (FrameCount + 1)
0b03 : 85 3c __ STA ACCU + 1 
0b05 : a9 04 __ LDA #$04
0b07 : 85 23 __ STA WORK + 0 
0b09 : a9 00 __ LDA #$00
0b0b : 85 24 __ STA WORK + 1 
0b0d : 20 b0 1c JSR $1cb0 ; (mods16 + 0)
0b10 : a5 26 __ LDA WORK + 3 
0b12 : d0 16 __ BNE $0b2a ; (main.s49 + 0)
.s1004:
0b14 : a5 25 __ LDA WORK + 2 
0b16 : c9 01 __ CMP #$01
0b18 : d0 10 __ BNE $0b2a ; (main.s49 + 0)
.s47:
0b1a : ac 85 44 LDY $4485 ; (off1 + 0)
0b1d : c0 3b __ CPY #$3b
0b1f : b0 06 __ BCS $0b27 ; (main.s102 + 0)
.s50:
0b21 : b9 23 40 LDA $4023,y ; (TestText2 + 0)
0b24 : 8d 23 9f STA $9f23 
.s102:
0b27 : ee 85 44 INC $4485 ; (off1 + 0)
.s49:
0b2a : 06 55 __ ASL T4 + 0 
0b2c : ad 22 40 LDA $4022 ; (FrameCount + 1)
0b2f : 2a __ __ ROL
0b30 : 18 __ __ CLC
0b31 : 69 ff __ ADC #$ff
0b33 : 8d 38 9f STA $9f38 
0b36 : a5 55 __ LDA T4 + 0 
0b38 : 8d 37 9f STA $9f37 
0b3b : a9 01 __ LDA #$01
0b3d : 8d 2c 9f STA $9f2c 
0b40 : 20 75 19 JSR $1975 ; (zsm_fill.s0 + 0)
0b43 : a9 00 __ LDA #$00
0b45 : 8d 2c 9f STA $9f2c 
0b48 : 20 00 1c JSR $1c00 ; (frame_wait.l1 + 0)
0b4b : ee 21 40 INC $4021 ; (FrameCount + 0)
0b4e : f0 03 __ BEQ $0b53 ; (main.s1035 + 0)
0b50 : 4c 0b 09 JMP $090b ; (main.l2 + 0)
.s1035:
0b53 : ee 22 40 INC $4022 ; (FrameCount + 1)
0b56 : 4c 0b 09 JMP $090b ; (main.l2 + 0)
.s20:
0b59 : ad 25 9f LDA $9f25 
0b5c : 29 fe __ AND #$fe
0b5e : 8d 25 9f STA $9f25 
0b61 : 18 __ __ CLC
0b62 : a5 4d __ LDA T9 + 0 
0b64 : 69 01 __ ADC #$01
0b66 : 8d 20 9f STA $9f20 
0b69 : a5 4e __ LDA T9 + 1 
0b6b : 69 00 __ ADC #$00
0b6d : 8d 21 9f STA $9f21 
0b70 : a5 4f __ LDA T9 + 2 
0b72 : 69 00 __ ADC #$00
0b74 : 29 01 __ AND #$01
0b76 : 09 20 __ ORA #$20
0b78 : 8d 22 9f STA $9f22 
0b7b : a9 00 __ LDA #$00
0b7d : 85 3b __ STA ACCU + 0 
0b7f : bd b3 9e LDA $9eb3,x ; (Buildings + 7)
0b82 : d0 07 __ BNE $0b8b ; (main.l25 + 0)
.s1018:
0b84 : a5 3b __ LDA ACCU + 0 
0b86 : dd b2 9e CMP $9eb2,x ; (Buildings + 6)
0b89 : b0 0f __ BCS $0b9a ; (main.s27 + 0)
.l25:
0b8b : a9 10 __ LDA #$10
0b8d : 8d 23 9f STA $9f23 
0b90 : e6 3b __ INC ACCU + 0 
0b92 : bd b3 9e LDA $9eb3,x ; (Buildings + 7)
0b95 : d0 f4 __ BNE $0b8b ; (main.l25 + 0)
0b97 : 4c 84 0b JMP $0b84 ; (main.s1018 + 0)
.s27:
0b9a : a5 4d __ LDA T9 + 0 
0b9c : 69 7f __ ADC #$7f
0b9e : 85 4d __ STA T9 + 0 
0ba0 : a5 4e __ LDA T9 + 1 
0ba2 : 69 00 __ ADC #$00
0ba4 : 85 4e __ STA T9 + 1 
0ba6 : 90 02 __ BCC $0baa ; (main.s1032 + 0)
.s1031:
0ba8 : e6 4f __ INC T9 + 2 
.s1032:
0baa : e6 4c __ INC T8 + 0 
0bac : 4c ef 09 JMP $09ef ; (main.l19 + 0)
.s4:
0baf : a5 51 __ LDA T1 + 0 
0bb1 : 85 32 __ STA P5 
0bb3 : a5 52 __ LDA T1 + 1 
0bb5 : 85 33 __ STA P6 
0bb7 : 20 a1 18 JSR $18a1 ; (PlayZSM.s0 + 0)
0bba : ee fb 1c INC $1cfb ; (PalTimer + 0)
0bbd : f0 03 __ BEQ $0bc2 ; (main.s1027 + 0)
0bbf : 4c 7c 09 JMP $097c ; (main.s87 + 0)
.s1027:
0bc2 : ee fc 1c INC $1cfc ; (PalTimer + 1)
0bc5 : 4c 7c 09 JMP $097c ; (main.s87 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0bc8 : 78 __ __ SEI
0bc9 : ad 14 03 LDA $0314 
0bcc : 8d 5e 40 STA $405e ; (oirq + 0)
0bcf : ad 15 03 LDA $0315 
0bd2 : 8d 5f 40 STA $405f ; (oirq + 1)
0bd5 : a9 e1 __ LDA #$e1
0bd7 : 8d 14 03 STA $0314 
0bda : a9 0b __ LDA #$0b
0bdc : 8d 15 03 STA $0315 
0bdf : 58 __ __ CLI
.s1001:
0be0 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
405e : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0be1 : 20 e7 0b JSR $0be7 ; (irq.s1000 + 0)
0be4 : 6c 5e 40 JMP ($405e)
--------------------------------------------------------------------
irq:
.s1000:
0be7 : a5 2d __ LDA P0 
0be9 : 48 __ __ PHA
0bea : a5 2e __ LDA P1 
0bec : 48 __ __ PHA
0bed : a5 3b __ LDA ACCU + 0 
0bef : 48 __ __ PHA
0bf0 : a5 3c __ LDA ACCU + 1 
0bf2 : 48 __ __ PHA
0bf3 : a5 47 __ LDA T0 + 0 
0bf5 : 48 __ __ PHA
0bf6 : a5 48 __ LDA $48 
0bf8 : 48 __ __ PHA
0bf9 : a5 49 __ LDA $49 
0bfb : 48 __ __ PHA
0bfc : a5 4a __ LDA $4a 
0bfe : 48 __ __ PHA
0bff : a5 4b __ LDA $4b 
0c01 : 48 __ __ PHA
0c02 : a5 4c __ LDA $4c 
0c04 : 48 __ __ PHA
0c05 : a5 4d __ LDA $4d 
0c07 : 48 __ __ PHA
0c08 : a5 4e __ LDA $4e 
0c0a : 48 __ __ PHA
0c0b : a5 4f __ LDA $4f 
0c0d : 48 __ __ PHA
0c0e : a5 50 __ LDA $50 
0c10 : 48 __ __ PHA
.s0:
0c11 : ad e2 1c LDA $1ce2 ; (zsm_playing + 0)
0c14 : f0 08 __ BEQ $0c1e ; (irq.s1001 + 0)
.s4:
0c16 : ad e3 1c LDA $1ce3 ; (zsm_finished + 0)
0c19 : d0 03 __ BNE $0c1e ; (irq.s1001 + 0)
.s1:
0c1b : 20 49 0c JSR $0c49 ; (zsm_play.s0 + 0)
.s1001:
0c1e : 68 __ __ PLA
0c1f : 85 50 __ STA $50 
0c21 : 68 __ __ PLA
0c22 : 85 4f __ STA $4f 
0c24 : 68 __ __ PLA
0c25 : 85 4e __ STA $4e 
0c27 : 68 __ __ PLA
0c28 : 85 4d __ STA $4d 
0c2a : 68 __ __ PLA
0c2b : 85 4c __ STA $4c 
0c2d : 68 __ __ PLA
0c2e : 85 4b __ STA $4b 
0c30 : 68 __ __ PLA
0c31 : 85 4a __ STA $4a 
0c33 : 68 __ __ PLA
0c34 : 85 49 __ STA $49 
0c36 : 68 __ __ PLA
0c37 : 85 48 __ STA $48 
0c39 : 68 __ __ PLA
0c3a : 85 47 __ STA T0 + 0 
0c3c : 68 __ __ PLA
0c3d : 85 3c __ STA ACCU + 1 
0c3f : 68 __ __ PLA
0c40 : 85 3b __ STA ACCU + 0 
0c42 : 68 __ __ PLA
0c43 : 85 2e __ STA P1 
0c45 : 68 __ __ PLA
0c46 : 85 2d __ STA P0 
0c48 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1ce2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1ce3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c49 : ad e4 1c LDA $1ce4 ; (zsm_paused + 0)
0c4c : f0 01 __ BEQ $0c4f ; (zsm_play.s2 + 0)
0c4e : 60 __ __ RTS
.s2:
0c4f : ad 60 40 LDA $4060 ; (zsm_delay + 0)
0c52 : f0 03 __ BEQ $0c57 ; (zsm_play.s5 + 0)
0c54 : 4c 84 0d JMP $0d84 ; (zsm_play.s4 + 0)
.s5:
0c57 : ad 25 9f LDA $9f25 
0c5a : 85 47 __ STA T0 + 0 
0c5c : ad 25 9f LDA $9f25 
0c5f : 29 fe __ AND #$fe
0c61 : 8d 25 9f STA $9f25 
0c64 : ad 20 9f LDA $9f20 
0c67 : 85 49 __ STA T2 + 0 
0c69 : ad 21 9f LDA $9f21 
0c6c : 85 4a __ STA T2 + 1 
0c6e : ad 22 9f LDA $9f22 
0c71 : 85 48 __ STA T1 + 0 
.l8:
0c73 : ad 61 44 LDA $4461 ; (zsm_pos + 0)
0c76 : 85 4b __ STA T3 + 0 
0c78 : 18 __ __ CLC
0c79 : 69 01 __ ADC #$01
0c7b : 85 4d __ STA T4 + 0 
0c7d : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0c80 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
0c83 : aa __ __ TAX
0c84 : 69 00 __ ADC #$00
0c86 : 85 4e __ STA T4 + 1 
0c88 : 8d 62 44 STA $4462 ; (zsm_pos + 1)
0c8b : 18 __ __ CLC
0c8c : a9 61 __ LDA #$61
0c8e : 65 4b __ ADC T3 + 0 
0c90 : 85 3b __ STA ACCU + 0 
0c92 : 8a __ __ TXA
0c93 : 29 03 __ AND #$03
0c95 : 69 40 __ ADC #$40
0c97 : 85 3c __ STA ACCU + 1 
0c99 : a0 00 __ LDY #$00
0c9b : b1 3b __ LDA (ACCU + 0),y 
0c9d : c9 40 __ CMP #$40
0c9f : b0 03 __ BCS $0ca4 ; (zsm_play.s12 + 0)
0ca1 : 4c 4f 0d JMP $0d4f ; (zsm_play.s11 + 0)
.s12:
0ca4 : d0 22 __ BNE $0cc8 ; (zsm_play.s15 + 0)
.s14:
0ca6 : 18 __ __ CLC
0ca7 : a9 61 __ LDA #$61
0ca9 : 65 4d __ ADC T4 + 0 
0cab : 85 4b __ STA T3 + 0 
0cad : a5 4e __ LDA T4 + 1 
0caf : 29 03 __ AND #$03
0cb1 : 69 40 __ ADC #$40
0cb3 : 85 4c __ STA T3 + 1 
0cb5 : b1 4b __ LDA (T3 + 0),y 
0cb7 : 29 3f __ AND #$3f
0cb9 : 18 __ __ CLC
0cba : 65 4d __ ADC T4 + 0 
0cbc : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0cbf : 98 __ __ TYA
0cc0 : 65 4e __ ADC T4 + 1 
0cc2 : 8d 62 44 STA $4462 ; (zsm_pos + 1)
0cc5 : 4c 73 0c JMP $0c73 ; (zsm_play.l8 + 0)
.s15:
0cc8 : 09 00 __ ORA #$00
0cca : 30 5b __ BMI $0d27 ; (zsm_play.s18 + 0)
.s17:
0ccc : 29 3f __ AND #$3f
0cce : f0 a3 __ BEQ $0c73 ; (zsm_play.l8 + 0)
.s29:
0cd0 : 84 50 __ STY T7 + 0 
0cd2 : 85 4f __ STA T6 + 0 
0cd4 : 18 __ __ CLC
.l1012:
0cd5 : a9 61 __ LDA #$61
0cd7 : 6d 61 44 ADC $4461 ; (zsm_pos + 0)
0cda : 85 4d __ STA T4 + 0 
0cdc : ad 62 44 LDA $4462 ; (zsm_pos + 1)
0cdf : 29 03 __ AND #$03
0ce1 : 69 40 __ ADC #$40
0ce3 : 85 4e __ STA T4 + 1 
0ce5 : a0 00 __ LDY #$00
0ce7 : b1 4d __ LDA (T4 + 0),y 
0ce9 : 85 2d __ STA P0 
0ceb : ad 61 44 LDA $4461 ; (zsm_pos + 0)
0cee : 18 __ __ CLC
0cef : 69 01 __ ADC #$01
0cf1 : aa __ __ TAX
0cf2 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
0cf5 : 69 00 __ ADC #$00
0cf7 : 29 03 __ AND #$03
0cf9 : 85 4c __ STA T3 + 1 
0cfb : 8a __ __ TXA
0cfc : 18 __ __ CLC
0cfd : 69 61 __ ADC #$61
0cff : 85 4b __ STA T3 + 0 
0d01 : a9 40 __ LDA #$40
0d03 : 65 4c __ ADC T3 + 1 
0d05 : 85 4c __ STA T3 + 1 
0d07 : b1 4b __ LDA (T3 + 0),y 
0d09 : 85 2e __ STA P1 
0d0b : 20 88 0d JSR $0d88 ; (sfx_put.l1 + 0)
0d0e : ad 61 44 LDA $4461 ; (zsm_pos + 0)
0d11 : 18 __ __ CLC
0d12 : 69 02 __ ADC #$02
0d14 : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0d17 : 90 03 __ BCC $0d1c ; (zsm_play.s1015 + 0)
.s1014:
0d19 : ee 62 44 INC $4462 ; (zsm_pos + 1)
.s1015:
0d1c : e6 50 __ INC T7 + 0 
0d1e : a5 50 __ LDA T7 + 0 
0d20 : c5 4f __ CMP T6 + 0 
0d22 : 90 b1 __ BCC $0cd5 ; (zsm_play.l1012 + 0)
0d24 : 4c 73 0c JMP $0c73 ; (zsm_play.l8 + 0)
.s18:
0d27 : c9 80 __ CMP #$80
0d29 : d0 07 __ BNE $0d32 ; (zsm_play.s25 + 0)
.s24:
0d2b : a9 01 __ LDA #$01
0d2d : 8d e3 1c STA $1ce3 ; (zsm_finished + 0)
0d30 : d0 08 __ BNE $0d3a ; (zsm_play.s10 + 0)
.s25:
0d32 : 29 7f __ AND #$7f
0d34 : 38 __ __ SEC
0d35 : e9 01 __ SBC #$01
0d37 : 8d 60 40 STA $4060 ; (zsm_delay + 0)
.s10:
0d3a : a5 49 __ LDA T2 + 0 
0d3c : 8d 20 9f STA $9f20 
0d3f : a5 4a __ LDA T2 + 1 
0d41 : 8d 21 9f STA $9f21 
0d44 : a5 48 __ LDA T1 + 0 
0d46 : 8d 22 9f STA $9f22 
0d49 : a5 47 __ LDA T0 + 0 
0d4b : 8d 25 9f STA $9f25 
.s1001:
0d4e : 60 __ __ RTS
.s11:
0d4f : 29 3f __ AND #$3f
0d51 : 09 c0 __ ORA #$c0
0d53 : 8d 20 9f STA $9f20 
0d56 : a9 f9 __ LDA #$f9
0d58 : 8d 21 9f STA $9f21 
0d5b : a9 01 __ LDA #$01
0d5d : 8d 22 9f STA $9f22 
0d60 : a5 4b __ LDA T3 + 0 
0d62 : 69 02 __ ADC #$02
0d64 : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0d67 : 90 01 __ BCC $0d6a ; (zsm_play.s1017 + 0)
.s1016:
0d69 : e8 __ __ INX
.s1017:
0d6a : 8e 62 44 STX $4462 ; (zsm_pos + 1)
0d6d : 18 __ __ CLC
0d6e : a9 61 __ LDA #$61
0d70 : 65 4d __ ADC T4 + 0 
0d72 : 85 4b __ STA T3 + 0 
0d74 : a5 4e __ LDA T4 + 1 
0d76 : 29 03 __ AND #$03
0d78 : 69 40 __ ADC #$40
0d7a : 85 4c __ STA T3 + 1 
0d7c : b1 4b __ LDA (T3 + 0),y 
0d7e : 8d 23 9f STA $9f23 
0d81 : 4c 73 0c JMP $0c73 ; (zsm_play.l8 + 0)
.s4:
0d84 : ce 60 40 DEC $4060 ; (zsm_delay + 0)
0d87 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1ce4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
4060 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
4061 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
4461 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0d88 : ad 41 9f LDA $9f41 
0d8b : 30 fb __ BMI $0d88 ; (sfx_put.l1 + 0)
.s3:
0d8d : a5 2d __ LDA P0 ; (index + 0)
0d8f : 8d 40 9f STA $9f40 
0d92 : ea __ __ NOP
0d93 : ea __ __ NOP
0d94 : ea __ __ NOP
0d95 : ea __ __ NOP
0d96 : a5 2e __ LDA P1 ; (data + 0)
0d98 : 8d 41 9f STA $9f41 
.s1001:
0d9b : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0d9c : a9 93 __ LDA #$93
0d9e : 85 2d __ STA P0 
0da0 : a9 00 __ LDA #$00
0da2 : 85 2e __ STA P1 
0da4 : 20 d9 0d JSR $0dd9 ; (putch.s0 + 0)
0da7 : a9 11 __ LDA #$11
0da9 : 8d 22 9f STA $9f22 
0dac : a2 00 __ LDX #$00
.l2:
0dae : 8a __ __ TXA
0daf : 18 __ __ CLC
0db0 : 69 b0 __ ADC #$b0
0db2 : 8d 21 9f STA $9f21 
0db5 : a9 00 __ LDA #$00
0db7 : 8d 20 9f STA $9f20 
0dba : a0 80 __ LDY #$80
.l1003:
0dbc : a9 20 __ LDA #$20
0dbe : 8d 23 9f STA $9f23 
0dc1 : a9 01 __ LDA #$01
0dc3 : 8d 23 9f STA $9f23 
0dc6 : a9 20 __ LDA #$20
0dc8 : 8d 24 9f STA $9f24 
0dcb : a9 01 __ LDA #$01
0dcd : 8d 24 9f STA $9f24 
0dd0 : 88 __ __ DEY
0dd1 : d0 e9 __ BNE $0dbc ; (ClearVERAScreen.l1003 + 0)
.s1004:
0dd3 : e8 __ __ INX
0dd4 : e0 40 __ CPX #$40
0dd6 : 90 d6 __ BCC $0dae ; (ClearVERAScreen.l2 + 0)
.s1001:
0dd8 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0dd9 : a5 2d __ LDA P0 
0ddb : 20 d2 ff JSR $ffd2 
.s1001:
0dde : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0ddf : a9 00 __ LDA #$00
0de1 : 85 2d __ STA P0 
0de3 : 85 2e __ STA P1 
0de5 : 85 2f __ STA P2 
0de7 : 85 30 __ STA P3 
0de9 : 85 31 __ STA P4 
0deb : 8d 25 9f STA $9f25 
0dee : ad 29 9f LDA $9f29 
0df1 : 09 70 __ ORA #$70
0df3 : 8d 29 9f STA $9f29 
0df6 : a9 80 __ LDA #$80
0df8 : 8d 2b 9f STA $9f2b 
0dfb : 8d 2a 9f STA $9f2a 
0dfe : a9 62 __ LDA #$62
0e00 : 8d 2d 9f STA $9f2d 
0e03 : a9 68 __ LDA #$68
0e05 : 8d 34 9f STA $9f34 
0e08 : 20 58 16 JSR $1658 ; (tileBaseConfig.s0 + 0)
0e0b : 8d 2f 9f STA $9f2f 
0e0e : a9 20 __ LDA #$20
0e10 : 85 2f __ STA P2 
0e12 : 20 71 16 JSR $1671 ; (memoryToMapMemoryAddress.s0 + 0)
0e15 : 8d 2e 9f STA $9f2e 
0e18 : a9 21 __ LDA #$21
0e1a : 8d 22 9f STA $9f22 
0e1d : a2 80 __ LDX #$80
.l6:
0e1f : a0 50 __ LDY #$50
.l1025:
0e21 : a9 00 __ LDA #$00
0e23 : 8d 24 9f STA $9f24 
0e26 : a9 08 __ LDA #$08
0e28 : 8d 24 9f STA $9f24 
0e2b : 88 __ __ DEY
0e2c : d0 f3 __ BNE $0e21 ; (SetUpSprites.l1025 + 0)
.s1026:
0e2e : ca __ __ DEX
0e2f : d0 ee __ BNE $0e1f ; (SetUpSprites.l6 + 0)
.s4:
0e31 : a9 00 __ LDA #$00
0e33 : 85 2d __ STA P0 
0e35 : 85 2e __ STA P1 
0e37 : 85 2f __ STA P2 
0e39 : 85 30 __ STA P3 
0e3b : 85 33 __ STA P6 
0e3d : a9 01 __ LDA #$01
0e3f : 85 34 __ STA P7 
0e41 : a9 00 __ LDA #$00
0e43 : 85 31 __ STA P4 
0e45 : a9 1d __ LDA #$1d
0e47 : 85 32 __ STA P5 
0e49 : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
0e4c : a9 10 __ LDA #$10
0e4e : 8d 22 9f STA $9f22 
0e51 : a9 00 __ LDA #$00
0e53 : 8d 20 9f STA $9f20 
0e56 : a9 20 __ LDA #$20
0e58 : 8d 21 9f STA $9f21 
0e5b : a9 3c __ LDA #$3c
0e5d : 85 47 __ STA T1 + 0 
.l10:
0e5f : a9 00 __ LDA #$00
0e61 : 85 48 __ STA T2 + 0 
.l14:
0e63 : 20 ba 16 JSR $16ba ; (rand.s0 + 0)
0e66 : a5 3b __ LDA ACCU + 0 
0e68 : 29 1f __ AND #$1f
0e6a : c9 1f __ CMP #$1f
0e6c : a5 48 __ LDA T2 + 0 
0e6e : 90 03 __ BCC $0e73 ; (SetUpSprites.s1023 + 0)
0e70 : 4c 22 16 JMP $1622 ; (SetUpSprites.s1017 + 0)
.s1023:
0e73 : c9 09 __ CMP #$09
0e75 : 90 06 __ BCC $0e7d ; (SetUpSprites.s20 + 0)
.s1022:
0e77 : a9 45 __ LDA #$45
0e79 : c5 48 __ CMP T2 + 0 
0e7b : b0 04 __ BCS $0e81 ; (SetUpSprites.s1021 + 0)
.s20:
0e7d : a9 00 __ LDA #$00
0e7f : f0 2f __ BEQ $0eb0 ; (SetUpSprites.s174 + 0)
.s1021:
0e81 : a5 48 __ LDA T2 + 0 
0e83 : c9 13 __ CMP #$13
0e85 : 90 06 __ BCC $0e8d ; (SetUpSprites.s24 + 0)
.s1020:
0e87 : a9 3b __ LDA #$3b
0e89 : c5 48 __ CMP T2 + 0 
0e8b : b0 04 __ BCS $0e91 ; (SetUpSprites.s1019 + 0)
.s24:
0e8d : a9 01 __ LDA #$01
0e8f : d0 12 __ BNE $0ea3 ; (SetUpSprites.s184 + 0)
.s1019:
0e91 : a5 48 __ LDA T2 + 0 
0e93 : c9 1d __ CMP #$1d
0e95 : 90 06 __ BCC $0e9d ; (SetUpSprites.s28 + 0)
.s1018:
0e97 : a9 31 __ LDA #$31
0e99 : c5 48 __ CMP T2 + 0 
0e9b : b0 04 __ BCS $0ea1 ; (SetUpSprites.s29 + 0)
.s28:
0e9d : a9 02 __ LDA #$02
0e9f : d0 02 __ BNE $0ea3 ; (SetUpSprites.s184 + 0)
.s29:
0ea1 : a9 03 __ LDA #$03
.s184:
0ea3 : 8d 23 9f STA $9f23 
0ea6 : a9 00 __ LDA #$00
0ea8 : 8d 23 9f STA $9f23 
0eab : e6 48 __ INC T2 + 0 
0ead : 4c 63 0e JMP $0e63 ; (SetUpSprites.l14 + 0)
.s174:
0eb0 : 8d 23 9f STA $9f23 
0eb3 : a9 00 __ LDA #$00
0eb5 : 8d 23 9f STA $9f23 
0eb8 : e6 48 __ INC T2 + 0 
0eba : 10 a7 __ BPL $0e63 ; (SetUpSprites.l14 + 0)
.s11:
0ebc : c6 47 __ DEC T1 + 0 
0ebe : a5 47 __ LDA T1 + 0 
0ec0 : d0 9d __ BNE $0e5f ; (SetUpSprites.l10 + 0)
.s12:
0ec2 : 85 2d __ STA P0 
0ec4 : 85 30 __ STA P3 
0ec6 : 85 33 __ STA P6 
0ec8 : a9 31 __ LDA #$31
0eca : 85 2e __ STA P1 
0ecc : a9 01 __ LDA #$01
0ece : 85 2f __ STA P2 
0ed0 : a9 04 __ LDA #$04
0ed2 : 85 34 __ STA P7 
0ed4 : a9 00 __ LDA #$00
0ed6 : 85 31 __ STA P4 
0ed8 : a9 1e __ LDA #$1e
0eda : 85 32 __ STA P5 
0edc : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
0edf : a9 00 __ LDA #$00
0ee1 : 85 4e __ STA T5 + 0 
0ee3 : 85 4f __ STA T5 + 1 
.l45:
0ee5 : 85 2d __ STA P0 
0ee7 : 18 __ __ CLC
0ee8 : 69 02 __ ADC #$02
0eea : 85 4c __ STA T4 + 0 
0eec : a9 00 __ LDA #$00
0eee : 2a __ __ ROL
0eef : 85 4d __ STA T4 + 1 
0ef1 : a9 88 __ LDA #$88
0ef3 : 85 2e __ STA P1 
0ef5 : a9 09 __ LDA #$09
0ef7 : 85 2f __ STA P2 
0ef9 : a9 00 __ LDA #$00
0efb : 85 30 __ STA P3 
0efd : a9 03 __ LDA #$03
0eff : 85 31 __ STA P4 
0f01 : a9 02 __ LDA #$02
0f03 : 85 32 __ STA P5 
0f05 : 85 33 __ STA P6 
0f07 : a9 01 __ LDA #$01
0f09 : 85 34 __ STA P7 
0f0b : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
0f0e : a5 4e __ LDA T5 + 0 
0f10 : 85 2e __ STA P1 
0f12 : a5 4f __ LDA T5 + 1 
0f14 : 85 2f __ STA P2 
0f16 : a9 90 __ LDA #$90
0f18 : 85 30 __ STA P3 
0f1a : a9 01 __ LDA #$01
0f1c : 85 31 __ STA P4 
0f1e : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
0f21 : a9 00 __ LDA #$00
0f23 : 85 2e __ STA P1 
0f25 : a9 01 __ LDA #$01
0f27 : 85 2f __ STA P2 
0f29 : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
0f2c : a9 88 __ LDA #$88
0f2e : 85 2e __ STA P1 
0f30 : a9 09 __ LDA #$09
0f32 : 85 2f __ STA P2 
0f34 : a9 00 __ LDA #$00
0f36 : 85 30 __ STA P3 
0f38 : a9 03 __ LDA #$03
0f3a : 85 31 __ STA P4 
0f3c : e6 2d __ INC P0 
0f3e : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
0f41 : a5 4e __ LDA T5 + 0 
0f43 : 85 2e __ STA P1 
0f45 : a5 4f __ LDA T5 + 1 
0f47 : 85 2f __ STA P2 
0f49 : a9 70 __ LDA #$70
0f4b : 85 30 __ STA P3 
0f4d : a9 01 __ LDA #$01
0f4f : 85 31 __ STA P4 
0f51 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
0f54 : a5 4d __ LDA T4 + 1 
0f56 : d0 16 __ BNE $0f6e ; (SetUpSprites.s47 + 0)
.s1013:
0f58 : 18 __ __ CLC
0f59 : a5 2e __ LDA P1 
0f5b : 69 40 __ ADC #$40
0f5d : 85 4e __ STA T5 + 0 
0f5f : a5 2f __ LDA P2 
0f61 : 69 00 __ ADC #$00
0f63 : 85 4f __ STA T5 + 1 
0f65 : a5 4c __ LDA T4 + 0 
0f67 : c9 14 __ CMP #$14
0f69 : b0 03 __ BCS $0f6e ; (SetUpSprites.s47 + 0)
0f6b : 4c e5 0e JMP $0ee5 ; (SetUpSprites.l45 + 0)
.s47:
0f6e : a9 00 __ LDA #$00
0f70 : 85 2d __ STA P0 
0f72 : 85 30 __ STA P3 
0f74 : 85 33 __ STA P6 
0f76 : a9 30 __ LDA #$30
0f78 : 85 2e __ STA P1 
0f7a : a9 01 __ LDA #$01
0f7c : 85 2f __ STA P2 
0f7e : a9 00 __ LDA #$00
0f80 : 85 31 __ STA P4 
0f82 : a9 22 __ LDA #$22
0f84 : 85 32 __ STA P5 
0f86 : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
0f89 : a9 16 __ LDA #$16
0f8b : 85 2d __ STA P0 
0f8d : a9 80 __ LDA #$80
0f8f : 85 2e __ STA P1 
0f91 : a9 09 __ LDA #$09
0f93 : 85 2f __ STA P2 
0f95 : a9 01 __ LDA #$01
0f97 : 85 31 __ STA P4 
0f99 : 85 34 __ STA P7 
0f9b : a9 02 __ LDA #$02
0f9d : 85 32 __ STA P5 
0f9f : a9 03 __ LDA #$03
0fa1 : 85 33 __ STA P6 
0fa3 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
0fa6 : a9 30 __ LDA #$30
0fa8 : 85 2e __ STA P1 
0faa : a9 01 __ LDA #$01
0fac : 85 2f __ STA P2 
0fae : a9 b8 __ LDA #$b8
0fb0 : 85 30 __ STA P3 
0fb2 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
0fb5 : a9 20 __ LDA #$20
0fb7 : 85 2d __ STA P0 
0fb9 : a9 35 __ LDA #$35
0fbb : 85 2e __ STA P1 
0fbd : a9 00 __ LDA #$00
0fbf : 85 30 __ STA P3 
0fc1 : 85 33 __ STA P6 
0fc3 : a9 02 __ LDA #$02
0fc5 : 85 34 __ STA P7 
0fc7 : a9 00 __ LDA #$00
0fc9 : 85 31 __ STA P4 
0fcb : a9 23 __ LDA #$23
0fcd : 85 32 __ STA P5 
0fcf : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
0fd2 : a9 17 __ LDA #$17
0fd4 : 85 2d __ STA P0 
0fd6 : a9 a9 __ LDA #$a9
0fd8 : 85 2e __ STA P1 
0fda : a9 09 __ LDA #$09
0fdc : 85 2f __ STA P2 
0fde : a9 02 __ LDA #$02
0fe0 : 85 31 __ STA P4 
0fe2 : 85 32 __ STA P5 
0fe4 : a9 03 __ LDA #$03
0fe6 : 85 33 __ STA P6 
0fe8 : a9 01 __ LDA #$01
0fea : 85 34 __ STA P7 
0fec : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
0fef : a9 fc __ LDA #$fc
0ff1 : 85 2e __ STA P1 
0ff3 : a9 00 __ LDA #$00
0ff5 : 85 2f __ STA P2 
0ff7 : a9 b8 __ LDA #$b8
0ff9 : 85 30 __ STA P3 
0ffb : a9 01 __ LDA #$01
0ffd : 85 31 __ STA P4 
0fff : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1002 : a9 18 __ LDA #$18
1004 : 85 2d __ STA P0 
1006 : a9 a9 __ LDA #$a9
1008 : 85 2e __ STA P1 
100a : a9 09 __ LDA #$09
100c : 85 2f __ STA P2 
100e : a9 00 __ LDA #$00
1010 : 85 30 __ STA P3 
1012 : a9 02 __ LDA #$02
1014 : 85 31 __ STA P4 
1016 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1019 : a9 4c __ LDA #$4c
101b : 85 2e __ STA P1 
101d : a9 01 __ LDA #$01
101f : 85 2f __ STA P2 
1021 : 85 31 __ STA P4 
1023 : a9 b8 __ LDA #$b8
1025 : 85 30 __ STA P3 
1027 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
102a : a9 01 __ LDA #$01
102c : 85 2e __ STA P1 
102e : a9 00 __ LDA #$00
1030 : 85 2f __ STA P2 
1032 : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
1035 : a9 10 __ LDA #$10
1037 : 85 2d __ STA P0 
1039 : a9 20 __ LDA #$20
103b : 85 30 __ STA P3 
103d : a9 00 __ LDA #$00
103f : 85 31 __ STA P4 
1041 : a9 00 __ LDA #$00
1043 : 85 2e __ STA P1 
1045 : a9 25 __ LDA #$25
1047 : 85 2f __ STA P2 
1049 : 20 b4 17 JSR $17b4 ; (vera_pal_putn.s0 + 0)
104c : a9 00 __ LDA #$00
104e : 85 2d __ STA P0 
1050 : 85 30 __ STA P3 
1052 : 85 34 __ STA P7 
1054 : a9 35 __ LDA #$35
1056 : 85 2e __ STA P1 
1058 : a9 01 __ LDA #$01
105a : 85 2f __ STA P2 
105c : a9 20 __ LDA #$20
105e : 85 33 __ STA P6 
1060 : a9 20 __ LDA #$20
1062 : 85 31 __ STA P4 
1064 : a9 25 __ LDA #$25
1066 : 85 32 __ STA P5 
1068 : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
106b : a9 00 __ LDA #$00
106d : 85 47 __ STA T1 + 0 
106f : 85 48 __ STA T2 + 0 
1071 : a9 03 __ LDA #$03
1073 : 85 33 __ STA P6 
1075 : a9 02 __ LDA #$02
1077 : 85 34 __ STA P7 
1079 : 18 __ __ CLC
.l1039:
107a : a9 a8 __ LDA #$a8
107c : 85 2e __ STA P1 
107e : a9 09 __ LDA #$09
1080 : 85 2f __ STA P2 
1082 : a9 00 __ LDA #$00
1084 : 85 30 __ STA P3 
1086 : 85 31 __ STA P4 
1088 : 85 32 __ STA P5 
108a : a5 47 __ LDA T1 + 0 
108c : 69 19 __ ADC #$19
108e : 85 2d __ STA P0 
1090 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1093 : a9 b8 __ LDA #$b8
1095 : 85 30 __ STA P3 
1097 : a9 01 __ LDA #$01
1099 : 85 31 __ STA P4 
109b : 38 __ __ SEC
109c : a5 48 __ LDA T2 + 0 
109e : e9 fc __ SBC #$fc
10a0 : 85 2e __ STA P1 
10a2 : a9 00 __ LDA #$00
10a4 : e9 03 __ SBC #$03
10a6 : 85 2f __ STA P2 
10a8 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
10ab : 18 __ __ CLC
10ac : a5 48 __ LDA T2 + 0 
10ae : 69 0c __ ADC #$0c
10b0 : 85 48 __ STA T2 + 0 
10b2 : e6 47 __ INC T1 + 0 
10b4 : a5 47 __ LDA T1 + 0 
10b6 : c9 08 __ CMP #$08
10b8 : 90 c0 __ BCC $107a ; (SetUpSprites.l1039 + 0)
.s51:
10ba : a9 00 __ LDA #$00
10bc : 85 47 __ STA T1 + 0 
10be : 85 48 __ STA T2 + 0 
10c0 : a9 03 __ LDA #$03
10c2 : 85 33 __ STA P6 
10c4 : 85 34 __ STA P7 
10c6 : 18 __ __ CLC
.l1041:
10c7 : a9 a8 __ LDA #$a8
10c9 : 85 2e __ STA P1 
10cb : a9 09 __ LDA #$09
10cd : 85 2f __ STA P2 
10cf : a9 00 __ LDA #$00
10d1 : 85 30 __ STA P3 
10d3 : 85 31 __ STA P4 
10d5 : a5 47 __ LDA T1 + 0 
10d7 : 69 21 __ ADC #$21
10d9 : 85 2d __ STA P0 
10db : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
10de : a9 c4 __ LDA #$c4
10e0 : 85 30 __ STA P3 
10e2 : a9 01 __ LDA #$01
10e4 : 85 31 __ STA P4 
10e6 : 38 __ __ SEC
10e7 : a5 48 __ LDA T2 + 0 
10e9 : e9 fc __ SBC #$fc
10eb : 85 2e __ STA P1 
10ed : a9 00 __ LDA #$00
10ef : e9 03 __ SBC #$03
10f1 : 85 2f __ STA P2 
10f3 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
10f6 : 18 __ __ CLC
10f7 : a5 48 __ LDA T2 + 0 
10f9 : 69 0c __ ADC #$0c
10fb : 85 48 __ STA T2 + 0 
10fd : e6 47 __ INC T1 + 0 
10ff : a5 47 __ LDA T1 + 0 
1101 : c9 08 __ CMP #$08
1103 : 90 c2 __ BCC $10c7 ; (SetUpSprites.l1041 + 0)
.s55:
1105 : a9 00 __ LDA #$00
1107 : 85 47 __ STA T1 + 0 
1109 : 85 48 __ STA T2 + 0 
110b : a9 03 __ LDA #$03
110d : 85 33 __ STA P6 
110f : a9 04 __ LDA #$04
1111 : 85 34 __ STA P7 
1113 : 18 __ __ CLC
.l1043:
1114 : a9 a8 __ LDA #$a8
1116 : 85 2e __ STA P1 
1118 : a9 09 __ LDA #$09
111a : 85 2f __ STA P2 
111c : a9 00 __ LDA #$00
111e : 85 30 __ STA P3 
1120 : 85 31 __ STA P4 
1122 : a5 47 __ LDA T1 + 0 
1124 : 69 29 __ ADC #$29
1126 : 85 2d __ STA P0 
1128 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
112b : a9 b8 __ LDA #$b8
112d : 85 30 __ STA P3 
112f : a9 01 __ LDA #$01
1131 : 85 31 __ STA P4 
1133 : 38 __ __ SEC
1134 : a9 6c __ LDA #$6c
1136 : e5 48 __ SBC T2 + 0 
1138 : 85 2e __ STA P1 
113a : a9 02 __ LDA #$02
113c : e9 04 __ SBC #$04
113e : 85 2f __ STA P2 
1140 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1143 : 18 __ __ CLC
1144 : a5 48 __ LDA T2 + 0 
1146 : 69 0c __ ADC #$0c
1148 : 85 48 __ STA T2 + 0 
114a : e6 47 __ INC T1 + 0 
114c : a5 47 __ LDA T1 + 0 
114e : c9 08 __ CMP #$08
1150 : 90 c2 __ BCC $1114 ; (SetUpSprites.l1043 + 0)
.s59:
1152 : a9 00 __ LDA #$00
1154 : 85 47 __ STA T1 + 0 
.l61:
1156 : 38 __ __ SEC
1157 : a9 00 __ LDA #$00
1159 : e5 47 __ SBC T1 + 0 
115b : 29 0c __ AND #$0c
115d : 49 ff __ EOR #$ff
115f : 38 __ __ SEC
1160 : 69 6c __ ADC #$6c
1162 : 85 48 __ STA T2 + 0 
1164 : a9 02 __ LDA #$02
1166 : e9 00 __ SBC #$00
1168 : 85 49 __ STA T2 + 1 
116a : 18 __ __ CLC
116b : a5 47 __ LDA T1 + 0 
116d : 69 31 __ ADC #$31
116f : 85 2d __ STA P0 
1171 : a9 02 __ LDA #$02
1173 : 85 50 __ STA T7 + 0 
1175 : a9 03 __ LDA #$03
1177 : 85 33 __ STA P6 
1179 : a9 04 __ LDA #$04
117b : 85 34 __ STA P7 
.l1033:
117d : a9 a8 __ LDA #$a8
117f : 85 2e __ STA P1 
1181 : a9 09 __ LDA #$09
1183 : 85 2f __ STA P2 
1185 : a9 00 __ LDA #$00
1187 : 85 30 __ STA P3 
1189 : 85 31 __ STA P4 
118b : 85 32 __ STA P5 
118d : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1190 : a5 48 __ LDA T2 + 0 
1192 : 85 2e __ STA P1 
1194 : a5 49 __ LDA T2 + 1 
1196 : 85 2f __ STA P2 
1198 : a9 b8 __ LDA #$b8
119a : 85 30 __ STA P3 
119c : a9 01 __ LDA #$01
119e : 85 31 __ STA P4 
11a0 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
11a3 : c6 50 __ DEC T7 + 0 
11a5 : d0 d6 __ BNE $117d ; (SetUpSprites.l1033 + 0)
.s62:
11a7 : e6 47 __ INC T1 + 0 
11a9 : a5 47 __ LDA T1 + 0 
11ab : c9 02 __ CMP #$02
11ad : 90 a7 __ BCC $1156 ; (SetUpSprites.l61 + 0)
.s63:
11af : a9 60 __ LDA #$60
11b1 : 85 2d __ STA P0 
11b3 : a9 4f __ LDA #$4f
11b5 : 85 2e __ STA P1 
11b7 : a9 01 __ LDA #$01
11b9 : 85 2f __ STA P2 
11bb : 85 34 __ STA P7 
11bd : a9 00 __ LDA #$00
11bf : 85 30 __ STA P3 
11c1 : 85 33 __ STA P6 
11c3 : a9 00 __ LDA #$00
11c5 : 85 31 __ STA P4 
11c7 : a9 26 __ LDA #$26
11c9 : 85 32 __ STA P5 
11cb : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
11ce : a9 33 __ LDA #$33
11d0 : 85 2d __ STA P0 
11d2 : a9 7b __ LDA #$7b
11d4 : 85 2e __ STA P1 
11d6 : a9 0a __ LDA #$0a
11d8 : 85 2f __ STA P2 
11da : a9 01 __ LDA #$01
11dc : 85 31 __ STA P4 
11de : a9 02 __ LDA #$02
11e0 : 85 32 __ STA P5 
11e2 : a9 03 __ LDA #$03
11e4 : 85 33 __ STA P6 
11e6 : 85 34 __ STA P7 
11e8 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
11eb : a9 34 __ LDA #$34
11ed : 85 2e __ STA P1 
11ef : a9 01 __ LDA #$01
11f1 : 85 2f __ STA P2 
11f3 : a9 78 __ LDA #$78
11f5 : 85 30 __ STA P3 
11f7 : a9 00 __ LDA #$00
11f9 : 85 31 __ STA P4 
11fb : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
11fe : a9 20 __ LDA #$20
1200 : 85 2d __ STA P0 
1202 : a9 3f __ LDA #$3f
1204 : 85 2e __ STA P1 
1206 : a9 00 __ LDA #$00
1208 : 85 30 __ STA P3 
120a : 85 33 __ STA P6 
120c : a9 04 __ LDA #$04
120e : 85 34 __ STA P7 
1210 : a9 00 __ LDA #$00
1212 : 85 31 __ STA P4 
1214 : a9 27 __ LDA #$27
1216 : 85 32 __ STA P5 
1218 : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
121b : a9 34 __ LDA #$34
121d : 85 2d __ STA P0 
121f : a9 f9 __ LDA #$f9
1221 : 85 2e __ STA P1 
1223 : a9 09 __ LDA #$09
1225 : 85 2f __ STA P2 
1227 : a9 03 __ LDA #$03
1229 : 85 31 __ STA P4 
122b : 85 33 __ STA P6 
122d : a9 02 __ LDA #$02
122f : 85 32 __ STA P5 
1231 : a9 06 __ LDA #$06
1233 : 85 34 __ STA P7 
1235 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1238 : a9 1c __ LDA #$1c
123a : 85 2e __ STA P1 
123c : a9 01 __ LDA #$01
123e : 85 2f __ STA P2 
1240 : a9 78 __ LDA #$78
1242 : 85 30 __ STA P3 
1244 : a9 00 __ LDA #$00
1246 : 85 31 __ STA P4 
1248 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
124b : a9 35 __ LDA #$35
124d : 85 2d __ STA P0 
124f : a9 19 __ LDA #$19
1251 : 85 2e __ STA P1 
1253 : a9 0a __ LDA #$0a
1255 : 85 2f __ STA P2 
1257 : a9 00 __ LDA #$00
1259 : 85 30 __ STA P3 
125b : a9 02 __ LDA #$02
125d : 85 31 __ STA P4 
125f : a9 03 __ LDA #$03
1261 : 85 32 __ STA P5 
1263 : a9 07 __ LDA #$07
1265 : 85 33 __ STA P6 
1267 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
126a : a9 10 __ LDA #$10
126c : 85 2e __ STA P1 
126e : a9 01 __ LDA #$01
1270 : 85 2f __ STA P2 
1272 : a9 d8 __ LDA #$d8
1274 : 85 30 __ STA P3 
1276 : a9 00 __ LDA #$00
1278 : 85 31 __ STA P4 
127a : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
127d : a9 36 __ LDA #$36
127f : 85 2d __ STA P0 
1281 : a9 19 __ LDA #$19
1283 : 85 2e __ STA P1 
1285 : a9 0a __ LDA #$0a
1287 : 85 2f __ STA P2 
1289 : a9 00 __ LDA #$00
128b : 85 30 __ STA P3 
128d : a9 02 __ LDA #$02
128f : 85 31 __ STA P4 
1291 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1294 : a9 70 __ LDA #$70
1296 : 85 2e __ STA P1 
1298 : a9 01 __ LDA #$01
129a : 85 2f __ STA P2 
129c : a9 d8 __ LDA #$d8
129e : 85 30 __ STA P3 
12a0 : a9 00 __ LDA #$00
12a2 : 85 31 __ STA P4 
12a4 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
12a7 : a9 01 __ LDA #$01
12a9 : 85 2e __ STA P1 
12ab : a9 00 __ LDA #$00
12ad : 85 2f __ STA P2 
12af : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
12b2 : a9 37 __ LDA #$37
12b4 : 85 2d __ STA P0 
12b6 : a9 19 __ LDA #$19
12b8 : 85 2e __ STA P1 
12ba : a9 0a __ LDA #$0a
12bc : 85 2f __ STA P2 
12be : a9 00 __ LDA #$00
12c0 : 85 30 __ STA P3 
12c2 : a9 02 __ LDA #$02
12c4 : 85 31 __ STA P4 
12c6 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
12c9 : a9 10 __ LDA #$10
12cb : 85 2e __ STA P1 
12cd : a9 01 __ LDA #$01
12cf : 85 2f __ STA P2 
12d1 : 85 31 __ STA P4 
12d3 : a9 08 __ LDA #$08
12d5 : 85 30 __ STA P3 
12d7 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
12da : a9 00 __ LDA #$00
12dc : 85 2e __ STA P1 
12de : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
12e1 : a9 38 __ LDA #$38
12e3 : 85 2d __ STA P0 
12e5 : a9 19 __ LDA #$19
12e7 : 85 2e __ STA P1 
12e9 : a9 0a __ LDA #$0a
12eb : 85 2f __ STA P2 
12ed : a9 00 __ LDA #$00
12ef : 85 30 __ STA P3 
12f1 : a9 02 __ LDA #$02
12f3 : 85 31 __ STA P4 
12f5 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
12f8 : a9 70 __ LDA #$70
12fa : 85 2e __ STA P1 
12fc : a9 01 __ LDA #$01
12fe : 85 2f __ STA P2 
1300 : 85 31 __ STA P4 
1302 : a9 08 __ LDA #$08
1304 : 85 30 __ STA P3 
1306 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1309 : a9 01 __ LDA #$01
130b : 85 2e __ STA P1 
130d : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
1310 : a9 20 __ LDA #$20
1312 : 85 2d __ STA P0 
1314 : a9 37 __ LDA #$37
1316 : 85 2e __ STA P1 
1318 : a9 00 __ LDA #$00
131a : 85 30 __ STA P3 
131c : 85 33 __ STA P6 
131e : a9 08 __ LDA #$08
1320 : 85 34 __ STA P7 
1322 : a9 00 __ LDA #$00
1324 : 85 31 __ STA P4 
1326 : a9 2b __ LDA #$2b
1328 : 85 32 __ STA P5 
132a : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
132d : a9 00 __ LDA #$00
132f : 85 47 __ STA T1 + 0 
1331 : 85 48 __ STA T2 + 0 
1333 : 85 49 __ STA T2 + 1 
1335 : a9 02 __ LDA #$02
1337 : 85 33 __ STA P6 
1339 : a9 05 __ LDA #$05
133b : 85 34 __ STA P7 
133d : 18 __ __ CLC
.l1045:
133e : a9 b9 __ LDA #$b9
1340 : 85 2e __ STA P1 
1342 : a9 09 __ LDA #$09
1344 : 85 2f __ STA P2 
1346 : a9 00 __ LDA #$00
1348 : 85 30 __ STA P3 
134a : a9 03 __ LDA #$03
134c : 85 31 __ STA P4 
134e : 85 32 __ STA P5 
1350 : a5 47 __ LDA T1 + 0 
1352 : 69 39 __ ADC #$39
1354 : 85 2d __ STA P0 
1356 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1359 : a9 fa __ LDA #$fa
135b : 85 2e __ STA P1 
135d : a9 00 __ LDA #$00
135f : 85 2f __ STA P2 
1361 : 38 __ __ SEC
1362 : a5 48 __ LDA T2 + 0 
1364 : e9 20 __ SBC #$20
1366 : 85 4a __ STA T3 + 0 
1368 : 85 30 __ STA P3 
136a : a5 49 __ LDA T2 + 1 
136c : e9 00 __ SBC #$00
136e : 85 4b __ STA T3 + 1 
1370 : 85 31 __ STA P4 
1372 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1375 : a9 b9 __ LDA #$b9
1377 : 85 2e __ STA P1 
1379 : a9 09 __ LDA #$09
137b : 85 2f __ STA P2 
137d : a9 00 __ LDA #$00
137f : 85 30 __ STA P3 
1381 : a9 03 __ LDA #$03
1383 : 85 31 __ STA P4 
1385 : 18 __ __ CLC
1386 : a5 47 __ LDA T1 + 0 
1388 : 69 40 __ ADC #$40
138a : 85 2d __ STA P0 
138c : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
138f : a9 3a __ LDA #$3a
1391 : 85 2e __ STA P1 
1393 : a9 01 __ LDA #$01
1395 : 85 2f __ STA P2 
1397 : a5 4a __ LDA T3 + 0 
1399 : 85 30 __ STA P3 
139b : a5 4b __ LDA T3 + 1 
139d : 85 31 __ STA P4 
139f : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
13a2 : a9 01 __ LDA #$01
13a4 : 85 2e __ STA P1 
13a6 : a9 00 __ LDA #$00
13a8 : 85 2f __ STA P2 
13aa : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
13ad : 18 __ __ CLC
13ae : a5 48 __ LDA T2 + 0 
13b0 : 69 40 __ ADC #$40
13b2 : 85 48 __ STA T2 + 0 
13b4 : 90 02 __ BCC $13b8 ; (SetUpSprites.s1048 + 0)
.s1047:
13b6 : e6 49 __ INC T2 + 1 
.s1048:
13b8 : e6 47 __ INC T1 + 0 
13ba : a5 47 __ LDA T1 + 0 
13bc : c9 07 __ CMP #$07
13be : b0 03 __ BCS $13c3 ; (SetUpSprites.s71 + 0)
13c0 : 4c 3e 13 JMP $133e ; (SetUpSprites.l1045 + 0)
.s71:
13c3 : a9 20 __ LDA #$20
13c5 : 85 2d __ STA P0 
13c7 : a9 47 __ LDA #$47
13c9 : 85 2e __ STA P1 
13cb : a9 01 __ LDA #$01
13cd : 85 2f __ STA P2 
13cf : a9 00 __ LDA #$00
13d1 : 85 30 __ STA P3 
13d3 : 85 33 __ STA P6 
13d5 : a9 08 __ LDA #$08
13d7 : 85 34 __ STA P7 
13d9 : a9 00 __ LDA #$00
13db : 85 31 __ STA P4 
13dd : a9 33 __ LDA #$33
13df : 85 32 __ STA P5 
13e1 : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
13e4 : a9 47 __ LDA #$47
13e6 : 85 2d __ STA P0 
13e8 : a9 39 __ LDA #$39
13ea : 85 2e __ STA P1 
13ec : a9 0a __ LDA #$0a
13ee : 85 2f __ STA P2 
13f0 : a9 03 __ LDA #$03
13f2 : 85 31 __ STA P4 
13f4 : 85 32 __ STA P5 
13f6 : a9 07 __ LDA #$07
13f8 : 85 33 __ STA P6 
13fa : a9 06 __ LDA #$06
13fc : 85 34 __ STA P7 
13fe : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1401 : a9 08 __ LDA #$08
1403 : 85 2e __ STA P1 
1405 : 85 30 __ STA P3 
1407 : a9 00 __ LDA #$00
1409 : 85 2f __ STA P2 
140b : 85 31 __ STA P4 
140d : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1410 : a9 48 __ LDA #$48
1412 : 85 2d __ STA P0 
1414 : a9 39 __ LDA #$39
1416 : 85 2e __ STA P1 
1418 : a9 0a __ LDA #$0a
141a : 85 2f __ STA P2 
141c : a9 00 __ LDA #$00
141e : 85 30 __ STA P3 
1420 : a9 03 __ LDA #$03
1422 : 85 31 __ STA P4 
1424 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1427 : a9 48 __ LDA #$48
1429 : 85 2e __ STA P1 
142b : a9 00 __ LDA #$00
142d : 85 2f __ STA P2 
142f : 85 31 __ STA P4 
1431 : a9 08 __ LDA #$08
1433 : 85 30 __ STA P3 
1435 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1438 : a9 01 __ LDA #$01
143a : 85 2e __ STA P1 
143c : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
143f : a9 49 __ LDA #$49
1441 : 85 2d __ STA P0 
1443 : a9 39 __ LDA #$39
1445 : 85 2e __ STA P1 
1447 : a9 0a __ LDA #$0a
1449 : 85 2f __ STA P2 
144b : a9 00 __ LDA #$00
144d : 85 30 __ STA P3 
144f : a9 03 __ LDA #$03
1451 : 85 31 __ STA P4 
1453 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1456 : a9 48 __ LDA #$48
1458 : 85 2e __ STA P1 
145a : 85 30 __ STA P3 
145c : a9 00 __ LDA #$00
145e : 85 2f __ STA P2 
1460 : 85 31 __ STA P4 
1462 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1465 : a9 01 __ LDA #$01
1467 : 85 2e __ STA P1 
1469 : 85 2f __ STA P2 
146b : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
146e : a9 4a __ LDA #$4a
1470 : 85 2d __ STA P0 
1472 : a9 39 __ LDA #$39
1474 : 85 2e __ STA P1 
1476 : a9 0a __ LDA #$0a
1478 : 85 2f __ STA P2 
147a : a9 00 __ LDA #$00
147c : 85 30 __ STA P3 
147e : a9 03 __ LDA #$03
1480 : 85 31 __ STA P4 
1482 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1485 : a9 08 __ LDA #$08
1487 : 85 2e __ STA P1 
1489 : a9 00 __ LDA #$00
148b : 85 2f __ STA P2 
148d : 85 31 __ STA P4 
148f : a9 48 __ LDA #$48
1491 : 85 30 __ STA P3 
1493 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1496 : a9 00 __ LDA #$00
1498 : 85 2e __ STA P1 
149a : a9 01 __ LDA #$01
149c : 85 2f __ STA P2 
149e : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
14a1 : a9 20 __ LDA #$20
14a3 : 85 2d __ STA P0 
14a5 : a9 47 __ LDA #$47
14a7 : 85 2e __ STA P1 
14a9 : a9 00 __ LDA #$00
14ab : 85 30 __ STA P3 
14ad : a9 00 __ LDA #$00
14af : 85 31 __ STA P4 
14b1 : a9 33 __ LDA #$33
14b3 : 85 32 __ STA P5 
14b5 : a9 00 __ LDA #$00
14b7 : 85 33 __ STA P6 
14b9 : a9 08 __ LDA #$08
14bb : 85 34 __ STA P7 
14bd : 20 7f 16 JSR $167f ; (vram_putn.s0 + 0)
14c0 : a9 4b __ LDA #$4b
14c2 : 85 2d __ STA P0 
14c4 : a9 39 __ LDA #$39
14c6 : 85 2e __ STA P1 
14c8 : a9 0a __ LDA #$0a
14ca : 85 2f __ STA P2 
14cc : a9 03 __ LDA #$03
14ce : 85 31 __ STA P4 
14d0 : 85 32 __ STA P5 
14d2 : a9 07 __ LDA #$07
14d4 : 85 33 __ STA P6 
14d6 : a9 06 __ LDA #$06
14d8 : 85 34 __ STA P7 
14da : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
14dd : a9 f8 __ LDA #$f8
14df : 85 2e __ STA P1 
14e1 : a9 01 __ LDA #$01
14e3 : 85 2f __ STA P2 
14e5 : a9 08 __ LDA #$08
14e7 : 85 30 __ STA P3 
14e9 : a9 00 __ LDA #$00
14eb : 85 31 __ STA P4 
14ed : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
14f0 : a9 4c __ LDA #$4c
14f2 : 85 2d __ STA P0 
14f4 : a9 39 __ LDA #$39
14f6 : 85 2e __ STA P1 
14f8 : a9 0a __ LDA #$0a
14fa : 85 2f __ STA P2 
14fc : a9 00 __ LDA #$00
14fe : 85 30 __ STA P3 
1500 : a9 03 __ LDA #$03
1502 : 85 31 __ STA P4 
1504 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
1507 : a9 38 __ LDA #$38
1509 : 85 2e __ STA P1 
150b : a9 02 __ LDA #$02
150d : 85 2f __ STA P2 
150f : a9 08 __ LDA #$08
1511 : 85 30 __ STA P3 
1513 : a9 00 __ LDA #$00
1515 : 85 31 __ STA P4 
1517 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
151a : a9 01 __ LDA #$01
151c : 85 2e __ STA P1 
151e : a9 00 __ LDA #$00
1520 : 85 2f __ STA P2 
1522 : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
1525 : a9 4d __ LDA #$4d
1527 : 85 2d __ STA P0 
1529 : a9 39 __ LDA #$39
152b : 85 2e __ STA P1 
152d : a9 0a __ LDA #$0a
152f : 85 2f __ STA P2 
1531 : a9 00 __ LDA #$00
1533 : 85 30 __ STA P3 
1535 : a9 03 __ LDA #$03
1537 : 85 31 __ STA P4 
1539 : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
153c : a9 38 __ LDA #$38
153e : 85 2e __ STA P1 
1540 : a9 02 __ LDA #$02
1542 : 85 2f __ STA P2 
1544 : a9 48 __ LDA #$48
1546 : 85 30 __ STA P3 
1548 : a9 00 __ LDA #$00
154a : 85 31 __ STA P4 
154c : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
154f : a9 01 __ LDA #$01
1551 : 85 2e __ STA P1 
1553 : 85 2f __ STA P2 
1555 : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
1558 : a9 4e __ LDA #$4e
155a : 85 2d __ STA P0 
155c : a9 39 __ LDA #$39
155e : 85 2e __ STA P1 
1560 : a9 0a __ LDA #$0a
1562 : 85 2f __ STA P2 
1564 : a9 00 __ LDA #$00
1566 : 85 30 __ STA P3 
1568 : a9 03 __ LDA #$03
156a : 85 31 __ STA P4 
156c : 20 e1 16 JSR $16e1 ; (vera_spr_set.s0 + 0)
156f : a9 f8 __ LDA #$f8
1571 : 85 2e __ STA P1 
1573 : a9 01 __ LDA #$01
1575 : 85 2f __ STA P2 
1577 : a9 48 __ LDA #$48
1579 : 85 30 __ STA P3 
157b : a9 00 __ LDA #$00
157d : 85 31 __ STA P4 
157f : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1582 : a9 00 __ LDA #$00
1584 : 85 2e __ STA P1 
1586 : 20 77 17 JSR $1777 ; (vera_spr_flip.s0 + 0)
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
15a1 : a9 40 __ LDA #$40
15a3 : 85 35 __ STA P8 
15a5 : a9 25 __ LDA #$25
15a7 : 85 36 __ STA P9 
15a9 : 20 fd 17 JSR $17fd ; (SetPaletteColours.s0 + 0)
15ac : a9 60 __ LDA #$60
15ae : 8d fc 9e STA $9efc ; (sstack + 0)
15b1 : a9 fa __ LDA #$fa
15b3 : 8d fd 9e STA $9efd ; (sstack + 1)
15b6 : a9 01 __ LDA #$01
15b8 : 8d fe 9e STA $9efe ; (sstack + 2)
15bb : a9 00 __ LDA #$00
15bd : 8d ff 9e STA $9eff ; (sstack + 3)
15c0 : a9 60 __ LDA #$60
15c2 : 85 35 __ STA P8 
15c4 : a9 25 __ LDA #$25
15c6 : 85 36 __ STA P9 
15c8 : 20 fd 17 JSR $17fd ; (SetPaletteColours.s0 + 0)
15cb : a9 80 __ LDA #$80
15cd : 8d fc 9e STA $9efc ; (sstack + 0)
15d0 : a9 fa __ LDA #$fa
15d2 : 8d fd 9e STA $9efd ; (sstack + 1)
15d5 : a9 01 __ LDA #$01
15d7 : 8d fe 9e STA $9efe ; (sstack + 2)
15da : a9 00 __ LDA #$00
15dc : 8d ff 9e STA $9eff ; (sstack + 3)
15df : a9 80 __ LDA #$80
15e1 : 85 35 __ STA P8 
15e3 : a9 25 __ LDA #$25
15e5 : 85 36 __ STA P9 
15e7 : 20 fd 17 JSR $17fd ; (SetPaletteColours.s0 + 0)
15ea : a9 60 __ LDA #$60
15ec : 85 2d __ STA P0 
15ee : a9 0c __ LDA #$0c
15f0 : 85 30 __ STA P3 
15f2 : a9 00 __ LDA #$00
15f4 : 85 31 __ STA P4 
15f6 : a9 e7 __ LDA #$e7
15f8 : 85 2e __ STA P1 
15fa : a9 1c __ LDA #$1c
15fc : 85 2f __ STA P2 
15fe : 20 b4 17 JSR $17b4 ; (vera_pal_putn.s0 + 0)
1601 : a9 20 __ LDA #$20
1603 : 85 2d __ STA P0 
1605 : a9 43 __ LDA #$43
1607 : 85 2e __ STA P1 
1609 : a9 01 __ LDA #$01
160b : 85 2f __ STA P2 
160d : a9 00 __ LDA #$00
160f : 85 30 __ STA P3 
1611 : 85 33 __ STA P6 
1613 : a9 04 __ LDA #$04
1615 : 85 34 __ STA P7 
1617 : a9 00 __ LDA #$00
1619 : 85 31 __ STA P4 
161b : a9 3b __ LDA #$3b
161d : 85 32 __ STA P5 
161f : 4c 7f 16 JMP $167f ; (vram_putn.s0 + 0)
.s1017:
1622 : c9 09 __ CMP #$09
1624 : 90 06 __ BCC $162c ; (SetUpSprites.s32 + 0)
.s1016:
1626 : a9 45 __ LDA #$45
1628 : c5 48 __ CMP T2 + 0 
162a : b0 05 __ BCS $1631 ; (SetUpSprites.s1005 + 0)
.s32:
162c : a9 04 __ LDA #$04
162e : 4c b0 0e JMP $0eb0 ; (SetUpSprites.s174 + 0)
.s1005:
1631 : a5 48 __ LDA T2 + 0 
1633 : c9 13 __ CMP #$13
1635 : 90 06 __ BCC $163d ; (SetUpSprites.s36 + 0)
.s1004:
1637 : a9 3b __ LDA #$3b
1639 : c5 48 __ CMP T2 + 0 
163b : b0 05 __ BCS $1642 ; (SetUpSprites.s1003 + 0)
.s36:
163d : a9 05 __ LDA #$05
163f : 4c a3 0e JMP $0ea3 ; (SetUpSprites.s184 + 0)
.s1003:
1642 : a5 48 __ LDA T2 + 0 
1644 : c9 1d __ CMP #$1d
1646 : 90 06 __ BCC $164e ; (SetUpSprites.s40 + 0)
.s1002:
1648 : a9 31 __ LDA #$31
164a : c5 48 __ CMP T2 + 0 
164c : b0 05 __ BCS $1653 ; (SetUpSprites.s41 + 0)
.s40:
164e : a9 06 __ LDA #$06
1650 : 4c a3 0e JMP $0ea3 ; (SetUpSprites.s184 + 0)
.s41:
1653 : a9 07 __ LDA #$07
1655 : 4c a3 0e JMP $0ea3 ; (SetUpSprites.s184 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1658 : a5 2d __ LDA P0 ; (bank + 0)
165a : 4a __ __ LSR
165b : a9 00 __ LDA #$00
165d : 6a __ __ ROR
165e : 85 3b __ STA ACCU + 0 
1660 : a5 2f __ LDA P2 ; (mem + 1)
1662 : 29 f8 __ AND #$f8
1664 : 4a __ __ LSR
1665 : 05 3b __ ORA ACCU + 0 
1667 : 85 3b __ STA ACCU + 0 
1669 : a5 30 __ LDA P3 ; (height + 0)
166b : 0a __ __ ASL
166c : 05 3b __ ORA ACCU + 0 
166e : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1670 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1671 : a5 2d __ LDA P0 ; (bank + 0)
1673 : 4a __ __ LSR
1674 : a9 00 __ LDA #$00
1676 : 6a __ __ ROR
1677 : 85 3b __ STA ACCU + 0 
1679 : a5 2f __ LDA P2 ; (mem + 1)
167b : 4a __ __ LSR
167c : 05 3b __ ORA ACCU + 0 
.s1001:
167e : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
167f : ad 25 9f LDA $9f25 
1682 : 29 fe __ AND #$fe
1684 : 8d 25 9f STA $9f25 
1687 : a5 2d __ LDA P0 ; (addr + 0)
1689 : 8d 20 9f STA $9f20 
168c : a5 2e __ LDA P1 ; (addr + 1)
168e : 8d 21 9f STA $9f21 
1691 : a5 2f __ LDA P2 ; (addr + 2)
1693 : 29 01 __ AND #$01
1695 : 09 10 __ ORA #$10
1697 : 8d 22 9f STA $9f22 
169a : a5 33 __ LDA P6 ; (size + 0)
169c : 05 34 __ ORA P7 ; (size + 1)
169e : f0 19 __ BEQ $16b9 ; (vram_putn.s1001 + 0)
.s6:
16a0 : a0 00 __ LDY #$00
16a2 : a6 33 __ LDX P6 ; (size + 0)
16a4 : f0 02 __ BEQ $16a8 ; (vram_putn.l1002 + 0)
.s1005:
16a6 : e6 34 __ INC P7 ; (size + 1)
.l1002:
16a8 : b1 31 __ LDA (P4),y ; (data + 0)
16aa : 8d 23 9f STA $9f23 
16ad : c8 __ __ INY
16ae : d0 02 __ BNE $16b2 ; (vram_putn.s1009 + 0)
.s1008:
16b0 : e6 32 __ INC P5 ; (data + 1)
.s1009:
16b2 : ca __ __ DEX
16b3 : d0 f3 __ BNE $16a8 ; (vram_putn.l1002 + 0)
.s1004:
16b5 : c6 34 __ DEC P7 ; (size + 1)
16b7 : d0 ef __ BNE $16a8 ; (vram_putn.l1002 + 0)
.s1001:
16b9 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d20 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d30 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1d70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1d80 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1d90 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
1da0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
1db0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
1dc0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1dd0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1de0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
1df0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
16ba : ad e6 1c LDA $1ce6 ; (seed + 1)
16bd : 4a __ __ LSR
16be : ad e5 1c LDA $1ce5 ; (seed + 0)
16c1 : 6a __ __ ROR
16c2 : aa __ __ TAX
16c3 : a9 00 __ LDA #$00
16c5 : 6a __ __ ROR
16c6 : 4d e5 1c EOR $1ce5 ; (seed + 0)
16c9 : 85 3b __ STA ACCU + 0 
16cb : 8a __ __ TXA
16cc : 4d e6 1c EOR $1ce6 ; (seed + 1)
16cf : 85 3c __ STA ACCU + 1 
16d1 : 4a __ __ LSR
16d2 : 45 3b __ EOR ACCU + 0 
16d4 : 8d e5 1c STA $1ce5 ; (seed + 0)
16d7 : 85 3b __ STA ACCU + 0 
16d9 : 45 3c __ EOR ACCU + 1 
16db : 8d e6 1c STA $1ce6 ; (seed + 1)
16de : 85 3c __ STA ACCU + 1 
.s1001:
16e0 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1ce5 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e60 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e70 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e80 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e90 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ea0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1eb0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ec0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1ed0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1ee0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1ef0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1f00 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1f10 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1f20 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1f30 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1f40 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1f50 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1f60 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1f70 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1f80 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1f90 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1fa0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1fb0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1fc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1fd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1fe0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1ff0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2000 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2010 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2020 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2030 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2040 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2050 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2060 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2070 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2080 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2090 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20a0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20b0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20e0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20f0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2100 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
2110 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
2120 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
2130 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
2140 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
2150 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
2160 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
2170 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
2180 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
2190 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
21a0 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
21b0 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
21c0 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
21d0 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
21e0 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
21f0 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
16e1 : ad 25 9f LDA $9f25 
16e4 : 29 fe __ AND #$fe
16e6 : 8d 25 9f STA $9f25 
16e9 : a5 2d __ LDA P0 ; (spr + 0)
16eb : 0a __ __ ASL
16ec : 0a __ __ ASL
16ed : 85 3b __ STA ACCU + 0 
16ef : a9 3f __ LDA #$3f
16f1 : 2a __ __ ROL
16f2 : 06 3b __ ASL ACCU + 0 
16f4 : 2a __ __ ROL
16f5 : 8d 21 9f STA $9f21 
16f8 : a5 3b __ LDA ACCU + 0 
16fa : 8d 20 9f STA $9f20 
16fd : a9 11 __ LDA #$11
16ff : 8d 22 9f STA $9f22 
1702 : a5 30 __ LDA P3 ; (mode8 + 0)
1704 : f0 02 __ BEQ $1708 ; (vera_spr_set.s11 + 0)
.s9:
1706 : a9 80 __ LDA #$80
.s11:
1708 : 05 2f __ ORA P2 ; (addr32 + 1)
170a : a6 2e __ LDX P1 ; (addr32 + 0)
170c : 8e 23 9f STX $9f23 
170f : 8d 23 9f STA $9f23 
1712 : a9 00 __ LDA #$00
1714 : 8d 23 9f STA $9f23 
1717 : 8d 23 9f STA $9f23 
171a : 8d 23 9f STA $9f23 
171d : 8d 23 9f STA $9f23 
1720 : a5 33 __ LDA P6 ; (z + 0)
1722 : 0a __ __ ASL
1723 : 0a __ __ ASL
1724 : 8d 23 9f STA $9f23 
1727 : a5 32 __ LDA P5 ; (h + 0)
1729 : 4a __ __ LSR
172a : 6a __ __ ROR
172b : 29 80 __ AND #$80
172d : 6a __ __ ROR
172e : 85 3b __ STA ACCU + 0 
1730 : a5 31 __ LDA P4 ; (w + 0)
1732 : 0a __ __ ASL
1733 : 0a __ __ ASL
1734 : 0a __ __ ASL
1735 : 0a __ __ ASL
1736 : 05 3b __ ORA ACCU + 0 
1738 : 05 34 __ ORA P7 ; (pal + 0)
173a : 8d 23 9f STA $9f23 
.s1001:
173d : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
173e : ad 25 9f LDA $9f25 
1741 : 29 fe __ AND #$fe
1743 : 8d 25 9f STA $9f25 
1746 : a5 2d __ LDA P0 ; (spr + 0)
1748 : 0a __ __ ASL
1749 : 0a __ __ ASL
174a : 85 3b __ STA ACCU + 0 
174c : a9 3f __ LDA #$3f
174e : 2a __ __ ROL
174f : 06 3b __ ASL ACCU + 0 
1751 : 2a __ __ ROL
1752 : aa __ __ TAX
1753 : a5 3b __ LDA ACCU + 0 
1755 : 09 02 __ ORA #$02
1757 : 8d 20 9f STA $9f20 
175a : 8e 21 9f STX $9f21 
175d : a9 11 __ LDA #$11
175f : 8d 22 9f STA $9f22 
1762 : a5 2e __ LDA P1 ; (x + 0)
1764 : 8d 23 9f STA $9f23 
1767 : a5 2f __ LDA P2 ; (x + 1)
1769 : 8d 23 9f STA $9f23 
176c : a5 30 __ LDA P3 ; (y + 0)
176e : 8d 23 9f STA $9f23 
1771 : a5 31 __ LDA P4 ; (y + 1)
1773 : 8d 23 9f STA $9f23 
.s1001:
1776 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
1777 : ad 25 9f LDA $9f25 
177a : 29 fe __ AND #$fe
177c : 8d 25 9f STA $9f25 
177f : a5 2d __ LDA P0 ; (spr + 0)
1781 : 0a __ __ ASL
1782 : 0a __ __ ASL
1783 : 85 3b __ STA ACCU + 0 
1785 : a9 3f __ LDA #$3f
1787 : 2a __ __ ROL
1788 : 06 3b __ ASL ACCU + 0 
178a : 2a __ __ ROL
178b : aa __ __ TAX
178c : a5 3b __ LDA ACCU + 0 
178e : 09 06 __ ORA #$06
1790 : 8d 20 9f STA $9f20 
1793 : 8e 21 9f STX $9f21 
1796 : a9 01 __ LDA #$01
1798 : 8d 22 9f STA $9f22 
179b : ad 23 9f LDA $9f23 
179e : 29 fc __ AND #$fc
17a0 : a8 __ __ TAY
17a1 : a5 2e __ LDA P1 ; (fliph + 0)
17a3 : f0 01 __ BEQ $17a6 ; (vera_spr_flip.s14 + 0)
.s6:
17a5 : c8 __ __ INY
.s14:
17a6 : a5 2f __ LDA P2 ; (flipv + 0)
17a8 : f0 05 __ BEQ $17af ; (vera_spr_flip.s11 + 0)
.s9:
17aa : 98 __ __ TYA
17ab : 09 02 __ ORA #$02
17ad : d0 01 __ BNE $17b0 ; (vera_spr_flip.s1002 + 0)
.s11:
17af : 98 __ __ TYA
.s1002:
17b0 : 8d 23 9f STA $9f23 
.s1001:
17b3 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2200 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2210 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2220 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2230 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2240 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2250 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2260 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2270 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2280 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2290 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
22a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
22b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
22c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
22d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
22e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
22f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2330 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2350 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2370 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2380 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2390 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
23a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
23b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
23c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
23d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
23e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
23f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2400 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2410 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2420 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2430 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2440 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2450 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2460 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2470 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2480 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2490 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
24a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
24b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
24c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
24d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
24e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
24f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
17b4 : ad 25 9f LDA $9f25 
17b7 : 29 fe __ AND #$fe
17b9 : 8d 25 9f STA $9f25 
17bc : a5 2d __ LDA P0 ; (index + 0)
17be : 0a __ __ ASL
17bf : 8d 20 9f STA $9f20 
17c2 : a9 7d __ LDA #$7d
17c4 : 2a __ __ ROL
17c5 : 8d 21 9f STA $9f21 
17c8 : a9 11 __ LDA #$11
17ca : 8d 22 9f STA $9f22 
17cd : a5 30 __ LDA P3 ; (size + 0)
17cf : 05 31 __ ORA P4 ; (size + 1)
17d1 : f0 29 __ BEQ $17fc ; (vera_pal_putn.s1001 + 0)
.s6:
17d3 : a6 30 __ LDX P3 ; (size + 0)
17d5 : f0 02 __ BEQ $17d9 ; (vera_pal_putn.l3 + 0)
.s1003:
17d7 : e6 31 __ INC P4 ; (size + 1)
.l3:
17d9 : a0 01 __ LDY #$01
17db : b1 2e __ LDA (P1),y ; (color + 0)
17dd : 85 3c __ STA ACCU + 1 
17df : 88 __ __ DEY
17e0 : b1 2e __ LDA (P1),y ; (color + 0)
17e2 : 8d 23 9f STA $9f23 
17e5 : a5 3c __ LDA ACCU + 1 
17e7 : 8d 23 9f STA $9f23 
17ea : 18 __ __ CLC
17eb : a5 2e __ LDA P1 ; (color + 0)
17ed : 69 02 __ ADC #$02
17ef : 85 2e __ STA P1 ; (color + 0)
17f1 : 90 02 __ BCC $17f5 ; (vera_pal_putn.s1007 + 0)
.s1006:
17f3 : e6 2f __ INC P2 ; (color + 1)
.s1007:
17f5 : ca __ __ DEX
17f6 : d0 e1 __ BNE $17d9 ; (vera_pal_putn.l3 + 0)
.s1002:
17f8 : c6 31 __ DEC P4 ; (size + 1)
17fa : d0 dd __ BNE $17d9 ; (vera_pal_putn.l3 + 0)
.s1001:
17fc : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2500 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2510 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2520 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
2530 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
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
17fd : ad fc 9e LDA $9efc ; (sstack + 0)
1800 : 85 2d __ STA P0 
1802 : ad fd 9e LDA $9efd ; (sstack + 1)
1805 : 85 2e __ STA P1 
1807 : ad fe 9e LDA $9efe ; (sstack + 2)
180a : 85 2f __ STA P2 
180c : ad ff 9e LDA $9eff ; (sstack + 3)
180f : 85 30 __ STA P3 
1811 : a5 35 __ LDA P8 ; (input + 0)
1813 : 85 31 __ STA P4 
1815 : a5 36 __ LDA P9 ; (input + 1)
1817 : 85 32 __ STA P5 
1819 : a5 37 __ LDA P10 ; (inputsize + 0)
181b : 85 33 __ STA P6 
181d : a9 00 __ LDA #$00
181f : 85 34 __ STA P7 
1821 : 4c 7f 16 JMP $167f ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
2540 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
2550 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
2560 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
2570 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
2580 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
2590 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
1ce7 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
EyeTri:
3b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3b60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b70 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3b80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3ba0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3bc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3be0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c10 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3c20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c30 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
3c40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c50 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
3c60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c70 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
3c80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c90 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
3ca0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cb0 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
3cc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cd0 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
3ce0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cf0 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
3d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3d10 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
3d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3d30 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
3d40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3d50 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
3d60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3d70 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
3d80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3d90 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
3da0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3db0 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
3dc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3dd0 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
3de0 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3df0 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
3e00 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3e10 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
3e20 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
3e30 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
3e40 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
3e50 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
3e60 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
3e70 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
3e80 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
3e90 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
3ea0 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
3eb0 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
3ec0 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
3ed0 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
3ee0 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
3ef0 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
getchx:
.s0:
1824 : 20 2e 18 JSR $182e ; (getpch + 0)
1827 : 85 3b __ STA ACCU + 0 
1829 : a9 00 __ LDA #$00
182b : 85 3c __ STA ACCU + 1 
.s1001:
182d : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
182e : 20 e4 ff JSR $ffe4 
1831 : ae f3 1c LDX $1cf3 ; (giocharmap + 0)
1834 : e0 01 __ CPX #$01
1836 : 90 26 __ BCC $185e ; (getpch + 48)
1838 : c9 0d __ CMP #$0d
183a : d0 02 __ BNE $183e ; (getpch + 16)
183c : a9 0a __ LDA #$0a
183e : e0 02 __ CPX #$02
1840 : 90 1c __ BCC $185e ; (getpch + 48)
1842 : c9 db __ CMP #$db
1844 : b0 18 __ BCS $185e ; (getpch + 48)
1846 : c9 41 __ CMP #$41
1848 : 90 14 __ BCC $185e ; (getpch + 48)
184a : c9 c1 __ CMP #$c1
184c : 90 02 __ BCC $1850 ; (getpch + 34)
184e : 49 a0 __ EOR #$a0
1850 : c9 7b __ CMP #$7b
1852 : b0 0a __ BCS $185e ; (getpch + 48)
1854 : c9 61 __ CMP #$61
1856 : b0 04 __ BCS $185c ; (getpch + 46)
1858 : c9 5b __ CMP #$5b
185a : b0 02 __ BCS $185e ; (getpch + 48)
185c : 49 20 __ EOR #$20
185e : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
1cf3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
1cf4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
1cf6 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
Phase2:
1cf8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
185f : a9 33 __ LDA #$33
1861 : 85 2d __ STA P0 
1863 : a9 34 __ LDA #$34
1865 : 85 2e __ STA P1 
1867 : a9 01 __ LDA #$01
1869 : 85 2f __ STA P2 
186b : a6 32 __ LDX P5 ; (p + 0)
186d : bd 00 3f LDA $3f00,x ; (sintab + 0)
1870 : 4a __ __ LSR
1871 : 4a __ __ LSR
1872 : 4a __ __ LSR
1873 : 49 10 __ EOR #$10
1875 : 38 __ __ SEC
1876 : e9 10 __ SBC #$10
1878 : 18 __ __ CLC
1879 : 69 b4 __ ADC #$b4
187b : 85 30 __ STA P3 
187d : a9 00 __ LDA #$00
187f : 85 31 __ STA P4 
1881 : 20 3e 17 JSR $173e ; (vera_spr_move.s0 + 0)
1884 : a9 34 __ LDA #$34
1886 : 85 2d __ STA P0 
1888 : a9 1c __ LDA #$1c
188a : 85 2e __ STA P1 
188c : a6 34 __ LDX P7 ; (p2 + 0)
188e : bd 00 3f LDA $3f00,x ; (sintab + 0)
1891 : 4a __ __ LSR
1892 : 4a __ __ LSR
1893 : 4a __ __ LSR
1894 : 49 10 __ EOR #$10
1896 : 38 __ __ SEC
1897 : e9 10 __ SBC #$10
1899 : 18 __ __ CLC
189a : 69 b4 __ ADC #$b4
189c : 85 30 __ STA P3 
189e : 4c 3e 17 JMP $173e ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
3f00 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
3f10 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
3f20 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
3f30 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
3f40 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
3f50 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
3f60 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
3f70 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
3f80 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
3f90 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
3fa0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
3fb0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
3fc0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
3fd0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
3fe0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
3ff0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
PlayZSM:
.s0:
18a1 : 20 d2 18 JSR $18d2 ; (zsm_check.s0 + 0)
18a4 : 09 00 __ ORA #$00
18a6 : d0 01 __ BNE $18a9 ; (PlayZSM.s1 + 0)
.s1001:
18a8 : 60 __ __ RTS
.s1:
18a9 : a5 33 __ LDA P6 ; (TuneSelection + 1)
18ab : 05 32 __ ORA P5 ; (TuneSelection + 0)
18ad : d0 07 __ BNE $18b6 ; (PlayZSM.s11 + 0)
.s7:
18af : a9 1a __ LDA #$1a
18b1 : a0 61 __ LDY #$61
18b3 : 4c cb 18 JMP $18cb ; (PlayZSM.s15 + 0)
.s11:
18b6 : a5 33 __ LDA P6 ; (TuneSelection + 1)
18b8 : d0 06 __ BNE $18c0 ; (PlayZSM.s5 + 0)
.s1002:
18ba : a5 32 __ LDA P5 ; (TuneSelection + 0)
18bc : c9 01 __ CMP #$01
18be : f0 07 __ BEQ $18c7 ; (PlayZSM.s9 + 0)
.s5:
18c0 : a9 1a __ LDA #$1a
18c2 : a0 43 __ LDY #$43
18c4 : 4c cb 18 JMP $18cb ; (PlayZSM.s15 + 0)
.s9:
18c7 : a9 1a __ LDA #$1a
18c9 : a0 7f __ LDY #$7f
.s15:
18cb : 84 30 __ STY P3 
18cd : 85 31 __ STA P4 
18cf : 4c d6 18 JMP $18d6 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
18d2 : ad e3 1c LDA $1ce3 ; (zsm_finished + 0)
.s1001:
18d5 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
18d6 : a9 01 __ LDA #$01
18d8 : 8d e3 1c STA $1ce3 ; (zsm_finished + 0)
18db : ad fa 1c LDA $1cfa ; (zsm_reading + 0)
18de : f0 0a __ BEQ $18ea ; (zsm_init.s3 + 0)
.s1:
18e0 : a9 02 __ LDA #$02
18e2 : 20 2f 19 JSR $192f ; (krnio_close.s1000 + 0)
18e5 : a9 00 __ LDA #$00
18e7 : 8d fa 1c STA $1cfa ; (zsm_reading + 0)
.s3:
18ea : 8d 61 44 STA $4461 ; (zsm_pos + 0)
18ed : 8d 62 44 STA $4462 ; (zsm_pos + 1)
18f0 : 8d 63 44 STA $4463 ; (zsm_wpos + 0)
18f3 : 8d 64 44 STA $4464 ; (zsm_wpos + 1)
18f6 : 8d 60 40 STA $4060 ; (zsm_delay + 0)
18f9 : a5 30 __ LDA P3 ; (fname + 0)
18fb : 85 2d __ STA P0 
18fd : a5 31 __ LDA P4 ; (fname + 1)
18ff : 85 2e __ STA P1 
1901 : 20 37 19 JSR $1937 ; (krnio_setnam.s0 + 0)
1904 : a9 02 __ LDA #$02
1906 : 85 2d __ STA P0 
1908 : 85 2f __ STA P2 
190a : a9 08 __ LDA #$08
190c : 85 2e __ STA P1 
190e : 20 4d 19 JSR $194d ; (krnio_open.s0 + 0)
1911 : a5 3b __ LDA ACCU + 0 
1913 : f0 19 __ BEQ $192e ; (zsm_init.s1001 + 0)
.s4:
1915 : a9 01 __ LDA #$01
1917 : 8d fa 1c STA $1cfa ; (zsm_reading + 0)
191a : 20 75 19 JSR $1975 ; (zsm_fill.s0 + 0)
191d : a9 10 __ LDA #$10
191f : 8d 61 44 STA $4461 ; (zsm_pos + 0)
1922 : a9 00 __ LDA #$00
1924 : 8d 62 44 STA $4462 ; (zsm_pos + 1)
1927 : 8d e3 1c STA $1ce3 ; (zsm_finished + 0)
192a : a9 01 __ LDA #$01
192c : 85 3b __ STA ACCU + 0 
.s1001:
192e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
1cfa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
192f : 85 2d __ STA P0 
.s0:
1931 : a5 2d __ LDA P0 
1933 : 20 c3 ff JSR $ffc3 
.s1001:
1936 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
4463 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1937 : a5 2d __ LDA P0 
1939 : 05 2e __ ORA P1 
193b : f0 08 __ BEQ $1945 ; (krnio_setnam.s0 + 14)
193d : a0 ff __ LDY #$ff
193f : c8 __ __ INY
1940 : b1 2d __ LDA (P0),y 
1942 : d0 fb __ BNE $193f ; (krnio_setnam.s0 + 8)
1944 : 98 __ __ TYA
1945 : a6 2d __ LDX P0 
1947 : a4 2e __ LDY P1 
1949 : 20 bd ff JSR $ffbd 
.s1001:
194c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
194d : a9 00 __ LDA #$00
194f : a6 2d __ LDX P0 ; (fnum + 0)
1951 : 9d 65 44 STA $4465,x ; (krnio_pstatus + 0)
1954 : a9 00 __ LDA #$00
1956 : 85 3b __ STA ACCU + 0 
1958 : 85 3c __ STA ACCU + 1 
195a : a5 2d __ LDA P0 ; (fnum + 0)
195c : a6 2e __ LDX P1 
195e : a4 2f __ LDY P2 
1960 : 20 ba ff JSR $ffba 
1963 : 20 c0 ff JSR $ffc0 
1966 : 90 08 __ BCC $1970 ; (krnio_open.s0 + 35)
1968 : a5 2d __ LDA P0 ; (fnum + 0)
196a : 20 c3 ff JSR $ffc3 
196d : 4c 74 19 JMP $1974 ; (krnio_open.s1001 + 0)
1970 : a9 01 __ LDA #$01
1972 : 85 3b __ STA ACCU + 0 
.s1001:
1974 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
4465 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1975 : ad fa 1c LDA $1cfa ; (zsm_reading + 0)
1978 : f0 20 __ BEQ $199a ; (zsm_fill.s1 + 0)
.s2:
197a : ad 62 44 LDA $4462 ; (zsm_pos + 1)
197d : 18 __ __ CLC
197e : 69 04 __ ADC #$04
1980 : cd 64 44 CMP $4464 ; (zsm_wpos + 1)
1983 : d0 0c __ BNE $1991 ; (zsm_fill.s6 + 0)
.s1006:
1985 : ad 63 44 LDA $4463 ; (zsm_wpos + 0)
1988 : cd 61 44 CMP $4461 ; (zsm_pos + 0)
198b : d0 04 __ BNE $1991 ; (zsm_fill.s6 + 0)
.s5:
198d : a9 00 __ LDA #$00
198f : f0 0b __ BEQ $199c ; (zsm_fill.s1008 + 0)
.s6:
1991 : a9 02 __ LDA #$02
1993 : 20 19 1a JSR $1a19 ; (krnio_chkin.s1000 + 0)
1996 : a5 3b __ LDA ACCU + 0 
1998 : d0 07 __ BNE $19a1 ; (zsm_fill.s9 + 0)
.s1:
199a : a9 ff __ LDA #$ff
.s1008:
199c : 85 3b __ STA ACCU + 0 
.s1001:
199e : 85 3c __ STA ACCU + 1 
19a0 : 60 __ __ RTS
.s9:
19a1 : a9 00 __ LDA #$00
19a3 : 85 47 __ STA T1 + 0 
19a5 : 85 48 __ STA T1 + 1 
19a7 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
19aa : 18 __ __ CLC
19ab : 69 04 __ ADC #$04
19ad : cd 64 44 CMP $4464 ; (zsm_wpos + 1)
19b0 : d0 08 __ BNE $19ba ; (zsm_fill.l13 + 0)
.s1002:
19b2 : ad 63 44 LDA $4463 ; (zsm_wpos + 0)
19b5 : cd 61 44 CMP $4461 ; (zsm_pos + 0)
19b8 : f0 49 __ BEQ $1a03 ; (zsm_fill.s37 + 0)
.l13:
19ba : 20 2b 1a JSR $1a2b ; (krnio_chrin.s0 + 0)
19bd : ad 63 44 LDA $4463 ; (zsm_wpos + 0)
19c0 : aa __ __ TAX
19c1 : 18 __ __ CLC
19c2 : 69 01 __ ADC #$01
19c4 : 8d 63 44 STA $4463 ; (zsm_wpos + 0)
19c7 : ad 64 44 LDA $4464 ; (zsm_wpos + 1)
19ca : a8 __ __ TAY
19cb : 69 00 __ ADC #$00
19cd : 8d 64 44 STA $4464 ; (zsm_wpos + 1)
19d0 : 8a __ __ TXA
19d1 : 18 __ __ CLC
19d2 : 69 61 __ ADC #$61
19d4 : 85 49 __ STA T3 + 0 
19d6 : 98 __ __ TYA
19d7 : 29 03 __ AND #$03
19d9 : 69 40 __ ADC #$40
19db : 85 4a __ STA T3 + 1 
19dd : a5 3b __ LDA ACCU + 0 
19df : a0 00 __ LDY #$00
19e1 : 91 49 __ STA (T3 + 0),y 
19e3 : e6 47 __ INC T1 + 0 
19e5 : d0 02 __ BNE $19e9 ; (zsm_fill.s1010 + 0)
.s1009:
19e7 : e6 48 __ INC T1 + 1 
.s1010:
19e9 : 20 35 1a JSR $1a35 ; (krnio_status.s0 + 0)
19ec : a5 3b __ LDA ACCU + 0 
19ee : d0 0e __ BNE $19fe ; (zsm_fill.s15 + 0)
.s12:
19f0 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
19f3 : 18 __ __ CLC
19f4 : 69 04 __ ADC #$04
19f6 : cd 64 44 CMP $4464 ; (zsm_wpos + 1)
19f9 : d0 bf __ BNE $19ba ; (zsm_fill.l13 + 0)
19fb : 4c b2 19 JMP $19b2 ; (zsm_fill.s1002 + 0)
.s15:
19fe : a9 00 __ LDA #$00
1a00 : 8d fa 1c STA $1cfa ; (zsm_reading + 0)
.s37:
1a03 : 20 3f 1a JSR $1a3f ; (krnio_clrchn.s0 + 0)
1a06 : ad fa 1c LDA $1cfa ; (zsm_reading + 0)
1a09 : d0 05 __ BNE $1a10 ; (zsm_fill.s21 + 0)
.s19:
1a0b : a9 02 __ LDA #$02
1a0d : 20 2f 19 JSR $192f ; (krnio_close.s1000 + 0)
.s21:
1a10 : a5 47 __ LDA T1 + 0 
1a12 : 85 3b __ STA ACCU + 0 
1a14 : a5 48 __ LDA T1 + 1 
1a16 : 4c 9e 19 JMP $199e ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a19 : 85 2d __ STA P0 
.s0:
1a1b : a6 2d __ LDX P0 
1a1d : 20 c6 ff JSR $ffc6 
1a20 : a9 00 __ LDA #$00
1a22 : 85 3c __ STA ACCU + 1 
1a24 : b0 02 __ BCS $1a28 ; (krnio_chkin.s0 + 13)
1a26 : a9 01 __ LDA #$01
1a28 : 85 3b __ STA ACCU + 0 
.s1001:
1a2a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a2b : 20 cf ff JSR $ffcf 
1a2e : 85 3b __ STA ACCU + 0 
1a30 : a9 00 __ LDA #$00
1a32 : 85 3c __ STA ACCU + 1 
.s1001:
1a34 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1a35 : 20 b7 ff JSR $ffb7 
1a38 : 85 3b __ STA ACCU + 0 
1a3a : a9 00 __ LDA #$00
1a3c : 85 3c __ STA ACCU + 1 
.s1001:
1a3e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1a3f : 20 cc ff JSR $ffcc 
.s1001:
1a42 : 60 __ __ RTS
--------------------------------------------------------------------
1a43 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1a53 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1a61 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1a71 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1a7f : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1a8f : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1a9f : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
PalTimer:
1cfb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
25a0 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
25b0 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1aa4 : a9 10 __ LDA #$10
1aa6 : 85 30 __ STA P3 
1aa8 : a9 00 __ LDA #$00
1aaa : 85 31 __ STA P4 
1aac : a5 32 __ LDA P5 ; (Palette + 0)
1aae : 85 2e __ STA P1 
1ab0 : 85 47 __ STA T0 + 0 
1ab2 : a5 33 __ LDA P6 ; (Palette + 1)
1ab4 : 85 2f __ STA P2 
1ab6 : 85 48 __ STA T0 + 1 
1ab8 : ad fc 9e LDA $9efc ; (sstack + 0)
1abb : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1abd : 0a __ __ ASL
1abe : 85 49 __ STA T2 + 0 
1ac0 : ad fd 9e LDA $9efd ; (sstack + 1)
1ac3 : 2a __ __ ROL
1ac4 : 18 __ __ CLC
1ac5 : 65 33 __ ADC P6 ; (Palette + 1)
1ac7 : 85 4a __ STA T2 + 1 
1ac9 : a4 32 __ LDY P5 ; (Palette + 0)
1acb : b1 49 __ LDA (T2 + 0),y 
1acd : aa __ __ TAX
1ace : c8 __ __ INY
1acf : b1 49 __ LDA (T2 + 0),y 
1ad1 : 86 49 __ STX T2 + 0 
1ad3 : 85 4a __ STA T2 + 1 
1ad5 : a9 00 __ LDA #$00
1ad7 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1ad9 : ad fe 9e LDA $9efe ; (sstack + 2)
1adc : 85 4b __ STA T4 + 0 
1ade : 38 __ __ SEC
1adf : e9 01 __ SBC #$01
1ae1 : 85 4d __ STA T5 + 0 
1ae3 : ad ff 9e LDA $9eff ; (sstack + 3)
1ae6 : 85 4c __ STA T4 + 1 
1ae8 : e9 00 __ SBC #$00
1aea : 85 4e __ STA T5 + 1 
1aec : d0 06 __ BNE $1af4 ; (SetPaletteIndex.s5 + 0)
.s1004:
1aee : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1af0 : c5 4d __ CMP T5 + 0 
1af2 : b0 38 __ BCS $1b2c ; (SetPaletteIndex.s4 + 0)
.s5:
1af4 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1af6 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1af8 : 18 __ __ CLC
1af9 : a5 32 __ LDA P5 ; (Palette + 0)
1afb : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1afd : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1aff : a5 33 __ LDA P6 ; (Palette + 1)
1b01 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1b03 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b05 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1b08 : a0 02 __ LDY #$02
1b0a : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b0c : a0 00 __ LDY #$00
1b0e : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b10 : a0 03 __ LDY #$03
1b12 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b14 : a0 01 __ LDY #$01
1b16 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b18 : 18 __ __ CLC
1b19 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b1b : 69 02 __ ADC #$02
1b1d : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b1f : 90 02 __ BCC $1b23 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1b21 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1b23 : e8 __ __ INX
1b24 : a5 4e __ LDA T5 + 1 
1b26 : d0 e0 __ BNE $1b08 ; (SetPaletteIndex.l2 + 0)
.s1002:
1b28 : e4 4d __ CPX T5 + 0 
1b2a : 90 dc __ BCC $1b08 ; (SetPaletteIndex.l2 + 0)
.s4:
1b2c : a5 4b __ LDA T4 + 0 
1b2e : 0a __ __ ASL
1b2f : aa __ __ TAX
1b30 : a5 4c __ LDA T4 + 1 
1b32 : 2a __ __ ROL
1b33 : a8 __ __ TAY
1b34 : 8a __ __ TXA
1b35 : 38 __ __ SEC
1b36 : e9 02 __ SBC #$02
1b38 : b0 01 __ BCS $1b3b ; (SetPaletteIndex.s1010 + 0)
.s1009:
1b3a : 88 __ __ DEY
.s1010:
1b3b : 18 __ __ CLC
1b3c : 65 47 __ ADC T0 + 0 
1b3e : 85 47 __ STA T0 + 0 
1b40 : 98 __ __ TYA
1b41 : 65 48 __ ADC T0 + 1 
1b43 : 85 48 __ STA T0 + 1 
1b45 : a5 49 __ LDA T2 + 0 
1b47 : a0 00 __ LDY #$00
1b49 : 91 47 __ STA (T0 + 0),y 
1b4b : a5 4a __ LDA T2 + 1 
1b4d : c8 __ __ INY
1b4e : 91 47 __ STA (T0 + 0),y 
1b50 : a5 34 __ LDA P7 ; (index + 0)
1b52 : 85 2d __ STA P0 
1b54 : 4c b4 17 JMP $17b4 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
1cfd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
25c0 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
25d0 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
1cff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
25e0 : __ __ __ BYT 23 02 12 01 01 01 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
25f0 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
BGPalShimmer:
4000 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
4010 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
Control:
.s0:
1b57 : a5 2f __ LDA P2 ; (Input + 0)
1b59 : c9 20 __ CMP #$20
1b5b : d0 1c __ BNE $1b79 ; (Control.s1007 + 0)
.s1:
1b5d : a5 2e __ LDA P1 ; (playing + 0)
1b5f : d0 0a __ BNE $1b6b ; (Control.s4 + 0)
.s5:
1b61 : a9 01 __ LDA #$01
1b63 : 20 fc 1b JSR $1bfc ; (zsm_irq_play.s0 + 0)
1b66 : a9 01 __ LDA #$01
.s1001:
1b68 : 85 3b __ STA ACCU + 0 
1b6a : 60 __ __ RTS
.s4:
1b6b : a9 00 __ LDA #$00
1b6d : cd 20 40 CMP $4020 ; (paused + 0)
1b70 : 2a __ __ ROL
1b71 : 85 2d __ STA P0 
1b73 : 8d 20 40 STA $4020 ; (paused + 0)
1b76 : 20 7e 1b JSR $1b7e ; (zsm_pause.s0 + 0)
.s1007:
1b79 : a5 2e __ LDA P1 ; (playing + 0)
1b7b : 4c 68 1b JMP $1b68 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
4020 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1b7e : a5 2d __ LDA P0 ; (pause + 0)
1b80 : d0 0e __ BNE $1b90 ; (zsm_pause.s4 + 0)
.s8:
1b82 : ad e4 1c LDA $1ce4 ; (zsm_paused + 0)
1b85 : f0 08 __ BEQ $1b8f ; (zsm_pause.s1001 + 0)
.s5:
1b87 : 20 cf 1b JSR $1bcf ; (zsm_restore_volume.s0 + 0)
1b8a : a9 00 __ LDA #$00
1b8c : 8d e4 1c STA $1ce4 ; (zsm_paused + 0)
.s1001:
1b8f : 60 __ __ RTS
.s4:
1b90 : ad e4 1c LDA $1ce4 ; (zsm_paused + 0)
1b93 : d0 fa __ BNE $1b8f ; (zsm_pause.s1001 + 0)
.s1:
1b95 : a9 01 __ LDA #$01
1b97 : 8d e4 1c STA $1ce4 ; (zsm_paused + 0)
1b9a : 4c 9d 1b JMP $1b9d ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1b9d : a0 00 __ LDY #$00
1b9f : 84 3c __ STY ACCU + 1 
1ba1 : a2 02 __ LDX #$02
1ba3 : 18 __ __ CLC
.l1006:
1ba4 : 8a __ __ TXA
1ba5 : 09 c0 __ ORA #$c0
1ba7 : 8d 20 9f STA $9f20 
1baa : a5 3c __ LDA ACCU + 1 
1bac : 09 f9 __ ORA #$f9
1bae : 8d 21 9f STA $9f21 
1bb1 : a9 01 __ LDA #$01
1bb3 : 8d 22 9f STA $9f22 
1bb6 : ad 23 9f LDA $9f23 
1bb9 : 99 75 44 STA $4475,y ; (vera_volumes + 0)
1bbc : a9 00 __ LDA #$00
1bbe : 8d 23 9f STA $9f23 
1bc1 : 8a __ __ TXA
1bc2 : 69 04 __ ADC #$04
1bc4 : aa __ __ TAX
1bc5 : 90 02 __ BCC $1bc9 ; (zsm_save_volume.s1009 + 0)
.s1008:
1bc7 : e6 3c __ INC ACCU + 1 
.s1009:
1bc9 : c8 __ __ INY
1bca : c0 10 __ CPY #$10
1bcc : 90 d6 __ BCC $1ba4 ; (zsm_save_volume.l1006 + 0)
.s1001:
1bce : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
4475 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1bcf : a0 00 __ LDY #$00
1bd1 : 84 3c __ STY ACCU + 1 
1bd3 : a2 02 __ LDX #$02
1bd5 : 18 __ __ CLC
.l1006:
1bd6 : 8a __ __ TXA
1bd7 : 09 c0 __ ORA #$c0
1bd9 : 8d 20 9f STA $9f20 
1bdc : a5 3c __ LDA ACCU + 1 
1bde : 09 f9 __ ORA #$f9
1be0 : 8d 21 9f STA $9f21 
1be3 : a9 01 __ LDA #$01
1be5 : 8d 22 9f STA $9f22 
1be8 : b9 75 44 LDA $4475,y ; (vera_volumes + 0)
1beb : 8d 23 9f STA $9f23 
1bee : 8a __ __ TXA
1bef : 69 04 __ ADC #$04
1bf1 : aa __ __ TAX
1bf2 : 90 02 __ BCC $1bf6 ; (zsm_restore_volume.s1009 + 0)
.s1008:
1bf4 : e6 3c __ INC ACCU + 1 
.s1009:
1bf6 : c8 __ __ INY
1bf7 : c0 10 __ CPY #$10
1bf9 : 90 db __ BCC $1bd6 ; (zsm_restore_volume.l1006 + 0)
.s1001:
1bfb : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1bfc : 8d e2 1c STA $1ce2 ; (zsm_playing + 0)
.s1001:
1bff : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
4021 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
off1:
4485 : __ __ __ BSS	1
--------------------------------------------------------------------
TestText2:
4023 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
4033 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
4043 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
4053 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
frame_wait:
.l1:
1c00 : ad 26 9f LDA $9f26 
1c03 : 29 40 __ AND #$40
1c05 : d0 f9 __ BNE $1c00 ; (frame_wait.l1 + 0)
.l4:
1c07 : ad 26 9f LDA $9f26 
1c0a : 29 40 __ AND #$40
1c0c : f0 f9 __ BEQ $1c07 ; (frame_wait.l4 + 0)
.s1001:
1c0e : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1c0f : 38 __ __ SEC
1c10 : a9 00 __ LDA #$00
1c12 : e5 3b __ SBC ACCU + 0 
1c14 : 85 3b __ STA ACCU + 0 
1c16 : a9 00 __ LDA #$00
1c18 : e5 3c __ SBC ACCU + 1 
1c1a : 85 3c __ STA ACCU + 1 
1c1c : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1c1d : 38 __ __ SEC
1c1e : a9 00 __ LDA #$00
1c20 : e5 23 __ SBC WORK + 0 
1c22 : 85 23 __ STA WORK + 0 
1c24 : a9 00 __ LDA #$00
1c26 : e5 24 __ SBC WORK + 1 
1c28 : 85 24 __ STA WORK + 1 
1c2a : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1c2b : a5 3c __ LDA ACCU + 1 
1c2d : d0 31 __ BNE $1c60 ; (divmod + 53)
1c2f : a5 24 __ LDA WORK + 1 
1c31 : d0 1e __ BNE $1c51 ; (divmod + 38)
1c33 : 85 26 __ STA WORK + 3 
1c35 : a2 04 __ LDX #$04
1c37 : 06 3b __ ASL ACCU + 0 
1c39 : 2a __ __ ROL
1c3a : c5 23 __ CMP WORK + 0 
1c3c : 90 02 __ BCC $1c40 ; (divmod + 21)
1c3e : e5 23 __ SBC WORK + 0 
1c40 : 26 3b __ ROL ACCU + 0 
1c42 : 2a __ __ ROL
1c43 : c5 23 __ CMP WORK + 0 
1c45 : 90 02 __ BCC $1c49 ; (divmod + 30)
1c47 : e5 23 __ SBC WORK + 0 
1c49 : 26 3b __ ROL ACCU + 0 
1c4b : ca __ __ DEX
1c4c : d0 eb __ BNE $1c39 ; (divmod + 14)
1c4e : 85 25 __ STA WORK + 2 
1c50 : 60 __ __ RTS
1c51 : a5 3b __ LDA ACCU + 0 
1c53 : 85 25 __ STA WORK + 2 
1c55 : a5 3c __ LDA ACCU + 1 
1c57 : 85 26 __ STA WORK + 3 
1c59 : a9 00 __ LDA #$00
1c5b : 85 3b __ STA ACCU + 0 
1c5d : 85 3c __ STA ACCU + 1 
1c5f : 60 __ __ RTS
1c60 : a5 24 __ LDA WORK + 1 
1c62 : d0 1f __ BNE $1c83 ; (divmod + 88)
1c64 : a5 23 __ LDA WORK + 0 
1c66 : 30 1b __ BMI $1c83 ; (divmod + 88)
1c68 : a9 00 __ LDA #$00
1c6a : 85 26 __ STA WORK + 3 
1c6c : a2 10 __ LDX #$10
1c6e : 06 3b __ ASL ACCU + 0 
1c70 : 26 3c __ ROL ACCU + 1 
1c72 : 2a __ __ ROL
1c73 : c5 23 __ CMP WORK + 0 
1c75 : 90 02 __ BCC $1c79 ; (divmod + 78)
1c77 : e5 23 __ SBC WORK + 0 
1c79 : 26 3b __ ROL ACCU + 0 
1c7b : 26 3c __ ROL ACCU + 1 
1c7d : ca __ __ DEX
1c7e : d0 f2 __ BNE $1c72 ; (divmod + 71)
1c80 : 85 25 __ STA WORK + 2 
1c82 : 60 __ __ RTS
1c83 : a9 00 __ LDA #$00
1c85 : 85 25 __ STA WORK + 2 
1c87 : 85 26 __ STA WORK + 3 
1c89 : 84 22 __ STY $22 
1c8b : a0 10 __ LDY #$10
1c8d : 18 __ __ CLC
1c8e : 26 3b __ ROL ACCU + 0 
1c90 : 26 3c __ ROL ACCU + 1 
1c92 : 26 25 __ ROL WORK + 2 
1c94 : 26 26 __ ROL WORK + 3 
1c96 : 38 __ __ SEC
1c97 : a5 25 __ LDA WORK + 2 
1c99 : e5 23 __ SBC WORK + 0 
1c9b : aa __ __ TAX
1c9c : a5 26 __ LDA WORK + 3 
1c9e : e5 24 __ SBC WORK + 1 
1ca0 : 90 04 __ BCC $1ca6 ; (divmod + 123)
1ca2 : 86 25 __ STX WORK + 2 
1ca4 : 85 26 __ STA WORK + 3 
1ca6 : 88 __ __ DEY
1ca7 : d0 e5 __ BNE $1c8e ; (divmod + 99)
1ca9 : 26 3b __ ROL ACCU + 0 
1cab : 26 3c __ ROL ACCU + 1 
1cad : a4 22 __ LDY $22 
1caf : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1cb0 : 24 3c __ BIT ACCU + 1 
1cb2 : 10 0d __ BPL $1cc1 ; (mods16 + 17)
1cb4 : 20 0f 1c JSR $1c0f ; (negaccu + 0)
1cb7 : 24 24 __ BIT WORK + 1 
1cb9 : 10 0d __ BPL $1cc8 ; (mods16 + 24)
1cbb : 20 1d 1c JSR $1c1d ; (negtmp + 0)
1cbe : 4c 2b 1c JMP $1c2b ; (divmod + 0)
1cc1 : 24 24 __ BIT WORK + 1 
1cc3 : 10 f9 __ BPL $1cbe ; (mods16 + 14)
1cc5 : 20 1d 1c JSR $1c1d ; (negtmp + 0)
1cc8 : 20 2b 1c JSR $1c2b ; (divmod + 0)
1ccb : 38 __ __ SEC
1ccc : a9 00 __ LDA #$00
1cce : e5 25 __ SBC WORK + 2 
1cd0 : 85 25 __ STA WORK + 2 
1cd2 : a9 00 __ LDA #$00
1cd4 : e5 26 __ SBC WORK + 3 
1cd6 : 85 26 __ STA WORK + 3 
1cd8 : 60 __ __ RTS
--------------------------------------------------------------------
__multab10L:
1cd9 : __ __ __ BYT 00 0a 14 1e 28 32 3c 46                         : ....(2<F
