n,k = gets.chomp.split.map(&:to_i)

as = gets.chomp.split.map(&:to_i)

people = []

n.times do
  people << gets.chomp.split.map(&:to_i)
end

p people
