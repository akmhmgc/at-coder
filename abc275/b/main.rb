MOD = 998_244_353
A, B, C, D, E, F = gets.chomp.split.map(&:to_i)

puts (( A*B * C) - (D * E * F)) % MOD


