STUDENT = 'db.txt'
RESULT = 'result.txt'
a = []

def exit_programm
  abort "Работа с программой завершена"
end

def read_file
  File.open(STUDENT).readlines.map(&:chomp)
end
  
