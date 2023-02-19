q = gets.to_i

def lcs(x,y)
  x.unshift(nil)
  y.unshift(nil)

  n = x.length
  m = y.length
  dp = Array.new(n){Array.new(m, 0)}

  1.upto(n - 1) do |i|
    1.upto(m - 1) do |j|
      xi = x[i]
      yj = y[j]

      if xi == yj
        dp[i][j] = dp[i-1][j-1] + 1
      else
        dp[i][j] = [dp[i-1][j], dp[i][j-1]].max
      end
    end
  end
  dp.last.last
end

q.times do 
  x = gets.chomp.split('')
  y = gets.chomp.split('')
  puts lcs(x,y)
end
