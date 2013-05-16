#super print your string !!!!

def super_print(string, options={})
  toRet = string
  defaults = {
    times: 1,
    upcase: false,
    reverse: false
  }
  options = defaults.merge(options)
  (options[:times]-1).times {toRet += string}
  toRet.upcase! if options[:upcase]
  toRet.reverse! if options[:reverse]


  toRet

end

puts super_print("Jeremy ", times: 3, upcase: true)