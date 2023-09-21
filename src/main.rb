require_relative "bookInterface"

def create_file
  if File.exist?('./books.txt')
    File.open('./books.txt', 'a+')
  else
    File.new('./books.txt', 'w+')
  end
end

 controller = BookInterface.new
 file = create_file

#  controller.create_book(file)
#  controller.remove_book_by_id(file)
#  controller.index_books(file)
#  controller.show_book(file)
  controller.update_book(file)



 