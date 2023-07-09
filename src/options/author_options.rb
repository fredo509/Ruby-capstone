require_relative '../classes/author'
require_relative '../classes/convert_to_object'

class AuthorOptions
  attr_accessor :author_ruby_objects, :authors_instances_list

  def initialize
    @authors_instances_list = []
    @author_ruby_objects = []
  end

  def fill_authors_instances_list
    return unless author_ruby_objects.empty?

    @author_ruby_objects.each do |author|
      author_instance = Author.new(author['first_name'], author['last_name'])
      author_instances_list.push(author_instance)
    end
  end

  def list_authors
    puts "\n======================================================================".colorize(:light_red)
    puts "\n🔥 Listing authors... 🖋️"
    sleep(0.5)
    puts ''
    if @author_ruby_objects.empty?
      puts "\n======================================================================".colorize(:light_red)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '||                        No authors found 😿                       ||'
      puts '||                                                                  ||'.colorize(:light_red)
    else
      puts "There are #{@author_ruby_objects.length} authors:"
      puts ''
      @author_ruby_objects.each_with_index do |author, index|
        puts "[#{index + 1}]".colorize(:light_red) + " #{author['first_name']} #{author['last_name']}".colorize(:light_white)
      end
      puts ''
    end
    puts '======================================================================'.colorize(:light_red)
    puts ''
    sleep(0.5)
  end

  def select_an_author(item)
    puts "\n🔥 Listing authors... 🖋️".colorize(:light_white)
    sleep(0.5)
    puts "\nPlease, select an author 📖: ".colorize(:light_white)
    puts ''
    @author_ruby_objects.each_with_index do |author, index|
      puts "[#{index + 1}]".colorize(:light_red) + "#{author['first_name']} #{author['last_name']}"
    end
    puts ''
    print 'Please, choose author by number: '.colorize(:light_white)
    author_index = gets.chomp.to_i
    author = Author.new(@author_ruby_objects[author_index - 1]['first_name'], @author_ruby_objects[author_index - 1]['last_name'])
    author.add_item(item)
  end

  def add_author(item)
    puts "\nHow do you want to add an author?".colorize(:light_white)
    puts ''
    puts "#{'[1]'.colorize(:light_red)} Select from existing authors"
    puts "#{'[2]'.colorize(:light_red)}Create a new author"
    option = gets.chomp.to_i

    case option
    when 1
      if @author_ruby_objects.empty?
        puts "\n======================================================================".colorize(:light_red)
        puts '||                                                                  ||'.colorize(:light_red)
        puts '||               There are no authors to select from 😿             ||'
        puts '||                                                                  ||'.colorize(:light_red)
        puts '======================================================================'.colorize(:light_red)
        sleep(0.5)
        add_author(item)
      else
        puts 'Please, select an author:'
        select_an_author(item)
      end
    when 2
      puts "\n📖 Enter author first name:"
      first_name = gets.chomp
      puts "\n📖 Enter author last name:"
      last_name = gets.chomp
      author = Author.new(first_name, last_name)
      @authors_instances_list << author
      @author_ruby_objects << ConvertToObject.instance_to_object(author)
      author.add_item(item)
    end
  end
end
