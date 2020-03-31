require './lib/player'

RSpec.describe Player do
  context 'Create player instances' do
    it 'raise an ArgumentError if an integer was given' do
      expect { Player.new('23', 'X') }.to raise_error(ArgumentError, 'you can\'t have an Integer as name')
    end

    it 'raise an ArgumentError if a short name was given' do
      expect { Player.new('zac', 'O') }.to raise_error(ArgumentError, 'A name should at least contain 4 letters')
    end

    it 'make sure that an object is create with no errors' do
      expect(Player.new('Javier', 'X')).to be
    end
  end

  context '#inc_score' do
    it 'return a valid number of increments' do
      player = Player.new('Zack', 'O')

      player.inc_score
      player.inc_score
      player.inc_score

      expect(player.score).to eql(3)
    end
  end
end
