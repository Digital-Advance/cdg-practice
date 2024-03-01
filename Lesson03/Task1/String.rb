puts "Привет, введи любое слово на английском языке"
  string = gets.chomp.downcase

def number_in_a_power(string)
  2 ** string.size
end

def string_reverse(string)
  string.reverse
end

def string_slice(string)
  string.slice(-2..-1)
end

case string_slice(string)
when "cs"
  puts "2 в степени #{string.size} = #{number_in_a_power(string)}"
else
  puts "Введенное слово задом наперед - '#{string_reverse(string)}'"
end
