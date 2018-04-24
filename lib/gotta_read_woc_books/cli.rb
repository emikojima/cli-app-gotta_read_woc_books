require_relative "../gotta_read_woc_books/scraper.rb"
class Cli

  def call
  Book.create_from_scraper
  Book.url
  puts "Welcome to the list of #{Book.all.length.to_i} books by women of color you've gotta read in 2018!"
  list_books
  more_info
  good_bye
  end

  def list_books
    puts "Books in order of their release dates:"
    Book.books
  end

  def more_info
    input = nil
    until input == "bye"
      puts "Enter the number of the book you would like more information on (1-46) OR type 'list' to review the list OR type 'bye' to exit!"
      input = gets.strip.downcase
      if (1..Book.all.length.to_i) === input.to_i
        puts "Book # #{input}. GREAT CHOICE! Here's more information on that book!"
        puts "BOOK TITLE AND AUTHOR: #{Book.all[input.to_i-1].title}."
        puts " "
        puts "BOOK DESCRIPTION: #{Scraper.scrape_description[input.to_i-1]}"
        puts " "
        puts "BUY IT HERE: #{Book.all[input.to_i-1].url}"
        puts " "
      elsif input == "list"
        list_books
      elsif input == "bye"
        " "
      else
        puts  "HMMMM... Please type 'list' for the list or 'bye' to exit"
      end
    end
  end

  def good_bye
      puts "See you for your next book!"
  end

end
