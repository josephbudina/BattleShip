class User
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def place_ships(ship, coordinates)
    if @board.valid_placement?(ship, coordinates)
      @board.place(ship, coordinates)
    else
      "Not Valid Ship Placement"
    end
  end
end