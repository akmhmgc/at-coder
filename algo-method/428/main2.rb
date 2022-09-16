# n個の球をm個に分ける方法の組み合わせ

def dfs(n, m)
  return [Array.new(m, 0)] if n == 0
  return [[n]] if m == 1

  ans = []
  dfs(n, m - 1).each do |res|
    res.unshift(0)
    ans << res
  end
  dfs(n - 1, m).each do |res|
    res[0] += 1
    ans << res
  end
  ans
end

p dfs(3, 2) #=>[[0, 3], [1, 2], [2, 1], [3, 0]]
