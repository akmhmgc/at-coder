N, X, Y = gets.chomp.split.map(&:to_i)

if N < 2
  puts 0
  exit
end

reds = Array.new(N, 0)
blues = Array.new(N, 0)

reds[0] = 1

0.upto(N - 2) do |i|
  reds[i + 1] += reds[i] * (X + 1)
  blues[i + 1] += reds[i] * X * Y

  reds[i + 1] += blues[i]
  blues[i + 1] += blues[i] * Y
end

puts blues.last
