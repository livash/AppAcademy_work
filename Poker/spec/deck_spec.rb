require 'rspec'
require 'deck'

describe Deck do
  context "initialization" do
    subject(:new_deck) { Deck.new }
      it 'creates a deck' do
        new_deck.deck.should_not be_empty
      end
      
      it 'creates a deck with Card objects' do
        new_deck.deck.all? do |card|
          card.class == Card
        end.should == true
      end
      
      it 'is shuffled' do
        
      end
    
  end
  
end