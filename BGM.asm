song_index_Teuthida = 0
song_index_Title = 1
song_index_Slow_Theme_A = 2
song_index_Fast_Theme_A = 3
song_index_Slow_Theme_B = 4
song_index_Fast_Theme_B = 5
song_index_Slow_Theme_C = 6
song_index_Fast_Theme_C = 7
song_index_Mission_Failed = 8
song_index_Mission_Complete_1 = 9
song_index_Mission_Complete_2 = 10

sfx_index_sfx_Spin = 0
sfx_index_sfx_Drop = 1
sfx_index_sfx_Lock_or_Move = 2
sfx_index_sfx_Clearx1 = 3
sfx_index_sfx_Clearx2 = 4
sfx_index_sfx_Clearx3 = 5
sfx_index_sfx_NotTetris = 6
sfx_index_sfx_Ghost = 7
sfx_index_sfx_Store = 8
sfx_index_sfx_Boom = 9
sfx_index_sfx_GoodClear_or_Defuse = 10
sfx_index_sfx_Appear = 11

song_list:
  .dw Teuthida
  .dw Title
  .dw Slow_Theme_A
  .dw Fast_Theme_A
  .dw Slow_Theme_B
  .dw Fast_Theme_B
  .dw Slow_Theme_C
  .dw Fast_Theme_C
  .dw Mission_Failed
  .dw Mission_Complete_1
  .dw Mission_Complete_2

sfx_list:
  .dw sfx_Spin
  .dw sfx_Drop
  .dw sfx_Lock_or_Move
  .dw sfx_Clearx1
  .dw sfx_Clearx2
  .dw sfx_Clearx3
  .dw sfx_NotTetris
  .dw sfx_Ghost
  .dw sfx_Store
  .dw sfx_Boom
  .dw sfx_GoodClear_or_Defuse
  .dw sfx_Appear

envelopes_list:
  .dw volume
  .dw arpeggio
  .dw pitch
  .dw duty

dpcm_list:
  .dw dpcm_samples_list
  .dw dpcm_note_to_sample_index
  .dw dpcm_note_to_sample_length
  .dw dpcm_note_to_loop_pitch_index

volume:
  .dw volume0
  .dw volume1
  .dw volume2
  .dw volume3
  .dw volume4
  .dw volume5
  .dw volume6
  .dw volume7
  .dw volume8
  .dw volume9
  .dw volume10
  .dw volume11

arpeggio:
  .dw arpeggio0
  .dw arpeggio1
  .dw arpeggio2
  .dw arpeggio3

pitch:
  .dw pitch0
  .dw pitch1
  .dw pitch2
  .dw pitch3
  .dw pitch4
  .dw pitch5
  .dw pitch6
  .dw pitch7
  .dw pitch8
  .dw pitch9
  .dw pitch10

duty:
  .dw duty0
  .dw duty1
  .dw duty2
  .dw duty3
  .dw duty4
  .dw duty5
  .dw duty6
  .dw duty7

volume0:
  .db 9,3,2,1,1,0,ENV_STOP
volume1:
  .db 8,3,1,0,ENV_STOP
volume2:
  .db 15,14,11,10,9,9,10,11,10,9,7,7,8,8,7,6,5,4,6,6,5,3,2,2,3,2,1,ENV_STOP
volume3:
  .db 11,9,8,8,7,6,5,5,4,4,3,3,3,3,2,1,1,1,1,1,1,1,1,0,ENV_STOP
volume4:
  .db 10,9,9,9,9,8,8,8,8,8,8,7,7,7,7,7,7,7,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,4,4,4,4,4,4,4,4,4,3,3,3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,ENV_STOP
volume5:
  .db 10,11,11,12,13,15,15,15,15,14,14,14,14,14,14,14,15,ENV_LOOP,6
volume6:
  .db 15,ENV_STOP
volume7:
  .db 15,15,13,12,12,11,11,10,9,8,7,6,6,6,5,5,5,5,4,ENV_STOP
volume8:
  .db 15,15,15,0,ENV_STOP
volume9:
  .db 15,14,14,13,12,12,11,10,10,10,9,9,9,8,8,8,8,8,7,ENV_STOP
volume10:
  .db 6,6,5,5,4,4,4,3,3,3,3,3,3,2,2,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,ENV_STOP
volume11:
  .db 0,ENV_STOP

arpeggio0:
  .db 1,0,-2,ENV_STOP
arpeggio1:
  .db 0,1,2,ENV_STOP
arpeggio2:
  .db 0,0,5,5,ENV_LOOP,0
arpeggio3:
  .db 0,ENV_STOP

pitch0:
  .db 0,0,-1,0,0,1,ENV_LOOP,0
pitch1:
  .db -1,0,-1,0,0,1,0,ENV_LOOP,1
pitch2:
  .db -1,ENV_STOP
pitch3:
  .db 8,ENV_LOOP,0
pitch4:
  .db -7,ENV_LOOP,0
pitch5:
  .db -3,ENV_LOOP,0
pitch6:
  .db -20,ENV_LOOP,0
pitch7:
  .db 40,ENV_LOOP,0
pitch8:
  .db 2,ENV_LOOP,0
pitch9:
  .db 0,104,ENV_LOOP,1
pitch10:
  .db 0,ENV_STOP

duty0:
  .db 64,64,DUTY_ENV_STOP
duty1:
  .db 0,DUTY_ENV_STOP
duty2:
  .db 128,DUTY_ENV_STOP
duty3:
  .db 0,64,128,192,DUTY_ENV_LOOP,0
duty4:
  .db 192,192,DUTY_ENV_STOP
duty5:
  .db 128,DUTY_ENV_STOP
duty6:
  .db 0,64,DUTY_ENV_LOOP,0
duty7:
  .db 0,DUTY_ENV_STOP

dpcm_samples_list:
  .db <(dpcm_sample_KiSnare >> 6)
  .db <(dpcm_sample_bassdrum2 >> 6)
  .db <(dpcm_sample_distortedsnare11 >> 6)

dpcm_note_to_sample_index:
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$01,$00,$02,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

dpcm_note_to_sample_length:
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$12,$22,$22,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

dpcm_note_to_loop_pitch_index:
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$0f,$0f,$0f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  .db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

Teuthida:
  .db 0
  .db 3
  .db 128
  .db 2
  .dw Teuthida_square1
  .dw Teuthida_square2
  .dw Teuthida_triangle
  .dw Teuthida_noise
  .dw Teuthida_dpcm

Teuthida_square1:
Teuthida_square1_loop:
  .db CAL,<(Teuthida_square1_0),>(Teuthida_square1_0)
  .db CAL,<(Teuthida_square1_1),>(Teuthida_square1_1)
  .db GOT
  .dw Teuthida_square1_loop

Teuthida_square2:
Teuthida_square2_loop:
  .db CAL,<(Teuthida_square2_0),>(Teuthida_square2_0)
  .db CAL,<(Teuthida_square2_1),>(Teuthida_square2_1)
  .db GOT
  .dw Teuthida_square2_loop

Teuthida_triangle:
Teuthida_triangle_loop:
  .db CAL,<(Teuthida_triangle_0),>(Teuthida_triangle_0)
  .db CAL,<(Teuthida_triangle_1),>(Teuthida_triangle_1)
  .db GOT
  .dw Teuthida_triangle_loop

Teuthida_noise:
Teuthida_noise_loop:
  .db CAL,<(Teuthida_noise_0),>(Teuthida_noise_0)
  .db CAL,<(Teuthida_noise_1),>(Teuthida_noise_1)
  .db GOT
  .dw Teuthida_noise_loop

Teuthida_dpcm:
Teuthida_dpcm_loop:
  .db CAL,<(Teuthida_dpcm_0),>(Teuthida_dpcm_0)
  .db CAL,<(Teuthida_dpcm_1),>(Teuthida_dpcm_1)
  .db GOT
  .dw Teuthida_dpcm_loop

Teuthida_square1_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SL0,A0,STV,7,SDU,3,SL2,E3,GS3
  .db B3,GS3,D3,FS3,A3,FS3,CS3,E3,A3,E3,SL8,CS3
  .db RET

Teuthida_square1_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,48,A0
  .db RET

Teuthida_square2_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SL0,A0,STV,7,STP,2,SDU,3,SL2,E4
  .db GS4,B4,GS4,D4,FS4,A4,FS4,CS4,E4,A4,E4,SL8,CS4
  .db RET

Teuthida_square2_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,48,A0
  .db RET

Teuthida_triangle_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SL0,A0,STV,6,SL8,E3,D3,A2,E2
  .db RET

Teuthida_triangle_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,48,A0
  .db RET

Teuthida_noise_0:
  .db STV,0,SAR,0,STP,10,SDU,7,SL2,14,14,STV,3,SAR,1,9,9,STV,0
  .db SAR,0,14,14,STV,3,SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1
  .db SAR,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1
  .db SAR,3,3,STV,3,SAR,1,9,9,STV,4,SAR,3,SL8,3,3
  .db RET

Teuthida_noise_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,48,A0
  .db RET

Teuthida_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,C3,C3,CS3,D3,C3,C3,SL4,CS3
  .db C3,CS3,C3,SL2,CS3,D3,SL8,C3,C3
  .db RET

Teuthida_dpcm_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,48,A0
  .db RET

Title:
  .db 0
  .db 4
  .db 85
  .db 3
  .dw Title_square1
  .dw Title_square2
  .dw Title_triangle
  .dw Title_noise
  .dw Title_dpcm

Title_square1:
Title_square1_loop:
  .db CAL,<(Title_square1_0),>(Title_square1_0)
  .db CAL,<(Title_square1_0),>(Title_square1_0)
  .db CAL,<(Title_square1_0),>(Title_square1_0)
  .db CAL,<(Title_square1_3),>(Title_square1_3)
  .db CAL,<(Title_square1_4),>(Title_square1_4)
  .db CAL,<(Title_square1_4),>(Title_square1_4)
  .db CAL,<(Title_square1_0),>(Title_square1_0)
  .db CAL,<(Title_square1_0),>(Title_square1_0)
  .db CAL,<(Title_square1_0),>(Title_square1_0)
  .db CAL,<(Title_square1_7),>(Title_square1_7)
  .db CAL,<(Title_square1_0),>(Title_square1_0)
  .db CAL,<(Title_square1_7),>(Title_square1_7)
  .db CAL,<(Title_square1_10),>(Title_square1_10)
  .db CAL,<(Title_square1_11),>(Title_square1_11)
  .db CAL,<(Title_square1_12),>(Title_square1_12)
  .db CAL,<(Title_square1_13),>(Title_square1_13)
  .db CAL,<(Title_square1_14),>(Title_square1_14)
  .db CAL,<(Title_square1_15),>(Title_square1_15)
  .db CAL,<(Title_square1_16),>(Title_square1_16)
  .db CAL,<(Title_square1_17),>(Title_square1_17)
  .db CAL,<(Title_square1_18),>(Title_square1_18)
  .db GOT
  .dw Title_square1_loop

Title_square2:
Title_square2_loop:
  .db CAL,<(Title_square2_0),>(Title_square2_0)
  .db CAL,<(Title_square2_0),>(Title_square2_0)
  .db CAL,<(Title_square2_2),>(Title_square2_2)
  .db CAL,<(Title_square2_3),>(Title_square2_3)
  .db CAL,<(Title_square2_4),>(Title_square2_4)
  .db CAL,<(Title_square2_4),>(Title_square2_4)
  .db CAL,<(Title_square2_0),>(Title_square2_0)
  .db CAL,<(Title_square2_0),>(Title_square2_0)
  .db CAL,<(Title_square2_2),>(Title_square2_2)
  .db CAL,<(Title_square2_7),>(Title_square2_7)
  .db CAL,<(Title_square2_2),>(Title_square2_2)
  .db CAL,<(Title_square2_7),>(Title_square2_7)
  .db CAL,<(Title_square2_10),>(Title_square2_10)
  .db CAL,<(Title_square2_11),>(Title_square2_11)
  .db CAL,<(Title_square2_12),>(Title_square2_12)
  .db CAL,<(Title_square2_13),>(Title_square2_13)
  .db CAL,<(Title_square2_14),>(Title_square2_14)
  .db CAL,<(Title_square2_15),>(Title_square2_15)
  .db CAL,<(Title_square2_16),>(Title_square2_16)
  .db CAL,<(Title_square2_17),>(Title_square2_17)
  .db CAL,<(Title_square2_18),>(Title_square2_18)
  .db GOT
  .dw Title_square2_loop

Title_triangle:
Title_triangle_loop:
  .db CAL,<(Title_triangle_0),>(Title_triangle_0)
  .db CAL,<(Title_triangle_1),>(Title_triangle_1)
  .db CAL,<(Title_triangle_2),>(Title_triangle_2)
  .db CAL,<(Title_triangle_3),>(Title_triangle_3)
  .db CAL,<(Title_triangle_4),>(Title_triangle_4)
  .db CAL,<(Title_triangle_5),>(Title_triangle_5)
  .db CAL,<(Title_triangle_0),>(Title_triangle_0)
  .db CAL,<(Title_triangle_1),>(Title_triangle_1)
  .db CAL,<(Title_triangle_6),>(Title_triangle_6)
  .db CAL,<(Title_triangle_7),>(Title_triangle_7)
  .db CAL,<(Title_triangle_6),>(Title_triangle_6)
  .db CAL,<(Title_triangle_9),>(Title_triangle_9)
  .db CAL,<(Title_triangle_10),>(Title_triangle_10)
  .db CAL,<(Title_triangle_11),>(Title_triangle_11)
  .db CAL,<(Title_triangle_12),>(Title_triangle_12)
  .db CAL,<(Title_triangle_13),>(Title_triangle_13)
  .db CAL,<(Title_triangle_14),>(Title_triangle_14)
  .db CAL,<(Title_triangle_15),>(Title_triangle_15)
  .db CAL,<(Title_triangle_16),>(Title_triangle_16)
  .db CAL,<(Title_triangle_17),>(Title_triangle_17)
  .db CAL,<(Title_triangle_18),>(Title_triangle_18)
  .db GOT
  .dw Title_triangle_loop

Title_noise:
Title_noise_loop:
  .db CAL,<(Title_noise_0),>(Title_noise_0)
  .db CAL,<(Title_noise_1),>(Title_noise_1)
  .db CAL,<(Title_noise_2),>(Title_noise_2)
  .db CAL,<(Title_noise_3),>(Title_noise_3)
  .db CAL,<(Title_noise_2),>(Title_noise_2)
  .db CAL,<(Title_noise_5),>(Title_noise_5)
  .db CAL,<(Title_noise_0),>(Title_noise_0)
  .db CAL,<(Title_noise_1),>(Title_noise_1)
  .db CAL,<(Title_noise_6),>(Title_noise_6)
  .db CAL,<(Title_noise_6),>(Title_noise_6)
  .db CAL,<(Title_noise_8),>(Title_noise_8)
  .db CAL,<(Title_noise_9),>(Title_noise_9)
  .db CAL,<(Title_noise_10),>(Title_noise_10)
  .db CAL,<(Title_noise_10),>(Title_noise_10)
  .db CAL,<(Title_noise_10),>(Title_noise_10)
  .db CAL,<(Title_noise_13),>(Title_noise_13)
  .db CAL,<(Title_noise_14),>(Title_noise_14)
  .db CAL,<(Title_noise_14),>(Title_noise_14)
  .db CAL,<(Title_noise_16),>(Title_noise_16)
  .db CAL,<(Title_noise_17),>(Title_noise_17)
  .db CAL,<(Title_noise_18),>(Title_noise_18)
  .db GOT
  .dw Title_noise_loop

Title_dpcm:
Title_dpcm_loop:
  .db CAL,<(Title_dpcm_0),>(Title_dpcm_0)
  .db CAL,<(Title_dpcm_1),>(Title_dpcm_1)
  .db CAL,<(Title_dpcm_0),>(Title_dpcm_0)
  .db CAL,<(Title_dpcm_3),>(Title_dpcm_3)
  .db CAL,<(Title_dpcm_0),>(Title_dpcm_0)
  .db CAL,<(Title_dpcm_5),>(Title_dpcm_5)
  .db CAL,<(Title_dpcm_0),>(Title_dpcm_0)
  .db CAL,<(Title_dpcm_1),>(Title_dpcm_1)
  .db CAL,<(Title_dpcm_6),>(Title_dpcm_6)
  .db CAL,<(Title_dpcm_6),>(Title_dpcm_6)
  .db CAL,<(Title_dpcm_8),>(Title_dpcm_8)
  .db CAL,<(Title_dpcm_9),>(Title_dpcm_9)
  .db CAL,<(Title_dpcm_6),>(Title_dpcm_6)
  .db CAL,<(Title_dpcm_11),>(Title_dpcm_11)
  .db CAL,<(Title_dpcm_12),>(Title_dpcm_12)
  .db CAL,<(Title_dpcm_13),>(Title_dpcm_13)
  .db CAL,<(Title_dpcm_14),>(Title_dpcm_14)
  .db CAL,<(Title_dpcm_14),>(Title_dpcm_14)
  .db CAL,<(Title_dpcm_16),>(Title_dpcm_16)
  .db CAL,<(Title_dpcm_17),>(Title_dpcm_17)
  .db CAL,<(Title_dpcm_18),>(Title_dpcm_18)
  .db GOT
  .dw Title_dpcm_loop

Title_square1_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A3,SL2,A3,SL6,A3,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,A3,SL4,A3,C4,B3,A3,SL2,A3,SL6,A3
  .db STV,11,SDU,7,A0,STV,7,SDU,3,SL2,A3,SL4,A3,C4,A3
  .db RET

Title_square1_3:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A3,SL2,A3,SL6,A3,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,A3,SL4,A3,G3,F3,F3,SL2,F3,SL6,F3
  .db STV,11,SDU,7,SL4,A0,STV,7,SDU,3,F3,F3,G3,A3
  .db RET

Title_square1_4:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,F3,SL2,F3,SL6,F3,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,F3,SL4,F3,A3,G3,G3,SL2,G3,SL6,G3
  .db STV,11,SDU,7,A0,STV,7,SDU,3,SL2,G3,SL4,G3,B3,G3
  .db RET

Title_square1_7:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,G3,SL2,G3,SL6,G3,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,G3,SL4,G3,AS3,A3,A3,SL2,A3,SL6
  .db A3,STV,11,SDU,7,A0,STV,7,SDU,3,SL2,A3,SL4,A3,C4,A3
  .db RET

Title_square1_10:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,D2,SL8,D2,SL4,D2,C2,SL8,C2,SL4
  .db C2,C2,SL8,C2,SL4,C2,D2,D2,F2,F2
  .db RET

Title_square1_11:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A2,SL8,A2,SL4,A2,AS2,SL8,AS2
  .db SL4,AS2,A2,A2,A2,A2,G2,G2,F2,F2
  .db RET

Title_square1_12:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,G2,SL8,G2,SL4,G2,F2,SL8,F2,SL4
  .db F2,G2,SL8,G2,SL4,G2,F2,SL8,F2,SL4,G2
  .db RET

Title_square1_13:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A2,SL8,A2,SL4,A2,G2,SL8,G2,SL4
  .db G2,F2,SL8,F2,SL4,F2,E2,D2,C2,D2
  .db RET

Title_square1_14:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,D3,SL8,D3,SL4,D3,C3,SL8,C3,SL4
  .db C3,C3,SL8,C3,SL4,C3,D3,D3,F3,F3
  .db RET

Title_square1_15:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A3,SL8,A3,SL4,A3,AS3,SL8,AS3
  .db SL4,AS3,A3,A3,A3,A3,G3,G3,F3,F3
  .db RET

Title_square1_16:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,G3,SL8,G3,SL4,G3,F3,SL8,F3,SL4
  .db F3,G3,SL8,G3,SL4,G3,F3,SL8,F3,SL4,G3
  .db RET

Title_square1_17:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A3,SL8,A3,SL4,A3,G3,SL8,G3,SL4
  .db G3,F3,SL8,F3,SL4,F3,E3,D3,C3,D3
  .db RET

Title_square1_18:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Title_square2_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,C4,SL2,C4,SL6,C4,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,C4,SL4,C4,E4,D4,C4,SL2,C4,SL6,C4
  .db STV,11,SDU,7,A0,STV,7,SDU,3,SL2,C4,SL4,C4,E4,D4
  .db RET

Title_square2_2:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,C4,SL2,C4,SL6,C4,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,C4,SL4,C4,F4,E4,D4,SL2,D4,SL6,D4
  .db STV,11,SDU,7,A0,STV,7,SDU,3,SL2,D4,SL4,D4,F4,E4
  .db RET

