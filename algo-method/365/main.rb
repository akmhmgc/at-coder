N = gets.to_i
G = Array.new(N) { gets.chomp.split.map(&:to_i) }
@been = Array.new(N, false)
@ans = 0

def dfs(v)
  # 全て移動している場合は終了
  @been[v] = true
  if @been.count(true) == N
    # 0との距離を追加して終了
    x0, y0 = G[v]
    x1, y1 = G[0]
    @ans += ((x0 - x1)**2 + (y0 - y1)**2).pow(0.5)
    return
  end

  # 行っていない一番近い && 番号が一番若い場所に移動
  # [距離の二乗, 番号]
  distances = []
  N.times do |i|
    next if @been[i] == true

    x0, y0 = G[v]
    x1, y1 = G[i]

    d = ((x0 - x1)**2 + (y0 - y1)**2).pow(0.5)
    distances << [d, i]
  end
  diff, next_v = distances.min_by { |a| a[0] }
  @ans += diff
  dfs(next_v)
end

dfs(0)
puts @ans
