;
; data.inc
; Part of the game dúshlán for the NES
;
; Copyright (c) 2016 Peter McQuillan 
; 
; All Rights Reserved. 
; 
; Distributed under the BSD Software License (see license.txt) 
; 
;

; these are the strings used in the game, series of values (string) followed by 0, followed
; by the x and y value (where to print the string)
 
level_str:
    .db "LEVEL ",0,12,11
ghost_off_str:
    .db 208,209,210,211,0,3,21
ghost_on_str:
    .db 8,"On",8,0,3,21
lines_str:
    .db 176,177,178,179,180,181,0,24,19
bombs_str:
    .db 224,225,226,227,228,229,0,24,19
clock_seperator_str:
    .db ":",0,#CLOCKSEPERATORX,#CLOCKSEPERATORY
pieces_left_str:
    .db "LEFT",0,#LEFTTEXTX,#LEFTTEXTY
new_high_score_str:
    .db "NEW HIGH SCORE",0,9,17
congratulations_str:
    .db "CONGRATULATIONS",0,9,16
paused_str:
    .db "PAUSED",0,13,2
notpaused_str:
    .db "      ",0,13,2
	
    
defuse_info1_str:
    .db "DEFUSE ALL THE BOMBS",0,6,13
defuse_info2_str:
    .db "BEFORE TIME RUNS OUT",0,6,14  
limitedpieces_info1_str:    
    .db "REACH YOUR TARGET LINES",0,4,13
limitedpieces_info2_str:
    .db "BEFORE YOUR PIECES RUN OUT",0,4,14    
    
copyright_str:  .db "(c)2016 Peter McQuillan",0,4,16
music_by_str:   .db "Music and sounds by Teuthida",0,2,17    
   
msg_menu_start:                 .db "Start Game",0,5,20   
msg_menu_difficulty:            .db "Difficulty",0,5,21
msg_menu_difficulty_normal:	    .db "(Normal) ",0,19,21
msg_menu_difficulty_hard:       .db "(Hard)   ",0,19,21
msg_menu_dropmethod:            .db "Drop Method",0,5,22
msg_menu_dropmethod_normal:		.db "(Full)      ",0,19,22
msg_menu_dropmethod_likedown:	.db "(While Held)",0,19,22
msg_menu_dropmethod_mixture:	.db "(Mixture)   ",0,19,22
msg_menu_ingamemusic:           .db "In Game Music",0,5,23
msg_menu_ingamemusic_themeA:    .db "(Theme A)",0,19,23
msg_menu_ingamemusic_themeB:    .db "(Theme B)",0,19,23
msg_menu_ingamemusic_themeC:    .db "(Theme C)",0,19,23
msg_menu_ingamemusic_silence:   .db "(Off)    ",0,19,23
msg_menu_controls:              .db "Controls",0,5,24
msg_menu_controls_normal:       .db "(Down=Drop)",0,19,24
msg_menu_controls_alternate:    .db "(Down=Spin)",0,19,24

; level names displayed at bottom, 17 chars plus 3 data
levelnames:
.db  "1 - Nice and Easy",0,7,26
.db  " 2 - Spice it up ",0,7,26
.db  "  3 - G'day Mate ",0,7,26
.db  "4 - Shooting Star",0,7,26
.db  "  5 - More Stars ",0,7,26
.db  "  6 - Tick Tock  ",0,7,26
.db  "  7 - Countdown  ",0,7,26
.db  "8 - Sliding Floor",0,7,26
.db  "  9 - Mix it up  ",0,7,26
.db  " 10 - Rising Fall",0,7,26

; this is the number of complete lines required to win each level
linesneededperlevel: .db	10,6,6,5,4,#BOMBSONLEVEL6,7,12,4,25
;linesneededperlevel: .db	 1,1,1,1,1,#BOMBSONLEVEL6,1,1,1,1

MainPalette: 
    .db $0E,$34,$27,$1C, $0E,$05,$25,$0F, $0E,$05,$25,$0F, $0E,$05,$25,$0E    ;background
    .db $0E,$34,$27,$1C, $0E,$27,$25,$0F, $0E,$05,$25,$0F, $0E,$05,$25,$0F    ;sprites

background:
    .incbin "graphics.rle"
    
teuthida:
    .incbin "squid.rle"

attribute:  
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000 
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000 
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000  
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000  
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000  
    .db %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000, %00000000,  %00000000
    
    
; data for the main falling blocks logo on the main menu page. 254 means end of line, 255 means end of data
; first 2 bytes are the starting X and Y pos
; other values are the tile to display at that position

fallingblockslogo1:
.db 0,2  
.db 8,8,16,16,16,8,254
.db 8,8,16,8,8,8,8,14,8,8,14,8,8,8,14,8,8,8,14,14,14,8,14,14,8,8,8,14,14,254
.db 8,8,8,8,8,8,14,8,15,8,5,8,8,8,14,8,8,8,8,14,8,8,14,8,5,8,14,8,8,254
.db 8,8,14,14,8,8,14,15,15,8,5,8,8,8,14,8,8,8,8,14,8,8,14,8,5,8,14,8,26,254
.db 8,8,14,8,8,8,14,8,15,8,5,8,8,8,14,8,8,8,8,14,8,8,14,8,5,8,14,8,26,254
.db 8,8,14,8,8,8,14,8,14,8,5,14,14,8,14,14,14,8,14,14,14,8,14,8,5,8,8,26,26,254
.db 255

