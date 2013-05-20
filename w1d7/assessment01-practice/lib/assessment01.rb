
def primes(count)
  
  to_ret = []
  i = 2
  while to_ret.size < count
    to_ret << i if is_prime?(i)
    i += 1
  end
  to_ret
end

def is_prime?(num)
  
  (2...num).each do |item|
    return false if num % item == 0
  end
  true
end

#factrial
def factorials_rec(count)
  return [1] if count == 1
  factorial_count = factorials_rec(count - 1).last * count
  
  factorials_rec(count - 1) + [factorial_count]
end

class Array
  def dups
    to_ret = {}
    
    self.each_with_index do |item, ii|
      self.each_with_index do |element, jj|
        if item == element && ii != jj
          to_ret[item] = [ii] unless to_ret.has_key?(item)
          to_ret[item] << jj 
          to_ret[item].uniq!
        end
      end
    end
    #filter for keys with arr.size < 2
    
    to_ret
  end
end


class String
  def symmetric_substrings
    #make substrings
    substrings = []
    letters = self.split('')
    letters.each_with_index do |letter, ii|
      letters.each_with_index do |item, jj|
        substrings << letters[ii..jj].join 
      end
    end
    p substrings
    
    #filter through substrings
    substrings = substrings.select do |word|
      word == word.reverse && word.length > 2
    end
    
    substrings
  end
end

class Array
  def bubble_sort(&block)
    if block_given? ? block : block = Proc.new {|x,y| x <=> y}
      to_ret = self.dup
      return to_ret if self.length <= 1
    
      #sort numbers here
      sorted = false
      until sorted
        sorted = true
        to_ret.each_with_index do |item, ii|
          next if ii == to_ret.length - 1
          if block.call(to_ret[ii], to_ret[ii + 1]) == 1
            #swap elements
            to_ret[ii], to_ret[ii + 1] = [to_ret[ii + 1], to_ret[ii]]
            sorted = false
          end
        end
      end
    end
    
      to_ret
    end
  
  end

