d = gets.to_i
n = gets.to_i
m = gets.to_i
stores = Array.new(n - 1) { gets.to_i }
destinations = Array.new(m) { gets.to_i }

# 店舗の場所
stores << 0
stores << d

# 破壊的メソッドじゃないとダメ
stores.sort!

distance = 0

destinations.each do |destination|
  idx = stores.bsearch_index { |v| v >= destination }
  
  distance += [(stores[idx] - destination).abs, (stores[idx - 1] - destination).abs].min
end

puts distance
