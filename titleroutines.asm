;
; titleroutines.asm
; Part of the game dúshlán for the NES
;
; Copyright (c) 2016 Peter McQuillan 
; 
; All Rights Reserved. 
; 
; Distributed under the BSD Software License (see license.txt) 
; 
;

;; Title screen loop
; This is the title screen loop. Here we show the game logo, show options that the player
; can configure and play the title music

TitleScreen:

    JSR WaitFrame   ; wait for the NMI VBlank
    JSR ClearScreen
    
    LDA #<dushlanlogo1
    STA logoaddr
    LDA #>dushlanlogo1
    STA logoaddr + 1
    
    JSR PrintWordsWithBlocks
    
    LDA #<dushlanlogo2
    STA logoaddr
    LDA #>dushlanlogo2
    STA logoaddr + 1
    
    JSR PrintWordsWithBlocks
    
    LDA #<copyright_str
    STA textprintaddr
    LDA #>copyright_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    
    LDA #<music_by_str
    STA textprintaddr
    LDA #>music_by_str
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    
    LDA #<msg_menu_start
    STA textprintaddr
    LDA #>msg_menu_start
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    
    LDA #<msg_menu_difficulty
    STA textprintaddr
    LDA #>msg_menu_difficulty
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    
    LDA #<msg_menu_dropmethod
    STA textprintaddr
    LDA #>msg_menu_dropmethod
    STA textprintaddr + 1
   
    JSR WriteTextToScreen
    
    LDA #<msg_menu_ingamemusic
    STA textprintaddr
    LDA #>msg_menu_ingamemusic
    STA textprintaddr + 1
   
    JSR WriteTextToScreen
    
    LDA #<msg_menu_controls
    STA textprintaddr
    LDA #>msg_menu_controls
    STA textprintaddr + 1
   
    JSR WriteTextToScreen
    
    JSR DrawTitleArrow
    JSR WriteDifficultyLevel
    JSR WriteDropMethod
    JSR WriteMusicChoice
    JSR WriteControllerOption
    
    lda #song_index_Title
    sta sound_param_byte_0
    jsr play_song  

TitleScreenLoop:

TitleLatchController:

    JSR ReadFromController1
    
    ; Button status for each controller is returned in the following order: A, B, Select, Start, Up, Down, Left, Right.
   
    LDA buttonspressed ; player 1 - A 
    AND #%10000000
    CMP #$00
    BEQ TitleReadB 

 ; do stuff for A button 
 
    JSR SelectAtTitleArrow
    JSR SmallDelay
 

TitleReadB: 
    LDA buttonspressed ; player 1 - B 
    AND #%01000000 
    CMP #$00
    BEQ TitleReadSelect 

 ; Do stuff for B button 
 
TitleReadSelect: 
    LDA buttonspressed ; player 1 - Select 
    AND #%00100000 
    CMP #$00
    BEQ TitleReadStart 
    
    JSR SelectAtTitleArrow
    JSR SmallDelay


TitleReadStart: 
    LDA buttonspressed ; player 1 - Start 
    AND #%00010000
    CMP #$00    
    BEQ TitleReadUp 

 ; Stuff for Start button 
 
    LDA #1
    STA startgamerequested

TitleReadUp: 
    LDA buttonspressed ; player 1 - Up 
    AND #%00001000
    CMP #$00
    BEQ TitleReadDown 

    ; Stuff for Up button   
    JSR MoveTitleArrowUp
    JSR SmallDelay

TitleReadDown: 
    LDA buttonspressed ; player 1 - Down 
    AND #%00000100
    CMP #$00    
    BEQ TitleReadLeft 
    
    ; Stuff for Down button
    JSR MoveTitleArrowDown
    JSR SmallDelay

TitleReadLeft: 
    LDA buttonspressed ; player 1 - Left 
    AND #%00000010
    CMP #$00
    BEQ TitleReadRight 

    ; Stuff for Left button 


TitleReadRight: 
    LDA buttonspressed ; player 1 - Right 
    AND #%00000001
    CMP #$00
    BEQ TitleNotRight 

    ; Stuff for Right button

    
TitleNotRight: 

    LDA startgamerequested
    CMP #1
    BEQ title1
    ; if game not started, keep in title loop
    JMP TitleScreenLoop
    
title1:
    ; reset startgamerequested, then start the game
    JSR HideAllSprites
    JSR PlayInGameMusic
    LDA #0
    STA startgamerequested
    JMP StartGame
    
; this draws the title arrow at the position pointed to by titlearrowpos
DrawTitleArrow:
    
    LDX #TITLEARROWX
    LDA #TITLEARROWY
    CLC
    ADC titlearrowpos
    TAY

    JSR ConvertToPixels
    
    LDA tmpy
    STA $0200
    LDA #RIGHTARROWTILE
    STA $0201
    LDA #1
    STA $0202
    LDA tmpx
    STA $0203 
    
    RTS
    
