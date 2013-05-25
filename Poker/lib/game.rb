require_relative 'player'

class Game
  attr_accessor :players, :deck
  
  def initialize(*players)
    @players = players
    @deck = Deck.new #already shuffled
  end
  
  def play
    puts "Welcome #{player_names} to Poker game!"
    # deal cards to the players 
    deal_cards
    player = players.first
    until turn_over?
     bet = player.ask_to_bet
     bet_was_placed = player.place_bet(bet) #returns boolean
     player = next_player(player)
    end
    
    winner = check_all_hands
    puts "#{winner.name} WINS!!!"
  end
  
  def save
    
  end
  
 # private
  
 def check_all_hands
   
 end
  
  def next_player(player)
    cur_index = players.index(player)
    return players[cur_index + 1] if players.size > cur_index + 1
    players.first
  end
  
  def deal_cards
    players.each do |player|
      cards = []
      5.times { card = deck.deck.pop; cards << card }
      new_hand = Hand.new(cards)
      player.hand = new_hand
    end
  end
  
  def turn_over?
    #when all players placed the same bet?
    #is this logic correct
    false    
  end
  
  def player_names
    string_to_ret = []
    players.each do |player|
      string_to_ret << player.name
    end
    string_to_ret.join(', ')
  end
  
end