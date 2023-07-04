require_relative '../../item'
class MusicAlbum < Item
  attr_reader :on_spotify, :id

  def initialize(publish_date, on_spotify)
    @on_spotify = on_spotify
    super(publish_date)
  end

  private

  def can_be_archived?
    @on_spotify && super
  end
end
