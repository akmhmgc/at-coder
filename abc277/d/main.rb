require 'set'

N,M = gets.chomp.split.map(&:to_i)

SUMS = Hash.new(0)
A = gets.chomp.split.map(&:to_i)
SET_A = Set.new(A)

@goukei = 0

A.each do |ai|
  SUMS[ai] += ai
  @goukei += ai
end

@go = Hash.new{|h,k|
  h[k] = Set.new
}

SET_A.each do |i|
  mod = i + 1 % M
  @go[i] << mod if SET_A.include?(mod)
end

@max = 0

def rec(v,gone,sums)
  return gone if gone.include?(v)

  gone << v
  sums += SUMS[v]

  @go[v].each do |v_next|
    rec(v_next, gone,sums)
  end
  @max = [@max, sums].max
end

@min = 10**20

SET_A.each do |i|
  gone = Set.new()
  rec(i, gone,0)
end

puts @goukei - @max
