STUDENT = 'db.txt'
RESULT = 'result.txt'
BUFFER = 'buffer.txt'

def exit_programm
  abort "Работа с программой завершена"
end

def read_file
  File.open(STUDENT).readlines.map(&:chomp)
end

def find
  print "Введите возраст для поиска студента: >> "
    age = gets.chomp
      find_age = read_file.select { |value| value.include? age }
    if find_age.size == 0
      puts "\nСтудентов такого возраста нет в списке."
    else
      puts "\nСтуденты с возрастом #{age}:\n\nID     Студент     Возраст"
    new_list = find_age.each_with_index { |value, index| puts "#{index}| #{value}" }
  end
end

def move_student
  print "Введите ID студента для записи его в отдельный список: >> "
    input_id = gets.to_i

    File.open(RESULT, "a") { |new| new.write "#{read_file[input_id]}\n" }

      list = read_file
        delete_student = read_file[input_id]
      list.slice!(input_id)
      
      file = File.open(BUFFER, "w")
        file.write("#{list.join("\n")}")
      file.close
  
    File.write(STUDENT, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

def student_list
  puts "\nСписок студентов:"
    puts read_file
end

def result_list
  list = File.open(RESULT).readlines.map(&:chomp)
    puts "\nСписок студентов одного возраста:"
  puts list
end

def menu
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

menu