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
080e : 8e f7 21 STX $21f7 ; (spentry + 0)
0811 : a9 be __ LDA #$be
0813 : 85 39 __ STA IP + 0 
0815 : a9 59 __ LDA #$59
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 5f __ LDA #$5f
081c : e9 59 __ SBC #$59
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
0830 : a9 00 __ LDA #$00
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
084b : a9 f6 __ LDA #$f6
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
21f7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 0c 0c JSR $0c0c ; (zsm_irq_init.s0 + 0)
0883 : 20 d3 0d JSR $0dd3 ; (ClearVERAScreen.s0 + 0)
0886 : 20 16 0e JSR $0e16 ; (SetUpSprites.s0 + 0)
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
08cc : a9 50 __ LDA #$50
08ce : 85 34 __ STA P7 
08d0 : a9 00 __ LDA #$00
08d2 : 85 35 __ STA P8 
08d4 : 85 36 __ STA P9 
08d6 : 85 37 __ STA P10 
08d8 : 8d fa 9e STA $9efa ; (sstack + 0)
08db : 8d fb 9e STA $9efb ; (sstack + 1)
08de : a9 10 __ LDA #$10
08e0 : 8d fc 9e STA $9efc ; (sstack + 2)
08e3 : a9 00 __ LDA #$00
08e5 : 8d fd 9e STA $9efd ; (sstack + 3)
08e8 : a9 b2 __ LDA #$b2
08ea : 85 32 __ STA P5 
08ec : a9 46 __ LDA #$46
08ee : 85 33 __ STA P6 
08f0 : 20 a5 1a JSR $1aa5 ; (SetPaletteIndex.s0 + 0)
08f3 : a9 00 __ LDA #$00
08f5 : 85 50 __ STA T1 + 0 
08f7 : 85 51 __ STA T1 + 1 
08f9 : 85 52 __ STA T2 + 0 
08fb : 85 53 __ STA T3 + 0 
08fd : 85 54 __ STA T4 + 0 
.l3:
08ff : 20 58 1b JSR $1b58 ; (getchx.s0 + 0)
0902 : a5 3b __ LDA ACCU + 0 
0904 : 85 55 __ STA T5 + 0 
0906 : a9 30 __ LDA #$30
0908 : 8d 2c 9f STA $9f2c 
090b : ee fa 25 INC $25fa ; (p + 0)
090e : d0 03 __ BNE $0913 ; (main.s1023 + 0)
.s1022:
0910 : ee fb 25 INC $25fb ; (p + 1)
.s1023:
0913 : ad fc 25 LDA $25fc ; (Phase + 0)
0916 : 18 __ __ CLC
0917 : 69 01 __ ADC #$01
0919 : 85 32 __ STA P5 
091b : 8d fc 25 STA $25fc ; (Phase + 0)
091e : ad fd 25 LDA $25fd ; (Phase + 1)
0921 : 69 00 __ ADC #$00
0923 : 85 33 __ STA P6 
0925 : 8d fd 25 STA $25fd ; (Phase + 1)
0928 : ad fe 25 LDA $25fe ; (Phase2 + 0)
092b : 18 __ __ CLC
092c : 69 01 __ ADC #$01
092e : 85 34 __ STA P7 
0930 : 8d fe 25 STA $25fe ; (Phase2 + 0)
0933 : ad ff 25 LDA $25ff ; (Phase2 + 1)
0936 : 69 00 __ ADC #$00
0938 : 85 35 __ STA P8 
093a : 8d ff 25 STA $25ff ; (Phase2 + 1)
093d : ad d2 46 LDA $46d2 ; (Phase3 + 0)
0940 : 18 __ __ CLC
0941 : 69 01 __ ADC #$01
0943 : 85 36 __ STA P9 
0945 : 8d d2 46 STA $46d2 ; (Phase3 + 0)
0948 : ad d3 46 LDA $46d3 ; (Phase3 + 1)
094b : 69 00 __ ADC #$00
094d : 85 37 __ STA P10 
094f : 8d d3 46 STA $46d3 ; (Phase3 + 1)
0952 : 20 93 1b JSR $1b93 ; (MoveSprites.s0 + 0)
0955 : a5 53 __ LDA T3 + 0 
0957 : c9 01 __ CMP #$01
0959 : f0 07 __ BEQ $0962 ; (main.s5 + 0)
.s6:
095b : a9 00 __ LDA #$00
095d : 8d f8 46 STA $46f8 ; (PalTimer + 0)
0960 : f0 2b __ BEQ $098d ; (main.s75 + 0)
.s5:
0962 : a5 52 __ LDA T2 + 0 
0964 : 8d fc 9e STA $9efc ; (sstack + 2)
0967 : a9 00 __ LDA #$00
0969 : 8d fd 9e STA $9efd ; (sstack + 3)
096c : ad f7 46 LDA $46f7 ; (LastSelectedSong + 0)
096f : 8d fe 9e STA $9efe ; (sstack + 4)
0972 : a9 00 __ LDA #$00
0974 : 8d ff 9e STA $9eff ; (sstack + 5)
0977 : 20 8e 1d JSR $1d8e ; (PlayZSM.s0 + 0)
097a : a5 52 __ LDA T2 + 0 
097c : 8d f7 46 STA $46f7 ; (LastSelectedSong + 0)
097f : ad f8 46 LDA $46f8 ; (PalTimer + 0)
0982 : 18 __ __ CLC
0983 : 69 01 __ ADC #$01
0985 : 8d f8 46 STA $46f8 ; (PalTimer + 0)
0988 : ad f9 46 LDA $46f9 ; (PalTimer + 1)
098b : 69 00 __ ADC #$00
.s75:
098d : 8d f9 46 STA $46f9 ; (PalTimer + 1)
0990 : e6 54 __ INC T4 + 0 
0992 : a5 54 __ LDA T4 + 0 
0994 : c9 03 __ CMP #$03
0996 : 90 2d __ BCC $09c5 ; (main.s76 + 0)
.s8:
0998 : a9 10 __ LDA #$10
099a : 85 34 __ STA P7 
099c : a9 00 __ LDA #$00
099e : 85 35 __ STA P8 
09a0 : 85 36 __ STA P9 
09a2 : 85 37 __ STA P10 
09a4 : a9 06 __ LDA #$06
09a6 : 8d fa 9e STA $9efa ; (sstack + 0)
09a9 : a9 00 __ LDA #$00
09ab : 8d fb 9e STA $9efb ; (sstack + 1)
09ae : 8d fd 9e STA $9efd ; (sstack + 3)
09b1 : a9 0a __ LDA #$0a
09b3 : 8d fc 9e STA $9efc ; (sstack + 2)
09b6 : a9 40 __ LDA #$40
09b8 : 85 32 __ STA P5 
09ba : a9 2d __ LDA #$2d
09bc : 85 33 __ STA P6 
09be : 20 a5 1a JSR $1aa5 ; (SetPaletteIndex.s0 + 0)
09c1 : a9 00 __ LDA #$00
09c3 : 85 54 __ STA T4 + 0 
.s76:
09c5 : ad f9 46 LDA $46f9 ; (PalTimer + 1)
09c8 : 30 5f __ BMI $0a29 ; (main.s13 + 0)
.s1016:
09ca : d0 07 __ BNE $09d3 ; (main.s11 + 0)
.s1015:
09cc : a9 03 __ LDA #$03
09ce : cd f8 46 CMP $46f8 ; (PalTimer + 0)
09d1 : b0 56 __ BCS $0a29 ; (main.s13 + 0)
.s11:
09d3 : a9 60 __ LDA #$60
09d5 : 85 34 __ STA P7 
09d7 : a9 00 __ LDA #$00
09d9 : 85 35 __ STA P8 
09db : 85 36 __ STA P9 
09dd : 85 37 __ STA P10 
09df : 8d fa 9e STA $9efa ; (sstack + 0)
09e2 : 8d fb 9e STA $9efb ; (sstack + 1)
09e5 : a9 05 __ LDA #$05
09e7 : 8d fc 9e STA $9efc ; (sstack + 2)
09ea : a9 00 __ LDA #$00
09ec : 8d fd 9e STA $9efd ; (sstack + 3)
09ef : ee fa 46 INC $46fa ; (PalIndex + 0)
09f2 : d0 03 __ BNE $09f7 ; (main.s1025 + 0)
.s1024:
09f4 : ee fb 46 INC $46fb ; (PalIndex + 1)
.s1025:
09f7 : a9 20 __ LDA #$20
09f9 : 85 32 __ STA P5 
09fb : a9 42 __ LDA #$42
09fd : 85 33 __ STA P6 
09ff : 20 a5 1a JSR $1aa5 ; (SetPaletteIndex.s0 + 0)
0a02 : a9 50 __ LDA #$50
0a04 : 85 34 __ STA P7 
0a06 : a9 00 __ LDA #$00
0a08 : 8d fa 9e STA $9efa ; (sstack + 0)
0a0b : 8d fb 9e STA $9efb ; (sstack + 1)
0a0e : 8d fd 9e STA $9efd ; (sstack + 3)
0a11 : a9 10 __ LDA #$10
0a13 : 8d fc 9e STA $9efc ; (sstack + 2)
0a16 : a9 b2 __ LDA #$b2
0a18 : 85 32 __ STA P5 
0a1a : a9 46 __ LDA #$46
0a1c : 85 33 __ STA P6 
0a1e : 20 a5 1a JSR $1aa5 ; (SetPaletteIndex.s0 + 0)
0a21 : a9 00 __ LDA #$00
0a23 : 8d f8 46 STA $46f8 ; (PalTimer + 0)
0a26 : 8d f9 46 STA $46f9 ; (PalTimer + 1)
.s13:
0a29 : a9 03 __ LDA #$03
0a2b : 8d 2c 9f STA $9f2c 
0a2e : a5 55 __ LDA T5 + 0 
0a30 : c9 44 __ CMP #$44
0a32 : d0 0c __ BNE $0a40 ; (main.s15 + 0)
.s17:
0a34 : a5 52 __ LDA T2 + 0 
0a36 : cd fc 46 CMP $46fc ; (MaxSong + 0)
0a39 : b0 03 __ BCS $0a3e ; (main.s1021 + 0)
0a3b : 4c 07 0c JMP $0c07 ; (main.s14 + 0)
.s1021:
0a3e : a5 55 __ LDA T5 + 0 
.s15:
0a40 : c9 41 __ CMP #$41
0a42 : d0 21 __ BNE $0a65 ; (main.s16 + 0)
.s21:
0a44 : a5 52 __ LDA T2 + 0 
0a46 : f0 1d __ BEQ $0a65 ; (main.s16 + 0)
.s18:
0a48 : c6 52 __ DEC T2 + 0 
.s90:
0a4a : 20 5d 22 JSR $225d ; (ResetChars.s0 + 0)
0a4d : a9 00 __ LDA #$00
0a4f : 8d fd 46 STA $46fd ; (off1 + 0)
0a52 : 8d fe 46 STA $46fe ; (off1 + 1)
0a55 : a9 80 __ LDA #$80
0a57 : 8d 37 9f STA $9f37 
0a5a : a9 fd __ LDA #$fd
0a5c : 8d 38 9f STA $9f38 
0a5f : a9 00 __ LDA #$00
0a61 : 85 50 __ STA T1 + 0 
0a63 : 85 51 __ STA T1 + 1 
.s16:
0a65 : a5 53 __ LDA T3 + 0 
0a67 : 85 30 __ STA P3 
0a69 : a5 55 __ LDA T5 + 0 
0a6b : 85 31 __ STA P4 
0a6d : 20 82 22 JSR $2282 ; (Control.s0 + 0)
0a70 : a5 3b __ LDA ACCU + 0 
0a72 : 85 53 __ STA T3 + 0 
0a74 : 38 __ __ SEC
0a75 : a5 50 __ LDA T1 + 0 
0a77 : e9 80 __ SBC #$80
0a79 : 8d 37 9f STA $9f37 
0a7c : a5 51 __ LDA T1 + 1 
0a7e : e9 02 __ SBC #$02
0a80 : 8d 38 9f STA $9f38 
0a83 : 20 f8 22 JSR $22f8 ; (UpdateVolume.s0 + 0)
0a86 : ad d4 46 LDA $46d4 ; (FrameCount + 0)
0a89 : 85 3b __ STA ACCU + 0 
0a8b : ad d5 46 LDA $46d5 ; (FrameCount + 1)
0a8e : 85 3c __ STA ACCU + 1 
0a90 : a9 08 __ LDA #$08
0a92 : 85 23 __ STA WORK + 0 
0a94 : a9 00 __ LDA #$00
0a96 : 85 24 __ STA WORK + 1 
0a98 : 20 cb 25 JSR $25cb ; (mods16 + 0)
0a9b : a5 26 __ LDA WORK + 3 
0a9d : f0 03 __ BEQ $0aa2 ; (main.s1008 + 0)
0a9f : 4c 70 0b JMP $0b70 ; (main.s24 + 0)
.s1008:
0aa2 : a5 25 __ LDA WORK + 2 
0aa4 : c9 01 __ CMP #$01
0aa6 : f0 03 __ BEQ $0aab ; (main.s22 + 0)
0aa8 : 4c 70 0b JMP $0b70 ; (main.s24 + 0)
.s22:
0aab : ad fd 46 LDA $46fd ; (off1 + 0)
0aae : 85 55 __ STA T5 + 0 
0ab0 : 29 7f __ AND #$7f
0ab2 : 0a __ __ ASL
0ab3 : 8d 20 9f STA $9f20 
0ab6 : ad 25 9f LDA $9f25 
0ab9 : 29 fe __ AND #$fe
0abb : 8d 25 9f STA $9f25 
0abe : a9 b0 __ LDA #$b0
0ac0 : 8d 21 9f STA $9f21 
0ac3 : a9 11 __ LDA #$11
0ac5 : 8d 22 9f STA $9f22 
0ac8 : a5 52 __ LDA T2 + 0 
0aca : c9 03 __ CMP #$03
0acc : d0 1c __ BNE $0aea ; (main.s1006 + 0)
.s42:
0ace : a5 55 __ LDA T5 + 0 
0ad0 : 85 3b __ STA ACCU + 0 
0ad2 : ad fe 46 LDA $46fe ; (off1 + 1)
0ad5 : 85 3c __ STA ACCU + 1 
0ad7 : a9 c3 __ LDA #$c3
0ad9 : 85 23 __ STA WORK + 0 
0adb : a9 00 __ LDA #$00
0add : 85 24 __ STA WORK + 1 
0adf : 20 46 25 JSR $2546 ; (divmod + 0)
0ae2 : a6 25 __ LDX WORK + 2 
0ae4 : bd 00 58 LDA $5800,x ; (Song3 + 0)
0ae7 : 4c 2c 0b JMP $0b2c ; (main.s81 + 0)
.s1006:
0aea : b0 03 __ BCS $0aef ; (main.s1003 + 0)
0aec : 4c 94 0b JMP $0b94 ; (main.s59 + 0)
.s1003:
0aef : c9 04 __ CMP #$04
0af1 : d0 1c __ BNE $0b0f ; (main.s1002 + 0)
.s47:
0af3 : a5 55 __ LDA T5 + 0 
0af5 : 85 3b __ STA ACCU + 0 
0af7 : ad fe 46 LDA $46fe ; (off1 + 1)
0afa : 85 3c __ STA ACCU + 1 
0afc : a9 bd __ LDA #$bd
0afe : 85 23 __ STA WORK + 0 
0b00 : a9 00 __ LDA #$00
0b02 : 85 24 __ STA WORK + 1 
0b04 : 20 46 25 JSR $2546 ; (divmod + 0)
0b07 : a6 25 __ LDX WORK + 2 
0b09 : bd 00 59 LDA $5900,x ; (Song4 + 0)
0b0c : 4c 2c 0b JMP $0b2c ; (main.s81 + 0)
.s1002:
0b0f : c9 05 __ CMP #$05
0b11 : d0 29 __ BNE $0b3c ; (main.s26 + 0)
.s52:
0b13 : a5 55 __ LDA T5 + 0 
0b15 : 85 3b __ STA ACCU + 0 
0b17 : ad fe 46 LDA $46fe ; (off1 + 1)
0b1a : 85 3c __ STA ACCU + 1 
0b1c : a9 92 __ LDA #$92
0b1e : 85 23 __ STA WORK + 0 
0b20 : a9 00 __ LDA #$00
0b22 : 85 24 __ STA WORK + 1 
0b24 : 20 46 25 JSR $2546 ; (divmod + 0)
0b27 : a6 25 __ LDX WORK + 2 
0b29 : bd 5b 56 LDA $565b,x ; (Song5 + 0)
.s81:
0b2c : 09 00 __ ORA #$00
0b2e : f0 0c __ BEQ $0b3c ; (main.s26 + 0)
.s28:
0b30 : 8d 23 9f STA $9f23 
0b33 : a5 55 __ LDA T5 + 0 
0b35 : 29 0f __ AND #$0f
0b37 : 09 80 __ ORA #$80
0b39 : 8d 23 9f STA $9f23 
.s26:
0b3c : a9 80 __ LDA #$80
0b3e : 85 34 __ STA P7 
0b40 : a9 00 __ LDA #$00
0b42 : 85 35 __ STA P8 
0b44 : 85 36 __ STA P9 
0b46 : 85 37 __ STA P10 
0b48 : 8d fa 9e STA $9efa ; (sstack + 0)
0b4b : 8d fb 9e STA $9efb ; (sstack + 1)
0b4e : a9 10 __ LDA #$10
0b50 : 8d fc 9e STA $9efc ; (sstack + 2)
0b53 : a9 00 __ LDA #$00
0b55 : 8d fd 9e STA $9efd ; (sstack + 3)
0b58 : 18 __ __ CLC
0b59 : a5 55 __ LDA T5 + 0 
0b5b : 69 01 __ ADC #$01
0b5d : 8d fd 46 STA $46fd ; (off1 + 0)
0b60 : 90 03 __ BCC $0b65 ; (main.s1027 + 0)
.s1026:
0b62 : ee fe 46 INC $46fe ; (off1 + 1)
.s1027:
0b65 : a9 4c __ LDA #$4c
0b67 : 85 32 __ STA P5 
0b69 : a9 42 __ LDA #$42
0b6b : 85 33 __ STA P6 
0b6d : 20 a5 1a JSR $1aa5 ; (SetPaletteIndex.s0 + 0)
.s24:
0b70 : a9 01 __ LDA #$01
0b72 : 8d 2c 9f STA $9f2c 
0b75 : 20 52 20 JSR $2052 ; (zsm_fill.s0 + 0)
0b78 : a9 00 __ LDA #$00
0b7a : 8d 2c 9f STA $9f2c 
0b7d : 20 1d 25 JSR $251d ; (frame_wait.l1 + 0)
0b80 : ee d4 46 INC $46d4 ; (FrameCount + 0)
0b83 : d0 03 __ BNE $0b88 ; (main.s1029 + 0)
.s1028:
0b85 : ee d5 46 INC $46d5 ; (FrameCount + 1)
.s1029:
0b88 : e6 50 __ INC T1 + 0 
0b8a : f0 03 __ BEQ $0b8f ; (main.s1030 + 0)
0b8c : 4c ff 08 JMP $08ff ; (main.l3 + 0)
.s1030:
0b8f : e6 51 __ INC T1 + 1 
0b91 : 4c ff 08 JMP $08ff ; (main.l3 + 0)
.s59:
0b94 : 09 00 __ ORA #$00
0b96 : d0 20 __ BNE $0bb8 ; (main.s1005 + 0)
.s27:
0b98 : a5 55 __ LDA T5 + 0 
0b9a : 85 3b __ STA ACCU + 0 
0b9c : ad fe 46 LDA $46fe ; (off1 + 1)
0b9f : 85 3c __ STA ACCU + 1 
0ba1 : a9 1d __ LDA #$1d
0ba3 : 85 23 __ STA WORK + 0 
0ba5 : a9 06 __ LDA #$06
0ba7 : 85 24 __ STA WORK + 1 
0ba9 : 20 46 25 JSR $2546 ; (divmod + 0)
0bac : 18 __ __ CLC
0bad : a9 e0 __ LDA #$e0
0baf : 65 25 __ ADC WORK + 2 
0bb1 : 85 47 __ STA T6 + 0 
0bb3 : a9 48 __ LDA #$48
0bb5 : 4c fc 0b JMP $0bfc ; (main.s1020 + 0)
.s1005:
0bb8 : c9 01 __ CMP #$01
0bba : f0 23 __ BEQ $0bdf ; (main.s32 + 0)
.s1004:
0bbc : c9 02 __ CMP #$02
0bbe : f0 03 __ BEQ $0bc3 ; (main.s37 + 0)
0bc0 : 4c 3c 0b JMP $0b3c ; (main.s26 + 0)
.s37:
0bc3 : a5 55 __ LDA T5 + 0 
0bc5 : 85 3b __ STA ACCU + 0 
0bc7 : ad fe 46 LDA $46fe ; (off1 + 1)
0bca : 85 3c __ STA ACCU + 1 
0bcc : a9 c5 __ LDA #$c5
0bce : 85 23 __ STA WORK + 0 
0bd0 : a9 00 __ LDA #$00
0bd2 : 85 24 __ STA WORK + 1 
0bd4 : 20 46 25 JSR $2546 ; (divmod + 0)
0bd7 : a6 25 __ LDX WORK + 2 
0bd9 : bd 00 57 LDA $5700,x ; (Song2 + 0)
0bdc : 4c 2c 0b JMP $0b2c ; (main.s81 + 0)
.s32:
0bdf : a5 55 __ LDA T5 + 0 
0be1 : 85 3b __ STA ACCU + 0 
0be3 : ad fe 46 LDA $46fe ; (off1 + 1)
0be6 : 85 3c __ STA ACCU + 1 
0be8 : a9 5c __ LDA #$5c
0bea : 85 23 __ STA WORK + 0 
0bec : a9 07 __ LDA #$07
0bee : 85 24 __ STA WORK + 1 
0bf0 : 20 46 25 JSR $2546 ; (divmod + 0)
0bf3 : 18 __ __ CLC
0bf4 : a9 fe __ LDA #$fe
0bf6 : 65 25 __ ADC WORK + 2 
0bf8 : 85 47 __ STA T6 + 0 
0bfa : a9 4e __ LDA #$4e
.s1020:
0bfc : 65 26 __ ADC WORK + 3 
0bfe : 85 48 __ STA T6 + 1 
0c00 : a0 00 __ LDY #$00
0c02 : b1 47 __ LDA (T6 + 0),y 
0c04 : 4c 2c 0b JMP $0b2c ; (main.s81 + 0)
.s14:
0c07 : e6 52 __ INC T2 + 0 
0c09 : 4c 4a 0a JMP $0a4a ; (main.s90 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0c0c : 78 __ __ SEI
0c0d : ad 14 03 LDA $0314 
0c10 : 8d ee 56 STA $56ee ; (oirq + 0)
0c13 : ad 15 03 LDA $0315 
0c16 : 8d ef 56 STA $56ef ; (oirq + 1)
0c19 : a9 25 __ LDA #$25
0c1b : 8d 14 03 STA $0314 
0c1e : a9 0c __ LDA #$0c
0c20 : 8d 15 03 STA $0315 
0c23 : 58 __ __ CLI
.s1001:
0c24 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
56ee : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c25 : 20 2b 0c JSR $0c2b ; (irq.s1000 + 0)
0c28 : 6c ee 56 JMP ($56ee)
--------------------------------------------------------------------
irq:
.s1000:
0c2b : a5 2d __ LDA P0 
0c2d : 48 __ __ PHA
0c2e : a5 2e __ LDA P1 
0c30 : 48 __ __ PHA
0c31 : a5 3b __ LDA ACCU + 0 
0c33 : 48 __ __ PHA
0c34 : a5 3c __ LDA ACCU + 1 
0c36 : 48 __ __ PHA
0c37 : a5 47 __ LDA T0 + 0 
0c39 : 48 __ __ PHA
0c3a : a5 48 __ LDA $48 
0c3c : 48 __ __ PHA
0c3d : a5 49 __ LDA $49 
0c3f : 48 __ __ PHA
0c40 : a5 4a __ LDA $4a 
0c42 : 48 __ __ PHA
0c43 : a5 4b __ LDA $4b 
0c45 : 48 __ __ PHA
0c46 : a5 4c __ LDA $4c 
0c48 : 48 __ __ PHA
0c49 : a5 4d __ LDA $4d 
0c4b : 48 __ __ PHA
0c4c : a5 4e __ LDA $4e 
0c4e : 48 __ __ PHA
0c4f : a5 4f __ LDA $4f 
0c51 : 48 __ __ PHA
0c52 : a5 50 __ LDA $50 
0c54 : 48 __ __ PHA
.s0:
0c55 : ad f8 21 LDA $21f8 ; (zsm_playing + 0)
0c58 : f0 08 __ BEQ $0c62 ; (irq.s1001 + 0)
.s4:
0c5a : ad f9 21 LDA $21f9 ; (zsm_finished + 0)
0c5d : d0 03 __ BNE $0c62 ; (irq.s1001 + 0)
.s1:
0c5f : 20 8d 0c JSR $0c8d ; (zsm_play.s0 + 0)
.s1001:
0c62 : 68 __ __ PLA
0c63 : 85 50 __ STA $50 
0c65 : 68 __ __ PLA
0c66 : 85 4f __ STA $4f 
0c68 : 68 __ __ PLA
0c69 : 85 4e __ STA $4e 
0c6b : 68 __ __ PLA
0c6c : 85 4d __ STA $4d 
0c6e : 68 __ __ PLA
0c6f : 85 4c __ STA $4c 
0c71 : 68 __ __ PLA
0c72 : 85 4b __ STA $4b 
0c74 : 68 __ __ PLA
0c75 : 85 4a __ STA $4a 
0c77 : 68 __ __ PLA
0c78 : 85 49 __ STA $49 
0c7a : 68 __ __ PLA
0c7b : 85 48 __ STA $48 
0c7d : 68 __ __ PLA
0c7e : 85 47 __ STA T0 + 0 
0c80 : 68 __ __ PLA
0c81 : 85 3c __ STA ACCU + 1 
0c83 : 68 __ __ PLA
0c84 : 85 3b __ STA ACCU + 0 
0c86 : 68 __ __ PLA
0c87 : 85 2e __ STA P1 
0c89 : 68 __ __ PLA
0c8a : 85 2d __ STA P0 
0c8c : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
21f8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
21f9 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c8d : ad fa 21 LDA $21fa ; (zsm_paused + 0)
0c90 : f0 01 __ BEQ $0c93 ; (zsm_play.s2 + 0)
0c92 : 60 __ __ RTS
.s2:
0c93 : ad f0 56 LDA $56f0 ; (zsm_delay + 0)
0c96 : f0 03 __ BEQ $0c9b ; (zsm_play.s5 + 0)
0c98 : 4c b6 0d JMP $0db6 ; (zsm_play.s4 + 0)
.s5:
0c9b : ad 25 9f LDA $9f25 
0c9e : 85 47 __ STA T0 + 0 
0ca0 : ad 25 9f LDA $9f25 
0ca3 : 29 fe __ AND #$fe
0ca5 : 8d 25 9f STA $9f25 
0ca8 : ad 20 9f LDA $9f20 
0cab : 85 49 __ STA T2 + 0 
0cad : ad 21 9f LDA $9f21 
0cb0 : 85 4a __ STA T2 + 1 
0cb2 : ad 22 9f LDA $9f22 
0cb5 : 85 48 __ STA T1 + 0 
.l8:
0cb7 : ad f1 56 LDA $56f1 ; (zsm_pos + 0)
0cba : 85 3b __ STA ACCU + 0 
0cbc : aa __ __ TAX
0cbd : 18 __ __ CLC
0cbe : 69 01 __ ADC #$01
0cc0 : 85 4d __ STA T4 + 0 
0cc2 : 8d f1 56 STA $56f1 ; (zsm_pos + 0)
0cc5 : ad f2 56 LDA $56f2 ; (zsm_pos + 1)
0cc8 : 85 4c __ STA T3 + 1 
0cca : 69 00 __ ADC #$00
0ccc : 85 4e __ STA T4 + 1 
0cce : 8d f2 56 STA $56f2 ; (zsm_pos + 1)
0cd1 : a5 4c __ LDA T3 + 1 
0cd3 : 29 03 __ AND #$03
0cd5 : 18 __ __ CLC
0cd6 : 69 5a __ ADC #$5a
0cd8 : 85 3c __ STA ACCU + 1 
0cda : a0 00 __ LDY #$00
0cdc : b1 3b __ LDA (ACCU + 0),y 
0cde : c9 40 __ CMP #$40
0ce0 : b0 33 __ BCS $0d15 ; (zsm_play.s12 + 0)
.s11:
0ce2 : 29 3f __ AND #$3f
0ce4 : 09 c0 __ ORA #$c0
0ce6 : 8d 20 9f STA $9f20 
0ce9 : a9 f9 __ LDA #$f9
0ceb : 8d 21 9f STA $9f21 
0cee : a9 01 __ LDA #$01
0cf0 : 8d 22 9f STA $9f22 
0cf3 : 8a __ __ TXA
0cf4 : 69 02 __ ADC #$02
0cf6 : 8d f1 56 STA $56f1 ; (zsm_pos + 0)
0cf9 : a5 4c __ LDA T3 + 1 
0cfb : 69 00 __ ADC #$00
0cfd : 8d f2 56 STA $56f2 ; (zsm_pos + 1)
0d00 : a5 4d __ LDA T4 + 0 
0d02 : 85 4b __ STA T3 + 0 
0d04 : a5 4e __ LDA T4 + 1 
0d06 : 29 03 __ AND #$03
0d08 : 18 __ __ CLC
0d09 : 69 5a __ ADC #$5a
0d0b : 85 4c __ STA T3 + 1 
0d0d : b1 4b __ LDA (T3 + 0),y 
0d0f : 8d 23 9f STA $9f23 
0d12 : 4c b7 0c JMP $0cb7 ; (zsm_play.l8 + 0)
.s12:
0d15 : d0 20 __ BNE $0d37 ; (zsm_play.s15 + 0)
.s14:
0d17 : a5 4d __ LDA T4 + 0 
0d19 : 85 4b __ STA T3 + 0 
0d1b : a5 4e __ LDA T4 + 1 
0d1d : 29 03 __ AND #$03
0d1f : 18 __ __ CLC
0d20 : 69 5a __ ADC #$5a
0d22 : 85 4c __ STA T3 + 1 
0d24 : b1 4b __ LDA (T3 + 0),y 
0d26 : 29 3f __ AND #$3f
0d28 : 18 __ __ CLC
0d29 : 65 4d __ ADC T4 + 0 
0d2b : 8d f1 56 STA $56f1 ; (zsm_pos + 0)
0d2e : 98 __ __ TYA
0d2f : 65 4e __ ADC T4 + 1 
0d31 : 8d f2 56 STA $56f2 ; (zsm_pos + 1)
0d34 : 4c b7 0c JMP $0cb7 ; (zsm_play.l8 + 0)
.s15:
0d37 : 09 00 __ ORA #$00
0d39 : 30 53 __ BMI $0d8e ; (zsm_play.s18 + 0)
.s17:
0d3b : 29 3f __ AND #$3f
0d3d : d0 03 __ BNE $0d42 ; (zsm_play.s29 + 0)
0d3f : 4c b7 0c JMP $0cb7 ; (zsm_play.l8 + 0)
.s29:
0d42 : 84 50 __ STY T7 + 0 
0d44 : 85 4f __ STA T6 + 0 
0d46 : 18 __ __ CLC
.l1012:
0d47 : ad f1 56 LDA $56f1 ; (zsm_pos + 0)
0d4a : 85 4d __ STA T4 + 0 
0d4c : ad f2 56 LDA $56f2 ; (zsm_pos + 1)
0d4f : 29 03 __ AND #$03
0d51 : 69 5a __ ADC #$5a
0d53 : 85 4e __ STA T4 + 1 
0d55 : a0 00 __ LDY #$00
0d57 : b1 4d __ LDA (T4 + 0),y 
0d59 : 85 2d __ STA P0 
0d5b : 18 __ __ CLC
0d5c : a5 4d __ LDA T4 + 0 
0d5e : 69 01 __ ADC #$01
0d60 : 85 4b __ STA T3 + 0 
0d62 : ad f2 56 LDA $56f2 ; (zsm_pos + 1)
0d65 : 69 00 __ ADC #$00
0d67 : 29 03 __ AND #$03
0d69 : 18 __ __ CLC
0d6a : 69 5a __ ADC #$5a
0d6c : 85 4c __ STA T3 + 1 
0d6e : b1 4b __ LDA (T3 + 0),y 
0d70 : 85 2e __ STA P1 
0d72 : 20 ba 0d JSR $0dba ; (sfx_put.s1000 + 0)
0d75 : ad f1 56 LDA $56f1 ; (zsm_pos + 0)
0d78 : 18 __ __ CLC
0d79 : 69 02 __ ADC #$02
0d7b : 8d f1 56 STA $56f1 ; (zsm_pos + 0)
0d7e : 90 03 __ BCC $0d83 ; (zsm_play.s1015 + 0)
.s1014:
0d80 : ee f2 56 INC $56f2 ; (zsm_pos + 1)
.s1015:
0d83 : e6 50 __ INC T7 + 0 
0d85 : a5 50 __ LDA T7 + 0 
0d87 : c5 4f __ CMP T6 + 0 
0d89 : 90 bc __ BCC $0d47 ; (zsm_play.l1012 + 0)
0d8b : 4c b7 0c JMP $0cb7 ; (zsm_play.l8 + 0)
.s18:
0d8e : c9 80 __ CMP #$80
0d90 : d0 07 __ BNE $0d99 ; (zsm_play.s25 + 0)
.s24:
0d92 : a9 01 __ LDA #$01
0d94 : 8d f9 21 STA $21f9 ; (zsm_finished + 0)
0d97 : d0 08 __ BNE $0da1 ; (zsm_play.s10 + 0)
.s25:
0d99 : 29 7f __ AND #$7f
0d9b : 38 __ __ SEC
0d9c : e9 01 __ SBC #$01
0d9e : 8d f0 56 STA $56f0 ; (zsm_delay + 0)
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
.s4:
0db6 : ce f0 56 DEC $56f0 ; (zsm_delay + 0)
0db9 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
21fa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
56f0 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
5a00 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
56f1 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.s1000:
0dba : a4 2d __ LDY P0 ; (index + 0)
.s1:
0dbc : a6 2e __ LDX P1 ; (data + 0)
.l1002:
0dbe : ad 41 9f LDA $9f41 
0dc1 : 30 fb __ BMI $0dbe ; (sfx_put.l1002 + 0)
.s1003:
0dc3 : 8a __ __ TXA
0dc4 : 8c 40 9f STY $9f40 
0dc7 : 99 00 5e STA $5e00,y ; (vera_fm_s_regs + 0)
.l4:
0dca : ad 41 9f LDA $9f41 
0dcd : 30 fb __ BMI $0dca ; (sfx_put.l4 + 0)
.s6:
0dcf : 8e 41 9f STX $9f41 
.s1001:
0dd2 : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
5e00 : __ __ __ BSS	256
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0dd3 : a9 93 __ LDA #$93
0dd5 : 85 2d __ STA P0 
0dd7 : a9 00 __ LDA #$00
0dd9 : 85 2e __ STA P1 
0ddb : 20 10 0e JSR $0e10 ; (putch.s0 + 0)
0dde : a9 11 __ LDA #$11
0de0 : 8d 22 9f STA $9f22 
0de3 : a2 00 __ LDX #$00
.l2:
0de5 : 8a __ __ TXA
0de6 : 18 __ __ CLC
0de7 : 69 b0 __ ADC #$b0
0de9 : 8d 21 9f STA $9f21 
0dec : a9 00 __ LDA #$00
0dee : 8d 20 9f STA $9f20 
0df1 : a0 80 __ LDY #$80
.l1003:
0df3 : a9 20 __ LDA #$20
0df5 : 8d 23 9f STA $9f23 
0df8 : a9 01 __ LDA #$01
0dfa : 8d 23 9f STA $9f23 
0dfd : a9 20 __ LDA #$20
0dff : 8d 24 9f STA $9f24 
0e02 : a9 01 __ LDA #$01
0e04 : 8d 24 9f STA $9f24 
0e07 : 88 __ __ DEY
0e08 : d0 e9 __ BNE $0df3 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0e0a : e8 __ __ INX
0e0b : e0 40 __ CPX #$40
0e0d : 90 d6 __ BCC $0de5 ; (ClearVERAScreen.l2 + 0)
.s1001:
0e0f : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0e10 : a5 2d __ LDA P0 
0e12 : 20 d2 ff JSR $ffd2 
.s1001:
0e15 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e16 : a9 40 __ LDA #$40
0e18 : 8d fb 21 STA $21fb ; (VolAddr + 0)
0e1b : a9 57 __ LDA #$57
0e1d : 8d fc 21 STA $21fc ; (VolAddr + 1)
0e20 : a9 01 __ LDA #$01
0e22 : 8d fd 21 STA $21fd ; (VolAddr + 2)
0e25 : 8d f6 25 STA $25f6 ; (IndAddr + 2)
0e28 : a9 00 __ LDA #$00
0e2a : 8d fe 21 STA $21fe ; (VolAddr + 3)
0e2d : 8d f4 25 STA $25f4 ; (IndAddr + 0)
0e30 : 8d f7 25 STA $25f7 ; (IndAddr + 3)
0e33 : a9 31 __ LDA #$31
0e35 : 8d f5 25 STA $25f5 ; (IndAddr + 1)
0e38 : a9 00 __ LDA #$00
0e3a : 8d 25 9f STA $9f25 
0e3d : a9 80 __ LDA #$80
0e3f : 8d 2b 9f STA $9f2b 
0e42 : 8d 2a 9f STA $9f2a 
0e45 : a9 62 __ LDA #$62
0e47 : 8d 2d 9f STA $9f2d 
0e4a : a9 68 __ LDA #$68
0e4c : 8d 34 9f STA $9f34 
0e4f : a9 00 __ LDA #$00
0e51 : 85 2d __ STA P0 
0e53 : 85 2e __ STA P1 
0e55 : 85 2f __ STA P2 
0e57 : 85 30 __ STA P3 
0e59 : 85 31 __ STA P4 
0e5b : 20 00 18 JSR $1800 ; (tileBaseConfig.s0 + 0)
0e5e : 8d 2f 9f STA $9f2f 
0e61 : a9 00 __ LDA #$00
0e63 : 85 2d __ STA P0 
0e65 : a9 20 __ LDA #$20
0e67 : 85 2f __ STA P2 
0e69 : 20 18 18 JSR $1818 ; (memoryToMapMemoryAddress.s0 + 0)
0e6c : 8d 2e 9f STA $9f2e 
0e6f : a9 01 __ LDA #$01
0e71 : 8d 22 9f STA $9f22 
0e74 : a2 80 __ LDX #$80
.l6:
0e76 : a0 50 __ LDY #$50
.l1071:
0e78 : a9 00 __ LDA #$00
0e7a : 8d 24 9f STA $9f24 
0e7d : a9 08 __ LDA #$08
0e7f : 8d 24 9f STA $9f24 
0e82 : 88 __ __ DEY
0e83 : d0 f3 __ BNE $0e78 ; (SetUpSprites.l1071 + 0)
.s1072:
0e85 : ca __ __ DEX
0e86 : d0 ee __ BNE $0e76 ; (SetUpSprites.l6 + 0)
.s4:
0e88 : 86 4c __ STX T1 + 0 
0e8a : a9 00 __ LDA #$00
0e8c : 85 2d __ STA P0 
0e8e : 85 2e __ STA P1 
0e90 : 85 2f __ STA P2 
0e92 : 85 30 __ STA P3 
0e94 : a9 20 __ LDA #$20
0e96 : 85 33 __ STA P6 
0e98 : a9 03 __ LDA #$03
0e9a : 85 34 __ STA P7 
0e9c : a9 20 __ LDA #$20
0e9e : 85 31 __ STA P4 
0ea0 : a9 26 __ LDA #$26
0ea2 : 85 32 __ STA P5 
0ea4 : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
0ea7 : a9 10 __ LDA #$10
0ea9 : 8d 22 9f STA $9f22 
0eac : a9 00 __ LDA #$00
0eae : 8d 20 9f STA $9f20 
0eb1 : a9 20 __ LDA #$20
0eb3 : 8d 21 9f STA $9f21 
.l10:
0eb6 : a9 00 __ LDA #$00
0eb8 : 85 4d __ STA T2 + 0 
.l14:
0eba : 20 60 18 JSR $1860 ; (rand.s0 + 0)
0ebd : a9 31 __ LDA #$31
0ebf : 85 23 __ STA WORK + 0 
0ec1 : a9 00 __ LDA #$00
0ec3 : 85 24 __ STA WORK + 1 
0ec5 : 20 46 25 JSR $2546 ; (divmod + 0)
0ec8 : a5 4c __ LDA T1 + 0 
0eca : d0 03 __ BNE $0ecf ; (SetUpSprites.s1041 + 0)
0ecc : 4c b2 0f JMP $0fb2 ; (SetUpSprites.s1037 + 0)
.s1041:
0ecf : a9 10 __ LDA #$10
0ed1 : c5 4c __ CMP T1 + 0 
0ed3 : a9 00 __ LDA #$00
0ed5 : 2a __ __ ROL
0ed6 : d0 03 __ BNE $0edb ; (SetUpSprites.s1069 + 0)
0ed8 : 4c b2 0f JMP $0fb2 ; (SetUpSprites.s1037 + 0)
.s1069:
0edb : a8 __ __ TAY
0edc : a5 4d __ LDA T2 + 0 
0ede : f0 06 __ BEQ $0ee6 ; (SetUpSprites.s26 + 0)
.s1068:
0ee0 : a9 10 __ LDA #$10
0ee2 : c5 4d __ CMP T2 + 0 
0ee4 : b0 18 __ BCS $0efe ; (SetUpSprites.s1065 + 0)
.s26:
0ee6 : 98 __ __ TYA
0ee7 : d0 03 __ BNE $0eec ; (SetUpSprites.s1067 + 0)
0ee9 : 4c b2 0f JMP $0fb2 ; (SetUpSprites.s1037 + 0)
.s1067:
0eec : a5 4d __ LDA T2 + 0 
0eee : c9 3e __ CMP #$3e
0ef0 : b0 03 __ BCS $0ef5 ; (SetUpSprites.s1066 + 0)
0ef2 : 4c b2 0f JMP $0fb2 ; (SetUpSprites.s1037 + 0)
.s1066:
0ef5 : a9 4e __ LDA #$4e
0ef7 : c5 4d __ CMP T2 + 0 
0ef9 : b0 03 __ BCS $0efe ; (SetUpSprites.s1065 + 0)
0efb : 4c b2 0f JMP $0fb2 ; (SetUpSprites.s1037 + 0)
.s1065:
0efe : a5 4c __ LDA T1 + 0 
0f00 : c9 01 __ CMP #$01
0f02 : f0 79 __ BEQ $0f7d ; (SetUpSprites.s1064 + 0)
.s1057:
0f04 : c9 10 __ CMP #$10
0f06 : d0 30 __ BNE $0f38 ; (SetUpSprites.s1049 + 0)
.s1056:
0f08 : a5 4d __ LDA T2 + 0 
0f0a : c9 01 __ CMP #$01
0f0c : f0 04 __ BEQ $0f12 ; (SetUpSprites.s46 + 0)
.s1055:
0f0e : c9 3e __ CMP #$3e
0f10 : d0 04 __ BNE $0f16 ; (SetUpSprites.s1054 + 0)
.s46:
0f12 : a9 14 __ LDA #$14
0f14 : d0 5a __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s1054:
0f16 : c9 10 __ CMP #$10
0f18 : 90 0c __ BCC $0f26 ; (SetUpSprites.s52 + 0)
.s1053:
0f1a : a9 3e __ LDA #$3e
0f1c : c5 4d __ CMP T2 + 0 
0f1e : b0 0a __ BCS $0f2a ; (SetUpSprites.s1051 + 0)
.s1052:
0f20 : a5 4d __ LDA T2 + 0 
0f22 : c9 4e __ CMP #$4e
0f24 : b0 04 __ BCS $0f2a ; (SetUpSprites.s1051 + 0)
.s52:
0f26 : a9 15 __ LDA #$15
0f28 : d0 46 __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s1051:
0f2a : a5 4d __ LDA T2 + 0 
0f2c : c9 10 __ CMP #$10
0f2e : f0 04 __ BEQ $0f34 ; (SetUpSprites.s59 + 0)
.s1050:
0f30 : c9 4e __ CMP #$4e
0f32 : d0 04 __ BNE $0f38 ; (SetUpSprites.s1049 + 0)
.s59:
0f34 : a9 16 __ LDA #$16
0f36 : d0 38 __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s1049:
0f38 : a5 4d __ LDA T2 + 0 
0f3a : c9 01 __ CMP #$01
0f3c : d0 08 __ BNE $0f46 ; (SetUpSprites.s1047 + 0)
.s1048:
0f3e : a5 4c __ LDA T1 + 0 
0f40 : c9 10 __ CMP #$10
0f42 : 90 06 __ BCC $0f4a ; (SetUpSprites.s65 + 0)
.s1084:
0f44 : a5 4d __ LDA T2 + 0 
.s1047:
0f46 : c9 3e __ CMP #$3e
0f48 : d0 04 __ BNE $0f4e ; (SetUpSprites.s1046 + 0)
.s65:
0f4a : a9 12 __ LDA #$12
0f4c : d0 22 __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s1046:
0f4e : c9 10 __ CMP #$10
0f50 : d0 06 __ BNE $0f58 ; (SetUpSprites.s1044 + 0)
.s1045:
0f52 : a5 4c __ LDA T1 + 0 
0f54 : c9 10 __ CMP #$10
0f56 : 90 12 __ BCC $0f6a ; (SetUpSprites.s70 + 0)
.s1044:
0f58 : a5 4d __ LDA T2 + 0 
0f5a : c9 4e __ CMP #$4e
0f5c : d0 10 __ BNE $0f6e ; (SetUpSprites.s71 + 0)
.s1043:
0f5e : a5 4c __ LDA T1 + 0 
0f60 : c9 10 __ CMP #$10
0f62 : b0 0a __ BCS $0f6e ; (SetUpSprites.s71 + 0)
.s1042:
0f64 : a9 01 __ LDA #$01
0f66 : c5 4c __ CMP T1 + 0 
0f68 : b0 04 __ BCS $0f6e ; (SetUpSprites.s71 + 0)
.s70:
0f6a : a9 17 __ LDA #$17
0f6c : d0 02 __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s71:
0f6e : a9 13 __ LDA #$13
.s296:
0f70 : 8d 23 9f STA $9f23 
0f73 : a9 00 __ LDA #$00
0f75 : 8d 23 9f STA $9f23 
0f78 : e6 4d __ INC T2 + 0 
0f7a : 4c ba 0e JMP $0eba ; (SetUpSprites.l14 + 0)
.s1064:
0f7d : a5 4d __ LDA T2 + 0 
0f7f : c9 01 __ CMP #$01
0f81 : f0 04 __ BEQ $0f87 ; (SetUpSprites.s27 + 0)
.s1063:
0f83 : c9 3e __ CMP #$3e
0f85 : d0 04 __ BNE $0f8b ; (SetUpSprites.s1062 + 0)
.s27:
0f87 : a9 0f __ LDA #$0f
0f89 : d0 e5 __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s1062:
0f8b : c9 10 __ CMP #$10
0f8d : 90 0c __ BCC $0f9b ; (SetUpSprites.s33 + 0)
.s1061:
0f8f : a9 3e __ LDA #$3e
0f91 : c5 4d __ CMP T2 + 0 
0f93 : b0 0a __ BCS $0f9f ; (SetUpSprites.s1059 + 0)
.s1060:
0f95 : a5 4d __ LDA T2 + 0 
0f97 : c9 4e __ CMP #$4e
0f99 : b0 04 __ BCS $0f9f ; (SetUpSprites.s1059 + 0)
.s33:
0f9b : a9 10 __ LDA #$10
0f9d : d0 d1 __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s1059:
0f9f : a5 4d __ LDA T2 + 0 
0fa1 : c9 10 __ CMP #$10
0fa3 : f0 04 __ BEQ $0fa9 ; (SetUpSprites.s40 + 0)
.s1058:
0fa5 : c9 4e __ CMP #$4e
0fa7 : d0 04 __ BNE $0fad ; (SetUpSprites.s1083 + 0)
.s40:
0fa9 : a9 11 __ LDA #$11
0fab : d0 c3 __ BNE $0f70 ; (SetUpSprites.s296 + 0)
.s1083:
0fad : a5 4c __ LDA T1 + 0 
0faf : 4c 04 0f JMP $0f04 ; (SetUpSprites.s1057 + 0)
.s1037:
0fb2 : a5 4c __ LDA T1 + 0 
0fb4 : c9 36 __ CMP #$36
0fb6 : 90 03 __ BCC $0fbb ; (SetUpSprites.s1036 + 0)
0fb8 : 4c 56 17 JMP $1756 ; (SetUpSprites.s1031 + 0)
.s1036:
0fbb : c9 2c __ CMP #$2c
0fbd : b0 03 __ BCS $0fc2 ; (SetUpSprites.s1035 + 0)
0fbf : 4c 56 17 JMP $1756 ; (SetUpSprites.s1031 + 0)
.s1035:
0fc2 : f0 04 __ BEQ $0fc8 ; (SetUpSprites.s81 + 0)
.s1034:
0fc4 : c9 34 __ CMP #$34
0fc6 : d0 04 __ BNE $0fcc ; (SetUpSprites.s1033 + 0)
.s81:
0fc8 : a9 0a __ LDA #$0a
0fca : d0 0e __ BNE $0fda ; (SetUpSprites.s279 + 0)
.s1033:
0fcc : c9 2d __ CMP #$2d
0fce : f0 04 __ BEQ $0fd4 ; (SetUpSprites.s85 + 0)
.s1032:
0fd0 : c9 35 __ CMP #$35
0fd2 : d0 04 __ BNE $0fd8 ; (SetUpSprites.s86 + 0)
.s85:
0fd4 : a9 0b __ LDA #$0b
0fd6 : d0 02 __ BNE $0fda ; (SetUpSprites.s279 + 0)
.s86:
0fd8 : a9 04 __ LDA #$04
.s279:
0fda : 8d 23 9f STA $9f23 
0fdd : a9 00 __ LDA #$00
0fdf : 8d 23 9f STA $9f23 
0fe2 : e6 4d __ INC T2 + 0 
0fe4 : 30 03 __ BMI $0fe9 ; (SetUpSprites.s11 + 0)
0fe6 : 4c ba 0e JMP $0eba ; (SetUpSprites.l14 + 0)
.s11:
0fe9 : e6 4c __ INC T1 + 0 
0feb : a5 4c __ LDA T1 + 0 
0fed : c9 40 __ CMP #$40
0fef : b0 03 __ BCS $0ff4 ; (SetUpSprites.s12 + 0)
0ff1 : 4c b6 0e JMP $0eb6 ; (SetUpSprites.l10 + 0)
.s12:
0ff4 : a9 c0 __ LDA #$c0
0ff6 : 85 2d __ STA P0 
0ff8 : a9 52 __ LDA #$52
0ffa : 85 2e __ STA P1 
0ffc : a9 01 __ LDA #$01
0ffe : 85 2f __ STA P2 
1000 : a9 00 __ LDA #$00
1002 : 85 30 __ STA P3 
1004 : 85 33 __ STA P6 
1006 : a9 02 __ LDA #$02
1008 : 85 34 __ STA P7 
100a : a9 40 __ LDA #$40
100c : 85 31 __ STA P4 
100e : a9 29 __ LDA #$29
1010 : 85 32 __ STA P5 
1012 : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
1015 : a9 00 __ LDA #$00
1017 : 85 2d __ STA P0 
1019 : a9 55 __ LDA #$55
101b : 85 2e __ STA P1 
101d : a9 02 __ LDA #$02
101f : 85 34 __ STA P7 
1021 : a9 40 __ LDA #$40
1023 : 85 31 __ STA P4 
1025 : a9 2b __ LDA #$2b
1027 : 85 32 __ STA P5 
1029 : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
102c : a9 96 __ LDA #$96
102e : 85 2e __ STA P1 
1030 : a9 0a __ LDA #$0a
1032 : 85 2f __ STA P2 
1034 : 85 34 __ STA P7 
1036 : a9 02 __ LDA #$02
1038 : 85 31 __ STA P4 
103a : 85 32 __ STA P5 
103c : a9 03 __ LDA #$03
103e : 85 33 __ STA P6 
1040 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1043 : a9 68 __ LDA #$68
1045 : 85 2e __ STA P1 
1047 : a9 00 __ LDA #$00
1049 : 85 2f __ STA P2 
104b : a9 b6 __ LDA #$b6
104d : 85 30 __ STA P3 
104f : a9 01 __ LDA #$01
1051 : 85 31 __ STA P4 
1053 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1056 : a9 01 __ LDA #$01
1058 : 85 2d __ STA P0 
105a : a9 a8 __ LDA #$a8
105c : 85 2e __ STA P1 
105e : a9 0a __ LDA #$0a
1060 : 85 2f __ STA P2 
1062 : a9 00 __ LDA #$00
1064 : 85 30 __ STA P3 
1066 : a9 02 __ LDA #$02
1068 : 85 31 __ STA P4 
106a : a9 09 __ LDA #$09
106c : 85 34 __ STA P7 
106e : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1071 : a9 f0 __ LDA #$f0
1073 : 85 2e __ STA P1 
1075 : a9 01 __ LDA #$01
1077 : 85 2f __ STA P2 
1079 : 85 31 __ STA P4 
107b : a9 b6 __ LDA #$b6
107d : 85 30 __ STA P3 
107f : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1082 : a9 00 __ LDA #$00
1084 : 85 2d __ STA P0 
1086 : 85 30 __ STA P3 
1088 : 85 33 __ STA P6 
108a : a9 30 __ LDA #$30
108c : 85 2e __ STA P1 
108e : a9 01 __ LDA #$01
1090 : 85 34 __ STA P7 
1092 : a9 00 __ LDA #$00
1094 : 85 31 __ STA P4 
1096 : a9 2e __ LDA #$2e
1098 : 85 32 __ STA P5 
109a : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
109d : a9 16 __ LDA #$16
109f : 85 2d __ STA P0 
10a1 : a9 80 __ LDA #$80
10a3 : 85 2e __ STA P1 
10a5 : a9 09 __ LDA #$09
10a7 : 85 2f __ STA P2 
10a9 : a9 01 __ LDA #$01
10ab : 85 31 __ STA P4 
10ad : 85 34 __ STA P7 
10af : a9 02 __ LDA #$02
10b1 : 85 32 __ STA P5 
10b3 : a9 03 __ LDA #$03
10b5 : 85 33 __ STA P6 
10b7 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
10ba : a9 30 __ LDA #$30
10bc : 85 2e __ STA P1 
10be : a9 01 __ LDA #$01
10c0 : 85 2f __ STA P2 
10c2 : a9 b8 __ LDA #$b8
10c4 : 85 30 __ STA P3 
10c6 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
10c9 : a9 00 __ LDA #$00
10cb : 85 2d __ STA P0 
10cd : 85 30 __ STA P3 
10cf : 85 33 __ STA P6 
10d1 : a9 33 __ LDA #$33
10d3 : 85 2e __ STA P1 
10d5 : a9 02 __ LDA #$02
10d7 : 85 34 __ STA P7 
10d9 : a9 00 __ LDA #$00
10db : 85 31 __ STA P4 
10dd : a9 2f __ LDA #$2f
10df : 85 32 __ STA P5 
10e1 : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
10e4 : a9 17 __ LDA #$17
10e6 : 85 2d __ STA P0 
10e8 : a9 98 __ LDA #$98
10ea : 85 2e __ STA P1 
10ec : a9 09 __ LDA #$09
10ee : 85 2f __ STA P2 
10f0 : a9 02 __ LDA #$02
10f2 : 85 31 __ STA P4 
10f4 : 85 32 __ STA P5 
10f6 : a9 03 __ LDA #$03
10f8 : 85 33 __ STA P6 
10fa : a9 01 __ LDA #$01
10fc : 85 34 __ STA P7 
10fe : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1101 : a9 fc __ LDA #$fc
1103 : 85 2e __ STA P1 
1105 : a9 00 __ LDA #$00
1107 : 85 2f __ STA P2 
1109 : a9 b8 __ LDA #$b8
110b : 85 30 __ STA P3 
110d : a9 01 __ LDA #$01
110f : 85 31 __ STA P4 
1111 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1114 : a9 18 __ LDA #$18
1116 : 85 2d __ STA P0 
1118 : a9 98 __ LDA #$98
111a : 85 2e __ STA P1 
111c : a9 09 __ LDA #$09
111e : 85 2f __ STA P2 
1120 : a9 00 __ LDA #$00
1122 : 85 30 __ STA P3 
1124 : a9 02 __ LDA #$02
1126 : 85 31 __ STA P4 
1128 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
112b : a9 4c __ LDA #$4c
112d : 85 2e __ STA P1 
112f : a9 01 __ LDA #$01
1131 : 85 2f __ STA P2 
1133 : 85 31 __ STA P4 
1135 : a9 b8 __ LDA #$b8
1137 : 85 30 __ STA P3 
1139 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
113c : a9 01 __ LDA #$01
113e : 85 2e __ STA P1 
1140 : a9 00 __ LDA #$00
1142 : 85 2f __ STA P2 
1144 : 20 1d 19 JSR $191d ; (vera_spr_flip.s0 + 0)
1147 : a9 10 __ LDA #$10
1149 : 85 2d __ STA P0 
114b : a9 20 __ LDA #$20
114d : 85 30 __ STA P3 
114f : a9 00 __ LDA #$00
1151 : 85 31 __ STA P4 
1153 : a9 40 __ LDA #$40
1155 : 85 2e __ STA P1 
1157 : a9 2d __ LDA #$2d
1159 : 85 2f __ STA P2 
115b : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
115e : a9 00 __ LDA #$00
1160 : 85 2d __ STA P0 
1162 : 85 30 __ STA P3 
1164 : 85 33 __ STA P6 
1166 : a9 31 __ LDA #$31
1168 : 85 2e __ STA P1 
116a : a9 01 __ LDA #$01
116c : 85 2f __ STA P2 
116e : a9 02 __ LDA #$02
1170 : 85 34 __ STA P7 
1172 : a9 00 __ LDA #$00
1174 : 85 31 __ STA P4 
1176 : a9 31 __ LDA #$31
1178 : 85 32 __ STA P5 
117a : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
117d : a9 00 __ LDA #$00
117f : 85 4c __ STA T1 + 0 
1181 : 85 4d __ STA T2 + 0 
1183 : a9 03 __ LDA #$03
1185 : 85 33 __ STA P6 
1187 : a9 02 __ LDA #$02
1189 : 85 34 __ STA P7 
118b : 18 __ __ CLC
.l1085:
118c : a9 88 __ LDA #$88
118e : 85 2e __ STA P1 
1190 : a9 09 __ LDA #$09
1192 : 85 2f __ STA P2 
1194 : a9 00 __ LDA #$00
1196 : 85 30 __ STA P3 
1198 : 85 31 __ STA P4 
119a : 85 32 __ STA P5 
119c : a5 4c __ LDA T1 + 0 
119e : 69 19 __ ADC #$19
11a0 : 85 2d __ STA P0 
11a2 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
11a5 : a9 b8 __ LDA #$b8
11a7 : 85 30 __ STA P3 
11a9 : a9 01 __ LDA #$01
11ab : 85 31 __ STA P4 
11ad : 38 __ __ SEC
11ae : a5 4d __ LDA T2 + 0 
11b0 : e9 fc __ SBC #$fc
11b2 : 85 2e __ STA P1 
11b4 : a9 00 __ LDA #$00
11b6 : e9 03 __ SBC #$03
11b8 : 85 2f __ STA P2 
11ba : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
11bd : 18 __ __ CLC
11be : a5 4d __ LDA T2 + 0 
11c0 : 69 0c __ ADC #$0c
11c2 : 85 4d __ STA T2 + 0 
11c4 : e6 4c __ INC T1 + 0 
11c6 : a5 4c __ LDA T1 + 0 
11c8 : c9 08 __ CMP #$08
11ca : 90 c0 __ BCC $118c ; (SetUpSprites.l1085 + 0)
.s138:
11cc : a9 00 __ LDA #$00
11ce : 85 4c __ STA T1 + 0 
11d0 : 85 4d __ STA T2 + 0 
11d2 : a9 03 __ LDA #$03
11d4 : 85 33 __ STA P6 
11d6 : a9 02 __ LDA #$02
11d8 : 85 34 __ STA P7 
11da : 18 __ __ CLC
.l1087:
11db : a9 88 __ LDA #$88
11dd : 85 2e __ STA P1 
11df : a9 09 __ LDA #$09
11e1 : 85 2f __ STA P2 
11e3 : a9 00 __ LDA #$00
11e5 : 85 30 __ STA P3 
11e7 : 85 31 __ STA P4 
11e9 : a5 4c __ LDA T1 + 0 
11eb : 69 21 __ ADC #$21
11ed : 85 2d __ STA P0 
11ef : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
11f2 : a9 c4 __ LDA #$c4
11f4 : 85 30 __ STA P3 
11f6 : a9 01 __ LDA #$01
11f8 : 85 31 __ STA P4 
11fa : 38 __ __ SEC
11fb : a5 4d __ LDA T2 + 0 
11fd : e9 fc __ SBC #$fc
11ff : 85 2e __ STA P1 
1201 : a9 00 __ LDA #$00
1203 : e9 03 __ SBC #$03
1205 : 85 2f __ STA P2 
1207 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
120a : 18 __ __ CLC
120b : a5 4d __ LDA T2 + 0 
120d : 69 0c __ ADC #$0c
120f : 85 4d __ STA T2 + 0 
1211 : e6 4c __ INC T1 + 0 
1213 : a5 4c __ LDA T1 + 0 
1215 : c9 08 __ CMP #$08
1217 : 90 c2 __ BCC $11db ; (SetUpSprites.l1087 + 0)
.s142:
1219 : a9 00 __ LDA #$00
121b : 85 4c __ STA T1 + 0 
121d : 85 4d __ STA T2 + 0 
121f : a9 03 __ LDA #$03
1221 : 85 33 __ STA P6 
1223 : a9 02 __ LDA #$02
1225 : 85 34 __ STA P7 
1227 : 18 __ __ CLC
.l1089:
1228 : a9 88 __ LDA #$88
122a : 85 2e __ STA P1 
122c : a9 09 __ LDA #$09
122e : 85 2f __ STA P2 
1230 : a9 00 __ LDA #$00
1232 : 85 30 __ STA P3 
1234 : 85 31 __ STA P4 
1236 : a5 4c __ LDA T1 + 0 
1238 : 69 29 __ ADC #$29
123a : 85 2d __ STA P0 
123c : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
123f : a9 b8 __ LDA #$b8
1241 : 85 30 __ STA P3 
1243 : a9 01 __ LDA #$01
1245 : 85 31 __ STA P4 
1247 : 38 __ __ SEC
1248 : a9 6c __ LDA #$6c
124a : e5 4d __ SBC T2 + 0 
124c : 85 2e __ STA P1 
124e : a9 02 __ LDA #$02
1250 : e9 04 __ SBC #$04
1252 : 85 2f __ STA P2 
1254 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1257 : 18 __ __ CLC
1258 : a5 4d __ LDA T2 + 0 
125a : 69 0c __ ADC #$0c
125c : 85 4d __ STA T2 + 0 
125e : e6 4c __ INC T1 + 0 
1260 : a5 4c __ LDA T1 + 0 
1262 : c9 08 __ CMP #$08
1264 : 90 c2 __ BCC $1228 ; (SetUpSprites.l1089 + 0)
.s146:
1266 : a9 00 __ LDA #$00
1268 : 85 4c __ STA T1 + 0 
126a : a9 02 __ LDA #$02
126c : 85 34 __ STA P7 
126e : a9 03 __ LDA #$03
1270 : 85 33 __ STA P6 
.l148:
1272 : 38 __ __ SEC
1273 : a9 00 __ LDA #$00
1275 : e5 4c __ SBC T1 + 0 
1277 : 29 0c __ AND #$0c
1279 : 49 ff __ EOR #$ff
127b : 38 __ __ SEC
127c : 69 6c __ ADC #$6c
127e : 85 4d __ STA T2 + 0 
1280 : a9 02 __ LDA #$02
1282 : e9 00 __ SBC #$00
1284 : 85 4e __ STA T2 + 1 
1286 : 18 __ __ CLC
1287 : a5 4c __ LDA T1 + 0 
1289 : 69 31 __ ADC #$31
128b : 85 2d __ STA P0 
128d : a9 02 __ LDA #$02
128f : 85 4f __ STA T5 + 0 
.l1073:
1291 : a9 88 __ LDA #$88
1293 : 85 2e __ STA P1 
1295 : a9 09 __ LDA #$09
1297 : 85 2f __ STA P2 
1299 : a9 00 __ LDA #$00
129b : 85 30 __ STA P3 
129d : 85 31 __ STA P4 
129f : 85 32 __ STA P5 
12a1 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
12a4 : a5 4d __ LDA T2 + 0 
12a6 : 85 2e __ STA P1 
12a8 : a5 4e __ LDA T2 + 1 
12aa : 85 2f __ STA P2 
12ac : a9 b8 __ LDA #$b8
12ae : 85 30 __ STA P3 
12b0 : a9 01 __ LDA #$01
12b2 : 85 31 __ STA P4 
12b4 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
12b7 : c6 4f __ DEC T5 + 0 
12b9 : d0 d6 __ BNE $1291 ; (SetUpSprites.l1073 + 0)
.s149:
12bb : e6 4c __ INC T1 + 0 
12bd : a5 4c __ LDA T1 + 0 
12bf : c9 02 __ CMP #$02
12c1 : 90 af __ BCC $1272 ; (SetUpSprites.l148 + 0)
.s150:
12c3 : a9 40 __ LDA #$40
12c5 : 85 2d __ STA P0 
12c7 : a9 4d __ LDA #$4d
12c9 : 85 2e __ STA P1 
12cb : a9 01 __ LDA #$01
12cd : 85 2f __ STA P2 
12cf : 85 34 __ STA P7 
12d1 : a9 00 __ LDA #$00
12d3 : 85 30 __ STA P3 
12d5 : 85 33 __ STA P6 
12d7 : a9 00 __ LDA #$00
12d9 : 85 31 __ STA P4 
12db : a9 33 __ LDA #$33
12dd : 85 32 __ STA P5 
12df : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
12e2 : a9 33 __ LDA #$33
12e4 : 85 2d __ STA P0 
12e6 : a9 6a __ LDA #$6a
12e8 : 85 2e __ STA P1 
12ea : a9 0a __ LDA #$0a
12ec : 85 2f __ STA P2 
12ee : a9 01 __ LDA #$01
12f0 : 85 31 __ STA P4 
12f2 : a9 02 __ LDA #$02
12f4 : 85 32 __ STA P5 
12f6 : a9 03 __ LDA #$03
12f8 : 85 33 __ STA P6 
12fa : a9 06 __ LDA #$06
12fc : 85 34 __ STA P7 
12fe : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1301 : a9 00 __ LDA #$00
1303 : 85 2e __ STA P1 
1305 : 85 31 __ STA P4 
1307 : a9 01 __ LDA #$01
1309 : 85 2f __ STA P2 
130b : a9 78 __ LDA #$78
130d : 85 30 __ STA P3 
130f : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1312 : a9 00 __ LDA #$00
1314 : 85 2d __ STA P0 
1316 : 85 30 __ STA P3 
1318 : 85 33 __ STA P6 
131a : a9 3d __ LDA #$3d
131c : 85 2e __ STA P1 
131e : a9 04 __ LDA #$04
1320 : 85 34 __ STA P7 
1322 : a9 00 __ LDA #$00
1324 : 85 31 __ STA P4 
1326 : a9 34 __ LDA #$34
1328 : 85 32 __ STA P5 
132a : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
132d : a9 34 __ LDA #$34
132f : 85 2d __ STA P0 
1331 : a9 e8 __ LDA #$e8
1333 : 85 2e __ STA P1 
1335 : a9 09 __ LDA #$09
1337 : 85 2f __ STA P2 
1339 : a9 03 __ LDA #$03
133b : 85 31 __ STA P4 
133d : 85 33 __ STA P6 
133f : a9 02 __ LDA #$02
1341 : 85 32 __ STA P5 
1343 : a9 05 __ LDA #$05
1345 : 85 34 __ STA P7 
1347 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
134a : a9 00 __ LDA #$00
134c : 85 2e __ STA P1 
134e : 85 31 __ STA P4 
1350 : a9 01 __ LDA #$01
1352 : 85 2f __ STA P2 
1354 : a9 78 __ LDA #$78
1356 : 85 30 __ STA P3 
1358 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
135b : a9 35 __ LDA #$35
135d : 85 2d __ STA P0 
135f : a9 08 __ LDA #$08
1361 : 85 2e __ STA P1 
1363 : a9 0a __ LDA #$0a
1365 : 85 2f __ STA P2 
1367 : a9 00 __ LDA #$00
1369 : 85 30 __ STA P3 
136b : a9 03 __ LDA #$03
136d : 85 31 __ STA P4 
136f : a9 07 __ LDA #$07
1371 : 85 33 __ STA P6 
1373 : a9 06 __ LDA #$06
1375 : 85 34 __ STA P7 
1377 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
137a : a9 00 __ LDA #$00
137c : 85 2e __ STA P1 
137e : 85 31 __ STA P4 
1380 : a9 01 __ LDA #$01
1382 : 85 2f __ STA P2 
1384 : a9 e8 __ LDA #$e8
1386 : 85 30 __ STA P3 
1388 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
138b : a9 36 __ LDA #$36
138d : 85 2d __ STA P0 
138f : a9 08 __ LDA #$08
1391 : 85 2e __ STA P1 
1393 : a9 0a __ LDA #$0a
1395 : 85 2f __ STA P2 
1397 : a9 00 __ LDA #$00
1399 : 85 30 __ STA P3 
139b : a9 03 __ LDA #$03
139d : 85 31 __ STA P4 
139f : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
13a2 : a9 40 __ LDA #$40
13a4 : 85 2e __ STA P1 
13a6 : a9 01 __ LDA #$01
13a8 : 85 2f __ STA P2 
13aa : a9 e8 __ LDA #$e8
13ac : 85 30 __ STA P3 
13ae : a9 00 __ LDA #$00
13b0 : 85 31 __ STA P4 
13b2 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
13b5 : a9 01 __ LDA #$01
13b7 : 85 2e __ STA P1 
13b9 : a9 00 __ LDA #$00
13bb : 85 2f __ STA P2 
13bd : 20 1d 19 JSR $191d ; (vera_spr_flip.s0 + 0)
13c0 : a9 37 __ LDA #$37
13c2 : 85 2d __ STA P0 
13c4 : a9 08 __ LDA #$08
13c6 : 85 2e __ STA P1 
13c8 : a9 0a __ LDA #$0a
13ca : 85 2f __ STA P2 
13cc : a9 00 __ LDA #$00
13ce : 85 30 __ STA P3 
13d0 : a9 03 __ LDA #$03
13d2 : 85 31 __ STA P4 
13d4 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
13d7 : a9 00 __ LDA #$00
13d9 : 85 2e __ STA P1 
13db : a9 01 __ LDA #$01
13dd : 85 2f __ STA P2 
13df : 85 31 __ STA P4 
13e1 : a9 08 __ LDA #$08
13e3 : 85 30 __ STA P3 
13e5 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
13e8 : 20 1d 19 JSR $191d ; (vera_spr_flip.s0 + 0)
13eb : a9 38 __ LDA #$38
13ed : 85 2d __ STA P0 
13ef : a9 08 __ LDA #$08
13f1 : 85 2e __ STA P1 
13f3 : a9 0a __ LDA #$0a
13f5 : 85 2f __ STA P2 
13f7 : a9 00 __ LDA #$00
13f9 : 85 30 __ STA P3 
13fb : a9 03 __ LDA #$03
13fd : 85 31 __ STA P4 
13ff : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1402 : a9 40 __ LDA #$40
1404 : 85 2e __ STA P1 
1406 : a9 01 __ LDA #$01
1408 : 85 2f __ STA P2 
140a : 85 31 __ STA P4 
140c : a9 08 __ LDA #$08
140e : 85 30 __ STA P3 
1410 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1413 : a9 01 __ LDA #$01
1415 : 85 2e __ STA P1 
1417 : 20 1d 19 JSR $191d ; (vera_spr_flip.s0 + 0)
141a : a9 00 __ LDA #$00
141c : 85 2d __ STA P0 
141e : 85 30 __ STA P3 
1420 : 85 33 __ STA P6 
1422 : a9 35 __ LDA #$35
1424 : 85 2e __ STA P1 
1426 : a9 08 __ LDA #$08
1428 : 85 34 __ STA P7 
142a : a9 00 __ LDA #$00
142c : 85 31 __ STA P4 
142e : a9 38 __ LDA #$38
1430 : 85 32 __ STA P5 
1432 : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
1435 : a9 00 __ LDA #$00
1437 : 85 4c __ STA T1 + 0 
1439 : 85 4d __ STA T2 + 0 
143b : 85 4e __ STA T2 + 1 
143d : a9 02 __ LDA #$02
143f : 85 33 __ STA P6 
1441 : a9 05 __ LDA #$05
1443 : 85 34 __ STA P7 
1445 : a9 03 __ LDA #$03
1447 : 85 32 __ STA P5 
1449 : 18 __ __ CLC
.l1091:
144a : a9 a8 __ LDA #$a8
144c : 85 2e __ STA P1 
144e : a9 09 __ LDA #$09
1450 : 85 2f __ STA P2 
1452 : a9 00 __ LDA #$00
1454 : 85 30 __ STA P3 
1456 : a9 03 __ LDA #$03
1458 : 85 31 __ STA P4 
145a : a5 4c __ LDA T1 + 0 
145c : 69 39 __ ADC #$39
145e : 85 2d __ STA P0 
1460 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1463 : a9 20 __ LDA #$20
1465 : 85 2e __ STA P1 
1467 : a9 01 __ LDA #$01
1469 : 85 2f __ STA P2 
146b : 38 __ __ SEC
146c : a5 4d __ LDA T2 + 0 
146e : e9 60 __ SBC #$60
1470 : 85 30 __ STA P3 
1472 : a5 4e __ LDA T2 + 1 
1474 : e9 00 __ SBC #$00
1476 : 85 31 __ STA P4 
1478 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
147b : 18 __ __ CLC
147c : a5 4d __ LDA T2 + 0 
147e : 69 40 __ ADC #$40
1480 : 85 4d __ STA T2 + 0 
1482 : 90 02 __ BCC $1486 ; (SetUpSprites.s1094 + 0)
.s1093:
1484 : e6 4e __ INC T2 + 1 
.s1094:
1486 : e6 4c __ INC T1 + 0 
1488 : a5 4c __ LDA T1 + 0 
148a : c9 07 __ CMP #$07
148c : 90 bc __ BCC $144a ; (SetUpSprites.l1091 + 0)
.s158:
148e : a9 40 __ LDA #$40
1490 : 85 2d __ STA P0 
1492 : a9 4f __ LDA #$4f
1494 : 85 2e __ STA P1 
1496 : a9 00 __ LDA #$00
1498 : 85 30 __ STA P3 
149a : 85 33 __ STA P6 
149c : a9 02 __ LDA #$02
149e : 85 34 __ STA P7 
14a0 : a9 00 __ LDA #$00
14a2 : 85 31 __ STA P4 
14a4 : a9 40 __ LDA #$40
14a6 : 85 32 __ STA P5 
14a8 : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
14ab : a9 80 __ LDA #$80
14ad : 85 2d __ STA P0 
14af : 85 33 __ STA P6 
14b1 : a9 4e __ LDA #$4e
14b3 : 85 2e __ STA P1 
14b5 : a9 00 __ LDA #$00
14b7 : 85 34 __ STA P7 
14b9 : a9 60 __ LDA #$60
14bb : 85 31 __ STA P4 
14bd : a9 2d __ LDA #$2d
14bf : 85 32 __ STA P5 
14c1 : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
14c4 : a9 00 __ LDA #$00
14c6 : 85 4b __ STA T0 + 0 
14c8 : a9 0a __ LDA #$0a
14ca : 85 2f __ STA P2 
14cc : a9 02 __ LDA #$02
14ce : 85 33 __ STA P6 
14d0 : a9 08 __ LDA #$08
14d2 : 85 34 __ STA P7 
.l160:
14d4 : a9 74 __ LDA #$74
14d6 : 85 2e __ STA P1 
14d8 : a9 01 __ LDA #$01
14da : 85 31 __ STA P4 
14dc : 85 32 __ STA P5 
14de : 18 __ __ CLC
14df : a5 4b __ LDA T0 + 0 
14e1 : 69 4f __ ADC #$4f
14e3 : 85 2d __ STA P0 
14e5 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
14e8 : a5 4b __ LDA T0 + 0 
14ea : c9 17 __ CMP #$17
14ec : d0 0d __ BNE $14fb ; (SetUpSprites.s288 + 0)
.s163:
14ee : a9 7a __ LDA #$7a
14f0 : 85 2e __ STA P1 
14f2 : a9 02 __ LDA #$02
14f4 : 85 31 __ STA P4 
14f6 : 85 32 __ STA P5 
14f8 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
.s288:
14fb : e6 4b __ INC T0 + 0 
14fd : a5 4b __ LDA T0 + 0 
14ff : c9 18 __ CMP #$18
1501 : 90 d1 __ BCC $14d4 ; (SetUpSprites.l160 + 0)
.s162:
1503 : a9 00 __ LDA #$00
1505 : 85 2d __ STA P0 
1507 : 85 31 __ STA P4 
1509 : a9 20 __ LDA #$20
150b : 85 30 __ STA P3 
150d : a9 e0 __ LDA #$e0
150f : 85 2e __ STA P1 
1511 : a9 2d __ LDA #$2d
1513 : 85 2f __ STA P2 
1515 : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
1518 : a9 20 __ LDA #$20
151a : 85 2d __ STA P0 
151c : a9 00 __ LDA #$00
151e : 85 31 __ STA P4 
1520 : a9 00 __ LDA #$00
1522 : 85 2e __ STA P1 
1524 : a9 42 __ LDA #$42
1526 : 85 2f __ STA P2 
1528 : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
152b : a9 60 __ LDA #$60
152d : 85 2d __ STA P0 
152f : a9 00 __ LDA #$00
1531 : 85 31 __ STA P4 
1533 : a9 20 __ LDA #$20
1535 : 85 2e __ STA P1 
1537 : a9 42 __ LDA #$42
1539 : 85 2f __ STA P2 
153b : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
153e : a9 70 __ LDA #$70
1540 : 85 2d __ STA P0 
1542 : a9 0c __ LDA #$0c
1544 : 85 30 __ STA P3 
1546 : a9 00 __ LDA #$00
1548 : 85 31 __ STA P4 
154a : a9 40 __ LDA #$40
154c : 85 2e __ STA P1 
154e : a9 42 __ LDA #$42
1550 : 85 2f __ STA P2 
1552 : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
1555 : a9 80 __ LDA #$80
1557 : 85 2d __ STA P0 
1559 : a9 20 __ LDA #$20
155b : 85 30 __ STA P3 
155d : a9 00 __ LDA #$00
155f : 85 31 __ STA P4 
1561 : a9 4c __ LDA #$4c
1563 : 85 2e __ STA P1 
1565 : a9 42 __ LDA #$42
1567 : 85 2f __ STA P2 
1569 : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
156c : a9 90 __ LDA #$90
156e : 85 2d __ STA P0 
1570 : a9 10 __ LDA #$10
1572 : 85 30 __ STA P3 
1574 : a9 00 __ LDA #$00
1576 : 85 31 __ STA P4 
1578 : a9 6c __ LDA #$6c
157a : 85 2e __ STA P1 
157c : a9 42 __ LDA #$42
157e : 85 2f __ STA P2 
1580 : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
1583 : a9 a0 __ LDA #$a0
1585 : 85 2d __ STA P0 
1587 : a9 1a __ LDA #$1a
1589 : 85 30 __ STA P3 
158b : a9 00 __ LDA #$00
158d : 85 31 __ STA P4 
158f : a9 7c __ LDA #$7c
1591 : 85 2e __ STA P1 
1593 : a9 42 __ LDA #$42
1595 : 85 2f __ STA P2 
1597 : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
159a : a9 b0 __ LDA #$b0
159c : 85 2d __ STA P0 
159e : a9 1c __ LDA #$1c
15a0 : 85 30 __ STA P3 
15a2 : a9 00 __ LDA #$00
15a4 : 85 31 __ STA P4 
15a6 : a9 96 __ LDA #$96
15a8 : 85 2e __ STA P1 
15aa : a9 42 __ LDA #$42
15ac : 85 2f __ STA P2 
15ae : 20 5a 19 JSR $195a ; (vera_pal_putn.s0 + 0)
15b1 : a9 00 __ LDA #$00
15b3 : 85 2d __ STA P0 
15b5 : 85 30 __ STA P3 
15b7 : 85 33 __ STA P6 
15b9 : a9 41 __ LDA #$41
15bb : 85 2e __ STA P1 
15bd : a9 01 __ LDA #$01
15bf : 85 2f __ STA P2 
15c1 : a9 04 __ LDA #$04
15c3 : 85 34 __ STA P7 
15c5 : a9 b2 __ LDA #$b2
15c7 : 85 31 __ STA P4 
15c9 : a9 42 __ LDA #$42
15cb : 85 32 __ STA P5 
15cd : 20 25 18 JSR $1825 ; (vram_putn.s0 + 0)
15d0 : a9 03 __ LDA #$03
15d2 : 85 32 __ STA P5 
15d4 : 85 34 __ STA P7 
15d6 : a9 08 __ LDA #$08
15d8 : 85 33 __ STA P6 
15da : a9 40 __ LDA #$40
15dc : 85 35 __ STA P8 
15de : a9 57 __ LDA #$57
15e0 : 85 36 __ STA P9 
15e2 : a9 01 __ LDA #$01
15e4 : 85 37 __ STA P10 
15e6 : a9 00 __ LDA #$00
15e8 : 85 38 __ STA P11 
15ea : 8d fa 9e STA $9efa ; (sstack + 0)
15ed : a9 20 __ LDA #$20
15ef : 8d fb 9e STA $9efb ; (sstack + 1)
15f2 : a9 86 __ LDA #$86
15f4 : 85 30 __ STA P3 
15f6 : a9 1a __ LDA #$1a
15f8 : 85 31 __ STA P4 
15fa : 20 a3 19 JSR $19a3 ; (LoadSprite.s0 + 0)
15fd : a9 03 __ LDA #$03
15ff : 85 2d __ STA P0 
1601 : 85 31 __ STA P4 
1603 : a9 ba __ LDA #$ba
1605 : 85 2e __ STA P1 
1607 : a9 0a __ LDA #$0a
1609 : 85 2f __ STA P2 
160b : a9 00 __ LDA #$00
160d : 85 30 __ STA P3 
160f : a9 07 __ LDA #$07
1611 : 85 33 __ STA P6 
1613 : a9 0b __ LDA #$0b
1615 : 85 34 __ STA P7 
1617 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
161a : a9 08 __ LDA #$08
161c : 85 2e __ STA P1 
161e : 85 30 __ STA P3 
1620 : a9 00 __ LDA #$00
1622 : 85 2f __ STA P2 
1624 : 85 31 __ STA P4 
1626 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1629 : a9 04 __ LDA #$04
162b : 85 2d __ STA P0 
162d : a9 fa __ LDA #$fa
162f : 85 2e __ STA P1 
1631 : a9 0a __ LDA #$0a
1633 : 85 2f __ STA P2 
1635 : a9 00 __ LDA #$00
1637 : 85 30 __ STA P3 
1639 : a9 03 __ LDA #$03
163b : 85 31 __ STA P4 
163d : 85 33 __ STA P6 
163f : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1642 : a9 48 __ LDA #$48
1644 : 85 2e __ STA P1 
1646 : a9 00 __ LDA #$00
1648 : 85 2f __ STA P2 
164a : 85 31 __ STA P4 
164c : a9 08 __ LDA #$08
164e : 85 30 __ STA P3 
1650 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1653 : a9 05 __ LDA #$05
1655 : 85 2d __ STA P0 
1657 : a9 3a __ LDA #$3a
1659 : 85 2e __ STA P1 
165b : a9 0b __ LDA #$0b
165d : 85 2f __ STA P2 
165f : a9 00 __ LDA #$00
1661 : 85 30 __ STA P3 
1663 : a9 03 __ LDA #$03
1665 : 85 31 __ STA P4 
1667 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
166a : a9 08 __ LDA #$08
166c : 85 2e __ STA P1 
166e : a9 00 __ LDA #$00
1670 : 85 2f __ STA P2 
1672 : 85 31 __ STA P4 
1674 : a9 48 __ LDA #$48
1676 : 85 30 __ STA P3 
1678 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
167b : a9 06 __ LDA #$06
167d : 85 2d __ STA P0 
167f : a9 7a __ LDA #$7a
1681 : 85 2e __ STA P1 
1683 : a9 0b __ LDA #$0b
1685 : 85 2f __ STA P2 
1687 : a9 00 __ LDA #$00
1689 : 85 30 __ STA P3 
168b : a9 03 __ LDA #$03
168d : 85 31 __ STA P4 
168f : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1692 : a9 48 __ LDA #$48
1694 : 85 2e __ STA P1 
1696 : 85 30 __ STA P3 
1698 : a9 00 __ LDA #$00
169a : 85 2f __ STA P2 
169c : 85 31 __ STA P4 
169e : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
16a1 : a9 07 __ LDA #$07
16a3 : 85 2d __ STA P0 
16a5 : 85 33 __ STA P6 
16a7 : a9 ba __ LDA #$ba
16a9 : 85 2e __ STA P1 
16ab : a9 0a __ LDA #$0a
16ad : 85 2f __ STA P2 
16af : a9 00 __ LDA #$00
16b1 : 85 30 __ STA P3 
16b3 : a9 03 __ LDA #$03
16b5 : 85 31 __ STA P4 
16b7 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
16ba : a9 f8 __ LDA #$f8
16bc : 85 2e __ STA P1 
16be : a9 01 __ LDA #$01
16c0 : 85 2f __ STA P2 
16c2 : a9 08 __ LDA #$08
16c4 : 85 30 __ STA P3 
16c6 : a9 00 __ LDA #$00
16c8 : 85 31 __ STA P4 
16ca : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
16cd : a9 08 __ LDA #$08
16cf : 85 2d __ STA P0 
16d1 : a9 fa __ LDA #$fa
16d3 : 85 2e __ STA P1 
16d5 : a9 0a __ LDA #$0a
16d7 : 85 2f __ STA P2 
16d9 : a9 00 __ LDA #$00
16db : 85 30 __ STA P3 
16dd : a9 03 __ LDA #$03
16df : 85 31 __ STA P4 
16e1 : 85 33 __ STA P6 
16e3 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
16e6 : a9 38 __ LDA #$38
16e8 : 85 2e __ STA P1 
16ea : a9 02 __ LDA #$02
16ec : 85 2f __ STA P2 
16ee : a9 08 __ LDA #$08
16f0 : 85 30 __ STA P3 
16f2 : a9 00 __ LDA #$00
16f4 : 85 31 __ STA P4 
16f6 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
16f9 : a9 09 __ LDA #$09
16fb : 85 2d __ STA P0 
16fd : a9 3a __ LDA #$3a
16ff : 85 2e __ STA P1 
1701 : a9 0b __ LDA #$0b
1703 : 85 2f __ STA P2 
1705 : a9 00 __ LDA #$00
1707 : 85 30 __ STA P3 
1709 : a9 03 __ LDA #$03
170b : 85 31 __ STA P4 
170d : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
1710 : a9 f8 __ LDA #$f8
1712 : 85 2e __ STA P1 
1714 : a9 01 __ LDA #$01
1716 : 85 2f __ STA P2 
1718 : a9 48 __ LDA #$48
171a : 85 30 __ STA P3 
171c : a9 00 __ LDA #$00
171e : 85 31 __ STA P4 
1720 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1723 : a9 0a __ LDA #$0a
1725 : 85 2d __ STA P0 
1727 : a9 7a __ LDA #$7a
1729 : 85 2e __ STA P1 
172b : a9 0b __ LDA #$0b
172d : 85 2f __ STA P2 
172f : a9 00 __ LDA #$00
1731 : 85 30 __ STA P3 
1733 : a9 03 __ LDA #$03
1735 : 85 31 __ STA P4 
1737 : 20 87 18 JSR $1887 ; (vera_spr_set.s0 + 0)
173a : a9 38 __ LDA #$38
173c : 85 2e __ STA P1 
173e : a9 02 __ LDA #$02
1740 : 85 2f __ STA P2 
1742 : a9 48 __ LDA #$48
1744 : 85 30 __ STA P3 
1746 : a9 00 __ LDA #$00
1748 : 85 31 __ STA P4 
174a : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
174d : ad 29 9f LDA $9f29 
1750 : 09 70 __ ORA #$70
1752 : 8d 29 9f STA $9f29 
.s1001:
1755 : 60 __ __ RTS
.s1031:
1756 : c9 34 __ CMP #$34
1758 : 90 05 __ BCC $175f ; (SetUpSprites.s1030 + 0)
.s89:
175a : a9 09 __ LDA #$09
175c : 4c da 0f JMP $0fda ; (SetUpSprites.s279 + 0)
.s1030:
175f : a9 2c __ LDA #$2c
1761 : c5 25 __ CMP WORK + 2 
1763 : 90 38 __ BCC $179d ; (SetUpSprites.s1023 + 0)
.s1029:
1765 : a5 4d __ LDA T2 + 0 
1767 : c9 08 __ CMP #$08
1769 : 90 06 __ BCC $1771 ; (SetUpSprites.s95 + 0)
.s1028:
176b : a9 48 __ LDA #$48
176d : c5 4d __ CMP T2 + 0 
176f : b0 05 __ BCS $1776 ; (SetUpSprites.s1027 + 0)
.s95:
1771 : a9 00 __ LDA #$00
1773 : 4c da 0f JMP $0fda ; (SetUpSprites.s279 + 0)
.s1027:
1776 : a5 4d __ LDA T2 + 0 
1778 : c9 0c __ CMP #$0c
177a : 90 06 __ BCC $1782 ; (SetUpSprites.s99 + 0)
.s1026:
177c : a9 44 __ LDA #$44
177e : c5 4d __ CMP T2 + 0 
1780 : b0 05 __ BCS $1787 ; (SetUpSprites.s1025 + 0)
.s99:
1782 : a9 01 __ LDA #$01
1784 : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
.s1025:
1787 : a5 4d __ LDA T2 + 0 
1789 : c9 18 __ CMP #$18
178b : 90 06 __ BCC $1793 ; (SetUpSprites.s103 + 0)
.s1024:
178d : a9 38 __ LDA #$38
178f : c5 4d __ CMP T2 + 0 
1791 : b0 05 __ BCS $1798 ; (SetUpSprites.s104 + 0)
.s103:
1793 : a9 02 __ LDA #$02
1795 : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
.s104:
1798 : a9 03 __ LDA #$03
179a : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
.s1023:
179d : a9 2f __ LDA #$2f
179f : c5 25 __ CMP WORK + 2 
17a1 : a5 4d __ LDA T2 + 0 
17a3 : 90 36 __ BCC $17db ; (SetUpSprites.s1016 + 0)
.s1022:
17a5 : c9 08 __ CMP #$08
17a7 : 90 06 __ BCC $17af ; (SetUpSprites.s111 + 0)
.s1021:
17a9 : a9 48 __ LDA #$48
17ab : c5 4d __ CMP T2 + 0 
17ad : b0 05 __ BCS $17b4 ; (SetUpSprites.s1020 + 0)
.s111:
17af : a9 05 __ LDA #$05
17b1 : 4c da 0f JMP $0fda ; (SetUpSprites.s279 + 0)
.s1020:
17b4 : a5 4d __ LDA T2 + 0 
17b6 : c9 0c __ CMP #$0c
17b8 : 90 06 __ BCC $17c0 ; (SetUpSprites.s115 + 0)
.s1019:
17ba : a9 44 __ LDA #$44
17bc : c5 4d __ CMP T2 + 0 
17be : b0 05 __ BCS $17c5 ; (SetUpSprites.s1018 + 0)
.s115:
17c0 : a9 06 __ LDA #$06
17c2 : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
.s1018:
17c5 : a5 4d __ LDA T2 + 0 
17c7 : c9 18 __ CMP #$18
17c9 : 90 06 __ BCC $17d1 ; (SetUpSprites.s119 + 0)
.s1017:
17cb : a9 38 __ LDA #$38
17cd : c5 4d __ CMP T2 + 0 
17cf : b0 05 __ BCS $17d6 ; (SetUpSprites.s120 + 0)
.s119:
17d1 : a9 07 __ LDA #$07
17d3 : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
.s120:
17d6 : a9 08 __ LDA #$08
17d8 : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
.s1016:
17db : c9 08 __ CMP #$08
17dd : 90 06 __ BCC $17e5 ; (SetUpSprites.s123 + 0)
.s1015:
17df : a9 48 __ LDA #$48
17e1 : c5 4d __ CMP T2 + 0 
17e3 : b0 05 __ BCS $17ea ; (SetUpSprites.s1004 + 0)
.s123:
17e5 : a9 0c __ LDA #$0c
17e7 : 4c da 0f JMP $0fda ; (SetUpSprites.s279 + 0)
.s1004:
17ea : a5 4d __ LDA T2 + 0 
17ec : c9 0c __ CMP #$0c
17ee : 90 06 __ BCC $17f6 ; (SetUpSprites.s127 + 0)
.s1003:
17f0 : a9 44 __ LDA #$44
17f2 : c5 4d __ CMP T2 + 0 
17f4 : b0 05 __ BCS $17fb ; (SetUpSprites.s131 + 0)
.s127:
17f6 : a9 0d __ LDA #$0d
17f8 : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
.s131:
17fb : a9 0e __ LDA #$0e
17fd : 4c 70 0f JMP $0f70 ; (SetUpSprites.s296 + 0)
--------------------------------------------------------------------
VolAddr:
21fb : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
IndAddr:
25f4 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1800 : 46 2d __ LSR P0 ; (bank + 0)
1802 : a9 00 __ LDA #$00
1804 : 6a __ __ ROR
1805 : 85 3b __ STA ACCU + 0 
1807 : a5 2f __ LDA P2 ; (mem + 1)
1809 : 29 f8 __ AND #$f8
180b : 4a __ __ LSR
180c : 05 3b __ ORA ACCU + 0 
180e : 85 3b __ STA ACCU + 0 
1810 : a5 30 __ LDA P3 ; (height + 0)
1812 : 0a __ __ ASL
1813 : 05 3b __ ORA ACCU + 0 
1815 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1817 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1818 : 46 2d __ LSR P0 ; (bank + 0)
181a : a9 00 __ LDA #$00
181c : 6a __ __ ROR
181d : 85 3b __ STA ACCU + 0 
181f : a5 2f __ LDA P2 ; (mem + 1)
1821 : 4a __ __ LSR
1822 : 05 3b __ ORA ACCU + 0 
.s1001:
1824 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1825 : ad 25 9f LDA $9f25 
1828 : 29 fe __ AND #$fe
182a : 8d 25 9f STA $9f25 
182d : a5 2d __ LDA P0 ; (addr + 0)
182f : 8d 20 9f STA $9f20 
1832 : a5 2e __ LDA P1 ; (addr + 1)
1834 : 8d 21 9f STA $9f21 
1837 : a5 2f __ LDA P2 ; (addr + 2)
1839 : 29 01 __ AND #$01
183b : 09 10 __ ORA #$10
183d : 8d 22 9f STA $9f22 
1840 : a5 33 __ LDA P6 ; (size + 0)
1842 : 05 34 __ ORA P7 ; (size + 1)
1844 : f0 19 __ BEQ $185f ; (vram_putn.s1001 + 0)
.s6:
1846 : a0 00 __ LDY #$00
1848 : a6 33 __ LDX P6 ; (size + 0)
184a : f0 02 __ BEQ $184e ; (vram_putn.l1002 + 0)
.s1005:
184c : e6 34 __ INC P7 ; (size + 1)
.l1002:
184e : b1 31 __ LDA (P4),y ; (data + 0)
1850 : 8d 23 9f STA $9f23 
1853 : c8 __ __ INY
1854 : d0 02 __ BNE $1858 ; (vram_putn.s1009 + 0)
.s1008:
1856 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1858 : ca __ __ DEX
1859 : d0 f3 __ BNE $184e ; (vram_putn.l1002 + 0)
.s1004:
185b : c6 34 __ DEC P7 ; (size + 1)
185d : d0 ef __ BNE $184e ; (vram_putn.l1002 + 0)
.s1001:
185f : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
2620 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2630 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2640 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2650 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2660 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2670 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2680 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2690 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
26a0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
26b0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
26c0 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
26d0 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
26e0 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
26f0 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
2700 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
2710 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
2720 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
2730 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
2740 : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
2750 : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
2760 : __ __ __ BYT 55 55 55 55 55 55 55 55 66 66 66 66 33 33 33 33 : UUUUUUUUffff3333
2770 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2780 : __ __ __ BYT 33 33 33 33 33 33 33 33 77 77 77 77 77 77 77 77 : 33333333wwwwwwww
2790 : __ __ __ BYT 77 77 77 77 77 77 77 77 00 00 00 00 00 00 00 00 : wwwwwwww........
27a0 : __ __ __ BYT 05 00 00 50 00 08 80 00 00 89 98 00 08 95 59 80 : ...P..........Y.
27b0 : __ __ __ BYT 08 95 59 80 00 89 98 05 00 08 80 00 05 00 00 00 : ..Y.............
27c0 : __ __ __ BYT 13 11 11 11 11 11 11 31 11 18 81 11 11 89 98 11 : .......1........
27d0 : __ __ __ BYT 11 89 98 11 11 18 81 13 11 11 11 11 13 11 11 11 : ................
27e0 : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 18 81 11 : ................
27f0 : __ __ __ BYT 11 18 81 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
2800 : __ __ __ BYT aa aa aa aa ab bb bb bb ab cc cc cc ab cc cc cc : ................
2810 : __ __ __ BYT ab cc dd dd ab cc dd dd ab cc dd ee ab cc dd ef : ................
2820 : __ __ __ BYT aa aa aa aa bb bb bb bb cc cc cc cc cc cc cc cc : ................
2830 : __ __ __ BYT dd dd dd dd dd dd dd dd ee ee ee ee ff ff ff ff : ................
2840 : __ __ __ BYT aa aa aa aa bb bb bb ba cc cc cc ba cc cc cc ba : ................
2850 : __ __ __ BYT dd dd cc ba dd dd cc ba ee dd cc ba fe dd cc ba : ................
2860 : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
2870 : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
2880 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2890 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
28a0 : __ __ __ BYT ab cc dd ef ab cc dd ee ab cc dd dd ab cc dd dd : ................
28b0 : __ __ __ BYT ab cc cc cc ab cc cc cc ab bb bb bb aa aa aa aa : ................
28c0 : __ __ __ BYT ff ff ff ff ee ee ee ee dd dd dd dd dd dd dd dd : ................
28d0 : __ __ __ BYT cc cc cc cc cc cc cc cc bb bb bb bb aa aa aa aa : ................
28e0 : __ __ __ BYT fe dd cc ba ee dd cc ba dd dd cc ba dd dd cc ba : ................
28f0 : __ __ __ BYT cc cc cc ba cc cc cc ba bb bb bb ba aa aa aa aa : ................
2900 : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
2910 : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
2920 : __ __ __ BYT 22 22 22 22 22 22 33 22 22 23 22 22 22 44 44 22 : """"""3""#"""DD"
2930 : __ __ __ BYT 24 84 84 82 22 44 44 22 23 23 32 32 22 22 22 22 : $..."DD"##22""""
--------------------------------------------------------------------
rand:
.s0:
1860 : ad f9 25 LDA $25f9 ; (seed + 1)
1863 : 4a __ __ LSR
1864 : ad f8 25 LDA $25f8 ; (seed + 0)
1867 : 6a __ __ ROR
1868 : aa __ __ TAX
1869 : a9 00 __ LDA #$00
186b : 6a __ __ ROR
186c : 4d f8 25 EOR $25f8 ; (seed + 0)
186f : 85 3b __ STA ACCU + 0 
1871 : 8a __ __ TXA
1872 : 4d f9 25 EOR $25f9 ; (seed + 1)
1875 : 85 3c __ STA ACCU + 1 
1877 : 4a __ __ LSR
1878 : 45 3b __ EOR ACCU + 0 
187a : 8d f8 25 STA $25f8 ; (seed + 0)
187d : 85 3b __ STA ACCU + 0 
187f : 45 3c __ EOR ACCU + 1 
1881 : 8d f9 25 STA $25f9 ; (seed + 1)
1884 : 85 3c __ STA ACCU + 1 
.s1001:
1886 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
25f8 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
2940 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
2950 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
2960 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
2970 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
2980 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
2990 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
29a0 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
29b0 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
29c0 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
29d0 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
29e0 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
29f0 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
2a00 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
2a10 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
2a20 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
2a30 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
2a40 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
2a50 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
2a60 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
2a70 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
2a80 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
2a90 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
2aa0 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
2ab0 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
2ac0 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
2ad0 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
2ae0 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
2af0 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
2b00 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
2b10 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
2b20 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
2b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
2b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b60 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
2b70 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
2b80 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2b90 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2ba0 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
2bb0 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
2bc0 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
2bd0 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
2be0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c00 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
2c10 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
2c20 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
2c30 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
2c40 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
2c50 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
2c60 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
2c70 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2c80 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2c90 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2ca0 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2cb0 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2cc0 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
2cd0 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
2ce0 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
2cf0 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
2d00 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
2d10 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
2d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
2d30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
1887 : ad 25 9f LDA $9f25 
188a : 29 fe __ AND #$fe
188c : 8d 25 9f STA $9f25 
188f : a5 2d __ LDA P0 ; (spr + 0)
1891 : 0a __ __ ASL
1892 : 0a __ __ ASL
1893 : 85 3b __ STA ACCU + 0 
1895 : a9 3f __ LDA #$3f
1897 : 2a __ __ ROL
1898 : 06 3b __ ASL ACCU + 0 
189a : 2a __ __ ROL
189b : 8d 21 9f STA $9f21 
189e : a5 3b __ LDA ACCU + 0 
18a0 : 8d 20 9f STA $9f20 
18a3 : a9 11 __ LDA #$11
18a5 : 8d 22 9f STA $9f22 
18a8 : a5 30 __ LDA P3 ; (mode8 + 0)
18aa : f0 02 __ BEQ $18ae ; (vera_spr_set.s11 + 0)
.s9:
18ac : a9 80 __ LDA #$80
.s11:
18ae : 05 2f __ ORA P2 ; (addr32 + 1)
18b0 : a6 2e __ LDX P1 ; (addr32 + 0)
18b2 : 8e 23 9f STX $9f23 
18b5 : 8d 23 9f STA $9f23 
18b8 : a9 00 __ LDA #$00
18ba : 8d 23 9f STA $9f23 
18bd : 8d 23 9f STA $9f23 
18c0 : 8d 23 9f STA $9f23 
18c3 : 8d 23 9f STA $9f23 
18c6 : a5 33 __ LDA P6 ; (z + 0)
18c8 : 0a __ __ ASL
18c9 : 0a __ __ ASL
18ca : 8d 23 9f STA $9f23 
18cd : a5 32 __ LDA P5 ; (h + 0)
18cf : 4a __ __ LSR
18d0 : 6a __ __ ROR
18d1 : 29 80 __ AND #$80
18d3 : 6a __ __ ROR
18d4 : 85 3b __ STA ACCU + 0 
18d6 : a5 31 __ LDA P4 ; (w + 0)
18d8 : 0a __ __ ASL
18d9 : 0a __ __ ASL
18da : 0a __ __ ASL
18db : 0a __ __ ASL
18dc : 05 3b __ ORA ACCU + 0 
18de : 05 34 __ ORA P7 ; (pal + 0)
18e0 : 8d 23 9f STA $9f23 
.s1001:
18e3 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
18e4 : ad 25 9f LDA $9f25 
18e7 : 29 fe __ AND #$fe
18e9 : 8d 25 9f STA $9f25 
18ec : a5 2d __ LDA P0 ; (spr + 0)
18ee : 0a __ __ ASL
18ef : 0a __ __ ASL
18f0 : 85 3b __ STA ACCU + 0 
18f2 : a9 3f __ LDA #$3f
18f4 : 2a __ __ ROL
18f5 : 06 3b __ ASL ACCU + 0 
18f7 : 2a __ __ ROL
18f8 : aa __ __ TAX
18f9 : a5 3b __ LDA ACCU + 0 
18fb : 09 02 __ ORA #$02
18fd : 8d 20 9f STA $9f20 
1900 : 8e 21 9f STX $9f21 
1903 : a9 11 __ LDA #$11
1905 : 8d 22 9f STA $9f22 
1908 : a5 2e __ LDA P1 ; (x + 0)
190a : 8d 23 9f STA $9f23 
190d : a5 2f __ LDA P2 ; (x + 1)
190f : 8d 23 9f STA $9f23 
1912 : a5 30 __ LDA P3 ; (y + 0)
1914 : 8d 23 9f STA $9f23 
1917 : a5 31 __ LDA P4 ; (y + 1)
1919 : 8d 23 9f STA $9f23 
.s1001:
191c : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e10 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2e20 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2e30 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2e40 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2e50 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2e60 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2e70 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2e80 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2e90 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2ea0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2eb0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2ec0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2ed0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
2ee0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
2ef0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2f10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2f20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2f30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2f40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2f50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2f60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2f70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2f80 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2f90 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
2fa0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
2fb0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
2fc0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
2fd0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
2fe0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
2ff0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
3000 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
3010 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
3020 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
3030 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
3040 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
3050 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
3060 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
3070 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
3080 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
3090 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
30a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
30b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
30c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
30d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
30e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
30f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_spr_flip:
.s0:
191d : ad 25 9f LDA $9f25 
1920 : 29 fe __ AND #$fe
1922 : 8d 25 9f STA $9f25 
1925 : a5 2d __ LDA P0 ; (spr + 0)
1927 : 0a __ __ ASL
1928 : 0a __ __ ASL
1929 : 85 3b __ STA ACCU + 0 
192b : a9 3f __ LDA #$3f
192d : 2a __ __ ROL
192e : 06 3b __ ASL ACCU + 0 
1930 : 2a __ __ ROL
1931 : aa __ __ TAX
1932 : a5 3b __ LDA ACCU + 0 
1934 : 09 06 __ ORA #$06
1936 : 8d 20 9f STA $9f20 
1939 : 8e 21 9f STX $9f21 
193c : a9 01 __ LDA #$01
193e : 8d 22 9f STA $9f22 
1941 : ad 23 9f LDA $9f23 
1944 : 29 fc __ AND #$fc
1946 : a8 __ __ TAY
1947 : a5 2e __ LDA P1 ; (fliph + 0)
1949 : f0 01 __ BEQ $194c ; (vera_spr_flip.s14 + 0)
.s6:
194b : c8 __ __ INY
.s14:
194c : a5 2f __ LDA P2 ; (flipv + 0)
194e : f0 05 __ BEQ $1955 ; (vera_spr_flip.s11 + 0)
.s9:
1950 : 98 __ __ TYA
1951 : 09 02 __ ORA #$02
1953 : d0 01 __ BNE $1956 ; (vera_spr_flip.s1002 + 0)
.s11:
1955 : 98 __ __ TYA
.s1002:
1956 : 8d 23 9f STA $9f23 
.s1001:
1959 : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
195a : ad 25 9f LDA $9f25 
195d : 29 fe __ AND #$fe
195f : 8d 25 9f STA $9f25 
1962 : a5 2d __ LDA P0 ; (index + 0)
1964 : 0a __ __ ASL
1965 : 8d 20 9f STA $9f20 
1968 : a9 7d __ LDA #$7d
196a : 2a __ __ ROL
196b : 8d 21 9f STA $9f21 
196e : a9 11 __ LDA #$11
1970 : 8d 22 9f STA $9f22 
1973 : a5 30 __ LDA P3 ; (size + 0)
1975 : 05 31 __ ORA P4 ; (size + 1)
1977 : f0 29 __ BEQ $19a2 ; (vera_pal_putn.s1001 + 0)
.s6:
1979 : a6 30 __ LDX P3 ; (size + 0)
197b : f0 02 __ BEQ $197f ; (vera_pal_putn.l3 + 0)
.s1003:
197d : e6 31 __ INC P4 ; (size + 1)
.l3:
197f : a0 01 __ LDY #$01
1981 : b1 2e __ LDA (P1),y ; (color + 0)
1983 : 85 3c __ STA ACCU + 1 
1985 : 88 __ __ DEY
1986 : b1 2e __ LDA (P1),y ; (color + 0)
1988 : 8d 23 9f STA $9f23 
198b : a5 3c __ LDA ACCU + 1 
198d : 8d 23 9f STA $9f23 
1990 : 18 __ __ CLC
1991 : a5 2e __ LDA P1 ; (color + 0)
1993 : 69 02 __ ADC #$02
1995 : 85 2e __ STA P1 ; (color + 0)
1997 : 90 02 __ BCC $199b ; (vera_pal_putn.s1007 + 0)
.s1006:
1999 : e6 2f __ INC P2 ; (color + 1)
.s1007:
199b : ca __ __ DEX
199c : d0 e1 __ BNE $197f ; (vera_pal_putn.l3 + 0)
.s1002:
199e : c6 31 __ DEC P4 ; (size + 1)
19a0 : d0 dd __ BNE $197f ; (vera_pal_putn.l3 + 0)
.s1001:
19a2 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2d40 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2d50 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
3100 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3110 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3120 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3130 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3140 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3150 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3160 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3170 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3180 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3190 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
31a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
31b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
31c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
31d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
31e0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
31f0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
3200 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3210 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3220 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3230 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3240 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3250 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3260 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3270 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3280 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
3290 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
32a0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
32b0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
32c0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
32d0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
32e0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
32f0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
3300 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
3310 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
3320 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
3330 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
3340 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
3350 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
3360 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
3370 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
3380 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
3390 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
33a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
33b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
33c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
33d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
33e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
33f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
3400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
3410 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3420 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
3430 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
3440 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
3450 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
3460 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3470 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
3480 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3490 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
34a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
34b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
34c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
34d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
34e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
34f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3500 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
3510 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3520 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
3530 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
3540 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
3550 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
3560 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3570 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
3580 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3590 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
35a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
35b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
35c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
35d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
35e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
35f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3600 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
3610 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3620 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3630 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
3640 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3650 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
3660 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3670 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
3680 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3690 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
36a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
36b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
36c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
36d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
36e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
36f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3700 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
3710 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3720 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
3730 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
3740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
3750 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
3760 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3770 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
3780 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3790 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
37a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
37b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
37c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
37d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
37e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
37f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
3800 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3810 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3820 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3830 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3840 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3850 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3860 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3870 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3880 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3890 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
38a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
38b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
38c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
38d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
38e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
38f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3900 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3910 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3920 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3930 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3940 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3950 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3960 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3970 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3980 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3990 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
39a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
39b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
39c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
39d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
39e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
39f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a00 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a10 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a20 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a30 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a40 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a50 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a60 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a70 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a80 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a90 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3aa0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3ab0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3ac0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3ad0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3ae0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3af0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3b00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3ba0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3bb0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3bc0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3bd0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3be0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3bf0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3c00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3c10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3c20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3c30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3c40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3c50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3c60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3c70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3c80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3c90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3ca0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3cb0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3cc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3cd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3ce0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3cf0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3d00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3d10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3d20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3d30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3d40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3d50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3d60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3d70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3d80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3d90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3da0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3db0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3dc0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3dd0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3de0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3df0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3e00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3e10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3e20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3e30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3e40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3e50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3e60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3e70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3e80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3e90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3ea0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3eb0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3ec0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3ed0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3ee0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3ef0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3f00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3f10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3f20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3f30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3f40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3f50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3f60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3f70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3f80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3f90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3fa0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3fb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3fc0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3fd0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3fe0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3ff0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
WavyHead:
4000 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
4010 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4020 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4030 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4040 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4050 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4060 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
4070 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4080 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4090 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
40a0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
40b0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
40c0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
40d0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
40e0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
40f0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4100 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4110 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4120 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4130 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4140 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4150 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4160 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4170 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4180 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4190 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
41a0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
41b0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
41c0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
41d0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
41e0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
41f0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
2d60 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
2d70 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
2d80 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
2d90 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
2da0 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
2db0 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
2dc0 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
2dd0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
BGPal:
2de0 : __ __ __ BYT 24 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : $.......&.....f.
2df0 : __ __ __ BYT 9f 0b ef 0e 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 : ......m.M.).+.-.
--------------------------------------------------------------------
ButtonStageMax:
4200 : __ __ __ BYT f4 04 e4 04 d4 04 c4 04 b3 03 a3 03 93 03 83 03 : ................
4210 : __ __ __ BYT 72 02 62 02 52 02 41 01 31 01 21 01 10 00 00 00 : r.b.R.A.1.!.....
--------------------------------------------------------------------
CharBoxPalette:
4220 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 00 00 00 00 : ..m.M.).+.-.....
4230 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavyPal:
4240 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
424c : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
425c : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
426c : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
427c : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
428c : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
CoderPal:
4296 : __ __ __ BYT 00 00 00 00 ff 0f dd 0d b2 02 d4 04 e5 05 fb 00 : ................
42a6 : __ __ __ BYT bf 00 10 0c 22 0f 1b 01 00 00 00 00             : ....".......
--------------------------------------------------------------------
EyeTri:
42b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
42d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
42f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4302 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4312 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4322 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4332 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4342 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4352 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4362 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4372 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4382 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4392 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
43b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43c2 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
43d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43e2 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
43f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4402 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4412 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4422 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4432 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4442 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4452 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4462 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4472 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4482 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4492 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44a2 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
44b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
44c2 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
44d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
44e2 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
44f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4502 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
4512 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4522 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4532 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4542 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4552 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4562 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4572 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
4582 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
4592 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
45a2 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
45b2 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
45c2 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
45d2 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
45e2 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
45f2 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4602 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
4612 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4622 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4632 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4642 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4652 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4662 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4672 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
4682 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
4692 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
46a2 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
19a3 : a5 30 __ LDA P3 ; (name + 0)
19a5 : 85 2d __ STA P0 
19a7 : a5 31 __ LDA P4 ; (name + 1)
19a9 : 85 2e __ STA P1 
19ab : 20 20 1a JSR $1a20 ; (krnio_setnam.s0 + 0)
19ae : a5 32 __ LDA P5 ; (fnum + 0)
19b0 : 85 2d __ STA P0 
19b2 : a5 33 __ LDA P6 ; (device + 0)
19b4 : 85 2e __ STA P1 
19b6 : a5 34 __ LDA P7 ; (channel + 0)
19b8 : 85 2f __ STA P2 
19ba : 20 36 1a JSR $1a36 ; (krnio_open.s0 + 0)
19bd : a5 32 __ LDA P5 ; (fnum + 0)
19bf : 20 5e 1a JSR $1a5e ; (krnio_chkin.s1000 + 0)
19c2 : 20 70 1a JSR $1a70 ; (krnio_chrin.s0 + 0)
19c5 : 20 70 1a JSR $1a70 ; (krnio_chrin.s0 + 0)
19c8 : ad fb 9e LDA $9efb ; (sstack + 1)
19cb : 85 48 __ STA T0 + 1 
19cd : ad fa 9e LDA $9efa ; (sstack + 0)
19d0 : 85 47 __ STA T0 + 0 
19d2 : 05 48 __ ORA T0 + 1 
19d4 : f0 42 __ BEQ $1a18 ; (LoadSprite.s4 + 0)
.s8:
19d6 : a9 00 __ LDA #$00
19d8 : 85 49 __ STA T2 + 0 
19da : 85 4a __ STA T2 + 1 
.l2:
19dc : 20 70 1a JSR $1a70 ; (krnio_chrin.s0 + 0)
19df : ad 25 9f LDA $9f25 
19e2 : 29 fe __ AND #$fe
19e4 : 8d 25 9f STA $9f25 
19e7 : 18 __ __ CLC
19e8 : a5 49 __ LDA T2 + 0 
19ea : 65 35 __ ADC P8 ; (Addr + 0)
19ec : 8d 20 9f STA $9f20 
19ef : a5 4a __ LDA T2 + 1 
19f1 : 65 36 __ ADC P9 ; (Addr + 1)
19f3 : 8d 21 9f STA $9f21 
19f6 : a9 00 __ LDA #$00
19f8 : 65 37 __ ADC P10 ; (Addr + 2)
19fa : 29 01 __ AND #$01
19fc : 09 10 __ ORA #$10
19fe : 8d 22 9f STA $9f22 
1a01 : a5 3b __ LDA ACCU + 0 
1a03 : 8d 23 9f STA $9f23 
1a06 : e6 49 __ INC T2 + 0 
1a08 : d0 02 __ BNE $1a0c ; (LoadSprite.s1005 + 0)
.s1004:
1a0a : e6 4a __ INC T2 + 1 
.s1005:
1a0c : a5 4a __ LDA T2 + 1 
1a0e : c5 48 __ CMP T0 + 1 
1a10 : d0 04 __ BNE $1a16 ; (LoadSprite.s1003 + 0)
.s1002:
1a12 : a5 49 __ LDA T2 + 0 
1a14 : c5 47 __ CMP T0 + 0 
.s1003:
1a16 : 90 c4 __ BCC $19dc ; (LoadSprite.l2 + 0)
.s4:
1a18 : 20 7a 1a JSR $1a7a ; (krnio_clrchn.s0 + 0)
1a1b : a5 32 __ LDA P5 ; (fnum + 0)
1a1d : 4c 7e 1a JMP $1a7e ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
1a20 : a5 2d __ LDA P0 
1a22 : 05 2e __ ORA P1 
1a24 : f0 08 __ BEQ $1a2e ; (krnio_setnam.s0 + 14)
1a26 : a0 ff __ LDY #$ff
1a28 : c8 __ __ INY
1a29 : b1 2d __ LDA (P0),y 
1a2b : d0 fb __ BNE $1a28 ; (krnio_setnam.s0 + 8)
1a2d : 98 __ __ TYA
1a2e : a6 2d __ LDX P0 
1a30 : a4 2e __ LDY P1 
1a32 : 20 bd ff JSR $ffbd 
.s1001:
1a35 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1a36 : a9 00 __ LDA #$00
1a38 : a6 2d __ LDX P0 ; (fnum + 0)
1a3a : 9d c6 57 STA $57c6,x ; (krnio_pstatus + 0)
1a3d : a9 00 __ LDA #$00
1a3f : 85 3b __ STA ACCU + 0 
1a41 : 85 3c __ STA ACCU + 1 
1a43 : a5 2d __ LDA P0 ; (fnum + 0)
1a45 : a6 2e __ LDX P1 
1a47 : a4 2f __ LDY P2 
1a49 : 20 ba ff JSR $ffba 
1a4c : 20 c0 ff JSR $ffc0 
1a4f : 90 08 __ BCC $1a59 ; (krnio_open.s0 + 35)
1a51 : a5 2d __ LDA P0 ; (fnum + 0)
1a53 : 20 c3 ff JSR $ffc3 
1a56 : 4c 5d 1a JMP $1a5d ; (krnio_open.s1001 + 0)
1a59 : a9 01 __ LDA #$01
1a5b : 85 3b __ STA ACCU + 0 
.s1001:
1a5d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
57c6 : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a5e : 85 2d __ STA P0 
.s0:
1a60 : a6 2d __ LDX P0 
1a62 : 20 c6 ff JSR $ffc6 
1a65 : a9 00 __ LDA #$00
1a67 : 85 3c __ STA ACCU + 1 
1a69 : b0 02 __ BCS $1a6d ; (krnio_chkin.s0 + 13)
1a6b : a9 01 __ LDA #$01
1a6d : 85 3b __ STA ACCU + 0 
.s1001:
1a6f : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a70 : 20 cf ff JSR $ffcf 
1a73 : 85 3b __ STA ACCU + 0 
1a75 : a9 00 __ LDA #$00
1a77 : 85 3c __ STA ACCU + 1 
.s1001:
1a79 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1a7a : 20 cc ff JSR $ffcc 
.s1001:
1a7d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1a7e : 85 2d __ STA P0 
.s0:
1a80 : a5 2d __ LDA P0 
1a82 : 20 c3 ff JSR $ffc3 
.s1001:
1a85 : 60 __ __ RTS
--------------------------------------------------------------------
1a86 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1a96 : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1aa5 : a9 10 __ LDA #$10
1aa7 : 85 30 __ STA P3 
1aa9 : a9 00 __ LDA #$00
1aab : 85 31 __ STA P4 
1aad : a5 32 __ LDA P5 ; (Palette + 0)
1aaf : 85 2e __ STA P1 
1ab1 : 85 47 __ STA T0 + 0 
1ab3 : a5 33 __ LDA P6 ; (Palette + 1)
1ab5 : 85 2f __ STA P2 
1ab7 : 85 48 __ STA T0 + 1 
1ab9 : a5 34 __ LDA P7 ; (index + 0)
1abb : 85 2d __ STA P0 
1abd : ad fa 9e LDA $9efa ; (sstack + 0)
1ac0 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1ac2 : 0a __ __ ASL
1ac3 : 85 49 __ STA T3 + 0 
1ac5 : ad fb 9e LDA $9efb ; (sstack + 1)
1ac8 : 2a __ __ ROL
1ac9 : 18 __ __ CLC
1aca : 65 33 __ ADC P6 ; (Palette + 1)
1acc : 85 4a __ STA T3 + 1 
1ace : a4 32 __ LDY P5 ; (Palette + 0)
1ad0 : b1 49 __ LDA (T3 + 0),y 
1ad2 : aa __ __ TAX
1ad3 : c8 __ __ INY
1ad4 : b1 49 __ LDA (T3 + 0),y 
1ad6 : 86 49 __ STX T3 + 0 
1ad8 : 85 4a __ STA T3 + 1 
1ada : a9 00 __ LDA #$00
1adc : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1ade : ad fc 9e LDA $9efc ; (sstack + 2)
1ae1 : 85 4b __ STA T5 + 0 
1ae3 : 38 __ __ SEC
1ae4 : e9 01 __ SBC #$01
1ae6 : 85 4d __ STA T6 + 0 
1ae8 : ad fd 9e LDA $9efd ; (sstack + 3)
1aeb : 85 4c __ STA T5 + 1 
1aed : e9 00 __ SBC #$00
1aef : 85 4e __ STA T6 + 1 
1af1 : d0 06 __ BNE $1af9 ; (SetPaletteIndex.s5 + 0)
.s1004:
1af3 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1af5 : c5 4d __ CMP T6 + 0 
1af7 : b0 38 __ BCS $1b31 ; (SetPaletteIndex.s4 + 0)
.s5:
1af9 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1afb : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1afd : 18 __ __ CLC
1afe : a5 32 __ LDA P5 ; (Palette + 0)
1b00 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1b02 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b04 : a5 33 __ LDA P6 ; (Palette + 1)
1b06 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1b08 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b0a : ae fa 9e LDX $9efa ; (sstack + 0)
.l2:
1b0d : a0 02 __ LDY #$02
1b0f : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b11 : a0 00 __ LDY #$00
1b13 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b15 : a0 03 __ LDY #$03
1b17 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b19 : a0 01 __ LDY #$01
1b1b : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b1d : 18 __ __ CLC
1b1e : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b20 : 69 02 __ ADC #$02
1b22 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b24 : 90 02 __ BCC $1b28 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1b26 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1b28 : e8 __ __ INX
1b29 : a5 4e __ LDA T6 + 1 
1b2b : d0 e0 __ BNE $1b0d ; (SetPaletteIndex.l2 + 0)
.s1002:
1b2d : e4 4d __ CPX T6 + 0 
1b2f : 90 dc __ BCC $1b0d ; (SetPaletteIndex.l2 + 0)
.s4:
1b31 : a5 4b __ LDA T5 + 0 
1b33 : 0a __ __ ASL
1b34 : aa __ __ TAX
1b35 : a5 4c __ LDA T5 + 1 
1b37 : 2a __ __ ROL
1b38 : a8 __ __ TAY
1b39 : 8a __ __ TXA
1b3a : 38 __ __ SEC
1b3b : e9 02 __ SBC #$02
1b3d : b0 01 __ BCS $1b40 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1b3f : 88 __ __ DEY
.s1010:
1b40 : 18 __ __ CLC
1b41 : 65 47 __ ADC T0 + 0 
1b43 : 85 47 __ STA T0 + 0 
1b45 : 98 __ __ TYA
1b46 : 65 48 __ ADC T0 + 1 
1b48 : 85 48 __ STA T0 + 1 
1b4a : a5 49 __ LDA T3 + 0 
1b4c : a0 00 __ LDY #$00
1b4e : 91 47 __ STA (T0 + 0),y 
1b50 : a5 4a __ LDA T3 + 1 
1b52 : c8 __ __ INY
1b53 : 91 47 __ STA (T0 + 0),y 
1b55 : 4c 5a 19 JMP $195a ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
TowerPalF1:
46b2 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
46c2 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
getchx:
.s0:
1b58 : 20 62 1b JSR $1b62 ; (getpch + 0)
1b5b : 85 3b __ STA ACCU + 0 
1b5d : a9 00 __ LDA #$00
1b5f : 85 3c __ STA ACCU + 1 
.s1001:
1b61 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1b62 : 20 e4 ff JSR $ffe4 
1b65 : ae ff 21 LDX $21ff ; (giocharmap + 0)
1b68 : e0 01 __ CPX #$01
1b6a : 90 26 __ BCC $1b92 ; (getpch + 48)
1b6c : c9 0d __ CMP #$0d
1b6e : d0 02 __ BNE $1b72 ; (getpch + 16)
1b70 : a9 0a __ LDA #$0a
1b72 : e0 02 __ CPX #$02
1b74 : 90 1c __ BCC $1b92 ; (getpch + 48)
1b76 : c9 db __ CMP #$db
1b78 : b0 18 __ BCS $1b92 ; (getpch + 48)
1b7a : c9 41 __ CMP #$41
1b7c : 90 14 __ BCC $1b92 ; (getpch + 48)
1b7e : c9 c1 __ CMP #$c1
1b80 : 90 02 __ BCC $1b84 ; (getpch + 34)
1b82 : 49 a0 __ EOR #$a0
1b84 : c9 7b __ CMP #$7b
1b86 : b0 0a __ BCS $1b92 ; (getpch + 48)
1b88 : c9 61 __ CMP #$61
1b8a : b0 04 __ BCS $1b90 ; (getpch + 46)
1b8c : c9 5b __ CMP #$5b
1b8e : b0 02 __ BCS $1b92 ; (getpch + 48)
1b90 : 49 20 __ EOR #$20
1b92 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
21ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
25fa : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
25fc : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
25fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
46d2 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1b93 : a9 33 __ LDA #$33
1b95 : 85 2d __ STA P0 
1b97 : a9 38 __ LDA #$38
1b99 : 85 2e __ STA P1 
1b9b : a9 01 __ LDA #$01
1b9d : 85 2f __ STA P2 
1b9f : a6 32 __ LDX P5 ; (p + 0)
1ba1 : bd 00 47 LDA $4700,x ; (sintab + 0)
1ba4 : 4a __ __ LSR
1ba5 : 4a __ __ LSR
1ba6 : 4a __ __ LSR
1ba7 : 49 10 __ EOR #$10
1ba9 : 38 __ __ SEC
1baa : e9 10 __ SBC #$10
1bac : 18 __ __ CLC
1bad : 69 b4 __ ADC #$b4
1baf : 85 30 __ STA P3 
1bb1 : a9 00 __ LDA #$00
1bb3 : 85 31 __ STA P4 
1bb5 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1bb8 : a9 34 __ LDA #$34
1bba : 85 2d __ STA P0 
1bbc : a9 20 __ LDA #$20
1bbe : 85 2e __ STA P1 
1bc0 : a6 34 __ LDX P7 ; (p2 + 0)
1bc2 : bd 00 47 LDA $4700,x ; (sintab + 0)
1bc5 : 4a __ __ LSR
1bc6 : 4a __ __ LSR
1bc7 : 4a __ __ LSR
1bc8 : 49 10 __ EOR #$10
1bca : 38 __ __ SEC
1bcb : e9 10 __ SBC #$10
1bcd : 18 __ __ CLC
1bce : 69 b4 __ ADC #$b4
1bd0 : 85 30 __ STA P3 
1bd2 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1bd5 : a9 35 __ LDA #$35
1bd7 : 85 2d __ STA P0 
1bd9 : a9 00 __ LDA #$00
1bdb : 85 2e __ STA P1 
1bdd : a6 36 __ LDX P9 ; (p3 + 0)
1bdf : bd 00 47 LDA $4700,x ; (sintab + 0)
1be2 : 4a __ __ LSR
1be3 : 4a __ __ LSR
1be4 : 4a __ __ LSR
1be5 : 49 10 __ EOR #$10
1be7 : 38 __ __ SEC
1be8 : e9 10 __ SBC #$10
1bea : 18 __ __ CLC
1beb : 69 a4 __ ADC #$a4
1bed : 85 30 __ STA P3 
1bef : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1bf2 : a9 36 __ LDA #$36
1bf4 : 85 2d __ STA P0 
1bf6 : a9 40 __ LDA #$40
1bf8 : 85 2e __ STA P1 
1bfa : a6 36 __ LDX P9 ; (p3 + 0)
1bfc : bd 00 47 LDA $4700,x ; (sintab + 0)
1bff : 4a __ __ LSR
1c00 : 4a __ __ LSR
1c01 : 4a __ __ LSR
1c02 : 49 10 __ EOR #$10
1c04 : 38 __ __ SEC
1c05 : e9 10 __ SBC #$10
1c07 : 18 __ __ CLC
1c08 : 69 a4 __ ADC #$a4
1c0a : 85 30 __ STA P3 
1c0c : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1c0f : a9 37 __ LDA #$37
1c11 : 85 2d __ STA P0 
1c13 : a9 00 __ LDA #$00
1c15 : 85 2e __ STA P1 
1c17 : a6 36 __ LDX P9 ; (p3 + 0)
1c19 : bd 00 47 LDA $4700,x ; (sintab + 0)
1c1c : 4a __ __ LSR
1c1d : 4a __ __ LSR
1c1e : 4a __ __ LSR
1c1f : 49 10 __ EOR #$10
1c21 : 38 __ __ SEC
1c22 : e9 10 __ SBC #$10
1c24 : 18 __ __ CLC
1c25 : 69 c4 __ ADC #$c4
1c27 : 85 30 __ STA P3 
1c29 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1c2c : a9 38 __ LDA #$38
1c2e : 85 2d __ STA P0 
1c30 : a9 40 __ LDA #$40
1c32 : 85 2e __ STA P1 
1c34 : a6 36 __ LDX P9 ; (p3 + 0)
1c36 : bd 00 47 LDA $4700,x ; (sintab + 0)
1c39 : 4a __ __ LSR
1c3a : 4a __ __ LSR
1c3b : 4a __ __ LSR
1c3c : 49 10 __ EOR #$10
1c3e : 38 __ __ SEC
1c3f : e9 10 __ SBC #$10
1c41 : 18 __ __ CLC
1c42 : 69 c4 __ ADC #$c4
1c44 : 85 30 __ STA P3 
1c46 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1c49 : a9 00 __ LDA #$00
1c4b : 85 2d __ STA P0 
1c4d : 85 2f __ STA P2 
1c4f : a9 68 __ LDA #$68
1c51 : 85 2e __ STA P1 
1c53 : a6 36 __ LDX P9 ; (p3 + 0)
1c55 : bd 00 47 LDA $4700,x ; (sintab + 0)
1c58 : 4a __ __ LSR
1c59 : 4a __ __ LSR
1c5a : 4a __ __ LSR
1c5b : 4a __ __ LSR
1c5c : 49 08 __ EOR #$08
1c5e : 38 __ __ SEC
1c5f : e9 08 __ SBC #$08
1c61 : 85 48 __ STA T2 + 0 
1c63 : a9 00 __ LDA #$00
1c65 : e9 00 __ SBC #$00
1c67 : 85 49 __ STA T2 + 1 
1c69 : 38 __ __ SEC
1c6a : a9 b6 __ LDA #$b6
1c6c : e5 48 __ SBC T2 + 0 
1c6e : 85 30 __ STA P3 
1c70 : a9 01 __ LDA #$01
1c72 : e5 49 __ SBC T2 + 1 
1c74 : 85 31 __ STA P4 
1c76 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1c79 : a9 01 __ LDA #$01
1c7b : 85 2d __ STA P0 
1c7d : 85 2f __ STA P2 
1c7f : a9 f0 __ LDA #$f0
1c81 : 85 2e __ STA P1 
1c83 : a6 36 __ LDX P9 ; (p3 + 0)
1c85 : bd 00 47 LDA $4700,x ; (sintab + 0)
1c88 : 4a __ __ LSR
1c89 : 4a __ __ LSR
1c8a : 4a __ __ LSR
1c8b : 4a __ __ LSR
1c8c : 49 08 __ EOR #$08
1c8e : 38 __ __ SEC
1c8f : e9 08 __ SBC #$08
1c91 : a8 __ __ TAY
1c92 : a9 00 __ LDA #$00
1c94 : e9 00 __ SBC #$00
1c96 : aa __ __ TAX
1c97 : 98 __ __ TYA
1c98 : 18 __ __ CLC
1c99 : 69 b6 __ ADC #$b6
1c9b : 85 30 __ STA P3 
1c9d : 8a __ __ TXA
1c9e : 69 01 __ ADC #$01
1ca0 : 85 31 __ STA P4 
1ca2 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1ca5 : a9 00 __ LDA #$00
1ca7 : 85 47 __ STA T1 + 0 
1ca9 : 18 __ __ CLC
.l2:
1caa : a5 47 __ LDA T1 + 0 
1cac : 69 4f __ ADC #$4f
1cae : 85 2d __ STA P0 
1cb0 : a5 47 __ LDA T1 + 0 
1cb2 : 0a __ __ ASL
1cb3 : 65 47 __ ADC T1 + 0 
1cb5 : 0a __ __ ASL
1cb6 : 0a __ __ ASL
1cb7 : 18 __ __ CLC
1cb8 : 6d d4 46 ADC $46d4 ; (FrameCount + 0)
1cbb : aa __ __ TAX
1cbc : ac d5 46 LDY $46d5 ; (FrameCount + 1)
1cbf : bd 00 47 LDA $4700,x ; (sintab + 0)
1cc2 : 10 01 __ BPL $1cc5 ; (MoveSprites.s1008 + 0)
.s1007:
1cc4 : 88 __ __ DEY
.s1008:
1cc5 : 18 __ __ CLC
1cc6 : 6d d4 46 ADC $46d4 ; (FrameCount + 0)
1cc9 : 85 48 __ STA T2 + 0 
1ccb : 90 01 __ BCC $1cce ; (MoveSprites.s1009 + 0)
.s1006:
1ccd : c8 __ __ INY
.s1009:
1cce : 84 49 __ STY T2 + 1 
1cd0 : a5 47 __ LDA T1 + 0 
1cd2 : 0a __ __ ASL
1cd3 : 0a __ __ ASL
1cd4 : 85 3b __ STA ACCU + 0 
1cd6 : a9 00 __ LDA #$00
1cd8 : 85 3c __ STA ACCU + 1 
1cda : a9 80 __ LDA #$80
1cdc : 85 23 __ STA WORK + 0 
1cde : a9 02 __ LDA #$02
1ce0 : 85 24 __ STA WORK + 1 
1ce2 : 20 46 25 JSR $2546 ; (divmod + 0)
1ce5 : 18 __ __ CLC
1ce6 : a5 25 __ LDA WORK + 2 
1ce8 : 65 48 __ ADC T2 + 0 
1cea : 85 2e __ STA P1 
1cec : a5 26 __ LDA WORK + 3 
1cee : 65 49 __ ADC T2 + 1 
1cf0 : 85 2f __ STA P2 
1cf2 : a5 47 __ LDA T1 + 0 
1cf4 : 0a __ __ ASL
1cf5 : 0a __ __ ASL
1cf6 : 65 47 __ ADC T1 + 0 
1cf8 : 85 48 __ STA T2 + 0 
1cfa : ad d4 46 LDA $46d4 ; (FrameCount + 0)
1cfd : 38 __ __ SEC
1cfe : e9 40 __ SBC #$40
1d00 : 18 __ __ CLC
1d01 : 65 48 __ ADC T2 + 0 
1d03 : aa __ __ TAX
1d04 : bd 00 47 LDA $4700,x ; (sintab + 0)
1d07 : 4a __ __ LSR
1d08 : 49 40 __ EOR #$40
1d0a : 38 __ __ SEC
1d0b : e9 40 __ SBC #$40
1d0d : a8 __ __ TAY
1d0e : a9 00 __ LDA #$00
1d10 : e9 00 __ SBC #$00
1d12 : 85 49 __ STA T2 + 1 
1d14 : a5 47 __ LDA T1 + 0 
1d16 : 0a __ __ ASL
1d17 : 0a __ __ ASL
1d18 : 0a __ __ ASL
1d19 : 85 3b __ STA ACCU + 0 
1d1b : ad d4 46 LDA $46d4 ; (FrameCount + 0)
1d1e : 38 __ __ SEC
1d1f : e9 20 __ SBC #$20
1d21 : 18 __ __ CLC
1d22 : 65 3b __ ADC ACCU + 0 
1d24 : aa __ __ TAX
1d25 : bd 00 47 LDA $4700,x ; (sintab + 0)
1d28 : 4a __ __ LSR
1d29 : 4a __ __ LSR
1d2a : 4a __ __ LSR
1d2b : 4a __ __ LSR
1d2c : 49 08 __ EOR #$08
1d2e : 38 __ __ SEC
1d2f : e9 08 __ SBC #$08
1d31 : 85 4a __ STA T3 + 0 
1d33 : a9 00 __ LDA #$00
1d35 : e9 00 __ SBC #$00
1d37 : 85 4b __ STA T3 + 1 
1d39 : a5 47 __ LDA T1 + 0 
1d3b : 0a __ __ ASL
1d3c : 65 47 __ ADC T1 + 0 
1d3e : 85 3b __ STA ACCU + 0 
1d40 : a5 47 __ LDA T1 + 0 
1d42 : c9 17 __ CMP #$17
1d44 : f0 2d __ BEQ $1d73 ; (MoveSprites.s5 + 0)
.s6:
1d46 : 98 __ __ TYA
1d47 : 18 __ __ CLC
1d48 : 69 c4 __ ADC #$c4
1d4a : a8 __ __ TAY
1d4b : a5 49 __ LDA T2 + 1 
1d4d : 69 00 __ ADC #$00
1d4f : aa __ __ TAX
1d50 : 98 __ __ TYA
1d51 : 18 __ __ CLC
1d52 : 65 4a __ ADC T3 + 0 
1d54 : a8 __ __ TAY
1d55 : 8a __ __ TXA
1d56 : 65 4b __ ADC T3 + 1 
1d58 : aa __ __ TAX
1d59 : 98 __ __ TYA
1d5a : 18 __ __ CLC
1d5b : 65 3b __ ADC ACCU + 0 
1d5d : 85 30 __ STA P3 
1d5f : 90 01 __ BCC $1d62 ; (MoveSprites.s1013 + 0)
.s1012:
1d61 : e8 __ __ INX
.s1013:
1d62 : 86 31 __ STX P4 
1d64 : 20 e4 18 JSR $18e4 ; (vera_spr_move.s0 + 0)
1d67 : e6 47 __ INC T1 + 0 
1d69 : a5 47 __ LDA T1 + 0 
1d6b : c9 18 __ CMP #$18
1d6d : b0 03 __ BCS $1d72 ; (MoveSprites.s1001 + 0)
1d6f : 4c aa 1c JMP $1caa ; (MoveSprites.l2 + 0)
.s1001:
1d72 : 60 __ __ RTS
.s5:
1d73 : 98 __ __ TYA
1d74 : 18 __ __ CLC
1d75 : 69 bc __ ADC #$bc
1d77 : 18 __ __ CLC
1d78 : 65 4a __ ADC T3 + 0 
1d7a : a8 __ __ TAY
1d7b : a9 00 __ LDA #$00
1d7d : 65 4b __ ADC T3 + 1 
1d7f : aa __ __ TAX
1d80 : 98 __ __ TYA
1d81 : 18 __ __ CLC
1d82 : 65 3b __ ADC ACCU + 0 
1d84 : 85 30 __ STA P3 
1d86 : 90 01 __ BCC $1d89 ; (MoveSprites.s1011 + 0)
.s1010:
1d88 : e8 __ __ INX
.s1011:
1d89 : 86 31 __ STX P4 
1d8b : 4c e4 18 JMP $18e4 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4700 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4710 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4720 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4730 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4740 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4750 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4760 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4770 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4780 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4790 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
47a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
47b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
47c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
47d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
47e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
47f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
46d4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1d8e : a9 08 __ LDA #$08
1d90 : 8d 2c 9f STA $9f2c 
1d93 : ad fd 9e LDA $9efd ; (sstack + 3)
1d96 : cd ff 9e CMP $9eff ; (sstack + 5)
1d99 : d0 10 __ BNE $1dab ; (PlayZSM.s1 + 0)
.s1009:
1d9b : ad fc 9e LDA $9efc ; (sstack + 2)
1d9e : cd fe 9e CMP $9efe ; (sstack + 4)
1da1 : d0 08 __ BNE $1dab ; (PlayZSM.s1 + 0)
.s4:
1da3 : 20 84 1f JSR $1f84 ; (zsm_check.s0 + 0)
1da6 : 09 00 __ ORA #$00
1da8 : d0 01 __ BNE $1dab ; (PlayZSM.s1 + 0)
1daa : 60 __ __ RTS
.s1:
1dab : ac fc 9e LDY $9efc ; (sstack + 2)
1dae : ad fd 9e LDA $9efd ; (sstack + 3)
1db1 : d0 15 __ BNE $1dc8 ; (PlayZSM.s18 + 0)
.s1008:
1db3 : c0 03 __ CPY #$03
1db5 : d0 11 __ BNE $1dc8 ; (PlayZSM.s18 + 0)
.s12:
1db7 : a9 8a __ LDA #$8a
1db9 : 85 30 __ STA P3 
1dbb : a9 21 __ LDA #$21
1dbd : 85 31 __ STA P4 
1dbf : a9 b1 __ LDA #$b1
1dc1 : 85 4b __ STA T0 + 0 
1dc3 : a9 21 __ LDA #$21
1dc5 : 4c ae 1e JMP $1eae ; (PlayZSM.s30 + 0)
.s18:
1dc8 : ad fd 9e LDA $9efd ; (sstack + 3)
1dcb : 10 03 __ BPL $1dd0 ; (PlayZSM.s1007 + 0)
1dcd : 4c 89 1e JMP $1e89 ; (PlayZSM.s20 + 0)
.s1007:
1dd0 : d0 07 __ BNE $1dd9 ; (PlayZSM.s19 + 0)
.s1006:
1dd2 : c0 03 __ CPY #$03
1dd4 : b0 03 __ BCS $1dd9 ; (PlayZSM.s19 + 0)
1dd6 : 4c 89 1e JMP $1e89 ; (PlayZSM.s20 + 0)
.s19:
1dd9 : 09 00 __ ORA #$00
1ddb : d0 56 __ BNE $1e33 ; (PlayZSM.s1001 + 0)
.s1003:
1ddd : 98 __ __ TYA
1dde : c0 04 __ CPY #$04
1de0 : d0 4d __ BNE $1e2f ; (PlayZSM.s1002 + 0)
.s14:
1de2 : a9 db __ LDA #$db
1de4 : 85 30 __ STA P3 
1de6 : a9 21 __ LDA #$21
1de8 : 85 31 __ STA P4 
1dea : 20 a7 1f JSR $1fa7 ; (zsm_init.s0 + 0)
1ded : a9 03 __ LDA #$03
1def : 85 32 __ STA P5 
1df1 : 85 34 __ STA P7 
1df3 : a9 08 __ LDA #$08
1df5 : 85 33 __ STA P6 
1df7 : a9 00 __ LDA #$00
1df9 : 8d fa 9e STA $9efa ; (sstack + 0)
1dfc : a9 20 __ LDA #$20
1dfe : 8d fb 9e STA $9efb ; (sstack + 1)
1e01 : a9 00 __ LDA #$00
1e03 : 85 30 __ STA P3 
1e05 : a9 22 __ LDA #$22
1e07 : 85 31 __ STA P4 
1e09 : ad fb 21 LDA $21fb ; (VolAddr + 0)
1e0c : 85 35 __ STA P8 
1e0e : ad fc 21 LDA $21fc ; (VolAddr + 1)
1e11 : 85 36 __ STA P9 
1e13 : ad fd 21 LDA $21fd ; (VolAddr + 2)
1e16 : 85 37 __ STA P10 
1e18 : ad fe 21 LDA $21fe ; (VolAddr + 3)
1e1b : 85 38 __ STA P11 
1e1d : 20 a3 19 JSR $19a3 ; (LoadSprite.s0 + 0)
1e20 : a9 20 __ LDA #$20
1e22 : 85 30 __ STA P3 
1e24 : a9 00 __ LDA #$00
1e26 : 85 31 __ STA P4 
1e28 : a9 48 __ LDA #$48
1e2a : a0 20 __ LDY #$20
1e2c : 4c 7e 1e JMP $1e7e ; (PlayZSM.s29 + 0)
.s1002:
1e2f : c9 05 __ CMP #$05
1e31 : f0 01 __ BEQ $1e34 ; (PlayZSM.s16 + 0)
.s1001:
1e33 : 60 __ __ RTS
.s16:
1e34 : a9 1d __ LDA #$1d
1e36 : 85 30 __ STA P3 
1e38 : a9 22 __ LDA #$22
1e3a : 85 31 __ STA P4 
1e3c : 20 a7 1f JSR $1fa7 ; (zsm_init.s0 + 0)
1e3f : a9 03 __ LDA #$03
1e41 : 85 32 __ STA P5 
1e43 : 85 34 __ STA P7 
1e45 : a9 08 __ LDA #$08
1e47 : 85 33 __ STA P6 
1e49 : a9 00 __ LDA #$00
1e4b : 8d fa 9e STA $9efa ; (sstack + 0)
1e4e : a9 20 __ LDA #$20
1e50 : 8d fb 9e STA $9efb ; (sstack + 1)
1e53 : a9 3e __ LDA #$3e
1e55 : 85 30 __ STA P3 
1e57 : a9 22 __ LDA #$22
1e59 : 85 31 __ STA P4 
1e5b : ad fb 21 LDA $21fb ; (VolAddr + 0)
1e5e : 85 35 __ STA P8 
1e60 : ad fc 21 LDA $21fc ; (VolAddr + 1)
1e63 : 85 36 __ STA P9 
1e65 : ad fd 21 LDA $21fd ; (VolAddr + 2)
1e68 : 85 37 __ STA P10 
1e6a : ad fe 21 LDA $21fe ; (VolAddr + 3)
1e6d : 85 38 __ STA P11 
1e6f : 20 a3 19 JSR $19a3 ; (LoadSprite.s0 + 0)
1e72 : a9 20 __ LDA #$20
1e74 : 85 30 __ STA P3 
1e76 : a9 00 __ LDA #$00
1e78 : 85 31 __ STA P4 
1e7a : a9 48 __ LDA #$48
1e7c : a0 40 __ LDY #$40
.s29:
1e7e : 84 2e __ STY P1 
1e80 : 85 2f __ STA P2 
1e82 : a9 b0 __ LDA #$b0
1e84 : 85 2d __ STA P0 
1e86 : 4c 5a 19 JMP $195a ; (vera_pal_putn.s0 + 0)
.s20:
1e89 : 98 __ __ TYA
1e8a : 0d fd 9e ORA $9efd ; (sstack + 3)
1e8d : d0 03 __ BNE $1e92 ; (PlayZSM.s21 + 0)
1e8f : 4c 42 1f JMP $1f42 ; (PlayZSM.s6 + 0)
.s21:
1e92 : ad fd 9e LDA $9efd ; (sstack + 3)
1e95 : d0 9c __ BNE $1e33 ; (PlayZSM.s1001 + 0)
.s1005:
1e97 : 98 __ __ TYA
1e98 : c0 01 __ CPY #$01
1e9a : f0 59 __ BEQ $1ef5 ; (PlayZSM.s8 + 0)
.s1004:
1e9c : c9 02 __ CMP #$02
1e9e : d0 93 __ BNE $1e33 ; (PlayZSM.s1001 + 0)
.s10:
1ea0 : a9 3b __ LDA #$3b
1ea2 : 85 30 __ STA P3 
1ea4 : a9 21 __ LDA #$21
1ea6 : 85 31 __ STA P4 
1ea8 : a9 60 __ LDA #$60
1eaa : 85 4b __ STA T0 + 0 
1eac : a9 21 __ LDA #$21
.s30:
1eae : 85 4c __ STA T0 + 1 
1eb0 : 20 a7 1f JSR $1fa7 ; (zsm_init.s0 + 0)
1eb3 : a5 4b __ LDA T0 + 0 
1eb5 : 85 30 __ STA P3 
1eb7 : a5 4c __ LDA T0 + 1 
1eb9 : 85 31 __ STA P4 
1ebb : a9 03 __ LDA #$03
1ebd : 85 32 __ STA P5 
1ebf : 85 34 __ STA P7 
1ec1 : a9 08 __ LDA #$08
1ec3 : 85 33 __ STA P6 
1ec5 : a9 00 __ LDA #$00
1ec7 : 8d fa 9e STA $9efa ; (sstack + 0)
1eca : a9 20 __ LDA #$20
1ecc : 8d fb 9e STA $9efb ; (sstack + 1)
1ecf : ad fb 21 LDA $21fb ; (VolAddr + 0)
1ed2 : 85 35 __ STA P8 
1ed4 : ad fc 21 LDA $21fc ; (VolAddr + 1)
1ed7 : 85 36 __ STA P9 
1ed9 : ad fd 21 LDA $21fd ; (VolAddr + 2)
1edc : 85 37 __ STA P10 
1ede : ad fe 21 LDA $21fe ; (VolAddr + 3)
1ee1 : 85 38 __ STA P11 
1ee3 : 20 a3 19 JSR $19a3 ; (LoadSprite.s0 + 0)
1ee6 : a9 20 __ LDA #$20
1ee8 : 85 30 __ STA P3 
1eea : a9 00 __ LDA #$00
1eec : 85 31 __ STA P4 
1eee : a9 48 __ LDA #$48
1ef0 : a0 00 __ LDY #$00
1ef2 : 4c 7e 1e JMP $1e7e ; (PlayZSM.s29 + 0)
.s8:
1ef5 : a9 00 __ LDA #$00
1ef7 : 85 30 __ STA P3 
1ef9 : a9 21 __ LDA #$21
1efb : 85 31 __ STA P4 
1efd : 20 a7 1f JSR $1fa7 ; (zsm_init.s0 + 0)
1f00 : a9 03 __ LDA #$03
1f02 : 85 32 __ STA P5 
1f04 : 85 34 __ STA P7 
1f06 : a9 08 __ LDA #$08
1f08 : 85 33 __ STA P6 
1f0a : a9 00 __ LDA #$00
1f0c : 8d fa 9e STA $9efa ; (sstack + 0)
1f0f : a9 20 __ LDA #$20
1f11 : 8d fb 9e STA $9efb ; (sstack + 1)
1f14 : a9 1e __ LDA #$1e
1f16 : 85 30 __ STA P3 
1f18 : a9 21 __ LDA #$21
1f1a : 85 31 __ STA P4 
1f1c : ad fb 21 LDA $21fb ; (VolAddr + 0)
1f1f : 85 35 __ STA P8 
1f21 : ad fc 21 LDA $21fc ; (VolAddr + 1)
1f24 : 85 36 __ STA P9 
1f26 : ad fd 21 LDA $21fd ; (VolAddr + 2)
1f29 : 85 37 __ STA P10 
1f2b : ad fe 21 LDA $21fe ; (VolAddr + 3)
1f2e : 85 38 __ STA P11 
1f30 : 20 a3 19 JSR $19a3 ; (LoadSprite.s0 + 0)
1f33 : a9 20 __ LDA #$20
1f35 : 85 30 __ STA P3 
1f37 : a9 00 __ LDA #$00
1f39 : 85 31 __ STA P4 
1f3b : a9 46 __ LDA #$46
1f3d : a0 d7 __ LDY #$d7
1f3f : 4c 7e 1e JMP $1e7e ; (PlayZSM.s29 + 0)
.s6:
1f42 : a9 03 __ LDA #$03
1f44 : 85 32 __ STA P5 
1f46 : 85 34 __ STA P7 
1f48 : a9 08 __ LDA #$08
1f4a : 85 33 __ STA P6 
1f4c : a9 00 __ LDA #$00
1f4e : 8d fa 9e STA $9efa ; (sstack + 0)
1f51 : a9 20 __ LDA #$20
1f53 : 8d fb 9e STA $9efb ; (sstack + 1)
1f56 : a9 88 __ LDA #$88
1f58 : 85 30 __ STA P3 
1f5a : a9 1f __ LDA #$1f
1f5c : 85 31 __ STA P4 
1f5e : ad fb 21 LDA $21fb ; (VolAddr + 0)
1f61 : 85 35 __ STA P8 
1f63 : ad fc 21 LDA $21fc ; (VolAddr + 1)
1f66 : 85 36 __ STA P9 
1f68 : ad fd 21 LDA $21fd ; (VolAddr + 2)
1f6b : 85 37 __ STA P10 
1f6d : ad fe 21 LDA $21fe ; (VolAddr + 3)
1f70 : 85 38 __ STA P11 
1f72 : 20 a3 19 JSR $19a3 ; (LoadSprite.s0 + 0)
1f75 : a9 1c __ LDA #$1c
1f77 : 85 30 __ STA P3 
1f79 : a9 00 __ LDA #$00
1f7b : 85 31 __ STA P4 
1f7d : a9 42 __ LDA #$42
1f7f : a0 96 __ LDY #$96
1f81 : 4c 7e 1e JMP $1e7e ; (PlayZSM.s29 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1f84 : ad f9 21 LDA $21f9 ; (zsm_finished + 0)
.s1001:
1f87 : 60 __ __ RTS
--------------------------------------------------------------------
1f88 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1f98 : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
zsm_init:
.s0:
1fa7 : a9 01 __ LDA #$01
1fa9 : 8d f9 21 STA $21f9 ; (zsm_finished + 0)
1fac : ad d6 46 LDA $46d6 ; (zsm_reading + 0)
1faf : f0 0a __ BEQ $1fbb ; (zsm_init.s3 + 0)
.s1:
1fb1 : a9 02 __ LDA #$02
1fb3 : 20 7e 1a JSR $1a7e ; (krnio_close.s1000 + 0)
1fb6 : a9 00 __ LDA #$00
1fb8 : 8d d6 46 STA $46d6 ; (zsm_reading + 0)
.s3:
1fbb : 20 08 20 JSR $2008 ; (zsm_silence.s0 + 0)
1fbe : 20 20 20 JSR $2020 ; (zsm_save_volume.s0 + 0)
1fc1 : a9 00 __ LDA #$00
1fc3 : 8d f1 56 STA $56f1 ; (zsm_pos + 0)
1fc6 : 8d f2 56 STA $56f2 ; (zsm_pos + 1)
1fc9 : 8d f3 56 STA $56f3 ; (zsm_wpos + 0)
1fcc : 8d f4 56 STA $56f4 ; (zsm_wpos + 1)
1fcf : 8d f0 56 STA $56f0 ; (zsm_delay + 0)
1fd2 : a5 30 __ LDA P3 ; (fname + 0)
1fd4 : 85 2d __ STA P0 
1fd6 : a5 31 __ LDA P4 ; (fname + 1)
1fd8 : 85 2e __ STA P1 
1fda : 20 20 1a JSR $1a20 ; (krnio_setnam.s0 + 0)
1fdd : a9 02 __ LDA #$02
1fdf : 85 2d __ STA P0 
1fe1 : 85 2f __ STA P2 
1fe3 : a9 08 __ LDA #$08
1fe5 : 85 2e __ STA P1 
1fe7 : 20 36 1a JSR $1a36 ; (krnio_open.s0 + 0)
1fea : a5 3b __ LDA ACCU + 0 
1fec : f0 19 __ BEQ $2007 ; (zsm_init.s1001 + 0)
.s4:
1fee : a9 01 __ LDA #$01
1ff0 : 8d d6 46 STA $46d6 ; (zsm_reading + 0)
1ff3 : 20 52 20 JSR $2052 ; (zsm_fill.s0 + 0)
1ff6 : a9 10 __ LDA #$10
1ff8 : 8d f1 56 STA $56f1 ; (zsm_pos + 0)
1ffb : a9 00 __ LDA #$00
1ffd : 8d f2 56 STA $56f2 ; (zsm_pos + 1)
2000 : 8d f9 21 STA $21f9 ; (zsm_finished + 0)
2003 : a9 01 __ LDA #$01
2005 : 85 3b __ STA ACCU + 0 
.s1001:
2007 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
46d6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
2008 : a9 00 __ LDA #$00
200a : 85 47 __ STA T0 + 0 
200c : a9 08 __ LDA #$08
200e : 85 2d __ STA P0 
2010 : a9 00 __ LDA #$00
.l1006:
2012 : 85 2e __ STA P1 
2014 : 20 ba 0d JSR $0dba ; (sfx_put.s1000 + 0)
2017 : e6 47 __ INC T0 + 0 
2019 : a5 47 __ LDA T0 + 0 
201b : c9 08 __ CMP #$08
201d : 90 f3 __ BCC $2012 ; (zsm_silence.l1006 + 0)
.s1001:
201f : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
2020 : a0 00 __ LDY #$00
2022 : 84 3c __ STY ACCU + 1 
2024 : a2 02 __ LDX #$02
2026 : 18 __ __ CLC
.l1006:
2027 : 8a __ __ TXA
2028 : 09 c0 __ ORA #$c0
202a : 8d 20 9f STA $9f20 
202d : a5 3c __ LDA ACCU + 1 
202f : 09 f9 __ ORA #$f9
2031 : 8d 21 9f STA $9f21 
2034 : a9 01 __ LDA #$01
2036 : 8d 22 9f STA $9f22 
2039 : ad 23 9f LDA $9f23 
203c : 99 d6 57 STA $57d6,y ; (vera_volumes + 0)
203f : a9 00 __ LDA #$00
2041 : 8d 23 9f STA $9f23 
2044 : 8a __ __ TXA
2045 : 69 04 __ ADC #$04
2047 : aa __ __ TAX
2048 : 90 02 __ BCC $204c ; (zsm_save_volume.s1009 + 0)
.s1008:
204a : e6 3c __ INC ACCU + 1 
.s1009:
204c : c8 __ __ INY
204d : c0 10 __ CPY #$10
204f : 90 d6 __ BCC $2027 ; (zsm_save_volume.l1006 + 0)
.s1001:
2051 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
57d6 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
56f3 : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
2052 : ad d6 46 LDA $46d6 ; (zsm_reading + 0)
2055 : f0 20 __ BEQ $2077 ; (zsm_fill.s1 + 0)
.s2:
2057 : ad f2 56 LDA $56f2 ; (zsm_pos + 1)
205a : 18 __ __ CLC
205b : 69 04 __ ADC #$04
205d : cd f4 56 CMP $56f4 ; (zsm_wpos + 1)
2060 : d0 0c __ BNE $206e ; (zsm_fill.s6 + 0)
.s1006:
2062 : ad f3 56 LDA $56f3 ; (zsm_wpos + 0)
2065 : cd f1 56 CMP $56f1 ; (zsm_pos + 0)
2068 : d0 04 __ BNE $206e ; (zsm_fill.s6 + 0)
.s5:
206a : a9 00 __ LDA #$00
206c : f0 0b __ BEQ $2079 ; (zsm_fill.s1008 + 0)
.s6:
206e : a9 02 __ LDA #$02
2070 : 20 5e 1a JSR $1a5e ; (krnio_chkin.s1000 + 0)
2073 : a5 3b __ LDA ACCU + 0 
2075 : d0 07 __ BNE $207e ; (zsm_fill.s9 + 0)
.s1:
2077 : a9 ff __ LDA #$ff
.s1008:
2079 : 85 3b __ STA ACCU + 0 
.s1001:
207b : 85 3c __ STA ACCU + 1 
207d : 60 __ __ RTS
.s9:
207e : a9 00 __ LDA #$00
2080 : 85 47 __ STA T1 + 0 
2082 : 85 48 __ STA T1 + 1 
2084 : ad f2 56 LDA $56f2 ; (zsm_pos + 1)
2087 : 18 __ __ CLC
2088 : 69 04 __ ADC #$04
208a : cd f4 56 CMP $56f4 ; (zsm_wpos + 1)
208d : d0 08 __ BNE $2097 ; (zsm_fill.l13 + 0)
.s1002:
208f : ad f3 56 LDA $56f3 ; (zsm_wpos + 0)
2092 : cd f1 56 CMP $56f1 ; (zsm_pos + 0)
2095 : f0 45 __ BEQ $20dc ; (zsm_fill.s38 + 0)
.l13:
2097 : 20 70 1a JSR $1a70 ; (krnio_chrin.s0 + 0)
209a : ad f3 56 LDA $56f3 ; (zsm_wpos + 0)
209d : 85 49 __ STA T3 + 0 
209f : 18 __ __ CLC
20a0 : 69 01 __ ADC #$01
20a2 : 8d f3 56 STA $56f3 ; (zsm_wpos + 0)
20a5 : ad f4 56 LDA $56f4 ; (zsm_wpos + 1)
20a8 : aa __ __ TAX
20a9 : 69 00 __ ADC #$00
20ab : 8d f4 56 STA $56f4 ; (zsm_wpos + 1)
20ae : 8a __ __ TXA
20af : 29 03 __ AND #$03
20b1 : 18 __ __ CLC
20b2 : 69 5a __ ADC #$5a
20b4 : 85 4a __ STA T3 + 1 
20b6 : a5 3b __ LDA ACCU + 0 
20b8 : a0 00 __ LDY #$00
20ba : 91 49 __ STA (T3 + 0),y 
20bc : e6 47 __ INC T1 + 0 
20be : d0 02 __ BNE $20c2 ; (zsm_fill.s1010 + 0)
.s1009:
20c0 : e6 48 __ INC T1 + 1 
.s1010:
20c2 : 20 f2 20 JSR $20f2 ; (krnio_status.s0 + 0)
20c5 : a5 3b __ LDA ACCU + 0 
20c7 : d0 0e __ BNE $20d7 ; (zsm_fill.s15 + 0)
.s12:
20c9 : ad f2 56 LDA $56f2 ; (zsm_pos + 1)
20cc : 18 __ __ CLC
20cd : 69 04 __ ADC #$04
20cf : cd f4 56 CMP $56f4 ; (zsm_wpos + 1)
20d2 : d0 c3 __ BNE $2097 ; (zsm_fill.l13 + 0)
20d4 : 4c 8f 20 JMP $208f ; (zsm_fill.s1002 + 0)
.s15:
20d7 : a9 00 __ LDA #$00
20d9 : 8d d6 46 STA $46d6 ; (zsm_reading + 0)
.s38:
20dc : 20 7a 1a JSR $1a7a ; (krnio_clrchn.s0 + 0)
20df : ad d6 46 LDA $46d6 ; (zsm_reading + 0)
20e2 : d0 05 __ BNE $20e9 ; (zsm_fill.s21 + 0)
.s19:
20e4 : a9 02 __ LDA #$02
20e6 : 20 7e 1a JSR $1a7e ; (krnio_close.s1000 + 0)
.s21:
20e9 : a5 47 __ LDA T1 + 0 
20eb : 85 3b __ STA ACCU + 0 
20ed : a5 48 __ LDA T1 + 1 
20ef : 4c 7b 20 JMP $207b ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_status:
.s0:
20f2 : 20 b7 ff JSR $ffb7 
20f5 : 85 3b __ STA ACCU + 0 
20f7 : a9 00 __ LDA #$00
20f9 : 85 3c __ STA ACCU + 1 
.s1001:
20fb : 60 __ __ RTS
--------------------------------------------------------------------
2100 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
2110 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
211e : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
212e : __ __ __ BYT 4b 4f 4c 45 2e 42 49 4e 2c 50 2c 52 00          : KOLE.BIN,P,R.
--------------------------------------------------------------------
KolePal:
46d7 : __ __ __ BYT 00 00 79 02 00 00 40 0a 30 07 ff 0f 00 0f 6c 00 : ..y...@.0.....l.
46e7 : __ __ __ BYT bf 00 99 09 cc 0c 0f 06 be 07 08 02 33 03 00 00 : ............3...
--------------------------------------------------------------------
213b : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
214b : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
215b : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
2160 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2170 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
2180 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
RealPal:
4800 : __ __ __ BYT 00 00 00 00 20 04 46 04 69 06 40 09 ff 00 44 04 : .... .F.i.@...D.
4810 : __ __ __ BYT bb 0b dd 0d 75 0c a7 0e ff 0f df 0d 33 03 99 09 : ....u.......3...
--------------------------------------------------------------------
218a : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
219a : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
21aa : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
21b1 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
21c1 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
21d1 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
21db : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
21eb : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
2200 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2210 : __ __ __ BYT 46 4c 44 45 2e 42 49 4e 2c 50 2c 52 00          : FLDE.BIN,P,R.
--------------------------------------------------------------------
FldePal:
4820 : __ __ __ BYT 00 00 00 00 dd 0d ff 0f 3e 02 cf 00 ad 00 5f 04 : ........>....._.
4830 : __ __ __ BYT 27 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : '...............
--------------------------------------------------------------------
221d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 46 45 4d 55 : @0:zsmfiles/FEMU
222d : __ __ __ BYT 52 46 52 45 45 5a 45 52 2e 7a 73 6d 2c 50 2c 52 : RFREEZER.zsm,P,R
223d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
223e : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
224e : __ __ __ BYT 41 4c 45 4b 53 49 2e 42 49 4e 2c 50 2c 52 00    : ALEKSI.BIN,P,R.
--------------------------------------------------------------------
Aleksipal:
4840 : __ __ __ BYT 00 00 00 00 3b 00 6f 00 22 02 cc 00 ff 00 9f 02 : ....;.o.".......
4850 : __ __ __ BYT 11 01 cb 0c ff 0f 99 09 d0 0d 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
LastSelectedSong:
46f7 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
46f8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalIndex:
46fa : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
MaxSong:
46fc : __ __ __ BYT 05                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
225d : ad 25 9f LDA $9f25 
2260 : 29 fe __ AND #$fe
2262 : 8d 25 9f STA $9f25 
2265 : a9 00 __ LDA #$00
2267 : 8d 20 9f STA $9f20 
226a : a9 b0 __ LDA #$b0
226c : 8d 21 9f STA $9f21 
226f : a9 11 __ LDA #$11
2271 : 8d 22 9f STA $9f22 
2274 : a2 80 __ LDX #$80
2276 : a9 00 __ LDA #$00
.l1002:
2278 : 8d 23 9f STA $9f23 
227b : 8d 23 9f STA $9f23 
227e : ca __ __ DEX
227f : d0 f7 __ BNE $2278 ; (ResetChars.l1002 + 0)
.s1001:
2281 : 60 __ __ RTS
--------------------------------------------------------------------
off1:
46fd : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
2282 : a5 31 __ LDA P4 ; (Input + 0)
2284 : c9 20 __ CMP #$20
2286 : d0 1c __ BNE $22a4 ; (Control.s1007 + 0)
.s1:
2288 : a5 30 __ LDA P3 ; (playing + 0)
228a : d0 0a __ BNE $2296 ; (Control.s4 + 0)
.s5:
228c : a9 01 __ LDA #$01
228e : 20 fc 20 JSR $20fc ; (zsm_irq_play.s0 + 0)
2291 : a9 01 __ LDA #$01
.s1001:
2293 : 85 3b __ STA ACCU + 0 
2295 : 60 __ __ RTS
.s4:
2296 : a9 00 __ LDA #$00
2298 : cd ff 46 CMP $46ff ; (paused + 0)
229b : 2a __ __ ROL
229c : 8d ff 46 STA $46ff ; (paused + 0)
229f : 85 2f __ STA P2 
22a1 : 20 a9 22 JSR $22a9 ; (zsm_pause.s0 + 0)
.s1007:
22a4 : a5 30 __ LDA P3 ; (playing + 0)
22a6 : 4c 93 22 JMP $2293 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
46ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
22a9 : a5 2f __ LDA P2 ; (pause + 0)
22ab : d0 0e __ BNE $22bb ; (zsm_pause.s4 + 0)
.s8:
22ad : ad fa 21 LDA $21fa ; (zsm_paused + 0)
22b0 : f0 08 __ BEQ $22ba ; (zsm_pause.s1001 + 0)
.s5:
22b2 : 20 cb 22 JSR $22cb ; (zsm_restore_volume.s0 + 0)
22b5 : a9 00 __ LDA #$00
22b7 : 8d fa 21 STA $21fa ; (zsm_paused + 0)
.s1001:
22ba : 60 __ __ RTS
.s4:
22bb : ad fa 21 LDA $21fa ; (zsm_paused + 0)
22be : d0 fa __ BNE $22ba ; (zsm_pause.s1001 + 0)
.s1:
22c0 : a9 01 __ LDA #$01
22c2 : 8d fa 21 STA $21fa ; (zsm_paused + 0)
22c5 : 20 08 20 JSR $2008 ; (zsm_silence.s0 + 0)
22c8 : 4c 20 20 JMP $2020 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
22cb : a0 00 __ LDY #$00
22cd : 84 3c __ STY ACCU + 1 
22cf : a2 02 __ LDX #$02
22d1 : 18 __ __ CLC
.l1006:
22d2 : 8a __ __ TXA
22d3 : 09 c0 __ ORA #$c0
22d5 : 8d 20 9f STA $9f20 
22d8 : a5 3c __ LDA ACCU + 1 
22da : 09 f9 __ ORA #$f9
22dc : 8d 21 9f STA $9f21 
22df : a9 01 __ LDA #$01
22e1 : 8d 22 9f STA $9f22 
22e4 : b9 d6 57 LDA $57d6,y ; (vera_volumes + 0)
22e7 : 8d 23 9f STA $9f23 
22ea : 8a __ __ TXA
22eb : 69 04 __ ADC #$04
22ed : aa __ __ TAX
22ee : 90 02 __ BCC $22f2 ; (zsm_restore_volume.s1009 + 0)
.s1008:
22f0 : e6 3c __ INC ACCU + 1 
.s1009:
22f2 : c8 __ __ INY
22f3 : c0 10 __ CPY #$10
22f5 : 90 db __ BCC $22d2 ; (zsm_restore_volume.l1006 + 0)
.s1001:
22f7 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
20fc : 8d f8 21 STA $21f8 ; (zsm_playing + 0)
.s1001:
20ff : 60 __ __ RTS
--------------------------------------------------------------------
UpdateVolume:
.s0:
22f8 : a9 21 __ LDA #$21
22fa : 8d 2c 9f STA $9f2c 
22fd : a9 00 __ LDA #$00
22ff : 8d f8 9e STA $9ef8 ; (FMVolume + 0)
2302 : 8d f9 9e STA $9ef9 ; (VeraVolume + 0)
2305 : 85 49 __ STA T0 + 0 
2307 : 85 32 __ STA P5 
.l2:
2309 : a9 f9 __ LDA #$f9
230b : 85 2d __ STA P0 
230d : a9 9e __ LDA #$9e
230f : 85 2e __ STA P1 
2311 : a9 f8 __ LDA #$f8
2313 : 85 2f __ STA P2 
2315 : a9 9e __ LDA #$9e
2317 : 85 30 __ STA P3 
2319 : a5 49 __ LDA T0 + 0 
231b : 85 31 __ STA P4 
231d : 20 04 24 JSR $2404 ; (zsm_get_volumes.s0 + 0)
2320 : 18 __ __ CLC
2321 : a5 31 __ LDA P4 
2323 : 69 19 __ ADC #$19
2325 : 85 2d __ STA P0 
2327 : ad f9 9e LDA $9ef9 ; (VeraVolume + 0)
232a : 4a __ __ LSR
232b : 4a __ __ LSR
232c : 4a __ __ LSR
232d : 4a __ __ LSR
232e : aa __ __ TAX
232f : ad f4 25 LDA $25f4 ; (IndAddr + 0)
2332 : 18 __ __ CLC
2333 : 7d 00 26 ADC $2600,x ; (__multab32L + 0)
2336 : 85 4a __ STA T5 + 0 
2338 : ad f5 25 LDA $25f5 ; (IndAddr + 1)
233b : 7d 10 26 ADC $2610,x ; (__multab32H + 0)
233e : 85 4b __ STA T5 + 1 
2340 : ad f6 25 LDA $25f6 ; (IndAddr + 2)
2343 : 69 00 __ ADC #$00
2345 : 85 4c __ STA T5 + 2 
2347 : ad f7 25 LDA $25f7 ; (IndAddr + 3)
234a : 69 00 __ ADC #$00
234c : a2 05 __ LDX #$05
.l1002:
234e : 4a __ __ LSR
234f : 66 4c __ ROR T5 + 2 
2351 : 66 4b __ ROR T5 + 1 
2353 : 66 4a __ ROR T5 + 0 
2355 : ca __ __ DEX
2356 : d0 f6 __ BNE $234e ; (UpdateVolume.l1002 + 0)
.s1003:
2358 : a5 4a __ LDA T5 + 0 
235a : 85 2e __ STA P1 
235c : a5 4b __ LDA T5 + 1 
235e : 85 2f __ STA P2 
2360 : 20 42 24 JSR $2442 ; (vera_spr_image.s0 + 0)
2363 : e6 49 __ INC T0 + 0 
2365 : a5 49 __ LDA T0 + 0 
2367 : c9 10 __ CMP #$10
2369 : 90 9e __ BCC $2309 ; (UpdateVolume.l2 + 0)
.s4:
236b : a9 00 __ LDA #$00
236d : 85 49 __ STA T0 + 0 
.l6:
236f : a9 f9 __ LDA #$f9
2371 : 85 2d __ STA P0 
2373 : a9 9e __ LDA #$9e
2375 : 85 2e __ STA P1 
2377 : a9 f8 __ LDA #$f8
2379 : 85 2f __ STA P2 
237b : a9 9e __ LDA #$9e
237d : 85 30 __ STA P3 
237f : a5 49 __ LDA T0 + 0 
2381 : 85 31 __ STA P4 
2383 : a9 00 __ LDA #$00
2385 : 85 32 __ STA P5 
2387 : 20 04 24 JSR $2404 ; (zsm_get_volumes.s0 + 0)
238a : a9 60 __ LDA #$60
238c : 85 2d __ STA P0 
238e : a9 48 __ LDA #$48
2390 : 85 2e __ STA P1 
2392 : a9 40 __ LDA #$40
2394 : 85 2f __ STA P2 
2396 : a9 00 __ LDA #$00
2398 : 85 30 __ STA P3 
239a : a9 7f __ LDA #$7f
239c : 85 31 __ STA P4 
239e : ad f8 9e LDA $9ef8 ; (FMVolume + 0)
23a1 : 85 33 __ STA P6 
23a3 : a9 00 __ LDA #$00
23a5 : 85 34 __ STA P7 
23a7 : 20 7b 24 JSR $247b ; (BinarySearch.s0 + 0)
23aa : 18 __ __ CLC
23ab : a5 49 __ LDA T0 + 0 
23ad : 69 29 __ ADC #$29
23af : 85 2d __ STA P0 
23b1 : a5 3b __ LDA ACCU + 0 
23b3 : 0a __ __ ASL
23b4 : aa __ __ TAX
23b5 : bd 60 48 LDA $4860,x ; (FMTable + 0)
23b8 : 85 3c __ STA ACCU + 1 
23ba : bd 61 48 LDA $4861,x ; (FMTable + 1)
23bd : 4a __ __ LSR
23be : 66 3c __ ROR ACCU + 1 
23c0 : 6a __ __ ROR
23c1 : 66 3c __ ROR ACCU + 1 
23c3 : 6a __ __ ROR
23c4 : 66 3c __ ROR ACCU + 1 
23c6 : 29 c0 __ AND #$c0
23c8 : 6a __ __ ROR
23c9 : 6d f4 25 ADC $25f4 ; (IndAddr + 0)
23cc : 85 4a __ STA T5 + 0 
23ce : ad f5 25 LDA $25f5 ; (IndAddr + 1)
23d1 : 65 3c __ ADC ACCU + 1 
23d3 : 85 4b __ STA T5 + 1 
23d5 : ad f6 25 LDA $25f6 ; (IndAddr + 2)
23d8 : 69 00 __ ADC #$00
23da : 85 4c __ STA T5 + 2 
23dc : ad f7 25 LDA $25f7 ; (IndAddr + 3)
23df : 69 00 __ ADC #$00
23e1 : a2 05 __ LDX #$05
.l1004:
23e3 : 4a __ __ LSR
23e4 : 66 4c __ ROR T5 + 2 
23e6 : 66 4b __ ROR T5 + 1 
23e8 : 66 4a __ ROR T5 + 0 
23ea : ca __ __ DEX
23eb : d0 f6 __ BNE $23e3 ; (UpdateVolume.l1004 + 0)
.s1005:
23ed : a5 4a __ LDA T5 + 0 
23ef : 85 2e __ STA P1 
23f1 : a5 4b __ LDA T5 + 1 
23f3 : 85 2f __ STA P2 
23f5 : 20 42 24 JSR $2442 ; (vera_spr_image.s0 + 0)
23f8 : e6 49 __ INC T0 + 0 
23fa : a5 49 __ LDA T0 + 0 
23fc : c9 08 __ CMP #$08
23fe : b0 03 __ BCS $2403 ; (UpdateVolume.s1001 + 0)
2400 : 4c 6f 23 JMP $236f ; (UpdateVolume.l6 + 0)
.s1001:
2403 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_get_volumes:
.s0:
2404 : a5 31 __ LDA P4 ; (id + 0)
2406 : 0a __ __ ASL
2407 : 85 3b __ STA ACCU + 0 
2409 : a5 32 __ LDA P5 ; (id + 1)
240b : 2a __ __ ROL
240c : 06 3b __ ASL ACCU + 0 
240e : 0a __ __ ASL
240f : 09 f9 __ ORA #$f9
2411 : aa __ __ TAX
2412 : a5 3b __ LDA ACCU + 0 
2414 : 09 c2 __ ORA #$c2
2416 : 8d 20 9f STA $9f20 
2419 : 8e 21 9f STX $9f21 
241c : a9 01 __ LDA #$01
241e : 8d 22 9f STA $9f22 
2421 : ad 23 9f LDA $9f23 
2424 : a0 00 __ LDY #$00
2426 : 91 2d __ STA (P0),y ; (vera_v + 0)
2428 : 18 __ __ CLC
2429 : a9 78 __ LDA #$78
242b : 65 31 __ ADC P4 ; (id + 0)
242d : 85 3b __ STA ACCU + 0 
242f : a9 5e __ LDA #$5e
2431 : 65 32 __ ADC P5 ; (id + 1)
2433 : 85 3c __ STA ACCU + 1 
2435 : b1 3b __ LDA (ACCU + 0),y 
2437 : 29 7f __ AND #$7f
2439 : 49 ff __ EOR #$ff
243b : 18 __ __ CLC
243c : 69 80 __ ADC #$80
243e : 0a __ __ ASL
243f : 91 2f __ STA (P2),y ; (fm_v + 0)
.s1001:
2441 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_image:
.s0:
2442 : ad 25 9f LDA $9f25 
2445 : 29 fe __ AND #$fe
2447 : 8d 25 9f STA $9f25 
244a : a5 2d __ LDA P0 ; (spr + 0)
244c : 0a __ __ ASL
244d : 0a __ __ ASL
244e : 85 3b __ STA ACCU + 0 
2450 : a9 3f __ LDA #$3f
2452 : 2a __ __ ROL
2453 : 06 3b __ ASL ACCU + 0 
2455 : 2a __ __ ROL
2456 : 8d 21 9f STA $9f21 
2459 : a5 3b __ LDA ACCU + 0 
245b : 8d 20 9f STA $9f20 
245e : a9 11 __ LDA #$11
2460 : 8d 22 9f STA $9f22 
2463 : a5 2e __ LDA P1 ; (addr32 + 0)
2465 : 8d 23 9f STA $9f23 
2468 : ad 22 9f LDA $9f22 
246b : 29 0f __ AND #$0f
246d : 8d 22 9f STA $9f22 
2470 : ad 23 9f LDA $9f23 
2473 : 29 80 __ AND #$80
2475 : 05 2f __ ORA P2 ; (addr32 + 1)
2477 : 8d 23 9f STA $9f23 
.s1001:
247a : 60 __ __ RTS
--------------------------------------------------------------------
FMTable:
4860 : __ __ __ BYT 40 00 41 00 42 00 43 00 44 00 45 00 46 00 47 00 : @.A.B.C.D.E.F.G.
4870 : __ __ __ BYT 48 00 48 00 4a 00 4b 00 4c 00 4d 00 4e 00 4f 00 : H.H.J.K.L.M.N.O.
4880 : __ __ __ BYT 50 00 51 00 52 00 53 00 54 00 55 00 56 00 57 00 : P.Q.R.S.T.U.V.W.
4890 : __ __ __ BYT 58 00 58 00 5a 00 5b 00 5c 00 5d 00 5e 00 5f 00 : X.X.Z.[.\.].^._.
48a0 : __ __ __ BYT 60 00 61 00 62 00 63 00 64 00 65 00 66 00 67 00 : `.a.b.c.d.e.f.g.
48b0 : __ __ __ BYT 68 00 68 00 6a 00 6b 00 6c 00 6d 00 6e 00 6f 00 : h.h.j.k.l.m.n.o.
48c0 : __ __ __ BYT 70 00 71 00 72 00 73 00 74 00 75 00 76 00 77 00 : p.q.r.s.t.u.v.w.
48d0 : __ __ __ BYT 78 00 78 00 7a 00 7b 00 7c 00 7d 00 7e 00 7f 00 : x.x.z.{.|.}.~...
--------------------------------------------------------------------
BinarySearch:
.s0:
247b : a5 30 __ LDA P3 ; (l + 1)
247d : 49 80 __ EOR #$80
247f : 85 23 __ STA WORK + 0 
2481 : a5 32 __ LDA P5 ; (r + 1)
2483 : 49 80 __ EOR #$80
2485 : c5 23 __ CMP WORK + 0 
2487 : d0 04 __ BNE $248d ; (BinarySearch.l1009 + 0)
.s1010:
2489 : a5 31 __ LDA P4 ; (r + 0)
248b : c5 2f __ CMP P2 ; (l + 0)
.l1009:
248d : b0 07 __ BCS $2496 ; (BinarySearch.s2 + 0)
.s3:
248f : a9 00 __ LDA #$00
2491 : 85 3b __ STA ACCU + 0 
2493 : 4c 1a 25 JMP $251a ; (BinarySearch.s1001 + 0)
.s2:
2496 : a5 31 __ LDA P4 ; (r + 0)
2498 : e5 2f __ SBC P2 ; (l + 0)
249a : aa __ __ TAX
249b : a5 32 __ LDA P5 ; (r + 1)
249d : e5 30 __ SBC P3 ; (l + 1)
249f : a8 __ __ TAY
24a0 : 0a __ __ ASL
24a1 : 8a __ __ TXA
24a2 : 69 00 __ ADC #$00
24a4 : 85 3c __ STA ACCU + 1 
24a6 : 98 __ __ TYA
24a7 : 69 00 __ ADC #$00
24a9 : c9 80 __ CMP #$80
24ab : 6a __ __ ROR
24ac : 66 3c __ ROR ACCU + 1 
24ae : aa __ __ TAX
24af : 18 __ __ CLC
24b0 : a5 3c __ LDA ACCU + 1 
24b2 : 65 2f __ ADC P2 ; (l + 0)
24b4 : 85 3c __ STA ACCU + 1 
24b6 : 8a __ __ TXA
24b7 : 65 30 __ ADC P3 ; (l + 1)
24b9 : aa __ __ TAX
24ba : a5 3c __ LDA ACCU + 1 
24bc : 0a __ __ ASL
24bd : 85 47 __ STA T6 + 0 
24bf : 8a __ __ TXA
24c0 : 2a __ __ ROL
24c1 : 18 __ __ CLC
24c2 : 65 2e __ ADC P1 ; (arr + 1)
24c4 : 85 48 __ STA T6 + 1 
24c6 : a4 2d __ LDY P0 ; (arr + 0)
24c8 : b1 47 __ LDA (T6 + 0),y 
24ca : 85 3b __ STA ACCU + 0 
24cc : a5 34 __ LDA P7 ; (x + 1)
24ce : c8 __ __ INY
24cf : d1 47 __ CMP (T6 + 0),y 
24d1 : d0 0e __ BNE $24e1 ; (BinarySearch.s6 + 0)
.s1006:
24d3 : a5 3b __ LDA ACCU + 0 
24d5 : c5 33 __ CMP P6 ; (x + 0)
24d7 : d0 08 __ BNE $24e1 ; (BinarySearch.s6 + 0)
.s4:
24d9 : a5 3c __ LDA ACCU + 1 
24db : 85 3b __ STA ACCU + 0 
24dd : 8a __ __ TXA
24de : 4c 1a 25 JMP $251a ; (BinarySearch.s1001 + 0)
.s6:
24e1 : b1 47 __ LDA (T6 + 0),y 
24e3 : c5 34 __ CMP P7 ; (x + 1)
24e5 : d0 04 __ BNE $24eb ; (BinarySearch.s1005 + 0)
.s1004:
24e7 : a5 3b __ LDA ACCU + 0 
24e9 : c5 33 __ CMP P6 ; (x + 0)
.s1005:
24eb : 90 10 __ BCC $24fd ; (BinarySearch.s8 + 0)
.s9:
24ed : a5 3c __ LDA ACCU + 1 
24ef : e9 01 __ SBC #$01
24f1 : 85 31 __ STA P4 ; (r + 0)
24f3 : 8a __ __ TXA
24f4 : e9 00 __ SBC #$00
24f6 : 85 32 __ STA P5 ; (r + 1)
24f8 : a5 30 __ LDA P3 ; (l + 1)
24fa : 4c 08 25 JMP $2508 ; (BinarySearch.s23 + 0)
.s8:
24fd : a5 3c __ LDA ACCU + 1 
24ff : 69 01 __ ADC #$01
2501 : 85 2f __ STA P2 ; (l + 0)
2503 : 8a __ __ TXA
2504 : 69 00 __ ADC #$00
2506 : 85 30 __ STA P3 ; (l + 1)
.s23:
2508 : 49 80 __ EOR #$80
250a : 85 23 __ STA WORK + 0 
250c : a5 32 __ LDA P5 ; (r + 1)
250e : 49 80 __ EOR #$80
2510 : c5 23 __ CMP WORK + 0 
2512 : f0 03 __ BEQ $2517 ; (BinarySearch.s23 + 15)
2514 : 4c 8d 24 JMP $248d ; (BinarySearch.l1009 + 0)
2517 : 4c 89 24 JMP $2489 ; (BinarySearch.s1010 + 0)
.s1001:
251a : 85 3c __ STA ACCU + 1 
251c : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
48e0 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
48f0 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4900 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4910 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4920 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4930 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4940 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4950 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
4960 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
4970 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
4980 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
4990 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
49a0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
49b0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
49c0 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
49d0 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
49e0 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
49f0 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4a00 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4a10 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4a20 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4a30 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4a40 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4a50 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
4a60 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
4a70 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
4a80 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
4a90 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4aa0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4ab0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4ac0 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4ad0 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4ae0 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4af0 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4b00 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4b10 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4b20 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4b30 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4b40 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4b50 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
4b60 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
4b70 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4b80 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4b90 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4ba0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4bb0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4bc0 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4bd0 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4be0 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4bf0 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4c00 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4c10 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4c20 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4c30 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4c40 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4c50 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
4c60 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
4c70 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4c80 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4c90 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4ca0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4cb0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4cc0 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4cd0 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4ce0 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4cf0 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4d00 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4d10 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4d20 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4d30 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4d40 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4d50 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4d60 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4d70 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4d80 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4d90 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4da0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4db0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4dc0 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4dd0 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4de0 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4df0 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4e00 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4e10 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4e20 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4e30 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4e40 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4e50 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4e60 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4e70 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4e80 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4e90 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ea0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4eb0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ec0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ed0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ee0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ef0 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
4efe : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4f0e : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4f1e : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4f2e : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4f3e : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4f4e : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4f5e : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4f6e : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
4f7e : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
4f8e : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
4f9e : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
4fae : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
4fbe : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
4fce : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
4fde : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
4fee : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
4ffe : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
500e : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
501e : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
502e : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
503e : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
504e : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
505e : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
506e : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
507e : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
508e : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
509e : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
50ae : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
50be : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
50ce : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
50de : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
50ee : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
50fe : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
510e : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
511e : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
512e : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
513e : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
514e : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
515e : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
516e : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
517e : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
518e : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
519e : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
51ae : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
51be : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
51ce : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
51de : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
51ee : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
51fe : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
520e : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
521e : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
522e : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
523e : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
524e : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
525e : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
526e : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
527e : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
528e : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
529e : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
52ae : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
52be : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
52ce : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
52de : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
52ee : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
52fe : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
530e : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
531e : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
532e : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
533e : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
534e : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
535e : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
536e : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
537e : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
538e : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
539e : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
53ae : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
53be : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
53ce : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
53de : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
53ee : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
53fe : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
540e : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
541e : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
542e : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
543e : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
544e : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
545e : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
546e : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
547e : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
548e : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
549e : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
54ae : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
54be : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
54ce : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
54de : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
54ee : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
54fe : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
550e : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
551e : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
552e : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
553e : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
554e : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
555e : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
556e : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
557e : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
558e : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
559e : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
55ae : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
55be : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
55ce : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
55de : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
55ee : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
55fe : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
560e : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
561e : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
562e : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
563e : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
564e : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5700 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5710 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5720 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5730 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5740 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5750 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5760 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5770 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5780 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5790 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
57a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
57b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
57c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5800 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5810 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5820 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5830 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5840 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5850 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5860 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5870 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5880 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5890 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
58a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
58b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
58c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
Song4:
5900 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5910 : __ __ __ BYT 0d 05 3a 20 2d 20 22 07 0f 02 13 0d 01 03 0b 05 : ..: - ".........
5920 : __ __ __ BYT 04 22 20 2d 20 01 12 14 09 13 14 3a 20 22 06 01 : ." - ......: "..
5930 : __ __ __ BYT 04 05 22 20 2d 20 0c 05 0e 07 14 08 3a 20 33 3a : .." - ......: 3:
5940 : __ __ __ BYT 32 33 20 2d 20 03 0f 0d 0d 05 0e 14 3a 20 09 20 : 23 - .......: . 
5950 : __ __ __ BYT 02 05 14 20 19 0f 15 20 04 09 04 0e 27 14 20 14 : ... ... ....'. .
5960 : __ __ __ BYT 08 09 0e 0b 20 14 08 05 20 17 01 12 0d 14 08 20 : .... ... ...... 
5970 : __ __ __ BYT 0f 06 20 16 09 0e 19 0c 20 03 0f 15 0c 04 20 02 : .. ..... ..... .
5980 : __ __ __ BYT 05 20 12 05 10 0c 09 03 01 14 05 04 20 09 0e 20 : . .......... .. 
5990 : __ __ __ BYT 01 0e 19 14 08 09 0e 07 20 04 09 07 09 14 01 0c : ........ .......
59a0 : __ __ __ BYT 2c 20 02 15 14 20 08 05 12 05 20 17 05 20 01 12 : , ... .... .. ..
59b0 : __ __ __ BYT 05 20 3a 33 20 3d 20 3d 20 2d 20 2d 20 00       : . :3 = = - - .
--------------------------------------------------------------------
Song5:
565b : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
566b : __ __ __ BYT 0d 05 3a 20 2d 20 22 06 05 0d 15 12 20 06 12 05 : ..: - "..... ...
567b : __ __ __ BYT 05 1a 05 12 22 20 2d 20 01 12 14 09 13 14 3a 20 : ...." - ......: 
568b : __ __ __ BYT 22 01 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 22 : "...... ......."
569b : __ __ __ BYT 20 2d 20 0c 05 0e 07 14 08 3a 20 31 3a 35 35 20 :  - ......: 1:55 
56ab : __ __ __ BYT 2d 20 03 0f 0d 0d 05 0e 14 3a 20 13 0f 0e 07 20 : - .......: .... 
56bb : __ __ __ BYT 02 12 0f 15 07 08 14 20 14 0f 20 19 0f 15 20 02 : ....... .. ... .
56cb : __ __ __ BYT 19 20 04 05 05 1a 20 0e 15 14 20 03 0f 2e 20 13 : . .... ... ... .
56db : __ __ __ BYT 09 0e 03 05 20 31 38 38 39 20 3d 20 3d 20 2d 20 : .... 1889 = = - 
56eb : __ __ __ BYT 2d 20 00                                        : - .
--------------------------------------------------------------------
frame_wait:
.l1:
251d : ad 26 9f LDA $9f26 
2520 : 0a __ __ ASL
2521 : 30 fa __ BMI $251d ; (frame_wait.l1 + 0)
.l4:
2523 : ad 26 9f LDA $9f26 
2526 : 0a __ __ ASL
2527 : 10 fa __ BPL $2523 ; (frame_wait.l4 + 0)
.s1001:
2529 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
252a : 38 __ __ SEC
252b : a9 00 __ LDA #$00
252d : e5 3b __ SBC ACCU + 0 
252f : 85 3b __ STA ACCU + 0 
2531 : a9 00 __ LDA #$00
2533 : e5 3c __ SBC ACCU + 1 
2535 : 85 3c __ STA ACCU + 1 
2537 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
2538 : 38 __ __ SEC
2539 : a9 00 __ LDA #$00
253b : e5 23 __ SBC WORK + 0 
253d : 85 23 __ STA WORK + 0 
253f : a9 00 __ LDA #$00
2541 : e5 24 __ SBC WORK + 1 
2543 : 85 24 __ STA WORK + 1 
2545 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
2546 : a5 3c __ LDA ACCU + 1 
2548 : d0 31 __ BNE $257b ; (divmod + 53)
254a : a5 24 __ LDA WORK + 1 
254c : d0 1e __ BNE $256c ; (divmod + 38)
254e : 85 26 __ STA WORK + 3 
2550 : a2 04 __ LDX #$04
2552 : 06 3b __ ASL ACCU + 0 
2554 : 2a __ __ ROL
2555 : c5 23 __ CMP WORK + 0 
2557 : 90 02 __ BCC $255b ; (divmod + 21)
2559 : e5 23 __ SBC WORK + 0 
255b : 26 3b __ ROL ACCU + 0 
255d : 2a __ __ ROL
255e : c5 23 __ CMP WORK + 0 
2560 : 90 02 __ BCC $2564 ; (divmod + 30)
2562 : e5 23 __ SBC WORK + 0 
2564 : 26 3b __ ROL ACCU + 0 
2566 : ca __ __ DEX
2567 : d0 eb __ BNE $2554 ; (divmod + 14)
2569 : 85 25 __ STA WORK + 2 
256b : 60 __ __ RTS
256c : a5 3b __ LDA ACCU + 0 
256e : 85 25 __ STA WORK + 2 
2570 : a5 3c __ LDA ACCU + 1 
2572 : 85 26 __ STA WORK + 3 
2574 : a9 00 __ LDA #$00
2576 : 85 3b __ STA ACCU + 0 
2578 : 85 3c __ STA ACCU + 1 
257a : 60 __ __ RTS
257b : a5 24 __ LDA WORK + 1 
257d : d0 1f __ BNE $259e ; (divmod + 88)
257f : a5 23 __ LDA WORK + 0 
2581 : 30 1b __ BMI $259e ; (divmod + 88)
2583 : a9 00 __ LDA #$00
2585 : 85 26 __ STA WORK + 3 
2587 : a2 10 __ LDX #$10
2589 : 06 3b __ ASL ACCU + 0 
258b : 26 3c __ ROL ACCU + 1 
258d : 2a __ __ ROL
258e : c5 23 __ CMP WORK + 0 
2590 : 90 02 __ BCC $2594 ; (divmod + 78)
2592 : e5 23 __ SBC WORK + 0 
2594 : 26 3b __ ROL ACCU + 0 
2596 : 26 3c __ ROL ACCU + 1 
2598 : ca __ __ DEX
2599 : d0 f2 __ BNE $258d ; (divmod + 71)
259b : 85 25 __ STA WORK + 2 
259d : 60 __ __ RTS
259e : a9 00 __ LDA #$00
25a0 : 85 25 __ STA WORK + 2 
25a2 : 85 26 __ STA WORK + 3 
25a4 : 84 22 __ STY $22 
25a6 : a0 10 __ LDY #$10
25a8 : 18 __ __ CLC
25a9 : 26 3b __ ROL ACCU + 0 
25ab : 26 3c __ ROL ACCU + 1 
25ad : 26 25 __ ROL WORK + 2 
25af : 26 26 __ ROL WORK + 3 
25b1 : 38 __ __ SEC
25b2 : a5 25 __ LDA WORK + 2 
25b4 : e5 23 __ SBC WORK + 0 
25b6 : aa __ __ TAX
25b7 : a5 26 __ LDA WORK + 3 
25b9 : e5 24 __ SBC WORK + 1 
25bb : 90 04 __ BCC $25c1 ; (divmod + 123)
25bd : 86 25 __ STX WORK + 2 
25bf : 85 26 __ STA WORK + 3 
25c1 : 88 __ __ DEY
25c2 : d0 e5 __ BNE $25a9 ; (divmod + 99)
25c4 : 26 3b __ ROL ACCU + 0 
25c6 : 26 3c __ ROL ACCU + 1 
25c8 : a4 22 __ LDY $22 
25ca : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
25cb : 24 3c __ BIT ACCU + 1 
25cd : 10 0d __ BPL $25dc ; (mods16 + 17)
25cf : 20 2a 25 JSR $252a ; (negaccu + 0)
25d2 : 24 24 __ BIT WORK + 1 
25d4 : 10 0d __ BPL $25e3 ; (mods16 + 24)
25d6 : 20 38 25 JSR $2538 ; (negtmp + 0)
25d9 : 4c 46 25 JMP $2546 ; (divmod + 0)
25dc : 24 24 __ BIT WORK + 1 
25de : 10 f9 __ BPL $25d9 ; (mods16 + 14)
25e0 : 20 38 25 JSR $2538 ; (negtmp + 0)
25e3 : 20 46 25 JSR $2546 ; (divmod + 0)
25e6 : 38 __ __ SEC
25e7 : a9 00 __ LDA #$00
25e9 : e5 25 __ SBC WORK + 2 
25eb : 85 25 __ STA WORK + 2 
25ed : a9 00 __ LDA #$00
25ef : e5 26 __ SBC WORK + 3 
25f1 : 85 26 __ STA WORK + 3 
25f3 : 60 __ __ RTS
--------------------------------------------------------------------
__multab32L:
2600 : __ __ __ BYT 00 20 40 60 80 a0 c0 e0 00 20 40 60 80 a0 c0 e0 : . @`..... @`....
--------------------------------------------------------------------
__multab32H:
2610 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 01 : ................
