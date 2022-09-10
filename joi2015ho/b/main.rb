N = gets.to_i
A = []
N.times do
  A << gets.to_i
end
A *= 2

# 区間[l,r]を受け取った時のJOIくんの取り分の最大値
dp = Array.new(4200) { Array.new(4200, 0) }

1.upto(N) do |width|
  0.upto(2 * N - width) do |l|
    r = l + width
    dp[l][r] = if width % 2 == N % 2
                 [dp[l + 1][r] + A[l], dp[l][r - 1] + A[r - 1]].max
               else
                 A[l] > A[r - 1] ? dp[l + 1][r] : dp[l][r - 1]
               end
  end
end

arr = []
0.upto(N) do |i|
  arr << dp[i][i + N]
end

puts arr.max
