X, Y = gets.chomp.split.map(&:to_i)
MOD = 10**9 + 7

count = [0, 0]

0.upto(10**6) do |i|
  m_x, m_y = [1, 2].map { |n| n * i }
  r_x, r_y = [[X, Y], [m_x, m_y]].transpose.map { |arr| arr[0] - arr[1] }

  next if r_x < 0 || r_y < 0

  j, m = r_x.divmod(2)
  count = [i, j] if m == 0 && j == r_y
end

if count == [0, 0]
  puts 0
  exit
end

x, y = count

a = 1.upto(x + y).reduce(1) { |r, i| r * i % MOD } % MOD
b = 1.upto(x).reduce(1) { |r, i| r * i % MOD } % MOD
c = 1.upto(y).reduce(1) { |r, i| r * i % MOD } % MOD
bc = b * c % MOD

puts a * bc.pow(MOD - 2, MOD) % MOD
