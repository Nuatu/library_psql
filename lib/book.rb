class Book

  attr_accessor :title, :id

  def initialize (attributes)
    @title = attributes['title']
    id = attributes['id']
  end

  def self.all
    books = []
  end

end



