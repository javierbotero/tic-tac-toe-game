class Board
  attr_reader :board

  def initialize
    @board = ['', '', '', '', '', '', '', '', '']
  end

  def add_marker(symbol, index)
    raise ArgumentError, 'Error: Square already filled, try again' unless @board[index - 1].empty?

    @board[index - 1] = symbol
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/PerceivedComplexity
  def winner
    i = 0

    while i < @board.length
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
