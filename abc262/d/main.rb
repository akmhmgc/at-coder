class Integer
  def combination(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(:*) / k.factorial
  end

  def permutation(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(:*)
  end

  def factorial
    return 1 if self.zero?

    (1..self).inject(:*)
  end
end


N = gets.to_i
A = gets.chomp.split.map(&:to_i)

amaris = Array.new(N){[]}


A.each_with_index do |ai, idx|
  1.upto(N).each do |n|
    amaris[idx] << ai % n
  end
end

all = 0

amaris.transpose.each_with_index do |i, idx|
  # 選ぶ個数
  count = idx + 1
  ams = Array.new(idx + 1, 0)
  i.each do |amari|
    ams[amari] += 1
  end

  ams.each do |a|
    all += a.combination(count)
  end

  all += ams.inject(1){|res, item| res * item } if count == N
end

puts all % 998244353
