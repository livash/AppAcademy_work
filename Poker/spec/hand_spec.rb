require 'rspec'
require 'hand'
require 'card_suits_faces'

describe Hand do
  #include CardSuitsFaces
  
  SUITS = [:hearts, :diamonds, :spades, :clubs]
  FACES = [:K, :Q, :J, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
   
  context 'logic for hand comparison' do
    describe '#suits_hash' do
      let(:deck) { Deck.new }
      subject(:play_hand) { Hand.new(deck.deck[0], deck.deck[2], deck.deck[3]) }
      let(:one) { Card.new(SUITS[0], FACES[0]) }
      let(:two) { Card.new(SUITS[0], FACES[1]) }
      let(:three) { Card.new(SUITS[0], FACES[2]) }
      let(:four) { Card.new(SUITS[0], FACES[3]) }
      let(:five) { Card.new(SUITS[0], FACES[4]) }
      let(:second_hand) { Hand.new(one, two, three, four, five) }
        
      it 'returns a hash' do
        play_hand.suits_hash.class.should == Hash
      end
      
      it 'correctly counts suits in "all hearts" hand' do
        second_hand.suits_hash[SUITS[0]].should == 5
      end
    end
  
  end
end