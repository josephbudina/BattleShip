class User
  attr_accessor :board

  def initialize(board)
    @board = board
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
