#!/usr/bin/env ruby

nums = 1..100
# return an array of perfect squares
result = nums.select do |i|
  i % 2 == 0
end

p result

# calculate the sum of the elements in the result array
p result.inject(:+)

(1..5).any? { |i| i % 2 != 0 }

# method takes an array and returns array with elements multiplied by two
def multiply(arr)
  arr.map { |i| i * 2 }
end

arr = [1,2,3,4]
p multiply(arr)

def median(arr)
  temp_arr = arr.sort
  if temp_arr.length % 2 == 0
    return (arr[arr.length / 2] + arr[arr.length / 2 - 1]).to_f / 2
  else
    return arr[arr.length / 2]
  end
end

p median(arr)

def concat(arr)
  arr.inject('') { |res, str| res + str }
end

w = %w{cat mat bat}
p concat(w)

# unique elements in the array
def my_unique(arr)
  res = []
  arr.each do |item|
    res << item unless res.include?(item)
  end
  
  res
end

arr2 = [1,1,2,3,2,3]
p my_unique(arr2)

# two sum
def two_sum(arr)
  res = []
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      if arr[i] + arr[j] == 0
        res << [i, j]
      end
      j += 1
    end
    i += 1
  end
  
  res
end

arr3 = [0,-1,1,0]
p two_sum(arr3)

# transpose a matrix
def my_transpose(arr)
  vert_dim = arr.length
  hor_dim = arr.first.length
  res = []
  hor_dim.times { res << [] }
  arr.each_with_index do |row, i|
    row.each_with_index do |item, j|
      res[j] << arr[i][j]
    end
  end
  
  res
end

puts "My transpose result"
arr4 = [[1, 1], [2,2], [3, 3]]
p my_transpose(arr4)

#stock picker
def stock_picker(arr)
  max_profit = arr[1] - arr[0]
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      if arr[j] - arr[i] > max_profit
        res = [i, j]
        max_profit = arr[j] - arr[i]
      end
      j += 1
    end
    i += 1
  end
  
  res
end

arr5 = [0, 10, 20, 5, 35, 0, 100]
p stock_picker(arr5)

# ceasar cipher
def ceasar_cipher(str, num)
  res_array = str.split('').map do |letter|
    if (letter.ord + num) > 122
      letter = ('a'.ord + (letter.ord + num - 123)).chr
    else
      letter = (letter.ord + num).chr
    end
  end
  
  res_array.join('')
end

p ceasar_cipher("hello", 3)
p ceasar_cipher("zzz", 3)

# Hashes
def set_add_el(hash, key)
  hash[key] = true
  
  hash
end

p a = set_add_el({}, :x)

def set_remove_el(hash, key)
  hash.delete(key)
  
  hash
end

p set_remove_el(a, :x)

def set_list_els(hash)
  hash.keys
end

p set_list_els({:a => "a", :b => 'b'})

def set_member?(hash, key)
  hash.has_key?(key)
end

p set_member?({:x => ""}, :x)

def set_union(hash1, hash2)
  hash1.merge(hash2)
end

p set_union({:x => ''}, {:y => ""})

def set_intersection(hash1, hash2)
  res = {}
  hash1.each do |k, v|
    res[k] = v if hash2.has_key?(k)
  end
  
  res
end

p set_intersection({:a => "a", :b => 'b'}, {:a => 'a'})

def set_minus(hash1, hash2)
  res = {}
  hash1.each do |k, v|
    res[k] = v unless hash2.has_key?(k)
  end
  
  res
end
p set_minus({:a => "a", :b => 'b'}, {:a => 'a'})

def correct_hash(hash)
  res = {}
  hash.each do |k, v|
    res[k.to_s.succ.to_sym] = v
  end
  
  res
end

wrong_hash = { :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" }
p correct_hash(wrong_hash)

class Fraction
  attr_reader :numerator, :denominator
  
  def initialize(num, denom)
    @numerator, @denominator = [num, denom]
  end
  
  def ==(other)
    return false unless other.is_a?(Fraction)
    
    (@numerator / @denominator) == (other.numerator / other.denominator)
  end
end

f1 = Fraction.new(3,6)
f2 = Fraction.new(1,2)
p f1 == f2

# find anagrams in the word array
def anagrams(array)
  copy_array = array.dup
  result_array = []
  iteration_idx = 0
  until copy_array.empty?
    
    word = copy_array.pop
    next if word.nil?
    
    result_array << []
    result_array[iteration_idx] << word
    copy_array.each do |sub_word|
      next if sub_word.nil?
      if are_anagrams?(sub_word, word)
        result_array[iteration_idx] << sub_word
        idx = copy_array.index(sub_word)
        copy_array[idx] = nil
      end
    end
    
    iteration_idx += 1
  end
  
  result_array
end

def are_anagrams?(word1, word2)
  word1.split('').sort == word2.split('').sort
end

arr = %w{abc bac abb cab ac}
p anagrams(arr)

(1..100).each do |i|
    puts i%15==0?"FizzBuzz":i%3==0?"Fizz":i%5==0?"Buzz":i
end


