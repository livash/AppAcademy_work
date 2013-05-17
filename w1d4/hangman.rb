# hangman game

class HangmanGame
  # initialize the game
  # ask who is playing and how is the picker, computer or human
  # start the game
  #
  attr_accessor :display, :guesser, :picker, :secret_word, :count_turns,
  :secret_word_string

  def initialize
    @display = Display.new
    @count_turns = 0
  end

  def run
    puts "Welcome to Hangman!"
    who_is_playing
    @secret_word = @picker.pick_word
    # assume human is the guesser
    if @picker.class == ComputerPlayer
      l = @secret_word.length
      puts "Secret word: #{@secret_word}"
    else # is HumanPlayer
      l = @secret_word
    end
    @secret_word_string = Array.new(l) {"_ "}

    until @count_turns > 5 || !@secret_word_string.any?{|el| el == "_ "}
      puts "Secret word: #{@secret_word_string.join}"
      @picker.check_letter
    end

    if @secret_word == @secret_word_string.join
      puts "YOU  WIN !!!!!!!!!!"
    else
      @display.print_screen
      puts "Game OVER ... :("
    end
    puts "Secret word: #{@secret_word}"

  end

  def check_letter
    @display.print_screen
    puts "Put in a letter:"
    input_letter = @guesser.ask_for_letter(@secret_word_string)
    @picker.ask_if_correct(input_letter) # returns boolean


    changed_letter = false
    @secret_word.split('').each_with_index do |el, index|
      if el == input
        @secret_word_string[index] = el
        @display.print_screen if changed_letter == false
        changed_letter = true
      else
        next
      end
    end
    if !changed_letter
      @count_turns += 1
      @display.modify
    end
  end

  def who_is_playing
    puts "Who is the guesser? [1 for computer, 2 for human]"
    input = gets.chomp.to_i
    case input
    when 1
      @guesser = ComputerPlayer.new
      @picker = HumanPlayer.new
    when 2
      puts "I'm here"
      @guesser = HumanPlayer.new
      @picker = ComputerPlayer.new
    when 3
      @guesser = ComputerPlayer.new
      @picker = ComputerPlayer.new
    end
  end


end

class HumanPlayer
  # if Human is the picker, ask for word length HumanPlayer::ask
  def pick_word
    puts "How many letters? ..."
    input = gets.chomp.to_i
  end

  def ask_for_letter(arg)
    # we don't use arg here
    gets.chomp
  end
  #human
  def check_letter
    @display.print_screen
    puts "Put in a letter:"
    input_letter = @guesser.ask_for_letter(@secret_word_string)
    @picker.ask_if_correct(input_letter) # returns boolean


    changed_letter = false
    @secret_word.split('').each_with_index do |el, index|
      if el == input
        @secret_word_string[index] = el
        @display.print_screen if changed_letter == false
        changed_letter = true
      else
        next
      end
    end
    if !changed_letter
      @count_turns += 1
      @display.modify
    end
  end
end

class ComputerPlayer
  # if computer is the picker, choose word from dictionary ComputerPlayer::choose_word
  attr_accessor :dictionary
  def initialize
    @dictionary = Dictionary.new.dictionary
  end
  def pick_word
    @dictionary.sample
  end
  #computer
  def ask_for_letter(arg)
    #somethig else logic
    num_of_letters = arg.length

    @dictionary = @dictionary.select {|el| el.length == num_of_letters}
    letters_hash = {}
    all_letters = @dictionary.map { |el| el.split('')}
    all_letters.flatten!
    ("a".."z").each do |letter|
      letters_hash[letter] = 0
    end
    all_letters.each do |letter|
      letters_hash[letter] += 1
    end
    #p letters_hash

    letters_hash['a']

  end
  #computer
  def check_letter
    @display.print_screen
    puts "Put in a letter:"
    input_letter = @guesser.ask_for_letter(@secret_word_string)
    @picker.ask_if_correct(input_letter) # returns boolean


    changed_letter = false
    @secret_word.split('').each_with_index do |el, index|
      if el == input
        @secret_word_string[index] = el
        @display.print_screen if changed_letter == false
        changed_letter = true
      else
        next
      end
    end
    if !changed_letter
      @count_turns += 1
      @display.modify
    end
  end
end

class Dictionary
  # import dictionary
  attr_accessor :dictionary

  def initialize
    file_name = "dictionary.txt"
    file = File.open(file_name)
    @dictionary = file.readlines.map {|el| el.chop.chomp('%')}
    #@dictionary = %w{cat mat bat cot dot fat}
  end
end

class Display
  HANGMAN = [['..o..'],['..|..'],['.-|..'],['.-|-.'],['./...'],['./.\\..']]
  # displays an array of strings "........"
  # modify display depending on input
  attr_accessor :rows, :guess_number

  def initialize
    @rows = (0...4).map {['.....']}
    @guess_number = 0
  end

  def print_screen
    puts @rows
  end
  def modify
    puts "calling modify"
    case @guess_number
    when 0
      @rows[@guess_number] = HANGMAN[@guess_number]
    when 1
      @rows[1] = HANGMAN[@guess_number]
    when 2
      @rows[1] = HANGMAN[@guess_number]
    when 3
      @rows[1] = HANGMAN[@guess_number]
    when 4
      @rows[2] = HANGMAN[@guess_number]
    when 5
      @rows[2] = HANGMAN[@guess_number]
    end
    @guess_number += 1
  end

end

if __FILE__ == $PROGRAM_NAME
  h = HangmanGame.new
  h.run

end












