BALANCE = 'balance.txt'  # Имя файла для хранения баланса
BUFFER = 'buffer.txt'    # Временный файл для обновления баланса

def balance
  File.open(BALANCE).read.to_f  # Функция для чтения текущего баланса из файла
end

def show_balance
  puts "\nБаланс счета = #{balance} ₽."  # Вывод текущего баланса на экран
end

def add_cash
    print "\nВведите сумму для пополнения: >> "
  input_cash = gets.to_f  # Получение суммы для пополнения от пользователя
    if input_cash.negative?
      puts "\nСумма не может быть отрицательной."
    elsif input_cash.zero?
      puts "\nСумма не может быть нулевой."
    else
      new_balance = balance + input_cash  # Вычисление нового баланса после пополнения
    file = File.open(BUFFER, "w")  # Открытие временного файла для записи нового баланса
      file.write(new_balance)  # Запись нового баланса во временный файл

    file.close
      File.write(BALANCE, File.read(BUFFER))  # Обновление файла с балансом
    File.delete(BUFFER) if File.exist?(BUFFER)  # Удаление временного файла
  end
end

def withdraw_cash
    print "\nВведите сумму для снятия: >> "
  withdraw_cash = gets.to_f  # Получение суммы для снятия от пользователя
    if withdraw_cash > balance
      puts "\nНедостаточно средств."
    elsif withdraw_cash.negative?
      puts "\nСумма не может быть отрицательной."
    elsif withdraw_cash.zero?
      puts "\nСумма не может быть нулевой."
    else
      new_balance = balance - withdraw_cash  # Вычисление нового баланса после снятия
    file = File.open(BUFFER, "w")  # Открытие временного файла для записи нового баланса
      file.write(new_balance)  # Запись нового баланса во временный файл

    file.close
      File.write(BALANCE, File.read(BUFFER))  # Обновление файла с балансом
    File.delete(BUFFER) if File.exist?(BUFFER)  # Удаление временного файла
  end
end

def menu
  loop do
    puts "\nВыберите действие:\n\n1. Добавить деньги.\n2. Снять деньги.\n3. Показать баланс.\n4. Выход."
      print "\nВвод: >> "
    action = gets.to_i  # Получение выбора действия от пользователя
    case action
    when 1
      add_cash
    when 2
      withdraw_cash
    when 3
      show_balance
    when 4
      abort "Программа завершена"  # Завершение программы
    end
  end
end

menu  # Вызов функции для запуска программы
