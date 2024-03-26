STUDENT = 'db.txt'
RESULT = 'result.txt'

def exit_programm
  abort "Работа с программой завершена"
end

def read_file
  file = File.open(STUDENT).readlines.map(&:chomp)
end

def find
  print "Введите возраст для поиска студента: >> "
    age = gets.chomp
      find_age = read_file.select { |value| value.include? age }
    puts "Студенты с возрастом #{age}:\n\nID     Студент     Возраст"
  new_list = find_age.each_with_index { |value, index| puts "#{index}| #{value}" }
end

find