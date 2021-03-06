require_relative "poly_tree_node"
require 'debugger'

class Board
  attr_reader :board, :explored_tiles_array
  
  def initialize(str = "")
    lines = str.split("\\n")
    p lines.length
    @board = []
    lines.each_with_index do |line, idx|
      next if idx == 0 
      @board << []
      line.split("").each_with_index do |position, j|
          @board[idx - 1] << position
      end
    end
    
    @explored_tiles_array = []
  end

  def build_tree(start_point) # start_point = [row, col]
    
    root = PolyTreeNode.new(start_point)
    root = self.add_leaves_to_tree_at(root)
    
    roots_array = [root]
    until roots_array.empty?
      #p roots_array.length
      node = roots_array.pop
      @explored_tiles_array << node.value
      node.children.each do |child|
        roots_array << self.add_leaves_to_tree_at(child)
      end

    end
    
    root
  end
  
  def add_leaves_to_tree_at(root)
    possible_moves = self.allowed_moves(root.value)
    # add nodes to the root
    possible_moves.each do |move|
      node = PolyTreeNode.new(move)
      root.add_child(node)
    end
    
    root
  end
  
  # returns an array of positions [row, col]
  # which are available for a move
  def allowed_moves(position_array)
    
    row, col = position_array.first, position_array.last
    results = []
    #debugger
    if self.board[row][col] == "_"
      results << [row - 1, col] if self.is_valid_move?(row - 1, col) and self.is_not_ceiling?(row - 1, col)
      results << [row, col - 2] if self.is_not_wall?(row, col - 1) and self.is_valid_move?(row, col - 2)
      results << [row, col + 2] if self.is_not_wall?(row, col + 1) and self.is_valid_move?(row, col + 2)

    elsif self.board[row][col] == " "
      results << [row + 1, col] if self.is_valid_move?(row + 1, col) 
      results << [row - 1, col] if self.is_valid_move?(row - 1, col) and self.is_not_ceiling?(row - 1, col)
      results << [row, col - 2] if self.is_not_wall?(row, col - 1) and self.is_valid_move?(row, col - 2)
      results << [row, col + 2] if self.is_not_wall?(row, col + 1) and self.is_valid_move?(row, col + 2)
 
    else
      puts "Incorrect move #{position_array}"
    end
    
    results
  end
  
  def print_board
    board.each do |row| 
      print row
      puts
    end
  end
  
  #rows, columns
  def dimentions
    [board.length, board.first.length]
  end
  
  #private
  def is_valid_move?(row, col)
    return false if self.is_out_of_bounds?(row, col)
    return false if board[row][col] == "|"
    return false if self.was_visited_at?(row, col)
    
    true
  end
  
  def is_not_ceiling?(row, col)
    self.board[row][col] != "_"
  end
  
  def is_not_wall?(row, col)
    board[row][col] != "|"
  end
  
  def was_visited_at?(row, col)
    explored_tiles_array.include?([row, col])
  end
  
  def is_out_of_bounds?(row, col)
    rows, cols = self.dimentions
    !(row > -1 and col > -1 and row < rows and col < cols)
  end
end

if $PROGRAM_NAME == __FILE__
  b = Board.new(" ___________________ \n|_  |  ___     _   _|\n| | |  _|___| |_  | |\n|  _____|_  |  _|   |\n| | |  _  |  _|_  | |\n|___| | | |  _  | | |\n| |_  |  _____| | |_|\n| |___| |  _|   |_  |\n|     | |___  |_  | |\n|_| | |  _  |_| |_| |\n|___|___|_______|___|\n")
  p b.dimentions
  #b.board[0][5] = "X"
  # a = [[0, 1], [0, 3], [1, 3], [2, 3], [2, 1], [3, 1], [4, 1], [4, 3], [3, 3], [1, 1], [2, 5], [1, 5], [0, 5], [0, 7], [0, 9], [0, 11], [1, 11], [1, 9], [0, 13], [1, 13], [2, 13], [3, 13], [3, 11], [4, 11], [5, 11], [5, 9], [4, 9], [3, 9], [3, 7], [3, 5], [4, 5], [5, 5], [6, 5], [6, 3], [5, 3], [5, 7], [6, 7], [7, 7], [8, 7], [9, 7], [9, 5], [8, 5], [7, 5], [7, 3], [8, 3], [9, 3], [9, 1], [7, 1], [8, 1], [6, 1], [5, 1], [8, 9], [8, 11], [9, 11], [9, 9], [9, 13], [9, 15], [8, 15], [4, 7], [5, 13], [4, 13], [4, 15], [5, 15], [6, 15], [7, 15], [7, 17], [8, 17], [6, 13], [7, 13], [8, 13], [7, 11], [7, 9], [6, 9], [6, 11], [2, 11], [2, 9], [2, 15], [0, 15], [0, 17], [1, 17], [2, 17], [3, 17], [4, 17], [5, 17], [6, 17], [6, 19], [7, 19], [8, 19], [9, 19]]
#   a.each do |position|
#     b.board[position.first][position.last] = "X"
#   end
  b.print_board
  # p b.board[0][1]
  # p b.board[0][3]
   # p b.is_valid_move?(0, 5)
 #   p b.was_visited_at?(0, 5)
 #   p b.is_out_of_bounds?(0, 5)
  #debugger
   root2 = b.build_tree([9,19])
  # #p root2.children.map { |child| child.value }
  # #p root2.children.first.children.map { |child| child.value }
  
  visited = root2.dfs_path([0,1])
  # 
   p parse_path(root2, visited).map {|node| node.value}
end