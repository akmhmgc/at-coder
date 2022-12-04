require 'prime'

K = gets.to_i

factors = Prime.prime_division(K)

def keisan(num, count)
  val = 0
  ans = 0
  1.upto(10**5) do |i|
    val += 1
    val += Prime.prime_division(i).to_h[num] || 0
    ans = i
    break if val >= count
  end
  ans
end


ans = -1
factors.each do |num, count|
  ans = [ans, num * keisan(num,count)].max
end

puts ans

