require 'date'

class Item
  attr_accessor :archived, :label, :genre, :author, :source, :id

  def initialize(publish_date)
    @id = Random.rand(1...1000)
    @publish_date = Date.parse(publish_date)
    @archived = false
    @label = nil
  end

  def can_be_archived?
    (Date.today - @publish_date).to_i > (10 * 365)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def add_label(label)
    @label = label
  end
end
