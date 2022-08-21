S = gets.chomp.chars

acgt = %w[A C G T]

max = 0
S.length.times do |i|
  count = 0
  i.upto(S.length - 1) do |j|
    break unless acgt.include?(S[j])

    count += 1
  end
  max = [max, count].max
end

puts max
