def sort(arr)
  return arr if arr.length < 2
  
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..(arr.length - 1)]
  res = merge(sort(left), sort(right))
  
  res
end

def merge(left, right)
  res = []
  while left.length > 0 and right.length > 0
    if left.first > right.first
      res << right.shift
    else
      res << left.shift
    end
  end
  res += left + right
  
  res
end

arr = [5,4,3,2,1, 45, 46, 70, 10000, 40]
puts sort(arr).join(" ")