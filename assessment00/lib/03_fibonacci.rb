def fibs(num)
  toRet = [0,1]
  return [] if num == 0
  return [0] if num == 1
  
  while toRet.length < num
    toRet = add_fib(toRet)
  end
  toRet
end

def add_fib(arr)
  last = arr.last
  last_1 = arr[arr.size-1-1]
  arr << (last + last_1)
  arr
end