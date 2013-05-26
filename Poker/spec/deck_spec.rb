require 'rspec'
require 'deck'

describe Deck do
  
  context "initialization" do
    subject(:new_deck) { Deck.new }
    let(:second_deck) { Deck.new }
      it 'creates a deck' do
        new_deck.deck.should_not be_empty
      end
      
      it 'creates a deck with Card objects' do
        new_deck.deck.all? do |card|
          card.class == Card
        end.should == true
      end
      
      it 'creates a deck with 52 cards' do
        new_deck.deck.size.should == 52
      end
      
      it 'creates a uniq, shuffled deck' do
        from = rand(20)
        to = rand(10) + 20
        new_deck.deck[from..to].should_not == second_deck.deck[from..to]
      end
      
      it 'creates a deck with a new starting card each time' do
        new_deck.deck[0].should_not == second_deck.deck[0]
      end
      
      it 'creates a deck with non-repeating sequence of first five cards' do
        first_cards = []
        first_cards[0] = []
        first_cards[1] = []
        100.times do |deck_A|
          deck_A = Deck.new
          deck_B = Deck.new
          first_cards[0] << deck_A.deck[0..5]
          first_cards[1] << deck_B.deck[0..5]
        end
      
        comparison = []
        index = 0
        while index < first_cards[0].size
          card_A = first_cards[0][index]
          card_B = first_cards[1][index]
          comparison << (card_A == card_B)
          index += 1
        end
        comparison.all? { |comp| comp == false }.should == true
      end
  end
end