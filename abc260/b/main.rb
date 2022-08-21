N, X, Y, Z = gets.chomp.split.map(&:to_i)

score = []
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)

N.times do |i|
  score << [A[i], B[i], i + 1]
end

ok = []

# 数学の点数で並び替え
score.sort_by! { |v| [-v[0], v[2]] }
ok.append(*score.shift(X))

score.sort_by!{|v| [-v[1], v[2]]}
ok.append(*score.shift(Y))

score.sort_by!{|v| [-(v[0] + v[1]), v[2]]}
ok.append(*score.shift(Z))

ok.sort_by!{|ok| ok[2]}

ok.each do |i|
  puts i[2]
end
