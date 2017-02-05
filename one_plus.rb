puts 'array:'
a = gets.strip.split(',').map(&:to_i)

def one_plus(a)
return [] if a.nil?
i = 0
while( a[i] == 0)
i = i+1
end
a = a[i..a.size-1]
if a[0] != 0
i = a.size
while(i>0) do
	a[i] = a[i-1];
	i = i-1
end
a[i]=0
end
n = a.size
	while(n > 0) do
		if a[n-1] == 9
		a[n-1] = 0
		n = n-1
		else
		break
		end
	end
#puts n
a[n-1] = a[n-1]+1
#puts a.size
if a[0] == 0 
return a[1..a.size]
else
return a
end
a 
end
puts one_plus(a)
