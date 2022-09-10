50.times do
  n = gets.to_i
  exit if n == 0
  arr = gets.chomp.split.map(&:to_i)

# 区間(i,j)を与えた時に取り除ける最大のブロック数
  dp = Array.new(330) { Array.new(330, 0) }
  dp[0][0] = 0
  2.upto(n) do |width|
    0.upto(n - width) do |l|
      r = l + width
      l.upto(r) do |k|
        dp[l][r] = [dp[l][r], dp[l][k] + dp[k][r]].max
      end

      next if dp[l + 1][r - 1] != r - l - 2

      val = dp[l + 1][r - 1]
      val += 2 if (arr[l] - arr[r - 1]).abs <= 1

      dp[l][r] = [dp[l][r], val].max
    end
  end

  puts dp[0][n]
end
