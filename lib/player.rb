module Player
  def ships_health
    @ships.sum do |ship|
      ship.health
    end
  end

  def apply_shot(coordinate)
    if @board.valid_coordinate?(coordinate)
      @board.cells[coordinate].fire_upon
    end
  end
end
