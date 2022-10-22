N = gets.to_i
A = gets.chomp.split.map(&:to_i)

hash = {}

A.each_with_index do |ai, idx|
  hash[ai] = idx + 1
end

A.sort!

ans =[]

N.upto(2*N - 1) do |i|
  ans << hash[A[i]]  
end

ans.sort.each do |i|
  puts i
end

