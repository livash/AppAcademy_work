#Problem 2 :Search

def binary_search(arr, x)
  first = 0
  last = arr.length
  mid = (last - first) / 2
  left_arr = arr[first...mid]
  right_arr = arr[mid..last]
  position = mid
  if x > arr[mid]
    position = binary_search(right_arr)
  elsif x < arr[mid]
    position = binary_search(left_arr)
  elsif x == arr[mid]
    position = mid
  end
  
  position
end

def search(arr, x)
  position = binary_search(arr, x)
  
  while arr[position] == x
   
    position -= 1
  end
  
  position + 1
end

# test
# arr = [1,2,3,4,4,4,5,6,7]
# 
# puts search(arr, 4)