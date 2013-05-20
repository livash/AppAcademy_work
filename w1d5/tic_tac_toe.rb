require './treenode.rb'
class Board
  def self.blank_grid
    (0...3).map { [nil] * 3 }
  end

  def initialize(rows = self.class.blank_grid)
    @rows = rows
  end

  def dup
    # remember that `#rows` dups the rows too, so modifications to the
    # new board won't affect the old board.
    self.class.new(rows)
  end

  def empty?(pos)
    self[pos].nil?
  end

  def []=(pos, mark)
    x, y = pos[0], pos[1]
    @rows[x][y] = mark
  end

  def [](pos)
    x, y = pos[0], pos[1]
    @rows[x][y]
  end

  def rows
    # deep dup inner rows so that changes to this array won't be
    # reflected in board.
    @rows.map(&:dup)
  end

  def cols
    cols = [[], [], []]
    @rows.each do |row|
      row.each_with_index do |mark, col|
        cols[col] << mark
      end
    end

    cols
  end

  def diagonals
    down_diag = [[0, 0], [1, 1], [2, 2]]
    up_diag = [[0, 2], [1, 1], [2, 0]]

    [down_diag, up_diag].map do |diag|
      # Note the `(x,y)` inside the block; this unpacks, or
      # "destructures" the argument. Read more here:
      # http://tony.pitluga.com/2011/08/08/destructuring-with-ruby.html
      diag.map { |(x, y)| @rows[x][y] }
    end
  end

  def over?
    # style guide says to use `or`, but I (and many others) prefer to
    # use `||` all the time. We don't like two ways to do something
    # this simple.
    won? || drawn?
  end

  def won?
    not winner.nil?
  end

  def drawn?
    return false if won?

    # no empty space?
    @rows.all? { |row| row.none? { |el| el.nil? }}
  end

  def winner
    (rows + cols + diagonals).each do |triple|
      if [[:x] * 3, [:o] * 3].include?(triple)
        mark = triple[0]
        return mark
      end
    end

    nil
  end
end

class TicTacToe
  class IllegalMoveError < RuntimeError
  end

  def initialize(player1, player2)
    @turn = :x
    @players = {
      :x => player1,
      :o => player2
    }

    @board = Board.new
  end

  def board
    # let player look directly at board, but make sure it's a copy so
    # his modifications don't futz with our copy.
    @board.dup
  end

  def show
    # not very pretty printing!
    @board.rows.each { |row| p row }
  end

  def run
    until @board.over?
      play_turn
    end

    if @board.won?
      winning_player = @players[@board.winner]
      puts "#{winning_player.name} won the game!"
    else
      puts "No one wins!"
    end
  end

  private
  def play_turn
    while true
      current_player = @players[@turn]
      pos = current_player.move(self, @turn)

      break if place_mark(pos, @turn)
    end

    # swap next who's turn it will be next
    @turn = ((@turn == :x) ? :o : :x)
  end

  def place_mark(pos, mark)
    if @board.empty?(pos)
      @board[pos] = mark
      true
    else
      false
    end
  end
end

class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def move(game, mark)
    game.show
    while true
      puts "#{@name}: please select your space"
      x, y = gets.chomp.split(",").map(&:to_i)
      if HumanPlayer.valid_coord?(x, y)
        return [x, y]
      else
        puts "Invalid coordinate!"
      end
    end
  end

  private
  def self.valid_coord?(x, y)
    [x, y].all? { |coord| (0..2).include?(coord) }
  end
end

class ComputerPlayer
  attr_reader :name

  def initialize
    @name = "Tandy 400"
  end

  def move(game, mark)
    #hardcode first move to corner
    winner_move(game, mark) or random_move(game, mark)
  end


  def is_winning_node?(node, mark)
    node.value[:grid].winner == mark ? true : false
  end

  def build_move_tree
    #it is our turn, mark is our piece
    blank_board = Board.new
    mark = :x
    root = TreeNode.new(nil, {:board => blank_board, :next_move => mark})
    last_round = [blank_board]

    9.times do |i|
      p "#{i}th round"
      new_boards = []
      last_round.each do |recent_board|
        if recent_board.winner != nil
          p "#{recent_board.rows.inspect} was a winner"
          next
        end
        possible_boards(recent_board, mark).each do |possible_board|

          parent_node = root.bfs(nil) { |node| node.value[:board] == recent_board }
          TreeNode.new(parent_node, {:board => possible_board, :next_move => opposite_mark(mark) })

          new_boards << possible_board
          break if possible_board.winner != nil
        end
      end
      mark = opposite_mark(mark)
      last_round = new_boards.dup
    end
    root
  end

  def opposite_mark(mark)
    case mark
    when :o then :x
    when :x then :o
    end
  end

  def possible_boards(board, mark)
    boards = []
    board.rows.each_with_index do|row, idx1|
      row.each_with_index do |el, idx2|
        pos = [idx1, idx2]
        if board.empty?(pos)
          board_c = board.dup
          board_c[pos] = mark
          boards << board_c
        end

      end
    end
    boards #returns Board objects
  end


  def winner_move(game, mark)
    (0..2).each do |x|
      (0..2).each do |y|
        board = game.board
        pos = [x, y]

        next unless board.empty?(pos)
        board[pos] = mark

        return pos if board.winner == mark
      end
    end

    # no winning move
    nil
  end

  def random_move(game, mark)

    board = game.board
    while true
      range = (0..2).to_a
      pos = [range.sample, range.sample]

      return pos if board.empty?(pos)
    end
  end
end
