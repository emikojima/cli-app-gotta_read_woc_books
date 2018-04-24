class Book
  attr_accessor :title, :author, :month, :url, :description

  @@all = []

  def initialize(title = nil, author = nil, url = nil)
    @title = title
    @author = author
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
    Scraper.scrape_author_title.each {|book| Book.new(title = book[:title], author = nil, url = book[:url])}
  end

end
