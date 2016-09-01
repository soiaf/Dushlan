; dushlan.asm 
;
; Copyright (c) 2016 Peter McQuillan 
; 
; All Rights Reserved. 
; 
; Distributed under the BSD Software License (see license.txt) 
; 
; 

;; The iNes Header

    .db "NES", $1a   ; iNes identifier
    .db $02          ; number of PRG-Rom blocks the game has 1 = 16KB, 2 = 32KB
    .db $01          ; number of CHR-Rom blocks the game has (CHR-ROM blocks are 8KB)
    .db $00, $00     ; control bytes
    .db $00, $00, $00, $00, $00, $00, $00, $00    

;; Constants and Variables

include "ggsound.inc"
include "defines.inc"


;----------------------------------------------------------------
; variables
;----------------------------------------------------------------

    .enum $0000
    
    include "ggsound_zp.inc"
    include "variables1.inc"

    .ende
    
    .enum $0400
    
    include "ggsound_ram.inc"
    include "variables2.inc"  
    
    .ende



;; Set the code starting point


    .org $8000


;; 4. The RESET routine

RESET:

    ;;;;;;TURN THINGS OFF AND INITIALIZE;;;;;;;

    SEI        ; SEI tells the code to ignore 
               ; interrupts for the routine
    LDA #$00   ; Load 0 into the accumulator
    STA $2000  ; disables the NMI
    STA $2001  ; disables rendering
    STA $4010
    STA $4015
    LDA #$40   ; Loads HEX value 40, which = dec value 64
    STA $4017
    CLD        ; disables decimal mode
    LDX #$FF   ; loads value 255
    TXS        ; initializes the stack

    BIT $2002

vBlankWait1:

    BIT $2002
    BPL vBlankWait1
 
    ; we clear out memory  
        
    LDA #$00     ; loads zero into the accumulator
    LDX #$00     ; loads zero into x

    ;;;;;;NOW WE'RE READY TO START MEMORY CLEAR LOOP;;;;;;;;

ClearMemoryLoop:

    STA $0000,x   ; Store accumulator (0) into 
                  ; address $0000 + x 
    STA $0100,x   ; Store accumulator (0) into 
                  ; address $0100 + x 
    STA $0200,x   ; Store accumulator (0) into 
                  ; address $0200 + x 
    STA $0300,x   ; Store accumulator (0) into address 
                  ; $0300 + x 
    STA $0400,x   ; Store accumulator (0) into
                  ; address $0400 + x 
    STA $0500,x   ; Store accumulator (0) into 
                  ; address $0500 + x 
    STA $0600,x   ; Store accumulator (0) into 
                  ; address $0600 + x 
    STA $0700,x   ; Store accumulator (0) into 
                  ; address $0700 + x
    INX            ; x goes up by one, so all of those 
                   ; +x's at the end that were zero 
                   ; the first time through are increased.
    BNE ClearMemoryLoop  

            ;; This will branch up to the loop again if X is not 0
            ;; All memory locations from $0000 to $07FF will be
            ;; loaded with zero.


vBlankWait2:

    BIT $2002
    BPL vBlankWait2
    
    JSR HideAllSprites

    
  
    ;; if the comparison between 32 and x is not
    ;; zero (if 32-x does not = 0), that means there
    ;; are still more colours to load, so jump up
    ;; to the loop again with the now higher x value 

    
    ;; load the palettes

    LDA $2002
    LDA #$3F
    STA $2006
    LDA #$00
    STA $2006
    LDX #$00
    
;;; ready to start loop

LoadPaletteLoop:

    LDA MyPalettes,x  ;; load whatever value from the 
                      ;; table that x is equal to.
    STA $2007         ;; store it to the address that handles 
                      ;; palettes.
    INX               ;; increase x
    CPX #$20          ;; compare it to 32 There are 8 banks of 4 colours
                      ;; we are loading.  8x4 = 32.
                      ;; so we need to loop through 32 times

    BNE LoadPaletteLoop  

   
; initialise variables  

    JSR InitPPULookupTable
    JSR InitShapeData
    JSR InitBlockLookupTable
    JSR InitGhostLookupTable
    JSR InitGhostOffset
    JSR InitRandom
    JSR InitTileNumLookupTable
    JSR InitHighScore
    
    LDA #0
    STA buttonspressed
    STA backgroundmode
    STA textoffset
    STA ingamemusic
    STA frameTimer
    STA difficulty
    STA controlleroption
    
    LDA #$01
    STA sensitivity
    
    LDA #$02
    STA dropmethod
    
    LDA #TOPYWHENUPSIDEDOWN
    STA starty
    LDA #BOTTOMY-2
    STA upsidedownstarty
    LDA #15
    STA startx
    
    
    LDA #$10
    STA plx
    STA ply
    STA tmpx
    STA tmpy
    
    LDA #15
    STA blockshapes
    LDA #0
    STA blockshapes+1
    
    LDA #02
    STA nextshape
    
    ; this resets titlearrowpos (so its pointing at start game)
    LDA #0
    STA titlearrowpos
    
    ; this resets startgamerequested
    LDA #0
    STA startgamerequested
  
    ;;;;;;;TURN THINGS BACK ON NOW THAT WE'RE SET UP;;;;;;;;

  
    JSR ClearScreen ; this will clear the screen, set it to all blank
                    ; and will activate NMI and enable rendering


    JSR GetTVSystem
    STA tvsystem
    
    ; initalise music
    
    ;0: NTSC, 1: PAL, 2: Dendy; 3: unknown
    
    ; if we have identified tv system as PAL, set sound to PAL, otherwise NTSC
    
    LDA tvsystem
    CMP #1
    BEQ setsound1
    ; not PAL, so set to NTSC sound
    LDA #SOUND_REGION_NTSC
    JMP setsound2
setsound1:
    LDA #SOUND_REGION_PAL
setsound2:    
    STA sound_param_byte_0
    LDA #<song_list
    STA sound_param_word_0
    LDA #>song_list
    STA sound_param_word_0+1
    LDA #<sfx_list
    STA sound_param_word_1
    LDA #>sfx_list
    STA sound_param_word_1+1
    LDA #<envelopes_list
    STA sound_param_word_2
    LDA #>envelopes_list
    STA sound_param_word_2+1
    LDA #<dpcm_list
    STA sound_param_word_3
    LDA #>dpcm_list
    STA sound_param_word_3+1
    JSR sound_initialize 

    ; load the splash screen for Teuthida
    JSR WaitFrame   ; wait for the NMI VBlank
    JSR ClearScreen
    JSR LoadTeuthidaScreen
    

    lda #song_index_Teuthida
    sta sound_param_byte_0
    jsr play_song  
    
    LDX #0
teuthidaloop1:
    TXA
    PHA
    JSR SmallDelay
    PLA
    TAX
    INX
    CPX #20
    BNE teuthidaloop1

    JSR pause_song
    
    JSR SmallDelay
    JSR SmallDelay
    
    LDA #0
    STA backgroundmode
                  
    JMP TitleScreen

;; 5. The NMI

NMI: 

    ;;; push the registers to the stack to preserve them

    PHA   ; this pushes the accumulator to the stack.
    TXA   ; This loads whatever is in X into the accumulator
    PHA   ; and pushes the accumulator to the stack
          ; now the old A is on the bottom and X is on top of it.
    TYA   ; This loads whatever is in Y into the accumulator
    PHA   ; and pushes the accumulator to the stack
          ; now y is on top.  A is on bottom, X is in middle.


;;;;;;;;==============

 

;;DO NMI STUFF HERE

    INC frameTimer   ; increase frame time every time NMI is hit
    INC countdownframeTimer

    LDA #$00     ; puts zero into the accumulator
    STA $2003    ; sets the low byte of the sprite RAM address
    LDA #$02     ; puts 02 into the accumulator
    STA $4014    ; sets high byte of the RAM address 
                 ; and starts transfer.  This has
                 ; loaded low byte of 00, high byte of 02, 
                 ; meaning it's 16 bit address is
                 ; high+low, or 02+00 or $0200.
                 ; Later, we'll be using the address $0200
                 ; for our sprite data.  This is why.
    
    LDA bgupdaterequired
    CMP #$01
    BNE ppucleanup

    BIT $2002   ; read from PPUSTATUS (occasional corruption if do not do this before writing)
    JSR MakeBackgroundChanges
    
    
ppucleanup: 
  ;;This is the PPU clean up section, so rendering the next frame starts properly.
 ; LDA #%10010000   ; enable NMI, sprites from Pattern Table 0, background from Pattern Table 1
    LDA backgroundmode
    CMP #1
    BNE ppuc1
    LDA #%10010000
    STA $2000
    JMP ppuc2
ppuc1:
    LDA #%10000000
    STA $2000
ppuc2:    
    LDA #%00011110   ; enable sprites, enable background, no clipping on left side
    STA $2001
    LDA #$00        ;;tell the ppu there is no background scrolling
    STA $2005
    STA $2005 


setsleeping:
    LDA #0         ; clear the sleeping flag so that WaitFrame will exit
    STA sleeping
    
    soundengine_update
 
ExitNMI:

    ;;; pull the registers FROM the stack and restore them.

    PLA    ;; Pulls the top stack and puts it in accumulator.
    TAY    ;; puts that value into y
           ;; now y is restored to what it was before NMI.
    PLA    ;; pulls second stack value and puts in accumulator
    TAX    ;; puts that value into x
           ;; now x is restored to what it was before NMI
    PLA    ;; pulls third stack value and puts in accumulator
           ;; now y,x,and a are all restored to what they were

    RTI    ;; at the end of the NMI, we want to 
           ;; 'return from the interrupt'.
           ;; The RTI will put us back into the code 
           ;; in whatever place we were when the frame ended

    
;; Start game
StartGame:

    JSR NewGameInitialisation

    ;seed our random number generator
    LDA frameTimer
    STA randomtemp
    
    LDX #0
sgloop:
    JSR rnd
    INX
    CPX randomtemp
    BNE sgloop
    
	; lets draw the screen
	JMP NewLevel
    
    
; this setups the variables for a new level and draws the screen
NewLevel:
	
	JSR SetUpLevel
    JSR InitPlayArea
	JSR DrawScreen

    ;reset frameTimer and pretim
    LDA frameTimer
    STA pretim

	JMP MainGameLoop

; this sets up the variables for a new level
SetUpLevel:
	LDA #0
    STA upsidedown
    LDA currentlevel
    CMP #3
    BEQ sul1
    JMP sul2
sul1:
    LDA #1
    STA upsidedown
sul2:
	; reset allowed swap
    LDA #1
    STA allowedswap

    LDA #0
    STA totalrowscompletednum
    
    ; this calculates the number of pieces required to complete for this level
    LDX currentlevel
    DEX
    LDA linesneededperlevel,x
    STA targetlinesforthislevelnum
	
	; reset the number of pieces played this level
    LDA #0
    STA piecesplayedthislevel
    
    ; reset the bombs found
    LDA #0
    STA bombsfound
    STA bombsfoundpreviouscount

    RTS
    
; this is the routine that draws the screen

DrawScreen:
    JSR WaitFrame
	JSR ClearScreen	; clear the screen
	
    JSR PrintUpcomingLevel
    
    JSR WaitFrame
    JSR LoadMainGameGraphics    
    JSR DrawBase
    JSR PrintHighScore
    JSR PrintLevelTarget
    JSR WriteNameOfLevel

	; draw the saved shape
	JSR DrawSavedShape
    
    ; draw the text lines (or bombs)
    JSR DrawLinesOrBombs
    
    ; print the number of lines completed or bombs defused (zero)
    JSR PrintLinesOrBombsCompleted
    
    ; draw anything that may be specific to that level
    JSR DrawLevelSpecificItems
    
    ; print the current score
    JSR PrintScore
    
    ; print the current ghost setting
    JSR PrintGhostSetting
    
    ; we call selectnewpiece twice so we have a value for current and next shape
	JSR SelectNewPiece
	JSR SelectNewPiece
    
    JSR ShowAllShapes
    
    ; finally we reset the number of pieces played this level
    LDA #0
    STA piecesplayedthislevel
    
    LDA currentlevel
    CMP #7
    BNE ds1
    
    ; if level 7 we need to display the number of pieces left to play
    LDA #<pieces_left_str
    STA textprintaddr
    LDA #>pieces_left_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    
    JSR CalculateNumberOfPiecesLeft
    JSR PrintNumberOfPiecesLeft
    
ds1:       
    RTS
    
; draw the bottom of the board

DrawBase:
      
    LDX #0
    LDA #12
    STA bgbuf, x
       
    INX
    STX bgbufidx
    
    ; now write the PPU address
    LDA upsidedown
    CMP #1
    BEQ dbase1
    
    LDX #BOTTOMY
    JMP dbase2
dbase1:
    LDX #TOPYWHENUPSIDEDOWN
dbase2:    
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    STX bgbufidx

    
    LDA upsidedown
    CMP #1
    BEQ dbase3
    
    LDX #BOTTOMY
    JMP dbase4
dbase3:
    LDX #TOPYWHENUPSIDEDOWN
dbase4:               
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC #LEFTWALLX     
    
    LDX bgbufidx
    STA bgbuf, x

    INX
 
    LDA upsidedown
    CMP #1
    BEQ dbase5
 
    LDA #$0B    ; tile for bottom left bend
    JMP dbase6
dbase5:
    LDA #$1B    ; tile for top left bend
dbase6:    
    STA bgbuf, x
    INX    
    
    LDY #10
drawbaseloop:
    LDA #$0C
    STA bgbuf, x
    INX
    DEY
    CPY #0
    BNE drawbaseloop

    LDA upsidedown
    CMP #1
    BEQ dbase7
    
    LDA #$0D    ; tile for bottom right bend
    JMP dbase8
dbase7:    
    LDA #$1C    ; tile for top right bend
dbase8:    
    STA bgbuf, x
    INX    
    
    ; terminate the buffer
    LDA #0
    STA bgbuf, x

    JSR CommitChange
    RTS
    
; This draws on screen anything that may be specific to that level
DrawLevelSpecificItems:

    LDA currentlevel
    CMP #6
    BEQ dlsi1

    RTS
dlsi1:
    JSR populatebombs
    JSR DrawPlayAreaFromBuffer
    
    ; draw the clock seperator
    
    LDA #<clock_seperator_str
    STA textprintaddr
    LDA #>clock_seperator_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen

    LDA #LEVEL6ALLOWEDTIME
    STA leveltimer
    
    LDA #0
    STA countdownframeTimer ; reset
    
    JSR PrintOnScreenTimer

    RTS
    
    
; this draws the text 'LINES' or 'BOMBS' as appropriate
DrawLinesOrBombs:

    LDA currentlevel
    CMP #6
    BEQ dlob1

    LDA #<lines_str
    STA textprintaddr
    LDA #>lines_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS

dlob1:

    LDA #<bombs_str
    STA textprintaddr
    LDA #>bombs_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS    
    
  
;; Read from controller 1 and place result in buttonspressed

ReadFromController1:
    ; latch 
    LDA #$01 
    STA $4016 
    LDA #$00 
    STA $4016 
 
    LDX #$00 
