require 'card'

# Represents a deck of playing cards.
class Deck
  attr_writer :cards
  
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card::SUIT_STRINGS.each do |suit, val1|
      Card::VALUE_STRINGS.each do |value, val2|
        cards << Card.new(suit, value)
      end
    end
    
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards.flatten
  end

  # Returns the number of cards in the deck.
  def count
    @cards.size
  end

  def peek
    @cards.first
  end

  def include?(card)
    @cards.include?(card)
  end

  def shuffle
    @cards = @cards.shuffle
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > 52
    to_return = []
    n.times do
      card = @cards.shift
      to_return << card
    end
    
    to_return
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards
  end
end
