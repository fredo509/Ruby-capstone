require_relative 'item'

class Book < Item
  attr_accessor :cover_state
  attr_reader :publisher

  def initialize(publisher, cover_state, publish_date)
    super(nil, nil, nil, nil, publish_date)
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
