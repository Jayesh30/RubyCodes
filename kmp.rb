puts "string :"
str = gets.strip
puts "pattern :"
pat = gets.strip

def get_lps(pat)
lps = []
i = 0
lps[i] = 0
i = 1
len = 0
m = pat.size
while i<m do
	if pat[len] == pat[i]
		len = len+1
		lps[i] = len
		i = i+1
	else
		if len > 0
		len = lps[len-1]
		else
		lps[i] = 0
		i = i+1
		end
	end
end
lps
end
#get_lsp(pat)

def kmp_match(str, pat)
lps = get_lps(pat)
i=0
j=0
while(i < str.size) do 
if str[i] == pat[j]
i = i+1
j = j+1
end
if j == pat.size
puts "match - #{i-j}"
end
if (i < str.size && str[i] != pat[j])
if(j > 0)
j = lps[j-1]
else
i= i+1
end
end
end
end
kmp_match(str,pat)
