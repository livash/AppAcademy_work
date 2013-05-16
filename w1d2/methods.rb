# Rock Paper Scissors
def rps(your_move)
  comp_move = computer_move

  moves = %w(Rock Paper Scissors)
  return "Wrong input move" if !moves.include?(your_move)
  win_combinations = ["Paper, Rock","Rock, Scissors","Scissors, Paper"]
  lose_combinations = ["Rock, Paper","Paper, Scissors","Scissors, Rock"]
  your_move_comp_move = [your_move, comp_move].join(', ')
  puts your_move_comp_move
  return [comp_move, 'WIN'].join(", ") if win_combinations.include?(your_move_comp_move)
  return [comp_move, 'LOSE'].join(", ") if lose_combinations.include?(your_move_comp_move)
  return [comp_move, 'DRAW'].join(", ")
end

def computer_move
  %w(Rock Paper Scissors).shuffle.first
end

puts rps ("Rock")

puts rps('Paper')