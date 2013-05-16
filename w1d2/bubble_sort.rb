# bubble sort
def bubble_sort!(array)

  sorted = false
  until sorted
    array.each_with_index do |number, i|
      next if i == 0
      if number < array[i - 1]
        numbers = array.slice!((i-1)..i)
        array.insert((i-1), numbers.last, numbers.first)
      end
    end

    sorted = is_sorted?(array)
  end
  array
end

def is_sorted?(array)
  count = 0
  i = 1
  while i <array.size
    count += 1 if array[i-1] > array[i]
    i += 1
  end
  count == 0
end

p bubble_sort!([4,3,6,1])