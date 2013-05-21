# !/usr/bin/env ruby

#write three sorting methods for the Array class
# shell sort, merge sort and bubble sort
# count how many times each one is called to srt the saem array


# $shell_sort_counter = 0
# $merge_sort_counter = 0
# $bubble_sort_counter = 0

class Array
  def shell_sort(sorting_step = 3)
    #duplicate array
    to_ret = self.dup
    
    #until arra is sorted keep sorting with shell sort
    until to_ret.is_sorted?
      to_ret.each_with_index do |el, jj|
        next if to_ret.end_indeces(sorting_step).include?(jj)
        if to_ret[jj] > to_ret[jj + sorting_step]
          sorted = to_ret.compare_and_swap(jj, jj + sorting_step)
        else
          sorted = true
        end
        if sorted == true
          #pass through the array once more with sorting_step == 1
          sorting_step = 1
        end
      end
    end
 
    to_ret
  end
  
  #can take an arbitrary block
  def merge_sort(&block)
    block_given? ? block : block = Proc.new {|x,y| x <=> y}
    sorted_array = self.dup
    return sorted_array if self.size <= 1
    sorted = false
    # look through array using block and channge sorted = true if array is soretd
    sorted_array.each_with_index do |element, index|
      next if index == sorted_array.length - 1
      if block.call( sorted_array[index], sorted_array[index + 1] ) == -1
        sorted = true
      else
        sorted = false
      end
    end
    
    until sorted
      sorted = true
      start_index = 0 
      end_index = sorted_array.length - 1
      mid_index = (end_index - start_index) / 2
      #merge sort left
      left_array = sorted_array[start_index..mid_index].merge_sort
      #merge sort right
      right_array = sorted_array[(mid_index + 1)..end_index].merge_sort
      sorted_array = left_array + right_array
    end
    
    sorted_array
  end

  def is_sorted?
    self.each_with_index do |item, ii|
      next if ii == self.length - 1
      return false if self[ii] > self[ii + 1]
    end
    true
  end 

  def end_indeces(sort_step)
    ((self.length - sort_step)..(self.length - 1)).to_a
  end

  def compare_and_swap(x,y)
    if self[x] > self[y]
      self[x], self[y] = [self[y], self[x]]
      return true
    else 
      return false
    end
  end
  
  #end of class
end



if __FILE__ == $PROGRAM_NAME
  #make array to be sorted
  arr = [10,9,8,7,6,5,4,3,2,1]
  p arr
  p arr.shell_sort
  p $shell_sort_counter
end



