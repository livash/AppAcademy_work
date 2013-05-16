# return all substrings of a given string

def substrings(string)
  letters = string.split('')
  strings = iterate_up(letters) + iterate_down(letters) + letters
  strings.uniq
end

def iterate_up(letters)
  toRet = []
  letters.length.times do |i|
    toRet << letters[0..i].join
  end

  toRet
end

def iterate_down(letters)
  to_return = []

  letters.length.times do |i|
    to_return << letters[i..-1].join
  end

  to_return
end

#substrings("cat")

def subwords(array)
  toRet = []

  dictionary = File.read("2of12inf.txt").split("\r\n")
  array.each do |word|
    toRet << word if dictionary.include?(word)
  end
  toRet
end

p subwords(substrings("cat"))