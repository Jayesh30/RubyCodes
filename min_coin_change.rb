puts "Coin Array:"
a = gets.strip.split(',').map(&:to_i)

puts "N:"
n = gets.to_i

def rec_coin_change(a,m,n)
return 1 if n == 0
return 0 if n<0
return 0 if m<=0 && n>0
return [rec_coin_change(a,m-1,n),rec_coin_change(a,m,n-a[m-1])].min
end

puts rec_coin_change(a,a.size,n)

def coin_change(a,n)
return 0 if a.nil?
return 1 if n==0
t = []
m = a.size
(n+1).times{t << 0}
t[0] = 1
puts t.join('-')
(0..m-1).each do |i|
	(a[i]..n).each do |j|
		t[j] += t[j-a[i]]
	end
puts t.join('-')
end
t[n]
end

puts coin_change(a,n)



def min_coin_change(a,n)
return 0 if a.nil?
return 1 if n == 0
t = Array.new(n+1){100000}
t[0] = 0
for i in 0..a.size-1 do
 for j in a[i]..n do
	t[j] = [t[j], 1+t[j-a[i]] ].min
end
end
puts t.join('-')
t[n]
end

puts min_coin_change(a,n)
