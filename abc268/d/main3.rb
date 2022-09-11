require 'set'
N, M = gets.chomp.split.map(&:to_i)
S = Array.new(N) { gets.chomp }
T = Array.new(M) { gets.chomp }.to_set

if S.join.size > 16 or S.size == 1 && S[0].size < 3
  p -1
  exit
end

# 再帰関数の作成
# cur: 何番目を使用しているか
# s: 使用する文字の配列 ['choku', 'dai']
# remain 使用可能な'_'の数
def dfs(cur, strs, remain, ans)
  if cur == strs.size
    if !T.include?(ans)
      puts ans
      exit
    end
    return
  end

  1.upto(remain) do |num|
    dfs(cur + 1,  strs, remain - num, ans + '_' * num + strs[cur])
  end
end

# remainの計算方法
MAX_BAR_NUM  = 16 - S.map(&:length).sum

S.permutation(N) do |strs|
  dfs(1, strs, MAX_BAR_NUM, strs[0])
end

p -1
