class MinCost
attr_accessor :grid, :soluation, :size1, :size2

def initialize(g)
@grid = g
@size1 = g.size
@size2 = g[0].size
@soluation= Array.new(size1) { Array.new(size2, 0) }
end

def solve
for i in (0..size1-1) do
for j in (0..size2-1) do
if i == 0 || j == 0
	soluation[i][j] = grid[i][j] + (j > 0 ? soluation[0][j-1] : soluation[i-1][0])
else
	soluation[i][j] = grid[i][j] + [soluation[i-1][j], soluation[i][j-1], soluation[i-1][j-1]].min
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

m = [[1,2,3],[4,8,2],[1,5,3]]
mc = MinCost.new(m)
mc.solve
mc.print_soluation