readcontroller1values: 
    CPX #$08 
    BPL endreadcontroller1 
 
    LDA $4016 
    AND #%00000001 
    ASL buttonspressed 
    ORA buttonspressed 
    STA buttonspressed 
    INX 
    JMP readcontroller1values 
 
endreadcontroller1:
    RTS
           
;; 6. The Main Game Loop

MainGameLoop:

    LDA frameTimer     ; load the variable

CheckFrameTimer:

    CMP frameTimer      ; check to see if it's the same
    BEQ CheckFrameTimer 
                 ; if it is, don't move on, just loop
                 ; only if frame has increase can we go on.
                 
    LDA buttonspressed 
    STA lastbuttonspressed 
    
    JSR ReadFromController1

    LDA buttonspressed
    CMP #$00    ; if equal to 0 then no buttons pressed
    BEQ nobuttonspressed
    JMP handlebuttonactions
nobuttonspressed:	
	JSR DropPieceIfTapped
    LDA #0
    STA dropbuttonpresscount

                 
handlebuttonactions:                 
    ; Button status for each controller is returned in the following order: A, B, Select, Start, Up, Down, Left, Right.

    
    LDA buttonspressed 
    AND #%10000000 
    CMP #$00 
    BEQ ReadB

 ; do stuff for A button 
 
    LDA controlleroption
    CMP #1
    BEQ reada1
 
    JSR DoClockwiseAction
    JMP ReadB
reada1:
    JSR DoDropAction    

ReadB: 
    LDA buttonspressed 
    AND #%01000000 
    CMP #$00 
    BEQ ReadSelect

 ; Do stuff for B button 
    LDA controlleroption
    CMP #1
    BEQ readb1
    
    JSR DoAntiClockwiseAction
    JMP ReadSelect
readb1:
    JSR DoSwapAction

ReadSelect: 
    LDA buttonspressed 
    AND #%00100000 
    CMP #$00 
    BEQ ReadStart

    ; select does not do anything

ReadStart: 
    LDA buttonspressed 
    AND #%00010000 
    CMP #$00 
    BEQ ReadUp

 ; Stuff for Start button 
    JSR ChangeGhostSetting
    JSR SmallDelay

ReadUp: 
    LDA buttonspressed 
    AND #%00001000 
    CMP #$00 
    BEQ ReadDown

    ; Stuff for Up button 
    LDA controlleroption
    CMP #1
    BEQ readup1
    
    JSR SwapShape
    JMP ReadDown
readup1:
    JSR DoAntiClockwiseAction
    
ReadDown: 
    LDA buttonspressed 
    AND #%00000100 
    CMP #$00 
    BEQ ReadLeft
    
    ; Stuff for Down button
    LDA controlleroption
    CMP #1
    BEQ readdown1
    JSR DoDropAction
    JMP ReadLeft
    
readdown1:
    JSR DoClockwiseAction
    
ReadLeft: 
    LDA buttonspressed 
    AND #%00000010 
    CMP #$00 
    BEQ ReadRight

    ; Stuff for Left button 
    JSR MoveLeft
    JSR SmallDelay

ReadRight: 
    LDA buttonspressed 
    AND #%00000001 
    CMP #$00 
    BEQ NotRight

    ; Stuff for Right button
    JSR MoveRight
    JSR SmallDelay
    
NotRight:  
    ; if level 6 then we need to decrement the timer
    LDA currentlevel
    CMP #6
    BNE main1
    
    ; if PAL 50 frames a sec, if NTSC 60
    
    LDA tvsystem
    CMP #1  ; PAL
    BNE main5
    
    LDA countdownframeTimer
    CMP #50
    BCS main6
    JMP main1   ; a second has not passed yet, keep going
    
main5:
    LDA countdownframeTimer
    CMP #60
    BCS main6
    JMP main1    
   
main6:
    ; a second has passed, update the on-screen timer
    DEC leveltimer
    LDA #0
    STA countdownframeTimer
    JSR PrintOnScreenTimer

main1:   
    LDA difficulty
    CMP #0
    BNE main2

    LDA frameTimer
    SEC 
    SBC pretim
    CMP #45         ; have 45 frames elapsed yet?
    BCS main4
    JMP main3
main2:	
	; difficulty hard
    LDA frameTimer
    SEC 
    SBC pretim
    CMP #15         ; have 15 frames elapsed yet?
    BCS main4
	
main3:	
    JMP MainGameLoop    ;not time to drop piece yet, continue main loop
	
main4:
    LDA frameTimer
    STA pretim
    
	JSR AutoDropPiece
	
    ; the following will send us back to MainGameLoop if level not complete, otherwise
    ; it will send us to NewLevel
	JMP CheckLevelComplete  

    ; end main game loop

; if the button pressed corresponds to drop
DoDropAction:
    JSR DropPiece
    INC dropbuttonpresscount
    
    ; if drop method is 1 (while held), we make the delay very small
    LDA dropmethod
    CMP #1
    BEQ dda1
    
    JMP SmallDelay
dda1:
    JMP VerySmallDelay
    
; if the button pressed corresponds to anticlockwise
DoAntiClockwiseAction:
    JSR MoveAntiClockwise
    JMP SmallDelay
 
; if the button pressed corresponds to clockwise
DoClockwiseAction:
    JSR MoveClockwise
    JMP SmallDelay 
    
; if the button pressed corresponds to save/swap
DoSwapAction:
    JSR SwapShape
    JMP SmallDelay     
 

; this calculates the number of pieces left allowed to play in the level and stores the result in piecesleftthislevel
CalculateNumberOfPiecesLeft:

    LDA #LEVEL7ALLOWEDPIECES
    SEC 
    SBC piecesplayedthislevel   
    STA piecesleftthislevel  
    
    RTS

; this prints on-screen the number of pieces allowed to play this level (used by level 7)
PrintNumberOfPiecesLeft:

    LDA piecesleftthislevel
    CMP #255
    BEQ pnopl1
    JMP pnopl2
pnopl1:
    ; we just display 0 if number has wrapped around
    LDA #0
pnopl2:    
    STA digittemp
    JSR Print2Digit
    
    LDA #PIECESCOUNTDOWNX 
    STA printnumbersx
    LDA #PIECESCOUNTDOWNY  
    STA printnumbersy
    
    JSR PrintNumbers

    RTS


; this prints on screen the number of secs remaining to play this level
PrintOnScreenTimer:

    LDA leveltimer
    CMP #240
    BCS post1
    CMP #180
    BCS post2
    CMP #120
    BCS post3
    CMP #60
    BCS post4
    
    ; time is less than 60 seconds
    
    LDA #0
    JSR PrintOnScreenTimerMinutes
    LDA leveltimer
    STA timertemp
    JMP post5
    
post1:
    ; time is 4 minutes or greater
    
    LDA #4
    JSR PrintOnScreenTimerMinutes
    
    LDA leveltimer
    SEC 
    SBC #240
    STA timertemp
    JMP post5
        
post2:
    ; time is 3 minutes or greater
    LDA #3
    JSR PrintOnScreenTimerMinutes
    
    LDA leveltimer
    SEC 
    SBC #180
    STA timertemp
    JMP post5
    
post3:
    ; time is 2 minutes or greater

    LDA #2
    JSR PrintOnScreenTimerMinutes
    
    LDA leveltimer
    SEC 
    SBC #120
    STA timertemp
    JMP post5
    
post4:
    ; time is 1 minute or greater

    LDA #1
    JSR PrintOnScreenTimerMinutes
    
    LDA leveltimer
    SEC 
    SBC #60
    STA timertemp
    
post5:
    ; print the seconds component    
    
    LDA timertemp
    STA digittemp
    JSR Print2Digit
    
    LDA #CLOCKSECX 
    STA printnumbersx
    LDA #CLOCKSECY  
    STA printnumbersy
    
    JSR PrintNumbers

    RTS
    
; This prints the minute component. Minute gets passed in A   
PrintOnScreenTimerMinutes: 
    STA digittemp
    JSR Print2Digit
    
    LDA #CLOCKMINX
    STA printnumbersx
    LDA #CLOCKMINY 
    STA printnumbersy
    
    JSR PrintNumbers
    
    RTS
    
; This plays the appropriate in-game music (or silence if that is what was chosen)
PlayInGameMusic:

    LDA ingamemusic
    CMP #0
    BEQ pigm1
    CMP #1
    BEQ pigm3
    CMP #2
    BEQ pigm5
    JMP pigm7
pigm1:
    ; Theme A selected, now see if fast or slow
    LDA difficulty
    CMP #1
    BEQ pigm2
    
    LDA #song_index_Slow_Theme_A
    STA sound_param_byte_0
    JMP play_song         

pigm2:
    LDA #song_index_Fast_Theme_A
    STA sound_param_byte_0
    JMP play_song 
 
pigm3:
    ; Theme B selected, now see if fast or slow
    LDA difficulty
    CMP #1
    BEQ pigm4
    
    LDA #song_index_Slow_Theme_B
    STA sound_param_byte_0
    JMP play_song         

pigm4:
    LDA #song_index_Fast_Theme_B
    STA sound_param_byte_0
    JMP play_song  

pigm5:
    ; Theme C selected, now see if fast or slow
    LDA difficulty
    CMP #1
    BEQ pigm6
    
    LDA #song_index_Slow_Theme_C
    STA sound_param_byte_0
    JMP play_song         

pigm6:
    LDA #song_index_Fast_Theme_C
    STA sound_param_byte_0
    JMP play_song     

pigm7:
    JMP pause_song

; Routine to pick a new block. Holds this in next shape and makes currentshape the old value of nextshape
; levels 2,5,7 and 9 have extra shapes added
SelectNewPiece:
    LDA nextshape
    PHA ; save the nextshape to the stack, this will become currentshape
    
    LDA currentlevel
    CMP #$02
    BEQ snp2
    CMP #$05
    BEQ snp2
    CMP #$07
    BEQ snp2
    CMP #$09
    BEQ snp2
    
	; if get to here then using the standard set

	;this picks the random numbers when just using standard set
snp1:	
	JSR rnd
    AND #%00000111   ;bitmask bits 0, 1 and 2 
    CMP #$07
    BEQ snp1
    JMP snp3
    	
	; this picks the random numbers when using the extended set
snp2:	
	JSR rnd
	AND #15	;bitmask bits 0, 1, 2 and 3 (7 for standard set)
    CMP #12
    BEQ snp2
    CMP #13
    BEQ snp2
    CMP #14
    BEQ snp2
    CMP #15
    BEQ snp2
    		
snp3:	
    STA nextshape
	JSR DrawNextShape
	
    PLA
    STA currentshape    ; retrieve the previous next shape from the stack and make it the current shape
    
    LDA startx
    STA plx
    LDA starty
    STA ply
   
	; if upside down we need to update the starting y position
    LDA upsidedown
    CMP #$01
    BEQ snp5
    
    JMP snp6
    
snp5:
    LDA upsidedownstarty
    STA ply
	
snp6:	
	; reset allowed swap
    LDA #$01
    STA allowedswap
    
    ; now that we have picked the shape, we set its tile type
    
    LDX currentshape
    LDA tilenumlookuptable, x
    STA tilenum
	
snp7:
	; now check if end game
	LDA plx
    STA tmpx
    LDA ply
    STA tmpy
    
    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BEQ snp4
    
    ; the start position is not valid so its end game
	JMP GameOver
	
snp4:
    LDA #$00
    STA currentorientation
    JSR SetBlockShapes
    
	INC piecesplayedthislevel

	JSR LevelSpecialAction; this does the special action required per level (may not do anything)
    
    RTS
    
; This handles the swap piece functionality. A player is allowed swap once till a new shape is selected automatically
; by the drop process. We swap the current piece with the saved shape

SwapShape:
    LDA allowedswap
    CMP #0
    BNE ssh1
    RTS     ; allowedswap was set to 0, not currently allowed swap
    
ssh1:
    LDA #sfx_index_sfx_Store
    JSR PlaySoundEffect
    
    LDA #0
    STA allowedswap ; stop any more swapping of this shape
    
    LDA savedshape
    PHA     ; save the saved shape to the stack
		
    LDA currentshape
    STA savedshape	
	
	JSR DrawSavedShape
	
    PLA     ; get the saved shape from the stack
    STA currentshape    ; now we have swapped shapes
    
	LDA startx      ; swapped piece starts from the top of the screen
    STA plx
    LDA starty
    STA ply
    
	
	; if we are upside down we need to update the y position
    LDA upsidedown
    CMP #1
    BNE ssh4

ssh3:
	LDA upsidedownstarty
    STA ply
	
ssh4:	
    ; now that we have picked the shape, we set its tile type
    
    LDX currentshape
    LDA tilenumlookuptable, x
    STA tilenum
    
    LDA #$00
    STA currentorientation
    
    ; now check if end game
	LDA plx
    STA tmpx
    LDA ply
    STA tmpy
    
    ; player has swapped, but maybe the piece will not fit at the top of the screen (and thus game over)
    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BEQ ssh2
    
    ; the start position is not valid so its end game
	JMP GameOver
    	
ssh2:
	; ok, so we can draw the shape ok
    
    JSR SetBlockShapes
    
    JSR ShowAllShapes
    
    RTS
    
    
; This drops the piece down by one square if possible, if not possible then it starts a new piece	
AutoDropPiece:

    LDA upsidedown
    CMP #$01
    BEQ adp3
    
    LDA ply
    STA tmpy
    INC tmpy    ; we are trying to move down
    JMP adp4
	
adp3:
	; this is the section called if upside down
    LDA ply
    STA tmpy
    DEC tmpy    ; we are trying to move up (as we are upside down)
    
adp4:	
    LDA plx
    STA tmpx
    
    JSR CheckMove
    LDA allowedmove
    CMP #$00
    BEQ adp1    ; not possible to auto drop piece
    
    LDA upsidedown
    CMP #$01
    BEQ adp5    
    
    INC ply     ; move is valid so increment y
    JMP adp2
 
	
adp5:
    DEC ply     ; move is valid so decrement y (as upside down)	
	JMP adp2	
	

adp1:	
	; if we are here then it was not possible to drop the block, choose a new block
	; first we redraw back the piece then choose our new one
	; we also add to the score
	; Add 20 to the score.
    
    LDA #sfx_index_sfx_Lock_or_Move
    JSR PlaySoundEffect
    
    TYA
    PHA     ; push Y to the stack as we are going to overwrite it
    
    LDA #<score
    STA updatecountaddr
    LDA #>score
    STA updatecountaddr + 1
    
    LDY #4  ; the 10's column
    LDA #2
    STA increaseamount  ; 2 tens, increase score by 20
    JSR UpdateCount
    
    PLA
    TAY     ; restore Y from the stack

	JSR PrintScore		;print this new score
	   
    LDX plx
    LDY ply
    JSR ConvertShapeToBg
	
    JSR HideAllSprites  ; sprite has been converted to background, temporarily hide
	JSR CheckPlayArea	; see if a winning line (or lines) exists
    
	JSR SelectNewPiece
    
    ; we need to reset lastbuttonspressed - otherwise if someone has taps the down key just before the
    ; selectnewpiece routine is called, then the next piece will immediately fall down as it appears
    ; First we read from the controller (to clear anything cached), then we reset the values
    
    JSR ReadFromController1
    
    LDA #0
    STA lastbuttonspressed
    STA buttonspressed
	
