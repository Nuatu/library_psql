def add_book_and_author(book_id, author_id)
  DB.exec("INSERT INTO books_authors (book_id,author_id) VALUES (#{book_id}, #{author_id});")
end


