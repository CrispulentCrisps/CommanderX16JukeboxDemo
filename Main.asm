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
080e : 8e ff 1f STX $1fff ; (spentry + 0)
0811 : a9 be __ LDA #$be
0813 : 85 39 __ STA IP + 0 
0815 : a9 56 __ LDA #$56
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 5b __ LDA #$5b
081c : e9 56 __ SBC #$56
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
0830 : a9 80 __ LDA #$80
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
1fff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 e3 0b JSR $0be3 ; (zsm_irq_init.s0 + 0)
0883 : 20 c0 0d JSR $0dc0 ; (ClearVERAScreen.s0 + 0)
0886 : 20 03 0e JSR $0e03 ; (SetUpSprites.s0 + 0)
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
08cc : a9 00 __ LDA #$00
08ce : 85 50 __ STA T1 + 0 
08d0 : 85 51 __ STA T1 + 1 
08d2 : 85 52 __ STA T2 + 0 
08d4 : 85 53 __ STA T3 + 0 
08d6 : 85 54 __ STA T4 + 0 
.l3:
08d8 : 20 8e 1a JSR $1a8e ; (getchx.s0 + 0)
08db : a5 3b __ LDA ACCU + 0 
08dd : 85 55 __ STA T5 + 0 
08df : a9 30 __ LDA #$30
08e1 : 8d 2c 9f STA $9f2c 
08e4 : ee d6 44 INC $44d6 ; (p + 0)
08e7 : d0 03 __ BNE $08ec ; (main.s1022 + 0)
.s1021:
08e9 : ee d7 44 INC $44d7 ; (p + 1)
.s1022:
08ec : ad d8 44 LDA $44d8 ; (Phase + 0)
08ef : 18 __ __ CLC
08f0 : 69 01 __ ADC #$01
08f2 : 85 32 __ STA P5 
08f4 : 8d d8 44 STA $44d8 ; (Phase + 0)
08f7 : ad d9 44 LDA $44d9 ; (Phase + 1)
08fa : 69 00 __ ADC #$00
08fc : 85 33 __ STA P6 
08fe : 8d d9 44 STA $44d9 ; (Phase + 1)
0901 : ad da 44 LDA $44da ; (Phase2 + 0)
0904 : 18 __ __ CLC
0905 : 69 01 __ ADC #$01
0907 : 85 34 __ STA P7 
0909 : 8d da 44 STA $44da ; (Phase2 + 0)
090c : ad db 44 LDA $44db ; (Phase2 + 1)
090f : 69 00 __ ADC #$00
0911 : 85 35 __ STA P8 
0913 : 8d db 44 STA $44db ; (Phase2 + 1)
0916 : ad dc 44 LDA $44dc ; (Phase3 + 0)
0919 : 18 __ __ CLC
091a : 69 01 __ ADC #$01
091c : 85 36 __ STA P9 
091e : 8d dc 44 STA $44dc ; (Phase3 + 0)
0921 : ad dd 44 LDA $44dd ; (Phase3 + 1)
0924 : 69 00 __ ADC #$00
0926 : 85 37 __ STA P10 
0928 : 8d dd 44 STA $44dd ; (Phase3 + 1)
092b : 20 c9 1a JSR $1ac9 ; (MoveSprites.s0 + 0)
092e : a5 53 __ LDA T3 + 0 
0930 : c9 01 __ CMP #$01
0932 : f0 07 __ BEQ $093b ; (main.s5 + 0)
.s6:
0934 : a9 00 __ LDA #$00
0936 : 8d 41 46 STA $4641 ; (PalTimer + 0)
0939 : f0 2b __ BEQ $0966 ; (main.s69 + 0)
.s5:
093b : a5 52 __ LDA T2 + 0 
093d : 8d fc 9e STA $9efc ; (sstack + 2)
0940 : a9 00 __ LDA #$00
0942 : 8d fd 9e STA $9efd ; (sstack + 3)
0945 : ad 40 46 LDA $4640 ; (LastSelectedSong + 0)
0948 : 8d fe 9e STA $9efe ; (sstack + 4)
094b : a9 00 __ LDA #$00
094d : 8d ff 9e STA $9eff ; (sstack + 5)
0950 : 20 c4 1c JSR $1cc4 ; (PlayZSM.s0 + 0)
0953 : a5 52 __ LDA T2 + 0 
0955 : 8d 40 46 STA $4640 ; (LastSelectedSong + 0)
0958 : ad 41 46 LDA $4641 ; (PalTimer + 0)
095b : 18 __ __ CLC
095c : 69 01 __ ADC #$01
095e : 8d 41 46 STA $4641 ; (PalTimer + 0)
0961 : ad 42 46 LDA $4642 ; (PalTimer + 1)
0964 : 69 00 __ ADC #$00
.s69:
0966 : 8d 42 46 STA $4642 ; (PalTimer + 1)
0969 : e6 54 __ INC T4 + 0 
096b : a5 54 __ LDA T4 + 0 
096d : c9 03 __ CMP #$03
096f : 90 2d __ BCC $099e ; (main.s70 + 0)
.s8:
0971 : a9 10 __ LDA #$10
0973 : 85 34 __ STA P7 
0975 : a9 00 __ LDA #$00
0977 : 85 35 __ STA P8 
0979 : 85 36 __ STA P9 
097b : 85 37 __ STA P10 
097d : a9 06 __ LDA #$06
097f : 8d fa 9e STA $9efa ; (sstack + 0)
0982 : a9 00 __ LDA #$00
0984 : 8d fb 9e STA $9efb ; (sstack + 1)
0987 : 8d fd 9e STA $9efd ; (sstack + 3)
098a : a9 0a __ LDA #$0a
098c : 8d fc 9e STA $9efc ; (sstack + 2)
098f : a9 62 __ LDA #$62
0991 : 85 32 __ STA P5 
0993 : a9 2b __ LDA #$2b
0995 : 85 33 __ STA P6 
0997 : 20 f6 20 JSR $20f6 ; (SetPaletteIndex.s0 + 0)
099a : a9 00 __ LDA #$00
099c : 85 54 __ STA T4 + 0 
.s70:
099e : ad 42 46 LDA $4642 ; (PalTimer + 1)
09a1 : 30 5f __ BMI $0a02 ; (main.s13 + 0)
.s1015:
09a3 : d0 07 __ BNE $09ac ; (main.s11 + 0)
.s1014:
09a5 : a9 03 __ LDA #$03
09a7 : cd 41 46 CMP $4641 ; (PalTimer + 0)
09aa : b0 56 __ BCS $0a02 ; (main.s13 + 0)
.s11:
09ac : a9 60 __ LDA #$60
09ae : 85 34 __ STA P7 
09b0 : a9 00 __ LDA #$00
09b2 : 85 35 __ STA P8 
09b4 : 85 36 __ STA P9 
09b6 : 85 37 __ STA P10 
09b8 : 8d fa 9e STA $9efa ; (sstack + 0)
09bb : 8d fb 9e STA $9efb ; (sstack + 1)
09be : a9 05 __ LDA #$05
09c0 : 8d fc 9e STA $9efc ; (sstack + 2)
09c3 : a9 00 __ LDA #$00
09c5 : 8d fd 9e STA $9efd ; (sstack + 3)
09c8 : ee 43 46 INC $4643 ; (PalIndex + 0)
09cb : d0 03 __ BNE $09d0 ; (main.s1024 + 0)
.s1023:
09cd : ee 44 46 INC $4644 ; (PalIndex + 1)
.s1024:
09d0 : a9 c2 __ LDA #$c2
09d2 : 85 32 __ STA P5 
09d4 : a9 2b __ LDA #$2b
09d6 : 85 33 __ STA P6 
09d8 : 20 f6 20 JSR $20f6 ; (SetPaletteIndex.s0 + 0)
09db : a9 50 __ LDA #$50
09dd : 85 34 __ STA P7 
09df : a9 00 __ LDA #$00
09e1 : 8d fa 9e STA $9efa ; (sstack + 0)
09e4 : 8d fb 9e STA $9efb ; (sstack + 1)
09e7 : 8d fd 9e STA $9efd ; (sstack + 3)
09ea : a9 10 __ LDA #$10
09ec : 8d fc 9e STA $9efc ; (sstack + 2)
09ef : a9 45 __ LDA #$45
09f1 : 85 32 __ STA P5 
09f3 : a9 46 __ LDA #$46
09f5 : 85 33 __ STA P6 
09f7 : 20 f6 20 JSR $20f6 ; (SetPaletteIndex.s0 + 0)
09fa : a9 00 __ LDA #$00
09fc : 8d 41 46 STA $4641 ; (PalTimer + 0)
09ff : 8d 42 46 STA $4642 ; (PalTimer + 1)
.s13:
0a02 : a9 03 __ LDA #$03
0a04 : 8d 2c 9f STA $9f2c 
0a07 : a5 55 __ LDA T5 + 0 
0a09 : c9 44 __ CMP #$44
0a0b : d0 0c __ BNE $0a19 ; (main.s15 + 0)
.s17:
0a0d : a5 52 __ LDA T2 + 0 
0a0f : cd 65 46 CMP $4665 ; (MaxSong + 0)
0a12 : b0 03 __ BCS $0a17 ; (main.s1020 + 0)
0a14 : 4c de 0b JMP $0bde ; (main.s14 + 0)
.s1020:
0a17 : a5 55 __ LDA T5 + 0 
.s15:
0a19 : c9 41 __ CMP #$41
0a1b : d0 21 __ BNE $0a3e ; (main.s16 + 0)
.s21:
0a1d : a5 52 __ LDA T2 + 0 
0a1f : f0 1d __ BEQ $0a3e ; (main.s16 + 0)
.s18:
0a21 : c6 52 __ DEC T2 + 0 
.s83:
0a23 : 20 a9 21 JSR $21a9 ; (ResetChars.s0 + 0)
0a26 : a9 00 __ LDA #$00
0a28 : 8d 66 46 STA $4666 ; (off1 + 0)
0a2b : 8d 67 46 STA $4667 ; (off1 + 1)
0a2e : a9 80 __ LDA #$80
0a30 : 8d 37 9f STA $9f37 
0a33 : a9 fd __ LDA #$fd
0a35 : 8d 38 9f STA $9f38 
0a38 : a9 00 __ LDA #$00
0a3a : 85 50 __ STA T1 + 0 
0a3c : 85 51 __ STA T1 + 1 
.s16:
0a3e : a5 53 __ LDA T3 + 0 
0a40 : 85 30 __ STA P3 
0a42 : a5 55 __ LDA T5 + 0 
0a44 : 85 31 __ STA P4 
0a46 : 20 ce 21 JSR $21ce ; (Control.s0 + 0)
0a49 : a5 3b __ LDA ACCU + 0 
0a4b : 85 53 __ STA T3 + 0 
0a4d : 38 __ __ SEC
0a4e : a5 50 __ LDA T1 + 0 
0a50 : e9 80 __ SBC #$80
0a52 : 8d 37 9f STA $9f37 
0a55 : a5 51 __ LDA T1 + 1 
0a57 : e9 02 __ SBC #$02
0a59 : 8d 38 9f STA $9f38 
0a5c : 20 44 22 JSR $2244 ; (UpdateVolume.s0 + 0)
0a5f : ad de 44 LDA $44de ; (FrameCount + 0)
0a62 : 85 3b __ STA ACCU + 0 
0a64 : ad df 44 LDA $44df ; (FrameCount + 1)
0a67 : 85 3c __ STA ACCU + 1 
0a69 : a9 08 __ LDA #$08
0a6b : 85 23 __ STA WORK + 0 
0a6d : a9 00 __ LDA #$00
0a6f : 85 24 __ STA WORK + 1 
0a71 : 20 0c 24 JSR $240c ; (mods16 + 0)
0a74 : a5 26 __ LDA WORK + 3 
0a76 : f0 03 __ BEQ $0a7b ; (main.s1007 + 0)
0a78 : 4c 40 0b JMP $0b40 ; (main.s24 + 0)
.s1007:
0a7b : a5 25 __ LDA WORK + 2 
0a7d : c9 01 __ CMP #$01
0a7f : f0 03 __ BEQ $0a84 ; (main.s22 + 0)
0a81 : 4c 40 0b JMP $0b40 ; (main.s24 + 0)
.s22:
0a84 : ad 66 46 LDA $4666 ; (off1 + 0)
0a87 : 85 55 __ STA T5 + 0 
0a89 : 29 7f __ AND #$7f
0a8b : 0a __ __ ASL
0a8c : 8d 20 9f STA $9f20 
0a8f : ad 25 9f LDA $9f25 
0a92 : 29 fe __ AND #$fe
0a94 : 8d 25 9f STA $9f25 
0a97 : a9 b0 __ LDA #$b0
0a99 : 8d 21 9f STA $9f21 
0a9c : a9 11 __ LDA #$11
0a9e : 8d 22 9f STA $9f22 
0aa1 : a5 52 __ LDA T2 + 0 
0aa3 : c9 03 __ CMP #$03
0aa5 : d0 1c __ BNE $0ac3 ; (main.s1005 + 0)
.s42:
0aa7 : a5 55 __ LDA T5 + 0 
0aa9 : 85 3b __ STA ACCU + 0 
0aab : ad 67 46 LDA $4667 ; (off1 + 1)
0aae : 85 3c __ STA ACCU + 1 
0ab0 : a9 c3 __ LDA #$c3
0ab2 : 85 23 __ STA WORK + 0 
0ab4 : a9 00 __ LDA #$00
0ab6 : 85 24 __ STA WORK + 1 
0ab8 : 20 87 23 JSR $2387 ; (divmod + 0)
0abb : a6 25 __ LDX WORK + 2 
0abd : bd 00 55 LDA $5500,x ; (Song3 + 0)
0ac0 : 4c ac 0b JMP $0bac ; (main.s75 + 0)
.s1005:
0ac3 : b0 03 __ BCS $0ac8 ; (main.s1002 + 0)
0ac5 : 4c 64 0b JMP $0b64 ; (main.s54 + 0)
.s1002:
0ac8 : c9 04 __ CMP #$04
0aca : d0 40 __ BNE $0b0c ; (main.s26 + 0)
.s47:
0acc : a5 55 __ LDA T5 + 0 
0ace : 85 3b __ STA ACCU + 0 
0ad0 : ad 67 46 LDA $4667 ; (off1 + 1)
0ad3 : 85 3c __ STA ACCU + 1 
0ad5 : a9 c3 __ LDA #$c3
0ad7 : 85 23 __ STA WORK + 0 
0ad9 : a9 00 __ LDA #$00
0adb : 85 24 __ STA WORK + 1 
0add : 20 87 23 JSR $2387 ; (divmod + 0)
0ae0 : a6 25 __ LDX WORK + 2 
0ae2 : bd 00 56 LDA $5600,x ; (Song4 + 0)
0ae5 : f0 25 __ BEQ $0b0c ; (main.s26 + 0)
.s48:
0ae7 : a5 55 __ LDA T5 + 0 
0ae9 : 85 3b __ STA ACCU + 0 
0aeb : ad 67 46 LDA $4667 ; (off1 + 1)
0aee : 85 3c __ STA ACCU + 1 
0af0 : a9 bd __ LDA #$bd
0af2 : 85 23 __ STA WORK + 0 
0af4 : a9 00 __ LDA #$00
0af6 : 85 24 __ STA WORK + 1 
0af8 : 20 87 23 JSR $2387 ; (divmod + 0)
0afb : a6 25 __ LDX WORK + 2 
0afd : bd 00 56 LDA $5600,x ; (Song4 + 0)
.s84:
0b00 : 8d 23 9f STA $9f23 
0b03 : a5 55 __ LDA T5 + 0 
0b05 : 29 0f __ AND #$0f
0b07 : 09 80 __ ORA #$80
0b09 : 8d 23 9f STA $9f23 
.s26:
0b0c : a9 80 __ LDA #$80
0b0e : 85 34 __ STA P7 
0b10 : a9 00 __ LDA #$00
0b12 : 85 35 __ STA P8 
0b14 : 85 36 __ STA P9 
0b16 : 85 37 __ STA P10 
0b18 : 8d fa 9e STA $9efa ; (sstack + 0)
0b1b : 8d fb 9e STA $9efb ; (sstack + 1)
0b1e : a9 10 __ LDA #$10
0b20 : 8d fc 9e STA $9efc ; (sstack + 2)
0b23 : a9 00 __ LDA #$00
0b25 : 8d fd 9e STA $9efd ; (sstack + 3)
0b28 : 18 __ __ CLC
0b29 : a5 55 __ LDA T5 + 0 
0b2b : 69 01 __ ADC #$01
0b2d : 8d 66 46 STA $4666 ; (off1 + 0)
0b30 : 90 03 __ BCC $0b35 ; (main.s1026 + 0)
.s1025:
0b32 : ee 67 46 INC $4667 ; (off1 + 1)
.s1026:
0b35 : a9 80 __ LDA #$80
0b37 : 85 32 __ STA P5 
0b39 : a9 40 __ LDA #$40
0b3b : 85 33 __ STA P6 
0b3d : 20 f6 20 JSR $20f6 ; (SetPaletteIndex.s0 + 0)
.s24:
0b40 : a9 01 __ LDA #$01
0b42 : 8d 2c 9f STA $9f2c 
0b45 : 20 2f 1f JSR $1f2f ; (zsm_fill.s0 + 0)
0b48 : a9 00 __ LDA #$00
0b4a : 8d 2c 9f STA $9f2c 
0b4d : 20 5e 23 JSR $235e ; (frame_wait.l1 + 0)
0b50 : ee de 44 INC $44de ; (FrameCount + 0)
0b53 : d0 03 __ BNE $0b58 ; (main.s1028 + 0)
.s1027:
0b55 : ee df 44 INC $44df ; (FrameCount + 1)
.s1028:
0b58 : e6 50 __ INC T1 + 0 
0b5a : f0 03 __ BEQ $0b5f ; (main.s1029 + 0)
0b5c : 4c d8 08 JMP $08d8 ; (main.l3 + 0)
.s1029:
0b5f : e6 51 __ INC T1 + 1 
0b61 : 4c d8 08 JMP $08d8 ; (main.l3 + 0)
.s54:
0b64 : 09 00 __ ORA #$00
0b66 : d0 20 __ BNE $0b88 ; (main.s1004 + 0)
.s27:
0b68 : a5 55 __ LDA T5 + 0 
0b6a : 85 3b __ STA ACCU + 0 
0b6c : ad 67 46 LDA $4667 ; (off1 + 1)
0b6f : 85 3c __ STA ACCU + 1 
0b71 : a9 1d __ LDA #$1d
0b73 : 85 23 __ STA WORK + 0 
0b75 : a9 06 __ LDA #$06
0b77 : 85 24 __ STA WORK + 1 
0b79 : 20 87 23 JSR $2387 ; (divmod + 0)
0b7c : 18 __ __ CLC
0b7d : a9 69 __ LDA #$69
0b7f : 65 25 __ ADC WORK + 2 
0b81 : 85 47 __ STA T6 + 0 
0b83 : a9 46 __ LDA #$46
0b85 : 4c d3 0b JMP $0bd3 ; (main.s1019 + 0)
.s1004:
0b88 : c9 01 __ CMP #$01
0b8a : f0 2a __ BEQ $0bb6 ; (main.s32 + 0)
.s1003:
0b8c : c9 02 __ CMP #$02
0b8e : f0 03 __ BEQ $0b93 ; (main.s37 + 0)
0b90 : 4c 0c 0b JMP $0b0c ; (main.s26 + 0)
.s37:
0b93 : a5 55 __ LDA T5 + 0 
0b95 : 85 3b __ STA ACCU + 0 
0b97 : ad 67 46 LDA $4667 ; (off1 + 1)
0b9a : 85 3c __ STA ACCU + 1 
0b9c : a9 c5 __ LDA #$c5
0b9e : 85 23 __ STA WORK + 0 
0ba0 : a9 00 __ LDA #$00
0ba2 : 85 24 __ STA WORK + 1 
0ba4 : 20 87 23 JSR $2387 ; (divmod + 0)
0ba7 : a6 25 __ LDX WORK + 2 
0ba9 : bd 00 54 LDA $5400,x ; (Song2 + 0)
.s75:
0bac : 09 00 __ ORA #$00
0bae : d0 03 __ BNE $0bb3 ; (main.s75 + 7)
0bb0 : 4c 0c 0b JMP $0b0c ; (main.s26 + 0)
0bb3 : 4c 00 0b JMP $0b00 ; (main.s84 + 0)
.s32:
0bb6 : a5 55 __ LDA T5 + 0 
0bb8 : 85 3b __ STA ACCU + 0 
0bba : ad 67 46 LDA $4667 ; (off1 + 1)
0bbd : 85 3c __ STA ACCU + 1 
0bbf : a9 5c __ LDA #$5c
0bc1 : 85 23 __ STA WORK + 0 
0bc3 : a9 07 __ LDA #$07
0bc5 : 85 24 __ STA WORK + 1 
0bc7 : 20 87 23 JSR $2387 ; (divmod + 0)
0bca : 18 __ __ CLC
0bcb : a9 87 __ LDA #$87
0bcd : 65 25 __ ADC WORK + 2 
0bcf : 85 47 __ STA T6 + 0 
0bd1 : a9 4c __ LDA #$4c
.s1019:
0bd3 : 65 26 __ ADC WORK + 3 
0bd5 : 85 48 __ STA T6 + 1 
0bd7 : a0 00 __ LDY #$00
0bd9 : b1 47 __ LDA (T6 + 0),y 
0bdb : 4c ac 0b JMP $0bac ; (main.s75 + 0)
.s14:
0bde : e6 52 __ INC T2 + 0 
0be0 : 4c 23 0a JMP $0a23 ; (main.s83 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0be3 : 78 __ __ SEI
0be4 : ad 14 03 LDA $0314 
0be7 : 8d e4 53 STA $53e4 ; (oirq + 0)
0bea : ad 15 03 LDA $0315 
0bed : 8d e5 53 STA $53e5 ; (oirq + 1)
0bf0 : a9 00 __ LDA #$00
0bf2 : 8d 14 03 STA $0314 
0bf5 : a9 0c __ LDA #$0c
0bf7 : 8d 15 03 STA $0315 
0bfa : 58 __ __ CLI
.s1001:
0bfb : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
53e4 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0c00 : 20 06 0c JSR $0c06 ; (irq.s1000 + 0)
0c03 : 6c e4 53 JMP ($53e4)
--------------------------------------------------------------------
irq:
.s1000:
0c06 : a5 2d __ LDA P0 
0c08 : 48 __ __ PHA
0c09 : a5 2e __ LDA P1 
0c0b : 48 __ __ PHA
0c0c : a5 3b __ LDA ACCU + 0 
0c0e : 48 __ __ PHA
0c0f : a5 3c __ LDA ACCU + 1 
0c11 : 48 __ __ PHA
0c12 : a5 47 __ LDA T0 + 0 
0c14 : 48 __ __ PHA
0c15 : a5 48 __ LDA $48 
0c17 : 48 __ __ PHA
0c18 : a5 49 __ LDA $49 
0c1a : 48 __ __ PHA
0c1b : a5 4a __ LDA $4a 
0c1d : 48 __ __ PHA
0c1e : a5 4b __ LDA $4b 
0c20 : 48 __ __ PHA
0c21 : a5 4c __ LDA $4c 
0c23 : 48 __ __ PHA
0c24 : a5 4d __ LDA $4d 
0c26 : 48 __ __ PHA
0c27 : a5 4e __ LDA $4e 
0c29 : 48 __ __ PHA
0c2a : a5 4f __ LDA $4f 
0c2c : 48 __ __ PHA
0c2d : a5 50 __ LDA $50 
0c2f : 48 __ __ PHA
.s0:
0c30 : ad 35 24 LDA $2435 ; (zsm_playing + 0)
0c33 : f0 08 __ BEQ $0c3d ; (irq.s1001 + 0)
.s4:
0c35 : ad 36 24 LDA $2436 ; (zsm_finished + 0)
0c38 : d0 03 __ BNE $0c3d ; (irq.s1001 + 0)
.s1:
0c3a : 20 68 0c JSR $0c68 ; (zsm_play.s0 + 0)
.s1001:
0c3d : 68 __ __ PLA
0c3e : 85 50 __ STA $50 
0c40 : 68 __ __ PLA
0c41 : 85 4f __ STA $4f 
0c43 : 68 __ __ PLA
0c44 : 85 4e __ STA $4e 
0c46 : 68 __ __ PLA
0c47 : 85 4d __ STA $4d 
0c49 : 68 __ __ PLA
0c4a : 85 4c __ STA $4c 
0c4c : 68 __ __ PLA
0c4d : 85 4b __ STA $4b 
0c4f : 68 __ __ PLA
0c50 : 85 4a __ STA $4a 
0c52 : 68 __ __ PLA
0c53 : 85 49 __ STA $49 
0c55 : 68 __ __ PLA
0c56 : 85 48 __ STA $48 
0c58 : 68 __ __ PLA
0c59 : 85 47 __ STA T0 + 0 
0c5b : 68 __ __ PLA
0c5c : 85 3c __ STA ACCU + 1 
0c5e : 68 __ __ PLA
0c5f : 85 3b __ STA ACCU + 0 
0c61 : 68 __ __ PLA
0c62 : 85 2e __ STA P1 
0c64 : 68 __ __ PLA
0c65 : 85 2d __ STA P0 
0c67 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
2435 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
2436 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
0c68 : ad 37 24 LDA $2437 ; (zsm_paused + 0)
0c6b : f0 01 __ BEQ $0c6e ; (zsm_play.s2 + 0)
0c6d : 60 __ __ RTS
.s2:
0c6e : ad e6 53 LDA $53e6 ; (zsm_delay + 0)
0c71 : f0 03 __ BEQ $0c76 ; (zsm_play.s5 + 0)
0c73 : 4c a3 0d JMP $0da3 ; (zsm_play.s4 + 0)
.s5:
0c76 : ad 25 9f LDA $9f25 
0c79 : 85 47 __ STA T0 + 0 
0c7b : ad 25 9f LDA $9f25 
0c7e : 29 fe __ AND #$fe
0c80 : 8d 25 9f STA $9f25 
0c83 : ad 20 9f LDA $9f20 
0c86 : 85 49 __ STA T2 + 0 
0c88 : ad 21 9f LDA $9f21 
0c8b : 85 4a __ STA T2 + 1 
0c8d : ad 22 9f LDA $9f22 
0c90 : 85 48 __ STA T1 + 0 
.l8:
0c92 : ad e7 53 LDA $53e7 ; (zsm_pos + 0)
0c95 : 85 4b __ STA T3 + 0 
0c97 : 18 __ __ CLC
0c98 : 69 01 __ ADC #$01
0c9a : 85 4d __ STA T4 + 0 
0c9c : 8d e7 53 STA $53e7 ; (zsm_pos + 0)
0c9f : ad e8 53 LDA $53e8 ; (zsm_pos + 1)
0ca2 : aa __ __ TAX
0ca3 : 69 00 __ ADC #$00
0ca5 : 85 4e __ STA T4 + 1 
0ca7 : 8d e8 53 STA $53e8 ; (zsm_pos + 1)
0caa : 18 __ __ CLC
0cab : a9 be __ LDA #$be
0cad : 65 4b __ ADC T3 + 0 
0caf : 85 3b __ STA ACCU + 0 
0cb1 : 8a __ __ TXA
0cb2 : 29 03 __ AND #$03
0cb4 : 69 56 __ ADC #$56
0cb6 : 85 3c __ STA ACCU + 1 
0cb8 : a0 00 __ LDY #$00
0cba : b1 3b __ LDA (ACCU + 0),y 
0cbc : c9 40 __ CMP #$40
0cbe : b0 03 __ BCS $0cc3 ; (zsm_play.s12 + 0)
0cc0 : 4c 6e 0d JMP $0d6e ; (zsm_play.s11 + 0)
.s12:
0cc3 : d0 22 __ BNE $0ce7 ; (zsm_play.s15 + 0)
.s14:
0cc5 : 18 __ __ CLC
0cc6 : a9 be __ LDA #$be
0cc8 : 65 4d __ ADC T4 + 0 
0cca : 85 4b __ STA T3 + 0 
0ccc : a5 4e __ LDA T4 + 1 
0cce : 29 03 __ AND #$03
0cd0 : 69 56 __ ADC #$56
0cd2 : 85 4c __ STA T3 + 1 
0cd4 : b1 4b __ LDA (T3 + 0),y 
0cd6 : 29 3f __ AND #$3f
0cd8 : 18 __ __ CLC
0cd9 : 65 4d __ ADC T4 + 0 
0cdb : 8d e7 53 STA $53e7 ; (zsm_pos + 0)
0cde : 98 __ __ TYA
0cdf : 65 4e __ ADC T4 + 1 
0ce1 : 8d e8 53 STA $53e8 ; (zsm_pos + 1)
0ce4 : 4c 92 0c JMP $0c92 ; (zsm_play.l8 + 0)
.s15:
0ce7 : 09 00 __ ORA #$00
0ce9 : 30 5b __ BMI $0d46 ; (zsm_play.s18 + 0)
.s17:
0ceb : 29 3f __ AND #$3f
0ced : f0 a3 __ BEQ $0c92 ; (zsm_play.l8 + 0)
.s29:
0cef : 84 50 __ STY T7 + 0 
0cf1 : 85 4f __ STA T6 + 0 
0cf3 : 18 __ __ CLC
.l1012:
0cf4 : a9 be __ LDA #$be
0cf6 : 6d e7 53 ADC $53e7 ; (zsm_pos + 0)
0cf9 : 85 4d __ STA T4 + 0 
0cfb : ad e8 53 LDA $53e8 ; (zsm_pos + 1)
0cfe : 29 03 __ AND #$03
0d00 : 69 56 __ ADC #$56
0d02 : 85 4e __ STA T4 + 1 
0d04 : a0 00 __ LDY #$00
0d06 : b1 4d __ LDA (T4 + 0),y 
0d08 : 85 2d __ STA P0 
0d0a : ad e7 53 LDA $53e7 ; (zsm_pos + 0)
0d0d : 18 __ __ CLC
0d0e : 69 01 __ ADC #$01
0d10 : aa __ __ TAX
0d11 : ad e8 53 LDA $53e8 ; (zsm_pos + 1)
0d14 : 69 00 __ ADC #$00
0d16 : 29 03 __ AND #$03
0d18 : 85 4c __ STA T3 + 1 
0d1a : 8a __ __ TXA
0d1b : 18 __ __ CLC
0d1c : 69 be __ ADC #$be
0d1e : 85 4b __ STA T3 + 0 
0d20 : a9 56 __ LDA #$56
0d22 : 65 4c __ ADC T3 + 1 
0d24 : 85 4c __ STA T3 + 1 
0d26 : b1 4b __ LDA (T3 + 0),y 
0d28 : 85 2e __ STA P1 
0d2a : 20 a7 0d JSR $0da7 ; (sfx_put.l1 + 0)
0d2d : ad e7 53 LDA $53e7 ; (zsm_pos + 0)
0d30 : 18 __ __ CLC
0d31 : 69 02 __ ADC #$02
0d33 : 8d e7 53 STA $53e7 ; (zsm_pos + 0)
0d36 : 90 03 __ BCC $0d3b ; (zsm_play.s1015 + 0)
.s1014:
0d38 : ee e8 53 INC $53e8 ; (zsm_pos + 1)
.s1015:
0d3b : e6 50 __ INC T7 + 0 
0d3d : a5 50 __ LDA T7 + 0 
0d3f : c5 4f __ CMP T6 + 0 
0d41 : 90 b1 __ BCC $0cf4 ; (zsm_play.l1012 + 0)
0d43 : 4c 92 0c JMP $0c92 ; (zsm_play.l8 + 0)
.s18:
0d46 : c9 80 __ CMP #$80
0d48 : d0 07 __ BNE $0d51 ; (zsm_play.s25 + 0)
.s24:
0d4a : a9 01 __ LDA #$01
0d4c : 8d 36 24 STA $2436 ; (zsm_finished + 0)
0d4f : d0 08 __ BNE $0d59 ; (zsm_play.s10 + 0)
.s25:
0d51 : 29 7f __ AND #$7f
0d53 : 38 __ __ SEC
0d54 : e9 01 __ SBC #$01
0d56 : 8d e6 53 STA $53e6 ; (zsm_delay + 0)
.s10:
0d59 : a5 49 __ LDA T2 + 0 
0d5b : 8d 20 9f STA $9f20 
0d5e : a5 4a __ LDA T2 + 1 
0d60 : 8d 21 9f STA $9f21 
0d63 : a5 48 __ LDA T1 + 0 
0d65 : 8d 22 9f STA $9f22 
0d68 : a5 47 __ LDA T0 + 0 
0d6a : 8d 25 9f STA $9f25 
.s1001:
0d6d : 60 __ __ RTS
.s11:
0d6e : 29 3f __ AND #$3f
0d70 : 09 c0 __ ORA #$c0
0d72 : 8d 20 9f STA $9f20 
0d75 : a9 f9 __ LDA #$f9
0d77 : 8d 21 9f STA $9f21 
0d7a : a9 01 __ LDA #$01
0d7c : 8d 22 9f STA $9f22 
0d7f : a5 4b __ LDA T3 + 0 
0d81 : 69 02 __ ADC #$02
0d83 : 8d e7 53 STA $53e7 ; (zsm_pos + 0)
0d86 : 90 01 __ BCC $0d89 ; (zsm_play.s1017 + 0)
.s1016:
0d88 : e8 __ __ INX
.s1017:
0d89 : 8e e8 53 STX $53e8 ; (zsm_pos + 1)
0d8c : 18 __ __ CLC
0d8d : a9 be __ LDA #$be
0d8f : 65 4d __ ADC T4 + 0 
0d91 : 85 4b __ STA T3 + 0 
0d93 : a5 4e __ LDA T4 + 1 
0d95 : 29 03 __ AND #$03
0d97 : 69 56 __ ADC #$56
0d99 : 85 4c __ STA T3 + 1 
0d9b : b1 4b __ LDA (T3 + 0),y 
0d9d : 8d 23 9f STA $9f23 
0da0 : 4c 92 0c JMP $0c92 ; (zsm_play.l8 + 0)
.s4:
0da3 : ce e6 53 DEC $53e6 ; (zsm_delay + 0)
0da6 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_paused:
2437 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_delay:
53e6 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
56be : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
53e7 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0da7 : ad 41 9f LDA $9f41 
0daa : 30 fb __ BMI $0da7 ; (sfx_put.l1 + 0)
.s3:
0dac : a5 2d __ LDA P0 ; (index + 0)
0dae : 8d 40 9f STA $9f40 
0db1 : ea __ __ NOP
0db2 : ea __ __ NOP
0db3 : ea __ __ NOP
0db4 : ea __ __ NOP
0db5 : a5 2e __ LDA P1 ; (data + 0)
0db7 : a6 2d __ LDX P0 ; (index + 0)
0db9 : 9d 00 5b STA $5b00,x ; (vera_fm_s_regs + 0)
0dbc : 8d 41 9f STA $9f41 
.s1001:
0dbf : 60 __ __ RTS
--------------------------------------------------------------------
vera_fm_s_regs:
5b00 : __ __ __ BSS	128
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0dc0 : a9 93 __ LDA #$93
0dc2 : 85 2d __ STA P0 
0dc4 : a9 00 __ LDA #$00
0dc6 : 85 2e __ STA P1 
0dc8 : 20 fd 0d JSR $0dfd ; (putch.s0 + 0)
0dcb : a9 11 __ LDA #$11
0dcd : 8d 22 9f STA $9f22 
0dd0 : a2 00 __ LDX #$00
.l2:
0dd2 : 8a __ __ TXA
0dd3 : 18 __ __ CLC
0dd4 : 69 b0 __ ADC #$b0
0dd6 : 8d 21 9f STA $9f21 
0dd9 : a9 00 __ LDA #$00
0ddb : 8d 20 9f STA $9f20 
0dde : a0 80 __ LDY #$80
.l1003:
0de0 : a9 20 __ LDA #$20
0de2 : 8d 23 9f STA $9f23 
0de5 : a9 01 __ LDA #$01
0de7 : 8d 23 9f STA $9f23 
0dea : a9 20 __ LDA #$20
0dec : 8d 24 9f STA $9f24 
0def : a9 01 __ LDA #$01
0df1 : 8d 24 9f STA $9f24 
0df4 : 88 __ __ DEY
0df5 : d0 e9 __ BNE $0de0 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0df7 : e8 __ __ INX
0df8 : e0 40 __ CPX #$40
0dfa : 90 d6 __ BCC $0dd2 ; (ClearVERAScreen.l2 + 0)
.s1001:
0dfc : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0dfd : a5 2d __ LDA P0 
0dff : 20 d2 ff JSR $ffd2 
.s1001:
0e02 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0e03 : a9 40 __ LDA #$40
0e05 : 8d 38 24 STA $2438 ; (VolAddr + 0)
0e08 : a9 57 __ LDA #$57
0e0a : 8d 39 24 STA $2439 ; (VolAddr + 1)
0e0d : a9 01 __ LDA #$01
0e0f : 8d 3a 24 STA $243a ; (VolAddr + 2)
0e12 : a9 00 __ LDA #$00
0e14 : 8d 3b 24 STA $243b ; (VolAddr + 3)
0e17 : 8d 3c 24 STA $243c ; (IndAddr + 0)
0e1a : 8d 3e 24 STA $243e ; (IndAddr + 2)
0e1d : 8d 3f 24 STA $243f ; (IndAddr + 3)
0e20 : a9 31 __ LDA #$31
0e22 : 8d 3d 24 STA $243d ; (IndAddr + 1)
0e25 : a9 00 __ LDA #$00
0e27 : 8d 25 9f STA $9f25 
0e2a : a9 80 __ LDA #$80
0e2c : 8d 2b 9f STA $9f2b 
0e2f : 8d 2a 9f STA $9f2a 
0e32 : a9 62 __ LDA #$62
0e34 : 8d 2d 9f STA $9f2d 
0e37 : a9 68 __ LDA #$68
0e39 : 8d 34 9f STA $9f34 
0e3c : a9 00 __ LDA #$00
0e3e : 85 2d __ STA P0 
0e40 : 85 2e __ STA P1 
0e42 : 85 2f __ STA P2 
0e44 : 85 30 __ STA P3 
0e46 : 85 31 __ STA P4 
0e48 : 20 ed 17 JSR $17ed ; (tileBaseConfig.s0 + 0)
0e4b : 8d 2f 9f STA $9f2f 
0e4e : a9 00 __ LDA #$00
0e50 : 85 2d __ STA P0 
0e52 : a9 20 __ LDA #$20
0e54 : 85 2f __ STA P2 
0e56 : 20 05 18 JSR $1805 ; (memoryToMapMemoryAddress.s0 + 0)
0e59 : 8d 2e 9f STA $9f2e 
0e5c : a9 01 __ LDA #$01
0e5e : 8d 22 9f STA $9f22 
0e61 : a2 80 __ LDX #$80
.l6:
0e63 : a0 50 __ LDY #$50
.l1071:
0e65 : a9 00 __ LDA #$00
0e67 : 8d 24 9f STA $9f24 
0e6a : a9 08 __ LDA #$08
0e6c : 8d 24 9f STA $9f24 
0e6f : 88 __ __ DEY
0e70 : d0 f3 __ BNE $0e65 ; (SetUpSprites.l1071 + 0)
.s1072:
0e72 : ca __ __ DEX
0e73 : d0 ee __ BNE $0e63 ; (SetUpSprites.l6 + 0)
.s4:
0e75 : 86 4c __ STX T1 + 0 
0e77 : a9 00 __ LDA #$00
0e79 : 85 2d __ STA P0 
0e7b : 85 2e __ STA P1 
0e7d : 85 2f __ STA P2 
0e7f : 85 30 __ STA P3 
0e81 : a9 20 __ LDA #$20
0e83 : 85 33 __ STA P6 
0e85 : a9 03 __ LDA #$03
0e87 : 85 34 __ STA P7 
0e89 : a9 40 __ LDA #$40
0e8b : 85 31 __ STA P4 
0e8d : a9 24 __ LDA #$24
0e8f : 85 32 __ STA P5 
0e91 : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
0e94 : a9 10 __ LDA #$10
0e96 : 8d 22 9f STA $9f22 
0e99 : a9 00 __ LDA #$00
0e9b : 8d 20 9f STA $9f20 
0e9e : a9 20 __ LDA #$20
0ea0 : 8d 21 9f STA $9f21 
.l10:
0ea3 : a9 00 __ LDA #$00
0ea5 : 85 4d __ STA T2 + 0 
.l14:
0ea7 : 20 4d 18 JSR $184d ; (rand.s0 + 0)
0eaa : a9 31 __ LDA #$31
0eac : 85 23 __ STA WORK + 0 
0eae : a9 00 __ LDA #$00
0eb0 : 85 24 __ STA WORK + 1 
0eb2 : 20 87 23 JSR $2387 ; (divmod + 0)
0eb5 : a5 4c __ LDA T1 + 0 
0eb7 : d0 03 __ BNE $0ebc ; (SetUpSprites.s1041 + 0)
0eb9 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s1037 + 0)
.s1041:
0ebc : a9 10 __ LDA #$10
0ebe : c5 4c __ CMP T1 + 0 
0ec0 : a9 00 __ LDA #$00
0ec2 : 2a __ __ ROL
0ec3 : d0 03 __ BNE $0ec8 ; (SetUpSprites.s1069 + 0)
0ec5 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s1037 + 0)
.s1069:
0ec8 : a8 __ __ TAY
0ec9 : a5 4d __ LDA T2 + 0 
0ecb : f0 06 __ BEQ $0ed3 ; (SetUpSprites.s26 + 0)
.s1068:
0ecd : a9 10 __ LDA #$10
0ecf : c5 4d __ CMP T2 + 0 
0ed1 : b0 18 __ BCS $0eeb ; (SetUpSprites.s1065 + 0)
.s26:
0ed3 : 98 __ __ TYA
0ed4 : d0 03 __ BNE $0ed9 ; (SetUpSprites.s1067 + 0)
0ed6 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s1037 + 0)
.s1067:
0ed9 : a5 4d __ LDA T2 + 0 
0edb : c9 3e __ CMP #$3e
0edd : b0 03 __ BCS $0ee2 ; (SetUpSprites.s1066 + 0)
0edf : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s1037 + 0)
.s1066:
0ee2 : a9 4e __ LDA #$4e
0ee4 : c5 4d __ CMP T2 + 0 
0ee6 : b0 03 __ BCS $0eeb ; (SetUpSprites.s1065 + 0)
0ee8 : 4c 9f 0f JMP $0f9f ; (SetUpSprites.s1037 + 0)
.s1065:
0eeb : a5 4c __ LDA T1 + 0 
0eed : c9 01 __ CMP #$01
0eef : f0 79 __ BEQ $0f6a ; (SetUpSprites.s1064 + 0)
.s1057:
0ef1 : c9 10 __ CMP #$10
0ef3 : d0 30 __ BNE $0f25 ; (SetUpSprites.s1049 + 0)
.s1056:
0ef5 : a5 4d __ LDA T2 + 0 
0ef7 : c9 01 __ CMP #$01
0ef9 : f0 04 __ BEQ $0eff ; (SetUpSprites.s46 + 0)
.s1055:
0efb : c9 3e __ CMP #$3e
0efd : d0 04 __ BNE $0f03 ; (SetUpSprites.s1054 + 0)
.s46:
0eff : a9 14 __ LDA #$14
0f01 : d0 5a __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s1054:
0f03 : c9 10 __ CMP #$10
0f05 : 90 0c __ BCC $0f13 ; (SetUpSprites.s52 + 0)
.s1053:
0f07 : a9 3e __ LDA #$3e
0f09 : c5 4d __ CMP T2 + 0 
0f0b : b0 0a __ BCS $0f17 ; (SetUpSprites.s1051 + 0)
.s1052:
0f0d : a5 4d __ LDA T2 + 0 
0f0f : c9 4e __ CMP #$4e
0f11 : b0 04 __ BCS $0f17 ; (SetUpSprites.s1051 + 0)
.s52:
0f13 : a9 15 __ LDA #$15
0f15 : d0 46 __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s1051:
0f17 : a5 4d __ LDA T2 + 0 
0f19 : c9 10 __ CMP #$10
0f1b : f0 04 __ BEQ $0f21 ; (SetUpSprites.s59 + 0)
.s1050:
0f1d : c9 4e __ CMP #$4e
0f1f : d0 04 __ BNE $0f25 ; (SetUpSprites.s1049 + 0)
.s59:
0f21 : a9 16 __ LDA #$16
0f23 : d0 38 __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s1049:
0f25 : a5 4d __ LDA T2 + 0 
0f27 : c9 01 __ CMP #$01
0f29 : d0 08 __ BNE $0f33 ; (SetUpSprites.s1047 + 0)
.s1048:
0f2b : a5 4c __ LDA T1 + 0 
0f2d : c9 10 __ CMP #$10
0f2f : 90 06 __ BCC $0f37 ; (SetUpSprites.s65 + 0)
.s1084:
0f31 : a5 4d __ LDA T2 + 0 
.s1047:
0f33 : c9 3e __ CMP #$3e
0f35 : d0 04 __ BNE $0f3b ; (SetUpSprites.s1046 + 0)
.s65:
0f37 : a9 12 __ LDA #$12
0f39 : d0 22 __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s1046:
0f3b : c9 10 __ CMP #$10
0f3d : d0 06 __ BNE $0f45 ; (SetUpSprites.s1044 + 0)
.s1045:
0f3f : a5 4c __ LDA T1 + 0 
0f41 : c9 10 __ CMP #$10
0f43 : 90 12 __ BCC $0f57 ; (SetUpSprites.s70 + 0)
.s1044:
0f45 : a5 4d __ LDA T2 + 0 
0f47 : c9 4e __ CMP #$4e
0f49 : d0 10 __ BNE $0f5b ; (SetUpSprites.s71 + 0)
.s1043:
0f4b : a5 4c __ LDA T1 + 0 
0f4d : c9 10 __ CMP #$10
0f4f : b0 0a __ BCS $0f5b ; (SetUpSprites.s71 + 0)
.s1042:
0f51 : a9 01 __ LDA #$01
0f53 : c5 4c __ CMP T1 + 0 
0f55 : b0 04 __ BCS $0f5b ; (SetUpSprites.s71 + 0)
.s70:
0f57 : a9 17 __ LDA #$17
0f59 : d0 02 __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s71:
0f5b : a9 13 __ LDA #$13
.s296:
0f5d : 8d 23 9f STA $9f23 
0f60 : a9 00 __ LDA #$00
0f62 : 8d 23 9f STA $9f23 
0f65 : e6 4d __ INC T2 + 0 
0f67 : 4c a7 0e JMP $0ea7 ; (SetUpSprites.l14 + 0)
.s1064:
0f6a : a5 4d __ LDA T2 + 0 
0f6c : c9 01 __ CMP #$01
0f6e : f0 04 __ BEQ $0f74 ; (SetUpSprites.s27 + 0)
.s1063:
0f70 : c9 3e __ CMP #$3e
0f72 : d0 04 __ BNE $0f78 ; (SetUpSprites.s1062 + 0)
.s27:
0f74 : a9 0f __ LDA #$0f
0f76 : d0 e5 __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s1062:
0f78 : c9 10 __ CMP #$10
0f7a : 90 0c __ BCC $0f88 ; (SetUpSprites.s33 + 0)
.s1061:
0f7c : a9 3e __ LDA #$3e
0f7e : c5 4d __ CMP T2 + 0 
0f80 : b0 0a __ BCS $0f8c ; (SetUpSprites.s1059 + 0)
.s1060:
0f82 : a5 4d __ LDA T2 + 0 
0f84 : c9 4e __ CMP #$4e
0f86 : b0 04 __ BCS $0f8c ; (SetUpSprites.s1059 + 0)
.s33:
0f88 : a9 10 __ LDA #$10
0f8a : d0 d1 __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s1059:
0f8c : a5 4d __ LDA T2 + 0 
0f8e : c9 10 __ CMP #$10
0f90 : f0 04 __ BEQ $0f96 ; (SetUpSprites.s40 + 0)
.s1058:
0f92 : c9 4e __ CMP #$4e
0f94 : d0 04 __ BNE $0f9a ; (SetUpSprites.s1083 + 0)
.s40:
0f96 : a9 11 __ LDA #$11
0f98 : d0 c3 __ BNE $0f5d ; (SetUpSprites.s296 + 0)
.s1083:
0f9a : a5 4c __ LDA T1 + 0 
0f9c : 4c f1 0e JMP $0ef1 ; (SetUpSprites.s1057 + 0)
.s1037:
0f9f : a5 4c __ LDA T1 + 0 
0fa1 : c9 36 __ CMP #$36
0fa3 : 90 03 __ BCC $0fa8 ; (SetUpSprites.s1036 + 0)
0fa5 : 4c 43 17 JMP $1743 ; (SetUpSprites.s1031 + 0)
.s1036:
0fa8 : c9 2c __ CMP #$2c
0faa : b0 03 __ BCS $0faf ; (SetUpSprites.s1035 + 0)
0fac : 4c 43 17 JMP $1743 ; (SetUpSprites.s1031 + 0)
.s1035:
0faf : f0 04 __ BEQ $0fb5 ; (SetUpSprites.s81 + 0)
.s1034:
0fb1 : c9 34 __ CMP #$34
0fb3 : d0 04 __ BNE $0fb9 ; (SetUpSprites.s1033 + 0)
.s81:
0fb5 : a9 0a __ LDA #$0a
0fb7 : d0 0e __ BNE $0fc7 ; (SetUpSprites.s279 + 0)
.s1033:
0fb9 : c9 2d __ CMP #$2d
0fbb : f0 04 __ BEQ $0fc1 ; (SetUpSprites.s85 + 0)
.s1032:
0fbd : c9 35 __ CMP #$35
0fbf : d0 04 __ BNE $0fc5 ; (SetUpSprites.s86 + 0)
.s85:
0fc1 : a9 0b __ LDA #$0b
0fc3 : d0 02 __ BNE $0fc7 ; (SetUpSprites.s279 + 0)
.s86:
0fc5 : a9 04 __ LDA #$04
.s279:
0fc7 : 8d 23 9f STA $9f23 
0fca : a9 00 __ LDA #$00
0fcc : 8d 23 9f STA $9f23 
0fcf : e6 4d __ INC T2 + 0 
0fd1 : 30 03 __ BMI $0fd6 ; (SetUpSprites.s11 + 0)
0fd3 : 4c a7 0e JMP $0ea7 ; (SetUpSprites.l14 + 0)
.s11:
0fd6 : e6 4c __ INC T1 + 0 
0fd8 : a5 4c __ LDA T1 + 0 
0fda : c9 40 __ CMP #$40
0fdc : b0 03 __ BCS $0fe1 ; (SetUpSprites.s12 + 0)
0fde : 4c a3 0e JMP $0ea3 ; (SetUpSprites.l10 + 0)
.s12:
0fe1 : a9 c0 __ LDA #$c0
0fe3 : 85 2d __ STA P0 
0fe5 : a9 52 __ LDA #$52
0fe7 : 85 2e __ STA P1 
0fe9 : a9 01 __ LDA #$01
0feb : 85 2f __ STA P2 
0fed : a9 00 __ LDA #$00
0fef : 85 30 __ STA P3 
0ff1 : 85 33 __ STA P6 
0ff3 : a9 02 __ LDA #$02
0ff5 : 85 34 __ STA P7 
0ff7 : a9 62 __ LDA #$62
0ff9 : 85 31 __ STA P4 
0ffb : a9 27 __ LDA #$27
0ffd : 85 32 __ STA P5 
0fff : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
1002 : a9 00 __ LDA #$00
1004 : 85 2d __ STA P0 
1006 : a9 55 __ LDA #$55
1008 : 85 2e __ STA P1 
100a : a9 02 __ LDA #$02
100c : 85 34 __ STA P7 
100e : a9 62 __ LDA #$62
1010 : 85 31 __ STA P4 
1012 : a9 29 __ LDA #$29
1014 : 85 32 __ STA P5 
1016 : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
1019 : a9 96 __ LDA #$96
101b : 85 2e __ STA P1 
101d : a9 0a __ LDA #$0a
101f : 85 2f __ STA P2 
1021 : 85 34 __ STA P7 
1023 : a9 02 __ LDA #$02
1025 : 85 31 __ STA P4 
1027 : 85 32 __ STA P5 
1029 : a9 03 __ LDA #$03
102b : 85 33 __ STA P6 
102d : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1030 : a9 68 __ LDA #$68
1032 : 85 2e __ STA P1 
1034 : a9 00 __ LDA #$00
1036 : 85 2f __ STA P2 
1038 : a9 b6 __ LDA #$b6
103a : 85 30 __ STA P3 
103c : a9 01 __ LDA #$01
103e : 85 31 __ STA P4 
1040 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1043 : a9 01 __ LDA #$01
1045 : 85 2d __ STA P0 
1047 : a9 a8 __ LDA #$a8
1049 : 85 2e __ STA P1 
104b : a9 0a __ LDA #$0a
104d : 85 2f __ STA P2 
104f : a9 00 __ LDA #$00
1051 : 85 30 __ STA P3 
1053 : a9 02 __ LDA #$02
1055 : 85 31 __ STA P4 
1057 : a9 09 __ LDA #$09
1059 : 85 34 __ STA P7 
105b : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
105e : a9 f0 __ LDA #$f0
1060 : 85 2e __ STA P1 
1062 : a9 01 __ LDA #$01
1064 : 85 2f __ STA P2 
1066 : 85 31 __ STA P4 
1068 : a9 b6 __ LDA #$b6
106a : 85 30 __ STA P3 
106c : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
106f : a9 00 __ LDA #$00
1071 : 85 2d __ STA P0 
1073 : 85 30 __ STA P3 
1075 : 85 33 __ STA P6 
1077 : a9 30 __ LDA #$30
1079 : 85 2e __ STA P1 
107b : a9 01 __ LDA #$01
107d : 85 34 __ STA P7 
107f : a9 00 __ LDA #$00
1081 : 85 31 __ STA P4 
1083 : a9 2c __ LDA #$2c
1085 : 85 32 __ STA P5 
1087 : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
108a : a9 16 __ LDA #$16
108c : 85 2d __ STA P0 
108e : a9 80 __ LDA #$80
1090 : 85 2e __ STA P1 
1092 : a9 09 __ LDA #$09
1094 : 85 2f __ STA P2 
1096 : a9 01 __ LDA #$01
1098 : 85 31 __ STA P4 
109a : 85 34 __ STA P7 
109c : a9 02 __ LDA #$02
109e : 85 32 __ STA P5 
10a0 : a9 03 __ LDA #$03
10a2 : 85 33 __ STA P6 
10a4 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
10a7 : a9 30 __ LDA #$30
10a9 : 85 2e __ STA P1 
10ab : a9 01 __ LDA #$01
10ad : 85 2f __ STA P2 
10af : a9 b8 __ LDA #$b8
10b1 : 85 30 __ STA P3 
10b3 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
10b6 : a9 00 __ LDA #$00
10b8 : 85 2d __ STA P0 
10ba : 85 30 __ STA P3 
10bc : 85 33 __ STA P6 
10be : a9 33 __ LDA #$33
10c0 : 85 2e __ STA P1 
10c2 : a9 02 __ LDA #$02
10c4 : 85 34 __ STA P7 
10c6 : a9 00 __ LDA #$00
10c8 : 85 31 __ STA P4 
10ca : a9 2d __ LDA #$2d
10cc : 85 32 __ STA P5 
10ce : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
10d1 : a9 17 __ LDA #$17
10d3 : 85 2d __ STA P0 
10d5 : a9 98 __ LDA #$98
10d7 : 85 2e __ STA P1 
10d9 : a9 09 __ LDA #$09
10db : 85 2f __ STA P2 
10dd : a9 02 __ LDA #$02
10df : 85 31 __ STA P4 
10e1 : 85 32 __ STA P5 
10e3 : a9 03 __ LDA #$03
10e5 : 85 33 __ STA P6 
10e7 : a9 01 __ LDA #$01
10e9 : 85 34 __ STA P7 
10eb : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
10ee : a9 fc __ LDA #$fc
10f0 : 85 2e __ STA P1 
10f2 : a9 00 __ LDA #$00
10f4 : 85 2f __ STA P2 
10f6 : a9 b8 __ LDA #$b8
10f8 : 85 30 __ STA P3 
10fa : a9 01 __ LDA #$01
10fc : 85 31 __ STA P4 
10fe : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1101 : a9 18 __ LDA #$18
1103 : 85 2d __ STA P0 
1105 : a9 98 __ LDA #$98
1107 : 85 2e __ STA P1 
1109 : a9 09 __ LDA #$09
110b : 85 2f __ STA P2 
110d : a9 00 __ LDA #$00
110f : 85 30 __ STA P3 
1111 : a9 02 __ LDA #$02
1113 : 85 31 __ STA P4 
1115 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1118 : a9 4c __ LDA #$4c
111a : 85 2e __ STA P1 
111c : a9 01 __ LDA #$01
111e : 85 2f __ STA P2 
1120 : 85 31 __ STA P4 
1122 : a9 b8 __ LDA #$b8
1124 : 85 30 __ STA P3 
1126 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1129 : a9 01 __ LDA #$01
112b : 85 2e __ STA P1 
112d : a9 00 __ LDA #$00
112f : 85 2f __ STA P2 
1131 : 20 0a 19 JSR $190a ; (vera_spr_flip.s0 + 0)
1134 : a9 10 __ LDA #$10
1136 : 85 2d __ STA P0 
1138 : a9 20 __ LDA #$20
113a : 85 30 __ STA P3 
113c : a9 00 __ LDA #$00
113e : 85 31 __ STA P4 
1140 : a9 62 __ LDA #$62
1142 : 85 2e __ STA P1 
1144 : a9 2b __ LDA #$2b
1146 : 85 2f __ STA P2 
1148 : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
114b : a9 00 __ LDA #$00
114d : 85 2d __ STA P0 
114f : 85 30 __ STA P3 
1151 : 85 33 __ STA P6 
1153 : a9 31 __ LDA #$31
1155 : 85 2e __ STA P1 
1157 : a9 01 __ LDA #$01
1159 : 85 2f __ STA P2 
115b : a9 02 __ LDA #$02
115d : 85 34 __ STA P7 
115f : a9 00 __ LDA #$00
1161 : 85 31 __ STA P4 
1163 : a9 2f __ LDA #$2f
1165 : 85 32 __ STA P5 
1167 : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
116a : a9 00 __ LDA #$00
116c : 85 4c __ STA T1 + 0 
116e : 85 4d __ STA T2 + 0 
1170 : a9 03 __ LDA #$03
1172 : 85 33 __ STA P6 
1174 : a9 02 __ LDA #$02
1176 : 85 34 __ STA P7 
1178 : 18 __ __ CLC
.l1085:
1179 : a9 88 __ LDA #$88
117b : 85 2e __ STA P1 
117d : a9 09 __ LDA #$09
117f : 85 2f __ STA P2 
1181 : a9 00 __ LDA #$00
1183 : 85 30 __ STA P3 
1185 : 85 31 __ STA P4 
1187 : 85 32 __ STA P5 
1189 : a5 4c __ LDA T1 + 0 
118b : 69 19 __ ADC #$19
118d : 85 2d __ STA P0 
118f : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1192 : a9 b8 __ LDA #$b8
1194 : 85 30 __ STA P3 
1196 : a9 01 __ LDA #$01
1198 : 85 31 __ STA P4 
119a : 38 __ __ SEC
119b : a5 4d __ LDA T2 + 0 
119d : e9 fc __ SBC #$fc
119f : 85 2e __ STA P1 
11a1 : a9 00 __ LDA #$00
11a3 : e9 03 __ SBC #$03
11a5 : 85 2f __ STA P2 
11a7 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
11aa : 18 __ __ CLC
11ab : a5 4d __ LDA T2 + 0 
11ad : 69 0c __ ADC #$0c
11af : 85 4d __ STA T2 + 0 
11b1 : e6 4c __ INC T1 + 0 
11b3 : a5 4c __ LDA T1 + 0 
11b5 : c9 08 __ CMP #$08
11b7 : 90 c0 __ BCC $1179 ; (SetUpSprites.l1085 + 0)
.s138:
11b9 : a9 00 __ LDA #$00
11bb : 85 4c __ STA T1 + 0 
11bd : 85 4d __ STA T2 + 0 
11bf : a9 03 __ LDA #$03
11c1 : 85 33 __ STA P6 
11c3 : a9 02 __ LDA #$02
11c5 : 85 34 __ STA P7 
11c7 : 18 __ __ CLC
.l1087:
11c8 : a9 88 __ LDA #$88
11ca : 85 2e __ STA P1 
11cc : a9 09 __ LDA #$09
11ce : 85 2f __ STA P2 
11d0 : a9 00 __ LDA #$00
11d2 : 85 30 __ STA P3 
11d4 : 85 31 __ STA P4 
11d6 : a5 4c __ LDA T1 + 0 
11d8 : 69 21 __ ADC #$21
11da : 85 2d __ STA P0 
11dc : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
11df : a9 c4 __ LDA #$c4
11e1 : 85 30 __ STA P3 
11e3 : a9 01 __ LDA #$01
11e5 : 85 31 __ STA P4 
11e7 : 38 __ __ SEC
11e8 : a5 4d __ LDA T2 + 0 
11ea : e9 fc __ SBC #$fc
11ec : 85 2e __ STA P1 
11ee : a9 00 __ LDA #$00
11f0 : e9 03 __ SBC #$03
11f2 : 85 2f __ STA P2 
11f4 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
11f7 : 18 __ __ CLC
11f8 : a5 4d __ LDA T2 + 0 
11fa : 69 0c __ ADC #$0c
11fc : 85 4d __ STA T2 + 0 
11fe : e6 4c __ INC T1 + 0 
1200 : a5 4c __ LDA T1 + 0 
1202 : c9 08 __ CMP #$08
1204 : 90 c2 __ BCC $11c8 ; (SetUpSprites.l1087 + 0)
.s142:
1206 : a9 00 __ LDA #$00
1208 : 85 4c __ STA T1 + 0 
120a : 85 4d __ STA T2 + 0 
120c : a9 03 __ LDA #$03
120e : 85 33 __ STA P6 
1210 : a9 02 __ LDA #$02
1212 : 85 34 __ STA P7 
1214 : 18 __ __ CLC
.l1089:
1215 : a9 88 __ LDA #$88
1217 : 85 2e __ STA P1 
1219 : a9 09 __ LDA #$09
121b : 85 2f __ STA P2 
121d : a9 00 __ LDA #$00
121f : 85 30 __ STA P3 
1221 : 85 31 __ STA P4 
1223 : a5 4c __ LDA T1 + 0 
1225 : 69 29 __ ADC #$29
1227 : 85 2d __ STA P0 
1229 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
122c : a9 b8 __ LDA #$b8
122e : 85 30 __ STA P3 
1230 : a9 01 __ LDA #$01
1232 : 85 31 __ STA P4 
1234 : 38 __ __ SEC
1235 : a9 6c __ LDA #$6c
1237 : e5 4d __ SBC T2 + 0 
1239 : 85 2e __ STA P1 
123b : a9 02 __ LDA #$02
123d : e9 04 __ SBC #$04
123f : 85 2f __ STA P2 
1241 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1244 : 18 __ __ CLC
1245 : a5 4d __ LDA T2 + 0 
1247 : 69 0c __ ADC #$0c
1249 : 85 4d __ STA T2 + 0 
124b : e6 4c __ INC T1 + 0 
124d : a5 4c __ LDA T1 + 0 
124f : c9 08 __ CMP #$08
1251 : 90 c2 __ BCC $1215 ; (SetUpSprites.l1089 + 0)
.s146:
1253 : a9 00 __ LDA #$00
1255 : 85 4c __ STA T1 + 0 
1257 : a9 02 __ LDA #$02
1259 : 85 34 __ STA P7 
125b : a9 03 __ LDA #$03
125d : 85 33 __ STA P6 
.l148:
125f : 38 __ __ SEC
1260 : a9 00 __ LDA #$00
1262 : e5 4c __ SBC T1 + 0 
1264 : 29 0c __ AND #$0c
1266 : 49 ff __ EOR #$ff
1268 : 38 __ __ SEC
1269 : 69 6c __ ADC #$6c
126b : 85 4d __ STA T2 + 0 
126d : a9 02 __ LDA #$02
126f : e9 00 __ SBC #$00
1271 : 85 4e __ STA T2 + 1 
1273 : 18 __ __ CLC
1274 : a5 4c __ LDA T1 + 0 
1276 : 69 31 __ ADC #$31
1278 : 85 2d __ STA P0 
127a : a9 02 __ LDA #$02
127c : 85 4f __ STA T5 + 0 
.l1073:
127e : a9 88 __ LDA #$88
1280 : 85 2e __ STA P1 
1282 : a9 09 __ LDA #$09
1284 : 85 2f __ STA P2 
1286 : a9 00 __ LDA #$00
1288 : 85 30 __ STA P3 
128a : 85 31 __ STA P4 
128c : 85 32 __ STA P5 
128e : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1291 : a5 4d __ LDA T2 + 0 
1293 : 85 2e __ STA P1 
1295 : a5 4e __ LDA T2 + 1 
1297 : 85 2f __ STA P2 
1299 : a9 b8 __ LDA #$b8
129b : 85 30 __ STA P3 
129d : a9 01 __ LDA #$01
129f : 85 31 __ STA P4 
12a1 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
12a4 : c6 4f __ DEC T5 + 0 
12a6 : d0 d6 __ BNE $127e ; (SetUpSprites.l1073 + 0)
.s149:
12a8 : e6 4c __ INC T1 + 0 
12aa : a5 4c __ LDA T1 + 0 
12ac : c9 02 __ CMP #$02
12ae : 90 af __ BCC $125f ; (SetUpSprites.l148 + 0)
.s150:
12b0 : a9 40 __ LDA #$40
12b2 : 85 2d __ STA P0 
12b4 : a9 4d __ LDA #$4d
12b6 : 85 2e __ STA P1 
12b8 : a9 01 __ LDA #$01
12ba : 85 2f __ STA P2 
12bc : 85 34 __ STA P7 
12be : a9 00 __ LDA #$00
12c0 : 85 30 __ STA P3 
12c2 : 85 33 __ STA P6 
12c4 : a9 00 __ LDA #$00
12c6 : 85 31 __ STA P4 
12c8 : a9 31 __ LDA #$31
12ca : 85 32 __ STA P5 
12cc : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
12cf : a9 33 __ LDA #$33
12d1 : 85 2d __ STA P0 
12d3 : a9 6a __ LDA #$6a
12d5 : 85 2e __ STA P1 
12d7 : a9 0a __ LDA #$0a
12d9 : 85 2f __ STA P2 
12db : a9 01 __ LDA #$01
12dd : 85 31 __ STA P4 
12df : a9 02 __ LDA #$02
12e1 : 85 32 __ STA P5 
12e3 : a9 03 __ LDA #$03
12e5 : 85 33 __ STA P6 
12e7 : a9 06 __ LDA #$06
12e9 : 85 34 __ STA P7 
12eb : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
12ee : a9 00 __ LDA #$00
12f0 : 85 2e __ STA P1 
12f2 : 85 31 __ STA P4 
12f4 : a9 01 __ LDA #$01
12f6 : 85 2f __ STA P2 
12f8 : a9 78 __ LDA #$78
12fa : 85 30 __ STA P3 
12fc : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
12ff : a9 00 __ LDA #$00
1301 : 85 2d __ STA P0 
1303 : 85 30 __ STA P3 
1305 : 85 33 __ STA P6 
1307 : a9 3d __ LDA #$3d
1309 : 85 2e __ STA P1 
130b : a9 04 __ LDA #$04
130d : 85 34 __ STA P7 
130f : a9 00 __ LDA #$00
1311 : 85 31 __ STA P4 
1313 : a9 32 __ LDA #$32
1315 : 85 32 __ STA P5 
1317 : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
131a : a9 34 __ LDA #$34
131c : 85 2d __ STA P0 
131e : a9 e8 __ LDA #$e8
1320 : 85 2e __ STA P1 
1322 : a9 09 __ LDA #$09
1324 : 85 2f __ STA P2 
1326 : a9 03 __ LDA #$03
1328 : 85 31 __ STA P4 
132a : 85 33 __ STA P6 
132c : a9 02 __ LDA #$02
132e : 85 32 __ STA P5 
1330 : a9 05 __ LDA #$05
1332 : 85 34 __ STA P7 
1334 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1337 : a9 00 __ LDA #$00
1339 : 85 2e __ STA P1 
133b : 85 31 __ STA P4 
133d : a9 01 __ LDA #$01
133f : 85 2f __ STA P2 
1341 : a9 78 __ LDA #$78
1343 : 85 30 __ STA P3 
1345 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1348 : a9 35 __ LDA #$35
134a : 85 2d __ STA P0 
134c : a9 08 __ LDA #$08
134e : 85 2e __ STA P1 
1350 : a9 0a __ LDA #$0a
1352 : 85 2f __ STA P2 
1354 : a9 00 __ LDA #$00
1356 : 85 30 __ STA P3 
1358 : a9 03 __ LDA #$03
135a : 85 31 __ STA P4 
135c : a9 07 __ LDA #$07
135e : 85 33 __ STA P6 
1360 : a9 06 __ LDA #$06
1362 : 85 34 __ STA P7 
1364 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1367 : a9 00 __ LDA #$00
1369 : 85 2e __ STA P1 
136b : 85 31 __ STA P4 
136d : a9 01 __ LDA #$01
136f : 85 2f __ STA P2 
1371 : a9 e8 __ LDA #$e8
1373 : 85 30 __ STA P3 
1375 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1378 : a9 36 __ LDA #$36
137a : 85 2d __ STA P0 
137c : a9 08 __ LDA #$08
137e : 85 2e __ STA P1 
1380 : a9 0a __ LDA #$0a
1382 : 85 2f __ STA P2 
1384 : a9 00 __ LDA #$00
1386 : 85 30 __ STA P3 
1388 : a9 03 __ LDA #$03
138a : 85 31 __ STA P4 
138c : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
138f : a9 40 __ LDA #$40
1391 : 85 2e __ STA P1 
1393 : a9 01 __ LDA #$01
1395 : 85 2f __ STA P2 
1397 : a9 e8 __ LDA #$e8
1399 : 85 30 __ STA P3 
139b : a9 00 __ LDA #$00
139d : 85 31 __ STA P4 
139f : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
13a2 : a9 01 __ LDA #$01
13a4 : 85 2e __ STA P1 
13a6 : a9 00 __ LDA #$00
13a8 : 85 2f __ STA P2 
13aa : 20 0a 19 JSR $190a ; (vera_spr_flip.s0 + 0)
13ad : a9 37 __ LDA #$37
13af : 85 2d __ STA P0 
13b1 : a9 08 __ LDA #$08
13b3 : 85 2e __ STA P1 
13b5 : a9 0a __ LDA #$0a
13b7 : 85 2f __ STA P2 
13b9 : a9 00 __ LDA #$00
13bb : 85 30 __ STA P3 
13bd : a9 03 __ LDA #$03
13bf : 85 31 __ STA P4 
13c1 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
13c4 : a9 00 __ LDA #$00
13c6 : 85 2e __ STA P1 
13c8 : a9 01 __ LDA #$01
13ca : 85 2f __ STA P2 
13cc : 85 31 __ STA P4 
13ce : a9 08 __ LDA #$08
13d0 : 85 30 __ STA P3 
13d2 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
13d5 : 20 0a 19 JSR $190a ; (vera_spr_flip.s0 + 0)
13d8 : a9 38 __ LDA #$38
13da : 85 2d __ STA P0 
13dc : a9 08 __ LDA #$08
13de : 85 2e __ STA P1 
13e0 : a9 0a __ LDA #$0a
13e2 : 85 2f __ STA P2 
13e4 : a9 00 __ LDA #$00
13e6 : 85 30 __ STA P3 
13e8 : a9 03 __ LDA #$03
13ea : 85 31 __ STA P4 
13ec : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
13ef : a9 40 __ LDA #$40
13f1 : 85 2e __ STA P1 
13f3 : a9 01 __ LDA #$01
13f5 : 85 2f __ STA P2 
13f7 : 85 31 __ STA P4 
13f9 : a9 08 __ LDA #$08
13fb : 85 30 __ STA P3 
13fd : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1400 : a9 01 __ LDA #$01
1402 : 85 2e __ STA P1 
1404 : 20 0a 19 JSR $190a ; (vera_spr_flip.s0 + 0)
1407 : a9 00 __ LDA #$00
1409 : 85 2d __ STA P0 
140b : 85 30 __ STA P3 
140d : 85 33 __ STA P6 
140f : a9 35 __ LDA #$35
1411 : 85 2e __ STA P1 
1413 : a9 08 __ LDA #$08
1415 : 85 34 __ STA P7 
1417 : a9 00 __ LDA #$00
1419 : 85 31 __ STA P4 
141b : a9 36 __ LDA #$36
141d : 85 32 __ STA P5 
141f : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
1422 : a9 00 __ LDA #$00
1424 : 85 4c __ STA T1 + 0 
1426 : 85 4d __ STA T2 + 0 
1428 : 85 4e __ STA T2 + 1 
142a : a9 02 __ LDA #$02
142c : 85 33 __ STA P6 
142e : a9 05 __ LDA #$05
1430 : 85 34 __ STA P7 
1432 : a9 03 __ LDA #$03
1434 : 85 32 __ STA P5 
1436 : 18 __ __ CLC
.l1091:
1437 : a9 a8 __ LDA #$a8
1439 : 85 2e __ STA P1 
143b : a9 09 __ LDA #$09
143d : 85 2f __ STA P2 
143f : a9 00 __ LDA #$00
1441 : 85 30 __ STA P3 
1443 : a9 03 __ LDA #$03
1445 : 85 31 __ STA P4 
1447 : a5 4c __ LDA T1 + 0 
1449 : 69 39 __ ADC #$39
144b : 85 2d __ STA P0 
144d : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1450 : a9 20 __ LDA #$20
1452 : 85 2e __ STA P1 
1454 : a9 01 __ LDA #$01
1456 : 85 2f __ STA P2 
1458 : 38 __ __ SEC
1459 : a5 4d __ LDA T2 + 0 
145b : e9 60 __ SBC #$60
145d : 85 30 __ STA P3 
145f : a5 4e __ LDA T2 + 1 
1461 : e9 00 __ SBC #$00
1463 : 85 31 __ STA P4 
1465 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1468 : 18 __ __ CLC
1469 : a5 4d __ LDA T2 + 0 
146b : 69 40 __ ADC #$40
146d : 85 4d __ STA T2 + 0 
146f : 90 02 __ BCC $1473 ; (SetUpSprites.s1094 + 0)
.s1093:
1471 : e6 4e __ INC T2 + 1 
.s1094:
1473 : e6 4c __ INC T1 + 0 
1475 : a5 4c __ LDA T1 + 0 
1477 : c9 07 __ CMP #$07
1479 : 90 bc __ BCC $1437 ; (SetUpSprites.l1091 + 0)
.s158:
147b : a9 40 __ LDA #$40
147d : 85 2d __ STA P0 
147f : a9 4f __ LDA #$4f
1481 : 85 2e __ STA P1 
1483 : a9 00 __ LDA #$00
1485 : 85 30 __ STA P3 
1487 : 85 33 __ STA P6 
1489 : a9 02 __ LDA #$02
148b : 85 34 __ STA P7 
148d : a9 00 __ LDA #$00
148f : 85 31 __ STA P4 
1491 : a9 3e __ LDA #$3e
1493 : 85 32 __ STA P5 
1495 : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
1498 : a9 80 __ LDA #$80
149a : 85 2d __ STA P0 
149c : 85 33 __ STA P6 
149e : a9 4e __ LDA #$4e
14a0 : 85 2e __ STA P1 
14a2 : a9 00 __ LDA #$00
14a4 : 85 34 __ STA P7 
14a6 : a9 00 __ LDA #$00
14a8 : 85 31 __ STA P4 
14aa : a9 40 __ LDA #$40
14ac : 85 32 __ STA P5 
14ae : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
14b1 : a9 00 __ LDA #$00
14b3 : 85 4b __ STA T0 + 0 
14b5 : a9 0a __ LDA #$0a
14b7 : 85 2f __ STA P2 
14b9 : a9 02 __ LDA #$02
14bb : 85 33 __ STA P6 
14bd : a9 08 __ LDA #$08
14bf : 85 34 __ STA P7 
.l160:
14c1 : a9 74 __ LDA #$74
14c3 : 85 2e __ STA P1 
14c5 : a9 01 __ LDA #$01
14c7 : 85 31 __ STA P4 
14c9 : 85 32 __ STA P5 
14cb : 18 __ __ CLC
14cc : a5 4b __ LDA T0 + 0 
14ce : 69 4f __ ADC #$4f
14d0 : 85 2d __ STA P0 
14d2 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
14d5 : a5 4b __ LDA T0 + 0 
14d7 : c9 17 __ CMP #$17
14d9 : d0 0d __ BNE $14e8 ; (SetUpSprites.s288 + 0)
.s163:
14db : a9 7a __ LDA #$7a
14dd : 85 2e __ STA P1 
14df : a9 02 __ LDA #$02
14e1 : 85 31 __ STA P4 
14e3 : 85 32 __ STA P5 
14e5 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
.s288:
14e8 : e6 4b __ INC T0 + 0 
14ea : a5 4b __ LDA T0 + 0 
14ec : c9 18 __ CMP #$18
14ee : 90 d1 __ BCC $14c1 ; (SetUpSprites.l160 + 0)
.s162:
14f0 : a9 00 __ LDA #$00
14f2 : 85 2d __ STA P0 
14f4 : 85 31 __ STA P4 
14f6 : a9 20 __ LDA #$20
14f8 : 85 30 __ STA P3 
14fa : a9 82 __ LDA #$82
14fc : 85 2e __ STA P1 
14fe : a9 2b __ LDA #$2b
1500 : 85 2f __ STA P2 
1502 : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
1505 : a9 20 __ LDA #$20
1507 : 85 2d __ STA P0 
1509 : a9 00 __ LDA #$00
150b : 85 31 __ STA P4 
150d : a9 a2 __ LDA #$a2
150f : 85 2e __ STA P1 
1511 : a9 2b __ LDA #$2b
1513 : 85 2f __ STA P2 
1515 : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
1518 : a9 60 __ LDA #$60
151a : 85 2d __ STA P0 
151c : a9 00 __ LDA #$00
151e : 85 31 __ STA P4 
1520 : a9 c2 __ LDA #$c2
1522 : 85 2e __ STA P1 
1524 : a9 2b __ LDA #$2b
1526 : 85 2f __ STA P2 
1528 : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
152b : a9 70 __ LDA #$70
152d : 85 2d __ STA P0 
152f : a9 0c __ LDA #$0c
1531 : 85 30 __ STA P3 
1533 : a9 00 __ LDA #$00
1535 : 85 31 __ STA P4 
1537 : a9 e2 __ LDA #$e2
1539 : 85 2e __ STA P1 
153b : a9 2b __ LDA #$2b
153d : 85 2f __ STA P2 
153f : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
1542 : a9 80 __ LDA #$80
1544 : 85 2d __ STA P0 
1546 : a9 20 __ LDA #$20
1548 : 85 30 __ STA P3 
154a : a9 00 __ LDA #$00
154c : 85 31 __ STA P4 
154e : a9 80 __ LDA #$80
1550 : 85 2e __ STA P1 
1552 : a9 40 __ LDA #$40
1554 : 85 2f __ STA P2 
1556 : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
1559 : a9 90 __ LDA #$90
155b : 85 2d __ STA P0 
155d : a9 10 __ LDA #$10
155f : 85 30 __ STA P3 
1561 : a9 00 __ LDA #$00
1563 : 85 31 __ STA P4 
1565 : a9 ee __ LDA #$ee
1567 : 85 2e __ STA P1 
1569 : a9 2b __ LDA #$2b
156b : 85 2f __ STA P2 
156d : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
1570 : a9 a0 __ LDA #$a0
1572 : 85 2d __ STA P0 
1574 : a9 1a __ LDA #$1a
1576 : 85 30 __ STA P3 
1578 : a9 00 __ LDA #$00
157a : 85 31 __ STA P4 
157c : a9 a0 __ LDA #$a0
157e : 85 2e __ STA P1 
1580 : a9 40 __ LDA #$40
1582 : 85 2f __ STA P2 
1584 : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
1587 : a9 b0 __ LDA #$b0
1589 : 85 2d __ STA P0 
158b : a9 1c __ LDA #$1c
158d : 85 30 __ STA P3 
158f : a9 00 __ LDA #$00
1591 : 85 31 __ STA P4 
1593 : a9 ba __ LDA #$ba
1595 : 85 2e __ STA P1 
1597 : a9 40 __ LDA #$40
1599 : 85 2f __ STA P2 
159b : 20 47 19 JSR $1947 ; (vera_pal_putn.s0 + 0)
159e : a9 00 __ LDA #$00
15a0 : 85 2d __ STA P0 
15a2 : 85 30 __ STA P3 
15a4 : 85 33 __ STA P6 
15a6 : a9 41 __ LDA #$41
15a8 : 85 2e __ STA P1 
15aa : a9 01 __ LDA #$01
15ac : 85 2f __ STA P2 
15ae : a9 04 __ LDA #$04
15b0 : 85 34 __ STA P7 
15b2 : a9 d6 __ LDA #$d6
15b4 : 85 31 __ STA P4 
15b6 : a9 40 __ LDA #$40
15b8 : 85 32 __ STA P5 
15ba : 20 12 18 JSR $1812 ; (vram_putn.s0 + 0)
15bd : a9 03 __ LDA #$03
15bf : 85 32 __ STA P5 
15c1 : 85 34 __ STA P7 
15c3 : a9 08 __ LDA #$08
15c5 : 85 33 __ STA P6 
15c7 : a9 40 __ LDA #$40
15c9 : 85 35 __ STA P8 
15cb : a9 57 __ LDA #$57
15cd : 85 36 __ STA P9 
15cf : a9 01 __ LDA #$01
15d1 : 85 37 __ STA P10 
15d3 : a9 00 __ LDA #$00
15d5 : 85 38 __ STA P11 
15d7 : 8d fa 9e STA $9efa ; (sstack + 0)
15da : a9 20 __ LDA #$20
15dc : 8d fb 9e STA $9efb ; (sstack + 1)
15df : a9 6f __ LDA #$6f
15e1 : 85 30 __ STA P3 
15e3 : a9 1a __ LDA #$1a
15e5 : 85 31 __ STA P4 
15e7 : 20 90 19 JSR $1990 ; (LoadSprite.s0 + 0)
15ea : a9 03 __ LDA #$03
15ec : 85 2d __ STA P0 
15ee : 85 31 __ STA P4 
15f0 : a9 ba __ LDA #$ba
15f2 : 85 2e __ STA P1 
15f4 : a9 0a __ LDA #$0a
15f6 : 85 2f __ STA P2 
15f8 : a9 00 __ LDA #$00
15fa : 85 30 __ STA P3 
15fc : a9 07 __ LDA #$07
15fe : 85 33 __ STA P6 
1600 : a9 0b __ LDA #$0b
1602 : 85 34 __ STA P7 
1604 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1607 : a9 08 __ LDA #$08
1609 : 85 2e __ STA P1 
160b : 85 30 __ STA P3 
160d : a9 00 __ LDA #$00
160f : 85 2f __ STA P2 
1611 : 85 31 __ STA P4 
1613 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1616 : a9 04 __ LDA #$04
1618 : 85 2d __ STA P0 
161a : a9 fa __ LDA #$fa
161c : 85 2e __ STA P1 
161e : a9 0a __ LDA #$0a
1620 : 85 2f __ STA P2 
1622 : a9 00 __ LDA #$00
1624 : 85 30 __ STA P3 
1626 : a9 03 __ LDA #$03
1628 : 85 31 __ STA P4 
162a : 85 33 __ STA P6 
162c : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
162f : a9 48 __ LDA #$48
1631 : 85 2e __ STA P1 
1633 : a9 00 __ LDA #$00
1635 : 85 2f __ STA P2 
1637 : 85 31 __ STA P4 
1639 : a9 08 __ LDA #$08
163b : 85 30 __ STA P3 
163d : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1640 : a9 05 __ LDA #$05
1642 : 85 2d __ STA P0 
1644 : a9 3a __ LDA #$3a
1646 : 85 2e __ STA P1 
1648 : a9 0b __ LDA #$0b
164a : 85 2f __ STA P2 
164c : a9 00 __ LDA #$00
164e : 85 30 __ STA P3 
1650 : a9 03 __ LDA #$03
1652 : 85 31 __ STA P4 
1654 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1657 : a9 08 __ LDA #$08
1659 : 85 2e __ STA P1 
165b : a9 00 __ LDA #$00
165d : 85 2f __ STA P2 
165f : 85 31 __ STA P4 
1661 : a9 48 __ LDA #$48
1663 : 85 30 __ STA P3 
1665 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1668 : a9 06 __ LDA #$06
166a : 85 2d __ STA P0 
166c : a9 7a __ LDA #$7a
166e : 85 2e __ STA P1 
1670 : a9 0b __ LDA #$0b
1672 : 85 2f __ STA P2 
1674 : a9 00 __ LDA #$00
1676 : 85 30 __ STA P3 
1678 : a9 03 __ LDA #$03
167a : 85 31 __ STA P4 
167c : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
167f : a9 48 __ LDA #$48
1681 : 85 2e __ STA P1 
1683 : 85 30 __ STA P3 
1685 : a9 00 __ LDA #$00
1687 : 85 2f __ STA P2 
1689 : 85 31 __ STA P4 
168b : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
168e : a9 07 __ LDA #$07
1690 : 85 2d __ STA P0 
1692 : 85 33 __ STA P6 
1694 : a9 ba __ LDA #$ba
1696 : 85 2e __ STA P1 
1698 : a9 0a __ LDA #$0a
169a : 85 2f __ STA P2 
169c : a9 00 __ LDA #$00
169e : 85 30 __ STA P3 
16a0 : a9 03 __ LDA #$03
16a2 : 85 31 __ STA P4 
16a4 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
16a7 : a9 f8 __ LDA #$f8
16a9 : 85 2e __ STA P1 
16ab : a9 01 __ LDA #$01
16ad : 85 2f __ STA P2 
16af : a9 08 __ LDA #$08
16b1 : 85 30 __ STA P3 
16b3 : a9 00 __ LDA #$00
16b5 : 85 31 __ STA P4 
16b7 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
16ba : a9 08 __ LDA #$08
16bc : 85 2d __ STA P0 
16be : a9 fa __ LDA #$fa
16c0 : 85 2e __ STA P1 
16c2 : a9 0a __ LDA #$0a
16c4 : 85 2f __ STA P2 
16c6 : a9 00 __ LDA #$00
16c8 : 85 30 __ STA P3 
16ca : a9 03 __ LDA #$03
16cc : 85 31 __ STA P4 
16ce : 85 33 __ STA P6 
16d0 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
16d3 : a9 38 __ LDA #$38
16d5 : 85 2e __ STA P1 
16d7 : a9 02 __ LDA #$02
16d9 : 85 2f __ STA P2 
16db : a9 08 __ LDA #$08
16dd : 85 30 __ STA P3 
16df : a9 00 __ LDA #$00
16e1 : 85 31 __ STA P4 
16e3 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
16e6 : a9 09 __ LDA #$09
16e8 : 85 2d __ STA P0 
16ea : a9 3a __ LDA #$3a
16ec : 85 2e __ STA P1 
16ee : a9 0b __ LDA #$0b
16f0 : 85 2f __ STA P2 
16f2 : a9 00 __ LDA #$00
16f4 : 85 30 __ STA P3 
16f6 : a9 03 __ LDA #$03
16f8 : 85 31 __ STA P4 
16fa : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
16fd : a9 f8 __ LDA #$f8
16ff : 85 2e __ STA P1 
1701 : a9 01 __ LDA #$01
1703 : 85 2f __ STA P2 
1705 : a9 48 __ LDA #$48
1707 : 85 30 __ STA P3 
1709 : a9 00 __ LDA #$00
170b : 85 31 __ STA P4 
170d : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1710 : a9 0a __ LDA #$0a
1712 : 85 2d __ STA P0 
1714 : a9 7a __ LDA #$7a
1716 : 85 2e __ STA P1 
1718 : a9 0b __ LDA #$0b
171a : 85 2f __ STA P2 
171c : a9 00 __ LDA #$00
171e : 85 30 __ STA P3 
1720 : a9 03 __ LDA #$03
1722 : 85 31 __ STA P4 
1724 : 20 74 18 JSR $1874 ; (vera_spr_set.s0 + 0)
1727 : a9 38 __ LDA #$38
1729 : 85 2e __ STA P1 
172b : a9 02 __ LDA #$02
172d : 85 2f __ STA P2 
172f : a9 48 __ LDA #$48
1731 : 85 30 __ STA P3 
1733 : a9 00 __ LDA #$00
1735 : 85 31 __ STA P4 
1737 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
173a : ad 29 9f LDA $9f29 
173d : 09 70 __ ORA #$70
173f : 8d 29 9f STA $9f29 
.s1001:
1742 : 60 __ __ RTS
.s1031:
1743 : c9 34 __ CMP #$34
1745 : 90 05 __ BCC $174c ; (SetUpSprites.s1030 + 0)
.s89:
1747 : a9 09 __ LDA #$09
1749 : 4c c7 0f JMP $0fc7 ; (SetUpSprites.s279 + 0)
.s1030:
174c : a9 2c __ LDA #$2c
174e : c5 25 __ CMP WORK + 2 
1750 : 90 38 __ BCC $178a ; (SetUpSprites.s1023 + 0)
.s1029:
1752 : a5 4d __ LDA T2 + 0 
1754 : c9 08 __ CMP #$08
1756 : 90 06 __ BCC $175e ; (SetUpSprites.s95 + 0)
.s1028:
1758 : a9 48 __ LDA #$48
175a : c5 4d __ CMP T2 + 0 
175c : b0 05 __ BCS $1763 ; (SetUpSprites.s1027 + 0)
.s95:
175e : a9 00 __ LDA #$00
1760 : 4c c7 0f JMP $0fc7 ; (SetUpSprites.s279 + 0)
.s1027:
1763 : a5 4d __ LDA T2 + 0 
1765 : c9 0c __ CMP #$0c
1767 : 90 06 __ BCC $176f ; (SetUpSprites.s99 + 0)
.s1026:
1769 : a9 44 __ LDA #$44
176b : c5 4d __ CMP T2 + 0 
176d : b0 05 __ BCS $1774 ; (SetUpSprites.s1025 + 0)
.s99:
176f : a9 01 __ LDA #$01
1771 : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
.s1025:
1774 : a5 4d __ LDA T2 + 0 
1776 : c9 18 __ CMP #$18
1778 : 90 06 __ BCC $1780 ; (SetUpSprites.s103 + 0)
.s1024:
177a : a9 38 __ LDA #$38
177c : c5 4d __ CMP T2 + 0 
177e : b0 05 __ BCS $1785 ; (SetUpSprites.s104 + 0)
.s103:
1780 : a9 02 __ LDA #$02
1782 : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
.s104:
1785 : a9 03 __ LDA #$03
1787 : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
.s1023:
178a : a9 2f __ LDA #$2f
178c : c5 25 __ CMP WORK + 2 
178e : a5 4d __ LDA T2 + 0 
1790 : 90 36 __ BCC $17c8 ; (SetUpSprites.s1016 + 0)
.s1022:
1792 : c9 08 __ CMP #$08
1794 : 90 06 __ BCC $179c ; (SetUpSprites.s111 + 0)
.s1021:
1796 : a9 48 __ LDA #$48
1798 : c5 4d __ CMP T2 + 0 
179a : b0 05 __ BCS $17a1 ; (SetUpSprites.s1020 + 0)
.s111:
179c : a9 05 __ LDA #$05
179e : 4c c7 0f JMP $0fc7 ; (SetUpSprites.s279 + 0)
.s1020:
17a1 : a5 4d __ LDA T2 + 0 
17a3 : c9 0c __ CMP #$0c
17a5 : 90 06 __ BCC $17ad ; (SetUpSprites.s115 + 0)
.s1019:
17a7 : a9 44 __ LDA #$44
17a9 : c5 4d __ CMP T2 + 0 
17ab : b0 05 __ BCS $17b2 ; (SetUpSprites.s1018 + 0)
.s115:
17ad : a9 06 __ LDA #$06
17af : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
.s1018:
17b2 : a5 4d __ LDA T2 + 0 
17b4 : c9 18 __ CMP #$18
17b6 : 90 06 __ BCC $17be ; (SetUpSprites.s119 + 0)
.s1017:
17b8 : a9 38 __ LDA #$38
17ba : c5 4d __ CMP T2 + 0 
17bc : b0 05 __ BCS $17c3 ; (SetUpSprites.s120 + 0)
.s119:
17be : a9 07 __ LDA #$07
17c0 : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
.s120:
17c3 : a9 08 __ LDA #$08
17c5 : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
.s1016:
17c8 : c9 08 __ CMP #$08
17ca : 90 06 __ BCC $17d2 ; (SetUpSprites.s123 + 0)
.s1015:
17cc : a9 48 __ LDA #$48
17ce : c5 4d __ CMP T2 + 0 
17d0 : b0 05 __ BCS $17d7 ; (SetUpSprites.s1004 + 0)
.s123:
17d2 : a9 0c __ LDA #$0c
17d4 : 4c c7 0f JMP $0fc7 ; (SetUpSprites.s279 + 0)
.s1004:
17d7 : a5 4d __ LDA T2 + 0 
17d9 : c9 0c __ CMP #$0c
17db : 90 06 __ BCC $17e3 ; (SetUpSprites.s127 + 0)
.s1003:
17dd : a9 44 __ LDA #$44
17df : c5 4d __ CMP T2 + 0 
17e1 : b0 05 __ BCS $17e8 ; (SetUpSprites.s131 + 0)
.s127:
17e3 : a9 0d __ LDA #$0d
17e5 : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
.s131:
17e8 : a9 0e __ LDA #$0e
17ea : 4c 5d 0f JMP $0f5d ; (SetUpSprites.s296 + 0)
--------------------------------------------------------------------
VolAddr:
2438 : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
IndAddr:
243c : __ __ __ BYT 00 00 00 00                                     : ....
--------------------------------------------------------------------
tileBaseConfig:
.s0:
17ed : 46 2d __ LSR P0 ; (bank + 0)
17ef : a9 00 __ LDA #$00
17f1 : 6a __ __ ROR
17f2 : 85 3b __ STA ACCU + 0 
17f4 : a5 2f __ LDA P2 ; (mem + 1)
17f6 : 29 f8 __ AND #$f8
17f8 : 4a __ __ LSR
17f9 : 05 3b __ ORA ACCU + 0 
17fb : 85 3b __ STA ACCU + 0 
17fd : a5 30 __ LDA P3 ; (height + 0)
17ff : 0a __ __ ASL
1800 : 05 3b __ ORA ACCU + 0 
1802 : 05 31 __ ORA P4 ; (width + 0)
.s1001:
1804 : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
1805 : 46 2d __ LSR P0 ; (bank + 0)
1807 : a9 00 __ LDA #$00
1809 : 6a __ __ ROR
180a : 85 3b __ STA ACCU + 0 
180c : a5 2f __ LDA P2 ; (mem + 1)
180e : 4a __ __ LSR
180f : 05 3b __ ORA ACCU + 0 
.s1001:
1811 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
1812 : ad 25 9f LDA $9f25 
1815 : 29 fe __ AND #$fe
1817 : 8d 25 9f STA $9f25 
181a : a5 2d __ LDA P0 ; (addr + 0)
181c : 8d 20 9f STA $9f20 
181f : a5 2e __ LDA P1 ; (addr + 1)
1821 : 8d 21 9f STA $9f21 
1824 : a5 2f __ LDA P2 ; (addr + 2)
1826 : 29 01 __ AND #$01
1828 : 09 10 __ ORA #$10
182a : 8d 22 9f STA $9f22 
182d : a5 33 __ LDA P6 ; (size + 0)
182f : 05 34 __ ORA P7 ; (size + 1)
1831 : f0 19 __ BEQ $184c ; (vram_putn.s1001 + 0)
.s6:
1833 : a0 00 __ LDY #$00
1835 : a6 33 __ LDX P6 ; (size + 0)
1837 : f0 02 __ BEQ $183b ; (vram_putn.l1002 + 0)
.s1005:
1839 : e6 34 __ INC P7 ; (size + 1)
.l1002:
183b : b1 31 __ LDA (P4),y ; (data + 0)
183d : 8d 23 9f STA $9f23 
1840 : c8 __ __ INY
1841 : d0 02 __ BNE $1845 ; (vram_putn.s1009 + 0)
.s1008:
1843 : e6 32 __ INC P5 ; (data + 1)
.s1009:
1845 : ca __ __ DEX
1846 : d0 f3 __ BNE $183b ; (vram_putn.l1002 + 0)
.s1004:
1848 : c6 34 __ DEC P7 ; (size + 1)
184a : d0 ef __ BNE $183b ; (vram_putn.l1002 + 0)
.s1001:
184c : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
2440 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2450 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2460 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2470 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2480 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2490 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
24a0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
24b0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
24c0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
24d0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
24e0 : __ __ __ BYT 00 00 00 00 00 00 00 50 00 05 00 00 00 00 00 00 : .......P........
24f0 : __ __ __ BYT 05 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 : ................
2500 : __ __ __ BYT 11 11 11 11 16 11 16 11 11 11 11 11 11 11 11 11 : ................
2510 : __ __ __ BYT 11 11 11 11 16 11 11 11 11 11 11 61 11 11 11 11 : ...........a....
2520 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
2530 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
2540 : __ __ __ BYT 22 22 22 22 27 22 22 22 22 22 22 22 22 22 27 22 : """"'"""""""""'"
2550 : __ __ __ BYT 22 22 22 22 22 22 22 22 27 22 22 22 22 22 22 72 : """"""""'""""""r
2560 : __ __ __ BYT 00 44 44 44 00 04 44 44 40 00 44 44 44 00 04 44 : .DDD..DD@.DDD..D
2570 : __ __ __ BYT 44 40 00 44 44 44 00 04 44 44 40 00 44 44 44 00 : D@.DDD..DD@.DDD.
2580 : __ __ __ BYT 55 55 55 55 55 55 55 55 66 66 66 66 33 33 33 33 : UUUUUUUUffff3333
2590 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
25a0 : __ __ __ BYT 33 33 33 33 33 33 33 33 77 77 77 77 77 77 77 77 : 33333333wwwwwwww
25b0 : __ __ __ BYT 77 77 77 77 77 77 77 77 00 00 00 00 00 00 00 00 : wwwwwwww........
25c0 : __ __ __ BYT 05 00 00 50 00 08 80 00 00 89 98 00 08 95 59 80 : ...P..........Y.
25d0 : __ __ __ BYT 08 95 59 80 00 89 98 05 00 08 80 00 05 00 00 00 : ..Y.............
25e0 : __ __ __ BYT 13 11 11 11 11 11 11 31 11 18 81 11 11 89 98 11 : .......1........
25f0 : __ __ __ BYT 11 89 98 11 11 18 81 13 11 11 11 11 13 11 11 11 : ................
2600 : __ __ __ BYT 11 11 11 11 17 11 17 11 11 11 11 11 11 18 81 11 : ................
2610 : __ __ __ BYT 11 18 81 11 11 11 11 11 11 11 71 17 17 11 11 11 : ..........q.....
2620 : __ __ __ BYT aa aa aa aa ab bb bb bb ab cc cc cc ab cc cc cc : ................
2630 : __ __ __ BYT ab cc dd dd ab cc dd dd ab cc dd ee ab cc dd ef : ................
2640 : __ __ __ BYT aa aa aa aa bb bb bb bb cc cc cc cc cc cc cc cc : ................
2650 : __ __ __ BYT dd dd dd dd dd dd dd dd ee ee ee ee ff ff ff ff : ................
2660 : __ __ __ BYT aa aa aa aa bb bb bb ba cc cc cc ba cc cc cc ba : ................
2670 : __ __ __ BYT dd dd cc ba dd dd cc ba ee dd cc ba fe dd cc ba : ................
2680 : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
2690 : __ __ __ BYT ab cc dd ef ab cc dd ef ab cc dd ef ab cc dd ef : ................
26a0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
26b0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
26c0 : __ __ __ BYT ab cc dd ef ab cc dd ee ab cc dd dd ab cc dd dd : ................
26d0 : __ __ __ BYT ab cc cc cc ab cc cc cc ab bb bb bb aa aa aa aa : ................
26e0 : __ __ __ BYT ff ff ff ff ee ee ee ee dd dd dd dd dd dd dd dd : ................
26f0 : __ __ __ BYT cc cc cc cc cc cc cc cc bb bb bb bb aa aa aa aa : ................
2700 : __ __ __ BYT fe dd cc ba ee dd cc ba dd dd cc ba dd dd cc ba : ................
2710 : __ __ __ BYT cc cc cc ba cc cc cc ba bb bb bb ba aa aa aa aa : ................
2720 : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
2730 : __ __ __ BYT fe dd cc ba fe dd cc ba fe dd cc ba fe dd cc ba : ................
2740 : __ __ __ BYT 22 22 22 22 22 22 33 22 22 23 22 22 22 44 44 22 : """"""3""#"""DD"
2750 : __ __ __ BYT 24 84 84 82 22 44 44 22 23 23 32 32 22 22 22 22 : $..."DD"##22""""
--------------------------------------------------------------------
rand:
.s0:
184d : ad 61 27 LDA $2761 ; (seed + 1)
1850 : 4a __ __ LSR
1851 : ad 60 27 LDA $2760 ; (seed + 0)
1854 : 6a __ __ ROR
1855 : aa __ __ TAX
1856 : a9 00 __ LDA #$00
1858 : 6a __ __ ROR
1859 : 4d 60 27 EOR $2760 ; (seed + 0)
185c : 85 3b __ STA ACCU + 0 
185e : 8a __ __ TXA
185f : 4d 61 27 EOR $2761 ; (seed + 1)
1862 : 85 3c __ STA ACCU + 1 
1864 : 4a __ __ LSR
1865 : 45 3b __ EOR ACCU + 0 
1867 : 8d 60 27 STA $2760 ; (seed + 0)
186a : 85 3b __ STA ACCU + 0 
186c : 45 3c __ EOR ACCU + 1 
186e : 8d 61 27 STA $2761 ; (seed + 1)
1871 : 85 3c __ STA ACCU + 1 
.s1001:
1873 : 60 __ __ RTS
--------------------------------------------------------------------
seed:
2760 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
VERASprite:
2762 : __ __ __ BYT 00 00 01 00 01 01 11 10 11 10 00 11 00 00 00 00 : ................
2772 : __ __ __ BYT 00 00 01 00 01 01 22 20 12 21 01 22 10 00 00 00 : ......" .!."....
2782 : __ __ __ BYT 00 00 02 10 12 01 11 10 10 01 01 11 10 00 00 00 : ................
2792 : __ __ __ BYT 00 00 00 10 10 01 22 20 11 12 01 00 10 00 00 00 : ......" ........
27a2 : __ __ __ BYT 00 00 00 21 20 01 00 00 12 21 01 00 10 00 00 00 : ...! ....!......
27b2 : __ __ __ BYT 00 00 00 01 00 01 11 10 10 01 01 00 10 00 00 00 : ................
27c2 : __ __ __ BYT 00 00 00 02 00 02 22 20 20 02 02 00 20 00 00 00 : ......"  ... ...
27d2 : __ __ __ BYT 00 00 03 33 30 00 00 00 00 00 00 00 33 33 30 00 : ...30.......330.
27e2 : __ __ __ BYT 00 00 34 44 43 00 00 00 00 00 33 03 55 55 53 00 : ..4DC.....3.UUS.
27f2 : __ __ __ BYT 00 03 64 44 46 30 03 33 30 03 11 33 55 55 53 00 : ..dDF0.30..3UUS.
2802 : __ __ __ BYT 33 33 45 55 54 30 37 77 73 03 11 33 32 22 22 30 : 33EUT07ws..32""0
2812 : __ __ __ BYT 38 83 45 55 54 33 37 77 73 36 66 63 32 22 22 30 : 8.EUT37ws6fc2""0
2822 : __ __ __ BYT 38 83 33 33 33 93 77 73 39 36 66 63 32 22 22 30 : 8.333.ws96fc2""0
2832 : __ __ __ BYT 38 83 aa aa a9 93 77 73 33 63 36 39 32 22 22 30 : 8.....ws3c692""0
2842 : __ __ __ BYT 38 83 aa aa aa aa 33 3a aa 3a a3 aa 93 33 33 30 : 8.....3:.:...330
2852 : __ __ __ BYT 03 88 3b bb ba aa aa aa aa aa aa aa aa aa 99 30 : ..;............0
2862 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb aa a1 19 30 : ..;............0
2872 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb bb bb 14 41 93 : ..;...........A.
2882 : __ __ __ BYT 03 88 3b bb bb bb bb bb bb bb bb 1b bb 14 41 93 : ..;...........A.
2892 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 1b b1 19 93 : ..;..k..fa.f....
28a2 : __ __ __ BYT 03 88 3b bb bb 6c bb b6 66 6b b6 66 6b ba a9 93 : ..;..l..fk.fk...
28b2 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 b6 66 6b ba a9 93 : ..;..k..fa.fk...
28c2 : __ __ __ BYT 03 88 3b bb bb 6c bb bb bb bb b1 66 6b ba a9 93 : ..;..l.....fk...
28d2 : __ __ __ BYT 03 88 3b bb bb 6b bb 16 66 61 bb b1 bb ba a9 93 : ..;..k..fa......
28e2 : __ __ __ BYT 00 38 83 bb bb b6 cb b6 66 6b bb bb bb ba a9 93 : .8......fk......
28f2 : __ __ __ BYT 00 38 83 bb bb b6 bb 16 66 61 bb bb bb ba a9 93 : .8......fa......
2902 : __ __ __ BYT 00 38 83 1b b1 b6 cb bb bb bb b6 4b bb bb aa 99 : .8.........K....
2912 : __ __ __ BYT 00 38 83 b1 1b bb bb bb bb bb b6 6b bb bb a1 19 : .8.........k....
2922 : __ __ __ BYT 00 38 83 1b b1 b1 bb 1b b1 b1 b6 4b bb bb 14 41 : .8.........K...A
2932 : __ __ __ BYT 00 33 33 33 3b b1 b1 1b bb 1b bb bb bb bb 14 41 : .333;..........A
2942 : __ __ __ BYT 00 00 00 00 03 33 33 33 33 33 33 33 3b bb a1 19 : .....3333333;...
2952 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 03 33 33 33 : .............333
--------------------------------------------------------------------
YMSprite:
2962 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2972 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2982 : __ __ __ BYT 01 00 01 01 00 00 01 00 11 10 01 01 11 10 10 00 : ................
2992 : __ __ __ BYT 02 10 12 01 10 00 11 01 22 21 01 01 22 20 10 00 : ........"!.." ..
29a2 : __ __ __ BYT 00 21 20 01 21 01 21 02 00 01 01 01 11 00 10 00 : .! .!.!.........
29b2 : __ __ __ BYT 00 01 00 01 02 12 01 00 01 12 01 02 22 10 10 00 : ............"...
29c2 : __ __ __ BYT 00 01 00 01 00 20 01 00 12 20 01 00 00 10 10 00 : ..... ... ......
29d2 : __ __ __ BYT 00 01 00 01 00 00 01 01 20 00 01 00 00 10 10 00 : ........ .......
29e2 : __ __ __ BYT 00 01 00 01 00 00 01 01 11 11 01 01 11 20 10 00 : ............. ..
29f2 : __ __ __ BYT 00 02 00 02 00 00 02 02 22 22 02 02 22 00 20 00 : ........""..". .
2a02 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a12 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a22 : __ __ __ BYT 00 00 00 20 00 00 00 00 00 00 00 00 00 00 00 00 : ... ............
2a32 : __ __ __ BYT 00 00 33 33 20 20 20 00 00 00 00 00 00 00 00 00 : ..33   .........
2a42 : __ __ __ BYT 00 00 34 44 33 33 33 20 20 20 00 00 00 00 00 00 : ..4D333   ......
2a52 : __ __ __ BYT 00 03 44 44 44 44 44 33 33 33 20 20 20 00 00 00 : ..DDDDD333   ...
2a62 : __ __ __ BYT 00 03 54 44 44 44 44 44 44 44 33 33 33 20 20 00 : ..TDDDDDDD333  .
2a72 : __ __ __ BYT 00 03 55 44 44 44 44 44 44 44 44 44 44 33 33 00 : ..UDDDDDDDDDD33.
2a82 : __ __ __ BYT 00 03 55 44 66 44 44 44 44 44 44 44 44 43 73 00 : ..UDfDDDDDDDDCs.
2a92 : __ __ __ BYT 00 35 55 46 66 64 44 44 44 44 44 44 44 43 73 00 : .5UFfdDDDDDDDCs.
2aa2 : __ __ __ BYT 00 35 54 46 66 64 44 44 44 44 46 64 44 43 73 00 : .5TFfdDDDDFdDCs.
2ab2 : __ __ __ BYT 00 35 44 44 66 44 44 44 44 44 66 66 44 43 73 00 : .5DDfDDDDDffDCs.
2ac2 : __ __ __ BYT 00 34 44 44 44 44 44 44 44 44 66 66 44 37 30 00 : .4DDDDDDDDffD70.
2ad2 : __ __ __ BYT 03 44 44 44 44 44 44 44 44 44 46 64 44 37 30 00 : .DDDDDDDDDFdD70.
2ae2 : __ __ __ BYT 03 33 33 44 44 44 44 44 44 44 44 44 44 37 30 00 : .33DDDDDDDDDD70.
2af2 : __ __ __ BYT 05 05 05 33 33 33 33 34 44 44 44 44 44 37 30 00 : ...33334DDDDD70.
2b02 : __ __ __ BYT 02 02 02 00 20 20 20 03 33 33 33 33 44 37 30 00 : ....   .3333D70.
2b12 : __ __ __ BYT 00 20 20 20 20 20 20 02 02 02 02 02 33 33 30 00 : .      .....330.
2b22 : __ __ __ BYT 00 02 02 02 02 02 02 02 02 02 02 02 00 20 00 00 : ............. ..
2b32 : __ __ __ BYT 00 00 00 00 00 20 20 20 20 20 20 20 20 20 00 00 : .....         ..
2b42 : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 02 02 00 00 : ................
2b52 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 : .............. .
--------------------------------------------------------------------
vera_spr_set:
.s0:
1874 : ad 25 9f LDA $9f25 
1877 : 29 fe __ AND #$fe
1879 : 8d 25 9f STA $9f25 
187c : a5 2d __ LDA P0 ; (spr + 0)
187e : 0a __ __ ASL
187f : 0a __ __ ASL
1880 : 85 3b __ STA ACCU + 0 
1882 : a9 3f __ LDA #$3f
1884 : 2a __ __ ROL
1885 : 06 3b __ ASL ACCU + 0 
1887 : 2a __ __ ROL
1888 : 8d 21 9f STA $9f21 
188b : a5 3b __ LDA ACCU + 0 
188d : 8d 20 9f STA $9f20 
1890 : a9 11 __ LDA #$11
1892 : 8d 22 9f STA $9f22 
1895 : a5 30 __ LDA P3 ; (mode8 + 0)
1897 : f0 02 __ BEQ $189b ; (vera_spr_set.s11 + 0)
.s9:
1899 : a9 80 __ LDA #$80
.s11:
189b : 05 2f __ ORA P2 ; (addr32 + 1)
189d : a6 2e __ LDX P1 ; (addr32 + 0)
189f : 8e 23 9f STX $9f23 
18a2 : 8d 23 9f STA $9f23 
18a5 : a9 00 __ LDA #$00
18a7 : 8d 23 9f STA $9f23 
18aa : 8d 23 9f STA $9f23 
18ad : 8d 23 9f STA $9f23 
18b0 : 8d 23 9f STA $9f23 
18b3 : a5 33 __ LDA P6 ; (z + 0)
18b5 : 0a __ __ ASL
18b6 : 0a __ __ ASL
18b7 : 8d 23 9f STA $9f23 
18ba : a5 32 __ LDA P5 ; (h + 0)
18bc : 4a __ __ LSR
18bd : 6a __ __ ROR
18be : 29 80 __ AND #$80
18c0 : 6a __ __ ROR
18c1 : 85 3b __ STA ACCU + 0 
18c3 : a5 31 __ LDA P4 ; (w + 0)
18c5 : 0a __ __ ASL
18c6 : 0a __ __ ASL
18c7 : 0a __ __ ASL
18c8 : 0a __ __ ASL
18c9 : 05 3b __ ORA ACCU + 0 
18cb : 05 34 __ ORA P7 ; (pal + 0)
18cd : 8d 23 9f STA $9f23 
.s1001:
18d0 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
18d1 : ad 25 9f LDA $9f25 
18d4 : 29 fe __ AND #$fe
18d6 : 8d 25 9f STA $9f25 
18d9 : a5 2d __ LDA P0 ; (spr + 0)
18db : 0a __ __ ASL
18dc : 0a __ __ ASL
18dd : 85 3b __ STA ACCU + 0 
18df : a9 3f __ LDA #$3f
18e1 : 2a __ __ ROL
18e2 : 06 3b __ ASL ACCU + 0 
18e4 : 2a __ __ ROL
18e5 : aa __ __ TAX
18e6 : a5 3b __ LDA ACCU + 0 
18e8 : 09 02 __ ORA #$02
18ea : 8d 20 9f STA $9f20 
18ed : 8e 21 9f STX $9f21 
18f0 : a9 11 __ LDA #$11
18f2 : 8d 22 9f STA $9f22 
18f5 : a5 2e __ LDA P1 ; (x + 0)
18f7 : 8d 23 9f STA $9f23 
18fa : a5 2f __ LDA P2 ; (x + 1)
18fc : 8d 23 9f STA $9f23 
18ff : a5 30 __ LDA P3 ; (y + 0)
1901 : 8d 23 9f STA $9f23 
1904 : a5 31 __ LDA P4 ; (y + 1)
1906 : 8d 23 9f STA $9f23 
.s1001:
1909 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
2c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c10 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 12 21 00 00 12 21 00 : ..........!...!.
2c20 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2c30 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2c40 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2c50 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2c60 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2c70 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2c80 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2c90 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2ca0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2cb0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2cc0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
2cd0 : __ __ __ BYT 00 11 11 00 00 11 11 00 00 22 22 00 00 22 22 00 : ........."".."".
2ce0 : __ __ __ BYT 00 22 22 00 00 22 22 00 00 00 00 00 00 00 00 00 : ."".."".........
2cf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
Arrow:
2d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
2d10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 : ................
2d20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 : ..............."
2d30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 : ..............""
2d40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 : ............."".
2d50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 : ............""..
2d60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 : ...........""...
2d70 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 : ..........""....
2d80 : __ __ __ BYT 00 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 : ........."".....
2d90 : __ __ __ BYT 00 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 : ........""......
2da0 : __ __ __ BYT 00 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 : ......."".......
2db0 : __ __ __ BYT 00 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 : ......""........
2dc0 : __ __ __ BYT 00 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 : ....."".........
2dd0 : __ __ __ BYT 00 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 : ....""..........
2de0 : __ __ __ BYT 00 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 : ...""...........
2df0 : __ __ __ BYT 11 11 22 22 00 00 00 00 00 00 00 00 00 00 00 00 : ..""............
2e00 : __ __ __ BYT 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 00 : "...............
2e10 : __ __ __ BYT 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 00 : ""..............
2e20 : __ __ __ BYT 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 00 : ."".............
2e30 : __ __ __ BYT 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 00 : ..""............
2e40 : __ __ __ BYT 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 00 : ...""...........
2e50 : __ __ __ BYT 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 00 : ....""..........
2e60 : __ __ __ BYT 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 00 : ....."".........
2e70 : __ __ __ BYT 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 00 : ......""........
2e80 : __ __ __ BYT 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 00 : ......."".......
2e90 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 00 : ........""......
2ea0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 00 : ........."".....
2eb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 00 : ..........""....
2ec0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 00 : ...........""...
2ed0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 11 : ............""..
2ee0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 11 : ............."".
2ef0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 22 22 : ..............""
--------------------------------------------------------------------
vera_spr_flip:
.s0:
190a : ad 25 9f LDA $9f25 
190d : 29 fe __ AND #$fe
190f : 8d 25 9f STA $9f25 
1912 : a5 2d __ LDA P0 ; (spr + 0)
1914 : 0a __ __ ASL
1915 : 0a __ __ ASL
1916 : 85 3b __ STA ACCU + 0 
1918 : a9 3f __ LDA #$3f
191a : 2a __ __ ROL
191b : 06 3b __ ASL ACCU + 0 
191d : 2a __ __ ROL
191e : aa __ __ TAX
191f : a5 3b __ LDA ACCU + 0 
1921 : 09 06 __ ORA #$06
1923 : 8d 20 9f STA $9f20 
1926 : 8e 21 9f STX $9f21 
1929 : a9 01 __ LDA #$01
192b : 8d 22 9f STA $9f22 
192e : ad 23 9f LDA $9f23 
1931 : 29 fc __ AND #$fc
1933 : a8 __ __ TAY
1934 : a5 2e __ LDA P1 ; (fliph + 0)
1936 : f0 01 __ BEQ $1939 ; (vera_spr_flip.s14 + 0)
.s6:
1938 : c8 __ __ INY
.s14:
1939 : a5 2f __ LDA P2 ; (flipv + 0)
193b : f0 05 __ BEQ $1942 ; (vera_spr_flip.s11 + 0)
.s9:
193d : 98 __ __ TYA
193e : 09 02 __ ORA #$02
1940 : d0 01 __ BNE $1943 ; (vera_spr_flip.s1002 + 0)
.s11:
1942 : 98 __ __ TYA
.s1002:
1943 : 8d 23 9f STA $9f23 
.s1001:
1946 : 60 __ __ RTS
--------------------------------------------------------------------
vera_pal_putn:
.s0:
1947 : ad 25 9f LDA $9f25 
194a : 29 fe __ AND #$fe
194c : 8d 25 9f STA $9f25 
194f : a5 2d __ LDA P0 ; (index + 0)
1951 : 0a __ __ ASL
1952 : 8d 20 9f STA $9f20 
1955 : a9 7d __ LDA #$7d
1957 : 2a __ __ ROL
1958 : 8d 21 9f STA $9f21 
195b : a9 11 __ LDA #$11
195d : 8d 22 9f STA $9f22 
1960 : a5 30 __ LDA P3 ; (size + 0)
1962 : 05 31 __ ORA P4 ; (size + 1)
1964 : f0 29 __ BEQ $198f ; (vera_pal_putn.s1001 + 0)
.s6:
1966 : a6 30 __ LDX P3 ; (size + 0)
1968 : f0 02 __ BEQ $196c ; (vera_pal_putn.l3 + 0)
.s1003:
196a : e6 31 __ INC P4 ; (size + 1)
.l3:
196c : a0 01 __ LDY #$01
196e : b1 2e __ LDA (P1),y ; (color + 0)
1970 : 85 3c __ STA ACCU + 1 
1972 : 88 __ __ DEY
1973 : b1 2e __ LDA (P1),y ; (color + 0)
1975 : 8d 23 9f STA $9f23 
1978 : a5 3c __ LDA ACCU + 1 
197a : 8d 23 9f STA $9f23 
197d : 18 __ __ CLC
197e : a5 2e __ LDA P1 ; (color + 0)
1980 : 69 02 __ ADC #$02
1982 : 85 2e __ STA P1 ; (color + 0)
1984 : 90 02 __ BCC $1988 ; (vera_pal_putn.s1007 + 0)
.s1006:
1986 : e6 2f __ INC P2 ; (color + 1)
.s1007:
1988 : ca __ __ DEX
1989 : d0 e1 __ BNE $196c ; (vera_pal_putn.l3 + 0)
.s1002:
198b : c6 31 __ DEC P4 ; (size + 1)
198d : d0 dd __ BNE $196c ; (vera_pal_putn.l3 + 0)
.s1001:
198f : 60 __ __ RTS
--------------------------------------------------------------------
palette:
2b62 : __ __ __ BYT ff 0f bb 0b 99 09 66 06 44 04 22 02 92 02 c2 02 : ......f.D.".....
2b72 : __ __ __ BYT 61 01 30 00 00 00 00 00 00 00 00 00 00 00 00 00 : a.0.............
--------------------------------------------------------------------
VolumeInd:
2f00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2f40 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2f50 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
2f60 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2f70 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
2f80 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2f90 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
2fa0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2fb0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
2fc0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2fd0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
2fe0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
2ff0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
3000 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3010 : __ __ __ BYT 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 77 : wwwwwwwwwwwwwwww
3020 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3030 : __ __ __ BYT 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 88 : ................
3040 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3050 : __ __ __ BYT 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 99 : ................
3060 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3070 : __ __ __ BYT aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa aa : ................
3080 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
3090 : __ __ __ BYT bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb : ................
30a0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
30b0 : __ __ __ BYT cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc : ................
30c0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
30d0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
30e0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
30f0 : __ __ __ BYT dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd dd : ................
--------------------------------------------------------------------
MainPupil:
3100 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
3110 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 22 22 10 00 00 : ....!......""...
3120 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 12 22 22 21 00 00 : ...""......""!..
3130 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 01 22 22 22 22 10 00 : ...""!....""""..
3140 : __ __ __ BYT 00 01 22 21 12 22 10 00 00 12 22 21 12 22 21 00 : .."!."...."!."!.
3150 : __ __ __ BYT 00 12 22 13 31 22 21 00 01 22 22 13 31 22 22 10 : ..".1"!.."".1"".
3160 : __ __ __ BYT 01 22 21 33 33 12 22 10 12 22 21 33 33 12 22 21 : ."!33.".."!33."!
3170 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
3180 : __ __ __ BYT 12 22 13 34 43 31 22 21 12 22 13 34 43 31 22 21 : .".4C1"!.".4C1"!
3190 : __ __ __ BYT 12 22 21 33 33 12 22 21 01 22 21 33 33 12 22 10 : ."!33."!."!33.".
31a0 : __ __ __ BYT 01 22 22 13 31 22 22 10 00 12 22 13 31 22 21 00 : ."".1""...".1"!.
31b0 : __ __ __ BYT 00 12 22 21 12 22 21 00 00 01 22 21 12 22 10 00 : .."!."!..."!."..
31c0 : __ __ __ BYT 00 01 22 22 22 22 10 00 00 00 12 22 22 21 00 00 : .."""".....""!..
31d0 : __ __ __ BYT 00 00 12 22 22 21 00 00 00 00 01 22 22 10 00 00 : ...""!.....""...
31e0 : __ __ __ BYT 00 00 01 22 22 10 00 00 00 00 00 12 21 00 00 00 : ..."".......!...
31f0 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
MainEyeBack:
3200 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
3210 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3220 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 12 34 : ...............4
3230 : __ __ __ BYT 43 21 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : C!..............
3240 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
3250 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
3260 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3270 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
3280 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3290 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
32a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
32b0 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
32c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
32d0 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
32e0 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
32f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3300 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
3310 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3320 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
3330 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
3340 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
3350 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
3360 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3370 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
3380 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3390 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
33a0 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
33b0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
33c0 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
33d0 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
33e0 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
33f0 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3400 : __ __ __ BYT 1d e1 ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 : .....2ez..ub4...
3410 : __ __ __ BYT 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de 1e d1 : ...C&W...V#H....
3420 : __ __ __ BYT 01 1e 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3430 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 e1 10 : ...2ez..ub4.....
3440 : __ __ __ BYT 00 01 1e dc b8 43 26 57 a9 99 a7 56 23 48 bc de : .....C&W...V#H..
3450 : __ __ __ BYT ed cb 84 32 65 7a 99 9a 75 62 34 8b cd e1 10 00 : ...2ez..ub4.....
3460 : __ __ __ BYT 00 00 01 1d cb 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3470 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 bc d1 10 00 00 : ..C&W...V#H.....
3480 : __ __ __ BYT 00 00 00 01 1b 84 32 65 7a 99 9a 75 62 34 8b cd : ......2ez..ub4..
3490 : __ __ __ BYT dc b8 43 26 57 a9 99 a7 56 23 48 b1 10 00 00 00 : ..C&W...V#H.....
34a0 : __ __ __ BYT 00 00 00 00 01 18 43 26 57 a9 99 a7 56 23 48 bc : ......C&W...V#H.
34b0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 34 81 10 00 00 00 00 : ..2ez..ub4......
34c0 : __ __ __ BYT 00 00 00 00 00 01 13 26 57 a9 99 a7 56 23 48 bc : .......&W...V#H.
34d0 : __ __ __ BYT cb 84 32 65 7a 99 9a 75 62 31 10 00 00 00 00 00 : ..2ez..ub1......
34e0 : __ __ __ BYT 00 00 00 00 00 00 01 12 65 7a 99 9a 75 62 34 8b : ........ez..ub4.
34f0 : __ __ __ BYT b8 43 26 57 a9 99 a7 56 21 10 00 00 00 00 00 00 : .C&W...V!.......
3500 : __ __ __ BYT 00 00 00 00 00 00 00 01 15 7a 99 9a 75 62 34 8b : .........z..ub4.
3510 : __ __ __ BYT b8 43 26 57 a9 99 a7 51 10 00 00 00 00 00 00 00 : .C&W...Q........
3520 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 1a 99 9a 75 62 34 8b : ............ub4.
3530 : __ __ __ BYT b8 43 26 57 a9 99 a1 10 00 00 00 00 00 00 00 00 : .C&W............
3540 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 01 19 99 a7 56 23 48 : .............V#H
3550 : __ __ __ BYT 84 32 65 7a 99 91 10 00 00 00 00 00 00 00 00 00 : .2ez............
3560 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 01 19 a7 56 23 48 : .............V#H
3570 : __ __ __ BYT 84 32 65 7a 91 10 00 00 00 00 00 00 00 00 00 00 : .2ez............
3580 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 01 17 56 23 48 : .............V#H
3590 : __ __ __ BYT 84 32 65 71 10 00 00 00 00 00 00 00 00 00 00 00 : .2eq............
35a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 01 15 62 34 : ..............b4
35b0 : __ __ __ BYT 43 26 51 10 00 00 00 00 00 00 00 00 00 00 00 00 : C&Q.............
35c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 01 16 34 : ...............4
35d0 : __ __ __ BYT 43 61 10 00 00 00 00 00 00 00 00 00 00 00 00 00 : Ca..............
35e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 11 : ................
35f0 : __ __ __ BYT 11 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
TowerBase:
3600 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3610 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3620 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3630 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3640 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3650 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3660 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3670 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3680 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3690 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36a0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36b0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36c0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36d0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36e0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
36f0 : __ __ __ BYT 00 12 34 56 78 9a bc de 00 12 34 56 78 9a bc de : ..4Vx.....4Vx...
3700 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3710 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3720 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3730 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3740 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3750 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3760 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3770 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3780 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
3790 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37a0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37b0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37c0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37d0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37e0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
37f0 : __ __ __ BYT ed cb a9 87 65 43 21 00 ed cb a9 87 65 43 21 00 : ....eC!.....eC!.
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
3a00 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3a10 : __ __ __ BYT ee ee ee ee 00 00 00 00 ee ee ee ee 00 00 00 00 : ................
3a20 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3a30 : __ __ __ BYT dd dd dd dd 00 00 00 00 dd dd dd dd 00 00 00 00 : ................
3a40 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3a50 : __ __ __ BYT cc cc cc cc 11 11 11 11 cc cc cc cc 11 11 11 11 : ................
3a60 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3a70 : __ __ __ BYT bb bb bb bb 22 22 22 22 bb bb bb bb 22 22 22 22 : ....""""....""""
3a80 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3a90 : __ __ __ BYT aa aa aa aa 33 33 33 33 aa aa aa aa 33 33 33 33 : ....3333....3333
3aa0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3ab0 : __ __ __ BYT 99 99 99 99 44 44 44 44 99 99 99 99 44 44 44 44 : ....DDDD....DDDD
3ac0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3ad0 : __ __ __ BYT 88 88 88 88 55 55 55 55 88 88 88 88 55 55 55 55 : ....UUUU....UUUU
3ae0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3af0 : __ __ __ BYT 77 77 77 77 66 66 66 66 77 77 77 77 66 66 66 66 : wwwwffffwwwwffff
3b00 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3b10 : __ __ __ BYT 66 66 66 66 77 77 77 77 66 66 66 66 77 77 77 77 : ffffwwwwffffwwww
3b20 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3b30 : __ __ __ BYT 55 55 55 55 88 88 88 88 55 55 55 55 88 88 88 88 : UUUU....UUUU....
3b40 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3b50 : __ __ __ BYT 44 44 44 44 99 99 99 99 44 44 44 44 99 99 99 99 : DDDD....DDDD....
3b60 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3b70 : __ __ __ BYT 33 33 33 33 aa aa aa aa 33 33 33 33 aa aa aa aa : 3333....3333....
3b80 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3b90 : __ __ __ BYT 22 22 22 22 bb bb bb bb 22 22 22 22 bb bb bb bb : """"....""""....
3ba0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3bb0 : __ __ __ BYT 11 11 11 11 cc cc cc cc 11 11 11 11 cc cc cc cc : ................
3bc0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3bd0 : __ __ __ BYT 00 00 00 00 dd dd dd dd 00 00 00 00 dd dd dd dd : ................
3be0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
3bf0 : __ __ __ BYT 00 00 00 00 ee ee ee ee 00 00 00 00 ee ee ee ee : ................
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
--------------------------------------------------------------------
WavyHead:
3e00 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
3e10 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3e20 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3e30 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3e40 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3e50 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3e60 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3e70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3e80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3e90 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3ea0 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3eb0 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3ec0 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3ed0 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3ee0 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3ef0 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3f00 : __ __ __ BYT 12 22 22 23 33 33 37 78 87 73 33 33 32 22 22 21 : .""#337x.s332""!
3f10 : __ __ __ BYT 01 11 12 22 22 33 33 78 87 33 33 22 22 21 11 10 : ...""33x.33""!..
3f20 : __ __ __ BYT 00 00 01 11 22 23 33 77 77 33 32 22 11 10 00 00 : ...."#3ww32"....
3f30 : __ __ __ BYT 00 00 01 66 11 22 33 37 73 33 22 11 66 10 00 00 : ...f."37s3".f...
3f40 : __ __ __ BYT 00 00 01 55 66 12 23 33 33 32 21 66 55 10 00 00 : ...Uf.#332!fU...
3f50 : __ __ __ BYT 00 00 01 55 55 61 22 33 33 22 16 55 55 10 00 00 : ...UUa"33".UU...
3f60 : __ __ __ BYT 00 00 01 44 55 56 12 23 32 21 65 55 44 10 00 00 : ...DUV.#2!eUD...
3f70 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3f80 : __ __ __ BYT 00 00 01 44 45 56 12 23 32 21 65 54 44 10 00 00 : ...DEV.#2!eTD...
3f90 : __ __ __ BYT 00 00 00 11 11 11 12 23 32 21 11 11 11 00 00 00 : .......#2!......
3fa0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3fb0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3fc0 : __ __ __ BYT 00 00 00 00 00 00 01 22 22 10 00 00 00 00 00 00 : ......."".......
3fd0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3fe0 : __ __ __ BYT 00 00 00 00 00 00 00 12 21 00 00 00 00 00 00 00 : ........!.......
3ff0 : __ __ __ BYT 00 00 00 00 00 00 00 01 10 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavySprite:
4000 : __ __ __ BYT 00 00 00 01 10 00 00 00 00 00 00 12 21 00 00 00 : ............!...
4010 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 01 23 32 10 00 00 : ....!......#2...
4020 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 12 33 33 21 00 00 : ...#2......33!..
4030 : __ __ __ BYT 00 11 23 34 43 32 11 00 11 22 33 44 44 33 22 11 : ..#4C2..."3DD3".
4040 : __ __ __ BYT 11 22 33 44 44 33 22 11 00 11 23 34 43 32 11 00 : ."3DD3"...#4C2..
4050 : __ __ __ BYT 00 00 12 33 33 21 00 00 00 00 01 23 32 10 00 00 : ...33!.....#2...
4060 : __ __ __ BYT 00 00 01 23 32 10 00 00 00 00 00 12 21 00 00 00 : ...#2.......!...
4070 : __ __ __ BYT 00 00 00 12 21 00 00 00 00 00 00 01 10 00 00 00 : ....!...........
--------------------------------------------------------------------
BGPal:
2b82 : __ __ __ BYT 24 02 12 01 11 01 aa 0a 26 02 ff 0f dd 0d 66 06 : $.......&.....f.
2b92 : __ __ __ BYT 9f 0b ef 0e 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 : ......m.M.).+.-.
--------------------------------------------------------------------
ButtonStageMax:
2ba2 : __ __ __ BYT f4 04 e4 04 d4 04 c4 04 b3 03 a3 03 93 03 83 03 : ................
2bb2 : __ __ __ BYT 72 02 62 02 52 02 41 01 31 01 21 01 10 00 00 00 : r.b.R.A.1.!.....
--------------------------------------------------------------------
CharBoxPalette:
2bc2 : __ __ __ BYT 9f 09 6d 06 4d 04 29 02 2b 02 2d 02 00 00 00 00 : ..m.M.).+.-.....
2bd2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
WavyPal:
2be2 : __ __ __ BYT 00 0d 00 09 d0 0d 99 00 d0 00 90 00             : ............
--------------------------------------------------------------------
TextPal:
4080 : __ __ __ BYT ef 0e df 0d cf 0c bf 0b af 0a 9f 09 8f 08 7f 07 : ................
4090 : __ __ __ BYT 6f 06 7f 07 8f 08 9f 09 af 0a bf 0b cf 0c df 0d : o...............
--------------------------------------------------------------------
YMPal:
2bee : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 22 02 44 04 66 06 11 01 : ........".D.f...
--------------------------------------------------------------------
VERAPal:
40a0 : __ __ __ BYT 00 00 ff 0f dd 0d 00 00 66 06 11 01 44 04 22 02 : ........f...D.".
40b0 : __ __ __ BYT 14 01 6f 06 4f 04 3f 01 fd 00                   : ..o.O.?...
--------------------------------------------------------------------
CoderPal:
40ba : __ __ __ BYT 00 00 00 00 ff 0f dd 0d b2 02 d4 04 e5 05 fb 00 : ................
40ca : __ __ __ BYT bf 00 10 0c 22 0f 1b 01 00 00 00 00             : ....".......
--------------------------------------------------------------------
EyeTri:
40d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
40f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4106 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
4116 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4126 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4136 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4146 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4156 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4166 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4176 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4186 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4196 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41a6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
41b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
41d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41e6 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
41f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4206 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4216 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4226 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4236 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4246 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4256 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4266 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4276 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4286 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4296 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42a6 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
42b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42c6 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
42d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 : ................
42e6 : __ __ __ BYT 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 : "3DUfw."3D.3DUfw
42f6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 : ..............."
4306 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 : 3DUfw."3D.3DUfw.
4316 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 : .............."3
4326 : __ __ __ BYT 44 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 : DUfw."3D.3DUfw."
4336 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 : ............."3D
4346 : __ __ __ BYT 55 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 : Ufw."3D.3DUfw."3
4356 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 : ............"3DU
4366 : __ __ __ BYT 66 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 : fw."3D.3DUfw."3D
4376 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 : ..........."3DUf
4386 : __ __ __ BYT 77 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 : w."3D.3DUfw."3DU
4396 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 : .........."3DUfw
43a6 : __ __ __ BYT 88 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 : ."3D.3DUfw."3DUf
43b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 : ........."3DUfw.
43c6 : __ __ __ BYT 22 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 : "3D.3DUfw."3DUfw
43d6 : __ __ __ BYT 00 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 : ........"3DUfw."
43e6 : __ __ __ BYT 33 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 : 3D.3DUfw."3DUfw.
43f6 : __ __ __ BYT 00 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 : ......."3DUfw."3
4406 : __ __ __ BYT 44 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 : D.3DUfw."3DUfw."
4416 : __ __ __ BYT 00 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 : ......"3DUfw."3D
4426 : __ __ __ BYT 11 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 : .3DUfw."3DUfw."3
4436 : __ __ __ BYT 00 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 : ....."3DUfw."3D.
4446 : __ __ __ BYT 33 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 : 3DUfw."3DUfw."3D
4456 : __ __ __ BYT 00 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 : ...."3DUfw."3D.3
4466 : __ __ __ BYT 44 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 : DUfw."3DUfw."3DU
4476 : __ __ __ BYT 00 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 : ..."3DUfw."3D.3D
4486 : __ __ __ BYT 55 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 : Ufw."3DUfw."3DUf
4496 : __ __ __ BYT 00 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 : .."3DUfw."3D.3DU
44a6 : __ __ __ BYT 66 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 : fw."3DUfw."3DUfw
44b6 : __ __ __ BYT 11 22 33 44 55 66 77 88 22 33 44 11 33 44 55 66 : ."3DUfw."3D.3DUf
44c6 : __ __ __ BYT 77 88 22 33 44 55 66 77 88 22 33 44 55 66 77 88 : w."3DUfw."3DUfw.
--------------------------------------------------------------------
LoadSprite:
.s0:
1990 : a5 30 __ LDA P3 ; (name + 0)
1992 : 85 2d __ STA P0 
1994 : a5 31 __ LDA P4 ; (name + 1)
1996 : 85 2e __ STA P1 
1998 : 20 0d 1a JSR $1a0d ; (krnio_setnam.s0 + 0)
199b : a5 32 __ LDA P5 ; (fnum + 0)
199d : 85 2d __ STA P0 
199f : a5 33 __ LDA P6 ; (device + 0)
19a1 : 85 2e __ STA P1 
19a3 : a5 34 __ LDA P7 ; (channel + 0)
19a5 : 85 2f __ STA P2 
19a7 : 20 23 1a JSR $1a23 ; (krnio_open.s0 + 0)
19aa : a5 32 __ LDA P5 ; (fnum + 0)
19ac : 20 4b 1a JSR $1a4b ; (krnio_chkin.s1000 + 0)
19af : 20 5d 1a JSR $1a5d ; (krnio_chrin.s0 + 0)
19b2 : 20 5d 1a JSR $1a5d ; (krnio_chrin.s0 + 0)
19b5 : ad fb 9e LDA $9efb ; (sstack + 1)
19b8 : 85 48 __ STA T0 + 1 
19ba : ad fa 9e LDA $9efa ; (sstack + 0)
19bd : 85 47 __ STA T0 + 0 
19bf : 05 48 __ ORA T0 + 1 
19c1 : f0 42 __ BEQ $1a05 ; (LoadSprite.s4 + 0)
.s8:
19c3 : a9 00 __ LDA #$00
19c5 : 85 49 __ STA T2 + 0 
19c7 : 85 4a __ STA T2 + 1 
.l2:
19c9 : 20 5d 1a JSR $1a5d ; (krnio_chrin.s0 + 0)
19cc : ad 25 9f LDA $9f25 
19cf : 29 fe __ AND #$fe
19d1 : 8d 25 9f STA $9f25 
19d4 : 18 __ __ CLC
19d5 : a5 49 __ LDA T2 + 0 
19d7 : 65 35 __ ADC P8 ; (Addr + 0)
19d9 : 8d 20 9f STA $9f20 
19dc : a5 4a __ LDA T2 + 1 
19de : 65 36 __ ADC P9 ; (Addr + 1)
19e0 : 8d 21 9f STA $9f21 
19e3 : a9 00 __ LDA #$00
19e5 : 65 37 __ ADC P10 ; (Addr + 2)
19e7 : 29 01 __ AND #$01
19e9 : 09 10 __ ORA #$10
19eb : 8d 22 9f STA $9f22 
19ee : a5 3b __ LDA ACCU + 0 
19f0 : 8d 23 9f STA $9f23 
19f3 : e6 49 __ INC T2 + 0 
19f5 : d0 02 __ BNE $19f9 ; (LoadSprite.s1005 + 0)
.s1004:
19f7 : e6 4a __ INC T2 + 1 
.s1005:
19f9 : a5 4a __ LDA T2 + 1 
19fb : c5 48 __ CMP T0 + 1 
19fd : d0 04 __ BNE $1a03 ; (LoadSprite.s1003 + 0)
.s1002:
19ff : a5 49 __ LDA T2 + 0 
1a01 : c5 47 __ CMP T0 + 0 
.s1003:
1a03 : 90 c4 __ BCC $19c9 ; (LoadSprite.l2 + 0)
.s4:
1a05 : 20 fc 0b JSR $0bfc ; (krnio_clrchn.s0 + 0)
1a08 : a5 32 __ LDA P5 ; (fnum + 0)
1a0a : 4c 67 1a JMP $1a67 ; (krnio_close.s1000 + 0)
--------------------------------------------------------------------
krnio_setnam:
.s0:
1a0d : a5 2d __ LDA P0 
1a0f : 05 2e __ ORA P1 
1a11 : f0 08 __ BEQ $1a1b ; (krnio_setnam.s0 + 14)
1a13 : a0 ff __ LDY #$ff
1a15 : c8 __ __ INY
1a16 : b1 2d __ LDA (P0),y 
1a18 : d0 fb __ BNE $1a15 ; (krnio_setnam.s0 + 8)
1a1a : 98 __ __ TYA
1a1b : a6 2d __ LDX P0 
1a1d : a4 2e __ LDY P1 
1a1f : 20 bd ff JSR $ffbd 
.s1001:
1a22 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
1a23 : a9 00 __ LDA #$00
1a25 : a6 2d __ LDX P0 ; (fnum + 0)
1a27 : 9d e9 53 STA $53e9,x ; (krnio_pstatus + 0)
1a2a : a9 00 __ LDA #$00
1a2c : 85 3b __ STA ACCU + 0 
1a2e : 85 3c __ STA ACCU + 1 
1a30 : a5 2d __ LDA P0 ; (fnum + 0)
1a32 : a6 2e __ LDX P1 
1a34 : a4 2f __ LDY P2 
1a36 : 20 ba ff JSR $ffba 
1a39 : 20 c0 ff JSR $ffc0 
1a3c : 90 08 __ BCC $1a46 ; (krnio_open.s0 + 35)
1a3e : a5 2d __ LDA P0 ; (fnum + 0)
1a40 : 20 c3 ff JSR $ffc3 
1a43 : 4c 4a 1a JMP $1a4a ; (krnio_open.s1001 + 0)
1a46 : a9 01 __ LDA #$01
1a48 : 85 3b __ STA ACCU + 0 
.s1001:
1a4a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
53e9 : __ __ __ BSS	16
--------------------------------------------------------------------
krnio_chkin:
.s1000:
1a4b : 85 2d __ STA P0 
.s0:
1a4d : a6 2d __ LDX P0 
1a4f : 20 c6 ff JSR $ffc6 
1a52 : a9 00 __ LDA #$00
1a54 : 85 3c __ STA ACCU + 1 
1a56 : b0 02 __ BCS $1a5a ; (krnio_chkin.s0 + 13)
1a58 : a9 01 __ LDA #$01
1a5a : 85 3b __ STA ACCU + 0 
.s1001:
1a5c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1a5d : 20 cf ff JSR $ffcf 
1a60 : 85 3b __ STA ACCU + 0 
1a62 : a9 00 __ LDA #$00
1a64 : 85 3c __ STA ACCU + 1 
.s1001:
1a66 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0bfc : 20 cc ff JSR $ffcc 
.s1001:
0bff : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close:
.s1000:
1a67 : 85 2d __ STA P0 
.s0:
1a69 : a5 2d __ LDA P0 
1a6b : 20 c3 ff JSR $ffc3 
.s1001:
1a6e : 60 __ __ RTS
--------------------------------------------------------------------
1a6f : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1a7f : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
getchx:
.s0:
1a8e : 20 98 1a JSR $1a98 ; (getpch + 0)
1a91 : 85 3b __ STA ACCU + 0 
1a93 : a9 00 __ LDA #$00
1a95 : 85 3c __ STA ACCU + 1 
.s1001:
1a97 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
1a98 : 20 e4 ff JSR $ffe4 
1a9b : ae fe 2b LDX $2bfe ; (giocharmap + 0)
1a9e : e0 01 __ CPX #$01
1aa0 : 90 26 __ BCC $1ac8 ; (getpch + 48)
1aa2 : c9 0d __ CMP #$0d
1aa4 : d0 02 __ BNE $1aa8 ; (getpch + 16)
1aa6 : a9 0a __ LDA #$0a
1aa8 : e0 02 __ CPX #$02
1aaa : 90 1c __ BCC $1ac8 ; (getpch + 48)
1aac : c9 db __ CMP #$db
1aae : b0 18 __ BCS $1ac8 ; (getpch + 48)
1ab0 : c9 41 __ CMP #$41
1ab2 : 90 14 __ BCC $1ac8 ; (getpch + 48)
1ab4 : c9 c1 __ CMP #$c1
1ab6 : 90 02 __ BCC $1aba ; (getpch + 34)
1ab8 : 49 a0 __ EOR #$a0
1aba : c9 7b __ CMP #$7b
1abc : b0 0a __ BCS $1ac8 ; (getpch + 48)
1abe : c9 61 __ CMP #$61
1ac0 : b0 04 __ BCS $1ac6 ; (getpch + 46)
1ac2 : c9 5b __ CMP #$5b
1ac4 : b0 02 __ BCS $1ac8 ; (getpch + 48)
1ac6 : 49 20 __ EOR #$20
1ac8 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
2bfe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
p:
44d6 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase:
44d8 : __ __ __ BYT 08 00                                           : ..
--------------------------------------------------------------------
Phase2:
44da : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Phase3:
44dc : __ __ __ BYT 10 00                                           : ..
--------------------------------------------------------------------
MoveSprites:
.s0:
1ac9 : a9 33 __ LDA #$33
1acb : 85 2d __ STA P0 
1acd : a9 38 __ LDA #$38
1acf : 85 2e __ STA P1 
1ad1 : a9 01 __ LDA #$01
1ad3 : 85 2f __ STA P2 
1ad5 : a6 32 __ LDX P5 ; (p + 0)
1ad7 : bd 00 45 LDA $4500,x ; (sintab + 0)
1ada : 4a __ __ LSR
1adb : 4a __ __ LSR
1adc : 4a __ __ LSR
1add : 49 10 __ EOR #$10
1adf : 38 __ __ SEC
1ae0 : e9 10 __ SBC #$10
1ae2 : 18 __ __ CLC
1ae3 : 69 b4 __ ADC #$b4
1ae5 : 85 30 __ STA P3 
1ae7 : a9 00 __ LDA #$00
1ae9 : 85 31 __ STA P4 
1aeb : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1aee : a9 34 __ LDA #$34
1af0 : 85 2d __ STA P0 
1af2 : a9 20 __ LDA #$20
1af4 : 85 2e __ STA P1 
1af6 : a6 34 __ LDX P7 ; (p2 + 0)
1af8 : bd 00 45 LDA $4500,x ; (sintab + 0)
1afb : 4a __ __ LSR
1afc : 4a __ __ LSR
1afd : 4a __ __ LSR
1afe : 49 10 __ EOR #$10
1b00 : 38 __ __ SEC
1b01 : e9 10 __ SBC #$10
1b03 : 18 __ __ CLC
1b04 : 69 b4 __ ADC #$b4
1b06 : 85 30 __ STA P3 
1b08 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1b0b : a9 35 __ LDA #$35
1b0d : 85 2d __ STA P0 
1b0f : a9 00 __ LDA #$00
1b11 : 85 2e __ STA P1 
1b13 : a6 36 __ LDX P9 ; (p3 + 0)
1b15 : bd 00 45 LDA $4500,x ; (sintab + 0)
1b18 : 4a __ __ LSR
1b19 : 4a __ __ LSR
1b1a : 4a __ __ LSR
1b1b : 49 10 __ EOR #$10
1b1d : 38 __ __ SEC
1b1e : e9 10 __ SBC #$10
1b20 : 18 __ __ CLC
1b21 : 69 a4 __ ADC #$a4
1b23 : 85 30 __ STA P3 
1b25 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1b28 : a9 36 __ LDA #$36
1b2a : 85 2d __ STA P0 
1b2c : a9 40 __ LDA #$40
1b2e : 85 2e __ STA P1 
1b30 : a6 36 __ LDX P9 ; (p3 + 0)
1b32 : bd 00 45 LDA $4500,x ; (sintab + 0)
1b35 : 4a __ __ LSR
1b36 : 4a __ __ LSR
1b37 : 4a __ __ LSR
1b38 : 49 10 __ EOR #$10
1b3a : 38 __ __ SEC
1b3b : e9 10 __ SBC #$10
1b3d : 18 __ __ CLC
1b3e : 69 a4 __ ADC #$a4
1b40 : 85 30 __ STA P3 
1b42 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1b45 : a9 37 __ LDA #$37
1b47 : 85 2d __ STA P0 
1b49 : a9 00 __ LDA #$00
1b4b : 85 2e __ STA P1 
1b4d : a6 36 __ LDX P9 ; (p3 + 0)
1b4f : bd 00 45 LDA $4500,x ; (sintab + 0)
1b52 : 4a __ __ LSR
1b53 : 4a __ __ LSR
1b54 : 4a __ __ LSR
1b55 : 49 10 __ EOR #$10
1b57 : 38 __ __ SEC
1b58 : e9 10 __ SBC #$10
1b5a : 18 __ __ CLC
1b5b : 69 c4 __ ADC #$c4
1b5d : 85 30 __ STA P3 
1b5f : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1b62 : a9 38 __ LDA #$38
1b64 : 85 2d __ STA P0 
1b66 : a9 40 __ LDA #$40
1b68 : 85 2e __ STA P1 
1b6a : a6 36 __ LDX P9 ; (p3 + 0)
1b6c : bd 00 45 LDA $4500,x ; (sintab + 0)
1b6f : 4a __ __ LSR
1b70 : 4a __ __ LSR
1b71 : 4a __ __ LSR
1b72 : 49 10 __ EOR #$10
1b74 : 38 __ __ SEC
1b75 : e9 10 __ SBC #$10
1b77 : 18 __ __ CLC
1b78 : 69 c4 __ ADC #$c4
1b7a : 85 30 __ STA P3 
1b7c : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1b7f : a9 00 __ LDA #$00
1b81 : 85 2d __ STA P0 
1b83 : 85 2f __ STA P2 
1b85 : a9 68 __ LDA #$68
1b87 : 85 2e __ STA P1 
1b89 : a6 36 __ LDX P9 ; (p3 + 0)
1b8b : bd 00 45 LDA $4500,x ; (sintab + 0)
1b8e : 4a __ __ LSR
1b8f : 4a __ __ LSR
1b90 : 4a __ __ LSR
1b91 : 4a __ __ LSR
1b92 : 49 08 __ EOR #$08
1b94 : 38 __ __ SEC
1b95 : e9 08 __ SBC #$08
1b97 : 85 48 __ STA T2 + 0 
1b99 : a9 00 __ LDA #$00
1b9b : e9 00 __ SBC #$00
1b9d : 85 49 __ STA T2 + 1 
1b9f : 38 __ __ SEC
1ba0 : a9 b6 __ LDA #$b6
1ba2 : e5 48 __ SBC T2 + 0 
1ba4 : 85 30 __ STA P3 
1ba6 : a9 01 __ LDA #$01
1ba8 : e5 49 __ SBC T2 + 1 
1baa : 85 31 __ STA P4 
1bac : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1baf : a9 01 __ LDA #$01
1bb1 : 85 2d __ STA P0 
1bb3 : 85 2f __ STA P2 
1bb5 : a9 f0 __ LDA #$f0
1bb7 : 85 2e __ STA P1 
1bb9 : a6 36 __ LDX P9 ; (p3 + 0)
1bbb : bd 00 45 LDA $4500,x ; (sintab + 0)
1bbe : 4a __ __ LSR
1bbf : 4a __ __ LSR
1bc0 : 4a __ __ LSR
1bc1 : 4a __ __ LSR
1bc2 : 49 08 __ EOR #$08
1bc4 : 38 __ __ SEC
1bc5 : e9 08 __ SBC #$08
1bc7 : a8 __ __ TAY
1bc8 : a9 00 __ LDA #$00
1bca : e9 00 __ SBC #$00
1bcc : aa __ __ TAX
1bcd : 98 __ __ TYA
1bce : 18 __ __ CLC
1bcf : 69 b6 __ ADC #$b6
1bd1 : 85 30 __ STA P3 
1bd3 : 8a __ __ TXA
1bd4 : 69 01 __ ADC #$01
1bd6 : 85 31 __ STA P4 
1bd8 : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1bdb : a9 00 __ LDA #$00
1bdd : 85 47 __ STA T1 + 0 
1bdf : 18 __ __ CLC
.l2:
1be0 : a5 47 __ LDA T1 + 0 
1be2 : 69 4f __ ADC #$4f
1be4 : 85 2d __ STA P0 
1be6 : a5 47 __ LDA T1 + 0 
1be8 : 0a __ __ ASL
1be9 : 65 47 __ ADC T1 + 0 
1beb : 0a __ __ ASL
1bec : 0a __ __ ASL
1bed : 18 __ __ CLC
1bee : 6d de 44 ADC $44de ; (FrameCount + 0)
1bf1 : aa __ __ TAX
1bf2 : ac df 44 LDY $44df ; (FrameCount + 1)
1bf5 : bd 00 45 LDA $4500,x ; (sintab + 0)
1bf8 : 10 01 __ BPL $1bfb ; (MoveSprites.s1008 + 0)
.s1007:
1bfa : 88 __ __ DEY
.s1008:
1bfb : 18 __ __ CLC
1bfc : 6d de 44 ADC $44de ; (FrameCount + 0)
1bff : 85 48 __ STA T2 + 0 
1c01 : 90 01 __ BCC $1c04 ; (MoveSprites.s1009 + 0)
.s1006:
1c03 : c8 __ __ INY
.s1009:
1c04 : 84 49 __ STY T2 + 1 
1c06 : a5 47 __ LDA T1 + 0 
1c08 : 0a __ __ ASL
1c09 : 0a __ __ ASL
1c0a : 85 3b __ STA ACCU + 0 
1c0c : a9 00 __ LDA #$00
1c0e : 85 3c __ STA ACCU + 1 
1c10 : a9 80 __ LDA #$80
1c12 : 85 23 __ STA WORK + 0 
1c14 : a9 02 __ LDA #$02
1c16 : 85 24 __ STA WORK + 1 
1c18 : 20 87 23 JSR $2387 ; (divmod + 0)
1c1b : 18 __ __ CLC
1c1c : a5 25 __ LDA WORK + 2 
1c1e : 65 48 __ ADC T2 + 0 
1c20 : 85 2e __ STA P1 
1c22 : a5 26 __ LDA WORK + 3 
1c24 : 65 49 __ ADC T2 + 1 
1c26 : 85 2f __ STA P2 
1c28 : a5 47 __ LDA T1 + 0 
1c2a : 0a __ __ ASL
1c2b : 0a __ __ ASL
1c2c : 65 47 __ ADC T1 + 0 
1c2e : 85 48 __ STA T2 + 0 
1c30 : ad de 44 LDA $44de ; (FrameCount + 0)
1c33 : 38 __ __ SEC
1c34 : e9 40 __ SBC #$40
1c36 : 18 __ __ CLC
1c37 : 65 48 __ ADC T2 + 0 
1c39 : aa __ __ TAX
1c3a : bd 00 45 LDA $4500,x ; (sintab + 0)
1c3d : 4a __ __ LSR
1c3e : 49 40 __ EOR #$40
1c40 : 38 __ __ SEC
1c41 : e9 40 __ SBC #$40
1c43 : a8 __ __ TAY
1c44 : a9 00 __ LDA #$00
1c46 : e9 00 __ SBC #$00
1c48 : 85 49 __ STA T2 + 1 
1c4a : a5 47 __ LDA T1 + 0 
1c4c : 0a __ __ ASL
1c4d : 0a __ __ ASL
1c4e : 0a __ __ ASL
1c4f : 85 3b __ STA ACCU + 0 
1c51 : ad de 44 LDA $44de ; (FrameCount + 0)
1c54 : 38 __ __ SEC
1c55 : e9 20 __ SBC #$20
1c57 : 18 __ __ CLC
1c58 : 65 3b __ ADC ACCU + 0 
1c5a : aa __ __ TAX
1c5b : bd 00 45 LDA $4500,x ; (sintab + 0)
1c5e : 4a __ __ LSR
1c5f : 4a __ __ LSR
1c60 : 4a __ __ LSR
1c61 : 4a __ __ LSR
1c62 : 49 08 __ EOR #$08
1c64 : 38 __ __ SEC
1c65 : e9 08 __ SBC #$08
1c67 : 85 4a __ STA T3 + 0 
1c69 : a9 00 __ LDA #$00
1c6b : e9 00 __ SBC #$00
1c6d : 85 4b __ STA T3 + 1 
1c6f : a5 47 __ LDA T1 + 0 
1c71 : 0a __ __ ASL
1c72 : 65 47 __ ADC T1 + 0 
1c74 : 85 3b __ STA ACCU + 0 
1c76 : a5 47 __ LDA T1 + 0 
1c78 : c9 17 __ CMP #$17
1c7a : f0 2d __ BEQ $1ca9 ; (MoveSprites.s5 + 0)
.s6:
1c7c : 98 __ __ TYA
1c7d : 18 __ __ CLC
1c7e : 69 c4 __ ADC #$c4
1c80 : a8 __ __ TAY
1c81 : a5 49 __ LDA T2 + 1 
1c83 : 69 00 __ ADC #$00
1c85 : aa __ __ TAX
1c86 : 98 __ __ TYA
1c87 : 18 __ __ CLC
1c88 : 65 4a __ ADC T3 + 0 
1c8a : a8 __ __ TAY
1c8b : 8a __ __ TXA
1c8c : 65 4b __ ADC T3 + 1 
1c8e : aa __ __ TAX
1c8f : 98 __ __ TYA
1c90 : 18 __ __ CLC
1c91 : 65 3b __ ADC ACCU + 0 
1c93 : 85 30 __ STA P3 
1c95 : 90 01 __ BCC $1c98 ; (MoveSprites.s1013 + 0)
.s1012:
1c97 : e8 __ __ INX
.s1013:
1c98 : 86 31 __ STX P4 
1c9a : 20 d1 18 JSR $18d1 ; (vera_spr_move.s0 + 0)
1c9d : e6 47 __ INC T1 + 0 
1c9f : a5 47 __ LDA T1 + 0 
1ca1 : c9 18 __ CMP #$18
1ca3 : b0 03 __ BCS $1ca8 ; (MoveSprites.s1001 + 0)
1ca5 : 4c e0 1b JMP $1be0 ; (MoveSprites.l2 + 0)
.s1001:
1ca8 : 60 __ __ RTS
.s5:
1ca9 : 98 __ __ TYA
1caa : 18 __ __ CLC
1cab : 69 bc __ ADC #$bc
1cad : 18 __ __ CLC
1cae : 65 4a __ ADC T3 + 0 
1cb0 : a8 __ __ TAY
1cb1 : a9 00 __ LDA #$00
1cb3 : 65 4b __ ADC T3 + 1 
1cb5 : aa __ __ TAX
1cb6 : 98 __ __ TYA
1cb7 : 18 __ __ CLC
1cb8 : 65 3b __ ADC ACCU + 0 
1cba : 85 30 __ STA P3 
1cbc : 90 01 __ BCC $1cbf ; (MoveSprites.s1011 + 0)
.s1010:
1cbe : e8 __ __ INX
.s1011:
1cbf : 86 31 __ STX P4 
1cc1 : 4c d1 18 JMP $18d1 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
sintab:
4500 : __ __ __ BYT 00 02 04 07 09 0b 0d 0f 12 14 16 18 1a 1c 1e 20 : ............... 
4510 : __ __ __ BYT 22 24 26 28 2a 2c 2e 30 32 34 36 37 39 3b 3c 3e : "$&(*,.024679;<>
4520 : __ __ __ BYT 40 41 43 44 46 47 48 4a 4b 4c 4d 4e 4f 50 51 52 : @ACDFGHJKLMNOPQR
4530 : __ __ __ BYT 53 54 55 55 56 57 57 58 58 59 59 59 5a 5a 5a 5a : STUUVWWXXYYYZZZZ
4540 : __ __ __ BYT 5a 5a 5a 5a 5a 59 59 59 58 58 57 57 56 55 55 54 : ZZZZZYYYXXWWVUUT
4550 : __ __ __ BYT 53 52 51 50 4f 4e 4d 4c 4b 4a 48 47 46 44 43 41 : SRQPONMLKJHGFDCA
4560 : __ __ __ BYT 40 3e 3c 3b 39 37 36 34 32 30 2e 2c 2a 28 26 24 : @><;976420.,*(&$
4570 : __ __ __ BYT 22 20 1e 1c 1a 18 16 14 12 0f 0d 0b 09 07 04 02 : " ..............
4580 : __ __ __ BYT 00 fe fc f9 f7 f5 f3 f1 ee ec ea e8 e6 e4 e2 e0 : ................
4590 : __ __ __ BYT de dc da d8 d6 d4 d2 d0 ce cc ca c9 c7 c5 c4 c2 : ................
45a0 : __ __ __ BYT c0 bf bd bc ba b9 b8 b6 b5 b4 b3 b2 b1 b0 af ae : ................
45b0 : __ __ __ BYT ad ac ab ab aa a9 a9 a8 a8 a7 a7 a7 a6 a6 a6 a6 : ................
45c0 : __ __ __ BYT a6 a6 a6 a6 a6 a7 a7 a7 a8 a8 a9 a9 aa ab ab ac : ................
45d0 : __ __ __ BYT ad ae af b0 b1 b2 b3 b4 b5 b6 b8 b9 ba bc bd bf : ................
45e0 : __ __ __ BYT c0 c2 c4 c5 c7 c9 ca cc ce d0 d2 d4 d6 d8 da dc : ................
45f0 : __ __ __ BYT de e0 e2 e4 e6 e8 ea ec ee f1 f3 f5 f7 f9 fc fe : ................
--------------------------------------------------------------------
FrameCount:
44de : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
PlayZSM:
.s0:
1cc4 : a9 08 __ LDA #$08
1cc6 : 8d 2c 9f STA $9f2c 
1cc9 : ad fd 9e LDA $9efd ; (sstack + 3)
1ccc : cd ff 9e CMP $9eff ; (sstack + 5)
1ccf : d0 0f __ BNE $1ce0 ; (PlayZSM.s1 + 0)
.s1008:
1cd1 : ad fc 9e LDA $9efc ; (sstack + 2)
1cd4 : cd fe 9e CMP $9efe ; (sstack + 4)
1cd7 : d0 07 __ BNE $1ce0 ; (PlayZSM.s1 + 0)
.s4:
1cd9 : 20 61 1e JSR $1e61 ; (zsm_check.s0 + 0)
1cdc : 09 00 __ ORA #$00
1cde : f0 30 __ BEQ $1d10 ; (PlayZSM.s1001 + 0)
.s1:
1ce0 : ac fc 9e LDY $9efc ; (sstack + 2)
1ce3 : ad fd 9e LDA $9efd ; (sstack + 3)
1ce6 : d0 15 __ BNE $1cfd ; (PlayZSM.s16 + 0)
.s1007:
1ce8 : c0 03 __ CPY #$03
1cea : d0 11 __ BNE $1cfd ; (PlayZSM.s16 + 0)
.s12:
1cec : a9 6c __ LDA #$6c
1cee : 85 30 __ STA P3 
1cf0 : a9 20 __ LDA #$20
1cf2 : 85 31 __ STA P4 
1cf4 : a9 93 __ LDA #$93
1cf6 : 85 4b __ STA T0 + 0 
1cf8 : a9 20 __ LDA #$20
1cfa : 4c 8b 1d JMP $1d8b ; (PlayZSM.s27 + 0)
.s16:
1cfd : ad fd 9e LDA $9efd ; (sstack + 3)
1d00 : 30 64 __ BMI $1d66 ; (PlayZSM.s18 + 0)
.s1006:
1d02 : d0 04 __ BNE $1d08 ; (PlayZSM.s17 + 0)
.s1005:
1d04 : c0 03 __ CPY #$03
1d06 : 90 5e __ BCC $1d66 ; (PlayZSM.s18 + 0)
.s17:
1d08 : 09 00 __ ORA #$00
1d0a : d0 04 __ BNE $1d10 ; (PlayZSM.s1001 + 0)
.s1002:
1d0c : c0 04 __ CPY #$04
1d0e : f0 01 __ BEQ $1d11 ; (PlayZSM.s14 + 0)
.s1001:
1d10 : 60 __ __ RTS
.s14:
1d11 : a9 bd __ LDA #$bd
1d13 : 85 30 __ STA P3 
1d15 : a9 20 __ LDA #$20
1d17 : 85 31 __ STA P4 
1d19 : 20 84 1e JSR $1e84 ; (zsm_init.s0 + 0)
1d1c : a9 03 __ LDA #$03
1d1e : 85 32 __ STA P5 
1d20 : 85 34 __ STA P7 
1d22 : a9 08 __ LDA #$08
1d24 : 85 33 __ STA P6 
1d26 : a9 00 __ LDA #$00
1d28 : 8d fa 9e STA $9efa ; (sstack + 0)
1d2b : a9 20 __ LDA #$20
1d2d : 8d fb 9e STA $9efb ; (sstack + 1)
1d30 : a9 d9 __ LDA #$d9
1d32 : 85 30 __ STA P3 
1d34 : a9 20 __ LDA #$20
1d36 : 85 31 __ STA P4 
1d38 : ad 38 24 LDA $2438 ; (VolAddr + 0)
1d3b : 85 35 __ STA P8 
1d3d : ad 39 24 LDA $2439 ; (VolAddr + 1)
1d40 : 85 36 __ STA P9 
1d42 : ad 3a 24 LDA $243a ; (VolAddr + 2)
1d45 : 85 37 __ STA P10 
1d47 : ad 3b 24 LDA $243b ; (VolAddr + 3)
1d4a : 85 38 __ STA P11 
1d4c : 20 90 19 JSR $1990 ; (LoadSprite.s0 + 0)
1d4f : a9 20 __ LDA #$20
1d51 : 85 30 __ STA P3 
1d53 : a9 00 __ LDA #$00
1d55 : 85 31 __ STA P4 
1d57 : a9 46 __ LDA #$46
1d59 : a0 20 __ LDY #$20
.s26:
1d5b : 84 2e __ STY P1 
1d5d : 85 2f __ STA P2 
1d5f : a9 b0 __ LDA #$b0
1d61 : 85 2d __ STA P0 
1d63 : 4c 47 19 JMP $1947 ; (vera_pal_putn.s0 + 0)
.s18:
1d66 : 98 __ __ TYA
1d67 : 0d fd 9e ORA $9efd ; (sstack + 3)
1d6a : d0 03 __ BNE $1d6f ; (PlayZSM.s19 + 0)
1d6c : 4c 1f 1e JMP $1e1f ; (PlayZSM.s6 + 0)
.s19:
1d6f : ad fd 9e LDA $9efd ; (sstack + 3)
1d72 : d0 9c __ BNE $1d10 ; (PlayZSM.s1001 + 0)
.s1004:
1d74 : 98 __ __ TYA
1d75 : c0 01 __ CPY #$01
1d77 : f0 59 __ BEQ $1dd2 ; (PlayZSM.s8 + 0)
.s1003:
1d79 : c9 02 __ CMP #$02
1d7b : d0 93 __ BNE $1d10 ; (PlayZSM.s1001 + 0)
.s10:
1d7d : a9 1d __ LDA #$1d
1d7f : 85 30 __ STA P3 
1d81 : a9 20 __ LDA #$20
1d83 : 85 31 __ STA P4 
1d85 : a9 42 __ LDA #$42
1d87 : 85 4b __ STA T0 + 0 
1d89 : a9 20 __ LDA #$20
.s27:
1d8b : 85 4c __ STA T0 + 1 
1d8d : 20 84 1e JSR $1e84 ; (zsm_init.s0 + 0)
1d90 : a5 4b __ LDA T0 + 0 
1d92 : 85 30 __ STA P3 
1d94 : a5 4c __ LDA T0 + 1 
1d96 : 85 31 __ STA P4 
1d98 : a9 03 __ LDA #$03
1d9a : 85 32 __ STA P5 
1d9c : 85 34 __ STA P7 
1d9e : a9 08 __ LDA #$08
1da0 : 85 33 __ STA P6 
1da2 : a9 00 __ LDA #$00
1da4 : 8d fa 9e STA $9efa ; (sstack + 0)
1da7 : a9 20 __ LDA #$20
1da9 : 8d fb 9e STA $9efb ; (sstack + 1)
1dac : ad 38 24 LDA $2438 ; (VolAddr + 0)
1daf : 85 35 __ STA P8 
1db1 : ad 39 24 LDA $2439 ; (VolAddr + 1)
1db4 : 85 36 __ STA P9 
1db6 : ad 3a 24 LDA $243a ; (VolAddr + 2)
1db9 : 85 37 __ STA P10 
1dbb : ad 3b 24 LDA $243b ; (VolAddr + 3)
1dbe : 85 38 __ STA P11 
1dc0 : 20 90 19 JSR $1990 ; (LoadSprite.s0 + 0)
1dc3 : a9 20 __ LDA #$20
1dc5 : 85 30 __ STA P3 
1dc7 : a9 00 __ LDA #$00
1dc9 : 85 31 __ STA P4 
1dcb : a9 46 __ LDA #$46
1dcd : a0 00 __ LDY #$00
1dcf : 4c 5b 1d JMP $1d5b ; (PlayZSM.s26 + 0)
.s8:
1dd2 : a9 dd __ LDA #$dd
1dd4 : 85 30 __ STA P3 
1dd6 : a9 1f __ LDA #$1f
1dd8 : 85 31 __ STA P4 
1dda : 20 84 1e JSR $1e84 ; (zsm_init.s0 + 0)
1ddd : a9 03 __ LDA #$03
1ddf : 85 32 __ STA P5 
1de1 : 85 34 __ STA P7 
1de3 : a9 08 __ LDA #$08
1de5 : 85 33 __ STA P6 
1de7 : a9 00 __ LDA #$00
1de9 : 8d fa 9e STA $9efa ; (sstack + 0)
1dec : a9 20 __ LDA #$20
1dee : 8d fb 9e STA $9efb ; (sstack + 1)
1df1 : a9 00 __ LDA #$00
1df3 : 85 30 __ STA P3 
1df5 : a9 20 __ LDA #$20
1df7 : 85 31 __ STA P4 
1df9 : ad 38 24 LDA $2438 ; (VolAddr + 0)
1dfc : 85 35 __ STA P8 
1dfe : ad 39 24 LDA $2439 ; (VolAddr + 1)
1e01 : 85 36 __ STA P9 
1e03 : ad 3a 24 LDA $243a ; (VolAddr + 2)
1e06 : 85 37 __ STA P10 
1e08 : ad 3b 24 LDA $243b ; (VolAddr + 3)
1e0b : 85 38 __ STA P11 
1e0d : 20 90 19 JSR $1990 ; (LoadSprite.s0 + 0)
1e10 : a9 20 __ LDA #$20
1e12 : 85 30 __ STA P3 
1e14 : a9 00 __ LDA #$00
1e16 : 85 31 __ STA P4 
1e18 : a9 44 __ LDA #$44
1e1a : a0 e0 __ LDY #$e0
1e1c : 4c 5b 1d JMP $1d5b ; (PlayZSM.s26 + 0)
.s6:
1e1f : a9 03 __ LDA #$03
1e21 : 85 32 __ STA P5 
1e23 : 85 34 __ STA P7 
1e25 : a9 08 __ LDA #$08
1e27 : 85 33 __ STA P6 
1e29 : a9 00 __ LDA #$00
1e2b : 8d fa 9e STA $9efa ; (sstack + 0)
1e2e : a9 20 __ LDA #$20
1e30 : 8d fb 9e STA $9efb ; (sstack + 1)
1e33 : a9 65 __ LDA #$65
1e35 : 85 30 __ STA P3 
1e37 : a9 1e __ LDA #$1e
1e39 : 85 31 __ STA P4 
1e3b : ad 38 24 LDA $2438 ; (VolAddr + 0)
1e3e : 85 35 __ STA P8 
1e40 : ad 39 24 LDA $2439 ; (VolAddr + 1)
1e43 : 85 36 __ STA P9 
1e45 : ad 3a 24 LDA $243a ; (VolAddr + 2)
1e48 : 85 37 __ STA P10 
1e4a : ad 3b 24 LDA $243b ; (VolAddr + 3)
1e4d : 85 38 __ STA P11 
1e4f : 20 90 19 JSR $1990 ; (LoadSprite.s0 + 0)
1e52 : a9 1c __ LDA #$1c
1e54 : 85 30 __ STA P3 
1e56 : a9 00 __ LDA #$00
1e58 : 85 31 __ STA P4 
1e5a : a9 40 __ LDA #$40
1e5c : a0 ba __ LDY #$ba
1e5e : 4c 5b 1d JMP $1d5b ; (PlayZSM.s26 + 0)
--------------------------------------------------------------------
zsm_check:
.s0:
1e61 : ad 36 24 LDA $2436 ; (zsm_finished + 0)
.s1001:
1e64 : 60 __ __ RTS
--------------------------------------------------------------------
1e65 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
1e75 : __ __ __ BYT 43 4f 44 45 52 53 2e 42 49 4e 2c 50 2c 52 00    : CODERS.BIN,P,R.
--------------------------------------------------------------------
zsm_init:
.s0:
1e84 : a9 01 __ LDA #$01
1e86 : 8d 36 24 STA $2436 ; (zsm_finished + 0)
1e89 : ad ff 2b LDA $2bff ; (zsm_reading + 0)
1e8c : f0 0a __ BEQ $1e98 ; (zsm_init.s3 + 0)
.s1:
1e8e : a9 02 __ LDA #$02
1e90 : 20 67 1a JSR $1a67 ; (krnio_close.s1000 + 0)
1e93 : a9 00 __ LDA #$00
1e95 : 8d ff 2b STA $2bff ; (zsm_reading + 0)
.s3:
1e98 : 20 e5 1e JSR $1ee5 ; (zsm_silence.s0 + 0)
1e9b : 20 fd 1e JSR $1efd ; (zsm_save_volume.s0 + 0)
1e9e : a9 00 __ LDA #$00
1ea0 : 8d e7 53 STA $53e7 ; (zsm_pos + 0)
1ea3 : 8d e8 53 STA $53e8 ; (zsm_pos + 1)
1ea6 : 8d f9 53 STA $53f9 ; (zsm_wpos + 0)
1ea9 : 8d fa 53 STA $53fa ; (zsm_wpos + 1)
1eac : 8d e6 53 STA $53e6 ; (zsm_delay + 0)
1eaf : a5 30 __ LDA P3 ; (fname + 0)
1eb1 : 85 2d __ STA P0 
1eb3 : a5 31 __ LDA P4 ; (fname + 1)
1eb5 : 85 2e __ STA P1 
1eb7 : 20 0d 1a JSR $1a0d ; (krnio_setnam.s0 + 0)
1eba : a9 02 __ LDA #$02
1ebc : 85 2d __ STA P0 
1ebe : 85 2f __ STA P2 
1ec0 : a9 08 __ LDA #$08
1ec2 : 85 2e __ STA P1 
1ec4 : 20 23 1a JSR $1a23 ; (krnio_open.s0 + 0)
1ec7 : a5 3b __ LDA ACCU + 0 
1ec9 : f0 19 __ BEQ $1ee4 ; (zsm_init.s1001 + 0)
.s4:
1ecb : a9 01 __ LDA #$01
1ecd : 8d ff 2b STA $2bff ; (zsm_reading + 0)
1ed0 : 20 2f 1f JSR $1f2f ; (zsm_fill.s0 + 0)
1ed3 : a9 10 __ LDA #$10
1ed5 : 8d e7 53 STA $53e7 ; (zsm_pos + 0)
1ed8 : a9 00 __ LDA #$00
1eda : 8d e8 53 STA $53e8 ; (zsm_pos + 1)
1edd : 8d 36 24 STA $2436 ; (zsm_finished + 0)
1ee0 : a9 01 __ LDA #$01
1ee2 : 85 3b __ STA ACCU + 0 
.s1001:
1ee4 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
2bff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_silence:
.s0:
1ee5 : a9 00 __ LDA #$00
1ee7 : 85 47 __ STA T0 + 0 
1ee9 : a9 08 __ LDA #$08
1eeb : 85 2d __ STA P0 
1eed : a9 00 __ LDA #$00
.l1006:
1eef : 85 2e __ STA P1 
1ef1 : 20 a7 0d JSR $0da7 ; (sfx_put.l1 + 0)
1ef4 : e6 47 __ INC T0 + 0 
1ef6 : a5 47 __ LDA T0 + 0 
1ef8 : c9 08 __ CMP #$08
1efa : 90 f3 __ BCC $1eef ; (zsm_silence.l1006 + 0)
.s1001:
1efc : 60 __ __ RTS
--------------------------------------------------------------------
zsm_save_volume:
.s0:
1efd : a0 00 __ LDY #$00
1eff : 84 3c __ STY ACCU + 1 
1f01 : a2 02 __ LDX #$02
1f03 : 18 __ __ CLC
.l1006:
1f04 : 8a __ __ TXA
1f05 : 09 c0 __ ORA #$c0
1f07 : 8d 20 9f STA $9f20 
1f0a : a5 3c __ LDA ACCU + 1 
1f0c : 09 f9 __ ORA #$f9
1f0e : 8d 21 9f STA $9f21 
1f11 : a9 01 __ LDA #$01
1f13 : 8d 22 9f STA $9f22 
1f16 : ad 23 9f LDA $9f23 
1f19 : 99 c6 54 STA $54c6,y ; (vera_volumes + 0)
1f1c : a9 00 __ LDA #$00
1f1e : 8d 23 9f STA $9f23 
1f21 : 8a __ __ TXA
1f22 : 69 04 __ ADC #$04
1f24 : aa __ __ TAX
1f25 : 90 02 __ BCC $1f29 ; (zsm_save_volume.s1009 + 0)
.s1008:
1f27 : e6 3c __ INC ACCU + 1 
.s1009:
1f29 : c8 __ __ INY
1f2a : c0 10 __ CPY #$10
1f2c : 90 d6 __ BCC $1f04 ; (zsm_save_volume.l1006 + 0)
.s1001:
1f2e : 60 __ __ RTS
--------------------------------------------------------------------
vera_volumes:
54c6 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_wpos:
53f9 : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_fill:
.s0:
1f2f : ad ff 2b LDA $2bff ; (zsm_reading + 0)
1f32 : f0 20 __ BEQ $1f54 ; (zsm_fill.s1 + 0)
.s2:
1f34 : ad e8 53 LDA $53e8 ; (zsm_pos + 1)
1f37 : 18 __ __ CLC
1f38 : 69 04 __ ADC #$04
1f3a : cd fa 53 CMP $53fa ; (zsm_wpos + 1)
1f3d : d0 0c __ BNE $1f4b ; (zsm_fill.s6 + 0)
.s1006:
1f3f : ad f9 53 LDA $53f9 ; (zsm_wpos + 0)
1f42 : cd e7 53 CMP $53e7 ; (zsm_pos + 0)
1f45 : d0 04 __ BNE $1f4b ; (zsm_fill.s6 + 0)
.s5:
1f47 : a9 00 __ LDA #$00
1f49 : f0 0b __ BEQ $1f56 ; (zsm_fill.s1008 + 0)
.s6:
1f4b : a9 02 __ LDA #$02
1f4d : 20 4b 1a JSR $1a4b ; (krnio_chkin.s1000 + 0)
1f50 : a5 3b __ LDA ACCU + 0 
1f52 : d0 07 __ BNE $1f5b ; (zsm_fill.s9 + 0)
.s1:
1f54 : a9 ff __ LDA #$ff
.s1008:
1f56 : 85 3b __ STA ACCU + 0 
.s1001:
1f58 : 85 3c __ STA ACCU + 1 
1f5a : 60 __ __ RTS
.s9:
1f5b : a9 00 __ LDA #$00
1f5d : 85 47 __ STA T1 + 0 
1f5f : 85 48 __ STA T1 + 1 
1f61 : ad e8 53 LDA $53e8 ; (zsm_pos + 1)
1f64 : 18 __ __ CLC
1f65 : 69 04 __ ADC #$04
1f67 : cd fa 53 CMP $53fa ; (zsm_wpos + 1)
1f6a : d0 08 __ BNE $1f74 ; (zsm_fill.l13 + 0)
.s1002:
1f6c : ad f9 53 LDA $53f9 ; (zsm_wpos + 0)
1f6f : cd e7 53 CMP $53e7 ; (zsm_pos + 0)
1f72 : f0 49 __ BEQ $1fbd ; (zsm_fill.s38 + 0)
.l13:
1f74 : 20 5d 1a JSR $1a5d ; (krnio_chrin.s0 + 0)
1f77 : ad f9 53 LDA $53f9 ; (zsm_wpos + 0)
1f7a : aa __ __ TAX
1f7b : 18 __ __ CLC
1f7c : 69 01 __ ADC #$01
1f7e : 8d f9 53 STA $53f9 ; (zsm_wpos + 0)
1f81 : ad fa 53 LDA $53fa ; (zsm_wpos + 1)
1f84 : a8 __ __ TAY
1f85 : 69 00 __ ADC #$00
1f87 : 8d fa 53 STA $53fa ; (zsm_wpos + 1)
1f8a : 8a __ __ TXA
1f8b : 18 __ __ CLC
1f8c : 69 be __ ADC #$be
1f8e : 85 49 __ STA T3 + 0 
1f90 : 98 __ __ TYA
1f91 : 29 03 __ AND #$03
1f93 : 69 56 __ ADC #$56
1f95 : 85 4a __ STA T3 + 1 
1f97 : a5 3b __ LDA ACCU + 0 
1f99 : a0 00 __ LDY #$00
1f9b : 91 49 __ STA (T3 + 0),y 
1f9d : e6 47 __ INC T1 + 0 
1f9f : d0 02 __ BNE $1fa3 ; (zsm_fill.s1010 + 0)
.s1009:
1fa1 : e6 48 __ INC T1 + 1 
.s1010:
1fa3 : 20 d3 1f JSR $1fd3 ; (krnio_status.s0 + 0)
1fa6 : a5 3b __ LDA ACCU + 0 
1fa8 : d0 0e __ BNE $1fb8 ; (zsm_fill.s15 + 0)
.s12:
1faa : ad e8 53 LDA $53e8 ; (zsm_pos + 1)
1fad : 18 __ __ CLC
1fae : 69 04 __ ADC #$04
1fb0 : cd fa 53 CMP $53fa ; (zsm_wpos + 1)
1fb3 : d0 bf __ BNE $1f74 ; (zsm_fill.l13 + 0)
1fb5 : 4c 6c 1f JMP $1f6c ; (zsm_fill.s1002 + 0)
.s15:
1fb8 : a9 00 __ LDA #$00
1fba : 8d ff 2b STA $2bff ; (zsm_reading + 0)
.s38:
1fbd : 20 fc 0b JSR $0bfc ; (krnio_clrchn.s0 + 0)
1fc0 : ad ff 2b LDA $2bff ; (zsm_reading + 0)
1fc3 : d0 05 __ BNE $1fca ; (zsm_fill.s21 + 0)
.s19:
1fc5 : a9 02 __ LDA #$02
1fc7 : 20 67 1a JSR $1a67 ; (krnio_close.s1000 + 0)
.s21:
1fca : a5 47 __ LDA T1 + 0 
1fcc : 85 3b __ STA ACCU + 0 
1fce : a5 48 __ LDA T1 + 1 
1fd0 : 4c 58 1f JMP $1f58 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_status:
.s0:
1fd3 : 20 b7 ff JSR $ffb7 
1fd6 : 85 3b __ STA ACCU + 0 
1fd8 : a9 00 __ LDA #$00
1fda : 85 3c __ STA ACCU + 1 
.s1001:
1fdc : 60 __ __ RTS
--------------------------------------------------------------------
1fdd : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
1fed : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
2000 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2010 : __ __ __ BYT 4b 4f 4c 45 2e 42 49 4e 2c 50 2c 52 00          : KOLE.BIN,P,R.
--------------------------------------------------------------------
KolePal:
44e0 : __ __ __ BYT 00 00 79 02 00 00 40 0a 30 07 ff 0f 00 0f 6c 00 : ..y...@.0.....l.
44f0 : __ __ __ BYT bf 00 99 09 cc 0c 0f 06 be 07 08 02 33 03 00 00 : ............3...
--------------------------------------------------------------------
201d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
202d : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 2e 7a 73 6d : talDimension.zsm
203d : __ __ __ BYT 2c 50 2c 52 00                                  : ,P,R.
--------------------------------------------------------------------
2042 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
2052 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
2062 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
RealPal:
4600 : __ __ __ BYT 00 00 00 00 20 04 46 04 69 06 40 09 ff 00 44 04 : .... .F.i.@...D.
4610 : __ __ __ BYT bb 0b dd 0d 75 0c a7 0e ff 0f df 0d 33 03 99 09 : ....u.......3...
--------------------------------------------------------------------
206c : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 43 72 79 73 : @0:zsmfiles/Crys
207c : __ __ __ BYT 74 61 6c 44 69 6d 65 6e 73 69 6f 6e 50 32 2e 7a : talDimensionP2.z
208c : __ __ __ BYT 73 6d 2c 50 2c 52 00                            : sm,P,R.
--------------------------------------------------------------------
2093 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
20a3 : __ __ __ BYT 52 45 41 4c 48 45 44 47 45 48 4f 47 53 4f 4e 49 : REALHEDGEHOGSONI
20b3 : __ __ __ BYT 43 2e 42 49 4e 2c 50 2c 52 00                   : C.BIN,P,R.
--------------------------------------------------------------------
20bd : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 67 73 66 69 : @0:zsmfiles/gsfi
20cd : __ __ __ BYT 6e 61 6c 2e 7a 73 6d 2c 50 2c 52 00             : nal.zsm,P,R.
--------------------------------------------------------------------
20d9 : __ __ __ BYT 40 30 3a 2f 73 70 72 69 74 65 73 2f 62 69 6e 2f : @0:/sprites/bin/
20e9 : __ __ __ BYT 46 4c 44 45 2e 42 49 4e 2c 50 2c 52 00          : FLDE.BIN,P,R.
--------------------------------------------------------------------
FldePal:
4620 : __ __ __ BYT 00 00 00 00 dd 0d ff 0f 3e 02 cf 00 ad 00 5f 04 : ........>....._.
4630 : __ __ __ BYT 27 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : '...............
--------------------------------------------------------------------
LastSelectedSong:
4640 : __ __ __ BYT ff                                              : .
--------------------------------------------------------------------
PalTimer:
4641 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
SetPaletteIndex:
.s0:
20f6 : a9 10 __ LDA #$10
20f8 : 85 30 __ STA P3 
20fa : a9 00 __ LDA #$00
20fc : 85 31 __ STA P4 
20fe : a5 32 __ LDA P5 ; (Palette + 0)
2100 : 85 2e __ STA P1 
2102 : 85 47 __ STA T0 + 0 
2104 : a5 33 __ LDA P6 ; (Palette + 1)
2106 : 85 2f __ STA P2 
2108 : 85 48 __ STA T0 + 1 
210a : a5 34 __ LDA P7 ; (index + 0)
210c : 85 2d __ STA P0 
210e : ad fa 9e LDA $9efa ; (sstack + 0)
2111 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2113 : 0a __ __ ASL
2114 : 85 49 __ STA T3 + 0 
2116 : ad fb 9e LDA $9efb ; (sstack + 1)
2119 : 2a __ __ ROL
211a : 18 __ __ CLC
211b : 65 33 __ ADC P6 ; (Palette + 1)
211d : 85 4a __ STA T3 + 1 
211f : a4 32 __ LDY P5 ; (Palette + 0)
2121 : b1 49 __ LDA (T3 + 0),y 
2123 : aa __ __ TAX
2124 : c8 __ __ INY
2125 : b1 49 __ LDA (T3 + 0),y 
2127 : 86 49 __ STX T3 + 0 
2129 : 85 4a __ STA T3 + 1 
212b : a9 00 __ LDA #$00
212d : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
212f : ad fc 9e LDA $9efc ; (sstack + 2)
2132 : 85 4b __ STA T5 + 0 
2134 : 38 __ __ SEC
2135 : e9 01 __ SBC #$01
2137 : 85 4d __ STA T6 + 0 
2139 : ad fd 9e LDA $9efd ; (sstack + 3)
213c : 85 4c __ STA T5 + 1 
213e : e9 00 __ SBC #$00
2140 : 85 4e __ STA T6 + 1 
2142 : d0 06 __ BNE $214a ; (SetPaletteIndex.s5 + 0)
.s1004:
2144 : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
2146 : c5 4d __ CMP T6 + 0 
2148 : b0 38 __ BCS $2182 ; (SetPaletteIndex.s4 + 0)
.s5:
214a : 06 3b __ ASL ACCU + 0 ; (MaxVal + 0)
214c : 26 3c __ ROL ACCU + 1 ; (MaxVal + 1)
214e : 18 __ __ CLC
214f : a5 32 __ LDA P5 ; (Palette + 0)
2151 : 65 3b __ ADC ACCU + 0 ; (MaxVal + 0)
2153 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2155 : a5 33 __ LDA P6 ; (Palette + 1)
2157 : 65 3c __ ADC ACCU + 1 ; (MaxVal + 1)
2159 : 85 3c __ STA ACCU + 1 ; (MaxVal + 1)
215b : ae fa 9e LDX $9efa ; (sstack + 0)
.l2:
215e : a0 02 __ LDY #$02
2160 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
2162 : a0 00 __ LDY #$00
2164 : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
2166 : a0 03 __ LDY #$03
2168 : b1 3b __ LDA (ACCU + 0),y ; (MaxVal + 0)
216a : a0 01 __ LDY #$01
216c : 91 3b __ STA (ACCU + 0),y ; (MaxVal + 0)
216e : 18 __ __ CLC
216f : a5 3b __ LDA ACCU + 0 ; (MaxVal + 0)
2171 : 69 02 __ ADC #$02
2173 : 85 3b __ STA ACCU + 0 ; (MaxVal + 0)
2175 : 90 02 __ BCC $2179 ; (SetPaletteIndex.s1008 + 0)
.s1007:
2177 : e6 3c __ INC ACCU + 1 ; (MaxVal + 1)
.s1008:
2179 : e8 __ __ INX
217a : a5 4e __ LDA T6 + 1 
217c : d0 e0 __ BNE $215e ; (SetPaletteIndex.l2 + 0)
.s1002:
217e : e4 4d __ CPX T6 + 0 
2180 : 90 dc __ BCC $215e ; (SetPaletteIndex.l2 + 0)
.s4:
2182 : a5 4b __ LDA T5 + 0 
2184 : 0a __ __ ASL
2185 : aa __ __ TAX
2186 : a5 4c __ LDA T5 + 1 
2188 : 2a __ __ ROL
2189 : a8 __ __ TAY
218a : 8a __ __ TXA
218b : 38 __ __ SEC
218c : e9 02 __ SBC #$02
218e : b0 01 __ BCS $2191 ; (SetPaletteIndex.s1010 + 0)
.s1009:
2190 : 88 __ __ DEY
.s1010:
2191 : 18 __ __ CLC
2192 : 65 47 __ ADC T0 + 0 
2194 : 85 47 __ STA T0 + 0 
2196 : 98 __ __ TYA
2197 : 65 48 __ ADC T0 + 1 
2199 : 85 48 __ STA T0 + 1 
219b : a5 49 __ LDA T3 + 0 
219d : a0 00 __ LDY #$00
219f : 91 47 __ STA (T0 + 0),y 
21a1 : a5 4a __ LDA T3 + 1 
21a3 : c8 __ __ INY
21a4 : 91 47 __ STA (T0 + 0),y 
21a6 : 4c 47 19 JMP $1947 ; (vera_pal_putn.s0 + 0)
--------------------------------------------------------------------
PalIndex:
4643 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TowerPalF1:
4645 : __ __ __ BYT 00 00 ff 0f ee 0e dd 0d cc 0c bb 0b aa 0a 99 09 : ................
4655 : __ __ __ BYT 88 08 77 07 66 06 55 05 44 04 33 03 22 02 11 01 : ..w.f.U.D.3."...
--------------------------------------------------------------------
MaxSong:
4665 : __ __ __ BYT 04                                              : .
--------------------------------------------------------------------
ResetChars:
.s0:
21a9 : ad 25 9f LDA $9f25 
21ac : 29 fe __ AND #$fe
21ae : 8d 25 9f STA $9f25 
21b1 : a9 00 __ LDA #$00
21b3 : 8d 20 9f STA $9f20 
21b6 : a9 b0 __ LDA #$b0
21b8 : 8d 21 9f STA $9f21 
21bb : a9 11 __ LDA #$11
21bd : 8d 22 9f STA $9f22 
21c0 : a2 80 __ LDX #$80
21c2 : a9 00 __ LDA #$00
.l1002:
21c4 : 8d 23 9f STA $9f23 
21c7 : 8d 23 9f STA $9f23 
21ca : ca __ __ DEX
21cb : d0 f7 __ BNE $21c4 ; (ResetChars.l1002 + 0)
.s1001:
21cd : 60 __ __ RTS
--------------------------------------------------------------------
off1:
4666 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
Control:
.s0:
21ce : a5 31 __ LDA P4 ; (Input + 0)
21d0 : c9 20 __ CMP #$20
21d2 : d0 1c __ BNE $21f0 ; (Control.s1007 + 0)
.s1:
21d4 : a5 30 __ LDA P3 ; (playing + 0)
21d6 : d0 0a __ BNE $21e2 ; (Control.s4 + 0)
.s5:
21d8 : a9 01 __ LDA #$01
21da : 20 fb 1f JSR $1ffb ; (zsm_irq_play.s0 + 0)
21dd : a9 01 __ LDA #$01
.s1001:
21df : 85 3b __ STA ACCU + 0 
21e1 : 60 __ __ RTS
.s4:
21e2 : a9 00 __ LDA #$00
21e4 : cd 68 46 CMP $4668 ; (paused + 0)
21e7 : 2a __ __ ROL
21e8 : 8d 68 46 STA $4668 ; (paused + 0)
21eb : 85 2f __ STA P2 
21ed : 20 f5 21 JSR $21f5 ; (zsm_pause.s0 + 0)
.s1007:
21f0 : a5 30 __ LDA P3 ; (playing + 0)
21f2 : 4c df 21 JMP $21df ; (Control.s1001 + 0)
--------------------------------------------------------------------
paused:
4668 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_pause:
.s0:
21f5 : a5 2f __ LDA P2 ; (pause + 0)
21f7 : d0 0e __ BNE $2207 ; (zsm_pause.s4 + 0)
.s8:
21f9 : ad 37 24 LDA $2437 ; (zsm_paused + 0)
21fc : f0 08 __ BEQ $2206 ; (zsm_pause.s1001 + 0)
.s5:
21fe : 20 17 22 JSR $2217 ; (zsm_restore_volume.s0 + 0)
2201 : a9 00 __ LDA #$00
2203 : 8d 37 24 STA $2437 ; (zsm_paused + 0)
.s1001:
2206 : 60 __ __ RTS
.s4:
2207 : ad 37 24 LDA $2437 ; (zsm_paused + 0)
220a : d0 fa __ BNE $2206 ; (zsm_pause.s1001 + 0)
.s1:
220c : a9 01 __ LDA #$01
220e : 8d 37 24 STA $2437 ; (zsm_paused + 0)
2211 : 20 e5 1e JSR $1ee5 ; (zsm_silence.s0 + 0)
2214 : 4c fd 1e JMP $1efd ; (zsm_save_volume.s0 + 0)
--------------------------------------------------------------------
zsm_restore_volume:
.s0:
2217 : a0 00 __ LDY #$00
2219 : 84 3c __ STY ACCU + 1 
221b : a2 02 __ LDX #$02
221d : 18 __ __ CLC
.l1006:
221e : 8a __ __ TXA
221f : 09 c0 __ ORA #$c0
2221 : 8d 20 9f STA $9f20 
2224 : a5 3c __ LDA ACCU + 1 
2226 : 09 f9 __ ORA #$f9
2228 : 8d 21 9f STA $9f21 
222b : a9 01 __ LDA #$01
222d : 8d 22 9f STA $9f22 
2230 : b9 c6 54 LDA $54c6,y ; (vera_volumes + 0)
2233 : 8d 23 9f STA $9f23 
2236 : 8a __ __ TXA
2237 : 69 04 __ ADC #$04
2239 : aa __ __ TAX
223a : 90 02 __ BCC $223e ; (zsm_restore_volume.s1009 + 0)
.s1008:
223c : e6 3c __ INC ACCU + 1 
.s1009:
223e : c8 __ __ INY
223f : c0 10 __ CPY #$10
2241 : 90 db __ BCC $221e ; (zsm_restore_volume.l1006 + 0)
.s1001:
2243 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1ffb : 8d 35 24 STA $2435 ; (zsm_playing + 0)
.s1001:
1ffe : 60 __ __ RTS
--------------------------------------------------------------------
UpdateVolume:
.s0:
2244 : a9 21 __ LDA #$21
2246 : 8d 2c 9f STA $9f2c 
2249 : a9 00 __ LDA #$00
224b : 8d f8 9e STA $9ef8 ; (FMVolume + 0)
224e : 8d f9 9e STA $9ef9 ; (VeraVolume + 0)
2251 : 85 47 __ STA T0 + 0 
2253 : 85 32 __ STA P5 
.l2:
2255 : a9 f9 __ LDA #$f9
2257 : 85 2d __ STA P0 
2259 : a9 9e __ LDA #$9e
225b : 85 2e __ STA P1 
225d : a9 f8 __ LDA #$f8
225f : 85 2f __ STA P2 
2261 : a9 9e __ LDA #$9e
2263 : 85 30 __ STA P3 
2265 : a5 47 __ LDA T0 + 0 
2267 : 85 31 __ STA P4 
2269 : 20 00 23 JSR $2300 ; (zsm_get_volumes.s0 + 0)
226c : 18 __ __ CLC
226d : a5 31 __ LDA P4 
226f : 69 19 __ ADC #$19
2271 : 85 2d __ STA P0 
2273 : ad 3c 24 LDA $243c ; (IndAddr + 0)
2276 : 18 __ __ CLC
2277 : 6d f9 9e ADC $9ef9 ; (VeraVolume + 0)
227a : ad 3d 24 LDA $243d ; (IndAddr + 1)
227d : 69 00 __ ADC #$00
227f : 85 48 __ STA T5 + 0 
2281 : ad 3e 24 LDA $243e ; (IndAddr + 2)
2284 : 69 00 __ ADC #$00
2286 : 85 49 __ STA T5 + 1 
2288 : ad 3f 24 LDA $243f ; (IndAddr + 3)
228b : 69 00 __ ADC #$00
228d : a2 05 __ LDX #$05
.l1002:
228f : 4a __ __ LSR
2290 : 66 49 __ ROR T5 + 1 
2292 : 66 48 __ ROR T5 + 0 
2294 : ca __ __ DEX
2295 : d0 f8 __ BNE $228f ; (UpdateVolume.l1002 + 0)
.s1003:
2297 : a5 48 __ LDA T5 + 0 
2299 : 85 2e __ STA P1 
229b : a5 49 __ LDA T5 + 1 
229d : 85 2f __ STA P2 
229f : 20 25 23 JSR $2325 ; (vera_spr_image.s0 + 0)
22a2 : e6 47 __ INC T0 + 0 
22a4 : a5 47 __ LDA T0 + 0 
22a6 : c9 10 __ CMP #$10
22a8 : 90 ab __ BCC $2255 ; (UpdateVolume.l2 + 0)
.s4:
22aa : a9 00 __ LDA #$00
22ac : 85 47 __ STA T0 + 0 
.l6:
22ae : a9 f9 __ LDA #$f9
22b0 : 85 2d __ STA P0 
22b2 : a9 9e __ LDA #$9e
22b4 : 85 2e __ STA P1 
22b6 : a9 f8 __ LDA #$f8
22b8 : 85 2f __ STA P2 
22ba : a5 47 __ LDA T0 + 0 
22bc : 85 31 __ STA P4 
22be : 20 00 23 JSR $2300 ; (zsm_get_volumes.s0 + 0)
22c1 : 18 __ __ CLC
22c2 : a5 31 __ LDA P4 
22c4 : 69 29 __ ADC #$29
22c6 : 85 2d __ STA P0 
22c8 : ad 3c 24 LDA $243c ; (IndAddr + 0)
22cb : 18 __ __ CLC
22cc : 6d f8 9e ADC $9ef8 ; (FMVolume + 0)
22cf : ad 3d 24 LDA $243d ; (IndAddr + 1)
22d2 : 69 00 __ ADC #$00
22d4 : 85 48 __ STA T5 + 0 
22d6 : ad 3e 24 LDA $243e ; (IndAddr + 2)
22d9 : 69 00 __ ADC #$00
22db : 85 49 __ STA T5 + 1 
22dd : ad 3f 24 LDA $243f ; (IndAddr + 3)
22e0 : 69 00 __ ADC #$00
22e2 : a2 05 __ LDX #$05
.l1004:
22e4 : 4a __ __ LSR
22e5 : 66 49 __ ROR T5 + 1 
22e7 : 66 48 __ ROR T5 + 0 
22e9 : ca __ __ DEX
22ea : d0 f8 __ BNE $22e4 ; (UpdateVolume.l1004 + 0)
.s1005:
22ec : a5 48 __ LDA T5 + 0 
22ee : 85 2e __ STA P1 
22f0 : a5 49 __ LDA T5 + 1 
22f2 : 85 2f __ STA P2 
22f4 : 20 25 23 JSR $2325 ; (vera_spr_image.s0 + 0)
22f7 : e6 47 __ INC T0 + 0 
22f9 : a5 47 __ LDA T0 + 0 
22fb : c9 08 __ CMP #$08
22fd : 90 af __ BCC $22ae ; (UpdateVolume.l6 + 0)
.s1001:
22ff : 60 __ __ RTS
--------------------------------------------------------------------
zsm_get_volumes:
.s0:
2300 : a5 31 __ LDA P4 ; (id + 0)
2302 : 0a __ __ ASL
2303 : 85 3b __ STA ACCU + 0 
2305 : a5 32 __ LDA P5 ; (id + 1)
2307 : 2a __ __ ROL
2308 : 06 3b __ ASL ACCU + 0 
230a : 0a __ __ ASL
230b : 09 f9 __ ORA #$f9
230d : aa __ __ TAX
230e : a5 3b __ LDA ACCU + 0 
2310 : 09 c2 __ ORA #$c2
2312 : 8d 20 9f STA $9f20 
2315 : 8e 21 9f STX $9f21 
2318 : a9 01 __ LDA #$01
231a : 8d 22 9f STA $9f22 
231d : ad 23 9f LDA $9f23 
2320 : a0 00 __ LDY #$00
2322 : 91 2d __ STA (P0),y ; (vera_v + 0)
.s1001:
2324 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_image:
.s0:
2325 : ad 25 9f LDA $9f25 
2328 : 29 fe __ AND #$fe
232a : 8d 25 9f STA $9f25 
232d : a5 2d __ LDA P0 ; (spr + 0)
232f : 0a __ __ ASL
2330 : 0a __ __ ASL
2331 : 85 3b __ STA ACCU + 0 
2333 : a9 3f __ LDA #$3f
2335 : 2a __ __ ROL
2336 : 06 3b __ ASL ACCU + 0 
2338 : 2a __ __ ROL
2339 : 8d 21 9f STA $9f21 
233c : a5 3b __ LDA ACCU + 0 
233e : 8d 20 9f STA $9f20 
2341 : a9 11 __ LDA #$11
2343 : 8d 22 9f STA $9f22 
2346 : a5 2e __ LDA P1 ; (addr32 + 0)
2348 : 8d 23 9f STA $9f23 
234b : ad 22 9f LDA $9f22 
234e : 29 0f __ AND #$0f
2350 : 8d 22 9f STA $9f22 
2353 : ad 23 9f LDA $9f23 
2356 : 29 80 __ AND #$80
2358 : 05 2f __ ORA P2 ; (addr32 + 1)
235a : 8d 23 9f STA $9f23 
.s1001:
235d : 60 __ __ RTS
--------------------------------------------------------------------
TestText2:
4669 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 03 12 05 04 09 14 13 :  - - = = .......
4679 : __ __ __ BYT 3a 20 03 0f 04 05 3a 20 02 0c 15 0d 02 01 2c 20 : : ....: ......, 
4689 : __ __ __ BYT 0d 01 12 0b 2d 02 15 07 13 0c 01 19 05 12 2c 20 : ....-........., 
4699 : __ __ __ BYT 03 12 09 13 10 13 2e 20 0d 15 13 09 03 09 01 0e : ....... ........
46a9 : __ __ __ BYT 13 3a 20 01 02 13 14 12 01 03 14 36 34 2c 20 01 : .: ........64, .
46b9 : __ __ __ BYT 0c 05 0b 13 09 20 17 09 0e 13 14 0f 0e 2c 20 06 : ..... ......., .
46c9 : __ __ __ BYT 01 04 05 2c 20 0b 0f 0c 05 2d 0f 2d 02 0c 01 03 : ..., ....-.-....
46d9 : __ __ __ BYT 0b 2c 20 0d 05 07 01 2d 13 10 01 12 0b 19 2c 20 : ., ....-......, 
46e9 : __ __ __ BYT 14 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f : ...-....-.......
46f9 : __ __ __ BYT 07 2d 13 0f 0e 09 03 2e 20 03 12 09 13 10 13 20 : .-...... ...... 
4709 : __ __ __ BYT 08 05 12 05 2c 20 14 08 09 13 20 17 01 13 20 14 : ...., .... ... .
4719 : __ __ __ BYT 08 05 20 06 09 12 13 14 20 14 09 0d 05 20 17 0f : .. ..... .... ..
4729 : __ __ __ BYT 12 0b 09 0e 07 20 0f 0e 20 01 0e 19 20 38 20 02 : ..... .. ... 8 .
4739 : __ __ __ BYT 09 14 20 0d 01 03 08 09 0e 05 2e 20 14 08 01 0e : .. ........ ....
4749 : __ __ __ BYT 0b 13 20 14 0f 20 14 08 05 20 03 0f 04 05 12 13 : .. .. ... ......
4759 : __ __ __ BYT 20 0c 09 13 14 05 04 20 09 20 0d 01 0e 01 07 05 :  ...... . ......
4769 : __ __ __ BYT 04 20 14 0f 20 06 09 0e 09 13 08 20 14 08 09 13 : . .. ...... ....
4779 : __ __ __ BYT 20 17 09 14 08 20 14 08 05 20 0f 13 03 01 12 36 :  .... ... .....6
4789 : __ __ __ BYT 34 20 03 0f 0d 10 09 0c 05 12 2e 20 0d 0f 13 14 : 4 ......... ....
4799 : __ __ __ BYT 20 06 0f 0c 0b 20 20 14 0f 0c 04 20 0d 05 20 14 :  ....  .... .. .
47a9 : __ __ __ BYT 0f 20 15 13 05 20 03 03 36 35 20 08 0f 17 05 16 : . ... ..65 .....
47b9 : __ __ __ BYT 05 12 20 09 20 17 01 13 20 09 0e 14 05 12 05 13 : .. . ... .......
47c9 : __ __ __ BYT 14 05 04 20 09 0e 20 08 01 16 09 0e 07 20 14 08 : ... .. ...... ..
47d9 : __ __ __ BYT 05 20 10 12 0f 07 12 01 0d 20 01 03 14 15 01 0c : . ....... ......
47e9 : __ __ __ BYT 0c 19 20 03 0f 0d 10 09 0c 05 20 14 08 01 0e 20 : .. ....... .... 
47f9 : __ __ __ BYT 07 09 16 05 20 0d 05 20 03 12 19 10 14 09 03 20 : .... .. ....... 
4809 : __ __ __ BYT 05 12 12 0f 12 13 20 01 0e 04 20 10 05 12 0d 09 : ...... ... .....
4819 : __ __ __ BYT 13 13 09 0f 0e 20 09 13 13 15 05 13 20 28 04 05 : ..... ...... (..
4829 : __ __ __ BYT 13 10 09 14 05 20 14 08 05 20 06 01 03 14 20 09 : ..... ... .... .
4839 : __ __ __ BYT 20 0f 17 0e 20 14 08 05 20 03 0f 0d 10 15 14 05 :  ... ... .......
4849 : __ __ __ BYT 12 29 20 3e 3a 1b 2e 20 05 09 14 08 05 12 20 17 : .) >:.. ...... .
4859 : __ __ __ BYT 01 19 2c 20 14 08 09 13 20 09 13 20 05 18 09 13 : .., .... .. ....
4869 : __ __ __ BYT 14 09 0e 07 20 01 0e 04 20 09 20 04 0f 20 17 01 : .... ... . .. ..
4879 : __ __ __ BYT 0e 0e 01 20 14 08 01 0e 0b 20 05 16 05 12 19 0f : ... ..... ......
4889 : __ __ __ BYT 0e 05 20 17 08 0f 27 13 20 08 05 0c 10 05 04 20 : .. ...'. ...... 
4899 : __ __ __ BYT 0f 15 14 20 17 09 14 08 20 14 08 09 13 2e 17 09 : ... .... .......
48a9 : __ __ __ BYT 14 08 0f 15 14 20 01 20 07 12 0f 15 10 20 0f 06 : ..... . ..... ..
48b9 : __ __ __ BYT 20 0d 15 13 09 03 09 01 0e 13 20 28 01 0e 04 20 :  ......... (... 
48c9 : __ __ __ BYT 05 13 10 05 03 09 01 0c 0c 19 20 03 0f 04 05 12 : .......... .....
48d9 : __ __ __ BYT 13 29 20 14 08 09 13 20 17 0f 15 0c 04 0e 27 14 : .) .... ......'.
48e9 : __ __ __ BYT 20 05 18 09 13 14 20 09 0e 20 01 0e 19 20 03 01 :  ..... .. ... ..
48f9 : __ __ __ BYT 10 01 03 09 14 19 2e 20 09 0e 20 14 05 12 0d 13 : ....... .. .....
4909 : __ __ __ BYT 20 0f 06 20 17 08 19 2c 20 17 05 0c 0c 2c 20 09 :  .. ..., ...., .
4919 : __ __ __ BYT 20 17 01 0e 14 05 04 20 02 05 20 09 0e 20 01 20 :  ...... .. .. . 
4929 : __ __ __ BYT 0d 15 13 09 03 20 04 09 13 03 20 2f 20 04 05 0d : ..... .... / ...
4939 : __ __ __ BYT 0f 20 01 0e 04 20 13 09 0e 03 05 20 09 20 03 0f : . ... ..... . ..
4949 : __ __ __ BYT 15 0c 04 0e 27 14 20 06 09 0e 04 20 01 20 03 0f : ....'. .... . ..
4959 : __ __ __ BYT 04 05 12 20 17 08 0f 27 04 20 04 0f 20 09 14 20 : ... ...'. .. .. 
4969 : __ __ __ BYT 06 0f 12 20 0d 05 20 09 20 0a 15 13 14 20 13 01 : ... .. . .... ..
4979 : __ __ __ BYT 09 04 20 22 20 06 20 15 20 03 20 0b 20 20 09 20 : .. " . . . .  . 
4989 : __ __ __ BYT 14 20 20 09 27 0c 0c 20 04 0f 20 09 14 20 0d 19 : .  .'.. .. .. ..
4999 : __ __ __ BYT 13 05 0c 06 2e 22 20 01 0e 04 20 13 09 0e 03 05 : ....." ... .....
49a9 : __ __ __ BYT 20 19 0f 15 27 12 05 20 12 05 01 04 09 0e 07 20 :  ...'.. ....... 
49b9 : __ __ __ BYT 14 08 09 13 20 09 14 20 17 01 13 20 01 20 13 15 : .... .. ... . ..
49c9 : __ __ __ BYT 03 03 05 13 13 2e 09 20 04 09 04 20 06 09 0e 04 : ....... ... ....
49d9 : __ __ __ BYT 20 14 08 01 14 20 07 0f 09 0e 07 20 14 0f 20 14 :  .... ..... .. .
49e9 : __ __ __ BYT 08 05 20 18 31 36 20 0d 15 13 09 03 20 17 09 13 : .. .16 ..... ...
49f9 : __ __ __ BYT 05 20 17 01 13 20 16 05 12 19 20 05 01 13 19 2e : . ... .... .....
4a09 : __ __ __ BYT 20 13 09 0e 03 05 20 14 08 05 20 16 05 12 01 20 :  ..... ... .... 
4a19 : __ __ __ BYT 03 08 09 10 27 13 20 0d 15 13 09 03 20 03 01 10 : ....'. ..... ...
4a29 : __ __ __ BYT 01 02 09 0c 09 14 05 13 20 01 12 05 20 13 0f 20 : ........ ... .. 
4a39 : __ __ __ BYT 13 09 04 2d 0c 09 0b 05 20 09 20 03 0f 15 0c 04 : ...-.... . .....
4a49 : __ __ __ BYT 20 02 12 09 0e 07 20 13 0f 15 0e 04 20 04 05 13 :  ..... ..... ...
4a59 : __ __ __ BYT 09 07 0e 20 06 12 0f 0d 20 14 08 01 14 20 14 0f : ... .... .... ..
4a69 : __ __ __ BYT 20 14 08 05 20 16 05 12 01 2e 20 06 0d 20 17 09 :  ... ..... .. ..
4a79 : __ __ __ BYT 13 05 2c 20 09 27 04 20 01 0c 12 05 01 04 19 20 : .., .'. ....... 
4a89 : __ __ __ BYT 02 05 05 0e 20 17 0f 12 0b 09 0e 07 20 0f 0e 20 : .... ....... .. 
4a99 : __ __ __ BYT 0d 15 13 09 03 20 0f 0e 20 14 08 05 20 0d 05 07 : ..... .. ... ...
4aa9 : __ __ __ BYT 01 04 12 09 16 05 20 06 0f 12 20 01 20 0c 0f 0e : ...... ... . ...
4ab9 : __ __ __ BYT 07 2d 01 13 13 20 14 09 0d 05 20 02 05 06 0f 12 : .-... .... .....
4ac9 : __ __ __ BYT 05 08 01 0e 04 20 13 0f 20 14 08 01 14 20 17 01 : ..... .. .... ..
4ad9 : __ __ __ BYT 13 20 01 20 13 0d 0f 0f 14 08 20 0a 15 0d 10 20 : . . ...... .... 
4ae9 : __ __ __ BYT 01 13 20 17 05 0c 0c 2c 20 13 09 0e 03 05 20 13 : .. ...., ..... .
4af9 : __ __ __ BYT 14 01 12 14 09 0e 07 20 09 27 16 05 20 01 0c 13 : ....... .'.. ...
4b09 : __ __ __ BYT 0f 20 14 12 09 05 04 20 09 0d 10 12 0f 16 09 0e : . ..... ........
4b19 : __ __ __ BYT 07 20 14 08 05 20 13 0f 15 0e 04 20 04 05 13 09 : . ... ..... ....
4b29 : __ __ __ BYT 07 0e 2c 20 14 0f 20 16 01 12 19 20 04 05 07 12 : .., .. .... ....
4b39 : __ __ __ BYT 05 05 13 20 0f 06 20 13 15 03 03 05 13 13 2e 2e : ... .. .........
4b49 : __ __ __ BYT 2e 09 20 01 0c 13 0f 20 04 09 04 0e 27 14 20 05 : .. .... ....'. .
4b59 : __ __ __ BYT 18 10 05 03 14 20 14 08 09 13 20 14 0f 20 14 01 : ..... .... .. ..
4b69 : __ __ __ BYT 0b 05 20 13 0f 20 0c 0f 0e 07 2c 20 01 13 20 0d : .. .. ...., .. .
4b79 : __ __ __ BYT 19 20 0f 12 09 07 09 0e 01 0c 20 10 0c 01 0e 20 : . ........ .... 
4b89 : __ __ __ BYT 17 01 13 20 14 17 0f 20 17 05 05 0b 13 2e 20 01 : ... ... ...... .
4b99 : __ __ __ BYT 13 20 0f 06 20 17 12 09 14 09 0e 07 20 14 08 09 : . .. ....... ...
4ba9 : __ __ __ BYT 13 20 09 14 27 13 20 02 05 05 0e 20 0f 16 05 12 : . ..'. .... ....
4bb9 : __ __ __ BYT 20 14 17 0f 20 0d 0f 0e 14 08 13 2e 20 0f 0f 10 :  ... ....... ...
4bc9 : __ __ __ BYT 13 2e 20 01 08 20 17 05 0c 0c 2c 20 03 0f 15 0c : .. .. ...., ....
4bd9 : __ __ __ BYT 04 20 02 05 20 17 0f 12 13 05 2e 4e 4d 4e 4d 4e : . .. ......NMNMN
4be9 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4bf9 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c09 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c19 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c29 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c39 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c49 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c59 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c69 : __ __ __ BYT 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e 4d 4e : MNMNMNMNMNMNMNMN
4c79 : __ __ __ BYT 4d 4e 4d 4e 4d 20 3d 20 3d 20 2d 20 2d 00       : MNMNM = = - -.
--------------------------------------------------------------------
Song1:
4c87 : __ __ __ BYT 20 2d 20 2d 20 3d 20 3d 20 13 0f 0e 07 20 0e 01 :  - - = = .... ..
4c97 : __ __ __ BYT 0d 05 3a 20 2d 20 22 10 01 10 05 12 03 0c 09 10 : ..: - ".........
4ca7 : __ __ __ BYT 22 20 2d 20 01 12 14 09 13 14 3a 20 22 0b 0f 0c : " - ......: "...
4cb7 : __ __ __ BYT 05 2d 0f 2d 02 0c 01 03 0b 22 20 2d 20 0c 05 0e : .-.-....." - ...
4cc7 : __ __ __ BYT 07 14 08 3a 20 32 3a 35 39 20 2d 20 03 0f 0d 0d : ...: 2:59 - ....
4cd7 : __ __ __ BYT 05 0e 14 3a 20 0f 12 09 07 09 0e 01 0c 0c 19 20 : ...: .......... 
4ce7 : __ __ __ BYT 03 01 0c 0c 05 04 20 22 04 05 13 14 12 0f 19 22 : ...... "......."
4cf7 : __ __ __ BYT 2c 20 09 20 0d 01 04 05 20 14 08 09 13 20 14 12 : , . .... .... ..
4d07 : __ __ __ BYT 01 03 0b 20 01 20 06 05 17 20 0d 0f 0e 14 08 13 : ... . ... ......
4d17 : __ __ __ BYT 20 02 01 03 0b 20 10 12 09 0d 01 12 09 0c 19 20 :  .... ......... 
4d27 : __ __ __ BYT 01 13 20 0d 05 01 0e 13 20 14 0f 20 13 14 15 04 : .. ..... .. ....
4d37 : __ __ __ BYT 19 20 32 31 35 31 20 13 0f 15 0e 04 20 04 05 13 : . 2151 ..... ...
4d47 : __ __ __ BYT 09 07 0e 2c 20 01 0e 04 20 01 0c 13 0f 20 01 13 : ..., ... .... ..
4d57 : __ __ __ BYT 20 01 20 13 14 01 12 14 09 0e 07 20 10 0f 09 0e :  . ........ ....
4d67 : __ __ __ BYT 14 20 06 0f 12 20 0d 19 20 03 18 31 36 20 0d 15 : . ... .. ..16 ..
4d77 : __ __ __ BYT 13 09 03 20 17 0f 12 0b 20 09 0e 20 07 05 0e 05 : ... .... .. ....
4d87 : __ __ __ BYT 12 01 0c 2e 20 09 06 20 19 0f 15 27 12 05 20 06 : .... .. ...'.. .
4d97 : __ __ __ BYT 12 0f 0d 20 14 08 05 20 13 08 01 12 10 20 18 36 : ... ... ..... .6
4da7 : __ __ __ BYT 38 0b 20 13 03 05 0e 05 2c 20 19 0f 15 20 0d 09 : 8. ....., ... ..
4db7 : __ __ __ BYT 07 08 14 20 02 05 20 01 02 0c 05 20 14 0f 20 13 : ... .. .... .. .
4dc7 : __ __ __ BYT 10 0f 14 20 14 08 05 20 13 05 0d 02 0c 01 0e 03 : ... ... ........
4dd7 : __ __ __ BYT 05 20 02 05 14 17 05 05 0e 20 14 08 09 13 20 14 : . ....... .... .
4de7 : __ __ __ BYT 12 01 03 0b 20 01 0e 04 20 08 09 1a 0d 09 27 13 : .... ... .....'.
4df7 : __ __ __ BYT 20 22 0d 15 14 13 15 12 01 04 01 09 0b 0f 22 20 :  "............" 
4e07 : __ __ __ BYT 2f 20 22 0d 15 14 1a 12 01 04 22 20 14 12 01 03 : / "......." ....
4e17 : __ __ __ BYT 0b 20 06 12 0f 0d 20 14 08 05 09 12 20 04 12 15 : . .... ..... ...
4e27 : __ __ __ BYT 0d 20 04 01 05 0d 0f 0e 20 01 0c 02 15 0d 2e 20 : . ...... ...... 
4e37 : __ __ __ BYT 14 08 01 14 27 13 20 0e 0f 14 20 01 20 03 0f 09 : ....'. ... . ...
4e47 : __ __ __ BYT 0e 03 09 04 05 0e 03 05 3b 20 0f 0e 05 20 0f 06 : ........; ... ..
4e57 : __ __ __ BYT 20 0d 19 20 07 0f 01 0c 13 20 09 0e 20 14 08 05 :  .. ..... .. ...
4e67 : __ __ __ BYT 20 03 18 31 36 20 13 03 05 0e 05 20 2a 09 13 2a :  ..16 ..... *..*
4e77 : __ __ __ BYT 20 14 0f 20 02 05 20 28 14 0f 20 01 0e 20 05 18 :  .. .. (.. .. ..
4e87 : __ __ __ BYT 14 05 0e 14 29 20 09 14 13 20 08 09 1a 0d 09 2e : ....) ... ......
4e97 : __ __ __ BYT 20 28 0f 12 20 12 05 01 0c 0c 19 20 01 0e 19 20 :  (.. ...... ... 
4ea7 : __ __ __ BYT 0f 06 20 14 08 05 20 18 36 38 0b 20 08 01 12 04 : .. ... .68. ....
4eb7 : __ __ __ BYT 03 0f 12 05 20 14 05 03 08 0e 0f 20 01 06 06 09 : .... ...... ....
4ec7 : __ __ __ BYT 03 09 0f 0e 01 04 0f 13 29 20 14 08 05 20 0e 01 : ........) ... ..
4ed7 : __ __ __ BYT 0d 05 3f 20 09 20 13 15 10 10 0f 13 05 20 09 14 : ..? . ....... ..
4ee7 : __ __ __ BYT 27 13 20 01 20 13 0f 0e 07 20 14 0f 20 12 05 0f : '. . .... .. ...
4ef7 : __ __ __ BYT 10 05 0e 20 0f 0c 04 20 04 01 16 09 04 20 0d 15 : ... ... ..... ..
4f07 : __ __ __ BYT 12 12 01 19 20 17 0f 15 0e 04 13 20 14 0f 2e 20 : .... ...... ... 
4f17 : __ __ __ BYT 14 08 05 20 03 0c 09 10 10 09 0e 07 20 01 0e 04 : ... ........ ...
4f27 : __ __ __ BYT 20 14 08 05 20 0c 0f 15 04 0e 05 13 13 20 3f 20 :  ... ........ ? 
4f37 : __ __ __ BYT 09 14 27 13 20 09 0e 14 05 0e 14 09 0f 0e 01 0c : ..'. ...........
4f47 : __ __ __ BYT 2e 20 09 20 12 05 03 01 0c 0c 20 13 08 05 05 10 : . . ...... .....
4f57 : __ __ __ BYT 09 13 08 0c 19 20 13 08 0f 17 09 0e 07 20 01 20 : ..... ....... . 
4f67 : __ __ __ BYT 10 12 05 16 09 05 17 20 14 08 09 13 20 14 12 01 : ....... .... ...
4f77 : __ __ __ BYT 03 0b 20 14 0f 20 0d 19 20 05 18 14 12 01 03 15 : .. .. .. .......
4f87 : __ __ __ BYT 12 12 09 03 15 0c 01 12 20 13 0f 15 0e 04 20 01 : ........ ..... .
4f97 : __ __ __ BYT 12 14 13 20 01 03 14 09 16 09 14 19 20 10 12 0f : ... ........ ...
4fa7 : __ __ __ BYT 06 05 13 13 0f 12 20 17 08 09 0c 05 20 04 0f 09 : ...... ..... ...
4fb7 : __ __ __ BYT 0e 07 20 01 0e 20 09 0e 14 12 0f 04 15 03 14 09 : .. .. ..........
4fc7 : __ __ __ BYT 0f 0e 20 14 0f 20 07 05 0e 05 12 01 14 09 0e 07 : .. .. ..........
4fd7 : __ __ __ BYT 20 13 0f 15 0e 04 20 0f 02 0a 05 03 14 13 20 01 :  ..... ....... .
4fe7 : __ __ __ BYT 06 14 05 12 20 08 05 20 01 13 0b 05 04 20 15 13 : .... .. ..... ..
4ff7 : __ __ __ BYT 20 09 06 20 01 0e 19 20 0f 06 20 15 13 20 04 09 :  .. ... .. .. ..
5007 : __ __ __ BYT 04 20 01 0e 19 14 08 09 0e 07 20 09 0e 20 14 05 : . ........ .. ..
5017 : __ __ __ BYT 12 0d 13 20 0f 06 20 03 0f 0d 10 0f 13 09 14 09 : ... .. .........
5027 : __ __ __ BYT 0f 0e 2e 20 13 15 06 06 09 03 05 20 14 0f 20 13 : ... ....... .. .
5037 : __ __ __ BYT 01 19 2c 20 08 05 20 04 09 04 20 0c 09 0b 05 20 : .., .. ... .... 
5047 : __ __ __ BYT 09 14 20 04 05 13 10 09 14 05 20 14 08 05 20 06 : .. ....... ... .
5057 : __ __ __ BYT 01 03 14 20 14 08 01 14 20 09 14 20 17 01 13 20 : ... .... .. ... 
5067 : __ __ __ BYT 0d 0f 13 14 0c 19 20 01 04 0a 01 03 05 0e 14 20 : ...... ........ 
5077 : __ __ __ BYT 14 0f 20 14 05 03 08 0e 0f 28 10 01 12 14 09 03 : .. ......(......
5087 : __ __ __ BYT 15 0c 01 12 0c 19 20 08 0f 15 13 05 01 0e 04 20 : ...... ........ 
5097 : __ __ __ BYT 08 01 12 04 03 0f 12 05 29 2c 20 17 08 09 0c 05 : ........), .....
50a7 : __ __ __ BYT 20 0d 0f 13 14 20 0f 06 20 14 08 05 20 13 14 19 :  .... .. ... ...
50b7 : __ __ __ BYT 0c 09 0e 07 13 20 02 05 09 0e 07 20 14 01 15 07 : ..... ..... ....
50c7 : __ __ __ BYT 08 14 20 17 05 12 05 20 0d 0f 13 14 0c 19 20 09 : .. .... ...... .
50d7 : __ __ __ BYT 0e 20 14 08 05 20 06 09 05 0c 04 20 0f 06 20 01 : . ... ..... .. .
50e7 : __ __ __ BYT 16 01 0e 14 07 01 12 04 05 2e 20 01 0e 0f 14 08 : .......... .....
50f7 : __ __ __ BYT 05 12 20 10 01 12 14 09 03 15 0c 01 12 0c 19 20 : .. ............ 
5107 : __ __ __ BYT 06 15 0e 0e 19 20 13 14 0f 12 19 20 01 02 0f 15 : ..... ..... ....
5117 : __ __ __ BYT 14 20 14 08 09 13 20 14 12 01 03 0b 20 17 01 13 : . .... ..... ...
5127 : __ __ __ BYT 20 08 0f 17 20 09 14 20 05 16 05 0e 20 07 0f 14 :  ... .. .... ...
5137 : __ __ __ BYT 20 0f 0e 14 0f 20 14 08 09 13 20 0d 15 13 09 03 :  .... .... .....
5147 : __ __ __ BYT 04 09 13 0b 3a 20 09 20 06 09 12 13 14 20 10 0f : ....: . ..... ..
5157 : __ __ __ BYT 13 14 05 04 20 09 14 20 09 0e 20 14 08 05 20 0d : .... .. .. ... .
5167 : __ __ __ BYT 15 13 09 03 20 13 08 01 12 09 0e 07 20 03 08 01 : .... ....... ...
5177 : __ __ __ BYT 0e 0e 05 0c 20 0f 06 20 14 08 05 20 03 0f 0d 0d : .... .. ... ....
5187 : __ __ __ BYT 01 0e 04 05 12 20 18 31 36 20 04 09 13 03 0f 12 : ..... .16 ......
5197 : __ __ __ BYT 04 13 2c 20 17 08 09 03 08 20 14 08 05 0e 20 03 : .., ..... .... .
51a7 : __ __ __ BYT 01 15 07 08 14 20 14 08 05 20 05 01 12 13 20 01 : ..... ... .... .
51b7 : __ __ __ BYT 0e 04 20 05 19 05 13 20 0f 06 20 03 12 09 13 10 : .. .... .. .....
51c7 : __ __ __ BYT 13 2c 20 17 08 0f 20 14 08 05 0e 20 01 13 0b 05 : ., ... .... ....
51d7 : __ __ __ BYT 04 20 0d 05 20 09 06 20 08 05 20 03 0f 15 0c 04 : . .. .. .. .....
51e7 : __ __ __ BYT 20 15 13 05 20 09 14 20 06 0f 12 20 14 08 09 13 :  ... .. ... ....
51f7 : __ __ __ BYT 20 0d 15 13 09 03 04 09 13 0b 2e 20 14 08 09 13 :  .......... ....
5207 : __ __ __ BYT 20 01 03 14 15 01 0c 0c 19 20 0d 0f 14 09 16 01 :  ........ ......
5217 : __ __ __ BYT 14 05 04 20 0d 05 20 14 0f 20 06 09 0e 09 13 08 : ... .. .. ......
5227 : __ __ __ BYT 20 09 14 2c 20 14 08 0f 15 07 08 20 09 20 08 09 :  .., ...... . ..
5237 : __ __ __ BYT 14 20 0f 0e 05 20 0d 01 0a 0f 12 20 12 0f 01 04 : . ... ..... ....
5247 : __ __ __ BYT 02 0c 0f 03 0b 20 17 08 05 0e 20 09 20 03 0f 15 : ..... .... . ...
5257 : __ __ __ BYT 0c 04 0e 27 14 20 0f 10 14 09 0d 09 1a 05 20 09 : ...'. ........ .
5267 : __ __ __ BYT 14 20 05 0e 0f 15 07 08 20 14 0f 20 05 0e 13 15 : . ...... .. ....
5277 : __ __ __ BYT 12 05 20 0e 0f 20 02 01 0e 0b 09 0e 07 20 17 0f : .. .. ....... ..
5287 : __ __ __ BYT 15 0c 04 20 02 05 20 0e 05 05 04 05 04 20 02 05 : ... .. ...... ..
5297 : __ __ __ BYT 03 01 15 13 05 20 14 08 05 20 1a 13 0d 20 06 0f : ..... ... ... ..
52a7 : __ __ __ BYT 12 0d 01 14 20 09 13 20 01 0e 20 15 14 14 05 12 : .... .. .. .....
52b7 : __ __ __ BYT 20 06 15 03 0b 09 0e 07 20 0a 0f 0b 05 2e 20 28 :  ....... ..... (
52c7 : __ __ __ BYT 0e 0f 20 13 08 09 14 20 09 14 27 13 20 11 15 09 : .. .... ..'. ...
52d7 : __ __ __ BYT 14 05 20 0c 09 14 05 12 01 0c 0c 19 20 0a 15 13 : .. ......... ...
52e7 : __ __ __ BYT 14 20 16 07 0d 20 01 0c 0c 20 0f 16 05 12 20 01 : . ... ... .... .
52f7 : __ __ __ BYT 07 01 09 0e 29 20 05 09 14 08 05 12 20 17 01 19 : ....) ...... ...
5307 : __ __ __ BYT 2c 20 09 27 0d 20 0c 0f 0f 0b 09 0e 07 20 06 0f : , .'. ....... ..
5317 : __ __ __ BYT 12 17 01 12 04 20 14 0f 20 04 0f 09 0e 07 20 0d : ..... .. ..... .
5327 : __ __ __ BYT 0f 12 05 20 32 31 35 31 20 13 0f 15 0e 04 20 09 : ... 2151 ..... .
5337 : __ __ __ BYT 0e 20 14 08 05 20 06 15 14 15 12 05 2c 20 01 13 : . ... ......, ..
5347 : __ __ __ BYT 20 14 08 09 13 20 17 01 13 20 04 05 06 09 0e 09 :  .... ... ......
5357 : __ __ __ BYT 14 05 0c 19 20 01 20 06 15 0e 20 05 18 10 05 12 : .... . ... .....
5367 : __ __ __ BYT 09 05 0e 03 05 2e 20 28 05 18 03 05 10 14 20 06 : ...... (...... .
5377 : __ __ __ BYT 0f 12 20 03 12 09 13 10 13 27 20 12 09 04 09 03 : .. ......' .....
5387 : __ __ __ BYT 15 0c 0f 15 13 20 04 05 02 15 07 07 09 0e 07 20 : ..... ......... 
5397 : __ __ __ BYT 14 09 0d 05 20 13 09 0e 0b 2c 20 02 15 14 20 09 : .... ...., ... .
53a7 : __ __ __ BYT 20 03 01 0e 20 06 0f 12 07 09 16 05 20 14 08 01 :  ... ....... ...
53b7 : __ __ __ BYT 14 20 13 09 0e 03 05 20 09 14 27 13 20 08 09 13 : . ..... ..'. ...
53c7 : __ __ __ BYT 20 06 09 12 13 14 20 14 09 0d 05 20 09 20 14 08 :  ..... .... . ..
53d7 : __ __ __ BYT 09 0e 0b 29 20 3d 20 3d 20 2d 20 2d 00          : ...) = = - -.
--------------------------------------------------------------------
Song2:
5400 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5410 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 07 05 0d 20 09 : ..: - "... ... .
5420 : __ __ __ BYT 0e 06 05 13 14 05 04 20 14 05 12 12 01 2d 14 0f : ....... .....-..
5430 : __ __ __ BYT 12 19 22 20 2d 20 01 12 14 09 13 14 3a 20 22 14 : .." - ......: ".
5440 : __ __ __ BYT 08 05 2d 12 05 01 0c 2d 08 05 04 07 05 08 0f 07 : ..-....-........
5450 : __ __ __ BYT 2d 13 0f 0e 09 03 22 20 2d 20 0c 05 0e 07 14 08 : -....." - ......
5460 : __ __ __ BYT 3a 20 31 3a 33 35 20 2d 20 03 0f 0d 0d 05 0e 14 : : 1:35 - .......
5470 : __ __ __ BYT 3a 20 03 12 09 13 10 13 20 0e 05 16 05 12 20 06 : : ...... ..... .
5480 : __ __ __ BYT 15 0c 06 09 0c 0c 05 04 20 0d 19 20 17 09 13 08 : ........ .. ....
5490 : __ __ __ BYT 20 06 0f 12 20 14 08 01 14 20 06 01 0b 05 20 07 :  ... .... .... .
54a0 : __ __ __ BYT 01 0d 05 20 0f 13 14 2c 20 13 0f 20 09 20 04 09 : ... ..., .. . ..
54b0 : __ __ __ BYT 04 20 09 14 20 0d 19 13 05 0c 06 2e 20 3d 20 3d : . .. ....... = =
54c0 : __ __ __ BYT 20 2d 20 2d 20 00                               :  - - .
--------------------------------------------------------------------
Song3:
5500 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5510 : __ __ __ BYT 0d 05 3a 20 2d 20 22 14 08 05 20 12 01 04 09 01 : ..: - "... .....
5520 : __ __ __ BYT 0e 14 20 12 01 04 09 0f 01 03 14 09 16 05 20 12 : .. ........... .
5530 : __ __ __ BYT 0f 03 0b 13 0c 09 04 05 22 20 2d 20 01 12 14 09 : ........" - ....
5540 : __ __ __ BYT 13 14 3a 20 22 14 08 05 2d 12 05 01 0c 2d 08 05 : ..: "...-....-..
5550 : __ __ __ BYT 04 07 05 08 0f 07 2d 13 0f 0e 09 03 22 20 2d 20 : ......-....." - 
5560 : __ __ __ BYT 0c 05 0e 07 14 08 3a 20 31 3a 33 36 20 2d 20 03 : ......: 1:36 - .
5570 : __ __ __ BYT 0f 0d 0d 05 0e 14 3a 20 14 08 05 20 03 12 19 13 : ......: ... ....
5580 : __ __ __ BYT 14 01 0c 20 04 09 0d 05 0e 13 09 0f 0e 20 17 01 : ... ......... ..
5590 : __ __ __ BYT 13 20 13 0f 20 0e 09 03 05 2c 20 19 0f 15 20 07 : . .. ...., ... .
55a0 : __ __ __ BYT 05 14 20 14 0f 20 05 18 10 05 12 09 05 0e 03 05 : .. .. ..........
55b0 : __ __ __ BYT 20 09 14 20 14 17 09 03 05 21 20 3d 20 3d 20 2d :  .. .....! = = -
55c0 : __ __ __ BYT 20 2d 20 00                                     :  - .
--------------------------------------------------------------------
Song4:
5600 : __ __ __ BYT 2d 20 2d 20 3d 20 3d 20 20 13 0f 0e 07 20 0e 01 : - - = =  .... ..
5610 : __ __ __ BYT 0d 05 3a 20 2d 20 22 07 0f 02 13 0d 01 03 0b 05 : ..: - ".........
5620 : __ __ __ BYT 04 22 20 2d 20 01 12 14 09 13 14 3a 20 22 06 01 : ." - ......: "..
5630 : __ __ __ BYT 04 05 22 20 2d 20 0c 05 0e 07 14 08 3a 20 33 3a : .." - ......: 3:
5640 : __ __ __ BYT 32 33 20 2d 20 03 0f 0d 0d 05 0e 14 3a 20 09 20 : 23 - .......: . 
5650 : __ __ __ BYT 02 05 14 20 19 0f 15 20 04 09 04 0e 27 14 20 14 : ... ... ....'. .
5660 : __ __ __ BYT 08 09 0e 0b 20 14 08 05 20 17 01 12 0d 14 08 20 : .... ... ...... 
5670 : __ __ __ BYT 0f 06 20 16 09 0e 19 0c 20 03 0f 15 0c 04 20 02 : .. ..... ..... .
5680 : __ __ __ BYT 05 20 12 05 10 0c 09 03 01 14 05 04 20 09 0e 20 : . .......... .. 
5690 : __ __ __ BYT 01 0e 19 14 08 09 0e 07 20 04 09 07 09 14 01 0c : ........ .......
56a0 : __ __ __ BYT 2c 20 02 15 14 20 08 05 12 05 20 17 05 20 01 12 : , ... .... .. ..
56b0 : __ __ __ BYT 05 20 3a 33 20 3d 20 3d 20 2d 20 2d 20 00       : . :3 = = - - .
--------------------------------------------------------------------
frame_wait:
.l1:
235e : ad 26 9f LDA $9f26 
2361 : 0a __ __ ASL
2362 : 30 fa __ BMI $235e ; (frame_wait.l1 + 0)
.l4:
2364 : ad 26 9f LDA $9f26 
2367 : 0a __ __ ASL
2368 : 10 fa __ BPL $2364 ; (frame_wait.l4 + 0)
.s1001:
236a : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
236b : 38 __ __ SEC
236c : a9 00 __ LDA #$00
236e : e5 3b __ SBC ACCU + 0 
2370 : 85 3b __ STA ACCU + 0 
2372 : a9 00 __ LDA #$00
2374 : e5 3c __ SBC ACCU + 1 
2376 : 85 3c __ STA ACCU + 1 
2378 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
2379 : 38 __ __ SEC
237a : a9 00 __ LDA #$00
237c : e5 23 __ SBC WORK + 0 
237e : 85 23 __ STA WORK + 0 
2380 : a9 00 __ LDA #$00
2382 : e5 24 __ SBC WORK + 1 
2384 : 85 24 __ STA WORK + 1 
2386 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
2387 : a5 3c __ LDA ACCU + 1 
2389 : d0 31 __ BNE $23bc ; (divmod + 53)
238b : a5 24 __ LDA WORK + 1 
238d : d0 1e __ BNE $23ad ; (divmod + 38)
238f : 85 26 __ STA WORK + 3 
2391 : a2 04 __ LDX #$04
2393 : 06 3b __ ASL ACCU + 0 
2395 : 2a __ __ ROL
2396 : c5 23 __ CMP WORK + 0 
2398 : 90 02 __ BCC $239c ; (divmod + 21)
239a : e5 23 __ SBC WORK + 0 
239c : 26 3b __ ROL ACCU + 0 
239e : 2a __ __ ROL
239f : c5 23 __ CMP WORK + 0 
23a1 : 90 02 __ BCC $23a5 ; (divmod + 30)
23a3 : e5 23 __ SBC WORK + 0 
23a5 : 26 3b __ ROL ACCU + 0 
23a7 : ca __ __ DEX
23a8 : d0 eb __ BNE $2395 ; (divmod + 14)
23aa : 85 25 __ STA WORK + 2 
23ac : 60 __ __ RTS
23ad : a5 3b __ LDA ACCU + 0 
23af : 85 25 __ STA WORK + 2 
23b1 : a5 3c __ LDA ACCU + 1 
23b3 : 85 26 __ STA WORK + 3 
23b5 : a9 00 __ LDA #$00
23b7 : 85 3b __ STA ACCU + 0 
23b9 : 85 3c __ STA ACCU + 1 
23bb : 60 __ __ RTS
23bc : a5 24 __ LDA WORK + 1 
23be : d0 1f __ BNE $23df ; (divmod + 88)
23c0 : a5 23 __ LDA WORK + 0 
23c2 : 30 1b __ BMI $23df ; (divmod + 88)
23c4 : a9 00 __ LDA #$00
23c6 : 85 26 __ STA WORK + 3 
23c8 : a2 10 __ LDX #$10
23ca : 06 3b __ ASL ACCU + 0 
23cc : 26 3c __ ROL ACCU + 1 
23ce : 2a __ __ ROL
23cf : c5 23 __ CMP WORK + 0 
23d1 : 90 02 __ BCC $23d5 ; (divmod + 78)
23d3 : e5 23 __ SBC WORK + 0 
23d5 : 26 3b __ ROL ACCU + 0 
23d7 : 26 3c __ ROL ACCU + 1 
23d9 : ca __ __ DEX
23da : d0 f2 __ BNE $23ce ; (divmod + 71)
23dc : 85 25 __ STA WORK + 2 
23de : 60 __ __ RTS
23df : a9 00 __ LDA #$00
23e1 : 85 25 __ STA WORK + 2 
23e3 : 85 26 __ STA WORK + 3 
23e5 : 84 22 __ STY $22 
23e7 : a0 10 __ LDY #$10
23e9 : 18 __ __ CLC
23ea : 26 3b __ ROL ACCU + 0 
23ec : 26 3c __ ROL ACCU + 1 
23ee : 26 25 __ ROL WORK + 2 
23f0 : 26 26 __ ROL WORK + 3 
23f2 : 38 __ __ SEC
23f3 : a5 25 __ LDA WORK + 2 
23f5 : e5 23 __ SBC WORK + 0 
23f7 : aa __ __ TAX
23f8 : a5 26 __ LDA WORK + 3 
23fa : e5 24 __ SBC WORK + 1 
23fc : 90 04 __ BCC $2402 ; (divmod + 123)
23fe : 86 25 __ STX WORK + 2 
2400 : 85 26 __ STA WORK + 3 
2402 : 88 __ __ DEY
2403 : d0 e5 __ BNE $23ea ; (divmod + 99)
2405 : 26 3b __ ROL ACCU + 0 
2407 : 26 3c __ ROL ACCU + 1 
2409 : a4 22 __ LDY $22 
240b : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
240c : 24 3c __ BIT ACCU + 1 
240e : 10 0d __ BPL $241d ; (mods16 + 17)
2410 : 20 6b 23 JSR $236b ; (negaccu + 0)
2413 : 24 24 __ BIT WORK + 1 
2415 : 10 0d __ BPL $2424 ; (mods16 + 24)
2417 : 20 79 23 JSR $2379 ; (negtmp + 0)
241a : 4c 87 23 JMP $2387 ; (divmod + 0)
241d : 24 24 __ BIT WORK + 1 
241f : 10 f9 __ BPL $241a ; (mods16 + 14)
2421 : 20 79 23 JSR $2379 ; (negtmp + 0)
2424 : 20 87 23 JSR $2387 ; (divmod + 0)
2427 : 38 __ __ SEC
2428 : a9 00 __ LDA #$00
242a : e5 25 __ SBC WORK + 2 
242c : 85 25 __ STA WORK + 2 
242e : a9 00 __ LDA #$00
2430 : e5 26 __ SBC WORK + 3 
2432 : 85 26 __ STA WORK + 3 
2434 : 60 __ __ RTS
