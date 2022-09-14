L,R = gets.chomp.split.map(&:to_i)

def dfs(n, l, r)
  return [] if l > r
  return [''] if n == 0

  ans = []
  # lは何回でも選んでいいのでdfs(n - 1, l+1, r)ではない
  dfs(n - 1, l, r).map { |str| ans << "#{l}#{str}" }
  dfs(n, l + 1, r).map { |str| ans << str }

  ans
end

ans = 0
dfs(10, 0, 9).each do |i|
  num = i.to_i
  next if num < L || num > R

  ans += num
end

puts ans
