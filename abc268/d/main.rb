require 'set'
N, M = gets.chomp.split.map(&:to_i)
S = Array.new(N) { gets.chomp }
T = Array.new(M) { gets.chomp }.to_set

if N == 1
  puts T.include?(S[0]) ? (-1) : S
  exit
end 

# 再帰関数の作成
# cur: 何番目を使用しているか
# s: 使用する文字の配列 ['choku', 'dai']
# remain 使用可能な'_'の数
def dfs(cur, s, remain, ans)
  return if remain < 0

  if cur == s.length
    if ans.length >= 3 && !T.include?(ans)
      puts ans
      exit
    end
    return
  end

  if ans.size > 0 && ans[-1] != '_'
    # 必要な_を追加する分にはremainは減算しない
    dfs(cur, s, remain, ans + '_')
  else
    dfs(cur + 1, s, remain, ans + s[cur])
    # 二個目以上の_を追加する分にはremainを減産する
    dfs(cur, s, remain - 1, ans + '_') if ans.length > 0
  end
end

# remainの計算方法
remain = 16 - S.map(&:length).sum - (N - 1)

S.permutation(N) do |strs|
  dfs(0, strs, remain, '')
end

puts -1
