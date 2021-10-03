=begin
Implement a method #stock_picker that takes in an array of stock prices, one for each 
hypothetical day. It should return a pair of days representing the best day to buy and the
best day to sell. Days start at 0.
=end

def stock_picker(array)

  stock_price = array
  minimun_price = stock_price[0]
  minimun_day = 0

  profit = 0
  best_scenario_possible = [0,0]
  
  stock_price.each_with_index do |price, day|
    #finding minimun price
    if price < minimun_price
      minimun_price = price
      minimun_day = day
      next
    end
    #finding maximum profit possible
    if price - minimun_price > profit
      profit = price - minimun_price
      best_scenario_possible = [minimun_day, day]
    end
  end
  return best_scenario_possible

end

arr = [17,3,6,9,15,8,6,1,10]

stock_picker(arr)