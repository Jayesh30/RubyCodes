puts "Rod Length: "
n = gets.to_i
p = []
puts "Price for each length :"
#n.times{ p << gets.to_i}
p = [1,5,8,9,10,17,17,20,24,30]
p = [2,3,7,8,9]
def max_revenue(p,n)
return 0 if p.empty? || n == 0
t = Array.new(n+1){0}
t[0] = 0
for i in (1..n) do 
for j in (0..i-1) do
t[i] = [ t[i], p[j] + t[i-j-1] ].max
end
end
puts t.join('-')
t.last
end

puts max_revenue(p,n)
