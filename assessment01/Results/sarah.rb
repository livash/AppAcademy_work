# Score: 19 of 19

def factors(num)
  factors = []

  (1..num).each do |factor|
    factors << factor if num % factor == 0
  end

  factors
end

def fibs_rec(count)
  return [] if count == 0
  return [0] if count == 1
  return [0, 1] if count == 2

  fibs_all = fibs_rec(count - 1)
  fibs_all << fibs_all[-2] + fibs_all[-1]
end

class Array
  def bubble_sort(&prc)
    sorted = self.dup
    prc = Proc.new { |num1, num2| num1 <=> num2 } unless prc

    sorted.length.times do
      sorted.each_index do |i|
        if prc.call(sorted[i], sorted[i + 1]) == 1
          sorted[i], sorted[i + 1] = sorted[i + 1], sorted[i]
        end
      end
    end

    sorted
  end
end

class Array
  def two_sum
    pairs = []

    self.each_index do |i|
      shift = 1

      while (i + shift) < self.count
        if self[i] + self[i + shift] == 0
          pair = [i, (i + shift)]
          pairs << pair
        end
        shift += 1
      end
    end

    pairs
  end
end

class String
  def subword_counts(dictionary)
    subwords = {}

    i = 0
    # Your implementation doesn't seem to rely
    # on each_char so don't use it.
    # length.times do
    self.each_char do |char|
      len = 0
      while (i + len) < self.length
        substr = self[i..(i + len)]

        if dictionary.include?(substr)
          # Unnecessary if you initiazlied the hash
          # with a default value
          # Hash.new(0)
          # Then you can += 1 without worry
          if subwords[substr]
            subwords[substr] += 1
          else
            subwords[substr] = 1
          end
        end

      len += 1
      end

      i += 1
    end

    subwords
  end
end
