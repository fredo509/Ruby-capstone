require_relative 'game_options'
require_relative 'add_book'

class Main
  attr_accessor :items, :labels

  def initialize
    @game_options = GameOptions.new
    @items = []
    @labels = []
    show_console_options
    option = get_user_input('Enter your choice: ').to_i
    select_option(option)
  end

  def show_console_options
    options_array = ['List all books', 'List all music albums', 'List all movies', 'List all games', 'List all genres',
                     'List all labels', 'List all authors', 'List all sources', 'Add book', 'Add a music album', 'Add movie',
                     'Add a game', 'Exit']
    puts "\nWelcome to the Ruby Console App!"
    puts "\nPlease choose an option from the list below:"
    puts '-------------------------------------------'
    options_array.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
  end

  def select_option(option)
    case option
    when 1
      list_books = ListBooks.new
      list_books.list_books(@items)
      sleep(1)
      Main.new
    when 2
      puts 'future method 2'
      sleep(1)
      Main.new
    when 3
      puts 'future method 3'
      sleep(1)
      Main.new
    when 4
      @game_options.list_games
      Main.new
    when 5
      puts 'future method 5'
      sleep(1)
      Main.new
    when 6
      list_labels = ListLabels.new
      list_labels.list_labels(@labels)
      puts 'future method 6'
      sleep(1)
      Main.new
    when 7
      puts 'future method 7'
      sleep(1)
      Main.new
    when 8
      puts 'future method 8'
      sleep(1)
      Main.new
    when 9
      add_book = AddBook.new
      add_book.make_item(self)
      sleep(1)
      Main.new
    when 10
      puts 'future method 10'
      sleep(1)
      Main.new
    when 11
      puts 'future method 11'
      sleep(1)
      Main.new
    when 12
      puts 'future method 12'
      sleep(1)
      Main.new
    when 13
      puts 'Exit'
    else
      puts '-------------------------------------------'
      puts "\nInvalid option, try again!"
      puts "\n-------------------------------------------"
      sleep(1)
      Main.new
    end
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end
end

Main.new
