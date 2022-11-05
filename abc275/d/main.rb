N = gets.to_i


@hash = {}

def rec(v)
  return @hash[v] unless @hash[v].nil?

  return 1 if v == 0

  ans = rec(v / 2) + rec(v / 3)
  @hash[v] = ans
  ans
end

puts rec(N)
