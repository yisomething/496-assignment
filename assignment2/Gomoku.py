#!/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
#!/usr/bin/python3
#/usr/local/bin/python3
# Set the path to your python3 above

from gtp_connection import GtpConnection,format_point
from board_util import GoBoardUtil
from simple_board import SimpleGoBoard
import copy
import signal

def signal_handler(signum, frame):
    raise TimeoutError
signal.signal(signal.SIGALRM,signal_handler)

class Gomoku():
    def __init__(self):
        """
        Gomoku player that selects moves randomly 
        from the set of legal moves.
        Passe/resigns only at the end of game.

        """
        self.name = "GomokuAssignment2"
        self.version = 1.0
        self.time = 1


    def solve(self,board):
        signal.alarm(self.time)
        try:
            return negamaxBoolean(board)
        except TimeoutError:
            return None
    
    def get_move(self, board, color):
        board.current_player = color
        result = self.solve(board)
        if result and result[1]:
            return result[1]
        return GoBoardUtil.generate_random_move_gomoku(board)


def negamaxBoolean(board):
    game_end, winner = board.check_game_end_gomoku()
    if game_end:
        return [1 if board.current_player == winner else -1, None]
    moves = GoBoardUtil.generate_legal_moves_gomoku(board)
    if not moves:
        return [0, None]

    draw_result = None
    for m in GoBoardUtil.generate_legal_moves_gomoku(board):
        board_new = copy.deepcopy(board)        
        board_new.play_move_gomoku(m,board_new.current_player)
        result = negamaxBoolean(board_new)
        result[0] = -1 * result[0]
        if result [0] >= 0:
            result[1] = m
        else:
            result[1] = None
        if result[0] == 1:
            return result
        elif result[0] == 0:
            draw_result = result
    if draw_result:
        return draw_result
    return [-1, None]

def run():
    """
    start the gtp connection and wait for commands.
    """
    board = SimpleGoBoard(7)
    con = GtpConnection(Gomoku(), board)
    con.start_connection()

if __name__=='__main__':
    run()
