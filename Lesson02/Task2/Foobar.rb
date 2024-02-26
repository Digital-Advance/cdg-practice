puts "Привет, рад тебя видеть."
  print "Введи первое число: > "
    first_number = gets.to_i
  print "Введи второе число: > "
    second_number = gets.to_i

sum = first_number + second_number

def foobar(first_number, second_number, sum)
  if first_number == 20 || second_number == 20
    puts "Второе число = #{second_number}"
  else
    puts "Сумма двух чисел = #{sum}"
  end
end

foobar(first_number, second_number, sum)