Title_square2_3:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,C4,SL2,C4,SL6,C4,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,C4,SL4,C4,D4,C4,A3,SL2,A3,SL6,A3
  .db STV,11,SDU,7,SL4,A0,STV,7,SDU,3,A3,A3,B3,C4
  .db RET

Title_square2_4:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A3,SL2,A3,SL6,A3,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,A3,SL4,A3,D4,C4,B3,SL2,B3,SL6,B3
  .db STV,11,SDU,7,A0,STV,7,SDU,3,SL2,B3,SL4,B3,D4,C4
  .db RET

Title_square2_7:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,AS3,SL2,AS3,SL6,AS3,STV,11
  .db SDU,7,A0,STV,7,SDU,3,SL2,AS3,SL4,AS3,D4,C4,C4,SL2,C4,SL6
  .db C4,STV,11,SDU,7,A0,STV,7,SDU,3,SL2,C4,SL4,C4,E4,D4
  .db RET

Title_square2_10:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,G2,SL8,G2,SL4,G2,F2,SL8,F2,SL4
  .db F2,F2,SL8,F2,SL4,F2,F2,F2,AS2,AS2
  .db RET

Title_square2_11:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,D3,SL8,D3,SL4,D3,D3,SL8,D3,SL4
  .db D3,D3,D3,D3,D3,C3,C3,AS2,AS2
  .db RET

Title_square2_12:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,C3,SL8,C3,SL4,C3,AS2,SL8,AS2
  .db SL4,AS2,C3,SL8,C3,SL4,C3,AS2,SL8,AS2,SL4,C3
  .db RET

Title_square2_13:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,D3,SL8,D3,SL4,D3,C3,SL8,C3,SL4
  .db C3,AS2,SL8,AS2,SL4,AS2,A2,G2,F2,G2
  .db RET

Title_square2_14:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,G3,SL8,G3,SL4,G3,F3,SL8,F3,SL4
  .db F3,F3,SL8,F3,SL4,F3,F3,F3,AS3,AS3
  .db RET

Title_square2_15:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,D4,SL8,D4,SL4,D4,D4,SL8,D4,SL4
  .db D4,D4,D4,D4,D4,C4,C4,AS3,AS3
  .db RET

Title_square2_16:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,C4,SL8,C4,SL4,C4,AS3,SL8,AS3
  .db SL4,AS3,C4,SL8,C4,SL4,C4,AS3,SL8,AS3,SL4,C4
  .db RET

Title_square2_17:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,D4,SL8,D4,SL4,D4,C4,SL8,C4,SL4
  .db C4,AS3,SL8,AS3,SL4,AS3,A3,G3,F3,G3
  .db RET

Title_square2_18:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Title_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL6,C3,STV,11,SL2,A0,STV,6,SL4
  .db F2,SL2,G2,A2,STV,11,SL4,A0,STV,6,F2,G2,A2,SL6,C3,STV,11
  .db SL2,A0,STV,6,SL4,F2,SL2,G2,A2,STV,11,SL4,A0,STV,6,F2,G2,A2
  .db RET

Title_triangle_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL6,C3,STV,11,SL2,A0,STV,6,SL4
  .db F2,SL2,G2,A2,STV,11,SL4,A0,STV,6,F2,G2,A2,SL6,C3,STV,11
  .db SL2,A0,STV,6,SL4,F2,SL2,G2,A2,STV,11,SL4,A0,STV,6,F4,G4,A4
  .db RET

Title_triangle_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C5,SL4,F4,SL2,G4,SL6,F4,SL4
  .db E4,F4,G4,SL8,A4,G4,F4,G4
  .db RET

Title_triangle_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,A4,SL4,F4,SL2,G4,SL6,F4,SL4
  .db E4,D4,SL2,E4,SLL,22,C4,SL4,F4,G4,A4
  .db RET

Title_triangle_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,A4,SL4,D4,SL2,E4,SL6,D4,SL4
  .db C4,D4,E4,SL8,F4,E4,F4,G4
  .db RET

Title_triangle_5:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,A4,G4,F4,E4,SL4,D4,E4,STV,11
  .db A0,STV,6,E4,D4,E4,STV,11,A0,STV,6,G2
  .db RET

Title_triangle_6:
  .db STV,6,SAR,3,STP,10,SDU,7,SL6,C5,AS4,SL4,A4,G4,A4,F4,G4,SL6
  .db A4,G4,SL4,F4,D4,F4,C4,F4
  .db RET

Title_triangle_7:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,AS4,SL4,F4,SL2,G4,SL6,A4,SL4
  .db F4,G4,A4,SL8,C5,SL4,F4,SL2,G4,SL6,F4,SL4,F4,G4,A4
  .db RET

Title_triangle_9:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,AS4,SL4,F4,SL2,G4,SL6,A4,SL4
  .db F4,G4,A4,SL8,C5,SL4,F4,SL2,G4,SL6,F4,SL4,F4,G4,F4
  .db RET

Title_triangle_10:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,AS4,A4,G4,SL8,F4,AS4
  .db RET

Title_triangle_11:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,A4,G4,F4,SL8,E4,D4
  .db RET

Title_triangle_12:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,G4,F4,E4,SL4,D4,C4,D4,E4
  .db RET

Title_triangle_13:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,A4,AS4,A4,SL4,G4,F4,E4,F4
  .db RET

Title_triangle_14:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,AS5,A5,G5,SL8,F5,AS5
  .db RET

Title_triangle_15:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,A5,G5,F5,SL8,E5,D5
  .db RET

Title_triangle_16:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,G5,F5,E5,SL4,D5,C5,D5,E5
  .db RET

Title_triangle_17:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,A5,AS5,A5,SL4,G5,F5,E5,F5
  .db RET

Title_triangle_18:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,C5,SL0,C4,SL8,C3,C2
  .db RET

Title_noise_0:
  .db STV,0,SAR,0,STP,10,SDU,7,SL2,14,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3
  .db STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db 3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1
  .db SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,3
  .db RET

Title_noise_1:
  .db STV,0,SAR,0,STP,10,SDU,7,SL2,14,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3
  .db STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,SL8,14,14,14
  .db 14
  .db RET

Title_noise_2:
  .db STV,4,SAR,3,STP,10,SDU,7,SL4,3,STV,1,SL2,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3
  .db STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db 3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,3
  .db RET

Title_noise_3:
  .db STV,4,SAR,3,STP,10,SDU,7,SL4,3,STV,1,SL2,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3
  .db STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3
  .db 3,3,STV,3,SAR,1,9,9,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,3
  .db RET

Title_noise_5:
  .db STV,4,SAR,3,STP,10,SDU,7,SL4,3,STV,1,SL2,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,3,3,3,STV,4,SL8,3,3,SL6,3,SL2,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,14
  .db RET

Title_noise_6:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,4,3,STV,1
  .db 3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,0,SAR,0,14,STV,1
  .db SAR,3,3,STV,4,3,STV,1,3
  .db RET

Title_noise_8:
  .db STV,0,SAR,0,STP,10,SDU,7,SL2,14,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3
  .db STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db 3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1
  .db SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3
  .db RET

Title_noise_9:
  .db STV,0,SAR,0,STP,10,SDU,7,SL2,14,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,3,3
  .db STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db 3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0,SAR,0,14,STV,1
  .db SAR,3,3,STV,3,SAR,1,9,9,9,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,3
  .db RET

Title_noise_10:
  .db STV,4,SAR,3,STP,10,SDU,7,SL0,3,3,3,3
  .db RET

Title_noise_13:
  .db STV,4,SAR,3,STP,10,SDU,7,SL0,3,3,SL8,3,3,SL4,3,3,STV,3
  .db SAR,1,SL2,9,9,9,9
  .db RET

Title_noise_14:
  .db STV,4,SAR,3,STP,10,SDU,7,SL4,3,STV,1,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,3,STV,4,3,STV,1,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,4
  .db 3,STV,1,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,3
  .db SAR,1,9,STV,1,SAR,3,SL2,3,STV,3,SAR,1,9
  .db RET

Title_noise_16:
  .db STV,4,SAR,3,STP,10,SDU,7,SL4,3,STV,1,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,SL2,3,STV,3,SAR,1,9,STV,4,SAR,3,3,STV,3,SAR,1,9,SL4
  .db 9,9,STV,1,SAR,3,SL2,3,STV,3,SAR,1,9,STV,4,SAR,3,SL4,3,STV,1
  .db 3,STV,3,SAR,1,9,STV,1,SAR,3,SL2,3,STV,3,SAR,1,9,STV,4
  .db SAR,3,3,STV,3,SAR,1,9,SL4,9,9,STV,1,SAR,3,SL2,3,STV,3
  .db SAR,1,9
  .db RET

Title_noise_17:
  .db STV,4,SAR,3,STP,10,SDU,7,SL4,3,STV,1,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,SL2,3,STV,3,SAR,1,9,STV,4,SAR,3,3,STV,3,SAR,1,9,SL4
  .db 9,9,STV,1,SAR,3,SL2,3,STV,3,SAR,1,9,STV,4,SAR,3,SL4,3,STV,1
  .db 3,STV,3,SAR,1,9,STV,1,SAR,3,SL2,3,STV,3,SAR,1,9,STV,4
  .db SAR,3,3,STV,3,SAR,1,9,9,9,SL4,9,9
  .db RET

Title_noise_18:
  .db STV,4,SAR,3,STP,10,SDU,7,SL0,3,STV,0,SAR,0,SL8,14,14,14,14
  .db 14,14
  .db RET

Title_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,D3,C3,D3,C3,D3,C3,SL4,D3
  .db D3
  .db RET

Title_dpcm_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,D3,C3,D3,C3,C3,C3,C3
  .db RET

Title_dpcm_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,D3,C3,D3,C3,D3,SL6,CS3,SL2
  .db D3,SL4,D3,D3
  .db RET

Title_dpcm_5:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,D3,C3,D3,C3,C3,SL6,C3,SL2
  .db C3,SL4,CS3,C3
  .db RET

Title_dpcm_6:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,C3,C3,C3,C3
  .db RET

Title_dpcm_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,D3,C3,D3,C3,D3,C3,D3
  .db RET

Title_dpcm_9:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,D3,C3,D3,C3,D3,SL4,C3,SL2
  .db D3,D3,SL4,D3,D3
  .db RET

Title_dpcm_11:
  .db STV,6,SAR,3,STP,10,SDU,7,SLC,C3,SL4,C3,SL0,C3,SLC,C3,SL4
  .db C3,SL0,C3
  .db RET

Title_dpcm_12:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,C3,C3,SL4,C3,C3,SL8,C3,C3
  .db C3,SL4,C3,C3
  .db RET

Title_dpcm_13:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,C3,C3,C3,C3,C3,SL2,C3,C3
  .db C3,C3,CS3,CS3,CS3,CS3
  .db RET

Title_dpcm_14:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,D3,C3,SL8,C3,D3,C3,SL4
  .db D3,C3,SL8,C3,SL6,D3,SL2,D3
  .db RET

Title_dpcm_16:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,C3,C3,CS3,SL2,C3,D3,C3,D3,SL4
  .db CS3,CS3,SL2,C3,D3,SL4,C3,C3,CS3,SL2,C3,D3,C3,D3,SL4,CS3
  .db CS3,SL2,C3,D3
  .db RET

Title_dpcm_17:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,C3,C3,CS3,SL2,C3,D3,C3,D3,SL4
  .db CS3,CS3,SL2,C3,D3,SL4,C3,C3,CS3,SL2,C3,D3,C3,D3,CS3,D3,SL4
  .db CS3,D3
  .db RET

Title_dpcm_18:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,C3,C3,C3,C3,C3,C3,C3
  .db RET

Slow_Theme_A:
  .db 0
  .db 4
  .db 85
  .db 3
  .dw Slow_Theme_A_square1
  .dw Slow_Theme_A_square2
  .dw Slow_Theme_A_triangle
  .dw Slow_Theme_A_noise
  .dw Slow_Theme_A_dpcm

Slow_Theme_A_square1:
Slow_Theme_A_square1_loop:
  .db CAL,<(Slow_Theme_A_square1_0),>(Slow_Theme_A_square1_0)
  .db CAL,<(Slow_Theme_A_square1_1),>(Slow_Theme_A_square1_1)
  .db CAL,<(Slow_Theme_A_square1_2),>(Slow_Theme_A_square1_2)
  .db CAL,<(Slow_Theme_A_square1_3),>(Slow_Theme_A_square1_3)
  .db CAL,<(Slow_Theme_A_square1_0),>(Slow_Theme_A_square1_0)
  .db CAL,<(Slow_Theme_A_square1_1),>(Slow_Theme_A_square1_1)
  .db CAL,<(Slow_Theme_A_square1_2),>(Slow_Theme_A_square1_2)
  .db CAL,<(Slow_Theme_A_square1_3),>(Slow_Theme_A_square1_3)
  .db CAL,<(Slow_Theme_A_square1_0),>(Slow_Theme_A_square1_0)
  .db CAL,<(Slow_Theme_A_square1_1),>(Slow_Theme_A_square1_1)
  .db CAL,<(Slow_Theme_A_square1_2),>(Slow_Theme_A_square1_2)
  .db CAL,<(Slow_Theme_A_square1_3),>(Slow_Theme_A_square1_3)
  .db GOT
  .dw Slow_Theme_A_square1_loop

Slow_Theme_A_square2:
Slow_Theme_A_square2_loop:
  .db CAL,<(Slow_Theme_A_square2_0),>(Slow_Theme_A_square2_0)
  .db CAL,<(Slow_Theme_A_square2_1),>(Slow_Theme_A_square2_1)
  .db CAL,<(Slow_Theme_A_square2_2),>(Slow_Theme_A_square2_2)
  .db CAL,<(Slow_Theme_A_square2_3),>(Slow_Theme_A_square2_3)
  .db CAL,<(Slow_Theme_A_square2_4),>(Slow_Theme_A_square2_4)
  .db CAL,<(Slow_Theme_A_square2_5),>(Slow_Theme_A_square2_5)
  .db CAL,<(Slow_Theme_A_square2_6),>(Slow_Theme_A_square2_6)
  .db CAL,<(Slow_Theme_A_square2_7),>(Slow_Theme_A_square2_7)
  .db CAL,<(Slow_Theme_A_square2_8),>(Slow_Theme_A_square2_8)
  .db CAL,<(Slow_Theme_A_square2_9),>(Slow_Theme_A_square2_9)
  .db CAL,<(Slow_Theme_A_square2_10),>(Slow_Theme_A_square2_10)
  .db CAL,<(Slow_Theme_A_square2_11),>(Slow_Theme_A_square2_11)
  .db GOT
  .dw Slow_Theme_A_square2_loop

Slow_Theme_A_triangle:
Slow_Theme_A_triangle_loop:
  .db CAL,<(Slow_Theme_A_triangle_0),>(Slow_Theme_A_triangle_0)
  .db CAL,<(Slow_Theme_A_triangle_1),>(Slow_Theme_A_triangle_1)
  .db CAL,<(Slow_Theme_A_triangle_2),>(Slow_Theme_A_triangle_2)
  .db CAL,<(Slow_Theme_A_triangle_3),>(Slow_Theme_A_triangle_3)
  .db CAL,<(Slow_Theme_A_triangle_4),>(Slow_Theme_A_triangle_4)
  .db CAL,<(Slow_Theme_A_triangle_5),>(Slow_Theme_A_triangle_5)
  .db CAL,<(Slow_Theme_A_triangle_6),>(Slow_Theme_A_triangle_6)
  .db CAL,<(Slow_Theme_A_triangle_7),>(Slow_Theme_A_triangle_7)
  .db CAL,<(Slow_Theme_A_triangle_8),>(Slow_Theme_A_triangle_8)
  .db CAL,<(Slow_Theme_A_triangle_9),>(Slow_Theme_A_triangle_9)
  .db CAL,<(Slow_Theme_A_triangle_10),>(Slow_Theme_A_triangle_10)
  .db CAL,<(Slow_Theme_A_triangle_11),>(Slow_Theme_A_triangle_11)
  .db GOT
  .dw Slow_Theme_A_triangle_loop

Slow_Theme_A_noise:
Slow_Theme_A_noise_loop:
  .db CAL,<(Slow_Theme_A_noise_0),>(Slow_Theme_A_noise_0)
  .db CAL,<(Slow_Theme_A_noise_1),>(Slow_Theme_A_noise_1)
  .db CAL,<(Slow_Theme_A_noise_0),>(Slow_Theme_A_noise_0)
  .db CAL,<(Slow_Theme_A_noise_3),>(Slow_Theme_A_noise_3)
  .db CAL,<(Slow_Theme_A_noise_4),>(Slow_Theme_A_noise_4)
  .db CAL,<(Slow_Theme_A_noise_4),>(Slow_Theme_A_noise_4)
  .db CAL,<(Slow_Theme_A_noise_4),>(Slow_Theme_A_noise_4)
  .db CAL,<(Slow_Theme_A_noise_7),>(Slow_Theme_A_noise_7)
  .db CAL,<(Slow_Theme_A_noise_4),>(Slow_Theme_A_noise_4)
  .db CAL,<(Slow_Theme_A_noise_4),>(Slow_Theme_A_noise_4)
  .db CAL,<(Slow_Theme_A_noise_4),>(Slow_Theme_A_noise_4)
  .db CAL,<(Slow_Theme_A_noise_7),>(Slow_Theme_A_noise_7)
  .db GOT
  .dw Slow_Theme_A_noise_loop

Slow_Theme_A_dpcm:
Slow_Theme_A_dpcm_loop:
  .db CAL,<(Slow_Theme_A_dpcm_0),>(Slow_Theme_A_dpcm_0)
  .db CAL,<(Slow_Theme_A_dpcm_1),>(Slow_Theme_A_dpcm_1)
  .db CAL,<(Slow_Theme_A_dpcm_2),>(Slow_Theme_A_dpcm_2)
  .db CAL,<(Slow_Theme_A_dpcm_3),>(Slow_Theme_A_dpcm_3)
  .db CAL,<(Slow_Theme_A_dpcm_4),>(Slow_Theme_A_dpcm_4)
  .db CAL,<(Slow_Theme_A_dpcm_4),>(Slow_Theme_A_dpcm_4)
  .db CAL,<(Slow_Theme_A_dpcm_4),>(Slow_Theme_A_dpcm_4)
  .db CAL,<(Slow_Theme_A_dpcm_7),>(Slow_Theme_A_dpcm_7)
  .db CAL,<(Slow_Theme_A_dpcm_4),>(Slow_Theme_A_dpcm_4)
  .db CAL,<(Slow_Theme_A_dpcm_4),>(Slow_Theme_A_dpcm_4)
  .db CAL,<(Slow_Theme_A_dpcm_4),>(Slow_Theme_A_dpcm_4)
  .db CAL,<(Slow_Theme_A_dpcm_7),>(Slow_Theme_A_dpcm_7)
  .db GOT
  .dw Slow_Theme_A_dpcm_loop

Slow_Theme_A_square1_0:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,F4,STV,10,G4,STV,9,C5,STV,10
  .db F4,STV,9,F4,STV,10,C5,STV,9,C5,STV,10,F4,STV,9,F4,STV,10
  .db C5,STV,9,C5,STV,10,F4,STV,9,F4,STV,10,C5,STV,9,C5,STV,10
  .db F4,STV,9,C4,STV,10,C5,STV,9,G4,STV,10,C4,STV,9,C4,STV,10
  .db G4,STV,9,G4,STV,10,C4,STV,9,C4,STV,10,G4,STV,9,G4,STV,10
  .db C4,STV,9,C4,STV,10,G4,STV,9,G4,STV,10,C4
  .db RET

Slow_Theme_A_square1_1:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,D4,STV,10,G4,STV,9,A4,STV,10
  .db D4,STV,9,D4,STV,10,A4,STV,9,A4,STV,10,D4,STV,9,D4,STV,10
  .db A4,STV,9,A4,STV,10,D4,STV,9,D4,STV,10,A4,STV,9,A4,STV,10
  .db D4,STV,9,A3,STV,10,A4,STV,9,E4,STV,10,A3,STV,9,A3,STV,10
  .db E4,STV,9,E4,STV,10,A3,STV,9,A3,STV,10,E4,STV,9,E4,STV,10
  .db A3,STV,9,A3,STV,10,E4,STV,9,E4,STV,10,A3
  .db RET

