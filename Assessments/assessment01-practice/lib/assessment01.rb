# my answers 
# time start : 7:34 pm 7:47 stoped 8:59 one error left 10:05 finished...
require 'debugger'

def primes(num)
  array = []
  i = 2
  until array.size == num
    array << i if is_prime?(i)
    i += 1
  end
  
  array
end


def is_prime?(num)
  array = (2...num).to_a
  to_ret = true
  array.each do |el|
    to_ret = false if num % el == 0
  end
  to_ret
end


def factorials_rec(num)
  return [1] if num == 1
  
  array = []
  array + factorials_rec(num-1) + [factorial(num)]
end


def factorial(num)
  return 1 if num == 1
  factorial(num-1)*num
end

class Array
  def dups
    to_ret = Hash.new #{:key is arr[] :val = [indexes].sort}

    self.each_with_index do |element_to_compare, jj|
      self.each_with_index do |element, ii|
        
        if element_to_compare == element && jj != ii
          to_ret[element_to_compare] = [] unless to_ret.has_key?(element_to_compare)
          to_ret[element_to_compare] << jj 
          to_ret[element_to_compare] << ii
          to_ret[element_to_compare].uniq!
        end
      end
    end
    to_ret
  end
  
  class String
    def symmetric_substrings
      return [] if self.length < 2
      to_ret = []
      #make substrings
      letters = self.split("")
      substrings = []
      letters.each_with_index do |letter, ii|
        letters.each_with_index do |el, jj|
          substrings << letters[ii..jj].join
        end
      end
      substrings.uniq!
      to_ret = substrings.select do |substring|
        substring == substring.split('').reverse.join && substring.length > 2
      end
    
      to_ret
    end
  end
  
  def bubble_sort(&block)
    block_given? ? block : block = Proc.new {|x,y| x <=> y}
   
    to_ret = self.dup
    
    sorted = false
    #puts "I'm before the loop"
   until sorted
     sorted = true
      #puts "I'm in the until loop..........."
      to_ret.each_with_index do |el, ii|
        puts "ii = #{ii}, to_ret[ii] = #{to_ret[ii]}"
        #debugger
        next if ii == to_ret.length - 1
        if block.call( to_ret[ii], to_ret[ii+1] ) == 1
          to_ret[ii], to_ret[ii + 1] = [to_ret[ii + 1], to_ret[ii]]
          sorted = false
        end
      end
    end
    
    to_ret
  end
end






