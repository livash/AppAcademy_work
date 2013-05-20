def ceaser_cipher(string_to_cipher, shift_num)
  letters = string_to_code.split('')
  coded_letters = []
  letters.each do |letter|
    if (letter.ord + shift_num) <= 122
      changed_letter = (letter.ord + shift_num).chr
    else
      coded_letter_ord = letter.ord + shift_num - 122
      changed_letter = coded_letter_ord.chr
      coded_letters << changed_letter 
    end
  end
  coded_string = coded_letters.join
end