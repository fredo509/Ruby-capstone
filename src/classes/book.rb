require_relative 'item'

class Book < Item
  attr_accessor :cover_state
  attr_reader :publisher, :publish_date

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def publisher=(_publisher)
    raise NoMethodError, "Cannot set 'publisher' attribute."
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
