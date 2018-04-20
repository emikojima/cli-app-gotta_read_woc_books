class Book
  attr_accessor :title, :author, :month, :url, :description

  @@all = []

  def initialize(title = nil, author = nil, month = nil, url = nil, description = nil)
    @title = title
    @author = author
    @month = month
    @url = url
    @description = description
    @@all << self
  end

  def self.books
    #returns list of titles with number
    #call all, each_with_index  (maybe make input to index method), then list
    puts "BOOKLIST"
  end

  def self.all
    @@all
  end



end
