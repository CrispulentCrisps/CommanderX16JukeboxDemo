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
080e : 8e 23 1c STX $1c23 ; (spentry + 0)
0811 : a9 54 __ LDA #$54
0813 : 85 39 __ STA IP + 0 
0815 : a9 5f __ LDA #$5f
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 5f __ LDA #$5f
081c : e9 5f __ SBC #$5f
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
0830 : a9 54 __ LDA #$54
0832 : e9 54 __ SBC #$54
0834 : f0 08 __ BEQ $083e ; (startup + 61)
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 39 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839 ; (startup + 56)
083e : a9 a9 __ LDA #$a9
0840 : 85 43 __ STA SP + 0 
0842 : a9 9e __ LDA #$9e
0844 : 85 44 __ STA SP + 1 
0846 : 20 80 08 JSR $0880 ; (main.s1000 + 0)
0849 : a9 4c __ LDA #$4c
084b : 85 54 __ STA $54 
084d : a9 00 __ LDA #$00
084f : 85 13 __ STA $13 
0851 : a9 19 __ LDA #$19
0853 : 85 16 __ STA $16 
0855 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1c23 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s1000:
0880 : a5 67 __ LDA T2 + 0 
0882 : 8d ab 9e STA $9eab ; (main@stack + 0)
0885 : a5 68 __ LDA T2 + 1 
0887 : 8d ac 9e STA $9eac ; (main@stack + 1)
088a : 38 __ __ SEC
088b : a5 43 __ LDA SP + 0 
088d : e9 06 __ SBC #$06
088f : 85 43 __ STA SP + 0 
0891 : b0 02 __ BCS $0895 ; (main.s0 + 0)
0893 : c6 44 __ DEC SP + 1 
.s0:
0895 : a9 00 __ LDA #$00
0897 : 85 67 __ STA T2 + 0 
.l2:
0899 : 85 68 __ STA T2 + 1 
089b : a9 00 __ LDA #$00
089d : 85 2d __ STA P0 
089f : 20 d8 08 JSR $08d8 ; (Control.s0 + 0)
08a2 : a5 3b __ LDA ACCU + 0 
08a4 : f0 24 __ BEQ $08ca ; (main.s17 + 0)
.s4:
08a6 : a5 67 __ LDA T2 + 0 
08a8 : a0 04 __ LDY #$04
08aa : 91 43 __ STA (SP + 0),y 
08ac : a5 68 __ LDA T2 + 1 
08ae : c8 __ __ INY
08af : 91 43 __ STA (SP + 0),y 
08b1 : a9 6b __ LDA #$6b
08b3 : a0 02 __ LDY #$02
08b5 : 91 43 __ STA (SP + 0),y 
08b7 : a9 16 __ LDA #$16
08b9 : c8 __ __ INY
08ba : 91 43 __ STA (SP + 0),y 
08bc : 20 27 09 JSR $0927 ; (printf.s0 + 0)
08bf : a9 41 __ LDA #$41
08c1 : 85 2f __ STA P2 
08c3 : a9 1c __ LDA #$1c
08c5 : 85 30 __ STA P3 
08c7 : 20 6e 16 JSR $166e ; (interpret.s0 + 0)
.s17:
08ca : 18 __ __ CLC
08cb : a5 67 __ LDA T2 + 0 
08cd : 69 01 __ ADC #$01
08cf : 85 67 __ STA T2 + 0 
08d1 : a5 68 __ LDA T2 + 1 
08d3 : 69 00 __ ADC #$00
08d5 : 4c 99 08 JMP $0899 ; (main.l2 + 0)
--------------------------------------------------------------------
Control:
.s0:
08d8 : 20 f2 08 JSR $08f2 ; (getch.s0 + 0)
08db : a5 3c __ LDA ACCU + 1 
08dd : d0 06 __ BNE $08e5 ; (Control.s3 + 0)
.s1005:
08df : a5 3b __ LDA ACCU + 0 
08e1 : c9 20 __ CMP #$20
08e3 : f0 05 __ BEQ $08ea ; (Control.s1 + 0)
.s3:
08e5 : a5 2d __ LDA P0 
08e7 : 4c ef 08 JMP $08ef ; (Control.s1001 + 0)
.s1:
08ea : a9 00 __ LDA #$00
08ec : c5 2d __ CMP P0 
08ee : 2a __ __ ROL
.s1001:
08ef : 85 3b __ STA ACCU + 0 
08f1 : 60 __ __ RTS
--------------------------------------------------------------------
getch:
.s0:
08f2 : 20 00 09 JSR $0900 ; (getpch + 0)
08f5 : c9 00 __ CMP #$00
08f7 : f0 f9 __ BEQ $08f2 ; (getch.s0 + 0)
08f9 : 85 3b __ STA ACCU + 0 
08fb : a9 00 __ LDA #$00
08fd : 85 3c __ STA ACCU + 1 
.s1001:
08ff : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0900 : 20 e4 ff JSR $ffe4 
0903 : ae 24 1c LDX $1c24 ; (giocharmap + 0)
0906 : e0 01 __ CPX #$01
0908 : 90 1c __ BCC $0926 ; (getpch + 38)
090a : c9 0d __ CMP #$0d
090c : d0 02 __ BNE $0910 ; (getpch + 16)
090e : a9 0a __ LDA #$0a
0910 : e0 02 __ CPX #$02
0912 : 90 12 __ BCC $0926 ; (getpch + 38)
0914 : c9 41 __ CMP #$41
0916 : 90 0e __ BCC $0926 ; (getpch + 38)
0918 : c9 7b __ CMP #$7b
091a : b0 0a __ BCS $0926 ; (getpch + 38)
091c : c9 61 __ CMP #$61
091e : b0 04 __ BCS $0924 ; (getpch + 36)
0920 : c9 5b __ CMP #$5b
0922 : b0 02 __ BCS $0926 ; (getpch + 38)
0924 : 49 20 __ EOR #$20
0926 : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
1c24 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
printf:
.s0:
0927 : a9 01 __ LDA #$01
0929 : 8d ff 9e STA $9eff ; (sstack + 7)
092c : a9 ae __ LDA #$ae
092e : 8d f9 9e STA $9ef9 ; (sstack + 1)
0931 : a9 9e __ LDA #$9e
0933 : 8d fa 9e STA $9efa ; (sstack + 2)
0936 : a0 02 __ LDY #$02
0938 : b1 43 __ LDA (SP + 0),y 
093a : 8d fb 9e STA $9efb ; (sstack + 3)
093d : c8 __ __ INY
093e : b1 43 __ LDA (SP + 0),y 
0940 : 8d fc 9e STA $9efc ; (sstack + 4)
0943 : 18 __ __ CLC
0944 : a5 43 __ LDA SP + 0 
0946 : 69 04 __ ADC #$04
0948 : 8d fd 9e STA $9efd ; (sstack + 5)
094b : a5 44 __ LDA SP + 1 
094d : 69 00 __ ADC #$00
094f : 8d fe 9e STA $9efe ; (sstack + 6)
0952 : 4c 55 09 JMP $0955 ; (sformat.s0 + 0)
--------------------------------------------------------------------
sformat:
.s0:
0955 : ad f9 9e LDA $9ef9 ; (sstack + 1)
0958 : 85 5b __ STA T0 + 0 
095a : ad fa 9e LDA $9efa ; (sstack + 2)
095d : 85 5c __ STA T0 + 1 
095f : a9 00 __ LDA #$00
0961 : 85 5d __ STA T1 + 0 
0963 : ad fb 9e LDA $9efb ; (sstack + 3)
0966 : 85 5f __ STA T2 + 0 
0968 : ad fc 9e LDA $9efc ; (sstack + 4)
096b : 85 60 __ STA T2 + 1 
096d : a0 00 __ LDY #$00
096f : b1 5f __ LDA (T2 + 0),y 
0971 : d0 03 __ BNE $0976 ; (sformat.s126 + 0)
0973 : 4c 5d 0d JMP $0d5d ; (sformat.s3 + 0)
.s126:
0976 : aa __ __ TAX
0977 : e6 5f __ INC T2 + 0 
0979 : d0 02 __ BNE $097d ; (sformat.s1074 + 0)
.s1073:
097b : e6 60 __ INC T2 + 1 
.s1074:
097d : 8a __ __ TXA
097e : e0 25 __ CPX #$25
0980 : f0 4b __ BEQ $09cd ; (sformat.l4 + 0)
.s5:
0982 : a4 5d __ LDY T1 + 0 
0984 : 91 5b __ STA (T0 + 0),y 
0986 : c8 __ __ INY
0987 : 84 5d __ STY T1 + 0 
0989 : 98 __ __ TYA
098a : c0 28 __ CPY #$28
098c : 90 2a __ BCC $09b8 ; (sformat.l227 + 0)
.s106:
098e : 85 62 __ STA T5 + 0 
0990 : a9 00 __ LDA #$00
0992 : 85 5d __ STA T1 + 0 
0994 : ad ff 9e LDA $9eff ; (sstack + 7)
0997 : f0 14 __ BEQ $09ad ; (sformat.s110 + 0)
.s109:
0999 : a5 5b __ LDA T0 + 0 
099b : 85 2d __ STA P0 
099d : a5 5c __ LDA T0 + 1 
099f : 85 2e __ STA P1 
09a1 : a9 00 __ LDA #$00
09a3 : a4 62 __ LDY T5 + 0 
09a5 : 91 2d __ STA (P0),y 
09a7 : 20 e8 0d JSR $0de8 ; (puts.s0 + 0)
09aa : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s110:
09ad : 18 __ __ CLC
09ae : a5 5b __ LDA T0 + 0 
09b0 : 65 62 __ ADC T5 + 0 
09b2 : 85 5b __ STA T0 + 0 
09b4 : 90 02 __ BCC $09b8 ; (sformat.l227 + 0)
.s1081:
09b6 : e6 5c __ INC T0 + 1 
.l227:
09b8 : a0 00 __ LDY #$00
09ba : b1 5f __ LDA (T2 + 0),y 
09bc : aa __ __ TAX
09bd : e6 5f __ INC T2 + 0 
09bf : d0 02 __ BNE $09c3 ; (sformat.s1080 + 0)
.s1079:
09c1 : e6 60 __ INC T2 + 1 
.s1080:
09c3 : 8a __ __ TXA
09c4 : d0 03 __ BNE $09c9 ; (sformat.s2 + 0)
09c6 : 4c 5d 0d JMP $0d5d ; (sformat.s3 + 0)
.s2:
09c9 : c9 25 __ CMP #$25
09cb : d0 b5 __ BNE $0982 ; (sformat.s5 + 0)
.l4:
09cd : a5 5d __ LDA T1 + 0 
09cf : f0 2a __ BEQ $09fb ; (sformat.s9 + 0)
.s7:
09d1 : 85 62 __ STA T5 + 0 
09d3 : a9 00 __ LDA #$00
09d5 : 85 5d __ STA T1 + 0 
09d7 : ad ff 9e LDA $9eff ; (sstack + 7)
09da : f0 14 __ BEQ $09f0 ; (sformat.s11 + 0)
.s10:
09dc : a5 5b __ LDA T0 + 0 
09de : 85 2d __ STA P0 
09e0 : a5 5c __ LDA T0 + 1 
09e2 : 85 2e __ STA P1 
09e4 : a9 00 __ LDA #$00
09e6 : a4 62 __ LDY T5 + 0 
09e8 : 91 2d __ STA (P0),y 
09ea : 20 e8 0d JSR $0de8 ; (puts.s0 + 0)
09ed : 4c fb 09 JMP $09fb ; (sformat.s9 + 0)
.s11:
09f0 : 18 __ __ CLC
09f1 : a5 5b __ LDA T0 + 0 
09f3 : 65 62 __ ADC T5 + 0 
09f5 : 85 5b __ STA T0 + 0 
09f7 : 90 02 __ BCC $09fb ; (sformat.s9 + 0)
.s1099:
09f9 : e6 5c __ INC T0 + 1 
.s9:
09fb : a0 00 __ LDY #$00
09fd : 8c e1 9e STY $9ee1 ; (si + 1)
0a00 : 8c e4 9e STY $9ee4 ; (si + 4)
0a03 : 8c e5 9e STY $9ee5 ; (si + 5)
0a06 : 8c e6 9e STY $9ee6 ; (si + 6)
0a09 : 8c e7 9e STY $9ee7 ; (si + 7)
0a0c : b1 5f __ LDA (T2 + 0),y 
0a0e : aa __ __ TAX
0a0f : a9 20 __ LDA #$20
0a11 : 8d e0 9e STA $9ee0 ; (si + 0)
0a14 : a9 ff __ LDA #$ff
0a16 : 8d e2 9e STA $9ee2 ; (si + 2)
0a19 : a9 0a __ LDA #$0a
0a1b : 8d e3 9e STA $9ee3 ; (si + 3)
.l14:
0a1e : e6 5f __ INC T2 + 0 
0a20 : d0 02 __ BNE $0a24 ; (sformat.s1076 + 0)
.s1075:
0a22 : e6 60 __ INC T2 + 1 
.s1076:
0a24 : 8a __ __ TXA
0a25 : e0 2b __ CPX #$2b
0a27 : d0 08 __ BNE $0a31 ; (sformat.s17 + 0)
.s16:
0a29 : a9 01 __ LDA #$01
0a2b : 8d e5 9e STA $9ee5 ; (si + 5)
0a2e : 4c e0 0d JMP $0de0 ; (sformat.s230 + 0)
.s17:
0a31 : c9 30 __ CMP #$30
0a33 : d0 06 __ BNE $0a3b ; (sformat.s20 + 0)
.s19:
0a35 : 8d e0 9e STA $9ee0 ; (si + 0)
0a38 : 4c e0 0d JMP $0de0 ; (sformat.s230 + 0)
.s20:
0a3b : c9 23 __ CMP #$23
0a3d : d0 08 __ BNE $0a47 ; (sformat.s23 + 0)
.s22:
0a3f : a9 01 __ LDA #$01
0a41 : 8d e7 9e STA $9ee7 ; (si + 7)
0a44 : 4c e0 0d JMP $0de0 ; (sformat.s230 + 0)
.s23:
0a47 : c9 2d __ CMP #$2d
0a49 : d0 08 __ BNE $0a53 ; (sformat.s15 + 0)
.s25:
0a4b : a9 01 __ LDA #$01
0a4d : 8d e6 9e STA $9ee6 ; (si + 6)
0a50 : 4c e0 0d JMP $0de0 ; (sformat.s230 + 0)
.s15:
0a53 : 86 62 __ STX T5 + 0 
0a55 : c9 30 __ CMP #$30
0a57 : 90 53 __ BCC $0aac ; (sformat.s31 + 0)
.s32:
0a59 : a9 39 __ LDA #$39
0a5b : c5 62 __ CMP T5 + 0 
0a5d : 90 4d __ BCC $0aac ; (sformat.s31 + 0)
.s29:
0a5f : a9 00 __ LDA #$00
0a61 : 85 64 __ STA T6 + 0 
0a63 : 85 65 __ STA T6 + 1 
.l36:
0a65 : a9 39 __ LDA #$39
0a67 : c5 62 __ CMP T5 + 0 
0a69 : 90 3c __ BCC $0aa7 ; (sformat.s35 + 0)
.s34:
0a6b : a5 64 __ LDA T6 + 0 
0a6d : 0a __ __ ASL
0a6e : 85 3b __ STA ACCU + 0 
0a70 : a5 65 __ LDA T6 + 1 
0a72 : 2a __ __ ROL
0a73 : 06 3b __ ASL ACCU + 0 
0a75 : 2a __ __ ROL
0a76 : aa __ __ TAX
0a77 : 18 __ __ CLC
0a78 : a5 3b __ LDA ACCU + 0 
0a7a : 65 64 __ ADC T6 + 0 
0a7c : 85 64 __ STA T6 + 0 
0a7e : 8a __ __ TXA
0a7f : 65 65 __ ADC T6 + 1 
0a81 : 06 64 __ ASL T6 + 0 
0a83 : 2a __ __ ROL
0a84 : aa __ __ TAX
0a85 : 18 __ __ CLC
0a86 : a5 64 __ LDA T6 + 0 
0a88 : 65 62 __ ADC T5 + 0 
0a8a : 90 01 __ BCC $0a8d ; (sformat.s1096 + 0)
.s1095:
0a8c : e8 __ __ INX
.s1096:
0a8d : 38 __ __ SEC
0a8e : e9 30 __ SBC #$30
0a90 : 85 64 __ STA T6 + 0 
0a92 : 8a __ __ TXA
0a93 : e9 00 __ SBC #$00
0a95 : 85 65 __ STA T6 + 1 
0a97 : a0 00 __ LDY #$00
0a99 : b1 5f __ LDA (T2 + 0),y 
0a9b : 85 62 __ STA T5 + 0 
0a9d : e6 5f __ INC T2 + 0 
0a9f : d0 02 __ BNE $0aa3 ; (sformat.s1098 + 0)
.s1097:
0aa1 : e6 60 __ INC T2 + 1 
.s1098:
0aa3 : c9 30 __ CMP #$30
0aa5 : b0 be __ BCS $0a65 ; (sformat.l36 + 0)
.s35:
0aa7 : a5 64 __ LDA T6 + 0 
0aa9 : 8d e1 9e STA $9ee1 ; (si + 1)
.s31:
0aac : a5 62 __ LDA T5 + 0 
0aae : c9 2e __ CMP #$2e
0ab0 : d0 5e __ BNE $0b10 ; (sformat.s39 + 0)
.s37:
0ab2 : a9 00 __ LDA #$00
0ab4 : 85 64 __ STA T6 + 0 
0ab6 : 85 65 __ STA T6 + 1 
0ab8 : a8 __ __ TAY
0ab9 : b1 5f __ LDA (T2 + 0),y 
0abb : 85 62 __ STA T5 + 0 
0abd : e6 5f __ INC T2 + 0 
0abf : d0 02 __ BNE $0ac3 ; (sformat.l1078 + 0)
.s1093:
0ac1 : e6 60 __ INC T2 + 1 
.l1078:
0ac3 : c9 30 __ CMP #$30
0ac5 : 90 06 __ BCC $0acd ; (sformat.s42 + 0)
.s43:
0ac7 : a9 39 __ LDA #$39
0ac9 : c5 62 __ CMP T5 + 0 
0acb : b0 0a __ BCS $0ad7 ; (sformat.s41 + 0)
.s42:
0acd : a5 64 __ LDA T6 + 0 
0acf : 8d e2 9e STA $9ee2 ; (si + 2)
0ad2 : a5 62 __ LDA T5 + 0 
0ad4 : 4c 10 0b JMP $0b10 ; (sformat.s39 + 0)
.s41:
0ad7 : a5 64 __ LDA T6 + 0 
0ad9 : 0a __ __ ASL
0ada : 85 3b __ STA ACCU + 0 
0adc : a5 65 __ LDA T6 + 1 
0ade : 2a __ __ ROL
0adf : 06 3b __ ASL ACCU + 0 
0ae1 : 2a __ __ ROL
0ae2 : aa __ __ TAX
0ae3 : 18 __ __ CLC
0ae4 : a5 3b __ LDA ACCU + 0 
0ae6 : 65 64 __ ADC T6 + 0 
0ae8 : 85 64 __ STA T6 + 0 
0aea : 8a __ __ TXA
0aeb : 65 65 __ ADC T6 + 1 
0aed : 06 64 __ ASL T6 + 0 
0aef : 2a __ __ ROL
0af0 : aa __ __ TAX
0af1 : 18 __ __ CLC
0af2 : a5 64 __ LDA T6 + 0 
0af4 : 65 62 __ ADC T5 + 0 
0af6 : 90 01 __ BCC $0af9 ; (sformat.s1092 + 0)
.s1091:
0af8 : e8 __ __ INX
.s1092:
0af9 : 38 __ __ SEC
0afa : e9 30 __ SBC #$30
0afc : 85 64 __ STA T6 + 0 
0afe : 8a __ __ TXA
0aff : e9 00 __ SBC #$00
0b01 : 85 65 __ STA T6 + 1 
0b03 : a0 00 __ LDY #$00
0b05 : b1 5f __ LDA (T2 + 0),y 
0b07 : 85 62 __ STA T5 + 0 
0b09 : e6 5f __ INC T2 + 0 
0b0b : d0 b6 __ BNE $0ac3 ; (sformat.l1078 + 0)
0b0d : 4c c1 0a JMP $0ac1 ; (sformat.s1093 + 0)
.s39:
0b10 : c9 64 __ CMP #$64
0b12 : d0 05 __ BNE $0b19 ; (sformat.s45 + 0)
.s44:
0b14 : a9 01 __ LDA #$01
0b16 : 4c db 0d JMP $0ddb ; (sformat.s1059 + 0)
.s45:
0b19 : c9 75 __ CMP #$75
0b1b : d0 05 __ BNE $0b22 ; (sformat.s48 + 0)
.s47:
0b1d : a9 00 __ LDA #$00
0b1f : 4c db 0d JMP $0ddb ; (sformat.s1059 + 0)
.s48:
0b22 : c9 78 __ CMP #$78
0b24 : d0 11 __ BNE $0b37 ; (sformat.s51 + 0)
.s50:
0b26 : a9 00 __ LDA #$00
0b28 : 85 33 __ STA P6 
0b2a : a9 10 __ LDA #$10
0b2c : 8d e3 9e STA $9ee3 ; (si + 3)
0b2f : a9 00 __ LDA #$00
0b31 : 8d e4 9e STA $9ee4 ; (si + 4)
0b34 : 4c a1 0d JMP $0da1 ; (sformat.s231 + 0)
.s51:
0b37 : c9 6c __ CMP #$6c
0b39 : d0 03 __ BNE $0b3e ; (sformat.s54 + 0)
0b3b : 4c c1 0c JMP $0cc1 ; (sformat.s53 + 0)
.s54:
0b3e : c9 66 __ CMP #$66
0b40 : d0 03 __ BNE $0b45 ; (sformat.s69 + 0)
0b42 : 4c 72 0c JMP $0c72 ; (sformat.s65 + 0)
.s69:
0b45 : c9 67 __ CMP #$67
0b47 : d0 03 __ BNE $0b4c ; (sformat.s68 + 0)
0b49 : 4c 72 0c JMP $0c72 ; (sformat.s65 + 0)
.s68:
0b4c : c9 65 __ CMP #$65
0b4e : d0 03 __ BNE $0b53 ; (sformat.s66 + 0)
0b50 : 4c 72 0c JMP $0c72 ; (sformat.s65 + 0)
.s66:
0b53 : c9 73 __ CMP #$73
0b55 : f0 4c __ BEQ $0ba3 ; (sformat.s70 + 0)
.s71:
0b57 : c9 63 __ CMP #$63
0b59 : f0 1f __ BEQ $0b7a ; (sformat.s100 + 0)
.s101:
0b5b : 09 00 __ ORA #$00
0b5d : d0 03 __ BNE $0b62 ; (sformat.s103 + 0)
0b5f : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s103:
0b62 : 18 __ __ CLC
0b63 : a5 5b __ LDA T0 + 0 
0b65 : 65 5d __ ADC T1 + 0 
0b67 : 85 64 __ STA T6 + 0 
0b69 : a5 5c __ LDA T0 + 1 
0b6b : 69 00 __ ADC #$00
0b6d : 85 65 __ STA T6 + 1 
0b6f : a5 62 __ LDA T5 + 0 
.s1058:
0b71 : a0 00 __ LDY #$00
0b73 : 91 64 __ STA (T6 + 0),y 
0b75 : e6 5d __ INC T1 + 0 
0b77 : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s100:
0b7a : ad fd 9e LDA $9efd ; (sstack + 5)
0b7d : 85 62 __ STA T5 + 0 
0b7f : 18 __ __ CLC
0b80 : 69 02 __ ADC #$02
0b82 : 8d fd 9e STA $9efd ; (sstack + 5)
0b85 : ad fe 9e LDA $9efe ; (sstack + 6)
0b88 : 85 63 __ STA T5 + 1 
0b8a : 69 00 __ ADC #$00
0b8c : 8d fe 9e STA $9efe ; (sstack + 6)
0b8f : 18 __ __ CLC
0b90 : a5 5b __ LDA T0 + 0 
0b92 : 65 5d __ ADC T1 + 0 
0b94 : 85 64 __ STA T6 + 0 
0b96 : a5 5c __ LDA T0 + 1 
0b98 : 69 00 __ ADC #$00
0b9a : 85 65 __ STA T6 + 1 
0b9c : a0 00 __ LDY #$00
0b9e : b1 62 __ LDA (T5 + 0),y 
0ba0 : 4c 71 0b JMP $0b71 ; (sformat.s1058 + 0)
.s70:
0ba3 : ad fd 9e LDA $9efd ; (sstack + 5)
0ba6 : 85 62 __ STA T5 + 0 
0ba8 : 18 __ __ CLC
0ba9 : 69 02 __ ADC #$02
0bab : 8d fd 9e STA $9efd ; (sstack + 5)
0bae : ad fe 9e LDA $9efe ; (sstack + 6)
0bb1 : 85 63 __ STA T5 + 1 
0bb3 : 69 00 __ ADC #$00
0bb5 : 8d fe 9e STA $9efe ; (sstack + 6)
0bb8 : a0 00 __ LDY #$00
0bba : b1 62 __ LDA (T5 + 0),y 
0bbc : aa __ __ TAX
0bbd : c8 __ __ INY
0bbe : b1 62 __ LDA (T5 + 0),y 
0bc0 : 86 62 __ STX T5 + 0 
0bc2 : 85 63 __ STA T5 + 1 
0bc4 : a9 00 __ LDA #$00
0bc6 : 85 61 __ STA T3 + 0 
0bc8 : ad e1 9e LDA $9ee1 ; (si + 1)
0bcb : f0 0c __ BEQ $0bd9 ; (sformat.s75 + 0)
.s1062:
0bcd : 88 __ __ DEY
0bce : b1 62 __ LDA (T5 + 0),y 
0bd0 : f0 05 __ BEQ $0bd7 ; (sformat.s1061 + 0)
.l77:
0bd2 : c8 __ __ INY
0bd3 : b1 62 __ LDA (T5 + 0),y 
0bd5 : d0 fb __ BNE $0bd2 ; (sformat.l77 + 0)
.s1061:
0bd7 : 84 61 __ STY T3 + 0 
.s75:
0bd9 : ad e6 9e LDA $9ee6 ; (si + 6)
0bdc : d0 19 __ BNE $0bf7 ; (sformat.s81 + 0)
.s1067:
0bde : a6 61 __ LDX T3 + 0 
0be0 : ec e1 9e CPX $9ee1 ; (si + 1)
0be3 : a4 5d __ LDY T1 + 0 
0be5 : b0 0c __ BCS $0bf3 ; (sformat.s1066 + 0)
.l83:
0be7 : ad e0 9e LDA $9ee0 ; (si + 0)
0bea : 91 5b __ STA (T0 + 0),y 
0bec : e8 __ __ INX
0bed : ec e1 9e CPX $9ee1 ; (si + 1)
0bf0 : c8 __ __ INY
0bf1 : 90 f4 __ BCC $0be7 ; (sformat.l83 + 0)
.s1066:
0bf3 : 86 61 __ STX T3 + 0 
0bf5 : 84 5d __ STY T1 + 0 
.s81:
0bf7 : ac ff 9e LDY $9eff ; (sstack + 7)
0bfa : d0 42 __ BNE $0c3e ; (sformat.s85 + 0)
.s91:
0bfc : b1 62 __ LDA (T5 + 0),y 
0bfe : f0 1c __ BEQ $0c1c ; (sformat.s214 + 0)
.s120:
0c00 : aa __ __ TAX
0c01 : e6 62 __ INC T5 + 0 
0c03 : d0 02 __ BNE $0c07 ; (sformat.s1088 + 0)
.s1087:
0c05 : e6 63 __ INC T5 + 1 
.s1088:
0c07 : 8a __ __ TXA
.l92:
0c08 : a4 5d __ LDY T1 + 0 
0c0a : 91 5b __ STA (T0 + 0),y 
0c0c : e6 5d __ INC T1 + 0 
0c0e : a0 00 __ LDY #$00
0c10 : b1 62 __ LDA (T5 + 0),y 
0c12 : a8 __ __ TAY
0c13 : e6 62 __ INC T5 + 0 
0c15 : d0 02 __ BNE $0c19 ; (sformat.s1090 + 0)
.s1089:
0c17 : e6 63 __ INC T5 + 1 
.s1090:
0c19 : 98 __ __ TYA
0c1a : d0 ec __ BNE $0c08 ; (sformat.l92 + 0)
.s214:
0c1c : ad e6 9e LDA $9ee6 ; (si + 6)
0c1f : d0 03 __ BNE $0c24 ; (sformat.s1064 + 0)
0c21 : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s1064:
0c24 : a6 61 __ LDX T3 + 0 
0c26 : ec e1 9e CPX $9ee1 ; (si + 1)
0c29 : a4 5d __ LDY T1 + 0 
0c2b : b0 0c __ BCS $0c39 ; (sformat.s1063 + 0)
.l98:
0c2d : ad e0 9e LDA $9ee0 ; (si + 0)
0c30 : 91 5b __ STA (T0 + 0),y 
0c32 : e8 __ __ INX
0c33 : ec e1 9e CPX $9ee1 ; (si + 1)
0c36 : c8 __ __ INY
0c37 : 90 f4 __ BCC $0c2d ; (sformat.l98 + 0)
.s1063:
0c39 : 84 5d __ STY T1 + 0 
0c3b : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s85:
0c3e : a5 5d __ LDA T1 + 0 
0c40 : f0 22 __ BEQ $0c64 ; (sformat.s90 + 0)
.s88:
0c42 : a5 5b __ LDA T0 + 0 
0c44 : 85 2d __ STA P0 
0c46 : a5 5c __ LDA T0 + 1 
0c48 : 85 2e __ STA P1 
0c4a : a9 00 __ LDA #$00
0c4c : a4 5d __ LDY T1 + 0 
0c4e : 91 2d __ STA (P0),y 
0c50 : 20 e8 0d JSR $0de8 ; (puts.s0 + 0)
0c53 : a5 62 __ LDA T5 + 0 
0c55 : 85 2d __ STA P0 
0c57 : a5 63 __ LDA T5 + 1 
0c59 : 85 2e __ STA P1 
0c5b : 20 e8 0d JSR $0de8 ; (puts.s0 + 0)
0c5e : a9 00 __ LDA #$00
0c60 : 85 5d __ STA T1 + 0 
0c62 : f0 b8 __ BEQ $0c1c ; (sformat.s214 + 0)
.s90:
0c64 : a5 62 __ LDA T5 + 0 
0c66 : 85 2d __ STA P0 
0c68 : a5 63 __ LDA T5 + 1 
0c6a : 85 2e __ STA P1 
0c6c : 20 e8 0d JSR $0de8 ; (puts.s0 + 0)
0c6f : 4c 1c 0c JMP $0c1c ; (sformat.s214 + 0)
.s65:
0c72 : a5 5b __ LDA T0 + 0 
0c74 : 85 33 __ STA P6 
0c76 : a5 5c __ LDA T0 + 1 
0c78 : 85 34 __ STA P7 
0c7a : a5 62 __ LDA T5 + 0 
0c7c : 8d f8 9e STA $9ef8 ; (sstack + 0)
0c7f : ad fd 9e LDA $9efd ; (sstack + 5)
0c82 : 85 5d __ STA T1 + 0 
0c84 : ad fe 9e LDA $9efe ; (sstack + 6)
0c87 : 85 5e __ STA T1 + 1 
0c89 : a0 00 __ LDY #$00
0c8b : b1 5d __ LDA (T1 + 0),y 
0c8d : 85 35 __ STA P8 
0c8f : c8 __ __ INY
0c90 : b1 5d __ LDA (T1 + 0),y 
0c92 : 85 36 __ STA P9 
0c94 : c8 __ __ INY
0c95 : b1 5d __ LDA (T1 + 0),y 
0c97 : 85 37 __ STA P10 
0c99 : c8 __ __ INY
0c9a : b1 5d __ LDA (T1 + 0),y 
0c9c : 85 38 __ STA P11 
0c9e : a9 e0 __ LDA #$e0
0ca0 : 85 31 __ STA P4 
0ca2 : a9 9e __ LDA #$9e
0ca4 : 85 32 __ STA P5 
0ca6 : 20 52 11 JSR $1152 ; (nformf.s0 + 0)
0ca9 : a5 3b __ LDA ACCU + 0 
0cab : 85 5d __ STA T1 + 0 
0cad : ad fd 9e LDA $9efd ; (sstack + 5)
0cb0 : 18 __ __ CLC
0cb1 : 69 04 __ ADC #$04
0cb3 : 8d fd 9e STA $9efd ; (sstack + 5)
0cb6 : b0 03 __ BCS $0cbb ; (sformat.s1085 + 0)
0cb8 : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s1085:
0cbb : ee fe 9e INC $9efe ; (sstack + 6)
0cbe : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s53:
0cc1 : ad fd 9e LDA $9efd ; (sstack + 5)
0cc4 : 85 62 __ STA T5 + 0 
0cc6 : 18 __ __ CLC
0cc7 : 69 04 __ ADC #$04
0cc9 : 8d fd 9e STA $9efd ; (sstack + 5)
0ccc : ad fe 9e LDA $9efe ; (sstack + 6)
0ccf : 85 63 __ STA T5 + 1 
0cd1 : 69 00 __ ADC #$00
0cd3 : 8d fe 9e STA $9efe ; (sstack + 6)
0cd6 : a5 5f __ LDA T2 + 0 
0cd8 : 85 64 __ STA T6 + 0 
0cda : a5 60 __ LDA T2 + 1 
0cdc : 85 65 __ STA T6 + 1 
0cde : a0 00 __ LDY #$00
0ce0 : b1 62 __ LDA (T5 + 0),y 
0ce2 : 85 48 __ STA T7 + 0 
0ce4 : c8 __ __ INY
0ce5 : b1 62 __ LDA (T5 + 0),y 
0ce7 : 85 49 __ STA T7 + 1 
0ce9 : c8 __ __ INY
0cea : b1 62 __ LDA (T5 + 0),y 
0cec : 85 4a __ STA T7 + 2 
0cee : c8 __ __ INY
0cef : b1 62 __ LDA (T5 + 0),y 
0cf1 : 85 4b __ STA T7 + 3 
0cf3 : a0 00 __ LDY #$00
0cf5 : b1 5f __ LDA (T2 + 0),y 
0cf7 : c9 64 __ CMP #$64
0cf9 : d0 05 __ BNE $0d00 ; (sformat.s57 + 0)
.s56:
0cfb : a9 01 __ LDA #$01
0cfd : 4c 8b 0d JMP $0d8b ; (sformat.s229 + 0)
.s57:
0d00 : c9 75 __ CMP #$75
0d02 : d0 04 __ BNE $0d08 ; (sformat.s60 + 0)
.s59:
0d04 : 98 __ __ TYA
0d05 : 4c 8b 0d JMP $0d8b ; (sformat.s229 + 0)
.s60:
0d08 : aa __ __ TAX
0d09 : e6 5f __ INC T2 + 0 
0d0b : d0 02 __ BNE $0d0f ; (sformat.s1084 + 0)
.s1083:
0d0d : e6 60 __ INC T2 + 1 
.s1084:
0d0f : e0 78 __ CPX #$78
0d11 : f0 03 __ BEQ $0d16 ; (sformat.s62 + 0)
0d13 : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s62:
0d16 : 84 35 __ STY P8 
0d18 : 8c e4 9e STY $9ee4 ; (si + 4)
0d1b : a9 10 __ LDA #$10
0d1d : 8d e3 9e STA $9ee3 ; (si + 3)
0d20 : a9 e0 __ LDA #$e0
0d22 : 85 2d __ STA P0 
0d24 : a9 9e __ LDA #$9e
0d26 : 85 2e __ STA P1 
0d28 : 18 __ __ CLC
0d29 : a5 64 __ LDA T6 + 0 
0d2b : 69 02 __ ADC #$02
0d2d : 85 5f __ STA T2 + 0 
0d2f : a5 65 __ LDA T6 + 1 
.s228:
0d31 : 69 00 __ ADC #$00
0d33 : 85 60 __ STA T2 + 1 
0d35 : a5 5b __ LDA T0 + 0 
0d37 : 85 2f __ STA P2 
0d39 : a5 5c __ LDA T0 + 1 
0d3b : 85 30 __ STA P3 
0d3d : a5 48 __ LDA T7 + 0 
0d3f : 85 31 __ STA P4 
0d41 : a5 49 __ LDA T7 + 1 
0d43 : 85 32 __ STA P5 
0d45 : a5 4a __ LDA T7 + 2 
0d47 : 85 33 __ STA P6 
0d49 : a5 4b __ LDA T7 + 3 
0d4b : 85 34 __ STA P7 
0d4d : 20 a4 0f JSR $0fa4 ; (nforml.s0 + 0)
0d50 : a5 3b __ LDA ACCU + 0 
0d52 : 85 5d __ STA T1 + 0 
0d54 : a0 01 __ LDY #$01
0d56 : b1 64 __ LDA (T6 + 0),y 
0d58 : f0 03 __ BEQ $0d5d ; (sformat.s3 + 0)
0d5a : 4c c9 09 JMP $09c9 ; (sformat.s2 + 0)
.s3:
0d5d : a4 5d __ LDY T1 + 0 
0d5f : 91 5b __ STA (T0 + 0),y 
0d61 : 98 __ __ TYA
0d62 : f0 1e __ BEQ $0d82 ; (sformat.s1060 + 0)
.s112:
0d64 : ad ff 9e LDA $9eff ; (sstack + 7)
0d67 : d0 0e __ BNE $0d77 ; (sformat.s115 + 0)
.s116:
0d69 : 18 __ __ CLC
0d6a : a5 5b __ LDA T0 + 0 
0d6c : 65 5d __ ADC T1 + 0 
0d6e : 85 3b __ STA ACCU + 0 
0d70 : a5 5c __ LDA T0 + 1 
0d72 : 69 00 __ ADC #$00
.s1001:
0d74 : 85 3c __ STA ACCU + 1 
0d76 : 60 __ __ RTS
.s115:
0d77 : a5 5b __ LDA T0 + 0 
0d79 : 85 2d __ STA P0 
0d7b : a5 5c __ LDA T0 + 1 
0d7d : 85 2e __ STA P1 
0d7f : 20 e8 0d JSR $0de8 ; (puts.s0 + 0)
.s1060:
0d82 : a5 5b __ LDA T0 + 0 
0d84 : 85 3b __ STA ACCU + 0 
0d86 : a5 5c __ LDA T0 + 1 
0d88 : 4c 74 0d JMP $0d74 ; (sformat.s1001 + 0)
.s229:
0d8b : 85 35 __ STA P8 
0d8d : a9 e0 __ LDA #$e0
0d8f : 85 2d __ STA P0 
0d91 : a9 9e __ LDA #$9e
0d93 : 85 2e __ STA P1 
0d95 : 18 __ __ CLC
0d96 : a5 5f __ LDA T2 + 0 
0d98 : 69 02 __ ADC #$02
0d9a : 85 5f __ STA T2 + 0 
0d9c : a5 60 __ LDA T2 + 1 
0d9e : 4c 31 0d JMP $0d31 ; (sformat.s228 + 0)
.s231:
0da1 : a5 5b __ LDA T0 + 0 
0da3 : 85 2f __ STA P2 
0da5 : a5 5c __ LDA T0 + 1 
0da7 : 85 30 __ STA P3 
0da9 : ad fd 9e LDA $9efd ; (sstack + 5)
0dac : 85 5d __ STA T1 + 0 
0dae : 18 __ __ CLC
0daf : 69 02 __ ADC #$02
0db1 : 8d fd 9e STA $9efd ; (sstack + 5)
0db4 : ad fe 9e LDA $9efe ; (sstack + 6)
0db7 : 85 5e __ STA T1 + 1 
0db9 : 69 00 __ ADC #$00
0dbb : 8d fe 9e STA $9efe ; (sstack + 6)
0dbe : a0 00 __ LDY #$00
0dc0 : b1 5d __ LDA (T1 + 0),y 
0dc2 : 85 31 __ STA P4 
0dc4 : c8 __ __ INY
0dc5 : b1 5d __ LDA (T1 + 0),y 
0dc7 : 85 32 __ STA P5 
0dc9 : a9 e0 __ LDA #$e0
0dcb : 85 2d __ STA P0 
0dcd : a9 9e __ LDA #$9e
0dcf : 85 2e __ STA P1 
0dd1 : 20 3d 0e JSR $0e3d ; (nformi.s0 + 0)
0dd4 : a5 3b __ LDA ACCU + 0 
0dd6 : 85 5d __ STA T1 + 0 
0dd8 : 4c b8 09 JMP $09b8 ; (sformat.l227 + 0)
.s1059:
0ddb : 85 33 __ STA P6 
0ddd : 4c a1 0d JMP $0da1 ; (sformat.s231 + 0)
.s230:
0de0 : a0 00 __ LDY #$00
0de2 : b1 5f __ LDA (T2 + 0),y 
0de4 : aa __ __ TAX
0de5 : 4c 1e 0a JMP $0a1e ; (sformat.l14 + 0)
--------------------------------------------------------------------
puts:
.s0:
0de8 : a0 00 __ LDY #$00
0dea : b1 2d __ LDA (P0),y 
0dec : f0 0b __ BEQ $0df9 ; (puts.s1001 + 0)
0dee : 20 fa 0d JSR $0dfa ; (putpch + 0)
0df1 : e6 2d __ INC P0 
0df3 : d0 f3 __ BNE $0de8 ; (puts.s0 + 0)
0df5 : e6 2e __ INC P1 
0df7 : d0 ef __ BNE $0de8 ; (puts.s0 + 0)
.s1001:
0df9 : 60 __ __ RTS
--------------------------------------------------------------------
putpch:
0dfa : ae 24 1c LDX $1c24 ; (giocharmap + 0)
0dfd : e0 01 __ CPX #$01
0dff : 90 26 __ BCC $0e27 ; (putpch + 45)
0e01 : c9 0a __ CMP #$0a
0e03 : d0 02 __ BNE $0e07 ; (putpch + 13)
0e05 : a9 0d __ LDA #$0d
0e07 : c9 09 __ CMP #$09
0e09 : f0 1f __ BEQ $0e2a ; (putpch + 48)
0e0b : e0 02 __ CPX #$02
0e0d : 90 18 __ BCC $0e27 ; (putpch + 45)
0e0f : c9 41 __ CMP #$41
0e11 : 90 14 __ BCC $0e27 ; (putpch + 45)
0e13 : c9 7b __ CMP #$7b
0e15 : b0 10 __ BCS $0e27 ; (putpch + 45)
0e17 : c9 61 __ CMP #$61
0e19 : b0 04 __ BCS $0e1f ; (putpch + 37)
0e1b : c9 5b __ CMP #$5b
0e1d : b0 08 __ BCS $0e27 ; (putpch + 45)
0e1f : 49 20 __ EOR #$20
0e21 : e0 03 __ CPX #$03
0e23 : f0 02 __ BEQ $0e27 ; (putpch + 45)
0e25 : 29 df __ AND #$df
0e27 : 4c d2 ff JMP $ffd2 
0e2a : 38 __ __ SEC
0e2b : 20 f0 ff JSR $fff0 
0e2e : 98 __ __ TYA
0e2f : 29 03 __ AND #$03
0e31 : 49 03 __ EOR #$03
0e33 : aa __ __ TAX
0e34 : a9 20 __ LDA #$20
0e36 : 20 d2 ff JSR $ffd2 
0e39 : ca __ __ DEX
0e3a : 10 fa __ BPL $0e36 ; (putpch + 60)
0e3c : 60 __ __ RTS
--------------------------------------------------------------------
nformi:
.s0:
0e3d : a5 31 __ LDA P4 
0e3f : 85 47 __ STA T0 + 0 
0e41 : a5 32 __ LDA P5 
0e43 : 85 48 __ STA T0 + 1 
0e45 : a9 00 __ LDA #$00
0e47 : 85 49 __ STA T1 + 0 
0e49 : a5 33 __ LDA P6 
0e4b : f0 15 __ BEQ $0e62 ; (nformi.s139 + 0)
.s4:
0e4d : a5 32 __ LDA P5 
0e4f : 10 11 __ BPL $0e62 ; (nformi.s139 + 0)
.s1:
0e51 : 38 __ __ SEC
0e52 : a9 00 __ LDA #$00
0e54 : e5 31 __ SBC P4 
0e56 : 85 47 __ STA T0 + 0 
0e58 : a9 00 __ LDA #$00
0e5a : e5 32 __ SBC P5 
0e5c : 85 48 __ STA T0 + 1 
0e5e : a9 01 __ LDA #$01
0e60 : 85 49 __ STA T1 + 0 
.s139:
0e62 : a9 10 __ LDA #$10
0e64 : 85 4a __ STA T2 + 0 
0e66 : a5 47 __ LDA T0 + 0 
0e68 : 05 48 __ ORA T0 + 1 
0e6a : f0 61 __ BEQ $0ecd ; (nformi.s7 + 0)
.s45:
0e6c : a5 2d __ LDA P0 
0e6e : 85 4b __ STA T4 + 0 
0e70 : a5 2e __ LDA P1 
0e72 : 85 4c __ STA T4 + 1 
.l6:
0e74 : a0 03 __ LDY #$03
0e76 : b1 4b __ LDA (T4 + 0),y 
0e78 : 85 4d __ STA T5 + 0 
0e7a : 85 23 __ STA WORK + 0 
0e7c : c8 __ __ INY
0e7d : b1 4b __ LDA (T4 + 0),y 
0e7f : 85 4e __ STA T5 + 1 
0e81 : 85 24 __ STA WORK + 1 
0e83 : a5 47 __ LDA T0 + 0 
0e85 : 85 3b __ STA ACCU + 0 
0e87 : a5 48 __ LDA T0 + 1 
0e89 : 85 3c __ STA ACCU + 1 
0e8b : 20 52 1a JSR $1a52 ; (divmod + 0)
0e8e : a5 26 __ LDA WORK + 3 
0e90 : 30 10 __ BMI $0ea2 ; (nformi.s9 + 0)
.s1021:
0e92 : d0 06 __ BNE $0e9a ; (nformi.s8 + 0)
.s1020:
0e94 : a5 25 __ LDA WORK + 2 
0e96 : c9 0a __ CMP #$0a
0e98 : 90 08 __ BCC $0ea2 ; (nformi.s9 + 0)
.s8:
0e9a : 18 __ __ CLC
0e9b : a5 25 __ LDA WORK + 2 
0e9d : 69 37 __ ADC #$37
0e9f : 4c a7 0e JMP $0ea7 ; (nformi.s10 + 0)
.s9:
0ea2 : 18 __ __ CLC
0ea3 : a5 25 __ LDA WORK + 2 
0ea5 : 69 30 __ ADC #$30
.s10:
0ea7 : c6 4a __ DEC T2 + 0 
0ea9 : a6 4a __ LDX T2 + 0 
0eab : 9d e8 9e STA $9ee8,x ; (buffer + 0)
0eae : a5 47 __ LDA T0 + 0 
0eb0 : 85 3b __ STA ACCU + 0 
0eb2 : a5 48 __ LDA T0 + 1 
0eb4 : 85 3c __ STA ACCU + 1 
0eb6 : a5 4d __ LDA T5 + 0 
0eb8 : 85 23 __ STA WORK + 0 
0eba : a5 4e __ LDA T5 + 1 
0ebc : 85 24 __ STA WORK + 1 
0ebe : 20 52 1a JSR $1a52 ; (divmod + 0)
0ec1 : a5 3b __ LDA ACCU + 0 
0ec3 : 85 47 __ STA T0 + 0 
0ec5 : a5 3c __ LDA ACCU + 1 
0ec7 : 85 48 __ STA T0 + 1 
0ec9 : 05 3b __ ORA ACCU + 0 
0ecb : d0 a7 __ BNE $0e74 ; (nformi.l6 + 0)
.s7:
0ecd : a5 2d __ LDA P0 
0ecf : 85 47 __ STA T0 + 0 
0ed1 : a5 2e __ LDA P1 
0ed3 : 85 48 __ STA T0 + 1 
0ed5 : a0 02 __ LDY #$02
0ed7 : b1 2d __ LDA (P0),y 
0ed9 : c9 ff __ CMP #$ff
0edb : d0 04 __ BNE $0ee1 ; (nformi.s67 + 0)
.s68:
0edd : a9 0f __ LDA #$0f
0edf : d0 05 __ BNE $0ee6 ; (nformi.s69 + 0)
.s67:
0ee1 : 38 __ __ SEC
0ee2 : a9 10 __ LDA #$10
0ee4 : f1 2d __ SBC (P0),y 
.s69:
0ee6 : c5 4a __ CMP T2 + 0 
0ee8 : b0 0e __ BCS $0ef8 ; (nformi.s13 + 0)
.s1028:
0eea : a8 __ __ TAY
0eeb : a9 30 __ LDA #$30
.l1029:
0eed : c6 4a __ DEC T2 + 0 
0eef : a6 4a __ LDX T2 + 0 
0ef1 : 9d e8 9e STA $9ee8,x ; (buffer + 0)
0ef4 : c4 4a __ CPY T2 + 0 
0ef6 : 90 f5 __ BCC $0eed ; (nformi.l1029 + 0)
.s13:
0ef8 : a0 07 __ LDY #$07
0efa : b1 2d __ LDA (P0),y 
0efc : f0 20 __ BEQ $0f1e ; (nformi.s16 + 0)
.s17:
0efe : a0 04 __ LDY #$04
0f00 : b1 2d __ LDA (P0),y 
0f02 : d0 1a __ BNE $0f1e ; (nformi.s16 + 0)
.s1013:
0f04 : 88 __ __ DEY
0f05 : b1 2d __ LDA (P0),y 
0f07 : c9 10 __ CMP #$10
0f09 : d0 13 __ BNE $0f1e ; (nformi.s16 + 0)
.s14:
0f0b : a9 58 __ LDA #$58
0f0d : a6 4a __ LDX T2 + 0 
0f0f : 9d e7 9e STA $9ee7,x ; (si + 7)
0f12 : 8a __ __ TXA
0f13 : 18 __ __ CLC
0f14 : 69 fe __ ADC #$fe
0f16 : 85 4a __ STA T2 + 0 
0f18 : aa __ __ TAX
0f19 : a9 30 __ LDA #$30
0f1b : 9d e8 9e STA $9ee8,x ; (buffer + 0)
.s16:
0f1e : a9 00 __ LDA #$00
0f20 : 85 3b __ STA ACCU + 0 
0f22 : a5 49 __ LDA T1 + 0 
0f24 : f0 06 __ BEQ $0f2c ; (nformi.s19 + 0)
.s18:
0f26 : c6 4a __ DEC T2 + 0 
0f28 : a9 2d __ LDA #$2d
0f2a : d0 0a __ BNE $0f36 ; (nformi.s1026 + 0)
.s19:
0f2c : a0 05 __ LDY #$05
0f2e : b1 2d __ LDA (P0),y 
0f30 : f0 09 __ BEQ $0f3b ; (nformi.s123 + 0)
.s21:
0f32 : c6 4a __ DEC T2 + 0 
0f34 : a9 2b __ LDA #$2b
.s1026:
0f36 : a6 4a __ LDX T2 + 0 
0f38 : 9d e8 9e STA $9ee8,x ; (buffer + 0)
.s123:
0f3b : a0 06 __ LDY #$06
0f3d : b1 2d __ LDA (P0),y 
0f3f : d0 37 __ BNE $0f78 ; (nformi.s27 + 0)
.l33:
0f41 : a0 01 __ LDY #$01
0f43 : b1 47 __ LDA (T0 + 0),y 
0f45 : 18 __ __ CLC
0f46 : 65 4a __ ADC T2 + 0 
0f48 : b0 04 __ BCS $0f4e ; (nformi.s34 + 0)
.s1006:
0f4a : c9 11 __ CMP #$11
0f4c : 90 0e __ BCC $0f5c ; (nformi.s36 + 0)
.s34:
0f4e : c6 4a __ DEC T2 + 0 
0f50 : a0 00 __ LDY #$00
0f52 : b1 47 __ LDA (T0 + 0),y 
0f54 : a6 4a __ LDX T2 + 0 
0f56 : 9d e8 9e STA $9ee8,x ; (buffer + 0)
0f59 : 4c 41 0f JMP $0f41 ; (nformi.l33 + 0)
.s36:
0f5c : a6 4a __ LDX T2 + 0 
0f5e : e0 10 __ CPX #$10
0f60 : b0 11 __ BCS $0f73 ; (nformi.s26 + 0)
.s1024:
0f62 : 88 __ __ DEY
.l1033:
0f63 : bd e8 9e LDA $9ee8,x ; (buffer + 0)
0f66 : 91 2f __ STA (P2),y 
0f68 : e6 4a __ INC T2 + 0 
0f6a : a6 4a __ LDX T2 + 0 
0f6c : e0 10 __ CPX #$10
0f6e : c8 __ __ INY
0f6f : 90 f2 __ BCC $0f63 ; (nformi.l1033 + 0)
.s1034:
0f71 : 84 3b __ STY ACCU + 0 
.s26:
0f73 : a9 00 __ LDA #$00
0f75 : 85 3c __ STA ACCU + 1 
.s1001:
0f77 : 60 __ __ RTS
.s27:
0f78 : a6 4a __ LDX T2 + 0 
0f7a : e0 10 __ CPX #$10
0f7c : b0 12 __ BCS $0f90 ; (nformi.l30 + 0)
.s1022:
0f7e : a0 00 __ LDY #$00
.l1031:
0f80 : bd e8 9e LDA $9ee8,x ; (buffer + 0)
0f83 : 91 2f __ STA (P2),y 
0f85 : e6 4a __ INC T2 + 0 
0f87 : a6 4a __ LDX T2 + 0 
0f89 : e0 10 __ CPX #$10
0f8b : c8 __ __ INY
0f8c : 90 f2 __ BCC $0f80 ; (nformi.l1031 + 0)
.s1032:
0f8e : 84 3b __ STY ACCU + 0 
.l30:
0f90 : a5 3b __ LDA ACCU + 0 
0f92 : a0 01 __ LDY #$01
0f94 : d1 47 __ CMP (T0 + 0),y 
0f96 : b0 db __ BCS $0f73 ; (nformi.s26 + 0)
.s31:
0f98 : 88 __ __ DEY
0f99 : b1 47 __ LDA (T0 + 0),y 
0f9b : a4 3b __ LDY ACCU + 0 
0f9d : 91 2f __ STA (P2),y 
0f9f : e6 3b __ INC ACCU + 0 
0fa1 : 4c 90 0f JMP $0f90 ; (nformi.l30 + 0)
--------------------------------------------------------------------
nforml:
.s0:
0fa4 : a5 31 __ LDA P4 
0fa6 : 85 47 __ STA T0 + 0 
0fa8 : a5 32 __ LDA P5 
0faa : 85 48 __ STA T0 + 1 
0fac : a5 33 __ LDA P6 
0fae : 85 49 __ STA T0 + 2 
0fb0 : a5 34 __ LDA P7 
0fb2 : 85 4a __ STA T0 + 3 
0fb4 : a9 00 __ LDA #$00
0fb6 : 85 4b __ STA T1 + 0 
0fb8 : a5 35 __ LDA P8 
0fba : f0 23 __ BEQ $0fdf ; (nforml.s139 + 0)
.s4:
0fbc : a5 34 __ LDA P7 
0fbe : f0 1f __ BEQ $0fdf ; (nforml.s139 + 0)
.s1034:
0fc0 : 10 1d __ BPL $0fdf ; (nforml.s139 + 0)
.s1:
0fc2 : 38 __ __ SEC
0fc3 : a9 00 __ LDA #$00
0fc5 : e5 31 __ SBC P4 
0fc7 : 85 47 __ STA T0 + 0 
0fc9 : a9 00 __ LDA #$00
0fcb : e5 32 __ SBC P5 
0fcd : 85 48 __ STA T0 + 1 
0fcf : a9 00 __ LDA #$00
0fd1 : e5 33 __ SBC P6 
0fd3 : 85 49 __ STA T0 + 2 
0fd5 : a9 00 __ LDA #$00
0fd7 : e5 34 __ SBC P7 
0fd9 : 85 4a __ STA T0 + 3 
0fdb : a9 01 __ LDA #$01
0fdd : 85 4b __ STA T1 + 0 
.s139:
0fdf : a9 10 __ LDA #$10
0fe1 : 85 4c __ STA T2 + 0 
0fe3 : a5 4a __ LDA T0 + 3 
0fe5 : d0 0f __ BNE $0ff6 ; (nforml.l6 + 0)
.s1026:
0fe7 : a5 49 __ LDA T0 + 2 
0fe9 : d0 0b __ BNE $0ff6 ; (nforml.l6 + 0)
.s1027:
0feb : a5 48 __ LDA T0 + 1 
0fed : d0 07 __ BNE $0ff6 ; (nforml.l6 + 0)
.s1028:
0fef : c5 47 __ CMP T0 + 0 
0ff1 : 90 03 __ BCC $0ff6 ; (nforml.l6 + 0)
0ff3 : 4c 83 10 JMP $1083 ; (nforml.s7 + 0)
.l6:
0ff6 : a0 03 __ LDY #$03
0ff8 : b1 2d __ LDA (P0),y 
0ffa : 85 23 __ STA WORK + 0 
0ffc : 85 4d __ STA T6 + 0 
0ffe : c8 __ __ INY
0fff : b1 2d __ LDA (P0),y 
1001 : 85 4e __ STA T6 + 1 
1003 : 85 24 __ STA WORK + 1 
1005 : a5 47 __ LDA T0 + 0 
1007 : 85 3b __ STA ACCU + 0 
1009 : a5 48 __ LDA T0 + 1 
100b : 85 3c __ STA ACCU + 1 
100d : a5 49 __ LDA T0 + 2 
100f : 85 3d __ STA ACCU + 2 
1011 : a5 4a __ LDA T0 + 3 
1013 : 85 3e __ STA ACCU + 3 
1015 : a9 00 __ LDA #$00
1017 : 85 25 __ STA WORK + 2 
1019 : 85 26 __ STA WORK + 3 
101b : 20 8d 1b JSR $1b8d ; (divmod32 + 0)
101e : a5 28 __ LDA WORK + 5 
1020 : 30 10 __ BMI $1032 ; (nforml.s9 + 0)
.s1025:
1022 : d0 06 __ BNE $102a ; (nforml.s8 + 0)
.s1024:
1024 : a5 27 __ LDA WORK + 4 
1026 : c9 0a __ CMP #$0a
1028 : 90 08 __ BCC $1032 ; (nforml.s9 + 0)
.s8:
102a : 18 __ __ CLC
102b : a5 27 __ LDA WORK + 4 
102d : 69 37 __ ADC #$37
102f : 4c 37 10 JMP $1037 ; (nforml.s10 + 0)
.s9:
1032 : 18 __ __ CLC
1033 : a5 27 __ LDA WORK + 4 
1035 : 69 30 __ ADC #$30
.s10:
1037 : c6 4c __ DEC T2 + 0 
1039 : a6 4c __ LDX T2 + 0 
103b : 9d e8 9e STA $9ee8,x ; (buffer + 0)
103e : a5 47 __ LDA T0 + 0 
1040 : 85 3b __ STA ACCU + 0 
1042 : a5 48 __ LDA T0 + 1 
1044 : 85 3c __ STA ACCU + 1 
1046 : a5 49 __ LDA T0 + 2 
1048 : 85 3d __ STA ACCU + 2 
104a : a5 4a __ LDA T0 + 3 
104c : 85 3e __ STA ACCU + 3 
104e : a5 4d __ LDA T6 + 0 
1050 : 85 23 __ STA WORK + 0 
1052 : a5 4e __ LDA T6 + 1 
1054 : 85 24 __ STA WORK + 1 
1056 : a9 00 __ LDA #$00
1058 : 85 25 __ STA WORK + 2 
105a : 85 26 __ STA WORK + 3 
105c : 20 8d 1b JSR $1b8d ; (divmod32 + 0)
105f : a5 3b __ LDA ACCU + 0 
1061 : 85 47 __ STA T0 + 0 
1063 : a5 3c __ LDA ACCU + 1 
1065 : 85 48 __ STA T0 + 1 
1067 : a5 3d __ LDA ACCU + 2 
1069 : 85 49 __ STA T0 + 2 
106b : a5 3e __ LDA ACCU + 3 
106d : 85 4a __ STA T0 + 3 
106f : d0 85 __ BNE $0ff6 ; (nforml.l6 + 0)
.s1020:
1071 : a5 3d __ LDA ACCU + 2 
1073 : d0 81 __ BNE $0ff6 ; (nforml.l6 + 0)
.s1021:
1075 : a5 3c __ LDA ACCU + 1 
1077 : f0 03 __ BEQ $107c ; (nforml.s1022 + 0)
1079 : 4c f6 0f JMP $0ff6 ; (nforml.l6 + 0)
.s1022:
107c : c5 3b __ CMP ACCU + 0 
107e : b0 03 __ BCS $1083 ; (nforml.s7 + 0)
1080 : 4c f6 0f JMP $0ff6 ; (nforml.l6 + 0)
.s7:
1083 : a0 02 __ LDY #$02
1085 : b1 2d __ LDA (P0),y 
1087 : c9 ff __ CMP #$ff
1089 : d0 04 __ BNE $108f ; (nforml.s67 + 0)
.s68:
108b : a9 0f __ LDA #$0f
108d : d0 05 __ BNE $1094 ; (nforml.s69 + 0)
.s67:
108f : 38 __ __ SEC
1090 : a9 10 __ LDA #$10
1092 : f1 2d __ SBC (P0),y 
.s69:
1094 : c5 4c __ CMP T2 + 0 
1096 : b0 0e __ BCS $10a6 ; (nforml.s13 + 0)
.s1041:
1098 : a8 __ __ TAY
1099 : a9 30 __ LDA #$30
.l1042:
109b : c6 4c __ DEC T2 + 0 
109d : a6 4c __ LDX T2 + 0 
109f : 9d e8 9e STA $9ee8,x ; (buffer + 0)
10a2 : c4 4c __ CPY T2 + 0 
10a4 : 90 f5 __ BCC $109b ; (nforml.l1042 + 0)
.s13:
10a6 : a0 07 __ LDY #$07
10a8 : b1 2d __ LDA (P0),y 
10aa : f0 20 __ BEQ $10cc ; (nforml.s16 + 0)
.s17:
10ac : a0 04 __ LDY #$04
10ae : b1 2d __ LDA (P0),y 
10b0 : d0 1a __ BNE $10cc ; (nforml.s16 + 0)
.s1013:
10b2 : 88 __ __ DEY
10b3 : b1 2d __ LDA (P0),y 
10b5 : c9 10 __ CMP #$10
10b7 : d0 13 __ BNE $10cc ; (nforml.s16 + 0)
.s14:
10b9 : a9 58 __ LDA #$58
10bb : a6 4c __ LDX T2 + 0 
10bd : 9d e7 9e STA $9ee7,x ; (si + 7)
10c0 : 8a __ __ TXA
10c1 : 18 __ __ CLC
10c2 : 69 fe __ ADC #$fe
10c4 : 85 4c __ STA T2 + 0 
10c6 : aa __ __ TAX
10c7 : a9 30 __ LDA #$30
10c9 : 9d e8 9e STA $9ee8,x ; (buffer + 0)
.s16:
10cc : a9 00 __ LDA #$00
10ce : 85 3b __ STA ACCU + 0 
10d0 : a5 4b __ LDA T1 + 0 
10d2 : f0 06 __ BEQ $10da ; (nforml.s19 + 0)
.s18:
10d4 : c6 4c __ DEC T2 + 0 
10d6 : a9 2d __ LDA #$2d
10d8 : d0 0a __ BNE $10e4 ; (nforml.s1039 + 0)
.s19:
10da : a0 05 __ LDY #$05
10dc : b1 2d __ LDA (P0),y 
10de : f0 09 __ BEQ $10e9 ; (nforml.s123 + 0)
.s21:
10e0 : c6 4c __ DEC T2 + 0 
10e2 : a9 2b __ LDA #$2b
.s1039:
10e4 : a6 4c __ LDX T2 + 0 
10e6 : 9d e8 9e STA $9ee8,x ; (buffer + 0)
.s123:
10e9 : a0 06 __ LDY #$06
10eb : b1 2d __ LDA (P0),y 
10ed : d0 37 __ BNE $1126 ; (nforml.s27 + 0)
.l33:
10ef : a0 01 __ LDY #$01
10f1 : b1 2d __ LDA (P0),y 
10f3 : 18 __ __ CLC
10f4 : 65 4c __ ADC T2 + 0 
10f6 : b0 04 __ BCS $10fc ; (nforml.s34 + 0)
.s1006:
10f8 : c9 11 __ CMP #$11
10fa : 90 0e __ BCC $110a ; (nforml.s36 + 0)
.s34:
10fc : c6 4c __ DEC T2 + 0 
10fe : a0 00 __ LDY #$00
1100 : b1 2d __ LDA (P0),y 
1102 : a6 4c __ LDX T2 + 0 
1104 : 9d e8 9e STA $9ee8,x ; (buffer + 0)
1107 : 4c ef 10 JMP $10ef ; (nforml.l33 + 0)
.s36:
110a : a6 4c __ LDX T2 + 0 
110c : e0 10 __ CPX #$10
110e : b0 11 __ BCS $1121 ; (nforml.s26 + 0)
.s1037:
1110 : 88 __ __ DEY
.l1046:
1111 : bd e8 9e LDA $9ee8,x ; (buffer + 0)
1114 : 91 2f __ STA (P2),y 
1116 : e6 4c __ INC T2 + 0 
1118 : a6 4c __ LDX T2 + 0 
111a : e0 10 __ CPX #$10
111c : c8 __ __ INY
111d : 90 f2 __ BCC $1111 ; (nforml.l1046 + 0)
.s1047:
111f : 84 3b __ STY ACCU + 0 
.s26:
1121 : a9 00 __ LDA #$00
1123 : 85 3c __ STA ACCU + 1 
.s1001:
1125 : 60 __ __ RTS
.s27:
1126 : a6 4c __ LDX T2 + 0 
1128 : e0 10 __ CPX #$10
112a : b0 12 __ BCS $113e ; (nforml.l30 + 0)
.s1035:
112c : a0 00 __ LDY #$00
.l1044:
112e : bd e8 9e LDA $9ee8,x ; (buffer + 0)
1131 : 91 2f __ STA (P2),y 
1133 : e6 4c __ INC T2 + 0 
1135 : a6 4c __ LDX T2 + 0 
1137 : e0 10 __ CPX #$10
1139 : c8 __ __ INY
113a : 90 f2 __ BCC $112e ; (nforml.l1044 + 0)
.s1045:
113c : 84 3b __ STY ACCU + 0 
.l30:
113e : a5 3b __ LDA ACCU + 0 
1140 : a0 01 __ LDY #$01
1142 : d1 2d __ CMP (P0),y 
1144 : b0 db __ BCS $1121 ; (nforml.s26 + 0)
.s31:
1146 : 88 __ __ DEY
1147 : b1 2d __ LDA (P0),y 
1149 : a4 3b __ LDY ACCU + 0 
114b : 91 2f __ STA (P2),y 
114d : e6 3b __ INC ACCU + 0 
114f : 4c 3e 11 JMP $113e ; (nforml.l30 + 0)
--------------------------------------------------------------------
nformf:
.s0:
1152 : a5 35 __ LDA P8 
1154 : 85 47 __ STA T1 + 0 
1156 : a5 36 __ LDA P9 
1158 : 85 48 __ STA T1 + 1 
115a : a5 37 __ LDA P10 
115c : 85 49 __ STA T1 + 2 
115e : a5 38 __ LDA P11 
1160 : 29 7f __ AND #$7f
1162 : 05 37 __ ORA P10 
1164 : 05 36 __ ORA P9 
1166 : 05 35 __ ORA P8 
1168 : f0 1b __ BEQ $1185 ; (nformf.s2 + 0)
.s1099:
116a : a5 38 __ LDA P11 
116c : 10 17 __ BPL $1185 ; (nformf.s2 + 0)
.s1:
116e : 49 80 __ EOR #$80
1170 : 85 38 __ STA P11 
1172 : 85 30 __ STA P3 
1174 : a5 35 __ LDA P8 
1176 : 85 2d __ STA P0 
1178 : a5 36 __ LDA P9 
117a : 85 2e __ STA P1 
117c : a5 37 __ LDA P10 
117e : 85 2f __ STA P2 
1180 : a9 2d __ LDA #$2d
1182 : 4c 38 16 JMP $1638 ; (nformf.s198 + 0)
.s2:
1185 : a5 35 __ LDA P8 
1187 : 85 2d __ STA P0 
1189 : a5 36 __ LDA P9 
118b : 85 2e __ STA P1 
118d : a5 37 __ LDA P10 
118f : 85 2f __ STA P2 
1191 : a5 38 __ LDA P11 
1193 : 85 30 __ STA P3 
1195 : a0 05 __ LDY #$05
1197 : b1 31 __ LDA (P4),y 
1199 : f0 03 __ BEQ $119e ; (nformf.s3 + 0)
119b : 4c 36 16 JMP $1636 ; (nformf.s4 + 0)
.s3:
119e : 85 4b __ STA T2 + 0 
11a0 : 85 4c __ STA T3 + 0 
11a2 : a9 01 __ LDA #$01
11a4 : 85 4e __ STA T4 + 0 
11a6 : a9 02 __ LDA #$02
.s168:
11a8 : 85 50 __ STA T5 + 0 
11aa : 20 4b 16 JSR $164b ; (isinf.s0 + 0)
11ad : 09 00 __ ORA #$00
11af : f0 1a __ BEQ $11cb ; (nformf.s8 + 0)
.s7:
11b1 : a9 49 __ LDA #$49
11b3 : a4 4c __ LDY T3 + 0 
11b5 : 91 33 __ STA (P6),y 
11b7 : a9 4e __ LDA #$4e
11b9 : a4 4e __ LDY T4 + 0 
11bb : 91 33 __ STA (P6),y 
11bd : a9 46 __ LDA #$46
11bf : a4 50 __ LDY T5 + 0 
11c1 : 91 33 __ STA (P6),y 
11c3 : 18 __ __ CLC
11c4 : a5 4b __ LDA T2 + 0 
11c6 : 69 03 __ ADC #$03
11c8 : 4c 17 15 JMP $1517 ; (nformf.s1108 + 0)
.s8:
11cb : a0 02 __ LDY #$02
11cd : b1 31 __ LDA (P4),y 
11cf : c9 ff __ CMP #$ff
11d1 : d0 02 __ BNE $11d5 ; (nformf.s119 + 0)
.s120:
11d3 : a9 06 __ LDA #$06
.s119:
11d5 : 85 4c __ STA T3 + 0 
11d7 : 85 52 __ STA T6 + 0 
11d9 : a9 00 __ LDA #$00
11db : 85 4e __ STA T4 + 0 
11dd : 85 4f __ STA T4 + 1 
11df : a5 38 __ LDA P11 
11e1 : 85 4a __ STA T1 + 3 
11e3 : 29 7f __ AND #$7f
11e5 : 05 37 __ ORA P10 
11e7 : 05 36 __ ORA P9 
11e9 : 05 35 __ ORA P8 
11eb : d0 03 __ BNE $11f0 ; (nformf.s13 + 0)
11ed : 4c f4 12 JMP $12f4 ; (nformf.s12 + 0)
.s13:
11f0 : a5 38 __ LDA P11 
11f2 : 30 6a __ BMI $125e ; (nformf.l17 + 0)
.s1092:
11f4 : c9 44 __ CMP #$44
11f6 : d0 06 __ BNE $11fe ; (nformf.l1096 + 0)
.s1093:
11f8 : a5 37 __ LDA P10 
11fa : c9 7a __ CMP #$7a
11fc : f0 02 __ BEQ $1200 ; (nformf.l14 + 0)
.l1096:
11fe : 90 4e __ BCC $124e ; (nformf.s16 + 0)
.l14:
1200 : 18 __ __ CLC
1201 : a5 4e __ LDA T4 + 0 
1203 : 69 03 __ ADC #$03
1205 : 85 4e __ STA T4 + 0 
1207 : 90 02 __ BCC $120b ; (nformf.s1122 + 0)
.s1121:
1209 : e6 4f __ INC T4 + 1 
.s1122:
120b : a5 47 __ LDA T1 + 0 
120d : 85 3b __ STA ACCU + 0 
120f : a5 48 __ LDA T1 + 1 
1211 : 85 3c __ STA ACCU + 1 
1213 : a5 49 __ LDA T1 + 2 
1215 : 85 3d __ STA ACCU + 2 
1217 : a5 4a __ LDA T1 + 3 
1219 : 85 3e __ STA ACCU + 3 
121b : a9 00 __ LDA #$00
121d : 85 23 __ STA WORK + 0 
121f : 85 24 __ STA WORK + 1 
1221 : a9 7a __ LDA #$7a
1223 : 85 25 __ STA WORK + 2 
1225 : a9 44 __ LDA #$44
1227 : 85 26 __ STA WORK + 3 
1229 : 20 83 17 JSR $1783 ; (freg + 20)
122c : 20 6a 19 JSR $196a ; (fdiv + 0)
122f : a5 3b __ LDA ACCU + 0 
1231 : 85 47 __ STA T1 + 0 
1233 : a5 3c __ LDA ACCU + 1 
1235 : 85 48 __ STA T1 + 1 
1237 : a5 3d __ LDA ACCU + 2 
1239 : 85 49 __ STA T1 + 2 
123b : a5 3e __ LDA ACCU + 3 
123d : 85 4a __ STA T1 + 3 
123f : 30 0d __ BMI $124e ; (nformf.s16 + 0)
.s1084:
1241 : c9 44 __ CMP #$44
1243 : d0 b9 __ BNE $11fe ; (nformf.l1096 + 0)
.s1085:
1245 : a5 3d __ LDA ACCU + 2 
1247 : c9 7a __ CMP #$7a
1249 : f0 b5 __ BEQ $1200 ; (nformf.l14 + 0)
124b : 4c fe 11 JMP $11fe ; (nformf.l1096 + 0)
.s16:
124e : a5 4a __ LDA T1 + 3 
1250 : 30 0c __ BMI $125e ; (nformf.l17 + 0)
.s1076:
1252 : c9 3f __ CMP #$3f
1254 : d0 06 __ BNE $125c ; (nformf.s1072 + 0)
.s1077:
1256 : a5 49 __ LDA T1 + 2 
1258 : c9 80 __ CMP #$80
125a : f0 3f __ BEQ $129b ; (nformf.s19 + 0)
.s1072:
125c : b0 3d __ BCS $129b ; (nformf.s19 + 0)
.l17:
125e : 38 __ __ SEC
125f : a5 4e __ LDA T4 + 0 
1261 : e9 03 __ SBC #$03
1263 : 85 4e __ STA T4 + 0 
1265 : b0 02 __ BCS $1269 ; (nformf.s1116 + 0)
.s1115:
1267 : c6 4f __ DEC T4 + 1 
.s1116:
1269 : a9 00 __ LDA #$00
126b : 85 3b __ STA ACCU + 0 
126d : 85 3c __ STA ACCU + 1 
126f : a9 7a __ LDA #$7a
1271 : 85 3d __ STA ACCU + 2 
1273 : a9 44 __ LDA #$44
1275 : 85 3e __ STA ACCU + 3 
1277 : a2 47 __ LDX #$47
1279 : 20 73 17 JSR $1773 ; (freg + 4)
127c : 20 9b 18 JSR $189b ; (fmul + 0)
127f : a5 3b __ LDA ACCU + 0 
1281 : 85 47 __ STA T1 + 0 
1283 : a5 3c __ LDA ACCU + 1 
1285 : 85 48 __ STA T1 + 1 
1287 : a5 3d __ LDA ACCU + 2 
1289 : 85 49 __ STA T1 + 2 
128b : a5 3e __ LDA ACCU + 3 
128d : 85 4a __ STA T1 + 3 
128f : 30 cd __ BMI $125e ; (nformf.l17 + 0)
.s1068:
1291 : c9 3f __ CMP #$3f
1293 : d0 c7 __ BNE $125c ; (nformf.s1072 + 0)
.s1069:
1295 : a5 3d __ LDA ACCU + 2 
1297 : c9 80 __ CMP #$80
1299 : d0 c1 __ BNE $125c ; (nformf.s1072 + 0)
.s19:
129b : a5 4a __ LDA T1 + 3 
129d : 30 55 __ BMI $12f4 ; (nformf.s12 + 0)
.s1060:
129f : c9 41 __ CMP #$41
12a1 : d0 06 __ BNE $12a9 ; (nformf.l1064 + 0)
.s1061:
12a3 : a5 49 __ LDA T1 + 2 
12a5 : c9 20 __ CMP #$20
12a7 : f0 02 __ BEQ $12ab ; (nformf.l20 + 0)
.l1064:
12a9 : 90 49 __ BCC $12f4 ; (nformf.s12 + 0)
.l20:
12ab : e6 4e __ INC T4 + 0 
12ad : d0 02 __ BNE $12b1 ; (nformf.s1120 + 0)
.s1119:
12af : e6 4f __ INC T4 + 1 
.s1120:
12b1 : a5 47 __ LDA T1 + 0 
12b3 : 85 3b __ STA ACCU + 0 
12b5 : a5 48 __ LDA T1 + 1 
12b7 : 85 3c __ STA ACCU + 1 
12b9 : a5 49 __ LDA T1 + 2 
12bb : 85 3d __ STA ACCU + 2 
12bd : a5 4a __ LDA T1 + 3 
12bf : 85 3e __ STA ACCU + 3 
12c1 : a9 00 __ LDA #$00
12c3 : 85 23 __ STA WORK + 0 
12c5 : 85 24 __ STA WORK + 1 
12c7 : a9 20 __ LDA #$20
12c9 : 85 25 __ STA WORK + 2 
12cb : a9 41 __ LDA #$41
12cd : 85 26 __ STA WORK + 3 
12cf : 20 83 17 JSR $1783 ; (freg + 20)
12d2 : 20 6a 19 JSR $196a ; (fdiv + 0)
12d5 : a5 3b __ LDA ACCU + 0 
12d7 : 85 47 __ STA T1 + 0 
12d9 : a5 3c __ LDA ACCU + 1 
12db : 85 48 __ STA T1 + 1 
12dd : a5 3d __ LDA ACCU + 2 
12df : 85 49 __ STA T1 + 2 
12e1 : a5 3e __ LDA ACCU + 3 
12e3 : 85 4a __ STA T1 + 3 
12e5 : 30 0d __ BMI $12f4 ; (nformf.s12 + 0)
.s1052:
12e7 : c9 41 __ CMP #$41
12e9 : d0 be __ BNE $12a9 ; (nformf.l1064 + 0)
.s1053:
12eb : a5 3d __ LDA ACCU + 2 
12ed : c9 20 __ CMP #$20
12ef : f0 ba __ BEQ $12ab ; (nformf.l20 + 0)
12f1 : 4c a9 12 JMP $12a9 ; (nformf.l1064 + 0)
.s12:
12f4 : ad f8 9e LDA $9ef8 ; (sstack + 0)
12f7 : c9 65 __ CMP #$65
12f9 : d0 04 __ BNE $12ff ; (nformf.s1003 + 0)
.s1002:
12fb : a9 01 __ LDA #$01
12fd : d0 02 __ BNE $1301 ; (nformf.s1004 + 0)
.s1003:
12ff : a9 00 __ LDA #$00
.s1004:
1301 : 85 55 __ STA T9 + 0 
1303 : a6 4c __ LDX T3 + 0 
1305 : e8 __ __ INX
1306 : 86 53 __ STX T8 + 0 
1308 : ad f8 9e LDA $9ef8 ; (sstack + 0)
130b : c9 67 __ CMP #$67
130d : d0 13 __ BNE $1322 ; (nformf.s24 + 0)
.s22:
130f : a5 4f __ LDA T4 + 1 
1311 : 30 08 __ BMI $131b ; (nformf.s25 + 0)
.s1046:
1313 : d0 06 __ BNE $131b ; (nformf.s25 + 0)
.s1045:
1315 : a9 03 __ LDA #$03
1317 : c5 4e __ CMP T4 + 0 
1319 : b0 07 __ BCS $1322 ; (nformf.s24 + 0)
.s25:
131b : a9 01 __ LDA #$01
131d : 85 55 __ STA T9 + 0 
131f : 4c 9c 15 JMP $159c ; (nformf.s30 + 0)
.s24:
1322 : a5 55 __ LDA T9 + 0 
1324 : f0 03 __ BEQ $1329 ; (nformf.s32 + 0)
1326 : 4c 9c 15 JMP $159c ; (nformf.s30 + 0)
.s32:
1329 : a5 4f __ LDA T4 + 1 
132b : 10 43 __ BPL $1370 ; (nformf.s34 + 0)
.s33:
132d : a5 47 __ LDA T1 + 0 
132f : 85 3b __ STA ACCU + 0 
1331 : a5 48 __ LDA T1 + 1 
1333 : 85 3c __ STA ACCU + 1 
1335 : a5 49 __ LDA T1 + 2 
1337 : 85 3d __ STA ACCU + 2 
1339 : a5 4a __ LDA T1 + 3 
133b : 85 3e __ STA ACCU + 3 
.l1106:
133d : a9 00 __ LDA #$00
133f : 85 23 __ STA WORK + 0 
1341 : 85 24 __ STA WORK + 1 
1343 : a9 20 __ LDA #$20
1345 : 85 25 __ STA WORK + 2 
1347 : a9 41 __ LDA #$41
1349 : 85 26 __ STA WORK + 3 
134b : 20 83 17 JSR $1783 ; (freg + 20)
134e : 20 6a 19 JSR $196a ; (fdiv + 0)
1351 : 18 __ __ CLC
1352 : a5 4e __ LDA T4 + 0 
1354 : 69 01 __ ADC #$01
1356 : 85 4e __ STA T4 + 0 
1358 : a5 4f __ LDA T4 + 1 
135a : 69 00 __ ADC #$00
135c : 85 4f __ STA T4 + 1 
135e : 30 dd __ BMI $133d ; (nformf.l1106 + 0)
.s1107:
1360 : a5 3e __ LDA ACCU + 3 
1362 : 85 4a __ STA T1 + 3 
1364 : a5 3d __ LDA ACCU + 2 
1366 : 85 49 __ STA T1 + 2 
1368 : a5 3c __ LDA ACCU + 1 
136a : 85 48 __ STA T1 + 1 
136c : a5 3b __ LDA ACCU + 0 
136e : 85 47 __ STA T1 + 0 
.s34:
1370 : 18 __ __ CLC
1371 : a5 4c __ LDA T3 + 0 
1373 : 65 4e __ ADC T4 + 0 
1375 : 18 __ __ CLC
1376 : 69 01 __ ADC #$01
1378 : 85 53 __ STA T8 + 0 
137a : c9 07 __ CMP #$07
137c : 90 15 __ BCC $1393 ; (nformf.s35 + 0)
.s36:
137e : ad 3d 1c LDA $1c3d ; (fround5 + 24)
1381 : 85 56 __ STA T10 + 0 
1383 : ad 3e 1c LDA $1c3e ; (fround5 + 25)
1386 : 85 57 __ STA T10 + 1 
1388 : ad 3f 1c LDA $1c3f ; (fround5 + 26)
138b : 85 58 __ STA T10 + 2 
138d : ad 40 1c LDA $1c40 ; (fround5 + 27)
1390 : 4c a8 13 JMP $13a8 ; (nformf.s193 + 0)
.s35:
1393 : 0a __ __ ASL
1394 : 0a __ __ ASL
1395 : aa __ __ TAX
1396 : bd 21 1c LDA $1c21,x ; (divmod32 + 148)
1399 : 85 56 __ STA T10 + 0 
139b : bd 22 1c LDA $1c22,x ; (divmod32 + 149)
139e : 85 57 __ STA T10 + 1 
13a0 : bd 23 1c LDA $1c23,x ; (spentry + 0)
13a3 : 85 58 __ STA T10 + 2 
13a5 : bd 24 1c LDA $1c24,x ; (giocharmap + 0)
.s193:
13a8 : 85 59 __ STA T10 + 3 
13aa : a5 47 __ LDA T1 + 0 
13ac : 85 3b __ STA ACCU + 0 
13ae : a5 48 __ LDA T1 + 1 
13b0 : 85 3c __ STA ACCU + 1 
13b2 : a5 49 __ LDA T1 + 2 
13b4 : 85 3d __ STA ACCU + 2 
13b6 : a5 4a __ LDA T1 + 3 
13b8 : 85 3e __ STA ACCU + 3 
13ba : a2 56 __ LDX #$56
13bc : 20 73 17 JSR $1773 ; (freg + 4)
13bf : 20 b4 17 JSR $17b4 ; (faddsub + 0)
13c2 : a5 3c __ LDA ACCU + 1 
13c4 : 85 36 __ STA P9 
13c6 : a5 3d __ LDA ACCU + 2 
13c8 : 85 37 __ STA P10 
13ca : a6 3b __ LDX ACCU + 0 
13cc : a5 3e __ LDA ACCU + 3 
13ce : 85 38 __ STA P11 
13d0 : 30 35 __ BMI $1407 ; (nformf.s31 + 0)
.s1028:
13d2 : c9 41 __ CMP #$41
13d4 : d0 06 __ BNE $13dc ; (nformf.s1032 + 0)
.s1029:
13d6 : a5 37 __ LDA P10 
13d8 : c9 20 __ CMP #$20
13da : f0 02 __ BEQ $13de ; (nformf.s38 + 0)
.s1032:
13dc : 90 29 __ BCC $1407 ; (nformf.s31 + 0)
.s38:
13de : a9 00 __ LDA #$00
13e0 : 85 23 __ STA WORK + 0 
13e2 : 85 24 __ STA WORK + 1 
13e4 : a9 20 __ LDA #$20
13e6 : 85 25 __ STA WORK + 2 
13e8 : a9 41 __ LDA #$41
13ea : 85 26 __ STA WORK + 3 
13ec : 20 83 17 JSR $1783 ; (freg + 20)
13ef : 20 6a 19 JSR $196a ; (fdiv + 0)
13f2 : a5 3c __ LDA ACCU + 1 
13f4 : 85 36 __ STA P9 
13f6 : a5 3d __ LDA ACCU + 2 
13f8 : 85 37 __ STA P10 
13fa : a5 3e __ LDA ACCU + 3 
13fc : 85 38 __ STA P11 
13fe : 18 __ __ CLC
13ff : a5 4c __ LDA T3 + 0 
1401 : 69 ff __ ADC #$ff
1403 : 85 52 __ STA T6 + 0 
1405 : a6 3b __ LDX ACCU + 0 
.s31:
1407 : 38 __ __ SEC
1408 : a5 53 __ LDA T8 + 0 
140a : e5 52 __ SBC T6 + 0 
140c : 85 4c __ STA T3 + 0 
140e : a9 14 __ LDA #$14
1410 : c5 53 __ CMP T8 + 0 
1412 : b0 02 __ BCS $1416 ; (nformf.s49 + 0)
.s47:
1414 : 85 53 __ STA T8 + 0 
.s49:
1416 : a5 4c __ LDA T3 + 0 
1418 : d0 08 __ BNE $1422 ; (nformf.s161 + 0)
.s50:
141a : a9 30 __ LDA #$30
141c : a4 4b __ LDY T2 + 0 
141e : 91 33 __ STA (P6),y 
1420 : e6 4b __ INC T2 + 0 
.s161:
1422 : a9 00 __ LDA #$00
1424 : 85 52 __ STA T6 + 0 
1426 : c5 4c __ CMP T3 + 0 
1428 : d0 08 __ BNE $1432 ; (nformf.l59 + 0)
.l57:
142a : a9 2e __ LDA #$2e
142c : a4 4b __ LDY T2 + 0 
142e : 91 33 __ STA (P6),y 
1430 : e6 4b __ INC T2 + 0 
.l59:
1432 : a9 06 __ LDA #$06
1434 : c5 52 __ CMP T6 + 0 
1436 : b0 04 __ BCS $143c ; (nformf.s61 + 0)
.s60:
1438 : a9 30 __ LDA #$30
143a : d0 55 __ BNE $1491 ; (nformf.s187 + 0)
.s61:
143c : 86 3b __ STX ACCU + 0 
143e : 86 47 __ STX T1 + 0 
1440 : a5 36 __ LDA P9 
1442 : 85 3c __ STA ACCU + 1 
1444 : 85 48 __ STA T1 + 1 
1446 : a5 37 __ LDA P10 
1448 : 85 3d __ STA ACCU + 2 
144a : 85 49 __ STA T1 + 2 
144c : a5 38 __ LDA P11 
144e : 85 3e __ STA ACCU + 3 
1450 : 85 4a __ STA T1 + 3 
1452 : 20 00 1b JSR $1b00 ; (f32_to_i16 + 0)
1455 : a5 3b __ LDA ACCU + 0 
1457 : 85 5a __ STA T11 + 0 
1459 : 20 42 1b JSR $1b42 ; (sint16_to_float + 0)
145c : a2 47 __ LDX #$47
145e : 20 73 17 JSR $1773 ; (freg + 4)
1461 : a5 3e __ LDA ACCU + 3 
1463 : 49 80 __ EOR #$80
1465 : 85 3e __ STA ACCU + 3 
1467 : 20 b4 17 JSR $17b4 ; (faddsub + 0)
146a : a9 00 __ LDA #$00
146c : 85 23 __ STA WORK + 0 
146e : 85 24 __ STA WORK + 1 
1470 : a9 20 __ LDA #$20
1472 : 85 25 __ STA WORK + 2 
1474 : a9 41 __ LDA #$41
1476 : 85 26 __ STA WORK + 3 
1478 : 20 83 17 JSR $1783 ; (freg + 20)
147b : 20 9b 18 JSR $189b ; (fmul + 0)
147e : a5 3c __ LDA ACCU + 1 
1480 : 85 36 __ STA P9 
1482 : a5 3d __ LDA ACCU + 2 
1484 : 85 37 __ STA P10 
1486 : a5 3e __ LDA ACCU + 3 
1488 : 85 38 __ STA P11 
148a : 18 __ __ CLC
148b : a5 5a __ LDA T11 + 0 
148d : 69 30 __ ADC #$30
148f : a6 3b __ LDX ACCU + 0 
.s187:
1491 : a4 4b __ LDY T2 + 0 
1493 : 91 33 __ STA (P6),y 
1495 : e6 4b __ INC T2 + 0 
1497 : e6 52 __ INC T6 + 0 
1499 : a5 52 __ LDA T6 + 0 
149b : c5 53 __ CMP T8 + 0 
149d : b0 07 __ BCS $14a6 ; (nformf.s56 + 0)
.s54:
149f : c5 4c __ CMP T3 + 0 
14a1 : d0 8f __ BNE $1432 ; (nformf.l59 + 0)
14a3 : 4c 2a 14 JMP $142a ; (nformf.l57 + 0)
.s56:
14a6 : a5 55 __ LDA T9 + 0 
14a8 : f0 6f __ BEQ $1519 ; (nformf.s9 + 0)
.s63:
14aa : a9 45 __ LDA #$45
14ac : a4 4b __ LDY T2 + 0 
14ae : 91 33 __ STA (P6),y 
14b0 : c8 __ __ INY
14b1 : a5 4f __ LDA T4 + 1 
14b3 : 30 06 __ BMI $14bb ; (nformf.s66 + 0)
.s67:
14b5 : a9 2b __ LDA #$2b
14b7 : 91 33 __ STA (P6),y 
14b9 : d0 11 __ BNE $14cc ; (nformf.s68 + 0)
.s66:
14bb : a9 2d __ LDA #$2d
14bd : 91 33 __ STA (P6),y 
14bf : 38 __ __ SEC
14c0 : a9 00 __ LDA #$00
14c2 : e5 4e __ SBC T4 + 0 
14c4 : 85 4e __ STA T4 + 0 
14c6 : a9 00 __ LDA #$00
14c8 : e5 4f __ SBC T4 + 1 
14ca : 85 4f __ STA T4 + 1 
.s68:
14cc : 18 __ __ CLC
14cd : a5 4b __ LDA T2 + 0 
14cf : 69 02 __ ADC #$02
14d1 : 85 4c __ STA T3 + 0 
14d3 : a5 4e __ LDA T4 + 0 
14d5 : 85 3b __ STA ACCU + 0 
14d7 : a5 4f __ LDA T4 + 1 
14d9 : 85 3c __ STA ACCU + 1 
14db : a9 0a __ LDA #$0a
14dd : 85 23 __ STA WORK + 0 
14df : a9 00 __ LDA #$00
14e1 : 85 24 __ STA WORK + 1 
14e3 : 20 18 1a JSR $1a18 ; (divs16 + 0)
14e6 : 18 __ __ CLC
14e7 : a5 3b __ LDA ACCU + 0 
14e9 : 69 30 __ ADC #$30
14eb : a4 4c __ LDY T3 + 0 
14ed : 91 33 __ STA (P6),y 
14ef : 18 __ __ CLC
14f0 : a5 4b __ LDA T2 + 0 
14f2 : 69 03 __ ADC #$03
14f4 : 85 4c __ STA T3 + 0 
14f6 : a5 4e __ LDA T4 + 0 
14f8 : 85 3b __ STA ACCU + 0 
14fa : a5 4f __ LDA T4 + 1 
14fc : 85 3c __ STA ACCU + 1 
14fe : a9 0a __ LDA #$0a
1500 : 85 23 __ STA WORK + 0 
1502 : a9 00 __ LDA #$00
1504 : 85 24 __ STA WORK + 1 
1506 : 20 d7 1a JSR $1ad7 ; (mods16 + 0)
1509 : 18 __ __ CLC
150a : a5 25 __ LDA WORK + 2 
150c : 69 30 __ ADC #$30
150e : a4 4c __ LDY T3 + 0 
1510 : 91 33 __ STA (P6),y 
1512 : 18 __ __ CLC
1513 : a5 4b __ LDA T2 + 0 
1515 : 69 04 __ ADC #$04
.s1108:
1517 : 85 4b __ STA T2 + 0 
.s9:
1519 : a5 31 __ LDA P4 
151b : 85 4c __ STA T3 + 0 
151d : a5 32 __ LDA P5 
151f : 85 4d __ STA T3 + 1 
1521 : a5 4b __ LDA T2 + 0 
1523 : a0 01 __ LDY #$01
1525 : d1 31 __ CMP (P4),y 
1527 : b0 5c __ BCS $1585 ; (nformf.s1001 + 0)
.s69:
1529 : a0 06 __ LDY #$06
152b : b1 31 __ LDA (P4),y 
152d : f0 05 __ BEQ $1534 ; (nformf.s73 + 0)
.s1110:
152f : a6 4b __ LDX T2 + 0 
1531 : 4c 8c 15 JMP $158c ; (nformf.l75 + 0)
.s73:
1534 : a5 4b __ LDA T2 + 0 
1536 : f0 2d __ BEQ $1565 ; (nformf.s82 + 0)
.s90:
1538 : a9 01 __ LDA #$01
153a : 85 52 __ STA T6 + 0 
153c : a6 4b __ LDX T2 + 0 
153e : 38 __ __ SEC
.l1112:
153f : a0 01 __ LDY #$01
1541 : b1 31 __ LDA (P4),y 
1543 : e5 52 __ SBC T6 + 0 
1545 : 85 53 __ STA T8 + 0 
1547 : a9 ff __ LDA #$ff
1549 : 65 34 __ ADC P7 
154b : 85 54 __ STA T8 + 1 
154d : 8a __ __ TXA
154e : 38 __ __ SEC
154f : e5 52 __ SBC T6 + 0 
1551 : 85 50 __ STA T5 + 0 
1553 : a9 ff __ LDA #$ff
1555 : 65 34 __ ADC P7 
1557 : 85 51 __ STA T5 + 1 
1559 : a4 33 __ LDY P6 
155b : b1 50 __ LDA (T5 + 0),y 
155d : 91 53 __ STA (T8 + 0),y 
155f : e6 52 __ INC T6 + 0 
1561 : e4 52 __ CPX T6 + 0 
1563 : b0 da __ BCS $153f ; (nformf.l1112 + 0)
.s82:
1565 : a9 00 __ LDA #$00
1567 : 85 52 __ STA T6 + 0 
.l83:
1569 : a0 01 __ LDY #$01
156b : b1 4c __ LDA (T3 + 0),y 
156d : 38 __ __ SEC
156e : e5 4b __ SBC T2 + 0 
1570 : 90 06 __ BCC $1578 ; (nformf.s84 + 0)
.s1007:
1572 : c5 52 __ CMP T6 + 0 
1574 : f0 0d __ BEQ $1583 ; (nformf.s74 + 0)
.s1114:
1576 : 90 0b __ BCC $1583 ; (nformf.s74 + 0)
.s84:
1578 : a9 20 __ LDA #$20
157a : a4 52 __ LDY T6 + 0 
157c : 91 33 __ STA (P6),y 
157e : e6 52 __ INC T6 + 0 
1580 : 4c 69 15 JMP $1569 ; (nformf.l83 + 0)
.s74:
1583 : b1 31 __ LDA (P4),y 
.s1001:
1585 : 85 3b __ STA ACCU + 0 
1587 : a9 00 __ LDA #$00
1589 : 85 3c __ STA ACCU + 1 
158b : 60 __ __ RTS
.l75:
158c : 8a __ __ TXA
158d : a0 01 __ LDY #$01
158f : d1 4c __ CMP (T3 + 0),y 
1591 : b0 f0 __ BCS $1583 ; (nformf.s74 + 0)
.s76:
1593 : a8 __ __ TAY
1594 : a9 20 __ LDA #$20
1596 : 91 33 __ STA (P6),y 
1598 : e8 __ __ INX
1599 : 4c 8c 15 JMP $158c ; (nformf.l75 + 0)
.s30:
159c : a5 53 __ LDA T8 + 0 
159e : c9 07 __ CMP #$07
15a0 : 90 15 __ BCC $15b7 ; (nformf.s41 + 0)
.s42:
15a2 : ad 3d 1c LDA $1c3d ; (fround5 + 24)
15a5 : 85 56 __ STA T10 + 0 
15a7 : ad 3e 1c LDA $1c3e ; (fround5 + 25)
15aa : 85 57 __ STA T10 + 1 
15ac : ad 3f 1c LDA $1c3f ; (fround5 + 26)
15af : 85 58 __ STA T10 + 2 
15b1 : ad 40 1c LDA $1c40 ; (fround5 + 27)
15b4 : 4c cc 15 JMP $15cc ; (nformf.s183 + 0)
.s41:
15b7 : 0a __ __ ASL
15b8 : 0a __ __ ASL
15b9 : aa __ __ TAX
15ba : bd 21 1c LDA $1c21,x ; (divmod32 + 148)
15bd : 85 56 __ STA T10 + 0 
15bf : bd 22 1c LDA $1c22,x ; (divmod32 + 149)
15c2 : 85 57 __ STA T10 + 1 
15c4 : bd 23 1c LDA $1c23,x ; (spentry + 0)
15c7 : 85 58 __ STA T10 + 2 
15c9 : bd 24 1c LDA $1c24,x ; (giocharmap + 0)
.s183:
15cc : 85 59 __ STA T10 + 3 
15ce : a5 47 __ LDA T1 + 0 
15d0 : 85 3b __ STA ACCU + 0 
15d2 : a5 48 __ LDA T1 + 1 
15d4 : 85 3c __ STA ACCU + 1 
15d6 : a5 49 __ LDA T1 + 2 
15d8 : 85 3d __ STA ACCU + 2 
15da : a5 4a __ LDA T1 + 3 
15dc : 85 3e __ STA ACCU + 3 
15de : a2 56 __ LDX #$56
15e0 : 20 73 17 JSR $1773 ; (freg + 4)
15e3 : 20 b4 17 JSR $17b4 ; (faddsub + 0)
15e6 : a5 3c __ LDA ACCU + 1 
15e8 : 85 36 __ STA P9 
15ea : a5 3d __ LDA ACCU + 2 
15ec : 85 37 __ STA P10 
15ee : a6 3b __ LDX ACCU + 0 
15f0 : a5 3e __ LDA ACCU + 3 
15f2 : 85 38 __ STA P11 
15f4 : 10 03 __ BPL $15f9 ; (nformf.s1038 + 0)
15f6 : 4c 07 14 JMP $1407 ; (nformf.s31 + 0)
.s1038:
15f9 : c9 41 __ CMP #$41
15fb : d0 06 __ BNE $1603 ; (nformf.s1042 + 0)
.s1039:
15fd : a5 37 __ LDA P10 
15ff : c9 20 __ CMP #$20
1601 : f0 05 __ BEQ $1608 ; (nformf.s44 + 0)
.s1042:
1603 : b0 03 __ BCS $1608 ; (nformf.s44 + 0)
1605 : 4c 07 14 JMP $1407 ; (nformf.s31 + 0)
.s44:
1608 : a9 00 __ LDA #$00
160a : 85 23 __ STA WORK + 0 
160c : 85 24 __ STA WORK + 1 
160e : a9 20 __ LDA #$20
1610 : 85 25 __ STA WORK + 2 
1612 : a9 41 __ LDA #$41
1614 : 85 26 __ STA WORK + 3 
1616 : 20 83 17 JSR $1783 ; (freg + 20)
1619 : 20 6a 19 JSR $196a ; (fdiv + 0)
161c : a5 3c __ LDA ACCU + 1 
161e : 85 36 __ STA P9 
1620 : a5 3d __ LDA ACCU + 2 
1622 : 85 37 __ STA P10 
1624 : a5 3e __ LDA ACCU + 3 
1626 : 85 38 __ STA P11 
1628 : a6 3b __ LDX ACCU + 0 
162a : e6 4e __ INC T4 + 0 
162c : f0 03 __ BEQ $1631 ; (nformf.s1117 + 0)
162e : 4c 07 14 JMP $1407 ; (nformf.s31 + 0)
.s1117:
1631 : e6 4f __ INC T4 + 1 
1633 : 4c 07 14 JMP $1407 ; (nformf.s31 + 0)
.s4:
1636 : a9 2b __ LDA #$2b
.s198:
1638 : a0 00 __ LDY #$00
163a : 91 33 __ STA (P6),y 
163c : a9 01 __ LDA #$01
163e : 85 4b __ STA T2 + 0 
1640 : 85 4c __ STA T3 + 0 
1642 : a9 02 __ LDA #$02
1644 : 85 4e __ STA T4 + 0 
1646 : a9 03 __ LDA #$03
1648 : 4c a8 11 JMP $11a8 ; (nformf.s168 + 0)
--------------------------------------------------------------------
isinf:
.s0:
164b : a5 2d __ LDA P0 
164d : 8d f4 9e STA $9ef4 ; (buffer + 12)
1650 : a5 2e __ LDA P1 
1652 : 8d f5 9e STA $9ef5 ; (buffer + 13)
1655 : a5 2f __ LDA P2 
1657 : 8d f6 9e STA $9ef6 ; (buffer + 14)
165a : 0a __ __ ASL
165b : a5 30 __ LDA P3 
165d : 8d f7 9e STA $9ef7 ; (buffer + 15)
1660 : 2a __ __ ROL
1661 : c9 ff __ CMP #$ff
1663 : d0 03 __ BNE $1668 ; (isinf.s1003 + 0)
.s1002:
1665 : a9 01 __ LDA #$01
1667 : 60 __ __ RTS
.s1003:
1668 : a9 00 __ LDA #$00
.s1001:
166a : 60 __ __ RTS
--------------------------------------------------------------------
fround5:
1c25 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1c35 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
166b : __ __ __ BYT 25 78 00                                        : %x.
--------------------------------------------------------------------
interpret:
.s0:
166e : a9 10 __ LDA #$10
1670 : 85 47 __ STA T0 + 0 
1672 : a9 00 __ LDA #$00
.l1012:
1674 : 85 48 __ STA T0 + 1 
.l2:
1676 : a5 47 __ LDA T0 + 0 
1678 : 85 49 __ STA T2 + 0 
167a : 18 __ __ CLC
167b : a5 30 __ LDA P3 
167d : 65 48 __ ADC T0 + 1 
167f : 85 4a __ STA T2 + 1 
1681 : a4 2f __ LDY P2 
1683 : b1 49 __ LDA (T2 + 0),y 
1685 : c9 40 __ CMP #$40
1687 : b0 2c __ BCS $16b5 ; (interpret.s6 + 0)
.s5:
1689 : 29 3f __ AND #$3f
168b : 09 c0 __ ORA #$c0
168d : 8d 20 9f STA $9f20 
1690 : ad 25 9f LDA $9f25 
1693 : 29 fe __ AND #$fe
1695 : 8d 25 9f STA $9f25 
1698 : a9 f9 __ LDA #$f9
169a : 8d 21 9f STA $9f21 
169d : a9 01 __ LDA #$01
169f : 8d 22 9f STA $9f22 
16a2 : c8 __ __ INY
16a3 : b1 49 __ LDA (T2 + 0),y 
16a5 : 8d 23 9f STA $9f23 
16a8 : a5 47 __ LDA T0 + 0 
16aa : 69 02 __ ADC #$02
16ac : 85 47 __ STA T0 + 0 
16ae : a5 48 __ LDA T0 + 1 
16b0 : 69 00 __ ADC #$00
16b2 : 4c 74 16 JMP $1674 ; (interpret.l1012 + 0)
.s6:
16b5 : e6 47 __ INC T0 + 0 
16b7 : d0 02 __ BNE $16bb ; (interpret.s1016 + 0)
.s1015:
16b9 : e6 48 __ INC T0 + 1 
.s1016:
16bb : c9 40 __ CMP #$40
16bd : d0 11 __ BNE $16d0 ; (interpret.s9 + 0)
.s8:
16bf : c8 __ __ INY
16c0 : b1 49 __ LDA (T2 + 0),y 
16c2 : 29 3f __ AND #$3f
16c4 : 18 __ __ CLC
16c5 : 65 47 __ ADC T0 + 0 
16c7 : 85 47 __ STA T0 + 0 
16c9 : a9 00 __ LDA #$00
16cb : 65 48 __ ADC T0 + 1 
16cd : 4c 74 16 JMP $1674 ; (interpret.l1012 + 0)
.s9:
16d0 : 09 00 __ ORA #$00
16d2 : 30 39 __ BMI $170d ; (interpret.s12 + 0)
.s11:
16d4 : 29 3f __ AND #$3f
16d6 : f0 9e __ BEQ $1676 ; (interpret.l2 + 0)
.s22:
16d8 : 85 4b __ STA T3 + 0 
16da : a9 00 __ LDA #$00
16dc : 85 4c __ STA T5 + 0 
16de : 18 __ __ CLC
.l1013:
16df : a5 47 __ LDA T0 + 0 
16e1 : 85 49 __ STA T2 + 0 
16e3 : a5 30 __ LDA P3 
16e5 : 65 48 __ ADC T0 + 1 
16e7 : 85 4a __ STA T2 + 1 
16e9 : a4 2f __ LDY P2 
16eb : b1 49 __ LDA (T2 + 0),y 
16ed : 85 2d __ STA P0 
16ef : c8 __ __ INY
16f0 : b1 49 __ LDA (T2 + 0),y 
16f2 : 85 2e __ STA P1 
16f4 : 20 20 17 JSR $1720 ; (sfx_put.l1 + 0)
16f7 : 18 __ __ CLC
16f8 : a5 47 __ LDA T0 + 0 
16fa : 69 02 __ ADC #$02
16fc : 85 47 __ STA T0 + 0 
16fe : 90 02 __ BCC $1702 ; (interpret.s1018 + 0)
.s1017:
1700 : e6 48 __ INC T0 + 1 
.s1018:
1702 : e6 4c __ INC T5 + 0 
1704 : a5 4c __ LDA T5 + 0 
1706 : c5 4b __ CMP T3 + 0 
1708 : 90 d5 __ BCC $16df ; (interpret.l1013 + 0)
170a : 4c 76 16 JMP $1676 ; (interpret.l2 + 0)
.s12:
170d : c9 80 __ CMP #$80
170f : f0 0e __ BEQ $171f ; (interpret.s1001 + 0)
.s19:
1711 : 29 7f __ AND #$7f
1713 : 85 2d __ STA P0 
1715 : a9 00 __ LDA #$00
1717 : 85 2e __ STA P1 
1719 : 20 34 17 JSR $1734 ; (delay.s0 + 0)
171c : 4c 76 16 JMP $1676 ; (interpret.l2 + 0)
.s1001:
171f : 60 __ __ RTS
--------------------------------------------------------------------
sfx_put:
.l1:
1720 : ad 41 9f LDA $9f41 
1723 : 30 fb __ BMI $1720 ; (sfx_put.l1 + 0)
.s3:
1725 : a5 2d __ LDA P0 
1727 : 8d 40 9f STA $9f40 
172a : ea __ __ NOP
172b : ea __ __ NOP
172c : ea __ __ NOP
172d : ea __ __ NOP
172e : a5 2e __ LDA P1 
1730 : 8d 41 9f STA $9f41 
.s1001:
1733 : 60 __ __ RTS
--------------------------------------------------------------------
delay:
.s0:
1734 : a5 2d __ LDA P0 
1736 : aa __ __ TAX
1737 : 18 __ __ CLC
1738 : 69 ff __ ADC #$ff
173a : 85 2d __ STA P0 
173c : a5 2e __ LDA P1 
173e : 85 3c __ STA ACCU + 1 
1740 : 69 ff __ ADC #$ff
1742 : 85 2e __ STA P1 
1744 : 8a __ __ TXA
1745 : 05 3c __ ORA ACCU + 1 
1747 : f0 18 __ BEQ $1761 ; (delay.s1001 + 0)
.l2:
1749 : 20 62 17 JSR $1762 ; (frame_wait.s0 + 0)
174c : a5 2d __ LDA P0 
174e : aa __ __ TAX
174f : 18 __ __ CLC
1750 : 69 ff __ ADC #$ff
1752 : 85 2d __ STA P0 
1754 : a5 2e __ LDA P1 
1756 : 85 3c __ STA ACCU + 1 
1758 : 69 ff __ ADC #$ff
175a : 85 2e __ STA P1 
175c : 8a __ __ TXA
175d : 05 3c __ ORA ACCU + 1 
175f : d0 e8 __ BNE $1749 ; (delay.l2 + 0)
.s1001:
1761 : 60 __ __ RTS
--------------------------------------------------------------------
frame_wait:
.s0:
1762 : ad 29 9f LDA $9f29 
1765 : 85 3b __ STA ACCU + 0 
.l1:
1767 : ad 29 9f LDA $9f29 
176a : 45 3b __ EOR ACCU + 0 
176c : 10 f9 __ BPL $1767 ; (frame_wait.l1 + 0)
.s1001:
176e : 60 __ __ RTS
--------------------------------------------------------------------
sound:
1c41 : __ __ __ BYT 7a 6d 01 17 00 00 00 00 00 ff 00 00 3c 00 00 00 : zm..........<...
1c51 : __ __ __ BYT 43 18 00 19 7f 19 ff 7f 08 00 20 fc 28 48 30 00 : C......... .(H0.
1c61 : __ __ __ BYT 38 00 40 72 48 78 50 71 58 72 60 18 68 20 70 00 : 8.@rHxPqXr`.h p.
1c71 : __ __ __ BYT 78 00 80 1f 88 1f 90 1f 98 1f a0 0c a8 0c b0 0e : x...............
1c81 : __ __ __ BYT b8 0e c0 00 c8 00 d0 01 d8 01 e0 f3 e8 f3 f0 54 : ...............T
1c91 : __ __ __ BYT f8 54 08 78 08 02 22 fc 2a 48 32 30 3a 00 42 72 : .T.x..".*H20:.Br
1ca1 : __ __ __ BYT 4a 78 52 71 5a 72 62 18 6a 20 72 00 7a 00 82 1f : JxRqZrb.j r.z...
1cb1 : __ __ __ BYT 8a 1f 92 1f 9a 1f a2 0c aa 0c b2 0e ba 0e c2 00 : ................
1cc1 : __ __ __ BYT ca 00 d2 01 da 01 e2 f3 ea f3 f2 54 fa 54 08 7a : ...........T.T.z
1cd1 : __ __ __ BYT 08 04 24 e0 2c 18 7f 34 00 3c 00 44 2c 4c 21 54 : ..$.,..4.<.D,L!T
1ce1 : __ __ __ BYT 71 5c 71 64 1a 6c 1c 74 25 7c 02 84 1f 8c 1f 94 : q\qd.l.t%|......
1cf1 : __ __ __ BYT 1f 9c 1f a4 0d ac 0b b4 0f bc 09 c4 00 cc 00 d4 : ................
1d01 : __ __ __ BYT 00 dc 00 e4 f3 ec b1 f4 f4 fc f9 08 7c 08 05 25 : ............|..%
1d11 : __ __ __ BYT fc 2d 39 35 00 3d 00 45 2c 4d 21 55 71 5d 71 65 : .-95.=.E,M!Uq]qe
1d21 : __ __ __ BYT 00 6d 00 75 7f 7d 02 85 1f 8d 1f 95 1f 9d 1f a5 : .m.u.}..........
1d31 : __ __ __ BYT 08 ad 17 b5 0a bd 09 c5 00 cd 00 d5 00 dd 00 e5 : ................
1d41 : __ __ __ BYT f3 ed f1 f5 f4 fd f9 08 7d 08 07 27 fc 2f 39 37 : ........}..'./97
1d51 : __ __ __ BYT 00 3f 00 47 2c 58 4f 21 57 71 5f 71 67 00 6f 00 : .?.G,XO!Wq_qg.o.
1d61 : __ __ __ BYT 77 00 7f 7f 87 1f 8f 1f 97 1f 9f 1f a7 08 af 17 : w...............
1d71 : __ __ __ BYT b7 12 bf 06 c7 00 cf 00 d7 00 df 00 e7 f3 ef f1 : ................
1d81 : __ __ __ BYT f7 f4 ff f9 08 7f 81 42 2d 34 2f 34 81 42 2d 2e : .......B-4/4.B-.
1d91 : __ __ __ BYT 2f 2e 81 42 2d 29 2f 29 81 42 2d 24 2f 24 81 42 : /..B-)/).B-$/$.B
1da1 : __ __ __ BYT 2d 1e 2f 1e 81 42 2d 19 2f 19 81 42 2d 14 2f 14 : -./..B-./..B-./.
1db1 : __ __ __ BYT 81 46 08 04 08 07 08 7c 2d 0e 2f 3d 08 7f 81 42 : .F.....|-./=...B
1dc1 : __ __ __ BYT 2d 09 2f 38 81 42 2d 04 2f 32 81 42 2d 00 2f 2d : -./8.B-./2.B-./-
1dd1 : __ __ __ BYT 81 41 2f 28 81 41 2f 22 81 41 2f 1d 81 41 2f 18 : .A/(.A/".A/..A/.
1de1 : __ __ __ BYT 81 7f 08 00 08 02 08 04 08 07 28 4a 08 78 08 01 : ..........(J.x..
1df1 : __ __ __ BYT 21 fc 29 48 31 30 39 00 41 72 49 78 51 71 59 72 : !.)H109.ArIxQqYr
1e01 : __ __ __ BYT 61 18 69 20 71 0f 79 0f 81 1f 89 1f 91 1f 99 1f : a.i q.y.........
1e11 : __ __ __ BYT a1 0c a9 0c b1 0e b9 0e c1 00 c9 00 d1 01 d9 01 : ................
1e21 : __ __ __ BYT e1 f3 e9 f3 f1 54 f9 54 08 79 2a 4a 08 7a 08 03 : .....T.T.y*J.z..
1e31 : __ __ __ BYT 23 fc 2b 48 33 30 3b 00 43 72 4b 78 53 71 5b 72 : #.+H30;.CrKxSq[r
1e41 : __ __ __ BYT 63 18 6b 20 73 0f 7b 0f 83 1f 8b 1f 93 1f 9b 1f : c.k s.{.........
1e51 : __ __ __ BYT a3 0c ab 0c b3 0e bb 0e c3 00 cb 00 d3 01 db 01 : ................
1e61 : __ __ __ BYT 49 e3 f3 eb f3 f3 54 fb 54 08 7b 2c 28 08 7c 2f : I.....T.T.{,(.|/
1e71 : __ __ __ BYT 42 08 7f 81 41 2f 3d 81 41 2f 38 81 41 2f 32 81 : B...A/=.A/8.A/2.
1e81 : __ __ __ BYT 41 2f 2d 81 41 2f 28 81 41 2f 22 81 41 2f 1d 81 : A/-.A/(.A/".A/..
1e91 : __ __ __ BYT 4b 08 00 08 02 08 04 08 07 28 4c 08 78 2a 4c 08 : K........(L.x*L.
1ea1 : __ __ __ BYT 7a 08 7c 2f 39 08 7f 81 41 2f 34 81 41 2f 2e 81 : z.|/9...A/4.A/..
1eb1 : __ __ __ BYT 41 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 : A/).A/$.A/..A/..
1ec1 : __ __ __ BYT 41 2f 14 81 73 08 00 08 01 08 02 08 03 08 04 08 : A/..s...........
1ed1 : __ __ __ BYT 05 08 07 28 4a 08 78 29 4a 08 79 2a 4a 08 7a 2b : ...(J.x)J.y*J.z+
1ee1 : __ __ __ BYT 4a 08 7b 2c 18 08 7c 2d 39 08 7d 08 06 26 fc 2e : J.{,..|-9.}..&..
1ef1 : __ __ __ BYT 39 36 00 3e 00 46 2c 4e 21 56 71 5e 71 66 00 6e : 96.>.F,N!Vq^qf.n
1f01 : __ __ __ BYT 00 76 00 7e 02 86 1f 8e 1f 96 1f 9e 1f a6 08 ae : .v.~............
1f11 : __ __ __ BYT 17 b6 0e be 09 c6 00 ce 00 d6 00 de 00 e6 f3 ee : ................
1f21 : __ __ __ BYT f1 f6 f4 fe f9 08 7e 2f 3d 08 7f 81 43 2d 34 2e : ......~/=...C-4.
1f31 : __ __ __ BYT 34 2f 38 81 43 2d 2e 2e 2e 2f 32 81 43 2d 29 2e : 4/8.C-.../2.C-).
1f41 : __ __ __ BYT 29 2f 2d 81 43 2d 24 2e 24 2f 28 81 43 2d 1e 2e : )/-.C-$.$/(.C-..
1f51 : __ __ __ BYT 1e 2f 22 81 43 2d 19 2e 19 2f 1d 81 43 2d 14 2e : ./".C-.../..C-..
1f61 : __ __ __ BYT 14 2f 18 81 4d 08 01 08 03 08 04 08 07 29 4c 08 : ./..M........)L.
1f71 : __ __ __ BYT 79 2b 4c 08 7b 08 7c 2d 0e 2e 0e 2f 42 08 7f 81 : y+L.{.|-.../B...
1f81 : __ __ __ BYT 43 2d 09 2e 09 2f 3d 81 43 2d 04 2e 04 2f 38 81 : C-.../=.C-.../8.
1f91 : __ __ __ BYT 43 2d 00 2e 00 2f 32 81 41 2f 2d 81 41 2f 28 81 : C-.../2.A/-.A/(.
1fa1 : __ __ __ BYT 41 2f 22 81 41 2f 1d 81 52 08 00 08 01 08 02 08 : A/".A/..R.......
1fb1 : __ __ __ BYT 03 08 04 08 07 28 48 08 78 29 4a 08 79 2a 48 08 : .....(H.x)J.y*H.
1fc1 : __ __ __ BYT 7a 2b 4a 08 7b 2c 28 08 7c 2f 39 08 7f 81 41 2f : z+J.{,(.|/9...A/
1fd1 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
1fe1 : __ __ __ BYT 1e 81 41 2f 19 81 41 2f 14 81 45 08 04 08 07 08 : ..A/..A/..E.....
1ff1 : __ __ __ BYT 7c 2f 3d 08 7f 81 41 2f 38 81 41 2f 32 81 41 2f : |/=...A/8.A/2.A/
2001 : __ __ __ BYT 2d 81 41 2f 28 81 41 2f 22 81 41 2f 1d 81 41 2f : -.A/(.A/".A/..A/
2011 : __ __ __ BYT 18 81 55 08 00 08 01 08 02 08 03 08 04 08 05 08 : ..U.............
2021 : __ __ __ BYT 07 28 4a 08 78 29 48 08 79 2a 4a 08 7a 2b 48 08 : .(J.x)H.y*J.z+H.
2031 : __ __ __ BYT 7b 2c 15 08 7c 2d 39 08 7d 2f 42 08 7f 81 42 2d : {,..|-9.}/B...B-
2041 : __ __ __ BYT 34 2f 3d 81 42 2d 2e 2f 38 81 42 2d 29 2f 32 81 : 4/=.B-./8.B-)/2.
2051 : __ __ __ BYT 42 2d 24 2f 2d 81 42 2d 1e 2f 28 81 42 2d 19 2f : B-$/-.B-./(.B-./
2061 : __ __ __ BYT 22 81 42 2d 14 2f 1d 81 46 08 04 08 07 08 7c 2d : ".B-./..F.....|-
2071 : __ __ __ BYT 0e 2f 39 08 7f 81 42 2d 09 2f 34 81 42 2d 04 2f : ./9...B-./4.B-./
2081 : __ __ __ BYT 2e 81 42 2d 00 2f 29 81 41 2f 24 81 41 2f 1e 81 : ..B-./).A/$.A/..
2091 : __ __ __ BYT 41 2f 19 81 41 2f 14 81 52 08 00 08 01 08 02 08 : A/..A/..R.......
20a1 : __ __ __ BYT 03 08 04 08 07 28 51 08 78 29 4a 08 79 2a 51 08 : .....(Q.x)J.y*Q.
20b1 : __ __ __ BYT 7a 2b 4a 08 7b 2c 25 08 7c 2f 3d 08 7f 81 41 2f : z+J.{,%.|/=...A/
20c1 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
20d1 : __ __ __ BYT 22 81 41 2f 1d 81 41 2f 18 81 45 08 04 08 07 08 : ".A/..A/..E.....
20e1 : __ __ __ BYT 7c 2f 42 08 7f 81 41 2f 3d 81 41 2f 38 81 41 2f : |/B...A/=.A/8.A/
20f1 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 41 2f : 2.A/-.A/(.A/".A/
2101 : __ __ __ BYT 1d 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 : ..X.............
2111 : __ __ __ BYT 06 08 07 28 4a 08 78 29 51 08 79 2a 4a 08 7a 2b : ...(J.x)Q.y*J.z+
2121 : __ __ __ BYT 51 08 7b 2c 15 08 7c 2d 39 08 7d 2e 39 08 7e 2f : Q.{,..|-9.}.9.~/
2131 : __ __ __ BYT 39 08 7f 81 43 2d 34 2e 34 2f 34 81 43 2d 2e 2e : 9...C-4.4/4.C-..
2141 : __ __ __ BYT 2e 2f 2e 81 43 2d 29 2e 29 2f 29 81 43 2d 24 2e : ./..C-).)/).C-$.
2151 : __ __ __ BYT 24 2f 24 81 43 2d 1e 2e 1e 2f 1e 81 43 2d 19 2e : $/$.C-.../..C-..
2161 : __ __ __ BYT 19 2f 19 81 43 2d 14 2e 14 2f 14 81 47 08 04 08 : ./..C-.../..G...
2171 : __ __ __ BYT 07 08 7c 2d 0e 2e 0e 2f 49 08 7f 81 43 2d 09 2e : ..|-.../I...C-..
2181 : __ __ __ BYT 09 2f 44 81 43 2d 04 2e 04 2f 3e 81 43 2d 00 2e : ./D.C-.../>.C-..
2191 : __ __ __ BYT 00 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 : ./9.A/4.A/..A/).
21a1 : __ __ __ BYT 41 2f 24 81 4c 08 01 08 03 08 04 08 07 29 4a 08 : A/$.L........)J.
21b1 : __ __ __ BYT 79 2b 4a 08 7b 2c 25 08 7c 2f 3c 08 7f 81 41 2f : y+J.{,%.|/<...A/
21c1 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 41 2f : 6.A/1.A/,.A/&.A/
21d1 : __ __ __ BYT 21 81 41 2f 1c 81 41 2f 16 81 45 08 04 08 07 08 : !.A/..A/..E.....
21e1 : __ __ __ BYT 7c 2f 48 08 7f 81 41 2f 42 81 41 2f 3d 81 41 2f : |/H...A/B.A/=.A/
21f1 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
2201 : __ __ __ BYT 22 81 4f 08 00 08 02 08 04 08 05 08 07 28 48 08 : ".O..........(H.
2211 : __ __ __ BYT 78 2a 48 08 7a 2c 12 08 7c 2d 39 08 7d 2f 3e 08 : x*H.z,..|-9.}/>.
2221 : __ __ __ BYT 7f 81 42 2d 34 2f 39 81 42 2d 2e 2f 34 81 42 2d : ..B-4/9.B-./4.B-
2231 : __ __ __ BYT 29 2f 2e 81 42 2d 24 2f 29 81 42 2d 1e 2f 24 81 : )/..B-$/).B-./$.
2241 : __ __ __ BYT 42 2d 19 2f 1e 81 42 2d 14 2f 19 81 46 08 04 08 : B-./..B-./..F...
2251 : __ __ __ BYT 07 08 7c 2d 0e 2f 45 08 7f 81 42 2d 09 2f 40 81 : ..|-./E...B-./@.
2261 : __ __ __ BYT 42 2d 04 2f 3a 81 42 2d 00 2f 35 81 41 2f 30 81 : B-./:.B-./5.A/0.
2271 : __ __ __ BYT 41 2f 2a 81 41 2f 25 81 41 2f 20 81 52 08 00 08 : A/*.A/%.A/ .R...
2281 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 4a 08 78 29 48 08 : .........(J.x)H.
2291 : __ __ __ BYT 79 2a 4a 08 7a 2b 48 08 7b 2c 22 08 7c 2f 39 08 : y*J.z+H.{,".|/9.
22a1 : __ __ __ BYT 7f 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f : ..A/4.A/..A/).A/
22b1 : __ __ __ BYT 24 81 41 2f 1e 81 41 2f 19 81 41 2f 14 81 4b 08 : $.A/..A/..A/..K.
22c1 : __ __ __ BYT 00 08 02 08 04 08 07 28 4c 08 78 2a 4c 08 7a 08 : .......(L.x*L.z.
22d1 : __ __ __ BYT 7c 2f 48 08 7f 81 41 2f 42 81 41 2f 3d 81 41 2f : |/H...A/B.A/=.A/
22e1 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
22f1 : __ __ __ BYT 22 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 : ".X.............
2301 : __ __ __ BYT 06 08 07 28 4a 08 78 29 4a 08 79 2a 4a 08 7a 2b : ...(J.x)J.y*J.z+
2311 : __ __ __ BYT 4a 08 7b 2c 12 08 7c 2d 39 08 7d 2e 39 08 7e 2f : J.{,..|-9.}.9.~/
2321 : __ __ __ BYT 49 08 7f 81 43 2d 34 2e 34 2f 44 81 43 2d 2e 2e : I...C-4.4/D.C-..
2331 : __ __ __ BYT 2e 2f 3e 81 43 2d 29 2e 29 2f 39 81 43 2d 24 2e : ./>.C-).)/9.C-$.
2341 : __ __ __ BYT 24 2f 34 81 43 2d 1e 2e 1e 2f 2e 81 43 2d 19 2e : $/4.C-.../..C-..
2351 : __ __ __ BYT 19 2f 29 81 43 2d 14 2e 14 2f 24 81 4d 08 01 08 : ./).C-.../$.M...
2361 : __ __ __ BYT 03 08 04 08 07 29 4c 08 79 2b 4c 08 7b 08 7c 2d : .....)L.y+L.{.|-
2371 : __ __ __ BYT 0e 2e 0e 2f 3c 08 7f 81 43 2d 09 2e 09 2f 36 81 : .../<...C-.../6.
2381 : __ __ __ BYT 43 2d 04 2e 04 2f 31 81 43 2d 00 2e 00 2f 2c 81 : C-.../1.C-.../,.
2391 : __ __ __ BYT 41 2f 26 81 41 2f 21 81 41 2f 1c 81 41 2f 16 81 : A/&.A/!.A/..A/..
23a1 : __ __ __ BYT 52 08 00 08 01 08 02 08 03 08 04 08 07 28 48 08 : R............(H.
23b1 : __ __ __ BYT 78 29 4a 08 79 2a 48 08 7a 2b 4a 08 7b 2c 22 08 : x)J.y*H.z+J.{,".
23c1 : __ __ __ BYT 7c 2f 45 08 7f 81 41 2f 40 81 41 2f 3a 81 41 2f : |/E...A/@.A/:.A/
23d1 : __ __ __ BYT 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f : 5.A/0.A/*.A/%.A/
23e1 : __ __ __ BYT 20 81 45 08 04 08 07 08 7c 2f 3e 08 7f 81 41 2f :  .E.....|/>...A/
23f1 : __ __ __ BYT 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f : 9.A/4.A/..A/).A/
2401 : __ __ __ BYT 24 81 41 2f 1e 81 41 2f 19 81 53 08 00 08 01 08 : $.A/..A/..S.....
2411 : __ __ __ BYT 02 08 03 08 04 08 05 08 07 08 78 29 48 08 79 08 : ..........x)H.y.
2421 : __ __ __ BYT 7a 2b 48 08 7b 2c 11 08 7c 2d 39 08 7d 2f 48 08 : z+H.{,..|-9.}/H.
2431 : __ __ __ BYT 7f 81 42 2d 34 2f 42 81 42 2d 2e 2f 3d 81 42 2d : ..B-4/B.B-./=.B-
2441 : __ __ __ BYT 29 2f 38 81 42 2d 24 2f 32 81 42 2d 1e 2f 2d 81 : )/8.B-$/2.B-./-.
2451 : __ __ __ BYT 42 2d 19 2f 28 81 42 2d 14 2f 22 81 46 08 04 08 : B-./(.B-./".F...
2461 : __ __ __ BYT 07 08 7c 2d 0e 2f 49 08 7f 81 42 2d 09 2f 44 81 : ..|-./I...B-./D.
2471 : __ __ __ BYT 42 2d 04 2f 3e 81 42 2d 00 2f 39 81 41 2f 34 81 : B-./>.B-./9.A/4.
2481 : __ __ __ BYT 41 2f 2e 81 41 2f 29 81 41 2f 24 81 50 08 00 08 : A/..A/).A/$.P...
2491 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 46 08 78 08 79 2a : .........(F.x.y*
24a1 : __ __ __ BYT 46 08 7a 08 7b 2c 21 08 7c 2f 39 08 7f 81 41 2f : F.z.{,!.|/9...A/
24b1 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
24c1 : __ __ __ BYT 1e 81 41 2f 19 81 41 2f 14 81 45 08 04 08 07 08 : ..A/..A/..E.....
24d1 : __ __ __ BYT 7c 2f 45 08 7f 81 41 2f 40 81 41 2f 3a 81 41 2f : |/E...A/@.A/:.A/
24e1 : __ __ __ BYT 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f : 5.A/0.A/*.A/%.A/
24f1 : __ __ __ BYT 20 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 :  .X.............
2501 : __ __ __ BYT 06 08 07 28 48 08 78 29 46 08 79 2a 48 08 7a 2b : ...(H.x)F.y*H.z+
2511 : __ __ __ BYT 46 08 7b 2c 11 08 7c 2d 39 08 7d 2e 39 08 7e 2f : F.{,..|-9.}.9.~/
2521 : __ __ __ BYT 3c 08 7f 81 43 2d 34 2e 34 2f 36 81 43 2d 2e 2e : <...C-4.4/6.C-..
2531 : __ __ __ BYT 2e 2f 31 81 43 2d 29 2e 29 2f 2c 81 43 2d 24 2e : ./1.C-).)/,.C-$.
2541 : __ __ __ BYT 24 2f 26 81 43 2d 1e 2e 1e 2f 21 81 43 2d 19 2e : $/&.C-.../!.C-..
2551 : __ __ __ BYT 19 2f 1c 81 43 2d 14 2e 14 2f 16 81 47 08 04 08 : ./..C-.../..G...
2561 : __ __ __ BYT 07 08 7c 2d 0e 2e 0e 2f 49 08 7f 81 43 2d 09 2e : ..|-.../I...C-..
2571 : __ __ __ BYT 09 2f 44 81 43 2d 04 2e 04 2f 3e 81 43 2d 00 2e : ./D.C-.../>.C-..
2581 : __ __ __ BYT 00 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 : ./9.A/4.A/..A/).
2591 : __ __ __ BYT 41 2f 24 81 52 08 00 08 01 08 02 08 03 08 04 08 : A/$.R...........
25a1 : __ __ __ BYT 07 28 4a 08 78 29 48 08 79 2a 4a 08 7a 2b 48 08 : .(J.x)H.y*J.z+H.
25b1 : __ __ __ BYT 7b 2c 21 08 7c 2f 3e 08 7f 81 41 2f 39 81 41 2f : {,!.|/>...A/9.A/
25c1 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
25d1 : __ __ __ BYT 1e 81 41 2f 19 81 45 08 04 08 07 08 7c 2f 48 08 : ..A/..E.....|/H.
25e1 : __ __ __ BYT 7f 81 41 2f 42 81 41 2f 3d 81 41 2f 38 81 41 2f : ..A/B.A/=.A/8.A/
25f1 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 55 08 : 2.A/-.A/(.A/".U.
2601 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 07 28 48 08 : .............(H.
2611 : __ __ __ BYT 78 29 4a 08 79 2a 48 08 7a 2b 4a 08 7b 2c 18 08 : x)J.y*H.z+J.{,..
2621 : __ __ __ BYT 7c 2d 39 08 7d 2f 45 08 7f 81 42 2d 34 2f 40 81 : |-9.}/E...B-4/@.
2631 : __ __ __ BYT 42 2d 2e 2f 3a 81 42 2d 29 2f 35 81 42 2d 24 2f : B-./:.B-)/5.B-$/
2641 : __ __ __ BYT 30 81 42 2d 1e 2f 2a 81 42 2d 19 2f 25 81 42 2d : 0.B-./*.B-./%.B-
2651 : __ __ __ BYT 14 2f 20 81 46 08 04 08 07 08 7c 2d 0e 2f 39 08 : ./ .F.....|-./9.
2661 : __ __ __ BYT 7f 81 42 2d 09 2f 34 81 42 2d 04 2f 2e 81 42 2d : ..B-./4.B-./..B-
2671 : __ __ __ BYT 00 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 : ./).A/$.A/..A/..
2681 : __ __ __ BYT 41 2f 14 81 52 08 00 08 01 08 02 08 03 08 04 08 : A/..R...........
2691 : __ __ __ BYT 07 28 4a 08 78 29 48 08 79 2a 4a 08 7a 2b 48 08 : .(J.x)H.y*J.z+H.
26a1 : __ __ __ BYT 7b 2c 28 08 7c 2f 49 08 7f 81 41 2f 44 81 41 2f : {,(.|/I...A/D.A/
26b1 : __ __ __ BYT 3e 81 41 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f : >.A/9.A/4.A/..A/
26c1 : __ __ __ BYT 29 81 41 2f 24 81 4b 08 00 08 02 08 04 08 07 28 : ).A/$.K........(
26d1 : __ __ __ BYT 4c 08 78 2a 4c 08 7a 08 7c 2f 3c 08 7f 81 41 2f : L.x*L.z.|/<...A/
26e1 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 41 2f : 6.A/1.A/,.A/&.A/
26f1 : __ __ __ BYT 21 81 41 2f 1c 81 41 2f 16 81 58 08 00 08 01 08 : !.A/..A/..X.....
2701 : __ __ __ BYT 02 08 03 08 04 08 05 08 06 08 07 28 4a 08 78 29 : ...........(J.x)
2711 : __ __ __ BYT 4a 08 79 2a 4a 08 7a 2b 4a 08 7b 2c 18 08 7c 2d : J.y*J.z+J.{,..|-
2721 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 3e 08 7f 81 43 2d 34 2e : 9.}.9.~/>...C-4.
2731 : __ __ __ BYT 34 2f 39 81 43 2d 2e 2e 2e 2f 34 81 43 2d 29 2e : 4/9.C-.../4.C-).
2741 : __ __ __ BYT 29 2f 2e 81 43 2d 24 2e 24 2f 29 81 43 2d 1e 2e : )/..C-$.$/).C-..
2751 : __ __ __ BYT 1e 2f 24 81 43 2d 19 2e 19 2f 1e 81 43 2d 14 2e : ./$.C-.../..C-..
2761 : __ __ __ BYT 14 2f 19 81 4d 08 01 08 03 08 04 08 07 29 4c 08 : ./..M........)L.
2771 : __ __ __ BYT 79 2b 4c 08 7b 08 7c 2d 0e 2e 0e 2f 45 08 7f 81 : y+L.{.|-.../E...
2781 : __ __ __ BYT 43 2d 09 2e 09 2f 40 81 43 2d 04 2e 04 2f 3a 81 : C-.../@.C-.../:.
2791 : __ __ __ BYT 43 2d 00 2e 00 2f 35 81 41 2f 30 81 41 2f 2a 81 : C-.../5.A/0.A/*.
27a1 : __ __ __ BYT 41 2f 25 81 41 2f 20 81 52 08 00 08 01 08 02 08 : A/%.A/ .R.......
27b1 : __ __ __ BYT 03 08 04 08 07 28 48 08 78 29 4a 08 79 2a 48 08 : .....(H.x)J.y*H.
27c1 : __ __ __ BYT 7a 2b 4a 08 7b 2c 28 08 7c 2f 39 08 7f 81 41 2f : z+J.{,(.|/9...A/
27d1 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
27e1 : __ __ __ BYT 1e 81 41 2f 19 81 41 2f 14 81 45 08 04 08 07 08 : ..A/..A/..E.....
27f1 : __ __ __ BYT 7c 2f 49 08 7f 81 41 2f 44 81 41 2f 3e 81 41 2f : |/I...A/D.A/>.A/
2801 : __ __ __ BYT 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f : 9.A/4.A/..A/).A/
2811 : __ __ __ BYT 24 81 55 08 00 08 01 08 02 08 03 08 04 08 05 08 : $.U.............
2821 : __ __ __ BYT 07 28 4a 08 78 29 48 08 79 2a 4a 08 7a 2b 48 08 : .(J.x)H.y*J.z+H.
2831 : __ __ __ BYT 7b 2c 15 08 7c 2d 39 08 7d 2f 48 08 7f 81 42 2d : {,..|-9.}/H...B-
2841 : __ __ __ BYT 34 2f 42 81 42 2d 2e 2f 3d 81 42 2d 29 2f 38 81 : 4/B.B-./=.B-)/8.
2851 : __ __ __ BYT 42 2d 24 2f 32 81 42 2d 1e 2f 2d 81 42 2d 19 2f : B-$/2.B-./-.B-./
2861 : __ __ __ BYT 28 81 42 2d 14 2f 22 81 46 08 04 08 07 08 7c 2d : (.B-./".F.....|-
2871 : __ __ __ BYT 0e 2f 3c 08 7f 81 42 2d 09 2f 36 81 42 2d 04 2f : ./<...B-./6.B-./
2881 : __ __ __ BYT 31 81 42 2d 00 2f 2c 81 41 2f 26 81 41 2f 21 81 : 1.B-./,.A/&.A/!.
2891 : __ __ __ BYT 41 2f 1c 81 41 2f 16 81 52 08 00 08 01 08 02 08 : A/..A/..R.......
28a1 : __ __ __ BYT 03 08 04 08 07 28 51 08 78 29 4a 08 79 2a 51 08 : .....(Q.x)J.y*Q.
28b1 : __ __ __ BYT 7a 2b 4a 08 7b 2c 25 08 7c 2f 45 08 7f 81 41 2f : z+J.{,%.|/E...A/
28c1 : __ __ __ BYT 40 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : @.A/:.A/5.A/0.A/
28d1 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 45 08 04 08 07 08 : *.A/%.A/ .E.....
28e1 : __ __ __ BYT 7c 2f 3e 08 7f 81 41 2f 39 81 41 2f 34 81 41 2f : |/>...A/9.A/4.A/
28f1 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f : ..A/).A/$.A/..A/
2901 : __ __ __ BYT 19 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 : ..X.............
2911 : __ __ __ BYT 06 08 07 28 4a 08 78 29 51 08 79 2a 4a 08 7a 2b : ...(J.x)Q.y*J.z+
2921 : __ __ __ BYT 51 08 7b 2c 15 08 7c 2d 39 08 7d 2e 39 08 7e 2f : Q.{,..|-9.}.9.~/
2931 : __ __ __ BYT 49 08 7f 81 43 2d 34 2e 34 2f 44 81 43 2d 2e 2e : I...C-4.4/D.C-..
2941 : __ __ __ BYT 2e 2f 3e 81 43 2d 29 2e 29 2f 39 81 43 2d 24 2e : ./>.C-).)/9.C-$.
2951 : __ __ __ BYT 24 2f 34 81 43 2d 1e 2e 1e 2f 2e 81 43 2d 19 2e : $/4.C-.../..C-..
2961 : __ __ __ BYT 19 2f 29 81 43 2d 14 2e 14 2f 24 81 47 08 04 08 : ./).C-.../$.G...
2971 : __ __ __ BYT 07 08 7c 2d 0e 2e 0e 2f 39 08 7f 81 43 2d 09 2e : ..|-.../9...C-..
2981 : __ __ __ BYT 09 2f 34 81 43 2d 04 2e 04 2f 2e 81 43 2d 00 2e : ./4.C-.../..C-..
2991 : __ __ __ BYT 00 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 : ./).A/$.A/..A/..
29a1 : __ __ __ BYT 41 2f 14 81 4c 08 01 08 03 08 04 08 07 29 4a 08 : A/..L........)J.
29b1 : __ __ __ BYT 79 2b 4a 08 7b 2c 25 08 7c 2f 45 08 7f 81 41 2f : y+J.{,%.|/E...A/
29c1 : __ __ __ BYT 40 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : @.A/:.A/5.A/0.A/
29d1 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 45 08 04 08 07 08 : *.A/%.A/ .E.....
29e1 : __ __ __ BYT 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f 31 81 41 2f : |/<...A/6.A/1.A/
29f1 : __ __ __ BYT 2c 81 41 2f 26 81 41 2f 21 81 41 2f 1c 81 41 2f : ,.A/&.A/!.A/..A/
2a01 : __ __ __ BYT 16 81 4f 08 00 08 02 08 04 08 05 08 07 28 4c 08 : ..O..........(L.
2a11 : __ __ __ BYT 78 2a 4c 08 7a 2c 12 08 7c 2d 39 08 7d 2f 49 08 : x*L.z,..|-9.}/I.
2a21 : __ __ __ BYT 7f 81 42 2d 34 2f 44 81 42 2d 2e 2f 3e 81 42 2d : ..B-4/D.B-./>.B-
2a31 : __ __ __ BYT 29 2f 39 81 42 2d 24 2f 34 81 42 2d 1e 2f 2e 81 : )/9.B-$/4.B-./..
2a41 : __ __ __ BYT 42 2d 19 2f 29 81 42 2d 14 2f 24 81 46 08 04 08 : B-./).B-./$.F...
2a51 : __ __ __ BYT 07 08 7c 2d 0e 2f 3e 08 7f 81 42 2d 09 2f 39 81 : ..|-./>...B-./9.
2a61 : __ __ __ BYT 42 2d 04 2f 34 81 42 2d 00 2f 2e 81 41 2f 29 81 : B-./4.B-./..A/).
2a71 : __ __ __ BYT 41 2f 24 81 41 2f 1e 81 41 2f 19 81 52 08 00 08 : A/$.A/..A/..R...
2a81 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 4e 08 78 29 4c 08 : .........(N.x)L.
2a91 : __ __ __ BYT 79 2a 4e 08 7a 2b 4c 08 7b 2c 22 08 7c 2f 48 08 : y*N.z+L.{,".|/H.
2aa1 : __ __ __ BYT 7f 81 41 2f 42 81 41 2f 3d 81 41 2f 38 81 41 2f : ..A/B.A/=.A/8.A/
2ab1 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 4b 08 : 2.A/-.A/(.A/".K.
2ac1 : __ __ __ BYT 00 08 02 08 04 08 07 28 51 08 78 2a 51 08 7a 08 : .......(Q.x*Q.z.
2ad1 : __ __ __ BYT 7c 2f 45 08 7f 81 41 2f 40 81 41 2f 3a 81 41 2f : |/E...A/@.A/:.A/
2ae1 : __ __ __ BYT 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f : 5.A/0.A/*.A/%.A/
2af1 : __ __ __ BYT 20 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 :  .X.............
2b01 : __ __ __ BYT 06 08 07 28 4e 08 78 29 4e 08 79 2a 4e 08 7a 2b : ...(N.x)N.y*N.z+
2b11 : __ __ __ BYT 4e 08 7b 2c 12 08 7c 2d 39 08 7d 2e 39 08 7e 2f : N.{,..|-9.}.9.~/
2b21 : __ __ __ BYT 39 08 7f 81 43 2d 34 2e 34 2f 34 81 43 2d 2e 2e : 9...C-4.4/4.C-..
2b31 : __ __ __ BYT 2e 2f 2e 81 43 2d 29 2e 29 2f 29 81 43 2d 24 2e : ./..C-).)/).C-$.
2b41 : __ __ __ BYT 24 2f 24 81 43 2d 1e 2e 1e 2f 1e 81 43 2d 19 2e : $/$.C-.../..C-..
2b51 : __ __ __ BYT 19 2f 19 81 43 2d 14 2e 14 2f 14 81 4d 08 01 08 : ./..C-.../..M...
2b61 : __ __ __ BYT 03 08 04 08 07 29 51 08 79 2b 51 08 7b 08 7c 2d : .....)Q.y+Q.{.|-
2b71 : __ __ __ BYT 0e 2e 0e 2f 49 08 7f 81 43 2d 09 2e 09 2f 44 81 : .../I...C-.../D.
2b81 : __ __ __ BYT 43 2d 04 2e 04 2f 3e 81 43 2d 00 2e 00 2f 39 81 : C-.../>.C-.../9.
2b91 : __ __ __ BYT 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 : A/4.A/..A/).A/$.
2ba1 : __ __ __ BYT 52 08 00 08 01 08 02 08 03 08 04 08 07 28 4c 08 : R............(L.
2bb1 : __ __ __ BYT 78 29 4e 08 79 2a 4c 08 7a 2b 4e 08 7b 2c 22 08 : x)N.y*L.z+N.{,".
2bc1 : __ __ __ BYT 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f 31 81 41 2f : |/<...A/6.A/1.A/
2bd1 : __ __ __ BYT 2c 81 41 2f 26 81 41 2f 21 81 41 2f 1c 81 41 2f : ,.A/&.A/!.A/..A/
2be1 : __ __ __ BYT 16 81 45 08 04 08 07 08 7c 2f 48 08 7f 81 41 2f : ..E.....|/H...A/
2bf1 : __ __ __ BYT 42 81 41 2f 3d 81 41 2f 38 81 41 2f 32 81 41 2f : B.A/=.A/8.A/2.A/
2c01 : __ __ __ BYT 2d 81 41 2f 28 81 41 2f 22 81 55 08 00 08 01 08 : -.A/(.A/".U.....
2c11 : __ __ __ BYT 02 08 03 08 04 08 05 08 07 28 4e 08 78 29 4c 08 : .........(N.x)L.
2c21 : __ __ __ BYT 79 2a 4e 08 7a 2b 4c 08 7b 2c 15 08 7c 2d 39 08 : y*N.z+L.{,..|-9.
2c31 : __ __ __ BYT 7d 2f 3e 08 7f 81 42 2d 34 2f 39 81 42 2d 2e 2f : }/>...B-4/9.B-./
2c41 : __ __ __ BYT 34 81 42 2d 29 2f 2e 81 42 2d 24 2f 29 81 42 2d : 4.B-)/..B-$/).B-
2c51 : __ __ __ BYT 1e 2f 24 81 42 2d 19 2f 1e 81 42 2d 14 2f 19 81 : ./$.B-./..B-./..
2c61 : __ __ __ BYT 46 08 04 08 07 08 7c 2d 0e 2f 45 08 7f 81 42 2d : F.....|-./E...B-
2c71 : __ __ __ BYT 09 2f 40 81 42 2d 04 2f 3a 81 42 2d 00 2f 35 81 : ./@.B-./:.B-./5.
2c81 : __ __ __ BYT 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 : A/0.A/*.A/%.A/ .
2c91 : __ __ __ BYT 52 08 00 08 01 08 02 08 03 08 04 08 07 28 55 08 : R............(U.
2ca1 : __ __ __ BYT 78 29 4e 08 79 2a 55 08 7a 2b 4e 08 7b 2c 25 08 : x)N.y*U.z+N.{,%.
2cb1 : __ __ __ BYT 7c 2f 39 08 7f 81 41 2f 34 81 41 2f 2e 81 41 2f : |/9...A/4.A/..A/
2cc1 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f : ).A/$.A/..A/..A/
2cd1 : __ __ __ BYT 14 81 45 08 04 08 07 08 7c 2f 49 08 7f 81 41 2f : ..E.....|/I...A/
2ce1 : __ __ __ BYT 44 81 41 2f 3e 81 41 2f 39 81 41 2f 34 81 41 2f : D.A/>.A/9.A/4.A/
2cf1 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 58 08 00 08 01 08 : ..A/).A/$.X.....
2d01 : __ __ __ BYT 02 08 03 08 04 08 05 08 06 08 07 28 4e 08 78 29 : ...........(N.x)
2d11 : __ __ __ BYT 55 08 79 2a 4e 08 7a 2b 55 08 7b 2c 15 08 7c 2d : U.y*N.z+U.{,..|-
2d21 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 3c 08 7f 81 43 2d 34 2e : 9.}.9.~/<...C-4.
2d31 : __ __ __ BYT 34 2f 36 81 43 2d 2e 2e 2e 2f 31 81 43 2d 29 2e : 4/6.C-.../1.C-).
2d41 : __ __ __ BYT 29 2f 2c 81 43 2d 24 2e 24 2f 26 81 43 2d 1e 2e : )/,.C-$.$/&.C-..
2d51 : __ __ __ BYT 1e 2f 21 81 43 2d 19 2e 19 2f 1c 81 43 2d 14 2e : ./!.C-.../..C-..
2d61 : __ __ __ BYT 14 2f 16 81 47 08 04 08 07 08 7c 2d 0e 2e 0e 2f : ./..G.....|-.../
2d71 : __ __ __ BYT 48 08 7f 81 43 2d 09 2e 09 2f 42 81 43 2d 04 2e : H...C-.../B.C-..
2d81 : __ __ __ BYT 04 2f 3d 81 43 2d 00 2e 00 2f 38 81 41 2f 32 81 : ./=.C-.../8.A/2.
2d91 : __ __ __ BYT 41 2f 2d 81 41 2f 28 81 41 2f 22 81 4f 08 01 08 : A/-.A/(.A/".O...
2da1 : __ __ __ BYT 03 08 04 08 06 08 07 29 4e 08 79 2b 4e 08 7b 2c : .......)N.y+N.{,
2db1 : __ __ __ BYT 25 08 7c 2e 39 08 7e 2f 45 08 7f 81 42 2e 34 2f : %.|.9.~/E...B.4/
2dc1 : __ __ __ BYT 40 81 42 2e 2e 2f 3a 81 42 2e 29 2f 35 81 42 2e : @.B../:.B.)/5.B.
2dd1 : __ __ __ BYT 24 2f 30 81 42 2e 1e 2f 2a 81 42 2e 19 2f 25 81 : $/0.B../*.B../%.
2de1 : __ __ __ BYT 42 2e 14 2f 20 81 46 08 04 08 07 08 7c 2e 0e 2f : B../ .F.....|../
2df1 : __ __ __ BYT 3e 08 7f 81 42 2e 09 2f 39 81 42 2e 04 2f 34 81 : >...B../9.B../4.
2e01 : __ __ __ BYT 42 2e 00 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : B../..A/).A/$.A/
2e11 : __ __ __ BYT 1e 81 41 2f 19 81 4f 08 00 08 02 08 04 08 05 08 : ..A/..O.........
2e21 : __ __ __ BYT 07 28 5a 08 78 2a 5a 08 7a 2c 18 08 7c 2d 39 08 : .(Z.x*Z.z,..|-9.
2e31 : __ __ __ BYT 7d 2f 49 08 7f 81 42 2d 34 2f 44 81 42 2d 2e 2f : }/I...B-4/D.B-./
2e41 : __ __ __ BYT 3e 81 42 2d 29 2f 39 81 42 2d 24 2f 34 81 42 2d : >.B-)/9.B-$/4.B-
2e51 : __ __ __ BYT 1e 2f 2e 81 42 2d 19 2f 29 81 42 2d 14 2f 24 81 : ./..B-./).B-./$.
2e61 : __ __ __ BYT 4a 08 00 08 02 08 04 08 07 08 78 08 7a 08 7c 2d : J.........x.z.|-
2e71 : __ __ __ BYT 0e 2f 39 08 7f 81 42 2d 09 2f 34 81 42 2d 04 2f : ./9...B-./4.B-./
2e81 : __ __ __ BYT 2e 81 42 2d 00 2f 29 81 41 2f 24 81 41 2f 1e 81 : ..B-./).A/$.A/..
2e91 : __ __ __ BYT 41 2f 19 81 41 2f 14 81 4c 08 01 08 03 08 04 08 : A/..A/..L.......
2ea1 : __ __ __ BYT 07 29 5a 08 79 2b 5a 08 7b 2c 28 08 7c 2f 45 08 : .)Z.y+Z.{,(.|/E.
2eb1 : __ __ __ BYT 7f 81 41 2f 40 81 41 2f 3a 81 41 2f 35 81 41 2f : ..A/@.A/:.A/5.A/
2ec1 : __ __ __ BYT 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 49 08 : 0.A/*.A/%.A/ .I.
2ed1 : __ __ __ BYT 01 08 03 08 04 08 07 08 79 08 7b 08 7c 2f 48 08 : ........y.{.|/H.
2ee1 : __ __ __ BYT 7f 81 41 2f 42 81 41 2f 3d 81 41 2f 38 81 41 2f : ..A/B.A/=.A/8.A/
2ef1 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 50 08 : 2.A/-.A/(.A/".P.
2f01 : __ __ __ BYT 00 08 02 08 04 08 05 08 06 08 07 08 78 08 7a 2c : ............x.z,
2f11 : __ __ __ BYT 18 08 7c 2d 39 08 7d 2e 39 08 7e 2f 3c 08 7f 81 : ..|-9.}.9.~/<...
2f21 : __ __ __ BYT 43 2d 34 2e 34 2f 36 81 43 2d 2e 2e 2e 2f 31 81 : C-4.4/6.C-.../1.
2f31 : __ __ __ BYT 43 2d 29 2e 29 2f 2c 81 43 2d 24 2e 24 2f 26 81 : C-).)/,.C-$.$/&.
2f41 : __ __ __ BYT 43 2d 1e 2e 1e 2f 21 81 43 2d 19 2e 19 2f 1c 81 : C-.../!.C-.../..
2f51 : __ __ __ BYT 43 2d 14 2e 14 2f 16 81 4b 08 00 08 02 08 04 08 : C-.../..K.......
2f61 : __ __ __ BYT 07 08 78 08 7a 08 7c 2d 0e 2e 0e 2f 49 08 7f 81 : ..x.z.|-.../I...
2f71 : __ __ __ BYT 43 2d 09 2e 09 2f 44 81 43 2d 04 2e 04 2f 3e 81 : C-.../D.C-.../>.
2f81 : __ __ __ BYT 43 2d 00 2e 00 2f 39 81 41 2f 34 81 41 2f 2e 81 : C-.../9.A/4.A/..
2f91 : __ __ __ BYT 41 2f 29 81 41 2f 24 81 4a 08 01 08 03 08 04 08 : A/).A/$.J.......
2fa1 : __ __ __ BYT 07 08 79 08 7b 2c 28 08 7c 2f 3e 08 7f 81 41 2f : ..y.{,(.|/>...A/
2fb1 : __ __ __ BYT 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f : 9.A/4.A/..A/).A/
2fc1 : __ __ __ BYT 24 81 41 2f 1e 81 41 2f 19 81 49 08 01 08 03 08 : $.A/..A/..I.....
2fd1 : __ __ __ BYT 04 08 07 08 79 08 7b 08 7c 2f 4c 08 7f 81 41 2f : ....y.{.|/L...A/
2fe1 : __ __ __ BYT 46 81 41 2f 41 81 41 2f 3c 81 41 2f 36 81 41 2f : F.A/A.A/<.A/6.A/
2ff1 : __ __ __ BYT 31 81 41 2f 2c 81 41 2f 26 81 4d 08 00 08 02 08 : 1.A/,.A/&.M.....
3001 : __ __ __ BYT 04 08 05 08 07 08 78 08 7a 2c 15 08 7c 2d 39 08 : ......x.z,..|-9.
3011 : __ __ __ BYT 7d 2f 48 08 7f 81 42 2d 34 2f 42 81 42 2d 2e 2f : }/H...B-4/B.B-./
3021 : __ __ __ BYT 3d 81 42 2d 29 2f 38 81 42 2d 24 2f 32 81 42 2d : =.B-)/8.B-$/2.B-
3031 : __ __ __ BYT 1e 2f 2d 81 42 2d 19 2f 28 81 42 2d 14 2f 22 81 : ./-.B-./(.B-./".
3041 : __ __ __ BYT 4a 08 00 08 02 08 04 08 07 08 78 08 7a 08 7c 2d : J.........x.z.|-
3051 : __ __ __ BYT 0e 2f 45 08 7f 81 42 2d 09 2f 40 81 42 2d 04 2f : ./E...B-./@.B-./
3061 : __ __ __ BYT 3a 81 42 2d 00 2f 35 81 41 2f 30 81 41 2f 2a 81 : :.B-./5.A/0.A/*.
3071 : __ __ __ BYT 41 2f 25 81 41 2f 20 81 4a 08 01 08 03 08 04 08 : A/%.A/ .J.......
3081 : __ __ __ BYT 07 08 79 08 7b 2c 25 08 7c 2f 39 08 7f 81 41 2f : ..y.{,%.|/9...A/
3091 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
30a1 : __ __ __ BYT 1e 81 41 2f 19 81 41 2f 14 81 49 08 01 08 03 08 : ..A/..A/..I.....
30b1 : __ __ __ BYT 04 08 07 08 79 08 7b 08 7c 2f 4c 08 7f 81 41 2f : ....y.{.|/L...A/
30c1 : __ __ __ BYT 46 81 41 2f 41 81 41 2f 3c 81 41 2f 36 81 41 2f : F.A/A.A/<.A/6.A/
30d1 : __ __ __ BYT 31 81 41 2f 2c 81 41 2f 26 81 50 08 00 08 02 08 : 1.A/,.A/&.P.....
30e1 : __ __ __ BYT 04 08 05 08 06 08 07 08 78 08 7a 2c 15 08 7c 2d : ........x.z,..|-
30f1 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 3c 08 7f 81 43 2d 34 2e : 9.}.9.~/<...C-4.
3101 : __ __ __ BYT 34 2f 36 81 43 2d 2e 2e 2e 2f 31 81 43 2d 29 2e : 4/6.C-.../1.C-).
3111 : __ __ __ BYT 29 2f 2c 81 43 2d 24 2e 24 2f 26 81 43 2d 1e 2e : )/,.C-$.$/&.C-..
3121 : __ __ __ BYT 1e 2f 21 81 43 2d 19 2e 19 2f 1c 81 43 2d 14 2e : ./!.C-.../..C-..
3131 : __ __ __ BYT 14 2f 16 81 4d 08 00 08 02 08 04 08 07 28 58 08 : ./..M........(X.
3141 : __ __ __ BYT 78 2a 58 08 7a 08 7c 2d 0e 2e 0e 2f 49 08 7f 81 : x*X.z.|-.../I...
3151 : __ __ __ BYT 43 2d 09 2e 09 2f 44 81 43 2d 04 2e 04 2f 3e 81 : C-.../D.C-.../>.
3161 : __ __ __ BYT 43 2d 00 2e 00 2f 39 81 41 2f 34 81 41 2f 2e 81 : C-.../9.A/4.A/..
3171 : __ __ __ BYT 41 2f 29 81 41 2f 24 81 50 08 00 08 01 08 02 08 : A/).A/$.P.......
3181 : __ __ __ BYT 03 08 04 08 07 28 55 08 78 08 79 2a 55 08 7a 08 : .....(U.x.y*U.z.
3191 : __ __ __ BYT 7b 2c 25 08 7c 2f 48 08 7f 81 41 2f 42 81 41 2f : {,%.|/H...A/B.A/
31a1 : __ __ __ BYT 3d 81 41 2f 38 81 41 2f 32 81 41 2f 2d 81 41 2f : =.A/8.A/2.A/-.A/
31b1 : __ __ __ BYT 28 81 41 2f 22 81 51 08 00 08 01 08 02 08 03 08 : (.A/".Q.........
31c1 : __ __ __ BYT 04 08 07 28 4e 08 78 29 58 08 79 2a 4e 08 7a 2b : ...(N.x)X.y*N.z+
31d1 : __ __ __ BYT 58 08 7b 08 7c 2f 3e 08 7f 81 41 2f 39 81 41 2f : X.{.|/>...A/9.A/
31e1 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
31f1 : __ __ __ BYT 1e 81 41 2f 19 81 55 08 00 08 01 08 02 08 03 08 : ..A/..U.........
3201 : __ __ __ BYT 04 08 05 08 07 28 51 08 78 29 55 08 79 2a 51 08 : .....(Q.x)U.y*Q.
3211 : __ __ __ BYT 7a 2b 55 08 7b 2c 12 08 7c 2d 39 08 7d 2f 45 08 : z+U.{,..|-9.}/E.
3221 : __ __ __ BYT 7f 81 42 2d 34 2f 40 81 42 2d 2e 2f 3a 81 42 2d : ..B-4/@.B-./:.B-
3231 : __ __ __ BYT 29 2f 35 81 42 2d 24 2f 30 81 42 2d 1e 2f 2a 81 : )/5.B-$/0.B-./*.
3241 : __ __ __ BYT 42 2d 19 2f 25 81 42 2d 14 2f 20 81 4c 08 01 08 : B-./%.B-./ .L...
3251 : __ __ __ BYT 03 08 04 08 07 29 4e 08 79 2b 4e 08 7b 08 7c 2d : .....)N.y+N.{.|-
3261 : __ __ __ BYT 0e 2f 39 08 7f 81 42 2d 09 2f 34 81 42 2d 04 2f : ./9...B-./4.B-./
3271 : __ __ __ BYT 2e 81 42 2d 00 2f 29 81 41 2f 24 81 41 2f 1e 81 : ..B-./).A/$.A/..
3281 : __ __ __ BYT 41 2f 19 81 41 2f 14 81 4c 08 01 08 03 08 04 08 : A/..A/..L.......
3291 : __ __ __ BYT 07 29 51 08 79 2b 51 08 7b 2c 22 08 7c 2f 49 08 : .)Q.y+Q.{,".|/I.
32a1 : __ __ __ BYT 7f 81 41 2f 44 81 41 2f 3e 81 41 2f 39 81 41 2f : ..A/D.A/>.A/9.A/
32b1 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 45 08 : 4.A/..A/).A/$.E.
32c1 : __ __ __ BYT 04 08 07 08 7c 2f 4c 08 7f 81 41 2f 46 81 41 2f : ....|/L...A/F.A/
32d1 : __ __ __ BYT 41 81 41 2f 3c 81 41 2f 36 81 41 2f 31 81 41 2f : A.A/<.A/6.A/1.A/
32e1 : __ __ __ BYT 2c 81 41 2f 26 81 4c 08 04 08 05 08 06 08 07 2c : ,.A/&.L........,
32f1 : __ __ __ BYT 12 08 7c 2d 39 08 7d 2e 39 08 7e 2f 48 08 7f 81 : ..|-9.}.9.~/H...
3301 : __ __ __ BYT 43 2d 34 2e 34 2f 42 81 43 2d 2e 2e 2e 2f 3d 81 : C-4.4/B.C-.../=.
3311 : __ __ __ BYT 43 2d 29 2e 29 2f 38 81 43 2d 24 2e 24 2f 32 81 : C-).)/8.C-$.$/2.
3321 : __ __ __ BYT 43 2d 1e 2e 1e 2f 2d 81 43 2d 19 2e 19 2f 28 81 : C-.../-.C-.../(.
3331 : __ __ __ BYT 43 2d 14 2e 14 2f 22 81 47 08 04 08 07 08 7c 2d : C-.../".G.....|-
3341 : __ __ __ BYT 0e 2e 0e 2f 45 08 7f 81 43 2d 09 2e 09 2f 40 81 : .../E...C-.../@.
3351 : __ __ __ BYT 43 2d 04 2e 04 2f 3a 81 43 2d 00 2e 00 2f 35 81 : C-.../:.C-.../5.
3361 : __ __ __ BYT 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 : A/0.A/*.A/%.A/ .
3371 : __ __ __ BYT 46 08 04 08 07 2c 22 08 7c 2f 3e 08 7f 81 41 2f : F....,".|/>...A/
3381 : __ __ __ BYT 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f : 9.A/4.A/..A/).A/
3391 : __ __ __ BYT 24 81 41 2f 1e 81 41 2f 19 81 45 08 04 08 07 08 : $.A/..A/..E.....
33a1 : __ __ __ BYT 7c 2f 39 08 7f 81 41 2f 34 81 41 2f 2e 81 41 2f : |/9...A/4.A/..A/
33b1 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f : ).A/$.A/..A/..A/
33c1 : __ __ __ BYT 14 81 49 08 04 08 05 08 07 2c 11 08 7c 2d 39 08 : ..I......,..|-9.
33d1 : __ __ __ BYT 7d 2f 4c 08 7f 81 42 2d 34 2f 46 81 42 2d 2e 2f : }/L...B-4/F.B-./
33e1 : __ __ __ BYT 41 81 42 2d 29 2f 3c 81 42 2d 24 2f 36 81 42 2d : A.B-)/<.B-$/6.B-
33f1 : __ __ __ BYT 1e 2f 31 81 42 2d 19 2f 2c 81 42 2d 14 2f 26 81 : ./1.B-./,.B-./&.
3401 : __ __ __ BYT 46 08 04 08 07 08 7c 2d 0e 2f 49 08 7f 81 42 2d : F.....|-./I...B-
3411 : __ __ __ BYT 09 2f 44 81 42 2d 04 2f 3e 81 42 2d 00 2f 39 81 : ./D.B-./>.B-./9.
3421 : __ __ __ BYT 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 : A/4.A/..A/).A/$.
3431 : __ __ __ BYT 46 08 04 08 07 2c 21 08 7c 2f 3c 08 7f 81 41 2f : F....,!.|/<...A/
3441 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 41 2f : 6.A/1.A/,.A/&.A/
3451 : __ __ __ BYT 21 81 41 2f 1c 81 41 2f 16 81 45 08 04 08 07 08 : !.A/..A/..E.....
3461 : __ __ __ BYT 7c 2f 48 08 7f 81 41 2f 42 81 41 2f 3d 81 41 2f : |/H...A/B.A/=.A/
3471 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
3481 : __ __ __ BYT 22 81 4c 08 04 08 05 08 06 08 07 2c 11 08 7c 2d : ".L........,..|-
3491 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 3e 08 7f 81 43 2d 34 2e : 9.}.9.~/>...C-4.
34a1 : __ __ __ BYT 34 2f 39 81 43 2d 2e 2e 2e 2f 34 81 43 2d 29 2e : 4/9.C-.../4.C-).
34b1 : __ __ __ BYT 29 2f 2e 81 43 2d 24 2e 24 2f 29 81 43 2d 1e 2e : )/..C-$.$/).C-..
34c1 : __ __ __ BYT 1e 2f 24 81 43 2d 19 2e 19 2f 1e 81 43 2d 14 2e : ./$.C-.../..C-..
34d1 : __ __ __ BYT 14 2f 19 81 47 08 04 08 07 08 7c 2d 0e 2e 0e 2f : ./..G.....|-.../
34e1 : __ __ __ BYT 45 08 7f 81 43 2d 09 2e 09 2f 40 81 43 2d 04 2e : E...C-.../@.C-..
34f1 : __ __ __ BYT 04 2f 3a 81 43 2d 00 2e 00 2f 35 81 41 2f 30 81 : ./:.C-.../5.A/0.
3501 : __ __ __ BYT 41 2f 2a 81 41 2f 25 81 41 2f 20 81 46 08 04 08 : A/*.A/%.A/ .F...
3511 : __ __ __ BYT 07 2c 21 08 7c 2f 40 08 7f 81 41 2f 3a 81 41 2f : .,!.|/@...A/:.A/
3521 : __ __ __ BYT 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f : 5.A/0.A/*.A/%.A/
3531 : __ __ __ BYT 20 81 41 2f 1a 81 45 08 04 08 07 08 7c 2f 4c 08 :  .A/..E.....|/L.
3541 : __ __ __ BYT 7f 81 41 2f 46 81 41 2f 41 81 41 2f 3c 81 41 2f : ..A/F.A/A.A/<.A/
3551 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 4f 08 : 6.A/1.A/,.A/&.O.
3561 : __ __ __ BYT 00 08 02 08 04 08 05 08 07 28 5a 08 78 2a 5a 08 : .........(Z.x*Z.
3571 : __ __ __ BYT 7a 2c 18 08 7c 2d 39 08 7d 2f 39 08 7f 81 42 2d : z,..|-9.}/9...B-
3581 : __ __ __ BYT 34 2f 34 81 42 2d 2e 2f 2e 81 42 2d 29 2f 29 81 : 4/4.B-./..B-)/).
3591 : __ __ __ BYT 42 2d 24 2f 24 81 42 2d 1e 2f 1e 81 42 2d 19 2f : B-$/$.B-./..B-./
35a1 : __ __ __ BYT 19 81 42 2d 14 2f 14 81 4a 08 00 08 02 08 04 08 : ..B-./..J.......
35b1 : __ __ __ BYT 07 08 78 08 7a 08 7c 2d 0e 2f 49 08 7f 81 42 2d : ..x.z.|-./I...B-
35c1 : __ __ __ BYT 09 2f 44 81 42 2d 04 2f 3e 81 42 2d 00 2f 39 81 : ./D.B-./>.B-./9.
35d1 : __ __ __ BYT 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 : A/4.A/..A/).A/$.
35e1 : __ __ __ BYT 4c 08 01 08 03 08 04 08 07 29 5a 08 79 2b 5a 08 : L........)Z.y+Z.
35f1 : __ __ __ BYT 7b 2c 28 08 7c 2f 48 08 7f 81 41 2f 42 81 41 2f : {,(.|/H...A/B.A/
3601 : __ __ __ BYT 3d 81 41 2f 38 81 41 2f 32 81 41 2f 2d 81 41 2f : =.A/8.A/2.A/-.A/
3611 : __ __ __ BYT 28 81 41 2f 22 81 49 08 01 08 03 08 04 08 07 08 : (.A/".I.........
3621 : __ __ __ BYT 79 08 7b 08 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f : y.{.|/<...A/6.A/
3631 : __ __ __ BYT 31 81 41 2f 2c 81 41 2f 26 81 41 2f 21 81 41 2f : 1.A/,.A/&.A/!.A/
3641 : __ __ __ BYT 1c 81 41 2f 16 81 50 08 00 08 02 08 04 08 05 08 : ..A/..P.........
3651 : __ __ __ BYT 06 08 07 08 78 08 7a 2c 18 08 7c 2d 39 08 7d 2e : ....x.z,..|-9.}.
3661 : __ __ __ BYT 39 08 7e 2f 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 : 9.~/>...C-4.4/9.
3671 : __ __ __ BYT 43 2d 2e 2e 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 : C-.../4.C-).)/..
3681 : __ __ __ BYT 43 2d 24 2e 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 : C-$.$/).C-.../$.
3691 : __ __ __ BYT 43 2d 19 2e 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 : C-.../..C-.../..
36a1 : __ __ __ BYT 4b 08 00 08 02 08 04 08 07 08 78 08 7a 08 7c 2d : K.........x.z.|-
36b1 : __ __ __ BYT 0e 2e 0e 2f 45 08 7f 81 43 2d 09 2e 09 2f 40 81 : .../E...C-.../@.
36c1 : __ __ __ BYT 43 2d 04 2e 04 2f 3a 81 43 2d 00 2e 00 2f 35 81 : C-.../:.C-.../5.
36d1 : __ __ __ BYT 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 : A/0.A/*.A/%.A/ .
36e1 : __ __ __ BYT 4a 08 01 08 03 08 04 08 07 08 79 08 7b 2c 28 08 : J.........y.{,(.
36f1 : __ __ __ BYT 7c 2f 40 08 7f 81 41 2f 3a 81 41 2f 35 81 41 2f : |/@...A/:.A/5.A/
3701 : __ __ __ BYT 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 41 2f : 0.A/*.A/%.A/ .A/
3711 : __ __ __ BYT 1a 81 49 08 01 08 03 08 04 08 07 08 79 08 7b 08 : ..I.........y.{.
3721 : __ __ __ BYT 7c 2f 39 08 7f 81 41 2f 34 81 41 2f 2e 81 41 2f : |/9...A/4.A/..A/
3731 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f : ).A/$.A/..A/..A/
3741 : __ __ __ BYT 14 81 4d 08 00 08 02 08 04 08 05 08 07 08 78 08 : ..M...........x.
3751 : __ __ __ BYT 7a 2c 15 08 7c 2d 39 08 7d 2f 4c 08 7f 81 42 2d : z,..|-9.}/L...B-
3761 : __ __ __ BYT 34 2f 46 81 42 2d 2e 2f 41 81 42 2d 29 2f 3c 81 : 4/F.B-./A.B-)/<.
3771 : __ __ __ BYT 42 2d 24 2f 36 81 42 2d 1e 2f 31 81 42 2d 19 2f : B-$/6.B-./1.B-./
3781 : __ __ __ BYT 2c 81 42 2d 14 2f 26 81 4a 08 00 08 02 08 04 08 : ,.B-./&.J.......
3791 : __ __ __ BYT 07 08 78 08 7a 08 7c 2d 0e 2f 49 08 7f 81 42 2d : ..x.z.|-./I...B-
37a1 : __ __ __ BYT 09 2f 44 81 42 2d 04 2f 3e 81 42 2d 00 2f 39 81 : ./D.B-./>.B-./9.
37b1 : __ __ __ BYT 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 : A/4.A/..A/).A/$.
37c1 : __ __ __ BYT 4a 08 01 08 03 08 04 08 07 08 79 08 7b 2c 25 08 : J.........y.{,%.
37d1 : __ __ __ BYT 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f 31 81 41 2f : |/<...A/6.A/1.A/
37e1 : __ __ __ BYT 2c 81 41 2f 26 81 41 2f 21 81 41 2f 1c 81 41 2f : ,.A/&.A/!.A/..A/
37f1 : __ __ __ BYT 16 81 49 08 01 08 03 08 04 08 07 08 79 08 7b 08 : ..I.........y.{.
3801 : __ __ __ BYT 7c 2f 48 08 7f 81 41 2f 42 81 41 2f 3d 81 41 2f : |/H...A/B.A/=.A/
3811 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
3821 : __ __ __ BYT 22 81 50 08 00 08 02 08 04 08 05 08 06 08 07 08 : ".P.............
3831 : __ __ __ BYT 78 08 7a 2c 15 08 7c 2d 39 08 7d 2e 39 08 7e 2f : x.z,..|-9.}.9.~/
3841 : __ __ __ BYT 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 43 2d 2e 2e : >...C-4.4/9.C-..
3851 : __ __ __ BYT 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 43 2d 24 2e : ./4.C-).)/..C-$.
3861 : __ __ __ BYT 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 43 2d 19 2e : $/).C-.../$.C-..
3871 : __ __ __ BYT 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 4d 08 00 08 : ./..C-.../..M...
3881 : __ __ __ BYT 02 08 04 08 07 28 58 08 78 2a 58 08 7a 08 7c 2d : .....(X.x*X.z.|-
3891 : __ __ __ BYT 0e 2e 0e 2f 45 08 7f 81 43 2d 09 2e 09 2f 40 81 : .../E...C-.../@.
38a1 : __ __ __ BYT 43 2d 04 2e 04 2f 3a 81 43 2d 00 2e 00 2f 35 81 : C-.../:.C-.../5.
38b1 : __ __ __ BYT 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 : A/0.A/*.A/%.A/ .
38c1 : __ __ __ BYT 50 08 00 08 01 08 02 08 03 08 04 08 07 28 55 08 : P............(U.
38d1 : __ __ __ BYT 78 08 79 2a 55 08 7a 08 7b 2c 25 08 7c 2f 40 08 : x.y*U.z.{,%.|/@.
38e1 : __ __ __ BYT 7f 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : ..A/:.A/5.A/0.A/
38f1 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 41 2f 1a 81 51 08 : *.A/%.A/ .A/..Q.
3901 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 07 28 4e 08 78 29 : ...........(N.x)
3911 : __ __ __ BYT 58 08 79 2a 4e 08 7a 2b 58 08 7b 08 7c 2f 4c 08 : X.y*N.z+X.{.|/L.
3921 : __ __ __ BYT 7f 81 41 2f 46 81 41 2f 41 81 41 2f 3c 81 41 2f : ..A/F.A/A.A/<.A/
3931 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 55 08 : 6.A/1.A/,.A/&.U.
3941 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 07 28 51 08 : .............(Q.
3951 : __ __ __ BYT 78 29 55 08 79 2a 51 08 7a 2b 55 08 7b 2c 12 08 : x)U.y*Q.z+U.{,..
3961 : __ __ __ BYT 7c 2d 39 08 7d 2f 49 08 7f 81 42 2d 34 2f 44 81 : |-9.}/I...B-4/D.
3971 : __ __ __ BYT 42 2d 2e 2f 3e 81 42 2d 29 2f 39 81 42 2d 24 2f : B-./>.B-)/9.B-$/
3981 : __ __ __ BYT 34 81 42 2d 1e 2f 2e 81 42 2d 19 2f 29 81 42 2d : 4.B-./..B-./).B-
3991 : __ __ __ BYT 14 2f 24 81 4c 08 01 08 03 08 04 08 07 29 4e 08 : ./$.L........)N.
39a1 : __ __ __ BYT 79 2b 4e 08 7b 08 7c 2d 0e 2f 39 08 7f 81 42 2d : y+N.{.|-./9...B-
39b1 : __ __ __ BYT 09 2f 34 81 42 2d 04 2f 2e 81 42 2d 00 2f 29 81 : ./4.B-./..B-./).
39c1 : __ __ __ BYT 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f 14 81 : A/$.A/..A/..A/..
39d1 : __ __ __ BYT 4c 08 01 08 03 08 04 08 07 29 51 08 79 2b 51 08 : L........)Q.y+Q.
39e1 : __ __ __ BYT 7b 2c 22 08 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f : {,".|/<...A/6.A/
39f1 : __ __ __ BYT 31 81 41 2f 2c 81 41 2f 26 81 41 2f 21 81 41 2f : 1.A/,.A/&.A/!.A/
3a01 : __ __ __ BYT 1c 81 41 2f 16 81 45 08 04 08 07 08 7c 2f 48 08 : ..A/..E.....|/H.
3a11 : __ __ __ BYT 7f 81 41 2f 42 81 41 2f 3d 81 41 2f 38 81 41 2f : ..A/B.A/=.A/8.A/
3a21 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 4c 08 : 2.A/-.A/(.A/".L.
3a31 : __ __ __ BYT 04 08 05 08 06 08 07 2c 12 08 7c 2d 39 08 7d 2e : .......,..|-9.}.
3a41 : __ __ __ BYT 39 08 7e 2f 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 : 9.~/>...C-4.4/9.
3a51 : __ __ __ BYT 43 2d 2e 2e 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 : C-.../4.C-).)/..
3a61 : __ __ __ BYT 43 2d 24 2e 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 : C-$.$/).C-.../$.
3a71 : __ __ __ BYT 43 2d 19 2e 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 : C-.../..C-.../..
3a81 : __ __ __ BYT 47 08 04 08 07 08 7c 2d 0e 2e 0e 2f 45 08 7f 81 : G.....|-.../E...
3a91 : __ __ __ BYT 43 2d 09 2e 09 2f 40 81 43 2d 04 2e 04 2f 3a 81 : C-.../@.C-.../:.
3aa1 : __ __ __ BYT 43 2d 00 2e 00 2f 35 81 41 2f 30 81 41 2f 2a 81 : C-.../5.A/0.A/*.
3ab1 : __ __ __ BYT 41 2f 25 81 41 2f 20 81 46 08 04 08 07 2c 22 08 : A/%.A/ .F....,".
3ac1 : __ __ __ BYT 7c 2f 40 08 7f 81 41 2f 3a 81 41 2f 35 81 41 2f : |/@...A/:.A/5.A/
3ad1 : __ __ __ BYT 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 41 2f : 0.A/*.A/%.A/ .A/
3ae1 : __ __ __ BYT 1a 81 45 08 04 08 07 08 7c 2f 49 08 7f 81 41 2f : ..E.....|/I...A/
3af1 : __ __ __ BYT 44 81 41 2f 3e 81 41 2f 39 81 41 2f 34 81 41 2f : D.A/>.A/9.A/4.A/
3b01 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 49 08 04 08 05 08 : ..A/).A/$.I.....
3b11 : __ __ __ BYT 07 2c 11 08 7c 2d 39 08 7d 2f 4c 08 7f 81 42 2d : .,..|-9.}/L...B-
3b21 : __ __ __ BYT 34 2f 46 81 42 2d 2e 2f 41 81 42 2d 29 2f 3c 81 : 4/F.B-./A.B-)/<.
3b31 : __ __ __ BYT 42 2d 24 2f 36 81 42 2d 1e 2f 31 81 42 2d 19 2f : B-$/6.B-./1.B-./
3b41 : __ __ __ BYT 2c 81 42 2d 14 2f 26 81 49 08 04 08 06 08 07 08 : ,.B-./&.I.......
3b51 : __ __ __ BYT 7c 2d 0e 2e 39 08 7e 2f 39 08 7f 81 43 2d 09 2e : |-..9.~/9...C-..
3b61 : __ __ __ BYT 34 2f 34 81 43 2d 04 2e 2e 2f 2e 81 43 2d 00 2e : 4/4.C-.../..C-..
3b71 : __ __ __ BYT 29 2f 29 81 42 2e 24 2f 24 81 42 2e 1e 2f 1e 81 : )/).B.$/$.B../..
3b81 : __ __ __ BYT 42 2e 19 2f 19 81 42 2e 14 2f 14 81 47 08 04 08 : B../..B../..G...
3b91 : __ __ __ BYT 07 2c 21 08 7c 2e 0e 2f 3c 08 7f 81 42 2e 09 2f : .,!.|../<...B../
3ba1 : __ __ __ BYT 36 81 42 2e 04 2f 31 81 42 2e 00 2f 2c 81 41 2f : 6.B../1.B../,.A/
3bb1 : __ __ __ BYT 26 81 41 2f 21 81 41 2f 1c 81 41 2f 16 81 48 08 : &.A/!.A/..A/..H.
3bc1 : __ __ __ BYT 04 08 06 08 07 08 7c 2e 39 08 7e 2f 48 08 7f 81 : ......|.9.~/H...
3bd1 : __ __ __ BYT 42 2e 34 2f 42 81 42 2e 2e 2f 3d 81 42 2e 29 2f : B.4/B.B../=.B.)/
3be1 : __ __ __ BYT 38 81 42 2e 24 2f 32 81 42 2e 1e 2f 2d 81 42 2e : 8.B.$/2.B../-.B.
3bf1 : __ __ __ BYT 19 2f 28 81 42 2e 14 2f 22 81 4c 08 04 08 05 08 : ./(.B../".L.....
3c01 : __ __ __ BYT 06 08 07 2c 11 08 7c 2d 39 08 7d 2e 39 08 7e 2f : ...,..|-9.}.9.~/
3c11 : __ __ __ BYT 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 43 2d 2e 2e : >...C-4.4/9.C-..
3c21 : __ __ __ BYT 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 43 2d 24 2e : ./4.C-).)/..C-$.
3c31 : __ __ __ BYT 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 43 2d 19 2e : $/).C-.../$.C-..
3c41 : __ __ __ BYT 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 47 08 04 08 : ./..C-.../..G...
3c51 : __ __ __ BYT 07 08 7c 2d 0e 2e 0e 2f 45 08 7f 81 43 2d 09 2e : ..|-.../E...C-..
3c61 : __ __ __ BYT 09 2f 40 81 43 2d 04 2e 04 2f 3a 81 43 2d 00 2e : ./@.C-.../:.C-..
3c71 : __ __ __ BYT 00 2f 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 : ./5.A/0.A/*.A/%.
3c81 : __ __ __ BYT 41 2f 20 81 49 08 04 08 06 08 07 2c 21 08 7c 2e : A/ .I......,!.|.
3c91 : __ __ __ BYT 39 08 7e 2f 40 08 7f 81 42 2e 34 2f 3a 81 42 2e : 9.~/@...B.4/:.B.
3ca1 : __ __ __ BYT 2e 2f 35 81 42 2e 29 2f 30 81 42 2e 24 2f 2a 81 : ./5.B.)/0.B.$/*.
3cb1 : __ __ __ BYT 42 2e 1e 2f 25 81 42 2e 19 2f 20 81 42 2e 14 2f : B../%.B../ .B../
3cc1 : __ __ __ BYT 1a 81 46 08 04 08 07 08 7c 2e 0e 2f 45 08 7f 81 : ..F.....|../E...
3cd1 : __ __ __ BYT 42 2e 09 2f 40 81 42 2e 04 2f 3a 81 42 2e 00 2f : B../@.B../:.B../
3ce1 : __ __ __ BYT 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f : 5.A/0.A/*.A/%.A/
3cf1 : __ __ __ BYT 20 81 4f 08 00 08 02 08 04 08 05 08 07 28 48 08 :  .O..........(H.
3d01 : __ __ __ BYT 78 2a 48 08 7a 2c 18 08 7c 2d 39 08 7d 2f 39 08 : x*H.z,..|-9.}/9.
3d11 : __ __ __ BYT 7f 81 42 2d 34 2f 34 81 42 2d 2e 2f 2e 81 42 2d : ..B-4/4.B-./..B-
3d21 : __ __ __ BYT 29 2f 29 81 42 2d 24 2f 24 81 42 2d 1e 2f 1e 81 : )/).B-$/$.B-./..
3d31 : __ __ __ BYT 42 2d 19 2f 19 81 42 2d 14 2f 14 81 46 08 04 08 : B-./..B-./..F...
3d41 : __ __ __ BYT 07 08 7c 2d 0e 2f 3d 08 7f 81 42 2d 09 2f 38 81 : ..|-./=...B-./8.
3d51 : __ __ __ BYT 42 2d 04 2f 32 81 42 2d 00 2f 2d 81 41 2f 28 81 : B-./2.B-./-.A/(.
3d61 : __ __ __ BYT 41 2f 22 81 41 2f 1d 81 41 2f 18 81 52 08 00 08 : A/".A/..A/..R...
3d71 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 4a 08 78 29 48 08 : .........(J.x)H.
3d81 : __ __ __ BYT 79 2a 4a 08 7a 2b 48 08 7b 2c 28 08 7c 2f 42 08 : y*J.z+H.{,(.|/B.
3d91 : __ __ __ BYT 7f 81 41 2f 3d 81 41 2f 38 81 41 2f 32 81 41 2f : ..A/=.A/8.A/2.A/
3da1 : __ __ __ BYT 2d 81 41 2f 28 81 41 2f 22 81 41 2f 1d 81 4b 08 : -.A/(.A/".A/..K.
3db1 : __ __ __ BYT 00 08 02 08 04 08 07 28 4c 08 78 2a 4c 08 7a 08 : .......(L.x*L.z.
3dc1 : __ __ __ BYT 7c 2f 39 08 7f 81 41 2f 34 81 41 2f 2e 81 41 2f : |/9...A/4.A/..A/
3dd1 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f : ).A/$.A/..A/..A/
3de1 : __ __ __ BYT 14 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 : ..X.............
3df1 : __ __ __ BYT 06 08 07 28 4a 08 78 29 4a 08 79 2a 4a 08 7a 2b : ...(J.x)J.y*J.z+
3e01 : __ __ __ BYT 4a 08 7b 2c 18 08 7c 2d 39 08 7d 2e 39 08 7e 2f : J.{,..|-9.}.9.~/
3e11 : __ __ __ BYT 3d 08 7f 81 43 2d 34 2e 34 2f 38 81 43 2d 2e 2e : =...C-4.4/8.C-..
3e21 : __ __ __ BYT 2e 2f 32 81 43 2d 29 2e 29 2f 2d 81 43 2d 24 2e : ./2.C-).)/-.C-$.
3e31 : __ __ __ BYT 24 2f 28 81 43 2d 1e 2e 1e 2f 22 81 43 2d 19 2e : $/(.C-.../".C-..
3e41 : __ __ __ BYT 19 2f 1d 81 43 2d 14 2e 14 2f 18 81 4d 08 01 08 : ./..C-.../..M...
3e51 : __ __ __ BYT 03 08 04 08 07 29 4c 08 79 2b 4c 08 7b 08 7c 2d : .....)L.y+L.{.|-
3e61 : __ __ __ BYT 0e 2e 0e 2f 42 08 7f 81 43 2d 09 2e 09 2f 3d 81 : .../B...C-.../=.
3e71 : __ __ __ BYT 43 2d 04 2e 04 2f 38 81 43 2d 00 2e 00 2f 32 81 : C-.../8.C-.../2.
3e81 : __ __ __ BYT 41 2f 2d 81 41 2f 28 81 41 2f 22 81 41 2f 1d 81 : A/-.A/(.A/".A/..
3e91 : __ __ __ BYT 52 08 00 08 01 08 02 08 03 08 04 08 07 28 48 08 : R............(H.
3ea1 : __ __ __ BYT 78 29 4a 08 79 2a 48 08 7a 2b 4a 08 7b 2c 28 08 : x)J.y*H.z+J.{,(.
3eb1 : __ __ __ BYT 7c 2f 39 08 7f 81 41 2f 34 81 41 2f 2e 81 41 2f : |/9...A/4.A/..A/
3ec1 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f : ).A/$.A/..A/..A/
3ed1 : __ __ __ BYT 14 81 45 08 04 08 07 08 7c 2f 3d 08 7f 81 41 2f : ..E.....|/=...A/
3ee1 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
3ef1 : __ __ __ BYT 22 81 41 2f 1d 81 41 2f 18 81 55 08 00 08 01 08 : ".A/..A/..U.....
3f01 : __ __ __ BYT 02 08 03 08 04 08 05 08 07 28 4a 08 78 29 48 08 : .........(J.x)H.
3f11 : __ __ __ BYT 79 2a 4a 08 7a 2b 48 08 7b 2c 15 08 7c 2d 39 08 : y*J.z+H.{,..|-9.
3f21 : __ __ __ BYT 7d 2f 42 08 7f 81 42 2d 34 2f 3d 81 42 2d 2e 2f : }/B...B-4/=.B-./
3f31 : __ __ __ BYT 38 81 42 2d 29 2f 32 81 42 2d 24 2f 2d 81 42 2d : 8.B-)/2.B-$/-.B-
3f41 : __ __ __ BYT 1e 2f 28 81 42 2d 19 2f 22 81 42 2d 14 2f 1d 81 : ./(.B-./".B-./..
3f51 : __ __ __ BYT 4c 08 00 08 02 08 04 08 07 28 3a 08 78 2a 3a 08 : L........(:.x*:.
3f61 : __ __ __ BYT 7a 08 7c 2d 0e 2f 39 08 7f 81 42 2d 09 2f 34 81 : z.|-./9...B-./4.
3f71 : __ __ __ BYT 42 2d 04 2f 2e 81 42 2d 00 2f 29 81 41 2f 24 81 : B-./..B-./).A/$.
3f81 : __ __ __ BYT 41 2f 1e 81 41 2f 19 81 41 2f 14 81 52 08 00 08 : A/..A/..A/..R...
3f91 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 51 08 78 29 4a 08 : .........(Q.x)J.
3fa1 : __ __ __ BYT 79 2a 51 08 7a 2b 4a 08 7b 2c 25 08 7c 2f 3d 08 : y*Q.z+J.{,%.|/=.
3fb1 : __ __ __ BYT 7f 81 41 2f 38 81 41 2f 32 81 41 2f 2d 81 41 2f : ..A/8.A/2.A/-.A/
3fc1 : __ __ __ BYT 28 81 41 2f 22 81 41 2f 1d 81 41 2f 18 81 51 08 : (.A/".A/..A/..Q.
3fd1 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 07 28 41 08 78 29 : ...........(A.x)
3fe1 : __ __ __ BYT 3a 08 79 2a 41 08 7a 2b 3a 08 7b 08 7c 2f 42 08 : :.y*A.z+:.{.|/B.
3ff1 : __ __ __ BYT 7f 81 41 2f 3d 81 41 2f 38 81 41 2f 32 81 41 2f : ..A/=.A/8.A/2.A/
4001 : __ __ __ BYT 2d 81 41 2f 28 81 41 2f 22 81 41 2f 1d 81 58 08 : -.A/(.A/".A/..X.
4011 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 06 08 07 28 : ...............(
4021 : __ __ __ BYT 4a 08 78 29 51 08 79 2a 4a 08 7a 2b 51 08 7b 2c : J.x)Q.y*J.z+Q.{,
4031 : __ __ __ BYT 15 08 7c 2d 39 08 7d 2e 39 08 7e 2f 39 08 7f 81 : ..|-9.}.9.~/9...
4041 : __ __ __ BYT 43 2d 34 2e 34 2f 34 81 43 2d 2e 2e 2e 2f 2e 81 : C-4.4/4.C-.../..
4051 : __ __ __ BYT 43 2d 29 2e 29 2f 29 81 43 2d 24 2e 24 2f 24 81 : C-).)/).C-$.$/$.
4061 : __ __ __ BYT 43 2d 1e 2e 1e 2f 1e 81 43 2d 19 2e 19 2f 19 81 : C-.../..C-.../..
4071 : __ __ __ BYT 43 2d 14 2e 14 2f 14 81 4d 08 01 08 03 08 04 08 : C-.../..M.......
4081 : __ __ __ BYT 07 29 41 08 79 2b 41 08 7b 08 7c 2d 0e 2e 0e 2f : .)A.y+A.{.|-.../
4091 : __ __ __ BYT 49 08 7f 81 43 2d 09 2e 09 2f 44 81 43 2d 04 2e : I...C-.../D.C-..
40a1 : __ __ __ BYT 04 2f 3e 81 43 2d 00 2e 00 2f 39 81 41 2f 34 81 : ./>.C-.../9.A/4.
40b1 : __ __ __ BYT 41 2f 2e 81 41 2f 29 81 41 2f 24 81 54 08 00 08 : A/..A/).A/$.T...
40c1 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 45 30 80 08 78 29 : .........(E0..x)
40d1 : __ __ __ BYT 4a 08 79 2a 45 32 b0 08 7a 2b 4a 08 7b 2c 25 08 : J.y*E2..z+J.{,%.
40e1 : __ __ __ BYT 7c 2f 3c 08 7f 81 45 28 46 30 00 2a 46 32 30 2f : |/<...E(F0.*F20/
40f1 : __ __ __ BYT 36 81 43 30 80 32 b0 2f 31 81 45 28 48 30 00 2a : 6.C0.2./1.E(H0.*
4101 : __ __ __ BYT 48 32 30 2f 2c 81 41 2f 26 81 41 2f 21 81 41 2f : H20/,.A/&.A/!.A/
4111 : __ __ __ BYT 1c 81 41 2f 16 81 45 08 04 08 07 08 7c 2f 48 08 : ..A/..E.....|/H.
4121 : __ __ __ BYT 7f 81 41 2f 42 81 41 2f 3d 81 41 2f 38 81 41 2f : ..A/B.A/=.A/8.A/
4131 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 51 08 : 2.A/-.A/(.A/".Q.
4141 : __ __ __ BYT 01 08 03 08 04 08 05 08 07 29 45 31 b0 08 79 2b : .........)E1..y+
4151 : __ __ __ BYT 45 33 b0 08 7b 2c 12 08 7c 2d 39 08 7d 2f 3e 08 : E3..{,..|-9.}/>.
4161 : __ __ __ BYT 7f 81 46 29 46 31 30 2b 46 33 30 2d 34 2f 39 81 : ..F)F10+F30-4/9.
4171 : __ __ __ BYT 44 31 b0 33 b0 2d 2e 2f 34 81 46 29 48 31 30 2b : D1.3.-./4.F)H10+
4181 : __ __ __ BYT 48 33 30 2d 29 2f 2e 81 42 2d 24 2f 29 81 42 2d : H30-)/..B-$/).B-
4191 : __ __ __ BYT 1e 2f 24 81 42 2d 19 2f 1e 81 42 2d 14 2f 19 81 : ./$.B-./..B-./..
41a1 : __ __ __ BYT 46 08 04 08 07 08 7c 2d 0e 2f 45 08 7f 81 42 2d : F.....|-./E...B-
41b1 : __ __ __ BYT 09 2f 40 81 42 2d 04 2f 3a 81 42 2d 00 2f 35 81 : ./@.B-./:.B-./5.
41c1 : __ __ __ BYT 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 : A/0.A/*.A/%.A/ .
41d1 : __ __ __ BYT 4c 08 00 08 02 08 04 08 07 28 4a 08 78 2a 4a 08 : L........(J.x*J.
41e1 : __ __ __ BYT 7a 2c 22 08 7c 2f 39 08 7f 81 41 2f 34 81 41 2f : z,".|/9...A/4.A/
41f1 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f : ..A/).A/$.A/..A/
4201 : __ __ __ BYT 19 81 41 2f 14 81 4b 08 00 08 02 08 04 08 07 28 : ..A/..K........(
4211 : __ __ __ BYT 4c 08 78 2a 4c 08 7a 08 7c 2f 48 08 7f 81 41 2f : L.x*L.z.|/H...A/
4221 : __ __ __ BYT 42 81 41 2f 3d 81 41 2f 38 81 41 2f 32 81 41 2f : B.A/=.A/8.A/2.A/
4231 : __ __ __ BYT 2d 81 41 2f 28 81 41 2f 22 81 58 08 00 08 01 08 : -.A/(.A/".X.....
4241 : __ __ __ BYT 02 08 03 08 04 08 05 08 06 08 07 28 4a 08 78 29 : ...........(J.x)
4251 : __ __ __ BYT 4a 08 79 2a 4a 08 7a 2b 4a 08 7b 2c 12 08 7c 2d : J.y*J.z+J.{,..|-
4261 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 49 08 7f 81 43 2d 34 2e : 9.}.9.~/I...C-4.
4271 : __ __ __ BYT 34 2f 44 81 43 2d 2e 2e 2e 2f 3e 81 43 2d 29 2e : 4/D.C-.../>.C-).
4281 : __ __ __ BYT 29 2f 39 81 43 2d 24 2e 24 2f 34 81 43 2d 1e 2e : )/9.C-$.$/4.C-..
4291 : __ __ __ BYT 1e 2f 2e 81 43 2d 19 2e 19 2f 29 81 43 2d 14 2e : ./..C-.../).C-..
42a1 : __ __ __ BYT 14 2f 24 81 4d 08 01 08 03 08 04 08 07 29 4c 08 : ./$.M........)L.
42b1 : __ __ __ BYT 79 2b 4c 08 7b 08 7c 2d 0e 2e 0e 2f 3c 08 7f 81 : y+L.{.|-.../<...
42c1 : __ __ __ BYT 43 2d 09 2e 09 2f 36 81 43 2d 04 2e 04 2f 31 81 : C-.../6.C-.../1.
42d1 : __ __ __ BYT 43 2d 00 2e 00 2f 2c 81 41 2f 26 81 41 2f 21 81 : C-.../,.A/&.A/!.
42e1 : __ __ __ BYT 41 2f 1c 81 41 2f 16 81 52 08 00 08 01 08 02 08 : A/..A/..R.......
42f1 : __ __ __ BYT 03 08 04 08 07 28 48 08 78 29 4a 08 79 2a 48 08 : .....(H.x)J.y*H.
4301 : __ __ __ BYT 7a 2b 4a 08 7b 2c 22 08 7c 2f 45 08 7f 81 41 2f : z+J.{,".|/E...A/
4311 : __ __ __ BYT 40 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : @.A/:.A/5.A/0.A/
4321 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 45 08 04 08 07 08 : *.A/%.A/ .E.....
4331 : __ __ __ BYT 7c 2f 3e 08 7f 81 41 2f 39 81 41 2f 34 81 41 2f : |/>...A/9.A/4.A/
4341 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f : ..A/).A/$.A/..A/
4351 : __ __ __ BYT 19 81 53 08 00 08 01 08 02 08 03 08 04 08 05 08 : ..S.............
4361 : __ __ __ BYT 07 08 78 29 48 08 79 08 7a 2b 48 08 7b 2c 11 08 : ..x)H.y.z+H.{,..
4371 : __ __ __ BYT 7c 2d 39 08 7d 2f 48 08 7f 81 42 2d 34 2f 42 81 : |-9.}/H...B-4/B.
4381 : __ __ __ BYT 42 2d 2e 2f 3d 81 42 2d 29 2f 38 81 42 2d 24 2f : B-./=.B-)/8.B-$/
4391 : __ __ __ BYT 32 81 42 2d 1e 2f 2d 81 42 2d 19 2f 28 81 42 2d : 2.B-./-.B-./(.B-
43a1 : __ __ __ BYT 14 2f 22 81 4a 08 00 08 02 08 04 08 07 08 78 08 : ./".J.........x.
43b1 : __ __ __ BYT 7a 08 7c 2d 0e 2f 49 08 7f 81 42 2d 09 2f 44 81 : z.|-./I...B-./D.
43c1 : __ __ __ BYT 42 2d 04 2f 3e 81 42 2d 00 2f 39 81 41 2f 34 81 : B-./>.B-./9.A/4.
43d1 : __ __ __ BYT 41 2f 2e 81 41 2f 29 81 41 2f 24 81 50 08 00 08 : A/..A/).A/$.P...
43e1 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 46 08 78 08 79 2a : .........(F.x.y*
43f1 : __ __ __ BYT 46 08 7a 08 7b 2c 21 08 7c 2f 39 08 7f 81 41 2f : F.z.{,!.|/9...A/
4401 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
4411 : __ __ __ BYT 1e 81 41 2f 19 81 41 2f 14 81 49 08 01 08 03 08 : ..A/..A/..I.....
4421 : __ __ __ BYT 04 08 07 08 79 08 7b 08 7c 2f 45 08 7f 81 41 2f : ....y.{.|/E...A/
4431 : __ __ __ BYT 40 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : @.A/:.A/5.A/0.A/
4441 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 58 08 00 08 01 08 : *.A/%.A/ .X.....
4451 : __ __ __ BYT 02 08 03 08 04 08 05 08 06 08 07 28 48 08 78 29 : ...........(H.x)
4461 : __ __ __ BYT 46 08 79 2a 48 08 7a 2b 46 08 7b 2c 11 08 7c 2d : F.y*H.z+F.{,..|-
4471 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 3c 08 7f 81 43 2d 34 2e : 9.}.9.~/<...C-4.
4481 : __ __ __ BYT 34 2f 36 81 43 2d 2e 2e 2e 2f 31 81 43 2d 29 2e : 4/6.C-.../1.C-).
4491 : __ __ __ BYT 29 2f 2c 81 43 2d 24 2e 24 2f 26 81 43 2d 1e 2e : )/,.C-$.$/&.C-..
44a1 : __ __ __ BYT 1e 2f 21 81 43 2d 19 2e 19 2f 1c 81 43 2d 14 2e : ./!.C-.../..C-..
44b1 : __ __ __ BYT 14 2f 16 81 47 08 04 08 07 08 7c 2d 0e 2e 0e 2f : ./..G.....|-.../
44c1 : __ __ __ BYT 49 08 7f 81 43 2d 09 2e 09 2f 44 81 43 2d 04 2e : I...C-.../D.C-..
44d1 : __ __ __ BYT 04 2f 3e 81 43 2d 00 2e 00 2f 39 81 41 2f 34 81 : ./>.C-.../9.A/4.
44e1 : __ __ __ BYT 41 2f 2e 81 41 2f 29 81 41 2f 24 81 52 08 00 08 : A/..A/).A/$.R...
44f1 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 4a 08 78 29 48 08 : .........(J.x)H.
4501 : __ __ __ BYT 79 2a 4a 08 7a 2b 48 08 7b 2c 21 08 7c 2f 3e 08 : y*J.z+H.{,!.|/>.
4511 : __ __ __ BYT 7f 81 41 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f : ..A/9.A/4.A/..A/
4521 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 45 08 : ).A/$.A/..A/..E.
4531 : __ __ __ BYT 04 08 07 08 7c 2f 48 08 7f 81 41 2f 42 81 41 2f : ....|/H...A/B.A/
4541 : __ __ __ BYT 3d 81 41 2f 38 81 41 2f 32 81 41 2f 2d 81 41 2f : =.A/8.A/2.A/-.A/
4551 : __ __ __ BYT 28 81 41 2f 22 81 55 08 00 08 01 08 02 08 03 08 : (.A/".U.........
4561 : __ __ __ BYT 04 08 05 08 07 28 48 08 78 29 4a 08 79 2a 48 08 : .....(H.x)J.y*H.
4571 : __ __ __ BYT 7a 2b 4a 08 7b 2c 18 08 7c 2d 39 08 7d 2f 45 08 : z+J.{,..|-9.}/E.
4581 : __ __ __ BYT 7f 81 42 2d 34 2f 40 81 42 2d 2e 2f 3a 81 42 2d : ..B-4/@.B-./:.B-
4591 : __ __ __ BYT 29 2f 35 81 42 2d 24 2f 30 81 42 2d 1e 2f 2a 81 : )/5.B-$/0.B-./*.
45a1 : __ __ __ BYT 42 2d 19 2f 25 81 42 2d 14 2f 20 81 46 08 04 08 : B-./%.B-./ .F...
45b1 : __ __ __ BYT 07 08 7c 2d 0e 2f 39 08 7f 81 42 2d 09 2f 34 81 : ..|-./9...B-./4.
45c1 : __ __ __ BYT 42 2d 04 2f 2e 81 42 2d 00 2f 29 81 41 2f 24 81 : B-./..B-./).A/$.
45d1 : __ __ __ BYT 41 2f 1e 81 41 2f 19 81 41 2f 14 81 52 08 00 08 : A/..A/..A/..R...
45e1 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 4a 08 78 29 48 08 : .........(J.x)H.
45f1 : __ __ __ BYT 79 2a 4a 08 7a 2b 48 08 7b 2c 28 08 7c 2f 49 08 : y*J.z+H.{,(.|/I.
4601 : __ __ __ BYT 7f 81 41 2f 44 81 41 2f 3e 81 41 2f 39 81 41 2f : ..A/D.A/>.A/9.A/
4611 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 4b 08 : 4.A/..A/).A/$.K.
4621 : __ __ __ BYT 00 08 02 08 04 08 07 28 4c 08 78 2a 4c 08 7a 08 : .......(L.x*L.z.
4631 : __ __ __ BYT 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f 31 81 41 2f : |/<...A/6.A/1.A/
4641 : __ __ __ BYT 2c 81 41 2f 26 81 41 2f 21 81 41 2f 1c 81 41 2f : ,.A/&.A/!.A/..A/
4651 : __ __ __ BYT 16 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 : ..X.............
4661 : __ __ __ BYT 06 08 07 28 4a 08 78 29 4a 08 79 2a 4a 08 7a 2b : ...(J.x)J.y*J.z+
4671 : __ __ __ BYT 4a 08 7b 2c 18 08 7c 2d 39 08 7d 2e 39 08 7e 2f : J.{,..|-9.}.9.~/
4681 : __ __ __ BYT 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 43 2d 2e 2e : >...C-4.4/9.C-..
4691 : __ __ __ BYT 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 43 2d 24 2e : ./4.C-).)/..C-$.
46a1 : __ __ __ BYT 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 43 2d 19 2e : $/).C-.../$.C-..
46b1 : __ __ __ BYT 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 4d 08 01 08 : ./..C-.../..M...
46c1 : __ __ __ BYT 03 08 04 08 07 29 4c 08 79 2b 4c 08 7b 08 7c 2d : .....)L.y+L.{.|-
46d1 : __ __ __ BYT 0e 2e 0e 2f 45 08 7f 81 43 2d 09 2e 09 2f 40 81 : .../E...C-.../@.
46e1 : __ __ __ BYT 43 2d 04 2e 04 2f 3a 81 43 2d 00 2e 00 2f 35 81 : C-.../:.C-.../5.
46f1 : __ __ __ BYT 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 : A/0.A/*.A/%.A/ .
4701 : __ __ __ BYT 52 08 00 08 01 08 02 08 03 08 04 08 07 28 48 08 : R............(H.
4711 : __ __ __ BYT 78 29 4a 08 79 2a 48 08 7a 2b 4a 08 7b 2c 28 08 : x)J.y*H.z+J.{,(.
4721 : __ __ __ BYT 7c 2f 39 08 7f 81 41 2f 34 81 41 2f 2e 81 41 2f : |/9...A/4.A/..A/
4731 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f : ).A/$.A/..A/..A/
4741 : __ __ __ BYT 14 81 45 08 04 08 07 08 7c 2f 49 08 7f 81 41 2f : ..E.....|/I...A/
4751 : __ __ __ BYT 44 81 41 2f 3e 81 41 2f 39 81 41 2f 34 81 41 2f : D.A/>.A/9.A/4.A/
4761 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 55 08 00 08 01 08 : ..A/).A/$.U.....
4771 : __ __ __ BYT 02 08 03 08 04 08 05 08 07 28 4a 08 78 29 48 08 : .........(J.x)H.
4781 : __ __ __ BYT 79 2a 4a 08 7a 2b 48 08 7b 2c 15 08 7c 2d 39 08 : y*J.z+H.{,..|-9.
4791 : __ __ __ BYT 7d 2f 48 08 7f 81 42 2d 34 2f 42 81 42 2d 2e 2f : }/H...B-4/B.B-./
47a1 : __ __ __ BYT 3d 81 42 2d 29 2f 38 81 42 2d 24 2f 32 81 42 2d : =.B-)/8.B-$/2.B-
47b1 : __ __ __ BYT 1e 2f 2d 81 42 2d 19 2f 28 81 42 2d 14 2f 22 81 : ./-.B-./(.B-./".
47c1 : __ __ __ BYT 4c 08 00 08 02 08 04 08 07 28 3a 08 78 2a 3a 08 : L........(:.x*:.
47d1 : __ __ __ BYT 7a 08 7c 2d 0e 2f 3c 08 7f 81 42 2d 09 2f 36 81 : z.|-./<...B-./6.
47e1 : __ __ __ BYT 42 2d 04 2f 31 81 42 2d 00 2f 2c 81 41 2f 26 81 : B-./1.B-./,.A/&.
47f1 : __ __ __ BYT 41 2f 21 81 41 2f 1c 81 41 2f 16 81 52 08 00 08 : A/!.A/..A/..R...
4801 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 51 08 78 29 4a 08 : .........(Q.x)J.
4811 : __ __ __ BYT 79 2a 51 08 7a 2b 4a 08 7b 2c 25 08 7c 2f 45 08 : y*Q.z+J.{,%.|/E.
4821 : __ __ __ BYT 7f 81 41 2f 40 81 41 2f 3a 81 41 2f 35 81 41 2f : ..A/@.A/:.A/5.A/
4831 : __ __ __ BYT 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 51 08 : 0.A/*.A/%.A/ .Q.
4841 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 07 28 41 08 78 29 : ...........(A.x)
4851 : __ __ __ BYT 3a 08 79 2a 41 08 7a 2b 3a 08 7b 08 7c 2f 3e 08 : :.y*A.z+:.{.|/>.
4861 : __ __ __ BYT 7f 81 41 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f : ..A/9.A/4.A/..A/
4871 : __ __ __ BYT 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 58 08 : ).A/$.A/..A/..X.
4881 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 06 08 07 28 : ...............(
4891 : __ __ __ BYT 4a 08 78 29 51 08 79 2a 4a 08 7a 2b 51 08 7b 2c : J.x)Q.y*J.z+Q.{,
48a1 : __ __ __ BYT 15 08 7c 2d 39 08 7d 2e 39 08 7e 2f 49 08 7f 81 : ..|-9.}.9.~/I...
48b1 : __ __ __ BYT 43 2d 34 2e 34 2f 44 81 43 2d 2e 2e 2e 2f 3e 81 : C-4.4/D.C-.../>.
48c1 : __ __ __ BYT 43 2d 29 2e 29 2f 39 81 43 2d 24 2e 24 2f 34 81 : C-).)/9.C-$.$/4.
48d1 : __ __ __ BYT 43 2d 1e 2e 1e 2f 2e 81 43 2d 19 2e 19 2f 29 81 : C-.../..C-.../).
48e1 : __ __ __ BYT 43 2d 14 2e 14 2f 24 81 4d 08 01 08 03 08 04 08 : C-.../$.M.......
48f1 : __ __ __ BYT 07 29 41 08 79 2b 41 08 7b 08 7c 2d 0e 2e 0e 2f : .)A.y+A.{.|-.../
4901 : __ __ __ BYT 39 08 7f 81 43 2d 09 2e 09 2f 34 81 43 2d 04 2e : 9...C-.../4.C-..
4911 : __ __ __ BYT 04 2f 2e 81 43 2d 00 2e 00 2f 29 81 41 2f 24 81 : ./..C-.../).A/$.
4921 : __ __ __ BYT 41 2f 1e 81 41 2f 19 81 41 2f 14 81 54 08 00 08 : A/..A/..A/..T...
4931 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 49 30 80 08 78 29 : .........(I0..x)
4941 : __ __ __ BYT 4a 08 79 2a 49 32 b0 08 7a 2b 4a 08 7b 2c 25 08 : J.y*I2..z+J.{,%.
4951 : __ __ __ BYT 7c 2f 45 08 7f 81 45 28 4a 30 00 2a 4a 32 30 2f : |/E...E(J0.*J20/
4961 : __ __ __ BYT 40 81 43 30 80 32 b0 2f 3a 81 45 28 4c 30 00 2a : @.C0.2./:.E(L0.*
4971 : __ __ __ BYT 4c 32 30 2f 35 81 41 2f 30 81 41 2f 2a 81 41 2f : L20/5.A/0.A/*.A/
4981 : __ __ __ BYT 25 81 41 2f 20 81 45 08 04 08 07 08 7c 2f 3c 08 : %.A/ .E.....|/<.
4991 : __ __ __ BYT 7f 81 41 2f 36 81 41 2f 31 81 41 2f 2c 81 41 2f : ..A/6.A/1.A/,.A/
49a1 : __ __ __ BYT 26 81 41 2f 21 81 41 2f 1c 81 41 2f 16 81 51 08 : &.A/!.A/..A/..Q.
49b1 : __ __ __ BYT 01 08 03 08 04 08 05 08 07 29 49 31 b0 08 79 2b : .........)I1..y+
49c1 : __ __ __ BYT 49 33 b0 08 7b 2c 12 08 7c 2d 39 08 7d 2f 49 08 : I3..{,..|-9.}/I.
49d1 : __ __ __ BYT 7f 81 46 29 4a 31 30 2b 4a 33 30 2d 34 2f 44 81 : ..F)J10+J30-4/D.
49e1 : __ __ __ BYT 44 31 b0 33 b0 2d 2e 2f 3e 81 46 29 4c 31 30 2b : D1.3.-./>.F)L10+
49f1 : __ __ __ BYT 4c 33 30 2d 29 2f 39 81 42 2d 24 2f 34 81 42 2d : L30-)/9.B-$/4.B-
4a01 : __ __ __ BYT 1e 2f 2e 81 42 2d 19 2f 29 81 42 2d 14 2f 24 81 : ./..B-./).B-./$.
4a11 : __ __ __ BYT 46 08 04 08 07 08 7c 2d 0e 2f 3e 08 7f 81 42 2d : F.....|-./>...B-
4a21 : __ __ __ BYT 09 2f 39 81 42 2d 04 2f 34 81 42 2d 00 2f 2e 81 : ./9.B-./4.B-./..
4a31 : __ __ __ BYT 41 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f 19 81 : A/).A/$.A/..A/..
4a41 : __ __ __ BYT 4c 08 00 08 02 08 04 08 07 28 4e 08 78 2a 4e 08 : L........(N.x*N.
4a51 : __ __ __ BYT 7a 2c 22 08 7c 2f 48 08 7f 81 41 2f 42 81 41 2f : z,".|/H...A/B.A/
4a61 : __ __ __ BYT 3d 81 41 2f 38 81 41 2f 32 81 41 2f 2d 81 41 2f : =.A/8.A/2.A/-.A/
4a71 : __ __ __ BYT 28 81 41 2f 22 81 4b 08 00 08 02 08 04 08 07 28 : (.A/".K........(
4a81 : __ __ __ BYT 51 08 78 2a 51 08 7a 08 7c 2f 45 08 7f 81 41 2f : Q.x*Q.z.|/E...A/
4a91 : __ __ __ BYT 40 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : @.A/:.A/5.A/0.A/
4aa1 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 58 08 00 08 01 08 : *.A/%.A/ .X.....
4ab1 : __ __ __ BYT 02 08 03 08 04 08 05 08 06 08 07 28 4e 08 78 29 : ...........(N.x)
4ac1 : __ __ __ BYT 4e 08 79 2a 4e 08 7a 2b 4e 08 7b 2c 12 08 7c 2d : N.y*N.z+N.{,..|-
4ad1 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 39 08 7f 81 43 2d 34 2e : 9.}.9.~/9...C-4.
4ae1 : __ __ __ BYT 34 2f 34 81 43 2d 2e 2e 2e 2f 2e 81 43 2d 29 2e : 4/4.C-.../..C-).
4af1 : __ __ __ BYT 29 2f 29 81 43 2d 24 2e 24 2f 24 81 43 2d 1e 2e : )/).C-$.$/$.C-..
4b01 : __ __ __ BYT 1e 2f 1e 81 43 2d 19 2e 19 2f 19 81 43 2d 14 2e : ./..C-.../..C-..
4b11 : __ __ __ BYT 14 2f 14 81 4d 08 01 08 03 08 04 08 07 29 51 08 : ./..M........)Q.
4b21 : __ __ __ BYT 79 2b 51 08 7b 08 7c 2d 0e 2e 0e 2f 49 08 7f 81 : y+Q.{.|-.../I...
4b31 : __ __ __ BYT 43 2d 09 2e 09 2f 44 81 43 2d 04 2e 04 2f 3e 81 : C-.../D.C-.../>.
4b41 : __ __ __ BYT 43 2d 00 2e 00 2f 39 81 41 2f 34 81 41 2f 2e 81 : C-.../9.A/4.A/..
4b51 : __ __ __ BYT 41 2f 29 81 41 2f 24 81 52 08 00 08 01 08 02 08 : A/).A/$.R.......
4b61 : __ __ __ BYT 03 08 04 08 07 28 4c 08 78 29 4e 08 79 2a 4c 08 : .....(L.x)N.y*L.
4b71 : __ __ __ BYT 7a 2b 4e 08 7b 2c 22 08 7c 2f 3c 08 7f 81 41 2f : z+N.{,".|/<...A/
4b81 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 41 2f : 6.A/1.A/,.A/&.A/
4b91 : __ __ __ BYT 21 81 41 2f 1c 81 41 2f 16 81 45 08 04 08 07 08 : !.A/..A/..E.....
4ba1 : __ __ __ BYT 7c 2f 48 08 7f 81 41 2f 42 81 41 2f 3d 81 41 2f : |/H...A/B.A/=.A/
4bb1 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
4bc1 : __ __ __ BYT 22 81 55 08 00 08 01 08 02 08 03 08 04 08 05 08 : ".U.............
4bd1 : __ __ __ BYT 07 28 4e 08 78 29 4c 08 79 2a 4e 08 7a 2b 4c 08 : .(N.x)L.y*N.z+L.
4be1 : __ __ __ BYT 7b 2c 15 08 7c 2d 39 08 7d 2f 3e 08 7f 81 44 28 : {,..|-9.}/>...D(
4bf1 : __ __ __ BYT 5e 2a 5e 2d 34 2f 39 81 42 2d 2e 2f 34 81 44 28 : ^*^-4/9.B-./4.D(
4c01 : __ __ __ BYT 4e 2a 4e 2d 29 2f 2e 81 44 28 5e 2a 5e 2d 24 2f : N*N-)/..D(^*^-$/
4c11 : __ __ __ BYT 29 81 42 2d 1e 2f 24 81 44 28 4e 2a 4e 2d 19 2f : ).B-./$.D(N*N-./
4c21 : __ __ __ BYT 1e 81 44 28 5e 2a 5e 2d 14 2f 19 81 46 08 04 08 : ..D(^*^-./..F...
4c31 : __ __ __ BYT 07 08 7c 2d 0e 2f 45 08 7f 81 44 28 4e 2a 4e 2d : ..|-./E...D(N*N-
4c41 : __ __ __ BYT 09 2f 40 81 44 28 5e 2a 5e 2d 04 2f 3a 81 42 2d : ./@.D(^*^-./:.B-
4c51 : __ __ __ BYT 00 2f 35 81 43 28 4e 2a 4e 2f 30 81 43 28 5e 2a : ./5.C(N*N/0.C(^*
4c61 : __ __ __ BYT 5e 2f 2a 81 41 2f 25 81 43 28 4e 2a 4e 2f 20 81 : ^/*.A/%.C(N*N/ .
4c71 : __ __ __ BYT 52 08 00 08 01 08 02 08 03 08 04 08 07 28 65 08 : R............(e.
4c81 : __ __ __ BYT 78 29 4e 08 79 2a 65 08 7a 2b 4e 08 7b 2c 25 08 : x)N.y*e.z+N.{,%.
4c91 : __ __ __ BYT 7c 2f 39 08 7f 81 43 29 5e 2b 5e 2f 34 81 43 28 : |/9...C)^+^/4.C(
4ca1 : __ __ __ BYT 55 2a 55 2f 2e 81 45 28 65 29 4e 2a 65 2b 4e 2f : U*U/..E(e)N*e+N/
4cb1 : __ __ __ BYT 29 81 43 29 5e 2b 5e 2f 24 81 43 28 55 2a 55 2f : ).C)^+^/$.C(U*U/
4cc1 : __ __ __ BYT 1e 81 45 28 65 29 4e 2a 65 2b 4e 2f 19 81 43 29 : ..E(e)N*e+N/..C)
4cd1 : __ __ __ BYT 5e 2b 5e 2f 14 81 47 08 04 08 07 28 55 2a 55 08 : ^+^/..G....(U*U.
4ce1 : __ __ __ BYT 7c 2f 49 08 7f 81 45 28 65 29 4e 2a 65 2b 4e 2f : |/I...E(e)N*e+N/
4cf1 : __ __ __ BYT 44 81 43 29 5e 2b 5e 2f 3e 81 43 28 55 2a 55 2f : D.C)^+^/>.C(U*U/
4d01 : __ __ __ BYT 39 81 45 28 65 29 4e 2a 65 2b 4e 2f 34 81 43 29 : 9.E(e)N*e+N/4.C)
4d11 : __ __ __ BYT 5e 2b 5e 2f 2e 81 43 28 55 2a 55 2f 29 81 45 28 : ^+^/..C(U*U/).E(
4d21 : __ __ __ BYT 65 29 4e 2a 65 2b 4e 2f 24 81 58 08 00 08 01 08 : e)N*e+N/$.X.....
4d31 : __ __ __ BYT 02 08 03 08 04 08 05 08 06 08 07 28 5e 08 78 29 : ...........(^.x)
4d41 : __ __ __ BYT 65 08 79 2a 5e 08 7a 2b 65 08 7b 2c 15 08 7c 2d : e.y*^.z+e.{,..|-
4d51 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 3c 08 7f 81 45 28 4e 2a : 9.}.9.~/<...E(N*
4d61 : __ __ __ BYT 4e 2d 34 2e 34 2f 36 81 47 28 5e 29 55 2a 5e 2b : N-4.4/6.G(^)U*^+
4d71 : __ __ __ BYT 55 2d 2e 2e 2e 2f 31 81 45 29 65 2b 65 2d 29 2e : U-.../1.E)e+e-).
4d81 : __ __ __ BYT 29 2f 2c 81 45 28 4e 2a 4e 2d 24 2e 24 2f 26 81 : )/,.E(N*N-$.$/&.
4d91 : __ __ __ BYT 47 28 5e 29 55 2a 5e 2b 55 2d 1e 2e 1e 2f 21 81 : G(^)U*^+U-.../!.
4da1 : __ __ __ BYT 45 29 65 2b 65 2d 19 2e 19 2f 1c 81 45 28 4e 2a : E)e+e-.../..E(N*
4db1 : __ __ __ BYT 4e 2d 14 2e 14 2f 16 81 4b 08 04 08 07 28 5e 29 : N-.../..K....(^)
4dc1 : __ __ __ BYT 55 2a 5e 2b 55 08 7c 2d 0e 2e 0e 2f 48 08 7f 81 : U*^+U.|-.../H...
4dd1 : __ __ __ BYT 45 29 65 2b 65 2d 09 2e 09 2f 42 81 45 28 4e 2a : E)e+e-.../B.E(N*
4de1 : __ __ __ BYT 4e 2d 04 2e 04 2f 3d 81 47 28 5e 29 55 2a 5e 2b : N-.../=.G(^)U*^+
4df1 : __ __ __ BYT 55 2d 00 2e 00 2f 38 81 43 29 65 2b 65 2f 32 81 : U-.../8.C)e+e/2.
4e01 : __ __ __ BYT 43 28 4e 2a 4e 2f 2d 81 45 28 5e 29 55 2a 5e 2b : C(N*N/-.E(^)U*^+
4e11 : __ __ __ BYT 55 2f 28 81 43 29 65 2b 65 2f 22 81 51 08 01 08 : U/(.C)e+e/".Q...
4e21 : __ __ __ BYT 03 08 04 08 06 08 07 28 4e 29 5e 08 79 2a 4e 2b : .......(N)^.y*N+
4e31 : __ __ __ BYT 5e 08 7b 2c 25 08 7c 2e 39 08 7e 2f 45 08 7f 81 : ^.{,%.|.9.~/E...
4e41 : __ __ __ BYT 46 28 5e 29 4e 2a 5e 2b 4e 2e 34 2f 40 81 44 29 : F(^)N*^+N.4/@.D)
4e51 : __ __ __ BYT 5e 2b 5e 2e 2e 2f 3a 81 44 28 4e 2a 4e 2e 29 2f : ^+^../:.D(N*N.)/
4e61 : __ __ __ BYT 35 81 46 28 5e 29 4e 2a 5e 2b 4e 2e 24 2f 30 81 : 5.F(^)N*^+N.$/0.
4e71 : __ __ __ BYT 44 29 5e 2b 5e 2e 1e 2f 2a 81 44 28 4e 2a 4e 2e : D)^+^../*.D(N*N.
4e81 : __ __ __ BYT 19 2f 25 81 46 28 5e 29 4e 2a 5e 2b 4e 2e 14 2f : ./%.F(^)N*^+N../
4e91 : __ __ __ BYT 20 81 48 08 04 08 07 29 5e 2b 5e 08 7c 2e 0e 2f :  .H....)^+^.|../
4ea1 : __ __ __ BYT 3e 08 7f 81 44 28 4e 2a 4e 2e 09 2f 39 81 46 28 : >...D(N*N../9.F(
4eb1 : __ __ __ BYT 5e 29 4e 2a 5e 2b 4e 2e 04 2f 34 81 44 29 5e 2b : ^)N*^+N../4.D)^+
4ec1 : __ __ __ BYT 5e 2e 00 2f 2e 81 43 28 4e 2a 4e 2f 29 81 45 28 : ^../..C(N*N/).E(
4ed1 : __ __ __ BYT 5e 29 4e 2a 5e 2b 4e 2f 24 81 43 29 5e 2b 5e 2f : ^)N*^+N/$.C)^+^/
4ee1 : __ __ __ BYT 1e 81 43 28 4e 2a 4e 2f 19 81 51 08 00 08 02 08 : ..C(N*N/..Q.....
4ef1 : __ __ __ BYT 04 08 05 08 07 28 5a 08 78 29 4e 2a 5a 08 7a 2b : .....(Z.x)N*Z.z+
4f01 : __ __ __ BYT 4e 2c 18 08 7c 2d 39 08 7d 2f 49 08 7f 81 44 29 : N,..|-9.}/I...D)
4f11 : __ __ __ BYT 5e 2b 5e 2d 34 2f 44 81 42 2d 2e 2f 3e 81 44 29 : ^+^-4/D.B-./>.D)
4f21 : __ __ __ BYT 4e 2b 4e 2d 29 2f 39 81 44 29 5e 2b 5e 2d 24 2f : N+N-)/9.D)^+^-$/
4f31 : __ __ __ BYT 34 81 42 2d 1e 2f 2e 81 44 29 4e 2b 4e 2d 19 2f : 4.B-./..D)N+N-./
4f41 : __ __ __ BYT 29 81 44 29 5e 2b 5e 2d 14 2f 24 81 4a 08 00 08 : ).D)^+^-./$.J...
4f51 : __ __ __ BYT 02 08 04 08 07 08 78 08 7a 08 7c 2d 0e 2f 39 08 : ......x.z.|-./9.
4f61 : __ __ __ BYT 7f 81 44 29 4e 2b 4e 2d 09 2f 34 81 44 29 5e 2b : ..D)N+N-./4.D)^+
4f71 : __ __ __ BYT 5e 2d 04 2f 2e 81 42 2d 00 2f 29 81 43 29 4e 2b : ^-./..B-./).C)N+
4f81 : __ __ __ BYT 4e 2f 24 81 43 29 5e 2b 5e 2f 1e 81 41 2f 19 81 : N/$.C)^+^/..A/..
4f91 : __ __ __ BYT 43 29 4e 2b 4e 2f 14 81 52 08 00 08 01 08 02 08 : C)N+N/..R.......
4fa1 : __ __ __ BYT 03 08 04 08 07 28 3a 08 78 29 5a 08 79 2a 3a 08 : .....(:.x)Z.y*:.
4fb1 : __ __ __ BYT 7a 2b 5a 08 7b 2c 28 08 7c 2f 45 08 7f 81 41 2f : z+Z.{,(.|/E...A/
4fc1 : __ __ __ BYT 40 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : @.A/:.A/5.A/0.A/
4fd1 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 49 08 01 08 03 08 : *.A/%.A/ .I.....
4fe1 : __ __ __ BYT 04 08 07 08 79 08 7b 08 7c 2f 48 08 7f 81 41 2f : ....y.{.|/H...A/
4ff1 : __ __ __ BYT 42 81 41 2f 3d 81 41 2f 38 81 41 2f 32 81 41 2f : B.A/=.A/8.A/2.A/
5001 : __ __ __ BYT 2d 81 41 2f 28 81 41 2f 22 81 58 08 00 08 01 08 : -.A/(.A/".X.....
5011 : __ __ __ BYT 02 08 03 08 04 08 05 08 06 08 07 28 5a 08 78 29 : ...........(Z.x)
5021 : __ __ __ BYT 3a 08 79 2a 5a 08 7a 2b 3a 08 7b 2c 18 08 7c 2d : :.y*Z.z+:.{,..|-
5031 : __ __ __ BYT 39 08 7d 2e 39 08 7e 2f 3c 08 7f 81 43 2d 34 2e : 9.}.9.~/<...C-4.
5041 : __ __ __ BYT 34 2f 36 81 43 2d 2e 2e 2e 2f 31 81 43 2d 29 2e : 4/6.C-.../1.C-).
5051 : __ __ __ BYT 29 2f 2c 81 43 2d 24 2e 24 2f 26 81 43 2d 1e 2e : )/,.C-$.$/&.C-..
5061 : __ __ __ BYT 1e 2f 21 81 43 2d 19 2e 19 2f 1c 81 43 2d 14 2e : ./!.C-.../..C-..
5071 : __ __ __ BYT 14 2f 16 81 4b 08 00 08 02 08 04 08 07 08 78 08 : ./..K.........x.
5081 : __ __ __ BYT 7a 08 7c 2d 0e 2e 0e 2f 49 08 7f 81 43 2d 09 2e : z.|-.../I...C-..
5091 : __ __ __ BYT 09 2f 44 81 43 2d 04 2e 04 2f 3e 81 43 2d 00 2e : ./D.C-.../>.C-..
50a1 : __ __ __ BYT 00 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 : ./9.A/4.A/..A/).
50b1 : __ __ __ BYT 41 2f 24 81 52 08 00 08 01 08 02 08 03 08 04 08 : A/$.R...........
50c1 : __ __ __ BYT 07 28 3a 08 78 29 5a 08 79 2a 3a 08 7a 2b 5a 08 : .(:.x)Z.y*:.z+Z.
50d1 : __ __ __ BYT 7b 2c 28 08 7c 2f 3e 08 7f 81 41 2f 39 81 41 2f : {,(.|/>...A/9.A/
50e1 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
50f1 : __ __ __ BYT 1e 81 41 2f 19 81 49 08 01 08 03 08 04 08 07 08 : ..A/..I.........
5101 : __ __ __ BYT 79 08 7b 08 7c 2f 4c 08 7f 81 41 2f 46 81 41 2f : y.{.|/L...A/F.A/
5111 : __ __ __ BYT 41 81 41 2f 3c 81 41 2f 36 81 41 2f 31 81 41 2f : A.A/<.A/6.A/1.A/
5121 : __ __ __ BYT 2c 81 41 2f 26 81 55 08 00 08 01 08 02 08 03 08 : ,.A/&.U.........
5131 : __ __ __ BYT 04 08 05 08 07 28 5a 08 78 29 3a 08 79 2a 5a 08 : .....(Z.x):.y*Z.
5141 : __ __ __ BYT 7a 2b 3a 08 7b 2c 15 08 7c 2d 39 08 7d 2f 48 08 : z+:.{,..|-9.}/H.
5151 : __ __ __ BYT 7f 81 42 2d 34 2f 42 81 42 2d 2e 2f 3d 81 42 2d : ..B-4/B.B-./=.B-
5161 : __ __ __ BYT 29 2f 38 81 42 2d 24 2f 32 81 42 2d 1e 2f 2d 81 : )/8.B-$/2.B-./-.
5171 : __ __ __ BYT 42 2d 19 2f 28 81 42 2d 14 2f 22 81 4a 08 00 08 : B-./(.B-./".J...
5181 : __ __ __ BYT 02 08 04 08 07 08 78 08 7a 08 7c 2d 0e 2f 45 08 : ......x.z.|-./E.
5191 : __ __ __ BYT 7f 81 42 2d 09 2f 40 81 42 2d 04 2f 3a 81 42 2d : ..B-./@.B-./:.B-
51a1 : __ __ __ BYT 00 2f 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 : ./5.A/0.A/*.A/%.
51b1 : __ __ __ BYT 41 2f 20 81 52 08 00 08 01 08 02 08 03 08 04 08 : A/ .R...........
51c1 : __ __ __ BYT 07 28 3a 08 78 29 5a 08 79 2a 3a 08 7a 2b 5a 08 : .(:.x)Z.y*:.z+Z.
51d1 : __ __ __ BYT 7b 2c 25 08 7c 2f 39 08 7f 81 41 2f 34 81 41 2f : {,%.|/9...A/4.A/
51e1 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 41 2f 1e 81 41 2f : ..A/).A/$.A/..A/
51f1 : __ __ __ BYT 19 81 41 2f 14 81 49 08 01 08 03 08 04 08 07 08 : ..A/..I.........
5201 : __ __ __ BYT 79 08 7b 08 7c 2f 4c 08 7f 81 41 2f 46 81 41 2f : y.{.|/L...A/F.A/
5211 : __ __ __ BYT 41 81 41 2f 3c 81 41 2f 36 81 41 2f 31 81 41 2f : A.A/<.A/6.A/1.A/
5221 : __ __ __ BYT 2c 81 41 2f 26 81 58 08 00 08 01 08 02 08 03 08 : ,.A/&.X.........
5231 : __ __ __ BYT 04 08 05 08 06 08 07 28 5a 08 78 29 3a 08 79 2a : .......(Z.x):.y*
5241 : __ __ __ BYT 5a 08 7a 2b 3a 08 7b 2c 15 08 7c 2d 39 08 7d 2e : Z.z+:.{,..|-9.}.
5251 : __ __ __ BYT 39 08 7e 2f 3c 08 7f 81 43 2d 34 2e 34 2f 36 81 : 9.~/<...C-4.4/6.
5261 : __ __ __ BYT 43 2d 2e 2e 2e 2f 31 81 43 2d 29 2e 29 2f 2c 81 : C-.../1.C-).)/,.
5271 : __ __ __ BYT 43 2d 24 2e 24 2f 26 81 43 2d 1e 2e 1e 2f 21 81 : C-$.$/&.C-.../!.
5281 : __ __ __ BYT 43 2d 19 2e 19 2f 1c 81 43 2d 14 2e 14 2f 16 81 : C-.../..C-.../..
5291 : __ __ __ BYT 4d 08 00 08 02 08 04 08 07 28 58 08 78 2a 58 08 : M........(X.x*X.
52a1 : __ __ __ BYT 7a 08 7c 2d 0e 2e 0e 2f 49 08 7f 81 43 2d 09 2e : z.|-.../I...C-..
52b1 : __ __ __ BYT 09 2f 44 81 43 2d 04 2e 04 2f 3e 81 43 2d 00 2e : ./D.C-.../>.C-..
52c1 : __ __ __ BYT 00 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 : ./9.A/4.A/..A/).
52d1 : __ __ __ BYT 41 2f 24 81 52 08 00 08 01 08 02 08 03 08 04 08 : A/$.R...........
52e1 : __ __ __ BYT 07 28 55 08 78 29 5a 08 79 2a 55 08 7a 2b 5a 08 : .(U.x)Z.y*U.z+Z.
52f1 : __ __ __ BYT 7b 2c 25 08 7c 2f 48 08 7f 81 41 2f 42 81 41 2f : {,%.|/H...A/B.A/
5301 : __ __ __ BYT 3d 81 41 2f 38 81 41 2f 32 81 41 2f 2d 81 41 2f : =.A/8.A/2.A/-.A/
5311 : __ __ __ BYT 28 81 41 2f 22 81 51 08 00 08 01 08 02 08 03 08 : (.A/".Q.........
5321 : __ __ __ BYT 04 08 07 28 4e 08 78 29 58 08 79 2a 4e 08 7a 2b : ...(N.x)X.y*N.z+
5331 : __ __ __ BYT 58 08 7b 08 7c 2f 3e 08 7f 81 41 2f 39 81 41 2f : X.{.|/>...A/9.A/
5341 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
5351 : __ __ __ BYT 1e 81 41 2f 19 81 55 08 00 08 01 08 02 08 03 08 : ..A/..U.........
5361 : __ __ __ BYT 04 08 05 08 07 28 51 08 78 29 55 08 79 2a 51 08 : .....(Q.x)U.y*Q.
5371 : __ __ __ BYT 7a 2b 55 08 7b 2c 12 08 7c 2d 39 08 7d 2f 45 08 : z+U.{,..|-9.}/E.
5381 : __ __ __ BYT 7f 81 42 2d 34 2f 40 81 42 2d 2e 2f 3a 81 42 2d : ..B-4/@.B-./:.B-
5391 : __ __ __ BYT 29 2f 35 81 42 2d 24 2f 30 81 42 2d 1e 2f 2a 81 : )/5.B-$/0.B-./*.
53a1 : __ __ __ BYT 42 2d 19 2f 25 81 42 2d 14 2f 20 81 4c 08 01 08 : B-./%.B-./ .L...
53b1 : __ __ __ BYT 03 08 04 08 07 29 4e 08 79 2b 4e 08 7b 08 7c 2d : .....)N.y+N.{.|-
53c1 : __ __ __ BYT 0e 2f 39 08 7f 81 42 2d 09 2f 34 81 42 2d 04 2f : ./9...B-./4.B-./
53d1 : __ __ __ BYT 2e 81 42 2d 00 2f 29 81 41 2f 24 81 41 2f 1e 81 : ..B-./).A/$.A/..
53e1 : __ __ __ BYT 41 2f 19 81 41 2f 14 81 4c 08 01 08 03 08 04 08 : A/..A/..L.......
53f1 : __ __ __ BYT 07 29 51 08 79 2b 51 08 7b 2c 22 08 7c 2f 49 08 : .)Q.y+Q.{,".|/I.
5401 : __ __ __ BYT 7f 81 41 2f 44 81 41 2f 3e 81 41 2f 39 81 41 2f : ..A/D.A/>.A/9.A/
5411 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 45 08 : 4.A/..A/).A/$.E.
5421 : __ __ __ BYT 04 08 07 08 7c 2f 4c 08 7f 81 41 2f 46 81 41 2f : ....|/L...A/F.A/
5431 : __ __ __ BYT 41 81 41 2f 3c 81 41 2f 36 81 41 2f 31 81 41 2f : A.A/<.A/6.A/1.A/
5441 : __ __ __ BYT 2c 81 41 2f 26 81 50 08 00 08 02 08 04 08 05 08 : ,.A/&.P.........
5451 : __ __ __ BYT 06 08 07 08 78 08 7a 2c 12 08 7c 2d 39 08 7d 2e : ....x.z,..|-9.}.
5461 : __ __ __ BYT 39 08 7e 2f 48 08 7f 81 43 2d 34 2e 34 2f 42 81 : 9.~/H...C-4.4/B.
5471 : __ __ __ BYT 43 2d 2e 2e 2e 2f 3d 81 43 2d 29 2e 29 2f 38 81 : C-.../=.C-).)/8.
5481 : __ __ __ BYT 43 2d 24 2e 24 2f 32 81 43 2d 1e 2e 1e 2f 2d 81 : C-$.$/2.C-.../-.
5491 : __ __ __ BYT 43 2d 19 2e 19 2f 28 81 43 2d 14 2e 14 2f 22 81 : C-.../(.C-.../".
54a1 : __ __ __ BYT 47 08 04 08 07 08 7c 2d 0e 2e 0e 2f 45 08 7f 81 : G.....|-.../E...
54b1 : __ __ __ BYT 43 2d 09 2e 09 2f 40 81 43 2d 04 2e 04 2f 3a 81 : C-.../@.C-.../:.
54c1 : __ __ __ BYT 43 2d 00 2e 00 2f 35 81 41 2f 30 81 41 2f 2a 81 : C-.../5.A/0.A/*.
54d1 : __ __ __ BYT 41 2f 25 81 41 2f 20 81 50 08 00 08 01 08 02 08 : A/%.A/ .P.......
54e1 : __ __ __ BYT 03 08 04 08 07 28 4e 08 78 08 79 2a 4e 08 7a 08 : .....(N.x.y*N.z.
54f1 : __ __ __ BYT 7b 2c 22 08 7c 2f 3e 08 7f 81 41 2f 39 81 41 2f : {,".|/>...A/9.A/
5501 : __ __ __ BYT 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 41 2f : 4.A/..A/).A/$.A/
5511 : __ __ __ BYT 1e 81 41 2f 19 81 45 08 04 08 07 08 7c 2f 39 08 : ..A/..E.....|/9.
5521 : __ __ __ BYT 7f 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f : ..A/4.A/..A/).A/
5531 : __ __ __ BYT 24 81 41 2f 1e 81 41 2f 19 81 41 2f 14 81 55 08 : $.A/..A/..A/..U.
5541 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 07 28 51 08 : .............(Q.
5551 : __ __ __ BYT 78 29 4e 08 79 2a 51 08 7a 2b 4e 08 7b 2c 11 08 : x)N.y*Q.z+N.{,..
5561 : __ __ __ BYT 7c 2d 39 08 7d 2f 4c 08 7f 81 42 2d 34 2f 46 81 : |-9.}/L...B-4/F.
5571 : __ __ __ BYT 42 2d 2e 2f 41 81 42 2d 29 2f 3c 81 42 2d 24 2f : B-./A.B-)/<.B-$/
5581 : __ __ __ BYT 36 81 42 2d 1e 2f 31 81 42 2d 19 2f 2c 81 42 2d : 6.B-./1.B-./,.B-
5591 : __ __ __ BYT 14 2f 26 81 46 08 04 08 07 08 7c 2d 0e 2f 49 08 : ./&.F.....|-./I.
55a1 : __ __ __ BYT 7f 81 42 2d 09 2f 44 81 42 2d 04 2f 3e 81 42 2d : ..B-./D.B-./>.B-
55b1 : __ __ __ BYT 00 2f 39 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 : ./9.A/4.A/..A/).
55c1 : __ __ __ BYT 41 2f 24 81 4c 08 01 08 03 08 04 08 07 29 51 08 : A/$.L........)Q.
55d1 : __ __ __ BYT 79 2b 51 08 7b 2c 21 08 7c 2f 3c 08 7f 81 41 2f : y+Q.{,!.|/<...A/
55e1 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 41 2f : 6.A/1.A/,.A/&.A/
55f1 : __ __ __ BYT 21 81 41 2f 1c 81 41 2f 16 81 45 08 04 08 07 08 : !.A/..A/..E.....
5601 : __ __ __ BYT 7c 2f 48 08 7f 81 41 2f 42 81 41 2f 3d 81 41 2f : |/H...A/B.A/=.A/
5611 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
5621 : __ __ __ BYT 22 81 50 08 00 08 02 08 04 08 05 08 06 08 07 08 : ".P.............
5631 : __ __ __ BYT 78 08 7a 2c 11 08 7c 2d 39 08 7d 2e 39 08 7e 2f : x.z,..|-9.}.9.~/
5641 : __ __ __ BYT 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 43 2d 2e 2e : >...C-4.4/9.C-..
5651 : __ __ __ BYT 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 43 2d 24 2e : ./4.C-).)/..C-$.
5661 : __ __ __ BYT 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 43 2d 19 2e : $/).C-.../$.C-..
5671 : __ __ __ BYT 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 47 08 04 08 : ./..C-.../..G...
5681 : __ __ __ BYT 07 08 7c 2d 0e 2e 0e 2f 45 08 7f 81 43 2d 09 2e : ..|-.../E...C-..
5691 : __ __ __ BYT 09 2f 40 81 43 2d 04 2e 04 2f 3a 81 43 2d 00 2e : ./@.C-.../:.C-..
56a1 : __ __ __ BYT 00 2f 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 : ./5.A/0.A/*.A/%.
56b1 : __ __ __ BYT 41 2f 20 81 50 08 00 08 01 08 02 08 03 08 04 08 : A/ .P...........
56c1 : __ __ __ BYT 07 28 58 08 78 08 79 2a 58 08 7a 08 7b 2c 21 08 : .(X.x.y*X.z.{,!.
56d1 : __ __ __ BYT 7c 2f 40 08 7f 81 41 2f 3a 81 41 2f 35 81 41 2f : |/@...A/:.A/5.A/
56e1 : __ __ __ BYT 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 41 2f : 0.A/*.A/%.A/ .A/
56f1 : __ __ __ BYT 1a 81 4b 08 00 08 02 08 04 08 07 28 59 08 78 2a : ..K........(Y.x*
5701 : __ __ __ BYT 59 08 7a 08 7c 2f 4c 08 7f 81 41 2f 46 81 41 2f : Y.z.|/L...A/F.A/
5711 : __ __ __ BYT 41 81 41 2f 3c 81 41 2f 36 81 41 2f 31 81 41 2f : A.A/<.A/6.A/1.A/
5721 : __ __ __ BYT 2c 81 41 2f 26 81 55 08 00 08 01 08 02 08 03 08 : ,.A/&.U.........
5731 : __ __ __ BYT 04 08 05 08 07 28 5a 08 78 29 58 08 79 2a 5a 08 : .....(Z.x)X.y*Z.
5741 : __ __ __ BYT 7a 2b 58 08 7b 2c 18 08 7c 2d 39 08 7d 2f 39 08 : z+X.{,..|-9.}/9.
5751 : __ __ __ BYT 7f 81 42 2d 34 2f 34 81 42 2d 2e 2f 2e 81 42 2d : ..B-4/4.B-./..B-
5761 : __ __ __ BYT 29 2f 29 81 42 2d 24 2f 24 81 42 2d 1e 2f 1e 81 : )/).B-$/$.B-./..
5771 : __ __ __ BYT 42 2d 19 2f 19 81 42 2d 14 2f 14 81 50 08 00 08 : B-./..B-./..P...
5781 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 08 78 29 59 08 79 08 : ..........x)Y.y.
5791 : __ __ __ BYT 7a 2b 59 08 7b 08 7c 2d 0e 2f 49 08 7f 81 42 2d : z+Y.{.|-./I...B-
57a1 : __ __ __ BYT 09 2f 44 81 42 2d 04 2f 3e 81 42 2d 00 2f 39 81 : ./D.B-./>.B-./9.
57b1 : __ __ __ BYT 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f 24 81 : A/4.A/..A/).A/$.
57c1 : __ __ __ BYT 52 08 00 08 01 08 02 08 03 08 04 08 07 28 3a 08 : R............(:.
57d1 : __ __ __ BYT 78 29 5a 08 79 2a 3a 08 7a 2b 5a 08 7b 2c 28 08 : x)Z.y*:.z+Z.{,(.
57e1 : __ __ __ BYT 7c 2f 48 08 7f 81 41 2f 42 81 41 2f 3d 81 41 2f : |/H...A/B.A/=.A/
57f1 : __ __ __ BYT 38 81 41 2f 32 81 41 2f 2d 81 41 2f 28 81 41 2f : 8.A/2.A/-.A/(.A/
5801 : __ __ __ BYT 22 81 49 08 01 08 03 08 04 08 07 08 79 08 7b 08 : ".I.........y.{.
5811 : __ __ __ BYT 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f 31 81 41 2f : |/<...A/6.A/1.A/
5821 : __ __ __ BYT 2c 81 41 2f 26 81 41 2f 21 81 41 2f 1c 81 41 2f : ,.A/&.A/!.A/..A/
5831 : __ __ __ BYT 16 81 58 08 00 08 01 08 02 08 03 08 04 08 05 08 : ..X.............
5841 : __ __ __ BYT 06 08 07 28 5a 08 78 29 3a 08 79 2a 5a 08 7a 2b : ...(Z.x):.y*Z.z+
5851 : __ __ __ BYT 3a 08 7b 2c 18 08 7c 2d 39 08 7d 2e 39 08 7e 2f : :.{,..|-9.}.9.~/
5861 : __ __ __ BYT 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 43 2d 2e 2e : >...C-4.4/9.C-..
5871 : __ __ __ BYT 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 43 2d 24 2e : ./4.C-).)/..C-$.
5881 : __ __ __ BYT 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 43 2d 19 2e : $/).C-.../$.C-..
5891 : __ __ __ BYT 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 4b 08 00 08 : ./..C-.../..K...
58a1 : __ __ __ BYT 02 08 04 08 07 08 78 08 7a 08 7c 2d 0e 2e 0e 2f : ......x.z.|-.../
58b1 : __ __ __ BYT 45 08 7f 81 43 2d 09 2e 09 2f 40 81 43 2d 04 2e : E...C-.../@.C-..
58c1 : __ __ __ BYT 04 2f 3a 81 43 2d 00 2e 00 2f 35 81 41 2f 30 81 : ./:.C-.../5.A/0.
58d1 : __ __ __ BYT 41 2f 2a 81 41 2f 25 81 41 2f 20 81 52 08 00 08 : A/*.A/%.A/ .R...
58e1 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 3a 08 78 29 5a 08 : .........(:.x)Z.
58f1 : __ __ __ BYT 79 2a 3a 08 7a 2b 5a 08 7b 2c 28 08 7c 2f 40 08 : y*:.z+Z.{,(.|/@.
5901 : __ __ __ BYT 7f 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : ..A/:.A/5.A/0.A/
5911 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 41 2f 1a 81 49 08 : *.A/%.A/ .A/..I.
5921 : __ __ __ BYT 01 08 03 08 04 08 07 08 79 08 7b 08 7c 2f 39 08 : ........y.{.|/9.
5931 : __ __ __ BYT 7f 81 41 2f 34 81 41 2f 2e 81 41 2f 29 81 41 2f : ..A/4.A/..A/).A/
5941 : __ __ __ BYT 24 81 41 2f 1e 81 41 2f 19 81 41 2f 14 81 55 08 : $.A/..A/..A/..U.
5951 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 07 28 5a 08 : .............(Z.
5961 : __ __ __ BYT 78 29 3a 08 79 2a 5a 08 7a 2b 3a 08 7b 2c 15 08 : x):.y*Z.z+:.{,..
5971 : __ __ __ BYT 7c 2d 39 08 7d 2f 4c 08 7f 81 42 2d 34 2f 46 81 : |-9.}/L...B-4/F.
5981 : __ __ __ BYT 42 2d 2e 2f 41 81 42 2d 29 2f 3c 81 42 2d 24 2f : B-./A.B-)/<.B-$/
5991 : __ __ __ BYT 36 81 42 2d 1e 2f 31 81 42 2d 19 2f 2c 81 42 2d : 6.B-./1.B-./,.B-
59a1 : __ __ __ BYT 14 2f 26 81 4a 08 00 08 02 08 04 08 07 08 78 08 : ./&.J.........x.
59b1 : __ __ __ BYT 7a 08 7c 2d 0e 2f 49 08 7f 81 42 2d 09 2f 44 81 : z.|-./I...B-./D.
59c1 : __ __ __ BYT 42 2d 04 2f 3e 81 42 2d 00 2f 39 81 41 2f 34 81 : B-./>.B-./9.A/4.
59d1 : __ __ __ BYT 41 2f 2e 81 41 2f 29 81 41 2f 24 81 52 08 00 08 : A/..A/).A/$.R...
59e1 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 3a 08 78 29 5a 08 : .........(:.x)Z.
59f1 : __ __ __ BYT 79 2a 3a 08 7a 2b 5a 08 7b 2c 25 08 7c 2f 3c 08 : y*:.z+Z.{,%.|/<.
5a01 : __ __ __ BYT 7f 81 41 2f 36 81 41 2f 31 81 41 2f 2c 81 41 2f : ..A/6.A/1.A/,.A/
5a11 : __ __ __ BYT 26 81 41 2f 21 81 41 2f 1c 81 41 2f 16 81 49 08 : &.A/!.A/..A/..I.
5a21 : __ __ __ BYT 01 08 03 08 04 08 07 08 79 08 7b 08 7c 2f 48 08 : ........y.{.|/H.
5a31 : __ __ __ BYT 7f 81 41 2f 42 81 41 2f 3d 81 41 2f 38 81 41 2f : ..A/B.A/=.A/8.A/
5a41 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 58 08 : 2.A/-.A/(.A/".X.
5a51 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 06 08 07 28 : ...............(
5a61 : __ __ __ BYT 5a 08 78 29 3a 08 79 2a 5a 08 7a 2b 3a 08 7b 2c : Z.x):.y*Z.z+:.{,
5a71 : __ __ __ BYT 15 08 7c 2d 39 08 7d 2e 39 08 7e 2f 3e 08 7f 81 : ..|-9.}.9.~/>...
5a81 : __ __ __ BYT 43 2d 34 2e 34 2f 39 81 43 2d 2e 2e 2e 2f 34 81 : C-4.4/9.C-.../4.
5a91 : __ __ __ BYT 43 2d 29 2e 29 2f 2e 81 43 2d 24 2e 24 2f 29 81 : C-).)/..C-$.$/).
5aa1 : __ __ __ BYT 43 2d 1e 2e 1e 2f 24 81 43 2d 19 2e 19 2f 1e 81 : C-.../$.C-.../..
5ab1 : __ __ __ BYT 43 2d 14 2e 14 2f 19 81 4d 08 00 08 02 08 04 08 : C-.../..M.......
5ac1 : __ __ __ BYT 07 28 58 08 78 2a 58 08 7a 08 7c 2d 0e 2e 0e 2f : .(X.x*X.z.|-.../
5ad1 : __ __ __ BYT 45 08 7f 81 43 2d 09 2e 09 2f 40 81 43 2d 04 2e : E...C-.../@.C-..
5ae1 : __ __ __ BYT 04 2f 3a 81 43 2d 00 2e 00 2f 35 81 41 2f 30 81 : ./:.C-.../5.A/0.
5af1 : __ __ __ BYT 41 2f 2a 81 41 2f 25 81 41 2f 20 81 52 08 00 08 : A/*.A/%.A/ .R...
5b01 : __ __ __ BYT 01 08 02 08 03 08 04 08 07 28 55 08 78 29 5a 08 : .........(U.x)Z.
5b11 : __ __ __ BYT 79 2a 55 08 7a 2b 5a 08 7b 2c 25 08 7c 2f 40 08 : y*U.z+Z.{,%.|/@.
5b21 : __ __ __ BYT 7f 81 41 2f 3a 81 41 2f 35 81 41 2f 30 81 41 2f : ..A/:.A/5.A/0.A/
5b31 : __ __ __ BYT 2a 81 41 2f 25 81 41 2f 20 81 41 2f 1a 81 51 08 : *.A/%.A/ .A/..Q.
5b41 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 07 28 4e 08 78 29 : ...........(N.x)
5b51 : __ __ __ BYT 58 08 79 2a 4e 08 7a 2b 58 08 7b 08 7c 2f 4c 08 : X.y*N.z+X.{.|/L.
5b61 : __ __ __ BYT 7f 81 41 2f 46 81 41 2f 41 81 41 2f 3c 81 41 2f : ..A/F.A/A.A/<.A/
5b71 : __ __ __ BYT 36 81 41 2f 31 81 41 2f 2c 81 41 2f 26 81 55 08 : 6.A/1.A/,.A/&.U.
5b81 : __ __ __ BYT 00 08 01 08 02 08 03 08 04 08 05 08 07 28 51 08 : .............(Q.
5b91 : __ __ __ BYT 78 29 55 08 79 2a 51 08 7a 2b 55 08 7b 2c 12 08 : x)U.y*Q.z+U.{,..
5ba1 : __ __ __ BYT 7c 2d 39 08 7d 2f 49 08 7f 81 42 2d 34 2f 44 81 : |-9.}/I...B-4/D.
5bb1 : __ __ __ BYT 42 2d 2e 2f 3e 81 42 2d 29 2f 39 81 42 2d 24 2f : B-./>.B-)/9.B-$/
5bc1 : __ __ __ BYT 34 81 42 2d 1e 2f 2e 81 42 2d 19 2f 29 81 42 2d : 4.B-./..B-./).B-
5bd1 : __ __ __ BYT 14 2f 24 81 4c 08 01 08 03 08 04 08 07 29 4e 08 : ./$.L........)N.
5be1 : __ __ __ BYT 79 2b 4e 08 7b 08 7c 2d 0e 2f 39 08 7f 81 42 2d : y+N.{.|-./9...B-
5bf1 : __ __ __ BYT 09 2f 34 81 42 2d 04 2f 2e 81 42 2d 00 2f 29 81 : ./4.B-./..B-./).
5c01 : __ __ __ BYT 41 2f 24 81 41 2f 1e 81 41 2f 19 81 41 2f 14 81 : A/$.A/..A/..A/..
5c11 : __ __ __ BYT 4c 08 01 08 03 08 04 08 07 29 51 08 79 2b 51 08 : L........)Q.y+Q.
5c21 : __ __ __ BYT 7b 2c 22 08 7c 2f 3c 08 7f 81 41 2f 36 81 41 2f : {,".|/<...A/6.A/
5c31 : __ __ __ BYT 31 81 41 2f 2c 81 41 2f 26 81 41 2f 21 81 41 2f : 1.A/,.A/&.A/!.A/
5c41 : __ __ __ BYT 1c 81 41 2f 16 81 45 08 04 08 07 08 7c 2f 48 08 : ..A/..E.....|/H.
5c51 : __ __ __ BYT 7f 81 41 2f 42 81 41 2f 3d 81 41 2f 38 81 41 2f : ..A/B.A/=.A/8.A/
5c61 : __ __ __ BYT 32 81 41 2f 2d 81 41 2f 28 81 41 2f 22 81 4c 08 : 2.A/-.A/(.A/".L.
5c71 : __ __ __ BYT 04 08 05 08 06 08 07 2c 12 08 7c 2d 39 08 7d 2e : .......,..|-9.}.
5c81 : __ __ __ BYT 39 08 7e 2f 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 : 9.~/>...C-4.4/9.
5c91 : __ __ __ BYT 43 2d 2e 2e 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 : C-.../4.C-).)/..
5ca1 : __ __ __ BYT 43 2d 24 2e 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 : C-$.$/).C-.../$.
5cb1 : __ __ __ BYT 43 2d 19 2e 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 : C-.../..C-.../..
5cc1 : __ __ __ BYT 47 08 04 08 07 08 7c 2d 0e 2e 0e 2f 45 08 7f 81 : G.....|-.../E...
5cd1 : __ __ __ BYT 43 2d 09 2e 09 2f 40 81 43 2d 04 2e 04 2f 3a 81 : C-.../@.C-.../:.
5ce1 : __ __ __ BYT 43 2d 00 2e 00 2f 35 81 41 2f 30 81 41 2f 2a 81 : C-.../5.A/0.A/*.
5cf1 : __ __ __ BYT 41 2f 25 81 41 2f 20 81 46 08 04 08 07 2c 22 08 : A/%.A/ .F....,".
5d01 : __ __ __ BYT 7c 2f 40 08 7f 81 41 2f 3a 81 41 2f 35 81 41 2f : |/@...A/:.A/5.A/
5d11 : __ __ __ BYT 30 81 41 2f 2a 81 41 2f 25 81 41 2f 20 81 41 2f : 0.A/*.A/%.A/ .A/
5d21 : __ __ __ BYT 1a 81 45 08 04 08 07 08 7c 2f 49 08 7f 81 41 2f : ..E.....|/I...A/
5d31 : __ __ __ BYT 44 81 41 2f 3e 81 41 2f 39 81 41 2f 34 81 41 2f : D.A/>.A/9.A/4.A/
5d41 : __ __ __ BYT 2e 81 41 2f 29 81 41 2f 24 81 49 08 04 08 05 08 : ..A/).A/$.I.....
5d51 : __ __ __ BYT 07 2c 11 08 7c 2d 39 08 7d 2f 4c 08 7f 81 42 2d : .,..|-9.}/L...B-
5d61 : __ __ __ BYT 34 2f 46 81 42 2d 2e 2f 41 81 42 2d 29 2f 3c 81 : 4/F.B-./A.B-)/<.
5d71 : __ __ __ BYT 42 2d 24 2f 36 81 42 2d 1e 2f 31 81 42 2d 19 2f : B-$/6.B-./1.B-./
5d81 : __ __ __ BYT 2c 81 42 2d 14 2f 26 81 49 08 04 08 06 08 07 08 : ,.B-./&.I.......
5d91 : __ __ __ BYT 7c 2d 0e 2e 39 08 7e 2f 39 08 7f 81 43 2d 09 2e : |-..9.~/9...C-..
5da1 : __ __ __ BYT 34 2f 34 81 43 2d 04 2e 2e 2f 2e 81 43 2d 00 2e : 4/4.C-.../..C-..
5db1 : __ __ __ BYT 29 2f 29 81 42 2e 24 2f 24 81 42 2e 1e 2f 1e 81 : )/).B.$/$.B../..
5dc1 : __ __ __ BYT 42 2e 19 2f 19 81 42 2e 14 2f 14 81 47 08 04 08 : B../..B../..G...
5dd1 : __ __ __ BYT 07 2c 21 08 7c 2e 0e 2f 3c 08 7f 81 42 2e 09 2f : .,!.|../<...B../
5de1 : __ __ __ BYT 36 81 42 2e 04 2f 31 81 42 2e 00 2f 2c 81 41 2f : 6.B../1.B../,.A/
5df1 : __ __ __ BYT 26 81 41 2f 21 81 41 2f 1c 81 41 2f 16 81 48 08 : &.A/!.A/..A/..H.
5e01 : __ __ __ BYT 04 08 06 08 07 08 7c 2e 39 08 7e 2f 48 08 7f 81 : ......|.9.~/H...
5e11 : __ __ __ BYT 42 2e 34 2f 42 81 42 2e 2e 2f 3d 81 42 2e 29 2f : B.4/B.B../=.B.)/
5e21 : __ __ __ BYT 38 81 42 2e 24 2f 32 81 42 2e 1e 2f 2d 81 42 2e : 8.B.$/2.B../-.B.
5e31 : __ __ __ BYT 19 2f 28 81 42 2e 14 2f 22 81 4c 08 04 08 05 08 : ./(.B../".L.....
5e41 : __ __ __ BYT 06 08 07 2c 11 08 7c 2d 39 08 7d 2e 39 08 7e 2f : ...,..|-9.}.9.~/
5e51 : __ __ __ BYT 3e 08 7f 81 43 2d 34 2e 34 2f 39 81 43 2d 2e 2e : >...C-4.4/9.C-..
5e61 : __ __ __ BYT 2e 2f 34 81 43 2d 29 2e 29 2f 2e 81 43 2d 24 2e : ./4.C-).)/..C-$.
5e71 : __ __ __ BYT 24 2f 29 81 43 2d 1e 2e 1e 2f 24 81 43 2d 19 2e : $/).C-.../$.C-..
5e81 : __ __ __ BYT 19 2f 1e 81 43 2d 14 2e 14 2f 19 81 47 08 04 08 : ./..C-.../..G...
5e91 : __ __ __ BYT 07 08 7c 2d 0e 2e 0e 2f 45 08 7f 81 43 2d 09 2e : ..|-.../E...C-..
5ea1 : __ __ __ BYT 09 2f 40 81 43 2d 04 2e 04 2f 3a 81 43 2d 00 2e : ./@.C-.../:.C-..
5eb1 : __ __ __ BYT 00 2f 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 : ./5.A/0.A/*.A/%.
5ec1 : __ __ __ BYT 41 2f 20 81 49 08 04 08 06 08 07 2c 21 08 7c 2e : A/ .I......,!.|.
5ed1 : __ __ __ BYT 39 08 7e 2f 40 08 7f 81 42 2e 34 2f 3a 81 42 2e : 9.~/@...B.4/:.B.
5ee1 : __ __ __ BYT 2e 2f 35 81 42 2e 29 2f 30 81 42 2e 24 2f 2a 81 : ./5.B.)/0.B.$/*.
5ef1 : __ __ __ BYT 42 2e 1e 2f 25 81 42 2e 19 2f 20 81 42 2e 14 2f : B../%.B../ .B../
5f01 : __ __ __ BYT 1a 81 46 08 04 08 07 08 7c 2e 0e 2f 45 08 7f 81 : ..F.....|../E...
5f11 : __ __ __ BYT 42 2e 09 2f 40 81 42 2e 04 2f 3a 81 42 2e 00 2f : B../@.B../:.B../
5f21 : __ __ __ BYT 35 81 41 2f 30 81 41 2f 2a 81 41 2f 25 81 41 2f : 5.A/0.A/*.A/%.A/
5f31 : __ __ __ BYT 20 81 4f 08 00 08 02 08 04 08 05 08 07 28 48 08 :  .O..........(H.
5f41 : __ __ __ BYT 78 2a 48 08 7a 2c 18 08 7c 2d 39 08 7d 2f 39 08 : x*H.z,..|-9.}/9.
5f51 : __ __ __ BYT 7f 81 80                                        : ...
--------------------------------------------------------------------
freg:
176f : b1 39 __ LDA (IP + 0),y 
1771 : c8 __ __ INY
1772 : aa __ __ TAX
1773 : b5 00 __ LDA $00,x 
1775 : 85 23 __ STA WORK + 0 
1777 : b5 01 __ LDA $01,x 
1779 : 85 24 __ STA WORK + 1 
177b : b5 02 __ LDA $02,x 
177d : 85 25 __ STA WORK + 2 
177f : b5 03 __ LDA $03,x 
1781 : 85 26 __ STA WORK + 3 
1783 : a5 25 __ LDA WORK + 2 
1785 : 0a __ __ ASL
1786 : a5 26 __ LDA WORK + 3 
1788 : 2a __ __ ROL
1789 : 85 28 __ STA WORK + 5 
178b : f0 06 __ BEQ $1793 ; (freg + 36)
178d : a5 25 __ LDA WORK + 2 
178f : 09 80 __ ORA #$80
1791 : 85 25 __ STA WORK + 2 
1793 : a5 3d __ LDA ACCU + 2 
1795 : 0a __ __ ASL
1796 : a5 3e __ LDA ACCU + 3 
1798 : 2a __ __ ROL
1799 : 85 27 __ STA WORK + 4 
179b : f0 06 __ BEQ $17a3 ; (freg + 52)
179d : a5 3d __ LDA ACCU + 2 
179f : 09 80 __ ORA #$80
17a1 : 85 3d __ STA ACCU + 2 
17a3 : 60 __ __ RTS
17a4 : 06 3e __ ASL ACCU + 3 
17a6 : a5 27 __ LDA WORK + 4 
17a8 : 6a __ __ ROR
17a9 : 85 3e __ STA ACCU + 3 
17ab : b0 06 __ BCS $17b3 ; (freg + 68)
17ad : a5 3d __ LDA ACCU + 2 
17af : 29 7f __ AND #$7f
17b1 : 85 3d __ STA ACCU + 2 
17b3 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub:
17b4 : a9 ff __ LDA #$ff
17b6 : c5 27 __ CMP WORK + 4 
17b8 : f0 04 __ BEQ $17be ; (faddsub + 10)
17ba : c5 28 __ CMP WORK + 5 
17bc : d0 11 __ BNE $17cf ; (faddsub + 27)
17be : a5 3e __ LDA ACCU + 3 
17c0 : 09 7f __ ORA #$7f
17c2 : 85 3e __ STA ACCU + 3 
17c4 : a9 80 __ LDA #$80
17c6 : 85 3d __ STA ACCU + 2 
17c8 : a9 00 __ LDA #$00
17ca : 85 3b __ STA ACCU + 0 
17cc : 85 3c __ STA ACCU + 1 
17ce : 60 __ __ RTS
17cf : 38 __ __ SEC
17d0 : a5 27 __ LDA WORK + 4 
17d2 : e5 28 __ SBC WORK + 5 
17d4 : f0 38 __ BEQ $180e ; (faddsub + 90)
17d6 : aa __ __ TAX
17d7 : b0 25 __ BCS $17fe ; (faddsub + 74)
17d9 : e0 e9 __ CPX #$e9
17db : b0 0e __ BCS $17eb ; (faddsub + 55)
17dd : a5 28 __ LDA WORK + 5 
17df : 85 27 __ STA WORK + 4 
17e1 : a9 00 __ LDA #$00
17e3 : 85 3b __ STA ACCU + 0 
17e5 : 85 3c __ STA ACCU + 1 
17e7 : 85 3d __ STA ACCU + 2 
17e9 : f0 23 __ BEQ $180e ; (faddsub + 90)
17eb : a5 3d __ LDA ACCU + 2 
17ed : 4a __ __ LSR
17ee : 66 3c __ ROR ACCU + 1 
17f0 : 66 3b __ ROR ACCU + 0 
17f2 : e8 __ __ INX
17f3 : d0 f8 __ BNE $17ed ; (faddsub + 57)
17f5 : 85 3d __ STA ACCU + 2 
17f7 : a5 28 __ LDA WORK + 5 
17f9 : 85 27 __ STA WORK + 4 
17fb : 4c 0e 18 JMP $180e ; (faddsub + 90)
17fe : e0 18 __ CPX #$18
1800 : b0 33 __ BCS $1835 ; (faddsub + 129)
1802 : a5 25 __ LDA WORK + 2 
1804 : 4a __ __ LSR
1805 : 66 24 __ ROR WORK + 1 
1807 : 66 23 __ ROR WORK + 0 
1809 : ca __ __ DEX
180a : d0 f8 __ BNE $1804 ; (faddsub + 80)
180c : 85 25 __ STA WORK + 2 
180e : a5 3e __ LDA ACCU + 3 
1810 : 29 80 __ AND #$80
1812 : 85 3e __ STA ACCU + 3 
1814 : 45 26 __ EOR WORK + 3 
1816 : 30 31 __ BMI $1849 ; (faddsub + 149)
1818 : 18 __ __ CLC
1819 : a5 3b __ LDA ACCU + 0 
181b : 65 23 __ ADC WORK + 0 
181d : 85 3b __ STA ACCU + 0 
181f : a5 3c __ LDA ACCU + 1 
1821 : 65 24 __ ADC WORK + 1 
1823 : 85 3c __ STA ACCU + 1 
1825 : a5 3d __ LDA ACCU + 2 
1827 : 65 25 __ ADC WORK + 2 
1829 : 85 3d __ STA ACCU + 2 
182b : 90 08 __ BCC $1835 ; (faddsub + 129)
182d : 66 3d __ ROR ACCU + 2 
182f : 66 3c __ ROR ACCU + 1 
1831 : 66 3b __ ROR ACCU + 0 
1833 : e6 27 __ INC WORK + 4 
1835 : a5 27 __ LDA WORK + 4 
1837 : c9 ff __ CMP #$ff
1839 : f0 83 __ BEQ $17be ; (faddsub + 10)
183b : 4a __ __ LSR
183c : 05 3e __ ORA ACCU + 3 
183e : 85 3e __ STA ACCU + 3 
1840 : b0 06 __ BCS $1848 ; (faddsub + 148)
1842 : a5 3d __ LDA ACCU + 2 
1844 : 29 7f __ AND #$7f
1846 : 85 3d __ STA ACCU + 2 
1848 : 60 __ __ RTS
1849 : 38 __ __ SEC
184a : a5 3b __ LDA ACCU + 0 
184c : e5 23 __ SBC WORK + 0 
184e : 85 3b __ STA ACCU + 0 
1850 : a5 3c __ LDA ACCU + 1 
1852 : e5 24 __ SBC WORK + 1 
1854 : 85 3c __ STA ACCU + 1 
1856 : a5 3d __ LDA ACCU + 2 
1858 : e5 25 __ SBC WORK + 2 
185a : 85 3d __ STA ACCU + 2 
185c : b0 19 __ BCS $1877 ; (faddsub + 195)
185e : 38 __ __ SEC
185f : a9 00 __ LDA #$00
1861 : e5 3b __ SBC ACCU + 0 
1863 : 85 3b __ STA ACCU + 0 
1865 : a9 00 __ LDA #$00
1867 : e5 3c __ SBC ACCU + 1 
1869 : 85 3c __ STA ACCU + 1 
186b : a9 00 __ LDA #$00
186d : e5 3d __ SBC ACCU + 2 
186f : 85 3d __ STA ACCU + 2 
1871 : a5 3e __ LDA ACCU + 3 
1873 : 49 80 __ EOR #$80
1875 : 85 3e __ STA ACCU + 3 
1877 : a5 3d __ LDA ACCU + 2 
1879 : 30 ba __ BMI $1835 ; (faddsub + 129)
187b : 05 3c __ ORA ACCU + 1 
187d : 05 3b __ ORA ACCU + 0 
187f : f0 0f __ BEQ $1890 ; (faddsub + 220)
1881 : c6 27 __ DEC WORK + 4 
1883 : f0 0b __ BEQ $1890 ; (faddsub + 220)
1885 : 06 3b __ ASL ACCU + 0 
1887 : 26 3c __ ROL ACCU + 1 
1889 : 26 3d __ ROL ACCU + 2 
188b : 10 f4 __ BPL $1881 ; (faddsub + 205)
188d : 4c 35 18 JMP $1835 ; (faddsub + 129)
1890 : a9 00 __ LDA #$00
1892 : 85 3b __ STA ACCU + 0 
1894 : 85 3c __ STA ACCU + 1 
1896 : 85 3d __ STA ACCU + 2 
1898 : 85 3e __ STA ACCU + 3 
189a : 60 __ __ RTS
--------------------------------------------------------------------
fmul:
189b : a5 3b __ LDA ACCU + 0 
189d : 05 3c __ ORA ACCU + 1 
189f : 05 3d __ ORA ACCU + 2 
18a1 : d0 03 __ BNE $18a6 ; (fmul + 11)
18a3 : 85 3e __ STA ACCU + 3 
18a5 : 60 __ __ RTS
18a6 : a5 23 __ LDA WORK + 0 
18a8 : 05 24 __ ORA WORK + 1 
18aa : 05 25 __ ORA WORK + 2 
18ac : d0 09 __ BNE $18b7 ; (fmul + 28)
18ae : 85 3b __ STA ACCU + 0 
18b0 : 85 3c __ STA ACCU + 1 
18b2 : 85 3d __ STA ACCU + 2 
18b4 : 85 3e __ STA ACCU + 3 
18b6 : 60 __ __ RTS
18b7 : a5 3e __ LDA ACCU + 3 
18b9 : 45 26 __ EOR WORK + 3 
18bb : 29 80 __ AND #$80
18bd : 85 3e __ STA ACCU + 3 
18bf : a9 ff __ LDA #$ff
18c1 : c5 27 __ CMP WORK + 4 
18c3 : f0 42 __ BEQ $1907 ; (fmul + 108)
18c5 : c5 28 __ CMP WORK + 5 
18c7 : f0 3e __ BEQ $1907 ; (fmul + 108)
18c9 : a9 00 __ LDA #$00
18cb : 85 29 __ STA WORK + 6 
18cd : 85 2a __ STA WORK + 7 
18cf : 85 2b __ STA $2b 
18d1 : a4 3b __ LDY ACCU + 0 
18d3 : a5 23 __ LDA WORK + 0 
18d5 : d0 06 __ BNE $18dd ; (fmul + 66)
18d7 : a5 24 __ LDA WORK + 1 
18d9 : f0 0a __ BEQ $18e5 ; (fmul + 74)
18db : d0 05 __ BNE $18e2 ; (fmul + 71)
18dd : 20 3c 19 JSR $193c ; (fmul8 + 0)
18e0 : a5 24 __ LDA WORK + 1 
18e2 : 20 3c 19 JSR $193c ; (fmul8 + 0)
18e5 : a5 25 __ LDA WORK + 2 
18e7 : 20 3c 19 JSR $193c ; (fmul8 + 0)
18ea : 38 __ __ SEC
18eb : a5 2b __ LDA $2b 
18ed : 30 06 __ BMI $18f5 ; (fmul + 90)
18ef : 06 29 __ ASL WORK + 6 
18f1 : 26 2a __ ROL WORK + 7 
18f3 : 2a __ __ ROL
18f4 : 18 __ __ CLC
18f5 : 29 7f __ AND #$7f
18f7 : 85 2b __ STA $2b 
18f9 : a5 27 __ LDA WORK + 4 
18fb : 65 28 __ ADC WORK + 5 
18fd : 90 19 __ BCC $1918 ; (fmul + 125)
18ff : e9 7f __ SBC #$7f
1901 : b0 04 __ BCS $1907 ; (fmul + 108)
1903 : c9 ff __ CMP #$ff
1905 : d0 15 __ BNE $191c ; (fmul + 129)
1907 : a5 3e __ LDA ACCU + 3 
1909 : 09 7f __ ORA #$7f
190b : 85 3e __ STA ACCU + 3 
190d : a9 80 __ LDA #$80
190f : 85 3d __ STA ACCU + 2 
1911 : a9 00 __ LDA #$00
1913 : 85 3b __ STA ACCU + 0 
1915 : 85 3c __ STA ACCU + 1 
1917 : 60 __ __ RTS
1918 : e9 7e __ SBC #$7e
191a : 90 15 __ BCC $1931 ; (fmul + 150)
191c : 4a __ __ LSR
191d : 05 3e __ ORA ACCU + 3 
191f : 85 3e __ STA ACCU + 3 
1921 : a9 00 __ LDA #$00
1923 : 6a __ __ ROR
1924 : 05 2b __ ORA $2b 
1926 : 85 3d __ STA ACCU + 2 
1928 : a5 2a __ LDA WORK + 7 
192a : 85 3c __ STA ACCU + 1 
192c : a5 29 __ LDA WORK + 6 
192e : 85 3b __ STA ACCU + 0 
1930 : 60 __ __ RTS
1931 : a9 00 __ LDA #$00
1933 : 85 3b __ STA ACCU + 0 
1935 : 85 3c __ STA ACCU + 1 
1937 : 85 3d __ STA ACCU + 2 
1939 : 85 3e __ STA ACCU + 3 
193b : 60 __ __ RTS
--------------------------------------------------------------------
fmul8:
193c : 38 __ __ SEC
193d : 6a __ __ ROR
193e : 90 1e __ BCC $195e ; (fmul8 + 34)
1940 : aa __ __ TAX
1941 : 18 __ __ CLC
1942 : 98 __ __ TYA
1943 : 65 29 __ ADC WORK + 6 
1945 : 85 29 __ STA WORK + 6 
1947 : a5 2a __ LDA WORK + 7 
1949 : 65 3c __ ADC ACCU + 1 
194b : 85 2a __ STA WORK + 7 
194d : a5 2b __ LDA $2b 
194f : 65 3d __ ADC ACCU + 2 
1951 : 6a __ __ ROR
1952 : 85 2b __ STA $2b 
1954 : 8a __ __ TXA
1955 : 66 2a __ ROR WORK + 7 
1957 : 66 29 __ ROR WORK + 6 
1959 : 4a __ __ LSR
195a : f0 0d __ BEQ $1969 ; (fmul8 + 45)
195c : b0 e2 __ BCS $1940 ; (fmul8 + 4)
195e : 66 2b __ ROR $2b 
1960 : 66 2a __ ROR WORK + 7 
1962 : 66 29 __ ROR WORK + 6 
1964 : 4a __ __ LSR
1965 : 90 f7 __ BCC $195e ; (fmul8 + 34)
1967 : d0 d7 __ BNE $1940 ; (fmul8 + 4)
1969 : 60 __ __ RTS
--------------------------------------------------------------------
fdiv:
196a : a5 3b __ LDA ACCU + 0 
196c : 05 3c __ ORA ACCU + 1 
196e : 05 3d __ ORA ACCU + 2 
1970 : d0 03 __ BNE $1975 ; (fdiv + 11)
1972 : 85 3e __ STA ACCU + 3 
1974 : 60 __ __ RTS
1975 : a5 3e __ LDA ACCU + 3 
1977 : 45 26 __ EOR WORK + 3 
1979 : 29 80 __ AND #$80
197b : 85 3e __ STA ACCU + 3 
197d : a5 28 __ LDA WORK + 5 
197f : f0 62 __ BEQ $19e3 ; (fdiv + 121)
1981 : a5 27 __ LDA WORK + 4 
1983 : c9 ff __ CMP #$ff
1985 : f0 5c __ BEQ $19e3 ; (fdiv + 121)
1987 : a9 00 __ LDA #$00
1989 : 85 29 __ STA WORK + 6 
198b : 85 2a __ STA WORK + 7 
198d : 85 2b __ STA $2b 
198f : a2 18 __ LDX #$18
1991 : a5 3b __ LDA ACCU + 0 
1993 : c5 23 __ CMP WORK + 0 
1995 : a5 3c __ LDA ACCU + 1 
1997 : e5 24 __ SBC WORK + 1 
1999 : a5 3d __ LDA ACCU + 2 
199b : e5 25 __ SBC WORK + 2 
199d : 90 13 __ BCC $19b2 ; (fdiv + 72)
199f : a5 3b __ LDA ACCU + 0 
19a1 : e5 23 __ SBC WORK + 0 
19a3 : 85 3b __ STA ACCU + 0 
19a5 : a5 3c __ LDA ACCU + 1 
19a7 : e5 24 __ SBC WORK + 1 
19a9 : 85 3c __ STA ACCU + 1 
19ab : a5 3d __ LDA ACCU + 2 
19ad : e5 25 __ SBC WORK + 2 
19af : 85 3d __ STA ACCU + 2 
19b1 : 38 __ __ SEC
19b2 : 26 29 __ ROL WORK + 6 
19b4 : 26 2a __ ROL WORK + 7 
19b6 : 26 2b __ ROL $2b 
19b8 : ca __ __ DEX
19b9 : f0 0a __ BEQ $19c5 ; (fdiv + 91)
19bb : 06 3b __ ASL ACCU + 0 
19bd : 26 3c __ ROL ACCU + 1 
19bf : 26 3d __ ROL ACCU + 2 
19c1 : b0 dc __ BCS $199f ; (fdiv + 53)
19c3 : 90 cc __ BCC $1991 ; (fdiv + 39)
19c5 : 38 __ __ SEC
19c6 : a5 2b __ LDA $2b 
19c8 : 30 06 __ BMI $19d0 ; (fdiv + 102)
19ca : 06 29 __ ASL WORK + 6 
19cc : 26 2a __ ROL WORK + 7 
19ce : 2a __ __ ROL
19cf : 18 __ __ CLC
19d0 : 29 7f __ AND #$7f
19d2 : 85 2b __ STA $2b 
19d4 : a5 27 __ LDA WORK + 4 
19d6 : e5 28 __ SBC WORK + 5 
19d8 : 90 1a __ BCC $19f4 ; (fdiv + 138)
19da : 18 __ __ CLC
19db : 69 7f __ ADC #$7f
19dd : b0 04 __ BCS $19e3 ; (fdiv + 121)
19df : c9 ff __ CMP #$ff
19e1 : d0 15 __ BNE $19f8 ; (fdiv + 142)
19e3 : a5 3e __ LDA ACCU + 3 
19e5 : 09 7f __ ORA #$7f
19e7 : 85 3e __ STA ACCU + 3 
19e9 : a9 80 __ LDA #$80
19eb : 85 3d __ STA ACCU + 2 
19ed : a9 00 __ LDA #$00
19ef : 85 3c __ STA ACCU + 1 
19f1 : 85 3b __ STA ACCU + 0 
19f3 : 60 __ __ RTS
19f4 : 69 7f __ ADC #$7f
19f6 : 90 15 __ BCC $1a0d ; (fdiv + 163)
19f8 : 4a __ __ LSR
19f9 : 05 3e __ ORA ACCU + 3 
19fb : 85 3e __ STA ACCU + 3 
19fd : a9 00 __ LDA #$00
19ff : 6a __ __ ROR
1a00 : 05 2b __ ORA $2b 
1a02 : 85 3d __ STA ACCU + 2 
1a04 : a5 2a __ LDA WORK + 7 
1a06 : 85 3c __ STA ACCU + 1 
1a08 : a5 29 __ LDA WORK + 6 
1a0a : 85 3b __ STA ACCU + 0 
1a0c : 60 __ __ RTS
1a0d : a9 00 __ LDA #$00
1a0f : 85 3e __ STA ACCU + 3 
1a11 : 85 3d __ STA ACCU + 2 
1a13 : 85 3c __ STA ACCU + 1 
1a15 : 85 3b __ STA ACCU + 0 
1a17 : 60 __ __ RTS
--------------------------------------------------------------------
divs16:
1a18 : 24 3c __ BIT ACCU + 1 
1a1a : 10 0d __ BPL $1a29 ; (divs16 + 17)
1a1c : 20 36 1a JSR $1a36 ; (negaccu + 0)
1a1f : 24 24 __ BIT WORK + 1 
1a21 : 10 0d __ BPL $1a30 ; (divs16 + 24)
1a23 : 20 44 1a JSR $1a44 ; (negtmp + 0)
1a26 : 4c 52 1a JMP $1a52 ; (divmod + 0)
1a29 : 24 24 __ BIT WORK + 1 
1a2b : 10 f9 __ BPL $1a26 ; (divs16 + 14)
1a2d : 20 44 1a JSR $1a44 ; (negtmp + 0)
1a30 : 20 52 1a JSR $1a52 ; (divmod + 0)
1a33 : 4c 36 1a JMP $1a36 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu:
1a36 : 38 __ __ SEC
1a37 : a9 00 __ LDA #$00
1a39 : e5 3b __ SBC ACCU + 0 
1a3b : 85 3b __ STA ACCU + 0 
1a3d : a9 00 __ LDA #$00
1a3f : e5 3c __ SBC ACCU + 1 
1a41 : 85 3c __ STA ACCU + 1 
1a43 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp:
1a44 : 38 __ __ SEC
1a45 : a9 00 __ LDA #$00
1a47 : e5 23 __ SBC WORK + 0 
1a49 : 85 23 __ STA WORK + 0 
1a4b : a9 00 __ LDA #$00
1a4d : e5 24 __ SBC WORK + 1 
1a4f : 85 24 __ STA WORK + 1 
1a51 : 60 __ __ RTS
--------------------------------------------------------------------
divmod:
1a52 : a5 3c __ LDA ACCU + 1 
1a54 : d0 31 __ BNE $1a87 ; (divmod + 53)
1a56 : a5 24 __ LDA WORK + 1 
1a58 : d0 1e __ BNE $1a78 ; (divmod + 38)
1a5a : 85 26 __ STA WORK + 3 
1a5c : a2 04 __ LDX #$04
1a5e : 06 3b __ ASL ACCU + 0 
1a60 : 2a __ __ ROL
1a61 : c5 23 __ CMP WORK + 0 
1a63 : 90 02 __ BCC $1a67 ; (divmod + 21)
1a65 : e5 23 __ SBC WORK + 0 
1a67 : 26 3b __ ROL ACCU + 0 
1a69 : 2a __ __ ROL
1a6a : c5 23 __ CMP WORK + 0 
1a6c : 90 02 __ BCC $1a70 ; (divmod + 30)
1a6e : e5 23 __ SBC WORK + 0 
1a70 : 26 3b __ ROL ACCU + 0 
1a72 : ca __ __ DEX
1a73 : d0 eb __ BNE $1a60 ; (divmod + 14)
1a75 : 85 25 __ STA WORK + 2 
1a77 : 60 __ __ RTS
1a78 : a5 3b __ LDA ACCU + 0 
1a7a : 85 25 __ STA WORK + 2 
1a7c : a5 3c __ LDA ACCU + 1 
1a7e : 85 26 __ STA WORK + 3 
1a80 : a9 00 __ LDA #$00
1a82 : 85 3b __ STA ACCU + 0 
1a84 : 85 3c __ STA ACCU + 1 
1a86 : 60 __ __ RTS
1a87 : a5 24 __ LDA WORK + 1 
1a89 : d0 1f __ BNE $1aaa ; (divmod + 88)
1a8b : a5 23 __ LDA WORK + 0 
1a8d : 30 1b __ BMI $1aaa ; (divmod + 88)
1a8f : a9 00 __ LDA #$00
1a91 : 85 26 __ STA WORK + 3 
1a93 : a2 10 __ LDX #$10
1a95 : 06 3b __ ASL ACCU + 0 
1a97 : 26 3c __ ROL ACCU + 1 
1a99 : 2a __ __ ROL
1a9a : c5 23 __ CMP WORK + 0 
1a9c : 90 02 __ BCC $1aa0 ; (divmod + 78)
1a9e : e5 23 __ SBC WORK + 0 
1aa0 : 26 3b __ ROL ACCU + 0 
1aa2 : 26 3c __ ROL ACCU + 1 
1aa4 : ca __ __ DEX
1aa5 : d0 f2 __ BNE $1a99 ; (divmod + 71)
1aa7 : 85 25 __ STA WORK + 2 
1aa9 : 60 __ __ RTS
1aaa : a9 00 __ LDA #$00
1aac : 85 25 __ STA WORK + 2 
1aae : 85 26 __ STA WORK + 3 
1ab0 : 84 22 __ STY $22 
1ab2 : a0 10 __ LDY #$10
1ab4 : 18 __ __ CLC
1ab5 : 26 3b __ ROL ACCU + 0 
1ab7 : 26 3c __ ROL ACCU + 1 
1ab9 : 26 25 __ ROL WORK + 2 
1abb : 26 26 __ ROL WORK + 3 
1abd : 38 __ __ SEC
1abe : a5 25 __ LDA WORK + 2 
1ac0 : e5 23 __ SBC WORK + 0 
1ac2 : aa __ __ TAX
1ac3 : a5 26 __ LDA WORK + 3 
1ac5 : e5 24 __ SBC WORK + 1 
1ac7 : 90 04 __ BCC $1acd ; (divmod + 123)
1ac9 : 86 25 __ STX WORK + 2 
1acb : 85 26 __ STA WORK + 3 
1acd : 88 __ __ DEY
1ace : d0 e5 __ BNE $1ab5 ; (divmod + 99)
1ad0 : 26 3b __ ROL ACCU + 0 
1ad2 : 26 3c __ ROL ACCU + 1 
1ad4 : a4 22 __ LDY $22 
1ad6 : 60 __ __ RTS
--------------------------------------------------------------------
mods16:
1ad7 : 24 3c __ BIT ACCU + 1 
1ad9 : 10 0d __ BPL $1ae8 ; (mods16 + 17)
1adb : 20 36 1a JSR $1a36 ; (negaccu + 0)
1ade : 24 24 __ BIT WORK + 1 
1ae0 : 10 0d __ BPL $1aef ; (mods16 + 24)
1ae2 : 20 44 1a JSR $1a44 ; (negtmp + 0)
1ae5 : 4c 52 1a JMP $1a52 ; (divmod + 0)
1ae8 : 24 24 __ BIT WORK + 1 
1aea : 10 f9 __ BPL $1ae5 ; (mods16 + 14)
1aec : 20 44 1a JSR $1a44 ; (negtmp + 0)
1aef : 20 52 1a JSR $1a52 ; (divmod + 0)
1af2 : 38 __ __ SEC
1af3 : a9 00 __ LDA #$00
1af5 : e5 25 __ SBC WORK + 2 
1af7 : 85 25 __ STA WORK + 2 
1af9 : a9 00 __ LDA #$00
1afb : e5 26 __ SBC WORK + 3 
1afd : 85 26 __ STA WORK + 3 
1aff : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16:
1b00 : 20 93 17 JSR $1793 ; (freg + 36)
1b03 : a5 27 __ LDA WORK + 4 
1b05 : c9 7f __ CMP #$7f
1b07 : b0 07 __ BCS $1b10 ; (f32_to_i16 + 16)
1b09 : a9 00 __ LDA #$00
1b0b : 85 3b __ STA ACCU + 0 
1b0d : 85 3c __ STA ACCU + 1 
1b0f : 60 __ __ RTS
1b10 : 38 __ __ SEC
1b11 : e9 8e __ SBC #$8e
1b13 : 90 0a __ BCC $1b1f ; (f32_to_i16 + 31)
1b15 : a9 ff __ LDA #$ff
1b17 : 85 3b __ STA ACCU + 0 
1b19 : a9 7f __ LDA #$7f
1b1b : 85 3c __ STA ACCU + 1 
1b1d : d0 08 __ BNE $1b27 ; (f32_to_i16 + 39)
1b1f : aa __ __ TAX
1b20 : 46 3d __ LSR ACCU + 2 
1b22 : 66 3c __ ROR ACCU + 1 
1b24 : e8 __ __ INX
1b25 : d0 f9 __ BNE $1b20 ; (f32_to_i16 + 32)
1b27 : 24 3e __ BIT ACCU + 3 
1b29 : 10 0e __ BPL $1b39 ; (f32_to_i16 + 57)
1b2b : 38 __ __ SEC
1b2c : a9 00 __ LDA #$00
1b2e : e5 3c __ SBC ACCU + 1 
1b30 : 85 3b __ STA ACCU + 0 
1b32 : a9 00 __ LDA #$00
1b34 : e5 3d __ SBC ACCU + 2 
1b36 : 85 3c __ STA ACCU + 1 
1b38 : 60 __ __ RTS
1b39 : a5 3c __ LDA ACCU + 1 
1b3b : 85 3b __ STA ACCU + 0 
1b3d : a5 3d __ LDA ACCU + 2 
1b3f : 85 3c __ STA ACCU + 1 
1b41 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float:
1b42 : 24 3c __ BIT ACCU + 1 
1b44 : 30 03 __ BMI $1b49 ; (sint16_to_float + 7)
1b46 : 4c 60 1b JMP $1b60 ; (uint16_to_float + 0)
1b49 : 38 __ __ SEC
1b4a : a9 00 __ LDA #$00
1b4c : e5 3b __ SBC ACCU + 0 
1b4e : 85 3b __ STA ACCU + 0 
1b50 : a9 00 __ LDA #$00
1b52 : e5 3c __ SBC ACCU + 1 
1b54 : 85 3c __ STA ACCU + 1 
1b56 : 20 60 1b JSR $1b60 ; (uint16_to_float + 0)
1b59 : a5 3e __ LDA ACCU + 3 
1b5b : 09 80 __ ORA #$80
1b5d : 85 3e __ STA ACCU + 3 
1b5f : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float:
1b60 : a5 3b __ LDA ACCU + 0 
1b62 : 05 3c __ ORA ACCU + 1 
1b64 : d0 05 __ BNE $1b6b ; (uint16_to_float + 11)
1b66 : 85 3d __ STA ACCU + 2 
1b68 : 85 3e __ STA ACCU + 3 
1b6a : 60 __ __ RTS
1b6b : a2 8e __ LDX #$8e
1b6d : a5 3c __ LDA ACCU + 1 
1b6f : 30 06 __ BMI $1b77 ; (uint16_to_float + 23)
1b71 : ca __ __ DEX
1b72 : 06 3b __ ASL ACCU + 0 
1b74 : 2a __ __ ROL
1b75 : 10 fa __ BPL $1b71 ; (uint16_to_float + 17)
1b77 : 29 7f __ AND #$7f
1b79 : 85 3d __ STA ACCU + 2 
1b7b : a5 3b __ LDA ACCU + 0 
1b7d : 85 3c __ STA ACCU + 1 
1b7f : 8a __ __ TXA
1b80 : 4a __ __ LSR
1b81 : 85 3e __ STA ACCU + 3 
1b83 : a9 00 __ LDA #$00
1b85 : 85 3b __ STA ACCU + 0 
1b87 : 6a __ __ ROR
1b88 : 05 3d __ ORA ACCU + 2 
1b8a : 85 3d __ STA ACCU + 2 
1b8c : 60 __ __ RTS
--------------------------------------------------------------------
divmod32:
1b8d : 84 22 __ STY $22 
1b8f : a0 20 __ LDY #$20
1b91 : a9 00 __ LDA #$00
1b93 : 85 27 __ STA WORK + 4 
1b95 : 85 28 __ STA WORK + 5 
1b97 : 85 29 __ STA WORK + 6 
1b99 : 85 2a __ STA WORK + 7 
1b9b : a5 25 __ LDA WORK + 2 
1b9d : 05 26 __ ORA WORK + 3 
1b9f : d0 39 __ BNE $1bda ; (divmod32 + 77)
1ba1 : 18 __ __ CLC
1ba2 : 26 3b __ ROL ACCU + 0 
1ba4 : 26 3c __ ROL ACCU + 1 
1ba6 : 26 3d __ ROL ACCU + 2 
1ba8 : 26 3e __ ROL ACCU + 3 
1baa : 26 27 __ ROL WORK + 4 
1bac : 26 28 __ ROL WORK + 5 
1bae : 90 0c __ BCC $1bbc ; (divmod32 + 47)
1bb0 : a5 27 __ LDA WORK + 4 
1bb2 : e5 23 __ SBC WORK + 0 
1bb4 : aa __ __ TAX
1bb5 : a5 28 __ LDA WORK + 5 
1bb7 : e5 24 __ SBC WORK + 1 
1bb9 : 38 __ __ SEC
1bba : b0 0c __ BCS $1bc8 ; (divmod32 + 59)
1bbc : 38 __ __ SEC
1bbd : a5 27 __ LDA WORK + 4 
1bbf : e5 23 __ SBC WORK + 0 
1bc1 : aa __ __ TAX
1bc2 : a5 28 __ LDA WORK + 5 
1bc4 : e5 24 __ SBC WORK + 1 
1bc6 : 90 04 __ BCC $1bcc ; (divmod32 + 63)
1bc8 : 86 27 __ STX WORK + 4 
1bca : 85 28 __ STA WORK + 5 
1bcc : 88 __ __ DEY
1bcd : d0 d3 __ BNE $1ba2 ; (divmod32 + 21)
1bcf : 26 3b __ ROL ACCU + 0 
1bd1 : 26 3c __ ROL ACCU + 1 
1bd3 : 26 3d __ ROL ACCU + 2 
1bd5 : 26 3e __ ROL ACCU + 3 
1bd7 : a4 22 __ LDY $22 
1bd9 : 60 __ __ RTS
1bda : 18 __ __ CLC
1bdb : 26 3b __ ROL ACCU + 0 
1bdd : 26 3c __ ROL ACCU + 1 
1bdf : 26 3d __ ROL ACCU + 2 
1be1 : 26 3e __ ROL ACCU + 3 
1be3 : 26 27 __ ROL WORK + 4 
1be5 : 26 28 __ ROL WORK + 5 
1be7 : 26 29 __ ROL WORK + 6 
1be9 : 26 2a __ ROL WORK + 7 
1beb : a5 27 __ LDA WORK + 4 
1bed : c5 23 __ CMP WORK + 0 
1bef : a5 28 __ LDA WORK + 5 
1bf1 : e5 24 __ SBC WORK + 1 
1bf3 : a5 29 __ LDA WORK + 6 
1bf5 : e5 25 __ SBC WORK + 2 
1bf7 : a5 2a __ LDA WORK + 7 
1bf9 : e5 26 __ SBC WORK + 3 
1bfb : 90 18 __ BCC $1c15 ; (divmod32 + 136)
1bfd : a5 27 __ LDA WORK + 4 
1bff : e5 23 __ SBC WORK + 0 
1c01 : 85 27 __ STA WORK + 4 
1c03 : a5 28 __ LDA WORK + 5 
1c05 : e5 24 __ SBC WORK + 1 
1c07 : 85 28 __ STA WORK + 5 
1c09 : a5 29 __ LDA WORK + 6 
1c0b : e5 25 __ SBC WORK + 2 
1c0d : 85 29 __ STA WORK + 6 
1c0f : a5 2a __ LDA WORK + 7 
1c11 : e5 26 __ SBC WORK + 3 
1c13 : 85 2a __ STA WORK + 7 
1c15 : 88 __ __ DEY
1c16 : d0 c3 __ BNE $1bdb ; (divmod32 + 78)
1c18 : 26 3b __ ROL ACCU + 0 
1c1a : 26 3c __ ROL ACCU + 1 
1c1c : 26 3d __ ROL ACCU + 2 
1c1e : 26 3e __ ROL ACCU + 3 
1c20 : a4 22 __ LDY $22 
1c22 : 60 __ __ RTS
