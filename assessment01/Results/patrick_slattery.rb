# Score: 19 of 19
#

# patrick_slattery_assessment01.rb

def factors(num)
  (1..num).select { |factor| num % factor == 0 }
end

def fibs_rec(count)
  fibs = [0, 1]
  if count == 0
    []
  elsif count <= 2
    fibs[0..count - 1]
  else
    # You call  fibs_rec(count - 1) 3 times here
    # Store it in a variable then push on the value you need
    fibs_rec(count - 1) + [fibs_rec(count - 1)[-1] + fibs_rec(count - 2)[-1]]
  end
end

class Array
  def bubble_sort(&prc)
    # Weird name. Instead of using a 'sorted' flag below,
    # use a 'swapped' flag. Or call this array sorted_arr
    # or some such.
    sorter = self.dup
    # Could be cleaner
    # prc ||= proc { |num1, num2| num1 <=> num2 }
    prc || prc = proc { |num1, num2| num1 <=> num2 }
    sorted = false

    while !sorted
      sorted = true
      (length - 1).times do |index|
        if prc.call(sorter[index], sorter[index + 1]) == 1
          sorter[index], sorter[index + 1] = sorter[index + 1], sorter[index]
          sorted = false
        end
      end
    end
    sorter
  end
end

class Array
  def two_sum
    indices = []
    each_with_index do |item1, index1|
     (index1 + 1..length - 1).each do |index2|
        indices << [index1, index2] if item1 + self[index2] == 0
      end
    end
    indices
  end
end

class String
  def subword_counts(dictionary)
    subs = Hash.new(0)
    length.times do |start|
      length.times do |stop|
        # Nice. if start >= stop would be slightly better
        next if start > stop
        subword = self[start..stop]
        subs[subword] += 1 if dictionary.include?(subword)
      end
    end
    subs
  end
end
