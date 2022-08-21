h = Hash.new { |hash, key| hash[key] = [] }
h[:key1] << 1
h[:key1] << 2
h[:key2] << 2
puts h
