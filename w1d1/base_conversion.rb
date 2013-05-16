## method converts numbers to string using indicated base
# example num_to_s(number, base)
#

def num_to_s(num, base)
  our_hash = {
    10 => 'a', 11 => 'b', 12 => 'c', 13 => 'd', 14 => 'e', 15 => 'f',
    0=> '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 =>'5',
    6 => '6', 7 => '7', 8 => '8', 9 =>'9'
  }
  #make hash


  power = 0
  digits = []
  cond2 = 0
  until cond2 == num
    digit = (num / base**power) % base
    if base <=10
      cond2 = 0
      digits << digit

      cond = (digits.reverse.join(""))
      # convert condition to decimal and check cond == num
      digits.each_with_index do |n, ind|
        cond2 += n*(base**ind)
      end
      #

    else ## num>base && base >10
      puts "I'm bugger >10"
      cond2 = 0
      digits << our_hash[(num / base**power)]
      cond = (digits.reverse.join(""))
      # convert condition to decimal and check cond == num
      digits.each_with_index do |digit, ind|
        cond2 += our_hash.key(digit)*(base**ind)
      end
      puts "power: #{power}, cond2 = #{cond2}, digits = #{digits}"
    end


    power +=1
  end
  cond
end

# puts num_to_s(8,2)
puts num_to_s(6,2)
puts num_to_s(123,10)
puts num_to_s(10,3)
puts num_to_s(17,16)
=begin
  our_hash = Hash.new
  [2..base].each do |item|
    key =
    val =
    our_hash[key] = val
  end
=end