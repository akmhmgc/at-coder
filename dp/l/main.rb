N = gets.to_i
A = gets.chomp.split.map(&:to_i)
dp = Array.new(3300) { Array.new(3300, 0) }
1.upto(N) do |width|
  0.upto(N - width) do |l|
    r = l + width
    dp[l][r] = if width % 2 == N % 2
                 [dp[l + 1][r] + A[l], dp[l][r - 1] + A[r - 1]].max
               else
                 [dp[l + 1][r] - A[l], dp[l][r - 1] - A[r - 1]].min
               end
  end
end

puts dp[0][N]
