N, S = gets.chomp.split.map(&:to_i)
A = [0]
B = [0]
N.times do
  a, b = gets.chomp.split.map(&:to_i)
  A << a
  B << b
end

# dp[i][j]: i枚使って合計jを作れるかどうか
dp = Array.new(N + 1) { Array.new(S + 1, false) }
dp[0][0] = true

1.upto(N) do |i|
  h = A[i]
  t = B[i]
  0.upto(S) do |j|
    dp[i][j] ||= dp[i - 1][j - h] if j - h >= 0
    dp[i][j] ||= dp[i - 1][j - t] if j - t >= 0
  end
end

if dp[N][S] == false
  puts 'No'
  exit
end

muki = []
val = S

N.downto(1) do |i|
  h = A[i]
  t = B[i]

  # trueの方をとる
  if dp[i - 1][val - h] == true
    muki << 'H'
    val -= h
    next
  end

  next unless dp[i - 1][val - t] == true

  muki << 'T'
  val -= t
  next
end

puts 'Yes'
puts muki.reverse.join('')
