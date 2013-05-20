def caesar_cipher(str, shift)
  toRet = []
  alphabet = ("a".."z").to_a
  words = str.scan(/\w+/)
  words.each do |word|
    toRet_word = ""
    letters  = word.scan(/\w/)
    letters.each do |letter|
      position = alphabet.find_index(letter)
      coded_position = alphabet.find_index(letter)+shift
      # REV: You can use modulus with alphabet.size here to clean up the code
      if coded_position >= alphabet.size
        coded_position -= alphabet.size
      end
      cipher_letter = alphabet[coded_position]
      toRet_word += cipher_letter
    end
    toRet << toRet_word
  end
  toRet.join(" ").to_s
end
