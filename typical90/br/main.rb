class Array
  def median
    midpoint = length / 2
    sorted = sort
    if length.even?
      sorted[midpoint - 1, 2].sum / 2.0
    else
      sorted[midpoint]
    end
  end
end

N = gets.to_i

X = []
Y = []

N.times do
  x, y = gets.chomp.split.map(&:to_i)
  X << x
  Y << y
end

x_median = X.median
y_median = Y.median

sum = 0

X.each do |x|
  sum += (x - x_median).abs
end
Y.each do |y|
  sum += (y - y_median).abs
end

puts sum.to_i
