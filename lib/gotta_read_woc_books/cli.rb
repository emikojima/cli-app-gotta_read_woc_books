class GottaReadWocBooks::CLI

  def call
    puts "Welcome to the list of 46 books by women of color you've gotta read in 2018!"
  list_books
  more_info
  good_bye
  end

  def list_books
    puts "Here are the books in order of release date:"
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
    else
      puts  "HMMMM... Please type 'list' for the list or 'bye' to exit"
    end
    end
  end

  def good_bye
      puts "See you for your next book!"
  end



end
