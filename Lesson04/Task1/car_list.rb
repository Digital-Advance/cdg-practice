CAR_LIST = 'db.txt'
BUFFER = 'buffer.txt'

def exit_programm
  abort "Работа с программой завершена"
end

def index_list
  puts "\nСписок базы данных:\n\n"
    File.open(CAR_LIST).each_with_index do |value, index|
      puts "#{index} - #{value}"
  end
end

def find
    loop do
      file = File.open(CAR_LIST).readlines.map(&:chomp)
      puts "\nТип поиска:\n1. Строка.\n2. ID.\n3. Вернуться в меню."
        print "\nВыберите тип поиска >> "
         find_type = gets.to_i
      case find_type
      when 1
        print "Введите искомую строку: >> "
          string = gets.chomp
           list_id = (0...file.size).find_all { |i| file[i] == string }
        puts "ID указанной строки = #{list_id}"
      when 2
        print "Введите искомый ID: >> "
          id = gets.to_i
        puts "По данному ID записана строка = #{file[id]}"
      end
    break if find_type == 3
  end
end

def update
  print "\nВведите ID для перезаписи строки: >> "
    id = gets.to_i
  print "\nВведите новую строку: >> "
    new_car = gets.chomp

  file = File.open(BUFFER, "w")
    File.foreach(CAR_LIST).with_index do |car, index|
      file.puts(id == index ? new_car : car)
    end

  file.close
    File.write(CAR_LIST, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def add
  print "Введите марку автомобиля для добавления в конец списка: >> "
    car_add = gets.chomp
  File.open(CAR_LIST, "a") { |new| new.write "#{car_add}\n" }
end

def delete
  print "\nВведите ID для удаления строки: >> "
    delete_id = gets.to_i

  list = File.open(CAR_LIST).readlines.map { |x| x.chomp }
    delete_car = list[delete_id]
      list.slice!(delete_id)
    
  file = File.open(BUFFER, "w")
    file.write("#{list.join("\n")}")
  file.close

    File.write(CAR_LIST, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
  puts "Из списка удален автомобиль #{delete_car} под номером #{delete_id}."
end

def function
  loop do
    puts "\nФункции работы со списком:\n\n1. Показать список.\n2. Поиск.\n3. Перезаписать.\n4. Добавить\n5. Удалить.\n6. Завершить работу."
      print "\nВыберите нужную функцию: >> "
        function = gets.to_i
        case function
        when 1
          index_list
        when 2
          find
        when 3
          update
        when 4
          add
        when 5
          delete
        when 6
      exit_programm
    end
  end
end

function

