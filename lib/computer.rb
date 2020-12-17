require './lib/player'

class Computer
  include Player
  attr_accessor :board

  attr_reader   :cruiser,
                :submarine,
                :ships,
                :available_coordinates

  def initialize(board)
    @board = board
    @cruiser = Ship.new("Cruiser", 3)
    @submarine  = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
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
