N = 8
G = [
  [1, 4, 5],
  [2, 3],
  [],
  [],
  [],
  [6, 7],
  [],
  []
]

@seen = Array.new(N, false)

# 行きがけ順
@go = []
# 帰りがけ順
@back = []

def rec(v)
  @seen[v] = true
  @go << v

  G[v].each do |next_v|
    next if @seen[next_v] == true

    rec(next_v)
  end

  # グラフの葉の場合は深く潜らずにここまでくる= 帰りがけ順
  @back << v
end

rec(0)

p @go
p @back
