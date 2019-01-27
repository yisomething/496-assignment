# Use to test correct output from gogui-rules_final_result
boardsize 3
clear_board
# if first command
1 gogui-rules_final_result
#?[unknown]
play b a1
play b a2
play b a3
play b b1
play b b2
play b b3
play b c1
play b c2
play b c3
# board is full
2 gogui-rules_final_result
#?[draw]

boardsize 5
clear_board
play b a1
3 gogui-rules_final_result
#?[unknown]
play b a2
play b a3
play b a4
play b a5
# black win vertical
4 gogui-rules_final_result
#?[black]
play w b1
play w b2
play w b3
play w b4
play w b5
# black won first
5 gogui-rules_final_result
#?[black]
clear_board
play w a1
play w a2
play w a3
play w a4
play w a5
# white win
6 gogui-rules_final_result
#?[white]
play b b1
play w b2
play b b3
play w b4
play b b5
play b c1
play w c2
play b c3
play w c4
play b c5
play b d1
play w d2
play b d3
play w d4
play b d5
play b e1
play w e2
play b e3
play w e4
play b e5
# white already won, no draw
7 gogui-rules_final_result
#?[white]

clear_board

play b a1
play b b1
play b c1
play b d1
play b e1
# horizontal win
8 gogui-rules_final_result
#?[black]

clear_board
play b a1
play b b2
play b c3
play b d4
play b e5
# negative diagonal
9 gogui-rules_final_result
#?[black]

clear_board
play b e1
play b d2
play b c3
play b b4
play b a5
# positive diagonal
10 gogui-rules_final_result
#?[black]
