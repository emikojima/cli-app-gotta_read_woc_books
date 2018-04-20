require 'pry'
class Scraper
  attr_accessor :book, :title, :author

  def self.scrape
    scrape_author_title
    books = []
    doc = Nokogiri::HTML(open("https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2"))
  end

  def self.scrape_author_title
    book_hash = {}
    doc = Nokogiri::HTML(open("https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2"))
    v = doc.css(".v-glyph--m2 .graf--h4").map {|x| x.css("strong").text}.map {|s| s.split(" by ")}.delete_if {|x| x.empty? == true}

        book_hash = {
        :title => v.map {|x| x[0]},
        :author => v.map {|x| x[1]}
        }
        binding.pry
  end
#       doc.css(".v-glyph--m2 .graf--h4").each do |x|
#         book_hash = {
#           :title_and_author = x.css("strong").text
#           # tasplit = title_and_author.map {|s| s.split(" by ")}
#           # tasplit.delete_if {|x| x.empty? == true}
#           # :title => tasplit.each {|t| t[0]},
#           # :author => tasplit.each {|t| t[1]}
# !!!v = doc.css(".v-glyph--m2 .graf--h4").map {|x| x.css("strong").text}.map {|s| s.split(" by ")}.delete_if {|x| x.empty? == true}
#        !!! {:title => v.map {|x| x[0]}}
#!!!{:author => v.map {|x| x[1]} }

# binding.pry
#       end
#       book_hash
     # title_and_author = x.map {|t| t.css("strong").text}
     # tasplit = title_and_author.map {|s| s.split(" by ")}  title=> tasplit[0] author=> tasplit[1]
     # tasplit.delete_if {|x| x.empty? == true}
     # url = x.css("a").attr("href").value
     # descriptions= doc.css(".graf--p.graf-after--h4")  descriptions.map {|desc| desc.text}

#title_and_author = doc.css(".v-glyph--m2 .graf--h4").map {|x| x.css("strong").text}





end
