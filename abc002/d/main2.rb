require 'set'
N, M = gets.chomp.split.map(&:to_i)

XY = Set.new
M.times do
  x, y = gets.chomp.split.map(&:to_i).map { |v| v - 1 }
  XY << [x, y]
end

ans = 0
(1 << N).times do |i|
  flag = true
  0.upto(N - 1) do |j|
    next if i >> j & 1 != 1

    (j + 1).upto(N - 1) do |k|
      next if i >> k & 1 != 1

      flag = false unless XY.include?([j, k])
    end
  end
  next unless flag

  count = 0
  N.times do |l|
    count += 1 if (i >> l) & 1 == 1
  end
  ans = [ans, count].max
end

puts ans
