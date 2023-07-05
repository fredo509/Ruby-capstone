require_relative '../src/classes/item'

describe Item do
  context 'When publish-date is more than 10 years' do
    it 'move to archive should change archived to true' do
      book = Item.new('1993-06-26')
      book.move_to_archive
      expect(book.archived).to eq(true)
    end
  end

  context 'When publish-date is less than 10 years' do
    it 'move to archive should change archived to false' do
      book2 = Item.new('2019-06-26')
      book2.move_to_archive
      expect(book2.archived).to eq(false)
    end
  end
end
