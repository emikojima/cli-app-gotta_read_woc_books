require_relative "../gotta_read_woc_books/scraper.rb"
class Cli

  def call
  Book.create_from_scraper
  puts "Welcome to the list of 46 books by women of color you've gotta read in 2018!"
  list_books
  more_info
  good_bye
  end

  #call scrape method => instantiate
  def list_books
    puts "Books in order of their release dates (by month):"
    Book.books
    #lists books here
  end

  def more_info
    input = nil
    until input == "bye"
      puts "Enter the number of the book you would like more information on (1-46) OR type 'list' to review the list OR type 'bye' to exit!"
      input = gets.strip.downcase
      if (1..Book.all.length.to_i) === input.to_i
      puts "#{Book.all[input.to_i-1].title}. #{Scraper.scrape_description[input.to_i-1]} BUY HERE: #{Book.all[input.to_i-1].url}"
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
