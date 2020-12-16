class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    if empty?
      @fired_upon = true
    else
      @ship.hit
      @fired_upon = true
    end
  end

  def render(ship_reveal = false)
    if ship_reveal == true && empty? == false && fired_upon? == false
      "S"
    elsif fired_upon? == false
      "."
    elsif fired_upon? && empty?
      "M"
    elsif fired_upon? && @ship.sunk? == false
      "H"
    else
      "X"
    end
  end
end