Slow_Theme_A_square1_2:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,AS3,STV,10,E4,STV,9,F4,STV,10
  .db AS3,STV,9,AS3,STV,10,F4,STV,9,F4,STV,10,AS3,STV,9,AS3,STV,10
  .db F4,STV,9,F4,STV,10,AS3,STV,9,AS3,STV,10,F4,STV,9,F4,STV,10
  .db AS3,STV,9,F3,STV,10,F4,STV,9,C4,STV,10,F3,STV,9,F3,STV,10
  .db C4,STV,9,C4,STV,10,F3,STV,9,F3,STV,10,C4,STV,9,C4,STV,10
  .db F3,STV,9,F3,STV,10,C4,STV,9,C4,STV,10,F3
  .db RET

Slow_Theme_A_square1_3:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,AS3,STV,10,C4,STV,9,F4,STV,10
  .db AS3,STV,9,AS3,STV,10,F4,STV,9,F4,STV,10,AS3,STV,9,AS3,STV,10
  .db F4,STV,9,F4,STV,10,AS3,STV,9,AS3,STV,10,F4,STV,9,F4,STV,10
  .db AS3,STV,9,C4,STV,10,F4,STV,9,G4,STV,10,C4,STV,9,C4,STV,10
  .db G4,STV,9,G4,STV,10,C4,STV,9,C4,STV,10,G4,STV,9,G4,STV,10
  .db C4,STV,9,C4,STV,10,G4,STV,9,G4,STV,10,C4
  .db RET

Slow_Theme_A_square2_0:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,A2,G2,F2,SL2,G2,SL6,F2,SL2,D2
  .db E2,F2,G2,A2,B2,SL4,C3,C3,A2,A2,SL2,G2,A2,G2,F2,SL4,G2,G2
  .db RET

Slow_Theme_A_square2_1:
  .db STV,9,SAR,3,STP,2,SDU,5,SL6,A2,F2,SL4,G2,C3,AS2,SL8,A2,C3
  .db SL4,F2,SL2,G2,SLA,F2,SL4,A2,G2
  .db RET

Slow_Theme_A_square2_2:
  .db STV,9,SAR,3,STP,2,SDU,5,SL2,G2,A2,G2,F2,SL4,G2,G2,SL2,G2
  .db F2,SL4,G2,SL8,G2,SL2,F2,G2,F2,E2,SL4,F2,F2,SL2,F2,E2,SL4
  .db F2,SL8,F2
  .db RET

Slow_Theme_A_square2_3:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,AS2,A2,G2,SL2,F2,G2,SL4,A2,SL8
  .db G2,SL4,F2,SL8,C2,G2,SL0,F2
  .db RET

Slow_Theme_A_square2_4:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,A3,G3,F3,SL2,G3,SL6,F3,SL2,D3
  .db E3,F3,G3,A3,B3,SL4,C4,C4,A3,A3,SL2,G3,A3,G3,F3,SL4,G3,G3
  .db RET

Slow_Theme_A_square2_5:
  .db STV,9,SAR,3,STP,2,SDU,5,SL6,A3,F3,SL4,G3,C4,AS3,SL8,A3,C4
  .db SL4,F3,SL2,G3,SLA,F3,SL4,A3,G3
  .db RET

Slow_Theme_A_square2_6:
  .db STV,9,SAR,3,STP,2,SDU,5,SL2,G3,A3,G3,F3,SL4,G3,G3,SL2,G3
  .db F3,SL4,G3,SL8,G3,SL2,F3,G3,F3,E3,SL4,F3,F3,SL2,F3,E3,SL4
  .db F3,SL8,F3
  .db RET

Slow_Theme_A_square2_7:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,AS3,A3,G3,SL2,F3,G3,SL4,A3,SL8
  .db G3,SL4,F3,SL8,C3,G3,SL0,F3
  .db RET

Slow_Theme_A_square2_8:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,C4,A3,G3,SL2,F3,G3,SL4,A3,F3
  .db D3,SL2,E3,F3,SL4,E3,A3,G3,SL2,F3,G3,SL4,A3,F3,D3,SL2,E3,F3
  .db RET

Slow_Theme_A_square2_9:
  .db STV,9,SAR,3,STP,2,SDU,5,SL8,AS3,A3,G3,F3,SL6,E3,F3,SL4,G3
  .db SL8,A3,C4
  .db RET

Slow_Theme_A_square2_10:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,D4,AS3,A3,SL2,G3,A3,SL4,AS3
  .db G3,E3,SL2,F3,G3,SL4,F3,AS3,A3,SL2,G3,A3,SL4,AS3,G3,F3,SL2
  .db E3,F3
  .db RET

Slow_Theme_A_square2_11:
  .db STV,9,SAR,3,STP,2,SDU,5,SL8,D3,F3,AS3,SL6,A3,SL2,G3,SLL,32
  .db F3
  .db RET

Slow_Theme_A_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,F2,E2
  .db RET

Slow_Theme_A_triangle_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,D2,C2
  .db RET

Slow_Theme_A_triangle_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,AS1,A1
  .db RET

Slow_Theme_A_triangle_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,G1,SLL,20,F1,SL2,G1,A1,AS1
  .db C2,D2,E2
  .db RET

Slow_Theme_A_triangle_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,F2,STV,8,F2,STV,6,F2,STV,8
  .db F2,STV,6,F2,STV,8,F2,STV,6,F2,STV,8,F2,STV,6,SL6,F2,STV,8
  .db SL2,F2,STV,6,SL6,F2,STV,8,SL2,F2,STV,6,E2,STV,8,E2,STV,6
  .db E2,STV,8,E2,STV,6,E2,STV,8,E2,STV,6,E2,STV,8,E2,STV,6
  .db SL6,E2,STV,8,SL2,E2,STV,6,SL6,E2,STV,8,SL2,E2
  .db RET

Slow_Theme_A_triangle_5:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,D2,STV,8,D2,STV,6,D2,STV,8
  .db D2,STV,6,D2,STV,8,D2,STV,6,D2,STV,8,D2,STV,6,SL6,D2,STV,8
  .db SL2,D2,STV,6,SL6,D2,STV,8,SL2,D2,STV,6,C2,STV,8,C2,STV,6
  .db C2,STV,8,C2,STV,6,C2,STV,8,C2,STV,6,C2,STV,8,C2,STV,6
  .db SL6,C2,STV,8,SL2,C2,STV,6,SL6,C2,STV,8,SL2,C2
  .db RET

Slow_Theme_A_triangle_6:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,AS1,STV,8,AS1,STV,6,AS1,STV,8
  .db AS1,STV,6,AS1,STV,8,AS1,STV,6,AS1,STV,8,AS1,STV,6,SL6,AS1
  .db STV,8,SL2,AS1,STV,6,SL6,AS1,STV,8,SL2,AS1,STV,6,A1,STV,8
  .db A1,STV,6,A1,STV,8,A1,STV,6,A1,STV,8,A1,STV,6,A1,STV,8
  .db A1,STV,6,SL6,A1,STV,8,SL2,A1,STV,6,SL6,A1,STV,8,SL2,A1
  .db RET

Slow_Theme_A_triangle_7:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,G1,SL8,F1,AS1,SL4,A1,SL2
  .db G1,A1,AS1,C2,D2,E2
  .db RET

Slow_Theme_A_triangle_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,F3,E3
  .db RET

Slow_Theme_A_triangle_9:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,D3,C3
  .db RET

Slow_Theme_A_triangle_10:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,AS2,A2
  .db RET

Slow_Theme_A_triangle_11:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,G2,SLL,20,F2,SL2,G2,A2,AS2
  .db C3,D3,E3
  .db RET

Slow_Theme_A_noise_0:
  .db STV,0,SAR,0,STP,10,SDU,7,SLL,60,14,SL4,14
  .db RET

Slow_Theme_A_noise_1:
  .db STV,0,SAR,0,STP,10,SDU,7,SLL,64,14
  .db RET

Slow_Theme_A_noise_3:
  .db STV,0,SAR,0,STP,10,SDU,7,SLL,52,14,SL2,14,14,STV,3,SAR,1
  .db 9,9,STV,4,SAR,3,SL4,3
  .db RET

Slow_Theme_A_noise_4:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,4,3,STV,0
  .db SAR,0,14,14,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,4,3,STV,0,SAR,0,14,14,STV,1,SAR,3
  .db 3,STV,4,3,STV,1,3
  .db RET

Slow_Theme_A_noise_7:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,4,3,STV,0
  .db SAR,0,14,14,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,4,3,STV,0,SAR,0,14,14,SL2,14,14,STV,3
  .db SAR,1,9,9,STV,4,SAR,3,SL4,3
  .db RET

Slow_Theme_A_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,60,C3,SL4,C3
  .db RET

Slow_Theme_A_dpcm_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,64,C3
  .db RET

Slow_Theme_A_dpcm_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,60,C3,SL4,C3
  .db RET

Slow_Theme_A_dpcm_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,52,C3,SL2,C3,C3,CS3,SL6,CS3
  .db RET

Slow_Theme_A_dpcm_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SLC,C3,SL4,C3,SL0,C3,SLC,C3,SL4
  .db C3,SL0,C3
  .db RET

Slow_Theme_A_dpcm_7:
  .db STV,6,SAR,3,STP,10,SDU,7,SLC,C3,SL4,C3,SL0,C3,SLC,C3,SL4
  .db C3,C3,SL2,C3,C3,CS3,SL6,CS3
  .db RET

Fast_Theme_A:
  .db 0
  .db 3
  .db 128
  .db 2
  .dw Fast_Theme_A_square1
  .dw Fast_Theme_A_square2
  .dw Fast_Theme_A_triangle
  .dw Fast_Theme_A_noise
  .dw Fast_Theme_A_dpcm

Fast_Theme_A_square1:
Fast_Theme_A_square1_loop:
  .db CAL,<(Fast_Theme_A_square1_0),>(Fast_Theme_A_square1_0)
  .db CAL,<(Fast_Theme_A_square1_1),>(Fast_Theme_A_square1_1)
  .db CAL,<(Fast_Theme_A_square1_2),>(Fast_Theme_A_square1_2)
  .db CAL,<(Fast_Theme_A_square1_3),>(Fast_Theme_A_square1_3)
  .db CAL,<(Fast_Theme_A_square1_0),>(Fast_Theme_A_square1_0)
  .db CAL,<(Fast_Theme_A_square1_1),>(Fast_Theme_A_square1_1)
  .db CAL,<(Fast_Theme_A_square1_2),>(Fast_Theme_A_square1_2)
  .db CAL,<(Fast_Theme_A_square1_3),>(Fast_Theme_A_square1_3)
  .db CAL,<(Fast_Theme_A_square1_0),>(Fast_Theme_A_square1_0)
  .db CAL,<(Fast_Theme_A_square1_1),>(Fast_Theme_A_square1_1)
  .db CAL,<(Fast_Theme_A_square1_2),>(Fast_Theme_A_square1_2)
  .db CAL,<(Fast_Theme_A_square1_3),>(Fast_Theme_A_square1_3)
  .db CAL,<(Fast_Theme_A_square1_0),>(Fast_Theme_A_square1_0)
  .db CAL,<(Fast_Theme_A_square1_1),>(Fast_Theme_A_square1_1)
  .db CAL,<(Fast_Theme_A_square1_2),>(Fast_Theme_A_square1_2)
  .db CAL,<(Fast_Theme_A_square1_3),>(Fast_Theme_A_square1_3)
  .db GOT
  .dw Fast_Theme_A_square1_loop

Fast_Theme_A_square2:
Fast_Theme_A_square2_loop:
  .db CAL,<(Fast_Theme_A_square2_0),>(Fast_Theme_A_square2_0)
  .db CAL,<(Fast_Theme_A_square2_1),>(Fast_Theme_A_square2_1)
  .db CAL,<(Fast_Theme_A_square2_2),>(Fast_Theme_A_square2_2)
  .db CAL,<(Fast_Theme_A_square2_3),>(Fast_Theme_A_square2_3)
  .db CAL,<(Fast_Theme_A_square2_4),>(Fast_Theme_A_square2_4)
  .db CAL,<(Fast_Theme_A_square2_5),>(Fast_Theme_A_square2_5)
  .db CAL,<(Fast_Theme_A_square2_6),>(Fast_Theme_A_square2_6)
  .db CAL,<(Fast_Theme_A_square2_7),>(Fast_Theme_A_square2_7)
  .db CAL,<(Fast_Theme_A_square2_12),>(Fast_Theme_A_square2_12)
  .db CAL,<(Fast_Theme_A_square2_13),>(Fast_Theme_A_square2_13)
  .db CAL,<(Fast_Theme_A_square2_14),>(Fast_Theme_A_square2_14)
  .db CAL,<(Fast_Theme_A_square2_15),>(Fast_Theme_A_square2_15)
  .db CAL,<(Fast_Theme_A_square2_8),>(Fast_Theme_A_square2_8)
  .db CAL,<(Fast_Theme_A_square2_9),>(Fast_Theme_A_square2_9)
  .db CAL,<(Fast_Theme_A_square2_10),>(Fast_Theme_A_square2_10)
  .db CAL,<(Fast_Theme_A_square2_11),>(Fast_Theme_A_square2_11)
  .db GOT
  .dw Fast_Theme_A_square2_loop

Fast_Theme_A_triangle:
Fast_Theme_A_triangle_loop:
  .db CAL,<(Fast_Theme_A_triangle_0),>(Fast_Theme_A_triangle_0)
  .db CAL,<(Fast_Theme_A_triangle_1),>(Fast_Theme_A_triangle_1)
  .db CAL,<(Fast_Theme_A_triangle_2),>(Fast_Theme_A_triangle_2)
  .db CAL,<(Fast_Theme_A_triangle_3),>(Fast_Theme_A_triangle_3)
  .db CAL,<(Fast_Theme_A_triangle_4),>(Fast_Theme_A_triangle_4)
  .db CAL,<(Fast_Theme_A_triangle_5),>(Fast_Theme_A_triangle_5)
  .db CAL,<(Fast_Theme_A_triangle_6),>(Fast_Theme_A_triangle_6)
  .db CAL,<(Fast_Theme_A_triangle_7),>(Fast_Theme_A_triangle_7)
  .db CAL,<(Fast_Theme_A_triangle_12),>(Fast_Theme_A_triangle_12)
  .db CAL,<(Fast_Theme_A_triangle_5),>(Fast_Theme_A_triangle_5)
  .db CAL,<(Fast_Theme_A_triangle_6),>(Fast_Theme_A_triangle_6)
  .db CAL,<(Fast_Theme_A_triangle_7),>(Fast_Theme_A_triangle_7)
  .db CAL,<(Fast_Theme_A_triangle_8),>(Fast_Theme_A_triangle_8)
  .db CAL,<(Fast_Theme_A_triangle_9),>(Fast_Theme_A_triangle_9)
  .db CAL,<(Fast_Theme_A_triangle_10),>(Fast_Theme_A_triangle_10)
  .db CAL,<(Fast_Theme_A_triangle_11),>(Fast_Theme_A_triangle_11)
  .db GOT
  .dw Fast_Theme_A_triangle_loop

Fast_Theme_A_noise:
Fast_Theme_A_noise_loop:
  .db CAL,<(Fast_Theme_A_noise_0),>(Fast_Theme_A_noise_0)
  .db CAL,<(Fast_Theme_A_noise_0),>(Fast_Theme_A_noise_0)
  .db CAL,<(Fast_Theme_A_noise_2),>(Fast_Theme_A_noise_2)
  .db CAL,<(Fast_Theme_A_noise_3),>(Fast_Theme_A_noise_3)
  .db CAL,<(Fast_Theme_A_noise_4),>(Fast_Theme_A_noise_4)
  .db CAL,<(Fast_Theme_A_noise_5),>(Fast_Theme_A_noise_5)
  .db CAL,<(Fast_Theme_A_noise_6),>(Fast_Theme_A_noise_6)
  .db CAL,<(Fast_Theme_A_noise_7),>(Fast_Theme_A_noise_7)
  .db CAL,<(Fast_Theme_A_noise_4),>(Fast_Theme_A_noise_4)
  .db CAL,<(Fast_Theme_A_noise_5),>(Fast_Theme_A_noise_5)
  .db CAL,<(Fast_Theme_A_noise_6),>(Fast_Theme_A_noise_6)
  .db CAL,<(Fast_Theme_A_noise_7),>(Fast_Theme_A_noise_7)
  .db CAL,<(Fast_Theme_A_noise_8),>(Fast_Theme_A_noise_8)
  .db CAL,<(Fast_Theme_A_noise_8),>(Fast_Theme_A_noise_8)
  .db CAL,<(Fast_Theme_A_noise_8),>(Fast_Theme_A_noise_8)
  .db CAL,<(Fast_Theme_A_noise_11),>(Fast_Theme_A_noise_11)
  .db GOT
  .dw Fast_Theme_A_noise_loop

Fast_Theme_A_dpcm:
Fast_Theme_A_dpcm_loop:
  .db CAL,<(Fast_Theme_A_dpcm_0),>(Fast_Theme_A_dpcm_0)
  .db CAL,<(Fast_Theme_A_dpcm_1),>(Fast_Theme_A_dpcm_1)
  .db CAL,<(Fast_Theme_A_dpcm_2),>(Fast_Theme_A_dpcm_2)
  .db CAL,<(Fast_Theme_A_dpcm_3),>(Fast_Theme_A_dpcm_3)
  .db CAL,<(Fast_Theme_A_dpcm_4),>(Fast_Theme_A_dpcm_4)
  .db CAL,<(Fast_Theme_A_dpcm_5),>(Fast_Theme_A_dpcm_5)
  .db CAL,<(Fast_Theme_A_dpcm_6),>(Fast_Theme_A_dpcm_6)
  .db CAL,<(Fast_Theme_A_dpcm_7),>(Fast_Theme_A_dpcm_7)
  .db CAL,<(Fast_Theme_A_dpcm_4),>(Fast_Theme_A_dpcm_4)
  .db CAL,<(Fast_Theme_A_dpcm_5),>(Fast_Theme_A_dpcm_5)
  .db CAL,<(Fast_Theme_A_dpcm_6),>(Fast_Theme_A_dpcm_6)
  .db CAL,<(Fast_Theme_A_dpcm_7),>(Fast_Theme_A_dpcm_7)
  .db CAL,<(Fast_Theme_A_dpcm_8),>(Fast_Theme_A_dpcm_8)
  .db CAL,<(Fast_Theme_A_dpcm_8),>(Fast_Theme_A_dpcm_8)
  .db CAL,<(Fast_Theme_A_dpcm_8),>(Fast_Theme_A_dpcm_8)
  .db CAL,<(Fast_Theme_A_dpcm_11),>(Fast_Theme_A_dpcm_11)
  .db GOT
  .dw Fast_Theme_A_dpcm_loop

Fast_Theme_A_square1_0:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,FS4,STV,10,GS4,STV,9,CS5,STV,10
  .db FS4,STV,9,FS4,STV,10,CS5,STV,9,CS5,STV,10,FS4,STV,9,FS4
  .db STV,10,CS5,STV,9,CS5,STV,10,FS4,STV,9,FS4,STV,10,CS5,STV,9
  .db CS5,STV,10,FS4,STV,9,CS4,STV,10,CS5,STV,9,GS4,STV,10
  .db CS4,STV,9,CS4,STV,10,GS4,STV,9,GS4,STV,10,CS4,STV,9,CS4
  .db STV,10,GS4,STV,9,GS4,STV,10,CS4,STV,9,CS4,STV,10,GS4,STV,9
  .db GS4,STV,10,CS4
  .db RET

Fast_Theme_A_square1_1:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,DS4,STV,10,GS4,STV,9,AS4,STV,10
  .db DS4,STV,9,DS4,STV,10,AS4,STV,9,AS4,STV,10,DS4,STV,9,DS4
  .db STV,10,AS4,STV,9,AS4,STV,10,DS4,STV,9,DS4,STV,10,AS4,STV,9
  .db AS4,STV,10,DS4,STV,9,AS3,STV,10,AS4,STV,9,F4,STV,10,AS3
  .db STV,9,AS3,STV,10,F4,STV,9,F4,STV,10,AS3,STV,9,AS3,STV,10
  .db F4,STV,9,F4,STV,10,AS3,STV,9,AS3,STV,10,F4,STV,9,F4,STV,10
  .db AS3
  .db RET

Fast_Theme_A_square1_2:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,B3,STV,10,F4,STV,9,FS4,STV,10
  .db B3,STV,9,B3,STV,10,FS4,STV,9,FS4,STV,10,B3,STV,9,B3,STV,10
  .db FS4,STV,9,FS4,STV,10,B3,STV,9,B3,STV,10,FS4,STV,9,FS4,STV,10
  .db B3,STV,9,FS3,STV,10,FS4,STV,9,CS4,STV,10,FS3,STV,9,FS3,STV,10
  .db CS4,STV,9,CS4,STV,10,FS3,STV,9,FS3,STV,10,CS4,STV,9,CS4
  .db STV,10,FS3,STV,9,FS3,STV,10,CS4,STV,9,CS4,STV,10,FS3
  .db RET

