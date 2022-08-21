N, K = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

min = 10 ** 10 * 15
(1 << N).times do |i|
  buildings = A.dup
  diffs = 0
  count = i.to_s(2).count('1')
  next if count < K

  befores = [0]
  N.times do |j|
    if (i >> j) & 1 == 1
      diff = [befores.max - buildings[j] + 1, 0].max 
      buildings[j] += diff
      diffs += diff
      # if i.to_s(2) == "11010"
      #   p befores
      #   p A[j]
      # end
    end
    befores << buildings[j]
  end
  min = [min, diffs].min
end

puts min
