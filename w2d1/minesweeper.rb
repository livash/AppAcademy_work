require 'yaml'

class Game

  def initialize
    @player = Player.new
  end

  public
  def run
    setup_game ## call to a method
    continue_game = true
    game_won = false
    while continue_game
      @board.board_display
      move = @player.ask_for_move #= {:x => val, :y => val, :tag => 'f'} or 'save'
      if move == 'save'
        continue_game = false
        save
        return
      else
        # add move returrns two Boolean variables
        continue_game, game_won = @board.add_move(move)
      end
    end
    if game_won
      puts "You win!"
    else
      puts "Game over"
      @board.board_display
    end
  end

  private

  def setup_game
    puts "Please enter 'new' to start a new game"
    puts "or enter file_name to load..."
    input = gets.chomp
    if input == 'new'
      board_size = @player.ask_for_board_size
      @board = Board.new(board_size)
    else # file name was given
      open(input)
    end
  end

  def save
    file_name = "minesweeper_game_saved.txt"
    board_to_save = @board.to_yaml
    File.open(file_name, "w") do |file|
      file.puts board_to_save
    end
    puts "Game has been saved to #{file_name}."
  end

  def open(file_name)
      @board = YAML::load(File.read(file_name))
  end
end

class Board
  attr_accessor :board, :mines_board

  def initialize(size = 9)
    @mines_array = generate_mines(size) # return array of coords
    @board = generate_board(size)
  end

  def board_display
    @board.each do |row|
      puts row.join(' ')
    end
  end

  def add_move(move) #returns true or fasle for game+status
    position = [move[:row],move[:column]]
    if move[:tag] == '_'
      # check if mine at move position
      if @mines_aroay.include?(position)
        puts "You have a mine here"
        @mines_array.each do |mine|
          board[mine[0]][mine[1]] = 'M'
        end
        return [false, false]
      else
        to_return, game_won = true, false
        open_position(position)
        game_won = @mines_array.all? do |mine|
          row, column = mine
          @board[row][column] == 'F'
        end
      end
    else # assume move[-1] == f
      to_return = true # set flag'
      @board[move[:row]][move[:column]] = 'F'
      game_won = @mines_array.all? do |mine|
        row, column = mine
        @board[row][column] == 'F'
      end
      to_return = false if game_won == true
    end
    [to_return, game_won]
  end

  private

  def open_position(position_array) #use for side effect
    queue = []
    used_positions = []
    queue << position_array
    until queue.size == 0
      cell = queue.shift
      used_positions << cell
      row, column = cell
      adjacent_mines = number_of_adjacent_mines(cell)
      if adjacent_mines > 0
        @board[row][column] = adjacent_mines.to_s
      else
        @board[row][column] = '_'
        # push onto queue open neighbours
        neighbours_array = all_neighbours(cell) #
        open_neighbours_array = neighbours_array.reject do |neighbour|
          cell_is_occupied?(neighbour) ||
          used_positions.include?(neighbour) #||
        end
        queue += open_neighbours_array
      end
    end
  end

  def number_of_adjacent_mines(cell_position)
    row, column = cell_position
    all_neighbours = all_neighbours(cell_position)
    number_of_mines = 0
    all_neighbours.each do |cell|
      number_of_mines += 1 if @mines_array.include?(cell)
    end
    number_of_mines
  end

  def adjacent_to_mine?(cell_position)
    row, column = cell_position
    all_neighbours = all_neighbours(cell_position)
    if (all_neighbours - @mines_array).size < all_neighbours.size
      false
    else
      true
    end
  end

  def all_neighbours(cell_position)
    row, column = cell_position
    modifiers_array = [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
    ]
    neighbours = []
    modifiers_array.each do |modifier|
      if (0...@board.size).include?(row + modifier[0]) && (0...@board.size).include?(column + modifier[1])
        neighbours << [row + modifier[0], column + modifier[1]]
      end
    end
    neighbours
  end

  def orthogonal_neighbours(cell_position)
    row, column = cell_position
    modifiers_array = [
      [-1, 0],
      [0, -1],
      [0, 1],
      [1, 0],
    ]
    neighbours = []
    modifiers_array.each do |modifier|
      if (0...@board.size).include?(row + modifier[0]) && (0...@board.size).include?(column + modifier[1])
        neighbours << [row + modifier[0], column + modifier[1]]
      end
    end
    neighbours
  end

  def cell_is_occupied?(cell_position)
    row, column = cell_position
    if @board[row][column] == 'F'
      true
    elsif @mines_array.include?(cell_position)
      true
    else
      false
    end
  end

  private
  def generate_board(size)
    board = []
    size.times do |rows|
      row = []
      size.times do |row_element|
        row << "*"
      end
      board << row
    end
    board
  end

  def generate_mines(size)
    case size
    when 9
      num = 10
    when 16
      num = 40
    when 3
      num = 1
    end

    mines_array = []
    until mines_array.count == num
      row = rand(0..size - 1)
      column = rand(0..size - 1)
      mines_array << [row, column] unless mines_array.include?([row, column])
    end
    mines_array
  end
end


class Player

  def ask_for_board_size
    puts "What board size would you like to play?"
    gets.chomp.to_i
  end

  def ask_for_move
    puts "Insert move as following <row, collumn, tag>"
    puts "Use 'f' - to put a flag, use '_' - to check position"
    puts "What is your move?"
    input_string = gets.chomp
    if input_string == 'save'
      return 'save'
    else
      input_array = input_string.split(',')
      row = input_array[0].to_i
      column = input_array[1].to_i
      tag = input_array[2].downcase
      {:row => row, :column => column, :tag => tag}
    end
  end
end

if __FILE__ == $PROGRAM_NAME

  game = Game.new
  game.run

end