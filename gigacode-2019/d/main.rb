H, W, K, V = gets.chomp.split.map(&:to_i)

A = []
H.times do
  A << gets.chomp.split.map(&:to_i)
end

def cumsum_2d(arr)
  h = arr.length
  w = arr[0].length
  arr.unshift(Array.new(w, 0))
  arr.each { |line| line.unshift(0) }
  cumsum = Array.new(h + 1) { Array.new(w + 1, 0) }
  1.upto(h) do |i|
    cumsum[i][j] += arr[i][j] + cumsum[i - 1][j] + cumsum[i][j - 1] - cumsum[i - 1][j - 1]
  end

  1.upto(h) do |i|
    1.upto(w) do |j|
      cumsum[i][j] += arr[i][j] + cumsum[i - 1][j] + cumsum[i][j - 1] - cumsum[i - 1][j - 1]
    end
  end
  cumsum
end

cumsum = cumsum_2d(A)
area = 0

1.upto(W) do |w|
  1.upto(H) do |h|
    1.upto(W) do |j|
      1.upto(H) do |i|
        next if i + h > H + 1 || j + w > W + 1

        tochi = cumsum[i + h - 1][j + w - 1] - cumsum[i - 1][j + w - 1] - cumsum[i + h - 1][j - 1] + cumsum[i - 1][j - 1]
        kensetsu = w * h * K

        next if tochi + kensetsu > V

        area = [area, w * h].max
      end
    end
  end
end


puts area
