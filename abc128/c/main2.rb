N , M = gets.chomp.split.map(&:to_i)

S = Array.new(M){gets.chomp.split.map(&:to_i)[1..-1]}
P = gets.chomp.split.map(&:to_i)

count = 0

(2**N).times do |i|
  flag = true

  # スイッチの組み合わせ
  si = i.to_s(2).rjust(N, '0').split('').map(&:to_i)
  
  S.zip(P).each do |s, p|
    # オンになっているスイッチの個数
    amari = s.inject(0){|res ,item| res + si[item - 1]} % 2
    flag = false if amari != p
  end
  count += 1 if flag
end

puts count

