#cesar cipher translator



def cesar(str, num)
  letters = []
  str.each_byte { |letter| letters << letter }

  toRet = letters.map do |letter|
    if letter + num <= 122
    (letter+num).chr
  else
    (letter + num -26).chr
  end
  end
  toRet.join("")
end

puts cesar("zoo", 3)