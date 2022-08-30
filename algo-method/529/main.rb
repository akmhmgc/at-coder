N = gets.to_i
P = gets.chomp.split.map(&:to_i).unshift(0)

chs = Array.new(N) { [] }

1.upto(N - 1) do |i|
  chs[P[i]] << i
end

@arr = Array.new(N, 0)

def rec(v, chs)
  @arr[v] += chs[v].count

  chs[v].map { |ch| rec(ch, chs) }
end

rec(0, chs)

puts @arr