adp2:
    JSR ShowAllShapes

	RTS    
 
; this draws the saved shape 
DrawSavedShape: 
    LDA #SAVEDSHAPEX
    STA tmpx
    LDA #SAVEDSHAPEY
    STA tmpy
    
    JSR ClearInfoArea
    
    ; we temporarily set blockshapes to be our saved shape
    LDA #$00
    STA blockpointer

    LDX savedshape
	CPX #$00
    BEQ dss1
    
    LDA blocklookuptable,x
    STA blockpointer
		
dss1:
    LDX blockpointer
    LDA shapedata, x
    STA blockshapes
    INX
    LDA shapedata, x
    STA blockshapes + 1 

    LDX savedshape
    LDA tilenumlookuptable, x
    STA tilenum
    
    ; so we have now successfully temporarily set blockshapes
    LDX #SAVEDSHAPEX
    LDY #SAVEDSHAPEY
    
    LDA #0      ; disable adding blocks to playarea buffer
    STA bufferaddactive
    
    JSR ConvertShapeToBg

    LDA #1      ; re-enable adding blocks to playarea buffer
    STA bufferaddactive
    
    RTS    
    
; this draws the next shape to be displayed
DrawNextShape:
    LDA #NEXTSHAPEX
    STA tmpx
    LDA #NEXTSHAPEY
    STA tmpy
    
    JSR ClearInfoArea
    
    ; we temporarily set blockshapes to be our nextshape
    LDA #$00
    STA blockpointer

    LDX nextshape
	CPX #$00
    BEQ dns1
    
    LDA blocklookuptable,x
    STA blockpointer
		
dns1:
    LDX blockpointer
    LDA shapedata, x
    STA blockshapes
    INX
    LDA shapedata, x
    STA blockshapes + 1 

    LDX nextshape
    LDA tilenumlookuptable, x
    STA tilenum
    
    ; so we have now successfully temporarily set blockshapes
    LDX #NEXTSHAPEX
    LDY #NEXTSHAPEY
    
    LDA #0      ; disable adding blocks to playarea buffer
    STA bufferaddactive
    
    JSR ConvertShapeToBg

    LDA #1      ; reenable adding blocks to playarea buffer
    STA bufferaddactive
    
    
    RTS
    
; this routine is called when the game is over
GameOver:

    LDA #song_index_Mission_Failed
    STA sound_param_byte_0
    JSR play_song  

    JSR WaitFrame
    JSR ClearScreen
    JSR HideAllSprites
    
    JSR CheckHighScore
    LDA newhighscore
    CMP #1
    BNE go1
    JSR SetHighScore
    JSR PrintNewHighScore

go1:    
    LDA #<gameoverlogo
    STA logoaddr
    LDA #>gameoverlogo
    STA logoaddr + 1
    
    JSR PrintWordsWithBlocks
    
    LDX #0
goloop1:
    TXA
    PHA
    JSR SmallDelay
    PLA
    TAX
    INX
    CPX #20
    BNE goloop1

    JMP TitleScreen
    
; this routine is called when the game has been won - well done player!
YouWin:
    JSR CheckHighScore
    LDA newhighscore
    CMP #1
    BEQ yw1
 
    LDA #song_index_Mission_Complete_1 
    JMP yw2
yw1:
    LDA #song_index_Mission_Complete_2    
yw2:  
    STA sound_param_byte_0
    JSR play_song 
    
    JSR WaitFrame
    JSR ClearScreen
    JSR HideAllSprites
    
    JSR CheckHighScore
    LDA newhighscore
    CMP #1
    BNE yw3
    JSR SetHighScore
    JSR PrintNewHighScore

yw3:    
    LDA #<youwinlogo
    STA logoaddr
    LDA #>youwinlogo
    STA logoaddr + 1
    
    JSR PrintWordsWithBlocks
    
    LDX #0
ywloop1:
    TXA
    PHA
    JSR SmallDelay
    PLA
    TAX
    INX
    CPX #20
    BNE ywloop1

    JMP TitleScreen    
    
; if there is a new high score, this routine prints the info on-screen
; this is used when game over (either lost or won)
PrintNewHighScore:

    LDA #<congratulations_str
    STA textprintaddr
    LDA #>congratulations_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen

    LDA #<new_high_score_str
    STA textprintaddr
    LDA #>new_high_score_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen

    TXA   
    PHA
    TYA
    PHA
    
    ; the high score is 6 chars in length
    
    LDX #0
    LDA #6
    STA bgbuf, x
    
    INX
    STX bgbufidx
    
    ; now write the PPU address
    
    LDX #NEWHIGHSCOREY
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    STX bgbufidx

    LDX #NEWHIGHSCOREY
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC #NEWHIGHSCOREX
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    
    LDA #<highscore
    STA textprintaddr
    LDA #>highscore
    STA textprintaddr + 1
    
    LDY #0
pnhs1:
    LDA (textprintaddr), y
    STA bgbuf, x
    INX
    INY
    CPY #6
    BNE pnhs1

     ; terminate the buffer
    LDA #0
    STA bgbuf, x   
    
    PLA
    TAY
    PLA
    TAX

    JSR CommitChange
    
    RTS
    
; this routine detects a winning line in the playarea. It checks the line defined in tmpy
; winningline will be set to 1 in the case of a winning line, otherwise 0
; Passes in line to check via Y register

CheckWinningLine:
    LDA #0
    STA winningline     ; winningline reset to 0
	
	; tmpy is already set, but set initial x value
    LDA #LEFTWALLX
    STA tmpx
    INC tmpx
    
    LDX #10 ;10 squares in width of play area

cwl1:
    TXA
    PHA     ; push the loop counter x to the stack
    
    LDX tmpx
    JSR AtAdd
    CMP #BLANKSPACE ; check is it is an empty square
    BEQ cwl2    ;square is empty, can return with winningline set to 0, not winning line

    INC tmpx
    
    PLA     ;pull back the loop counter from the stack
    TAX
    DEX
    CPX #0
    BNE cwl1
	
	; if get this far then winning line
    LDA #1
    STA winningline
    RTS

cwl2:
	; not a winning line, but need to tidy the stack, then exit
    PLA
    RTS  
    
    
; this is the routine that checks the playarea for all winning lines, adding to
; the players score, flash the lines temporarily and then deleting them and moving 
; the playarea down
CheckPlayArea:

    LDA #0
    STA rowscompleted
    
    ; we check all rows between (TOPYWHENUPSIDEDOWN + 1) and (BOTTOMY - 1)
    
    LDY #BOTTOMY
    DEY     ; start one up from very bottom of screen
    
cpa1:
    JSR CheckWinningLine
    LDA winningline
    CMP #0
    BEQ cpa2
    

;	call flashwinningline

    TYA
    PHA     ; push Y to the stack as we are going to overwrite it
    
    LDA #<score
    STA updatecountaddr
    LDA #>score
    STA updatecountaddr + 1
    
    LDY #4  ; the 10's column
    LDA #5
    STA increaseamount  ; 5 tens, increase score by 50
    JSR UpdateCount
    
    LDY #3  ; the 100's column
    LDA #2
    STA increaseamount  ; 2 hundreds, increase score by 200, so overall by 250
    JSR UpdateCount

    PLA
    TAY     ; restore Y from the stack

	JSR PrintScore		;print this new score

    INC rowscompleted
    LDA rowscompleted
    CMP #4      ; bonus points for 4 rows together (+1000 score)
    BNE cpa2
    
    TYA
    PHA     ; push Y to the stack as we are going to overwrite it
    
    LDA #<score
    STA updatecountaddr
    LDA #>score
    STA updatecountaddr + 1
    
    LDY #2  ; the 1000's column
    LDA #1
    STA increaseamount  ; 1 thousand, increase score by 1000, bonus for 4 lines together
    JSR UpdateCount
    
    PLA
    TAY     ; restore Y from the stack

	JSR PrintScore		;print this new score
    		
cpa2:
    DEY
    CPY #TOPYWHENUPSIDEDOWN 
    BNE cpa1

	; now update the lines or bombs completed
    
    LDA currentlevel
    CMP #6
    BEQ cpa2a   ; we skip adding the total as level 6 works differently   
   
    LDA totalrowscompletednum
    CLC
    ADC rowscompleted
    STA totalrowscompletednum
    
cpa2a:    
    ; now print the new lines completed number
    
    JSR PrintLinesOrBombsCompleted
    
	; if any winning lines need to now remove
    LDA rowscompleted
    CMP #0
    BEQ cpa10       ; if no rows completed we can exit this routine

    ; There are winning rows, we need to remove them and drop the play area as appropriate
    ; First we save the value of tilenum as its value will be overwritten
     
    LDA tilenum
    PHA     ; save it to the stack
    
    LDA upsidedown
    CMP #1
    BEQ cpa6
	

    LDY #BOTTOMY
    DEY     ; start one up from very bottom of screen    
cpa4:
    JSR CheckWinningLine
    LDA winningline
    CMP #0
    BEQ cpa5    ; if not a winning line then skip EraseLine
    
    JSR EraseLine
    
	JSR DropPlayArea

    
	; we now need to add 1 to Y to ensure we check/delete all winning lines. Effectively the
    ; DEY at the end of the loop means we will recheck this Y value as possibly a winning line 
    ; has dropped down to here
    
    INY
  

cpa5:
    DEY
    CPY #TOPYWHENUPSIDEDOWN 
    BNE cpa4
	
    ; all the winning lines have been removed from our playarea buffer
    ; now we redraw the playarea based on this buffer
    JSR ClearedLineNoise
    JSR DrawPlayAreaFromBuffer
        
    ; we can now retrieve the value of tilenum from the stack
    PLA
    STA tilenum
    
    ; if this is level 6 then we need to calculate number of bombs remaining
    
    LDA currentlevel
    CMP #6
    BNE cpa5a
    
    JSR CalculateNumBombsFound
    JSR PrintLinesOrBombsCompleted
    
cpa5a:    
    RTS
	
	
cpa6:
    LDY #TOPYWHENUPSIDEDOWN
    INY     ; start one up from very bottom of screen    
cpa7:
    JSR CheckWinningLine
    LDA winningline
    CMP #0
    BEQ cpa8    ; if not a winning line then skip EraseLine
    JSR EraseLine

	JSR UpsideDownDropPlayArea
	; we now need to decrement 1 from Y to ensure we check/delete all winning lines. Effectively the
    ; INY in the below loop means we will recheck this Y value as possibly a winning line 
    ; has dropped down to here
    
    DEY
  

cpa8:
    INY
    CPY #BOTTOMY 
    BNE cpa7
	
    ; all the winning lines have been removed from our playarea buffer
    ; now we redraw the playarea based on this buffer
    JSR ClearedLineNoise
    JSR DrawPlayAreaFromBuffer

    ; we can now retrieve the value of tilenum from the stack
    PLA
    STA tilenum

cpa10:
    RTS
    
; this calculates the number of bombs found. It does this by checking every square in 
; the playarea and counting the number of bombs in the playarea, it then subtracts this
; from BOMBSONLEVEL6 and puts the result in bombsfound

CalculateNumBombsFound:
    LDA #0
    STA activebombs

    LDX #0
cnbfloop:
    LDA playareabuf,x
    CMP #BOMBTILE
    BEQ cnbf1
    JMP cnbf2
cnbf1:
    INC activebombs
cnbf2:    
    INX
    CPX #240
    BNE cnbfloop
    
    ; at this stage we know the number of bombs left (activebombs)
    
    LDA #BOMBSONLEVEL6
    SEC 
    SBC activebombs
    
    STA bombsfound
    CMP bombsfoundpreviouscount
    BEQ cnbf3

    ; bombsfound does not equal bombsfoundpreviouscount, therefore a bomb has been found, play sound effect
;    LDA #sfx_index_sfx_GoodClear_or_Defuse
;    JSR PlaySoundEffect
    
cnbf3:    
    ; now sync bombsfoundpreviouscount before returning
    LDA bombsfound
    STA bombsfoundpreviouscount
    RTS
    
; this makes the sound when a line or lines are being removed
ClearedLineNoise:

    LDA rowscompleted
    CMP #1
    BEQ cln1
    CMP #2
    BEQ cln2    
    CMP #3
    BEQ cln3
    CMP #4
    BEQ cln4
    RTS ; should be one of the values, but return if not

cln1:
    LDA #sfx_index_sfx_Clearx1
    JMP cln5
cln2:
    LDA #sfx_index_sfx_Clearx2
    JMP cln5    
cln3:
    LDA #sfx_index_sfx_Clearx3
    JMP cln5
cln4:
    LDA #sfx_index_sfx_NotTetris
cln5:
    JMP PlaySoundEffect
  
; this plays a sound effect - requires A to have been set with the sound effect to play
PlaySoundEffect:
    STA sound_param_byte_0
    LDA #soundeffect_two
    STA sound_param_byte_1
    JSR play_sfx
    RTS   
    
; drawplayareafrombuffer is used when we wish to redraw the entire playarea. The playarea buffer
; contains the (new) playarea we wish to draw

DrawPlayAreaFromBuffer:
    LDA #$00    ; reset the index into the background buffer
    STA bgbufidx
    
	LDA upsidedown
	CMP #1
	BEQ dpafb1

    LDY #BOTTOMY
    DEY     ; start one up from very bottom of screen
    JMP dpafb2
	
dpafb1:
	LDY #TOPYWHENUPSIDEDOWN
    INY     ; start one down from very top of screen (as we are upside down)

dpafb2:
    LDX #LEFTWALLX
    INX
    
    STX tmpx
    STY tmpy
    
    LDX bgbufidx
    
    LDA #10    ; adding 10 blocks
    STA bgbuf, x
    
    ; there are 32 bytes per row, and a max of 30 rows
    
    LDX tmpy
    LDA ppu_lookup1, x
    
    INC bgbufidx 
    LDX bgbufidx
    STA bgbuf, x

    LDX tmpy
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC tmpx
    
    INC bgbufidx
    LDX bgbufidx
    STA bgbuf, x


dpafb3:
    LDX tmpx
    LDY tmpy
    JSR AtAdd
    INC bgbufidx
    LDX bgbufidx
    STA bgbuf, x
    
    INC tmpx
    LDX tmpx
    CPX #RIGHTWALLX

    BNE dpafb3
    
    ; write 0 at end of bgbuf so write routine knows this is end of data to be written
    
    INC bgbufidx
    LDX bgbufidx
    LDA #0
    STA bgbuf, x   

    JSR CommitChange    ; writes the changes and resets bgbufidx to 0

	LDA upsidedown
	CMP #1
	BEQ dpafb4
    
    DEC tmpy
    LDY tmpy
    CPY #TOPYWHENUPSIDEDOWN-1
    BNE dpafb2  
	
	JMP dpafb5

dpafb4:
	INC tmpy
	LDY tmpy  
    CPY #BOTTOMY+1
	BNE dpafb2

dpafb5:	    	
    RTS
    
    
; after we build up a buffer of background changes to write we commit those changes
CommitChange:
    LDA #$01
    STA bgupdaterequired
    ; wait for background change to be done by NMI
