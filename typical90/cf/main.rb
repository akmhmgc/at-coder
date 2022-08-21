N = gets.to_i
S = gets.chomp

arr = []

N.times do |i|
  if i > 0 && S[i] == S[i - 1]
    arr[-1] += 1
  else
    arr << 1
  end
end

all = N * (N + 1) / 2

diff = 0
arr.each do |i|
  diff += i * (i + 1) / 2
end

puts all - diff
