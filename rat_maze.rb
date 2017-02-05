class RatInMaze
attr_accessor :maze, :soluation, :size

def initialize(m)
@size = m.size
@maze = m.clone
@soluation= Array.new(size) { Array.new(size, 0) }
end

def solve
	if(maze_solve(0,0,'down'))
		puts "Soluation: is"
		print_soluation
	else
		puts "No Soluation"
	end
end

def maze_solve(x,y,direction)
if (x == size-1 && y == size-1)
	soluation[x][y] = 1
	return true
end
if canmove(x,y)
#puts "set - 1 to #{x}-#{y}"
		soluation[x][y] = 1
#		puts "soluation[#{x}][#{y}] - #{soluation[x][y]}"
		if(direction != 'up' && maze_solve(x+1,y,'down'))
			return true
		end
		if(direction != 'left' && maze_solve(x,y+1,'right'))
			return true
		end
		if(direction != 'down' && maze_solve(x-1,y,'up'))
			return true
		end 
		if(direction != 'right' && maze_solve(x,y-1,'left'))
			return true
		end
puts "set 0 to #{x}-#{y}"
		soluation[x][y] = 0
#		puts "soluation[#{x}][#{y}] - #{soluation[x][y]}"
		return false
end
return false
end

def canmove(x,y)
	return true if(x >= 0 && x < size && y >= 0 && y<size && maze[x][y] != 0)
	return false
end

def print_maze
m = size-1
for i in (0..m) do
	str = ""
	(0..m).each{|j| str += "#{maze[i][j]} ";}
	puts str
end
end

def print_soluation
puts soluation.inspect
m = size-1
for i in (0..m) do
	str = ""
	(0..m).each{|j| str += "#{soluation[i][j]} ";}
	puts str
end
end


end



maze = []
maze << [1, 0, 1, 1,1]
maze << [1, 1, 1, 0,1]
maze << [0, 0,0, 1, 1]
maze << [0, 0, 0, 1,0]
maze << [0, 0,0, 1, 1]

maze1 = []
maze1 << [1, 0, 0, 0]
maze1 << [1, 1, 0, 1]
maze1 << [0, 1, 0, 0]
maze1 << [1, 1, 1, 1]

r = RatInMaze.new(maze)
#r.maze = maze1
r.print_maze
r.print_soluation
r.solve
#r.print_soluation
#puts r.soluation.inspect


