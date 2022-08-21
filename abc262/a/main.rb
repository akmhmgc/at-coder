Y = gets.to_i

amari = Y % 4
sho = Y / 4


if amari == 2
  puts Y
elsif amari == 0
  puts Y + 2
elsif amari < 2
  puts sho * 4 + 2
elsif
  puts (sho + 1) * 4 + 2
end
