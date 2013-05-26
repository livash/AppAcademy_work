# Score: 19 of 19

#
# Belda Chan Assessment01
def factors(num)
  factors = []

  1.upto(num) do |i|
    factors << i if num % i == 0
  end

  factors

  # Shorter way would be:
  # (1..num).select { |i| num % i == 0 }
end

def fibs_rec(count)
  if count == 1
    [0]
  elsif count == 2
    # Spaces after commas
    [0,1]
  else
    fibs = fibs_rec(count - 1)
    fibs << fibs[-1] + fibs[-2]
  end
end

class Array
  def bubble_sort(&prc)
    sorted = self.dup
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless prc

    length = self.length

    # You may be doing some unneccesary passes through the
    # array, so having a sorted/swapped flag might be useful.

    self.each_index do |i|
      0.upto(length - 2) do |j|
        if prc.call(sorted[j], sorted[j + 1]) == 1
          sorted[j], sorted[j + 1] = sorted[j + 1], sorted[j]
        end
      end
    end
    sorted
  end
end

class Array
  def two_sum
    positions = []
    self.each_with_index do |num, ind|

      self.each_with_index do |num2, ind2|
        # This is unnecessary. You should 'next' in the
        # inner loop when ind2 <= ind1
        if !(positions.include?([ind2, ind]))
          positions << [ind, ind2] if (num + num2) == 0 && ind != ind2
        end
      end
    end
    positions
  end
end

class String

  def subword_counts(dictionary)
    # Spaces inside blocks
    counts = Hash.new() {0}

    string_arr = self.split(//)

    string_arr.each_with_index do |letter, ind|
      string_arr.each_with_index do |letter2, ind2|
        subword = string_arr[ind..ind2].join
        counts[subword] += 1 if dictionary.include?(subword)
      end
    end
    counts
  end

end