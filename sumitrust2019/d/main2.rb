N = gets.to_i
S = gets.chomp.split('')

# 000 - 999があるかどうか判定すればOK
count = 0
0.upto(9) do |i|
  0.upto(9) do |j|
    0.upto(9) do |k|
      l = 0
      li = [i, j, k].map(&:to_s)
      S.each do |s|
        l += 1 if s == li[l]
        if l == 3
          count += 1
          break
        end
      end
    end
  end
end

puts count
