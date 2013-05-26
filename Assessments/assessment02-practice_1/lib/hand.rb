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
    ace_count = 0
    cards.each do |card|
      if card.value == :ace
        ace_count += 1
        next
      end
      points += Card::BLACKJACK_VALUE[card.value]
    end
    
    if ace_count == 1
      if points + 11 > 21 && points < 21
        points += 1
      elsif points + 11 <= 21
        points += 11       
      end
    elsif ace_count == 2
      points += 2
    elsif ace_count == 3
      points += 13
    end
    
    points
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if points > 21
    card = deck.take(1)
    @cards += card
  end

  def beats?(other_hand)
    points <=21 && (points > other_hand.points || other_hand.busted?)
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
