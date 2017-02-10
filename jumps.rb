puts "Array:"
a = gets.strip.split(',').map(&:to_i)
INF = 10000000

def jumps1(a)
return if a.nil? || a.size == 0
n = a.size
jumps = []
jumps[0] = 0
(1..n-1).each{|i| jumps[i] = INF}
(0..n-1).each do |i|
	(1..a[i]).each do |j|
		if(i+j < n && jumps[i+j] > jumps[i]+1)
			jumps[i+j] = jumps[i]+1
		end
		return jumps[i]+1 if i+j >= n
	end
puts jumps.join('-')
end
jumps[n-1]
end

puts jumps1(a)

