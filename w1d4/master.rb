# This is code for a mastermind game.

class MasterMind
  NUMBER_OF_PLAYS = 10
  # randomly generates key at initialization
  # ask user for input
  # compare to key
  # outputs feedback
  def initialize
    @board = Board.new
    @board.generate_key

    #@board.key = %w{P P B G} # explicit key
  end

  def run
    puts "This is your board:"
    @board.display
    answer = []
    guess_number = 0
    while answer != [2,2,2,2] && guess_number < NUMBER_OF_PLAYS
      puts "Input your guess ...."
      puts "key is #{@board.key}"
      input = gets.chomp
      answer = @board.insert_guess(input)
      #answer = @board.insert_guess("GGPP") # explicit guess
      @board.display
      guess_number += 1
    end
    if answer == [2,2,2,2]
      puts "YOU WIN!!!!!!!!!!!"
    else # guess_number < 10
      puts "Game OVER .... :("
    end
  end

end

class Board
  MARBLES = %w{R G B Y O P}
  attr_accessor :rows, :guess_number, :key
  # initialize to blank grid
  # key
  # populates gueses (Board::populate)
  # displays board
  # pa\egs of right color in right spot
  # pegs of right color


  def self.blank_grid
    (0...10).map { ['-'] * 4}
  end

  def initialize(rows = self.class.blank_grid)
    @rows = rows
    @guess_number = 0
    @feedback = self.class.blank_grid
    #NOTE TO SELF
    # make array history = [{:row => [----], :feedback => [-----]}, {}, {}....]
  end

  def display
    puts "YOUR GUESS           FEEDBACK"
    @rows.each_with_index do |row, index|
      print row, @feedback[index]
      puts
    end
  end

  def random_guess
    @guess_key = []
    4.times {@guess_key << MARBLES.sample}
    @guess_key
  end

  def generate_key
    @key = []
    4.times {@key << MARBLES.sample}
    puts "key is: #{@key}"
    @key
  end

  def insert_guess(string)
    guess = string.split('')[0..3]
    @rows[@guess_number] = guess
    @guess_number += 1
    check_guess_color
  end

  # 2 - correct color, correct position
  # 1 - correct color
  # 0 - neither correct
  def check_guess_exact_position
    answer = []
    temp = @rows[@guess_number - 1].dup
    temp_key = @key.dup
    @key.each_with_index do |el, i|
      if el == temp[i]
        answer << 2
        temp[i] = 0
        temp_key[i] = 0
      end
    end
    [answer, temp, temp_key]
  end

  def check_guess_color
    answer, temp, temp_key = check_guess_exact_position
    #return answer if answer.all? {|el| el == 2}
    puts "temp = #{temp}"
    color_answer = []
    #@rows[@guess_number - 1].each_with_index do |el, i|
    temp.each_with_index do |el, i|
      if temp_key.include?(el) && temp[i] != 0 #(......)
        color_answer << 1
        temp_key[temp_key.index(el)] = 0
      end

    end
    answer += color_answer
    until answer.size == 4
      answer << 0
    end
    @feedback[@guess_number - 1] = answer # should be size == 4
    answer
  end

end

if __FILE__ == $PROGRAM_NAME
  game = MasterMind.new
  game.run
=begin
  b = Board.new
  b.display
  b.key = %w{R R R P}
  b.insert_guess("ROBR")
  b.insert_guess("ROBR")
  b.insert_guess("ROBR")
  b.insert_guess("ROBR")
  b.insert_guess("ROBR")
  #p b.check_guess_color
  b.display
=end
end




