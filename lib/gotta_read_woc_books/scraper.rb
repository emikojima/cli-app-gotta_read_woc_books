require 'pry'
class Scraper

  def self.scrape_from_url
    book_hash = {}
    books = []
    all_desc = []
    doc = Nokogiri::HTML(open("https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2"))
      doc.css(".v-glyph--m2 .graf--h4").map do |x|
        book_hash = {
         :title => x.css("strong").text, #.each {|s| s.split(" by ")}.each {|t| t.first}
         #:author => ta.each {|s| s.split(" by ")}.each {|t| t.last},
         :url => x.css("a").map {|a| a.attribute("href").text} # url = x.css("a").attr("href").value
        }
        books << book_hash unless book_hash[:title].empty? == true || books.include?(book_hash)
      end
      all_desc = doc.css(".graf--p.graf-after--h4").map do |x|
        all_desc << x.text
      end
      final = books.each_with_index do |book, i|
        all_desc.each do |d|
          books[i][:description] = d[i]
        end
      end
      final
  end

end

#:title => x.css("strong").text, #.each {|s| s.split(" by ")}.each {|t| t.first}
#:author => ta.each {|s| s.split(" by ")}.each {|t| t.last},
