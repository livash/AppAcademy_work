# Finds a pair of numbers in an array that sum to zero

class Array
  def two_sum
    arr = self

    arr.each_with_index do |num, ind1|
      number_to_comp = num
      arr.each_with_index do |item, ind2|
        return true if number_to_comp+item == 0 && (ind1 != ind2)
      end
    end
    false
  end
end

puts [0,1,2,3].two_sum
puts [-1,1,2,3].two_sum