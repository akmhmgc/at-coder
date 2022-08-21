N = gets.to_i
S = gets.chomp.split('').map(&:to_i)

count = 0

1000.times do |i|
  nums = i.to_s.rjust(3, '0').split('').map(&:to_i)

  j = 0
  S.each do |s|
    j += 1 if s == nums[j]
    if j == 3
      count += 1
      break
    end
  end
end

puts count
