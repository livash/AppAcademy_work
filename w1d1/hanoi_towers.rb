#game of Hanoi towers
puts "Welcome to the Towers of Hanoi"
puts "How many disks you want to have?"
disks = gets.chomp.to_i
#p disks
puts "you start with #{disks} disks on tower a"
puts "input 'from-tower' (a,b,c) and 'to-tower' separate by coma"

#initialize the game
answer = []
disks.times {|item| answer << item}
towers = { a: answer, b: [], c: [] }

#puts answer

# write a bigger loop
loop do
  puts "your move?"
  input = gets.chomp

  #process input string
  move1, move2 = input.split(",").map {|item| item.to_sym}

  #process the moves

  disk = towers[move1].pop

  if towers[move2].empty?
    towers[move2].push(disk)
  elsif disk > towers[move2].last
    puts "invalid move, try again"
  else
    towers[move2].push(disk)
  end
  puts towers
  if towers[:b] == answer || towers[:c] == answer
    puts "YOU WIN"
    break
  end
end