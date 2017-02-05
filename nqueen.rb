class NQueen
attr_accessor :soluation, :queen

def initialize(n)
@queen = n
@soluation= Array.new(n) { Array.new(n, 0) }
end

def solve
		puts soluation.inspect
for i in (0..queen-1) do
	if placequeen(i)
		puts "found"
		puts soluation.inspect
		print_soluation
#		return
	end
end
end

def placequeen(i)
return true if(i == queen)
for j in (0..queen-1) do
	if canmove(j,i)
		soluation[j][i] = 1
		return true if placequeen(i+1)
		soluation[j][i] = 0
	end
end
return false
end

def canmove(i,j)
return true if !anyinRow(i) && !anyinlowerDigonale(i,j) && !anyinupperDigonale(i,j)
return false
end

def anyinRow(i)
	for j in (0..queen-1) do
		return true if soluation[i][j] != 0
	end
return false
end

def anyinCol(j)
	for i in (0..queen-1) do
		return true if soluation[i][j] != 0
	end
return false
end

def anyinlowerDigonale(i,j)
while(i<queen && j >= 0) do
	return true if soluation[i][j] != 0
	i = i+1
	j = j-1
end
return false;
end

def anyinupperDigonale(i,j)
while(i>=0 && j>=0) do
	return true if soluation[i][j] != 0
	i = i-1
	j = j-1
end
return false
end

def print_soluation
#puts soluation.inspect
m = queen-1
for i in (0..m) do
	str = ""
	(0..m).each{|j| str += "#{soluation[i][j]} ";}
	puts str
end
end


end

puts "n"
n = gets.to_i
q = NQueen.new(n)
q.solve
