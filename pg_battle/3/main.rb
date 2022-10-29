N = gets.to_i
A = gets.chomp.split.map(&:to_i)

seq = []

count = 0
(N - 1).downto(0) do |i|
  ai = A[i]
  count += ai
  seq.unshift(ai)
  if ai == 1
    1.upto(N) do |j|
      break unless seq.first == j

      count -=  seq.shift
    end
  end
end

puts count

