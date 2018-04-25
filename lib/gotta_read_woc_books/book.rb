class Book
  attr_accessor :title, :url, :description

  @@all = []

  def initialize(title = nil, url = nil, description = nil)
    @title = title
    @url = url
    @description = description
  end

  def self.books
    all.each.with_index(1) {|value, index| puts "#{index}: #{value.title}"}
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(title = nil, url = nil, description = nil)
    book = self.new(title, url, description)
    book.save
    book
  end

  def self.create_from_scraper
    Scraper.scrape_from_url.each {|book| self.create(title = book[:title], url = book[:url], book[:description])}
  end

  def self.url
    all.map do |book|
      if book.url.empty?
        book.url = "GO TO YOUR LOCAL BOOKSELLER!"
      end
    end
  end

end
