# method to multiply each array element by 2

def mult2(arr)
  arr.map {|num| num*2}
end

arr = [1,2,3]
puts mult2(arr)