# tests that gen_move uses Gomoku rules instead of Go rules
boardsize 3
1 genmove b
#?[[a-z][0-9]]
2 genmove w
#?[[a-z][0-9]]
3 genmove b
#?[[a-z][0-9]]
4 genmove w
#?[[a-z][0-9]]
5 genmove b
#?[[a-z][0-9]]
6 genmove w
#?[[a-z][0-9]]
7 genmove b
#?[[a-z][0-9]]
8 genmove w
#?[[a-z][0-9]]
9 genmove b
#?[[a-z][0-9]]
# board is full
10 genmove w
#?[pass]

boardsize 5
clear_board

play b a1
play b a2
play b a3
play b a4
play b a5
# somebody has won
11 genmove w
#?[resign]
