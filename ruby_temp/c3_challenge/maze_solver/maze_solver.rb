=begin
Task: Write a function that reads in a string representation 
of a maze and outputs a string of letters; N, S, E or W 
where each letter corresponds to North, South, East or West 
such that the maze is solved from the top left corner to the bottom right.
=end

require_relative "poly_tree_node"
require_relative "board"
require 'debugger'

def solve_maze(file_name)
  content = File.read(file_name)
  p content
  board = Board.new(content)
  board.print_board
  # buils a Tree of possible moves
  # from the top left "TL" corner of the maze
  root = board.build_tree([0,1]) 
  # is there a connection between TL and BR corners
  if root.dfs([9,19])
    puts "there is a path between TL and BR corners of the maze"
  end
  # I did not figureed out the way to get the shortest path
  # between the two, but I can say that there is a path
end

if $PROGRAM_NAME == __FILE__
  solve_maze("maze.txt")
end







