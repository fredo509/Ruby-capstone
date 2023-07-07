require_relative '../classes/label'

class LabelOptions
  attr_accessor :label_ruby_objects, :labels_instances_list

  def initialize
    @labels_instances_list = []
    @label_ruby_objects = []
  end

  def fill_labels_instances_list
    return unless label_ruby_objects.empty?

    @label_ruby_objects.each do |label|
      label_instance = Label.new(label["title"], label["color"])
      label_instances_list.push(label_instance)
    end
  end

  def to_ruby_object(label)
    {
      'id' => label.id,
      'title' => label.title,
      'color' => label.color
    }
  end

  def list_labels
    puts "\n======================================================================".colorize(:light_red)
    puts "\n🔥 Listing labels... 🖋️"
    sleep(0.5)
    puts ''
    if @label_ruby_objects.empty?
      puts "\n======================================================================".colorize(:light_red)
      puts '||                                                                  ||'.colorize(:light_red)
      puts '||                        No labels found 😿                        ||'
      puts '||                                                                  ||'.colorize(:light_red)
    else
      puts "There are #{@label_ruby_objects.length} labels:"
      puts ''
      @label_ruby_objects.each_with_index do |label, index|
        puts "[#{index + 1}]".colorize(:light_red) + " #{label['title']} #{label['color']}"
      end
      puts ''
    end
    puts '======================================================================'.colorize(:light_red)
    puts ''
    sleep(0.5)
  end

  def select_a_label(item)
    puts "\n🔥 Listing labels... 🖋️".colorize(:light_white)
    sleep(0.5)
    puts "\nPlease, select a label 📖: ".colorize(:light_white)
    puts ''
    @label_ruby_objects.each_with_index do |label_hash, index|
      label = Label.new(label_hash['title'], label_hash['color'])
      puts "[#{index + 1}]".colorize(:light_red) + " #{label.title} #{label.color}"
    end
    puts ''
    print 'Please, choose a label by number: '.colorize(:light_white)
    label_index = gets.chomp.to_i
    label = Label.new(@label_ruby_objects[label_index - 1]['title'], @label_ruby_objects[label_index - 1]['color'])
    label.add_item(item)
  end

  def add_label(item)
    puts "\nHow do you want to add a label?".colorize(:light_white)
    puts ''
    puts '[1]'.colorize(:light_red) + 'Select from existing labels'.colorize(:light_white)
    puts '[2]'.colorize(:light_red) + 'Create a new label'.colorize(:light_white)
    option = gets.chomp.to_i

    case option
    when 1
      if @label_ruby_objects.empty?
        puts "\n======================================================================".colorize(:light_red)
        puts '||                                                                  ||'.colorize(:light_red)
        puts '||               There are no labels to select from 😿             ||'
        puts '||                                                                  ||'.colorize(:light_red)
        puts '======================================================================'.colorize(:light_red)
        sleep(1)
        add_label(item)
      else
        puts 'Please, select a label:'
        select_a_label(item)
      end
    when 2
      puts "\n📖 Enter label title:"
      title = gets.chomp
      puts "\n📖 Enter label color:"
      color = gets.chomp
      label = Label.new(title, color)
      @labels_instances_list << label
      @label_ruby_objects << to_ruby_object(label)
      label.add_item(item)
    end
  end
end
