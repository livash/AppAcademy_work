#!/usr/bin/env ruby

student_dirs = Dir.entries('.').select { |entry| File.directory?(entry) }
student_dirs.delete('.')
student_dirs.delete('..')

old_and_new = {}
dirs.each do |dir|
  old_and_new["./#{dir}/lib/assessment01.rb"] = "#{dir.rb}"
end

old_and_new.each do |old_name, new_name|
  text = File.read(old_name)
  new_file = File.open(new_name, 'w') do |f|
    f.puts "# Score: XX of 19"
    f.puts
    f.puts text
  end
end