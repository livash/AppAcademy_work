def common_substrings(str1, str2)
  toRet = []
  for j in 0...str1.size
    for i in j...str1.size
      toRet << str1[j..i] if str2.include?(str1[j..i])
    end
  end
  longest = ""
  toRet.each do |str|
    longest = str if str.length > longest.length
  end
  longest
end
