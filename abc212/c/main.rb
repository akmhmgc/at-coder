n, m = gets.chomp.split.map(&:to_i)

seq_a = gets.chomp.split.map(&:to_i).sort
seq_b = gets.chomp.split.map(&:to_i).sort

j = 0
min = 10**10

seq_a.each do |ai|
  while j < seq_b.length
    bj = seq_b[j]
    diff = ai - bj
    abs = diff.abs
    min = [min, abs].min

    break if diff.negative?

    j += 1
  end
end

puts min
