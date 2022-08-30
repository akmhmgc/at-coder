N = gets.to_i

dp = 0

N.times do
  dp = (1..6).inject(0) { |result, num| result + [dp, num].max } / 6.to_f
end

puts dp

