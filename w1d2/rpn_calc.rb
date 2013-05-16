# RPN calculator
require 'debugger'

class RPN
  def initialize
    @stack = []
  end

  def run
    if ARGV.size > 0
      puts "File input"
      file_input
    else
      puts "User input"
      user_input
    end
    out_stack = @stack.dup

    until @stack.length == 1
      @stack.each_index do |i|
        if @stack[i] =~ /[\+\-\*\/]/
          operator = @stack[i].to_sym
          operands = @stack[(i-2)..(i-1)].map(&:to_f)
          @stack.slice!((i-2)..i)
          # compute expression
          result = operands.inject(operator)
          @stack.insert(i-2, result)
          break
        end
      end

    end
    "#{out_stack.join(" ")} = #{@stack.first}"
  end

  def user_input
    puts "What's your equation?: "
    input = "stuff"
    loop do
      input = gets.chomp
      break if input == ''
      @stack << input
    end
  end

  def file_input
    @stack = File.read(ARGV[0]).split(" ")
  end
end
if __FILE__ == $PROGRAM_NAME

    rpn = RPN.new
    p rpn.run

end



# 1. Begin program
# 2. get user input
# 3. check if input is a operator
# 4. if it is handle the equation and put it back on the stack
# 5. loop around until input == nil
# 6. output final result
# 7. this ends the program

