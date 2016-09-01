;
; defines.inc
; Part of the game dúshlán for the NES
;
; Copyright (c) 2016 Peter McQuillan 
; 
; All Rights Reserved. 
; 
; Distributed under the BSD Software License (see license.txt) 
; 
;

LEFTWALLX = 10
RIGHTWALLX = 21
BLANKSPACE = 8
BOTTOMY = 23    ; during normal play (i.e. not upside down, this would be the bottom row of playarea, not playable)
TOPYWHENUPSIDEDOWN = 3 ; if upside down this is the 'bottom' of the playarea
NEXTSHAPEX = 25
NEXTSHAPEY = 13     ; co-ords of the next shape area (where we draw the next shape)
SAVEDSHAPEX = 3
SAVEDSHAPEY = 13
SCOREX = 24
SCOREY = 6
HIGHSCOREX = 2
HIGHSCOREY = 6
RANDOMTILE = 29 ; this is the tile that gets displayed by the shooting star subroutine
BOMBTILE = 6
LEFTARROWTILE= 31
RIGHTARROWTILE= 30
LINESTOCOMPLETEX = 28
LINESTOCOMPLETEY = 21
LINESCOMPLETEDX = 24
LINESCOMPLETEDY = 21
TITLEARROWX = 4
TITLEARROWY = 20
TOTALNUMLEVELS = 10
BOMBSONLEVEL6 = 4  ; level 6 has bombs you have to defuse, this is the number to defuse
LEVEL6ALLOWEDTIME = 180 ; amount of time in seconds allowed to complete level 6
LEVEL7ALLOWEDPIECES = 50 ; amount of tiles allowed in level 7 to reach the goal
CLOCKMINX = 25
CLOCKMINY = 26
CLOCKSECX = 28
CLOCKSECY = 26
CLOCKSEPERATORX=27
CLOCKSEPERATORY=26
LEVELINFOPRINTX=18
LEVELINFOPRINTY=11
PIECESCOUNTDOWNX=26
PIECESCOUNTDOWNY=26
LEFTTEXTX=25
LEFTTEXTY=25
NEWHIGHSCOREX=13
NEWHIGHSCOREY=19