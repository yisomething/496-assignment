# tests play command for the rules of Gomoku
# if these tests fail you probably didn't implement play_cmd correctly
boardsize 3
clear_board

# correct color
1 play d c3
#?[illegal move: "d" wrong color]

# correct coordinates
# beyond columns
2 play b d4
#?[illegal move: "d4" wrong coordinate]
# minimum row
3 play b a0
#?[illegal move: "a0" wrong coordinate]
# maximum row
4 play b a4
#?[illegal move: "a4" wrong coordinate]
# Can't play occupied
play w b1
5 play b b1
#?[illegal move: "b1" occupied]

clear_board
# can play in eyes
play b b1
play b b2
play b a2
6 play b a1
#?[]

clear_board
# allow suicide
play b b1
play b b2
play b a2
7 play w a1
#?[]

clear_board
# no captures
play w a1
play b b1
play b b2
play b a2
8 play w a1
#?[illegal move: "a1" occupied]


