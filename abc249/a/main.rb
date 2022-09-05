A, B, C, D, E, F, X = gets.chomp.split.map(&:to_i)

a = X / (A + C)
b = [X % (A + C), A].min

c = X / (D + F)
d = [X % (D + F), D].min

taka = (a * A + b) * B 
aoki = (c * D + d) * E 

if taka > aoki
  puts 'Takahashi'
elsif aoki > taka
  puts 'Aoki'
else
  puts 'Draw'
end
