require 'pry-byebug'
class StockPicker

  def stock_picker(prices)
    # Community Solution:
    #     results = prices.each_with_index.to_a.combination(2).max_by{|buy,sell| sell[0]-buy[0]}.map{|price, i| i}
    # Idea: Take the price-index pairs, make all the possible pairwise combinations excluding self in the array, then try to maximize profit.
    # The original solution above did not account for sell day (or index) not being strictly greater than the buy day (index). --> Filter to get valid pairs
    pairs = prices.each_with_index.to_a.combination(2)
                  .select { |(buy, buy_index), (sell, sell_index)| buy_index < sell_index }
    puts "Valid pairs: #{pairs.inspect}"  # Debug print
    best_trade = pairs.max_by { |(buy, _), (sell, _)| sell - buy }
    puts "Best trade: #{best_trade.inspect}"  # Debug print
    return best_trade.map { |(_, i)| i } if best_trade
  end

end