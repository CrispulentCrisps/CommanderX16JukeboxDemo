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
080e : 8e 57 10 STX $1057 ; (spentry + 0)
0811 : a9 4b __ LDA #$4b
0813 : 85 39 __ STA IP + 0 
0815 : a9 15 __ LDA #$15
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 19 __ LDA #$19
081c : e9 15 __ SBC #$15
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
0830 : a9 63 __ LDA #$63
0832 : e9 4b __ SBC #$4b
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
1057 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 38 09 JSR $0938 ; (zsm_irq_init.s0 + 0)
0883 : 20 06 0b JSR $0b06 ; (ClearVERAScreen.s0 + 0)
0886 : 20 49 0b JSR $0b49 ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9e __ LDA #$9e
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
08b7 : 85 4b __ STA T1 + 0 
.l2:
08b9 : a9 03 __ LDA #$03
08bb : 8d 2c 9f STA $9f2c 
08be : 20 9e 0d JSR $0d9e ; (zsm_check.s0 + 0)
08c1 : 09 00 __ ORA #$00
08c3 : f0 0b __ BEQ $08d0 ; (main.s6 + 0)
.s4:
08c5 : a9 0f __ LDA #$0f
08c7 : 85 30 __ STA P3 
08c9 : a9 0f __ LDA #$0f
08cb : 85 31 __ STA P4 
08cd : 20 a2 0d JSR $0da2 ; (zsm_init.s0 + 0)
.s6:
08d0 : a5 4b __ LDA T1 + 0 
08d2 : 85 2e __ STA P1 
08d4 : 20 2d 0f JSR $0f2d ; (Control.s0 + 0)
08d7 : a5 3b __ LDA ACCU + 0 
08d9 : 85 4b __ STA T1 + 0 
08db : ad fe 14 LDA $14fe ; (FrameCount + 0)
08de : 85 48 __ STA T3 + 0 
08e0 : 85 3b __ STA ACCU + 0 
08e2 : ad ff 14 LDA $14ff ; (FrameCount + 1)
08e5 : 85 3c __ STA ACCU + 1 
08e7 : a9 04 __ LDA #$04
08e9 : 85 23 __ STA WORK + 0 
08eb : a9 00 __ LDA #$00
08ed : 85 24 __ STA WORK + 1 
08ef : 20 2e 10 JSR $102e ; (mods16 + 0)
08f2 : a5 26 __ LDA WORK + 3 
08f4 : d0 16 __ BNE $090c ; (main.s9 + 0)
.s1002:
08f6 : a5 25 __ LDA WORK + 2 
08f8 : c9 01 __ CMP #$01
08fa : d0 10 __ BNE $090c ; (main.s9 + 0)
.s7:
08fc : ae 62 19 LDX $1962 ; (off1 + 0)
08ff : e8 __ __ INX
0900 : 8e 62 19 STX $1962 ; (off1 + 0)
0903 : bd 1f 15 LDA $151f,x ; (palette + 31)
0906 : 38 __ __ SEC
0907 : e9 40 __ SBC #$40
0909 : 8d 23 9f STA $9f23 
.s9:
090c : 06 48 __ ASL T3 + 0 
090e : ad ff 14 LDA $14ff ; (FrameCount + 1)
0911 : 2a __ __ ROL
0912 : 18 __ __ CLC
0913 : 69 ff __ ADC #$ff
0915 : 8d 38 9f STA $9f38 
0918 : a5 48 __ LDA T3 + 0 
091a : 8d 37 9f STA $9f37 
091d : a9 01 __ LDA #$01
091f : 8d 2c 9f STA $9f2c 
0922 : 20 41 0e JSR $0e41 ; (zsm_fill.s0 + 0)
0925 : a9 00 __ LDA #$00
0927 : 8d 2c 9f STA $9f2c 
092a : 20 7e 0f JSR $0f7e ; (frame_wait.l1 + 0)
092d : ee fe 14 INC $14fe ; (FrameCount + 0)
0930 : d0 87 __ BNE $08b9 ; (main.l2 + 0)
.s1003:
0932 : ee ff 14 INC $14ff ; (FrameCount + 1)
0935 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0938 : 78 __ __ SEI
0939 : ad 14 03 LDA $0314 
093c : 8d 4b 15 STA $154b ; (oirq + 0)
093f : ad 15 03 LDA $0315 
0942 : 8d 4c 15 STA $154c ; (oirq + 1)
0945 : a9 51 __ LDA #$51
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : 58 __ __ CLI
.s1001:
0950 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
154b : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0951 : 20 57 09 JSR $0957 ; (irq.s1000 + 0)
0954 : 6c 4b 15 JMP ($154b)
--------------------------------------------------------------------
irq:
.s1000:
0957 : a5 2d __ LDA P0 
0959 : 48 __ __ PHA
095a : a5 2e __ LDA P1 
095c : 48 __ __ PHA
095d : a5 3b __ LDA ACCU + 0 
095f : 48 __ __ PHA
0960 : a5 3c __ LDA ACCU + 1 
0962 : 48 __ __ PHA
0963 : a5 47 __ LDA T0 + 0 
0965 : 48 __ __ PHA
0966 : a5 48 __ LDA $48 
0968 : 48 __ __ PHA
0969 : a5 49 __ LDA $49 
096b : 48 __ __ PHA
096c : a5 4a __ LDA $4a 
096e : 48 __ __ PHA
096f : a5 4b __ LDA $4b 
0971 : 48 __ __ PHA
0972 : a5 4c __ LDA $4c 
0974 : 48 __ __ PHA
0975 : a5 4d __ LDA $4d 
0977 : 48 __ __ PHA
0978 : a5 4e __ LDA $4e 
097a : 48 __ __ PHA
097b : a5 4f __ LDA $4f 
097d : 48 __ __ PHA
097e : a5 50 __ LDA $50 
0980 : 48 __ __ PHA
.s0:
0981 : ad 58 10 LDA $1058 ; (zsm_playing + 0)
0984 : f0 08 __ BEQ $098e ; (irq.s1001 + 0)
.s4:
0986 : ad 59 10 LDA $1059 ; (zsm_finished + 0)
0989 : d0 03 __ BNE $098e ; (irq.s1001 + 0)
.s1:
098b : 20 b9 09 JSR $09b9 ; (zsm_play.s0 + 0)
.s1001:
098e : 68 __ __ PLA
098f : 85 50 __ STA $50 
0991 : 68 __ __ PLA
0992 : 85 4f __ STA $4f 
0994 : 68 __ __ PLA
0995 : 85 4e __ STA $4e 
0997 : 68 __ __ PLA
0998 : 85 4d __ STA $4d 
099a : 68 __ __ PLA
099b : 85 4c __ STA $4c 
099d : 68 __ __ PLA
099e : 85 4b __ STA $4b 
09a0 : 68 __ __ PLA
09a1 : 85 4a __ STA $4a 
09a3 : 68 __ __ PLA
09a4 : 85 49 __ STA $49 
09a6 : 68 __ __ PLA
09a7 : 85 48 __ STA $48 
09a9 : 68 __ __ PLA
09aa : 85 47 __ STA T0 + 0 
09ac : 68 __ __ PLA
09ad : 85 3c __ STA ACCU + 1 
09af : 68 __ __ PLA
09b0 : 85 3b __ STA ACCU + 0 
09b2 : 68 __ __ PLA
09b3 : 85 2e __ STA P1 
09b5 : 68 __ __ PLA
09b6 : 85 2d __ STA P0 
09b8 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
1058 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1059 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b9 : ad 4d 15 LDA $154d ; (zsm_delay + 0)
09bc : f0 03 __ BEQ $09c1 ; (zsm_play.s2 + 0)
09be : 4c ee 0a JMP $0aee ; (zsm_play.s1 + 0)
.s2:
09c1 : ad 25 9f LDA $9f25 
09c4 : 85 47 __ STA T0 + 0 
09c6 : ad 25 9f LDA $9f25 
09c9 : 29 fe __ AND #$fe
09cb : 8d 25 9f STA $9f25 
09ce : ad 20 9f LDA $9f20 
09d1 : 85 49 __ STA T2 + 0 
09d3 : ad 21 9f LDA $9f21 
09d6 : 85 4a __ STA T2 + 1 
09d8 : ad 22 9f LDA $9f22 
09db : 85 48 __ STA T1 + 0 
.l5:
09dd : ad 4e 19 LDA $194e ; (zsm_pos + 0)
09e0 : 85 4b __ STA T3 + 0 
09e2 : 18 __ __ CLC
09e3 : 69 01 __ ADC #$01
09e5 : 85 4d __ STA T4 + 0 
09e7 : 8d 4e 19 STA $194e ; (zsm_pos + 0)
09ea : ad 4f 19 LDA $194f ; (zsm_pos + 1)
09ed : aa __ __ TAX
09ee : 69 00 __ ADC #$00
09f0 : 85 4e __ STA T4 + 1 
09f2 : 8d 4f 19 STA $194f ; (zsm_pos + 1)
09f5 : 18 __ __ CLC
09f6 : a9 4e __ LDA #$4e
09f8 : 65 4b __ ADC T3 + 0 
09fa : 85 3b __ STA ACCU + 0 
09fc : 8a __ __ TXA
09fd : 29 03 __ AND #$03
09ff : 69 15 __ ADC #$15
0a01 : 85 3c __ STA ACCU + 1 
0a03 : a0 00 __ LDY #$00
0a05 : b1 3b __ LDA (ACCU + 0),y 
0a07 : c9 40 __ CMP #$40
0a09 : b0 03 __ BCS $0a0e ; (zsm_play.s9 + 0)
0a0b : 4c b9 0a JMP $0ab9 ; (zsm_play.s8 + 0)
.s9:
0a0e : d0 22 __ BNE $0a32 ; (zsm_play.s12 + 0)
.s11:
0a10 : 18 __ __ CLC
0a11 : a9 4e __ LDA #$4e
0a13 : 65 4d __ ADC T4 + 0 
0a15 : 85 4b __ STA T3 + 0 
0a17 : a5 4e __ LDA T4 + 1 
0a19 : 29 03 __ AND #$03
0a1b : 69 15 __ ADC #$15
0a1d : 85 4c __ STA T3 + 1 
0a1f : b1 4b __ LDA (T3 + 0),y 
0a21 : 29 3f __ AND #$3f
0a23 : 18 __ __ CLC
0a24 : 65 4d __ ADC T4 + 0 
0a26 : 8d 4e 19 STA $194e ; (zsm_pos + 0)
0a29 : 98 __ __ TYA
0a2a : 65 4e __ ADC T4 + 1 
0a2c : 8d 4f 19 STA $194f ; (zsm_pos + 1)
0a2f : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s12:
0a32 : 09 00 __ ORA #$00
0a34 : 30 5b __ BMI $0a91 ; (zsm_play.s15 + 0)
.s14:
0a36 : 29 3f __ AND #$3f
0a38 : f0 a3 __ BEQ $09dd ; (zsm_play.l5 + 0)
.s26:
0a3a : 84 50 __ STY T7 + 0 
0a3c : 85 4f __ STA T6 + 0 
0a3e : 18 __ __ CLC
.l1012:
0a3f : a9 4e __ LDA #$4e
0a41 : 6d 4e 19 ADC $194e ; (zsm_pos + 0)
0a44 : 85 4d __ STA T4 + 0 
0a46 : ad 4f 19 LDA $194f ; (zsm_pos + 1)
0a49 : 29 03 __ AND #$03
0a4b : 69 15 __ ADC #$15
0a4d : 85 4e __ STA T4 + 1 
0a4f : a0 00 __ LDY #$00
0a51 : b1 4d __ LDA (T4 + 0),y 
0a53 : 85 2d __ STA P0 
0a55 : ad 4e 19 LDA $194e ; (zsm_pos + 0)
0a58 : 18 __ __ CLC
0a59 : 69 01 __ ADC #$01
0a5b : aa __ __ TAX
0a5c : ad 4f 19 LDA $194f ; (zsm_pos + 1)
0a5f : 69 00 __ ADC #$00
0a61 : 29 03 __ AND #$03
0a63 : 85 4c __ STA T3 + 1 
0a65 : 8a __ __ TXA
0a66 : 18 __ __ CLC
0a67 : 69 4e __ ADC #$4e
0a69 : 85 4b __ STA T3 + 0 
0a6b : a9 15 __ LDA #$15
0a6d : 65 4c __ ADC T3 + 1 
0a6f : 85 4c __ STA T3 + 1 
0a71 : b1 4b __ LDA (T3 + 0),y 
0a73 : 85 2e __ STA P1 
0a75 : 20 f2 0a JSR $0af2 ; (sfx_put.l1 + 0)
0a78 : ad 4e 19 LDA $194e ; (zsm_pos + 0)
0a7b : 18 __ __ CLC
0a7c : 69 02 __ ADC #$02
0a7e : 8d 4e 19 STA $194e ; (zsm_pos + 0)
0a81 : 90 03 __ BCC $0a86 ; (zsm_play.s1015 + 0)
.s1014:
0a83 : ee 4f 19 INC $194f ; (zsm_pos + 1)
.s1015:
0a86 : e6 50 __ INC T7 + 0 
0a88 : a5 50 __ LDA T7 + 0 
0a8a : c5 4f __ CMP T6 + 0 
0a8c : 90 b1 __ BCC $0a3f ; (zsm_play.l1012 + 0)
0a8e : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s15:
0a91 : c9 80 __ CMP #$80
0a93 : d0 07 __ BNE $0a9c ; (zsm_play.s22 + 0)
.s21:
0a95 : a9 01 __ LDA #$01
0a97 : 8d 59 10 STA $1059 ; (zsm_finished + 0)
0a9a : d0 08 __ BNE $0aa4 ; (zsm_play.s7 + 0)
.s22:
0a9c : 29 7f __ AND #$7f
0a9e : 38 __ __ SEC
0a9f : e9 01 __ SBC #$01
0aa1 : 8d 4d 15 STA $154d ; (zsm_delay + 0)
.s7:
0aa4 : a5 49 __ LDA T2 + 0 
0aa6 : 8d 20 9f STA $9f20 
0aa9 : a5 4a __ LDA T2 + 1 
0aab : 8d 21 9f STA $9f21 
0aae : a5 48 __ LDA T1 + 0 
0ab0 : 8d 22 9f STA $9f22 
0ab3 : a5 47 __ LDA T0 + 0 
0ab5 : 8d 25 9f STA $9f25 
.s1001:
0ab8 : 60 __ __ RTS
.s8:
0ab9 : 29 3f __ AND #$3f
0abb : 09 c0 __ ORA #$c0
0abd : 8d 20 9f STA $9f20 
0ac0 : a9 f9 __ LDA #$f9
0ac2 : 8d 21 9f STA $9f21 
0ac5 : a9 01 __ LDA #$01
0ac7 : 8d 22 9f STA $9f22 
0aca : a5 4b __ LDA T3 + 0 
0acc : 69 02 __ ADC #$02
0ace : 8d 4e 19 STA $194e ; (zsm_pos + 0)
0ad1 : 90 01 __ BCC $0ad4 ; (zsm_play.s1017 + 0)
.s1016:
0ad3 : e8 __ __ INX
.s1017:
0ad4 : 8e 4f 19 STX $194f ; (zsm_pos + 1)
0ad7 : 18 __ __ CLC
0ad8 : a9 4e __ LDA #$4e
0ada : 65 4d __ ADC T4 + 0 
0adc : 85 4b __ STA T3 + 0 
0ade : a5 4e __ LDA T4 + 1 
0ae0 : 29 03 __ AND #$03
0ae2 : 69 15 __ ADC #$15
0ae4 : 85 4c __ STA T3 + 1 
0ae6 : b1 4b __ LDA (T3 + 0),y 
0ae8 : 8d 23 9f STA $9f23 
0aeb : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s1:
0aee : ce 4d 15 DEC $154d ; (zsm_delay + 0)
0af1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
154d : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
154e : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
194e : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0af2 : ad 41 9f LDA $9f41 
0af5 : 30 fb __ BMI $0af2 ; (sfx_put.l1 + 0)
.s3:
0af7 : a5 2d __ LDA P0 ; (index + 0)
0af9 : 8d 40 9f STA $9f40 
0afc : ea __ __ NOP
0afd : ea __ __ NOP
0afe : ea __ __ NOP
0aff : ea __ __ NOP
0b00 : a5 2e __ LDA P1 ; (data + 0)
0b02 : 8d 41 9f STA $9f41 
.s1001:
0b05 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0b06 : a9 93 __ LDA #$93
0b08 : 85 2d __ STA P0 
0b0a : a9 00 __ LDA #$00
0b0c : 85 2e __ STA P1 
0b0e : 20 43 0b JSR $0b43 ; (putch.s0 + 0)
0b11 : a9 11 __ LDA #$11
0b13 : 8d 22 9f STA $9f22 
0b16 : a2 00 __ LDX #$00
.l2:
0b18 : 8a __ __ TXA
0b19 : 18 __ __ CLC
0b1a : 69 b0 __ ADC #$b0
0b1c : 8d 21 9f STA $9f21 
0b1f : a9 00 __ LDA #$00
0b21 : 8d 20 9f STA $9f20 
0b24 : a0 50 __ LDY #$50
.l1003:
0b26 : a9 20 __ LDA #$20
0b28 : 8d 23 9f STA $9f23 
0b2b : a9 01 __ LDA #$01
0b2d : 8d 23 9f STA $9f23 
0b30 : a9 20 __ LDA #$20
0b32 : 8d 24 9f STA $9f24 
0b35 : a9 01 __ LDA #$01
0b37 : 8d 24 9f STA $9f24 
0b3a : 88 __ __ DEY
0b3b : d0 e9 __ BNE $0b26 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0b3d : e8 __ __ INX
0b3e : e0 3c __ CPX #$3c
0b40 : 90 d6 __ BCC $0b18 ; (ClearVERAScreen.l2 + 0)
.s1001:
0b42 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0b43 : a5 2d __ LDA P0 
0b45 : 20 d2 ff JSR $ffd2 
.s1001:
0b48 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0b49 : a9 00 __ LDA #$00
0b4b : 85 2d __ STA P0 
0b4d : 85 2e __ STA P1 
0b4f : 85 2f __ STA P2 
0b51 : 85 30 __ STA P3 
0b53 : 85 34 __ STA P7 
0b55 : a9 82 __ LDA #$82
0b57 : 85 33 __ STA P6 
0b59 : ad 25 9f LDA $9f25 
0b5c : 29 fd __ AND #$fd
0b5e : 8d 25 9f STA $9f25 
0b61 : ad 29 9f LDA $9f29 
0b64 : 09 70 __ ORA #$70
0b66 : 8d 29 9f STA $9f29 
0b69 : a9 80 __ LDA #$80
0b6b : 8d 2b 9f STA $9f2b 
0b6e : 8d 2a 9f STA $9f2a 
0b71 : a9 11 __ LDA #$11
0b73 : 8d 2d 9f STA $9f2d 
0b76 : a9 00 __ LDA #$00
0b78 : 8d 2f 9f STA $9f2f 
0b7b : 8d 2e 9f STA $9f2e 
0b7e : a9 5a __ LDA #$5a
0b80 : 85 31 __ STA P4 
0b82 : a9 10 __ LDA #$10
0b84 : 85 32 __ STA P5 
0b86 : 20 a6 0c JSR $0ca6 ; (vram_putn.s0 + 0)
0b89 : a9 20 __ LDA #$20
0b8b : 85 37 __ STA P10 
0b8d : 8d fc 9e STA $9efc ; (sstack + 0)
0b90 : a9 fb __ LDA #$fb
0b92 : 8d fd 9e STA $9efd ; (sstack + 1)
0b95 : a9 01 __ LDA #$01
0b97 : 8d fe 9e STA $9efe ; (sstack + 2)
0b9a : a9 00 __ LDA #$00
0b9c : 8d ff 9e STA $9eff ; (sstack + 3)
0b9f : a9 dc __ LDA #$dc
0ba1 : 85 35 __ STA P8 
0ba3 : a9 10 __ LDA #$10
0ba5 : 85 36 __ STA P9 
0ba7 : 20 e1 0c JSR $0ce1 ; (SetPaletteColours.s0 + 0)
0baa : a9 00 __ LDA #$00
0bac : 85 2d __ STA P0 
0bae : 85 30 __ STA P3 
0bb0 : 85 33 __ STA P6 
0bb2 : a9 32 __ LDA #$32
0bb4 : 85 2e __ STA P1 
0bb6 : a9 01 __ LDA #$01
0bb8 : 85 2f __ STA P2 
0bba : a9 02 __ LDA #$02
0bbc : 85 34 __ STA P7 
0bbe : a9 fc __ LDA #$fc
0bc0 : 85 31 __ STA P4 
0bc2 : a9 10 __ LDA #$10
0bc4 : 85 32 __ STA P5 
0bc6 : 20 a6 0c JSR $0ca6 ; (vram_putn.s0 + 0)
0bc9 : a9 30 __ LDA #$30
0bcb : 85 2e __ STA P1 
0bcd : a9 02 __ LDA #$02
0bcf : 85 34 __ STA P7 
0bd1 : a9 fc __ LDA #$fc
0bd3 : 85 31 __ STA P4 
0bd5 : a9 12 __ LDA #$12
0bd7 : 85 32 __ STA P5 
0bd9 : 20 a6 0c JSR $0ca6 ; (vram_putn.s0 + 0)
0bdc : a9 17 __ LDA #$17
0bde : 85 2d __ STA P0 
0be0 : a9 80 __ LDA #$80
0be2 : 85 2e __ STA P1 
0be4 : a9 09 __ LDA #$09
0be6 : 85 2f __ STA P2 
0be8 : a9 02 __ LDA #$02
0bea : 85 31 __ STA P4 
0bec : 85 32 __ STA P5 
0bee : a9 03 __ LDA #$03
0bf0 : 85 33 __ STA P6 
0bf2 : a9 01 __ LDA #$01
0bf4 : 85 34 __ STA P7 
0bf6 : 20 08 0d JSR $0d08 ; (vera_spr_set.s0 + 0)
0bf9 : a9 1a __ LDA #$1a
0bfb : 85 2e __ STA P1 
0bfd : a9 01 __ LDA #$01
0bff : 85 2f __ STA P2 
0c01 : 85 31 __ STA P4 
0c03 : a9 b8 __ LDA #$b8
0c05 : 85 30 __ STA P3 
0c07 : 20 65 0d JSR $0d65 ; (vera_spr_move.s0 + 0)
0c0a : a9 00 __ LDA #$00
0c0c : 85 49 __ STA T4 + 0 
0c0e : 85 4a __ STA T4 + 1 
.l10:
0c10 : 85 2d __ STA P0 
0c12 : 18 __ __ CLC
0c13 : 69 02 __ ADC #$02
0c15 : 85 47 __ STA T3 + 0 
0c17 : a9 00 __ LDA #$00
0c19 : 2a __ __ ROL
0c1a : 85 48 __ STA T3 + 1 
0c1c : a9 90 __ LDA #$90
0c1e : 85 2e __ STA P1 
0c20 : a9 09 __ LDA #$09
0c22 : 85 2f __ STA P2 
0c24 : a9 00 __ LDA #$00
0c26 : 85 30 __ STA P3 
0c28 : a9 03 __ LDA #$03
0c2a : 85 31 __ STA P4 
0c2c : a9 01 __ LDA #$01
0c2e : 85 32 __ STA P5 
0c30 : 20 08 0d JSR $0d08 ; (vera_spr_set.s0 + 0)
0c33 : a5 49 __ LDA T4 + 0 
0c35 : 85 2e __ STA P1 
0c37 : a5 4a __ LDA T4 + 1 
0c39 : 85 2f __ STA P2 
0c3b : a9 a0 __ LDA #$a0
0c3d : 85 30 __ STA P3 
0c3f : a9 01 __ LDA #$01
0c41 : 85 31 __ STA P4 
0c43 : 20 65 0d JSR $0d65 ; (vera_spr_move.s0 + 0)
0c46 : a9 90 __ LDA #$90
0c48 : 85 2e __ STA P1 
0c4a : a9 09 __ LDA #$09
0c4c : 85 2f __ STA P2 
0c4e : a9 00 __ LDA #$00
0c50 : 85 30 __ STA P3 
0c52 : a9 03 __ LDA #$03
0c54 : 85 31 __ STA P4 
0c56 : e6 2d __ INC P0 
0c58 : 20 08 0d JSR $0d08 ; (vera_spr_set.s0 + 0)
0c5b : a5 49 __ LDA T4 + 0 
0c5d : 85 2e __ STA P1 
0c5f : a5 4a __ LDA T4 + 1 
0c61 : 85 2f __ STA P2 
0c63 : a9 70 __ LDA #$70
0c65 : 85 30 __ STA P3 
0c67 : a9 01 __ LDA #$01
0c69 : 85 31 __ STA P4 
0c6b : 20 65 0d JSR $0d65 ; (vera_spr_move.s0 + 0)
0c6e : a5 48 __ LDA T3 + 1 
0c70 : d0 13 __ BNE $0c85 ; (SetUpSprites.s12 + 0)
.s1004:
0c72 : 18 __ __ CLC
0c73 : a5 2e __ LDA P1 
0c75 : 69 40 __ ADC #$40
0c77 : 85 49 __ STA T4 + 0 
0c79 : a5 2f __ LDA P2 
0c7b : 69 00 __ ADC #$00
0c7d : 85 4a __ STA T4 + 1 
0c7f : a5 47 __ LDA T3 + 0 
0c81 : c9 16 __ CMP #$16
0c83 : 90 8b __ BCC $0c10 ; (SetUpSprites.l10 + 0)
.s12:
0c85 : a9 20 __ LDA #$20
0c87 : 85 37 __ STA P10 
0c89 : 8d fc 9e STA $9efc ; (sstack + 0)
0c8c : a9 fa __ LDA #$fa
0c8e : 8d fd 9e STA $9efd ; (sstack + 1)
0c91 : a9 01 __ LDA #$01
0c93 : 8d fe 9e STA $9efe ; (sstack + 2)
0c96 : a9 00 __ LDA #$00
0c98 : 8d ff 9e STA $9eff ; (sstack + 3)
0c9b : a9 00 __ LDA #$00
0c9d : 85 35 __ STA P8 
0c9f : a9 15 __ LDA #$15
0ca1 : 85 36 __ STA P9 
0ca3 : 4c e1 0c JMP $0ce1 ; (SetPaletteColours.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0ca6 : ad 25 9f LDA $9f25 
0ca9 : 29 fe __ AND #$fe
0cab : 8d 25 9f STA $9f25 
0cae : a5 2d __ LDA P0 ; (addr + 0)
0cb0 : 8d 20 9f STA $9f20 
0cb3 : a5 2e __ LDA P1 ; (addr + 1)
0cb5 : 8d 21 9f STA $9f21 
0cb8 : a5 2f __ LDA P2 ; (addr + 2)
0cba : 29 01 __ AND #$01
0cbc : 09 10 __ ORA #$10
0cbe : 8d 22 9f STA $9f22 
0cc1 : a5 33 __ LDA P6 ; (size + 0)
0cc3 : 05 34 __ ORA P7 ; (size + 1)
0cc5 : f0 19 __ BEQ $0ce0 ; (vram_putn.s1001 + 0)
.s6:
0cc7 : a0 00 __ LDY #$00
0cc9 : a6 33 __ LDX P6 ; (size + 0)
0ccb : f0 02 __ BEQ $0ccf ; (vram_putn.l1002 + 0)
.s1005:
0ccd : e6 34 __ INC P7 ; (size + 1)
.l1002:
0ccf : b1 31 __ LDA (P4),y ; (data + 0)
0cd1 : 8d 23 9f STA $9f23 
0cd4 : c8 __ __ INY
0cd5 : d0 02 __ BNE $0cd9 ; (vram_putn.s1009 + 0)
.s1008:
0cd7 : e6 32 __ INC P5 ; (data + 1)
.s1009:
0cd9 : ca __ __ DEX
0cda : d0 f3 __ BNE $0ccf ; (vram_putn.l1002 + 0)
.s1004:
0cdc : c6 34 __ DEC P7 ; (size + 1)
0cde : d0 ef __ BNE $0ccf ; (vram_putn.l1002 + 0)
.s1001:
0ce0 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
105a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
106a : __ __ __ BYT 00 00 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : ..UUUUUUUUUUUUUU
107a : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
108a : __ __ __ BYT 55 55 aa aa aa aa aa aa aa aa aa aa aa aa aa aa : UU..............
109a : __ __ __ BYT aa aa 00 00 00 0c 03 00 00 00 30 00 00 00 00 30 : ..........0....0
10aa : __ __ __ BYT 00 00 55 55 75 75 55 55 55 55 55 55 75 55 55 5d : ..UUuuUUUUUUuUU]
10ba : __ __ __ BYT 55 55 d5 55 55 55 55 75 55 55 55 55 55 55 5d 75 : UU.UUUUuUUUUUU]u
10ca : __ __ __ BYT 55 55 aa aa ba aa aa aa aa ba aa aa aa aa ba aa : UU..............
10da : __ __ __ BYT aa ae                                           : ..
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0ce1 : ad fc 9e LDA $9efc ; (sstack + 0)
0ce4 : 85 2d __ STA P0 
0ce6 : ad fd 9e LDA $9efd ; (sstack + 1)
0ce9 : 85 2e __ STA P1 
0ceb : ad fe 9e LDA $9efe ; (sstack + 2)
0cee : 85 2f __ STA P2 
0cf0 : ad ff 9e LDA $9eff ; (sstack + 3)
0cf3 : 85 30 __ STA P3 
0cf5 : a5 35 __ LDA P8 ; (input + 0)
0cf7 : 85 31 __ STA P4 
0cf9 : a5 36 __ LDA P9 ; (input + 1)
0cfb : 85 32 __ STA P5 
0cfd : a5 37 __ LDA P10 ; (inputsize + 0)
0cff : 85 33 __ STA P6 
0d01 : a9 00 __ LDA #$00
0d03 : 85 34 __ STA P7 
0d05 : 4c a6 0c JMP $0ca6 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
10dc : __ __ __ BYT 00 00 88 02 44 0c 11 ee aa 0a 88 08 66 06 44 04 : ....D.......f.D.
10ec : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
ScrollerOutline:
10fc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
110c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
111c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
112c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
113c : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
114c : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
115c : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
116c : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
117c : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
118c : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
119c : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
11ac : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
11bc : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
11cc : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
11dc : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
11ec : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
11fc : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
120c : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
121c : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
122c : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
123c : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
124c : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
125c : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
126c : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
127c : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
128c : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
129c : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
12ac : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
12bc : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
12cc : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
12dc : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
12ec : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
12fc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
130c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
131c : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
132c : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
133c : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
134c : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
135c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
136c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
137c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
138c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
139c : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13ac : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13bc : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13cc : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13dc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13ec : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13fc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
140c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
141c : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
142c : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
143c : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
144c : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
145c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
146c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
147c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
148c : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
149c : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
14ac : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14bc : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
14cc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14dc : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14ec : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_set:
.s0:
0d08 : ad 25 9f LDA $9f25 
0d0b : 29 fe __ AND #$fe
0d0d : 8d 25 9f STA $9f25 
0d10 : a5 2d __ LDA P0 ; (spr + 0)
0d12 : 0a __ __ ASL
0d13 : 0a __ __ ASL
0d14 : 85 3b __ STA ACCU + 0 
0d16 : a9 3f __ LDA #$3f
0d18 : 2a __ __ ROL
0d19 : 06 3b __ ASL ACCU + 0 
0d1b : 2a __ __ ROL
0d1c : 8d 21 9f STA $9f21 
0d1f : a5 3b __ LDA ACCU + 0 
0d21 : 8d 20 9f STA $9f20 
0d24 : a9 11 __ LDA #$11
0d26 : 8d 22 9f STA $9f22 
0d29 : a5 30 __ LDA P3 ; (mode8 + 0)
0d2b : f0 02 __ BEQ $0d2f ; (vera_spr_set.s11 + 0)
.s9:
0d2d : a9 80 __ LDA #$80
.s11:
0d2f : 05 2f __ ORA P2 ; (addr32 + 1)
0d31 : a6 2e __ LDX P1 ; (addr32 + 0)
0d33 : 8e 23 9f STX $9f23 
0d36 : 8d 23 9f STA $9f23 
0d39 : a9 00 __ LDA #$00
0d3b : 8d 23 9f STA $9f23 
0d3e : 8d 23 9f STA $9f23 
0d41 : 8d 23 9f STA $9f23 
0d44 : 8d 23 9f STA $9f23 
0d47 : a5 33 __ LDA P6 ; (z + 0)
0d49 : 0a __ __ ASL
0d4a : 0a __ __ ASL
0d4b : 8d 23 9f STA $9f23 
0d4e : a5 32 __ LDA P5 ; (h + 0)
0d50 : 4a __ __ LSR
0d51 : 6a __ __ ROR
0d52 : 29 80 __ AND #$80
0d54 : 6a __ __ ROR
0d55 : 85 3b __ STA ACCU + 0 
0d57 : a5 31 __ LDA P4 ; (w + 0)
0d59 : 0a __ __ ASL
0d5a : 0a __ __ ASL
0d5b : 0a __ __ ASL
0d5c : 0a __ __ ASL
0d5d : 05 3b __ ORA ACCU + 0 
0d5f : 05 34 __ ORA P7 ; (pal + 0)
0d61 : 8d 23 9f STA $9f23 
.s1001:
0d64 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0d65 : ad 25 9f LDA $9f25 
0d68 : 29 fe __ AND #$fe
0d6a : 8d 25 9f STA $9f25 
0d6d : a5 2d __ LDA P0 ; (spr + 0)
0d6f : 0a __ __ ASL
0d70 : 0a __ __ ASL
0d71 : 85 3b __ STA ACCU + 0 
0d73 : a9 3f __ LDA #$3f
0d75 : 2a __ __ ROL
0d76 : 06 3b __ ASL ACCU + 0 
0d78 : 2a __ __ ROL
0d79 : aa __ __ TAX
0d7a : a5 3b __ LDA ACCU + 0 
0d7c : 09 02 __ ORA #$02
0d7e : 8d 20 9f STA $9f20 
0d81 : 8e 21 9f STX $9f21 
0d84 : a9 11 __ LDA #$11
0d86 : 8d 22 9f STA $9f22 
0d89 : a5 2e __ LDA P1 ; (x + 0)
0d8b : 8d 23 9f STA $9f23 
0d8e : a5 2f __ LDA P2 ; (x + 1)
0d90 : 8d 23 9f STA $9f23 
0d93 : a5 30 __ LDA P3 ; (y + 0)
0d95 : 8d 23 9f STA $9f23 
0d98 : a5 31 __ LDA P4 ; (y + 1)
0d9a : 8d 23 9f STA $9f23 
.s1001:
0d9d : 60 __ __ RTS
--------------------------------------------------------------------
palette:
1500 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
1510 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0d9e : ad 59 10 LDA $1059 ; (zsm_finished + 0)
.s1001:
0da1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0da2 : a9 01 __ LDA #$01
0da4 : 8d 59 10 STA $1059 ; (zsm_finished + 0)
0da7 : ad fc 14 LDA $14fc ; (zsm_reading + 0)
0daa : f0 0a __ BEQ $0db6 ; (zsm_init.s3 + 0)
.s1:
0dac : a9 02 __ LDA #$02
0dae : 20 fb 0d JSR $0dfb ; (krnio_close.s1000 + 0)
0db1 : a9 00 __ LDA #$00
0db3 : 8d fc 14 STA $14fc ; (zsm_reading + 0)
.s3:
0db6 : 8d 4e 19 STA $194e ; (zsm_pos + 0)
0db9 : 8d 4f 19 STA $194f ; (zsm_pos + 1)
0dbc : 8d 50 19 STA $1950 ; (zsm_wpos + 0)
0dbf : 8d 51 19 STA $1951 ; (zsm_wpos + 1)
0dc2 : 8d 4d 15 STA $154d ; (zsm_delay + 0)
0dc5 : a5 30 __ LDA P3 ; (fname + 0)
0dc7 : 85 2d __ STA P0 
0dc9 : a5 31 __ LDA P4 ; (fname + 1)
0dcb : 85 2e __ STA P1 
0dcd : 20 03 0e JSR $0e03 ; (krnio_setnam.s0 + 0)
0dd0 : a9 02 __ LDA #$02
0dd2 : 85 2d __ STA P0 
0dd4 : 85 2f __ STA P2 
0dd6 : a9 08 __ LDA #$08
0dd8 : 85 2e __ STA P1 
0dda : 20 19 0e JSR $0e19 ; (krnio_open.s0 + 0)
0ddd : a5 3b __ LDA ACCU + 0 
0ddf : f0 19 __ BEQ $0dfa ; (zsm_init.s1001 + 0)
.s4:
0de1 : a9 01 __ LDA #$01
0de3 : 8d fc 14 STA $14fc ; (zsm_reading + 0)
0de6 : 20 41 0e JSR $0e41 ; (zsm_fill.s0 + 0)
0de9 : a9 10 __ LDA #$10
0deb : 8d 4e 19 STA $194e ; (zsm_pos + 0)
0dee : a9 00 __ LDA #$00
0df0 : 8d 4f 19 STA $194f ; (zsm_pos + 1)
0df3 : 8d 59 10 STA $1059 ; (zsm_finished + 0)
0df6 : a9 01 __ LDA #$01
0df8 : 85 3b __ STA ACCU + 0 
.s1001:
0dfa : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
14fc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0dfb : 85 2d __ STA P0 
.s0:
0dfd : a5 2d __ LDA P0 
0dff : 20 c3 ff JSR $ffc3 
.s1001:
0e02 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
1950 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0e03 : a5 2d __ LDA P0 
0e05 : 05 2e __ ORA P1 
0e07 : f0 08 __ BEQ $0e11 ; (krnio_setnam.s0 + 14)
0e09 : a0 ff __ LDY #$ff
0e0b : c8 __ __ INY
0e0c : b1 2d __ LDA (P0),y 
0e0e : d0 fb __ BNE $0e0b ; (krnio_setnam.s0 + 8)
0e10 : 98 __ __ TYA
0e11 : a6 2d __ LDX P0 
0e13 : a4 2e __ LDY P1 
0e15 : 20 bd ff JSR $ffbd 
.s1001:
0e18 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0e19 : a9 00 __ LDA #$00
0e1b : a6 2d __ LDX P0 ; (fnum + 0)
0e1d : 9d 52 19 STA $1952,x ; (krnio_pstatus + 0)
0e20 : a9 00 __ LDA #$00
0e22 : 85 3b __ STA ACCU + 0 
0e24 : 85 3c __ STA ACCU + 1 
0e26 : a5 2d __ LDA P0 ; (fnum + 0)
0e28 : a6 2e __ LDX P1 
0e2a : a4 2f __ LDY P2 
0e2c : 20 ba ff JSR $ffba 
0e2f : 20 c0 ff JSR $ffc0 
0e32 : 90 08 __ BCC $0e3c ; (krnio_open.s0 + 35)
0e34 : a5 2d __ LDA P0 ; (fnum + 0)
0e36 : 20 c3 ff JSR $ffc3 
0e39 : 4c 40 0e JMP $0e40 ; (krnio_open.s1001 + 0)
0e3c : a9 01 __ LDA #$01
0e3e : 85 3b __ STA ACCU + 0 
.s1001:
0e40 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
1952 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0e41 : ad fc 14 LDA $14fc ; (zsm_reading + 0)
0e44 : f0 20 __ BEQ $0e66 ; (zsm_fill.s1 + 0)
.s2:
0e46 : ad 4f 19 LDA $194f ; (zsm_pos + 1)
0e49 : 18 __ __ CLC
0e4a : 69 04 __ ADC #$04
0e4c : cd 51 19 CMP $1951 ; (zsm_wpos + 1)
0e4f : d0 0c __ BNE $0e5d ; (zsm_fill.s6 + 0)
.s1006:
0e51 : ad 50 19 LDA $1950 ; (zsm_wpos + 0)
0e54 : cd 4e 19 CMP $194e ; (zsm_pos + 0)
0e57 : d0 04 __ BNE $0e5d ; (zsm_fill.s6 + 0)
.s5:
0e59 : a9 00 __ LDA #$00
0e5b : f0 0b __ BEQ $0e68 ; (zsm_fill.s1008 + 0)
.s6:
0e5d : a9 02 __ LDA #$02
0e5f : 20 e5 0e JSR $0ee5 ; (krnio_chkin.s1000 + 0)
0e62 : a5 3b __ LDA ACCU + 0 
0e64 : d0 07 __ BNE $0e6d ; (zsm_fill.s9 + 0)
.s1:
0e66 : a9 ff __ LDA #$ff
.s1008:
0e68 : 85 3b __ STA ACCU + 0 
.s1001:
0e6a : 85 3c __ STA ACCU + 1 
0e6c : 60 __ __ RTS
.s9:
0e6d : a9 00 __ LDA #$00
0e6f : 85 47 __ STA T1 + 0 
0e71 : 85 48 __ STA T1 + 1 
0e73 : ad 4f 19 LDA $194f ; (zsm_pos + 1)
0e76 : 18 __ __ CLC
0e77 : 69 04 __ ADC #$04
0e79 : cd 51 19 CMP $1951 ; (zsm_wpos + 1)
0e7c : d0 08 __ BNE $0e86 ; (zsm_fill.l13 + 0)
.s1002:
0e7e : ad 50 19 LDA $1950 ; (zsm_wpos + 0)
0e81 : cd 4e 19 CMP $194e ; (zsm_pos + 0)
0e84 : f0 49 __ BEQ $0ecf ; (zsm_fill.s37 + 0)
.l13:
0e86 : 20 f7 0e JSR $0ef7 ; (krnio_chrin.s0 + 0)
0e89 : ad 50 19 LDA $1950 ; (zsm_wpos + 0)
0e8c : aa __ __ TAX
0e8d : 18 __ __ CLC
0e8e : 69 01 __ ADC #$01
0e90 : 8d 50 19 STA $1950 ; (zsm_wpos + 0)
0e93 : ad 51 19 LDA $1951 ; (zsm_wpos + 1)
0e96 : a8 __ __ TAY
0e97 : 69 00 __ ADC #$00
0e99 : 8d 51 19 STA $1951 ; (zsm_wpos + 1)
0e9c : 8a __ __ TXA
0e9d : 18 __ __ CLC
0e9e : 69 4e __ ADC #$4e
0ea0 : 85 49 __ STA T3 + 0 
0ea2 : 98 __ __ TYA
0ea3 : 29 03 __ AND #$03
0ea5 : 69 15 __ ADC #$15
0ea7 : 85 4a __ STA T3 + 1 
0ea9 : a5 3b __ LDA ACCU + 0 
0eab : a0 00 __ LDY #$00
0ead : 91 49 __ STA (T3 + 0),y 
0eaf : e6 47 __ INC T1 + 0 
0eb1 : d0 02 __ BNE $0eb5 ; (zsm_fill.s1010 + 0)
.s1009:
0eb3 : e6 48 __ INC T1 + 1 
.s1010:
0eb5 : 20 01 0f JSR $0f01 ; (krnio_status.s0 + 0)
0eb8 : a5 3b __ LDA ACCU + 0 
0eba : d0 0e __ BNE $0eca ; (zsm_fill.s15 + 0)
.s12:
0ebc : ad 4f 19 LDA $194f ; (zsm_pos + 1)
0ebf : 18 __ __ CLC
0ec0 : 69 04 __ ADC #$04
0ec2 : cd 51 19 CMP $1951 ; (zsm_wpos + 1)
0ec5 : d0 bf __ BNE $0e86 ; (zsm_fill.l13 + 0)
0ec7 : 4c 7e 0e JMP $0e7e ; (zsm_fill.s1002 + 0)
.s15:
0eca : a9 00 __ LDA #$00
0ecc : 8d fc 14 STA $14fc ; (zsm_reading + 0)
.s37:
0ecf : 20 0b 0f JSR $0f0b ; (krnio_clrchn.s0 + 0)
0ed2 : ad fc 14 LDA $14fc ; (zsm_reading + 0)
0ed5 : d0 05 __ BNE $0edc ; (zsm_fill.s21 + 0)
.s19:
0ed7 : a9 02 __ LDA #$02
0ed9 : 20 fb 0d JSR $0dfb ; (krnio_close.s1000 + 0)
.s21:
0edc : a5 47 __ LDA T1 + 0 
0ede : 85 3b __ STA ACCU + 0 
0ee0 : a5 48 __ LDA T1 + 1 
0ee2 : 4c 6a 0e JMP $0e6a ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0ee5 : 85 2d __ STA P0 
.s0:
0ee7 : a6 2d __ LDX P0 
0ee9 : 20 c6 ff JSR $ffc6 
0eec : a9 00 __ LDA #$00
0eee : 85 3c __ STA ACCU + 1 
0ef0 : b0 02 __ BCS $0ef4 ; (krnio_chkin.s0 + 13)
0ef2 : a9 01 __ LDA #$01
0ef4 : 85 3b __ STA ACCU + 0 
.s1001:
0ef6 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0ef7 : 20 cf ff JSR $ffcf 
0efa : 85 3b __ STA ACCU + 0 
0efc : a9 00 __ LDA #$00
0efe : 85 3c __ STA ACCU + 1 
.s1001:
0f00 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0f01 : 20 b7 ff JSR $ffb7 
0f04 : 85 3b __ STA ACCU + 0 
0f06 : a9 00 __ LDA #$00
0f08 : 85 3c __ STA ACCU + 1 
.s1001:
0f0a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0f0b : 20 cc ff JSR $ffcc 
.s1001:
0f0e : 60 __ __ RTS
--------------------------------------------------------------------
0f0f : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0f1f : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0f2d : 20 49 0f JSR $0f49 ; (getchx.s0 + 0)
0f30 : a5 3c __ LDA ACCU + 1 
0f32 : d0 10 __ BNE $0f44 ; (Control.s3 + 0)
.s1005:
0f34 : a5 3b __ LDA ACCU + 0 
0f36 : c9 20 __ CMP #$20
0f38 : d0 0a __ BNE $0f44 ; (Control.s3 + 0)
.s1:
0f3a : a9 00 __ LDA #$00
0f3c : c5 2e __ CMP P1 ; (playing + 0)
0f3e : 2a __ __ ROL
0f3f : 85 2e __ STA P1 ; (playing + 0)
0f41 : 20 7a 0f JSR $0f7a ; (zsm_irq_play.s0 + 0)
.s3:
0f44 : a5 2e __ LDA P1 ; (playing + 0)
0f46 : 85 3b __ STA ACCU + 0 
.s1001:
0f48 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0f49 : 20 53 0f JSR $0f53 ; (getpch + 0)
0f4c : 85 3b __ STA ACCU + 0 
0f4e : a9 00 __ LDA #$00
0f50 : 85 3c __ STA ACCU + 1 
.s1001:
0f52 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0f53 : 20 e4 ff JSR $ffe4 
0f56 : ae fd 14 LDX $14fd ; (giocharmap + 0)
0f59 : e0 01 __ CPX #$01
0f5b : 90 1c __ BCC $0f79 ; (getpch + 38)
0f5d : c9 0d __ CMP #$0d
0f5f : d0 02 __ BNE $0f63 ; (getpch + 16)
0f61 : a9 0a __ LDA #$0a
0f63 : e0 02 __ CPX #$02
0f65 : 90 12 __ BCC $0f79 ; (getpch + 38)
0f67 : c9 41 __ CMP #$41
0f69 : 90 0e __ BCC $0f79 ; (getpch + 38)
0f6b : c9 7b __ CMP #$7b
0f6d : b0 0a __ BCS $0f79 ; (getpch + 38)
0f6f : c9 61 __ CMP #$61
0f71 : b0 04 __ BCS $0f77 ; (getpch + 36)
0f73 : c9 5b __ CMP #$5b
0f75 : b0 02 __ BCS $0f79 ; (getpch + 38)
0f77 : 49 20 __ EOR #$20
0f79 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
14fd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0f7a : 8d 58 10 STA $1058 ; (zsm_playing + 0)
.s1001:
0f7d : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
14fe : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
1520 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
1530 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
1540 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
1962 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0f7e : ad 26 9f LDA $9f26 
0f81 : 29 40 __ AND #$40
0f83 : d0 f9 __ BNE $0f7e ; (frame_wait.l1 + 0)
.l4:
0f85 : ad 26 9f LDA $9f26 
0f88 : 29 40 __ AND #$40
0f8a : f0 f9 __ BEQ $0f85 ; (frame_wait.l4 + 0)
.s1001:
0f8c : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0f8d : 38 __ __ SEC
0f8e : a9 00 __ LDA #$00
0f90 : e5 3b __ SBC ACCU + 0 
0f92 : 85 3b __ STA ACCU + 0 
0f94 : a9 00 __ LDA #$00
0f96 : e5 3c __ SBC ACCU + 1 
0f98 : 85 3c __ STA ACCU + 1 
0f9a : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0f9b : 38 __ __ SEC
0f9c : a9 00 __ LDA #$00
0f9e : e5 23 __ SBC WORK + 0 
0fa0 : 85 23 __ STA WORK + 0 
0fa2 : a9 00 __ LDA #$00
0fa4 : e5 24 __ SBC WORK + 1 
0fa6 : 85 24 __ STA WORK + 1 
0fa8 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
0fa9 : a5 3c __ LDA ACCU + 1 
0fab : d0 31 __ BNE $0fde ; (divmod + 53)
0fad : a5 24 __ LDA WORK + 1 
0faf : d0 1e __ BNE $0fcf ; (divmod + 38)
0fb1 : 85 26 __ STA WORK + 3 
0fb3 : a2 04 __ LDX #$04
0fb5 : 06 3b __ ASL ACCU + 0 
0fb7 : 2a __ __ ROL
0fb8 : c5 23 __ CMP WORK + 0 
0fba : 90 02 __ BCC $0fbe ; (divmod + 21)
0fbc : e5 23 __ SBC WORK + 0 
0fbe : 26 3b __ ROL ACCU + 0 
0fc0 : 2a __ __ ROL
0fc1 : c5 23 __ CMP WORK + 0 
0fc3 : 90 02 __ BCC $0fc7 ; (divmod + 30)
0fc5 : e5 23 __ SBC WORK + 0 
0fc7 : 26 3b __ ROL ACCU + 0 
0fc9 : ca __ __ DEX
0fca : d0 eb __ BNE $0fb7 ; (divmod + 14)
0fcc : 85 25 __ STA WORK + 2 
0fce : 60 __ __ RTS
0fcf : a5 3b __ LDA ACCU + 0 
0fd1 : 85 25 __ STA WORK + 2 
0fd3 : a5 3c __ LDA ACCU + 1 
0fd5 : 85 26 __ STA WORK + 3 
0fd7 : a9 00 __ LDA #$00
0fd9 : 85 3b __ STA ACCU + 0 
0fdb : 85 3c __ STA ACCU + 1 
0fdd : 60 __ __ RTS
0fde : a5 24 __ LDA WORK + 1 
0fe0 : d0 1f __ BNE $1001 ; (divmod + 88)
0fe2 : a5 23 __ LDA WORK + 0 
0fe4 : 30 1b __ BMI $1001 ; (divmod + 88)
0fe6 : a9 00 __ LDA #$00
0fe8 : 85 26 __ STA WORK + 3 
0fea : a2 10 __ LDX #$10
0fec : 06 3b __ ASL ACCU + 0 
0fee : 26 3c __ ROL ACCU + 1 
0ff0 : 2a __ __ ROL
0ff1 : c5 23 __ CMP WORK + 0 
0ff3 : 90 02 __ BCC $0ff7 ; (divmod + 78)
0ff5 : e5 23 __ SBC WORK + 0 
0ff7 : 26 3b __ ROL ACCU + 0 
0ff9 : 26 3c __ ROL ACCU + 1 
0ffb : ca __ __ DEX
0ffc : d0 f2 __ BNE $0ff0 ; (divmod + 71)
0ffe : 85 25 __ STA WORK + 2 
1000 : 60 __ __ RTS
1001 : a9 00 __ LDA #$00
1003 : 85 25 __ STA WORK + 2 
1005 : 85 26 __ STA WORK + 3 
1007 : 84 22 __ STY $22 
1009 : a0 10 __ LDY #$10
100b : 18 __ __ CLC
100c : 26 3b __ ROL ACCU + 0 
100e : 26 3c __ ROL ACCU + 1 
1010 : 26 25 __ ROL WORK + 2 
1012 : 26 26 __ ROL WORK + 3 
1014 : 38 __ __ SEC
1015 : a5 25 __ LDA WORK + 2 
1017 : e5 23 __ SBC WORK + 0 
1019 : aa __ __ TAX
101a : a5 26 __ LDA WORK + 3 
101c : e5 24 __ SBC WORK + 1 
101e : 90 04 __ BCC $1024 ; (divmod + 123)
1020 : 86 25 __ STX WORK + 2 
1022 : 85 26 __ STA WORK + 3 
1024 : 88 __ __ DEY
1025 : d0 e5 __ BNE $100c ; (divmod + 99)
1027 : 26 3b __ ROL ACCU + 0 
1029 : 26 3c __ ROL ACCU + 1 
102b : a4 22 __ LDY $22 
102d : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
102e : 24 3c __ BIT ACCU + 1 
1030 : 10 0d __ BPL $103f ; (mods16 + 17)
1032 : 20 8d 0f JSR $0f8d ; (negaccu + 0)
1035 : 24 24 __ BIT WORK + 1 
1037 : 10 0d __ BPL $1046 ; (mods16 + 24)
1039 : 20 9b 0f JSR $0f9b ; (negtmp + 0)
103c : 4c a9 0f JMP $0fa9 ; (divmod + 0)
103f : 24 24 __ BIT WORK + 1 
1041 : 10 f9 __ BPL $103c ; (mods16 + 14)
1043 : 20 9b 0f JSR $0f9b ; (negtmp + 0)
1046 : 20 a9 0f JSR $0fa9 ; (divmod + 0)
1049 : 38 __ __ SEC
104a : a9 00 __ LDA #$00
104c : e5 25 __ SBC WORK + 2 
104e : 85 25 __ STA WORK + 2 
1050 : a9 00 __ LDA #$00
1052 : e5 26 __ SBC WORK + 3 
1054 : 85 26 __ STA WORK + 3 
1056 : 60 __ __ RTS
