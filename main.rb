require_relative './src/options/game_options'
require_relative './src/options/book_options'
require_relative './src/options/music_options'
require_relative './src/options/genre_options'
require_relative './src/options/label_options'
require_relative './src/options/author_options'
require_relative './src/classes/storage'


class Main
  attr_accessor :items, :labels, :genre

  def initialize
    @game_options = GameOptions.new
    @author_options = AuthorOptions.new
    @book_options = BookOptions.new
    @label_options = LabelOptions.new
    @music_options = MusicOptions.new
    @genre_options = GenreOptions.new
    # @musicgenre_option = MusicGenreOptions.new
    @storage = Storage.new('json', './db/json/')
    @game_options.game_ruby_objects = @storage.load_data('games')
    @book_options.book_ruby_objects = @storage.load_data('books')
    @music_options.music_ruby_objects = @storage.load_data('music')
    @author_options.author_ruby_objects = @storage.load_data('authors')
    
    @author_options.fill_authors_instances_list
    @label_options.label_ruby_objects = @storage.load_data('labels')
    @genre_options.genre_ruby_objects = @storage.load_data('genre')
    @label_options.fill_labels_instances_list
    @genre_options.fill_genres_instances_list
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
    music_ruby_objects = @music_options.music_ruby_objects
    genre_ruby_objects = @genre_options.genre_ruby_objects

    @storage.save_data('games', game_ruby_objects)
    @storage.save_data('authors', author_ruby_objects)
    @storage.save_data('labels', label_ruby_objects)
    @storage.save_data('books', book_ruby_objects)
    @storage.save_data('music', music_ruby_objects)
    @storage.save_data('genre', genre_ruby_objects)
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
    puts "-------------------------------------------"
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
       @music_options.list_musics
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
      @genre_options.list_genres
      sleep(0.5)
      show_console_options
    when 6
      @label_options.list_labels
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
      @book_options.add_book(@label_options, @author_options)
      sleep(0.5)
      show_console_options
    when 10
     @music_options.add_music(@genre_options, @author_options)
      sleep(0.5)
      show_console_options
    when 11
      puts 'future method 11'
      sleep(0.5)
      show_console_options
    when 12
      @game_options.add_game(@author_options, @label_options)
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
