require 'spec_helper'

describe 'Author' do
  describe "initialize" do
    it 'creates an object of the Author class' do
      test_author = Author.new(ATTRIBUTES)
      expect(test_author).to be_an_instance_of Author
    end
  end
  describe ".all" do
    it 'returns an empty array' do
      expect(Author.all).to eq []
    end
  end
  describe '#save' do
    it 'saves a book to the database' do
      test_author = Author.new(ATTRIBUTES)
      test_author.save
      expect(Author.all).to eq [test_author]
    end
  end
  describe '#update' do
    it 'lets you update the name of an author' do
      new_author = Author.new(ATTRIBUTES)
      new_author.save
      new_author2 = Author.new(ATTRIBUTES)
      new_author2.save
      new_author3 = Author.new(ATTRIBUTES)
      new_author3.save
      new_author.update_name('normal_author')
      new_author2.update_name('normal_author2')
      new_author3.update_name('normal_author3')
      expect(new_author.name).to eq 'normal_author'
      expect(new_author2.name).to eq 'normal_author2'
      expect(new_author3.name).to eq 'normal_author3'
    end
  end
  describe '#delete'do
    it 'lets you delete a author record' do
      new_author = Author.new(ATTRIBUTES)
      new_author.save
      new_author.delete
      expect(Author.all).to eq []
    end
  end
end
