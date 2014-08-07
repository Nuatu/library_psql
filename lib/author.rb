class Author

  attr_accessor :name, :id

  def initialize (attributes)
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    authors = []
    results = DB.exec("SELECT * FROM authors;")
    results.each do |author|
    authors << Author.new(author)
    end
    authors
  end

  def save
    @id = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end

  def ==(another_author)
    self.name == another_author.name
  end

  def update_name(new_name)
    DB.exec("UPDATE authors SET name = '#{new_name}' WHERE id = '#{@id}';")
    @name = new_name
  end

  def delete
    DB.exec("DELETE FROM authors where id = '#{@id}';")
  end
end
