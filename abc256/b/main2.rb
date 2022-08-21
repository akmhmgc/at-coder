N = gets.to_i
A = gets.chomp.split.map(&:to_i)

koma = []

A.each do |ai|
  koma << 0
  koma.map! { |k| k += ai }
end

puts koma.count { |x| x > 3 }
