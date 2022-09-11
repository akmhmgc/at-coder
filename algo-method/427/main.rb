N, X = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

# rubyではメソッド内の変数の空間が異なるのでインスタンス変数(or グローバル変数)に格納しておく必要がある
@memos = Array.new(100) { Array.new(10000, 0) }
@memos.unshift(Array.new(10, false))
@memos[0][0] = true

def dfs(i, j)
  return @memos[i][j] if @memos[i][j] != 0

  flag = false
  flag = true if j >= A[i - 1] && dfs(i - 1, j - A[i - 1])
  flag = true if dfs(i - 1, j)
  @memos[i][j] = flag
end

puts dfs(N, X) ? 'Yes' : 'No'
