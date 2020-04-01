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
  # rubocop:disable Metrics/MethodLength

  def winner
    i = 0
    j = 0

    while i < @board.length
      row_check = @board[i] == @board[i + 1] && @board[i + 1] == @board[i + 2]

      if row_check
        return @board[i] unless @board[i].empty?
      end

      i += 3
    end

    while j < @board.length
      column_check = @board[j] == @board[j + 3] && @board[j + 3] == @board[j + 6]

      if column_check
        return @board[j] unless @board[j].empty?
      end

      j += 1
    end

    back_diagonal = @board[0] == @board[4] && @board[4] == @board[8]
    forward_diagonal = @board[2] == @board[4] && @board[4] == @board[6]

    if back_diagonal || forward_diagonal
      return @board[4] unless @board[4].empty?
    end

    false
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
