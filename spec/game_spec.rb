require_relative '../game'
require_relative '../author'

describe Game do
  let(:author) { Author.new('Shigeru', 'Miyamoto') }
  let(:game) { Game.new('Fantasy', author, 'The Legend of Zelda', 'Nintendo', '1986-02-21', false, '2020-02-02') }
  context 'When initialized' do
    it 'Should have a random id' do
      random_id = 51
      allow(Random).to receive(:rand).and_return(random_id)
      expect(game.id).to eq(random_id)
    end

    it 'Should have a genre' do
      expect(game.genre).to eq('Fantasy')
    end

    it 'Should have an author' do
      expect(game.author).to eq(author)
    end

    it 'Author should be instance of Author' do
      expect(game.author).to be_instance_of(Author)
    end

    it 'Should have a source' do
      expect(game.source).to eq('The Legend of Zelda')
    end

    it 'Should have a label' do
      expect(game.label).to eq('Nintendo')
    end

    it 'Should have a publish date' do
      expect(game.publish_date).to eq(Date.parse('1986-02-21'))
    end

    it 'Should have a multiplayer' do
      expect(game.multiplayer).to eq(false)
    end

    it 'Should have a last played at' do
      expect(game.last_played_at).to eq(Date.parse('2020-02-02'))
    end
  end
end