; this moves the arrow up on the title screen
MoveTitleArrowUp:
    ; titlearrowpos cannot be less than 0
    
    LDA titlearrowpos
    CMP #0
    BEQ mtau1
    
    ; titlearrowpos is > 0, so lets decrement it
    DEC titlearrowpos
    JSR DrawTitleArrow
    
mtau1:
    RTS
    
; this moves the arrow down on the title screen
MoveTitleArrowDown:
    ; titlearrowpos cannot be more than 4
    
    LDA titlearrowpos
    CMP #4
    BEQ mtad1
    
    ; titlearrowpos is < 4, so lets increment it
    INC titlearrowpos
    JSR DrawTitleArrow

mtad1:   
    RTS

; this selects the option at the arrow, either start game or change menu setting
SelectAtTitleArrow:

    LDA titlearrowpos
    CMP #0
    BEQ sata1
    CMP #1
    BEQ sata2
    CMP #2
    BEQ sata6
    CMP #3
    BEQ sata8
    CMP #4
    BEQ sata10
    RTS
sata1:
    ; start game selected
    LDA #1
    STA startgamerequested
    RTS
sata2:
    ; difficulty selected -  0 is normal, 1 is hard
    LDA difficulty
    CMP #0
    BEQ sata3
    JMP sata4
sata3:
    ; currently normal, set to hard
    LDA #1
    STA difficulty
    JMP sata5
sata4:
    ; currently hard, set to normal
    LDA #0
    STA difficulty
sata5:
    JSR WriteDifficultyLevel
    RTS
    
sata6:
    ; drop method, values are 0, 1 and 2
    INC dropmethod
    LDA dropmethod
    CMP #3
    BNE sata7
    LDA #0
    STA dropmethod
    
sata7:
    JSR WriteDropMethod
    RTS
sata8:
    ; music choice, values are 0,1,2 and 3
    INC ingamemusic
    LDA ingamemusic
    CMP #4
    BNE sata9
    LDA #0
    STA ingamemusic
sata9:
    JSR WriteMusicChoice
    RTS
sata10:
    ; controller choice values are 0 and 1
    INC controlleroption
    LDA controlleroption
    CMP #2
    BNE sata11
    LDA #0
    STA controlleroption
    
sata11:
    JSR WriteControllerOption
    RTS
    
; this displays the current controller choice on the title screen
WriteControllerOption:
    LDA controlleroption
    CMP #0
    BEQ wco1
    JMP wco2
wco1:    
    LDA #<msg_menu_controls_normal
    STA textprintaddr
    LDA #>msg_menu_controls_normal
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS
wco2:
    LDA #<msg_menu_controls_alternate
    STA textprintaddr
    LDA #>msg_menu_controls_alternate
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS 
    

; this displays the current difficulty level on the title screen
WriteDifficultyLevel:
    LDA difficulty
    CMP #0
    BEQ wdl1
    JMP wdl2
wdl1:    
    LDA #<msg_menu_difficulty_normal
    STA textprintaddr
    LDA #>msg_menu_difficulty_normal
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS
wdl2:
    LDA #<msg_menu_difficulty_hard
    STA textprintaddr
    LDA #>msg_menu_difficulty_hard
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS    
    
; this displays the current drop method being used on the title screen   
WriteDropMethod:

    LDA dropmethod
    CMP #0
    BEQ wdm1
    CMP #1
    BEQ wdm2
    CMP #2
    BEQ wdm3
    RTS
    
wdm1:
    LDA #<msg_menu_dropmethod_normal
    STA textprintaddr
    LDA #>msg_menu_dropmethod_normal
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS
wdm2:
    LDA #<msg_menu_dropmethod_likedown
    STA textprintaddr
    LDA #>msg_menu_dropmethod_likedown
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS
wdm3:    
    LDA #<msg_menu_dropmethod_mixture
    STA textprintaddr
    LDA #>msg_menu_dropmethod_mixture
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS
    
; this displays the music choice being used on the title screen   
WriteMusicChoice:

    LDA ingamemusic 
    CMP #0
    BEQ wmc1
    CMP #1
    BEQ wmc2
    CMP #2
    BEQ wmc3
    CMP #3
    BEQ wmc4    
    RTS
    
wmc1:
    LDA #<msg_menu_ingamemusic_themeA
    STA textprintaddr
    LDA #>msg_menu_ingamemusic_themeA
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS
wmc2:
    LDA #<msg_menu_ingamemusic_themeB
    STA textprintaddr
    LDA #>msg_menu_ingamemusic_themeB
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS
wmc3:    
    LDA #<msg_menu_ingamemusic_themeC
    STA textprintaddr
    LDA #>msg_menu_ingamemusic_themeC
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS  
wmc4:    
    LDA #<msg_menu_ingamemusic_silence
    STA textprintaddr
    LDA #>msg_menu_ingamemusic_silence
    STA textprintaddr + 1
    
    JSR WriteTextToScreen
    RTS     