# Score: 19 of 19

def factors(num)
  result = []
  (1..num).each do |n|
    result << n if num % n == 0
  end
  result
end

def fibs_rec(count)
  return [0] if count == 1
  return [0, 1] if count == 2

  fibs = fibs_rec(count - 1)
  fibs << fibs[-2] + fibs[-1]
end

class Array
  def bubble_sort(&prc)
    array = self.dup

    prc = Proc.new { |n1, n2| n1 <=> n2 } unless prc

    sorted = false
    until sorted
      sorted = true

      array.each_index do |i|
        next if i == array.length - 1

        if prc.call(array[i], array[i +1]) == 1
          array[i], array[i + 1] = array[i + 1], array[i]
          sorted = false
        end
      end
    end
    array
  end
end

class Array
  def two_sum
    array = self.dup
    result = []

    array.each_index do |i|
      array.each_index do |j|
        next if j <= i
        result << [i, j] if array[i] + array[j] == 0
      end
    end
    result
  end
end

# ["a", "am", "an", "pa", "pan", "panama"]
class String
  def subword_counts(dictionary)
    result = {}

    # Interesting approach iterating through the dictionary
    # but seems less efficient than constructing subwords
    # and checking to see if that subword is included in the
    # dictionary. Yes, you iterate through the
    # dictionary when you do an include? but imagine the
    # dictionary was a hash.
    dictionary.each do |subword|
      self.split(//).each_cons(subword.length) do |cons|
        # Could avoid the has_key? check if you initialized
        # the hash with a default value
        # result = Hash.new(0)
        # Then could always += 1 without worry
        if result.has_key?(subword)
          result[subword] += 1 if subword == cons.join
        else
          result[subword] = 1 if subword == cons.join
        end
      end
    end
    result
  end
end
