N, M = gets.chomp.split.map(&:to_i)
G = Array.new(N) { [] }

M.times do
  a, b = gets.chomp.split.map(&:to_i)
  G[a] << b
end


def rec(v, been, finished)
  been[v] = true
  G[v].each do |v2|
    if been[v2] == true
      if finished[v2] == false
        # 行きがけに通ったが帰りがけには通ってない = サイクルである
        puts 'Yes'
        exit
      else
        next
      end
    end
    rec(v2, been, finished)
  end
  finished[v] = true
end


been = Array.new(N, false)
finished = Array.new(N, false)


0.upto(N-1) do |v|
  next if been[v] == true
  rec(v, been, finished)
end

puts 'No'
