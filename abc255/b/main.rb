n, k = gets.chomp.split.map(&:to_i)

as = gets.chomp.split.map(&:to_i)

people = []

n.times do
  people << gets.chomp.split.map(&:to_i)
end

lights = as.map { |a| people[a - 1] }

min_dis = 0

def distance(a, b)
  (a[0] - b[0])**2 + (a[1] - b[1])**2
end

people.each do |ppl|
  # pとライトを持っているものの最小距離
  dis = lights.map { |light| distance(light, ppl) }.min
  min_dis = [min_dis, dis].max
end

puts format('%.5f', Math.sqrt(min_dis))
