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
080e : 8e ca 0f STX $0fca ; (spentry + 0)
0811 : a9 4b __ LDA #$4b
0813 : 85 39 __ STA IP + 0 
0815 : a9 10 __ LDA #$10
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 14 __ LDA #$14
081c : e9 10 __ SBC #$10
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
0830 : a9 5b __ LDA #$5b
0832 : e9 4b __ SBC #$4b
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
0fca : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 2b 09 JSR $092b ; (zsm_irq_init.s0 + 0)
0883 : 20 f9 0a JSR $0af9 ; (ClearVERAScreen.s0 + 0)
0886 : 20 3c 0b JSR $0b3c ; (SetUpSprites.s0 + 0)
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
08af : 85 4b __ STA T1 + 0 
.l2:
08b1 : 20 10 0d JSR $0d10 ; (zsm_check.s0 + 0)
08b4 : 09 00 __ ORA #$00
08b6 : f0 0b __ BEQ $08c3 ; (main.s6 + 0)
.s4:
08b8 : a9 81 __ LDA #$81
08ba : 85 30 __ STA P3 
08bc : a9 0e __ LDA #$0e
08be : 85 31 __ STA P4 
08c0 : 20 14 0d JSR $0d14 ; (zsm_init.s0 + 0)
.s6:
08c3 : a5 4b __ LDA T1 + 0 
08c5 : 85 2e __ STA P1 
08c7 : 20 a0 0e JSR $0ea0 ; (Control.s0 + 0)
08ca : a5 3b __ LDA ACCU + 0 
08cc : 85 4b __ STA T1 + 0 
08ce : ad ef 0f LDA $0fef ; (FrameCount + 0)
08d1 : 85 48 __ STA T3 + 0 
08d3 : 85 3b __ STA ACCU + 0 
08d5 : ad f0 0f LDA $0ff0 ; (FrameCount + 1)
08d8 : 85 3c __ STA ACCU + 1 
08da : a9 04 __ LDA #$04
08dc : 85 23 __ STA WORK + 0 
08de : a9 00 __ LDA #$00
08e0 : 85 24 __ STA WORK + 1 
08e2 : 20 a1 0f JSR $0fa1 ; (mods16 + 0)
08e5 : a5 26 __ LDA WORK + 3 
08e7 : d0 16 __ BNE $08ff ; (main.s9 + 0)
.s1002:
08e9 : a5 25 __ LDA WORK + 2 
08eb : c9 01 __ CMP #$01
08ed : d0 10 __ BNE $08ff ; (main.s9 + 0)
.s7:
08ef : ae f8 0f LDX $0ff8 ; (off1 + 0)
08f2 : e8 __ __ INX
08f3 : 8e f8 0f STX $0ff8 ; (off1 + 0)
08f6 : bd 1f 10 LDA $101f,x ; (palette + 31)
08f9 : 38 __ __ SEC
08fa : e9 40 __ SBC #$40
08fc : 8d 23 9f STA $9f23 
.s9:
08ff : 06 48 __ ASL T3 + 0 
0901 : ad f0 0f LDA $0ff0 ; (FrameCount + 1)
0904 : 2a __ __ ROL
0905 : 18 __ __ CLC
0906 : 69 ff __ ADC #$ff
0908 : 8d 38 9f STA $9f38 
090b : a5 48 __ LDA T3 + 0 
090d : 8d 37 9f STA $9f37 
0910 : a9 01 __ LDA #$01
0912 : 8d 2c 9f STA $9f2c 
0915 : 20 b3 0d JSR $0db3 ; (zsm_fill.s0 + 0)
0918 : a9 00 __ LDA #$00
091a : 8d 2c 9f STA $9f2c 
091d : 20 f1 0e JSR $0ef1 ; (frame_wait.l1 + 0)
0920 : ee ef 0f INC $0fef ; (FrameCount + 0)
0923 : d0 8c __ BNE $08b1 ; (main.l2 + 0)
.s1003:
0925 : ee f0 0f INC $0ff0 ; (FrameCount + 1)
0928 : 4c b1 08 JMP $08b1 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
092b : 78 __ __ SEI
092c : ad 14 03 LDA $0314 
092f : 8d f1 0f STA $0ff1 ; (oirq + 0)
0932 : ad 15 03 LDA $0315 
0935 : 8d f2 0f STA $0ff2 ; (oirq + 1)
0938 : a9 44 __ LDA #$44
093a : 8d 14 03 STA $0314 
093d : a9 09 __ LDA #$09
093f : 8d 15 03 STA $0315 
0942 : 58 __ __ CLI
.s1001:
0943 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
0ff1 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0944 : 20 4a 09 JSR $094a ; (irq.s1000 + 0)
0947 : 6c f1 0f JMP ($0ff1)
--------------------------------------------------------------------
irq:
.s1000:
094a : a5 2d __ LDA P0 
094c : 48 __ __ PHA
094d : a5 2e __ LDA P1 
094f : 48 __ __ PHA
0950 : a5 3b __ LDA ACCU + 0 
0952 : 48 __ __ PHA
0953 : a5 3c __ LDA ACCU + 1 
0955 : 48 __ __ PHA
0956 : a5 47 __ LDA T0 + 0 
0958 : 48 __ __ PHA
0959 : a5 48 __ LDA $48 
095b : 48 __ __ PHA
095c : a5 49 __ LDA $49 
095e : 48 __ __ PHA
095f : a5 4a __ LDA $4a 
0961 : 48 __ __ PHA
0962 : a5 4b __ LDA $4b 
0964 : 48 __ __ PHA
0965 : a5 4c __ LDA $4c 
0967 : 48 __ __ PHA
0968 : a5 4d __ LDA $4d 
096a : 48 __ __ PHA
096b : a5 4e __ LDA $4e 
096d : 48 __ __ PHA
096e : a5 4f __ LDA $4f 
0970 : 48 __ __ PHA
0971 : a5 50 __ LDA $50 
0973 : 48 __ __ PHA
.s0:
0974 : ad cb 0f LDA $0fcb ; (zsm_playing + 0)
0977 : f0 08 __ BEQ $0981 ; (irq.s1001 + 0)
.s4:
0979 : ad cc 0f LDA $0fcc ; (zsm_finished + 0)
097c : d0 03 __ BNE $0981 ; (irq.s1001 + 0)
.s1:
097e : 20 ac 09 JSR $09ac ; (zsm_play.s0 + 0)
.s1001:
0981 : 68 __ __ PLA
0982 : 85 50 __ STA $50 
0984 : 68 __ __ PLA
0985 : 85 4f __ STA $4f 
0987 : 68 __ __ PLA
0988 : 85 4e __ STA $4e 
098a : 68 __ __ PLA
098b : 85 4d __ STA $4d 
098d : 68 __ __ PLA
098e : 85 4c __ STA $4c 
0990 : 68 __ __ PLA
0991 : 85 4b __ STA $4b 
0993 : 68 __ __ PLA
0994 : 85 4a __ STA $4a 
0996 : 68 __ __ PLA
0997 : 85 49 __ STA $49 
0999 : 68 __ __ PLA
099a : 85 48 __ STA $48 
099c : 68 __ __ PLA
099d : 85 47 __ STA T0 + 0 
099f : 68 __ __ PLA
09a0 : 85 3c __ STA ACCU + 1 
09a2 : 68 __ __ PLA
09a3 : 85 3b __ STA ACCU + 0 
09a5 : 68 __ __ PLA
09a6 : 85 2e __ STA P1 
09a8 : 68 __ __ PLA
09a9 : 85 2d __ STA P0 
09ab : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
0fcb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
0fcc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09ac : ad f3 0f LDA $0ff3 ; (zsm_delay + 0)
09af : f0 03 __ BEQ $09b4 ; (zsm_play.s2 + 0)
09b1 : 4c e1 0a JMP $0ae1 ; (zsm_play.s1 + 0)
.s2:
09b4 : ad 25 9f LDA $9f25 
09b7 : 85 47 __ STA T0 + 0 
09b9 : ad 25 9f LDA $9f25 
09bc : 29 fe __ AND #$fe
09be : 8d 25 9f STA $9f25 
09c1 : ad 20 9f LDA $9f20 
09c4 : 85 49 __ STA T2 + 0 
09c6 : ad 21 9f LDA $9f21 
09c9 : 85 4a __ STA T2 + 1 
09cb : ad 22 9f LDA $9f22 
09ce : 85 48 __ STA T1 + 0 
.l5:
09d0 : ad f4 0f LDA $0ff4 ; (zsm_pos + 0)
09d3 : 85 4b __ STA T3 + 0 
09d5 : 18 __ __ CLC
09d6 : 69 01 __ ADC #$01
09d8 : 85 4d __ STA T4 + 0 
09da : 8d f4 0f STA $0ff4 ; (zsm_pos + 0)
09dd : ad f5 0f LDA $0ff5 ; (zsm_pos + 1)
09e0 : aa __ __ TAX
09e1 : 69 00 __ ADC #$00
09e3 : 85 4e __ STA T4 + 1 
09e5 : 8d f5 0f STA $0ff5 ; (zsm_pos + 1)
09e8 : 18 __ __ CLC
09e9 : a9 4b __ LDA #$4b
09eb : 65 4b __ ADC T3 + 0 
09ed : 85 3b __ STA ACCU + 0 
09ef : 8a __ __ TXA
09f0 : 29 03 __ AND #$03
09f2 : 69 10 __ ADC #$10
09f4 : 85 3c __ STA ACCU + 1 
09f6 : a0 00 __ LDY #$00
09f8 : b1 3b __ LDA (ACCU + 0),y 
09fa : c9 40 __ CMP #$40
09fc : b0 03 __ BCS $0a01 ; (zsm_play.s9 + 0)
09fe : 4c ac 0a JMP $0aac ; (zsm_play.s8 + 0)
.s9:
0a01 : d0 22 __ BNE $0a25 ; (zsm_play.s12 + 0)
.s11:
0a03 : 18 __ __ CLC
0a04 : a9 4b __ LDA #$4b
0a06 : 65 4d __ ADC T4 + 0 
0a08 : 85 4b __ STA T3 + 0 
0a0a : a5 4e __ LDA T4 + 1 
0a0c : 29 03 __ AND #$03
0a0e : 69 10 __ ADC #$10
0a10 : 85 4c __ STA T3 + 1 
0a12 : b1 4b __ LDA (T3 + 0),y 
0a14 : 29 3f __ AND #$3f
0a16 : 18 __ __ CLC
0a17 : 65 4d __ ADC T4 + 0 
0a19 : 8d f4 0f STA $0ff4 ; (zsm_pos + 0)
0a1c : 98 __ __ TYA
0a1d : 65 4e __ ADC T4 + 1 
0a1f : 8d f5 0f STA $0ff5 ; (zsm_pos + 1)
0a22 : 4c d0 09 JMP $09d0 ; (zsm_play.l5 + 0)
.s12:
0a25 : 09 00 __ ORA #$00
0a27 : 30 5b __ BMI $0a84 ; (zsm_play.s15 + 0)
.s14:
0a29 : 29 3f __ AND #$3f
0a2b : f0 a3 __ BEQ $09d0 ; (zsm_play.l5 + 0)
.s26:
0a2d : 84 50 __ STY T7 + 0 
0a2f : 85 4f __ STA T6 + 0 
0a31 : 18 __ __ CLC
.l1012:
0a32 : a9 4b __ LDA #$4b
0a34 : 6d f4 0f ADC $0ff4 ; (zsm_pos + 0)
0a37 : 85 4d __ STA T4 + 0 
0a39 : ad f5 0f LDA $0ff5 ; (zsm_pos + 1)
0a3c : 29 03 __ AND #$03
0a3e : 69 10 __ ADC #$10
0a40 : 85 4e __ STA T4 + 1 
0a42 : a0 00 __ LDY #$00
0a44 : b1 4d __ LDA (T4 + 0),y 
0a46 : 85 2d __ STA P0 
0a48 : ad f4 0f LDA $0ff4 ; (zsm_pos + 0)
0a4b : 18 __ __ CLC
0a4c : 69 01 __ ADC #$01
0a4e : aa __ __ TAX
0a4f : ad f5 0f LDA $0ff5 ; (zsm_pos + 1)
0a52 : 69 00 __ ADC #$00
0a54 : 29 03 __ AND #$03
0a56 : 85 4c __ STA T3 + 1 
0a58 : 8a __ __ TXA
0a59 : 18 __ __ CLC
0a5a : 69 4b __ ADC #$4b
0a5c : 85 4b __ STA T3 + 0 
0a5e : a9 10 __ LDA #$10
0a60 : 65 4c __ ADC T3 + 1 
0a62 : 85 4c __ STA T3 + 1 
0a64 : b1 4b __ LDA (T3 + 0),y 
0a66 : 85 2e __ STA P1 
0a68 : 20 e5 0a JSR $0ae5 ; (sfx_put.l1 + 0)
0a6b : ad f4 0f LDA $0ff4 ; (zsm_pos + 0)
0a6e : 18 __ __ CLC
0a6f : 69 02 __ ADC #$02
0a71 : 8d f4 0f STA $0ff4 ; (zsm_pos + 0)
0a74 : 90 03 __ BCC $0a79 ; (zsm_play.s1015 + 0)
.s1014:
0a76 : ee f5 0f INC $0ff5 ; (zsm_pos + 1)
.s1015:
0a79 : e6 50 __ INC T7 + 0 
0a7b : a5 50 __ LDA T7 + 0 
0a7d : c5 4f __ CMP T6 + 0 
0a7f : 90 b1 __ BCC $0a32 ; (zsm_play.l1012 + 0)
0a81 : 4c d0 09 JMP $09d0 ; (zsm_play.l5 + 0)
.s15:
0a84 : c9 80 __ CMP #$80
0a86 : d0 07 __ BNE $0a8f ; (zsm_play.s22 + 0)
.s21:
0a88 : a9 01 __ LDA #$01
0a8a : 8d cc 0f STA $0fcc ; (zsm_finished + 0)
0a8d : d0 08 __ BNE $0a97 ; (zsm_play.s7 + 0)
.s22:
0a8f : 29 7f __ AND #$7f
0a91 : 38 __ __ SEC
0a92 : e9 01 __ SBC #$01
0a94 : 8d f3 0f STA $0ff3 ; (zsm_delay + 0)
.s7:
0a97 : a5 49 __ LDA T2 + 0 
0a99 : 8d 20 9f STA $9f20 
0a9c : a5 4a __ LDA T2 + 1 
0a9e : 8d 21 9f STA $9f21 
0aa1 : a5 48 __ LDA T1 + 0 
0aa3 : 8d 22 9f STA $9f22 
0aa6 : a5 47 __ LDA T0 + 0 
0aa8 : 8d 25 9f STA $9f25 
.s1001:
0aab : 60 __ __ RTS
.s8:
0aac : 29 3f __ AND #$3f
0aae : 09 c0 __ ORA #$c0
0ab0 : 8d 20 9f STA $9f20 
0ab3 : a9 f9 __ LDA #$f9
0ab5 : 8d 21 9f STA $9f21 
0ab8 : a9 01 __ LDA #$01
0aba : 8d 22 9f STA $9f22 
0abd : a5 4b __ LDA T3 + 0 
0abf : 69 02 __ ADC #$02
0ac1 : 8d f4 0f STA $0ff4 ; (zsm_pos + 0)
0ac4 : 90 01 __ BCC $0ac7 ; (zsm_play.s1017 + 0)
.s1016:
0ac6 : e8 __ __ INX
.s1017:
0ac7 : 8e f5 0f STX $0ff5 ; (zsm_pos + 1)
0aca : 18 __ __ CLC
0acb : a9 4b __ LDA #$4b
0acd : 65 4d __ ADC T4 + 0 
0acf : 85 4b __ STA T3 + 0 
0ad1 : a5 4e __ LDA T4 + 1 
0ad3 : 29 03 __ AND #$03
0ad5 : 69 10 __ ADC #$10
0ad7 : 85 4c __ STA T3 + 1 
0ad9 : b1 4b __ LDA (T3 + 0),y 
0adb : 8d 23 9f STA $9f23 
0ade : 4c d0 09 JMP $09d0 ; (zsm_play.l5 + 0)
.s1:
0ae1 : ce f3 0f DEC $0ff3 ; (zsm_delay + 0)
0ae4 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
0ff3 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
104b : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
0ff4 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0ae5 : ad 41 9f LDA $9f41 
0ae8 : 30 fb __ BMI $0ae5 ; (sfx_put.l1 + 0)
.s3:
0aea : a5 2d __ LDA P0 ; (index + 0)
0aec : 8d 40 9f STA $9f40 
0aef : ea __ __ NOP
0af0 : ea __ __ NOP
0af1 : ea __ __ NOP
0af2 : ea __ __ NOP
0af3 : a5 2e __ LDA P1 ; (data + 0)
0af5 : 8d 41 9f STA $9f41 
.s1001:
0af8 : 60 __ __ RTS
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0af9 : a9 93 __ LDA #$93
0afb : 85 2d __ STA P0 
0afd : a9 00 __ LDA #$00
0aff : 85 2e __ STA P1 
0b01 : 20 36 0b JSR $0b36 ; (putch.s0 + 0)
0b04 : a9 11 __ LDA #$11
0b06 : 8d 22 9f STA $9f22 
0b09 : a2 00 __ LDX #$00
.l2:
0b0b : 8a __ __ TXA
0b0c : 18 __ __ CLC
0b0d : 69 b0 __ ADC #$b0
0b0f : 8d 21 9f STA $9f21 
0b12 : a9 00 __ LDA #$00
0b14 : 8d 20 9f STA $9f20 
0b17 : a0 50 __ LDY #$50
.l1003:
0b19 : a9 20 __ LDA #$20
0b1b : 8d 23 9f STA $9f23 
0b1e : a9 01 __ LDA #$01
0b20 : 8d 23 9f STA $9f23 
0b23 : a9 20 __ LDA #$20
0b25 : 8d 24 9f STA $9f24 
0b28 : a9 01 __ LDA #$01
0b2a : 8d 24 9f STA $9f24 
0b2d : 88 __ __ DEY
0b2e : d0 e9 __ BNE $0b19 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0b30 : e8 __ __ INX
0b31 : e0 3c __ CPX #$3c
0b33 : 90 d6 __ BCC $0b0b ; (ClearVERAScreen.l2 + 0)
.s1001:
0b35 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0b36 : a5 2d __ LDA P0 
0b38 : 20 d2 ff JSR $ffd2 
.s1001:
0b3b : 60 __ __ RTS
--------------------------------------------------------------------
SetUpSprites:
.s0:
0b3c : a9 02 __ LDA #$02
0b3e : 85 35 __ STA P8 
0b40 : a9 00 __ LDA #$00
0b42 : 8d f3 9e STA $9ef3 ; (sstack + 0)
0b45 : 8d f6 9e STA $9ef6 ; (sstack + 3)
0b48 : 8d f7 9e STA $9ef7 ; (sstack + 4)
0b4b : 8d f8 9e STA $9ef8 ; (sstack + 5)
0b4e : 8d f9 9e STA $9ef9 ; (sstack + 6)
0b51 : 8d fb 9e STA $9efb ; (sstack + 8)
0b54 : 8d ff 9e STA $9eff ; (sstack + 12)
0b57 : a9 30 __ LDA #$30
0b59 : 8d f4 9e STA $9ef4 ; (sstack + 1)
0b5c : a9 01 __ LDA #$01
0b5e : 8d f5 9e STA $9ef5 ; (sstack + 2)
0b61 : a9 03 __ LDA #$03
0b63 : 8d fa 9e STA $9efa ; (sstack + 7)
0b66 : a9 20 __ LDA #$20
0b68 : 8d fe 9e STA $9efe ; (sstack + 11)
0b6b : ad 25 9f LDA $9f25 
0b6e : 29 fd __ AND #$fd
0b70 : 8d 25 9f STA $9f25 
0b73 : ad 29 9f LDA $9f29 
0b76 : 09 40 __ ORA #$40
0b78 : 8d 29 9f STA $9f29 
0b7b : a9 cd __ LDA #$cd
0b7d : 8d fc 9e STA $9efc ; (sstack + 9)
0b80 : a9 0f __ LDA #$0f
0b82 : 8d fd 9e STA $9efd ; (sstack + 10)
0b85 : 20 99 0b JSR $0b99 ; (Setup.s0 + 0)
0b88 : a9 20 __ LDA #$20
0b8a : 85 37 __ STA P10 
0b8c : 85 38 __ STA P11 
0b8e : a9 00 __ LDA #$00
0b90 : 85 35 __ STA P8 
0b92 : a9 10 __ LDA #$10
0b94 : 85 36 __ STA P9 
0b96 : 4c f3 0c JMP $0cf3 ; (SetPaletteColours.s0 + 0)
--------------------------------------------------------------------
Setup:
.s0:
0b99 : ad f3 9e LDA $9ef3 ; (sstack + 0)
0b9c : 85 2d __ STA P0 
0b9e : ad f4 9e LDA $9ef4 ; (sstack + 1)
0ba1 : 85 2e __ STA P1 
0ba3 : ad f5 9e LDA $9ef5 ; (sstack + 2)
0ba6 : 85 2f __ STA P2 
0ba8 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0bab : 85 30 __ STA P3 
0bad : ad fc 9e LDA $9efc ; (sstack + 9)
0bb0 : 85 31 __ STA P4 
0bb2 : ad fd 9e LDA $9efd ; (sstack + 10)
0bb5 : 85 32 __ STA P5 
0bb7 : ad fe 9e LDA $9efe ; (sstack + 11)
0bba : 85 33 __ STA P6 
0bbc : ad ff 9e LDA $9eff ; (sstack + 12)
0bbf : 85 34 __ STA P7 
0bc1 : 20 19 0c JSR $0c19 ; (vram_putn.s0 + 0)
0bc4 : a5 35 __ LDA P8 ; (spr + 0)
0bc6 : 85 2d __ STA P0 
0bc8 : ad f3 9e LDA $9ef3 ; (sstack + 0)
0bcb : 85 47 __ STA T0 + 0 
0bcd : ad f4 9e LDA $9ef4 ; (sstack + 1)
0bd0 : 85 48 __ STA T0 + 1 
0bd2 : ad f5 9e LDA $9ef5 ; (sstack + 2)
0bd5 : 85 49 __ STA T0 + 2 
0bd7 : ad f6 9e LDA $9ef6 ; (sstack + 3)
0bda : a2 05 __ LDX #$05
.l1002:
0bdc : 4a __ __ LSR
0bdd : 66 49 __ ROR T0 + 2 
0bdf : 66 48 __ ROR T0 + 1 
0be1 : 66 47 __ ROR T0 + 0 
0be3 : ca __ __ DEX
0be4 : d0 f6 __ BNE $0bdc ; (Setup.l1002 + 0)
.s1003:
0be6 : a5 47 __ LDA T0 + 0 
0be8 : 85 2e __ STA P1 
0bea : a5 48 __ LDA T0 + 1 
0bec : 85 2f __ STA P2 
0bee : ad f7 9e LDA $9ef7 ; (sstack + 4)
0bf1 : 85 30 __ STA P3 
0bf3 : ad f8 9e LDA $9ef8 ; (sstack + 5)
0bf6 : 85 31 __ STA P4 
0bf8 : ad f9 9e LDA $9ef9 ; (sstack + 6)
0bfb : 85 32 __ STA P5 
0bfd : ad fa 9e LDA $9efa ; (sstack + 7)
0c00 : 85 33 __ STA P6 
0c02 : ad fb 9e LDA $9efb ; (sstack + 8)
0c05 : 85 34 __ STA P7 
0c07 : 20 54 0c JSR $0c54 ; (vera_spr_set.s0 + 0)
0c0a : a9 c8 __ LDA #$c8
0c0c : 85 2e __ STA P1 
0c0e : 85 30 __ STA P3 
0c10 : a9 00 __ LDA #$00
0c12 : 85 2f __ STA P2 
0c14 : 85 31 __ STA P4 
0c16 : 4c b7 0c JMP $0cb7 ; (vera_spr_move.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0c19 : ad 25 9f LDA $9f25 
0c1c : 29 fe __ AND #$fe
0c1e : 8d 25 9f STA $9f25 
0c21 : a5 2d __ LDA P0 ; (addr + 0)
0c23 : 8d 20 9f STA $9f20 
0c26 : a5 2e __ LDA P1 ; (addr + 1)
0c28 : 8d 21 9f STA $9f21 
0c2b : a5 2f __ LDA P2 ; (addr + 2)
0c2d : 29 01 __ AND #$01
0c2f : 09 10 __ ORA #$10
0c31 : 8d 22 9f STA $9f22 
0c34 : a5 33 __ LDA P6 ; (size + 0)
0c36 : 05 34 __ ORA P7 ; (size + 1)
0c38 : f0 19 __ BEQ $0c53 ; (vram_putn.s1001 + 0)
.s6:
0c3a : a0 00 __ LDY #$00
0c3c : a6 33 __ LDX P6 ; (size + 0)
0c3e : f0 02 __ BEQ $0c42 ; (vram_putn.l1002 + 0)
.s1005:
0c40 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0c42 : b1 31 __ LDA (P4),y ; (data + 0)
0c44 : 8d 23 9f STA $9f23 
0c47 : c8 __ __ INY
0c48 : d0 02 __ BNE $0c4c ; (vram_putn.s1009 + 0)
.s1008:
0c4a : e6 32 __ INC P5 ; (data + 1)
.s1009:
0c4c : ca __ __ DEX
0c4d : d0 f3 __ BNE $0c42 ; (vram_putn.l1002 + 0)
.s1004:
0c4f : c6 34 __ DEC P7 ; (size + 1)
0c51 : d0 ef __ BNE $0c42 ; (vram_putn.l1002 + 0)
.s1001:
0c53 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_set:
.s0:
0c54 : ad 25 9f LDA $9f25 
0c57 : 29 fe __ AND #$fe
0c59 : 8d 25 9f STA $9f25 
0c5c : a5 2d __ LDA P0 ; (spr + 0)
0c5e : 0a __ __ ASL
0c5f : 0a __ __ ASL
0c60 : 85 3b __ STA ACCU + 0 
0c62 : a9 00 __ LDA #$00
0c64 : 2a __ __ ROL
0c65 : 06 3b __ ASL ACCU + 0 
0c67 : 2a __ __ ROL
0c68 : 09 fc __ ORA #$fc
0c6a : 8d 21 9f STA $9f21 
0c6d : a5 3b __ LDA ACCU + 0 
0c6f : 8d 20 9f STA $9f20 
0c72 : a9 11 __ LDA #$11
0c74 : 8d 22 9f STA $9f22 
0c77 : a5 30 __ LDA P3 ; (mode8 + 0)
0c79 : f0 02 __ BEQ $0c7d ; (vera_spr_set.s11 + 0)
.s9:
0c7b : a9 80 __ LDA #$80
.s11:
0c7d : 05 2e __ ORA P1 ; (addr32 + 0)
0c7f : 8d 23 9f STA $9f23 
0c82 : a5 2f __ LDA P2 ; (addr32 + 1)
0c84 : 8d 23 9f STA $9f23 
0c87 : a9 00 __ LDA #$00
0c89 : 8d 23 9f STA $9f23 
0c8c : 8d 23 9f STA $9f23 
0c8f : 8d 23 9f STA $9f23 
0c92 : 8d 23 9f STA $9f23 
0c95 : a5 33 __ LDA P6 ; (z + 0)
0c97 : 0a __ __ ASL
0c98 : 0a __ __ ASL
0c99 : 8d 23 9f STA $9f23 
0c9c : a5 32 __ LDA P5 ; (h + 0)
0c9e : 4a __ __ LSR
0c9f : 85 3c __ STA ACCU + 1 
0ca1 : a9 00 __ LDA #$00
0ca3 : 6a __ __ ROR
0ca4 : 66 3c __ ROR ACCU + 1 
0ca6 : 6a __ __ ROR
0ca7 : 85 3b __ STA ACCU + 0 
0ca9 : a5 31 __ LDA P4 ; (w + 0)
0cab : 0a __ __ ASL
0cac : 0a __ __ ASL
0cad : 0a __ __ ASL
0cae : 0a __ __ ASL
0caf : 05 3b __ ORA ACCU + 0 
0cb1 : 05 34 __ ORA P7 ; (pal + 0)
0cb3 : 8d 23 9f STA $9f23 
.s1001:
0cb6 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_move:
.s0:
0cb7 : ad 25 9f LDA $9f25 
0cba : 29 fe __ AND #$fe
0cbc : 8d 25 9f STA $9f25 
0cbf : a5 2d __ LDA P0 ; (spr + 0)
0cc1 : 0a __ __ ASL
0cc2 : 0a __ __ ASL
0cc3 : 85 3b __ STA ACCU + 0 
0cc5 : a9 00 __ LDA #$00
0cc7 : 2a __ __ ROL
0cc8 : 06 3b __ ASL ACCU + 0 
0cca : 2a __ __ ROL
0ccb : aa __ __ TAX
0ccc : a5 3b __ LDA ACCU + 0 
0cce : 09 02 __ ORA #$02
0cd0 : 8d 20 9f STA $9f20 
0cd3 : 8a __ __ TXA
0cd4 : 09 fc __ ORA #$fc
0cd6 : 8d 21 9f STA $9f21 
0cd9 : a9 11 __ LDA #$11
0cdb : 8d 22 9f STA $9f22 
0cde : a5 2e __ LDA P1 ; (x + 0)
0ce0 : 8d 23 9f STA $9f23 
0ce3 : a5 2f __ LDA P2 ; (x + 1)
0ce5 : 8d 23 9f STA $9f23 
0ce8 : a5 30 __ LDA P3 ; (y + 0)
0cea : 8d 23 9f STA $9f23 
0ced : a5 31 __ LDA P4 ; (y + 1)
0cef : 8d 23 9f STA $9f23 
.s1001:
0cf2 : 60 __ __ RTS
--------------------------------------------------------------------
TestSpriteImage:
0fcd : __ __ __ BYT 01 11 11 10 12 11 11 21 10 11 11 01 10 11 11 01 : .......!........
0fdd : __ __ __ BYT 21 11 11 12 02 11 11 20 00 22 22 00 00 00 00 00 : !...... ."".....
--------------------------------------------------------------------
SetPaletteColours:
.s0:
0cf3 : a5 38 __ LDA P11 ; (addr + 0)
0cf5 : 85 2d __ STA P0 
0cf7 : a9 00 __ LDA #$00
0cf9 : 85 2e __ STA P1 
0cfb : 85 2f __ STA P2 
0cfd : 85 30 __ STA P3 
0cff : 85 34 __ STA P7 
0d01 : a5 35 __ LDA P8 ; (input + 0)
0d03 : 85 31 __ STA P4 
0d05 : a5 36 __ LDA P9 ; (input + 1)
0d07 : 85 32 __ STA P5 
0d09 : a5 37 __ LDA P10 ; (inputsize + 0)
0d0b : 85 33 __ STA P6 
0d0d : 4c 19 0c JMP $0c19 ; (vram_putn.s0 + 0)
--------------------------------------------------------------------
palette:
1000 : __ __ __ BYT ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f : ................
1010 : __ __ __ BYT ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f ff 0f : ................
--------------------------------------------------------------------
zsm_check:
.s0:
0d10 : ad cc 0f LDA $0fcc ; (zsm_finished + 0)
.s1001:
0d13 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0d14 : a9 01 __ LDA #$01
0d16 : 8d cc 0f STA $0fcc ; (zsm_finished + 0)
0d19 : ad ed 0f LDA $0fed ; (zsm_reading + 0)
0d1c : f0 0a __ BEQ $0d28 ; (zsm_init.s3 + 0)
.s1:
0d1e : a9 02 __ LDA #$02
0d20 : 20 6d 0d JSR $0d6d ; (krnio_close.s1000 + 0)
0d23 : a9 00 __ LDA #$00
0d25 : 8d ed 0f STA $0fed ; (zsm_reading + 0)
.s3:
0d28 : 8d f4 0f STA $0ff4 ; (zsm_pos + 0)
0d2b : 8d f5 0f STA $0ff5 ; (zsm_pos + 1)
0d2e : 8d f6 0f STA $0ff6 ; (zsm_wpos + 0)
0d31 : 8d f7 0f STA $0ff7 ; (zsm_wpos + 1)
0d34 : 8d f3 0f STA $0ff3 ; (zsm_delay + 0)
0d37 : a5 30 __ LDA P3 ; (fname + 0)
0d39 : 85 2d __ STA P0 
0d3b : a5 31 __ LDA P4 ; (fname + 1)
0d3d : 85 2e __ STA P1 
0d3f : 20 75 0d JSR $0d75 ; (krnio_setnam.s0 + 0)
0d42 : a9 02 __ LDA #$02
0d44 : 85 2d __ STA P0 
0d46 : 85 2f __ STA P2 
0d48 : a9 08 __ LDA #$08
0d4a : 85 2e __ STA P1 
0d4c : 20 8b 0d JSR $0d8b ; (krnio_open.s0 + 0)
0d4f : a5 3b __ LDA ACCU + 0 
0d51 : f0 19 __ BEQ $0d6c ; (zsm_init.s1001 + 0)
.s4:
0d53 : a9 01 __ LDA #$01
0d55 : 8d ed 0f STA $0fed ; (zsm_reading + 0)
0d58 : 20 b3 0d JSR $0db3 ; (zsm_fill.s0 + 0)
0d5b : a9 10 __ LDA #$10
0d5d : 8d f4 0f STA $0ff4 ; (zsm_pos + 0)
0d60 : a9 00 __ LDA #$00
0d62 : 8d f5 0f STA $0ff5 ; (zsm_pos + 1)
0d65 : 8d cc 0f STA $0fcc ; (zsm_finished + 0)
0d68 : a9 01 __ LDA #$01
0d6a : 85 3b __ STA ACCU + 0 
.s1001:
0d6c : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
0fed : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0d6d : 85 2d __ STA P0 
.s0:
0d6f : a5 2d __ LDA P0 
0d71 : 20 c3 ff JSR $ffc3 
.s1001:
0d74 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
0ff6 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0d75 : a5 2d __ LDA P0 
0d77 : 05 2e __ ORA P1 
0d79 : f0 08 __ BEQ $0d83 ; (krnio_setnam.s0 + 14)
0d7b : a0 ff __ LDY #$ff
0d7d : c8 __ __ INY
0d7e : b1 2d __ LDA (P0),y 
0d80 : d0 fb __ BNE $0d7d ; (krnio_setnam.s0 + 8)
0d82 : 98 __ __ TYA
0d83 : a6 2d __ LDX P0 
0d85 : a4 2e __ LDY P1 
0d87 : 20 bd ff JSR $ffbd 
.s1001:
0d8a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0d8b : a9 00 __ LDA #$00
0d8d : a6 2d __ LDX P0 ; (fnum + 0)
0d8f : 9d 4b 14 STA $144b,x ; (krnio_pstatus + 0)
0d92 : a9 00 __ LDA #$00
0d94 : 85 3b __ STA ACCU + 0 
0d96 : 85 3c __ STA ACCU + 1 
0d98 : a5 2d __ LDA P0 ; (fnum + 0)
0d9a : a6 2e __ LDX P1 
0d9c : a4 2f __ LDY P2 
0d9e : 20 ba ff JSR $ffba 
0da1 : 20 c0 ff JSR $ffc0 
0da4 : 90 08 __ BCC $0dae ; (krnio_open.s0 + 35)
0da6 : a5 2d __ LDA P0 ; (fnum + 0)
0da8 : 20 c3 ff JSR $ffc3 
0dab : 4c b2 0d JMP $0db2 ; (krnio_open.s1001 + 0)
0dae : a9 01 __ LDA #$01
0db0 : 85 3b __ STA ACCU + 0 
.s1001:
0db2 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
144b : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0db3 : ad ed 0f LDA $0fed ; (zsm_reading + 0)
0db6 : f0 20 __ BEQ $0dd8 ; (zsm_fill.s1 + 0)
.s2:
0db8 : ad f5 0f LDA $0ff5 ; (zsm_pos + 1)
0dbb : 18 __ __ CLC
0dbc : 69 04 __ ADC #$04
0dbe : cd f7 0f CMP $0ff7 ; (zsm_wpos + 1)
0dc1 : d0 0c __ BNE $0dcf ; (zsm_fill.s6 + 0)
.s1006:
0dc3 : ad f6 0f LDA $0ff6 ; (zsm_wpos + 0)
0dc6 : cd f4 0f CMP $0ff4 ; (zsm_pos + 0)
0dc9 : d0 04 __ BNE $0dcf ; (zsm_fill.s6 + 0)
.s5:
0dcb : a9 00 __ LDA #$00
0dcd : f0 0b __ BEQ $0dda ; (zsm_fill.s1008 + 0)
.s6:
0dcf : a9 02 __ LDA #$02
0dd1 : 20 57 0e JSR $0e57 ; (krnio_chkin.s1000 + 0)
0dd4 : a5 3b __ LDA ACCU + 0 
0dd6 : d0 07 __ BNE $0ddf ; (zsm_fill.s9 + 0)
.s1:
0dd8 : a9 ff __ LDA #$ff
.s1008:
0dda : 85 3b __ STA ACCU + 0 
.s1001:
0ddc : 85 3c __ STA ACCU + 1 
0dde : 60 __ __ RTS
.s9:
0ddf : a9 00 __ LDA #$00
0de1 : 85 47 __ STA T1 + 0 
0de3 : 85 48 __ STA T1 + 1 
0de5 : ad f5 0f LDA $0ff5 ; (zsm_pos + 1)
0de8 : 18 __ __ CLC
0de9 : 69 04 __ ADC #$04
0deb : cd f7 0f CMP $0ff7 ; (zsm_wpos + 1)
0dee : d0 08 __ BNE $0df8 ; (zsm_fill.l13 + 0)
.s1002:
0df0 : ad f6 0f LDA $0ff6 ; (zsm_wpos + 0)
0df3 : cd f4 0f CMP $0ff4 ; (zsm_pos + 0)
0df6 : f0 49 __ BEQ $0e41 ; (zsm_fill.s37 + 0)
.l13:
0df8 : 20 69 0e JSR $0e69 ; (krnio_chrin.s0 + 0)
0dfb : ad f6 0f LDA $0ff6 ; (zsm_wpos + 0)
0dfe : aa __ __ TAX
0dff : 18 __ __ CLC
0e00 : 69 01 __ ADC #$01
0e02 : 8d f6 0f STA $0ff6 ; (zsm_wpos + 0)
0e05 : ad f7 0f LDA $0ff7 ; (zsm_wpos + 1)
0e08 : a8 __ __ TAY
0e09 : 69 00 __ ADC #$00
0e0b : 8d f7 0f STA $0ff7 ; (zsm_wpos + 1)
0e0e : 8a __ __ TXA
0e0f : 18 __ __ CLC
0e10 : 69 4b __ ADC #$4b
0e12 : 85 49 __ STA T3 + 0 
0e14 : 98 __ __ TYA
0e15 : 29 03 __ AND #$03
0e17 : 69 10 __ ADC #$10
0e19 : 85 4a __ STA T3 + 1 
0e1b : a5 3b __ LDA ACCU + 0 
0e1d : a0 00 __ LDY #$00
0e1f : 91 49 __ STA (T3 + 0),y 
0e21 : e6 47 __ INC T1 + 0 
0e23 : d0 02 __ BNE $0e27 ; (zsm_fill.s1010 + 0)
.s1009:
0e25 : e6 48 __ INC T1 + 1 
.s1010:
0e27 : 20 73 0e JSR $0e73 ; (krnio_status.s0 + 0)
0e2a : a5 3b __ LDA ACCU + 0 
0e2c : d0 0e __ BNE $0e3c ; (zsm_fill.s15 + 0)
.s12:
0e2e : ad f5 0f LDA $0ff5 ; (zsm_pos + 1)
0e31 : 18 __ __ CLC
0e32 : 69 04 __ ADC #$04
0e34 : cd f7 0f CMP $0ff7 ; (zsm_wpos + 1)
0e37 : d0 bf __ BNE $0df8 ; (zsm_fill.l13 + 0)
0e39 : 4c f0 0d JMP $0df0 ; (zsm_fill.s1002 + 0)
.s15:
0e3c : a9 00 __ LDA #$00
0e3e : 8d ed 0f STA $0fed ; (zsm_reading + 0)
.s37:
0e41 : 20 7d 0e JSR $0e7d ; (krnio_clrchn.s0 + 0)
0e44 : ad ed 0f LDA $0fed ; (zsm_reading + 0)
0e47 : d0 05 __ BNE $0e4e ; (zsm_fill.s21 + 0)
.s19:
0e49 : a9 02 __ LDA #$02
0e4b : 20 6d 0d JSR $0d6d ; (krnio_close.s1000 + 0)
.s21:
0e4e : a5 47 __ LDA T1 + 0 
0e50 : 85 3b __ STA ACCU + 0 
0e52 : a5 48 __ LDA T1 + 1 
0e54 : 4c dc 0d JMP $0ddc ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0e57 : 85 2d __ STA P0 
.s0:
0e59 : a6 2d __ LDX P0 
0e5b : 20 c6 ff JSR $ffc6 
0e5e : a9 00 __ LDA #$00
0e60 : 85 3c __ STA ACCU + 1 
0e62 : b0 02 __ BCS $0e66 ; (krnio_chkin.s0 + 13)
0e64 : a9 01 __ LDA #$01
0e66 : 85 3b __ STA ACCU + 0 
.s1001:
0e68 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0e69 : 20 cf ff JSR $ffcf 
0e6c : 85 3b __ STA ACCU + 0 
0e6e : a9 00 __ LDA #$00
0e70 : 85 3c __ STA ACCU + 1 
.s1001:
0e72 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0e73 : 20 b7 ff JSR $ffb7 
0e76 : 85 3b __ STA ACCU + 0 
0e78 : a9 00 __ LDA #$00
0e7a : 85 3c __ STA ACCU + 1 
.s1001:
0e7c : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0e7d : 20 cc ff JSR $ffcc 
.s1001:
0e80 : 60 __ __ RTS
--------------------------------------------------------------------
0e81 : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 41 72 6b 61 : @0:zsmfiles/Arka
0e91 : __ __ __ BYT 6e 6f 69 64 46 4d 2e 7a 73 6d 2c 50 2c 52 00    : noidFM.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0ea0 : 20 bc 0e JSR $0ebc ; (getchx.s0 + 0)
0ea3 : a5 3c __ LDA ACCU + 1 
0ea5 : d0 10 __ BNE $0eb7 ; (Control.s3 + 0)
.s1005:
0ea7 : a5 3b __ LDA ACCU + 0 
0ea9 : c9 20 __ CMP #$20
0eab : d0 0a __ BNE $0eb7 ; (Control.s3 + 0)
.s1:
0ead : a9 00 __ LDA #$00
0eaf : c5 2e __ CMP P1 ; (playing + 0)
0eb1 : 2a __ __ ROL
0eb2 : 85 2e __ STA P1 ; (playing + 0)
0eb4 : 20 ed 0e JSR $0eed ; (zsm_irq_play.s0 + 0)
.s3:
0eb7 : a5 2e __ LDA P1 ; (playing + 0)
0eb9 : 85 3b __ STA ACCU + 0 
.s1001:
0ebb : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0ebc : 20 c6 0e JSR $0ec6 ; (getpch + 0)
0ebf : 85 3b __ STA ACCU + 0 
0ec1 : a9 00 __ LDA #$00
0ec3 : 85 3c __ STA ACCU + 1 
.s1001:
0ec5 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0ec6 : 20 e4 ff JSR $ffe4 
0ec9 : ae ee 0f LDX $0fee ; (giocharmap + 0)
0ecc : e0 01 __ CPX #$01
0ece : 90 1c __ BCC $0eec ; (getpch + 38)
0ed0 : c9 0d __ CMP #$0d
0ed2 : d0 02 __ BNE $0ed6 ; (getpch + 16)
0ed4 : a9 0a __ LDA #$0a
0ed6 : e0 02 __ CPX #$02
0ed8 : 90 12 __ BCC $0eec ; (getpch + 38)
0eda : c9 41 __ CMP #$41
0edc : 90 0e __ BCC $0eec ; (getpch + 38)
0ede : c9 7b __ CMP #$7b
0ee0 : b0 0a __ BCS $0eec ; (getpch + 38)
0ee2 : c9 61 __ CMP #$61
0ee4 : b0 04 __ BCS $0eea ; (getpch + 36)
0ee6 : c9 5b __ CMP #$5b
0ee8 : b0 02 __ BCS $0eec ; (getpch + 38)
0eea : 49 20 __ EOR #$20
0eec : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
0fee : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0eed : 8d cb 0f STA $0fcb ; (zsm_playing + 0)
.s1001:
0ef0 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
0fef : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
1020 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
1030 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
1040 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
0ff8 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0ef1 : ad 26 9f LDA $9f26 
0ef4 : 29 40 __ AND #$40
0ef6 : d0 f9 __ BNE $0ef1 ; (frame_wait.l1 + 0)
.l4:
0ef8 : ad 26 9f LDA $9f26 
0efb : 29 40 __ AND #$40
0efd : f0 f9 __ BEQ $0ef8 ; (frame_wait.l4 + 0)
.s1001:
0eff : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0f00 : 38 __ __ SEC
0f01 : a9 00 __ LDA #$00
0f03 : e5 3b __ SBC ACCU + 0 
0f05 : 85 3b __ STA ACCU + 0 
0f07 : a9 00 __ LDA #$00
0f09 : e5 3c __ SBC ACCU + 1 
0f0b : 85 3c __ STA ACCU + 1 
0f0d : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0f0e : 38 __ __ SEC
0f0f : a9 00 __ LDA #$00
0f11 : e5 23 __ SBC WORK + 0 
0f13 : 85 23 __ STA WORK + 0 
0f15 : a9 00 __ LDA #$00
0f17 : e5 24 __ SBC WORK + 1 
0f19 : 85 24 __ STA WORK + 1 
0f1b : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
0f1c : a5 3c __ LDA ACCU + 1 
0f1e : d0 31 __ BNE $0f51 ; (divmod + 53)
0f20 : a5 24 __ LDA WORK + 1 
0f22 : d0 1e __ BNE $0f42 ; (divmod + 38)
0f24 : 85 26 __ STA WORK + 3 
0f26 : a2 04 __ LDX #$04
0f28 : 06 3b __ ASL ACCU + 0 
0f2a : 2a __ __ ROL
0f2b : c5 23 __ CMP WORK + 0 
0f2d : 90 02 __ BCC $0f31 ; (divmod + 21)
0f2f : e5 23 __ SBC WORK + 0 
0f31 : 26 3b __ ROL ACCU + 0 
0f33 : 2a __ __ ROL
0f34 : c5 23 __ CMP WORK + 0 
0f36 : 90 02 __ BCC $0f3a ; (divmod + 30)
0f38 : e5 23 __ SBC WORK + 0 
0f3a : 26 3b __ ROL ACCU + 0 
0f3c : ca __ __ DEX
0f3d : d0 eb __ BNE $0f2a ; (divmod + 14)
0f3f : 85 25 __ STA WORK + 2 
0f41 : 60 __ __ RTS
0f42 : a5 3b __ LDA ACCU + 0 
0f44 : 85 25 __ STA WORK + 2 
0f46 : a5 3c __ LDA ACCU + 1 
0f48 : 85 26 __ STA WORK + 3 
0f4a : a9 00 __ LDA #$00
0f4c : 85 3b __ STA ACCU + 0 
0f4e : 85 3c __ STA ACCU + 1 
0f50 : 60 __ __ RTS
0f51 : a5 24 __ LDA WORK + 1 
0f53 : d0 1f __ BNE $0f74 ; (divmod + 88)
0f55 : a5 23 __ LDA WORK + 0 
0f57 : 30 1b __ BMI $0f74 ; (divmod + 88)
0f59 : a9 00 __ LDA #$00
0f5b : 85 26 __ STA WORK + 3 
0f5d : a2 10 __ LDX #$10
0f5f : 06 3b __ ASL ACCU + 0 
0f61 : 26 3c __ ROL ACCU + 1 
0f63 : 2a __ __ ROL
0f64 : c5 23 __ CMP WORK + 0 
0f66 : 90 02 __ BCC $0f6a ; (divmod + 78)
0f68 : e5 23 __ SBC WORK + 0 
0f6a : 26 3b __ ROL ACCU + 0 
0f6c : 26 3c __ ROL ACCU + 1 
0f6e : ca __ __ DEX
0f6f : d0 f2 __ BNE $0f63 ; (divmod + 71)
0f71 : 85 25 __ STA WORK + 2 
0f73 : 60 __ __ RTS
0f74 : a9 00 __ LDA #$00
0f76 : 85 25 __ STA WORK + 2 
0f78 : 85 26 __ STA WORK + 3 
0f7a : 84 22 __ STY $22 
0f7c : a0 10 __ LDY #$10
0f7e : 18 __ __ CLC
0f7f : 26 3b __ ROL ACCU + 0 
0f81 : 26 3c __ ROL ACCU + 1 
0f83 : 26 25 __ ROL WORK + 2 
0f85 : 26 26 __ ROL WORK + 3 
0f87 : 38 __ __ SEC
0f88 : a5 25 __ LDA WORK + 2 
0f8a : e5 23 __ SBC WORK + 0 
0f8c : aa __ __ TAX
0f8d : a5 26 __ LDA WORK + 3 
0f8f : e5 24 __ SBC WORK + 1 
0f91 : 90 04 __ BCC $0f97 ; (divmod + 123)
0f93 : 86 25 __ STX WORK + 2 
0f95 : 85 26 __ STA WORK + 3 
0f97 : 88 __ __ DEY
0f98 : d0 e5 __ BNE $0f7f ; (divmod + 99)
0f9a : 26 3b __ ROL ACCU + 0 
0f9c : 26 3c __ ROL ACCU + 1 
0f9e : a4 22 __ LDY $22 
0fa0 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
0fa1 : 24 3c __ BIT ACCU + 1 
0fa3 : 10 0d __ BPL $0fb2 ; (mods16 + 17)
0fa5 : 20 00 0f JSR $0f00 ; (negaccu + 0)
0fa8 : 24 24 __ BIT WORK + 1 
0faa : 10 0d __ BPL $0fb9 ; (mods16 + 24)
0fac : 20 0e 0f JSR $0f0e ; (negtmp + 0)
0faf : 4c 1c 0f JMP $0f1c ; (divmod + 0)
0fb2 : 24 24 __ BIT WORK + 1 
0fb4 : 10 f9 __ BPL $0faf ; (mods16 + 14)
0fb6 : 20 0e 0f JSR $0f0e ; (negtmp + 0)
0fb9 : 20 1c 0f JSR $0f1c ; (divmod + 0)
0fbc : 38 __ __ SEC
0fbd : a9 00 __ LDA #$00
0fbf : e5 25 __ SBC WORK + 2 
0fc1 : 85 25 __ STA WORK + 2 
0fc3 : a9 00 __ LDA #$00
0fc5 : e5 26 __ SBC WORK + 3 
0fc7 : 85 26 __ STA WORK + 3 
0fc9 : 60 __ __ RTS
