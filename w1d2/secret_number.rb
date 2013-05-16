# find number that is >250 and divisible by 7

def secret_number
  i=1
  loop do
    i += 1
    break if i > 250 && i%7 == 0
  end
  puts "secret number: #{i}"
  i
end

p secret_number