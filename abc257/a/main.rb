N, X = gets.chomp.split.map(&:to_i)

idx = X / N
idx -= 1 if (X % N).zero?

puts ('A'..'Z').to_a[idx]
