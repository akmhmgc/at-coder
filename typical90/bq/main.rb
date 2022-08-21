N, K = gets.chomp.split.map(&:to_i)

BUNBO = 10**9 + 7

if N <= 2
  val = 1
  N.times do |i|
    val *= (K - i)
  end
else
  val = K * (K - 1) % BUNBO * (K - 2).pow(N - 2, BUNBO) % BUNBO
end

puts val % BUNBO
