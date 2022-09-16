# N, L, R = gets.chomp.split.map(&:to_i)
N = 2
L = 1
R = 3

def dfs(n, l, r)
  return [] if l > r
  return [[]] if n == 0

  ans = []
  dfs(n - 1, l, r).each do |arr|
    arr.unshift(l)
    ans << arr
  end

  ans
end

puts dfs(N, L, R)
