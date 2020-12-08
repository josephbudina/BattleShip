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
    if @ship == nil
      @fired_upon = true
    else
      @ship.hit
      @fired_upon = true
    end
  end

  def render(reveal = false)
    if reveal == true && empty? == false
      "S"
    elsif @fired_upon == false
      "."
    elsif fired_upon? && empty?
      "M"
    elsif @fired_upon == true && @ship.sunk? == false
      "H"
    else
      "X"
    end
  end
end
