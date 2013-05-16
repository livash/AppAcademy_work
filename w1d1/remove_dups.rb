# function removes dupes
class Array
  def my_unique
    arr = self
    res = []

    arr.each do |item|
      unless res.include?(item)
        res << item
      end
    end
    res
  end
end

puts [1,2,2,3].my_unique