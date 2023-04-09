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
080e : 8e b5 10 STX $10b5 ; (spentry + 0)
0811 : a9 2b __ LDA #$2b
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
0830 : a9 2b __ LDA #$2b
0832 : e9 2b __ SBC #$2b
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
10b5 : __ __ __ BYT 00                                              : .
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
08af : 85 4d __ STA T1 + 0 
.l2:
08b1 : a9 03 __ LDA #$03
08b3 : 8d 2c 9f STA $9f2c 
08b6 : 20 fc 0d JSR $0dfc ; (zsm_check.s0 + 0)
08b9 : 09 00 __ ORA #$00
08bb : f0 0b __ BEQ $08c8 ; (main.s6 + 0)
.s4:
08bd : a9 6d __ LDA #$6d
08bf : 85 30 __ STA P3 
08c1 : a9 0f __ LDA #$0f
08c3 : 85 31 __ STA P4 
08c5 : 20 00 0e JSR $0e00 ; (zsm_init.s0 + 0)
.s6:
08c8 : a5 4d __ LDA T1 + 0 
08ca : 85 2e __ STA P1 
08cc : 20 8b 0f JSR $0f8b ; (Control.s0 + 0)
08cf : a5 3b __ LDA ACCU + 0 
08d1 : 85 4d __ STA T1 + 0 
08d3 : ad d4 14 LDA $14d4 ; (FrameCount + 0)
08d6 : 85 48 __ STA T3 + 0 
08d8 : 85 3b __ STA ACCU + 0 
08da : ad d5 14 LDA $14d5 ; (FrameCount + 1)
08dd : 85 3c __ STA ACCU + 1 
08df : a9 04 __ LDA #$04
08e1 : 85 23 __ STA WORK + 0 
08e3 : a9 00 __ LDA #$00
08e5 : 85 24 __ STA WORK + 1 
08e7 : 20 8c 10 JSR $108c ; (mods16 + 0)
08ea : a5 26 __ LDA WORK + 3 
08ec : d0 16 __ BNE $0904 ; (main.s9 + 0)
.s1002:
08ee : a5 25 __ LDA WORK + 2 
08f0 : c9 01 __ CMP #$01
08f2 : d0 10 __ BNE $0904 ; (main.s9 + 0)
.s7:
08f4 : ae ed 14 LDX $14ed ; (off1 + 0)
08f7 : e8 __ __ INX
08f8 : 8e ed 14 STX $14ed ; (off1 + 0)
08fb : bd ff 14 LDA $14ff,x 
08fe : 38 __ __ SEC
08ff : e9 40 __ SBC #$40
0901 : 8d 23 9f STA $9f23 
.s9:
0904 : 06 48 __ ASL T3 + 0 
0906 : ad d5 14 LDA $14d5 ; (FrameCount + 1)
0909 : 2a __ __ ROL
090a : 18 __ __ CLC
090b : 69 ff __ ADC #$ff
090d : 8d 38 9f STA $9f38 
0910 : a5 48 __ LDA T3 + 0 
0912 : 8d 37 9f STA $9f37 
0915 : a9 01 __ LDA #$01
0917 : 8d 2c 9f STA $9f2c 
091a : 20 9f 0e JSR $0e9f ; (zsm_fill.s0 + 0)
091d : a9 00 __ LDA #$00
091f : 8d 2c 9f STA $9f2c 
0922 : 20 dc 0f JSR $0fdc ; (frame_wait.l1 + 0)
0925 : ee d4 14 INC $14d4 ; (FrameCount + 0)
0928 : d0 87 __ BNE $08b1 ; (main.l2 + 0)
.s1003:
092a : ee d5 14 INC $14d5 ; (FrameCount + 1)
092d : 4c b1 08 JMP $08b1 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
0930 : 78 __ __ SEI
0931 : ad 14 03 LDA $0314 
0934 : 8d d6 14 STA $14d6 ; (oirq + 0)
0937 : ad 15 03 LDA $0315 
093a : 8d d7 14 STA $14d7 ; (oirq + 1)
093d : a9 49 __ LDA #$49
093f : 8d 14 03 STA $0314 
0942 : a9 09 __ LDA #$09
0944 : 8d 15 03 STA $0315 
0947 : 58 __ __ CLI
.s1001:
0948 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
14d6 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0949 : 20 4f 09 JSR $094f ; (irq.s1000 + 0)
094c : 6c d6 14 JMP ($14d6)
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
0979 : ad b6 10 LDA $10b6 ; (zsm_playing + 0)
097c : f0 08 __ BEQ $0986 ; (irq.s1001 + 0)
.s4:
097e : ad b7 10 LDA $10b7 ; (zsm_finished + 0)
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
10b6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
10b7 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09b1 : ad d8 14 LDA $14d8 ; (zsm_delay + 0)
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
09d5 : ad d9 14 LDA $14d9 ; (zsm_pos + 0)
09d8 : 85 4b __ STA T3 + 0 
09da : 18 __ __ CLC
09db : 69 01 __ ADC #$01
09dd : 85 4d __ STA T4 + 0 
09df : 8d d9 14 STA $14d9 ; (zsm_pos + 0)
09e2 : ad da 14 LDA $14da ; (zsm_pos + 1)
09e5 : aa __ __ TAX
09e6 : 69 00 __ ADC #$00
09e8 : 85 4e __ STA T4 + 1 
09ea : 8d da 14 STA $14da ; (zsm_pos + 1)
09ed : 18 __ __ CLC
09ee : a9 2b __ LDA #$2b
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
0a09 : a9 2b __ LDA #$2b
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
0a1e : 8d d9 14 STA $14d9 ; (zsm_pos + 0)
0a21 : 98 __ __ TYA
0a22 : 65 4e __ ADC T4 + 1 
0a24 : 8d da 14 STA $14da ; (zsm_pos + 1)
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
0a37 : a9 2b __ LDA #$2b
0a39 : 6d d9 14 ADC $14d9 ; (zsm_pos + 0)
0a3c : 85 4d __ STA T4 + 0 
0a3e : ad da 14 LDA $14da ; (zsm_pos + 1)
0a41 : 29 03 __ AND #$03
0a43 : 69 15 __ ADC #$15
0a45 : 85 4e __ STA T4 + 1 
0a47 : a0 00 __ LDY #$00
0a49 : b1 4d __ LDA (T4 + 0),y 
0a4b : 85 2d __ STA P0 
0a4d : ad d9 14 LDA $14d9 ; (zsm_pos + 0)
0a50 : 18 __ __ CLC
0a51 : 69 01 __ ADC #$01
0a53 : aa __ __ TAX
0a54 : ad da 14 LDA $14da ; (zsm_pos + 1)
0a57 : 69 00 __ ADC #$00
0a59 : 29 03 __ AND #$03
0a5b : 85 4c __ STA T3 + 1 
0a5d : 8a __ __ TXA
0a5e : 18 __ __ CLC
0a5f : 69 2b __ ADC #$2b
0a61 : 85 4b __ STA T3 + 0 
0a63 : a9 15 __ LDA #$15
0a65 : 65 4c __ ADC T3 + 1 
0a67 : 85 4c __ STA T3 + 1 
0a69 : b1 4b __ LDA (T3 + 0),y 
0a6b : 85 2e __ STA P1 
0a6d : 20 ea 0a JSR $0aea ; (sfx_put.l1 + 0)
0a70 : ad d9 14 LDA $14d9 ; (zsm_pos + 0)
0a73 : 18 __ __ CLC
0a74 : 69 02 __ ADC #$02
0a76 : 8d d9 14 STA $14d9 ; (zsm_pos + 0)
0a79 : 90 03 __ BCC $0a7e ; (zsm_play.s1015 + 0)
.s1014:
0a7b : ee da 14 INC $14da ; (zsm_pos + 1)
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
0a8f : 8d b7 10 STA $10b7 ; (zsm_finished + 0)
0a92 : d0 08 __ BNE $0a9c ; (zsm_play.s7 + 0)
.s22:
0a94 : 29 7f __ AND #$7f
0a96 : 38 __ __ SEC
0a97 : e9 01 __ SBC #$01
0a99 : 8d d8 14 STA $14d8 ; (zsm_delay + 0)
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
0ac6 : 8d d9 14 STA $14d9 ; (zsm_pos + 0)
0ac9 : 90 01 __ BCC $0acc ; (zsm_play.s1017 + 0)
.s1016:
0acb : e8 __ __ INX
.s1017:
0acc : 8e da 14 STX $14da ; (zsm_pos + 1)
0acf : 18 __ __ CLC
0ad0 : a9 2b __ LDA #$2b
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
0ae6 : ce d8 14 DEC $14d8 ; (zsm_delay + 0)
0ae9 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
14d8 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
152b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
14d9 : __ __ __ BSS	2
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
0b51 : a9 00 __ LDA #$00
0b53 : 85 4a __ STA T1 + 0 
0b55 : 85 4b __ STA T2 + 0 
0b57 : 85 4c __ STA T2 + 1 
.l1003:
0b59 : 85 35 __ STA P8 
0b5b : a9 00 __ LDA #$00
0b5d : 8d f3 9e STA $9ef3 ; (sstack + 0)
0b60 : 8d f6 9e STA $9ef6 ; (sstack + 3)
0b63 : 8d f7 9e STA $9ef7 ; (sstack + 4)
0b66 : a9 30 __ LDA #$30
0b68 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0b6b : a9 01 __ LDA #$01
0b6d : 8d f5 9e STA $9ef5 ; (sstack + 2)
0b70 : 8d f9 9e STA $9ef9 ; (sstack + 6)
0b73 : 8d fb 9e STA $9efb ; (sstack + 8)
0b76 : a9 03 __ LDA #$03
0b78 : 8d f8 9e STA $9ef8 ; (sstack + 5)
0b7b : 8d fa 9e STA $9efa ; (sstack + 7)
0b7e : a9 b8 __ LDA #$b8
0b80 : 8d fc 9e STA $9efc ; (sstack + 9)
0b83 : a9 10 __ LDA #$10
0b85 : 8d fd 9e STA $9efd ; (sstack + 10)
0b88 : a9 02 __ LDA #$02
0b8a : 8d fe 9e STA $9efe ; (sstack + 11)
0b8d : 8d ff 9e STA $9eff ; (sstack + 12)
0b90 : 20 8a 0c JSR $0c8a ; (Setup.s0 + 0)
0b93 : a5 35 __ LDA P8 
0b95 : 85 2d __ STA P0 
0b97 : a5 4b __ LDA T2 + 0 
0b99 : 85 2e __ STA P1 
0b9b : a5 4c __ LDA T2 + 1 
0b9d : 85 2f __ STA P2 
0b9f : a9 a0 __ LDA #$a0
0ba1 : 85 30 __ STA P3 
0ba3 : a9 01 __ LDA #$01
0ba5 : 85 31 __ STA P4 
0ba7 : 20 99 0d JSR $0d99 ; (vera_spr_move.s0 + 0)
0baa : a9 00 __ LDA #$00
0bac : 8d f3 9e STA $9ef3 ; (sstack + 0)
0baf : 8d f6 9e STA $9ef6 ; (sstack + 3)
0bb2 : 8d f7 9e STA $9ef7 ; (sstack + 4)
0bb5 : a9 30 __ LDA #$30
0bb7 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0bba : a9 01 __ LDA #$01
0bbc : 8d f5 9e STA $9ef5 ; (sstack + 2)
0bbf : 8d f9 9e STA $9ef9 ; (sstack + 6)
0bc2 : 8d fb 9e STA $9efb ; (sstack + 8)
0bc5 : a9 03 __ LDA #$03
0bc7 : 8d f8 9e STA $9ef8 ; (sstack + 5)
0bca : 8d fa 9e STA $9efa ; (sstack + 7)
0bcd : a9 b8 __ LDA #$b8
0bcf : 8d fc 9e STA $9efc ; (sstack + 9)
0bd2 : a9 10 __ LDA #$10
0bd4 : 8d fd 9e STA $9efd ; (sstack + 10)
0bd7 : a9 02 __ LDA #$02
0bd9 : 8d fe 9e STA $9efe ; (sstack + 11)
0bdc : 8d ff 9e STA $9eff ; (sstack + 12)
0bdf : e6 35 __ INC P8 
0be1 : 20 8a 0c JSR $0c8a ; (Setup.s0 + 0)
0be4 : a5 35 __ LDA P8 
0be6 : 85 2d __ STA P0 
0be8 : a5 4b __ LDA T2 + 0 
0bea : 85 2e __ STA P1 
0bec : a5 4c __ LDA T2 + 1 
0bee : 85 2f __ STA P2 
0bf0 : a9 70 __ LDA #$70
0bf2 : 85 30 __ STA P3 
0bf4 : a9 01 __ LDA #$01
0bf6 : 85 31 __ STA P4 
0bf8 : 20 99 0d JSR $0d99 ; (vera_spr_move.s0 + 0)
0bfb : 18 __ __ CLC
0bfc : a5 2e __ LDA P1 
0bfe : 69 40 __ ADC #$40
0c00 : 85 4b __ STA T2 + 0 
0c02 : a5 2f __ LDA P2 
0c04 : 69 00 __ ADC #$00
0c06 : 85 4c __ STA T2 + 1 
0c08 : 18 __ __ CLC
0c09 : a5 4a __ LDA T1 + 0 
0c0b : 69 02 __ ADC #$02
0c0d : 85 4a __ STA T1 + 0 
0c0f : c9 16 __ CMP #$16
0c11 : b0 03 __ BCS $0c16 ; (SetUpSprites.s4 + 0)
0c13 : 4c 59 0b JMP $0b59 ; (SetUpSprites.l1003 + 0)
.s4:
0c16 : a9 17 __ LDA #$17
0c18 : 85 35 __ STA P8 
0c1a : a9 00 __ LDA #$00
0c1c : 8d f3 9e STA $9ef3 ; (sstack + 0)
0c1f : 8d f6 9e STA $9ef6 ; (sstack + 3)
0c22 : 8d f7 9e STA $9ef7 ; (sstack + 4)
0c25 : a9 31 __ LDA #$31
0c27 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0c2a : a9 01 __ LDA #$01
0c2c : 8d f5 9e STA $9ef5 ; (sstack + 2)
0c2f : 8d fb 9e STA $9efb ; (sstack + 8)
0c32 : 8d ff 9e STA $9eff ; (sstack + 12)
0c35 : a9 02 __ LDA #$02
0c37 : 8d f8 9e STA $9ef8 ; (sstack + 5)
0c3a : 8d f9 9e STA $9ef9 ; (sstack + 6)
0c3d : a9 03 __ LDA #$03
0c3f : 8d fa 9e STA $9efa ; (sstack + 7)
0c42 : a9 f8 __ LDA #$f8
0c44 : 8d fe 9e STA $9efe ; (sstack + 11)
0c47 : a9 ba __ LDA #$ba
0c49 : 8d fc 9e STA $9efc ; (sstack + 9)
0c4c : a9 12 __ LDA #$12
0c4e : 8d fd 9e STA $9efd ; (sstack + 10)
0c51 : 20 8a 0c JSR $0c8a ; (Setup.s0 + 0)
0c54 : a9 17 __ LDA #$17
0c56 : 85 2d __ STA P0 
0c58 : a9 1a __ LDA #$1a
0c5a : 85 2e __ STA P1 
0c5c : a9 01 __ LDA #$01
0c5e : 85 2f __ STA P2 
0c60 : 85 31 __ STA P4 
0c62 : a9 b8 __ LDA #$b8
0c64 : 85 30 __ STA P3 
0c66 : 20 99 0d JSR $0d99 ; (vera_spr_move.s0 + 0)
0c69 : a9 20 __ LDA #$20
0c6b : 85 37 __ STA P10 
0c6d : 8d f3 9e STA $9ef3 ; (sstack + 0)
0c70 : a9 fa __ LDA #$fa
0c72 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0c75 : a9 01 __ LDA #$01
0c77 : 8d f5 9e STA $9ef5 ; (sstack + 2)
0c7a : a9 00 __ LDA #$00
0c7c : 8d f6 9e STA $9ef6 ; (sstack + 3)
0c7f : a9 b2 __ LDA #$b2
0c81 : 85 35 __ STA P8 
0c83 : a9 14 __ LDA #$14
0c85 : 85 36 __ STA P9 
0c87 : 4c d5 0d JMP $0dd5 ; (SetPaletteColours.s0 + 0)
--------------------------------------------------------------------
Setup:
.s0:
0c8a : ad f3 9e LDA $9ef3 ; (sstack + 0)
0c8d : 85 2d __ STA P0 
0c8f : ad f4 9e LDA $9ef4 ; (sstack + 1)
0c92 : 85 2e __ STA P1 
0c94 : ad f5 9e LDA $9ef5 ; (sstack + 2)
0c97 : 85 2f __ STA P2 
0c99 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0c9c : 85 30 __ STA P3 
0c9e : ad fc 9e LDA $9efc ; (sstack + 9)
0ca1 : 85 31 __ STA P4 
0ca3 : ad fd 9e LDA $9efd ; (sstack + 10)
0ca6 : 85 32 __ STA P5 
0ca8 : ad fe 9e LDA $9efe ; (sstack + 11)
0cab : 85 33 __ STA P6 
0cad : ad ff 9e LDA $9eff ; (sstack + 12)
0cb0 : 85 34 __ STA P7 
0cb2 : 20 fb 0c JSR $0cfb ; (vram_putn.s0 + 0)
0cb5 : a5 35 __ LDA P8 ; (spr + 0)
0cb7 : 85 2d __ STA P0 
0cb9 : ad f3 9e LDA $9ef3 ; (sstack + 0)
0cbc : 85 47 __ STA T0 + 0 
0cbe : ad f4 9e LDA $9ef4 ; (sstack + 1)
0cc1 : 85 48 __ STA T0 + 1 
0cc3 : ad f5 9e LDA $9ef5 ; (sstack + 2)
0cc6 : 85 49 __ STA T0 + 2 
0cc8 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0ccb : a2 05 __ LDX #$05
.l1002:
0ccd : 4a __ __ LSR
0cce : 66 49 __ ROR T0 + 2 
0cd0 : 66 48 __ ROR T0 + 1 
0cd2 : 66 47 __ ROR T0 + 0 
0cd4 : ca __ __ DEX
0cd5 : d0 f6 __ BNE $0ccd ; (Setup.l1002 + 0)
.s1003:
0cd7 : a5 47 __ LDA T0 + 0 
0cd9 : 85 2e __ STA P1 
0cdb : a5 48 __ LDA T0 + 1 
0cdd : 85 2f __ STA P2 
0cdf : ad f7 9e LDA $9ef7 ; (sstack + 4)
0ce2 : 85 30 __ STA P3 
0ce4 : ad f8 9e LDA $9ef8 ; (sstack + 5)
0ce7 : 85 31 __ STA P4 
0ce9 : ad f9 9e LDA $9ef9 ; (sstack + 6)
0cec : 85 32 __ STA P5 
0cee : ad fa 9e LDA $9efa ; (sstack + 7)
0cf1 : 85 33 __ STA P6 
0cf3 : ad fb 9e LDA $9efb ; (sstack + 8)
0cf6 : 85 34 __ STA P7 
0cf8 : 4c 36 0d JMP $0d36 ; (vera_spr_set.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0cfb : ad 25 9f LDA $9f25 
0cfe : 29 fe __ AND #$fe
0d00 : 8d 25 9f STA $9f25 
0d03 : a5 2d __ LDA P0 ; (addr + 0)
0d05 : 8d 20 9f STA $9f20 
0d08 : a5 2e __ LDA P1 ; (addr + 1)
0d0a : 8d 21 9f STA $9f21 
0d0d : a5 2f __ LDA P2 ; (addr + 2)
0d0f : 29 01 __ AND #$01
0d11 : 09 10 __ ORA #$10
0d13 : 8d 22 9f STA $9f22 
0d16 : a5 33 __ LDA P6 ; (size + 0)
0d18 : 05 34 __ ORA P7 ; (size + 1)
0d1a : f0 19 __ BEQ $0d35 ; (vram_putn.s1001 + 0)
.s6:
0d1c : a0 00 __ LDY #$00
0d1e : a6 33 __ LDX P6 ; (size + 0)
0d20 : f0 02 __ BEQ $0d24 ; (vram_putn.l1002 + 0)
.s1005:
0d22 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0d24 : b1 31 __ LDA (P4),y ; (data + 0)
0d26 : 8d 23 9f STA $9f23 
0d29 : c8 __ __ INY
0d2a : d0 02 __ BNE $0d2e ; (vram_putn.s1009 + 0)
.s1008:
0d2c : e6 32 __ INC P5 ; (data + 1)
.s1009:
0d2e : ca __ __ DEX
0d2f : d0 f3 __ BNE $0d24 ; (vram_putn.l1002 + 0)
.s1004:
0d31 : c6 34 __ DEC P7 ; (size + 1)
0d33 : d0 ef __ BNE $0d24 ; (vram_putn.l1002 + 0)
.s1001:
0d35 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_set:
.s0:
0d36 : ad 25 9f LDA $9f25 
0d39 : 29 fe __ AND #$fe
0d3b : 8d 25 9f STA $9f25 
0d3e : a5 2d __ LDA P0 ; (spr + 0)
0d40 : 0a __ __ ASL
0d41 : 0a __ __ ASL
0d42 : 85 3b __ STA ACCU + 0 
0d44 : a9 00 __ LDA #$00
0d46 : 2a __ __ ROL
0d47 : 06 3b __ ASL ACCU + 0 
0d49 : 2a __ __ ROL
0d4a : 09 fc __ ORA #$fc
0d4c : 8d 21 9f STA $9f21 
0d4f : a5 3b __ LDA ACCU + 0 
0d51 : 8d 20 9f STA $9f20 
0d54 : a9 11 __ LDA #$11
0d56 : 8d 22 9f STA $9f22 
0d59 : a5 30 __ LDA P3 ; (mode8 + 0)
0d5b : f0 02 __ BEQ $0d5f ; (vera_spr_set.s11 + 0)
.s9:
0d5d : a9 80 __ LDA #$80
.s11:
0d5f : 05 2e __ ORA P1 ; (addr32 + 0)
0d61 : 8d 23 9f STA $9f23 
0d64 : a5 2f __ LDA P2 ; (addr32 + 1)
0d66 : 8d 23 9f STA $9f23 
0d69 : a9 00 __ LDA #$00
0d6b : 8d 23 9f STA $9f23 
0d6e : 8d 23 9f STA $9f23 
0d71 : 8d 23 9f STA $9f23 
0d74 : 8d 23 9f STA $9f23 
0d77 : a5 33 __ LDA P6 ; (z + 0)
0d79 : 0a __ __ ASL
0d7a : 0a __ __ ASL
0d7b : 8d 23 9f STA $9f23 
0d7e : a5 32 __ LDA P5 ; (h + 0)
0d80 : 4a __ __ LSR
0d81 : 85 3c __ STA ACCU + 1 
0d83 : a9 00 __ LDA #$00
0d85 : 6a __ __ ROR
0d86 : 66 3c __ ROR ACCU + 1 
0d88 : 6a __ __ ROR
0d89 : 85 3b __ STA ACCU + 0 
0d8b : a5 31 __ LDA P4 ; (w + 0)
0d8d : 0a __ __ ASL
0d8e : 0a __ __ ASL
0d8f : 0a __ __ ASL
0d90 : 0a __ __ ASL
0d91 : 05 3b __ ORA ACCU + 0 
0d93 : 05 34 __ ORA P7 ; (pal + 0)
0d95 : 8d 23 9f STA $9f23 
.s1001:
0d98 : 60 __ __ RTS
--------------------------------------------------------------------
ScrollerOutline:
10b8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10c8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10d8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10e8 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
10f8 : __ __ __ BYT 00 00 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1108 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1118 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1128 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1138 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1148 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1158 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1168 : __ __ __ BYT 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 11 : ................
1178 : __ __ __ BYT 11 11 22 22 23 22 22 22 22 22 22 22 22 22 22 22 : ..""#"""""""""""
1188 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 22 : """"""""""""""""
1198 : __ __ __ BYT 22 22 22 22 34 32 22 22 22 22 22 22 22 22 22 22 : """"42""""""""""
11a8 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 23 22 22 22 22 22 : """"""""""#"""""
11b8 : __ __ __ BYT 22 22 22 23 45 43 22 22 22 22 22 22 22 22 22 22 : """#EC""""""""""
11c8 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 22 34 32 22 22 22 22 : """"""""""42""""
11d8 : __ __ __ BYT 22 22 22 23 45 43 22 22 22 22 22 22 22 22 22 22 : """#EC""""""""""
11e8 : __ __ __ BYT 22 22 22 22 22 22 22 22 22 23 45 43 22 22 22 22 : """""""""#EC""""
11f8 : __ __ __ BYT 22 22 33 33 34 33 33 33 33 33 33 33 33 33 33 33 : ""33433333333333
1208 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 45 43 33 33 33 33 : 3333333333EC3333
1218 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 33 : 3333333333333333
1228 : __ __ __ BYT 33 33 33 33 33 33 33 33 33 33 34 33 33 33 33 33 : 3333333333433333
1238 : __ __ __ BYT 33 33 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : 33DDDDDDDDDDDDDD
1248 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1258 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1268 : __ __ __ BYT 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 44 : DDDDDDDDDDDDDDDD
1278 : __ __ __ BYT 44 44 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : DDUUUUUUUUUUUUUU
1288 : __ __ __ BYT 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 55 : UUUUUUUUUUUUUUUU
1298 : __ __ __ BYT 55 55 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : UUffffffffffffff
12a8 : __ __ __ BYT 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 66 : ffffffffffffffff
12b8 : __ __ __ BYT 66 66                                           : ff
--------------------------------------------------------------------
vera_spr_move:
.s0:
0d99 : ad 25 9f LDA $9f25 
0d9c : 29 fe __ AND #$fe
0d9e : 8d 25 9f STA $9f25 
0da1 : a5 2d __ LDA P0 ; (spr + 0)
0da3 : 0a __ __ ASL
0da4 : 0a __ __ ASL
0da5 : 85 3b __ STA ACCU + 0 
0da7 : a9 00 __ LDA #$00
0da9 : 2a __ __ ROL
0daa : 06 3b __ ASL ACCU + 0 
0dac : 2a __ __ ROL
0dad : aa __ __ TAX
0dae : a5 3b __ LDA ACCU + 0 
0db0 : 09 02 __ ORA #$02
0db2 : 8d 20 9f STA $9f20 
0db5 : 8a __ __ TXA
0db6 : 09 fc __ ORA #$fc
0db8 : 8d 21 9f STA $9f21 
0dbb : a9 11 __ LDA #$11
0dbd : 8d 22 9f STA $9f22 
0dc0 : a5 2e __ LDA P1 ; (x + 0)
0dc2 : 8d 23 9f STA $9f23 
0dc5 : a5 2f __ LDA P2 ; (x + 1)
0dc7 : 8d 23 9f STA $9f23 
0dca : a5 30 __ LDA P3 ; (y + 0)
0dcc : 8d 23 9f STA $9f23 
0dcf : a5 31 __ LDA P4 ; (y + 1)
0dd1 : 8d 23 9f STA $9f23 
.s1001:
0dd4 : 60 __ __ RTS
--------------------------------------------------------------------
Pause:
12ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
12ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 12 21 00 : ..............!.
12da : __ __ __ BYT 00 12 21 00 00 10 01 00 00 10 01 00 00 10 01 00 : ..!.............
12ea : __ __ __ BYT 00 10 01 00 00 10 01 00 00 11 11 00 00 12 21 00 : ..............!.
12fa : __ __ __ BYT 00 12 21 00 00 10 01 00 00 10 01 00 00 10 01 00 : ..!.............
130a : __ __ __ BYT 00 10 01 00 00 10 01 00 00 00 00 00 00 00 00 00 : ................
131a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
132a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
133a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
134a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 10 01 00 00 10 01 00 : ................
135a : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
136a : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
137a : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
138a : __ __ __ BYT 00 10 01 00 00 10 01 00 00 00 00 00 00 00 00 00 : ................
139a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
13ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 10 01 00 00 10 01 00 : ................
13da : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13ea : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
13fa : __ __ __ BYT 00 10 01 00 00 10 01 00 00 10 01 00 00 10 01 00 : ................
140a : __ __ __ BYT 00 10 01 00 00 10 01 00 00 00 00 00 00 00 00 00 : ................
141a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
142a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
143a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
144a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 22 22 00 : ............."".
145a : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
146a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 11 11 00 00 22 22 00 : ............."".
147a : __ __ __ BYT 00 22 22 00 00 00 00 00 00 00 00 00 00 00 00 00 : ."".............
148a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
149a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14aa : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0dd5 : ad f3 9e LDA $9ef3 ; (sstack + 0)
0dd8 : 85 2d __ STA P0 
0dda : ad f4 9e LDA $9ef4 ; (sstack + 1)
0ddd : 85 2e __ STA P1 
0ddf : ad f5 9e LDA $9ef5 ; (sstack + 2)
0de2 : 85 2f __ STA P2 
0de4 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0de7 : 85 30 __ STA P3 
0de9 : a5 35 __ LDA P8 ; (input + 0)
0deb : 85 31 __ STA P4 
0ded : a5 36 __ LDA P9 ; (input + 1)
0def : 85 32 __ STA P5 
0df1 : a5 37 __ LDA P10 ; (inputsize + 0)
0df3 : 85 33 __ STA P6 
0df5 : a9 00 __ LDA #$00
0df7 : 85 34 __ STA P7 
0df9 : 4c fb 0c JMP $0cfb ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
palette:
14b2 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
14c2 : __ __ __ BYT 00 00 ff 0f ee 0f ff ee aa 0a 88 08 66 06 44 04 : ............f.D.
--------------------------------------------------------------------
zsm_check:
.s0:
0dfc : ad b7 10 LDA $10b7 ; (zsm_finished + 0)
.s1001:
0dff : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0e00 : a9 01 __ LDA #$01
0e02 : 8d b7 10 STA $10b7 ; (zsm_finished + 0)
0e05 : ad d2 14 LDA $14d2 ; (zsm_reading + 0)
0e08 : f0 0a __ BEQ $0e14 ; (zsm_init.s3 + 0)
.s1:
0e0a : a9 02 __ LDA #$02
0e0c : 20 59 0e JSR $0e59 ; (krnio_close.s1000 + 0)
0e0f : a9 00 __ LDA #$00
0e11 : 8d d2 14 STA $14d2 ; (zsm_reading + 0)
.s3:
0e14 : 8d d9 14 STA $14d9 ; (zsm_pos + 0)
0e17 : 8d da 14 STA $14da ; (zsm_pos + 1)
0e1a : 8d db 14 STA $14db ; (zsm_wpos + 0)
0e1d : 8d dc 14 STA $14dc ; (zsm_wpos + 1)
0e20 : 8d d8 14 STA $14d8 ; (zsm_delay + 0)
0e23 : a5 30 __ LDA P3 ; (fname + 0)
0e25 : 85 2d __ STA P0 
0e27 : a5 31 __ LDA P4 ; (fname + 1)
0e29 : 85 2e __ STA P1 
0e2b : 20 61 0e JSR $0e61 ; (krnio_setnam.s0 + 0)
0e2e : a9 02 __ LDA #$02
0e30 : 85 2d __ STA P0 
0e32 : 85 2f __ STA P2 
0e34 : a9 08 __ LDA #$08
0e36 : 85 2e __ STA P1 
0e38 : 20 77 0e JSR $0e77 ; (krnio_open.s0 + 0)
0e3b : a5 3b __ LDA ACCU + 0 
0e3d : f0 19 __ BEQ $0e58 ; (zsm_init.s1001 + 0)
.s4:
0e3f : a9 01 __ LDA #$01
0e41 : 8d d2 14 STA $14d2 ; (zsm_reading + 0)
0e44 : 20 9f 0e JSR $0e9f ; (zsm_fill.s0 + 0)
0e47 : a9 10 __ LDA #$10
0e49 : 8d d9 14 STA $14d9 ; (zsm_pos + 0)
0e4c : a9 00 __ LDA #$00
0e4e : 8d da 14 STA $14da ; (zsm_pos + 1)
0e51 : 8d b7 10 STA $10b7 ; (zsm_finished + 0)
0e54 : a9 01 __ LDA #$01
0e56 : 85 3b __ STA ACCU + 0 
.s1001:
0e58 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
14d2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0e59 : 85 2d __ STA P0 
.s0:
0e5b : a5 2d __ LDA P0 
0e5d : 20 c3 ff JSR $ffc3 
.s1001:
0e60 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
14db : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0e61 : a5 2d __ LDA P0 
0e63 : 05 2e __ ORA P1 
0e65 : f0 08 __ BEQ $0e6f ; (krnio_setnam.s0 + 14)
0e67 : a0 ff __ LDY #$ff
0e69 : c8 __ __ INY
0e6a : b1 2d __ LDA (P0),y 
0e6c : d0 fb __ BNE $0e69 ; (krnio_setnam.s0 + 8)
0e6e : 98 __ __ TYA
0e6f : a6 2d __ LDX P0 
0e71 : a4 2e __ LDY P1 
0e73 : 20 bd ff JSR $ffbd 
.s1001:
0e76 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0e77 : a9 00 __ LDA #$00
0e79 : a6 2d __ LDX P0 ; (fnum + 0)
0e7b : 9d dd 14 STA $14dd,x ; (krnio_pstatus + 0)
0e7e : a9 00 __ LDA #$00
0e80 : 85 3b __ STA ACCU + 0 
0e82 : 85 3c __ STA ACCU + 1 
0e84 : a5 2d __ LDA P0 ; (fnum + 0)
0e86 : a6 2e __ LDX P1 
0e88 : a4 2f __ LDY P2 
0e8a : 20 ba ff JSR $ffba 
0e8d : 20 c0 ff JSR $ffc0 
0e90 : 90 08 __ BCC $0e9a ; (krnio_open.s0 + 35)
0e92 : a5 2d __ LDA P0 ; (fnum + 0)
0e94 : 20 c3 ff JSR $ffc3 
0e97 : 4c 9e 0e JMP $0e9e ; (krnio_open.s1001 + 0)
0e9a : a9 01 __ LDA #$01
0e9c : 85 3b __ STA ACCU + 0 
.s1001:
0e9e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
14dd : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0e9f : ad d2 14 LDA $14d2 ; (zsm_reading + 0)
0ea2 : f0 20 __ BEQ $0ec4 ; (zsm_fill.s1 + 0)
.s2:
0ea4 : ad da 14 LDA $14da ; (zsm_pos + 1)
0ea7 : 18 __ __ CLC
0ea8 : 69 04 __ ADC #$04
0eaa : cd dc 14 CMP $14dc ; (zsm_wpos + 1)
0ead : d0 0c __ BNE $0ebb ; (zsm_fill.s6 + 0)
.s1006:
0eaf : ad db 14 LDA $14db ; (zsm_wpos + 0)
0eb2 : cd d9 14 CMP $14d9 ; (zsm_pos + 0)
0eb5 : d0 04 __ BNE $0ebb ; (zsm_fill.s6 + 0)
.s5:
0eb7 : a9 00 __ LDA #$00
0eb9 : f0 0b __ BEQ $0ec6 ; (zsm_fill.s1008 + 0)
.s6:
0ebb : a9 02 __ LDA #$02
0ebd : 20 43 0f JSR $0f43 ; (krnio_chkin.s1000 + 0)
0ec0 : a5 3b __ LDA ACCU + 0 
0ec2 : d0 07 __ BNE $0ecb ; (zsm_fill.s9 + 0)
.s1:
0ec4 : a9 ff __ LDA #$ff
.s1008:
0ec6 : 85 3b __ STA ACCU + 0 
.s1001:
0ec8 : 85 3c __ STA ACCU + 1 
0eca : 60 __ __ RTS
.s9:
0ecb : a9 00 __ LDA #$00
0ecd : 85 47 __ STA T1 + 0 
0ecf : 85 48 __ STA T1 + 1 
0ed1 : ad da 14 LDA $14da ; (zsm_pos + 1)
0ed4 : 18 __ __ CLC
0ed5 : 69 04 __ ADC #$04
0ed7 : cd dc 14 CMP $14dc ; (zsm_wpos + 1)
0eda : d0 08 __ BNE $0ee4 ; (zsm_fill.l13 + 0)
.s1002:
0edc : ad db 14 LDA $14db ; (zsm_wpos + 0)
0edf : cd d9 14 CMP $14d9 ; (zsm_pos + 0)
0ee2 : f0 49 __ BEQ $0f2d ; (zsm_fill.s37 + 0)
.l13:
0ee4 : 20 55 0f JSR $0f55 ; (krnio_chrin.s0 + 0)
0ee7 : ad db 14 LDA $14db ; (zsm_wpos + 0)
0eea : aa __ __ TAX
0eeb : 18 __ __ CLC
0eec : 69 01 __ ADC #$01
0eee : 8d db 14 STA $14db ; (zsm_wpos + 0)
0ef1 : ad dc 14 LDA $14dc ; (zsm_wpos + 1)
0ef4 : a8 __ __ TAY
0ef5 : 69 00 __ ADC #$00
0ef7 : 8d dc 14 STA $14dc ; (zsm_wpos + 1)
0efa : 8a __ __ TXA
0efb : 18 __ __ CLC
0efc : 69 2b __ ADC #$2b
0efe : 85 49 __ STA T3 + 0 
0f00 : 98 __ __ TYA
0f01 : 29 03 __ AND #$03
0f03 : 69 15 __ ADC #$15
0f05 : 85 4a __ STA T3 + 1 
0f07 : a5 3b __ LDA ACCU + 0 
0f09 : a0 00 __ LDY #$00
0f0b : 91 49 __ STA (T3 + 0),y 
0f0d : e6 47 __ INC T1 + 0 
0f0f : d0 02 __ BNE $0f13 ; (zsm_fill.s1010 + 0)
.s1009:
0f11 : e6 48 __ INC T1 + 1 
.s1010:
0f13 : 20 5f 0f JSR $0f5f ; (krnio_status.s0 + 0)
0f16 : a5 3b __ LDA ACCU + 0 
0f18 : d0 0e __ BNE $0f28 ; (zsm_fill.s15 + 0)
.s12:
0f1a : ad da 14 LDA $14da ; (zsm_pos + 1)
0f1d : 18 __ __ CLC
0f1e : 69 04 __ ADC #$04
0f20 : cd dc 14 CMP $14dc ; (zsm_wpos + 1)
0f23 : d0 bf __ BNE $0ee4 ; (zsm_fill.l13 + 0)
0f25 : 4c dc 0e JMP $0edc ; (zsm_fill.s1002 + 0)
.s15:
0f28 : a9 00 __ LDA #$00
0f2a : 8d d2 14 STA $14d2 ; (zsm_reading + 0)
.s37:
0f2d : 20 69 0f JSR $0f69 ; (krnio_clrchn.s0 + 0)
0f30 : ad d2 14 LDA $14d2 ; (zsm_reading + 0)
0f33 : d0 05 __ BNE $0f3a ; (zsm_fill.s21 + 0)
.s19:
0f35 : a9 02 __ LDA #$02
0f37 : 20 59 0e JSR $0e59 ; (krnio_close.s1000 + 0)
.s21:
0f3a : a5 47 __ LDA T1 + 0 
0f3c : 85 3b __ STA ACCU + 0 
0f3e : a5 48 __ LDA T1 + 1 
0f40 : 4c c8 0e JMP $0ec8 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0f43 : 85 2d __ STA P0 
.s0:
0f45 : a6 2d __ LDX P0 
0f47 : 20 c6 ff JSR $ffc6 
0f4a : a9 00 __ LDA #$00
0f4c : 85 3c __ STA ACCU + 1 
0f4e : b0 02 __ BCS $0f52 ; (krnio_chkin.s0 + 13)
0f50 : a9 01 __ LDA #$01
0f52 : 85 3b __ STA ACCU + 0 
.s1001:
0f54 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0f55 : 20 cf ff JSR $ffcf 
0f58 : 85 3b __ STA ACCU + 0 
0f5a : a9 00 __ LDA #$00
0f5c : 85 3c __ STA ACCU + 1 
.s1001:
0f5e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0f5f : 20 b7 ff JSR $ffb7 
0f62 : 85 3b __ STA ACCU + 0 
0f64 : a9 00 __ LDA #$00
0f66 : 85 3c __ STA ACCU + 1 
.s1001:
0f68 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0f69 : 20 cc ff JSR $ffcc 
.s1001:
0f6c : 60 __ __ RTS
--------------------------------------------------------------------
0f6d : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 70 61 70 65 : @0:zsmfiles/pape
0f7d : __ __ __ BYT 72 63 6c 69 70 2e 7a 73 6d 2c 50 2c 52 00       : rclip.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0f8b : 20 a7 0f JSR $0fa7 ; (getchx.s0 + 0)
0f8e : a5 3c __ LDA ACCU + 1 
0f90 : d0 10 __ BNE $0fa2 ; (Control.s3 + 0)
.s1005:
0f92 : a5 3b __ LDA ACCU + 0 
0f94 : c9 20 __ CMP #$20
0f96 : d0 0a __ BNE $0fa2 ; (Control.s3 + 0)
.s1:
0f98 : a9 00 __ LDA #$00
0f9a : c5 2e __ CMP P1 ; (playing + 0)
0f9c : 2a __ __ ROL
0f9d : 85 2e __ STA P1 ; (playing + 0)
0f9f : 20 d8 0f JSR $0fd8 ; (zsm_irq_play.s0 + 0)
.s3:
0fa2 : a5 2e __ LDA P1 ; (playing + 0)
0fa4 : 85 3b __ STA ACCU + 0 
.s1001:
0fa6 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0fa7 : 20 b1 0f JSR $0fb1 ; (getpch + 0)
0faa : 85 3b __ STA ACCU + 0 
0fac : a9 00 __ LDA #$00
0fae : 85 3c __ STA ACCU + 1 
.s1001:
0fb0 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0fb1 : 20 e4 ff JSR $ffe4 
0fb4 : ae d3 14 LDX $14d3 ; (giocharmap + 0)
0fb7 : e0 01 __ CPX #$01
0fb9 : 90 1c __ BCC $0fd7 ; (getpch + 38)
0fbb : c9 0d __ CMP #$0d
0fbd : d0 02 __ BNE $0fc1 ; (getpch + 16)
0fbf : a9 0a __ LDA #$0a
0fc1 : e0 02 __ CPX #$02
0fc3 : 90 12 __ BCC $0fd7 ; (getpch + 38)
0fc5 : c9 41 __ CMP #$41
0fc7 : 90 0e __ BCC $0fd7 ; (getpch + 38)
0fc9 : c9 7b __ CMP #$7b
0fcb : b0 0a __ BCS $0fd7 ; (getpch + 38)
0fcd : c9 61 __ CMP #$61
0fcf : b0 04 __ BCS $0fd5 ; (getpch + 36)
0fd1 : c9 5b __ CMP #$5b
0fd3 : b0 02 __ BCS $0fd7 ; (getpch + 38)
0fd5 : 49 20 __ EOR #$20
0fd7 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
14d3 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0fd8 : 8d b6 10 STA $10b6 ; (zsm_playing + 0)
.s1001:
0fdb : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
14d4 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
1500 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
1510 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
1520 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
14ed : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0fdc : ad 26 9f LDA $9f26 
0fdf : 29 40 __ AND #$40
0fe1 : d0 f9 __ BNE $0fdc ; (frame_wait.l1 + 0)
.l4:
0fe3 : ad 26 9f LDA $9f26 
0fe6 : 29 40 __ AND #$40
0fe8 : f0 f9 __ BEQ $0fe3 ; (frame_wait.l4 + 0)
.s1001:
0fea : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0feb : 38 __ __ SEC
0fec : a9 00 __ LDA #$00
0fee : e5 3b __ SBC ACCU + 0 
0ff0 : 85 3b __ STA ACCU + 0 
0ff2 : a9 00 __ LDA #$00
0ff4 : e5 3c __ SBC ACCU + 1 
0ff6 : 85 3c __ STA ACCU + 1 
0ff8 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0ff9 : 38 __ __ SEC
0ffa : a9 00 __ LDA #$00
0ffc : e5 23 __ SBC WORK + 0 
0ffe : 85 23 __ STA WORK + 0 
1000 : a9 00 __ LDA #$00
1002 : e5 24 __ SBC WORK + 1 
1004 : 85 24 __ STA WORK + 1 
1006 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1007 : a5 3c __ LDA ACCU + 1 
1009 : d0 31 __ BNE $103c ; (divmod + 53)
100b : a5 24 __ LDA WORK + 1 
100d : d0 1e __ BNE $102d ; (divmod + 38)
100f : 85 26 __ STA WORK + 3 
1011 : a2 04 __ LDX #$04
1013 : 06 3b __ ASL ACCU + 0 
1015 : 2a __ __ ROL
1016 : c5 23 __ CMP WORK + 0 
1018 : 90 02 __ BCC $101c ; (divmod + 21)
101a : e5 23 __ SBC WORK + 0 
101c : 26 3b __ ROL ACCU + 0 
101e : 2a __ __ ROL
101f : c5 23 __ CMP WORK + 0 
1021 : 90 02 __ BCC $1025 ; (divmod + 30)
1023 : e5 23 __ SBC WORK + 0 
1025 : 26 3b __ ROL ACCU + 0 
1027 : ca __ __ DEX
1028 : d0 eb __ BNE $1015 ; (divmod + 14)
102a : 85 25 __ STA WORK + 2 
102c : 60 __ __ RTS
102d : a5 3b __ LDA ACCU + 0 
102f : 85 25 __ STA WORK + 2 
1031 : a5 3c __ LDA ACCU + 1 
1033 : 85 26 __ STA WORK + 3 
1035 : a9 00 __ LDA #$00
1037 : 85 3b __ STA ACCU + 0 
1039 : 85 3c __ STA ACCU + 1 
103b : 60 __ __ RTS
103c : a5 24 __ LDA WORK + 1 
103e : d0 1f __ BNE $105f ; (divmod + 88)
1040 : a5 23 __ LDA WORK + 0 
1042 : 30 1b __ BMI $105f ; (divmod + 88)
1044 : a9 00 __ LDA #$00
1046 : 85 26 __ STA WORK + 3 
1048 : a2 10 __ LDX #$10
104a : 06 3b __ ASL ACCU + 0 
104c : 26 3c __ ROL ACCU + 1 
104e : 2a __ __ ROL
104f : c5 23 __ CMP WORK + 0 
1051 : 90 02 __ BCC $1055 ; (divmod + 78)
1053 : e5 23 __ SBC WORK + 0 
1055 : 26 3b __ ROL ACCU + 0 
1057 : 26 3c __ ROL ACCU + 1 
1059 : ca __ __ DEX
105a : d0 f2 __ BNE $104e ; (divmod + 71)
105c : 85 25 __ STA WORK + 2 
105e : 60 __ __ RTS
105f : a9 00 __ LDA #$00
1061 : 85 25 __ STA WORK + 2 
1063 : 85 26 __ STA WORK + 3 
1065 : 84 22 __ STY $22 
1067 : a0 10 __ LDY #$10
1069 : 18 __ __ CLC
106a : 26 3b __ ROL ACCU + 0 
106c : 26 3c __ ROL ACCU + 1 
106e : 26 25 __ ROL WORK + 2 
1070 : 26 26 __ ROL WORK + 3 
1072 : 38 __ __ SEC
1073 : a5 25 __ LDA WORK + 2 
1075 : e5 23 __ SBC WORK + 0 
1077 : aa __ __ TAX
1078 : a5 26 __ LDA WORK + 3 
107a : e5 24 __ SBC WORK + 1 
107c : 90 04 __ BCC $1082 ; (divmod + 123)
107e : 86 25 __ STX WORK + 2 
1080 : 85 26 __ STA WORK + 3 
1082 : 88 __ __ DEY
1083 : d0 e5 __ BNE $106a ; (divmod + 99)
1085 : 26 3b __ ROL ACCU + 0 
1087 : 26 3c __ ROL ACCU + 1 
1089 : a4 22 __ LDY $22 
108b : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
108c : 24 3c __ BIT ACCU + 1 
108e : 10 0d __ BPL $109d ; (mods16 + 17)
1090 : 20 eb 0f JSR $0feb ; (negaccu + 0)
1093 : 24 24 __ BIT WORK + 1 
1095 : 10 0d __ BPL $10a4 ; (mods16 + 24)
1097 : 20 f9 0f JSR $0ff9 ; (negtmp + 0)
109a : 4c 07 10 JMP $1007 ; (divmod + 0)
109d : 24 24 __ BIT WORK + 1 
109f : 10 f9 __ BPL $109a ; (mods16 + 14)
10a1 : 20 f9 0f JSR $0ff9 ; (negtmp + 0)
10a4 : 20 07 10 JSR $1007 ; (divmod + 0)
10a7 : 38 __ __ SEC
10a8 : a9 00 __ LDA #$00
10aa : e5 25 __ SBC WORK + 2 
10ac : 85 25 __ STA WORK + 2 
10ae : a9 00 __ LDA #$00
10b0 : e5 26 __ SBC WORK + 3 
10b2 : 85 26 __ STA WORK + 3 
10b4 : 60 __ __ RTS
