BALANCE = 'balance.txt'
BUFFER = 'buffer.txt'

def balance
  File.open(BALANCE).read.to_f
end

def show_balance
  puts "Баланс счета = #{balance}"
end
