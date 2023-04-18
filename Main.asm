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
080e : 8e 84 10 STX $1084 ; (spentry + 0)
0811 : a9 82 __ LDA #$82
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
0830 : a9 92 __ LDA #$92
0832 : e9 82 __ SBC #$82
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
1084 : __ __ __ BYT 00                                              : .
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
08be : 20 cb 0d JSR $0dcb ; (zsm_check.s0 + 0)
08c1 : 09 00 __ ORA #$00
08c3 : f0 0b __ BEQ $08d0 ; (main.s6 + 0)
.s4:
08c5 : a9 3c __ LDA #$3c
08c7 : 85 30 __ STA P3 
08c9 : a9 0f __ LDA #$0f
08cb : 85 31 __ STA P4 
08cd : 20 cf 0d JSR $0dcf ; (zsm_init.s0 + 0)
.s6:
08d0 : a5 4b __ LDA T1 + 0 
08d2 : 85 2e __ STA P1 
08d4 : 20 5a 0f JSR $0f5a ; (Control.s0 + 0)
08d7 : a5 3b __ LDA ACCU + 0 
08d9 : 85 4b __ STA T1 + 0 
08db : ad c9 10 LDA $10c9 ; (FrameCount + 0)
08de : 85 48 __ STA T3 + 0 
08e0 : 85 3b __ STA ACCU + 0 
08e2 : ad ca 10 LDA $10ca ; (FrameCount + 1)
08e5 : 85 3c __ STA ACCU + 1 
08e7 : a9 04 __ LDA #$04
08e9 : 85 23 __ STA WORK + 0 
08eb : a9 00 __ LDA #$00
08ed : 85 24 __ STA WORK + 1 
08ef : 20 5b 10 JSR $105b ; (mods16 + 0)
08f2 : a5 26 __ LDA WORK + 3 
08f4 : d0 16 __ BNE $090c ; (main.s9 + 0)
.s1002:
08f6 : a5 25 __ LDA WORK + 2 
08f8 : c9 01 __ CMP #$01
08fa : d0 10 __ BNE $090c ; (main.s9 + 0)
.s7:
08fc : ae fd 10 LDX $10fd ; (off1 + 0)
08ff : e8 __ __ INX
0900 : 8e fd 10 STX $10fd ; (off1 + 0)
0903 : bd ca 10 LDA $10ca,x ; (FrameCount + 1)
0906 : 38 __ __ SEC
0907 : e9 40 __ SBC #$40
0909 : 8d 23 9f STA $9f23 
.s9:
090c : 06 48 __ ASL T3 + 0 
090e : ad ca 10 LDA $10ca ; (FrameCount + 1)
0911 : 2a __ __ ROL
0912 : 18 __ __ CLC
0913 : 69 ff __ ADC #$ff
0915 : 8d 38 9f STA $9f38 
0918 : a5 48 __ LDA T3 + 0 
091a : 8d 37 9f STA $9f37 
091d : a9 01 __ LDA #$01
091f : 8d 2c 9f STA $9f2c 
0922 : 20 6e 0e JSR $0e6e ; (zsm_fill.s0 + 0)
0925 : a9 00 __ LDA #$00
0927 : 8d 2c 9f STA $9f2c 
092a : 20 ab 0f JSR $0fab ; (frame_wait.l1 + 0)
092d : ee c9 10 INC $10c9 ; (FrameCount + 0)
0930 : d0 87 __ BNE $08b9 ; (main.l2 + 0)
.s1003:
0932 : ee ca 10 INC $10ca ; (FrameCount + 1)
0935 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0938 : 78 __ __ SEI
0939 : ad 14 03 LDA $0314 
093c : 8d f6 10 STA $10f6 ; (oirq + 0)
093f : ad 15 03 LDA $0315 
0942 : 8d f7 10 STA $10f7 ; (oirq + 1)
0945 : a9 51 __ LDA #$51
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : 58 __ __ CLI
.s1001:
0950 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
10f6 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0951 : 20 57 09 JSR $0957 ; (irq.s1000 + 0)
0954 : 6c f6 10 JMP ($10f6)
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
0981 : ad 85 10 LDA $1085 ; (zsm_playing + 0)
0984 : f0 08 __ BEQ $098e ; (irq.s1001 + 0)
.s4:
0986 : ad 86 10 LDA $1086 ; (zsm_finished + 0)
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
1085 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1086 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b9 : ad f8 10 LDA $10f8 ; (zsm_delay + 0)
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
09dd : ad f9 10 LDA $10f9 ; (zsm_pos + 0)
09e0 : 85 4b __ STA T3 + 0 
09e2 : 18 __ __ CLC
09e3 : 69 01 __ ADC #$01
09e5 : 85 4d __ STA T4 + 0 
09e7 : 8d f9 10 STA $10f9 ; (zsm_pos + 0)
09ea : ad fa 10 LDA $10fa ; (zsm_pos + 1)
09ed : aa __ __ TAX
09ee : 69 00 __ ADC #$00
09f0 : 85 4e __ STA T4 + 1 
09f2 : 8d fa 10 STA $10fa ; (zsm_pos + 1)
09f5 : 18 __ __ CLC
09f6 : a9 82 __ LDA #$82
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
0a11 : a9 82 __ LDA #$82
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
0a26 : 8d f9 10 STA $10f9 ; (zsm_pos + 0)
0a29 : 98 __ __ TYA
0a2a : 65 4e __ ADC T4 + 1 
0a2c : 8d fa 10 STA $10fa ; (zsm_pos + 1)
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
0a3f : a9 82 __ LDA #$82
0a41 : 6d f9 10 ADC $10f9 ; (zsm_pos + 0)
0a44 : 85 4d __ STA T4 + 0 
0a46 : ad fa 10 LDA $10fa ; (zsm_pos + 1)
0a49 : 29 03 __ AND #$03
0a4b : 69 15 __ ADC #$15
0a4d : 85 4e __ STA T4 + 1 
0a4f : a0 00 __ LDY #$00
0a51 : b1 4d __ LDA (T4 + 0),y 
0a53 : 85 2d __ STA P0 
0a55 : ad f9 10 LDA $10f9 ; (zsm_pos + 0)
0a58 : 18 __ __ CLC
0a59 : 69 01 __ ADC #$01
0a5b : aa __ __ TAX
0a5c : ad fa 10 LDA $10fa ; (zsm_pos + 1)
0a5f : 69 00 __ ADC #$00
0a61 : 29 03 __ AND #$03
0a63 : 85 4c __ STA T3 + 1 
0a65 : 8a __ __ TXA
0a66 : 18 __ __ CLC
0a67 : 69 82 __ ADC #$82
0a69 : 85 4b __ STA T3 + 0 
0a6b : a9 15 __ LDA #$15
0a6d : 65 4c __ ADC T3 + 1 
0a6f : 85 4c __ STA T3 + 1 
0a71 : b1 4b __ LDA (T3 + 0),y 
0a73 : 85 2e __ STA P1 
0a75 : 20 f2 0a JSR $0af2 ; (sfx_put.l1 + 0)
0a78 : ad f9 10 LDA $10f9 ; (zsm_pos + 0)
0a7b : 18 __ __ CLC
0a7c : 69 02 __ ADC #$02
0a7e : 8d f9 10 STA $10f9 ; (zsm_pos + 0)
0a81 : 90 03 __ BCC $0a86 ; (zsm_play.s1015 + 0)
.s1014:
0a83 : ee fa 10 INC $10fa ; (zsm_pos + 1)
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
0a97 : 8d 86 10 STA $1086 ; (zsm_finished + 0)
0a9a : d0 08 __ BNE $0aa4 ; (zsm_play.s7 + 0)
.s22:
0a9c : 29 7f __ AND #$7f
0a9e : 38 __ __ SEC
0a9f : e9 01 __ SBC #$01
0aa1 : 8d f8 10 STA $10f8 ; (zsm_delay + 0)
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
0ace : 8d f9 10 STA $10f9 ; (zsm_pos + 0)
0ad1 : 90 01 __ BCC $0ad4 ; (zsm_play.s1017 + 0)
.s1016:
0ad3 : e8 __ __ INX
.s1017:
0ad4 : 8e fa 10 STX $10fa ; (zsm_pos + 1)
0ad7 : 18 __ __ CLC
0ad8 : a9 82 __ LDA #$82
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
0aee : ce f8 10 DEC $10f8 ; (zsm_delay + 0)
0af1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
10f8 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
1582 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
10f9 : __ __ __ BSS	2
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
0b24 : a0 78 __ LDY #$78
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
0b7e : a9 f0 __ LDA #$f0
0b80 : 8d 22 9f STA $9f22 
0b83 : a9 00 __ LDA #$00
0b85 : 85 31 __ STA P4 
0b87 : a9 11 __ LDA #$11
0b89 : 85 32 __ STA P5 
0b8b : 20 d3 0c JSR $0cd3 ; (vram_putn.s0 + 0)
0b8e : a2 00 __ LDX #$00
.l2:
0b90 : e0 1f __ CPX #$1f
0b92 : a0 3c __ LDY #$3c
0b94 : 90 03 __ BCC $0b99 ; (SetUpSprites.l9 + 0)
0b96 : 4c c4 0c JMP $0cc4 ; (SetUpSprites.l1008 + 0)
.l9:
0b99 : ad 23 9f LDA $9f23 
0b9c : 8d 23 9f STA $9f23 
0b9f : 88 __ __ DEY
0ba0 : d0 f7 __ BNE $0b99 ; (SetUpSprites.l9 + 0)
.s135:
0ba2 : e8 __ __ INX
0ba3 : e0 50 __ CPX #$50
0ba5 : 90 e9 __ BCC $0b90 ; (SetUpSprites.l2 + 0)
.s4:
0ba7 : a9 20 __ LDA #$20
0ba9 : 85 37 __ STA P10 
0bab : 8d fc 9e STA $9efc ; (sstack + 0)
0bae : a9 fb __ LDA #$fb
0bb0 : 8d fd 9e STA $9efd ; (sstack + 1)
0bb3 : a9 01 __ LDA #$01
0bb5 : 8d fe 9e STA $9efe ; (sstack + 2)
0bb8 : a9 00 __ LDA #$00
0bba : 8d ff 9e STA $9eff ; (sstack + 3)
0bbd : a9 87 __ LDA #$87
0bbf : 85 35 __ STA P8 
0bc1 : a9 10 __ LDA #$10
0bc3 : 85 36 __ STA P9 
0bc5 : 20 0e 0d JSR $0d0e ; (SetPaletteColours.s0 + 0)
0bc8 : a9 00 __ LDA #$00
0bca : 85 2d __ STA P0 
0bcc : 85 30 __ STA P3 
0bce : 85 33 __ STA P6 
0bd0 : a9 32 __ LDA #$32
0bd2 : 85 2e __ STA P1 
0bd4 : a9 01 __ LDA #$01
0bd6 : 85 2f __ STA P2 
0bd8 : a9 02 __ LDA #$02
0bda : 85 34 __ STA P7 
0bdc : a9 82 __ LDA #$82
0bde : 85 31 __ STA P4 
0be0 : a9 11 __ LDA #$11
0be2 : 85 32 __ STA P5 
0be4 : 20 d3 0c JSR $0cd3 ; (vram_putn.s0 + 0)
0be7 : a9 30 __ LDA #$30
0be9 : 85 2e __ STA P1 
0beb : a9 02 __ LDA #$02
0bed : 85 34 __ STA P7 
0bef : a9 82 __ LDA #$82
0bf1 : 85 31 __ STA P4 
0bf3 : a9 13 __ LDA #$13
0bf5 : 85 32 __ STA P5 
0bf7 : 20 d3 0c JSR $0cd3 ; (vram_putn.s0 + 0)
0bfa : a9 17 __ LDA #$17
0bfc : 85 2d __ STA P0 
0bfe : a9 80 __ LDA #$80
0c00 : 85 2e __ STA P1 
0c02 : a9 09 __ LDA #$09
0c04 : 85 2f __ STA P2 
0c06 : a9 02 __ LDA #$02
0c08 : 85 31 __ STA P4 
0c0a : 85 32 __ STA P5 
0c0c : a9 03 __ LDA #$03
0c0e : 85 33 __ STA P6 
0c10 : a9 01 __ LDA #$01
0c12 : 85 34 __ STA P7 
0c14 : 20 35 0d JSR $0d35 ; (vera_spr_set.s0 + 0)
0c17 : a9 1a __ LDA #$1a
0c19 : 85 2e __ STA P1 
0c1b : a9 01 __ LDA #$01
0c1d : 85 2f __ STA P2 
0c1f : 85 31 __ STA P4 
0c21 : a9 b8 __ LDA #$b8
0c23 : 85 30 __ STA P3 
0c25 : 20 92 0d JSR $0d92 ; (vera_spr_move.s0 + 0)
0c28 : a9 00 __ LDA #$00
0c2a : 85 49 __ STA T4 + 0 
0c2c : 85 4a __ STA T4 + 1 
.l33:
0c2e : 85 2d __ STA P0 
0c30 : 18 __ __ CLC
0c31 : 69 02 __ ADC #$02
0c33 : 85 47 __ STA T3 + 0 
0c35 : a9 00 __ LDA #$00
0c37 : 2a __ __ ROL
0c38 : 85 48 __ STA T3 + 1 
0c3a : a9 90 __ LDA #$90
0c3c : 85 2e __ STA P1 
0c3e : a9 09 __ LDA #$09
0c40 : 85 2f __ STA P2 
0c42 : a9 00 __ LDA #$00
0c44 : 85 30 __ STA P3 
0c46 : a9 03 __ LDA #$03
0c48 : 85 31 __ STA P4 
0c4a : a9 01 __ LDA #$01
0c4c : 85 32 __ STA P5 
0c4e : 20 35 0d JSR $0d35 ; (vera_spr_set.s0 + 0)
0c51 : a5 49 __ LDA T4 + 0 
0c53 : 85 2e __ STA P1 
0c55 : a5 4a __ LDA T4 + 1 
0c57 : 85 2f __ STA P2 
0c59 : a9 a0 __ LDA #$a0
0c5b : 85 30 __ STA P3 
0c5d : a9 01 __ LDA #$01
0c5f : 85 31 __ STA P4 
0c61 : 20 92 0d JSR $0d92 ; (vera_spr_move.s0 + 0)
0c64 : a9 90 __ LDA #$90
0c66 : 85 2e __ STA P1 
0c68 : a9 09 __ LDA #$09
0c6a : 85 2f __ STA P2 
0c6c : a9 00 __ LDA #$00
0c6e : 85 30 __ STA P3 
0c70 : a9 03 __ LDA #$03
0c72 : 85 31 __ STA P4 
0c74 : e6 2d __ INC P0 
0c76 : 20 35 0d JSR $0d35 ; (vera_spr_set.s0 + 0)
0c79 : a5 49 __ LDA T4 + 0 
0c7b : 85 2e __ STA P1 
0c7d : a5 4a __ LDA T4 + 1 
0c7f : 85 2f __ STA P2 
0c81 : a9 70 __ LDA #$70
0c83 : 85 30 __ STA P3 
0c85 : a9 01 __ LDA #$01
0c87 : 85 31 __ STA P4 
0c89 : 20 92 0d JSR $0d92 ; (vera_spr_move.s0 + 0)
0c8c : a5 48 __ LDA T3 + 1 
0c8e : d0 13 __ BNE $0ca3 ; (SetUpSprites.s35 + 0)
.s1004:
0c90 : 18 __ __ CLC
0c91 : a5 2e __ LDA P1 
0c93 : 69 40 __ ADC #$40
0c95 : 85 49 __ STA T4 + 0 
0c97 : a5 2f __ LDA P2 
0c99 : 69 00 __ ADC #$00
0c9b : 85 4a __ STA T4 + 1 
0c9d : a5 47 __ LDA T3 + 0 
0c9f : c9 16 __ CMP #$16
0ca1 : 90 8b __ BCC $0c2e ; (SetUpSprites.l33 + 0)
.s35:
0ca3 : a9 20 __ LDA #$20
0ca5 : 85 37 __ STA P10 
0ca7 : 8d fc 9e STA $9efc ; (sstack + 0)
0caa : a9 fa __ LDA #$fa
0cac : 8d fd 9e STA $9efd ; (sstack + 1)
0caf : a9 01 __ LDA #$01
0cb1 : 8d fe 9e STA $9efe ; (sstack + 2)
0cb4 : a9 00 __ LDA #$00
0cb6 : 8d ff 9e STA $9eff ; (sstack + 3)
0cb9 : a9 a7 __ LDA #$a7
0cbb : 85 35 __ STA P8 
0cbd : a9 10 __ LDA #$10
0cbf : 85 36 __ STA P9 
0cc1 : 4c 0e 0d JMP $0d0e ; (SetPaletteColours.s0 + 0)
.l1008:
0cc4 : ad 23 9f LDA $9f23 
0cc7 : 18 __ __ CLC
0cc8 : 69 30 __ ADC #$30
0cca : 8d 23 9f STA $9f23 
0ccd : 88 __ __ DEY
0cce : d0 f4 __ BNE $0cc4 ; (SetUpSprites.l1008 + 0)
0cd0 : 4c a2 0b JMP $0ba2 ; (SetUpSprites.s135 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0cd3 : ad 25 9f LDA $9f25 
0cd6 : 29 fe __ AND #$fe
0cd8 : 8d 25 9f STA $9f25 
0cdb : a5 2d __ LDA P0 ; (addr + 0)
0cdd : 8d 20 9f STA $9f20 
0ce0 : a5 2e __ LDA P1 ; (addr + 1)
0ce2 : 8d 21 9f STA $9f21 
0ce5 : a5 2f __ LDA P2 ; (addr + 2)
0ce7 : 29 01 __ AND #$01
0ce9 : 09 10 __ ORA #$10
0ceb : 8d 22 9f STA $9f22 
0cee : a5 33 __ LDA P6 ; (size + 0)
0cf0 : 05 34 __ ORA P7 ; (size + 1)
0cf2 : f0 19 __ BEQ $0d0d ; (vram_putn.s1001 + 0)
.s6:
0cf4 : a0 00 __ LDY #$00
0cf6 : a6 33 __ LDX P6 ; (size + 0)
0cf8 : f0 02 __ BEQ $0cfc ; (vram_putn.l1002 + 0)
.s1005:
0cfa : e6 34 __ INC P7 ; (size + 1)
.l1002:
0cfc : b1 31 __ LDA (P4),y ; (data + 0)
0cfe : 8d 23 9f STA $9f23 
0d01 : c8 __ __ INY
0d02 : d0 02 __ BNE $0d06 ; (vram_putn.s1009 + 0)
.s1008:
0d04 : e6 32 __ INC P5 ; (data + 1)
.s1009:
0d06 : ca __ __ DEX
0d07 : d0 f3 __ BNE $0cfc ; (vram_putn.l1002 + 0)
.s1004:
0d09 : c6 34 __ DEC P7 ; (size + 1)
0d0b : d0 ef __ BNE $0cfc ; (vram_putn.l1002 + 0)
.s1001:
0d0d : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1100 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1110 : __ __ __ BYT 00 00 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : ..UUUUUUUUUUUUUU
1120 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1130 : __ __ __ BYT 55 55 aa aa aa aa aa aa aa aa aa aa aa aa aa aa : UU..............
1140 : __ __ __ BYT aa aa 00 00 00 0c 03 00 00 00 30 00 00 00 00 30 : ..........0....0
1150 : __ __ __ BYT 00 00 55 55 75 75 55 55 55 55 55 55 75 55 55 5d : ..UUuuUUUUUUuUU]
1160 : __ __ __ BYT 55 55 d5 55 55 55 55 75 55 55 55 55 55 55 5d 75 : UU.UUUUuUUUUUU]u
1170 : __ __ __ BYT 55 55 aa aa ba aa aa aa aa ba aa aa aa aa ba aa : UU..............
1180 : __ __ __ BYT aa ae                                           : ..
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0d0e : ad fc 9e LDA $9efc ; (sstack + 0)
0d11 : 85 2d __ STA P0 
0d13 : ad fd 9e LDA $9efd ; (sstack + 1)
0d16 : 85 2e __ STA P1 
0d18 : ad fe 9e LDA $9efe ; (sstack + 2)
0d1b : 85 2f __ STA P2 
0d1d : ad ff 9e LDA $9eff ; (sstack + 3)
0d20 : 85 30 __ STA P3 
0d22 : a5 35 __ LDA P8 ; (input + 0)
0d24 : 85 31 __ STA P4 
0d26 : a5 36 __ LDA P9 ; (input + 1)
0d28 : 85 32 __ STA P5 
0d2a : a5 37 __ LDA P10 ; (inputsize + 0)
0d2c : 85 33 __ STA P6 
0d2e : a9 00 __ LDA #$00
0d30 : 85 34 __ STA P7 
0d32 : 4c d3 0c JMP $0cd3 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
1087 : __ __ __ BYT 00 00 11 01 22 02 33 03 44 04 55 05 66 06 77 07 : ....".3.D.U.f.w.
1097 : __ __ __ BYT 88 08 99 09 aa 0a bb 0b cc 0c dd 0d ee 0e ff 0f : ................
--------------------------------------------------------------------
ScrollerOutline:
1182 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1192 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
11a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
11b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
11c2 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
11d2 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
11e2 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
11f2 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1202 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1212 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1222 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1232 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1242 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1252 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1262 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1272 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1282 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1292 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
12a2 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
12b2 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
12c2 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
12d2 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
12e2 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
12f2 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1302 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1312 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1322 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1332 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1342 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1352 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1362 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
1372 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
1382 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1392 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13a2 : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
13b2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13c2 : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
13d2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1402 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1412 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1422 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1432 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1442 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1452 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1462 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1472 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1482 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1492 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14a2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
14b2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
14c2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
14d2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
14e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1502 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1512 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1522 : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
1532 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1542 : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
1552 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1562 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1572 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_set:
.s0:
0d35 : ad 25 9f LDA $9f25 
0d38 : 29 fe __ AND #$fe
0d3a : 8d 25 9f STA $9f25 
0d3d : a5 2d __ LDA P0 ; (spr + 0)
0d3f : 0a __ __ ASL
0d40 : 0a __ __ ASL
0d41 : 85 3b __ STA ACCU + 0 
0d43 : a9 3f __ LDA #$3f
0d45 : 2a __ __ ROL
0d46 : 06 3b __ ASL ACCU + 0 
0d48 : 2a __ __ ROL
0d49 : 8d 21 9f STA $9f21 
0d4c : a5 3b __ LDA ACCU + 0 
0d4e : 8d 20 9f STA $9f20 
0d51 : a9 11 __ LDA #$11
0d53 : 8d 22 9f STA $9f22 
0d56 : a5 30 __ LDA P3 ; (mode8 + 0)
0d58 : f0 02 __ BEQ $0d5c ; (vera_spr_set.s11 + 0)
.s9:
0d5a : a9 80 __ LDA #$80
.s11:
0d5c : 05 2f __ ORA P2 ; (addr32 + 1)
0d5e : a6 2e __ LDX P1 ; (addr32 + 0)
0d60 : 8e 23 9f STX $9f23 
0d63 : 8d 23 9f STA $9f23 
0d66 : a9 00 __ LDA #$00
0d68 : 8d 23 9f STA $9f23 
0d6b : 8d 23 9f STA $9f23 
0d6e : 8d 23 9f STA $9f23 
0d71 : 8d 23 9f STA $9f23 
0d74 : a5 33 __ LDA P6 ; (z + 0)
0d76 : 0a __ __ ASL
0d77 : 0a __ __ ASL
0d78 : 8d 23 9f STA $9f23 
0d7b : a5 32 __ LDA P5 ; (h + 0)
0d7d : 4a __ __ LSR
0d7e : 6a __ __ ROR
0d7f : 29 80 __ AND #$80
0d81 : 6a __ __ ROR
0d82 : 85 3b __ STA ACCU + 0 
0d84 : a5 31 __ LDA P4 ; (w + 0)
0d86 : 0a __ __ ASL
0d87 : 0a __ __ ASL
0d88 : 0a __ __ ASL
0d89 : 0a __ __ ASL
0d8a : 05 3b __ ORA ACCU + 0 
0d8c : 05 34 __ ORA P7 ; (pal + 0)
0d8e : 8d 23 9f STA $9f23 
.s1001:
0d91 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0d92 : ad 25 9f LDA $9f25 
0d95 : 29 fe __ AND #$fe
0d97 : 8d 25 9f STA $9f25 
0d9a : a5 2d __ LDA P0 ; (spr + 0)
0d9c : 0a __ __ ASL
0d9d : 0a __ __ ASL
0d9e : 85 3b __ STA ACCU + 0 
0da0 : a9 3f __ LDA #$3f
0da2 : 2a __ __ ROL
0da3 : 06 3b __ ASL ACCU + 0 
0da5 : 2a __ __ ROL
0da6 : aa __ __ TAX
0da7 : a5 3b __ LDA ACCU + 0 
0da9 : 09 02 __ ORA #$02
0dab : 8d 20 9f STA $9f20 
0dae : 8e 21 9f STX $9f21 
0db1 : a9 11 __ LDA #$11
0db3 : 8d 22 9f STA $9f22 
0db6 : a5 2e __ LDA P1 ; (x + 0)
0db8 : 8d 23 9f STA $9f23 
0dbb : a5 2f __ LDA P2 ; (x + 1)
0dbd : 8d 23 9f STA $9f23 
0dc0 : a5 30 __ LDA P3 ; (y + 0)
0dc2 : 8d 23 9f STA $9f23 
0dc5 : a5 31 __ LDA P4 ; (y + 1)
0dc7 : 8d 23 9f STA $9f23 
.s1001:
0dca : 60 __ __ RTS
--------------------------------------------------------------------
palette:
10a7 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
10b7 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0dcb : ad 86 10 LDA $1086 ; (zsm_finished + 0)
.s1001:
0dce : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0dcf : a9 01 __ LDA #$01
0dd1 : 8d 86 10 STA $1086 ; (zsm_finished + 0)
0dd4 : ad c7 10 LDA $10c7 ; (zsm_reading + 0)
0dd7 : f0 0a __ BEQ $0de3 ; (zsm_init.s3 + 0)
.s1:
0dd9 : a9 02 __ LDA #$02
0ddb : 20 28 0e JSR $0e28 ; (krnio_close.s1000 + 0)
0dde : a9 00 __ LDA #$00
0de0 : 8d c7 10 STA $10c7 ; (zsm_reading + 0)
.s3:
0de3 : 8d f9 10 STA $10f9 ; (zsm_pos + 0)
0de6 : 8d fa 10 STA $10fa ; (zsm_pos + 1)
0de9 : 8d fb 10 STA $10fb ; (zsm_wpos + 0)
0dec : 8d fc 10 STA $10fc ; (zsm_wpos + 1)
0def : 8d f8 10 STA $10f8 ; (zsm_delay + 0)
0df2 : a5 30 __ LDA P3 ; (fname + 0)
0df4 : 85 2d __ STA P0 
0df6 : a5 31 __ LDA P4 ; (fname + 1)
0df8 : 85 2e __ STA P1 
0dfa : 20 30 0e JSR $0e30 ; (krnio_setnam.s0 + 0)
0dfd : a9 02 __ LDA #$02
0dff : 85 2d __ STA P0 
0e01 : 85 2f __ STA P2 
0e03 : a9 08 __ LDA #$08
0e05 : 85 2e __ STA P1 
0e07 : 20 46 0e JSR $0e46 ; (krnio_open.s0 + 0)
0e0a : a5 3b __ LDA ACCU + 0 
0e0c : f0 19 __ BEQ $0e27 ; (zsm_init.s1001 + 0)
.s4:
0e0e : a9 01 __ LDA #$01
0e10 : 8d c7 10 STA $10c7 ; (zsm_reading + 0)
0e13 : 20 6e 0e JSR $0e6e ; (zsm_fill.s0 + 0)
0e16 : a9 10 __ LDA #$10
0e18 : 8d f9 10 STA $10f9 ; (zsm_pos + 0)
0e1b : a9 00 __ LDA #$00
0e1d : 8d fa 10 STA $10fa ; (zsm_pos + 1)
0e20 : 8d 86 10 STA $1086 ; (zsm_finished + 0)
0e23 : a9 01 __ LDA #$01
0e25 : 85 3b __ STA ACCU + 0 
.s1001:
0e27 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
10c7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0e28 : 85 2d __ STA P0 
.s0:
0e2a : a5 2d __ LDA P0 
0e2c : 20 c3 ff JSR $ffc3 
.s1001:
0e2f : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
10fb : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0e30 : a5 2d __ LDA P0 
0e32 : 05 2e __ ORA P1 
0e34 : f0 08 __ BEQ $0e3e ; (krnio_setnam.s0 + 14)
0e36 : a0 ff __ LDY #$ff
0e38 : c8 __ __ INY
0e39 : b1 2d __ LDA (P0),y 
0e3b : d0 fb __ BNE $0e38 ; (krnio_setnam.s0 + 8)
0e3d : 98 __ __ TYA
0e3e : a6 2d __ LDX P0 
0e40 : a4 2e __ LDY P1 
0e42 : 20 bd ff JSR $ffbd 
.s1001:
0e45 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0e46 : a9 00 __ LDA #$00
0e48 : a6 2d __ LDX P0 ; (fnum + 0)
0e4a : 9d 82 19 STA $1982,x ; (krnio_pstatus + 0)
0e4d : a9 00 __ LDA #$00
0e4f : 85 3b __ STA ACCU + 0 
0e51 : 85 3c __ STA ACCU + 1 
0e53 : a5 2d __ LDA P0 ; (fnum + 0)
0e55 : a6 2e __ LDX P1 
0e57 : a4 2f __ LDY P2 
0e59 : 20 ba ff JSR $ffba 
0e5c : 20 c0 ff JSR $ffc0 
0e5f : 90 08 __ BCC $0e69 ; (krnio_open.s0 + 35)
0e61 : a5 2d __ LDA P0 ; (fnum + 0)
0e63 : 20 c3 ff JSR $ffc3 
0e66 : 4c 6d 0e JMP $0e6d ; (krnio_open.s1001 + 0)
0e69 : a9 01 __ LDA #$01
0e6b : 85 3b __ STA ACCU + 0 
.s1001:
0e6d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
1982 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0e6e : ad c7 10 LDA $10c7 ; (zsm_reading + 0)
0e71 : f0 20 __ BEQ $0e93 ; (zsm_fill.s1 + 0)
.s2:
0e73 : ad fa 10 LDA $10fa ; (zsm_pos + 1)
0e76 : 18 __ __ CLC
0e77 : 69 04 __ ADC #$04
0e79 : cd fc 10 CMP $10fc ; (zsm_wpos + 1)
0e7c : d0 0c __ BNE $0e8a ; (zsm_fill.s6 + 0)
.s1006:
0e7e : ad fb 10 LDA $10fb ; (zsm_wpos + 0)
0e81 : cd f9 10 CMP $10f9 ; (zsm_pos + 0)
0e84 : d0 04 __ BNE $0e8a ; (zsm_fill.s6 + 0)
.s5:
0e86 : a9 00 __ LDA #$00
0e88 : f0 0b __ BEQ $0e95 ; (zsm_fill.s1008 + 0)
.s6:
0e8a : a9 02 __ LDA #$02
0e8c : 20 12 0f JSR $0f12 ; (krnio_chkin.s1000 + 0)
0e8f : a5 3b __ LDA ACCU + 0 
0e91 : d0 07 __ BNE $0e9a ; (zsm_fill.s9 + 0)
.s1:
0e93 : a9 ff __ LDA #$ff
.s1008:
0e95 : 85 3b __ STA ACCU + 0 
.s1001:
0e97 : 85 3c __ STA ACCU + 1 
0e99 : 60 __ __ RTS
.s9:
0e9a : a9 00 __ LDA #$00
0e9c : 85 47 __ STA T1 + 0 
0e9e : 85 48 __ STA T1 + 1 
0ea0 : ad fa 10 LDA $10fa ; (zsm_pos + 1)
0ea3 : 18 __ __ CLC
0ea4 : 69 04 __ ADC #$04
0ea6 : cd fc 10 CMP $10fc ; (zsm_wpos + 1)
0ea9 : d0 08 __ BNE $0eb3 ; (zsm_fill.l13 + 0)
.s1002:
0eab : ad fb 10 LDA $10fb ; (zsm_wpos + 0)
0eae : cd f9 10 CMP $10f9 ; (zsm_pos + 0)
0eb1 : f0 49 __ BEQ $0efc ; (zsm_fill.s37 + 0)
.l13:
0eb3 : 20 24 0f JSR $0f24 ; (krnio_chrin.s0 + 0)
0eb6 : ad fb 10 LDA $10fb ; (zsm_wpos + 0)
0eb9 : aa __ __ TAX
0eba : 18 __ __ CLC
0ebb : 69 01 __ ADC #$01
0ebd : 8d fb 10 STA $10fb ; (zsm_wpos + 0)
0ec0 : ad fc 10 LDA $10fc ; (zsm_wpos + 1)
0ec3 : a8 __ __ TAY
0ec4 : 69 00 __ ADC #$00
0ec6 : 8d fc 10 STA $10fc ; (zsm_wpos + 1)
0ec9 : 8a __ __ TXA
0eca : 18 __ __ CLC
0ecb : 69 82 __ ADC #$82
0ecd : 85 49 __ STA T3 + 0 
0ecf : 98 __ __ TYA
0ed0 : 29 03 __ AND #$03
0ed2 : 69 15 __ ADC #$15
0ed4 : 85 4a __ STA T3 + 1 
0ed6 : a5 3b __ LDA ACCU + 0 
0ed8 : a0 00 __ LDY #$00
0eda : 91 49 __ STA (T3 + 0),y 
0edc : e6 47 __ INC T1 + 0 
0ede : d0 02 __ BNE $0ee2 ; (zsm_fill.s1010 + 0)
.s1009:
0ee0 : e6 48 __ INC T1 + 1 
.s1010:
0ee2 : 20 2e 0f JSR $0f2e ; (krnio_status.s0 + 0)
0ee5 : a5 3b __ LDA ACCU + 0 
0ee7 : d0 0e __ BNE $0ef7 ; (zsm_fill.s15 + 0)
.s12:
0ee9 : ad fa 10 LDA $10fa ; (zsm_pos + 1)
0eec : 18 __ __ CLC
0eed : 69 04 __ ADC #$04
0eef : cd fc 10 CMP $10fc ; (zsm_wpos + 1)
0ef2 : d0 bf __ BNE $0eb3 ; (zsm_fill.l13 + 0)
0ef4 : 4c ab 0e JMP $0eab ; (zsm_fill.s1002 + 0)
.s15:
0ef7 : a9 00 __ LDA #$00
0ef9 : 8d c7 10 STA $10c7 ; (zsm_reading + 0)
.s37:
0efc : 20 38 0f JSR $0f38 ; (krnio_clrchn.s0 + 0)
0eff : ad c7 10 LDA $10c7 ; (zsm_reading + 0)
0f02 : d0 05 __ BNE $0f09 ; (zsm_fill.s21 + 0)
.s19:
0f04 : a9 02 __ LDA #$02
0f06 : 20 28 0e JSR $0e28 ; (krnio_close.s1000 + 0)
.s21:
0f09 : a5 47 __ LDA T1 + 0 
0f0b : 85 3b __ STA ACCU + 0 
0f0d : a5 48 __ LDA T1 + 1 
0f0f : 4c 97 0e JMP $0e97 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0f12 : 85 2d __ STA P0 
.s0:
0f14 : a6 2d __ LDX P0 
0f16 : 20 c6 ff JSR $ffc6 
0f19 : a9 00 __ LDA #$00
0f1b : 85 3c __ STA ACCU + 1 
0f1d : b0 02 __ BCS $0f21 ; (krnio_chkin.s0 + 13)
0f1f : a9 01 __ LDA #$01
0f21 : 85 3b __ STA ACCU + 0 
.s1001:
0f23 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0f24 : 20 cf ff JSR $ffcf 
0f27 : 85 3b __ STA ACCU + 0 
0f29 : a9 00 __ LDA #$00
0f2b : 85 3c __ STA ACCU + 1 
.s1001:
0f2d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0f2e : 20 b7 ff JSR $ffb7 
0f31 : 85 3b __ STA ACCU + 0 
0f33 : a9 00 __ LDA #$00
0f35 : 85 3c __ STA ACCU + 1 
.s1001:
0f37 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0f38 : 20 cc ff JSR $ffcc 
.s1001:
0f3b : 60 __ __ RTS
--------------------------------------------------------------------
0f3c : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0f4c : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0f5a : 20 76 0f JSR $0f76 ; (getchx.s0 + 0)
0f5d : a5 3c __ LDA ACCU + 1 
0f5f : d0 10 __ BNE $0f71 ; (Control.s3 + 0)
.s1005:
0f61 : a5 3b __ LDA ACCU + 0 
0f63 : c9 20 __ CMP #$20
0f65 : d0 0a __ BNE $0f71 ; (Control.s3 + 0)
.s1:
0f67 : a9 00 __ LDA #$00
0f69 : c5 2e __ CMP P1 ; (playing + 0)
0f6b : 2a __ __ ROL
0f6c : 85 2e __ STA P1 ; (playing + 0)
0f6e : 20 a7 0f JSR $0fa7 ; (zsm_irq_play.s0 + 0)
.s3:
0f71 : a5 2e __ LDA P1 ; (playing + 0)
0f73 : 85 3b __ STA ACCU + 0 
.s1001:
0f75 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0f76 : 20 80 0f JSR $0f80 ; (getpch + 0)
0f79 : 85 3b __ STA ACCU + 0 
0f7b : a9 00 __ LDA #$00
0f7d : 85 3c __ STA ACCU + 1 
.s1001:
0f7f : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0f80 : 20 e4 ff JSR $ffe4 
0f83 : ae c8 10 LDX $10c8 ; (giocharmap + 0)
0f86 : e0 01 __ CPX #$01
0f88 : 90 1c __ BCC $0fa6 ; (getpch + 38)
0f8a : c9 0d __ CMP #$0d
0f8c : d0 02 __ BNE $0f90 ; (getpch + 16)
0f8e : a9 0a __ LDA #$0a
0f90 : e0 02 __ CPX #$02
0f92 : 90 12 __ BCC $0fa6 ; (getpch + 38)
0f94 : c9 41 __ CMP #$41
0f96 : 90 0e __ BCC $0fa6 ; (getpch + 38)
0f98 : c9 7b __ CMP #$7b
0f9a : b0 0a __ BCS $0fa6 ; (getpch + 38)
0f9c : c9 61 __ CMP #$61
0f9e : b0 04 __ BCS $0fa4 ; (getpch + 36)
0fa0 : c9 5b __ CMP #$5b
0fa2 : b0 02 __ BCS $0fa6 ; (getpch + 38)
0fa4 : 49 20 __ EOR #$20
0fa6 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
10c8 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0fa7 : 8d 85 10 STA $1085 ; (zsm_playing + 0)
.s1001:
0faa : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
10c9 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
10cb : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
10db : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
10eb : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
10fd : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0fab : ad 26 9f LDA $9f26 
0fae : 29 40 __ AND #$40
0fb0 : d0 f9 __ BNE $0fab ; (frame_wait.l1 + 0)
.l4:
0fb2 : ad 26 9f LDA $9f26 
0fb5 : 29 40 __ AND #$40
0fb7 : f0 f9 __ BEQ $0fb2 ; (frame_wait.l4 + 0)
.s1001:
0fb9 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0fba : 38 __ __ SEC
0fbb : a9 00 __ LDA #$00
0fbd : e5 3b __ SBC ACCU + 0 
0fbf : 85 3b __ STA ACCU + 0 
0fc1 : a9 00 __ LDA #$00
0fc3 : e5 3c __ SBC ACCU + 1 
0fc5 : 85 3c __ STA ACCU + 1 
0fc7 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0fc8 : 38 __ __ SEC
0fc9 : a9 00 __ LDA #$00
0fcb : e5 23 __ SBC WORK + 0 
0fcd : 85 23 __ STA WORK + 0 
0fcf : a9 00 __ LDA #$00
0fd1 : e5 24 __ SBC WORK + 1 
0fd3 : 85 24 __ STA WORK + 1 
0fd5 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
0fd6 : a5 3c __ LDA ACCU + 1 
0fd8 : d0 31 __ BNE $100b ; (divmod + 53)
0fda : a5 24 __ LDA WORK + 1 
0fdc : d0 1e __ BNE $0ffc ; (divmod + 38)
0fde : 85 26 __ STA WORK + 3 
0fe0 : a2 04 __ LDX #$04
0fe2 : 06 3b __ ASL ACCU + 0 
0fe4 : 2a __ __ ROL
0fe5 : c5 23 __ CMP WORK + 0 
0fe7 : 90 02 __ BCC $0feb ; (divmod + 21)
0fe9 : e5 23 __ SBC WORK + 0 
0feb : 26 3b __ ROL ACCU + 0 
0fed : 2a __ __ ROL
0fee : c5 23 __ CMP WORK + 0 
0ff0 : 90 02 __ BCC $0ff4 ; (divmod + 30)
0ff2 : e5 23 __ SBC WORK + 0 
0ff4 : 26 3b __ ROL ACCU + 0 
0ff6 : ca __ __ DEX
0ff7 : d0 eb __ BNE $0fe4 ; (divmod + 14)
0ff9 : 85 25 __ STA WORK + 2 
0ffb : 60 __ __ RTS
0ffc : a5 3b __ LDA ACCU + 0 
0ffe : 85 25 __ STA WORK + 2 
1000 : a5 3c __ LDA ACCU + 1 
1002 : 85 26 __ STA WORK + 3 
1004 : a9 00 __ LDA #$00
1006 : 85 3b __ STA ACCU + 0 
1008 : 85 3c __ STA ACCU + 1 
100a : 60 __ __ RTS
100b : a5 24 __ LDA WORK + 1 
100d : d0 1f __ BNE $102e ; (divmod + 88)
100f : a5 23 __ LDA WORK + 0 
1011 : 30 1b __ BMI $102e ; (divmod + 88)
1013 : a9 00 __ LDA #$00
1015 : 85 26 __ STA WORK + 3 
1017 : a2 10 __ LDX #$10
1019 : 06 3b __ ASL ACCU + 0 
101b : 26 3c __ ROL ACCU + 1 
101d : 2a __ __ ROL
101e : c5 23 __ CMP WORK + 0 
1020 : 90 02 __ BCC $1024 ; (divmod + 78)
1022 : e5 23 __ SBC WORK + 0 
1024 : 26 3b __ ROL ACCU + 0 
1026 : 26 3c __ ROL ACCU + 1 
1028 : ca __ __ DEX
1029 : d0 f2 __ BNE $101d ; (divmod + 71)
102b : 85 25 __ STA WORK + 2 
102d : 60 __ __ RTS
102e : a9 00 __ LDA #$00
1030 : 85 25 __ STA WORK + 2 
1032 : 85 26 __ STA WORK + 3 
1034 : 84 22 __ STY $22 
1036 : a0 10 __ LDY #$10
1038 : 18 __ __ CLC
1039 : 26 3b __ ROL ACCU + 0 
103b : 26 3c __ ROL ACCU + 1 
103d : 26 25 __ ROL WORK + 2 
103f : 26 26 __ ROL WORK + 3 
1041 : 38 __ __ SEC
1042 : a5 25 __ LDA WORK + 2 
1044 : e5 23 __ SBC WORK + 0 
1046 : aa __ __ TAX
1047 : a5 26 __ LDA WORK + 3 
1049 : e5 24 __ SBC WORK + 1 
104b : 90 04 __ BCC $1051 ; (divmod + 123)
104d : 86 25 __ STX WORK + 2 
104f : 85 26 __ STA WORK + 3 
1051 : 88 __ __ DEY
1052 : d0 e5 __ BNE $1039 ; (divmod + 99)
1054 : 26 3b __ ROL ACCU + 0 
1056 : 26 3c __ ROL ACCU + 1 
1058 : a4 22 __ LDY $22 
105a : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
105b : 24 3c __ BIT ACCU + 1 
105d : 10 0d __ BPL $106c ; (mods16 + 17)
105f : 20 ba 0f JSR $0fba ; (negaccu + 0)
1062 : 24 24 __ BIT WORK + 1 
1064 : 10 0d __ BPL $1073 ; (mods16 + 24)
1066 : 20 c8 0f JSR $0fc8 ; (negtmp + 0)
1069 : 4c d6 0f JMP $0fd6 ; (divmod + 0)
106c : 24 24 __ BIT WORK + 1 
106e : 10 f9 __ BPL $1069 ; (mods16 + 14)
1070 : 20 c8 0f JSR $0fc8 ; (negtmp + 0)
1073 : 20 d6 0f JSR $0fd6 ; (divmod + 0)
1076 : 38 __ __ SEC
1077 : a9 00 __ LDA #$00
1079 : e5 25 __ SBC WORK + 2 
107b : 85 25 __ STA WORK + 2 
107d : a9 00 __ LDA #$00
107f : e5 26 __ SBC WORK + 3 
1081 : 85 26 __ STA WORK + 3 
1083 : 60 __ __ RTS
