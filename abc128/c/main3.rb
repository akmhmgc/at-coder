N, M = gets.chomp.split.map(&:to_i)
S = []

M.times do
  _, *s = gets.chomp.split.map(&:to_i)
  S << s.map{|i| i-= 1}
end

P = gets.chomp.split.map(&:to_i)

count = 0
(1 << N).times do |i|
  flag = true
  M.times do |j|
    on = 0
    S[j].each do |sj|
      on += 1 if (i >> sj) & 1 == 1
    end
    flag = false if on % 2 != P[j]
  end
  count += 1 if flag
end

puts count
