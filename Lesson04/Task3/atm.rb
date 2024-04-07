BALANCE = 'balance.txt'
BUFFER = 'buffer.txt'

def balance
  File.open(BALANCE).read.to_f
end

def show_balance
  puts "\nБаланс счета = #{balance} ₽."
end

def add_cash
    print "\nВведите сумму для пополнения: >> "
  input_cash = gets.to_f
    if input_cash.negative?
      puts "\nСумма не может быть отрицательной."
    else
      new_balance = balance + input_cash
    file = File.open(BUFFER, "w")
      file.write(new_balance)
  
    file.close
      File.write(BALANCE, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
  end
end

def withdraw_cash
    print "\nВведите сумму для снятия: >> "
  withdraw_cash = gets.to_f
    if withdraw_cash > balance
      puts "\nНедостаточно средств."
    elsif withdraw_cash.negative?
      puts "\nСумма не может быть отрицательной."
    else
      new_balance = balance - withdraw_cash
    file = File.open(BUFFER, "w")
      file.write(new_balance)

    file.close
      File.write(BALANCE, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
  end
end

def menu
  loop do
    puts "\nВыберите действие:\n\n1. Добавить деньги.\n2. Снять деньги.\n3. Показать баланс.\n4. Выход."
     print "\nВвод: >> "
  action = gets.to_i
    case action
    when 1
      add_cash
    when 2
      withdraw_cash
    when 3
      show_balance
    when 4
      abort "Программа завершена"
    end
  end
end

menu