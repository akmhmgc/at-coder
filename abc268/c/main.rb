require 'set'
N = gets.to_i
P = gets.chomp.split.map(&:to_i)

# 動かした時に同じ数になるもの
counts = Array.new(N, 0)

N.times do |i|
  idx = (P[i] - i) % N
  counts[idx] += 1
end

counts = counts*2

max = 0
0.upto(N) do |j|
  max = [max, counts[j..(j+2)].sum].max
end

puts max
