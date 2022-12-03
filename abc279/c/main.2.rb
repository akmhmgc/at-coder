H, W = gets.chomp.split.map(&:to_i)

S = Array.new(H) { gets.chomp.split('') }
T = Array.new(H) { gets.chomp.split('') }


count_s = Hash.new(0)
count_t = Hash.new(0)

S.transpose.each do |line|
  count_s[line.count('#')] += 1
end

T.transpose.each do |line|
  count_t[line.count('#')] += 1
end

flag = true

count_s.each do |k,v|
  flag = false if count_s[k] != count_t[k]
end

puts flag ? 'Yes' : 'No'
