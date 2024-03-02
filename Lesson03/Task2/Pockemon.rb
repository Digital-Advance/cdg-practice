s = 0
arr = []
h = {}

def greeting
  puts "Привет, давай создадим массив, который будет содержать в себе хеш \nс именами покемонов и их цветами."
end

def count_input
  print "\nВведи число покемонов, которое ты хотел бы добавить:>> "
  loop do
    @count = gets.to_i
      if @count <= 0
        print "\nОшибка. Количество должно быть больше 0. Повтори ввод:>> "
      end
    break if @count > 0
  end
end

def name_input
  print "\nВведи имя покемона, которого ты хотел бы добавить:>> "
  loop do
    @name = gets.chomp
      if @name.size == 0
        print "\nОшибка, имя не может быть пустым. Повтори ввод:>>  "
      end
    break if @name.size > 0
  end
end


