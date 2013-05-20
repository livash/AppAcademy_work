def caesar_cipher(string, shift_num)
  words = string.split(' ')
  coded_string = []
  words.each do |string_to_cipher|
    letters = string_to_cipher.split('')
    coded_letters = []
    letters.each do |letter|
      if (letter.ord + shift_num) <= 122
        changed_letter = (letter.ord + shift_num).chr
        p changed_letter
        coded_letters << changed_letter
      else
        coded_letter_ord = letter.ord + shift_num - 26
        #p coded_letter_ord
        changed_letter = coded_letter_ord.chr
        coded_letters << changed_letter 
      end
    end
    coded_string << coded_letters.join
  end
  coded_string.join(" ")
end