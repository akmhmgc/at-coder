N, L, R = gets.chomp.split.map(&:to_i)

def dfs(n, l, r)
  return 1 if n == 0
  return 0 if l > r

  dfs(n - 1, l + 1, r) + dfs(n, l + 1, r)
end

