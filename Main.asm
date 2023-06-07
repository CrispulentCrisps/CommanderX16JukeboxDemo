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
080e : 8e fe 21 STX $21fe ; (spentry + 0)
0811 : a9 93 __ LDA #$93
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
0832 : e9 93 __ SBC #$93
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
21fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 0c 0c JSR $0c0c ; (zsm_irq_init.s0 + 0)
0883 : 20 e5 0d JSR $0de5 ; (ClearVERAScreen.s0 + 0)
0886 : 20 28 0e JSR $0e28 ; (SetUpSprites.s0 + 0)
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
08e8 : a9 00 __ LDA #$00
08ea : 85 32 __ STA P5 
08ec : a9 46 __ LDA #$46
08ee : 85 33 __ STA P6 
08f0 : 20 b7 1a JSR $1ab7 ; (SetPaletteIndex.s0 + 0)
08f3 : a9 00 __ LDA #$00
08f5 : 85 50 __ STA T1 + 0 
08f7 : 85 51 __ STA T1 + 1 
08f9 : 85 52 __ STA T2 + 0 
08fb : 85 53 __ STA T3 + 0 
08fd : 85 54 __ STA T4 + 0 
.l3:
08ff : 20 6a 1b JSR $1b6a ; (getchx.s0 + 0)
0902 : a5 3b __ LDA ACCU + 0 
0904 : 85 55 __ STA T5 + 0 
0906 : a9 30 __ LDA #$30
0908 : 8d 2c 9f STA $9f2c 
090b : ee fc 2c INC $2cfc ; (p + 0)
090e : d0 03 __ BNE $0913 ; (main.s1023 + 0)
.s1022:
0910 : ee fd 2c INC $2cfd ; (p + 1)
.s1023:
0913 : ad fe 2c LDA $2cfe ; (Phase + 0)
0916 : 18 __ __ CLC
0917 : 69 01 __ ADC #$01
0919 : 85 32 __ STA P5 
091b : 8d fe 2c STA $2cfe ; (Phase + 0)
091e : ad ff 2c LDA $2cff ; (Phase + 1)
0921 : 69 00 __ ADC #$00
0923 : 85 33 __ STA P6 
0925 : 8d ff 2c STA $2cff ; (Phase + 1)
0928 : ad e6 45 LDA $45e6 ; (Phase2 + 0)
092b : 18 __ __ CLC
092c : 69 01 __ ADC #$01
092e : 85 34 __ STA P7 
0930 : 8d e6 45 STA $45e6 ; (Phase2 + 0)
0933 : ad e7 45 LDA $45e7 ; (Phase2 + 1)
0936 : 69 00 __ ADC #$00
0938 : 85 35 __ STA P8 
093a : 8d e7 45 STA $45e7 ; (Phase2 + 1)
093d : ad e8 45 LDA $45e8 ; (Phase3 + 0)
0940 : 18 __ __ CLC
0941 : 69 01 __ ADC #$01
0943 : 85 36 __ STA P9 
0945 : 8d e8 45 STA $45e8 ; (Phase3 + 0)
0948 : ad e9 45 LDA $45e9 ; (Phase3 + 1)
094b : 69 00 __ ADC #$00
094d : 85 37 __ STA P10 
094f : 8d e9 45 STA $45e9 ; (Phase3 + 1)
0952 : 20 a5 1b JSR $1ba5 ; (MoveSprites.s0 + 0)
0955 : a5 53 __ LDA T3 + 0 
0957 : c9 01 __ CMP #$01
0959 : f0 07 __ BEQ $0962 ; (main.s5 + 0)
.s6:
095b : a9 00 __ LDA #$00
095d : 8d ee 45 STA $45ee ; (PalTimer + 0)
0960 : f0 2b __ BEQ $098d ; (main.s75 + 0)
.s5:
0962 : a5 52 __ LDA T2 + 0 
0964 : 8d fc 9e STA $9efc ; (sstack + 2)
0967 : a9 00 __ LDA #$00
0969 : 8d fd 9e STA $9efd ; (sstack + 3)
096c : ad ed 45 LDA $45ed ; (LastSelectedSong + 0)
096f : 8d fe 9e STA $9efe ; (sstack + 4)
0972 : a9 00 __ LDA #$00
0974 : 8d ff 9e STA $9eff ; (sstack + 5)
0977 : 20 a0 1d JSR $1da0 ; (PlayZSM.s0 + 0)
097a : a5 52 __ LDA T2 + 0 
097c : 8d ed 45 STA $45ed ; (LastSelectedSong + 0)
097f : ad ee 45 LDA $45ee ; (PalTimer + 0)
0982 : 18 __ __ CLC
0983 : 69 01 __ ADC #$01
0985 : 8d ee 45 STA $45ee ; (PalTimer + 0)
0988 : ad ef 45 LDA $45ef ; (PalTimer + 1)
098b : 69 00 __ ADC #$00
.s75:
098d : 8d ef 45 STA $45ef ; (PalTimer + 1)
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
09b6 : a9 6f __ LDA #$6f
09b8 : 85 32 __ STA P5 
09ba : a9 2c __ LDA #$2c
09bc : 85 33 __ STA P6 
09be : 20 b7 1a JSR $1ab7 ; (SetPaletteIndex.s0 + 0)
09c1 : a9 00 __ LDA #$00
09c3 : 85 54 __ STA T4 + 0 
.s76:
09c5 : ad ef 45 LDA $45ef ; (PalTimer + 1)
09c8 : 30 5f __ BMI $0a29 ; (main.s13 + 0)
.s1016:
09ca : d0 07 __ BNE $09d3 ; (main.s11 + 0)
.s1015:
09cc : a9 03 __ LDA #$03
09ce : cd ee 45 CMP $45ee ; (PalTimer + 0)
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
09ef : ee f0 45 INC $45f0 ; (PalIndex + 0)
09f2 : d0 03 __ BNE $09f7 ; (main.s1025 + 0)
.s1024:
09f4 : ee f1 45 INC $45f1 ; (PalIndex + 1)
.s1025:
09f7 : a9 cf __ LDA #$cf
09f9 : 85 32 __ STA P5 
09fb : a9 2c __ LDA #$2c
09fd : 85 33 __ STA P6 
09ff : 20 b7 1a JSR $1ab7 ; (SetPaletteIndex.s0 + 0)
0a02 : a9 50 __ LDA #$50
0a04 : 85 34 __ STA P7 
0a06 : a9 00 __ LDA #$00
0a08 : 8d fa 9e STA $9efa ; (sstack + 0)
0a0b : 8d fb 9e STA $9efb ; (sstack + 1)
0a0e : 8d fd 9e STA $9efd ; (sstack + 3)
0a11 : a9 10 __ LDA #$10
0a13 : 8d fc 9e STA $9efc ; (sstack + 2)
0a16 : a9 00 __ LDA #$00
0a18 : 85 32 __ STA P5 
0a1a : a9 46 __ LDA #$46
0a1c : 85 33 __ STA P6 
0a1e : 20 b7 1a JSR $1ab7 ; (SetPaletteIndex.s0 + 0)
0a21 : a9 00 __ LDA #$00
0a23 : 8d ee 45 STA $45ee ; (PalTimer + 0)
0a26 : 8d ef 45 STA $45ef ; (PalTimer + 1)
.s13:
0a29 : a9 03 __ LDA #$03
0a2b : 8d 2c 9f STA $9f2c 
0a2e : a5 55 __ LDA T5 + 0 
0a30 : c9 44 __ CMP #$44
0a32 : d0 0c __ BNE $0a40 ; (main.s15 + 0)
.s17:
0a34 : a5 52 __ LDA T2 + 0 
0a36 : cd f2 45 CMP $45f2 ; (MaxSong + 0)
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
0a4a : 20 79 22 JSR $2279 ; (ResetChars.s0 + 0)
0a4d : a9 00 __ LDA #$00
0a4f : 8d f3 45 STA $45f3 ; (off1 + 0)
0a52 : 8d f4 45 STA $45f4 ; (off1 + 1)
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
0a6d : 20 9e 22 JSR $229e ; (Control.s0 + 0)
0a70 : a5 3b __ LDA ACCU + 0 
0a72 : 85 53 __ STA T3 + 0 
0a74 : 38 __ __ SEC
0a75 : a5 50 __ LDA T1 + 0 
0a77 : e9 80 __ SBC #$80
0a79 : 8d 37 9f STA $9f37 
0a7c : a5 51 __ LDA T1 + 1 
0a7e : e9 02 __ SBC #$02
0a80 : 8d 38 9f STA $9f38 
0a83 : 20 14 23 JSR $2314 ; (UpdateVolume.s0 + 0)
0a86 : ad ea 45 LDA $45ea ; (FrameCount + 0)
0a89 : 85 3b __ STA ACCU + 0 
0a8b : ad eb 45 LDA $45eb ; (FrameCount + 1)
0a8e : 85 3c __ STA ACCU + 1 
0a90 : a9 08 __ LDA #$08
0a92 : 85 23 __ STA WORK + 0 
0a94 : a9 00 __ LDA #$00
0a96 : 85 24 __ STA WORK + 1 
0a98 : 20 fa 24 JSR $24fa ; (mods16 + 0)
0a9b : a5 26 __ LDA WORK + 3 
0a9d : f0 03 __ BEQ $0aa2 ; (main.s1008 + 0)
0a9f : 4c 70 0b JMP $0b70 ; (main.s24 + 0)
.s1008:
0aa2 : a5 25 __ LDA WORK + 2 
0aa4 : c9 01 __ CMP #$01
0aa6 : f0 03 __ BEQ $0aab ; (main.s22 + 0)
0aa8 : 4c 70 0b JMP $0b70 ; (main.s24 + 0)
.s22:
0aab : ad f3 45 LDA $45f3 ; (off1 + 0)
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
0ad2 : ad f4 45 LDA $45f4 ; (off1 + 1)
0ad5 : 85 3c __ STA ACCU + 1 
0ad7 : a9 c3 __ LDA #$c3
0ad9 : 85 23 __ STA WORK + 0 
0adb : a9 00 __ LDA #$00
0add : 85 24 __ STA WORK + 1 
0adf : 20 75 24 JSR $2475 ; (divmod + 0)
0ae2 : a6 25 __ LDX WORK + 2 
0ae4 : bd 00 57 LDA $5700,x ; (Song3 + 0)
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
0af7 : ad f4 45 LDA $45f4 ; (off1 + 1)
0afa : 85 3c __ STA ACCU + 1 
0afc : a9 bd __ LDA #$bd
0afe : 85 23 __ STA WORK + 0 
0b00 : a9 00 __ LDA #$00
0b02 : 85 24 __ STA WORK + 1 
0b04 : 20 75 24 JSR $2475 ; (divmod + 0)
0b07 : a6 25 __ LDX WORK + 2 
0b09 : bd 00 58 LDA $5800,x ; (Song4 + 0)
0b0c : 4c 2c 0b JMP $0b2c ; (main.s81 + 0)
.s1002:
0b0f : c9 05 __ CMP #$05
0b11 : d0 29 __ BNE $0b3c ; (main.s26 + 0)
.s52:
0b13 : a5 55 __ LDA T5 + 0 
0b15 : 85 3b __ STA ACCU + 0 
0b17 : ad f4 45 LDA $45f4 ; (off1 + 1)
0b1a : 85 3c __ STA ACCU + 1 
0b1c : a9 92 __ LDA #$92
0b1e : 85 23 __ STA WORK + 0 
0b20 : a9 00 __ LDA #$00
0b22 : 85 24 __ STA WORK + 1 
0b24 : 20 75 24 JSR $2475 ; (divmod + 0)
0b27 : a6 25 __ LDX WORK + 2 
0b29 : bd 00 59 LDA $5900,x ; (Song5 + 0)
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
0b5d : 8d f3 45 STA $45f3 ; (off1 + 0)
0b60 : 90 03 __ BCC $0b65 ; (main.s1027 + 0)
.s1026:
0b62 : ee f4 45 INC $45f4 ; (off1 + 1)
.s1027:
0b65 : a9 80 __ LDA #$80
0b67 : 85 32 __ STA P5 
0b69 : a9 41 __ LDA #$41
0b6b : 85 33 __ STA P6 
0b6d : 20 b7 1a JSR $1ab7 ; (SetPaletteIndex.s0 + 0)
.s24:
0b70 : a9 01 __ LDA #$01
0b72 : 8d 2c 9f STA $9f2c 
0b75 : 20 64 20 JSR $2064 ; (zsm_fill.s0 + 0)
0b78 : a9 00 __ LDA #$00
0b7a : 8d 2c 9f STA $9f2c 
0b7d : 20 f1 21 JSR $21f1 ; (frame_wait.l1 + 0)
0b80 : ee ea 45 INC $45ea ; (FrameCount + 0)
0b83 : d0 03 __ BNE $0b88 ; (main.s1029 + 0)
.s1028:
0b85 : ee eb 45 INC $45eb ; (FrameCount + 1)
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
0b9c : ad f4 45 LDA $45f4 ; (off1 + 1)
0b9f : 85 3c __ STA ACCU + 1 
0ba1 : a9 1d __ LDA #$1d
0ba3 : 85 23 __ STA WORK + 0 
0ba5 : a9 06 __ LDA #$06
0ba7 : 85 24 __ STA WORK + 1 
0ba9 : 20 75 24 JSR $2475 ; (divmod + 0)
0bac : 18 __ __ CLC
0bad : a9 00 __ LDA #$00
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
0bc7 : ad f4 45 LDA $45f4 ; (off1 + 1)
0bca : 85 3c __ STA ACCU + 1 
0bcc : a9 c5 __ LDA #$c5
0bce : 85 23 __ STA WORK + 0 
0bd0 : a9 00 __ LDA #$00
0bd2 : 85 24 __ STA WORK + 1 
0bd4 : 20 75 24 JSR $2475 ; (divmod + 0)
0bd7 : a6 25 __ LDX WORK + 2 
0bd9 : bd 00 56 LDA $5600,x ; (Song2 + 0)
0bdc : 4c 2c 0b JMP $0b2c ; (main.s81 + 0)
.s32:
0bdf : a5 55 __ LDA T5 + 0 
0be1 : 85 3b __ STA ACCU + 0 
0be3 : ad f4 45 LDA $45f4 ; (off1 + 1)
0be6 : 85 3c __ STA ACCU + 1 
0be8 : a9 5c __ LDA #$5c
0bea : 85 23 __ STA WORK + 0 
0bec : a9 07 __ LDA #$07
0bee : 85 24 __ STA WORK + 1 
0bf0 : 20 75 24 JSR $2475 ; (divmod + 0)
0bf3 : 18 __ __ CLC
0bf4 : a9 1e __ LDA #$1e
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
0c10 : 8d f6 45 STA $45f6 ; (oirq + 0)
0c13 : ad 15 03 LDA $0315 
0c16 : 8d f7 45 STA $45f7 ; (oirq + 1)
0c19 : a9 25 __ LDA #$25
0c1b : 8d 14 03 STA $0314 
0c1e : a9 0c __ LDA #$0c
0c20 : 8d 15 03 STA $0315 
0c23 : 58 __ __ CLI
.s1001:
0c24 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
45f6 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c25 : 20 2b 0c JSR $0c2b ; (irq.s1000 + 0)
0c28 : 6c f6 45 JMP ($45f6)
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
0c55 : ad ff 21 LDA $21ff ; (zsm_playing + 0)
0c58 : f0 08 __ BEQ $0c62 ; (irq.s1001 + 0)
.s4:
0c5a : ad 43 25 LDA $2543 ; (zsm_finished + 0)
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
21ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
2543 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c8d : ad 44 25 LDA $2544 ; (zsm_paused + 0)
0c90 : f0 01 __ BEQ $0c93 ; (zsm_play.s2 + 0)
0c92 : 60 __ __ RTS
.s2:
0c93 : ad f8 45 LDA $45f8 ; (zsm_delay + 0)
0c96 : f0 03 __ BEQ $0c9b ; (zsm_play.s5 + 0)
0c98 : 4c c8 0d JMP $0dc8 ; (zsm_play.s4 + 0)
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
0cb7 : ad f9 45 LDA $45f9 ; (zsm_pos + 0)
0cba : 85 4b __ STA T3 + 0 
0cbc : 18 __ __ CLC
0cbd : 69 01 __ ADC #$01
0cbf : 85 4d __ STA T4 + 0 
0cc1 : 8d f9 45 STA $45f9 ; (zsm_pos + 0)
0cc4 : ad fa 45 LDA $45fa ; (zsm_pos + 1)
0cc7 : aa __ __ TAX
0cc8 : 69 00 __ ADC #$00
0cca : 85 4e __ STA T4 + 1 
0ccc : 8d fa 45 STA $45fa ; (zsm_pos + 1)
0ccf : 18 __ __ CLC
0cd0 : a9 93 __ LDA #$93
0cd2 : 65 4b __ ADC T3 + 0 
0cd4 : 85 3b __ STA ACCU + 0 
0cd6 : 8a __ __ TXA
0cd7 : 29 03 __ AND #$03
0cd9 : 69 59 __ ADC #$59
0cdb : 85 3c __ STA ACCU + 1 
0cdd : a0 00 __ LDY #$00
0cdf : b1 3b __ LDA (ACCU + 0),y 
0ce1 : c9 40 __ CMP #$40
0ce3 : b0 03 __ BCS $0ce8 ; (zsm_play.s12 + 0)
0ce5 : 4c 93 0d JMP $0d93 ; (zsm_play.s11 + 0)
.s12:
0ce8 : d0 22 __ BNE $0d0c ; (zsm_play.s15 + 0)
.s14:
0cea : 18 __ __ CLC
0ceb : a9 93 __ LDA #$93
0ced : 65 4d __ ADC T4 + 0 
0cef : 85 4b __ STA T3 + 0 
0cf1 : a5 4e __ LDA T4 + 1 
0cf3 : 29 03 __ AND #$03
0cf5 : 69 59 __ ADC #$59
0cf7 : 85 4c __ STA T3 + 1 
0cf9 : b1 4b __ LDA (T3 + 0),y 
0cfb : 29 3f __ AND #$3f
0cfd : 18 __ __ CLC
0cfe : 65 4d __ ADC T4 + 0 
0d00 : 8d f9 45 STA $45f9 ; (zsm_pos + 0)
0d03 : 98 __ __ TYA
0d04 : 65 4e __ ADC T4 + 1 
0d06 : 8d fa 45 STA $45fa ; (zsm_pos + 1)
0d09 : 4c b7 0c JMP $0cb7 ; (zsm_play.l8 + 0)
.s15:
0d0c : 09 00 __ ORA #$00
0d0e : 30 5b __ BMI $0d6b ; (zsm_play.s18 + 0)
.s17:
0d10 : 29 3f __ AND #$3f
0d12 : f0 a3 __ BEQ $0cb7 ; (zsm_play.l8 + 0)
.s29:
0d14 : 84 50 __ STY T7 + 0 
0d16 : 85 4f __ STA T6 + 0 
0d18 : 18 __ __ CLC
.l1012:
0d19 : a9 93 __ LDA #$93
0d1b : 6d f9 45 ADC $45f9 ; (zsm_pos + 0)
0d1e : 85 4d __ STA T4 + 0 
0d20 : ad fa 45 LDA $45fa ; (zsm_pos + 1)
0d23 : 29 03 __ AND #$03
0d25 : 69 59 __ ADC #$59
0d27 : 85 4e __ STA T4 + 1 
0d29 : a0 00 __ LDY #$00
0d2b : b1 4d __ LDA (T4 + 0),y 
0d2d : 85 2d __ STA P0 
0d2f : ad f9 45 LDA $45f9 ; (zsm_pos + 0)
0d32 : 18 __ __ CLC
0d33 : 69 01 __ ADC #$01
0d35 : aa __ __ TAX
0d36 : ad fa 45 LDA $45fa ; (zsm_pos + 1)
0d39 : 69 00 __ ADC #$00
0d3b : 29 03 __ AND #$03
0d3d : 85 4c __ STA T3 + 1 
0d3f : 8a __ __ TXA
0d40 : 18 __ __ CLC
0d41 : 69 93 __ ADC #$93
0d43 : 85 4b __ STA T3 + 0 
0d45 : a9 59 __ LDA #$59
0d47 : 65 4c __ ADC T3 + 1 
0d49 : 85 4c __ STA T3 + 1 
0d4b : b1 4b __ LDA (T3 + 0),y 
0d4d : 85 2e __ STA P1 
0d4f : 20 cc 0d JSR $0dcc ; (sfx_put.l1 + 0)
0d52 : ad f9 45 LDA $45f9 ; (zsm_pos + 0)
0d55 : 18 __ __ CLC
0d56 : 69 02 __ ADC #$02
0d58 : 8d f9 45 STA $45f9 ; (zsm_pos + 0)
0d5b : 90 03 __ BCC $0d60 ; (zsm_play.s1015 + 0)
.s1014:
0d5d : ee fa 45 INC $45fa ; (zsm_pos + 1)
.s1015:
0d60 : e6 50 __ INC T7 + 0 
0d62 : a5 50 __ LDA T7 + 0 
0d64 : c5 4f __ CMP T6 + 0 
0d66 : 90 b1 __ BCC $0d19 ; (zsm_play.l1012 + 0)
0d68 : 4c b7 0c JMP $0cb7 ; (zsm_play.l8 + 0)
.s18:
0d6b : c9 80 __ CMP #$80
0d6d : d0 07 __ BNE $0d76 ; (zsm_play.s25 + 0)
.s24:
0d6f : a9 01 __ LDA #$01
0d71 : 8d 43 25 STA $2543 ; (zsm_finished + 0)
0d74 : d0 08 __ BNE $0d7e ; (zsm_play.s10 + 0)
.s25:
0d76 : 29 7f __ AND #$7f
0d78 : 38 __ __ SEC
0d79 : e9 01 __ SBC #$01
0d7b : 8d f8 45 STA $45f8 ; (zsm_delay + 0)
.s10:
0d7e : a5 49 __ LDA T2 + 0 
0d80 : 8d 20 9f STA $9f20 
0d83 : a5 4a __ LDA T2 + 1 
0d85 : 8d 21 9f STA $9f21 
0d88 : a5 48 __ LDA T1 + 0 
0d8a : 8d 22 9f STA $9f22 
0d8d : a5 47 __ LDA T0 + 0 
0d8f : 8d 25 9f STA $9f25 
.s1001:
0d92 : 60 __ __ RTS
.s11:
0d93 : 29 3f __ AND #$3f
0d95 : 09 c0 __ ORA #$c0
0d97 : 8d 20 9f STA $9f20 
0d9a : a9 f9 __ LDA #$f9
0d9c : 8d 21 9f STA $9f21 
0d9f : a9 01 __ LDA #$01
0da1 : 8d 22 9f STA $9f22 
0da4 : a5 4b __ LDA T3 + 0 
0da6 : 69 02 __ ADC #$02
0da8 : 8d f9 45 STA $45f9 ; (zsm_pos + 0)
0dab : 90 01 __ BCC $0dae ; (zsm_play.s1017 + 0)
.s1016:
0dad : e8 __ __ INX
.s1017:
0dae : 8e fa 45 STX $45fa ; (zsm_pos + 1)
0db1 : 18 __ __ CLC
0db2 : a9 93 __ LDA #$93
0db4 : 65 4d __ ADC T4 + 0 
0db6 : 85 4b __ STA T3 + 0 
0db8 : a5 4e __ LDA T4 + 1 
0dba : 29 03 __ AND #$03
0dbc : 69 59 __ ADC #$59
0dbe : 85 4c __ STA T3 + 1 
0dc0 : b1 4b __ LDA (T3 + 0),y 
0dc2 : 8d 23 9f STA $9f23 
0dc5 : 4c b7 0c JMP $0cb7 ; (zsm_play.l8 + 0)
.s4:
0dc8 : ce f8 45 DEC $45f8 ; (zsm_delay + 0)
0dcb : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
2544 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
45f8 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
5993 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
45f9 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0dcc : ad 41 9f LDA $9f41 
0dcf : 30 fb __ BMI $0dcc ; (sfx_put.l1 + 0)
.s3:
0dd1 : a5 2d __ LDA P0 ; (index + 0)
0dd3 : 8d 40 9f STA $9f40 
0dd6 : ea __ __ NOP
0dd7 : ea __ __ NOP
0dd8 : ea __ __ NOP
0dd9 : ea __ __ NOP
0dda : a5 2e __ LDA P1 ; (data + 0)
0ddc : a6 2d __ LDX P0 ; (index + 0)
0dde : 9d 00 5e STA $5e00,x ; (vera_fm_s_regs + 0)
0de1 : 8d 41 9f STA $9f41 
.s1001:
0de4 : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
5e00 : __ __ __ BSS	256
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0de5 : a9 93 __ LDA #$93
0de7 : 85 2d __ STA P0 
0de9 : a9 00 __ LDA #$00
0deb : 85 2e __ STA P1 
0ded : 20 22 0e JSR $0e22 ; (putch.s0 + 0)
0df0 : a9 11 __ LDA #$11
0df2 : 8d 22 9f STA $9f22 
0df5 : a2 00 __ LDX #$00
.l2:
0df7 : 8a __ __ TXA
0df8 : 18 __ __ CLC
0df9 : 69 b0 __ ADC #$b0
0dfb : 8d 21 9f STA $9f21 
0dfe : a9 00 __ LDA #$00
0e00 : 8d 20 9f STA $9f20 
0e03 : a0 80 __ LDY #$80
.l1003:
0e05 : a9 20 __ LDA #$20
0e07 : 8d 23 9f STA $9f23 
0e0a : a9 01 __ LDA #$01
0e0c : 8d 23 9f STA $9f23 
0e0f : a9 20 __ LDA #$20
0e11 : 8d 24 9f STA $9f24 
0e14 : a9 01 __ LDA #$01
0e16 : 8d 24 9f STA $9f24 
0e19 : 88 __ __ DEY
0e1a : d0 e9 __ BNE $0e05 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0e1c : e8 __ __ INX
0e1d : e0 40 __ CPX #$40
0e1f : 90 d6 __ BCC $0df7 ; (ClearVERAScreen.l2 + 0)
.s1001:
0e21 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0e22 : a5 2d __ LDA P0 
0e24 : 20 d2 ff JSR $ffd2 
.s1001:
0e27 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e28 : a9 40 __ LDA #$40
0e2a : 8d 45 25 STA $2545 ; (VolAddr + 0)
0e2d : a9 57 __ LDA #$57
0e2f : 8d 46 25 STA $2546 ; (VolAddr + 1)
0e32 : a9 01 __ LDA #$01
0e34 : 8d 47 25 STA $2547 ; (VolAddr + 2)
0e37 : 8d 4b 25 STA $254b ; (IndAddr + 2)
0e3a : a9 00 __ LDA #$00
0e3c : 8d 48 25 STA $2548 ; (VolAddr + 3)
0e3f : 8d 49 25 STA $2549 ; (IndAddr + 0)
0e42 : 8d 4c 25 STA $254c ; (IndAddr + 3)
0e45 : a9 31 __ LDA #$31
0e47 : 8d 4a 25 STA $254a ; (IndAddr + 1)
0e4a : a9 00 __ LDA #$00
0e4c : 8d 25 9f STA $9f25 
0e4f : a9 80 __ LDA #$80
0e51 : 8d 2b 9f STA $9f2b 
0e54 : 8d 2a 9f STA $9f2a 
0e57 : a9 62 __ LDA #$62
0e59 : 8d 2d 9f STA $9f2d 
0e5c : a9 68 __ LDA #$68
0e5e : 8d 34 9f STA $9f34 
0e61 : a9 00 __ LDA #$00
0e63 : 85 2d __ STA P0 
0e65 : 85 2e __ STA P1 
0e67 : 85 2f __ STA P2 
0e69 : 85 30 __ STA P3 
0e6b : 85 31 __ STA P4 
0e6d : 20 12 18 JSR $1812 ; (tileBaseConfig.s0 + 0)
0e70 : 8d 2f 9f STA $9f2f 
0e73 : a9 00 __ LDA #$00
0e75 : 85 2d __ STA P0 
0e77 : a9 20 __ LDA #$20
0e79 : 85 2f __ STA P2 
0e7b : 20 2a 18 JSR $182a ; (memoryToMapMemoryAddress.s0 + 0)
0e7e : 8d 2e 9f STA $9f2e 
0e81 : a9 01 __ LDA #$01
0e83 : 8d 22 9f STA $9f22 
0e86 : a2 80 __ LDX #$80
.l6:
0e88 : a0 50 __ LDY #$50
.l1071:
0e8a : a9 00 __ LDA #$00
0e8c : 8d 24 9f STA $9f24 
0e8f : a9 08 __ LDA #$08
0e91 : 8d 24 9f STA $9f24 
0e94 : 88 __ __ DEY
0e95 : d0 f3 __ BNE $0e8a ; (SetUpSprites.l1071 + 0)
.s1072:
0e97 : ca __ __ DEX
0e98 : d0 ee __ BNE $0e88 ; (SetUpSprites.l6 + 0)
.s4:
0e9a : 86 4c __ STX T1 + 0 
0e9c : a9 00 __ LDA #$00
0e9e : 85 2d __ STA P0 
0ea0 : 85 2e __ STA P1 
0ea2 : 85 2f __ STA P2 
0ea4 : 85 30 __ STA P3 
0ea6 : a9 20 __ LDA #$20
0ea8 : 85 33 __ STA P6 
0eaa : a9 03 __ LDA #$03
0eac : 85 34 __ STA P7 
0eae : a9 4d __ LDA #$4d
0eb0 : 85 31 __ STA P4 
0eb2 : a9 25 __ LDA #$25
0eb4 : 85 32 __ STA P5 
0eb6 : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
0eb9 : a9 10 __ LDA #$10
0ebb : 8d 22 9f STA $9f22 
0ebe : a9 00 __ LDA #$00
0ec0 : 8d 20 9f STA $9f20 
0ec3 : a9 20 __ LDA #$20
0ec5 : 8d 21 9f STA $9f21 
.l10:
0ec8 : a9 00 __ LDA #$00
0eca : 85 4d __ STA T2 + 0 
.l14:
0ecc : 20 72 18 JSR $1872 ; (rand.s0 + 0)
0ecf : a9 31 __ LDA #$31
0ed1 : 85 23 __ STA WORK + 0 
0ed3 : a9 00 __ LDA #$00
0ed5 : 85 24 __ STA WORK + 1 
0ed7 : 20 75 24 JSR $2475 ; (divmod + 0)
0eda : a5 4c __ LDA T1 + 0 
0edc : d0 03 __ BNE $0ee1 ; (SetUpSprites.s1041 + 0)
0ede : 4c c4 0f JMP $0fc4 ; (SetUpSprites.s1037 + 0)
.s1041:
0ee1 : a9 10 __ LDA #$10
0ee3 : c5 4c __ CMP T1 + 0 
0ee5 : a9 00 __ LDA #$00
0ee7 : 2a __ __ ROL
0ee8 : d0 03 __ BNE $0eed ; (SetUpSprites.s1069 + 0)
0eea : 4c c4 0f JMP $0fc4 ; (SetUpSprites.s1037 + 0)
.s1069:
0eed : a8 __ __ TAY
0eee : a5 4d __ LDA T2 + 0 
0ef0 : f0 06 __ BEQ $0ef8 ; (SetUpSprites.s26 + 0)
.s1068:
0ef2 : a9 10 __ LDA #$10
0ef4 : c5 4d __ CMP T2 + 0 
0ef6 : b0 18 __ BCS $0f10 ; (SetUpSprites.s1065 + 0)
.s26:
0ef8 : 98 __ __ TYA
0ef9 : d0 03 __ BNE $0efe ; (SetUpSprites.s1067 + 0)
0efb : 4c c4 0f JMP $0fc4 ; (SetUpSprites.s1037 + 0)
.s1067:
0efe : a5 4d __ LDA T2 + 0 
0f00 : c9 3e __ CMP #$3e
0f02 : b0 03 __ BCS $0f07 ; (SetUpSprites.s1066 + 0)
0f04 : 4c c4 0f JMP $0fc4 ; (SetUpSprites.s1037 + 0)
.s1066:
0f07 : a9 4e __ LDA #$4e
0f09 : c5 4d __ CMP T2 + 0 
0f0b : b0 03 __ BCS $0f10 ; (SetUpSprites.s1065 + 0)
0f0d : 4c c4 0f JMP $0fc4 ; (SetUpSprites.s1037 + 0)
.s1065:
0f10 : a5 4c __ LDA T1 + 0 
0f12 : c9 01 __ CMP #$01
0f14 : f0 79 __ BEQ $0f8f ; (SetUpSprites.s1064 + 0)
.s1057:
0f16 : c9 10 __ CMP #$10
0f18 : d0 30 __ BNE $0f4a ; (SetUpSprites.s1049 + 0)
.s1056:
0f1a : a5 4d __ LDA T2 + 0 
0f1c : c9 01 __ CMP #$01
0f1e : f0 04 __ BEQ $0f24 ; (SetUpSprites.s46 + 0)
.s1055:
0f20 : c9 3e __ CMP #$3e
0f22 : d0 04 __ BNE $0f28 ; (SetUpSprites.s1054 + 0)
.s46:
0f24 : a9 14 __ LDA #$14
0f26 : d0 5a __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s1054:
0f28 : c9 10 __ CMP #$10
0f2a : 90 0c __ BCC $0f38 ; (SetUpSprites.s52 + 0)
.s1053:
0f2c : a9 3e __ LDA #$3e
0f2e : c5 4d __ CMP T2 + 0 
0f30 : b0 0a __ BCS $0f3c ; (SetUpSprites.s1051 + 0)
.s1052:
0f32 : a5 4d __ LDA T2 + 0 
0f34 : c9 4e __ CMP #$4e
0f36 : b0 04 __ BCS $0f3c ; (SetUpSprites.s1051 + 0)
.s52:
0f38 : a9 15 __ LDA #$15
0f3a : d0 46 __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s1051:
0f3c : a5 4d __ LDA T2 + 0 
0f3e : c9 10 __ CMP #$10
0f40 : f0 04 __ BEQ $0f46 ; (SetUpSprites.s59 + 0)
.s1050:
0f42 : c9 4e __ CMP #$4e
0f44 : d0 04 __ BNE $0f4a ; (SetUpSprites.s1049 + 0)
.s59:
0f46 : a9 16 __ LDA #$16
0f48 : d0 38 __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s1049:
0f4a : a5 4d __ LDA T2 + 0 
0f4c : c9 01 __ CMP #$01
0f4e : d0 08 __ BNE $0f58 ; (SetUpSprites.s1047 + 0)
.s1048:
0f50 : a5 4c __ LDA T1 + 0 
0f52 : c9 10 __ CMP #$10
0f54 : 90 06 __ BCC $0f5c ; (SetUpSprites.s65 + 0)
.s1084:
0f56 : a5 4d __ LDA T2 + 0 
.s1047:
0f58 : c9 3e __ CMP #$3e
0f5a : d0 04 __ BNE $0f60 ; (SetUpSprites.s1046 + 0)
.s65:
0f5c : a9 12 __ LDA #$12
0f5e : d0 22 __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s1046:
0f60 : c9 10 __ CMP #$10
0f62 : d0 06 __ BNE $0f6a ; (SetUpSprites.s1044 + 0)
.s1045:
0f64 : a5 4c __ LDA T1 + 0 
0f66 : c9 10 __ CMP #$10
0f68 : 90 12 __ BCC $0f7c ; (SetUpSprites.s70 + 0)
.s1044:
0f6a : a5 4d __ LDA T2 + 0 
0f6c : c9 4e __ CMP #$4e
0f6e : d0 10 __ BNE $0f80 ; (SetUpSprites.s71 + 0)
.s1043:
0f70 : a5 4c __ LDA T1 + 0 
0f72 : c9 10 __ CMP #$10
0f74 : b0 0a __ BCS $0f80 ; (SetUpSprites.s71 + 0)
.s1042:
0f76 : a9 01 __ LDA #$01
0f78 : c5 4c __ CMP T1 + 0 
0f7a : b0 04 __ BCS $0f80 ; (SetUpSprites.s71 + 0)
.s70:
0f7c : a9 17 __ LDA #$17
0f7e : d0 02 __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s71:
0f80 : a9 13 __ LDA #$13
.s296:
0f82 : 8d 23 9f STA $9f23 
0f85 : a9 00 __ LDA #$00
0f87 : 8d 23 9f STA $9f23 
0f8a : e6 4d __ INC T2 + 0 
0f8c : 4c cc 0e JMP $0ecc ; (SetUpSprites.l14 + 0)
.s1064:
0f8f : a5 4d __ LDA T2 + 0 
0f91 : c9 01 __ CMP #$01
0f93 : f0 04 __ BEQ $0f99 ; (SetUpSprites.s27 + 0)
.s1063:
0f95 : c9 3e __ CMP #$3e
0f97 : d0 04 __ BNE $0f9d ; (SetUpSprites.s1062 + 0)
.s27:
0f99 : a9 0f __ LDA #$0f
0f9b : d0 e5 __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s1062:
0f9d : c9 10 __ CMP #$10
0f9f : 90 0c __ BCC $0fad ; (SetUpSprites.s33 + 0)
.s1061:
0fa1 : a9 3e __ LDA #$3e
0fa3 : c5 4d __ CMP T2 + 0 
0fa5 : b0 0a __ BCS $0fb1 ; (SetUpSprites.s1059 + 0)
.s1060:
0fa7 : a5 4d __ LDA T2 + 0 
0fa9 : c9 4e __ CMP #$4e
0fab : b0 04 __ BCS $0fb1 ; (SetUpSprites.s1059 + 0)
.s33:
0fad : a9 10 __ LDA #$10
0faf : d0 d1 __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s1059:
0fb1 : a5 4d __ LDA T2 + 0 
0fb3 : c9 10 __ CMP #$10
0fb5 : f0 04 __ BEQ $0fbb ; (SetUpSprites.s40 + 0)
.s1058:
0fb7 : c9 4e __ CMP #$4e
0fb9 : d0 04 __ BNE $0fbf ; (SetUpSprites.s1083 + 0)
.s40:
0fbb : a9 11 __ LDA #$11
0fbd : d0 c3 __ BNE $0f82 ; (SetUpSprites.s296 + 0)
.s1083:
0fbf : a5 4c __ LDA T1 + 0 
0fc1 : 4c 16 0f JMP $0f16 ; (SetUpSprites.s1057 + 0)
.s1037:
0fc4 : a5 4c __ LDA T1 + 0 
0fc6 : c9 36 __ CMP #$36
0fc8 : 90 03 __ BCC $0fcd ; (SetUpSprites.s1036 + 0)
0fca : 4c 68 17 JMP $1768 ; (SetUpSprites.s1031 + 0)
.s1036:
0fcd : c9 2c __ CMP #$2c
0fcf : b0 03 __ BCS $0fd4 ; (SetUpSprites.s1035 + 0)
0fd1 : 4c 68 17 JMP $1768 ; (SetUpSprites.s1031 + 0)
.s1035:
0fd4 : f0 04 __ BEQ $0fda ; (SetUpSprites.s81 + 0)
.s1034:
0fd6 : c9 34 __ CMP #$34
0fd8 : d0 04 __ BNE $0fde ; (SetUpSprites.s1033 + 0)
.s81:
0fda : a9 0a __ LDA #$0a
0fdc : d0 0e __ BNE $0fec ; (SetUpSprites.s279 + 0)
.s1033:
0fde : c9 2d __ CMP #$2d
0fe0 : f0 04 __ BEQ $0fe6 ; (SetUpSprites.s85 + 0)
.s1032:
0fe2 : c9 35 __ CMP #$35
0fe4 : d0 04 __ BNE $0fea ; (SetUpSprites.s86 + 0)
.s85:
0fe6 : a9 0b __ LDA #$0b
0fe8 : d0 02 __ BNE $0fec ; (SetUpSprites.s279 + 0)
.s86:
0fea : a9 04 __ LDA #$04
.s279:
0fec : 8d 23 9f STA $9f23 
0fef : a9 00 __ LDA #$00
0ff1 : 8d 23 9f STA $9f23 
0ff4 : e6 4d __ INC T2 + 0 
0ff6 : 30 03 __ BMI $0ffb ; (SetUpSprites.s11 + 0)
0ff8 : 4c cc 0e JMP $0ecc ; (SetUpSprites.l14 + 0)
.s11:
0ffb : e6 4c __ INC T1 + 0 
0ffd : a5 4c __ LDA T1 + 0 
0fff : c9 40 __ CMP #$40
1001 : b0 03 __ BCS $1006 ; (SetUpSprites.s12 + 0)
1003 : 4c c8 0e JMP $0ec8 ; (SetUpSprites.l10 + 0)
.s12:
1006 : a9 c0 __ LDA #$c0
1008 : 85 2d __ STA P0 
100a : a9 52 __ LDA #$52
100c : 85 2e __ STA P1 
100e : a9 01 __ LDA #$01
1010 : 85 2f __ STA P2 
1012 : a9 00 __ LDA #$00
1014 : 85 30 __ STA P3 
1016 : 85 33 __ STA P6 
1018 : a9 02 __ LDA #$02
101a : 85 34 __ STA P7 
101c : a9 6f __ LDA #$6f
101e : 85 31 __ STA P4 
1020 : a9 28 __ LDA #$28
1022 : 85 32 __ STA P5 
1024 : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
1027 : a9 00 __ LDA #$00
1029 : 85 2d __ STA P0 
102b : a9 55 __ LDA #$55
102d : 85 2e __ STA P1 
102f : a9 02 __ LDA #$02
1031 : 85 34 __ STA P7 
1033 : a9 6f __ LDA #$6f
1035 : 85 31 __ STA P4 
1037 : a9 2a __ LDA #$2a
1039 : 85 32 __ STA P5 
103b : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
103e : a9 96 __ LDA #$96
1040 : 85 2e __ STA P1 
1042 : a9 0a __ LDA #$0a
1044 : 85 2f __ STA P2 
1046 : 85 34 __ STA P7 
1048 : a9 02 __ LDA #$02
104a : 85 31 __ STA P4 
104c : 85 32 __ STA P5 
104e : a9 03 __ LDA #$03
1050 : 85 33 __ STA P6 
1052 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1055 : a9 68 __ LDA #$68
1057 : 85 2e __ STA P1 
1059 : a9 00 __ LDA #$00
105b : 85 2f __ STA P2 
105d : a9 b6 __ LDA #$b6
105f : 85 30 __ STA P3 
1061 : a9 01 __ LDA #$01
1063 : 85 31 __ STA P4 
1065 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1068 : a9 01 __ LDA #$01
106a : 85 2d __ STA P0 
106c : a9 a8 __ LDA #$a8
106e : 85 2e __ STA P1 
1070 : a9 0a __ LDA #$0a
1072 : 85 2f __ STA P2 
1074 : a9 00 __ LDA #$00
1076 : 85 30 __ STA P3 
1078 : a9 02 __ LDA #$02
107a : 85 31 __ STA P4 
107c : a9 09 __ LDA #$09
107e : 85 34 __ STA P7 
1080 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1083 : a9 f0 __ LDA #$f0
1085 : 85 2e __ STA P1 
1087 : a9 01 __ LDA #$01
1089 : 85 2f __ STA P2 
108b : 85 31 __ STA P4 
108d : a9 b6 __ LDA #$b6
108f : 85 30 __ STA P3 
1091 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1094 : a9 00 __ LDA #$00
1096 : 85 2d __ STA P0 
1098 : 85 30 __ STA P3 
109a : 85 33 __ STA P6 
109c : a9 30 __ LDA #$30
109e : 85 2e __ STA P1 
10a0 : a9 01 __ LDA #$01
10a2 : 85 34 __ STA P7 
10a4 : a9 00 __ LDA #$00
10a6 : 85 31 __ STA P4 
10a8 : a9 2d __ LDA #$2d
10aa : 85 32 __ STA P5 
10ac : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
10af : a9 16 __ LDA #$16
10b1 : 85 2d __ STA P0 
10b3 : a9 80 __ LDA #$80
10b5 : 85 2e __ STA P1 
10b7 : a9 09 __ LDA #$09
10b9 : 85 2f __ STA P2 
10bb : a9 01 __ LDA #$01
10bd : 85 31 __ STA P4 
10bf : 85 34 __ STA P7 
10c1 : a9 02 __ LDA #$02
10c3 : 85 32 __ STA P5 
10c5 : a9 03 __ LDA #$03
10c7 : 85 33 __ STA P6 
10c9 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
10cc : a9 30 __ LDA #$30
10ce : 85 2e __ STA P1 
10d0 : a9 01 __ LDA #$01
10d2 : 85 2f __ STA P2 
10d4 : a9 b8 __ LDA #$b8
10d6 : 85 30 __ STA P3 
10d8 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
10db : a9 00 __ LDA #$00
10dd : 85 2d __ STA P0 
10df : 85 30 __ STA P3 
10e1 : 85 33 __ STA P6 
10e3 : a9 33 __ LDA #$33
10e5 : 85 2e __ STA P1 
10e7 : a9 02 __ LDA #$02
10e9 : 85 34 __ STA P7 
10eb : a9 00 __ LDA #$00
10ed : 85 31 __ STA P4 
10ef : a9 2e __ LDA #$2e
10f1 : 85 32 __ STA P5 
10f3 : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
10f6 : a9 17 __ LDA #$17
10f8 : 85 2d __ STA P0 
10fa : a9 98 __ LDA #$98
10fc : 85 2e __ STA P1 
10fe : a9 09 __ LDA #$09
1100 : 85 2f __ STA P2 
1102 : a9 02 __ LDA #$02
1104 : 85 31 __ STA P4 
1106 : 85 32 __ STA P5 
1108 : a9 03 __ LDA #$03
110a : 85 33 __ STA P6 
110c : a9 01 __ LDA #$01
110e : 85 34 __ STA P7 
1110 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1113 : a9 fc __ LDA #$fc
1115 : 85 2e __ STA P1 
1117 : a9 00 __ LDA #$00
1119 : 85 2f __ STA P2 
111b : a9 b8 __ LDA #$b8
111d : 85 30 __ STA P3 
111f : a9 01 __ LDA #$01
1121 : 85 31 __ STA P4 
1123 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1126 : a9 18 __ LDA #$18
1128 : 85 2d __ STA P0 
112a : a9 98 __ LDA #$98
112c : 85 2e __ STA P1 
112e : a9 09 __ LDA #$09
1130 : 85 2f __ STA P2 
1132 : a9 00 __ LDA #$00
1134 : 85 30 __ STA P3 
1136 : a9 02 __ LDA #$02
1138 : 85 31 __ STA P4 
113a : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
113d : a9 4c __ LDA #$4c
113f : 85 2e __ STA P1 
1141 : a9 01 __ LDA #$01
1143 : 85 2f __ STA P2 
1145 : 85 31 __ STA P4 
1147 : a9 b8 __ LDA #$b8
1149 : 85 30 __ STA P3 
114b : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
114e : a9 01 __ LDA #$01
1150 : 85 2e __ STA P1 
1152 : a9 00 __ LDA #$00
1154 : 85 2f __ STA P2 
1156 : 20 2f 19 JSR $192f ; (vera_spr_flip.s0 + 0)
1159 : a9 10 __ LDA #$10
115b : 85 2d __ STA P0 
115d : a9 20 __ LDA #$20
115f : 85 30 __ STA P3 
1161 : a9 00 __ LDA #$00
1163 : 85 31 __ STA P4 
1165 : a9 6f __ LDA #$6f
1167 : 85 2e __ STA P1 
1169 : a9 2c __ LDA #$2c
116b : 85 2f __ STA P2 
116d : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
1170 : a9 00 __ LDA #$00
1172 : 85 2d __ STA P0 
1174 : 85 30 __ STA P3 
1176 : 85 33 __ STA P6 
1178 : a9 31 __ LDA #$31
117a : 85 2e __ STA P1 
117c : a9 01 __ LDA #$01
117e : 85 2f __ STA P2 
1180 : a9 02 __ LDA #$02
1182 : 85 34 __ STA P7 
1184 : a9 00 __ LDA #$00
1186 : 85 31 __ STA P4 
1188 : a9 30 __ LDA #$30
118a : 85 32 __ STA P5 
118c : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
118f : a9 00 __ LDA #$00
1191 : 85 4c __ STA T1 + 0 
1193 : 85 4d __ STA T2 + 0 
1195 : a9 03 __ LDA #$03
1197 : 85 33 __ STA P6 
1199 : a9 02 __ LDA #$02
119b : 85 34 __ STA P7 
119d : 18 __ __ CLC
.l1085:
119e : a9 88 __ LDA #$88
11a0 : 85 2e __ STA P1 
11a2 : a9 09 __ LDA #$09
11a4 : 85 2f __ STA P2 
11a6 : a9 00 __ LDA #$00
11a8 : 85 30 __ STA P3 
11aa : 85 31 __ STA P4 
11ac : 85 32 __ STA P5 
11ae : a5 4c __ LDA T1 + 0 
11b0 : 69 19 __ ADC #$19
11b2 : 85 2d __ STA P0 
11b4 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
11b7 : a9 b8 __ LDA #$b8
11b9 : 85 30 __ STA P3 
11bb : a9 01 __ LDA #$01
11bd : 85 31 __ STA P4 
11bf : 38 __ __ SEC
11c0 : a5 4d __ LDA T2 + 0 
11c2 : e9 fc __ SBC #$fc
11c4 : 85 2e __ STA P1 
11c6 : a9 00 __ LDA #$00
11c8 : e9 03 __ SBC #$03
11ca : 85 2f __ STA P2 
11cc : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
11cf : 18 __ __ CLC
11d0 : a5 4d __ LDA T2 + 0 
11d2 : 69 0c __ ADC #$0c
11d4 : 85 4d __ STA T2 + 0 
11d6 : e6 4c __ INC T1 + 0 
11d8 : a5 4c __ LDA T1 + 0 
11da : c9 08 __ CMP #$08
11dc : 90 c0 __ BCC $119e ; (SetUpSprites.l1085 + 0)
.s138:
11de : a9 00 __ LDA #$00
11e0 : 85 4c __ STA T1 + 0 
11e2 : 85 4d __ STA T2 + 0 
11e4 : a9 03 __ LDA #$03
11e6 : 85 33 __ STA P6 
11e8 : a9 02 __ LDA #$02
11ea : 85 34 __ STA P7 
11ec : 18 __ __ CLC
.l1087:
11ed : a9 88 __ LDA #$88
11ef : 85 2e __ STA P1 
11f1 : a9 09 __ LDA #$09
11f3 : 85 2f __ STA P2 
11f5 : a9 00 __ LDA #$00
11f7 : 85 30 __ STA P3 
11f9 : 85 31 __ STA P4 
11fb : a5 4c __ LDA T1 + 0 
11fd : 69 21 __ ADC #$21
11ff : 85 2d __ STA P0 
1201 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1204 : a9 c4 __ LDA #$c4
1206 : 85 30 __ STA P3 
1208 : a9 01 __ LDA #$01
120a : 85 31 __ STA P4 
120c : 38 __ __ SEC
120d : a5 4d __ LDA T2 + 0 
120f : e9 fc __ SBC #$fc
1211 : 85 2e __ STA P1 
1213 : a9 00 __ LDA #$00
1215 : e9 03 __ SBC #$03
1217 : 85 2f __ STA P2 
1219 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
121c : 18 __ __ CLC
121d : a5 4d __ LDA T2 + 0 
121f : 69 0c __ ADC #$0c
1221 : 85 4d __ STA T2 + 0 
1223 : e6 4c __ INC T1 + 0 
1225 : a5 4c __ LDA T1 + 0 
1227 : c9 08 __ CMP #$08
1229 : 90 c2 __ BCC $11ed ; (SetUpSprites.l1087 + 0)
.s142:
122b : a9 00 __ LDA #$00
122d : 85 4c __ STA T1 + 0 
122f : 85 4d __ STA T2 + 0 
1231 : a9 03 __ LDA #$03
1233 : 85 33 __ STA P6 
1235 : a9 02 __ LDA #$02
1237 : 85 34 __ STA P7 
1239 : 18 __ __ CLC
.l1089:
123a : a9 88 __ LDA #$88
123c : 85 2e __ STA P1 
123e : a9 09 __ LDA #$09
1240 : 85 2f __ STA P2 
1242 : a9 00 __ LDA #$00
1244 : 85 30 __ STA P3 
1246 : 85 31 __ STA P4 
1248 : a5 4c __ LDA T1 + 0 
124a : 69 29 __ ADC #$29
124c : 85 2d __ STA P0 
124e : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1251 : a9 b8 __ LDA #$b8
1253 : 85 30 __ STA P3 
1255 : a9 01 __ LDA #$01
1257 : 85 31 __ STA P4 
1259 : 38 __ __ SEC
125a : a9 6c __ LDA #$6c
125c : e5 4d __ SBC T2 + 0 
125e : 85 2e __ STA P1 
1260 : a9 02 __ LDA #$02
1262 : e9 04 __ SBC #$04
1264 : 85 2f __ STA P2 
1266 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1269 : 18 __ __ CLC
126a : a5 4d __ LDA T2 + 0 
126c : 69 0c __ ADC #$0c
126e : 85 4d __ STA T2 + 0 
1270 : e6 4c __ INC T1 + 0 
1272 : a5 4c __ LDA T1 + 0 
1274 : c9 08 __ CMP #$08
1276 : 90 c2 __ BCC $123a ; (SetUpSprites.l1089 + 0)
.s146:
1278 : a9 00 __ LDA #$00
127a : 85 4c __ STA T1 + 0 
127c : a9 02 __ LDA #$02
127e : 85 34 __ STA P7 
1280 : a9 03 __ LDA #$03
1282 : 85 33 __ STA P6 
.l148:
1284 : 38 __ __ SEC
1285 : a9 00 __ LDA #$00
1287 : e5 4c __ SBC T1 + 0 
1289 : 29 0c __ AND #$0c
128b : 49 ff __ EOR #$ff
128d : 38 __ __ SEC
128e : 69 6c __ ADC #$6c
1290 : 85 4d __ STA T2 + 0 
1292 : a9 02 __ LDA #$02
1294 : e9 00 __ SBC #$00
1296 : 85 4e __ STA T2 + 1 
1298 : 18 __ __ CLC
1299 : a5 4c __ LDA T1 + 0 
129b : 69 31 __ ADC #$31
129d : 85 2d __ STA P0 
129f : a9 02 __ LDA #$02
12a1 : 85 4f __ STA T5 + 0 
.l1073:
12a3 : a9 88 __ LDA #$88
12a5 : 85 2e __ STA P1 
12a7 : a9 09 __ LDA #$09
12a9 : 85 2f __ STA P2 
12ab : a9 00 __ LDA #$00
12ad : 85 30 __ STA P3 
12af : 85 31 __ STA P4 
12b1 : 85 32 __ STA P5 
12b3 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
12b6 : a5 4d __ LDA T2 + 0 
12b8 : 85 2e __ STA P1 
12ba : a5 4e __ LDA T2 + 1 
12bc : 85 2f __ STA P2 
12be : a9 b8 __ LDA #$b8
12c0 : 85 30 __ STA P3 
12c2 : a9 01 __ LDA #$01
12c4 : 85 31 __ STA P4 
12c6 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
12c9 : c6 4f __ DEC T5 + 0 
12cb : d0 d6 __ BNE $12a3 ; (SetUpSprites.l1073 + 0)
.s149:
12cd : e6 4c __ INC T1 + 0 
12cf : a5 4c __ LDA T1 + 0 
12d1 : c9 02 __ CMP #$02
12d3 : 90 af __ BCC $1284 ; (SetUpSprites.l148 + 0)
.s150:
12d5 : a9 40 __ LDA #$40
12d7 : 85 2d __ STA P0 
12d9 : a9 4d __ LDA #$4d
12db : 85 2e __ STA P1 
12dd : a9 01 __ LDA #$01
12df : 85 2f __ STA P2 
12e1 : 85 34 __ STA P7 
12e3 : a9 00 __ LDA #$00
12e5 : 85 30 __ STA P3 
12e7 : 85 33 __ STA P6 
12e9 : a9 00 __ LDA #$00
12eb : 85 31 __ STA P4 
12ed : a9 32 __ LDA #$32
12ef : 85 32 __ STA P5 
12f1 : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
12f4 : a9 33 __ LDA #$33
12f6 : 85 2d __ STA P0 
12f8 : a9 6a __ LDA #$6a
12fa : 85 2e __ STA P1 
12fc : a9 0a __ LDA #$0a
12fe : 85 2f __ STA P2 
1300 : a9 01 __ LDA #$01
1302 : 85 31 __ STA P4 
1304 : a9 02 __ LDA #$02
1306 : 85 32 __ STA P5 
1308 : a9 03 __ LDA #$03
130a : 85 33 __ STA P6 
130c : a9 06 __ LDA #$06
130e : 85 34 __ STA P7 
1310 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1313 : a9 00 __ LDA #$00
1315 : 85 2e __ STA P1 
1317 : 85 31 __ STA P4 
1319 : a9 01 __ LDA #$01
131b : 85 2f __ STA P2 
131d : a9 78 __ LDA #$78
131f : 85 30 __ STA P3 
1321 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1324 : a9 00 __ LDA #$00
1326 : 85 2d __ STA P0 
1328 : 85 30 __ STA P3 
132a : 85 33 __ STA P6 
132c : a9 3d __ LDA #$3d
132e : 85 2e __ STA P1 
1330 : a9 04 __ LDA #$04
1332 : 85 34 __ STA P7 
1334 : a9 00 __ LDA #$00
1336 : 85 31 __ STA P4 
1338 : a9 33 __ LDA #$33
133a : 85 32 __ STA P5 
133c : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
133f : a9 34 __ LDA #$34
1341 : 85 2d __ STA P0 
1343 : a9 e8 __ LDA #$e8
1345 : 85 2e __ STA P1 
1347 : a9 09 __ LDA #$09
1349 : 85 2f __ STA P2 
134b : a9 03 __ LDA #$03
134d : 85 31 __ STA P4 
134f : 85 33 __ STA P6 
1351 : a9 02 __ LDA #$02
1353 : 85 32 __ STA P5 
1355 : a9 05 __ LDA #$05
1357 : 85 34 __ STA P7 
1359 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
135c : a9 00 __ LDA #$00
135e : 85 2e __ STA P1 
1360 : 85 31 __ STA P4 
1362 : a9 01 __ LDA #$01
1364 : 85 2f __ STA P2 
1366 : a9 78 __ LDA #$78
1368 : 85 30 __ STA P3 
136a : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
136d : a9 35 __ LDA #$35
136f : 85 2d __ STA P0 
1371 : a9 08 __ LDA #$08
1373 : 85 2e __ STA P1 
1375 : a9 0a __ LDA #$0a
1377 : 85 2f __ STA P2 
1379 : a9 00 __ LDA #$00
137b : 85 30 __ STA P3 
137d : a9 03 __ LDA #$03
137f : 85 31 __ STA P4 
1381 : a9 07 __ LDA #$07
1383 : 85 33 __ STA P6 
1385 : a9 06 __ LDA #$06
1387 : 85 34 __ STA P7 
1389 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
138c : a9 00 __ LDA #$00
138e : 85 2e __ STA P1 
1390 : 85 31 __ STA P4 
1392 : a9 01 __ LDA #$01
1394 : 85 2f __ STA P2 
1396 : a9 e8 __ LDA #$e8
1398 : 85 30 __ STA P3 
139a : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
139d : a9 36 __ LDA #$36
139f : 85 2d __ STA P0 
13a1 : a9 08 __ LDA #$08
13a3 : 85 2e __ STA P1 
13a5 : a9 0a __ LDA #$0a
13a7 : 85 2f __ STA P2 
13a9 : a9 00 __ LDA #$00
13ab : 85 30 __ STA P3 
13ad : a9 03 __ LDA #$03
13af : 85 31 __ STA P4 
13b1 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
13b4 : a9 40 __ LDA #$40
13b6 : 85 2e __ STA P1 
13b8 : a9 01 __ LDA #$01
13ba : 85 2f __ STA P2 
13bc : a9 e8 __ LDA #$e8
13be : 85 30 __ STA P3 
13c0 : a9 00 __ LDA #$00
13c2 : 85 31 __ STA P4 
13c4 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
13c7 : a9 01 __ LDA #$01
13c9 : 85 2e __ STA P1 
13cb : a9 00 __ LDA #$00
13cd : 85 2f __ STA P2 
13cf : 20 2f 19 JSR $192f ; (vera_spr_flip.s0 + 0)
13d2 : a9 37 __ LDA #$37
13d4 : 85 2d __ STA P0 
13d6 : a9 08 __ LDA #$08
13d8 : 85 2e __ STA P1 
13da : a9 0a __ LDA #$0a
13dc : 85 2f __ STA P2 
13de : a9 00 __ LDA #$00
13e0 : 85 30 __ STA P3 
13e2 : a9 03 __ LDA #$03
13e4 : 85 31 __ STA P4 
13e6 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
13e9 : a9 00 __ LDA #$00
13eb : 85 2e __ STA P1 
13ed : a9 01 __ LDA #$01
13ef : 85 2f __ STA P2 
13f1 : 85 31 __ STA P4 
13f3 : a9 08 __ LDA #$08
13f5 : 85 30 __ STA P3 
13f7 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
13fa : 20 2f 19 JSR $192f ; (vera_spr_flip.s0 + 0)
13fd : a9 38 __ LDA #$38
13ff : 85 2d __ STA P0 
1401 : a9 08 __ LDA #$08
1403 : 85 2e __ STA P1 
1405 : a9 0a __ LDA #$0a
1407 : 85 2f __ STA P2 
1409 : a9 00 __ LDA #$00
140b : 85 30 __ STA P3 
140d : a9 03 __ LDA #$03
140f : 85 31 __ STA P4 
1411 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1414 : a9 40 __ LDA #$40
1416 : 85 2e __ STA P1 
1418 : a9 01 __ LDA #$01
141a : 85 2f __ STA P2 
141c : 85 31 __ STA P4 
141e : a9 08 __ LDA #$08
1420 : 85 30 __ STA P3 
1422 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1425 : a9 01 __ LDA #$01
1427 : 85 2e __ STA P1 
1429 : 20 2f 19 JSR $192f ; (vera_spr_flip.s0 + 0)
142c : a9 00 __ LDA #$00
142e : 85 2d __ STA P0 
1430 : 85 30 __ STA P3 
1432 : 85 33 __ STA P6 
1434 : a9 35 __ LDA #$35
1436 : 85 2e __ STA P1 
1438 : a9 08 __ LDA #$08
143a : 85 34 __ STA P7 
143c : a9 00 __ LDA #$00
143e : 85 31 __ STA P4 
1440 : a9 37 __ LDA #$37
1442 : 85 32 __ STA P5 
1444 : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
1447 : a9 00 __ LDA #$00
1449 : 85 4c __ STA T1 + 0 
144b : 85 4d __ STA T2 + 0 
144d : 85 4e __ STA T2 + 1 
144f : a9 02 __ LDA #$02
1451 : 85 33 __ STA P6 
1453 : a9 05 __ LDA #$05
1455 : 85 34 __ STA P7 
1457 : a9 03 __ LDA #$03
1459 : 85 32 __ STA P5 
145b : 18 __ __ CLC
.l1091:
145c : a9 a8 __ LDA #$a8
145e : 85 2e __ STA P1 
1460 : a9 09 __ LDA #$09
1462 : 85 2f __ STA P2 
1464 : a9 00 __ LDA #$00
1466 : 85 30 __ STA P3 
1468 : a9 03 __ LDA #$03
146a : 85 31 __ STA P4 
146c : a5 4c __ LDA T1 + 0 
146e : 69 39 __ ADC #$39
1470 : 85 2d __ STA P0 
1472 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1475 : a9 20 __ LDA #$20
1477 : 85 2e __ STA P1 
1479 : a9 01 __ LDA #$01
147b : 85 2f __ STA P2 
147d : 38 __ __ SEC
147e : a5 4d __ LDA T2 + 0 
1480 : e9 60 __ SBC #$60
1482 : 85 30 __ STA P3 
1484 : a5 4e __ LDA T2 + 1 
1486 : e9 00 __ SBC #$00
1488 : 85 31 __ STA P4 
148a : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
148d : 18 __ __ CLC
148e : a5 4d __ LDA T2 + 0 
1490 : 69 40 __ ADC #$40
1492 : 85 4d __ STA T2 + 0 
1494 : 90 02 __ BCC $1498 ; (SetUpSprites.s1094 + 0)
.s1093:
1496 : e6 4e __ INC T2 + 1 
.s1094:
1498 : e6 4c __ INC T1 + 0 
149a : a5 4c __ LDA T1 + 0 
149c : c9 07 __ CMP #$07
149e : 90 bc __ BCC $145c ; (SetUpSprites.l1091 + 0)
.s158:
14a0 : a9 40 __ LDA #$40
14a2 : 85 2d __ STA P0 
14a4 : a9 4f __ LDA #$4f
14a6 : 85 2e __ STA P1 
14a8 : a9 00 __ LDA #$00
14aa : 85 30 __ STA P3 
14ac : 85 33 __ STA P6 
14ae : a9 02 __ LDA #$02
14b0 : 85 34 __ STA P7 
14b2 : a9 00 __ LDA #$00
14b4 : 85 31 __ STA P4 
14b6 : a9 3f __ LDA #$3f
14b8 : 85 32 __ STA P5 
14ba : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
14bd : a9 80 __ LDA #$80
14bf : 85 2d __ STA P0 
14c1 : 85 33 __ STA P6 
14c3 : a9 4e __ LDA #$4e
14c5 : 85 2e __ STA P1 
14c7 : a9 00 __ LDA #$00
14c9 : 85 34 __ STA P7 
14cb : a9 00 __ LDA #$00
14cd : 85 31 __ STA P4 
14cf : a9 41 __ LDA #$41
14d1 : 85 32 __ STA P5 
14d3 : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
14d6 : a9 00 __ LDA #$00
14d8 : 85 4b __ STA T0 + 0 
14da : a9 0a __ LDA #$0a
14dc : 85 2f __ STA P2 
14de : a9 02 __ LDA #$02
14e0 : 85 33 __ STA P6 
14e2 : a9 08 __ LDA #$08
14e4 : 85 34 __ STA P7 
.l160:
14e6 : a9 74 __ LDA #$74
14e8 : 85 2e __ STA P1 
14ea : a9 01 __ LDA #$01
14ec : 85 31 __ STA P4 
14ee : 85 32 __ STA P5 
14f0 : 18 __ __ CLC
14f1 : a5 4b __ LDA T0 + 0 
14f3 : 69 4f __ ADC #$4f
14f5 : 85 2d __ STA P0 
14f7 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
14fa : a5 4b __ LDA T0 + 0 
14fc : c9 17 __ CMP #$17
14fe : d0 0d __ BNE $150d ; (SetUpSprites.s288 + 0)
.s163:
1500 : a9 7a __ LDA #$7a
1502 : 85 2e __ STA P1 
1504 : a9 02 __ LDA #$02
1506 : 85 31 __ STA P4 
1508 : 85 32 __ STA P5 
150a : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
.s288:
150d : e6 4b __ INC T0 + 0 
150f : a5 4b __ LDA T0 + 0 
1511 : c9 18 __ CMP #$18
1513 : 90 d1 __ BCC $14e6 ; (SetUpSprites.l160 + 0)
.s162:
1515 : a9 00 __ LDA #$00
1517 : 85 2d __ STA P0 
1519 : 85 31 __ STA P4 
151b : a9 20 __ LDA #$20
151d : 85 30 __ STA P3 
151f : a9 8f __ LDA #$8f
1521 : 85 2e __ STA P1 
1523 : a9 2c __ LDA #$2c
1525 : 85 2f __ STA P2 
1527 : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
152a : a9 20 __ LDA #$20
152c : 85 2d __ STA P0 
152e : a9 00 __ LDA #$00
1530 : 85 31 __ STA P4 
1532 : a9 af __ LDA #$af
1534 : 85 2e __ STA P1 
1536 : a9 2c __ LDA #$2c
1538 : 85 2f __ STA P2 
153a : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
153d : a9 60 __ LDA #$60
153f : 85 2d __ STA P0 
1541 : a9 00 __ LDA #$00
1543 : 85 31 __ STA P4 
1545 : a9 cf __ LDA #$cf
1547 : 85 2e __ STA P1 
1549 : a9 2c __ LDA #$2c
154b : 85 2f __ STA P2 
154d : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
1550 : a9 70 __ LDA #$70
1552 : 85 2d __ STA P0 
1554 : a9 0c __ LDA #$0c
1556 : 85 30 __ STA P3 
1558 : a9 00 __ LDA #$00
155a : 85 31 __ STA P4 
155c : a9 ef __ LDA #$ef
155e : 85 2e __ STA P1 
1560 : a9 2c __ LDA #$2c
1562 : 85 2f __ STA P2 
1564 : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
1567 : a9 80 __ LDA #$80
1569 : 85 2d __ STA P0 
156b : a9 20 __ LDA #$20
156d : 85 30 __ STA P3 
156f : a9 00 __ LDA #$00
1571 : 85 31 __ STA P4 
1573 : a9 80 __ LDA #$80
1575 : 85 2e __ STA P1 
1577 : a9 41 __ LDA #$41
1579 : 85 2f __ STA P2 
157b : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
157e : a9 90 __ LDA #$90
1580 : 85 2d __ STA P0 
1582 : a9 10 __ LDA #$10
1584 : 85 30 __ STA P3 
1586 : a9 00 __ LDA #$00
1588 : 85 31 __ STA P4 
158a : a9 a0 __ LDA #$a0
158c : 85 2e __ STA P1 
158e : a9 41 __ LDA #$41
1590 : 85 2f __ STA P2 
1592 : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
1595 : a9 a0 __ LDA #$a0
1597 : 85 2d __ STA P0 
1599 : a9 1a __ LDA #$1a
159b : 85 30 __ STA P3 
159d : a9 00 __ LDA #$00
159f : 85 31 __ STA P4 
15a1 : a9 b0 __ LDA #$b0
15a3 : 85 2e __ STA P1 
15a5 : a9 41 __ LDA #$41
15a7 : 85 2f __ STA P2 
15a9 : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
15ac : a9 b0 __ LDA #$b0
15ae : 85 2d __ STA P0 
15b0 : a9 1c __ LDA #$1c
15b2 : 85 30 __ STA P3 
15b4 : a9 00 __ LDA #$00
15b6 : 85 31 __ STA P4 
15b8 : a9 ca __ LDA #$ca
15ba : 85 2e __ STA P1 
15bc : a9 41 __ LDA #$41
15be : 85 2f __ STA P2 
15c0 : 20 6c 19 JSR $196c ; (vera_pal_putn.s0 + 0)
15c3 : a9 00 __ LDA #$00
15c5 : 85 2d __ STA P0 
15c7 : 85 30 __ STA P3 
15c9 : 85 33 __ STA P6 
15cb : a9 41 __ LDA #$41
15cd : 85 2e __ STA P1 
15cf : a9 01 __ LDA #$01
15d1 : 85 2f __ STA P2 
15d3 : a9 04 __ LDA #$04
15d5 : 85 34 __ STA P7 
15d7 : a9 e6 __ LDA #$e6
15d9 : 85 31 __ STA P4 
15db : a9 41 __ LDA #$41
15dd : 85 32 __ STA P5 
15df : 20 37 18 JSR $1837 ; (vram_putn.s0 + 0)
15e2 : a9 03 __ LDA #$03
15e4 : 85 32 __ STA P5 
15e6 : 85 34 __ STA P7 
15e8 : a9 08 __ LDA #$08
15ea : 85 33 __ STA P6 
15ec : a9 40 __ LDA #$40
15ee : 85 35 __ STA P8 
15f0 : a9 57 __ LDA #$57
15f2 : 85 36 __ STA P9 
15f4 : a9 01 __ LDA #$01
15f6 : 85 37 __ STA P10 
15f8 : a9 00 __ LDA #$00
15fa : 85 38 __ STA P11 
15fc : 8d fa 9e STA $9efa ; (sstack + 0)
15ff : a9 20 __ LDA #$20
1601 : 8d fb 9e STA $9efb ; (sstack + 1)
1604 : a9 98 __ LDA #$98
1606 : 85 30 __ STA P3 
1608 : a9 1a __ LDA #$1a
160a : 85 31 __ STA P4 
160c : 20 b5 19 JSR $19b5 ; (LoadSprite.s0 + 0)
160f : a9 03 __ LDA #$03
1611 : 85 2d __ STA P0 
1613 : 85 31 __ STA P4 
1615 : a9 ba __ LDA #$ba
1617 : 85 2e __ STA P1 
1619 : a9 0a __ LDA #$0a
161b : 85 2f __ STA P2 
161d : a9 00 __ LDA #$00
161f : 85 30 __ STA P3 
1621 : a9 07 __ LDA #$07
1623 : 85 33 __ STA P6 
1625 : a9 0b __ LDA #$0b
1627 : 85 34 __ STA P7 
1629 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
162c : a9 08 __ LDA #$08
162e : 85 2e __ STA P1 
1630 : 85 30 __ STA P3 
1632 : a9 00 __ LDA #$00
1634 : 85 2f __ STA P2 
1636 : 85 31 __ STA P4 
1638 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
163b : a9 04 __ LDA #$04
163d : 85 2d __ STA P0 
163f : a9 fa __ LDA #$fa
1641 : 85 2e __ STA P1 
1643 : a9 0a __ LDA #$0a
1645 : 85 2f __ STA P2 
1647 : a9 00 __ LDA #$00
1649 : 85 30 __ STA P3 
164b : a9 03 __ LDA #$03
164d : 85 31 __ STA P4 
164f : 85 33 __ STA P6 
1651 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1654 : a9 48 __ LDA #$48
1656 : 85 2e __ STA P1 
1658 : a9 00 __ LDA #$00
165a : 85 2f __ STA P2 
165c : 85 31 __ STA P4 
165e : a9 08 __ LDA #$08
1660 : 85 30 __ STA P3 
1662 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1665 : a9 05 __ LDA #$05
1667 : 85 2d __ STA P0 
1669 : a9 3a __ LDA #$3a
166b : 85 2e __ STA P1 
166d : a9 0b __ LDA #$0b
166f : 85 2f __ STA P2 
1671 : a9 00 __ LDA #$00
1673 : 85 30 __ STA P3 
1675 : a9 03 __ LDA #$03
1677 : 85 31 __ STA P4 
1679 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
167c : a9 08 __ LDA #$08
167e : 85 2e __ STA P1 
1680 : a9 00 __ LDA #$00
1682 : 85 2f __ STA P2 
1684 : 85 31 __ STA P4 
1686 : a9 48 __ LDA #$48
1688 : 85 30 __ STA P3 
168a : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
168d : a9 06 __ LDA #$06
168f : 85 2d __ STA P0 
1691 : a9 7a __ LDA #$7a
1693 : 85 2e __ STA P1 
1695 : a9 0b __ LDA #$0b
1697 : 85 2f __ STA P2 
1699 : a9 00 __ LDA #$00
169b : 85 30 __ STA P3 
169d : a9 03 __ LDA #$03
169f : 85 31 __ STA P4 
16a1 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
16a4 : a9 48 __ LDA #$48
16a6 : 85 2e __ STA P1 
16a8 : 85 30 __ STA P3 
16aa : a9 00 __ LDA #$00
16ac : 85 2f __ STA P2 
16ae : 85 31 __ STA P4 
16b0 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
16b3 : a9 07 __ LDA #$07
16b5 : 85 2d __ STA P0 
16b7 : 85 33 __ STA P6 
16b9 : a9 ba __ LDA #$ba
16bb : 85 2e __ STA P1 
16bd : a9 0a __ LDA #$0a
16bf : 85 2f __ STA P2 
16c1 : a9 00 __ LDA #$00
16c3 : 85 30 __ STA P3 
16c5 : a9 03 __ LDA #$03
16c7 : 85 31 __ STA P4 
16c9 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
16cc : a9 f8 __ LDA #$f8
16ce : 85 2e __ STA P1 
16d0 : a9 01 __ LDA #$01
16d2 : 85 2f __ STA P2 
16d4 : a9 08 __ LDA #$08
16d6 : 85 30 __ STA P3 
16d8 : a9 00 __ LDA #$00
16da : 85 31 __ STA P4 
16dc : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
16df : a9 08 __ LDA #$08
16e1 : 85 2d __ STA P0 
16e3 : a9 fa __ LDA #$fa
16e5 : 85 2e __ STA P1 
16e7 : a9 0a __ LDA #$0a
16e9 : 85 2f __ STA P2 
16eb : a9 00 __ LDA #$00
16ed : 85 30 __ STA P3 
16ef : a9 03 __ LDA #$03
16f1 : 85 31 __ STA P4 
16f3 : 85 33 __ STA P6 
16f5 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
16f8 : a9 38 __ LDA #$38
16fa : 85 2e __ STA P1 
16fc : a9 02 __ LDA #$02
16fe : 85 2f __ STA P2 
1700 : a9 08 __ LDA #$08
1702 : 85 30 __ STA P3 
1704 : a9 00 __ LDA #$00
1706 : 85 31 __ STA P4 
1708 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
170b : a9 09 __ LDA #$09
170d : 85 2d __ STA P0 
170f : a9 3a __ LDA #$3a
1711 : 85 2e __ STA P1 
1713 : a9 0b __ LDA #$0b
1715 : 85 2f __ STA P2 
1717 : a9 00 __ LDA #$00
1719 : 85 30 __ STA P3 
171b : a9 03 __ LDA #$03
171d : 85 31 __ STA P4 
171f : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
1722 : a9 f8 __ LDA #$f8
1724 : 85 2e __ STA P1 
1726 : a9 01 __ LDA #$01
1728 : 85 2f __ STA P2 
172a : a9 48 __ LDA #$48
172c : 85 30 __ STA P3 
172e : a9 00 __ LDA #$00
1730 : 85 31 __ STA P4 
1732 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1735 : a9 0a __ LDA #$0a
1737 : 85 2d __ STA P0 
1739 : a9 7a __ LDA #$7a
173b : 85 2e __ STA P1 
173d : a9 0b __ LDA #$0b
173f : 85 2f __ STA P2 
1741 : a9 00 __ LDA #$00
1743 : 85 30 __ STA P3 
1745 : a9 03 __ LDA #$03
1747 : 85 31 __ STA P4 
1749 : 20 99 18 JSR $1899 ; (vera_spr_set.s0 + 0)
174c : a9 38 __ LDA #$38
174e : 85 2e __ STA P1 
1750 : a9 02 __ LDA #$02
1752 : 85 2f __ STA P2 
1754 : a9 48 __ LDA #$48
1756 : 85 30 __ STA P3 
1758 : a9 00 __ LDA #$00
175a : 85 31 __ STA P4 
175c : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
175f : ad 29 9f LDA $9f29 
1762 : 09 70 __ ORA #$70
1764 : 8d 29 9f STA $9f29 
.s1001:
1767 : 60 __ __ RTS
.s1031:
1768 : c9 34 __ CMP #$34
176a : 90 05 __ BCC $1771 ; (SetUpSprites.s1030 + 0)
.s89:
176c : a9 09 __ LDA #$09
176e : 4c ec 0f JMP $0fec ; (SetUpSprites.s279 + 0)
.s1030:
1771 : a9 2c __ LDA #$2c
1773 : c5 25 __ CMP WORK + 2 
1775 : 90 38 __ BCC $17af ; (SetUpSprites.s1023 + 0)
.s1029:
1777 : a5 4d __ LDA T2 + 0 
1779 : c9 08 __ CMP #$08
177b : 90 06 __ BCC $1783 ; (SetUpSprites.s95 + 0)
.s1028:
177d : a9 48 __ LDA #$48
177f : c5 4d __ CMP T2 + 0 
1781 : b0 05 __ BCS $1788 ; (SetUpSprites.s1027 + 0)
.s95:
1783 : a9 00 __ LDA #$00
1785 : 4c ec 0f JMP $0fec ; (SetUpSprites.s279 + 0)
.s1027:
1788 : a5 4d __ LDA T2 + 0 
178a : c9 0c __ CMP #$0c
178c : 90 06 __ BCC $1794 ; (SetUpSprites.s99 + 0)
.s1026:
178e : a9 44 __ LDA #$44
1790 : c5 4d __ CMP T2 + 0 
1792 : b0 05 __ BCS $1799 ; (SetUpSprites.s1025 + 0)
.s99:
1794 : a9 01 __ LDA #$01
1796 : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
.s1025:
1799 : a5 4d __ LDA T2 + 0 
179b : c9 18 __ CMP #$18
179d : 90 06 __ BCC $17a5 ; (SetUpSprites.s103 + 0)
.s1024:
179f : a9 38 __ LDA #$38
17a1 : c5 4d __ CMP T2 + 0 
17a3 : b0 05 __ BCS $17aa ; (SetUpSprites.s104 + 0)
.s103:
17a5 : a9 02 __ LDA #$02
17a7 : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
.s104:
17aa : a9 03 __ LDA #$03
17ac : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
.s1023:
17af : a9 2f __ LDA #$2f
17b1 : c5 25 __ CMP WORK + 2 
17b3 : a5 4d __ LDA T2 + 0 
17b5 : 90 36 __ BCC $17ed ; (SetUpSprites.s1016 + 0)
.s1022:
17b7 : c9 08 __ CMP #$08
17b9 : 90 06 __ BCC $17c1 ; (SetUpSprites.s111 + 0)
.s1021:
17bb : a9 48 __ LDA #$48
17bd : c5 4d __ CMP T2 + 0 
17bf : b0 05 __ BCS $17c6 ; (SetUpSprites.s1020 + 0)
.s111:
17c1 : a9 05 __ LDA #$05
17c3 : 4c ec 0f JMP $0fec ; (SetUpSprites.s279 + 0)
.s1020:
17c6 : a5 4d __ LDA T2 + 0 
17c8 : c9 0c __ CMP #$0c
17ca : 90 06 __ BCC $17d2 ; (SetUpSprites.s115 + 0)
.s1019:
17cc : a9 44 __ LDA #$44
17ce : c5 4d __ CMP T2 + 0 
17d0 : b0 05 __ BCS $17d7 ; (SetUpSprites.s1018 + 0)
.s115:
17d2 : a9 06 __ LDA #$06
17d4 : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
.s1018:
17d7 : a5 4d __ LDA T2 + 0 
17d9 : c9 18 __ CMP #$18
17db : 90 06 __ BCC $17e3 ; (SetUpSprites.s119 + 0)
.s1017:
17dd : a9 38 __ LDA #$38
17df : c5 4d __ CMP T2 + 0 
17e1 : b0 05 __ BCS $17e8 ; (SetUpSprites.s120 + 0)
.s119:
17e3 : a9 07 __ LDA #$07
17e5 : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
.s120:
17e8 : a9 08 __ LDA #$08
17ea : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
.s1016:
17ed : c9 08 __ CMP #$08
17ef : 90 06 __ BCC $17f7 ; (SetUpSprites.s123 + 0)
.s1015:
17f1 : a9 48 __ LDA #$48
17f3 : c5 4d __ CMP T2 + 0 
17f5 : b0 05 __ BCS $17fc ; (SetUpSprites.s1004 + 0)
.s123:
17f7 : a9 0c __ LDA #$0c
17f9 : 4c ec 0f JMP $0fec ; (SetUpSprites.s279 + 0)
.s1004:
17fc : a5 4d __ LDA T2 + 0 
17fe : c9 0c __ CMP #$0c
1800 : 90 06 __ BCC $1808 ; (SetUpSprites.s127 + 0)
.s1003:
1802 : a9 44 __ LDA #$44
1804 : c5 4d __ CMP T2 + 0 
1806 : b0 05 __ BCS $180d ; (SetUpSprites.s131 + 0)
.s127:
1808 : a9 0d __ LDA #$0d
180a : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
.s131:
180d : a9 0e __ LDA #$0e
180f : 4c 82 0f JMP $0f82 ; (SetUpSprites.s296 + 0)
--------------------------------------------------------------------
VolAddr:
2545 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
IndAddr:
2549 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1812 : 46 2d __ LSR P0 ; (bank + 0)
1814 : a9 00 __ LDA #$00
1816 : 6a __ __ ROR
1817 : 85 3b __ STA ACCU + 0 
1819 : a5 2f __ LDA P2 ; (mem + 1)
181b : 29 f8 __ AND #$f8
181d : 4a __ __ LSR
181e : 05 3b __ ORA ACCU + 0 
1820 : 85 3b __ STA ACCU + 0 
1822 : a5 30 __ LDA P3 ; (height + 0)
1824 : 0a __ __ ASL
1825 : 05 3b __ ORA ACCU + 0 
1827 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1829 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
182a : 46 2d __ LSR P0 ; (bank + 0)
182c : a9 00 __ LDA #$00
182e : 6a __ __ ROR
182f : 85 3b __ STA ACCU + 0 
1831 : a5 2f __ LDA P2 ; (mem + 1)
1833 : 4a __ __ LSR
1834 : 05 3b __ ORA ACCU + 0 
.s1001:
1836 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1837 : ad 25 9f LDA $9f25 
183a : 29 fe __ AND #$fe
183c : 8d 25 9f STA $9f25 
183f : a5 2d __ LDA P0 ; (addr + 0)
1841 : 8d 20 9f STA $9f20 
1844 : a5 2e __ LDA P1 ; (addr + 1)
1846 : 8d 21 9f STA $9f21 
1849 : a5 2f __ LDA P2 ; (addr + 2)
184b : 29 01 __ AND #$01
184d : 09 10 __ ORA #$10
184f : 8d 22 9f STA $9f22 
1852 : a5 33 __ LDA P6 ; (size + 0)
1854 : 05 34 __ ORA P7 ; (size + 1)
1856 : f0 19 __ BEQ $1871 ; (vram_putn.s1001 + 0)
.s6:
1858 : a0 00 __ LDY #$00
185a : a6 33 __ LDX P6 ; (size + 0)
185c : f0 02 __ BEQ $1860 ; (vram_putn.l1002 + 0)
.s1005:
185e : e6 34 __ INC P7 ; (size + 1)
.l1002:
1860 : b1 31 __ LDA (P4),y ; (data + 0)
1862 : 8d 23 9f STA $9f23 
1865 : c8 __ __ INY
1866 : d0 02 __ BNE $186a ; (vram_putn.s1009 + 0)
.s1008:
1868 : e6 32 __ INC P5 ; (data + 1)
.s1009:
186a : ca __ __ DEX
186b : d0 f3 __ BNE $1860 ; (vram_putn.l1002 + 0)
.s1004:
186d : c6 34 __ DEC P7 ; (size + 1)
186f : d0 ef __ BNE $1860 ; (vram_putn.l1002 + 0)
.s1001:
1871 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
254d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
255d : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
256d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
257d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
258d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
259d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
25ad : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
25bd : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
25cd : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
25dd : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
25ed : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
25fd : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
260d : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
261d : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
262d : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
263d : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
264d : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
265d : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
266d : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
267d : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
268d : __ __ __ BYT 55 55 55 55 55 55 55 55 66 66 66 66 33 33 33 33 : UUUUUUUUffff3333
269d : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
26ad : __ __ __ BYT 33 33 33 33 33 33 33 33 77 77 77 77 77 77 77 77 : 33333333wwwwwwww
26bd : __ __ __ BYT 77 77 77 77 77 77 77 77 00 00 00 00 00 00 00 00 : wwwwwwww........
26cd : __ __ __ BYT 05 00 00 50 00 08 80 00 00 89 98 00 08 95 59 80 : ...P..........Y.
26dd : __ __ __ BYT 08 95 59 80 00 89 98 05 00 08 80 00 05 00 00 00 : ..Y.............
26ed : __ __ __ BYT 13 11 11 11 11 11 11 31 11 18 81 11 11 89 98 11 : .......1........
26fd : __ __ __ BYT 11 89 98 11 11 18 81 13 11 11 11 11 13 11 11 11 : ................
270d : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 18 81 11 : ................
271d : __ __ __ BYT 11 18 81 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
272d : __ __ __ BYT aa aa aa aa ab bb bb bb ab cc cc cc ab cc cc cc : ................
273d : __ __ __ BYT ab cc dd dd ab cc dd dd ab cc dd ee ab cc dd ef : ................
274d : __ __ __ BYT aa aa aa aa bb bb bb bb cc cc cc cc cc cc cc cc : ................
275d : __ __ __ BYT dd dd dd dd dd dd dd dd ee ee ee ee ff ff ff ff : ................
276d : __ __ __ BYT aa aa aa aa bb bb bb ba cc cc cc ba cc cc cc ba : ................
277d : __ __ __ BYT dd dd cc ba dd dd cc ba ee dd cc ba fe dd cc ba : ................
278d : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
279d : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
27ad : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27bd : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
27cd : __ __ __ BYT ab cc dd ef ab cc dd ee ab cc dd dd ab cc dd dd : ................
27dd : __ __ __ BYT ab cc cc cc ab cc cc cc ab bb bb bb aa aa aa aa : ................
27ed : __ __ __ BYT ff ff ff ff ee ee ee ee dd dd dd dd dd dd dd dd : ................
27fd : __ __ __ BYT cc cc cc cc cc cc cc cc bb bb bb bb aa aa aa aa : ................
280d : __ __ __ BYT fe dd cc ba ee dd cc ba dd dd cc ba dd dd cc ba : ................
281d : __ __ __ BYT cc cc cc ba cc cc cc ba bb bb bb ba aa aa aa aa : ................
282d : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
283d : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
284d : __ __ __ BYT 22 22 22 22 22 22 33 22 22 23 22 22 22 44 44 22 : """"""3""#"""DD"
285d : __ __ __ BYT 24 84 84 82 22 44 44 22 23 23 32 32 22 22 22 22 : $..."DD"##22""""
--------------------------------------------------------------------
rand:
.s0:
1872 : ad 6e 28 LDA $286e ; (seed + 1)
1875 : 4a __ __ LSR
1876 : ad 6d 28 LDA $286d ; (seed + 0)
1879 : 6a __ __ ROR
187a : aa __ __ TAX
187b : a9 00 __ LDA #$00
187d : 6a __ __ ROR
187e : 4d 6d 28 EOR $286d ; (seed + 0)
1881 : 85 3b __ STA ACCU + 0 
1883 : 8a __ __ TXA
1884 : 4d 6e 28 EOR $286e ; (seed + 1)
1887 : 85 3c __ STA ACCU + 1 
1889 : 4a __ __ LSR
188a : 45 3b __ EOR ACCU + 0 
188c : 8d 6d 28 STA $286d ; (seed + 0)
188f : 85 3b __ STA ACCU + 0 
1891 : 45 3c __ EOR ACCU + 1 
1893 : 8d 6e 28 STA $286e ; (seed + 1)
1896 : 85 3c __ STA ACCU + 1 
.s1001:
1898 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
286d : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
286f : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
287f : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
288f : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
289f : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
28af : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
28bf : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
28cf : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
28df : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
28ef : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
28ff : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
290f : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
291f : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
292f : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
293f : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
294f : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
295f : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
296f : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
297f : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
298f : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
299f : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
29af : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
29bf : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
29cf : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
29df : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
29ef : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
29ff : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
2a0f : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
2a1f : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
2a2f : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
2a3f : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
2a4f : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
2a5f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
2a6f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a7f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a8f : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
2a9f : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
2aaf : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2abf : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2acf : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
2adf : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
2aef : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
2aff : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
2b0f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b1f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b2f : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
2b3f : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
2b4f : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
2b5f : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
2b6f : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
2b7f : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
2b8f : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
2b9f : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2baf : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2bbf : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2bcf : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2bdf : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2bef : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
2bff : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
2c0f : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
2c1f : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
2c2f : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
2c3f : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
2c4f : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
2c5f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
1899 : ad 25 9f LDA $9f25 
189c : 29 fe __ AND #$fe
189e : 8d 25 9f STA $9f25 
18a1 : a5 2d __ LDA P0 ; (spr + 0)
18a3 : 0a __ __ ASL
18a4 : 0a __ __ ASL
18a5 : 85 3b __ STA ACCU + 0 
18a7 : a9 3f __ LDA #$3f
18a9 : 2a __ __ ROL
18aa : 06 3b __ ASL ACCU + 0 
18ac : 2a __ __ ROL
18ad : 8d 21 9f STA $9f21 
18b0 : a5 3b __ LDA ACCU + 0 
18b2 : 8d 20 9f STA $9f20 
18b5 : a9 11 __ LDA #$11
18b7 : 8d 22 9f STA $9f22 
18ba : a5 30 __ LDA P3 ; (mode8 + 0)
18bc : f0 02 __ BEQ $18c0 ; (vera_spr_set.s11 + 0)
.s9:
18be : a9 80 __ LDA #$80
.s11:
18c0 : 05 2f __ ORA P2 ; (addr32 + 1)
18c2 : a6 2e __ LDX P1 ; (addr32 + 0)
18c4 : 8e 23 9f STX $9f23 
18c7 : 8d 23 9f STA $9f23 
18ca : a9 00 __ LDA #$00
18cc : 8d 23 9f STA $9f23 
18cf : 8d 23 9f STA $9f23 
18d2 : 8d 23 9f STA $9f23 
18d5 : 8d 23 9f STA $9f23 
18d8 : a5 33 __ LDA P6 ; (z + 0)
18da : 0a __ __ ASL
18db : 0a __ __ ASL
18dc : 8d 23 9f STA $9f23 
18df : a5 32 __ LDA P5 ; (h + 0)
18e1 : 4a __ __ LSR
18e2 : 6a __ __ ROR
18e3 : 29 80 __ AND #$80
18e5 : 6a __ __ ROR
18e6 : 85 3b __ STA ACCU + 0 
18e8 : a5 31 __ LDA P4 ; (w + 0)
18ea : 0a __ __ ASL
18eb : 0a __ __ ASL
18ec : 0a __ __ ASL
18ed : 0a __ __ ASL
18ee : 05 3b __ ORA ACCU + 0 
18f0 : 05 34 __ ORA P7 ; (pal + 0)
18f2 : 8d 23 9f STA $9f23 
.s1001:
18f5 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
18f6 : ad 25 9f LDA $9f25 
18f9 : 29 fe __ AND #$fe
18fb : 8d 25 9f STA $9f25 
18fe : a5 2d __ LDA P0 ; (spr + 0)
1900 : 0a __ __ ASL
1901 : 0a __ __ ASL
1902 : 85 3b __ STA ACCU + 0 
1904 : a9 3f __ LDA #$3f
1906 : 2a __ __ ROL
1907 : 06 3b __ ASL ACCU + 0 
1909 : 2a __ __ ROL
190a : aa __ __ TAX
190b : a5 3b __ LDA ACCU + 0 
190d : 09 02 __ ORA #$02
190f : 8d 20 9f STA $9f20 
1912 : 8e 21 9f STX $9f21 
1915 : a9 11 __ LDA #$11
1917 : 8d 22 9f STA $9f22 
191a : a5 2e __ LDA P1 ; (x + 0)
191c : 8d 23 9f STA $9f23 
191f : a5 2f __ LDA P2 ; (x + 1)
1921 : 8d 23 9f STA $9f23 
1924 : a5 30 __ LDA P3 ; (y + 0)
1926 : 8d 23 9f STA $9f23 
1929 : a5 31 __ LDA P4 ; (y + 1)
192b : 8d 23 9f STA $9f23 
.s1001:
192e : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d10 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2d20 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2d30 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2d40 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2d50 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2d60 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2d70 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2d80 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2d90 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2da0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2db0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2dc0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2dd0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
2de0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
2df0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2e00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2e10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2e20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2e30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2e40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2e50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2e60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2e70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2e80 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2e90 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
2ea0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
2eb0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
2ec0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
2ed0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
2ee0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
2ef0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2f00 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2f10 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2f20 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2f30 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2f40 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2f50 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2f60 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2f70 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2f80 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2f90 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
2fa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
2fb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
2fc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
2fd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
2fe0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
2ff0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_spr_flip:
.s0:
192f : ad 25 9f LDA $9f25 
1932 : 29 fe __ AND #$fe
1934 : 8d 25 9f STA $9f25 
1937 : a5 2d __ LDA P0 ; (spr + 0)
1939 : 0a __ __ ASL
193a : 0a __ __ ASL
193b : 85 3b __ STA ACCU + 0 
193d : a9 3f __ LDA #$3f
193f : 2a __ __ ROL
1940 : 06 3b __ ASL ACCU + 0 
1942 : 2a __ __ ROL
1943 : aa __ __ TAX
1944 : a5 3b __ LDA ACCU + 0 
1946 : 09 06 __ ORA #$06
1948 : 8d 20 9f STA $9f20 
194b : 8e 21 9f STX $9f21 
194e : a9 01 __ LDA #$01
1950 : 8d 22 9f STA $9f22 
1953 : ad 23 9f LDA $9f23 
1956 : 29 fc __ AND #$fc
1958 : a8 __ __ TAY
1959 : a5 2e __ LDA P1 ; (fliph + 0)
195b : f0 01 __ BEQ $195e ; (vera_spr_flip.s14 + 0)
.s6:
195d : c8 __ __ INY
.s14:
195e : a5 2f __ LDA P2 ; (flipv + 0)
1960 : f0 05 __ BEQ $1967 ; (vera_spr_flip.s11 + 0)
.s9:
1962 : 98 __ __ TYA
1963 : 09 02 __ ORA #$02
1965 : d0 01 __ BNE $1968 ; (vera_spr_flip.s1002 + 0)
.s11:
1967 : 98 __ __ TYA
.s1002:
1968 : 8d 23 9f STA $9f23 
.s1001:
196b : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
196c : ad 25 9f LDA $9f25 
196f : 29 fe __ AND #$fe
1971 : 8d 25 9f STA $9f25 
1974 : a5 2d __ LDA P0 ; (index + 0)
1976 : 0a __ __ ASL
1977 : 8d 20 9f STA $9f20 
197a : a9 7d __ LDA #$7d
197c : 2a __ __ ROL
197d : 8d 21 9f STA $9f21 
1980 : a9 11 __ LDA #$11
1982 : 8d 22 9f STA $9f22 
1985 : a5 30 __ LDA P3 ; (size + 0)
1987 : 05 31 __ ORA P4 ; (size + 1)
1989 : f0 29 __ BEQ $19b4 ; (vera_pal_putn.s1001 + 0)
.s6:
198b : a6 30 __ LDX P3 ; (size + 0)
198d : f0 02 __ BEQ $1991 ; (vera_pal_putn.l3 + 0)
.s1003:
198f : e6 31 __ INC P4 ; (size + 1)
.l3:
1991 : a0 01 __ LDY #$01
1993 : b1 2e __ LDA (P1),y ; (color + 0)
1995 : 85 3c __ STA ACCU + 1 
1997 : 88 __ __ DEY
1998 : b1 2e __ LDA (P1),y ; (color + 0)
199a : 8d 23 9f STA $9f23 
199d : a5 3c __ LDA ACCU + 1 
199f : 8d 23 9f STA $9f23 
19a2 : 18 __ __ CLC
19a3 : a5 2e __ LDA P1 ; (color + 0)
19a5 : 69 02 __ ADC #$02
19a7 : 85 2e __ STA P1 ; (color + 0)
19a9 : 90 02 __ BCC $19ad ; (vera_pal_putn.s1007 + 0)
.s1006:
19ab : e6 2f __ INC P2 ; (color + 1)
.s1007:
19ad : ca __ __ DEX
19ae : d0 e1 __ BNE $1991 ; (vera_pal_putn.l3 + 0)
.s1002:
19b0 : c6 31 __ DEC P4 ; (size + 1)
19b2 : d0 dd __ BNE $1991 ; (vera_pal_putn.l3 + 0)
.s1001:
19b4 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2c6f : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2c7f : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
3000 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3010 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3020 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3030 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3040 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3050 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3060 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3070 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3080 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3090 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
30a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
30b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
30c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
30d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
30e0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
30f0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
3100 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3110 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3120 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3130 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3140 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3150 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3160 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3170 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3180 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
3190 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
31a0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
31b0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
31c0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
31d0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
31e0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
31f0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
3200 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
3210 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
3220 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
3230 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
3240 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
3250 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
3260 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
3270 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
3280 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
3290 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
32a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
32b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
32c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
32d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
32e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
32f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
3300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
3310 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
3330 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
3340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
3350 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
3360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3370 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
3380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3390 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
33a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
33b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
33c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
33d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
33e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
33f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3400 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
3410 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3420 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
3430 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
3440 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
3450 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
3460 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3470 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
3480 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3490 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
34a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
34b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
34c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
34d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
34e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
34f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3500 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
3510 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3520 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3530 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
3540 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3550 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
3560 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3570 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
3580 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3590 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
35a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
35b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
35c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
35d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
35e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
35f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3600 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
3610 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3620 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
3630 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
3640 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
3650 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
3660 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3670 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
3680 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3690 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
36a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
36b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
36c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
36d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
36e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
36f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
3700 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3710 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3720 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3730 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3740 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3750 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3760 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3770 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3780 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3790 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
37a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
37b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
37c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
37d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
37e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
37f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3800 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3810 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3820 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3830 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3840 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3850 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3860 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3870 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3880 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3890 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
38a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
38b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
38c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
38d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
38e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
38f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3900 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3910 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3920 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3930 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3940 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3950 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3960 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3970 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3980 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3990 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
39a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
39b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
39c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
39d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
39e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
39f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3a00 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a10 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a20 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a30 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a40 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a50 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a60 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a70 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a80 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3a90 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3aa0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3ab0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3ac0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3ad0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3ae0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3af0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3b00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3b10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3b20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3b30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3b40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3b50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3b60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3b70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3b80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3b90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3ba0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3bb0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3bc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3bd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3be0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3bf0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3c00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3c10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3c20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3c30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3c40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3c50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3c60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3c70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3c80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3c90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3ca0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3cb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3cc0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3cd0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3ce0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3cf0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3d00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3d10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3d20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3d30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3d40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3d50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3d60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3d70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3d80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3d90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3da0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3db0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3dc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3dd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3de0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3df0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3e00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3e10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3e20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3e30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3e40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3e50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3e60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3e70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3e80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3e90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3ea0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3eb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3ec0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3ed0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3ee0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3ef0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
WavyHead:
3f00 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
3f10 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3f20 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3f30 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3f40 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3f50 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3f60 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3f70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3f80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3f90 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3fa0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3fb0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3fc0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3fd0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3fe0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3ff0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4000 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4010 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4020 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4030 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4040 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4050 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4060 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4070 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4080 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4090 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
40a0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
40b0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
40c0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
40d0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
40e0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
40f0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
4100 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
4110 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
4120 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
4130 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
4140 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
4150 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
4160 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
4170 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
BGPal:
2c8f : __ __ __ BYT 24 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : $.......&.....f.
2c9f : __ __ __ BYT 9f 0b ef 0e 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 : ......m.M.).+.-.
--------------------------------------------------------------------
ButtonStageMax:
2caf : __ __ __ BYT f4 04 e4 04 d4 04 c4 04 b3 03 a3 03 93 03 83 03 : ................
2cbf : __ __ __ BYT 72 02 62 02 52 02 41 01 31 01 21 01 10 00 00 00 : r.b.R.A.1.!.....
--------------------------------------------------------------------
CharBoxPalette:
2ccf : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 00 00 00 00 : ..m.M.).+.-.....
2cdf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavyPal:
2cef : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
4180 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
4190 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
41a0 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
41b0 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
41c0 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
CoderPal:
41ca : __ __ __ BYT 00 00 00 00 ff 0f dd 0d b2 02 d4 04 e5 05 fb 00 : ................
41da : __ __ __ BYT bf 00 10 0c 22 0f 1b 01 00 00 00 00             : ....".......
--------------------------------------------------------------------
EyeTri:
41e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
4206 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4216 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
4226 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4236 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4246 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4256 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4266 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4276 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4286 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4296 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
42a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
42c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
42e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42f6 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
4306 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4316 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4326 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4336 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4346 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4356 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4366 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4376 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4386 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4396 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
43a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43b6 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
43c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43d6 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
43e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
43f6 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
4406 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
4416 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
4426 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4436 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
4446 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4456 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4466 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4476 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4486 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4496 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
44a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
44b6 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
44c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
44d6 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
44e6 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
44f6 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
4506 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4516 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
4526 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4536 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
4546 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4556 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4566 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4576 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4586 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4596 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
45a6 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
45b6 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
45c6 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
45d6 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
19b5 : a5 30 __ LDA P3 ; (name + 0)
19b7 : 85 2d __ STA P0 
19b9 : a5 31 __ LDA P4 ; (name + 1)
19bb : 85 2e __ STA P1 
19bd : 20 32 1a JSR $1a32 ; (krnio_setnam.s0 + 0)
19c0 : a5 32 __ LDA P5 ; (fnum + 0)
19c2 : 85 2d __ STA P0 
19c4 : a5 33 __ LDA P6 ; (device + 0)
19c6 : 85 2e __ STA P1 
19c8 : a5 34 __ LDA P7 ; (channel + 0)
19ca : 85 2f __ STA P2 
19cc : 20 48 1a JSR $1a48 ; (krnio_open.s0 + 0)
19cf : a5 32 __ LDA P5 ; (fnum + 0)
19d1 : 20 70 1a JSR $1a70 ; (krnio_chkin.s1000 + 0)
19d4 : 20 82 1a JSR $1a82 ; (krnio_chrin.s0 + 0)
19d7 : 20 82 1a JSR $1a82 ; (krnio_chrin.s0 + 0)
19da : ad fb 9e LDA $9efb ; (sstack + 1)
19dd : 85 48 __ STA T0 + 1 
19df : ad fa 9e LDA $9efa ; (sstack + 0)
19e2 : 85 47 __ STA T0 + 0 
19e4 : 05 48 __ ORA T0 + 1 
19e6 : f0 42 __ BEQ $1a2a ; (LoadSprite.s4 + 0)
.s8:
19e8 : a9 00 __ LDA #$00
19ea : 85 49 __ STA T2 + 0 
19ec : 85 4a __ STA T2 + 1 
.l2:
19ee : 20 82 1a JSR $1a82 ; (krnio_chrin.s0 + 0)
19f1 : ad 25 9f LDA $9f25 
19f4 : 29 fe __ AND #$fe
19f6 : 8d 25 9f STA $9f25 
19f9 : 18 __ __ CLC
19fa : a5 49 __ LDA T2 + 0 
19fc : 65 35 __ ADC P8 ; (Addr + 0)
19fe : 8d 20 9f STA $9f20 
1a01 : a5 4a __ LDA T2 + 1 
1a03 : 65 36 __ ADC P9 ; (Addr + 1)
1a05 : 8d 21 9f STA $9f21 
1a08 : a9 00 __ LDA #$00
1a0a : 65 37 __ ADC P10 ; (Addr + 2)
1a0c : 29 01 __ AND #$01
1a0e : 09 10 __ ORA #$10
1a10 : 8d 22 9f STA $9f22 
1a13 : a5 3b __ LDA ACCU + 0 
1a15 : 8d 23 9f STA $9f23 
1a18 : e6 49 __ INC T2 + 0 
1a1a : d0 02 __ BNE $1a1e ; (LoadSprite.s1005 + 0)
.s1004:
1a1c : e6 4a __ INC T2 + 1 
.s1005:
1a1e : a5 4a __ LDA T2 + 1 
1a20 : c5 48 __ CMP T0 + 1 
1a22 : d0 04 __ BNE $1a28 ; (LoadSprite.s1003 + 0)
.s1002:
1a24 : a5 49 __ LDA T2 + 0 
1a26 : c5 47 __ CMP T0 + 0 
.s1003:
1a28 : 90 c4 __ BCC $19ee ; (LoadSprite.l2 + 0)
.s4:
1a2a : 20 8c 1a JSR $1a8c ; (krnio_clrchn.s0 + 0)
1a2d : a5 32 __ LDA P5 ; (fnum + 0)
1a2f : 4c 90 1a JMP $1a90 ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
1a32 : a5 2d __ LDA P0 
1a34 : 05 2e __ ORA P1 
1a36 : f0 08 __ BEQ $1a40 ; (krnio_setnam.s0 + 14)
1a38 : a0 ff __ LDY #$ff
1a3a : c8 __ __ INY
1a3b : b1 2d __ LDA (P0),y 
1a3d : d0 fb __ BNE $1a3a ; (krnio_setnam.s0 + 8)
1a3f : 98 __ __ TYA
1a40 : a6 2d __ LDX P0 
1a42 : a4 2e __ LDY P1 
1a44 : 20 bd ff JSR $ffbd 
.s1001:
1a47 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1a48 : a9 00 __ LDA #$00
1a4a : a6 2d __ LDX P0 ; (fnum + 0)
1a4c : 9d a0 46 STA $46a0,x ; (krnio_pstatus + 0)
1a4f : a9 00 __ LDA #$00
1a51 : 85 3b __ STA ACCU + 0 
1a53 : 85 3c __ STA ACCU + 1 
1a55 : a5 2d __ LDA P0 ; (fnum + 0)
1a57 : a6 2e __ LDX P1 
1a59 : a4 2f __ LDY P2 
1a5b : 20 ba ff JSR $ffba 
1a5e : 20 c0 ff JSR $ffc0 
1a61 : 90 08 __ BCC $1a6b ; (krnio_open.s0 + 35)
1a63 : a5 2d __ LDA P0 ; (fnum + 0)
1a65 : 20 c3 ff JSR $ffc3 
1a68 : 4c 6f 1a JMP $1a6f ; (krnio_open.s1001 + 0)
1a6b : a9 01 __ LDA #$01
1a6d : 85 3b __ STA ACCU + 0 
.s1001:
1a6f : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
46a0 : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a70 : 85 2d __ STA P0 
.s0:
1a72 : a6 2d __ LDX P0 
1a74 : 20 c6 ff JSR $ffc6 
1a77 : a9 00 __ LDA #$00
1a79 : 85 3c __ STA ACCU + 1 
1a7b : b0 02 __ BCS $1a7f ; (krnio_chkin.s0 + 13)
1a7d : a9 01 __ LDA #$01
1a7f : 85 3b __ STA ACCU + 0 
.s1001:
1a81 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a82 : 20 cf ff JSR $ffcf 
1a85 : 85 3b __ STA ACCU + 0 
1a87 : a9 00 __ LDA #$00
1a89 : 85 3c __ STA ACCU + 1 
.s1001:
1a8b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1a8c : 20 cc ff JSR $ffcc 
.s1001:
1a8f : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1a90 : 85 2d __ STA P0 
.s0:
1a92 : a5 2d __ LDA P0 
1a94 : 20 c3 ff JSR $ffc3 
.s1001:
1a97 : 60 __ __ RTS
--------------------------------------------------------------------
1a98 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1aa8 : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1ab7 : a9 10 __ LDA #$10
1ab9 : 85 30 __ STA P3 
1abb : a9 00 __ LDA #$00
1abd : 85 31 __ STA P4 
1abf : a5 32 __ LDA P5 ; (Palette + 0)
1ac1 : 85 2e __ STA P1 
1ac3 : 85 47 __ STA T0 + 0 
1ac5 : a5 33 __ LDA P6 ; (Palette + 1)
1ac7 : 85 2f __ STA P2 
1ac9 : 85 48 __ STA T0 + 1 
1acb : a5 34 __ LDA P7 ; (index + 0)
1acd : 85 2d __ STA P0 
1acf : ad fa 9e LDA $9efa ; (sstack + 0)
1ad2 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1ad4 : 0a __ __ ASL
1ad5 : 85 49 __ STA T3 + 0 
1ad7 : ad fb 9e LDA $9efb ; (sstack + 1)
1ada : 2a __ __ ROL
1adb : 18 __ __ CLC
1adc : 65 33 __ ADC P6 ; (Palette + 1)
1ade : 85 4a __ STA T3 + 1 
1ae0 : a4 32 __ LDY P5 ; (Palette + 0)
1ae2 : b1 49 __ LDA (T3 + 0),y 
1ae4 : aa __ __ TAX
1ae5 : c8 __ __ INY
1ae6 : b1 49 __ LDA (T3 + 0),y 
1ae8 : 86 49 __ STX T3 + 0 
1aea : 85 4a __ STA T3 + 1 
1aec : a9 00 __ LDA #$00
1aee : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1af0 : ad fc 9e LDA $9efc ; (sstack + 2)
1af3 : 85 4b __ STA T5 + 0 
1af5 : 38 __ __ SEC
1af6 : e9 01 __ SBC #$01
1af8 : 85 4d __ STA T6 + 0 
1afa : ad fd 9e LDA $9efd ; (sstack + 3)
1afd : 85 4c __ STA T5 + 1 
1aff : e9 00 __ SBC #$00
1b01 : 85 4e __ STA T6 + 1 
1b03 : d0 06 __ BNE $1b0b ; (SetPaletteIndex.s5 + 0)
.s1004:
1b05 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b07 : c5 4d __ CMP T6 + 0 
1b09 : b0 38 __ BCS $1b43 ; (SetPaletteIndex.s4 + 0)
.s5:
1b0b : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1b0d : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1b0f : 18 __ __ CLC
1b10 : a5 32 __ LDA P5 ; (Palette + 0)
1b12 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1b14 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b16 : a5 33 __ LDA P6 ; (Palette + 1)
1b18 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1b1a : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b1c : ae fa 9e LDX $9efa ; (sstack + 0)
.l2:
1b1f : a0 02 __ LDY #$02
1b21 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b23 : a0 00 __ LDY #$00
1b25 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b27 : a0 03 __ LDY #$03
1b29 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b2b : a0 01 __ LDY #$01
1b2d : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b2f : 18 __ __ CLC
1b30 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b32 : 69 02 __ ADC #$02
1b34 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b36 : 90 02 __ BCC $1b3a ; (SetPaletteIndex.s1008 + 0)
.s1007:
1b38 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1b3a : e8 __ __ INX
1b3b : a5 4e __ LDA T6 + 1 
1b3d : d0 e0 __ BNE $1b1f ; (SetPaletteIndex.l2 + 0)
.s1002:
1b3f : e4 4d __ CPX T6 + 0 
1b41 : 90 dc __ BCC $1b1f ; (SetPaletteIndex.l2 + 0)
.s4:
1b43 : a5 4b __ LDA T5 + 0 
1b45 : 0a __ __ ASL
1b46 : aa __ __ TAX
1b47 : a5 4c __ LDA T5 + 1 
1b49 : 2a __ __ ROL
1b4a : a8 __ __ TAY
1b4b : 8a __ __ TXA
1b4c : 38 __ __ SEC
1b4d : e9 02 __ SBC #$02
1b4f : b0 01 __ BCS $1b52 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1b51 : 88 __ __ DEY
.s1010:
1b52 : 18 __ __ CLC
1b53 : 65 47 __ ADC T0 + 0 
1b55 : 85 47 __ STA T0 + 0 
1b57 : 98 __ __ TYA
1b58 : 65 48 __ ADC T0 + 1 
1b5a : 85 48 __ STA T0 + 1 
1b5c : a5 49 __ LDA T3 + 0 
1b5e : a0 00 __ LDY #$00
1b60 : 91 47 __ STA (T0 + 0),y 
1b62 : a5 4a __ LDA T3 + 1 
1b64 : c8 __ __ INY
1b65 : 91 47 __ STA (T0 + 0),y 
1b67 : 4c 6c 19 JMP $196c ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
TowerPalF1:
4600 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4610 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
getchx:
.s0:
1b6a : 20 74 1b JSR $1b74 ; (getpch + 0)
1b6d : 85 3b __ STA ACCU + 0 
1b6f : a9 00 __ LDA #$00
1b71 : 85 3c __ STA ACCU + 1 
.s1001:
1b73 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1b74 : 20 e4 ff JSR $ffe4 
1b77 : ae fb 2c LDX $2cfb ; (giocharmap + 0)
1b7a : e0 01 __ CPX #$01
1b7c : 90 26 __ BCC $1ba4 ; (getpch + 48)
1b7e : c9 0d __ CMP #$0d
1b80 : d0 02 __ BNE $1b84 ; (getpch + 16)
1b82 : a9 0a __ LDA #$0a
1b84 : e0 02 __ CPX #$02
1b86 : 90 1c __ BCC $1ba4 ; (getpch + 48)
1b88 : c9 db __ CMP #$db
1b8a : b0 18 __ BCS $1ba4 ; (getpch + 48)
1b8c : c9 41 __ CMP #$41
1b8e : 90 14 __ BCC $1ba4 ; (getpch + 48)
1b90 : c9 c1 __ CMP #$c1
1b92 : 90 02 __ BCC $1b96 ; (getpch + 34)
1b94 : 49 a0 __ EOR #$a0
1b96 : c9 7b __ CMP #$7b
1b98 : b0 0a __ BCS $1ba4 ; (getpch + 48)
1b9a : c9 61 __ CMP #$61
1b9c : b0 04 __ BCS $1ba2 ; (getpch + 46)
1b9e : c9 5b __ CMP #$5b
1ba0 : b0 02 __ BCS $1ba4 ; (getpch + 48)
1ba2 : 49 20 __ EOR #$20
1ba4 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
2cfb : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
2cfc : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
2cfe : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
45e6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
45e8 : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1ba5 : a9 33 __ LDA #$33
1ba7 : 85 2d __ STA P0 
1ba9 : a9 38 __ LDA #$38
1bab : 85 2e __ STA P1 
1bad : a9 01 __ LDA #$01
1baf : 85 2f __ STA P2 
1bb1 : a6 32 __ LDX P5 ; (p + 0)
1bb3 : bd 00 47 LDA $4700,x ; (sintab + 0)
1bb6 : 4a __ __ LSR
1bb7 : 4a __ __ LSR
1bb8 : 4a __ __ LSR
1bb9 : 49 10 __ EOR #$10
1bbb : 38 __ __ SEC
1bbc : e9 10 __ SBC #$10
1bbe : 18 __ __ CLC
1bbf : 69 b4 __ ADC #$b4
1bc1 : 85 30 __ STA P3 
1bc3 : a9 00 __ LDA #$00
1bc5 : 85 31 __ STA P4 
1bc7 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1bca : a9 34 __ LDA #$34
1bcc : 85 2d __ STA P0 
1bce : a9 20 __ LDA #$20
1bd0 : 85 2e __ STA P1 
1bd2 : a6 34 __ LDX P7 ; (p2 + 0)
1bd4 : bd 00 47 LDA $4700,x ; (sintab + 0)
1bd7 : 4a __ __ LSR
1bd8 : 4a __ __ LSR
1bd9 : 4a __ __ LSR
1bda : 49 10 __ EOR #$10
1bdc : 38 __ __ SEC
1bdd : e9 10 __ SBC #$10
1bdf : 18 __ __ CLC
1be0 : 69 b4 __ ADC #$b4
1be2 : 85 30 __ STA P3 
1be4 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1be7 : a9 35 __ LDA #$35
1be9 : 85 2d __ STA P0 
1beb : a9 00 __ LDA #$00
1bed : 85 2e __ STA P1 
1bef : a6 36 __ LDX P9 ; (p3 + 0)
1bf1 : bd 00 47 LDA $4700,x ; (sintab + 0)
1bf4 : 4a __ __ LSR
1bf5 : 4a __ __ LSR
1bf6 : 4a __ __ LSR
1bf7 : 49 10 __ EOR #$10
1bf9 : 38 __ __ SEC
1bfa : e9 10 __ SBC #$10
1bfc : 18 __ __ CLC
1bfd : 69 a4 __ ADC #$a4
1bff : 85 30 __ STA P3 
1c01 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1c04 : a9 36 __ LDA #$36
1c06 : 85 2d __ STA P0 
1c08 : a9 40 __ LDA #$40
1c0a : 85 2e __ STA P1 
1c0c : a6 36 __ LDX P9 ; (p3 + 0)
1c0e : bd 00 47 LDA $4700,x ; (sintab + 0)
1c11 : 4a __ __ LSR
1c12 : 4a __ __ LSR
1c13 : 4a __ __ LSR
1c14 : 49 10 __ EOR #$10
1c16 : 38 __ __ SEC
1c17 : e9 10 __ SBC #$10
1c19 : 18 __ __ CLC
1c1a : 69 a4 __ ADC #$a4
1c1c : 85 30 __ STA P3 
1c1e : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1c21 : a9 37 __ LDA #$37
1c23 : 85 2d __ STA P0 
1c25 : a9 00 __ LDA #$00
1c27 : 85 2e __ STA P1 
1c29 : a6 36 __ LDX P9 ; (p3 + 0)
1c2b : bd 00 47 LDA $4700,x ; (sintab + 0)
1c2e : 4a __ __ LSR
1c2f : 4a __ __ LSR
1c30 : 4a __ __ LSR
1c31 : 49 10 __ EOR #$10
1c33 : 38 __ __ SEC
1c34 : e9 10 __ SBC #$10
1c36 : 18 __ __ CLC
1c37 : 69 c4 __ ADC #$c4
1c39 : 85 30 __ STA P3 
1c3b : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1c3e : a9 38 __ LDA #$38
1c40 : 85 2d __ STA P0 
1c42 : a9 40 __ LDA #$40
1c44 : 85 2e __ STA P1 
1c46 : a6 36 __ LDX P9 ; (p3 + 0)
1c48 : bd 00 47 LDA $4700,x ; (sintab + 0)
1c4b : 4a __ __ LSR
1c4c : 4a __ __ LSR
1c4d : 4a __ __ LSR
1c4e : 49 10 __ EOR #$10
1c50 : 38 __ __ SEC
1c51 : e9 10 __ SBC #$10
1c53 : 18 __ __ CLC
1c54 : 69 c4 __ ADC #$c4
1c56 : 85 30 __ STA P3 
1c58 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1c5b : a9 00 __ LDA #$00
1c5d : 85 2d __ STA P0 
1c5f : 85 2f __ STA P2 
1c61 : a9 68 __ LDA #$68
1c63 : 85 2e __ STA P1 
1c65 : a6 36 __ LDX P9 ; (p3 + 0)
1c67 : bd 00 47 LDA $4700,x ; (sintab + 0)
1c6a : 4a __ __ LSR
1c6b : 4a __ __ LSR
1c6c : 4a __ __ LSR
1c6d : 4a __ __ LSR
1c6e : 49 08 __ EOR #$08
1c70 : 38 __ __ SEC
1c71 : e9 08 __ SBC #$08
1c73 : 85 48 __ STA T2 + 0 
1c75 : a9 00 __ LDA #$00
1c77 : e9 00 __ SBC #$00
1c79 : 85 49 __ STA T2 + 1 
1c7b : 38 __ __ SEC
1c7c : a9 b6 __ LDA #$b6
1c7e : e5 48 __ SBC T2 + 0 
1c80 : 85 30 __ STA P3 
1c82 : a9 01 __ LDA #$01
1c84 : e5 49 __ SBC T2 + 1 
1c86 : 85 31 __ STA P4 
1c88 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1c8b : a9 01 __ LDA #$01
1c8d : 85 2d __ STA P0 
1c8f : 85 2f __ STA P2 
1c91 : a9 f0 __ LDA #$f0
1c93 : 85 2e __ STA P1 
1c95 : a6 36 __ LDX P9 ; (p3 + 0)
1c97 : bd 00 47 LDA $4700,x ; (sintab + 0)
1c9a : 4a __ __ LSR
1c9b : 4a __ __ LSR
1c9c : 4a __ __ LSR
1c9d : 4a __ __ LSR
1c9e : 49 08 __ EOR #$08
1ca0 : 38 __ __ SEC
1ca1 : e9 08 __ SBC #$08
1ca3 : a8 __ __ TAY
1ca4 : a9 00 __ LDA #$00
1ca6 : e9 00 __ SBC #$00
1ca8 : aa __ __ TAX
1ca9 : 98 __ __ TYA
1caa : 18 __ __ CLC
1cab : 69 b6 __ ADC #$b6
1cad : 85 30 __ STA P3 
1caf : 8a __ __ TXA
1cb0 : 69 01 __ ADC #$01
1cb2 : 85 31 __ STA P4 
1cb4 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1cb7 : a9 00 __ LDA #$00
1cb9 : 85 47 __ STA T1 + 0 
1cbb : 18 __ __ CLC
.l2:
1cbc : a5 47 __ LDA T1 + 0 
1cbe : 69 4f __ ADC #$4f
1cc0 : 85 2d __ STA P0 
1cc2 : a5 47 __ LDA T1 + 0 
1cc4 : 0a __ __ ASL
1cc5 : 65 47 __ ADC T1 + 0 
1cc7 : 0a __ __ ASL
1cc8 : 0a __ __ ASL
1cc9 : 18 __ __ CLC
1cca : 6d ea 45 ADC $45ea ; (FrameCount + 0)
1ccd : aa __ __ TAX
1cce : ac eb 45 LDY $45eb ; (FrameCount + 1)
1cd1 : bd 00 47 LDA $4700,x ; (sintab + 0)
1cd4 : 10 01 __ BPL $1cd7 ; (MoveSprites.s1008 + 0)
.s1007:
1cd6 : 88 __ __ DEY
.s1008:
1cd7 : 18 __ __ CLC
1cd8 : 6d ea 45 ADC $45ea ; (FrameCount + 0)
1cdb : 85 48 __ STA T2 + 0 
1cdd : 90 01 __ BCC $1ce0 ; (MoveSprites.s1009 + 0)
.s1006:
1cdf : c8 __ __ INY
.s1009:
1ce0 : 84 49 __ STY T2 + 1 
1ce2 : a5 47 __ LDA T1 + 0 
1ce4 : 0a __ __ ASL
1ce5 : 0a __ __ ASL
1ce6 : 85 3b __ STA ACCU + 0 
1ce8 : a9 00 __ LDA #$00
1cea : 85 3c __ STA ACCU + 1 
1cec : a9 80 __ LDA #$80
1cee : 85 23 __ STA WORK + 0 
1cf0 : a9 02 __ LDA #$02
1cf2 : 85 24 __ STA WORK + 1 
1cf4 : 20 75 24 JSR $2475 ; (divmod + 0)
1cf7 : 18 __ __ CLC
1cf8 : a5 25 __ LDA WORK + 2 
1cfa : 65 48 __ ADC T2 + 0 
1cfc : 85 2e __ STA P1 
1cfe : a5 26 __ LDA WORK + 3 
1d00 : 65 49 __ ADC T2 + 1 
1d02 : 85 2f __ STA P2 
1d04 : a5 47 __ LDA T1 + 0 
1d06 : 0a __ __ ASL
1d07 : 0a __ __ ASL
1d08 : 65 47 __ ADC T1 + 0 
1d0a : 85 48 __ STA T2 + 0 
1d0c : ad ea 45 LDA $45ea ; (FrameCount + 0)
1d0f : 38 __ __ SEC
1d10 : e9 40 __ SBC #$40
1d12 : 18 __ __ CLC
1d13 : 65 48 __ ADC T2 + 0 
1d15 : aa __ __ TAX
1d16 : bd 00 47 LDA $4700,x ; (sintab + 0)
1d19 : 4a __ __ LSR
1d1a : 49 40 __ EOR #$40
1d1c : 38 __ __ SEC
1d1d : e9 40 __ SBC #$40
1d1f : a8 __ __ TAY
1d20 : a9 00 __ LDA #$00
1d22 : e9 00 __ SBC #$00
1d24 : 85 49 __ STA T2 + 1 
1d26 : a5 47 __ LDA T1 + 0 
1d28 : 0a __ __ ASL
1d29 : 0a __ __ ASL
1d2a : 0a __ __ ASL
1d2b : 85 3b __ STA ACCU + 0 
1d2d : ad ea 45 LDA $45ea ; (FrameCount + 0)
1d30 : 38 __ __ SEC
1d31 : e9 20 __ SBC #$20
1d33 : 18 __ __ CLC
1d34 : 65 3b __ ADC ACCU + 0 
1d36 : aa __ __ TAX
1d37 : bd 00 47 LDA $4700,x ; (sintab + 0)
1d3a : 4a __ __ LSR
1d3b : 4a __ __ LSR
1d3c : 4a __ __ LSR
1d3d : 4a __ __ LSR
1d3e : 49 08 __ EOR #$08
1d40 : 38 __ __ SEC
1d41 : e9 08 __ SBC #$08
1d43 : 85 4a __ STA T3 + 0 
1d45 : a9 00 __ LDA #$00
1d47 : e9 00 __ SBC #$00
1d49 : 85 4b __ STA T3 + 1 
1d4b : a5 47 __ LDA T1 + 0 
1d4d : 0a __ __ ASL
1d4e : 65 47 __ ADC T1 + 0 
1d50 : 85 3b __ STA ACCU + 0 
1d52 : a5 47 __ LDA T1 + 0 
1d54 : c9 17 __ CMP #$17
1d56 : f0 2d __ BEQ $1d85 ; (MoveSprites.s5 + 0)
.s6:
1d58 : 98 __ __ TYA
1d59 : 18 __ __ CLC
1d5a : 69 c4 __ ADC #$c4
1d5c : a8 __ __ TAY
1d5d : a5 49 __ LDA T2 + 1 
1d5f : 69 00 __ ADC #$00
1d61 : aa __ __ TAX
1d62 : 98 __ __ TYA
1d63 : 18 __ __ CLC
1d64 : 65 4a __ ADC T3 + 0 
1d66 : a8 __ __ TAY
1d67 : 8a __ __ TXA
1d68 : 65 4b __ ADC T3 + 1 
1d6a : aa __ __ TAX
1d6b : 98 __ __ TYA
1d6c : 18 __ __ CLC
1d6d : 65 3b __ ADC ACCU + 0 
1d6f : 85 30 __ STA P3 
1d71 : 90 01 __ BCC $1d74 ; (MoveSprites.s1013 + 0)
.s1012:
1d73 : e8 __ __ INX
.s1013:
1d74 : 86 31 __ STX P4 
1d76 : 20 f6 18 JSR $18f6 ; (vera_spr_move.s0 + 0)
1d79 : e6 47 __ INC T1 + 0 
1d7b : a5 47 __ LDA T1 + 0 
1d7d : c9 18 __ CMP #$18
1d7f : b0 03 __ BCS $1d84 ; (MoveSprites.s1001 + 0)
1d81 : 4c bc 1c JMP $1cbc ; (MoveSprites.l2 + 0)
.s1001:
1d84 : 60 __ __ RTS
.s5:
1d85 : 98 __ __ TYA
1d86 : 18 __ __ CLC
1d87 : 69 bc __ ADC #$bc
1d89 : 18 __ __ CLC
1d8a : 65 4a __ ADC T3 + 0 
1d8c : a8 __ __ TAY
1d8d : a9 00 __ LDA #$00
1d8f : 65 4b __ ADC T3 + 1 
1d91 : aa __ __ TAX
1d92 : 98 __ __ TYA
1d93 : 18 __ __ CLC
1d94 : 65 3b __ ADC ACCU + 0 
1d96 : 85 30 __ STA P3 
1d98 : 90 01 __ BCC $1d9b ; (MoveSprites.s1011 + 0)
.s1010:
1d9a : e8 __ __ INX
.s1011:
1d9b : 86 31 __ STX P4 
1d9d : 4c f6 18 JMP $18f6 ; (vera_spr_move.s0 + 0)
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
45ea : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1da0 : a9 08 __ LDA #$08
1da2 : 8d 2c 9f STA $9f2c 
1da5 : ad fd 9e LDA $9efd ; (sstack + 3)
1da8 : cd ff 9e CMP $9eff ; (sstack + 5)
1dab : d0 10 __ BNE $1dbd ; (PlayZSM.s1 + 0)
.s1009:
1dad : ad fc 9e LDA $9efc ; (sstack + 2)
1db0 : cd fe 9e CMP $9efe ; (sstack + 4)
1db3 : d0 08 __ BNE $1dbd ; (PlayZSM.s1 + 0)
.s4:
1db5 : 20 96 1f JSR $1f96 ; (zsm_check.s0 + 0)
1db8 : 09 00 __ ORA #$00
1dba : d0 01 __ BNE $1dbd ; (PlayZSM.s1 + 0)
1dbc : 60 __ __ RTS
.s1:
1dbd : ac fc 9e LDY $9efc ; (sstack + 2)
1dc0 : ad fd 9e LDA $9efd ; (sstack + 3)
1dc3 : d0 15 __ BNE $1dda ; (PlayZSM.s18 + 0)
.s1008:
1dc5 : c0 03 __ CPY #$03
1dc7 : d0 11 __ BNE $1dda ; (PlayZSM.s18 + 0)
.s12:
1dc9 : a9 9c __ LDA #$9c
1dcb : 85 30 __ STA P3 
1dcd : a9 21 __ LDA #$21
1dcf : 85 31 __ STA P4 
1dd1 : a9 c3 __ LDA #$c3
1dd3 : 85 4b __ STA T0 + 0 
1dd5 : a9 21 __ LDA #$21
1dd7 : 4c c0 1e JMP $1ec0 ; (PlayZSM.s30 + 0)
.s18:
1dda : ad fd 9e LDA $9efd ; (sstack + 3)
1ddd : 10 03 __ BPL $1de2 ; (PlayZSM.s1007 + 0)
1ddf : 4c 9b 1e JMP $1e9b ; (PlayZSM.s20 + 0)
.s1007:
1de2 : d0 07 __ BNE $1deb ; (PlayZSM.s19 + 0)
.s1006:
1de4 : c0 03 __ CPY #$03
1de6 : b0 03 __ BCS $1deb ; (PlayZSM.s19 + 0)
1de8 : 4c 9b 1e JMP $1e9b ; (PlayZSM.s20 + 0)
.s19:
1deb : 09 00 __ ORA #$00
1ded : d0 56 __ BNE $1e45 ; (PlayZSM.s1001 + 0)
.s1003:
1def : 98 __ __ TYA
1df0 : c0 04 __ CPY #$04
1df2 : d0 4d __ BNE $1e41 ; (PlayZSM.s1002 + 0)
.s14:
1df4 : a9 00 __ LDA #$00
1df6 : 85 30 __ STA P3 
1df8 : a9 22 __ LDA #$22
1dfa : 85 31 __ STA P4 
1dfc : 20 b9 1f JSR $1fb9 ; (zsm_init.s0 + 0)
1dff : a9 03 __ LDA #$03
1e01 : 85 32 __ STA P5 
1e03 : 85 34 __ STA P7 
1e05 : a9 08 __ LDA #$08
1e07 : 85 33 __ STA P6 
1e09 : a9 00 __ LDA #$00
1e0b : 8d fa 9e STA $9efa ; (sstack + 0)
1e0e : a9 20 __ LDA #$20
1e10 : 8d fb 9e STA $9efb ; (sstack + 1)
1e13 : a9 1c __ LDA #$1c
1e15 : 85 30 __ STA P3 
1e17 : a9 22 __ LDA #$22
1e19 : 85 31 __ STA P4 
1e1b : ad 45 25 LDA $2545 ; (VolAddr + 0)
1e1e : 85 35 __ STA P8 
1e20 : ad 46 25 LDA $2546 ; (VolAddr + 1)
1e23 : 85 36 __ STA P9 
1e25 : ad 47 25 LDA $2547 ; (VolAddr + 2)
1e28 : 85 37 __ STA P10 
1e2a : ad 48 25 LDA $2548 ; (VolAddr + 3)
1e2d : 85 38 __ STA P11 
1e2f : 20 b5 19 JSR $19b5 ; (LoadSprite.s0 + 0)
1e32 : a9 20 __ LDA #$20
1e34 : 85 30 __ STA P3 
1e36 : a9 00 __ LDA #$00
1e38 : 85 31 __ STA P4 
1e3a : a9 46 __ LDA #$46
1e3c : a0 60 __ LDY #$60
1e3e : 4c 90 1e JMP $1e90 ; (PlayZSM.s29 + 0)
.s1002:
1e41 : c9 05 __ CMP #$05
1e43 : f0 01 __ BEQ $1e46 ; (PlayZSM.s16 + 0)
.s1001:
1e45 : 60 __ __ RTS
.s16:
1e46 : a9 39 __ LDA #$39
1e48 : 85 30 __ STA P3 
1e4a : a9 22 __ LDA #$22
1e4c : 85 31 __ STA P4 
1e4e : 20 b9 1f JSR $1fb9 ; (zsm_init.s0 + 0)
1e51 : a9 03 __ LDA #$03
1e53 : 85 32 __ STA P5 
1e55 : 85 34 __ STA P7 
1e57 : a9 08 __ LDA #$08
1e59 : 85 33 __ STA P6 
1e5b : a9 00 __ LDA #$00
1e5d : 8d fa 9e STA $9efa ; (sstack + 0)
1e60 : a9 20 __ LDA #$20
1e62 : 8d fb 9e STA $9efb ; (sstack + 1)
1e65 : a9 5a __ LDA #$5a
1e67 : 85 30 __ STA P3 
1e69 : a9 22 __ LDA #$22
1e6b : 85 31 __ STA P4 
1e6d : ad 45 25 LDA $2545 ; (VolAddr + 0)
1e70 : 85 35 __ STA P8 
1e72 : ad 46 25 LDA $2546 ; (VolAddr + 1)
1e75 : 85 36 __ STA P9 
1e77 : ad 47 25 LDA $2547 ; (VolAddr + 2)
1e7a : 85 37 __ STA P10 
1e7c : ad 48 25 LDA $2548 ; (VolAddr + 3)
1e7f : 85 38 __ STA P11 
1e81 : 20 b5 19 JSR $19b5 ; (LoadSprite.s0 + 0)
1e84 : a9 20 __ LDA #$20
1e86 : 85 30 __ STA P3 
1e88 : a9 00 __ LDA #$00
1e8a : 85 31 __ STA P4 
1e8c : a9 46 __ LDA #$46
1e8e : a0 80 __ LDY #$80
.s29:
1e90 : 84 2e __ STY P1 
1e92 : 85 2f __ STA P2 
1e94 : a9 b0 __ LDA #$b0
1e96 : 85 2d __ STA P0 
1e98 : 4c 6c 19 JMP $196c ; (vera_pal_putn.s0 + 0)
.s20:
1e9b : 98 __ __ TYA
1e9c : 0d fd 9e ORA $9efd ; (sstack + 3)
1e9f : d0 03 __ BNE $1ea4 ; (PlayZSM.s21 + 0)
1ea1 : 4c 54 1f JMP $1f54 ; (PlayZSM.s6 + 0)
.s21:
1ea4 : ad fd 9e LDA $9efd ; (sstack + 3)
1ea7 : d0 9c __ BNE $1e45 ; (PlayZSM.s1001 + 0)
.s1005:
1ea9 : 98 __ __ TYA
1eaa : c0 01 __ CPY #$01
1eac : f0 59 __ BEQ $1f07 ; (PlayZSM.s8 + 0)
.s1004:
1eae : c9 02 __ CMP #$02
1eb0 : d0 93 __ BNE $1e45 ; (PlayZSM.s1001 + 0)
.s10:
1eb2 : a9 4d __ LDA #$4d
1eb4 : 85 30 __ STA P3 
1eb6 : a9 21 __ LDA #$21
1eb8 : 85 31 __ STA P4 
1eba : a9 72 __ LDA #$72
1ebc : 85 4b __ STA T0 + 0 
1ebe : a9 21 __ LDA #$21
.s30:
1ec0 : 85 4c __ STA T0 + 1 
1ec2 : 20 b9 1f JSR $1fb9 ; (zsm_init.s0 + 0)
1ec5 : a5 4b __ LDA T0 + 0 
1ec7 : 85 30 __ STA P3 
1ec9 : a5 4c __ LDA T0 + 1 
1ecb : 85 31 __ STA P4 
1ecd : a9 03 __ LDA #$03
1ecf : 85 32 __ STA P5 
1ed1 : 85 34 __ STA P7 
1ed3 : a9 08 __ LDA #$08
1ed5 : 85 33 __ STA P6 
1ed7 : a9 00 __ LDA #$00
1ed9 : 8d fa 9e STA $9efa ; (sstack + 0)
1edc : a9 20 __ LDA #$20
1ede : 8d fb 9e STA $9efb ; (sstack + 1)
1ee1 : ad 45 25 LDA $2545 ; (VolAddr + 0)
1ee4 : 85 35 __ STA P8 
1ee6 : ad 46 25 LDA $2546 ; (VolAddr + 1)
1ee9 : 85 36 __ STA P9 
1eeb : ad 47 25 LDA $2547 ; (VolAddr + 2)
1eee : 85 37 __ STA P10 
1ef0 : ad 48 25 LDA $2548 ; (VolAddr + 3)
1ef3 : 85 38 __ STA P11 
1ef5 : 20 b5 19 JSR $19b5 ; (LoadSprite.s0 + 0)
1ef8 : a9 20 __ LDA #$20
1efa : 85 30 __ STA P3 
1efc : a9 00 __ LDA #$00
1efe : 85 31 __ STA P4 
1f00 : a9 46 __ LDA #$46
1f02 : a0 40 __ LDY #$40
1f04 : 4c 90 1e JMP $1e90 ; (PlayZSM.s29 + 0)
.s8:
1f07 : a9 12 __ LDA #$12
1f09 : 85 30 __ STA P3 
1f0b : a9 21 __ LDA #$21
1f0d : 85 31 __ STA P4 
1f0f : 20 b9 1f JSR $1fb9 ; (zsm_init.s0 + 0)
1f12 : a9 03 __ LDA #$03
1f14 : 85 32 __ STA P5 
1f16 : 85 34 __ STA P7 
1f18 : a9 08 __ LDA #$08
1f1a : 85 33 __ STA P6 
1f1c : a9 00 __ LDA #$00
1f1e : 8d fa 9e STA $9efa ; (sstack + 0)
1f21 : a9 20 __ LDA #$20
1f23 : 8d fb 9e STA $9efb ; (sstack + 1)
1f26 : a9 30 __ LDA #$30
1f28 : 85 30 __ STA P3 
1f2a : a9 21 __ LDA #$21
1f2c : 85 31 __ STA P4 
1f2e : ad 45 25 LDA $2545 ; (VolAddr + 0)
1f31 : 85 35 __ STA P8 
1f33 : ad 46 25 LDA $2546 ; (VolAddr + 1)
1f36 : 85 36 __ STA P9 
1f38 : ad 47 25 LDA $2547 ; (VolAddr + 2)
1f3b : 85 37 __ STA P10 
1f3d : ad 48 25 LDA $2548 ; (VolAddr + 3)
1f40 : 85 38 __ STA P11 
1f42 : 20 b5 19 JSR $19b5 ; (LoadSprite.s0 + 0)
1f45 : a9 20 __ LDA #$20
1f47 : 85 30 __ STA P3 
1f49 : a9 00 __ LDA #$00
1f4b : 85 31 __ STA P4 
1f4d : a9 46 __ LDA #$46
1f4f : a0 20 __ LDY #$20
1f51 : 4c 90 1e JMP $1e90 ; (PlayZSM.s29 + 0)
.s6:
1f54 : a9 03 __ LDA #$03
1f56 : 85 32 __ STA P5 
1f58 : 85 34 __ STA P7 
1f5a : a9 08 __ LDA #$08
1f5c : 85 33 __ STA P6 
1f5e : a9 00 __ LDA #$00
1f60 : 8d fa 9e STA $9efa ; (sstack + 0)
1f63 : a9 20 __ LDA #$20
1f65 : 8d fb 9e STA $9efb ; (sstack + 1)
1f68 : a9 9a __ LDA #$9a
1f6a : 85 30 __ STA P3 
1f6c : a9 1f __ LDA #$1f
1f6e : 85 31 __ STA P4 
1f70 : ad 45 25 LDA $2545 ; (VolAddr + 0)
1f73 : 85 35 __ STA P8 
1f75 : ad 46 25 LDA $2546 ; (VolAddr + 1)
1f78 : 85 36 __ STA P9 
1f7a : ad 47 25 LDA $2547 ; (VolAddr + 2)
1f7d : 85 37 __ STA P10 
1f7f : ad 48 25 LDA $2548 ; (VolAddr + 3)
1f82 : 85 38 __ STA P11 
1f84 : 20 b5 19 JSR $19b5 ; (LoadSprite.s0 + 0)
1f87 : a9 1c __ LDA #$1c
1f89 : 85 30 __ STA P3 
1f8b : a9 00 __ LDA #$00
1f8d : 85 31 __ STA P4 
1f8f : a9 41 __ LDA #$41
1f91 : a0 ca __ LDY #$ca
1f93 : 4c 90 1e JMP $1e90 ; (PlayZSM.s29 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1f96 : ad 43 25 LDA $2543 ; (zsm_finished + 0)
.s1001:
1f99 : 60 __ __ RTS
--------------------------------------------------------------------
1f9a : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1faa : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
zsm_init:
.s0:
1fb9 : a9 01 __ LDA #$01
1fbb : 8d 43 25 STA $2543 ; (zsm_finished + 0)
1fbe : ad ec 45 LDA $45ec ; (zsm_reading + 0)
1fc1 : f0 0a __ BEQ $1fcd ; (zsm_init.s3 + 0)
.s1:
1fc3 : a9 02 __ LDA #$02
1fc5 : 20 90 1a JSR $1a90 ; (krnio_close.s1000 + 0)
1fc8 : a9 00 __ LDA #$00
1fca : 8d ec 45 STA $45ec ; (zsm_reading + 0)
.s3:
1fcd : 20 1a 20 JSR $201a ; (zsm_silence.s0 + 0)
1fd0 : 20 32 20 JSR $2032 ; (zsm_save_volume.s0 + 0)
1fd3 : a9 00 __ LDA #$00
1fd5 : 8d f9 45 STA $45f9 ; (zsm_pos + 0)
1fd8 : 8d fa 45 STA $45fa ; (zsm_pos + 1)
1fdb : 8d fb 45 STA $45fb ; (zsm_wpos + 0)
1fde : 8d fc 45 STA $45fc ; (zsm_wpos + 1)
1fe1 : 8d f8 45 STA $45f8 ; (zsm_delay + 0)
1fe4 : a5 30 __ LDA P3 ; (fname + 0)
1fe6 : 85 2d __ STA P0 
1fe8 : a5 31 __ LDA P4 ; (fname + 1)
1fea : 85 2e __ STA P1 
1fec : 20 32 1a JSR $1a32 ; (krnio_setnam.s0 + 0)
1fef : a9 02 __ LDA #$02
1ff1 : 85 2d __ STA P0 
1ff3 : 85 2f __ STA P2 
1ff5 : a9 08 __ LDA #$08
1ff7 : 85 2e __ STA P1 
1ff9 : 20 48 1a JSR $1a48 ; (krnio_open.s0 + 0)
1ffc : a5 3b __ LDA ACCU + 0 
1ffe : f0 19 __ BEQ $2019 ; (zsm_init.s1001 + 0)
.s4:
2000 : a9 01 __ LDA #$01
2002 : 8d ec 45 STA $45ec ; (zsm_reading + 0)
2005 : 20 64 20 JSR $2064 ; (zsm_fill.s0 + 0)
2008 : a9 10 __ LDA #$10
200a : 8d f9 45 STA $45f9 ; (zsm_pos + 0)
200d : a9 00 __ LDA #$00
200f : 8d fa 45 STA $45fa ; (zsm_pos + 1)
2012 : 8d 43 25 STA $2543 ; (zsm_finished + 0)
2015 : a9 01 __ LDA #$01
2017 : 85 3b __ STA ACCU + 0 
.s1001:
2019 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
45ec : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
201a : a9 00 __ LDA #$00
201c : 85 47 __ STA T0 + 0 
201e : a9 08 __ LDA #$08
2020 : 85 2d __ STA P0 
2022 : a9 00 __ LDA #$00
.l1006:
2024 : 85 2e __ STA P1 
2026 : 20 cc 0d JSR $0dcc ; (sfx_put.l1 + 0)
2029 : e6 47 __ INC T0 + 0 
202b : a5 47 __ LDA T0 + 0 
202d : c9 08 __ CMP #$08
202f : 90 f3 __ BCC $2024 ; (zsm_silence.l1006 + 0)
.s1001:
2031 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
2032 : a0 00 __ LDY #$00
2034 : 84 3c __ STY ACCU + 1 
2036 : a2 02 __ LDX #$02
2038 : 18 __ __ CLC
.l1006:
2039 : 8a __ __ TXA
203a : 09 c0 __ ORA #$c0
203c : 8d 20 9f STA $9f20 
203f : a5 3c __ LDA ACCU + 1 
2041 : 09 f9 __ ORA #$f9
2043 : 8d 21 9f STA $9f21 
2046 : a9 01 __ LDA #$01
2048 : 8d 22 9f STA $9f22 
204b : ad 23 9f LDA $9f23 
204e : 99 b0 46 STA $46b0,y ; (vera_volumes + 0)
2051 : a9 00 __ LDA #$00
2053 : 8d 23 9f STA $9f23 
2056 : 8a __ __ TXA
2057 : 69 04 __ ADC #$04
2059 : aa __ __ TAX
205a : 90 02 __ BCC $205e ; (zsm_save_volume.s1009 + 0)
.s1008:
205c : e6 3c __ INC ACCU + 1 
.s1009:
205e : c8 __ __ INY
205f : c0 10 __ CPY #$10
2061 : 90 d6 __ BCC $2039 ; (zsm_save_volume.l1006 + 0)
.s1001:
2063 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
46b0 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
45fb : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
2064 : ad ec 45 LDA $45ec ; (zsm_reading + 0)
2067 : f0 20 __ BEQ $2089 ; (zsm_fill.s1 + 0)
.s2:
2069 : ad fa 45 LDA $45fa ; (zsm_pos + 1)
206c : 18 __ __ CLC
206d : 69 04 __ ADC #$04
206f : cd fc 45 CMP $45fc ; (zsm_wpos + 1)
2072 : d0 0c __ BNE $2080 ; (zsm_fill.s6 + 0)
.s1006:
2074 : ad fb 45 LDA $45fb ; (zsm_wpos + 0)
2077 : cd f9 45 CMP $45f9 ; (zsm_pos + 0)
207a : d0 04 __ BNE $2080 ; (zsm_fill.s6 + 0)
.s5:
207c : a9 00 __ LDA #$00
207e : f0 0b __ BEQ $208b ; (zsm_fill.s1008 + 0)
.s6:
2080 : a9 02 __ LDA #$02
2082 : 20 70 1a JSR $1a70 ; (krnio_chkin.s1000 + 0)
2085 : a5 3b __ LDA ACCU + 0 
2087 : d0 07 __ BNE $2090 ; (zsm_fill.s9 + 0)
.s1:
2089 : a9 ff __ LDA #$ff
.s1008:
208b : 85 3b __ STA ACCU + 0 
.s1001:
208d : 85 3c __ STA ACCU + 1 
208f : 60 __ __ RTS
.s9:
2090 : a9 00 __ LDA #$00
2092 : 85 47 __ STA T1 + 0 
2094 : 85 48 __ STA T1 + 1 
2096 : ad fa 45 LDA $45fa ; (zsm_pos + 1)
2099 : 18 __ __ CLC
209a : 69 04 __ ADC #$04
209c : cd fc 45 CMP $45fc ; (zsm_wpos + 1)
209f : d0 08 __ BNE $20a9 ; (zsm_fill.l13 + 0)
.s1002:
20a1 : ad fb 45 LDA $45fb ; (zsm_wpos + 0)
20a4 : cd f9 45 CMP $45f9 ; (zsm_pos + 0)
20a7 : f0 49 __ BEQ $20f2 ; (zsm_fill.s38 + 0)
.l13:
20a9 : 20 82 1a JSR $1a82 ; (krnio_chrin.s0 + 0)
20ac : ad fb 45 LDA $45fb ; (zsm_wpos + 0)
20af : aa __ __ TAX
20b0 : 18 __ __ CLC
20b1 : 69 01 __ ADC #$01
20b3 : 8d fb 45 STA $45fb ; (zsm_wpos + 0)
20b6 : ad fc 45 LDA $45fc ; (zsm_wpos + 1)
20b9 : a8 __ __ TAY
20ba : 69 00 __ ADC #$00
20bc : 8d fc 45 STA $45fc ; (zsm_wpos + 1)
20bf : 8a __ __ TXA
20c0 : 18 __ __ CLC
20c1 : 69 93 __ ADC #$93
20c3 : 85 49 __ STA T3 + 0 
20c5 : 98 __ __ TYA
20c6 : 29 03 __ AND #$03
20c8 : 69 59 __ ADC #$59
20ca : 85 4a __ STA T3 + 1 
20cc : a5 3b __ LDA ACCU + 0 
20ce : a0 00 __ LDY #$00
20d0 : 91 49 __ STA (T3 + 0),y 
20d2 : e6 47 __ INC T1 + 0 
20d4 : d0 02 __ BNE $20d8 ; (zsm_fill.s1010 + 0)
.s1009:
20d6 : e6 48 __ INC T1 + 1 
.s1010:
20d8 : 20 08 21 JSR $2108 ; (krnio_status.s0 + 0)
20db : a5 3b __ LDA ACCU + 0 
20dd : d0 0e __ BNE $20ed ; (zsm_fill.s15 + 0)
.s12:
20df : ad fa 45 LDA $45fa ; (zsm_pos + 1)
20e2 : 18 __ __ CLC
20e3 : 69 04 __ ADC #$04
20e5 : cd fc 45 CMP $45fc ; (zsm_wpos + 1)
20e8 : d0 bf __ BNE $20a9 ; (zsm_fill.l13 + 0)
20ea : 4c a1 20 JMP $20a1 ; (zsm_fill.s1002 + 0)
.s15:
20ed : a9 00 __ LDA #$00
20ef : 8d ec 45 STA $45ec ; (zsm_reading + 0)
.s38:
20f2 : 20 8c 1a JSR $1a8c ; (krnio_clrchn.s0 + 0)
20f5 : ad ec 45 LDA $45ec ; (zsm_reading + 0)
20f8 : d0 05 __ BNE $20ff ; (zsm_fill.s21 + 0)
.s19:
20fa : a9 02 __ LDA #$02
20fc : 20 90 1a JSR $1a90 ; (krnio_close.s1000 + 0)
.s21:
20ff : a5 47 __ LDA T1 + 0 
2101 : 85 3b __ STA ACCU + 0 
2103 : a5 48 __ LDA T1 + 1 
2105 : 4c 8d 20 JMP $208d ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_status:
.s0:
2108 : 20 b7 ff JSR $ffb7 
210b : 85 3b __ STA ACCU + 0 
210d : a9 00 __ LDA #$00
210f : 85 3c __ STA ACCU + 1 
.s1001:
2111 : 60 __ __ RTS
--------------------------------------------------------------------
2112 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
2122 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
2130 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2140 : __ __ __ BYT 4b 4f 4c 45 2e 42 49 4e 2c 50 2c 52 00          : KOLE.BIN,P,R.
--------------------------------------------------------------------
KolePal:
4620 : __ __ __ BYT 00 00 79 02 00 00 40 0a 30 07 ff 0f 00 0f 6c 00 : ..y...@.0.....l.
4630 : __ __ __ BYT bf 00 99 09 cc 0c 0f 06 be 07 08 02 33 03 00 00 : ............3...
--------------------------------------------------------------------
214d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
215d : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
216d : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
2172 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2182 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
2192 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
RealPal:
4640 : __ __ __ BYT 00 00 00 00 20 04 46 04 69 06 40 09 ff 00 44 04 : .... .F.i.@...D.
4650 : __ __ __ BYT bb 0b dd 0d 75 0c a7 0e ff 0f df 0d 33 03 99 09 : ....u.......3...
--------------------------------------------------------------------
219c : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
21ac : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
21bc : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
21c3 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
21d3 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
21e3 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
2200 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
2210 : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
221c : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
222c : __ __ __ BYT 46 4c 44 45 2e 42 49 4e 2c 50 2c 52 00          : FLDE.BIN,P,R.
--------------------------------------------------------------------
FldePal:
4660 : __ __ __ BYT 00 00 00 00 dd 0d ff 0f 3e 02 cf 00 ad 00 5f 04 : ........>....._.
4670 : __ __ __ BYT 27 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : '...............
--------------------------------------------------------------------
2239 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 46 45 4d 55 : @0:zsmfiles/FEMU
2249 : __ __ __ BYT 52 46 52 45 45 5a 45 52 2e 7a 73 6d 2c 50 2c 52 : RFREEZER.zsm,P,R
2259 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
225a : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
226a : __ __ __ BYT 41 4c 45 4b 53 49 2e 42 49 4e 2c 50 2c 52 00    : ALEKSI.BIN,P,R.
--------------------------------------------------------------------
Aleksipal:
4680 : __ __ __ BYT 00 00 00 00 3b 00 6f 00 22 02 cc 00 ff 00 9f 02 : ....;.o.".......
4690 : __ __ __ BYT 11 01 cb 0c ff 0f 99 09 d0 0d 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
LastSelectedSong:
45ed : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
45ee : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalIndex:
45f0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
MaxSong:
45f2 : __ __ __ BYT 05                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
2279 : ad 25 9f LDA $9f25 
227c : 29 fe __ AND #$fe
227e : 8d 25 9f STA $9f25 
2281 : a9 00 __ LDA #$00
2283 : 8d 20 9f STA $9f20 
2286 : a9 b0 __ LDA #$b0
2288 : 8d 21 9f STA $9f21 
228b : a9 11 __ LDA #$11
228d : 8d 22 9f STA $9f22 
2290 : a2 80 __ LDX #$80
2292 : a9 00 __ LDA #$00
.l1002:
2294 : 8d 23 9f STA $9f23 
2297 : 8d 23 9f STA $9f23 
229a : ca __ __ DEX
229b : d0 f7 __ BNE $2294 ; (ResetChars.l1002 + 0)
.s1001:
229d : 60 __ __ RTS
--------------------------------------------------------------------
off1:
45f3 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
229e : a5 31 __ LDA P4 ; (Input + 0)
22a0 : c9 20 __ CMP #$20
22a2 : d0 1c __ BNE $22c0 ; (Control.s1007 + 0)
.s1:
22a4 : a5 30 __ LDA P3 ; (playing + 0)
22a6 : d0 0a __ BNE $22b2 ; (Control.s4 + 0)
.s5:
22a8 : a9 01 __ LDA #$01
22aa : 20 ed 21 JSR $21ed ; (zsm_irq_play.s0 + 0)
22ad : a9 01 __ LDA #$01
.s1001:
22af : 85 3b __ STA ACCU + 0 
22b1 : 60 __ __ RTS
.s4:
22b2 : a9 00 __ LDA #$00
22b4 : cd f5 45 CMP $45f5 ; (paused + 0)
22b7 : 2a __ __ ROL
22b8 : 8d f5 45 STA $45f5 ; (paused + 0)
22bb : 85 2f __ STA P2 
22bd : 20 c5 22 JSR $22c5 ; (zsm_pause.s0 + 0)
.s1007:
22c0 : a5 30 __ LDA P3 ; (playing + 0)
22c2 : 4c af 22 JMP $22af ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
45f5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
22c5 : a5 2f __ LDA P2 ; (pause + 0)
22c7 : d0 0e __ BNE $22d7 ; (zsm_pause.s4 + 0)
.s8:
22c9 : ad 44 25 LDA $2544 ; (zsm_paused + 0)
22cc : f0 08 __ BEQ $22d6 ; (zsm_pause.s1001 + 0)
.s5:
22ce : 20 e7 22 JSR $22e7 ; (zsm_restore_volume.s0 + 0)
22d1 : a9 00 __ LDA #$00
22d3 : 8d 44 25 STA $2544 ; (zsm_paused + 0)
.s1001:
22d6 : 60 __ __ RTS
.s4:
22d7 : ad 44 25 LDA $2544 ; (zsm_paused + 0)
22da : d0 fa __ BNE $22d6 ; (zsm_pause.s1001 + 0)
.s1:
22dc : a9 01 __ LDA #$01
22de : 8d 44 25 STA $2544 ; (zsm_paused + 0)
22e1 : 20 1a 20 JSR $201a ; (zsm_silence.s0 + 0)
22e4 : 4c 32 20 JMP $2032 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
22e7 : a0 00 __ LDY #$00
22e9 : 84 3c __ STY ACCU + 1 
22eb : a2 02 __ LDX #$02
22ed : 18 __ __ CLC
.l1006:
22ee : 8a __ __ TXA
22ef : 09 c0 __ ORA #$c0
22f1 : 8d 20 9f STA $9f20 
22f4 : a5 3c __ LDA ACCU + 1 
22f6 : 09 f9 __ ORA #$f9
22f8 : 8d 21 9f STA $9f21 
22fb : a9 01 __ LDA #$01
22fd : 8d 22 9f STA $9f22 
2300 : b9 b0 46 LDA $46b0,y ; (vera_volumes + 0)
2303 : 8d 23 9f STA $9f23 
2306 : 8a __ __ TXA
2307 : 69 04 __ ADC #$04
2309 : aa __ __ TAX
230a : 90 02 __ BCC $230e ; (zsm_restore_volume.s1009 + 0)
.s1008:
230c : e6 3c __ INC ACCU + 1 
.s1009:
230e : c8 __ __ INY
230f : c0 10 __ CPY #$10
2311 : 90 db __ BCC $22ee ; (zsm_restore_volume.l1006 + 0)
.s1001:
2313 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
21ed : 8d ff 21 STA $21ff ; (zsm_playing + 0)
.s1001:
21f0 : 60 __ __ RTS
--------------------------------------------------------------------
UpdateVolume:
.s0:
2314 : a9 21 __ LDA #$21
2316 : 8d 2c 9f STA $9f2c 
2319 : a9 00 __ LDA #$00
231b : 8d f8 9e STA $9ef8 ; (FMVolume + 0)
231e : 8d f9 9e STA $9ef9 ; (VeraVolume + 0)
2321 : 85 47 __ STA T0 + 0 
2323 : 85 32 __ STA P5 
.l2:
2325 : a9 f9 __ LDA #$f9
2327 : 85 2d __ STA P0 
2329 : a9 9e __ LDA #$9e
232b : 85 2e __ STA P1 
232d : a9 f8 __ LDA #$f8
232f : 85 2f __ STA P2 
2331 : a9 9e __ LDA #$9e
2333 : 85 30 __ STA P3 
2335 : a5 47 __ LDA T0 + 0 
2337 : 85 31 __ STA P4 
2339 : 20 ea 23 JSR $23ea ; (zsm_get_volumes.s0 + 0)
233c : 18 __ __ CLC
233d : a5 31 __ LDA P4 
233f : 69 19 __ ADC #$19
2341 : 85 2d __ STA P0 
2343 : ad f9 9e LDA $9ef9 ; (VeraVolume + 0)
2346 : 4a __ __ LSR
2347 : 4a __ __ LSR
2348 : 4a __ __ LSR
2349 : 4a __ __ LSR
234a : aa __ __ TAX
234b : ad 49 25 LDA $2549 ; (IndAddr + 0)
234e : 18 __ __ CLC
234f : 7d 23 25 ADC $2523,x ; (__multab32L + 0)
2352 : 85 48 __ STA T5 + 0 
2354 : ad 4a 25 LDA $254a ; (IndAddr + 1)
2357 : 7d 33 25 ADC $2533,x ; (__multab32H + 0)
235a : 85 49 __ STA T5 + 1 
235c : ad 4b 25 LDA $254b ; (IndAddr + 2)
235f : 69 00 __ ADC #$00
2361 : 85 4a __ STA T5 + 2 
2363 : ad 4c 25 LDA $254c ; (IndAddr + 3)
2366 : 69 00 __ ADC #$00
2368 : a2 05 __ LDX #$05
.l1002:
236a : 4a __ __ LSR
236b : 66 4a __ ROR T5 + 2 
236d : 66 49 __ ROR T5 + 1 
236f : 66 48 __ ROR T5 + 0 
2371 : ca __ __ DEX
2372 : d0 f6 __ BNE $236a ; (UpdateVolume.l1002 + 0)
.s1003:
2374 : a5 48 __ LDA T5 + 0 
2376 : 85 2e __ STA P1 
2378 : a5 49 __ LDA T5 + 1 
237a : 85 2f __ STA P2 
237c : 20 20 24 JSR $2420 ; (vera_spr_image.s0 + 0)
237f : e6 47 __ INC T0 + 0 
2381 : a5 47 __ LDA T0 + 0 
2383 : c9 10 __ CMP #$10
2385 : 90 9e __ BCC $2325 ; (UpdateVolume.l2 + 0)
.s4:
2387 : a9 00 __ LDA #$00
2389 : 85 47 __ STA T0 + 0 
.l6:
238b : a9 f9 __ LDA #$f9
238d : 85 2d __ STA P0 
238f : a9 9e __ LDA #$9e
2391 : 85 2e __ STA P1 
2393 : a9 f8 __ LDA #$f8
2395 : 85 2f __ STA P2 
2397 : a5 47 __ LDA T0 + 0 
2399 : 85 31 __ STA P4 
239b : 20 ea 23 JSR $23ea ; (zsm_get_volumes.s0 + 0)
239e : 18 __ __ CLC
239f : a5 31 __ LDA P4 
23a1 : 69 29 __ ADC #$29
23a3 : 85 2d __ STA P0 
23a5 : ad f8 9e LDA $9ef8 ; (FMVolume + 0)
23a8 : 4a __ __ LSR
23a9 : 4a __ __ LSR
23aa : 4a __ __ LSR
23ab : 4a __ __ LSR
23ac : 4a __ __ LSR
23ad : aa __ __ TAX
23ae : bd 23 25 LDA $2523,x ; (__multab32L + 0)
23b1 : 18 __ __ CLC
23b2 : 6d 49 25 ADC $2549 ; (IndAddr + 0)
23b5 : 85 48 __ STA T5 + 0 
23b7 : ad 4a 25 LDA $254a ; (IndAddr + 1)
23ba : 69 00 __ ADC #$00
23bc : 85 49 __ STA T5 + 1 
23be : ad 4b 25 LDA $254b ; (IndAddr + 2)
23c1 : 69 00 __ ADC #$00
23c3 : 85 4a __ STA T5 + 2 
23c5 : ad 4c 25 LDA $254c ; (IndAddr + 3)
23c8 : 69 00 __ ADC #$00
23ca : a2 05 __ LDX #$05
.l1004:
23cc : 4a __ __ LSR
23cd : 66 4a __ ROR T5 + 2 
23cf : 66 49 __ ROR T5 + 1 
23d1 : 66 48 __ ROR T5 + 0 
23d3 : ca __ __ DEX
23d4 : d0 f6 __ BNE $23cc ; (UpdateVolume.l1004 + 0)
.s1005:
23d6 : a5 48 __ LDA T5 + 0 
23d8 : 85 2e __ STA P1 
23da : a5 49 __ LDA T5 + 1 
23dc : 85 2f __ STA P2 
23de : 20 20 24 JSR $2420 ; (vera_spr_image.s0 + 0)
23e1 : e6 47 __ INC T0 + 0 
23e3 : a5 47 __ LDA T0 + 0 
23e5 : c9 08 __ CMP #$08
23e7 : 90 a2 __ BCC $238b ; (UpdateVolume.l6 + 0)
.s1001:
23e9 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_get_volumes:
.s0:
23ea : a5 31 __ LDA P4 ; (id + 0)
23ec : 0a __ __ ASL
23ed : 85 3b __ STA ACCU + 0 
23ef : a5 32 __ LDA P5 ; (id + 1)
23f1 : 2a __ __ ROL
23f2 : 06 3b __ ASL ACCU + 0 
23f4 : 0a __ __ ASL
23f5 : 09 f9 __ ORA #$f9
23f7 : aa __ __ TAX
23f8 : a5 3b __ LDA ACCU + 0 
23fa : 09 c2 __ ORA #$c2
23fc : 8d 20 9f STA $9f20 
23ff : 8e 21 9f STX $9f21 
2402 : a9 01 __ LDA #$01
2404 : 8d 22 9f STA $9f22 
2407 : ad 23 9f LDA $9f23 
240a : a0 00 __ LDY #$00
240c : 91 2d __ STA (P0),y ; (vera_v + 0)
240e : 18 __ __ CLC
240f : a9 78 __ LDA #$78
2411 : 65 31 __ ADC P4 ; (id + 0)
2413 : 85 3b __ STA ACCU + 0 
2415 : a9 5e __ LDA #$5e
2417 : 65 32 __ ADC P5 ; (id + 1)
2419 : 85 3c __ STA ACCU + 1 
241b : b1 3b __ LDA (ACCU + 0),y 
241d : 91 2f __ STA (P2),y ; (fm_v + 0)
.s1001:
241f : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_image:
.s0:
2420 : ad 25 9f LDA $9f25 
2423 : 29 fe __ AND #$fe
2425 : 8d 25 9f STA $9f25 
2428 : a5 2d __ LDA P0 ; (spr + 0)
242a : 0a __ __ ASL
242b : 0a __ __ ASL
242c : 85 3b __ STA ACCU + 0 
242e : a9 3f __ LDA #$3f
2430 : 2a __ __ ROL
2431 : 06 3b __ ASL ACCU + 0 
2433 : 2a __ __ ROL
2434 : 8d 21 9f STA $9f21 
2437 : a5 3b __ LDA ACCU + 0 
2439 : 8d 20 9f STA $9f20 
243c : a9 11 __ LDA #$11
243e : 8d 22 9f STA $9f22 
2441 : a5 2e __ LDA P1 ; (addr32 + 0)
2443 : 8d 23 9f STA $9f23 
2446 : ad 22 9f LDA $9f22 
2449 : 29 0f __ AND #$0f
244b : 8d 22 9f STA $9f22 
244e : ad 23 9f LDA $9f23 
2451 : 29 80 __ AND #$80
2453 : 05 2f __ ORA P2 ; (addr32 + 1)
2455 : 8d 23 9f STA $9f23 
.s1001:
2458 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4800 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4810 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4820 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4830 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4840 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4850 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4860 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4870 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
4880 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
4890 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
48a0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
48b0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
48c0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
48d0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
48e0 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
48f0 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4900 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4910 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4920 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4930 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4940 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4950 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4960 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4970 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
4980 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
4990 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
49a0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
49b0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
49c0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
49d0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
49e0 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
49f0 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4a00 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4a10 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4a20 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4a30 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4a40 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4a50 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4a60 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4a70 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
4a80 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
4a90 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4aa0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4ab0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4ac0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4ad0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4ae0 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4af0 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4b00 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4b10 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4b20 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4b30 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4b40 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4b50 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4b60 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4b70 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
4b80 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
4b90 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4ba0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4bb0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4bc0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4bd0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4be0 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4bf0 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4c00 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4c10 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4c20 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4c30 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4c40 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4c50 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4c60 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4c70 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4c80 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4c90 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4ca0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4cb0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4cc0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4cd0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4ce0 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4cf0 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4d00 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4d10 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4d20 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4d30 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4d40 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4d50 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4d60 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4d70 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4d80 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4d90 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4da0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4db0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4dc0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4dd0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4de0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4df0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4e00 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4e10 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
4e1e : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4e2e : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4e3e : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4e4e : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4e5e : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4e6e : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4e7e : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4e8e : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
4e9e : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
4eae : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
4ebe : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
4ece : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
4ede : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
4eee : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
4efe : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
4f0e : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
4f1e : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
4f2e : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
4f3e : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
4f4e : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
4f5e : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
4f6e : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
4f7e : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
4f8e : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
4f9e : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
4fae : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
4fbe : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
4fce : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
4fde : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
4fee : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
4ffe : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
500e : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
501e : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
502e : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
503e : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
504e : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
505e : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
506e : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
507e : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
508e : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
509e : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
50ae : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
50be : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
50ce : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
50de : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
50ee : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
50fe : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
510e : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
511e : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
512e : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
513e : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
514e : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
515e : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
516e : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
517e : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
518e : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
519e : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
51ae : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
51be : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
51ce : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
51de : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
51ee : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
51fe : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
520e : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
521e : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
522e : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
523e : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
524e : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
525e : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
526e : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
527e : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
528e : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
529e : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
52ae : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
52be : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
52ce : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
52de : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
52ee : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
52fe : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
530e : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
531e : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
532e : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
533e : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
534e : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
535e : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
536e : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
537e : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
538e : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
539e : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
53ae : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
53be : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
53ce : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
53de : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
53ee : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
53fe : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
540e : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
541e : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
542e : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
543e : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
544e : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
545e : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
546e : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
547e : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
548e : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
549e : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
54ae : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
54be : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
54ce : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
54de : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
54ee : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
54fe : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
550e : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
551e : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
552e : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
553e : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
554e : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
555e : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
556e : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5600 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5610 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5620 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5630 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5640 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5650 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5660 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5670 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5680 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5690 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
56a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
56b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
56c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5700 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5710 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5720 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5730 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5740 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5750 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5760 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5770 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5780 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5790 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
57a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
57b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
57c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
Song4:
5800 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5810 : __ __ __ BYT 0d 05 3a 20 2d 20 22 07 0f 02 13 0d 01 03 0b 05 : ..: - ".........
5820 : __ __ __ BYT 04 22 20 2d 20 01 12 14 09 13 14 3a 20 22 06 01 : ." - ......: "..
5830 : __ __ __ BYT 04 05 22 20 2d 20 0c 05 0e 07 14 08 3a 20 33 3a : .." - ......: 3:
5840 : __ __ __ BYT 32 33 20 2d 20 03 0f 0d 0d 05 0e 14 3a 20 09 20 : 23 - .......: . 
5850 : __ __ __ BYT 02 05 14 20 19 0f 15 20 04 09 04 0e 27 14 20 14 : ... ... ....'. .
5860 : __ __ __ BYT 08 09 0e 0b 20 14 08 05 20 17 01 12 0d 14 08 20 : .... ... ...... 
5870 : __ __ __ BYT 0f 06 20 16 09 0e 19 0c 20 03 0f 15 0c 04 20 02 : .. ..... ..... .
5880 : __ __ __ BYT 05 20 12 05 10 0c 09 03 01 14 05 04 20 09 0e 20 : . .......... .. 
5890 : __ __ __ BYT 01 0e 19 14 08 09 0e 07 20 04 09 07 09 14 01 0c : ........ .......
58a0 : __ __ __ BYT 2c 20 02 15 14 20 08 05 12 05 20 17 05 20 01 12 : , ... .... .. ..
58b0 : __ __ __ BYT 05 20 3a 33 20 3d 20 3d 20 2d 20 2d 20 00       : . :3 = = - - .
--------------------------------------------------------------------
Song5:
5900 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5910 : __ __ __ BYT 0d 05 3a 20 2d 20 22 06 05 0d 15 12 20 06 12 05 : ..: - "..... ...
5920 : __ __ __ BYT 05 1a 05 12 22 20 2d 20 01 12 14 09 13 14 3a 20 : ...." - ......: 
5930 : __ __ __ BYT 22 01 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 22 : "...... ......."
5940 : __ __ __ BYT 20 2d 20 0c 05 0e 07 14 08 3a 20 31 3a 35 35 20 :  - ......: 1:55 
5950 : __ __ __ BYT 2d 20 03 0f 0d 0d 05 0e 14 3a 20 13 0f 0e 07 20 : - .......: .... 
5960 : __ __ __ BYT 02 12 0f 15 07 08 14 20 14 0f 20 19 0f 15 20 02 : ....... .. ... .
5970 : __ __ __ BYT 19 20 04 05 05 1a 20 0e 15 14 20 03 0f 2e 20 13 : . .... ... ... .
5980 : __ __ __ BYT 09 0e 03 05 20 31 38 38 39 20 3d 20 3d 20 2d 20 : .... 1889 = = - 
5990 : __ __ __ BYT 2d 20 00                                        : - .
--------------------------------------------------------------------
frame_wait:
.l1:
21f1 : ad 26 9f LDA $9f26 
21f4 : 0a __ __ ASL
21f5 : 30 fa __ BMI $21f1 ; (frame_wait.l1 + 0)
.l4:
21f7 : ad 26 9f LDA $9f26 
21fa : 0a __ __ ASL
21fb : 10 fa __ BPL $21f7 ; (frame_wait.l4 + 0)
.s1001:
21fd : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
2459 : 38 __ __ SEC
245a : a9 00 __ LDA #$00
245c : e5 3b __ SBC ACCU + 0 
245e : 85 3b __ STA ACCU + 0 
2460 : a9 00 __ LDA #$00
2462 : e5 3c __ SBC ACCU + 1 
2464 : 85 3c __ STA ACCU + 1 
2466 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
2467 : 38 __ __ SEC
2468 : a9 00 __ LDA #$00
246a : e5 23 __ SBC WORK + 0 
246c : 85 23 __ STA WORK + 0 
246e : a9 00 __ LDA #$00
2470 : e5 24 __ SBC WORK + 1 
2472 : 85 24 __ STA WORK + 1 
2474 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
2475 : a5 3c __ LDA ACCU + 1 
2477 : d0 31 __ BNE $24aa ; (divmod + 53)
2479 : a5 24 __ LDA WORK + 1 
247b : d0 1e __ BNE $249b ; (divmod + 38)
247d : 85 26 __ STA WORK + 3 
247f : a2 04 __ LDX #$04
2481 : 06 3b __ ASL ACCU + 0 
2483 : 2a __ __ ROL
2484 : c5 23 __ CMP WORK + 0 
2486 : 90 02 __ BCC $248a ; (divmod + 21)
2488 : e5 23 __ SBC WORK + 0 
248a : 26 3b __ ROL ACCU + 0 
248c : 2a __ __ ROL
248d : c5 23 __ CMP WORK + 0 
248f : 90 02 __ BCC $2493 ; (divmod + 30)
2491 : e5 23 __ SBC WORK + 0 
2493 : 26 3b __ ROL ACCU + 0 
2495 : ca __ __ DEX
2496 : d0 eb __ BNE $2483 ; (divmod + 14)
2498 : 85 25 __ STA WORK + 2 
249a : 60 __ __ RTS
249b : a5 3b __ LDA ACCU + 0 
249d : 85 25 __ STA WORK + 2 
249f : a5 3c __ LDA ACCU + 1 
24a1 : 85 26 __ STA WORK + 3 
24a3 : a9 00 __ LDA #$00
24a5 : 85 3b __ STA ACCU + 0 
24a7 : 85 3c __ STA ACCU + 1 
24a9 : 60 __ __ RTS
24aa : a5 24 __ LDA WORK + 1 
24ac : d0 1f __ BNE $24cd ; (divmod + 88)
24ae : a5 23 __ LDA WORK + 0 
24b0 : 30 1b __ BMI $24cd ; (divmod + 88)
24b2 : a9 00 __ LDA #$00
24b4 : 85 26 __ STA WORK + 3 
24b6 : a2 10 __ LDX #$10
24b8 : 06 3b __ ASL ACCU + 0 
24ba : 26 3c __ ROL ACCU + 1 
24bc : 2a __ __ ROL
24bd : c5 23 __ CMP WORK + 0 
24bf : 90 02 __ BCC $24c3 ; (divmod + 78)
24c1 : e5 23 __ SBC WORK + 0 
24c3 : 26 3b __ ROL ACCU + 0 
24c5 : 26 3c __ ROL ACCU + 1 
24c7 : ca __ __ DEX
24c8 : d0 f2 __ BNE $24bc ; (divmod + 71)
24ca : 85 25 __ STA WORK + 2 
24cc : 60 __ __ RTS
24cd : a9 00 __ LDA #$00
24cf : 85 25 __ STA WORK + 2 
24d1 : 85 26 __ STA WORK + 3 
24d3 : 84 22 __ STY $22 
24d5 : a0 10 __ LDY #$10
24d7 : 18 __ __ CLC
24d8 : 26 3b __ ROL ACCU + 0 
24da : 26 3c __ ROL ACCU + 1 
24dc : 26 25 __ ROL WORK + 2 
24de : 26 26 __ ROL WORK + 3 
24e0 : 38 __ __ SEC
24e1 : a5 25 __ LDA WORK + 2 
24e3 : e5 23 __ SBC WORK + 0 
24e5 : aa __ __ TAX
24e6 : a5 26 __ LDA WORK + 3 
24e8 : e5 24 __ SBC WORK + 1 
24ea : 90 04 __ BCC $24f0 ; (divmod + 123)
24ec : 86 25 __ STX WORK + 2 
24ee : 85 26 __ STA WORK + 3 
24f0 : 88 __ __ DEY
24f1 : d0 e5 __ BNE $24d8 ; (divmod + 99)
24f3 : 26 3b __ ROL ACCU + 0 
24f5 : 26 3c __ ROL ACCU + 1 
24f7 : a4 22 __ LDY $22 
24f9 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
24fa : 24 3c __ BIT ACCU + 1 
24fc : 10 0d __ BPL $250b ; (mods16 + 17)
24fe : 20 59 24 JSR $2459 ; (negaccu + 0)
2501 : 24 24 __ BIT WORK + 1 
2503 : 10 0d __ BPL $2512 ; (mods16 + 24)
2505 : 20 67 24 JSR $2467 ; (negtmp + 0)
2508 : 4c 75 24 JMP $2475 ; (divmod + 0)
250b : 24 24 __ BIT WORK + 1 
250d : 10 f9 __ BPL $2508 ; (mods16 + 14)
250f : 20 67 24 JSR $2467 ; (negtmp + 0)
2512 : 20 75 24 JSR $2475 ; (divmod + 0)
2515 : 38 __ __ SEC
2516 : a9 00 __ LDA #$00
2518 : e5 25 __ SBC WORK + 2 
251a : 85 25 __ STA WORK + 2 
251c : a9 00 __ LDA #$00
251e : e5 26 __ SBC WORK + 3 
2520 : 85 26 __ STA WORK + 3 
2522 : 60 __ __ RTS
--------------------------------------------------------------------
__multab32L:
2523 : __ __ __ BYT 00 20 40 60 80 a0 c0 e0 00 20 40 60 80 a0 c0 e0 : . @`..... @`....
--------------------------------------------------------------------
__multab32H:
2533 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 01 : ................
