class Computer
  attr_reader :available_coordinates

  attr_accessor :board

  def initialize(board)
    @board = board
    @available_coordinates = @board.cells.keys
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

  def apply_user_shot(coordinate)
    if @board.valid_coordinate?(coordinate)
      @board.cells[coordinate].fire_upon
    end
  end

  def take_random_shot
    @available_coordinates.shuffle!.delete_at(0)
  end
end
