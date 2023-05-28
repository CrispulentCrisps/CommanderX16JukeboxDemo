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
080e : 8e ff 1b STX $1bff ; (spentry + 0)
0811 : a9 db __ LDA #$db
0813 : 85 39 __ STA IP + 0 
0815 : a9 4b __ LDA #$4b
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 50 __ LDA #$50
081c : e9 4b __ SBC #$4b
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
0830 : a9 10 __ LDA #$10
0832 : e9 db __ SBC #$db
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
1bff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 73 0b JSR $0b73 ; (zsm_irq_init.s0 + 0)
0883 : 20 47 0d JSR $0d47 ; (ClearVERAScreen.s0 + 0)
0886 : 20 8a 0d JSR $0d8a ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9f __ LDA #$9f
0893 : 8d 2a 9f STA $9f2a 
0896 : ad 25 9f LDA $9f25 
0899 : 29 fd __ AND #$fd
089b : 8d 25 9f STA $9f25 
089e : a9 73 __ LDA #$73
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
08ce : 85 50 __ STA T1 + 0 
08d0 : 85 51 __ STA T1 + 1 
08d2 : 85 52 __ STA T2 + 0 
08d4 : 85 53 __ STA T3 + 0 
.l3:
08d6 : 20 45 18 JSR $1845 ; (getchx.s0 + 0)
08d9 : a5 3b __ LDA ACCU + 0 
08db : 85 54 __ STA T4 + 0 
08dd : a9 30 __ LDA #$30
08df : 8d 2c 9f STA $9f2c 
08e2 : ee f9 23 INC $23f9 ; (p + 0)
08e5 : d0 03 __ BNE $08ea ; (main.s1019 + 0)
.s1018:
08e7 : ee fa 23 INC $23fa ; (p + 1)
.s1019:
08ea : ad fb 23 LDA $23fb ; (Phase + 0)
08ed : 18 __ __ CLC
08ee : 69 01 __ ADC #$01
08f0 : 85 32 __ STA P5 
08f2 : 8d fb 23 STA $23fb ; (Phase + 0)
08f5 : ad fc 23 LDA $23fc ; (Phase + 1)
08f8 : 69 00 __ ADC #$00
08fa : 85 33 __ STA P6 
08fc : 8d fc 23 STA $23fc ; (Phase + 1)
08ff : ad fd 23 LDA $23fd ; (Phase2 + 0)
0902 : 18 __ __ CLC
0903 : 69 01 __ ADC #$01
0905 : 85 34 __ STA P7 
0907 : 8d fd 23 STA $23fd ; (Phase2 + 0)
090a : ad fe 23 LDA $23fe ; (Phase2 + 1)
090d : 69 00 __ ADC #$00
090f : 85 35 __ STA P8 
0911 : 8d fe 23 STA $23fe ; (Phase2 + 1)
0914 : ad f8 42 LDA $42f8 ; (Phase3 + 0)
0917 : 18 __ __ CLC
0918 : 69 01 __ ADC #$01
091a : 85 36 __ STA P9 
091c : 8d f8 42 STA $42f8 ; (Phase3 + 0)
091f : ad f9 42 LDA $42f9 ; (Phase3 + 1)
0922 : 69 00 __ ADC #$00
0924 : 85 37 __ STA P10 
0926 : 8d f9 42 STA $42f9 ; (Phase3 + 1)
0929 : 20 80 18 JSR $1880 ; (MoveSprites.s0 + 0)
092c : a5 52 __ LDA T2 + 0 
092e : c9 01 __ CMP #$01
0930 : d0 03 __ BNE $0935 ; (main.s6 + 0)
0932 : 4c 5a 0b JMP $0b5a ; (main.s5 + 0)
.s6:
0935 : a9 20 __ LDA #$20
0937 : 85 37 __ STA P10 
0939 : a9 a0 __ LDA #$a0
093b : 8d fc 9e STA $9efc ; (sstack + 0)
093e : a9 fa __ LDA #$fa
0940 : 8d fd 9e STA $9efd ; (sstack + 1)
0943 : a9 01 __ LDA #$01
0945 : 8d fe 9e STA $9efe ; (sstack + 2)
0948 : a9 00 __ LDA #$00
094a : 8d ff 9e STA $9eff ; (sstack + 3)
094d : 8d fc 42 STA $42fc ; (PalTimer + 0)
0950 : 8d fd 42 STA $42fd ; (PalTimer + 1)
0953 : a9 00 __ LDA #$00
0955 : 85 35 __ STA P8 
0957 : a9 44 __ LDA #$44
0959 : 85 36 __ STA P9 
095b : 20 1e 18 JSR $181e ; (SetPaletteColours.s0 + 0)
.s48:
095e : e6 53 __ INC T3 + 0 
0960 : a9 02 __ LDA #$02
0962 : c5 53 __ CMP T3 + 0 
0964 : b0 2d __ BCS $0993 ; (main.s49 + 0)
.s8:
0966 : a9 10 __ LDA #$10
0968 : 85 34 __ STA P7 
096a : a9 00 __ LDA #$00
096c : 85 35 __ STA P8 
096e : 85 36 __ STA P9 
0970 : 85 37 __ STA P10 
0972 : a9 06 __ LDA #$06
0974 : 8d fc 9e STA $9efc ; (sstack + 0)
0977 : a9 00 __ LDA #$00
0979 : 8d fd 9e STA $9efd ; (sstack + 1)
097c : 8d ff 9e STA $9eff ; (sstack + 3)
097f : a9 0a __ LDA #$0a
0981 : 8d fe 9e STA $9efe ; (sstack + 2)
0984 : a9 98 __ LDA #$98
0986 : 85 32 __ STA P5 
0988 : a9 23 __ LDA #$23
098a : 85 33 __ STA P6 
098c : 20 25 1c JSR $1c25 ; (SetPaletteIndex.s0 + 0)
098f : a9 00 __ LDA #$00
0991 : 85 53 __ STA T3 + 0 
.s49:
0993 : ad fd 42 LDA $42fd ; (PalTimer + 1)
0996 : 30 5f __ BMI $09f7 ; (main.s50 + 0)
.s1013:
0998 : d0 07 __ BNE $09a1 ; (main.s11 + 0)
.s1012:
099a : a9 03 __ LDA #$03
099c : cd fc 42 CMP $42fc ; (PalTimer + 0)
099f : b0 56 __ BCS $09f7 ; (main.s50 + 0)
.s11:
09a1 : a9 60 __ LDA #$60
09a3 : 85 34 __ STA P7 
09a5 : a9 00 __ LDA #$00
09a7 : 85 35 __ STA P8 
09a9 : 85 36 __ STA P9 
09ab : 85 37 __ STA P10 
09ad : 8d fc 9e STA $9efc ; (sstack + 0)
09b0 : 8d fd 9e STA $9efd ; (sstack + 1)
09b3 : a9 05 __ LDA #$05
09b5 : 8d fe 9e STA $9efe ; (sstack + 2)
09b8 : a9 00 __ LDA #$00
09ba : 8d ff 9e STA $9eff ; (sstack + 3)
09bd : ee fe 42 INC $42fe ; (PalIndex + 0)
09c0 : d0 03 __ BNE $09c5 ; (main.s1023 + 0)
.s1022:
09c2 : ee ff 42 INC $42ff ; (PalIndex + 1)
.s1023:
09c5 : a9 c0 __ LDA #$c0
09c7 : 85 32 __ STA P5 
09c9 : a9 3e __ LDA #$3e
09cb : 85 33 __ STA P6 
09cd : 20 25 1c JSR $1c25 ; (SetPaletteIndex.s0 + 0)
09d0 : a9 50 __ LDA #$50
09d2 : 85 34 __ STA P7 
09d4 : a9 00 __ LDA #$00
09d6 : 8d fc 9e STA $9efc ; (sstack + 0)
09d9 : 8d fd 9e STA $9efd ; (sstack + 1)
09dc : 8d ff 9e STA $9eff ; (sstack + 3)
09df : a9 10 __ LDA #$10
09e1 : 8d fe 9e STA $9efe ; (sstack + 2)
09e4 : a9 20 __ LDA #$20
09e6 : 85 32 __ STA P5 
09e8 : a9 44 __ LDA #$44
09ea : 85 33 __ STA P6 
09ec : 20 25 1c JSR $1c25 ; (SetPaletteIndex.s0 + 0)
09ef : a9 00 __ LDA #$00
09f1 : 8d fc 42 STA $42fc ; (PalTimer + 0)
09f4 : 8d fd 42 STA $42fd ; (PalTimer + 1)
.s50:
09f7 : ad fa 23 LDA $23fa ; (p + 1)
09fa : d0 42 __ BNE $0a3e ; (main.s16 + 0)
.s1011:
09fc : ad f9 23 LDA $23f9 ; (p + 0)
09ff : c9 03 __ CMP #$03
0a01 : d0 3b __ BNE $0a3e ; (main.s16 + 0)
.s14:
0a03 : a9 20 __ LDA #$20
0a05 : 85 37 __ STA P10 
0a07 : a9 00 __ LDA #$00
0a09 : 8d fc 9e STA $9efc ; (sstack + 0)
0a0c : 8d ff 9e STA $9eff ; (sstack + 3)
0a0f : a9 fa __ LDA #$fa
0a11 : 8d fd 9e STA $9efd ; (sstack + 1)
0a14 : a9 01 __ LDA #$01
0a16 : 8d fe 9e STA $9efe ; (sstack + 2)
0a19 : a9 00 __ LDA #$00
0a1b : cd 40 44 CMP $4440 ; (ShimmerState + 0)
0a1e : 2a __ __ ROL
0a1f : 8d 40 44 STA $4440 ; (ShimmerState + 0)
0a22 : d0 07 __ BNE $0a2b ; (main.s17 + 0)
.s18:
0a24 : a9 44 __ LDA #$44
0a26 : a2 61 __ LDX #$61
0a28 : 4c 2f 0a JMP $0a2f ; (main.s60 + 0)
.s17:
0a2b : a9 44 __ LDA #$44
0a2d : a2 41 __ LDX #$41
.s60:
0a2f : 86 35 __ STX P8 
0a31 : 85 36 __ STA P9 
0a33 : 20 1e 18 JSR $181e ; (SetPaletteColours.s0 + 0)
0a36 : a9 00 __ LDA #$00
0a38 : 8d f9 23 STA $23f9 ; (p + 0)
0a3b : 8d fa 23 STA $23fa ; (p + 1)
.s16:
0a3e : a5 52 __ LDA T2 + 0 
0a40 : 85 30 __ STA P3 
0a42 : a9 03 __ LDA #$03
0a44 : 8d 2c 9f STA $9f2c 
0a47 : a5 54 __ LDA T4 + 0 
0a49 : 85 31 __ STA P4 
0a4b : c9 44 __ CMP #$44
0a4d : d0 13 __ BNE $0a62 ; (main.s21 + 0)
.s20:
0a4f : a9 00 __ LDA #$00
0a51 : 8d 81 44 STA $4481 ; (off1 + 0)
0a54 : 18 __ __ CLC
0a55 : a5 50 __ LDA T1 + 0 
0a57 : 69 01 __ ADC #$01
0a59 : 85 50 __ STA T1 + 0 
0a5b : a5 51 __ LDA T1 + 1 
0a5d : 69 00 __ ADC #$00
0a5f : 4c 7e 0a JMP $0a7e ; (main.s1017 + 0)
.s21:
0a62 : c9 41 __ CMP #$41
0a64 : d0 1a __ BNE $0a80 ; (main.s22 + 0)
.s26:
0a66 : a5 51 __ LDA T1 + 1 
0a68 : 30 16 __ BMI $0a80 ; (main.s22 + 0)
.s1003:
0a6a : 05 50 __ ORA T1 + 0 
0a6c : f0 12 __ BEQ $0a80 ; (main.s22 + 0)
.s23:
0a6e : a9 00 __ LDA #$00
0a70 : 8d 81 44 STA $4481 ; (off1 + 0)
0a73 : 18 __ __ CLC
0a74 : a5 50 __ LDA T1 + 0 
0a76 : 69 ff __ ADC #$ff
0a78 : 85 50 __ STA T1 + 0 
0a7a : a5 51 __ LDA T1 + 1 
0a7c : 69 ff __ ADC #$ff
.s1017:
0a7e : 85 51 __ STA T1 + 1 
.s22:
0a80 : 20 d8 1c JSR $1cd8 ; (Control.s0 + 0)
0a83 : a5 3b __ LDA ACCU + 0 
0a85 : 85 52 __ STA T2 + 0 
0a87 : ad fa 42 LDA $42fa ; (FrameCount + 0)
0a8a : 85 3b __ STA ACCU + 0 
0a8c : ad fb 42 LDA $42fb ; (FrameCount + 1)
0a8f : 85 3c __ STA ACCU + 1 
0a91 : a9 08 __ LDA #$08
0a93 : 85 23 __ STA WORK + 0 
0a95 : a9 00 __ LDA #$00
0a97 : 85 24 __ STA WORK + 1 
0a99 : 20 2a 1e JSR $1e2a ; (mods16 + 0)
0a9c : a5 26 __ LDA WORK + 3 
0a9e : f0 03 __ BEQ $0aa3 ; (main.s1002 + 0)
0aa0 : 4c 2b 0b JMP $0b2b ; (main.s29 + 0)
.s1002:
0aa3 : a5 25 __ LDA WORK + 2 
0aa5 : c9 01 __ CMP #$01
0aa7 : f0 03 __ BEQ $0aac ; (main.s27 + 0)
0aa9 : 4c 2b 0b JMP $0b2b ; (main.s29 + 0)
.s27:
0aac : a9 90 __ LDA #$90
0aae : 85 34 __ STA P7 
0ab0 : a9 00 __ LDA #$00
0ab2 : 85 35 __ STA P8 
0ab4 : 85 36 __ STA P9 
0ab6 : 85 37 __ STA P10 
0ab8 : 8d fc 9e STA $9efc ; (sstack + 0)
0abb : 8d fd 9e STA $9efd ; (sstack + 1)
0abe : a9 10 __ LDA #$10
0ac0 : 8d fe 9e STA $9efe ; (sstack + 2)
0ac3 : a9 00 __ LDA #$00
0ac5 : 8d ff 9e STA $9eff ; (sstack + 3)
0ac8 : ad 25 9f LDA $9f25 
0acb : 29 fe __ AND #$fe
0acd : 8d 25 9f STA $9f25 
0ad0 : ad 81 44 LDA $4481 ; (off1 + 0)
0ad3 : 29 7f __ AND #$7f
0ad5 : 0a __ __ ASL
0ad6 : 8d 20 9f STA $9f20 
0ad9 : a9 b0 __ LDA #$b0
0adb : 8d 21 9f STA $9f21 
0ade : a9 11 __ LDA #$11
0ae0 : 8d 22 9f STA $9f22 
0ae3 : a9 d8 __ LDA #$d8
0ae5 : 85 32 __ STA P5 
0ae7 : a9 3e __ LDA #$3e
0ae9 : 85 33 __ STA P6 
0aeb : a5 50 __ LDA T1 + 0 
0aed : 05 51 __ ORA T1 + 1 
0aef : d0 34 __ BNE $0b25 ; (main.s31 + 0)
.s32:
0af1 : ad 81 44 LDA $4481 ; (off1 + 0)
0af4 : 85 3b __ STA ACCU + 0 
0af6 : a9 00 __ LDA #$00
0af8 : 85 3c __ STA ACCU + 1 
0afa : a9 57 __ LDA #$57
0afc : 85 23 __ STA WORK + 0 
0afe : a9 07 __ LDA #$07
0b00 : 85 24 __ STA WORK + 1 
0b02 : 20 a5 1d JSR $1da5 ; (divmod + 0)
0b05 : 18 __ __ CLC
0b06 : a9 83 __ LDA #$83
0b08 : 65 25 __ ADC WORK + 2 
0b0a : 85 47 __ STA T5 + 0 
0b0c : a9 44 __ LDA #$44
0b0e : 65 26 __ ADC WORK + 3 
0b10 : 85 48 __ STA T5 + 1 
0b12 : a0 00 __ LDY #$00
0b14 : b1 47 __ LDA (T5 + 0),y 
0b16 : f0 0d __ BEQ $0b25 ; (main.s31 + 0)
.s33:
0b18 : 8d 23 9f STA $9f23 
0b1b : ad 81 44 LDA $4481 ; (off1 + 0)
0b1e : 29 0f __ AND #$0f
0b20 : 09 90 __ ORA #$90
0b22 : 8d 23 9f STA $9f23 
.s31:
0b25 : ee 81 44 INC $4481 ; (off1 + 0)
0b28 : 20 25 1c JSR $1c25 ; (SetPaletteIndex.s0 + 0)
.s29:
0b2b : ad fa 42 LDA $42fa ; (FrameCount + 0)
0b2e : 38 __ __ SEC
0b2f : e9 80 __ SBC #$80
0b31 : 8d 37 9f STA $9f37 
0b34 : ad fb 42 LDA $42fb ; (FrameCount + 1)
0b37 : e9 02 __ SBC #$02
0b39 : 8d 38 9f STA $9f38 
0b3c : a9 01 __ LDA #$01
0b3e : 8d 2c 9f STA $9f2c 
0b41 : 20 f1 1a JSR $1af1 ; (zsm_fill.s0 + 0)
0b44 : a9 00 __ LDA #$00
0b46 : 8d 2c 9f STA $9f2c 
0b49 : 20 7a 1d JSR $1d7a ; (frame_wait.l1 + 0)
0b4c : ee fa 42 INC $42fa ; (FrameCount + 0)
0b4f : f0 03 __ BEQ $0b54 ; (main.s1024 + 0)
0b51 : 4c d6 08 JMP $08d6 ; (main.l3 + 0)
.s1024:
0b54 : ee fb 42 INC $42fb ; (FrameCount + 1)
0b57 : 4c d6 08 JMP $08d6 ; (main.l3 + 0)
.s5:
0b5a : a5 50 __ LDA T1 + 0 
0b5c : 85 32 __ STA P5 
0b5e : a5 51 __ LDA T1 + 1 
0b60 : 85 33 __ STA P6 
0b62 : 20 1f 1a JSR $1a1f ; (PlayZSM.s0 + 0)
0b65 : ee fc 42 INC $42fc ; (PalTimer + 0)
0b68 : f0 03 __ BEQ $0b6d ; (main.s1020 + 0)
0b6a : 4c 5e 09 JMP $095e ; (main.s48 + 0)
.s1020:
0b6d : ee fd 42 INC $42fd ; (PalTimer + 1)
0b70 : 4c 5e 09 JMP $095e ; (main.s48 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0b73 : 78 __ __ SEI
0b74 : ad 14 03 LDA $0314 
0b77 : 8d db 4b STA $4bdb ; (oirq + 0)
0b7a : ad 15 03 LDA $0315 
0b7d : 8d dc 4b STA $4bdc ; (oirq + 1)
0b80 : a9 8c __ LDA #$8c
0b82 : 8d 14 03 STA $0314 
0b85 : a9 0b __ LDA #$0b
0b87 : 8d 15 03 STA $0315 
0b8a : 58 __ __ CLI
.s1001:
0b8b : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
4bdb : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0b8c : 20 92 0b JSR $0b92 ; (irq.s1000 + 0)
0b8f : 6c db 4b JMP ($4bdb)
--------------------------------------------------------------------
irq:
.s1000:
0b92 : a5 2d __ LDA P0 
0b94 : 48 __ __ PHA
0b95 : a5 2e __ LDA P1 
0b97 : 48 __ __ PHA
0b98 : a5 3b __ LDA ACCU + 0 
0b9a : 48 __ __ PHA
0b9b : a5 3c __ LDA ACCU + 1 
0b9d : 48 __ __ PHA
0b9e : a5 47 __ LDA T0 + 0 
0ba0 : 48 __ __ PHA
0ba1 : a5 48 __ LDA $48 
0ba3 : 48 __ __ PHA
0ba4 : a5 49 __ LDA $49 
0ba6 : 48 __ __ PHA
0ba7 : a5 4a __ LDA $4a 
0ba9 : 48 __ __ PHA
0baa : a5 4b __ LDA $4b 
0bac : 48 __ __ PHA
0bad : a5 4c __ LDA $4c 
0baf : 48 __ __ PHA
0bb0 : a5 4d __ LDA $4d 
0bb2 : 48 __ __ PHA
0bb3 : a5 4e __ LDA $4e 
0bb5 : 48 __ __ PHA
0bb6 : a5 4f __ LDA $4f 
0bb8 : 48 __ __ PHA
0bb9 : a5 50 __ LDA $50 
0bbb : 48 __ __ PHA
.s0:
0bbc : ad 53 1e LDA $1e53 ; (zsm_playing + 0)
0bbf : f0 08 __ BEQ $0bc9 ; (irq.s1001 + 0)
.s4:
0bc1 : ad 54 1e LDA $1e54 ; (zsm_finished + 0)
0bc4 : d0 03 __ BNE $0bc9 ; (irq.s1001 + 0)
.s1:
0bc6 : 20 f4 0b JSR $0bf4 ; (zsm_play.s0 + 0)
.s1001:
0bc9 : 68 __ __ PLA
0bca : 85 50 __ STA $50 
0bcc : 68 __ __ PLA
0bcd : 85 4f __ STA $4f 
0bcf : 68 __ __ PLA
0bd0 : 85 4e __ STA $4e 
0bd2 : 68 __ __ PLA
0bd3 : 85 4d __ STA $4d 
0bd5 : 68 __ __ PLA
0bd6 : 85 4c __ STA $4c 
0bd8 : 68 __ __ PLA
0bd9 : 85 4b __ STA $4b 
0bdb : 68 __ __ PLA
0bdc : 85 4a __ STA $4a 
0bde : 68 __ __ PLA
0bdf : 85 49 __ STA $49 
0be1 : 68 __ __ PLA
0be2 : 85 48 __ STA $48 
0be4 : 68 __ __ PLA
0be5 : 85 47 __ STA T0 + 0 
0be7 : 68 __ __ PLA
0be8 : 85 3c __ STA ACCU + 1 
0bea : 68 __ __ PLA
0beb : 85 3b __ STA ACCU + 0 
0bed : 68 __ __ PLA
0bee : 85 2e __ STA P1 
0bf0 : 68 __ __ PLA
0bf1 : 85 2d __ STA P0 
0bf3 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1e53 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1e54 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0bf4 : ad 55 1e LDA $1e55 ; (zsm_paused + 0)
0bf7 : f0 01 __ BEQ $0bfa ; (zsm_play.s2 + 0)
0bf9 : 60 __ __ RTS
.s2:
0bfa : ad dd 4b LDA $4bdd ; (zsm_delay + 0)
0bfd : f0 03 __ BEQ $0c02 ; (zsm_play.s5 + 0)
0bff : 4c 2f 0d JMP $0d2f ; (zsm_play.s4 + 0)
.s5:
0c02 : ad 25 9f LDA $9f25 
0c05 : 85 47 __ STA T0 + 0 
0c07 : ad 25 9f LDA $9f25 
0c0a : 29 fe __ AND #$fe
0c0c : 8d 25 9f STA $9f25 
0c0f : ad 20 9f LDA $9f20 
0c12 : 85 49 __ STA T2 + 0 
0c14 : ad 21 9f LDA $9f21 
0c17 : 85 4a __ STA T2 + 1 
0c19 : ad 22 9f LDA $9f22 
0c1c : 85 48 __ STA T1 + 0 
.l8:
0c1e : ad de 4f LDA $4fde ; (zsm_pos + 0)
0c21 : 85 4b __ STA T3 + 0 
0c23 : 18 __ __ CLC
0c24 : 69 01 __ ADC #$01
0c26 : 85 4d __ STA T4 + 0 
0c28 : 8d de 4f STA $4fde ; (zsm_pos + 0)
0c2b : ad df 4f LDA $4fdf ; (zsm_pos + 1)
0c2e : aa __ __ TAX
0c2f : 69 00 __ ADC #$00
0c31 : 85 4e __ STA T4 + 1 
0c33 : 8d df 4f STA $4fdf ; (zsm_pos + 1)
0c36 : 18 __ __ CLC
0c37 : a9 de __ LDA #$de
0c39 : 65 4b __ ADC T3 + 0 
0c3b : 85 3b __ STA ACCU + 0 
0c3d : 8a __ __ TXA
0c3e : 29 03 __ AND #$03
0c40 : 69 4b __ ADC #$4b
0c42 : 85 3c __ STA ACCU + 1 
0c44 : a0 00 __ LDY #$00
0c46 : b1 3b __ LDA (ACCU + 0),y 
0c48 : c9 40 __ CMP #$40
0c4a : b0 03 __ BCS $0c4f ; (zsm_play.s12 + 0)
0c4c : 4c fa 0c JMP $0cfa ; (zsm_play.s11 + 0)
.s12:
0c4f : d0 22 __ BNE $0c73 ; (zsm_play.s15 + 0)
.s14:
0c51 : 18 __ __ CLC
0c52 : a9 de __ LDA #$de
0c54 : 65 4d __ ADC T4 + 0 
0c56 : 85 4b __ STA T3 + 0 
0c58 : a5 4e __ LDA T4 + 1 
0c5a : 29 03 __ AND #$03
0c5c : 69 4b __ ADC #$4b
0c5e : 85 4c __ STA T3 + 1 
0c60 : b1 4b __ LDA (T3 + 0),y 
0c62 : 29 3f __ AND #$3f
0c64 : 18 __ __ CLC
0c65 : 65 4d __ ADC T4 + 0 
0c67 : 8d de 4f STA $4fde ; (zsm_pos + 0)
0c6a : 98 __ __ TYA
0c6b : 65 4e __ ADC T4 + 1 
0c6d : 8d df 4f STA $4fdf ; (zsm_pos + 1)
0c70 : 4c 1e 0c JMP $0c1e ; (zsm_play.l8 + 0)
.s15:
0c73 : 09 00 __ ORA #$00
0c75 : 30 5b __ BMI $0cd2 ; (zsm_play.s18 + 0)
.s17:
0c77 : 29 3f __ AND #$3f
0c79 : f0 a3 __ BEQ $0c1e ; (zsm_play.l8 + 0)
.s29:
0c7b : 84 50 __ STY T7 + 0 
0c7d : 85 4f __ STA T6 + 0 
0c7f : 18 __ __ CLC
.l1012:
0c80 : a9 de __ LDA #$de
0c82 : 6d de 4f ADC $4fde ; (zsm_pos + 0)
0c85 : 85 4d __ STA T4 + 0 
0c87 : ad df 4f LDA $4fdf ; (zsm_pos + 1)
0c8a : 29 03 __ AND #$03
0c8c : 69 4b __ ADC #$4b
0c8e : 85 4e __ STA T4 + 1 
0c90 : a0 00 __ LDY #$00
0c92 : b1 4d __ LDA (T4 + 0),y 
0c94 : 85 2d __ STA P0 
0c96 : ad de 4f LDA $4fde ; (zsm_pos + 0)
0c99 : 18 __ __ CLC
0c9a : 69 01 __ ADC #$01
0c9c : aa __ __ TAX
0c9d : ad df 4f LDA $4fdf ; (zsm_pos + 1)
0ca0 : 69 00 __ ADC #$00
0ca2 : 29 03 __ AND #$03
0ca4 : 85 4c __ STA T3 + 1 
0ca6 : 8a __ __ TXA
0ca7 : 18 __ __ CLC
0ca8 : 69 de __ ADC #$de
0caa : 85 4b __ STA T3 + 0 
0cac : a9 4b __ LDA #$4b
0cae : 65 4c __ ADC T3 + 1 
0cb0 : 85 4c __ STA T3 + 1 
0cb2 : b1 4b __ LDA (T3 + 0),y 
0cb4 : 85 2e __ STA P1 
0cb6 : 20 33 0d JSR $0d33 ; (sfx_put.l1 + 0)
0cb9 : ad de 4f LDA $4fde ; (zsm_pos + 0)
0cbc : 18 __ __ CLC
0cbd : 69 02 __ ADC #$02
0cbf : 8d de 4f STA $4fde ; (zsm_pos + 0)
0cc2 : 90 03 __ BCC $0cc7 ; (zsm_play.s1015 + 0)
.s1014:
0cc4 : ee df 4f INC $4fdf ; (zsm_pos + 1)
.s1015:
0cc7 : e6 50 __ INC T7 + 0 
0cc9 : a5 50 __ LDA T7 + 0 
0ccb : c5 4f __ CMP T6 + 0 
0ccd : 90 b1 __ BCC $0c80 ; (zsm_play.l1012 + 0)
0ccf : 4c 1e 0c JMP $0c1e ; (zsm_play.l8 + 0)
.s18:
0cd2 : c9 80 __ CMP #$80
0cd4 : d0 07 __ BNE $0cdd ; (zsm_play.s25 + 0)
.s24:
0cd6 : a9 01 __ LDA #$01
0cd8 : 8d 54 1e STA $1e54 ; (zsm_finished + 0)
0cdb : d0 08 __ BNE $0ce5 ; (zsm_play.s10 + 0)
.s25:
0cdd : 29 7f __ AND #$7f
0cdf : 38 __ __ SEC
0ce0 : e9 01 __ SBC #$01
0ce2 : 8d dd 4b STA $4bdd ; (zsm_delay + 0)
.s10:
0ce5 : a5 49 __ LDA T2 + 0 
0ce7 : 8d 20 9f STA $9f20 
0cea : a5 4a __ LDA T2 + 1 
0cec : 8d 21 9f STA $9f21 
0cef : a5 48 __ LDA T1 + 0 
0cf1 : 8d 22 9f STA $9f22 
0cf4 : a5 47 __ LDA T0 + 0 
0cf6 : 8d 25 9f STA $9f25 
.s1001:
0cf9 : 60 __ __ RTS
.s11:
0cfa : 29 3f __ AND #$3f
0cfc : 09 c0 __ ORA #$c0
0cfe : 8d 20 9f STA $9f20 
0d01 : a9 f9 __ LDA #$f9
0d03 : 8d 21 9f STA $9f21 
0d06 : a9 01 __ LDA #$01
0d08 : 8d 22 9f STA $9f22 
0d0b : a5 4b __ LDA T3 + 0 
0d0d : 69 02 __ ADC #$02
0d0f : 8d de 4f STA $4fde ; (zsm_pos + 0)
0d12 : 90 01 __ BCC $0d15 ; (zsm_play.s1017 + 0)
.s1016:
0d14 : e8 __ __ INX
.s1017:
0d15 : 8e df 4f STX $4fdf ; (zsm_pos + 1)
0d18 : 18 __ __ CLC
0d19 : a9 de __ LDA #$de
0d1b : 65 4d __ ADC T4 + 0 
0d1d : 85 4b __ STA T3 + 0 
0d1f : a5 4e __ LDA T4 + 1 
0d21 : 29 03 __ AND #$03
0d23 : 69 4b __ ADC #$4b
0d25 : 85 4c __ STA T3 + 1 
0d27 : b1 4b __ LDA (T3 + 0),y 
0d29 : 8d 23 9f STA $9f23 
0d2c : 4c 1e 0c JMP $0c1e ; (zsm_play.l8 + 0)
.s4:
0d2f : ce dd 4b DEC $4bdd ; (zsm_delay + 0)
0d32 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1e55 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
4bdd : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
4bde : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
4fde : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0d33 : ad 41 9f LDA $9f41 
0d36 : 30 fb __ BMI $0d33 ; (sfx_put.l1 + 0)
.s3:
0d38 : a5 2d __ LDA P0 ; (index + 0)
0d3a : 8d 40 9f STA $9f40 
0d3d : ea __ __ NOP
0d3e : ea __ __ NOP
0d3f : ea __ __ NOP
0d40 : ea __ __ NOP
0d41 : a5 2e __ LDA P1 ; (data + 0)
0d43 : 8d 41 9f STA $9f41 
.s1001:
0d46 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0d47 : a9 93 __ LDA #$93
0d49 : 85 2d __ STA P0 
0d4b : a9 00 __ LDA #$00
0d4d : 85 2e __ STA P1 
0d4f : 20 84 0d JSR $0d84 ; (putch.s0 + 0)
0d52 : a9 11 __ LDA #$11
0d54 : 8d 22 9f STA $9f22 
0d57 : a2 00 __ LDX #$00
.l2:
0d59 : 8a __ __ TXA
0d5a : 18 __ __ CLC
0d5b : 69 b0 __ ADC #$b0
0d5d : 8d 21 9f STA $9f21 
0d60 : a9 00 __ LDA #$00
0d62 : 8d 20 9f STA $9f20 
0d65 : a0 80 __ LDY #$80
.l1003:
0d67 : a9 20 __ LDA #$20
0d69 : 8d 23 9f STA $9f23 
0d6c : a9 01 __ LDA #$01
0d6e : 8d 23 9f STA $9f23 
0d71 : a9 20 __ LDA #$20
0d73 : 8d 24 9f STA $9f24 
0d76 : a9 01 __ LDA #$01
0d78 : 8d 24 9f STA $9f24 
0d7b : 88 __ __ DEY
0d7c : d0 e9 __ BNE $0d67 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0d7e : e8 __ __ INX
0d7f : e0 40 __ CPX #$40
0d81 : 90 d6 __ BCC $0d59 ; (ClearVERAScreen.l2 + 0)
.s1001:
0d83 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0d84 : a5 2d __ LDA P0 
0d86 : 20 d2 ff JSR $ffd2 
.s1001:
0d89 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0d8a : a9 00 __ LDA #$00
0d8c : 85 2d __ STA P0 
0d8e : 85 2e __ STA P1 
0d90 : 85 2f __ STA P2 
0d92 : 85 30 __ STA P3 
0d94 : 85 31 __ STA P4 
0d96 : 8d 25 9f STA $9f25 
0d99 : ad 29 9f LDA $9f29 
0d9c : 09 70 __ ORA #$70
0d9e : 8d 29 9f STA $9f29 
0da1 : a9 80 __ LDA #$80
0da3 : 8d 2b 9f STA $9f2b 
0da6 : 8d 2a 9f STA $9f2a 
0da9 : a9 62 __ LDA #$62
0dab : 8d 2d 9f STA $9f2d 
0dae : a9 68 __ LDA #$68
0db0 : 8d 34 9f STA $9f34 
0db3 : 20 79 16 JSR $1679 ; (tileBaseConfig.s0 + 0)
0db6 : 8d 2f 9f STA $9f2f 
0db9 : a9 20 __ LDA #$20
0dbb : 85 2f __ STA P2 
0dbd : 20 92 16 JSR $1692 ; (memoryToMapMemoryAddress.s0 + 0)
0dc0 : 8d 2e 9f STA $9f2e 
0dc3 : a9 01 __ LDA #$01
0dc5 : 8d 22 9f STA $9f22 
0dc8 : a2 80 __ LDX #$80
.l6:
0dca : a0 50 __ LDY #$50
.l1032:
0dcc : a9 00 __ LDA #$00
0dce : 8d 24 9f STA $9f24 
0dd1 : a9 08 __ LDA #$08
0dd3 : 8d 24 9f STA $9f24 
0dd6 : 88 __ __ DEY
0dd7 : d0 f3 __ BNE $0dcc ; (SetUpSprites.l1032 + 0)
.s1033:
0dd9 : ca __ __ DEX
0dda : d0 ee __ BNE $0dca ; (SetUpSprites.l6 + 0)
.s4:
0ddc : 86 48 __ STX T1 + 0 
0dde : a9 00 __ LDA #$00
0de0 : 85 2d __ STA P0 
0de2 : 85 2e __ STA P1 
0de4 : 85 2f __ STA P2 
0de6 : 85 30 __ STA P3 
0de8 : a9 40 __ LDA #$40
0dea : 85 33 __ STA P6 
0dec : a9 01 __ LDA #$01
0dee : 85 34 __ STA P7 
0df0 : a9 56 __ LDA #$56
0df2 : 85 31 __ STA P4 
0df4 : a9 1e __ LDA #$1e
0df6 : 85 32 __ STA P5 
0df8 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
0dfb : a9 10 __ LDA #$10
0dfd : 8d 22 9f STA $9f22 
0e00 : a9 00 __ LDA #$00
0e02 : 8d 20 9f STA $9f20 
0e05 : a9 20 __ LDA #$20
0e07 : 8d 21 9f STA $9f21 
.l10:
0e0a : a9 00 __ LDA #$00
0e0c : 85 49 __ STA T2 + 0 
.l14:
0e0e : 20 db 16 JSR $16db ; (rand.s0 + 0)
0e11 : a5 3b __ LDA ACCU + 0 
0e13 : 29 1f __ AND #$1f
0e15 : 85 3b __ STA ACCU + 0 
0e17 : a5 48 __ LDA T1 + 0 
0e19 : c9 34 __ CMP #$34
0e1b : 90 03 __ BCC $0e20 ; (SetUpSprites.s1030 + 0)
0e1d : 4c f7 15 JMP $15f7 ; (SetUpSprites.s1029 + 0)
.s1030:
0e20 : c9 30 __ CMP #$30
0e22 : b0 03 __ BCS $0e27 ; (SetUpSprites.s17 + 0)
0e24 : 4c f7 15 JMP $15f7 ; (SetUpSprites.s1029 + 0)
.s17:
0e27 : a9 04 __ LDA #$04
.s197:
0e29 : 8d 23 9f STA $9f23 
0e2c : a9 00 __ LDA #$00
0e2e : 8d 23 9f STA $9f23 
0e31 : e6 49 __ INC T2 + 0 
0e33 : 10 d9 __ BPL $0e0e ; (SetUpSprites.l14 + 0)
.s11:
0e35 : e6 48 __ INC T1 + 0 
0e37 : a5 48 __ LDA T1 + 0 
0e39 : c9 3c __ CMP #$3c
0e3b : 90 cd __ BCC $0e0a ; (SetUpSprites.l10 + 0)
.s12:
0e3d : a9 00 __ LDA #$00
0e3f : 85 2d __ STA P0 
0e41 : 85 30 __ STA P3 
0e43 : 85 33 __ STA P6 
0e45 : a9 31 __ LDA #$31
0e47 : 85 2e __ STA P1 
0e49 : a9 01 __ LDA #$01
0e4b : 85 2f __ STA P2 
0e4d : a9 04 __ LDA #$04
0e4f : 85 34 __ STA P7 
0e51 : a9 98 __ LDA #$98
0e53 : 85 31 __ STA P4 
0e55 : a9 1f __ LDA #$1f
0e57 : 85 32 __ STA P5 
0e59 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
0e5c : a9 00 __ LDA #$00
0e5e : 85 4d __ STA T5 + 0 
0e60 : 85 4e __ STA T5 + 1 
.l52:
0e62 : 85 2d __ STA P0 
0e64 : 18 __ __ CLC
0e65 : 69 02 __ ADC #$02
0e67 : 85 4b __ STA T4 + 0 
0e69 : a9 00 __ LDA #$00
0e6b : 2a __ __ ROL
0e6c : 85 4c __ STA T4 + 1 
0e6e : a9 88 __ LDA #$88
0e70 : 85 2e __ STA P1 
0e72 : a9 09 __ LDA #$09
0e74 : 85 2f __ STA P2 
0e76 : a9 00 __ LDA #$00
0e78 : 85 30 __ STA P3 
0e7a : a9 03 __ LDA #$03
0e7c : 85 31 __ STA P4 
0e7e : 85 33 __ STA P6 
0e80 : a9 01 __ LDA #$01
0e82 : 85 32 __ STA P5 
0e84 : 85 34 __ STA P7 
0e86 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
0e89 : a5 4d __ LDA T5 + 0 
0e8b : 85 2e __ STA P1 
0e8d : a5 4e __ LDA T5 + 1 
0e8f : 85 2f __ STA P2 
0e91 : a9 a0 __ LDA #$a0
0e93 : 85 30 __ STA P3 
0e95 : a9 01 __ LDA #$01
0e97 : 85 31 __ STA P4 
0e99 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
0e9c : a9 00 __ LDA #$00
0e9e : 85 2e __ STA P1 
0ea0 : a9 01 __ LDA #$01
0ea2 : 85 2f __ STA P2 
0ea4 : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
0ea7 : a9 88 __ LDA #$88
0ea9 : 85 2e __ STA P1 
0eab : a9 09 __ LDA #$09
0ead : 85 2f __ STA P2 
0eaf : a9 00 __ LDA #$00
0eb1 : 85 30 __ STA P3 
0eb3 : a9 03 __ LDA #$03
0eb5 : 85 31 __ STA P4 
0eb7 : e6 2d __ INC P0 
0eb9 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
0ebc : a5 4d __ LDA T5 + 0 
0ebe : 85 2e __ STA P1 
0ec0 : a5 4e __ LDA T5 + 1 
0ec2 : 85 2f __ STA P2 
0ec4 : a9 70 __ LDA #$70
0ec6 : 85 30 __ STA P3 
0ec8 : a9 01 __ LDA #$01
0eca : 85 31 __ STA P4 
0ecc : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
0ecf : a5 4c __ LDA T4 + 1 
0ed1 : d0 16 __ BNE $0ee9 ; (SetUpSprites.s54 + 0)
.s1016:
0ed3 : 18 __ __ CLC
0ed4 : a5 2e __ LDA P1 
0ed6 : 69 40 __ ADC #$40
0ed8 : 85 4d __ STA T5 + 0 
0eda : a5 2f __ LDA P2 
0edc : 69 00 __ ADC #$00
0ede : 85 4e __ STA T5 + 1 
0ee0 : a5 4b __ LDA T4 + 0 
0ee2 : c9 14 __ CMP #$14
0ee4 : b0 03 __ BCS $0ee9 ; (SetUpSprites.s54 + 0)
0ee6 : 4c 62 0e JMP $0e62 ; (SetUpSprites.l52 + 0)
.s54:
0ee9 : a9 00 __ LDA #$00
0eeb : 85 2d __ STA P0 
0eed : 85 30 __ STA P3 
0eef : 85 33 __ STA P6 
0ef1 : a9 30 __ LDA #$30
0ef3 : 85 2e __ STA P1 
0ef5 : a9 01 __ LDA #$01
0ef7 : 85 2f __ STA P2 
0ef9 : a9 00 __ LDA #$00
0efb : 85 31 __ STA P4 
0efd : a9 24 __ LDA #$24
0eff : 85 32 __ STA P5 
0f01 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
0f04 : a9 16 __ LDA #$16
0f06 : 85 2d __ STA P0 
0f08 : a9 80 __ LDA #$80
0f0a : 85 2e __ STA P1 
0f0c : a9 09 __ LDA #$09
0f0e : 85 2f __ STA P2 
0f10 : a9 01 __ LDA #$01
0f12 : 85 31 __ STA P4 
0f14 : 85 34 __ STA P7 
0f16 : a9 02 __ LDA #$02
0f18 : 85 32 __ STA P5 
0f1a : a9 03 __ LDA #$03
0f1c : 85 33 __ STA P6 
0f1e : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
0f21 : a9 30 __ LDA #$30
0f23 : 85 2e __ STA P1 
0f25 : a9 01 __ LDA #$01
0f27 : 85 2f __ STA P2 
0f29 : a9 b8 __ LDA #$b8
0f2b : 85 30 __ STA P3 
0f2d : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
0f30 : a9 20 __ LDA #$20
0f32 : 85 2d __ STA P0 
0f34 : a9 35 __ LDA #$35
0f36 : 85 2e __ STA P1 
0f38 : a9 00 __ LDA #$00
0f3a : 85 30 __ STA P3 
0f3c : 85 33 __ STA P6 
0f3e : a9 02 __ LDA #$02
0f40 : 85 34 __ STA P7 
0f42 : a9 00 __ LDA #$00
0f44 : 85 31 __ STA P4 
0f46 : a9 25 __ LDA #$25
0f48 : 85 32 __ STA P5 
0f4a : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
0f4d : a9 17 __ LDA #$17
0f4f : 85 2d __ STA P0 
0f51 : a9 a9 __ LDA #$a9
0f53 : 85 2e __ STA P1 
0f55 : a9 09 __ LDA #$09
0f57 : 85 2f __ STA P2 
0f59 : a9 02 __ LDA #$02
0f5b : 85 31 __ STA P4 
0f5d : 85 32 __ STA P5 
0f5f : a9 03 __ LDA #$03
0f61 : 85 33 __ STA P6 
0f63 : a9 01 __ LDA #$01
0f65 : 85 34 __ STA P7 
0f67 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
0f6a : a9 fc __ LDA #$fc
0f6c : 85 2e __ STA P1 
0f6e : a9 00 __ LDA #$00
0f70 : 85 2f __ STA P2 
0f72 : a9 b8 __ LDA #$b8
0f74 : 85 30 __ STA P3 
0f76 : a9 01 __ LDA #$01
0f78 : 85 31 __ STA P4 
0f7a : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
0f7d : a9 18 __ LDA #$18
0f7f : 85 2d __ STA P0 
0f81 : a9 a9 __ LDA #$a9
0f83 : 85 2e __ STA P1 
0f85 : a9 09 __ LDA #$09
0f87 : 85 2f __ STA P2 
0f89 : a9 00 __ LDA #$00
0f8b : 85 30 __ STA P3 
0f8d : a9 02 __ LDA #$02
0f8f : 85 31 __ STA P4 
0f91 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
0f94 : a9 4c __ LDA #$4c
0f96 : 85 2e __ STA P1 
0f98 : a9 01 __ LDA #$01
0f9a : 85 2f __ STA P2 
0f9c : 85 31 __ STA P4 
0f9e : a9 b8 __ LDA #$b8
0fa0 : 85 30 __ STA P3 
0fa2 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
0fa5 : a9 01 __ LDA #$01
0fa7 : 85 2e __ STA P1 
0fa9 : a9 00 __ LDA #$00
0fab : 85 2f __ STA P2 
0fad : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
0fb0 : a9 10 __ LDA #$10
0fb2 : 85 2d __ STA P0 
0fb4 : a9 20 __ LDA #$20
0fb6 : 85 30 __ STA P3 
0fb8 : a9 00 __ LDA #$00
0fba : 85 31 __ STA P4 
0fbc : a9 98 __ LDA #$98
0fbe : 85 2e __ STA P1 
0fc0 : a9 23 __ LDA #$23
0fc2 : 85 2f __ STA P2 
0fc4 : 20 d5 17 JSR $17d5 ; (vera_pal_putn.s0 + 0)
0fc7 : a9 00 __ LDA #$00
0fc9 : 85 2d __ STA P0 
0fcb : 85 30 __ STA P3 
0fcd : 85 34 __ STA P7 
0fcf : a9 35 __ LDA #$35
0fd1 : 85 2e __ STA P1 
0fd3 : a9 01 __ LDA #$01
0fd5 : 85 2f __ STA P2 
0fd7 : a9 20 __ LDA #$20
0fd9 : 85 33 __ STA P6 
0fdb : a9 b8 __ LDA #$b8
0fdd : 85 31 __ STA P4 
0fdf : a9 23 __ LDA #$23
0fe1 : 85 32 __ STA P5 
0fe3 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
0fe6 : a9 00 __ LDA #$00
0fe8 : 85 48 __ STA T1 + 0 
0fea : 85 49 __ STA T2 + 0 
0fec : a9 03 __ LDA #$03
0fee : 85 33 __ STA P6 
0ff0 : a9 02 __ LDA #$02
0ff2 : 85 34 __ STA P7 
0ff4 : 18 __ __ CLC
.l1046:
0ff5 : a9 a8 __ LDA #$a8
0ff7 : 85 2e __ STA P1 
0ff9 : a9 09 __ LDA #$09
0ffb : 85 2f __ STA P2 
0ffd : a9 00 __ LDA #$00
0fff : 85 30 __ STA P3 
1001 : 85 31 __ STA P4 
1003 : 85 32 __ STA P5 
1005 : a5 48 __ LDA T1 + 0 
1007 : 69 19 __ ADC #$19
1009 : 85 2d __ STA P0 
100b : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
100e : a9 b8 __ LDA #$b8
1010 : 85 30 __ STA P3 
1012 : a9 01 __ LDA #$01
1014 : 85 31 __ STA P4 
1016 : 38 __ __ SEC
1017 : a5 49 __ LDA T2 + 0 
1019 : e9 fc __ SBC #$fc
101b : 85 2e __ STA P1 
101d : a9 00 __ LDA #$00
101f : e9 03 __ SBC #$03
1021 : 85 2f __ STA P2 
1023 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1026 : 18 __ __ CLC
1027 : a5 49 __ LDA T2 + 0 
1029 : 69 0c __ ADC #$0c
102b : 85 49 __ STA T2 + 0 
102d : e6 48 __ INC T1 + 0 
102f : a5 48 __ LDA T1 + 0 
1031 : c9 08 __ CMP #$08
1033 : 90 c0 __ BCC $0ff5 ; (SetUpSprites.l1046 + 0)
.s58:
1035 : a9 00 __ LDA #$00
1037 : 85 48 __ STA T1 + 0 
1039 : 85 49 __ STA T2 + 0 
103b : a9 03 __ LDA #$03
103d : 85 33 __ STA P6 
103f : 85 34 __ STA P7 
1041 : 18 __ __ CLC
.l1048:
1042 : a9 a8 __ LDA #$a8
1044 : 85 2e __ STA P1 
1046 : a9 09 __ LDA #$09
1048 : 85 2f __ STA P2 
104a : a9 00 __ LDA #$00
104c : 85 30 __ STA P3 
104e : 85 31 __ STA P4 
1050 : a5 48 __ LDA T1 + 0 
1052 : 69 21 __ ADC #$21
1054 : 85 2d __ STA P0 
1056 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1059 : a9 c4 __ LDA #$c4
105b : 85 30 __ STA P3 
105d : a9 01 __ LDA #$01
105f : 85 31 __ STA P4 
1061 : 38 __ __ SEC
1062 : a5 49 __ LDA T2 + 0 
1064 : e9 fc __ SBC #$fc
1066 : 85 2e __ STA P1 
1068 : a9 00 __ LDA #$00
106a : e9 03 __ SBC #$03
106c : 85 2f __ STA P2 
106e : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1071 : 18 __ __ CLC
1072 : a5 49 __ LDA T2 + 0 
1074 : 69 0c __ ADC #$0c
1076 : 85 49 __ STA T2 + 0 
1078 : e6 48 __ INC T1 + 0 
107a : a5 48 __ LDA T1 + 0 
107c : c9 08 __ CMP #$08
107e : 90 c2 __ BCC $1042 ; (SetUpSprites.l1048 + 0)
.s62:
1080 : a9 00 __ LDA #$00
1082 : 85 48 __ STA T1 + 0 
1084 : 85 49 __ STA T2 + 0 
1086 : a9 03 __ LDA #$03
1088 : 85 33 __ STA P6 
108a : a9 04 __ LDA #$04
108c : 85 34 __ STA P7 
108e : 18 __ __ CLC
.l1050:
108f : a9 a8 __ LDA #$a8
1091 : 85 2e __ STA P1 
1093 : a9 09 __ LDA #$09
1095 : 85 2f __ STA P2 
1097 : a9 00 __ LDA #$00
1099 : 85 30 __ STA P3 
109b : 85 31 __ STA P4 
109d : a5 48 __ LDA T1 + 0 
109f : 69 29 __ ADC #$29
10a1 : 85 2d __ STA P0 
10a3 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
10a6 : a9 b8 __ LDA #$b8
10a8 : 85 30 __ STA P3 
10aa : a9 01 __ LDA #$01
10ac : 85 31 __ STA P4 
10ae : 38 __ __ SEC
10af : a9 6c __ LDA #$6c
10b1 : e5 49 __ SBC T2 + 0 
10b3 : 85 2e __ STA P1 
10b5 : a9 02 __ LDA #$02
10b7 : e9 04 __ SBC #$04
10b9 : 85 2f __ STA P2 
10bb : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
10be : 18 __ __ CLC
10bf : a5 49 __ LDA T2 + 0 
10c1 : 69 0c __ ADC #$0c
10c3 : 85 49 __ STA T2 + 0 
10c5 : e6 48 __ INC T1 + 0 
10c7 : a5 48 __ LDA T1 + 0 
10c9 : c9 08 __ CMP #$08
10cb : 90 c2 __ BCC $108f ; (SetUpSprites.l1050 + 0)
.s66:
10cd : a9 00 __ LDA #$00
10cf : 85 48 __ STA T1 + 0 
.l68:
10d1 : 38 __ __ SEC
10d2 : a9 00 __ LDA #$00
10d4 : e5 48 __ SBC T1 + 0 
10d6 : 29 0c __ AND #$0c
10d8 : 49 ff __ EOR #$ff
10da : 38 __ __ SEC
10db : 69 6c __ ADC #$6c
10dd : 85 49 __ STA T2 + 0 
10df : a9 02 __ LDA #$02
10e1 : e9 00 __ SBC #$00
10e3 : 85 4a __ STA T2 + 1 
10e5 : 18 __ __ CLC
10e6 : a5 48 __ LDA T1 + 0 
10e8 : 69 31 __ ADC #$31
10ea : 85 2d __ STA P0 
10ec : a9 02 __ LDA #$02
10ee : 85 4f __ STA T7 + 0 
10f0 : a9 03 __ LDA #$03
10f2 : 85 33 __ STA P6 
10f4 : a9 04 __ LDA #$04
10f6 : 85 34 __ STA P7 
.l1040:
10f8 : a9 a8 __ LDA #$a8
10fa : 85 2e __ STA P1 
10fc : a9 09 __ LDA #$09
10fe : 85 2f __ STA P2 
1100 : a9 00 __ LDA #$00
1102 : 85 30 __ STA P3 
1104 : 85 31 __ STA P4 
1106 : 85 32 __ STA P5 
1108 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
110b : a5 49 __ LDA T2 + 0 
110d : 85 2e __ STA P1 
110f : a5 4a __ LDA T2 + 1 
1111 : 85 2f __ STA P2 
1113 : a9 b8 __ LDA #$b8
1115 : 85 30 __ STA P3 
1117 : a9 01 __ LDA #$01
1119 : 85 31 __ STA P4 
111b : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
111e : c6 4f __ DEC T7 + 0 
1120 : d0 d6 __ BNE $10f8 ; (SetUpSprites.l1040 + 0)
.s69:
1122 : e6 48 __ INC T1 + 0 
1124 : a5 48 __ LDA T1 + 0 
1126 : c9 02 __ CMP #$02
1128 : 90 a7 __ BCC $10d1 ; (SetUpSprites.l68 + 0)
.s70:
112a : a9 60 __ LDA #$60
112c : 85 2d __ STA P0 
112e : a9 4f __ LDA #$4f
1130 : 85 2e __ STA P1 
1132 : a9 01 __ LDA #$01
1134 : 85 2f __ STA P2 
1136 : 85 34 __ STA P7 
1138 : a9 00 __ LDA #$00
113a : 85 30 __ STA P3 
113c : 85 33 __ STA P6 
113e : a9 00 __ LDA #$00
1140 : 85 31 __ STA P4 
1142 : a9 27 __ LDA #$27
1144 : 85 32 __ STA P5 
1146 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
1149 : a9 33 __ LDA #$33
114b : 85 2d __ STA P0 
114d : a9 7b __ LDA #$7b
114f : 85 2e __ STA P1 
1151 : a9 0a __ LDA #$0a
1153 : 85 2f __ STA P2 
1155 : a9 01 __ LDA #$01
1157 : 85 31 __ STA P4 
1159 : a9 02 __ LDA #$02
115b : 85 32 __ STA P5 
115d : a9 03 __ LDA #$03
115f : 85 33 __ STA P6 
1161 : a9 06 __ LDA #$06
1163 : 85 34 __ STA P7 
1165 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1168 : a9 00 __ LDA #$00
116a : 85 2e __ STA P1 
116c : 85 31 __ STA P4 
116e : a9 01 __ LDA #$01
1170 : 85 2f __ STA P2 
1172 : a9 78 __ LDA #$78
1174 : 85 30 __ STA P3 
1176 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1179 : a9 20 __ LDA #$20
117b : 85 2d __ STA P0 
117d : a9 3f __ LDA #$3f
117f : 85 2e __ STA P1 
1181 : a9 00 __ LDA #$00
1183 : 85 30 __ STA P3 
1185 : 85 33 __ STA P6 
1187 : a9 04 __ LDA #$04
1189 : 85 34 __ STA P7 
118b : a9 00 __ LDA #$00
118d : 85 31 __ STA P4 
118f : a9 28 __ LDA #$28
1191 : 85 32 __ STA P5 
1193 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
1196 : a9 34 __ LDA #$34
1198 : 85 2d __ STA P0 
119a : a9 f9 __ LDA #$f9
119c : 85 2e __ STA P1 
119e : a9 09 __ LDA #$09
11a0 : 85 2f __ STA P2 
11a2 : a9 03 __ LDA #$03
11a4 : 85 31 __ STA P4 
11a6 : 85 33 __ STA P6 
11a8 : a9 02 __ LDA #$02
11aa : 85 32 __ STA P5 
11ac : a9 05 __ LDA #$05
11ae : 85 34 __ STA P7 
11b0 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
11b3 : a9 00 __ LDA #$00
11b5 : 85 2e __ STA P1 
11b7 : 85 31 __ STA P4 
11b9 : a9 01 __ LDA #$01
11bb : 85 2f __ STA P2 
11bd : a9 78 __ LDA #$78
11bf : 85 30 __ STA P3 
11c1 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
11c4 : a9 35 __ LDA #$35
11c6 : 85 2d __ STA P0 
11c8 : a9 19 __ LDA #$19
11ca : 85 2e __ STA P1 
11cc : a9 0a __ LDA #$0a
11ce : 85 2f __ STA P2 
11d0 : a9 00 __ LDA #$00
11d2 : 85 30 __ STA P3 
11d4 : a9 03 __ LDA #$03
11d6 : 85 31 __ STA P4 
11d8 : a9 07 __ LDA #$07
11da : 85 33 __ STA P6 
11dc : a9 06 __ LDA #$06
11de : 85 34 __ STA P7 
11e0 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
11e3 : a9 00 __ LDA #$00
11e5 : 85 2e __ STA P1 
11e7 : 85 31 __ STA P4 
11e9 : a9 01 __ LDA #$01
11eb : 85 2f __ STA P2 
11ed : a9 e8 __ LDA #$e8
11ef : 85 30 __ STA P3 
11f1 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
11f4 : a9 36 __ LDA #$36
11f6 : 85 2d __ STA P0 
11f8 : a9 19 __ LDA #$19
11fa : 85 2e __ STA P1 
11fc : a9 0a __ LDA #$0a
11fe : 85 2f __ STA P2 
1200 : a9 00 __ LDA #$00
1202 : 85 30 __ STA P3 
1204 : a9 03 __ LDA #$03
1206 : 85 31 __ STA P4 
1208 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
120b : a9 40 __ LDA #$40
120d : 85 2e __ STA P1 
120f : a9 01 __ LDA #$01
1211 : 85 2f __ STA P2 
1213 : a9 e8 __ LDA #$e8
1215 : 85 30 __ STA P3 
1217 : a9 00 __ LDA #$00
1219 : 85 31 __ STA P4 
121b : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
121e : a9 01 __ LDA #$01
1220 : 85 2e __ STA P1 
1222 : a9 00 __ LDA #$00
1224 : 85 2f __ STA P2 
1226 : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
1229 : a9 37 __ LDA #$37
122b : 85 2d __ STA P0 
122d : a9 19 __ LDA #$19
122f : 85 2e __ STA P1 
1231 : a9 0a __ LDA #$0a
1233 : 85 2f __ STA P2 
1235 : a9 00 __ LDA #$00
1237 : 85 30 __ STA P3 
1239 : a9 03 __ LDA #$03
123b : 85 31 __ STA P4 
123d : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1240 : a9 00 __ LDA #$00
1242 : 85 2e __ STA P1 
1244 : a9 01 __ LDA #$01
1246 : 85 2f __ STA P2 
1248 : 85 31 __ STA P4 
124a : a9 08 __ LDA #$08
124c : 85 30 __ STA P3 
124e : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1251 : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
1254 : a9 38 __ LDA #$38
1256 : 85 2d __ STA P0 
1258 : a9 19 __ LDA #$19
125a : 85 2e __ STA P1 
125c : a9 0a __ LDA #$0a
125e : 85 2f __ STA P2 
1260 : a9 00 __ LDA #$00
1262 : 85 30 __ STA P3 
1264 : a9 03 __ LDA #$03
1266 : 85 31 __ STA P4 
1268 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
126b : a9 40 __ LDA #$40
126d : 85 2e __ STA P1 
126f : a9 01 __ LDA #$01
1271 : 85 2f __ STA P2 
1273 : 85 31 __ STA P4 
1275 : a9 08 __ LDA #$08
1277 : 85 30 __ STA P3 
1279 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
127c : a9 01 __ LDA #$01
127e : 85 2e __ STA P1 
1280 : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
1283 : a9 20 __ LDA #$20
1285 : 85 2d __ STA P0 
1287 : a9 37 __ LDA #$37
1289 : 85 2e __ STA P1 
128b : a9 00 __ LDA #$00
128d : 85 30 __ STA P3 
128f : 85 33 __ STA P6 
1291 : a9 08 __ LDA #$08
1293 : 85 34 __ STA P7 
1295 : a9 00 __ LDA #$00
1297 : 85 31 __ STA P4 
1299 : a9 2c __ LDA #$2c
129b : 85 32 __ STA P5 
129d : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
12a0 : a9 00 __ LDA #$00
12a2 : 85 48 __ STA T1 + 0 
12a4 : 85 49 __ STA T2 + 0 
12a6 : 85 4a __ STA T2 + 1 
12a8 : a9 02 __ LDA #$02
12aa : 85 33 __ STA P6 
12ac : a9 05 __ LDA #$05
12ae : 85 34 __ STA P7 
12b0 : 18 __ __ CLC
.l1052:
12b1 : a9 b9 __ LDA #$b9
12b3 : 85 2e __ STA P1 
12b5 : a9 09 __ LDA #$09
12b7 : 85 2f __ STA P2 
12b9 : a9 00 __ LDA #$00
12bb : 85 30 __ STA P3 
12bd : a9 03 __ LDA #$03
12bf : 85 31 __ STA P4 
12c1 : 85 32 __ STA P5 
12c3 : a5 48 __ LDA T1 + 0 
12c5 : 69 39 __ ADC #$39
12c7 : 85 2d __ STA P0 
12c9 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
12cc : a9 20 __ LDA #$20
12ce : 85 2e __ STA P1 
12d0 : a9 01 __ LDA #$01
12d2 : 85 2f __ STA P2 
12d4 : 38 __ __ SEC
12d5 : a5 49 __ LDA T2 + 0 
12d7 : e9 40 __ SBC #$40
12d9 : 85 30 __ STA P3 
12db : a5 4a __ LDA T2 + 1 
12dd : e9 00 __ SBC #$00
12df : 85 31 __ STA P4 
12e1 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
12e4 : 18 __ __ CLC
12e5 : a5 49 __ LDA T2 + 0 
12e7 : 69 40 __ ADC #$40
12e9 : 85 49 __ STA T2 + 0 
12eb : 90 02 __ BCC $12ef ; (SetUpSprites.s1055 + 0)
.s1054:
12ed : e6 4a __ INC T2 + 1 
.s1055:
12ef : e6 48 __ INC T1 + 0 
12f1 : a5 48 __ LDA T1 + 0 
12f3 : c9 07 __ CMP #$07
12f5 : 90 ba __ BCC $12b1 ; (SetUpSprites.l1052 + 0)
.s78:
12f7 : a9 20 __ LDA #$20
12f9 : 85 2d __ STA P0 
12fb : a9 47 __ LDA #$47
12fd : 85 2e __ STA P1 
12ff : a9 00 __ LDA #$00
1301 : 85 30 __ STA P3 
1303 : 85 33 __ STA P6 
1305 : a9 08 __ LDA #$08
1307 : 85 34 __ STA P7 
1309 : a9 00 __ LDA #$00
130b : 85 31 __ STA P4 
130d : a9 34 __ LDA #$34
130f : 85 32 __ STA P5 
1311 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
1314 : a9 47 __ LDA #$47
1316 : 85 2d __ STA P0 
1318 : a9 39 __ LDA #$39
131a : 85 2e __ STA P1 
131c : a9 0a __ LDA #$0a
131e : 85 2f __ STA P2 
1320 : a9 03 __ LDA #$03
1322 : 85 31 __ STA P4 
1324 : 85 32 __ STA P5 
1326 : a9 07 __ LDA #$07
1328 : 85 33 __ STA P6 
132a : a9 06 __ LDA #$06
132c : 85 34 __ STA P7 
132e : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1331 : a9 08 __ LDA #$08
1333 : 85 2e __ STA P1 
1335 : 85 30 __ STA P3 
1337 : a9 00 __ LDA #$00
1339 : 85 2f __ STA P2 
133b : 85 31 __ STA P4 
133d : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1340 : a9 48 __ LDA #$48
1342 : 85 2d __ STA P0 
1344 : a9 39 __ LDA #$39
1346 : 85 2e __ STA P1 
1348 : a9 0a __ LDA #$0a
134a : 85 2f __ STA P2 
134c : a9 00 __ LDA #$00
134e : 85 30 __ STA P3 
1350 : a9 03 __ LDA #$03
1352 : 85 31 __ STA P4 
1354 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1357 : a9 48 __ LDA #$48
1359 : 85 2e __ STA P1 
135b : a9 00 __ LDA #$00
135d : 85 2f __ STA P2 
135f : 85 31 __ STA P4 
1361 : a9 08 __ LDA #$08
1363 : 85 30 __ STA P3 
1365 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1368 : a9 01 __ LDA #$01
136a : 85 2e __ STA P1 
136c : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
136f : a9 49 __ LDA #$49
1371 : 85 2d __ STA P0 
1373 : a9 39 __ LDA #$39
1375 : 85 2e __ STA P1 
1377 : a9 0a __ LDA #$0a
1379 : 85 2f __ STA P2 
137b : a9 00 __ LDA #$00
137d : 85 30 __ STA P3 
137f : a9 03 __ LDA #$03
1381 : 85 31 __ STA P4 
1383 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1386 : a9 48 __ LDA #$48
1388 : 85 2e __ STA P1 
138a : 85 30 __ STA P3 
138c : a9 00 __ LDA #$00
138e : 85 2f __ STA P2 
1390 : 85 31 __ STA P4 
1392 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1395 : a9 01 __ LDA #$01
1397 : 85 2e __ STA P1 
1399 : 85 2f __ STA P2 
139b : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
139e : a9 4a __ LDA #$4a
13a0 : 85 2d __ STA P0 
13a2 : a9 39 __ LDA #$39
13a4 : 85 2e __ STA P1 
13a6 : a9 0a __ LDA #$0a
13a8 : 85 2f __ STA P2 
13aa : a9 00 __ LDA #$00
13ac : 85 30 __ STA P3 
13ae : a9 03 __ LDA #$03
13b0 : 85 31 __ STA P4 
13b2 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
13b5 : a9 08 __ LDA #$08
13b7 : 85 2e __ STA P1 
13b9 : a9 00 __ LDA #$00
13bb : 85 2f __ STA P2 
13bd : 85 31 __ STA P4 
13bf : a9 48 __ LDA #$48
13c1 : 85 30 __ STA P3 
13c3 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
13c6 : a9 00 __ LDA #$00
13c8 : 85 2e __ STA P1 
13ca : a9 01 __ LDA #$01
13cc : 85 2f __ STA P2 
13ce : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
13d1 : a9 20 __ LDA #$20
13d3 : 85 2d __ STA P0 
13d5 : a9 47 __ LDA #$47
13d7 : 85 2e __ STA P1 
13d9 : a9 00 __ LDA #$00
13db : 85 30 __ STA P3 
13dd : a9 00 __ LDA #$00
13df : 85 31 __ STA P4 
13e1 : a9 34 __ LDA #$34
13e3 : 85 32 __ STA P5 
13e5 : a9 00 __ LDA #$00
13e7 : 85 33 __ STA P6 
13e9 : a9 08 __ LDA #$08
13eb : 85 34 __ STA P7 
13ed : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
13f0 : a9 4b __ LDA #$4b
13f2 : 85 2d __ STA P0 
13f4 : a9 39 __ LDA #$39
13f6 : 85 2e __ STA P1 
13f8 : a9 0a __ LDA #$0a
13fa : 85 2f __ STA P2 
13fc : a9 03 __ LDA #$03
13fe : 85 31 __ STA P4 
1400 : 85 32 __ STA P5 
1402 : a9 07 __ LDA #$07
1404 : 85 33 __ STA P6 
1406 : a9 06 __ LDA #$06
1408 : 85 34 __ STA P7 
140a : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
140d : a9 f8 __ LDA #$f8
140f : 85 2e __ STA P1 
1411 : a9 01 __ LDA #$01
1413 : 85 2f __ STA P2 
1415 : a9 08 __ LDA #$08
1417 : 85 30 __ STA P3 
1419 : a9 00 __ LDA #$00
141b : 85 31 __ STA P4 
141d : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1420 : a9 4c __ LDA #$4c
1422 : 85 2d __ STA P0 
1424 : a9 39 __ LDA #$39
1426 : 85 2e __ STA P1 
1428 : a9 0a __ LDA #$0a
142a : 85 2f __ STA P2 
142c : a9 00 __ LDA #$00
142e : 85 30 __ STA P3 
1430 : a9 03 __ LDA #$03
1432 : 85 31 __ STA P4 
1434 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1437 : a9 38 __ LDA #$38
1439 : 85 2e __ STA P1 
143b : a9 02 __ LDA #$02
143d : 85 2f __ STA P2 
143f : a9 08 __ LDA #$08
1441 : 85 30 __ STA P3 
1443 : a9 00 __ LDA #$00
1445 : 85 31 __ STA P4 
1447 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
144a : a9 01 __ LDA #$01
144c : 85 2e __ STA P1 
144e : a9 00 __ LDA #$00
1450 : 85 2f __ STA P2 
1452 : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
1455 : a9 4d __ LDA #$4d
1457 : 85 2d __ STA P0 
1459 : a9 39 __ LDA #$39
145b : 85 2e __ STA P1 
145d : a9 0a __ LDA #$0a
145f : 85 2f __ STA P2 
1461 : a9 00 __ LDA #$00
1463 : 85 30 __ STA P3 
1465 : a9 03 __ LDA #$03
1467 : 85 31 __ STA P4 
1469 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
146c : a9 38 __ LDA #$38
146e : 85 2e __ STA P1 
1470 : a9 02 __ LDA #$02
1472 : 85 2f __ STA P2 
1474 : a9 48 __ LDA #$48
1476 : 85 30 __ STA P3 
1478 : a9 00 __ LDA #$00
147a : 85 31 __ STA P4 
147c : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
147f : a9 01 __ LDA #$01
1481 : 85 2e __ STA P1 
1483 : 85 2f __ STA P2 
1485 : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
1488 : a9 4e __ LDA #$4e
148a : 85 2d __ STA P0 
148c : a9 39 __ LDA #$39
148e : 85 2e __ STA P1 
1490 : a9 0a __ LDA #$0a
1492 : 85 2f __ STA P2 
1494 : a9 00 __ LDA #$00
1496 : 85 30 __ STA P3 
1498 : a9 03 __ LDA #$03
149a : 85 31 __ STA P4 
149c : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
149f : a9 f8 __ LDA #$f8
14a1 : 85 2e __ STA P1 
14a3 : a9 01 __ LDA #$01
14a5 : 85 2f __ STA P2 
14a7 : a9 48 __ LDA #$48
14a9 : 85 30 __ STA P3 
14ab : a9 00 __ LDA #$00
14ad : 85 31 __ STA P4 
14af : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
14b2 : a9 00 __ LDA #$00
14b4 : 85 2e __ STA P1 
14b6 : 20 98 17 JSR $1798 ; (vera_spr_flip.s0 + 0)
14b9 : a9 60 __ LDA #$60
14bb : 85 2d __ STA P0 
14bd : a9 51 __ LDA #$51
14bf : 85 2e __ STA P1 
14c1 : a9 00 __ LDA #$00
14c3 : 85 30 __ STA P3 
14c5 : 85 33 __ STA P6 
14c7 : a9 02 __ LDA #$02
14c9 : 85 34 __ STA P7 
14cb : a9 00 __ LDA #$00
14cd : 85 31 __ STA P4 
14cf : a9 3c __ LDA #$3c
14d1 : 85 32 __ STA P5 
14d3 : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
14d6 : a9 a0 __ LDA #$a0
14d8 : 85 2d __ STA P0 
14da : a9 50 __ LDA #$50
14dc : 85 2e __ STA P1 
14de : a9 80 __ LDA #$80
14e0 : 85 33 __ STA P6 
14e2 : a9 00 __ LDA #$00
14e4 : 85 34 __ STA P7 
14e6 : a9 00 __ LDA #$00
14e8 : 85 31 __ STA P4 
14ea : a9 3e __ LDA #$3e
14ec : 85 32 __ STA P5 
14ee : 20 a0 16 JSR $16a0 ; (vram_putn.s0 + 0)
14f1 : a9 00 __ LDA #$00
14f3 : 85 47 __ STA T0 + 0 
.l80:
14f5 : a9 85 __ LDA #$85
14f7 : 85 2e __ STA P1 
14f9 : a9 0a __ LDA #$0a
14fb : 85 2f __ STA P2 
14fd : a9 01 __ LDA #$01
14ff : 85 31 __ STA P4 
1501 : 85 32 __ STA P5 
1503 : a9 02 __ LDA #$02
1505 : 85 33 __ STA P6 
1507 : a9 08 __ LDA #$08
1509 : 85 34 __ STA P7 
150b : 18 __ __ CLC
150c : a5 47 __ LDA T0 + 0 
150e : 69 4f __ ADC #$4f
1510 : 85 2d __ STA P0 
1512 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
1515 : a5 47 __ LDA T0 + 0 
1517 : c9 1f __ CMP #$1f
1519 : d0 0d __ BNE $1528 ; (SetUpSprites.s207 + 0)
.s83:
151b : a9 8b __ LDA #$8b
151d : 85 2e __ STA P1 
151f : a9 02 __ LDA #$02
1521 : 85 31 __ STA P4 
1523 : 85 32 __ STA P5 
1525 : 20 02 17 JSR $1702 ; (vera_spr_set.s0 + 0)
.s207:
1528 : e6 47 __ INC T0 + 0 
152a : a5 47 __ LDA T0 + 0 
152c : c9 20 __ CMP #$20
152e : 90 c5 __ BCC $14f5 ; (SetUpSprites.l80 + 0)
.s82:
1530 : a9 20 __ LDA #$20
1532 : 85 37 __ STA P10 
1534 : a9 40 __ LDA #$40
1536 : 8d fc 9e STA $9efc ; (sstack + 0)
1539 : a9 fa __ LDA #$fa
153b : 8d fd 9e STA $9efd ; (sstack + 1)
153e : a9 01 __ LDA #$01
1540 : 8d fe 9e STA $9efe ; (sstack + 2)
1543 : a9 00 __ LDA #$00
1545 : 8d ff 9e STA $9eff ; (sstack + 3)
1548 : a9 d8 __ LDA #$d8
154a : 85 35 __ STA P8 
154c : a9 23 __ LDA #$23
154e : 85 36 __ STA P9 
1550 : 20 1e 18 JSR $181e ; (SetPaletteColours.s0 + 0)
1553 : a9 60 __ LDA #$60
1555 : 8d fc 9e STA $9efc ; (sstack + 0)
1558 : a9 fa __ LDA #$fa
155a : 8d fd 9e STA $9efd ; (sstack + 1)
155d : a9 01 __ LDA #$01
155f : 8d fe 9e STA $9efe ; (sstack + 2)
1562 : a9 00 __ LDA #$00
1564 : 8d ff 9e STA $9eff ; (sstack + 3)
1567 : a9 80 __ LDA #$80
1569 : 85 35 __ STA P8 
156b : a9 3e __ LDA #$3e
156d : 85 36 __ STA P9 
156f : 20 1e 18 JSR $181e ; (SetPaletteColours.s0 + 0)
1572 : a9 80 __ LDA #$80
1574 : 8d fc 9e STA $9efc ; (sstack + 0)
1577 : a9 fa __ LDA #$fa
1579 : 8d fd 9e STA $9efd ; (sstack + 1)
157c : a9 01 __ LDA #$01
157e : 8d fe 9e STA $9efe ; (sstack + 2)
1581 : a9 00 __ LDA #$00
1583 : 8d ff 9e STA $9eff ; (sstack + 3)
1586 : a9 a0 __ LDA #$a0
1588 : 85 35 __ STA P8 
158a : a9 3e __ LDA #$3e
158c : 85 36 __ STA P9 
158e : 20 1e 18 JSR $181e ; (SetPaletteColours.s0 + 0)
1591 : a9 60 __ LDA #$60
1593 : 85 2d __ STA P0 
1595 : a9 20 __ LDA #$20
1597 : 85 30 __ STA P3 
1599 : a9 00 __ LDA #$00
159b : 85 31 __ STA P4 
159d : a9 c0 __ LDA #$c0
159f : 85 2e __ STA P1 
15a1 : a9 3e __ LDA #$3e
15a3 : 85 2f __ STA P2 
15a5 : 20 d5 17 JSR $17d5 ; (vera_pal_putn.s0 + 0)
15a8 : a9 70 __ LDA #$70
15aa : 85 2d __ STA P0 
15ac : a9 0c __ LDA #$0c
15ae : 85 30 __ STA P3 
15b0 : a9 00 __ LDA #$00
15b2 : 85 31 __ STA P4 
15b4 : a9 cc __ LDA #$cc
15b6 : 85 2e __ STA P1 
15b8 : a9 3e __ LDA #$3e
15ba : 85 2f __ STA P2 
15bc : 20 d5 17 JSR $17d5 ; (vera_pal_putn.s0 + 0)
15bf : a9 90 __ LDA #$90
15c1 : 85 2d __ STA P0 
15c3 : a9 20 __ LDA #$20
15c5 : 85 30 __ STA P3 
15c7 : a9 00 __ LDA #$00
15c9 : 85 31 __ STA P4 
15cb : a9 d8 __ LDA #$d8
15cd : 85 2e __ STA P1 
15cf : a9 3e __ LDA #$3e
15d1 : 85 2f __ STA P2 
15d3 : 20 d5 17 JSR $17d5 ; (vera_pal_putn.s0 + 0)
15d6 : a9 20 __ LDA #$20
15d8 : 85 2d __ STA P0 
15da : a9 43 __ LDA #$43
15dc : 85 2e __ STA P1 
15de : a9 01 __ LDA #$01
15e0 : 85 2f __ STA P2 
15e2 : a9 00 __ LDA #$00
15e4 : 85 30 __ STA P3 
15e6 : 85 33 __ STA P6 
15e8 : a9 04 __ LDA #$04
15ea : 85 34 __ STA P7 
15ec : a9 f8 __ LDA #$f8
15ee : 85 31 __ STA P4 
15f0 : a9 3e __ LDA #$3e
15f2 : 85 32 __ STA P5 
15f4 : 4c a0 16 JMP $16a0 ; (vram_putn.s0 + 0)
.s1029:
15f7 : c9 34 __ CMP #$34
15f9 : 90 05 __ BCC $1600 ; (SetUpSprites.s1028 + 0)
.s21:
15fb : a9 09 __ LDA #$09
15fd : 4c 29 0e JMP $0e29 ; (SetUpSprites.s197 + 0)
.s1028:
1600 : a9 1e __ LDA #$1e
1602 : c5 3b __ CMP ACCU + 0 
1604 : a5 49 __ LDA T2 + 0 
1606 : 90 3e __ BCC $1646 ; (SetUpSprites.s1021 + 0)
.s1027:
1608 : c9 09 __ CMP #$09
160a : 90 06 __ BCC $1612 ; (SetUpSprites.s27 + 0)
.s1026:
160c : a9 45 __ LDA #$45
160e : c5 49 __ CMP T2 + 0 
1610 : b0 05 __ BCS $1617 ; (SetUpSprites.s1025 + 0)
.s27:
1612 : a9 00 __ LDA #$00
1614 : 4c 29 0e JMP $0e29 ; (SetUpSprites.s197 + 0)
.s1025:
1617 : a5 49 __ LDA T2 + 0 
1619 : c9 13 __ CMP #$13
161b : 90 06 __ BCC $1623 ; (SetUpSprites.s31 + 0)
.s1024:
161d : a9 3b __ LDA #$3b
161f : c5 49 __ CMP T2 + 0 
1621 : b0 04 __ BCS $1627 ; (SetUpSprites.s1023 + 0)
.s31:
1623 : a9 01 __ LDA #$01
1625 : d0 12 __ BNE $1639 ; (SetUpSprites.s212 + 0)
.s1023:
1627 : a5 49 __ LDA T2 + 0 
1629 : c9 1d __ CMP #$1d
162b : 90 06 __ BCC $1633 ; (SetUpSprites.s35 + 0)
.s1022:
162d : a9 31 __ LDA #$31
162f : c5 49 __ CMP T2 + 0 
1631 : b0 04 __ BCS $1637 ; (SetUpSprites.s36 + 0)
.s35:
1633 : a9 02 __ LDA #$02
1635 : d0 02 __ BNE $1639 ; (SetUpSprites.s212 + 0)
.s36:
1637 : a9 03 __ LDA #$03
.s212:
1639 : 8d 23 9f STA $9f23 
163c : a9 00 __ LDA #$00
163e : 8d 23 9f STA $9f23 
1641 : e6 49 __ INC T2 + 0 
1643 : 4c 0e 0e JMP $0e0e ; (SetUpSprites.l14 + 0)
.s1021:
1646 : c9 09 __ CMP #$09
1648 : 90 06 __ BCC $1650 ; (SetUpSprites.s39 + 0)
.s1020:
164a : a9 45 __ LDA #$45
164c : c5 49 __ CMP T2 + 0 
164e : b0 05 __ BCS $1655 ; (SetUpSprites.s1005 + 0)
.s39:
1650 : a9 05 __ LDA #$05
1652 : 4c 29 0e JMP $0e29 ; (SetUpSprites.s197 + 0)
.s1005:
1655 : a5 49 __ LDA T2 + 0 
1657 : c9 13 __ CMP #$13
1659 : 90 06 __ BCC $1661 ; (SetUpSprites.s43 + 0)
.s1004:
165b : a9 3b __ LDA #$3b
165d : c5 49 __ CMP T2 + 0 
165f : b0 04 __ BCS $1665 ; (SetUpSprites.s1003 + 0)
.s43:
1661 : a9 06 __ LDA #$06
1663 : d0 d4 __ BNE $1639 ; (SetUpSprites.s212 + 0)
.s1003:
1665 : a5 49 __ LDA T2 + 0 
1667 : c9 1d __ CMP #$1d
1669 : 90 06 __ BCC $1671 ; (SetUpSprites.s47 + 0)
.s1002:
166b : a9 31 __ LDA #$31
166d : c5 49 __ CMP T2 + 0 
166f : b0 04 __ BCS $1675 ; (SetUpSprites.s48 + 0)
.s47:
1671 : a9 07 __ LDA #$07
1673 : d0 c4 __ BNE $1639 ; (SetUpSprites.s212 + 0)
.s48:
1675 : a9 08 __ LDA #$08
1677 : d0 c0 __ BNE $1639 ; (SetUpSprites.s212 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1679 : a5 2d __ LDA P0 ; (bank + 0)
167b : 4a __ __ LSR
167c : a9 00 __ LDA #$00
167e : 6a __ __ ROR
167f : 85 3b __ STA ACCU + 0 
1681 : a5 2f __ LDA P2 ; (mem + 1)
1683 : 29 f8 __ AND #$f8
1685 : 4a __ __ LSR
1686 : 05 3b __ ORA ACCU + 0 
1688 : 85 3b __ STA ACCU + 0 
168a : a5 30 __ LDA P3 ; (height + 0)
168c : 0a __ __ ASL
168d : 05 3b __ ORA ACCU + 0 
168f : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1691 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1692 : a5 2d __ LDA P0 ; (bank + 0)
1694 : 4a __ __ LSR
1695 : a9 00 __ LDA #$00
1697 : 6a __ __ ROR
1698 : 85 3b __ STA ACCU + 0 
169a : a5 2f __ LDA P2 ; (mem + 1)
169c : 4a __ __ LSR
169d : 05 3b __ ORA ACCU + 0 
.s1001:
169f : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
16a0 : ad 25 9f LDA $9f25 
16a3 : 29 fe __ AND #$fe
16a5 : 8d 25 9f STA $9f25 
16a8 : a5 2d __ LDA P0 ; (addr + 0)
16aa : 8d 20 9f STA $9f20 
16ad : a5 2e __ LDA P1 ; (addr + 1)
16af : 8d 21 9f STA $9f21 
16b2 : a5 2f __ LDA P2 ; (addr + 2)
16b4 : 29 01 __ AND #$01
16b6 : 09 10 __ ORA #$10
16b8 : 8d 22 9f STA $9f22 
16bb : a5 33 __ LDA P6 ; (size + 0)
16bd : 05 34 __ ORA P7 ; (size + 1)
16bf : f0 19 __ BEQ $16da ; (vram_putn.s1001 + 0)
.s6:
16c1 : a0 00 __ LDY #$00
16c3 : a6 33 __ LDX P6 ; (size + 0)
16c5 : f0 02 __ BEQ $16c9 ; (vram_putn.l1002 + 0)
.s1005:
16c7 : e6 34 __ INC P7 ; (size + 1)
.l1002:
16c9 : b1 31 __ LDA (P4),y ; (data + 0)
16cb : 8d 23 9f STA $9f23 
16ce : c8 __ __ INY
16cf : d0 02 __ BNE $16d3 ; (vram_putn.s1009 + 0)
.s1008:
16d1 : e6 32 __ INC P5 ; (data + 1)
.s1009:
16d3 : ca __ __ DEX
16d4 : d0 f3 __ BNE $16c9 ; (vram_putn.l1002 + 0)
.s1004:
16d6 : c6 34 __ DEC P7 ; (size + 1)
16d8 : d0 ef __ BNE $16c9 ; (vram_putn.l1002 + 0)
.s1001:
16da : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1e56 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e66 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e76 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e86 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1e96 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ea6 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1eb6 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1ec6 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1ed6 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1ee6 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1ef6 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
1f06 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
1f16 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
1f26 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
1f36 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
1f46 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
1f56 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
1f66 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
1f76 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1f86 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
--------------------------------------------------------------------
rand:
.s0:
16db : ad 97 1f LDA $1f97 ; (seed + 1)
16de : 4a __ __ LSR
16df : ad 96 1f LDA $1f96 ; (seed + 0)
16e2 : 6a __ __ ROR
16e3 : aa __ __ TAX
16e4 : a9 00 __ LDA #$00
16e6 : 6a __ __ ROR
16e7 : 4d 96 1f EOR $1f96 ; (seed + 0)
16ea : 85 3b __ STA ACCU + 0 
16ec : 8a __ __ TXA
16ed : 4d 97 1f EOR $1f97 ; (seed + 1)
16f0 : 85 3c __ STA ACCU + 1 
16f2 : 4a __ __ LSR
16f3 : 45 3b __ EOR ACCU + 0 
16f5 : 8d 96 1f STA $1f96 ; (seed + 0)
16f8 : 85 3b __ STA ACCU + 0 
16fa : 45 3c __ EOR ACCU + 1 
16fc : 8d 97 1f STA $1f97 ; (seed + 1)
16ff : 85 3c __ STA ACCU + 1 
.s1001:
1701 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1f96 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ScrollerOutline:
1f98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fa8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fd8 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1fe8 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1ff8 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2008 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2018 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2028 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2038 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2048 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2058 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
2068 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2078 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
2088 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
2098 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
20a8 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
20b8 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
20c8 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
20d8 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
20e8 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
20f8 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2108 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
2118 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2128 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2138 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2148 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2158 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2168 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2178 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2188 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2198 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21a8 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21b8 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21c8 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21d8 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21e8 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
21f8 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2208 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2218 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2228 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2238 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2248 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2258 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2268 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2278 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2288 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2298 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
22a8 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
22b8 : __ __ __ BYT 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 : UUUg.UUUUVx.UUUU
22c8 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
22d8 : __ __ __ BYT 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 : UUVx.UUUUg.UUUUV
22e8 : __ __ __ BYT 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 : x.UUUUg.UUUUVx.U
22f8 : __ __ __ BYT 55 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 : UUg.UUUUVx.UUUUg
2308 : __ __ __ BYT 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 : .UUUUVx.UUUUg.UU
2318 : __ __ __ BYT 55 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 : UVx.UUUUg.UUUUVx
2328 : __ __ __ BYT 95 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 : .UUUUg.UUUUVx.UU
2338 : __ __ __ BYT 55 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 : Ug.UUUUVx.UUUUg.
2348 : __ __ __ BYT 55 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 : UUUUVx.UUUUg.UUU
2358 : __ __ __ BYT 56 78 95 55 55 55 55 67 89 55 55 55 55 56 78 95 : Vx.UUUUg.UUUUVx.
2368 : __ __ __ BYT 55 55 55 55 67 89 55 55 55 55 56 78 95 55 55 55 : UUUUg.UUUUVx.UUU
2378 : __ __ __ BYT 67 89 55 55 55 55 56 78 95 55 55 55 55 67 89 55 : g.UUUUVx.UUUUg.U
2388 : __ __ __ BYT 55 55 55 56 78 95 55 55 55 55 67 89 55 55 55 55 : UUUVx.UUUUg.UUUU
--------------------------------------------------------------------
vera_spr_set:
.s0:
1702 : ad 25 9f LDA $9f25 
1705 : 29 fe __ AND #$fe
1707 : 8d 25 9f STA $9f25 
170a : a5 2d __ LDA P0 ; (spr + 0)
170c : 0a __ __ ASL
170d : 0a __ __ ASL
170e : 85 3b __ STA ACCU + 0 
1710 : a9 3f __ LDA #$3f
1712 : 2a __ __ ROL
1713 : 06 3b __ ASL ACCU + 0 
1715 : 2a __ __ ROL
1716 : 8d 21 9f STA $9f21 
1719 : a5 3b __ LDA ACCU + 0 
171b : 8d 20 9f STA $9f20 
171e : a9 11 __ LDA #$11
1720 : 8d 22 9f STA $9f22 
1723 : a5 30 __ LDA P3 ; (mode8 + 0)
1725 : f0 02 __ BEQ $1729 ; (vera_spr_set.s11 + 0)
.s9:
1727 : a9 80 __ LDA #$80
.s11:
1729 : 05 2f __ ORA P2 ; (addr32 + 1)
172b : a6 2e __ LDX P1 ; (addr32 + 0)
172d : 8e 23 9f STX $9f23 
1730 : 8d 23 9f STA $9f23 
1733 : a9 00 __ LDA #$00
1735 : 8d 23 9f STA $9f23 
1738 : 8d 23 9f STA $9f23 
173b : 8d 23 9f STA $9f23 
173e : 8d 23 9f STA $9f23 
1741 : a5 33 __ LDA P6 ; (z + 0)
1743 : 0a __ __ ASL
1744 : 0a __ __ ASL
1745 : 8d 23 9f STA $9f23 
1748 : a5 32 __ LDA P5 ; (h + 0)
174a : 4a __ __ LSR
174b : 6a __ __ ROR
174c : 29 80 __ AND #$80
174e : 6a __ __ ROR
174f : 85 3b __ STA ACCU + 0 
1751 : a5 31 __ LDA P4 ; (w + 0)
1753 : 0a __ __ ASL
1754 : 0a __ __ ASL
1755 : 0a __ __ ASL
1756 : 0a __ __ ASL
1757 : 05 3b __ ORA ACCU + 0 
1759 : 05 34 __ ORA P7 ; (pal + 0)
175b : 8d 23 9f STA $9f23 
.s1001:
175e : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
175f : ad 25 9f LDA $9f25 
1762 : 29 fe __ AND #$fe
1764 : 8d 25 9f STA $9f25 
1767 : a5 2d __ LDA P0 ; (spr + 0)
1769 : 0a __ __ ASL
176a : 0a __ __ ASL
176b : 85 3b __ STA ACCU + 0 
176d : a9 3f __ LDA #$3f
176f : 2a __ __ ROL
1770 : 06 3b __ ASL ACCU + 0 
1772 : 2a __ __ ROL
1773 : aa __ __ TAX
1774 : a5 3b __ LDA ACCU + 0 
1776 : 09 02 __ ORA #$02
1778 : 8d 20 9f STA $9f20 
177b : 8e 21 9f STX $9f21 
177e : a9 11 __ LDA #$11
1780 : 8d 22 9f STA $9f22 
1783 : a5 2e __ LDA P1 ; (x + 0)
1785 : 8d 23 9f STA $9f23 
1788 : a5 2f __ LDA P2 ; (x + 1)
178a : 8d 23 9f STA $9f23 
178d : a5 30 __ LDA P3 ; (y + 0)
178f : 8d 23 9f STA $9f23 
1792 : a5 31 __ LDA P4 ; (y + 1)
1794 : 8d 23 9f STA $9f23 
.s1001:
1797 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_flip:
.s0:
1798 : ad 25 9f LDA $9f25 
179b : 29 fe __ AND #$fe
179d : 8d 25 9f STA $9f25 
17a0 : a5 2d __ LDA P0 ; (spr + 0)
17a2 : 0a __ __ ASL
17a3 : 0a __ __ ASL
17a4 : 85 3b __ STA ACCU + 0 
17a6 : a9 3f __ LDA #$3f
17a8 : 2a __ __ ROL
17a9 : 06 3b __ ASL ACCU + 0 
17ab : 2a __ __ ROL
17ac : aa __ __ TAX
17ad : a5 3b __ LDA ACCU + 0 
17af : 09 06 __ ORA #$06
17b1 : 8d 20 9f STA $9f20 
17b4 : 8e 21 9f STX $9f21 
17b7 : a9 01 __ LDA #$01
17b9 : 8d 22 9f STA $9f22 
17bc : ad 23 9f LDA $9f23 
17bf : 29 fc __ AND #$fc
17c1 : a8 __ __ TAY
17c2 : a5 2e __ LDA P1 ; (fliph + 0)
17c4 : f0 01 __ BEQ $17c7 ; (vera_spr_flip.s14 + 0)
.s6:
17c6 : c8 __ __ INY
.s14:
17c7 : a5 2f __ LDA P2 ; (flipv + 0)
17c9 : f0 05 __ BEQ $17d0 ; (vera_spr_flip.s11 + 0)
.s9:
17cb : 98 __ __ TYA
17cc : 09 02 __ ORA #$02
17ce : d0 01 __ BNE $17d1 ; (vera_spr_flip.s1002 + 0)
.s11:
17d0 : 98 __ __ TYA
.s1002:
17d1 : 8d 23 9f STA $9f23 
.s1001:
17d4 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2410 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2420 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2430 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2440 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2450 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2460 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2470 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2480 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2490 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
24d0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
24e0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
24f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2500 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2510 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2520 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2530 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2540 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2550 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2560 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2570 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2580 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2590 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
25a0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
25b0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
25c0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
25d0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
25e0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
25f0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2600 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2610 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2620 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2630 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2640 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2650 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2660 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2670 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2680 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2690 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
26a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
26b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
26c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
26d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
26e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
26f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_pal_putn:
.s0:
17d5 : ad 25 9f LDA $9f25 
17d8 : 29 fe __ AND #$fe
17da : 8d 25 9f STA $9f25 
17dd : a5 2d __ LDA P0 ; (index + 0)
17df : 0a __ __ ASL
17e0 : 8d 20 9f STA $9f20 
17e3 : a9 7d __ LDA #$7d
17e5 : 2a __ __ ROL
17e6 : 8d 21 9f STA $9f21 
17e9 : a9 11 __ LDA #$11
17eb : 8d 22 9f STA $9f22 
17ee : a5 30 __ LDA P3 ; (size + 0)
17f0 : 05 31 __ ORA P4 ; (size + 1)
17f2 : f0 29 __ BEQ $181d ; (vera_pal_putn.s1001 + 0)
.s6:
17f4 : a6 30 __ LDX P3 ; (size + 0)
17f6 : f0 02 __ BEQ $17fa ; (vera_pal_putn.l3 + 0)
.s1003:
17f8 : e6 31 __ INC P4 ; (size + 1)
.l3:
17fa : a0 01 __ LDY #$01
17fc : b1 2e __ LDA (P1),y ; (color + 0)
17fe : 85 3c __ STA ACCU + 1 
1800 : 88 __ __ DEY
1801 : b1 2e __ LDA (P1),y ; (color + 0)
1803 : 8d 23 9f STA $9f23 
1806 : a5 3c __ LDA ACCU + 1 
1808 : 8d 23 9f STA $9f23 
180b : 18 __ __ CLC
180c : a5 2e __ LDA P1 ; (color + 0)
180e : 69 02 __ ADC #$02
1810 : 85 2e __ STA P1 ; (color + 0)
1812 : 90 02 __ BCC $1816 ; (vera_pal_putn.s1007 + 0)
.s1006:
1814 : e6 2f __ INC P2 ; (color + 1)
.s1007:
1816 : ca __ __ DEX
1817 : d0 e1 __ BNE $17fa ; (vera_pal_putn.l3 + 0)
.s1002:
1819 : c6 31 __ DEC P4 ; (size + 1)
181b : d0 dd __ BNE $17fa ; (vera_pal_putn.l3 + 0)
.s1001:
181d : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2398 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
23a8 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
23b8 : __ __ __ BYT 00 00 00 00 01 11 11 10 01 22 22 10 01 23 32 10 : .........""..#2.
23c8 : __ __ __ BYT 01 23 32 10 01 22 22 10 01 11 11 10 00 00 00 00 : .#2.."".........
--------------------------------------------------------------------
MainPupil:
2700 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2710 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
2720 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
2730 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
2740 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
2750 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
2760 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
2770 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2780 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
2790 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
27a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
27b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
27c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
27d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
27e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
27f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
2800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2810 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2820 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
2830 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
2840 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2850 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2860 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2870 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2880 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2890 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
28a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
28b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
28c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
28d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
28e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
28f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2900 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2910 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2920 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2930 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2940 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2950 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2960 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2970 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2980 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2990 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
29a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
29b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
29c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
29d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
29e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
29f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2a00 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
2a10 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
2a20 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2a30 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
2a40 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
2a50 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
2a60 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2a70 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
2a80 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
2a90 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
2aa0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
2ab0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
2ac0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
2ad0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
2ae0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
2af0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
2b00 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
2b10 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
2b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
2b30 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
2b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
2b50 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
2b60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
2b70 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
2b80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
2b90 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
2ba0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
2bb0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
2bc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
2bd0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
2be0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
2bf0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
2c00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2c90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ca0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cb0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cc0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cd0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2ce0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2cf0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
2d00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2d90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2da0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2db0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2dc0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2dd0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2de0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
2df0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
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
3000 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3010 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3020 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3030 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3040 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3050 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3060 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3070 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3080 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3090 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
30a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
30b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
30c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
30d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
30e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
30f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3100 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3110 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3120 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3130 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3140 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3150 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3160 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3170 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3180 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3190 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
31a0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
31b0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
31c0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
31d0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
31e0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
31f0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
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
--------------------------------------------------------------------
CharBox:
3400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3420 : __ __ __ BYT 01 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3430 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3440 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3450 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3460 : __ __ __ BYT 01 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3470 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3480 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
3490 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
34a0 : __ __ __ BYT 01 22 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ."33333333333333
34b0 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
34c0 : __ __ __ BYT 01 22 33 44 44 44 44 44 44 44 44 44 44 44 44 44 : ."3DDDDDDDDDDDDD
34d0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
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
3810 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3820 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3830 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3840 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3850 : __ __ __ BYT 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ."""""""""""""""
3860 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3870 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
3880 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
3890 : __ __ __ BYT 12 24 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : .$DDDDDDDDDDDDDD
38a0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38b0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
38c0 : __ __ __ BYT 01 22 33 45 55 55 55 55 55 55 55 55 55 55 55 55 : ."3EUUUUUUUUUUUU
38d0 : __ __ __ BYT 12 24 43 33 33 33 33 33 33 33 33 33 33 33 33 33 : .$C3333333333333
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
3e00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
3e10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
3e20 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
3e30 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
3e40 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
3e50 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
3e60 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
3e70 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
181e : ad fc 9e LDA $9efc ; (sstack + 0)
1821 : 85 2d __ STA P0 
1823 : ad fd 9e LDA $9efd ; (sstack + 1)
1826 : 85 2e __ STA P1 
1828 : ad fe 9e LDA $9efe ; (sstack + 2)
182b : 85 2f __ STA P2 
182d : ad ff 9e LDA $9eff ; (sstack + 3)
1830 : 85 30 __ STA P3 
1832 : a5 35 __ LDA P8 ; (input + 0)
1834 : 85 31 __ STA P4 
1836 : a5 36 __ LDA P9 ; (input + 1)
1838 : 85 32 __ STA P5 
183a : a5 37 __ LDA P10 ; (inputsize + 0)
183c : 85 33 __ STA P6 
183e : a9 00 __ LDA #$00
1840 : 85 34 __ STA P7 
1842 : 4c a0 16 JMP $16a0 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
ButtonStageMax:
23d8 : __ __ __ BYT c2 02 82 02 62 02 50 00 00 00 00 00 00 00 00 00 : ....b.P.........
23e8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMed:
3e80 : __ __ __ BYT 82 02 62 02 43 03 33 03 00 00 00 00 00 00 00 00 : ..b.C.3.........
3e90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ButtonStageMin:
3ea0 : __ __ __ BYT 53 03 53 03 44 04 33 03 00 00 00 00 00 00 00 00 : S.S.D.3.........
3eb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CharBoxPalette:
3ec0 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02             : ..m.M.).+.-.
--------------------------------------------------------------------
WavyPal:
3ecc : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
3ed8 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
3ee8 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
EyeTri:
3ef8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f08 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
3f18 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f28 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
3f38 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f48 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
3f58 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f68 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
3f78 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3f88 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
3f98 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fa8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
3fb8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fc8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
3fd8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3fe8 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
3ff8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4008 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
4018 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4028 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4038 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4048 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4058 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4068 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4078 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4088 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4098 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40a8 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
40b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40c8 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
40d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40e8 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
40f8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
4108 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
4118 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
4128 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
4138 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4148 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
4158 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4168 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4178 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4188 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4198 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
41a8 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
41b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
41c8 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
41d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
41e8 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
41f8 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
4208 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
4218 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4228 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
4238 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4248 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
4258 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4268 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4278 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4288 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4298 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
42a8 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
42b8 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
42c8 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
42d8 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
42e8 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
getchx:
.s0:
1845 : 20 4f 18 JSR $184f ; (getpch + 0)
1848 : 85 3b __ STA ACCU + 0 
184a : a9 00 __ LDA #$00
184c : 85 3c __ STA ACCU + 1 
.s1001:
184e : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
184f : 20 e4 ff JSR $ffe4 
1852 : ae f8 23 LDX $23f8 ; (giocharmap + 0)
1855 : e0 01 __ CPX #$01
1857 : 90 26 __ BCC $187f ; (getpch + 48)
1859 : c9 0d __ CMP #$0d
185b : d0 02 __ BNE $185f ; (getpch + 16)
185d : a9 0a __ LDA #$0a
185f : e0 02 __ CPX #$02
1861 : 90 1c __ BCC $187f ; (getpch + 48)
1863 : c9 db __ CMP #$db
1865 : b0 18 __ BCS $187f ; (getpch + 48)
1867 : c9 41 __ CMP #$41
1869 : 90 14 __ BCC $187f ; (getpch + 48)
186b : c9 c1 __ CMP #$c1
186d : 90 02 __ BCC $1871 ; (getpch + 34)
186f : 49 a0 __ EOR #$a0
1871 : c9 7b __ CMP #$7b
1873 : b0 0a __ BCS $187f ; (getpch + 48)
1875 : c9 61 __ CMP #$61
1877 : b0 04 __ BCS $187d ; (getpch + 46)
1879 : c9 5b __ CMP #$5b
187b : b0 02 __ BCS $187f ; (getpch + 48)
187d : 49 20 __ EOR #$20
187f : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
23f8 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
23f9 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
23fb : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
23fd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
42f8 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1880 : a9 33 __ LDA #$33
1882 : 85 2d __ STA P0 
1884 : a9 38 __ LDA #$38
1886 : 85 2e __ STA P1 
1888 : a9 01 __ LDA #$01
188a : 85 2f __ STA P2 
188c : a6 32 __ LDX P5 ; (p + 0)
188e : bd 00 43 LDA $4300,x ; (sintab + 0)
1891 : 4a __ __ LSR
1892 : 4a __ __ LSR
1893 : 4a __ __ LSR
1894 : 49 10 __ EOR #$10
1896 : 38 __ __ SEC
1897 : e9 10 __ SBC #$10
1899 : 18 __ __ CLC
189a : 69 b4 __ ADC #$b4
189c : 85 30 __ STA P3 
189e : a9 00 __ LDA #$00
18a0 : 85 31 __ STA P4 
18a2 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
18a5 : a9 34 __ LDA #$34
18a7 : 85 2d __ STA P0 
18a9 : a9 20 __ LDA #$20
18ab : 85 2e __ STA P1 
18ad : a6 34 __ LDX P7 ; (p2 + 0)
18af : bd 00 43 LDA $4300,x ; (sintab + 0)
18b2 : 4a __ __ LSR
18b3 : 4a __ __ LSR
18b4 : 4a __ __ LSR
18b5 : 49 10 __ EOR #$10
18b7 : 38 __ __ SEC
18b8 : e9 10 __ SBC #$10
18ba : 18 __ __ CLC
18bb : 69 b4 __ ADC #$b4
18bd : 85 30 __ STA P3 
18bf : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
18c2 : a9 35 __ LDA #$35
18c4 : 85 2d __ STA P0 
18c6 : a9 00 __ LDA #$00
18c8 : 85 2e __ STA P1 
18ca : a6 36 __ LDX P9 ; (p3 + 0)
18cc : bd 00 43 LDA $4300,x ; (sintab + 0)
18cf : 4a __ __ LSR
18d0 : 4a __ __ LSR
18d1 : 4a __ __ LSR
18d2 : 49 10 __ EOR #$10
18d4 : 38 __ __ SEC
18d5 : e9 10 __ SBC #$10
18d7 : 18 __ __ CLC
18d8 : 69 a4 __ ADC #$a4
18da : 85 30 __ STA P3 
18dc : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
18df : a9 36 __ LDA #$36
18e1 : 85 2d __ STA P0 
18e3 : a9 40 __ LDA #$40
18e5 : 85 2e __ STA P1 
18e7 : a6 36 __ LDX P9 ; (p3 + 0)
18e9 : bd 00 43 LDA $4300,x ; (sintab + 0)
18ec : 4a __ __ LSR
18ed : 4a __ __ LSR
18ee : 4a __ __ LSR
18ef : 49 10 __ EOR #$10
18f1 : 38 __ __ SEC
18f2 : e9 10 __ SBC #$10
18f4 : 18 __ __ CLC
18f5 : 69 a4 __ ADC #$a4
18f7 : 85 30 __ STA P3 
18f9 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
18fc : a9 37 __ LDA #$37
18fe : 85 2d __ STA P0 
1900 : a9 00 __ LDA #$00
1902 : 85 2e __ STA P1 
1904 : a6 36 __ LDX P9 ; (p3 + 0)
1906 : bd 00 43 LDA $4300,x ; (sintab + 0)
1909 : 4a __ __ LSR
190a : 4a __ __ LSR
190b : 4a __ __ LSR
190c : 49 10 __ EOR #$10
190e : 38 __ __ SEC
190f : e9 10 __ SBC #$10
1911 : 18 __ __ CLC
1912 : 69 c4 __ ADC #$c4
1914 : 85 30 __ STA P3 
1916 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1919 : a9 38 __ LDA #$38
191b : 85 2d __ STA P0 
191d : a9 40 __ LDA #$40
191f : 85 2e __ STA P1 
1921 : a6 36 __ LDX P9 ; (p3 + 0)
1923 : bd 00 43 LDA $4300,x ; (sintab + 0)
1926 : 4a __ __ LSR
1927 : 4a __ __ LSR
1928 : 4a __ __ LSR
1929 : 49 10 __ EOR #$10
192b : 38 __ __ SEC
192c : e9 10 __ SBC #$10
192e : 18 __ __ CLC
192f : 69 c4 __ ADC #$c4
1931 : 85 30 __ STA P3 
1933 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
1936 : a9 00 __ LDA #$00
1938 : 85 47 __ STA T1 + 0 
.l2:
193a : 0a __ __ ASL
193b : 65 47 __ ADC T1 + 0 
193d : 0a __ __ ASL
193e : 0a __ __ ASL
193f : 18 __ __ CLC
1940 : 6d fa 42 ADC $42fa ; (FrameCount + 0)
1943 : aa __ __ TAX
1944 : bd 00 43 LDA $4300,x ; (sintab + 0)
1947 : a8 __ __ TAY
1948 : 29 80 __ AND #$80
194a : 10 02 __ BPL $194e ; (MoveSprites.l2 + 20)
194c : a9 ff __ LDA #$ff
194e : 85 49 __ STA T2 + 1 
1950 : a5 47 __ LDA T1 + 0 
1952 : 0a __ __ ASL
1953 : 0a __ __ ASL
1954 : 65 47 __ ADC T1 + 0 
1956 : 85 48 __ STA T2 + 0 
1958 : ad fa 42 LDA $42fa ; (FrameCount + 0)
195b : 38 __ __ SEC
195c : e9 40 __ SBC #$40
195e : 18 __ __ CLC
195f : 65 48 __ ADC T2 + 0 
1961 : aa __ __ TAX
1962 : bd 00 43 LDA $4300,x ; (sintab + 0)
1965 : 85 4c __ STA T6 + 0 
1967 : a5 47 __ LDA T1 + 0 
1969 : 0a __ __ ASL
196a : 0a __ __ ASL
196b : 0a __ __ ASL
196c : 85 48 __ STA T2 + 0 
196e : ad fa 42 LDA $42fa ; (FrameCount + 0)
1971 : 38 __ __ SEC
1972 : e9 20 __ SBC #$20
1974 : 18 __ __ CLC
1975 : 65 48 __ ADC T2 + 0 
1977 : aa __ __ TAX
1978 : bd 00 43 LDA $4300,x ; (sintab + 0)
197b : 4a __ __ LSR
197c : 4a __ __ LSR
197d : 4a __ __ LSR
197e : 4a __ __ LSR
197f : 49 08 __ EOR #$08
1981 : 38 __ __ SEC
1982 : e9 08 __ SBC #$08
1984 : 85 4a __ STA T3 + 0 
1986 : a9 00 __ LDA #$00
1988 : e9 00 __ SBC #$00
198a : 85 4b __ STA T3 + 1 
198c : 18 __ __ CLC
198d : a5 47 __ LDA T1 + 0 
198f : 69 4f __ ADC #$4f
1991 : 85 2d __ STA P0 
1993 : 98 __ __ TYA
1994 : 18 __ __ CLC
1995 : 6d fa 42 ADC $42fa ; (FrameCount + 0)
1998 : 85 48 __ STA T2 + 0 
199a : a5 49 __ LDA T2 + 1 
199c : 6d fb 42 ADC $42fb ; (FrameCount + 1)
199f : 85 49 __ STA T2 + 1 
19a1 : a5 47 __ LDA T1 + 0 
19a3 : 0a __ __ ASL
19a4 : 0a __ __ ASL
19a5 : 85 3b __ STA ACCU + 0 
19a7 : a9 00 __ LDA #$00
19a9 : 85 3c __ STA ACCU + 1 
19ab : a9 80 __ LDA #$80
19ad : 85 23 __ STA WORK + 0 
19af : a9 02 __ LDA #$02
19b1 : 85 24 __ STA WORK + 1 
19b3 : 20 a5 1d JSR $1da5 ; (divmod + 0)
19b6 : 18 __ __ CLC
19b7 : a5 25 __ LDA WORK + 2 
19b9 : 65 48 __ ADC T2 + 0 
19bb : 85 2e __ STA P1 
19bd : a5 26 __ LDA WORK + 3 
19bf : 65 49 __ ADC T2 + 1 
19c1 : 85 2f __ STA P2 
19c3 : a5 4c __ LDA T6 + 0 
19c5 : 29 80 __ AND #$80
19c7 : 10 02 __ BPL $19cb ; (MoveSprites.l2 + 145)
19c9 : a9 ff __ LDA #$ff
19cb : aa __ __ TAX
19cc : a5 47 __ LDA T1 + 0 
19ce : 0a __ __ ASL
19cf : 65 47 __ ADC T1 + 0 
19d1 : 85 3b __ STA ACCU + 0 
19d3 : a5 47 __ LDA T1 + 0 
19d5 : c9 1f __ CMP #$1f
19d7 : f0 28 __ BEQ $1a01 ; (MoveSprites.s5 + 0)
.s6:
19d9 : 18 __ __ CLC
19da : a5 4c __ LDA T6 + 0 
19dc : 69 80 __ ADC #$80
19de : 18 __ __ CLC
19df : 65 4a __ ADC T3 + 0 
19e1 : a8 __ __ TAY
19e2 : a9 00 __ LDA #$00
19e4 : 65 4b __ ADC T3 + 1 
19e6 : aa __ __ TAX
19e7 : 98 __ __ TYA
19e8 : 18 __ __ CLC
19e9 : 65 3b __ ADC ACCU + 0 
19eb : 85 30 __ STA P3 
19ed : 90 01 __ BCC $19f0 ; (MoveSprites.s1009 + 0)
.s1008:
19ef : e8 __ __ INX
.s1009:
19f0 : 86 31 __ STX P4 
19f2 : 20 5f 17 JSR $175f ; (vera_spr_move.s0 + 0)
19f5 : e6 47 __ INC T1 + 0 
19f7 : a5 47 __ LDA T1 + 0 
19f9 : c9 20 __ CMP #$20
19fb : b0 03 __ BCS $1a00 ; (MoveSprites.s1001 + 0)
19fd : 4c 3a 19 JMP $193a ; (MoveSprites.l2 + 0)
.s1001:
1a00 : 60 __ __ RTS
.s5:
1a01 : 18 __ __ CLC
1a02 : a5 4c __ LDA T6 + 0 
1a04 : 69 78 __ ADC #$78
1a06 : 90 01 __ BCC $1a09 ; (MoveSprites.s1011 + 0)
.s1010:
1a08 : e8 __ __ INX
.s1011:
1a09 : 18 __ __ CLC
1a0a : 65 4a __ ADC T3 + 0 
1a0c : a8 __ __ TAY
1a0d : 8a __ __ TXA
1a0e : 65 4b __ ADC T3 + 1 
1a10 : aa __ __ TAX
1a11 : 98 __ __ TYA
1a12 : 18 __ __ CLC
1a13 : 65 3b __ ADC ACCU + 0 
1a15 : 85 30 __ STA P3 
1a17 : 90 01 __ BCC $1a1a ; (MoveSprites.s1007 + 0)
.s1006:
1a19 : e8 __ __ INX
.s1007:
1a1a : 86 31 __ STX P4 
1a1c : 4c 5f 17 JMP $175f ; (vera_spr_move.s0 + 0)
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
42fa : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1a1f : a9 08 __ LDA #$08
1a21 : 8d 2c 9f STA $9f2c 
1a24 : 20 4e 1a JSR $1a4e ; (zsm_check.s0 + 0)
1a27 : 09 00 __ ORA #$00
1a29 : f0 17 __ BEQ $1a42 ; (PlayZSM.s1001 + 0)
.s1:
1a2b : a5 33 __ LDA P6 ; (TuneSelection + 1)
1a2d : 05 32 __ ORA P5 ; (TuneSelection + 0)
1a2f : d0 07 __ BNE $1a38 ; (PlayZSM.s9 + 0)
.s5:
1a31 : a9 1b __ LDA #$1b
1a33 : a0 bf __ LDY #$bf
1a35 : 4c 47 1a JMP $1a47 ; (PlayZSM.s13 + 0)
.s9:
1a38 : a5 33 __ LDA P6 ; (TuneSelection + 1)
1a3a : d0 06 __ BNE $1a42 ; (PlayZSM.s1001 + 0)
.s1002:
1a3c : a5 32 __ LDA P5 ; (TuneSelection + 0)
1a3e : c9 01 __ CMP #$01
1a40 : f0 01 __ BEQ $1a43 ; (PlayZSM.s7 + 0)
.s1001:
1a42 : 60 __ __ RTS
.s7:
1a43 : a9 1c __ LDA #$1c
1a45 : a0 00 __ LDY #$00
.s13:
1a47 : 84 30 __ STY P3 
1a49 : 85 31 __ STA P4 
1a4b : 4c 52 1a JMP $1a52 ; (zsm_init.s0 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1a4e : ad 54 1e LDA $1e54 ; (zsm_finished + 0)
.s1001:
1a51 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
1a52 : a9 01 __ LDA #$01
1a54 : 8d 54 1e STA $1e54 ; (zsm_finished + 0)
1a57 : ad ff 23 LDA $23ff ; (zsm_reading + 0)
1a5a : f0 0a __ BEQ $1a66 ; (zsm_init.s3 + 0)
.s1:
1a5c : a9 02 __ LDA #$02
1a5e : 20 ab 1a JSR $1aab ; (krnio_close.s1000 + 0)
1a61 : a9 00 __ LDA #$00
1a63 : 8d ff 23 STA $23ff ; (zsm_reading + 0)
.s3:
1a66 : 8d de 4f STA $4fde ; (zsm_pos + 0)
1a69 : 8d df 4f STA $4fdf ; (zsm_pos + 1)
1a6c : 8d e0 4f STA $4fe0 ; (zsm_wpos + 0)
1a6f : 8d e1 4f STA $4fe1 ; (zsm_wpos + 1)
1a72 : 8d dd 4b STA $4bdd ; (zsm_delay + 0)
1a75 : a5 30 __ LDA P3 ; (fname + 0)
1a77 : 85 2d __ STA P0 
1a79 : a5 31 __ LDA P4 ; (fname + 1)
1a7b : 85 2e __ STA P1 
1a7d : 20 b3 1a JSR $1ab3 ; (krnio_setnam.s0 + 0)
1a80 : a9 02 __ LDA #$02
1a82 : 85 2d __ STA P0 
1a84 : 85 2f __ STA P2 
1a86 : a9 08 __ LDA #$08
1a88 : 85 2e __ STA P1 
1a8a : 20 c9 1a JSR $1ac9 ; (krnio_open.s0 + 0)
1a8d : a5 3b __ LDA ACCU + 0 
1a8f : f0 19 __ BEQ $1aaa ; (zsm_init.s1001 + 0)
.s4:
1a91 : a9 01 __ LDA #$01
1a93 : 8d ff 23 STA $23ff ; (zsm_reading + 0)
1a96 : 20 f1 1a JSR $1af1 ; (zsm_fill.s0 + 0)
1a99 : a9 10 __ LDA #$10
1a9b : 8d de 4f STA $4fde ; (zsm_pos + 0)
1a9e : a9 00 __ LDA #$00
1aa0 : 8d df 4f STA $4fdf ; (zsm_pos + 1)
1aa3 : 8d 54 1e STA $1e54 ; (zsm_finished + 0)
1aa6 : a9 01 __ LDA #$01
1aa8 : 85 3b __ STA ACCU + 0 
.s1001:
1aaa : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
23ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
1aab : 85 2d __ STA P0 
.s0:
1aad : a5 2d __ LDA P0 
1aaf : 20 c3 ff JSR $ffc3 
.s1001:
1ab2 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
4fe0 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
1ab3 : a5 2d __ LDA P0 
1ab5 : 05 2e __ ORA P1 
1ab7 : f0 08 __ BEQ $1ac1 ; (krnio_setnam.s0 + 14)
1ab9 : a0 ff __ LDY #$ff
1abb : c8 __ __ INY
1abc : b1 2d __ LDA (P0),y 
1abe : d0 fb __ BNE $1abb ; (krnio_setnam.s0 + 8)
1ac0 : 98 __ __ TYA
1ac1 : a6 2d __ LDX P0 
1ac3 : a4 2e __ LDY P1 
1ac5 : 20 bd ff JSR $ffbd 
.s1001:
1ac8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1ac9 : a9 00 __ LDA #$00
1acb : a6 2d __ LDX P0 ; (fnum + 0)
1acd : 9d e2 4f STA $4fe2,x ; (krnio_pstatus + 0)
1ad0 : a9 00 __ LDA #$00
1ad2 : 85 3b __ STA ACCU + 0 
1ad4 : 85 3c __ STA ACCU + 1 
1ad6 : a5 2d __ LDA P0 ; (fnum + 0)
1ad8 : a6 2e __ LDX P1 
1ada : a4 2f __ LDY P2 
1adc : 20 ba ff JSR $ffba 
1adf : 20 c0 ff JSR $ffc0 
1ae2 : 90 08 __ BCC $1aec ; (krnio_open.s0 + 35)
1ae4 : a5 2d __ LDA P0 ; (fnum + 0)
1ae6 : 20 c3 ff JSR $ffc3 
1ae9 : 4c f0 1a JMP $1af0 ; (krnio_open.s1001 + 0)
1aec : a9 01 __ LDA #$01
1aee : 85 3b __ STA ACCU + 0 
.s1001:
1af0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
4fe2 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
1af1 : ad ff 23 LDA $23ff ; (zsm_reading + 0)
1af4 : f0 20 __ BEQ $1b16 ; (zsm_fill.s1 + 0)
.s2:
1af6 : ad df 4f LDA $4fdf ; (zsm_pos + 1)
1af9 : 18 __ __ CLC
1afa : 69 04 __ ADC #$04
1afc : cd e1 4f CMP $4fe1 ; (zsm_wpos + 1)
1aff : d0 0c __ BNE $1b0d ; (zsm_fill.s6 + 0)
.s1006:
1b01 : ad e0 4f LDA $4fe0 ; (zsm_wpos + 0)
1b04 : cd de 4f CMP $4fde ; (zsm_pos + 0)
1b07 : d0 04 __ BNE $1b0d ; (zsm_fill.s6 + 0)
.s5:
1b09 : a9 00 __ LDA #$00
1b0b : f0 0b __ BEQ $1b18 ; (zsm_fill.s1008 + 0)
.s6:
1b0d : a9 02 __ LDA #$02
1b0f : 20 95 1b JSR $1b95 ; (krnio_chkin.s1000 + 0)
1b12 : a5 3b __ LDA ACCU + 0 
1b14 : d0 07 __ BNE $1b1d ; (zsm_fill.s9 + 0)
.s1:
1b16 : a9 ff __ LDA #$ff
.s1008:
1b18 : 85 3b __ STA ACCU + 0 
.s1001:
1b1a : 85 3c __ STA ACCU + 1 
1b1c : 60 __ __ RTS
.s9:
1b1d : a9 00 __ LDA #$00
1b1f : 85 47 __ STA T1 + 0 
1b21 : 85 48 __ STA T1 + 1 
1b23 : ad df 4f LDA $4fdf ; (zsm_pos + 1)
1b26 : 18 __ __ CLC
1b27 : 69 04 __ ADC #$04
1b29 : cd e1 4f CMP $4fe1 ; (zsm_wpos + 1)
1b2c : d0 08 __ BNE $1b36 ; (zsm_fill.l13 + 0)
.s1002:
1b2e : ad e0 4f LDA $4fe0 ; (zsm_wpos + 0)
1b31 : cd de 4f CMP $4fde ; (zsm_pos + 0)
1b34 : f0 49 __ BEQ $1b7f ; (zsm_fill.s37 + 0)
.l13:
1b36 : 20 a7 1b JSR $1ba7 ; (krnio_chrin.s0 + 0)
1b39 : ad e0 4f LDA $4fe0 ; (zsm_wpos + 0)
1b3c : aa __ __ TAX
1b3d : 18 __ __ CLC
1b3e : 69 01 __ ADC #$01
1b40 : 8d e0 4f STA $4fe0 ; (zsm_wpos + 0)
1b43 : ad e1 4f LDA $4fe1 ; (zsm_wpos + 1)
1b46 : a8 __ __ TAY
1b47 : 69 00 __ ADC #$00
1b49 : 8d e1 4f STA $4fe1 ; (zsm_wpos + 1)
1b4c : 8a __ __ TXA
1b4d : 18 __ __ CLC
1b4e : 69 de __ ADC #$de
1b50 : 85 49 __ STA T3 + 0 
1b52 : 98 __ __ TYA
1b53 : 29 03 __ AND #$03
1b55 : 69 4b __ ADC #$4b
1b57 : 85 4a __ STA T3 + 1 
1b59 : a5 3b __ LDA ACCU + 0 
1b5b : a0 00 __ LDY #$00
1b5d : 91 49 __ STA (T3 + 0),y 
1b5f : e6 47 __ INC T1 + 0 
1b61 : d0 02 __ BNE $1b65 ; (zsm_fill.s1010 + 0)
.s1009:
1b63 : e6 48 __ INC T1 + 1 
.s1010:
1b65 : 20 b1 1b JSR $1bb1 ; (krnio_status.s0 + 0)
1b68 : a5 3b __ LDA ACCU + 0 
1b6a : d0 0e __ BNE $1b7a ; (zsm_fill.s15 + 0)
.s12:
1b6c : ad df 4f LDA $4fdf ; (zsm_pos + 1)
1b6f : 18 __ __ CLC
1b70 : 69 04 __ ADC #$04
1b72 : cd e1 4f CMP $4fe1 ; (zsm_wpos + 1)
1b75 : d0 bf __ BNE $1b36 ; (zsm_fill.l13 + 0)
1b77 : 4c 2e 1b JMP $1b2e ; (zsm_fill.s1002 + 0)
.s15:
1b7a : a9 00 __ LDA #$00
1b7c : 8d ff 23 STA $23ff ; (zsm_reading + 0)
.s37:
1b7f : 20 bb 1b JSR $1bbb ; (krnio_clrchn.s0 + 0)
1b82 : ad ff 23 LDA $23ff ; (zsm_reading + 0)
1b85 : d0 05 __ BNE $1b8c ; (zsm_fill.s21 + 0)
.s19:
1b87 : a9 02 __ LDA #$02
1b89 : 20 ab 1a JSR $1aab ; (krnio_close.s1000 + 0)
.s21:
1b8c : a5 47 __ LDA T1 + 0 
1b8e : 85 3b __ STA ACCU + 0 
1b90 : a5 48 __ LDA T1 + 1 
1b92 : 4c 1a 1b JMP $1b1a ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1b95 : 85 2d __ STA P0 
.s0:
1b97 : a6 2d __ LDX P0 
1b99 : 20 c6 ff JSR $ffc6 
1b9c : a9 00 __ LDA #$00
1b9e : 85 3c __ STA ACCU + 1 
1ba0 : b0 02 __ BCS $1ba4 ; (krnio_chkin.s0 + 13)
1ba2 : a9 01 __ LDA #$01
1ba4 : 85 3b __ STA ACCU + 0 
.s1001:
1ba6 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1ba7 : 20 cf ff JSR $ffcf 
1baa : 85 3b __ STA ACCU + 0 
1bac : a9 00 __ LDA #$00
1bae : 85 3c __ STA ACCU + 1 
.s1001:
1bb0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
1bb1 : 20 b7 ff JSR $ffb7 
1bb4 : 85 3b __ STA ACCU + 0 
1bb6 : a9 00 __ LDA #$00
1bb8 : 85 3c __ STA ACCU + 1 
.s1001:
1bba : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1bbb : 20 cc ff JSR $ffcc 
.s1001:
1bbe : 60 __ __ RTS
--------------------------------------------------------------------
1bbf : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1bcf : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
1c00 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
1c10 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
1c20 : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
PalTimer:
42fc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalFBlank:
4400 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
4410 : __ __ __ BYT 88 08 88 08 88 08 88 08 88 08 88 08 88 08 88 08 : ................
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1c25 : a9 10 __ LDA #$10
1c27 : 85 30 __ STA P3 
1c29 : a9 00 __ LDA #$00
1c2b : 85 31 __ STA P4 
1c2d : a5 32 __ LDA P5 ; (Palette + 0)
1c2f : 85 2e __ STA P1 
1c31 : 85 47 __ STA T0 + 0 
1c33 : a5 33 __ LDA P6 ; (Palette + 1)
1c35 : 85 2f __ STA P2 
1c37 : 85 48 __ STA T0 + 1 
1c39 : ad fc 9e LDA $9efc ; (sstack + 0)
1c3c : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1c3e : 0a __ __ ASL
1c3f : 85 49 __ STA T2 + 0 
1c41 : ad fd 9e LDA $9efd ; (sstack + 1)
1c44 : 2a __ __ ROL
1c45 : 18 __ __ CLC
1c46 : 65 33 __ ADC P6 ; (Palette + 1)
1c48 : 85 4a __ STA T2 + 1 
1c4a : a4 32 __ LDY P5 ; (Palette + 0)
1c4c : b1 49 __ LDA (T2 + 0),y 
1c4e : aa __ __ TAX
1c4f : c8 __ __ INY
1c50 : b1 49 __ LDA (T2 + 0),y 
1c52 : 86 49 __ STX T2 + 0 
1c54 : 85 4a __ STA T2 + 1 
1c56 : a9 00 __ LDA #$00
1c58 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1c5a : ad fe 9e LDA $9efe ; (sstack + 2)
1c5d : 85 4b __ STA T4 + 0 
1c5f : 38 __ __ SEC
1c60 : e9 01 __ SBC #$01
1c62 : 85 4d __ STA T5 + 0 
1c64 : ad ff 9e LDA $9eff ; (sstack + 3)
1c67 : 85 4c __ STA T4 + 1 
1c69 : e9 00 __ SBC #$00
1c6b : 85 4e __ STA T5 + 1 
1c6d : d0 06 __ BNE $1c75 ; (SetPaletteIndex.s5 + 0)
.s1004:
1c6f : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1c71 : c5 4d __ CMP T5 + 0 
1c73 : b0 38 __ BCS $1cad ; (SetPaletteIndex.s4 + 0)
.s5:
1c75 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1c77 : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1c79 : 18 __ __ CLC
1c7a : a5 32 __ LDA P5 ; (Palette + 0)
1c7c : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1c7e : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1c80 : a5 33 __ LDA P6 ; (Palette + 1)
1c82 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1c84 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1c86 : ae fc 9e LDX $9efc ; (sstack + 0)
.l2:
1c89 : a0 02 __ LDY #$02
1c8b : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1c8d : a0 00 __ LDY #$00
1c8f : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1c91 : a0 03 __ LDY #$03
1c93 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1c95 : a0 01 __ LDY #$01
1c97 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1c99 : 18 __ __ CLC
1c9a : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1c9c : 69 02 __ ADC #$02
1c9e : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1ca0 : 90 02 __ BCC $1ca4 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1ca2 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1ca4 : e8 __ __ INX
1ca5 : a5 4e __ LDA T5 + 1 
1ca7 : d0 e0 __ BNE $1c89 ; (SetPaletteIndex.l2 + 0)
.s1002:
1ca9 : e4 4d __ CPX T5 + 0 
1cab : 90 dc __ BCC $1c89 ; (SetPaletteIndex.l2 + 0)
.s4:
1cad : a5 4b __ LDA T4 + 0 
1caf : 0a __ __ ASL
1cb0 : aa __ __ TAX
1cb1 : a5 4c __ LDA T4 + 1 
1cb3 : 2a __ __ ROL
1cb4 : a8 __ __ TAY
1cb5 : 8a __ __ TXA
1cb6 : 38 __ __ SEC
1cb7 : e9 02 __ SBC #$02
1cb9 : b0 01 __ BCS $1cbc ; (SetPaletteIndex.s1010 + 0)
.s1009:
1cbb : 88 __ __ DEY
.s1010:
1cbc : 18 __ __ CLC
1cbd : 65 47 __ ADC T0 + 0 
1cbf : 85 47 __ STA T0 + 0 
1cc1 : 98 __ __ TYA
1cc2 : 65 48 __ ADC T0 + 1 
1cc4 : 85 48 __ STA T0 + 1 
1cc6 : a5 49 __ LDA T2 + 0 
1cc8 : a0 00 __ LDY #$00
1cca : 91 47 __ STA (T0 + 0),y 
1ccc : a5 4a __ LDA T2 + 1 
1cce : c8 __ __ INY
1ccf : 91 47 __ STA (T0 + 0),y 
1cd1 : a5 34 __ LDA P7 ; (index + 0)
1cd3 : 85 2d __ STA P0 
1cd5 : 4c d5 17 JMP $17d5 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
42fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4420 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4430 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
ShimmerState:
4440 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
BGPal:
4441 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : %.......&.....f.
4451 : __ __ __ BYT ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f : ................
--------------------------------------------------------------------
BGPalShimmer:
4461 : __ __ __ BYT 25 02 12 01 11 01 aa 0a 26 02 dd 0d bb 0b 66 06 : %.......&.....f.
4471 : __ __ __ BYT ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f : ................
--------------------------------------------------------------------
off1:
4481 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
Control:
.s0:
1cd8 : a5 31 __ LDA P4 ; (Input + 0)
1cda : c9 20 __ CMP #$20
1cdc : d0 1c __ BNE $1cfa ; (Control.s1007 + 0)
.s1:
1cde : a5 30 __ LDA P3 ; (playing + 0)
1ce0 : d0 0a __ BNE $1cec ; (Control.s4 + 0)
.s5:
1ce2 : a9 01 __ LDA #$01
1ce4 : 20 76 1d JSR $1d76 ; (zsm_irq_play.s0 + 0)
1ce7 : a9 01 __ LDA #$01
.s1001:
1ce9 : 85 3b __ STA ACCU + 0 
1ceb : 60 __ __ RTS
.s4:
1cec : a9 00 __ LDA #$00
1cee : cd 82 44 CMP $4482 ; (paused + 0)
1cf1 : 2a __ __ ROL
1cf2 : 85 2f __ STA P2 
1cf4 : 8d 82 44 STA $4482 ; (paused + 0)
1cf7 : 20 dd 1b JSR $1bdd ; (zsm_pause.s0 + 0)
.s1007:
1cfa : a5 30 __ LDA P3 ; (playing + 0)
1cfc : 4c e9 1c JMP $1ce9 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
4482 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
1bdd : a5 2f __ LDA P2 ; (pause + 0)
1bdf : d0 0e __ BNE $1bef ; (zsm_pause.s4 + 0)
.s8:
1be1 : ad 55 1e LDA $1e55 ; (zsm_paused + 0)
1be4 : f0 08 __ BEQ $1bee ; (zsm_pause.s1001 + 0)
.s5:
1be6 : 20 49 1d JSR $1d49 ; (zsm_restore_volume.s0 + 0)
1be9 : a9 00 __ LDA #$00
1beb : 8d 55 1e STA $1e55 ; (zsm_paused + 0)
.s1001:
1bee : 60 __ __ RTS
.s4:
1bef : ad 55 1e LDA $1e55 ; (zsm_paused + 0)
1bf2 : d0 fa __ BNE $1bee ; (zsm_pause.s1001 + 0)
.s1:
1bf4 : a9 01 __ LDA #$01
1bf6 : 8d 55 1e STA $1e55 ; (zsm_paused + 0)
1bf9 : 20 ff 1c JSR $1cff ; (zsm_silence.s0 + 0)
1bfc : 4c 17 1d JMP $1d17 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_silence:
.s0:
1cff : a9 00 __ LDA #$00
1d01 : 85 47 __ STA T0 + 0 
1d03 : a9 08 __ LDA #$08
1d05 : 85 2d __ STA P0 
1d07 : a9 00 __ LDA #$00
.l1006:
1d09 : 85 2e __ STA P1 
1d0b : 20 33 0d JSR $0d33 ; (sfx_put.l1 + 0)
1d0e : e6 47 __ INC T0 + 0 
1d10 : a5 47 __ LDA T0 + 0 
1d12 : c9 08 __ CMP #$08
1d14 : 90 f3 __ BCC $1d09 ; (zsm_silence.l1006 + 0)
.s1001:
1d16 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1d17 : a0 00 __ LDY #$00
1d19 : 84 3c __ STY ACCU + 1 
1d1b : a2 02 __ LDX #$02
1d1d : 18 __ __ CLC
.l1006:
1d1e : 8a __ __ TXA
1d1f : 09 c0 __ ORA #$c0
1d21 : 8d 20 9f STA $9f20 
1d24 : a5 3c __ LDA ACCU + 1 
1d26 : 09 f9 __ ORA #$f9
1d28 : 8d 21 9f STA $9f21 
1d2b : a9 01 __ LDA #$01
1d2d : 8d 22 9f STA $9f22 
1d30 : ad 23 9f LDA $9f23 
1d33 : 99 00 50 STA $5000,y ; (vera_volumes + 0)
1d36 : a9 00 __ LDA #$00
1d38 : 8d 23 9f STA $9f23 
1d3b : 8a __ __ TXA
1d3c : 69 04 __ ADC #$04
1d3e : aa __ __ TAX
1d3f : 90 02 __ BCC $1d43 ; (zsm_save_volume.s1009 + 0)
.s1008:
1d41 : e6 3c __ INC ACCU + 1 
.s1009:
1d43 : c8 __ __ INY
1d44 : c0 10 __ CPY #$10
1d46 : 90 d6 __ BCC $1d1e ; (zsm_save_volume.l1006 + 0)
.s1001:
1d48 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
5000 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
1d49 : a0 00 __ LDY #$00
1d4b : 84 3c __ STY ACCU + 1 
1d4d : a2 02 __ LDX #$02
1d4f : 18 __ __ CLC
.l1006:
1d50 : 8a __ __ TXA
1d51 : 09 c0 __ ORA #$c0
1d53 : 8d 20 9f STA $9f20 
1d56 : a5 3c __ LDA ACCU + 1 
1d58 : 09 f9 __ ORA #$f9
1d5a : 8d 21 9f STA $9f21 
1d5d : a9 01 __ LDA #$01
1d5f : 8d 22 9f STA $9f22 
1d62 : b9 00 50 LDA $5000,y ; (vera_volumes + 0)
1d65 : 8d 23 9f STA $9f23 
1d68 : 8a __ __ TXA
1d69 : 69 04 __ ADC #$04
1d6b : aa __ __ TAX
1d6c : 90 02 __ BCC $1d70 ; (zsm_restore_volume.s1009 + 0)
.s1008:
1d6e : e6 3c __ INC ACCU + 1 
.s1009:
1d70 : c8 __ __ INY
1d71 : c0 10 __ CPY #$10
1d73 : 90 db __ BCC $1d50 ; (zsm_restore_volume.l1006 + 0)
.s1001:
1d75 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1d76 : 8d 53 1e STA $1e53 ; (zsm_playing + 0)
.s1001:
1d79 : 60 __ __ RTS
--------------------------------------------------------------------
Song1:
4483 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4493 : __ __ __ BYT 0d 05 3a 20 22 10 01 10 05 12 03 0c 09 10 22 20 : ..: "........." 
44a3 : __ __ __ BYT 01 12 14 09 13 14 3a 20 22 0b 0f 0c 05 2d 0f 2d : ......: "....-.-
44b3 : __ __ __ BYT 02 0c 01 03 0b 22 20 2d 20 0c 05 0e 07 14 08 3a : ....." - ......:
44c3 : __ __ __ BYT 20 32 3a 35 39 20 2d 20 03 0f 0d 0d 05 0e 14 3a :  2:59 - .......:
44d3 : __ __ __ BYT 20 20 0f 12 09 07 09 0e 01 0c 0c 19 20 03 01 0c :   .......... ...
44e3 : __ __ __ BYT 0c 05 04 20 22 04 05 13 14 12 0f 19 22 2c 20 09 : ... ".......", .
44f3 : __ __ __ BYT 20 0d 01 04 05 20 14 08 09 13 20 14 12 01 03 0b :  .... .... .....
4503 : __ __ __ BYT 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 20 02 01 :  . ... ...... ..
4513 : __ __ __ BYT 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 01 13 20 : .. ......... .. 
4523 : __ __ __ BYT 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 19 20 32 : ..... .. ..... 2
4533 : __ __ __ BYT 31 35 31 20 13 0f 15 0e 04 20 04 05 13 09 07 0e : 151 ..... ......
4543 : __ __ __ BYT 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 20 01 20 : , ... .... .. . 
4553 : __ __ __ BYT 13 14 01 12 14 09 0e 07 20 10 0f 09 0e 14 20 06 : ........ ..... .
4563 : __ __ __ BYT 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 13 09 03 : .. .. ..16 .....
4573 : __ __ __ BYT 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 12 01 0c :  .... .. .......
4583 : __ __ __ BYT 2e 20 09 06 20 19 0f 15 27 12 05 20 06 12 0f 0d : . .. ...'.. ....
4593 : __ __ __ BYT 20 14 08 05 20 13 08 01 12 10 20 18 36 38 0b 20 :  ... ..... .68. 
45a3 : __ __ __ BYT 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 07 08 14 : ....., ... .....
45b3 : __ __ __ BYT 20 02 05 20 01 02 0c 05 20 14 0f 20 13 10 0f 14 :  .. .... .. ....
45c3 : __ __ __ BYT 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 05 20 02 :  ... ......... .
45d3 : __ __ __ BYT 05 14 17 05 05 0e 20 14 08 09 13 20 14 12 01 03 : ...... .... ....
45e3 : __ __ __ BYT 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 20 22 0d : . ... .....'. ".
45f3 : __ __ __ BYT 15 14 13 15 12 01 04 01 09 0b 0f 22 2f 22 0d 15 : ..........."/"..
4603 : __ __ __ BYT 14 1a 12 01 04 22 20 14 12 01 03 0b 20 06 12 0f : ....." ..... ...
4613 : __ __ __ BYT 0d 20 14 08 05 09 12 20 04 12 15 0d 20 04 01 05 : . ..... .... ...
4623 : __ __ __ BYT 0d 0f 0e 20 01 0c 02 15 0d 2e 20 14 08 01 14 27 : ... ...... ....'
4633 : __ __ __ BYT 13 20 0e 0f 14 20 01 20 03 0f 09 0e 03 09 04 05 : . ... . ........
4643 : __ __ __ BYT 0e 03 05 3b 20 0f 0e 05 20 0f 06 20 0d 19 20 07 : ...; ... .. .. .
4653 : __ __ __ BYT 0f 01 0c 13 20 09 0e 20 14 08 05 20 03 18 31 36 : .... .. ... ..16
4663 : __ __ __ BYT 20 13 03 05 0e 05 20 2a 09 13 2a 20 14 0f 20 02 :  ..... *..* .. .
4673 : __ __ __ BYT 05 20 28 14 0f 20 01 0e 20 05 18 14 05 0e 14 29 : . (.. .. ......)
4683 : __ __ __ BYT 20 09 14 13 20 08 09 1a 0d 09 2e 20 28 0f 12 20 :  ... ...... (.. 
4693 : __ __ __ BYT 12 05 01 0c 0c 19 20 01 0e 19 20 0f 06 20 14 08 : ...... ... .. ..
46a3 : __ __ __ BYT 05 20 18 36 38 0b 20 08 01 12 04 03 0f 12 05 20 : . .68. ........ 
46b3 : __ __ __ BYT 14 05 03 08 0e 0f 20 01 06 06 09 03 09 0f 0e 01 : ...... .........
46c3 : __ __ __ BYT 04 0f 13 29 20 14 08 05 20 0e 01 0d 05 3f 20 09 : ...) ... ....? .
46d3 : __ __ __ BYT 20 13 15 10 10 0f 13 05 20 09 14 27 13 20 01 20 :  ....... ..'. . 
46e3 : __ __ __ BYT 13 0f 0e 07 20 14 0f 20 12 05 0f 10 05 0e 20 0f : .... .. ...... .
46f3 : __ __ __ BYT 0c 04 20 04 01 16 09 04 20 0d 15 12 12 01 19 20 : .. ..... ...... 
4703 : __ __ __ BYT 17 0f 15 0e 04 13 20 14 0f 2e 20 14 08 05 20 03 : ...... ... ... .
4713 : __ __ __ BYT 0c 09 10 10 09 0e 07 20 01 0e 04 20 14 08 05 20 : ....... ... ... 
4723 : __ __ __ BYT 0c 0f 15 04 0e 05 13 13 20 3f 20 09 14 27 13 20 : ........ ? ..'. 
4733 : __ __ __ BYT 09 0e 14 05 0e 14 09 0f 0e 01 0c 2e 20 09 20 12 : ............ . .
4743 : __ __ __ BYT 05 03 01 0c 0c 20 13 08 05 05 10 09 13 08 0c 19 : ..... ..........
4753 : __ __ __ BYT 20 13 08 0f 17 09 0e 07 20 01 20 10 12 05 16 09 :  ....... . .....
4763 : __ __ __ BYT 05 17 20 14 08 09 13 20 14 12 01 03 0b 20 14 0f : .. .... ..... ..
4773 : __ __ __ BYT 20 0d 19 20 05 18 14 12 01 03 15 12 12 09 03 15 :  .. ............
4783 : __ __ __ BYT 0c 01 12 20 13 0f 15 0e 04 20 01 12 14 13 20 01 : ... ..... .... .
4793 : __ __ __ BYT 03 14 09 16 09 14 19 20 10 12 0f 06 05 13 13 0f : ....... ........
47a3 : __ __ __ BYT 12 20 17 08 09 0c 05 20 04 0f 09 0e 07 20 01 0e : . ..... ..... ..
47b3 : __ __ __ BYT 20 09 0e 14 12 0f 04 15 03 14 09 0f 0e 20 14 0f :  ............ ..
47c3 : __ __ __ BYT 20 07 05 0e 05 12 01 14 09 0e 07 20 13 0f 15 0e :  .......... ....
47d3 : __ __ __ BYT 04 20 0f 02 0a 05 03 14 13 20 01 06 14 05 12 20 : . ....... ..... 
47e3 : __ __ __ BYT 08 05 20 01 13 0b 05 04 20 15 13 20 09 06 20 01 : .. ..... .. .. .
47f3 : __ __ __ BYT 0e 19 20 0f 06 20 15 13 20 04 09 04 20 01 0e 19 : .. .. .. ... ...
4803 : __ __ __ BYT 14 08 09 0e 07 20 09 0e 20 14 05 12 0d 13 20 0f : ..... .. ..... .
4813 : __ __ __ BYT 06 20 03 0f 0d 10 0f 13 09 14 09 0f 0e 2e 20 13 : . ............ .
4823 : __ __ __ BYT 15 06 06 09 03 05 20 14 0f 20 13 01 19 2c 20 08 : ...... .. ..., .
4833 : __ __ __ BYT 05 20 04 09 04 20 0c 09 0b 05 20 09 14 20 04 05 : . ... .... .. ..
4843 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 14 : ..... ... .... .
4853 : __ __ __ BYT 08 01 14 20 09 14 20 17 01 13 20 0d 0f 13 14 0c : ... .. ... .....
4863 : __ __ __ BYT 19 20 01 04 0a 01 03 05 0e 14 20 14 0f 20 14 05 : . ........ .. ..
4873 : __ __ __ BYT 03 08 0e 0f 28 10 01 12 14 09 03 15 0c 01 12 0c : ....(...........
4883 : __ __ __ BYT 19 20 08 0f 15 13 05 01 0e 04 20 08 01 12 04 03 : . ........ .....
4893 : __ __ __ BYT 0f 12 05 29 2c 20 17 08 09 0c 05 20 0d 0f 13 14 : ...), ..... ....
48a3 : __ __ __ BYT 20 0f 06 20 14 08 05 20 13 14 19 0c 09 0e 07 13 :  .. ... ........
48b3 : __ __ __ BYT 20 02 05 09 0e 07 20 14 01 15 07 08 14 20 17 05 :  ..... ...... ..
48c3 : __ __ __ BYT 12 05 20 0d 0f 13 14 0c 19 20 09 0e 20 14 08 05 : .. ...... .. ...
48d3 : __ __ __ BYT 20 06 09 05 0c 04 20 0f 06 20 01 16 01 0e 14 07 :  ..... .. ......
48e3 : __ __ __ BYT 01 12 04 05 2e 20 01 0e 0f 14 08 05 12 20 10 01 : ..... ....... ..
48f3 : __ __ __ BYT 12 14 09 03 15 0c 01 12 0c 19 20 06 15 0e 0e 19 : .......... .....
4903 : __ __ __ BYT 20 13 14 0f 12 19 20 01 02 0f 15 14 20 14 08 09 :  ..... ..... ...
4913 : __ __ __ BYT 13 20 14 12 01 03 0b 20 17 01 13 20 08 0f 17 20 : . ..... ... ... 
4923 : __ __ __ BYT 09 14 20 05 16 05 0e 20 07 0f 14 20 0f 0e 14 0f : .. .... ... ....
4933 : __ __ __ BYT 20 14 08 09 13 20 0d 15 13 09 03 04 09 13 0b 3a :  .... .........:
4943 : __ __ __ BYT 20 09 20 06 09 12 13 14 20 10 0f 13 14 05 04 20 :  . ..... ...... 
4953 : __ __ __ BYT 09 14 20 09 0e 20 14 08 05 20 0d 15 13 09 03 20 : .. .. ... ..... 
4963 : __ __ __ BYT 13 08 01 12 09 0e 07 20 03 08 01 0e 0e 05 0c 20 : ....... ....... 
4973 : __ __ __ BYT 0f 06 20 14 08 05 20 03 0f 0d 0d 01 0e 04 05 12 : .. ... .........
4983 : __ __ __ BYT 20 18 31 36 20 04 09 13 03 0f 12 04 13 2c 20 17 :  .16 ........, .
4993 : __ __ __ BYT 08 09 03 08 20 14 08 05 0e 20 03 01 15 07 08 14 : .... .... ......
49a3 : __ __ __ BYT 20 14 08 05 20 05 01 12 13 20 01 0e 04 20 05 19 :  ... .... ... ..
49b3 : __ __ __ BYT 05 13 20 0f 06 20 03 12 09 13 10 13 2c 20 17 08 : .. .. ......, ..
49c3 : __ __ __ BYT 0f 20 14 08 05 0e 20 01 13 0b 05 04 20 0d 05 20 : . .... ..... .. 
49d3 : __ __ __ BYT 09 06 20 08 05 20 03 0f 15 0c 04 20 15 13 05 20 : .. .. ..... ... 
49e3 : __ __ __ BYT 09 14 20 06 0f 12 20 14 08 09 13 20 0d 15 13 09 : .. ... .... ....
49f3 : __ __ __ BYT 03 04 09 13 0b 2e 20 14 08 09 13 20 01 03 14 15 : ...... .... ....
4a03 : __ __ __ BYT 01 0c 0c 19 20 0d 0f 14 09 16 01 14 05 04 20 0d : .... ......... .
4a13 : __ __ __ BYT 05 20 14 0f 20 06 09 0e 09 13 08 20 09 14 2c 20 : . .. ...... .., 
4a23 : __ __ __ BYT 14 08 0f 15 07 08 20 09 20 08 09 14 20 0f 0e 05 : ...... . ... ...
4a33 : __ __ __ BYT 20 0d 01 0a 0f 12 20 12 0f 01 04 02 0c 0f 03 0b :  ..... .........
4a43 : __ __ __ BYT 20 17 08 05 0e 20 09 20 03 0f 15 0c 04 0e 27 14 :  .... . ......'.
4a53 : __ __ __ BYT 20 0f 10 14 09 0d 09 1a 05 20 09 14 20 05 0e 0f :  ........ .. ...
4a63 : __ __ __ BYT 15 07 08 20 14 0f 20 05 0e 13 15 12 05 20 0e 0f : ... .. ...... ..
4a73 : __ __ __ BYT 20 02 01 0e 0b 09 0e 07 20 17 0f 15 0c 04 20 02 :  ....... ..... .
4a83 : __ __ __ BYT 05 20 0e 05 05 04 05 04 20 02 05 03 01 15 13 05 : . ...... .......
4a93 : __ __ __ BYT 20 14 08 05 20 1a 13 0d 20 06 0f 12 0d 01 14 20 :  ... ... ...... 
4aa3 : __ __ __ BYT 09 13 20 01 0e 20 15 14 14 05 12 20 06 15 03 0b : .. .. ..... ....
4ab3 : __ __ __ BYT 09 0e 07 20 0a 0f 0b 05 2e 20 28 0e 0f 20 13 08 : ... ..... (.. ..
4ac3 : __ __ __ BYT 09 14 20 09 14 27 13 20 11 15 09 14 05 20 0c 09 : .. ..'. ..... ..
4ad3 : __ __ __ BYT 14 05 12 01 0c 0c 19 20 0a 15 13 14 20 16 07 0d : ....... .... ...
4ae3 : __ __ __ BYT 20 01 0c 0c 20 0f 16 05 12 20 01 07 01 09 0e 29 :  ... .... .....)
4af3 : __ __ __ BYT 20 05 09 14 08 05 12 20 17 01 19 2c 20 09 27 0d :  ...... ..., .'.
4b03 : __ __ __ BYT 20 0c 0f 0f 0b 09 0e 07 20 06 0f 12 17 01 12 04 :  ....... .......
4b13 : __ __ __ BYT 20 14 0f 20 04 0f 09 0e 07 20 0d 0f 12 05 20 32 :  .. ..... .... 2
4b23 : __ __ __ BYT 31 35 31 20 13 0f 15 0e 04 20 09 0e 20 14 08 05 : 151 ..... .. ...
4b33 : __ __ __ BYT 20 06 15 14 15 12 05 2c 20 01 13 20 14 08 09 13 :  ......, .. ....
4b43 : __ __ __ BYT 20 17 01 13 20 04 05 06 09 0e 09 14 05 0c 19 20 :  ... .......... 
4b53 : __ __ __ BYT 01 20 06 15 0e 20 05 18 10 05 12 09 05 0e 03 05 : . ... ..........
4b63 : __ __ __ BYT 2e 20 28 05 18 03 05 10 14 20 06 0f 12 20 03 12 : . (...... ... ..
4b73 : __ __ __ BYT 09 13 10 13 27 20 12 09 04 09 03 15 0c 0f 15 13 : ....' ..........
4b83 : __ __ __ BYT 20 04 05 02 15 07 07 09 0e 07 20 14 09 0d 05 20 :  ......... .... 
4b93 : __ __ __ BYT 13 09 0e 0b 2c 20 02 15 14 20 09 20 03 01 0e 20 : ...., ... . ... 
4ba3 : __ __ __ BYT 06 0f 12 07 09 16 05 20 14 08 01 14 20 13 09 0e : ....... .... ...
4bb3 : __ __ __ BYT 03 05 20 09 14 27 13 20 08 09 13 20 06 09 12 13 : .. ..'. ... ....
4bc3 : __ __ __ BYT 14 20 14 09 0d 05 20 09 20 14 08 09 0e 0b 29 20 : . .... . .....) 
4bd3 : __ __ __ BYT 3d 20 3d 20 2d 20 2d 00                         : = = - -.
--------------------------------------------------------------------
frame_wait:
.l1:
1d7a : ad 26 9f LDA $9f26 
1d7d : 29 40 __ AND #$40
1d7f : d0 f9 __ BNE $1d7a ; (frame_wait.l1 + 0)
.l4:
1d81 : ad 26 9f LDA $9f26 
1d84 : 29 40 __ AND #$40
1d86 : f0 f9 __ BEQ $1d81 ; (frame_wait.l4 + 0)
.s1001:
1d88 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1d89 : 38 __ __ SEC
1d8a : a9 00 __ LDA #$00
1d8c : e5 3b __ SBC ACCU + 0 
1d8e : 85 3b __ STA ACCU + 0 
1d90 : a9 00 __ LDA #$00
1d92 : e5 3c __ SBC ACCU + 1 
1d94 : 85 3c __ STA ACCU + 1 
1d96 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1d97 : 38 __ __ SEC
1d98 : a9 00 __ LDA #$00
1d9a : e5 23 __ SBC WORK + 0 
1d9c : 85 23 __ STA WORK + 0 
1d9e : a9 00 __ LDA #$00
1da0 : e5 24 __ SBC WORK + 1 
1da2 : 85 24 __ STA WORK + 1 
1da4 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1da5 : a5 3c __ LDA ACCU + 1 
1da7 : d0 31 __ BNE $1dda ; (divmod + 53)
1da9 : a5 24 __ LDA WORK + 1 
1dab : d0 1e __ BNE $1dcb ; (divmod + 38)
1dad : 85 26 __ STA WORK + 3 
1daf : a2 04 __ LDX #$04
1db1 : 06 3b __ ASL ACCU + 0 
1db3 : 2a __ __ ROL
1db4 : c5 23 __ CMP WORK + 0 
1db6 : 90 02 __ BCC $1dba ; (divmod + 21)
1db8 : e5 23 __ SBC WORK + 0 
1dba : 26 3b __ ROL ACCU + 0 
1dbc : 2a __ __ ROL
1dbd : c5 23 __ CMP WORK + 0 
1dbf : 90 02 __ BCC $1dc3 ; (divmod + 30)
1dc1 : e5 23 __ SBC WORK + 0 
1dc3 : 26 3b __ ROL ACCU + 0 
1dc5 : ca __ __ DEX
1dc6 : d0 eb __ BNE $1db3 ; (divmod + 14)
1dc8 : 85 25 __ STA WORK + 2 
1dca : 60 __ __ RTS
1dcb : a5 3b __ LDA ACCU + 0 
1dcd : 85 25 __ STA WORK + 2 
1dcf : a5 3c __ LDA ACCU + 1 
1dd1 : 85 26 __ STA WORK + 3 
1dd3 : a9 00 __ LDA #$00
1dd5 : 85 3b __ STA ACCU + 0 
1dd7 : 85 3c __ STA ACCU + 1 
1dd9 : 60 __ __ RTS
1dda : a5 24 __ LDA WORK + 1 
1ddc : d0 1f __ BNE $1dfd ; (divmod + 88)
1dde : a5 23 __ LDA WORK + 0 
1de0 : 30 1b __ BMI $1dfd ; (divmod + 88)
1de2 : a9 00 __ LDA #$00
1de4 : 85 26 __ STA WORK + 3 
1de6 : a2 10 __ LDX #$10
1de8 : 06 3b __ ASL ACCU + 0 
1dea : 26 3c __ ROL ACCU + 1 
1dec : 2a __ __ ROL
1ded : c5 23 __ CMP WORK + 0 
1def : 90 02 __ BCC $1df3 ; (divmod + 78)
1df1 : e5 23 __ SBC WORK + 0 
1df3 : 26 3b __ ROL ACCU + 0 
1df5 : 26 3c __ ROL ACCU + 1 
1df7 : ca __ __ DEX
1df8 : d0 f2 __ BNE $1dec ; (divmod + 71)
1dfa : 85 25 __ STA WORK + 2 
1dfc : 60 __ __ RTS
1dfd : a9 00 __ LDA #$00
1dff : 85 25 __ STA WORK + 2 
1e01 : 85 26 __ STA WORK + 3 
1e03 : 84 22 __ STY $22 
1e05 : a0 10 __ LDY #$10
1e07 : 18 __ __ CLC
1e08 : 26 3b __ ROL ACCU + 0 
1e0a : 26 3c __ ROL ACCU + 1 
1e0c : 26 25 __ ROL WORK + 2 
1e0e : 26 26 __ ROL WORK + 3 
1e10 : 38 __ __ SEC
1e11 : a5 25 __ LDA WORK + 2 
1e13 : e5 23 __ SBC WORK + 0 
1e15 : aa __ __ TAX
1e16 : a5 26 __ LDA WORK + 3 
1e18 : e5 24 __ SBC WORK + 1 
1e1a : 90 04 __ BCC $1e20 ; (divmod + 123)
1e1c : 86 25 __ STX WORK + 2 
1e1e : 85 26 __ STA WORK + 3 
1e20 : 88 __ __ DEY
1e21 : d0 e5 __ BNE $1e08 ; (divmod + 99)
1e23 : 26 3b __ ROL ACCU + 0 
1e25 : 26 3c __ ROL ACCU + 1 
1e27 : a4 22 __ LDY $22 
1e29 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1e2a : 24 3c __ BIT ACCU + 1 
1e2c : 10 0d __ BPL $1e3b ; (mods16 + 17)
1e2e : 20 89 1d JSR $1d89 ; (negaccu + 0)
1e31 : 24 24 __ BIT WORK + 1 
1e33 : 10 0d __ BPL $1e42 ; (mods16 + 24)
1e35 : 20 97 1d JSR $1d97 ; (negtmp + 0)
1e38 : 4c a5 1d JMP $1da5 ; (divmod + 0)
1e3b : 24 24 __ BIT WORK + 1 
1e3d : 10 f9 __ BPL $1e38 ; (mods16 + 14)
1e3f : 20 97 1d JSR $1d97 ; (negtmp + 0)
1e42 : 20 a5 1d JSR $1da5 ; (divmod + 0)
1e45 : 38 __ __ SEC
1e46 : a9 00 __ LDA #$00
1e48 : e5 25 __ SBC WORK + 2 
1e4a : 85 25 __ STA WORK + 2 
1e4c : a9 00 __ LDA #$00
1e4e : e5 26 __ SBC WORK + 3 
1e50 : 85 26 __ STA WORK + 3 
1e52 : 60 __ __ RTS
