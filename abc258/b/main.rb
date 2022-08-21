N = gets.to_i

A = Array.new(N) { gets.chomp.split('').map(&:to_i) }

max = 0

N.times do |i|
  N.times do |j|
    m = []

    patern = [-1, 0 ,1]
    patern.each do |p_i|
      patern.each do |p_j|
        next if p_i.zero? && p_j.zero?

        arr = [A[i][j]]

        (N - 1).times do |k|
          move_i = i + (k + 1)*p_i
          move_j = j + (k + 1)*p_j
          arr << A[move_i % N][move_j % N]
         end
         m << arr.join.to_i
      end
    end
    max = [m.max, max].max
  end
end

puts max
