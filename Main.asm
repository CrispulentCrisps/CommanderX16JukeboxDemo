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
080e : 8e 61 11 STX $1161 ; (spentry + 0)
0811 : a9 00 __ LDA #$00
0813 : 85 39 __ STA IP + 0 
0815 : a9 16 __ LDA #$16
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 1a __ LDA #$1a
081c : e9 16 __ SBC #$16
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
0832 : e9 00 __ SBC #$00
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
1161 : __ __ __ BYT 00                                              : .
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
08b7 : 85 4d __ STA T1 + 0 
.l2:
08b9 : a9 03 __ LDA #$03
08bb : 8d 2c 9f STA $9f2c 
08be : 20 ac 0e JSR $0eac ; (zsm_check.s0 + 0)
08c1 : 09 00 __ ORA #$00
08c3 : f0 0b __ BEQ $08d0 ; (main.s6 + 0)
.s4:
08c5 : a9 1d __ LDA #$1d
08c7 : 85 30 __ STA P3 
08c9 : a9 10 __ LDA #$10
08cb : 85 31 __ STA P4 
08cd : 20 b0 0e JSR $0eb0 ; (zsm_init.s0 + 0)
.s6:
08d0 : a5 4d __ LDA T1 + 0 
08d2 : 85 2e __ STA P1 
08d4 : 20 37 10 JSR $1037 ; (Control.s0 + 0)
08d7 : a5 3b __ LDA ACCU + 0 
08d9 : 85 4d __ STA T1 + 0 
08db : ad a8 11 LDA $11a8 ; (FrameCount + 0)
08de : 85 48 __ STA T3 + 0 
08e0 : 85 3b __ STA ACCU + 0 
08e2 : ad a9 11 LDA $11a9 ; (FrameCount + 1)
08e5 : 85 3c __ STA ACCU + 1 
08e7 : a9 04 __ LDA #$04
08e9 : 85 23 __ STA WORK + 0 
08eb : a9 00 __ LDA #$00
08ed : 85 24 __ STA WORK + 1 
08ef : 20 38 11 JSR $1138 ; (mods16 + 0)
08f2 : a5 26 __ LDA WORK + 3 
08f4 : d0 16 __ BNE $090c ; (main.s9 + 0)
.s1002:
08f6 : a5 25 __ LDA WORK + 2 
08f8 : c9 01 __ CMP #$01
08fa : d0 10 __ BNE $090c ; (main.s9 + 0)
.s7:
08fc : ae fd 11 LDX $11fd ; (off1 + 0)
08ff : e8 __ __ INX
0900 : 8e fd 11 STX $11fd ; (off1 + 0)
0903 : bd a9 11 LDA $11a9,x ; (FrameCount + 1)
0906 : 38 __ __ SEC
0907 : e9 40 __ SBC #$40
0909 : 8d 23 9f STA $9f23 
.s9:
090c : 06 48 __ ASL T3 + 0 
090e : ad a9 11 LDA $11a9 ; (FrameCount + 1)
0911 : 2a __ __ ROL
0912 : 18 __ __ CLC
0913 : 69 ff __ ADC #$ff
0915 : 8d 38 9f STA $9f38 
0918 : a5 48 __ LDA T3 + 0 
091a : 8d 37 9f STA $9f37 
091d : a9 01 __ LDA #$01
091f : 8d 2c 9f STA $9f2c 
0922 : 20 4f 0f JSR $0f4f ; (zsm_fill.s0 + 0)
0925 : a9 00 __ LDA #$00
0927 : 8d 2c 9f STA $9f2c 
092a : 20 88 10 JSR $1088 ; (frame_wait.l1 + 0)
092d : ee a8 11 INC $11a8 ; (FrameCount + 0)
0930 : d0 87 __ BNE $08b9 ; (main.l2 + 0)
.s1003:
0932 : ee a9 11 INC $11a9 ; (FrameCount + 1)
0935 : 4c b9 08 JMP $08b9 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0938 : 78 __ __ SEI
0939 : ad 14 03 LDA $0314 
093c : 8d e6 11 STA $11e6 ; (oirq + 0)
093f : ad 15 03 LDA $0315 
0942 : 8d e7 11 STA $11e7 ; (oirq + 1)
0945 : a9 51 __ LDA #$51
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : 58 __ __ CLI
.s1001:
0950 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
11e6 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0951 : 20 57 09 JSR $0957 ; (irq.s1000 + 0)
0954 : 6c e6 11 JMP ($11e6)
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
0981 : ad 62 11 LDA $1162 ; (zsm_playing + 0)
0984 : f0 08 __ BEQ $098e ; (irq.s1001 + 0)
.s4:
0986 : ad 63 11 LDA $1163 ; (zsm_finished + 0)
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
1162 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
1163 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b9 : ad e8 11 LDA $11e8 ; (zsm_delay + 0)
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
09dd : ad e9 11 LDA $11e9 ; (zsm_pos + 0)
09e0 : 85 4b __ STA T3 + 0 
09e2 : 18 __ __ CLC
09e3 : 69 01 __ ADC #$01
09e5 : 85 4d __ STA T4 + 0 
09e7 : 8d e9 11 STA $11e9 ; (zsm_pos + 0)
09ea : ad ea 11 LDA $11ea ; (zsm_pos + 1)
09ed : aa __ __ TAX
09ee : 69 00 __ ADC #$00
09f0 : 85 4e __ STA T4 + 1 
09f2 : 8d ea 11 STA $11ea ; (zsm_pos + 1)
09f5 : 18 __ __ CLC
09f6 : a9 00 __ LDA #$00
09f8 : 65 4b __ ADC T3 + 0 
09fa : 85 3b __ STA ACCU + 0 
09fc : 8a __ __ TXA
09fd : 29 03 __ AND #$03
09ff : 69 16 __ ADC #$16
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
0a11 : a9 00 __ LDA #$00
0a13 : 65 4d __ ADC T4 + 0 
0a15 : 85 4b __ STA T3 + 0 
0a17 : a5 4e __ LDA T4 + 1 
0a19 : 29 03 __ AND #$03
0a1b : 69 16 __ ADC #$16
0a1d : 85 4c __ STA T3 + 1 
0a1f : b1 4b __ LDA (T3 + 0),y 
0a21 : 29 3f __ AND #$3f
0a23 : 18 __ __ CLC
0a24 : 65 4d __ ADC T4 + 0 
0a26 : 8d e9 11 STA $11e9 ; (zsm_pos + 0)
0a29 : 98 __ __ TYA
0a2a : 65 4e __ ADC T4 + 1 
0a2c : 8d ea 11 STA $11ea ; (zsm_pos + 1)
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
0a3f : a9 00 __ LDA #$00
0a41 : 6d e9 11 ADC $11e9 ; (zsm_pos + 0)
0a44 : 85 4d __ STA T4 + 0 
0a46 : ad ea 11 LDA $11ea ; (zsm_pos + 1)
0a49 : 29 03 __ AND #$03
0a4b : 69 16 __ ADC #$16
0a4d : 85 4e __ STA T4 + 1 
0a4f : a0 00 __ LDY #$00
0a51 : b1 4d __ LDA (T4 + 0),y 
0a53 : 85 2d __ STA P0 
0a55 : ad e9 11 LDA $11e9 ; (zsm_pos + 0)
0a58 : 18 __ __ CLC
0a59 : 69 01 __ ADC #$01
0a5b : aa __ __ TAX
0a5c : ad ea 11 LDA $11ea ; (zsm_pos + 1)
0a5f : 69 00 __ ADC #$00
0a61 : 29 03 __ AND #$03
0a63 : 85 4c __ STA T3 + 1 
0a65 : 8a __ __ TXA
0a66 : 18 __ __ CLC
0a67 : 69 00 __ ADC #$00
0a69 : 85 4b __ STA T3 + 0 
0a6b : a9 16 __ LDA #$16
0a6d : 65 4c __ ADC T3 + 1 
0a6f : 85 4c __ STA T3 + 1 
0a71 : b1 4b __ LDA (T3 + 0),y 
0a73 : 85 2e __ STA P1 
0a75 : 20 f2 0a JSR $0af2 ; (sfx_put.l1 + 0)
0a78 : ad e9 11 LDA $11e9 ; (zsm_pos + 0)
0a7b : 18 __ __ CLC
0a7c : 69 02 __ ADC #$02
0a7e : 8d e9 11 STA $11e9 ; (zsm_pos + 0)
0a81 : 90 03 __ BCC $0a86 ; (zsm_play.s1015 + 0)
.s1014:
0a83 : ee ea 11 INC $11ea ; (zsm_pos + 1)
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
0a97 : 8d 63 11 STA $1163 ; (zsm_finished + 0)
0a9a : d0 08 __ BNE $0aa4 ; (zsm_play.s7 + 0)
.s22:
0a9c : 29 7f __ AND #$7f
0a9e : 38 __ __ SEC
0a9f : e9 01 __ SBC #$01
0aa1 : 8d e8 11 STA $11e8 ; (zsm_delay + 0)
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
0ace : 8d e9 11 STA $11e9 ; (zsm_pos + 0)
0ad1 : 90 01 __ BCC $0ad4 ; (zsm_play.s1017 + 0)
.s1016:
0ad3 : e8 __ __ INX
.s1017:
0ad4 : 8e ea 11 STX $11ea ; (zsm_pos + 1)
0ad7 : 18 __ __ CLC
0ad8 : a9 00 __ LDA #$00
0ada : 65 4d __ ADC T4 + 0 
0adc : 85 4b __ STA T3 + 0 
0ade : a5 4e __ LDA T4 + 1 
0ae0 : 29 03 __ AND #$03
0ae2 : 69 16 __ ADC #$16
0ae4 : 85 4c __ STA T3 + 1 
0ae6 : b1 4b __ LDA (T3 + 0),y 
0ae8 : 8d 23 9f STA $9f23 
0aeb : 4c dd 09 JMP $09dd ; (zsm_play.l5 + 0)
.s1:
0aee : ce e8 11 DEC $11e8 ; (zsm_delay + 0)
0af1 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
11e8 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
1600 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
11e9 : __ __ __ BSS	2
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
0b24 : a0 80 __ LDY #$80
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
0b3e : e0 40 __ CPX #$40
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
0b53 : 85 31 __ STA P4 
0b55 : 8d 25 9f STA $9f25 
0b58 : ad 29 9f LDA $9f29 
0b5b : 09 70 __ ORA #$70
0b5d : 8d 29 9f STA $9f29 
0b60 : a9 80 __ LDA #$80
0b62 : 8d 2b 9f STA $9f2b 
0b65 : 8d 2a 9f STA $9f2a 
0b68 : a9 62 __ LDA #$62
0b6a : 8d 2d 9f STA $9f2d 
0b6d : a9 68 __ LDA #$68
0b6f : 8d 34 9f STA $9f34 
0b72 : 20 66 0d JSR $0d66 ; (tileBaseConfig.s0 + 0)
0b75 : 8d 2f 9f STA $9f2f 
0b78 : a9 20 __ LDA #$20
0b7a : 85 2f __ STA P2 
0b7c : 20 7f 0d JSR $0d7f ; (memoryToMapMemoryAddress.s0 + 0)
0b7f : 8d 2e 9f STA $9f2e 
0b82 : a9 00 __ LDA #$00
0b84 : 85 2f __ STA P2 
0b86 : 85 33 __ STA P6 
0b88 : a9 01 __ LDA #$01
0b8a : 85 34 __ STA P7 
0b8c : ad 35 9f LDA $9f35 
0b8f : 29 fe __ AND #$fe
0b91 : 09 01 __ ORA #$01
0b93 : 8d 35 9f STA $9f35 
0b96 : a9 00 __ LDA #$00
0b98 : 85 31 __ STA P4 
0b9a : a9 12 __ LDA #$12
0b9c : 85 32 __ STA P5 
0b9e : 20 8d 0d JSR $0d8d ; (vram_putn.s0 + 0)
0ba1 : a9 10 __ LDA #$10
0ba3 : 8d 22 9f STA $9f22 
0ba6 : a9 00 __ LDA #$00
0ba8 : 8d 20 9f STA $9f20 
0bab : a9 20 __ LDA #$20
0bad : 8d 21 9f STA $9f21 
0bb0 : a9 3c __ LDA #$3c
0bb2 : 85 47 __ STA T1 + 0 
.l2:
0bb4 : a9 00 __ LDA #$00
0bb6 : 85 48 __ STA T2 + 0 
.l6:
0bb8 : 20 c8 0d JSR $0dc8 ; (rand.s0 + 0)
0bbb : a5 3b __ LDA ACCU + 0 
0bbd : 29 1f __ AND #$1f
0bbf : c9 1f __ CMP #$1f
0bc1 : a5 48 __ LDA T2 + 0 
0bc3 : 90 03 __ BCC $0bc8 ; (SetUpSprites.s1018 + 0)
0bc5 : 4c 30 0d JMP $0d30 ; (SetUpSprites.s1012 + 0)
.s1018:
0bc8 : c9 0a __ CMP #$0a
0bca : 90 06 __ BCC $0bd2 ; (SetUpSprites.s12 + 0)
.s1017:
0bcc : a9 46 __ LDA #$46
0bce : c5 48 __ CMP T2 + 0 
0bd0 : b0 04 __ BCS $0bd6 ; (SetUpSprites.s1016 + 0)
.s12:
0bd2 : a9 00 __ LDA #$00
0bd4 : f0 2f __ BEQ $0c05 ; (SetUpSprites.s68 + 0)
.s1016:
0bd6 : a5 48 __ LDA T2 + 0 
0bd8 : c9 14 __ CMP #$14
0bda : 90 06 __ BCC $0be2 ; (SetUpSprites.s16 + 0)
.s1015:
0bdc : a9 3c __ LDA #$3c
0bde : c5 48 __ CMP T2 + 0 
0be0 : b0 04 __ BCS $0be6 ; (SetUpSprites.s1014 + 0)
.s16:
0be2 : a9 01 __ LDA #$01
0be4 : d0 12 __ BNE $0bf8 ; (SetUpSprites.s72 + 0)
.s1014:
0be6 : a5 48 __ LDA T2 + 0 
0be8 : c9 1e __ CMP #$1e
0bea : 90 06 __ BCC $0bf2 ; (SetUpSprites.s20 + 0)
.s1013:
0bec : a9 32 __ LDA #$32
0bee : c5 48 __ CMP T2 + 0 
0bf0 : b0 04 __ BCS $0bf6 ; (SetUpSprites.s21 + 0)
.s20:
0bf2 : a9 02 __ LDA #$02
0bf4 : d0 02 __ BNE $0bf8 ; (SetUpSprites.s72 + 0)
.s21:
0bf6 : a9 03 __ LDA #$03
.s72:
0bf8 : 8d 23 9f STA $9f23 
0bfb : a9 00 __ LDA #$00
0bfd : 8d 23 9f STA $9f23 
0c00 : e6 48 __ INC T2 + 0 
0c02 : 4c b8 0b JMP $0bb8 ; (SetUpSprites.l6 + 0)
.s68:
0c05 : 8d 23 9f STA $9f23 
0c08 : a9 00 __ LDA #$00
0c0a : 8d 23 9f STA $9f23 
0c0d : e6 48 __ INC T2 + 0 
0c0f : 10 a7 __ BPL $0bb8 ; (SetUpSprites.l6 + 0)
.s3:
0c11 : c6 47 __ DEC T1 + 0 
0c13 : d0 9f __ BNE $0bb4 ; (SetUpSprites.l2 + 0)
.s4:
0c15 : a9 20 __ LDA #$20
0c17 : 85 37 __ STA P10 
0c19 : a9 00 __ LDA #$00
0c1b : 8d fc 9e STA $9efc ; (sstack + 0)
0c1e : 8d ff 9e STA $9eff ; (sstack + 3)
0c21 : a9 fa __ LDA #$fa
0c23 : 8d fd 9e STA $9efd ; (sstack + 1)
0c26 : a9 01 __ LDA #$01
0c28 : 8d fe 9e STA $9efe ; (sstack + 2)
0c2b : a9 66 __ LDA #$66
0c2d : 85 35 __ STA P8 
0c2f : a9 11 __ LDA #$11
0c31 : 85 36 __ STA P9 
0c33 : 20 ef 0d JSR $0def ; (SetPaletteColours.s0 + 0)
0c36 : a9 00 __ LDA #$00
0c38 : 85 2d __ STA P0 
0c3a : 85 30 __ STA P3 
0c3c : 85 33 __ STA P6 
0c3e : a9 31 __ LDA #$31
0c40 : 85 2e __ STA P1 
0c42 : a9 01 __ LDA #$01
0c44 : 85 2f __ STA P2 
0c46 : a9 02 __ LDA #$02
0c48 : 85 34 __ STA P7 
0c4a : a9 00 __ LDA #$00
0c4c : 85 31 __ STA P4 
0c4e : a9 13 __ LDA #$13
0c50 : 85 32 __ STA P5 
0c52 : 20 8d 0d JSR $0d8d ; (vram_putn.s0 + 0)
0c55 : a9 30 __ LDA #$30
0c57 : 85 2e __ STA P1 
0c59 : a9 01 __ LDA #$01
0c5b : 85 34 __ STA P7 
0c5d : a9 00 __ LDA #$00
0c5f : 85 31 __ STA P4 
0c61 : a9 15 __ LDA #$15
0c63 : 85 32 __ STA P5 
0c65 : 20 8d 0d JSR $0d8d ; (vram_putn.s0 + 0)
0c68 : a9 16 __ LDA #$16
0c6a : 85 2d __ STA P0 
0c6c : a9 80 __ LDA #$80
0c6e : 85 2e __ STA P1 
0c70 : a9 09 __ LDA #$09
0c72 : 85 2f __ STA P2 
0c74 : a9 01 __ LDA #$01
0c76 : 85 31 __ STA P4 
0c78 : 85 34 __ STA P7 
0c7a : a9 02 __ LDA #$02
0c7c : 85 32 __ STA P5 
0c7e : a9 03 __ LDA #$03
0c80 : 85 33 __ STA P6 
0c82 : 20 16 0e JSR $0e16 ; (vera_spr_set.s0 + 0)
0c85 : a9 1a __ LDA #$1a
0c87 : 85 2e __ STA P1 
0c89 : a9 01 __ LDA #$01
0c8b : 85 2f __ STA P2 
0c8d : a9 b8 __ LDA #$b8
0c8f : 85 30 __ STA P3 
0c91 : 20 73 0e JSR $0e73 ; (vera_spr_move.s0 + 0)
0c94 : a9 00 __ LDA #$00
0c96 : 85 4b __ STA T5 + 0 
0c98 : 85 4c __ STA T5 + 1 
.l37:
0c9a : 85 2d __ STA P0 
0c9c : 18 __ __ CLC
0c9d : 69 02 __ ADC #$02
0c9f : 85 49 __ STA T4 + 0 
0ca1 : a9 00 __ LDA #$00
0ca3 : 2a __ __ ROL
0ca4 : 85 4a __ STA T4 + 1 
0ca6 : a9 88 __ LDA #$88
0ca8 : 85 2e __ STA P1 
0caa : a9 09 __ LDA #$09
0cac : 85 2f __ STA P2 
0cae : a9 00 __ LDA #$00
0cb0 : 85 30 __ STA P3 
0cb2 : a9 03 __ LDA #$03
0cb4 : 85 31 __ STA P4 
0cb6 : a9 01 __ LDA #$01
0cb8 : 85 32 __ STA P5 
0cba : 20 16 0e JSR $0e16 ; (vera_spr_set.s0 + 0)
0cbd : a5 4b __ LDA T5 + 0 
0cbf : 85 2e __ STA P1 
0cc1 : a5 4c __ LDA T5 + 1 
0cc3 : 85 2f __ STA P2 
0cc5 : a9 a0 __ LDA #$a0
0cc7 : 85 30 __ STA P3 
0cc9 : a9 01 __ LDA #$01
0ccb : 85 31 __ STA P4 
0ccd : 20 73 0e JSR $0e73 ; (vera_spr_move.s0 + 0)
0cd0 : a9 88 __ LDA #$88
0cd2 : 85 2e __ STA P1 
0cd4 : a9 09 __ LDA #$09
0cd6 : 85 2f __ STA P2 
0cd8 : a9 00 __ LDA #$00
0cda : 85 30 __ STA P3 
0cdc : a9 03 __ LDA #$03
0cde : 85 31 __ STA P4 
0ce0 : e6 2d __ INC P0 
0ce2 : 20 16 0e JSR $0e16 ; (vera_spr_set.s0 + 0)
0ce5 : a5 4b __ LDA T5 + 0 
0ce7 : 85 2e __ STA P1 
0ce9 : a5 4c __ LDA T5 + 1 
0ceb : 85 2f __ STA P2 
0ced : a9 70 __ LDA #$70
0cef : 85 30 __ STA P3 
0cf1 : a9 01 __ LDA #$01
0cf3 : 85 31 __ STA P4 
0cf5 : 20 73 0e JSR $0e73 ; (vera_spr_move.s0 + 0)
0cf8 : a5 4a __ LDA T4 + 1 
0cfa : d0 13 __ BNE $0d0f ; (SetUpSprites.s39 + 0)
.s1008:
0cfc : 18 __ __ CLC
0cfd : a5 2e __ LDA P1 
0cff : 69 40 __ ADC #$40
0d01 : 85 4b __ STA T5 + 0 
0d03 : a5 2f __ LDA P2 
0d05 : 69 00 __ ADC #$00
0d07 : 85 4c __ STA T5 + 1 
0d09 : a5 49 __ LDA T4 + 0 
0d0b : c9 16 __ CMP #$16
0d0d : 90 8b __ BCC $0c9a ; (SetUpSprites.l37 + 0)
.s39:
0d0f : a9 20 __ LDA #$20
0d11 : 85 37 __ STA P10 
0d13 : 8d fc 9e STA $9efc ; (sstack + 0)
0d16 : a9 fa __ LDA #$fa
0d18 : 8d fd 9e STA $9efd ; (sstack + 1)
0d1b : a9 01 __ LDA #$01
0d1d : 8d fe 9e STA $9efe ; (sstack + 2)
0d20 : a9 00 __ LDA #$00
0d22 : 8d ff 9e STA $9eff ; (sstack + 3)
0d25 : a9 86 __ LDA #$86
0d27 : 85 35 __ STA P8 
0d29 : a9 11 __ LDA #$11
0d2b : 85 36 __ STA P9 
0d2d : 4c ef 0d JMP $0def ; (SetPaletteColours.s0 + 0)
.s1012:
0d30 : c9 0a __ CMP #$0a
0d32 : 90 06 __ BCC $0d3a ; (SetUpSprites.s24 + 0)
.s1011:
0d34 : a9 46 __ LDA #$46
0d36 : c5 48 __ CMP T2 + 0 
0d38 : b0 05 __ BCS $0d3f ; (SetUpSprites.s1005 + 0)
.s24:
0d3a : a9 04 __ LDA #$04
0d3c : 4c 05 0c JMP $0c05 ; (SetUpSprites.s68 + 0)
.s1005:
0d3f : a5 48 __ LDA T2 + 0 
0d41 : c9 14 __ CMP #$14
0d43 : 90 06 __ BCC $0d4b ; (SetUpSprites.s28 + 0)
.s1004:
0d45 : a9 3c __ LDA #$3c
0d47 : c5 48 __ CMP T2 + 0 
0d49 : b0 05 __ BCS $0d50 ; (SetUpSprites.s1003 + 0)
.s28:
0d4b : a9 05 __ LDA #$05
0d4d : 4c f8 0b JMP $0bf8 ; (SetUpSprites.s72 + 0)
.s1003:
0d50 : a5 48 __ LDA T2 + 0 
0d52 : c9 1e __ CMP #$1e
0d54 : 90 06 __ BCC $0d5c ; (SetUpSprites.s32 + 0)
.s1002:
0d56 : a9 32 __ LDA #$32
0d58 : c5 48 __ CMP T2 + 0 
0d5a : b0 05 __ BCS $0d61 ; (SetUpSprites.s33 + 0)
.s32:
0d5c : a9 06 __ LDA #$06
0d5e : 4c f8 0b JMP $0bf8 ; (SetUpSprites.s72 + 0)
.s33:
0d61 : a9 07 __ LDA #$07
0d63 : 4c f8 0b JMP $0bf8 ; (SetUpSprites.s72 + 0)
--------------------------------------------------------------------
tileBaseConfig:
.s0:
0d66 : a5 2d __ LDA P0 ; (bank + 0)
0d68 : 4a __ __ LSR
0d69 : a9 00 __ LDA #$00
0d6b : 6a __ __ ROR
0d6c : 85 3b __ STA ACCU + 0 
0d6e : a5 2f __ LDA P2 ; (mem + 1)
0d70 : 29 f8 __ AND #$f8
0d72 : 4a __ __ LSR
0d73 : 05 3b __ ORA ACCU + 0 
0d75 : 85 3b __ STA ACCU + 0 
0d77 : a5 30 __ LDA P3 ; (height + 0)
0d79 : 0a __ __ ASL
0d7a : 05 3b __ ORA ACCU + 0 
0d7c : 05 31 __ ORA P4 ; (width + 0)
.s1001:
0d7e : 60 __ __ RTS
--------------------------------------------------------------------
memoryToMapMemoryAddress:
.s0:
0d7f : a5 2d __ LDA P0 ; (bank + 0)
0d81 : 4a __ __ LSR
0d82 : a9 00 __ LDA #$00
0d84 : 6a __ __ ROR
0d85 : 85 3b __ STA ACCU + 0 
0d87 : a5 2f __ LDA P2 ; (mem + 1)
0d89 : 4a __ __ LSR
0d8a : 05 3b __ ORA ACCU + 0 
.s1001:
0d8c : 60 __ __ RTS
--------------------------------------------------------------------
vram_putn:
.s0:
0d8d : ad 25 9f LDA $9f25 
0d90 : 29 fe __ AND #$fe
0d92 : 8d 25 9f STA $9f25 
0d95 : a5 2d __ LDA P0 ; (addr + 0)
0d97 : 8d 20 9f STA $9f20 
0d9a : a5 2e __ LDA P1 ; (addr + 1)
0d9c : 8d 21 9f STA $9f21 
0d9f : a5 2f __ LDA P2 ; (addr + 2)
0da1 : 29 01 __ AND #$01
0da3 : 09 10 __ ORA #$10
0da5 : 8d 22 9f STA $9f22 
0da8 : a5 33 __ LDA P6 ; (size + 0)
0daa : 05 34 __ ORA P7 ; (size + 1)
0dac : f0 19 __ BEQ $0dc7 ; (vram_putn.s1001 + 0)
.s6:
0dae : a0 00 __ LDY #$00
0db0 : a6 33 __ LDX P6 ; (size + 0)
0db2 : f0 02 __ BEQ $0db6 ; (vram_putn.l1002 + 0)
.s1005:
0db4 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0db6 : b1 31 __ LDA (P4),y ; (data + 0)
0db8 : 8d 23 9f STA $9f23 
0dbb : c8 __ __ INY
0dbc : d0 02 __ BNE $0dc0 ; (vram_putn.s1009 + 0)
.s1008:
0dbe : e6 32 __ INC P5 ; (data + 1)
.s1009:
0dc0 : ca __ __ DEX
0dc1 : d0 f3 __ BNE $0db6 ; (vram_putn.l1002 + 0)
.s1004:
0dc3 : c6 34 __ DEC P7 ; (size + 1)
0dc5 : d0 ef __ BNE $0db6 ; (vram_putn.l1002 + 0)
.s1001:
0dc7 : 60 __ __ RTS
--------------------------------------------------------------------
MainBG:
1200 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1210 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1220 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1230 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1240 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1250 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1260 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1270 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1280 : __ __ __ BYT 00 00 00 00 00 00 00 40 00 04 00 00 00 00 00 00 : .......@........
1290 : __ __ __ BYT 04 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 : ................
12a0 : __ __ __ BYT 11 11 11 11 15 11 15 11 11 11 11 11 11 11 11 11 : ................
12b0 : __ __ __ BYT 11 11 11 11 15 11 11 11 11 11 11 51 11 11 11 11 : ...........Q....
12c0 : __ __ __ BYT 31 11 11 11 11 11 11 11 11 11 13 11 11 11 11 11 : 1...............
12d0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 31 13 11 11 11 11 11 : .........1......
12e0 : __ __ __ BYT 22 22 22 22 26 22 22 22 22 22 22 22 22 22 26 22 : """"&"""""""""&"
12f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 26 22 22 22 22 22 22 62 : """"""""&""""""b
--------------------------------------------------------------------
rand:
.s0:
0dc8 : ad 65 11 LDA $1165 ; (seed + 1)
0dcb : 4a __ __ LSR
0dcc : ad 64 11 LDA $1164 ; (seed + 0)
0dcf : 6a __ __ ROR
0dd0 : aa __ __ TAX
0dd1 : a9 00 __ LDA #$00
0dd3 : 6a __ __ ROR
0dd4 : 4d 64 11 EOR $1164 ; (seed + 0)
0dd7 : 85 3b __ STA ACCU + 0 
0dd9 : 8a __ __ TXA
0dda : 4d 65 11 EOR $1165 ; (seed + 1)
0ddd : 85 3c __ STA ACCU + 1 
0ddf : 4a __ __ LSR
0de0 : 45 3b __ EOR ACCU + 0 
0de2 : 8d 64 11 STA $1164 ; (seed + 0)
0de5 : 85 3b __ STA ACCU + 0 
0de7 : 45 3c __ EOR ACCU + 1 
0de9 : 8d 65 11 STA $1165 ; (seed + 1)
0dec : 85 3c __ STA ACCU + 1 
.s1001:
0dee : 60 __ __ RTS
--------------------------------------------------------------------
seed:
1164 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0def : ad fc 9e LDA $9efc ; (sstack + 0)
0df2 : 85 2d __ STA P0 
0df4 : ad fd 9e LDA $9efd ; (sstack + 1)
0df7 : 85 2e __ STA P1 
0df9 : ad fe 9e LDA $9efe ; (sstack + 2)
0dfc : 85 2f __ STA P2 
0dfe : ad ff 9e LDA $9eff ; (sstack + 3)
0e01 : 85 30 __ STA P3 
0e03 : a5 35 __ LDA P8 ; (input + 0)
0e05 : 85 31 __ STA P4 
0e07 : a5 36 __ LDA P9 ; (input + 1)
0e09 : 85 32 __ STA P5 
0e0b : a5 37 __ LDA P10 ; (inputsize + 0)
0e0d : 85 33 __ STA P6 
0e0f : a9 00 __ LDA #$00
0e11 : 85 34 __ STA P7 
0e13 : 4c 8d 0d JMP $0d8d ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
BGPal:
1166 : __ __ __ BYT 23 02 12 01 01 11 77 07 ff 0f aa 0a 66 06 22 02 : #.....w.....f.".
1176 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
ScrollerOutline:
1300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1330 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1340 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1350 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1360 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1370 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1380 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1390 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
13a0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
13b0 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
13c0 : __ __ __ BYT 22 22 23 22 22 22 22 22 22 22 22 22 22 22 22 22 : ""#"""""""""""""
13d0 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
13e0 : __ __ __ BYT 22 22 34 32 22 22 22 22 22 22 22 22 22 22 22 22 : ""42""""""""""""
13f0 : __ __ __ BYT 22 22 22 22 22 22 22 22 23 22 22 22 22 22 22 22 : """"""""#"""""""
1400 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1410 : __ __ __ BYT 22 22 22 22 22 22 22 22 34 32 22 22 22 22 22 22 : """"""""42""""""
1420 : __ __ __ BYT 22 23 45 43 22 22 22 22 22 22 22 22 22 22 22 22 : "#EC""""""""""""
1430 : __ __ __ BYT 22 22 22 22 22 22 22 23 45 43 22 22 22 22 22 22 : """""""#EC""""""
1440 : __ __ __ BYT 33 33 34 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3343333333333333
1450 : __ __ __ BYT 33 33 33 33 33 33 33 33 45 43 33 33 33 33 33 33 : 33333333EC333333
1460 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1470 : __ __ __ BYT 33 33 33 33 33 33 33 33 34 33 33 33 33 33 33 33 : 3333333343333333
1480 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1490 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
14a0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
14b0 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
14c0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
14d0 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
14e0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
14f0 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
--------------------------------------------------------------------
Pause:
1500 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 12 21 00 : ..............!.
1510 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1520 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 12 21 00 : ..............!.
1530 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1540 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1550 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1560 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1570 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1580 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1590 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
15a0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
15b0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
15c0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 11 11 00 00 22 22 00 : ............."".
15d0 : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
15e0 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 11 11 00 00 22 22 00 : ............."".
15f0 : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
--------------------------------------------------------------------
vera_spr_set:
.s0:
0e16 : ad 25 9f LDA $9f25 
0e19 : 29 fe __ AND #$fe
0e1b : 8d 25 9f STA $9f25 
0e1e : a5 2d __ LDA P0 ; (spr + 0)
0e20 : 0a __ __ ASL
0e21 : 0a __ __ ASL
0e22 : 85 3b __ STA ACCU + 0 
0e24 : a9 3f __ LDA #$3f
0e26 : 2a __ __ ROL
0e27 : 06 3b __ ASL ACCU + 0 
0e29 : 2a __ __ ROL
0e2a : 8d 21 9f STA $9f21 
0e2d : a5 3b __ LDA ACCU + 0 
0e2f : 8d 20 9f STA $9f20 
0e32 : a9 11 __ LDA #$11
0e34 : 8d 22 9f STA $9f22 
0e37 : a5 30 __ LDA P3 ; (mode8 + 0)
0e39 : f0 02 __ BEQ $0e3d ; (vera_spr_set.s11 + 0)
.s9:
0e3b : a9 80 __ LDA #$80
.s11:
0e3d : 05 2f __ ORA P2 ; (addr32 + 1)
0e3f : a6 2e __ LDX P1 ; (addr32 + 0)
0e41 : 8e 23 9f STX $9f23 
0e44 : 8d 23 9f STA $9f23 
0e47 : a9 00 __ LDA #$00
0e49 : 8d 23 9f STA $9f23 
0e4c : 8d 23 9f STA $9f23 
0e4f : 8d 23 9f STA $9f23 
0e52 : 8d 23 9f STA $9f23 
0e55 : a5 33 __ LDA P6 ; (z + 0)
0e57 : 0a __ __ ASL
0e58 : 0a __ __ ASL
0e59 : 8d 23 9f STA $9f23 
0e5c : a5 32 __ LDA P5 ; (h + 0)
0e5e : 4a __ __ LSR
0e5f : 6a __ __ ROR
0e60 : 29 80 __ AND #$80
0e62 : 6a __ __ ROR
0e63 : 85 3b __ STA ACCU + 0 
0e65 : a5 31 __ LDA P4 ; (w + 0)
0e67 : 0a __ __ ASL
0e68 : 0a __ __ ASL
0e69 : 0a __ __ ASL
0e6a : 0a __ __ ASL
0e6b : 05 3b __ ORA ACCU + 0 
0e6d : 05 34 __ ORA P7 ; (pal + 0)
0e6f : 8d 23 9f STA $9f23 
.s1001:
0e72 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0e73 : ad 25 9f LDA $9f25 
0e76 : 29 fe __ AND #$fe
0e78 : 8d 25 9f STA $9f25 
0e7b : a5 2d __ LDA P0 ; (spr + 0)
0e7d : 0a __ __ ASL
0e7e : 0a __ __ ASL
0e7f : 85 3b __ STA ACCU + 0 
0e81 : a9 3f __ LDA #$3f
0e83 : 2a __ __ ROL
0e84 : 06 3b __ ASL ACCU + 0 
0e86 : 2a __ __ ROL
0e87 : aa __ __ TAX
0e88 : a5 3b __ LDA ACCU + 0 
0e8a : 09 02 __ ORA #$02
0e8c : 8d 20 9f STA $9f20 
0e8f : 8e 21 9f STX $9f21 
0e92 : a9 11 __ LDA #$11
0e94 : 8d 22 9f STA $9f22 
0e97 : a5 2e __ LDA P1 ; (x + 0)
0e99 : 8d 23 9f STA $9f23 
0e9c : a5 2f __ LDA P2 ; (x + 1)
0e9e : 8d 23 9f STA $9f23 
0ea1 : a5 30 __ LDA P3 ; (y + 0)
0ea3 : 8d 23 9f STA $9f23 
0ea6 : a5 31 __ LDA P4 ; (y + 1)
0ea8 : 8d 23 9f STA $9f23 
.s1001:
0eab : 60 __ __ RTS
--------------------------------------------------------------------
palette:
1186 : __ __ __ BYT ff 0f ef 0e ee 0e aa 0a 88 08 66 06 22 02 11 01 : ..........f."...
1196 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
zsm_check:
.s0:
0eac : ad 63 11 LDA $1163 ; (zsm_finished + 0)
.s1001:
0eaf : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0eb0 : a9 01 __ LDA #$01
0eb2 : 8d 63 11 STA $1163 ; (zsm_finished + 0)
0eb5 : ad a6 11 LDA $11a6 ; (zsm_reading + 0)
0eb8 : f0 0a __ BEQ $0ec4 ; (zsm_init.s3 + 0)
.s1:
0eba : a9 02 __ LDA #$02
0ebc : 20 09 0f JSR $0f09 ; (krnio_close.s1000 + 0)
0ebf : a9 00 __ LDA #$00
0ec1 : 8d a6 11 STA $11a6 ; (zsm_reading + 0)
.s3:
0ec4 : 8d e9 11 STA $11e9 ; (zsm_pos + 0)
0ec7 : 8d ea 11 STA $11ea ; (zsm_pos + 1)
0eca : 8d eb 11 STA $11eb ; (zsm_wpos + 0)
0ecd : 8d ec 11 STA $11ec ; (zsm_wpos + 1)
0ed0 : 8d e8 11 STA $11e8 ; (zsm_delay + 0)
0ed3 : a5 30 __ LDA P3 ; (fname + 0)
0ed5 : 85 2d __ STA P0 
0ed7 : a5 31 __ LDA P4 ; (fname + 1)
0ed9 : 85 2e __ STA P1 
0edb : 20 11 0f JSR $0f11 ; (krnio_setnam.s0 + 0)
0ede : a9 02 __ LDA #$02
0ee0 : 85 2d __ STA P0 
0ee2 : 85 2f __ STA P2 
0ee4 : a9 08 __ LDA #$08
0ee6 : 85 2e __ STA P1 
0ee8 : 20 27 0f JSR $0f27 ; (krnio_open.s0 + 0)
0eeb : a5 3b __ LDA ACCU + 0 
0eed : f0 19 __ BEQ $0f08 ; (zsm_init.s1001 + 0)
.s4:
0eef : a9 01 __ LDA #$01
0ef1 : 8d a6 11 STA $11a6 ; (zsm_reading + 0)
0ef4 : 20 4f 0f JSR $0f4f ; (zsm_fill.s0 + 0)
0ef7 : a9 10 __ LDA #$10
0ef9 : 8d e9 11 STA $11e9 ; (zsm_pos + 0)
0efc : a9 00 __ LDA #$00
0efe : 8d ea 11 STA $11ea ; (zsm_pos + 1)
0f01 : 8d 63 11 STA $1163 ; (zsm_finished + 0)
0f04 : a9 01 __ LDA #$01
0f06 : 85 3b __ STA ACCU + 0 
.s1001:
0f08 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
11a6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0f09 : 85 2d __ STA P0 
.s0:
0f0b : a5 2d __ LDA P0 
0f0d : 20 c3 ff JSR $ffc3 
.s1001:
0f10 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
11eb : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0f11 : a5 2d __ LDA P0 
0f13 : 05 2e __ ORA P1 
0f15 : f0 08 __ BEQ $0f1f ; (krnio_setnam.s0 + 14)
0f17 : a0 ff __ LDY #$ff
0f19 : c8 __ __ INY
0f1a : b1 2d __ LDA (P0),y 
0f1c : d0 fb __ BNE $0f19 ; (krnio_setnam.s0 + 8)
0f1e : 98 __ __ TYA
0f1f : a6 2d __ LDX P0 
0f21 : a4 2e __ LDY P1 
0f23 : 20 bd ff JSR $ffbd 
.s1001:
0f26 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0f27 : a9 00 __ LDA #$00
0f29 : a6 2d __ LDX P0 ; (fnum + 0)
0f2b : 9d ed 11 STA $11ed,x ; (krnio_pstatus + 0)
0f2e : a9 00 __ LDA #$00
0f30 : 85 3b __ STA ACCU + 0 
0f32 : 85 3c __ STA ACCU + 1 
0f34 : a5 2d __ LDA P0 ; (fnum + 0)
0f36 : a6 2e __ LDX P1 
0f38 : a4 2f __ LDY P2 
0f3a : 20 ba ff JSR $ffba 
0f3d : 20 c0 ff JSR $ffc0 
0f40 : 90 08 __ BCC $0f4a ; (krnio_open.s0 + 35)
0f42 : a5 2d __ LDA P0 ; (fnum + 0)
0f44 : 20 c3 ff JSR $ffc3 
0f47 : 4c 4e 0f JMP $0f4e ; (krnio_open.s1001 + 0)
0f4a : a9 01 __ LDA #$01
0f4c : 85 3b __ STA ACCU + 0 
.s1001:
0f4e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
11ed : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0f4f : ad a6 11 LDA $11a6 ; (zsm_reading + 0)
0f52 : f0 20 __ BEQ $0f74 ; (zsm_fill.s1 + 0)
.s2:
0f54 : ad ea 11 LDA $11ea ; (zsm_pos + 1)
0f57 : 18 __ __ CLC
0f58 : 69 04 __ ADC #$04
0f5a : cd ec 11 CMP $11ec ; (zsm_wpos + 1)
0f5d : d0 0c __ BNE $0f6b ; (zsm_fill.s6 + 0)
.s1006:
0f5f : ad eb 11 LDA $11eb ; (zsm_wpos + 0)
0f62 : cd e9 11 CMP $11e9 ; (zsm_pos + 0)
0f65 : d0 04 __ BNE $0f6b ; (zsm_fill.s6 + 0)
.s5:
0f67 : a9 00 __ LDA #$00
0f69 : f0 0b __ BEQ $0f76 ; (zsm_fill.s1008 + 0)
.s6:
0f6b : a9 02 __ LDA #$02
0f6d : 20 f3 0f JSR $0ff3 ; (krnio_chkin.s1000 + 0)
0f70 : a5 3b __ LDA ACCU + 0 
0f72 : d0 07 __ BNE $0f7b ; (zsm_fill.s9 + 0)
.s1:
0f74 : a9 ff __ LDA #$ff
.s1008:
0f76 : 85 3b __ STA ACCU + 0 
.s1001:
0f78 : 85 3c __ STA ACCU + 1 
0f7a : 60 __ __ RTS
.s9:
0f7b : a9 00 __ LDA #$00
0f7d : 85 47 __ STA T1 + 0 
0f7f : 85 48 __ STA T1 + 1 
0f81 : ad ea 11 LDA $11ea ; (zsm_pos + 1)
0f84 : 18 __ __ CLC
0f85 : 69 04 __ ADC #$04
0f87 : cd ec 11 CMP $11ec ; (zsm_wpos + 1)
0f8a : d0 08 __ BNE $0f94 ; (zsm_fill.l13 + 0)
.s1002:
0f8c : ad eb 11 LDA $11eb ; (zsm_wpos + 0)
0f8f : cd e9 11 CMP $11e9 ; (zsm_pos + 0)
0f92 : f0 49 __ BEQ $0fdd ; (zsm_fill.s37 + 0)
.l13:
0f94 : 20 05 10 JSR $1005 ; (krnio_chrin.s0 + 0)
0f97 : ad eb 11 LDA $11eb ; (zsm_wpos + 0)
0f9a : aa __ __ TAX
0f9b : 18 __ __ CLC
0f9c : 69 01 __ ADC #$01
0f9e : 8d eb 11 STA $11eb ; (zsm_wpos + 0)
0fa1 : ad ec 11 LDA $11ec ; (zsm_wpos + 1)
0fa4 : a8 __ __ TAY
0fa5 : 69 00 __ ADC #$00
0fa7 : 8d ec 11 STA $11ec ; (zsm_wpos + 1)
0faa : 8a __ __ TXA
0fab : 18 __ __ CLC
0fac : 69 00 __ ADC #$00
0fae : 85 49 __ STA T3 + 0 
0fb0 : 98 __ __ TYA
0fb1 : 29 03 __ AND #$03
0fb3 : 69 16 __ ADC #$16
0fb5 : 85 4a __ STA T3 + 1 
0fb7 : a5 3b __ LDA ACCU + 0 
0fb9 : a0 00 __ LDY #$00
0fbb : 91 49 __ STA (T3 + 0),y 
0fbd : e6 47 __ INC T1 + 0 
0fbf : d0 02 __ BNE $0fc3 ; (zsm_fill.s1010 + 0)
.s1009:
0fc1 : e6 48 __ INC T1 + 1 
.s1010:
0fc3 : 20 0f 10 JSR $100f ; (krnio_status.s0 + 0)
0fc6 : a5 3b __ LDA ACCU + 0 
0fc8 : d0 0e __ BNE $0fd8 ; (zsm_fill.s15 + 0)
.s12:
0fca : ad ea 11 LDA $11ea ; (zsm_pos + 1)
0fcd : 18 __ __ CLC
0fce : 69 04 __ ADC #$04
0fd0 : cd ec 11 CMP $11ec ; (zsm_wpos + 1)
0fd3 : d0 bf __ BNE $0f94 ; (zsm_fill.l13 + 0)
0fd5 : 4c 8c 0f JMP $0f8c ; (zsm_fill.s1002 + 0)
.s15:
0fd8 : a9 00 __ LDA #$00
0fda : 8d a6 11 STA $11a6 ; (zsm_reading + 0)
.s37:
0fdd : 20 19 10 JSR $1019 ; (krnio_clrchn.s0 + 0)
0fe0 : ad a6 11 LDA $11a6 ; (zsm_reading + 0)
0fe3 : d0 05 __ BNE $0fea ; (zsm_fill.s21 + 0)
.s19:
0fe5 : a9 02 __ LDA #$02
0fe7 : 20 09 0f JSR $0f09 ; (krnio_close.s1000 + 0)
.s21:
0fea : a5 47 __ LDA T1 + 0 
0fec : 85 3b __ STA ACCU + 0 
0fee : a5 48 __ LDA T1 + 1 
0ff0 : 4c 78 0f JMP $0f78 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0ff3 : 85 2d __ STA P0 
.s0:
0ff5 : a6 2d __ LDX P0 
0ff7 : 20 c6 ff JSR $ffc6 
0ffa : a9 00 __ LDA #$00
0ffc : 85 3c __ STA ACCU + 1 
0ffe : b0 02 __ BCS $1002 ; (krnio_chkin.s0 + 13)
1000 : a9 01 __ LDA #$01
1002 : 85 3b __ STA ACCU + 0 
.s1001:
1004 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
1005 : 20 cf ff JSR $ffcf 
1008 : 85 3b __ STA ACCU + 0 
100a : a9 00 __ LDA #$00
100c : 85 3c __ STA ACCU + 1 
.s1001:
100e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
100f : 20 b7 ff JSR $ffb7 
1012 : 85 3b __ STA ACCU + 0 
1014 : a9 00 __ LDA #$00
1016 : 85 3c __ STA ACCU + 1 
.s1001:
1018 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
1019 : 20 cc ff JSR $ffcc 
.s1001:
101c : 60 __ __ RTS
--------------------------------------------------------------------
101d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 4b 72 61 69 : @0:zsmfiles/Krai
102d : __ __ __ BYT 64 2e 7a 73 6d 2c 50 2c 52 00                   : d.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
1037 : 20 53 10 JSR $1053 ; (getchx.s0 + 0)
103a : a5 3c __ LDA ACCU + 1 
103c : d0 10 __ BNE $104e ; (Control.s3 + 0)
.s1005:
103e : a5 3b __ LDA ACCU + 0 
1040 : c9 20 __ CMP #$20
1042 : d0 0a __ BNE $104e ; (Control.s3 + 0)
.s1:
1044 : a9 00 __ LDA #$00
1046 : c5 2e __ CMP P1 ; (playing + 0)
1048 : 2a __ __ ROL
1049 : 85 2e __ STA P1 ; (playing + 0)
104b : 20 84 10 JSR $1084 ; (zsm_irq_play.s0 + 0)
.s3:
104e : a5 2e __ LDA P1 ; (playing + 0)
1050 : 85 3b __ STA ACCU + 0 
.s1001:
1052 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
1053 : 20 5d 10 JSR $105d ; (getpch + 0)
1056 : 85 3b __ STA ACCU + 0 
1058 : a9 00 __ LDA #$00
105a : 85 3c __ STA ACCU + 1 
.s1001:
105c : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
105d : 20 e4 ff JSR $ffe4 
1060 : ae a7 11 LDX $11a7 ; (giocharmap + 0)
1063 : e0 01 __ CPX #$01
1065 : 90 1c __ BCC $1083 ; (getpch + 38)
1067 : c9 0d __ CMP #$0d
1069 : d0 02 __ BNE $106d ; (getpch + 16)
106b : a9 0a __ LDA #$0a
106d : e0 02 __ CPX #$02
106f : 90 12 __ BCC $1083 ; (getpch + 38)
1071 : c9 41 __ CMP #$41
1073 : 90 0e __ BCC $1083 ; (getpch + 38)
1075 : c9 7b __ CMP #$7b
1077 : b0 0a __ BCS $1083 ; (getpch + 38)
1079 : c9 61 __ CMP #$61
107b : b0 04 __ BCS $1081 ; (getpch + 36)
107d : c9 5b __ CMP #$5b
107f : b0 02 __ BCS $1083 ; (getpch + 38)
1081 : 49 20 __ EOR #$20
1083 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
11a7 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
1084 : 8d 62 11 STA $1162 ; (zsm_playing + 0)
.s1001:
1087 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
11a8 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
11aa : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
11ba : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
11ca : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 2c 20 4d 41 52 4b : MBA TOBACH, MARK
11da : __ __ __ BYT 2d 42 55 47 2d 53 4c 41 59 45 52 00             : -BUG-SLAYER.
--------------------------------------------------------------------
off1:
11fd : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
1088 : ad 26 9f LDA $9f26 
108b : 29 40 __ AND #$40
108d : d0 f9 __ BNE $1088 ; (frame_wait.l1 + 0)
.l4:
108f : ad 26 9f LDA $9f26 
1092 : 29 40 __ AND #$40
1094 : f0 f9 __ BEQ $108f ; (frame_wait.l4 + 0)
.s1001:
1096 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
1097 : 38 __ __ SEC
1098 : a9 00 __ LDA #$00
109a : e5 3b __ SBC ACCU + 0 
109c : 85 3b __ STA ACCU + 0 
109e : a9 00 __ LDA #$00
10a0 : e5 3c __ SBC ACCU + 1 
10a2 : 85 3c __ STA ACCU + 1 
10a4 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
10a5 : 38 __ __ SEC
10a6 : a9 00 __ LDA #$00
10a8 : e5 23 __ SBC WORK + 0 
10aa : 85 23 __ STA WORK + 0 
10ac : a9 00 __ LDA #$00
10ae : e5 24 __ SBC WORK + 1 
10b0 : 85 24 __ STA WORK + 1 
10b2 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
10b3 : a5 3c __ LDA ACCU + 1 
10b5 : d0 31 __ BNE $10e8 ; (divmod + 53)
10b7 : a5 24 __ LDA WORK + 1 
10b9 : d0 1e __ BNE $10d9 ; (divmod + 38)
10bb : 85 26 __ STA WORK + 3 
10bd : a2 04 __ LDX #$04
10bf : 06 3b __ ASL ACCU + 0 
10c1 : 2a __ __ ROL
10c2 : c5 23 __ CMP WORK + 0 
10c4 : 90 02 __ BCC $10c8 ; (divmod + 21)
10c6 : e5 23 __ SBC WORK + 0 
10c8 : 26 3b __ ROL ACCU + 0 
10ca : 2a __ __ ROL
10cb : c5 23 __ CMP WORK + 0 
10cd : 90 02 __ BCC $10d1 ; (divmod + 30)
10cf : e5 23 __ SBC WORK + 0 
10d1 : 26 3b __ ROL ACCU + 0 
10d3 : ca __ __ DEX
10d4 : d0 eb __ BNE $10c1 ; (divmod + 14)
10d6 : 85 25 __ STA WORK + 2 
10d8 : 60 __ __ RTS
10d9 : a5 3b __ LDA ACCU + 0 
10db : 85 25 __ STA WORK + 2 
10dd : a5 3c __ LDA ACCU + 1 
10df : 85 26 __ STA WORK + 3 
10e1 : a9 00 __ LDA #$00
10e3 : 85 3b __ STA ACCU + 0 
10e5 : 85 3c __ STA ACCU + 1 
10e7 : 60 __ __ RTS
10e8 : a5 24 __ LDA WORK + 1 
10ea : d0 1f __ BNE $110b ; (divmod + 88)
10ec : a5 23 __ LDA WORK + 0 
10ee : 30 1b __ BMI $110b ; (divmod + 88)
10f0 : a9 00 __ LDA #$00
10f2 : 85 26 __ STA WORK + 3 
10f4 : a2 10 __ LDX #$10
10f6 : 06 3b __ ASL ACCU + 0 
10f8 : 26 3c __ ROL ACCU + 1 
10fa : 2a __ __ ROL
10fb : c5 23 __ CMP WORK + 0 
10fd : 90 02 __ BCC $1101 ; (divmod + 78)
10ff : e5 23 __ SBC WORK + 0 
1101 : 26 3b __ ROL ACCU + 0 
1103 : 26 3c __ ROL ACCU + 1 
1105 : ca __ __ DEX
1106 : d0 f2 __ BNE $10fa ; (divmod + 71)
1108 : 85 25 __ STA WORK + 2 
110a : 60 __ __ RTS
110b : a9 00 __ LDA #$00
110d : 85 25 __ STA WORK + 2 
110f : 85 26 __ STA WORK + 3 
1111 : 84 22 __ STY $22 
1113 : a0 10 __ LDY #$10
1115 : 18 __ __ CLC
1116 : 26 3b __ ROL ACCU + 0 
1118 : 26 3c __ ROL ACCU + 1 
111a : 26 25 __ ROL WORK + 2 
111c : 26 26 __ ROL WORK + 3 
111e : 38 __ __ SEC
111f : a5 25 __ LDA WORK + 2 
1121 : e5 23 __ SBC WORK + 0 
1123 : aa __ __ TAX
1124 : a5 26 __ LDA WORK + 3 
1126 : e5 24 __ SBC WORK + 1 
1128 : 90 04 __ BCC $112e ; (divmod + 123)
112a : 86 25 __ STX WORK + 2 
112c : 85 26 __ STA WORK + 3 
112e : 88 __ __ DEY
112f : d0 e5 __ BNE $1116 ; (divmod + 99)
1131 : 26 3b __ ROL ACCU + 0 
1133 : 26 3c __ ROL ACCU + 1 
1135 : a4 22 __ LDY $22 
1137 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1138 : 24 3c __ BIT ACCU + 1 
113a : 10 0d __ BPL $1149 ; (mods16 + 17)
113c : 20 97 10 JSR $1097 ; (negaccu + 0)
113f : 24 24 __ BIT WORK + 1 
1141 : 10 0d __ BPL $1150 ; (mods16 + 24)
1143 : 20 a5 10 JSR $10a5 ; (negtmp + 0)
1146 : 4c b3 10 JMP $10b3 ; (divmod + 0)
1149 : 24 24 __ BIT WORK + 1 
114b : 10 f9 __ BPL $1146 ; (mods16 + 14)
114d : 20 a5 10 JSR $10a5 ; (negtmp + 0)
1150 : 20 b3 10 JSR $10b3 ; (divmod + 0)
1153 : 38 __ __ SEC
1154 : a9 00 __ LDA #$00
1156 : e5 25 __ SBC WORK + 2 
1158 : 85 25 __ STA WORK + 2 
115a : a9 00 __ LDA #$00
115c : e5 26 __ SBC WORK + 3 
115e : 85 26 __ STA WORK + 3 
1160 : 60 __ __ RTS
