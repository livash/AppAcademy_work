#game
require 'debugger'
class Game
  attr_accessor :players, :board
  def initialize
    @board = []
    9.times {@board << "-"}
    @players = []
  end

  def play
    if @players.size <2

      count_name = 1
      until @players.size == 2
       self.add_player(ComputerPlayer.new("C#{count_name}"))
       count_name += 1
      end
    end
    if @players.first.is_a?(HumanPlayer) && @players.last.is_a?(HumanPlayer)
      loop do

        puts "#{@players.first.name} your move "
        player1_move = gets.chomp
        move(player1_move, @players.first)
        print_board
        puts "You WIN!" if game_over?
        break if game_over?


        puts "#{@players.last.name} your move "
        player2_move = gets.chomp
        move(player2_move, @players.last)
        print_board
        puts "You WIN!" if game_over?
        break if game_over?
      end
    elsif @players.first.is_a?(HumanPlayer) && @players.last.is_a?(ComputerPlayer)
      loop do

        puts "#{@players.first.name} your move "
        player1_move = gets.chomp
        move(player1_move, @players.first)
        print_board
        puts "You WIN!" if game_over?
        break if game_over?

        puts "Computer #{@players.last.name}player move:"
        move(rand(9), @players.last)
        puts "#{@players.last.name} WINS!" if game_over?
        break if game_over?
      end
    elsif @players.first.is_a?(ComputerPlayer)&& @players.last.is_a?(ComputerPlayer)
      loop do
        puts "Computer #{@players.first.name}player move:"
        move(rand(9), @players.first)
        puts "#{@players.first.name} WINS!" if game_over?
        break if game_over?

        puts "Computer #{@players.last.name}player move:"
        move(rand(9), @players.last)
        puts "#{@players.last.name} WINS!" if game_over?
        break if game_over?
      end
    end
  end

  def game_over?

    if !@board.include?("-")
      puts "Its a Draw!"
      Process.exit(0)
    end

    win_sequence = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
    ]
    arr1 = []
    arr2 = []
    #get indexes for player 1 from the board
    @board.each_with_index do |tile, i|
      arr1 << i if tile == @players.first.name
      arr2 << i if tile == @players.last.name
    end
    win_sequence.each do |sequence|
      return true if sequence-arr1 == [] || sequence - arr2 == []
    end
    false
  end

  def move(player_move, player)

      if @board[player_move.to_i] == "-"
        @board[player_move.to_i] = player.name
      else
        if player.is_a?(HumanPlayer)
          puts "wrong move, try again."
          new_move = gets.chomp.to_i
          move(new_move, player)
        else
        move(rand(9), player)
        end
      end


  end

  def add_player(player)
    @players << player
  end

  def print_board
    puts @board[0..2].join("  ")
    puts @board[3..5].join("  ")
    puts @board[6..8].join("  ")
  end
end

class HumanPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class ComputerPlayer
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  p1 = HumanPlayer.new("J")
  p2 = HumanPlayer.new("O")

  game.add_player(p1)
  game.add_player(p2)

  game.play
end
