
class Array
  def my_each(&block)
    i = 0
    while i<self.size
      block.call(self[i])
      i +=1
    end
    self
  end
end

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num2|
  puts num2
end
#p return_value