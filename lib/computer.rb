class Computer
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def random_coordinates(ship, length)
    coordinates = []
    until @board.valid_placement?(ship, coordinates)
      new_coordinates = @board.cells.keys.sample(length)
      coordinates = new_coordinates
    end
    coordinates
  end

  def place_ship(ship)
    coordinates = random_coordinates(ship, ship.length)
    @board.place(ship, coordinates)
  end
end
