#Problem 4. Algorithm

# returns idx for the end of the sequence
def read_sequence(arr, curr_pos)
  n = arr.length
  idx = curr_pos + 1
  (n - curr_pos - 1).times do 
    if arr[idx] < arr[idx - 1]
      return idx
    end
    idx += 1
  end
  
  n
end

def algorithm(arr)
  curr_pos = 0
  n = arr.length
  best_start_pos, best_end_pos, best_sum = 0, 0, 0
  while curr_pos < n do
    next_curr_pos = read_sequence(arr, curr_pos)
    sum = 0
    arr[curr_pos...next_curr_pos].each do |el|
      sum += el
    end
    
    if sum > best_sum || (sum == best_sum && next_curr_pos - curr_pos > best_end_pos - best_start_pos)
      best_start_pos, best_end_pos, best_sum = curr_pos, next_curr_pos - 1, sum 
    end
    
    curr_pos = next_curr_pos
  end
  
  [best_start_pos, best_end_pos]
end

# arr = [1,2,3,4,5,6,78,10, 12]
# 
# puts algorithm(arr)

# Performace is O(n) becuase we touch each element only once.
# Memory foot-print is 'n', because we do not copy any portion of the array