S = Array.new(10){gets.chomp.split('')}

0.upto(9) do |i|
  line = S[i]
  next if line.count('.') == 10

  first = 0
  last = 0
  A = i + 1

  0.upto(9) do |j|
    next if line[j] == '.'

    first = j
    break
  end

  9.downto(0) do |j|
    next if line[j] == '.'
  
    last = j
    break
  end

  C = first + 1
  D = last + 1
  
  break
end

arr2 = []

9.downto(0) do |i|
  line = S[i]
  next if line.count('.') == 10

  B = i + 1
  break
end



puts "#{A} #{B}"
puts "#{C} #{D}"
