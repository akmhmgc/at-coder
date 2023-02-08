N = gets.to_i
# 店舗
M = gets.to_i
# 注文
O = gets.to_i
# 店舗の位置
S = Array.new(M - 1){ gets.to_i }
S << 0
S << N
S.sort!

# 宅配先
G = Array.new(O) { gets.to_i }

ans = 0
G.each do |gi|
  idx = S.bsearch_index { |v| v >= gi }
  ans += [(S[idx] - gi).abs, (S[idx - 1] - gi).abs].min
end

puts ans
