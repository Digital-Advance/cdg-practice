CAR_LIST = 'db.txt'
BUFFER = 'buffer.txt'

def exit_programm
  abort "Работа с программой завершена"
end

def index_list
  puts "Список базы данных:\n\n"
    File.open(CAR_LIST).each_with_index do |value, index|
      puts "#{index} - #{value}"
  end
end

def find
  file = File.open(CAR_LIST).readlines.map(&:chomp)
    loop do
      puts "\nТип поиска:\n1. Строка.\n2. ID.\n3. Вернуться в меню."
        print "\nВыберите тип поиска >> "
         find_type = gets.to_i
      case find_type
      when 1
        print "Введите искомую строку: >> "
          string = gets.chomp
        puts "ID указанной строки = #{file.index(string)}"
      when 2
        print "Введите искомый ID: >> "
          id = gets.to_i
        puts "По данному ID записана строка = #{file[id]}"
      end
    break if find_type == 3
  end
end

def update
  print "\nВведите ID для перезаписи строки или 0 для возврата в меню: >> "
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

def function
  loop do
    puts "\nФункции работы со списком:\n\n1. Поиск.\n2. Перезаписать.\n3. Добавить\n4. Удалить.\n5. Завершить работу."
      print "\nВыберите нужную функцию: >> "
        function = gets.to_i
        case function
        when 1
          find
        when 2
          update 
        when 5
      exit_programm
    end
  end
end

index_list

function

