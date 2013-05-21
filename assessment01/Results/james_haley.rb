# Score: 19 of 19
#
def factors(num)
  factors = []
  (1..num).each do |i|
    factors << i if num % i == 0
  end

  # Why uniq it? Unnecessary
  factors.uniq

  # could be shorter
  # (1..num).select { |i| num % i == 0 }
end

def fibs_rec(count)
  fibs = []
  case count
  when 1
    return [0]
  when 2
    return [0, 1]
  else
    # Don't need to initialize
    fibs += fibs_rec(count - 1)
    fibs << fibs[-1] + fibs[-2]
  end
end

class Array
  def bubble_sort(&prc)
    arr = self.dup
    prc = Proc.new{ |num1, num2| num1 <=> num2 } unless prc
    sorted = false

    until sorted
      sorted = true
      (arr.length - 1).times do |i|
        if prc.call(arr[i], arr[i + 1]) == 1
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          sorted = false
        end
      end
    end

    arr
  end
end

class Array
  def two_sum
    arr = self.dup
    two_sum = []

    self.each_with_index do |num1, i|
      arr.each_with_index do |num2, j|
        two_sum << [i, j] if num1 + num2 == 0 && i != j
      end
    end

    # This is a sort. Use sort. It'd be cleaner
    # two_sum.map!(&:sort)
    two_sum.each do |pair|
      if pair[0] > pair[1]
          pair[0], pair[1] = pair[1], pair[0]
      end
    end

    # But sorting and uniq'ing would be unnecessary
    # if you simply used 'next' when j <= i in the
    # inner loop
    two_sum.uniq
  end
end

class String
  def subword_counts(dictionary)
    subwords = Hash.new(0)

    dictionary.each do |word|
      i = 0
      while i < self.length
        subwords[word] += 1 if self[i..i + word.length - 1] == word
        i += 1
      end
    end

    subwords
  end
end
