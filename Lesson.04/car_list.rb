require 'pry'

CAR_LIST = 'list.txt'
BUFFER = 'buffer.txt'

puts "\nФайл успешно загружен. Для получения списка автомобилей нажми 'Enter'.".rjust(146, "_")
  gets.chomp

def index
  puts "\nАвтомобили в списке:\n".center(172, "=")
    file = File.open(CAR_LIST)
      @arr = file.readlines.map { |x| x.chomp }
  puts @arr
end

puts "#{index}\nДля замены автомобиля в списке можно выполнить его поиск по id или модели.\n".center(226, "-")
print "Выбери способ поиска:\n>1 - ID.\n>2 - Модель.\nВвод >> "
  method = gets.chomp

if method == "1"
  loop do
    print "\nВведи ID для отображения модели >> ".rjust(111, "-")
      @id = gets.chomp.to_i

    def find
      File.readlines(CAR_LIST)[@id]
    end
    print "\nПод номером #{@id} записан автомобиль - #{find}>1 - Заменить.\n>2 - Повторить поиск.\nВвод >> ".rjust(160, "-")
      find_method = gets.chomp.to_i
    break if find_method == 1
  end
    update_id = @id
  print "\nДля замены введи новую модель автомобиля >> ".rjust(120, "-")
    update_model = gets.chomp

elsif method == "2"
  loop do
    print "\nВведи модель для отображения ID >> ".rjust(111, "-")
      model = gets.chomp

    def where(model)
      @car_id = (0 ... @arr.length).find_all { |i| @arr[i] == model }
      #@line_id = @car_id.join (",")
    print "\nID автомобиля в списке = #{@car_id}\n>1 - Заменить.\n>2 - Повторить поиск.\nВвод >> ".rjust(148, "-")
    end
    print "#{where(model)}"
      find_method1 = gets.chomp.to_i
  break if find_method1 == 1
end
print "\nДля замены автомобиля в списке укажи его ID >> ".rjust(123, "-")
  update_id = gets.chomp.to_i
print "\nТеперь укажи новую модель автомобиля >> ".rjust(116, "-")
  update_model = gets.chomp
end

def update(update_id, update_model)
  file = File.open(BUFFER, "w")
  File.foreach(CAR_LIST).with_index do |car, index|
    file.puts(update_id == index ? update_model : car)
  end

  file.close
  File.write(CAR_LIST, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end

  update(update_id, update_model)

def update_index
  puts "\nСписок обновлен:\n".center(168, "=")
    File.foreach(CAR_LIST) { |car| puts "> #{car}" }
end

puts "#{update_index}"

puts ""















=begin print "#{update_index}\nТеперь попробуй удалить ненужный автомобиль из списка.\nНо перед этим проверь список и найди этот автомобиль по id.\nДля этого введи id автомобиля - ".rjust(211, "-")

  id = gets.chomp.to_i

def find(id)
  File.readlines(CAR_LIST)[id]
end

puts "\nПод номером #{id} записан автомобиль - #{find(id)}".center(169, "=")
=end
