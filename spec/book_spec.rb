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
      binding.pry
      expect(Book.all).to eq [test_book]
    end
  end

end
