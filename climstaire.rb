#can step 1 or 2 or 3
puts "no of step : n"
n =gets.to_i

def climb(n)

t = Array.new(n+1){0}
t[0] = 1
t[1] = 2
t[2] = 4
for i in (3..n) do
t[i] = 1 + t[i-1] + t[i-2] + t[i-3]
end
t[n]
end

puts climb(n-1)