cc1:
    LDA bgupdaterequired
    CMP #$00
    BNE cc1
    
    LDA #$00    ; reset the index into the background buffer
    STA bgbufidx
    
    RTS
    
    
    
; eraseline is used for clearing the playarea at the start of every level and is used
; during process for handling winning lines. Register Y is passed in (line to erase)
; Note that this routine overwrites the value in tilenum

EraseLine:

    ; we first need to push X and Y to the stack so we can safely use them
    TXA   
    PHA
    TYA
    PHA

    LDA #BLANKSPACE
    STA tilenum

    LDX #LEFTWALLX
    INX
    
el1:
    JSR AddBlockToPlayAreaBuffer
    
    INX
    CPX #RIGHTWALLX
    BNE el1
    
    PLA     ; now pull back X and Y from the stack
    TAY
    PLA
    TAX
    
	RTS    

; move playarea down. When we get a winning line, we remove the winning line and this routine
; drops the playarea above that line down
; we pass in Y register which is the winning line (drop everything above this)
DropPlayArea:

    ; we first need to push X and Y to the stack so we can safely use them
    TXA   
    PHA
    TYA
    PHA

    DEY
dpa1:
    LDX #LEFTWALLX
    INX
dpa2:
    JSR AtAdd
    STA tilenum
    INY
    JSR AddBlockToPlayAreaBuffer
    DEY
    INX
    CPX #RIGHTWALLX
    BNE dpa2
    DEY
    CPY #TOPYWHENUPSIDEDOWN-1
    BNE dpa1    
    	
	; at this stage we have dropped everything, now just need to erase the top line
	
	JSR EraseTopLine
    
    PLA     ; now pull back X and Y from the stack
    TAY
    PLA
    TAX
    
    RTS
    
; move playarea up (as we are upside down). When we get a winning line, we remove the 
; winning line and this routine drops the playarea below that line up
; we pass in Y register which is the winning line (drop everything below this)
UpsideDownDropPlayArea:

    ; we first need to push X and Y to the stack so we can safely use them
    TXA   
    PHA
    TYA
    PHA

    INY
udpa1:
    LDX #LEFTWALLX
    INX
udpa2:
    JSR AtAdd
    STA tilenum
    DEY
    JSR AddBlockToPlayAreaBuffer
    INY
    INX
    CPX #RIGHTWALLX
    BNE udpa2
    INY
    CPY #BOTTOMY+1
    BNE udpa1    
    	
	; at this stage we have dropped everything, now just need to erase the top line
	
	JSR EraseTopLine
    
    PLA     ; now pull back X and Y from the stack
    TAY
    PLA
    TAX
    
    RTS    
    
; this routine is used to erase the top line of the play area. We need this code
; as when we move everything down a line after a winning line, we need to clear the top line

EraseTopLine:
    LDA upsidedown
    CMP #1
    BEQ etl2
    
    LDY #TOPYWHENUPSIDEDOWN
    JSR EraseLine
    RTS
   
etl2:
    LDY #BOTTOMY
    JSR EraseLine
    RTS	
    
; routine used to update a count. Used to update the score
; Y is passed in as the digit to update 
; The increaseamount variable is the amount to increase it by (value between 0 and 9)
UpdateCount: 

    LDA (updatecountaddr), y    ; current value of digit.
    CLC
    ADC increaseamount
    STA (updatecountaddr), y    ; place new digit back in string.
    CMP #58                     ; compare to 58 >= than ASCII value '9'?
    BCS uc1
    RTS             ; was not >= 58 so can return
uc1:
    SEC
    SBC #10         ; subtract 10
    STA (updatecountaddr), y    ; put new character back in string
uc2:
    DEY     ; decrement y, go one left
    LDA (updatecountaddr), y
    CLC
    ADC #1
    STA (updatecountaddr), y
    CMP #58 
    BCS uc1   
    RTS 
	
; moves the block right if allowed. 
MoveRight:
 
    LDA ply
    STA tmpy
    LDA plx
    STA tmpx    ; we are trying to move right
    INC tmpx 

    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BNE mr1
    
    INC plx
    JSR ShowAllShapes

mr1:    
    RTS

; moves the block left if allowed. 
MoveLeft:
 
    LDA ply
    STA tmpy
    LDA plx
    STA tmpx    ; we are trying to move left
    DEC tmpx 

    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BNE ml1
    
    DEC plx  
    JSR ShowAllShapes

ml1:    
    RTS
    
; rotates the shape anticlockwise if allowed. 
MoveAntiClockwise:

	INC currentorientation
	LDA currentorientation
	CMP #$04	;if 4 then need to set to 0 (as max value for currentorientation is 3)
    BNE mac1
	LDA #$00
    STA currentorientation
mac1:

	JSR SetBlockShapes
	
    LDA ply
    STA tmpy
    LDA plx
    STA tmpx

    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BEQ mac4
    
	; move is not valid so need to reset blockpointer and blockshapes
    LDA currentorientation
    CMP #$00
    BNE mac2
    LDA #$03
    STA currentorientation
    JMP mac3
mac2:
    DEC currentorientation
mac3:
    JSR SetBlockShapes
    JMP mac5
    
mac4:
    JSR ShowAllShapes
mac5:    
	
	RTS  
    
; rotates the shape clockwise if allowed. 
MoveClockwise:

	LDA currentorientation
	CMP #$00	;if 0 then need to set to 3 (as max value for currentorientation is 3)
    BNE mc1
	LDA #$04     ; we set to 4 instead of 3 as the first action in mc1 is to decrement
    STA currentorientation
mc1:
    DEC currentorientation
	JSR SetBlockShapes
	
    LDA ply
    STA tmpy
    LDA plx
    STA tmpx

    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BEQ mc4
    
	; move is not valid so need to reset blockpointer and blockshapes
    LDA currentorientation
    CMP #$03
    BNE mc2
    LDA #$00
    STA currentorientation
    JMP mc3
mc2:
    INC currentorientation
mc3:
    JSR SetBlockShapes
    JMP mc5
    
mc4:
    JSR ShowAllShapes
mc5:    
	
	RTS   

; this swaps the ghost setting from active to inactive (and vice versa)

ChangeGhostSetting:
    LDA #sfx_index_sfx_Ghost
    JSR PlaySoundEffect
    
    LDA ghostactive
    CMP #0
    BNE cgs1
	
	; ghost is currently off, switch it on
    LDA #1
    STA ghostactive
    
    JSR ShowAllShapes
    
    JSR PrintGhostSetting
    
	RTS
		
cgs1:
	; ghost is currently on, switch it off
    LDA #0
    STA ghostactive
    
    JSR ShowAllShapes
    
    JSR PrintGhostSetting
		
	RTS   
    
; this prints the current ghost setting (on or off)
PrintGhostSetting:
    LDA ghostactive
    CMP #1
    BEQ pgs1

    ; ghost is currently off
    LDA #<ghost_off_str
    STA textprintaddr
    LDA #>ghost_off_str
    STA textprintaddr + 1
    JMP pgs2
    
pgs1:
    ; ghost is currently on
    LDA #<ghost_on_str
    STA textprintaddr
    LDA #>ghost_on_str
    STA textprintaddr + 1
 
pgs2: 
    JSR WriteTextToScreen
    
    RTS
    
; this drops the piece when in mixture drop mode and drop key has been tapped
; this routine is called if no buttons have been pressed
; so will only do a full drop if dropmethod is 2, last button pressed was down (drop key)
; and dropbuttonpresscount is 1 (so only a quick tap)

DropPieceIfTapped:
	; check dropmethod and lastbuttonspressed and dropbuttonpresscount
    LDA dropmethod
    CMP #2
    BNE dpit4   ; if not mixture drop method quit here immediately
    
    ; now we check if the button corresponding to drop was the last button pressed
    
    LDA controlleroption
    CMP #1
    BEQ dpit1
    
    LDA lastbuttonspressed 
    AND #%00000100  ; check if down button was last button pressed 
    CMP #$00    
    BEQ dpit4   ; if 0 then down button was not last pressed, so out of here
    JMP dpit2
    
dpit1:
    ; this is the check we do if using the alternate controls, where A button corresponds to drop
    LDA lastbuttonspressed 
    AND #%10000000   ; check if A button was last button pressed 
    CMP #$00    
    BEQ dpit4   ; if 0 then down button was not last pressed, so out of here    
    
dpit2:
    LDA dropbuttonpresscount
    CMP #1
    BNE dpit4
dpit3:
    LDA #1
    STA fulldropactive
    JSR DropPiece
    JSR SmallDelay
dpit4:
    RTS
 

; moves the block down one square if allowed. 
DropPieceOneSquare:
    LDA ply
    STA tmpy
    LDA plx
    STA tmpx

    LDA upsidedown
    CMP #1
    BEQ dpo1
    
    INC tmpy ; going down one square
	
    JMP dpo2
dpo1:
    DEC tmpy    ; going up one square (we are upside down)
    
dpo2:

    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BNE dpo5    ; that move is not valid
    
    ; if here then the move is valid, so do it now
    LDA upsidedown
    CMP #1
    BEQ dpo3
    
    INC ply
    JMP dpo4
dpo3:    
    DEC ply

dpo4:
    JSR ShowAllShapes
	
	; reset the automatic drop timing - we do this as otherwise we would get occasional piece dropping
	; down 2 spaces
    LDA frameTimer
    STA pretim

dpo5:	
	RTS	
 
;this drops the piece, either by 1 square or till it cannot go any further
DropPiece:
    LDA dropmethod
    CMP #0
    BEQ DropPieceFull
    CMP #1
    BEQ DropPieceOneSquare

	; we are not 0 or 1 so using a mixture - check for fulldropactive
    LDA fulldropactive
    CMP #0
    BEQ DropPieceOneSquare
    
	; if here then using mixture dropmethod and full drop has been requested
    LDA #0
    STA fulldropactive

	JMP DropPieceFull    
	    
; drop the piece till it cannot go any further
; this is a loop, the exit being when no more moves are available

DropPieceFull:
    
    LDA ply
    STA tmpy
    LDA plx
    STA tmpx
    
    LDA upsidedown
    CMP #1
    BEQ dpf1

    INC tmpy    ; going down one square
    JMP dpf2
	
dpf1:
    DEC tmpy    ; we are trying to move up (as upside down)
dpf2:

    JSR CheckMove
    LDA allowedmove
    CMP #$01
    BNE dpf5    ; that move is not valid
    
    ; if here then the move is valid, so do it now
    LDA upsidedown
    CMP #1
    BEQ dpf3
    
    INC ply
    JMP dpf4
dpf3:    
    DEC ply

dpf4:
    JSR ShowAllShapes
    
    ;call delay loop with small value to make the drop seem less sudden, but still a very fast drop
    LDX #$8
    JSR ActualDelay

    	
	; we get bonus points for dropping, 5 points per square dropped
    TYA
    PHA     ; push Y to the stack as we are going to overwrite it
    
    LDA #<score
    STA updatecountaddr
    LDA #>score
    STA updatecountaddr + 1
    
    LDY #5  ; the 1's column
    LDA #5
    STA increaseamount  ; 5 ones, increase score by 5
    JSR UpdateCount
    
    PLA
    TAY     ; restore Y from the stack

	JSR PrintScore		;print this new score
    
	JMP DropPieceFull   ; we are jumping to ourselves as we keep going till not possible to drop anymore

dpf5:
    RTS

;setblockshapes uses the currentorientation and currentshape to set the
; value of blockshapes i.e. the exact block to draw
SetBlockShapes:
    LDA #$00
    STA blockpointer

    LDX currentshape
	CPX #$00
    BEQ sbs1
    
    LDA blocklookuptable,x
    STA blockpointer
	
sbs1:
    LDX currentorientation
    ; for each orientation possibility we have to skip 2 bytes
    CPX #$00
    BEQ sbs2
    
sbsloop1:
    INC blockpointer
    INC blockpointer
    DEX
    CPX #$00
    BNE sbsloop1
	
sbs2:
    LDX blockpointer
    LDA shapedata, x
    STA blockshapes
    INX
    LDA shapedata, x
    STA blockshapes + 1     
    
    RTS
    

; this activates the relevant sprite on-screen
ActivateSprite:
    PHA     ; push A to the stack
    LDA spriteindex
    CMP #$00
    BNE as1
    
    LDA #$01
    STA spriteindex
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $0200
    LDA tilenum
    STA $0201
    LDA tmpx
    STA $0203   
    JMP as5
as1:
    CMP #$01
    BNE as2
    
    LDA #$02
    STA spriteindex
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $0204
    LDA tilenum
    STA $0205    
    LDA tmpx
    STA $0207   
    
    JMP as5
as2:
    CMP #$02
    BNE as3
    
    LDA #$03
    STA spriteindex
    
    LDA #$01
    STA sprite3active
    
    JSR ConvertToPixels 
    
    LDA tmpy
    STA $0208
    LDA tilenum
    STA $0209    
    LDA tmpx
    STA $020B
    
    JMP as5
as3:
    CMP #$03
    BNE as4
    
    LDA #$04
    STA spriteindex
    
    LDA #$01
    STA sprite4active
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $020C
    LDA tilenum
    STA $020D    
    LDA tmpx
    STA $020F
    
    JMP as5
as4:
    CMP #$04
    BNE as5
    
    LDA #$05
    STA spriteindex
    
    LDA #$01
    STA sprite5active
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $0210
    LDA tilenum
    STA $0211    
    LDA tmpx
    STA $0213
    
    JMP as5
as5:
    PLA     ; pop A from the stack  
    RTS
    
    
; this activates the relevant ghost sprite on-screen
ActivateGhostSprite:
    PHA     ; push A to the stack
    LDA ghostspriteindex
    CMP #$00
    BNE ags1
    
    LDA #$01
    STA ghostspriteindex
    
    LDA #$01
    STA ghostsprite1active
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $0214
    LDA #$03
    STA $0215
    LDA tmpx
    STA $0217   
    JMP ags5
ags1:
    CMP #$01
    BNE ags2
    
    LDA #$02
    STA ghostspriteindex
    
    LDA #$01
    STA ghostsprite2active
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $0218
    LDA #$03
    STA $0219    
    LDA tmpx
    STA $021B   
    
    JMP ags5
ags2:
    CMP #$02
    BNE ags3
    
    LDA #$03
    STA ghostspriteindex
    
    LDA #$01
    STA ghostsprite3active
    
    JSR ConvertToPixels 
    
    LDA tmpy
    STA $021C
    LDA #$03
    STA $021D    
    LDA tmpx
    STA $021F
    
    JMP ags5
ags3:
    CMP #$03
    BNE ags4
    
    LDA #$04
    STA ghostspriteindex
    
    LDA #$01
    STA ghostsprite4active
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $0220
    LDA #$03
    STA $0221    
    LDA tmpx
    STA $0223
    
    JMP ags5
ags4:
    CMP #$04
    BNE ags5
    
    LDA #$05
    STA ghostspriteindex
    
    LDA #$01
    STA ghostsprite5active
    
    JSR ConvertToPixels
    
    LDA tmpy
    STA $0224
    LDA #$03
    STA $0225    
    LDA tmpx
    STA $0227
    
    JMP ags5
