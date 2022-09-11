require 'set'
N, M = gets.split.map(&:to_i)
S = N.times.map { gets.chomp }
T = M.times.map { gets.chomp }.to_set

if S.join.size > 16 or S.size == 1 && S[0].size < 3
  p -1
  exit
end

MAX_BAR_NUM = 16 - S.map(&:size).sum

def dfs(current, chunks, index, left_bar_num)
  if index == chunks.size
    # 終わり
    if !T.include?(current)
      puts current
      exit
    end
    return
  end

  1.upto(left_bar_num) do |num|
    dfs(current + "_" * num + chunks[index], chunks, index + 1, left_bar_num - num)
  end
end

S.permutation(S.size) do |strs|
  dfs(strs[0], strs, 1, MAX_BAR_NUM)
end
p -1
