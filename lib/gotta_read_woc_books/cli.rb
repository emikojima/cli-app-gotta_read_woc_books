require_relative "../gotta_read_woc_books/scraper.rb"
class Cli

  def call
  puts "Welcome to the list of 46 books by women of color you've gotta read in 2018!"
  list_books
  more_info
  good_bye
  end

  #call scrape method => instantiate
  def list_books
    Scraper.scrape
    puts "Book in order of their release dates (by month):"
    Book.books
    #lists books here
  end

  def more_info
    input = nil
    until input == "bye"
      puts "Enter the number of the book you would like more information on (1-46) OR type 'list' to review the list OR type 'bye' to exit!"
      input = gets.strip.downcase
      case input
        when "1"
          puts "Here's more info on "
        when "2"
          puts "Here's more info on "
        when "list"
        list_books
        when "bye"
        good_bye
        else
          puts  "HMMMM... Please type 'list' for the list or 'bye' to exit"
      end
    end
  end

  def good_bye
      puts "See you for your next book!"
  end



end
