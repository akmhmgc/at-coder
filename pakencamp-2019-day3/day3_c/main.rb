N, M = gets.chomp.split.map(&:to_i)
A = Array.new(N) { gets.chomp.split.map(&:to_i) }

max = 0
# どの曲を歌うかを全探索する
0.upto(M - 1) do |i|
  0.upto(M - 1) do |j|
    count = 0

    N.times do |k|
      count += [A[k][i], A[k][j]].max
    end
    max = [max, count].max
  end
end

puts max
