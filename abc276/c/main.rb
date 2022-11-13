class BIT
  def initialize(n)
    @n = n
    @dat = Array.new(@n, 0)
  end

  def sum(i)
    s = 0
    while i >= 0
      s += @dat[i]
      i = (i & (i + 1)) - 1
    end
    s
  end

  def add(i, x)
    while i < @n
      @dat[i] += x
      i |= i + 1
    end
  end

  def lower_bound(x)
    ret = -1
    k = 1
    k <<= 1 while 2 * k <= @n
    while k > 0
      if ret + k < @n && @dat[ret + k] < x
        x -= @dat[ret + k]
        ret += k
      end
      k >>= 1
    end
    ret + 1
  end
end

N = gets.to_i
A = gets.split.map(&:to_i)
bit = BIT.new(N + 1)
(1..N).each do |i|
  bit.add(i, 1)
end

num = []
A.each do |a|
  num.unshift(bit.sum(a - 1))
  bit.add(a, -1)
end
ans = 1

fac = 1
N.times do |i|
  fac = fac * i if i > 0
  ans = (ans + fac * num[i])
end

div = ans - 2

arr = []
1.upto(N) do |i|
  div,mod = div.divmod(i)
  arr.unshift(mod)
end

nums = (1..N).to_a

answer = []

arr.each do |i|
  answer << nums.slice!(i)
end

puts answer * ' '

