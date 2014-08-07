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
  it 'returns all authors for a given book id' do
    test_book = Book.new({'title'=> 'The Gas'})
    test_book.save
    test_book2 = Book.new(ATTRIBUTES)
    test_book2.save
    test_author = Author.new({'name'=>'Fred Barnes'})
    test_author.save
    test_author2 = Author.new({'name'=> 'Tap Root'})
    test_author2.save
    test_author3 = Author.new({'name'=> 'Battle Bailey'})
    test_author3.save
    test_author4 = Author.new(ATTRIBUTES)
    test_author4.save
    test_author5 = Author.new(ATTRIBUTES)
    test_author5.save
    add_book_and_author(test_book.id,test_author.id)
    add_book_and_author(test_book.id,test_author2.id)
    add_book_and_author(test_book.id,test_author3.id)
    add_book_and_author(test_book2.id,test_author.id)
    add_book_and_author(test_book2.id,test_author4.id)
    add_book_and_author(test_book2.id,test_author5.id)
    expect(author_search(test_book.id)).to eq ["Fred Barnes", "Tap Root", "Battle Bailey"]
  end

end


