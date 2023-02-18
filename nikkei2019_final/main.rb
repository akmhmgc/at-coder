N = gets.to_i
A = gets.chomp.split.map(&:to_i)

class CumulativeSum_1D
  def initialize(d)
    length = d.length
    d.unshift(0)
    cumsum = Array.new(length + 1, 0)
    1.upto(length) { |i| cumsum[i] += cumsum[i - 1] + d[i] }
    @d = cumsum
  end
  def calc(x, a)
    @d[x] - @d[a-1]
  end
end


cumsum = CumulativeSum_1D.new(A)

1.upto(N) do |k|
  max = 0
  k.upto(N) do |i|
    max = [max, cumsum.calc(i,i - k + 1)].max
  end
  puts max
end
