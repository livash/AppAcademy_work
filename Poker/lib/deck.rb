require_relative 'card'

class Deck
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  FACES = [:K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  attr_accessor :deck
  
  def initialize
    @deck = generate_deck.shuffle!
  end
  
  private
  
  def generate_deck
    new_deck = []
    SUITS.each do |suit|
      FACES.each do |face|
        new_deck << Card.new(suit, face)
      end
    end
    
    new_deck
  end
end