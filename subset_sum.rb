puts "array :"
a = gets.strip.split(',').map(&:to_i)
puts "sum :"
ts = k = gets.strip.to_i
puts "========"

def subset_sum(a,n,k)
return true if k == 0
return false if n==0 && k!=0
return subset_sum(a,n-1,k)||subset_sum(a,n-1,k-a[n]) 
end
#puts subset_sum(a,a.size-1,k);

s = []
def all_subset_sum(a,i,n,s,csum,ts)
puts s.join(' + ') if csum == ts
if(i <= n)
for j in (i..n) do
	if(csum + a[j] <= ts)
		s << a[j]
		csum += a[j]
		all_subset_sum(a,j+1,n,s,csum,ts)
		csum -= s.pop
	end
end
end
end

all_subset_sum(a,0,a.size-1,s,0,ts)

def possible_subset(n,s)
if n == 0
	puts s.join(' + ') 
	return
end
for i in (1..n) do
	s << i
	possible_subset(n-i,s)
	s.pop
end
end
s = []
possible_subset(ts,s)

puts "========================="

def n_length_set_repete(a,n,s)
if n == 0
	puts s.join(' + ') 
	return
end
for i in (0..a.size-1) do
	s << a[i]
	n_length_set_repete(a,n-1,s)
	s.pop
end
end

s = []
#n_length_set_repete(a,ts,s)


puts "========================="

def n_length_set(a,j,n,s)
if n == 0
	puts s.join(' + ') 
	return
end
for i in (j..a.size-1) do
	s << a[i]
	n_length_set(a,i+1,n-1,s)
	s.pop
end
end

s = []
n_length_set(a,0,ts,s)

