# open file using File#foreach method
require 'debugger'

#debugger
file_name = 'test.txt'
lines = []
file = File.open(file_name, "r+")
lines = file.readlines
lines.map!(&:chomp)
file.close

#puts "lines"
#p lines

#load file and do somethig to each line
lines2 = []

File.foreach(file_name) do |line|
  lines2 << "this is a line: #{line}"
end
puts lines2.map!(&:chop)