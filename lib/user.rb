require './lib/player'

class User
  include Player
  attr_accessor :board

  attr_reader   :cruiser,
                :submarine,
                :ships

  def initialize(board)
    @board = board
    @cruiser = Ship.new("Cruiser", 3)
    @submarine  = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
  end

  def place_ships(ship, coordinates)
    if @board.valid_placement?(ship, coordinates)
      @board.place(ship, coordinates)
    else
      false
    end
  end

  def apply_enemy_shot(coordinate)
    if @board.valid_coordinate?(coordinate)
      @board.cells[coordinate].fire_upon
    end
  end
end
