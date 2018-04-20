
class Scraper

  def web_page

    doc = Nokogiri::HTML(open("https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2"))
binding.pry
     x = doc.css(".section-inner sectionLayout--insetColumn")
  end


end