ags5:
    PLA     ; pop A from the stack  
    RTS    
    
; this converts the location on screen to the pixel location
; it assumes registers x and y have been set and puts the result in
; tmpx and tmpy 

ConvertToPixels:

    ; convert tmpx to pixel position by multiplying by 8
    TXA
    ASL A
    ASL A
    ASL A
    STA tmpx
    
    TYA
    ASL A
    ASL A
    ASL A
    STA tmpy
    
    ; according to technical documentation, sprite data is delayed by one scanline
    ; therefore I need to subtract 1 from the sprite's Y coordinate
    DEC tmpy
    
    RTS
    
; we set up to 5 sprites, but it is possible that depending on the shape
; that not all the sprites are being used. In this case we deactivate the sprite
; by setting its coordinates to x = 0, y = F0

HideUnusedSprites:

    LDA sprite3active
    CMP #$01
    BEQ hus1
    
    ; if here then sprite 3 is not active
    LDA #$F0
    STA $0208
    LDA #$00
    STA $020B   
hus1:
    LDA sprite4active
    CMP #$01
    BEQ hus2
    
    ; if here then sprite 4 is not active
    LDA #$F0
    STA $020C
    LDA #$00
    STA $020F
hus2:
    LDA sprite5active
    CMP #$01
    BEQ hus3
    
    ; if here then sprite 5 is not active
    LDA #$F0
    STA $0210
    LDA #$00
    STA $0213
hus3:
    LDA ghostsprite1active
    CMP #$01
    BEQ hus4
    
    ; if here then ghost sprite 1 (sprite 6) is not active
    LDA #$F0
    STA $0214
    LDA #$00
    STA $0217
hus4:
    LDA ghostsprite2active
    CMP #$01
    BEQ hus5
    
    ; if here then ghost sprite 2 (sprite 7) is not active
    LDA #$F0
    STA $0218
    LDA #$00
    STA $021B    
hus5:
    LDA ghostsprite3active
    CMP #$01
    BEQ hus6
    
    ; if here then ghost sprite 3 (sprite 8) is not active
    LDA #$F0
    STA $021C
    LDA #$00
    STA $021F 
hus6:    
    LDA ghostsprite4active
    CMP #$01
    BEQ hus7
    
    ; if here then ghost sprite 4 (sprite 9) is not active
    LDA #$F0
    STA $0220
    LDA #$00
    STA $0223
hus7:
    LDA ghostsprite5active
    CMP #$01
    BEQ hus8
    
    ; if here then ghost sprite 5 (sprite 10) is not active
    LDA #$F0
    STA $0224
    LDA #$00
    STA $0227
hus8:
    RTS
 

; this is where we calculate the ghost x and y position
; we do this by first offsetting till no collision (against the actual current shape)
; then dropping down till we hit the top of the already placed pieces
CalculateGhostPosition:

	; copy the player x and y to the tmp x and y
    LDA plx
    STA tmpx
    LDA ply
    STA tmpy
	
    ; the currentshape works as an offset into the ghostlookuptable
	LDX currentshape
    LDA ghostlookuptable, x
    STA ghostpointer
   
    CLC
    ADC currentorientation
    STA ghostpointer    ; ghostpointer now has correct index to ghostoffset
    
    LDX ghostpointer
    LDA ghostoffset,x
    TAX
    
    LDA upsidedown
    CMP #$01
    BEQ cgp5
   
   ; we add the minimum offset required for the ghost to tmpy (current player y position)
   ; if equal to or more than BOTTOMY then we exit (cannot show ghost)
    TXA
    CLC
    ADC tmpy 
    
    CMP #BOTTOMY
    BEQ cgp2
    CMP #BOTTOMY + 1
    BEQ cgp2
    CMP #BOTTOMY + 2
    BEQ cgp2
    CMP #BOTTOMY + 3
    BEQ cgp2
    
    ; looks ok, store value in tmpy so we are checking from correct start position
    STA tmpy
    
    JMP cgp1
    
    
cgp5:
    ; this is if we are upside down. Basic sanity check that our y is not equal to or less than
    ; TOPYWHENUPSIDEDOWN
    
    STX calcghosttemp   ; store the offset in our temp variable
    LDA tmpy
    SEC
    SBC calcghosttemp
    
    CMP #TOPYWHENUPSIDEDOWN
    BEQ cgp2
    CMP #TOPYWHENUPSIDEDOWN - 1
    BEQ cgp2
    CMP #TOPYWHENUPSIDEDOWN - 2
    BEQ cgp2
    CMP #$FF
    BEQ cgp2  

    ; looks ok, store value in tmpy so we are checking from correct start position
    STA tmpy    
    
cgp1:
	; we have gone the minimum distance required by the ghost offset
	; we check if there is an immediate collision, if there is, we exit	
	
    JSR CheckMove
    LDA allowedmove
    CMP #$00
    BNE cgp3    ; if no collision then determine ghost location
    
				
cgp2:
	; if in here this not possible to determine ghost x and y, set the ghostshowing to 0
    LDA #$00
    STA ghostshowing
    RTS

cgp3:
	; if here then found empty space, now keep dropping, this will be where the ghost shape will be shown
    LDA upsidedown
    CMP #$01
    BEQ cgp6
    
    INC tmpy
    JMP cgp7
    
cgp6:
    DEC tmpy    ; as we are upside down
    	
cgp7:	
	JSR CheckMove
    LDA allowedmove
    CMP #$00
    BNE cgp3
    
cgp4:
	; if we are here then have found the top of the place pieces, allocate ghost x and y
    LDA upsidedown
    CMP #$01
    BEQ cgp8
    
    DEC tmpy    ; we decrement one as we had gone one too far with previous loop
    LDA tmpy
    STA ghosty
    JMP cgp9
    
cgp8:
    INC tmpy    ; we increment one as we had gone one too far with previous loop
    LDA tmpy
    STA ghosty
    	
cgp9:	
    LDA tmpx
    STA ghostx

    LDA #$01
    STA ghostshowing
			
	RTS	 

; this draws the ghost shape. It only draws if ghost is active
; and if calculateghostposition determines it is possible/safe to draw
ShowGhostShape:
    LDA ghostactive
    CMP #$00
    BEQ sgs2    ; if equal to 0 (ghost not active) then exit
   
sgs1:	
	JSR CalculateGhostPosition
	; now determine if possible to show ghost
    LDA ghostshowing
    CMP #$00
    BEQ sgs2    ; jump to sgs2 (returns) if not possible to show ghost
    
    LDA ghostx
    STA tmpx
    LDA ghosty
    STA tmpy
    
    ; need to pass/set ghost colour as well
    
    LDA #$01
    STA drawingghost    ; so showshape knows we are drawing the ghost
    
	JSR ShowShape
sgs2:
    RTS
    

; showallshapes shows both the main shape in play and the ghost if that is active ( and if it can be shown)
; when called plx and ply have the correct position for the piece
ShowAllShapes:

    ; first we reset any variables used
    LDA #$00
    STA sprite3active
    STA sprite4active
    STA sprite5active
    STA spriteindex
    STA ghostsprite1active
    STA ghostsprite2active
    STA ghostsprite3active
    STA ghostsprite4active
    STA ghostsprite5active
    STA ghostspriteindex
    STA drawingghost
    
    LDA plx
    STA tmpx
    LDA ply
    STA tmpy
    
    JSR ShowShape   ; draw main player sprite
    
    JSR ShowGhostShape
    
    JMP HideUnusedSprites ; hideunusedsprites has an RTS so just use JMP here


; showshape draws a shape on screen, it is passed a tmpx and tmpy
; The colour used is passed in as drawcolour
; It draws the shape pointed to in blockshapes

ShowShape:  
        
    LDX tmpx
    LDY tmpy    ; instead of referring to tmpx and tmpy through this routine, we copy the values to x and y registers and use those

    LDA blockshapes
    AND #%10000000 
    BEQ ss1
    
    JSR DrawBlock

ss1:
    INX
    LDA blockshapes
    AND #%01000000 
    BEQ ss2
    
    JSR DrawBlock 
ss2:
    INX
    LDA blockshapes
    AND #%00100000 
    BEQ ss3
    
    JSR DrawBlock  
ss3:
    INX
    LDA blockshapes
    AND #%00010000 
    BEQ ss4
    
    JSR DrawBlock  
ss4:    
    INY
    LDA blockshapes
    AND #%00000001 
    BEQ ss5
    
    JSR DrawBlock  
ss5:
    DEX
    LDA blockshapes
    AND #%00000010 
    BEQ ss6
    
    JSR DrawBlock 
ss6:
    DEX
    LDA blockshapes
    AND #%00000100 
    BEQ ss7
    
    JSR DrawBlock    
ss7:    
    DEX
    LDA blockshapes
    AND #%00001000 
    BEQ ss8
    
    JSR DrawBlock
ss8:
    INY
    LDA blockshapes+1
    AND #%10000000 
    BEQ ss9
    
    JSR DrawBlock
ss9:
    INX
    LDA blockshapes+1
    AND #%01000000 
    BEQ ss10
    
    JSR DrawBlock
ss10:
    INX
    LDA blockshapes+1
    AND #%00100000 
    BEQ ss11
    
    JSR DrawBlock
ss11:
    INX
    LDA blockshapes+1
    AND #%00010000 
    BEQ ss12
    
    JSR DrawBlock 
ss12:
    INY
    LDA blockshapes+1
    AND #%00000001 
    BEQ ss13
    
    JSR DrawBlock
ss13:
    DEX
    LDA blockshapes+1
    AND #%00000010 
    BEQ ss14
    
    JSR DrawBlock
ss14:
    DEX
    LDA blockshapes+1
    AND #%00000100 
    BEQ ss15
    
    JSR DrawBlock
ss15:
    DEX
    LDA blockshapes+1
    AND #%00001000 
    BEQ ss16
    
    JSR DrawBlock
ss16:
    RTS
    

; drawblock
; this calls the relevant routine, either activatesprite or activateghostsprite
DrawBlock:
    LDA drawingghost
    CMP #$01
    BEQ db1
    
    JSR ActivateSprite
    RTS
db1:
    JSR ActivateGhostSprite
    RTS

; this prints the score
PrintScore:
    TXA   
    PHA
    TYA
    PHA
    
    ; the score is 6 chars in length
    
    LDX #0
    LDA #6
    STA bgbuf, x
    
    INX
    STX bgbufidx
    
    ; now write the PPU address
    
    LDX #SCOREY
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    STX bgbufidx

    LDX #SCOREY
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC #SCOREX
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    
    LDA #<score
    STA textprintaddr
    LDA #>score
    STA textprintaddr + 1
    
    LDY #0
ps1:
    LDA (textprintaddr), y
    STA bgbuf, x
    INX
    INY
    CPY #6
    BNE ps1

     ; terminate the buffer
    LDA #0
    STA bgbuf, x   
    
    PLA
    TAY
    PLA
    TAX

    JSR CommitChange
    RTS    

; this prints the high score
PrintHighScore:
    TXA   
    PHA
    TYA
    PHA
    
    ; the high score is 6 chars in length
    
    LDX #0
    LDA #6
    STA bgbuf, x
    
    INX
    STX bgbufidx
    
    ; now write the PPU address
    
    LDX #HIGHSCOREY
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    STX bgbufidx

    LDX #HIGHSCOREY
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC #HIGHSCOREX
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    
    LDA #<highscore
    STA textprintaddr
    LDA #>highscore
    STA textprintaddr + 1
    
    LDY #0
phs1:
    LDA (textprintaddr), y
    STA bgbuf, x
    INX
    INY
    CPY #6
    BNE phs1

     ; terminate the buffer
    LDA #0
    STA bgbuf, x   
    
    PLA
    TAY
    PLA
    TAX

    JSR CommitChange
    RTS    
    
; this prints the 2 digits on-screen that have been generated by print2digit
; the co-ords to print them are set using printnumbersx and printnumbersy
PrintNumbers:
    TXA   
    PHA
    TYA
    PHA
    
    ; the digits to print are 2 chars length
    
    LDX #0
    LDA #2
    STA bgbuf, x
    
    INX
    STX bgbufidx
    
    ; now write the PPU address
    
    LDX printnumbersy
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    STX bgbufidx

    LDX printnumbersy
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC printnumbersx
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    
    LDA digitprint
    CLC
    ADC #48 ; to convert it to ascii
    STA bgbuf, x
    INX
    LDA digitprint + 1
    CLC
    ADC #48    
    STA bgbuf, x
    INX    
    
    ; terminate the buffer
    LDA #0
    STA bgbuf, x   
    
    PLA
    TAY
    PLA
    TAX

    JSR CommitChange
    RTS        
        
; this routine writes text on screen
WriteTextToScreen:
    ; we first need to push X and Y to the stack so we can safely use them
    TXA   
    PHA
    TYA
    PHA
    
    ; first we calculate the number of chars being printed
    
    LDA #0
    CLC
    ADC textoffset   
    TAY
wtts1:
    LDA (textprintaddr), y
    BEQ wtts2
    INY
    BNE wtts1
    
wtts2:    
    ; at this stage Y holds the number of chars in the string, save this value to printnumchars
    ; subtract textoffset if necessary
    TYA 
    SEC 
    SBC textoffset
    
    STA printnumchars
    TAY
    
    ; the next 2 values are the x value and the y value
    
    INY
    LDA (textprintaddr), y
    STA printxpos
    
    INY
    LDA (textprintaddr), y
    STA printypos  
    
wtts3:    
    
    LDX #0
    LDA printnumchars
    STA bgbuf, x
       
    INX
    STX bgbufidx
    
    ; now write the PPU address
    
    LDX printypos
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    STX bgbufidx

    LDX printypos
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC printxpos
    
    LDX bgbufidx
    STA bgbuf, x

    INX
    
    LDA #0
    CLC
    ADC textoffset 
    TAY
wtts4:
    LDA (textprintaddr), y
    BEQ wtts5
    STA bgbuf, x
    INX
    INY
    BNE wtts4
    
wtts5:
    ; terminate the buffer
    LDA #0
    STA bgbuf, x

    PLA
    TAY
    PLA
    TAX

    JSR CommitChange
    RTS
    
; this draws on-screen any background changes that have been requested. 
; this should only be called by the NMI routine
MakeBackgroundChanges:

    LDX #$00
mbcloop:
    LDA bgbuf, x
    CMP #$00
    BEQ mbcend    ; if length read is 0 then we are finished
    TAY           ; store this length in Y
    INX
    LDA bgbuf, x
    STA $2006
    INX
    LDA bgbuf, x
    STA $2006
    INX
mbcloop1:
    LDA bgbuf, x
    STA $2007   
    INX
    DEY
    CPY #$00
    BNE mbcloop1
    JMP mbcloop
    
    
mbcend:    
    LDA #$00
    STA bgupdaterequired

    RTS
    
    
