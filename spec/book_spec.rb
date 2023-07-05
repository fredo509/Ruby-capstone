require_relative '../src/classes/book'

describe Book do
  before :each do
    @book = Book.new('publisher', 'cover_state', '2022/2/3')
  end

  describe '#new' do
    it 'will create a new book' do
      expect(@book).to be_instance_of(Book)
    end
    it 'will throw and error without three arguments' do
      expect { Book.new('Publisher', 'CoverState') }.to raise_error(ArgumentError)
    end
    it 'will have all properties' do
      expect(@book.cover_state).to eq('cover_state')
      expect(@book.publisher).to eq('publisher')
    end
    it 'have cover_state setable' do
      @book.cover_state = 'good'
      expect(@book.cover_state).to eq('good')
    end
    it 'should not have publisher setable' do
      expect { @book.publisher = 'salman' }.to raise_error NameError
    end
  end

  describe '#can_be_archived?' do
    it 'return true if date is older than 10 years' do
      book = Book.new('publisher', 'cover_state', '2009/1/1')
      expect(book.can_be_archived?).to be_truthy
    end
    it 'return true if cover state is bad' do
      book = Book.new('publisher', 'bad', '2021/1/1')
      expect(book.can_be_archived?).to be_truthy
    end
    it 'should return false if date is not older than 10 years and cover_state is not bad' do
      book = Book.new('publisher', 'good', '2021/1/1')
      expect(book.can_be_archived?).to be_falsy
    end
  end
end
