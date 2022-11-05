MOD = 10**9 + 7
W, H = gets.split.map { _1.to_i - 1 }
 
a = 1.upto(H+W).inject(1) { |e, prod| prod * e % MOD }
b = 1.upto(H).inject(1) { |e, prod| prod * e % MOD }
c = 1.upto(W).inject(1) { |e, prod| prod * e % MOD }

bunbo = b * c % MOD
puts a * bunbo.pow(MOD - 2, MOD) % MOD


