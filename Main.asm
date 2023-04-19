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
080e : 8e cb 10 STX $10cb ; (spentry + 0)
0811 : a9 cd __ LDA #$cd
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
0830 : a9 dd __ LDA #$dd
0832 : e9 cd __ SBC #$cd
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
10cb : __ __ __ BYT 00                                              : .
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
08be : 20 12 0e JSR $0e12 ; (zsm_check.s0 + 0)
08c1 : 09 00 __ ORA #$00
08c3 : f0 0b __ BEQ $08d0 ; (main.s6 + 0)
.s4:
08c5 : a9 83 __ LDA #$83
08c7 : 85 30 __ STA P3 
08c9 : a9 0f __ LDA #$0f
08cb : 85 31 __ STA P4 
08cd : 20 16 0e JSR $0e16 ; (zsm_init.s0 + 0)
.s6:
08d0 : a5 4b __ LDA T1 + 0 
08d2 : 85 2e __ STA P1 
08d4 : 20 a1 0f JSR $0fa1 ; (Control.s0 + 0)
08d7 : a5 3b __ LDA ACCU + 0 
08d9 : 85 4b __ STA T1 + 0 
08db : ad f0 10 LDA $10f0 ; (FrameCount + 0)
08de : 85 48 __ STA T3 + 0 
08e0 : 85 3b __ STA ACCU + 0 
08e2 : ad f1 10 LDA $10f1 ; (FrameCount + 1)
08e5 : 85 3c __ STA ACCU + 1 
08e7 : a9 04 __ LDA #$04
08e9 : 85 23 __ STA WORK + 0 
08eb : a9 00 __ LDA #$00
08ed : 85 24 __ STA WORK + 1 
08ef : 20 a2 10 JSR $10a2 ; (mods16 + 0)
08f2 : a5 26 __ LDA WORK + 3 
08f4 : d0 16 __ BNE $090c ; (main.s9 + 0)
.s1002:
08f6 : a5 25 __ LDA WORK + 2 
08f8 : c9 01 __ CMP #$01
08fa : d0 10 __ BNE $090c ; (main.s9 + 0)
.s7:
08fc : ae f9 10 LDX $10f9 ; (off1 + 0)
08ff : e8 __ __ INX
0900 : 8e f9 10 STX $10f9 ; (off1 + 0)
0903 : bd a1 15 LDA $15a1,x ; (palette + 31)
0906 : 38 __ __ SEC
0907 : e9 40 __ SBC #$40
0909 : 8d 23 9f STA $9f23 
.s9:
090c : 06 48 __ ASL T3 + 0 
090e : ad f1 10 LDA $10f1 ; (FrameCount + 1)
0911 : 2a __ __ ROL
0912 : 18 __ __ CLC
0913 : 69 ff __ ADC #$ff
0915 : 8d 38 9f STA $9f38 
0918 : a5 48 __ LDA T3 + 0 
091a : 8d 37 9f STA $9f37 
091d : a9 01 __ LDA #$01
091f : 8d 2c 9f STA $9f2c 
0922 : 20 b5 0e JSR $0eb5 ; (zsm_fill.s0 + 0)
0925 : a9 00 __ LDA #$00
0927 : 8d 2c 9f STA $9f2c 
092a : 20 f2 0f JSR $0ff2 ; (frame_wait.l1 + 0)
092d : ee f0 10 INC $10f0 ; (FrameCount + 0)
0930 : d0 87 __ BNE $08b9 ; (main.l2 + 0)
.s1003:
0932 : ee f1 10 INC $10f1 ; (FrameCount + 1)
0935 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0938 : 78 __ __ SEI
0939 : ad 14 03 LDA $0314 
093c : 8d f2 10 STA $10f2 ; (oirq + 0)
093f : ad 15 03 LDA $0315 
0942 : 8d f3 10 STA $10f3 ; (oirq + 1)
0945 : a9 51 __ LDA #$51
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : 58 __ __ CLI
.s1001:
0950 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
10f2 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0951 : 20 57 09 JSR $0957 ; (irq.s1000 + 0)
0954 : 6c f2 10 JMP ($10f2)
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
0981 : ad cc 10 LDA $10cc ; (zsm_playing + 0)
0984 : f0 08 __ BEQ $098e ; (irq.s1001 + 0)
.s4:
0986 : ad cd 10 LDA $10cd ; (zsm_finished + 0)
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
10cc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
10cd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b9 : ad f4 10 LDA $10f4 ; (zsm_delay + 0)
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
09dd : ad f5 10 LDA $10f5 ; (zsm_pos + 0)
09e0 : 85 4b __ STA T3 + 0 
09e2 : 18 __ __ CLC
09e3 : 69 01 __ ADC #$01
09e5 : 85 4d __ STA T4 + 0 
09e7 : 8d f5 10 STA $10f5 ; (zsm_pos + 0)
09ea : ad f6 10 LDA $10f6 ; (zsm_pos + 1)
09ed : aa __ __ TAX
09ee : 69 00 __ ADC #$00
09f0 : 85 4e __ STA T4 + 1 
09f2 : 8d f6 10 STA $10f6 ; (zsm_pos + 1)
09f5 : 18 __ __ CLC
09f6 : a9 cd __ LDA #$cd
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
0a11 : a9 cd __ LDA #$cd
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
0a26 : 8d f5 10 STA $10f5 ; (zsm_pos + 0)
0a29 : 98 __ __ TYA
0a2a : 65 4e __ ADC T4 + 1 
0a2c : 8d f6 10 STA $10f6 ; (zsm_pos + 1)
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
0a3f : a9 cd __ LDA #$cd
0a41 : 6d f5 10 ADC $10f5 ; (zsm_pos + 0)
0a44 : 85 4d __ STA T4 + 0 
0a46 : ad f6 10 LDA $10f6 ; (zsm_pos + 1)
0a49 : 29 03 __ AND #$03
0a4b : 69 15 __ ADC #$15
0a4d : 85 4e __ STA T4 + 1 
0a4f : a0 00 __ LDY #$00
0a51 : b1 4d __ LDA (T4 + 0),y 
0a53 : 85 2d __ STA P0 
0a55 : ad f5 10 LDA $10f5 ; (zsm_pos + 0)
0a58 : 18 __ __ CLC
0a59 : 69 01 __ ADC #$01
0a5b : aa __ __ TAX
0a5c : ad f6 10 LDA $10f6 ; (zsm_pos + 1)
0a5f : 69 00 __ ADC #$00
0a61 : 29 03 __ AND #$03
0a63 : 85 4c __ STA T3 + 1 
0a65 : 8a __ __ TXA
0a66 : 18 __ __ CLC
0a67 : 69 cd __ ADC #$cd
0a69 : 85 4b __ STA T3 + 0 
0a6b : a9 15 __ LDA #$15
0a6d : 65 4c __ ADC T3 + 1 
0a6f : 85 4c __ STA T3 + 1 
0a71 : b1 4b __ LDA (T3 + 0),y 
0a73 : 85 2e __ STA P1 
0a75 : 20 f2 0a JSR $0af2 ; (sfx_put.l1 + 0)
0a78 : ad f5 10 LDA $10f5 ; (zsm_pos + 0)
0a7b : 18 __ __ CLC
0a7c : 69 02 __ ADC #$02
0a7e : 8d f5 10 STA $10f5 ; (zsm_pos + 0)
0a81 : 90 03 __ BCC $0a86 ; (zsm_play.s1015 + 0)
.s1014:
0a83 : ee f6 10 INC $10f6 ; (zsm_pos + 1)
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
0a97 : 8d cd 10 STA $10cd ; (zsm_finished + 0)
0a9a : d0 08 __ BNE $0aa4 ; (zsm_play.s7 + 0)
.s22:
0a9c : 29 7f __ AND #$7f
0a9e : 38 __ __ SEC
0a9f : e9 01 __ SBC #$01
0aa1 : 8d f4 10 STA $10f4 ; (zsm_delay + 0)
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
0ace : 8d f5 10 STA $10f5 ; (zsm_pos + 0)
0ad1 : 90 01 __ BCC $0ad4 ; (zsm_play.s1017 + 0)
.s1016:
0ad3 : e8 __ __ INX
.s1017:
0ad4 : 8e f6 10 STX $10f6 ; (zsm_pos + 1)
0ad7 : 18 __ __ CLC
0ad8 : a9 cd __ LDA #$cd
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
0aee : ce f4 10 DEC $10f4 ; (zsm_delay + 0)
0af1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
10f4 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
15cd : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
10f5 : __ __ __ BSS	2
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
0b7e : ad 25 9f LDA $9f25 
0b81 : 29 fe __ AND #$fe
0b83 : 8d 25 9f STA $9f25 
0b86 : a9 00 __ LDA #$00
0b88 : 8d 20 9f STA $9f20 
0b8b : 8d 21 9f STA $9f21 
0b8e : a9 10 __ LDA #$10
0b90 : 8d 22 9f STA $9f22 
0b93 : a9 00 __ LDA #$00
0b95 : 85 31 __ STA P4 
0b97 : a9 11 __ LDA #$11
0b99 : 85 32 __ STA P5 
0b9b : 20 1a 0d JSR $0d1a ; (vram_putn.s0 + 0)
0b9e : a9 00 __ LDA #$00
0ba0 : 85 3b __ STA ACCU + 0 
.l10:
0ba2 : a2 3c __ LDX #$3c
.l1016:
0ba4 : a9 01 __ LDA #$01
0ba6 : 8d 23 9f STA $9f23 
0ba9 : a9 00 __ LDA #$00
0bab : 8d 23 9f STA $9f23 
0bae : ca __ __ DEX
0baf : d0 f3 __ BNE $0ba4 ; (SetUpSprites.l1016 + 0)
.l190:
0bb1 : e6 3b __ INC ACCU + 0 
0bb3 : a5 3b __ LDA ACCU + 0 
0bb5 : c9 20 __ CMP #$20
0bb7 : b0 44 __ BCS $0bfd ; (SetUpSprites.s5 + 0)
.s3:
0bb9 : c9 05 __ CMP #$05
0bbb : 90 e5 __ BCC $0ba2 ; (SetUpSprites.l10 + 0)
.s1008:
0bbd : a9 08 __ LDA #$08
0bbf : c5 3b __ CMP ACCU + 0 
0bc1 : 90 12 __ BCC $0bd5 ; (SetUpSprites.s1007 + 0)
.s18:
0bc3 : a2 3c __ LDX #$3c
.l1014:
0bc5 : a9 02 __ LDA #$02
0bc7 : 8d 23 9f STA $9f23 
0bca : a9 00 __ LDA #$00
0bcc : 8d 23 9f STA $9f23 
0bcf : ca __ __ DEX
0bd0 : d0 f3 __ BNE $0bc5 ; (SetUpSprites.l1014 + 0)
0bd2 : 4c b1 0b JMP $0bb1 ; (SetUpSprites.l190 + 0)
.s1007:
0bd5 : a9 10 __ LDA #$10
0bd7 : c5 3b __ CMP ACCU + 0 
0bd9 : a0 3c __ LDY #$3c
0bdb : b0 10 __ BCS $0bed ; (SetUpSprites.l1012 + 0)
.l1010:
0bdd : a9 04 __ LDA #$04
0bdf : 8d 23 9f STA $9f23 
0be2 : a9 00 __ LDA #$00
0be4 : 8d 23 9f STA $9f23 
0be7 : 88 __ __ DEY
0be8 : d0 f3 __ BNE $0bdd ; (SetUpSprites.l1010 + 0)
0bea : 4c b1 0b JMP $0bb1 ; (SetUpSprites.l190 + 0)
.l1012:
0bed : a9 03 __ LDA #$03
0bef : 8d 23 9f STA $9f23 
0bf2 : a9 00 __ LDA #$00
0bf4 : 8d 23 9f STA $9f23 
0bf7 : 88 __ __ DEY
0bf8 : d0 f3 __ BNE $0bed ; (SetUpSprites.l1012 + 0)
0bfa : 4c b1 0b JMP $0bb1 ; (SetUpSprites.l190 + 0)
.s5:
0bfd : a9 20 __ LDA #$20
0bff : 85 37 __ STA P10 
0c01 : 8d fc 9e STA $9efc ; (sstack + 0)
0c04 : a9 fb __ LDA #$fb
0c06 : 8d fd 9e STA $9efd ; (sstack + 1)
0c09 : a9 01 __ LDA #$01
0c0b : 8d fe 9e STA $9efe ; (sstack + 2)
0c0e : a9 00 __ LDA #$00
0c10 : 8d ff 9e STA $9eff ; (sstack + 3)
0c13 : a9 ce __ LDA #$ce
0c15 : 85 35 __ STA P8 
0c17 : a9 10 __ LDA #$10
0c19 : 85 36 __ STA P9 
0c1b : 20 55 0d JSR $0d55 ; (SetPaletteColours.s0 + 0)
0c1e : a9 00 __ LDA #$00
0c20 : 85 2d __ STA P0 
0c22 : 85 30 __ STA P3 
0c24 : 85 33 __ STA P6 
0c26 : a9 32 __ LDA #$32
0c28 : 85 2e __ STA P1 
0c2a : a9 01 __ LDA #$01
0c2c : 85 2f __ STA P2 
0c2e : a9 02 __ LDA #$02
0c30 : 85 34 __ STA P7 
0c32 : a9 82 __ LDA #$82
0c34 : 85 31 __ STA P4 
0c36 : a9 11 __ LDA #$11
0c38 : 85 32 __ STA P5 
0c3a : 20 1a 0d JSR $0d1a ; (vram_putn.s0 + 0)
0c3d : a9 30 __ LDA #$30
0c3f : 85 2e __ STA P1 
0c41 : a9 02 __ LDA #$02
0c43 : 85 34 __ STA P7 
0c45 : a9 82 __ LDA #$82
0c47 : 85 31 __ STA P4 
0c49 : a9 13 __ LDA #$13
0c4b : 85 32 __ STA P5 
0c4d : 20 1a 0d JSR $0d1a ; (vram_putn.s0 + 0)
0c50 : a9 17 __ LDA #$17
0c52 : 85 2d __ STA P0 
0c54 : a9 80 __ LDA #$80
0c56 : 85 2e __ STA P1 
0c58 : a9 09 __ LDA #$09
0c5a : 85 2f __ STA P2 
0c5c : a9 02 __ LDA #$02
0c5e : 85 31 __ STA P4 
0c60 : 85 32 __ STA P5 
0c62 : a9 03 __ LDA #$03
0c64 : 85 33 __ STA P6 
0c66 : a9 01 __ LDA #$01
0c68 : 85 34 __ STA P7 
0c6a : 20 7c 0d JSR $0d7c ; (vera_spr_set.s0 + 0)
0c6d : a9 1a __ LDA #$1a
0c6f : 85 2e __ STA P1 
0c71 : a9 01 __ LDA #$01
0c73 : 85 2f __ STA P2 
0c75 : 85 31 __ STA P4 
0c77 : a9 b8 __ LDA #$b8
0c79 : 85 30 __ STA P3 
0c7b : 20 d9 0d JSR $0dd9 ; (vera_spr_move.s0 + 0)
0c7e : a9 00 __ LDA #$00
0c80 : 85 49 __ STA T4 + 0 
0c82 : 85 4a __ STA T4 + 1 
.l34:
0c84 : 85 2d __ STA P0 
0c86 : 18 __ __ CLC
0c87 : 69 02 __ ADC #$02
0c89 : 85 47 __ STA T3 + 0 
0c8b : a9 00 __ LDA #$00
0c8d : 2a __ __ ROL
0c8e : 85 48 __ STA T3 + 1 
0c90 : a9 90 __ LDA #$90
0c92 : 85 2e __ STA P1 
0c94 : a9 09 __ LDA #$09
0c96 : 85 2f __ STA P2 
0c98 : a9 00 __ LDA #$00
0c9a : 85 30 __ STA P3 
0c9c : a9 03 __ LDA #$03
0c9e : 85 31 __ STA P4 
0ca0 : a9 01 __ LDA #$01
0ca2 : 85 32 __ STA P5 
0ca4 : 20 7c 0d JSR $0d7c ; (vera_spr_set.s0 + 0)
0ca7 : a5 49 __ LDA T4 + 0 
0ca9 : 85 2e __ STA P1 
0cab : a5 4a __ LDA T4 + 1 
0cad : 85 2f __ STA P2 
0caf : a9 a0 __ LDA #$a0
0cb1 : 85 30 __ STA P3 
0cb3 : a9 01 __ LDA #$01
0cb5 : 85 31 __ STA P4 
0cb7 : 20 d9 0d JSR $0dd9 ; (vera_spr_move.s0 + 0)
0cba : a9 90 __ LDA #$90
0cbc : 85 2e __ STA P1 
0cbe : a9 09 __ LDA #$09
0cc0 : 85 2f __ STA P2 
0cc2 : a9 00 __ LDA #$00
0cc4 : 85 30 __ STA P3 
0cc6 : a9 03 __ LDA #$03
0cc8 : 85 31 __ STA P4 
0cca : e6 2d __ INC P0 
0ccc : 20 7c 0d JSR $0d7c ; (vera_spr_set.s0 + 0)
0ccf : a5 49 __ LDA T4 + 0 
0cd1 : 85 2e __ STA P1 
0cd3 : a5 4a __ LDA T4 + 1 
0cd5 : 85 2f __ STA P2 
0cd7 : a9 70 __ LDA #$70
0cd9 : 85 30 __ STA P3 
0cdb : a9 01 __ LDA #$01
0cdd : 85 31 __ STA P4 
0cdf : 20 d9 0d JSR $0dd9 ; (vera_spr_move.s0 + 0)
0ce2 : a5 48 __ LDA T3 + 1 
0ce4 : d0 13 __ BNE $0cf9 ; (SetUpSprites.s36 + 0)
.s1004:
0ce6 : 18 __ __ CLC
0ce7 : a5 2e __ LDA P1 
0ce9 : 69 40 __ ADC #$40
0ceb : 85 49 __ STA T4 + 0 
0ced : a5 2f __ LDA P2 
0cef : 69 00 __ ADC #$00
0cf1 : 85 4a __ STA T4 + 1 
0cf3 : a5 47 __ LDA T3 + 0 
0cf5 : c9 16 __ CMP #$16
0cf7 : 90 8b __ BCC $0c84 ; (SetUpSprites.l34 + 0)
.s36:
0cf9 : a9 20 __ LDA #$20
0cfb : 85 37 __ STA P10 
0cfd : 8d fc 9e STA $9efc ; (sstack + 0)
0d00 : a9 fa __ LDA #$fa
0d02 : 8d fd 9e STA $9efd ; (sstack + 1)
0d05 : a9 01 __ LDA #$01
0d07 : 8d fe 9e STA $9efe ; (sstack + 2)
0d0a : a9 00 __ LDA #$00
0d0c : 8d ff 9e STA $9eff ; (sstack + 3)
0d0f : a9 82 __ LDA #$82
0d11 : 85 35 __ STA P8 
0d13 : a9 15 __ LDA #$15
0d15 : 85 36 __ STA P9 
0d17 : 4c 55 0d JMP $0d55 ; (SetPaletteColours.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0d1a : ad 25 9f LDA $9f25 
0d1d : 29 fe __ AND #$fe
0d1f : 8d 25 9f STA $9f25 
0d22 : a5 2d __ LDA P0 ; (addr + 0)
0d24 : 8d 20 9f STA $9f20 
0d27 : a5 2e __ LDA P1 ; (addr + 1)
0d29 : 8d 21 9f STA $9f21 
0d2c : a5 2f __ LDA P2 ; (addr + 2)
0d2e : 29 01 __ AND #$01
0d30 : 09 10 __ ORA #$10
0d32 : 8d 22 9f STA $9f22 
0d35 : a5 33 __ LDA P6 ; (size + 0)
0d37 : 05 34 __ ORA P7 ; (size + 1)
0d39 : f0 19 __ BEQ $0d54 ; (vram_putn.s1001 + 0)
.s6:
0d3b : a0 00 __ LDY #$00
0d3d : a6 33 __ LDX P6 ; (size + 0)
0d3f : f0 02 __ BEQ $0d43 ; (vram_putn.l1002 + 0)
.s1005:
0d41 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0d43 : b1 31 __ LDA (P4),y ; (data + 0)
0d45 : 8d 23 9f STA $9f23 
0d48 : c8 __ __ INY
0d49 : d0 02 __ BNE $0d4d ; (vram_putn.s1009 + 0)
.s1008:
0d4b : e6 32 __ INC P5 ; (data + 1)
.s1009:
0d4d : ca __ __ DEX
0d4e : d0 f3 __ BNE $0d43 ; (vram_putn.l1002 + 0)
.s1004:
0d50 : c6 34 __ DEC P7 ; (size + 1)
0d52 : d0 ef __ BNE $0d43 ; (vram_putn.l1002 + 0)
.s1001:
0d54 : 60 __ __ RTS
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
0d55 : ad fc 9e LDA $9efc ; (sstack + 0)
0d58 : 85 2d __ STA P0 
0d5a : ad fd 9e LDA $9efd ; (sstack + 1)
0d5d : 85 2e __ STA P1 
0d5f : ad fe 9e LDA $9efe ; (sstack + 2)
0d62 : 85 2f __ STA P2 
0d64 : ad ff 9e LDA $9eff ; (sstack + 3)
0d67 : 85 30 __ STA P3 
0d69 : a5 35 __ LDA P8 ; (input + 0)
0d6b : 85 31 __ STA P4 
0d6d : a5 36 __ LDA P9 ; (input + 1)
0d6f : 85 32 __ STA P5 
0d71 : a5 37 __ LDA P10 ; (inputsize + 0)
0d73 : 85 33 __ STA P6 
0d75 : a9 00 __ LDA #$00
0d77 : 85 34 __ STA P7 
0d79 : 4c 1a 0d JMP $0d1a ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
10ce : __ __ __ BYT 00 00 11 01 22 02 33 03 44 04 55 05 66 06 77 07 : ....".3.D.U.f.w.
10de : __ __ __ BYT 88 08 99 09 aa 0a bb 0b cc 0c dd 0d ee 0e ff 0f : ................
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
0d7c : ad 25 9f LDA $9f25 
0d7f : 29 fe __ AND #$fe
0d81 : 8d 25 9f STA $9f25 
0d84 : a5 2d __ LDA P0 ; (spr + 0)
0d86 : 0a __ __ ASL
0d87 : 0a __ __ ASL
0d88 : 85 3b __ STA ACCU + 0 
0d8a : a9 3f __ LDA #$3f
0d8c : 2a __ __ ROL
0d8d : 06 3b __ ASL ACCU + 0 
0d8f : 2a __ __ ROL
0d90 : 8d 21 9f STA $9f21 
0d93 : a5 3b __ LDA ACCU + 0 
0d95 : 8d 20 9f STA $9f20 
0d98 : a9 11 __ LDA #$11
0d9a : 8d 22 9f STA $9f22 
0d9d : a5 30 __ LDA P3 ; (mode8 + 0)
0d9f : f0 02 __ BEQ $0da3 ; (vera_spr_set.s11 + 0)
.s9:
0da1 : a9 80 __ LDA #$80
.s11:
0da3 : 05 2f __ ORA P2 ; (addr32 + 1)
0da5 : a6 2e __ LDX P1 ; (addr32 + 0)
0da7 : 8e 23 9f STX $9f23 
0daa : 8d 23 9f STA $9f23 
0dad : a9 00 __ LDA #$00
0daf : 8d 23 9f STA $9f23 
0db2 : 8d 23 9f STA $9f23 
0db5 : 8d 23 9f STA $9f23 
0db8 : 8d 23 9f STA $9f23 
0dbb : a5 33 __ LDA P6 ; (z + 0)
0dbd : 0a __ __ ASL
0dbe : 0a __ __ ASL
0dbf : 8d 23 9f STA $9f23 
0dc2 : a5 32 __ LDA P5 ; (h + 0)
0dc4 : 4a __ __ LSR
0dc5 : 6a __ __ ROR
0dc6 : 29 80 __ AND #$80
0dc8 : 6a __ __ ROR
0dc9 : 85 3b __ STA ACCU + 0 
0dcb : a5 31 __ LDA P4 ; (w + 0)
0dcd : 0a __ __ ASL
0dce : 0a __ __ ASL
0dcf : 0a __ __ ASL
0dd0 : 0a __ __ ASL
0dd1 : 05 3b __ ORA ACCU + 0 
0dd3 : 05 34 __ ORA P7 ; (pal + 0)
0dd5 : 8d 23 9f STA $9f23 
.s1001:
0dd8 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0dd9 : ad 25 9f LDA $9f25 
0ddc : 29 fe __ AND #$fe
0dde : 8d 25 9f STA $9f25 
0de1 : a5 2d __ LDA P0 ; (spr + 0)
0de3 : 0a __ __ ASL
0de4 : 0a __ __ ASL
0de5 : 85 3b __ STA ACCU + 0 
0de7 : a9 3f __ LDA #$3f
0de9 : 2a __ __ ROL
0dea : 06 3b __ ASL ACCU + 0 
0dec : 2a __ __ ROL
0ded : aa __ __ TAX
0dee : a5 3b __ LDA ACCU + 0 
0df0 : 09 02 __ ORA #$02
0df2 : 8d 20 9f STA $9f20 
0df5 : 8e 21 9f STX $9f21 
0df8 : a9 11 __ LDA #$11
0dfa : 8d 22 9f STA $9f22 
0dfd : a5 2e __ LDA P1 ; (x + 0)
0dff : 8d 23 9f STA $9f23 
0e02 : a5 2f __ LDA P2 ; (x + 1)
0e04 : 8d 23 9f STA $9f23 
0e07 : a5 30 __ LDA P3 ; (y + 0)
0e09 : 8d 23 9f STA $9f23 
0e0c : a5 31 __ LDA P4 ; (y + 1)
0e0e : 8d 23 9f STA $9f23 
.s1001:
0e11 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
1582 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
1592 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0e12 : ad cd 10 LDA $10cd ; (zsm_finished + 0)
.s1001:
0e15 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0e16 : a9 01 __ LDA #$01
0e18 : 8d cd 10 STA $10cd ; (zsm_finished + 0)
0e1b : ad ee 10 LDA $10ee ; (zsm_reading + 0)
0e1e : f0 0a __ BEQ $0e2a ; (zsm_init.s3 + 0)
.s1:
0e20 : a9 02 __ LDA #$02
0e22 : 20 6f 0e JSR $0e6f ; (krnio_close.s1000 + 0)
0e25 : a9 00 __ LDA #$00
0e27 : 8d ee 10 STA $10ee ; (zsm_reading + 0)
.s3:
0e2a : 8d f5 10 STA $10f5 ; (zsm_pos + 0)
0e2d : 8d f6 10 STA $10f6 ; (zsm_pos + 1)
0e30 : 8d f7 10 STA $10f7 ; (zsm_wpos + 0)
0e33 : 8d f8 10 STA $10f8 ; (zsm_wpos + 1)
0e36 : 8d f4 10 STA $10f4 ; (zsm_delay + 0)
0e39 : a5 30 __ LDA P3 ; (fname + 0)
0e3b : 85 2d __ STA P0 
0e3d : a5 31 __ LDA P4 ; (fname + 1)
0e3f : 85 2e __ STA P1 
0e41 : 20 77 0e JSR $0e77 ; (krnio_setnam.s0 + 0)
0e44 : a9 02 __ LDA #$02
0e46 : 85 2d __ STA P0 
0e48 : 85 2f __ STA P2 
0e4a : a9 08 __ LDA #$08
0e4c : 85 2e __ STA P1 
0e4e : 20 8d 0e JSR $0e8d ; (krnio_open.s0 + 0)
0e51 : a5 3b __ LDA ACCU + 0 
0e53 : f0 19 __ BEQ $0e6e ; (zsm_init.s1001 + 0)
.s4:
0e55 : a9 01 __ LDA #$01
0e57 : 8d ee 10 STA $10ee ; (zsm_reading + 0)
0e5a : 20 b5 0e JSR $0eb5 ; (zsm_fill.s0 + 0)
0e5d : a9 10 __ LDA #$10
0e5f : 8d f5 10 STA $10f5 ; (zsm_pos + 0)
0e62 : a9 00 __ LDA #$00
0e64 : 8d f6 10 STA $10f6 ; (zsm_pos + 1)
0e67 : 8d cd 10 STA $10cd ; (zsm_finished + 0)
0e6a : a9 01 __ LDA #$01
0e6c : 85 3b __ STA ACCU + 0 
.s1001:
0e6e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
10ee : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0e6f : 85 2d __ STA P0 
.s0:
0e71 : a5 2d __ LDA P0 
0e73 : 20 c3 ff JSR $ffc3 
.s1001:
0e76 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
10f7 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0e77 : a5 2d __ LDA P0 
0e79 : 05 2e __ ORA P1 
0e7b : f0 08 __ BEQ $0e85 ; (krnio_setnam.s0 + 14)
0e7d : a0 ff __ LDY #$ff
0e7f : c8 __ __ INY
0e80 : b1 2d __ LDA (P0),y 
0e82 : d0 fb __ BNE $0e7f ; (krnio_setnam.s0 + 8)
0e84 : 98 __ __ TYA
0e85 : a6 2d __ LDX P0 
0e87 : a4 2e __ LDY P1 
0e89 : 20 bd ff JSR $ffbd 
.s1001:
0e8c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0e8d : a9 00 __ LDA #$00
0e8f : a6 2d __ LDX P0 ; (fnum + 0)
0e91 : 9d cd 19 STA $19cd,x ; (krnio_pstatus + 0)
0e94 : a9 00 __ LDA #$00
0e96 : 85 3b __ STA ACCU + 0 
0e98 : 85 3c __ STA ACCU + 1 
0e9a : a5 2d __ LDA P0 ; (fnum + 0)
0e9c : a6 2e __ LDX P1 
0e9e : a4 2f __ LDY P2 
0ea0 : 20 ba ff JSR $ffba 
0ea3 : 20 c0 ff JSR $ffc0 
0ea6 : 90 08 __ BCC $0eb0 ; (krnio_open.s0 + 35)
0ea8 : a5 2d __ LDA P0 ; (fnum + 0)
0eaa : 20 c3 ff JSR $ffc3 
0ead : 4c b4 0e JMP $0eb4 ; (krnio_open.s1001 + 0)
0eb0 : a9 01 __ LDA #$01
0eb2 : 85 3b __ STA ACCU + 0 
.s1001:
0eb4 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
19cd : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0eb5 : ad ee 10 LDA $10ee ; (zsm_reading + 0)
0eb8 : f0 20 __ BEQ $0eda ; (zsm_fill.s1 + 0)
.s2:
0eba : ad f6 10 LDA $10f6 ; (zsm_pos + 1)
0ebd : 18 __ __ CLC
0ebe : 69 04 __ ADC #$04
0ec0 : cd f8 10 CMP $10f8 ; (zsm_wpos + 1)
0ec3 : d0 0c __ BNE $0ed1 ; (zsm_fill.s6 + 0)
.s1006:
0ec5 : ad f7 10 LDA $10f7 ; (zsm_wpos + 0)
0ec8 : cd f5 10 CMP $10f5 ; (zsm_pos + 0)
0ecb : d0 04 __ BNE $0ed1 ; (zsm_fill.s6 + 0)
.s5:
0ecd : a9 00 __ LDA #$00
0ecf : f0 0b __ BEQ $0edc ; (zsm_fill.s1008 + 0)
.s6:
0ed1 : a9 02 __ LDA #$02
0ed3 : 20 59 0f JSR $0f59 ; (krnio_chkin.s1000 + 0)
0ed6 : a5 3b __ LDA ACCU + 0 
0ed8 : d0 07 __ BNE $0ee1 ; (zsm_fill.s9 + 0)
.s1:
0eda : a9 ff __ LDA #$ff
.s1008:
0edc : 85 3b __ STA ACCU + 0 
.s1001:
0ede : 85 3c __ STA ACCU + 1 
0ee0 : 60 __ __ RTS
.s9:
0ee1 : a9 00 __ LDA #$00
0ee3 : 85 47 __ STA T1 + 0 
0ee5 : 85 48 __ STA T1 + 1 
0ee7 : ad f6 10 LDA $10f6 ; (zsm_pos + 1)
0eea : 18 __ __ CLC
0eeb : 69 04 __ ADC #$04
0eed : cd f8 10 CMP $10f8 ; (zsm_wpos + 1)
0ef0 : d0 08 __ BNE $0efa ; (zsm_fill.l13 + 0)
.s1002:
0ef2 : ad f7 10 LDA $10f7 ; (zsm_wpos + 0)
0ef5 : cd f5 10 CMP $10f5 ; (zsm_pos + 0)
0ef8 : f0 49 __ BEQ $0f43 ; (zsm_fill.s37 + 0)
.l13:
0efa : 20 6b 0f JSR $0f6b ; (krnio_chrin.s0 + 0)
0efd : ad f7 10 LDA $10f7 ; (zsm_wpos + 0)
0f00 : aa __ __ TAX
0f01 : 18 __ __ CLC
0f02 : 69 01 __ ADC #$01
0f04 : 8d f7 10 STA $10f7 ; (zsm_wpos + 0)
0f07 : ad f8 10 LDA $10f8 ; (zsm_wpos + 1)
0f0a : a8 __ __ TAY
0f0b : 69 00 __ ADC #$00
0f0d : 8d f8 10 STA $10f8 ; (zsm_wpos + 1)
0f10 : 8a __ __ TXA
0f11 : 18 __ __ CLC
0f12 : 69 cd __ ADC #$cd
0f14 : 85 49 __ STA T3 + 0 
0f16 : 98 __ __ TYA
0f17 : 29 03 __ AND #$03
0f19 : 69 15 __ ADC #$15
0f1b : 85 4a __ STA T3 + 1 
0f1d : a5 3b __ LDA ACCU + 0 
0f1f : a0 00 __ LDY #$00
0f21 : 91 49 __ STA (T3 + 0),y 
0f23 : e6 47 __ INC T1 + 0 
0f25 : d0 02 __ BNE $0f29 ; (zsm_fill.s1010 + 0)
.s1009:
0f27 : e6 48 __ INC T1 + 1 
.s1010:
0f29 : 20 75 0f JSR $0f75 ; (krnio_status.s0 + 0)
0f2c : a5 3b __ LDA ACCU + 0 
0f2e : d0 0e __ BNE $0f3e ; (zsm_fill.s15 + 0)
.s12:
0f30 : ad f6 10 LDA $10f6 ; (zsm_pos + 1)
0f33 : 18 __ __ CLC
0f34 : 69 04 __ ADC #$04
0f36 : cd f8 10 CMP $10f8 ; (zsm_wpos + 1)
0f39 : d0 bf __ BNE $0efa ; (zsm_fill.l13 + 0)
0f3b : 4c f2 0e JMP $0ef2 ; (zsm_fill.s1002 + 0)
.s15:
0f3e : a9 00 __ LDA #$00
0f40 : 8d ee 10 STA $10ee ; (zsm_reading + 0)
.s37:
0f43 : 20 7f 0f JSR $0f7f ; (krnio_clrchn.s0 + 0)
0f46 : ad ee 10 LDA $10ee ; (zsm_reading + 0)
0f49 : d0 05 __ BNE $0f50 ; (zsm_fill.s21 + 0)
.s19:
0f4b : a9 02 __ LDA #$02
0f4d : 20 6f 0e JSR $0e6f ; (krnio_close.s1000 + 0)
.s21:
0f50 : a5 47 __ LDA T1 + 0 
0f52 : 85 3b __ STA ACCU + 0 
0f54 : a5 48 __ LDA T1 + 1 
0f56 : 4c de 0e JMP $0ede ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0f59 : 85 2d __ STA P0 
.s0:
0f5b : a6 2d __ LDX P0 
0f5d : 20 c6 ff JSR $ffc6 
0f60 : a9 00 __ LDA #$00
0f62 : 85 3c __ STA ACCU + 1 
0f64 : b0 02 __ BCS $0f68 ; (krnio_chkin.s0 + 13)
0f66 : a9 01 __ LDA #$01
0f68 : 85 3b __ STA ACCU + 0 
.s1001:
0f6a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0f6b : 20 cf ff JSR $ffcf 
0f6e : 85 3b __ STA ACCU + 0 
0f70 : a9 00 __ LDA #$00
0f72 : 85 3c __ STA ACCU + 1 
.s1001:
0f74 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0f75 : 20 b7 ff JSR $ffb7 
0f78 : 85 3b __ STA ACCU + 0 
0f7a : a9 00 __ LDA #$00
0f7c : 85 3c __ STA ACCU + 1 
.s1001:
0f7e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0f7f : 20 cc ff JSR $ffcc 
.s1001:
0f82 : 60 __ __ RTS
--------------------------------------------------------------------
0f83 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0f93 : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0fa1 : 20 bd 0f JSR $0fbd ; (getchx.s0 + 0)
0fa4 : a5 3c __ LDA ACCU + 1 
0fa6 : d0 10 __ BNE $0fb8 ; (Control.s3 + 0)
.s1005:
0fa8 : a5 3b __ LDA ACCU + 0 
0faa : c9 20 __ CMP #$20
0fac : d0 0a __ BNE $0fb8 ; (Control.s3 + 0)
.s1:
0fae : a9 00 __ LDA #$00
0fb0 : c5 2e __ CMP P1 ; (playing + 0)
0fb2 : 2a __ __ ROL
0fb3 : 85 2e __ STA P1 ; (playing + 0)
0fb5 : 20 ee 0f JSR $0fee ; (zsm_irq_play.s0 + 0)
.s3:
0fb8 : a5 2e __ LDA P1 ; (playing + 0)
0fba : 85 3b __ STA ACCU + 0 
.s1001:
0fbc : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0fbd : 20 c7 0f JSR $0fc7 ; (getpch + 0)
0fc0 : 85 3b __ STA ACCU + 0 
0fc2 : a9 00 __ LDA #$00
0fc4 : 85 3c __ STA ACCU + 1 
.s1001:
0fc6 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0fc7 : 20 e4 ff JSR $ffe4 
0fca : ae ef 10 LDX $10ef ; (giocharmap + 0)
0fcd : e0 01 __ CPX #$01
0fcf : 90 1c __ BCC $0fed ; (getpch + 38)
0fd1 : c9 0d __ CMP #$0d
0fd3 : d0 02 __ BNE $0fd7 ; (getpch + 16)
0fd5 : a9 0a __ LDA #$0a
0fd7 : e0 02 __ CPX #$02
0fd9 : 90 12 __ BCC $0fed ; (getpch + 38)
0fdb : c9 41 __ CMP #$41
0fdd : 90 0e __ BCC $0fed ; (getpch + 38)
0fdf : c9 7b __ CMP #$7b
0fe1 : b0 0a __ BCS $0fed ; (getpch + 38)
0fe3 : c9 61 __ CMP #$61
0fe5 : b0 04 __ BCS $0feb ; (getpch + 36)
0fe7 : c9 5b __ CMP #$5b
0fe9 : b0 02 __ BCS $0fed ; (getpch + 38)
0feb : 49 20 __ EOR #$20
0fed : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
10ef : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0fee : 8d cc 10 STA $10cc ; (zsm_playing + 0)
.s1001:
0ff1 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
10f0 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
15a2 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
15b2 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
15c2 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
10f9 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0ff2 : ad 26 9f LDA $9f26 
0ff5 : 29 40 __ AND #$40
0ff7 : d0 f9 __ BNE $0ff2 ; (frame_wait.l1 + 0)
.l4:
0ff9 : ad 26 9f LDA $9f26 
0ffc : 29 40 __ AND #$40
0ffe : f0 f9 __ BEQ $0ff9 ; (frame_wait.l4 + 0)
.s1001:
1000 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1001 : 38 __ __ SEC
1002 : a9 00 __ LDA #$00
1004 : e5 3b __ SBC ACCU + 0 
1006 : 85 3b __ STA ACCU + 0 
1008 : a9 00 __ LDA #$00
100a : e5 3c __ SBC ACCU + 1 
100c : 85 3c __ STA ACCU + 1 
100e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
100f : 38 __ __ SEC
1010 : a9 00 __ LDA #$00
1012 : e5 23 __ SBC WORK + 0 
1014 : 85 23 __ STA WORK + 0 
1016 : a9 00 __ LDA #$00
1018 : e5 24 __ SBC WORK + 1 
101a : 85 24 __ STA WORK + 1 
101c : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
101d : a5 3c __ LDA ACCU + 1 
101f : d0 31 __ BNE $1052 ; (divmod + 53)
1021 : a5 24 __ LDA WORK + 1 
1023 : d0 1e __ BNE $1043 ; (divmod + 38)
1025 : 85 26 __ STA WORK + 3 
1027 : a2 04 __ LDX #$04
1029 : 06 3b __ ASL ACCU + 0 
102b : 2a __ __ ROL
102c : c5 23 __ CMP WORK + 0 
102e : 90 02 __ BCC $1032 ; (divmod + 21)
1030 : e5 23 __ SBC WORK + 0 
1032 : 26 3b __ ROL ACCU + 0 
1034 : 2a __ __ ROL
1035 : c5 23 __ CMP WORK + 0 
1037 : 90 02 __ BCC $103b ; (divmod + 30)
1039 : e5 23 __ SBC WORK + 0 
103b : 26 3b __ ROL ACCU + 0 
103d : ca __ __ DEX
103e : d0 eb __ BNE $102b ; (divmod + 14)
1040 : 85 25 __ STA WORK + 2 
1042 : 60 __ __ RTS
1043 : a5 3b __ LDA ACCU + 0 
1045 : 85 25 __ STA WORK + 2 
1047 : a5 3c __ LDA ACCU + 1 
1049 : 85 26 __ STA WORK + 3 
104b : a9 00 __ LDA #$00
104d : 85 3b __ STA ACCU + 0 
104f : 85 3c __ STA ACCU + 1 
1051 : 60 __ __ RTS
1052 : a5 24 __ LDA WORK + 1 
1054 : d0 1f __ BNE $1075 ; (divmod + 88)
1056 : a5 23 __ LDA WORK + 0 
1058 : 30 1b __ BMI $1075 ; (divmod + 88)
105a : a9 00 __ LDA #$00
105c : 85 26 __ STA WORK + 3 
105e : a2 10 __ LDX #$10
1060 : 06 3b __ ASL ACCU + 0 
1062 : 26 3c __ ROL ACCU + 1 
1064 : 2a __ __ ROL
1065 : c5 23 __ CMP WORK + 0 
1067 : 90 02 __ BCC $106b ; (divmod + 78)
1069 : e5 23 __ SBC WORK + 0 
106b : 26 3b __ ROL ACCU + 0 
106d : 26 3c __ ROL ACCU + 1 
106f : ca __ __ DEX
1070 : d0 f2 __ BNE $1064 ; (divmod + 71)
1072 : 85 25 __ STA WORK + 2 
1074 : 60 __ __ RTS
1075 : a9 00 __ LDA #$00
1077 : 85 25 __ STA WORK + 2 
1079 : 85 26 __ STA WORK + 3 
107b : 84 22 __ STY $22 
107d : a0 10 __ LDY #$10
107f : 18 __ __ CLC
1080 : 26 3b __ ROL ACCU + 0 
1082 : 26 3c __ ROL ACCU + 1 
1084 : 26 25 __ ROL WORK + 2 
1086 : 26 26 __ ROL WORK + 3 
1088 : 38 __ __ SEC
1089 : a5 25 __ LDA WORK + 2 
108b : e5 23 __ SBC WORK + 0 
108d : aa __ __ TAX
108e : a5 26 __ LDA WORK + 3 
1090 : e5 24 __ SBC WORK + 1 
1092 : 90 04 __ BCC $1098 ; (divmod + 123)
1094 : 86 25 __ STX WORK + 2 
1096 : 85 26 __ STA WORK + 3 
1098 : 88 __ __ DEY
1099 : d0 e5 __ BNE $1080 ; (divmod + 99)
109b : 26 3b __ ROL ACCU + 0 
109d : 26 3c __ ROL ACCU + 1 
109f : a4 22 __ LDY $22 
10a1 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
10a2 : 24 3c __ BIT ACCU + 1 
10a4 : 10 0d __ BPL $10b3 ; (mods16 + 17)
10a6 : 20 01 10 JSR $1001 ; (negaccu + 0)
10a9 : 24 24 __ BIT WORK + 1 
10ab : 10 0d __ BPL $10ba ; (mods16 + 24)
10ad : 20 0f 10 JSR $100f ; (negtmp + 0)
10b0 : 4c 1d 10 JMP $101d ; (divmod + 0)
10b3 : 24 24 __ BIT WORK + 1 
10b5 : 10 f9 __ BPL $10b0 ; (mods16 + 14)
10b7 : 20 0f 10 JSR $100f ; (negtmp + 0)
10ba : 20 1d 10 JSR $101d ; (divmod + 0)
10bd : 38 __ __ SEC
10be : a9 00 __ LDA #$00
10c0 : e5 25 __ SBC WORK + 2 
10c2 : 85 25 __ STA WORK + 2 
10c4 : a9 00 __ LDA #$00
10c6 : e5 26 __ SBC WORK + 3 
10c8 : 85 26 __ STA WORK + 3 
10ca : 60 __ __ RTS
