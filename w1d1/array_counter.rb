def count_array_items(arr)
  counter = {}

  arr.each do |item|
    if counter[item]
      counter[item] += 1
    else
      counter[item] = 1
    end
  end
  counter
end

arr = [:a, :a, :b]
puts count_array_items(arr)