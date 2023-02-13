N = gets.to_i
H = []
S = []
N.times do
  h, s = gets.chomp.split.map(&:to_i)
  H << h
  S << s
end

# その得点が実現可能かどうか
def ok(point)
  # 何秒以内に撃ち落とす必要があるか
  seconds = []
  N.times do |i|
    seconds << (point - H[i]) / S[i]
  end
  seconds.sort!
  flag = true
  seconds.each_with_index do |si, idx|
    flag = false if si < idx
  end
  flag
end

puts (1..10**24).bsearch { |v| ok(v) }
