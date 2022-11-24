puts "Здравствуйте. Ведите Ваше имя:"
  @name = gets.chomp
puts "Введите Вашу фамилию:"
  @surname = gets.chomp
puts "Введите Ваш возраст:"
  @age = gets.chomp.to_i

@difference_age =  18 - @age 

