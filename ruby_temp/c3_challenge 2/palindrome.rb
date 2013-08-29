# Problem: Find the largest 15 digit palindrome perfect square
# Answer: 900075181570009

def palindrome(digits)
  num = ("1" + "0" * (digits / 2)).to_i
  result = []
  until (num * num).to_s.length == digits + 1
    if is_palindrome?(num*num) and is_n_digits_long?(num * num, digits)
      puts num 
      puts num * num
      puts "........"
      result << num * num
    end
    num += 1
  end
  
  result.max
end

def is_palindrome?(num)
  num.to_s == num.to_s.reverse
end

def is_n_digits_long?(num, digits)
   num.to_s.length == digits
end
puts palindrome(15)