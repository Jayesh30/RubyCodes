puts "Rope Length: "
n = gets.to_i

def max_cutting_product(n)
mcp = Array.new(n+1){1}
for i in (1..n) do
for j in(1..i-1) do
cp = [j*(i-j), j*mcp[i-j]].max
mcp[i] = [cp, mcp[i]].max
end
end
mcp[n]
end

puts max_cutting_product(n)
