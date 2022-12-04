N = gets.to_i
S = gets.chomp.split.map(&:to_i)

S.reverse!
ans = []

0.upto(N - 2) do |i|
  ans << S[i] - S[i + 1]
end

ans << S[N-1]

puts ans.reverse * ' '
