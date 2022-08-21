N, M = gets.chomp.split.map(&:to_i)

XY = Array.new(M) { gets.chomp.split.map(&:to_i) }
all = (1..N).to_a

max = 1
(1 << N).times do |i|
  c = i.to_s(2).rjust(N, '0').split('').map(&:to_i)
  members = []
  all.zip(c).map { |m, c| members << m if c != 0 }
  next if members.count < 2

  count = members.count

  combin = members.combination(2).to_a
  all_ok = true
  combin.each do |com|
    all_ok = false unless XY.include?(com)
  end

  max = [max,count].max if all_ok
end

puts max
