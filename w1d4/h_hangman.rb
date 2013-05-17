# hangman game again
require 'set'
class HangmanGame
  NUMBER_OF_TURNS = 6
  attr_accessor :display, :guesser, :picker, :count_turns, :secret_word_string

  def initialize
    @display = Display.new
    @count_turns = 0
  end

  def run
    puts "Welcome to Hangman!"
    who_is_playing # returns nil
    puts "Players: #{@guesser.class} versus #{@picker.class}"
    puts
    @secret_word_string = @picker.pick_word

    until @count_turns > NUMBER_OF_TURNS || !@secret_word_string.any? { |el| el == "_ "}
      letter = @guesser.ask_letter(@secret_word_string)
       @count_turns, @secret_word_string = @picker.check_letter(letter, @secret_word_string)
    end

    unless @secret_word_string.any? { |el| el == "_ "}
      puts "SECRET WORD WAS: #{@secret_word_string.join}"
      puts "You Win!"
    else
      puts "SECRET WORD WAS: #{@picker.secret_word}" if @picker.respond_to?(:secret_word)
      puts "Game Over"
    end

  end

  def who_is_playing
    # initializes who the guesser and picer are
    puts "Who is playing? [guesser vs picker] "
    puts "[1 for computer vs human, 2 for human vs computer, 3 computer vs computer]"
    secret_word = gets.chomp.to_i
    case secret_word
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
  attr_accessor :count_turns, :secret_word_string
  def initialize
    @count_turns = 0
  end
  def pick_word
    #received number of letters in word from prompt
    puts "How many letters are there in your word?"
    secret_word = gets.chomp.to_i
    @secret_word_string = Array.new(secret_word) {"_ "}
  end

  def check_letter(letter, secret_word_string)
    puts "is this a correct letter? '#{letter.capitalize}' say(y/n)"
    input_1 = gets.chomp
    if input_1 == 'n'
      @count_turns += 1
    else # if yes
      puts "input number of such letters in your word"
      input_2 = gets.chomp.to_i
      input_2.times do 
        puts "choose position for each correct letter starting with zero"
        puts "#{@secret_word_string}"
        puts ""
        position = gets.chomp.to_i
        @secret_word_string[position] = letter
      end
    end
    
    #returns 
    [@count_turns, @secret_word_string]
  end
  def ask_letter(arg)
    #arg is not used
    puts "guess letter:"
    gets.chomp
  end
end

class ComputerPlayer
  # if computer is the picker, choose word from dictionary ComputerPlayer::choose_word
  attr_accessor :dictionary, :secret_word, :count_turns, :used_letters

  def initialize
    @dictionary = Dictionary.new.dictionary
    @count_turns = 0
    @used_letters = []
  end
  
  def pick_word
    @secret_word = @dictionary.sample
    
    temp = Array.new(secret_word.length) {"_ "}
    puts "Secret word: #{temp}"
    temp
  end

  def check_letter(letter, secret_word_string)
    
    puts "checking....#{letter}"
    changed_letter = false
    @secret_word.split('').each_with_index do |el, index|
      if el == letter
        secret_word_string[index] = el
        changed_letter = true
      else
        next
      end
    end
    if !changed_letter
      @count_turns += 1
    end
    puts "Secret word: #{secret_word_string.join}"
    [@count_turns, secret_word_string]

  end
 
  
  def ask_letter(secret_word_string)
    num_of_letters = secret_word_string.length
    puts "Secret word is:  #{secret_word_string.join}"
    @dictionary = @dictionary.select {|el| el.length == num_of_letters}
    #filter dictinary for words that can not be true
    new_dictionary = []
    @dictionary.each do |word|
      good_word = true
      secret_word_string.each_with_index do |letter, index|
        if letter == '_ ' || letter == word[index] 
        else
          good_word = false
        end
      end
      next if !good_word
      new_dictionary << word
      word
    end
    #finish filtering
    letters_hash = {}
    all_letters = @dictionary.map { |el| el.split('')}
    all_letters.flatten!
    ("a".."z").each do |letter|
      letters_hash[letter] = 0
    end
    all_letters.each do |letter|
      letters_hash[letter] += 1
    end
    # remoove previously used letters
    @used_letters.each do |letter|
      letters_hash.delete(letter) if letters_hash.has_key?(letter)
    end
    most_frequent = {:key => '', :val => -1}
    letters_hash.each do |k,v|
      if v > most_frequent[:val]
        most_frequent[:key] = k
        most_frequent[:val] = v
      end         
    end
    @used_letters << most_frequent[:key]
    most_frequent[:key]
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

class Dictionary
  # import dictionary
  attr_accessor :dictionary

  def initialize
    file_name = "dictionary.txt"
    file = File.open(file_name)
    @dictionary = file.readlines.map {|el| el.chop.chomp('%')}
  end
end

if __FILE__ == $PROGRAM_NAME
  h = HangmanGame.new
  h.run

end