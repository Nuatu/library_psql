require 'spec_helper'

describe 'Book' do
  describe "initialize" do
    it 'creates an object of the book class' do
      test_book = Book.new(ATTRIBUTES)
      expect(test_book).to be_an_instance_of Book
    end
  end
  describe ".all" do
    it 'returns an empty array' do
      expect(Book.all).to eq []
    end
  end
  describe '#save' do
    it 'saves a book to the database' do
      test_book = Book.new(ATTRIBUTES)
      test_book.save
      expect(Book.all).to eq [test_book]
    end
  end
  describe '#update' do
    it 'lets you update a doctors name, specialty, and/or insurance' do
      new_book = Book.new(ATTRIBUTES)
      new_book.save
      new_book2 = Book.new(ATTRIBUTES)
      new_book2.save
      new_book3 = Book.new(ATTRIBUTES)
      new_book3.save
      new_book.update_title('normal_book')
      new_book2.update_title('normal_book2')
      new_book3.update_title('normal_book3')
      expect(new_book.title).to eq 'normal_book'
      expect(new_book2.title).to eq 'normal_book2'
      expect(new_book3.title).to eq 'normal_book3'
    end
  end
  describe '#delete'do
    it 'lets you delete a book record' do
      new_book = Book.new(ATTRIBUTES)
      new_book.save
      new_book.delete
      expect(Book.all).to eq []
    end
  end

end
