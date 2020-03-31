require './lib/board'

RSpec.describe Board do
  let(:empty_arr) { ['', '', '', '', '', '', '', '', ''] }

  context 'Create Board instances' do
    it 'make sure that at the beginning we get an empty array' do
      expect(Board.new.board).to eql(empty_arr)
    end
  end
  
  context '#add_marker' do
    let(:board) { Board.new }

    it 'raise an ArgumentError if we tried to add a marker in the same index multiple times' do
      board.add_marker('X', 1)
      expect { board.add_marker('X', 1) }.to raise_error( ArgumentError, 'Error: Square already filled, try again')
    end

    it 'change the board array by adding a new symbol to it' do
      board.add_marker('X', 1)
      expect(board.board).not_to eql(empty_arr)
    end
  end

  context '#winner' do
    
  end
end