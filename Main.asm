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
0880 : 20 bd 0b JSR $0bbd ; (zsm_irq_init.s0 + 0)
0883 : 20 91 0d JSR $0d91 ; (ClearVERAScreen.s0 + 0)
0886 : 20 d4 0d JSR $0dd4 ; (SetUpSprites.s0 + 0)
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
0905 : 85 52 __ STA T2 + 0 
0907 : 85 53 __ STA T3 + 0 
.l2:
0909 : a9 30 __ LDA #$30
090b : 8d 2c 9f STA $9f2c 
090e : ee f3 1c INC $1cf3 ; (p + 0)
0911 : d0 03 __ BNE $0916 ; (main.s1023 + 0)
.s1022:
0913 : ee f4 1c INC $1cf4 ; (p + 1)
.s1023:
0916 : ad f5 1c LDA $1cf5 ; (Phase + 0)
0919 : 18 __ __ CLC
091a : 69 01 __ ADC #$01
091c : 85 32 __ STA P5 
091e : 8d f5 1c STA $1cf5 ; (Phase + 0)
0921 : ad f6 1c LDA $1cf6 ; (Phase + 1)
0924 : 69 00 __ ADC #$00
0926 : 85 33 __ STA P6 
0928 : 8d f6 1c STA $1cf6 ; (Phase + 1)
092b : ad f7 1c LDA $1cf7 ; (Phase2 + 0)
092e : 18 __ __ CLC
092f : 69 01 __ ADC #$01
0931 : 85 34 __ STA P7 
0933 : 8d f7 1c STA $1cf7 ; (Phase2 + 0)
0936 : ad f8 1c LDA $1cf8 ; (Phase2 + 1)
0939 : 69 00 __ ADC #$00
093b : 85 35 __ STA P8 
093d : 8d f8 1c STA $1cf8 ; (Phase2 + 1)
0940 : 20 1d 18 JSR $181d ; (MoveSprites.s0 + 0)
0943 : a5 52 __ LDA T2 + 0 
0945 : f0 03 __ BEQ $094a ; (main.s5 + 0)
0947 : 4c a4 0b JMP $0ba4 ; (main.s4 + 0)
.s5:
094a : a9 20 __ LDA #$20
094c : 85 37 __ STA P10 
094e : a9 a0 __ LDA #$a0
0950 : 8d fc 9e STA $9efc ; (sstack + 0)
0953 : a9 fa __ LDA #$fa
0955 : 8d fd 9e STA $9efd ; (sstack + 1)
0958 : a9 01 __ LDA #$01
095a : 8d fe 9e STA $9efe ; (sstack + 2)
095d : a9 00 __ LDA #$00
095f : 8d ff 9e STA $9eff ; (sstack + 3)
0962 : 8d fa 1c STA $1cfa ; (PalTimer + 0)
0965 : 8d fb 1c STA $1cfb ; (PalTimer + 1)
0968 : a9 a0 __ LDA #$a0
096a : 85 35 __ STA P8 
096c : a9 25 __ LDA #$25
096e : 85 36 __ STA P9 
0970 : 20 f6 17 JSR $17f6 ; (SetPaletteColours.s0 + 0)
.s86:
0973 : e6 53 __ INC T3 + 0 
0975 : a9 02 __ LDA #$02
0977 : c5 53 __ CMP T3 + 0 
0979 : 90 03 __ BCC $097e ; (main.s10 + 0)
097b : 4c 06 0a JMP $0a06 ; (main.s12 + 0)
.s10:
097e : a9 10 __ LDA #$10
0980 : 85 34 __ STA P7 
0982 : a9 00 __ LDA #$00
0984 : 85 35 __ STA P8 
0986 : 85 36 __ STA P9 
0988 : 85 37 __ STA P10 
098a : a9 06 __ LDA #$06
098c : 8d fc 9e STA $9efc ; (sstack + 0)
098f : a9 00 __ LDA #$00
0991 : 8d fd 9e STA $9efd ; (sstack + 1)
0994 : 8d ff 9e STA $9eff ; (sstack + 3)
0997 : a9 0a __ LDA #$0a
0999 : 8d fe 9e STA $9efe ; (sstack + 2)
099c : a9 00 __ LDA #$00
099e : 85 32 __ STA P5 
09a0 : a9 25 __ LDA #$25
09a2 : 85 33 __ STA P6 
09a4 : 20 62 1a JSR $1a62 ; (SetPaletteIndex.s0 + 0)
09a7 : a0 00 __ LDY #$00
09a9 : 84 53 __ STY T3 + 0 
.l14:
09ab : be d9 1c LDX $1cd9,y ; (__multab10L + 0)
09ae : bd ac 9e LDA $9eac,x ; (Buildings + 0)
09b1 : 1d ad 9e ORA $9ead,x ; (Buildings + 1)
09b4 : d0 4b __ BNE $0a01 ; (main.s15 + 0)
.s18:
09b6 : ad 2e 9f LDA $9f2e 
09b9 : 0a __ __ ASL
09ba : 85 4e __ STA T8 + 1 
09bc : a9 00 __ LDA #$00
09be : 2a __ __ ROL
09bf : 85 4f __ STA T8 + 2 
09c1 : bd b0 9e LDA $9eb0,x ; (Buildings + 4)
09c4 : 85 3c __ STA ACCU + 1 
09c6 : bd b1 9e LDA $9eb1,x ; (Buildings + 5)
09c9 : 4a __ __ LSR
09ca : 66 3c __ ROR ACCU + 1 
09cc : a9 00 __ LDA #$00
09ce : 6a __ __ ROR
09cf : 7d ae 9e ADC $9eae,x ; (Buildings + 2)
09d2 : 85 4d __ STA T8 + 0 
09d4 : bd af 9e LDA $9eaf,x ; (Buildings + 3)
09d7 : 65 3c __ ADC ACCU + 1 
09d9 : 18 __ __ CLC
09da : 65 4e __ ADC T8 + 1 
09dc : 85 4e __ STA T8 + 1 
09de : 90 02 __ BCC $09e2 ; (main.s1027 + 0)
.s1026:
09e0 : e6 4f __ INC T8 + 2 
.s1027:
09e2 : a9 00 __ LDA #$00
09e4 : 85 4c __ STA T7 + 0 
.l19:
09e6 : be d9 1c LDX $1cd9,y ; (__multab10L + 0)
09e9 : bd b4 9e LDA $9eb4,x ; (Buildings + 8)
09ec : 85 3b __ STA ACCU + 0 
09ee : bd b5 9e LDA $9eb5,x ; (Buildings + 9)
09f1 : f0 03 __ BEQ $09f6 ; (main.s1017 + 0)
09f3 : 4c 4e 0b JMP $0b4e ; (main.s20 + 0)
.s1017:
09f6 : 85 3c __ STA ACCU + 1 
09f8 : a5 4c __ LDA T7 + 0 
09fa : c5 3b __ CMP ACCU + 0 
09fc : b0 03 __ BCS $0a01 ; (main.s15 + 0)
09fe : 4c 4e 0b JMP $0b4e ; (main.s20 + 0)
.s15:
0a01 : c8 __ __ INY
0a02 : c0 08 __ CPY #$08
0a04 : 90 a5 __ BCC $09ab ; (main.l14 + 0)
.s12:
0a06 : ad fb 1c LDA $1cfb ; (PalTimer + 1)
0a09 : 30 5f __ BMI $0a6a ; (main.s92 + 0)
.s1012:
0a0b : d0 07 __ BNE $0a14 ; (main.s31 + 0)
.s1011:
0a0d : a9 03 __ LDA #$03
0a0f : cd fa 1c CMP $1cfa ; (PalTimer + 0)
0a12 : b0 56 __ BCS $0a6a ; (main.s92 + 0)
.s31:
0a14 : a9 60 __ LDA #$60
0a16 : 85 34 __ STA P7 
0a18 : a9 00 __ LDA #$00
0a1a : 85 35 __ STA P8 
0a1c : 85 36 __ STA P9 
0a1e : 85 37 __ STA P10 
0a20 : 8d fc 9e STA $9efc ; (sstack + 0)
0a23 : 8d fd 9e STA $9efd ; (sstack + 1)
0a26 : a9 05 __ LDA #$05
0a28 : 8d fe 9e STA $9efe ; (sstack + 2)
0a2b : a9 00 __ LDA #$00
0a2d : 8d ff 9e STA $9eff ; (sstack + 3)
0a30 : ee fc 1c INC $1cfc ; (PalIndex + 0)
0a33 : d0 03 __ BNE $0a38 ; (main.s1031 + 0)
.s1030:
0a35 : ee fd 1c INC $1cfd ; (PalIndex + 1)
.s1031:
0a38 : a9 e7 __ LDA #$e7
0a3a : 85 32 __ STA P5 
0a3c : a9 1c __ LDA #$1c
0a3e : 85 33 __ STA P6 
0a40 : 20 62 1a JSR $1a62 ; (SetPaletteIndex.s0 + 0)
0a43 : a9 50 __ LDA #$50
0a45 : 85 34 __ STA P7 
0a47 : a9 00 __ LDA #$00
0a49 : 8d fc 9e STA $9efc ; (sstack + 0)
0a4c : 8d fd 9e STA $9efd ; (sstack + 1)
0a4f : 8d ff 9e STA $9eff ; (sstack + 3)
0a52 : a9 10 __ LDA #$10
0a54 : 8d fe 9e STA $9efe ; (sstack + 2)
0a57 : a9 c0 __ LDA #$c0
0a59 : 85 32 __ STA P5 
0a5b : a9 25 __ LDA #$25
0a5d : 85 33 __ STA P6 
0a5f : 20 62 1a JSR $1a62 ; (SetPaletteIndex.s0 + 0)
0a62 : a9 00 __ LDA #$00
0a64 : 8d fa 1c STA $1cfa ; (PalTimer + 0)
0a67 : 8d fb 1c STA $1cfb ; (PalTimer + 1)
.s92:
0a6a : ad f4 1c LDA $1cf4 ; (p + 1)
0a6d : d0 42 __ BNE $0ab1 ; (main.s36 + 0)
.s1010:
0a6f : ad f3 1c LDA $1cf3 ; (p + 0)
0a72 : c9 03 __ CMP #$03
0a74 : d0 3b __ BNE $0ab1 ; (main.s36 + 0)
.s34:
0a76 : a9 20 __ LDA #$20
0a78 : 85 37 __ STA P10 
0a7a : a9 00 __ LDA #$00
0a7c : 8d fc 9e STA $9efc ; (sstack + 0)
0a7f : 8d ff 9e STA $9eff ; (sstack + 3)
0a82 : a9 fa __ LDA #$fa
0a84 : 8d fd 9e STA $9efd ; (sstack + 1)
0a87 : a9 01 __ LDA #$01
0a89 : 8d fe 9e STA $9efe ; (sstack + 2)
0a8c : a9 00 __ LDA #$00
0a8e : cd fe 1c CMP $1cfe ; (ShimmerState + 0)
0a91 : 2a __ __ ROL
0a92 : 8d fe 1c STA $1cfe ; (ShimmerState + 0)
0a95 : d0 07 __ BNE $0a9e ; (main.s37 + 0)
.s38:
0a97 : a9 40 __ LDA #$40
0a99 : a0 00 __ LDY #$00
0a9b : 4c a2 0a JMP $0aa2 ; (main.s101 + 0)
.s37:
0a9e : a9 25 __ LDA #$25
0aa0 : a0 e0 __ LDY #$e0
.s101:
0aa2 : 84 35 __ STY P8 
0aa4 : 85 36 __ STA P9 
0aa6 : 20 f6 17 JSR $17f6 ; (SetPaletteColours.s0 + 0)
0aa9 : a9 00 __ LDA #$00
0aab : 8d f3 1c STA $1cf3 ; (p + 0)
0aae : 8d f4 1c STA $1cf4 ; (p + 1)
.s36:
0ab1 : a9 03 __ LDA #$03
0ab3 : 8d 2c 9f STA $9f2c 
0ab6 : 20 15 1b JSR $1b15 ; (getchx.s0 + 0)
0ab9 : a5 3c __ LDA ACCU + 1 
0abb : d0 0a __ BNE $0ac7 ; (main.s41 + 0)
.s1006:
0abd : a5 3b __ LDA ACCU + 0 
0abf : c9 41 __ CMP #$41
0ac1 : d0 04 __ BNE $0ac7 ; (main.s41 + 0)
.s40:
0ac3 : a9 00 __ LDA #$00
0ac5 : f0 0f __ BEQ $0ad6 ; (main.s1020 + 0)
.s41:
0ac7 : 20 15 1b JSR $1b15 ; (getchx.s0 + 0)
0aca : a5 3c __ LDA ACCU + 1 
0acc : d0 0a __ BNE $0ad8 ; (main.s42 + 0)
.s1005:
0ace : a5 3b __ LDA ACCU + 0 
0ad0 : c9 44 __ CMP #$44
0ad2 : d0 04 __ BNE $0ad8 ; (main.s42 + 0)
.s43:
0ad4 : a9 01 __ LDA #$01
.s1020:
0ad6 : 85 51 __ STA T1 + 0 
.s42:
0ad8 : a5 52 __ LDA T2 + 0 
0ada : 85 2e __ STA P1 
0adc : 20 50 1b JSR $1b50 ; (Control.s0 + 0)
0adf : a5 3b __ LDA ACCU + 0 
0ae1 : 85 52 __ STA T2 + 0 
0ae3 : a5 51 __ LDA T1 + 0 
0ae5 : 85 32 __ STA P5 
0ae7 : a9 00 __ LDA #$00
0ae9 : 85 33 __ STA P6 
0aeb : 20 5f 18 JSR $185f ; (PlayZSM.s0 + 0)
0aee : ad 21 40 LDA $4021 ; (FrameCount + 0)
0af1 : 85 47 __ STA T4 + 0 
0af3 : 85 3b __ STA ACCU + 0 
0af5 : ad 22 40 LDA $4022 ; (FrameCount + 1)
0af8 : 85 3c __ STA ACCU + 1 
0afa : a9 04 __ LDA #$04
0afc : 85 23 __ STA WORK + 0 
0afe : a9 00 __ LDA #$00
0b00 : 85 24 __ STA WORK + 1 
0b02 : 20 b0 1c JSR $1cb0 ; (mods16 + 0)
0b05 : a5 26 __ LDA WORK + 3 
0b07 : d0 16 __ BNE $0b1f ; (main.s48 + 0)
.s1004:
0b09 : a5 25 __ LDA WORK + 2 
0b0b : c9 01 __ CMP #$01
0b0d : d0 10 __ BNE $0b1f ; (main.s48 + 0)
.s46:
0b0f : ac 85 44 LDY $4485 ; (off1 + 0)
0b12 : c0 3b __ CPY #$3b
0b14 : b0 06 __ BCS $0b1c ; (main.s102 + 0)
.s49:
0b16 : b9 23 40 LDA $4023,y ; (TestText2 + 0)
0b19 : 8d 23 9f STA $9f23 
.s102:
0b1c : ee 85 44 INC $4485 ; (off1 + 0)
.s48:
0b1f : 06 47 __ ASL T4 + 0 
0b21 : ad 22 40 LDA $4022 ; (FrameCount + 1)
0b24 : 2a __ __ ROL
0b25 : 18 __ __ CLC
0b26 : 69 ff __ ADC #$ff
0b28 : 8d 38 9f STA $9f38 
0b2b : a5 47 __ LDA T4 + 0 
0b2d : 8d 37 9f STA $9f37 
0b30 : a9 01 __ LDA #$01
0b32 : 8d 2c 9f STA $9f2c 
0b35 : 20 33 19 JSR $1933 ; (zsm_fill.s0 + 0)
0b38 : a9 00 __ LDA #$00
0b3a : 8d 2c 9f STA $9f2c 
0b3d : 20 00 1c JSR $1c00 ; (frame_wait.l1 + 0)
0b40 : ee 21 40 INC $4021 ; (FrameCount + 0)
0b43 : f0 03 __ BEQ $0b48 ; (main.s1032 + 0)
0b45 : 4c 09 09 JMP $0909 ; (main.l2 + 0)
.s1032:
0b48 : ee 22 40 INC $4022 ; (FrameCount + 1)
0b4b : 4c 09 09 JMP $0909 ; (main.l2 + 0)
.s20:
0b4e : ad 25 9f LDA $9f25 
0b51 : 29 fe __ AND #$fe
0b53 : 8d 25 9f STA $9f25 
0b56 : 18 __ __ CLC
0b57 : a5 4d __ LDA T8 + 0 
0b59 : 69 01 __ ADC #$01
0b5b : 8d 20 9f STA $9f20 
0b5e : a5 4e __ LDA T8 + 1 
0b60 : 69 00 __ ADC #$00
0b62 : 8d 21 9f STA $9f21 
0b65 : a5 4f __ LDA T8 + 2 
0b67 : 69 00 __ ADC #$00
0b69 : 29 01 __ AND #$01
0b6b : 09 10 __ ORA #$10
0b6d : 8d 22 9f STA $9f22 
0b70 : a9 00 __ LDA #$00
0b72 : 85 3b __ STA ACCU + 0 
0b74 : bd b3 9e LDA $9eb3,x ; (Buildings + 7)
0b77 : d0 07 __ BNE $0b80 ; (main.l25 + 0)
.s1015:
0b79 : a5 3b __ LDA ACCU + 0 
0b7b : dd b2 9e CMP $9eb2,x ; (Buildings + 6)
0b7e : b0 0f __ BCS $0b8f ; (main.s27 + 0)
.l25:
0b80 : a9 18 __ LDA #$18
0b82 : 8d 23 9f STA $9f23 
0b85 : e6 3b __ INC ACCU + 0 
0b87 : bd b3 9e LDA $9eb3,x ; (Buildings + 7)
0b8a : d0 f4 __ BNE $0b80 ; (main.l25 + 0)
0b8c : 4c 79 0b JMP $0b79 ; (main.s1015 + 0)
.s27:
0b8f : a5 4d __ LDA T8 + 0 
0b91 : 69 7f __ ADC #$7f
0b93 : 85 4d __ STA T8 + 0 
0b95 : a5 4e __ LDA T8 + 1 
0b97 : 69 00 __ ADC #$00
0b99 : 85 4e __ STA T8 + 1 
0b9b : 90 02 __ BCC $0b9f ; (main.s1029 + 0)
.s1028:
0b9d : e6 4f __ INC T8 + 2 
.s1029:
0b9f : e6 4c __ INC T7 + 0 
0ba1 : 4c e6 09 JMP $09e6 ; (main.l19 + 0)
.s4:
0ba4 : a5 51 __ LDA T1 + 0 
0ba6 : 85 32 __ STA P5 
0ba8 : a9 00 __ LDA #$00
0baa : 85 33 __ STA P6 
0bac : 20 5f 18 JSR $185f ; (PlayZSM.s0 + 0)
0baf : ee fa 1c INC $1cfa ; (PalTimer + 0)
0bb2 : f0 03 __ BEQ $0bb7 ; (main.s1024 + 0)
0bb4 : 4c 73 09 JMP $0973 ; (main.s86 + 0)
.s1024:
0bb7 : ee fb 1c INC $1cfb ; (PalTimer + 1)
0bba : 4c 73 09 JMP $0973 ; (main.s86 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0bbd : 78 __ __ SEI
0bbe : ad 14 03 LDA $0314 
0bc1 : 8d 5e 40 STA $405e ; (oirq + 0)
0bc4 : ad 15 03 LDA $0315 
0bc7 : 8d 5f 40 STA $405f ; (oirq + 1)
0bca : a9 d6 __ LDA #$d6
0bcc : 8d 14 03 STA $0314 
0bcf : a9 0b __ LDA #$0b
0bd1 : 8d 15 03 STA $0315 
0bd4 : 58 __ __ CLI
.s1001:
0bd5 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
405e : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0bd6 : 20 dc 0b JSR $0bdc ; (irq.s1000 + 0)
0bd9 : 6c 5e 40 JMP ($405e)
--------------------------------------------------------------------
irq:
.s1000:
0bdc : a5 2d __ LDA P0 
0bde : 48 __ __ PHA
0bdf : a5 2e __ LDA P1 
0be1 : 48 __ __ PHA
0be2 : a5 3b __ LDA ACCU + 0 
0be4 : 48 __ __ PHA
0be5 : a5 3c __ LDA ACCU + 1 
0be7 : 48 __ __ PHA
0be8 : a5 47 __ LDA T0 + 0 
0bea : 48 __ __ PHA
0beb : a5 48 __ LDA $48 
0bed : 48 __ __ PHA
0bee : a5 49 __ LDA $49 
0bf0 : 48 __ __ PHA
0bf1 : a5 4a __ LDA $4a 
0bf3 : 48 __ __ PHA
0bf4 : a5 4b __ LDA $4b 
0bf6 : 48 __ __ PHA
0bf7 : a5 4c __ LDA $4c 
0bf9 : 48 __ __ PHA
0bfa : a5 4d __ LDA $4d 
0bfc : 48 __ __ PHA
0bfd : a5 4e __ LDA $4e 
0bff : 48 __ __ PHA
0c00 : a5 4f __ LDA $4f 
0c02 : 48 __ __ PHA
0c03 : a5 50 __ LDA $50 
0c05 : 48 __ __ PHA
.s0:
0c06 : ad e2 1c LDA $1ce2 ; (zsm_playing + 0)
0c09 : f0 08 __ BEQ $0c13 ; (irq.s1001 + 0)
.s4:
0c0b : ad e3 1c LDA $1ce3 ; (zsm_finished + 0)
0c0e : d0 03 __ BNE $0c13 ; (irq.s1001 + 0)
.s1:
0c10 : 20 3e 0c JSR $0c3e ; (zsm_play.s0 + 0)
.s1001:
0c13 : 68 __ __ PLA
0c14 : 85 50 __ STA $50 
0c16 : 68 __ __ PLA
0c17 : 85 4f __ STA $4f 
0c19 : 68 __ __ PLA
0c1a : 85 4e __ STA $4e 
0c1c : 68 __ __ PLA
0c1d : 85 4d __ STA $4d 
0c1f : 68 __ __ PLA
0c20 : 85 4c __ STA $4c 
0c22 : 68 __ __ PLA
0c23 : 85 4b __ STA $4b 
0c25 : 68 __ __ PLA
0c26 : 85 4a __ STA $4a 
0c28 : 68 __ __ PLA
0c29 : 85 49 __ STA $49 
0c2b : 68 __ __ PLA
0c2c : 85 48 __ STA $48 
0c2e : 68 __ __ PLA
0c2f : 85 47 __ STA T0 + 0 
0c31 : 68 __ __ PLA
0c32 : 85 3c __ STA ACCU + 1 
0c34 : 68 __ __ PLA
0c35 : 85 3b __ STA ACCU + 0 
0c37 : 68 __ __ PLA
0c38 : 85 2e __ STA P1 
0c3a : 68 __ __ PLA
0c3b : 85 2d __ STA P0 
0c3d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1ce2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1ce3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c3e : ad e4 1c LDA $1ce4 ; (zsm_paused + 0)
0c41 : f0 01 __ BEQ $0c44 ; (zsm_play.s2 + 0)
0c43 : 60 __ __ RTS
.s2:
0c44 : ad 60 40 LDA $4060 ; (zsm_delay + 0)
0c47 : f0 03 __ BEQ $0c4c ; (zsm_play.s5 + 0)
0c49 : 4c 79 0d JMP $0d79 ; (zsm_play.s4 + 0)
.s5:
0c4c : ad 25 9f LDA $9f25 
0c4f : 85 47 __ STA T0 + 0 
0c51 : ad 25 9f LDA $9f25 
0c54 : 29 fe __ AND #$fe
0c56 : 8d 25 9f STA $9f25 
0c59 : ad 20 9f LDA $9f20 
0c5c : 85 49 __ STA T2 + 0 
0c5e : ad 21 9f LDA $9f21 
0c61 : 85 4a __ STA T2 + 1 
0c63 : ad 22 9f LDA $9f22 
0c66 : 85 48 __ STA T1 + 0 
.l8:
0c68 : ad 61 44 LDA $4461 ; (zsm_pos + 0)
0c6b : 85 4b __ STA T3 + 0 
0c6d : 18 __ __ CLC
0c6e : 69 01 __ ADC #$01
0c70 : 85 4d __ STA T4 + 0 
0c72 : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0c75 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
0c78 : aa __ __ TAX
0c79 : 69 00 __ ADC #$00
0c7b : 85 4e __ STA T4 + 1 
0c7d : 8d 62 44 STA $4462 ; (zsm_pos + 1)
0c80 : 18 __ __ CLC
0c81 : a9 61 __ LDA #$61
0c83 : 65 4b __ ADC T3 + 0 
0c85 : 85 3b __ STA ACCU + 0 
0c87 : 8a __ __ TXA
0c88 : 29 03 __ AND #$03
0c8a : 69 40 __ ADC #$40
0c8c : 85 3c __ STA ACCU + 1 
0c8e : a0 00 __ LDY #$00
0c90 : b1 3b __ LDA (ACCU + 0),y 
0c92 : c9 40 __ CMP #$40
0c94 : b0 03 __ BCS $0c99 ; (zsm_play.s12 + 0)
0c96 : 4c 44 0d JMP $0d44 ; (zsm_play.s11 + 0)
.s12:
0c99 : d0 22 __ BNE $0cbd ; (zsm_play.s15 + 0)
.s14:
0c9b : 18 __ __ CLC
0c9c : a9 61 __ LDA #$61
0c9e : 65 4d __ ADC T4 + 0 
0ca0 : 85 4b __ STA T3 + 0 
0ca2 : a5 4e __ LDA T4 + 1 
0ca4 : 29 03 __ AND #$03
0ca6 : 69 40 __ ADC #$40
0ca8 : 85 4c __ STA T3 + 1 
0caa : b1 4b __ LDA (T3 + 0),y 
0cac : 29 3f __ AND #$3f
0cae : 18 __ __ CLC
0caf : 65 4d __ ADC T4 + 0 
0cb1 : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0cb4 : 98 __ __ TYA
0cb5 : 65 4e __ ADC T4 + 1 
0cb7 : 8d 62 44 STA $4462 ; (zsm_pos + 1)
0cba : 4c 68 0c JMP $0c68 ; (zsm_play.l8 + 0)
.s15:
0cbd : 09 00 __ ORA #$00
0cbf : 30 5b __ BMI $0d1c ; (zsm_play.s18 + 0)
.s17:
0cc1 : 29 3f __ AND #$3f
0cc3 : f0 a3 __ BEQ $0c68 ; (zsm_play.l8 + 0)
.s29:
0cc5 : 84 50 __ STY T7 + 0 
0cc7 : 85 4f __ STA T6 + 0 
0cc9 : 18 __ __ CLC
.l1012:
0cca : a9 61 __ LDA #$61
0ccc : 6d 61 44 ADC $4461 ; (zsm_pos + 0)
0ccf : 85 4d __ STA T4 + 0 
0cd1 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
0cd4 : 29 03 __ AND #$03
0cd6 : 69 40 __ ADC #$40
0cd8 : 85 4e __ STA T4 + 1 
0cda : a0 00 __ LDY #$00
0cdc : b1 4d __ LDA (T4 + 0),y 
0cde : 85 2d __ STA P0 
0ce0 : ad 61 44 LDA $4461 ; (zsm_pos + 0)
0ce3 : 18 __ __ CLC
0ce4 : 69 01 __ ADC #$01
0ce6 : aa __ __ TAX
0ce7 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
0cea : 69 00 __ ADC #$00
0cec : 29 03 __ AND #$03
0cee : 85 4c __ STA T3 + 1 
0cf0 : 8a __ __ TXA
0cf1 : 18 __ __ CLC
0cf2 : 69 61 __ ADC #$61
0cf4 : 85 4b __ STA T3 + 0 
0cf6 : a9 40 __ LDA #$40
0cf8 : 65 4c __ ADC T3 + 1 
0cfa : 85 4c __ STA T3 + 1 
0cfc : b1 4b __ LDA (T3 + 0),y 
0cfe : 85 2e __ STA P1 
0d00 : 20 7d 0d JSR $0d7d ; (sfx_put.l1 + 0)
0d03 : ad 61 44 LDA $4461 ; (zsm_pos + 0)
0d06 : 18 __ __ CLC
0d07 : 69 02 __ ADC #$02
0d09 : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0d0c : 90 03 __ BCC $0d11 ; (zsm_play.s1015 + 0)
.s1014:
0d0e : ee 62 44 INC $4462 ; (zsm_pos + 1)
.s1015:
0d11 : e6 50 __ INC T7 + 0 
0d13 : a5 50 __ LDA T7 + 0 
0d15 : c5 4f __ CMP T6 + 0 
0d17 : 90 b1 __ BCC $0cca ; (zsm_play.l1012 + 0)
0d19 : 4c 68 0c JMP $0c68 ; (zsm_play.l8 + 0)
.s18:
0d1c : c9 80 __ CMP #$80
0d1e : d0 07 __ BNE $0d27 ; (zsm_play.s25 + 0)
.s24:
0d20 : a9 01 __ LDA #$01
0d22 : 8d e3 1c STA $1ce3 ; (zsm_finished + 0)
0d25 : d0 08 __ BNE $0d2f ; (zsm_play.s10 + 0)
.s25:
0d27 : 29 7f __ AND #$7f
0d29 : 38 __ __ SEC
0d2a : e9 01 __ SBC #$01
0d2c : 8d 60 40 STA $4060 ; (zsm_delay + 0)
.s10:
0d2f : a5 49 __ LDA T2 + 0 
0d31 : 8d 20 9f STA $9f20 
0d34 : a5 4a __ LDA T2 + 1 
0d36 : 8d 21 9f STA $9f21 
0d39 : a5 48 __ LDA T1 + 0 
0d3b : 8d 22 9f STA $9f22 
0d3e : a5 47 __ LDA T0 + 0 
0d40 : 8d 25 9f STA $9f25 
.s1001:
0d43 : 60 __ __ RTS
.s11:
0d44 : 29 3f __ AND #$3f
0d46 : 09 c0 __ ORA #$c0
0d48 : 8d 20 9f STA $9f20 
0d4b : a9 f9 __ LDA #$f9
0d4d : 8d 21 9f STA $9f21 
0d50 : a9 01 __ LDA #$01
0d52 : 8d 22 9f STA $9f22 
0d55 : a5 4b __ LDA T3 + 0 
0d57 : 69 02 __ ADC #$02
0d59 : 8d 61 44 STA $4461 ; (zsm_pos + 0)
0d5c : 90 01 __ BCC $0d5f ; (zsm_play.s1017 + 0)
.s1016:
0d5e : e8 __ __ INX
.s1017:
0d5f : 8e 62 44 STX $4462 ; (zsm_pos + 1)
0d62 : 18 __ __ CLC
0d63 : a9 61 __ LDA #$61
0d65 : 65 4d __ ADC T4 + 0 
0d67 : 85 4b __ STA T3 + 0 
0d69 : a5 4e __ LDA T4 + 1 
0d6b : 29 03 __ AND #$03
0d6d : 69 40 __ ADC #$40
0d6f : 85 4c __ STA T3 + 1 
0d71 : b1 4b __ LDA (T3 + 0),y 
0d73 : 8d 23 9f STA $9f23 
0d76 : 4c 68 0c JMP $0c68 ; (zsm_play.l8 + 0)
.s4:
0d79 : ce 60 40 DEC $4060 ; (zsm_delay + 0)
0d7c : 60 __ __ RTS
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
0d7d : ad 41 9f LDA $9f41 
0d80 : 30 fb __ BMI $0d7d ; (sfx_put.l1 + 0)
.s3:
0d82 : a5 2d __ LDA P0 ; (index + 0)
0d84 : 8d 40 9f STA $9f40 
0d87 : ea __ __ NOP
0d88 : ea __ __ NOP
0d89 : ea __ __ NOP
0d8a : ea __ __ NOP
0d8b : a5 2e __ LDA P1 ; (data + 0)
0d8d : 8d 41 9f STA $9f41 
.s1001:
0d90 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0d91 : a9 93 __ LDA #$93
0d93 : 85 2d __ STA P0 
0d95 : a9 00 __ LDA #$00
0d97 : 85 2e __ STA P1 
0d99 : 20 ce 0d JSR $0dce ; (putch.s0 + 0)
0d9c : a9 11 __ LDA #$11
0d9e : 8d 22 9f STA $9f22 
0da1 : a2 00 __ LDX #$00
.l2:
0da3 : 8a __ __ TXA
0da4 : 18 __ __ CLC
0da5 : 69 b0 __ ADC #$b0
0da7 : 8d 21 9f STA $9f21 
0daa : a9 00 __ LDA #$00
0dac : 8d 20 9f STA $9f20 
0daf : a0 80 __ LDY #$80
.l1003:
0db1 : a9 20 __ LDA #$20
0db3 : 8d 23 9f STA $9f23 
0db6 : a9 01 __ LDA #$01
0db8 : 8d 23 9f STA $9f23 
0dbb : a9 20 __ LDA #$20
0dbd : 8d 24 9f STA $9f24 
0dc0 : a9 01 __ LDA #$01
0dc2 : 8d 24 9f STA $9f24 
0dc5 : 88 __ __ DEY
0dc6 : d0 e9 __ BNE $0db1 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0dc8 : e8 __ __ INX
0dc9 : e0 40 __ CPX #$40
0dcb : 90 d6 __ BCC $0da3 ; (ClearVERAScreen.l2 + 0)
.s1001:
0dcd : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0dce : a5 2d __ LDA P0 
0dd0 : 20 d2 ff JSR $ffd2 
.s1001:
0dd3 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0dd4 : a9 00 __ LDA #$00
0dd6 : 85 2d __ STA P0 
0dd8 : 85 2e __ STA P1 
0dda : 85 2f __ STA P2 
0ddc : 85 30 __ STA P3 
0dde : 85 31 __ STA P4 
0de0 : 8d 25 9f STA $9f25 
0de3 : ad 29 9f LDA $9f29 
0de6 : 09 70 __ ORA #$70
0de8 : 8d 29 9f STA $9f29 
0deb : a9 80 __ LDA #$80
0ded : 8d 2b 9f STA $9f2b 
0df0 : 8d 2a 9f STA $9f2a 
0df3 : a9 62 __ LDA #$62
0df5 : 8d 2d 9f STA $9f2d 
0df8 : a9 68 __ LDA #$68
0dfa : 8d 34 9f STA $9f34 
0dfd : 20 51 16 JSR $1651 ; (tileBaseConfig.s0 + 0)
0e00 : 8d 2f 9f STA $9f2f 
0e03 : a9 20 __ LDA #$20
0e05 : 85 2f __ STA P2 
0e07 : 20 6a 16 JSR $166a ; (memoryToMapMemoryAddress.s0 + 0)
0e0a : 8d 2e 9f STA $9f2e 
0e0d : a9 21 __ LDA #$21
0e0f : 8d 22 9f STA $9f22 
0e12 : a2 80 __ LDX #$80
.l6:
0e14 : a0 50 __ LDY #$50
.l1025:
0e16 : a9 00 __ LDA #$00
0e18 : 8d 24 9f STA $9f24 
0e1b : a9 08 __ LDA #$08
0e1d : 8d 24 9f STA $9f24 
0e20 : 88 __ __ DEY
0e21 : d0 f3 __ BNE $0e16 ; (SetUpSprites.l1025 + 0)
.s1026:
0e23 : ca __ __ DEX
0e24 : d0 ee __ BNE $0e14 ; (SetUpSprites.l6 + 0)
.s4:
0e26 : a9 00 __ LDA #$00
0e28 : 85 2d __ STA P0 
0e2a : 85 2e __ STA P1 
0e2c : 85 2f __ STA P2 
0e2e : 85 30 __ STA P3 
0e30 : 85 33 __ STA P6 
0e32 : a9 01 __ LDA #$01
0e34 : 85 34 __ STA P7 
0e36 : a9 00 __ LDA #$00
0e38 : 85 31 __ STA P4 
0e3a : a9 1d __ LDA #$1d
0e3c : 85 32 __ STA P5 
0e3e : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
0e41 : a9 10 __ LDA #$10
0e43 : 8d 22 9f STA $9f22 
0e46 : a9 00 __ LDA #$00
0e48 : 8d 20 9f STA $9f20 
0e4b : a9 20 __ LDA #$20
0e4d : 8d 21 9f STA $9f21 
0e50 : a9 3c __ LDA #$3c
0e52 : 85 47 __ STA T1 + 0 
.l10:
0e54 : a9 00 __ LDA #$00
0e56 : 85 48 __ STA T2 + 0 
.l14:
0e58 : 20 b3 16 JSR $16b3 ; (rand.s0 + 0)
0e5b : a5 3b __ LDA ACCU + 0 
0e5d : 29 1f __ AND #$1f
0e5f : c9 1f __ CMP #$1f
0e61 : a5 48 __ LDA T2 + 0 
0e63 : 90 03 __ BCC $0e68 ; (SetUpSprites.s1023 + 0)
0e65 : 4c 1b 16 JMP $161b ; (SetUpSprites.s1017 + 0)
.s1023:
0e68 : c9 09 __ CMP #$09
0e6a : 90 06 __ BCC $0e72 ; (SetUpSprites.s20 + 0)
.s1022:
0e6c : a9 45 __ LDA #$45
0e6e : c5 48 __ CMP T2 + 0 
0e70 : b0 04 __ BCS $0e76 ; (SetUpSprites.s1021 + 0)
.s20:
0e72 : a9 00 __ LDA #$00
0e74 : f0 2f __ BEQ $0ea5 ; (SetUpSprites.s174 + 0)
.s1021:
0e76 : a5 48 __ LDA T2 + 0 
0e78 : c9 13 __ CMP #$13
0e7a : 90 06 __ BCC $0e82 ; (SetUpSprites.s24 + 0)
.s1020:
0e7c : a9 3b __ LDA #$3b
0e7e : c5 48 __ CMP T2 + 0 
0e80 : b0 04 __ BCS $0e86 ; (SetUpSprites.s1019 + 0)
.s24:
0e82 : a9 01 __ LDA #$01
0e84 : d0 12 __ BNE $0e98 ; (SetUpSprites.s184 + 0)
.s1019:
0e86 : a5 48 __ LDA T2 + 0 
0e88 : c9 1d __ CMP #$1d
0e8a : 90 06 __ BCC $0e92 ; (SetUpSprites.s28 + 0)
.s1018:
0e8c : a9 31 __ LDA #$31
0e8e : c5 48 __ CMP T2 + 0 
0e90 : b0 04 __ BCS $0e96 ; (SetUpSprites.s29 + 0)
.s28:
0e92 : a9 02 __ LDA #$02
0e94 : d0 02 __ BNE $0e98 ; (SetUpSprites.s184 + 0)
.s29:
0e96 : a9 03 __ LDA #$03
.s184:
0e98 : 8d 23 9f STA $9f23 
0e9b : a9 00 __ LDA #$00
0e9d : 8d 23 9f STA $9f23 
0ea0 : e6 48 __ INC T2 + 0 
0ea2 : 4c 58 0e JMP $0e58 ; (SetUpSprites.l14 + 0)
.s174:
0ea5 : 8d 23 9f STA $9f23 
0ea8 : a9 00 __ LDA #$00
0eaa : 8d 23 9f STA $9f23 
0ead : e6 48 __ INC T2 + 0 
0eaf : 10 a7 __ BPL $0e58 ; (SetUpSprites.l14 + 0)
.s11:
0eb1 : c6 47 __ DEC T1 + 0 
0eb3 : a5 47 __ LDA T1 + 0 
0eb5 : d0 9d __ BNE $0e54 ; (SetUpSprites.l10 + 0)
.s12:
0eb7 : 85 2d __ STA P0 
0eb9 : 85 30 __ STA P3 
0ebb : 85 33 __ STA P6 
0ebd : a9 31 __ LDA #$31
0ebf : 85 2e __ STA P1 
0ec1 : a9 01 __ LDA #$01
0ec3 : 85 2f __ STA P2 
0ec5 : a9 04 __ LDA #$04
0ec7 : 85 34 __ STA P7 
0ec9 : a9 00 __ LDA #$00
0ecb : 85 31 __ STA P4 
0ecd : a9 1e __ LDA #$1e
0ecf : 85 32 __ STA P5 
0ed1 : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
0ed4 : a9 00 __ LDA #$00
0ed6 : 85 4e __ STA T5 + 0 
0ed8 : 85 4f __ STA T5 + 1 
.l45:
0eda : 85 2d __ STA P0 
0edc : 18 __ __ CLC
0edd : 69 02 __ ADC #$02
0edf : 85 4c __ STA T4 + 0 
0ee1 : a9 00 __ LDA #$00
0ee3 : 2a __ __ ROL
0ee4 : 85 4d __ STA T4 + 1 
0ee6 : a9 88 __ LDA #$88
0ee8 : 85 2e __ STA P1 
0eea : a9 09 __ LDA #$09
0eec : 85 2f __ STA P2 
0eee : a9 00 __ LDA #$00
0ef0 : 85 30 __ STA P3 
0ef2 : a9 03 __ LDA #$03
0ef4 : 85 31 __ STA P4 
0ef6 : a9 02 __ LDA #$02
0ef8 : 85 32 __ STA P5 
0efa : 85 33 __ STA P6 
0efc : a9 01 __ LDA #$01
0efe : 85 34 __ STA P7 
0f00 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
0f03 : a5 4e __ LDA T5 + 0 
0f05 : 85 2e __ STA P1 
0f07 : a5 4f __ LDA T5 + 1 
0f09 : 85 2f __ STA P2 
0f0b : a9 90 __ LDA #$90
0f0d : 85 30 __ STA P3 
0f0f : a9 01 __ LDA #$01
0f11 : 85 31 __ STA P4 
0f13 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
0f16 : a9 00 __ LDA #$00
0f18 : 85 2e __ STA P1 
0f1a : a9 01 __ LDA #$01
0f1c : 85 2f __ STA P2 
0f1e : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
0f21 : a9 88 __ LDA #$88
0f23 : 85 2e __ STA P1 
0f25 : a9 09 __ LDA #$09
0f27 : 85 2f __ STA P2 
0f29 : a9 00 __ LDA #$00
0f2b : 85 30 __ STA P3 
0f2d : a9 03 __ LDA #$03
0f2f : 85 31 __ STA P4 
0f31 : e6 2d __ INC P0 
0f33 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
0f36 : a5 4e __ LDA T5 + 0 
0f38 : 85 2e __ STA P1 
0f3a : a5 4f __ LDA T5 + 1 
0f3c : 85 2f __ STA P2 
0f3e : a9 70 __ LDA #$70
0f40 : 85 30 __ STA P3 
0f42 : a9 01 __ LDA #$01
0f44 : 85 31 __ STA P4 
0f46 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
0f49 : a5 4d __ LDA T4 + 1 
0f4b : d0 16 __ BNE $0f63 ; (SetUpSprites.s47 + 0)
.s1013:
0f4d : 18 __ __ CLC
0f4e : a5 2e __ LDA P1 
0f50 : 69 40 __ ADC #$40
0f52 : 85 4e __ STA T5 + 0 
0f54 : a5 2f __ LDA P2 
0f56 : 69 00 __ ADC #$00
0f58 : 85 4f __ STA T5 + 1 
0f5a : a5 4c __ LDA T4 + 0 
0f5c : c9 14 __ CMP #$14
0f5e : b0 03 __ BCS $0f63 ; (SetUpSprites.s47 + 0)
0f60 : 4c da 0e JMP $0eda ; (SetUpSprites.l45 + 0)
.s47:
0f63 : a9 00 __ LDA #$00
0f65 : 85 2d __ STA P0 
0f67 : 85 30 __ STA P3 
0f69 : 85 33 __ STA P6 
0f6b : a9 30 __ LDA #$30
0f6d : 85 2e __ STA P1 
0f6f : a9 01 __ LDA #$01
0f71 : 85 2f __ STA P2 
0f73 : a9 00 __ LDA #$00
0f75 : 85 31 __ STA P4 
0f77 : a9 22 __ LDA #$22
0f79 : 85 32 __ STA P5 
0f7b : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
0f7e : a9 16 __ LDA #$16
0f80 : 85 2d __ STA P0 
0f82 : a9 80 __ LDA #$80
0f84 : 85 2e __ STA P1 
0f86 : a9 09 __ LDA #$09
0f88 : 85 2f __ STA P2 
0f8a : a9 01 __ LDA #$01
0f8c : 85 31 __ STA P4 
0f8e : 85 34 __ STA P7 
0f90 : a9 02 __ LDA #$02
0f92 : 85 32 __ STA P5 
0f94 : a9 03 __ LDA #$03
0f96 : 85 33 __ STA P6 
0f98 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
0f9b : a9 30 __ LDA #$30
0f9d : 85 2e __ STA P1 
0f9f : a9 01 __ LDA #$01
0fa1 : 85 2f __ STA P2 
0fa3 : a9 b8 __ LDA #$b8
0fa5 : 85 30 __ STA P3 
0fa7 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
0faa : a9 20 __ LDA #$20
0fac : 85 2d __ STA P0 
0fae : a9 35 __ LDA #$35
0fb0 : 85 2e __ STA P1 
0fb2 : a9 00 __ LDA #$00
0fb4 : 85 30 __ STA P3 
0fb6 : 85 33 __ STA P6 
0fb8 : a9 02 __ LDA #$02
0fba : 85 34 __ STA P7 
0fbc : a9 00 __ LDA #$00
0fbe : 85 31 __ STA P4 
0fc0 : a9 23 __ LDA #$23
0fc2 : 85 32 __ STA P5 
0fc4 : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
0fc7 : a9 17 __ LDA #$17
0fc9 : 85 2d __ STA P0 
0fcb : a9 a9 __ LDA #$a9
0fcd : 85 2e __ STA P1 
0fcf : a9 09 __ LDA #$09
0fd1 : 85 2f __ STA P2 
0fd3 : a9 02 __ LDA #$02
0fd5 : 85 31 __ STA P4 
0fd7 : 85 32 __ STA P5 
0fd9 : a9 03 __ LDA #$03
0fdb : 85 33 __ STA P6 
0fdd : a9 01 __ LDA #$01
0fdf : 85 34 __ STA P7 
0fe1 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
0fe4 : a9 fc __ LDA #$fc
0fe6 : 85 2e __ STA P1 
0fe8 : a9 00 __ LDA #$00
0fea : 85 2f __ STA P2 
0fec : a9 b8 __ LDA #$b8
0fee : 85 30 __ STA P3 
0ff0 : a9 01 __ LDA #$01
0ff2 : 85 31 __ STA P4 
0ff4 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
0ff7 : a9 18 __ LDA #$18
0ff9 : 85 2d __ STA P0 
0ffb : a9 a9 __ LDA #$a9
0ffd : 85 2e __ STA P1 
0fff : a9 09 __ LDA #$09
1001 : 85 2f __ STA P2 
1003 : a9 00 __ LDA #$00
1005 : 85 30 __ STA P3 
1007 : a9 02 __ LDA #$02
1009 : 85 31 __ STA P4 
100b : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
100e : a9 4c __ LDA #$4c
1010 : 85 2e __ STA P1 
1012 : a9 01 __ LDA #$01
1014 : 85 2f __ STA P2 
1016 : 85 31 __ STA P4 
1018 : a9 b8 __ LDA #$b8
101a : 85 30 __ STA P3 
101c : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
101f : a9 01 __ LDA #$01
1021 : 85 2e __ STA P1 
1023 : a9 00 __ LDA #$00
1025 : 85 2f __ STA P2 
1027 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
102a : a9 10 __ LDA #$10
102c : 85 2d __ STA P0 
102e : a9 20 __ LDA #$20
1030 : 85 30 __ STA P3 
1032 : a9 00 __ LDA #$00
1034 : 85 31 __ STA P4 
1036 : a9 00 __ LDA #$00
1038 : 85 2e __ STA P1 
103a : a9 25 __ LDA #$25
103c : 85 2f __ STA P2 
103e : 20 ad 17 JSR $17ad ; (vera_pal_putn.s0 + 0)
1041 : a9 00 __ LDA #$00
1043 : 85 2d __ STA P0 
1045 : 85 30 __ STA P3 
1047 : 85 34 __ STA P7 
1049 : a9 35 __ LDA #$35
104b : 85 2e __ STA P1 
104d : a9 01 __ LDA #$01
104f : 85 2f __ STA P2 
1051 : a9 20 __ LDA #$20
1053 : 85 33 __ STA P6 
1055 : a9 20 __ LDA #$20
1057 : 85 31 __ STA P4 
1059 : a9 25 __ LDA #$25
105b : 85 32 __ STA P5 
105d : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
1060 : a9 00 __ LDA #$00
1062 : 85 47 __ STA T1 + 0 
1064 : 85 48 __ STA T2 + 0 
1066 : a9 03 __ LDA #$03
1068 : 85 33 __ STA P6 
106a : a9 02 __ LDA #$02
106c : 85 34 __ STA P7 
106e : 18 __ __ CLC
.l1039:
106f : a9 a8 __ LDA #$a8
1071 : 85 2e __ STA P1 
1073 : a9 09 __ LDA #$09
1075 : 85 2f __ STA P2 
1077 : a9 00 __ LDA #$00
1079 : 85 30 __ STA P3 
107b : 85 31 __ STA P4 
107d : 85 32 __ STA P5 
107f : a5 47 __ LDA T1 + 0 
1081 : 69 19 __ ADC #$19
1083 : 85 2d __ STA P0 
1085 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1088 : a9 b8 __ LDA #$b8
108a : 85 30 __ STA P3 
108c : a9 01 __ LDA #$01
108e : 85 31 __ STA P4 
1090 : 38 __ __ SEC
1091 : a5 48 __ LDA T2 + 0 
1093 : e9 fc __ SBC #$fc
1095 : 85 2e __ STA P1 
1097 : a9 00 __ LDA #$00
1099 : e9 03 __ SBC #$03
109b : 85 2f __ STA P2 
109d : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
10a0 : 18 __ __ CLC
10a1 : a5 48 __ LDA T2 + 0 
10a3 : 69 0c __ ADC #$0c
10a5 : 85 48 __ STA T2 + 0 
10a7 : e6 47 __ INC T1 + 0 
10a9 : a5 47 __ LDA T1 + 0 
10ab : c9 08 __ CMP #$08
10ad : 90 c0 __ BCC $106f ; (SetUpSprites.l1039 + 0)
.s51:
10af : a9 00 __ LDA #$00
10b1 : 85 47 __ STA T1 + 0 
10b3 : 85 48 __ STA T2 + 0 
10b5 : a9 03 __ LDA #$03
10b7 : 85 33 __ STA P6 
10b9 : 85 34 __ STA P7 
10bb : 18 __ __ CLC
.l1041:
10bc : a9 a8 __ LDA #$a8
10be : 85 2e __ STA P1 
10c0 : a9 09 __ LDA #$09
10c2 : 85 2f __ STA P2 
10c4 : a9 00 __ LDA #$00
10c6 : 85 30 __ STA P3 
10c8 : 85 31 __ STA P4 
10ca : a5 47 __ LDA T1 + 0 
10cc : 69 21 __ ADC #$21
10ce : 85 2d __ STA P0 
10d0 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
10d3 : a9 c4 __ LDA #$c4
10d5 : 85 30 __ STA P3 
10d7 : a9 01 __ LDA #$01
10d9 : 85 31 __ STA P4 
10db : 38 __ __ SEC
10dc : a5 48 __ LDA T2 + 0 
10de : e9 fc __ SBC #$fc
10e0 : 85 2e __ STA P1 
10e2 : a9 00 __ LDA #$00
10e4 : e9 03 __ SBC #$03
10e6 : 85 2f __ STA P2 
10e8 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
10eb : 18 __ __ CLC
10ec : a5 48 __ LDA T2 + 0 
10ee : 69 0c __ ADC #$0c
10f0 : 85 48 __ STA T2 + 0 
10f2 : e6 47 __ INC T1 + 0 
10f4 : a5 47 __ LDA T1 + 0 
10f6 : c9 08 __ CMP #$08
10f8 : 90 c2 __ BCC $10bc ; (SetUpSprites.l1041 + 0)
.s55:
10fa : a9 00 __ LDA #$00
10fc : 85 47 __ STA T1 + 0 
10fe : 85 48 __ STA T2 + 0 
1100 : a9 03 __ LDA #$03
1102 : 85 33 __ STA P6 
1104 : a9 04 __ LDA #$04
1106 : 85 34 __ STA P7 
1108 : 18 __ __ CLC
.l1043:
1109 : a9 a8 __ LDA #$a8
110b : 85 2e __ STA P1 
110d : a9 09 __ LDA #$09
110f : 85 2f __ STA P2 
1111 : a9 00 __ LDA #$00
1113 : 85 30 __ STA P3 
1115 : 85 31 __ STA P4 
1117 : a5 47 __ LDA T1 + 0 
1119 : 69 29 __ ADC #$29
111b : 85 2d __ STA P0 
111d : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1120 : a9 b8 __ LDA #$b8
1122 : 85 30 __ STA P3 
1124 : a9 01 __ LDA #$01
1126 : 85 31 __ STA P4 
1128 : 38 __ __ SEC
1129 : a9 6c __ LDA #$6c
112b : e5 48 __ SBC T2 + 0 
112d : 85 2e __ STA P1 
112f : a9 02 __ LDA #$02
1131 : e9 04 __ SBC #$04
1133 : 85 2f __ STA P2 
1135 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1138 : 18 __ __ CLC
1139 : a5 48 __ LDA T2 + 0 
113b : 69 0c __ ADC #$0c
113d : 85 48 __ STA T2 + 0 
113f : e6 47 __ INC T1 + 0 
1141 : a5 47 __ LDA T1 + 0 
1143 : c9 08 __ CMP #$08
1145 : 90 c2 __ BCC $1109 ; (SetUpSprites.l1043 + 0)
.s59:
1147 : a9 00 __ LDA #$00
1149 : 85 47 __ STA T1 + 0 
.l61:
114b : 38 __ __ SEC
114c : a9 00 __ LDA #$00
114e : e5 47 __ SBC T1 + 0 
1150 : 29 0c __ AND #$0c
1152 : 49 ff __ EOR #$ff
1154 : 38 __ __ SEC
1155 : 69 6c __ ADC #$6c
1157 : 85 48 __ STA T2 + 0 
1159 : a9 02 __ LDA #$02
115b : e9 00 __ SBC #$00
115d : 85 49 __ STA T2 + 1 
115f : 18 __ __ CLC
1160 : a5 47 __ LDA T1 + 0 
1162 : 69 31 __ ADC #$31
1164 : 85 2d __ STA P0 
1166 : a9 02 __ LDA #$02
1168 : 85 50 __ STA T7 + 0 
116a : a9 03 __ LDA #$03
116c : 85 33 __ STA P6 
116e : a9 04 __ LDA #$04
1170 : 85 34 __ STA P7 
.l1033:
1172 : a9 a8 __ LDA #$a8
1174 : 85 2e __ STA P1 
1176 : a9 09 __ LDA #$09
1178 : 85 2f __ STA P2 
117a : a9 00 __ LDA #$00
117c : 85 30 __ STA P3 
117e : 85 31 __ STA P4 
1180 : 85 32 __ STA P5 
1182 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1185 : a5 48 __ LDA T2 + 0 
1187 : 85 2e __ STA P1 
1189 : a5 49 __ LDA T2 + 1 
118b : 85 2f __ STA P2 
118d : a9 b8 __ LDA #$b8
118f : 85 30 __ STA P3 
1191 : a9 01 __ LDA #$01
1193 : 85 31 __ STA P4 
1195 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1198 : c6 50 __ DEC T7 + 0 
119a : d0 d6 __ BNE $1172 ; (SetUpSprites.l1033 + 0)
.s62:
119c : e6 47 __ INC T1 + 0 
119e : a5 47 __ LDA T1 + 0 
11a0 : c9 02 __ CMP #$02
11a2 : 90 a7 __ BCC $114b ; (SetUpSprites.l61 + 0)
.s63:
11a4 : a9 60 __ LDA #$60
11a6 : 85 2d __ STA P0 
11a8 : a9 4f __ LDA #$4f
11aa : 85 2e __ STA P1 
11ac : a9 01 __ LDA #$01
11ae : 85 2f __ STA P2 
11b0 : 85 34 __ STA P7 
11b2 : a9 00 __ LDA #$00
11b4 : 85 30 __ STA P3 
11b6 : 85 33 __ STA P6 
11b8 : a9 00 __ LDA #$00
11ba : 85 31 __ STA P4 
11bc : a9 26 __ LDA #$26
11be : 85 32 __ STA P5 
11c0 : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
11c3 : a9 33 __ LDA #$33
11c5 : 85 2d __ STA P0 
11c7 : a9 7b __ LDA #$7b
11c9 : 85 2e __ STA P1 
11cb : a9 0a __ LDA #$0a
11cd : 85 2f __ STA P2 
11cf : a9 01 __ LDA #$01
11d1 : 85 31 __ STA P4 
11d3 : a9 02 __ LDA #$02
11d5 : 85 32 __ STA P5 
11d7 : a9 03 __ LDA #$03
11d9 : 85 33 __ STA P6 
11db : 85 34 __ STA P7 
11dd : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
11e0 : a9 34 __ LDA #$34
11e2 : 85 2e __ STA P1 
11e4 : a9 01 __ LDA #$01
11e6 : 85 2f __ STA P2 
11e8 : a9 78 __ LDA #$78
11ea : 85 30 __ STA P3 
11ec : a9 00 __ LDA #$00
11ee : 85 31 __ STA P4 
11f0 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
11f3 : a9 20 __ LDA #$20
11f5 : 85 2d __ STA P0 
11f7 : a9 3f __ LDA #$3f
11f9 : 85 2e __ STA P1 
11fb : a9 00 __ LDA #$00
11fd : 85 30 __ STA P3 
11ff : 85 33 __ STA P6 
1201 : a9 04 __ LDA #$04
1203 : 85 34 __ STA P7 
1205 : a9 00 __ LDA #$00
1207 : 85 31 __ STA P4 
1209 : a9 27 __ LDA #$27
120b : 85 32 __ STA P5 
120d : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
1210 : a9 34 __ LDA #$34
1212 : 85 2d __ STA P0 
1214 : a9 f9 __ LDA #$f9
1216 : 85 2e __ STA P1 
1218 : a9 09 __ LDA #$09
121a : 85 2f __ STA P2 
121c : a9 03 __ LDA #$03
121e : 85 31 __ STA P4 
1220 : 85 33 __ STA P6 
1222 : a9 02 __ LDA #$02
1224 : 85 32 __ STA P5 
1226 : a9 05 __ LDA #$05
1228 : 85 34 __ STA P7 
122a : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
122d : a9 1c __ LDA #$1c
122f : 85 2e __ STA P1 
1231 : a9 01 __ LDA #$01
1233 : 85 2f __ STA P2 
1235 : a9 78 __ LDA #$78
1237 : 85 30 __ STA P3 
1239 : a9 00 __ LDA #$00
123b : 85 31 __ STA P4 
123d : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1240 : a9 35 __ LDA #$35
1242 : 85 2d __ STA P0 
1244 : a9 19 __ LDA #$19
1246 : 85 2e __ STA P1 
1248 : a9 0a __ LDA #$0a
124a : 85 2f __ STA P2 
124c : a9 00 __ LDA #$00
124e : 85 30 __ STA P3 
1250 : a9 02 __ LDA #$02
1252 : 85 31 __ STA P4 
1254 : a9 03 __ LDA #$03
1256 : 85 32 __ STA P5 
1258 : a9 07 __ LDA #$07
125a : 85 33 __ STA P6 
125c : a9 06 __ LDA #$06
125e : 85 34 __ STA P7 
1260 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1263 : a9 10 __ LDA #$10
1265 : 85 2e __ STA P1 
1267 : a9 01 __ LDA #$01
1269 : 85 2f __ STA P2 
126b : a9 d8 __ LDA #$d8
126d : 85 30 __ STA P3 
126f : a9 00 __ LDA #$00
1271 : 85 31 __ STA P4 
1273 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1276 : a9 36 __ LDA #$36
1278 : 85 2d __ STA P0 
127a : a9 19 __ LDA #$19
127c : 85 2e __ STA P1 
127e : a9 0a __ LDA #$0a
1280 : 85 2f __ STA P2 
1282 : a9 00 __ LDA #$00
1284 : 85 30 __ STA P3 
1286 : a9 02 __ LDA #$02
1288 : 85 31 __ STA P4 
128a : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
128d : a9 70 __ LDA #$70
128f : 85 2e __ STA P1 
1291 : a9 01 __ LDA #$01
1293 : 85 2f __ STA P2 
1295 : a9 d8 __ LDA #$d8
1297 : 85 30 __ STA P3 
1299 : a9 00 __ LDA #$00
129b : 85 31 __ STA P4 
129d : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
12a0 : a9 01 __ LDA #$01
12a2 : 85 2e __ STA P1 
12a4 : a9 00 __ LDA #$00
12a6 : 85 2f __ STA P2 
12a8 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
12ab : a9 37 __ LDA #$37
12ad : 85 2d __ STA P0 
12af : a9 19 __ LDA #$19
12b1 : 85 2e __ STA P1 
12b3 : a9 0a __ LDA #$0a
12b5 : 85 2f __ STA P2 
12b7 : a9 00 __ LDA #$00
12b9 : 85 30 __ STA P3 
12bb : a9 02 __ LDA #$02
12bd : 85 31 __ STA P4 
12bf : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
12c2 : a9 10 __ LDA #$10
12c4 : 85 2e __ STA P1 
12c6 : a9 01 __ LDA #$01
12c8 : 85 2f __ STA P2 
12ca : 85 31 __ STA P4 
12cc : a9 08 __ LDA #$08
12ce : 85 30 __ STA P3 
12d0 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
12d3 : a9 00 __ LDA #$00
12d5 : 85 2e __ STA P1 
12d7 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
12da : a9 38 __ LDA #$38
12dc : 85 2d __ STA P0 
12de : a9 19 __ LDA #$19
12e0 : 85 2e __ STA P1 
12e2 : a9 0a __ LDA #$0a
12e4 : 85 2f __ STA P2 
12e6 : a9 00 __ LDA #$00
12e8 : 85 30 __ STA P3 
12ea : a9 02 __ LDA #$02
12ec : 85 31 __ STA P4 
12ee : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
12f1 : a9 70 __ LDA #$70
12f3 : 85 2e __ STA P1 
12f5 : a9 01 __ LDA #$01
12f7 : 85 2f __ STA P2 
12f9 : 85 31 __ STA P4 
12fb : a9 08 __ LDA #$08
12fd : 85 30 __ STA P3 
12ff : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1302 : a9 01 __ LDA #$01
1304 : 85 2e __ STA P1 
1306 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
1309 : a9 20 __ LDA #$20
130b : 85 2d __ STA P0 
130d : a9 37 __ LDA #$37
130f : 85 2e __ STA P1 
1311 : a9 00 __ LDA #$00
1313 : 85 30 __ STA P3 
1315 : 85 33 __ STA P6 
1317 : a9 08 __ LDA #$08
1319 : 85 34 __ STA P7 
131b : a9 00 __ LDA #$00
131d : 85 31 __ STA P4 
131f : a9 2b __ LDA #$2b
1321 : 85 32 __ STA P5 
1323 : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
1326 : a9 00 __ LDA #$00
1328 : 85 47 __ STA T1 + 0 
132a : 85 48 __ STA T2 + 0 
132c : 85 49 __ STA T2 + 1 
132e : a9 02 __ LDA #$02
1330 : 85 33 __ STA P6 
1332 : a9 05 __ LDA #$05
1334 : 85 34 __ STA P7 
1336 : 18 __ __ CLC
.l1045:
1337 : a9 b9 __ LDA #$b9
1339 : 85 2e __ STA P1 
133b : a9 09 __ LDA #$09
133d : 85 2f __ STA P2 
133f : a9 00 __ LDA #$00
1341 : 85 30 __ STA P3 
1343 : a9 03 __ LDA #$03
1345 : 85 31 __ STA P4 
1347 : 85 32 __ STA P5 
1349 : a5 47 __ LDA T1 + 0 
134b : 69 39 __ ADC #$39
134d : 85 2d __ STA P0 
134f : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1352 : a9 fa __ LDA #$fa
1354 : 85 2e __ STA P1 
1356 : a9 00 __ LDA #$00
1358 : 85 2f __ STA P2 
135a : 38 __ __ SEC
135b : a5 48 __ LDA T2 + 0 
135d : e9 20 __ SBC #$20
135f : 85 4a __ STA T3 + 0 
1361 : 85 30 __ STA P3 
1363 : a5 49 __ LDA T2 + 1 
1365 : e9 00 __ SBC #$00
1367 : 85 4b __ STA T3 + 1 
1369 : 85 31 __ STA P4 
136b : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
136e : a9 b9 __ LDA #$b9
1370 : 85 2e __ STA P1 
1372 : a9 09 __ LDA #$09
1374 : 85 2f __ STA P2 
1376 : a9 00 __ LDA #$00
1378 : 85 30 __ STA P3 
137a : a9 03 __ LDA #$03
137c : 85 31 __ STA P4 
137e : 18 __ __ CLC
137f : a5 47 __ LDA T1 + 0 
1381 : 69 40 __ ADC #$40
1383 : 85 2d __ STA P0 
1385 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1388 : a9 3a __ LDA #$3a
138a : 85 2e __ STA P1 
138c : a9 01 __ LDA #$01
138e : 85 2f __ STA P2 
1390 : a5 4a __ LDA T3 + 0 
1392 : 85 30 __ STA P3 
1394 : a5 4b __ LDA T3 + 1 
1396 : 85 31 __ STA P4 
1398 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
139b : a9 01 __ LDA #$01
139d : 85 2e __ STA P1 
139f : a9 00 __ LDA #$00
13a1 : 85 2f __ STA P2 
13a3 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
13a6 : 18 __ __ CLC
13a7 : a5 48 __ LDA T2 + 0 
13a9 : 69 40 __ ADC #$40
13ab : 85 48 __ STA T2 + 0 
13ad : 90 02 __ BCC $13b1 ; (SetUpSprites.s1048 + 0)
.s1047:
13af : e6 49 __ INC T2 + 1 
.s1048:
13b1 : e6 47 __ INC T1 + 0 
13b3 : a5 47 __ LDA T1 + 0 
13b5 : c9 07 __ CMP #$07
13b7 : b0 03 __ BCS $13bc ; (SetUpSprites.s71 + 0)
13b9 : 4c 37 13 JMP $1337 ; (SetUpSprites.l1045 + 0)
.s71:
13bc : a9 20 __ LDA #$20
13be : 85 2d __ STA P0 
13c0 : a9 47 __ LDA #$47
13c2 : 85 2e __ STA P1 
13c4 : a9 01 __ LDA #$01
13c6 : 85 2f __ STA P2 
13c8 : a9 00 __ LDA #$00
13ca : 85 30 __ STA P3 
13cc : 85 33 __ STA P6 
13ce : a9 08 __ LDA #$08
13d0 : 85 34 __ STA P7 
13d2 : a9 00 __ LDA #$00
13d4 : 85 31 __ STA P4 
13d6 : a9 33 __ LDA #$33
13d8 : 85 32 __ STA P5 
13da : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
13dd : a9 47 __ LDA #$47
13df : 85 2d __ STA P0 
13e1 : a9 39 __ LDA #$39
13e3 : 85 2e __ STA P1 
13e5 : a9 0a __ LDA #$0a
13e7 : 85 2f __ STA P2 
13e9 : a9 03 __ LDA #$03
13eb : 85 31 __ STA P4 
13ed : 85 32 __ STA P5 
13ef : a9 07 __ LDA #$07
13f1 : 85 33 __ STA P6 
13f3 : a9 06 __ LDA #$06
13f5 : 85 34 __ STA P7 
13f7 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
13fa : a9 08 __ LDA #$08
13fc : 85 2e __ STA P1 
13fe : 85 30 __ STA P3 
1400 : a9 00 __ LDA #$00
1402 : 85 2f __ STA P2 
1404 : 85 31 __ STA P4 
1406 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1409 : a9 48 __ LDA #$48
140b : 85 2d __ STA P0 
140d : a9 39 __ LDA #$39
140f : 85 2e __ STA P1 
1411 : a9 0a __ LDA #$0a
1413 : 85 2f __ STA P2 
1415 : a9 00 __ LDA #$00
1417 : 85 30 __ STA P3 
1419 : a9 03 __ LDA #$03
141b : 85 31 __ STA P4 
141d : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1420 : a9 48 __ LDA #$48
1422 : 85 2e __ STA P1 
1424 : a9 00 __ LDA #$00
1426 : 85 2f __ STA P2 
1428 : 85 31 __ STA P4 
142a : a9 08 __ LDA #$08
142c : 85 30 __ STA P3 
142e : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1431 : a9 01 __ LDA #$01
1433 : 85 2e __ STA P1 
1435 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
1438 : a9 49 __ LDA #$49
143a : 85 2d __ STA P0 
143c : a9 39 __ LDA #$39
143e : 85 2e __ STA P1 
1440 : a9 0a __ LDA #$0a
1442 : 85 2f __ STA P2 
1444 : a9 00 __ LDA #$00
1446 : 85 30 __ STA P3 
1448 : a9 03 __ LDA #$03
144a : 85 31 __ STA P4 
144c : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
144f : a9 48 __ LDA #$48
1451 : 85 2e __ STA P1 
1453 : 85 30 __ STA P3 
1455 : a9 00 __ LDA #$00
1457 : 85 2f __ STA P2 
1459 : 85 31 __ STA P4 
145b : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
145e : a9 01 __ LDA #$01
1460 : 85 2e __ STA P1 
1462 : 85 2f __ STA P2 
1464 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
1467 : a9 4a __ LDA #$4a
1469 : 85 2d __ STA P0 
146b : a9 39 __ LDA #$39
146d : 85 2e __ STA P1 
146f : a9 0a __ LDA #$0a
1471 : 85 2f __ STA P2 
1473 : a9 00 __ LDA #$00
1475 : 85 30 __ STA P3 
1477 : a9 03 __ LDA #$03
1479 : 85 31 __ STA P4 
147b : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
147e : a9 08 __ LDA #$08
1480 : 85 2e __ STA P1 
1482 : a9 00 __ LDA #$00
1484 : 85 2f __ STA P2 
1486 : 85 31 __ STA P4 
1488 : a9 48 __ LDA #$48
148a : 85 30 __ STA P3 
148c : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
148f : a9 00 __ LDA #$00
1491 : 85 2e __ STA P1 
1493 : a9 01 __ LDA #$01
1495 : 85 2f __ STA P2 
1497 : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
149a : a9 20 __ LDA #$20
149c : 85 2d __ STA P0 
149e : a9 47 __ LDA #$47
14a0 : 85 2e __ STA P1 
14a2 : a9 00 __ LDA #$00
14a4 : 85 30 __ STA P3 
14a6 : a9 00 __ LDA #$00
14a8 : 85 31 __ STA P4 
14aa : a9 33 __ LDA #$33
14ac : 85 32 __ STA P5 
14ae : a9 00 __ LDA #$00
14b0 : 85 33 __ STA P6 
14b2 : a9 08 __ LDA #$08
14b4 : 85 34 __ STA P7 
14b6 : 20 78 16 JSR $1678 ; (vram_putn.s0 + 0)
14b9 : a9 4b __ LDA #$4b
14bb : 85 2d __ STA P0 
14bd : a9 39 __ LDA #$39
14bf : 85 2e __ STA P1 
14c1 : a9 0a __ LDA #$0a
14c3 : 85 2f __ STA P2 
14c5 : a9 03 __ LDA #$03
14c7 : 85 31 __ STA P4 
14c9 : 85 32 __ STA P5 
14cb : a9 07 __ LDA #$07
14cd : 85 33 __ STA P6 
14cf : a9 06 __ LDA #$06
14d1 : 85 34 __ STA P7 
14d3 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
14d6 : a9 f8 __ LDA #$f8
14d8 : 85 2e __ STA P1 
14da : a9 01 __ LDA #$01
14dc : 85 2f __ STA P2 
14de : a9 08 __ LDA #$08
14e0 : 85 30 __ STA P3 
14e2 : a9 00 __ LDA #$00
14e4 : 85 31 __ STA P4 
14e6 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
14e9 : a9 4c __ LDA #$4c
14eb : 85 2d __ STA P0 
14ed : a9 39 __ LDA #$39
14ef : 85 2e __ STA P1 
14f1 : a9 0a __ LDA #$0a
14f3 : 85 2f __ STA P2 
14f5 : a9 00 __ LDA #$00
14f7 : 85 30 __ STA P3 
14f9 : a9 03 __ LDA #$03
14fb : 85 31 __ STA P4 
14fd : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1500 : a9 38 __ LDA #$38
1502 : 85 2e __ STA P1 
1504 : a9 02 __ LDA #$02
1506 : 85 2f __ STA P2 
1508 : a9 08 __ LDA #$08
150a : 85 30 __ STA P3 
150c : a9 00 __ LDA #$00
150e : 85 31 __ STA P4 
1510 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1513 : a9 01 __ LDA #$01
1515 : 85 2e __ STA P1 
1517 : a9 00 __ LDA #$00
1519 : 85 2f __ STA P2 
151b : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
151e : a9 4d __ LDA #$4d
1520 : 85 2d __ STA P0 
1522 : a9 39 __ LDA #$39
1524 : 85 2e __ STA P1 
1526 : a9 0a __ LDA #$0a
1528 : 85 2f __ STA P2 
152a : a9 00 __ LDA #$00
152c : 85 30 __ STA P3 
152e : a9 03 __ LDA #$03
1530 : 85 31 __ STA P4 
1532 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1535 : a9 38 __ LDA #$38
1537 : 85 2e __ STA P1 
1539 : a9 02 __ LDA #$02
153b : 85 2f __ STA P2 
153d : a9 48 __ LDA #$48
153f : 85 30 __ STA P3 
1541 : a9 00 __ LDA #$00
1543 : 85 31 __ STA P4 
1545 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1548 : a9 01 __ LDA #$01
154a : 85 2e __ STA P1 
154c : 85 2f __ STA P2 
154e : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
1551 : a9 4e __ LDA #$4e
1553 : 85 2d __ STA P0 
1555 : a9 39 __ LDA #$39
1557 : 85 2e __ STA P1 
1559 : a9 0a __ LDA #$0a
155b : 85 2f __ STA P2 
155d : a9 00 __ LDA #$00
155f : 85 30 __ STA P3 
1561 : a9 03 __ LDA #$03
1563 : 85 31 __ STA P4 
1565 : 20 da 16 JSR $16da ; (vera_spr_set.s0 + 0)
1568 : a9 f8 __ LDA #$f8
156a : 85 2e __ STA P1 
156c : a9 01 __ LDA #$01
156e : 85 2f __ STA P2 
1570 : a9 48 __ LDA #$48
1572 : 85 30 __ STA P3 
1574 : a9 00 __ LDA #$00
1576 : 85 31 __ STA P4 
1578 : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
157b : a9 00 __ LDA #$00
157d : 85 2e __ STA P1 
157f : 20 70 17 JSR $1770 ; (vera_spr_flip.s0 + 0)
1582 : a9 20 __ LDA #$20
1584 : 85 37 __ STA P10 
1586 : a9 40 __ LDA #$40
1588 : 8d fc 9e STA $9efc ; (sstack + 0)
158b : a9 fa __ LDA #$fa
158d : 8d fd 9e STA $9efd ; (sstack + 1)
1590 : a9 01 __ LDA #$01
1592 : 8d fe 9e STA $9efe ; (sstack + 2)
1595 : a9 00 __ LDA #$00
1597 : 8d ff 9e STA $9eff ; (sstack + 3)
159a : a9 40 __ LDA #$40
159c : 85 35 __ STA P8 
159e : a9 25 __ LDA #$25
15a0 : 85 36 __ STA P9 
15a2 : 20 f6 17 JSR $17f6 ; (SetPaletteColours.s0 + 0)
15a5 : a9 60 __ LDA #$60
15a7 : 8d fc 9e STA $9efc ; (sstack + 0)
15aa : a9 fa __ LDA #$fa
15ac : 8d fd 9e STA $9efd ; (sstack + 1)
15af : a9 01 __ LDA #$01
15b1 : 8d fe 9e STA $9efe ; (sstack + 2)
15b4 : a9 00 __ LDA #$00
15b6 : 8d ff 9e STA $9eff ; (sstack + 3)
15b9 : a9 60 __ LDA #$60
15bb : 85 35 __ STA P8 
15bd : a9 25 __ LDA #$25
15bf : 85 36 __ STA P9 
15c1 : 20 f6 17 JSR $17f6 ; (SetPaletteColours.s0 + 0)
15c4 : a9 80 __ LDA #$80
15c6 : 8d fc 9e STA $9efc ; (sstack + 0)
15c9 : a9 fa __ LDA #$fa
15cb : 8d fd 9e STA $9efd ; (sstack + 1)
15ce : a9 01 __ LDA #$01
15d0 : 8d fe 9e STA $9efe ; (sstack + 2)
15d3 : a9 00 __ LDA #$00
15d5 : 8d ff 9e STA $9eff ; (sstack + 3)
15d8 : a9 80 __ LDA #$80
15da : 85 35 __ STA P8 
15dc : a9 25 __ LDA #$25
15de : 85 36 __ STA P9 
15e0 : 20 f6 17 JSR $17f6 ; (SetPaletteColours.s0 + 0)
15e3 : a9 60 __ LDA #$60
15e5 : 85 2d __ STA P0 
15e7 : a9 0c __ LDA #$0c
15e9 : 85 30 __ STA P3 
15eb : a9 00 __ LDA #$00
15ed : 85 31 __ STA P4 
15ef : a9 e7 __ LDA #$e7
15f1 : 85 2e __ STA P1 
15f3 : a9 1c __ LDA #$1c
15f5 : 85 2f __ STA P2 
15f7 : 20 ad 17 JSR $17ad ; (vera_pal_putn.s0 + 0)
15fa : a9 20 __ LDA #$20
15fc : 85 2d __ STA P0 
15fe : a9 43 __ LDA #$43
1600 : 85 2e __ STA P1 
1602 : a9 01 __ LDA #$01
1604 : 85 2f __ STA P2 
1606 : a9 00 __ LDA #$00
1608 : 85 30 __ STA P3 
160a : 85 33 __ STA P6 
160c : a9 04 __ LDA #$04
160e : 85 34 __ STA P7 
1610 : a9 00 __ LDA #$00
1612 : 85 31 __ STA P4 
1614 : a9 3b __ LDA #$3b
1616 : 85 32 __ STA P5 
1618 : 4c 78 16 JMP $1678 ; (vram_putn.s0 + 0)
.s1017:
161b : c9 09 __ CMP #$09
161d : 90 06 __ BCC $1625 ; (SetUpSprites.s32 + 0)
.s1016:
161f : a9 45 __ LDA #$45
1621 : c5 48 __ CMP T2 + 0 
1623 : b0 05 __ BCS $162a ; (SetUpSprites.s1005 + 0)
.s32:
1625 : a9 04 __ LDA #$04
1627 : 4c a5 0e JMP $0ea5 ; (SetUpSprites.s174 + 0)
.s1005:
162a : a5 48 __ LDA T2 + 0 
162c : c9 13 __ CMP #$13
162e : 90 06 __ BCC $1636 ; (SetUpSprites.s36 + 0)
.s1004:
1630 : a9 3b __ LDA #$3b
1632 : c5 48 __ CMP T2 + 0 
1634 : b0 05 __ BCS $163b ; (SetUpSprites.s1003 + 0)
.s36:
1636 : a9 05 __ LDA #$05
1638 : 4c 98 0e JMP $0e98 ; (SetUpSprites.s184 + 0)
.s1003:
163b : a5 48 __ LDA T2 + 0 
163d : c9 1d __ CMP #$1d
163f : 90 06 __ BCC $1647 ; (SetUpSprites.s40 + 0)
.s1002:
1641 : a9 31 __ LDA #$31
1643 : c5 48 __ CMP T2 + 0 
1645 : b0 05 __ BCS $164c ; (SetUpSprites.s41 + 0)
.s40:
1647 : a9 06 __ LDA #$06
1649 : 4c 98 0e JMP $0e98 ; (SetUpSprites.s184 + 0)
.s41:
164c : a9 07 __ LDA #$07
164e : 4c 98 0e JMP $0e98 ; (SetUpSprites.s184 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1651 : a5 2d __ LDA P0 ; (bank + 0)
1653 : 4a __ __ LSR
1654 : a9 00 __ LDA #$00
1656 : 6a __ __ ROR
1657 : 85 3b __ STA ACCU + 0 
1659 : a5 2f __ LDA P2 ; (mem + 1)
165b : 29 f8 __ AND #$f8
165d : 4a __ __ LSR
165e : 05 3b __ ORA ACCU + 0 
1660 : 85 3b __ STA ACCU + 0 
1662 : a5 30 __ LDA P3 ; (height + 0)
1664 : 0a __ __ ASL
1665 : 05 3b __ ORA ACCU + 0 
1667 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1669 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
166a : a5 2d __ LDA P0 ; (bank + 0)
166c : 4a __ __ LSR
166d : a9 00 __ LDA #$00
166f : 6a __ __ ROR
1670 : 85 3b __ STA ACCU + 0 
1672 : a5 2f __ LDA P2 ; (mem + 1)
1674 : 4a __ __ LSR
1675 : 05 3b __ ORA ACCU + 0 
.s1001:
1677 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1678 : ad 25 9f LDA $9f25 
167b : 29 fe __ AND #$fe
167d : 8d 25 9f STA $9f25 
1680 : a5 2d __ LDA P0 ; (addr + 0)
1682 : 8d 20 9f STA $9f20 
1685 : a5 2e __ LDA P1 ; (addr + 1)
1687 : 8d 21 9f STA $9f21 
168a : a5 2f __ LDA P2 ; (addr + 2)
168c : 29 01 __ AND #$01
168e : 09 10 __ ORA #$10
1690 : 8d 22 9f STA $9f22 
1693 : a5 33 __ LDA P6 ; (size + 0)
1695 : 05 34 __ ORA P7 ; (size + 1)
1697 : f0 19 __ BEQ $16b2 ; (vram_putn.s1001 + 0)
.s6:
1699 : a0 00 __ LDY #$00
169b : a6 33 __ LDX P6 ; (size + 0)
169d : f0 02 __ BEQ $16a1 ; (vram_putn.l1002 + 0)
.s1005:
169f : e6 34 __ INC P7 ; (size + 1)
.l1002:
16a1 : b1 31 __ LDA (P4),y ; (data + 0)
16a3 : 8d 23 9f STA $9f23 
16a6 : c8 __ __ INY
16a7 : d0 02 __ BNE $16ab ; (vram_putn.s1009 + 0)
.s1008:
16a9 : e6 32 __ INC P5 ; (data + 1)
.s1009:
16ab : ca __ __ DEX
16ac : d0 f3 __ BNE $16a1 ; (vram_putn.l1002 + 0)
.s1004:
16ae : c6 34 __ DEC P7 ; (size + 1)
16b0 : d0 ef __ BNE $16a1 ; (vram_putn.l1002 + 0)
.s1001:
16b2 : 60 __ __ RTS
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
16b3 : ad e6 1c LDA $1ce6 ; (seed + 1)
16b6 : 4a __ __ LSR
16b7 : ad e5 1c LDA $1ce5 ; (seed + 0)
16ba : 6a __ __ ROR
16bb : aa __ __ TAX
16bc : a9 00 __ LDA #$00
16be : 6a __ __ ROR
16bf : 4d e5 1c EOR $1ce5 ; (seed + 0)
16c2 : 85 3b __ STA ACCU + 0 
16c4 : 8a __ __ TXA
16c5 : 4d e6 1c EOR $1ce6 ; (seed + 1)
16c8 : 85 3c __ STA ACCU + 1 
16ca : 4a __ __ LSR
16cb : 45 3b __ EOR ACCU + 0 
16cd : 8d e5 1c STA $1ce5 ; (seed + 0)
16d0 : 85 3b __ STA ACCU + 0 
16d2 : 45 3c __ EOR ACCU + 1 
16d4 : 8d e6 1c STA $1ce6 ; (seed + 1)
16d7 : 85 3c __ STA ACCU + 1 
.s1001:
16d9 : 60 __ __ RTS
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
16da : ad 25 9f LDA $9f25 
16dd : 29 fe __ AND #$fe
16df : 8d 25 9f STA $9f25 
16e2 : a5 2d __ LDA P0 ; (spr + 0)
16e4 : 0a __ __ ASL
16e5 : 0a __ __ ASL
16e6 : 85 3b __ STA ACCU + 0 
16e8 : a9 3f __ LDA #$3f
16ea : 2a __ __ ROL
16eb : 06 3b __ ASL ACCU + 0 
16ed : 2a __ __ ROL
16ee : 8d 21 9f STA $9f21 
16f1 : a5 3b __ LDA ACCU + 0 
16f3 : 8d 20 9f STA $9f20 
16f6 : a9 11 __ LDA #$11
16f8 : 8d 22 9f STA $9f22 
16fb : a5 30 __ LDA P3 ; (mode8 + 0)
16fd : f0 02 __ BEQ $1701 ; (vera_spr_set.s11 + 0)
.s9:
16ff : a9 80 __ LDA #$80
.s11:
1701 : 05 2f __ ORA P2 ; (addr32 + 1)
1703 : a6 2e __ LDX P1 ; (addr32 + 0)
1705 : 8e 23 9f STX $9f23 
1708 : 8d 23 9f STA $9f23 
170b : a9 00 __ LDA #$00
170d : 8d 23 9f STA $9f23 
1710 : 8d 23 9f STA $9f23 
1713 : 8d 23 9f STA $9f23 
1716 : 8d 23 9f STA $9f23 
1719 : a5 33 __ LDA P6 ; (z + 0)
171b : 0a __ __ ASL
171c : 0a __ __ ASL
171d : 8d 23 9f STA $9f23 
1720 : a5 32 __ LDA P5 ; (h + 0)
1722 : 4a __ __ LSR
1723 : 6a __ __ ROR
1724 : 29 80 __ AND #$80
1726 : 6a __ __ ROR
1727 : 85 3b __ STA ACCU + 0 
1729 : a5 31 __ LDA P4 ; (w + 0)
172b : 0a __ __ ASL
172c : 0a __ __ ASL
172d : 0a __ __ ASL
172e : 0a __ __ ASL
172f : 05 3b __ ORA ACCU + 0 
1731 : 05 34 __ ORA P7 ; (pal + 0)
1733 : 8d 23 9f STA $9f23 
.s1001:
1736 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1737 : ad 25 9f LDA $9f25 
173a : 29 fe __ AND #$fe
173c : 8d 25 9f STA $9f25 
173f : a5 2d __ LDA P0 ; (spr + 0)
1741 : 0a __ __ ASL
1742 : 0a __ __ ASL
1743 : 85 3b __ STA ACCU + 0 
1745 : a9 3f __ LDA #$3f
1747 : 2a __ __ ROL
1748 : 06 3b __ ASL ACCU + 0 
174a : 2a __ __ ROL
174b : aa __ __ TAX
174c : a5 3b __ LDA ACCU + 0 
174e : 09 02 __ ORA #$02
1750 : 8d 20 9f STA $9f20 
1753 : 8e 21 9f STX $9f21 
1756 : a9 11 __ LDA #$11
1758 : 8d 22 9f STA $9f22 
175b : a5 2e __ LDA P1 ; (x + 0)
175d : 8d 23 9f STA $9f23 
1760 : a5 2f __ LDA P2 ; (x + 1)
1762 : 8d 23 9f STA $9f23 
1765 : a5 30 __ LDA P3 ; (y + 0)
1767 : 8d 23 9f STA $9f23 
176a : a5 31 __ LDA P4 ; (y + 1)
176c : 8d 23 9f STA $9f23 
.s1001:
176f : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
1770 : ad 25 9f LDA $9f25 
1773 : 29 fe __ AND #$fe
1775 : 8d 25 9f STA $9f25 
1778 : a5 2d __ LDA P0 ; (spr + 0)
177a : 0a __ __ ASL
177b : 0a __ __ ASL
177c : 85 3b __ STA ACCU + 0 
177e : a9 3f __ LDA #$3f
1780 : 2a __ __ ROL
1781 : 06 3b __ ASL ACCU + 0 
1783 : 2a __ __ ROL
1784 : aa __ __ TAX
1785 : a5 3b __ LDA ACCU + 0 
1787 : 09 06 __ ORA #$06
1789 : 8d 20 9f STA $9f20 
178c : 8e 21 9f STX $9f21 
178f : a9 01 __ LDA #$01
1791 : 8d 22 9f STA $9f22 
1794 : ad 23 9f LDA $9f23 
1797 : 29 fc __ AND #$fc
1799 : a8 __ __ TAY
179a : a5 2e __ LDA P1 ; (fliph + 0)
179c : f0 01 __ BEQ $179f ; (vera_spr_flip.s14 + 0)
.s6:
179e : c8 __ __ INY
.s14:
179f : a5 2f __ LDA P2 ; (flipv + 0)
17a1 : f0 05 __ BEQ $17a8 ; (vera_spr_flip.s11 + 0)
.s9:
17a3 : 98 __ __ TYA
17a4 : 09 02 __ ORA #$02
17a6 : d0 01 __ BNE $17a9 ; (vera_spr_flip.s1002 + 0)
.s11:
17a8 : 98 __ __ TYA
.s1002:
17a9 : 8d 23 9f STA $9f23 
.s1001:
17ac : 60 __ __ RTS
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
17ad : ad 25 9f LDA $9f25 
17b0 : 29 fe __ AND #$fe
17b2 : 8d 25 9f STA $9f25 
17b5 : a5 2d __ LDA P0 ; (index + 0)
17b7 : 0a __ __ ASL
17b8 : 8d 20 9f STA $9f20 
17bb : a9 7d __ LDA #$7d
17bd : 2a __ __ ROL
17be : 8d 21 9f STA $9f21 
17c1 : a9 11 __ LDA #$11
17c3 : 8d 22 9f STA $9f22 
17c6 : a5 30 __ LDA P3 ; (size + 0)
17c8 : 05 31 __ ORA P4 ; (size + 1)
17ca : f0 29 __ BEQ $17f5 ; (vera_pal_putn.s1001 + 0)
.s6:
17cc : a6 30 __ LDX P3 ; (size + 0)
17ce : f0 02 __ BEQ $17d2 ; (vera_pal_putn.l3 + 0)
.s1003:
17d0 : e6 31 __ INC P4 ; (size + 1)
.l3:
17d2 : a0 01 __ LDY #$01
17d4 : b1 2e __ LDA (P1),y ; (color + 0)
17d6 : 85 3c __ STA ACCU + 1 
17d8 : 88 __ __ DEY
17d9 : b1 2e __ LDA (P1),y ; (color + 0)
17db : 8d 23 9f STA $9f23 
17de : a5 3c __ LDA ACCU + 1 
17e0 : 8d 23 9f STA $9f23 
17e3 : 18 __ __ CLC
17e4 : a5 2e __ LDA P1 ; (color + 0)
17e6 : 69 02 __ ADC #$02
17e8 : 85 2e __ STA P1 ; (color + 0)
17ea : 90 02 __ BCC $17ee ; (vera_pal_putn.s1007 + 0)
.s1006:
17ec : e6 2f __ INC P2 ; (color + 1)
.s1007:
17ee : ca __ __ DEX
17ef : d0 e1 __ BNE $17d2 ; (vera_pal_putn.l3 + 0)
.s1002:
17f1 : c6 31 __ DEC P4 ; (size + 1)
17f3 : d0 dd __ BNE $17d2 ; (vera_pal_putn.l3 + 0)
.s1001:
17f5 : 60 __ __ RTS
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
17f6 : ad fc 9e LDA $9efc ; (sstack + 0)
17f9 : 85 2d __ STA P0 
17fb : ad fd 9e LDA $9efd ; (sstack + 1)
17fe : 85 2e __ STA P1 
1800 : ad fe 9e LDA $9efe ; (sstack + 2)
1803 : 85 2f __ STA P2 
1805 : ad ff 9e LDA $9eff ; (sstack + 3)
1808 : 85 30 __ STA P3 
180a : a5 35 __ LDA P8 ; (input + 0)
180c : 85 31 __ STA P4 
180e : a5 36 __ LDA P9 ; (input + 1)
1810 : 85 32 __ STA P5 
1812 : a5 37 __ LDA P10 ; (inputsize + 0)
1814 : 85 33 __ STA P6 
1816 : a9 00 __ LDA #$00
1818 : 85 34 __ STA P7 
181a : 4c 78 16 JMP $1678 ; (vram_putn.s0 + 0)
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
p:
1cf3 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
1cf5 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
Phase2:
1cf7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
181d : a9 33 __ LDA #$33
181f : 85 2d __ STA P0 
1821 : a9 34 __ LDA #$34
1823 : 85 2e __ STA P1 
1825 : a9 01 __ LDA #$01
1827 : 85 2f __ STA P2 
1829 : a6 32 __ LDX P5 ; (p + 0)
182b : bd 00 3f LDA $3f00,x ; (sintab + 0)
182e : 4a __ __ LSR
182f : 4a __ __ LSR
1830 : 4a __ __ LSR
1831 : 49 10 __ EOR #$10
1833 : 38 __ __ SEC
1834 : e9 10 __ SBC #$10
1836 : 18 __ __ CLC
1837 : 69 b4 __ ADC #$b4
1839 : 85 30 __ STA P3 
183b : a9 00 __ LDA #$00
183d : 85 31 __ STA P4 
183f : 20 37 17 JSR $1737 ; (vera_spr_move.s0 + 0)
1842 : a9 34 __ LDA #$34
1844 : 85 2d __ STA P0 
1846 : a9 1c __ LDA #$1c
1848 : 85 2e __ STA P1 
184a : a6 34 __ LDX P7 ; (p2 + 0)
184c : bd 00 3f LDA $3f00,x ; (sintab + 0)
184f : 4a __ __ LSR
1850 : 4a __ __ LSR
1851 : 4a __ __ LSR
1852 : 49 10 __ EOR #$10
1854 : 38 __ __ SEC
1855 : e9 10 __ SBC #$10
1857 : 18 __ __ CLC
1858 : 69 b4 __ ADC #$b4
185a : 85 30 __ STA P3 
185c : 4c 37 17 JMP $1737 ; (vera_spr_move.s0 + 0)
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
185f : 20 90 18 JSR $1890 ; (zsm_check.s0 + 0)
1862 : 09 00 __ ORA #$00
1864 : d0 01 __ BNE $1867 ; (PlayZSM.s1 + 0)
.s1001:
1866 : 60 __ __ RTS
.s1:
1867 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1869 : 05 32 __ ORA P5 ; (TuneSelection + 0)
186b : d0 07 __ BNE $1874 ; (PlayZSM.s11 + 0)
.s7:
186d : a9 1a __ LDA #$1a
186f : a0 1f __ LDY #$1f
1871 : 4c 89 18 JMP $1889 ; (PlayZSM.s15 + 0)
.s11:
1874 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1876 : d0 06 __ BNE $187e ; (PlayZSM.s5 + 0)
.s1002:
1878 : a5 32 __ LDA P5 ; (TuneSelection + 0)
187a : c9 01 __ CMP #$01
187c : f0 07 __ BEQ $1885 ; (PlayZSM.s9 + 0)
.s5:
187e : a9 1a __ LDA #$1a
1880 : a0 01 __ LDY #$01
1882 : 4c 89 18 JMP $1889 ; (PlayZSM.s15 + 0)
.s9:
1885 : a9 1a __ LDA #$1a
1887 : a0 3d __ LDY #$3d
.s15:
1889 : 84 30 __ STY P3 
188b : 85 31 __ STA P4 
188d : 4c 94 18 JMP $1894 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1890 : ad e3 1c LDA $1ce3 ; (zsm_finished + 0)
.s1001:
1893 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1894 : a9 01 __ LDA #$01
1896 : 8d e3 1c STA $1ce3 ; (zsm_finished + 0)
1899 : ad f9 1c LDA $1cf9 ; (zsm_reading + 0)
189c : f0 0a __ BEQ $18a8 ; (zsm_init.s3 + 0)
.s1:
189e : a9 02 __ LDA #$02
18a0 : 20 ed 18 JSR $18ed ; (krnio_close.s1000 + 0)
18a3 : a9 00 __ LDA #$00
18a5 : 8d f9 1c STA $1cf9 ; (zsm_reading + 0)
.s3:
18a8 : 8d 61 44 STA $4461 ; (zsm_pos + 0)
18ab : 8d 62 44 STA $4462 ; (zsm_pos + 1)
18ae : 8d 63 44 STA $4463 ; (zsm_wpos + 0)
18b1 : 8d 64 44 STA $4464 ; (zsm_wpos + 1)
18b4 : 8d 60 40 STA $4060 ; (zsm_delay + 0)
18b7 : a5 30 __ LDA P3 ; (fname + 0)
18b9 : 85 2d __ STA P0 
18bb : a5 31 __ LDA P4 ; (fname + 1)
18bd : 85 2e __ STA P1 
18bf : 20 f5 18 JSR $18f5 ; (krnio_setnam.s0 + 0)
18c2 : a9 02 __ LDA #$02
18c4 : 85 2d __ STA P0 
18c6 : 85 2f __ STA P2 
18c8 : a9 08 __ LDA #$08
18ca : 85 2e __ STA P1 
18cc : 20 0b 19 JSR $190b ; (krnio_open.s0 + 0)
18cf : a5 3b __ LDA ACCU + 0 
18d1 : f0 19 __ BEQ $18ec ; (zsm_init.s1001 + 0)
.s4:
18d3 : a9 01 __ LDA #$01
18d5 : 8d f9 1c STA $1cf9 ; (zsm_reading + 0)
18d8 : 20 33 19 JSR $1933 ; (zsm_fill.s0 + 0)
18db : a9 10 __ LDA #$10
18dd : 8d 61 44 STA $4461 ; (zsm_pos + 0)
18e0 : a9 00 __ LDA #$00
18e2 : 8d 62 44 STA $4462 ; (zsm_pos + 1)
18e5 : 8d e3 1c STA $1ce3 ; (zsm_finished + 0)
18e8 : a9 01 __ LDA #$01
18ea : 85 3b __ STA ACCU + 0 
.s1001:
18ec : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
1cf9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
18ed : 85 2d __ STA P0 
.s0:
18ef : a5 2d __ LDA P0 
18f1 : 20 c3 ff JSR $ffc3 
.s1001:
18f4 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
4463 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
18f5 : a5 2d __ LDA P0 
18f7 : 05 2e __ ORA P1 
18f9 : f0 08 __ BEQ $1903 ; (krnio_setnam.s0 + 14)
18fb : a0 ff __ LDY #$ff
18fd : c8 __ __ INY
18fe : b1 2d __ LDA (P0),y 
1900 : d0 fb __ BNE $18fd ; (krnio_setnam.s0 + 8)
1902 : 98 __ __ TYA
1903 : a6 2d __ LDX P0 
1905 : a4 2e __ LDY P1 
1907 : 20 bd ff JSR $ffbd 
.s1001:
190a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
190b : a9 00 __ LDA #$00
190d : a6 2d __ LDX P0 ; (fnum + 0)
190f : 9d 65 44 STA $4465,x ; (krnio_pstatus + 0)
1912 : a9 00 __ LDA #$00
1914 : 85 3b __ STA ACCU + 0 
1916 : 85 3c __ STA ACCU + 1 
1918 : a5 2d __ LDA P0 ; (fnum + 0)
191a : a6 2e __ LDX P1 
191c : a4 2f __ LDY P2 
191e : 20 ba ff JSR $ffba 
1921 : 20 c0 ff JSR $ffc0 
1924 : 90 08 __ BCC $192e ; (krnio_open.s0 + 35)
1926 : a5 2d __ LDA P0 ; (fnum + 0)
1928 : 20 c3 ff JSR $ffc3 
192b : 4c 32 19 JMP $1932 ; (krnio_open.s1001 + 0)
192e : a9 01 __ LDA #$01
1930 : 85 3b __ STA ACCU + 0 
.s1001:
1932 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
4465 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1933 : ad f9 1c LDA $1cf9 ; (zsm_reading + 0)
1936 : f0 20 __ BEQ $1958 ; (zsm_fill.s1 + 0)
.s2:
1938 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
193b : 18 __ __ CLC
193c : 69 04 __ ADC #$04
193e : cd 64 44 CMP $4464 ; (zsm_wpos + 1)
1941 : d0 0c __ BNE $194f ; (zsm_fill.s6 + 0)
.s1006:
1943 : ad 63 44 LDA $4463 ; (zsm_wpos + 0)
1946 : cd 61 44 CMP $4461 ; (zsm_pos + 0)
1949 : d0 04 __ BNE $194f ; (zsm_fill.s6 + 0)
.s5:
194b : a9 00 __ LDA #$00
194d : f0 0b __ BEQ $195a ; (zsm_fill.s1008 + 0)
.s6:
194f : a9 02 __ LDA #$02
1951 : 20 d7 19 JSR $19d7 ; (krnio_chkin.s1000 + 0)
1954 : a5 3b __ LDA ACCU + 0 
1956 : d0 07 __ BNE $195f ; (zsm_fill.s9 + 0)
.s1:
1958 : a9 ff __ LDA #$ff
.s1008:
195a : 85 3b __ STA ACCU + 0 
.s1001:
195c : 85 3c __ STA ACCU + 1 
195e : 60 __ __ RTS
.s9:
195f : a9 00 __ LDA #$00
1961 : 85 47 __ STA T1 + 0 
1963 : 85 48 __ STA T1 + 1 
1965 : ad 62 44 LDA $4462 ; (zsm_pos + 1)
1968 : 18 __ __ CLC
1969 : 69 04 __ ADC #$04
196b : cd 64 44 CMP $4464 ; (zsm_wpos + 1)
196e : d0 08 __ BNE $1978 ; (zsm_fill.l13 + 0)
.s1002:
1970 : ad 63 44 LDA $4463 ; (zsm_wpos + 0)
1973 : cd 61 44 CMP $4461 ; (zsm_pos + 0)
1976 : f0 49 __ BEQ $19c1 ; (zsm_fill.s37 + 0)
.l13:
1978 : 20 e9 19 JSR $19e9 ; (krnio_chrin.s0 + 0)
197b : ad 63 44 LDA $4463 ; (zsm_wpos + 0)
197e : aa __ __ TAX
197f : 18 __ __ CLC
1980 : 69 01 __ ADC #$01
1982 : 8d 63 44 STA $4463 ; (zsm_wpos + 0)
1985 : ad 64 44 LDA $4464 ; (zsm_wpos + 1)
1988 : a8 __ __ TAY
1989 : 69 00 __ ADC #$00
198b : 8d 64 44 STA $4464 ; (zsm_wpos + 1)
198e : 8a __ __ TXA
198f : 18 __ __ CLC
1990 : 69 61 __ ADC #$61
1992 : 85 49 __ STA T3 + 0 
1994 : 98 __ __ TYA
1995 : 29 03 __ AND #$03
1997 : 69 40 __ ADC #$40
1999 : 85 4a __ STA T3 + 1 
199b : a5 3b __ LDA ACCU + 0 
199d : a0 00 __ LDY #$00
199f : 91 49 __ STA (T3 + 0),y 
19a1 : e6 47 __ INC T1 + 0 
19a3 : d0 02 __ BNE $19a7 ; (zsm_fill.s1010 + 0)
.s1009:
19a5 : e6 48 __ INC T1 + 1 
.s1010:
19a7 : 20 f3 19 JSR $19f3 ; (krnio_status.s0 + 0)
19aa : a5 3b __ LDA ACCU + 0 
19ac : d0 0e __ BNE $19bc ; (zsm_fill.s15 + 0)
.s12:
19ae : ad 62 44 LDA $4462 ; (zsm_pos + 1)
19b1 : 18 __ __ CLC
19b2 : 69 04 __ ADC #$04
19b4 : cd 64 44 CMP $4464 ; (zsm_wpos + 1)
19b7 : d0 bf __ BNE $1978 ; (zsm_fill.l13 + 0)
19b9 : 4c 70 19 JMP $1970 ; (zsm_fill.s1002 + 0)
.s15:
19bc : a9 00 __ LDA #$00
19be : 8d f9 1c STA $1cf9 ; (zsm_reading + 0)
.s37:
19c1 : 20 fd 19 JSR $19fd ; (krnio_clrchn.s0 + 0)
19c4 : ad f9 1c LDA $1cf9 ; (zsm_reading + 0)
19c7 : d0 05 __ BNE $19ce ; (zsm_fill.s21 + 0)
.s19:
19c9 : a9 02 __ LDA #$02
19cb : 20 ed 18 JSR $18ed ; (krnio_close.s1000 + 0)
.s21:
19ce : a5 47 __ LDA T1 + 0 
19d0 : 85 3b __ STA ACCU + 0 
19d2 : a5 48 __ LDA T1 + 1 
19d4 : 4c 5c 19 JMP $195c ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
19d7 : 85 2d __ STA P0 
.s0:
19d9 : a6 2d __ LDX P0 
19db : 20 c6 ff JSR $ffc6 
19de : a9 00 __ LDA #$00
19e0 : 85 3c __ STA ACCU + 1 
19e2 : b0 02 __ BCS $19e6 ; (krnio_chkin.s0 + 13)
19e4 : a9 01 __ LDA #$01
19e6 : 85 3b __ STA ACCU + 0 
.s1001:
19e8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
19e9 : 20 cf ff JSR $ffcf 
19ec : 85 3b __ STA ACCU + 0 
19ee : a9 00 __ LDA #$00
19f0 : 85 3c __ STA ACCU + 1 
.s1001:
19f2 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
19f3 : 20 b7 ff JSR $ffb7 
19f6 : 85 3b __ STA ACCU + 0 
19f8 : a9 00 __ LDA #$00
19fa : 85 3c __ STA ACCU + 1 
.s1001:
19fc : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
19fd : 20 cc ff JSR $ffcc 
.s1001:
1a00 : 60 __ __ RTS
--------------------------------------------------------------------
1a01 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1a11 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1a1f : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1a2f : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1a3d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1a4d : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1a5d : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
PalTimer:
1cfa : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
25a0 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
25b0 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1a62 : a9 10 __ LDA #$10
1a64 : 85 30 __ STA P3 
1a66 : a9 00 __ LDA #$00
1a68 : 85 31 __ STA P4 
1a6a : a5 32 __ LDA P5 ; (Palette + 0)
1a6c : 85 2e __ STA P1 
1a6e : 85 47 __ STA T0 + 0 
1a70 : a5 33 __ LDA P6 ; (Palette + 1)
1a72 : 85 2f __ STA P2 
1a74 : 85 48 __ STA T0 + 1 
1a76 : ad fc 9e LDA $9efc ; (sstack + 0)
1a79 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1a7b : 0a __ __ ASL
1a7c : 85 49 __ STA T2 + 0 
1a7e : ad fd 9e LDA $9efd ; (sstack + 1)
1a81 : 2a __ __ ROL
1a82 : 18 __ __ CLC
1a83 : 65 33 __ ADC P6 ; (Palette + 1)
1a85 : 85 4a __ STA T2 + 1 
1a87 : a4 32 __ LDY P5 ; (Palette + 0)
1a89 : b1 49 __ LDA (T2 + 0),y 
1a8b : aa __ __ TAX
1a8c : c8 __ __ INY
1a8d : b1 49 __ LDA (T2 + 0),y 
1a8f : 86 49 __ STX T2 + 0 
1a91 : 85 4a __ STA T2 + 1 
1a93 : a9 00 __ LDA #$00
1a95 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1a97 : ad fe 9e LDA $9efe ; (sstack + 2)
1a9a : 85 4b __ STA T4 + 0 
1a9c : 38 __ __ SEC
1a9d : e9 01 __ SBC #$01
1a9f : 85 4d __ STA T5 + 0 
1aa1 : ad ff 9e LDA $9eff ; (sstack + 3)
1aa4 : 85 4c __ STA T4 + 1 
1aa6 : e9 00 __ SBC #$00
1aa8 : 85 4e __ STA T5 + 1 
1aaa : d0 06 __ BNE $1ab2 ; (SetPaletteIndex.s5 + 0)
.s1004:
1aac : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1aae : c5 4d __ CMP T5 + 0 
1ab0 : b0 38 __ BCS $1aea ; (SetPaletteIndex.s4 + 0)
.s5:
1ab2 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1ab4 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1ab6 : 18 __ __ CLC
1ab7 : a5 32 __ LDA P5 ; (Palette + 0)
1ab9 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1abb : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1abd : a5 33 __ LDA P6 ; (Palette + 1)
1abf : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1ac1 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1ac3 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1ac6 : a0 02 __ LDY #$02
1ac8 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1aca : a0 00 __ LDY #$00
1acc : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1ace : a0 03 __ LDY #$03
1ad0 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1ad2 : a0 01 __ LDY #$01
1ad4 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1ad6 : 18 __ __ CLC
1ad7 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1ad9 : 69 02 __ ADC #$02
1adb : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1add : 90 02 __ BCC $1ae1 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1adf : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1ae1 : e8 __ __ INX
1ae2 : a5 4e __ LDA T5 + 1 
1ae4 : d0 e0 __ BNE $1ac6 ; (SetPaletteIndex.l2 + 0)
.s1002:
1ae6 : e4 4d __ CPX T5 + 0 
1ae8 : 90 dc __ BCC $1ac6 ; (SetPaletteIndex.l2 + 0)
.s4:
1aea : a5 4b __ LDA T4 + 0 
1aec : 0a __ __ ASL
1aed : aa __ __ TAX
1aee : a5 4c __ LDA T4 + 1 
1af0 : 2a __ __ ROL
1af1 : a8 __ __ TAY
1af2 : 8a __ __ TXA
1af3 : 38 __ __ SEC
1af4 : e9 02 __ SBC #$02
1af6 : b0 01 __ BCS $1af9 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1af8 : 88 __ __ DEY
.s1010:
1af9 : 18 __ __ CLC
1afa : 65 47 __ ADC T0 + 0 
1afc : 85 47 __ STA T0 + 0 
1afe : 98 __ __ TYA
1aff : 65 48 __ ADC T0 + 1 
1b01 : 85 48 __ STA T0 + 1 
1b03 : a5 49 __ LDA T2 + 0 
1b05 : a0 00 __ LDY #$00
1b07 : 91 47 __ STA (T0 + 0),y 
1b09 : a5 4a __ LDA T2 + 1 
1b0b : c8 __ __ INY
1b0c : 91 47 __ STA (T0 + 0),y 
1b0e : a5 34 __ LDA P7 ; (index + 0)
1b10 : 85 2d __ STA P0 
1b12 : 4c ad 17 JMP $17ad ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
1cfc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
25c0 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
25d0 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
1cfe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
25e0 : __ __ __ BYT 23 02 12 01 01 01 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
25f0 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
BGPalShimmer:
4000 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
4010 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
getchx:
.s0:
1b15 : 20 1f 1b JSR $1b1f ; (getpch + 0)
1b18 : 85 3b __ STA ACCU + 0 
1b1a : a9 00 __ LDA #$00
1b1c : 85 3c __ STA ACCU + 1 
.s1001:
1b1e : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1b1f : 20 e4 ff JSR $ffe4 
1b22 : ae ff 1c LDX $1cff ; (giocharmap + 0)
1b25 : e0 01 __ CPX #$01
1b27 : 90 26 __ BCC $1b4f ; (getpch + 48)
1b29 : c9 0d __ CMP #$0d
1b2b : d0 02 __ BNE $1b2f ; (getpch + 16)
1b2d : a9 0a __ LDA #$0a
1b2f : e0 02 __ CPX #$02
1b31 : 90 1c __ BCC $1b4f ; (getpch + 48)
1b33 : c9 db __ CMP #$db
1b35 : b0 18 __ BCS $1b4f ; (getpch + 48)
1b37 : c9 41 __ CMP #$41
1b39 : 90 14 __ BCC $1b4f ; (getpch + 48)
1b3b : c9 c1 __ CMP #$c1
1b3d : 90 02 __ BCC $1b41 ; (getpch + 34)
1b3f : 49 a0 __ EOR #$a0
1b41 : c9 7b __ CMP #$7b
1b43 : b0 0a __ BCS $1b4f ; (getpch + 48)
1b45 : c9 61 __ CMP #$61
1b47 : b0 04 __ BCS $1b4d ; (getpch + 46)
1b49 : c9 5b __ CMP #$5b
1b4b : b0 02 __ BCS $1b4f ; (getpch + 48)
1b4d : 49 20 __ EOR #$20
1b4f : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
1cff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
Control:
.s0:
1b50 : 20 15 1b JSR $1b15 ; (getchx.s0 + 0)
1b53 : a5 3c __ LDA ACCU + 1 
1b55 : d0 22 __ BNE $1b79 ; (Control.s1006 + 0)
.s1005:
1b57 : a5 3b __ LDA ACCU + 0 
1b59 : c9 20 __ CMP #$20
1b5b : d0 1c __ BNE $1b79 ; (Control.s1006 + 0)
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
.s1006:
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
