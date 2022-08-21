n = gets.to_s.to_i

# 値=>個数を管理する
s = {}
maxes = Array.new(2, 0)
mins = Array.new(2, 10**10)

output = []

n.times do
   q, x, c = gets.chomp.split.map(&:to_i)
   case q
   when 1
    # 新しく数値が加わった時max minを更新
    if s[x]
      s[x] += 1
    else
      s[x] = 1

      # 最大最小の更新
      max = [max, x].max
      min = [min, x].min
    end
   when 2
    next unless s[x]

    s[x] -= [s[x], c].min

    if s[x].zero?
      ks =  s.select { |_k, v| v.positive? }.keys
      max = ks.max
      min = ks.min
    end
   when 3
    output << max - min
   end
end

puts output
