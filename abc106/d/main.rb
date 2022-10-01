N, M, Q = gets.chomp.split.map(&:to_i)
L = []
R = []

M.times do
  l, r = gets.chomp.split.map(&:to_i)
  L << l
  R << r
end

# 全探索の解法
# 計算量はO(MQ)なのでTLE
Q.times do
  count = 0
  pi, qi = gets.chomp.split.map(&:to_i)
  M.times do |i|
    li = L[i]
    ri = R[i]
    count += 1 if pi <= li && ri <= qi
  end
  puts count
end