Fast_Theme_A_square1_3:
  .db STV,9,SAR,3,STP,10,SDU,5,SL2,B3,STV,10,CS4,STV,9,FS4,STV,10
  .db B3,STV,9,B3,STV,10,FS4,STV,9,FS4,STV,10,B3,STV,9,B3,STV,10
  .db FS4,STV,9,FS4,STV,10,B3,STV,9,B3,STV,10,FS4,STV,9,FS4,STV,10
  .db B3,STV,9,CS4,STV,10,FS4,STV,9,GS4,STV,10,CS4,STV,9,CS4,STV,10
  .db GS4,STV,9,GS4,STV,10,CS4,STV,9,CS4,STV,10,GS4,STV,9,GS4
  .db STV,10,CS4,STV,9,CS4,STV,10,GS4,STV,9,GS4,STV,10,CS4
  .db RET

Fast_Theme_A_square2_0:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,AS2,GS2,FS2,SL2,GS2,SL6,FS2
  .db SL2,DS2,F2,FS2,GS2,AS2,C3,SL4,CS3,CS3,AS2,AS2,SL2,GS2,AS2
  .db GS2,FS2,SL4,GS2,GS2
  .db RET

Fast_Theme_A_square2_1:
  .db STV,9,SAR,3,STP,2,SDU,5,SL6,AS2,FS2,SL4,GS2,CS3,B2,SL8,AS2
  .db CS3,SL4,FS2,SL2,GS2,SLA,FS2,SL4,AS2,GS2
  .db RET

Fast_Theme_A_square2_2:
  .db STV,9,SAR,3,STP,2,SDU,5,SL2,GS2,AS2,GS2,FS2,SL4,GS2,GS2
  .db SL2,GS2,FS2,SL4,GS2,SL8,GS2,SL2,FS2,GS2,FS2,F2,SL4,FS2,FS2
  .db SL2,FS2,F2,SL4,FS2,SL8,FS2
  .db RET

Fast_Theme_A_square2_3:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,B2,AS2,GS2,SL2,FS2,GS2,SL4,AS2
  .db SL8,GS2,SL4,FS2,SL8,CS2,GS2,SL0,FS2
  .db RET

Fast_Theme_A_square2_4:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,AS3,GS3,FS3,SL2,GS3,SL6,FS3
  .db SL2,DS3,F3,FS3,GS3,AS3,C4,SL4,CS4,CS4,AS3,AS3,SL2,GS3,AS3
  .db GS3,FS3,SL4,GS3,GS3
  .db RET

Fast_Theme_A_square2_5:
  .db STV,9,SAR,3,STP,2,SDU,5,SL6,AS3,FS3,SL4,GS3,CS4,B3,SL8,AS3
  .db CS4,SL4,FS3,SL2,GS3,SLA,FS3,SL4,AS3,GS3
  .db RET

Fast_Theme_A_square2_6:
  .db STV,9,SAR,3,STP,2,SDU,5,SL2,GS3,AS3,GS3,FS3,SL4,GS3,GS3
  .db SL2,GS3,FS3,SL4,GS3,SL8,GS3,SL2,FS3,GS3,FS3,F3,SL4,FS3,FS3
  .db SL2,FS3,F3,SL4,FS3,SL8,FS3
  .db RET

Fast_Theme_A_square2_7:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,B3,AS3,GS3,SL2,FS3,GS3,SL4,AS3
  .db SL8,GS3,SL4,FS3,SL8,CS3,GS3,SL0,FS3
  .db RET

Fast_Theme_A_square2_8:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,CS4,AS3,GS3,SL2,FS3,GS3,SL4
  .db AS3,FS3,DS3,SL2,F3,FS3,SL4,F3,AS3,GS3,SL2,FS3,GS3,SL4,AS3
  .db FS3,DS3,SL2,F3,FS3
  .db RET

Fast_Theme_A_square2_9:
  .db STV,9,SAR,3,STP,2,SDU,5,SL8,B3,AS3,GS3,FS3,SL6,F3,FS3,SL4
  .db GS3,SL8,AS3,CS4
  .db RET

Fast_Theme_A_square2_10:
  .db STV,9,SAR,3,STP,2,SDU,5,SL4,DS4,B3,AS3,SL2,GS3,AS3,SL4,B3
  .db GS3,F3,SL2,FS3,GS3,SL4,FS3,B3,AS3,SL2,GS3,AS3,SL4,B3,GS3
  .db FS3,SL2,F3,FS3
  .db RET

Fast_Theme_A_square2_11:
  .db STV,9,SAR,3,STP,2,SDU,5,SL8,DS3,FS3,B3,SL6,AS3,SL2,GS3,SLL,32
  .db FS3
  .db RET

Fast_Theme_A_square2_12:
  .db STV,9,SAR,3,STP,2,SDU,5,SL8,B3,FS3,DS3,CS3,SL4,B3,SL8,AS3
  .db SL4,GS3,SL0,FS3
  .db RET

Fast_Theme_A_square2_13:
  .db STV,9,SAR,3,STP,2,SDU,5,SL8,FS3,GS3,AS3,FS3,SL4,DS3,SL8
  .db FS3,SL4,DS3,SL0,CS3
  .db RET

Fast_Theme_A_square2_14:
  .db STV,9,SAR,3,STP,2,SDU,5,SL8,DS3,F3,SL0,FS3,SL4,B3,SL8,AS3
  .db SL4,FS3,SL8,GS3,SL2,AS3,GS3,FS3,GS3
  .db RET

Fast_Theme_A_square2_15:
  .db STV,9,SAR,3,STP,2,SDU,5,SL2,B3,AS3,GS3,AS3,GS3,FS3,F3,FS3
  .db F3,DS3,CS3,DS3,F3,FS3,GS3,F3,SL0,FS3,STV,10,FS4
  .db RET

Fast_Theme_A_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,FS2,F2
  .db RET

Fast_Theme_A_triangle_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,DS2,CS2
  .db RET

Fast_Theme_A_triangle_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,B1,AS1
  .db RET

Fast_Theme_A_triangle_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,GS1,SLL,20,FS1,SL2,GS1,AS1
  .db B1,CS2,DS2,F2
  .db RET

Fast_Theme_A_triangle_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,FS2,STV,8,FS2,STV,6,FS2,STV,8
  .db FS2,STV,6,FS2,STV,8,FS2,STV,6,FS2,STV,8,FS2,STV,6,SL6,FS2
  .db STV,8,SL2,FS2,STV,6,SL6,FS2,STV,8,SL2,FS2,STV,6,F2,STV,8
  .db F2,STV,6,F2,STV,8,F2,STV,6,F2,STV,8,F2,STV,6,F2,STV,8
  .db F2,STV,6,SL6,F2,STV,8,SL2,F2,STV,6,SL6,F2,STV,8,SL2,F2
  .db RET

Fast_Theme_A_triangle_5:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,DS2,STV,8,DS2,STV,6,DS2,STV,8
  .db DS2,STV,6,DS2,STV,8,DS2,STV,6,DS2,STV,8,DS2,STV,6,SL6,DS2
  .db STV,8,SL2,DS2,STV,6,SL6,DS2,STV,8,SL2,DS2,STV,6,CS2,STV,8
  .db CS2,STV,6,CS2,STV,8,CS2,STV,6,CS2,STV,8,CS2,STV,6,CS2,STV,8
  .db CS2,STV,6,SL6,CS2,STV,8,SL2,CS2,STV,6,SL6,CS2,STV,8,SL2
  .db CS2
  .db RET

Fast_Theme_A_triangle_6:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,B1,STV,8,B1,STV,6,B1,STV,8
  .db B1,STV,6,B1,STV,8,B1,STV,6,B1,STV,8,B1,STV,6,SL6,B1,STV,8
  .db SL2,B1,STV,6,SL6,B1,STV,8,SL2,B1,STV,6,AS1,STV,8,AS1,STV,6
  .db AS1,STV,8,AS1,STV,6,AS1,STV,8,AS1,STV,6,AS1,STV,8,AS1,STV,6
  .db SL6,AS1,STV,8,SL2,AS1,STV,6,SL6,AS1,STV,8,SL2,AS1
  .db RET

Fast_Theme_A_triangle_7:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,GS1,SL8,FS1,B1,SL4,AS1,SL2
  .db GS1,AS1,B1,CS2,DS2,F2
  .db RET

Fast_Theme_A_triangle_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,FS3,F3
  .db RET

Fast_Theme_A_triangle_9:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,DS3,CS3
  .db RET

Fast_Theme_A_triangle_10:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,B2,AS2
  .db RET

Fast_Theme_A_triangle_11:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,32,GS2,SLL,20,FS2,SL2,GS2,AS2
  .db B2,CS3,DS3,F3
  .db RET

Fast_Theme_A_triangle_12:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,FS3,STV,8,FS3,STV,6,FS3,STV,8
  .db FS3,STV,6,FS3,STV,8,FS3,STV,6,FS3,STV,8,FS3,STV,6,SL6,FS3
  .db STV,8,SL2,FS3,STV,6,SL6,FS3,STV,8,SL2,FS3,STV,6,F3,STV,8
  .db F3,STV,6,F3,STV,8,F3,STV,6,F3,STV,8,F3,STV,6,F3,STV,8
  .db F3,STV,6,SL6,F3,STV,8,SL2,F3,STV,6,SL6,F3,STV,8,SL2,F3
  .db RET

Fast_Theme_A_noise_0:
  .db STV,3,SAR,1,STP,10,SDU,7,SL4,9,SLL,28,9,SL4,9,SLC,9,SL4
  .db 9,9,9,SL2,9,9
  .db RET

Fast_Theme_A_noise_2:
  .db STV,3,SAR,1,STP,10,SDU,7,SL4,9,9,STV,0,SAR,0,SL8,14,14,14
  .db STV,3,SAR,1,SL4,9,9,STV,0,SAR,0,SL8,14,STV,3,SAR,1,SL4,9,9
  .db 9,SL2,9,9
  .db RET

Fast_Theme_A_noise_3:
  .db STV,3,SAR,1,STP,10,SDU,7,SL4,9,9,STV,0,SAR,0,SL8,14,14,14
  .db STV,3,SAR,1,SL4,9,9,STV,0,SAR,0,SL8,14,STV,3,SAR,1,SL2,9,9
  .db 9,9,SL4,9,STV,4,SAR,3,4
  .db RET

Fast_Theme_A_noise_4:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3
  .db RET

Fast_Theme_A_noise_5:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db SL2,9,9,STV,4,SAR,3,SL4,3
  .db RET

Fast_Theme_A_noise_6:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,4,3,STV,0
  .db SAR,0,14,14,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,4,3,STV,0,SAR,0,14,14,STV,1,SAR,3
  .db 3,STV,4,SL2,3,STV,3,SAR,1,9,9,9
  .db RET

Fast_Theme_A_noise_7:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,SL2,14,14,STV,3,SAR,1,9,9,STV,4
  .db SAR,3,SL4,3
  .db RET

Fast_Theme_A_noise_8:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,4,3,STV,0
  .db SAR,0,14,14,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,4,3,STV,0,SAR,0,14,14,STV,1,SAR,3
  .db 3,STV,4,3,STV,1,3
  .db RET

Fast_Theme_A_noise_11:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,4,3,STV,0
  .db SAR,0,14,14,STV,1,SAR,3,3,STV,4,3,STV,1,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,4,3,STV,0,SAR,0,14,14,SL2,14,14,STV,3
  .db SAR,1,9,9,STV,4,SAR,3,SL4,3
  .db RET

Fast_Theme_A_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,CS3,SLL,28,D3,SL4,D3,SLC,D3
  .db SL4,D3,D3,D3,SL2,CS3,D3
  .db RET

Fast_Theme_A_dpcm_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,CS3,SLL,28,D3,SL4,D3,SLC,D3
  .db SL4,D3,D3,D3,SL2,D3,D3
  .db RET

Fast_Theme_A_dpcm_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,CS3,D3,SL8,C3,C3,C3,SL4,CS3
  .db D3,SL8,C3,SL4,CS3,D3,CS3,SL2,CS3,D3
  .db RET

Fast_Theme_A_dpcm_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,CS3,D3,SL8,C3,C3,C3,SL4,CS3
  .db D3,SL8,C3,SL2,CS3,D3,D3,D3,SL4,CS3,CS3
  .db RET

Fast_Theme_A_dpcm_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,D3,C3,SL8,C3,D3,C3,SL4
  .db D3,C3,SL8,C3,D3
  .db RET

Fast_Theme_A_dpcm_5:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,D3,C3,SL8,C3,D3,C3,SL4
  .db D3,C3,SL8,C3,SL2,D3,SL6,D3
  .db RET

Fast_Theme_A_dpcm_6:
  .db STV,6,SAR,3,STP,10,SDU,7,SLC,C3,SL4,C3,SL0,C3,SLC,C3,SL4
  .db C3,SLA,C3,SL2,D3,D3,D3
  .db RET

Fast_Theme_A_dpcm_7:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,D3,C3,SL8,C3,D3,C3,SL4
  .db D3,C3,C3,SL2,C3,C3,CS3,SL6,CS3
  .db RET

Fast_Theme_A_dpcm_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SLC,C3,SL4,C3,SL0,C3,SLC,C3,SL4
  .db C3,SL0,C3
  .db RET

Fast_Theme_A_dpcm_11:
  .db STV,6,SAR,3,STP,10,SDU,7,SLC,C3,SL4,C3,SL0,C3,SLC,C3,SL4
  .db C3,C3,SL2,C3,C3,CS3,SL6,CS3
  .db RET

Slow_Theme_B:
  .db 0
  .db 4
  .db 85
  .db 3
  .dw Slow_Theme_B_square1
  .dw Slow_Theme_B_square2
  .dw Slow_Theme_B_triangle
  .dw Slow_Theme_B_noise
  .dw Slow_Theme_B_dpcm

Slow_Theme_B_square1:
  .db CAL,<(Slow_Theme_B_square1_0),>(Slow_Theme_B_square1_0)
Slow_Theme_B_square1_loop:
  .db CAL,<(Slow_Theme_B_square1_1),>(Slow_Theme_B_square1_1)
  .db CAL,<(Slow_Theme_B_square1_2),>(Slow_Theme_B_square1_2)
  .db CAL,<(Slow_Theme_B_square1_1),>(Slow_Theme_B_square1_1)
  .db CAL,<(Slow_Theme_B_square1_4),>(Slow_Theme_B_square1_4)
  .db CAL,<(Slow_Theme_B_square1_5),>(Slow_Theme_B_square1_5)
  .db CAL,<(Slow_Theme_B_square1_6),>(Slow_Theme_B_square1_6)
  .db CAL,<(Slow_Theme_B_square1_7),>(Slow_Theme_B_square1_7)
  .db CAL,<(Slow_Theme_B_square1_8),>(Slow_Theme_B_square1_8)
  .db GOT
  .dw Slow_Theme_B_square1_loop

Slow_Theme_B_square2:
  .db CAL,<(Slow_Theme_B_square2_0),>(Slow_Theme_B_square2_0)
Slow_Theme_B_square2_loop:
  .db CAL,<(Slow_Theme_B_square2_1),>(Slow_Theme_B_square2_1)
  .db CAL,<(Slow_Theme_B_square2_2),>(Slow_Theme_B_square2_2)
  .db CAL,<(Slow_Theme_B_square2_1),>(Slow_Theme_B_square2_1)
  .db CAL,<(Slow_Theme_B_square2_4),>(Slow_Theme_B_square2_4)
  .db CAL,<(Slow_Theme_B_square2_1),>(Slow_Theme_B_square2_1)
  .db CAL,<(Slow_Theme_B_square2_6),>(Slow_Theme_B_square2_6)
  .db CAL,<(Slow_Theme_B_square2_7),>(Slow_Theme_B_square2_7)
  .db CAL,<(Slow_Theme_B_square2_8),>(Slow_Theme_B_square2_8)
  .db GOT
  .dw Slow_Theme_B_square2_loop

Slow_Theme_B_triangle:
  .db CAL,<(Slow_Theme_B_triangle_0),>(Slow_Theme_B_triangle_0)
Slow_Theme_B_triangle_loop:
  .db CAL,<(Slow_Theme_B_triangle_1),>(Slow_Theme_B_triangle_1)
  .db CAL,<(Slow_Theme_B_triangle_1),>(Slow_Theme_B_triangle_1)
  .db CAL,<(Slow_Theme_B_triangle_1),>(Slow_Theme_B_triangle_1)
  .db CAL,<(Slow_Theme_B_triangle_4),>(Slow_Theme_B_triangle_4)
  .db CAL,<(Slow_Theme_B_triangle_1),>(Slow_Theme_B_triangle_1)
  .db CAL,<(Slow_Theme_B_triangle_1),>(Slow_Theme_B_triangle_1)
  .db CAL,<(Slow_Theme_B_triangle_1),>(Slow_Theme_B_triangle_1)
  .db CAL,<(Slow_Theme_B_triangle_8),>(Slow_Theme_B_triangle_8)
  .db GOT
  .dw Slow_Theme_B_triangle_loop

Slow_Theme_B_noise:
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
Slow_Theme_B_noise_loop:
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
  .db CAL,<(Slow_Theme_B_noise_0),>(Slow_Theme_B_noise_0)
  .db CAL,<(Slow_Theme_B_noise_8),>(Slow_Theme_B_noise_8)
  .db GOT
  .dw Slow_Theme_B_noise_loop

Slow_Theme_B_dpcm:
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
Slow_Theme_B_dpcm_loop:
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
  .db CAL,<(Slow_Theme_B_dpcm_0),>(Slow_Theme_B_dpcm_0)
  .db CAL,<(Slow_Theme_B_dpcm_8),>(Slow_Theme_B_dpcm_8)
  .db GOT
  .dw Slow_Theme_B_dpcm_loop

Slow_Theme_B_square1_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,55,A0,STV,2,STP,1,SDU,4
  .db SL4,G2,B2,SL1,C3
  .db RET

Slow_Theme_B_square1_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SL3,A0,STV,2,STP,1,SDU,4,SL8,E3
  .db SL4,D3,C3,SL8,D3,SL4,C3,B2,SL0,A2,SL4,A3,G3,E3,SL1,C3
  .db RET

Slow_Theme_B_square1_2:
  .db STV,11,SAR,3,STP,10,SDU,7,SL3,A0,STV,2,STP,1,SDU,4,SL8,E3
  .db SL4,D3,C3,SL8,D3,SL4,C3,B2,SL0,A2,SL8,A3,SL4,C3,SL1,D3
  .db RET

Slow_Theme_B_square1_4:
  .db STV,11,SAR,3,STP,10,SDU,7,SL3,A0,STV,2,STP,1,SDU,4,SL8,D3
  .db SL4,D3,E3,SL8,D3,SL4,E3,F3,SLL,17,G3,SL4,C2,G2,A2
  .db RET

Slow_Theme_B_square1_5:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,C3,SL4,B2,A2,SL8,G2,SL4,G2,E2
  .db SL0,F2,SL4,E3,E3,C3,A2
  .db RET

Slow_Theme_B_square1_6:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,C3,SL4,B2,A2,SL8,G2,SL4,G2,E2
  .db SL0,G2,F2
  .db RET

Slow_Theme_B_square1_7:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,C3,SL4,C3,C3,SL8,C3,SL4,C3,E3
  .db SL0,A3,SL4,G3,E3,C3,A2
  .db RET

Slow_Theme_B_square1_8:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,C3,SL4,B2,A2,SL8,G2,SL4,G2,E2
  .db SLL,19,F2,SL4,A3,G3,SL5,E3
  .db RET

Slow_Theme_B_square2_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,52,A0,STV,2,STP,0,SDU,0
  .db SL4,G2,B2,C3
  .db RET

Slow_Theme_B_square2_1:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,E3,SL4,D3,C3,SL8,D3,SL4,C3,B2
  .db SL0,A2,SL4,A3,G3,E3,C3
  .db RET

Slow_Theme_B_square2_2:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,E3,SL4,D3,C3,SL8,D3,SL4,C3,B2
  .db SL0,A2,SL8,A3,SL4,C3,D3
  .db RET

