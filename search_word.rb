class SearchWord
attr_accessor :word, :wsize, :maze, :msize, :soluation

def initialize(w, m)
@word = w.split("")
@wsize = @word.size
@maze = m.clone
@msize = m.size
@soluation= Array.new(msize) { Array.new(msize, 0) }
end

def solve
puts maze.inspect
puts soluation.inspect
for i in(0..msize) do
for j in (0..msize) do
if(find_word(i,j,0, 1))
	puts "found"
	print_soluation
	return true
end
end
end
puts "###########################"
puts soluation.inspect
return false
end

def find_word(x,y,i, path)
#puts "#{x}-#{y}-#{i}-#{path}"
if(canmove(x,y,i))
if(i == wsize-1)
	soluation[x][y] = path
	return true
end
#puts "set path 1to #{x}-#{y}-#{i}-{path}"
soluation[x][y] = path
path = path+1
return true if(find_word(x+1,y,i+1,path))
return true if(find_word(x-1,y,i+1,path))
return true if(find_word(x,y+1,i+1,path))
return true if(find_word(x,y-1,i+1,path))
return true if(find_word(x-1,y+1,i+1,path))
return true if(find_word(x-1,y-1,i+1,path))
return true if(find_word(x+1,y+1,i+1,path))
return true if(find_word(x+1,y-1,i+1,path))

#puts "set path 0 to #{x}-#{y}-#{i}-{path}"
soluation[x][y] = 0
path = path-1
return false
end
end

def canmove(x,y,i)
#puts "#{maze[x][y]} - #{word[i].to_s}"
return true if(x>=0 && x<msize && y>=0 && y<msize && soluation[x][y] == 0 && maze[x][y] == word[i])
return false
end


def print_soluation
puts soluation.inspect
m = msize-1
for i in (0..m) do
	str = ""
	(0..m).each{|j| str += "#{soluation[i][j]} ";}
	puts str
end
end

end


maze = []
maze << ['t', 'z', 'x', 'c', 'd']
maze << ['a', 'h', 'n', 'z', 'x']
maze << ['h', 'w', 'o', 'i', 'o']
maze << ['o', 'r', 'n', 'r', 'n']
maze << ['a', 'b', 'r', 'i', 'n']
str = "horizon"

s = SearchWord.new(str,maze)
puts s.word.join("")
s.solve
