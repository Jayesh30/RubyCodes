def change_signe(rhs)
  rhs.each do |k,v|
    rhs[k] = v*-1
  end
  rhs
end

def merge(lhs,rhs)
  result = {}
  lhs.each do | k,v|
    result[k] = v
  end
  rhs.each do | k,v|
    if result[k].nil?
      result[k] = v
    else
      result[k] = result[k] + v
    end
  end
  result
end

def join_result(r)
  str = ""
  r.each do |k,v|
    return "INVALID" if k == ""
    next if v==0
    if v == -1
      str += "-"
    end
    if v.abs != 1
      str += v.to_s
    end
    str += k
    str += "+"
  end
  str = str.gsub("+-","-").chomp("+")
  str += "=0"
  str
end

def key_value(str)
  #puts str
  x = str
  i = 0
  num = 1
  if char_type(x[i,1].to_s) == 'NUMBER'
     num = x[i,1].to_i
     i = i+1
  end
  if char_type(x[i,1].to_s) == 'MINUS'
     num = num*-1
     i = i+1
  end
  rem = x[i..-1]
  if isalid?(rem)
    return [rem, num]
  else
    ["",0]
  end
end

def hash_convert(str1)
h = {}
str1.each do |x|
  a = x.split("-")
  if a.size == 1
    k,v = key_value(x)
    h[k] = v
  else
    if(a[0][-1] != 94 )
      if (!a[0].empty?)
      k,v = key_value(a[0])
      h[k] = v
      end
      k,v = key_value(a[1])
      h[k] = v * -1
    else
      k,v = key_value(x)
      h[k] = v
    end
  end
end
h
end

def char_type(c)
as = c.to_s
  if (as[0] >= 48 && as[0] <= 57)
    return 'NUMBER'
  elsif as[0] == 94
    return 'POWER'
  elsif (as[0] >= 65 && as[0] <= 90) || (as[0] >= 97 && as[0] <= 122)
    return 'COF'
  elsif as[0] == 45
    return 'MINUS'
  else
    return 'INVALID'
  end
end

def isalid?(str)
  return false if str.nil?
  size = str.size
  i=0
  flag = true
  while (flag && (i < size)) do
    if char_type(str[i,1]) == 'NUMBER'
     flag = if (char_type(str[i-1,1]) == 'NUMBER')
                true
             elsif (char_type(str[i-1,1]) == 'MINUS')
                (char_type(str[i-2,1]) == 'POWER')
             else
                (char_type(str[i-1,1]) == 'POWER')
             end
    end
    i = i+1
  end
  flag
end



str = gets.chomp.gsub(" ","")
#puts str

a = str.split("=")
puts "Worng Input" if a.size < 2
if a.size>1
  lhsstr = a[0]
  rhsstr = a[1]
  if rhsstr != '0'
    lhs = hash_convert(lhsstr.split("+"))
    rhs = hash_convert(rhsstr.split("+"))
    rhs = change_signe(rhs)
    r = merge(lhs,rhs)
    rs = join_result(r)
    puts rs
  else
    puts lhsstr+= "=0"
  end
end
