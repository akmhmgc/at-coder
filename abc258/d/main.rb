N, X = gets.chomp.split.map(&:to_i)

AB = Array.new(N) { gets.chomp.split.map(&:to_i) }

min = 10**20

# それぞれのゲームを1回クリアした時点の時間
ones = [0]

# それぞれのゲームをクリアした時点での最小時間
mins = Array.new(N, 10**10)

AB.each_with_index do |ab, idx|
  ai,bi = ab
  ones[idx] = ones[idx -1] + ai + bi

  mins[idx] = [mins[idx], mins[idx - 1],bi].min

  # 残り回数
  remain = X - idx - 1
  break if remain < 0

  now_min = ones[idx] + remain * mins[idx]
  min = [now_min,min].min
end

puts min
