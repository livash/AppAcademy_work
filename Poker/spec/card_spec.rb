require 'rspec'
require 'card'

describe Card do
  context 'initialization of the class' do
    subject(:card) { Card.new }
    it 'defines constant array for suits' do
      Card::SUITS.class.should == Array
    end
    
    it 'defines constant array for individual cards' do
      Card::FACES.class.should == Array
    end
    
  end
  
  context 'check functions in the class' do
    describe '#some_function' do
      
    end
  end
end
