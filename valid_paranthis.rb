puts "int"
n = gets.strip.to_i

def valid_p(o, c, str)
if o == 0 && c == 0
puts str
else
return if o > c
valid_p(o-1,c,str+"(") if o > 0
valid_p(o,c-1,str+")") if c > 0
end
end

valid_p(n,n,"")


