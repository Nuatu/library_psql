class Book

  attr_accessor :title, :id

  def initialize (attributes)
    @title = attributes['title']
    @id = attributes['id']
  end

  def self.all
    books = []
    results = DB.exec("SELECT * FROM books;")
    results.each do |book|

    books << Book.new(book)
    end
    books
  end

  def save
    @id = DB.exec("INSERT INTO books (title) VALUES ('#{@title}') RETURNING id;").first['id'].to_i
  end

  def ==(another_book)
    self.title == another_book.title
  end
end



