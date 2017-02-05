puts "Array:"
a = gets.strip.split(',').map(&:to_i)

def power_set(a, i)
h = []
if a.size == i
h << []
else
h = power_set(a, i+1)
ms = []
x =a[i]
h.each do |s|
ms << s + [x]
end
h = h + ms
end
return h
end

h = power_set(a,0)
puts h.size
h.each{|x| puts "#{x}\n"}
