require_relative 'item'

class Music < Item
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify = true
  end
end
