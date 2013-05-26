require_relative 'deck'
require_relative 'card_suits_faces'

class Hand
  include CardSuitsFaces
  attr_accessor :cards
  
  def initialize(*cards)
    @cards = cards
    puts "cards = #{cards.class}"
  end
  
  #private
  
  def suits_hash
    return_hash = {}
    cards.each do |card|
      if return_hash[card.suit].nil?
        return_hash[card.suit] = 1
      else
        return_hash[card.suit] += 1
      end
    end

    return_hash
  end
  
  def is_high_card?
    cards.each do |card|
      
    end
  end
  
  def is_straight_flush?
    
  end
  
  def is_four_kind?
    
  end
  
  def is_full_house?
    
  end
  
  def is_flush?
    
  end
  
  def is_straight?
    
  end
  
  def is_three_kind?
    
  end
  
  def is_two_pair?
    
  end
  
  def is_one_pair?
    
  end  
  
end