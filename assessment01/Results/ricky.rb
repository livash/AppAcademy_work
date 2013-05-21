# Score: 19 of 19

def factors(num)
  factors = []
  # Factorial is something different. Use a different name.
  (1..num).each do |factorial|
    factors << factorial if num % factorial == 0
  end
  factors
end

def fibs_rec(count)
  return [0] if count == 1
  return [0, 1] if count == 2
  # No spaces inside parens
  rest_fibs = fibs_rec( count - 1 )
  # Shovel it in instead of concatenating. Concat
  # makes a copy of the array which is unnecessary
  rest_fibs + [rest_fibs[-1] + rest_fibs[-2]]
end

class Array
  def bubble_sort(&prc)
    dup_arr = self.dup
    prc = Proc.new { |x, y| x <=> y } unless prc
    sorted = false

    until sorted
      sorted = true
      (dup_arr.count - 1).times do |i|
        if prc.call(dup_arr[i], dup_arr[i + 1]) == 1
          dup_arr[i], dup_arr[i + 1] = dup_arr[i + 1], dup_arr[i]
          sorted = false
        end
      end
    end

    dup_arr
  end
end

class Array
  def two_sum
    positions = []
    self.each_with_index do |number, index1|
      self.each_with_index do |number2, index2|
        if number == (-1 * number2) && index1 != index2
          # Unnecessary check if you called 'next'
          # when index2 <= index1
          unless positions.include?([index2, index1])
            # Mind your indentation.
          positions << [index1, index2]
          end
        end
      end
    end
    positions
  end
end

# class String
#   def subword_counts(dictionary)
#     frequencies = Hash.new(0)
#     string = dictionary.last
#     dictionary.each do |word|
#       string.length.times do |start|
#         (0..(string.length - start)).each do |len|
#           substring = word[start...(start + len)]
#           frequencies[substring] += 1 if string.include?(substring)
#         end
#       end
#     end
#     frequencies
#   end
# end

class String
  def subword_counts(dictionary)
    frequencies = Hash.new
    string = dictionary.last
    # Instead of iterating over the dictionary, probably
    # better to iterate over subwords and check if
    # the subword is in the dictionary.
    dictionary.each do |substring|
      # Initialize the frequencies hash with a default
      # value of 0 so you don't have to do this check.
      # Hash.new(0)
      # Then you don't have to worry about += being called
      # on nil
      frequencies[substring] = 0 unless frequencies[substring]
      frequencies[substring] += substrings(self).count(substring)
    end
    frequencies.select { |key, value| value != 0 }
  end

  def substrings(word)
    substrings = []
    word.length.times do |start_letter|
      (1..(word.length - start_letter)).each do |len|
        substrings << word[start_letter...(start_letter + len)]
      end
    end
      substrings
    end
end
