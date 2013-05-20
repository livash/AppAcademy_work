
def digital_root(num)
  remainder_array = [num % 10]
  p remainder_array
  rest = num/10 #432
  until rest <10

    remainder_array << rest % 10
    rest = rest/10
    p remainder_array
  end
  remainder_array << rest 
  p remainder_array
 
  dig_root = remainder_array.inject(&:+)
  if dig_root >= 10
    dig_root = digital_root(dig_root)
  end
  dig_root
end