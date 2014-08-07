require 'spec_helper'


describe 'add_book_and_author' do
  it 'inserts a book - author pairing into the books_authors join table' do
    test_book = Book.new(ATTRIBUTES)
    test_book.save
    test_author = Author.new(ATTRIBUTES)
    test_author.save
    add_book_and_author(test_book.id,test_author.id)
    test_book2 = Book.new(ATTRIBUTES)
    test_book2.save
    test_author2 = Author.new(ATTRIBUTES)
    test_author2.save
    add_book_and_author(test_book2.id,test_author2.id)
    expect(DB.exec('SELECT COUNT(*) FROM books_authors;').first['count']).to eq "2"
  end
end

    # DB.exec("SELECT COUNT(*)FROM books_authors;").first['count']
