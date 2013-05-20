#chain words 
require 'set'
class WordChainer
  
  def initialize (dictionary)
    @dictionary = dictionary
  end
   #  dictionary = %w{some filler array of words}
  def build_chain(start_word, end_word)
    return nil if start_word.size != end_word.size
    # in case user inputs words which are not in the dictionary
    return nil unless ( @dictionary.include?(start_word) && @dictionary.include?(end_word) )
    
    @candidates = @dictionary.select { |word| word.length == start_word.length }
    @candidates = Set.new(@candidates) - [start_word]
    
    @touched_words = Set.new([start_word])
    
    @parent_words = {start_word => nil} 
    
    
    
    
    
    #should return an array
  end

  def adjecent_words(word, dictionary)
  
  end
  
  
  
  #end of class
end

if __FILE__ == $PROGRAM_NAME
  
  file_name = "dictionary.txt"
  file = File.open(file_name)
  dictionary = file.readlines.map {|el| el.chop.chomp('%')}
  word_chain = WordChainer.new(dictionary)
  
  puts word_chain.build_chain("duck", "ruby") 
  
end

