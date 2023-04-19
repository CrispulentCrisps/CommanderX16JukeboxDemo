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
080e : 8e ea 10 STX $10ea ; (spentry + 0)
0811 : a9 ed __ LDA #$ed
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
0830 : a9 fd __ LDA #$fd
0832 : e9 ed __ SBC #$ed
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
10ea : __ __ __ BYT 00                                              : .
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
08be : 20 31 0e JSR $0e31 ; (zsm_check.s0 + 0)
08c1 : 09 00 __ ORA #$00
08c3 : f0 0b __ BEQ $08d0 ; (main.s6 + 0)
.s4:
08c5 : a9 a2 __ LDA #$a2
08c7 : 85 30 __ STA P3 
08c9 : a9 0f __ LDA #$0f
08cb : 85 31 __ STA P4 
08cd : 20 35 0e JSR $0e35 ; (zsm_init.s0 + 0)
.s6:
08d0 : a5 4b __ LDA T1 + 0 
08d2 : 85 2e __ STA P1 
08d4 : 20 c0 0f JSR $0fc0 ; (Control.s0 + 0)
08d7 : a5 3b __ LDA ACCU + 0 
08d9 : 85 4b __ STA T1 + 0 
08db : ad ef 10 LDA $10ef ; (FrameCount + 0)
08de : 85 48 __ STA T3 + 0 
08e0 : 85 3b __ STA ACCU + 0 
08e2 : ad f0 10 LDA $10f0 ; (FrameCount + 1)
08e5 : 85 3c __ STA ACCU + 1 
08e7 : a9 04 __ LDA #$04
08e9 : 85 23 __ STA WORK + 0 
08eb : a9 00 __ LDA #$00
08ed : 85 24 __ STA WORK + 1 
08ef : 20 c1 10 JSR $10c1 ; (mods16 + 0)
08f2 : a5 26 __ LDA WORK + 3 
08f4 : d0 16 __ BNE $090c ; (main.s9 + 0)
.s1002:
08f6 : a5 25 __ LDA WORK + 2 
08f8 : c9 01 __ CMP #$01
08fa : d0 10 __ BNE $090c ; (main.s9 + 0)
.s7:
08fc : ae f8 10 LDX $10f8 ; (off1 + 0)
08ff : e8 __ __ INX
0900 : 8e f8 10 STX $10f8 ; (off1 + 0)
0903 : bd c1 15 LDA $15c1,x ; (palette + 31)
0906 : 38 __ __ SEC
0907 : e9 40 __ SBC #$40
0909 : 8d 23 9f STA $9f23 
.s9:
090c : 06 48 __ ASL T3 + 0 
090e : ad f0 10 LDA $10f0 ; (FrameCount + 1)
0911 : 2a __ __ ROL
0912 : 18 __ __ CLC
0913 : 69 ff __ ADC #$ff
0915 : 8d 38 9f STA $9f38 
0918 : a5 48 __ LDA T3 + 0 
091a : 8d 37 9f STA $9f37 
091d : a9 01 __ LDA #$01
091f : 8d 2c 9f STA $9f2c 
0922 : 20 d4 0e JSR $0ed4 ; (zsm_fill.s0 + 0)
0925 : a9 00 __ LDA #$00
0927 : 8d 2c 9f STA $9f2c 
092a : 20 11 10 JSR $1011 ; (frame_wait.l1 + 0)
092d : ee ef 10 INC $10ef ; (FrameCount + 0)
0930 : d0 87 __ BNE $08b9 ; (main.l2 + 0)
.s1003:
0932 : ee f0 10 INC $10f0 ; (FrameCount + 1)
0935 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0938 : 78 __ __ SEI
0939 : ad 14 03 LDA $0314 
093c : 8d f1 10 STA $10f1 ; (oirq + 0)
093f : ad 15 03 LDA $0315 
0942 : 8d f2 10 STA $10f2 ; (oirq + 1)
0945 : a9 51 __ LDA #$51
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : 58 __ __ CLI
.s1001:
0950 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
10f1 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0951 : 20 57 09 JSR $0957 ; (irq.s1000 + 0)
0954 : 6c f1 10 JMP ($10f1)
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
0981 : ad eb 10 LDA $10eb ; (zsm_playing + 0)
0984 : f0 08 __ BEQ $098e ; (irq.s1001 + 0)
.s4:
0986 : ad ec 10 LDA $10ec ; (zsm_finished + 0)
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
10eb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
10ec : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b9 : ad f3 10 LDA $10f3 ; (zsm_delay + 0)
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
09dd : ad f4 10 LDA $10f4 ; (zsm_pos + 0)
09e0 : 85 4b __ STA T3 + 0 
09e2 : 18 __ __ CLC
09e3 : 69 01 __ ADC #$01
09e5 : 85 4d __ STA T4 + 0 
09e7 : 8d f4 10 STA $10f4 ; (zsm_pos + 0)
09ea : ad f5 10 LDA $10f5 ; (zsm_pos + 1)
09ed : aa __ __ TAX
09ee : 69 00 __ ADC #$00
09f0 : 85 4e __ STA T4 + 1 
09f2 : 8d f5 10 STA $10f5 ; (zsm_pos + 1)
09f5 : 18 __ __ CLC
09f6 : a9 ed __ LDA #$ed
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
0a11 : a9 ed __ LDA #$ed
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
0a26 : 8d f4 10 STA $10f4 ; (zsm_pos + 0)
0a29 : 98 __ __ TYA
0a2a : 65 4e __ ADC T4 + 1 
0a2c : 8d f5 10 STA $10f5 ; (zsm_pos + 1)
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
0a3f : a9 ed __ LDA #$ed
0a41 : 6d f4 10 ADC $10f4 ; (zsm_pos + 0)
0a44 : 85 4d __ STA T4 + 0 
0a46 : ad f5 10 LDA $10f5 ; (zsm_pos + 1)
0a49 : 29 03 __ AND #$03
0a4b : 69 15 __ ADC #$15
0a4d : 85 4e __ STA T4 + 1 
0a4f : a0 00 __ LDY #$00
0a51 : b1 4d __ LDA (T4 + 0),y 
0a53 : 85 2d __ STA P0 
0a55 : ad f4 10 LDA $10f4 ; (zsm_pos + 0)
0a58 : 18 __ __ CLC
0a59 : 69 01 __ ADC #$01
0a5b : aa __ __ TAX
0a5c : ad f5 10 LDA $10f5 ; (zsm_pos + 1)
0a5f : 69 00 __ ADC #$00
0a61 : 29 03 __ AND #$03
0a63 : 85 4c __ STA T3 + 1 
0a65 : 8a __ __ TXA
0a66 : 18 __ __ CLC
0a67 : 69 ed __ ADC #$ed
0a69 : 85 4b __ STA T3 + 0 
0a6b : a9 15 __ LDA #$15
0a6d : 65 4c __ ADC T3 + 1 
0a6f : 85 4c __ STA T3 + 1 
0a71 : b1 4b __ LDA (T3 + 0),y 
0a73 : 85 2e __ STA P1 
0a75 : 20 f2 0a JSR $0af2 ; (sfx_put.l1 + 0)
0a78 : ad f4 10 LDA $10f4 ; (zsm_pos + 0)
0a7b : 18 __ __ CLC
0a7c : 69 02 __ ADC #$02
0a7e : 8d f4 10 STA $10f4 ; (zsm_pos + 0)
0a81 : 90 03 __ BCC $0a86 ; (zsm_play.s1015 + 0)
.s1014:
0a83 : ee f5 10 INC $10f5 ; (zsm_pos + 1)
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
0a97 : 8d ec 10 STA $10ec ; (zsm_finished + 0)
0a9a : d0 08 __ BNE $0aa4 ; (zsm_play.s7 + 0)
.s22:
0a9c : 29 7f __ AND #$7f
0a9e : 38 __ __ SEC
0a9f : e9 01 __ SBC #$01
0aa1 : 8d f3 10 STA $10f3 ; (zsm_delay + 0)
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
0ace : 8d f4 10 STA $10f4 ; (zsm_pos + 0)
0ad1 : 90 01 __ BCC $0ad4 ; (zsm_play.s1017 + 0)
.s1016:
0ad3 : e8 __ __ INX
.s1017:
0ad4 : 8e f5 10 STX $10f5 ; (zsm_pos + 1)
0ad7 : 18 __ __ CLC
0ad8 : a9 ed __ LDA #$ed
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
0aee : ce f3 10 DEC $10f3 ; (zsm_delay + 0)
0af1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
10f3 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
15ed : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
10f4 : __ __ __ BSS	2
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
0b4f : a9 20 __ LDA #$20
0b51 : 85 2f __ STA P2 
0b53 : ad 25 9f LDA $9f25 
0b56 : 29 fd __ AND #$fd
0b58 : 8d 25 9f STA $9f25 
0b5b : ad 29 9f LDA $9f29 
0b5e : 09 70 __ ORA #$70
0b60 : 8d 29 9f STA $9f29 
0b63 : a9 80 __ LDA #$80
0b65 : 8d 2b 9f STA $9f2b 
0b68 : 8d 2a 9f STA $9f2a 
0b6b : a9 11 __ LDA #$11
0b6d : 8d 2d 9f STA $9f2d 
0b70 : a9 00 __ LDA #$00
0b72 : 8d 2f 9f STA $9f2f 
0b75 : 20 2b 0d JSR $0d2b ; (memoryToMapMemoryAddress.s0 + 0)
0b78 : 8d 2e 9f STA $9f2e 
0b7b : a9 00 __ LDA #$00
0b7d : 85 2f __ STA P2 
0b7f : 85 30 __ STA P3 
0b81 : 85 34 __ STA P7 
0b83 : a9 82 __ LDA #$82
0b85 : 85 33 __ STA P6 
0b87 : ad 25 9f LDA $9f25 
0b8a : 29 fe __ AND #$fe
0b8c : 8d 25 9f STA $9f25 
0b8f : a9 00 __ LDA #$00
0b91 : 8d 20 9f STA $9f20 
0b94 : 8d 21 9f STA $9f21 
0b97 : a9 10 __ LDA #$10
0b99 : 8d 22 9f STA $9f22 
0b9c : a9 00 __ LDA #$00
0b9e : 85 31 __ STA P4 
0ba0 : a9 11 __ LDA #$11
0ba2 : 85 32 __ STA P5 
0ba4 : 20 39 0d JSR $0d39 ; (vram_putn.s0 + 0)
0ba7 : ad 22 9f LDA $9f22 
0baa : 09 10 __ ORA #$10
0bac : 8d 22 9f STA $9f22 
0baf : a9 00 __ LDA #$00
0bb1 : 85 3b __ STA ACCU + 0 
.l10:
0bb3 : a2 3c __ LDX #$3c
.l1016:
0bb5 : a9 01 __ LDA #$01
0bb7 : 8d 23 9f STA $9f23 
0bba : a9 00 __ LDA #$00
0bbc : 8d 23 9f STA $9f23 
0bbf : ca __ __ DEX
0bc0 : d0 f3 __ BNE $0bb5 ; (SetUpSprites.l1016 + 0)
.l190:
0bc2 : e6 3b __ INC ACCU + 0 
0bc4 : a5 3b __ LDA ACCU + 0 
0bc6 : c9 20 __ CMP #$20
0bc8 : b0 44 __ BCS $0c0e ; (SetUpSprites.s5 + 0)
.s3:
0bca : c9 05 __ CMP #$05
0bcc : 90 e5 __ BCC $0bb3 ; (SetUpSprites.l10 + 0)
.s1008:
0bce : a9 08 __ LDA #$08
0bd0 : c5 3b __ CMP ACCU + 0 
0bd2 : 90 12 __ BCC $0be6 ; (SetUpSprites.s1007 + 0)
.s18:
0bd4 : a2 3c __ LDX #$3c
.l1014:
0bd6 : a9 02 __ LDA #$02
0bd8 : 8d 23 9f STA $9f23 
0bdb : a9 00 __ LDA #$00
0bdd : 8d 23 9f STA $9f23 
0be0 : ca __ __ DEX
0be1 : d0 f3 __ BNE $0bd6 ; (SetUpSprites.l1014 + 0)
0be3 : 4c c2 0b JMP $0bc2 ; (SetUpSprites.l190 + 0)
.s1007:
0be6 : a9 10 __ LDA #$10
0be8 : c5 3b __ CMP ACCU + 0 
0bea : a0 3c __ LDY #$3c
0bec : b0 10 __ BCS $0bfe ; (SetUpSprites.l1012 + 0)
.l1010:
0bee : a9 04 __ LDA #$04
0bf0 : 8d 23 9f STA $9f23 
0bf3 : a9 00 __ LDA #$00
0bf5 : 8d 23 9f STA $9f23 
0bf8 : 88 __ __ DEY
0bf9 : d0 f3 __ BNE $0bee ; (SetUpSprites.l1010 + 0)
0bfb : 4c c2 0b JMP $0bc2 ; (SetUpSprites.l190 + 0)
.l1012:
0bfe : a9 03 __ LDA #$03
0c00 : 8d 23 9f STA $9f23 
0c03 : a9 00 __ LDA #$00
0c05 : 8d 23 9f STA $9f23 
0c08 : 88 __ __ DEY
0c09 : d0 f3 __ BNE $0bfe ; (SetUpSprites.l1012 + 0)
0c0b : 4c c2 0b JMP $0bc2 ; (SetUpSprites.l190 + 0)
.s5:
0c0e : a9 20 __ LDA #$20
0c10 : 85 37 __ STA P10 
0c12 : 8d fc 9e STA $9efc ; (sstack + 0)
0c15 : a9 fb __ LDA #$fb
0c17 : 8d fd 9e STA $9efd ; (sstack + 1)
0c1a : a9 01 __ LDA #$01
0c1c : 8d fe 9e STA $9efe ; (sstack + 2)
0c1f : a9 00 __ LDA #$00
0c21 : 8d ff 9e STA $9eff ; (sstack + 3)
0c24 : a9 82 __ LDA #$82
0c26 : 85 35 __ STA P8 
0c28 : a9 11 __ LDA #$11
0c2a : 85 36 __ STA P9 
0c2c : 20 74 0d JSR $0d74 ; (SetPaletteColours.s0 + 0)
0c2f : a9 00 __ LDA #$00
0c31 : 85 2d __ STA P0 
0c33 : 85 30 __ STA P3 
0c35 : 85 33 __ STA P6 
0c37 : a9 32 __ LDA #$32
0c39 : 85 2e __ STA P1 
0c3b : a9 01 __ LDA #$01
0c3d : 85 2f __ STA P2 
0c3f : a9 02 __ LDA #$02
0c41 : 85 34 __ STA P7 
0c43 : a9 a2 __ LDA #$a2
0c45 : 85 31 __ STA P4 
0c47 : a9 11 __ LDA #$11
0c49 : 85 32 __ STA P5 
0c4b : 20 39 0d JSR $0d39 ; (vram_putn.s0 + 0)
0c4e : a9 30 __ LDA #$30
0c50 : 85 2e __ STA P1 
0c52 : a9 02 __ LDA #$02
0c54 : 85 34 __ STA P7 
0c56 : a9 a2 __ LDA #$a2
0c58 : 85 31 __ STA P4 
0c5a : a9 13 __ LDA #$13
0c5c : 85 32 __ STA P5 
0c5e : 20 39 0d JSR $0d39 ; (vram_putn.s0 + 0)
0c61 : a9 17 __ LDA #$17
0c63 : 85 2d __ STA P0 
0c65 : a9 80 __ LDA #$80
0c67 : 85 2e __ STA P1 
0c69 : a9 09 __ LDA #$09
0c6b : 85 2f __ STA P2 
0c6d : a9 02 __ LDA #$02
0c6f : 85 31 __ STA P4 
0c71 : 85 32 __ STA P5 
0c73 : a9 03 __ LDA #$03
0c75 : 85 33 __ STA P6 
0c77 : a9 01 __ LDA #$01
0c79 : 85 34 __ STA P7 
0c7b : 20 9b 0d JSR $0d9b ; (vera_spr_set.s0 + 0)
0c7e : a9 1a __ LDA #$1a
0c80 : 85 2e __ STA P1 
0c82 : a9 01 __ LDA #$01
0c84 : 85 2f __ STA P2 
0c86 : 85 31 __ STA P4 
0c88 : a9 b8 __ LDA #$b8
0c8a : 85 30 __ STA P3 
0c8c : 20 f8 0d JSR $0df8 ; (vera_spr_move.s0 + 0)
0c8f : a9 00 __ LDA #$00
0c91 : 85 49 __ STA T4 + 0 
0c93 : 85 4a __ STA T4 + 1 
.l34:
0c95 : 85 2d __ STA P0 
0c97 : 18 __ __ CLC
0c98 : 69 02 __ ADC #$02
0c9a : 85 47 __ STA T3 + 0 
0c9c : a9 00 __ LDA #$00
0c9e : 2a __ __ ROL
0c9f : 85 48 __ STA T3 + 1 
0ca1 : a9 90 __ LDA #$90
0ca3 : 85 2e __ STA P1 
0ca5 : a9 09 __ LDA #$09
0ca7 : 85 2f __ STA P2 
0ca9 : a9 00 __ LDA #$00
0cab : 85 30 __ STA P3 
0cad : a9 03 __ LDA #$03
0caf : 85 31 __ STA P4 
0cb1 : a9 01 __ LDA #$01
0cb3 : 85 32 __ STA P5 
0cb5 : 20 9b 0d JSR $0d9b ; (vera_spr_set.s0 + 0)
0cb8 : a5 49 __ LDA T4 + 0 
0cba : 85 2e __ STA P1 
0cbc : a5 4a __ LDA T4 + 1 
0cbe : 85 2f __ STA P2 
0cc0 : a9 a0 __ LDA #$a0
0cc2 : 85 30 __ STA P3 
0cc4 : a9 01 __ LDA #$01
0cc6 : 85 31 __ STA P4 
0cc8 : 20 f8 0d JSR $0df8 ; (vera_spr_move.s0 + 0)
0ccb : a9 90 __ LDA #$90
0ccd : 85 2e __ STA P1 
0ccf : a9 09 __ LDA #$09
0cd1 : 85 2f __ STA P2 
0cd3 : a9 00 __ LDA #$00
0cd5 : 85 30 __ STA P3 
0cd7 : a9 03 __ LDA #$03
0cd9 : 85 31 __ STA P4 
0cdb : e6 2d __ INC P0 
0cdd : 20 9b 0d JSR $0d9b ; (vera_spr_set.s0 + 0)
0ce0 : a5 49 __ LDA T4 + 0 
0ce2 : 85 2e __ STA P1 
0ce4 : a5 4a __ LDA T4 + 1 
0ce6 : 85 2f __ STA P2 
0ce8 : a9 70 __ LDA #$70
0cea : 85 30 __ STA P3 
0cec : a9 01 __ LDA #$01
0cee : 85 31 __ STA P4 
0cf0 : 20 f8 0d JSR $0df8 ; (vera_spr_move.s0 + 0)
0cf3 : a5 48 __ LDA T3 + 1 
0cf5 : d0 13 __ BNE $0d0a ; (SetUpSprites.s36 + 0)
.s1004:
0cf7 : 18 __ __ CLC
0cf8 : a5 2e __ LDA P1 
0cfa : 69 40 __ ADC #$40
0cfc : 85 49 __ STA T4 + 0 
0cfe : a5 2f __ LDA P2 
0d00 : 69 00 __ ADC #$00
0d02 : 85 4a __ STA T4 + 1 
0d04 : a5 47 __ LDA T3 + 0 
0d06 : c9 16 __ CMP #$16
0d08 : 90 8b __ BCC $0c95 ; (SetUpSprites.l34 + 0)
.s36:
0d0a : a9 20 __ LDA #$20
0d0c : 85 37 __ STA P10 
0d0e : 8d fc 9e STA $9efc ; (sstack + 0)
0d11 : a9 fa __ LDA #$fa
0d13 : 8d fd 9e STA $9efd ; (sstack + 1)
0d16 : a9 01 __ LDA #$01
0d18 : 8d fe 9e STA $9efe ; (sstack + 2)
0d1b : a9 00 __ LDA #$00
0d1d : 8d ff 9e STA $9eff ; (sstack + 3)
0d20 : a9 a2 __ LDA #$a2
0d22 : 85 35 __ STA P8 
0d24 : a9 15 __ LDA #$15
0d26 : 85 36 __ STA P9 
0d28 : 4c 74 0d JMP $0d74 ; (SetPaletteColours.s0 + 0)
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
0d2b : a5 2d __ LDA P0 ; (bank + 0)
0d2d : 4a __ __ LSR
0d2e : a9 00 __ LDA #$00
0d30 : 6a __ __ ROR
0d31 : 85 3b __ STA ACCU + 0 
0d33 : a5 2f __ LDA P2 ; (mem + 1)
0d35 : 4a __ __ LSR
0d36 : 05 3b __ ORA ACCU + 0 
.s1001:
0d38 : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
0d39 : ad 25 9f LDA $9f25 
0d3c : 29 fe __ AND #$fe
0d3e : 8d 25 9f STA $9f25 
0d41 : a5 2d __ LDA P0 ; (addr + 0)
0d43 : 8d 20 9f STA $9f20 
0d46 : a5 2e __ LDA P1 ; (addr + 1)
0d48 : 8d 21 9f STA $9f21 
0d4b : a5 2f __ LDA P2 ; (addr + 2)
0d4d : 29 01 __ AND #$01
0d4f : 09 10 __ ORA #$10
0d51 : 8d 22 9f STA $9f22 
0d54 : a5 33 __ LDA P6 ; (size + 0)
0d56 : 05 34 __ ORA P7 ; (size + 1)
0d58 : f0 19 __ BEQ $0d73 ; (vram_putn.s1001 + 0)
.s6:
0d5a : a0 00 __ LDY #$00
0d5c : a6 33 __ LDX P6 ; (size + 0)
0d5e : f0 02 __ BEQ $0d62 ; (vram_putn.l1002 + 0)
.s1005:
0d60 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0d62 : b1 31 __ LDA (P4),y ; (data + 0)
0d64 : 8d 23 9f STA $9f23 
0d67 : c8 __ __ INY
0d68 : d0 02 __ BNE $0d6c ; (vram_putn.s1009 + 0)
.s1008:
0d6a : e6 32 __ INC P5 ; (data + 1)
.s1009:
0d6c : ca __ __ DEX
0d6d : d0 f3 __ BNE $0d62 ; (vram_putn.l1002 + 0)
.s1004:
0d6f : c6 34 __ DEC P7 ; (size + 1)
0d71 : d0 ef __ BNE $0d62 ; (vram_putn.l1002 + 0)
.s1001:
0d73 : 60 __ __ RTS
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
0d74 : ad fc 9e LDA $9efc ; (sstack + 0)
0d77 : 85 2d __ STA P0 
0d79 : ad fd 9e LDA $9efd ; (sstack + 1)
0d7c : 85 2e __ STA P1 
0d7e : ad fe 9e LDA $9efe ; (sstack + 2)
0d81 : 85 2f __ STA P2 
0d83 : ad ff 9e LDA $9eff ; (sstack + 3)
0d86 : 85 30 __ STA P3 
0d88 : a5 35 __ LDA P8 ; (input + 0)
0d8a : 85 31 __ STA P4 
0d8c : a5 36 __ LDA P9 ; (input + 1)
0d8e : 85 32 __ STA P5 
0d90 : a5 37 __ LDA P10 ; (inputsize + 0)
0d92 : 85 33 __ STA P6 
0d94 : a9 00 __ LDA #$00
0d96 : 85 34 __ STA P7 
0d98 : 4c 39 0d JMP $0d39 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
1182 : __ __ __ BYT 00 00 11 01 22 02 33 03 44 04 55 05 66 06 77 07 : ....".3.D.U.f.w.
1192 : __ __ __ BYT 88 08 99 09 aa 0a bb 0b cc 0c dd 0d ee 0e ff 0f : ................
--------------------------------------------------------------------
ScrollerOutline:
11a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
11b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
11c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
11d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
11e2 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
11f2 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1202 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1212 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1222 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1232 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1242 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1252 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1262 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
1272 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1282 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
1292 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
12a2 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
12b2 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
12c2 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
12d2 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
12e2 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
12f2 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1302 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1312 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1322 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1332 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1342 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1352 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1362 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1372 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1382 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
1392 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
13a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13c2 : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
13d2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13e2 : __ __ __ BYT 00 11 11 00 00 12 21 00 00 12 21 00 00 10 01 00 : ......!...!.....
13f2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1402 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1412 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1422 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1432 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1442 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1452 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1462 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1472 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1482 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1492 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14c2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
14d2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
14e2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
14f2 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1502 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1512 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1522 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1532 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1542 : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
1552 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1562 : __ __ __ BYT 00 11 11 00 00 22 22 00 00 22 22 00 00 00 00 00 : ....."".."".....
1572 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1582 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1592 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
vera_spr_set:
.s0:
0d9b : ad 25 9f LDA $9f25 
0d9e : 29 fe __ AND #$fe
0da0 : 8d 25 9f STA $9f25 
0da3 : a5 2d __ LDA P0 ; (spr + 0)
0da5 : 0a __ __ ASL
0da6 : 0a __ __ ASL
0da7 : 85 3b __ STA ACCU + 0 
0da9 : a9 3f __ LDA #$3f
0dab : 2a __ __ ROL
0dac : 06 3b __ ASL ACCU + 0 
0dae : 2a __ __ ROL
0daf : 8d 21 9f STA $9f21 
0db2 : a5 3b __ LDA ACCU + 0 
0db4 : 8d 20 9f STA $9f20 
0db7 : a9 11 __ LDA #$11
0db9 : 8d 22 9f STA $9f22 
0dbc : a5 30 __ LDA P3 ; (mode8 + 0)
0dbe : f0 02 __ BEQ $0dc2 ; (vera_spr_set.s11 + 0)
.s9:
0dc0 : a9 80 __ LDA #$80
.s11:
0dc2 : 05 2f __ ORA P2 ; (addr32 + 1)
0dc4 : a6 2e __ LDX P1 ; (addr32 + 0)
0dc6 : 8e 23 9f STX $9f23 
0dc9 : 8d 23 9f STA $9f23 
0dcc : a9 00 __ LDA #$00
0dce : 8d 23 9f STA $9f23 
0dd1 : 8d 23 9f STA $9f23 
0dd4 : 8d 23 9f STA $9f23 
0dd7 : 8d 23 9f STA $9f23 
0dda : a5 33 __ LDA P6 ; (z + 0)
0ddc : 0a __ __ ASL
0ddd : 0a __ __ ASL
0dde : 8d 23 9f STA $9f23 
0de1 : a5 32 __ LDA P5 ; (h + 0)
0de3 : 4a __ __ LSR
0de4 : 6a __ __ ROR
0de5 : 29 80 __ AND #$80
0de7 : 6a __ __ ROR
0de8 : 85 3b __ STA ACCU + 0 
0dea : a5 31 __ LDA P4 ; (w + 0)
0dec : 0a __ __ ASL
0ded : 0a __ __ ASL
0dee : 0a __ __ ASL
0def : 0a __ __ ASL
0df0 : 05 3b __ ORA ACCU + 0 
0df2 : 05 34 __ ORA P7 ; (pal + 0)
0df4 : 8d 23 9f STA $9f23 
.s1001:
0df7 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0df8 : ad 25 9f LDA $9f25 
0dfb : 29 fe __ AND #$fe
0dfd : 8d 25 9f STA $9f25 
0e00 : a5 2d __ LDA P0 ; (spr + 0)
0e02 : 0a __ __ ASL
0e03 : 0a __ __ ASL
0e04 : 85 3b __ STA ACCU + 0 
0e06 : a9 3f __ LDA #$3f
0e08 : 2a __ __ ROL
0e09 : 06 3b __ ASL ACCU + 0 
0e0b : 2a __ __ ROL
0e0c : aa __ __ TAX
0e0d : a5 3b __ LDA ACCU + 0 
0e0f : 09 02 __ ORA #$02
0e11 : 8d 20 9f STA $9f20 
0e14 : 8e 21 9f STX $9f21 
0e17 : a9 11 __ LDA #$11
0e19 : 8d 22 9f STA $9f22 
0e1c : a5 2e __ LDA P1 ; (x + 0)
0e1e : 8d 23 9f STA $9f23 
0e21 : a5 2f __ LDA P2 ; (x + 1)
0e23 : 8d 23 9f STA $9f23 
0e26 : a5 30 __ LDA P3 ; (y + 0)
0e28 : 8d 23 9f STA $9f23 
0e2b : a5 31 __ LDA P4 ; (y + 1)
0e2d : 8d 23 9f STA $9f23 
.s1001:
0e30 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
15a2 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
15b2 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0e31 : ad ec 10 LDA $10ec ; (zsm_finished + 0)
.s1001:
0e34 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0e35 : a9 01 __ LDA #$01
0e37 : 8d ec 10 STA $10ec ; (zsm_finished + 0)
0e3a : ad ed 10 LDA $10ed ; (zsm_reading + 0)
0e3d : f0 0a __ BEQ $0e49 ; (zsm_init.s3 + 0)
.s1:
0e3f : a9 02 __ LDA #$02
0e41 : 20 8e 0e JSR $0e8e ; (krnio_close.s1000 + 0)
0e44 : a9 00 __ LDA #$00
0e46 : 8d ed 10 STA $10ed ; (zsm_reading + 0)
.s3:
0e49 : 8d f4 10 STA $10f4 ; (zsm_pos + 0)
0e4c : 8d f5 10 STA $10f5 ; (zsm_pos + 1)
0e4f : 8d f6 10 STA $10f6 ; (zsm_wpos + 0)
0e52 : 8d f7 10 STA $10f7 ; (zsm_wpos + 1)
0e55 : 8d f3 10 STA $10f3 ; (zsm_delay + 0)
0e58 : a5 30 __ LDA P3 ; (fname + 0)
0e5a : 85 2d __ STA P0 
0e5c : a5 31 __ LDA P4 ; (fname + 1)
0e5e : 85 2e __ STA P1 
0e60 : 20 96 0e JSR $0e96 ; (krnio_setnam.s0 + 0)
0e63 : a9 02 __ LDA #$02
0e65 : 85 2d __ STA P0 
0e67 : 85 2f __ STA P2 
0e69 : a9 08 __ LDA #$08
0e6b : 85 2e __ STA P1 
0e6d : 20 ac 0e JSR $0eac ; (krnio_open.s0 + 0)
0e70 : a5 3b __ LDA ACCU + 0 
0e72 : f0 19 __ BEQ $0e8d ; (zsm_init.s1001 + 0)
.s4:
0e74 : a9 01 __ LDA #$01
0e76 : 8d ed 10 STA $10ed ; (zsm_reading + 0)
0e79 : 20 d4 0e JSR $0ed4 ; (zsm_fill.s0 + 0)
0e7c : a9 10 __ LDA #$10
0e7e : 8d f4 10 STA $10f4 ; (zsm_pos + 0)
0e81 : a9 00 __ LDA #$00
0e83 : 8d f5 10 STA $10f5 ; (zsm_pos + 1)
0e86 : 8d ec 10 STA $10ec ; (zsm_finished + 0)
0e89 : a9 01 __ LDA #$01
0e8b : 85 3b __ STA ACCU + 0 
.s1001:
0e8d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
10ed : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0e8e : 85 2d __ STA P0 
.s0:
0e90 : a5 2d __ LDA P0 
0e92 : 20 c3 ff JSR $ffc3 
.s1001:
0e95 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
10f6 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0e96 : a5 2d __ LDA P0 
0e98 : 05 2e __ ORA P1 
0e9a : f0 08 __ BEQ $0ea4 ; (krnio_setnam.s0 + 14)
0e9c : a0 ff __ LDY #$ff
0e9e : c8 __ __ INY
0e9f : b1 2d __ LDA (P0),y 
0ea1 : d0 fb __ BNE $0e9e ; (krnio_setnam.s0 + 8)
0ea3 : 98 __ __ TYA
0ea4 : a6 2d __ LDX P0 
0ea6 : a4 2e __ LDY P1 
0ea8 : 20 bd ff JSR $ffbd 
.s1001:
0eab : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0eac : a9 00 __ LDA #$00
0eae : a6 2d __ LDX P0 ; (fnum + 0)
0eb0 : 9d ed 19 STA $19ed,x ; (krnio_pstatus + 0)
0eb3 : a9 00 __ LDA #$00
0eb5 : 85 3b __ STA ACCU + 0 
0eb7 : 85 3c __ STA ACCU + 1 
0eb9 : a5 2d __ LDA P0 ; (fnum + 0)
0ebb : a6 2e __ LDX P1 
0ebd : a4 2f __ LDY P2 
0ebf : 20 ba ff JSR $ffba 
0ec2 : 20 c0 ff JSR $ffc0 
0ec5 : 90 08 __ BCC $0ecf ; (krnio_open.s0 + 35)
0ec7 : a5 2d __ LDA P0 ; (fnum + 0)
0ec9 : 20 c3 ff JSR $ffc3 
0ecc : 4c d3 0e JMP $0ed3 ; (krnio_open.s1001 + 0)
0ecf : a9 01 __ LDA #$01
0ed1 : 85 3b __ STA ACCU + 0 
.s1001:
0ed3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
19ed : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0ed4 : ad ed 10 LDA $10ed ; (zsm_reading + 0)
0ed7 : f0 20 __ BEQ $0ef9 ; (zsm_fill.s1 + 0)
.s2:
0ed9 : ad f5 10 LDA $10f5 ; (zsm_pos + 1)
0edc : 18 __ __ CLC
0edd : 69 04 __ ADC #$04
0edf : cd f7 10 CMP $10f7 ; (zsm_wpos + 1)
0ee2 : d0 0c __ BNE $0ef0 ; (zsm_fill.s6 + 0)
.s1006:
0ee4 : ad f6 10 LDA $10f6 ; (zsm_wpos + 0)
0ee7 : cd f4 10 CMP $10f4 ; (zsm_pos + 0)
0eea : d0 04 __ BNE $0ef0 ; (zsm_fill.s6 + 0)
.s5:
0eec : a9 00 __ LDA #$00
0eee : f0 0b __ BEQ $0efb ; (zsm_fill.s1008 + 0)
.s6:
0ef0 : a9 02 __ LDA #$02
0ef2 : 20 78 0f JSR $0f78 ; (krnio_chkin.s1000 + 0)
0ef5 : a5 3b __ LDA ACCU + 0 
0ef7 : d0 07 __ BNE $0f00 ; (zsm_fill.s9 + 0)
.s1:
0ef9 : a9 ff __ LDA #$ff
.s1008:
0efb : 85 3b __ STA ACCU + 0 
.s1001:
0efd : 85 3c __ STA ACCU + 1 
0eff : 60 __ __ RTS
.s9:
0f00 : a9 00 __ LDA #$00
0f02 : 85 47 __ STA T1 + 0 
0f04 : 85 48 __ STA T1 + 1 
0f06 : ad f5 10 LDA $10f5 ; (zsm_pos + 1)
0f09 : 18 __ __ CLC
0f0a : 69 04 __ ADC #$04
0f0c : cd f7 10 CMP $10f7 ; (zsm_wpos + 1)
0f0f : d0 08 __ BNE $0f19 ; (zsm_fill.l13 + 0)
.s1002:
0f11 : ad f6 10 LDA $10f6 ; (zsm_wpos + 0)
0f14 : cd f4 10 CMP $10f4 ; (zsm_pos + 0)
0f17 : f0 49 __ BEQ $0f62 ; (zsm_fill.s37 + 0)
.l13:
0f19 : 20 8a 0f JSR $0f8a ; (krnio_chrin.s0 + 0)
0f1c : ad f6 10 LDA $10f6 ; (zsm_wpos + 0)
0f1f : aa __ __ TAX
0f20 : 18 __ __ CLC
0f21 : 69 01 __ ADC #$01
0f23 : 8d f6 10 STA $10f6 ; (zsm_wpos + 0)
0f26 : ad f7 10 LDA $10f7 ; (zsm_wpos + 1)
0f29 : a8 __ __ TAY
0f2a : 69 00 __ ADC #$00
0f2c : 8d f7 10 STA $10f7 ; (zsm_wpos + 1)
0f2f : 8a __ __ TXA
0f30 : 18 __ __ CLC
0f31 : 69 ed __ ADC #$ed
0f33 : 85 49 __ STA T3 + 0 
0f35 : 98 __ __ TYA
0f36 : 29 03 __ AND #$03
0f38 : 69 15 __ ADC #$15
0f3a : 85 4a __ STA T3 + 1 
0f3c : a5 3b __ LDA ACCU + 0 
0f3e : a0 00 __ LDY #$00
0f40 : 91 49 __ STA (T3 + 0),y 
0f42 : e6 47 __ INC T1 + 0 
0f44 : d0 02 __ BNE $0f48 ; (zsm_fill.s1010 + 0)
.s1009:
0f46 : e6 48 __ INC T1 + 1 
.s1010:
0f48 : 20 94 0f JSR $0f94 ; (krnio_status.s0 + 0)
0f4b : a5 3b __ LDA ACCU + 0 
0f4d : d0 0e __ BNE $0f5d ; (zsm_fill.s15 + 0)
.s12:
0f4f : ad f5 10 LDA $10f5 ; (zsm_pos + 1)
0f52 : 18 __ __ CLC
0f53 : 69 04 __ ADC #$04
0f55 : cd f7 10 CMP $10f7 ; (zsm_wpos + 1)
0f58 : d0 bf __ BNE $0f19 ; (zsm_fill.l13 + 0)
0f5a : 4c 11 0f JMP $0f11 ; (zsm_fill.s1002 + 0)
.s15:
0f5d : a9 00 __ LDA #$00
0f5f : 8d ed 10 STA $10ed ; (zsm_reading + 0)
.s37:
0f62 : 20 9e 0f JSR $0f9e ; (krnio_clrchn.s0 + 0)
0f65 : ad ed 10 LDA $10ed ; (zsm_reading + 0)
0f68 : d0 05 __ BNE $0f6f ; (zsm_fill.s21 + 0)
.s19:
0f6a : a9 02 __ LDA #$02
0f6c : 20 8e 0e JSR $0e8e ; (krnio_close.s1000 + 0)
.s21:
0f6f : a5 47 __ LDA T1 + 0 
0f71 : 85 3b __ STA ACCU + 0 
0f73 : a5 48 __ LDA T1 + 1 
0f75 : 4c fd 0e JMP $0efd ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0f78 : 85 2d __ STA P0 
.s0:
0f7a : a6 2d __ LDX P0 
0f7c : 20 c6 ff JSR $ffc6 
0f7f : a9 00 __ LDA #$00
0f81 : 85 3c __ STA ACCU + 1 
0f83 : b0 02 __ BCS $0f87 ; (krnio_chkin.s0 + 13)
0f85 : a9 01 __ LDA #$01
0f87 : 85 3b __ STA ACCU + 0 
.s1001:
0f89 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0f8a : 20 cf ff JSR $ffcf 
0f8d : 85 3b __ STA ACCU + 0 
0f8f : a9 00 __ LDA #$00
0f91 : 85 3c __ STA ACCU + 1 
.s1001:
0f93 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0f94 : 20 b7 ff JSR $ffb7 
0f97 : 85 3b __ STA ACCU + 0 
0f99 : a9 00 __ LDA #$00
0f9b : 85 3c __ STA ACCU + 1 
.s1001:
0f9d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0f9e : 20 cc ff JSR $ffcc 
.s1001:
0fa1 : 60 __ __ RTS
--------------------------------------------------------------------
0fa2 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0fb2 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0fc0 : 20 dc 0f JSR $0fdc ; (getchx.s0 + 0)
0fc3 : a5 3c __ LDA ACCU + 1 
0fc5 : d0 10 __ BNE $0fd7 ; (Control.s3 + 0)
.s1005:
0fc7 : a5 3b __ LDA ACCU + 0 
0fc9 : c9 20 __ CMP #$20
0fcb : d0 0a __ BNE $0fd7 ; (Control.s3 + 0)
.s1:
0fcd : a9 00 __ LDA #$00
0fcf : c5 2e __ CMP P1 ; (playing + 0)
0fd1 : 2a __ __ ROL
0fd2 : 85 2e __ STA P1 ; (playing + 0)
0fd4 : 20 0d 10 JSR $100d ; (zsm_irq_play.s0 + 0)
.s3:
0fd7 : a5 2e __ LDA P1 ; (playing + 0)
0fd9 : 85 3b __ STA ACCU + 0 
.s1001:
0fdb : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0fdc : 20 e6 0f JSR $0fe6 ; (getpch + 0)
0fdf : 85 3b __ STA ACCU + 0 
0fe1 : a9 00 __ LDA #$00
0fe3 : 85 3c __ STA ACCU + 1 
.s1001:
0fe5 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0fe6 : 20 e4 ff JSR $ffe4 
0fe9 : ae ee 10 LDX $10ee ; (giocharmap + 0)
0fec : e0 01 __ CPX #$01
0fee : 90 1c __ BCC $100c ; (getpch + 38)
0ff0 : c9 0d __ CMP #$0d
0ff2 : d0 02 __ BNE $0ff6 ; (getpch + 16)
0ff4 : a9 0a __ LDA #$0a
0ff6 : e0 02 __ CPX #$02
0ff8 : 90 12 __ BCC $100c ; (getpch + 38)
0ffa : c9 41 __ CMP #$41
0ffc : 90 0e __ BCC $100c ; (getpch + 38)
0ffe : c9 7b __ CMP #$7b
1000 : b0 0a __ BCS $100c ; (getpch + 38)
1002 : c9 61 __ CMP #$61
1004 : b0 04 __ BCS $100a ; (getpch + 36)
1006 : c9 5b __ CMP #$5b
1008 : b0 02 __ BCS $100c ; (getpch + 38)
100a : 49 20 __ EOR #$20
100c : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
10ee : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
100d : 8d eb 10 STA $10eb ; (zsm_playing + 0)
.s1001:
1010 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
10ef : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
15c2 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
15d2 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
15e2 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
10f8 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
1011 : ad 26 9f LDA $9f26 
1014 : 29 40 __ AND #$40
1016 : d0 f9 __ BNE $1011 ; (frame_wait.l1 + 0)
.l4:
1018 : ad 26 9f LDA $9f26 
101b : 29 40 __ AND #$40
101d : f0 f9 __ BEQ $1018 ; (frame_wait.l4 + 0)
.s1001:
101f : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1020 : 38 __ __ SEC
1021 : a9 00 __ LDA #$00
1023 : e5 3b __ SBC ACCU + 0 
1025 : 85 3b __ STA ACCU + 0 
1027 : a9 00 __ LDA #$00
1029 : e5 3c __ SBC ACCU + 1 
102b : 85 3c __ STA ACCU + 1 
102d : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
102e : 38 __ __ SEC
102f : a9 00 __ LDA #$00
1031 : e5 23 __ SBC WORK + 0 
1033 : 85 23 __ STA WORK + 0 
1035 : a9 00 __ LDA #$00
1037 : e5 24 __ SBC WORK + 1 
1039 : 85 24 __ STA WORK + 1 
103b : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
103c : a5 3c __ LDA ACCU + 1 
103e : d0 31 __ BNE $1071 ; (divmod + 53)
1040 : a5 24 __ LDA WORK + 1 
1042 : d0 1e __ BNE $1062 ; (divmod + 38)
1044 : 85 26 __ STA WORK + 3 
1046 : a2 04 __ LDX #$04
1048 : 06 3b __ ASL ACCU + 0 
104a : 2a __ __ ROL
104b : c5 23 __ CMP WORK + 0 
104d : 90 02 __ BCC $1051 ; (divmod + 21)
104f : e5 23 __ SBC WORK + 0 
1051 : 26 3b __ ROL ACCU + 0 
1053 : 2a __ __ ROL
1054 : c5 23 __ CMP WORK + 0 
1056 : 90 02 __ BCC $105a ; (divmod + 30)
1058 : e5 23 __ SBC WORK + 0 
105a : 26 3b __ ROL ACCU + 0 
105c : ca __ __ DEX
105d : d0 eb __ BNE $104a ; (divmod + 14)
105f : 85 25 __ STA WORK + 2 
1061 : 60 __ __ RTS
1062 : a5 3b __ LDA ACCU + 0 
1064 : 85 25 __ STA WORK + 2 
1066 : a5 3c __ LDA ACCU + 1 
1068 : 85 26 __ STA WORK + 3 
106a : a9 00 __ LDA #$00
106c : 85 3b __ STA ACCU + 0 
106e : 85 3c __ STA ACCU + 1 
1070 : 60 __ __ RTS
1071 : a5 24 __ LDA WORK + 1 
1073 : d0 1f __ BNE $1094 ; (divmod + 88)
1075 : a5 23 __ LDA WORK + 0 
1077 : 30 1b __ BMI $1094 ; (divmod + 88)
1079 : a9 00 __ LDA #$00
107b : 85 26 __ STA WORK + 3 
107d : a2 10 __ LDX #$10
107f : 06 3b __ ASL ACCU + 0 
1081 : 26 3c __ ROL ACCU + 1 
1083 : 2a __ __ ROL
1084 : c5 23 __ CMP WORK + 0 
1086 : 90 02 __ BCC $108a ; (divmod + 78)
1088 : e5 23 __ SBC WORK + 0 
108a : 26 3b __ ROL ACCU + 0 
108c : 26 3c __ ROL ACCU + 1 
108e : ca __ __ DEX
108f : d0 f2 __ BNE $1083 ; (divmod + 71)
1091 : 85 25 __ STA WORK + 2 
1093 : 60 __ __ RTS
1094 : a9 00 __ LDA #$00
1096 : 85 25 __ STA WORK + 2 
1098 : 85 26 __ STA WORK + 3 
109a : 84 22 __ STY $22 
109c : a0 10 __ LDY #$10
109e : 18 __ __ CLC
109f : 26 3b __ ROL ACCU + 0 
10a1 : 26 3c __ ROL ACCU + 1 
10a3 : 26 25 __ ROL WORK + 2 
10a5 : 26 26 __ ROL WORK + 3 
10a7 : 38 __ __ SEC
10a8 : a5 25 __ LDA WORK + 2 
10aa : e5 23 __ SBC WORK + 0 
10ac : aa __ __ TAX
10ad : a5 26 __ LDA WORK + 3 
10af : e5 24 __ SBC WORK + 1 
10b1 : 90 04 __ BCC $10b7 ; (divmod + 123)
10b3 : 86 25 __ STX WORK + 2 
10b5 : 85 26 __ STA WORK + 3 
10b7 : 88 __ __ DEY
10b8 : d0 e5 __ BNE $109f ; (divmod + 99)
10ba : 26 3b __ ROL ACCU + 0 
10bc : 26 3c __ ROL ACCU + 1 
10be : a4 22 __ LDY $22 
10c0 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
10c1 : 24 3c __ BIT ACCU + 1 
10c3 : 10 0d __ BPL $10d2 ; (mods16 + 17)
10c5 : 20 20 10 JSR $1020 ; (negaccu + 0)
10c8 : 24 24 __ BIT WORK + 1 
10ca : 10 0d __ BPL $10d9 ; (mods16 + 24)
10cc : 20 2e 10 JSR $102e ; (negtmp + 0)
10cf : 4c 3c 10 JMP $103c ; (divmod + 0)
10d2 : 24 24 __ BIT WORK + 1 
10d4 : 10 f9 __ BPL $10cf ; (mods16 + 14)
10d6 : 20 2e 10 JSR $102e ; (negtmp + 0)
10d9 : 20 3c 10 JSR $103c ; (divmod + 0)
10dc : 38 __ __ SEC
10dd : a9 00 __ LDA #$00
10df : e5 25 __ SBC WORK + 2 
10e1 : 85 25 __ STA WORK + 2 
10e3 : a9 00 __ LDA #$00
10e5 : e5 26 __ SBC WORK + 3 
10e7 : 85 26 __ STA WORK + 3 
10e9 : 60 __ __ RTS
