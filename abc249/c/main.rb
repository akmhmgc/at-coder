N, K = gets.chomp.split.map(&:to_i)

S = []
N.times do
  s = Array.new(26, 0)
  gets.chomp.chars.each { |ch| s[ch.ord - 97] = 1 }
  S << s
end

max = 0

(2**N).times do |num|
  moji = Array.new(26, 0)
  N.times do |i|
    # flag: i番目の値を選択するかどうか
    flag = num >> i & 1 == 1
    next unless flag

    moji = [moji, S[i]].transpose.map { |a| a.inject(:+) }
  end
  max = [moji.count(K), max].max
end

puts max
