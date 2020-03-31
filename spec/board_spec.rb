require './lib/board'

RSpec.describe Board do
  let(:empty_arr) { ['', '', '', '', '', '', '', '', ''] }
  let(:board) { Board.new }

  context 'Create Board instances' do
    it 'make sure that at the beginning we get an empty array' do
      expect(Board.new.board).to eql(empty_arr)
    end
  end

  context '#add_marker' do
    it 'raise an ArgumentError if we tried to add a marker in the same index multiple times' do
      board.add_marker('X', 1)
      expect { board.add_marker('X', 1) }.to raise_error(ArgumentError, 'Error: Square already filled, try again')
    end

    it 'change the board array by adding a new symbol to it' do
      board.add_marker('X', 1)
      expect(board.board).not_to eql(empty_arr)
    end
  end

  context '#winner' do
    it 'Checks if a row is completed with one same letter' do
      board.add_marker('X', 1)
      board.add_marker('X', 2)
      board.add_marker('X', 3)
      expect(board.winner).to eql('X')
    end

    it 'Checks if a column is completed with one same letter' do
      board.add_marker('O', 1)
      board.add_marker('O', 4)
      board.add_marker('O', 7)
      expect(board.winner).to eql('O')
    end

    it 'Checks if a inclined line is completed with one same letter' do
      board.add_marker('Y', 1)
      board.add_marker('Y', 5)
      board.add_marker('Y', 9)
      expect(board.winner).to eql('Y')
    end

    it 'Makes sure that throw false in case the inclined line does not have same letters' do
      board.add_marker('O', 1)
      board.add_marker('X', 5)
      board.add_marker('O', 9)
      expect(board.winner).to eql(false)
    end
  end
end
