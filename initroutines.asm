;
; initroutines.asm
; Part of the game dúshlán for the NES
;
; Copyright (c) 2016 Peter McQuillan 
; 
; All Rights Reserved. 
; 
; Distributed under the BSD Software License (see license.txt) 
; 
;

; this initialises the high score to 001250 
InitHighScore:
    LDA #48     ; ASCII 0
    STA highscore
    STA highscore + 1
    STA highscore + 5
    LDA #49     ; ASCII 1
    STA highscore + 2
    LDA #50     ; ASCII 2
    STA highscore + 3
    LDA #53     ; ASCII 5
    STA highscore + 4

    RTS 

; initialise the variables used by the random number generator
InitRandom:

    LDA #82
    STA random
    LDA #97
    STA rnd2
    LDA #120
    STA rnd3
    LDA #111
    STA rnd4
    
    RTS
	
; This initialises the table used to calculate the offsets for the ghost for each shape
; Basically it is the number of increments you would need to take for a shape to be no longer blocking itself

InitGhostOffset:

    LDX #0
igoloop:
    LDA ghostromoffset,x
    STA ghostoffset,x
    INX
    CPX #48              ; Compare X to 48 - copying 48 bytes
    BNE igoloop
     
    RTS

; this initialises the lookup table that is used to determine the tilenum (graphic)
; to use for each of the shapes.    
InitTileNumLookupTable

    LDX #0
itltloop:
    LDA tilenumromdata,x
    STA tilenumlookuptable,x
    INX
    CPX #12              ; Compare X to 12 - copying 12 bytes (there are 12 shapes)
    BNE itltloop
    
    RTS

; this initialises the indices used by the block lookup table   
InitBlockLookupTable:
    LDX #0
ibltloop:
    LDA blocklookupindicesromdata,x
    STA blocklookuptable,x
    INX
    CPX #12              ; Compare X to 12 (there are 12 shapes)
    BNE ibltloop
    
    RTS
  
; this initialises the indices used by the ghost lookup table  
InitGhostLookupTable
    LDX #0
igltloop:
    LDA ghostlookupindicesromdata,x
    STA ghostlookuptable,x
    INX
    CPX #12              ; Compare X to 12 (there are 12 shapes)
    BNE igltloop
    
    RTS

; initialise shape data
InitShapeData:

    LDX #0
isdloop:
    LDA shaperomdata,x
    STA shapedata,x
    INX
    CPX #96              ; Compare X to 96 - copying 96 bytes
    BNE isdloop
    
    RTS

; initialise the playarea.
InitPlayArea:
    ; first set every block to blank space
    LDA #BLANKSPACE
    LDX #$00
ipaloop:
    STA playareabuf, x
    INX
    CPX #$F0    ; compare to F0 (240)
    BNE ipaloop

    ; now set a wall at the appropriate places
    
    LDA upsidedown
    CMP #$01
    BEQ ipa2
    
    LDX #$E6    ; 230
    LDA #$07    ; wall
ipa1:
    STA playareabuf, x
    INX
    CPX #$F0    ; compare to F0 (240)
    BNE ipa1

    RTS
    
ipa2:  
    LDX #$1E    ;30
    LDA #$07    ; wall
ipa3:
    STA playareabuf, x
    INX
    CPX #$28    ; compare to 28H (40)
    BNE ipa3

    RTS

; initialises the lookup table used to calculate ppu related addresses
; uses registers X, Y and A
InitPPULookupTable:
    
    LDY #$00
    LDX #$00
    LDA #$20
ipltloop1:
    STA ppu_lookup1, x
    PHA
    TYA
    STA ppu_lookup2, x
    CLC
    ADC #$20
    TAY
    PLA
    INX
    CPX #$08
    BNE ipltloop1

    LDY #$00
    LDA #$21
ipltloop2:
    STA ppu_lookup1, x
    PHA
    TYA
    STA ppu_lookup2, x
    CLC    
    ADC #$20
    TAY
    PLA
    INX
    CPX #$10        ; 10 hex, 16 dec
    BNE ipltloop2    
    
    LDY #$00    
    LDA #$22
ipltloop3:
    STA ppu_lookup1, x
    PHA
    TYA
    STA ppu_lookup2, x
    CLC    
    ADC #$20
    TAY
    PLA
    INX    
    CPX #$18        ; 18 hex, 24 dec
    BNE ipltloop3     

    LDY #$00    
    LDA #$23
ipltloop4:
    STA ppu_lookup1, x
    PHA
    TYA
    STA ppu_lookup2, x
    CLC
    ADC #$20
    TAY
    PLA
    INX    
    CPX #$1E        ; 1E hex, 30 dec
    BNE ipltloop4     
    
    RTS	

	
	