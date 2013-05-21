# Score: 19 of 19

def factors(num)
  factors = []
  1.upto(num) do |n|
    factors << n if (num % n == 0)
  end
  factors
end

def fibs_rec(count)
  return [0] if count == 1
  return [0, 1] if count == 2
  fibs = fibs_rec(count - 1)
  # Better here to shovel than concatenate.
  # Concat will create a copy which is
  # unnecessary in this case.
  fibs += [fibs[-2] + fibs[-1]]
end

class Array
  def bubble_sort(&prc)
    unsorted = self.dup
    # Better name would be 'swapped'
    shifted = true
    while shifted
      shifted = false
      1.upto(unsorted.size - 1) do |i|
        # Take a look at the solution for the proc trick
        # prc ||= Proc.new { |x, y| x <=> y }
        if (prc.nil? && unsorted[i - 1] > unsorted[i]) || (prc && prc.call(unsorted[i - 1], unsorted[i]) == 1)
          unsorted[i - 1], unsorted[i]  = unsorted[i], unsorted[i -1]
          shifted = true
        end
      end
    end
    unsorted
  end
end

class Array
  def two_sum
    zero_indexes = []
    each_with_index do |num_one, idx_one|
      each_with_index do |num_two, idx_two|
        next if (idx_one == idx_two || idx_one > idx_two)
        zero_indexes << [idx_one, idx_two] if (num_one + num_two).zero?
      end
    end
    zero_indexes
  end
end

class String
  def subword_counts(dictionary)
    # str = self
    # subwords = {}
    # dictionary.each do |word|
    #   if str.index(word)
    #     (subwords[word] && subwords[word] += 1) || (subwords[word] = 1)
    #   end
    # end
    # subwords
    word = self
    chunks = []
    0.upto(word.size - 1) do |start_idx|
      0.upto(word.size - 1) do |len|
        chunk = word[start_idx..len]
        # Would be cleaner to call 'next' if
        # len <= start_idx
        chunks << chunk unless chunk.empty? #|| chunks.include?(chunk)
      end
    end

    subwords = {}
    chunks.each do |chunk|
      if dictionary.include?(chunk)
        # Cleaner to initialize hash with default value
        # Hash.new(0)
        # Then you can += 1 without worry
        (subwords[chunk] && subwords[chunk] += 1) || (subwords[chunk] = 1)
      end
    end
    subwords
  end
end
