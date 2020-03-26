class TicTacToe
  attr_accessor :player_x, :player_o
  attr_reader :board

  def initialize(player1, player2)
    @player_x = player1
    @player_o = player2
    @board = ['', '', '', '', '', '', '', '', '']
  end

  def add_marker(player, index)
    raise ArgumentError, 'Error: this square is already filled cannot override it, try again please' unless @board[index - 1].empty?

    @board[index - 1] = player == @player_x ? "X" : "O"
  end

  def winner
    if @board[0] == @board[1] && @board[1] == @board[2]
      return @board[0] if !@board[0].empty?
    end

    if @board[3] == @board[4] && @board[4] == @board[5]
      return @board[3] if !@board[3].empty?
    end

    if @board[6] == @board[7] && @board[7] == @board[8]
      return @board[6] if !@board[6].empty?
    end

    if @board[0] == @board[3] && @board[3] == @board[6]
      return @board[0] if !@board[0].empty?
    end

    if @board[1] == @board[4] && @board[4] == @board[7]
      return @board[1] if !@board[1].empty?
    end

    if @board[2] == @board[5] && @board[5] == @board[8]
      return @board[2] if !@board[2].empty?
    end

    if @board[0] == @board[4] && @board[4] == @board[8]
      return @board[0] if !@board[0].empty?
    end

    if @board[2] == @board[4] && @board[4] == @board[6]
      return @board[2] if !@board[2].empty?
    end

    false
  end
end
