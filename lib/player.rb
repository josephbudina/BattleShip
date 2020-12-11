class Player
  attr_reader :ship_array

  def initialize(board, ship_array)
    @board      = board
    @ship_array = ship_array
  end

  #checks if placement is valid, would need to call a message if invalid
  def player_place_ship(ship, coordinates)
    if @board.valid_placement?
      @board.place(ship, coordinates)
    else
      #return some message
    end
  end
end
