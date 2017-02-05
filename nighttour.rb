class NightTour
attr_accessor :soluation, :size

def initialize(n=8)
@size = n
@soluation= Array.new(size) { Array.new(size, 0) }
end

def solve
if maketour(0,0,1)
	puts "solve"
	print_soluation
	return
else
	puts "not solve"
end
end

def maketour(x,y,l)
#j = gets if l >= 64
if canmove(x,y)
puts "#{x}-#{y} - #{l}"
	return true if l == (size*size)
	soluation[x][y] = l
	l = l+1
	return true if maketour(x+2,y+1,l)
	return true if maketour(x+1,y+2,l)
	return true if maketour(x-1,y+2,l)	
	return true if maketour(x-2,y+1,l)
	return true if maketour(x-2,y-1,l)
	return true if maketour(x-1,y-2,l)
	return true if maketour(x+1,y-2,l)
	return true if maketour(x+2,y-1,l)
	l = l-1
	soluation[x][y] = 0
	return false
end
return false
end

def canmove(x,y)
return true if (x>=0 && x<size && y>=0 && y<size && soluation[x][y] == 0)
return false
end

def print_soluation
#puts soluation.inspect
m = size-1
for i in (0..m) do
	str = ""
	(0..m).each{|j| str += "#{soluation[i][j]} ";}
	puts str
end
end


end

n = NightTour.new(8)
n.solve
