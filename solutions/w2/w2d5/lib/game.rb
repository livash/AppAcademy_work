require_relative 'board'
require_relative 'piece'

# I cheaped out on this one; it's pretty bare-bones.
class Game
  def initialize
    @board = Board.new
  end
  
  def print
    @board.print
  end
  
  def move(from_pos, to_positions)
    @board[from_pos].perform_moves(to_positions)
  end
  
  def self.test
    g = Game.new
    
    # Red advances
    g.print
    g.move([2, 0], [[3, 1]])
    g.print
    g.move([3, 1], [[4, 2]])
    # Black jumps
    g.print
    g.move([5, 1], [[3, 3]])

    g.print
    
    g
  end
end