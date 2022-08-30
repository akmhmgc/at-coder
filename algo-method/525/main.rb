N = gets.to_i
P = gets.chomp.split.map(&:to_i).unshift(0)

chs = Array.new(N){[]}

1.upto(N-1) do |i|
    chs[P[i]] << i
end

def rec(v, chs)
  print "#{v} "

  chs[v].map { |ch| rec(ch, chs) }
end

rec(0, chs)
