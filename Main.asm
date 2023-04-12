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
080e : 8e b3 10 STX $10b3 ; (spentry + 0)
0811 : a9 ff __ LDA #$ff
0813 : 85 39 __ STA IP + 0 
0815 : a9 14 __ LDA #$14
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 19 __ LDA #$19
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
0830 : a9 17 __ LDA #$17
0832 : e9 ff __ SBC #$ff
0834 : f0 08 __ BEQ $083e ; (startup + 61)
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 39 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839 ; (startup + 56)
083e : a9 f1 __ LDA #$f1
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
10b3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 30 09 JSR $0930 ; (zsm_irq_init.s0 + 0)
0883 : 20 fe 0a JSR $0afe ; (ClearVERAScreen.s0 + 0)
0886 : 20 41 0b JSR $0b41 ; (SetUpSprites.s0 + 0)
0889 : ad 25 9f LDA $9f25 
088c : 09 02 __ ORA #$02
088e : 8d 25 9f STA $9f25 
0891 : a9 9a __ LDA #$9a
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
08ad : a9 00 __ LDA #$00
08af : 85 4c __ STA T1 + 0 
.l2:
08b1 : a9 03 __ LDA #$03
08b3 : 8d 2c 9f STA $9f2c 
08b6 : 20 fa 0d JSR $0dfa ; (zsm_check.s0 + 0)
08b9 : 09 00 __ ORA #$00
08bb : f0 0b __ BEQ $08c8 ; (main.s6 + 0)
.s4:
08bd : a9 6b __ LDA #$6b
08bf : 85 30 __ STA P3 
08c1 : a9 0f __ LDA #$0f
08c3 : 85 31 __ STA P4 
08c5 : 20 fe 0d JSR $0dfe ; (zsm_init.s0 + 0)
.s6:
08c8 : a5 4c __ LDA T1 + 0 
08ca : 85 2e __ STA P1 
08cc : 20 89 0f JSR $0f89 ; (Control.s0 + 0)
08cf : a5 3b __ LDA ACCU + 0 
08d1 : 85 4c __ STA T1 + 0 
08d3 : ad d2 14 LDA $14d2 ; (FrameCount + 0)
08d6 : 85 48 __ STA T3 + 0 
08d8 : 85 3b __ STA ACCU + 0 
08da : ad d3 14 LDA $14d3 ; (FrameCount + 1)
08dd : 85 3c __ STA ACCU + 1 
08df : a9 04 __ LDA #$04
08e1 : 85 23 __ STA WORK + 0 
08e3 : a9 00 __ LDA #$00
08e5 : 85 24 __ STA WORK + 1 
08e7 : 20 8a 10 JSR $108a ; (mods16 + 0)
08ea : a5 26 __ LDA WORK + 3 
08ec : d0 16 __ BNE $0904 ; (main.s9 + 0)
.s1002:
08ee : a5 25 __ LDA WORK + 2 
08f0 : c9 01 __ CMP #$01
08f2 : d0 10 __ BNE $0904 ; (main.s9 + 0)
.s7:
08f4 : ae 16 19 LDX $1916 ; (off1 + 0)
08f7 : e8 __ __ INX
08f8 : 8e 16 19 STX $1916 ; (off1 + 0)
08fb : bd d3 14 LDA $14d3,x ; (FrameCount + 1)
08fe : 38 __ __ SEC
08ff : e9 40 __ SBC #$40
0901 : 8d 23 9f STA $9f23 
.s9:
0904 : 06 48 __ ASL T3 + 0 
0906 : ad d3 14 LDA $14d3 ; (FrameCount + 1)
0909 : 2a __ __ ROL
090a : 18 __ __ CLC
090b : 69 ff __ ADC #$ff
090d : 8d 38 9f STA $9f38 
0910 : a5 48 __ LDA T3 + 0 
0912 : 8d 37 9f STA $9f37 
0915 : a9 01 __ LDA #$01
0917 : 8d 2c 9f STA $9f2c 
091a : 20 9d 0e JSR $0e9d ; (zsm_fill.s0 + 0)
091d : a9 00 __ LDA #$00
091f : 8d 2c 9f STA $9f2c 
0922 : 20 da 0f JSR $0fda ; (frame_wait.l1 + 0)
0925 : ee d2 14 INC $14d2 ; (FrameCount + 0)
0928 : d0 87 __ BNE $08b1 ; (main.l2 + 0)
.s1003:
092a : ee d3 14 INC $14d3 ; (FrameCount + 1)
092d : 4c b1 08 JMP $08b1 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0930 : 78 __ __ SEI
0931 : ad 14 03 LDA $0314 
0934 : 8d ff 14 STA $14ff ; (oirq + 0)
0937 : ad 15 03 LDA $0315 
093a : 8d 00 15 STA $1500 ; (oirq + 1)
093d : a9 49 __ LDA #$49
093f : 8d 14 03 STA $0314 
0942 : a9 09 __ LDA #$09
0944 : 8d 15 03 STA $0315 
0947 : 58 __ __ CLI
.s1001:
0948 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
14ff : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0949 : 20 4f 09 JSR $094f ; (irq.s1000 + 0)
094c : 6c ff 14 JMP ($14ff)
--------------------------------------------------------------------
irq:
.s1000:
094f : a5 2d __ LDA P0 
0951 : 48 __ __ PHA
0952 : a5 2e __ LDA P1 
0954 : 48 __ __ PHA
0955 : a5 3b __ LDA ACCU + 0 
0957 : 48 __ __ PHA
0958 : a5 3c __ LDA ACCU + 1 
095a : 48 __ __ PHA
095b : a5 47 __ LDA T0 + 0 
095d : 48 __ __ PHA
095e : a5 48 __ LDA $48 
0960 : 48 __ __ PHA
0961 : a5 49 __ LDA $49 
0963 : 48 __ __ PHA
0964 : a5 4a __ LDA $4a 
0966 : 48 __ __ PHA
0967 : a5 4b __ LDA $4b 
0969 : 48 __ __ PHA
096a : a5 4c __ LDA $4c 
096c : 48 __ __ PHA
096d : a5 4d __ LDA $4d 
096f : 48 __ __ PHA
0970 : a5 4e __ LDA $4e 
0972 : 48 __ __ PHA
0973 : a5 4f __ LDA $4f 
0975 : 48 __ __ PHA
0976 : a5 50 __ LDA $50 
0978 : 48 __ __ PHA
.s0:
0979 : ad b4 10 LDA $10b4 ; (zsm_playing + 0)
097c : f0 08 __ BEQ $0986 ; (irq.s1001 + 0)
.s4:
097e : ad b5 10 LDA $10b5 ; (zsm_finished + 0)
0981 : d0 03 __ BNE $0986 ; (irq.s1001 + 0)
.s1:
0983 : 20 b1 09 JSR $09b1 ; (zsm_play.s0 + 0)
.s1001:
0986 : 68 __ __ PLA
0987 : 85 50 __ STA $50 
0989 : 68 __ __ PLA
098a : 85 4f __ STA $4f 
098c : 68 __ __ PLA
098d : 85 4e __ STA $4e 
098f : 68 __ __ PLA
0990 : 85 4d __ STA $4d 
0992 : 68 __ __ PLA
0993 : 85 4c __ STA $4c 
0995 : 68 __ __ PLA
0996 : 85 4b __ STA $4b 
0998 : 68 __ __ PLA
0999 : 85 4a __ STA $4a 
099b : 68 __ __ PLA
099c : 85 49 __ STA $49 
099e : 68 __ __ PLA
099f : 85 48 __ STA $48 
09a1 : 68 __ __ PLA
09a2 : 85 47 __ STA T0 + 0 
09a4 : 68 __ __ PLA
09a5 : 85 3c __ STA ACCU + 1 
09a7 : 68 __ __ PLA
09a8 : 85 3b __ STA ACCU + 0 
09aa : 68 __ __ PLA
09ab : 85 2e __ STA P1 
09ad : 68 __ __ PLA
09ae : 85 2d __ STA P0 
09b0 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
10b4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
10b5 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b1 : ad 01 15 LDA $1501 ; (zsm_delay + 0)
09b4 : f0 03 __ BEQ $09b9 ; (zsm_play.s2 + 0)
09b6 : 4c e6 0a JMP $0ae6 ; (zsm_play.s1 + 0)
.s2:
09b9 : ad 25 9f LDA $9f25 
09bc : 85 47 __ STA T0 + 0 
09be : ad 25 9f LDA $9f25 
09c1 : 29 fe __ AND #$fe
09c3 : 8d 25 9f STA $9f25 
09c6 : ad 20 9f LDA $9f20 
09c9 : 85 49 __ STA T2 + 0 
09cb : ad 21 9f LDA $9f21 
09ce : 85 4a __ STA T2 + 1 
09d0 : ad 22 9f LDA $9f22 
09d3 : 85 48 __ STA T1 + 0 
.l5:
09d5 : ad 02 19 LDA $1902 ; (zsm_pos + 0)
09d8 : 85 4b __ STA T3 + 0 
09da : 18 __ __ CLC
09db : 69 01 __ ADC #$01
09dd : 85 4d __ STA T4 + 0 
09df : 8d 02 19 STA $1902 ; (zsm_pos + 0)
09e2 : ad 03 19 LDA $1903 ; (zsm_pos + 1)
09e5 : aa __ __ TAX
09e6 : 69 00 __ ADC #$00
09e8 : 85 4e __ STA T4 + 1 
09ea : 8d 03 19 STA $1903 ; (zsm_pos + 1)
09ed : 18 __ __ CLC
09ee : a9 02 __ LDA #$02
09f0 : 65 4b __ ADC T3 + 0 
09f2 : 85 3b __ STA ACCU + 0 
09f4 : 8a __ __ TXA
09f5 : 29 03 __ AND #$03
09f7 : 69 15 __ ADC #$15
09f9 : 85 3c __ STA ACCU + 1 
09fb : a0 00 __ LDY #$00
09fd : b1 3b __ LDA (ACCU + 0),y 
09ff : c9 40 __ CMP #$40
0a01 : b0 03 __ BCS $0a06 ; (zsm_play.s9 + 0)
0a03 : 4c b1 0a JMP $0ab1 ; (zsm_play.s8 + 0)
.s9:
0a06 : d0 22 __ BNE $0a2a ; (zsm_play.s12 + 0)
.s11:
0a08 : 18 __ __ CLC
0a09 : a9 02 __ LDA #$02
0a0b : 65 4d __ ADC T4 + 0 
0a0d : 85 4b __ STA T3 + 0 
0a0f : a5 4e __ LDA T4 + 1 
0a11 : 29 03 __ AND #$03
0a13 : 69 15 __ ADC #$15
0a15 : 85 4c __ STA T3 + 1 
0a17 : b1 4b __ LDA (T3 + 0),y 
0a19 : 29 3f __ AND #$3f
0a1b : 18 __ __ CLC
0a1c : 65 4d __ ADC T4 + 0 
0a1e : 8d 02 19 STA $1902 ; (zsm_pos + 0)
0a21 : 98 __ __ TYA
0a22 : 65 4e __ ADC T4 + 1 
0a24 : 8d 03 19 STA $1903 ; (zsm_pos + 1)
0a27 : 4c d5 09 JMP $09d5 ; (zsm_play.l5 + 0)
.s12:
0a2a : 09 00 __ ORA #$00
0a2c : 30 5b __ BMI $0a89 ; (zsm_play.s15 + 0)
.s14:
0a2e : 29 3f __ AND #$3f
0a30 : f0 a3 __ BEQ $09d5 ; (zsm_play.l5 + 0)
.s26:
0a32 : 84 50 __ STY T7 + 0 
0a34 : 85 4f __ STA T6 + 0 
0a36 : 18 __ __ CLC
.l1012:
0a37 : a9 02 __ LDA #$02
0a39 : 6d 02 19 ADC $1902 ; (zsm_pos + 0)
0a3c : 85 4d __ STA T4 + 0 
0a3e : ad 03 19 LDA $1903 ; (zsm_pos + 1)
0a41 : 29 03 __ AND #$03
0a43 : 69 15 __ ADC #$15
0a45 : 85 4e __ STA T4 + 1 
0a47 : a0 00 __ LDY #$00
0a49 : b1 4d __ LDA (T4 + 0),y 
0a4b : 85 2d __ STA P0 
0a4d : ad 02 19 LDA $1902 ; (zsm_pos + 0)
0a50 : 18 __ __ CLC
0a51 : 69 01 __ ADC #$01
0a53 : aa __ __ TAX
0a54 : ad 03 19 LDA $1903 ; (zsm_pos + 1)
0a57 : 69 00 __ ADC #$00
0a59 : 29 03 __ AND #$03
0a5b : 85 4c __ STA T3 + 1 
0a5d : 8a __ __ TXA
0a5e : 18 __ __ CLC
0a5f : 69 02 __ ADC #$02
0a61 : 85 4b __ STA T3 + 0 
0a63 : a9 15 __ LDA #$15
0a65 : 65 4c __ ADC T3 + 1 
0a67 : 85 4c __ STA T3 + 1 
0a69 : b1 4b __ LDA (T3 + 0),y 
0a6b : 85 2e __ STA P1 
0a6d : 20 ea 0a JSR $0aea ; (sfx_put.l1 + 0)
0a70 : ad 02 19 LDA $1902 ; (zsm_pos + 0)
0a73 : 18 __ __ CLC
0a74 : 69 02 __ ADC #$02
0a76 : 8d 02 19 STA $1902 ; (zsm_pos + 0)
0a79 : 90 03 __ BCC $0a7e ; (zsm_play.s1015 + 0)
.s1014:
0a7b : ee 03 19 INC $1903 ; (zsm_pos + 1)
.s1015:
0a7e : e6 50 __ INC T7 + 0 
0a80 : a5 50 __ LDA T7 + 0 
0a82 : c5 4f __ CMP T6 + 0 
0a84 : 90 b1 __ BCC $0a37 ; (zsm_play.l1012 + 0)
0a86 : 4c d5 09 JMP $09d5 ; (zsm_play.l5 + 0)
.s15:
0a89 : c9 80 __ CMP #$80
0a8b : d0 07 __ BNE $0a94 ; (zsm_play.s22 + 0)
.s21:
0a8d : a9 01 __ LDA #$01
0a8f : 8d b5 10 STA $10b5 ; (zsm_finished + 0)
0a92 : d0 08 __ BNE $0a9c ; (zsm_play.s7 + 0)
.s22:
0a94 : 29 7f __ AND #$7f
0a96 : 38 __ __ SEC
0a97 : e9 01 __ SBC #$01
0a99 : 8d 01 15 STA $1501 ; (zsm_delay + 0)
.s7:
0a9c : a5 49 __ LDA T2 + 0 
0a9e : 8d 20 9f STA $9f20 
0aa1 : a5 4a __ LDA T2 + 1 
0aa3 : 8d 21 9f STA $9f21 
0aa6 : a5 48 __ LDA T1 + 0 
0aa8 : 8d 22 9f STA $9f22 
0aab : a5 47 __ LDA T0 + 0 
0aad : 8d 25 9f STA $9f25 
.s1001:
0ab0 : 60 __ __ RTS
.s8:
0ab1 : 29 3f __ AND #$3f
0ab3 : 09 c0 __ ORA #$c0
0ab5 : 8d 20 9f STA $9f20 
0ab8 : a9 f9 __ LDA #$f9
0aba : 8d 21 9f STA $9f21 
0abd : a9 01 __ LDA #$01
0abf : 8d 22 9f STA $9f22 
0ac2 : a5 4b __ LDA T3 + 0 
0ac4 : 69 02 __ ADC #$02
0ac6 : 8d 02 19 STA $1902 ; (zsm_pos + 0)
0ac9 : 90 01 __ BCC $0acc ; (zsm_play.s1017 + 0)
.s1016:
0acb : e8 __ __ INX
.s1017:
0acc : 8e 03 19 STX $1903 ; (zsm_pos + 1)
0acf : 18 __ __ CLC
0ad0 : a9 02 __ LDA #$02
0ad2 : 65 4d __ ADC T4 + 0 
0ad4 : 85 4b __ STA T3 + 0 
0ad6 : a5 4e __ LDA T4 + 1 
0ad8 : 29 03 __ AND #$03
0ada : 69 15 __ ADC #$15
0adc : 85 4c __ STA T3 + 1 
0ade : b1 4b __ LDA (T3 + 0),y 
0ae0 : 8d 23 9f STA $9f23 
0ae3 : 4c d5 09 JMP $09d5 ; (zsm_play.l5 + 0)
.s1:
0ae6 : ce 01 15 DEC $1501 ; (zsm_delay + 0)
0ae9 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
1501 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
1502 : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
1902 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0aea : ad 41 9f LDA $9f41 
0aed : 30 fb __ BMI $0aea ; (sfx_put.l1 + 0)
.s3:
0aef : a5 2d __ LDA P0 ; (index + 0)
0af1 : 8d 40 9f STA $9f40 
0af4 : ea __ __ NOP
0af5 : ea __ __ NOP
0af6 : ea __ __ NOP
0af7 : ea __ __ NOP
0af8 : a5 2e __ LDA P1 ; (data + 0)
0afa : 8d 41 9f STA $9f41 
.s1001:
0afd : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0afe : a9 93 __ LDA #$93
0b00 : 85 2d __ STA P0 
0b02 : a9 00 __ LDA #$00
0b04 : 85 2e __ STA P1 
0b06 : 20 3b 0b JSR $0b3b ; (putch.s0 + 0)
0b09 : a9 11 __ LDA #$11
0b0b : 8d 22 9f STA $9f22 
0b0e : a2 00 __ LDX #$00
.l2:
0b10 : 8a __ __ TXA
0b11 : 18 __ __ CLC
0b12 : 69 b0 __ ADC #$b0
0b14 : 8d 21 9f STA $9f21 
0b17 : a9 00 __ LDA #$00
0b19 : 8d 20 9f STA $9f20 
0b1c : a0 50 __ LDY #$50
.l1003:
0b1e : a9 20 __ LDA #$20
0b20 : 8d 23 9f STA $9f23 
0b23 : a9 01 __ LDA #$01
0b25 : 8d 23 9f STA $9f23 
0b28 : a9 20 __ LDA #$20
0b2a : 8d 24 9f STA $9f24 
0b2d : a9 01 __ LDA #$01
0b2f : 8d 24 9f STA $9f24 
0b32 : 88 __ __ DEY
0b33 : d0 e9 __ BNE $0b1e ; (ClearVERAScreen.l1003 + 0)
.s1004:
0b35 : e8 __ __ INX
0b36 : e0 3c __ CPX #$3c
0b38 : 90 d6 __ BCC $0b10 ; (ClearVERAScreen.l2 + 0)
.s1001:
0b3a : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0b3b : a5 2d __ LDA P0 
0b3d : 20 d2 ff JSR $ffd2 
.s1001:
0b40 : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0b41 : ad 25 9f LDA $9f25 
0b44 : 29 fd __ AND #$fd
0b46 : 8d 25 9f STA $9f25 
0b49 : ad 29 9f LDA $9f29 
0b4c : 09 40 __ ORA #$40
0b4e : 8d 29 9f STA $9f29 
0b51 : a0 00 __ LDY #$00
0b53 : 84 4a __ STY T2 + 0 
0b55 : 84 4b __ STY T2 + 1 
.l2:
0b57 : 84 35 __ STY P8 
0b59 : a9 02 __ LDA #$02
0b5b : 8d f3 9e STA $9ef3 ; (sstack + 0)
0b5e : 8d fe 9e STA $9efe ; (sstack + 11)
0b61 : 8d ff 9e STA $9eff ; (sstack + 12)
0b64 : a9 32 __ LDA #$32
0b66 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0b69 : a9 01 __ LDA #$01
0b6b : 8d f5 9e STA $9ef5 ; (sstack + 2)
0b6e : 8d f9 9e STA $9ef9 ; (sstack + 6)
0b71 : 8d fb 9e STA $9efb ; (sstack + 8)
0b74 : a9 00 __ LDA #$00
0b76 : 8d f6 9e STA $9ef6 ; (sstack + 3)
0b79 : 8d f7 9e STA $9ef7 ; (sstack + 4)
0b7c : a9 03 __ LDA #$03
0b7e : 8d f8 9e STA $9ef8 ; (sstack + 5)
0b81 : 8d fa 9e STA $9efa ; (sstack + 7)
0b84 : a9 b6 __ LDA #$b6
0b86 : 8d fc 9e STA $9efc ; (sstack + 9)
0b89 : a9 10 __ LDA #$10
0b8b : 8d fd 9e STA $9efd ; (sstack + 10)
0b8e : 20 88 0c JSR $0c88 ; (Setup.s0 + 0)
0b91 : a5 35 __ LDA P8 
0b93 : 85 2d __ STA P0 
0b95 : a5 4a __ LDA T2 + 0 
0b97 : 85 2e __ STA P1 
0b99 : a5 4b __ LDA T2 + 1 
0b9b : 85 2f __ STA P2 
0b9d : a9 a0 __ LDA #$a0
0b9f : 85 30 __ STA P3 
0ba1 : a9 01 __ LDA #$01
0ba3 : 85 31 __ STA P4 
0ba5 : 20 97 0d JSR $0d97 ; (vera_spr_move.s0 + 0)
0ba8 : a9 02 __ LDA #$02
0baa : 8d f3 9e STA $9ef3 ; (sstack + 0)
0bad : 8d fe 9e STA $9efe ; (sstack + 11)
0bb0 : 8d ff 9e STA $9eff ; (sstack + 12)
0bb3 : a9 32 __ LDA #$32
0bb5 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0bb8 : a9 01 __ LDA #$01
0bba : 8d f5 9e STA $9ef5 ; (sstack + 2)
0bbd : 8d f9 9e STA $9ef9 ; (sstack + 6)
0bc0 : 8d fb 9e STA $9efb ; (sstack + 8)
0bc3 : a9 00 __ LDA #$00
0bc5 : 8d f6 9e STA $9ef6 ; (sstack + 3)
0bc8 : 8d f7 9e STA $9ef7 ; (sstack + 4)
0bcb : a9 03 __ LDA #$03
0bcd : 8d f8 9e STA $9ef8 ; (sstack + 5)
0bd0 : 8d fa 9e STA $9efa ; (sstack + 7)
0bd3 : a9 b6 __ LDA #$b6
0bd5 : 8d fc 9e STA $9efc ; (sstack + 9)
0bd8 : a9 10 __ LDA #$10
0bda : 8d fd 9e STA $9efd ; (sstack + 10)
0bdd : 20 88 0c JSR $0c88 ; (Setup.s0 + 0)
0be0 : a5 4a __ LDA T2 + 0 
0be2 : 85 2e __ STA P1 
0be4 : a5 4b __ LDA T2 + 1 
0be6 : 85 2f __ STA P2 
0be8 : a9 70 __ LDA #$70
0bea : 85 30 __ STA P3 
0bec : a9 01 __ LDA #$01
0bee : 85 31 __ STA P4 
0bf0 : a6 35 __ LDX P8 
0bf2 : e8 __ __ INX
0bf3 : 86 2d __ STX P0 
0bf5 : 20 97 0d JSR $0d97 ; (vera_spr_move.s0 + 0)
0bf8 : 18 __ __ CLC
0bf9 : a5 2e __ LDA P1 
0bfb : 69 40 __ ADC #$40
0bfd : 85 4a __ STA T2 + 0 
0bff : a5 2f __ LDA P2 
0c01 : 69 00 __ ADC #$00
0c03 : 85 4b __ STA T2 + 1 
0c05 : 18 __ __ CLC
0c06 : a5 35 __ LDA P8 
0c08 : 69 02 __ ADC #$02
0c0a : a8 __ __ TAY
0c0b : b0 07 __ BCS $0c14 ; (SetUpSprites.s4 + 0)
.s1004:
0c0d : c9 16 __ CMP #$16
0c0f : b0 03 __ BCS $0c14 ; (SetUpSprites.s4 + 0)
0c11 : 4c 57 0b JMP $0b57 ; (SetUpSprites.l2 + 0)
.s4:
0c14 : a9 17 __ LDA #$17
0c16 : 85 35 __ STA P8 
0c18 : a9 00 __ LDA #$00
0c1a : 8d f3 9e STA $9ef3 ; (sstack + 0)
0c1d : 8d f6 9e STA $9ef6 ; (sstack + 3)
0c20 : 8d f7 9e STA $9ef7 ; (sstack + 4)
0c23 : a9 40 __ LDA #$40
0c25 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0c28 : a9 01 __ LDA #$01
0c2a : 8d f5 9e STA $9ef5 ; (sstack + 2)
0c2d : 8d fb 9e STA $9efb ; (sstack + 8)
0c30 : 8d ff 9e STA $9eff ; (sstack + 12)
0c33 : a9 02 __ LDA #$02
0c35 : 8d f8 9e STA $9ef8 ; (sstack + 5)
0c38 : 8d f9 9e STA $9ef9 ; (sstack + 6)
0c3b : a9 03 __ LDA #$03
0c3d : 8d fa 9e STA $9efa ; (sstack + 7)
0c40 : a9 f8 __ LDA #$f8
0c42 : 8d fe 9e STA $9efe ; (sstack + 11)
0c45 : a9 b8 __ LDA #$b8
0c47 : 8d fc 9e STA $9efc ; (sstack + 9)
0c4a : a9 12 __ LDA #$12
0c4c : 8d fd 9e STA $9efd ; (sstack + 10)
0c4f : 20 88 0c JSR $0c88 ; (Setup.s0 + 0)
0c52 : a9 17 __ LDA #$17
0c54 : 85 2d __ STA P0 
0c56 : a9 1a __ LDA #$1a
0c58 : 85 2e __ STA P1 
0c5a : a9 01 __ LDA #$01
0c5c : 85 2f __ STA P2 
0c5e : 85 31 __ STA P4 
0c60 : a9 b8 __ LDA #$b8
0c62 : 85 30 __ STA P3 
0c64 : 20 97 0d JSR $0d97 ; (vera_spr_move.s0 + 0)
0c67 : a9 20 __ LDA #$20
0c69 : 85 37 __ STA P10 
0c6b : 8d f3 9e STA $9ef3 ; (sstack + 0)
0c6e : a9 fa __ LDA #$fa
0c70 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0c73 : a9 01 __ LDA #$01
0c75 : 8d f5 9e STA $9ef5 ; (sstack + 2)
0c78 : a9 00 __ LDA #$00
0c7a : 8d f6 9e STA $9ef6 ; (sstack + 3)
0c7d : a9 b0 __ LDA #$b0
0c7f : 85 35 __ STA P8 
0c81 : a9 14 __ LDA #$14
0c83 : 85 36 __ STA P9 
0c85 : 4c d3 0d JMP $0dd3 ; (SetPaletteColours.s0 + 0)
--------------------------------------------------------------------
Setup:
.s0:
0c88 : ad f3 9e LDA $9ef3 ; (sstack + 0)
0c8b : 85 2d __ STA P0 
0c8d : ad f4 9e LDA $9ef4 ; (sstack + 1)
0c90 : 85 2e __ STA P1 
0c92 : ad f5 9e LDA $9ef5 ; (sstack + 2)
0c95 : 85 2f __ STA P2 
0c97 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0c9a : 85 30 __ STA P3 
0c9c : ad fc 9e LDA $9efc ; (sstack + 9)
0c9f : 85 31 __ STA P4 
0ca1 : ad fd 9e LDA $9efd ; (sstack + 10)
0ca4 : 85 32 __ STA P5 
0ca6 : ad fe 9e LDA $9efe ; (sstack + 11)
0ca9 : 85 33 __ STA P6 
0cab : ad ff 9e LDA $9eff ; (sstack + 12)
0cae : 85 34 __ STA P7 
0cb0 : 20 f9 0c JSR $0cf9 ; (vram_putn.s0 + 0)
0cb3 : a5 35 __ LDA P8 ; (spr + 0)
0cb5 : 85 2d __ STA P0 
0cb7 : ad f3 9e LDA $9ef3 ; (sstack + 0)
0cba : 85 47 __ STA T0 + 0 
0cbc : ad f4 9e LDA $9ef4 ; (sstack + 1)
0cbf : 85 48 __ STA T0 + 1 
0cc1 : ad f5 9e LDA $9ef5 ; (sstack + 2)
0cc4 : 85 49 __ STA T0 + 2 
0cc6 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0cc9 : a2 05 __ LDX #$05
.l1002:
0ccb : 4a __ __ LSR
0ccc : 66 49 __ ROR T0 + 2 
0cce : 66 48 __ ROR T0 + 1 
0cd0 : 66 47 __ ROR T0 + 0 
0cd2 : ca __ __ DEX
0cd3 : d0 f6 __ BNE $0ccb ; (Setup.l1002 + 0)
.s1003:
0cd5 : a5 47 __ LDA T0 + 0 
0cd7 : 85 2e __ STA P1 
0cd9 : a5 48 __ LDA T0 + 1 
0cdb : 85 2f __ STA P2 
0cdd : ad f7 9e LDA $9ef7 ; (sstack + 4)
0ce0 : 85 30 __ STA P3 
0ce2 : ad f8 9e LDA $9ef8 ; (sstack + 5)
0ce5 : 85 31 __ STA P4 
0ce7 : ad f9 9e LDA $9ef9 ; (sstack + 6)
0cea : 85 32 __ STA P5 
0cec : ad fa 9e LDA $9efa ; (sstack + 7)
0cef : 85 33 __ STA P6 
0cf1 : ad fb 9e LDA $9efb ; (sstack + 8)
0cf4 : 85 34 __ STA P7 
0cf6 : 4c 34 0d JMP $0d34 ; (vera_spr_set.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0cf9 : ad 25 9f LDA $9f25 
0cfc : 29 fe __ AND #$fe
0cfe : 8d 25 9f STA $9f25 
0d01 : a5 2d __ LDA P0 ; (addr + 0)
0d03 : 8d 20 9f STA $9f20 
0d06 : a5 2e __ LDA P1 ; (addr + 1)
0d08 : 8d 21 9f STA $9f21 
0d0b : a5 2f __ LDA P2 ; (addr + 2)
0d0d : 29 01 __ AND #$01
0d0f : 09 10 __ ORA #$10
0d11 : 8d 22 9f STA $9f22 
0d14 : a5 33 __ LDA P6 ; (size + 0)
0d16 : 05 34 __ ORA P7 ; (size + 1)
0d18 : f0 19 __ BEQ $0d33 ; (vram_putn.s1001 + 0)
.s6:
0d1a : a0 00 __ LDY #$00
0d1c : a6 33 __ LDX P6 ; (size + 0)
0d1e : f0 02 __ BEQ $0d22 ; (vram_putn.l1002 + 0)
.s1005:
0d20 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0d22 : b1 31 __ LDA (P4),y ; (data + 0)
0d24 : 8d 23 9f STA $9f23 
0d27 : c8 __ __ INY
0d28 : d0 02 __ BNE $0d2c ; (vram_putn.s1009 + 0)
.s1008:
0d2a : e6 32 __ INC P5 ; (data + 1)
.s1009:
0d2c : ca __ __ DEX
0d2d : d0 f3 __ BNE $0d22 ; (vram_putn.l1002 + 0)
.s1004:
0d2f : c6 34 __ DEC P7 ; (size + 1)
0d31 : d0 ef __ BNE $0d22 ; (vram_putn.l1002 + 0)
.s1001:
0d33 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_set:
.s0:
0d34 : ad 25 9f LDA $9f25 
0d37 : 29 fe __ AND #$fe
0d39 : 8d 25 9f STA $9f25 
0d3c : a5 2d __ LDA P0 ; (spr + 0)
0d3e : 0a __ __ ASL
0d3f : 0a __ __ ASL
0d40 : 85 3b __ STA ACCU + 0 
0d42 : a9 00 __ LDA #$00
0d44 : 2a __ __ ROL
0d45 : 06 3b __ ASL ACCU + 0 
0d47 : 2a __ __ ROL
0d48 : 09 fc __ ORA #$fc
0d4a : 8d 21 9f STA $9f21 
0d4d : a5 3b __ LDA ACCU + 0 
0d4f : 8d 20 9f STA $9f20 
0d52 : a9 11 __ LDA #$11
0d54 : 8d 22 9f STA $9f22 
0d57 : a5 30 __ LDA P3 ; (mode8 + 0)
0d59 : f0 02 __ BEQ $0d5d ; (vera_spr_set.s11 + 0)
.s9:
0d5b : a9 80 __ LDA #$80
.s11:
0d5d : 05 2e __ ORA P1 ; (addr32 + 0)
0d5f : 8d 23 9f STA $9f23 
0d62 : a5 2f __ LDA P2 ; (addr32 + 1)
0d64 : 8d 23 9f STA $9f23 
0d67 : a9 00 __ LDA #$00
0d69 : 8d 23 9f STA $9f23 
0d6c : 8d 23 9f STA $9f23 
0d6f : 8d 23 9f STA $9f23 
0d72 : 8d 23 9f STA $9f23 
0d75 : a5 33 __ LDA P6 ; (z + 0)
0d77 : 0a __ __ ASL
0d78 : 0a __ __ ASL
0d79 : 8d 23 9f STA $9f23 
0d7c : a5 32 __ LDA P5 ; (h + 0)
0d7e : 4a __ __ LSR
0d7f : 85 3c __ STA ACCU + 1 
0d81 : a9 00 __ LDA #$00
0d83 : 6a __ __ ROR
0d84 : 66 3c __ ROR ACCU + 1 
0d86 : 6a __ __ ROR
0d87 : 85 3b __ STA ACCU + 0 
0d89 : a5 31 __ LDA P4 ; (w + 0)
0d8b : 0a __ __ ASL
0d8c : 0a __ __ ASL
0d8d : 0a __ __ ASL
0d8e : 0a __ __ ASL
0d8f : 05 3b __ ORA ACCU + 0 
0d91 : 05 34 __ ORA P7 ; (pal + 0)
0d93 : 8d 23 9f STA $9f23 
.s1001:
0d96 : 60 __ __ RTS
--------------------------------------------------------------------
ScrollerOutline:
10b6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10c6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10d6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10e6 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10f6 : __ __ __ BYT 00 00 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1106 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1116 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1126 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1136 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1146 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1156 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1166 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1176 : __ __ __ BYT 11 11 22 22 23 22 22 22 22 22 22 22 22 22 22 22 : ..""#"""""""""""
1186 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1196 : __ __ __ BYT 22 22 22 22 34 32 22 22 22 22 22 22 22 22 22 22 : """"42""""""""""
11a6 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 23 22 22 22 22 22 : """"""""""#"""""
11b6 : __ __ __ BYT 22 22 22 23 45 43 22 22 22 22 22 22 22 22 22 22 : """#EC""""""""""
11c6 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 34 32 22 22 22 22 : """"""""""42""""
11d6 : __ __ __ BYT 22 22 22 23 45 43 22 22 22 22 22 22 22 22 22 22 : """#EC""""""""""
11e6 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 23 45 43 22 22 22 22 : """""""""#EC""""
11f6 : __ __ __ BYT 22 22 33 33 34 33 33 33 33 33 33 33 33 33 33 33 : ""33433333333333
1206 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 45 43 33 33 33 33 : 3333333333EC3333
1216 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1226 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 34 33 33 33 33 33 : 3333333333433333
1236 : __ __ __ BYT 33 33 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : 33DDDDDDDDDDDDDD
1246 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1256 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1266 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1276 : __ __ __ BYT 44 44 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : DDUUUUUUUUUUUUUU
1286 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1296 : __ __ __ BYT 55 55 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : UUffffffffffffff
12a6 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
12b6 : __ __ __ BYT 66 66                                           : ff
--------------------------------------------------------------------
vera_spr_move:
.s0:
0d97 : ad 25 9f LDA $9f25 
0d9a : 29 fe __ AND #$fe
0d9c : 8d 25 9f STA $9f25 
0d9f : a5 2d __ LDA P0 ; (spr + 0)
0da1 : 0a __ __ ASL
0da2 : 0a __ __ ASL
0da3 : 85 3b __ STA ACCU + 0 
0da5 : a9 00 __ LDA #$00
0da7 : 2a __ __ ROL
0da8 : 06 3b __ ASL ACCU + 0 
0daa : 2a __ __ ROL
0dab : aa __ __ TAX
0dac : a5 3b __ LDA ACCU + 0 
0dae : 09 02 __ ORA #$02
0db0 : 8d 20 9f STA $9f20 
0db3 : 8a __ __ TXA
0db4 : 09 fc __ ORA #$fc
0db6 : 8d 21 9f STA $9f21 
0db9 : a9 11 __ LDA #$11
0dbb : 8d 22 9f STA $9f22 
0dbe : a5 2e __ LDA P1 ; (x + 0)
0dc0 : 8d 23 9f STA $9f23 
0dc3 : a5 2f __ LDA P2 ; (x + 1)
0dc5 : 8d 23 9f STA $9f23 
0dc8 : a5 30 __ LDA P3 ; (y + 0)
0dca : 8d 23 9f STA $9f23 
0dcd : a5 31 __ LDA P4 ; (y + 1)
0dcf : 8d 23 9f STA $9f23 
.s1001:
0dd2 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
12b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
12c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 12 21 00 : ..............!.
12d8 : __ __ __ BYT 00 12 21 00 00 10 01 00 00 10 01 00 00 10 01 00 : ..!.............
12e8 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 11 11 00 00 12 21 00 : ..............!.
12f8 : __ __ __ BYT 00 12 21 00 00 10 01 00 00 10 01 00 00 10 01 00 : ..!.............
1308 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 00 00 00 00 00 00 00 : ................
1318 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1328 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1338 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1348 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 10 01 00 00 10 01 00 : ................
1358 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1368 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1378 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1388 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 00 00 00 00 00 00 00 : ................
1398 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13a8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 10 01 00 00 10 01 00 : ................
13d8 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13e8 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13f8 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
1408 : __ __ __ BYT 00 10 01 00 00 10 01 00 00 00 00 00 00 00 00 00 : ................
1418 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1428 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1438 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1448 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 22 22 00 : ............."".
1458 : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
1468 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 22 22 00 : ............."".
1478 : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
1488 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1498 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14a8 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0dd3 : ad f3 9e LDA $9ef3 ; (sstack + 0)
0dd6 : 85 2d __ STA P0 
0dd8 : ad f4 9e LDA $9ef4 ; (sstack + 1)
0ddb : 85 2e __ STA P1 
0ddd : ad f5 9e LDA $9ef5 ; (sstack + 2)
0de0 : 85 2f __ STA P2 
0de2 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0de5 : 85 30 __ STA P3 
0de7 : a5 35 __ LDA P8 ; (input + 0)
0de9 : 85 31 __ STA P4 
0deb : a5 36 __ LDA P9 ; (input + 1)
0ded : 85 32 __ STA P5 
0def : a5 37 __ LDA P10 ; (inputsize + 0)
0df1 : 85 33 __ STA P6 
0df3 : a9 00 __ LDA #$00
0df5 : 85 34 __ STA P7 
0df7 : 4c f9 0c JMP $0cf9 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
palette:
14b0 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
14c0 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0dfa : ad b5 10 LDA $10b5 ; (zsm_finished + 0)
.s1001:
0dfd : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0dfe : a9 01 __ LDA #$01
0e00 : 8d b5 10 STA $10b5 ; (zsm_finished + 0)
0e03 : ad d0 14 LDA $14d0 ; (zsm_reading + 0)
0e06 : f0 0a __ BEQ $0e12 ; (zsm_init.s3 + 0)
.s1:
0e08 : a9 02 __ LDA #$02
0e0a : 20 57 0e JSR $0e57 ; (krnio_close.s1000 + 0)
0e0d : a9 00 __ LDA #$00
0e0f : 8d d0 14 STA $14d0 ; (zsm_reading + 0)
.s3:
0e12 : 8d 02 19 STA $1902 ; (zsm_pos + 0)
0e15 : 8d 03 19 STA $1903 ; (zsm_pos + 1)
0e18 : 8d 04 19 STA $1904 ; (zsm_wpos + 0)
0e1b : 8d 05 19 STA $1905 ; (zsm_wpos + 1)
0e1e : 8d 01 15 STA $1501 ; (zsm_delay + 0)
0e21 : a5 30 __ LDA P3 ; (fname + 0)
0e23 : 85 2d __ STA P0 
0e25 : a5 31 __ LDA P4 ; (fname + 1)
0e27 : 85 2e __ STA P1 
0e29 : 20 5f 0e JSR $0e5f ; (krnio_setnam.s0 + 0)
0e2c : a9 02 __ LDA #$02
0e2e : 85 2d __ STA P0 
0e30 : 85 2f __ STA P2 
0e32 : a9 08 __ LDA #$08
0e34 : 85 2e __ STA P1 
0e36 : 20 75 0e JSR $0e75 ; (krnio_open.s0 + 0)
0e39 : a5 3b __ LDA ACCU + 0 
0e3b : f0 19 __ BEQ $0e56 ; (zsm_init.s1001 + 0)
.s4:
0e3d : a9 01 __ LDA #$01
0e3f : 8d d0 14 STA $14d0 ; (zsm_reading + 0)
0e42 : 20 9d 0e JSR $0e9d ; (zsm_fill.s0 + 0)
0e45 : a9 10 __ LDA #$10
0e47 : 8d 02 19 STA $1902 ; (zsm_pos + 0)
0e4a : a9 00 __ LDA #$00
0e4c : 8d 03 19 STA $1903 ; (zsm_pos + 1)
0e4f : 8d b5 10 STA $10b5 ; (zsm_finished + 0)
0e52 : a9 01 __ LDA #$01
0e54 : 85 3b __ STA ACCU + 0 
.s1001:
0e56 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
14d0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0e57 : 85 2d __ STA P0 
.s0:
0e59 : a5 2d __ LDA P0 
0e5b : 20 c3 ff JSR $ffc3 
.s1001:
0e5e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
1904 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0e5f : a5 2d __ LDA P0 
0e61 : 05 2e __ ORA P1 
0e63 : f0 08 __ BEQ $0e6d ; (krnio_setnam.s0 + 14)
0e65 : a0 ff __ LDY #$ff
0e67 : c8 __ __ INY
0e68 : b1 2d __ LDA (P0),y 
0e6a : d0 fb __ BNE $0e67 ; (krnio_setnam.s0 + 8)
0e6c : 98 __ __ TYA
0e6d : a6 2d __ LDX P0 
0e6f : a4 2e __ LDY P1 
0e71 : 20 bd ff JSR $ffbd 
.s1001:
0e74 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0e75 : a9 00 __ LDA #$00
0e77 : a6 2d __ LDX P0 ; (fnum + 0)
0e79 : 9d 06 19 STA $1906,x ; (krnio_pstatus + 0)
0e7c : a9 00 __ LDA #$00
0e7e : 85 3b __ STA ACCU + 0 
0e80 : 85 3c __ STA ACCU + 1 
0e82 : a5 2d __ LDA P0 ; (fnum + 0)
0e84 : a6 2e __ LDX P1 
0e86 : a4 2f __ LDY P2 
0e88 : 20 ba ff JSR $ffba 
0e8b : 20 c0 ff JSR $ffc0 
0e8e : 90 08 __ BCC $0e98 ; (krnio_open.s0 + 35)
0e90 : a5 2d __ LDA P0 ; (fnum + 0)
0e92 : 20 c3 ff JSR $ffc3 
0e95 : 4c 9c 0e JMP $0e9c ; (krnio_open.s1001 + 0)
0e98 : a9 01 __ LDA #$01
0e9a : 85 3b __ STA ACCU + 0 
.s1001:
0e9c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
1906 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0e9d : ad d0 14 LDA $14d0 ; (zsm_reading + 0)
0ea0 : f0 20 __ BEQ $0ec2 ; (zsm_fill.s1 + 0)
.s2:
0ea2 : ad 03 19 LDA $1903 ; (zsm_pos + 1)
0ea5 : 18 __ __ CLC
0ea6 : 69 04 __ ADC #$04
0ea8 : cd 05 19 CMP $1905 ; (zsm_wpos + 1)
0eab : d0 0c __ BNE $0eb9 ; (zsm_fill.s6 + 0)
.s1006:
0ead : ad 04 19 LDA $1904 ; (zsm_wpos + 0)
0eb0 : cd 02 19 CMP $1902 ; (zsm_pos + 0)
0eb3 : d0 04 __ BNE $0eb9 ; (zsm_fill.s6 + 0)
.s5:
0eb5 : a9 00 __ LDA #$00
0eb7 : f0 0b __ BEQ $0ec4 ; (zsm_fill.s1008 + 0)
.s6:
0eb9 : a9 02 __ LDA #$02
0ebb : 20 41 0f JSR $0f41 ; (krnio_chkin.s1000 + 0)
0ebe : a5 3b __ LDA ACCU + 0 
0ec0 : d0 07 __ BNE $0ec9 ; (zsm_fill.s9 + 0)
.s1:
0ec2 : a9 ff __ LDA #$ff
.s1008:
0ec4 : 85 3b __ STA ACCU + 0 
.s1001:
0ec6 : 85 3c __ STA ACCU + 1 
0ec8 : 60 __ __ RTS
.s9:
0ec9 : a9 00 __ LDA #$00
0ecb : 85 47 __ STA T1 + 0 
0ecd : 85 48 __ STA T1 + 1 
0ecf : ad 03 19 LDA $1903 ; (zsm_pos + 1)
0ed2 : 18 __ __ CLC
0ed3 : 69 04 __ ADC #$04
0ed5 : cd 05 19 CMP $1905 ; (zsm_wpos + 1)
0ed8 : d0 08 __ BNE $0ee2 ; (zsm_fill.l13 + 0)
.s1002:
0eda : ad 04 19 LDA $1904 ; (zsm_wpos + 0)
0edd : cd 02 19 CMP $1902 ; (zsm_pos + 0)
0ee0 : f0 49 __ BEQ $0f2b ; (zsm_fill.s37 + 0)
.l13:
0ee2 : 20 53 0f JSR $0f53 ; (krnio_chrin.s0 + 0)
0ee5 : ad 04 19 LDA $1904 ; (zsm_wpos + 0)
0ee8 : aa __ __ TAX
0ee9 : 18 __ __ CLC
0eea : 69 01 __ ADC #$01
0eec : 8d 04 19 STA $1904 ; (zsm_wpos + 0)
0eef : ad 05 19 LDA $1905 ; (zsm_wpos + 1)
0ef2 : a8 __ __ TAY
0ef3 : 69 00 __ ADC #$00
0ef5 : 8d 05 19 STA $1905 ; (zsm_wpos + 1)
0ef8 : 8a __ __ TXA
0ef9 : 18 __ __ CLC
0efa : 69 02 __ ADC #$02
0efc : 85 49 __ STA T3 + 0 
0efe : 98 __ __ TYA
0eff : 29 03 __ AND #$03
0f01 : 69 15 __ ADC #$15
0f03 : 85 4a __ STA T3 + 1 
0f05 : a5 3b __ LDA ACCU + 0 
0f07 : a0 00 __ LDY #$00
0f09 : 91 49 __ STA (T3 + 0),y 
0f0b : e6 47 __ INC T1 + 0 
0f0d : d0 02 __ BNE $0f11 ; (zsm_fill.s1010 + 0)
.s1009:
0f0f : e6 48 __ INC T1 + 1 
.s1010:
0f11 : 20 5d 0f JSR $0f5d ; (krnio_status.s0 + 0)
0f14 : a5 3b __ LDA ACCU + 0 
0f16 : d0 0e __ BNE $0f26 ; (zsm_fill.s15 + 0)
.s12:
0f18 : ad 03 19 LDA $1903 ; (zsm_pos + 1)
0f1b : 18 __ __ CLC
0f1c : 69 04 __ ADC #$04
0f1e : cd 05 19 CMP $1905 ; (zsm_wpos + 1)
0f21 : d0 bf __ BNE $0ee2 ; (zsm_fill.l13 + 0)
0f23 : 4c da 0e JMP $0eda ; (zsm_fill.s1002 + 0)
.s15:
0f26 : a9 00 __ LDA #$00
0f28 : 8d d0 14 STA $14d0 ; (zsm_reading + 0)
.s37:
0f2b : 20 67 0f JSR $0f67 ; (krnio_clrchn.s0 + 0)
0f2e : ad d0 14 LDA $14d0 ; (zsm_reading + 0)
0f31 : d0 05 __ BNE $0f38 ; (zsm_fill.s21 + 0)
.s19:
0f33 : a9 02 __ LDA #$02
0f35 : 20 57 0e JSR $0e57 ; (krnio_close.s1000 + 0)
.s21:
0f38 : a5 47 __ LDA T1 + 0 
0f3a : 85 3b __ STA ACCU + 0 
0f3c : a5 48 __ LDA T1 + 1 
0f3e : 4c c6 0e JMP $0ec6 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0f41 : 85 2d __ STA P0 
.s0:
0f43 : a6 2d __ LDX P0 
0f45 : 20 c6 ff JSR $ffc6 
0f48 : a9 00 __ LDA #$00
0f4a : 85 3c __ STA ACCU + 1 
0f4c : b0 02 __ BCS $0f50 ; (krnio_chkin.s0 + 13)
0f4e : a9 01 __ LDA #$01
0f50 : 85 3b __ STA ACCU + 0 
.s1001:
0f52 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0f53 : 20 cf ff JSR $ffcf 
0f56 : 85 3b __ STA ACCU + 0 
0f58 : a9 00 __ LDA #$00
0f5a : 85 3c __ STA ACCU + 1 
.s1001:
0f5c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0f5d : 20 b7 ff JSR $ffb7 
0f60 : 85 3b __ STA ACCU + 0 
0f62 : a9 00 __ LDA #$00
0f64 : 85 3c __ STA ACCU + 1 
.s1001:
0f66 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0f67 : 20 cc ff JSR $ffcc 
.s1001:
0f6a : 60 __ __ RTS
--------------------------------------------------------------------
0f6b : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0f7b : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0f89 : 20 a5 0f JSR $0fa5 ; (getchx.s0 + 0)
0f8c : a5 3c __ LDA ACCU + 1 
0f8e : d0 10 __ BNE $0fa0 ; (Control.s3 + 0)
.s1005:
0f90 : a5 3b __ LDA ACCU + 0 
0f92 : c9 20 __ CMP #$20
0f94 : d0 0a __ BNE $0fa0 ; (Control.s3 + 0)
.s1:
0f96 : a9 00 __ LDA #$00
0f98 : c5 2e __ CMP P1 ; (playing + 0)
0f9a : 2a __ __ ROL
0f9b : 85 2e __ STA P1 ; (playing + 0)
0f9d : 20 d6 0f JSR $0fd6 ; (zsm_irq_play.s0 + 0)
.s3:
0fa0 : a5 2e __ LDA P1 ; (playing + 0)
0fa2 : 85 3b __ STA ACCU + 0 
.s1001:
0fa4 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0fa5 : 20 af 0f JSR $0faf ; (getpch + 0)
0fa8 : 85 3b __ STA ACCU + 0 
0faa : a9 00 __ LDA #$00
0fac : 85 3c __ STA ACCU + 1 
.s1001:
0fae : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0faf : 20 e4 ff JSR $ffe4 
0fb2 : ae d1 14 LDX $14d1 ; (giocharmap + 0)
0fb5 : e0 01 __ CPX #$01
0fb7 : 90 1c __ BCC $0fd5 ; (getpch + 38)
0fb9 : c9 0d __ CMP #$0d
0fbb : d0 02 __ BNE $0fbf ; (getpch + 16)
0fbd : a9 0a __ LDA #$0a
0fbf : e0 02 __ CPX #$02
0fc1 : 90 12 __ BCC $0fd5 ; (getpch + 38)
0fc3 : c9 41 __ CMP #$41
0fc5 : 90 0e __ BCC $0fd5 ; (getpch + 38)
0fc7 : c9 7b __ CMP #$7b
0fc9 : b0 0a __ BCS $0fd5 ; (getpch + 38)
0fcb : c9 61 __ CMP #$61
0fcd : b0 04 __ BCS $0fd3 ; (getpch + 36)
0fcf : c9 5b __ CMP #$5b
0fd1 : b0 02 __ BCS $0fd5 ; (getpch + 38)
0fd3 : 49 20 __ EOR #$20
0fd5 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
14d1 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0fd6 : 8d b4 10 STA $10b4 ; (zsm_playing + 0)
.s1001:
0fd9 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
14d2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
14d4 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
14e4 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
14f4 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
1916 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0fda : ad 26 9f LDA $9f26 
0fdd : 29 40 __ AND #$40
0fdf : d0 f9 __ BNE $0fda ; (frame_wait.l1 + 0)
.l4:
0fe1 : ad 26 9f LDA $9f26 
0fe4 : 29 40 __ AND #$40
0fe6 : f0 f9 __ BEQ $0fe1 ; (frame_wait.l4 + 0)
.s1001:
0fe8 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0fe9 : 38 __ __ SEC
0fea : a9 00 __ LDA #$00
0fec : e5 3b __ SBC ACCU + 0 
0fee : 85 3b __ STA ACCU + 0 
0ff0 : a9 00 __ LDA #$00
0ff2 : e5 3c __ SBC ACCU + 1 
0ff4 : 85 3c __ STA ACCU + 1 
0ff6 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0ff7 : 38 __ __ SEC
0ff8 : a9 00 __ LDA #$00
0ffa : e5 23 __ SBC WORK + 0 
0ffc : 85 23 __ STA WORK + 0 
0ffe : a9 00 __ LDA #$00
1000 : e5 24 __ SBC WORK + 1 
1002 : 85 24 __ STA WORK + 1 
1004 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1005 : a5 3c __ LDA ACCU + 1 
1007 : d0 31 __ BNE $103a ; (divmod + 53)
1009 : a5 24 __ LDA WORK + 1 
100b : d0 1e __ BNE $102b ; (divmod + 38)
100d : 85 26 __ STA WORK + 3 
100f : a2 04 __ LDX #$04
1011 : 06 3b __ ASL ACCU + 0 
1013 : 2a __ __ ROL
1014 : c5 23 __ CMP WORK + 0 
1016 : 90 02 __ BCC $101a ; (divmod + 21)
1018 : e5 23 __ SBC WORK + 0 
101a : 26 3b __ ROL ACCU + 0 
101c : 2a __ __ ROL
101d : c5 23 __ CMP WORK + 0 
101f : 90 02 __ BCC $1023 ; (divmod + 30)
1021 : e5 23 __ SBC WORK + 0 
1023 : 26 3b __ ROL ACCU + 0 
1025 : ca __ __ DEX
1026 : d0 eb __ BNE $1013 ; (divmod + 14)
1028 : 85 25 __ STA WORK + 2 
102a : 60 __ __ RTS
102b : a5 3b __ LDA ACCU + 0 
102d : 85 25 __ STA WORK + 2 
102f : a5 3c __ LDA ACCU + 1 
1031 : 85 26 __ STA WORK + 3 
1033 : a9 00 __ LDA #$00
1035 : 85 3b __ STA ACCU + 0 
1037 : 85 3c __ STA ACCU + 1 
1039 : 60 __ __ RTS
103a : a5 24 __ LDA WORK + 1 
103c : d0 1f __ BNE $105d ; (divmod + 88)
103e : a5 23 __ LDA WORK + 0 
1040 : 30 1b __ BMI $105d ; (divmod + 88)
1042 : a9 00 __ LDA #$00
1044 : 85 26 __ STA WORK + 3 
1046 : a2 10 __ LDX #$10
1048 : 06 3b __ ASL ACCU + 0 
104a : 26 3c __ ROL ACCU + 1 
104c : 2a __ __ ROL
104d : c5 23 __ CMP WORK + 0 
104f : 90 02 __ BCC $1053 ; (divmod + 78)
1051 : e5 23 __ SBC WORK + 0 
1053 : 26 3b __ ROL ACCU + 0 
1055 : 26 3c __ ROL ACCU + 1 
1057 : ca __ __ DEX
1058 : d0 f2 __ BNE $104c ; (divmod + 71)
105a : 85 25 __ STA WORK + 2 
105c : 60 __ __ RTS
105d : a9 00 __ LDA #$00
105f : 85 25 __ STA WORK + 2 
1061 : 85 26 __ STA WORK + 3 
1063 : 84 22 __ STY $22 
1065 : a0 10 __ LDY #$10
1067 : 18 __ __ CLC
1068 : 26 3b __ ROL ACCU + 0 
106a : 26 3c __ ROL ACCU + 1 
106c : 26 25 __ ROL WORK + 2 
106e : 26 26 __ ROL WORK + 3 
1070 : 38 __ __ SEC
1071 : a5 25 __ LDA WORK + 2 
1073 : e5 23 __ SBC WORK + 0 
1075 : aa __ __ TAX
1076 : a5 26 __ LDA WORK + 3 
1078 : e5 24 __ SBC WORK + 1 
107a : 90 04 __ BCC $1080 ; (divmod + 123)
107c : 86 25 __ STX WORK + 2 
107e : 85 26 __ STA WORK + 3 
1080 : 88 __ __ DEY
1081 : d0 e5 __ BNE $1068 ; (divmod + 99)
1083 : 26 3b __ ROL ACCU + 0 
1085 : 26 3c __ ROL ACCU + 1 
1087 : a4 22 __ LDY $22 
1089 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
108a : 24 3c __ BIT ACCU + 1 
108c : 10 0d __ BPL $109b ; (mods16 + 17)
108e : 20 e9 0f JSR $0fe9 ; (negaccu + 0)
1091 : 24 24 __ BIT WORK + 1 
1093 : 10 0d __ BPL $10a2 ; (mods16 + 24)
1095 : 20 f7 0f JSR $0ff7 ; (negtmp + 0)
1098 : 4c 05 10 JMP $1005 ; (divmod + 0)
109b : 24 24 __ BIT WORK + 1 
109d : 10 f9 __ BPL $1098 ; (mods16 + 14)
109f : 20 f7 0f JSR $0ff7 ; (negtmp + 0)
10a2 : 20 05 10 JSR $1005 ; (divmod + 0)
10a5 : 38 __ __ SEC
10a6 : a9 00 __ LDA #$00
10a8 : e5 25 __ SBC WORK + 2 
10aa : 85 25 __ STA WORK + 2 
10ac : a9 00 __ LDA #$00
10ae : e5 26 __ SBC WORK + 3 
10b0 : 85 26 __ STA WORK + 3 
10b2 : 60 __ __ RTS