; checkmove. tmpx and tmpy will be set to the desired location
; This checks if there are any existing blocks at the new location. 
; Sets allowedmove to 1 if move allowed 
; The first few block checks do not immediately jump to the end if allowedmove is set to 0
; this is because the branches would be out of range. Later blocks do this
CheckMove:
    LDA #$01
    STA allowedmove ; default is move allowed
    
    LDX tmpx
    LDY tmpy    ; instead of referring to tmpx and tmpy through this routine, we copy the values to x and y registers and use those

    LDA blockshapes
    AND #%10000000 
    BEQ cm1
    
    ; block here, check walls first
    
    JSR CheckAllForBlock
cm1:
    INX
    LDA blockshapes
    AND #%01000000 
    BEQ cm2
    
    JSR CheckAllForBlock

cm2:
    INX
    LDA blockshapes
    AND #%00100000 
    BEQ cm3
    
    JSR CheckAllForBlock

cm3:
    INX
    LDA blockshapes
    AND #%00010000 
    BEQ cm4
    
    JSR CheckAllForBlock
    
cm4:    
    INY
    LDA blockshapes
    AND #%00000001 
    BEQ cm5
    
    JSR CheckAllForBlock

cm5:
    DEX
    LDA blockshapes
    AND #%00000010 
    BEQ cm6
    
    JSR CheckAllForBlock
 
cm6:
    DEX
    LDA blockshapes
    AND #%00000100 
    BEQ cm7
    
    JSR CheckAllForBlock
    
cm7:    
    DEX
    LDA blockshapes
    AND #%00001000 
    BEQ cm8
    
    JSR CheckAllForBlock

cm8:
    INY
    LDA blockshapes+1
    AND #%10000000 
    BEQ cm9
    
    JSR CheckAllForBlock
    LDA allowedmove
    CMP #$00
    BEQ cmend 
cm9:
    INX
    LDA blockshapes+1
    AND #%01000000 
    BEQ cm10
    
    JSR CheckAllForBlock
    LDA allowedmove
    CMP #$00
    BEQ cmend 
cm10:
    INX
    LDA blockshapes+1
    AND #%00100000 
    BEQ cm11
    
    JSR CheckAllForBlock
    LDA allowedmove
    CMP #$00
    BEQ cmend 
cm11:
    INX
    LDA blockshapes+1
    AND #%00010000 
    BEQ cm12
    
    JSR CheckAllForBlock
    LDA allowedmove
    CMP #$00
    BEQ cmend  
cm12:
    INY
    LDA blockshapes+1
    AND #%00000001 
    BEQ cm13
    
    JSR CheckAllForBlock
    LDA allowedmove
    CMP #$00
    BEQ cmend 
cm13:
    DEX
    LDA blockshapes+1
    AND #%00000010 
    BEQ cm14
    
    JSR CheckAllForBlock
    LDA allowedmove
    CMP #$00
    BEQ cmend 
cm14:
    DEX
    LDA blockshapes+1
    AND #%00000100 
    BEQ cm15
    
    JSR CheckAllForBlock
    LDA allowedmove
    CMP #$00
    BEQ cmend 
cm15:
    DEX
    LDA blockshapes+1
    AND #%00001000 
    BEQ cmend
    
    JSR CheckAllForBlock
    
cmend:  
    RTS 
    
; checks walls and checks playarea buffer for a passed X and Y
CheckAllForBlock:  
    JSR CheckWalls
    LDA allowedmove
    CMP #$00
    BEQ ca1 ; hitting wall, skip to end

    JSR AtAdd
    CMP #BLANKSPACE
    BEQ ca1
    
    ; there was something at the square, set allowedmove to 00
    
    LDA #$00
    STA allowedmove
    
ca1:    
    RTS

; using a given x and y, determines if there is a block already there based on the value 
; stored in playareabuf corresponding to that location
; Modifies A and X register, result in A

AtAdd:
    TXA   
    PHA     ; we push to the stack as we overwrite X later in this routine

    ; we calculate the playarea buffer index by (10 * y) + (x - LEFTWALLX - 1)
    ; A holds the X value, need to subtract LEFTWALLX and 1
    SEC ; apparently you do a SEC before a SBC
    SBC #LEFTWALLX
    SEC
    SBC #$01
    STA ataddtemp
    
    TYA
    
    JSR Mult10      ; A now holds 10 * Y
    CLC
    ADC ataddtemp    ; add ataddtemp (which holds (x - LEFTWALLX - 1) value)
    TAX ; transfer index to X
    LDA playareabuf, x
    STA ataddtemp    ; now re- use ataddtemp to hold the value in the play area buffer
    
    PLA
    TAX
    
    LDA ataddtemp    ; A now holds the value in the play area buffer for this X,Y
    
    RTS
    
    
; to determine if we are hitting against another block (used by checkmove) we store
; each block as a byte in dedicated storage. The playarea is 10 bytes across and 24
; rows high. To calculate the index we use a routine that quickly multiplies by 10
; Number to be multiplied is passed in A
; routine adds 8X + 2X to give 10X

Mult10:
    ASL           ; multiply by 2
    STA multtemp  
    ASL         
    ASL         ; at this stage a is 8 times a
    CLC         ; clear carry flag  
    ADC multtemp   
    RTS
    
; this checks the walls - basically if x has LEFTWALLX or RIGHTWALLX value then
; move not allowed

CheckWalls:
    CPX #LEFTWALLX
    BEQ cwno
    CPX #RIGHTWALLX
    BEQ cwno
    RTS
cwno:
    LDA #$00
    STA allowedmove
    RTS    
    
; when the shape in play comes to rest, we need to convert the relevant sprite to a
; background image and update the playarea buffer
; The x and y pos are passed in using the X and Y registers respectively

ConvertShapeToBg:

    LDA #$00    ; reset the index into the background buffer
    STA bgbufidx
    
    LDA blockshapes
    AND #%10000000 
    BEQ csb1
    
    ; there is a block at this position, first we update the background
    JSR AddBlockToBgBuffer
    
    ; then we update the playarea buffer   
    JSR AddBlockToPlayAreaBuffer

csb1:
    INX
    LDA blockshapes
    AND #%01000000 
    BEQ csb2
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb2:
    INX
    LDA blockshapes
    AND #%00100000 
    BEQ csb3
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb3:
    INX
    LDA blockshapes
    AND #%00010000 
    BEQ csb4
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb4:    
    INY
    LDA blockshapes
    AND #%00000001 
    BEQ csb5
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb5:
    DEX
    LDA blockshapes
    AND #%00000010 
    BEQ csb6
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb6:
    DEX
    LDA blockshapes
    AND #%00000100 
    BEQ csb7
    
    JSR AddBlockToBgBuffer      
    JSR AddBlockToPlayAreaBuffer
csb7:    
    DEX
    LDA blockshapes
    AND #%00001000 
    BEQ csb8
    
    JSR AddBlockToBgBuffer
    JSR AddBlockToPlayAreaBuffer
csb8:
    INY
    LDA blockshapes+1
    AND #%10000000 
    BEQ csb9
    
    JSR AddBlockToBgBuffer
    JSR AddBlockToPlayAreaBuffer
csb9:
    INX
    LDA blockshapes+1
    AND #%01000000 
    BEQ csb10
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb10:
    INX
    LDA blockshapes+1
    AND #%00100000 
    BEQ csb11
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb11:
    INX
    LDA blockshapes+1
    AND #%00010000 
    BEQ csb12
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
csb12:
    INY
    LDA blockshapes+1
    AND #%00000001 
    BEQ csb13
    
    JSR AddBlockToBgBuffer
    JSR AddBlockToPlayAreaBuffer
csb13:
    DEX
    LDA blockshapes+1
    AND #%00000010 
    BEQ csb14
    
    JSR AddBlockToBgBuffer
    JSR AddBlockToPlayAreaBuffer
csb14:
    DEX
    LDA blockshapes+1
    AND #%00000100 
    BEQ csb15
    
    JSR AddBlockToBgBuffer
    JSR AddBlockToPlayAreaBuffer
csb15:
    DEX
    LDA blockshapes+1
    AND #%00001000 
    BEQ csb16
    
    JSR AddBlockToBgBuffer
    JSR AddBlockToPlayAreaBuffer
csb16:
    ; at this stage we have a buffer with new background information
    ; we need to finalise the buffer and make it available for the print routine
    ; which has handled in our NMI section
    
    LDX bgbufidx
    LDA #$00
    STA bgbuf, x
    
    LDA #$01
    STA bgupdaterequired
    
    ; wait for background change to be done by NMI
    
csb17:
    LDA bgupdaterequired
    CMP #$00
    BNE csb17
        
    RTS
    
; this adds a single block to the playarea buffer. Overwrites values in tmpx and tmpy
AddBlockToPlayAreaBuffer:
    ; we first check bufferaddactive. If set to 0 we immediately return
    
    LDA bufferaddactive
    CMP #0
    BEQ abtpab1

    ; we need to push X and Y to the stack so we can safely use them
    TXA   
    PHA
    TYA
    PHA
    
    STX tmpx
    STY tmpy
    
    ; we calculate the playarea buffer index by (10 * y) + (x - LEFTWALLX - 1)
    LDA tmpx
    SEC ; apparently you do a SEC before a SBC
    SBC #LEFTWALLX
    SEC
    SBC #$01
    STA tmpx

    LDA tmpy
    JSR Mult10
    CLC
    ADC tmpx
    
    TAX
    
    LDA tilenum
    
    STA playareabuf, x
       
    PLA
    TAY
    PLA
    TAX

abtpab1:
    RTS

    
; this adds a single block to the background buffer. Overwrites values in tmpx and tmpy
AddBlockToBgBuffer:

    ; we first need to push X and Y to the stack so we can safely use them
    TXA   
    PHA
    TYA
    PHA
    
    STX tmpx
    STY tmpy
    
    LDX bgbufidx
    
    LDA #$01    ; only adding a single block
    STA bgbuf, x
    
    INX
    STX bgbufidx
    
    ; there are 32 bytes per row, and a max of 30 rows
    
    LDX tmpy
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    STX bgbufidx

    LDX tmpy
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC tmpx
    
    LDX bgbufidx
    STA bgbuf, x

    INX

    LDA tilenum
    STA bgbuf, x
    
    INX
    STX bgbufidx    ; finished, we increment the index
    
    PLA
    TAY
    PLA
    TAX

    RTS

; very small delay, used when dropping the piece    
VerySmallDelay:
    LDX #$24
    JMP ActualDelay
    
; small delay loop used by main loop
SmallDelay:
	LDA sensitivity
    CMP #$00
    BEQ sd2
	CMP #$01
	BEQ sd3
	; else its slow
	LDX #$FF
	JMP sd1
sd2:
	; fast
    LDX #$32
	JMP sd1
sd3:
	; normal
    LDX #$80
sd1:
	JMP ActualDelay
    
ActualDelay:    

    LDY #$00
adloop1:
  
adloop2:
    LDA #$34      ; just a number, really just something that takes time
  
    INY                 ; inside loop counter
    CPY #$00
    BNE adloop2      ; run the inside loop 256 times before continuing down
  
    DEX
    CPX #$00
    BNE adloop1

    RTS
    
; this does the level special action
; for example put a random square on the screen or slide a floor level or
; rise the entire board. 
LevelSpecialAction:

    LDA currentlevel
    CMP #4
    BEQ lsa1
    CMP #5
    BEQ lsa2
    CMP #7
    BEQ lsa3    
    CMP #8
    BEQ lsa4
    CMP #9
    BEQ lsa5
    CMP #10
    BEQ lsa7
    
    RTS
    
lsa1:
    ; level 4, same as level 5, but level 4 uses standard blocks while level 5 uses extended set

lsa2:
    ; level 5, needs shooting stars every 5 pieces
    LDA piecesplayedthislevel
    TAX
    LDY #5
    JSR GetModulo
    ; register A will be 0 if evenly divisible by 5
    CMP #0
    BNE lsa8
    
    JSR ShootingStar
    JMP CheckPlayArea
    
lsa3:
    ; level 7, we just need to update the counter showing number of pieces played
    
    JSR CalculateNumberOfPiecesLeft
    JMP PrintNumberOfPiecesLeft

lsa4:
	; level 8, sliding floor
	; a random level is moved either left or right every 4 pieces

    LDA piecesplayedthislevel
    TAX
    LDY #4
    JSR GetModulo
    ; register A will be 0 if evenly divisible by 4
    CMP #0
    BNE lsa8
    
    JMP SlidingFloor    

lsa5:
    ; level 9, needs shooting stars every 5 pieces and sliding floor every 4 pieces
    LDA piecesplayedthislevel
    TAX
    LDY #5
    JSR GetModulo
    ; register A will be 0 if evenly divisible by 5
    CMP #0
    BNE lsa6
    
    JSR ShootingStar
    JSR CheckPlayArea
    
lsa6:
 
    LDA piecesplayedthislevel
    TAX
    LDY #4
    JSR GetModulo
    ; register A will be 0 if evenly divisible by 4
    CMP #0
    BNE lsa8
    
    JMP SlidingFloor
       
lsa7: 
	; level 10 - rising fall
	; the floor rises 1 row and that row is filled with random blocks

    LDA piecesplayedthislevel
    TAX
    LDY #10
    JSR GetModulo
    ; register A will be 0 if evenly divisible by 10
    CMP #0
    BNE lsa8
    
    JMP RisingFloor 

lsa8:   

    RTS
  
; routine for calculating modulo - result will be in A 
; registers X and Y are also used
GetModulo:
    TXA
    STY getmodtemp
    SEC
gm1:
    SBC getmodtemp
    BCS gm1
    
    CLC
    ADC getmodtemp

    RTS
    
; shooting star. This puts a random square somewhere on the playarea. It puts it at least 4
; squares down from the top of the screen to give the player a chance
ShootingStar:
    LDA #sfx_index_sfx_Appear
    JSR PlaySoundEffect

	JSR rnd
    AND #%00001111   ;bitmask bits 0, 1, 2 and 3 (so we pick number between 0 and 15)
    
    CLC
    ADC #7  ; to ensure we do not put a block directly in starting position
    
    TAY     ; register Y now holds the row we will place our star

	; now that we have picked the row, need to pick the column
    ; there are 10 possible positions in the row, so pick number between 0 and 9 inclusive
sst1:
    JSR rnd
    AND #%00001111  ; bitmask 4 bits, if greater than 9 we pick again
    CMP #10
    BEQ sst1
    CMP #11
    BEQ sst1    
    CMP #12
    BEQ sst1    
    CMP #13
    BEQ sst1    
    CMP #14
    BEQ sst1    
    CMP #15
    BEQ sst1    

sst2:
	; we now have a value between 0 and 9
    CLC
    ADC #LEFTWALLX
    CLC
    ADC #1
    ; now we have a position on the playarea
    
    TAX     ; transfer this value to the X register
    JSR AtAdd
    
    CMP #BLANKSPACE
    BNE sst1    ; if not blank space then pick again
    	
	; at this stage we have picked a square and it is blank
	; lets draw our random tile on-screen
    
    LDA #$00    ; reset the index into the background buffer
    STA bgbufidx
    
    ; save the current tilenum
    LDA tilenum
    PHA     ; save it to the stack
       
    LDA #RANDOMTILE
    STA tilenum
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
    
    LDX bgbufidx
    LDA #0
    STA bgbuf, x
    
    JSR CommitChange
    
    ; retrieve tilenum from the stack
    PLA
    STA tilenum
    
	
    RTS
    
