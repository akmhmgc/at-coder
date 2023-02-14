N, K = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

ans = 10**20
(1 << N).times do |i|
  next if i.to_s(2).count('1') != K || i & 1 != 1

  count = 0
  before = 0
  N.times do |j|
    now = A[j]
    if (i >> j) & 1 == 1 # 現在の建物が見えるようにする
      if before >= now
        count += (before - now) + 1
        now = before + 1
      end
    else # 現在の建物は見えないようにする
      if before < now
        count += now - before
      end
    end
    before = [now, before].max
  end
  ans = [ans, count].min
end

puts ans
