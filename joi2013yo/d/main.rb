D, N = gets.chomp.split.map(&:to_i)

days = []

D.times do
  days << gets.to_i
end

# i日目にjの服を選んだ時の絶対値
dp = Array.new(D) { Array.new(N, 0) }

cloth = []

N.times do |i|
  a, b, c = gets.chomp.split.map(&:to_i)
  cloth << c

  days.each_with_index do |t, idx|
    # t日目の気温がOKかどうか
    next if a <= t && t <= b

    dp[idx][i] = -10**20
  end
end

1.upto(D - 1) do |i|
  N.times do |j|
    next if dp[i][j] < 0

    dp[i][j] = (0..(N - 1)).map { |k| dp[i - 1][k] + (cloth[k] - cloth[j]).abs }.max
  end
end

puts dp.last.max
