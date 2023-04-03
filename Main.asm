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
080e : 8e de 0a STX $0ade ; (spentry + 0)
0811 : a9 f3 __ LDA #$f3
0813 : 85 39 __ STA IP + 0 
0815 : a9 0d __ LDA #$0d
0817 : 85 3a __ STA IP + 1 
0819 : 38 __ __ SEC
081a : a9 0d __ LDA #$0d
081c : e9 0d __ SBC #$0d
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
0830 : a9 fb __ LDA #$fb
0832 : e9 f3 __ SBC #$f3
0834 : f0 08 __ BEQ $083e ; (startup + 61)
0836 : a8 __ __ TAY
0837 : a9 00 __ LDA #$00
0839 : 88 __ __ DEY
083a : 91 39 __ STA (IP + 0),y 
083c : d0 fb __ BNE $0839 ; (startup + 56)
083e : a9 fe __ LDA #$fe
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
0ade : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
main:
.s0:
0880 : 20 d1 08 JSR $08d1 ; (zsm_irq_init.s0 + 0)
0883 : a9 df __ LDA #$df
0885 : 85 2d __ STA P0 
0887 : a9 0a __ LDA #$0a
0889 : 85 2e __ STA P1 
088b : 20 24 0a JSR $0a24 ; (zsm_init.s0 + 0)
088e : 20 3c 0a JSR $0a3c ; (ClearVERAScreen.s0 + 0)
0891 : a9 00 __ LDA #$00
0893 : 85 2f __ STA P2 
0895 : 85 30 __ STA P3 
0897 : 85 31 __ STA P4 
0899 : 85 32 __ STA P5 
089b : ad 25 9f LDA $9f25 
089e : 09 02 __ ORA #$02
08a0 : 8d 25 9f STA $9f25 
08a3 : a9 9a __ LDA #$9a
08a5 : 8d 2a 9f STA $9f2a 
08a8 : ad 25 9f LDA $9f25 
08ab : 29 fd __ AND #$fd
08ad : 8d 25 9f STA $9f25 
08b0 : a9 cb __ LDA #$cb
08b2 : 85 2d __ STA P0 
08b4 : a9 0d __ LDA #$0d
08b6 : 85 2e __ STA P1 
08b8 : 20 75 0a JSR $0a75 ; (TypeTextVERA.s0 + 0)
08bb : a9 00 __ LDA #$00
.l1002:
08bd : 85 2d __ STA P0 
08bf : 20 80 0a JSR $0a80 ; (Control.s0 + 0)
08c2 : a5 3b __ LDA ACCU + 0 
08c4 : 85 47 __ STA T2 + 0 
08c6 : 20 cb 0a JSR $0acb ; (zsm_irq_play.s0 + 0)
08c9 : 20 cf 0a JSR $0acf ; (frame_wait.l1 + 0)
08cc : a5 47 __ LDA T2 + 0 
08ce : 4c bd 08 JMP $08bd ; (main.l1002 + 0)
--------------------------------------------------------------------
zsm_irq_init:
.s0:
08d1 : 78 __ __ SEI
08d2 : ad 14 03 LDA $0314 
08d5 : 8d f3 0d STA $0df3 ; (oirq + 0)
08d8 : ad 15 03 LDA $0315 
08db : 8d f4 0d STA $0df4 ; (oirq + 1)
08de : a9 ea __ LDA #$ea
08e0 : 8d 14 03 STA $0314 
08e3 : a9 08 __ LDA #$08
08e5 : 8d 15 03 STA $0315 
08e8 : 58 __ __ CLI
.s1001:
08e9 : 60 __ __ RTS
--------------------------------------------------------------------
oirq:
0df3 : __ __ __ BSS	2
--------------------------------------------------------------------
irqt:
08ea : 20 f0 08 JSR $08f0 ; (irq.s1000 + 0)
08ed : 6c f3 0d JMP ($0df3)
--------------------------------------------------------------------
irq:
.s1000:
08f0 : a5 2d __ LDA P0 
08f2 : 48 __ __ PHA
08f3 : a5 2e __ LDA P1 
08f5 : 48 __ __ PHA
08f6 : a5 3b __ LDA ACCU + 0 
08f8 : 48 __ __ PHA
08f9 : a5 3c __ LDA ACCU + 1 
08fb : 48 __ __ PHA
08fc : a5 47 __ LDA T0 + 0 
08fe : 48 __ __ PHA
08ff : a5 48 __ LDA T1 + 0 
0901 : 48 __ __ PHA
0902 : a5 49 __ LDA T1 + 1 
0904 : 48 __ __ PHA
0905 : a5 4a __ LDA $4a 
0907 : 48 __ __ PHA
.s0:
0908 : ee 2c 9f INC $9f2c 
090b : ad f5 0d LDA $0df5 ; (zsm_playing + 0)
090e : f0 12 __ BEQ $0922 ; (irq.s3 + 0)
.s1:
0910 : 20 3e 09 JSR $093e ; (zsm_play.s0 + 0)
0913 : a5 3b __ LDA ACCU + 0 
0915 : d0 0b __ BNE $0922 ; (irq.s3 + 0)
.s4:
0917 : a9 df __ LDA #$df
0919 : 85 2d __ STA P0 
091b : a9 0a __ LDA #$0a
091d : 85 2e __ STA P1 
091f : 20 24 0a JSR $0a24 ; (zsm_init.s0 + 0)
.s3:
0922 : ce 2c 9f DEC $9f2c 
.s1001:
0925 : 68 __ __ PLA
0926 : 85 4a __ STA $4a 
0928 : 68 __ __ PLA
0929 : 85 49 __ STA T1 + 1 
092b : 68 __ __ PLA
092c : 85 48 __ STA T1 + 0 
092e : 68 __ __ PLA
092f : 85 47 __ STA T0 + 0 
0931 : 68 __ __ PLA
0932 : 85 3c __ STA ACCU + 1 
0934 : 68 __ __ PLA
0935 : 85 3b __ STA ACCU + 0 
0937 : 68 __ __ PLA
0938 : 85 2e __ STA P1 
093a : 68 __ __ PLA
093b : 85 2d __ STA P0 
093d : 60 __ __ RTS
--------------------------------------------------------------------
zsm_playing:
0df5 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_play:
.s0:
093e : ad f6 0d LDA $0df6 ; (zsm_delay + 0)
0941 : f0 03 __ BEQ $0946 ; (zsm_play.l6 + 0)
0943 : 4c 02 0a JMP $0a02 ; (zsm_play.s1012 + 0)
.l6:
0946 : ad f9 0d LDA $0df9 ; (zsm_pos + 0)
0949 : 85 48 __ STA T1 + 0 
094b : 18 __ __ CLC
094c : 69 01 __ ADC #$01
094e : 8d f9 0d STA $0df9 ; (zsm_pos + 0)
0951 : ad fa 0d LDA $0dfa ; (zsm_pos + 1)
0954 : 85 49 __ STA T1 + 1 
0956 : 69 00 __ ADC #$00
0958 : 8d fa 0d STA $0dfa ; (zsm_pos + 1)
095b : ad f7 0d LDA $0df7 ; (zsm_sound + 0)
095e : 18 __ __ CLC
095f : 65 48 __ ADC T1 + 0 
0961 : 85 3b __ STA ACCU + 0 
0963 : ad f8 0d LDA $0df8 ; (zsm_sound + 1)
0966 : 65 49 __ ADC T1 + 1 
0968 : 85 3c __ STA ACCU + 1 
096a : a0 00 __ LDY #$00
096c : b1 3b __ LDA (ACCU + 0),y 
096e : c9 40 __ CMP #$40
0970 : b0 30 __ BCS $09a2 ; (zsm_play.s10 + 0)
.s9:
0972 : 29 3f __ AND #$3f
0974 : 09 c0 __ ORA #$c0
0976 : 8d 20 9f STA $9f20 
0979 : ad 25 9f LDA $9f25 
097c : 29 fe __ AND #$fe
097e : 8d 25 9f STA $9f25 
0981 : a9 f9 __ LDA #$f9
0983 : 8d 21 9f STA $9f21 
0986 : a9 01 __ LDA #$01
0988 : 8d 22 9f STA $9f22 
098b : a5 48 __ LDA T1 + 0 
098d : 69 02 __ ADC #$02
098f : 8d f9 0d STA $0df9 ; (zsm_pos + 0)
0992 : a5 49 __ LDA T1 + 1 
0994 : 69 00 __ ADC #$00
0996 : 8d fa 0d STA $0dfa ; (zsm_pos + 1)
0999 : c8 __ __ INY
099a : b1 3b __ LDA (ACCU + 0),y 
099c : 8d 23 9f STA $9f23 
099f : 4c 46 09 JMP $0946 ; (zsm_play.l6 + 0)
.s10:
09a2 : d0 14 __ BNE $09b8 ; (zsm_play.s13 + 0)
.s12:
09a4 : c8 __ __ INY
09a5 : b1 3b __ LDA (ACCU + 0),y 
09a7 : 29 3f __ AND #$3f
09a9 : 18 __ __ CLC
09aa : 6d f9 0d ADC $0df9 ; (zsm_pos + 0)
09ad : 8d f9 0d STA $0df9 ; (zsm_pos + 0)
09b0 : 90 94 __ BCC $0946 ; (zsm_play.l6 + 0)
.s1015:
09b2 : ee fa 0d INC $0dfa ; (zsm_pos + 1)
09b5 : 4c 46 09 JMP $0946 ; (zsm_play.l6 + 0)
.s13:
09b8 : 09 00 __ ORA #$00
09ba : 30 40 __ BMI $09fc ; (zsm_play.s16 + 0)
.s15:
09bc : 29 3f __ AND #$3f
09be : f0 86 __ BEQ $0946 ; (zsm_play.l6 + 0)
.s27:
09c0 : 84 4a __ STY T5 + 0 
09c2 : 85 47 __ STA T0 + 0 
09c4 : 18 __ __ CLC
.l1013:
09c5 : ad f7 0d LDA $0df7 ; (zsm_sound + 0)
09c8 : 6d f9 0d ADC $0df9 ; (zsm_pos + 0)
09cb : 85 48 __ STA T1 + 0 
09cd : ad f8 0d LDA $0df8 ; (zsm_sound + 1)
09d0 : 6d fa 0d ADC $0dfa ; (zsm_pos + 1)
09d3 : 85 49 __ STA T1 + 1 
09d5 : a0 00 __ LDY #$00
09d7 : b1 48 __ LDA (T1 + 0),y 
09d9 : 85 2d __ STA P0 
09db : c8 __ __ INY
09dc : b1 48 __ LDA (T1 + 0),y 
09de : 85 2e __ STA P1 
09e0 : 20 10 0a JSR $0a10 ; (sfx_put.l1 + 0)
09e3 : ad f9 0d LDA $0df9 ; (zsm_pos + 0)
09e6 : 18 __ __ CLC
09e7 : 69 02 __ ADC #$02
09e9 : 8d f9 0d STA $0df9 ; (zsm_pos + 0)
09ec : 90 03 __ BCC $09f1 ; (zsm_play.s1018 + 0)
.s1017:
09ee : ee fa 0d INC $0dfa ; (zsm_pos + 1)
.s1018:
09f1 : e6 4a __ INC T5 + 0 
09f3 : a5 4a __ LDA T5 + 0 
09f5 : c5 47 __ CMP T0 + 0 
09f7 : 90 cc __ BCC $09c5 ; (zsm_play.l1013 + 0)
09f9 : 4c 46 09 JMP $0946 ; (zsm_play.l6 + 0)
.s16:
09fc : c9 80 __ CMP #$80
09fe : f0 0d __ BEQ $0a0d ; (zsm_play.s22 + 0)
.s23:
0a00 : 29 7f __ AND #$7f
.s1012:
0a02 : 38 __ __ SEC
0a03 : e9 01 __ SBC #$01
0a05 : 8d f6 0d STA $0df6 ; (zsm_delay + 0)
0a08 : a9 01 __ LDA #$01
.s1001:
0a0a : 85 3b __ STA ACCU + 0 
0a0c : 60 __ __ RTS
.s22:
0a0d : 98 __ __ TYA
0a0e : f0 fa __ BEQ $0a0a ; (zsm_play.s1001 + 0)
--------------------------------------------------------------------
zsm_delay:
0df6 : __ __ __ BSS	1
--------------------------------------------------------------------
zsm_sound:
0df7 : __ __ __ BSS	2
--------------------------------------------------------------------
zsm_pos:
0df9 : __ __ __ BSS	2
--------------------------------------------------------------------
sfx_put:
.l1:
0a10 : ad 41 9f LDA $9f41 
0a13 : 30 fb __ BMI $0a10 ; (sfx_put.l1 + 0)
.s3:
0a15 : a5 2d __ LDA P0 ; (index + 0)
0a17 : 8d 40 9f STA $9f40 
0a1a : ea __ __ NOP
0a1b : ea __ __ NOP
0a1c : ea __ __ NOP
0a1d : ea __ __ NOP
0a1e : a5 2e __ LDA P1 ; (data + 0)
0a20 : 8d 41 9f STA $9f41 
.s1001:
0a23 : 60 __ __ RTS
--------------------------------------------------------------------
zsm_init:
.s0:
0a24 : a5 2d __ LDA P0 ; (sound + 0)
0a26 : 8d f7 0d STA $0df7 ; (zsm_sound + 0)
0a29 : a5 2e __ LDA P1 ; (sound + 1)
0a2b : 8d f8 0d STA $0df8 ; (zsm_sound + 1)
0a2e : a9 10 __ LDA #$10
0a30 : 8d f9 0d STA $0df9 ; (zsm_pos + 0)
0a33 : a9 00 __ LDA #$00
0a35 : 8d fa 0d STA $0dfa ; (zsm_pos + 1)
0a38 : 8d f6 0d STA $0df6 ; (zsm_delay + 0)
.s1001:
0a3b : 60 __ __ RTS
--------------------------------------------------------------------
sound:
0adf : __ __ __ BYT 7a 6d 01 17 00 00 00 00 00 3f 00 00 3c 00 00 00 : zm.......?..<...
0aef : __ __ __ BYT 43 18 00 19 7f 19 ff 7f 08 00 20 e5 28 4e 30 00 : C......... .(N0.
0aff : __ __ __ BYT 38 00 40 25 48 21 50 71 58 71 60 2a 68 30 70 12 : 8.@%H!PqXq`*h0p.
0b0f : __ __ __ BYT 78 02 80 1f 88 1f 90 1f 98 1f a0 08 a8 04 b0 0a : x...............
0b1f : __ __ __ BYT b8 09 c0 00 c8 00 d0 00 d8 00 e0 f3 e8 b1 f0 f4 : ................
0b2f : __ __ __ BYT f8 f9 08 78 08 01 21 e5 29 52 31 00 39 00 41 25 : ...x..!.)R1.9.A%
0b3f : __ __ __ BYT 49 21 51 71 59 71 61 2a 69 30 71 12 79 02 81 1f : I!QqYqa*i0q.y...
0b4f : __ __ __ BYT 89 1f 91 1f 99 1f a1 08 a9 04 b1 0a b9 09 c1 00 : ................
0b5f : __ __ __ BYT c9 00 d1 00 d9 00 e1 f3 e9 b1 f1 f4 f9 f9 08 79 : ...............y
0b6f : __ __ __ BYT 08 02 22 e5 2a 58 5b 32 00 3a 00 42 25 4a 21 52 : ..".*X[2.:.B%J!R
0b7f : __ __ __ BYT 71 5a 71 62 2a 6a 30 72 12 7a 02 82 1f 8a 1f 92 : qZqb*j0r.z......
0b8f : __ __ __ BYT 1f 9a 1f a2 08 aa 04 b2 0a ba 09 c2 00 ca 00 d2 : ................
0b9f : __ __ __ BYT 00 da 00 e2 f3 ea b1 f2 f4 fa f9 08 7a 84 43 08 : ............z.C.
0baf : __ __ __ BYT 00 08 01 08 02 84 46 08 00 08 01 08 02 08 78 08 : ......F.......x.
0bbf : __ __ __ BYT 79 08 7a 84 7f 08 00 08 01 08 02 08 03 23 e5 2b : y.z..........#.+
0bcf : __ __ __ BYT 4e 33 30 3b 00 43 25 4b 21 53 71 5b 71 63 2a 6b : N30;.C%K!Sq[qc*k
0bdf : __ __ __ BYT 3f 73 21 7b 11 83 1f 8b 1f 93 1f 9b 1f a3 08 ab : ?s!{............
0bef : __ __ __ BYT 04 b3 0a bb 09 c3 00 cb 00 d3 00 db 00 e3 f3 eb : ................
0bff : __ __ __ BYT b1 f3 f4 fb f9 08 7b 08 04 24 e5 2c 52 34 30 3c : ......{..$.,R40<
0c0f : __ __ __ BYT 00 44 25 4c 21 54 71 5c 71 64 2a 6c 3f 74 21 7c : .D%L!Tq\qd*l?t!|
0c1f : __ __ __ BYT 11 84 1f 8c 1f 94 1f 9c 1f a4 08 ac 04 b4 0a bc : ................
0c2f : __ __ __ BYT 09 c4 00 cc 00 d4 00 dc 00 e4 f3 ec b1 f4 f4 fc : ................
0c3f : __ __ __ BYT f9 08 7c 5e 08 05 25 e5 2d 58 35 30 3d 00 45 25 : ..|^..%.-X50=.E%
0c4f : __ __ __ BYT 4d 21 55 71 5d 71 65 2a 6d 3f 75 21 7d 11 85 1f : M!Uq]qe*m?u!}...
0c5f : __ __ __ BYT 8d 1f 95 1f 9d 1f a5 08 ad 04 b5 0a bd 09 c5 00 : ................
0c6f : __ __ __ BYT cd 00 d5 00 dd 00 e5 f3 ed b1 f5 f4 fd f9 08 7d : ...............}
0c7f : __ __ __ BYT 84 49 08 00 08 01 08 02 08 03 08 04 08 05 08 78 : .I.............x
0c8f : __ __ __ BYT 08 79 08 7a 84 46 08 03 08 04 08 05 08 7b 08 7c : .y.z.F.......{.|
0c9f : __ __ __ BYT 08 7d 84 46 08 00 08 01 08 02 08 03 08 04 08 05 : .}.F............
0caf : __ __ __ BYT 84 46 08 03 08 04 08 05 08 7b 08 7c 08 7d 84 47 : .F.......{.|.}.G
0cbf : __ __ __ BYT 08 00 08 01 08 02 08 78 08 79 2a 56 08 7a 84 43 : .......x.y*V.z.C
0ccf : __ __ __ BYT 08 03 08 04 08 05 84 43 08 00 08 01 08 02 84 47 : .......C.......G
0cdf : __ __ __ BYT 08 03 08 04 08 05 08 7b 08 7c 2d 56 08 7d 84 47 : .......{.|-V.}.G
0cef : __ __ __ BYT 08 00 08 01 08 02 08 78 08 79 2a 58 08 7a 84 43 : .......x.y*X.z.C
0cff : __ __ __ BYT 08 03 08 04 08 05 84 43 08 00 08 01 08 02 84 47 : .......C.......G
0d0f : __ __ __ BYT 08 03 08 04 08 05 08 7b 08 7c 2d 58 08 7d 88 43 : .......{.|-X.}.C
0d1f : __ __ __ BYT 08 03 08 04 08 05 8c 47 08 00 08 01 08 02 08 78 : .......G.......x
0d2f : __ __ __ BYT 08 79 2a 59 08 7a 8c 47 08 03 08 04 08 05 08 7b : .y*Y.z.G.......{
0d3f : __ __ __ BYT 08 7c 2d 59 08 7d 8c 46 08 00 08 01 08 02 08 78 : .|-Y.}.F.......x
0d4f : __ __ __ BYT 08 79 08 7a 84 43 08 00 08 01 08 02 84 46 08 00 : .y.z.C.......F..
0d5f : __ __ __ BYT 08 01 08 02 08 78 08 79 08 7a 84 46 08 03 08 04 : .....x.y.z.F....
0d6f : __ __ __ BYT 08 05 08 7b 08 7c 08 7d 84 46 08 00 08 01 08 02 : ...{.|.}.F......
0d7f : __ __ __ BYT 08 03 08 04 08 05 84 46 08 03 08 04 08 05 08 7b : .......F.......{
0d8f : __ __ __ BYT 08 7c 08 7d 84 47 08 00 08 01 08 02 08 78 08 79 : .|.}.G.......x.y
0d9f : __ __ __ BYT 2a 58 08 7a 84 43 08 03 08 04 08 05 88 47 08 03 : *X.z.C.......G..
0daf : __ __ __ BYT 08 04 08 05 08 7b 08 7c 2d 58 08 7d f4 46 08 00 : .....{.|-X.}.F..
0dbf : __ __ __ BYT 08 01 08 02 08 78 08 79 08 7a 81 80             : .....x.y.z..
--------------------------------------------------------------------
ClearVERAScreen:
.s0:
0a3c : a9 93 __ LDA #$93
0a3e : 85 2d __ STA P0 
0a40 : a9 00 __ LDA #$00
0a42 : 85 2e __ STA P1 
0a44 : 20 6f 0a JSR $0a6f ; (putch.s0 + 0)
0a47 : a9 11 __ LDA #$11
0a49 : 8d 22 9f STA $9f22 
0a4c : a2 00 __ LDX #$00
.l2:
0a4e : 8a __ __ TXA
0a4f : 18 __ __ CLC
0a50 : 69 b0 __ ADC #$b0
0a52 : 8d 21 9f STA $9f21 
0a55 : a9 00 __ LDA #$00
0a57 : 8d 20 9f STA $9f20 
0a5a : a0 50 __ LDY #$50
.l1003:
0a5c : a9 20 __ LDA #$20
0a5e : 8d 23 9f STA $9f23 
0a61 : a9 01 __ LDA #$01
0a63 : 8d 23 9f STA $9f23 
0a66 : 88 __ __ DEY
0a67 : d0 f3 __ BNE $0a5c ; (ClearVERAScreen.l1003 + 0)
.s1004:
0a69 : e8 __ __ INX
0a6a : e0 3c __ CPX #$3c
0a6c : 90 e0 __ BCC $0a4e ; (ClearVERAScreen.l2 + 0)
.s1001:
0a6e : 60 __ __ RTS
--------------------------------------------------------------------
putch:
.s0:
0a6f : a5 2d __ LDA P0 
0a71 : 20 d2 ff JSR $ffd2 
.s1001:
0a74 : 60 __ __ RTS
--------------------------------------------------------------------
TypeTextVERA:
.s0:
0a75 : a9 00 __ LDA #$00
0a77 : 8d 20 9f STA $9f20 
0a7a : a9 b0 __ LDA #$b0
0a7c : 8d 21 9f STA $9f21 
.s1001:
0a7f : 60 __ __ RTS
--------------------------------------------------------------------
TestText:
0dcb : __ __ __ BYT 43 0f 0e 03 05 10 14 3a 20 43 12 09 13 10 13 2c : C......: C.....,
0ddb : __ __ __ BYT 20 43 0f 04 09 0e 07 3a 20 43 12 09 13 10 13 2b :  C.....: C.....+
0deb : __ __ __ BYT 42 0c 15 0d 02 01 00                            : B......
--------------------------------------------------------------------
Control:
.s0:
0a80 : 20 9a 0a JSR $0a9a ; (getchx.s0 + 0)
0a83 : a5 3c __ LDA ACCU + 1 
0a85 : d0 06 __ BNE $0a8d ; (Control.s3 + 0)
.s1005:
0a87 : a5 3b __ LDA ACCU + 0 
0a89 : c9 20 __ CMP #$20
0a8b : f0 05 __ BEQ $0a92 ; (Control.s1 + 0)
.s3:
0a8d : a5 2d __ LDA P0 ; (playing + 0)
0a8f : 4c 97 0a JMP $0a97 ; (Control.s1001 + 0)
.s1:
0a92 : a9 00 __ LDA #$00
0a94 : c5 2d __ CMP P0 ; (playing + 0)
0a96 : 2a __ __ ROL
.s1001:
0a97 : 85 3b __ STA ACCU + 0 
0a99 : 60 __ __ RTS
--------------------------------------------------------------------
getchx:
.s0:
0a9a : 20 a4 0a JSR $0aa4 ; (getpch + 0)
0a9d : 85 3b __ STA ACCU + 0 
0a9f : a9 00 __ LDA #$00
0aa1 : 85 3c __ STA ACCU + 1 
.s1001:
0aa3 : 60 __ __ RTS
--------------------------------------------------------------------
getpch:
0aa4 : 20 e4 ff JSR $ffe4 
0aa7 : ae f2 0d LDX $0df2 ; (giocharmap + 0)
0aaa : e0 01 __ CPX #$01
0aac : 90 1c __ BCC $0aca ; (getpch + 38)
0aae : c9 0d __ CMP #$0d
0ab0 : d0 02 __ BNE $0ab4 ; (getpch + 16)
0ab2 : a9 0a __ LDA #$0a
0ab4 : e0 02 __ CPX #$02
0ab6 : 90 12 __ BCC $0aca ; (getpch + 38)
0ab8 : c9 41 __ CMP #$41
0aba : 90 0e __ BCC $0aca ; (getpch + 38)
0abc : c9 7b __ CMP #$7b
0abe : b0 0a __ BCS $0aca ; (getpch + 38)
0ac0 : c9 61 __ CMP #$61
0ac2 : b0 04 __ BCS $0ac8 ; (getpch + 36)
0ac4 : c9 5b __ CMP #$5b
0ac6 : b0 02 __ BCS $0aca ; (getpch + 38)
0ac8 : 49 20 __ EOR #$20
0aca : 60 __ __ RTS
--------------------------------------------------------------------
giocharmap:
0df2 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
zsm_irq_play:
.s0:
0acb : 8d f5 0d STA $0df5 ; (zsm_playing + 0)
.s1001:
0ace : 60 __ __ RTS
--------------------------------------------------------------------
frame_wait:
.l1:
0acf : ad 26 9f LDA $9f26 
0ad2 : 29 40 __ AND #$40
0ad4 : d0 f9 __ BNE $0acf ; (frame_wait.l1 + 0)
.l4:
0ad6 : ad 26 9f LDA $9f26 
0ad9 : 29 40 __ AND #$40
0adb : f0 f9 __ BEQ $0ad6 ; (frame_wait.l4 + 0)
.s1001:
0add : 60 __ __ RTS
