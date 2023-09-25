require 'json'
require_relative "bookInterface"

#TODO: Interface para aplicação

def main
  loop do
    controller = BookInterface.new
    file = create_file
    exit = false
    puts "————————————————————————————————"
    puts "Opções:"
    puts "1 - Adicionar livro"
    puts "2 - Remover livro"
    puts "3 - Listar livros"
    puts "4 - Procurar livro"
    puts "5 - Atualizar livros"
    puts "0 - Cancelar"
    print "Escolha o que deseja fazer "
    option = gets.chomp.to_i
    puts "————————————————————————————————"

    case option
      when 1
      puts "Digite as informações pedidas do livro" 
      controller.create_book(file)
    when 2
      controller.remove_book_by_id(file)
    when 3
      controller.index_books(file)
    when 4
      controller.show_book(file)
    when 5
      controller.update_book(file)
    when 0
      exit = true
      puts 
    end
    if exit == true
      break
    end
  end
end

def create_file
  if File.exist?('books.json')
    file = File.open('books.json', 'r+')
  else
    file = File.new('books.json', 'w+')
  end
end

main






 