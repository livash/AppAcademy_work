# Score: 16 of 19
def factors(num)
	(1..num).select do |x|
		num % x == 0
	end
end

def fibs_rec(count)
	if count == 0
		[]
	elsif count == 1
		[0]
	elsif count == 2
		[0, 1]
	else
		previous = fibs_rec(count - 1)
		previous << (previous[-2] + previous[-1])
	end
end

class Array
  def bubble_sort(&prc)
  	self.dup.bubble_sort!(&prc)
  end

  def bubble_sort!(&prc)
  	# prc = { |x, y| x <=> y } unless prc

    # The prc trick is as follows:
    # prc ||= Proc.new { |x, y| x <=> y }
    # This defaults the prc to sorting in ascending
    # order using the default comparator (<=>) for the
    # objects in the array

  	sorted = false

  	i = 0
  	until sorted
  		sorted = true

  		next if i > count - 2

      # Then down here you could do
      # if prc.call(self[i], self[i + 1]) == 1
      #
      # But even without the above trick, you could just
      # have some manual code down here that checked for
      # the presence of a prc and used it if it was
      # present; otherwise, it would use regular comparison.

  		# if prc(self[i], self[i + 1]) == 1
  		if self[i + 1] > self[i]
  			self[i], self[i + 1] = self[i + 1], self[i]
  			sorted = false
  		end

  		i += 1
  	end
  	self.reverse
  end
end

class Array
  def two_sum
  	pairs = []

    # No need for the to_a call
    # Can iterate over a range without it
    # Can also just do
    # length.times do |i|
    # OR
    # (count - 2).times do |i|
  	(0...(count - 1)).to_a.each do |i| #grab an element

      # Might be cleaner do just do another
      # length.times do |j|
      # with a 'next' if j <= i
  		candidates = self[i + 1..-1]

  		candidates.each_with_index do |candidate, j|
  			if self[i] + candidate == 0
  				pairs << [i, (j + i + 1)]
  			end
  		end
  	end
  	pairs
  end
end

class String
  # I'd take a look at the solution for this one and
  # step through it slowly, understanding what
  # each piece is doing. It looks like you made it
  # more difficult on yourself that it actually is.
  # But you had a lot of the right ideas.

  def subword_counts(dictionary)
    # You probably want the counts as a hash
    # Key: word, Value: count
  	counts = Array.new(0)
  	subwords = subwords(dictionary)
  	subwords.each do |subword|
  		minus = gsub(/subword/, '')
  		count = (length - minus.length) / subword.length
  		counts[subword] = count
  	end
  	counts
  end

  def subwords(dictionary)
  	substrings.select do |substring|
  		dictionary.include?(substring)
  	end
  end

  def substrings
  	# e.g. "cat"
  	substrings = []
  	substrings_beginnings = []
  	length.times do |i|
  		substrings_beginnings << slice(0..i)
  	end
  	substrings_beginnings.each do |substring|
  		substring.length.times do |j|
  			substrings << substring.slice(j..-1)
  		end
  	end
  	substrings
  end

end
