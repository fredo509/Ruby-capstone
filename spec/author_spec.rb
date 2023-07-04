require_relative '../author'
require_relative '../item'

RSpec.describe Author do
  let(:author) { Author.new('J.K', 'Rowling') }
  let(:item) { Item.new('fantasy', 'none', 'amazon', 'scholastic', '1993-06-26') }

  context 'When author is initialized' do
    it 'should have a first name' do
      expect(author.first_name).to eq('J.K')
    end

    it 'should have a last name' do
      expect(author.last_name).to eq('Rowling')
    end

    it 'should have a random id' do
      random_id = 42

      allow(Random).to receive(:rand).and_return(random_id)

      expect(author.id).to eq(random_id)
    end
  end
  
  describe '#add_item' do
    context 'When add item to author' do
      it 'should take an instance of the Item class as an input' do
        author.add_item(item)
        expect(author.items).to eq([item])
      end
  
      it 'should raise an error if the input is not an instance of the Item class' do
        expect { author.add_item('item') }.to raise_error(TypeError)
      end
  
      it 'should add self as a property of the item object' do
        author.add_item(item)
        expect(item.author).to eq(author)
      end
    end
  end
end
