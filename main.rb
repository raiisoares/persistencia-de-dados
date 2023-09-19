require_relative "book"

book = Book.new(1,"José de Alencar", "Iracema", "Romance", 1865)

puts "id: #{book.id}"
puts "author: #{book.author}"
puts "title: #{book.title}"
puts "genre: #{book.genre}"
puts "year: #{book.year}"

def create_file
  if File.exist?('books.txt')
    File.open('books.txt', 'r+')
  else
    File.new('books.txt', 'w+')
  end
end

 file = create_file