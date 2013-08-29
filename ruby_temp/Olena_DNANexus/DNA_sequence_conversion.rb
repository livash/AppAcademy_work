#Problem 1: DNA search

def read_piece(length, counter)
  pieces = []
  i = 0
  length.times do 
    i += 1
    pieces << read_byte(i)
  end
  bases = what_base(pieces)
  qualities = qualities(pieces)
  output = "@READ_" + counter.to_s + "\n"
  output += bases.join("") + "\n"
  output += "+READ_" + counter.to_s + "\n"
  output += qualities.join("") + "\n"
  
  output
end

def what_base(array)
  res = []
  array.each do |byte|
    str = byte.unpack("B*")
    case str.first.slice(0,2)
    when "00"
      res << "A"
    when "01"
      res << "C"
    when "10"
      res << "G"
    when "11"
      res << "T"
    end
  end
  
  res
end

def qualities(array)
  # translate qualities for each piece in teh array
  #return translated_qualities
  res = []
  array.each do |byte|
    str = byte.unpack("B*")
    var = str.first.slice(2,6)
    var = "00" + var
    puts var.class
    int = var.to_i(2)
    puts int
    res << (int + 33).chr
  end
  
  res
end

def read_byte(idx)
  @file.read(1)
end

file_name = ARGV[0]
length    = ARGV[1]
length = length.to_i
@file=File.open(file_name, 'r')

counter = 0
until @file.eof?
  counter += 1
  puts read_piece(length, counter)
end