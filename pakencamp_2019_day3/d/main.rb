N = gets.to_i
A = []

5.times do
  line = gets.chomp.split('').map do |s|
    case s
    when 'R'
      0
    when 'B'
      1
    when 'W'
      2
    else
      -1
    end
  end
  A << line
end

A = A.transpose
A.unshift(Array.new(5, 0))

dp = Array.new(N + 1) { Array.new(3, 0) }

1.upto(N) do |i|
  3.times do |j|
    # 変更が必要な色
    changes = 5 - A[i].count(j)
    dp[i][j] = ([0,1,2] - [j]).map{|k| dp[i-1][k]}.min + changes
  end
end

puts dp.last.min
