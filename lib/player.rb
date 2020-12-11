class Player
  attr_reader :board,
              :ship_array

  def initialize(board, ship_array)
    @board      = board
    @ship_array = ship_array
  end

  def place_ships(ship, coordinates)
    if @board.valid_placement?(ship, coordinates)
      @board.place(ship, coordinates)
    else
      "Cannot Place Ship"
    end
  end
end
