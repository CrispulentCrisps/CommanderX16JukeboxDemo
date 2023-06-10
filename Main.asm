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
080e : 8e fd 21 STX $21fd ; (spentry + 0)
0811 : a9 eb __ LDA #$eb
0813 : 85 39 __ STA IP + 0 
0815 : a9 5b __ LDA #$5b
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 61 __ LDA #$61
081c : e9 5b __ SBC #$5b
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
0832 : e9 eb __ SBC #$eb
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
21fd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 30 0c JSR $0c30 ; (zsm_irq_init.s0 + 0)
0883 : 20 02 0e JSR $0e02 ; (ClearVERAScreen.s0 + 0)
0886 : 20 45 0e JSR $0e45 ; (SetUpSprites.s0 + 0)
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
08e8 : a9 1c __ LDA #$1c
08ea : 85 32 __ STA P5 
08ec : a9 47 __ LDA #$47
08ee : 85 33 __ STA P6 
08f0 : 20 d4 1a JSR $1ad4 ; (SetPaletteIndex.s0 + 0)
08f3 : a9 00 __ LDA #$00
08f5 : 85 50 __ STA T1 + 0 
08f7 : 85 51 __ STA T1 + 1 
08f9 : 85 52 __ STA T2 + 0 
08fb : 85 53 __ STA T3 + 0 
08fd : 85 54 __ STA T4 + 0 
.l3:
08ff : 20 87 1b JSR $1b87 ; (getchx.s0 + 0)
0902 : a5 3b __ LDA ACCU + 0 
0904 : 85 55 __ STA T5 + 0 
0906 : a9 30 __ LDA #$30
0908 : 8d 2c 9f STA $9f2c 
090b : ee fa 42 INC $42fa ; (p + 0)
090e : d0 03 __ BNE $0913 ; (main.s1024 + 0)
.s1023:
0910 : ee fb 42 INC $42fb ; (p + 1)
.s1024:
0913 : ad fc 42 LDA $42fc ; (Phase + 0)
0916 : 18 __ __ CLC
0917 : 69 01 __ ADC #$01
0919 : 85 32 __ STA P5 
091b : 8d fc 42 STA $42fc ; (Phase + 0)
091e : ad fd 42 LDA $42fd ; (Phase + 1)
0921 : 69 00 __ ADC #$00
0923 : 85 33 __ STA P6 
0925 : 8d fd 42 STA $42fd ; (Phase + 1)
0928 : ad fe 42 LDA $42fe ; (Phase2 + 0)
092b : 18 __ __ CLC
092c : 69 01 __ ADC #$01
092e : 85 34 __ STA P7 
0930 : 8d fe 42 STA $42fe ; (Phase2 + 0)
0933 : ad ff 42 LDA $42ff ; (Phase2 + 1)
0936 : 69 00 __ ADC #$00
0938 : 85 35 __ STA P8 
093a : 8d ff 42 STA $42ff ; (Phase2 + 1)
093d : ad 3c 47 LDA $473c ; (Phase3 + 0)
0940 : 18 __ __ CLC
0941 : 69 01 __ ADC #$01
0943 : 85 36 __ STA P9 
0945 : 8d 3c 47 STA $473c ; (Phase3 + 0)
0948 : ad 3d 47 LDA $473d ; (Phase3 + 1)
094b : 69 00 __ ADC #$00
094d : 85 37 __ STA P10 
094f : 8d 3d 47 STA $473d ; (Phase3 + 1)
0952 : 20 c2 1b JSR $1bc2 ; (MoveSprites.s0 + 0)
0955 : a5 53 __ LDA T3 + 0 
0957 : c9 01 __ CMP #$01
0959 : f0 07 __ BEQ $0962 ; (main.s5 + 0)
.s6:
095b : a9 00 __ LDA #$00
095d : 8d e2 47 STA $47e2 ; (PalTimer + 0)
0960 : f0 2b __ BEQ $098d ; (main.s81 + 0)
.s5:
0962 : a5 52 __ LDA T2 + 0 
0964 : 8d fc 9e STA $9efc ; (sstack + 2)
0967 : a9 00 __ LDA #$00
0969 : 8d fd 9e STA $9efd ; (sstack + 3)
096c : ad e1 47 LDA $47e1 ; (LastSelectedSong + 0)
096f : 8d fe 9e STA $9efe ; (sstack + 4)
0972 : a9 00 __ LDA #$00
0974 : 8d ff 9e STA $9eff ; (sstack + 5)
0977 : 20 bd 1d JSR $1dbd ; (PlayZSM.s0 + 0)
097a : a5 52 __ LDA T2 + 0 
097c : 8d e1 47 STA $47e1 ; (LastSelectedSong + 0)
097f : ad e2 47 LDA $47e2 ; (PalTimer + 0)
0982 : 18 __ __ CLC
0983 : 69 01 __ ADC #$01
0985 : 8d e2 47 STA $47e2 ; (PalTimer + 0)
0988 : ad e3 47 LDA $47e3 ; (PalTimer + 1)
098b : 69 00 __ ADC #$00
.s81:
098d : 8d e3 47 STA $47e3 ; (PalTimer + 1)
0990 : e6 54 __ INC T4 + 0 
0992 : a5 54 __ LDA T4 + 0 
0994 : c9 03 __ CMP #$03
0996 : 90 2d __ BCC $09c5 ; (main.s82 + 0)
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
09b6 : a9 a3 __ LDA #$a3
09b8 : 85 32 __ STA P5 
09ba : a9 2d __ LDA #$2d
09bc : 85 33 __ STA P6 
09be : 20 d4 1a JSR $1ad4 ; (SetPaletteIndex.s0 + 0)
09c1 : a9 00 __ LDA #$00
09c3 : 85 54 __ STA T4 + 0 
.s82:
09c5 : ad e3 47 LDA $47e3 ; (PalTimer + 1)
09c8 : 30 5f __ BMI $0a29 ; (main.s13 + 0)
.s1017:
09ca : d0 07 __ BNE $09d3 ; (main.s11 + 0)
.s1016:
09cc : a9 03 __ LDA #$03
09ce : cd e2 47 CMP $47e2 ; (PalTimer + 0)
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
09ef : ee e4 47 INC $47e4 ; (PalIndex + 0)
09f2 : d0 03 __ BNE $09f7 ; (main.s1026 + 0)
.s1025:
09f4 : ee e5 47 INC $47e5 ; (PalIndex + 1)
.s1026:
09f7 : a9 a0 __ LDA #$a0
09f9 : 85 32 __ STA P5 
09fb : a9 42 __ LDA #$42
09fd : 85 33 __ STA P6 
09ff : 20 d4 1a JSR $1ad4 ; (SetPaletteIndex.s0 + 0)
0a02 : a9 50 __ LDA #$50
0a04 : 85 34 __ STA P7 
0a06 : a9 00 __ LDA #$00
0a08 : 8d fa 9e STA $9efa ; (sstack + 0)
0a0b : 8d fb 9e STA $9efb ; (sstack + 1)
0a0e : 8d fd 9e STA $9efd ; (sstack + 3)
0a11 : a9 10 __ LDA #$10
0a13 : 8d fc 9e STA $9efc ; (sstack + 2)
0a16 : a9 1c __ LDA #$1c
0a18 : 85 32 __ STA P5 
0a1a : a9 47 __ LDA #$47
0a1c : 85 33 __ STA P6 
0a1e : 20 d4 1a JSR $1ad4 ; (SetPaletteIndex.s0 + 0)
0a21 : a9 00 __ LDA #$00
0a23 : 8d e2 47 STA $47e2 ; (PalTimer + 0)
0a26 : 8d e3 47 STA $47e3 ; (PalTimer + 1)
.s13:
0a29 : a9 03 __ LDA #$03
0a2b : 8d 2c 9f STA $9f2c 
0a2e : a5 55 __ LDA T5 + 0 
0a30 : c9 44 __ CMP #$44
0a32 : d0 0c __ BNE $0a40 ; (main.s15 + 0)
.s17:
0a34 : a5 52 __ LDA T2 + 0 
0a36 : cd e6 47 CMP $47e6 ; (MaxSong + 0)
0a39 : b0 03 __ BCS $0a3e ; (main.s1022 + 0)
0a3b : 4c 2b 0c JMP $0c2b ; (main.s14 + 0)
.s1022:
0a3e : a5 55 __ LDA T5 + 0 
.s15:
0a40 : c9 41 __ CMP #$41
0a42 : d0 21 __ BNE $0a65 ; (main.s16 + 0)
.s21:
0a44 : a5 52 __ LDA T2 + 0 
0a46 : f0 1d __ BEQ $0a65 ; (main.s16 + 0)
.s18:
0a48 : c6 52 __ DEC T2 + 0 
.s97:
0a4a : 20 1f 23 JSR $231f ; (ResetChars.s0 + 0)
0a4d : a9 00 __ LDA #$00
0a4f : 8d e7 47 STA $47e7 ; (off1 + 0)
0a52 : 8d e8 47 STA $47e8 ; (off1 + 1)
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
0a6d : 20 44 23 JSR $2344 ; (Control.s0 + 0)
0a70 : a5 3b __ LDA ACCU + 0 
0a72 : 85 53 __ STA T3 + 0 
0a74 : 38 __ __ SEC
0a75 : a5 50 __ LDA T1 + 0 
0a77 : e9 80 __ SBC #$80
0a79 : 8d 37 9f STA $9f37 
0a7c : a5 51 __ LDA T1 + 1 
0a7e : e9 02 __ SBC #$02
0a80 : 8d 38 9f STA $9f38 
0a83 : 20 ba 23 JSR $23ba ; (UpdateVolume.s0 + 0)
0a86 : ad 3e 47 LDA $473e ; (FrameCount + 0)
0a89 : 85 3b __ STA ACCU + 0 
0a8b : ad 3f 47 LDA $473f ; (FrameCount + 1)
0a8e : 85 3c __ STA ACCU + 1 
0a90 : a9 08 __ LDA #$08
0a92 : 85 23 __ STA WORK + 0 
0a94 : a9 00 __ LDA #$00
0a96 : 85 24 __ STA WORK + 1 
0a98 : 20 2f 26 JSR $262f ; (mods16 + 0)
0a9b : a5 26 __ LDA WORK + 3 
0a9d : f0 03 __ BEQ $0aa2 ; (main.s1009 + 0)
0a9f : 4c 7c 0b JMP $0b7c ; (main.s24 + 0)
.s1009:
0aa2 : a5 25 __ LDA WORK + 2 
0aa4 : c9 01 __ CMP #$01
0aa6 : f0 03 __ BEQ $0aab ; (main.s22 + 0)
0aa8 : 4c 7c 0b JMP $0b7c ; (main.s24 + 0)
.s22:
0aab : ad e7 47 LDA $47e7 ; (off1 + 0)
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
0aca : c9 04 __ CMP #$04
0acc : d0 1c __ BNE $0aea ; (main.s1007 + 0)
.s47:
0ace : a5 55 __ LDA T5 + 0 
0ad0 : 85 3b __ STA ACCU + 0 
0ad2 : ad e8 47 LDA $47e8 ; (off1 + 1)
0ad5 : 85 3c __ STA ACCU + 1 
0ad7 : a9 bd __ LDA #$bd
0ad9 : 85 23 __ STA WORK + 0 
0adb : a9 00 __ LDA #$00
0add : 85 24 __ STA WORK + 1 
0adf : 20 aa 25 JSR $25aa ; (divmod + 0)
0ae2 : a6 25 __ LDX WORK + 2 
0ae4 : bd 00 59 LDA $5900,x ; (Song4 + 0)
0ae7 : 4c 38 0b JMP $0b38 ; (main.s87 + 0)
.s1007:
0aea : b0 03 __ BCS $0aef ; (main.s1003 + 0)
0aec : 4c a0 0b JMP $0ba0 ; (main.s64 + 0)
.s1003:
0aef : c9 05 __ CMP #$05
0af1 : d0 1c __ BNE $0b0f ; (main.s1002 + 0)
.s52:
0af3 : a5 55 __ LDA T5 + 0 
0af5 : 85 3b __ STA ACCU + 0 
0af7 : ad e8 47 LDA $47e8 ; (off1 + 1)
0afa : 85 3c __ STA ACCU + 1 
0afc : a9 92 __ LDA #$92
0afe : 85 23 __ STA WORK + 0 
0b00 : a9 00 __ LDA #$00
0b02 : 85 24 __ STA WORK + 1 
0b04 : 20 aa 25 JSR $25aa ; (divmod + 0)
0b07 : a6 25 __ LDX WORK + 2 
0b09 : bd 00 5a LDA $5a00,x ; (Song5 + 0)
0b0c : 4c 38 0b JMP $0b38 ; (main.s87 + 0)
.s1002:
0b0f : c9 06 __ CMP #$06
0b11 : d0 35 __ BNE $0b48 ; (main.s26 + 0)
.s57:
0b13 : a5 55 __ LDA T5 + 0 
0b15 : 85 3b __ STA ACCU + 0 
0b17 : ad e8 47 LDA $47e8 ; (off1 + 1)
0b1a : 85 3c __ STA ACCU + 1 
0b1c : a9 57 __ LDA #$57
0b1e : 85 23 __ STA WORK + 0 
0b20 : a9 01 __ LDA #$01
0b22 : 85 24 __ STA WORK + 1 
0b24 : 20 aa 25 JSR $25aa ; (divmod + 0)
0b27 : 18 __ __ CLC
0b28 : a9 93 __ LDA #$93
0b2a : 65 25 __ ADC WORK + 2 
0b2c : 85 47 __ STA T6 + 0 
0b2e : a9 5a __ LDA #$5a
.s1021:
0b30 : 65 26 __ ADC WORK + 3 
0b32 : 85 48 __ STA T6 + 1 
0b34 : a0 00 __ LDY #$00
0b36 : b1 47 __ LDA (T6 + 0),y 
.s87:
0b38 : 09 00 __ ORA #$00
0b3a : f0 0c __ BEQ $0b48 ; (main.s26 + 0)
.s28:
0b3c : 8d 23 9f STA $9f23 
0b3f : a5 55 __ LDA T5 + 0 
0b41 : 29 0f __ AND #$0f
0b43 : 09 80 __ ORA #$80
0b45 : 8d 23 9f STA $9f23 
.s26:
0b48 : a9 80 __ LDA #$80
0b4a : 85 34 __ STA P7 
0b4c : a9 00 __ LDA #$00
0b4e : 85 35 __ STA P8 
0b50 : 85 36 __ STA P9 
0b52 : 85 37 __ STA P10 
0b54 : 8d fa 9e STA $9efa ; (sstack + 0)
0b57 : 8d fb 9e STA $9efb ; (sstack + 1)
0b5a : a9 10 __ LDA #$10
0b5c : 8d fc 9e STA $9efc ; (sstack + 2)
0b5f : a9 00 __ LDA #$00
0b61 : 8d fd 9e STA $9efd ; (sstack + 3)
0b64 : 18 __ __ CLC
0b65 : a5 55 __ LDA T5 + 0 
0b67 : 69 01 __ ADC #$01
0b69 : 8d e7 47 STA $47e7 ; (off1 + 0)
0b6c : 90 03 __ BCC $0b71 ; (main.s1028 + 0)
.s1027:
0b6e : ee e8 47 INC $47e8 ; (off1 + 1)
.s1028:
0b71 : a9 c0 __ LDA #$c0
0b73 : 85 32 __ STA P5 
0b75 : a9 42 __ LDA #$42
0b77 : 85 33 __ STA P6 
0b79 : 20 d4 1a JSR $1ad4 ; (SetPaletteIndex.s0 + 0)
.s24:
0b7c : a9 01 __ LDA #$01
0b7e : 8d 2c 9f STA $9f2c 
0b81 : 20 d3 20 JSR $20d3 ; (zsm_fill.s0 + 0)
0b84 : a9 00 __ LDA #$00
0b86 : 8d 2c 9f STA $9f2c 
0b89 : 20 f3 22 JSR $22f3 ; (frame_wait.l1 + 0)
0b8c : ee 3e 47 INC $473e ; (FrameCount + 0)
0b8f : d0 03 __ BNE $0b94 ; (main.s1030 + 0)
.s1029:
0b91 : ee 3f 47 INC $473f ; (FrameCount + 1)
.s1030:
0b94 : e6 50 __ INC T1 + 0 
0b96 : f0 03 __ BEQ $0b9b ; (main.s1031 + 0)
0b98 : 4c ff 08 JMP $08ff ; (main.l3 + 0)
.s1031:
0b9b : e6 51 __ INC T1 + 1 
0b9d : 4c ff 08 JMP $08ff ; (main.l3 + 0)
.s64:
0ba0 : 09 00 __ ORA #$00
0ba2 : d0 20 __ BNE $0bc4 ; (main.s1006 + 0)
.s27:
0ba4 : a5 55 __ LDA T5 + 0 
0ba6 : 85 3b __ STA ACCU + 0 
0ba8 : ad e8 47 LDA $47e8 ; (off1 + 1)
0bab : 85 3c __ STA ACCU + 1 
0bad : a9 1d __ LDA #$1d
0baf : 85 23 __ STA WORK + 0 
0bb1 : a9 06 __ LDA #$06
0bb3 : 85 24 __ STA WORK + 1 
0bb5 : 20 aa 25 JSR $25aa ; (divmod + 0)
0bb8 : 18 __ __ CLC
0bb9 : a9 00 __ LDA #$00
0bbb : 65 25 __ ADC WORK + 2 
0bbd : 85 47 __ STA T6 + 0 
0bbf : a9 49 __ LDA #$49
0bc1 : 4c 30 0b JMP $0b30 ; (main.s1021 + 0)
.s1006:
0bc4 : c9 01 __ CMP #$01
0bc6 : d0 20 __ BNE $0be8 ; (main.s1005 + 0)
.s32:
0bc8 : a5 55 __ LDA T5 + 0 
0bca : 85 3b __ STA ACCU + 0 
0bcc : ad e8 47 LDA $47e8 ; (off1 + 1)
0bcf : 85 3c __ STA ACCU + 1 
0bd1 : a9 5c __ LDA #$5c
0bd3 : 85 23 __ STA WORK + 0 
0bd5 : a9 07 __ LDA #$07
0bd7 : 85 24 __ STA WORK + 1 
0bd9 : 20 aa 25 JSR $25aa ; (divmod + 0)
0bdc : 18 __ __ CLC
0bdd : a9 1e __ LDA #$1e
0bdf : 65 25 __ ADC WORK + 2 
0be1 : 85 47 __ STA T6 + 0 
0be3 : a9 4f __ LDA #$4f
0be5 : 4c 30 0b JMP $0b30 ; (main.s1021 + 0)
.s1005:
0be8 : c9 02 __ CMP #$02
0bea : d0 1c __ BNE $0c08 ; (main.s1004 + 0)
.s37:
0bec : a5 55 __ LDA T5 + 0 
0bee : 85 3b __ STA ACCU + 0 
0bf0 : ad e8 47 LDA $47e8 ; (off1 + 1)
0bf3 : 85 3c __ STA ACCU + 1 
0bf5 : a9 c5 __ LDA #$c5
0bf7 : 85 23 __ STA WORK + 0 
0bf9 : a9 00 __ LDA #$00
0bfb : 85 24 __ STA WORK + 1 
0bfd : 20 aa 25 JSR $25aa ; (divmod + 0)
0c00 : a6 25 __ LDX WORK + 2 
0c02 : bd 00 57 LDA $5700,x ; (Song2 + 0)
0c05 : 4c 38 0b JMP $0b38 ; (main.s87 + 0)
.s1004:
0c08 : c9 03 __ CMP #$03
0c0a : f0 03 __ BEQ $0c0f ; (main.s42 + 0)
0c0c : 4c 48 0b JMP $0b48 ; (main.s26 + 0)
.s42:
0c0f : a5 55 __ LDA T5 + 0 
0c11 : 85 3b __ STA ACCU + 0 
0c13 : ad e8 47 LDA $47e8 ; (off1 + 1)
0c16 : 85 3c __ STA ACCU + 1 
0c18 : a9 c3 __ LDA #$c3
0c1a : 85 23 __ STA WORK + 0 
0c1c : a9 00 __ LDA #$00
0c1e : 85 24 __ STA WORK + 1 
0c20 : 20 aa 25 JSR $25aa ; (divmod + 0)
0c23 : a6 25 __ LDX WORK + 2 
0c25 : bd 00 58 LDA $5800,x ; (Song3 + 0)
0c28 : 4c 38 0b JMP $0b38 ; (main.s87 + 0)
.s14:
0c2b : e6 52 __ INC T2 + 0 
0c2d : 4c 4a 0a JMP $0a4a ; (main.s97 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0c30 : 78 __ __ SEI
0c31 : ad 14 03 LDA $0314 
0c34 : 8d ea 47 STA $47ea ; (oirq + 0)
0c37 : ad 15 03 LDA $0315 
0c3a : 8d eb 47 STA $47eb ; (oirq + 1)
0c3d : a9 49 __ LDA #$49
0c3f : 8d 14 03 STA $0314 
0c42 : a9 0c __ LDA #$0c
0c44 : 8d 15 03 STA $0315 
0c47 : 58 __ __ CLI
.s1001:
0c48 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
47ea : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c49 : 20 4f 0c JSR $0c4f ; (irq.s1000 + 0)
0c4c : 6c ea 47 JMP ($47ea)
--------------------------------------------------------------------
irq:
.s1000:
0c4f : a5 2d __ LDA P0 
0c51 : 48 __ __ PHA
0c52 : a5 2e __ LDA P1 
0c54 : 48 __ __ PHA
0c55 : a5 3b __ LDA ACCU + 0 
0c57 : 48 __ __ PHA
0c58 : a5 3c __ LDA ACCU + 1 
0c5a : 48 __ __ PHA
0c5b : a5 47 __ LDA T0 + 0 
0c5d : 48 __ __ PHA
0c5e : a5 48 __ LDA $48 
0c60 : 48 __ __ PHA
0c61 : a5 49 __ LDA $49 
0c63 : 48 __ __ PHA
0c64 : a5 4a __ LDA $4a 
0c66 : 48 __ __ PHA
0c67 : a5 4b __ LDA $4b 
0c69 : 48 __ __ PHA
0c6a : a5 4c __ LDA $4c 
0c6c : 48 __ __ PHA
0c6d : a5 4d __ LDA $4d 
0c6f : 48 __ __ PHA
0c70 : a5 4e __ LDA $4e 
0c72 : 48 __ __ PHA
0c73 : a5 4f __ LDA $4f 
0c75 : 48 __ __ PHA
0c76 : a5 50 __ LDA $50 
0c78 : 48 __ __ PHA
.s0:
0c79 : ad fe 21 LDA $21fe ; (zsm_playing + 0)
0c7c : f0 08 __ BEQ $0c86 ; (irq.s1001 + 0)
.s4:
0c7e : ad ff 21 LDA $21ff ; (zsm_finished + 0)
0c81 : d0 03 __ BNE $0c86 ; (irq.s1001 + 0)
.s1:
0c83 : 20 b1 0c JSR $0cb1 ; (zsm_play.s0 + 0)
.s1001:
0c86 : 68 __ __ PLA
0c87 : 85 50 __ STA $50 
0c89 : 68 __ __ PLA
0c8a : 85 4f __ STA $4f 
0c8c : 68 __ __ PLA
0c8d : 85 4e __ STA $4e 
0c8f : 68 __ __ PLA
0c90 : 85 4d __ STA $4d 
0c92 : 68 __ __ PLA
0c93 : 85 4c __ STA $4c 
0c95 : 68 __ __ PLA
0c96 : 85 4b __ STA $4b 
0c98 : 68 __ __ PLA
0c99 : 85 4a __ STA $4a 
0c9b : 68 __ __ PLA
0c9c : 85 49 __ STA $49 
0c9e : 68 __ __ PLA
0c9f : 85 48 __ STA $48 
0ca1 : 68 __ __ PLA
0ca2 : 85 47 __ STA T0 + 0 
0ca4 : 68 __ __ PLA
0ca5 : 85 3c __ STA ACCU + 1 
0ca7 : 68 __ __ PLA
0ca8 : 85 3b __ STA ACCU + 0 
0caa : 68 __ __ PLA
0cab : 85 2e __ STA P1 
0cad : 68 __ __ PLA
0cae : 85 2d __ STA P0 
0cb0 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
21fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
21ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0cb1 : ad 78 26 LDA $2678 ; (zsm_paused + 0)
0cb4 : f0 01 __ BEQ $0cb7 ; (zsm_play.s2 + 0)
0cb6 : 60 __ __ RTS
.s2:
0cb7 : ad ec 47 LDA $47ec ; (zsm_delay + 0)
0cba : f0 03 __ BEQ $0cbf ; (zsm_play.s5 + 0)
0cbc : 4c da 0d JMP $0dda ; (zsm_play.s4 + 0)
.s5:
0cbf : ad 25 9f LDA $9f25 
0cc2 : 85 47 __ STA T0 + 0 
0cc4 : ad 25 9f LDA $9f25 
0cc7 : 29 fe __ AND #$fe
0cc9 : 8d 25 9f STA $9f25 
0ccc : ad 20 9f LDA $9f20 
0ccf : 85 49 __ STA T2 + 0 
0cd1 : ad 21 9f LDA $9f21 
0cd4 : 85 4a __ STA T2 + 1 
0cd6 : ad 22 9f LDA $9f22 
0cd9 : 85 48 __ STA T1 + 0 
.l8:
0cdb : ad ed 47 LDA $47ed ; (zsm_pos + 0)
0cde : 85 3b __ STA ACCU + 0 
0ce0 : aa __ __ TAX
0ce1 : 18 __ __ CLC
0ce2 : 69 01 __ ADC #$01
0ce4 : 85 4d __ STA T4 + 0 
0ce6 : 8d ed 47 STA $47ed ; (zsm_pos + 0)
0ce9 : ad ee 47 LDA $47ee ; (zsm_pos + 1)
0cec : 85 4c __ STA T3 + 1 
0cee : 69 00 __ ADC #$00
0cf0 : 85 4e __ STA T4 + 1 
0cf2 : 8d ee 47 STA $47ee ; (zsm_pos + 1)
0cf5 : a5 4c __ LDA T3 + 1 
0cf7 : 29 03 __ AND #$03
0cf9 : 18 __ __ CLC
0cfa : 69 5c __ ADC #$5c
0cfc : 85 3c __ STA ACCU + 1 
0cfe : a0 00 __ LDY #$00
0d00 : b1 3b __ LDA (ACCU + 0),y 
0d02 : c9 40 __ CMP #$40
0d04 : b0 33 __ BCS $0d39 ; (zsm_play.s12 + 0)
.s11:
0d06 : 29 3f __ AND #$3f
0d08 : 09 c0 __ ORA #$c0
0d0a : 8d 20 9f STA $9f20 
0d0d : a9 f9 __ LDA #$f9
0d0f : 8d 21 9f STA $9f21 
0d12 : a9 01 __ LDA #$01
0d14 : 8d 22 9f STA $9f22 
0d17 : 8a __ __ TXA
0d18 : 69 02 __ ADC #$02
0d1a : 8d ed 47 STA $47ed ; (zsm_pos + 0)
0d1d : a5 4c __ LDA T3 + 1 
0d1f : 69 00 __ ADC #$00
0d21 : 8d ee 47 STA $47ee ; (zsm_pos + 1)
0d24 : a5 4d __ LDA T4 + 0 
0d26 : 85 4b __ STA T3 + 0 
0d28 : a5 4e __ LDA T4 + 1 
0d2a : 29 03 __ AND #$03
0d2c : 18 __ __ CLC
0d2d : 69 5c __ ADC #$5c
0d2f : 85 4c __ STA T3 + 1 
0d31 : b1 4b __ LDA (T3 + 0),y 
0d33 : 8d 23 9f STA $9f23 
0d36 : 4c db 0c JMP $0cdb ; (zsm_play.l8 + 0)
.s12:
0d39 : d0 20 __ BNE $0d5b ; (zsm_play.s15 + 0)
.s14:
0d3b : a5 4d __ LDA T4 + 0 
0d3d : 85 4b __ STA T3 + 0 
0d3f : a5 4e __ LDA T4 + 1 
0d41 : 29 03 __ AND #$03
0d43 : 18 __ __ CLC
0d44 : 69 5c __ ADC #$5c
0d46 : 85 4c __ STA T3 + 1 
0d48 : b1 4b __ LDA (T3 + 0),y 
0d4a : 29 3f __ AND #$3f
0d4c : 18 __ __ CLC
0d4d : 65 4d __ ADC T4 + 0 
0d4f : 8d ed 47 STA $47ed ; (zsm_pos + 0)
0d52 : 98 __ __ TYA
0d53 : 65 4e __ ADC T4 + 1 
0d55 : 8d ee 47 STA $47ee ; (zsm_pos + 1)
0d58 : 4c db 0c JMP $0cdb ; (zsm_play.l8 + 0)
.s15:
0d5b : 09 00 __ ORA #$00
0d5d : 30 53 __ BMI $0db2 ; (zsm_play.s18 + 0)
.s17:
0d5f : 29 3f __ AND #$3f
0d61 : d0 03 __ BNE $0d66 ; (zsm_play.s29 + 0)
0d63 : 4c db 0c JMP $0cdb ; (zsm_play.l8 + 0)
.s29:
0d66 : 84 50 __ STY T7 + 0 
0d68 : 85 4f __ STA T6 + 0 
0d6a : 18 __ __ CLC
.l1012:
0d6b : ad ed 47 LDA $47ed ; (zsm_pos + 0)
0d6e : 85 4d __ STA T4 + 0 
0d70 : ad ee 47 LDA $47ee ; (zsm_pos + 1)
0d73 : 29 03 __ AND #$03
0d75 : 69 5c __ ADC #$5c
0d77 : 85 4e __ STA T4 + 1 
0d79 : a0 00 __ LDY #$00
0d7b : b1 4d __ LDA (T4 + 0),y 
0d7d : 85 2d __ STA P0 
0d7f : 18 __ __ CLC
0d80 : a5 4d __ LDA T4 + 0 
0d82 : 69 01 __ ADC #$01
0d84 : 85 4b __ STA T3 + 0 
0d86 : ad ee 47 LDA $47ee ; (zsm_pos + 1)
0d89 : 69 00 __ ADC #$00
0d8b : 29 03 __ AND #$03
0d8d : 18 __ __ CLC
0d8e : 69 5c __ ADC #$5c
0d90 : 85 4c __ STA T3 + 1 
0d92 : b1 4b __ LDA (T3 + 0),y 
0d94 : 85 2e __ STA P1 
0d96 : 20 de 0d JSR $0dde ; (sfx_put.s1 + 0)
0d99 : ad ed 47 LDA $47ed ; (zsm_pos + 0)
0d9c : 18 __ __ CLC
0d9d : 69 02 __ ADC #$02
0d9f : 8d ed 47 STA $47ed ; (zsm_pos + 0)
0da2 : 90 03 __ BCC $0da7 ; (zsm_play.s1015 + 0)
.s1014:
0da4 : ee ee 47 INC $47ee ; (zsm_pos + 1)
.s1015:
0da7 : e6 50 __ INC T7 + 0 
0da9 : a5 50 __ LDA T7 + 0 
0dab : c5 4f __ CMP T6 + 0 
0dad : 90 bc __ BCC $0d6b ; (zsm_play.l1012 + 0)
0daf : 4c db 0c JMP $0cdb ; (zsm_play.l8 + 0)
.s18:
0db2 : c9 80 __ CMP #$80
0db4 : d0 07 __ BNE $0dbd ; (zsm_play.s25 + 0)
.s24:
0db6 : a9 01 __ LDA #$01
0db8 : 8d ff 21 STA $21ff ; (zsm_finished + 0)
0dbb : d0 08 __ BNE $0dc5 ; (zsm_play.s10 + 0)
.s25:
0dbd : 29 7f __ AND #$7f
0dbf : 38 __ __ SEC
0dc0 : e9 01 __ SBC #$01
0dc2 : 8d ec 47 STA $47ec ; (zsm_delay + 0)
.s10:
0dc5 : a5 49 __ LDA T2 + 0 
0dc7 : 8d 20 9f STA $9f20 
0dca : a5 4a __ LDA T2 + 1 
0dcc : 8d 21 9f STA $9f21 
0dcf : a5 48 __ LDA T1 + 0 
0dd1 : 8d 22 9f STA $9f22 
0dd4 : a5 47 __ LDA T0 + 0 
0dd6 : 8d 25 9f STA $9f25 
.s1001:
0dd9 : 60 __ __ RTS
.s4:
0dda : ce ec 47 DEC $47ec ; (zsm_delay + 0)
0ddd : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
2678 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
47ec : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
5c00 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
47ed : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.s1:
0dde : a6 2e __ LDX P1 ; (data + 0)
.l1004:
0de0 : ad 41 9f LDA $9f41 
0de3 : 30 fb __ BMI $0de0 ; (sfx_put.l1004 + 0)
.s1005:
0de5 : 8a __ __ TXA
0de6 : a4 2d __ LDY P0 ; (index + 0)
0de8 : 8c 40 9f STY $9f40 
0deb : 99 00 60 STA $6000,y ; (vera_fm_s_regs + 0)
0dee : c0 08 __ CPY #$08
0df0 : d0 07 __ BNE $0df9 ; (sfx_put.l7 + 0)
.s4:
0df2 : 29 07 __ AND #$07
0df4 : a8 __ __ TAY
0df5 : 8a __ __ TXA
0df6 : 99 ef 47 STA $47ef,y ; (vera_fm_gate + 0)
.l7:
0df9 : ad 41 9f LDA $9f41 
0dfc : 30 fb __ BMI $0df9 ; (sfx_put.l7 + 0)
.s9:
0dfe : 8e 41 9f STX $9f41 
.s1001:
0e01 : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
6000 : __ __ __ BSS	256
--------------------------------------------------------------------
vera_fm_gate:
47ef : __ __ __ BSS	8
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0e02 : a9 93 __ LDA #$93
0e04 : 85 2d __ STA P0 
0e06 : a9 00 __ LDA #$00
0e08 : 85 2e __ STA P1 
0e0a : 20 3f 0e JSR $0e3f ; (putch.s0 + 0)
0e0d : a9 11 __ LDA #$11
0e0f : 8d 22 9f STA $9f22 
0e12 : a2 00 __ LDX #$00
.l2:
0e14 : 8a __ __ TXA
0e15 : 18 __ __ CLC
0e16 : 69 b0 __ ADC #$b0
0e18 : 8d 21 9f STA $9f21 
0e1b : a9 00 __ LDA #$00
0e1d : 8d 20 9f STA $9f20 
0e20 : a0 80 __ LDY #$80
.l1003:
0e22 : a9 20 __ LDA #$20
0e24 : 8d 23 9f STA $9f23 
0e27 : a9 01 __ LDA #$01
0e29 : 8d 23 9f STA $9f23 
0e2c : a9 20 __ LDA #$20
0e2e : 8d 24 9f STA $9f24 
0e31 : a9 01 __ LDA #$01
0e33 : 8d 24 9f STA $9f24 
0e36 : 88 __ __ DEY
0e37 : d0 e9 __ BNE $0e22 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0e39 : e8 __ __ INX
0e3a : e0 40 __ CPX #$40
0e3c : 90 d6 __ BCC $0e14 ; (ClearVERAScreen.l2 + 0)
.s1001:
0e3e : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0e3f : a5 2d __ LDA P0 
0e41 : 20 d2 ff JSR $ffd2 
.s1001:
0e44 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e45 : a9 40 __ LDA #$40
0e47 : 8d 79 26 STA $2679 ; (VolAddr + 0)
0e4a : a9 57 __ LDA #$57
0e4c : 8d 7a 26 STA $267a ; (VolAddr + 1)
0e4f : a9 01 __ LDA #$01
0e51 : 8d 7b 26 STA $267b ; (VolAddr + 2)
0e54 : 8d 7f 26 STA $267f ; (IndAddr + 2)
0e57 : a9 00 __ LDA #$00
0e59 : 8d 7c 26 STA $267c ; (VolAddr + 3)
0e5c : 8d 7d 26 STA $267d ; (IndAddr + 0)
0e5f : 8d 80 26 STA $2680 ; (IndAddr + 3)
0e62 : a9 31 __ LDA #$31
0e64 : 8d 7e 26 STA $267e ; (IndAddr + 1)
0e67 : a9 00 __ LDA #$00
0e69 : 8d 25 9f STA $9f25 
0e6c : a9 80 __ LDA #$80
0e6e : 8d 2b 9f STA $9f2b 
0e71 : 8d 2a 9f STA $9f2a 
0e74 : a9 62 __ LDA #$62
0e76 : 8d 2d 9f STA $9f2d 
0e79 : a9 68 __ LDA #$68
0e7b : 8d 34 9f STA $9f34 
0e7e : a9 00 __ LDA #$00
0e80 : 85 2d __ STA P0 
0e82 : 85 2e __ STA P1 
0e84 : 85 2f __ STA P2 
0e86 : 85 30 __ STA P3 
0e88 : 85 31 __ STA P4 
0e8a : 20 2f 18 JSR $182f ; (tileBaseConfig.s0 + 0)
0e8d : 8d 2f 9f STA $9f2f 
0e90 : a9 00 __ LDA #$00
0e92 : 85 2d __ STA P0 
0e94 : a9 20 __ LDA #$20
0e96 : 85 2f __ STA P2 
0e98 : 20 47 18 JSR $1847 ; (memoryToMapMemoryAddress.s0 + 0)
0e9b : 8d 2e 9f STA $9f2e 
0e9e : a9 01 __ LDA #$01
0ea0 : 8d 22 9f STA $9f22 
0ea3 : a2 80 __ LDX #$80
.l6:
0ea5 : a0 50 __ LDY #$50
.l1071:
0ea7 : a9 00 __ LDA #$00
0ea9 : 8d 24 9f STA $9f24 
0eac : a9 08 __ LDA #$08
0eae : 8d 24 9f STA $9f24 
0eb1 : 88 __ __ DEY
0eb2 : d0 f3 __ BNE $0ea7 ; (SetUpSprites.l1071 + 0)
.s1072:
0eb4 : ca __ __ DEX
0eb5 : d0 ee __ BNE $0ea5 ; (SetUpSprites.l6 + 0)
.s4:
0eb7 : 86 4c __ STX T1 + 0 
0eb9 : a9 00 __ LDA #$00
0ebb : 85 2d __ STA P0 
0ebd : 85 2e __ STA P1 
0ebf : 85 2f __ STA P2 
0ec1 : 85 30 __ STA P3 
0ec3 : a9 20 __ LDA #$20
0ec5 : 85 33 __ STA P6 
0ec7 : a9 03 __ LDA #$03
0ec9 : 85 34 __ STA P7 
0ecb : a9 81 __ LDA #$81
0ecd : 85 31 __ STA P4 
0ecf : a9 26 __ LDA #$26
0ed1 : 85 32 __ STA P5 
0ed3 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
0ed6 : a9 10 __ LDA #$10
0ed8 : 8d 22 9f STA $9f22 
0edb : a9 00 __ LDA #$00
0edd : 8d 20 9f STA $9f20 
0ee0 : a9 20 __ LDA #$20
0ee2 : 8d 21 9f STA $9f21 
.l10:
0ee5 : a9 00 __ LDA #$00
0ee7 : 85 4d __ STA T2 + 0 
.l14:
0ee9 : 20 8f 18 JSR $188f ; (rand.s0 + 0)
0eec : a9 31 __ LDA #$31
0eee : 85 23 __ STA WORK + 0 
0ef0 : a9 00 __ LDA #$00
0ef2 : 85 24 __ STA WORK + 1 
0ef4 : 20 aa 25 JSR $25aa ; (divmod + 0)
0ef7 : a5 4c __ LDA T1 + 0 
0ef9 : d0 03 __ BNE $0efe ; (SetUpSprites.s1041 + 0)
0efb : 4c e1 0f JMP $0fe1 ; (SetUpSprites.s1037 + 0)
.s1041:
0efe : a9 10 __ LDA #$10
0f00 : c5 4c __ CMP T1 + 0 
0f02 : a9 00 __ LDA #$00
0f04 : 2a __ __ ROL
0f05 : d0 03 __ BNE $0f0a ; (SetUpSprites.s1069 + 0)
0f07 : 4c e1 0f JMP $0fe1 ; (SetUpSprites.s1037 + 0)
.s1069:
0f0a : a8 __ __ TAY
0f0b : a5 4d __ LDA T2 + 0 
0f0d : f0 06 __ BEQ $0f15 ; (SetUpSprites.s26 + 0)
.s1068:
0f0f : a9 10 __ LDA #$10
0f11 : c5 4d __ CMP T2 + 0 
0f13 : b0 18 __ BCS $0f2d ; (SetUpSprites.s1065 + 0)
.s26:
0f15 : 98 __ __ TYA
0f16 : d0 03 __ BNE $0f1b ; (SetUpSprites.s1067 + 0)
0f18 : 4c e1 0f JMP $0fe1 ; (SetUpSprites.s1037 + 0)
.s1067:
0f1b : a5 4d __ LDA T2 + 0 
0f1d : c9 3e __ CMP #$3e
0f1f : b0 03 __ BCS $0f24 ; (SetUpSprites.s1066 + 0)
0f21 : 4c e1 0f JMP $0fe1 ; (SetUpSprites.s1037 + 0)
.s1066:
0f24 : a9 4e __ LDA #$4e
0f26 : c5 4d __ CMP T2 + 0 
0f28 : b0 03 __ BCS $0f2d ; (SetUpSprites.s1065 + 0)
0f2a : 4c e1 0f JMP $0fe1 ; (SetUpSprites.s1037 + 0)
.s1065:
0f2d : a5 4c __ LDA T1 + 0 
0f2f : c9 01 __ CMP #$01
0f31 : f0 79 __ BEQ $0fac ; (SetUpSprites.s1064 + 0)
.s1057:
0f33 : c9 10 __ CMP #$10
0f35 : d0 30 __ BNE $0f67 ; (SetUpSprites.s1049 + 0)
.s1056:
0f37 : a5 4d __ LDA T2 + 0 
0f39 : c9 01 __ CMP #$01
0f3b : f0 04 __ BEQ $0f41 ; (SetUpSprites.s46 + 0)
.s1055:
0f3d : c9 3e __ CMP #$3e
0f3f : d0 04 __ BNE $0f45 ; (SetUpSprites.s1054 + 0)
.s46:
0f41 : a9 14 __ LDA #$14
0f43 : d0 5a __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s1054:
0f45 : c9 10 __ CMP #$10
0f47 : 90 0c __ BCC $0f55 ; (SetUpSprites.s52 + 0)
.s1053:
0f49 : a9 3e __ LDA #$3e
0f4b : c5 4d __ CMP T2 + 0 
0f4d : b0 0a __ BCS $0f59 ; (SetUpSprites.s1051 + 0)
.s1052:
0f4f : a5 4d __ LDA T2 + 0 
0f51 : c9 4e __ CMP #$4e
0f53 : b0 04 __ BCS $0f59 ; (SetUpSprites.s1051 + 0)
.s52:
0f55 : a9 15 __ LDA #$15
0f57 : d0 46 __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s1051:
0f59 : a5 4d __ LDA T2 + 0 
0f5b : c9 10 __ CMP #$10
0f5d : f0 04 __ BEQ $0f63 ; (SetUpSprites.s59 + 0)
.s1050:
0f5f : c9 4e __ CMP #$4e
0f61 : d0 04 __ BNE $0f67 ; (SetUpSprites.s1049 + 0)
.s59:
0f63 : a9 16 __ LDA #$16
0f65 : d0 38 __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s1049:
0f67 : a5 4d __ LDA T2 + 0 
0f69 : c9 01 __ CMP #$01
0f6b : d0 08 __ BNE $0f75 ; (SetUpSprites.s1047 + 0)
.s1048:
0f6d : a5 4c __ LDA T1 + 0 
0f6f : c9 10 __ CMP #$10
0f71 : 90 06 __ BCC $0f79 ; (SetUpSprites.s65 + 0)
.s1084:
0f73 : a5 4d __ LDA T2 + 0 
.s1047:
0f75 : c9 3e __ CMP #$3e
0f77 : d0 04 __ BNE $0f7d ; (SetUpSprites.s1046 + 0)
.s65:
0f79 : a9 12 __ LDA #$12
0f7b : d0 22 __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s1046:
0f7d : c9 10 __ CMP #$10
0f7f : d0 06 __ BNE $0f87 ; (SetUpSprites.s1044 + 0)
.s1045:
0f81 : a5 4c __ LDA T1 + 0 
0f83 : c9 10 __ CMP #$10
0f85 : 90 12 __ BCC $0f99 ; (SetUpSprites.s70 + 0)
.s1044:
0f87 : a5 4d __ LDA T2 + 0 
0f89 : c9 4e __ CMP #$4e
0f8b : d0 10 __ BNE $0f9d ; (SetUpSprites.s71 + 0)
.s1043:
0f8d : a5 4c __ LDA T1 + 0 
0f8f : c9 10 __ CMP #$10
0f91 : b0 0a __ BCS $0f9d ; (SetUpSprites.s71 + 0)
.s1042:
0f93 : a9 01 __ LDA #$01
0f95 : c5 4c __ CMP T1 + 0 
0f97 : b0 04 __ BCS $0f9d ; (SetUpSprites.s71 + 0)
.s70:
0f99 : a9 17 __ LDA #$17
0f9b : d0 02 __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s71:
0f9d : a9 13 __ LDA #$13
.s296:
0f9f : 8d 23 9f STA $9f23 
0fa2 : a9 00 __ LDA #$00
0fa4 : 8d 23 9f STA $9f23 
0fa7 : e6 4d __ INC T2 + 0 
0fa9 : 4c e9 0e JMP $0ee9 ; (SetUpSprites.l14 + 0)
.s1064:
0fac : a5 4d __ LDA T2 + 0 
0fae : c9 01 __ CMP #$01
0fb0 : f0 04 __ BEQ $0fb6 ; (SetUpSprites.s27 + 0)
.s1063:
0fb2 : c9 3e __ CMP #$3e
0fb4 : d0 04 __ BNE $0fba ; (SetUpSprites.s1062 + 0)
.s27:
0fb6 : a9 0f __ LDA #$0f
0fb8 : d0 e5 __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s1062:
0fba : c9 10 __ CMP #$10
0fbc : 90 0c __ BCC $0fca ; (SetUpSprites.s33 + 0)
.s1061:
0fbe : a9 3e __ LDA #$3e
0fc0 : c5 4d __ CMP T2 + 0 
0fc2 : b0 0a __ BCS $0fce ; (SetUpSprites.s1059 + 0)
.s1060:
0fc4 : a5 4d __ LDA T2 + 0 
0fc6 : c9 4e __ CMP #$4e
0fc8 : b0 04 __ BCS $0fce ; (SetUpSprites.s1059 + 0)
.s33:
0fca : a9 10 __ LDA #$10
0fcc : d0 d1 __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s1059:
0fce : a5 4d __ LDA T2 + 0 
0fd0 : c9 10 __ CMP #$10
0fd2 : f0 04 __ BEQ $0fd8 ; (SetUpSprites.s40 + 0)
.s1058:
0fd4 : c9 4e __ CMP #$4e
0fd6 : d0 04 __ BNE $0fdc ; (SetUpSprites.s1083 + 0)
.s40:
0fd8 : a9 11 __ LDA #$11
0fda : d0 c3 __ BNE $0f9f ; (SetUpSprites.s296 + 0)
.s1083:
0fdc : a5 4c __ LDA T1 + 0 
0fde : 4c 33 0f JMP $0f33 ; (SetUpSprites.s1057 + 0)
.s1037:
0fe1 : a5 4c __ LDA T1 + 0 
0fe3 : c9 36 __ CMP #$36
0fe5 : 90 03 __ BCC $0fea ; (SetUpSprites.s1036 + 0)
0fe7 : 4c 85 17 JMP $1785 ; (SetUpSprites.s1031 + 0)
.s1036:
0fea : c9 2c __ CMP #$2c
0fec : b0 03 __ BCS $0ff1 ; (SetUpSprites.s1035 + 0)
0fee : 4c 85 17 JMP $1785 ; (SetUpSprites.s1031 + 0)
.s1035:
0ff1 : f0 04 __ BEQ $0ff7 ; (SetUpSprites.s81 + 0)
.s1034:
0ff3 : c9 34 __ CMP #$34
0ff5 : d0 04 __ BNE $0ffb ; (SetUpSprites.s1033 + 0)
.s81:
0ff7 : a9 0a __ LDA #$0a
0ff9 : d0 0e __ BNE $1009 ; (SetUpSprites.s279 + 0)
.s1033:
0ffb : c9 2d __ CMP #$2d
0ffd : f0 04 __ BEQ $1003 ; (SetUpSprites.s85 + 0)
.s1032:
0fff : c9 35 __ CMP #$35
1001 : d0 04 __ BNE $1007 ; (SetUpSprites.s86 + 0)
.s85:
1003 : a9 0b __ LDA #$0b
1005 : d0 02 __ BNE $1009 ; (SetUpSprites.s279 + 0)
.s86:
1007 : a9 04 __ LDA #$04
.s279:
1009 : 8d 23 9f STA $9f23 
100c : a9 00 __ LDA #$00
100e : 8d 23 9f STA $9f23 
1011 : e6 4d __ INC T2 + 0 
1013 : 30 03 __ BMI $1018 ; (SetUpSprites.s11 + 0)
1015 : 4c e9 0e JMP $0ee9 ; (SetUpSprites.l14 + 0)
.s11:
1018 : e6 4c __ INC T1 + 0 
101a : a5 4c __ LDA T1 + 0 
101c : c9 40 __ CMP #$40
101e : b0 03 __ BCS $1023 ; (SetUpSprites.s12 + 0)
1020 : 4c e5 0e JMP $0ee5 ; (SetUpSprites.l10 + 0)
.s12:
1023 : a9 c0 __ LDA #$c0
1025 : 85 2d __ STA P0 
1027 : a9 52 __ LDA #$52
1029 : 85 2e __ STA P1 
102b : a9 01 __ LDA #$01
102d : 85 2f __ STA P2 
102f : a9 00 __ LDA #$00
1031 : 85 30 __ STA P3 
1033 : 85 33 __ STA P6 
1035 : a9 02 __ LDA #$02
1037 : 85 34 __ STA P7 
1039 : a9 a3 __ LDA #$a3
103b : 85 31 __ STA P4 
103d : a9 29 __ LDA #$29
103f : 85 32 __ STA P5 
1041 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
1044 : a9 00 __ LDA #$00
1046 : 85 2d __ STA P0 
1048 : a9 55 __ LDA #$55
104a : 85 2e __ STA P1 
104c : a9 02 __ LDA #$02
104e : 85 34 __ STA P7 
1050 : a9 a3 __ LDA #$a3
1052 : 85 31 __ STA P4 
1054 : a9 2b __ LDA #$2b
1056 : 85 32 __ STA P5 
1058 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
105b : a9 96 __ LDA #$96
105d : 85 2e __ STA P1 
105f : a9 0a __ LDA #$0a
1061 : 85 2f __ STA P2 
1063 : 85 34 __ STA P7 
1065 : a9 02 __ LDA #$02
1067 : 85 31 __ STA P4 
1069 : 85 32 __ STA P5 
106b : a9 03 __ LDA #$03
106d : 85 33 __ STA P6 
106f : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1072 : a9 68 __ LDA #$68
1074 : 85 2e __ STA P1 
1076 : a9 00 __ LDA #$00
1078 : 85 2f __ STA P2 
107a : a9 b6 __ LDA #$b6
107c : 85 30 __ STA P3 
107e : a9 01 __ LDA #$01
1080 : 85 31 __ STA P4 
1082 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1085 : a9 01 __ LDA #$01
1087 : 85 2d __ STA P0 
1089 : a9 a8 __ LDA #$a8
108b : 85 2e __ STA P1 
108d : a9 0a __ LDA #$0a
108f : 85 2f __ STA P2 
1091 : a9 00 __ LDA #$00
1093 : 85 30 __ STA P3 
1095 : a9 02 __ LDA #$02
1097 : 85 31 __ STA P4 
1099 : a9 09 __ LDA #$09
109b : 85 34 __ STA P7 
109d : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
10a0 : a9 f0 __ LDA #$f0
10a2 : 85 2e __ STA P1 
10a4 : a9 01 __ LDA #$01
10a6 : 85 2f __ STA P2 
10a8 : 85 31 __ STA P4 
10aa : a9 b6 __ LDA #$b6
10ac : 85 30 __ STA P3 
10ae : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
10b1 : a9 00 __ LDA #$00
10b3 : 85 2d __ STA P0 
10b5 : 85 30 __ STA P3 
10b7 : 85 33 __ STA P6 
10b9 : a9 30 __ LDA #$30
10bb : 85 2e __ STA P1 
10bd : a9 01 __ LDA #$01
10bf : 85 34 __ STA P7 
10c1 : a9 00 __ LDA #$00
10c3 : 85 31 __ STA P4 
10c5 : a9 2e __ LDA #$2e
10c7 : 85 32 __ STA P5 
10c9 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
10cc : a9 16 __ LDA #$16
10ce : 85 2d __ STA P0 
10d0 : a9 80 __ LDA #$80
10d2 : 85 2e __ STA P1 
10d4 : a9 09 __ LDA #$09
10d6 : 85 2f __ STA P2 
10d8 : a9 01 __ LDA #$01
10da : 85 31 __ STA P4 
10dc : 85 34 __ STA P7 
10de : a9 02 __ LDA #$02
10e0 : 85 32 __ STA P5 
10e2 : a9 03 __ LDA #$03
10e4 : 85 33 __ STA P6 
10e6 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
10e9 : a9 30 __ LDA #$30
10eb : 85 2e __ STA P1 
10ed : a9 01 __ LDA #$01
10ef : 85 2f __ STA P2 
10f1 : a9 b8 __ LDA #$b8
10f3 : 85 30 __ STA P3 
10f5 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
10f8 : a9 00 __ LDA #$00
10fa : 85 2d __ STA P0 
10fc : 85 30 __ STA P3 
10fe : 85 33 __ STA P6 
1100 : a9 33 __ LDA #$33
1102 : 85 2e __ STA P1 
1104 : a9 02 __ LDA #$02
1106 : 85 34 __ STA P7 
1108 : a9 00 __ LDA #$00
110a : 85 31 __ STA P4 
110c : a9 2f __ LDA #$2f
110e : 85 32 __ STA P5 
1110 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
1113 : a9 17 __ LDA #$17
1115 : 85 2d __ STA P0 
1117 : a9 98 __ LDA #$98
1119 : 85 2e __ STA P1 
111b : a9 09 __ LDA #$09
111d : 85 2f __ STA P2 
111f : a9 02 __ LDA #$02
1121 : 85 31 __ STA P4 
1123 : 85 32 __ STA P5 
1125 : a9 03 __ LDA #$03
1127 : 85 33 __ STA P6 
1129 : a9 01 __ LDA #$01
112b : 85 34 __ STA P7 
112d : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1130 : a9 fc __ LDA #$fc
1132 : 85 2e __ STA P1 
1134 : a9 00 __ LDA #$00
1136 : 85 2f __ STA P2 
1138 : a9 b8 __ LDA #$b8
113a : 85 30 __ STA P3 
113c : a9 01 __ LDA #$01
113e : 85 31 __ STA P4 
1140 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1143 : a9 18 __ LDA #$18
1145 : 85 2d __ STA P0 
1147 : a9 98 __ LDA #$98
1149 : 85 2e __ STA P1 
114b : a9 09 __ LDA #$09
114d : 85 2f __ STA P2 
114f : a9 00 __ LDA #$00
1151 : 85 30 __ STA P3 
1153 : a9 02 __ LDA #$02
1155 : 85 31 __ STA P4 
1157 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
115a : a9 4c __ LDA #$4c
115c : 85 2e __ STA P1 
115e : a9 01 __ LDA #$01
1160 : 85 2f __ STA P2 
1162 : 85 31 __ STA P4 
1164 : a9 b8 __ LDA #$b8
1166 : 85 30 __ STA P3 
1168 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
116b : a9 01 __ LDA #$01
116d : 85 2e __ STA P1 
116f : a9 00 __ LDA #$00
1171 : 85 2f __ STA P2 
1173 : 20 4c 19 JSR $194c ; (vera_spr_flip.s0 + 0)
1176 : a9 10 __ LDA #$10
1178 : 85 2d __ STA P0 
117a : a9 20 __ LDA #$20
117c : 85 30 __ STA P3 
117e : a9 00 __ LDA #$00
1180 : 85 31 __ STA P4 
1182 : a9 a3 __ LDA #$a3
1184 : 85 2e __ STA P1 
1186 : a9 2d __ LDA #$2d
1188 : 85 2f __ STA P2 
118a : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
118d : a9 00 __ LDA #$00
118f : 85 2d __ STA P0 
1191 : 85 30 __ STA P3 
1193 : 85 33 __ STA P6 
1195 : a9 31 __ LDA #$31
1197 : 85 2e __ STA P1 
1199 : a9 01 __ LDA #$01
119b : 85 2f __ STA P2 
119d : a9 02 __ LDA #$02
119f : 85 34 __ STA P7 
11a1 : a9 00 __ LDA #$00
11a3 : 85 31 __ STA P4 
11a5 : a9 31 __ LDA #$31
11a7 : 85 32 __ STA P5 
11a9 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
11ac : a9 00 __ LDA #$00
11ae : 85 4c __ STA T1 + 0 
11b0 : 85 4d __ STA T2 + 0 
11b2 : a9 03 __ LDA #$03
11b4 : 85 33 __ STA P6 
11b6 : a9 02 __ LDA #$02
11b8 : 85 34 __ STA P7 
11ba : 18 __ __ CLC
.l1085:
11bb : a9 88 __ LDA #$88
11bd : 85 2e __ STA P1 
11bf : a9 09 __ LDA #$09
11c1 : 85 2f __ STA P2 
11c3 : a9 00 __ LDA #$00
11c5 : 85 30 __ STA P3 
11c7 : 85 31 __ STA P4 
11c9 : 85 32 __ STA P5 
11cb : a5 4c __ LDA T1 + 0 
11cd : 69 19 __ ADC #$19
11cf : 85 2d __ STA P0 
11d1 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
11d4 : a9 b8 __ LDA #$b8
11d6 : 85 30 __ STA P3 
11d8 : a9 01 __ LDA #$01
11da : 85 31 __ STA P4 
11dc : 38 __ __ SEC
11dd : a5 4d __ LDA T2 + 0 
11df : e9 fc __ SBC #$fc
11e1 : 85 2e __ STA P1 
11e3 : a9 00 __ LDA #$00
11e5 : e9 03 __ SBC #$03
11e7 : 85 2f __ STA P2 
11e9 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
11ec : 18 __ __ CLC
11ed : a5 4d __ LDA T2 + 0 
11ef : 69 0c __ ADC #$0c
11f1 : 85 4d __ STA T2 + 0 
11f3 : e6 4c __ INC T1 + 0 
11f5 : a5 4c __ LDA T1 + 0 
11f7 : c9 08 __ CMP #$08
11f9 : 90 c0 __ BCC $11bb ; (SetUpSprites.l1085 + 0)
.s138:
11fb : a9 00 __ LDA #$00
11fd : 85 4c __ STA T1 + 0 
11ff : 85 4d __ STA T2 + 0 
1201 : a9 03 __ LDA #$03
1203 : 85 33 __ STA P6 
1205 : a9 02 __ LDA #$02
1207 : 85 34 __ STA P7 
1209 : 18 __ __ CLC
.l1087:
120a : a9 88 __ LDA #$88
120c : 85 2e __ STA P1 
120e : a9 09 __ LDA #$09
1210 : 85 2f __ STA P2 
1212 : a9 00 __ LDA #$00
1214 : 85 30 __ STA P3 
1216 : 85 31 __ STA P4 
1218 : a5 4c __ LDA T1 + 0 
121a : 69 21 __ ADC #$21
121c : 85 2d __ STA P0 
121e : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1221 : a9 c4 __ LDA #$c4
1223 : 85 30 __ STA P3 
1225 : a9 01 __ LDA #$01
1227 : 85 31 __ STA P4 
1229 : 38 __ __ SEC
122a : a5 4d __ LDA T2 + 0 
122c : e9 fc __ SBC #$fc
122e : 85 2e __ STA P1 
1230 : a9 00 __ LDA #$00
1232 : e9 03 __ SBC #$03
1234 : 85 2f __ STA P2 
1236 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1239 : 18 __ __ CLC
123a : a5 4d __ LDA T2 + 0 
123c : 69 0c __ ADC #$0c
123e : 85 4d __ STA T2 + 0 
1240 : e6 4c __ INC T1 + 0 
1242 : a5 4c __ LDA T1 + 0 
1244 : c9 08 __ CMP #$08
1246 : 90 c2 __ BCC $120a ; (SetUpSprites.l1087 + 0)
.s142:
1248 : a9 00 __ LDA #$00
124a : 85 4c __ STA T1 + 0 
124c : 85 4d __ STA T2 + 0 
124e : a9 03 __ LDA #$03
1250 : 85 33 __ STA P6 
1252 : a9 02 __ LDA #$02
1254 : 85 34 __ STA P7 
1256 : 18 __ __ CLC
.l1089:
1257 : a9 88 __ LDA #$88
1259 : 85 2e __ STA P1 
125b : a9 09 __ LDA #$09
125d : 85 2f __ STA P2 
125f : a9 00 __ LDA #$00
1261 : 85 30 __ STA P3 
1263 : 85 31 __ STA P4 
1265 : a5 4c __ LDA T1 + 0 
1267 : 69 29 __ ADC #$29
1269 : 85 2d __ STA P0 
126b : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
126e : a9 b8 __ LDA #$b8
1270 : 85 30 __ STA P3 
1272 : a9 01 __ LDA #$01
1274 : 85 31 __ STA P4 
1276 : 38 __ __ SEC
1277 : a9 6c __ LDA #$6c
1279 : e5 4d __ SBC T2 + 0 
127b : 85 2e __ STA P1 
127d : a9 02 __ LDA #$02
127f : e9 04 __ SBC #$04
1281 : 85 2f __ STA P2 
1283 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1286 : 18 __ __ CLC
1287 : a5 4d __ LDA T2 + 0 
1289 : 69 0c __ ADC #$0c
128b : 85 4d __ STA T2 + 0 
128d : e6 4c __ INC T1 + 0 
128f : a5 4c __ LDA T1 + 0 
1291 : c9 08 __ CMP #$08
1293 : 90 c2 __ BCC $1257 ; (SetUpSprites.l1089 + 0)
.s146:
1295 : a9 00 __ LDA #$00
1297 : 85 4c __ STA T1 + 0 
1299 : a9 02 __ LDA #$02
129b : 85 34 __ STA P7 
129d : a9 03 __ LDA #$03
129f : 85 33 __ STA P6 
.l148:
12a1 : 38 __ __ SEC
12a2 : a9 00 __ LDA #$00
12a4 : e5 4c __ SBC T1 + 0 
12a6 : 29 0c __ AND #$0c
12a8 : 49 ff __ EOR #$ff
12aa : 38 __ __ SEC
12ab : 69 6c __ ADC #$6c
12ad : 85 4d __ STA T2 + 0 
12af : a9 02 __ LDA #$02
12b1 : e9 00 __ SBC #$00
12b3 : 85 4e __ STA T2 + 1 
12b5 : 18 __ __ CLC
12b6 : a5 4c __ LDA T1 + 0 
12b8 : 69 31 __ ADC #$31
12ba : 85 2d __ STA P0 
12bc : a9 02 __ LDA #$02
12be : 85 4f __ STA T5 + 0 
.l1073:
12c0 : a9 88 __ LDA #$88
12c2 : 85 2e __ STA P1 
12c4 : a9 09 __ LDA #$09
12c6 : 85 2f __ STA P2 
12c8 : a9 00 __ LDA #$00
12ca : 85 30 __ STA P3 
12cc : 85 31 __ STA P4 
12ce : 85 32 __ STA P5 
12d0 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
12d3 : a5 4d __ LDA T2 + 0 
12d5 : 85 2e __ STA P1 
12d7 : a5 4e __ LDA T2 + 1 
12d9 : 85 2f __ STA P2 
12db : a9 b8 __ LDA #$b8
12dd : 85 30 __ STA P3 
12df : a9 01 __ LDA #$01
12e1 : 85 31 __ STA P4 
12e3 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
12e6 : c6 4f __ DEC T5 + 0 
12e8 : d0 d6 __ BNE $12c0 ; (SetUpSprites.l1073 + 0)
.s149:
12ea : e6 4c __ INC T1 + 0 
12ec : a5 4c __ LDA T1 + 0 
12ee : c9 02 __ CMP #$02
12f0 : 90 af __ BCC $12a1 ; (SetUpSprites.l148 + 0)
.s150:
12f2 : a9 40 __ LDA #$40
12f4 : 85 2d __ STA P0 
12f6 : a9 4d __ LDA #$4d
12f8 : 85 2e __ STA P1 
12fa : a9 01 __ LDA #$01
12fc : 85 2f __ STA P2 
12fe : 85 34 __ STA P7 
1300 : a9 00 __ LDA #$00
1302 : 85 30 __ STA P3 
1304 : 85 33 __ STA P6 
1306 : a9 00 __ LDA #$00
1308 : 85 31 __ STA P4 
130a : a9 33 __ LDA #$33
130c : 85 32 __ STA P5 
130e : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
1311 : a9 33 __ LDA #$33
1313 : 85 2d __ STA P0 
1315 : a9 6a __ LDA #$6a
1317 : 85 2e __ STA P1 
1319 : a9 0a __ LDA #$0a
131b : 85 2f __ STA P2 
131d : a9 01 __ LDA #$01
131f : 85 31 __ STA P4 
1321 : a9 02 __ LDA #$02
1323 : 85 32 __ STA P5 
1325 : a9 03 __ LDA #$03
1327 : 85 33 __ STA P6 
1329 : a9 06 __ LDA #$06
132b : 85 34 __ STA P7 
132d : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1330 : a9 00 __ LDA #$00
1332 : 85 2e __ STA P1 
1334 : 85 31 __ STA P4 
1336 : a9 01 __ LDA #$01
1338 : 85 2f __ STA P2 
133a : a9 78 __ LDA #$78
133c : 85 30 __ STA P3 
133e : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1341 : a9 00 __ LDA #$00
1343 : 85 2d __ STA P0 
1345 : 85 30 __ STA P3 
1347 : 85 33 __ STA P6 
1349 : a9 3d __ LDA #$3d
134b : 85 2e __ STA P1 
134d : a9 04 __ LDA #$04
134f : 85 34 __ STA P7 
1351 : a9 00 __ LDA #$00
1353 : 85 31 __ STA P4 
1355 : a9 34 __ LDA #$34
1357 : 85 32 __ STA P5 
1359 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
135c : a9 34 __ LDA #$34
135e : 85 2d __ STA P0 
1360 : a9 e8 __ LDA #$e8
1362 : 85 2e __ STA P1 
1364 : a9 09 __ LDA #$09
1366 : 85 2f __ STA P2 
1368 : a9 03 __ LDA #$03
136a : 85 31 __ STA P4 
136c : 85 33 __ STA P6 
136e : a9 02 __ LDA #$02
1370 : 85 32 __ STA P5 
1372 : a9 05 __ LDA #$05
1374 : 85 34 __ STA P7 
1376 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1379 : a9 00 __ LDA #$00
137b : 85 2e __ STA P1 
137d : 85 31 __ STA P4 
137f : a9 01 __ LDA #$01
1381 : 85 2f __ STA P2 
1383 : a9 78 __ LDA #$78
1385 : 85 30 __ STA P3 
1387 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
138a : a9 35 __ LDA #$35
138c : 85 2d __ STA P0 
138e : a9 08 __ LDA #$08
1390 : 85 2e __ STA P1 
1392 : a9 0a __ LDA #$0a
1394 : 85 2f __ STA P2 
1396 : a9 00 __ LDA #$00
1398 : 85 30 __ STA P3 
139a : a9 03 __ LDA #$03
139c : 85 31 __ STA P4 
139e : a9 07 __ LDA #$07
13a0 : 85 33 __ STA P6 
13a2 : a9 06 __ LDA #$06
13a4 : 85 34 __ STA P7 
13a6 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
13a9 : a9 00 __ LDA #$00
13ab : 85 2e __ STA P1 
13ad : 85 31 __ STA P4 
13af : a9 01 __ LDA #$01
13b1 : 85 2f __ STA P2 
13b3 : a9 e8 __ LDA #$e8
13b5 : 85 30 __ STA P3 
13b7 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
13ba : a9 36 __ LDA #$36
13bc : 85 2d __ STA P0 
13be : a9 08 __ LDA #$08
13c0 : 85 2e __ STA P1 
13c2 : a9 0a __ LDA #$0a
13c4 : 85 2f __ STA P2 
13c6 : a9 00 __ LDA #$00
13c8 : 85 30 __ STA P3 
13ca : a9 03 __ LDA #$03
13cc : 85 31 __ STA P4 
13ce : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
13d1 : a9 40 __ LDA #$40
13d3 : 85 2e __ STA P1 
13d5 : a9 01 __ LDA #$01
13d7 : 85 2f __ STA P2 
13d9 : a9 e8 __ LDA #$e8
13db : 85 30 __ STA P3 
13dd : a9 00 __ LDA #$00
13df : 85 31 __ STA P4 
13e1 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
13e4 : a9 01 __ LDA #$01
13e6 : 85 2e __ STA P1 
13e8 : a9 00 __ LDA #$00
13ea : 85 2f __ STA P2 
13ec : 20 4c 19 JSR $194c ; (vera_spr_flip.s0 + 0)
13ef : a9 37 __ LDA #$37
13f1 : 85 2d __ STA P0 
13f3 : a9 08 __ LDA #$08
13f5 : 85 2e __ STA P1 
13f7 : a9 0a __ LDA #$0a
13f9 : 85 2f __ STA P2 
13fb : a9 00 __ LDA #$00
13fd : 85 30 __ STA P3 
13ff : a9 03 __ LDA #$03
1401 : 85 31 __ STA P4 
1403 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1406 : a9 00 __ LDA #$00
1408 : 85 2e __ STA P1 
140a : a9 01 __ LDA #$01
140c : 85 2f __ STA P2 
140e : 85 31 __ STA P4 
1410 : a9 08 __ LDA #$08
1412 : 85 30 __ STA P3 
1414 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1417 : 20 4c 19 JSR $194c ; (vera_spr_flip.s0 + 0)
141a : a9 38 __ LDA #$38
141c : 85 2d __ STA P0 
141e : a9 08 __ LDA #$08
1420 : 85 2e __ STA P1 
1422 : a9 0a __ LDA #$0a
1424 : 85 2f __ STA P2 
1426 : a9 00 __ LDA #$00
1428 : 85 30 __ STA P3 
142a : a9 03 __ LDA #$03
142c : 85 31 __ STA P4 
142e : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1431 : a9 40 __ LDA #$40
1433 : 85 2e __ STA P1 
1435 : a9 01 __ LDA #$01
1437 : 85 2f __ STA P2 
1439 : 85 31 __ STA P4 
143b : a9 08 __ LDA #$08
143d : 85 30 __ STA P3 
143f : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1442 : a9 01 __ LDA #$01
1444 : 85 2e __ STA P1 
1446 : 20 4c 19 JSR $194c ; (vera_spr_flip.s0 + 0)
1449 : a9 00 __ LDA #$00
144b : 85 2d __ STA P0 
144d : 85 30 __ STA P3 
144f : 85 33 __ STA P6 
1451 : a9 35 __ LDA #$35
1453 : 85 2e __ STA P1 
1455 : a9 08 __ LDA #$08
1457 : 85 34 __ STA P7 
1459 : a9 00 __ LDA #$00
145b : 85 31 __ STA P4 
145d : a9 38 __ LDA #$38
145f : 85 32 __ STA P5 
1461 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
1464 : a9 00 __ LDA #$00
1466 : 85 4c __ STA T1 + 0 
1468 : 85 4d __ STA T2 + 0 
146a : 85 4e __ STA T2 + 1 
146c : a9 02 __ LDA #$02
146e : 85 33 __ STA P6 
1470 : a9 05 __ LDA #$05
1472 : 85 34 __ STA P7 
1474 : a9 03 __ LDA #$03
1476 : 85 32 __ STA P5 
1478 : 18 __ __ CLC
.l1091:
1479 : a9 a8 __ LDA #$a8
147b : 85 2e __ STA P1 
147d : a9 09 __ LDA #$09
147f : 85 2f __ STA P2 
1481 : a9 00 __ LDA #$00
1483 : 85 30 __ STA P3 
1485 : a9 03 __ LDA #$03
1487 : 85 31 __ STA P4 
1489 : a5 4c __ LDA T1 + 0 
148b : 69 39 __ ADC #$39
148d : 85 2d __ STA P0 
148f : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1492 : a9 20 __ LDA #$20
1494 : 85 2e __ STA P1 
1496 : a9 01 __ LDA #$01
1498 : 85 2f __ STA P2 
149a : 38 __ __ SEC
149b : a5 4d __ LDA T2 + 0 
149d : e9 60 __ SBC #$60
149f : 85 30 __ STA P3 
14a1 : a5 4e __ LDA T2 + 1 
14a3 : e9 00 __ SBC #$00
14a5 : 85 31 __ STA P4 
14a7 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
14aa : 18 __ __ CLC
14ab : a5 4d __ LDA T2 + 0 
14ad : 69 40 __ ADC #$40
14af : 85 4d __ STA T2 + 0 
14b1 : 90 02 __ BCC $14b5 ; (SetUpSprites.s1094 + 0)
.s1093:
14b3 : e6 4e __ INC T2 + 1 
.s1094:
14b5 : e6 4c __ INC T1 + 0 
14b7 : a5 4c __ LDA T1 + 0 
14b9 : c9 07 __ CMP #$07
14bb : 90 bc __ BCC $1479 ; (SetUpSprites.l1091 + 0)
.s158:
14bd : a9 40 __ LDA #$40
14bf : 85 2d __ STA P0 
14c1 : a9 4f __ LDA #$4f
14c3 : 85 2e __ STA P1 
14c5 : a9 00 __ LDA #$00
14c7 : 85 30 __ STA P3 
14c9 : 85 33 __ STA P6 
14cb : a9 02 __ LDA #$02
14cd : 85 34 __ STA P7 
14cf : a9 00 __ LDA #$00
14d1 : 85 31 __ STA P4 
14d3 : a9 40 __ LDA #$40
14d5 : 85 32 __ STA P5 
14d7 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
14da : a9 80 __ LDA #$80
14dc : 85 2d __ STA P0 
14de : 85 33 __ STA P6 
14e0 : a9 4e __ LDA #$4e
14e2 : 85 2e __ STA P1 
14e4 : a9 00 __ LDA #$00
14e6 : 85 34 __ STA P7 
14e8 : a9 00 __ LDA #$00
14ea : 85 31 __ STA P4 
14ec : a9 42 __ LDA #$42
14ee : 85 32 __ STA P5 
14f0 : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
14f3 : a9 00 __ LDA #$00
14f5 : 85 4b __ STA T0 + 0 
14f7 : a9 0a __ LDA #$0a
14f9 : 85 2f __ STA P2 
14fb : a9 02 __ LDA #$02
14fd : 85 33 __ STA P6 
14ff : a9 08 __ LDA #$08
1501 : 85 34 __ STA P7 
.l160:
1503 : a9 74 __ LDA #$74
1505 : 85 2e __ STA P1 
1507 : a9 01 __ LDA #$01
1509 : 85 31 __ STA P4 
150b : 85 32 __ STA P5 
150d : 18 __ __ CLC
150e : a5 4b __ LDA T0 + 0 
1510 : 69 4f __ ADC #$4f
1512 : 85 2d __ STA P0 
1514 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1517 : a5 4b __ LDA T0 + 0 
1519 : c9 17 __ CMP #$17
151b : d0 0d __ BNE $152a ; (SetUpSprites.s288 + 0)
.s163:
151d : a9 7a __ LDA #$7a
151f : 85 2e __ STA P1 
1521 : a9 02 __ LDA #$02
1523 : 85 31 __ STA P4 
1525 : 85 32 __ STA P5 
1527 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
.s288:
152a : e6 4b __ INC T0 + 0 
152c : a5 4b __ LDA T0 + 0 
152e : c9 18 __ CMP #$18
1530 : 90 d1 __ BCC $1503 ; (SetUpSprites.l160 + 0)
.s162:
1532 : a9 00 __ LDA #$00
1534 : 85 2d __ STA P0 
1536 : 85 31 __ STA P4 
1538 : a9 20 __ LDA #$20
153a : 85 30 __ STA P3 
153c : a9 c3 __ LDA #$c3
153e : 85 2e __ STA P1 
1540 : a9 2d __ LDA #$2d
1542 : 85 2f __ STA P2 
1544 : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
1547 : a9 20 __ LDA #$20
1549 : 85 2d __ STA P0 
154b : a9 00 __ LDA #$00
154d : 85 31 __ STA P4 
154f : a9 80 __ LDA #$80
1551 : 85 2e __ STA P1 
1553 : a9 42 __ LDA #$42
1555 : 85 2f __ STA P2 
1557 : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
155a : a9 60 __ LDA #$60
155c : 85 2d __ STA P0 
155e : a9 00 __ LDA #$00
1560 : 85 31 __ STA P4 
1562 : a9 a0 __ LDA #$a0
1564 : 85 2e __ STA P1 
1566 : a9 42 __ LDA #$42
1568 : 85 2f __ STA P2 
156a : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
156d : a9 70 __ LDA #$70
156f : 85 2d __ STA P0 
1571 : a9 0c __ LDA #$0c
1573 : 85 30 __ STA P3 
1575 : a9 00 __ LDA #$00
1577 : 85 31 __ STA P4 
1579 : a9 e3 __ LDA #$e3
157b : 85 2e __ STA P1 
157d : a9 2d __ LDA #$2d
157f : 85 2f __ STA P2 
1581 : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
1584 : a9 80 __ LDA #$80
1586 : 85 2d __ STA P0 
1588 : a9 20 __ LDA #$20
158a : 85 30 __ STA P3 
158c : a9 00 __ LDA #$00
158e : 85 31 __ STA P4 
1590 : a9 c0 __ LDA #$c0
1592 : 85 2e __ STA P1 
1594 : a9 42 __ LDA #$42
1596 : 85 2f __ STA P2 
1598 : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
159b : a9 90 __ LDA #$90
159d : 85 2d __ STA P0 
159f : a9 10 __ LDA #$10
15a1 : 85 30 __ STA P3 
15a3 : a9 00 __ LDA #$00
15a5 : 85 31 __ STA P4 
15a7 : a9 ef __ LDA #$ef
15a9 : 85 2e __ STA P1 
15ab : a9 2d __ LDA #$2d
15ad : 85 2f __ STA P2 
15af : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
15b2 : a9 a0 __ LDA #$a0
15b4 : 85 2d __ STA P0 
15b6 : a9 1a __ LDA #$1a
15b8 : 85 30 __ STA P3 
15ba : a9 00 __ LDA #$00
15bc : 85 31 __ STA P4 
15be : a9 e0 __ LDA #$e0
15c0 : 85 2e __ STA P1 
15c2 : a9 42 __ LDA #$42
15c4 : 85 2f __ STA P2 
15c6 : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
15c9 : a9 b0 __ LDA #$b0
15cb : 85 2d __ STA P0 
15cd : a9 1c __ LDA #$1c
15cf : 85 30 __ STA P3 
15d1 : a9 00 __ LDA #$00
15d3 : 85 31 __ STA P4 
15d5 : a9 00 __ LDA #$00
15d7 : 85 2e __ STA P1 
15d9 : a9 43 __ LDA #$43
15db : 85 2f __ STA P2 
15dd : 20 89 19 JSR $1989 ; (vera_pal_putn.s0 + 0)
15e0 : a9 00 __ LDA #$00
15e2 : 85 2d __ STA P0 
15e4 : 85 30 __ STA P3 
15e6 : 85 33 __ STA P6 
15e8 : a9 41 __ LDA #$41
15ea : 85 2e __ STA P1 
15ec : a9 01 __ LDA #$01
15ee : 85 2f __ STA P2 
15f0 : a9 04 __ LDA #$04
15f2 : 85 34 __ STA P7 
15f4 : a9 1c __ LDA #$1c
15f6 : 85 31 __ STA P4 
15f8 : a9 43 __ LDA #$43
15fa : 85 32 __ STA P5 
15fc : 20 54 18 JSR $1854 ; (vram_putn.s0 + 0)
15ff : a9 03 __ LDA #$03
1601 : 85 32 __ STA P5 
1603 : 85 34 __ STA P7 
1605 : a9 08 __ LDA #$08
1607 : 85 33 __ STA P6 
1609 : a9 40 __ LDA #$40
160b : 85 35 __ STA P8 
160d : a9 57 __ LDA #$57
160f : 85 36 __ STA P9 
1611 : a9 01 __ LDA #$01
1613 : 85 37 __ STA P10 
1615 : a9 00 __ LDA #$00
1617 : 85 38 __ STA P11 
1619 : 8d fa 9e STA $9efa ; (sstack + 0)
161c : a9 20 __ LDA #$20
161e : 8d fb 9e STA $9efb ; (sstack + 1)
1621 : a9 b5 __ LDA #$b5
1623 : 85 30 __ STA P3 
1625 : a9 1a __ LDA #$1a
1627 : 85 31 __ STA P4 
1629 : 20 d2 19 JSR $19d2 ; (LoadSprite.s0 + 0)
162c : a9 03 __ LDA #$03
162e : 85 2d __ STA P0 
1630 : 85 31 __ STA P4 
1632 : a9 ba __ LDA #$ba
1634 : 85 2e __ STA P1 
1636 : a9 0a __ LDA #$0a
1638 : 85 2f __ STA P2 
163a : a9 00 __ LDA #$00
163c : 85 30 __ STA P3 
163e : a9 07 __ LDA #$07
1640 : 85 33 __ STA P6 
1642 : a9 0b __ LDA #$0b
1644 : 85 34 __ STA P7 
1646 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1649 : a9 08 __ LDA #$08
164b : 85 2e __ STA P1 
164d : 85 30 __ STA P3 
164f : a9 00 __ LDA #$00
1651 : 85 2f __ STA P2 
1653 : 85 31 __ STA P4 
1655 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1658 : a9 04 __ LDA #$04
165a : 85 2d __ STA P0 
165c : a9 fa __ LDA #$fa
165e : 85 2e __ STA P1 
1660 : a9 0a __ LDA #$0a
1662 : 85 2f __ STA P2 
1664 : a9 00 __ LDA #$00
1666 : 85 30 __ STA P3 
1668 : a9 03 __ LDA #$03
166a : 85 31 __ STA P4 
166c : 85 33 __ STA P6 
166e : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1671 : a9 48 __ LDA #$48
1673 : 85 2e __ STA P1 
1675 : a9 00 __ LDA #$00
1677 : 85 2f __ STA P2 
1679 : 85 31 __ STA P4 
167b : a9 08 __ LDA #$08
167d : 85 30 __ STA P3 
167f : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1682 : a9 05 __ LDA #$05
1684 : 85 2d __ STA P0 
1686 : a9 3a __ LDA #$3a
1688 : 85 2e __ STA P1 
168a : a9 0b __ LDA #$0b
168c : 85 2f __ STA P2 
168e : a9 00 __ LDA #$00
1690 : 85 30 __ STA P3 
1692 : a9 03 __ LDA #$03
1694 : 85 31 __ STA P4 
1696 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1699 : a9 08 __ LDA #$08
169b : 85 2e __ STA P1 
169d : a9 00 __ LDA #$00
169f : 85 2f __ STA P2 
16a1 : 85 31 __ STA P4 
16a3 : a9 48 __ LDA #$48
16a5 : 85 30 __ STA P3 
16a7 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
16aa : a9 06 __ LDA #$06
16ac : 85 2d __ STA P0 
16ae : a9 7a __ LDA #$7a
16b0 : 85 2e __ STA P1 
16b2 : a9 0b __ LDA #$0b
16b4 : 85 2f __ STA P2 
16b6 : a9 00 __ LDA #$00
16b8 : 85 30 __ STA P3 
16ba : a9 03 __ LDA #$03
16bc : 85 31 __ STA P4 
16be : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
16c1 : a9 48 __ LDA #$48
16c3 : 85 2e __ STA P1 
16c5 : 85 30 __ STA P3 
16c7 : a9 00 __ LDA #$00
16c9 : 85 2f __ STA P2 
16cb : 85 31 __ STA P4 
16cd : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
16d0 : a9 07 __ LDA #$07
16d2 : 85 2d __ STA P0 
16d4 : 85 33 __ STA P6 
16d6 : a9 ba __ LDA #$ba
16d8 : 85 2e __ STA P1 
16da : a9 0a __ LDA #$0a
16dc : 85 2f __ STA P2 
16de : a9 00 __ LDA #$00
16e0 : 85 30 __ STA P3 
16e2 : a9 03 __ LDA #$03
16e4 : 85 31 __ STA P4 
16e6 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
16e9 : a9 f8 __ LDA #$f8
16eb : 85 2e __ STA P1 
16ed : a9 01 __ LDA #$01
16ef : 85 2f __ STA P2 
16f1 : a9 08 __ LDA #$08
16f3 : 85 30 __ STA P3 
16f5 : a9 00 __ LDA #$00
16f7 : 85 31 __ STA P4 
16f9 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
16fc : a9 08 __ LDA #$08
16fe : 85 2d __ STA P0 
1700 : a9 fa __ LDA #$fa
1702 : 85 2e __ STA P1 
1704 : a9 0a __ LDA #$0a
1706 : 85 2f __ STA P2 
1708 : a9 00 __ LDA #$00
170a : 85 30 __ STA P3 
170c : a9 03 __ LDA #$03
170e : 85 31 __ STA P4 
1710 : 85 33 __ STA P6 
1712 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1715 : a9 38 __ LDA #$38
1717 : 85 2e __ STA P1 
1719 : a9 02 __ LDA #$02
171b : 85 2f __ STA P2 
171d : a9 08 __ LDA #$08
171f : 85 30 __ STA P3 
1721 : a9 00 __ LDA #$00
1723 : 85 31 __ STA P4 
1725 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1728 : a9 09 __ LDA #$09
172a : 85 2d __ STA P0 
172c : a9 3a __ LDA #$3a
172e : 85 2e __ STA P1 
1730 : a9 0b __ LDA #$0b
1732 : 85 2f __ STA P2 
1734 : a9 00 __ LDA #$00
1736 : 85 30 __ STA P3 
1738 : a9 03 __ LDA #$03
173a : 85 31 __ STA P4 
173c : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
173f : a9 f8 __ LDA #$f8
1741 : 85 2e __ STA P1 
1743 : a9 01 __ LDA #$01
1745 : 85 2f __ STA P2 
1747 : a9 48 __ LDA #$48
1749 : 85 30 __ STA P3 
174b : a9 00 __ LDA #$00
174d : 85 31 __ STA P4 
174f : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1752 : a9 0a __ LDA #$0a
1754 : 85 2d __ STA P0 
1756 : a9 7a __ LDA #$7a
1758 : 85 2e __ STA P1 
175a : a9 0b __ LDA #$0b
175c : 85 2f __ STA P2 
175e : a9 00 __ LDA #$00
1760 : 85 30 __ STA P3 
1762 : a9 03 __ LDA #$03
1764 : 85 31 __ STA P4 
1766 : 20 b6 18 JSR $18b6 ; (vera_spr_set.s0 + 0)
1769 : a9 38 __ LDA #$38
176b : 85 2e __ STA P1 
176d : a9 02 __ LDA #$02
176f : 85 2f __ STA P2 
1771 : a9 48 __ LDA #$48
1773 : 85 30 __ STA P3 
1775 : a9 00 __ LDA #$00
1777 : 85 31 __ STA P4 
1779 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
177c : ad 29 9f LDA $9f29 
177f : 09 70 __ ORA #$70
1781 : 8d 29 9f STA $9f29 
.s1001:
1784 : 60 __ __ RTS
.s1031:
1785 : c9 34 __ CMP #$34
1787 : 90 05 __ BCC $178e ; (SetUpSprites.s1030 + 0)
.s89:
1789 : a9 09 __ LDA #$09
178b : 4c 09 10 JMP $1009 ; (SetUpSprites.s279 + 0)
.s1030:
178e : a9 2c __ LDA #$2c
1790 : c5 25 __ CMP WORK + 2 
1792 : 90 38 __ BCC $17cc ; (SetUpSprites.s1023 + 0)
.s1029:
1794 : a5 4d __ LDA T2 + 0 
1796 : c9 08 __ CMP #$08
1798 : 90 06 __ BCC $17a0 ; (SetUpSprites.s95 + 0)
.s1028:
179a : a9 48 __ LDA #$48
179c : c5 4d __ CMP T2 + 0 
179e : b0 05 __ BCS $17a5 ; (SetUpSprites.s1027 + 0)
.s95:
17a0 : a9 00 __ LDA #$00
17a2 : 4c 09 10 JMP $1009 ; (SetUpSprites.s279 + 0)
.s1027:
17a5 : a5 4d __ LDA T2 + 0 
17a7 : c9 0c __ CMP #$0c
17a9 : 90 06 __ BCC $17b1 ; (SetUpSprites.s99 + 0)
.s1026:
17ab : a9 44 __ LDA #$44
17ad : c5 4d __ CMP T2 + 0 
17af : b0 05 __ BCS $17b6 ; (SetUpSprites.s1025 + 0)
.s99:
17b1 : a9 01 __ LDA #$01
17b3 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
.s1025:
17b6 : a5 4d __ LDA T2 + 0 
17b8 : c9 18 __ CMP #$18
17ba : 90 06 __ BCC $17c2 ; (SetUpSprites.s103 + 0)
.s1024:
17bc : a9 38 __ LDA #$38
17be : c5 4d __ CMP T2 + 0 
17c0 : b0 05 __ BCS $17c7 ; (SetUpSprites.s104 + 0)
.s103:
17c2 : a9 02 __ LDA #$02
17c4 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
.s104:
17c7 : a9 03 __ LDA #$03
17c9 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
.s1023:
17cc : a9 2f __ LDA #$2f
17ce : c5 25 __ CMP WORK + 2 
17d0 : a5 4d __ LDA T2 + 0 
17d2 : 90 36 __ BCC $180a ; (SetUpSprites.s1016 + 0)
.s1022:
17d4 : c9 08 __ CMP #$08
17d6 : 90 06 __ BCC $17de ; (SetUpSprites.s111 + 0)
.s1021:
17d8 : a9 48 __ LDA #$48
17da : c5 4d __ CMP T2 + 0 
17dc : b0 05 __ BCS $17e3 ; (SetUpSprites.s1020 + 0)
.s111:
17de : a9 05 __ LDA #$05
17e0 : 4c 09 10 JMP $1009 ; (SetUpSprites.s279 + 0)
.s1020:
17e3 : a5 4d __ LDA T2 + 0 
17e5 : c9 0c __ CMP #$0c
17e7 : 90 06 __ BCC $17ef ; (SetUpSprites.s115 + 0)
.s1019:
17e9 : a9 44 __ LDA #$44
17eb : c5 4d __ CMP T2 + 0 
17ed : b0 05 __ BCS $17f4 ; (SetUpSprites.s1018 + 0)
.s115:
17ef : a9 06 __ LDA #$06
17f1 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
.s1018:
17f4 : a5 4d __ LDA T2 + 0 
17f6 : c9 18 __ CMP #$18
17f8 : 90 06 __ BCC $1800 ; (SetUpSprites.s119 + 0)
.s1017:
17fa : a9 38 __ LDA #$38
17fc : c5 4d __ CMP T2 + 0 
17fe : b0 05 __ BCS $1805 ; (SetUpSprites.s120 + 0)
.s119:
1800 : a9 07 __ LDA #$07
1802 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
.s120:
1805 : a9 08 __ LDA #$08
1807 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
.s1016:
180a : c9 08 __ CMP #$08
180c : 90 06 __ BCC $1814 ; (SetUpSprites.s123 + 0)
.s1015:
180e : a9 48 __ LDA #$48
1810 : c5 4d __ CMP T2 + 0 
1812 : b0 05 __ BCS $1819 ; (SetUpSprites.s1004 + 0)
.s123:
1814 : a9 0c __ LDA #$0c
1816 : 4c 09 10 JMP $1009 ; (SetUpSprites.s279 + 0)
.s1004:
1819 : a5 4d __ LDA T2 + 0 
181b : c9 0c __ CMP #$0c
181d : 90 06 __ BCC $1825 ; (SetUpSprites.s127 + 0)
.s1003:
181f : a9 44 __ LDA #$44
1821 : c5 4d __ CMP T2 + 0 
1823 : b0 05 __ BCS $182a ; (SetUpSprites.s131 + 0)
.s127:
1825 : a9 0d __ LDA #$0d
1827 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
.s131:
182a : a9 0e __ LDA #$0e
182c : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s296 + 0)
--------------------------------------------------------------------
VolAddr:
2679 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
IndAddr:
267d : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
tileBaseConfig:
.s0:
182f : 46 2d __ LSR P0 ; (bank + 0)
1831 : a9 00 __ LDA #$00
1833 : 6a __ __ ROR
1834 : 85 3b __ STA ACCU + 0 
1836 : a5 2f __ LDA P2 ; (mem + 1)
1838 : 29 f8 __ AND #$f8
183a : 4a __ __ LSR
183b : 05 3b __ ORA ACCU + 0 
183d : 85 3b __ STA ACCU + 0 
183f : a5 30 __ LDA P3 ; (height + 0)
1841 : 0a __ __ ASL
1842 : 05 3b __ ORA ACCU + 0 
1844 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1846 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1847 : 46 2d __ LSR P0 ; (bank + 0)
1849 : a9 00 __ LDA #$00
184b : 6a __ __ ROR
184c : 85 3b __ STA ACCU + 0 
184e : a5 2f __ LDA P2 ; (mem + 1)
1850 : 4a __ __ LSR
1851 : 05 3b __ ORA ACCU + 0 
.s1001:
1853 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1854 : ad 25 9f LDA $9f25 
1857 : 29 fe __ AND #$fe
1859 : 8d 25 9f STA $9f25 
185c : a5 2d __ LDA P0 ; (addr + 0)
185e : 8d 20 9f STA $9f20 
1861 : a5 2e __ LDA P1 ; (addr + 1)
1863 : 8d 21 9f STA $9f21 
1866 : a5 2f __ LDA P2 ; (addr + 2)
1868 : 29 01 __ AND #$01
186a : 09 10 __ ORA #$10
186c : 8d 22 9f STA $9f22 
186f : a5 33 __ LDA P6 ; (size + 0)
1871 : 05 34 __ ORA P7 ; (size + 1)
1873 : f0 19 __ BEQ $188e ; (vram_putn.s1001 + 0)
.s6:
1875 : a0 00 __ LDY #$00
1877 : a6 33 __ LDX P6 ; (size + 0)
1879 : f0 02 __ BEQ $187d ; (vram_putn.l1002 + 0)
.s1005:
187b : e6 34 __ INC P7 ; (size + 1)
.l1002:
187d : b1 31 __ LDA (P4),y ; (data + 0)
187f : 8d 23 9f STA $9f23 
1882 : c8 __ __ INY
1883 : d0 02 __ BNE $1887 ; (vram_putn.s1009 + 0)
.s1008:
1885 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1887 : ca __ __ DEX
1888 : d0 f3 __ BNE $187d ; (vram_putn.l1002 + 0)
.s1004:
188a : c6 34 __ DEC P7 ; (size + 1)
188c : d0 ef __ BNE $187d ; (vram_putn.l1002 + 0)
.s1001:
188e : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
2681 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2691 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26a1 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26b1 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26c1 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26d1 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26e1 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
26f1 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2701 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2711 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2721 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
2731 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
2741 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
2751 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
2761 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
2771 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
2781 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
2791 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
27a1 : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
27b1 : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
27c1 : __ __ __ BYT 55 55 55 55 55 55 55 55 66 66 66 66 33 33 33 33 : UUUUUUUUffff3333
27d1 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
27e1 : __ __ __ BYT 33 33 33 33 33 33 33 33 77 77 77 77 77 77 77 77 : 33333333wwwwwwww
27f1 : __ __ __ BYT 77 77 77 77 77 77 77 77 00 00 00 00 00 00 00 00 : wwwwwwww........
2801 : __ __ __ BYT 05 00 00 50 00 08 80 00 00 89 98 00 08 95 59 80 : ...P..........Y.
2811 : __ __ __ BYT 08 95 59 80 00 89 98 05 00 08 80 00 05 00 00 00 : ..Y.............
2821 : __ __ __ BYT 13 11 11 11 11 11 11 31 11 18 81 11 11 89 98 11 : .......1........
2831 : __ __ __ BYT 11 89 98 11 11 18 81 13 11 11 11 11 13 11 11 11 : ................
2841 : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 18 81 11 : ................
2851 : __ __ __ BYT 11 18 81 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
2861 : __ __ __ BYT aa aa aa aa ab bb bb bb ab cc cc cc ab cc cc cc : ................
2871 : __ __ __ BYT ab cc dd dd ab cc dd dd ab cc dd ee ab cc dd ef : ................
2881 : __ __ __ BYT aa aa aa aa bb bb bb bb cc cc cc cc cc cc cc cc : ................
2891 : __ __ __ BYT dd dd dd dd dd dd dd dd ee ee ee ee ff ff ff ff : ................
28a1 : __ __ __ BYT aa aa aa aa bb bb bb ba cc cc cc ba cc cc cc ba : ................
28b1 : __ __ __ BYT dd dd cc ba dd dd cc ba ee dd cc ba fe dd cc ba : ................
28c1 : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
28d1 : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
28e1 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
28f1 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
2901 : __ __ __ BYT ab cc dd ef ab cc dd ee ab cc dd dd ab cc dd dd : ................
2911 : __ __ __ BYT ab cc cc cc ab cc cc cc ab bb bb bb aa aa aa aa : ................
2921 : __ __ __ BYT ff ff ff ff ee ee ee ee dd dd dd dd dd dd dd dd : ................
2931 : __ __ __ BYT cc cc cc cc cc cc cc cc bb bb bb bb aa aa aa aa : ................
2941 : __ __ __ BYT fe dd cc ba ee dd cc ba dd dd cc ba dd dd cc ba : ................
2951 : __ __ __ BYT cc cc cc ba cc cc cc ba bb bb bb ba aa aa aa aa : ................
2961 : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
2971 : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
2981 : __ __ __ BYT 22 22 22 22 22 22 33 22 22 23 22 22 22 44 44 22 : """"""3""#"""DD"
2991 : __ __ __ BYT 24 84 84 82 22 44 44 22 23 23 32 32 22 22 22 22 : $..."DD"##22""""
--------------------------------------------------------------------
rand:
.s0:
188f : ad a2 29 LDA $29a2 ; (seed + 1)
1892 : 4a __ __ LSR
1893 : ad a1 29 LDA $29a1 ; (seed + 0)
1896 : 6a __ __ ROR
1897 : aa __ __ TAX
1898 : a9 00 __ LDA #$00
189a : 6a __ __ ROR
189b : 4d a1 29 EOR $29a1 ; (seed + 0)
189e : 85 3b __ STA ACCU + 0 
18a0 : 8a __ __ TXA
18a1 : 4d a2 29 EOR $29a2 ; (seed + 1)
18a4 : 85 3c __ STA ACCU + 1 
18a6 : 4a __ __ LSR
18a7 : 45 3b __ EOR ACCU + 0 
18a9 : 8d a1 29 STA $29a1 ; (seed + 0)
18ac : 85 3b __ STA ACCU + 0 
18ae : 45 3c __ EOR ACCU + 1 
18b0 : 8d a2 29 STA $29a2 ; (seed + 1)
18b3 : 85 3c __ STA ACCU + 1 
.s1001:
18b5 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
29a1 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
29a3 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
29b3 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
29c3 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
29d3 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
29e3 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
29f3 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
2a03 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
2a13 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
2a23 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
2a33 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
2a43 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
2a53 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
2a63 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
2a73 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
2a83 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
2a93 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
2aa3 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
2ab3 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
2ac3 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
2ad3 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
2ae3 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
2af3 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
2b03 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
2b13 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
2b23 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
2b33 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
2b43 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
2b53 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
2b63 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
2b73 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
2b83 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
2b93 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
2ba3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bb3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bc3 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
2bd3 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
2be3 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
2bf3 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
2c03 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
2c13 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
2c23 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
2c33 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
2c43 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c53 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c63 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
2c73 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
2c83 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
2c93 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
2ca3 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
2cb3 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
2cc3 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
2cd3 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2ce3 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2cf3 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2d03 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2d13 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2d23 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
2d33 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
2d43 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
2d53 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
2d63 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
2d73 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
2d83 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
2d93 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
18b6 : ad 25 9f LDA $9f25 
18b9 : 29 fe __ AND #$fe
18bb : 8d 25 9f STA $9f25 
18be : a5 2d __ LDA P0 ; (spr + 0)
18c0 : 0a __ __ ASL
18c1 : 0a __ __ ASL
18c2 : 85 3b __ STA ACCU + 0 
18c4 : a9 3f __ LDA #$3f
18c6 : 2a __ __ ROL
18c7 : 06 3b __ ASL ACCU + 0 
18c9 : 2a __ __ ROL
18ca : 8d 21 9f STA $9f21 
18cd : a5 3b __ LDA ACCU + 0 
18cf : 8d 20 9f STA $9f20 
18d2 : a9 11 __ LDA #$11
18d4 : 8d 22 9f STA $9f22 
18d7 : a5 30 __ LDA P3 ; (mode8 + 0)
18d9 : f0 02 __ BEQ $18dd ; (vera_spr_set.s11 + 0)
.s9:
18db : a9 80 __ LDA #$80
.s11:
18dd : 05 2f __ ORA P2 ; (addr32 + 1)
18df : a6 2e __ LDX P1 ; (addr32 + 0)
18e1 : 8e 23 9f STX $9f23 
18e4 : 8d 23 9f STA $9f23 
18e7 : a9 00 __ LDA #$00
18e9 : 8d 23 9f STA $9f23 
18ec : 8d 23 9f STA $9f23 
18ef : 8d 23 9f STA $9f23 
18f2 : 8d 23 9f STA $9f23 
18f5 : a5 33 __ LDA P6 ; (z + 0)
18f7 : 0a __ __ ASL
18f8 : 0a __ __ ASL
18f9 : 8d 23 9f STA $9f23 
18fc : a5 32 __ LDA P5 ; (h + 0)
18fe : 4a __ __ LSR
18ff : 6a __ __ ROR
1900 : 29 80 __ AND #$80
1902 : 6a __ __ ROR
1903 : 85 3b __ STA ACCU + 0 
1905 : a5 31 __ LDA P4 ; (w + 0)
1907 : 0a __ __ ASL
1908 : 0a __ __ ASL
1909 : 0a __ __ ASL
190a : 0a __ __ ASL
190b : 05 3b __ ORA ACCU + 0 
190d : 05 34 __ ORA P7 ; (pal + 0)
190f : 8d 23 9f STA $9f23 
.s1001:
1912 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
1913 : ad 25 9f LDA $9f25 
1916 : 29 fe __ AND #$fe
1918 : 8d 25 9f STA $9f25 
191b : a5 2d __ LDA P0 ; (spr + 0)
191d : 0a __ __ ASL
191e : 0a __ __ ASL
191f : 85 3b __ STA ACCU + 0 
1921 : a9 3f __ LDA #$3f
1923 : 2a __ __ ROL
1924 : 06 3b __ ASL ACCU + 0 
1926 : 2a __ __ ROL
1927 : aa __ __ TAX
1928 : a5 3b __ LDA ACCU + 0 
192a : 09 02 __ ORA #$02
192c : 8d 20 9f STA $9f20 
192f : 8e 21 9f STX $9f21 
1932 : a9 11 __ LDA #$11
1934 : 8d 22 9f STA $9f22 
1937 : a5 2e __ LDA P1 ; (x + 0)
1939 : 8d 23 9f STA $9f23 
193c : a5 2f __ LDA P2 ; (x + 1)
193e : 8d 23 9f STA $9f23 
1941 : a5 30 __ LDA P3 ; (y + 0)
1943 : 8d 23 9f STA $9f23 
1946 : a5 31 __ LDA P4 ; (y + 1)
1948 : 8d 23 9f STA $9f23 
.s1001:
194b : 60 __ __ RTS
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
194c : ad 25 9f LDA $9f25 
194f : 29 fe __ AND #$fe
1951 : 8d 25 9f STA $9f25 
1954 : a5 2d __ LDA P0 ; (spr + 0)
1956 : 0a __ __ ASL
1957 : 0a __ __ ASL
1958 : 85 3b __ STA ACCU + 0 
195a : a9 3f __ LDA #$3f
195c : 2a __ __ ROL
195d : 06 3b __ ASL ACCU + 0 
195f : 2a __ __ ROL
1960 : aa __ __ TAX
1961 : a5 3b __ LDA ACCU + 0 
1963 : 09 06 __ ORA #$06
1965 : 8d 20 9f STA $9f20 
1968 : 8e 21 9f STX $9f21 
196b : a9 01 __ LDA #$01
196d : 8d 22 9f STA $9f22 
1970 : ad 23 9f LDA $9f23 
1973 : 29 fc __ AND #$fc
1975 : a8 __ __ TAY
1976 : a5 2e __ LDA P1 ; (fliph + 0)
1978 : f0 01 __ BEQ $197b ; (vera_spr_flip.s14 + 0)
.s6:
197a : c8 __ __ INY
.s14:
197b : a5 2f __ LDA P2 ; (flipv + 0)
197d : f0 05 __ BEQ $1984 ; (vera_spr_flip.s11 + 0)
.s9:
197f : 98 __ __ TYA
1980 : 09 02 __ ORA #$02
1982 : d0 01 __ BNE $1985 ; (vera_spr_flip.s1002 + 0)
.s11:
1984 : 98 __ __ TYA
.s1002:
1985 : 8d 23 9f STA $9f23 
.s1001:
1988 : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1989 : ad 25 9f LDA $9f25 
198c : 29 fe __ AND #$fe
198e : 8d 25 9f STA $9f25 
1991 : a5 2d __ LDA P0 ; (index + 0)
1993 : 0a __ __ ASL
1994 : 8d 20 9f STA $9f20 
1997 : a9 7d __ LDA #$7d
1999 : 2a __ __ ROL
199a : 8d 21 9f STA $9f21 
199d : a9 11 __ LDA #$11
199f : 8d 22 9f STA $9f22 
19a2 : a5 30 __ LDA P3 ; (size + 0)
19a4 : 05 31 __ ORA P4 ; (size + 1)
19a6 : f0 29 __ BEQ $19d1 ; (vera_pal_putn.s1001 + 0)
.s6:
19a8 : a6 30 __ LDX P3 ; (size + 0)
19aa : f0 02 __ BEQ $19ae ; (vera_pal_putn.l3 + 0)
.s1003:
19ac : e6 31 __ INC P4 ; (size + 1)
.l3:
19ae : a0 01 __ LDY #$01
19b0 : b1 2e __ LDA (P1),y ; (color + 0)
19b2 : 85 3c __ STA ACCU + 1 
19b4 : 88 __ __ DEY
19b5 : b1 2e __ LDA (P1),y ; (color + 0)
19b7 : 8d 23 9f STA $9f23 
19ba : a5 3c __ LDA ACCU + 1 
19bc : 8d 23 9f STA $9f23 
19bf : 18 __ __ CLC
19c0 : a5 2e __ LDA P1 ; (color + 0)
19c2 : 69 02 __ ADC #$02
19c4 : 85 2e __ STA P1 ; (color + 0)
19c6 : 90 02 __ BCC $19ca ; (vera_pal_putn.s1007 + 0)
.s1006:
19c8 : e6 2f __ INC P2 ; (color + 1)
.s1007:
19ca : ca __ __ DEX
19cb : d0 e1 __ BNE $19ae ; (vera_pal_putn.l3 + 0)
.s1002:
19cd : c6 31 __ DEC P4 ; (size + 1)
19cf : d0 dd __ BNE $19ae ; (vera_pal_putn.l3 + 0)
.s1001:
19d1 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2da3 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2db3 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
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
4200 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
4210 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
4220 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
4230 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
4240 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
4250 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
4260 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
4270 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
BGPal:
2dc3 : __ __ __ BYT 24 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : $.......&.....f.
2dd3 : __ __ __ BYT 9f 0b ef 0e 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 : ......m.M.).+.-.
--------------------------------------------------------------------
ButtonStageMax:
4280 : __ __ __ BYT f4 04 e4 04 d4 04 c4 04 b3 03 a3 03 93 03 83 03 : ................
4290 : __ __ __ BYT 72 02 62 02 52 02 41 01 31 01 21 01 10 00 00 00 : r.b.R.A.1.!.....
--------------------------------------------------------------------
CharBoxPalette:
42a0 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 00 00 00 00 : ..m.M.).+.-.....
42b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavyPal:
2de3 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
42c0 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
42d0 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
2def : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
42e0 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
42f0 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
CoderPal:
4300 : __ __ __ BYT 00 00 00 00 ff 0f dd 0d b2 02 d4 04 e5 05 fb 00 : ................
4310 : __ __ __ BYT bf 00 10 0c 22 0f 1b 01 00 00 00 00             : ....".......
--------------------------------------------------------------------
EyeTri:
431c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
432c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
433c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
434c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
435c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
436c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
437c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
438c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
439c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43ac : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
43bc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43cc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
43dc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
43ec : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
43fc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
440c : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
441c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
442c : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
443c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
444c : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
445c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
446c : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
447c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
448c : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
449c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44ac : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
44bc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44cc : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
44dc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
44ec : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
44fc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
450c : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
451c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
452c : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
453c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
454c : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
455c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
456c : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
457c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
458c : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
459c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
45ac : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
45bc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
45cc : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
45dc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
45ec : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
45fc : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
460c : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
461c : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
462c : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
463c : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
464c : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
465c : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
466c : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
467c : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
468c : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
469c : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
46ac : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
46bc : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
46cc : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
46dc : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
46ec : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
46fc : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
470c : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
19d2 : a5 30 __ LDA P3 ; (name + 0)
19d4 : 85 2d __ STA P0 
19d6 : a5 31 __ LDA P4 ; (name + 1)
19d8 : 85 2e __ STA P1 
19da : 20 4f 1a JSR $1a4f ; (krnio_setnam.s0 + 0)
19dd : a5 32 __ LDA P5 ; (fnum + 0)
19df : 85 2d __ STA P0 
19e1 : a5 33 __ LDA P6 ; (device + 0)
19e3 : 85 2e __ STA P1 
19e5 : a5 34 __ LDA P7 ; (channel + 0)
19e7 : 85 2f __ STA P2 
19e9 : 20 65 1a JSR $1a65 ; (krnio_open.s0 + 0)
19ec : a5 32 __ LDA P5 ; (fnum + 0)
19ee : 20 8d 1a JSR $1a8d ; (krnio_chkin.s1000 + 0)
19f1 : 20 9f 1a JSR $1a9f ; (krnio_chrin.s0 + 0)
19f4 : 20 9f 1a JSR $1a9f ; (krnio_chrin.s0 + 0)
19f7 : ad fb 9e LDA $9efb ; (sstack + 1)
19fa : 85 48 __ STA T0 + 1 
19fc : ad fa 9e LDA $9efa ; (sstack + 0)
19ff : 85 47 __ STA T0 + 0 
1a01 : 05 48 __ ORA T0 + 1 
1a03 : f0 42 __ BEQ $1a47 ; (LoadSprite.s4 + 0)
.s8:
1a05 : a9 00 __ LDA #$00
1a07 : 85 49 __ STA T2 + 0 
1a09 : 85 4a __ STA T2 + 1 
.l2:
1a0b : 20 9f 1a JSR $1a9f ; (krnio_chrin.s0 + 0)
1a0e : ad 25 9f LDA $9f25 
1a11 : 29 fe __ AND #$fe
1a13 : 8d 25 9f STA $9f25 
1a16 : 18 __ __ CLC
1a17 : a5 49 __ LDA T2 + 0 
1a19 : 65 35 __ ADC P8 ; (Addr + 0)
1a1b : 8d 20 9f STA $9f20 
1a1e : a5 4a __ LDA T2 + 1 
1a20 : 65 36 __ ADC P9 ; (Addr + 1)
1a22 : 8d 21 9f STA $9f21 
1a25 : a9 00 __ LDA #$00
1a27 : 65 37 __ ADC P10 ; (Addr + 2)
1a29 : 29 01 __ AND #$01
1a2b : 09 10 __ ORA #$10
1a2d : 8d 22 9f STA $9f22 
1a30 : a5 3b __ LDA ACCU + 0 
1a32 : 8d 23 9f STA $9f23 
1a35 : e6 49 __ INC T2 + 0 
1a37 : d0 02 __ BNE $1a3b ; (LoadSprite.s1005 + 0)
.s1004:
1a39 : e6 4a __ INC T2 + 1 
.s1005:
1a3b : a5 4a __ LDA T2 + 1 
1a3d : c5 48 __ CMP T0 + 1 
1a3f : d0 04 __ BNE $1a45 ; (LoadSprite.s1003 + 0)
.s1002:
1a41 : a5 49 __ LDA T2 + 0 
1a43 : c5 47 __ CMP T0 + 0 
.s1003:
1a45 : 90 c4 __ BCC $1a0b ; (LoadSprite.l2 + 0)
.s4:
1a47 : 20 a9 1a JSR $1aa9 ; (krnio_clrchn.s0 + 0)
1a4a : a5 32 __ LDA P5 ; (fnum + 0)
1a4c : 4c ad 1a JMP $1aad ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
1a4f : a5 2d __ LDA P0 
1a51 : 05 2e __ ORA P1 
1a53 : f0 08 __ BEQ $1a5d ; (krnio_setnam.s0 + 14)
1a55 : a0 ff __ LDY #$ff
1a57 : c8 __ __ INY
1a58 : b1 2d __ LDA (P0),y 
1a5a : d0 fb __ BNE $1a57 ; (krnio_setnam.s0 + 8)
1a5c : 98 __ __ TYA
1a5d : a6 2d __ LDX P0 
1a5f : a4 2e __ LDY P1 
1a61 : 20 bd ff JSR $ffbd 
.s1001:
1a64 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1a65 : a9 00 __ LDA #$00
1a67 : a6 2d __ LDX P0 ; (fnum + 0)
1a69 : 9d 7b 56 STA $567b,x ; (krnio_pstatus + 0)
1a6c : a9 00 __ LDA #$00
1a6e : 85 3b __ STA ACCU + 0 
1a70 : 85 3c __ STA ACCU + 1 
1a72 : a5 2d __ LDA P0 ; (fnum + 0)
1a74 : a6 2e __ LDX P1 
1a76 : a4 2f __ LDY P2 
1a78 : 20 ba ff JSR $ffba 
1a7b : 20 c0 ff JSR $ffc0 
1a7e : 90 08 __ BCC $1a88 ; (krnio_open.s0 + 35)
1a80 : a5 2d __ LDA P0 ; (fnum + 0)
1a82 : 20 c3 ff JSR $ffc3 
1a85 : 4c 8c 1a JMP $1a8c ; (krnio_open.s1001 + 0)
1a88 : a9 01 __ LDA #$01
1a8a : 85 3b __ STA ACCU + 0 
.s1001:
1a8c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
567b : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a8d : 85 2d __ STA P0 
.s0:
1a8f : a6 2d __ LDX P0 
1a91 : 20 c6 ff JSR $ffc6 
1a94 : a9 00 __ LDA #$00
1a96 : 85 3c __ STA ACCU + 1 
1a98 : b0 02 __ BCS $1a9c ; (krnio_chkin.s0 + 13)
1a9a : a9 01 __ LDA #$01
1a9c : 85 3b __ STA ACCU + 0 
.s1001:
1a9e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a9f : 20 cf ff JSR $ffcf 
1aa2 : 85 3b __ STA ACCU + 0 
1aa4 : a9 00 __ LDA #$00
1aa6 : 85 3c __ STA ACCU + 1 
.s1001:
1aa8 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1aa9 : 20 cc ff JSR $ffcc 
.s1001:
1aac : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1aad : 85 2d __ STA P0 
.s0:
1aaf : a5 2d __ LDA P0 
1ab1 : 20 c3 ff JSR $ffc3 
.s1001:
1ab4 : 60 __ __ RTS
--------------------------------------------------------------------
1ab5 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1ac5 : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1ad4 : a9 10 __ LDA #$10
1ad6 : 85 30 __ STA P3 
1ad8 : a9 00 __ LDA #$00
1ada : 85 31 __ STA P4 
1adc : a5 32 __ LDA P5 ; (Palette + 0)
1ade : 85 2e __ STA P1 
1ae0 : 85 47 __ STA T0 + 0 
1ae2 : a5 33 __ LDA P6 ; (Palette + 1)
1ae4 : 85 2f __ STA P2 
1ae6 : 85 48 __ STA T0 + 1 
1ae8 : a5 34 __ LDA P7 ; (index + 0)
1aea : 85 2d __ STA P0 
1aec : ad fa 9e LDA $9efa ; (sstack + 0)
1aef : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1af1 : 0a __ __ ASL
1af2 : 85 49 __ STA T3 + 0 
1af4 : ad fb 9e LDA $9efb ; (sstack + 1)
1af7 : 2a __ __ ROL
1af8 : 18 __ __ CLC
1af9 : 65 33 __ ADC P6 ; (Palette + 1)
1afb : 85 4a __ STA T3 + 1 
1afd : a4 32 __ LDY P5 ; (Palette + 0)
1aff : b1 49 __ LDA (T3 + 0),y 
1b01 : aa __ __ TAX
1b02 : c8 __ __ INY
1b03 : b1 49 __ LDA (T3 + 0),y 
1b05 : 86 49 __ STX T3 + 0 
1b07 : 85 4a __ STA T3 + 1 
1b09 : a9 00 __ LDA #$00
1b0b : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b0d : ad fc 9e LDA $9efc ; (sstack + 2)
1b10 : 85 4b __ STA T5 + 0 
1b12 : 38 __ __ SEC
1b13 : e9 01 __ SBC #$01
1b15 : 85 4d __ STA T6 + 0 
1b17 : ad fd 9e LDA $9efd ; (sstack + 3)
1b1a : 85 4c __ STA T5 + 1 
1b1c : e9 00 __ SBC #$00
1b1e : 85 4e __ STA T6 + 1 
1b20 : d0 06 __ BNE $1b28 ; (SetPaletteIndex.s5 + 0)
.s1004:
1b22 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b24 : c5 4d __ CMP T6 + 0 
1b26 : b0 38 __ BCS $1b60 ; (SetPaletteIndex.s4 + 0)
.s5:
1b28 : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1b2a : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1b2c : 18 __ __ CLC
1b2d : a5 32 __ LDA P5 ; (Palette + 0)
1b2f : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1b31 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b33 : a5 33 __ LDA P6 ; (Palette + 1)
1b35 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1b37 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b39 : ae fa 9e LDX $9efa ; (sstack + 0)
.l2:
1b3c : a0 02 __ LDY #$02
1b3e : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b40 : a0 00 __ LDY #$00
1b42 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b44 : a0 03 __ LDY #$03
1b46 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b48 : a0 01 __ LDY #$01
1b4a : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b4c : 18 __ __ CLC
1b4d : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b4f : 69 02 __ ADC #$02
1b51 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b53 : 90 02 __ BCC $1b57 ; (SetPaletteIndex.s1008 + 0)
.s1007:
1b55 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1b57 : e8 __ __ INX
1b58 : a5 4e __ LDA T6 + 1 
1b5a : d0 e0 __ BNE $1b3c ; (SetPaletteIndex.l2 + 0)
.s1002:
1b5c : e4 4d __ CPX T6 + 0 
1b5e : 90 dc __ BCC $1b3c ; (SetPaletteIndex.l2 + 0)
.s4:
1b60 : a5 4b __ LDA T5 + 0 
1b62 : 0a __ __ ASL
1b63 : aa __ __ TAX
1b64 : a5 4c __ LDA T5 + 1 
1b66 : 2a __ __ ROL
1b67 : a8 __ __ TAY
1b68 : 8a __ __ TXA
1b69 : 38 __ __ SEC
1b6a : e9 02 __ SBC #$02
1b6c : b0 01 __ BCS $1b6f ; (SetPaletteIndex.s1010 + 0)
.s1009:
1b6e : 88 __ __ DEY
.s1010:
1b6f : 18 __ __ CLC
1b70 : 65 47 __ ADC T0 + 0 
1b72 : 85 47 __ STA T0 + 0 
1b74 : 98 __ __ TYA
1b75 : 65 48 __ ADC T0 + 1 
1b77 : 85 48 __ STA T0 + 1 
1b79 : a5 49 __ LDA T3 + 0 
1b7b : a0 00 __ LDY #$00
1b7d : 91 47 __ STA (T0 + 0),y 
1b7f : a5 4a __ LDA T3 + 1 
1b81 : c8 __ __ INY
1b82 : 91 47 __ STA (T0 + 0),y 
1b84 : 4c 89 19 JMP $1989 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
TowerPalF1:
471c : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
472c : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
getchx:
.s0:
1b87 : 20 91 1b JSR $1b91 ; (getpch + 0)
1b8a : 85 3b __ STA ACCU + 0 
1b8c : a9 00 __ LDA #$00
1b8e : 85 3c __ STA ACCU + 1 
.s1001:
1b90 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1b91 : 20 e4 ff JSR $ffe4 
1b94 : ae ff 2d LDX $2dff ; (giocharmap + 0)
1b97 : e0 01 __ CPX #$01
1b99 : 90 26 __ BCC $1bc1 ; (getpch + 48)
1b9b : c9 0d __ CMP #$0d
1b9d : d0 02 __ BNE $1ba1 ; (getpch + 16)
1b9f : a9 0a __ LDA #$0a
1ba1 : e0 02 __ CPX #$02
1ba3 : 90 1c __ BCC $1bc1 ; (getpch + 48)
1ba5 : c9 db __ CMP #$db
1ba7 : b0 18 __ BCS $1bc1 ; (getpch + 48)
1ba9 : c9 41 __ CMP #$41
1bab : 90 14 __ BCC $1bc1 ; (getpch + 48)
1bad : c9 c1 __ CMP #$c1
1baf : 90 02 __ BCC $1bb3 ; (getpch + 34)
1bb1 : 49 a0 __ EOR #$a0
1bb3 : c9 7b __ CMP #$7b
1bb5 : b0 0a __ BCS $1bc1 ; (getpch + 48)
1bb7 : c9 61 __ CMP #$61
1bb9 : b0 04 __ BCS $1bbf ; (getpch + 46)
1bbb : c9 5b __ CMP #$5b
1bbd : b0 02 __ BCS $1bc1 ; (getpch + 48)
1bbf : 49 20 __ EOR #$20
1bc1 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
2dff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
42fa : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
42fc : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
42fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
473c : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1bc2 : a9 33 __ LDA #$33
1bc4 : 85 2d __ STA P0 
1bc6 : a9 38 __ LDA #$38
1bc8 : 85 2e __ STA P1 
1bca : a9 01 __ LDA #$01
1bcc : 85 2f __ STA P2 
1bce : a6 32 __ LDX P5 ; (p + 0)
1bd0 : bd 00 48 LDA $4800,x ; (sintab + 0)
1bd3 : 4a __ __ LSR
1bd4 : 4a __ __ LSR
1bd5 : 4a __ __ LSR
1bd6 : 49 10 __ EOR #$10
1bd8 : 38 __ __ SEC
1bd9 : e9 10 __ SBC #$10
1bdb : 18 __ __ CLC
1bdc : 69 b4 __ ADC #$b4
1bde : 85 30 __ STA P3 
1be0 : a9 00 __ LDA #$00
1be2 : 85 31 __ STA P4 
1be4 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1be7 : a9 34 __ LDA #$34
1be9 : 85 2d __ STA P0 
1beb : a9 20 __ LDA #$20
1bed : 85 2e __ STA P1 
1bef : a6 34 __ LDX P7 ; (p2 + 0)
1bf1 : bd 00 48 LDA $4800,x ; (sintab + 0)
1bf4 : 4a __ __ LSR
1bf5 : 4a __ __ LSR
1bf6 : 4a __ __ LSR
1bf7 : 49 10 __ EOR #$10
1bf9 : 38 __ __ SEC
1bfa : e9 10 __ SBC #$10
1bfc : 18 __ __ CLC
1bfd : 69 b4 __ ADC #$b4
1bff : 85 30 __ STA P3 
1c01 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1c04 : a9 35 __ LDA #$35
1c06 : 85 2d __ STA P0 
1c08 : a9 00 __ LDA #$00
1c0a : 85 2e __ STA P1 
1c0c : a6 36 __ LDX P9 ; (p3 + 0)
1c0e : bd 00 48 LDA $4800,x ; (sintab + 0)
1c11 : 4a __ __ LSR
1c12 : 4a __ __ LSR
1c13 : 4a __ __ LSR
1c14 : 49 10 __ EOR #$10
1c16 : 38 __ __ SEC
1c17 : e9 10 __ SBC #$10
1c19 : 18 __ __ CLC
1c1a : 69 a4 __ ADC #$a4
1c1c : 85 30 __ STA P3 
1c1e : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1c21 : a9 36 __ LDA #$36
1c23 : 85 2d __ STA P0 
1c25 : a9 40 __ LDA #$40
1c27 : 85 2e __ STA P1 
1c29 : a6 36 __ LDX P9 ; (p3 + 0)
1c2b : bd 00 48 LDA $4800,x ; (sintab + 0)
1c2e : 4a __ __ LSR
1c2f : 4a __ __ LSR
1c30 : 4a __ __ LSR
1c31 : 49 10 __ EOR #$10
1c33 : 38 __ __ SEC
1c34 : e9 10 __ SBC #$10
1c36 : 18 __ __ CLC
1c37 : 69 a4 __ ADC #$a4
1c39 : 85 30 __ STA P3 
1c3b : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1c3e : a9 37 __ LDA #$37
1c40 : 85 2d __ STA P0 
1c42 : a9 00 __ LDA #$00
1c44 : 85 2e __ STA P1 
1c46 : a6 36 __ LDX P9 ; (p3 + 0)
1c48 : bd 00 48 LDA $4800,x ; (sintab + 0)
1c4b : 4a __ __ LSR
1c4c : 4a __ __ LSR
1c4d : 4a __ __ LSR
1c4e : 49 10 __ EOR #$10
1c50 : 38 __ __ SEC
1c51 : e9 10 __ SBC #$10
1c53 : 18 __ __ CLC
1c54 : 69 c4 __ ADC #$c4
1c56 : 85 30 __ STA P3 
1c58 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1c5b : a9 38 __ LDA #$38
1c5d : 85 2d __ STA P0 
1c5f : a9 40 __ LDA #$40
1c61 : 85 2e __ STA P1 
1c63 : a6 36 __ LDX P9 ; (p3 + 0)
1c65 : bd 00 48 LDA $4800,x ; (sintab + 0)
1c68 : 4a __ __ LSR
1c69 : 4a __ __ LSR
1c6a : 4a __ __ LSR
1c6b : 49 10 __ EOR #$10
1c6d : 38 __ __ SEC
1c6e : e9 10 __ SBC #$10
1c70 : 18 __ __ CLC
1c71 : 69 c4 __ ADC #$c4
1c73 : 85 30 __ STA P3 
1c75 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1c78 : a9 00 __ LDA #$00
1c7a : 85 2d __ STA P0 
1c7c : 85 2f __ STA P2 
1c7e : a9 68 __ LDA #$68
1c80 : 85 2e __ STA P1 
1c82 : a6 36 __ LDX P9 ; (p3 + 0)
1c84 : bd 00 48 LDA $4800,x ; (sintab + 0)
1c87 : 4a __ __ LSR
1c88 : 4a __ __ LSR
1c89 : 4a __ __ LSR
1c8a : 4a __ __ LSR
1c8b : 49 08 __ EOR #$08
1c8d : 38 __ __ SEC
1c8e : e9 08 __ SBC #$08
1c90 : 85 48 __ STA T2 + 0 
1c92 : a9 00 __ LDA #$00
1c94 : e9 00 __ SBC #$00
1c96 : 85 49 __ STA T2 + 1 
1c98 : 38 __ __ SEC
1c99 : a9 b6 __ LDA #$b6
1c9b : e5 48 __ SBC T2 + 0 
1c9d : 85 30 __ STA P3 
1c9f : a9 01 __ LDA #$01
1ca1 : e5 49 __ SBC T2 + 1 
1ca3 : 85 31 __ STA P4 
1ca5 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1ca8 : a9 01 __ LDA #$01
1caa : 85 2d __ STA P0 
1cac : 85 2f __ STA P2 
1cae : a9 f0 __ LDA #$f0
1cb0 : 85 2e __ STA P1 
1cb2 : a6 36 __ LDX P9 ; (p3 + 0)
1cb4 : bd 00 48 LDA $4800,x ; (sintab + 0)
1cb7 : 4a __ __ LSR
1cb8 : 4a __ __ LSR
1cb9 : 4a __ __ LSR
1cba : 4a __ __ LSR
1cbb : 49 08 __ EOR #$08
1cbd : 38 __ __ SEC
1cbe : e9 08 __ SBC #$08
1cc0 : a8 __ __ TAY
1cc1 : a9 00 __ LDA #$00
1cc3 : e9 00 __ SBC #$00
1cc5 : aa __ __ TAX
1cc6 : 98 __ __ TYA
1cc7 : 18 __ __ CLC
1cc8 : 69 b6 __ ADC #$b6
1cca : 85 30 __ STA P3 
1ccc : 8a __ __ TXA
1ccd : 69 01 __ ADC #$01
1ccf : 85 31 __ STA P4 
1cd1 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1cd4 : a9 00 __ LDA #$00
1cd6 : 85 47 __ STA T1 + 0 
1cd8 : 18 __ __ CLC
.l2:
1cd9 : a5 47 __ LDA T1 + 0 
1cdb : 69 4f __ ADC #$4f
1cdd : 85 2d __ STA P0 
1cdf : a5 47 __ LDA T1 + 0 
1ce1 : 0a __ __ ASL
1ce2 : 65 47 __ ADC T1 + 0 
1ce4 : 0a __ __ ASL
1ce5 : 0a __ __ ASL
1ce6 : 18 __ __ CLC
1ce7 : 6d 3e 47 ADC $473e ; (FrameCount + 0)
1cea : aa __ __ TAX
1ceb : ac 3f 47 LDY $473f ; (FrameCount + 1)
1cee : bd 00 48 LDA $4800,x ; (sintab + 0)
1cf1 : 10 01 __ BPL $1cf4 ; (MoveSprites.s1008 + 0)
.s1007:
1cf3 : 88 __ __ DEY
.s1008:
1cf4 : 18 __ __ CLC
1cf5 : 6d 3e 47 ADC $473e ; (FrameCount + 0)
1cf8 : 85 48 __ STA T2 + 0 
1cfa : 90 01 __ BCC $1cfd ; (MoveSprites.s1009 + 0)
.s1006:
1cfc : c8 __ __ INY
.s1009:
1cfd : 84 49 __ STY T2 + 1 
1cff : a5 47 __ LDA T1 + 0 
1d01 : 0a __ __ ASL
1d02 : 0a __ __ ASL
1d03 : 85 3b __ STA ACCU + 0 
1d05 : a9 00 __ LDA #$00
1d07 : 85 3c __ STA ACCU + 1 
1d09 : a9 80 __ LDA #$80
1d0b : 85 23 __ STA WORK + 0 
1d0d : a9 02 __ LDA #$02
1d0f : 85 24 __ STA WORK + 1 
1d11 : 20 aa 25 JSR $25aa ; (divmod + 0)
1d14 : 18 __ __ CLC
1d15 : a5 25 __ LDA WORK + 2 
1d17 : 65 48 __ ADC T2 + 0 
1d19 : 85 2e __ STA P1 
1d1b : a5 26 __ LDA WORK + 3 
1d1d : 65 49 __ ADC T2 + 1 
1d1f : 85 2f __ STA P2 
1d21 : a5 47 __ LDA T1 + 0 
1d23 : 0a __ __ ASL
1d24 : 0a __ __ ASL
1d25 : 65 47 __ ADC T1 + 0 
1d27 : 85 48 __ STA T2 + 0 
1d29 : ad 3e 47 LDA $473e ; (FrameCount + 0)
1d2c : 38 __ __ SEC
1d2d : e9 40 __ SBC #$40
1d2f : 18 __ __ CLC
1d30 : 65 48 __ ADC T2 + 0 
1d32 : aa __ __ TAX
1d33 : bd 00 48 LDA $4800,x ; (sintab + 0)
1d36 : 4a __ __ LSR
1d37 : 49 40 __ EOR #$40
1d39 : 38 __ __ SEC
1d3a : e9 40 __ SBC #$40
1d3c : a8 __ __ TAY
1d3d : a9 00 __ LDA #$00
1d3f : e9 00 __ SBC #$00
1d41 : 85 49 __ STA T2 + 1 
1d43 : a5 47 __ LDA T1 + 0 
1d45 : 0a __ __ ASL
1d46 : 0a __ __ ASL
1d47 : 0a __ __ ASL
1d48 : 85 3b __ STA ACCU + 0 
1d4a : ad 3e 47 LDA $473e ; (FrameCount + 0)
1d4d : 38 __ __ SEC
1d4e : e9 20 __ SBC #$20
1d50 : 18 __ __ CLC
1d51 : 65 3b __ ADC ACCU + 0 
1d53 : aa __ __ TAX
1d54 : bd 00 48 LDA $4800,x ; (sintab + 0)
1d57 : 4a __ __ LSR
1d58 : 4a __ __ LSR
1d59 : 4a __ __ LSR
1d5a : 4a __ __ LSR
1d5b : 49 08 __ EOR #$08
1d5d : 38 __ __ SEC
1d5e : e9 08 __ SBC #$08
1d60 : 85 4a __ STA T3 + 0 
1d62 : a9 00 __ LDA #$00
1d64 : e9 00 __ SBC #$00
1d66 : 85 4b __ STA T3 + 1 
1d68 : a5 47 __ LDA T1 + 0 
1d6a : 0a __ __ ASL
1d6b : 65 47 __ ADC T1 + 0 
1d6d : 85 3b __ STA ACCU + 0 
1d6f : a5 47 __ LDA T1 + 0 
1d71 : c9 17 __ CMP #$17
1d73 : f0 2d __ BEQ $1da2 ; (MoveSprites.s5 + 0)
.s6:
1d75 : 98 __ __ TYA
1d76 : 18 __ __ CLC
1d77 : 69 c4 __ ADC #$c4
1d79 : a8 __ __ TAY
1d7a : a5 49 __ LDA T2 + 1 
1d7c : 69 00 __ ADC #$00
1d7e : aa __ __ TAX
1d7f : 98 __ __ TYA
1d80 : 18 __ __ CLC
1d81 : 65 4a __ ADC T3 + 0 
1d83 : a8 __ __ TAY
1d84 : 8a __ __ TXA
1d85 : 65 4b __ ADC T3 + 1 
1d87 : aa __ __ TAX
1d88 : 98 __ __ TYA
1d89 : 18 __ __ CLC
1d8a : 65 3b __ ADC ACCU + 0 
1d8c : 85 30 __ STA P3 
1d8e : 90 01 __ BCC $1d91 ; (MoveSprites.s1013 + 0)
.s1012:
1d90 : e8 __ __ INX
.s1013:
1d91 : 86 31 __ STX P4 
1d93 : 20 13 19 JSR $1913 ; (vera_spr_move.s0 + 0)
1d96 : e6 47 __ INC T1 + 0 
1d98 : a5 47 __ LDA T1 + 0 
1d9a : c9 18 __ CMP #$18
1d9c : b0 03 __ BCS $1da1 ; (MoveSprites.s1001 + 0)
1d9e : 4c d9 1c JMP $1cd9 ; (MoveSprites.l2 + 0)
.s1001:
1da1 : 60 __ __ RTS
.s5:
1da2 : 98 __ __ TYA
1da3 : 18 __ __ CLC
1da4 : 69 bc __ ADC #$bc
1da6 : 18 __ __ CLC
1da7 : 65 4a __ ADC T3 + 0 
1da9 : a8 __ __ TAY
1daa : a9 00 __ LDA #$00
1dac : 65 4b __ ADC T3 + 1 
1dae : aa __ __ TAX
1daf : 98 __ __ TYA
1db0 : 18 __ __ CLC
1db1 : 65 3b __ ADC ACCU + 0 
1db3 : 85 30 __ STA P3 
1db5 : 90 01 __ BCC $1db8 ; (MoveSprites.s1011 + 0)
.s1010:
1db7 : e8 __ __ INX
.s1011:
1db8 : 86 31 __ STX P4 
1dba : 4c 13 19 JMP $1913 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4800 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4810 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4820 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4830 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4840 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4850 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4860 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4870 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4880 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4890 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
48a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
48b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
48c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
48d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
48e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
48f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
473e : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1dbd : a9 08 __ LDA #$08
1dbf : 8d 2c 9f STA $9f2c 
1dc2 : ad fd 9e LDA $9efd ; (sstack + 3)
1dc5 : cd ff 9e CMP $9eff ; (sstack + 5)
1dc8 : d0 10 __ BNE $1dda ; (PlayZSM.s1 + 0)
.s1010:
1dca : ad fc 9e LDA $9efc ; (sstack + 2)
1dcd : cd fe 9e CMP $9efe ; (sstack + 4)
1dd0 : d0 08 __ BNE $1dda ; (PlayZSM.s1 + 0)
.s4:
1dd2 : 20 05 20 JSR $2005 ; (zsm_check.s0 + 0)
1dd5 : 09 00 __ ORA #$00
1dd7 : d0 01 __ BNE $1dda ; (PlayZSM.s1 + 0)
1dd9 : 60 __ __ RTS
.s1:
1dda : ac fc 9e LDY $9efc ; (sstack + 2)
1ddd : ad fd 9e LDA $9efd ; (sstack + 3)
1de0 : d0 51 __ BNE $1e33 ; (PlayZSM.s20 + 0)
.s1009:
1de2 : c0 04 __ CPY #$04
1de4 : d0 4d __ BNE $1e33 ; (PlayZSM.s20 + 0)
.s14:
1de6 : a9 dd __ LDA #$dd
1de8 : 85 30 __ STA P3 
1dea : a9 21 __ LDA #$21
1dec : 85 31 __ STA P4 
1dee : 20 28 20 JSR $2028 ; (zsm_init.s0 + 0)
1df1 : a9 03 __ LDA #$03
1df3 : 85 32 __ STA P5 
1df5 : 85 34 __ STA P7 
1df7 : a9 08 __ LDA #$08
1df9 : 85 33 __ STA P6 
1dfb : a9 00 __ LDA #$00
1dfd : 8d fa 9e STA $9efa ; (sstack + 0)
1e00 : a9 20 __ LDA #$20
1e02 : 8d fb 9e STA $9efb ; (sstack + 1)
1e05 : a9 7b __ LDA #$7b
1e07 : 85 30 __ STA P3 
1e09 : a9 22 __ LDA #$22
1e0b : 85 31 __ STA P4 
1e0d : ad 79 26 LDA $2679 ; (VolAddr + 0)
1e10 : 85 35 __ STA P8 
1e12 : ad 7a 26 LDA $267a ; (VolAddr + 1)
1e15 : 85 36 __ STA P9 
1e17 : ad 7b 26 LDA $267b ; (VolAddr + 2)
1e1a : 85 37 __ STA P10 
1e1c : ad 7c 26 LDA $267c ; (VolAddr + 3)
1e1f : 85 38 __ STA P11 
1e21 : 20 d2 19 JSR $19d2 ; (LoadSprite.s0 + 0)
1e24 : a9 20 __ LDA #$20
1e26 : 85 30 __ STA P3 
1e28 : a9 00 __ LDA #$00
1e2a : 85 31 __ STA P4 
1e2c : a9 47 __ LDA #$47
1e2e : a0 81 __ LDY #$81
1e30 : 4c e9 1e JMP $1ee9 ; (PlayZSM.s32 + 0)
.s20:
1e33 : ad fd 9e LDA $9efd ; (sstack + 3)
1e36 : 10 03 __ BPL $1e3b ; (PlayZSM.s1008 + 0)
1e38 : 4c f4 1e JMP $1ef4 ; (PlayZSM.s22 + 0)
.s1008:
1e3b : d0 07 __ BNE $1e44 ; (PlayZSM.s21 + 0)
.s1007:
1e3d : c0 04 __ CPY #$04
1e3f : b0 03 __ BCS $1e44 ; (PlayZSM.s21 + 0)
1e41 : 4c f4 1e JMP $1ef4 ; (PlayZSM.s22 + 0)
.s21:
1e44 : 09 00 __ ORA #$00
1e46 : d0 56 __ BNE $1e9e ; (PlayZSM.s1001 + 0)
.s1003:
1e48 : 98 __ __ TYA
1e49 : c0 05 __ CPY #$05
1e4b : d0 4d __ BNE $1e9a ; (PlayZSM.s1002 + 0)
.s16:
1e4d : a9 98 __ LDA #$98
1e4f : 85 30 __ STA P3 
1e51 : a9 22 __ LDA #$22
1e53 : 85 31 __ STA P4 
1e55 : 20 28 20 JSR $2028 ; (zsm_init.s0 + 0)
1e58 : a9 03 __ LDA #$03
1e5a : 85 32 __ STA P5 
1e5c : 85 34 __ STA P7 
1e5e : a9 08 __ LDA #$08
1e60 : 85 33 __ STA P6 
1e62 : a9 00 __ LDA #$00
1e64 : 8d fa 9e STA $9efa ; (sstack + 0)
1e67 : a9 20 __ LDA #$20
1e69 : 8d fb 9e STA $9efb ; (sstack + 1)
1e6c : a9 b9 __ LDA #$b9
1e6e : 85 30 __ STA P3 
1e70 : a9 22 __ LDA #$22
1e72 : 85 31 __ STA P4 
1e74 : ad 79 26 LDA $2679 ; (VolAddr + 0)
1e77 : 85 35 __ STA P8 
1e79 : ad 7a 26 LDA $267a ; (VolAddr + 1)
1e7c : 85 36 __ STA P9 
1e7e : ad 7b 26 LDA $267b ; (VolAddr + 2)
1e81 : 85 37 __ STA P10 
1e83 : ad 7c 26 LDA $267c ; (VolAddr + 3)
1e86 : 85 38 __ STA P11 
1e88 : 20 d2 19 JSR $19d2 ; (LoadSprite.s0 + 0)
1e8b : a9 20 __ LDA #$20
1e8d : 85 30 __ STA P3 
1e8f : a9 00 __ LDA #$00
1e91 : 85 31 __ STA P4 
1e93 : a9 47 __ LDA #$47
1e95 : a0 a1 __ LDY #$a1
1e97 : 4c e9 1e JMP $1ee9 ; (PlayZSM.s32 + 0)
.s1002:
1e9a : c9 06 __ CMP #$06
1e9c : f0 01 __ BEQ $1e9f ; (PlayZSM.s18 + 0)
.s1001:
1e9e : 60 __ __ RTS
.s18:
1e9f : a9 d8 __ LDA #$d8
1ea1 : 85 30 __ STA P3 
1ea3 : a9 22 __ LDA #$22
1ea5 : 85 31 __ STA P4 
1ea7 : 20 28 20 JSR $2028 ; (zsm_init.s0 + 0)
1eaa : a9 03 __ LDA #$03
1eac : 85 32 __ STA P5 
1eae : 85 34 __ STA P7 
1eb0 : a9 08 __ LDA #$08
1eb2 : 85 33 __ STA P6 
1eb4 : a9 00 __ LDA #$00
1eb6 : 8d fa 9e STA $9efa ; (sstack + 0)
1eb9 : a9 20 __ LDA #$20
1ebb : 8d fb 9e STA $9efb ; (sstack + 1)
1ebe : a9 00 __ LDA #$00
1ec0 : 85 30 __ STA P3 
1ec2 : a9 23 __ LDA #$23
1ec4 : 85 31 __ STA P4 
1ec6 : ad 79 26 LDA $2679 ; (VolAddr + 0)
1ec9 : 85 35 __ STA P8 
1ecb : ad 7a 26 LDA $267a ; (VolAddr + 1)
1ece : 85 36 __ STA P9 
1ed0 : ad 7b 26 LDA $267b ; (VolAddr + 2)
1ed3 : 85 37 __ STA P10 
1ed5 : ad 7c 26 LDA $267c ; (VolAddr + 3)
1ed8 : 85 38 __ STA P11 
1eda : 20 d2 19 JSR $19d2 ; (LoadSprite.s0 + 0)
1edd : a9 20 __ LDA #$20
1edf : 85 30 __ STA P3 
1ee1 : a9 00 __ LDA #$00
1ee3 : 85 31 __ STA P4 
1ee5 : a9 47 __ LDA #$47
1ee7 : a0 c1 __ LDY #$c1
.s32:
1ee9 : 84 2e __ STY P1 
1eeb : 85 2f __ STA P2 
1eed : a9 b0 __ LDA #$b0
1eef : 85 2d __ STA P0 
1ef1 : 4c 89 19 JMP $1989 ; (vera_pal_putn.s0 + 0)
.s22:
1ef4 : 98 __ __ TYA
1ef5 : 0d fd 9e ORA $9efd ; (sstack + 3)
1ef8 : d0 03 __ BNE $1efd ; (PlayZSM.s23 + 0)
1efa : 4c c3 1f JMP $1fc3 ; (PlayZSM.s6 + 0)
.s23:
1efd : ad fd 9e LDA $9efd ; (sstack + 3)
1f00 : d0 9c __ BNE $1e9e ; (PlayZSM.s1001 + 0)
.s1006:
1f02 : 98 __ __ TYA
1f03 : c0 01 __ CPY #$01
1f05 : d0 4d __ BNE $1f54 ; (PlayZSM.s1005 + 0)
.s8:
1f07 : a9 7d __ LDA #$7d
1f09 : 85 30 __ STA P3 
1f0b : a9 21 __ LDA #$21
1f0d : 85 31 __ STA P4 
1f0f : 20 28 20 JSR $2028 ; (zsm_init.s0 + 0)
1f12 : a9 03 __ LDA #$03
1f14 : 85 32 __ STA P5 
1f16 : 85 34 __ STA P7 
1f18 : a9 08 __ LDA #$08
1f1a : 85 33 __ STA P6 
1f1c : a9 00 __ LDA #$00
1f1e : 8d fa 9e STA $9efa ; (sstack + 0)
1f21 : a9 20 __ LDA #$20
1f23 : 8d fb 9e STA $9efb ; (sstack + 1)
1f26 : a9 9b __ LDA #$9b
1f28 : 85 30 __ STA P3 
1f2a : a9 21 __ LDA #$21
1f2c : 85 31 __ STA P4 
1f2e : ad 79 26 LDA $2679 ; (VolAddr + 0)
1f31 : 85 35 __ STA P8 
1f33 : ad 7a 26 LDA $267a ; (VolAddr + 1)
1f36 : 85 36 __ STA P9 
1f38 : ad 7b 26 LDA $267b ; (VolAddr + 2)
1f3b : 85 37 __ STA P10 
1f3d : ad 7c 26 LDA $267c ; (VolAddr + 3)
1f40 : 85 38 __ STA P11 
1f42 : 20 d2 19 JSR $19d2 ; (LoadSprite.s0 + 0)
1f45 : a9 20 __ LDA #$20
1f47 : 85 30 __ STA P3 
1f49 : a9 00 __ LDA #$00
1f4b : 85 31 __ STA P4 
1f4d : a9 47 __ LDA #$47
1f4f : a0 41 __ LDY #$41
1f51 : 4c e9 1e JMP $1ee9 ; (PlayZSM.s32 + 0)
.s1005:
1f54 : c9 02 __ CMP #$02
1f56 : f0 5a __ BEQ $1fb2 ; (PlayZSM.s10 + 0)
.s1004:
1f58 : c9 03 __ CMP #$03
1f5a : f0 01 __ BEQ $1f5d ; (PlayZSM.s12 + 0)
1f5c : 60 __ __ RTS
.s12:
1f5d : a9 2a __ LDA #$2a
1f5f : 85 30 __ STA P3 
1f61 : a9 22 __ LDA #$22
1f63 : 85 31 __ STA P4 
1f65 : a9 51 __ LDA #$51
1f67 : 85 4b __ STA T0 + 0 
1f69 : a9 22 __ LDA #$22
.s33:
1f6b : 85 4c __ STA T0 + 1 
1f6d : 20 28 20 JSR $2028 ; (zsm_init.s0 + 0)
1f70 : a5 4b __ LDA T0 + 0 
1f72 : 85 30 __ STA P3 
1f74 : a5 4c __ LDA T0 + 1 
1f76 : 85 31 __ STA P4 
1f78 : a9 03 __ LDA #$03
1f7a : 85 32 __ STA P5 
1f7c : 85 34 __ STA P7 
1f7e : a9 08 __ LDA #$08
1f80 : 85 33 __ STA P6 
1f82 : a9 00 __ LDA #$00
1f84 : 8d fa 9e STA $9efa ; (sstack + 0)
1f87 : a9 20 __ LDA #$20
1f89 : 8d fb 9e STA $9efb ; (sstack + 1)
1f8c : ad 79 26 LDA $2679 ; (VolAddr + 0)
1f8f : 85 35 __ STA P8 
1f91 : ad 7a 26 LDA $267a ; (VolAddr + 1)
1f94 : 85 36 __ STA P9 
1f96 : ad 7b 26 LDA $267b ; (VolAddr + 2)
1f99 : 85 37 __ STA P10 
1f9b : ad 7c 26 LDA $267c ; (VolAddr + 3)
1f9e : 85 38 __ STA P11 
1fa0 : 20 d2 19 JSR $19d2 ; (LoadSprite.s0 + 0)
1fa3 : a9 20 __ LDA #$20
1fa5 : 85 30 __ STA P3 
1fa7 : a9 00 __ LDA #$00
1fa9 : 85 31 __ STA P4 
1fab : a9 47 __ LDA #$47
1fad : a0 61 __ LDY #$61
1faf : 4c e9 1e JMP $1ee9 ; (PlayZSM.s32 + 0)
.s10:
1fb2 : a9 b8 __ LDA #$b8
1fb4 : 85 30 __ STA P3 
1fb6 : a9 21 __ LDA #$21
1fb8 : 85 31 __ STA P4 
1fba : a9 00 __ LDA #$00
1fbc : 85 4b __ STA T0 + 0 
1fbe : a9 22 __ LDA #$22
1fc0 : 4c 6b 1f JMP $1f6b ; (PlayZSM.s33 + 0)
.s6:
1fc3 : a9 03 __ LDA #$03
1fc5 : 85 32 __ STA P5 
1fc7 : 85 34 __ STA P7 
1fc9 : a9 08 __ LDA #$08
1fcb : 85 33 __ STA P6 
1fcd : a9 00 __ LDA #$00
1fcf : 8d fa 9e STA $9efa ; (sstack + 0)
1fd2 : a9 20 __ LDA #$20
1fd4 : 8d fb 9e STA $9efb ; (sstack + 1)
1fd7 : a9 09 __ LDA #$09
1fd9 : 85 30 __ STA P3 
1fdb : a9 20 __ LDA #$20
1fdd : 85 31 __ STA P4 
1fdf : ad 79 26 LDA $2679 ; (VolAddr + 0)
1fe2 : 85 35 __ STA P8 
1fe4 : ad 7a 26 LDA $267a ; (VolAddr + 1)
1fe7 : 85 36 __ STA P9 
1fe9 : ad 7b 26 LDA $267b ; (VolAddr + 2)
1fec : 85 37 __ STA P10 
1fee : ad 7c 26 LDA $267c ; (VolAddr + 3)
1ff1 : 85 38 __ STA P11 
1ff3 : 20 d2 19 JSR $19d2 ; (LoadSprite.s0 + 0)
1ff6 : a9 1c __ LDA #$1c
1ff8 : 85 30 __ STA P3 
1ffa : a9 00 __ LDA #$00
1ffc : 85 31 __ STA P4 
1ffe : a9 43 __ LDA #$43
2000 : a0 00 __ LDY #$00
2002 : 4c e9 1e JMP $1ee9 ; (PlayZSM.s32 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
2005 : ad ff 21 LDA $21ff ; (zsm_finished + 0)
.s1001:
2008 : 60 __ __ RTS
--------------------------------------------------------------------
2009 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2019 : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
zsm_init:
.s0:
2028 : a9 01 __ LDA #$01
202a : 8d ff 21 STA $21ff ; (zsm_finished + 0)
202d : ad 40 47 LDA $4740 ; (zsm_reading + 0)
2030 : f0 0a __ BEQ $203c ; (zsm_init.s3 + 0)
.s1:
2032 : a9 02 __ LDA #$02
2034 : 20 ad 1a JSR $1aad ; (krnio_close.s1000 + 0)
2037 : a9 00 __ LDA #$00
2039 : 8d 40 47 STA $4740 ; (zsm_reading + 0)
.s3:
203c : 20 89 20 JSR $2089 ; (zsm_silence.s0 + 0)
203f : 20 a1 20 JSR $20a1 ; (zsm_save_volume.s0 + 0)
2042 : a9 00 __ LDA #$00
2044 : 8d ed 47 STA $47ed ; (zsm_pos + 0)
2047 : 8d ee 47 STA $47ee ; (zsm_pos + 1)
204a : 8d f7 47 STA $47f7 ; (zsm_wpos + 0)
204d : 8d f8 47 STA $47f8 ; (zsm_wpos + 1)
2050 : 8d ec 47 STA $47ec ; (zsm_delay + 0)
2053 : a5 30 __ LDA P3 ; (fname + 0)
2055 : 85 2d __ STA P0 
2057 : a5 31 __ LDA P4 ; (fname + 1)
2059 : 85 2e __ STA P1 
205b : 20 4f 1a JSR $1a4f ; (krnio_setnam.s0 + 0)
205e : a9 02 __ LDA #$02
2060 : 85 2d __ STA P0 
2062 : 85 2f __ STA P2 
2064 : a9 08 __ LDA #$08
2066 : 85 2e __ STA P1 
2068 : 20 65 1a JSR $1a65 ; (krnio_open.s0 + 0)
206b : a5 3b __ LDA ACCU + 0 
206d : f0 19 __ BEQ $2088 ; (zsm_init.s1001 + 0)
.s4:
206f : a9 01 __ LDA #$01
2071 : 8d 40 47 STA $4740 ; (zsm_reading + 0)
2074 : 20 d3 20 JSR $20d3 ; (zsm_fill.s0 + 0)
2077 : a9 10 __ LDA #$10
2079 : 8d ed 47 STA $47ed ; (zsm_pos + 0)
207c : a9 00 __ LDA #$00
207e : 8d ee 47 STA $47ee ; (zsm_pos + 1)
2081 : 8d ff 21 STA $21ff ; (zsm_finished + 0)
2084 : a9 01 __ LDA #$01
2086 : 85 3b __ STA ACCU + 0 
.s1001:
2088 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
4740 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
2089 : a9 00 __ LDA #$00
208b : 85 47 __ STA T0 + 0 
208d : a9 08 __ LDA #$08
208f : 85 2d __ STA P0 
2091 : a9 00 __ LDA #$00
.l1006:
2093 : 85 2e __ STA P1 
2095 : 20 de 0d JSR $0dde ; (sfx_put.s1 + 0)
2098 : e6 47 __ INC T0 + 0 
209a : a5 47 __ LDA T0 + 0 
209c : c9 08 __ CMP #$08
209e : 90 f3 __ BCC $2093 ; (zsm_silence.l1006 + 0)
.s1001:
20a0 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
20a1 : a0 00 __ LDY #$00
20a3 : 84 3c __ STY ACCU + 1 
20a5 : a2 02 __ LDX #$02
20a7 : 18 __ __ CLC
.l1006:
20a8 : 8a __ __ TXA
20a9 : 09 c0 __ ORA #$c0
20ab : 8d 20 9f STA $9f20 
20ae : a5 3c __ LDA ACCU + 1 
20b0 : 09 f9 __ ORA #$f9
20b2 : 8d 21 9f STA $9f21 
20b5 : a9 01 __ LDA #$01
20b7 : 8d 22 9f STA $9f22 
20ba : ad 23 9f LDA $9f23 
20bd : 99 8b 56 STA $568b,y ; (vera_volumes + 0)
20c0 : a9 00 __ LDA #$00
20c2 : 8d 23 9f STA $9f23 
20c5 : 8a __ __ TXA
20c6 : 69 04 __ ADC #$04
20c8 : aa __ __ TAX
20c9 : 90 02 __ BCC $20cd ; (zsm_save_volume.s1009 + 0)
.s1008:
20cb : e6 3c __ INC ACCU + 1 
.s1009:
20cd : c8 __ __ INY
20ce : c0 10 __ CPY #$10
20d0 : 90 d6 __ BCC $20a8 ; (zsm_save_volume.l1006 + 0)
.s1001:
20d2 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
568b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
47f7 : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
20d3 : ad 40 47 LDA $4740 ; (zsm_reading + 0)
20d6 : f0 20 __ BEQ $20f8 ; (zsm_fill.s1 + 0)
.s2:
20d8 : ad ee 47 LDA $47ee ; (zsm_pos + 1)
20db : 18 __ __ CLC
20dc : 69 04 __ ADC #$04
20de : cd f8 47 CMP $47f8 ; (zsm_wpos + 1)
20e1 : d0 0c __ BNE $20ef ; (zsm_fill.s6 + 0)
.s1006:
20e3 : ad f7 47 LDA $47f7 ; (zsm_wpos + 0)
20e6 : cd ed 47 CMP $47ed ; (zsm_pos + 0)
20e9 : d0 04 __ BNE $20ef ; (zsm_fill.s6 + 0)
.s5:
20eb : a9 00 __ LDA #$00
20ed : f0 0b __ BEQ $20fa ; (zsm_fill.s1008 + 0)
.s6:
20ef : a9 02 __ LDA #$02
20f1 : 20 8d 1a JSR $1a8d ; (krnio_chkin.s1000 + 0)
20f4 : a5 3b __ LDA ACCU + 0 
20f6 : d0 07 __ BNE $20ff ; (zsm_fill.s9 + 0)
.s1:
20f8 : a9 ff __ LDA #$ff
.s1008:
20fa : 85 3b __ STA ACCU + 0 
.s1001:
20fc : 85 3c __ STA ACCU + 1 
20fe : 60 __ __ RTS
.s9:
20ff : a9 00 __ LDA #$00
2101 : 85 47 __ STA T1 + 0 
2103 : 85 48 __ STA T1 + 1 
2105 : ad ee 47 LDA $47ee ; (zsm_pos + 1)
2108 : 18 __ __ CLC
2109 : 69 04 __ ADC #$04
210b : cd f8 47 CMP $47f8 ; (zsm_wpos + 1)
210e : d0 08 __ BNE $2118 ; (zsm_fill.l13 + 0)
.s1002:
2110 : ad f7 47 LDA $47f7 ; (zsm_wpos + 0)
2113 : cd ed 47 CMP $47ed ; (zsm_pos + 0)
2116 : f0 45 __ BEQ $215d ; (zsm_fill.s38 + 0)
.l13:
2118 : 20 9f 1a JSR $1a9f ; (krnio_chrin.s0 + 0)
211b : ad f7 47 LDA $47f7 ; (zsm_wpos + 0)
211e : 85 49 __ STA T3 + 0 
2120 : 18 __ __ CLC
2121 : 69 01 __ ADC #$01
2123 : 8d f7 47 STA $47f7 ; (zsm_wpos + 0)
2126 : ad f8 47 LDA $47f8 ; (zsm_wpos + 1)
2129 : aa __ __ TAX
212a : 69 00 __ ADC #$00
212c : 8d f8 47 STA $47f8 ; (zsm_wpos + 1)
212f : 8a __ __ TXA
2130 : 29 03 __ AND #$03
2132 : 18 __ __ CLC
2133 : 69 5c __ ADC #$5c
2135 : 85 4a __ STA T3 + 1 
2137 : a5 3b __ LDA ACCU + 0 
2139 : a0 00 __ LDY #$00
213b : 91 49 __ STA (T3 + 0),y 
213d : e6 47 __ INC T1 + 0 
213f : d0 02 __ BNE $2143 ; (zsm_fill.s1010 + 0)
.s1009:
2141 : e6 48 __ INC T1 + 1 
.s1010:
2143 : 20 73 21 JSR $2173 ; (krnio_status.s0 + 0)
2146 : a5 3b __ LDA ACCU + 0 
2148 : d0 0e __ BNE $2158 ; (zsm_fill.s15 + 0)
.s12:
214a : ad ee 47 LDA $47ee ; (zsm_pos + 1)
214d : 18 __ __ CLC
214e : 69 04 __ ADC #$04
2150 : cd f8 47 CMP $47f8 ; (zsm_wpos + 1)
2153 : d0 c3 __ BNE $2118 ; (zsm_fill.l13 + 0)
2155 : 4c 10 21 JMP $2110 ; (zsm_fill.s1002 + 0)
.s15:
2158 : a9 00 __ LDA #$00
215a : 8d 40 47 STA $4740 ; (zsm_reading + 0)
.s38:
215d : 20 a9 1a JSR $1aa9 ; (krnio_clrchn.s0 + 0)
2160 : ad 40 47 LDA $4740 ; (zsm_reading + 0)
2163 : d0 05 __ BNE $216a ; (zsm_fill.s21 + 0)
.s19:
2165 : a9 02 __ LDA #$02
2167 : 20 ad 1a JSR $1aad ; (krnio_close.s1000 + 0)
.s21:
216a : a5 47 __ LDA T1 + 0 
216c : 85 3b __ STA ACCU + 0 
216e : a5 48 __ LDA T1 + 1 
2170 : 4c fc 20 JMP $20fc ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_status:
.s0:
2173 : 20 b7 ff JSR $ffb7 
2176 : 85 3b __ STA ACCU + 0 
2178 : a9 00 __ LDA #$00
217a : 85 3c __ STA ACCU + 1 
.s1001:
217c : 60 __ __ RTS
--------------------------------------------------------------------
217d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
218d : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
219b : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
21ab : __ __ __ BYT 4b 4f 4c 45 2e 42 49 4e 2c 50 2c 52 00          : KOLE.BIN,P,R.
--------------------------------------------------------------------
KolePal:
4741 : __ __ __ BYT 00 00 79 02 00 00 40 0a 30 07 ff 0f 00 0f 6c 00 : ..y...@.0.....l.
4751 : __ __ __ BYT bf 00 99 09 cc 0c 0f 06 be 07 08 02 33 03 00 00 : ............3...
--------------------------------------------------------------------
21b8 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
21c8 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
21d8 : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
2200 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2210 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
2220 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
RealPal:
4761 : __ __ __ BYT 00 00 00 00 20 04 46 04 69 06 40 09 ff 00 44 04 : .... .F.i.@...D.
4771 : __ __ __ BYT bb 0b dd 0d 75 0c a7 0e ff 0f df 0d 33 03 99 09 : ....u.......3...
--------------------------------------------------------------------
222a : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
223a : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
224a : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
2251 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2261 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
2271 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
21dd : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
21ed : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
227b : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
228b : __ __ __ BYT 46 4c 44 45 2e 42 49 4e 2c 50 2c 52 00          : FLDE.BIN,P,R.
--------------------------------------------------------------------
FldePal:
4781 : __ __ __ BYT 00 00 00 00 dd 0d ff 0f 3e 02 cf 00 ad 00 5f 04 : ........>....._.
4791 : __ __ __ BYT 27 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : '...............
--------------------------------------------------------------------
2298 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 46 45 4d 55 : @0:zsmfiles/FEMU
22a8 : __ __ __ BYT 52 46 52 45 45 5a 45 52 2e 7a 73 6d 2c 50 2c 52 : RFREEZER.zsm,P,R
22b8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
22b9 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
22c9 : __ __ __ BYT 41 4c 45 4b 53 49 2e 42 49 4e 2c 50 2c 52 00    : ALEKSI.BIN,P,R.
--------------------------------------------------------------------
Aleksipal:
47a1 : __ __ __ BYT 00 00 00 00 3b 00 6f 00 22 02 cc 00 ff 00 9f 02 : ....;.o.".......
47b1 : __ __ __ BYT 11 01 cb 0c ff 0f 99 09 d0 0d 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
22d8 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 48 6f 75 73 : @0:zsmfiles/Hous
22e8 : __ __ __ BYT 65 34 2e 7a 73 6d 2c 50 2c 52 00                : e4.zsm,P,R.
--------------------------------------------------------------------
2300 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2310 : __ __ __ BYT 43 52 49 53 50 59 2e 42 49 4e 2c 50 2c 52 00    : CRISPY.BIN,P,R.
--------------------------------------------------------------------
CrispyPal:
47c1 : __ __ __ BYT 00 00 00 00 12 01 22 02 ff 0f 0f 09 24 02 10 06 : ......".....$...
47d1 : __ __ __ BYT 39 03 00 04 d9 0d dd 0d 8c 00 af 00 cc 0c aa 0a : 9...............
--------------------------------------------------------------------
LastSelectedSong:
47e1 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
47e2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalIndex:
47e4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
MaxSong:
47e6 : __ __ __ BYT 06                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
231f : ad 25 9f LDA $9f25 
2322 : 29 fe __ AND #$fe
2324 : 8d 25 9f STA $9f25 
2327 : a9 00 __ LDA #$00
2329 : 8d 20 9f STA $9f20 
232c : a9 b0 __ LDA #$b0
232e : 8d 21 9f STA $9f21 
2331 : a9 11 __ LDA #$11
2333 : 8d 22 9f STA $9f22 
2336 : a2 80 __ LDX #$80
2338 : a9 00 __ LDA #$00
.l1002:
233a : 8d 23 9f STA $9f23 
233d : 8d 23 9f STA $9f23 
2340 : ca __ __ DEX
2341 : d0 f7 __ BNE $233a ; (ResetChars.l1002 + 0)
.s1001:
2343 : 60 __ __ RTS
--------------------------------------------------------------------
off1:
47e7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
2344 : a5 31 __ LDA P4 ; (Input + 0)
2346 : c9 20 __ CMP #$20
2348 : d0 1c __ BNE $2366 ; (Control.s1007 + 0)
.s1:
234a : a5 30 __ LDA P3 ; (playing + 0)
234c : d0 0a __ BNE $2358 ; (Control.s4 + 0)
.s5:
234e : a9 01 __ LDA #$01
2350 : 20 f9 21 JSR $21f9 ; (zsm_irq_play.s0 + 0)
2353 : a9 01 __ LDA #$01
.s1001:
2355 : 85 3b __ STA ACCU + 0 
2357 : 60 __ __ RTS
.s4:
2358 : a9 00 __ LDA #$00
235a : cd e9 47 CMP $47e9 ; (paused + 0)
235d : 2a __ __ ROL
235e : 8d e9 47 STA $47e9 ; (paused + 0)
2361 : 85 2f __ STA P2 
2363 : 20 6b 23 JSR $236b ; (zsm_pause.s0 + 0)
.s1007:
2366 : a5 30 __ LDA P3 ; (playing + 0)
2368 : 4c 55 23 JMP $2355 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
47e9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
236b : a5 2f __ LDA P2 ; (pause + 0)
236d : d0 0e __ BNE $237d ; (zsm_pause.s4 + 0)
.s8:
236f : ad 78 26 LDA $2678 ; (zsm_paused + 0)
2372 : f0 08 __ BEQ $237c ; (zsm_pause.s1001 + 0)
.s5:
2374 : 20 8d 23 JSR $238d ; (zsm_restore_volume.s0 + 0)
2377 : a9 00 __ LDA #$00
2379 : 8d 78 26 STA $2678 ; (zsm_paused + 0)
.s1001:
237c : 60 __ __ RTS
.s4:
237d : ad 78 26 LDA $2678 ; (zsm_paused + 0)
2380 : d0 fa __ BNE $237c ; (zsm_pause.s1001 + 0)
.s1:
2382 : a9 01 __ LDA #$01
2384 : 8d 78 26 STA $2678 ; (zsm_paused + 0)
2387 : 20 89 20 JSR $2089 ; (zsm_silence.s0 + 0)
238a : 4c a1 20 JMP $20a1 ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
238d : a0 00 __ LDY #$00
238f : 84 3c __ STY ACCU + 1 
2391 : a2 02 __ LDX #$02
2393 : 18 __ __ CLC
.l1006:
2394 : 8a __ __ TXA
2395 : 09 c0 __ ORA #$c0
2397 : 8d 20 9f STA $9f20 
239a : a5 3c __ LDA ACCU + 1 
239c : 09 f9 __ ORA #$f9
239e : 8d 21 9f STA $9f21 
23a1 : a9 01 __ LDA #$01
23a3 : 8d 22 9f STA $9f22 
23a6 : b9 8b 56 LDA $568b,y ; (vera_volumes + 0)
23a9 : 8d 23 9f STA $9f23 
23ac : 8a __ __ TXA
23ad : 69 04 __ ADC #$04
23af : aa __ __ TAX
23b0 : 90 02 __ BCC $23b4 ; (zsm_restore_volume.s1009 + 0)
.s1008:
23b2 : e6 3c __ INC ACCU + 1 
.s1009:
23b4 : c8 __ __ INY
23b5 : c0 10 __ CPY #$10
23b7 : 90 db __ BCC $2394 ; (zsm_restore_volume.l1006 + 0)
.s1001:
23b9 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
21f9 : 8d fe 21 STA $21fe ; (zsm_playing + 0)
.s1001:
21fc : 60 __ __ RTS
--------------------------------------------------------------------
UpdateVolume:
.s0:
23ba : a9 21 __ LDA #$21
23bc : 8d 2c 9f STA $9f2c 
23bf : a9 00 __ LDA #$00
23c1 : 8d f8 9e STA $9ef8 ; (FMVolume + 0)
23c4 : 8d f9 9e STA $9ef9 ; (VeraVolume + 0)
23c7 : 85 47 __ STA T0 + 0 
23c9 : 85 32 __ STA P5 
.l2:
23cb : a9 f9 __ LDA #$f9
23cd : 85 2d __ STA P0 
23cf : a9 9e __ LDA #$9e
23d1 : 85 2e __ STA P1 
23d3 : a9 f8 __ LDA #$f8
23d5 : 85 2f __ STA P2 
23d7 : a9 9e __ LDA #$9e
23d9 : 85 30 __ STA P3 
23db : a5 47 __ LDA T0 + 0 
23dd : 85 31 __ STA P4 
23df : 20 8e 24 JSR $248e ; (zsm_get_volumes.s0 + 0)
23e2 : 18 __ __ CLC
23e3 : a5 31 __ LDA P4 
23e5 : 69 19 __ ADC #$19
23e7 : 85 2d __ STA P0 
23e9 : ad f9 9e LDA $9ef9 ; (VeraVolume + 0)
23ec : 4a __ __ LSR
23ed : 4a __ __ LSR
23ee : 4a __ __ LSR
23ef : 4a __ __ LSR
23f0 : aa __ __ TAX
23f1 : ad 7d 26 LDA $267d ; (IndAddr + 0)
23f4 : 18 __ __ CLC
23f5 : 7d 58 26 ADC $2658,x ; (__multab32L + 0)
23f8 : 85 48 __ STA T5 + 0 
23fa : ad 7e 26 LDA $267e ; (IndAddr + 1)
23fd : 7d 68 26 ADC $2668,x ; (__multab32H + 0)
2400 : 85 49 __ STA T5 + 1 
2402 : ad 7f 26 LDA $267f ; (IndAddr + 2)
2405 : 69 00 __ ADC #$00
2407 : 85 4a __ STA T5 + 2 
2409 : ad 80 26 LDA $2680 ; (IndAddr + 3)
240c : 69 00 __ ADC #$00
240e : a2 05 __ LDX #$05
.l1002:
2410 : 4a __ __ LSR
2411 : 66 4a __ ROR T5 + 2 
2413 : 66 49 __ ROR T5 + 1 
2415 : 66 48 __ ROR T5 + 0 
2417 : ca __ __ DEX
2418 : d0 f6 __ BNE $2410 ; (UpdateVolume.l1002 + 0)
.s1003:
241a : a5 48 __ LDA T5 + 0 
241c : 85 2e __ STA P1 
241e : a5 49 __ LDA T5 + 1 
2420 : 85 2f __ STA P2 
2422 : 20 55 25 JSR $2555 ; (vera_spr_image.s0 + 0)
2425 : e6 47 __ INC T0 + 0 
2427 : a5 47 __ LDA T0 + 0 
2429 : c9 10 __ CMP #$10
242b : 90 9e __ BCC $23cb ; (UpdateVolume.l2 + 0)
.s4:
242d : a9 00 __ LDA #$00
242f : 85 47 __ STA T0 + 0 
.l6:
2431 : a9 f9 __ LDA #$f9
2433 : 85 2d __ STA P0 
2435 : a9 9e __ LDA #$9e
2437 : 85 2e __ STA P1 
2439 : a9 f8 __ LDA #$f8
243b : 85 2f __ STA P2 
243d : a5 47 __ LDA T0 + 0 
243f : 85 31 __ STA P4 
2441 : 20 8e 24 JSR $248e ; (zsm_get_volumes.s0 + 0)
2444 : 18 __ __ CLC
2445 : a5 31 __ LDA P4 
2447 : 69 29 __ ADC #$29
2449 : 85 2d __ STA P0 
244b : ad f8 9e LDA $9ef8 ; (FMVolume + 0)
244e : 4a __ __ LSR
244f : 6a __ __ ROR
2450 : 6a __ __ ROR
2451 : aa __ __ TAX
2452 : 29 c0 __ AND #$c0
2454 : 6a __ __ ROR
2455 : 6d 7d 26 ADC $267d ; (IndAddr + 0)
2458 : 85 48 __ STA T5 + 0 
245a : 8a __ __ TXA
245b : 29 1f __ AND #$1f
245d : 6d 7e 26 ADC $267e ; (IndAddr + 1)
2460 : 85 49 __ STA T5 + 1 
2462 : ad 7f 26 LDA $267f ; (IndAddr + 2)
2465 : 69 00 __ ADC #$00
2467 : 85 4a __ STA T5 + 2 
2469 : ad 80 26 LDA $2680 ; (IndAddr + 3)
246c : 69 00 __ ADC #$00
246e : a2 05 __ LDX #$05
.l1004:
2470 : 4a __ __ LSR
2471 : 66 4a __ ROR T5 + 2 
2473 : 66 49 __ ROR T5 + 1 
2475 : 66 48 __ ROR T5 + 0 
2477 : ca __ __ DEX
2478 : d0 f6 __ BNE $2470 ; (UpdateVolume.l1004 + 0)
.s1005:
247a : a5 48 __ LDA T5 + 0 
247c : 85 2e __ STA P1 
247e : a5 49 __ LDA T5 + 1 
2480 : 85 2f __ STA P2 
2482 : 20 55 25 JSR $2555 ; (vera_spr_image.s0 + 0)
2485 : e6 47 __ INC T0 + 0 
2487 : a5 47 __ LDA T0 + 0 
2489 : c9 08 __ CMP #$08
248b : 90 a4 __ BCC $2431 ; (UpdateVolume.l6 + 0)
.s1001:
248d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_get_volumes:
.s0:
248e : a5 31 __ LDA P4 ; (id + 0)
2490 : 0a __ __ ASL
2491 : 85 3d __ STA ACCU + 2 
2493 : a5 32 __ LDA P5 ; (id + 1)
2495 : 2a __ __ ROL
2496 : 06 3d __ ASL ACCU + 2 
2498 : 0a __ __ ASL
2499 : 09 f9 __ ORA #$f9
249b : 8d 21 9f STA $9f21 
249e : a5 3d __ LDA ACCU + 2 
24a0 : 09 c2 __ ORA #$c2
24a2 : 8d 20 9f STA $9f20 
24a5 : a9 01 __ LDA #$01
24a7 : 8d 22 9f STA $9f22 
24aa : ad 23 9f LDA $9f23 
24ad : a0 00 __ LDY #$00
24af : 91 2d __ STA (P0),y ; (vera_v + 0)
24b1 : a5 31 __ LDA P4 ; (id + 0)
24b3 : 29 07 __ AND #$07
24b5 : aa __ __ TAX
24b6 : bd ef 47 LDA $47ef,x ; (vera_fm_gate + 0)
24b9 : 29 78 __ AND #$78
24bb : d0 04 __ BNE $24c1 ; (zsm_get_volumes.s1 + 0)
.s2:
24bd : 98 __ __ TYA
.s1022:
24be : 91 2f __ STA (P2),y ; (fm_v + 0)
.s1001:
24c0 : 60 __ __ RTS
.s1:
24c1 : 85 3d __ STA ACCU + 2 
24c3 : 18 __ __ CLC
24c4 : a9 20 __ LDA #$20
24c6 : 65 31 __ ADC P4 ; (id + 0)
24c8 : 85 3b __ STA ACCU + 0 
24ca : a9 60 __ LDA #$60
24cc : 65 32 __ ADC P5 ; (id + 1)
24ce : 85 3c __ STA ACCU + 1 
24d0 : b1 3b __ LDA (ACCU + 0),y 
24d2 : aa __ __ TAX
24d3 : 25 3d __ AND ACCU + 2 
24d5 : f0 e9 __ BEQ $24c0 ; (zsm_get_volumes.s1001 + 0)
.s4:
24d7 : a0 58 __ LDY #$58
24d9 : b1 3b __ LDA (ACCU + 0),y 
24db : 29 7f __ AND #$7f
24dd : 85 3d __ STA ACCU + 2 
24df : 8a __ __ TXA
24e0 : 29 10 __ AND #$10
24e2 : d0 05 __ BNE $24e9 ; (zsm_get_volumes.s7 + 0)
.s9:
24e4 : a5 3d __ LDA ACCU + 2 
24e6 : 4c f1 24 JMP $24f1 ; (zsm_get_volumes.s46 + 0)
.s7:
24e9 : a0 50 __ LDY #$50
24eb : b1 3b __ LDA (ACCU + 0),y 
24ed : 29 7f __ AND #$7f
24ef : 25 3d __ AND ACCU + 2 
.s46:
24f1 : d0 04 __ BNE $24f7 ; (zsm_get_volumes.s11 + 0)
.s10:
24f3 : a9 02 __ LDA #$02
24f5 : d0 06 __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s11:
24f7 : c9 02 __ CMP #$02
24f9 : b0 06 __ BCS $2501 ; (zsm_get_volumes.s14 + 0)
.s13:
24fb : a9 03 __ LDA #$03
.s1023:
24fd : a0 00 __ LDY #$00
24ff : f0 bd __ BEQ $24be ; (zsm_get_volumes.s1022 + 0)
.s14:
2501 : c9 03 __ CMP #$03
2503 : b0 04 __ BCS $2509 ; (zsm_get_volumes.s17 + 0)
.s16:
2505 : a9 04 __ LDA #$04
2507 : d0 f4 __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s17:
2509 : c9 04 __ CMP #$04
250b : b0 04 __ BCS $2511 ; (zsm_get_volumes.s20 + 0)
.s19:
250d : a9 05 __ LDA #$05
250f : d0 ec __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s20:
2511 : c9 05 __ CMP #$05
2513 : b0 04 __ BCS $2519 ; (zsm_get_volumes.s23 + 0)
.s22:
2515 : a9 06 __ LDA #$06
2517 : d0 e4 __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s23:
2519 : c9 06 __ CMP #$06
251b : 90 34 __ BCC $2551 ; (zsm_get_volumes.s25 + 0)
.s26:
251d : 85 3b __ STA ACCU + 0 
251f : a9 08 __ LDA #$08
2521 : c5 3b __ CMP ACCU + 0 
2523 : b0 d8 __ BCS $24fd ; (zsm_get_volumes.s1023 + 0)
.s29:
2525 : a9 10 __ LDA #$10
2527 : c5 3b __ CMP ACCU + 0 
2529 : 90 04 __ BCC $252f ; (zsm_get_volumes.s32 + 0)
.s31:
252b : a9 09 __ LDA #$09
252d : d0 ce __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s32:
252f : a9 20 __ LDA #$20
2531 : c5 3b __ CMP ACCU + 0 
2533 : 90 04 __ BCC $2539 ; (zsm_get_volumes.s35 + 0)
.s34:
2535 : a9 0a __ LDA #$0a
2537 : d0 c4 __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s35:
2539 : a9 40 __ LDA #$40
253b : c5 3b __ CMP ACCU + 0 
253d : 90 04 __ BCC $2543 ; (zsm_get_volumes.s38 + 0)
.s37:
253f : a9 0b __ LDA #$0b
2541 : d0 ba __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s38:
2543 : a5 3b __ LDA ACCU + 0 
2545 : c9 7f __ CMP #$7f
2547 : b0 04 __ BCS $254d ; (zsm_get_volumes.s41 + 0)
.s40:
2549 : a9 0c __ LDA #$0c
254b : d0 b0 __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s41:
254d : a9 0d __ LDA #$0d
254f : d0 ac __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
.s25:
2551 : a9 07 __ LDA #$07
2553 : d0 a8 __ BNE $24fd ; (zsm_get_volumes.s1023 + 0)
--------------------------------------------------------------------
vera_spr_image:
.s0:
2555 : ad 25 9f LDA $9f25 
2558 : 29 fe __ AND #$fe
255a : 8d 25 9f STA $9f25 
255d : a5 2d __ LDA P0 ; (spr + 0)
255f : 0a __ __ ASL
2560 : 0a __ __ ASL
2561 : 85 3b __ STA ACCU + 0 
2563 : a9 3f __ LDA #$3f
2565 : 2a __ __ ROL
2566 : 06 3b __ ASL ACCU + 0 
2568 : 2a __ __ ROL
2569 : 8d 21 9f STA $9f21 
256c : a5 3b __ LDA ACCU + 0 
256e : 8d 20 9f STA $9f20 
2571 : a9 11 __ LDA #$11
2573 : 8d 22 9f STA $9f22 
2576 : a5 2e __ LDA P1 ; (addr32 + 0)
2578 : 8d 23 9f STA $9f23 
257b : ad 22 9f LDA $9f22 
257e : 29 0f __ AND #$0f
2580 : 8d 22 9f STA $9f22 
2583 : ad 23 9f LDA $9f23 
2586 : 29 80 __ AND #$80
2588 : 05 2f __ ORA P2 ; (addr32 + 1)
258a : 8d 23 9f STA $9f23 
.s1001:
258d : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4900 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4910 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4920 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4930 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
4940 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
4950 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
4960 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
4970 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
4980 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
4990 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
49a0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
49b0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
49c0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
49d0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
49e0 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
49f0 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4a00 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4a10 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4a20 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4a30 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
4a40 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
4a50 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
4a60 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
4a70 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
4a80 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
4a90 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
4aa0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
4ab0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4ac0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4ad0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4ae0 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4af0 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4b00 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4b10 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4b20 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4b30 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
4b40 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
4b50 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
4b60 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
4b70 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
4b80 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
4b90 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4ba0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4bb0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4bc0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4bd0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4be0 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4bf0 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4c00 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4c10 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4c20 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4c30 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
4c40 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
4c50 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
4c60 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
4c70 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
4c80 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
4c90 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4ca0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4cb0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4cc0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4cd0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4ce0 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4cf0 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4d00 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4d10 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4d20 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4d30 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4d40 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4d50 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4d60 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4d70 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4d80 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4d90 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4da0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4db0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4dc0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4dd0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4de0 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4df0 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4e00 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4e10 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4e20 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4e30 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4e40 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4e50 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4e60 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4e70 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4e80 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4e90 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ea0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4eb0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ec0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ed0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ee0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4ef0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f00 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4f10 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
4f1e : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4f2e : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4f3e : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4f4e : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4f5e : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4f6e : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4f7e : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4f8e : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
4f9e : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
4fae : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
4fbe : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
4fce : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
4fde : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
4fee : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
4ffe : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
500e : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
501e : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
502e : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
503e : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
504e : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
505e : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
506e : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
507e : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
508e : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
509e : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
50ae : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
50be : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
50ce : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
50de : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
50ee : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
50fe : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
510e : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
511e : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
512e : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
513e : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
514e : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
515e : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
516e : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
517e : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
518e : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
519e : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
51ae : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
51be : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
51ce : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
51de : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
51ee : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
51fe : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
520e : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
521e : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
522e : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
523e : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
524e : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
525e : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
526e : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
527e : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
528e : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
529e : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
52ae : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
52be : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
52ce : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
52de : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
52ee : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
52fe : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
530e : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
531e : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
532e : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
533e : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
534e : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
535e : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
536e : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
537e : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
538e : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
539e : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
53ae : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
53be : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
53ce : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
53de : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
53ee : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
53fe : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
540e : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
541e : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
542e : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
543e : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
544e : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
545e : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
546e : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
547e : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
548e : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
549e : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
54ae : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
54be : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
54ce : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
54de : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
54ee : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
54fe : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
550e : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
551e : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
552e : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
553e : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
554e : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
555e : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
556e : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
557e : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
558e : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
559e : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
55ae : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
55be : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
55ce : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
55de : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
55ee : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
55fe : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
560e : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
561e : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
562e : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
563e : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
564e : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
565e : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
566e : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
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
5a00 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5a10 : __ __ __ BYT 0d 05 3a 20 2d 20 22 06 05 0d 15 12 20 06 12 05 : ..: - "..... ...
5a20 : __ __ __ BYT 05 1a 05 12 22 20 2d 20 01 12 14 09 13 14 3a 20 : ...." - ......: 
5a30 : __ __ __ BYT 22 01 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 22 : "...... ......."
5a40 : __ __ __ BYT 20 2d 20 0c 05 0e 07 14 08 3a 20 31 3a 35 35 20 :  - ......: 1:55 
5a50 : __ __ __ BYT 2d 20 03 0f 0d 0d 05 0e 14 3a 20 13 0f 0e 07 20 : - .......: .... 
5a60 : __ __ __ BYT 02 12 0f 15 07 08 14 20 14 0f 20 19 0f 15 20 02 : ....... .. ... .
5a70 : __ __ __ BYT 19 20 04 05 05 1a 20 0e 15 14 20 03 0f 2e 20 13 : . .... ... ... .
5a80 : __ __ __ BYT 09 0e 03 05 20 31 38 38 39 20 3d 20 3d 20 2d 20 : .... 1889 = = - 
5a90 : __ __ __ BYT 2d 20 00                                        : - .
--------------------------------------------------------------------
Song6:
5a93 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5aa3 : __ __ __ BYT 0d 05 3a 20 2d 20 22 20 22 20 2d 20 01 12 14 09 : ..: - " " - ....
5ab3 : __ __ __ BYT 13 14 3a 20 22 03 12 09 13 10 13 22 20 2d 20 0c : ..: "......" - .
5ac3 : __ __ __ BYT 05 0e 07 14 08 3a 20 33 3a 32 34 20 2d 20 03 0f : .....: 3:24 - ..
5ad3 : __ __ __ BYT 0d 0d 05 0e 14 3a 20 19 15 1a 0f 20 0b 15 13 08 : .....: .... ....
5ae3 : __ __ __ BYT 09 12 0f 20 02 05 14 14 05 12 20 0e 0f 14 20 13 : ... ...... ... .
5af3 : __ __ __ BYT 15 05 20 0d 05 20 06 0f 12 20 14 08 09 13 20 0d : .. .. ... .... .
5b03 : __ __ __ BYT 15 13 09 03 20 3a 1b 20 01 14 20 0c 05 01 13 14 : .... :. .. .....
5b13 : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 06 0f 12 20 01 20 :  .... ... ... . 
5b23 : __ __ __ BYT 06 15 0e 20 0d 15 13 09 03 20 04 09 13 03 2c 20 : ... ..... ...., 
5b33 : __ __ __ BYT 0e 0f 17 20 14 08 01 14 20 14 08 05 20 03 0f 04 : ... .... ... ...
5b43 : __ __ __ BYT 09 0e 07 20 09 13 20 04 0f 0e 05 20 3a 04 2e 20 : ... .. .... :.. 
5b53 : __ __ __ BYT 02 15 14 20 08 05 19 2c 20 09 20 17 01 0e 0e 01 : ... ..., . .....
5b63 : __ __ __ BYT 20 13 05 05 20 17 08 01 14 20 19 0f 15 20 07 15 :  ... .... ... ..
5b73 : __ __ __ BYT 19 13 20 0c 0f 0f 0b 09 0e 07 20 01 14 20 14 08 : .. ....... .. ..
5b83 : __ __ __ BYT 09 13 20 17 08 01 14 20 19 0f 15 20 14 08 09 0e : .. .... ... ....
5b93 : __ __ __ BYT 0b 20 0f 06 20 09 14 3f 20 49 20 12 05 01 0c 0c : . .. ..? I .....
5ba3 : __ __ __ BYT 19 20 04 0f 20 17 01 0e 0e 01 20 13 05 05 20 06 : . .. ..... ... .
5bb3 : __ __ __ BYT 05 05 04 02 01 03 0b 20 0f 0e 20 14 08 09 13 2c : ....... .. ....,
5bc3 : __ __ __ BYT 20 05 16 05 0e 20 09 06 20 19 0f 15 20 14 08 09 :  .... .. ... ...
5bd3 : __ __ __ BYT 0e 0b 20 09 14 27 13 20 13 08 09 14 05 21 20 3d : .. ..'. .....! =
5be3 : __ __ __ BYT 20 3d 20 2d 20 2d 20 00                         :  = - - .
--------------------------------------------------------------------
frame_wait:
.l1:
22f3 : ad 26 9f LDA $9f26 
22f6 : 0a __ __ ASL
22f7 : 30 fa __ BMI $22f3 ; (frame_wait.l1 + 0)
.l4:
22f9 : ad 26 9f LDA $9f26 
22fc : 0a __ __ ASL
22fd : 10 fa __ BPL $22f9 ; (frame_wait.l4 + 0)
.s1001:
22ff : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
258e : 38 __ __ SEC
258f : a9 00 __ LDA #$00
2591 : e5 3b __ SBC ACCU + 0 
2593 : 85 3b __ STA ACCU + 0 
2595 : a9 00 __ LDA #$00
2597 : e5 3c __ SBC ACCU + 1 
2599 : 85 3c __ STA ACCU + 1 
259b : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
259c : 38 __ __ SEC
259d : a9 00 __ LDA #$00
259f : e5 23 __ SBC WORK + 0 
25a1 : 85 23 __ STA WORK + 0 
25a3 : a9 00 __ LDA #$00
25a5 : e5 24 __ SBC WORK + 1 
25a7 : 85 24 __ STA WORK + 1 
25a9 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
25aa : a5 3c __ LDA ACCU + 1 
25ac : d0 31 __ BNE $25df ; (divmod + 53)
25ae : a5 24 __ LDA WORK + 1 
25b0 : d0 1e __ BNE $25d0 ; (divmod + 38)
25b2 : 85 26 __ STA WORK + 3 
25b4 : a2 04 __ LDX #$04
25b6 : 06 3b __ ASL ACCU + 0 
25b8 : 2a __ __ ROL
25b9 : c5 23 __ CMP WORK + 0 
25bb : 90 02 __ BCC $25bf ; (divmod + 21)
25bd : e5 23 __ SBC WORK + 0 
25bf : 26 3b __ ROL ACCU + 0 
25c1 : 2a __ __ ROL
25c2 : c5 23 __ CMP WORK + 0 
25c4 : 90 02 __ BCC $25c8 ; (divmod + 30)
25c6 : e5 23 __ SBC WORK + 0 
25c8 : 26 3b __ ROL ACCU + 0 
25ca : ca __ __ DEX
25cb : d0 eb __ BNE $25b8 ; (divmod + 14)
25cd : 85 25 __ STA WORK + 2 
25cf : 60 __ __ RTS
25d0 : a5 3b __ LDA ACCU + 0 
25d2 : 85 25 __ STA WORK + 2 
25d4 : a5 3c __ LDA ACCU + 1 
25d6 : 85 26 __ STA WORK + 3 
25d8 : a9 00 __ LDA #$00
25da : 85 3b __ STA ACCU + 0 
25dc : 85 3c __ STA ACCU + 1 
25de : 60 __ __ RTS
25df : a5 24 __ LDA WORK + 1 
25e1 : d0 1f __ BNE $2602 ; (divmod + 88)
25e3 : a5 23 __ LDA WORK + 0 
25e5 : 30 1b __ BMI $2602 ; (divmod + 88)
25e7 : a9 00 __ LDA #$00
25e9 : 85 26 __ STA WORK + 3 
25eb : a2 10 __ LDX #$10
25ed : 06 3b __ ASL ACCU + 0 
25ef : 26 3c __ ROL ACCU + 1 
25f1 : 2a __ __ ROL
25f2 : c5 23 __ CMP WORK + 0 
25f4 : 90 02 __ BCC $25f8 ; (divmod + 78)
25f6 : e5 23 __ SBC WORK + 0 
25f8 : 26 3b __ ROL ACCU + 0 
25fa : 26 3c __ ROL ACCU + 1 
25fc : ca __ __ DEX
25fd : d0 f2 __ BNE $25f1 ; (divmod + 71)
25ff : 85 25 __ STA WORK + 2 
2601 : 60 __ __ RTS
2602 : a9 00 __ LDA #$00
2604 : 85 25 __ STA WORK + 2 
2606 : 85 26 __ STA WORK + 3 
2608 : 84 22 __ STY $22 
260a : a0 10 __ LDY #$10
260c : 18 __ __ CLC
260d : 26 3b __ ROL ACCU + 0 
260f : 26 3c __ ROL ACCU + 1 
2611 : 26 25 __ ROL WORK + 2 
2613 : 26 26 __ ROL WORK + 3 
2615 : 38 __ __ SEC
2616 : a5 25 __ LDA WORK + 2 
2618 : e5 23 __ SBC WORK + 0 
261a : aa __ __ TAX
261b : a5 26 __ LDA WORK + 3 
261d : e5 24 __ SBC WORK + 1 
261f : 90 04 __ BCC $2625 ; (divmod + 123)
2621 : 86 25 __ STX WORK + 2 
2623 : 85 26 __ STA WORK + 3 
2625 : 88 __ __ DEY
2626 : d0 e5 __ BNE $260d ; (divmod + 99)
2628 : 26 3b __ ROL ACCU + 0 
262a : 26 3c __ ROL ACCU + 1 
262c : a4 22 __ LDY $22 
262e : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
262f : 24 3c __ BIT ACCU + 1 
2631 : 10 0d __ BPL $2640 ; (mods16 + 17)
2633 : 20 8e 25 JSR $258e ; (negaccu + 0)
2636 : 24 24 __ BIT WORK + 1 
2638 : 10 0d __ BPL $2647 ; (mods16 + 24)
263a : 20 9c 25 JSR $259c ; (negtmp + 0)
263d : 4c aa 25 JMP $25aa ; (divmod + 0)
2640 : 24 24 __ BIT WORK + 1 
2642 : 10 f9 __ BPL $263d ; (mods16 + 14)
2644 : 20 9c 25 JSR $259c ; (negtmp + 0)
2647 : 20 aa 25 JSR $25aa ; (divmod + 0)
264a : 38 __ __ SEC
264b : a9 00 __ LDA #$00
264d : e5 25 __ SBC WORK + 2 
264f : 85 25 __ STA WORK + 2 
2651 : a9 00 __ LDA #$00
2653 : e5 26 __ SBC WORK + 3 
2655 : 85 26 __ STA WORK + 3 
2657 : 60 __ __ RTS
--------------------------------------------------------------------
__multab32L:
2658 : __ __ __ BYT 00 20 40 60 80 a0 c0 e0 00 20 40 60 80 a0 c0 e0 : . @`..... @`....
--------------------------------------------------------------------
__multab32H:
2668 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 01 : ................
