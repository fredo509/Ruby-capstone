require_relative './src/options/book_options'
require_relative './src/classes/storage'

@storage = Storage.new('json', './db/json/')
@book_options = BookOptions.new
@book_options.book_ruby_objects = @storage.load_data('books')
book = @book_options.book_ruby_objects
puts book

def list_books
    @book_options.book_ruby_objects.each_with_index do |book, i|
      id = book["id"]
      publisher = book["publisher"]
      cover_state = book["cover_state"]
      publish_date = book["publish_date"]
      
      puts "[#{i}] ID: #{id} - Publisher: #{publisher} - Cover State: #{cover_state} - Publish Date: #{publish_date}"
    end
  end
  
  list_books
  
  