Slow_Theme_B_square2_4:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,D3,SL4,D3,E3,SL8,D3,SL4,E3,F3
  .db SLL,20,G3,SL4,G2,B2,C3
  .db RET

Slow_Theme_B_square2_6:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,E3,SL4,D3,C3,SL8,D3,SL4,C3,B2
  .db SL0,C3,A2
  .db RET

Slow_Theme_B_square2_7:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,E3,SL4,F3,G3,SL8,A3,SL4,A3,B3
  .db SL0,C4,SL4,A3,G3,E3,C3
  .db RET

Slow_Theme_B_square2_8:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,E3,SL4,D3,C3,SL8,D3,SL4,C3,B2
  .db SL0,A2,SL4,A3,G3,E3,C3
  .db RET

Slow_Theme_B_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,E2,STV,11,A0,STV,6,B2,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,B2,STV,11,A0,STV,6,E2,STV,11
  .db A0,STV,6,B2,STV,11,A0,STV,6,E2,STV,11,A0,STV,6,B2,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,B2,STV,11,A0,STV,6,E2,STV,11
  .db A0,STV,6,B2,STV,11,A0,STV,6,E2,STV,11,A0,STV,6,B2,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,B2,STV,11,A0
  .db RET

Slow_Theme_B_triangle_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,E2,STV,11,A0,STV,6,A2,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,C3,STV,11,A0,STV,6,E2,STV,11
  .db A0,STV,6,A2,STV,11,A0,STV,6,E2,STV,11,A0,STV,6,B2,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,A2,STV,11,A0,STV,6,E2,STV,11
  .db A0,STV,2,STP,0,SDU,0,A2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0
  .db SDU,0,E2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,A2,STV,11
  .db STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,G2,STV,11,STP,10,SDU,7
  .db A0,STV,2,STP,0,SDU,0,F2,STV,11,STP,10,SDU,7,A0
  .db RET

Slow_Theme_B_triangle_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,D2,STV,11,A0,STV,6,G2,STV,11
  .db A0,STV,6,D2,STV,11,A0,STV,6,B2,STV,11,A0,STV,6,D2,STV,11
  .db A0,STV,6,G2,STV,11,A0,STV,6,D2,STV,11,A0,STV,6,A2,STV,11
  .db A0,STV,6,D2,STV,11,A0,STV,6,G2,STV,11,A0,STV,6,D2,STV,11
  .db A0,STV,2,STP,0,SDU,0,G2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0
  .db SDU,0,D2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,G2,STV,11
  .db STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,F2,STV,11,STP,10,SDU,7
  .db A0,STV,2,STP,0,SDU,0,D2,STV,11,STP,10,SDU,7,A0
  .db RET

Slow_Theme_B_triangle_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,E2,STV,11,A0,STV,6,A2,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,C3,STV,11,A0,STV,6,E2,STV,11
  .db A0,STV,6,A2,STV,11,A0,STV,6,E2,STV,11,A0,STV,6,B2,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,A2,STV,11,A0,STV,6,E2,STV,11
  .db A0,STV,2,STP,0,SDU,0,A2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0
  .db SDU,0,E2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,A2,STV,11
  .db STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,G2,STV,11,STP,10,SDU,7
  .db A0,STV,2,STP,0,SDU,0,F2,STV,11,STP,10,SDU,7,A0
  .db RET

Slow_Theme_B_noise_0:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3
  .db RET

Slow_Theme_B_noise_8:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3
  .db RET

Slow_Theme_B_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,C3,C3,C3,C3,C3,C3,C3
  .db RET

Slow_Theme_B_dpcm_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,C3,C3,C3,C3,C3,C3,C3
  .db RET

Fast_Theme_B:
  .db 0
  .db 3
  .db 128
  .db 2
  .dw Fast_Theme_B_square1
  .dw Fast_Theme_B_square2
  .dw Fast_Theme_B_triangle
  .dw Fast_Theme_B_noise
  .dw Fast_Theme_B_dpcm

Fast_Theme_B_square1:
  .db CAL,<(Fast_Theme_B_square1_0),>(Fast_Theme_B_square1_0)
Fast_Theme_B_square1_loop:
  .db CAL,<(Fast_Theme_B_square1_1),>(Fast_Theme_B_square1_1)
  .db CAL,<(Fast_Theme_B_square1_2),>(Fast_Theme_B_square1_2)
  .db CAL,<(Fast_Theme_B_square1_3),>(Fast_Theme_B_square1_3)
  .db CAL,<(Fast_Theme_B_square1_4),>(Fast_Theme_B_square1_4)
  .db CAL,<(Fast_Theme_B_square1_5),>(Fast_Theme_B_square1_5)
  .db CAL,<(Fast_Theme_B_square1_6),>(Fast_Theme_B_square1_6)
  .db CAL,<(Fast_Theme_B_square1_7),>(Fast_Theme_B_square1_7)
  .db CAL,<(Fast_Theme_B_square1_8),>(Fast_Theme_B_square1_8)
  .db CAL,<(Fast_Theme_B_square1_9),>(Fast_Theme_B_square1_9)
  .db CAL,<(Fast_Theme_B_square1_10),>(Fast_Theme_B_square1_10)
  .db CAL,<(Fast_Theme_B_square1_9),>(Fast_Theme_B_square1_9)
  .db CAL,<(Fast_Theme_B_square1_12),>(Fast_Theme_B_square1_12)
  .db CAL,<(Fast_Theme_B_square1_9),>(Fast_Theme_B_square1_9)
  .db CAL,<(Fast_Theme_B_square1_10),>(Fast_Theme_B_square1_10)
  .db CAL,<(Fast_Theme_B_square1_9),>(Fast_Theme_B_square1_9)
  .db CAL,<(Fast_Theme_B_square1_13),>(Fast_Theme_B_square1_13)
  .db GOT
  .dw Fast_Theme_B_square1_loop

Fast_Theme_B_square2:
  .db CAL,<(Fast_Theme_B_square2_0),>(Fast_Theme_B_square2_0)
Fast_Theme_B_square2_loop:
  .db CAL,<(Fast_Theme_B_square2_1),>(Fast_Theme_B_square2_1)
  .db CAL,<(Fast_Theme_B_square2_2),>(Fast_Theme_B_square2_2)
  .db CAL,<(Fast_Theme_B_square2_3),>(Fast_Theme_B_square2_3)
  .db CAL,<(Fast_Theme_B_square2_4),>(Fast_Theme_B_square2_4)
  .db CAL,<(Fast_Theme_B_square2_1),>(Fast_Theme_B_square2_1)
  .db CAL,<(Fast_Theme_B_square2_6),>(Fast_Theme_B_square2_6)
  .db CAL,<(Fast_Theme_B_square2_7),>(Fast_Theme_B_square2_7)
  .db CAL,<(Fast_Theme_B_square2_8),>(Fast_Theme_B_square2_8)
  .db CAL,<(Fast_Theme_B_square2_9),>(Fast_Theme_B_square2_9)
  .db CAL,<(Fast_Theme_B_square2_10),>(Fast_Theme_B_square2_10)
  .db CAL,<(Fast_Theme_B_square2_11),>(Fast_Theme_B_square2_11)
  .db CAL,<(Fast_Theme_B_square2_12),>(Fast_Theme_B_square2_12)
  .db CAL,<(Fast_Theme_B_square2_9),>(Fast_Theme_B_square2_9)
  .db CAL,<(Fast_Theme_B_square2_10),>(Fast_Theme_B_square2_10)
  .db CAL,<(Fast_Theme_B_square2_11),>(Fast_Theme_B_square2_11)
  .db CAL,<(Fast_Theme_B_square2_13),>(Fast_Theme_B_square2_13)
  .db GOT
  .dw Fast_Theme_B_square2_loop

Fast_Theme_B_triangle:
  .db CAL,<(Fast_Theme_B_triangle_0),>(Fast_Theme_B_triangle_0)
Fast_Theme_B_triangle_loop:
  .db CAL,<(Fast_Theme_B_triangle_1),>(Fast_Theme_B_triangle_1)
  .db CAL,<(Fast_Theme_B_triangle_1),>(Fast_Theme_B_triangle_1)
  .db CAL,<(Fast_Theme_B_triangle_1),>(Fast_Theme_B_triangle_1)
  .db CAL,<(Fast_Theme_B_triangle_4),>(Fast_Theme_B_triangle_4)
  .db CAL,<(Fast_Theme_B_triangle_1),>(Fast_Theme_B_triangle_1)
  .db CAL,<(Fast_Theme_B_triangle_1),>(Fast_Theme_B_triangle_1)
  .db CAL,<(Fast_Theme_B_triangle_1),>(Fast_Theme_B_triangle_1)
  .db CAL,<(Fast_Theme_B_triangle_1),>(Fast_Theme_B_triangle_1)
  .db CAL,<(Fast_Theme_B_triangle_9),>(Fast_Theme_B_triangle_9)
  .db CAL,<(Fast_Theme_B_triangle_10),>(Fast_Theme_B_triangle_10)
  .db CAL,<(Fast_Theme_B_triangle_9),>(Fast_Theme_B_triangle_9)
  .db CAL,<(Fast_Theme_B_triangle_10),>(Fast_Theme_B_triangle_10)
  .db CAL,<(Fast_Theme_B_triangle_9),>(Fast_Theme_B_triangle_9)
  .db CAL,<(Fast_Theme_B_triangle_10),>(Fast_Theme_B_triangle_10)
  .db CAL,<(Fast_Theme_B_triangle_9),>(Fast_Theme_B_triangle_9)
  .db CAL,<(Fast_Theme_B_triangle_13),>(Fast_Theme_B_triangle_13)
  .db GOT
  .dw Fast_Theme_B_triangle_loop

Fast_Theme_B_noise:
  .db CAL,<(Fast_Theme_B_noise_0),>(Fast_Theme_B_noise_0)
Fast_Theme_B_noise_loop:
  .db CAL,<(Fast_Theme_B_noise_1),>(Fast_Theme_B_noise_1)
  .db CAL,<(Fast_Theme_B_noise_2),>(Fast_Theme_B_noise_2)
  .db CAL,<(Fast_Theme_B_noise_1),>(Fast_Theme_B_noise_1)
  .db CAL,<(Fast_Theme_B_noise_2),>(Fast_Theme_B_noise_2)
  .db CAL,<(Fast_Theme_B_noise_1),>(Fast_Theme_B_noise_1)
  .db CAL,<(Fast_Theme_B_noise_2),>(Fast_Theme_B_noise_2)
  .db CAL,<(Fast_Theme_B_noise_1),>(Fast_Theme_B_noise_1)
  .db CAL,<(Fast_Theme_B_noise_8),>(Fast_Theme_B_noise_8)
  .db CAL,<(Fast_Theme_B_noise_9),>(Fast_Theme_B_noise_9)
  .db CAL,<(Fast_Theme_B_noise_9),>(Fast_Theme_B_noise_9)
  .db CAL,<(Fast_Theme_B_noise_9),>(Fast_Theme_B_noise_9)
  .db CAL,<(Fast_Theme_B_noise_9),>(Fast_Theme_B_noise_9)
  .db CAL,<(Fast_Theme_B_noise_9),>(Fast_Theme_B_noise_9)
  .db CAL,<(Fast_Theme_B_noise_9),>(Fast_Theme_B_noise_9)
  .db CAL,<(Fast_Theme_B_noise_9),>(Fast_Theme_B_noise_9)
  .db CAL,<(Fast_Theme_B_noise_13),>(Fast_Theme_B_noise_13)
  .db GOT
  .dw Fast_Theme_B_noise_loop

Fast_Theme_B_dpcm:
  .db CAL,<(Fast_Theme_B_dpcm_0),>(Fast_Theme_B_dpcm_0)
Fast_Theme_B_dpcm_loop:
  .db CAL,<(Fast_Theme_B_dpcm_1),>(Fast_Theme_B_dpcm_1)
  .db CAL,<(Fast_Theme_B_dpcm_2),>(Fast_Theme_B_dpcm_2)
  .db CAL,<(Fast_Theme_B_dpcm_1),>(Fast_Theme_B_dpcm_1)
  .db CAL,<(Fast_Theme_B_dpcm_2),>(Fast_Theme_B_dpcm_2)
  .db CAL,<(Fast_Theme_B_dpcm_1),>(Fast_Theme_B_dpcm_1)
  .db CAL,<(Fast_Theme_B_dpcm_2),>(Fast_Theme_B_dpcm_2)
  .db CAL,<(Fast_Theme_B_dpcm_1),>(Fast_Theme_B_dpcm_1)
  .db CAL,<(Fast_Theme_B_dpcm_8),>(Fast_Theme_B_dpcm_8)
  .db CAL,<(Fast_Theme_B_dpcm_9),>(Fast_Theme_B_dpcm_9)
  .db CAL,<(Fast_Theme_B_dpcm_9),>(Fast_Theme_B_dpcm_9)
  .db CAL,<(Fast_Theme_B_dpcm_9),>(Fast_Theme_B_dpcm_9)
  .db CAL,<(Fast_Theme_B_dpcm_9),>(Fast_Theme_B_dpcm_9)
  .db CAL,<(Fast_Theme_B_dpcm_9),>(Fast_Theme_B_dpcm_9)
  .db CAL,<(Fast_Theme_B_dpcm_9),>(Fast_Theme_B_dpcm_9)
  .db CAL,<(Fast_Theme_B_dpcm_9),>(Fast_Theme_B_dpcm_9)
  .db CAL,<(Fast_Theme_B_dpcm_13),>(Fast_Theme_B_dpcm_13)
  .db GOT
  .dw Fast_Theme_B_dpcm_loop

Fast_Theme_B_square1_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,55,A0,STV,2,STP,1,SDU,4
  .db SL4,GS2,C3,SL1,CS3
  .db RET

Fast_Theme_B_square1_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SL3,A0,STV,2,STP,1,SDU,4,SL8,F3
  .db SL4,DS3,CS3,SL8,DS3,SL4,CS3,C3,SL0,AS2,SL4,AS3,GS3,F3,SL1
  .db CS3
  .db RET

Fast_Theme_B_square1_2:
  .db STV,11,SAR,3,STP,10,SDU,7,SL3,A0,STV,2,STP,1,SDU,4,SL8,F3
  .db SL4,DS3,CS3,SL8,DS3,SL4,CS3,C3,SL0,AS2,SL8,AS3,SL4,CS3,SL1
  .db DS3
  .db RET

Fast_Theme_B_square1_3:
  .db STV,11,SAR,3,STP,10,SDU,7,SL3,A0,STV,2,STP,1,SDU,4,SL8,F3
  .db SL4,AS3,C4,SL8,CS4,SL4,CS3,C3,SL8,AS2,SL4,C3,DS3,AS3,GS3
  .db F3,SL1,CS3
  .db RET

Fast_Theme_B_square1_4:
  .db STV,11,SAR,3,STP,10,SDU,7,SL3,A0,STV,2,STP,1,SDU,4,SL8,DS3
  .db SL4,DS3,F3,SL8,DS3,SL4,F3,FS3,SLL,17,GS3,SL4,C2,G2,A2
  .db RET

Fast_Theme_B_square1_5:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,CS3,SL4,C3,AS2,SL8,GS2,SL4,GS2
  .db F2,SL0,FS2,SL4,F3,F3,CS3,AS2
  .db RET

Fast_Theme_B_square1_6:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,CS3,SL4,C3,AS2,SL8,GS2,SL4,GS2
  .db F2,SL0,GS2,FS2
  .db RET

Fast_Theme_B_square1_7:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,CS3,SL4,CS3,CS3,SL8,CS3,SL4
  .db CS3,F3,SL0,AS3,SL4,GS3,F3,CS3,AS2
  .db RET

Fast_Theme_B_square1_8:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,CS3,SL4,C3,AS2,SL8,GS2,SL4,GS2
  .db F2,SLL,19,FS2,SL4,AS3,GS3,F3,SL1,CS3
  .db RET

Fast_Theme_B_square1_9:
  .db STV,2,SAR,3,STP,0,SDU,0,SL2,F4,GS4,C5,DS5,F4,GS4,C5,DS5
  .db F4,GS4,C5,DS5,F4,GS4,C5,DS5,DS4,FS4,AS4,CS5,DS4,FS4,AS4
  .db CS5,DS4,FS4,AS4,CS5,DS4,FS4,AS4,CS5
  .db RET

Fast_Theme_B_square1_10:
  .db STV,2,SAR,3,STP,1,SDU,4,SL6,AS2,AS2,SL4,C3,AS2,GS2,FS2,GS2
  .db SL6,AS2,GS2,SL8,FS2,SL4,GS2,A2,AS2
  .db RET

Fast_Theme_B_square1_12:
  .db STV,2,SAR,3,STP,1,SDU,4,SL6,F3,F3,SL4,FS3,SL6,F3,DS3,SL4
  .db CS3,SL6,DS3,CS3,SL4,C3,SL6,CS3,DS3,SL4,CS3
  .db RET

Fast_Theme_B_square1_13:
  .db STV,2,SAR,3,STP,1,SDU,4,SL6,F3,F3,SL4,FS3,SL6,F3,DS3,SL4
  .db CS3,SL6,DS3,CS3,SL4,C3,SL7,CS3,SL4,GS2,SL5,C3
  .db RET

Fast_Theme_B_square2_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,52,A0,STV,2,STP,0,SDU,0
  .db SL4,GS2,C3,CS3
  .db RET

Fast_Theme_B_square2_1:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,F3,SL4,DS3,CS3,SL8,DS3,SL4,CS3
  .db C3,SL0,AS2,SL4,AS3,GS3,F3,CS3
  .db RET

Fast_Theme_B_square2_2:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,F3,SL4,DS3,CS3,SL8,DS3,SL4,CS3
  .db C3,SL0,AS2,SL8,AS3,SL4,CS3,DS3
  .db RET

Fast_Theme_B_square2_3:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,F3,SL4,AS3,C4,SL8,CS4,SL4,CS3
  .db C3,SL8,AS2,SL4,C3,DS3,AS3,GS3,F3,CS3
  .db RET

Fast_Theme_B_square2_4:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,DS3,SL4,DS3,F3,SL8,DS3,SL4,F3
  .db FS3,SLL,20,GS3,SL4,GS2,C3,CS3
  .db RET

Fast_Theme_B_square2_6:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,F3,SL4,DS3,CS3,SL8,DS3,SL4,CS3
  .db C3,SL0,CS3,AS2
  .db RET

Fast_Theme_B_square2_7:
  .db STV,2,SAR,3,STP,0,SDU,0,SL8,F3,SL4,FS3,GS3,SL8,AS3,SL4,AS3
  .db C4,SL0,CS4,SL4,AS3,GS3,F3,CS3
  .db RET

Fast_Theme_B_square2_8:
  .db STV,2,SAR,3,STP,1,SDU,4,SL8,F3,STP,0,SDU,0,SL4,DS3,CS3,SL8
  .db DS3,SL4,CS3,C3,SL0,AS2,SL4,AS3,GS3,F3,CS3
  .db RET

Fast_Theme_B_square2_9:
  .db STV,2,SAR,3,STP,1,SDU,4,SL6,GS3,GS3,SL8,F3,SL4,C4,CS4,C4
  .db SL6,DS3,DS3,SL8,CS3,SL4,AS3,C4,AS3
  .db RET

Fast_Theme_B_square2_10:
  .db STV,2,SAR,3,STP,0,SDU,0,SL6,DS3,DS3,SL4,F3,DS3,C3,CS3,C3
  .db SL6,CS3,CS3,SL8,CS3,SL4,C3,CS3,DS3
  .db RET

Fast_Theme_B_square2_11:
  .db STV,2,SAR,3,STP,1,SDU,4,SL6,GS3,GS3,SL8,F3,SL4,CS4,C4,CS4
  .db SL6,DS3,DS3,SL8,CS3,SL4,C4,AS3,C4
  .db RET

Fast_Theme_B_square2_12:
  .db STV,2,SAR,3,STP,0,SDU,0,SL6,GS3,GS3,SL4,AS3,SL6,C4,C4,SL4
  .db AS3,SL6,FS3,FS3,SL4,F3,SL6,FS3,FS3,SL4,FS3
  .db RET

Fast_Theme_B_square2_13:
  .db STV,2,SAR,3,STP,0,SDU,0,SL6,GS3,GS3,SL4,AS3,SL6,C4,C4,SL4
  .db AS3,SL6,FS3,FS3,SL4,F3,FS3,GS2,C3,CS3
  .db RET

