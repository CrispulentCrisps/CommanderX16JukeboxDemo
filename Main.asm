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
080e : 8e 20 0f STX $0f20 ; (spentry + 0)
0811 : a9 7c __ LDA #$7c
0813 : 85 39 __ STA IP + 0 
0815 : a9 0f __ LDA #$0f
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 13 __ LDA #$13
081c : e9 0f __ SBC #$0f
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
0830 : a9 94 __ LDA #$94
0832 : e9 7c __ SBC #$7c
0834 : f0 08 __ BEQ $083e ; (startup + 61)
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 39 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839 ; (startup + 56)
083e : a9 f2 __ LDA #$f2
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
0f20 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 2b 09 JSR $092b ; (zsm_irq_init.s0 + 0)
0883 : 20 f9 0a JSR $0af9 ; (SetUpSprites.s0 + 0)
0886 : 20 28 0c JSR $0c28 ; (ClearVERAScreen.s0 + 0)
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
08b1 : 20 6b 0c JSR $0c6b ; (zsm_check.s0 + 0)
08b4 : 09 00 __ ORA #$00
08b6 : f0 0b __ BEQ $08c3 ; (main.s6 + 0)
.s4:
08b8 : a9 dc __ LDA #$dc
08ba : 85 30 __ STA P3 
08bc : a9 0d __ LDA #$0d
08be : 85 31 __ STA P4 
08c0 : 20 6f 0c JSR $0c6f ; (zsm_init.s0 + 0)
.s6:
08c3 : a5 4b __ LDA T1 + 0 
08c5 : 85 2e __ STA P1 
08c7 : 20 f6 0d JSR $0df6 ; (Control.s0 + 0)
08ca : a5 3b __ LDA ACCU + 0 
08cc : 85 4b __ STA T1 + 0 
08ce : ad 4f 0f LDA $0f4f ; (FrameCount + 0)
08d1 : 85 48 __ STA T3 + 0 
08d3 : 85 3b __ STA ACCU + 0 
08d5 : ad 50 0f LDA $0f50 ; (FrameCount + 1)
08d8 : 85 3c __ STA ACCU + 1 
08da : a9 04 __ LDA #$04
08dc : 85 23 __ STA WORK + 0 
08de : a9 00 __ LDA #$00
08e0 : 85 24 __ STA WORK + 1 
08e2 : 20 f7 0e JSR $0ef7 ; (mods16 + 0)
08e5 : a5 26 __ LDA WORK + 3 
08e7 : d0 16 __ BNE $08ff ; (main.s9 + 0)
.s1002:
08e9 : a5 25 __ LDA WORK + 2 
08eb : c9 01 __ CMP #$01
08ed : d0 10 __ BNE $08ff ; (main.s9 + 0)
.s7:
08ef : ae 93 13 LDX $1393 ; (off1 + 0)
08f2 : e8 __ __ INX
08f3 : 8e 93 13 STX $1393 ; (off1 + 0)
08f6 : bd 50 0f LDA $0f50,x ; (FrameCount + 1)
08f9 : 38 __ __ SEC
08fa : e9 40 __ SBC #$40
08fc : 8d 23 9f STA $9f23 
.s9:
08ff : 06 48 __ ASL T3 + 0 
0901 : ad 50 0f LDA $0f50 ; (FrameCount + 1)
0904 : 2a __ __ ROL
0905 : 18 __ __ CLC
0906 : 69 ff __ ADC #$ff
0908 : 8d 38 9f STA $9f38 
090b : a5 48 __ LDA T3 + 0 
090d : 8d 37 9f STA $9f37 
0910 : a9 01 __ LDA #$01
0912 : 8d 2c 9f STA $9f2c 
0915 : 20 0e 0d JSR $0d0e ; (zsm_fill.s0 + 0)
0918 : a9 00 __ LDA #$00
091a : 8d 2c 9f STA $9f2c 
091d : 20 47 0e JSR $0e47 ; (frame_wait.l1 + 0)
0920 : ee 4f 0f INC $0f4f ; (FrameCount + 0)
0923 : d0 8c __ BNE $08b1 ; (main.l2 + 0)
.s1003:
0925 : ee 50 0f INC $0f50 ; (FrameCount + 1)
0928 : 4c b1 08 JMP $08b1 ; (main.l2 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
092b : 78 __ __ SEI
092c : ad 14 03 LDA $0314 
092f : 8d 7c 0f STA $0f7c ; (oirq + 0)
0932 : ad 15 03 LDA $0315 
0935 : 8d 7d 0f STA $0f7d ; (oirq + 1)
0938 : a9 44 __ LDA #$44
093a : 8d 14 03 STA $0314 
093d : a9 09 __ LDA #$09
093f : 8d 15 03 STA $0315 
0942 : 58 __ __ CLI
.s1001:
0943 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
0f7c : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
0944 : 20 4a 09 JSR $094a ; (irq.s1000 + 0)
0947 : 6c 7c 0f JMP ($0f7c)
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
0974 : ad 21 0f LDA $0f21 ; (zsm_playing + 0)
0977 : f0 08 __ BEQ $0981 ; (irq.s1001 + 0)
.s4:
0979 : ad 22 0f LDA $0f22 ; (zsm_finished + 0)
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
0f21 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
zsm_finished:
0f22 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_play:
.s0:
09ac : ad 7e 0f LDA $0f7e ; (zsm_delay + 0)
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
09d0 : ad 7f 13 LDA $137f ; (zsm_pos + 0)
09d3 : 85 4b __ STA T3 + 0 
09d5 : 18 __ __ CLC
09d6 : 69 01 __ ADC #$01
09d8 : 85 4d __ STA T4 + 0 
09da : 8d 7f 13 STA $137f ; (zsm_pos + 0)
09dd : ad 80 13 LDA $1380 ; (zsm_pos + 1)
09e0 : aa __ __ TAX
09e1 : 69 00 __ ADC #$00
09e3 : 85 4e __ STA T4 + 1 
09e5 : 8d 80 13 STA $1380 ; (zsm_pos + 1)
09e8 : 18 __ __ CLC
09e9 : a9 7f __ LDA #$7f
09eb : 65 4b __ ADC T3 + 0 
09ed : 85 3b __ STA ACCU + 0 
09ef : 8a __ __ TXA
09f0 : 29 03 __ AND #$03
09f2 : 69 0f __ ADC #$0f
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
0a04 : a9 7f __ LDA #$7f
0a06 : 65 4d __ ADC T4 + 0 
0a08 : 85 4b __ STA T3 + 0 
0a0a : a5 4e __ LDA T4 + 1 
0a0c : 29 03 __ AND #$03
0a0e : 69 0f __ ADC #$0f
0a10 : 85 4c __ STA T3 + 1 
0a12 : b1 4b __ LDA (T3 + 0),y 
0a14 : 29 3f __ AND #$3f
0a16 : 18 __ __ CLC
0a17 : 65 4d __ ADC T4 + 0 
0a19 : 8d 7f 13 STA $137f ; (zsm_pos + 0)
0a1c : 98 __ __ TYA
0a1d : 65 4e __ ADC T4 + 1 
0a1f : 8d 80 13 STA $1380 ; (zsm_pos + 1)
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
0a32 : a9 7f __ LDA #$7f
0a34 : 6d 7f 13 ADC $137f ; (zsm_pos + 0)
0a37 : 85 4d __ STA T4 + 0 
0a39 : ad 80 13 LDA $1380 ; (zsm_pos + 1)
0a3c : 29 03 __ AND #$03
0a3e : 69 0f __ ADC #$0f
0a40 : 85 4e __ STA T4 + 1 
0a42 : a0 00 __ LDY #$00
0a44 : b1 4d __ LDA (T4 + 0),y 
0a46 : 85 2d __ STA P0 
0a48 : ad 7f 13 LDA $137f ; (zsm_pos + 0)
0a4b : 18 __ __ CLC
0a4c : 69 01 __ ADC #$01
0a4e : aa __ __ TAX
0a4f : ad 80 13 LDA $1380 ; (zsm_pos + 1)
0a52 : 69 00 __ ADC #$00
0a54 : 29 03 __ AND #$03
0a56 : 85 4c __ STA T3 + 1 
0a58 : 8a __ __ TXA
0a59 : 18 __ __ CLC
0a5a : 69 7f __ ADC #$7f
0a5c : 85 4b __ STA T3 + 0 
0a5e : a9 0f __ LDA #$0f
0a60 : 65 4c __ ADC T3 + 1 
0a62 : 85 4c __ STA T3 + 1 
0a64 : b1 4b __ LDA (T3 + 0),y 
0a66 : 85 2e __ STA P1 
0a68 : 20 e5 0a JSR $0ae5 ; (sfx_put.l1 + 0)
0a6b : ad 7f 13 LDA $137f ; (zsm_pos + 0)
0a6e : 18 __ __ CLC
0a6f : 69 02 __ ADC #$02
0a71 : 8d 7f 13 STA $137f ; (zsm_pos + 0)
0a74 : 90 03 __ BCC $0a79 ; (zsm_play.s1015 + 0)
.s1014:
0a76 : ee 80 13 INC $1380 ; (zsm_pos + 1)
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
0a8a : 8d 22 0f STA $0f22 ; (zsm_finished + 0)
0a8d : d0 08 __ BNE $0a97 ; (zsm_play.s7 + 0)
.s22:
0a8f : 29 7f __ AND #$7f
0a91 : 38 __ __ SEC
0a92 : e9 01 __ SBC #$01
0a94 : 8d 7e 0f STA $0f7e ; (zsm_delay + 0)
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
0ac1 : 8d 7f 13 STA $137f ; (zsm_pos + 0)
0ac4 : 90 01 __ BCC $0ac7 ; (zsm_play.s1017 + 0)
.s1016:
0ac6 : e8 __ __ INX
.s1017:
0ac7 : 8e 80 13 STX $1380 ; (zsm_pos + 1)
0aca : 18 __ __ CLC
0acb : a9 7f __ LDA #$7f
0acd : 65 4d __ ADC T4 + 0 
0acf : 85 4b __ STA T3 + 0 
0ad1 : a5 4e __ LDA T4 + 1 
0ad3 : 29 03 __ AND #$03
0ad5 : 69 0f __ ADC #$0f
0ad7 : 85 4c __ STA T3 + 1 
0ad9 : b1 4b __ LDA (T3 + 0),y 
0adb : 8d 23 9f STA $9f23 
0ade : 4c d0 09 JMP $09d0 ; (zsm_play.l5 + 0)
.s1:
0ae1 : ce 7e 0f DEC $0f7e ; (zsm_delay + 0)
0ae4 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_delay:
0f7e : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_buffer:
0f7f : __ __ __ BSS	1024
--------------------------------------------------------------------
zsm_pos:
137f : __ __ __ BSS	2
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
SetUpSprites:
.s0:
0af9 : a9 00 __ LDA #$00
0afb : 85 35 __ STA P8 
0afd : 85 36 __ STA P9 
0aff : 85 38 __ STA P11 
0b01 : a9 30 __ LDA #$30
0b03 : 85 37 __ STA P10 
0b05 : a9 01 __ LDA #$01
0b07 : 8d f4 9e STA $9ef4 ; (sstack + 0)
0b0a : 8d f5 9e STA $9ef5 ; (sstack + 1)
0b0d : 8d f7 9e STA $9ef7 ; (sstack + 3)
0b10 : 8d fe 9e STA $9efe ; (sstack + 10)
0b13 : a9 03 __ LDA #$03
0b15 : 8d f6 9e STA $9ef6 ; (sstack + 2)
0b18 : a9 00 __ LDA #$00
0b1a : 8d fc 9e STA $9efc ; (sstack + 8)
0b1d : 8d ff 9e STA $9eff ; (sstack + 11)
0b20 : a9 30 __ LDA #$30
0b22 : 8d fd 9e STA $9efd ; (sstack + 9)
0b25 : a9 23 __ LDA #$23
0b27 : 8d f8 9e STA $9ef8 ; (sstack + 4)
0b2a : a9 0f __ LDA #$0f
0b2c : 8d f9 9e STA $9ef9 ; (sstack + 5)
0b2f : a9 2b __ LDA #$2b
0b31 : 8d fa 9e STA $9efa ; (sstack + 6)
0b34 : a9 0f __ LDA #$0f
0b36 : 8d fb 9e STA $9efb ; (sstack + 7)
0b39 : 4c 3c 0b JMP $0b3c ; (Setup.s0 + 0)
--------------------------------------------------------------------
Setup:
.s0:
0b3c : a9 00 __ LDA #$00
0b3e : 85 33 __ STA P6 
0b40 : 85 34 __ STA P7 
0b42 : ad fc 9e LDA $9efc ; (sstack + 8)
0b45 : 85 2d __ STA P0 
0b47 : ad fd 9e LDA $9efd ; (sstack + 9)
0b4a : 85 2e __ STA P1 
0b4c : ad fe 9e LDA $9efe ; (sstack + 10)
0b4f : 85 2f __ STA P2 
0b51 : ad ff 9e LDA $9eff ; (sstack + 11)
0b54 : 85 30 __ STA P3 
0b56 : ad fa 9e LDA $9efa ; (sstack + 6)
0b59 : 85 31 __ STA P4 
0b5b : ad fb 9e LDA $9efb ; (sstack + 7)
0b5e : 85 32 __ STA P5 
0b60 : 20 8a 0b JSR $0b8a ; (vram_putn.s0 + 0)
0b63 : a5 35 __ LDA P8 ; (spr + 0)
0b65 : 85 2d __ STA P0 
0b67 : a5 36 __ LDA P9 ; (addr32 + 0)
0b69 : 85 2e __ STA P1 
0b6b : a5 37 __ LDA P10 ; (addr32 + 1)
0b6d : 85 2f __ STA P2 
0b6f : a5 38 __ LDA P11 ; (mode8 + 0)
0b71 : 85 30 __ STA P3 
0b73 : ad f4 9e LDA $9ef4 ; (sstack + 0)
0b76 : 85 31 __ STA P4 
0b78 : ad f5 9e LDA $9ef5 ; (sstack + 1)
0b7b : 85 32 __ STA P5 
0b7d : ad f6 9e LDA $9ef6 ; (sstack + 2)
0b80 : 85 33 __ STA P6 
0b82 : ad f7 9e LDA $9ef7 ; (sstack + 3)
0b85 : 85 34 __ STA P7 
0b87 : 4c c5 0b JMP $0bc5 ; (vera_spr_set.s0 + 0)
--------------------------------------------------------------------
vram_putn:
.s0:
0b8a : ad 25 9f LDA $9f25 
0b8d : 29 fe __ AND #$fe
0b8f : 8d 25 9f STA $9f25 
0b92 : a5 2d __ LDA P0 ; (addr + 0)
0b94 : 8d 20 9f STA $9f20 
0b97 : a5 2e __ LDA P1 ; (addr + 1)
0b99 : 8d 21 9f STA $9f21 
0b9c : a5 2f __ LDA P2 ; (addr + 2)
0b9e : 29 01 __ AND #$01
0ba0 : 09 10 __ ORA #$10
0ba2 : 8d 22 9f STA $9f22 
0ba5 : a5 33 __ LDA P6 ; (size + 0)
0ba7 : 05 34 __ ORA P7 ; (size + 1)
0ba9 : f0 19 __ BEQ $0bc4 ; (vram_putn.s1001 + 0)
.s6:
0bab : a0 00 __ LDY #$00
0bad : a6 33 __ LDX P6 ; (size + 0)
0baf : f0 02 __ BEQ $0bb3 ; (vram_putn.l1002 + 0)
.s1005:
0bb1 : e6 34 __ INC P7 ; (size + 1)
.l1002:
0bb3 : b1 31 __ LDA (P4),y ; (data + 0)
0bb5 : 8d 23 9f STA $9f23 
0bb8 : c8 __ __ INY
0bb9 : d0 02 __ BNE $0bbd ; (vram_putn.s1009 + 0)
.s1008:
0bbb : e6 32 __ INC P5 ; (data + 1)
.s1009:
0bbd : ca __ __ DEX
0bbe : d0 f3 __ BNE $0bb3 ; (vram_putn.l1002 + 0)
.s1004:
0bc0 : c6 34 __ DEC P7 ; (size + 1)
0bc2 : d0 ef __ BNE $0bb3 ; (vram_putn.l1002 + 0)
.s1001:
0bc4 : 60 __ __ RTS
--------------------------------------------------------------------
vera_spr_set:
.s0:
0bc5 : ad 25 9f LDA $9f25 
0bc8 : 29 fe __ AND #$fe
0bca : 8d 25 9f STA $9f25 
0bcd : a5 2d __ LDA P0 ; (spr + 0)
0bcf : 0a __ __ ASL
0bd0 : 0a __ __ ASL
0bd1 : 85 3b __ STA ACCU + 0 
0bd3 : a9 00 __ LDA #$00
0bd5 : 2a __ __ ROL
0bd6 : 06 3b __ ASL ACCU + 0 
0bd8 : 2a __ __ ROL
0bd9 : 09 fc __ ORA #$fc
0bdb : 8d 21 9f STA $9f21 
0bde : a5 3b __ LDA ACCU + 0 
0be0 : 8d 20 9f STA $9f20 
0be3 : a9 11 __ LDA #$11
0be5 : 8d 22 9f STA $9f22 
0be8 : a5 30 __ LDA P3 ; (mode8 + 0)
0bea : f0 02 __ BEQ $0bee ; (vera_spr_set.s11 + 0)
.s9:
0bec : a9 80 __ LDA #$80
.s11:
0bee : 05 2e __ ORA P1 ; (addr32 + 0)
0bf0 : 8d 23 9f STA $9f23 
0bf3 : a5 2f __ LDA P2 ; (addr32 + 1)
0bf5 : 8d 23 9f STA $9f23 
0bf8 : a9 00 __ LDA #$00
0bfa : 8d 23 9f STA $9f23 
0bfd : 8d 23 9f STA $9f23 
0c00 : 8d 23 9f STA $9f23 
0c03 : 8d 23 9f STA $9f23 
0c06 : a5 33 __ LDA P6 ; (z + 0)
0c08 : 0a __ __ ASL
0c09 : 0a __ __ ASL
0c0a : 8d 23 9f STA $9f23 
0c0d : a5 32 __ LDA P5 ; (h + 0)
0c0f : 4a __ __ LSR
0c10 : 85 3c __ STA ACCU + 1 
0c12 : a9 00 __ LDA #$00
0c14 : 6a __ __ ROR
0c15 : 66 3c __ ROR ACCU + 1 
0c17 : 6a __ __ ROR
0c18 : 85 3b __ STA ACCU + 0 
0c1a : a5 31 __ LDA P4 ; (w + 0)
0c1c : 0a __ __ ASL
0c1d : 0a __ __ ASL
0c1e : 0a __ __ ASL
0c1f : 0a __ __ ASL
0c20 : 05 3b __ ORA ACCU + 0 
0c22 : 05 34 __ ORA P7 ; (pal + 0)
0c24 : 8d 23 9f STA $9f23 
.s1001:
0c27 : 60 __ __ RTS
--------------------------------------------------------------------
palette:
0f23 : __ __ __ BYT 00 00 00 00 ff 0f ef 0e                         : ........
--------------------------------------------------------------------
TestSpriteImage:
0f2b : __ __ __ BYT 00 00 01 11 11 10 12 11 11 21 10 11 11 01 10 11 : .........!......
0f3b : __ __ __ BYT 11 01 21 11 11 12 02 11 11 20 00 22 22 00 00 00 : ..!...... .""...
0f4b : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0c28 : a9 93 __ LDA #$93
0c2a : 85 2d __ STA P0 
0c2c : a9 00 __ LDA #$00
0c2e : 85 2e __ STA P1 
0c30 : 20 65 0c JSR $0c65 ; (putch.s0 + 0)
0c33 : a9 11 __ LDA #$11
0c35 : 8d 22 9f STA $9f22 
0c38 : a2 00 __ LDX #$00
.l2:
0c3a : 8a __ __ TXA
0c3b : 18 __ __ CLC
0c3c : 69 b0 __ ADC #$b0
0c3e : 8d 21 9f STA $9f21 
0c41 : a9 00 __ LDA #$00
0c43 : 8d 20 9f STA $9f20 
0c46 : a0 50 __ LDY #$50
.l1003:
0c48 : a9 20 __ LDA #$20
0c4a : 8d 23 9f STA $9f23 
0c4d : a9 01 __ LDA #$01
0c4f : 8d 23 9f STA $9f23 
0c52 : a9 20 __ LDA #$20
0c54 : 8d 24 9f STA $9f24 
0c57 : a9 01 __ LDA #$01
0c59 : 8d 24 9f STA $9f24 
0c5c : 88 __ __ DEY
0c5d : d0 e9 __ BNE $0c48 ; (ClearVERAScreen.l1003 + 0)
.s1004:
0c5f : e8 __ __ INX
0c60 : e0 3c __ CPX #$3c
0c62 : 90 d6 __ BCC $0c3a ; (ClearVERAScreen.l2 + 0)
.s1001:
0c64 : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0c65 : a5 2d __ LDA P0 
0c67 : 20 d2 ff JSR $ffd2 
.s1001:
0c6a : 60 __ __ RTS
--------------------------------------------------------------------
zsm_check:
.s0:
0c6b : ad 22 0f LDA $0f22 ; (zsm_finished + 0)
.s1001:
0c6e : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0c6f : a9 01 __ LDA #$01
0c71 : 8d 22 0f STA $0f22 ; (zsm_finished + 0)
0c74 : ad 4d 0f LDA $0f4d ; (zsm_reading + 0)
0c77 : f0 0a __ BEQ $0c83 ; (zsm_init.s3 + 0)
.s1:
0c79 : a9 02 __ LDA #$02
0c7b : 20 c8 0c JSR $0cc8 ; (krnio_close.s1000 + 0)
0c7e : a9 00 __ LDA #$00
0c80 : 8d 4d 0f STA $0f4d ; (zsm_reading + 0)
.s3:
0c83 : 8d 7f 13 STA $137f ; (zsm_pos + 0)
0c86 : 8d 80 13 STA $1380 ; (zsm_pos + 1)
0c89 : 8d 81 13 STA $1381 ; (zsm_wpos + 0)
0c8c : 8d 82 13 STA $1382 ; (zsm_wpos + 1)
0c8f : 8d 7e 0f STA $0f7e ; (zsm_delay + 0)
0c92 : a5 30 __ LDA P3 ; (fname + 0)
0c94 : 85 2d __ STA P0 
0c96 : a5 31 __ LDA P4 ; (fname + 1)
0c98 : 85 2e __ STA P1 
0c9a : 20 d0 0c JSR $0cd0 ; (krnio_setnam.s0 + 0)
0c9d : a9 02 __ LDA #$02
0c9f : 85 2d __ STA P0 
0ca1 : 85 2f __ STA P2 
0ca3 : a9 08 __ LDA #$08
0ca5 : 85 2e __ STA P1 
0ca7 : 20 e6 0c JSR $0ce6 ; (krnio_open.s0 + 0)
0caa : a5 3b __ LDA ACCU + 0 
0cac : f0 19 __ BEQ $0cc7 ; (zsm_init.s1001 + 0)
.s4:
0cae : a9 01 __ LDA #$01
0cb0 : 8d 4d 0f STA $0f4d ; (zsm_reading + 0)
0cb3 : 20 0e 0d JSR $0d0e ; (zsm_fill.s0 + 0)
0cb6 : a9 10 __ LDA #$10
0cb8 : 8d 7f 13 STA $137f ; (zsm_pos + 0)
0cbb : a9 00 __ LDA #$00
0cbd : 8d 80 13 STA $1380 ; (zsm_pos + 1)
0cc0 : 8d 22 0f STA $0f22 ; (zsm_finished + 0)
0cc3 : a9 01 __ LDA #$01
0cc5 : 85 3b __ STA ACCU + 0 
.s1001:
0cc7 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_reading:
0f4d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_close:
.s1000:
0cc8 : 85 2d __ STA P0 
.s0:
0cca : a5 2d __ LDA P0 
0ccc : 20 c3 ff JSR $ffc3 
.s1001:
0ccf : 60 __ __ RTS
--------------------------------------------------------------------
zsm_wpos:
1381 : __ __ __ BSS	2
--------------------------------------------------------------------
krnio_setnam:
.s0:
0cd0 : a5 2d __ LDA P0 
0cd2 : 05 2e __ ORA P1 
0cd4 : f0 08 __ BEQ $0cde ; (krnio_setnam.s0 + 14)
0cd6 : a0 ff __ LDY #$ff
0cd8 : c8 __ __ INY
0cd9 : b1 2d __ LDA (P0),y 
0cdb : d0 fb __ BNE $0cd8 ; (krnio_setnam.s0 + 8)
0cdd : 98 __ __ TYA
0cde : a6 2d __ LDX P0 
0ce0 : a4 2e __ LDY P1 
0ce2 : 20 bd ff JSR $ffbd 
.s1001:
0ce5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open:
.s0:
0ce6 : a9 00 __ LDA #$00
0ce8 : a6 2d __ LDX P0 ; (fnum + 0)
0cea : 9d 83 13 STA $1383,x ; (krnio_pstatus + 0)
0ced : a9 00 __ LDA #$00
0cef : 85 3b __ STA ACCU + 0 
0cf1 : 85 3c __ STA ACCU + 1 
0cf3 : a5 2d __ LDA P0 ; (fnum + 0)
0cf5 : a6 2e __ LDX P1 
0cf7 : a4 2f __ LDY P2 
0cf9 : 20 ba ff JSR $ffba 
0cfc : 20 c0 ff JSR $ffc0 
0cff : 90 08 __ BCC $0d09 ; (krnio_open.s0 + 35)
0d01 : a5 2d __ LDA P0 ; (fnum + 0)
0d03 : 20 c3 ff JSR $ffc3 
0d06 : 4c 0d 0d JMP $0d0d ; (krnio_open.s1001 + 0)
0d09 : a9 01 __ LDA #$01
0d0b : 85 3b __ STA ACCU + 0 
.s1001:
0d0d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_pstatus:
1383 : __ __ __ BSS	16
--------------------------------------------------------------------
zsm_fill:
.s0:
0d0e : ad 4d 0f LDA $0f4d ; (zsm_reading + 0)
0d11 : f0 20 __ BEQ $0d33 ; (zsm_fill.s1 + 0)
.s2:
0d13 : ad 80 13 LDA $1380 ; (zsm_pos + 1)
0d16 : 18 __ __ CLC
0d17 : 69 04 __ ADC #$04
0d19 : cd 82 13 CMP $1382 ; (zsm_wpos + 1)
0d1c : d0 0c __ BNE $0d2a ; (zsm_fill.s6 + 0)
.s1006:
0d1e : ad 81 13 LDA $1381 ; (zsm_wpos + 0)
0d21 : cd 7f 13 CMP $137f ; (zsm_pos + 0)
0d24 : d0 04 __ BNE $0d2a ; (zsm_fill.s6 + 0)
.s5:
0d26 : a9 00 __ LDA #$00
0d28 : f0 0b __ BEQ $0d35 ; (zsm_fill.s1008 + 0)
.s6:
0d2a : a9 02 __ LDA #$02
0d2c : 20 b2 0d JSR $0db2 ; (krnio_chkin.s1000 + 0)
0d2f : a5 3b __ LDA ACCU + 0 
0d31 : d0 07 __ BNE $0d3a ; (zsm_fill.s9 + 0)
.s1:
0d33 : a9 ff __ LDA #$ff
.s1008:
0d35 : 85 3b __ STA ACCU + 0 
.s1001:
0d37 : 85 3c __ STA ACCU + 1 
0d39 : 60 __ __ RTS
.s9:
0d3a : a9 00 __ LDA #$00
0d3c : 85 47 __ STA T1 + 0 
0d3e : 85 48 __ STA T1 + 1 
0d40 : ad 80 13 LDA $1380 ; (zsm_pos + 1)
0d43 : 18 __ __ CLC
0d44 : 69 04 __ ADC #$04
0d46 : cd 82 13 CMP $1382 ; (zsm_wpos + 1)
0d49 : d0 08 __ BNE $0d53 ; (zsm_fill.l13 + 0)
.s1002:
0d4b : ad 81 13 LDA $1381 ; (zsm_wpos + 0)
0d4e : cd 7f 13 CMP $137f ; (zsm_pos + 0)
0d51 : f0 49 __ BEQ $0d9c ; (zsm_fill.s37 + 0)
.l13:
0d53 : 20 c4 0d JSR $0dc4 ; (krnio_chrin.s0 + 0)
0d56 : ad 81 13 LDA $1381 ; (zsm_wpos + 0)
0d59 : aa __ __ TAX
0d5a : 18 __ __ CLC
0d5b : 69 01 __ ADC #$01
0d5d : 8d 81 13 STA $1381 ; (zsm_wpos + 0)
0d60 : ad 82 13 LDA $1382 ; (zsm_wpos + 1)
0d63 : a8 __ __ TAY
0d64 : 69 00 __ ADC #$00
0d66 : 8d 82 13 STA $1382 ; (zsm_wpos + 1)
0d69 : 8a __ __ TXA
0d6a : 18 __ __ CLC
0d6b : 69 7f __ ADC #$7f
0d6d : 85 49 __ STA T3 + 0 
0d6f : 98 __ __ TYA
0d70 : 29 03 __ AND #$03
0d72 : 69 0f __ ADC #$0f
0d74 : 85 4a __ STA T3 + 1 
0d76 : a5 3b __ LDA ACCU + 0 
0d78 : a0 00 __ LDY #$00
0d7a : 91 49 __ STA (T3 + 0),y 
0d7c : e6 47 __ INC T1 + 0 
0d7e : d0 02 __ BNE $0d82 ; (zsm_fill.s1010 + 0)
.s1009:
0d80 : e6 48 __ INC T1 + 1 
.s1010:
0d82 : 20 ce 0d JSR $0dce ; (krnio_status.s0 + 0)
0d85 : a5 3b __ LDA ACCU + 0 
0d87 : d0 0e __ BNE $0d97 ; (zsm_fill.s15 + 0)
.s12:
0d89 : ad 80 13 LDA $1380 ; (zsm_pos + 1)
0d8c : 18 __ __ CLC
0d8d : 69 04 __ ADC #$04
0d8f : cd 82 13 CMP $1382 ; (zsm_wpos + 1)
0d92 : d0 bf __ BNE $0d53 ; (zsm_fill.l13 + 0)
0d94 : 4c 4b 0d JMP $0d4b ; (zsm_fill.s1002 + 0)
.s15:
0d97 : a9 00 __ LDA #$00
0d99 : 8d 4d 0f STA $0f4d ; (zsm_reading + 0)
.s37:
0d9c : 20 d8 0d JSR $0dd8 ; (krnio_clrchn.s0 + 0)
0d9f : ad 4d 0f LDA $0f4d ; (zsm_reading + 0)
0da2 : d0 05 __ BNE $0da9 ; (zsm_fill.s21 + 0)
.s19:
0da4 : a9 02 __ LDA #$02
0da6 : 20 c8 0c JSR $0cc8 ; (krnio_close.s1000 + 0)
.s21:
0da9 : a5 47 __ LDA T1 + 0 
0dab : 85 3b __ STA ACCU + 0 
0dad : a5 48 __ LDA T1 + 1 
0daf : 4c 37 0d JMP $0d37 ; (zsm_fill.s1001 + 0)
--------------------------------------------------------------------
krnio_chkin:
.s1000:
0db2 : 85 2d __ STA P0 
.s0:
0db4 : a6 2d __ LDX P0 
0db6 : 20 c6 ff JSR $ffc6 
0db9 : a9 00 __ LDA #$00
0dbb : 85 3c __ STA ACCU + 1 
0dbd : b0 02 __ BCS $0dc1 ; (krnio_chkin.s0 + 13)
0dbf : a9 01 __ LDA #$01
0dc1 : 85 3b __ STA ACCU + 0 
.s1001:
0dc3 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin:
.s0:
0dc4 : 20 cf ff JSR $ffcf 
0dc7 : 85 3b __ STA ACCU + 0 
0dc9 : a9 00 __ LDA #$00
0dcb : 85 3c __ STA ACCU + 1 
.s1001:
0dcd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status:
.s0:
0dce : 20 b7 ff JSR $ffb7 
0dd1 : 85 3b __ STA ACCU + 0 
0dd3 : a9 00 __ LDA #$00
0dd5 : 85 3c __ STA ACCU + 1 
.s1001:
0dd7 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn:
.s0:
0dd8 : 20 cc ff JSR $ffcc 
.s1001:
0ddb : 60 __ __ RTS
--------------------------------------------------------------------
0ddc : __ __ __ BYT 40 30 3a 7a 73 6d 66 69 6c 65 73 2f 4b 72 61 69 : @0:zsmfiles/Krai
0dec : __ __ __ BYT 64 2e 7a 73 6d 2c 50 2c 52 00                   : d.zsm,P,R.
--------------------------------------------------------------------
Control:
.s0:
0df6 : 20 12 0e JSR $0e12 ; (getchx.s0 + 0)
0df9 : a5 3c __ LDA ACCU + 1 
0dfb : d0 10 __ BNE $0e0d ; (Control.s3 + 0)
.s1005:
0dfd : a5 3b __ LDA ACCU + 0 
0dff : c9 20 __ CMP #$20
0e01 : d0 0a __ BNE $0e0d ; (Control.s3 + 0)
.s1:
0e03 : a9 00 __ LDA #$00
0e05 : c5 2e __ CMP P1 ; (playing + 0)
0e07 : 2a __ __ ROL
0e08 : 85 2e __ STA P1 ; (playing + 0)
0e0a : 20 43 0e JSR $0e43 ; (zsm_irq_play.s0 + 0)
.s3:
0e0d : a5 2e __ LDA P1 ; (playing + 0)
0e0f : 85 3b __ STA ACCU + 0 
.s1001:
0e11 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0e12 : 20 1c 0e JSR $0e1c ; (getpch + 0)
0e15 : 85 3b __ STA ACCU + 0 
0e17 : a9 00 __ LDA #$00
0e19 : 85 3c __ STA ACCU + 1 
.s1001:
0e1b : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0e1c : 20 e4 ff JSR $ffe4 
0e1f : ae 4e 0f LDX $0f4e ; (giocharmap + 0)
0e22 : e0 01 __ CPX #$01
0e24 : 90 1c __ BCC $0e42 ; (getpch + 38)
0e26 : c9 0d __ CMP #$0d
0e28 : d0 02 __ BNE $0e2c ; (getpch + 16)
0e2a : a9 0a __ LDA #$0a
0e2c : e0 02 __ CPX #$02
0e2e : 90 12 __ BCC $0e42 ; (getpch + 38)
0e30 : c9 41 __ CMP #$41
0e32 : 90 0e __ BCC $0e42 ; (getpch + 38)
0e34 : c9 7b __ CMP #$7b
0e36 : b0 0a __ BCS $0e42 ; (getpch + 38)
0e38 : c9 61 __ CMP #$61
0e3a : b0 04 __ BCS $0e40 ; (getpch + 36)
0e3c : c9 5b __ CMP #$5b
0e3e : b0 02 __ BCS $0e42 ; (getpch + 38)
0e40 : 49 20 __ EOR #$20
0e42 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
0f4e : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0e43 : 8d 21 0f STA $0f21 ; (zsm_playing + 0)
.s1001:
0e46 : 60 __ __ RTS
--------------------------------------------------------------------
FrameCount:
0f4f : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
TestText2:
0f51 : __ __ __ BYT 43 4f 4e 43 45 50 54 20 43 52 49 53 50 53 20 43 : CONCEPT CRISPS C
0f61 : __ __ __ BYT 4f 44 49 4e 47 20 43 52 49 53 50 53 20 42 4c 55 : ODING CRISPS BLU
0f71 : __ __ __ BYT 4d 42 41 20 54 4f 42 41 43 48 00                : MBA TOBACH.
--------------------------------------------------------------------
off1:
1393 : __ __ __ BSS	1
--------------------------------------------------------------------
frame_wait:
.l1:
0e47 : ad 26 9f LDA $9f26 
0e4a : 29 40 __ AND #$40
0e4c : d0 f9 __ BNE $0e47 ; (frame_wait.l1 + 0)
.l4:
0e4e : ad 26 9f LDA $9f26 
0e51 : 29 40 __ AND #$40
0e53 : f0 f9 __ BEQ $0e4e ; (frame_wait.l4 + 0)
.s1001:
0e55 : 60 __ __ RTS
--------------------------------------------------------------------
negaccu:
0e56 : 38 __ __ SEC
0e57 : a9 00 __ LDA #$00
0e59 : e5 3b __ SBC ACCU + 0 
0e5b : 85 3b __ STA ACCU + 0 
0e5d : a9 00 __ LDA #$00
0e5f : e5 3c __ SBC ACCU + 1 
0e61 : 85 3c __ STA ACCU + 1 
0e63 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
0e64 : 38 __ __ SEC
0e65 : a9 00 __ LDA #$00
0e67 : e5 23 __ SBC WORK + 0 
0e69 : 85 23 __ STA WORK + 0 
0e6b : a9 00 __ LDA #$00
0e6d : e5 24 __ SBC WORK + 1 
0e6f : 85 24 __ STA WORK + 1 
0e71 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
0e72 : a5 3c __ LDA ACCU + 1 
0e74 : d0 31 __ BNE $0ea7 ; (divmod + 53)
0e76 : a5 24 __ LDA WORK + 1 
0e78 : d0 1e __ BNE $0e98 ; (divmod + 38)
0e7a : 85 26 __ STA WORK + 3 
0e7c : a2 04 __ LDX #$04
0e7e : 06 3b __ ASL ACCU + 0 
0e80 : 2a __ __ ROL
0e81 : c5 23 __ CMP WORK + 0 
0e83 : 90 02 __ BCC $0e87 ; (divmod + 21)
0e85 : e5 23 __ SBC WORK + 0 
0e87 : 26 3b __ ROL ACCU + 0 
0e89 : 2a __ __ ROL
0e8a : c5 23 __ CMP WORK + 0 
0e8c : 90 02 __ BCC $0e90 ; (divmod + 30)
0e8e : e5 23 __ SBC WORK + 0 
0e90 : 26 3b __ ROL ACCU + 0 
0e92 : ca __ __ DEX
0e93 : d0 eb __ BNE $0e80 ; (divmod + 14)
0e95 : 85 25 __ STA WORK + 2 
0e97 : 60 __ __ RTS
0e98 : a5 3b __ LDA ACCU + 0 
0e9a : 85 25 __ STA WORK + 2 
0e9c : a5 3c __ LDA ACCU + 1 
0e9e : 85 26 __ STA WORK + 3 
0ea0 : a9 00 __ LDA #$00
0ea2 : 85 3b __ STA ACCU + 0 
0ea4 : 85 3c __ STA ACCU + 1 
0ea6 : 60 __ __ RTS
0ea7 : a5 24 __ LDA WORK + 1 
0ea9 : d0 1f __ BNE $0eca ; (divmod + 88)
0eab : a5 23 __ LDA WORK + 0 
0ead : 30 1b __ BMI $0eca ; (divmod + 88)
0eaf : a9 00 __ LDA #$00
0eb1 : 85 26 __ STA WORK + 3 
0eb3 : a2 10 __ LDX #$10
0eb5 : 06 3b __ ASL ACCU + 0 
0eb7 : 26 3c __ ROL ACCU + 1 
0eb9 : 2a __ __ ROL
0eba : c5 23 __ CMP WORK + 0 
0ebc : 90 02 __ BCC $0ec0 ; (divmod + 78)
0ebe : e5 23 __ SBC WORK + 0 
0ec0 : 26 3b __ ROL ACCU + 0 
0ec2 : 26 3c __ ROL ACCU + 1 
0ec4 : ca __ __ DEX
0ec5 : d0 f2 __ BNE $0eb9 ; (divmod + 71)
0ec7 : 85 25 __ STA WORK + 2 
0ec9 : 60 __ __ RTS
0eca : a9 00 __ LDA #$00
0ecc : 85 25 __ STA WORK + 2 
0ece : 85 26 __ STA WORK + 3 
0ed0 : 84 22 __ STY $22 
0ed2 : a0 10 __ LDY #$10
0ed4 : 18 __ __ CLC
0ed5 : 26 3b __ ROL ACCU + 0 
0ed7 : 26 3c __ ROL ACCU + 1 
0ed9 : 26 25 __ ROL WORK + 2 
0edb : 26 26 __ ROL WORK + 3 
0edd : 38 __ __ SEC
0ede : a5 25 __ LDA WORK + 2 
0ee0 : e5 23 __ SBC WORK + 0 
0ee2 : aa __ __ TAX
0ee3 : a5 26 __ LDA WORK + 3 
0ee5 : e5 24 __ SBC WORK + 1 
0ee7 : 90 04 __ BCC $0eed ; (divmod + 123)
0ee9 : 86 25 __ STX WORK + 2 
0eeb : 85 26 __ STA WORK + 3 
0eed : 88 __ __ DEY
0eee : d0 e5 __ BNE $0ed5 ; (divmod + 99)
0ef0 : 26 3b __ ROL ACCU + 0 
0ef2 : 26 3c __ ROL ACCU + 1 
0ef4 : a4 22 __ LDY $22 
0ef6 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
0ef7 : 24 3c __ BIT ACCU + 1 
0ef9 : 10 0d __ BPL $0f08 ; (mods16 + 17)
0efb : 20 56 0e JSR $0e56 ; (negaccu + 0)
0efe : 24 24 __ BIT WORK + 1 
0f00 : 10 0d __ BPL $0f0f ; (mods16 + 24)
0f02 : 20 64 0e JSR $0e64 ; (negtmp + 0)
0f05 : 4c 72 0e JMP $0e72 ; (divmod + 0)
0f08 : 24 24 __ BIT WORK + 1 
0f0a : 10 f9 __ BPL $0f05 ; (mods16 + 14)
0f0c : 20 64 0e JSR $0e64 ; (negtmp + 0)
0f0f : 20 72 0e JSR $0e72 ; (divmod + 0)
0f12 : 38 __ __ SEC
0f13 : a9 00 __ LDA #$00
0f15 : e5 25 __ SBC WORK + 2 
0f17 : 85 25 __ STA WORK + 2 
0f19 : a9 00 __ LDA #$00
0f1b : e5 26 __ SBC WORK + 3 
0f1d : 85 26 __ STA WORK + 3 
0f1f : 60 __ __ RTS
