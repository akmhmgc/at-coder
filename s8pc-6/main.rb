class Array
  def median
    midpoint = length / 2

    if length.even?
      sort[midpoint - 1, 2].sum / 2.0
    else
      sort[midpoint]
    end
  end
end

N = gets.to_i

AB = Array.new(N) { gets.chomp.split.map(&:to_i) }

A = AB.map { |ab| ab[0] }
B = AB.map { |ab| ab[1] }

a_median = A.median
b_median = B.median

distance = 0
AB.each do |ai, bi|
  distance += (ai - bi).abs
  distance += (a_median - ai).abs
  distance += (b_median - bi).abs
end

puts distance.to_i
