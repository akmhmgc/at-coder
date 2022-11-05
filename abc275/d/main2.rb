# N = gets.to_i
N = 10**18


@count = 0
@hash = {}

def rec(v)
  @count += 1
  return @hash[v] unless @hash[v].nil?

  return 1 if v == 0

  ans = rec(v / 2) + rec(v / 3)
  @hash[v] = ans
  ans
end

rec(N)

p @count > 10**6
