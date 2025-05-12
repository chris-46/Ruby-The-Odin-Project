# Contains the game engine, coordinates between the Game and Board classes to figure out what to do next.
class TicTacToe

  # The players needed by the TicTacToe object are provided for it.
  def initialize(p1,p2)
    @p1 = p1
    @p2 = p2

    @current_turn = rand() > 0.5 ? true : false # is player 1's turn boolean
  end
end