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
      puts "#{book_to_be_removed['title']} Foi removido com sucesso"
      # puts "Livro removido com sucesso!"
    else
      puts "Livro não encontrado!"
    end
  end
  
  def index_books(file)
    begin
      books = JSON.parse(file.read)
    rescue JSON::ParserError
      return puts("Não há nenhum livro cadastrado no banco de dados.")
    end
  
    books.each do |book|
      puts "#{book['id']}|#{book['author']}|#{book['title']}|#{book['genre']}|#{book['year']}"
    end
  end

  def show_book(file)
    begin
      books = JSON.parse(file.read)
    rescue JSON::ParserError
      return puts("Não há nenhum livro cadastrado no banco de dados.")
    end
  
    print "Informe o id do livro: "
    id = gets.chomp.to_i
  
    book_to_be_showed = books.find { |book| book['id'] == id }
  
    if book_to_be_showed
      puts "#{book_to_be_showed['id']}|#{book_to_be_showed['author']}|#{book_to_be_showed['title']}|#{book_to_be_showed['genre']}|#{book_to_be_showed['year']}"
    else
      puts "Livro não encontrado!"
    end
  end
  
  def update_book(file)
    begin
      books = JSON.parse(file.read)
    rescue JSON::ParserError
      return puts("Não há nenhum livro cadastrado no banco de dados.")
    end
  
    print "Informe o id do livro que será atualizado: "
    id = gets.chomp.to_i
  
    book_to_be_updated = books.find { |book| book['id'] == id }
  
    if book_to_be_updated.nil?
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
      book_to_be_updated['id'] = new_id
    when 2
      print "Informe o novo Autor: "
      new_author = gets.chomp
      book_to_be_updated['author'] = new_author
    when 3
      print "Informe o novo Título: "
      new_title = gets.chomp
      book_to_be_updated['title'] = new_title
    when 4
      print "Informe o novo Gênero: "
      new_genre = gets.chomp
      book_to_be_updated['genre'] = new_genre
    when 5
      print "Informe o novo Ano: "
      new_year = gets.chomp.to_i
      book_to_be_updated['year'] = new_year
    when 0
      return puts "Operação cancelada"
    else
      puts "Opção inválida."
    end
  
    file.rewind
    file.write(JSON.pretty_generate(books))
  
    return puts("Livro atualizado!")
  end


  def verify_file(file)
    begin
      return books = JSON.parse(file.read)
    rescue JSON::ParserError
      return puts("Não há nenhum livro cadastrado no banco de dados.")
    end

  end
end
