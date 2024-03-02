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

def color_input
  print "\nВведи цвет покемона, которого ты добавил:>> "
  loop do
    @color = gets.chomp
      if @color.size == 0
        print "\nОшибка, строка цвета не может быть пустой. Повтори ввод:>>  "
      end
    break if @color.size > 0
  end
end

def added_in_hash_and_array(h, arr)
  h = {name: @name, color: @color}
  arr.push(h)
end

def app(h, arr, s)
  count_input
    loop do
      name_input
      color_input
      added_in_hash_and_array(h, arr)
      s += 1
    break if s == @count
  end
  puts "\nСписок добавленнх покемонов в виде массива: \n#{arr}"
end

app(h, arr, s)