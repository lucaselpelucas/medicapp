n = 0

primo = gets.chomp.to_f
i = 1
while i <= primo do 
  r = primo.to_f / i
  if r % 1 == 0
    n += 1
  end
  i += 1
end
if n == 2
  puts "el numero es primo"
else
  puts "el numero no es primo"
end
