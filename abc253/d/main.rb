n, a, b = gets.chomp.split.map(&:to_i)

# 1 - nの合計
total = n * (n + 1) / 2

# 1 - nでaで割れる数の合計
num_a = n / a
total_a = a * (1 + num_a) * num_a / 2

# 1- n でbで割れる数の合計
num_b = n / b
total_b = b * (1 + num_b) * num_b / 2

# 1 - n でaとbの最小公倍数で割れる数の合計
lcm = a.lcm(b)
num_lcm = n / lcm
total_lcm = lcm * (1 + num_lcm) * num_lcm / 2

puts total - total_a - total_b + total_lcm
