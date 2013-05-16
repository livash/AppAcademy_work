# shuffle file lines from an input file

def run
  puts "Input file name: "
  file_name = gets.chomp
  file = File.open(file_name)
  lines = file.readlines
  file.close
  file_string = file_name.split(".")
  file_name_new = "#{file_string.first}_shuffled.#{file_string.last }"
  file_new = File.new(file_name_new, 'w+')

  lines.shuffle.each do |line|
    file_new.write(line)
  end
  file_new.close
  puts "#{file_name_new}file was created"
end


if __FILE__ == $PROGRAM_NAME
  run
end