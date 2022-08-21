n = gets.to_i

coms = [*1..n].permutation(n)

a = Array.new(n) { gets.chomp.split.map(&:to_i) }

m = gets.to_i

kenaku = Array.new(n) { Array.new(n, false) }

m.times do
  x, y = gets.chomp.split.map { |i| i = i.to_i - 1 }
  kenaku[x][y] = kenaku[y][x] = true
end

mins = [100_000]

coms.each do |com|
  ok = true
  i = 0
  while i < n - 1
    ai = com[i]
    aj = com[i + 1]
    if kenaku[ai - 1][aj - 1]
      ok = false
      break
    end

    i += 1
  end

  next unless ok

  count = 0
  com.each_with_index do |i, idx|
    count += a[i - 1][idx]
  end
  mins << count
end

min = mins.min
puts min == 100_000 ? -1 : min
