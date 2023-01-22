N, A, B = gets.chomp.split.map(&:to_i)
S = gets.chomp.chars

ans = 10**20
N.times do |i| # 操作Aを行う回数
  tmp = A * i

  (N / 2).times do |j|
    tmp += B if S[i + j] != S[i - j - 1]
  end
  ans = [ans, tmp].min
end

puts ans
