require 'date'

class Item
  attr_accessor :archived, :author
  attr_reader :id, :genre, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1...1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = Date.parse(publish_date)
    @archived = false
  end

  def can_be_archived?
    (Date.today - @publish_date).to_i > (10 * 365)
  end

  def move_to_archive
    @archived = if can_be_archived?
                  true
                else
                  false
                end
  end
end