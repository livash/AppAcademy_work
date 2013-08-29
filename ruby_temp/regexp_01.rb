email = "olena.ivashyna@gmail.com"
extract = email[/\w+\.\w+@\w+\.com/]

puts extract if email == extract
##################################
at_position = email =~ /@/
puts at_position
##################################
#extract all the vowels in the 'email string' and make a hash of occurance
def letter_counter(string)
  res = {}
  letters = string.split('')
  letters.each do |l|
    if res.has_key?(l)
      res[l] += 1
    else
      res[l] = 1
    end
  end
  
  res
end
puts letter_counter(email)

def vowel_counter(hash)
  vowels = ['a', 'e', 'i', 'o', 'u']
  res = {}
  vowels.each do |vowel|
    res[vowel] = hash[vowel] if hash.has_key?(vowel)
  end
  
  res
end

puts vowel_counter(letter_counter(email))

