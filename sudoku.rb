class Sudoku
attr_accessor :grid

#-------------------------
def getEmptyCell()
c = []
for i in (0..8) do
	for j in (0..8) do
		if grid[i][j] == 0
			c << i
			c << j
			return c
		end
	end
end
return [-1,-1]
end
#-------------------------
def solve()
c = getEmptyCell()
return true if c[0] == -1
	row,col = c[0],c[1]
	for n in (1..9) do
		if issafe(row,col,n)
			grid[row][col] = n
			if solve()
				return true
			end
			grid[row][col] = 0
		end
	end
return false
end
#-------------------------
def issafe(row,col,n)
	return !usedInRow(row,n) && !usedInCol(col,n) && !usedInBox(row-row%3,col-col%3,n)
end
#-------------------------
def usedInRow(row,n)
	for i in (0..8) do
		return true if grid[row][i] == n
	end
return false
end
#-------------------------
def usedInCol(col,n)
	for i in (0..8) do
		return true if grid[i][col] == n
	end
return false
end
#-------------------------
def usedInBox(startRow, startCol,n)
	for i in (0..2) do
		for j in (0..2) do
			return true if grid[i+startRow][j+startCol] == n
		end
	end
return false
end
#-------------------------

def print()
	for i in (0..8) do
		puts "\n" if i%3 == 0
		str = ""
		(0..8).each{|j| str += " - " if j%3 == 0 ; str += "#{grid[i][j]} "}
		puts str
		puts "\n"
	end
end
end

s = Sudoku.new
grid = []
grid << [5, 3, 0, 0, 7, 0, 0, 0, 0]
grid << [6, 0, 0, 1, 9, 5, 0, 0, 0]
grid << [0, 9, 8, 0, 0, 0, 0, 6, 0]

grid << [8, 0, 0, 0, 6, 0, 0, 0, 3]
grid << [4, 0, 0, 8, 0, 3, 0, 0, 1]
grid << [7, 0, 0, 0, 2, 0, 0, 0, 6]

grid << [0, 6, 0, 0, 0, 0, 2, 8, 0]
grid << [0, 0, 0, 4, 1, 9, 0, 0, 5]
grid << [0, 0, 0, 0, 8, 0, 0, 7, 9]

s.grid = grid
s.print()
puts "################\n"
s.solve
s.print()
