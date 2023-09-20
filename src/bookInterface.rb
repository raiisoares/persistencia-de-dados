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

    book = Book.new(id, author, title, genre, year)
    file.puts("#{book.id}|#{book.author}|#{book.title}|#{book.genre}|#{book.year}")
    puts "Livro cadastrado com sucesso!"
  end

  def remove_book_by_id(file)
    print "Informe o id do livro que será removido: "
    id = gets.chomp.to_i
    
    book_removed = false
    lines = file.readlines

    file.rewind
    file.truncate(0)

    lines.each do |line|
      book_id, _, _, _, _ = line.chomp.split('|')
      if book_id.to_i != id
        file.puts(line)
      else
        book_removed = true
      end
    end

    if book_removed 
      puts "\nLivro removido com sucesso!\n"
    else
      puts "\nLivro não encontrado!\n"
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

end
          