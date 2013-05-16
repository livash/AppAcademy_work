# methods for SET class

def set_add_el(hash, sym)
  hash[sym] = true
  hash
end

# puts set_add_el({}, :x)
# puts set_add_el({:x => true}, :x)

def set_remove_el(hash, sym)
  hash.delete(sym)
  hash
end

# puts set_remove_el({:x => true}, :x)

def set_list_els(hash)
  hash.keys
end

# print set_list_els({:x => true, :y => true})
# puts

def set_member?(hash, key)
  hash.has_key?(key)
end

def set_union(hash1, hash2)
  hash1.merge(hash2)
end

def set_intersection(hash1, hash2)
  toRet = Hash.new
  hash1.each do |k1,v1|
    toRet[k1] = v1 if hash2.has_key?(k1)
  end
  toRet
end

#print set_intersection({:x => true, :y => true}, {:y => true})

def set_minus(hash1, hash2)
  toRet = Hash.new
  hash1.each do |k1,v1|
    toRet[k1] = v1 if !hash2.has_key?(k1)
  end
  toRet
end
print set_minus({:x => true, :y => true}, {:y => true})