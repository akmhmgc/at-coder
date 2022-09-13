require 'set'
N, M = gets.chomp.split.map(&:to_i)
S = Array.new(N) { gets.chomp }
T = Array.new(M) { gets.chomp }.to_set

if S.join.size > 16 or S.size == 1 && S[0].size < 3
  puts(-1)
  exit
end

# remainの計算方法
REMAIN_BAR_NUM = 16 - S.map(&:length).sum - (N - 1)

# s: 使用する文字の配列 ['choku', 'dai']
# remain: 遊びで使用可能な_の数
def bfs(s, remain)
  q = [[1, remain, s[0]]]

  while !q.empty? 
    cur, remain, ans = q.shift

    next if remain < 0

    if cur == N
      if !T.include?(ans) && 3 <= ans.length && ans.length <= 16
        puts ans
        exit
      end
      next
    end

    if ans[-1] != '_'
      query = [cur, remain, ans + '_']
      q << query
    else
      query1 = [cur, remain - 1, ans + '_']
      query2 = [cur + 1, remain, ans + s[cur]]
      q << query1
      q << query2
    end
  end 
end


S.permutation(N) do |strs|
  bfs(strs, REMAIN_BAR_NUM)
end

p(-1)
