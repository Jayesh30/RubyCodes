puts 'array:'
a = gets.strip.split(',').map(&:to_i)

def max_sum(a)
return 0 if a.nil?
csum = a[0]
msum = a[0]
for x in (1..a.size-1) do 
csum  = [a[x], csum+ a[x]].max
msum = [msum,csum].max
end
msum
end

puts max_sum(a)
