require 'json'
require_relative 'book'

class BookInterface
  def create_book(file)
    print "id: "
    id = gets.chomp.to_i
    print "Autor: "
    author = gets.chomp
    print "Título: "
    title = gets.chomp
    print "Gênero: "
    genre = gets.chomp
    print "Ano: "
    year = gets.chomp.to_i
  
    begin
      books = JSON.parse(file.read)
    rescue JSON::ParserError
      books = []
    end
    
    book = Book.new(id, author, title, genre, year)
    
    books << JSON.parse(book.to_json)
  
    file.rewind
    file.write(JSON.pretty_generate(books))
  
    puts "Livro cadastrado com sucesso!"
  end
  
  def remove_book_by_id(file)
    begin
      books = JSON.parse(file.read)
    rescue JSON::ParserError
      return puts("Não há nenhum livro cadastrado no banco de dados.")
    end
  
    print "Informe o id do livro que será removido: "
    id = gets.chomp.to_i
  
    book_to_be_removed = books.find { |book| book['id'] == id }
  
    if book_to_be_removed
      books.delete(book_to_be_removed)
      file.rewind
      file.truncate(0)
      file.write(JSON.pretty_generate(books))
      puts "Livro removido com sucesso!"
    else
      puts "Livro não encontrado!"
    end
  end
  

  def index_books(file)
    lines = file.readlines
      
    lines.each do |line|
      puts line
    end
  end

  def show_book(file)
    print "Informe o id do livro: "
    id = gets.chomp.to_i
    
    lines = file.readlines
      
    lines.each do |line|
      book_id, _, _, _, _ = line.chomp.split('|')
      if book_id.to_i == id
        return puts line
      end
    end
  end

  def update_book(file)
    print "Informe o id do livro que será atualizado: "
    id = gets.chomp.to_i

    lines = file.readlines
    line_to_be_updated = nil
    line_updated = nil
      
    lines.each do |line|
      book_id, _, _, _, _ = line.chomp.split('|')
      if book_id.to_i == id
        line_to_be_updated = line
        break  
      end
    end

    if (line_to_be_updated == nil) 
      return puts "Livro não encontrado"
    end
  
    puts "Opções:"
    puts "1 - id"
    puts "2 - Autor"
    puts "3 - Título"
    puts "4 - Gênero"
    puts "5 - Ano"
    puts "0 - Cancelar"
    print "Escolha o campo que será atualizado: "
    option = gets.chomp.to_i

    case option
    when 1
      print "Informe o novo id: "
      new_id = gets.chomp.to_i
      _, book_author, book_title, book_genre, book_year = line_to_be_updated.chomp.split('|')
      line_updated = "#{new_id}|#{book_author}|#{book_title}|#{book_genre}|#{book_year}"
    when 2
      print "Informe o novo Autor: "
      new_author = gets.chomp
      book_id, _, book_title, book_genre, book_year = line_to_be_updated.chomp.split('|')
      line_updated = "#{book_id}|#{new_author}|#{book_title}|#{book_genre}|#{book_year}"
    when 3
      print "Informe o novo Título: "
      new_title = gets.chomp
      book_id, book_author, _, book_genre, book_year = line_to_be_updated.chomp.split('|')
      line_updated = "#{book_id}|#{book_author}|#{new_title}|#{book_genre}|#{book_year}"
    when 4
      print "Informe o novo Gênero: "
      new_genre = gets.chomp
      book_id, book_author, book_title, _, book_year = line_to_be_updated.chomp.split('|')
      line_updated = "#{book_id}|#{book_author}|#{book_title}|#{new_genre}|#{book_year}"
    when 5
      print "Informe o novo Ano: "
      new_year = gets.chomp.to_i
      book_id, book_author, book_title, book_genre, _ = line_to_be_updated.chomp.split('|')
      line_updated = "#{book_id}|#{book_author}|#{book_title}|#{book_genre}|#{new_year}"
    when 0
      return puts "Operação cancelada"
    else
      puts "Opção inválida."
    end
    
    file.rewind
    file.truncate(0)

    lines.each do |line|
      book_id, _, _, _, _ = line.chomp.split('|')
      if book_id.to_i == id
        file.puts(line_updated)
      else
        file.puts(line)
      end
    end

    return puts("Livro atualizado!")
  end  
end
