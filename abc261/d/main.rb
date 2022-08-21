N, M = gets.chomp.split.map(&:to_i)
X = gets.chomp.split.map(&:to_i)
CY = Array.new(M) { gets.chomp.split.map(&:to_i) }
C = CY.map { |cy| cy[0] }
Y = CY.map { |cy| cy[1] }

cumsum_x = [0]

N.times do |i|
  cumsum_x[i] = cumsum_x[i - 1] + X[i]
end

cumsum_y = [0]

M.times do |i|
  cumsum_y[i] = cumsum_y[i - 1] + Y[i]
end

max = 0

C.each_with_index do |c, idx|
  sum = 0

  loop_count = N / (c + 1)
  amari = N % (c + 1)
  loop_count += 1 if amari == c

  amari = N - (loop_count - 1) * (c + 1)

  # 最後の一つ前の繰り返し
  sum += (loop_count - 1) * cumsum_y[idx]

  # 最後の残り
  id = C.bsearch_index { |v| v >= amari } || M - 1

  sum += cumsum_y[id]
  N.times do |i|
    next if (i + 1) % (c + 1) == 0 && (i + 1) / (c + 1) < loop_count

    sum += X[i]
  end

  max = [sum, max].max
end

puts max
