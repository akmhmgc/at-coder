N,M,K = gets.chomp.split.map(&:to_i)

A = gets.chomp.split.map(&:to_i)

S = A[0..(M-1)]
l = S[0]
S_sort = S.sort
ans = []
ans << S_sort[0..(K-1)].sum


1.upto((N-M)) do |i|
  r = A[i + (N-M) + 1]
end
