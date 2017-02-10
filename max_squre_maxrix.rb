def max_maxtrix(m)
return 0 if m.nil? || m.size == 0
s = Array.new(m.size){Array.new(m[0].size){0}}

for i in (0..m.size-1) do
for j in (0..m[i].size-1) do
if i == 0 || j == 0 || m[i][j] == 0
s[i][j] = m[i][j]
else
s[i][j] = [s[i-1][j], s[i][j-1], s[i-1][j-1]].min + 1
end
end
end
maxm = 0
for i in (0..m.size-1) do
maxm = [maxm, s[i].max].max
	str = ""
	(0..m[i].size-1).each{|j| str += "#{s[i][j]} ";}
	puts str
end

puts "Max Size Matrix #{maxm}"

end

m = []
m << [0, 1, 0, 1, 0, 1]
m << [1, 0, 1, 0, 1, 0]
m << [0, 1, 1, 1, 1, 0]
m << [0, 0, 1, 1, 1, 0]
m << [1, 1, 1, 1, 1, 1]

max_maxtrix(m)
