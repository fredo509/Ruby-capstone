require_relative '../classes/book'
require_relative 'label_options'
require_relative 'author_options'
require_relative '../classes/convert_to_object'

class BookOptions
  attr_accessor :book_instances, :book_ruby_objects

  def initialize
    @book_instances = []
    @book_ruby_objects = []
  end

  def list_books
    puts "\n======================================================================".colorize(:light_red)
    puts "\n🚀 Listing books... 🎮".colorize(:light_white)
    puts ''
    sleep(0.5)
    if @book_ruby_objects.empty?
      puts "\n======================================================================".colorize(:light_red)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '||                         No books found 😿                        ||'
      puts '||                                                                  ||'.colorize(:light_red)
      puts '======================================================================'.colorize(:light_red)
    else
      @book_ruby_objects.each_with_index do |book, i|
        id = book['id']
        publisher = book['publisher']
        cover_state = book['cover_state']
        publish_date = book['publish_date']

        puts "[#{i}]".colorize(:light_red) + " ID: #{id} - Publisher: #{publisher} - Cover State: #{cover_state}
        - Publish Date: #{publish_date}".colorize(:light_white)
      end
      puts "\n======================================================================".colorize(:light_red)
    end
    puts ''
  end

  def add_book(label_options, author_options, genre_options)
    puts ''
    puts '🚀 Adding a book... 🎮'
    sleep(0.5)
    puts "\n======================================================================".colorize(:light_red)
    puts ''
    puts 'What is the name of the book?'.colorize(:light_white)
    book_name = gets.chomp
    puts 'What is the publisher name'.colorize(:light_white)
    publisher = gets.chomp
    puts 'What is the publish date? (YYYY-MM-DD)'.colorize(:light_white)
    publish_date = gets.chomp
    new_book = Book.new(book_name, publisher, publish_date)
    genre_options.add_genre(new_book)
    label_options.add_label(new_book)
    author_options.add_author(new_book)
    @book_ruby_objects.push(ConvertToObject.instance_to_object(new_book))
    sleep(0.3)
    puts "\n======================================================================".colorize(:light_red)
    puts '||                                                                  ||'.colorize(:light_red)
    puts '||                          😺 Author added! 📕                     ||'
    puts '||                          😺 Label added! 📕                      ||'
    sleep(0.3)
    puts '||                          🕹️ Book was added! 😼                    ||'
    puts '||                                                                  ||'.colorize(:light_red)
    puts '======================================================================'.colorize(:light_red)
    puts ''
  end
end
