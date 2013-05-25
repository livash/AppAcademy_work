require 'rspec'
require 'game'
require 'deck'

describe Game do
  let(:olena) { Player.new('olena') }
  let(:jon) { Player.new('jon') }
  let(:fred) { Player.new('fred') }
  subject(:game) { Game.new(olena, jon, fred) }
  
  context 'initialization of the game' do
 
    it 'initializes with a number of players' do
      game.players.length.should == 3
    end
    
    it 'has a deck' do
      game.deck.class.should == Deck
    end
  end
  
  describe '#play' do
    it 'does something' do
    end
  end
  
  # #it's a private method
  # describe '#next_player' do
  #   it 'returns the next player' do
  #     player = game.players.first
  #     game.next_player(player).name.should_not == player.name
  #   end
  # end
  # 
   # #this method is private
  # describe '#deal_cards' do
  #   it 'hands out cards' do
  #     game.deal_cards
  #     olena.hand.should_not be_nil
  #   end
  #   
  #   it 'hands out five cards' do
  #     game.deal_cards
  #     olena.hand.size.should == 5
  #   end
  # end
  
  # #it's a private method
  # describe '#player_names' do
  #   it "prints players names as a string" do
  #     game.player_names.should == 'olena, jon, fred'
  #   end
  # end
end