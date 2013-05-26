require_relative 'module'

class Human
  extend Emotions
  
  def foo
    p Emotions::CONST
    puts 'extend works'
  end
end

Human.new.foo

#USE   <include>

# class Human
#   include Emotions
#   
#   def foo
#     p CONST
#     puts "include works"
#   end
# end
# 
# Human.new.foo