puts "Strng : "
str = gets.strip

def substr(str)
h = Array.new(256){0}
i=0
j=0
m = 0
n = str.size
while(i<n && j<n) do
if h[str[j]] == 0
h[str[j]] = 1
j = j+1
m = [m, j-i].max
else
h[str[i]] = 0
i = i+1
end
end
 m
end

def substr_withindex(str)
h = Array.new(256){-1}
i=0
j=0
m = 0
n = str.size
while(i<n && j<n) do
if h[str[j]] != -1
ci = h[str[j]]
i = [i,ci].max 
end
m = [m, j-i+1].max
h[str[j]] = j+1
j = j+1
end
#puts str[i..j]
 m
end

puts substr(str)
puts substr_withindex(str)
