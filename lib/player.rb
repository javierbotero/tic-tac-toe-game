class Player
  attr_accessor :name, :symbol, :score

  def initialize(name, symbol)
    raise ArgumentError, "you can't have an Integer as name" if name.to_i != 0 && name == "0"

    raise ArgumentError, "A name should at least contain 4 letters" if name.length <= 3

    raise ArgumentError, "A name should at least contain 4 letters" if name.length <= 3

    @name = name
    @symbol = symbol
    @score = 0
  end

  def inc_score
    @score += 1
  end
end