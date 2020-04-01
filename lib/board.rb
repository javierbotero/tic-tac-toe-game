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
      row_check = @board[i] == @board[i + 1] && @board[i + 1] == @board[i + 2]
      column_check = @board[i] == @board[i + 3] && @board[i + 3] == @board[i + 6]

      if row_check || column_check
        return @board[i] unless @board[i].empty?
      end
      i += 3
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
