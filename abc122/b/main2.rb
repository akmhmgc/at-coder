S = gets.chomp.split('')
G = %w[
  A
  C
  G
  T
]

ans = 0
count = 0
S.each do |s|
  unless G.include?(s)
    count = 0
    next
  end

  count += 1
  ans = [ans, count].max
end

puts ans