; finds a row (that has a square already on that row) and slides it one square left or right
SlidingFloor:
    LDA #sfx_index_sfx_Lock_or_Move
    JSR PlaySoundEffect

    LDA #0
    STA slidingcounter
    STA bgbufidx    ; reset the index into the background buffer

sf1:
	JSR rnd
    AND #%00001111   ;bitmask bits 0, 1, 2 and 3 (so we pick number between 0 and 15)
    
    CLC
    ADC #7  ; to ensure we are picking a row further down the screen (more likely to be row with square)
    
    STA tmpy    ; we store the row in tmpy
    
    LDA #LEFTWALLX
    STA tmpx
    INC tmpx
    
    LDX #10 ;10 squares in width of play area

sf2:
    TXA
    PHA     ; push the loop counter x to the stack
    
    LDY tmpy
    LDX tmpx
    JSR AtAdd
    CMP #BLANKSPACE ; check is it is an empty square
    BNE sf4    ;square is not empty

    INC tmpx
    
    PLA     ;pull back the loop counter from the stack
    TAX
    DEX
    CPX #0
    BNE sf2

    ; if here then we found a row that has just blank spaces, so pick a new row, unless slidingcounter
    ; has reached 20, in which case we have been quite unlucky finding a row, or the player has just 
    ; cleared the playarea and there are no squares currently to move
    
    INC slidingcounter
    LDA slidingcounter
    CMP #20
    BEQ sf3
    
    JMP sf1

sf3:
   RTS

sf4:
    ; found a row with at least one non blank space
    ; first need to tidy up the stack
    PLA
    
    ; save the current tilenum
    LDA tilenum
    PHA     ; save it to the stack
    
    ;pick whether to go left (0) or right (1)
    JSR rnd
    AND #%00001111
    
    TAX
    LDY #2
    JSR GetModulo
    CMP #1
    BEQ sf6
    
    ; going left, so first we draw arrows on this row showing going left and have a short pause
    
    LDX #1
    STX showarrow
    JSR DrawArrow
    
    ;we are going left so get value at column LEFTWALLX + 1
    
    LDY tmpy
    LDX #LEFTWALLX
    INX
    STX tmpx
       
    JSR AtAdd
    STA slidingwraparoundtilenum
    INC tmpx
      
    LDX #9 ;10 squares in width of play area, minus 1 due to wraparound
sf5:    
    TXA
    PHA
    
    LDY tmpy
    LDX tmpx
    JSR AtAdd
    STA tilenum
 
    LDX tmpx 
    DEX     ; subtract 1 as we are adding block to the left
    
    ;addblocktobgbuffer overwrites values in tmpx and tmpy so we need to save to stack
    LDA tmpx
    PHA
    LDA tmpy
    PHA
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
    
    PLA
    STA tmpy
    PLA
    STA tmpx
    
    INC tmpx

    PLA     ;pull back the loop counter from the stack
    TAX
    DEX
    CPX #0
    BNE sf5
    
    ; now we place the wraparound tilenum at this position
    
    LDY tmpy
    LDX tmpx
    DEX     ; as we have gone one too far
    LDA slidingwraparoundtilenum
    STA tilenum

    LDA tmpy
    PHA
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
    
    PLA
    STA tmpy
    
    LDX bgbufidx
    LDA #0
    STA bgbuf, x
    
    JSR CommitChange
    
    ; now hide the arrows we previously drew

    LDX #0
    STX showarrow
    JSR DrawArrow
    
    ; retrieve the current tilenum
    PLA
    STA tilenum
    
       
    RTS

sf6:

    ; first draw the arrows showing we are going right
    LDX #1
    STX showarrow
    JSR DrawArrow

    ;we are going right so get value at column RIGHTWALLX - 1
    
    LDY tmpy
    LDX #RIGHTWALLX
    DEX
    STX tmpx
    
    JSR AtAdd
    STA slidingwraparoundtilenum
    DEC tmpx
    
    LDX #9 ;10 squares in width of play area, minus 1 due to wraparound
sf7:    
    TXA
    PHA
    
    LDY tmpy
    LDX tmpx
    JSR AtAdd
    STA tilenum
    
    LDX tmpx
    INX     ; add 1 as we are adding block to the right
   
    ;addblocktobgbuffer overwrites values in tmpx and tmpy so we need to save to stack
    LDA tmpx
    PHA
    LDA tmpy
    PHA
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
    
    PLA
    STA tmpy
    PLA
    STA tmpx
    
    DEC tmpx

    PLA     ;pull back the loop counter from the stack
    TAX
    DEX
    CPX #0
    BNE sf7
    
    ; now we place the wraparound tilenum at this position
    
    LDY tmpy
    LDX tmpx
    INX     ; as we have gone one too far
    LDA slidingwraparoundtilenum
    STA tilenum
 
    ; at this stage we only care about saving tmpy
    LDA tmpy
    PHA
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
      
    PLA
    STA tmpy

    LDX bgbufidx
    LDA #0
    STA bgbuf, x
    
    JSR CommitChange   

    ; now hide the arrows we previously drew

    LDX #0
    STX showarrow
    JSR DrawArrow
    
    ; retrieve the current tilenum
    PLA
    STA tilenum 

sf8:    
    RTS
    
; this calls placebomb BOMBSONLEVEL6 number of times
populatebombs:
    
    LDX #1
popb1:
    JSR PlaceBomb
    CPX #BOMBSONLEVEL6
    BEQ popb2
    INX
    JMP popb1
popb2:       
    RTS
    
; place bomb. This puts a bomb randomly on the playarea. It puts each
; bomb at least 7 squares down from the top of the screen to give the player a chance
PlaceBomb:

    TXA
    PHA     ; push X to the stack as populatebombs uses X as a loop counter

pb1:    
	JSR rnd
    AND #%00001111   ;bitmask bits 0, 1, 2 and 3 (so we pick number between 0 and 15)
    
    CLC
    ADC #12  ; to ensure we do not put a block directly in starting position
    
    CMP #BOTTOMY
    BCS pb1 ; if equal or greater than BOTTOMY pick again
    
    TAY     ; register Y now holds the row we will place our star

	; now that we have picked the row, need to pick the column
    ; there are 10 possible positions in the row, so pick number between 0 and 9 inclusive    
pb2:
    JSR rnd
    AND #%00001111  ; bitmask 4 bits, if greater than 9 we pick again
    CMP #10
    BEQ pb2
    CMP #11
    BEQ pb2    
    CMP #12
    BEQ pb2    
    CMP #13
    BEQ pb2    
    CMP #14
    BEQ pb2    
    CMP #15
    BEQ pb2    

pb3:
	; we now have a value between 0 and 9
    CLC
    ADC #LEFTWALLX
    CLC
    ADC #1
    ; now we have a position on the playarea
    
    TAX     ; transfer this value to the X register
    JSR AtAdd
    
    CMP #BLANKSPACE
    BNE pb1    ; if not blank space then pick again
    	
	; at this stage we have picked a square and it is blank
	; lets draw our bomb tile on-screen
    
    LDA #$00    ; reset the index into the background buffer
    STA bgbufidx
    
    ; save the current tilenum
    LDA tilenum
    PHA     ; save it to the stack
       
    LDA #BOMBTILE
    STA tilenum
    
    JSR AddBlockToBgBuffer  
    JSR AddBlockToPlayAreaBuffer
    
    LDX bgbufidx
    LDA #0
    STA bgbuf, x
    
    JSR CommitChange
    
    ; retrieve tilenum from the stack
    PLA
    STA tilenum
    
    PLA
    TAX ; retrieve X from the stack
	
    RTS    
    
; this draws arrows on the appropriate row, then pauses
; it can also remove those arrows
; it is passed a row to draw on in tmpy
; value in A register show if going left (0) or right (1)
; it uses showarrow to determine if to hide or show the arrows
; overwrites value of tilenum
DrawArrow:
    ; A already set
    CMP #0
    BEQ da1
    ; not going left, so assume going right
    LDA #RIGHTARROWTILE
    STA tilenum
    JMP da2
    
da1:
    ; going left
    LDA #LEFTARROWTILE
    STA tilenum

da2:    
    ; now we check if we are actually drawing arrows - may be erasing them!
    LDA showarrow
    CMP #1
    BEQ da3
    
    ;asked not to show the arrows (remove them)
    LDA #BLANKSPACE
    STA tilenum
    
da3:

    LDY tmpy
    LDX #LEFTWALLX
    DEX ; one to left of left wall   
    
    ;addblocktobgbuffer overwrites values in tmpx and tmpy so we need to save to stack
    LDA tmpx
    PHA
    LDA tmpy
    PHA
    
    JSR AddBlockToBgBuffer  
    
    PLA
    STA tmpy
    PLA
    STA tmpx
    
    LDY tmpy
    LDX #RIGHTWALLX 
    INX ; one to right of right wall   
    
    ;addblocktobgbuffer overwrites values in tmpx and tmpy so we need to save to stack
    LDA tmpx
    PHA
    LDA tmpy
    PHA
    
    JSR AddBlockToBgBuffer  
    
    PLA
    STA tmpy
    PLA
    STA tmpx
    
    LDX bgbufidx
    LDA #0
    STA bgbuf, x
    
    JSR CommitChange   
  
    ; if we are drawing the arrows (not hiding them) then we put in a short pause so
    ; the player can definitely see the row impacted
    
    LDA showarrow
    CMP #0
    BEQ da4

    LDX #0
daloop1:
    TXA
    PHA
    JSR SmallDelay
    PLA
    TAX
    INX
    CPX #2
    BNE daloop1  
    
da4:   
    ; now reset bgbufidx so tidied up for next call
    LDA #0
    STA bgbufidx

    RTS
    
; lifts the whole playarea by 1 row and fills the newly created row with 
; randomly placed blocks    
RisingFloor:
    LDA #sfx_index_sfx_Lock_or_Move
    JSR PlaySoundEffect

    ; save the current tilenum
    LDA tilenum
    PHA     ; save it to the stack
    
    LDA #0
    STA bgbufidx    ; reset the index into the background buffer

    LDY #TOPYWHENUPSIDEDOWN ; top of the playarea
rf1:
    LDX #LEFTWALLX
    INX
rf2:
    JSR AtAdd
    STA tilenum
    DEY
    JSR AddBlockToPlayAreaBuffer
    INY
    INX
    CPX #RIGHTWALLX
    BNE rf2
    INY
    CPY #BOTTOMY
    BNE rf1    
    	
	; at this stage we have raised everything, now just need to create our new line
    LDY #BOTTOMY
    DEY
rf3:	
    LDX #LEFTWALLX
    INX
rf4:
    TXA   
    PHA
    TYA
    PHA
    
    ;pick whether to draw blank (0) or block (1)
    JSR rnd
    AND #%00001111
    
    TAX
    LDY #2
    JSR GetModulo
    CMP #0
    BEQ rf5
    LDA #RANDOMTILE
    STA tilenum
    JMP rf6
rf5:
    LDA #BLANKSPACE
    STA tilenum
rf6:
    ; retrieve X and Y from stack so we add to the correct location
    PLA
    TAY
    PLA
    TAX
    
    JSR AddBlockToPlayAreaBuffer

    INX
    CPX #RIGHTWALLX
    BNE rf4
    
    ; now we redraw the playarea
    JSR DrawPlayAreaFromBuffer
    
    ; retrieve the current tilenum
    PLA
    STA tilenum 
    

    RTS
    
; prints a 2 digit number, number to be converted is in digittemp 
Print2Digit:
    LDY #1
    
    LDX #8
    LDA #0
p2d1:
    ASL digittemp
    ROL
    CMP #10
    BCC p2d2
    SBC #10
    INC digittemp
p2d2:
    DEX
    BNE p2d1
    
    STA digitprint,y
    
p2d3:
    LDY #0
    LDA digittemp
    
    STA digitprint,y
    
    RTS
    
; this checks if we have completed the level or won the game	
CheckLevelComplete:

    LDA currentlevel
    CMP #6
    BEQ clc1
    
    LDA targetlinesforthislevelnum
    CMP totalrowscompletednum 
    BEQ clc2
    BCC clc2    ;Accumulator (targetlinesforthislevelnum) less than totalrowscompletednum at this location
    BCS clc4    ;Accumulator (targetlinesforthislevelnum) greater than totalrowscompletednum at this location
 
clc1:
    ; this is used for checking time left and bombs defused
    LDA leveltimer
    CMP #0
    BEQ clc5    ; game over, time ran out
    BCC clc5
    
    LDA #BOMBSONLEVEL6
    CMP bombsfound
    BEQ clc2
    BCC clc2    ; should not happen but include for completeness
    BCS clc4
 
clc2:
    ; level is complete, increment the currentlevel and see if game is over
    INC currentlevel
    LDA currentlevel
    CMP #TOTALNUMLEVELS
    BEQ clc2a
    BCS clc3
    
    ; we are going to a new level, hide all sprites, they will be reactivated when new level starts
clc2a:    
    JSR HideAllSprites
    JMP NewLevel

clc3:   
    ; game is over - yay!
    
    JMP YouWin
clc4:
    ; normally this would just continue the loop, but in level 7 you can run out of pieces
    ; this checks for that scenario

    LDA currentlevel
    CMP #7
    BNE clc4a
    
    ; this is level 7 we are playing on, have we run out of pieces?
    
    LDA piecesleftthislevel
    CMP #255
    BEQ clc5

clc4a:    
    JMP MainGameLoop
clc5:    
    JMP GameOver    ; sorry, you lost
  
; this clears a 4x3 section of the screen (sets it to blank graphic)
; This is used when showing the next shape and the saved shape. The location 
; starting position is passed in using tmpx and tmpy
ClearInfoArea:
    
    LDA #0
    STA bgbufidx
    
    LDX bgbufidx
    LDY #0

cialoop1:    
    LDA #4    ; adding 4 blocks
    STA bgbuf, x
    
    ; there are 32 bytes per row, and a max of 30 rows
    
    LDX tmpy
    LDA ppu_lookup1, x
    
    INC bgbufidx 
    LDX bgbufidx
    STA bgbuf, x

    LDX tmpy
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC tmpx
    
    INC bgbufidx
    LDX bgbufidx
    STA bgbuf, x
    
    LDA #BLANKSPACE

    INX
    STA bgbuf, x
    INX
    STA bgbuf, x
    INX
    STA bgbuf, x
    INX
    STA bgbuf, x 

    INX    
    STX bgbufidx
    
    INY
    CPY #3
    BEQ cia1
    
    ; not finished our loop yet, so increment tmpy and continue the loop
    
    INC tmpy
    JMP cialoop1:
    
    ; so we have written our 3 rows of 4 blank spaces, place a 0 at the end of bgbuf
cia1:    
    
    LDA #0
    STA bgbuf, x
    
    JSR CommitChange

    RTS
    
    
