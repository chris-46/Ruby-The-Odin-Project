# Keeps track of board state, a 2D array of size 3x3
# Also keeps a stack which keeps track of which square to free
# Draws the board
# Each TicTacToe Objects owns one Board -> Composition
# For each player's turn, the TicTacToe tells it's Board object which player and square to fill.

# Checks game state if a player has won after every turn
class Board

  def initialize(p1s, p2s)
    @p1_symbol = p1s
    @p2_symbol = p2s
    @state = Array.new(3, 3, '') 
  end

  def print_board

  end

  def check_game_state()

  end


end