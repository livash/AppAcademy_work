########method concatenates strings passed to it in an array

def concatenate(arr)
  arr.inject("") {|res, str| res += str}
end

puts concatenate(["Yay ", "for ", "strings!"])