Fast_Theme_B_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,F2,STV,11,A0,STV,6,C3,STV,11
  .db A0,STV,6,F2,STV,11,A0,STV,6,C3,STV,11,A0,STV,6,F2,STV,11
  .db A0,STV,6,C3,STV,11,A0,STV,6,F2,STV,11,A0,STV,6,C3,STV,11
  .db A0,STV,6,F2,STV,11,A0,STV,6,C3,STV,11,A0,STV,6,F2,STV,11
  .db A0,STV,6,C3,STV,11,A0,STV,6,F2,STV,11,A0,STV,6,C3,STV,11
  .db A0,STV,6,F2,STV,11,A0,STV,6,C3,STV,11,A0
  .db RET

Fast_Theme_B_triangle_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,F2,STV,11,A0,STV,6,AS2,STV,11
  .db A0,STV,6,F2,STV,11,A0,STV,6,CS3,STV,11,A0,STV,6,F2,STV,11
  .db A0,STV,6,AS2,STV,11,A0,STV,6,F2,STV,11,A0,STV,6,C3,STV,11
  .db A0,STV,6,F2,STV,11,A0,STV,6,AS2,STV,11,A0,STV,6,F2,STV,11
  .db A0,STV,2,STP,0,SDU,0,AS2,STV,11,STP,10,SDU,7,A0,STV,2
  .db STP,0,SDU,0,F2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0,SDU,0
  .db AS2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,GS2,STV,11
  .db STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,FS2,STV,11,STP,10,SDU,7
  .db A0
  .db RET

Fast_Theme_B_triangle_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,DS2,STV,11,A0,STV,6,GS2,STV,11
  .db A0,STV,6,DS2,STV,11,A0,STV,6,C3,STV,11,A0,STV,6,DS2,STV,11
  .db A0,STV,6,GS2,STV,11,A0,STV,6,DS2,STV,11,A0,STV,6,AS2,STV,11
  .db A0,STV,6,DS2,STV,11,A0,STV,6,GS2,STV,11,A0,STV,6,DS2,STV,11
  .db A0,STV,2,STP,0,SDU,0,GS2,STV,11,STP,10,SDU,7,A0,STV,2
  .db STP,0,SDU,0,DS2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0,SDU,0
  .db GS2,STV,11,STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,FS2,STV,11
  .db STP,10,SDU,7,A0,STV,2,STP,0,SDU,0,DS2,STV,11,STP,10,SDU,7
  .db A0
  .db RET

Fast_Theme_B_triangle_9:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,GS2,STV,11,A0,STV,6,GS3,STV,11
  .db A0,STV,6,GS2,STV,11,A0,STV,6,GS3,STV,11,A0,STV,6,GS2,STV,11
  .db A0,STV,6,GS3,STV,11,A0,STV,6,GS2,STV,11,A0,STV,6,GS3,STV,11
  .db A0,STV,6,AS2,STV,11,A0,STV,6,AS3,STV,11,A0,STV,6,AS2,STV,11
  .db A0,STV,6,AS3,STV,11,A0,STV,6,AS2,STV,11,A0,STV,6,AS3,STV,11
  .db A0,STV,6,AS2,STV,11,A0,STV,6,AS3,STV,11,A0
  .db RET

Fast_Theme_B_triangle_10:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,FS2,STV,11,A0,STV,6,FS3,STV,11
  .db A0,STV,6,F2,STV,11,A0,STV,6,F3,STV,11,A0,STV,6,FS2,STV,11
  .db A0,STV,6,FS3,STV,11,A0,STV,6,F2,STV,11,A0,STV,6,F3,STV,11
  .db A0,STV,6,AS2,STV,11,A0,STV,6,AS3,STV,11,A0,STV,6,FS2,STV,11
  .db A0,STV,6,FS3,STV,11,A0,STV,6,DS2,STV,11,A0,STV,6,DS3,STV,11
  .db A0,STV,6,CS2,STV,11,A0,STV,6,CS3,STV,11,A0
  .db RET

Fast_Theme_B_triangle_13:
  .db STV,6,SAR,3,STP,10,SDU,7,SL2,F2,STV,11,A0,STV,6,F3,STV,11
  .db A0,STV,6,E2,STV,11,A0,STV,6,E3,STV,11,A0,STV,6,F2,STV,11
  .db A0,STV,6,F3,STV,11,A0,STV,6,E2,STV,11,A0,STV,6,E3,STV,11
  .db A0,STV,6,A2,STV,11,A0,STV,6,A3,STV,11,A0,STV,6,F2,STV,11
  .db A0,STV,6,F3,STV,11,A0,STV,6,D2,STV,11,A0,STV,6,D3,STV,11
  .db A0,STV,6,C2,STV,11,A0,STV,6,C3,STV,11,A0
  .db RET

Fast_Theme_B_noise_0:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3
  .db RET

Fast_Theme_B_noise_1:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,9
  .db RET

Fast_Theme_B_noise_2:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3
  .db RET

Fast_Theme_B_noise_8:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,4,SAR,3,3,STV,0,SAR,0,14,STV,4,SAR,3,3,STV,3,SAR,1
  .db SL2,9,9,SL4,9
  .db RET

Fast_Theme_B_noise_9:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,STV,1,SAR,3,SL2,3,STV,3,SAR,1,9,STV,0,SAR,0,SL4,14,STV,1
  .db SAR,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1
  .db SAR,3,3,STV,3,SAR,1,9,STV,1,SAR,3,SL2,3,STV,3,SAR,1,9
  .db RET

Fast_Theme_B_noise_13:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3
  .db RET

Fast_Theme_B_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,C3,C3,C3,C3,C3,C3,C3
  .db RET

Fast_Theme_B_dpcm_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,CS3,C3,CS3,C3,CS3,C3,SL4
  .db CS3,D3
  .db RET

Fast_Theme_B_dpcm_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,CS3,C3,CS3,C3,CS3,C3,CS3
  .db RET

Fast_Theme_B_dpcm_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,CS3,C3,CS3,C3,CS3,C3,SL2
  .db CS3,D3,SL4,D3
  .db RET

Fast_Theme_B_dpcm_9:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,CS3,C3,SL6,CS3,SL2,D3,SL8
  .db C3,CS3,C3,SL6,CS3,SL2,D3
  .db RET

Fast_Theme_B_dpcm_13:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,C3,C3,C3,C3,C3,C3,C3
  .db RET

Slow_Theme_C:
  .db 0
  .db 4
  .db 85
  .db 3
  .dw Slow_Theme_C_square1
  .dw Slow_Theme_C_square2
  .dw Slow_Theme_C_triangle
  .dw Slow_Theme_C_noise
  .dw Slow_Theme_C_dpcm

Slow_Theme_C_square1:
Slow_Theme_C_square1_loop:
  .db CAL,<(Slow_Theme_C_square1_0),>(Slow_Theme_C_square1_0)
  .db CAL,<(Slow_Theme_C_square1_0),>(Slow_Theme_C_square1_0)
  .db CAL,<(Slow_Theme_C_square1_0),>(Slow_Theme_C_square1_0)
  .db CAL,<(Slow_Theme_C_square1_0),>(Slow_Theme_C_square1_0)
  .db CAL,<(Slow_Theme_C_square1_2),>(Slow_Theme_C_square1_2)
  .db CAL,<(Slow_Theme_C_square1_3),>(Slow_Theme_C_square1_3)
  .db CAL,<(Slow_Theme_C_square1_5),>(Slow_Theme_C_square1_5)
  .db CAL,<(Slow_Theme_C_square1_4),>(Slow_Theme_C_square1_4)
  .db CAL,<(Slow_Theme_C_square1_6),>(Slow_Theme_C_square1_6)
  .db CAL,<(Slow_Theme_C_square1_7),>(Slow_Theme_C_square1_7)
  .db CAL,<(Slow_Theme_C_square1_6),>(Slow_Theme_C_square1_6)
  .db CAL,<(Slow_Theme_C_square1_8),>(Slow_Theme_C_square1_8)
  .db GOT
  .dw Slow_Theme_C_square1_loop

Slow_Theme_C_square2:
Slow_Theme_C_square2_loop:
  .db CAL,<(Slow_Theme_C_square2_0),>(Slow_Theme_C_square2_0)
  .db CAL,<(Slow_Theme_C_square2_0),>(Slow_Theme_C_square2_0)
  .db CAL,<(Slow_Theme_C_square2_0),>(Slow_Theme_C_square2_0)
  .db CAL,<(Slow_Theme_C_square2_0),>(Slow_Theme_C_square2_0)
  .db CAL,<(Slow_Theme_C_square2_2),>(Slow_Theme_C_square2_2)
  .db CAL,<(Slow_Theme_C_square2_3),>(Slow_Theme_C_square2_3)
  .db CAL,<(Slow_Theme_C_square2_5),>(Slow_Theme_C_square2_5)
  .db CAL,<(Slow_Theme_C_square2_4),>(Slow_Theme_C_square2_4)
  .db CAL,<(Slow_Theme_C_square2_6),>(Slow_Theme_C_square2_6)
  .db CAL,<(Slow_Theme_C_square2_7),>(Slow_Theme_C_square2_7)
  .db CAL,<(Slow_Theme_C_square2_6),>(Slow_Theme_C_square2_6)
  .db CAL,<(Slow_Theme_C_square2_8),>(Slow_Theme_C_square2_8)
  .db GOT
  .dw Slow_Theme_C_square2_loop

Slow_Theme_C_triangle:
Slow_Theme_C_triangle_loop:
  .db CAL,<(Slow_Theme_C_triangle_0),>(Slow_Theme_C_triangle_0)
  .db CAL,<(Slow_Theme_C_triangle_0),>(Slow_Theme_C_triangle_0)
  .db CAL,<(Slow_Theme_C_triangle_1),>(Slow_Theme_C_triangle_1)
  .db CAL,<(Slow_Theme_C_triangle_1),>(Slow_Theme_C_triangle_1)
  .db CAL,<(Slow_Theme_C_triangle_2),>(Slow_Theme_C_triangle_2)
  .db CAL,<(Slow_Theme_C_triangle_3),>(Slow_Theme_C_triangle_3)
  .db CAL,<(Slow_Theme_C_triangle_4),>(Slow_Theme_C_triangle_4)
  .db CAL,<(Slow_Theme_C_triangle_4),>(Slow_Theme_C_triangle_4)
  .db CAL,<(Slow_Theme_C_triangle_6),>(Slow_Theme_C_triangle_6)
  .db CAL,<(Slow_Theme_C_triangle_6),>(Slow_Theme_C_triangle_6)
  .db CAL,<(Slow_Theme_C_triangle_6),>(Slow_Theme_C_triangle_6)
  .db CAL,<(Slow_Theme_C_triangle_8),>(Slow_Theme_C_triangle_8)
  .db GOT
  .dw Slow_Theme_C_triangle_loop

Slow_Theme_C_noise:
Slow_Theme_C_noise_loop:
  .db CAL,<(Slow_Theme_C_noise_0),>(Slow_Theme_C_noise_0)
  .db CAL,<(Slow_Theme_C_noise_0),>(Slow_Theme_C_noise_0)
  .db CAL,<(Slow_Theme_C_noise_0),>(Slow_Theme_C_noise_0)
  .db CAL,<(Slow_Theme_C_noise_0),>(Slow_Theme_C_noise_0)
  .db CAL,<(Slow_Theme_C_noise_2),>(Slow_Theme_C_noise_2)
  .db CAL,<(Slow_Theme_C_noise_3),>(Slow_Theme_C_noise_3)
  .db CAL,<(Slow_Theme_C_noise_2),>(Slow_Theme_C_noise_2)
  .db CAL,<(Slow_Theme_C_noise_4),>(Slow_Theme_C_noise_4)
  .db CAL,<(Slow_Theme_C_noise_2),>(Slow_Theme_C_noise_2)
  .db CAL,<(Slow_Theme_C_noise_7),>(Slow_Theme_C_noise_7)
  .db CAL,<(Slow_Theme_C_noise_2),>(Slow_Theme_C_noise_2)
  .db CAL,<(Slow_Theme_C_noise_8),>(Slow_Theme_C_noise_8)
  .db GOT
  .dw Slow_Theme_C_noise_loop

Slow_Theme_C_dpcm:
Slow_Theme_C_dpcm_loop:
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_3),>(Slow_Theme_C_dpcm_3)
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_4),>(Slow_Theme_C_dpcm_4)
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_7),>(Slow_Theme_C_dpcm_7)
  .db CAL,<(Slow_Theme_C_dpcm_0),>(Slow_Theme_C_dpcm_0)
  .db CAL,<(Slow_Theme_C_dpcm_8),>(Slow_Theme_C_dpcm_8)
  .db GOT
  .dw Slow_Theme_C_dpcm_loop

Slow_Theme_C_square1_0:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,D4,C4,AS3,SL4,D4,DS4,D4,C4,AS3
  .db SL2,C4,SLA,AS3,SL4,GS3,AS3
  .db RET

Slow_Theme_C_square1_2:
  .db STV,5,SAR,3,STP,0,SDU,1,SLL,24,F3,SL4,F3,G3,AS3,A3,G3,SL2
  .db F3,SL6,D3,SL4,G3,F3,D3
  .db RET

Slow_Theme_C_square1_3:
  .db STV,5,SAR,3,STP,0,SDU,1,SLC,D3,SL2,D3,C3,SL8,AS2,SL4,A2,AS2
  .db SLC,F3,SL2,DS3,D3,SL8,DS3,D3
  .db RET

Slow_Theme_C_square1_4:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,AS2,C3,SLC,AS2,SL2,A2,G2,SL8
  .db F2,SL4,AS2,C3
  .db RET

Slow_Theme_C_square1_5:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,AS2,C3,SLC,AS2,SL2,C3,D3,SL0
  .db F3
  .db RET

Slow_Theme_C_square1_6:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,F3,D4,SL4,C4,AS3,SL8,AS3,SL4
  .db AS3,G3,F3,SL2,G3,SLE,F3,SL2,DS3,E3
  .db RET

Slow_Theme_C_square1_7:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,F3,D4,SL4,C4,AS3,SL8,AS3,SL4
  .db AS3,G3,F3,SL2,G3,C4,SLC,AS3,SL2,A3,G3
  .db RET

Slow_Theme_C_square1_8:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,F3,D3,SL4,C3,AS2,SL8,AS2,SL4
  .db F3,D3,C3,SL2,C3,D3,SL0,AS2
  .db RET

Slow_Theme_C_square2_0:
  .db STV,5,SAR,3,STP,0,SDU,1,SLL,24,F4,SL4,F4,G4,F4,DS4,DS4,SL2
  .db D4,SLA,DS4,SL4,C4,D4
  .db RET

Slow_Theme_C_square2_2:
  .db STV,5,SAR,3,STP,0,SDU,1,SLL,24,F4,SL4,F4,G4,AS4,A4,G4,SL2
  .db F4,SL6,D4,SL4,G4,F4,D4
  .db RET

Slow_Theme_C_square2_3:
  .db STV,5,SAR,3,STP,0,SDU,1,SLC,D4,SL2,D4,C4,SL8,AS3,SL4,A3,AS3
  .db SLC,F4,SL2,DS4,D4,SL8,DS4,D4
  .db RET

Slow_Theme_C_square2_4:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,AS3,C4,SLC,AS3,SL2,A3,G3,SL8
  .db F3,SL4,AS3,C4
  .db RET

Slow_Theme_C_square2_5:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,AS3,C4,SLC,AS3,SL2,C4,D4,SL0
  .db F4
  .db RET

Slow_Theme_C_square2_6:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,F4,D5,SL4,C5,AS4,SL8,AS4,SL4
  .db AS4,G4,F4,SL2,G4,SLE,F4,SL2,DS4,E4
  .db RET

Slow_Theme_C_square2_7:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,F4,D5,SL4,C5,AS4,SL8,AS4,SL4
  .db AS4,G4,F4,SL2,G4,C5,SLC,AS4,SL2,A4,G4
  .db RET

Slow_Theme_C_square2_8:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,F4,D4,SL4,C4,AS3,SL8,AS3,SL4
  .db F4,D4,C4,SL2,C4,D4,SL0,AS3
  .db RET

Slow_Theme_C_triangle_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Slow_Theme_C_triangle_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,F3,STV,8,SL2,C3,C3,STV,6
  .db F3,DS3,D3,SL4,C3,STV,8,SL2,GS2,GS2,AS2,STV,6,SL4,AS2,C3,F3
  .db STV,8,SL2,C3,C3,STV,6,F3,DS3,D3,SL4,DS3,STV,8,SL2,GS2,GS2
  .db GS2,STV,6,SL4,DS3,D3
  .db RET

Slow_Theme_C_triangle_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,F3,STV,8,SL2,C3,C3,STV,6
  .db F3,DS3,D3,SL4,C3,STV,8,SL2,GS2,GS2,AS2,STV,6,SL4,AS2,C3,F3
  .db STV,8,SL2,C3,C3,STV,6,F3,DS3,D3,SL4,DS3,STV,8,SL2,GS2,GS2
  .db GS2,STV,6,SL4,F3,E3
  .db RET

Slow_Theme_C_triangle_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,D3,STV,8,SL2,A2,A2,STV,6
  .db D3,C3,A2,SL4,G2,STV,8,SL2,F2,F2,G2,STV,6,SL4,G2,AS2,D3,STV,8
  .db SL2,A2,A2,STV,6,D3,C3,AS2,SL4,C3,STV,8,SL2,F2,F2,F2,STV,6
  .db SL4,C3,D3
  .db RET

Slow_Theme_C_triangle_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,DS3,STV,8,SL2,AS2,AS2,STV,6
  .db SL4,F3,STV,8,SL2,C3,C3,STV,6,G3,FS3,F3,E3,SL4,DS3,STV,8
  .db SL2,F3,F3,STV,6,SL4,DS3,STV,8,SL2,AS2,AS2,STV,6,SL4,F3,STV,8
  .db SL2,C3,C3,STV,6,G3,GS3,A3,AS3,SL4,C4,SL2,B3,AS3
  .db RET

Slow_Theme_C_triangle_6:
  .db STV,8,SAR,3,STP,10,SDU,7,SL2,F3,F3,STV,6,SL4,F3,STV,8
  .db SL2,D3,D3,STV,6,SL4,D3,STV,8,SL2,C3,C3,STV,6,SL4,C3,STV,8
  .db SL2,AS2,AS2,AS2,AS2,STV,6,SL4,F3,G3,F3,SL2,G3,A3,SL7,AS3
  .db STV,8,SL1,AS3,SL2,AS3,SL4,AS3,SL2,AS3
  .db RET

Slow_Theme_C_triangle_8:
  .db STV,8,SAR,3,STP,10,SDU,7,SL2,F3,F3,STV,6,SL4,F3,STV,8
  .db SL2,D3,D3,STV,6,SL4,D3,STV,8,SL2,C3,C3,STV,6,SL4,C3,STV,8
  .db SL2,AS2,AS2,AS2,AS2,STV,6,SL4,F3,G3,F3,SL2,G3,F3,SL7,AS2
  .db STV,8,SL1,AS2,SL2,AS2,SL4,AS2,SL2,AS2
  .db RET

Slow_Theme_C_noise_0:
  .db STV,0,SAR,0,STP,10,SDU,7,SL8,14,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,14,SL8,14,STV,3,SAR,1,9,STV,0,SAR,0,14,STV,3,SAR,1
  .db SL4,9,STV,0,SAR,0,14,SL8,14,STV,3,SAR,1,9
  .db RET

Slow_Theme_C_noise_2:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0
  .db SAR,0,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db SL4,3,SL2,3,STV,3,SAR,1,9,STV,1,SAR,3,3,SL4,3
  .db RET

Slow_Theme_C_noise_3:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0
  .db SAR,0,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db SL4,3,SL2,3,STV,3,SAR,1,9,9,SL4,9
  .db RET

Slow_Theme_C_noise_4:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,9,STV,1,SAR,3,3,3,STV,0
  .db SAR,0,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db SL4,3,SL2,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,9
  .db RET

Slow_Theme_C_noise_7:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,SL4,9,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1,SAR,3,SL4
  .db 3,SL2,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,9
  .db RET

Slow_Theme_C_noise_8:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,SL4,9,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,9,9,9,STV,1
  .db SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,9
  .db RET

Slow_Theme_C_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,C3
  .db SL4,CS3,C3,SL8,C3,CS3
  .db RET

Slow_Theme_C_dpcm_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,CS3
  .db SL2,CS3,D3,SL4,CS3,C3,D3,CS3,SL2,D3,D3
  .db RET

Slow_Theme_C_dpcm_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,C3
  .db SL4,CS3,C3,SL8,C3,SL2,CS3,D3,SL4,D3
  .db RET

