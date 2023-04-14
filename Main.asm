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
080e : 8e 0c 10 STX $100c ; (spentry + 0)
0811 : a9 5e __ LDA #$5e
0813 : 85 39 __ STA IP + 0 
0815 : a9 14 __ LDA #$14
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 18 __ LDA #$18
081c : e9 14 __ SBC #$14
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
0830 : a9 76 __ LDA #$76
0832 : e9 5e __ SBC #$5e
0834 : f0 08 __ BEQ $083e ; (startup + 61)
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 39 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839 ; (startup + 56)
083e : a9 fa __ LDA #$fa
0840 : 85 43 __ STA SP + 0 
0842 : a9 9e __ LDA #$9e
0844 : 85 44 __ STA SP + 1 
0846 : 20 80 08 JSR $0880 ; (main.s0 + 0)
0849 : a9 4c __ LDA #$4c
084b : 85 54 __ STA $54 
084d : a9 00 __ LDA #$00
084f : 85 13 __ STA $13 
0851 : a9 19 __ LDA #$19
0853 : 85 16 __ STA $16 
0855 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
100c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 35 09 JSR $0935 ; (zsm_irq_init.s0 + 0)
0883 : 20 03 0b JSR $0b03 ; (ClearVERAScreen.s0 + 0)
0886 : 20 46 0b JSR $0b46 ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9a __ LDA #$9a
0893 : 8d 2a 9f STA $9f2a 
0896 : ad 25 9f LDA $9f25 
0899 : 29 fd __ AND #$fd
089b : 8d 25 9f STA $9f25 
089e : a9 00 __ LDA #$00
08a0 : 8d 2d 9f STA $9f2d 
08a3 : a9 21 __ LDA #$21
08a5 : 8d 22 9f STA $9f22 
08a8 : a9 00 __ LDA #$00
08aa : 8d 20 9f STA $9f20 
08ad : a9 b0 __ LDA #$b0
08af : 8d 21 9f STA $9f21 
08b2 : a9 00 __ LDA #$00
08b4 : 85 4b __ STA T1 + 0 
.l2:
08b6 : a9 03 __ LDA #$03
08b8 : 8d 2c 9f STA $9f2c 
08bb : 20 53 0d JSR $0d53 ; (zsm_check.s0 + 0)
08be : 09 00 __ ORA #$00
08c0 : f0 0b __ BEQ $08cd ; (main.s6 + 0)
.s4:
08c2 : a9 c4 __ LDA #$c4
08c4 : 85 30 __ STA P3 
08c6 : a9 0e __ LDA #$0e
08c8 : 85 31 __ STA P4 
08ca : 20 57 0d JSR $0d57 ; (zsm_init.s0 + 0)
.s6:
08cd : a5 4b __ LDA T1 + 0 
08cf : 85 2e __ STA P1 
08d1 : 20 e2 0e JSR $0ee2 ; (Control.s0 + 0)
08d4 : a5 3b __ LDA ACCU + 0 
08d6 : 85 4b __ STA T1 + 0 
08d8 : ad 31 14 LDA $1431 ; (FrameCount + 0)
08db : 85 48 __ STA T3 + 0 
08dd : 85 3b __ STA ACCU + 0 
08df : ad 32 14 LDA $1432 ; (FrameCount + 1)
08e2 : 85 3c __ STA ACCU + 1 
08e4 : a9 04 __ LDA #$04
08e6 : 85 23 __ STA WORK + 0 
08e8 : a9 00 __ LDA #$00
08ea : 85 24 __ STA WORK + 1 
08ec : 20 e3 0f JSR $0fe3 ; (mods16 + 0)
08ef : a5 26 __ LDA WORK + 3 
08f1 : d0 16 __ BNE $0909 ; (main.s9 + 0)
.s1002:
08f3 : a5 25 __ LDA WORK + 2 
08f5 : c9 01 __ CMP #$01
08f7 : d0 10 __ BNE $0909 ; (main.s9 + 0)
.s7:
08f9 : ae 75 18 LDX $1875 ; (off1 + 0)
08fc : e8 __ __ INX
08fd : 8e 75 18 STX $1875 ; (off1 + 0)
0900 : bd 32 14 LDA $1432,x ; (FrameCount + 1)
0903 : 38 __ __ SEC
0904 : e9 40 __ SBC #$40
0906 : 8d 23 9f STA $9f23 
.s9:
0909 : 06 48 __ ASL T3 + 0 
090b : ad 32 14 LDA $1432 ; (FrameCount + 1)
090e : 2a __ __ ROL
090f : 18 __ __ CLC
0910 : 69 ff __ ADC #$ff
0912 : 8d 38 9f STA $9f38 
0915 : a5 48 __ LDA T3 + 0 
0917 : 8d 37 9f STA $9f37 
091a : a9 01 __ LDA #$01
091c : 8d 2c 9f STA $9f2c 
091f : 20 f6 0d JSR $0df6 ; (zsm_fill.s0 + 0)
0922 : a9 00 __ LDA #$00
0924 : 8d 2c 9f STA $9f2c 
0927 : 20 33 0f JSR $0f33 ; (frame_wait.l1 + 0)
092a : ee 31 14 INC $1431 ; (FrameCount + 0)
092d : d0 87 __ BNE $08b6 ; (main.l2 + 0)
.s1003:
092f : ee 32 14 INC $1432 ; (FrameCount + 1)
0932 : 4c b6 08 JMP $08b6 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0935 : 78 __ __ SEI
0936 : ad 14 03 LDA $0314 
0939 : 8d 5e 14 STA $145e ; (oirq + 0)
093c : ad 15 03 LDA $0315 
093f : 8d 5f 14 STA $145f ; (oirq + 1)
0942 : a9 4e __ LDA #$4e
0944 : 8d 14 03 STA $0314 
0947 : a9 09 __ LDA #$09
0949 : 8d 15 03 STA $0315 
094c : 58 __ __ CLI
.s1001:
094d : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
145e : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
094e : 20 54 09 JSR $0954 ; (irq.s1000 + 0)
0951 : 6c 5e 14 JMP ($145e)
--------------------------------------------------------------------
irq:
.s1000:
0954 : a5 2d __ LDA P0 
0956 : 48 __ __ PHA
0957 : a5 2e __ LDA P1 
0959 : 48 __ __ PHA
095a : a5 3b __ LDA ACCU + 0 
095c : 48 __ __ PHA
095d : a5 3c __ LDA ACCU + 1 
095f : 48 __ __ PHA
0960 : a5 47 __ LDA T0 + 0 
0962 : 48 __ __ PHA
0963 : a5 48 __ LDA $48 
0965 : 48 __ __ PHA
0966 : a5 49 __ LDA $49 
0968 : 48 __ __ PHA
0969 : a5 4a __ LDA $4a 
096b : 48 __ __ PHA
096c : a5 4b __ LDA $4b 
096e : 48 __ __ PHA
096f : a5 4c __ LDA $4c 
0971 : 48 __ __ PHA
0972 : a5 4d __ LDA $4d 
0974 : 48 __ __ PHA
0975 : a5 4e __ LDA $4e 
0977 : 48 __ __ PHA
0978 : a5 4f __ LDA $4f 
097a : 48 __ __ PHA
097b : a5 50 __ LDA $50 
097d : 48 __ __ PHA
.s0:
097e : ad 0d 10 LDA $100d ; (zsm_playing + 0)
0981 : f0 08 __ BEQ $098b ; (irq.s1001 + 0)
.s4:
0983 : ad 0e 10 LDA $100e ; (zsm_finished + 0)
0986 : d0 03 __ BNE $098b ; (irq.s1001 + 0)
.s1:
0988 : 20 b6 09 JSR $09b6 ; (zsm_play.s0 + 0)
.s1001:
098b : 68 __ __ PLA
098c : 85 50 __ STA $50 
098e : 68 __ __ PLA
098f : 85 4f __ STA $4f 
0991 : 68 __ __ PLA
0992 : 85 4e __ STA $4e 
0994 : 68 __ __ PLA
0995 : 85 4d __ STA $4d 
0997 : 68 __ __ PLA
0998 : 85 4c __ STA $4c 
099a : 68 __ __ PLA
099b : 85 4b __ STA $4b 
099d : 68 __ __ PLA
099e : 85 4a __ STA $4a 
09a0 : 68 __ __ PLA
09a1 : 85 49 __ STA $49 
09a3 : 68 __ __ PLA
09a4 : 85 48 __ STA $48 
09a6 : 68 __ __ PLA
09a7 : 85 47 __ STA T0 + 0 
09a9 : 68 __ __ PLA
09aa : 85 3c __ STA ACCU + 1 
09ac : 68 __ __ PLA
09ad : 85 3b __ STA ACCU + 0 
09af : 68 __ __ PLA
09b0 : 85 2e __ STA P1 
09b2 : 68 __ __ PLA
09b3 : 85 2d __ STA P0 
09b5 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
100d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
100e : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b6 : ad 60 14 LDA $1460 ; (zsm_delay + 0)
09b9 : f0 03 __ BEQ $09be ; (zsm_play.s2 + 0)
09bb : 4c eb 0a JMP $0aeb ; (zsm_play.s1 + 0)
.s2:
09be : ad 25 9f LDA $9f25 
09c1 : 85 47 __ STA T0 + 0 
09c3 : ad 25 9f LDA $9f25 
09c6 : 29 fe __ AND #$fe
09c8 : 8d 25 9f STA $9f25 
09cb : ad 20 9f LDA $9f20 
09ce : 85 49 __ STA T2 + 0 
09d0 : ad 21 9f LDA $9f21 
09d3 : 85 4a __ STA T2 + 1 
09d5 : ad 22 9f LDA $9f22 
09d8 : 85 48 __ STA T1 + 0 
.l5:
09da : ad 61 18 LDA $1861 ; (zsm_pos + 0)
09dd : 85 4b __ STA T3 + 0 
09df : 18 __ __ CLC
09e0 : 69 01 __ ADC #$01
09e2 : 85 4d __ STA T4 + 0 
09e4 : 8d 61 18 STA $1861 ; (zsm_pos + 0)
09e7 : ad 62 18 LDA $1862 ; (zsm_pos + 1)
09ea : aa __ __ TAX
09eb : 69 00 __ ADC #$00
09ed : 85 4e __ STA T4 + 1 
09ef : 8d 62 18 STA $1862 ; (zsm_pos + 1)
09f2 : 18 __ __ CLC
09f3 : a9 61 __ LDA #$61
09f5 : 65 4b __ ADC T3 + 0 
09f7 : 85 3b __ STA ACCU + 0 
09f9 : 8a __ __ TXA
09fa : 29 03 __ AND #$03
09fc : 69 14 __ ADC #$14
09fe : 85 3c __ STA ACCU + 1 
0a00 : a0 00 __ LDY #$00
0a02 : b1 3b __ LDA (ACCU + 0),y 
0a04 : c9 40 __ CMP #$40
0a06 : b0 03 __ BCS $0a0b ; (zsm_play.s9 + 0)
0a08 : 4c b6 0a JMP $0ab6 ; (zsm_play.s8 + 0)
.s9:
0a0b : d0 22 __ BNE $0a2f ; (zsm_play.s12 + 0)
.s11:
0a0d : 18 __ __ CLC
0a0e : a9 61 __ LDA #$61
0a10 : 65 4d __ ADC T4 + 0 
0a12 : 85 4b __ STA T3 + 0 
0a14 : a5 4e __ LDA T4 + 1 
0a16 : 29 03 __ AND #$03
0a18 : 69 14 __ ADC #$14
0a1a : 85 4c __ STA T3 + 1 
0a1c : b1 4b __ LDA (T3 + 0),y 
0a1e : 29 3f __ AND #$3f
0a20 : 18 __ __ CLC
0a21 : 65 4d __ ADC T4 + 0 
0a23 : 8d 61 18 STA $1861 ; (zsm_pos + 0)
0a26 : 98 __ __ TYA
0a27 : 65 4e __ ADC T4 + 1 
0a29 : 8d 62 18 STA $1862 ; (zsm_pos + 1)
0a2c : 4c da 09 JMP $09da ; (zsm_play.l5 + 0)
.s12:
0a2f : 09 00 __ ORA #$00
0a31 : 30 5b __ BMI $0a8e ; (zsm_play.s15 + 0)
.s14:
0a33 : 29 3f __ AND #$3f
0a35 : f0 a3 __ BEQ $09da ; (zsm_play.l5 + 0)
.s26:
0a37 : 84 50 __ STY T7 + 0 
0a39 : 85 4f __ STA T6 + 0 
0a3b : 18 __ __ CLC
.l1012:
0a3c : a9 61 __ LDA #$61
0a3e : 6d 61 18 ADC $1861 ; (zsm_pos + 0)
0a41 : 85 4d __ STA T4 + 0 
0a43 : ad 62 18 LDA $1862 ; (zsm_pos + 1)
0a46 : 29 03 __ AND #$03
0a48 : 69 14 __ ADC #$14
0a4a : 85 4e __ STA T4 + 1 
0a4c : a0 00 __ LDY #$00
0a4e : b1 4d __ LDA (T4 + 0),y 
0a50 : 85 2d __ STA P0 
0a52 : ad 61 18 LDA $1861 ; (zsm_pos + 0)
0a55 : 18 __ __ CLC
0a56 : 69 01 __ ADC #$01
0a58 : aa __ __ TAX
0a59 : ad 62 18 LDA $1862 ; (zsm_pos + 1)
0a5c : 69 00 __ ADC #$00
0a5e : 29 03 __ AND #$03
0a60 : 85 4c __ STA T3 + 1 
0a62 : 8a __ __ TXA
0a63 : 18 __ __ CLC
0a64 : 69 61 __ ADC #$61
0a66 : 85 4b __ STA T3 + 0 
0a68 : a9 14 __ LDA #$14
0a6a : 65 4c __ ADC T3 + 1 
0a6c : 85 4c __ STA T3 + 1 
0a6e : b1 4b __ LDA (T3 + 0),y 
0a70 : 85 2e __ STA P1 
0a72 : 20 ef 0a JSR $0aef ; (sfx_put.l1 + 0)
0a75 : ad 61 18 LDA $1861 ; (zsm_pos + 0)
0a78 : 18 __ __ CLC
0a79 : 69 02 __ ADC #$02
0a7b : 8d 61 18 STA $1861 ; (zsm_pos + 0)
0a7e : 90 03 __ BCC $0a83 ; (zsm_play.s1015 + 0)
.s1014:
0a80 : ee 62 18 INC $1862 ; (zsm_pos + 1)
.s1015:
0a83 : e6 50 __ INC T7 + 0 
0a85 : a5 50 __ LDA T7 + 0 
0a87 : c5 4f __ CMP T6 + 0 
0a89 : 90 b1 __ BCC $0a3c ; (zsm_play.l1012 + 0)
0a8b : 4c da 09 JMP $09da ; (zsm_play.l5 + 0)
.s15:
0a8e : c9 80 __ CMP #$80
0a90 : d0 07 __ BNE $0a99 ; (zsm_play.s22 + 0)
.s21:
0a92 : a9 01 __ LDA #$01
0a94 : 8d 0e 10 STA $100e ; (zsm_finished + 0)
0a97 : d0 08 __ BNE $0aa1 ; (zsm_play.s7 + 0)
.s22:
0a99 : 29 7f __ AND #$7f
0a9b : 38 __ __ SEC
0a9c : e9 01 __ SBC #$01
0a9e : 8d 60 14 STA $1460 ; (zsm_delay + 0)
.s7:
0aa1 : a5 49 __ LDA T2 + 0 
0aa3 : 8d 20 9f STA $9f20 
0aa6 : a5 4a __ LDA T2 + 1 
0aa8 : 8d 21 9f STA $9f21 
0aab : a5 48 __ LDA T1 + 0 
0aad : 8d 22 9f STA $9f22 
0ab0 : a5 47 __ LDA T0 + 0 
0ab2 : 8d 25 9f STA $9f25 
.s1001:
0ab5 : 60 __ __ RTS
.s8:
0ab6 : 29 3f __ AND #$3f
0ab8 : 09 c0 __ ORA #$c0
0aba : 8d 20 9f STA $9f20 
0abd : a9 f9 __ LDA #$f9
0abf : 8d 21 9f STA $9f21 
0ac2 : a9 01 __ LDA #$01
0ac4 : 8d 22 9f STA $9f22 
0ac7 : a5 4b __ LDA T3 + 0 
0ac9 : 69 02 __ ADC #$02
0acb : 8d 61 18 STA $1861 ; (zsm_pos + 0)
0ace : 90 01 __ BCC $0ad1 ; (zsm_play.s1017 + 0)
.s1016:
0ad0 : e8 __ __ INX
.s1017:
0ad1 : 8e 62 18 STX $1862 ; (zsm_pos + 1)
0ad4 : 18 __ __ CLC
0ad5 : a9 61 __ LDA #$61
0ad7 : 65 4d __ ADC T4 + 0 
0ad9 : 85 4b __ STA T3 + 0 
0adb : a5 4e __ LDA T4 + 1 
0add : 29 03 __ AND #$03
0adf : 69 14 __ ADC #$14
0ae1 : 85 4c __ STA T3 + 1 
0ae3 : b1 4b __ LDA (T3 + 0),y 
0ae5 : 8d 23 9f STA $9f23 
0ae8 : 4c da 09 JMP $09da ; (zsm_play.l5 + 0)
.s1:
0aeb : ce 60 14 DEC $1460 ; (zsm_delay + 0)
0aee : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
1460 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
1461 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
1861 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0aef : ad 41 9f LDA $9f41 
0af2 : 30 fb __ BMI $0aef ; (sfx_put.l1 + 0)
.s3:
0af4 : a5 2d __ LDA P0 ; (index + 0)
0af6 : 8d 40 9f STA $9f40 
0af9 : ea __ __ NOP
0afa : ea __ __ NOP
0afb : ea __ __ NOP
0afc : ea __ __ NOP
0afd : a5 2e __ LDA P1 ; (data + 0)
0aff : 8d 41 9f STA $9f41 
.s1001:
0b02 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0b03 : a9 93 __ LDA #$93
0b05 : 85 2d __ STA P0 
0b07 : a9 00 __ LDA #$00
0b09 : 85 2e __ STA P1 
0b0b : 20 40 0b JSR $0b40 ; (putch.s0 + 0)
0b0e : a9 11 __ LDA #$11
0b10 : 8d 22 9f STA $9f22 
0b13 : a2 00 __ LDX #$00
.l2:
0b15 : 8a __ __ TXA
0b16 : 18 __ __ CLC
0b17 : 69 b0 __ ADC #$b0
0b19 : 8d 21 9f STA $9f21 
0b1c : a9 00 __ LDA #$00
0b1e : 8d 20 9f STA $9f20 
0b21 : a0 50 __ LDY #$50
.l1003:
0b23 : a9 20 __ LDA #$20
0b25 : 8d 23 9f STA $9f23 
0b28 : a9 01 __ LDA #$01
0b2a : 8d 23 9f STA $9f23 
0b2d : a9 20 __ LDA #$20
0b2f : 8d 24 9f STA $9f24 
0b32 : a9 01 __ LDA #$01
0b34 : 8d 24 9f STA $9f24 
0b37 : 88 __ __ DEY
0b38 : d0 e9 __ BNE $0b23 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0b3a : e8 __ __ INX
0b3b : e0 3c __ CPX #$3c
0b3d : 90 d6 __ BCC $0b15 ; (ClearVERAScreen.l2 + 0)
.s1001:
0b3f : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0b40 : a5 2d __ LDA P0 
0b42 : 20 d2 ff JSR $ffd2 
.s1001:
0b45 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0b46 : a9 00 __ LDA #$00
0b48 : 85 2d __ STA P0 
0b4a : 85 30 __ STA P3 
0b4c : 85 33 __ STA P6 
0b4e : a9 32 __ LDA #$32
0b50 : 85 2e __ STA P1 
0b52 : a9 01 __ LDA #$01
0b54 : 85 2f __ STA P2 
0b56 : a9 02 __ LDA #$02
0b58 : 85 34 __ STA P7 
0b5a : ad 25 9f LDA $9f25 
0b5d : 29 fd __ AND #$fd
0b5f : 8d 25 9f STA $9f25 
0b62 : ad 29 9f LDA $9f29 
0b65 : 09 40 __ ORA #$40
0b67 : 8d 29 9f STA $9f29 
0b6a : a9 0f __ LDA #$0f
0b6c : 85 31 __ STA P4 
0b6e : a9 10 __ LDA #$10
0b70 : 85 32 __ STA P5 
0b72 : 20 52 0c JSR $0c52 ; (vram_putn.s0 + 0)
0b75 : a9 30 __ LDA #$30
0b77 : 85 2e __ STA P1 
0b79 : a9 02 __ LDA #$02
0b7b : 85 34 __ STA P7 
0b7d : a9 0f __ LDA #$0f
0b7f : 85 31 __ STA P4 
0b81 : a9 12 __ LDA #$12
0b83 : 85 32 __ STA P5 
0b85 : 20 52 0c JSR $0c52 ; (vram_putn.s0 + 0)
0b88 : a9 17 __ LDA #$17
0b8a : 85 2d __ STA P0 
0b8c : a9 80 __ LDA #$80
0b8e : 85 2e __ STA P1 
0b90 : a9 09 __ LDA #$09
0b92 : 85 2f __ STA P2 
0b94 : a9 02 __ LDA #$02
0b96 : 85 31 __ STA P4 
0b98 : 85 32 __ STA P5 
0b9a : a9 03 __ LDA #$03
0b9c : 85 33 __ STA P6 
0b9e : a9 01 __ LDA #$01
0ba0 : 85 34 __ STA P7 
0ba2 : 20 8d 0c JSR $0c8d ; (vera_spr_set.s0 + 0)
0ba5 : a9 1a __ LDA #$1a
0ba7 : 85 2e __ STA P1 
0ba9 : a9 01 __ LDA #$01
0bab : 85 2f __ STA P2 
0bad : 85 31 __ STA P4 
0baf : a9 b8 __ LDA #$b8
0bb1 : 85 30 __ STA P3 
0bb3 : 20 f0 0c JSR $0cf0 ; (vera_spr_move.s0 + 0)
0bb6 : a9 00 __ LDA #$00
0bb8 : 85 49 __ STA T3 + 0 
0bba : 85 4a __ STA T3 + 1 
.l2:
0bbc : 85 2d __ STA P0 
0bbe : 18 __ __ CLC
0bbf : 69 02 __ ADC #$02
0bc1 : 85 47 __ STA T2 + 0 
0bc3 : a9 00 __ LDA #$00
0bc5 : 2a __ __ ROL
0bc6 : 85 48 __ STA T2 + 1 
0bc8 : a9 90 __ LDA #$90
0bca : 85 2e __ STA P1 
0bcc : a9 09 __ LDA #$09
0bce : 85 2f __ STA P2 
0bd0 : a9 00 __ LDA #$00
0bd2 : 85 30 __ STA P3 
0bd4 : a9 03 __ LDA #$03
0bd6 : 85 31 __ STA P4 
0bd8 : a9 01 __ LDA #$01
0bda : 85 32 __ STA P5 
0bdc : 20 8d 0c JSR $0c8d ; (vera_spr_set.s0 + 0)
0bdf : a5 49 __ LDA T3 + 0 
0be1 : 85 2e __ STA P1 
0be3 : a5 4a __ LDA T3 + 1 
0be5 : 85 2f __ STA P2 
0be7 : a9 a0 __ LDA #$a0
0be9 : 85 30 __ STA P3 
0beb : a9 01 __ LDA #$01
0bed : 85 31 __ STA P4 
0bef : 20 f0 0c JSR $0cf0 ; (vera_spr_move.s0 + 0)
0bf2 : a9 90 __ LDA #$90
0bf4 : 85 2e __ STA P1 
0bf6 : a9 09 __ LDA #$09
0bf8 : 85 2f __ STA P2 
0bfa : a9 00 __ LDA #$00
0bfc : 85 30 __ STA P3 
0bfe : a9 03 __ LDA #$03
0c00 : 85 31 __ STA P4 
0c02 : e6 2d __ INC P0 
0c04 : 20 8d 0c JSR $0c8d ; (vera_spr_set.s0 + 0)
0c07 : a5 49 __ LDA T3 + 0 
0c09 : 85 2e __ STA P1 
0c0b : a5 4a __ LDA T3 + 1 
0c0d : 85 2f __ STA P2 
0c0f : a9 70 __ LDA #$70
0c11 : 85 30 __ STA P3 
0c13 : a9 01 __ LDA #$01
0c15 : 85 31 __ STA P4 
0c17 : 20 f0 0c JSR $0cf0 ; (vera_spr_move.s0 + 0)
0c1a : a5 48 __ LDA T2 + 1 
0c1c : d0 13 __ BNE $0c31 ; (SetUpSprites.s4 + 0)
.s1004:
0c1e : 18 __ __ CLC
0c1f : a5 2e __ LDA P1 
0c21 : 69 40 __ ADC #$40
0c23 : 85 49 __ STA T3 + 0 
0c25 : a5 2f __ LDA P2 
0c27 : 69 00 __ ADC #$00
0c29 : 85 4a __ STA T3 + 1 
0c2b : a5 47 __ LDA T2 + 0 
0c2d : c9 16 __ CMP #$16
0c2f : 90 8b __ BCC $0bbc ; (SetUpSprites.l2 + 0)
.s4:
0c31 : a9 20 __ LDA #$20
0c33 : 85 37 __ STA P10 
0c35 : 8d fc 9e STA $9efc ; (sstack + 0)
0c38 : a9 fa __ LDA #$fa
0c3a : 8d fd 9e STA $9efd ; (sstack + 1)
0c3d : a9 01 __ LDA #$01
0c3f : 8d fe 9e STA $9efe ; (sstack + 2)
0c42 : a9 00 __ LDA #$00
0c44 : 8d ff 9e STA $9eff ; (sstack + 3)
0c47 : a9 0f __ LDA #$0f
0c49 : 85 35 __ STA P8 
0c4b : a9 14 __ LDA #$14
0c4d : 85 36 __ STA P9 
0c4f : 4c 2c 0d JMP $0d2c ; (SetPaletteColours.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0c52 : ad 25 9f LDA $9f25 
0c55 : 29 fe __ AND #$fe
0c57 : 8d 25 9f STA $9f25 
0c5a : a5 2d __ LDA P0 ; (addr + 0)
0c5c : 8d 20 9f STA $9f20 
0c5f : a5 2e __ LDA P1 ; (addr + 1)
0c61 : 8d 21 9f STA $9f21 
0c64 : a5 2f __ LDA P2 ; (addr + 2)
0c66 : 29 01 __ AND #$01
0c68 : 09 10 __ ORA #$10
0c6a : 8d 22 9f STA $9f22 
0c6d : a5 33 __ LDA P6 ; (size + 0)
0c6f : 05 34 __ ORA P7 ; (size + 1)
0c71 : f0 19 __ BEQ $0c8c ; (vram_putn.s1001 + 0)
.s6:
0c73 : a0 00 __ LDY #$00
0c75 : a6 33 __ LDX P6 ; (size + 0)
0c77 : f0 02 __ BEQ $0c7b ; (vram_putn.l1002 + 0)
.s1005:
0c79 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0c7b : b1 31 __ LDA (P4),y ; (data + 0)
0c7d : 8d 23 9f STA $9f23 
0c80 : c8 __ __ INY
0c81 : d0 02 __ BNE $0c85 ; (vram_putn.s1009 + 0)
.s1008:
0c83 : e6 32 __ INC P5 ; (data + 1)
.s1009:
0c85 : ca __ __ DEX
0c86 : d0 f3 __ BNE $0c7b ; (vram_putn.l1002 + 0)
.s1004:
0c88 : c6 34 __ DEC P7 ; (size + 1)
0c8a : d0 ef __ BNE $0c7b ; (vram_putn.l1002 + 0)
.s1001:
0c8c : 60 __ __ RTS
--------------------------------------------------------------------
ScrollerOutline:
100f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
101f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
102f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
103f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
104f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
105f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
106f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
107f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
108f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
109f : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
10af : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
10bf : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
10cf : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
10df : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
10ef : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
10ff : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
110f : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
111f : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
112f : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
113f : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
114f : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
115f : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
116f : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
117f : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
118f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
119f : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
11af : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
11bf : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
11cf : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
11df : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
11ef : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
11ff : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
120f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
121f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
122f : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
123f : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
124f : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
125f : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
126f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
127f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
128f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
129f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
12af : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
12bf : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
12cf : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
12df : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
12ef : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
12ff : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
130f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
131f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
132f : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
133f : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
134f : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
135f : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
136f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
137f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
138f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
139f : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13af : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
13bf : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13cf : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
13df : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13ef : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13ff : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_set:
.s0:
0c8d : ad 25 9f LDA $9f25 
0c90 : 29 fe __ AND #$fe
0c92 : 8d 25 9f STA $9f25 
0c95 : a5 2d __ LDA P0 ; (spr + 0)
0c97 : 0a __ __ ASL
0c98 : 0a __ __ ASL
0c99 : 85 3b __ STA ACCU + 0 
0c9b : a9 00 __ LDA #$00
0c9d : 2a __ __ ROL
0c9e : 06 3b __ ASL ACCU + 0 
0ca0 : 2a __ __ ROL
0ca1 : 09 fc __ ORA #$fc
0ca3 : 8d 21 9f STA $9f21 
0ca6 : a5 3b __ LDA ACCU + 0 
0ca8 : 8d 20 9f STA $9f20 
0cab : a9 11 __ LDA #$11
0cad : 8d 22 9f STA $9f22 
0cb0 : a5 30 __ LDA P3 ; (mode8 + 0)
0cb2 : f0 02 __ BEQ $0cb6 ; (vera_spr_set.s11 + 0)
.s9:
0cb4 : a9 80 __ LDA #$80
.s11:
0cb6 : 05 2e __ ORA P1 ; (addr32 + 0)
0cb8 : 8d 23 9f STA $9f23 
0cbb : a5 2f __ LDA P2 ; (addr32 + 1)
0cbd : 8d 23 9f STA $9f23 
0cc0 : a9 00 __ LDA #$00
0cc2 : 8d 23 9f STA $9f23 
0cc5 : 8d 23 9f STA $9f23 
0cc8 : 8d 23 9f STA $9f23 
0ccb : 8d 23 9f STA $9f23 
0cce : a5 33 __ LDA P6 ; (z + 0)
0cd0 : 0a __ __ ASL
0cd1 : 0a __ __ ASL
0cd2 : 8d 23 9f STA $9f23 
0cd5 : a5 32 __ LDA P5 ; (h + 0)
0cd7 : 4a __ __ LSR
0cd8 : 85 3c __ STA ACCU + 1 
0cda : a9 00 __ LDA #$00
0cdc : 6a __ __ ROR
0cdd : 66 3c __ ROR ACCU + 1 
0cdf : 6a __ __ ROR
0ce0 : 85 3b __ STA ACCU + 0 
0ce2 : a5 31 __ LDA P4 ; (w + 0)
0ce4 : 0a __ __ ASL
0ce5 : 0a __ __ ASL
0ce6 : 0a __ __ ASL
0ce7 : 0a __ __ ASL
0ce8 : 05 3b __ ORA ACCU + 0 
0cea : 05 34 __ ORA P7 ; (pal + 0)
0cec : 8d 23 9f STA $9f23 
.s1001:
0cef : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0cf0 : ad 25 9f LDA $9f25 
0cf3 : 29 fe __ AND #$fe
0cf5 : 8d 25 9f STA $9f25 
0cf8 : a5 2d __ LDA P0 ; (spr + 0)
0cfa : 0a __ __ ASL
0cfb : 0a __ __ ASL
0cfc : 85 3b __ STA ACCU + 0 
0cfe : a9 00 __ LDA #$00
0d00 : 2a __ __ ROL
0d01 : 06 3b __ ASL ACCU + 0 
0d03 : 2a __ __ ROL
0d04 : aa __ __ TAX
0d05 : a5 3b __ LDA ACCU + 0 
0d07 : 09 02 __ ORA #$02
0d09 : 8d 20 9f STA $9f20 
0d0c : 8a __ __ TXA
0d0d : 09 fc __ ORA #$fc
0d0f : 8d 21 9f STA $9f21 
0d12 : a9 11 __ LDA #$11
0d14 : 8d 22 9f STA $9f22 
0d17 : a5 2e __ LDA P1 ; (x + 0)
0d19 : 8d 23 9f STA $9f23 
0d1c : a5 2f __ LDA P2 ; (x + 1)
0d1e : 8d 23 9f STA $9f23 
0d21 : a5 30 __ LDA P3 ; (y + 0)
0d23 : 8d 23 9f STA $9f23 
0d26 : a5 31 __ LDA P4 ; (y + 1)
0d28 : 8d 23 9f STA $9f23 
.s1001:
0d2b : 60 __ __ RTS
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0d2c : ad fc 9e LDA $9efc ; (sstack + 0)
0d2f : 85 2d __ STA P0 
0d31 : ad fd 9e LDA $9efd ; (sstack + 1)
0d34 : 85 2e __ STA P1 
0d36 : ad fe 9e LDA $9efe ; (sstack + 2)
0d39 : 85 2f __ STA P2 
0d3b : ad ff 9e LDA $9eff ; (sstack + 3)
0d3e : 85 30 __ STA P3 
0d40 : a5 35 __ LDA P8 ; (input + 0)
0d42 : 85 31 __ STA P4 
0d44 : a5 36 __ LDA P9 ; (input + 1)
0d46 : 85 32 __ STA P5 
0d48 : a5 37 __ LDA P10 ; (inputsize + 0)
0d4a : 85 33 __ STA P6 
0d4c : a9 00 __ LDA #$00
0d4e : 85 34 __ STA P7 
0d50 : 4c 52 0c JMP $0c52 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
palette:
140f : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
141f : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0d53 : ad 0e 10 LDA $100e ; (zsm_finished + 0)
.s1001:
0d56 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0d57 : a9 01 __ LDA #$01
0d59 : 8d 0e 10 STA $100e ; (zsm_finished + 0)
0d5c : ad 2f 14 LDA $142f ; (zsm_reading + 0)
0d5f : f0 0a __ BEQ $0d6b ; (zsm_init.s3 + 0)
.s1:
0d61 : a9 02 __ LDA #$02
0d63 : 20 b0 0d JSR $0db0 ; (krnio_close.s1000 + 0)
0d66 : a9 00 __ LDA #$00
0d68 : 8d 2f 14 STA $142f ; (zsm_reading + 0)
.s3:
0d6b : 8d 61 18 STA $1861 ; (zsm_pos + 0)
0d6e : 8d 62 18 STA $1862 ; (zsm_pos + 1)
0d71 : 8d 63 18 STA $1863 ; (zsm_wpos + 0)
0d74 : 8d 64 18 STA $1864 ; (zsm_wpos + 1)
0d77 : 8d 60 14 STA $1460 ; (zsm_delay + 0)
0d7a : a5 30 __ LDA P3 ; (fname + 0)
0d7c : 85 2d __ STA P0 
0d7e : a5 31 __ LDA P4 ; (fname + 1)
0d80 : 85 2e __ STA P1 
0d82 : 20 b8 0d JSR $0db8 ; (krnio_setnam.s0 + 0)
0d85 : a9 02 __ LDA #$02
0d87 : 85 2d __ STA P0 
0d89 : 85 2f __ STA P2 
0d8b : a9 08 __ LDA #$08
0d8d : 85 2e __ STA P1 
0d8f : 20 ce 0d JSR $0dce ; (krnio_open.s0 + 0)
0d92 : a5 3b __ LDA ACCU + 0 
0d94 : f0 19 __ BEQ $0daf ; (zsm_init.s1001 + 0)
.s4:
0d96 : a9 01 __ LDA #$01
0d98 : 8d 2f 14 STA $142f ; (zsm_reading + 0)
0d9b : 20 f6 0d JSR $0df6 ; (zsm_fill.s0 + 0)
0d9e : a9 10 __ LDA #$10
0da0 : 8d 61 18 STA $1861 ; (zsm_pos + 0)
0da3 : a9 00 __ LDA #$00
0da5 : 8d 62 18 STA $1862 ; (zsm_pos + 1)
0da8 : 8d 0e 10 STA $100e ; (zsm_finished + 0)
0dab : a9 01 __ LDA #$01
0dad : 85 3b __ STA ACCU + 0 
.s1001:
0daf : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
142f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0db0 : 85 2d __ STA P0 
.s0:
0db2 : a5 2d __ LDA P0 
0db4 : 20 c3 ff JSR $ffc3 
.s1001:
0db7 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
1863 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0db8 : a5 2d __ LDA P0 
0dba : 05 2e __ ORA P1 
0dbc : f0 08 __ BEQ $0dc6 ; (krnio_setnam.s0 + 14)
0dbe : a0 ff __ LDY #$ff
0dc0 : c8 __ __ INY
0dc1 : b1 2d __ LDA (P0),y 
0dc3 : d0 fb __ BNE $0dc0 ; (krnio_setnam.s0 + 8)
0dc5 : 98 __ __ TYA
0dc6 : a6 2d __ LDX P0 
0dc8 : a4 2e __ LDY P1 
0dca : 20 bd ff JSR $ffbd 
.s1001:
0dcd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0dce : a9 00 __ LDA #$00
0dd0 : a6 2d __ LDX P0 ; (fnum + 0)
0dd2 : 9d 65 18 STA $1865,x ; (krnio_pstatus + 0)
0dd5 : a9 00 __ LDA #$00
0dd7 : 85 3b __ STA ACCU + 0 
0dd9 : 85 3c __ STA ACCU + 1 
0ddb : a5 2d __ LDA P0 ; (fnum + 0)
0ddd : a6 2e __ LDX P1 
0ddf : a4 2f __ LDY P2 
0de1 : 20 ba ff JSR $ffba 
0de4 : 20 c0 ff JSR $ffc0 
0de7 : 90 08 __ BCC $0df1 ; (krnio_open.s0 + 35)
0de9 : a5 2d __ LDA P0 ; (fnum + 0)
0deb : 20 c3 ff JSR $ffc3 
0dee : 4c f5 0d JMP $0df5 ; (krnio_open.s1001 + 0)
0df1 : a9 01 __ LDA #$01
0df3 : 85 3b __ STA ACCU + 0 
.s1001:
0df5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
1865 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0df6 : ad 2f 14 LDA $142f ; (zsm_reading + 0)
0df9 : f0 20 __ BEQ $0e1b ; (zsm_fill.s1 + 0)
.s2:
0dfb : ad 62 18 LDA $1862 ; (zsm_pos + 1)
0dfe : 18 __ __ CLC
0dff : 69 04 __ ADC #$04
0e01 : cd 64 18 CMP $1864 ; (zsm_wpos + 1)
0e04 : d0 0c __ BNE $0e12 ; (zsm_fill.s6 + 0)
.s1006:
0e06 : ad 63 18 LDA $1863 ; (zsm_wpos + 0)
0e09 : cd 61 18 CMP $1861 ; (zsm_pos + 0)
0e0c : d0 04 __ BNE $0e12 ; (zsm_fill.s6 + 0)
.s5:
0e0e : a9 00 __ LDA #$00
0e10 : f0 0b __ BEQ $0e1d ; (zsm_fill.s1008 + 0)
.s6:
0e12 : a9 02 __ LDA #$02
0e14 : 20 9a 0e JSR $0e9a ; (krnio_chkin.s1000 + 0)
0e17 : a5 3b __ LDA ACCU + 0 
0e19 : d0 07 __ BNE $0e22 ; (zsm_fill.s9 + 0)
.s1:
0e1b : a9 ff __ LDA #$ff
.s1008:
0e1d : 85 3b __ STA ACCU + 0 
.s1001:
0e1f : 85 3c __ STA ACCU + 1 
0e21 : 60 __ __ RTS
.s9:
0e22 : a9 00 __ LDA #$00
0e24 : 85 47 __ STA T1 + 0 
0e26 : 85 48 __ STA T1 + 1 
0e28 : ad 62 18 LDA $1862 ; (zsm_pos + 1)
0e2b : 18 __ __ CLC
0e2c : 69 04 __ ADC #$04
0e2e : cd 64 18 CMP $1864 ; (zsm_wpos + 1)
0e31 : d0 08 __ BNE $0e3b ; (zsm_fill.l13 + 0)
.s1002:
0e33 : ad 63 18 LDA $1863 ; (zsm_wpos + 0)
0e36 : cd 61 18 CMP $1861 ; (zsm_pos + 0)
0e39 : f0 49 __ BEQ $0e84 ; (zsm_fill.s37 + 0)
.l13:
0e3b : 20 ac 0e JSR $0eac ; (krnio_chrin.s0 + 0)
0e3e : ad 63 18 LDA $1863 ; (zsm_wpos + 0)
0e41 : aa __ __ TAX
0e42 : 18 __ __ CLC
0e43 : 69 01 __ ADC #$01
0e45 : 8d 63 18 STA $1863 ; (zsm_wpos + 0)
0e48 : ad 64 18 LDA $1864 ; (zsm_wpos + 1)
0e4b : a8 __ __ TAY
0e4c : 69 00 __ ADC #$00
0e4e : 8d 64 18 STA $1864 ; (zsm_wpos + 1)
0e51 : 8a __ __ TXA
0e52 : 18 __ __ CLC
0e53 : 69 61 __ ADC #$61
0e55 : 85 49 __ STA T3 + 0 
0e57 : 98 __ __ TYA
0e58 : 29 03 __ AND #$03
0e5a : 69 14 __ ADC #$14
0e5c : 85 4a __ STA T3 + 1 
0e5e : a5 3b __ LDA ACCU + 0 
0e60 : a0 00 __ LDY #$00
0e62 : 91 49 __ STA (T3 + 0),y 
0e64 : e6 47 __ INC T1 + 0 
0e66 : d0 02 __ BNE $0e6a ; (zsm_fill.s1010 + 0)
.s1009:
0e68 : e6 48 __ INC T1 + 1 
.s1010:
0e6a : 20 b6 0e JSR $0eb6 ; (krnio_status.s0 + 0)
0e6d : a5 3b __ LDA ACCU + 0 
0e6f : d0 0e __ BNE $0e7f ; (zsm_fill.s15 + 0)
.s12:
0e71 : ad 62 18 LDA $1862 ; (zsm_pos + 1)
0e74 : 18 __ __ CLC
0e75 : 69 04 __ ADC #$04
0e77 : cd 64 18 CMP $1864 ; (zsm_wpos + 1)
0e7a : d0 bf __ BNE $0e3b ; (zsm_fill.l13 + 0)
0e7c : 4c 33 0e JMP $0e33 ; (zsm_fill.s1002 + 0)
.s15:
0e7f : a9 00 __ LDA #$00
0e81 : 8d 2f 14 STA $142f ; (zsm_reading + 0)
.s37:
0e84 : 20 c0 0e JSR $0ec0 ; (krnio_clrchn.s0 + 0)
0e87 : ad 2f 14 LDA $142f ; (zsm_reading + 0)
0e8a : d0 05 __ BNE $0e91 ; (zsm_fill.s21 + 0)
.s19:
0e8c : a9 02 __ LDA #$02
0e8e : 20 b0 0d JSR $0db0 ; (krnio_close.s1000 + 0)
.s21:
0e91 : a5 47 __ LDA T1 + 0 
0e93 : 85 3b __ STA ACCU + 0 
0e95 : a5 48 __ LDA T1 + 1 
0e97 : 4c 1f 0e JMP $0e1f ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0e9a : 85 2d __ STA P0 
.s0:
0e9c : a6 2d __ LDX P0 
0e9e : 20 c6 ff JSR $ffc6 
0ea1 : a9 00 __ LDA #$00
0ea3 : 85 3c __ STA ACCU + 1 
0ea5 : b0 02 __ BCS $0ea9 ; (krnio_chkin.s0 + 13)
0ea7 : a9 01 __ LDA #$01
0ea9 : 85 3b __ STA ACCU + 0 
.s1001:
0eab : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0eac : 20 cf ff JSR $ffcf 
0eaf : 85 3b __ STA ACCU + 0 
0eb1 : a9 00 __ LDA #$00
0eb3 : 85 3c __ STA ACCU + 1 
.s1001:
0eb5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0eb6 : 20 b7 ff JSR $ffb7 
0eb9 : 85 3b __ STA ACCU + 0 
0ebb : a9 00 __ LDA #$00
0ebd : 85 3c __ STA ACCU + 1 
.s1001:
0ebf : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0ec0 : 20 cc ff JSR $ffcc 
.s1001:
0ec3 : 60 __ __ RTS
--------------------------------------------------------------------
0ec4 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0ed4 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0ee2 : 20 fe 0e JSR $0efe ; (getchx.s0 + 0)
0ee5 : a5 3c __ LDA ACCU + 1 
0ee7 : d0 10 __ BNE $0ef9 ; (Control.s3 + 0)
.s1005:
0ee9 : a5 3b __ LDA ACCU + 0 
0eeb : c9 20 __ CMP #$20
0eed : d0 0a __ BNE $0ef9 ; (Control.s3 + 0)
.s1:
0eef : a9 00 __ LDA #$00
0ef1 : c5 2e __ CMP P1 ; (playing + 0)
0ef3 : 2a __ __ ROL
0ef4 : 85 2e __ STA P1 ; (playing + 0)
0ef6 : 20 2f 0f JSR $0f2f ; (zsm_irq_play.s0 + 0)
.s3:
0ef9 : a5 2e __ LDA P1 ; (playing + 0)
0efb : 85 3b __ STA ACCU + 0 
.s1001:
0efd : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0efe : 20 08 0f JSR $0f08 ; (getpch + 0)
0f01 : 85 3b __ STA ACCU + 0 
0f03 : a9 00 __ LDA #$00
0f05 : 85 3c __ STA ACCU + 1 
.s1001:
0f07 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0f08 : 20 e4 ff JSR $ffe4 
0f0b : ae 30 14 LDX $1430 ; (giocharmap + 0)
0f0e : e0 01 __ CPX #$01
0f10 : 90 1c __ BCC $0f2e ; (getpch + 38)
0f12 : c9 0d __ CMP #$0d
0f14 : d0 02 __ BNE $0f18 ; (getpch + 16)
0f16 : a9 0a __ LDA #$0a
0f18 : e0 02 __ CPX #$02
0f1a : 90 12 __ BCC $0f2e ; (getpch + 38)
0f1c : c9 41 __ CMP #$41
0f1e : 90 0e __ BCC $0f2e ; (getpch + 38)
0f20 : c9 7b __ CMP #$7b
0f22 : b0 0a __ BCS $0f2e ; (getpch + 38)
0f24 : c9 61 __ CMP #$61
0f26 : b0 04 __ BCS $0f2c ; (getpch + 36)
0f28 : c9 5b __ CMP #$5b
0f2a : b0 02 __ BCS $0f2e ; (getpch + 38)
0f2c : 49 20 __ EOR #$20
0f2e : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
1430 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0f2f : 8d 0d 10 STA $100d ; (zsm_playing + 0)
.s1001:
0f32 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
1431 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
1433 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
1443 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
1453 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
1875 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0f33 : ad 26 9f LDA $9f26 
0f36 : 29 40 __ AND #$40
0f38 : d0 f9 __ BNE $0f33 ; (frame_wait.l1 + 0)
.l4:
0f3a : ad 26 9f LDA $9f26 
0f3d : 29 40 __ AND #$40
0f3f : f0 f9 __ BEQ $0f3a ; (frame_wait.l4 + 0)
.s1001:
0f41 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0f42 : 38 __ __ SEC
0f43 : a9 00 __ LDA #$00
0f45 : e5 3b __ SBC ACCU + 0 
0f47 : 85 3b __ STA ACCU + 0 
0f49 : a9 00 __ LDA #$00
0f4b : e5 3c __ SBC ACCU + 1 
0f4d : 85 3c __ STA ACCU + 1 
0f4f : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0f50 : 38 __ __ SEC
0f51 : a9 00 __ LDA #$00
0f53 : e5 23 __ SBC WORK + 0 
0f55 : 85 23 __ STA WORK + 0 
0f57 : a9 00 __ LDA #$00
0f59 : e5 24 __ SBC WORK + 1 
0f5b : 85 24 __ STA WORK + 1 
0f5d : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
0f5e : a5 3c __ LDA ACCU + 1 
0f60 : d0 31 __ BNE $0f93 ; (divmod + 53)
0f62 : a5 24 __ LDA WORK + 1 
0f64 : d0 1e __ BNE $0f84 ; (divmod + 38)
0f66 : 85 26 __ STA WORK + 3 
0f68 : a2 04 __ LDX #$04
0f6a : 06 3b __ ASL ACCU + 0 
0f6c : 2a __ __ ROL
0f6d : c5 23 __ CMP WORK + 0 
0f6f : 90 02 __ BCC $0f73 ; (divmod + 21)
0f71 : e5 23 __ SBC WORK + 0 
0f73 : 26 3b __ ROL ACCU + 0 
0f75 : 2a __ __ ROL
0f76 : c5 23 __ CMP WORK + 0 
0f78 : 90 02 __ BCC $0f7c ; (divmod + 30)
0f7a : e5 23 __ SBC WORK + 0 
0f7c : 26 3b __ ROL ACCU + 0 
0f7e : ca __ __ DEX
0f7f : d0 eb __ BNE $0f6c ; (divmod + 14)
0f81 : 85 25 __ STA WORK + 2 
0f83 : 60 __ __ RTS
0f84 : a5 3b __ LDA ACCU + 0 
0f86 : 85 25 __ STA WORK + 2 
0f88 : a5 3c __ LDA ACCU + 1 
0f8a : 85 26 __ STA WORK + 3 
0f8c : a9 00 __ LDA #$00
0f8e : 85 3b __ STA ACCU + 0 
0f90 : 85 3c __ STA ACCU + 1 
0f92 : 60 __ __ RTS
0f93 : a5 24 __ LDA WORK + 1 
0f95 : d0 1f __ BNE $0fb6 ; (divmod + 88)
0f97 : a5 23 __ LDA WORK + 0 
0f99 : 30 1b __ BMI $0fb6 ; (divmod + 88)
0f9b : a9 00 __ LDA #$00
0f9d : 85 26 __ STA WORK + 3 
0f9f : a2 10 __ LDX #$10
0fa1 : 06 3b __ ASL ACCU + 0 
0fa3 : 26 3c __ ROL ACCU + 1 
0fa5 : 2a __ __ ROL
0fa6 : c5 23 __ CMP WORK + 0 
0fa8 : 90 02 __ BCC $0fac ; (divmod + 78)
0faa : e5 23 __ SBC WORK + 0 
0fac : 26 3b __ ROL ACCU + 0 
0fae : 26 3c __ ROL ACCU + 1 
0fb0 : ca __ __ DEX
0fb1 : d0 f2 __ BNE $0fa5 ; (divmod + 71)
0fb3 : 85 25 __ STA WORK + 2 
0fb5 : 60 __ __ RTS
0fb6 : a9 00 __ LDA #$00
0fb8 : 85 25 __ STA WORK + 2 
0fba : 85 26 __ STA WORK + 3 
0fbc : 84 22 __ STY $22 
0fbe : a0 10 __ LDY #$10
0fc0 : 18 __ __ CLC
0fc1 : 26 3b __ ROL ACCU + 0 
0fc3 : 26 3c __ ROL ACCU + 1 
0fc5 : 26 25 __ ROL WORK + 2 
0fc7 : 26 26 __ ROL WORK + 3 
0fc9 : 38 __ __ SEC
0fca : a5 25 __ LDA WORK + 2 
0fcc : e5 23 __ SBC WORK + 0 
0fce : aa __ __ TAX
0fcf : a5 26 __ LDA WORK + 3 
0fd1 : e5 24 __ SBC WORK + 1 
0fd3 : 90 04 __ BCC $0fd9 ; (divmod + 123)
0fd5 : 86 25 __ STX WORK + 2 
0fd7 : 85 26 __ STA WORK + 3 
0fd9 : 88 __ __ DEY
0fda : d0 e5 __ BNE $0fc1 ; (divmod + 99)
0fdc : 26 3b __ ROL ACCU + 0 
0fde : 26 3c __ ROL ACCU + 1 
0fe0 : a4 22 __ LDY $22 
0fe2 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
0fe3 : 24 3c __ BIT ACCU + 1 
0fe5 : 10 0d __ BPL $0ff4 ; (mods16 + 17)
0fe7 : 20 42 0f JSR $0f42 ; (negaccu + 0)
0fea : 24 24 __ BIT WORK + 1 
0fec : 10 0d __ BPL $0ffb ; (mods16 + 24)
0fee : 20 50 0f JSR $0f50 ; (negtmp + 0)
0ff1 : 4c 5e 0f JMP $0f5e ; (divmod + 0)
0ff4 : 24 24 __ BIT WORK + 1 
0ff6 : 10 f9 __ BPL $0ff1 ; (mods16 + 14)
0ff8 : 20 50 0f JSR $0f50 ; (negtmp + 0)
0ffb : 20 5e 0f JSR $0f5e ; (divmod + 0)
0ffe : 38 __ __ SEC
0fff : a9 00 __ LDA #$00
1001 : e5 25 __ SBC WORK + 2 
1003 : 85 25 __ STA WORK + 2 
1005 : a9 00 __ LDA #$00
1007 : e5 26 __ SBC WORK + 3 
1009 : 85 26 __ STA WORK + 3 
100b : 60 __ __ RTS
