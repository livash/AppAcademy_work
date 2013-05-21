def factors(num)
  factors_array = []
  (1..num).each do |candidate|
    factors_array << candidate if num % candidate == 0
  end
  factors_array
end

def fibs_rec(count)
  return [0] if count == 1
  return [0,1] if count == 2
  
  fibs_rec(count - 1) + [fibs_rec(count - 1)[-1] + fibs_rec(count - 1)[-2]]
end

class Array
  def bubble_sort(&prc)
    return self.dup if self.size == 0 || self.size == 1
    
    block_given? ? prc : prc = Proc.new {|x,y| x <=> y}
    
    sorted_array = self.dup
    
    sorted = false
    until sorted
      sorted = true
      sorted_array.each_with_index do |element, index|
        next if index == sorted_array.length - 1
        if prc.call(sorted_array[index], sorted_array[index + 1]) == 1
          sorted_array[index], sorted_array[index + 1] = sorted_array[index + 1], sorted_array[index]
          sorted = false
        end
      end
    end
    
    sorted_array
  end
end


class Array
def two_sum
  array = self.dup
  results_array = []
  used_index_positions = []
  array.each_with_index do |element, ii|
    array.each_with_index do |item, jj|
      results_array << [ii,jj] if ii != jj && element + item == 0  && !used_index_positions.include?(jj)
      used_index_positions << ii
      #used_index_positions << jj
    end
  end
  
  results_array
end
end

class String
def subword_counts(dictionary)
  results_hash = {}
  
  #make substrings
  subs_array = []
  letters = self.split('')
  letters.each_with_index do |letter, ii|
    letters.each_with_index do |item, jj|
      substring = letters[ii..jj].join
      subs_array << substring if dictionary.include?(substring)
    end
  end
  
  subs_array.sort!
  puts "subs array size #{subs_array.length}"
  
  #populate the hash while looping through subs_array
  subs_array.each do |substring|
    if results_hash.has_key?(substring)
      results_hash[substring] += 1 
    else
      results_hash[substring] = 1
    end
  end
  
  results_hash
end
end
