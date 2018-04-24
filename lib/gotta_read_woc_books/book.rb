class Book
  attr_accessor :title, :month, :url, :description

  @@all = []

  def initialize(title = nil, url = nil)
    @title = title
    @url = url
    @@all << self
  end

  def self.books
    all.each.with_index(1) {|value, index| puts "#{index}: #{value.title}"}
  end

  def self.all
    @@all
  end

  def self.descriptions
    Scraper.scrape_description.each.with_index(1) {|desc, index| "#{index}. #{desc}"}
  end

  def self.create_from_scraper
    Scraper.scrape_author_title.each {|book| Book.new(title = book[:title], url = book[:url])}
  end

  def self.url
    all.map do |book|
      if book.url.empty?
        book.url = "GO TO YOUR LOCAL BOOKSELLER!"
      end
    end
  end

end
