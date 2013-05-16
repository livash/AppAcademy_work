# guess the number between 1 and 100

def guessing_game

  answer = rand(100) + 1
  guess = prompt_user
  guess_count = 1
  puts "ANSWER: #{answer}"
  until guess_is_answer?(guess, answer)
    high_low(guess, answer)
    guess = prompt_user
    guess_count += 1
  end
  puts "You've guess correctly!"
  puts "Guess attempts: #{guess_count}"
end

def prompt_user
  print "Guess number: "
  gets.chomp.to_i
end

def guess_is_answer?(guess, answer)
  guess == answer
end

def high_low(guess, answer)
  if guess > answer
    puts "Your guess is too high!"
  else
    puts "Your guess is too low!"
  end
end