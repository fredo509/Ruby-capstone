class Main
  def initialize
    show_console_options
  end

  def show_console_options
    options_array = ["List all books", "List all music albums", "list all movies", "List all games", "List all genres",
                     "List all labels", "List all authors", "List all sources", "Add book", "Add a music album", "Add movie", "Add a game"]
    puts "\nWelcome to the Ruby Console App!"
    puts "\nPlease choose an option from the list below:"
    puts "-------------------------------------------"
    options_array.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end
end

Main.new