; random number generator. Thanks to Drag for this code    
rnd
    TXA
    PHA
    LDA rnd4   ;3
    TAX ;2  5
    EOR rnd2   ;3  8
    STA rnd2   ;3  11
    LSR rnd4   ;5  16
    ROR ;2  18
    LSR rnd4   ;5  23
    ROR ;2  25
    PHA ;3  28
    TXA      ;2  30
    EOR rnd4   ;3  33
    STA rnd4   ;3  36
    PLA ;4  40
    LSR rnd4   ;5  45
    ROR ;2  47
    AND #$e0   ;2  49
    EOR rnd2   ;3  52
    PHA ;3  55
    LDA rnd4   ;3  58
    EOR rnd3   ;3  61
    STA rnd4   ;3  64
    PLA ;4  68
    STA rnd3   ;3  71
    LDA random   ;3  74
    STA rnd2   ;3  77
    TXA ;2  79
    STA random   ;3  82
    PLA
    TAX
    LDA random
    RTS    
    
; this loads the splash screen for Teuthida (music creator)
LoadTeuthidaScreen:
; load background/ nametable    
    JSR TurnScreenOff
    LDA #$00
    LDA $2002    ; read PPU status to reset the high/low latch
    LDA #$20    
    STA $2006
    LDA #$00
    STA $2006
                  
    ;; load nametable
    LDA #<teuthida
    STA addrLo
    LDA #>teuthida
    STA addrHi
    JSR LoadRLEBkg      
   
    ; we do not use the normal turn screen on as this uses a different pattern table
    
    BIT $2002   ; read from PPUSTATUS 
    LDA #$00
    STA $2005
    STA $2005
        
    LDA #%10010000      ; re-enable NMI, use background table 1                                                   
    STA $2000     
    LDA #%00011110          
    STA $2001  

    LDA #1
    STA backgroundmode
 
  ; end section load background/ nametable 
  
    RTS  

; this loads a nametable that is encoded with RLE - this is my ASM6 port of RLE decompressor by Shiru 
LoadRLEBkg:
    LDX addrLo
	STX RLE_LOW
    LDY addrHi
	STY RLE_HIGH
	LDY #0
	JSR rle_byte
	STA RLE_TAG
lrb1:
	JSR rle_byte
	CMP RLE_TAG
	BEQ lrb2
	STA $2007
	STA RLE_BYTE
	BNE lrb1
lrb2:
	JSR rle_byte
	CMP #0
	BEQ lrb4
	TAX
	LDA RLE_BYTE
lrb3:
	STA $2007
	DEX
	BNE lrb3
	BEQ lrb1
lrb4:
	RTS

rle_byte:
	LDA (RLE_LOW),y
	INC RLE_LOW
	BNE rb1
	INC RLE_HIGH
rb1:
	rts    
    
    
; this loads the main game screen graphics (name table and attributes)
LoadMainGameGraphics:
; load background/ nametable    
    JSR TurnScreenOff
    LDA #$00
    LDA $2002    ; read PPU status to reset the high/low latch
    LDA #$20    
    STA $2006
    LDA #$00
    STA $2006
                  ;; load nametable
    LDA #<background
    STA addrLo
    LDA #>background
    STA addrHi
    JSR LoadRLEBkg      
   
    JSR TurnScreenOn               
 
  ; end section load background/ nametable 
  
    RTS 
  
 ; this loads the attributes

LoadAttributes:
    LDA $2002             ; read PPU status to reset the high/low latch
    LDA #$23
    STA $2006             ; write the high byte of $23C0 address
    LDA #$C0
    STA $2006             ; write the low byte of $23C0 address
    LDX #$00              ; start out at 0
loadattributeLoop:
    LDA attribute, x      ; load data from address (attribute + the value in x)
    STA $2007             ; write to PPU
    INX                   ; X = X + 1
    CPX #64              ; Compare X to 64 - copying 64 bytes
    BNE loadattributeLoop ; Branch to loadattributeLoop if compare was Not Equal to zero
                          
    RTS

; this clears the screen

ClearScreen:
    JSR TurnScreenOff
    LDA $2002    ; read PPU status to reset the high/low latch
    LDA #$20
    STA $2006
    LDA #$00
    STA $2006
    
    LDX #$04
    LDY #$00
   
clearscreenLoop:
   ; JSR TurnScreenOff
    LDA #BLANKSPACE
    STA $2007
    INY
    BNE clearscreenLoop
    DEX
    BNE clearscreenLoop
    
    JSR LoadAttributes
    
    JSR TurnScreenOn

    RTS
    
TurnScreenOn:     ; Enable screen rendering       
    BIT $2002   ; read from PPUSTATUS 
    LDA #$00
    STA $2005
    STA $2005
        
    LDA #%10000000      ; re-enable NMI, use background table 0                                                   
    STA $2000     
    LDA #%00011110          
    STA $2001                                                        
    RTS                                                              
 
TurnScreenOff:          ; Disable screen rendering
    LDA #$00                                                         
    STA $2000       ; disables the NMI                                                   
    STA $2001       ; disables rendering                                                
    RTS  
    
; WaitFrame - waits for VBlank, returns after NMI handler is done
WaitFrame:
    INC sleeping
wfloop1:
    LDA sleeping
    BNE wfloop1
    RTS
    
;hide all sprites. If we do not do this, then on PAL displays we will see the 0 graphic
;in the top left corner (at pos 0,0). The following sets the y pos to be F0 (off screen)
;for all the sprites

HideAllSprites:    
    LDX #$00 
hsloop1:
    LDA #$F0
    STA $0200,x
    INX
    LDA #$0
    STA $0200,x
    INX
    STA $0200,x
    INX
    STA $0200,x
    INX
    BNE hsloop1

    RTS

; this resets all the variables that need to be reset for the start of a new game

NewGameInitialisation:

    LDA #$0     
    STA upsidedown

    LDA #$01
    STA allowedswap
    STA currentlevel    ; set the current level to 1 (starting)
    STA bufferaddactive
    
    LDA #1            
    STA currentlevel
    
    LDA #$00
    STA currentorientation
    STA blockpointer
    STA currentshape 
    STA totalrowscompletednum
    STA ghostactive     ; ghost is set to off
    STA savedshape      ; reset the saved shape to 0 (long bar)
    STA dropbuttonpresscount
    
    JSR ResetScore
 
    RTS
    
; this resets the score back to 000000 
ResetScore:
    LDX #0
    LDA #48     ; ASCII 0
rsloop:
    STA score,x
    INX
    CPX #6
    BNE rsloop
    
    RTS
    
    
; this compares the score against the high score. If the score is higher it
; sets the variable newhighscore to have a value of 1
; For each digit check we first check the equal comparison as both BCC and BCS
; also check this and we do not want invalid triggers

CheckHighScore:
    LDA #0
    STA newhighscore 

    LDA highscore
    CMP score 
    BEQ chs1
    BCC chs7    ;Accumulator (high score) less than score at this location
    BCS chs6    ;Accumulator (high score) greater than score at this location

chs1:    
    LDA score + 1
    STA checkhighscoretemp
    LDA highscore + 1
    CMP checkhighscoretemp
    BEQ chs2
    BCC chs7
    BCS chs6

chs2:    
    LDA score + 2
    STA checkhighscoretemp
    LDA highscore + 2
    CMP checkhighscoretemp
    BEQ chs3
    BCC chs7
    BCS chs6

chs3:
    LDA score + 3
    STA checkhighscoretemp
    LDA highscore + 3
    CMP checkhighscoretemp
    BEQ chs4
    BCC chs7
    BCS chs6

chs4:    
    LDA score + 4
    STA checkhighscoretemp
    LDA highscore + 4
    CMP checkhighscoretemp
    BEQ chs5
    BCC chs7
    BCS chs6

chs5:    
    LDA score + 5
    STA checkhighscoretemp
    LDA highscore + 5
    CMP checkhighscoretemp
    BEQ chs6
    BCC chs7  

chs6:    
    RTS ; if here then score is not bigger than highscore

chs7:
    LDA #1  ; score is larger than high score
    STA newhighscore
    RTS
    
    
; this sets the highscore to be the value of score. This would be called if
; newhighscore had a value of 1 
SetHighScore:
    LDX #0
shsloop:
    LDA score,x
    STA highscore,x
    INX
    CPX #6
    BNE shsloop
    
    RTS

 
; NES TV system detection code
; Copyright 2011 Damian Yerrick
;
; Copying and distribution of this file, with or without
; modification, are permitted in any medium without royalty provided
; the copyright notice and this notice are preserved in all source
; code copies.  This file is offered as-is, without any warranty.
; 
; @return A: TV system (0: NTSC, 1: PAL, 2: Dendy; 3: unknown
;         Y: high byte of iterations used (1 iteration = 11 cycles)
;         X: low byte of iterations used

GetTVSystem:
    LDX #0
    LDY #0
    LDA frameTimer

gtvs1:
    CMP frameTimer
    BEQ gtvs1:
    LDA frameTimer

gtvs2:
    ; Each iteration takes 11 cycles.
    ; NTSC NES: 29780 cycles or 2707 = $A93 iterations
    ; PAL NES:  33247 cycles or 3022 = $BCE iterations
    ; Dendy:    35464 cycles or 3224 = $C98 iterations
    ; so we can divide by $100 (rounding down), subtract ten,
    ; and end up with 0=ntsc, 1=pal, 2=dendy, 3=unknown
    INX
    BNE gtvs3
    INY
gtvs3:  
    CMP frameTimer
    BEQ gtvs2
    TYA
    SEC
    SBC #10
    CMP #3
    BCC gtvs4
    LDA #3
gtvs4:
    RTS
    
; this prints the number of lines that need to completed this level
PrintLevelTarget:

    LDX currentlevel
    DEX
    
    LDA linesneededperlevel,x
    STA digittemp
    JSR Print2Digit
    
    LDA #LINESTOCOMPLETEX
    STA printnumbersx
    LDA #LINESTOCOMPLETEY 
    STA printnumbersy
    
    JSR PrintNumbers
      
    RTS
    
; this prints the lines completed so far
PrintLinesOrBombsCompleted:
    
    LDA currentlevel
    CMP #6
    BEQ plobc1
    LDA totalrowscompletednum
    JMP plobc2
plobc1:
    LDA bombsfound
plobc2:    
    STA digittemp
    JSR Print2Digit
    
    LDA #LINESCOMPLETEDX
    STA printnumbersx
    LDA #LINESCOMPLETEDY 
    STA printnumbersy
    
    JSR PrintNumbers
      
    RTS    
    
    
; this writes the name of the level at the bottom of the screen, max of 12 levels using this code
WriteNameOfLevel: 

    ; each level piece of data is 20 bytes long
    ; to calculate the offset, we subtract one from the currentlevel, call mult10
    ; then double - this gives the correct offset
    
    LDA currentlevel
    SEC 
    SBC #1
    JSR Mult10
    ASL           ; multiply by 2
    
    STA textoffset
    
    LDA #<levelnames
    STA textprintaddr
    LDA #>levelnames
    STA textprintaddr + 1
   
    JSR WriteTextToScreen
    
    LDA #0
    STA textoffset
    
    RTS   
    
    
; this prints the upcoming level with a short pause
PrintUpcomingLevel:

    LDA #<level_str
    STA textprintaddr
    LDA #>level_str
    STA textprintaddr + 1
   
    JSR WriteTextToScreen

    LDA currentlevel
    STA digittemp
    JSR Print2Digit
    
    LDA #LEVELINFOPRINTX
    STA printnumbersx
    LDA #LEVELINFOPRINTY
    STA printnumbersy
    
    JSR PrintNumbers
    
    LDA currentlevel
    CMP #6
    BEQ pucl1
    CMP #7
    BEQ pucl2
    JMP pucl3
    
pucl1:    
    ; show specific message for level 6
    LDA #<defuse_info1_str
    STA textprintaddr
    LDA #>defuse_info1_str
    STA textprintaddr + 1
   
    JSR WriteTextToScreen
    
    LDA #<defuse_info2_str
    STA textprintaddr
    LDA #>defuse_info2_str
    STA textprintaddr + 1
   
    JSR WriteTextToScreen
    
    JMP pucl3

pucl2: 
    ; show specific message for level 7
    LDA #<limitedpieces_info1_str
    STA textprintaddr
    LDA #>limitedpieces_info1_str
    STA textprintaddr + 1
   
    JSR WriteTextToScreen
    
    LDA #<limitedpieces_info2_str
    STA textprintaddr
    LDA #>limitedpieces_info2_str
    STA textprintaddr + 1
   
    JSR WriteTextToScreen   
    
pucl3:    
    JSR LargePause
 
    RTS
   
; this waits a couple of seconds
LargePause:
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay
    JSR SmallDelay 

    RTS
    
; This draws words onscreen using blocks to make up the parts of the letters	
; Each byte represents the tile number of the block to draw
; 254 means end of line and 255 means end of data (stop drawing)
PrintWordsWithBlocks:

   ; we first need to push X and Y to the stack so we can safely use them
    TXA   
    PHA
    TYA
    PHA
    
    LDA #0
    STA bgbufidx
    
    ; X and Y hold the x and y pos to print on screen
    LDY #0
    LDA (logoaddr),y
    STA printxpos
    INY
    LDA (logoaddr),y
    STA printypos    
   
    LDA #2
    STA logoidx ; we skip the first two bytes as these are the X and Y pos

pwwbmain:
    
    LDX #0
    LDY logoidx
pwwb1:
    LDA (logoaddr),y
    CMP #255    ; end of logo
    BEQ pwwb6
    CMP #254    ; end of line
    BEQ pwwb2
    INY
    INX
    JMP pwwb1
 
pwwb2: 
 
    ; x now holds the length of the line to print, if x is zero then just skip to new line to print
    CPX #0
    BEQ pwwb5
    
    TXA
    LDX #0
    STA bgbuf, x
       
    INX
    INC bgbufidx
    
    ; now write the PPU address
    
    LDX printypos
    LDA ppu_lookup1, x
    
    LDX bgbufidx
    STA bgbuf, x
    
    INX
    INC bgbufidx

    LDX printypos
    LDA ppu_lookup2, x      ; this gives us the value for the start if the row
    
    CLC
    ADC printxpos
    
    LDX bgbufidx
    STA bgbuf, x

    INX
 
    LDY logoidx
pwwb3:
    LDA (logoaddr),y
    CMP #254    ; end of line
    BEQ pwwb4
    STA bgbuf, x
    INX
    INY
    JMP pwwb3 
    
pwwb4: 
    ; terminate the buffer
    LDA #0
    STA bgbuf, x

    JSR CommitChange
    
pwwb5:    
    LDA #0
    STA bgbufidx

    INY
    STY logoidx
    
    INC printypos   ; so we start printing on next line
    
    JMP pwwbmain

pwwb6:
    ; restore stack
    
    PLA
    TAY
    PLA
    TAX

    RTS
    
   
    
;; Includes and data tables
include "titleroutines.asm"
include "initroutines.asm"

include "ggsound.asm"
include "BGM.asm"
.align 64
include "BGM_dpcm.asm"

include "data.inc"

;; The Vectors

.org $fffa  ; sets us up at the very end of the code.
    .dw NMI     ; now the NMI points to our label NMI
    .dw RESET   ; now the Reset points to our label RESET
    .dw 00
    
    .incbin "graphics.chr" ;; this includes the graphics for 
                           ;; the sprites in the
                           ;; assembly of the game


