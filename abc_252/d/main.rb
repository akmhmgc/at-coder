n = gets.chomp.to_i

seq = gets.chomp.split.map(&:to_i)
com_1 = seq.group_by { |i| i }.values.map(&:length).unshift(0)
len = com_1.length

com_2 = [0]
total_1 = [0]
total_2 = [0]
com_3 = []

i = 1

while i < len
  # 1個累計
  t1 = com_1[i] + total_1[i - 1]
  total_1 << t1

  # 2個組み合わせ
  c2 = total_1[i - 1] * com_1[i]
  com_2 << c2

  # 2個累計
  total_2 << total_2[i - 1] + c2

  # 3個組み合わせ
  c3 = total_2[i - 1] * com_1[i]
  com_3 << c3
  i += 1
end

puts com_3.sum
