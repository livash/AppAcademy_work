class Player
  attr_reader :name
  attr_accessor :hand, :bet, :fold_status
  
  def initialize(name)
    @name = name
    @hand = nil
    @bet = nil
    @fold_status = false
  end
  
  def ask_to_bet
    puts "Please enter your bet: "
    #what if user inputs incorrect bet?
    input = gets.chomp.downcase
  end
  
  def place_bet(bet_string) #receives a string of
    # fold, call or raise
    if bet_string == 'fold'
      fold_status = true
      return true
    elsif bet_status == 'call'
      return true
    end
    
    if bet.nil?
      @bet = number 
    else
      @bet += number
    end
  end

end