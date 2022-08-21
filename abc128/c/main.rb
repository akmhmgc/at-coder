n, m = gets.chomp.split.map(&:to_i)

# 繋がっているスイッチ
s_arr = []

m.times do
  k, *s = gets.chomp.split.map(&:to_i)
  sum = 0
  s.each { |s| sum += (1 << s - 1) }
  s_arr << sum
end

p_arr = gets.chomp.split.map(&:to_i)

val = 0

p s_arr

(1 << n).times do |light|
  all_on = true
  m.times do |idx|
    s = s_arr[idx]

    count = (s & light).to_s(2).count('1')
    all_on = false unless count % 2 == p_arr[idx]
  end
  val += 1 if all_on
end

puts val
