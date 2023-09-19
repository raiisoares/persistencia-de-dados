class Book
  attr_accessor :id, :author, :title, :genre, :year

  def initialize(id, author, title, genre, year)
    @id = id
    @author = author
    @title = title
    @genre = genre
    @year = year
  end
end