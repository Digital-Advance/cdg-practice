puts "Рады видеть тебя. Для начала давай познакомимся"
  print "Введи свое имя: > "
    name = gets.chomp
  print "Введи свою фамилию: > "
    surname = gets.chomp
  print "Введи свой возраст: > "
    age = gets.to_i

greeting = "Привет, #{name} #{surname}"

def acces(name, surname, age, greeting)
  if age != 18
    puts "#{greeting}. Тебе меньше 18 лет, но начать учиться программировать 
никогда не поздно"
  else
    puts "#{greeting}. Самое время заняться делом."
  end
end

acces(name, surname, age, greeting)