require_relative "bookInterface"

def create_file
  if File.exist?('books.txt')
    File.open('books.txt', 'r+')
  else
    File.new('books.txt', 'w+')
  end
end

 interface = BookInterface.new
 file = create_file

 interface.create_book(file)



 