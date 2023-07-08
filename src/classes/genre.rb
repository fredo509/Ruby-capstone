class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    raise TypeError, 'Invalid type, must be an Item instance' unless item.is_a?(Item)

    @items << item
    item.genre = self
  end
end
