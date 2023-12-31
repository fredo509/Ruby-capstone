require_relative '../src/classes/label'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
    @item = Item.new('2021/1/1')
  end

  describe '#new' do
    it 'will create a new label' do
      expect(@label).to be_instance_of(Label)
    end
  end

  describe '#add_item' do
    it 'will add an item to the label' do
      @label.add_item(@item)
      expect(@label.items[0]).to be(@item)
    end
    it 'will add the label to the item' do
      @label.add_item(@item)
      expect(@item.label).to be(@label)
    end
  end
end
