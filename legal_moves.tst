# Use this file to test your implementation of the gogui-rules_legal_moves
# command.
boardsize 3
clear_board
1 gogui-rules_legal_moves
#?[a1 a2 a3 b1 b2 b3 c1 c2 c3]
play b a1
play b a2
play b a3
play b b1
play b b2
play b b3
2 gogui-rules_legal_moves
#?[c1 c2 c3]
play w c1
play w c2
play w c3
# if board is full
3 gogui-rules_legal_moves
#?[]
boardsize 5
clear_board
play b a1
play b b1
play b c1
play b d1
play b e1
# if somebody has won
4 gogui-rules_legal_moves
#?[]
