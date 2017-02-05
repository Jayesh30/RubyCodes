puts "String 1: "
str1 = gets.strip
puts "String 2: "
str2= gets.strip

class LCS
attr_accessor :str1, :str2, :soluation, :size1, :size2

def initialize(str1, str2)
@str1 = str1
@str2 = str2
@size1 = str1.size
@size2 = str2.size
@soluation= Array.new(size1+1) { Array.new(size2+1, 0) }
end

def solve
for i in (0..size1) do
for j in (0..size2) do
if i == 0 || j == 0
	soluation[i][j] = 0
elsif str1[i-1] == str2[j-1]
	soluation[i][j] = 1+soluation[i-1][j-1]
else
soluation[i][j] = [soluation[i-1][j], soluation[i][j-1]].max
end
end
end
end

def print_soluation
#puts soluation.inspect
n = size1
m = size2
for i in (0..n) do
	str = ""
	(0..m).each{|j| str += "#{soluation[i][j]} ";}
	puts str
end
end

end

lcs = LCS.new(str1,str2)
lcs.solve
lcs.print_soluation
