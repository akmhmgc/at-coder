require 'set'

N,M = gets.chomp.split.map(&:to_i)
C = []
A = Array.new(M){[]}

M.times do |i|
  c = gets.to_i
  C << c
  A[i].push(*gets.chomp.split.map(&:to_i))
end

all = (1..N).to_set

count = 0
(1 << M).times do |i|
  set = Set.new

  M.times do |j|
    set += A[j] if (i >> j & 1) == 1
  end
  count += 1 if set == all
end

puts count
