require 'prime'

N = gets.to_i

prime_count = N.prime_division.inject(0) { |result, div| result + div[1] }

puts Math.log(prime_count, 2).ceil.to_i
