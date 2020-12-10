class Player
  attr_reader :ship_array

  def initialize(board, ship_array)
    @board      = board
    @ship_array = ship_array
  end
end
