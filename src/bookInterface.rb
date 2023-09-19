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
end



# book = Book.new(1,"José de Alencar", "Iracema", "Romance", 1865)

# puts "id: #{book.id}"
# puts "author: #{book.author}"
# puts "title: #{book.title}"
# puts "genre: #{book.genre}"
# puts "year: #{book.year}"

