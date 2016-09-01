;
; variables1.inc
; Part of the game dúshlán for the NES
;
; Copyright (c) 2016 Peter McQuillan 
; 
; All Rights Reserved. 
; 
; Distributed under the BSD Software License (see license.txt) 
; 
;

    frameTimer .dsb 1   ; declare frameTimer variable   
    countdownframeTimer .dsb 1 
    
    addrLo  .dsb 1         ; Hi/Lo bytes for background data pointers
    addrHi  .dsb 2

    ; holds a value for last action/key pressed. 
    ; a bit is set corresponding to the action done
    lastkeypressed  .dsb 1
    
    plx    .dsb 1              ; player's x coordinate.
    ply    .dsb 1              ; player's y coordinate.
    
    ; ghost shapes x and y position
    ghostx .dsb 1
    ghosty .dsb 1
    
    tmpx   .dsb 1
    tmpy   .dsb 1
    
    ; a value of 1 means allowed move
    allowedmove .dsb 1
    
    ; this holds the current shape being shown
    currentshape    .dsb 1

    ; this holds the next shape that will be played
    nextshape   .dsb 1

    ; this holds the saved shape
    savedshape	.dsb 1

    ; there are 4 possible orientations for each shape, values 0 to 3
    currentorientation	.dsb 1
    
    blockpointer    .dsb 1
      
    ; this is the tile number of the shape currently being played
    tilenum .dsb 1
    
    ; this is used for determining whether the ghost is actually showing, for example may not be
    ; due to shape being too near the top of the piled blocks

    ghostshowing .dsb 1
    
    ; ghost active. 0 is off, 1 is on. This determines whether the ghost shape is shown
    ; The ghost shape shows where the shape would go if the player pressed drop
    ghostactive .dsb 1
    
    ; depending on the shape being played, up to 5 blocks could be used
    ; at a minimum 2 blocks make up a shape, so sprite 1 and sprite 2 are
    ; always active. But we have variables to hold if sprites 3,4 and 5 are
    ; currently active. 0 is off, 1 is on
    
    sprite3active .dsb 1
    sprite4active .dsb 1
    sprite5active .dsb 1
    
    ; these are the ghost equivalent of the above. All 5 have variables as we want the ability
    ; to completely hide the ghost 
    
    ghostsprite1active .dsb 1
    ghostsprite2active .dsb 1
    ghostsprite3active .dsb 1
    ghostsprite4active .dsb 1
    ghostsprite5active .dsb 1    
    
    ; when calling showshape this variable lets it know whether it is drawing the main shape
    ; or the ghost shape
    
    drawingghost .dsb 1
    
    ; blockshapes holds the data (2 bytes) representing the current shape and orientation
    ; being show on screen

    blockshapes .dsb 2
    
    ; spriteindex holds the number of sprites being used by current shape
    spriteindex .dsb 1
    
    ; ghostspriteindex holds the number of sprites being used by current shape
    ghostspriteindex .dsb 1
    
    ; this holds whether the level is upside down (i.e. falls up rather than usual down)
    upsidedown .dsb 1
    
    ; the following variables are used if we need to update some background. Updating background
    ; is done by the NMI
    ; If a background update is required bgupdaterequired will be set to 1
    
    bgupdaterequired .dsb 1
    
    ; to  minimise the amount of work that needs to be done when drawing the background in NMI
    ; we use a buffer where most of the work has been done
    ; it has the following format (there can be more than one sequence)
    ; byte    0 = length of data (0 = no more data)
    ; byte    1 = high byte of target PPU address
    ; byte    2 = low byte of target PPU address
    ; bytes 3-X = the data to draw (number of bytes determined by the length)
    ; we reserve 60 bytes for this buffer (4x12) data + (4x3) header    
    
    bgbuf .dsb 60
    
    ; this is an index used when building the background buffer
    
    bgbufidx .dsb 1
    
    ; variable used by mult10 routine
    
    multtemp .dsb 1
    
    ; variable used by getmodulo routine
    
    getmodtemp .dsb 1
    
    ; variable used by CheckHighScore routine
    
    checkhighscoretemp .dsb 1
    
    ; variable used by atadd routine
    
    ataddtemp .dsb 1
    
    ; temp variable used by calculateghostposition routine
    
    calcghosttemp .dsb 1
    
    ; this holds the key press sensitivity, essentially this is the delay between keypress repeat
    ; 0 is fast, 1 is normal, 2 is slow
    sensitivity	.dsb	1
    
    ; ghost offset value pointer

    ghostpointer .dsb 1
    
    ; the following variables are used by the random number generator
    rnd4 .dsb 1
    rnd3 .dsb 1
    rnd2 .dsb 1
    random .dsb 1
    
    ; these are the default starting positions for the blocks
    
    startx .dsb 1
    starty .dsb 1
    upsidedownstarty .dsb 1
    
    ; a player is only allowed swap once (till the next shape is automatically picked)
    ; a value of 1 means they are allowed swap, otherwise they are not
    allowedswap	.dsb 1
    
    ; this holds what level the player is currently on
    currentlevel	.dsb	1
    
    ; this holds the difficulty level, 0 is normal, 1 is hard

    difficulty	.dsb 1
    
    ; timer used when deciding to auto drop the block
    pretim .dsb 1
    
    ; this holds the total number of lines completed so far this level (as a number)
    totalrowscompletednum		.dsb 1

    ; rows completed holds the number of rows filled (per check), bonus points for 4
    rowscompleted	.dsb 1
    
    ; this is set to 1 when a winning/complete line is detected
    winningline		.dsb 1
    
    ; the following is used when we are printing a string on-screen
    textprintaddr  .dsb 2
 
    ; this is a variable used when printing a string, it holds the number of chars to print
    printnumchars    .dsb 1 
    
    ; this is a variable used when printing a string, it holds the X pos to print
    printxpos   .dsb 1

    ; this is a variable used when printing a string, it holds the Y pos to print
    printypos   .dsb 1

    ; we set this variable when we want to draw a background shape on the screen, but we
    ; do not want it added to the playarea buffer
    ; 0 means do not add, 1 means add to buffer
    bufferaddactive     .dsb 1
    
    ; used by WaitFrame to determine if a VBlank has occurred - set by NMI
    sleeping    .dsb 1
    
    ; drop method. When set to 0 if the player presses drop then the piece drops in one go as
    ; far as it can. If set to 1 then the piece only goes down while the player holds the key
    ; when set to 1 acts like a 'down' key rather than a drop
    ; when set to 2, it acts like a mixture. A quick tap causes the piece to drop down fully, 
    ; while holding it down causes it to act like a 'down' key.
    dropmethod	.dsb 1
    
    ; this is used when the dropmethod is set to 2, used in the case when we want to say drop full
    fulldropactive  .dsb 1
    
    ; we use the following, with bit masking, to determine the buttons pressed
    buttonspressed  .dsb 1
    
    ; this stores the last buttons pressed
    lastbuttonspressed  .dsb 1
    
    ; if user is holding down the A key (drop) they may want to drop while its held down. We use this
    ; as a check when the drop method is 2 to determine if they actually want a full drop or not
    ; user may have held it down for a few goes, so it is not a quick tap
    
    dropbuttonpresscount    .dsb 1
    
    ; the following is used when we are updating a count e.g. the score
    updatecountaddr  .dsb 2
    
    ; this variable is set when you want to increase the account by that amount - this is a value between
    ; 0 and 9
    increaseamount  .dsb 1
    
    ; this is set when a new high score is set. 0 means not a new high score, 1 a new highscore
    newhighscore    .dsb 1
    
    ; this holds the number of pieces played this level
    piecesplayedthislevel	.dsb 1
    
    ; this holds the TV system being used (0: NTSC, 1: PAL, 2: Dendy; 3: unknown )
    tvsystem    .dsb 1
    
    ; this holds the address of the logo to be printed
    logoaddr    .dsb 2
    
    ; this holds the index within the logo we are printing
    logoidx .dsb 1
    
    ; sliding attempt counter. We try 20 times to find a row to slide, but if not we exit
    ; this is to prevent the (unlikely) case of no pieces currently being on the playarea
    slidingcounter	.dsb 1
    
    ; when we slide a row we wrap around the blocks, this holds the value of the wrapped around block
    slidingwraparoundtilenum	.dsb    1

    ; this is the temp holder for tilenums used in the sliding floors routine
    slidingtemptilenum	.dsb    1
    
    ; this is used by the drawarrow routine, 0 means hide the arrow, 1 means show it
    showarrow   .dsb 1
    
    ; the following is used when we are printing a 2 digit number on screen
    digitprint  .dsb 2
    
    ; variable used by print2digit routine
    digittemp .dsb 1
    
    ; the X co-ord used by printnumbers when printing
    printnumbersx .dsb 1
    
    ; the Y co-ord used by printnumbers when printing
    printnumbersy .dsb 1  

    ; this holds the lines target for this level
    targetlinesforthislevelnum	.dsb 1
    
    ; this holds which line the title arrow is currently pointing at
    titlearrowpos   .dsb 1
    
    ; this gets set to 1 when the player has asked to start the game
    startgamerequested  .dsb 1
    
    ; background tileset to use
    backgroundmode  .dsb 1
    
    ; following 4 bytes used by RLE decompressor
    RLE_LOW .dsb 1
    RLE_HIGH .dsb 1
    RLE_TAG .dsb 1
    RLE_BYTE .dsb 1
    
    ; used by WriteTextToScreen. If has value greater than 0 then this is the offset from the address passed
    ; to WriteTextToScreen to actually start reading from
    textoffset  .dsb 1
    
    ; used on level 6, this is the number of bombs defused so far
    bombsfound .dsb 1
    
    ; used on level 6, this is the last count of number of bombs defused so far
    bombsfoundpreviouscount .dsb 1
    
    ; used on level 6, this is the number of bombs remaining
    activebombs .dsb 1
    
    ; level 6 is timed, this stores the amount of time left in seconds - if reaches zero, game over
    leveltimer .dsb 1
    
    ; temp variable used by PrintOnScreenTimer
    timertemp .dsb 1
    
    ; music theme to use, 0=A,1=B,2=C and anything else is silence (music off)
    ingamemusic .dsb 1
    
    ; pieces left to play on level 7
    piecesleftthislevel .dsb 1
    
    ; used when generating the initial random values
    randomtemp .dsb 1
    
    ;used to determine what actions the buttons do, if 0 then down is drop, up is save
    ;if 1 then down is clockwise spin, up is anticlockwise spin
    controlleroption    .dsb 1