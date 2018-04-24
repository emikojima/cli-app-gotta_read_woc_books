require 'pry'
class Scraper
  attr_accessor :book, :title, :book_hash
  def self.scrape
    scrape_author_title
    scrape_description
  end

  def self.scrape_author_title
    doc = Nokogiri::HTML(open("https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2"))
    book_hash = {}
    ta = []
    books = []
      doc.css(".v-glyph--m2 .graf--h4").each do |x|
      book_hash = {
       :title => x.css("strong").text, #.each {|s| s.split(" by ")}.each {|t| t.first}
       #:author => ta.each {|s| s.split(" by ")}.each {|t| t.last},
       :url => x.css("a").map {|a| a.attribute("href").text} # url = x.css("a").attr("href").value
      }
      books << book_hash unless book_hash[:title].empty? == true || books.include?(book_hash)
      end
      books
  end

  def self.scrape_description
    doc = Nokogiri::HTML(open("https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2"))
     all_desc = []
     doc.css(".graf--p.graf-after--h4").map do |x|
     all_desc << x.text
    end
    all_desc
  end

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

# def self.scrape_author_title
#   title_hash = {}
#   doc = Nokogiri::HTML(open("https://electricliterature.com/46-books-by-women-of-color-to-read-in-2018-70a0bf5bf4f2"))
#   v = doc.css(".v-glyph--m2 .graf--h4").map {|x| x.css("strong").text}.map {|s| s.split(" by ")}.delete_if {|x| x.empty? == true}
# doc.css(".v-glyph--m2 .graf--h4").map do |x|
#   book_hash = {
#   :title =>
# x.css("strong").text}.map {|s| s.split(" by ")}.delete_if {|x| x.empty? == true}.map {|x| x[0]}
# }
# end
#
#       book_hash = {
#       :title => v.map {|x| x[0]},
#       :author => v.map {|x| x[1]},
#       #:url =>  doc.css(".v-glyph--m2 .graf--h4 a").map {|x|x.attr("href")}
#       }
# end
