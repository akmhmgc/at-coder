H, W = gets.chomp.split.map(&:to_i)

A = Array.new(H) { gets.chomp.split.map(&:to_i) }
B = Array.new(H) { gets.chomp.split.map(&:to_i) }

count = 0

(H - 1).times do |i|
  (W - 1).times do |j|
    diff = B[i][j] - A[i][j]
    A[i][j] += diff
    A[i][j + 1] += diff
    A[i + 1][j] += diff
    A[i + 1][j + 1] += diff

    count += diff.abs
  end
end

if A[-1] == B[-1] && A.transpose[-1] == B.transpose[-1]
  puts 'Yes'
  puts count
else
  puts 'No'
end

