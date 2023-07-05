require_relative '../classes/label'

class AddItem
  def make_item(item_type)
    puts "Creating a new #{item_type}...\n\n"

    print 'What date was it published on? (YYYY-MM-DD) '
    gets.chomp
  end

  def answer_yes?
    answer = gets.chomp
    until %w[y yes n no true false].include?(answer.downcase)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp
    end
    %w[y yes true].include?(answer.downcase)
  end

  def add?(item)
    puts
    print "Would you like to add #{item}? [Y/N] "
    answer_yes?
  end

  def more(item, app)
    print 'Would you like to add more details? [Y/N] '
    return unless answer_yes?

    more_label(item, app) if add?('a label')
  end

  def more_label(item, app)
    puts "What is the label's title? "
    title = gets.chomp
    puts "What is the label's color? "
    color = gets.chomp

    label = app.labels.find { |lab| lab.title == title && lab.color == color }
    if label
      item.add_label(label)
    else
      label = Label.new(title, color)
      item.add_label(label)
      app.labels << label
    end
  end
end
