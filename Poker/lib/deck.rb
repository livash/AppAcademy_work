require_relative 'card'
require_relative 'card_suits_faces'

class Deck
  include CardSuitsFaces
  attr_accessor :deck
  
  def initialize
    @deck = generate_deck
  end
  
  private
  
  def generate_deck
    new_deck = []
    SUITS.each do |suit|
      FACES.each do |face|
        new_deck << Card.new(suit, face)
      end
    end
    
    new_deck.shuffle.shuffle
  end
end