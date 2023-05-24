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
080e : 8e ff 1a STX $1aff ; (spentry + 0)
0811 : a9 5b __ LDA #$5b
0813 : 85 39 __ STA IP + 0 
0815 : a9 43 __ LDA #$43
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 47 __ LDA #$47
081c : e9 43 __ SBC #$43
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
0830 : a9 7b __ LDA #$7b
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
1aff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 c0 0a JSR $0ac0 ; (zsm_irq_init.s0 + 0)
0883 : 20 94 0c JSR $0c94 ; (ClearVERAScreen.s0 + 0)
0886 : 20 d7 0c JSR $0cd7 ; (SetUpSprites.s0 + 0)
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
08b7 : 85 50 __ STA T1 + 0 
08b9 : 85 51 __ STA T1 + 1 
08bb : 85 52 __ STA T2 + 0 
08bd : 85 53 __ STA T3 + 0 
.l2:
08bf : 20 72 17 JSR $1772 ; (getchx.s0 + 0)
08c2 : a5 3b __ LDA ACCU + 0 
08c4 : 85 54 __ STA T4 + 0 
08c6 : a9 30 __ LDA #$30
08c8 : 8d 2c 9f STA $9f2c 
08cb : ee fe 22 INC $22fe ; (p + 0)
08ce : d0 03 __ BNE $08d3 ; (main.s1017 + 0)
.s1016:
08d0 : ee ff 22 INC $22ff ; (p + 1)
.s1017:
08d3 : ad 80 41 LDA $4180 ; (Phase + 0)
08d6 : 18 __ __ CLC
08d7 : 69 01 __ ADC #$01
08d9 : 85 32 __ STA P5 
08db : 8d 80 41 STA $4180 ; (Phase + 0)
08de : ad 81 41 LDA $4181 ; (Phase + 1)
08e1 : 69 00 __ ADC #$00
08e3 : 85 33 __ STA P6 
08e5 : 8d 81 41 STA $4181 ; (Phase + 1)
08e8 : ad 82 41 LDA $4182 ; (Phase2 + 0)
08eb : 18 __ __ CLC
08ec : 69 01 __ ADC #$01
08ee : 85 34 __ STA P7 
08f0 : 8d 82 41 STA $4182 ; (Phase2 + 0)
08f3 : ad 83 41 LDA $4183 ; (Phase2 + 1)
08f6 : 69 00 __ ADC #$00
08f8 : 85 35 __ STA P8 
08fa : 8d 83 41 STA $4183 ; (Phase2 + 1)
08fd : ad 84 41 LDA $4184 ; (Phase3 + 0)
0900 : 18 __ __ CLC
0901 : 69 01 __ ADC #$01
0903 : 85 36 __ STA P9 
0905 : 8d 84 41 STA $4184 ; (Phase3 + 0)
0908 : ad 85 41 LDA $4185 ; (Phase3 + 1)
090b : 69 00 __ ADC #$00
090d : 85 37 __ STA P10 
090f : 8d 85 41 STA $4185 ; (Phase3 + 1)
0912 : 20 ad 17 JSR $17ad ; (MoveSprites.s0 + 0)
0915 : a5 52 __ LDA T2 + 0 
0917 : f0 03 __ BEQ $091c ; (main.s5 + 0)
0919 : 4c a7 0a JMP $0aa7 ; (main.s4 + 0)
.s5:
091c : a9 20 __ LDA #$20
091e : 85 37 __ STA P10 
0920 : a9 a0 __ LDA #$a0
0922 : 8d fc 9e STA $9efc ; (sstack + 0)
0925 : a9 fa __ LDA #$fa
0927 : 8d fd 9e STA $9efd ; (sstack + 1)
092a : a9 01 __ LDA #$01
092c : 8d fe 9e STA $9efe ; (sstack + 2)
092f : a9 00 __ LDA #$00
0931 : 8d ff 9e STA $9eff ; (sstack + 3)
0934 : 8d 89 41 STA $4189 ; (PalTimer + 0)
0937 : 8d 8a 41 STA $418a ; (PalTimer + 1)
093a : a9 8b __ LDA #$8b
093c : 85 35 __ STA P8 
093e : a9 41 __ LDA #$41
0940 : 85 36 __ STA P9 
0942 : 20 4b 17 JSR $174b ; (SetPaletteColours.s0 + 0)
.s42:
0945 : e6 53 __ INC T3 + 0 
0947 : a9 02 __ LDA #$02
0949 : c5 53 __ CMP T3 + 0 
094b : b0 27 __ BCS $0974 ; (main.s43 + 0)
.s10:
094d : a9 10 __ LDA #$10
094f : 85 2f __ STA P2 
0951 : a9 00 __ LDA #$00
0953 : 85 30 __ STA P3 
0955 : 85 31 __ STA P4 
0957 : 85 32 __ STA P5 
0959 : 85 34 __ STA P7 
095b : 85 36 __ STA P9 
095d : a9 06 __ LDA #$06
095f : 85 33 __ STA P6 
0961 : a9 0a __ LDA #$0a
0963 : 85 35 __ STA P8 
0965 : a9 45 __ LDA #$45
0967 : 85 2d __ STA P0 
0969 : a9 22 __ LDA #$22
096b : 85 2e __ STA P1 
096d : 20 fe 1a JSR $1afe ; (SetPaletteIndex.s1001 + 0)
0970 : a9 00 __ LDA #$00
0972 : 85 53 __ STA T3 + 0 
.s43:
0974 : ad 8a 41 LDA $418a ; (PalTimer + 1)
0977 : 30 4d __ BMI $09c6 ; (main.s44 + 0)
.s1013:
0979 : d0 07 __ BNE $0982 ; (main.s13 + 0)
.s1012:
097b : a9 03 __ LDA #$03
097d : cd 89 41 CMP $4189 ; (PalTimer + 0)
0980 : b0 44 __ BCS $09c6 ; (main.s44 + 0)
.s13:
0982 : a9 60 __ LDA #$60
0984 : 85 2f __ STA P2 
0986 : a9 00 __ LDA #$00
0988 : 85 30 __ STA P3 
098a : 85 31 __ STA P4 
098c : 85 32 __ STA P5 
098e : 85 33 __ STA P6 
0990 : 85 34 __ STA P7 
0992 : 85 36 __ STA P9 
0994 : a9 05 __ LDA #$05
0996 : 85 35 __ STA P8 
0998 : ee ab 41 INC $41ab ; (PalIndex + 0)
099b : d0 03 __ BNE $09a0 ; (main.s1021 + 0)
.s1020:
099d : ee ac 41 INC $41ac ; (PalIndex + 1)
.s1021:
09a0 : a9 e5 __ LDA #$e5
09a2 : 85 2d __ STA P0 
09a4 : a9 22 __ LDA #$22
09a6 : 85 2e __ STA P1 
09a8 : 20 fe 1a JSR $1afe ; (SetPaletteIndex.s1001 + 0)
09ab : a9 50 __ LDA #$50
09ad : 85 2f __ STA P2 
09af : a9 10 __ LDA #$10
09b1 : 85 35 __ STA P8 
09b3 : a9 ad __ LDA #$ad
09b5 : 85 2d __ STA P0 
09b7 : a9 41 __ LDA #$41
09b9 : 85 2e __ STA P1 
09bb : 20 fe 1a JSR $1afe ; (SetPaletteIndex.s1001 + 0)
09be : a9 00 __ LDA #$00
09c0 : 8d 89 41 STA $4189 ; (PalTimer + 0)
09c3 : 8d 8a 41 STA $418a ; (PalTimer + 1)
.s44:
09c6 : ad ff 22 LDA $22ff ; (p + 1)
09c9 : d0 42 __ BNE $0a0d ; (main.s18 + 0)
.s1011:
09cb : ad fe 22 LDA $22fe ; (p + 0)
09ce : c9 03 __ CMP #$03
09d0 : d0 3b __ BNE $0a0d ; (main.s18 + 0)
.s16:
09d2 : a9 20 __ LDA #$20
09d4 : 85 37 __ STA P10 
09d6 : a9 00 __ LDA #$00
09d8 : 8d fc 9e STA $9efc ; (sstack + 0)
09db : 8d ff 9e STA $9eff ; (sstack + 3)
09de : a9 fa __ LDA #$fa
09e0 : 8d fd 9e STA $9efd ; (sstack + 1)
09e3 : a9 01 __ LDA #$01
09e5 : 8d fe 9e STA $9efe ; (sstack + 2)
09e8 : a9 00 __ LDA #$00
09ea : cd cd 41 CMP $41cd ; (ShimmerState + 0)
09ed : 2a __ __ ROL
09ee : 8d cd 41 STA $41cd ; (ShimmerState + 0)
09f1 : d0 07 __ BNE $09fa ; (main.s19 + 0)
.s20:
09f3 : a9 43 __ LDA #$43
09f5 : a0 00 __ LDY #$00
09f7 : 4c fe 09 JMP $09fe ; (main.s52 + 0)
.s19:
09fa : a9 41 __ LDA #$41
09fc : a0 ce __ LDY #$ce
.s52:
09fe : 84 35 __ STY P8 
0a00 : 85 36 __ STA P9 
0a02 : 20 4b 17 JSR $174b ; (SetPaletteColours.s0 + 0)
0a05 : a9 00 __ LDA #$00
0a07 : 8d fe 22 STA $22fe ; (p + 0)
0a0a : 8d ff 22 STA $22ff ; (p + 1)
.s18:
0a0d : a5 52 __ LDA T2 + 0 
0a0f : 85 30 __ STA P3 
0a11 : a9 03 __ LDA #$03
0a13 : 8d 2c 9f STA $9f2c 
0a16 : a5 54 __ LDA T4 + 0 
0a18 : 85 31 __ STA P4 
0a1a : c9 44 __ CMP #$44
0a1c : d0 0e __ BNE $0a2c ; (main.s23 + 0)
.s22:
0a1e : 18 __ __ CLC
0a1f : a5 50 __ LDA T1 + 0 
0a21 : 69 01 __ ADC #$01
0a23 : 85 50 __ STA T1 + 0 
0a25 : a5 51 __ LDA T1 + 1 
0a27 : 69 00 __ ADC #$00
0a29 : 4c 43 0a JMP $0a43 ; (main.s1015 + 0)
.s23:
0a2c : c9 41 __ CMP #$41
0a2e : d0 15 __ BNE $0a45 ; (main.s24 + 0)
.s28:
0a30 : a5 51 __ LDA T1 + 1 
0a32 : 30 11 __ BMI $0a45 ; (main.s24 + 0)
.s1003:
0a34 : 05 50 __ ORA T1 + 0 
0a36 : f0 0d __ BEQ $0a45 ; (main.s24 + 0)
.s25:
0a38 : 18 __ __ CLC
0a39 : a5 50 __ LDA T1 + 0 
0a3b : 69 ff __ ADC #$ff
0a3d : 85 50 __ STA T1 + 0 
0a3f : a5 51 __ LDA T1 + 1 
0a41 : 69 ff __ ADC #$ff
.s1015:
0a43 : 85 51 __ STA T1 + 1 
.s24:
0a45 : 20 43 1b JSR $1b43 ; (Control.s0 + 0)
0a48 : a5 3b __ LDA ACCU + 0 
0a4a : 85 52 __ STA T2 + 0 
0a4c : ad 86 41 LDA $4186 ; (FrameCount + 0)
0a4f : 85 3b __ STA ACCU + 0 
0a51 : ad 87 41 LDA $4187 ; (FrameCount + 1)
0a54 : 85 3c __ STA ACCU + 1 
0a56 : a9 04 __ LDA #$04
0a58 : 85 23 __ STA WORK + 0 
0a5a : a9 00 __ LDA #$00
0a5c : 85 24 __ STA WORK + 1 
0a5e : 20 b7 1c JSR $1cb7 ; (mods16 + 0)
0a61 : a5 26 __ LDA WORK + 3 
0a63 : d0 18 __ BNE $0a7d ; (main.s31 + 0)
.s1002:
0a65 : a5 25 __ LDA WORK + 2 
0a67 : c9 01 __ CMP #$01
0a69 : d0 12 __ BNE $0a7d ; (main.s31 + 0)
.s29:
0a6b : ae ef 41 LDX $41ef ; (off1 + 0)
0a6e : e8 __ __ INX
0a6f : 8e ef 41 STX $41ef ; (off1 + 0)
0a72 : bd 1f 43 LDA $431f,x ; (BGPalShimmer + 31)
0a75 : 8d 23 9f STA $9f23 
0a78 : a9 16 __ LDA #$16
0a7a : 8d 23 9f STA $9f23 
.s31:
0a7d : ad 86 41 LDA $4186 ; (FrameCount + 0)
0a80 : 8d 37 9f STA $9f37 
0a83 : ad 87 41 LDA $4187 ; (FrameCount + 1)
0a86 : 8d 38 9f STA $9f38 
0a89 : a9 01 __ LDA #$01
0a8b : 8d 2c 9f STA $9f2c 
0a8e : 20 12 1a JSR $1a12 ; (zsm_fill.s0 + 0)
0a91 : a9 00 __ LDA #$00
0a93 : 8d 2c 9f STA $9f2c 
0a96 : 20 07 1c JSR $1c07 ; (frame_wait.l1 + 0)
0a99 : ee 86 41 INC $4186 ; (FrameCount + 0)
0a9c : f0 03 __ BEQ $0aa1 ; (main.s1022 + 0)
0a9e : 4c bf 08 JMP $08bf ; (main.l2 + 0)
.s1022:
0aa1 : ee 87 41 INC $4187 ; (FrameCount + 1)
0aa4 : 4c bf 08 JMP $08bf ; (main.l2 + 0)
.s4:
0aa7 : a5 50 __ LDA T1 + 0 
0aa9 : 85 32 __ STA P5 
0aab : a5 51 __ LDA T1 + 1 
0aad : 85 33 __ STA P6 
0aaf : 20 39 19 JSR $1939 ; (PlayZSM.s0 + 0)
0ab2 : ee 89 41 INC $4189 ; (PalTimer + 0)
0ab5 : f0 03 __ BEQ $0aba ; (main.s1018 + 0)
0ab7 : 4c 45 09 JMP $0945 ; (main.s42 + 0)
.s1018:
0aba : ee 8a 41 INC $418a ; (PalTimer + 1)
0abd : 4c 45 09 JMP $0945 ; (main.s42 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0ac0 : 78 __ __ SEI
0ac1 : ad 14 03 LDA $0314 
0ac4 : 8d f0 41 STA $41f0 ; (oirq + 0)
0ac7 : ad 15 03 LDA $0315 
0aca : 8d f1 41 STA $41f1 ; (oirq + 1)
0acd : a9 d9 __ LDA #$d9
0acf : 8d 14 03 STA $0314 
0ad2 : a9 0a __ LDA #$0a
0ad4 : 8d 15 03 STA $0315 
0ad7 : 58 __ __ CLI
.s1001:
0ad8 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
41f0 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0ad9 : 20 df 0a JSR $0adf ; (irq.s1000 + 0)
0adc : 6c f0 41 JMP ($41f0)
--------------------------------------------------------------------
irq:
.s1000:
0adf : a5 2d __ LDA P0 
0ae1 : 48 __ __ PHA
0ae2 : a5 2e __ LDA P1 
0ae4 : 48 __ __ PHA
0ae5 : a5 3b __ LDA ACCU + 0 
0ae7 : 48 __ __ PHA
0ae8 : a5 3c __ LDA ACCU + 1 
0aea : 48 __ __ PHA
0aeb : a5 47 __ LDA T0 + 0 
0aed : 48 __ __ PHA
0aee : a5 48 __ LDA $48 
0af0 : 48 __ __ PHA
0af1 : a5 49 __ LDA $49 
0af3 : 48 __ __ PHA
0af4 : a5 4a __ LDA $4a 
0af6 : 48 __ __ PHA
0af7 : a5 4b __ LDA $4b 
0af9 : 48 __ __ PHA
0afa : a5 4c __ LDA $4c 
0afc : 48 __ __ PHA
0afd : a5 4d __ LDA $4d 
0aff : 48 __ __ PHA
0b00 : a5 4e __ LDA $4e 
0b02 : 48 __ __ PHA
0b03 : a5 4f __ LDA $4f 
0b05 : 48 __ __ PHA
0b06 : a5 50 __ LDA $50 
0b08 : 48 __ __ PHA
.s0:
0b09 : ad 00 1d LDA $1d00 ; (zsm_playing + 0)
0b0c : f0 08 __ BEQ $0b16 ; (irq.s1001 + 0)
.s4:
0b0e : ad 01 1d LDA $1d01 ; (zsm_finished + 0)
0b11 : d0 03 __ BNE $0b16 ; (irq.s1001 + 0)
.s1:
0b13 : 20 41 0b JSR $0b41 ; (zsm_play.s0 + 0)
.s1001:
0b16 : 68 __ __ PLA
0b17 : 85 50 __ STA $50 
0b19 : 68 __ __ PLA
0b1a : 85 4f __ STA $4f 
0b1c : 68 __ __ PLA
0b1d : 85 4e __ STA $4e 
0b1f : 68 __ __ PLA
0b20 : 85 4d __ STA $4d 
0b22 : 68 __ __ PLA
0b23 : 85 4c __ STA $4c 
0b25 : 68 __ __ PLA
0b26 : 85 4b __ STA $4b 
0b28 : 68 __ __ PLA
0b29 : 85 4a __ STA $4a 
0b2b : 68 __ __ PLA
0b2c : 85 49 __ STA $49 
0b2e : 68 __ __ PLA
0b2f : 85 48 __ STA $48 
0b31 : 68 __ __ PLA
0b32 : 85 47 __ STA T0 + 0 
0b34 : 68 __ __ PLA
0b35 : 85 3c __ STA ACCU + 1 
0b37 : 68 __ __ PLA
0b38 : 85 3b __ STA ACCU + 0 
0b3a : 68 __ __ PLA
0b3b : 85 2e __ STA P1 
0b3d : 68 __ __ PLA
0b3e : 85 2d __ STA P0 
0b40 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1d00 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1d01 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0b41 : ad 02 1d LDA $1d02 ; (zsm_paused + 0)
0b44 : f0 01 __ BEQ $0b47 ; (zsm_play.s2 + 0)
0b46 : 60 __ __ RTS
.s2:
0b47 : ad f2 41 LDA $41f2 ; (zsm_delay + 0)
0b4a : f0 03 __ BEQ $0b4f ; (zsm_play.s5 + 0)
0b4c : 4c 7c 0c JMP $0c7c ; (zsm_play.s4 + 0)
.s5:
0b4f : ad 25 9f LDA $9f25 
0b52 : 85 47 __ STA T0 + 0 
0b54 : ad 25 9f LDA $9f25 
0b57 : 29 fe __ AND #$fe
0b59 : 8d 25 9f STA $9f25 
0b5c : ad 20 9f LDA $9f20 
0b5f : 85 49 __ STA T2 + 0 
0b61 : ad 21 9f LDA $9f21 
0b64 : 85 4a __ STA T2 + 1 
0b66 : ad 22 9f LDA $9f22 
0b69 : 85 48 __ STA T1 + 0 
.l8:
0b6b : ad f3 41 LDA $41f3 ; (zsm_pos + 0)
0b6e : 85 4b __ STA T3 + 0 
0b70 : 18 __ __ CLC
0b71 : 69 01 __ ADC #$01
0b73 : 85 4d __ STA T4 + 0 
0b75 : 8d f3 41 STA $41f3 ; (zsm_pos + 0)
0b78 : ad f4 41 LDA $41f4 ; (zsm_pos + 1)
0b7b : aa __ __ TAX
0b7c : 69 00 __ ADC #$00
0b7e : 85 4e __ STA T4 + 1 
0b80 : 8d f4 41 STA $41f4 ; (zsm_pos + 1)
0b83 : 18 __ __ CLC
0b84 : a9 5b __ LDA #$5b
0b86 : 65 4b __ ADC T3 + 0 
0b88 : 85 3b __ STA ACCU + 0 
0b8a : 8a __ __ TXA
0b8b : 29 03 __ AND #$03
0b8d : 69 43 __ ADC #$43
0b8f : 85 3c __ STA ACCU + 1 
0b91 : a0 00 __ LDY #$00
0b93 : b1 3b __ LDA (ACCU + 0),y 
0b95 : c9 40 __ CMP #$40
0b97 : b0 03 __ BCS $0b9c ; (zsm_play.s12 + 0)
0b99 : 4c 47 0c JMP $0c47 ; (zsm_play.s11 + 0)
.s12:
0b9c : d0 22 __ BNE $0bc0 ; (zsm_play.s15 + 0)
.s14:
0b9e : 18 __ __ CLC
0b9f : a9 5b __ LDA #$5b
0ba1 : 65 4d __ ADC T4 + 0 
0ba3 : 85 4b __ STA T3 + 0 
0ba5 : a5 4e __ LDA T4 + 1 
0ba7 : 29 03 __ AND #$03
0ba9 : 69 43 __ ADC #$43
0bab : 85 4c __ STA T3 + 1 
0bad : b1 4b __ LDA (T3 + 0),y 
0baf : 29 3f __ AND #$3f
0bb1 : 18 __ __ CLC
0bb2 : 65 4d __ ADC T4 + 0 
0bb4 : 8d f3 41 STA $41f3 ; (zsm_pos + 0)
0bb7 : 98 __ __ TYA
0bb8 : 65 4e __ ADC T4 + 1 
0bba : 8d f4 41 STA $41f4 ; (zsm_pos + 1)
0bbd : 4c 6b 0b JMP $0b6b ; (zsm_play.l8 + 0)
.s15:
0bc0 : 09 00 __ ORA #$00
0bc2 : 30 5b __ BMI $0c1f ; (zsm_play.s18 + 0)
.s17:
0bc4 : 29 3f __ AND #$3f
0bc6 : f0 a3 __ BEQ $0b6b ; (zsm_play.l8 + 0)
.s29:
0bc8 : 84 50 __ STY T7 + 0 
0bca : 85 4f __ STA T6 + 0 
0bcc : 18 __ __ CLC
.l1012:
0bcd : a9 5b __ LDA #$5b
0bcf : 6d f3 41 ADC $41f3 ; (zsm_pos + 0)
0bd2 : 85 4d __ STA T4 + 0 
0bd4 : ad f4 41 LDA $41f4 ; (zsm_pos + 1)
0bd7 : 29 03 __ AND #$03
0bd9 : 69 43 __ ADC #$43
0bdb : 85 4e __ STA T4 + 1 
0bdd : a0 00 __ LDY #$00
0bdf : b1 4d __ LDA (T4 + 0),y 
0be1 : 85 2d __ STA P0 
0be3 : ad f3 41 LDA $41f3 ; (zsm_pos + 0)
0be6 : 18 __ __ CLC
0be7 : 69 01 __ ADC #$01
0be9 : aa __ __ TAX
0bea : ad f4 41 LDA $41f4 ; (zsm_pos + 1)
0bed : 69 00 __ ADC #$00
0bef : 29 03 __ AND #$03
0bf1 : 85 4c __ STA T3 + 1 
0bf3 : 8a __ __ TXA
0bf4 : 18 __ __ CLC
0bf5 : 69 5b __ ADC #$5b
0bf7 : 85 4b __ STA T3 + 0 
0bf9 : a9 43 __ LDA #$43
0bfb : 65 4c __ ADC T3 + 1 
0bfd : 85 4c __ STA T3 + 1 
0bff : b1 4b __ LDA (T3 + 0),y 
0c01 : 85 2e __ STA P1 
0c03 : 20 80 0c JSR $0c80 ; (sfx_put.l1 + 0)
0c06 : ad f3 41 LDA $41f3 ; (zsm_pos + 0)
0c09 : 18 __ __ CLC
0c0a : 69 02 __ ADC #$02
0c0c : 8d f3 41 STA $41f3 ; (zsm_pos + 0)
0c0f : 90 03 __ BCC $0c14 ; (zsm_play.s1015 + 0)
.s1014:
0c11 : ee f4 41 INC $41f4 ; (zsm_pos + 1)
.s1015:
0c14 : e6 50 __ INC T7 + 0 
0c16 : a5 50 __ LDA T7 + 0 
0c18 : c5 4f __ CMP T6 + 0 
0c1a : 90 b1 __ BCC $0bcd ; (zsm_play.l1012 + 0)
0c1c : 4c 6b 0b JMP $0b6b ; (zsm_play.l8 + 0)
.s18:
0c1f : c9 80 __ CMP #$80
0c21 : d0 07 __ BNE $0c2a ; (zsm_play.s25 + 0)
.s24:
0c23 : a9 01 __ LDA #$01
0c25 : 8d 01 1d STA $1d01 ; (zsm_finished + 0)
0c28 : d0 08 __ BNE $0c32 ; (zsm_play.s10 + 0)
.s25:
0c2a : 29 7f __ AND #$7f
0c2c : 38 __ __ SEC
0c2d : e9 01 __ SBC #$01
0c2f : 8d f2 41 STA $41f2 ; (zsm_delay + 0)
.s10:
0c32 : a5 49 __ LDA T2 + 0 
0c34 : 8d 20 9f STA $9f20 
0c37 : a5 4a __ LDA T2 + 1 
0c39 : 8d 21 9f STA $9f21 
0c3c : a5 48 __ LDA T1 + 0 
0c3e : 8d 22 9f STA $9f22 
0c41 : a5 47 __ LDA T0 + 0 
0c43 : 8d 25 9f STA $9f25 
.s1001:
0c46 : 60 __ __ RTS
.s11:
0c47 : 29 3f __ AND #$3f
0c49 : 09 c0 __ ORA #$c0
0c4b : 8d 20 9f STA $9f20 
0c4e : a9 f9 __ LDA #$f9
0c50 : 8d 21 9f STA $9f21 
0c53 : a9 01 __ LDA #$01
0c55 : 8d 22 9f STA $9f22 
0c58 : a5 4b __ LDA T3 + 0 
0c5a : 69 02 __ ADC #$02
0c5c : 8d f3 41 STA $41f3 ; (zsm_pos + 0)
0c5f : 90 01 __ BCC $0c62 ; (zsm_play.s1017 + 0)
.s1016:
0c61 : e8 __ __ INX
.s1017:
0c62 : 8e f4 41 STX $41f4 ; (zsm_pos + 1)
0c65 : 18 __ __ CLC
0c66 : a9 5b __ LDA #$5b
0c68 : 65 4d __ ADC T4 + 0 
0c6a : 85 4b __ STA T3 + 0 
0c6c : a5 4e __ LDA T4 + 1 
0c6e : 29 03 __ AND #$03
0c70 : 69 43 __ ADC #$43
0c72 : 85 4c __ STA T3 + 1 
0c74 : b1 4b __ LDA (T3 + 0),y 
0c76 : 8d 23 9f STA $9f23 
0c79 : 4c 6b 0b JMP $0b6b ; (zsm_play.l8 + 0)
.s4:
0c7c : ce f2 41 DEC $41f2 ; (zsm_delay + 0)
0c7f : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1d02 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
41f2 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
435b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
41f3 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0c80 : ad 41 9f LDA $9f41 
0c83 : 30 fb __ BMI $0c80 ; (sfx_put.l1 + 0)
.s3:
0c85 : a5 2d __ LDA P0 ; (index + 0)
0c87 : 8d 40 9f STA $9f40 
0c8a : ea __ __ NOP
0c8b : ea __ __ NOP
0c8c : ea __ __ NOP
0c8d : ea __ __ NOP
0c8e : a5 2e __ LDA P1 ; (data + 0)
0c90 : 8d 41 9f STA $9f41 
.s1001:
0c93 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0c94 : a9 93 __ LDA #$93
0c96 : 85 2d __ STA P0 
0c98 : a9 00 __ LDA #$00
0c9a : 85 2e __ STA P1 
0c9c : 20 d1 0c JSR $0cd1 ; (putch.s0 + 0)
0c9f : a9 11 __ LDA #$11
0ca1 : 8d 22 9f STA $9f22 
0ca4 : a2 00 __ LDX #$00
.l2:
0ca6 : 8a __ __ TXA
0ca7 : 18 __ __ CLC
0ca8 : 69 b0 __ ADC #$b0
0caa : 8d 21 9f STA $9f21 
0cad : a9 00 __ LDA #$00
0caf : 8d 20 9f STA $9f20 
0cb2 : a0 80 __ LDY #$80
.l1003:
0cb4 : a9 20 __ LDA #$20
0cb6 : 8d 23 9f STA $9f23 
0cb9 : a9 01 __ LDA #$01
0cbb : 8d 23 9f STA $9f23 
0cbe : a9 20 __ LDA #$20
0cc0 : 8d 24 9f STA $9f24 
0cc3 : a9 01 __ LDA #$01
0cc5 : 8d 24 9f STA $9f24 
0cc8 : 88 __ __ DEY
0cc9 : d0 e9 __ BNE $0cb4 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0ccb : e8 __ __ INX
0ccc : e0 40 __ CPX #$40
0cce : 90 d6 __ BCC $0ca6 ; (ClearVERAScreen.l2 + 0)
.s1001:
0cd0 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0cd1 : a5 2d __ LDA P0 
0cd3 : 20 d2 ff JSR $ffd2 
.s1001:
0cd6 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0cd7 : a9 00 __ LDA #$00
0cd9 : 85 2d __ STA P0 
0cdb : 85 2e __ STA P1 
0cdd : 85 2f __ STA P2 
0cdf : 85 30 __ STA P3 
0ce1 : 85 31 __ STA P4 
0ce3 : 8d 25 9f STA $9f25 
0ce6 : ad 29 9f LDA $9f29 
0ce9 : 09 70 __ ORA #$70
0ceb : 8d 29 9f STA $9f29 
0cee : a9 80 __ LDA #$80
0cf0 : 8d 2b 9f STA $9f2b 
0cf3 : 8d 2a 9f STA $9f2a 
0cf6 : a9 62 __ LDA #$62
0cf8 : 8d 2d 9f STA $9f2d 
0cfb : a9 60 __ LDA #$60
0cfd : 8d 34 9f STA $9f34 
0d00 : 20 a6 15 JSR $15a6 ; (tileBaseConfig.s0 + 0)
0d03 : 8d 2f 9f STA $9f2f 
0d06 : a9 20 __ LDA #$20
0d08 : 85 2f __ STA P2 
0d0a : 20 bf 15 JSR $15bf ; (memoryToMapMemoryAddress.s0 + 0)
0d0d : 8d 2e 9f STA $9f2e 
0d10 : a9 01 __ LDA #$01
0d12 : 8d 22 9f STA $9f22 
0d15 : a2 80 __ LDX #$80
.l6:
0d17 : a0 50 __ LDY #$50
.l1031:
0d19 : a9 00 __ LDA #$00
0d1b : 8d 24 9f STA $9f24 
0d1e : a9 08 __ LDA #$08
0d20 : 8d 24 9f STA $9f24 
0d23 : 88 __ __ DEY
0d24 : d0 f3 __ BNE $0d19 ; (SetUpSprites.l1031 + 0)
.s1032:
0d26 : ca __ __ DEX
0d27 : d0 ee __ BNE $0d17 ; (SetUpSprites.l6 + 0)
.s4:
0d29 : 86 48 __ STX T1 + 0 
0d2b : a9 00 __ LDA #$00
0d2d : 85 2d __ STA P0 
0d2f : 85 2e __ STA P1 
0d31 : 85 2f __ STA P2 
0d33 : 85 30 __ STA P3 
0d35 : a9 40 __ LDA #$40
0d37 : 85 33 __ STA P6 
0d39 : a9 01 __ LDA #$01
0d3b : 85 34 __ STA P7 
0d3d : a9 03 __ LDA #$03
0d3f : 85 31 __ STA P4 
0d41 : a9 1d __ LDA #$1d
0d43 : 85 32 __ STA P5 
0d45 : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
0d48 : a9 10 __ LDA #$10
0d4a : 8d 22 9f STA $9f22 
0d4d : a9 00 __ LDA #$00
0d4f : 8d 20 9f STA $9f20 
0d52 : a9 20 __ LDA #$20
0d54 : 8d 21 9f STA $9f21 
.l10:
0d57 : a9 00 __ LDA #$00
0d59 : 85 49 __ STA T2 + 0 
.l14:
0d5b : 20 08 16 JSR $1608 ; (rand.s0 + 0)
0d5e : a5 3b __ LDA ACCU + 0 
0d60 : 29 1f __ AND #$1f
0d62 : 85 3b __ STA ACCU + 0 
0d64 : a5 48 __ LDA T1 + 0 
0d66 : c9 34 __ CMP #$34
0d68 : 90 03 __ BCC $0d6d ; (SetUpSprites.s1029 + 0)
0d6a : 4c 2d 15 JMP $152d ; (SetUpSprites.s1028 + 0)
.s1029:
0d6d : c9 30 __ CMP #$30
0d6f : b0 03 __ BCS $0d74 ; (SetUpSprites.s17 + 0)
0d71 : 4c 2d 15 JMP $152d ; (SetUpSprites.s1028 + 0)
.s17:
0d74 : a9 09 __ LDA #$09
.s194:
0d76 : 8d 23 9f STA $9f23 
0d79 : a9 00 __ LDA #$00
0d7b : 8d 23 9f STA $9f23 
0d7e : e6 49 __ INC T2 + 0 
0d80 : 10 d9 __ BPL $0d5b ; (SetUpSprites.l14 + 0)
.s11:
0d82 : e6 48 __ INC T1 + 0 
0d84 : a5 48 __ LDA T1 + 0 
0d86 : c9 3c __ CMP #$3c
0d88 : 90 cd __ BCC $0d57 ; (SetUpSprites.l10 + 0)
.s12:
0d8a : a9 00 __ LDA #$00
0d8c : 85 2d __ STA P0 
0d8e : 85 30 __ STA P3 
0d90 : 85 33 __ STA P6 
0d92 : a9 31 __ LDA #$31
0d94 : 85 2e __ STA P1 
0d96 : a9 01 __ LDA #$01
0d98 : 85 2f __ STA P2 
0d9a : a9 04 __ LDA #$04
0d9c : 85 34 __ STA P7 
0d9e : a9 45 __ LDA #$45
0da0 : 85 31 __ STA P4 
0da2 : a9 1e __ LDA #$1e
0da4 : 85 32 __ STA P5 
0da6 : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
0da9 : a9 00 __ LDA #$00
0dab : 85 4d __ STA T5 + 0 
0dad : 85 4e __ STA T5 + 1 
.l49:
0daf : 85 2d __ STA P0 
0db1 : 18 __ __ CLC
0db2 : 69 02 __ ADC #$02
0db4 : 85 4b __ STA T4 + 0 
0db6 : a9 00 __ LDA #$00
0db8 : 2a __ __ ROL
0db9 : 85 4c __ STA T4 + 1 
0dbb : a9 88 __ LDA #$88
0dbd : 85 2e __ STA P1 
0dbf : a9 09 __ LDA #$09
0dc1 : 85 2f __ STA P2 
0dc3 : a9 00 __ LDA #$00
0dc5 : 85 30 __ STA P3 
0dc7 : a9 03 __ LDA #$03
0dc9 : 85 31 __ STA P4 
0dcb : 85 33 __ STA P6 
0dcd : a9 01 __ LDA #$01
0dcf : 85 32 __ STA P5 
0dd1 : 85 34 __ STA P7 
0dd3 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0dd6 : a5 4d __ LDA T5 + 0 
0dd8 : 85 2e __ STA P1 
0dda : a5 4e __ LDA T5 + 1 
0ddc : 85 2f __ STA P2 
0dde : a9 a0 __ LDA #$a0
0de0 : 85 30 __ STA P3 
0de2 : a9 01 __ LDA #$01
0de4 : 85 31 __ STA P4 
0de6 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
0de9 : a9 00 __ LDA #$00
0deb : 85 2e __ STA P1 
0ded : a9 01 __ LDA #$01
0def : 85 2f __ STA P2 
0df1 : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
0df4 : a9 88 __ LDA #$88
0df6 : 85 2e __ STA P1 
0df8 : a9 09 __ LDA #$09
0dfa : 85 2f __ STA P2 
0dfc : a9 00 __ LDA #$00
0dfe : 85 30 __ STA P3 
0e00 : a9 03 __ LDA #$03
0e02 : 85 31 __ STA P4 
0e04 : e6 2d __ INC P0 
0e06 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0e09 : a5 4d __ LDA T5 + 0 
0e0b : 85 2e __ STA P1 
0e0d : a5 4e __ LDA T5 + 1 
0e0f : 85 2f __ STA P2 
0e11 : a9 70 __ LDA #$70
0e13 : 85 30 __ STA P3 
0e15 : a9 01 __ LDA #$01
0e17 : 85 31 __ STA P4 
0e19 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
0e1c : a5 4c __ LDA T4 + 1 
0e1e : d0 16 __ BNE $0e36 ; (SetUpSprites.s51 + 0)
.s1016:
0e20 : 18 __ __ CLC
0e21 : a5 2e __ LDA P1 
0e23 : 69 40 __ ADC #$40
0e25 : 85 4d __ STA T5 + 0 
0e27 : a5 2f __ LDA P2 
0e29 : 69 00 __ ADC #$00
0e2b : 85 4e __ STA T5 + 1 
0e2d : a5 4b __ LDA T4 + 0 
0e2f : c9 14 __ CMP #$14
0e31 : b0 03 __ BCS $0e36 ; (SetUpSprites.s51 + 0)
0e33 : 4c af 0d JMP $0daf ; (SetUpSprites.l49 + 0)
.s51:
0e36 : a9 00 __ LDA #$00
0e38 : 85 2d __ STA P0 
0e3a : 85 30 __ STA P3 
0e3c : 85 33 __ STA P6 
0e3e : a9 30 __ LDA #$30
0e40 : 85 2e __ STA P1 
0e42 : a9 01 __ LDA #$01
0e44 : 85 2f __ STA P2 
0e46 : a9 00 __ LDA #$00
0e48 : 85 31 __ STA P4 
0e4a : a9 23 __ LDA #$23
0e4c : 85 32 __ STA P5 
0e4e : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
0e51 : a9 16 __ LDA #$16
0e53 : 85 2d __ STA P0 
0e55 : a9 80 __ LDA #$80
0e57 : 85 2e __ STA P1 
0e59 : a9 09 __ LDA #$09
0e5b : 85 2f __ STA P2 
0e5d : a9 01 __ LDA #$01
0e5f : 85 31 __ STA P4 
0e61 : 85 34 __ STA P7 
0e63 : a9 02 __ LDA #$02
0e65 : 85 32 __ STA P5 
0e67 : a9 03 __ LDA #$03
0e69 : 85 33 __ STA P6 
0e6b : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0e6e : a9 30 __ LDA #$30
0e70 : 85 2e __ STA P1 
0e72 : a9 01 __ LDA #$01
0e74 : 85 2f __ STA P2 
0e76 : a9 b8 __ LDA #$b8
0e78 : 85 30 __ STA P3 
0e7a : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
0e7d : a9 20 __ LDA #$20
0e7f : 85 2d __ STA P0 
0e81 : a9 35 __ LDA #$35
0e83 : 85 2e __ STA P1 
0e85 : a9 00 __ LDA #$00
0e87 : 85 30 __ STA P3 
0e89 : 85 33 __ STA P6 
0e8b : a9 02 __ LDA #$02
0e8d : 85 34 __ STA P7 
0e8f : a9 00 __ LDA #$00
0e91 : 85 31 __ STA P4 
0e93 : a9 24 __ LDA #$24
0e95 : 85 32 __ STA P5 
0e97 : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
0e9a : a9 17 __ LDA #$17
0e9c : 85 2d __ STA P0 
0e9e : a9 a9 __ LDA #$a9
0ea0 : 85 2e __ STA P1 
0ea2 : a9 09 __ LDA #$09
0ea4 : 85 2f __ STA P2 
0ea6 : a9 02 __ LDA #$02
0ea8 : 85 31 __ STA P4 
0eaa : 85 32 __ STA P5 
0eac : a9 03 __ LDA #$03
0eae : 85 33 __ STA P6 
0eb0 : a9 01 __ LDA #$01
0eb2 : 85 34 __ STA P7 
0eb4 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0eb7 : a9 fc __ LDA #$fc
0eb9 : 85 2e __ STA P1 
0ebb : a9 00 __ LDA #$00
0ebd : 85 2f __ STA P2 
0ebf : a9 b8 __ LDA #$b8
0ec1 : 85 30 __ STA P3 
0ec3 : a9 01 __ LDA #$01
0ec5 : 85 31 __ STA P4 
0ec7 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
0eca : a9 18 __ LDA #$18
0ecc : 85 2d __ STA P0 
0ece : a9 a9 __ LDA #$a9
0ed0 : 85 2e __ STA P1 
0ed2 : a9 09 __ LDA #$09
0ed4 : 85 2f __ STA P2 
0ed6 : a9 00 __ LDA #$00
0ed8 : 85 30 __ STA P3 
0eda : a9 02 __ LDA #$02
0edc : 85 31 __ STA P4 
0ede : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0ee1 : a9 4c __ LDA #$4c
0ee3 : 85 2e __ STA P1 
0ee5 : a9 01 __ LDA #$01
0ee7 : 85 2f __ STA P2 
0ee9 : 85 31 __ STA P4 
0eeb : a9 b8 __ LDA #$b8
0eed : 85 30 __ STA P3 
0eef : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
0ef2 : a9 01 __ LDA #$01
0ef4 : 85 2e __ STA P1 
0ef6 : a9 00 __ LDA #$00
0ef8 : 85 2f __ STA P2 
0efa : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
0efd : a9 10 __ LDA #$10
0eff : 85 2d __ STA P0 
0f01 : a9 20 __ LDA #$20
0f03 : 85 30 __ STA P3 
0f05 : a9 00 __ LDA #$00
0f07 : 85 31 __ STA P4 
0f09 : a9 45 __ LDA #$45
0f0b : 85 2e __ STA P1 
0f0d : a9 22 __ LDA #$22
0f0f : 85 2f __ STA P2 
0f11 : 20 02 17 JSR $1702 ; (vera_pal_putn.s0 + 0)
0f14 : a9 00 __ LDA #$00
0f16 : 85 2d __ STA P0 
0f18 : 85 30 __ STA P3 
0f1a : 85 34 __ STA P7 
0f1c : a9 35 __ LDA #$35
0f1e : 85 2e __ STA P1 
0f20 : a9 01 __ LDA #$01
0f22 : 85 2f __ STA P2 
0f24 : a9 20 __ LDA #$20
0f26 : 85 33 __ STA P6 
0f28 : a9 65 __ LDA #$65
0f2a : 85 31 __ STA P4 
0f2c : a9 22 __ LDA #$22
0f2e : 85 32 __ STA P5 
0f30 : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
0f33 : a9 00 __ LDA #$00
0f35 : 85 48 __ STA T1 + 0 
0f37 : 85 49 __ STA T2 + 0 
0f39 : a9 03 __ LDA #$03
0f3b : 85 33 __ STA P6 
0f3d : a9 02 __ LDA #$02
0f3f : 85 34 __ STA P7 
0f41 : 18 __ __ CLC
.l1045:
0f42 : a9 a8 __ LDA #$a8
0f44 : 85 2e __ STA P1 
0f46 : a9 09 __ LDA #$09
0f48 : 85 2f __ STA P2 
0f4a : a9 00 __ LDA #$00
0f4c : 85 30 __ STA P3 
0f4e : 85 31 __ STA P4 
0f50 : 85 32 __ STA P5 
0f52 : a5 48 __ LDA T1 + 0 
0f54 : 69 19 __ ADC #$19
0f56 : 85 2d __ STA P0 
0f58 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0f5b : a9 b8 __ LDA #$b8
0f5d : 85 30 __ STA P3 
0f5f : a9 01 __ LDA #$01
0f61 : 85 31 __ STA P4 
0f63 : 38 __ __ SEC
0f64 : a5 49 __ LDA T2 + 0 
0f66 : e9 fc __ SBC #$fc
0f68 : 85 2e __ STA P1 
0f6a : a9 00 __ LDA #$00
0f6c : e9 03 __ SBC #$03
0f6e : 85 2f __ STA P2 
0f70 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
0f73 : 18 __ __ CLC
0f74 : a5 49 __ LDA T2 + 0 
0f76 : 69 0c __ ADC #$0c
0f78 : 85 49 __ STA T2 + 0 
0f7a : e6 48 __ INC T1 + 0 
0f7c : a5 48 __ LDA T1 + 0 
0f7e : c9 08 __ CMP #$08
0f80 : 90 c0 __ BCC $0f42 ; (SetUpSprites.l1045 + 0)
.s55:
0f82 : a9 00 __ LDA #$00
0f84 : 85 48 __ STA T1 + 0 
0f86 : 85 49 __ STA T2 + 0 
0f88 : a9 03 __ LDA #$03
0f8a : 85 33 __ STA P6 
0f8c : 85 34 __ STA P7 
0f8e : 18 __ __ CLC
.l1047:
0f8f : a9 a8 __ LDA #$a8
0f91 : 85 2e __ STA P1 
0f93 : a9 09 __ LDA #$09
0f95 : 85 2f __ STA P2 
0f97 : a9 00 __ LDA #$00
0f99 : 85 30 __ STA P3 
0f9b : 85 31 __ STA P4 
0f9d : a5 48 __ LDA T1 + 0 
0f9f : 69 21 __ ADC #$21
0fa1 : 85 2d __ STA P0 
0fa3 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0fa6 : a9 c4 __ LDA #$c4
0fa8 : 85 30 __ STA P3 
0faa : a9 01 __ LDA #$01
0fac : 85 31 __ STA P4 
0fae : 38 __ __ SEC
0faf : a5 49 __ LDA T2 + 0 
0fb1 : e9 fc __ SBC #$fc
0fb3 : 85 2e __ STA P1 
0fb5 : a9 00 __ LDA #$00
0fb7 : e9 03 __ SBC #$03
0fb9 : 85 2f __ STA P2 
0fbb : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
0fbe : 18 __ __ CLC
0fbf : a5 49 __ LDA T2 + 0 
0fc1 : 69 0c __ ADC #$0c
0fc3 : 85 49 __ STA T2 + 0 
0fc5 : e6 48 __ INC T1 + 0 
0fc7 : a5 48 __ LDA T1 + 0 
0fc9 : c9 08 __ CMP #$08
0fcb : 90 c2 __ BCC $0f8f ; (SetUpSprites.l1047 + 0)
.s59:
0fcd : a9 00 __ LDA #$00
0fcf : 85 48 __ STA T1 + 0 
0fd1 : 85 49 __ STA T2 + 0 
0fd3 : a9 03 __ LDA #$03
0fd5 : 85 33 __ STA P6 
0fd7 : a9 04 __ LDA #$04
0fd9 : 85 34 __ STA P7 
0fdb : 18 __ __ CLC
.l1049:
0fdc : a9 a8 __ LDA #$a8
0fde : 85 2e __ STA P1 
0fe0 : a9 09 __ LDA #$09
0fe2 : 85 2f __ STA P2 
0fe4 : a9 00 __ LDA #$00
0fe6 : 85 30 __ STA P3 
0fe8 : 85 31 __ STA P4 
0fea : a5 48 __ LDA T1 + 0 
0fec : 69 29 __ ADC #$29
0fee : 85 2d __ STA P0 
0ff0 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
0ff3 : a9 b8 __ LDA #$b8
0ff5 : 85 30 __ STA P3 
0ff7 : a9 01 __ LDA #$01
0ff9 : 85 31 __ STA P4 
0ffb : 38 __ __ SEC
0ffc : a9 6c __ LDA #$6c
0ffe : e5 49 __ SBC T2 + 0 
1000 : 85 2e __ STA P1 
1002 : a9 02 __ LDA #$02
1004 : e9 04 __ SBC #$04
1006 : 85 2f __ STA P2 
1008 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
100b : 18 __ __ CLC
100c : a5 49 __ LDA T2 + 0 
100e : 69 0c __ ADC #$0c
1010 : 85 49 __ STA T2 + 0 
1012 : e6 48 __ INC T1 + 0 
1014 : a5 48 __ LDA T1 + 0 
1016 : c9 08 __ CMP #$08
1018 : 90 c2 __ BCC $0fdc ; (SetUpSprites.l1049 + 0)
.s63:
101a : a9 00 __ LDA #$00
101c : 85 48 __ STA T1 + 0 
.l65:
101e : 38 __ __ SEC
101f : a9 00 __ LDA #$00
1021 : e5 48 __ SBC T1 + 0 
1023 : 29 0c __ AND #$0c
1025 : 49 ff __ EOR #$ff
1027 : 38 __ __ SEC
1028 : 69 6c __ ADC #$6c
102a : 85 49 __ STA T2 + 0 
102c : a9 02 __ LDA #$02
102e : e9 00 __ SBC #$00
1030 : 85 4a __ STA T2 + 1 
1032 : 18 __ __ CLC
1033 : a5 48 __ LDA T1 + 0 
1035 : 69 31 __ ADC #$31
1037 : 85 2d __ STA P0 
1039 : a9 02 __ LDA #$02
103b : 85 4f __ STA T7 + 0 
103d : a9 03 __ LDA #$03
103f : 85 33 __ STA P6 
1041 : a9 04 __ LDA #$04
1043 : 85 34 __ STA P7 
.l1039:
1045 : a9 a8 __ LDA #$a8
1047 : 85 2e __ STA P1 
1049 : a9 09 __ LDA #$09
104b : 85 2f __ STA P2 
104d : a9 00 __ LDA #$00
104f : 85 30 __ STA P3 
1051 : 85 31 __ STA P4 
1053 : 85 32 __ STA P5 
1055 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1058 : a5 49 __ LDA T2 + 0 
105a : 85 2e __ STA P1 
105c : a5 4a __ LDA T2 + 1 
105e : 85 2f __ STA P2 
1060 : a9 b8 __ LDA #$b8
1062 : 85 30 __ STA P3 
1064 : a9 01 __ LDA #$01
1066 : 85 31 __ STA P4 
1068 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
106b : c6 4f __ DEC T7 + 0 
106d : d0 d6 __ BNE $1045 ; (SetUpSprites.l1039 + 0)
.s66:
106f : e6 48 __ INC T1 + 0 
1071 : a5 48 __ LDA T1 + 0 
1073 : c9 02 __ CMP #$02
1075 : 90 a7 __ BCC $101e ; (SetUpSprites.l65 + 0)
.s67:
1077 : a9 60 __ LDA #$60
1079 : 85 2d __ STA P0 
107b : a9 4f __ LDA #$4f
107d : 85 2e __ STA P1 
107f : a9 01 __ LDA #$01
1081 : 85 2f __ STA P2 
1083 : 85 34 __ STA P7 
1085 : a9 00 __ LDA #$00
1087 : 85 30 __ STA P3 
1089 : 85 33 __ STA P6 
108b : a9 00 __ LDA #$00
108d : 85 31 __ STA P4 
108f : a9 26 __ LDA #$26
1091 : 85 32 __ STA P5 
1093 : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
1096 : a9 33 __ LDA #$33
1098 : 85 2d __ STA P0 
109a : a9 7b __ LDA #$7b
109c : 85 2e __ STA P1 
109e : a9 0a __ LDA #$0a
10a0 : 85 2f __ STA P2 
10a2 : a9 01 __ LDA #$01
10a4 : 85 31 __ STA P4 
10a6 : a9 02 __ LDA #$02
10a8 : 85 32 __ STA P5 
10aa : a9 03 __ LDA #$03
10ac : 85 33 __ STA P6 
10ae : a9 06 __ LDA #$06
10b0 : 85 34 __ STA P7 
10b2 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
10b5 : a9 00 __ LDA #$00
10b7 : 85 2e __ STA P1 
10b9 : 85 31 __ STA P4 
10bb : a9 01 __ LDA #$01
10bd : 85 2f __ STA P2 
10bf : a9 78 __ LDA #$78
10c1 : 85 30 __ STA P3 
10c3 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
10c6 : a9 20 __ LDA #$20
10c8 : 85 2d __ STA P0 
10ca : a9 3f __ LDA #$3f
10cc : 85 2e __ STA P1 
10ce : a9 00 __ LDA #$00
10d0 : 85 30 __ STA P3 
10d2 : 85 33 __ STA P6 
10d4 : a9 04 __ LDA #$04
10d6 : 85 34 __ STA P7 
10d8 : a9 00 __ LDA #$00
10da : 85 31 __ STA P4 
10dc : a9 27 __ LDA #$27
10de : 85 32 __ STA P5 
10e0 : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
10e3 : a9 34 __ LDA #$34
10e5 : 85 2d __ STA P0 
10e7 : a9 f9 __ LDA #$f9
10e9 : 85 2e __ STA P1 
10eb : a9 09 __ LDA #$09
10ed : 85 2f __ STA P2 
10ef : a9 03 __ LDA #$03
10f1 : 85 31 __ STA P4 
10f3 : 85 33 __ STA P6 
10f5 : a9 02 __ LDA #$02
10f7 : 85 32 __ STA P5 
10f9 : a9 05 __ LDA #$05
10fb : 85 34 __ STA P7 
10fd : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1100 : a9 00 __ LDA #$00
1102 : 85 2e __ STA P1 
1104 : 85 31 __ STA P4 
1106 : a9 01 __ LDA #$01
1108 : 85 2f __ STA P2 
110a : a9 78 __ LDA #$78
110c : 85 30 __ STA P3 
110e : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1111 : a9 35 __ LDA #$35
1113 : 85 2d __ STA P0 
1115 : a9 19 __ LDA #$19
1117 : 85 2e __ STA P1 
1119 : a9 0a __ LDA #$0a
111b : 85 2f __ STA P2 
111d : a9 00 __ LDA #$00
111f : 85 30 __ STA P3 
1121 : a9 03 __ LDA #$03
1123 : 85 31 __ STA P4 
1125 : a9 07 __ LDA #$07
1127 : 85 33 __ STA P6 
1129 : a9 06 __ LDA #$06
112b : 85 34 __ STA P7 
112d : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1130 : a9 00 __ LDA #$00
1132 : 85 2e __ STA P1 
1134 : 85 31 __ STA P4 
1136 : a9 01 __ LDA #$01
1138 : 85 2f __ STA P2 
113a : a9 e8 __ LDA #$e8
113c : 85 30 __ STA P3 
113e : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1141 : a9 36 __ LDA #$36
1143 : 85 2d __ STA P0 
1145 : a9 19 __ LDA #$19
1147 : 85 2e __ STA P1 
1149 : a9 0a __ LDA #$0a
114b : 85 2f __ STA P2 
114d : a9 00 __ LDA #$00
114f : 85 30 __ STA P3 
1151 : a9 03 __ LDA #$03
1153 : 85 31 __ STA P4 
1155 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1158 : a9 40 __ LDA #$40
115a : 85 2e __ STA P1 
115c : a9 01 __ LDA #$01
115e : 85 2f __ STA P2 
1160 : a9 e8 __ LDA #$e8
1162 : 85 30 __ STA P3 
1164 : a9 00 __ LDA #$00
1166 : 85 31 __ STA P4 
1168 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
116b : a9 01 __ LDA #$01
116d : 85 2e __ STA P1 
116f : a9 00 __ LDA #$00
1171 : 85 2f __ STA P2 
1173 : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
1176 : a9 37 __ LDA #$37
1178 : 85 2d __ STA P0 
117a : a9 19 __ LDA #$19
117c : 85 2e __ STA P1 
117e : a9 0a __ LDA #$0a
1180 : 85 2f __ STA P2 
1182 : a9 00 __ LDA #$00
1184 : 85 30 __ STA P3 
1186 : a9 03 __ LDA #$03
1188 : 85 31 __ STA P4 
118a : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
118d : a9 00 __ LDA #$00
118f : 85 2e __ STA P1 
1191 : a9 01 __ LDA #$01
1193 : 85 2f __ STA P2 
1195 : 85 31 __ STA P4 
1197 : a9 08 __ LDA #$08
1199 : 85 30 __ STA P3 
119b : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
119e : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
11a1 : a9 38 __ LDA #$38
11a3 : 85 2d __ STA P0 
11a5 : a9 19 __ LDA #$19
11a7 : 85 2e __ STA P1 
11a9 : a9 0a __ LDA #$0a
11ab : 85 2f __ STA P2 
11ad : a9 00 __ LDA #$00
11af : 85 30 __ STA P3 
11b1 : a9 03 __ LDA #$03
11b3 : 85 31 __ STA P4 
11b5 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
11b8 : a9 40 __ LDA #$40
11ba : 85 2e __ STA P1 
11bc : a9 01 __ LDA #$01
11be : 85 2f __ STA P2 
11c0 : 85 31 __ STA P4 
11c2 : a9 08 __ LDA #$08
11c4 : 85 30 __ STA P3 
11c6 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
11c9 : a9 01 __ LDA #$01
11cb : 85 2e __ STA P1 
11cd : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
11d0 : a9 20 __ LDA #$20
11d2 : 85 2d __ STA P0 
11d4 : a9 37 __ LDA #$37
11d6 : 85 2e __ STA P1 
11d8 : a9 00 __ LDA #$00
11da : 85 30 __ STA P3 
11dc : 85 33 __ STA P6 
11de : a9 08 __ LDA #$08
11e0 : 85 34 __ STA P7 
11e2 : a9 00 __ LDA #$00
11e4 : 85 31 __ STA P4 
11e6 : a9 2b __ LDA #$2b
11e8 : 85 32 __ STA P5 
11ea : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
11ed : a9 00 __ LDA #$00
11ef : 85 48 __ STA T1 + 0 
11f1 : 85 49 __ STA T2 + 0 
11f3 : 85 4a __ STA T2 + 1 
11f5 : a9 02 __ LDA #$02
11f7 : 85 33 __ STA P6 
11f9 : a9 05 __ LDA #$05
11fb : 85 34 __ STA P7 
11fd : 18 __ __ CLC
.l1051:
11fe : a9 b9 __ LDA #$b9
1200 : 85 2e __ STA P1 
1202 : a9 09 __ LDA #$09
1204 : 85 2f __ STA P2 
1206 : a9 00 __ LDA #$00
1208 : 85 30 __ STA P3 
120a : a9 03 __ LDA #$03
120c : 85 31 __ STA P4 
120e : 85 32 __ STA P5 
1210 : a5 48 __ LDA T1 + 0 
1212 : 69 39 __ ADC #$39
1214 : 85 2d __ STA P0 
1216 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1219 : a9 20 __ LDA #$20
121b : 85 2e __ STA P1 
121d : a9 01 __ LDA #$01
121f : 85 2f __ STA P2 
1221 : 38 __ __ SEC
1222 : a5 49 __ LDA T2 + 0 
1224 : e9 40 __ SBC #$40
1226 : 85 30 __ STA P3 
1228 : a5 4a __ LDA T2 + 1 
122a : e9 00 __ SBC #$00
122c : 85 31 __ STA P4 
122e : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1231 : 18 __ __ CLC
1232 : a5 49 __ LDA T2 + 0 
1234 : 69 40 __ ADC #$40
1236 : 85 49 __ STA T2 + 0 
1238 : 90 02 __ BCC $123c ; (SetUpSprites.s1054 + 0)
.s1053:
123a : e6 4a __ INC T2 + 1 
.s1054:
123c : e6 48 __ INC T1 + 0 
123e : a5 48 __ LDA T1 + 0 
1240 : c9 07 __ CMP #$07
1242 : 90 ba __ BCC $11fe ; (SetUpSprites.l1051 + 0)
.s75:
1244 : a9 20 __ LDA #$20
1246 : 85 2d __ STA P0 
1248 : a9 47 __ LDA #$47
124a : 85 2e __ STA P1 
124c : a9 00 __ LDA #$00
124e : 85 30 __ STA P3 
1250 : 85 33 __ STA P6 
1252 : a9 08 __ LDA #$08
1254 : 85 34 __ STA P7 
1256 : a9 00 __ LDA #$00
1258 : 85 31 __ STA P4 
125a : a9 33 __ LDA #$33
125c : 85 32 __ STA P5 
125e : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
1261 : a9 47 __ LDA #$47
1263 : 85 2d __ STA P0 
1265 : a9 39 __ LDA #$39
1267 : 85 2e __ STA P1 
1269 : a9 0a __ LDA #$0a
126b : 85 2f __ STA P2 
126d : a9 03 __ LDA #$03
126f : 85 31 __ STA P4 
1271 : 85 32 __ STA P5 
1273 : a9 07 __ LDA #$07
1275 : 85 33 __ STA P6 
1277 : a9 06 __ LDA #$06
1279 : 85 34 __ STA P7 
127b : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
127e : a9 08 __ LDA #$08
1280 : 85 2e __ STA P1 
1282 : 85 30 __ STA P3 
1284 : a9 00 __ LDA #$00
1286 : 85 2f __ STA P2 
1288 : 85 31 __ STA P4 
128a : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
128d : a9 48 __ LDA #$48
128f : 85 2d __ STA P0 
1291 : a9 39 __ LDA #$39
1293 : 85 2e __ STA P1 
1295 : a9 0a __ LDA #$0a
1297 : 85 2f __ STA P2 
1299 : a9 00 __ LDA #$00
129b : 85 30 __ STA P3 
129d : a9 03 __ LDA #$03
129f : 85 31 __ STA P4 
12a1 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
12a4 : a9 48 __ LDA #$48
12a6 : 85 2e __ STA P1 
12a8 : a9 00 __ LDA #$00
12aa : 85 2f __ STA P2 
12ac : 85 31 __ STA P4 
12ae : a9 08 __ LDA #$08
12b0 : 85 30 __ STA P3 
12b2 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
12b5 : a9 01 __ LDA #$01
12b7 : 85 2e __ STA P1 
12b9 : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
12bc : a9 49 __ LDA #$49
12be : 85 2d __ STA P0 
12c0 : a9 39 __ LDA #$39
12c2 : 85 2e __ STA P1 
12c4 : a9 0a __ LDA #$0a
12c6 : 85 2f __ STA P2 
12c8 : a9 00 __ LDA #$00
12ca : 85 30 __ STA P3 
12cc : a9 03 __ LDA #$03
12ce : 85 31 __ STA P4 
12d0 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
12d3 : a9 48 __ LDA #$48
12d5 : 85 2e __ STA P1 
12d7 : 85 30 __ STA P3 
12d9 : a9 00 __ LDA #$00
12db : 85 2f __ STA P2 
12dd : 85 31 __ STA P4 
12df : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
12e2 : a9 01 __ LDA #$01
12e4 : 85 2e __ STA P1 
12e6 : 85 2f __ STA P2 
12e8 : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
12eb : a9 4a __ LDA #$4a
12ed : 85 2d __ STA P0 
12ef : a9 39 __ LDA #$39
12f1 : 85 2e __ STA P1 
12f3 : a9 0a __ LDA #$0a
12f5 : 85 2f __ STA P2 
12f7 : a9 00 __ LDA #$00
12f9 : 85 30 __ STA P3 
12fb : a9 03 __ LDA #$03
12fd : 85 31 __ STA P4 
12ff : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1302 : a9 08 __ LDA #$08
1304 : 85 2e __ STA P1 
1306 : a9 00 __ LDA #$00
1308 : 85 2f __ STA P2 
130a : 85 31 __ STA P4 
130c : a9 48 __ LDA #$48
130e : 85 30 __ STA P3 
1310 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1313 : a9 00 __ LDA #$00
1315 : 85 2e __ STA P1 
1317 : a9 01 __ LDA #$01
1319 : 85 2f __ STA P2 
131b : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
131e : a9 20 __ LDA #$20
1320 : 85 2d __ STA P0 
1322 : a9 47 __ LDA #$47
1324 : 85 2e __ STA P1 
1326 : a9 00 __ LDA #$00
1328 : 85 30 __ STA P3 
132a : a9 00 __ LDA #$00
132c : 85 31 __ STA P4 
132e : a9 33 __ LDA #$33
1330 : 85 32 __ STA P5 
1332 : a9 00 __ LDA #$00
1334 : 85 33 __ STA P6 
1336 : a9 08 __ LDA #$08
1338 : 85 34 __ STA P7 
133a : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
133d : a9 4b __ LDA #$4b
133f : 85 2d __ STA P0 
1341 : a9 39 __ LDA #$39
1343 : 85 2e __ STA P1 
1345 : a9 0a __ LDA #$0a
1347 : 85 2f __ STA P2 
1349 : a9 03 __ LDA #$03
134b : 85 31 __ STA P4 
134d : 85 32 __ STA P5 
134f : a9 07 __ LDA #$07
1351 : 85 33 __ STA P6 
1353 : a9 06 __ LDA #$06
1355 : 85 34 __ STA P7 
1357 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
135a : a9 f8 __ LDA #$f8
135c : 85 2e __ STA P1 
135e : a9 01 __ LDA #$01
1360 : 85 2f __ STA P2 
1362 : a9 08 __ LDA #$08
1364 : 85 30 __ STA P3 
1366 : a9 00 __ LDA #$00
1368 : 85 31 __ STA P4 
136a : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
136d : a9 4c __ LDA #$4c
136f : 85 2d __ STA P0 
1371 : a9 39 __ LDA #$39
1373 : 85 2e __ STA P1 
1375 : a9 0a __ LDA #$0a
1377 : 85 2f __ STA P2 
1379 : a9 00 __ LDA #$00
137b : 85 30 __ STA P3 
137d : a9 03 __ LDA #$03
137f : 85 31 __ STA P4 
1381 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1384 : a9 38 __ LDA #$38
1386 : 85 2e __ STA P1 
1388 : a9 02 __ LDA #$02
138a : 85 2f __ STA P2 
138c : a9 08 __ LDA #$08
138e : 85 30 __ STA P3 
1390 : a9 00 __ LDA #$00
1392 : 85 31 __ STA P4 
1394 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1397 : a9 01 __ LDA #$01
1399 : 85 2e __ STA P1 
139b : a9 00 __ LDA #$00
139d : 85 2f __ STA P2 
139f : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
13a2 : a9 4d __ LDA #$4d
13a4 : 85 2d __ STA P0 
13a6 : a9 39 __ LDA #$39
13a8 : 85 2e __ STA P1 
13aa : a9 0a __ LDA #$0a
13ac : 85 2f __ STA P2 
13ae : a9 00 __ LDA #$00
13b0 : 85 30 __ STA P3 
13b2 : a9 03 __ LDA #$03
13b4 : 85 31 __ STA P4 
13b6 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
13b9 : a9 38 __ LDA #$38
13bb : 85 2e __ STA P1 
13bd : a9 02 __ LDA #$02
13bf : 85 2f __ STA P2 
13c1 : a9 48 __ LDA #$48
13c3 : 85 30 __ STA P3 
13c5 : a9 00 __ LDA #$00
13c7 : 85 31 __ STA P4 
13c9 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
13cc : a9 01 __ LDA #$01
13ce : 85 2e __ STA P1 
13d0 : 85 2f __ STA P2 
13d2 : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
13d5 : a9 4e __ LDA #$4e
13d7 : 85 2d __ STA P0 
13d9 : a9 39 __ LDA #$39
13db : 85 2e __ STA P1 
13dd : a9 0a __ LDA #$0a
13df : 85 2f __ STA P2 
13e1 : a9 00 __ LDA #$00
13e3 : 85 30 __ STA P3 
13e5 : a9 03 __ LDA #$03
13e7 : 85 31 __ STA P4 
13e9 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
13ec : a9 f8 __ LDA #$f8
13ee : 85 2e __ STA P1 
13f0 : a9 01 __ LDA #$01
13f2 : 85 2f __ STA P2 
13f4 : a9 48 __ LDA #$48
13f6 : 85 30 __ STA P3 
13f8 : a9 00 __ LDA #$00
13fa : 85 31 __ STA P4 
13fc : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
13ff : a9 00 __ LDA #$00
1401 : 85 2e __ STA P1 
1403 : 20 c5 16 JSR $16c5 ; (vera_spr_flip.s0 + 0)
1406 : a9 60 __ LDA #$60
1408 : 85 2d __ STA P0 
140a : a9 51 __ LDA #$51
140c : 85 2e __ STA P1 
140e : a9 00 __ LDA #$00
1410 : 85 30 __ STA P3 
1412 : 85 33 __ STA P6 
1414 : a9 02 __ LDA #$02
1416 : 85 34 __ STA P7 
1418 : a9 00 __ LDA #$00
141a : 85 31 __ STA P4 
141c : a9 3b __ LDA #$3b
141e : 85 32 __ STA P5 
1420 : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
1423 : a9 a0 __ LDA #$a0
1425 : 85 2d __ STA P0 
1427 : a9 50 __ LDA #$50
1429 : 85 2e __ STA P1 
142b : a9 80 __ LDA #$80
142d : 85 33 __ STA P6 
142f : a9 00 __ LDA #$00
1431 : 85 34 __ STA P7 
1433 : a9 00 __ LDA #$00
1435 : 85 31 __ STA P4 
1437 : a9 3d __ LDA #$3d
1439 : 85 32 __ STA P5 
143b : 20 cd 15 JSR $15cd ; (vram_putn.s0 + 0)
143e : a9 00 __ LDA #$00
1440 : 85 47 __ STA T0 + 0 
.l77:
1442 : a9 85 __ LDA #$85
1444 : 85 2e __ STA P1 
1446 : a9 0a __ LDA #$0a
1448 : 85 2f __ STA P2 
144a : a9 01 __ LDA #$01
144c : 85 31 __ STA P4 
144e : 85 32 __ STA P5 
1450 : a9 02 __ LDA #$02
1452 : 85 33 __ STA P6 
1454 : a9 08 __ LDA #$08
1456 : 85 34 __ STA P7 
1458 : 18 __ __ CLC
1459 : a5 47 __ LDA T0 + 0 
145b : 69 4f __ ADC #$4f
145d : 85 2d __ STA P0 
145f : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
1462 : a5 47 __ LDA T0 + 0 
1464 : c9 0f __ CMP #$0f
1466 : d0 0d __ BNE $1475 ; (SetUpSprites.s204 + 0)
.s80:
1468 : a9 8b __ LDA #$8b
146a : 85 2e __ STA P1 
146c : a9 02 __ LDA #$02
146e : 85 31 __ STA P4 
1470 : 85 32 __ STA P5 
1472 : 20 2f 16 JSR $162f ; (vera_spr_set.s0 + 0)
.s204:
1475 : e6 47 __ INC T0 + 0 
1477 : a5 47 __ LDA T0 + 0 
1479 : c9 10 __ CMP #$10
147b : 90 c5 __ BCC $1442 ; (SetUpSprites.l77 + 0)
.s79:
147d : a9 20 __ LDA #$20
147f : 85 37 __ STA P10 
1481 : a9 40 __ LDA #$40
1483 : 8d fc 9e STA $9efc ; (sstack + 0)
1486 : a9 fa __ LDA #$fa
1488 : 8d fd 9e STA $9efd ; (sstack + 1)
148b : a9 01 __ LDA #$01
148d : 8d fe 9e STA $9efe ; (sstack + 2)
1490 : a9 00 __ LDA #$00
1492 : 8d ff 9e STA $9eff ; (sstack + 3)
1495 : a9 85 __ LDA #$85
1497 : 85 35 __ STA P8 
1499 : a9 22 __ LDA #$22
149b : 85 36 __ STA P9 
149d : 20 4b 17 JSR $174b ; (SetPaletteColours.s0 + 0)
14a0 : a9 60 __ LDA #$60
14a2 : 8d fc 9e STA $9efc ; (sstack + 0)
14a5 : a9 fa __ LDA #$fa
14a7 : 8d fd 9e STA $9efd ; (sstack + 1)
14aa : a9 01 __ LDA #$01
14ac : 8d fe 9e STA $9efe ; (sstack + 2)
14af : a9 00 __ LDA #$00
14b1 : 8d ff 9e STA $9eff ; (sstack + 3)
14b4 : a9 a5 __ LDA #$a5
14b6 : 85 35 __ STA P8 
14b8 : a9 22 __ LDA #$22
14ba : 85 36 __ STA P9 
14bc : 20 4b 17 JSR $174b ; (SetPaletteColours.s0 + 0)
14bf : a9 80 __ LDA #$80
14c1 : 8d fc 9e STA $9efc ; (sstack + 0)
14c4 : a9 fa __ LDA #$fa
14c6 : 8d fd 9e STA $9efd ; (sstack + 1)
14c9 : a9 01 __ LDA #$01
14cb : 8d fe 9e STA $9efe ; (sstack + 2)
14ce : a9 00 __ LDA #$00
14d0 : 8d ff 9e STA $9eff ; (sstack + 3)
14d3 : a9 c5 __ LDA #$c5
14d5 : 85 35 __ STA P8 
14d7 : a9 22 __ LDA #$22
14d9 : 85 36 __ STA P9 
14db : 20 4b 17 JSR $174b ; (SetPaletteColours.s0 + 0)
14de : a9 60 __ LDA #$60
14e0 : 85 2d __ STA P0 
14e2 : a9 20 __ LDA #$20
14e4 : 85 30 __ STA P3 
14e6 : a9 00 __ LDA #$00
14e8 : 85 31 __ STA P4 
14ea : a9 e5 __ LDA #$e5
14ec : 85 2e __ STA P1 
14ee : a9 22 __ LDA #$22
14f0 : 85 2f __ STA P2 
14f2 : 20 02 17 JSR $1702 ; (vera_pal_putn.s0 + 0)
14f5 : a9 70 __ LDA #$70
14f7 : 85 2d __ STA P0 
14f9 : a9 0c __ LDA #$0c
14fb : 85 30 __ STA P3 
14fd : a9 00 __ LDA #$00
14ff : 85 31 __ STA P4 
1501 : a9 f1 __ LDA #$f1
1503 : 85 2e __ STA P1 
1505 : a9 22 __ LDA #$22
1507 : 85 2f __ STA P2 
1509 : 20 02 17 JSR $1702 ; (vera_pal_putn.s0 + 0)
150c : a9 20 __ LDA #$20
150e : 85 2d __ STA P0 
1510 : a9 43 __ LDA #$43
1512 : 85 2e __ STA P1 
1514 : a9 01 __ LDA #$01
1516 : 85 2f __ STA P2 
1518 : a9 00 __ LDA #$00
151a : 85 30 __ STA P3 
151c : 85 33 __ STA P6 
151e : a9 04 __ LDA #$04
1520 : 85 34 __ STA P7 
1522 : a9 80 __ LDA #$80
1524 : 85 31 __ STA P4 
1526 : a9 3d __ LDA #$3d
1528 : 85 32 __ STA P5 
152a : 4c cd 15 JMP $15cd ; (vram_putn.s0 + 0)
.s1028:
152d : a9 1e __ LDA #$1e
152f : c5 3b __ CMP ACCU + 0 
1531 : a5 49 __ LDA T2 + 0 
1533 : 90 3e __ BCC $1573 ; (SetUpSprites.s1021 + 0)
.s1027:
1535 : c9 09 __ CMP #$09
1537 : 90 06 __ BCC $153f ; (SetUpSprites.s24 + 0)
.s1026:
1539 : a9 45 __ LDA #$45
153b : c5 49 __ CMP T2 + 0 
153d : b0 05 __ BCS $1544 ; (SetUpSprites.s1025 + 0)
.s24:
153f : a9 00 __ LDA #$00
1541 : 4c 76 0d JMP $0d76 ; (SetUpSprites.s194 + 0)
.s1025:
1544 : a5 49 __ LDA T2 + 0 
1546 : c9 13 __ CMP #$13
1548 : 90 06 __ BCC $1550 ; (SetUpSprites.s28 + 0)
.s1024:
154a : a9 3b __ LDA #$3b
154c : c5 49 __ CMP T2 + 0 
154e : b0 04 __ BCS $1554 ; (SetUpSprites.s1023 + 0)
.s28:
1550 : a9 01 __ LDA #$01
1552 : d0 12 __ BNE $1566 ; (SetUpSprites.s208 + 0)
.s1023:
1554 : a5 49 __ LDA T2 + 0 
1556 : c9 1d __ CMP #$1d
1558 : 90 06 __ BCC $1560 ; (SetUpSprites.s32 + 0)
.s1022:
155a : a9 31 __ LDA #$31
155c : c5 49 __ CMP T2 + 0 
155e : b0 04 __ BCS $1564 ; (SetUpSprites.s33 + 0)
.s32:
1560 : a9 02 __ LDA #$02
1562 : d0 02 __ BNE $1566 ; (SetUpSprites.s208 + 0)
.s33:
1564 : a9 03 __ LDA #$03
.s208:
1566 : 8d 23 9f STA $9f23 
1569 : a9 00 __ LDA #$00
156b : 8d 23 9f STA $9f23 
156e : e6 49 __ INC T2 + 0 
1570 : 4c 5b 0d JMP $0d5b ; (SetUpSprites.l14 + 0)
.s1021:
1573 : c9 09 __ CMP #$09
1575 : 90 06 __ BCC $157d ; (SetUpSprites.s36 + 0)
.s1020:
1577 : a9 45 __ LDA #$45
1579 : c5 49 __ CMP T2 + 0 
157b : b0 05 __ BCS $1582 ; (SetUpSprites.s1005 + 0)
.s36:
157d : a9 05 __ LDA #$05
157f : 4c 76 0d JMP $0d76 ; (SetUpSprites.s194 + 0)
.s1005:
1582 : a5 49 __ LDA T2 + 0 
1584 : c9 13 __ CMP #$13
1586 : 90 06 __ BCC $158e ; (SetUpSprites.s40 + 0)
.s1004:
1588 : a9 3b __ LDA #$3b
158a : c5 49 __ CMP T2 + 0 
158c : b0 04 __ BCS $1592 ; (SetUpSprites.s1003 + 0)
.s40:
158e : a9 06 __ LDA #$06
1590 : d0 d4 __ BNE $1566 ; (SetUpSprites.s208 + 0)
.s1003:
1592 : a5 49 __ LDA T2 + 0 
1594 : c9 1d __ CMP #$1d
1596 : 90 06 __ BCC $159e ; (SetUpSprites.s44 + 0)
.s1002:
1598 : a9 31 __ LDA #$31
159a : c5 49 __ CMP T2 + 0 
159c : b0 04 __ BCS $15a2 ; (SetUpSprites.s45 + 0)
.s44:
159e : a9 07 __ LDA #$07
15a0 : d0 c4 __ BNE $1566 ; (SetUpSprites.s208 + 0)
.s45:
15a2 : a9 08 __ LDA #$08
15a4 : d0 c0 __ BNE $1566 ; (SetUpSprites.s208 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
15a6 : a5 2d __ LDA P0 ; (bank + 0)
15a8 : 4a __ __ LSR
15a9 : a9 00 __ LDA #$00
15ab : 6a __ __ ROR
15ac : 85 3b __ STA ACCU + 0 
15ae : a5 2f __ LDA P2 ; (mem + 1)
15b0 : 29 f8 __ AND #$f8
15b2 : 4a __ __ LSR
15b3 : 05 3b __ ORA ACCU + 0 
15b5 : 85 3b __ STA ACCU + 0 
15b7 : a5 30 __ LDA P3 ; (height + 0)
15b9 : 0a __ __ ASL
15ba : 05 3b __ ORA ACCU + 0 
15bc : 05 31 __ ORA P4 ; (width + 0)
.s1001:
15be : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
15bf : a5 2d __ LDA P0 ; (bank + 0)
15c1 : 4a __ __ LSR
15c2 : a9 00 __ LDA #$00
15c4 : 6a __ __ ROR
15c5 : 85 3b __ STA ACCU + 0 
15c7 : a5 2f __ LDA P2 ; (mem + 1)
15c9 : 4a __ __ LSR
15ca : 05 3b __ ORA ACCU + 0 
.s1001:
15cc : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
15cd : ad 25 9f LDA $9f25 
15d0 : 29 fe __ AND #$fe
15d2 : 8d 25 9f STA $9f25 
15d5 : a5 2d __ LDA P0 ; (addr + 0)
15d7 : 8d 20 9f STA $9f20 
15da : a5 2e __ LDA P1 ; (addr + 1)
15dc : 8d 21 9f STA $9f21 
15df : a5 2f __ LDA P2 ; (addr + 2)
15e1 : 29 01 __ AND #$01
15e3 : 09 10 __ ORA #$10
15e5 : 8d 22 9f STA $9f22 
15e8 : a5 33 __ LDA P6 ; (size + 0)
15ea : 05 34 __ ORA P7 ; (size + 1)
15ec : f0 19 __ BEQ $1607 ; (vram_putn.s1001 + 0)
.s6:
15ee : a0 00 __ LDY #$00
15f0 : a6 33 __ LDX P6 ; (size + 0)
15f2 : f0 02 __ BEQ $15f6 ; (vram_putn.l1002 + 0)
.s1005:
15f4 : e6 34 __ INC P7 ; (size + 1)
.l1002:
15f6 : b1 31 __ LDA (P4),y ; (data + 0)
15f8 : 8d 23 9f STA $9f23 
15fb : c8 __ __ INY
15fc : d0 02 __ BNE $1600 ; (vram_putn.s1009 + 0)
.s1008:
15fe : e6 32 __ INC P5 ; (data + 1)
.s1009:
1600 : ca __ __ DEX
1601 : d0 f3 __ BNE $15f6 ; (vram_putn.l1002 + 0)
.s1004:
1603 : c6 34 __ DEC P7 ; (size + 1)
1605 : d0 ef __ BNE $15f6 ; (vram_putn.l1002 + 0)
.s1001:
1607 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1d03 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d13 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d23 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d33 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d43 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d53 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1d63 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1d73 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1d83 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1d93 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1da3 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1db3 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
1dc3 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
1dd3 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
1de3 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1df3 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1e03 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
1e13 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
1e23 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1e33 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
--------------------------------------------------------------------
rand:
.s0:
1608 : ad 44 1e LDA $1e44 ; (seed + 1)
160b : 4a __ __ LSR
160c : ad 43 1e LDA $1e43 ; (seed + 0)
160f : 6a __ __ ROR
1610 : aa __ __ TAX
1611 : a9 00 __ LDA #$00
1613 : 6a __ __ ROR
1614 : 4d 43 1e EOR $1e43 ; (seed + 0)
1617 : 85 3b __ STA ACCU + 0 
1619 : 8a __ __ TXA
161a : 4d 44 1e EOR $1e44 ; (seed + 1)
161d : 85 3c __ STA ACCU + 1 
161f : 4a __ __ LSR
1620 : 45 3b __ EOR ACCU + 0 
1622 : 8d 43 1e STA $1e43 ; (seed + 0)
1625 : 85 3b __ STA ACCU + 0 
1627 : 45 3c __ EOR ACCU + 1 
1629 : 8d 44 1e STA $1e44 ; (seed + 1)
162c : 85 3c __ STA ACCU + 1 
.s1001:
162e : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1e43 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1e45 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e55 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e65 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e75 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e85 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e95 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ea5 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1eb5 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ec5 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ed5 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ee5 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ef5 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1f05 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1f15 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1f25 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1f35 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1f45 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1f55 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1f65 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1f75 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1f85 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1f95 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1fa5 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1fb5 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1fc5 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1fd5 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1fe5 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1ff5 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2005 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2015 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2025 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2035 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2045 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2055 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2065 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2075 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2085 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2095 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20a5 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20b5 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20c5 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20d5 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20e5 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
20f5 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2105 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2115 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2125 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2135 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2145 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
2155 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
2165 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
2175 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
2185 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
2195 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
21a5 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
21b5 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
21c5 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
21d5 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
21e5 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
21f5 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
2205 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
2215 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
2225 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
2235 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
162f : ad 25 9f LDA $9f25 
1632 : 29 fe __ AND #$fe
1634 : 8d 25 9f STA $9f25 
1637 : a5 2d __ LDA P0 ; (spr + 0)
1639 : 0a __ __ ASL
163a : 0a __ __ ASL
163b : 85 3b __ STA ACCU + 0 
163d : a9 3f __ LDA #$3f
163f : 2a __ __ ROL
1640 : 06 3b __ ASL ACCU + 0 
1642 : 2a __ __ ROL
1643 : 8d 21 9f STA $9f21 
1646 : a5 3b __ LDA ACCU + 0 
1648 : 8d 20 9f STA $9f20 
164b : a9 11 __ LDA #$11
164d : 8d 22 9f STA $9f22 
1650 : a5 30 __ LDA P3 ; (mode8 + 0)
1652 : f0 02 __ BEQ $1656 ; (vera_spr_set.s11 + 0)
.s9:
1654 : a9 80 __ LDA #$80
.s11:
1656 : 05 2f __ ORA P2 ; (addr32 + 1)
1658 : a6 2e __ LDX P1 ; (addr32 + 0)
165a : 8e 23 9f STX $9f23 
165d : 8d 23 9f STA $9f23 
1660 : a9 00 __ LDA #$00
1662 : 8d 23 9f STA $9f23 
1665 : 8d 23 9f STA $9f23 
1668 : 8d 23 9f STA $9f23 
166b : 8d 23 9f STA $9f23 
166e : a5 33 __ LDA P6 ; (z + 0)
1670 : 0a __ __ ASL
1671 : 0a __ __ ASL
1672 : 8d 23 9f STA $9f23 
1675 : a5 32 __ LDA P5 ; (h + 0)
1677 : 4a __ __ LSR
1678 : 6a __ __ ROR
1679 : 29 80 __ AND #$80
167b : 6a __ __ ROR
167c : 85 3b __ STA ACCU + 0 
167e : a5 31 __ LDA P4 ; (w + 0)
1680 : 0a __ __ ASL
1681 : 0a __ __ ASL
1682 : 0a __ __ ASL
1683 : 0a __ __ ASL
1684 : 05 3b __ ORA ACCU + 0 
1686 : 05 34 __ ORA P7 ; (pal + 0)
1688 : 8d 23 9f STA $9f23 
.s1001:
168b : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
168c : ad 25 9f LDA $9f25 
168f : 29 fe __ AND #$fe
1691 : 8d 25 9f STA $9f25 
1694 : a5 2d __ LDA P0 ; (spr + 0)
1696 : 0a __ __ ASL
1697 : 0a __ __ ASL
1698 : 85 3b __ STA ACCU + 0 
169a : a9 3f __ LDA #$3f
169c : 2a __ __ ROL
169d : 06 3b __ ASL ACCU + 0 
169f : 2a __ __ ROL
16a0 : aa __ __ TAX
16a1 : a5 3b __ LDA ACCU + 0 
16a3 : 09 02 __ ORA #$02
16a5 : 8d 20 9f STA $9f20 
16a8 : 8e 21 9f STX $9f21 
16ab : a9 11 __ LDA #$11
16ad : 8d 22 9f STA $9f22 
16b0 : a5 2e __ LDA P1 ; (x + 0)
16b2 : 8d 23 9f STA $9f23 
16b5 : a5 2f __ LDA P2 ; (x + 1)
16b7 : 8d 23 9f STA $9f23 
16ba : a5 30 __ LDA P3 ; (y + 0)
16bc : 8d 23 9f STA $9f23 
16bf : a5 31 __ LDA P4 ; (y + 1)
16c1 : 8d 23 9f STA $9f23 
.s1001:
16c4 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
16c5 : ad 25 9f LDA $9f25 
16c8 : 29 fe __ AND #$fe
16ca : 8d 25 9f STA $9f25 
16cd : a5 2d __ LDA P0 ; (spr + 0)
16cf : 0a __ __ ASL
16d0 : 0a __ __ ASL
16d1 : 85 3b __ STA ACCU + 0 
16d3 : a9 3f __ LDA #$3f
16d5 : 2a __ __ ROL
16d6 : 06 3b __ ASL ACCU + 0 
16d8 : 2a __ __ ROL
16d9 : aa __ __ TAX
16da : a5 3b __ LDA ACCU + 0 
16dc : 09 06 __ ORA #$06
16de : 8d 20 9f STA $9f20 
16e1 : 8e 21 9f STX $9f21 
16e4 : a9 01 __ LDA #$01
16e6 : 8d 22 9f STA $9f22 
16e9 : ad 23 9f LDA $9f23 
16ec : 29 fc __ AND #$fc
16ee : a8 __ __ TAY
16ef : a5 2e __ LDA P1 ; (fliph + 0)
16f1 : f0 01 __ BEQ $16f4 ; (vera_spr_flip.s14 + 0)
.s6:
16f3 : c8 __ __ INY
.s14:
16f4 : a5 2f __ LDA P2 ; (flipv + 0)
16f6 : f0 05 __ BEQ $16fd ; (vera_spr_flip.s11 + 0)
.s9:
16f8 : 98 __ __ TYA
16f9 : 09 02 __ ORA #$02
16fb : d0 01 __ BNE $16fe ; (vera_spr_flip.s1002 + 0)
.s11:
16fd : 98 __ __ TYA
.s1002:
16fe : 8d 23 9f STA $9f23 
.s1001:
1701 : 60 __ __ RTS
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
1702 : ad 25 9f LDA $9f25 
1705 : 29 fe __ AND #$fe
1707 : 8d 25 9f STA $9f25 
170a : a5 2d __ LDA P0 ; (index + 0)
170c : 0a __ __ ASL
170d : 8d 20 9f STA $9f20 
1710 : a9 7d __ LDA #$7d
1712 : 2a __ __ ROL
1713 : 8d 21 9f STA $9f21 
1716 : a9 11 __ LDA #$11
1718 : 8d 22 9f STA $9f22 
171b : a5 30 __ LDA P3 ; (size + 0)
171d : 05 31 __ ORA P4 ; (size + 1)
171f : f0 29 __ BEQ $174a ; (vera_pal_putn.s1001 + 0)
.s6:
1721 : a6 30 __ LDX P3 ; (size + 0)
1723 : f0 02 __ BEQ $1727 ; (vera_pal_putn.l3 + 0)
.s1003:
1725 : e6 31 __ INC P4 ; (size + 1)
.l3:
1727 : a0 01 __ LDY #$01
1729 : b1 2e __ LDA (P1),y ; (color + 0)
172b : 85 3c __ STA ACCU + 1 
172d : 88 __ __ DEY
172e : b1 2e __ LDA (P1),y ; (color + 0)
1730 : 8d 23 9f STA $9f23 
1733 : a5 3c __ LDA ACCU + 1 
1735 : 8d 23 9f STA $9f23 
1738 : 18 __ __ CLC
1739 : a5 2e __ LDA P1 ; (color + 0)
173b : 69 02 __ ADC #$02
173d : 85 2e __ STA P1 ; (color + 0)
173f : 90 02 __ BCC $1743 ; (vera_pal_putn.s1007 + 0)
.s1006:
1741 : e6 2f __ INC P2 ; (color + 1)
.s1007:
1743 : ca __ __ DEX
1744 : d0 e1 __ BNE $1727 ; (vera_pal_putn.l3 + 0)
.s1002:
1746 : c6 31 __ DEC P4 ; (size + 1)
1748 : d0 dd __ BNE $1727 ; (vera_pal_putn.l3 + 0)
.s1001:
174a : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2245 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2255 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2265 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
2275 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
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
WavyHead:
3b00 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
3b10 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3b20 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3b30 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3b40 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3b50 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3b60 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3b70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3b80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3b90 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3ba0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3bb0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3bc0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3bd0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3be0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3bf0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3c00 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3c10 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3c20 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3c30 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3c40 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3c50 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3c60 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3c70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3c80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3c90 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3ca0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3cb0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3cc0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3cd0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3ce0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3cf0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
3d00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
3d10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
3d20 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
3d30 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
3d40 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
3d50 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
3d60 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
3d70 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
174b : ad fc 9e LDA $9efc ; (sstack + 0)
174e : 85 2d __ STA P0 
1750 : ad fd 9e LDA $9efd ; (sstack + 1)
1753 : 85 2e __ STA P1 
1755 : ad fe 9e LDA $9efe ; (sstack + 2)
1758 : 85 2f __ STA P2 
175a : ad ff 9e LDA $9eff ; (sstack + 3)
175d : 85 30 __ STA P3 
175f : a5 35 __ LDA P8 ; (input + 0)
1761 : 85 31 __ STA P4 
1763 : a5 36 __ LDA P9 ; (input + 1)
1765 : 85 32 __ STA P5 
1767 : a5 37 __ LDA P10 ; (inputsize + 0)
1769 : 85 33 __ STA P6 
176b : a9 00 __ LDA #$00
176d : 85 34 __ STA P7 
176f : 4c cd 15 JMP $15cd ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
2285 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
2295 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
22a5 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
22b5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
22c5 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
22d5 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
22e5 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
22f1 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
EyeTri:
3d80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3da0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3db0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3dc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3dd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3de0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3df0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3e20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3e40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3e60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3e80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e90 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
3ea0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3eb0 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
3ec0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ed0 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
3ee0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ef0 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
3f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f10 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
3f20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f30 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
3f40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f50 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
3f60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f70 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
3f80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3f90 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
3fa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3fb0 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
3fc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3fd0 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
3fe0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3ff0 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4000 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4010 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4020 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4030 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4040 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4050 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
4060 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
4070 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
4080 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
4090 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
40a0 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
40b0 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
40c0 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
40d0 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
40e0 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
40f0 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4100 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4110 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4120 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4130 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4140 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4150 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
4160 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
4170 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
getchx:
.s0:
1772 : 20 7c 17 JSR $177c ; (getpch + 0)
1775 : 85 3b __ STA ACCU + 0 
1777 : a9 00 __ LDA #$00
1779 : 85 3c __ STA ACCU + 1 
.s1001:
177b : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
177c : 20 e4 ff JSR $ffe4 
177f : ae fd 22 LDX $22fd ; (giocharmap + 0)
1782 : e0 01 __ CPX #$01
1784 : 90 26 __ BCC $17ac ; (getpch + 48)
1786 : c9 0d __ CMP #$0d
1788 : d0 02 __ BNE $178c ; (getpch + 16)
178a : a9 0a __ LDA #$0a
178c : e0 02 __ CPX #$02
178e : 90 1c __ BCC $17ac ; (getpch + 48)
1790 : c9 db __ CMP #$db
1792 : b0 18 __ BCS $17ac ; (getpch + 48)
1794 : c9 41 __ CMP #$41
1796 : 90 14 __ BCC $17ac ; (getpch + 48)
1798 : c9 c1 __ CMP #$c1
179a : 90 02 __ BCC $179e ; (getpch + 34)
179c : 49 a0 __ EOR #$a0
179e : c9 7b __ CMP #$7b
17a0 : b0 0a __ BCS $17ac ; (getpch + 48)
17a2 : c9 61 __ CMP #$61
17a4 : b0 04 __ BCS $17aa ; (getpch + 46)
17a6 : c9 5b __ CMP #$5b
17a8 : b0 02 __ BCS $17ac ; (getpch + 48)
17aa : 49 20 __ EOR #$20
17ac : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
22fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
22fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
4180 : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
4182 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
4184 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
17ad : a9 33 __ LDA #$33
17af : 85 2d __ STA P0 
17b1 : a9 38 __ LDA #$38
17b3 : 85 2e __ STA P1 
17b5 : a9 01 __ LDA #$01
17b7 : 85 2f __ STA P2 
17b9 : a6 32 __ LDX P5 ; (p + 0)
17bb : bd 00 42 LDA $4200,x ; (sintab + 0)
17be : 4a __ __ LSR
17bf : 4a __ __ LSR
17c0 : 4a __ __ LSR
17c1 : 49 10 __ EOR #$10
17c3 : 38 __ __ SEC
17c4 : e9 10 __ SBC #$10
17c6 : 18 __ __ CLC
17c7 : 69 b4 __ ADC #$b4
17c9 : 85 30 __ STA P3 
17cb : a9 00 __ LDA #$00
17cd : 85 31 __ STA P4 
17cf : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
17d2 : a9 34 __ LDA #$34
17d4 : 85 2d __ STA P0 
17d6 : a9 20 __ LDA #$20
17d8 : 85 2e __ STA P1 
17da : a6 34 __ LDX P7 ; (p2 + 0)
17dc : bd 00 42 LDA $4200,x ; (sintab + 0)
17df : 4a __ __ LSR
17e0 : 4a __ __ LSR
17e1 : 4a __ __ LSR
17e2 : 49 10 __ EOR #$10
17e4 : 38 __ __ SEC
17e5 : e9 10 __ SBC #$10
17e7 : 18 __ __ CLC
17e8 : 69 b4 __ ADC #$b4
17ea : 85 30 __ STA P3 
17ec : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
17ef : a9 35 __ LDA #$35
17f1 : 85 2d __ STA P0 
17f3 : a9 00 __ LDA #$00
17f5 : 85 2e __ STA P1 
17f7 : a6 36 __ LDX P9 ; (p3 + 0)
17f9 : bd 00 42 LDA $4200,x ; (sintab + 0)
17fc : 4a __ __ LSR
17fd : 4a __ __ LSR
17fe : 4a __ __ LSR
17ff : 49 10 __ EOR #$10
1801 : 38 __ __ SEC
1802 : e9 10 __ SBC #$10
1804 : 18 __ __ CLC
1805 : 69 a4 __ ADC #$a4
1807 : 85 30 __ STA P3 
1809 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
180c : a9 36 __ LDA #$36
180e : 85 2d __ STA P0 
1810 : a9 40 __ LDA #$40
1812 : 85 2e __ STA P1 
1814 : a6 36 __ LDX P9 ; (p3 + 0)
1816 : bd 00 42 LDA $4200,x ; (sintab + 0)
1819 : 4a __ __ LSR
181a : 4a __ __ LSR
181b : 4a __ __ LSR
181c : 49 10 __ EOR #$10
181e : 38 __ __ SEC
181f : e9 10 __ SBC #$10
1821 : 18 __ __ CLC
1822 : 69 a4 __ ADC #$a4
1824 : 85 30 __ STA P3 
1826 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1829 : a9 37 __ LDA #$37
182b : 85 2d __ STA P0 
182d : a9 00 __ LDA #$00
182f : 85 2e __ STA P1 
1831 : a6 36 __ LDX P9 ; (p3 + 0)
1833 : bd 00 42 LDA $4200,x ; (sintab + 0)
1836 : 4a __ __ LSR
1837 : 4a __ __ LSR
1838 : 4a __ __ LSR
1839 : 49 10 __ EOR #$10
183b : 38 __ __ SEC
183c : e9 10 __ SBC #$10
183e : 18 __ __ CLC
183f : 69 c4 __ ADC #$c4
1841 : 85 30 __ STA P3 
1843 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1846 : a9 38 __ LDA #$38
1848 : 85 2d __ STA P0 
184a : a9 40 __ LDA #$40
184c : 85 2e __ STA P1 
184e : a6 36 __ LDX P9 ; (p3 + 0)
1850 : bd 00 42 LDA $4200,x ; (sintab + 0)
1853 : 4a __ __ LSR
1854 : 4a __ __ LSR
1855 : 4a __ __ LSR
1856 : 49 10 __ EOR #$10
1858 : 38 __ __ SEC
1859 : e9 10 __ SBC #$10
185b : 18 __ __ CLC
185c : 69 c4 __ ADC #$c4
185e : 85 30 __ STA P3 
1860 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
1863 : a9 00 __ LDA #$00
1865 : 85 49 __ STA T1 + 0 
.l2:
1867 : ad 86 41 LDA $4186 ; (FrameCount + 0)
186a : a4 49 __ LDY T1 + 0 
186c : 18 __ __ CLC
186d : 79 e0 1c ADC $1ce0,y ; (__multab12L + 0)
1870 : aa __ __ TAX
1871 : bd 00 42 LDA $4200,x ; (sintab + 0)
1874 : 85 4d __ STA T4 + 0 
1876 : 29 80 __ AND #$80
1878 : 10 02 __ BPL $187c ; (MoveSprites.l2 + 21)
187a : a9 ff __ LDA #$ff
187c : 85 3c __ STA ACCU + 1 
187e : b9 f0 1c LDA $1cf0,y ; (__multab3L + 0)
1881 : 85 4a __ STA T2 + 0 
1883 : ad 86 41 LDA $4186 ; (FrameCount + 0)
1886 : 38 __ __ SEC
1887 : e9 40 __ SBC #$40
1889 : 18 __ __ CLC
188a : 65 4a __ ADC T2 + 0 
188c : aa __ __ TAX
188d : bd 00 42 LDA $4200,x ; (sintab + 0)
1890 : 85 4e __ STA T7 + 0 
1892 : 29 80 __ AND #$80
1894 : 10 02 __ BPL $1898 ; (MoveSprites.l2 + 49)
1896 : a9 ff __ LDA #$ff
1898 : 85 48 __ STA T0 + 1 
189a : 98 __ __ TYA
189b : 18 __ __ CLC
189c : 69 4f __ ADC #$4f
189e : 85 2d __ STA P0 
18a0 : 18 __ __ CLC
18a1 : a5 4d __ LDA T4 + 0 
18a3 : 6d 86 41 ADC $4186 ; (FrameCount + 0)
18a6 : 85 4b __ STA T3 + 0 
18a8 : a5 3c __ LDA ACCU + 1 
18aa : 6d 87 41 ADC $4187 ; (FrameCount + 1)
18ad : 85 4c __ STA T3 + 1 
18af : 98 __ __ TYA
18b0 : 0a __ __ ASL
18b1 : 0a __ __ ASL
18b2 : 85 3b __ STA ACCU + 0 
18b4 : a9 00 __ LDA #$00
18b6 : 85 3c __ STA ACCU + 1 
18b8 : a9 80 __ LDA #$80
18ba : 85 23 __ STA WORK + 0 
18bc : a9 02 __ LDA #$02
18be : 85 24 __ STA WORK + 1 
18c0 : 20 32 1c JSR $1c32 ; (divmod + 0)
18c3 : 18 __ __ CLC
18c4 : a5 25 __ LDA WORK + 2 
18c6 : 65 4b __ ADC T3 + 0 
18c8 : 85 2e __ STA P1 
18ca : a5 26 __ LDA WORK + 3 
18cc : 65 4c __ ADC T3 + 1 
18ce : 85 2f __ STA P2 
18d0 : a5 4d __ LDA T4 + 0 
18d2 : 4a __ __ LSR
18d3 : 4a __ __ LSR
18d4 : 4a __ __ LSR
18d5 : 4a __ __ LSR
18d6 : 49 08 __ EOR #$08
18d8 : 38 __ __ SEC
18d9 : e9 08 __ SBC #$08
18db : 85 4b __ STA T3 + 0 
18dd : a9 00 __ LDA #$00
18df : e9 00 __ SBC #$00
18e1 : 85 4c __ STA T3 + 1 
18e3 : a5 49 __ LDA T1 + 0 
18e5 : c9 0f __ CMP #$0f
18e7 : f0 2e __ BEQ $1917 ; (MoveSprites.s5 + 0)
.s6:
18e9 : 18 __ __ CLC
18ea : a5 4e __ LDA T7 + 0 
18ec : 69 40 __ ADC #$40
18ee : a8 __ __ TAY
18ef : a5 48 __ LDA T0 + 1 
18f1 : 69 00 __ ADC #$00
18f3 : aa __ __ TAX
18f4 : 98 __ __ TYA
18f5 : 18 __ __ CLC
18f6 : 65 4b __ ADC T3 + 0 
18f8 : a8 __ __ TAY
18f9 : 8a __ __ TXA
18fa : 65 4c __ ADC T3 + 1 
18fc : aa __ __ TAX
18fd : 98 __ __ TYA
18fe : 18 __ __ CLC
18ff : 65 4a __ ADC T2 + 0 
1901 : 85 30 __ STA P3 
1903 : 90 01 __ BCC $1906 ; (MoveSprites.s1009 + 0)
.s1008:
1905 : e8 __ __ INX
.s1009:
1906 : 86 31 __ STX P4 
1908 : 20 8c 16 JSR $168c ; (vera_spr_move.s0 + 0)
190b : e6 49 __ INC T1 + 0 
190d : a5 49 __ LDA T1 + 0 
190f : c9 10 __ CMP #$10
1911 : b0 03 __ BCS $1916 ; (MoveSprites.s1001 + 0)
1913 : 4c 67 18 JMP $1867 ; (MoveSprites.l2 + 0)
.s1001:
1916 : 60 __ __ RTS
.s5:
1917 : 18 __ __ CLC
1918 : a5 4e __ LDA T7 + 0 
191a : 69 38 __ ADC #$38
191c : a8 __ __ TAY
191d : a5 48 __ LDA T0 + 1 
191f : 69 00 __ ADC #$00
1921 : aa __ __ TAX
1922 : 98 __ __ TYA
1923 : 18 __ __ CLC
1924 : 65 4b __ ADC T3 + 0 
1926 : a8 __ __ TAY
1927 : 8a __ __ TXA
1928 : 65 4c __ ADC T3 + 1 
192a : aa __ __ TAX
192b : 98 __ __ TYA
192c : 18 __ __ CLC
192d : 65 4a __ ADC T2 + 0 
192f : 85 30 __ STA P3 
1931 : 90 01 __ BCC $1934 ; (MoveSprites.s1007 + 0)
.s1006:
1933 : e8 __ __ INX
.s1007:
1934 : 86 31 __ STX P4 
1936 : 4c 8c 16 JMP $168c ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4200 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4210 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4220 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4230 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4240 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4250 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4260 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4270 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4280 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4290 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
42a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
42b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
42c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
42d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
42e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
42f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
4186 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1939 : a9 08 __ LDA #$08
193b : 8d 2c 9f STA $9f2c 
193e : 20 6f 19 JSR $196f ; (zsm_check.s0 + 0)
1941 : 09 00 __ ORA #$00
1943 : d0 01 __ BNE $1946 ; (PlayZSM.s1 + 0)
.s1001:
1945 : 60 __ __ RTS
.s1:
1946 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1948 : 05 32 __ ORA P5 ; (TuneSelection + 0)
194a : d0 07 __ BNE $1953 ; (PlayZSM.s11 + 0)
.s7:
194c : a9 1b __ LDA #$1b
194e : a0 00 __ LDY #$00
1950 : 4c 68 19 JMP $1968 ; (PlayZSM.s15 + 0)
.s11:
1953 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1955 : d0 06 __ BNE $195d ; (PlayZSM.s5 + 0)
.s1002:
1957 : a5 32 __ LDA P5 ; (TuneSelection + 0)
1959 : c9 01 __ CMP #$01
195b : f0 07 __ BEQ $1964 ; (PlayZSM.s9 + 0)
.s5:
195d : a9 1a __ LDA #$1a
195f : a0 e0 __ LDY #$e0
1961 : 4c 68 19 JMP $1968 ; (PlayZSM.s15 + 0)
.s9:
1964 : a9 1b __ LDA #$1b
1966 : a0 1e __ LDY #$1e
.s15:
1968 : 84 30 __ STY P3 
196a : 85 31 __ STA P4 
196c : 4c 73 19 JMP $1973 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
196f : ad 01 1d LDA $1d01 ; (zsm_finished + 0)
.s1001:
1972 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1973 : a9 01 __ LDA #$01
1975 : 8d 01 1d STA $1d01 ; (zsm_finished + 0)
1978 : ad 88 41 LDA $4188 ; (zsm_reading + 0)
197b : f0 0a __ BEQ $1987 ; (zsm_init.s3 + 0)
.s1:
197d : a9 02 __ LDA #$02
197f : 20 cc 19 JSR $19cc ; (krnio_close.s1000 + 0)
1982 : a9 00 __ LDA #$00
1984 : 8d 88 41 STA $4188 ; (zsm_reading + 0)
.s3:
1987 : 8d f3 41 STA $41f3 ; (zsm_pos + 0)
198a : 8d f4 41 STA $41f4 ; (zsm_pos + 1)
198d : 8d f5 41 STA $41f5 ; (zsm_wpos + 0)
1990 : 8d f6 41 STA $41f6 ; (zsm_wpos + 1)
1993 : 8d f2 41 STA $41f2 ; (zsm_delay + 0)
1996 : a5 30 __ LDA P3 ; (fname + 0)
1998 : 85 2d __ STA P0 
199a : a5 31 __ LDA P4 ; (fname + 1)
199c : 85 2e __ STA P1 
199e : 20 d4 19 JSR $19d4 ; (krnio_setnam.s0 + 0)
19a1 : a9 02 __ LDA #$02
19a3 : 85 2d __ STA P0 
19a5 : 85 2f __ STA P2 
19a7 : a9 08 __ LDA #$08
19a9 : 85 2e __ STA P1 
19ab : 20 ea 19 JSR $19ea ; (krnio_open.s0 + 0)
19ae : a5 3b __ LDA ACCU + 0 
19b0 : f0 19 __ BEQ $19cb ; (zsm_init.s1001 + 0)
.s4:
19b2 : a9 01 __ LDA #$01
19b4 : 8d 88 41 STA $4188 ; (zsm_reading + 0)
19b7 : 20 12 1a JSR $1a12 ; (zsm_fill.s0 + 0)
19ba : a9 10 __ LDA #$10
19bc : 8d f3 41 STA $41f3 ; (zsm_pos + 0)
19bf : a9 00 __ LDA #$00
19c1 : 8d f4 41 STA $41f4 ; (zsm_pos + 1)
19c4 : 8d 01 1d STA $1d01 ; (zsm_finished + 0)
19c7 : a9 01 __ LDA #$01
19c9 : 85 3b __ STA ACCU + 0 
.s1001:
19cb : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
4188 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
19cc : 85 2d __ STA P0 
.s0:
19ce : a5 2d __ LDA P0 
19d0 : 20 c3 ff JSR $ffc3 
.s1001:
19d3 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
41f5 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
19d4 : a5 2d __ LDA P0 
19d6 : 05 2e __ ORA P1 
19d8 : f0 08 __ BEQ $19e2 ; (krnio_setnam.s0 + 14)
19da : a0 ff __ LDY #$ff
19dc : c8 __ __ INY
19dd : b1 2d __ LDA (P0),y 
19df : d0 fb __ BNE $19dc ; (krnio_setnam.s0 + 8)
19e1 : 98 __ __ TYA
19e2 : a6 2d __ LDX P0 
19e4 : a4 2e __ LDY P1 
19e6 : 20 bd ff JSR $ffbd 
.s1001:
19e9 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
19ea : a9 00 __ LDA #$00
19ec : a6 2d __ LDX P0 ; (fnum + 0)
19ee : 9d 5b 47 STA $475b,x ; (krnio_pstatus + 0)
19f1 : a9 00 __ LDA #$00
19f3 : 85 3b __ STA ACCU + 0 
19f5 : 85 3c __ STA ACCU + 1 
19f7 : a5 2d __ LDA P0 ; (fnum + 0)
19f9 : a6 2e __ LDX P1 
19fb : a4 2f __ LDY P2 
19fd : 20 ba ff JSR $ffba 
1a00 : 20 c0 ff JSR $ffc0 
1a03 : 90 08 __ BCC $1a0d ; (krnio_open.s0 + 35)
1a05 : a5 2d __ LDA P0 ; (fnum + 0)
1a07 : 20 c3 ff JSR $ffc3 
1a0a : 4c 11 1a JMP $1a11 ; (krnio_open.s1001 + 0)
1a0d : a9 01 __ LDA #$01
1a0f : 85 3b __ STA ACCU + 0 
.s1001:
1a11 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
475b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1a12 : ad 88 41 LDA $4188 ; (zsm_reading + 0)
1a15 : f0 20 __ BEQ $1a37 ; (zsm_fill.s1 + 0)
.s2:
1a17 : ad f4 41 LDA $41f4 ; (zsm_pos + 1)
1a1a : 18 __ __ CLC
1a1b : 69 04 __ ADC #$04
1a1d : cd f6 41 CMP $41f6 ; (zsm_wpos + 1)
1a20 : d0 0c __ BNE $1a2e ; (zsm_fill.s6 + 0)
.s1006:
1a22 : ad f5 41 LDA $41f5 ; (zsm_wpos + 0)
1a25 : cd f3 41 CMP $41f3 ; (zsm_pos + 0)
1a28 : d0 04 __ BNE $1a2e ; (zsm_fill.s6 + 0)
.s5:
1a2a : a9 00 __ LDA #$00
1a2c : f0 0b __ BEQ $1a39 ; (zsm_fill.s1008 + 0)
.s6:
1a2e : a9 02 __ LDA #$02
1a30 : 20 b6 1a JSR $1ab6 ; (krnio_chkin.s1000 + 0)
1a33 : a5 3b __ LDA ACCU + 0 
1a35 : d0 07 __ BNE $1a3e ; (zsm_fill.s9 + 0)
.s1:
1a37 : a9 ff __ LDA #$ff
.s1008:
1a39 : 85 3b __ STA ACCU + 0 
.s1001:
1a3b : 85 3c __ STA ACCU + 1 
1a3d : 60 __ __ RTS
.s9:
1a3e : a9 00 __ LDA #$00
1a40 : 85 47 __ STA T1 + 0 
1a42 : 85 48 __ STA T1 + 1 
1a44 : ad f4 41 LDA $41f4 ; (zsm_pos + 1)
1a47 : 18 __ __ CLC
1a48 : 69 04 __ ADC #$04
1a4a : cd f6 41 CMP $41f6 ; (zsm_wpos + 1)
1a4d : d0 08 __ BNE $1a57 ; (zsm_fill.l13 + 0)
.s1002:
1a4f : ad f5 41 LDA $41f5 ; (zsm_wpos + 0)
1a52 : cd f3 41 CMP $41f3 ; (zsm_pos + 0)
1a55 : f0 49 __ BEQ $1aa0 ; (zsm_fill.s37 + 0)
.l13:
1a57 : 20 c8 1a JSR $1ac8 ; (krnio_chrin.s0 + 0)
1a5a : ad f5 41 LDA $41f5 ; (zsm_wpos + 0)
1a5d : aa __ __ TAX
1a5e : 18 __ __ CLC
1a5f : 69 01 __ ADC #$01
1a61 : 8d f5 41 STA $41f5 ; (zsm_wpos + 0)
1a64 : ad f6 41 LDA $41f6 ; (zsm_wpos + 1)
1a67 : a8 __ __ TAY
1a68 : 69 00 __ ADC #$00
1a6a : 8d f6 41 STA $41f6 ; (zsm_wpos + 1)
1a6d : 8a __ __ TXA
1a6e : 18 __ __ CLC
1a6f : 69 5b __ ADC #$5b
1a71 : 85 49 __ STA T3 + 0 
1a73 : 98 __ __ TYA
1a74 : 29 03 __ AND #$03
1a76 : 69 43 __ ADC #$43
1a78 : 85 4a __ STA T3 + 1 
1a7a : a5 3b __ LDA ACCU + 0 
1a7c : a0 00 __ LDY #$00
1a7e : 91 49 __ STA (T3 + 0),y 
1a80 : e6 47 __ INC T1 + 0 
1a82 : d0 02 __ BNE $1a86 ; (zsm_fill.s1010 + 0)
.s1009:
1a84 : e6 48 __ INC T1 + 1 
.s1010:
1a86 : 20 d2 1a JSR $1ad2 ; (krnio_status.s0 + 0)
1a89 : a5 3b __ LDA ACCU + 0 
1a8b : d0 0e __ BNE $1a9b ; (zsm_fill.s15 + 0)
.s12:
1a8d : ad f4 41 LDA $41f4 ; (zsm_pos + 1)
1a90 : 18 __ __ CLC
1a91 : 69 04 __ ADC #$04
1a93 : cd f6 41 CMP $41f6 ; (zsm_wpos + 1)
1a96 : d0 bf __ BNE $1a57 ; (zsm_fill.l13 + 0)
1a98 : 4c 4f 1a JMP $1a4f ; (zsm_fill.s1002 + 0)
.s15:
1a9b : a9 00 __ LDA #$00
1a9d : 8d 88 41 STA $4188 ; (zsm_reading + 0)
.s37:
1aa0 : 20 dc 1a JSR $1adc ; (krnio_clrchn.s0 + 0)
1aa3 : ad 88 41 LDA $4188 ; (zsm_reading + 0)
1aa6 : d0 05 __ BNE $1aad ; (zsm_fill.s21 + 0)
.s19:
1aa8 : a9 02 __ LDA #$02
1aaa : 20 cc 19 JSR $19cc ; (krnio_close.s1000 + 0)
.s21:
1aad : a5 47 __ LDA T1 + 0 
1aaf : 85 3b __ STA ACCU + 0 
1ab1 : a5 48 __ LDA T1 + 1 
1ab3 : 4c 3b 1a JMP $1a3b ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1ab6 : 85 2d __ STA P0 
.s0:
1ab8 : a6 2d __ LDX P0 
1aba : 20 c6 ff JSR $ffc6 
1abd : a9 00 __ LDA #$00
1abf : 85 3c __ STA ACCU + 1 
1ac1 : b0 02 __ BCS $1ac5 ; (krnio_chkin.s0 + 13)
1ac3 : a9 01 __ LDA #$01
1ac5 : 85 3b __ STA ACCU + 0 
.s1001:
1ac7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1ac8 : 20 cf ff JSR $ffcf 
1acb : 85 3b __ STA ACCU + 0 
1acd : a9 00 __ LDA #$00
1acf : 85 3c __ STA ACCU + 1 
.s1001:
1ad1 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1ad2 : 20 b7 ff JSR $ffb7 
1ad5 : 85 3b __ STA ACCU + 0 
1ad7 : a9 00 __ LDA #$00
1ad9 : 85 3c __ STA ACCU + 1 
.s1001:
1adb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1adc : 20 cc ff JSR $ffcc 
.s1001:
1adf : 60 __ __ RTS
--------------------------------------------------------------------
1ae0 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1af0 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1b00 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 54 68 69 63 : @0:zsmfiles/Thic
1b10 : __ __ __ BYT 63 46 69 6c 65 2e 7a 73 6d 2c 50 2c 52 00       : cFile.zsm,P,R.
--------------------------------------------------------------------
1b1e : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1b2e : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1b3e : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
PalTimer:
4189 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
418b : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
419b : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s1001:
1afe : 60 __ __ RTS
--------------------------------------------------------------------
PalIndex:
41ab : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
41ad : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
41bd : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
41cd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
41ce : __ __ __ BYT 23 02 12 01 01 01 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
41de : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
BGPalShimmer:
4300 : __ __ __ BYT 23 02 12 01 01 11 55 05 dd 0d 88 08 44 04 11 01 : #.....U.....D...
4310 : __ __ __ BYT ff 0f dd 0d bb 0b 99 09 77 07 55 05 33 03 11 01 : ........w.U.3...
--------------------------------------------------------------------
Control:
.s0:
1b43 : a5 31 __ LDA P4 ; (Input + 0)
1b45 : c9 20 __ CMP #$20
1b47 : d0 1c __ BNE $1b65 ; (Control.s1007 + 0)
.s1:
1b49 : a5 30 __ LDA P3 ; (playing + 0)
1b4b : d0 0a __ BNE $1b57 ; (Control.s4 + 0)
.s5:
1b4d : a9 01 __ LDA #$01
1b4f : 20 03 1c JSR $1c03 ; (zsm_irq_play.s0 + 0)
1b52 : a9 01 __ LDA #$01
.s1001:
1b54 : 85 3b __ STA ACCU + 0 
1b56 : 60 __ __ RTS
.s4:
1b57 : a9 00 __ LDA #$00
1b59 : cd ee 41 CMP $41ee ; (paused + 0)
1b5c : 2a __ __ ROL
1b5d : 85 2f __ STA P2 
1b5f : 8d ee 41 STA $41ee ; (paused + 0)
1b62 : 20 6a 1b JSR $1b6a ; (zsm_pause.s0 + 0)
.s1007:
1b65 : a5 30 __ LDA P3 ; (playing + 0)
1b67 : 4c 54 1b JMP $1b54 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
41ee : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1b6a : a5 2f __ LDA P2 ; (pause + 0)
1b6c : d0 0e __ BNE $1b7c ; (zsm_pause.s4 + 0)
.s8:
1b6e : ad 02 1d LDA $1d02 ; (zsm_paused + 0)
1b71 : f0 08 __ BEQ $1b7b ; (zsm_pause.s1001 + 0)
.s5:
1b73 : 20 d6 1b JSR $1bd6 ; (zsm_restore_volume.s0 + 0)
1b76 : a9 00 __ LDA #$00
1b78 : 8d 02 1d STA $1d02 ; (zsm_paused + 0)
.s1001:
1b7b : 60 __ __ RTS
.s4:
1b7c : ad 02 1d LDA $1d02 ; (zsm_paused + 0)
1b7f : d0 fa __ BNE $1b7b ; (zsm_pause.s1001 + 0)
.s1:
1b81 : a9 01 __ LDA #$01
1b83 : 8d 02 1d STA $1d02 ; (zsm_paused + 0)
1b86 : 20 8c 1b JSR $1b8c ; (zsm_silence.s0 + 0)
1b89 : 4c a4 1b JMP $1ba4 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_silence:
.s0:
1b8c : a9 00 __ LDA #$00
1b8e : 85 47 __ STA T0 + 0 
1b90 : a9 08 __ LDA #$08
1b92 : 85 2d __ STA P0 
1b94 : a9 00 __ LDA #$00
.l1006:
1b96 : 85 2e __ STA P1 
1b98 : 20 80 0c JSR $0c80 ; (sfx_put.l1 + 0)
1b9b : e6 47 __ INC T0 + 0 
1b9d : a5 47 __ LDA T0 + 0 
1b9f : c9 08 __ CMP #$08
1ba1 : 90 f3 __ BCC $1b96 ; (zsm_silence.l1006 + 0)
.s1001:
1ba3 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1ba4 : a0 00 __ LDY #$00
1ba6 : 84 3c __ STY ACCU + 1 
1ba8 : a2 02 __ LDX #$02
1baa : 18 __ __ CLC
.l1006:
1bab : 8a __ __ TXA
1bac : 09 c0 __ ORA #$c0
1bae : 8d 20 9f STA $9f20 
1bb1 : a5 3c __ LDA ACCU + 1 
1bb3 : 09 f9 __ ORA #$f9
1bb5 : 8d 21 9f STA $9f21 
1bb8 : a9 01 __ LDA #$01
1bba : 8d 22 9f STA $9f22 
1bbd : ad 23 9f LDA $9f23 
1bc0 : 99 6b 47 STA $476b,y ; (vera_volumes + 0)
1bc3 : a9 00 __ LDA #$00
1bc5 : 8d 23 9f STA $9f23 
1bc8 : 8a __ __ TXA
1bc9 : 69 04 __ ADC #$04
1bcb : aa __ __ TAX
1bcc : 90 02 __ BCC $1bd0 ; (zsm_save_volume.s1009 + 0)
.s1008:
1bce : e6 3c __ INC ACCU + 1 
.s1009:
1bd0 : c8 __ __ INY
1bd1 : c0 10 __ CPY #$10
1bd3 : 90 d6 __ BCC $1bab ; (zsm_save_volume.l1006 + 0)
.s1001:
1bd5 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
476b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1bd6 : a0 00 __ LDY #$00
1bd8 : 84 3c __ STY ACCU + 1 
1bda : a2 02 __ LDX #$02
1bdc : 18 __ __ CLC
.l1006:
1bdd : 8a __ __ TXA
1bde : 09 c0 __ ORA #$c0
1be0 : 8d 20 9f STA $9f20 
1be3 : a5 3c __ LDA ACCU + 1 
1be5 : 09 f9 __ ORA #$f9
1be7 : 8d 21 9f STA $9f21 
1bea : a9 01 __ LDA #$01
1bec : 8d 22 9f STA $9f22 
1bef : b9 6b 47 LDA $476b,y ; (vera_volumes + 0)
1bf2 : 8d 23 9f STA $9f23 
1bf5 : 8a __ __ TXA
1bf6 : 69 04 __ ADC #$04
1bf8 : aa __ __ TAX
1bf9 : 90 02 __ BCC $1bfd ; (zsm_restore_volume.s1009 + 0)
.s1008:
1bfb : e6 3c __ INC ACCU + 1 
.s1009:
1bfd : c8 __ __ INY
1bfe : c0 10 __ CPY #$10
1c00 : 90 db __ BCC $1bdd ; (zsm_restore_volume.l1006 + 0)
.s1001:
1c02 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1c03 : 8d 00 1d STA $1d00 ; (zsm_playing + 0)
.s1001:
1c06 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4320 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
4330 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
4340 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 20 4d 41 52 4b 2d : MBA TOBACH MARK-
4350 : __ __ __ BYT 42 55 47 2d 53 4c 41 59 45 52 00                : BUG-SLAYER.
--------------------------------------------------------------------
off1:
41ef : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
frame_wait:
.l1:
1c07 : ad 26 9f LDA $9f26 
1c0a : 29 40 __ AND #$40
1c0c : d0 f9 __ BNE $1c07 ; (frame_wait.l1 + 0)
.l4:
1c0e : ad 26 9f LDA $9f26 
1c11 : 29 40 __ AND #$40
1c13 : f0 f9 __ BEQ $1c0e ; (frame_wait.l4 + 0)
.s1001:
1c15 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1c16 : 38 __ __ SEC
1c17 : a9 00 __ LDA #$00
1c19 : e5 3b __ SBC ACCU + 0 
1c1b : 85 3b __ STA ACCU + 0 
1c1d : a9 00 __ LDA #$00
1c1f : e5 3c __ SBC ACCU + 1 
1c21 : 85 3c __ STA ACCU + 1 
1c23 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1c24 : 38 __ __ SEC
1c25 : a9 00 __ LDA #$00
1c27 : e5 23 __ SBC WORK + 0 
1c29 : 85 23 __ STA WORK + 0 
1c2b : a9 00 __ LDA #$00
1c2d : e5 24 __ SBC WORK + 1 
1c2f : 85 24 __ STA WORK + 1 
1c31 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1c32 : a5 3c __ LDA ACCU + 1 
1c34 : d0 31 __ BNE $1c67 ; (divmod + 53)
1c36 : a5 24 __ LDA WORK + 1 
1c38 : d0 1e __ BNE $1c58 ; (divmod + 38)
1c3a : 85 26 __ STA WORK + 3 
1c3c : a2 04 __ LDX #$04
1c3e : 06 3b __ ASL ACCU + 0 
1c40 : 2a __ __ ROL
1c41 : c5 23 __ CMP WORK + 0 
1c43 : 90 02 __ BCC $1c47 ; (divmod + 21)
1c45 : e5 23 __ SBC WORK + 0 
1c47 : 26 3b __ ROL ACCU + 0 
1c49 : 2a __ __ ROL
1c4a : c5 23 __ CMP WORK + 0 
1c4c : 90 02 __ BCC $1c50 ; (divmod + 30)
1c4e : e5 23 __ SBC WORK + 0 
1c50 : 26 3b __ ROL ACCU + 0 
1c52 : ca __ __ DEX
1c53 : d0 eb __ BNE $1c40 ; (divmod + 14)
1c55 : 85 25 __ STA WORK + 2 
1c57 : 60 __ __ RTS
1c58 : a5 3b __ LDA ACCU + 0 
1c5a : 85 25 __ STA WORK + 2 
1c5c : a5 3c __ LDA ACCU + 1 
1c5e : 85 26 __ STA WORK + 3 
1c60 : a9 00 __ LDA #$00
1c62 : 85 3b __ STA ACCU + 0 
1c64 : 85 3c __ STA ACCU + 1 
1c66 : 60 __ __ RTS
1c67 : a5 24 __ LDA WORK + 1 
1c69 : d0 1f __ BNE $1c8a ; (divmod + 88)
1c6b : a5 23 __ LDA WORK + 0 
1c6d : 30 1b __ BMI $1c8a ; (divmod + 88)
1c6f : a9 00 __ LDA #$00
1c71 : 85 26 __ STA WORK + 3 
1c73 : a2 10 __ LDX #$10
1c75 : 06 3b __ ASL ACCU + 0 
1c77 : 26 3c __ ROL ACCU + 1 
1c79 : 2a __ __ ROL
1c7a : c5 23 __ CMP WORK + 0 
1c7c : 90 02 __ BCC $1c80 ; (divmod + 78)
1c7e : e5 23 __ SBC WORK + 0 
1c80 : 26 3b __ ROL ACCU + 0 
1c82 : 26 3c __ ROL ACCU + 1 
1c84 : ca __ __ DEX
1c85 : d0 f2 __ BNE $1c79 ; (divmod + 71)
1c87 : 85 25 __ STA WORK + 2 
1c89 : 60 __ __ RTS
1c8a : a9 00 __ LDA #$00
1c8c : 85 25 __ STA WORK + 2 
1c8e : 85 26 __ STA WORK + 3 
1c90 : 84 22 __ STY $22 
1c92 : a0 10 __ LDY #$10
1c94 : 18 __ __ CLC
1c95 : 26 3b __ ROL ACCU + 0 
1c97 : 26 3c __ ROL ACCU + 1 
1c99 : 26 25 __ ROL WORK + 2 
1c9b : 26 26 __ ROL WORK + 3 
1c9d : 38 __ __ SEC
1c9e : a5 25 __ LDA WORK + 2 
1ca0 : e5 23 __ SBC WORK + 0 
1ca2 : aa __ __ TAX
1ca3 : a5 26 __ LDA WORK + 3 
1ca5 : e5 24 __ SBC WORK + 1 
1ca7 : 90 04 __ BCC $1cad ; (divmod + 123)
1ca9 : 86 25 __ STX WORK + 2 
1cab : 85 26 __ STA WORK + 3 
1cad : 88 __ __ DEY
1cae : d0 e5 __ BNE $1c95 ; (divmod + 99)
1cb0 : 26 3b __ ROL ACCU + 0 
1cb2 : 26 3c __ ROL ACCU + 1 
1cb4 : a4 22 __ LDY $22 
1cb6 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1cb7 : 24 3c __ BIT ACCU + 1 
1cb9 : 10 0d __ BPL $1cc8 ; (mods16 + 17)
1cbb : 20 16 1c JSR $1c16 ; (negaccu + 0)
1cbe : 24 24 __ BIT WORK + 1 
1cc0 : 10 0d __ BPL $1ccf ; (mods16 + 24)
1cc2 : 20 24 1c JSR $1c24 ; (negtmp + 0)
1cc5 : 4c 32 1c JMP $1c32 ; (divmod + 0)
1cc8 : 24 24 __ BIT WORK + 1 
1cca : 10 f9 __ BPL $1cc5 ; (mods16 + 14)
1ccc : 20 24 1c JSR $1c24 ; (negtmp + 0)
1ccf : 20 32 1c JSR $1c32 ; (divmod + 0)
1cd2 : 38 __ __ SEC
1cd3 : a9 00 __ LDA #$00
1cd5 : e5 25 __ SBC WORK + 2 
1cd7 : 85 25 __ STA WORK + 2 
1cd9 : a9 00 __ LDA #$00
1cdb : e5 26 __ SBC WORK + 3 
1cdd : 85 26 __ STA WORK + 3 
1cdf : 60 __ __ RTS
--------------------------------------------------------------------
__multab12L:
1ce0 : __ __ __ BYT 00 0c 18 24 30 3c 48 54 60 6c 78 84 90 9c a8 b4 : ...$0<HT`lx.....
--------------------------------------------------------------------
__multab3L:
1cf0 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 18 1b 1e 21 24 27 2a 2d : ...........!$'*-
