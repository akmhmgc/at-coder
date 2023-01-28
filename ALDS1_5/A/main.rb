require 'set'

N = gets.to_i
A = gets.chomp.split.map(&:to_i)
M = gets.to_i
P = gets.chomp.split.map(&:to_i)

val = Set.new
(1 << N).times do |i|
  sum = 0
  N.times do |j|
    sum += A[j] if ((i >> j) & 1) == 1
  end
  val << sum
end

P.each do |pi|
  puts val.include?(pi) ? 'yes' : 'no'
end
