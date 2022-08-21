while (n, x = gets.chomp.split.map(&:to_i)) != [0, 0]
  count = 0
  i = 1
  while i <= n
    j = i + 1
    while j <= n
      k = j + 1
      while k <= n
        count += 1 if (i + k + j) == x
        k += 1
      end
      j += 1
    end
    i += 1
  end
  puts count
end
