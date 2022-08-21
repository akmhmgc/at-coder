n = gets.to_i

a, b, c = gets.chomp.split.map(&:to_i)

min = 10_000

i = 0
while i <= 10000
  j = 0
  while j <= (10000 - i)
    v = a * i + b * j

    if !((n - v) % c).zero?
      j += 1
      next
    end

    k = v / c
    min = [min, i + j + k].min
    j += 1
  end
  i += 1
end


puts min
