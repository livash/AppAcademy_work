class Card
  attr_reader :suit, :face
  
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  FACES = [:K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
  
  def initialize(suit, face)
    @suit = suit
    @face = face
  end
  
end