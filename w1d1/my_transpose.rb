# Function to transpose a matrix
def my_transpose(rows)
  columns = []
  matrix_size = rows.size
  matrix_size.times {columns << []}
  rows.each_with_index do |row, ind|
    #columns << []
    row.each_with_index do |item, ind2|
      columns[ind2][ind] = item
    end
  end
  columns.each_with_index do |column, idx|
    puts idx
    columns.delete(columns[idx]) if column == []
  end
  columns
end

rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
  rows = [
      [1, 2],
      [4, 5],
      [7, 8]
    ]



puts "Before tranpose: #{rows}"
puts "After tranpose: #{my_transpose(rows)}"
