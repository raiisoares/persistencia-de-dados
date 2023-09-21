require 'json'
require_relative "bookInterface"

#TODO: Interface para aplicação
def main
  controller = BookInterface.new
  file = create_file

  #  controller.create_book(file)
  #  controller.remove_book_by_id(file)
  #  controller.index_books(file)
  #  controller.show_book(file)
  # controller.update_book(file)
end

def create_file
  if File.exist?('books.json')
    file = File.open('books.json', 'r+')
  else
    file = File.new('books.json', 'w+')
  end
end

main






 