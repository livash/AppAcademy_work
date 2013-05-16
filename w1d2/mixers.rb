def remix(mixes_in)

  alcohols, mixes = split_ingredients(mixes_in)
  #p alcohols, mixes
  alcohols.shuffle!
  mixes.shuffle!

  final_mix = new_mix(alcohols, mixes)
  final_mix.each do |mix|
    if mixes_in.include?(mix)
      remix(final_mix)
      puts "Mixing again... "
    end
  end
  final_mix
end

def split_ingredients(mixes)

  alcohols = []
  mixers = []

  mixes.each do |mix|
    alcohols << mix.first
    mixers << mix.last
  end

  [alcohols, mixers]
end

def new_mix(alcohols, mixers)
  final_mix = []

  alcohols.length.times do
    final_mix << [alcohols.pop, mixers.pop]
  end

  final_mix
end

p remix([
  ["rum", "coke"],
  ["gin", "tonic"]
])