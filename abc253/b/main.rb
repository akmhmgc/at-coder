# n, m = gets.chomp.split.map(&:to_i)
# n = gets.to_s.to_i  # 整数1つを受け取る(1行に1つ整数がある前提)
# s = gets.to_s.chomp # 1行を文字列として受け取る(chompで最後の改行を切り落としている)
# a = gets.to_s.split.map{ |e| e.to_i } # 横1行のスペース区切りの整数を配列として受け取る

# dp = Array.new(n) { Array.new(m, [false, 0]) }

h, w = gets.to_s.split.map { |e| e.to_i }

points = []

h.times do |i|
  s = gets.chomp.chars

  s.each.with_index do |v, j|
    points << [i, j] if v == 'o'
  end
end

puts (points[0][0] - points[1][0]).abs + (points[0][1] - points[1][1]).abs
