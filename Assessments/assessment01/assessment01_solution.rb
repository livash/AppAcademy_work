def factors(num)
  (1..num).select { |i| (num % i) == 0 }
end

def fibs_rec(count)
  # If you didn't get fibs_rec right, step through my version in the
  # debugger. You need to know how this works *cold*.
  case count
  when 0
    []
  when 1
    [0]
  when 2
    [0, 1]
  else
    first_fibs = fibs_rec(count - 1)
    next_fib = first_fibs[-1] + first_fibs[-2]
    first_fibs + [next_fib]
  end
end

class Array
  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  def bubble_sort!(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc = Proc.new { |x, y| x <=> y } if prc.nil?

    sorted = false
    until sorted
      sorted = true

      (0...(count - 1)).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          # Parallel assignment; use it when swapping.
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end

    self
  end
end

class Array
  def two_sum
    pairs = []
    count.times do |i1|
      ((i1 + 1)...count).each do |i2|
        pairs << [i1, i2] if self[i1] + self[i2] == 0
      end
    end

    pairs
  end
end

class String
  def subword_counts(dictionary)
    counts = Hash.new(0)
    length.times do |i1|
      (i1...length).each do |i2|
        substring = self[i1..i2]
        counts[substring] += 1 if dictionary.include?(substring)
      end
    end

    counts
  end
end
