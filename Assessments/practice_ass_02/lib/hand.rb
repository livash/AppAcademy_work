require 'card'
class Hand
  attr_accessor :cards
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returning a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    h = Hand.new(deck.take(2))
    h
  end

  def initialize(cards)
    @cards = cards
  end

  def points
    points = 0
    ace_counter = 0
    @cards.each do |card|
      if card.value == :ace
        ace_counter += 1
        next
      end
      points += Card::BLACKJACK_VALUE[card.value]
    end
    
    if ace_counter == 1
      if points + 11 > 21
        points += 1
      else
        points += 11
      end
      
    elsif ace_counter == 2
      points += 2  
          
    elsif ace_counter == 3
      points = 13
    end
    
    points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise 'already busted' if busted?
    card = deck.take(1) if points <= 21
    @cards += card
  end

  def beats?(other_hand)
    return false if busted?
    points > other_hand.points || other_hand.busted?
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
