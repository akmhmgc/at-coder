A, B = gets.chomp.split.map(&:to_i)

val = A.pow(2/3.to_f) / (2 * B).pow(2/3.to_f) - 1

if val <= 0
  puts 1 * 0 + A
  exit
end



c = val.ceil
f = val.floor

ans = [B * c + A / Math.sqrt(c + 1), B * f + A / Math.sqrt(f + 1)].min

puts sprintf("%.8f", ans)
