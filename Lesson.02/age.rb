puts "Здравствуйте. Ведите Ваше имя:"
  @name = gets.chomp
puts "Введите Вашу фамилию:"
  @surname = gets.chomp
puts "Введите Ваш возраст:"
  @age = gets.chomp.to_i

@difference_age =  18 - @age 

def gradient_age
  if @difference_age == 1
    return "год"
  elsif @difference_age == 2
    return "года"
  elsif @difference_age == 3
    return "года"
  elsif @difference_age == 4
    return "года"
  else
    return "лет"
  end
end

def pass
  return @age >= 18 ? ("#{@name} #{@surname}, добро пожаловать на наш курс.") : ("#{@name} #{@surname}, Вам еще рано. Приходи через #{@difference_age} #{gradient_age}")
end

puts pass