fallingblockslogo2:
.db 0,10
.db 8,8,8,8,14,14,8,8,14,8,8,8,8,14,8,8,8,14,14,8,14,8,14,8,8,14,14,254
.db 8,8,8,8,14,8,14,8,14,8,8,8,14,8,14,8,14,8,8,8,15,8,14,8,14,8,8,254
.db 8,8,8,8,14,14,8,8,14,8,8,8,14,8,14,8,14,8,8,8,15,15,8,8,8,14,8,254
.db 8,8,8,8,14,8,14,8,16,8,8,8,14,8,14,8,14,8,8,8,15,8,14,8,8,8,14,254
.db 8,8,8,8,14,14,8,8,16,16,16,8,8,14,8,8,8,14,14,8,14,8,14,8,14,14,8,254
.db 255 

;dúshlán
dushlanlogo1:
.db 0,5
.db 8,8,8,8,8,8,14,14,14,8,8,8,8,8,8,8,8,8,8,8,8,8,14,14,14,254
.db 8,8,8,8,8,8,14,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,14,254
.db 255
dushlanlogo2:
.db 0,8
.db 8,8,1,1,8,8,1,8,1,8,8,1,1,8,1,8,1,8,1,8,8,8,8,1,8,8,1,1,8,254
.db 8,8,1,8,1,8,1,8,1,8,1,8,8,8,1,8,1,8,1,8,8,8,1,8,1,8,1,8,1,254
.db 8,8,1,8,1,8,1,8,1,8,8,1,8,8,1,1,1,8,1,8,8,8,1,1,1,8,1,8,1,254
.db 8,8,1,8,1,8,1,8,1,8,8,8,1,8,1,8,1,8,1,8,8,8,1,8,1,8,1,8,1,254
.db 8,8,1,1,8,8,8,1,8,8,1,1,8,8,1,8,1,8,1,1,1,8,1,8,1,8,1,8,1,254
.db 255

gameoverlogo:
.db 8,3
.db 8,14,14,8,8,14,8,8,14,8,8,8,14,8,14,14,14,254
.db 14,8,8,8,14,8,14,8,14,14,8,14,14,8,14,8,8,254
.db 14,8,14,8,14,14,14,8,14,8,14,8,14,8,14,14,8,254
.db 14,8,14,8,14,8,14,8,14,8,8,8,14,8,14,8,8,254
.db 8,14,14,8,14,8,14,8,14,8,8,8,14,8,14,14,14,254
.db 254
.db 8,8,14,8,8,14,8,14,8,14,14,14,8,14,14,8,254
.db 8,14,8,14,8,14,8,14,8,14,8,8,8,14,8,14,254
.db 8,14,8,14,8,14,8,14,8,14,14,8,8,14,14,8,254
.db 8,14,8,14,8,8,14,8,8,14,8,8,8,14,8,14,254
.db 8,8,14,8,8,8,14,8,8,14,14,14,8,14,8,14,254
.db 255

youwinlogo:
.db 10,3
.db 8,14,8,14,8,8,14,8,8,14,8,14,254
.db 8,14,8,14,8,14,8,14,8,14,8,14,254
.db 8,8,14,8,8,14,8,14,8,14,8,14,254
.db 8,8,14,8,8,14,8,14,8,14,8,14,254
.db 8,8,14,8,8,8,14,8,8,8,14,8,254
.db 254
.db 14,8,8,8,14,8,14,14,14,8,14,14,8,254
.db 14,8,8,8,14,8,8,14,8,8,14,8,14,254
.db 14,8,14,8,14,8,8,14,8,8,14,8,14,254
.db 14,14,8,14,14,8,8,14,8,8,14,8,14,254
.db 14,8,8,8,14,8,14,14,14,8,14,8,14,254
.db 255   

; this defines all the shapes used in the game
shaperomdata:	
.db 15,0,68,68,15,0,68,68 ; shape 1	
.db 142,0,68,192,14,32,200,128	
.db 46,0,196,64,232,0,136,192	
.db 204,0,204,0,204,0,204,0	
.db 108,0,140,64,108,0,140,64 
.db 78,0,76,64,14,64,140,128 
.db 198,0,76,128,198,0,76,128 ; this is the end of the standard blocks
.db 72,0,132,0,72,0,132,0 ; shape 8
.db 200,192,174,0,196,192,14,160
.db 12,0,68,0,12,0,68,0
.db 164,0,132,128,74,0,72,64
.db 78,64,78,64,78,64,78,64

; this holds the indices for the shape lookup table (2 bytes per orientation, 4 orientations per shape)
blocklookupindicesromdata:
.db 0,8,16,24,32,40,48,56,64,72,80,88

; this holds the indices for the ghost lookup table (4 per shape)
ghostlookupindicesromdata:
.db 0,4,8,12,16,20,24,28,32,36,40,44

; this holds the offset for ghost. Basically it is the number of increments you would
; need to take for a shape to be no longer blocking itself

ghostromoffset:
.db 1,4,1,4
.db 2,3,2,3 
.db 2,3,2,3 
.db 2,2,2,2 
.db 2,2,2,2
.db 2,3,2,3 
.db 2,2,2,2
.db 1,1,1,1
.db 3,2,3,2
.db 1,2,1,2
.db 1,3,1,3
.db 3,3,3,3

; this defines which tile to use for each shape
tilenumromdata:
.db 26,16,17,14,15,16,17,26,16,17,14,15