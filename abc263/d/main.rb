N,L,R = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

min = 10**16

# 全て変更する場合
(N + 1).times do |li|
  ri = N - li
  sum = L * li + R * ri
  min = [min, sum].min
end

cumsum = [0]

N.times do |i|
  cumsum << cumsum[i] + A[i]
end

# 小さいインデックス
min_ids = []
N.times do |i|
  if A[i] < [R,L].min
    min_ids << i
  end
end

p min_ids
p cumsum

ranges = []

(min_ids.length - 1).times do |i|
  before = min_ids[i + 1]
  after = min_ids[i]
  if cumsum[before + 1] - cumsum[after] < (after - before +1) * [L,R].min
    
  end
end
