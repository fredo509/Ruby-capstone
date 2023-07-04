require_relative '../author'

describe Author do
  let(:author) { Author.new('J.K', 'Rowling') }

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
end
