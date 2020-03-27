class TicTacToe
  attr_accessor :player_x, :player_o
  attr_reader :board

  def initialize(player1, player2)
    @player_x = player1
    @player_o = player2
    @board = ['', '', '', '', '', '', '', '', '']
  end

  def add_marker(player, index)
    raise ArgumentError, 'Error: Square already filled, try again' unless @board[index - 1].empty?

    @board[index - 1] = player == @player_x ? 'X' : 'O'
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def winner
    i = 0

    while i < 9
      if @board[i] == @board[i + 1] && @board[i + 1] == @board[i + 2]
        return @board[i] unless @board[i].empty?
      elsif @board[i] == @board[i + 3] && @board[i + 3] == @board[i + 6]
        return @board[i] unless @board[i].empty?
      end

      i += 3
    end

    if (@board[0] == @board[4] && @board[4] == @board[8]) || (@board[2] == @board[4] && @board[4] == @board[6])
      return @board[4] unless @board[4].empty?
    end

    false
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
