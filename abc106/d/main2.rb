N, M, Q = gets.chomp.split.map(&:to_i)
L = []
R = []

NUM = 7
cnt = Array.new(NUM) { Array.new(NUM, 0) }

M.times do
  l, r = gets.chomp.split.map(&:to_i)
  cnt[l][r] += 1
end

# cnt[i][j]: 区間[i, j]（のみ）に含まれる列車の本数
# 例） 区間(1,7)と区間(2,7)は異なる
1.upto(N + 1) do |l|
  2.upto(N + 1) do |r|
    cnt[l][r] += cnt[l][r - 1]
  end
end

p cnt

p cnt[3][4]
p cnt[3][5]

Q.times do
  count = 0
  pi, qi = gets.chomp.split.map(&:to_i)
  pi.upto(qi) do |li|
    count += cnt[li][qi]
  end
  puts count
end
