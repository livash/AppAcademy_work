def digital_root(num)
  return num if num < 10
  sum = 0
  while num > 10
    sum += num%10
    num = num/10
  end
  sum += num
  sum=digital_root(sum) if sum >= 10
  sum
end

def digital_root_step(num)
  
end