# Score: 19 of 19
#
def factors(num)
  answer = []

  i = 1
  num.times do
    if factor?(i,num)
      answer << i
    end
    i += 1
  end
  answer

  # Very verbose. Unnecessary helper
  # (1..num).select { |i| num % i == 0 }
end

def factor?(i, num)
  num % i == 0
end


def fibs_rec(count)
  case count
  when 1
    [0]
  when 2
    # Spaces after commas
    [0,1]
  when 3
    [0,1,1]
  else
    rest = fibs_rec(count - 1)
    # better to shovel rest[-1] and rest[-2]
    # Concatenating creates copies of the array,
    # which is unnecessary in this case
    rest + [(rest[-1] + rest[-2])]
  end
end


class Array
  def bubble_sort(&prc)
    arr = self.dup
    sorted = false
    blk = prc ||= Proc.new { |num1, num2| num1 <=> num2 }

    until sorted
      sorted = true
      arr.size.times do |i|
        break if i == arr.size - 1
        if blk.call(arr[i], arr[i + 1]) == 1
          arr[i], arr[i + 1] = arr[i + 1], arr[i]
          sorted = false
        end
      end
    end
    arr
  end
end



class Array
  def two_sum #I know this is ugly and patched as hell...I was in a rush sorry
    arr = self.dup
    answer = []

    arr.size.times do |i|
      arr.each_with_index do |el, idx|
        index = []
        if arr[i] + el == 0 && idx != i
          push_this = [i, idx]
          # Unnecessary conditional if you simply use 'next' when
          # idx <= i
          answer << push_this if answer.none? { |el| el == push_this.reverse }
        end
      end
    end
    answer
  end
end


class String
  def subword_counts(dictionary)
    subwords = sub_words(self)
    subwords.delete_if { |word| !dictionary.include?(word) }
    count = Hash.new(0)

    subwords.each do |word|
      count[word] += 1
    end
    count
  end
end

def sub_words(word)
  possible_words = []
  siz = word.length

  siz.times do |i|
    siz.times do |j|
      # Unnecessary conditional if you 'next' when
      # j <= i
      possible_words << word[i..j] if word[i..j].length >= 1
    end
  end
  possible_words
end
