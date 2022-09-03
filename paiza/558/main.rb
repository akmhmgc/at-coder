N = gets.to_i
AB = Array.new(N) { gets.chomp.split.map(&:to_i) }
AB.sort_by! { |ab| ab[0] }

tops = Array.new(2){[]}
tops[0] = AB[0]

def length(arr)
  arr[1] - arr[0]
end


1.upto(N-1) do |i|
  ab = AB[i]
  if tops[1].empty?
    target = tops[0]
    # つなげる
    if target[1] + 1 >= ab[0]
      tops[0] = [target[0], [target[1] , ab[1]].max]
    else
      tops[1] = ab
    end
  else
    target = tops[1]
    # つなげる
    if target[1] + 1 >= ab[0]
      tops[1] = [target[0], [target[1] , ab[1]].max]

      # 長さの比較
      if length(tops[1]) >= length(tops[0])
        tops[0] = tops[1]
        tops[1] = []
      end
    else
      tops[1] = ab
    end
  end
end

if tops[1].empty?
  puts tops[0][1] - tops[0][0] + 1
else
  puts tops.map{|s,e| e - s + 1}.max 
end


