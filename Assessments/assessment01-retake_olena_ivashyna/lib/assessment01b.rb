require 'debugger'
def fibs_iter(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  
  fibs_array = [0, 1]
  
  until fibs_array.size == n
    fibs_array << (fibs_array[-1] + fibs_array[-2])
  end
  
  fibs_array
end

def sum_rec(nums)
  return 0 if nums.size == 0
  return nums.first if nums.size == 1
  
  array = nums.dup
  until array.empty?
    last = array.pop
    to_return = last + sum_rec(array)
  end
  
  to_return
end

class Array
  def binary_search(num)
    return nil if self.empty?
    
    mid = self.size / 2
    return mid if self[mid] == num
    if num < self[mid]
      index = self[0...mid].binary_search(num)
    else #num < self[mid]
      index = self[(mid + 1)..-1].binary_search(num)
      index += mid + 1 if !index.nil?
    end 
    
    index
  end
end

class String
  def uniq_subs
    subs = []
    letters = self.split('')
    letters.each_with_index do |letter, ii|
      letters.each_with_index do |item, jj|
        subs << letters[ii..jj].join 
      end
    end
    subs -= ['']
    subs.uniq
  end    
end

class Array
  def merge_sort
    return self if self.size == 0 || self.size == 1
    
    array = self.dup
    first = 0
    last = array.size
    mid = (last - first) / 2
    
    left_array = array[first...mid].merge_sort
    right_array = array[mid..last].merge_sort    
    to_return = merge(left_array, right_array)
    to_return
  end
  
  def merge(left, right)
    return left if right.nil?
    return right if left.nil?
    array = []

    until left.empty? || right.empty?
      if left.first < right.first
        num = left.shift
        array << num
      else
        num = right.shift
        array << num
      end
    end
    until right.empty?
      num = right.shift
      array << num
    end 
    
    until left.empty?
      num = left.shift
      array << num
    end 
    
    array
  end
end
