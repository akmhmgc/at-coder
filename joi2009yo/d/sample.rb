G = [
  [1, 2],
  [0, 3, 4],
  [0, 3],
  [1, 2],
  [1]
]

def dfs(v, been, count)
  return if been[v] == true

  been[v] = true
  count += 1

  G[v].each do |v_next|
    dfs(v_next,been, count)
  end

  # 行った場所を戻す
  been[v] = false
  p v
end

@max = 0

been = Array.new(4, false)
dfs(0,been,0)

