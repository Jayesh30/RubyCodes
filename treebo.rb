
# InputObject Type :CSV, FILE,

class InputObject #all derived class should have read_input and parse function which return array of differ input based on split
attr_accessor :input

def initialize(str)
@input = str
end
#based on type it will parse

def parse
get_type.parse
end

def get_type
# based on type we create input object for now i am useing file
FileInputObject.new(input)
end

end #class end


class FileInputObject < InputObject

def read_input
File.read(@input)
end

def parse
read_input.strip.split(",")
end

end

# InputType : -----------------

TYPE = [:EXPRESSION, :URL, :RANGE, :REGEX]
class InputType 
attr_accessor :input

def initialize(str)
@input = str
end

def evaluate
t = type?(input)
puts "#{input} - #{t}"
result = case t 
	when :URL
		Url.new(input).evaluate
	when :EXPRESSION
		Expression.new(input).evaluate
	when :RANGE
		Range1.new(input).evaluate
	when :REGEX
		Regex.new(input).evaluate
	end
result
end

def type?(t)
#puts t
a = t.chars.to_a
if t.start_with?("http")
	return :URL
elsif t.size == 3 && ['+','-','*','/'].include?(a[1])
	return :EXPRESSION
elsif t.start_with?('[') && t.end_with?(']')
	return :RANGE
else
	return :REGEX
end
end

end

class Url < InputType
def evaluate
200
end
end

class Expression < InputType
def evaluate
#assumption that right now only 2 opranad and 1 operator
#else need to write comple evaluation, we can use eval

a = @input.chars.to_a
#puts a.inspect
op1 = a[0]
oprand = a[1]
op2 = a[2]
result = case oprand
when '+'
op1.to_i + op2.to_i
when '-'
op1.to_i - op2.to_i
when '*'
op1.to_i * op2.to_i
when '/'
op1.to_i / op2.to_i
end
#puts result
result

end

end #class end

class Range1 < InputType
def evaluate
res = []
@input.chars.to_a.each do |i|
res << i if !res.include?(i) && !['+','-','[',']'].include?(i)
end
"[" + res.join(',') + "]"
end
end #class end

class Regex < InputType
def evaluate
arr = pre_process
rstr = arr[0]
r = Regexp.new(arr[0][1..-2])
output = []
arr[1..-1].each do |i|
if r.match(i).nil?
output << "invalid"
else
output << "valid"
end
end

"(" +rstr+","+output.join(':')+")"
end

def pre_process
input.chars.to_a[1..-1].join.split(':')
end

end #class end

#------------------------------------
class Evaluate
attr_accessor :arr

def initialize(obj)
@arr = obj.parse
end

def evaluate
output = []
@arr.each do |x|
output << InputType.new(x).evaluate
end
output.join(',')
end

end #class end


# main function
obj = InputObject.new("treebo.txt")
e = Evaluate.new(obj)
result = e.evaluate
puts result

