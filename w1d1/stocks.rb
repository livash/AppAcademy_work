# calculate when to sell the stock

def sell(arr)
  toRet = []
  max_profit = 0
  day1 = 0
  while day1 < arr.size
    day2 = day1 +1
    while day2 < arr.size

      profit = arr[day2]- arr[day1]
      # puts "day1 #{day1}, day2 #{day2}, profit #{profit}"
      if profit > max_profit
        max_profit = profit
        toRet = []
        toRet << day1
        toRet << day2
      end
      day2 += 1
    end
    day1 += 1
  end
  toRet
end

stock = [30,45,15,10,45, 100]

print stock
puts
puts sell(stock)