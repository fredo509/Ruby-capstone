require_relative 'item'

class Music < Item
  attr_reader :on_spotify, :name, :id
  attr_accessor :archived

  def initialize(name, publish_date, on_spotify)
    super(publish_date)
    @id = rand(1...100)
    @on_spotify = on_spotify
    @name = name
    @archived = can_be_archived?
  end

  def can_be_archived?
    super && @on_spotify = true
  end
end
