require 'set'
N = gets.to_i
A = gets.chomp.split.map(&:to_i)
M = gets.to_i
B = gets.chomp.split.map(&:to_i).to_set
X = gets.to_i

dp = Array.new(X + 1, false)
dp[0] = true

1.upto(X) do |i| 
  A.each do |ai|
    dp[i] ||= dp[i - ai] if i - ai >= 0 && !B.include?(i - ai)
  end
end

puts dp[X] ? 'Yes' : 'No'
