N, M = gets.chomp.split.map(&:to_i)

A = []
N.times do
  A << gets.chomp.split.map(&:to_i)
end

max = 0

M.times do |i|
  M.times do |j|
    count = 0
    N.times do |n|
      count += [A[n][i], A[n][j]].max
    end
    max = [max, count].max
  end
end

puts max
