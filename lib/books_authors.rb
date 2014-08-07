

def add_book_and_author(book_id, author_id)
  DB.exec("INSERT INTO books_authors (book_id,author_id) VALUES (#{book_id}, #{author_id});")
end


def author_search(book_id)
  output = []
  results = DB.exec("SELECT * FROM books_authors JOIN authors ON (books_authors.author_id = authors.id) WHERE book_id = #{book_id};")
  # count = DB.exec("SELECT COUNT(*) FROM books_authors JOIN authors ON (books_authors.author_id = authors.id) WHERE book_id = #{book_id};").first['count'].to_i
  results.each do |result|
    output << result['name']
  end
p output
end

