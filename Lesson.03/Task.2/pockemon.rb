require 'pry'
h = {}
arr = []
s = 0

puts "Привет. Укажи количество покемонов которых ты хочешь добавить."

  step = gets.chomp.to_i

def add_pockemons(h, arr, s, step)
  loop do
    puts "Введи имя покемона или 'q' для выхода из программы."
    name = gets.chomp
    puts "Введи цвет покемона"
    color = gets.chomp
    s += 1
    h = {name: name, color: color}
    arr.push(h)
    break if s == step || name == "q" || name == "Q"
    #binding.pry
  end
end

add_pockemons(h, arr, s, step)

puts "Теперь посмотри кто у тебя в списке"
  arr.each do |name|
    #binding.pry
   puts "Имя покемона: #{name[:name]}. Цвет покемона: #{name[:color]}"
  end