require 'pry'

STUDENT_LIST = 'student_list.txt'
RESULTS = 'results.txt'

puts "\nФайл успешно загружен. Для получения списка студентов нажми 'Enter'.".rjust(146, "_")
  gets.chomp

def index
  puts "\nСтуденты в списке:\n".center(172, "=")
    file = File.open(STUDENT_LIST)
      @arr = file.readlines.map { |x| x.chomp }
    File.foreach(STUDENT_LIST) { |student| puts student }
end

puts "#{index}"

def select_function
  loop do
    puts "\nВыбери необходимую функцию:\n".center(181, "=")
    print"> 1 - Добавить студента в конец списка.\n> 2 - Отсортировать студентов по возрасту.\n> 3 - Удалить студента из списка по ID.\n> 4 - Завершить программу.\nВвод >> "
    function = gets.chomp.to_i
    if function == 1
      def add_list
        print "\nВведи фамилию студента >> ".rjust(103, "-")
          add_surname = gets.chomp
        print "\nВведи имя студента >> ".rjust(99, "-")
          add_name = gets.chomp
        print "\nВведи отчество студента >> ".rjust(104, "-")
          add_patronymic = gets.chomp
        print "\nВведи возраст студента >> ".rjust(103, "-")
          add_age = gets.chomp
        add_student = "> #{add_surname} #{add_name} #{add_patronymic} | #{add_age}"
        File.write(STUDENT_LIST, "#{add_student}\n", mode: "a")
          puts "\nСтудент добавлен. Список обновлен:\n".center(188, "=")
        File.foreach(STUDENT_LIST) { |student| puts student }
      end
        add_list

    elsif function == 2
      def picking_student
        loop do
         print "Введи возраст для поиска всех студентов >> "
           age = gets.chomp
           @student_id = (0 ... @arr.length).find_all { |i| @arr[i].include? age }
           print "\nID студентов c возрастом #{age} в списке = #{@student_id}\n>1 - Переместить в отдельный список.\n>2 - Повторить поиск.\nВвод >> ".rjust(149, "-")
         move_method = gets.chomp.to_i
         break if move_method == 1
        end  
      end
        picking_student
    elsif function == 4
      abort "\nПрограмма завершена\n".center(171, "=")
    break if function == 2
    end
  end
end

puts select_function
