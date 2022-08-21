N, K = gets.chomp.split.map(&:to_i)
P = gets.chomp.split.map(&:to_i)

lost = {}

cards = []

P.each_with_index do |p, idx|
  if K == 1
    lost[p] = idx + 1
    next
  end

  if idx == 0
    cards << [p]
    next
  end

  index = cards.bsearch_index { |arr| arr.last >= p }
  if index.nil?
    cards << [p]
  else
    cards[index] << p
    if cards[index].length == K
      cards[index].each {|card| lost[card] = idx + 1 }
      cards.delete_at(index)
    end
  end
end

1.upto(N) do |p|
  puts lost[p] || -1
end
