;
; variables2.inc
; Part of the game dúshlán for the NES
;
; Copyright (c) 2016 Peter McQuillan 
; 
; All Rights Reserved. 
; 
; Distributed under the BSD Software License (see license.txt) 
; 
;

    ; this holds a copy of the playarea
    
    playareabuf .dsb 240  
    
    ; these 60 bytes are used as lookup tables when calculating the address to write the background
    ; information. 
    
    ppu_lookup1 .dsb 30
    ppu_lookup2 .dsb 30
    
    ; this holds the information for all rotations of all the possible shapes
    
    shapedata .dsb 96   ;(12 * 8) 
    
    ; this holds the offset for ghost. Basically it is the number of increments you would
    ; need to take for a shape to be no longer blocking itself

    ghostoffset .dsb 48 ;(12 * 4)
    
    ; this table helps find the correct ghost offset

    ghostlookuptable .dsb 12

    ; this gives the tile number (colour) for the blocks for each of the shapes	
    tilenumlookuptable .dsb 12
    
    blocklookuptable .dsb 12
    
    ; this holds the score
    
    score   .dsb 6
    
    ; this holds the high score
    
    highscore .dsb 6