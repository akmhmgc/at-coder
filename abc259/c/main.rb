S = gets.chomp
T = gets.chomp

s_couts = []
t_couts = []

s_order = []
t_order = []

S.chars do |chr|
  # 前と同じかどうか
  if s_order[-1] == chr
    s_couts[-1] += 1
  else
    s_order << chr
    s_couts << 1
  end
end

T.chars do |chr|
  # 前と同じかどうか
  if t_order[-1] == chr
    t_couts[-1] += 1
  else
    t_order << chr
    t_couts << 1
  end
end

if s_order != t_order
  puts 'No'
  exit
end

flag = true
s_couts.zip(t_couts).each do |count_s, count_t|
  next if count_s == count_t
  next if count_s >= 2 && count_s < count_t

  flag = false
  break
end

puts flag ? 'Yes' : 'No'
