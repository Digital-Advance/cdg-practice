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
    puts "Студенты с возрастом #{age}:\n\nID     Студент     Возраст"
  new_list = find_age.each_with_index { |value, index| puts "#{index}| #{value}" }
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

find