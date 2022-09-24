N, M = gets.chomp.split.map(&:to_i)

INF = 10**25
D = Array.new(N + 1) { Array.new(N + 1, INF) }
T = Array.new(N + 1) { Array.new(N + 1, 0) }

M.times do
  s, t, d, time = gets.chomp.split.map(&:to_i)
  s -= 1
  t -= 1
  D[s][t] = d
  D[t][s] = d
  T[s][t] = time
  T[t][s] = time
end

# 最短時間、組み合わせ
dp = Array.new(1 << N) { Array.new(N + 1) { [INF, 0] } }

# フラグが立っていない時に最後にいるのは1
# 最初にいるばしょ
dp[0][0] = [0, 1]

1.upto((1 << N) - 1) do |s|
  # i: 最後にいる場所
  N.times do |i|
    # 最後にいる場所が集合に含まれていなかったらスキップ
    next if 1 & (s >> i) != 1

    arr = []
    N.times do |j|
      # 間に合わない場合
      # 最後にいる都市: 都市 i
      time = dp[s & ~(1 << i)][j][0] + D[j][i]
      next if T[j][i] < time

      com = dp[s & ~(1 << i)][j][1]

      arr << [time, com]
    end
    next if arr.empty?

    min_time = arr.min_by { |v| v[0] }[0]
    dp[s][i][0] = min_time

    arr.each do |t, com|
      next unless t == min_time

      dp[s][i][1] += com
    end
  end
end

if dp[(1 << N) - 1][0][0] >= INF
  puts 'IMPOSSIBLE'
else
  puts dp[(1 << N) - 1][0] * ' '
end
