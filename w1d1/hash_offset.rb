def hash_correct(hash)
  values = hash.values
  toRet = {}

  values.each do |value|
    toRet[value[0].to_sym] = value
  end

  toRet
end

wrong_hash = { :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" }

puts hash_correct(wrong_hash)