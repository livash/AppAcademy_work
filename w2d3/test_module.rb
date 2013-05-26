module Olena
  def my_function
    puts "I'm here"
  end
end

class Klass
  def my_function
    puts "I'm in the class Klass"
  end
  
end

if __FILE__ == $PROGRAM_NAME
include Olena
k = Klass.new  
k.my_function
my_function 

end