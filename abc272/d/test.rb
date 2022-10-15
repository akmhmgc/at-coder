G = [
  [1, 2],
  [2],
  []
]

# 何手で到達できたか
dist = Array.new(3, -1)

# 最初の頂点
queue = [0]
dist[0] = 0

# キューが空になるまで前から取り出す
count = 0
while (v = queue.shift) != nil
  count += 1

  G[v].each do |v_next|
    # 既に頂点に到達していたらスキップ
    next if dist[v_next] != -1

    # 親の頂点に到達した手 + 1
    dist[v_next] = dist[v] + 1
    # キューの後ろに追加
    queue << v_next

  end
  p queue
end

p count

