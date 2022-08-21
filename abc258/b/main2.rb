N = gets.to_i

A = Array.new(N) { gets.chomp }

def rotate90(vec)
  [-vec[1], vec[0]]
end

max = '0'

N.times do |i|
  N.times do |j|
    vecs = [[1, 1], [1, 0]]

    4.times do
      vecs = vecs.map { |vec| rotate90(vec) }

      vecs.each do |vec|
        num = ''
        N.times do |n|
          move_i = i + (n + 1) * vec[0]
          move_j = j + (n + 1) * vec[1]
          num << A[move_i % N][move_j % N]
        end
        max = [max, num].max
      end
    end
  end
end

puts max
