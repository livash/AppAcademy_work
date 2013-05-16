# count objects in a has using key values

def counter(hash)
  count = 0
  hash.each do |k,v|
    count += 1
  end
  count
end

wrong_hash = { :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" }

puts counter(wrong_hash)