N = gets.to_i
A = Array.new(N) { gets.chomp.split.map(&:to_i) }
BUNBO = 10**9 + 7

puts A.inject(1) { |result, ai| result * (ai.sum % BUNBO) } % BUNBO
