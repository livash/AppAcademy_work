
def common_substrings(string_first, string_last)
  substrings_array_first = []
  substrings_array_last = []
  #split each string onto substrings
   substrings_array_first = split_to_substrings(string_first)
   substrings_array_last = split_to_substrings(string_last)
  
  #iterate through substrings of one and ask where the other include this substring
  max_sub_string = ""
  substrings_array_first.each do |sub_string|
    condition = substrings_array_last.include?(sub_string) && max_sub_string.length < sub_string.length
    max_sub_string = sub_string if condition 
  end
  
  max_sub_string 
end

def split_to_substrings(string)
  sub_strings_array = []
  letters = string.split("")
  letters.each_with_index do |letter, ii|
    letters.each_with_index do |item, jj|
      sub_strings_array << letters[ii..jj].join
    end
  end
  
  sub_strings_array
end