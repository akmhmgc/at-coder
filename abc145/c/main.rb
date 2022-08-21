N = gets.to_i

XY = Array.new(N){ gets.chomp.split.map(&:to_i)}

total = 0
combinatons = 0
(0..(N-1)).to_a.permutation(N).each do |com|
  (N - 1).times do |i|
    j = com[i]
    k = com[i + 1]
    total += ((XY[k][0] - XY[j][0])**2 + (XY[k][1] - XY[j][1])**2).pow(0.5)
  end
  combinatons += 1
end


puts total / combinatons
