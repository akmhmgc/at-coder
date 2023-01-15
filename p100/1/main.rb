def count(n, x)
  count = 0
  1.upto(n) do |i|
    (i + 1).upto(n) do |j|
      (j + 1).upto(n) do |k|
        count += 1 if i + j + k == x
      end
    end
  end
  count
end

while true
  n,x = gets.chomp.split.map(&:to_i)
  break if n == 0 && x == 0

  puts count(n,x)
end
