puts 'array :'
a = gets.strip.split(',').map(&:to_i)

def lis(a)
l = []
a.size.times{|x| l[x] = 1}
(1..a.size-1).to_a.each do |i|
(0..i).to_a.each do |j|
if(a[i]>a[j] && l[i] < 1+l[j])
l[i] = 1+l[j]
end
end
end
puts a.join('-')
puts l.join('-')
l.max
end
puts lis(a)

$m = 1
def rlis(a,n)
return 1 if n<=1
cl = 1
(0..n-2).to_a.each do |i|
sl = rlis(a,i)
if a[i] < a[n-1] && cl < 1+sl
cl = 1+sl
end
end
$m = [$m,cl].max
cl
end

#rlis(a,a.size)

puts $m
