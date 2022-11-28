print "Компания 'CDG' приветствует Вас. Для продолжения нажмите 'Enter'."
  gets.chomp

loop do
  puts "Ведите Ваше имя:"
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
    return @age >= 18 ? ("Здравствуйте, #{@name} #{@surname}. Самое время заняться делом.") : ("Здравствуйте, #{@name} #{@surname}. Вам меньше 18 лет, но начать учиться программированию никогда не рано. Усердно учитесь и через #{@difference_age} #{gradient_age} когда Вам исполнится 18 лет, Вы сможете заняться делом.")
end

  puts "#{pass} \n\nДля завершения программы введите 'Стоп' и нажмите 'Enter'. Для ввода новых данных нажмите 'Enter':"
  input = gets.chomp.downcase
  break if input == "стоп"
end