Slow_Theme_C_dpcm_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,SL2,CS3
  .db SL6,D3,SL8,C3,SL4,CS3,C3,SL8,C3,SL4,CS3,SL2,D3,D3
  .db RET

Slow_Theme_C_dpcm_7:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,CS3
  .db SL4,CS3,C3,SL8,CS3,SL4,CS3,SL2,D3,D3
  .db RET

Fast_Theme_C:
  .db 0
  .db 3
  .db 128
  .db 2
  .dw Fast_Theme_C_square1
  .dw Fast_Theme_C_square2
  .dw Fast_Theme_C_triangle
  .dw Fast_Theme_C_noise
  .dw Fast_Theme_C_dpcm

Fast_Theme_C_square1:
Fast_Theme_C_square1_loop:
  .db CAL,<(Fast_Theme_C_square1_0),>(Fast_Theme_C_square1_0)
  .db CAL,<(Fast_Theme_C_square1_0),>(Fast_Theme_C_square1_0)
  .db CAL,<(Fast_Theme_C_square1_0),>(Fast_Theme_C_square1_0)
  .db CAL,<(Fast_Theme_C_square1_0),>(Fast_Theme_C_square1_0)
  .db CAL,<(Fast_Theme_C_square1_2),>(Fast_Theme_C_square1_2)
  .db CAL,<(Fast_Theme_C_square1_3),>(Fast_Theme_C_square1_3)
  .db CAL,<(Fast_Theme_C_square1_5),>(Fast_Theme_C_square1_5)
  .db CAL,<(Fast_Theme_C_square1_4),>(Fast_Theme_C_square1_4)
  .db CAL,<(Fast_Theme_C_square1_6),>(Fast_Theme_C_square1_6)
  .db CAL,<(Fast_Theme_C_square1_7),>(Fast_Theme_C_square1_7)
  .db CAL,<(Fast_Theme_C_square1_6),>(Fast_Theme_C_square1_6)
  .db CAL,<(Fast_Theme_C_square1_8),>(Fast_Theme_C_square1_8)
  .db CAL,<(Fast_Theme_C_square1_9),>(Fast_Theme_C_square1_9)
  .db CAL,<(Fast_Theme_C_square1_11),>(Fast_Theme_C_square1_11)
  .db CAL,<(Fast_Theme_C_square1_9),>(Fast_Theme_C_square1_9)
  .db CAL,<(Fast_Theme_C_square1_10),>(Fast_Theme_C_square1_10)
  .db GOT
  .dw Fast_Theme_C_square1_loop

Fast_Theme_C_square2:
Fast_Theme_C_square2_loop:
  .db CAL,<(Fast_Theme_C_square2_0),>(Fast_Theme_C_square2_0)
  .db CAL,<(Fast_Theme_C_square2_0),>(Fast_Theme_C_square2_0)
  .db CAL,<(Fast_Theme_C_square2_0),>(Fast_Theme_C_square2_0)
  .db CAL,<(Fast_Theme_C_square2_0),>(Fast_Theme_C_square2_0)
  .db CAL,<(Fast_Theme_C_square2_2),>(Fast_Theme_C_square2_2)
  .db CAL,<(Fast_Theme_C_square2_3),>(Fast_Theme_C_square2_3)
  .db CAL,<(Fast_Theme_C_square2_5),>(Fast_Theme_C_square2_5)
  .db CAL,<(Fast_Theme_C_square2_4),>(Fast_Theme_C_square2_4)
  .db CAL,<(Fast_Theme_C_square2_6),>(Fast_Theme_C_square2_6)
  .db CAL,<(Fast_Theme_C_square2_7),>(Fast_Theme_C_square2_7)
  .db CAL,<(Fast_Theme_C_square2_6),>(Fast_Theme_C_square2_6)
  .db CAL,<(Fast_Theme_C_square2_8),>(Fast_Theme_C_square2_8)
  .db CAL,<(Fast_Theme_C_square2_9),>(Fast_Theme_C_square2_9)
  .db CAL,<(Fast_Theme_C_square2_7),>(Fast_Theme_C_square2_7)
  .db CAL,<(Fast_Theme_C_square2_9),>(Fast_Theme_C_square2_9)
  .db CAL,<(Fast_Theme_C_square2_8),>(Fast_Theme_C_square2_8)
  .db GOT
  .dw Fast_Theme_C_square2_loop

Fast_Theme_C_triangle:
Fast_Theme_C_triangle_loop:
  .db CAL,<(Fast_Theme_C_triangle_0),>(Fast_Theme_C_triangle_0)
  .db CAL,<(Fast_Theme_C_triangle_0),>(Fast_Theme_C_triangle_0)
  .db CAL,<(Fast_Theme_C_triangle_1),>(Fast_Theme_C_triangle_1)
  .db CAL,<(Fast_Theme_C_triangle_1),>(Fast_Theme_C_triangle_1)
  .db CAL,<(Fast_Theme_C_triangle_2),>(Fast_Theme_C_triangle_2)
  .db CAL,<(Fast_Theme_C_triangle_3),>(Fast_Theme_C_triangle_3)
  .db CAL,<(Fast_Theme_C_triangle_4),>(Fast_Theme_C_triangle_4)
  .db CAL,<(Fast_Theme_C_triangle_4),>(Fast_Theme_C_triangle_4)
  .db CAL,<(Fast_Theme_C_triangle_6),>(Fast_Theme_C_triangle_6)
  .db CAL,<(Fast_Theme_C_triangle_6),>(Fast_Theme_C_triangle_6)
  .db CAL,<(Fast_Theme_C_triangle_6),>(Fast_Theme_C_triangle_6)
  .db CAL,<(Fast_Theme_C_triangle_8),>(Fast_Theme_C_triangle_8)
  .db CAL,<(Fast_Theme_C_triangle_6),>(Fast_Theme_C_triangle_6)
  .db CAL,<(Fast_Theme_C_triangle_6),>(Fast_Theme_C_triangle_6)
  .db CAL,<(Fast_Theme_C_triangle_6),>(Fast_Theme_C_triangle_6)
  .db CAL,<(Fast_Theme_C_triangle_8),>(Fast_Theme_C_triangle_8)
  .db GOT
  .dw Fast_Theme_C_triangle_loop

Fast_Theme_C_noise:
Fast_Theme_C_noise_loop:
  .db CAL,<(Fast_Theme_C_noise_0),>(Fast_Theme_C_noise_0)
  .db CAL,<(Fast_Theme_C_noise_0),>(Fast_Theme_C_noise_0)
  .db CAL,<(Fast_Theme_C_noise_0),>(Fast_Theme_C_noise_0)
  .db CAL,<(Fast_Theme_C_noise_1),>(Fast_Theme_C_noise_1)
  .db CAL,<(Fast_Theme_C_noise_2),>(Fast_Theme_C_noise_2)
  .db CAL,<(Fast_Theme_C_noise_3),>(Fast_Theme_C_noise_3)
  .db CAL,<(Fast_Theme_C_noise_2),>(Fast_Theme_C_noise_2)
  .db CAL,<(Fast_Theme_C_noise_4),>(Fast_Theme_C_noise_4)
  .db CAL,<(Fast_Theme_C_noise_2),>(Fast_Theme_C_noise_2)
  .db CAL,<(Fast_Theme_C_noise_7),>(Fast_Theme_C_noise_7)
  .db CAL,<(Fast_Theme_C_noise_2),>(Fast_Theme_C_noise_2)
  .db CAL,<(Fast_Theme_C_noise_8),>(Fast_Theme_C_noise_8)
  .db CAL,<(Fast_Theme_C_noise_2),>(Fast_Theme_C_noise_2)
  .db CAL,<(Fast_Theme_C_noise_7),>(Fast_Theme_C_noise_7)
  .db CAL,<(Fast_Theme_C_noise_2),>(Fast_Theme_C_noise_2)
  .db CAL,<(Fast_Theme_C_noise_10),>(Fast_Theme_C_noise_10)
  .db GOT
  .dw Fast_Theme_C_noise_loop

Fast_Theme_C_dpcm:
Fast_Theme_C_dpcm_loop:
  .db CAL,<(Fast_Theme_C_dpcm_0),>(Fast_Theme_C_dpcm_0)
  .db CAL,<(Fast_Theme_C_dpcm_0),>(Fast_Theme_C_dpcm_0)
  .db CAL,<(Fast_Theme_C_dpcm_0),>(Fast_Theme_C_dpcm_0)
  .db CAL,<(Fast_Theme_C_dpcm_1),>(Fast_Theme_C_dpcm_1)
  .db CAL,<(Fast_Theme_C_dpcm_2),>(Fast_Theme_C_dpcm_2)
  .db CAL,<(Fast_Theme_C_dpcm_3),>(Fast_Theme_C_dpcm_3)
  .db CAL,<(Fast_Theme_C_dpcm_2),>(Fast_Theme_C_dpcm_2)
  .db CAL,<(Fast_Theme_C_dpcm_4),>(Fast_Theme_C_dpcm_4)
  .db CAL,<(Fast_Theme_C_dpcm_2),>(Fast_Theme_C_dpcm_2)
  .db CAL,<(Fast_Theme_C_dpcm_7),>(Fast_Theme_C_dpcm_7)
  .db CAL,<(Fast_Theme_C_dpcm_2),>(Fast_Theme_C_dpcm_2)
  .db CAL,<(Fast_Theme_C_dpcm_8),>(Fast_Theme_C_dpcm_8)
  .db CAL,<(Fast_Theme_C_dpcm_2),>(Fast_Theme_C_dpcm_2)
  .db CAL,<(Fast_Theme_C_dpcm_7),>(Fast_Theme_C_dpcm_7)
  .db CAL,<(Fast_Theme_C_dpcm_2),>(Fast_Theme_C_dpcm_2)
  .db CAL,<(Fast_Theme_C_dpcm_10),>(Fast_Theme_C_dpcm_10)
  .db GOT
  .dw Fast_Theme_C_dpcm_loop

Fast_Theme_C_square1_0:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,DS4,CS4,B3,SL4,DS4,E4,DS4,CS4
  .db B3,SL2,CS4,SLA,B3,SL4,A3,B3
  .db RET

Fast_Theme_C_square1_2:
  .db STV,5,SAR,3,STP,0,SDU,1,SLL,24,B3,SL4,B3,CS4,E4,DS4,CS4
  .db SL2,B3,SL6,GS3,SL4,CS4,B3,GS3
  .db RET

Fast_Theme_C_square1_3:
  .db STV,5,SAR,3,STP,0,SDU,1,SLC,GS3,SL2,GS3,FS3,SL8,E3,SL4,DS3
  .db E3,SLC,B3,SL2,A3,GS3,SL8,A3,GS3
  .db RET

Fast_Theme_C_square1_4:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,E3,FS3,SLC,E3,SL2,DS3,CS3,SL8
  .db B2,SL4,E3,FS3
  .db RET

Fast_Theme_C_square1_5:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,E3,FS3,SLC,E3,SL2,FS3,GS3,SL0
  .db B3
  .db RET

Fast_Theme_C_square1_6:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,B3,GS4,SL4,FS4,E4,SL8,E4,SL4
  .db E4,CS4,B3,SL2,CS4,SLE,B3,SL2,A3,AS3
  .db RET

Fast_Theme_C_square1_7:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,B3,GS4,SL4,FS4,E4,SL8,E4,SL4
  .db E4,CS4,B3,SL2,CS4,FS4,SLC,E4,SL2,DS4,CS4
  .db RET

Fast_Theme_C_square1_8:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,B3,GS3,SL4,FS3,E3,SL8,E3,SL4
  .db B3,GS3,FS3,SL2,FS3,GS3,SL0,E3
  .db RET

Fast_Theme_C_square1_9:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,CS4,AS4,SL4,FS4,GS4,SL8,AS4
  .db SL4,CS5,B4,GS4,AS4,SLC,FS4,SL2,B3,C4
  .db RET

Fast_Theme_C_square1_10:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,CS4,AS3,SL4,GS3,FS3,SL8,FS3
  .db SL4,CS4,AS3,GS3,SL2,GS3,AS3,SL0,FS3
  .db RET

Fast_Theme_C_square1_11:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,CS4,AS4,SL4,GS4,FS4,SL8,FS4
  .db SL4,FS4,DS4,CS4,SL2,DS4,GS4,SLC,FS4,SL2,F4,DS4
  .db RET

Fast_Theme_C_square2_0:
  .db STV,5,SAR,3,STP,0,SDU,1,SLL,24,FS4,SL4,FS4,GS4,FS4,E4,E4
  .db SL2,DS4,SLA,E4,SL4,CS4,DS4
  .db RET

Fast_Theme_C_square2_2:
  .db STV,5,SAR,3,STP,0,SDU,1,SLL,24,FS4,SL4,FS4,GS4,B4,AS4,GS4
  .db SL2,FS4,SL6,DS4,SL4,GS4,FS4,DS4
  .db RET

Fast_Theme_C_square2_3:
  .db STV,5,SAR,3,STP,0,SDU,1,SLC,DS4,SL2,DS4,CS4,SL8,B3,SL4,AS3
  .db B3,SLC,FS4,SL2,E4,DS4,SL8,E4,DS4
  .db RET

Fast_Theme_C_square2_4:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,B3,CS4,SLC,B3,SL2,AS3,GS3,SL8
  .db FS3,SL4,B3,CS4
  .db RET

Fast_Theme_C_square2_5:
  .db STV,5,SAR,3,STP,0,SDU,1,SL0,B3,CS4,SLC,B3,SL2,CS4,DS4,SL0
  .db FS4
  .db RET

Fast_Theme_C_square2_6:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,FS4,DS5,SL4,CS5,B4,SL8,B4,SL4
  .db B4,GS4,FS4,SL2,GS4,SLE,FS4,SL2,E4,F4
  .db RET

Fast_Theme_C_square2_7:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,FS4,DS5,SL4,CS5,B4,SL8,B4,SL4
  .db B4,GS4,FS4,SL2,GS4,CS5,SLC,B4,SL2,AS4,GS4
  .db RET

Fast_Theme_C_square2_8:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,FS4,DS4,SL4,CS4,B3,SL8,B3,SL4
  .db FS4,DS4,CS4,SL2,CS4,DS4,SL0,B3
  .db RET

Fast_Theme_C_square2_9:
  .db STV,5,SAR,3,STP,0,SDU,1,SL8,FS4,DS5,SL4,B4,CS5,SL8,DS5,SL4
  .db FS5,E5,CS5,DS5,SLC,B4,SL2,E4,F4
  .db RET

Fast_Theme_C_triangle_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Fast_Theme_C_triangle_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,FS3,STV,8,SL2,CS3,CS3,STV,6
  .db FS3,E3,DS3,SL4,CS3,STV,8,SL2,A2,A2,B2,STV,6,SL4,B2,CS3,FS3
  .db STV,8,SL2,CS3,CS3,STV,6,FS3,E3,DS3,SL4,E3,STV,8,SL2,A2,A2
  .db A2,STV,6,SL4,E3,DS3
  .db RET

Fast_Theme_C_triangle_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,FS3,STV,8,SL2,CS3,CS3,STV,6
  .db FS3,E3,DS3,SL4,CS3,STV,8,SL2,A2,A2,B2,STV,6,SL4,B2,CS3,FS3
  .db STV,8,SL2,CS3,CS3,STV,6,FS3,E3,DS3,SL4,E3,STV,8,SL2,A2,A2
  .db A2,STV,6,SL4,FS3,F3
  .db RET

Fast_Theme_C_triangle_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,DS3,STV,8,SL2,AS2,AS2,STV,6
  .db DS3,CS3,AS2,SL4,GS2,STV,8,SL2,FS2,FS2,GS2,STV,6,SL4,GS2
  .db B2,DS3,STV,8,SL2,AS2,AS2,STV,6,DS3,CS3,B2,SL4,CS3,STV,8
  .db SL2,FS2,FS2,FS2,STV,6,SL4,CS3,DS3
  .db RET

Fast_Theme_C_triangle_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,E3,STV,8,SL2,B2,B2,STV,6
  .db SL4,FS3,STV,8,SL2,CS3,CS3,STV,6,GS3,G3,FS3,F3,SL4,E3,STV,8
  .db SL2,FS3,FS3,STV,6,SL4,E3,STV,8,SL2,B2,B2,STV,6,SL4,FS3,STV,8
  .db SL2,CS3,CS3,STV,6,GS3,A3,AS3,B3,SL4,CS4,SL2,C4,B3
  .db RET

Fast_Theme_C_triangle_6:
  .db STV,8,SAR,3,STP,10,SDU,7,SL2,FS3,FS3,STV,6,SL4,FS3,STV,8
  .db SL2,DS3,DS3,STV,6,SL4,DS3,STV,8,SL2,CS3,CS3,STV,6,SL4,CS3
  .db STV,8,SL2,B2,B2,B2,B2,STV,6,SL4,FS3,GS3,FS3,SL2,GS3,AS3
  .db SL7,B3,STV,8,SL1,B3,SL2,B3,SL4,B3,SL2,B3
  .db RET

Fast_Theme_C_triangle_8:
  .db STV,8,SAR,3,STP,10,SDU,7,SL2,FS3,FS3,STV,6,SL4,FS3,STV,8
  .db SL2,DS3,DS3,STV,6,SL4,DS3,STV,8,SL2,CS3,CS3,STV,6,SL4,CS3
  .db STV,8,SL2,B2,B2,B2,B2,STV,6,SL4,FS3,GS3,FS3,SL2,GS3,FS3
  .db SL7,B2,STV,8,SL1,B2,SL2,B2,SL4,B2,SL2,B2
  .db RET

Fast_Theme_C_noise_0:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,3,SAR,1,9,STV,0,SAR,0
  .db 14,STV,3,SAR,1,9,STV,0,SAR,0,14,STV,3,SAR,1,SL2,9,STV,0
  .db SAR,0,SL4,14,SL2,14,STV,3,SAR,1,SL4,9,STV,0,SAR,0,14,STV,3
  .db SAR,1,9,STV,0,SAR,0,14,STV,3,SAR,1,9,STV,0,SAR,0,14,STV,3
  .db SAR,1,SL2,9,STV,0,SAR,0,SL4,14,SL2,14,STV,3,SAR,1,SL4,9
  .db RET

Fast_Theme_C_noise_1:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,3,SAR,1,9,STV,0,SAR,0
  .db 14,STV,3,SAR,1,9,STV,0,SAR,0,14,STV,3,SAR,1,SL2,9,STV,0
  .db SAR,0,SL4,14,SL2,14,STV,3,SAR,1,SL4,9,STV,0,SAR,0,SL8,14
  .db 14,SL4,14,SL2,14,SL4,14,SL2,14,SL4,14
  .db RET

Fast_Theme_C_noise_2:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0
  .db SAR,0,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db SL4,3,SL2,3,STV,3,SAR,1,9,STV,1,SAR,3,3,SL4,3
  .db RET

Fast_Theme_C_noise_3:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,0
  .db SAR,0,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db SL4,3,SL2,3,STV,3,SAR,1,9,9,SL4,9
  .db RET

Fast_Theme_C_noise_4:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,9,STV,1,SAR,3,3,3,STV,0
  .db SAR,0,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3
  .db SL4,3,SL2,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,9
  .db RET

Fast_Theme_C_noise_7:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,SL4,9,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,SL4,9,STV,0
  .db SAR,0,SL2,14,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1,SAR,3,SL4
  .db 3,SL2,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,9
  .db RET

Fast_Theme_C_noise_8:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,SL4,9,STV,1,SAR,3,SL2,3,3,STV,3,SAR,1,9,9,9,STV,1
  .db SAR,3,3,STV,0,SAR,0,14,STV,1,SAR,3,3,STV,3,SAR,1,9,STV,1
  .db SAR,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,STV,3,SAR,1,9,9
  .db RET

Fast_Theme_C_noise_10:
  .db STV,0,SAR,0,STP,10,SDU,7,SL4,14,STV,1,SAR,3,SL2,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,0,SAR,0
  .db 14,STV,1,SAR,3,3,3,3,STV,3,SAR,1,9,STV,1,SAR,3,3,3,3,STV,3
  .db SAR,1,SL4,9,STV,0,SAR,0,SL2,14,STV,1,SAR,3,3,STV,3,SAR,1
  .db 9,9,9,STV,1,SAR,3,3,STV,3,SAR,1,9,9,9,9,9,9,9,9
  .db RET

Fast_Theme_C_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,C3,CS3,C3,CS3,C3,SL2,CS3,SL4
  .db C3,SL2,C3,SL4,CS3,C3,CS3,C3,CS3,C3,SL2,CS3,SL4,C3,SL2,C3
  .db SL4,CS3
  .db RET

