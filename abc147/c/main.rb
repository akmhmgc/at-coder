n = gets.chomp.to_i

max = 0

arr = []

n.times do
  ai = gets.to_i
  arr1 = []
  ai.times do
    arr1 << gets.chomp.split.map(&:to_i)
  end
  arr << arr1
end


(1 << n).times do |i|
  # 矛盾が出た瞬間にアウト
  # 出なければ正直者の最大人数を更新
  flag = true

  # 今の組み合わせ
  combi = format("%0#{n}d", i.to_s(2))

  n.times do |j|
    # 不親切な人の意見は無視
    next if combi[j].to_i.zero?

    arr[j].each do |xy|
      # x番目の人がyであると言っている
      x,y = xy
      flag = false unless (combi[x - 1].to_i ^ y).zero?
    end
  end

  max = [max, combi.count('1')].max if flag
end

puts max
