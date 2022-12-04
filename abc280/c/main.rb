S = gets.chomp.split('')
T = gets.chomp.split('')

N = S.length

ans = N + 1
N.times do |i|
  if S[i] != T[i]
    ans = i + 1
    break
  end
end

puts ans
