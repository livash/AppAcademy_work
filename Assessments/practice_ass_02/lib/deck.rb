require 'card'

# Represents a deck of playing cards.
class Deck
  attr_writer :cards
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card::SUIT_STRINGS.each do |suit, val|
      Card::VALUE_STRINGS.each do |value, v|
        cards << Card.new(suit, value)
      end
    end
    
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  def peek
    @cards.first
  end

  def include?(card)
    @cards.include?(card)
  end

  def shuffle
    @cards.shuffle!
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise 'not enough cards' if n > @cards.size
    cards_taken = []
    n.times do
      cards_taken << @cards.shift
    end
    
    cards_taken
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    cards.each do |card|
      @cards << card
    end
  end
end
