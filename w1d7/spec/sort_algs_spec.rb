# RSPEC file for sorting algorithms

require 'rspec'
require 'sort_algs.rb'

describe "#merge_sort" do 
  
  it "should sort array of one element" do
    [2].merge_sort.should == [2]
  end
  
  it 'should sort array with multiple elements' do
    [5,4,3,2,1].merge_sort == [5,4,3,2,1].reverse
  end
  
  it "should sort arrays if block is passed to the method" do
    [5,4,3,2,1].merge_sort {|x,y| y <=> x}.should == [5,4,3,2,1]
  end
  
end

describe "#shell_sort" do
  
  it "should sort an array" do
    [10,9,8,7,6,5,4,3,2,1].shell_sort.should == [10,9,8,7,6,5,4,3,2,1].reverse
  end
  
  it "should return an array" do
    [].shell_sort.should == []
  end
  
  it "should return true for sorted array" do
    [1,2,3].is_sorted?.should == true
  end
  
  it "should return false for unsorted array" do
    [2,1,3].is_sorted?.should == false
  end  
  
  it "returns correct end indeces" do
    arr = Array.new(10)
    arr.end_indeces(3).should == [7,8,9]
  end
  
  it "return true if swap happened" do
    [3,2,4].compare_and_swap(0,1).should == true
  end
  
  it "return false if swap did NOT happen" do
    [2,3,4].compare_and_swap(0,1).should == false
  end
  
  it "should retiurn true fr sorted array" do
    [1,2,3].is_sorted?.should == true
  end
  
  it "should retiurn FALSE for not sorted array" do
    [3,2,1].is_sorted?.should == false
  end
end