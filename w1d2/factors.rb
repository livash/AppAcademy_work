# print out all the factors for a given range of numbers
def factors(range)
  final_factors = {}

  range.each do |number|
    the_factors = []
    (1..number).each do |i|
      the_factors << i if number % i == 0
    end
    final_factors[number] = the_factors
  end
  final_factors
end

puts factors(1..100)