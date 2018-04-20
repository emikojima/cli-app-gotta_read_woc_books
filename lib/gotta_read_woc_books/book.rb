class Book
  attr_accessor :title, :author, :month, :url, :description

  @@all = []

  def initialize(title = nil)
    @title = title
    @@all << self
  end

  def self.books
    #returns instances of books
    puts "BOOKLIST"
  end

  def self.all
    @@all
  end



end
