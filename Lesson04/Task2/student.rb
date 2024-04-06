STUDENT = 'db.txt'   # Имя файла со списком студентов
RESULT = 'result.txt'   # Имя файла для результата операции
BUFFER = 'buffer.txt'   # Имя временного файла для буферизации данных

def exit_program   # Метод для выхода из программы
  abort "Работа с программой завершена"
end

def read_file   # Метод для чтения файла со списком студентов
  File.open(STUDENT).readlines.map(&:chomp)
end

def find   # Метод для поиска студента по возрасту
  print "Введите возраст для поиска студента: >> "
  age = gets.chomp
    find_age = read_file.select { |value| value.include? age }   # Ищем студентов с указанным возрастом
  if find_age.size == 0
    puts "\nСтудентов такого возраста нет в списке."
  else
    puts "\nСтуденты с возрастом #{age}:\n\nСтудент     Возраст"
    new_list = find_age.each { |value| puts "#{value}" }   # Выводим найденных студентов
  end
end

def move_student   # Метод для перемещения студента в отдельный список
  print "Введите ID студента для записи его в отдельный список: >> "
  input_id = gets.to_i

  File.open(RESULT, "a") { |new| new.write "#{read_file[input_id]}\n" }   # Записываем выбранного студента в отдельный список

  list = read_file
  delete_student = read_file[input_id]
  list.slice!(input_id)
  
  file = File.open(BUFFER, "w")   # Открываем временный файл для записи оставшихся студентов
  file.write("#{list.join("\n")}")   # Записываем оставшихся студентов
  file.close

  File.write(STUDENT, File.read(BUFFER))   # Заменяем исходный файл списком студентов без удаленного
  File.delete(BUFFER) if File.exist?(BUFFER)   # Удаляем временный файл
end

def student_list   # Метод для вывода списка всех студентов
  puts "\nСписок студентов:\n\nID    Студент     Возраст"
  read_file.each_with_index { |value, index| puts "#{index}| #{value}"}
end

def result_list   # Метод для вывода списка студентов из отдельного файла
  list = File.open(RESULT).readlines.map(&:chomp)
  puts "\nСписок студентов одного возраста:"
  puts list
end

def menu   # Основное меню программы
  loop do
    puts "\nВыберите действие:\n\n1. Показать список.\n2. Поиск по возрасту.\n3. Добавить в отдельный список.\n4. Показать отдельный список.\n5. Выход."
    print "\nВвод: >> "
    action = gets.to_i
    case action
    when 1
      student_list
    when 2
      find
    when 3
      move_student
    when 4
      result_list
    when 5
      abort "Программа завершена"
    end
  end
end

menu   # Вызов основного меню программы
