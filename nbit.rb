puts "n :"
n = gets.to_i
#b = [0,1]
s = []
def nbit_permutation(s,i,l)
if i == l
	puts s.inspect
	return
else
[0,1].each do |x|
	s << x
	nbit_permutation(s,i+1,l)
	s.pop
end	
end
end

nbit_permutation(s,0,n)
