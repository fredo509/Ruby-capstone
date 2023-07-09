require_relative '../classes/genre'
require_relative '../classes/convert_to_object'

class GenreOptions
  attr_accessor :genre_ruby_objects, :genres_instances_list

  def initialize
    @genres_instances_list = []
    @genre_ruby_objects = []
  end

  def fill_genres_instances_list
    return unless genre_ruby_objects.empty?

    @genre_ruby_objects.each do |genre|
      genre_instance = Genre.new(genre['name'])
      genre_instances_list.push(genre_instance)
    end
  end

  def list_genres
    puts "\n======================================================================".colorize(:light_red)
    puts "\n🔥 Listing genres... 🖋️".colorize(:light_white)
    sleep(0.5)
    puts ''
    if @genre_ruby_objects.empty?
      puts "\n======================================================================".colorize(:light_red)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '||                        No genres found 😿                        ||'
      puts '||                                                                  ||'.colorize(:light_red)
    else
      puts "There are #{@genre_ruby_objects.length} genres:"
      puts ''
      @genre_ruby_objects.each_with_index do |genre, index|
        puts "[#{index + 1}]".colorize(:light_red) + " #{genre['name']}"
      end
      puts ''
    end
    puts '======================================================================'.colorize(:light_red)
    puts ''
    sleep(0.5)
  end

  def select_a_genre(item)
    puts "\n🔥 Listing genres... 🖋️".colorize(:light_white)
    sleep(0.5)
    puts "\nPlease, select a genre 📖: ".colorize(:light_white)
    puts ''
    @genre_ruby_objects.each_with_index do |genre_hash, index|
      genre = Genre.new(genre_hash['name'])
      puts "[#{index + 1}]".colorize(:light_red) + " #{genre.name}"
    end
    puts ''
    print 'Please, choose a genre by number: '.colorize(:light_white)
    genre_index = gets.chomp.to_i
    genre = Genre.new(@genre_ruby_objects[genre_index - 1]['name'])
    genre.add_item(item)
  end

  def add_genre(item)
    puts "\nHow do you want to add a genre?"
    puts ''
    puts "#{'[1]'.colorize(:light_red)} Select from existing genres"
    puts "#{'[2]'.colorize(:light_red)}Create a new genre"
    option = gets.chomp.to_i

    case option
    when 1
      if @genre_ruby_objects.empty?
        puts "\n======================================================================".colorize(:light_red)
        puts '||                                                                  ||'.colorize(:light_red)
        puts '||               There are no genres to select from 😿             ||'
        puts '||                                                                  ||'.colorize(:light_red)
        puts '======================================================================'.colorize(:light_red)
        sleep(1)
        add_genre(item)
      else
        puts 'Please, select a genre:'
        select_a_genre(item)
      end
    when 2
      puts "\n📖 Enter genre name:"
      name = gets.chomp
      genre = Genre.new(name)
      @genres_instances_list << genre
      @genre_ruby_objects << ConvertToObject.instance_to_object(genre)
      genre.add_item(item)
    end
  end
end
