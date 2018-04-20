require 'pry'
require 'nokogiri'
require 'open-uri'

class BookScraper

  def web_page
    index_url= https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2
    doc = Nokogiri::HTML(open(index_url))
    binding.pry
     x = doc.css(".section-inner sectionLayout--insetColumn")
  end

end
