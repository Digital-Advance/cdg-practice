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

