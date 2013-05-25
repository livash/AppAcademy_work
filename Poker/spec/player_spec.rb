require 'rspec'
require 'player'

describe Player do
  subject(:player) { Player.new('Fred') }
  describe '#make_bet' do
    it 'places an inital bet' do
      player.place_bet(10).should == 10
    end
    
    it "increments bet size if player bets more than once" do
      player.place_bet(10)
      player.place_bet(20).should == 30
    end
  end
  
  describe '#place_bet' do
    it 'should fold' do
      player.place_bet('fold')
      player.fold_status.should == false
    end
  end
  
  describe '#ask_to_bet' do
    it 'should ask the player at least once' do
      player.should_receive(:gets).at_least(:once).and_return('fold')
      player.ask_to_bet.should == 'fold'
    end
    
    it 'should increment players bet' do
      player.ask_to_bet
      player.bet.class.should = String
    end
  end
  
  
end