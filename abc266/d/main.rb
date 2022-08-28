N = gets.to_i
points = Hash.new{0}

tmax = 0
N.times do
  t, x, a = gets.chomp.split.map(&:to_i)
  points[[t,x]] = a
  tmax = [tmax, t].max
end

# [t][x] t秒の時点でxの地点にいて最大の得点
dp = Array.new(tmax + 1) { Array.new(5, 0) }

dp[0] = Array.new(5, -10**20)
dp[0][0] = 0

1.upto(tmax).each do |ti|
  5.times do |x|
    befores = if x == 0
                [1,0]
              elsif x == 4
                [3,4]
              else
                [x - 1, x + 1, x]
              end
    dp[ti][x] = points[[ti,x]] + befores.map{|x| dp[ti - 1][x] }.max
  end
end

puts dp.last.max
