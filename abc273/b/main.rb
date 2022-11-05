X,K = gets.chomp.split.map(&:to_i)

val = X
1.upto(K) do |i|
  str = val.to_s.rjust(20, '0')
  j = i * (-1)
  hyouka =  str[j].to_i
  num = str[j..-1].to_i

  val -= num

  val += 10**i if hyouka >= 5
end

puts val
