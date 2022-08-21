N, Q = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

diff = []
N.times do |i|
  if i == 0
    diff << 0
    next
  end

  diff << A[i] - A[i - 1]
end

sum = diff.map(&:abs).sum

Q.times do
  l, r, v = gets.chomp.split.map(&:to_i)
  l -= 1
  r -= 1

  unless l == 0
    sum -= diff[l].abs
    diff[l] += v
    sum += diff[l].abs
  end

  unless r == (N - 1)
    sum -= diff[r + 1].abs
    diff[r + 1] -= v
    sum += diff[r + 1].abs
  end
  puts sum
end
