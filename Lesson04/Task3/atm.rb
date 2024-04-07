BALANCE = 'balance.txt'
BUFFER = 'buffer.txt'

def balance
  File.open(BALANCE).read.to_f
end

def show_balance
  puts "Баланс счета = #{balance}"
end

def add_balance
  input_cash = gets.to_f
    sum_balance = balance + input_cash
  file = File.open(BUFFER, "w")
    file.write(new_balance)
  
  file.close
    File.write(BALANCE, File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end