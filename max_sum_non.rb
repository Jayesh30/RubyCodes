
# Enter your code here. Read input from STDIN. Print output to STDOUT
def max_sum(a)
m = a[0]
c = a[0]

for i in (1..a.size-1) do 
c = [a[i],c+a[i]].max
m = [m,c].max
end

m1 = Array.new(a.size){0}
m1[0] = a[0]
for i in (1..a.size-1) do 
m1[i] = [m1[i-1],m1[i-1]+a[i]].max
end
"#{m} #{m1[a.size-1]}"
end


n = gets.to_i
a = Array.new(n){Array.new}
for i in (0..n-1) do
    k = gets.to_i
    a[i] = gets.split(" ").map(&:to_i)
    max_sun(a[i])
end





