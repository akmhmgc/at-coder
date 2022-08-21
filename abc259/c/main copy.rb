S = gets.chomp
T = gets.chomp

s_chrs = {}
t_chrs = {}

s_order = []
t_order = []


('a'..'z').each do |ch|
  s_chrs[ch] = 0
  t_chrs[ch] = 0
end

S.chars do |chr|
  s_chrs[chr] += 1
  s_order << chr unless s_order.include?(chr)
end
T.chars do |chr|
  t_chrs[chr] += 1
  t_order << chr unless t_order.include?(chr)
end

if s_order !=t_order
  puts 'No'
  exit
end

flag = true

('a'..'z').each do |chr|
  count_s = s_chrs[chr]
  count_t = t_chrs[chr]
  next if count_s == count_t
  next if count_s >= 2 && count_s < count_t

  flag = false
  break
end

puts flag ? 'Yes' : 'No'
