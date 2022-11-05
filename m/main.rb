N, K = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)
R = Array.new(N + 1, 0)

if N == 1
  puts 0
  exit
end

1.upto(N - 1) do |i|
  R[i] = i == 1 ? 1 : R[i - 1]

  p R[i]
  # while R[i] < N && A[R[i] + 1] - A[i] <= K
  #   R[i] += 1
  # end
end

p R
