require_relative "../classes/author"

class AuthorOptions
    attr_reader :authors_objects_list

    def initialize
      @authors_instances_list = []
      @authors_objects_list = []
    end
  
    def to_ruby_object(author)
      {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name,
        archived: author.items
      }
    end

    def list_authors
      puts "\n======================================================================"
      puts "\n🔥 Listing authors... 🖋️"
      sleep(0.5)
      puts ""
      if @authors_objects_list.empty?
        puts "\n======================================================================"
        puts "||                                                                  ||"
        puts "||                        No authors found 😿                       ||"
        puts "||                                                                  ||"
      else
        puts "There are #{authors_objects_list.length} authors:"
        puts ""
        @authors_objects_list.each_with_index do |author, index|
          puts "[#{index + 1}] #{author[:first_name]} #{author[:last_name]}"
        end
        puts ""
      end
      puts "======================================================================"
      puts ""
      sleep(0.5)
    end
  
    def select_an_author(item)
      puts "\n🔥 Listing authors... 🖋️"
      sleep(0.5)
      puts "\nPlease, select an author 📖: "
      puts ""
      @authors_objects_list.each_with_index do |author, index|
        puts "[#{index + 1}] #{author[:first_name]} #{author[:last_name]}"
      end
      puts ""
      print "Please, choose author by number: "
      author_index = gets.chomp.to_i
      author = @authors_instances_list[author_index - 1]
      author.add_item(item)
    end
  
    def add_author(item)
      puts "\nHow do you want to add an author?"
      puts ""
      puts "[1] Select from existing authors"
      puts "[2] Create a new author"
      option = gets.chomp.to_i
  
      case option
      when 1
        if @authors_objects_list.empty?
          puts "\n======================================================================"
          puts "||                                                                  ||"
          puts "||               There are no authors to select from 😿             ||"
          puts "||                                                                  ||"
          puts "======================================================================"
          sleep(1)
          add_author(item)
        else
          puts "Please, select an author:"
          select_an_author(item)
        end
      when 2
        puts "\n📖 Enter author first name:"
        first_name = gets.chomp
        puts "\n📖 Enter author last name:"
        last_name = gets.chomp
        author = Author.new(first_name, last_name)
        @authors_instances_list << author
        @authors_objects_list << to_ruby_object(author)
        author.add_item(item)
      end
    end

  end
  