Fast_Theme_C_dpcm_1:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,C3,CS3,C3,CS3,C3,SL2,CS3,SL4
  .db C3,SL2,C3,SL4,CS3,SL8,C3,C3,SL4,C3,SL2,C3,SL4,C3,SL2,C3,SL4
  .db C3
  .db RET

Fast_Theme_C_dpcm_2:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,C3
  .db SL4,CS3,C3,SL8,C3,CS3
  .db RET

Fast_Theme_C_dpcm_3:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,C3
  .db SL4,CS3,C3,SL8,C3,SL2,CS3,D3,SL4,D3
  .db RET

Fast_Theme_C_dpcm_4:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,SL2,CS3
  .db SL6,D3,SL8,C3,SL4,CS3,C3,SL8,C3,SL4,CS3,SL2,D3,D3
  .db RET

Fast_Theme_C_dpcm_7:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,CS3
  .db SL4,CS3,C3,SL8,CS3,SL4,CS3,SL2,D3,D3
  .db RET

Fast_Theme_C_dpcm_8:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,CS3
  .db SL2,CS3,D3,SL4,CS3,C3,D3,CS3,SL2,D3,D3
  .db RET

Fast_Theme_C_dpcm_10:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,SL4,CS3,C3,SL8,C3,CS3,SL4
  .db CS3,C3,SL2,CS3,D3,SL4,CS3,SL2,CS3,D3,D3,D3,CS3,D3,D3,D3
  .db RET

Mission_Failed:
  .db 0
  .db 4
  .db 85
  .db 3
  .dw Mission_Failed_square1
  .dw Mission_Failed_square2
  .dw Mission_Failed_triangle
  .dw Mission_Failed_noise
  .dw Mission_Failed_dpcm

Mission_Failed_square1:
  .db CAL,<(Mission_Failed_square1_0),>(Mission_Failed_square1_0)
  .db CAL,<(Mission_Failed_square1_1),>(Mission_Failed_square1_1)
Mission_Failed_square1_loop:
  .db GOT
  .dw Mission_Failed_square1_loop

Mission_Failed_square2:
  .db CAL,<(Mission_Failed_square2_0),>(Mission_Failed_square2_0)
  .db CAL,<(Mission_Failed_square2_1),>(Mission_Failed_square2_1)
Mission_Failed_square2_loop:
  .db GOT
  .dw Mission_Failed_square2_loop

Mission_Failed_triangle:
  .db CAL,<(Mission_Failed_triangle_0),>(Mission_Failed_triangle_0)
  .db CAL,<(Mission_Failed_triangle_1),>(Mission_Failed_triangle_1)
Mission_Failed_triangle_loop:
  .db GOT
  .dw Mission_Failed_triangle_loop

Mission_Failed_noise:
Mission_Failed_noise_loop:
  .db CAL,<(Mission_Failed_noise_0),>(Mission_Failed_noise_0)
  .db CAL,<(Mission_Failed_noise_1),>(Mission_Failed_noise_1)
  .db GOT
  .dw Mission_Failed_noise_loop

Mission_Failed_dpcm:
Mission_Failed_dpcm_loop:
  .db CAL,<(Mission_Failed_dpcm_0),>(Mission_Failed_dpcm_0)
  .db CAL,<(Mission_Failed_dpcm_1),>(Mission_Failed_dpcm_1)
  .db GOT
  .dw Mission_Failed_dpcm_loop

Mission_Failed_square1_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL6,A3,A3,SL4,A3,SL8,GS3,G3,SLC
  .db FS3,SL1,FS3,F3,E3,F3,SL0,FS3
  .db RET

Mission_Failed_square1_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SL4,A0
  .db RET

Mission_Failed_square2_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL6,FS3,FS3,SL4,FS3,SL8,F3,E3,SLC
  .db DS3,SL1,DS3,D3,CS3,D3,SL0,DS3
  .db RET

Mission_Failed_square2_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SL4,A0
  .db RET

Mission_Failed_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,FS3,SL8,DS3,E3,SL0,FS3,DS3
  .db RET

Mission_Failed_triangle_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SL4,A0
  .db RET

Mission_Failed_noise_0:
  .db STV,4,SAR,3,STP,10,SDU,7,SL0,3,6,9,13
  .db RET

Mission_Failed_noise_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Failed_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL0,C3,C3,SL6,C3,C3,SL4,C3,SL0
  .db C3
  .db RET

Mission_Failed_dpcm_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_1:
  .db 0
  .db 4
  .db 85
  .db 3
  .dw Mission_Complete_1_square1
  .dw Mission_Complete_1_square2
  .dw Mission_Complete_1_triangle
  .dw Mission_Complete_1_noise
  .dw Mission_Complete_1_dpcm

Mission_Complete_1_square1:
Mission_Complete_1_square1_loop:
  .db CAL,<(Mission_Complete_1_square1_0),>(Mission_Complete_1_square1_0)
  .db CAL,<(Mission_Complete_1_square1_1),>(Mission_Complete_1_square1_1)
  .db GOT
  .dw Mission_Complete_1_square1_loop

Mission_Complete_1_square2:
Mission_Complete_1_square2_loop:
  .db CAL,<(Mission_Complete_1_square2_0),>(Mission_Complete_1_square2_0)
  .db CAL,<(Mission_Complete_1_square2_1),>(Mission_Complete_1_square2_1)
  .db GOT
  .dw Mission_Complete_1_square2_loop

Mission_Complete_1_triangle:
Mission_Complete_1_triangle_loop:
  .db CAL,<(Mission_Complete_1_triangle_0),>(Mission_Complete_1_triangle_0)
  .db CAL,<(Mission_Complete_1_triangle_1),>(Mission_Complete_1_triangle_1)
  .db GOT
  .dw Mission_Complete_1_triangle_loop

Mission_Complete_1_noise:
Mission_Complete_1_noise_loop:
  .db CAL,<(Mission_Complete_1_noise_0),>(Mission_Complete_1_noise_0)
  .db CAL,<(Mission_Complete_1_noise_1),>(Mission_Complete_1_noise_1)
  .db GOT
  .dw Mission_Complete_1_noise_loop

Mission_Complete_1_dpcm:
Mission_Complete_1_dpcm_loop:
  .db CAL,<(Mission_Complete_1_dpcm_0),>(Mission_Complete_1_dpcm_0)
  .db CAL,<(Mission_Complete_1_dpcm_1),>(Mission_Complete_1_dpcm_1)
  .db GOT
  .dw Mission_Complete_1_dpcm_loop

Mission_Complete_1_square1_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A3,SL2,A3,A3,SL4,C4,E4,A4,G4
  .db E4,C4,SLL,32,A3
  .db RET

Mission_Complete_1_square1_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_1_square2_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,E3,SL2,E3,E3,SL4,G3,B3,E4,D4
  .db B3,G3,SLL,32,E3
  .db RET

Mission_Complete_1_square2_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_1_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,E3,C3,SL8,E3,G3,A3,SL0,C4,A3
  .db RET

Mission_Complete_1_triangle_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_1_noise_0:
  .db STV,4,SAR,3,STP,10,SDU,7,SL8,3,STV,3,SAR,1,9,STV,4,SAR,3
  .db SL4,3,3,STV,3,SAR,1,SL8,9,SL2,9,9,9,9,SL4,9,9,SL0,9
  .db RET

Mission_Complete_1_noise_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_1_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,CS3,SL4,C3,C3,CS3,SL2,C3
  .db C3,CS3,D3,D3,CS3,SL4,D3,CS3,SL0,CS3
  .db RET

Mission_Complete_1_dpcm_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_2:
  .db 0
  .db 4
  .db 85
  .db 3
  .dw Mission_Complete_2_square1
  .dw Mission_Complete_2_square2
  .dw Mission_Complete_2_triangle
  .dw Mission_Complete_2_noise
  .dw Mission_Complete_2_dpcm

Mission_Complete_2_square1:
Mission_Complete_2_square1_loop:
  .db CAL,<(Mission_Complete_2_square1_0),>(Mission_Complete_2_square1_0)
  .db CAL,<(Mission_Complete_2_square1_1),>(Mission_Complete_2_square1_1)
  .db GOT
  .dw Mission_Complete_2_square1_loop

Mission_Complete_2_square2:
Mission_Complete_2_square2_loop:
  .db CAL,<(Mission_Complete_2_square2_0),>(Mission_Complete_2_square2_0)
  .db CAL,<(Mission_Complete_2_square2_1),>(Mission_Complete_2_square2_1)
  .db GOT
  .dw Mission_Complete_2_square2_loop

Mission_Complete_2_triangle:
Mission_Complete_2_triangle_loop:
  .db CAL,<(Mission_Complete_2_triangle_0),>(Mission_Complete_2_triangle_0)
  .db CAL,<(Mission_Complete_2_triangle_1),>(Mission_Complete_2_triangle_1)
  .db GOT
  .dw Mission_Complete_2_triangle_loop

Mission_Complete_2_noise:
Mission_Complete_2_noise_loop:
  .db CAL,<(Mission_Complete_2_noise_0),>(Mission_Complete_2_noise_0)
  .db CAL,<(Mission_Complete_2_noise_1),>(Mission_Complete_2_noise_1)
  .db GOT
  .dw Mission_Complete_2_noise_loop

Mission_Complete_2_dpcm:
Mission_Complete_2_dpcm_loop:
  .db CAL,<(Mission_Complete_2_dpcm_0),>(Mission_Complete_2_dpcm_0)
  .db CAL,<(Mission_Complete_2_dpcm_1),>(Mission_Complete_2_dpcm_1)
  .db GOT
  .dw Mission_Complete_2_dpcm_loop

Mission_Complete_2_square1_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,A3,SL2,A3,A3,SL4,C4,E4,A4,G4
  .db E4,C4,SLL,32,A4
  .db RET

Mission_Complete_2_square1_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_2_square2_0:
  .db STV,7,SAR,3,STP,10,SDU,3,SL4,E3,SL2,E3,E3,SL4,G3,B3,E4,D4
  .db B3,G3,SLL,32,E4
  .db RET

Mission_Complete_2_square2_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_2_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL4,E3,C3,SL8,E3,G3,A3,SL0,C4,A3
  .db RET

Mission_Complete_2_triangle_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_2_noise_0:
  .db STV,4,SAR,3,STP,10,SDU,7,SL8,3,STV,3,SAR,1,9,STV,4,SAR,3
  .db SL4,3,3,STV,3,SAR,1,SL8,9,SL2,9,9,9,9,SL4,9,9,SL0,9
  .db RET

Mission_Complete_2_noise_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

Mission_Complete_2_dpcm_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SL8,C3,CS3,SL4,C3,C3,CS3,SL2,C3
  .db C3,CS3,D3,D3,CS3,SL4,D3,CS3,SL0,CS3
  .db RET

Mission_Complete_2_dpcm_1:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,64,A0
  .db RET

sfx_Spin:
  .db 0, 1
  .db 0, 1
  .dw sfx_Spin_square1
  .dw 0
  .dw 0
  .dw 0
  .dw 0

sfx_Spin_square1:
  .db CAL,<(sfx_Spin_square1_0),>(sfx_Spin_square1_0)
  .db TRM
sfx_Spin_square1_0:
  .db SLL,1,STV,6,SAR,3,STP,10,SDU,5,G4
  .db RET

sfx_Drop:
  .db 0, 1
  .db 0, 1
  .dw sfx_Drop_square1
  .dw 0
  .dw 0
  .dw 0
  .dw 0

sfx_Drop_square1:
  .db CAL,<(sfx_Drop_square1_0),>(sfx_Drop_square1_0)
  .db TRM
sfx_Drop_square1_0:
  .db SLL,1,STV,6,SAR,3,STP,3,SDU,5,B3
  .db RET

sfx_Lock_or_Move:
  .db 0, 1
  .db 0, 1
  .dw sfx_Lock_or_Move_square1
  .dw 0
  .dw 0
  .dw sfx_Lock_or_Move_noise
  .dw 0

sfx_Lock_or_Move_square1:
  .db CAL,<(sfx_Lock_or_Move_square1_0),>(sfx_Lock_or_Move_square1_0)
  .db TRM
sfx_Lock_or_Move_noise:
  .db CAL,<(sfx_Lock_or_Move_noise_0),>(sfx_Lock_or_Move_noise_0)
  .db TRM
sfx_Lock_or_Move_square1_0:
  .db SLL,2,STV,6,SAR,3,STP,9,SDU,5,G3
  .db RET

sfx_Lock_or_Move_noise_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,3,8,SLL,2,7,SLL,3,6,SLL,1
  .db 9
  .db RET

sfx_Clearx1:
  .db 0, 1
  .db 0, 1
  .dw 0
  .dw 0
  .dw 0
  .dw sfx_Clearx1_noise
  .dw 0

sfx_Clearx1_noise:
  .db CAL,<(sfx_Clearx1_noise_0),>(sfx_Clearx1_noise_0)
  .db TRM
sfx_Clearx1_noise_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,2,15,10,SLL,6,5,6,7,SLL,3
  .db 8,9,SLL,4,10,SLL,1,11
  .db RET

sfx_Clearx2:
  .db 0, 1
  .db 0, 1
  .dw sfx_Clearx2_square1
  .dw sfx_Clearx2_square2
  .dw 0
  .dw sfx_Clearx2_noise
  .dw 0

sfx_Clearx2_square1:
  .db CAL,<(sfx_Clearx2_square1_0),>(sfx_Clearx2_square1_0)
  .db TRM
sfx_Clearx2_square2:
  .db CAL,<(sfx_Clearx2_square2_0),>(sfx_Clearx2_square2_0)
  .db TRM
sfx_Clearx2_noise:
  .db CAL,<(sfx_Clearx2_noise_0),>(sfx_Clearx2_noise_0)
  .db TRM
sfx_Clearx2_square1_0:
  .db STV,6,SAR,3,STP,10,SDU,6,SLL,4,D3,FS3,D4,FS4,D4,SLL,2
  .db FS4
  .db RET

sfx_Clearx2_square2_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,36,A0,STV,6,SLL,4,FS4,D4,FS4
  .db D4,FS4,D4,SLL,1,FS4
  .db RET

sfx_Clearx2_noise_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,2,15,10,SLL,6,5,6,7,SLL,3
  .db 8,9,SLL,4,10,SLL,1,11
  .db RET

sfx_Clearx3:
  .db 0, 1
  .db 0, 1
  .dw sfx_Clearx3_square1
  .dw 0
  .dw 0
  .dw sfx_Clearx3_noise
  .dw 0

sfx_Clearx3_square1:
  .db CAL,<(sfx_Clearx3_square1_0),>(sfx_Clearx3_square1_0)
  .db TRM
sfx_Clearx3_noise:
  .db CAL,<(sfx_Clearx3_noise_0),>(sfx_Clearx3_noise_0)
  .db TRM
sfx_Clearx3_square1_0:
  .db STV,6,SAR,3,STP,10,SDU,6,SLL,4,G3,B3,G4,B4,G4,SLL,2,B4
  .db RET

sfx_Clearx3_noise_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,2,15,10,SLL,6,5,6,7,SLL,3
  .db 8,9,SLL,4,10,SLL,1,11
  .db RET

sfx_NotTetris:
  .db 0, 1
  .db 0, 1
  .dw sfx_NotTetris_square1
  .dw sfx_NotTetris_square2
  .dw 0
  .dw sfx_NotTetris_noise
  .dw 0

sfx_NotTetris_square1:
  .db CAL,<(sfx_NotTetris_square1_0),>(sfx_NotTetris_square1_0)
  .db TRM
sfx_NotTetris_square2:
  .db CAL,<(sfx_NotTetris_square2_0),>(sfx_NotTetris_square2_0)
  .db TRM
sfx_NotTetris_noise:
  .db CAL,<(sfx_NotTetris_noise_0),>(sfx_NotTetris_noise_0)
  .db TRM
sfx_NotTetris_square1_0:
  .db STV,6,SAR,3,STP,10,SDU,6,SLL,4,C4,E4,C5,E5,C5,E5,C5,E5,C5
  .db B4,G4,B4,G4,B4,G4,SLL,2,B4
  .db RET

sfx_NotTetris_square2_0:
  .db STV,11,SAR,3,STP,10,SDU,7,SLL,36,A0,STV,6,SDU,6,SLL,4
  .db E5,C5,E5,C5,E5,C5,SLL,2,E5
  .db RET

sfx_NotTetris_noise_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,2,15,10,SLL,6,5,6,7,SLL,3
  .db 8,9,SLL,4,10,SLL,1,11
  .db RET

sfx_Ghost:
  .db 0, 1
  .db 0, 1
  .dw 0
  .dw 0
  .dw sfx_Ghost_triangle
  .dw 0
  .dw 0

sfx_Ghost_triangle:
  .db CAL,<(sfx_Ghost_triangle_0),>(sfx_Ghost_triangle_0)
  .db TRM
sfx_Ghost_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,8,D6,SLL,1,G5
  .db RET

sfx_Store:
  .db 0, 1
  .db 0, 1
  .dw sfx_Store_square1
  .dw 0
  .dw sfx_Store_triangle
  .dw 0
  .dw 0

sfx_Store_square1:
  .db CAL,<(sfx_Store_square1_0),>(sfx_Store_square1_0)
  .db TRM
sfx_Store_triangle:
  .db CAL,<(sfx_Store_triangle_0),>(sfx_Store_triangle_0)
  .db TRM
sfx_Store_square1_0:
  .db SLL,1,STV,6,SAR,3,STP,4,SDU,5,C4
  .db RET

sfx_Store_triangle_0:
  .db SLL,1,STV,6,SAR,3,STP,5,SDU,7,C4
  .db RET

sfx_Boom:
  .db 0, 1
  .db 0, 1
  .dw sfx_Boom_square1
  .dw 0
  .dw 0
  .dw sfx_Boom_noise
  .dw 0

sfx_Boom_square1:
  .db CAL,<(sfx_Boom_square1_0),>(sfx_Boom_square1_0)
  .db TRM
sfx_Boom_noise:
  .db CAL,<(sfx_Boom_noise_0),>(sfx_Boom_noise_0)
  .db TRM
sfx_Boom_square1_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,1,A2,SLL,1,STP,8,SDU,5,A3
  .db RET

sfx_Boom_noise_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,1,15,13,14,15,12,13,12,13,12
  .db 14,13,12,13,11,12,11,10,12,11,10,11,10,11,10,10,6,7,6,6,8
  .db 9,10,8,10,9,8,10,9,4,5,6,4,10,11,9,10,11,SLL,1,9
  .db RET

sfx_GoodClear_or_Defuse:
  .db 0, 1
  .db 0, 1
  .dw 0
  .dw 0
  .dw sfx_GoodClear_or_Defuse_triangle
  .dw sfx_GoodClear_or_Defuse_noise
  .dw 0

sfx_GoodClear_or_Defuse_triangle:
  .db CAL,<(sfx_GoodClear_or_Defuse_triangle_0),>(sfx_GoodClear_or_Defuse_triangle_0)
  .db TRM
sfx_GoodClear_or_Defuse_noise:
  .db CAL,<(sfx_GoodClear_or_Defuse_noise_0),>(sfx_GoodClear_or_Defuse_noise_0)
  .db TRM
sfx_GoodClear_or_Defuse_triangle_0:
  .db STV,6,SAR,3,STP,10,SDU,6,SLL,4,G4,B4,G5,B5,G5,B5,G5,B5,SLL,2
  .db G5
  .db RET

sfx_GoodClear_or_Defuse_noise_0:
  .db STV,6,SAR,3,STP,10,SDU,7,SLL,2,15,10,SLL,6,5,6,7,SLL,3
  .db 8,9,SLL,4,10,SLL,1,11
  .db RET

sfx_Appear:
  .db 0, 1
  .db 0, 1
  .dw 0
  .dw 0
  .dw sfx_Appear_triangle
  .dw sfx_Appear_noise
  .dw 0

sfx_Appear_triangle:
  .db CAL,<(sfx_Appear_triangle_0),>(sfx_Appear_triangle_0)
  .db TRM
sfx_Appear_noise:
  .db CAL,<(sfx_Appear_noise_0),>(sfx_Appear_noise_0)
  .db TRM
sfx_Appear_triangle_0:
  .db STV,6,SAR,3,STP,6,SDU,7,SLL,4,C4,STP,10,C6,STP,7,SLL,1
  .db C5,SLL,1,STP,10,C5
  .db RET

sfx_Appear_noise_0:
  .db SLL,1,STV,6,SAR,3,STP,10,SDU,7,12
  .db RET

