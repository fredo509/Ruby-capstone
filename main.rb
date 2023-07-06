require_relative './src/options/game_options'
require_relative './src/options/book_options'
require_relative './src/options/label_options'
require_relative './src/options/author_options'
require_relative './src/classes/storage'

class Main
  attr_accessor :items, :labels

  def initialize
    @game_options = GameOptions.new
    @author_options = AuthorOptions.new
    @book_options = BookOptions.new
    @label_options = LabelOptions.new
    @storage = Storage.new('json', './db/json/')
    @game_options.game_ruby_objects = @storage.load_data('games')
    @book_options.book_ruby_objects = @storage.load_data('books')
    @author_options.author_ruby_objects = @storage.load_data('authors')
    @author_options.fill_authors_instances_list
    @label_options.label_ruby_objects = @storage.load_data('labels')
    @label_options.fill_labels_instances_list
    puts '╔══════════════════════════════════════════════════════════════╗'
    puts '║                                                              ║'
    puts '║                   WELLCOME TO MY CATALOG!                    ║'
    puts '║                                                              ║'
    puts '╚══════════════════════════════════════════════════════════════╝'
    sleep(0.5)
    show_console_options
  end

  def save_data
    game_ruby_objects = @game_options.game_ruby_objects
    author_ruby_objects = @author_options.author_ruby_objects
    label_ruby_objects = @label_options.label_ruby_objects
    book_ruby_objects = @book_options.book_ruby_objects

    @storage.save_data('games', game_ruby_objects)
    @storage.save_data('authors', author_ruby_objects)
    @storage.save_data('labels', label_ruby_objects)
    @storage.save_data('books', book_ruby_objects)
  end

  def show_console_options
    options_array = ['List all books', 'List all music albums', 'List all movies', 'List all games', 'List all genres',
                     'List all labels', 'List all authors', 'List all sources', 'Add book', 'Add a music album', 'Add movie',
                     'Add a game', 'Exit']

    puts "\nPlease choose an option from the list below:"
    puts '-------------------------------------------'
    options_array.each_with_index do |option, index|
      puts "#{index + 1}. #{option}"
    end
    option = get_user_input('Enter your choice: ').to_i
    select_option(option)
  end

  def select_option(option)
    case option
    when 1
      @book_options.list_books
      sleep(0.5)
      show_console_options
    when 2
      puts 'future method 2'
      sleep(0.5)
      show_console_options
    when 3
      puts 'future method 3'
      sleep(0.5)
      show_console_options
    when 4
      @game_options.list_games
      sleep(0.5)
      show_console_options
    when 5
      puts 'future method 5'
      sleep(0.5)
      show_console_options
    when 6
      @label_options.list_labels
      puts 'future method 6'
      sleep(0.5)
      show_console_options
    when 7
      @author_options.list_authors
      sleep(0.5)
      show_console_options
    when 8
      puts 'future method 8'
      sleep(0.5)
      show_console_options
    when 9
      @book_options.add_book(@label_options)
      sleep(0.5)
      show_console_options
    when 10
      puts 'future method 10'
      sleep(0.5)
      show_console_options
    when 11
      puts 'future method 11'
      sleep(0.5)
      show_console_options
    when 12
      @game_options.add_game(@author_options)
      sleep(0.5)
      show_console_options
    when 13
      puts 'Exit'
      save_data
    else
      puts '-------------------------------------------'
      puts "\nInvalid option, try again!"
      puts "\n-------------------------------------------"
      sleep(0.5)
      show_console_options
    end
  end

  def get_user_input(prompt)
    print prompt
    gets.chomp
  end
end

Main.new
