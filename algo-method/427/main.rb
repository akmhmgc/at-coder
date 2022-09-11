N, X = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

def dfs(i, j)
  if i == 0
    return true if j == 0

    return false
  end
  flag = false
  flag = true if j >= A[i - 1] && dfs(i - 1, j - A[i - 1])
  flag = true if dfs(i - 1, j)
  flag
end


puts dfs(N,X) ? 'Yes' : 'No'
