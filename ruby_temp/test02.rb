#!/usr/bin/env ruby

def sum(a, b)
  a + b
end

p sum(2,2)

if $PROGRAM_NAME == __FILE__
  p "Executing on command"
end

#rock paper scissors
def rps(player_choice)
  computer_choice = make_comp_choice
  print_result(player_choice, computer_choice)
end

def make_comp_choice
  %w{Rock Paper Scissors}.shuffle.pop
end

def print_result(player1, player2)
  return "IT'S A TIE #{player1} and #{player2}" if player1 == player2
  if first_is_winner?(player1, player2)
    return "YOU WIN! #{player1} beats #{player2}"
  else
    return "YOU LOOSE! #{player2} beats #{player1}"
  end
end

def first_is_winner?(choice1, choice2)
  if choice1 == "Scissors" and (choice2 == "Paper")
    return true
  elsif choice1 == "Paper" and (choice2 == "Rock")
    return true
  elsif choice1 == "Rock" and (choice2 == "Scissors")
    return true
  else
    return false
  end
end

#p rps("Rock")

# count number of time a certain string is found in another loner string
def count(word, str)
  res = 0
  word.split('').each do |el|
    if el == str
      res += 1
    end
  end
  
  res
end

puts count("banana", "a")