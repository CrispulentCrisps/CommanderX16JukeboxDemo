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
080e : 8e fc 1f STX $1ffc ; (spentry + 0)
0811 : a9 fd __ LDA #$fd
0813 : 85 39 __ STA IP + 0 
0815 : a9 68 __ LDA #$68
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 6e __ LDA #$6e
081c : e9 68 __ SBC #$68
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
0832 : e9 fd __ SBC #$fd
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
1ffc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 50 0c JSR $0c50 ; (zsm_irq_init.s0 + 0)
0883 : 20 22 0e JSR $0e22 ; (ClearVERAScreen.s0 + 0)
0886 : 20 65 0e JSR $0e65 ; (SetUpSprites.s0 + 0)
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
08e8 : a9 32 __ LDA #$32
08ea : 85 32 __ STA P5 
08ec : a9 54 __ LDA #$54
08ee : 85 33 __ STA P6 
08f0 : 20 b9 1a JSR $1ab9 ; (SetPaletteIndex.s0 + 0)
08f3 : a9 00 __ LDA #$00
08f5 : 85 50 __ STA T1 + 0 
08f7 : 85 51 __ STA T1 + 1 
08f9 : 85 52 __ STA T2 + 0 
08fb : 85 53 __ STA T3 + 0 
08fd : 85 54 __ STA T4 + 0 
.l3:
08ff : 20 6c 1b JSR $1b6c ; (getchx.s0 + 0)
0902 : a5 3b __ LDA ACCU + 0 
0904 : 85 55 __ STA T5 + 0 
0906 : a9 30 __ LDA #$30
0908 : 8d 2c 9f STA $9f2c 
090b : ee f6 4f INC $4ff6 ; (p + 0)
090e : d0 03 __ BNE $0913 ; (main.s1025 + 0)
.s1024:
0910 : ee f7 4f INC $4ff7 ; (p + 1)
.s1025:
0913 : ad f8 4f LDA $4ff8 ; (Phase + 0)
0916 : 18 __ __ CLC
0917 : 69 01 __ ADC #$01
0919 : 85 32 __ STA P5 
091b : 8d f8 4f STA $4ff8 ; (Phase + 0)
091e : ad f9 4f LDA $4ff9 ; (Phase + 1)
0921 : 69 00 __ ADC #$00
0923 : 85 33 __ STA P6 
0925 : 8d f9 4f STA $4ff9 ; (Phase + 1)
0928 : ad fa 4f LDA $4ffa ; (Phase2 + 0)
092b : 18 __ __ CLC
092c : 69 01 __ ADC #$01
092e : 85 34 __ STA P7 
0930 : 8d fa 4f STA $4ffa ; (Phase2 + 0)
0933 : ad fb 4f LDA $4ffb ; (Phase2 + 1)
0936 : 69 00 __ ADC #$00
0938 : 85 35 __ STA P8 
093a : 8d fb 4f STA $4ffb ; (Phase2 + 1)
093d : ad fc 4f LDA $4ffc ; (Phase3 + 0)
0940 : 18 __ __ CLC
0941 : 69 01 __ ADC #$01
0943 : 85 36 __ STA P9 
0945 : 8d fc 4f STA $4ffc ; (Phase3 + 0)
0948 : ad fd 4f LDA $4ffd ; (Phase3 + 1)
094b : 69 00 __ ADC #$00
094d : 85 37 __ STA P10 
094f : 8d fd 4f STA $4ffd ; (Phase3 + 1)
0952 : 20 a7 1b JSR $1ba7 ; (MoveSprites.s0 + 0)
0955 : a5 53 __ LDA T3 + 0 
0957 : c9 01 __ CMP #$01
0959 : d0 03 __ BNE $095e ; (main.s6 + 0)
095b : 4c d3 0b JMP $0bd3 ; (main.s5 + 0)
.s6:
095e : a9 00 __ LDA #$00
0960 : 8d f2 54 STA $54f2 ; (PalTimer + 0)
0963 : 8d f3 54 STA $54f3 ; (PalTimer + 1)
.s1021:
0966 : 85 54 __ STA T4 + 0 
.s82:
0968 : ad f3 54 LDA $54f3 ; (PalTimer + 1)
096b : 30 5f __ BMI $09cc ; (main.s13 + 0)
.s1017:
096d : d0 07 __ BNE $0976 ; (main.s11 + 0)
.s1016:
096f : a9 03 __ LDA #$03
0971 : cd f2 54 CMP $54f2 ; (PalTimer + 0)
0974 : b0 56 __ BCS $09cc ; (main.s13 + 0)
.s11:
0976 : a9 60 __ LDA #$60
0978 : 85 34 __ STA P7 
097a : a9 00 __ LDA #$00
097c : 85 35 __ STA P8 
097e : 85 36 __ STA P9 
0980 : 85 37 __ STA P10 
0982 : 8d fa 9e STA $9efa ; (sstack + 0)
0985 : 8d fb 9e STA $9efb ; (sstack + 1)
0988 : a9 05 __ LDA #$05
098a : 8d fc 9e STA $9efc ; (sstack + 2)
098d : a9 00 __ LDA #$00
098f : 8d fd 9e STA $9efd ; (sstack + 3)
0992 : ee f4 54 INC $54f4 ; (PalIndex + 0)
0995 : d0 03 __ BNE $099a ; (main.s1029 + 0)
.s1028:
0997 : ee f5 54 INC $54f5 ; (PalIndex + 1)
.s1029:
099a : a9 80 __ LDA #$80
099c : 85 32 __ STA P5 
099e : a9 4f __ LDA #$4f
09a0 : 85 33 __ STA P6 
09a2 : 20 b9 1a JSR $1ab9 ; (SetPaletteIndex.s0 + 0)
09a5 : a9 50 __ LDA #$50
09a7 : 85 34 __ STA P7 
09a9 : a9 00 __ LDA #$00
09ab : 8d fa 9e STA $9efa ; (sstack + 0)
09ae : 8d fb 9e STA $9efb ; (sstack + 1)
09b1 : 8d fd 9e STA $9efd ; (sstack + 3)
09b4 : a9 10 __ LDA #$10
09b6 : 8d fc 9e STA $9efc ; (sstack + 2)
09b9 : a9 32 __ LDA #$32
09bb : 85 32 __ STA P5 
09bd : a9 54 __ LDA #$54
09bf : 85 33 __ STA P6 
09c1 : 20 b9 1a JSR $1ab9 ; (SetPaletteIndex.s0 + 0)
09c4 : a9 00 __ LDA #$00
09c6 : 8d f2 54 STA $54f2 ; (PalTimer + 0)
09c9 : 8d f3 54 STA $54f3 ; (PalTimer + 1)
.s13:
09cc : a9 03 __ LDA #$03
09ce : 8d 2c 9f STA $9f2c 
09d1 : a5 55 __ LDA T5 + 0 
09d3 : c9 44 __ CMP #$44
09d5 : d0 0c __ BNE $09e3 ; (main.s15 + 0)
.s17:
09d7 : a5 52 __ LDA T2 + 0 
09d9 : cd f6 54 CMP $54f6 ; (MaxSong + 0)
09dc : b0 03 __ BCS $09e1 ; (main.s1023 + 0)
09de : 4c ce 0b JMP $0bce ; (main.s14 + 0)
.s1023:
09e1 : a5 55 __ LDA T5 + 0 
.s15:
09e3 : c9 41 __ CMP #$41
09e5 : d0 21 __ BNE $0a08 ; (main.s16 + 0)
.s21:
09e7 : a5 52 __ LDA T2 + 0 
09e9 : f0 1d __ BEQ $0a08 ; (main.s16 + 0)
.s18:
09eb : c6 52 __ DEC T2 + 0 
.s96:
09ed : 20 1f 23 JSR $231f ; (ResetChars.s0 + 0)
09f0 : a9 00 __ LDA #$00
09f2 : 8d f7 54 STA $54f7 ; (off1 + 0)
09f5 : 8d f8 54 STA $54f8 ; (off1 + 1)
09f8 : a9 80 __ LDA #$80
09fa : 8d 37 9f STA $9f37 
09fd : a9 fd __ LDA #$fd
09ff : 8d 38 9f STA $9f38 
0a02 : a9 00 __ LDA #$00
0a04 : 85 50 __ STA T1 + 0 
0a06 : 85 51 __ STA T1 + 1 
.s16:
0a08 : a5 53 __ LDA T3 + 0 
0a0a : 85 30 __ STA P3 
0a0c : a5 55 __ LDA T5 + 0 
0a0e : 85 31 __ STA P4 
0a10 : 20 44 23 JSR $2344 ; (Control.s0 + 0)
0a13 : a5 3b __ LDA ACCU + 0 
0a15 : 85 53 __ STA T3 + 0 
0a17 : 38 __ __ SEC
0a18 : a5 50 __ LDA T1 + 0 
0a1a : e9 80 __ SBC #$80
0a1c : 8d 37 9f STA $9f37 
0a1f : a5 51 __ LDA T1 + 1 
0a21 : e9 02 __ SBC #$02
0a23 : 8d 38 9f STA $9f38 
0a26 : 20 ba 23 JSR $23ba ; (UpdateVolume.s0 + 0)
0a29 : ad fe 4f LDA $4ffe ; (FrameCount + 0)
0a2c : 85 3b __ STA ACCU + 0 
0a2e : ad ff 4f LDA $4fff ; (FrameCount + 1)
0a31 : 85 3c __ STA ACCU + 1 
0a33 : a9 08 __ LDA #$08
0a35 : 85 23 __ STA WORK + 0 
0a37 : a9 00 __ LDA #$00
0a39 : 85 24 __ STA WORK + 1 
0a3b : 20 36 26 JSR $2636 ; (mods16 + 0)
0a3e : a5 26 __ LDA WORK + 3 
0a40 : f0 03 __ BEQ $0a45 ; (main.s1009 + 0)
0a42 : 4c 1f 0b JMP $0b1f ; (main.s24 + 0)
.s1009:
0a45 : a5 25 __ LDA WORK + 2 
0a47 : c9 01 __ CMP #$01
0a49 : f0 03 __ BEQ $0a4e ; (main.s22 + 0)
0a4b : 4c 1f 0b JMP $0b1f ; (main.s24 + 0)
.s22:
0a4e : ad f7 54 LDA $54f7 ; (off1 + 0)
0a51 : 85 55 __ STA T5 + 0 
0a53 : 29 7f __ AND #$7f
0a55 : 0a __ __ ASL
0a56 : 8d 20 9f STA $9f20 
0a59 : ad 25 9f LDA $9f25 
0a5c : 29 fe __ AND #$fe
0a5e : 8d 25 9f STA $9f25 
0a61 : a9 b0 __ LDA #$b0
0a63 : 8d 21 9f STA $9f21 
0a66 : a9 11 __ LDA #$11
0a68 : 8d 22 9f STA $9f22 
0a6b : a5 52 __ LDA T2 + 0 
0a6d : c9 04 __ CMP #$04
0a6f : d0 1c __ BNE $0a8d ; (main.s1007 + 0)
.s47:
0a71 : a5 55 __ LDA T5 + 0 
0a73 : 85 3b __ STA ACCU + 0 
0a75 : ad f8 54 LDA $54f8 ; (off1 + 1)
0a78 : 85 3c __ STA ACCU + 1 
0a7a : a9 bd __ LDA #$bd
0a7c : 85 23 __ STA WORK + 0 
0a7e : a9 00 __ LDA #$00
0a80 : 85 24 __ STA WORK + 1 
0a82 : 20 b1 25 JSR $25b1 ; (divmod + 0)
0a85 : a6 25 __ LDX WORK + 2 
0a87 : bd 00 66 LDA $6600,x ; (Song4 + 0)
0a8a : 4c db 0a JMP $0adb ; (main.s87 + 0)
.s1007:
0a8d : b0 03 __ BCS $0a92 ; (main.s1003 + 0)
0a8f : 4c 43 0b JMP $0b43 ; (main.s64 + 0)
.s1003:
0a92 : c9 05 __ CMP #$05
0a94 : d0 1c __ BNE $0ab2 ; (main.s1002 + 0)
.s52:
0a96 : a5 55 __ LDA T5 + 0 
0a98 : 85 3b __ STA ACCU + 0 
0a9a : ad f8 54 LDA $54f8 ; (off1 + 1)
0a9d : 85 3c __ STA ACCU + 1 
0a9f : a9 92 __ LDA #$92
0aa1 : 85 23 __ STA WORK + 0 
0aa3 : a9 00 __ LDA #$00
0aa5 : 85 24 __ STA WORK + 1 
0aa7 : 20 b1 25 JSR $25b1 ; (divmod + 0)
0aaa : a6 25 __ LDX WORK + 2 
0aac : bd 00 67 LDA $6700,x ; (Song5 + 0)
0aaf : 4c db 0a JMP $0adb ; (main.s87 + 0)
.s1002:
0ab2 : c9 06 __ CMP #$06
0ab4 : d0 35 __ BNE $0aeb ; (main.s26 + 0)
.s57:
0ab6 : a5 55 __ LDA T5 + 0 
0ab8 : 85 3b __ STA ACCU + 0 
0aba : ad f8 54 LDA $54f8 ; (off1 + 1)
0abd : 85 3c __ STA ACCU + 1 
0abf : a9 69 __ LDA #$69
0ac1 : 85 23 __ STA WORK + 0 
0ac3 : a9 01 __ LDA #$01
0ac5 : 85 24 __ STA WORK + 1 
0ac7 : 20 b1 25 JSR $25b1 ; (divmod + 0)
0aca : 18 __ __ CLC
0acb : a9 93 __ LDA #$93
0acd : 65 25 __ ADC WORK + 2 
0acf : 85 47 __ STA T6 + 0 
0ad1 : a9 67 __ LDA #$67
.s1022:
0ad3 : 65 26 __ ADC WORK + 3 
0ad5 : 85 48 __ STA T6 + 1 
0ad7 : a0 00 __ LDY #$00
0ad9 : b1 47 __ LDA (T6 + 0),y 
.s87:
0adb : 09 00 __ ORA #$00
0add : f0 0c __ BEQ $0aeb ; (main.s26 + 0)
.s28:
0adf : 8d 23 9f STA $9f23 
0ae2 : a5 55 __ LDA T5 + 0 
0ae4 : 29 0f __ AND #$0f
0ae6 : 09 80 __ ORA #$80
0ae8 : 8d 23 9f STA $9f23 
.s26:
0aeb : a9 80 __ LDA #$80
0aed : 85 34 __ STA P7 
0aef : a9 00 __ LDA #$00
0af1 : 85 35 __ STA P8 
0af3 : 85 36 __ STA P9 
0af5 : 85 37 __ STA P10 
0af7 : 8d fa 9e STA $9efa ; (sstack + 0)
0afa : 8d fb 9e STA $9efb ; (sstack + 1)
0afd : a9 10 __ LDA #$10
0aff : 8d fc 9e STA $9efc ; (sstack + 2)
0b02 : a9 00 __ LDA #$00
0b04 : 8d fd 9e STA $9efd ; (sstack + 3)
0b07 : 18 __ __ CLC
0b08 : a5 55 __ LDA T5 + 0 
0b0a : 69 01 __ ADC #$01
0b0c : 8d f7 54 STA $54f7 ; (off1 + 0)
0b0f : 90 03 __ BCC $0b14 ; (main.s1031 + 0)
.s1030:
0b11 : ee f8 54 INC $54f8 ; (off1 + 1)
.s1031:
0b14 : a9 ac __ LDA #$ac
0b16 : 85 32 __ STA P5 
0b18 : a9 4f __ LDA #$4f
0b1a : 85 33 __ STA P6 
0b1c : 20 b9 1a JSR $1ab9 ; (SetPaletteIndex.s0 + 0)
.s24:
0b1f : a9 01 __ LDA #$01
0b21 : 8d 2c 9f STA $9f2c 
0b24 : 20 ca 20 JSR $20ca ; (zsm_fill.s0 + 0)
0b27 : a9 00 __ LDA #$00
0b29 : 8d 2c 9f STA $9f2c 
0b2c : 20 e5 22 JSR $22e5 ; (frame_wait.l1 + 0)
0b2f : ee fe 4f INC $4ffe ; (FrameCount + 0)
0b32 : d0 03 __ BNE $0b37 ; (main.s1033 + 0)
.s1032:
0b34 : ee ff 4f INC $4fff ; (FrameCount + 1)
.s1033:
0b37 : e6 50 __ INC T1 + 0 
0b39 : f0 03 __ BEQ $0b3e ; (main.s1034 + 0)
0b3b : 4c ff 08 JMP $08ff ; (main.l3 + 0)
.s1034:
0b3e : e6 51 __ INC T1 + 1 
0b40 : 4c ff 08 JMP $08ff ; (main.l3 + 0)
.s64:
0b43 : 09 00 __ ORA #$00
0b45 : d0 20 __ BNE $0b67 ; (main.s1006 + 0)
.s27:
0b47 : a5 55 __ LDA T5 + 0 
0b49 : 85 3b __ STA ACCU + 0 
0b4b : ad f8 54 LDA $54f8 ; (off1 + 1)
0b4e : 85 3c __ STA ACCU + 1 
0b50 : a9 1d __ LDA #$1d
0b52 : 85 23 __ STA WORK + 0 
0b54 : a9 06 __ LDA #$06
0b56 : 85 24 __ STA WORK + 1 
0b58 : 20 b1 25 JSR $25b1 ; (divmod + 0)
0b5b : 18 __ __ CLC
0b5c : a9 00 __ LDA #$00
0b5e : 65 25 __ ADC WORK + 2 
0b60 : 85 47 __ STA T6 + 0 
0b62 : a9 56 __ LDA #$56
0b64 : 4c d3 0a JMP $0ad3 ; (main.s1022 + 0)
.s1006:
0b67 : c9 01 __ CMP #$01
0b69 : d0 20 __ BNE $0b8b ; (main.s1005 + 0)
.s32:
0b6b : a5 55 __ LDA T5 + 0 
0b6d : 85 3b __ STA ACCU + 0 
0b6f : ad f8 54 LDA $54f8 ; (off1 + 1)
0b72 : 85 3c __ STA ACCU + 1 
0b74 : a9 5c __ LDA #$5c
0b76 : 85 23 __ STA WORK + 0 
0b78 : a9 07 __ LDA #$07
0b7a : 85 24 __ STA WORK + 1 
0b7c : 20 b1 25 JSR $25b1 ; (divmod + 0)
0b7f : 18 __ __ CLC
0b80 : a9 1e __ LDA #$1e
0b82 : 65 25 __ ADC WORK + 2 
0b84 : 85 47 __ STA T6 + 0 
0b86 : a9 5c __ LDA #$5c
0b88 : 4c d3 0a JMP $0ad3 ; (main.s1022 + 0)
.s1005:
0b8b : c9 02 __ CMP #$02
0b8d : d0 1c __ BNE $0bab ; (main.s1004 + 0)
.s37:
0b8f : a5 55 __ LDA T5 + 0 
0b91 : 85 3b __ STA ACCU + 0 
0b93 : ad f8 54 LDA $54f8 ; (off1 + 1)
0b96 : 85 3c __ STA ACCU + 1 
0b98 : a9 c5 __ LDA #$c5
0b9a : 85 23 __ STA WORK + 0 
0b9c : a9 00 __ LDA #$00
0b9e : 85 24 __ STA WORK + 1 
0ba0 : 20 b1 25 JSR $25b1 ; (divmod + 0)
0ba3 : a6 25 __ LDX WORK + 2 
0ba5 : bd 00 64 LDA $6400,x ; (Song2 + 0)
0ba8 : 4c db 0a JMP $0adb ; (main.s87 + 0)
.s1004:
0bab : c9 03 __ CMP #$03
0bad : f0 03 __ BEQ $0bb2 ; (main.s42 + 0)
0baf : 4c eb 0a JMP $0aeb ; (main.s26 + 0)
.s42:
0bb2 : a5 55 __ LDA T5 + 0 
0bb4 : 85 3b __ STA ACCU + 0 
0bb6 : ad f8 54 LDA $54f8 ; (off1 + 1)
0bb9 : 85 3c __ STA ACCU + 1 
0bbb : a9 c3 __ LDA #$c3
0bbd : 85 23 __ STA WORK + 0 
0bbf : a9 00 __ LDA #$00
0bc1 : 85 24 __ STA WORK + 1 
0bc3 : 20 b1 25 JSR $25b1 ; (divmod + 0)
0bc6 : a6 25 __ LDX WORK + 2 
0bc8 : bd 00 65 LDA $6500,x ; (Song3 + 0)
0bcb : 4c db 0a JMP $0adb ; (main.s87 + 0)
.s14:
0bce : e6 52 __ INC T2 + 0 
0bd0 : 4c ed 09 JMP $09ed ; (main.s96 + 0)
.s5:
0bd3 : a5 52 __ LDA T2 + 0 
0bd5 : 8d fc 9e STA $9efc ; (sstack + 2)
0bd8 : a9 00 __ LDA #$00
0bda : 8d fd 9e STA $9efd ; (sstack + 3)
0bdd : ad ff 3f LDA $3fff ; (LastSelectedSong + 0)
0be0 : 8d fe 9e STA $9efe ; (sstack + 4)
0be3 : a9 00 __ LDA #$00
0be5 : 8d ff 9e STA $9eff ; (sstack + 5)
0be8 : 20 a2 1d JSR $1da2 ; (PlayZSM.s0 + 0)
0beb : a5 52 __ LDA T2 + 0 
0bed : 8d ff 3f STA $3fff ; (LastSelectedSong + 0)
0bf0 : ee f2 54 INC $54f2 ; (PalTimer + 0)
0bf3 : d0 03 __ BNE $0bf8 ; (main.s1027 + 0)
.s1026:
0bf5 : ee f3 54 INC $54f3 ; (PalTimer + 1)
.s1027:
0bf8 : e6 54 __ INC T4 + 0 
0bfa : a5 54 __ LDA T4 + 0 
0bfc : c9 03 __ CMP #$03
0bfe : b0 03 __ BCS $0c03 ; (main.s8 + 0)
0c00 : 4c 68 09 JMP $0968 ; (main.s82 + 0)
.s8:
0c03 : a9 c0 __ LDA #$c0
0c05 : 85 34 __ STA P7 
0c07 : a9 00 __ LDA #$00
0c09 : 85 35 __ STA P8 
0c0b : 85 36 __ STA P9 
0c0d : 85 37 __ STA P10 
0c0f : 8d fa 9e STA $9efa ; (sstack + 0)
0c12 : 8d fb 9e STA $9efb ; (sstack + 1)
0c15 : a9 04 __ LDA #$04
0c17 : 8d fc 9e STA $9efc ; (sstack + 2)
0c1a : a9 00 __ LDA #$00
0c1c : 8d fd 9e STA $9efd ; (sstack + 3)
0c1f : a9 1c __ LDA #$1c
0c21 : 85 32 __ STA P5 
0c23 : a9 50 __ LDA #$50
0c25 : 85 33 __ STA P6 
0c27 : 20 b9 1a JSR $1ab9 ; (SetPaletteIndex.s0 + 0)
0c2a : a9 10 __ LDA #$10
0c2c : 85 34 __ STA P7 
0c2e : a9 06 __ LDA #$06
0c30 : 8d fa 9e STA $9efa ; (sstack + 0)
0c33 : a9 00 __ LDA #$00
0c35 : 8d fb 9e STA $9efb ; (sstack + 1)
0c38 : 8d fd 9e STA $9efd ; (sstack + 3)
0c3b : a9 0a __ LDA #$0a
0c3d : 8d fc 9e STA $9efc ; (sstack + 2)
0c40 : a9 9f __ LDA #$9f
0c42 : 85 32 __ STA P5 
0c44 : a9 3d __ LDA #$3d
0c46 : 85 33 __ STA P6 
0c48 : 20 b9 1a JSR $1ab9 ; (SetPaletteIndex.s0 + 0)
0c4b : a9 00 __ LDA #$00
0c4d : 4c 66 09 JMP $0966 ; (main.s1021 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0c50 : 78 __ __ SEI
0c51 : ad 14 03 LDA $0314 
0c54 : 8d fa 54 STA $54fa ; (oirq + 0)
0c57 : ad 15 03 LDA $0315 
0c5a : 8d fb 54 STA $54fb ; (oirq + 1)
0c5d : a9 69 __ LDA #$69
0c5f : 8d 14 03 STA $0314 
0c62 : a9 0c __ LDA #$0c
0c64 : 8d 15 03 STA $0315 
0c67 : 58 __ __ CLI
.s1001:
0c68 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
54fa : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c69 : 20 6f 0c JSR $0c6f ; (irq.s1000 + 0)
0c6c : 6c fa 54 JMP ($54fa)
--------------------------------------------------------------------
irq:
.s1000:
0c6f : a5 2d __ LDA P0 
0c71 : 48 __ __ PHA
0c72 : a5 2e __ LDA P1 
0c74 : 48 __ __ PHA
0c75 : a5 3b __ LDA ACCU + 0 
0c77 : 48 __ __ PHA
0c78 : a5 3c __ LDA ACCU + 1 
0c7a : 48 __ __ PHA
0c7b : a5 47 __ LDA T0 + 0 
0c7d : 48 __ __ PHA
0c7e : a5 48 __ LDA $48 
0c80 : 48 __ __ PHA
0c81 : a5 49 __ LDA $49 
0c83 : 48 __ __ PHA
0c84 : a5 4a __ LDA $4a 
0c86 : 48 __ __ PHA
0c87 : a5 4b __ LDA $4b 
0c89 : 48 __ __ PHA
0c8a : a5 4c __ LDA $4c 
0c8c : 48 __ __ PHA
0c8d : a5 4d __ LDA $4d 
0c8f : 48 __ __ PHA
0c90 : a5 4e __ LDA $4e 
0c92 : 48 __ __ PHA
0c93 : a5 4f __ LDA $4f 
0c95 : 48 __ __ PHA
0c96 : a5 50 __ LDA $50 
0c98 : 48 __ __ PHA
.s0:
0c99 : ad fd 1f LDA $1ffd ; (zsm_playing + 0)
0c9c : f0 08 __ BEQ $0ca6 ; (irq.s1001 + 0)
.s4:
0c9e : ad fe 1f LDA $1ffe ; (zsm_finished + 0)
0ca1 : d0 03 __ BNE $0ca6 ; (irq.s1001 + 0)
.s1:
0ca3 : 20 d1 0c JSR $0cd1 ; (zsm_play.s0 + 0)
.s1001:
0ca6 : 68 __ __ PLA
0ca7 : 85 50 __ STA $50 
0ca9 : 68 __ __ PLA
0caa : 85 4f __ STA $4f 
0cac : 68 __ __ PLA
0cad : 85 4e __ STA $4e 
0caf : 68 __ __ PLA
0cb0 : 85 4d __ STA $4d 
0cb2 : 68 __ __ PLA
0cb3 : 85 4c __ STA $4c 
0cb5 : 68 __ __ PLA
0cb6 : 85 4b __ STA $4b 
0cb8 : 68 __ __ PLA
0cb9 : 85 4a __ STA $4a 
0cbb : 68 __ __ PLA
0cbc : 85 49 __ STA $49 
0cbe : 68 __ __ PLA
0cbf : 85 48 __ STA $48 
0cc1 : 68 __ __ PLA
0cc2 : 85 47 __ STA T0 + 0 
0cc4 : 68 __ __ PLA
0cc5 : 85 3c __ STA ACCU + 1 
0cc7 : 68 __ __ PLA
0cc8 : 85 3b __ STA ACCU + 0 
0cca : 68 __ __ PLA
0ccb : 85 2e __ STA P1 
0ccd : 68 __ __ PLA
0cce : 85 2d __ STA P0 
0cd0 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1ffd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1ffe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0cd1 : ad ff 1f LDA $1fff ; (zsm_paused + 0)
0cd4 : f0 01 __ BEQ $0cd7 ; (zsm_play.s2 + 0)
0cd6 : 60 __ __ RTS
.s2:
0cd7 : ad fc 54 LDA $54fc ; (zsm_delay + 0)
0cda : f0 03 __ BEQ $0cdf ; (zsm_play.s5 + 0)
0cdc : 4c fa 0d JMP $0dfa ; (zsm_play.s4 + 0)
.s5:
0cdf : ad 25 9f LDA $9f25 
0ce2 : 85 47 __ STA T0 + 0 
0ce4 : ad 25 9f LDA $9f25 
0ce7 : 29 fe __ AND #$fe
0ce9 : 8d 25 9f STA $9f25 
0cec : ad 20 9f LDA $9f20 
0cef : 85 49 __ STA T2 + 0 
0cf1 : ad 21 9f LDA $9f21 
0cf4 : 85 4a __ STA T2 + 1 
0cf6 : ad 22 9f LDA $9f22 
0cf9 : 85 48 __ STA T1 + 0 
.l8:
0cfb : ad fd 54 LDA $54fd ; (zsm_pos + 0)
0cfe : 85 3b __ STA ACCU + 0 
0d00 : aa __ __ TAX
0d01 : 18 __ __ CLC
0d02 : 69 01 __ ADC #$01
0d04 : 85 4d __ STA T4 + 0 
0d06 : 8d fd 54 STA $54fd ; (zsm_pos + 0)
0d09 : ad fe 54 LDA $54fe ; (zsm_pos + 1)
0d0c : 85 4c __ STA T3 + 1 
0d0e : 69 00 __ ADC #$00
0d10 : 85 4e __ STA T4 + 1 
0d12 : 8d fe 54 STA $54fe ; (zsm_pos + 1)
0d15 : a5 4c __ LDA T3 + 1 
0d17 : 29 03 __ AND #$03
0d19 : 18 __ __ CLC
0d1a : 69 69 __ ADC #$69
0d1c : 85 3c __ STA ACCU + 1 
0d1e : a0 00 __ LDY #$00
0d20 : b1 3b __ LDA (ACCU + 0),y 
0d22 : c9 40 __ CMP #$40
0d24 : b0 33 __ BCS $0d59 ; (zsm_play.s12 + 0)
.s11:
0d26 : 29 3f __ AND #$3f
0d28 : 09 c0 __ ORA #$c0
0d2a : 8d 20 9f STA $9f20 
0d2d : a9 f9 __ LDA #$f9
0d2f : 8d 21 9f STA $9f21 
0d32 : a9 01 __ LDA #$01
0d34 : 8d 22 9f STA $9f22 
0d37 : 8a __ __ TXA
0d38 : 69 02 __ ADC #$02
0d3a : 8d fd 54 STA $54fd ; (zsm_pos + 0)
0d3d : a5 4c __ LDA T3 + 1 
0d3f : 69 00 __ ADC #$00
0d41 : 8d fe 54 STA $54fe ; (zsm_pos + 1)
0d44 : a5 4d __ LDA T4 + 0 
0d46 : 85 4b __ STA T3 + 0 
0d48 : a5 4e __ LDA T4 + 1 
0d4a : 29 03 __ AND #$03
0d4c : 18 __ __ CLC
0d4d : 69 69 __ ADC #$69
0d4f : 85 4c __ STA T3 + 1 
0d51 : b1 4b __ LDA (T3 + 0),y 
0d53 : 8d 23 9f STA $9f23 
0d56 : 4c fb 0c JMP $0cfb ; (zsm_play.l8 + 0)
.s12:
0d59 : d0 20 __ BNE $0d7b ; (zsm_play.s15 + 0)
.s14:
0d5b : a5 4d __ LDA T4 + 0 
0d5d : 85 4b __ STA T3 + 0 
0d5f : a5 4e __ LDA T4 + 1 
0d61 : 29 03 __ AND #$03
0d63 : 18 __ __ CLC
0d64 : 69 69 __ ADC #$69
0d66 : 85 4c __ STA T3 + 1 
0d68 : b1 4b __ LDA (T3 + 0),y 
0d6a : 29 3f __ AND #$3f
0d6c : 18 __ __ CLC
0d6d : 65 4d __ ADC T4 + 0 
0d6f : 8d fd 54 STA $54fd ; (zsm_pos + 0)
0d72 : 98 __ __ TYA
0d73 : 65 4e __ ADC T4 + 1 
0d75 : 8d fe 54 STA $54fe ; (zsm_pos + 1)
0d78 : 4c fb 0c JMP $0cfb ; (zsm_play.l8 + 0)
.s15:
0d7b : 09 00 __ ORA #$00
0d7d : 30 53 __ BMI $0dd2 ; (zsm_play.s18 + 0)
.s17:
0d7f : 29 3f __ AND #$3f
0d81 : d0 03 __ BNE $0d86 ; (zsm_play.s29 + 0)
0d83 : 4c fb 0c JMP $0cfb ; (zsm_play.l8 + 0)
.s29:
0d86 : 84 50 __ STY T7 + 0 
0d88 : 85 4f __ STA T6 + 0 
0d8a : 18 __ __ CLC
.l1012:
0d8b : ad fd 54 LDA $54fd ; (zsm_pos + 0)
0d8e : 85 4d __ STA T4 + 0 
0d90 : ad fe 54 LDA $54fe ; (zsm_pos + 1)
0d93 : 29 03 __ AND #$03
0d95 : 69 69 __ ADC #$69
0d97 : 85 4e __ STA T4 + 1 
0d99 : a0 00 __ LDY #$00
0d9b : b1 4d __ LDA (T4 + 0),y 
0d9d : 85 2d __ STA P0 
0d9f : 18 __ __ CLC
0da0 : a5 4d __ LDA T4 + 0 
0da2 : 69 01 __ ADC #$01
0da4 : 85 4b __ STA T3 + 0 
0da6 : ad fe 54 LDA $54fe ; (zsm_pos + 1)
0da9 : 69 00 __ ADC #$00
0dab : 29 03 __ AND #$03
0dad : 18 __ __ CLC
0dae : 69 69 __ ADC #$69
0db0 : 85 4c __ STA T3 + 1 
0db2 : b1 4b __ LDA (T3 + 0),y 
0db4 : 85 2e __ STA P1 
0db6 : 20 fe 0d JSR $0dfe ; (sfx_put.s1 + 0)
0db9 : ad fd 54 LDA $54fd ; (zsm_pos + 0)
0dbc : 18 __ __ CLC
0dbd : 69 02 __ ADC #$02
0dbf : 8d fd 54 STA $54fd ; (zsm_pos + 0)
0dc2 : 90 03 __ BCC $0dc7 ; (zsm_play.s1015 + 0)
.s1014:
0dc4 : ee fe 54 INC $54fe ; (zsm_pos + 1)
.s1015:
0dc7 : e6 50 __ INC T7 + 0 
0dc9 : a5 50 __ LDA T7 + 0 
0dcb : c5 4f __ CMP T6 + 0 
0dcd : 90 bc __ BCC $0d8b ; (zsm_play.l1012 + 0)
0dcf : 4c fb 0c JMP $0cfb ; (zsm_play.l8 + 0)
.s18:
0dd2 : c9 80 __ CMP #$80
0dd4 : d0 07 __ BNE $0ddd ; (zsm_play.s25 + 0)
.s24:
0dd6 : a9 01 __ LDA #$01
0dd8 : 8d fe 1f STA $1ffe ; (zsm_finished + 0)
0ddb : d0 08 __ BNE $0de5 ; (zsm_play.s10 + 0)
.s25:
0ddd : 29 7f __ AND #$7f
0ddf : 38 __ __ SEC
0de0 : e9 01 __ SBC #$01
0de2 : 8d fc 54 STA $54fc ; (zsm_delay + 0)
.s10:
0de5 : a5 49 __ LDA T2 + 0 
0de7 : 8d 20 9f STA $9f20 
0dea : a5 4a __ LDA T2 + 1 
0dec : 8d 21 9f STA $9f21 
0def : a5 48 __ LDA T1 + 0 
0df1 : 8d 22 9f STA $9f22 
0df4 : a5 47 __ LDA T0 + 0 
0df6 : 8d 25 9f STA $9f25 
.s1001:
0df9 : 60 __ __ RTS
.s4:
0dfa : ce fc 54 DEC $54fc ; (zsm_delay + 0)
0dfd : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
1fff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
54fc : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
6900 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
54fd : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.s1:
0dfe : a6 2e __ LDX P1 ; (data + 0)
.l1004:
0e00 : ad 41 9f LDA $9f41 
0e03 : 30 fb __ BMI $0e00 ; (sfx_put.l1004 + 0)
.s1005:
0e05 : 8a __ __ TXA
0e06 : a4 2d __ LDY P0 ; (index + 0)
0e08 : 8c 40 9f STY $9f40 
0e0b : 99 00 6d STA $6d00,y ; (vera_fm_s_regs + 0)
0e0e : c0 08 __ CPY #$08
0e10 : d0 07 __ BNE $0e19 ; (sfx_put.l7 + 0)
.s4:
0e12 : 29 07 __ AND #$07
0e14 : a8 __ __ TAY
0e15 : 8a __ __ TXA
0e16 : 99 7b 63 STA $637b,y ; (vera_fm_gate + 0)
.l7:
0e19 : ad 41 9f LDA $9f41 
0e1c : 30 fb __ BMI $0e19 ; (sfx_put.l7 + 0)
.s9:
0e1e : 8e 41 9f STX $9f41 
.s1001:
0e21 : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
6d00 : __ __ __ BSS	256
--------------------------------------------------------------------
vera_fm_gate:
637b : __ __ __ BSS	8
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0e22 : a9 93 __ LDA #$93
0e24 : 85 2d __ STA P0 
0e26 : a9 00 __ LDA #$00
0e28 : 85 2e __ STA P1 
0e2a : 20 5f 0e JSR $0e5f ; (putch.s0 + 0)
0e2d : a9 11 __ LDA #$11
0e2f : 8d 22 9f STA $9f22 
0e32 : a2 00 __ LDX #$00
.l2:
0e34 : 8a __ __ TXA
0e35 : 18 __ __ CLC
0e36 : 69 b0 __ ADC #$b0
0e38 : 8d 21 9f STA $9f21 
0e3b : a9 00 __ LDA #$00
0e3d : 8d 20 9f STA $9f20 
0e40 : a0 80 __ LDY #$80
.l1003:
0e42 : a9 20 __ LDA #$20
0e44 : 8d 23 9f STA $9f23 
0e47 : a9 01 __ LDA #$01
0e49 : 8d 23 9f STA $9f23 
0e4c : a9 20 __ LDA #$20
0e4e : 8d 24 9f STA $9f24 
0e51 : a9 01 __ LDA #$01
0e53 : 8d 24 9f STA $9f24 
0e56 : 88 __ __ DEY
0e57 : d0 e9 __ BNE $0e42 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0e59 : e8 __ __ INX
0e5a : e0 40 __ CPX #$40
0e5c : 90 d6 __ BCC $0e34 ; (ClearVERAScreen.l2 + 0)
.s1001:
0e5e : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0e5f : a5 2d __ LDA P0 
0e61 : 20 d2 ff JSR $ffd2 
.s1001:
0e64 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e65 : a9 40 __ LDA #$40
0e67 : 8d f4 21 STA $21f4 ; (VolAddr + 0)
0e6a : a9 57 __ LDA #$57
0e6c : 8d f5 21 STA $21f5 ; (VolAddr + 1)
0e6f : a9 01 __ LDA #$01
0e71 : 8d f6 21 STA $21f6 ; (VolAddr + 2)
0e74 : 8d fa 21 STA $21fa ; (IndAddr + 2)
0e77 : a9 00 __ LDA #$00
0e79 : 8d f7 21 STA $21f7 ; (VolAddr + 3)
0e7c : 8d f8 21 STA $21f8 ; (IndAddr + 0)
0e7f : 8d fb 21 STA $21fb ; (IndAddr + 3)
0e82 : a9 31 __ LDA #$31
0e84 : 8d f9 21 STA $21f9 ; (IndAddr + 1)
0e87 : a9 00 __ LDA #$00
0e89 : 8d 25 9f STA $9f25 
0e8c : a9 80 __ LDA #$80
0e8e : 8d 2b 9f STA $9f2b 
0e91 : 8d 2a 9f STA $9f2a 
0e94 : a9 62 __ LDA #$62
0e96 : 8d 2d 9f STA $9f2d 
0e99 : a9 68 __ LDA #$68
0e9b : 8d 34 9f STA $9f34 
0e9e : a9 00 __ LDA #$00
0ea0 : 85 2d __ STA P0 
0ea2 : 85 2e __ STA P1 
0ea4 : 85 2f __ STA P2 
0ea6 : 85 30 __ STA P3 
0ea8 : 85 31 __ STA P4 
0eaa : 20 14 18 JSR $1814 ; (tileBaseConfig.s0 + 0)
0ead : 8d 2f 9f STA $9f2f 
0eb0 : a9 00 __ LDA #$00
0eb2 : 85 2d __ STA P0 
0eb4 : a9 20 __ LDA #$20
0eb6 : 85 2f __ STA P2 
0eb8 : 20 2c 18 JSR $182c ; (memoryToMapMemoryAddress.s0 + 0)
0ebb : 8d 2e 9f STA $9f2e 
0ebe : a9 01 __ LDA #$01
0ec0 : 8d 22 9f STA $9f22 
0ec3 : a2 80 __ LDX #$80
.l6:
0ec5 : a0 50 __ LDY #$50
.l1071:
0ec7 : a9 00 __ LDA #$00
0ec9 : 8d 24 9f STA $9f24 
0ecc : a9 08 __ LDA #$08
0ece : 8d 24 9f STA $9f24 
0ed1 : 88 __ __ DEY
0ed2 : d0 f3 __ BNE $0ec7 ; (SetUpSprites.l1071 + 0)
.s1072:
0ed4 : ca __ __ DEX
0ed5 : d0 ee __ BNE $0ec5 ; (SetUpSprites.l6 + 0)
.s4:
0ed7 : 86 4c __ STX T1 + 0 
0ed9 : a9 00 __ LDA #$00
0edb : 85 2d __ STA P0 
0edd : 85 2e __ STA P1 
0edf : 85 2f __ STA P2 
0ee1 : 85 30 __ STA P3 
0ee3 : a9 20 __ LDA #$20
0ee5 : 85 33 __ STA P6 
0ee7 : a9 03 __ LDA #$03
0ee9 : 85 34 __ STA P7 
0eeb : a9 7f __ LDA #$7f
0eed : 85 31 __ STA P4 
0eef : a9 26 __ LDA #$26
0ef1 : 85 32 __ STA P5 
0ef3 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
0ef6 : a9 c0 __ LDA #$c0
0ef8 : 85 2d __ STA P0 
0efa : a9 77 __ LDA #$77
0efc : 85 2e __ STA P1 
0efe : a9 01 __ LDA #$01
0f00 : 85 2f __ STA P2 
0f02 : a9 00 __ LDA #$00
0f04 : 85 33 __ STA P6 
0f06 : a9 10 __ LDA #$10
0f08 : 85 34 __ STA P7 
0f0a : a9 9f __ LDA #$9f
0f0c : 85 31 __ STA P4 
0f0e : a9 29 __ LDA #$29
0f10 : 85 32 __ STA P5 
0f12 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
0f15 : a9 10 __ LDA #$10
0f17 : 8d 22 9f STA $9f22 
0f1a : a9 00 __ LDA #$00
0f1c : 8d 20 9f STA $9f20 
0f1f : a9 20 __ LDA #$20
0f21 : 8d 21 9f STA $9f21 
.l10:
0f24 : a9 00 __ LDA #$00
0f26 : 85 4d __ STA T2 + 0 
.l14:
0f28 : 20 74 18 JSR $1874 ; (rand.s0 + 0)
0f2b : a9 31 __ LDA #$31
0f2d : 85 23 __ STA WORK + 0 
0f2f : a9 00 __ LDA #$00
0f31 : 85 24 __ STA WORK + 1 
0f33 : 20 b1 25 JSR $25b1 ; (divmod + 0)
0f36 : a5 4c __ LDA T1 + 0 
0f38 : d0 03 __ BNE $0f3d ; (SetUpSprites.s1041 + 0)
0f3a : 4c 20 10 JMP $1020 ; (SetUpSprites.s1037 + 0)
.s1041:
0f3d : a9 10 __ LDA #$10
0f3f : c5 4c __ CMP T1 + 0 
0f41 : a9 00 __ LDA #$00
0f43 : 2a __ __ ROL
0f44 : d0 03 __ BNE $0f49 ; (SetUpSprites.s1069 + 0)
0f46 : 4c 20 10 JMP $1020 ; (SetUpSprites.s1037 + 0)
.s1069:
0f49 : a8 __ __ TAY
0f4a : a5 4d __ LDA T2 + 0 
0f4c : f0 06 __ BEQ $0f54 ; (SetUpSprites.s26 + 0)
.s1068:
0f4e : a9 10 __ LDA #$10
0f50 : c5 4d __ CMP T2 + 0 
0f52 : b0 18 __ BCS $0f6c ; (SetUpSprites.s1065 + 0)
.s26:
0f54 : 98 __ __ TYA
0f55 : d0 03 __ BNE $0f5a ; (SetUpSprites.s1067 + 0)
0f57 : 4c 20 10 JMP $1020 ; (SetUpSprites.s1037 + 0)
.s1067:
0f5a : a5 4d __ LDA T2 + 0 
0f5c : c9 3e __ CMP #$3e
0f5e : b0 03 __ BCS $0f63 ; (SetUpSprites.s1066 + 0)
0f60 : 4c 20 10 JMP $1020 ; (SetUpSprites.s1037 + 0)
.s1066:
0f63 : a9 4e __ LDA #$4e
0f65 : c5 4d __ CMP T2 + 0 
0f67 : b0 03 __ BCS $0f6c ; (SetUpSprites.s1065 + 0)
0f69 : 4c 20 10 JMP $1020 ; (SetUpSprites.s1037 + 0)
.s1065:
0f6c : a5 4c __ LDA T1 + 0 
0f6e : c9 01 __ CMP #$01
0f70 : f0 79 __ BEQ $0feb ; (SetUpSprites.s1064 + 0)
.s1057:
0f72 : c9 10 __ CMP #$10
0f74 : d0 30 __ BNE $0fa6 ; (SetUpSprites.s1049 + 0)
.s1056:
0f76 : a5 4d __ LDA T2 + 0 
0f78 : c9 01 __ CMP #$01
0f7a : f0 04 __ BEQ $0f80 ; (SetUpSprites.s46 + 0)
.s1055:
0f7c : c9 3e __ CMP #$3e
0f7e : d0 04 __ BNE $0f84 ; (SetUpSprites.s1054 + 0)
.s46:
0f80 : a9 14 __ LDA #$14
0f82 : d0 5a __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s1054:
0f84 : c9 10 __ CMP #$10
0f86 : 90 0c __ BCC $0f94 ; (SetUpSprites.s52 + 0)
.s1053:
0f88 : a9 3e __ LDA #$3e
0f8a : c5 4d __ CMP T2 + 0 
0f8c : b0 0a __ BCS $0f98 ; (SetUpSprites.s1051 + 0)
.s1052:
0f8e : a5 4d __ LDA T2 + 0 
0f90 : c9 4e __ CMP #$4e
0f92 : b0 04 __ BCS $0f98 ; (SetUpSprites.s1051 + 0)
.s52:
0f94 : a9 15 __ LDA #$15
0f96 : d0 46 __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s1051:
0f98 : a5 4d __ LDA T2 + 0 
0f9a : c9 10 __ CMP #$10
0f9c : f0 04 __ BEQ $0fa2 ; (SetUpSprites.s59 + 0)
.s1050:
0f9e : c9 4e __ CMP #$4e
0fa0 : d0 04 __ BNE $0fa6 ; (SetUpSprites.s1049 + 0)
.s59:
0fa2 : a9 16 __ LDA #$16
0fa4 : d0 38 __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s1049:
0fa6 : a5 4d __ LDA T2 + 0 
0fa8 : c9 01 __ CMP #$01
0faa : d0 08 __ BNE $0fb4 ; (SetUpSprites.s1047 + 0)
.s1048:
0fac : a5 4c __ LDA T1 + 0 
0fae : c9 10 __ CMP #$10
0fb0 : 90 06 __ BCC $0fb8 ; (SetUpSprites.s65 + 0)
.s1084:
0fb2 : a5 4d __ LDA T2 + 0 
.s1047:
0fb4 : c9 3e __ CMP #$3e
0fb6 : d0 04 __ BNE $0fbc ; (SetUpSprites.s1046 + 0)
.s65:
0fb8 : a9 12 __ LDA #$12
0fba : d0 22 __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s1046:
0fbc : c9 10 __ CMP #$10
0fbe : d0 06 __ BNE $0fc6 ; (SetUpSprites.s1044 + 0)
.s1045:
0fc0 : a5 4c __ LDA T1 + 0 
0fc2 : c9 10 __ CMP #$10
0fc4 : 90 12 __ BCC $0fd8 ; (SetUpSprites.s70 + 0)
.s1044:
0fc6 : a5 4d __ LDA T2 + 0 
0fc8 : c9 4e __ CMP #$4e
0fca : d0 10 __ BNE $0fdc ; (SetUpSprites.s71 + 0)
.s1043:
0fcc : a5 4c __ LDA T1 + 0 
0fce : c9 10 __ CMP #$10
0fd0 : b0 0a __ BCS $0fdc ; (SetUpSprites.s71 + 0)
.s1042:
0fd2 : a9 01 __ LDA #$01
0fd4 : c5 4c __ CMP T1 + 0 
0fd6 : b0 04 __ BCS $0fdc ; (SetUpSprites.s71 + 0)
.s70:
0fd8 : a9 17 __ LDA #$17
0fda : d0 02 __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s71:
0fdc : a9 13 __ LDA #$13
.s296:
0fde : 8d 23 9f STA $9f23 
0fe1 : a9 00 __ LDA #$00
0fe3 : 8d 23 9f STA $9f23 
0fe6 : e6 4d __ INC T2 + 0 
0fe8 : 4c 28 0f JMP $0f28 ; (SetUpSprites.l14 + 0)
.s1064:
0feb : a5 4d __ LDA T2 + 0 
0fed : c9 01 __ CMP #$01
0fef : f0 04 __ BEQ $0ff5 ; (SetUpSprites.s27 + 0)
.s1063:
0ff1 : c9 3e __ CMP #$3e
0ff3 : d0 04 __ BNE $0ff9 ; (SetUpSprites.s1062 + 0)
.s27:
0ff5 : a9 0f __ LDA #$0f
0ff7 : d0 e5 __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s1062:
0ff9 : c9 10 __ CMP #$10
0ffb : 90 0c __ BCC $1009 ; (SetUpSprites.s33 + 0)
.s1061:
0ffd : a9 3e __ LDA #$3e
0fff : c5 4d __ CMP T2 + 0 
1001 : b0 0a __ BCS $100d ; (SetUpSprites.s1059 + 0)
.s1060:
1003 : a5 4d __ LDA T2 + 0 
1005 : c9 4e __ CMP #$4e
1007 : b0 04 __ BCS $100d ; (SetUpSprites.s1059 + 0)
.s33:
1009 : a9 10 __ LDA #$10
100b : d0 d1 __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s1059:
100d : a5 4d __ LDA T2 + 0 
100f : c9 10 __ CMP #$10
1011 : f0 04 __ BEQ $1017 ; (SetUpSprites.s40 + 0)
.s1058:
1013 : c9 4e __ CMP #$4e
1015 : d0 04 __ BNE $101b ; (SetUpSprites.s1083 + 0)
.s40:
1017 : a9 11 __ LDA #$11
1019 : d0 c3 __ BNE $0fde ; (SetUpSprites.s296 + 0)
.s1083:
101b : a5 4c __ LDA T1 + 0 
101d : 4c 72 0f JMP $0f72 ; (SetUpSprites.s1057 + 0)
.s1037:
1020 : a5 4c __ LDA T1 + 0 
1022 : c9 36 __ CMP #$36
1024 : 90 03 __ BCC $1029 ; (SetUpSprites.s1036 + 0)
1026 : 4c 6a 17 JMP $176a ; (SetUpSprites.s1031 + 0)
.s1036:
1029 : c9 2c __ CMP #$2c
102b : b0 03 __ BCS $1030 ; (SetUpSprites.s1035 + 0)
102d : 4c 6a 17 JMP $176a ; (SetUpSprites.s1031 + 0)
.s1035:
1030 : f0 04 __ BEQ $1036 ; (SetUpSprites.s81 + 0)
.s1034:
1032 : c9 34 __ CMP #$34
1034 : d0 04 __ BNE $103a ; (SetUpSprites.s1033 + 0)
.s81:
1036 : a9 0a __ LDA #$0a
1038 : d0 0e __ BNE $1048 ; (SetUpSprites.s279 + 0)
.s1033:
103a : c9 2d __ CMP #$2d
103c : f0 04 __ BEQ $1042 ; (SetUpSprites.s85 + 0)
.s1032:
103e : c9 35 __ CMP #$35
1040 : d0 04 __ BNE $1046 ; (SetUpSprites.s86 + 0)
.s85:
1042 : a9 0b __ LDA #$0b
1044 : d0 02 __ BNE $1048 ; (SetUpSprites.s279 + 0)
.s86:
1046 : a9 04 __ LDA #$04
.s279:
1048 : 8d 23 9f STA $9f23 
104b : a9 00 __ LDA #$00
104d : 8d 23 9f STA $9f23 
1050 : e6 4d __ INC T2 + 0 
1052 : 30 03 __ BMI $1057 ; (SetUpSprites.s11 + 0)
1054 : 4c 28 0f JMP $0f28 ; (SetUpSprites.l14 + 0)
.s11:
1057 : e6 4c __ INC T1 + 0 
1059 : a5 4c __ LDA T1 + 0 
105b : c9 40 __ CMP #$40
105d : b0 03 __ BCS $1062 ; (SetUpSprites.s12 + 0)
105f : 4c 24 0f JMP $0f24 ; (SetUpSprites.l10 + 0)
.s12:
1062 : a9 c0 __ LDA #$c0
1064 : 85 2d __ STA P0 
1066 : a9 52 __ LDA #$52
1068 : 85 2e __ STA P1 
106a : a9 01 __ LDA #$01
106c : 85 2f __ STA P2 
106e : a9 00 __ LDA #$00
1070 : 85 30 __ STA P3 
1072 : 85 33 __ STA P6 
1074 : a9 02 __ LDA #$02
1076 : 85 34 __ STA P7 
1078 : a9 9f __ LDA #$9f
107a : 85 31 __ STA P4 
107c : a9 39 __ LDA #$39
107e : 85 32 __ STA P5 
1080 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
1083 : a9 00 __ LDA #$00
1085 : 85 2d __ STA P0 
1087 : a9 55 __ LDA #$55
1089 : 85 2e __ STA P1 
108b : a9 02 __ LDA #$02
108d : 85 34 __ STA P7 
108f : a9 9f __ LDA #$9f
1091 : 85 31 __ STA P4 
1093 : a9 3b __ LDA #$3b
1095 : 85 32 __ STA P5 
1097 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
109a : a9 96 __ LDA #$96
109c : 85 2e __ STA P1 
109e : a9 0a __ LDA #$0a
10a0 : 85 2f __ STA P2 
10a2 : 85 34 __ STA P7 
10a4 : a9 02 __ LDA #$02
10a6 : 85 31 __ STA P4 
10a8 : 85 32 __ STA P5 
10aa : a9 03 __ LDA #$03
10ac : 85 33 __ STA P6 
10ae : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
10b1 : a9 68 __ LDA #$68
10b3 : 85 2e __ STA P1 
10b5 : a9 00 __ LDA #$00
10b7 : 85 2f __ STA P2 
10b9 : a9 b6 __ LDA #$b6
10bb : 85 30 __ STA P3 
10bd : a9 01 __ LDA #$01
10bf : 85 31 __ STA P4 
10c1 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
10c4 : a9 01 __ LDA #$01
10c6 : 85 2d __ STA P0 
10c8 : a9 a8 __ LDA #$a8
10ca : 85 2e __ STA P1 
10cc : a9 0a __ LDA #$0a
10ce : 85 2f __ STA P2 
10d0 : a9 00 __ LDA #$00
10d2 : 85 30 __ STA P3 
10d4 : a9 02 __ LDA #$02
10d6 : 85 31 __ STA P4 
10d8 : a9 09 __ LDA #$09
10da : 85 34 __ STA P7 
10dc : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
10df : a9 f0 __ LDA #$f0
10e1 : 85 2e __ STA P1 
10e3 : a9 01 __ LDA #$01
10e5 : 85 2f __ STA P2 
10e7 : 85 31 __ STA P4 
10e9 : a9 b6 __ LDA #$b6
10eb : 85 30 __ STA P3 
10ed : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
10f0 : a9 0b __ LDA #$0b
10f2 : 85 2d __ STA P0 
10f4 : 85 2f __ STA P2 
10f6 : a9 be __ LDA #$be
10f8 : 85 2e __ STA P1 
10fa : a9 00 __ LDA #$00
10fc : 85 30 __ STA P3 
10fe : a9 03 __ LDA #$03
1100 : 85 31 __ STA P4 
1102 : 85 32 __ STA P5 
1104 : a9 0c __ LDA #$0c
1106 : 85 34 __ STA P7 
1108 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
110b : a9 00 __ LDA #$00
110d : 85 2e __ STA P1 
110f : a9 01 __ LDA #$01
1111 : 85 2f __ STA P2 
1113 : 85 31 __ STA P4 
1115 : a9 a0 __ LDA #$a0
1117 : 85 30 __ STA P3 
1119 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
111c : a9 0c __ LDA #$0c
111e : 85 2d __ STA P0 
1120 : a9 fe __ LDA #$fe
1122 : 85 2e __ STA P1 
1124 : a9 0b __ LDA #$0b
1126 : 85 2f __ STA P2 
1128 : a9 00 __ LDA #$00
112a : 85 30 __ STA P3 
112c : a9 03 __ LDA #$03
112e : 85 31 __ STA P4 
1130 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
1133 : a9 40 __ LDA #$40
1135 : 85 2e __ STA P1 
1137 : a9 01 __ LDA #$01
1139 : 85 2f __ STA P2 
113b : 85 31 __ STA P4 
113d : a9 a0 __ LDA #$a0
113f : 85 30 __ STA P3 
1141 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1144 : a9 10 __ LDA #$10
1146 : 85 2d __ STA P0 
1148 : a9 20 __ LDA #$20
114a : 85 30 __ STA P3 
114c : a9 00 __ LDA #$00
114e : 85 31 __ STA P4 
1150 : a9 9f __ LDA #$9f
1152 : 85 2e __ STA P1 
1154 : a9 3d __ LDA #$3d
1156 : 85 2f __ STA P2 
1158 : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
115b : a9 00 __ LDA #$00
115d : 85 2d __ STA P0 
115f : 85 30 __ STA P3 
1161 : 85 33 __ STA P6 
1163 : a9 31 __ LDA #$31
1165 : 85 2e __ STA P1 
1167 : a9 01 __ LDA #$01
1169 : 85 2f __ STA P2 
116b : a9 02 __ LDA #$02
116d : 85 34 __ STA P7 
116f : a9 bf __ LDA #$bf
1171 : 85 31 __ STA P4 
1173 : a9 3d __ LDA #$3d
1175 : 85 32 __ STA P5 
1177 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
117a : a9 00 __ LDA #$00
117c : 85 4c __ STA T1 + 0 
117e : 85 4d __ STA T2 + 0 
1180 : a9 03 __ LDA #$03
1182 : 85 33 __ STA P6 
1184 : a9 02 __ LDA #$02
1186 : 85 34 __ STA P7 
1188 : 18 __ __ CLC
.l1085:
1189 : a9 88 __ LDA #$88
118b : 85 2e __ STA P1 
118d : a9 09 __ LDA #$09
118f : 85 2f __ STA P2 
1191 : a9 00 __ LDA #$00
1193 : 85 30 __ STA P3 
1195 : 85 31 __ STA P4 
1197 : 85 32 __ STA P5 
1199 : a5 4c __ LDA T1 + 0 
119b : 69 19 __ ADC #$19
119d : 85 2d __ STA P0 
119f : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
11a2 : a9 b8 __ LDA #$b8
11a4 : 85 30 __ STA P3 
11a6 : a9 01 __ LDA #$01
11a8 : 85 31 __ STA P4 
11aa : 38 __ __ SEC
11ab : a5 4d __ LDA T2 + 0 
11ad : e9 fc __ SBC #$fc
11af : 85 2e __ STA P1 
11b1 : a9 00 __ LDA #$00
11b3 : e9 03 __ SBC #$03
11b5 : 85 2f __ STA P2 
11b7 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
11ba : 18 __ __ CLC
11bb : a5 4d __ LDA T2 + 0 
11bd : 69 0c __ ADC #$0c
11bf : 85 4d __ STA T2 + 0 
11c1 : e6 4c __ INC T1 + 0 
11c3 : a5 4c __ LDA T1 + 0 
11c5 : c9 08 __ CMP #$08
11c7 : 90 c0 __ BCC $1189 ; (SetUpSprites.l1085 + 0)
.s138:
11c9 : a9 00 __ LDA #$00
11cb : 85 4c __ STA T1 + 0 
11cd : 85 4d __ STA T2 + 0 
11cf : a9 03 __ LDA #$03
11d1 : 85 33 __ STA P6 
11d3 : a9 02 __ LDA #$02
11d5 : 85 34 __ STA P7 
11d7 : 18 __ __ CLC
.l1087:
11d8 : a9 88 __ LDA #$88
11da : 85 2e __ STA P1 
11dc : a9 09 __ LDA #$09
11de : 85 2f __ STA P2 
11e0 : a9 00 __ LDA #$00
11e2 : 85 30 __ STA P3 
11e4 : 85 31 __ STA P4 
11e6 : a5 4c __ LDA T1 + 0 
11e8 : 69 21 __ ADC #$21
11ea : 85 2d __ STA P0 
11ec : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
11ef : a9 c4 __ LDA #$c4
11f1 : 85 30 __ STA P3 
11f3 : a9 01 __ LDA #$01
11f5 : 85 31 __ STA P4 
11f7 : 38 __ __ SEC
11f8 : a5 4d __ LDA T2 + 0 
11fa : e9 fc __ SBC #$fc
11fc : 85 2e __ STA P1 
11fe : a9 00 __ LDA #$00
1200 : e9 03 __ SBC #$03
1202 : 85 2f __ STA P2 
1204 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1207 : 18 __ __ CLC
1208 : a5 4d __ LDA T2 + 0 
120a : 69 0c __ ADC #$0c
120c : 85 4d __ STA T2 + 0 
120e : e6 4c __ INC T1 + 0 
1210 : a5 4c __ LDA T1 + 0 
1212 : c9 08 __ CMP #$08
1214 : 90 c2 __ BCC $11d8 ; (SetUpSprites.l1087 + 0)
.s142:
1216 : a9 00 __ LDA #$00
1218 : 85 4c __ STA T1 + 0 
121a : 85 4d __ STA T2 + 0 
121c : a9 03 __ LDA #$03
121e : 85 33 __ STA P6 
1220 : a9 02 __ LDA #$02
1222 : 85 34 __ STA P7 
1224 : 18 __ __ CLC
.l1089:
1225 : a9 88 __ LDA #$88
1227 : 85 2e __ STA P1 
1229 : a9 09 __ LDA #$09
122b : 85 2f __ STA P2 
122d : a9 00 __ LDA #$00
122f : 85 30 __ STA P3 
1231 : 85 31 __ STA P4 
1233 : a5 4c __ LDA T1 + 0 
1235 : 69 29 __ ADC #$29
1237 : 85 2d __ STA P0 
1239 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
123c : a9 b8 __ LDA #$b8
123e : 85 30 __ STA P3 
1240 : a9 01 __ LDA #$01
1242 : 85 31 __ STA P4 
1244 : 38 __ __ SEC
1245 : a9 6c __ LDA #$6c
1247 : e5 4d __ SBC T2 + 0 
1249 : 85 2e __ STA P1 
124b : a9 02 __ LDA #$02
124d : e9 04 __ SBC #$04
124f : 85 2f __ STA P2 
1251 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1254 : 18 __ __ CLC
1255 : a5 4d __ LDA T2 + 0 
1257 : 69 0c __ ADC #$0c
1259 : 85 4d __ STA T2 + 0 
125b : e6 4c __ INC T1 + 0 
125d : a5 4c __ LDA T1 + 0 
125f : c9 08 __ CMP #$08
1261 : 90 c2 __ BCC $1225 ; (SetUpSprites.l1089 + 0)
.s146:
1263 : a9 00 __ LDA #$00
1265 : 85 4c __ STA T1 + 0 
1267 : a9 02 __ LDA #$02
1269 : 85 34 __ STA P7 
126b : a9 03 __ LDA #$03
126d : 85 33 __ STA P6 
.l148:
126f : 38 __ __ SEC
1270 : a9 00 __ LDA #$00
1272 : e5 4c __ SBC T1 + 0 
1274 : 29 0c __ AND #$0c
1276 : 49 ff __ EOR #$ff
1278 : 38 __ __ SEC
1279 : 69 6c __ ADC #$6c
127b : 85 4d __ STA T2 + 0 
127d : a9 02 __ LDA #$02
127f : e9 00 __ SBC #$00
1281 : 85 4e __ STA T2 + 1 
1283 : 18 __ __ CLC
1284 : a5 4c __ LDA T1 + 0 
1286 : 69 31 __ ADC #$31
1288 : 85 2d __ STA P0 
128a : a9 02 __ LDA #$02
128c : 85 4f __ STA T5 + 0 
.l1073:
128e : a9 88 __ LDA #$88
1290 : 85 2e __ STA P1 
1292 : a9 09 __ LDA #$09
1294 : 85 2f __ STA P2 
1296 : a9 00 __ LDA #$00
1298 : 85 30 __ STA P3 
129a : 85 31 __ STA P4 
129c : 85 32 __ STA P5 
129e : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
12a1 : a5 4d __ LDA T2 + 0 
12a3 : 85 2e __ STA P1 
12a5 : a5 4e __ LDA T2 + 1 
12a7 : 85 2f __ STA P2 
12a9 : a9 b8 __ LDA #$b8
12ab : 85 30 __ STA P3 
12ad : a9 01 __ LDA #$01
12af : 85 31 __ STA P4 
12b1 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
12b4 : c6 4f __ DEC T5 + 0 
12b6 : d0 d6 __ BNE $128e ; (SetUpSprites.l1073 + 0)
.s149:
12b8 : e6 4c __ INC T1 + 0 
12ba : a5 4c __ LDA T1 + 0 
12bc : c9 02 __ CMP #$02
12be : 90 af __ BCC $126f ; (SetUpSprites.l148 + 0)
.s150:
12c0 : a9 40 __ LDA #$40
12c2 : 85 2d __ STA P0 
12c4 : a9 4d __ LDA #$4d
12c6 : 85 2e __ STA P1 
12c8 : a9 01 __ LDA #$01
12ca : 85 2f __ STA P2 
12cc : 85 34 __ STA P7 
12ce : a9 00 __ LDA #$00
12d0 : 85 30 __ STA P3 
12d2 : 85 33 __ STA P6 
12d4 : a9 00 __ LDA #$00
12d6 : 85 31 __ STA P4 
12d8 : a9 40 __ LDA #$40
12da : 85 32 __ STA P5 
12dc : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
12df : a9 33 __ LDA #$33
12e1 : 85 2d __ STA P0 
12e3 : a9 6a __ LDA #$6a
12e5 : 85 2e __ STA P1 
12e7 : a9 0a __ LDA #$0a
12e9 : 85 2f __ STA P2 
12eb : a9 01 __ LDA #$01
12ed : 85 31 __ STA P4 
12ef : a9 02 __ LDA #$02
12f1 : 85 32 __ STA P5 
12f3 : a9 03 __ LDA #$03
12f5 : 85 33 __ STA P6 
12f7 : a9 06 __ LDA #$06
12f9 : 85 34 __ STA P7 
12fb : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
12fe : a9 00 __ LDA #$00
1300 : 85 2e __ STA P1 
1302 : 85 31 __ STA P4 
1304 : a9 01 __ LDA #$01
1306 : 85 2f __ STA P2 
1308 : a9 78 __ LDA #$78
130a : 85 30 __ STA P3 
130c : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
130f : a9 00 __ LDA #$00
1311 : 85 2d __ STA P0 
1313 : 85 30 __ STA P3 
1315 : 85 33 __ STA P6 
1317 : a9 3d __ LDA #$3d
1319 : 85 2e __ STA P1 
131b : a9 04 __ LDA #$04
131d : 85 34 __ STA P7 
131f : a9 00 __ LDA #$00
1321 : 85 31 __ STA P4 
1323 : a9 41 __ LDA #$41
1325 : 85 32 __ STA P5 
1327 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
132a : a9 34 __ LDA #$34
132c : 85 2d __ STA P0 
132e : a9 e8 __ LDA #$e8
1330 : 85 2e __ STA P1 
1332 : a9 09 __ LDA #$09
1334 : 85 2f __ STA P2 
1336 : a9 03 __ LDA #$03
1338 : 85 31 __ STA P4 
133a : 85 33 __ STA P6 
133c : a9 02 __ LDA #$02
133e : 85 32 __ STA P5 
1340 : a9 05 __ LDA #$05
1342 : 85 34 __ STA P7 
1344 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
1347 : a9 00 __ LDA #$00
1349 : 85 2e __ STA P1 
134b : 85 31 __ STA P4 
134d : a9 01 __ LDA #$01
134f : 85 2f __ STA P2 
1351 : a9 78 __ LDA #$78
1353 : 85 30 __ STA P3 
1355 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1358 : a9 35 __ LDA #$35
135a : 85 2d __ STA P0 
135c : a9 08 __ LDA #$08
135e : 85 2e __ STA P1 
1360 : a9 0a __ LDA #$0a
1362 : 85 2f __ STA P2 
1364 : a9 00 __ LDA #$00
1366 : 85 30 __ STA P3 
1368 : a9 03 __ LDA #$03
136a : 85 31 __ STA P4 
136c : a9 07 __ LDA #$07
136e : 85 33 __ STA P6 
1370 : a9 06 __ LDA #$06
1372 : 85 34 __ STA P7 
1374 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
1377 : a9 00 __ LDA #$00
1379 : 85 2e __ STA P1 
137b : 85 31 __ STA P4 
137d : a9 01 __ LDA #$01
137f : 85 2f __ STA P2 
1381 : a9 e8 __ LDA #$e8
1383 : 85 30 __ STA P3 
1385 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1388 : a9 36 __ LDA #$36
138a : 85 2d __ STA P0 
138c : a9 08 __ LDA #$08
138e : 85 2e __ STA P1 
1390 : a9 0a __ LDA #$0a
1392 : 85 2f __ STA P2 
1394 : a9 00 __ LDA #$00
1396 : 85 30 __ STA P3 
1398 : a9 03 __ LDA #$03
139a : 85 31 __ STA P4 
139c : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
139f : a9 40 __ LDA #$40
13a1 : 85 2e __ STA P1 
13a3 : a9 01 __ LDA #$01
13a5 : 85 2f __ STA P2 
13a7 : a9 e8 __ LDA #$e8
13a9 : 85 30 __ STA P3 
13ab : a9 00 __ LDA #$00
13ad : 85 31 __ STA P4 
13af : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
13b2 : a9 01 __ LDA #$01
13b4 : 85 2e __ STA P1 
13b6 : a9 00 __ LDA #$00
13b8 : 85 2f __ STA P2 
13ba : 20 7a 19 JSR $197a ; (vera_spr_flip.s0 + 0)
13bd : a9 37 __ LDA #$37
13bf : 85 2d __ STA P0 
13c1 : a9 08 __ LDA #$08
13c3 : 85 2e __ STA P1 
13c5 : a9 0a __ LDA #$0a
13c7 : 85 2f __ STA P2 
13c9 : a9 00 __ LDA #$00
13cb : 85 30 __ STA P3 
13cd : a9 03 __ LDA #$03
13cf : 85 31 __ STA P4 
13d1 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
13d4 : a9 00 __ LDA #$00
13d6 : 85 2e __ STA P1 
13d8 : a9 01 __ LDA #$01
13da : 85 2f __ STA P2 
13dc : 85 31 __ STA P4 
13de : a9 08 __ LDA #$08
13e0 : 85 30 __ STA P3 
13e2 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
13e5 : 20 7a 19 JSR $197a ; (vera_spr_flip.s0 + 0)
13e8 : a9 38 __ LDA #$38
13ea : 85 2d __ STA P0 
13ec : a9 08 __ LDA #$08
13ee : 85 2e __ STA P1 
13f0 : a9 0a __ LDA #$0a
13f2 : 85 2f __ STA P2 
13f4 : a9 00 __ LDA #$00
13f6 : 85 30 __ STA P3 
13f8 : a9 03 __ LDA #$03
13fa : 85 31 __ STA P4 
13fc : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
13ff : a9 40 __ LDA #$40
1401 : 85 2e __ STA P1 
1403 : a9 01 __ LDA #$01
1405 : 85 2f __ STA P2 
1407 : 85 31 __ STA P4 
1409 : a9 08 __ LDA #$08
140b : 85 30 __ STA P3 
140d : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1410 : a9 01 __ LDA #$01
1412 : 85 2e __ STA P1 
1414 : 20 7a 19 JSR $197a ; (vera_spr_flip.s0 + 0)
1417 : a9 00 __ LDA #$00
1419 : 85 2d __ STA P0 
141b : 85 30 __ STA P3 
141d : 85 33 __ STA P6 
141f : a9 35 __ LDA #$35
1421 : 85 2e __ STA P1 
1423 : a9 08 __ LDA #$08
1425 : 85 34 __ STA P7 
1427 : a9 00 __ LDA #$00
1429 : 85 31 __ STA P4 
142b : a9 45 __ LDA #$45
142d : 85 32 __ STA P5 
142f : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
1432 : a9 00 __ LDA #$00
1434 : 85 4c __ STA T1 + 0 
1436 : 85 4d __ STA T2 + 0 
1438 : 85 4e __ STA T2 + 1 
143a : a9 02 __ LDA #$02
143c : 85 33 __ STA P6 
143e : a9 05 __ LDA #$05
1440 : 85 34 __ STA P7 
1442 : a9 03 __ LDA #$03
1444 : 85 32 __ STA P5 
1446 : 18 __ __ CLC
.l1091:
1447 : a9 a8 __ LDA #$a8
1449 : 85 2e __ STA P1 
144b : a9 09 __ LDA #$09
144d : 85 2f __ STA P2 
144f : a9 00 __ LDA #$00
1451 : 85 30 __ STA P3 
1453 : a9 03 __ LDA #$03
1455 : 85 31 __ STA P4 
1457 : a5 4c __ LDA T1 + 0 
1459 : 69 39 __ ADC #$39
145b : 85 2d __ STA P0 
145d : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
1460 : a9 20 __ LDA #$20
1462 : 85 2e __ STA P1 
1464 : a9 01 __ LDA #$01
1466 : 85 2f __ STA P2 
1468 : 38 __ __ SEC
1469 : a5 4d __ LDA T2 + 0 
146b : e9 60 __ SBC #$60
146d : 85 30 __ STA P3 
146f : a5 4e __ LDA T2 + 1 
1471 : e9 00 __ SBC #$00
1473 : 85 31 __ STA P4 
1475 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1478 : 18 __ __ CLC
1479 : a5 4d __ LDA T2 + 0 
147b : 69 40 __ ADC #$40
147d : 85 4d __ STA T2 + 0 
147f : 90 02 __ BCC $1483 ; (SetUpSprites.s1094 + 0)
.s1093:
1481 : e6 4e __ INC T2 + 1 
.s1094:
1483 : e6 4c __ INC T1 + 0 
1485 : a5 4c __ LDA T1 + 0 
1487 : c9 07 __ CMP #$07
1489 : 90 bc __ BCC $1447 ; (SetUpSprites.l1091 + 0)
.s158:
148b : a9 40 __ LDA #$40
148d : 85 2d __ STA P0 
148f : a9 4f __ LDA #$4f
1491 : 85 2e __ STA P1 
1493 : a9 00 __ LDA #$00
1495 : 85 30 __ STA P3 
1497 : 85 33 __ STA P6 
1499 : a9 02 __ LDA #$02
149b : 85 34 __ STA P7 
149d : a9 00 __ LDA #$00
149f : 85 31 __ STA P4 
14a1 : a9 4d __ LDA #$4d
14a3 : 85 32 __ STA P5 
14a5 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
14a8 : a9 80 __ LDA #$80
14aa : 85 2d __ STA P0 
14ac : 85 33 __ STA P6 
14ae : a9 4e __ LDA #$4e
14b0 : 85 2e __ STA P1 
14b2 : a9 00 __ LDA #$00
14b4 : 85 34 __ STA P7 
14b6 : a9 00 __ LDA #$00
14b8 : 85 31 __ STA P4 
14ba : a9 4f __ LDA #$4f
14bc : 85 32 __ STA P5 
14be : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
14c1 : a9 00 __ LDA #$00
14c3 : 85 4b __ STA T0 + 0 
14c5 : a9 0a __ LDA #$0a
14c7 : 85 2f __ STA P2 
14c9 : a9 02 __ LDA #$02
14cb : 85 33 __ STA P6 
14cd : a9 08 __ LDA #$08
14cf : 85 34 __ STA P7 
.l160:
14d1 : a9 74 __ LDA #$74
14d3 : 85 2e __ STA P1 
14d5 : a9 01 __ LDA #$01
14d7 : 85 31 __ STA P4 
14d9 : 85 32 __ STA P5 
14db : 18 __ __ CLC
14dc : a5 4b __ LDA T0 + 0 
14de : 69 4f __ ADC #$4f
14e0 : 85 2d __ STA P0 
14e2 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
14e5 : a5 4b __ LDA T0 + 0 
14e7 : c9 17 __ CMP #$17
14e9 : d0 0d __ BNE $14f8 ; (SetUpSprites.s288 + 0)
.s163:
14eb : a9 7a __ LDA #$7a
14ed : 85 2e __ STA P1 
14ef : a9 02 __ LDA #$02
14f1 : 85 31 __ STA P4 
14f3 : 85 32 __ STA P5 
14f5 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
.s288:
14f8 : e6 4b __ INC T0 + 0 
14fa : a5 4b __ LDA T0 + 0 
14fc : c9 18 __ CMP #$18
14fe : 90 d1 __ BCC $14d1 ; (SetUpSprites.l160 + 0)
.s162:
1500 : a9 00 __ LDA #$00
1502 : 85 2d __ STA P0 
1504 : 85 31 __ STA P4 
1506 : a9 20 __ LDA #$20
1508 : 85 30 __ STA P3 
150a : a9 bf __ LDA #$bf
150c : 85 2e __ STA P1 
150e : a9 3f __ LDA #$3f
1510 : 85 2f __ STA P2 
1512 : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
1515 : a9 20 __ LDA #$20
1517 : 85 2d __ STA P0 
1519 : a9 00 __ LDA #$00
151b : 85 31 __ STA P4 
151d : a9 df __ LDA #$df
151f : 85 2e __ STA P1 
1521 : a9 3f __ LDA #$3f
1523 : 85 2f __ STA P2 
1525 : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
1528 : a9 60 __ LDA #$60
152a : 85 2d __ STA P0 
152c : a9 00 __ LDA #$00
152e : 85 31 __ STA P4 
1530 : a9 80 __ LDA #$80
1532 : 85 2e __ STA P1 
1534 : a9 4f __ LDA #$4f
1536 : 85 2f __ STA P2 
1538 : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
153b : a9 70 __ LDA #$70
153d : 85 2d __ STA P0 
153f : a9 0c __ LDA #$0c
1541 : 85 30 __ STA P3 
1543 : a9 00 __ LDA #$00
1545 : 85 31 __ STA P4 
1547 : a9 a0 __ LDA #$a0
1549 : 85 2e __ STA P1 
154b : a9 4f __ LDA #$4f
154d : 85 2f __ STA P2 
154f : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
1552 : a9 80 __ LDA #$80
1554 : 85 2d __ STA P0 
1556 : a9 20 __ LDA #$20
1558 : 85 30 __ STA P3 
155a : a9 00 __ LDA #$00
155c : 85 31 __ STA P4 
155e : a9 ac __ LDA #$ac
1560 : 85 2e __ STA P1 
1562 : a9 4f __ LDA #$4f
1564 : 85 2f __ STA P2 
1566 : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
1569 : a9 90 __ LDA #$90
156b : 85 2d __ STA P0 
156d : a9 10 __ LDA #$10
156f : 85 30 __ STA P3 
1571 : a9 00 __ LDA #$00
1573 : 85 31 __ STA P4 
1575 : a9 cc __ LDA #$cc
1577 : 85 2e __ STA P1 
1579 : a9 4f __ LDA #$4f
157b : 85 2f __ STA P2 
157d : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
1580 : a9 a0 __ LDA #$a0
1582 : 85 2d __ STA P0 
1584 : a9 1a __ LDA #$1a
1586 : 85 30 __ STA P3 
1588 : a9 00 __ LDA #$00
158a : 85 31 __ STA P4 
158c : a9 dc __ LDA #$dc
158e : 85 2e __ STA P1 
1590 : a9 4f __ LDA #$4f
1592 : 85 2f __ STA P2 
1594 : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
1597 : a9 b0 __ LDA #$b0
1599 : 85 2d __ STA P0 
159b : a9 1c __ LDA #$1c
159d : 85 30 __ STA P3 
159f : a9 00 __ LDA #$00
15a1 : 85 31 __ STA P4 
15a3 : a9 00 __ LDA #$00
15a5 : 85 2e __ STA P1 
15a7 : a9 50 __ LDA #$50
15a9 : 85 2f __ STA P2 
15ab : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
15ae : a9 c0 __ LDA #$c0
15b0 : 85 2d __ STA P0 
15b2 : a9 16 __ LDA #$16
15b4 : 85 30 __ STA P3 
15b6 : a9 00 __ LDA #$00
15b8 : 85 31 __ STA P4 
15ba : a9 1c __ LDA #$1c
15bc : 85 2e __ STA P1 
15be : a9 50 __ LDA #$50
15c0 : 85 2f __ STA P2 
15c2 : 20 31 19 JSR $1931 ; (vera_pal_putn.s0 + 0)
15c5 : a9 00 __ LDA #$00
15c7 : 85 2d __ STA P0 
15c9 : 85 30 __ STA P3 
15cb : 85 33 __ STA P6 
15cd : a9 41 __ LDA #$41
15cf : 85 2e __ STA P1 
15d1 : a9 01 __ LDA #$01
15d3 : 85 2f __ STA P2 
15d5 : a9 04 __ LDA #$04
15d7 : 85 34 __ STA P7 
15d9 : a9 32 __ LDA #$32
15db : 85 31 __ STA P4 
15dd : a9 50 __ LDA #$50
15df : 85 32 __ STA P5 
15e1 : 20 39 18 JSR $1839 ; (vram_putn.s0 + 0)
15e4 : a9 03 __ LDA #$03
15e6 : 85 32 __ STA P5 
15e8 : 85 34 __ STA P7 
15ea : a9 08 __ LDA #$08
15ec : 85 33 __ STA P6 
15ee : a9 40 __ LDA #$40
15f0 : 85 35 __ STA P8 
15f2 : a9 57 __ LDA #$57
15f4 : 85 36 __ STA P9 
15f6 : a9 01 __ LDA #$01
15f8 : 85 37 __ STA P10 
15fa : a9 00 __ LDA #$00
15fc : 85 38 __ STA P11 
15fe : 8d fa 9e STA $9efa ; (sstack + 0)
1601 : a9 20 __ LDA #$20
1603 : 8d fb 9e STA $9efb ; (sstack + 1)
1606 : a9 9a __ LDA #$9a
1608 : 85 30 __ STA P3 
160a : a9 1a __ LDA #$1a
160c : 85 31 __ STA P4 
160e : 20 b7 19 JSR $19b7 ; (LoadSprite.s0 + 0)
1611 : a9 03 __ LDA #$03
1613 : 85 2d __ STA P0 
1615 : 85 31 __ STA P4 
1617 : a9 ba __ LDA #$ba
1619 : 85 2e __ STA P1 
161b : a9 0a __ LDA #$0a
161d : 85 2f __ STA P2 
161f : a9 00 __ LDA #$00
1621 : 85 30 __ STA P3 
1623 : a9 07 __ LDA #$07
1625 : 85 33 __ STA P6 
1627 : a9 0b __ LDA #$0b
1629 : 85 34 __ STA P7 
162b : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
162e : a9 08 __ LDA #$08
1630 : 85 2e __ STA P1 
1632 : 85 30 __ STA P3 
1634 : a9 00 __ LDA #$00
1636 : 85 2f __ STA P2 
1638 : 85 31 __ STA P4 
163a : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
163d : a9 04 __ LDA #$04
163f : 85 2d __ STA P0 
1641 : a9 fa __ LDA #$fa
1643 : 85 2e __ STA P1 
1645 : a9 0a __ LDA #$0a
1647 : 85 2f __ STA P2 
1649 : a9 00 __ LDA #$00
164b : 85 30 __ STA P3 
164d : a9 03 __ LDA #$03
164f : 85 31 __ STA P4 
1651 : 85 33 __ STA P6 
1653 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
1656 : a9 48 __ LDA #$48
1658 : 85 2e __ STA P1 
165a : a9 00 __ LDA #$00
165c : 85 2f __ STA P2 
165e : 85 31 __ STA P4 
1660 : a9 08 __ LDA #$08
1662 : 85 30 __ STA P3 
1664 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1667 : a9 05 __ LDA #$05
1669 : 85 2d __ STA P0 
166b : a9 3a __ LDA #$3a
166d : 85 2e __ STA P1 
166f : a9 0b __ LDA #$0b
1671 : 85 2f __ STA P2 
1673 : a9 00 __ LDA #$00
1675 : 85 30 __ STA P3 
1677 : a9 03 __ LDA #$03
1679 : 85 31 __ STA P4 
167b : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
167e : a9 08 __ LDA #$08
1680 : 85 2e __ STA P1 
1682 : a9 00 __ LDA #$00
1684 : 85 2f __ STA P2 
1686 : 85 31 __ STA P4 
1688 : a9 48 __ LDA #$48
168a : 85 30 __ STA P3 
168c : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
168f : a9 06 __ LDA #$06
1691 : 85 2d __ STA P0 
1693 : a9 7a __ LDA #$7a
1695 : 85 2e __ STA P1 
1697 : a9 0b __ LDA #$0b
1699 : 85 2f __ STA P2 
169b : a9 00 __ LDA #$00
169d : 85 30 __ STA P3 
169f : a9 03 __ LDA #$03
16a1 : 85 31 __ STA P4 
16a3 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
16a6 : a9 48 __ LDA #$48
16a8 : 85 2e __ STA P1 
16aa : 85 30 __ STA P3 
16ac : a9 00 __ LDA #$00
16ae : 85 2f __ STA P2 
16b0 : 85 31 __ STA P4 
16b2 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
16b5 : a9 07 __ LDA #$07
16b7 : 85 2d __ STA P0 
16b9 : 85 33 __ STA P6 
16bb : a9 ba __ LDA #$ba
16bd : 85 2e __ STA P1 
16bf : a9 0a __ LDA #$0a
16c1 : 85 2f __ STA P2 
16c3 : a9 00 __ LDA #$00
16c5 : 85 30 __ STA P3 
16c7 : a9 03 __ LDA #$03
16c9 : 85 31 __ STA P4 
16cb : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
16ce : a9 f8 __ LDA #$f8
16d0 : 85 2e __ STA P1 
16d2 : a9 01 __ LDA #$01
16d4 : 85 2f __ STA P2 
16d6 : a9 08 __ LDA #$08
16d8 : 85 30 __ STA P3 
16da : a9 00 __ LDA #$00
16dc : 85 31 __ STA P4 
16de : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
16e1 : a9 08 __ LDA #$08
16e3 : 85 2d __ STA P0 
16e5 : a9 fa __ LDA #$fa
16e7 : 85 2e __ STA P1 
16e9 : a9 0a __ LDA #$0a
16eb : 85 2f __ STA P2 
16ed : a9 00 __ LDA #$00
16ef : 85 30 __ STA P3 
16f1 : a9 03 __ LDA #$03
16f3 : 85 31 __ STA P4 
16f5 : 85 33 __ STA P6 
16f7 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
16fa : a9 38 __ LDA #$38
16fc : 85 2e __ STA P1 
16fe : a9 02 __ LDA #$02
1700 : 85 2f __ STA P2 
1702 : a9 08 __ LDA #$08
1704 : 85 30 __ STA P3 
1706 : a9 00 __ LDA #$00
1708 : 85 31 __ STA P4 
170a : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
170d : a9 09 __ LDA #$09
170f : 85 2d __ STA P0 
1711 : a9 3a __ LDA #$3a
1713 : 85 2e __ STA P1 
1715 : a9 0b __ LDA #$0b
1717 : 85 2f __ STA P2 
1719 : a9 00 __ LDA #$00
171b : 85 30 __ STA P3 
171d : a9 03 __ LDA #$03
171f : 85 31 __ STA P4 
1721 : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
1724 : a9 f8 __ LDA #$f8
1726 : 85 2e __ STA P1 
1728 : a9 01 __ LDA #$01
172a : 85 2f __ STA P2 
172c : a9 48 __ LDA #$48
172e : 85 30 __ STA P3 
1730 : a9 00 __ LDA #$00
1732 : 85 31 __ STA P4 
1734 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1737 : a9 0a __ LDA #$0a
1739 : 85 2d __ STA P0 
173b : a9 7a __ LDA #$7a
173d : 85 2e __ STA P1 
173f : a9 0b __ LDA #$0b
1741 : 85 2f __ STA P2 
1743 : a9 00 __ LDA #$00
1745 : 85 30 __ STA P3 
1747 : a9 03 __ LDA #$03
1749 : 85 31 __ STA P4 
174b : 20 9b 18 JSR $189b ; (vera_spr_set.s0 + 0)
174e : a9 38 __ LDA #$38
1750 : 85 2e __ STA P1 
1752 : a9 02 __ LDA #$02
1754 : 85 2f __ STA P2 
1756 : a9 48 __ LDA #$48
1758 : 85 30 __ STA P3 
175a : a9 00 __ LDA #$00
175c : 85 31 __ STA P4 
175e : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1761 : ad 29 9f LDA $9f29 
1764 : 09 70 __ ORA #$70
1766 : 8d 29 9f STA $9f29 
.s1001:
1769 : 60 __ __ RTS
.s1031:
176a : c9 34 __ CMP #$34
176c : 90 05 __ BCC $1773 ; (SetUpSprites.s1030 + 0)
.s89:
176e : a9 09 __ LDA #$09
1770 : 4c 48 10 JMP $1048 ; (SetUpSprites.s279 + 0)
.s1030:
1773 : a9 2c __ LDA #$2c
1775 : c5 25 __ CMP WORK + 2 
1777 : 90 38 __ BCC $17b1 ; (SetUpSprites.s1023 + 0)
.s1029:
1779 : a5 4d __ LDA T2 + 0 
177b : c9 08 __ CMP #$08
177d : 90 06 __ BCC $1785 ; (SetUpSprites.s95 + 0)
.s1028:
177f : a9 48 __ LDA #$48
1781 : c5 4d __ CMP T2 + 0 
1783 : b0 05 __ BCS $178a ; (SetUpSprites.s1027 + 0)
.s95:
1785 : a9 00 __ LDA #$00
1787 : 4c 48 10 JMP $1048 ; (SetUpSprites.s279 + 0)
.s1027:
178a : a5 4d __ LDA T2 + 0 
178c : c9 0c __ CMP #$0c
178e : 90 06 __ BCC $1796 ; (SetUpSprites.s99 + 0)
.s1026:
1790 : a9 44 __ LDA #$44
1792 : c5 4d __ CMP T2 + 0 
1794 : b0 05 __ BCS $179b ; (SetUpSprites.s1025 + 0)
.s99:
1796 : a9 01 __ LDA #$01
1798 : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
.s1025:
179b : a5 4d __ LDA T2 + 0 
179d : c9 18 __ CMP #$18
179f : 90 06 __ BCC $17a7 ; (SetUpSprites.s103 + 0)
.s1024:
17a1 : a9 38 __ LDA #$38
17a3 : c5 4d __ CMP T2 + 0 
17a5 : b0 05 __ BCS $17ac ; (SetUpSprites.s104 + 0)
.s103:
17a7 : a9 02 __ LDA #$02
17a9 : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
.s104:
17ac : a9 03 __ LDA #$03
17ae : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
.s1023:
17b1 : a9 2f __ LDA #$2f
17b3 : c5 25 __ CMP WORK + 2 
17b5 : a5 4d __ LDA T2 + 0 
17b7 : 90 36 __ BCC $17ef ; (SetUpSprites.s1016 + 0)
.s1022:
17b9 : c9 08 __ CMP #$08
17bb : 90 06 __ BCC $17c3 ; (SetUpSprites.s111 + 0)
.s1021:
17bd : a9 48 __ LDA #$48
17bf : c5 4d __ CMP T2 + 0 
17c1 : b0 05 __ BCS $17c8 ; (SetUpSprites.s1020 + 0)
.s111:
17c3 : a9 05 __ LDA #$05
17c5 : 4c 48 10 JMP $1048 ; (SetUpSprites.s279 + 0)
.s1020:
17c8 : a5 4d __ LDA T2 + 0 
17ca : c9 0c __ CMP #$0c
17cc : 90 06 __ BCC $17d4 ; (SetUpSprites.s115 + 0)
.s1019:
17ce : a9 44 __ LDA #$44
17d0 : c5 4d __ CMP T2 + 0 
17d2 : b0 05 __ BCS $17d9 ; (SetUpSprites.s1018 + 0)
.s115:
17d4 : a9 06 __ LDA #$06
17d6 : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
.s1018:
17d9 : a5 4d __ LDA T2 + 0 
17db : c9 18 __ CMP #$18
17dd : 90 06 __ BCC $17e5 ; (SetUpSprites.s119 + 0)
.s1017:
17df : a9 38 __ LDA #$38
17e1 : c5 4d __ CMP T2 + 0 
17e3 : b0 05 __ BCS $17ea ; (SetUpSprites.s120 + 0)
.s119:
17e5 : a9 07 __ LDA #$07
17e7 : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
.s120:
17ea : a9 08 __ LDA #$08
17ec : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
.s1016:
17ef : c9 08 __ CMP #$08
17f1 : 90 06 __ BCC $17f9 ; (SetUpSprites.s123 + 0)
.s1015:
17f3 : a9 48 __ LDA #$48
17f5 : c5 4d __ CMP T2 + 0 
17f7 : b0 05 __ BCS $17fe ; (SetUpSprites.s1004 + 0)
.s123:
17f9 : a9 0c __ LDA #$0c
17fb : 4c 48 10 JMP $1048 ; (SetUpSprites.s279 + 0)
.s1004:
17fe : a5 4d __ LDA T2 + 0 
1800 : c9 0c __ CMP #$0c
1802 : 90 06 __ BCC $180a ; (SetUpSprites.s127 + 0)
.s1003:
1804 : a9 44 __ LDA #$44
1806 : c5 4d __ CMP T2 + 0 
1808 : b0 05 __ BCS $180f ; (SetUpSprites.s131 + 0)
.s127:
180a : a9 0d __ LDA #$0d
180c : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
.s131:
180f : a9 0e __ LDA #$0e
1811 : 4c de 0f JMP $0fde ; (SetUpSprites.s296 + 0)
--------------------------------------------------------------------
VolAddr:
21f4 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
IndAddr:
21f8 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
tileBaseConfig:
.s0:
1814 : 46 2d __ LSR P0 ; (bank + 0)
1816 : a9 00 __ LDA #$00
1818 : 6a __ __ ROR
1819 : 85 3b __ STA ACCU + 0 
181b : a5 2f __ LDA P2 ; (mem + 1)
181d : 29 f8 __ AND #$f8
181f : 4a __ __ LSR
1820 : 05 3b __ ORA ACCU + 0 
1822 : 85 3b __ STA ACCU + 0 
1824 : a5 30 __ LDA P3 ; (height + 0)
1826 : 0a __ __ ASL
1827 : 05 3b __ ORA ACCU + 0 
1829 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
182b : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
182c : 46 2d __ LSR P0 ; (bank + 0)
182e : a9 00 __ LDA #$00
1830 : 6a __ __ ROR
1831 : 85 3b __ STA ACCU + 0 
1833 : a5 2f __ LDA P2 ; (mem + 1)
1835 : 4a __ __ LSR
1836 : 05 3b __ ORA ACCU + 0 
.s1001:
1838 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1839 : ad 25 9f LDA $9f25 
183c : 29 fe __ AND #$fe
183e : 8d 25 9f STA $9f25 
1841 : a5 2d __ LDA P0 ; (addr + 0)
1843 : 8d 20 9f STA $9f20 
1846 : a5 2e __ LDA P1 ; (addr + 1)
1848 : 8d 21 9f STA $9f21 
184b : a5 2f __ LDA P2 ; (addr + 2)
184d : 29 01 __ AND #$01
184f : 09 10 __ ORA #$10
1851 : 8d 22 9f STA $9f22 
1854 : a5 33 __ LDA P6 ; (size + 0)
1856 : 05 34 __ ORA P7 ; (size + 1)
1858 : f0 19 __ BEQ $1873 ; (vram_putn.s1001 + 0)
.s6:
185a : a0 00 __ LDY #$00
185c : a6 33 __ LDX P6 ; (size + 0)
185e : f0 02 __ BEQ $1862 ; (vram_putn.l1002 + 0)
.s1005:
1860 : e6 34 __ INC P7 ; (size + 1)
.l1002:
1862 : b1 31 __ LDA (P4),y ; (data + 0)
1864 : 8d 23 9f STA $9f23 
1867 : c8 __ __ INY
1868 : d0 02 __ BNE $186c ; (vram_putn.s1009 + 0)
.s1008:
186a : e6 32 __ INC P5 ; (data + 1)
.s1009:
186c : ca __ __ DEX
186d : d0 f3 __ BNE $1862 ; (vram_putn.l1002 + 0)
.s1004:
186f : c6 34 __ DEC P7 ; (size + 1)
1871 : d0 ef __ BNE $1862 ; (vram_putn.l1002 + 0)
.s1001:
1873 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
267f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
268f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
269f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26af : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26bf : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26cf : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
26df : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
26ef : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
26ff : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
270f : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
271f : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
272f : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
273f : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
274f : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
275f : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
276f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
277f : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
278f : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
279f : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
27af : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
27bf : __ __ __ BYT 55 55 55 55 55 55 55 55 66 66 66 66 33 33 33 33 : UUUUUUUUffff3333
27cf : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
27df : __ __ __ BYT 33 33 33 33 33 33 33 33 77 77 77 77 77 77 77 77 : 33333333wwwwwwww
27ef : __ __ __ BYT 77 77 77 77 77 77 77 77 00 00 00 00 00 00 00 00 : wwwwwwww........
27ff : __ __ __ BYT 05 00 00 50 00 08 80 00 00 89 98 00 08 95 59 80 : ...P..........Y.
280f : __ __ __ BYT 08 95 59 80 00 89 98 05 00 08 80 00 05 00 00 00 : ..Y.............
281f : __ __ __ BYT 13 11 11 11 11 11 11 31 11 18 81 11 11 89 98 11 : .......1........
282f : __ __ __ BYT 11 89 98 11 11 18 81 13 11 11 11 11 13 11 11 11 : ................
283f : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 18 81 11 : ................
284f : __ __ __ BYT 11 18 81 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
285f : __ __ __ BYT aa aa aa aa ab bb bb bb ab cc cc cc ab cc cc cc : ................
286f : __ __ __ BYT ab cc dd dd ab cc dd dd ab cc dd ee ab cc dd ef : ................
287f : __ __ __ BYT aa aa aa aa bb bb bb bb cc cc cc cc cc cc cc cc : ................
288f : __ __ __ BYT dd dd dd dd dd dd dd dd ee ee ee ee ff ff ff ff : ................
289f : __ __ __ BYT aa aa aa aa bb bb bb ba cc cc cc ba cc cc cc ba : ................
28af : __ __ __ BYT dd dd cc ba dd dd cc ba ee dd cc ba fe dd cc ba : ................
28bf : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
28cf : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
28df : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
28ef : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
28ff : __ __ __ BYT ab cc dd ef ab cc dd ee ab cc dd dd ab cc dd dd : ................
290f : __ __ __ BYT ab cc cc cc ab cc cc cc ab bb bb bb aa aa aa aa : ................
291f : __ __ __ BYT ff ff ff ff ee ee ee ee dd dd dd dd dd dd dd dd : ................
292f : __ __ __ BYT cc cc cc cc cc cc cc cc bb bb bb bb aa aa aa aa : ................
293f : __ __ __ BYT fe dd cc ba ee dd cc ba dd dd cc ba dd dd cc ba : ................
294f : __ __ __ BYT cc cc cc ba cc cc cc ba bb bb bb ba aa aa aa aa : ................
295f : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
296f : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
297f : __ __ __ BYT 22 22 22 22 22 22 33 22 22 23 22 22 22 44 44 22 : """"""3""#"""DD"
298f : __ __ __ BYT 24 84 84 82 22 44 44 22 23 23 32 32 22 22 22 22 : $..."DD"##22""""
--------------------------------------------------------------------
LogoSprite:
299f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29af : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29bf : __ __ __ BYT 00 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
29cf : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
29df : __ __ __ BYT 00 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ..""""""""""""""
29ef : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
29ff : __ __ __ BYT 00 12 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ..33333333333333
2a0f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2a1f : __ __ __ BYT 00 12 34 44 44 44 44 44 44 44 44 44 44 44 44 44 : ..4DDDDDDDDDDDDD
2a2f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2a3f : __ __ __ BYT 00 12 34 55 55 55 55 55 55 55 55 55 55 55 55 55 : ..4UUUUUUUUUUUUU
2a4f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2a5f : __ __ __ BYT 00 12 34 56 66 66 66 66 66 66 66 66 66 66 66 66 : ..4Vffffffffffff
2a6f : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2a7f : __ __ __ BYT 00 12 34 56 77 77 77 77 77 77 77 77 77 77 77 77 : ..4Vwwwwwwwwwwww
2a8f : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
2a9f : __ __ __ BYT 00 12 34 56 75 55 55 55 55 55 55 55 55 55 55 55 : ..4VuUUUUUUUUUUU
2aaf : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2abf : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2acf : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2adf : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2aef : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2aff : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2b0f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2b1f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2b2f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2b3f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2b4f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2b5f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2b6f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2b7f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2b8f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2b9f : __ __ __ BYT 00 12 34 56 75 22 33 45 55 55 55 55 55 55 53 45 : ..4Vu"3EUUUUUUSE
2baf : __ __ __ BYT 55 55 55 55 55 55 35 55 55 55 55 54 25 55 55 51 : UUUUUU5UUUUT%UUQ
2bbf : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2bcf : __ __ __ BYT 99 55 88 89 99 99 55 88 88 99 99 54 58 88 99 95 : .U....U....TX...
2bdf : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2bef : __ __ __ BYT 99 55 88 89 99 99 55 88 88 99 99 55 88 88 99 99 : .U....U....U....
2bff : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2c0f : __ __ __ BYT 99 55 88 89 99 99 55 88 88 99 99 55 88 88 99 99 : .U....U....U....
2c1f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 85 55 55 55 88 85 59 : ..4Vu"3E..UUU..Y
2c2f : __ __ __ BYT 99 55 88 85 55 55 35 88 55 55 55 55 55 55 55 55 : .U..UU5.UUUUUUUU
2c3f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2c4f : __ __ __ BYT 99 55 88 85 51 22 35 88 88 99 95 45 88 85 59 99 : .U..Q"5....E..Y.
2c5f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2c6f : __ __ __ BYT 99 55 88 85 95 22 35 88 88 99 95 45 88 85 59 99 : .U..."5....E..Y.
2c7f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2c8f : __ __ __ BYT 99 55 88 85 95 22 35 88 88 99 95 45 88 85 59 99 : .U..."5....E..Y.
2c9f : __ __ __ BYT 00 12 34 56 75 22 33 45 55 55 59 99 55 88 85 59 : ..4Vu"3EUUY.U..Y
2caf : __ __ __ BYT 99 55 88 85 99 52 35 88 55 55 55 55 88 5a a5 99 : .U...R5.UUUU.Z..
2cbf : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 88 99 : ..4Vu"3E....U...
2ccf : __ __ __ BYT 99 55 88 85 99 52 35 88 88 99 99 55 88 53 45 99 : .U...R5....U.SE.
2cdf : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 88 99 : ..4Vu"3E....U...
2cef : __ __ __ BYT 99 55 88 85 99 95 35 88 88 99 99 55 88 53 45 99 : .U....5....U.SE.
2cff : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 88 99 : ..4Vu"3E....U...
2d0f : __ __ __ BYT 99 55 88 85 99 95 35 88 88 99 99 55 85 a3 4a 59 : .U....5....U..JY
2d1f : __ __ __ BYT 00 12 34 56 75 22 33 45 55 55 55 55 5a 55 55 55 : ..4Vu"3EUUUUZUUU
2d2f : __ __ __ BYT 55 a5 55 55 55 55 55 55 55 55 55 55 5a 33 44 a5 : U.UUUUUUUUUUZ3D.
2d3f : __ __ __ BYT 00 12 34 56 75 22 33 4a aa aa aa aa a1 aa aa aa : ..4Vu"3J........
2d4f : __ __ __ BYT aa 2a aa aa aa aa aa aa aa aa aa aa a2 33 44 1a : .*...........3D.
2d5f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2d6f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2d7f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2d8f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2d9f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2daf : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2dbf : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2dcf : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2ddf : __ __ __ BYT 00 12 34 56 75 22 33 4a aa aa aa aa a1 aa aa aa : ..4Vu"3J........
2def : __ __ __ BYT aa 2a aa aa aa aa aa aa aa aa aa aa a2 33 44 1a : .*...........3D.
2dff : __ __ __ BYT 00 12 34 56 75 22 33 45 55 55 55 55 5a 55 55 55 : ..4Vu"3EUUUUZUUU
2e0f : __ __ __ BYT 55 a5 55 55 55 55 55 55 55 55 55 55 5a 33 44 a5 : U.UUUUUUUUUUZ3D.
2e1f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 88 99 : ..4Vu"3E....U...
2e2f : __ __ __ BYT 99 55 88 85 99 95 35 88 88 99 99 55 85 a3 4a 59 : .U....5....U..JY
2e3f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 88 99 : ..4Vu"3E....U...
2e4f : __ __ __ BYT 99 55 88 85 99 95 35 88 88 99 99 55 88 53 45 99 : .U....5....U.SE.
2e5f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 88 99 : ..4Vu"3E....U...
2e6f : __ __ __ BYT 99 55 88 85 99 52 35 88 88 99 99 55 88 53 45 99 : .U...R5....U.SE.
2e7f : __ __ __ BYT 00 12 34 56 75 22 33 45 55 55 59 99 55 88 85 59 : ..4Vu"3EUUY.U..Y
2e8f : __ __ __ BYT 99 55 88 85 99 52 35 88 55 55 55 55 88 5a a5 99 : .U...R5.UUUU.Z..
2e9f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2eaf : __ __ __ BYT 99 55 88 85 95 22 35 88 88 99 95 45 88 85 59 99 : .U..."5....E..Y.
2ebf : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2ecf : __ __ __ BYT 99 55 88 85 95 22 35 88 88 99 95 45 88 85 59 99 : .U..."5....E..Y.
2edf : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2eef : __ __ __ BYT 99 55 88 85 51 22 35 88 88 99 95 45 88 85 59 99 : .U..Q"5....E..Y.
2eff : __ __ __ BYT 00 12 34 56 75 22 33 45 88 85 55 55 55 88 85 59 : ..4Vu"3E..UUU..Y
2f0f : __ __ __ BYT 99 55 88 85 55 55 35 88 55 55 55 55 55 55 55 55 : .U..UU5.UUUUUUUU
2f1f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2f2f : __ __ __ BYT 99 55 88 89 99 99 55 88 88 99 99 55 88 88 99 99 : .U....U....U....
2f3f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2f4f : __ __ __ BYT 99 55 88 89 99 99 55 88 88 99 99 55 88 88 99 99 : .U....U....U....
2f5f : __ __ __ BYT 00 12 34 56 75 22 33 45 88 88 99 99 55 88 85 59 : ..4Vu"3E....U..Y
2f6f : __ __ __ BYT 99 55 88 89 99 99 55 88 88 99 99 54 58 88 99 95 : .U....U....TX...
2f7f : __ __ __ BYT 00 12 34 56 75 22 33 45 55 55 55 55 55 55 53 45 : ..4Vu"3EUUUUUUSE
2f8f : __ __ __ BYT 55 55 55 55 55 55 35 55 55 55 55 54 25 55 55 51 : UUUUUU5UUUUT%UUQ
2f9f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2faf : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2fbf : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2fcf : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2fdf : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
2fef : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
2fff : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
300f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
301f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
302f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
303f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
304f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
305f : __ __ __ BYT 00 12 34 56 75 22 33 44 11 22 33 44 11 22 33 44 : ..4Vu"3D."3D."3D
306f : __ __ __ BYT 11 22 33 44 11 22 33 44 11 22 33 44 22 33 44 11 : ."3D."3D."3D"3D.
307f : __ __ __ BYT 00 12 34 56 75 55 55 55 55 55 55 55 55 55 55 55 : ..4VuUUUUUUUUUUU
308f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
309f : __ __ __ BYT 00 12 34 56 77 77 77 77 77 77 77 77 77 77 77 77 : ..4Vwwwwwwwwwwww
30af : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
30bf : __ __ __ BYT 00 12 34 56 66 66 66 66 66 66 66 66 66 66 66 66 : ..4Vffffffffffff
30cf : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
30df : __ __ __ BYT 00 12 34 55 55 55 55 55 55 55 55 55 55 55 55 55 : ..4UUUUUUUUUUUUU
30ef : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
30ff : __ __ __ BYT 00 12 34 44 44 44 44 44 44 44 44 44 44 44 44 44 : ..4DDDDDDDDDDDDD
310f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
311f : __ __ __ BYT 00 12 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : ..33333333333333
312f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
313f : __ __ __ BYT 00 12 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : ..""""""""""""""
314f : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
315f : __ __ __ BYT 00 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
316f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
317f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
318f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
319f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31af : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
31bf : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
31cf : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 00 : ................
31df : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
31ef : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 21 00 : """"""""""""""!.
31ff : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
320f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 21 00 : 33333333333333!.
321f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
322f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 43 21 00 : DDDDDDDDDDDDDC!.
323f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
324f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 43 21 00 : UUUUUUUUUUUUUC!.
325f : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
326f : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 65 43 21 00 : ffffffffffffeC!.
327f : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
328f : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 65 43 21 00 : wwwwwwwwwwwweC!.
329f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
32af : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 57 65 43 21 00 : UUUUUUUUUUUWeC!.
32bf : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
32cf : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
32df : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
32ef : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
32ff : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
330f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
331f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
332f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
333f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
334f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
335f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
336f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
337f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
338f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
339f : __ __ __ BYT 25 55 55 11 22 35 55 55 22 33 45 55 55 55 55 55 : %UU."5UU"3EUUUUU
33af : __ __ __ BYT 55 55 55 55 55 55 44 11 55 53 44 57 65 43 21 00 : UUUUUUD.USDWeC!.
33bf : __ __ __ BYT 25 88 85 11 22 35 88 85 22 33 45 88 88 89 99 55 : %..."5.."3E....U
33cf : __ __ __ BYT 88 88 89 99 55 88 54 15 99 53 44 57 65 43 21 00 : ....U.T..SDWeC!.
33df : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 45 88 88 89 99 55 : U..."5.."3E....U
33ef : __ __ __ BYT 88 88 89 99 5a 58 54 15 95 a3 44 57 65 43 21 00 : ....ZXT...DWeC!.
33ff : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 4a 55 55 55 55 a5 : U..."5.."3JUUUU.
340f : __ __ __ BYT 88 88 89 99 52 58 85 59 95 33 44 57 65 43 21 00 : ....RX.Y.3DWeC!.
341f : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 aa aa aa aa 15 : U..."5.."3D.....
342f : __ __ __ BYT 55 58 85 55 52 a5 88 89 5a 33 44 57 65 43 21 00 : UX.UR...Z3DWeC!.
343f : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 11 22 33 44 1a : U..."5.."3D."3D.
344f : __ __ __ BYT aa 58 85 aa a2 35 88 89 52 33 44 57 65 43 21 00 : .X...5..R3DWeC!.
345f : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 11 55 55 44 11 : U..."5.."3D.UUD.
346f : __ __ __ BYT 22 58 85 11 22 3a 58 85 a2 33 44 57 65 43 21 00 : "X..":X..3DWeC!.
347f : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 11 58 85 44 11 : U..."5.."3D.X.D.
348f : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
349f : __ __ __ BYT 55 88 85 55 55 55 88 85 55 55 54 11 58 85 44 11 : U..UUU..UUT.X.D.
34af : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
34bf : __ __ __ BYT 55 88 88 99 99 55 88 88 99 99 54 11 58 85 44 11 : U....U....T.X.D.
34cf : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
34df : __ __ __ BYT 55 88 88 99 99 55 88 88 99 99 54 11 58 85 44 11 : U....U....T.X.D.
34ef : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
34ff : __ __ __ BYT 55 88 88 99 99 55 88 88 99 99 54 11 58 85 44 11 : U....U....T.X.D.
350f : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
351f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 54 11 55 55 44 11 : UUUUUUUUUUT.UUD.
352f : __ __ __ BYT 22 55 55 11 22 33 55 55 22 33 44 57 65 43 21 00 : "UU."3UU"3DWeC!.
353f : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa a4 11 aa aa 44 11 : ..............D.
354f : __ __ __ BYT 22 aa aa 11 22 33 aa aa 22 33 44 57 65 43 21 00 : "..."3.."3DWeC!.
355f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
356f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
357f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
358f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
359f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
35af : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
35bf : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
35cf : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
35df : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa a4 11 aa aa 44 11 : ..............D.
35ef : __ __ __ BYT 22 aa aa 11 22 33 aa aa 22 33 44 57 65 43 21 00 : "..."3.."3DWeC!.
35ff : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 54 11 55 55 44 11 : UUUUUUUUUUT.UUD.
360f : __ __ __ BYT 22 55 55 11 22 33 55 55 22 33 44 57 65 43 21 00 : "UU."3UU"3DWeC!.
361f : __ __ __ BYT 55 88 88 99 99 55 88 88 99 99 54 11 58 85 44 11 : U....U....T.X.D.
362f : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
363f : __ __ __ BYT 55 88 88 99 99 55 88 88 99 99 54 11 58 85 44 11 : U....U....T.X.D.
364f : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
365f : __ __ __ BYT 55 88 88 99 99 55 88 88 99 99 54 11 58 85 44 11 : U....U....T.X.D.
366f : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
367f : __ __ __ BYT 55 88 85 55 55 55 88 85 55 55 54 11 58 85 44 11 : U..UUU..UUT.X.D.
368f : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
369f : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 11 58 85 44 11 : U..."5.."3D.X.D.
36af : __ __ __ BYT 22 58 85 11 22 33 58 85 22 33 44 57 65 43 21 00 : "X.."3X."3DWeC!.
36bf : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 11 55 55 44 11 : U..."5.."3D.UUD.
36cf : __ __ __ BYT 22 58 85 11 22 3a 58 85 a2 33 44 57 65 43 21 00 : "X..":X..3DWeC!.
36df : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 11 22 33 44 1a : U..."5.."3D."3D.
36ef : __ __ __ BYT aa 58 85 aa a2 35 88 89 52 33 44 57 65 43 21 00 : .X...5..R3DWeC!.
36ff : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 44 aa aa aa aa 15 : U..."5.."3D.....
370f : __ __ __ BYT 55 58 85 55 52 a5 88 89 5a 33 44 57 65 43 21 00 : UX.UR...Z3DWeC!.
371f : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 4a 55 55 55 55 a5 : U..."5.."3JUUUU.
372f : __ __ __ BYT 88 88 89 99 52 58 85 59 95 33 44 57 65 43 21 00 : ....RX.Y.3DWeC!.
373f : __ __ __ BYT 55 88 85 11 22 35 88 85 22 33 45 88 88 89 99 55 : U..."5.."3E....U
374f : __ __ __ BYT 88 88 89 99 5a 58 54 15 95 a3 44 57 65 43 21 00 : ....ZXT...DWeC!.
375f : __ __ __ BYT 25 88 85 11 22 35 88 85 22 33 45 88 88 89 99 55 : %..."5.."3E....U
376f : __ __ __ BYT 88 88 89 99 55 88 54 15 99 53 44 57 65 43 21 00 : ....U.T..SDWeC!.
377f : __ __ __ BYT 25 55 55 11 22 35 55 55 22 33 45 55 55 55 55 55 : %UU."5UU"3EUUUUU
378f : __ __ __ BYT 55 55 55 55 55 55 44 11 55 53 44 57 65 43 21 00 : UUUUUUD.USDWeC!.
379f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
37af : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
37bf : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
37cf : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
37df : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
37ef : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
37ff : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
380f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
381f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
382f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
383f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
384f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
385f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 11 22 33 44 11 : "3D."3D."3D."3D.
386f : __ __ __ BYT 22 33 44 11 22 33 44 11 22 33 44 57 65 43 21 00 : "3D."3D."3DWeC!.
387f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
388f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 57 65 43 21 00 : UUUUUUUUUUUWeC!.
389f : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
38af : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 65 43 21 00 : wwwwwwwwwwwweC!.
38bf : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
38cf : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 65 43 21 00 : ffffffffffffeC!.
38df : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
38ef : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 43 21 00 : UUUUUUUUUUUUUC!.
38ff : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
390f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 43 21 00 : DDDDDDDDDDDDDC!.
391f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
392f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 21 00 : 33333333333333!.
393f : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
394f : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 21 00 : """"""""""""""!.
395f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
396f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 00 : ................
397f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
398f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
rand:
.s0:
1874 : ad fd 21 LDA $21fd ; (seed + 1)
1877 : 4a __ __ LSR
1878 : ad fc 21 LDA $21fc ; (seed + 0)
187b : 6a __ __ ROR
187c : aa __ __ TAX
187d : a9 00 __ LDA #$00
187f : 6a __ __ ROR
1880 : 4d fc 21 EOR $21fc ; (seed + 0)
1883 : 85 3b __ STA ACCU + 0 
1885 : 8a __ __ TXA
1886 : 4d fd 21 EOR $21fd ; (seed + 1)
1889 : 85 3c __ STA ACCU + 1 
188b : 4a __ __ LSR
188c : 45 3b __ EOR ACCU + 0 
188e : 8d fc 21 STA $21fc ; (seed + 0)
1891 : 85 3b __ STA ACCU + 0 
1893 : 45 3c __ EOR ACCU + 1 
1895 : 8d fd 21 STA $21fd ; (seed + 1)
1898 : 85 3c __ STA ACCU + 1 
.s1001:
189a : 60 __ __ RTS
--------------------------------------------------------------------
seed:
21fc : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
399f : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
39af : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
39bf : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
39cf : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
39df : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
39ef : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
39ff : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
3a0f : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
3a1f : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
3a2f : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
3a3f : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
3a4f : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
3a5f : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
3a6f : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
3a7f : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
3a8f : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
3a9f : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
3aaf : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
3abf : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
3acf : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
3adf : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
3aef : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
3aff : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
3b0f : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
3b1f : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
3b2f : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
3b3f : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
3b4f : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
3b5f : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
3b6f : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
3b7f : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
3b8f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
3b9f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3baf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bbf : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
3bcf : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
3bdf : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
3bef : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
3bff : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
3c0f : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
3c1f : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
3c2f : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
3c3f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c4f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c5f : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
3c6f : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
3c7f : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
3c8f : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
3c9f : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
3caf : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
3cbf : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
3ccf : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
3cdf : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
3cef : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
3cff : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
3d0f : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
3d1f : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
3d2f : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
3d3f : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
3d4f : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
3d5f : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
3d6f : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
3d7f : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
3d8f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
189b : ad 25 9f LDA $9f25 
189e : 29 fe __ AND #$fe
18a0 : 8d 25 9f STA $9f25 
18a3 : a5 2d __ LDA P0 ; (spr + 0)
18a5 : 0a __ __ ASL
18a6 : 0a __ __ ASL
18a7 : 85 3b __ STA ACCU + 0 
18a9 : a9 3f __ LDA #$3f
18ab : 2a __ __ ROL
18ac : 06 3b __ ASL ACCU + 0 
18ae : 2a __ __ ROL
18af : 8d 21 9f STA $9f21 
18b2 : a5 3b __ LDA ACCU + 0 
18b4 : 8d 20 9f STA $9f20 
18b7 : a9 11 __ LDA #$11
18b9 : 8d 22 9f STA $9f22 
18bc : a5 30 __ LDA P3 ; (mode8 + 0)
18be : f0 02 __ BEQ $18c2 ; (vera_spr_set.s11 + 0)
.s9:
18c0 : a9 80 __ LDA #$80
.s11:
18c2 : 05 2f __ ORA P2 ; (addr32 + 1)
18c4 : a6 2e __ LDX P1 ; (addr32 + 0)
18c6 : 8e 23 9f STX $9f23 
18c9 : 8d 23 9f STA $9f23 
18cc : a9 00 __ LDA #$00
18ce : 8d 23 9f STA $9f23 
18d1 : 8d 23 9f STA $9f23 
18d4 : 8d 23 9f STA $9f23 
18d7 : 8d 23 9f STA $9f23 
18da : a5 33 __ LDA P6 ; (z + 0)
18dc : 0a __ __ ASL
18dd : 0a __ __ ASL
18de : 8d 23 9f STA $9f23 
18e1 : a5 32 __ LDA P5 ; (h + 0)
18e3 : 4a __ __ LSR
18e4 : 6a __ __ ROR
18e5 : 29 80 __ AND #$80
18e7 : 6a __ __ ROR
18e8 : 85 3b __ STA ACCU + 0 
18ea : a5 31 __ LDA P4 ; (w + 0)
18ec : 0a __ __ ASL
18ed : 0a __ __ ASL
18ee : 0a __ __ ASL
18ef : 0a __ __ ASL
18f0 : 05 3b __ ORA ACCU + 0 
18f2 : 05 34 __ ORA P7 ; (pal + 0)
18f4 : 8d 23 9f STA $9f23 
.s1001:
18f7 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
18f8 : ad 25 9f LDA $9f25 
18fb : 29 fe __ AND #$fe
18fd : 8d 25 9f STA $9f25 
1900 : a5 2d __ LDA P0 ; (spr + 0)
1902 : 0a __ __ ASL
1903 : 0a __ __ ASL
1904 : 85 3b __ STA ACCU + 0 
1906 : a9 3f __ LDA #$3f
1908 : 2a __ __ ROL
1909 : 06 3b __ ASL ACCU + 0 
190b : 2a __ __ ROL
190c : aa __ __ TAX
190d : a5 3b __ LDA ACCU + 0 
190f : 09 02 __ ORA #$02
1911 : 8d 20 9f STA $9f20 
1914 : 8e 21 9f STX $9f21 
1917 : a9 11 __ LDA #$11
1919 : 8d 22 9f STA $9f22 
191c : a5 2e __ LDA P1 ; (x + 0)
191e : 8d 23 9f STA $9f23 
1921 : a5 2f __ LDA P2 ; (x + 1)
1923 : 8d 23 9f STA $9f23 
1926 : a5 30 __ LDA P3 ; (y + 0)
1928 : 8d 23 9f STA $9f23 
192b : a5 31 __ LDA P4 ; (y + 1)
192d : 8d 23 9f STA $9f23 
.s1001:
1930 : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1931 : ad 25 9f LDA $9f25 
1934 : 29 fe __ AND #$fe
1936 : 8d 25 9f STA $9f25 
1939 : a5 2d __ LDA P0 ; (index + 0)
193b : 0a __ __ ASL
193c : 8d 20 9f STA $9f20 
193f : a9 7d __ LDA #$7d
1941 : 2a __ __ ROL
1942 : 8d 21 9f STA $9f21 
1945 : a9 11 __ LDA #$11
1947 : 8d 22 9f STA $9f22 
194a : a5 30 __ LDA P3 ; (size + 0)
194c : 05 31 __ ORA P4 ; (size + 1)
194e : f0 29 __ BEQ $1979 ; (vera_pal_putn.s1001 + 0)
.s6:
1950 : a6 30 __ LDX P3 ; (size + 0)
1952 : f0 02 __ BEQ $1956 ; (vera_pal_putn.l3 + 0)
.s1003:
1954 : e6 31 __ INC P4 ; (size + 1)
.l3:
1956 : a0 01 __ LDY #$01
1958 : b1 2e __ LDA (P1),y ; (color + 0)
195a : 85 3c __ STA ACCU + 1 
195c : 88 __ __ DEY
195d : b1 2e __ LDA (P1),y ; (color + 0)
195f : 8d 23 9f STA $9f23 
1962 : a5 3c __ LDA ACCU + 1 
1964 : 8d 23 9f STA $9f23 
1967 : 18 __ __ CLC
1968 : a5 2e __ LDA P1 ; (color + 0)
196a : 69 02 __ ADC #$02
196c : 85 2e __ STA P1 ; (color + 0)
196e : 90 02 __ BCC $1972 ; (vera_pal_putn.s1007 + 0)
.s1006:
1970 : e6 2f __ INC P2 ; (color + 1)
.s1007:
1972 : ca __ __ DEX
1973 : d0 e1 __ BNE $1956 ; (vera_pal_putn.l3 + 0)
.s1002:
1975 : c6 31 __ DEC P4 ; (size + 1)
1977 : d0 dd __ BNE $1956 ; (vera_pal_putn.l3 + 0)
.s1001:
1979 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
3d9f : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
3daf : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
3dbf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3dcf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ddf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3def : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3dff : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3e0f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
3e1f : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3e2f : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
3e3f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3e4f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
3e5f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3e6f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
3e7f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3e8f : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
3e9f : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
3eaf : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
3ebf : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3ecf : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3edf : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3eef : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3eff : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3f0f : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3f1f : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3f2f : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3f3f : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
3f4f : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
3f5f : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
3f6f : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
3f7f : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
3f8f : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
3f9f : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
3faf : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
4000 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
4010 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
4020 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
4030 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
4040 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
4050 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
4060 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
4070 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
4080 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
4090 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
40a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
40b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
40c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
40d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
40e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
40f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
4100 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
4110 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4120 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
4130 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
4140 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
4150 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
4160 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
4170 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
4180 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
4190 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
41a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
41b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
41c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
41d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
41e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
41f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
4200 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
4210 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
4220 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
4230 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
4240 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
4250 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
4260 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
4270 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
4280 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
4290 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
42a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
42b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
42c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
42d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
42e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
42f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
4300 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
4310 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
4320 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
4330 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
4340 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
4350 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
4360 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
4370 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
4380 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
4390 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
43a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
43b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
43c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
43d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
43e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
43f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
4400 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
4410 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
4420 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
4430 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
4440 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
4450 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
4460 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
4470 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
4480 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
4490 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
44a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
44b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
44c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
44d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
44e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
44f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_flip:
.s0:
197a : ad 25 9f LDA $9f25 
197d : 29 fe __ AND #$fe
197f : 8d 25 9f STA $9f25 
1982 : a5 2d __ LDA P0 ; (spr + 0)
1984 : 0a __ __ ASL
1985 : 0a __ __ ASL
1986 : 85 3b __ STA ACCU + 0 
1988 : a9 3f __ LDA #$3f
198a : 2a __ __ ROL
198b : 06 3b __ ASL ACCU + 0 
198d : 2a __ __ ROL
198e : aa __ __ TAX
198f : a5 3b __ LDA ACCU + 0 
1991 : 09 06 __ ORA #$06
1993 : 8d 20 9f STA $9f20 
1996 : 8e 21 9f STX $9f21 
1999 : a9 01 __ LDA #$01
199b : 8d 22 9f STA $9f22 
199e : ad 23 9f LDA $9f23 
19a1 : 29 fc __ AND #$fc
19a3 : a8 __ __ TAY
19a4 : a5 2e __ LDA P1 ; (fliph + 0)
19a6 : f0 01 __ BEQ $19a9 ; (vera_spr_flip.s14 + 0)
.s6:
19a8 : c8 __ __ INY
.s14:
19a9 : a5 2f __ LDA P2 ; (flipv + 0)
19ab : f0 05 __ BEQ $19b2 ; (vera_spr_flip.s11 + 0)
.s9:
19ad : 98 __ __ TYA
19ae : 09 02 __ ORA #$02
19b0 : d0 01 __ BNE $19b3 ; (vera_spr_flip.s1002 + 0)
.s11:
19b2 : 98 __ __ TYA
.s1002:
19b3 : 8d 23 9f STA $9f23 
.s1001:
19b6 : 60 __ __ RTS
--------------------------------------------------------------------
TowerBase:
4500 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4510 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4520 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4530 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4540 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4550 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4560 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4570 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4580 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4590 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
45a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
45b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
45c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
45d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
45e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
45f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4600 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4610 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4620 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4630 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4640 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4650 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4660 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4670 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4680 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4690 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
46a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
46b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
46c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
46d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
46e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
46f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4700 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4710 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4720 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4730 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4740 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4750 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4760 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4770 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4780 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4790 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
47a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
47b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
47c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
47d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
47e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
47f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
4800 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4810 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4820 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4830 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4840 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4850 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4860 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4870 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4880 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4890 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
48a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
48b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
48c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
48d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
48e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
48f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
4900 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
4910 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
4920 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
4930 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
4940 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
4950 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
4960 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
4970 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
4980 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
4990 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
49a0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
49b0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
49c0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
49d0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
49e0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
49f0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
4a00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
4a10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
4a20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
4a30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
4a40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
4a50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
4a60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
4a70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
4a80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
4a90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
4aa0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
4ab0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
4ac0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
4ad0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
4ae0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
4af0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
4b00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
4b10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
4b20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
4b30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
4b40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
4b50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
4b60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
4b70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
4b80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
4b90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
4ba0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
4bb0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
4bc0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
4bd0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
4be0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
4bf0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
4c00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
4c10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
4c20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
4c30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
4c40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
4c50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
4c60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
4c70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
4c80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
4c90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
4ca0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
4cb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
4cc0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
4cd0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
4ce0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
4cf0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
--------------------------------------------------------------------
WavyHead:
4d00 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
4d10 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4d20 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4d30 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4d40 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4d50 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4d60 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
4d70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4d80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4d90 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4da0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4db0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4dc0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4dd0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4de0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4df0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4e00 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
4e10 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
4e20 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
4e30 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
4e40 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
4e50 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
4e60 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
4e70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4e80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
4e90 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
4ea0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4eb0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4ec0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
4ed0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4ee0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
4ef0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
4f00 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
4f10 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
4f20 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
4f30 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
4f40 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
4f50 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
4f60 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
4f70 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
BGPal:
3fbf : __ __ __ BYT 24 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : $.......&.....f.
3fcf : __ __ __ BYT 9f 0b ef 0e 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 : ......m.M.).+.-.
--------------------------------------------------------------------
ButtonStageMax:
3fdf : __ __ __ BYT f4 04 e4 04 d4 04 c4 04 b3 03 a3 03 93 03 83 03 : ................
3fef : __ __ __ BYT 72 02 62 02 52 02 41 01 31 01 21 01 10 00 00 00 : r.b.R.A.1.!.....
--------------------------------------------------------------------
CharBoxPalette:
4f80 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 00 00 00 00 : ..m.M.).+.-.....
4f90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavyPal:
4fa0 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
4fac : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
4fbc : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
4fcc : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
4fdc : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
4fec : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
CoderPal:
5000 : __ __ __ BYT 00 00 00 00 ff 0f dd 0d b2 02 d4 04 e5 05 fb 00 : ................
5010 : __ __ __ BYT bf 00 10 0c 22 0f 1b 01 00 00 00 00             : ....".......
--------------------------------------------------------------------
LogoPal:
501c : __ __ __ BYT 00 00 9d 00 6c 00 4d 00 2d 00 00 00 ff 00 bb 00 : ....l.M.-.......
502c : __ __ __ BYT dd 0d ff 0f 09 00                               : ......
--------------------------------------------------------------------
EyeTri:
5032 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5042 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
5052 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5062 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
5072 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5082 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
5092 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
50a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
50b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
50c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
50d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
50e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
50f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5102 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
5112 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5122 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
5132 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5142 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
5152 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5162 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
5172 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5182 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
5192 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
51a2 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
51b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
51c2 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
51d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
51e2 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
51f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5202 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
5212 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5222 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
5232 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
5242 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
5252 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
5262 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
5272 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
5282 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
5292 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
52a2 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
52b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
52c2 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
52d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
52e2 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
52f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
5302 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
5312 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
5322 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
5332 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
5342 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
5352 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
5362 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
5372 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
5382 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
5392 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
53a2 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
53b2 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
53c2 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
53d2 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
53e2 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
53f2 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
5402 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
5412 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
5422 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
19b7 : a5 30 __ LDA P3 ; (name + 0)
19b9 : 85 2d __ STA P0 
19bb : a5 31 __ LDA P4 ; (name + 1)
19bd : 85 2e __ STA P1 
19bf : 20 34 1a JSR $1a34 ; (krnio_setnam.s0 + 0)
19c2 : a5 32 __ LDA P5 ; (fnum + 0)
19c4 : 85 2d __ STA P0 
19c6 : a5 33 __ LDA P6 ; (device + 0)
19c8 : 85 2e __ STA P1 
19ca : a5 34 __ LDA P7 ; (channel + 0)
19cc : 85 2f __ STA P2 
19ce : 20 4a 1a JSR $1a4a ; (krnio_open.s0 + 0)
19d1 : a5 32 __ LDA P5 ; (fnum + 0)
19d3 : 20 72 1a JSR $1a72 ; (krnio_chkin.s1000 + 0)
19d6 : 20 84 1a JSR $1a84 ; (krnio_chrin.s0 + 0)
19d9 : 20 84 1a JSR $1a84 ; (krnio_chrin.s0 + 0)
19dc : ad fb 9e LDA $9efb ; (sstack + 1)
19df : 85 48 __ STA T0 + 1 
19e1 : ad fa 9e LDA $9efa ; (sstack + 0)
19e4 : 85 47 __ STA T0 + 0 
19e6 : 05 48 __ ORA T0 + 1 
19e8 : f0 42 __ BEQ $1a2c ; (LoadSprite.s4 + 0)
.s8:
19ea : a9 00 __ LDA #$00
19ec : 85 49 __ STA T2 + 0 
19ee : 85 4a __ STA T2 + 1 
.l2:
19f0 : 20 84 1a JSR $1a84 ; (krnio_chrin.s0 + 0)
19f3 : ad 25 9f LDA $9f25 
19f6 : 29 fe __ AND #$fe
19f8 : 8d 25 9f STA $9f25 
19fb : 18 __ __ CLC
19fc : a5 49 __ LDA T2 + 0 
19fe : 65 35 __ ADC P8 ; (Addr + 0)
1a00 : 8d 20 9f STA $9f20 
1a03 : a5 4a __ LDA T2 + 1 
1a05 : 65 36 __ ADC P9 ; (Addr + 1)
1a07 : 8d 21 9f STA $9f21 
1a0a : a9 00 __ LDA #$00
1a0c : 65 37 __ ADC P10 ; (Addr + 2)
1a0e : 29 01 __ AND #$01
1a10 : 09 10 __ ORA #$10
1a12 : 8d 22 9f STA $9f22 
1a15 : a5 3b __ LDA ACCU + 0 
1a17 : 8d 23 9f STA $9f23 
1a1a : e6 49 __ INC T2 + 0 
1a1c : d0 02 __ BNE $1a20 ; (LoadSprite.s1005 + 0)
.s1004:
1a1e : e6 4a __ INC T2 + 1 
.s1005:
1a20 : a5 4a __ LDA T2 + 1 
1a22 : c5 48 __ CMP T0 + 1 
1a24 : d0 04 __ BNE $1a2a ; (LoadSprite.s1003 + 0)
.s1002:
1a26 : a5 49 __ LDA T2 + 0 
1a28 : c5 47 __ CMP T0 + 0 
.s1003:
1a2a : 90 c4 __ BCC $19f0 ; (LoadSprite.l2 + 0)
.s4:
1a2c : 20 8e 1a JSR $1a8e ; (krnio_clrchn.s0 + 0)
1a2f : a5 32 __ LDA P5 ; (fnum + 0)
1a31 : 4c 92 1a JMP $1a92 ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
1a34 : a5 2d __ LDA P0 
1a36 : 05 2e __ ORA P1 
1a38 : f0 08 __ BEQ $1a42 ; (krnio_setnam.s0 + 14)
1a3a : a0 ff __ LDY #$ff
1a3c : c8 __ __ INY
1a3d : b1 2d __ LDA (P0),y 
1a3f : d0 fb __ BNE $1a3c ; (krnio_setnam.s0 + 8)
1a41 : 98 __ __ TYA
1a42 : a6 2d __ LDX P0 
1a44 : a4 2e __ LDY P1 
1a46 : 20 bd ff JSR $ffbd 
.s1001:
1a49 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1a4a : a9 00 __ LDA #$00
1a4c : a6 2d __ LDX P0 ; (fnum + 0)
1a4e : 9d 83 63 STA $6383,x ; (krnio_pstatus + 0)
1a51 : a9 00 __ LDA #$00
1a53 : 85 3b __ STA ACCU + 0 
1a55 : 85 3c __ STA ACCU + 1 
1a57 : a5 2d __ LDA P0 ; (fnum + 0)
1a59 : a6 2e __ LDX P1 
1a5b : a4 2f __ LDY P2 
1a5d : 20 ba ff JSR $ffba 
1a60 : 20 c0 ff JSR $ffc0 
1a63 : 90 08 __ BCC $1a6d ; (krnio_open.s0 + 35)
1a65 : a5 2d __ LDA P0 ; (fnum + 0)
1a67 : 20 c3 ff JSR $ffc3 
1a6a : 4c 71 1a JMP $1a71 ; (krnio_open.s1001 + 0)
1a6d : a9 01 __ LDA #$01
1a6f : 85 3b __ STA ACCU + 0 
.s1001:
1a71 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
6383 : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a72 : 85 2d __ STA P0 
.s0:
1a74 : a6 2d __ LDX P0 
1a76 : 20 c6 ff JSR $ffc6 
1a79 : a9 00 __ LDA #$00
1a7b : 85 3c __ STA ACCU + 1 
1a7d : b0 02 __ BCS $1a81 ; (krnio_chkin.s0 + 13)
1a7f : a9 01 __ LDA #$01
1a81 : 85 3b __ STA ACCU + 0 
.s1001:
1a83 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a84 : 20 cf ff JSR $ffcf 
1a87 : 85 3b __ STA ACCU + 0 
1a89 : a9 00 __ LDA #$00
1a8b : 85 3c __ STA ACCU + 1 
.s1001:
1a8d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1a8e : 20 cc ff JSR $ffcc 
.s1001:
1a91 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1a92 : 85 2d __ STA P0 
.s0:
1a94 : a5 2d __ LDA P0 
1a96 : 20 c3 ff JSR $ffc3 
.s1001:
1a99 : 60 __ __ RTS
--------------------------------------------------------------------
1a9a : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1aaa : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
1ab9 : a9 10 __ LDA #$10
1abb : 85 30 __ STA P3 
1abd : a9 00 __ LDA #$00
1abf : 85 31 __ STA P4 
1ac1 : a5 32 __ LDA P5 ; (Palette + 0)
1ac3 : 85 2e __ STA P1 
1ac5 : 85 47 __ STA T0 + 0 
1ac7 : a5 33 __ LDA P6 ; (Palette + 1)
1ac9 : 85 2f __ STA P2 
1acb : 85 48 __ STA T0 + 1 
1acd : a5 34 __ LDA P7 ; (index + 0)
1acf : 85 2d __ STA P0 
1ad1 : ad fa 9e LDA $9efa ; (sstack + 0)
1ad4 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1ad6 : 0a __ __ ASL
1ad7 : 85 49 __ STA T3 + 0 
1ad9 : ad fb 9e LDA $9efb ; (sstack + 1)
1adc : 2a __ __ ROL
1add : 18 __ __ CLC
1ade : 65 33 __ ADC P6 ; (Palette + 1)
1ae0 : 85 4a __ STA T3 + 1 
1ae2 : a4 32 __ LDY P5 ; (Palette + 0)
1ae4 : b1 49 __ LDA (T3 + 0),y 
1ae6 : aa __ __ TAX
1ae7 : c8 __ __ INY
1ae8 : b1 49 __ LDA (T3 + 0),y 
1aea : 86 49 __ STX T3 + 0 
1aec : 85 4a __ STA T3 + 1 
1aee : a9 00 __ LDA #$00
1af0 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1af2 : ad fc 9e LDA $9efc ; (sstack + 2)
1af5 : 85 4b __ STA T5 + 0 
1af7 : 38 __ __ SEC
1af8 : e9 01 __ SBC #$01
1afa : 85 4d __ STA T6 + 0 
1afc : ad fd 9e LDA $9efd ; (sstack + 3)
1aff : 85 4c __ STA T5 + 1 
1b01 : e9 00 __ SBC #$00
1b03 : 85 4e __ STA T6 + 1 
1b05 : d0 06 __ BNE $1b0d ; (SetPaletteIndex.s5 + 0)
.s1004:
1b07 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b09 : c5 4d __ CMP T6 + 0 
1b0b : b0 38 __ BCS $1b45 ; (SetPaletteIndex.s4 + 0)
.s5:
1b0d : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
1b0f : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
1b11 : 18 __ __ CLC
1b12 : a5 32 __ LDA P5 ; (Palette + 0)
1b14 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
1b16 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b18 : a5 33 __ LDA P6 ; (Palette + 1)
1b1a : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
1b1c : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
1b1e : ae fa 9e LDX $9efa ; (sstack + 0)
.l2:
1b21 : a0 02 __ LDY #$02
1b23 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b25 : a0 00 __ LDY #$00
1b27 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b29 : a0 03 __ LDY #$03
1b2b : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
1b2d : a0 01 __ LDY #$01
1b2f : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
1b31 : 18 __ __ CLC
1b32 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
1b34 : 69 02 __ ADC #$02
1b36 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
1b38 : 90 02 __ BCC $1b3c ; (SetPaletteIndex.s1008 + 0)
.s1007:
1b3a : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
1b3c : e8 __ __ INX
1b3d : a5 4e __ LDA T6 + 1 
1b3f : d0 e0 __ BNE $1b21 ; (SetPaletteIndex.l2 + 0)
.s1002:
1b41 : e4 4d __ CPX T6 + 0 
1b43 : 90 dc __ BCC $1b21 ; (SetPaletteIndex.l2 + 0)
.s4:
1b45 : a5 4b __ LDA T5 + 0 
1b47 : 0a __ __ ASL
1b48 : aa __ __ TAX
1b49 : a5 4c __ LDA T5 + 1 
1b4b : 2a __ __ ROL
1b4c : a8 __ __ TAY
1b4d : 8a __ __ TXA
1b4e : 38 __ __ SEC
1b4f : e9 02 __ SBC #$02
1b51 : b0 01 __ BCS $1b54 ; (SetPaletteIndex.s1010 + 0)
.s1009:
1b53 : 88 __ __ DEY
.s1010:
1b54 : 18 __ __ CLC
1b55 : 65 47 __ ADC T0 + 0 
1b57 : 85 47 __ STA T0 + 0 
1b59 : 98 __ __ TYA
1b5a : 65 48 __ ADC T0 + 1 
1b5c : 85 48 __ STA T0 + 1 
1b5e : a5 49 __ LDA T3 + 0 
1b60 : a0 00 __ LDY #$00
1b62 : 91 47 __ STA (T0 + 0),y 
1b64 : a5 4a __ LDA T3 + 1 
1b66 : c8 __ __ INY
1b67 : 91 47 __ STA (T0 + 0),y 
1b69 : 4c 31 19 JMP $1931 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
TowerPalF1:
5432 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
5442 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
getchx:
.s0:
1b6c : 20 76 1b JSR $1b76 ; (getpch + 0)
1b6f : 85 3b __ STA ACCU + 0 
1b71 : a9 00 __ LDA #$00
1b73 : 85 3c __ STA ACCU + 1 
.s1001:
1b75 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1b76 : 20 e4 ff JSR $ffe4 
1b79 : ae fe 21 LDX $21fe ; (giocharmap + 0)
1b7c : e0 01 __ CPX #$01
1b7e : 90 26 __ BCC $1ba6 ; (getpch + 48)
1b80 : c9 0d __ CMP #$0d
1b82 : d0 02 __ BNE $1b86 ; (getpch + 16)
1b84 : a9 0a __ LDA #$0a
1b86 : e0 02 __ CPX #$02
1b88 : 90 1c __ BCC $1ba6 ; (getpch + 48)
1b8a : c9 db __ CMP #$db
1b8c : b0 18 __ BCS $1ba6 ; (getpch + 48)
1b8e : c9 41 __ CMP #$41
1b90 : 90 14 __ BCC $1ba6 ; (getpch + 48)
1b92 : c9 c1 __ CMP #$c1
1b94 : 90 02 __ BCC $1b98 ; (getpch + 34)
1b96 : 49 a0 __ EOR #$a0
1b98 : c9 7b __ CMP #$7b
1b9a : b0 0a __ BCS $1ba6 ; (getpch + 48)
1b9c : c9 61 __ CMP #$61
1b9e : b0 04 __ BCS $1ba4 ; (getpch + 46)
1ba0 : c9 5b __ CMP #$5b
1ba2 : b0 02 __ BCS $1ba6 ; (getpch + 48)
1ba4 : 49 20 __ EOR #$20
1ba6 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
21fe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
4ff6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
4ff8 : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
4ffa : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
4ffc : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1ba7 : a9 33 __ LDA #$33
1ba9 : 85 2d __ STA P0 
1bab : a9 38 __ LDA #$38
1bad : 85 2e __ STA P1 
1baf : a9 01 __ LDA #$01
1bb1 : 85 2f __ STA P2 
1bb3 : a6 32 __ LDX P5 ; (p + 0)
1bb5 : bd 00 55 LDA $5500,x ; (sintab + 0)
1bb8 : 4a __ __ LSR
1bb9 : 4a __ __ LSR
1bba : 4a __ __ LSR
1bbb : 49 10 __ EOR #$10
1bbd : 38 __ __ SEC
1bbe : e9 10 __ SBC #$10
1bc0 : 18 __ __ CLC
1bc1 : 69 b4 __ ADC #$b4
1bc3 : 85 30 __ STA P3 
1bc5 : a9 00 __ LDA #$00
1bc7 : 85 31 __ STA P4 
1bc9 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1bcc : a9 34 __ LDA #$34
1bce : 85 2d __ STA P0 
1bd0 : a9 20 __ LDA #$20
1bd2 : 85 2e __ STA P1 
1bd4 : a6 34 __ LDX P7 ; (p2 + 0)
1bd6 : bd 00 55 LDA $5500,x ; (sintab + 0)
1bd9 : 4a __ __ LSR
1bda : 4a __ __ LSR
1bdb : 4a __ __ LSR
1bdc : 49 10 __ EOR #$10
1bde : 38 __ __ SEC
1bdf : e9 10 __ SBC #$10
1be1 : 18 __ __ CLC
1be2 : 69 b4 __ ADC #$b4
1be4 : 85 30 __ STA P3 
1be6 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1be9 : a9 35 __ LDA #$35
1beb : 85 2d __ STA P0 
1bed : a9 00 __ LDA #$00
1bef : 85 2e __ STA P1 
1bf1 : a6 36 __ LDX P9 ; (p3 + 0)
1bf3 : bd 00 55 LDA $5500,x ; (sintab + 0)
1bf6 : 4a __ __ LSR
1bf7 : 4a __ __ LSR
1bf8 : 4a __ __ LSR
1bf9 : 49 10 __ EOR #$10
1bfb : 38 __ __ SEC
1bfc : e9 10 __ SBC #$10
1bfe : 18 __ __ CLC
1bff : 69 a4 __ ADC #$a4
1c01 : 85 30 __ STA P3 
1c03 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1c06 : a9 36 __ LDA #$36
1c08 : 85 2d __ STA P0 
1c0a : a9 40 __ LDA #$40
1c0c : 85 2e __ STA P1 
1c0e : a6 36 __ LDX P9 ; (p3 + 0)
1c10 : bd 00 55 LDA $5500,x ; (sintab + 0)
1c13 : 4a __ __ LSR
1c14 : 4a __ __ LSR
1c15 : 4a __ __ LSR
1c16 : 49 10 __ EOR #$10
1c18 : 38 __ __ SEC
1c19 : e9 10 __ SBC #$10
1c1b : 18 __ __ CLC
1c1c : 69 a4 __ ADC #$a4
1c1e : 85 30 __ STA P3 
1c20 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1c23 : a9 37 __ LDA #$37
1c25 : 85 2d __ STA P0 
1c27 : a9 00 __ LDA #$00
1c29 : 85 2e __ STA P1 
1c2b : a6 36 __ LDX P9 ; (p3 + 0)
1c2d : bd 00 55 LDA $5500,x ; (sintab + 0)
1c30 : 4a __ __ LSR
1c31 : 4a __ __ LSR
1c32 : 4a __ __ LSR
1c33 : 49 10 __ EOR #$10
1c35 : 38 __ __ SEC
1c36 : e9 10 __ SBC #$10
1c38 : 18 __ __ CLC
1c39 : 69 c4 __ ADC #$c4
1c3b : 85 30 __ STA P3 
1c3d : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1c40 : a9 38 __ LDA #$38
1c42 : 85 2d __ STA P0 
1c44 : a9 40 __ LDA #$40
1c46 : 85 2e __ STA P1 
1c48 : a6 36 __ LDX P9 ; (p3 + 0)
1c4a : bd 00 55 LDA $5500,x ; (sintab + 0)
1c4d : 4a __ __ LSR
1c4e : 4a __ __ LSR
1c4f : 4a __ __ LSR
1c50 : 49 10 __ EOR #$10
1c52 : 38 __ __ SEC
1c53 : e9 10 __ SBC #$10
1c55 : 18 __ __ CLC
1c56 : 69 c4 __ ADC #$c4
1c58 : 85 30 __ STA P3 
1c5a : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1c5d : a9 00 __ LDA #$00
1c5f : 85 2d __ STA P0 
1c61 : 85 2f __ STA P2 
1c63 : a9 68 __ LDA #$68
1c65 : 85 2e __ STA P1 
1c67 : a6 36 __ LDX P9 ; (p3 + 0)
1c69 : bd 00 55 LDA $5500,x ; (sintab + 0)
1c6c : 4a __ __ LSR
1c6d : 4a __ __ LSR
1c6e : 4a __ __ LSR
1c6f : 4a __ __ LSR
1c70 : 49 08 __ EOR #$08
1c72 : 38 __ __ SEC
1c73 : e9 08 __ SBC #$08
1c75 : 85 48 __ STA T2 + 0 
1c77 : a9 00 __ LDA #$00
1c79 : e9 00 __ SBC #$00
1c7b : 85 49 __ STA T2 + 1 
1c7d : 38 __ __ SEC
1c7e : a9 b6 __ LDA #$b6
1c80 : e5 48 __ SBC T2 + 0 
1c82 : 85 30 __ STA P3 
1c84 : a9 01 __ LDA #$01
1c86 : e5 49 __ SBC T2 + 1 
1c88 : 85 31 __ STA P4 
1c8a : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1c8d : a9 01 __ LDA #$01
1c8f : 85 2d __ STA P0 
1c91 : 85 2f __ STA P2 
1c93 : a9 f0 __ LDA #$f0
1c95 : 85 2e __ STA P1 
1c97 : a6 36 __ LDX P9 ; (p3 + 0)
1c99 : bd 00 55 LDA $5500,x ; (sintab + 0)
1c9c : 4a __ __ LSR
1c9d : 4a __ __ LSR
1c9e : 4a __ __ LSR
1c9f : 4a __ __ LSR
1ca0 : 49 08 __ EOR #$08
1ca2 : 38 __ __ SEC
1ca3 : e9 08 __ SBC #$08
1ca5 : a8 __ __ TAY
1ca6 : a9 00 __ LDA #$00
1ca8 : e9 00 __ SBC #$00
1caa : aa __ __ TAX
1cab : 98 __ __ TYA
1cac : 18 __ __ CLC
1cad : 69 b6 __ ADC #$b6
1caf : 85 30 __ STA P3 
1cb1 : 8a __ __ TXA
1cb2 : 69 01 __ ADC #$01
1cb4 : 85 31 __ STA P4 
1cb6 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1cb9 : a9 00 __ LDA #$00
1cbb : 85 47 __ STA T1 + 0 
1cbd : 18 __ __ CLC
.l2:
1cbe : a5 47 __ LDA T1 + 0 
1cc0 : 69 4f __ ADC #$4f
1cc2 : 85 2d __ STA P0 
1cc4 : a5 47 __ LDA T1 + 0 
1cc6 : 0a __ __ ASL
1cc7 : 65 47 __ ADC T1 + 0 
1cc9 : 0a __ __ ASL
1cca : 0a __ __ ASL
1ccb : 18 __ __ CLC
1ccc : 6d fe 4f ADC $4ffe ; (FrameCount + 0)
1ccf : aa __ __ TAX
1cd0 : ac ff 4f LDY $4fff ; (FrameCount + 1)
1cd3 : bd 00 55 LDA $5500,x ; (sintab + 0)
1cd6 : 10 01 __ BPL $1cd9 ; (MoveSprites.s1008 + 0)
.s1007:
1cd8 : 88 __ __ DEY
.s1008:
1cd9 : 18 __ __ CLC
1cda : 6d fe 4f ADC $4ffe ; (FrameCount + 0)
1cdd : 85 48 __ STA T2 + 0 
1cdf : 90 01 __ BCC $1ce2 ; (MoveSprites.s1009 + 0)
.s1006:
1ce1 : c8 __ __ INY
.s1009:
1ce2 : 84 49 __ STY T2 + 1 
1ce4 : a5 47 __ LDA T1 + 0 
1ce6 : 0a __ __ ASL
1ce7 : 0a __ __ ASL
1ce8 : 85 3b __ STA ACCU + 0 
1cea : a9 00 __ LDA #$00
1cec : 85 3c __ STA ACCU + 1 
1cee : a9 80 __ LDA #$80
1cf0 : 85 23 __ STA WORK + 0 
1cf2 : a9 02 __ LDA #$02
1cf4 : 85 24 __ STA WORK + 1 
1cf6 : 20 b1 25 JSR $25b1 ; (divmod + 0)
1cf9 : 18 __ __ CLC
1cfa : a5 25 __ LDA WORK + 2 
1cfc : 65 48 __ ADC T2 + 0 
1cfe : 85 2e __ STA P1 
1d00 : a5 26 __ LDA WORK + 3 
1d02 : 65 49 __ ADC T2 + 1 
1d04 : 85 2f __ STA P2 
1d06 : a5 47 __ LDA T1 + 0 
1d08 : 0a __ __ ASL
1d09 : 0a __ __ ASL
1d0a : 65 47 __ ADC T1 + 0 
1d0c : 85 48 __ STA T2 + 0 
1d0e : ad fe 4f LDA $4ffe ; (FrameCount + 0)
1d11 : 38 __ __ SEC
1d12 : e9 40 __ SBC #$40
1d14 : 18 __ __ CLC
1d15 : 65 48 __ ADC T2 + 0 
1d17 : aa __ __ TAX
1d18 : bd 00 55 LDA $5500,x ; (sintab + 0)
1d1b : 4a __ __ LSR
1d1c : 49 40 __ EOR #$40
1d1e : 38 __ __ SEC
1d1f : e9 40 __ SBC #$40
1d21 : a8 __ __ TAY
1d22 : a9 00 __ LDA #$00
1d24 : e9 00 __ SBC #$00
1d26 : 85 49 __ STA T2 + 1 
1d28 : a5 47 __ LDA T1 + 0 
1d2a : 0a __ __ ASL
1d2b : 0a __ __ ASL
1d2c : 0a __ __ ASL
1d2d : 85 3b __ STA ACCU + 0 
1d2f : ad fe 4f LDA $4ffe ; (FrameCount + 0)
1d32 : 38 __ __ SEC
1d33 : e9 20 __ SBC #$20
1d35 : 18 __ __ CLC
1d36 : 65 3b __ ADC ACCU + 0 
1d38 : aa __ __ TAX
1d39 : bd 00 55 LDA $5500,x ; (sintab + 0)
1d3c : 4a __ __ LSR
1d3d : 4a __ __ LSR
1d3e : 4a __ __ LSR
1d3f : 4a __ __ LSR
1d40 : 49 08 __ EOR #$08
1d42 : 38 __ __ SEC
1d43 : e9 08 __ SBC #$08
1d45 : 85 4a __ STA T3 + 0 
1d47 : a9 00 __ LDA #$00
1d49 : e9 00 __ SBC #$00
1d4b : 85 4b __ STA T3 + 1 
1d4d : a5 47 __ LDA T1 + 0 
1d4f : 0a __ __ ASL
1d50 : 65 47 __ ADC T1 + 0 
1d52 : 85 3b __ STA ACCU + 0 
1d54 : a5 47 __ LDA T1 + 0 
1d56 : c9 17 __ CMP #$17
1d58 : f0 2d __ BEQ $1d87 ; (MoveSprites.s5 + 0)
.s6:
1d5a : 98 __ __ TYA
1d5b : 18 __ __ CLC
1d5c : 69 c4 __ ADC #$c4
1d5e : a8 __ __ TAY
1d5f : a5 49 __ LDA T2 + 1 
1d61 : 69 00 __ ADC #$00
1d63 : aa __ __ TAX
1d64 : 98 __ __ TYA
1d65 : 18 __ __ CLC
1d66 : 65 4a __ ADC T3 + 0 
1d68 : a8 __ __ TAY
1d69 : 8a __ __ TXA
1d6a : 65 4b __ ADC T3 + 1 
1d6c : aa __ __ TAX
1d6d : 98 __ __ TYA
1d6e : 18 __ __ CLC
1d6f : 65 3b __ ADC ACCU + 0 
1d71 : 85 30 __ STA P3 
1d73 : 90 01 __ BCC $1d76 ; (MoveSprites.s1013 + 0)
.s1012:
1d75 : e8 __ __ INX
.s1013:
1d76 : 86 31 __ STX P4 
1d78 : 20 f8 18 JSR $18f8 ; (vera_spr_move.s0 + 0)
1d7b : e6 47 __ INC T1 + 0 
1d7d : a5 47 __ LDA T1 + 0 
1d7f : c9 18 __ CMP #$18
1d81 : b0 03 __ BCS $1d86 ; (MoveSprites.s1001 + 0)
1d83 : 4c be 1c JMP $1cbe ; (MoveSprites.l2 + 0)
.s1001:
1d86 : 60 __ __ RTS
.s5:
1d87 : 98 __ __ TYA
1d88 : 18 __ __ CLC
1d89 : 69 bc __ ADC #$bc
1d8b : 18 __ __ CLC
1d8c : 65 4a __ ADC T3 + 0 
1d8e : a8 __ __ TAY
1d8f : a9 00 __ LDA #$00
1d91 : 65 4b __ ADC T3 + 1 
1d93 : aa __ __ TAX
1d94 : 98 __ __ TYA
1d95 : 18 __ __ CLC
1d96 : 65 3b __ ADC ACCU + 0 
1d98 : 85 30 __ STA P3 
1d9a : 90 01 __ BCC $1d9d ; (MoveSprites.s1011 + 0)
.s1010:
1d9c : e8 __ __ INX
.s1011:
1d9d : 86 31 __ STX P4 
1d9f : 4c f8 18 JMP $18f8 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
5500 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
5510 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
5520 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
5530 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
5540 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
5550 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
5560 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
5570 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
5580 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
5590 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
55a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
55b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
55c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
55d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
55e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
55f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
4ffe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1da2 : a9 08 __ LDA #$08
1da4 : 8d 2c 9f STA $9f2c 
1da7 : ad fd 9e LDA $9efd ; (sstack + 3)
1daa : cd ff 9e CMP $9eff ; (sstack + 5)
1dad : d0 10 __ BNE $1dbf ; (PlayZSM.s1 + 0)
.s1010:
1daf : ad fc 9e LDA $9efc ; (sstack + 2)
1db2 : cd fe 9e CMP $9efe ; (sstack + 4)
1db5 : d0 08 __ BNE $1dbf ; (PlayZSM.s1 + 0)
.s4:
1db7 : 20 ea 1f JSR $1fea ; (zsm_check.s0 + 0)
1dba : 09 00 __ ORA #$00
1dbc : d0 01 __ BNE $1dbf ; (PlayZSM.s1 + 0)
1dbe : 60 __ __ RTS
.s1:
1dbf : ac fc 9e LDY $9efc ; (sstack + 2)
1dc2 : ad fd 9e LDA $9efd ; (sstack + 3)
1dc5 : d0 51 __ BNE $1e18 ; (PlayZSM.s20 + 0)
.s1009:
1dc7 : c0 04 __ CPY #$04
1dc9 : d0 4d __ BNE $1e18 ; (PlayZSM.s20 + 0)
.s14:
1dcb : a9 51 __ LDA #$51
1dcd : 85 30 __ STA P3 
1dcf : a9 22 __ LDA #$22
1dd1 : 85 31 __ STA P4 
1dd3 : 20 1f 20 JSR $201f ; (zsm_init.s0 + 0)
1dd6 : a9 03 __ LDA #$03
1dd8 : 85 32 __ STA P5 
1dda : 85 34 __ STA P7 
1ddc : a9 08 __ LDA #$08
1dde : 85 33 __ STA P6 
1de0 : a9 00 __ LDA #$00
1de2 : 8d fa 9e STA $9efa ; (sstack + 0)
1de5 : a9 20 __ LDA #$20
1de7 : 8d fb 9e STA $9efb ; (sstack + 1)
1dea : a9 6d __ LDA #$6d
1dec : 85 30 __ STA P3 
1dee : a9 22 __ LDA #$22
1df0 : 85 31 __ STA P4 
1df2 : ad f4 21 LDA $21f4 ; (VolAddr + 0)
1df5 : 85 35 __ STA P8 
1df7 : ad f5 21 LDA $21f5 ; (VolAddr + 1)
1dfa : 85 36 __ STA P9 
1dfc : ad f6 21 LDA $21f6 ; (VolAddr + 2)
1dff : 85 37 __ STA P10 
1e01 : ad f7 21 LDA $21f7 ; (VolAddr + 3)
1e04 : 85 38 __ STA P11 
1e06 : 20 b7 19 JSR $19b7 ; (LoadSprite.s0 + 0)
1e09 : a9 20 __ LDA #$20
1e0b : 85 30 __ STA P3 
1e0d : a9 00 __ LDA #$00
1e0f : 85 31 __ STA P4 
1e11 : a9 54 __ LDA #$54
1e13 : a0 92 __ LDY #$92
1e15 : 4c ce 1e JMP $1ece ; (PlayZSM.s32 + 0)
.s20:
1e18 : ad fd 9e LDA $9efd ; (sstack + 3)
1e1b : 10 03 __ BPL $1e20 ; (PlayZSM.s1008 + 0)
1e1d : 4c d9 1e JMP $1ed9 ; (PlayZSM.s22 + 0)
.s1008:
1e20 : d0 07 __ BNE $1e29 ; (PlayZSM.s21 + 0)
.s1007:
1e22 : c0 04 __ CPY #$04
1e24 : b0 03 __ BCS $1e29 ; (PlayZSM.s21 + 0)
1e26 : 4c d9 1e JMP $1ed9 ; (PlayZSM.s22 + 0)
.s21:
1e29 : 09 00 __ ORA #$00
1e2b : d0 56 __ BNE $1e83 ; (PlayZSM.s1001 + 0)
.s1003:
1e2d : 98 __ __ TYA
1e2e : c0 05 __ CPY #$05
1e30 : d0 4d __ BNE $1e7f ; (PlayZSM.s1002 + 0)
.s16:
1e32 : a9 8a __ LDA #$8a
1e34 : 85 30 __ STA P3 
1e36 : a9 22 __ LDA #$22
1e38 : 85 31 __ STA P4 
1e3a : 20 1f 20 JSR $201f ; (zsm_init.s0 + 0)
1e3d : a9 03 __ LDA #$03
1e3f : 85 32 __ STA P5 
1e41 : 85 34 __ STA P7 
1e43 : a9 08 __ LDA #$08
1e45 : 85 33 __ STA P6 
1e47 : a9 00 __ LDA #$00
1e49 : 8d fa 9e STA $9efa ; (sstack + 0)
1e4c : a9 20 __ LDA #$20
1e4e : 8d fb 9e STA $9efb ; (sstack + 1)
1e51 : a9 ab __ LDA #$ab
1e53 : 85 30 __ STA P3 
1e55 : a9 22 __ LDA #$22
1e57 : 85 31 __ STA P4 
1e59 : ad f4 21 LDA $21f4 ; (VolAddr + 0)
1e5c : 85 35 __ STA P8 
1e5e : ad f5 21 LDA $21f5 ; (VolAddr + 1)
1e61 : 85 36 __ STA P9 
1e63 : ad f6 21 LDA $21f6 ; (VolAddr + 2)
1e66 : 85 37 __ STA P10 
1e68 : ad f7 21 LDA $21f7 ; (VolAddr + 3)
1e6b : 85 38 __ STA P11 
1e6d : 20 b7 19 JSR $19b7 ; (LoadSprite.s0 + 0)
1e70 : a9 20 __ LDA #$20
1e72 : 85 30 __ STA P3 
1e74 : a9 00 __ LDA #$00
1e76 : 85 31 __ STA P4 
1e78 : a9 54 __ LDA #$54
1e7a : a0 b2 __ LDY #$b2
1e7c : 4c ce 1e JMP $1ece ; (PlayZSM.s32 + 0)
.s1002:
1e7f : c9 06 __ CMP #$06
1e81 : f0 01 __ BEQ $1e84 ; (PlayZSM.s18 + 0)
.s1001:
1e83 : 60 __ __ RTS
.s18:
1e84 : a9 ca __ LDA #$ca
1e86 : 85 30 __ STA P3 
1e88 : a9 22 __ LDA #$22
1e8a : 85 31 __ STA P4 
1e8c : 20 1f 20 JSR $201f ; (zsm_init.s0 + 0)
1e8f : a9 03 __ LDA #$03
1e91 : 85 32 __ STA P5 
1e93 : 85 34 __ STA P7 
1e95 : a9 08 __ LDA #$08
1e97 : 85 33 __ STA P6 
1e99 : a9 00 __ LDA #$00
1e9b : 8d fa 9e STA $9efa ; (sstack + 0)
1e9e : a9 20 __ LDA #$20
1ea0 : 8d fb 9e STA $9efb ; (sstack + 1)
1ea3 : a9 00 __ LDA #$00
1ea5 : 85 30 __ STA P3 
1ea7 : a9 23 __ LDA #$23
1ea9 : 85 31 __ STA P4 
1eab : ad f4 21 LDA $21f4 ; (VolAddr + 0)
1eae : 85 35 __ STA P8 
1eb0 : ad f5 21 LDA $21f5 ; (VolAddr + 1)
1eb3 : 85 36 __ STA P9 
1eb5 : ad f6 21 LDA $21f6 ; (VolAddr + 2)
1eb8 : 85 37 __ STA P10 
1eba : ad f7 21 LDA $21f7 ; (VolAddr + 3)
1ebd : 85 38 __ STA P11 
1ebf : 20 b7 19 JSR $19b7 ; (LoadSprite.s0 + 0)
1ec2 : a9 20 __ LDA #$20
1ec4 : 85 30 __ STA P3 
1ec6 : a9 00 __ LDA #$00
1ec8 : 85 31 __ STA P4 
1eca : a9 54 __ LDA #$54
1ecc : a0 d2 __ LDY #$d2
.s32:
1ece : 84 2e __ STY P1 
1ed0 : 85 2f __ STA P2 
1ed2 : a9 b0 __ LDA #$b0
1ed4 : 85 2d __ STA P0 
1ed6 : 4c 31 19 JMP $1931 ; (vera_pal_putn.s0 + 0)
.s22:
1ed9 : 98 __ __ TYA
1eda : 0d fd 9e ORA $9efd ; (sstack + 3)
1edd : d0 03 __ BNE $1ee2 ; (PlayZSM.s23 + 0)
1edf : 4c a8 1f JMP $1fa8 ; (PlayZSM.s6 + 0)
.s23:
1ee2 : ad fd 9e LDA $9efd ; (sstack + 3)
1ee5 : d0 9c __ BNE $1e83 ; (PlayZSM.s1001 + 0)
.s1006:
1ee7 : 98 __ __ TYA
1ee8 : c0 01 __ CPY #$01
1eea : d0 4d __ BNE $1f39 ; (PlayZSM.s1005 + 0)
.s8:
1eec : a9 6a __ LDA #$6a
1eee : 85 30 __ STA P3 
1ef0 : a9 21 __ LDA #$21
1ef2 : 85 31 __ STA P4 
1ef4 : 20 1f 20 JSR $201f ; (zsm_init.s0 + 0)
1ef7 : a9 03 __ LDA #$03
1ef9 : 85 32 __ STA P5 
1efb : 85 34 __ STA P7 
1efd : a9 08 __ LDA #$08
1eff : 85 33 __ STA P6 
1f01 : a9 00 __ LDA #$00
1f03 : 8d fa 9e STA $9efa ; (sstack + 0)
1f06 : a9 20 __ LDA #$20
1f08 : 8d fb 9e STA $9efb ; (sstack + 1)
1f0b : a9 88 __ LDA #$88
1f0d : 85 30 __ STA P3 
1f0f : a9 21 __ LDA #$21
1f11 : 85 31 __ STA P4 
1f13 : ad f4 21 LDA $21f4 ; (VolAddr + 0)
1f16 : 85 35 __ STA P8 
1f18 : ad f5 21 LDA $21f5 ; (VolAddr + 1)
1f1b : 85 36 __ STA P9 
1f1d : ad f6 21 LDA $21f6 ; (VolAddr + 2)
1f20 : 85 37 __ STA P10 
1f22 : ad f7 21 LDA $21f7 ; (VolAddr + 3)
1f25 : 85 38 __ STA P11 
1f27 : 20 b7 19 JSR $19b7 ; (LoadSprite.s0 + 0)
1f2a : a9 20 __ LDA #$20
1f2c : 85 30 __ STA P3 
1f2e : a9 00 __ LDA #$00
1f30 : 85 31 __ STA P4 
1f32 : a9 54 __ LDA #$54
1f34 : a0 52 __ LDY #$52
1f36 : 4c ce 1e JMP $1ece ; (PlayZSM.s32 + 0)
.s1005:
1f39 : c9 02 __ CMP #$02
1f3b : f0 5a __ BEQ $1f97 ; (PlayZSM.s10 + 0)
.s1004:
1f3d : c9 03 __ CMP #$03
1f3f : f0 01 __ BEQ $1f42 ; (PlayZSM.s12 + 0)
1f41 : 60 __ __ RTS
.s12:
1f42 : a9 00 __ LDA #$00
1f44 : 85 30 __ STA P3 
1f46 : a9 22 __ LDA #$22
1f48 : 85 31 __ STA P4 
1f4a : a9 27 __ LDA #$27
1f4c : 85 4b __ STA T0 + 0 
1f4e : a9 22 __ LDA #$22
.s33:
1f50 : 85 4c __ STA T0 + 1 
1f52 : 20 1f 20 JSR $201f ; (zsm_init.s0 + 0)
1f55 : a5 4b __ LDA T0 + 0 
1f57 : 85 30 __ STA P3 
1f59 : a5 4c __ LDA T0 + 1 
1f5b : 85 31 __ STA P4 
1f5d : a9 03 __ LDA #$03
1f5f : 85 32 __ STA P5 
1f61 : 85 34 __ STA P7 
1f63 : a9 08 __ LDA #$08
1f65 : 85 33 __ STA P6 
1f67 : a9 00 __ LDA #$00
1f69 : 8d fa 9e STA $9efa ; (sstack + 0)
1f6c : a9 20 __ LDA #$20
1f6e : 8d fb 9e STA $9efb ; (sstack + 1)
1f71 : ad f4 21 LDA $21f4 ; (VolAddr + 0)
1f74 : 85 35 __ STA P8 
1f76 : ad f5 21 LDA $21f5 ; (VolAddr + 1)
1f79 : 85 36 __ STA P9 
1f7b : ad f6 21 LDA $21f6 ; (VolAddr + 2)
1f7e : 85 37 __ STA P10 
1f80 : ad f7 21 LDA $21f7 ; (VolAddr + 3)
1f83 : 85 38 __ STA P11 
1f85 : 20 b7 19 JSR $19b7 ; (LoadSprite.s0 + 0)
1f88 : a9 20 __ LDA #$20
1f8a : 85 30 __ STA P3 
1f8c : a9 00 __ LDA #$00
1f8e : 85 31 __ STA P4 
1f90 : a9 54 __ LDA #$54
1f92 : a0 72 __ LDY #$72
1f94 : 4c ce 1e JMP $1ece ; (PlayZSM.s32 + 0)
.s10:
1f97 : a9 a5 __ LDA #$a5
1f99 : 85 30 __ STA P3 
1f9b : a9 21 __ LDA #$21
1f9d : 85 31 __ STA P4 
1f9f : a9 ca __ LDA #$ca
1fa1 : 85 4b __ STA T0 + 0 
1fa3 : a9 21 __ LDA #$21
1fa5 : 4c 50 1f JMP $1f50 ; (PlayZSM.s33 + 0)
.s6:
1fa8 : a9 03 __ LDA #$03
1faa : 85 32 __ STA P5 
1fac : 85 34 __ STA P7 
1fae : a9 08 __ LDA #$08
1fb0 : 85 33 __ STA P6 
1fb2 : a9 00 __ LDA #$00
1fb4 : 8d fa 9e STA $9efa ; (sstack + 0)
1fb7 : a9 20 __ LDA #$20
1fb9 : 8d fb 9e STA $9efb ; (sstack + 1)
1fbc : a9 00 __ LDA #$00
1fbe : 85 30 __ STA P3 
1fc0 : a9 20 __ LDA #$20
1fc2 : 85 31 __ STA P4 
1fc4 : ad f4 21 LDA $21f4 ; (VolAddr + 0)
1fc7 : 85 35 __ STA P8 
1fc9 : ad f5 21 LDA $21f5 ; (VolAddr + 1)
1fcc : 85 36 __ STA P9 
1fce : ad f6 21 LDA $21f6 ; (VolAddr + 2)
1fd1 : 85 37 __ STA P10 
1fd3 : ad f7 21 LDA $21f7 ; (VolAddr + 3)
1fd6 : 85 38 __ STA P11 
1fd8 : 20 b7 19 JSR $19b7 ; (LoadSprite.s0 + 0)
1fdb : a9 1c __ LDA #$1c
1fdd : 85 30 __ STA P3 
1fdf : a9 00 __ LDA #$00
1fe1 : 85 31 __ STA P4 
1fe3 : a9 50 __ LDA #$50
1fe5 : a0 00 __ LDY #$00
1fe7 : 4c ce 1e JMP $1ece ; (PlayZSM.s32 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1fea : ad fe 1f LDA $1ffe ; (zsm_finished + 0)
.s1001:
1fed : 60 __ __ RTS
--------------------------------------------------------------------
2000 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2010 : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
zsm_init:
.s0:
201f : a9 01 __ LDA #$01
2021 : 8d fe 1f STA $1ffe ; (zsm_finished + 0)
2024 : ad ff 21 LDA $21ff ; (zsm_reading + 0)
2027 : f0 0a __ BEQ $2033 ; (zsm_init.s3 + 0)
.s1:
2029 : a9 02 __ LDA #$02
202b : 20 92 1a JSR $1a92 ; (krnio_close.s1000 + 0)
202e : a9 00 __ LDA #$00
2030 : 8d ff 21 STA $21ff ; (zsm_reading + 0)
.s3:
2033 : 20 80 20 JSR $2080 ; (zsm_silence.s0 + 0)
2036 : 20 98 20 JSR $2098 ; (zsm_save_volume.s0 + 0)
2039 : a9 00 __ LDA #$00
203b : 8d fd 54 STA $54fd ; (zsm_pos + 0)
203e : 8d fe 54 STA $54fe ; (zsm_pos + 1)
2041 : 8d a3 63 STA $63a3 ; (zsm_wpos + 0)
2044 : 8d a4 63 STA $63a4 ; (zsm_wpos + 1)
2047 : 8d fc 54 STA $54fc ; (zsm_delay + 0)
204a : a5 30 __ LDA P3 ; (fname + 0)
204c : 85 2d __ STA P0 
204e : a5 31 __ LDA P4 ; (fname + 1)
2050 : 85 2e __ STA P1 
2052 : 20 34 1a JSR $1a34 ; (krnio_setnam.s0 + 0)
2055 : a9 02 __ LDA #$02
2057 : 85 2d __ STA P0 
2059 : 85 2f __ STA P2 
205b : a9 08 __ LDA #$08
205d : 85 2e __ STA P1 
205f : 20 4a 1a JSR $1a4a ; (krnio_open.s0 + 0)
2062 : a5 3b __ LDA ACCU + 0 
2064 : f0 19 __ BEQ $207f ; (zsm_init.s1001 + 0)
.s4:
2066 : a9 01 __ LDA #$01
2068 : 8d ff 21 STA $21ff ; (zsm_reading + 0)
206b : 20 ca 20 JSR $20ca ; (zsm_fill.s0 + 0)
206e : a9 10 __ LDA #$10
2070 : 8d fd 54 STA $54fd ; (zsm_pos + 0)
2073 : a9 00 __ LDA #$00
2075 : 8d fe 54 STA $54fe ; (zsm_pos + 1)
2078 : 8d fe 1f STA $1ffe ; (zsm_finished + 0)
207b : a9 01 __ LDA #$01
207d : 85 3b __ STA ACCU + 0 
.s1001:
207f : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
21ff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
2080 : a9 00 __ LDA #$00
2082 : 85 47 __ STA T0 + 0 
2084 : a9 08 __ LDA #$08
2086 : 85 2d __ STA P0 
2088 : a9 00 __ LDA #$00
.l1006:
208a : 85 2e __ STA P1 
208c : 20 fe 0d JSR $0dfe ; (sfx_put.s1 + 0)
208f : e6 47 __ INC T0 + 0 
2091 : a5 47 __ LDA T0 + 0 
2093 : c9 08 __ CMP #$08
2095 : 90 f3 __ BCC $208a ; (zsm_silence.l1006 + 0)
.s1001:
2097 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
2098 : a0 00 __ LDY #$00
209a : 84 3c __ STY ACCU + 1 
209c : a2 02 __ LDX #$02
209e : 18 __ __ CLC
.l1006:
209f : 8a __ __ TXA
20a0 : 09 c0 __ ORA #$c0
20a2 : 8d 20 9f STA $9f20 
20a5 : a5 3c __ LDA ACCU + 1 
20a7 : 09 f9 __ ORA #$f9
20a9 : 8d 21 9f STA $9f21 
20ac : a9 01 __ LDA #$01
20ae : 8d 22 9f STA $9f22 
20b1 : ad 23 9f LDA $9f23 
20b4 : 99 93 63 STA $6393,y ; (vera_volumes + 0)
20b7 : a9 00 __ LDA #$00
20b9 : 8d 23 9f STA $9f23 
20bc : 8a __ __ TXA
20bd : 69 04 __ ADC #$04
20bf : aa __ __ TAX
20c0 : 90 02 __ BCC $20c4 ; (zsm_save_volume.s1009 + 0)
.s1008:
20c2 : e6 3c __ INC ACCU + 1 
.s1009:
20c4 : c8 __ __ INY
20c5 : c0 10 __ CPY #$10
20c7 : 90 d6 __ BCC $209f ; (zsm_save_volume.l1006 + 0)
.s1001:
20c9 : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
6393 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
63a3 : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
20ca : ad ff 21 LDA $21ff ; (zsm_reading + 0)
20cd : f0 20 __ BEQ $20ef ; (zsm_fill.s1 + 0)
.s2:
20cf : ad fe 54 LDA $54fe ; (zsm_pos + 1)
20d2 : 18 __ __ CLC
20d3 : 69 04 __ ADC #$04
20d5 : cd a4 63 CMP $63a4 ; (zsm_wpos + 1)
20d8 : d0 0c __ BNE $20e6 ; (zsm_fill.s6 + 0)
.s1006:
20da : ad a3 63 LDA $63a3 ; (zsm_wpos + 0)
20dd : cd fd 54 CMP $54fd ; (zsm_pos + 0)
20e0 : d0 04 __ BNE $20e6 ; (zsm_fill.s6 + 0)
.s5:
20e2 : a9 00 __ LDA #$00
20e4 : f0 0b __ BEQ $20f1 ; (zsm_fill.s1008 + 0)
.s6:
20e6 : a9 02 __ LDA #$02
20e8 : 20 72 1a JSR $1a72 ; (krnio_chkin.s1000 + 0)
20eb : a5 3b __ LDA ACCU + 0 
20ed : d0 07 __ BNE $20f6 ; (zsm_fill.s9 + 0)
.s1:
20ef : a9 ff __ LDA #$ff
.s1008:
20f1 : 85 3b __ STA ACCU + 0 
.s1001:
20f3 : 85 3c __ STA ACCU + 1 
20f5 : 60 __ __ RTS
.s9:
20f6 : a9 00 __ LDA #$00
20f8 : 85 47 __ STA T1 + 0 
20fa : 85 48 __ STA T1 + 1 
20fc : ad fe 54 LDA $54fe ; (zsm_pos + 1)
20ff : 18 __ __ CLC
2100 : 69 04 __ ADC #$04
2102 : cd a4 63 CMP $63a4 ; (zsm_wpos + 1)
2105 : d0 08 __ BNE $210f ; (zsm_fill.l13 + 0)
.s1002:
2107 : ad a3 63 LDA $63a3 ; (zsm_wpos + 0)
210a : cd fd 54 CMP $54fd ; (zsm_pos + 0)
210d : f0 45 __ BEQ $2154 ; (zsm_fill.s38 + 0)
.l13:
210f : 20 84 1a JSR $1a84 ; (krnio_chrin.s0 + 0)
2112 : ad a3 63 LDA $63a3 ; (zsm_wpos + 0)
2115 : 85 49 __ STA T3 + 0 
2117 : 18 __ __ CLC
2118 : 69 01 __ ADC #$01
211a : 8d a3 63 STA $63a3 ; (zsm_wpos + 0)
211d : ad a4 63 LDA $63a4 ; (zsm_wpos + 1)
2120 : aa __ __ TAX
2121 : 69 00 __ ADC #$00
2123 : 8d a4 63 STA $63a4 ; (zsm_wpos + 1)
2126 : 8a __ __ TXA
2127 : 29 03 __ AND #$03
2129 : 18 __ __ CLC
212a : 69 69 __ ADC #$69
212c : 85 4a __ STA T3 + 1 
212e : a5 3b __ LDA ACCU + 0 
2130 : a0 00 __ LDY #$00
2132 : 91 49 __ STA (T3 + 0),y 
2134 : e6 47 __ INC T1 + 0 
2136 : d0 02 __ BNE $213a ; (zsm_fill.s1010 + 0)
.s1009:
2138 : e6 48 __ INC T1 + 1 
.s1010:
213a : 20 ee 1f JSR $1fee ; (krnio_status.s0 + 0)
213d : a5 3b __ LDA ACCU + 0 
213f : d0 0e __ BNE $214f ; (zsm_fill.s15 + 0)
.s12:
2141 : ad fe 54 LDA $54fe ; (zsm_pos + 1)
2144 : 18 __ __ CLC
2145 : 69 04 __ ADC #$04
2147 : cd a4 63 CMP $63a4 ; (zsm_wpos + 1)
214a : d0 c3 __ BNE $210f ; (zsm_fill.l13 + 0)
214c : 4c 07 21 JMP $2107 ; (zsm_fill.s1002 + 0)
.s15:
214f : a9 00 __ LDA #$00
2151 : 8d ff 21 STA $21ff ; (zsm_reading + 0)
.s38:
2154 : 20 8e 1a JSR $1a8e ; (krnio_clrchn.s0 + 0)
2157 : ad ff 21 LDA $21ff ; (zsm_reading + 0)
215a : d0 05 __ BNE $2161 ; (zsm_fill.s21 + 0)
.s19:
215c : a9 02 __ LDA #$02
215e : 20 92 1a JSR $1a92 ; (krnio_close.s1000 + 0)
.s21:
2161 : a5 47 __ LDA T1 + 0 
2163 : 85 3b __ STA ACCU + 0 
2165 : a5 48 __ LDA T1 + 1 
2167 : 4c f3 20 JMP $20f3 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_status:
.s0:
1fee : 20 b7 ff JSR $ffb7 
1ff1 : 85 3b __ STA ACCU + 0 
1ff3 : a9 00 __ LDA #$00
1ff5 : 85 3c __ STA ACCU + 1 
.s1001:
1ff7 : 60 __ __ RTS
--------------------------------------------------------------------
216a : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
217a : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
2188 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2198 : __ __ __ BYT 4b 4f 4c 45 2e 42 49 4e 2c 50 2c 52 00          : KOLE.BIN,P,R.
--------------------------------------------------------------------
KolePal:
5452 : __ __ __ BYT 00 00 79 02 00 00 40 0a 30 07 ff 0f 00 0f 6c 00 : ..y...@.0.....l.
5462 : __ __ __ BYT bf 00 99 09 cc 0c 0f 06 be 07 08 02 33 03 00 00 : ............3...
--------------------------------------------------------------------
21a5 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
21b5 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
21c5 : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
21ca : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
21da : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
21ea : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
RealPal:
5472 : __ __ __ BYT 00 00 00 00 20 04 46 04 69 06 40 09 ff 00 44 04 : .... .F.i.@...D.
5482 : __ __ __ BYT bb 0b dd 0d 75 0c a7 0e ff 0f df 0d 33 03 99 09 : ....u.......3...
--------------------------------------------------------------------
2200 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
2210 : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
2220 : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
2227 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2237 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
2247 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
2251 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
2261 : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
226d : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
227d : __ __ __ BYT 46 4c 44 45 2e 42 49 4e 2c 50 2c 52 00          : FLDE.BIN,P,R.
--------------------------------------------------------------------
FldePal:
5492 : __ __ __ BYT 00 00 00 00 dd 0d ff 0f 3e 02 cf 00 ad 00 5f 04 : ........>....._.
54a2 : __ __ __ BYT 27 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : '...............
--------------------------------------------------------------------
228a : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 46 45 4d 55 : @0:zsmfiles/FEMU
229a : __ __ __ BYT 52 46 52 45 45 5a 45 52 2e 7a 73 6d 2c 50 2c 52 : RFREEZER.zsm,P,R
22aa : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
22ab : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
22bb : __ __ __ BYT 41 4c 45 4b 53 49 2e 42 49 4e 2c 50 2c 52 00    : ALEKSI.BIN,P,R.
--------------------------------------------------------------------
Aleksipal:
54b2 : __ __ __ BYT 00 00 00 00 3b 00 6f 00 22 02 cc 00 ff 00 9f 02 : ....;.o.".......
54c2 : __ __ __ BYT 11 01 cb 0c ff 0f 99 09 d0 0d 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
22ca : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 48 6f 75 73 : @0:zsmfiles/Hous
22da : __ __ __ BYT 65 34 2e 7a 73 6d 2c 50 2c 52 00                : e4.zsm,P,R.
--------------------------------------------------------------------
2300 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2310 : __ __ __ BYT 43 52 49 53 50 59 2e 42 49 4e 2c 50 2c 52 00    : CRISPY.BIN,P,R.
--------------------------------------------------------------------
CrispyPal:
54d2 : __ __ __ BYT 00 00 00 00 12 01 22 02 ff 0f 0f 09 24 02 10 06 : ......".....$...
54e2 : __ __ __ BYT 39 03 00 04 d9 0d dd 0d 8c 00 af 00 cc 0c aa 0a : 9...............
--------------------------------------------------------------------
LastSelectedSong:
3fff : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
54f2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PalIndex:
54f4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
MaxSong:
54f6 : __ __ __ BYT 06                                              : .
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
54f7 : __ __ __ BYT 00 00                                           : ..
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
2350 : 20 f8 1f JSR $1ff8 ; (zsm_irq_play.s0 + 0)
2353 : a9 01 __ LDA #$01
.s1001:
2355 : 85 3b __ STA ACCU + 0 
2357 : 60 __ __ RTS
.s4:
2358 : a9 00 __ LDA #$00
235a : cd f9 54 CMP $54f9 ; (paused + 0)
235d : 2a __ __ ROL
235e : 8d f9 54 STA $54f9 ; (paused + 0)
2361 : 85 2f __ STA P2 
2363 : 20 6b 23 JSR $236b ; (zsm_pause.s0 + 0)
.s1007:
2366 : a5 30 __ LDA P3 ; (playing + 0)
2368 : 4c 55 23 JMP $2355 ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
54f9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
236b : a5 2f __ LDA P2 ; (pause + 0)
236d : d0 0e __ BNE $237d ; (zsm_pause.s4 + 0)
.s8:
236f : ad ff 1f LDA $1fff ; (zsm_paused + 0)
2372 : f0 08 __ BEQ $237c ; (zsm_pause.s1001 + 0)
.s5:
2374 : 20 8d 23 JSR $238d ; (zsm_restore_volume.s0 + 0)
2377 : a9 00 __ LDA #$00
2379 : 8d ff 1f STA $1fff ; (zsm_paused + 0)
.s1001:
237c : 60 __ __ RTS
.s4:
237d : ad ff 1f LDA $1fff ; (zsm_paused + 0)
2380 : d0 fa __ BNE $237c ; (zsm_pause.s1001 + 0)
.s1:
2382 : a9 01 __ LDA #$01
2384 : 8d ff 1f STA $1fff ; (zsm_paused + 0)
2387 : 20 80 20 JSR $2080 ; (zsm_silence.s0 + 0)
238a : 4c 98 20 JMP $2098 ; (zsm_save_volume.s0 + 0)
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
23a6 : b9 93 63 LDA $6393,y ; (vera_volumes + 0)
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
1ff8 : 8d fd 1f STA $1ffd ; (zsm_playing + 0)
.s1001:
1ffb : 60 __ __ RTS
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
23df : 20 a3 24 JSR $24a3 ; (zsm_get_volumes.s0 + 0)
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
23f1 : ad f8 21 LDA $21f8 ; (IndAddr + 0)
23f4 : 18 __ __ CLC
23f5 : 7d 5f 26 ADC $265f,x ; (__multab32L + 0)
23f8 : a8 __ __ TAY
23f9 : ad f9 21 LDA $21f9 ; (IndAddr + 1)
23fc : 7d 6f 26 ADC $266f,x ; (__multab32H + 0)
23ff : aa __ __ TAX
2400 : ad fa 21 LDA $21fa ; (IndAddr + 2)
2403 : 69 00 __ ADC #$00
2405 : 85 4a __ STA T5 + 2 
2407 : ad fb 21 LDA $21fb ; (IndAddr + 3)
240a : 69 00 __ ADC #$00
240c : 85 4b __ STA T5 + 3 
240e : 98 __ __ TYA
240f : 38 __ __ SEC
2410 : e9 20 __ SBC #$20
2412 : 85 48 __ STA T5 + 0 
2414 : 8a __ __ TXA
2415 : e9 00 __ SBC #$00
2417 : 85 49 __ STA T5 + 1 
2419 : a5 4a __ LDA T5 + 2 
241b : e9 00 __ SBC #$00
241d : 85 4a __ STA T5 + 2 
241f : a5 4b __ LDA T5 + 3 
2421 : e9 00 __ SBC #$00
2423 : a2 05 __ LDX #$05
.l1002:
2425 : 4a __ __ LSR
2426 : 66 4a __ ROR T5 + 2 
2428 : 66 49 __ ROR T5 + 1 
242a : 66 48 __ ROR T5 + 0 
242c : ca __ __ DEX
242d : d0 f6 __ BNE $2425 ; (UpdateVolume.l1002 + 0)
.s1003:
242f : a5 48 __ LDA T5 + 0 
2431 : 85 2e __ STA P1 
2433 : a5 49 __ LDA T5 + 1 
2435 : 85 2f __ STA P2 
2437 : 20 6a 25 JSR $256a ; (vera_spr_image.s0 + 0)
243a : e6 47 __ INC T0 + 0 
243c : a5 47 __ LDA T0 + 0 
243e : c9 10 __ CMP #$10
2440 : 90 89 __ BCC $23cb ; (UpdateVolume.l2 + 0)
.s4:
2442 : a9 00 __ LDA #$00
2444 : 85 47 __ STA T0 + 0 
.l6:
2446 : a9 f9 __ LDA #$f9
2448 : 85 2d __ STA P0 
244a : a9 9e __ LDA #$9e
244c : 85 2e __ STA P1 
244e : a9 f8 __ LDA #$f8
2450 : 85 2f __ STA P2 
2452 : a5 47 __ LDA T0 + 0 
2454 : 85 31 __ STA P4 
2456 : 20 a3 24 JSR $24a3 ; (zsm_get_volumes.s0 + 0)
2459 : 18 __ __ CLC
245a : a5 31 __ LDA P4 
245c : 69 29 __ ADC #$29
245e : 85 2d __ STA P0 
2460 : ad f8 9e LDA $9ef8 ; (FMVolume + 0)
2463 : 4a __ __ LSR
2464 : 6a __ __ ROR
2465 : 6a __ __ ROR
2466 : aa __ __ TAX
2467 : 29 c0 __ AND #$c0
2469 : 6a __ __ ROR
246a : 6d f8 21 ADC $21f8 ; (IndAddr + 0)
246d : 85 48 __ STA T5 + 0 
246f : 8a __ __ TXA
2470 : 29 1f __ AND #$1f
2472 : 6d f9 21 ADC $21f9 ; (IndAddr + 1)
2475 : 85 49 __ STA T5 + 1 
2477 : ad fa 21 LDA $21fa ; (IndAddr + 2)
247a : 69 00 __ ADC #$00
247c : 85 4a __ STA T5 + 2 
247e : ad fb 21 LDA $21fb ; (IndAddr + 3)
2481 : 69 00 __ ADC #$00
2483 : a2 05 __ LDX #$05
.l1004:
2485 : 4a __ __ LSR
2486 : 66 4a __ ROR T5 + 2 
2488 : 66 49 __ ROR T5 + 1 
248a : 66 48 __ ROR T5 + 0 
248c : ca __ __ DEX
248d : d0 f6 __ BNE $2485 ; (UpdateVolume.l1004 + 0)
.s1005:
248f : a5 48 __ LDA T5 + 0 
2491 : 85 2e __ STA P1 
2493 : a5 49 __ LDA T5 + 1 
2495 : 85 2f __ STA P2 
2497 : 20 6a 25 JSR $256a ; (vera_spr_image.s0 + 0)
249a : e6 47 __ INC T0 + 0 
249c : a5 47 __ LDA T0 + 0 
249e : c9 08 __ CMP #$08
24a0 : 90 a4 __ BCC $2446 ; (UpdateVolume.l6 + 0)
.s1001:
24a2 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_get_volumes:
.s0:
24a3 : a5 31 __ LDA P4 ; (id + 0)
24a5 : 0a __ __ ASL
24a6 : 85 3d __ STA ACCU + 2 
24a8 : a5 32 __ LDA P5 ; (id + 1)
24aa : 2a __ __ ROL
24ab : 06 3d __ ASL ACCU + 2 
24ad : 0a __ __ ASL
24ae : 09 f9 __ ORA #$f9
24b0 : 8d 21 9f STA $9f21 
24b3 : a5 3d __ LDA ACCU + 2 
24b5 : 09 c2 __ ORA #$c2
24b7 : 8d 20 9f STA $9f20 
24ba : a9 01 __ LDA #$01
24bc : 8d 22 9f STA $9f22 
24bf : ad 23 9f LDA $9f23 
24c2 : a0 00 __ LDY #$00
24c4 : 91 2d __ STA (P0),y ; (vera_v + 0)
24c6 : a5 31 __ LDA P4 ; (id + 0)
24c8 : 29 07 __ AND #$07
24ca : aa __ __ TAX
24cb : bd 7b 63 LDA $637b,x ; (vera_fm_gate + 0)
24ce : 29 78 __ AND #$78
24d0 : d0 04 __ BNE $24d6 ; (zsm_get_volumes.s1 + 0)
.s2:
24d2 : 98 __ __ TYA
.s1022:
24d3 : 91 2f __ STA (P2),y ; (fm_v + 0)
.s1001:
24d5 : 60 __ __ RTS
.s1:
24d6 : 85 3d __ STA ACCU + 2 
24d8 : 18 __ __ CLC
24d9 : a9 20 __ LDA #$20
24db : 65 31 __ ADC P4 ; (id + 0)
24dd : 85 3b __ STA ACCU + 0 
24df : a9 6d __ LDA #$6d
24e1 : 65 32 __ ADC P5 ; (id + 1)
24e3 : 85 3c __ STA ACCU + 1 
24e5 : b1 3b __ LDA (ACCU + 0),y 
24e7 : aa __ __ TAX
24e8 : 25 3d __ AND ACCU + 2 
24ea : f0 e9 __ BEQ $24d5 ; (zsm_get_volumes.s1001 + 0)
.s4:
24ec : a0 58 __ LDY #$58
24ee : b1 3b __ LDA (ACCU + 0),y 
24f0 : 29 7f __ AND #$7f
24f2 : 85 3d __ STA ACCU + 2 
24f4 : 8a __ __ TXA
24f5 : 29 10 __ AND #$10
24f7 : d0 05 __ BNE $24fe ; (zsm_get_volumes.s7 + 0)
.s9:
24f9 : a5 3d __ LDA ACCU + 2 
24fb : 4c 06 25 JMP $2506 ; (zsm_get_volumes.s46 + 0)
.s7:
24fe : a0 50 __ LDY #$50
2500 : b1 3b __ LDA (ACCU + 0),y 
2502 : 29 7f __ AND #$7f
2504 : 25 3d __ AND ACCU + 2 
.s46:
2506 : d0 04 __ BNE $250c ; (zsm_get_volumes.s11 + 0)
.s10:
2508 : a9 02 __ LDA #$02
250a : d0 06 __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s11:
250c : c9 02 __ CMP #$02
250e : b0 06 __ BCS $2516 ; (zsm_get_volumes.s14 + 0)
.s13:
2510 : a9 03 __ LDA #$03
.s1023:
2512 : a0 00 __ LDY #$00
2514 : f0 bd __ BEQ $24d3 ; (zsm_get_volumes.s1022 + 0)
.s14:
2516 : c9 03 __ CMP #$03
2518 : b0 04 __ BCS $251e ; (zsm_get_volumes.s17 + 0)
.s16:
251a : a9 04 __ LDA #$04
251c : d0 f4 __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s17:
251e : c9 04 __ CMP #$04
2520 : b0 04 __ BCS $2526 ; (zsm_get_volumes.s20 + 0)
.s19:
2522 : a9 05 __ LDA #$05
2524 : d0 ec __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s20:
2526 : c9 05 __ CMP #$05
2528 : b0 04 __ BCS $252e ; (zsm_get_volumes.s23 + 0)
.s22:
252a : a9 06 __ LDA #$06
252c : d0 e4 __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s23:
252e : c9 06 __ CMP #$06
2530 : 90 34 __ BCC $2566 ; (zsm_get_volumes.s25 + 0)
.s26:
2532 : 85 3b __ STA ACCU + 0 
2534 : a9 08 __ LDA #$08
2536 : c5 3b __ CMP ACCU + 0 
2538 : b0 d8 __ BCS $2512 ; (zsm_get_volumes.s1023 + 0)
.s29:
253a : a9 10 __ LDA #$10
253c : c5 3b __ CMP ACCU + 0 
253e : 90 04 __ BCC $2544 ; (zsm_get_volumes.s32 + 0)
.s31:
2540 : a9 09 __ LDA #$09
2542 : d0 ce __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s32:
2544 : a9 20 __ LDA #$20
2546 : c5 3b __ CMP ACCU + 0 
2548 : 90 04 __ BCC $254e ; (zsm_get_volumes.s35 + 0)
.s34:
254a : a9 0a __ LDA #$0a
254c : d0 c4 __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s35:
254e : a9 40 __ LDA #$40
2550 : c5 3b __ CMP ACCU + 0 
2552 : 90 04 __ BCC $2558 ; (zsm_get_volumes.s38 + 0)
.s37:
2554 : a9 0b __ LDA #$0b
2556 : d0 ba __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s38:
2558 : a5 3b __ LDA ACCU + 0 
255a : c9 7f __ CMP #$7f
255c : b0 04 __ BCS $2562 ; (zsm_get_volumes.s41 + 0)
.s40:
255e : a9 0c __ LDA #$0c
2560 : d0 b0 __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s41:
2562 : a9 0d __ LDA #$0d
2564 : d0 ac __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
.s25:
2566 : a9 07 __ LDA #$07
2568 : d0 a8 __ BNE $2512 ; (zsm_get_volumes.s1023 + 0)
--------------------------------------------------------------------
vera_spr_image:
.s0:
256a : ad 25 9f LDA $9f25 
256d : 29 fe __ AND #$fe
256f : 8d 25 9f STA $9f25 
2572 : a5 2d __ LDA P0 ; (spr + 0)
2574 : 0a __ __ ASL
2575 : 0a __ __ ASL
2576 : 85 3b __ STA ACCU + 0 
2578 : a9 3f __ LDA #$3f
257a : 2a __ __ ROL
257b : 06 3b __ ASL ACCU + 0 
257d : 2a __ __ ROL
257e : 8d 21 9f STA $9f21 
2581 : a5 3b __ LDA ACCU + 0 
2583 : 8d 20 9f STA $9f20 
2586 : a9 11 __ LDA #$11
2588 : 8d 22 9f STA $9f22 
258b : a5 2e __ LDA P1 ; (addr32 + 0)
258d : 8d 23 9f STA $9f23 
2590 : ad 22 9f LDA $9f22 
2593 : 29 0f __ AND #$0f
2595 : 8d 22 9f STA $9f22 
2598 : ad 23 9f LDA $9f23 
259b : 29 80 __ AND #$80
259d : 05 2f __ ORA P2 ; (addr32 + 1)
259f : 8d 23 9f STA $9f23 
.s1001:
25a2 : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
5600 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
5610 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
5620 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
5630 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
5640 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
5650 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
5660 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
5670 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
5680 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
5690 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
56a0 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
56b0 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
56c0 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
56d0 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
56e0 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
56f0 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
5700 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
5710 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
5720 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
5730 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
5740 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
5750 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
5760 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
5770 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
5780 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
5790 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
57a0 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
57b0 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
57c0 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
57d0 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
57e0 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
57f0 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
5800 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
5810 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
5820 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
5830 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
5840 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
5850 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
5860 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
5870 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
5880 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
5890 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
58a0 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
58b0 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
58c0 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
58d0 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
58e0 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
58f0 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
5900 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
5910 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
5920 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
5930 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
5940 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
5950 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
5960 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
5970 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
5980 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
5990 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
59a0 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
59b0 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
59c0 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
59d0 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
59e0 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
59f0 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
5a00 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
5a10 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
5a20 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
5a30 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
5a40 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
5a50 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
5a60 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
5a70 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
5a80 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
5a90 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
5aa0 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
5ab0 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
5ac0 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
5ad0 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
5ae0 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
5af0 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
5b00 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
5b10 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
5b20 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
5b30 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
5b40 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
5b50 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
5b60 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
5b70 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
5b80 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5b90 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5ba0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5bb0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5bc0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5bd0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5be0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5bf0 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5c00 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
5c10 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
5c1e : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
5c2e : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
5c3e : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
5c4e : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
5c5e : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
5c6e : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
5c7e : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
5c8e : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
5c9e : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
5cae : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
5cbe : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
5cce : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
5cde : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
5cee : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
5cfe : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
5d0e : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
5d1e : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
5d2e : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
5d3e : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
5d4e : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
5d5e : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
5d6e : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
5d7e : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
5d8e : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
5d9e : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
5dae : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
5dbe : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
5dce : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
5dde : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
5dee : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
5dfe : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
5e0e : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
5e1e : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
5e2e : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
5e3e : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
5e4e : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
5e5e : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
5e6e : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
5e7e : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
5e8e : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
5e9e : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
5eae : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
5ebe : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
5ece : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
5ede : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
5eee : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
5efe : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
5f0e : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
5f1e : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
5f2e : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
5f3e : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
5f4e : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
5f5e : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
5f6e : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
5f7e : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
5f8e : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
5f9e : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
5fae : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
5fbe : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
5fce : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
5fde : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
5fee : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
5ffe : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
600e : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
601e : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
602e : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
603e : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
604e : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
605e : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
606e : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
607e : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
608e : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
609e : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
60ae : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
60be : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
60ce : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
60de : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
60ee : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
60fe : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
610e : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
611e : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
612e : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
613e : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
614e : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
615e : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
616e : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
617e : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
618e : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
619e : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
61ae : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
61be : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
61ce : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
61de : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
61ee : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
61fe : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
620e : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
621e : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
622e : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
623e : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
624e : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
625e : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
626e : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
627e : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
628e : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
629e : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
62ae : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
62be : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
62ce : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
62de : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
62ee : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
62fe : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
630e : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
631e : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
632e : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
633e : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
634e : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
635e : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
636e : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
6400 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
6410 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
6420 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
6430 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
6440 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
6450 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
6460 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
6470 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
6480 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
6490 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
64a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
64b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
64c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
6500 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
6510 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
6520 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
6530 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
6540 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
6550 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
6560 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
6570 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
6580 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
6590 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
65a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
65b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
65c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
Song4:
6600 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
6610 : __ __ __ BYT 0d 05 3a 20 2d 20 22 07 0f 02 13 0d 01 03 0b 05 : ..: - ".........
6620 : __ __ __ BYT 04 22 20 2d 20 01 12 14 09 13 14 3a 20 22 06 01 : ." - ......: "..
6630 : __ __ __ BYT 04 05 22 20 2d 20 0c 05 0e 07 14 08 3a 20 33 3a : .." - ......: 3:
6640 : __ __ __ BYT 32 33 20 2d 20 03 0f 0d 0d 05 0e 14 3a 20 09 20 : 23 - .......: . 
6650 : __ __ __ BYT 02 05 14 20 19 0f 15 20 04 09 04 0e 27 14 20 14 : ... ... ....'. .
6660 : __ __ __ BYT 08 09 0e 0b 20 14 08 05 20 17 01 12 0d 14 08 20 : .... ... ...... 
6670 : __ __ __ BYT 0f 06 20 16 09 0e 19 0c 20 03 0f 15 0c 04 20 02 : .. ..... ..... .
6680 : __ __ __ BYT 05 20 12 05 10 0c 09 03 01 14 05 04 20 09 0e 20 : . .......... .. 
6690 : __ __ __ BYT 01 0e 19 14 08 09 0e 07 20 04 09 07 09 14 01 0c : ........ .......
66a0 : __ __ __ BYT 2c 20 02 15 14 20 08 05 12 05 20 17 05 20 01 12 : , ... .... .. ..
66b0 : __ __ __ BYT 05 20 3a 33 20 3d 20 3d 20 2d 20 2d 20 00       : . :3 = = - - .
--------------------------------------------------------------------
Song5:
6700 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
6710 : __ __ __ BYT 0d 05 3a 20 2d 20 22 06 05 0d 15 12 20 06 12 05 : ..: - "..... ...
6720 : __ __ __ BYT 05 1a 05 12 22 20 2d 20 01 12 14 09 13 14 3a 20 : ...." - ......: 
6730 : __ __ __ BYT 22 01 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 22 : "...... ......."
6740 : __ __ __ BYT 20 2d 20 0c 05 0e 07 14 08 3a 20 31 3a 35 35 20 :  - ......: 1:55 
6750 : __ __ __ BYT 2d 20 03 0f 0d 0d 05 0e 14 3a 20 13 0f 0e 07 20 : - .......: .... 
6760 : __ __ __ BYT 02 12 0f 15 07 08 14 20 14 0f 20 19 0f 15 20 02 : ....... .. ... .
6770 : __ __ __ BYT 19 20 04 05 05 1a 20 0e 15 14 20 03 0f 2e 20 13 : . .... ... ... .
6780 : __ __ __ BYT 09 0e 03 05 20 31 38 38 39 20 3d 20 3d 20 2d 20 : .... 1889 = = - 
6790 : __ __ __ BYT 2d 20 00                                        : - .
--------------------------------------------------------------------
Song6:
6793 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
67a3 : __ __ __ BYT 0d 05 3a 20 2d 20 22 20 13 0f 0d 05 20 08 0f 15 : ..: - " .... ...
67b3 : __ __ __ BYT 13 05 20 09 0e 20 0c 01 0f 13 22 20 2d 20 01 12 : .. .. ...." - ..
67c3 : __ __ __ BYT 14 09 13 14 3a 20 22 03 12 09 13 10 13 22 20 2d : ....: "......" -
67d3 : __ __ __ BYT 20 0c 05 0e 07 14 08 3a 20 33 3a 32 34 20 2d 20 :  ......: 3:24 - 
67e3 : __ __ __ BYT 03 0f 0d 0d 05 0e 14 3a 20 19 15 1a 0f 20 0b 15 : .......: .... ..
67f3 : __ __ __ BYT 13 08 09 12 0f 20 02 05 14 14 05 12 20 0e 0f 14 : ..... ...... ...
6803 : __ __ __ BYT 20 13 15 05 20 0d 05 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
6813 : __ __ __ BYT 20 0d 15 13 09 03 20 3a 1b 20 01 14 20 0c 05 01 :  ..... :. .. ...
6823 : __ __ __ BYT 13 14 20 14 08 09 13 20 17 01 13 20 06 0f 12 20 : .. .... ... ... 
6833 : __ __ __ BYT 01 20 06 15 0e 20 0d 15 13 09 03 20 04 09 13 03 : . ... ..... ....
6843 : __ __ __ BYT 2c 20 0e 0f 17 20 14 08 01 14 20 14 08 05 20 03 : , ... .... ... .
6853 : __ __ __ BYT 0f 04 09 0e 07 20 09 13 20 04 0f 0e 05 20 3a 04 : ..... .. .... :.
6863 : __ __ __ BYT 2e 20 02 15 14 20 08 05 19 2c 20 09 20 17 01 0e : . ... ..., . ...
6873 : __ __ __ BYT 0e 01 20 13 05 05 20 17 08 01 14 20 19 0f 15 20 : .. ... .... ... 
6883 : __ __ __ BYT 07 15 19 13 20 0c 0f 0f 0b 09 0e 07 20 01 14 20 : .... ....... .. 
6893 : __ __ __ BYT 14 08 09 13 20 17 08 01 14 20 19 0f 15 20 14 08 : .... .... ... ..
68a3 : __ __ __ BYT 09 0e 0b 20 0f 06 20 09 14 3f 20 49 20 12 05 01 : ... .. ..? I ...
68b3 : __ __ __ BYT 0c 0c 19 20 04 0f 20 17 01 0e 0e 01 20 13 05 05 : ... .. ..... ...
68c3 : __ __ __ BYT 20 06 05 05 04 02 01 03 0b 20 0f 0e 20 14 08 09 :  ........ .. ...
68d3 : __ __ __ BYT 13 2c 20 05 16 05 0e 20 09 06 20 19 0f 15 20 14 : ., .... .. ... .
68e3 : __ __ __ BYT 08 09 0e 0b 20 09 14 27 13 20 13 08 09 14 05 21 : .... ..'. .....!
68f3 : __ __ __ BYT 20 3d 20 3d 20 2d 20 2d 20 00                   :  = = - - .
--------------------------------------------------------------------
frame_wait:
.l1:
22e5 : ad 26 9f LDA $9f26 
22e8 : 0a __ __ ASL
22e9 : 30 fa __ BMI $22e5 ; (frame_wait.l1 + 0)
.l4:
22eb : ad 26 9f LDA $9f26 
22ee : 0a __ __ ASL
22ef : 10 fa __ BPL $22eb ; (frame_wait.l4 + 0)
.s1001:
22f1 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
22f2 : 38 __ __ SEC
22f3 : a9 00 __ LDA #$00
22f5 : e5 3b __ SBC ACCU + 0 
22f7 : 85 3b __ STA ACCU + 0 
22f9 : a9 00 __ LDA #$00
22fb : e5 3c __ SBC ACCU + 1 
22fd : 85 3c __ STA ACCU + 1 
22ff : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
25a3 : 38 __ __ SEC
25a4 : a9 00 __ LDA #$00
25a6 : e5 23 __ SBC WORK + 0 
25a8 : 85 23 __ STA WORK + 0 
25aa : a9 00 __ LDA #$00
25ac : e5 24 __ SBC WORK + 1 
25ae : 85 24 __ STA WORK + 1 
25b0 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
25b1 : a5 3c __ LDA ACCU + 1 
25b3 : d0 31 __ BNE $25e6 ; (divmod + 53)
25b5 : a5 24 __ LDA WORK + 1 
25b7 : d0 1e __ BNE $25d7 ; (divmod + 38)
25b9 : 85 26 __ STA WORK + 3 
25bb : a2 04 __ LDX #$04
25bd : 06 3b __ ASL ACCU + 0 
25bf : 2a __ __ ROL
25c0 : c5 23 __ CMP WORK + 0 
25c2 : 90 02 __ BCC $25c6 ; (divmod + 21)
25c4 : e5 23 __ SBC WORK + 0 
25c6 : 26 3b __ ROL ACCU + 0 
25c8 : 2a __ __ ROL
25c9 : c5 23 __ CMP WORK + 0 
25cb : 90 02 __ BCC $25cf ; (divmod + 30)
25cd : e5 23 __ SBC WORK + 0 
25cf : 26 3b __ ROL ACCU + 0 
25d1 : ca __ __ DEX
25d2 : d0 eb __ BNE $25bf ; (divmod + 14)
25d4 : 85 25 __ STA WORK + 2 
25d6 : 60 __ __ RTS
25d7 : a5 3b __ LDA ACCU + 0 
25d9 : 85 25 __ STA WORK + 2 
25db : a5 3c __ LDA ACCU + 1 
25dd : 85 26 __ STA WORK + 3 
25df : a9 00 __ LDA #$00
25e1 : 85 3b __ STA ACCU + 0 
25e3 : 85 3c __ STA ACCU + 1 
25e5 : 60 __ __ RTS
25e6 : a5 24 __ LDA WORK + 1 
25e8 : d0 1f __ BNE $2609 ; (divmod + 88)
25ea : a5 23 __ LDA WORK + 0 
25ec : 30 1b __ BMI $2609 ; (divmod + 88)
25ee : a9 00 __ LDA #$00
25f0 : 85 26 __ STA WORK + 3 
25f2 : a2 10 __ LDX #$10
25f4 : 06 3b __ ASL ACCU + 0 
25f6 : 26 3c __ ROL ACCU + 1 
25f8 : 2a __ __ ROL
25f9 : c5 23 __ CMP WORK + 0 
25fb : 90 02 __ BCC $25ff ; (divmod + 78)
25fd : e5 23 __ SBC WORK + 0 
25ff : 26 3b __ ROL ACCU + 0 
2601 : 26 3c __ ROL ACCU + 1 
2603 : ca __ __ DEX
2604 : d0 f2 __ BNE $25f8 ; (divmod + 71)
2606 : 85 25 __ STA WORK + 2 
2608 : 60 __ __ RTS
2609 : a9 00 __ LDA #$00
260b : 85 25 __ STA WORK + 2 
260d : 85 26 __ STA WORK + 3 
260f : 84 22 __ STY $22 
2611 : a0 10 __ LDY #$10
2613 : 18 __ __ CLC
2614 : 26 3b __ ROL ACCU + 0 
2616 : 26 3c __ ROL ACCU + 1 
2618 : 26 25 __ ROL WORK + 2 
261a : 26 26 __ ROL WORK + 3 
261c : 38 __ __ SEC
261d : a5 25 __ LDA WORK + 2 
261f : e5 23 __ SBC WORK + 0 
2621 : aa __ __ TAX
2622 : a5 26 __ LDA WORK + 3 
2624 : e5 24 __ SBC WORK + 1 
2626 : 90 04 __ BCC $262c ; (divmod + 123)
2628 : 86 25 __ STX WORK + 2 
262a : 85 26 __ STA WORK + 3 
262c : 88 __ __ DEY
262d : d0 e5 __ BNE $2614 ; (divmod + 99)
262f : 26 3b __ ROL ACCU + 0 
2631 : 26 3c __ ROL ACCU + 1 
2633 : a4 22 __ LDY $22 
2635 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
2636 : 24 3c __ BIT ACCU + 1 
2638 : 10 0d __ BPL $2647 ; (mods16 + 17)
263a : 20 f2 22 JSR $22f2 ; (negaccu + 0)
263d : 24 24 __ BIT WORK + 1 
263f : 10 0d __ BPL $264e ; (mods16 + 24)
2641 : 20 a3 25 JSR $25a3 ; (negtmp + 0)
2644 : 4c b1 25 JMP $25b1 ; (divmod + 0)
2647 : 24 24 __ BIT WORK + 1 
2649 : 10 f9 __ BPL $2644 ; (mods16 + 14)
264b : 20 a3 25 JSR $25a3 ; (negtmp + 0)
264e : 20 b1 25 JSR $25b1 ; (divmod + 0)
2651 : 38 __ __ SEC
2652 : a9 00 __ LDA #$00
2654 : e5 25 __ SBC WORK + 2 
2656 : 85 25 __ STA WORK + 2 
2658 : a9 00 __ LDA #$00
265a : e5 26 __ SBC WORK + 3 
265c : 85 26 __ STA WORK + 3 
265e : 60 __ __ RTS
--------------------------------------------------------------------
__multab32L:
265f : __ __ __ BYT 00 20 40 60 80 a0 c0 e0 00 20 40 60 80 a0 c0 e0 : . @`..... @`....
--------------------------------------------------------------------
__multab32H:
266f : __ __ __ BYT 00 00 00 00 00 00 00 00 01 01 01 01 01 01 01 01 : ................
