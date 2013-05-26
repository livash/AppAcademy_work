require 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super('dealer', 0)
    @bets = Hash.new
  end

  def play_hand(deck)
    until hand.points >= 17
      hand.hit(deck)
    end
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet" if dealer.class == Dealer
    @bets[dealer] = 0 unless @bets.has_key?(dealer)
    @bets[dealer] += amt
  end

  def take_bet(player, amt) 
    @bets[player] = 0 unless @bets.has_key?(player)
    @bets[player] += amt
  end

  def pay_bets
    winner = self
    pot = 0
    bets.each do |player, bet|
      winner = player if player.hand.beats?(winner.hand)
      pot += bet
    end
    
    winner.pay_winnings(2 * pot)
  end
end
